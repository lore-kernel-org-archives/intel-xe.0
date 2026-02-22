Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77268EA4FC3
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 13:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CE510E3CE;
	Mon, 23 Feb 2026 13:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ggrorTE3";
	dkim-atps=neutral
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70DE10E157
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Feb 2026 21:53:23 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-94abd52b274so964343241.3
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Feb 2026 13:53:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771797202; cv=none;
 d=google.com; s=arc-20240605;
 b=agkJiJthcFZPW/d2VU5Z44ZNgxmxolX9DF+hBjaiuT6etZBizuD4/ZefCz0WUuaI5V
 NiK4ItX3Lc6w7SS36mx4ZPTWNf8oyAkE4uMOtToKgScIzKvss2m7DI7uYPeY1T4XC7du
 Gh7LNjPxuGMjrNlqnshiWbuNZYs58P2qhIDRt/+hGgDuetYCLvYM1UVUG869nsCq4dz5
 IlTQ7rY63ZpVyLFz7rCHqhU255/uiNKpyY46tXnOIsTHhgKfWk58sAMSsn0jgzqISnVV
 eEMIMlDfCFFb1vrsBT5kRzL2rpxwSec7O5icFnWHgqwXXBb+kIihY0K2neM5m0qSDV6f
 FVMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=MNeGMhAb3TmH7KVHq/DigEL+n2cB/alR7oOTtMkE/zY=;
 fh=du06h6GIzF5IgEaMaOY2qoW9siQp7Q04NiXT0SS5gE0=;
 b=W7iRN5ILHMwf4EdErZN1aNdxe5BdspkNGkNNK185H1To4BgIRTz+fc9mgNa7fEy1Yr
 viIpXr6+/YzjA9aLBUaFttSKQJRvg2ZyxvDpJ9YOl22emVXSrxvgodBvbht0wlA47xQp
 w2QQe7+IHSHyNNf9GeEJckksc6EdXFCOlYJPNCWZ2SXrCH0zXa9cLvUNhZmMlqBj+dPJ
 LuP0M93HE27ieFz9T73d6lU1BfKGv0wgvxh3xzri3g9/W0rVKKcA/hc1FivW/uK8qhTi
 BXFCfUQDVhWpAjCI2YxSaIvtQICAJes6RsDrePSaTvDmc3lNfnT74itVAfpMhazvNzVT
 yf/g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771797202; x=1772402002; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MNeGMhAb3TmH7KVHq/DigEL+n2cB/alR7oOTtMkE/zY=;
 b=ggrorTE3FKrRrREnyYykRAxJSIo8zHwzpnrNb7GMKdXLtsA0KYHDtcyYAPN0Vt/quB
 3v78DTzfRyU+u9locrMXRZ2iQ1ZqOWgp5f9ksXbKjvcw7VqSkL8akuyk1l0g1Xy3e8lz
 eqIQ4fzy3yR27vRUbxd8z1yf7AcX3rfpBB3+Ij1Go3EttRFpNjgCVzAADKqTFF1xR45l
 kvUxLTM6zYgUWW8GkmjS2JvKqZ4lckyUEfDzLMt+Fs1VB7GoM7+oBQKbB7Jg/z4jgkkN
 wMrkVD+IgThwIvdpqD6LQ/k9zU2qW5euj2xH2tK2GNWs2GFu+qE4BaMF9wMe1L4/Ma4H
 8IJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771797202; x=1772402002;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MNeGMhAb3TmH7KVHq/DigEL+n2cB/alR7oOTtMkE/zY=;
 b=NyqXojUimw07upVjSDmdSBfEoXifOFNGOlEB9yaD6UDQFr541RjSAaxX0ux5wbddII
 msp3ya36nyyl3RCFQXq+X+qdVuUw4OkxLMagXNg6YqVGv9sYsnlMOBS+cE3pjL8CsoaW
 kWX7XzbVJxXQ+w5Nb1BSepQxQjB618d2GJ/mjEzv5SBn0cUAADxWWCPFJEMGAgIds0Ti
 jMNNAOCSZ/Zh7OE2hZPkkQg6e4cYaU6p2WhNPY107Cb6786gBKHZUVOcmNjuds/Hqwfh
 5yF/6cioyPApRYswDC8RKqr0PaDv76C3o3oMz+/th5HiDTtLUP4zP+wDN2bAO4OLAQ+x
 gIbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpMsqAn/nOechjrJZ6A8JIwSQ4YmrVIeZqj4EzWNpeFGAWxubO3wNFS8b1E10t9rJMjnyIhdse6A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5E7yWiFNDhbJx/15h/i1MUqYpkg4KSKCMb1eF1U23DlPSsbzK
 1GWKOXLkxNl6CTZrp5hKHG6Bn9a8UmMQCri+mzKK5Ps6mdxVefgJiwrPyamgmYzKKNpBvk8waMS
 2i/46hFzfzud5DfXD6PfYp1JItxdNl7k=
