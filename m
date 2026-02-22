Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FD5EA4FC2
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 13:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E5610E3D1;
	Mon, 23 Feb 2026 13:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dqrpuXO2";
	dkim-atps=neutral
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3A410E119
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Feb 2026 21:56:15 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-5674d8be45eso1461043e0c.1
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Feb 2026 13:56:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771797374; cv=none;
 d=google.com; s=arc-20240605;
 b=Rk97sCBl7iuRmKF/sG8Pd0j9VbF+M3j4lY2UPyTYTHFleOqKDXRLWD1SfDpTEnLQEl
 NqMScw3pTzfWtqsogMtN/ElD4xL2Uz6tQRdDMBFkmNMTXAttzVGCl0VdGeX7Tv3mohi5
 1b22g4TDOgFmL9RSOJFmkPKu7q/ZXPn4ouny2hXrHYxs2YJ7zJ3bdcQjksAnTYTjfQBg
 fuH4NG3U+AMT+8mGsLJxrlfIGOnwq2ZaPuda7n/qgtAXVlIf1ZsK7+0BrHcisVk2Pu9d
 RYSz5Jk9yn1GT0Tso6CGGV+4JG0L3ScSsE3cl5AdP+JJPERrrned/u0tQMVLEFgNJpw6
 ZrLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:dkim-signature;
 bh=fvZFs6ZWQcArHoivTdoRPMVBttlGZZKU4uro3YAyvz8=;
 fh=TaBWBeC0/hP4sUjv6lhnDOdQWRNC+voSErmqNVTnuzA=;
 b=FcknuaM1ZAZ/QZII6LAIjCJLhFs7am3S86Bg1v9QsHFgMnD+vHI661BZ0Qx21U6Smc
 rUzt5MhUI7ibmYhUYR3Ji/rz2Hf1zCmnzuSWrcVXo2oMWuceSn+jBCxmaV7IW47lcpE7
 GQOwScVjlggrpSk10cL02uOaZruzl9C3nf6PKbd4ATOSmY3wwrVMwCd1JUr9D6RFud2T
 /+m4SMzjZMHqK10XzOxRC8t1q0HD9JPPvJQFG+OcPgoiO8b56EDwn5TKUIW5B8G79iGK
 al3JpyQAOZp8oxdZfo36HcdKo9dBv2C459EawKv1JrRPU73Go7BiF4R2Vo49DBfTuENU
 lqlQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771797374; x=1772402174; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fvZFs6ZWQcArHoivTdoRPMVBttlGZZKU4uro3YAyvz8=;
 b=dqrpuXO2bzP066N7t5u+ofclK/cIW9s+evU6PH8UmFeJi43jC21Ghm5YNacNinTHT2
 lOkCAbeRtgyeATfIZSTjtAb0Zqf9C+tG9YojFsrx2w/uZ+LTNPSoNwp2rJa0AzqTLXD2
 6Ir5r90pQqVqrdGZz6asBsGG79f9IIbyzKZzdQ6N1qln4PoPIKIIxPvRT+6mzHLsHPV5
 hy2HumTI5Jmj8i/oKQspUNQU5SFkjqKnPcZW0hfVLoEn74EHNl9uLbRLK8Aw14HV7BDg
 879NyRl+NMkQyTQZ6c2zC4WclRFGGLvJ5oFqEIEFQM81LhKRWGoo8dpJ5YTFxGZgeVYD
 BsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771797374; x=1772402174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fvZFs6ZWQcArHoivTdoRPMVBttlGZZKU4uro3YAyvz8=;
 b=BWU+6j8GRY0+e2E6T2hr1jJ4dWZQp2vTSyNNUmyaNqb/NMuM7ruDKHxp2ezOhRHurP
 9+nBGBPG13/hFXC1DM//qng9Am+EJZ6QHtrZyDKnQww3w2pdghafY1YmxpkAmacJCIkY
 qtSw9iT9v2aSGHKWCxzfRlkkw1N6DsM3a431kL9uaJ9bxt8UvacPhZwkJ+AKYNjbcNK+
 NWB6XJmuRy9xNPkk2+Gcl68tINB/e7M90o/yM4uUMQZpYnlVBFWUpcs7EPeAAh1UAU/z
 LUL1l48zvJgAYH6E8VIk9F/S9uSc39sqHb/+SRGyqI0aWGlep9MWB53YSw5bZXkMqBAf
 iksg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP/yhV6hko4z7MeJP0l4BYDUBHvRIQTIPyMHuUY6QScXEmU5FlOtv9pnpLWFHEjjp/m3SmheEmvA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyP0p22Q0jm2KydFp0jXs4OEvm5YPVGEOtV7MPuPq5hkGQ9rGbQ
 Spcir8CIHs2UGCt5d8JotEAayBe3wpMH++WB3iEfIUe35hed+kU9Yikf0tDKwf0YuvfjuJNr1pD
 zZ7kNB6kvM3ll1Svx41pUk+autVyO7k8=
