Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9848EA4FC4
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 13:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2FC10E3C9;
	Mon, 23 Feb 2026 13:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EtKIjjQ1";
	dkim-atps=neutral
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC80410E35F
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 11:52:26 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-5670ea44187so3337001e0c.0
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 03:52:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771847546; cv=none;
 d=google.com; s=arc-20240605;
 b=NEkVYa/+Qv2/0X3feIMoYO14adWF93gK3GyT9ZWlVb8pOVk+1E5nmWxR33tjPTRFjI
 gzhwUJO97uUuX6syKHkSrrQeEm2qK3x1UGkTS0MFRY4jx/+or5VulCwQxzwjUL71Nodh
 mZdkmhASa8IpCgAsj3IzfKYvUZAJObhtcym6lEBoEE43z6VBDex405n8gTohPfvBHiSJ
 piqq5wsZ11GFtLL1eRLgiVz9qc7GH2Adup32/2SSBw9s9U6eJCHzE2wsk0tPUTa0GCJs
 8Yh2KHGTSzo5yXNlEvI57IUzvDbtQb4KBHG+z3jpgZt4jGR3J5HtDEjnT64xOMOEKqVd
 5aAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=VGP11KQ2dHKSZizL7MNew2Tz13D8uXvvu4p+lY24KEM=;
 fh=ZqEDy0C9zqC+rOI0seJvWAa5aCdQ4fPEHQsqzBebM34=;
 b=dScn0J5F81ePsGl9Y3rplCSzqcjuwTBeJ9oW4OYt6xRxkoiuf4yXZjYy4UznpIbl7B
 FM9ELZDKFidIXJt0U5RU0WTaPm6dATMQjpQeQ5cUn/fk7Z5WAcAzw0ZTw+QP7iJ9Lkq9
 zLTr8e9YxYOAaIU/4jYmAIdbTWYigS+gsK9dzKWgNB3YTSWJ4Bp/zRLvXMA56pWHc8DX
 No6rnQnwgxqWbZS8FRsw583tYOFOre0yJLYY6ssZH7AMGNY7LG48+a3tN1V09P5CLHyN
 ejqrPxCi+hOoH6xLZRCpPnSlwZ32RpD5xYOFvzn+h/YnF+j/JkQ4iMrwxMTTl6Z4+ASM
 X6mg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771847546; x=1772452346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VGP11KQ2dHKSZizL7MNew2Tz13D8uXvvu4p+lY24KEM=;
 b=EtKIjjQ1m+oI+hFFFfqkAidf12L2X5DkoKjFbKQ8IJZGWd78YihoHhfBAcvye7TO0Q
 fPuT6vFgq+iIaprjMF5ogwBakA6ZnJZGGa3FkLQNkU3uGovpcoNYjw1GvIkTnQUvXIZs
 LUsYc1YbW3cKeEAqro4980J9BhawrGBfGdPhU5bGkLeu7W1YacUd/SlE17QR0XrMQtVq
 i/45UmYbL4y78t0lYwnPytDRdSpPJLJjqPhQSoWYeS9ahnL86svdEmvLDGQAcZs48YxQ
 iLPlFgSmi/t8jiaVKpMO4ZULBiGhBdT3kO0f97GGaromqJ+lctE0VAD4RcX21CdCt3Zr
 DPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771847546; x=1772452346;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VGP11KQ2dHKSZizL7MNew2Tz13D8uXvvu4p+lY24KEM=;
 b=g4Ou56EtsbJyRmn5iDm1SmBaZmEI/Uf1kRQm1cx7wZcWOrgYj7QatDpqDYgeAvxgjN
 56JRceqj3RrV/M5MlPRKU2oNcA+nrr+PbPVF3kcbRTcspoCBfqPcTGl+fKyA3IIJ39RE
 cBuCxRPkJqg4J+G2qtaXMHP9+/g0uNjJAi0Cw+fOQm1ZX923v5VyHtYgG7GIKn6KKo6y
 UCn48we8y0chWjKc+uPmr0f78Pu0mNdk/XyuXp+GtlATQru7g90y/Dn0ssybOMWwnmDp
 BtXkPgYm0V1EjLrzuh2LI4pL7qKH5lONd9ZO4/IRna/jHppILClgmqUzHk7YaNbiq/TC
 Da0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW40x5f9CvD7IbvfQ9T6v9Z+InjNW6//GGEEGz4VMJvN4OEARA3oFFtlegvE41fLYmiCuEmW88b+A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznMg98k/M6x7oxUdy3m5DlKLJnyuQisJVRv1UWsK3Hlm2Yz5vk
 y6TWDsSCC2cBECteLKX3DOiXQeLXnBxYbkaWQD08PHRPaUl0RUqBfnVG9/ewenlsYEyo4frHU3J
 C1xKkat+gVSXp2gaFu9YKFDQGAHbhJ/U=