X-Gm-Gg: AZuq6aI9/EHumuYzuP1Pi6NER0fjthtAIOYN4tHkXvN8O8EjBC4DT1vMuEnkzS9gigs
 WksIEA9Gz8i/Eker8RLC1g2patOSh6iJ71TXxh1efmgiJ1f5y2llgejfX4mpKqFUGODtM9uOxiH
 SIuYKVbHzyWOh6OO1q3ZE9hA2CmVHGwGs7xXo/V+QRWMrfeJDuaDFtND4x8dSUeEvp/sQqazwmo
 HT8TrgFhweBaqi85d8PPEFEZjqQGrRGTIcqXBNEZGwdipXj9k5KN0XtkPC25Chexmi981VIfc1c
 BczGzULHzJ3A/tsxZ2IKYgPKLInVUfWhtoBbPlk0LsT3fv+DbKbQqJcdhfZvHxmLIm+sJu25Fep
 uS08Pfu/cGFOGVP6Uo0Np
X-Received: by 2002:a05:6102:c4e:b0:5ef:b3b7:6e3f with SMTP id
 ada2fe7eead31-5feb2e88fe4mr2402295137.3.1771797202335; Sun, 22 Feb 2026
 13:53:22 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
Date: Sun, 22 Feb 2026 21:53:02 +0000
X-Gm-Features: AaiRm50IWhxla8T7yEDMx81GClupXU0m2trQyK_dBcW8HtLqcMb9UhSaFMoA9w8
Message-ID: <CAD0gVBtsG5Gfpq6hNDnCXMPzKw_o4nXLsY_GqftckfHaVPmC7A@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000dbfd0b064b70ae9f"
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

--000000000000dbfd0b064b70ae9f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

# OVERVIEW