X-Gm-Gg: AZuq6aIlewq5JCChSxbSACkvvucDtZ67Cn6nfeIXkm8MBfMmeAAiGUr3kj9LM/YJouk
 NJWmN0WvX2IgyFgY0yLqUrvB1sm5rFvvfS/0XbUCwZ9h2nAd2UlLd29YVLIq//d8Ih9wfzotCd7
 Jph3cD1+6w0mqLNJCD2TlU3ClQEvk6/dG2kAmevs4QV0hlfdIQAH+vdb3yXQqLSLcVGgj5JOgE2
 xL5SKnVqRbSwksOEQghEmzQOcNxzb1mTqGsjQiX/1G8KEPyqtThmfZb4dJDYwIJ199e1KTdJRqx
 cCiTtfTrOzIJMXj/BkvgvpX6RS72+FYlhMUUZWMQeXLHEmYxs8AG0B5uoq3E9vdZuBu/RsNaNH5
 vE5WtzaeB0w==
X-Received: by 2002:a05:6122:469b:b0:55b:1a1b:3273 with SMTP id
 71dfb90a1353d-568e47abec3mr2195110e0c.6.1771797374061; Sun, 22 Feb 2026
 13:56:14 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
Date: Sun, 22 Feb 2026 21:55:54 +0000
X-Gm-Features: AaiRm50d7jLgPyD4kdVKiyrm9CHXFWwo9PDyCMT5qvyZh7PMRFS6zqm3NMkVBvk
Message-ID: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
Subject: [REGRESSION] Display freeze on VT switch back to X11 since v6.16
To: stable@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 Feb 2026 13:54:35 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

# OVERVIEW

