import os
import cv2
import imageio

if __name__ == '__main__':
    step_size = 0.2 # secs
    video_fp = 'IMG_0487_compressed.mov'
    gif_fp_dst = "DragonBubble.gif"
    
    # import the opencv library
    gifimgs = []
    cap = cv2.VideoCapture(video_fp)
    fps = cap.get(cv2.CAP_PROP_FPS)
    step_size_frame = fps * step_size

    while(True):
        # get frame
        ret, frame = cap.read()
        if frame is None:
            break
        frame = cv2.resize(frame[50:-50], (480, 640))
        gifimgs.append(frame[:, :, ::-1])

        # set next frame
        frame_id = cap.get(cv2.CAP_PROP_POS_FRAMES)
        cap.set(cv2.CAP_PROP_POS_FRAMES, frame_id+step_size_frame)
        print(frame_id)

    imageio.mimsave(gif_fp_dst, gifimgs, fps=7)
    cap.release()
    cv2.destroyAllWindows()