Since kernel v6.16.1, switching from an X11 session to a text VT and back
freezes the display on a ThinkPad P15 Gen 2. The system remains responsive
over SSH; only the display is frozen. Bisecting identified commit
d1b618e7954802fe ("media: uvcvideo: Do not turn on the camera for some
ioctls") as the trigger. Reverting the logic change in that commit fixes VT
switching
on v6.16.1, v6.17.9, and v6.18.9, but that is not an actual solution.
Wayland
compositors (e.g., river and sway) are not affected.

Last good:  v6.15.9
First bad:  v6.16.1
Bisect result: d1b618e7954802fe media: uvcvideo: Do not turn on the camera
for some ioctls

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
   - Other VTs switch normally between each other as long as X11 is not
active on them.
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

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c
b/drivers/media/usb/uvc/uvc_v4l2.c
index 9e4a251eca88..15057b47ec4f 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1199,33 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct file
*file,
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

--000000000000dbfd0b064b70ae9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div># OVERVIEW<br><br>Since kernel v6.16.1, switching fro=
m an X11 session to a text VT and back<br>freezes the display on a ThinkPad=
 P15 Gen 2. The system remains responsive<br>over SSH; only the display is =
frozen. Bisecting identified commit<br>d1b618e7954802fe (&quot;media: uvcvi=
deo: Do not turn on the camera for some<br>ioctls&quot;) as the trigger. Re=
verting the logic change in that commit fixes VT switching<br>on v6.16.1, v=
6.17.9, and v6.18.9, but that is not an actual solution. Wayland=C2=A0</div=
><div>compositors (e.g., river and sway) are not affected.<br><br>Last good=
: =C2=A0v6.15.9<br>First bad: =C2=A0v6.16.1<br>Bisect result: d1b618e795480=
2fe media: uvcvideo: Do not turn on the camera for some ioctls<br><br>## Ha=
rdware: =C2=A0 Lenovo ThinkPad P15 Gen 2i (20YQ0031US)<br>CPU: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Intel Core i7-11800H (Tiger Lake-H)<br>iGPU: =C2=A0 =C2=A0=
 =C2=A0 =C2=A0Intel UHD Graphics (TGL GT1)</div><div>dGPU:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0NVIDIA T1200 (not involved in eDP output; driver: nvidia-open)<br=
>Display: =C2=A0 =C2=A015.6&quot; 1920x1080 eDP, 10 bpc capable (EDID 1.4)<=
br>Webcam: =C2=A0 =C2=A0 Integrated Camera on PCH xHCI (Bus 003 Port 004)<b=
r>Firmware: =C2=A0 LENOVO N37ET61W (1.97)<br>OS: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Arch Linux, Nix home-manager, X11 + xmonad, no display manager<br><br>#=
# Symptoms and reproduction steps:<br>1. Boot, start X11 on tty1 (startx).<=
br>2. Switch to tty2 (Ctrl+Alt+F2): works.<br>3. Switch back to tty1 (Ctrl+=
Alt+F1): display freezes.<br>=C2=A0 =C2=A0- Frozen on the last frame shown =
before switching away.<br>=C2=A0 =C2=A0- System is fully responsive over SS=
H.<br>=C2=A0 =C2=A0- Other VTs switch normally between each other as long a=
s X11 is not active on them.<br>=C2=A0 =C2=A0- Killing X does not recover t=
he display. A reboot is required.<br><br># DEBUG ANALYSIS<br><br>On v6.16.1=
, the VT switch back to X triggers a full modeset due to pipe<br>configurat=
ion mismatches detected by intel_pipe_config_compare:<br><br>[drm:intel_pip=
e_config_compare] fastset requirement not met in pipe_bpp<br>=C2=A0 (expect=
ed 30, found 24)<br>[drm:intel_pipe_config_compare] fastset requirement not=
 met in dp_m_n<br>=C2=A0 (expected link 269484/524288, found link 336855/52=
4288)<br>[drm:intel_pipe_config_compare] fastset requirement not met in dpl=
l_hw_state<br>=C2=A0 (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)<br>[d=
rm:intel_pipe_config_compare] fastset requirement not met in port_clock<br>=
=C2=A0 (expected 270000, found 216000)<br>[drm:intel_atomic_check] forcing =
full modeset<br><br>On v6.15.9, the same VT switch shows no such messages.<=
br>no pipe_config_compare runs, no modeset, no freeze.<br><br># BISECT AND =
VERIFICATION<br><br>The bisect converged on d1b618e7954802fe in the uvcvide=
o driver. This<br>commit adds a switch statement to uvc_v4l2_unlocked_ioctl=
 that allows<br>certain V4L2 IOCTLS to call video_ioctl2 directly without f=
irst calling<br>uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls cal=
led uvc_pm_get<br>before video_ioctl2.<br><br>## VT switching verification =
across kernel versions:<br><br>=C2=A0 v6.12.74 arch pkg: =C2=A0 WORKS<br>=
=C2=A0 v6.15.9 arch pkg: =C2=A0 =C2=A0WORKS<br>=C2=A0 v6.15.9 from source: =
WORKS<br>=C2=A0 v6.16.1 with d1b618e reverted: =C2=A0 =C2=A0 WORKS<br>=C2=
=A0 v6.17.9 with PM wrapping restored: WORKS<br>=C2=A0 v6.18.9 with PM wrap=
ping restored: WORKS<br><br>=C2=A0 v6.16.1 from source: =C2=A0FREEZES<br>=
=C2=A0 v6.16.1 arch pkg: =C2=A0 =C2=A0 FREEZES<br>=C2=A0 v6.17.9 arch pkg: =
=C2=A0 =C2=A0 FREEZES<br>=C2=A0 v6.18.9 from source:=C2=A0 FREEZES</div><di=
v>=C2=A0 v6.18.9 arch pkg: =C2=A0 =C2=A0 FREEZES<br><br>## Things that do n=
ot eliminate the freeze<br><br>=C2=A0 - module_blacklist=3Duvcvideo on boot=
<br>=C2=A0 - CONFIG_USB_VIDEO_CLASS=3Dn (compiled out)<br>=C2=A0 - i915.ena=
ble_psr=3D0<br>=C2=A0 - Bypassing intel_vrr_transcoder_enable/disable (no-o=
p)<br>=C2=A0 - xrandr --output eDP-1 --set &quot;max bpc&quot; 10<br>=C2=A0=
 - Xorg config FBDepth 30 (No effect on pipe_bpp)<br><br>## Workaround patc=
h<br><br>Reverting the optimization from d1b618e to restore the uncondition=
al<br>uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.<br>=
<br>diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/u=
vc_v4l2.c<br>index 9e4a251eca88..15057b47ec4f 100644<br>--- a/drivers/media=
/usb/uvc/uvc_v4l2.c<br>+++ b/drivers/media/usb/uvc/uvc_v4l2.c<br>@@ -1199,3=
3 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,<br>=C2=
=A0	unsigned int converted_cmd =3D v4l2_translate_cmd(cmd);<br>=C2=A0	int r=
et;<br>=C2=A0<br>-	/* The following IOCTLs need to turn on the camera. */<b=
r>-	switch (converted_cmd) {<br>-	case UVCIOC_CTRL_MAP:<br>-	case UVCIOC_CT=
RL_QUERY:<br>-	case VIDIOC_G_CTRL:<br>-	case VIDIOC_G_EXT_CTRLS:<br>-	case =
VIDIOC_G_INPUT:<br>-	case VIDIOC_QUERYCTRL:<br>-	case VIDIOC_QUERYMENU:<br>=
-	case VIDIOC_QUERY_EXT_CTRL:<br>-	case VIDIOC_S_CTRL:<br>-	case VIDIOC_S_E=
XT_CTRLS:<br>-	case VIDIOC_S_FMT:<br>-	case VIDIOC_S_INPUT:<br>-	case VIDIO=
C_S_PARM:<br>-	case VIDIOC_TRY_EXT_CTRLS:<br>-	case VIDIOC_TRY_FMT:<br>-		r=
et =3D uvc_pm_get(handle-&gt;stream-&gt;dev);<br>-		if (ret)<br>-			return =
ret;<br>-		ret =3D video_ioctl2(file, cmd, arg);<br>-		uvc_pm_put(handle-&g=
t;stream-&gt;dev);<br>+	ret =3D uvc_pm_get(handle-&gt;stream-&gt;dev);<br>+=
	if (ret)<br>=C2=A0		return ret;<br>-	}<br>-<br>-	/* The other IOCTLs can r=
un with the camera off. */<br>-	return video_ioctl2(file, cmd, arg);<br>+	r=
et =3D video_ioctl2(file, cmd, arg);<br>+	uvc_pm_put(handle-&gt;stream-&gt;=
dev);<br>+	return ret;<br>=C2=A0}<br>=C2=A0<br>=C2=A0const struct v4l2_ioct=
l_ops uvc_ioctl_ops =3D {</div><div><div dir=3D"ltr" class=3D"gmail_signatu=
re" data-smartmail=3D"gmail_signature"><br>Andr=C3=A9s</div></div></div>

--000000000000dbfd0b064b70ae9f--