Since kernel v6.16.1, switching from an X11 session to a text VT and back
freezes the display on a ThinkPad P15 Gen 2. The system remains responsive
over SSH; only the display is frozen. Bisecting identified commit
d1b618e7954802fe ("media: uvcvideo: Do not turn on the camera for some
ioctls") as the trigger. Reverting the logic change in that commit
fixes VT switching
on v6.16.1, v6.17.9, and v6.18.9, but that is not an actual solution. Wayla=
nd
compositors (e.g., river and sway) are not affected.

Last good:  v6.15.9
First bad:  v6.16.1
Bisect result: d1b618e7954802fe media: uvcvideo: Do not turn on the
camera for some ioctls

## Hardware:   Lenovo ThinkPad P15 Gen 2i (20YQ0031US)
CPU:        Intel Core i7-11800H (Tiger Lake-H)
iGPU:        Intel UHD Graphics (TGL GT1)
dGPU:       NVIDIA T1200 (not involved in eDP output; driver: nvidia-open)
Display:    15.6" 1920x1080 eDP, 10 bpc capable (EDID 1.4)
Webcam:     Integrated Camera on PCH xHCI (Bus 003 Port 004)
Firmware:   LENOVO N37ET61W (1.97)
OS:         Arch Linux, Nix home-manager, X11 + xmonad, no display manager

## Symptoms and reproduction steps:
1. Boot, start X11 on tty1 (startx).
2. Switch to tty2 (Ctrl+Alt+F2): works.
3. Switch back to tty1 (Ctrl+Alt+F1): display freezes.
   - Frozen on the last frame shown before switching away.
   - System is fully responsive over SSH.
   - Other VTs switch normally between each other as long as X11 is
not active on them.
   - Killing X does not recover the display. A reboot is required.

# DEBUG ANALYSIS

On v6.16.1, the VT switch back to X triggers a full modeset due to pipe
configuration mismatches detected by intel_pipe_config_compare:

[drm:intel_pipe_config_compare] fastset requirement not met in pipe_bpp
  (expected 30, found 24)
[drm:intel_pipe_config_compare] fastset requirement not met in dp_m_n
  (expected link 269484/524288, found link 336855/524288)
[drm:intel_pipe_config_compare] fastset requirement not met in dpll_hw_stat=
e
  (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)
[drm:intel_pipe_config_compare] fastset requirement not met in port_clock
  (expected 270000, found 216000)
[drm:intel_atomic_check] forcing full modeset

On v6.15.9, the same VT switch shows no such messages.
no pipe_config_compare runs, no modeset, no freeze.

# BISECT AND VERIFICATION

The bisect converged on d1b618e7954802fe in the uvcvideo driver. This
commit adds a switch statement to uvc_v4l2_unlocked_ioctl that allows
certain V4L2 IOCTLS to call video_ioctl2 directly without first calling
uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls called uvc_pm_get
before video_ioctl2.

## VT switching verification across kernel versions:

  v6.12.74 arch pkg:   WORKS
  v6.15.9 arch pkg:    WORKS
  v6.15.9 from source: WORKS
  v6.16.1 with d1b618e reverted:     WORKS
  v6.17.9 with PM wrapping restored: WORKS
  v6.18.9 with PM wrapping restored: WORKS

  v6.16.1 from source:  FREEZES
  v6.16.1 arch pkg:     FREEZES
  v6.17.9 arch pkg:     FREEZES
  v6.18.9 from source:  FREEZES
  v6.18.9 arch pkg:     FREEZES

## Things that do not eliminate the freeze

  - module_blacklist=3Duvcvideo on boot
  - CONFIG_USB_VIDEO_CLASS=3Dn (compiled out)
  - i915.enable_psr=3D0
  - Bypassing intel_vrr_transcoder_enable/disable (no-op)
  - xrandr --output eDP-1 --set "max bpc" 10
  - Xorg config FBDepth 30 (No effect on pipe_bpp)

## Workaround patch

Reverting the optimization from d1b618e to restore the unconditional
uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v=
4l2.c
index 9e4a251eca88..15057b47ec4f 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1199,33 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct file *fi=
le,
  unsigned int converted_cmd =3D v4l2_translate_cmd(cmd);
  int ret;

- /* The following IOCTLs need to turn on the camera. */
- switch (converted_cmd) {
- case UVCIOC_CTRL_MAP:
- case UVCIOC_CTRL_QUERY:
- case VIDIOC_G_CTRL:
- case VIDIOC_G_EXT_CTRLS:
- case VIDIOC_G_INPUT:
- case VIDIOC_QUERYCTRL:
- case VIDIOC_QUERYMENU:
- case VIDIOC_QUERY_EXT_CTRL:
- case VIDIOC_S_CTRL:
- case VIDIOC_S_EXT_CTRLS:
- case VIDIOC_S_FMT:
- case VIDIOC_S_INPUT:
- case VIDIOC_S_PARM:
- case VIDIOC_TRY_EXT_CTRLS:
- case VIDIOC_TRY_FMT:
- ret =3D uvc_pm_get(handle->stream->dev);
- if (ret)
- return ret;
- ret =3D video_ioctl2(file, cmd, arg);
- uvc_pm_put(handle->stream->dev);
+ ret =3D uvc_pm_get(handle->stream->dev);
+ if (ret)
  return ret;
- }
-
- /* The other IOCTLs can run with the camera off. */
- return video_ioctl2(file, cmd, arg);
+ ret =3D video_ioctl2(file, cmd, arg);
+ uvc_pm_put(handle->stream->dev);
+ return ret;
 }

 const struct v4l2_ioctl_ops uvc_ioctl_ops =3D {

Andr=C3=A9s
