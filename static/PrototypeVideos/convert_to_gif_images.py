import os
import cv2
import glob
import imageio

if __name__ == '__main__':
    step_size = 0.2 # secs
    img_fps_src = glob.glob("SpaceTanksPaperPrototype/*.jpg")
    img_fps_src = sorted(img_fps_src, key=lambda x: int(x.replace(".jpg", "").split("_")[1]))
    gif_fp_dst = "Tank.gif"
    
    # import the opencv library
    gifimgs = []

    for img_fp in img_fps_src:
        # get frame
        frame = cv2.imread(img_fp)
        h, w = frame.shape[:2]
        if h > w:
            frame = cv2.rotate(frame, cv2.ROTATE_90_CLOCKWISE)
        frame = cv2.resize(frame, (640, 480))
        gifimgs.append(frame[:, :, ::-1])
        print(os.path.basename(img_fp))


    imageio.mimsave(gif_fp_dst, gifimgs, fps=1.5)
    cv2.destroyAllWindows()