X-Gm-Gg: AZuq6aLeXZYlAYuCbx07v/uKpz6ktd0xAomUTUG8OwN6LKcYcozdJvCmE2x0bIqwwSg
 I0hJMfHmdlPnhbSo+r9Gzy3/qdFt/caXV1n24B2PWEk1Xn4Hl2LWPdiHvREHGc8dH8WH+f5Q7EU
 2uct1qonfeo1Oe+zuUFwlqfKb2JGB+QJ50WJ5m47T84nGgX5r9v7ntb/93WhD7Zp2L2N2xqGrdL
 /z3urJYh5Qi2Z8HdaWafqZaee9b0DXqHT7eRyfujV3dPV6RiXEjPdWHCGwAfAA7iJBAtKgoGsh6
 nEFUeElJ6LzifFXrQx1lnvXlS3ZMQWBkkOKJkm6Sb9EFpVwZfodKBl3DQtFehtqaF0OQ946m2Ve
 tDDlQ/UGnhA==
X-Received: by 2002:a05:6102:4194:b0:5eb:fc32:935c with SMTP id
 ada2fe7eead31-5feb2ea40afmr3964742137.3.1771847545558; Mon, 23 Feb 2026
 03:52:25 -0800 (PST)
MIME-Version: 1.0
References: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
 <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
 <068a5363-de97-4d67-94a9-c9a2baed68b0@leemhuis.info>
In-Reply-To: <068a5363-de97-4d67-94a9-c9a2baed68b0@leemhuis.info>
From: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
Date: Mon, 23 Feb 2026 11:52:04 +0000
X-Gm-Features: AaiRm53kqVqwYlk73dxvSEeN9WnimirsmxYiC5QcBDjE53JtGAA8jfNwC48NL8s
Message-ID: <CAD0gVBs4m9FpBZ9eVcxRK5y601WPkatGE6e9fi1iK0YA=CiMHw@mail.gmail.com>
Subject: Re: [REGRESSION] Display freeze on VT switch back to X11 since v6.16
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 regressions@lists.linux.dev
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

Thorsten,

It's worth a shot. I'll give it a try and report back.

Andr=C3=A9s

On Mon, Feb 23, 2026 at 8:26=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
>
>
> On 2/23/26 09:10, Ricardo Ribalda wrote:
> > Hi Andr=C3=A9s
> >
> > Thanks for doing the bisecting
> >
> > On Sun, 22 Feb 2026 at 22:56, Andr=C3=A9s P=C3=A9rez <andres.f.perez@gm=
ail.com> wrote:
> >>
> >> # OVERVIEW
> >>
> >> Since kernel v6.16.1, switching from an X11 session to a text VT and b=
ack
> >> freezes the display on a ThinkPad P15 Gen 2. The system remains respon=
sive
> >> over SSH; only the display is frozen. Bisecting identified commit
> >> d1b618e7954802fe ("media: uvcvideo: Do not turn on the camera for some
> >> ioctls") as the trigger. Reverting the logic change in that commit
> >> fixes VT switching
> >> on v6.16.1, v6.17.9, and v6.18.9, but that is not an actual solution. =
Wayland
> >> compositors (e.g., river and sway) are not affected.
> >>
> >> Last good:  v6.15.9
> >> First bad:  v6.16.1
> >> Bisect result: d1b618e7954802fe media: uvcvideo: Do not turn on the
> >> camera for some ioctls
> >>
> >> ## Hardware:   Lenovo ThinkPad P15 Gen 2i (20YQ0031US)
> >> CPU:        Intel Core i7-11800H (Tiger Lake-H)
> >> iGPU:        Intel UHD Graphics (TGL GT1)
> >> dGPU:       NVIDIA T1200 (not involved in eDP output; driver: nvidia-o=
pen)
>
> Could this be caused by nvidia's own driver, even if it is not supposed
> to be involved? Might be worth ruling out with a proper vanilla kernel,
> ideally really fresh, so 7.0-rc1.
>
> Ciao, Thorsten
>
> >> Display:    15.6" 1920x1080 eDP, 10 bpc capable (EDID 1.4)
> >> Webcam:     Integrated Camera on PCH xHCI (Bus 003 Port 004)
> >> Firmware:   LENOVO N37ET61W (1.97)
> >> OS:         Arch Linux, Nix home-manager, X11 + xmonad, no display man=
ager
> >>
> >> ## Symptoms and reproduction steps:
> >> 1. Boot, start X11 on tty1 (startx).
> >> 2. Switch to tty2 (Ctrl+Alt+F2): works.
> >> 3. Switch back to tty1 (Ctrl+Alt+F1): display freezes.
> >>    - Frozen on the last frame shown before switching away.
> >>    - System is fully responsive over SSH.
> >>    - Other VTs switch normally between each other as long as X11 is
> >> not active on them.
> >>    - Killing X does not recover the display. A reboot is required.
> >>
> >> # DEBUG ANALYSIS
> >>
> >> On v6.16.1, the VT switch back to X triggers a full modeset due to pip=
e
> >> configuration mismatches detected by intel_pipe_config_compare:
> >>
> >> [drm:intel_pipe_config_compare] fastset requirement not met in pipe_bp=
p
> >>   (expected 30, found 24)
> >> [drm:intel_pipe_config_compare] fastset requirement not met in dp_m_n
> >>   (expected link 269484/524288, found link 336855/524288)
> >> [drm:intel_pipe_config_compare] fastset requirement not met in dpll_hw=
_state
> >>   (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)
> >> [drm:intel_pipe_config_compare] fastset requirement not met in port_cl=
ock
> >>   (expected 270000, found 216000)
> >> [drm:intel_atomic_check] forcing full modeset
> >>
> >> On v6.15.9, the same VT switch shows no such messages.
> >> no pipe_config_compare runs, no modeset, no freeze.
> >>
> >> # BISECT AND VERIFICATION
> >>
> >> The bisect converged on d1b618e7954802fe in the uvcvideo driver. This
> >> commit adds a switch statement to uvc_v4l2_unlocked_ioctl that allows
> >> certain V4L2 IOCTLS to call video_ioctl2 directly without first callin=
g
> >> uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls called uvc_pm_=
get
> >> before video_ioctl2.
> >>
> >> ## VT switching verification across kernel versions:
> >>
> >>   v6.12.74 arch pkg:   WORKS
> >>   v6.15.9 arch pkg:    WORKS
> >>   v6.15.9 from source: WORKS
> >>   v6.16.1 with d1b618e reverted:     WORKS
> >>   v6.17.9 with PM wrapping restored: WORKS
> >>   v6.18.9 with PM wrapping restored: WORKS
> >>
> >>   v6.16.1 from source:  FREEZES
> >>   v6.16.1 arch pkg:     FREEZES
> >>   v6.17.9 arch pkg:     FREEZES
> >>   v6.18.9 from source:  FREEZES
> >>   v6.18.9 arch pkg:     FREEZES
> >>
> >> ## Things that do not eliminate the freeze
> >>
> >>   - module_blacklist=3Duvcvideo on boot
> >>   - CONFIG_USB_VIDEO_CLASS=3Dn (compiled out)
> >
> > This is puzzling me a bit... You are saying that if you do not build
> > the uvc driver, the freeze is still happening?
> >
> > Am I understanding this correctly?
> >
> >>   - i915.enable_psr=3D0
> >>   - Bypassing intel_vrr_transcoder_enable/disable (no-op)
> >>   - xrandr --output eDP-1 --set "max bpc" 10
> >>   - Xorg config FBDepth 30 (No effect on pipe_bpp)
> >>
> >> ## Workaround patch
> >>
> >> Reverting the optimization from d1b618e to restore the unconditional
> >> uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.
> >>
> >> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/=
uvc_v4l2.c
> >> index 9e4a251eca88..15057b47ec4f 100644
> >> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> >> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> >> @@ -1199,33 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct fil=
e *file,
> >>   unsigned int converted_cmd =3D v4l2_translate_cmd(cmd);
> >>   int ret;
> >>
> >> - /* The following IOCTLs need to turn on the camera. */
> >> - switch (converted_cmd) {
> >> - case UVCIOC_CTRL_MAP:
> >> - case UVCIOC_CTRL_QUERY:
> >> - case VIDIOC_G_CTRL:
> >> - case VIDIOC_G_EXT_CTRLS:
> >> - case VIDIOC_G_INPUT:
> >> - case VIDIOC_QUERYCTRL:
> >> - case VIDIOC_QUERYMENU:
> >> - case VIDIOC_QUERY_EXT_CTRL:
> >> - case VIDIOC_S_CTRL:
> >> - case VIDIOC_S_EXT_CTRLS:
> >> - case VIDIOC_S_FMT:
> >> - case VIDIOC_S_INPUT:
> >> - case VIDIOC_S_PARM:
> >> - case VIDIOC_TRY_EXT_CTRLS:
> >> - case VIDIOC_TRY_FMT:
> >> - ret =3D uvc_pm_get(handle->stream->dev);
> >> - if (ret)
> >> - return ret;
> >> - ret =3D video_ioctl2(file, cmd, arg);
> >> - uvc_pm_put(handle->stream->dev);
> >> + ret =3D uvc_pm_get(handle->stream->dev);
> >> + if (ret)
> >>   return ret;
> >> - }
> >> -
> >> - /* The other IOCTLs can run with the camera off. */
> >> - return video_ioctl2(file, cmd, arg);
> >> + ret =3D video_ioctl2(file, cmd, arg);
> >> + uvc_pm_put(handle->stream->dev);
> >> + return ret;
> >>  }
> >>
> >>  const struct v4l2_ioctl_ops uvc_ioctl_ops =3D {
> >>
> >> Andr=C3=A9s
> >>
> >
> >
>
