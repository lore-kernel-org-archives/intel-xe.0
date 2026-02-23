Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6D1EA4FC1
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 13:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D5710E3D2;
	Mon, 23 Feb 2026 13:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jnpVqdle";
	dkim-atps=neutral
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D5D10E2E5
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 11:51:36 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-5fd9c2b2858so972231137.1
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 03:51:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771847495; cv=none;
 d=google.com; s=arc-20240605;
 b=Pp6JVLMuj4zCrlmrdqZbpE4ch+plV9JsMX+JDeYsnaoS6vxvry7o7knH18UH4GERPi
 8Bt/zkIIwuW4T7EuKzwpz08frEWhvFXw4/KhLlIrb8Z87A5szx0siVnTNsRpBBuGOMfe
 VRPAPI+tU/f5NMxBBqUGIWEj1tc9OsyLawImsSTIfvvrEXiOYZqWs9g74MrwLOhYQFD0
 4iKZimGffs2Et3DhMfxrs20EU9egIvu8bfr3QlcEWQkYXUpzCI1bNK2y6nMUYULbg0Pb
 ynJFVoo7ccYFLY9UYlK6umROIFlpnEroNAbn9Ky8BaWQZf7B6/3wxcMTOygL6efRjlGU
 izKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=rMp9NyS10Y7o5BbV0/n1cd3o9I8LFMg8n5wPuOM1jvE=;
 fh=+Ahm3XNH3BaMiVPnYihY+n4d3qbS4Ga+l6U72OwwJ3A=;
 b=Cb3HHoLKOFfF8MmumP+yKwWFuoPBJv5cPRM+C0S0Cp+w08pjzOBW7DTFAjT5dMmqKr
 XmLzbB8lYvfTz7+EI63MOUZSpxJ/pnZlFjXVwBYTR0OckVdax70gq9Wz+OZUVlzGIIwc
 C87KpiRH2tgox0sRjeCGXNZelb8jXt+ST2sAbR5IJsoTZlSznCisp9SvR/CMWnsNekCm
 YgglGob60+a4GxRhfQbnyJ4u1hAoysgy2A2UWOLb2kxfj7EN/nAWQbMJzB5JYg+r+fZY
 D5iybrTWU10j8RvgA0BcBp+WsFTl8cNV5xz94Nr8NePynfoPO7UCHSMgxDGSCKbZ1Wql
 vnoQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771847495; x=1772452295; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rMp9NyS10Y7o5BbV0/n1cd3o9I8LFMg8n5wPuOM1jvE=;
 b=jnpVqdleYVxBNdCbEC4hT4mE+O9ZFIb1ZFndg8Gn6IX8R6d0OqUZWYmUMQamXtjiNM
 OcVicQsqQUXeksAJms9WGZU7mJZd6mIRVV+il8/7kcbOVqp4ISr9xxYY5JIyjoKf02uK
 GNPBPGFaRtftJPHYlblkd2PfaFHD5gh1F+CW2/EN/EYGyfTj9x/7Fgb1Vdn3hjzmLZSo
 1+7Cps4jedheKlbbfU1LffYZjT4RqvkCjBoKGyQ9AzoBEqKCPPL2B7V4Sv/qeA7xboZg
 SVPQkIO3uDM0v8uvEK3zmsaLB8OakdiobxWtMWGJ08qGvnkWXkGMiDM0CWoIYULl7pW5
 1TZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771847495; x=1772452295;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rMp9NyS10Y7o5BbV0/n1cd3o9I8LFMg8n5wPuOM1jvE=;
 b=CJ4P9k9daZZcdtAjbD5U86ck/1W2T7JhQuw0gcmV+gJ/MWZ1MUxA6zDPEMUIlmxI7q
 0ryg2bbf1hs/BiGKUMhRvqJc8OemchBUXMXjmivD6VqmZ2ESDDzZ7DWdmQIOrUkzgfNe
 csX/qQb/ZUw9yiVR7PVLhtyj3I+alCzQBiZBSDQhzkYpH/c3mV8IBj9a/9HJ9y8SgBKM
 ZZSMEPZti9KlGMjaGrveHq8KMfnl3MaQGS0Zpe42R8rvknVs3lMBkH3bPvYKwpAUtFtq
 zoHNeRDe/11hgE/HqrO7b8J9JUxY9apLz28tEAQcxs5zecwiIjT4XsapUy3v3eFlrEH5
 0n5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAk8M7dWmyphx6iYFdGt7YiBGjxLVA98wDiBvzDdedI3lAqD99C9MT1HrecMJR0H29IycA0rZLXw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4Ad2m8xT/xJSoK06anWfFP+b6PLdESa+xIhGydW20JYaw41Bx
 UN1rS81An7Gn+XW6xoHCD+q4VcpX12R5loKWw4xplzWF88qjYyHYSoIsDfxUQmPiDXrRhUHjg7H
 fbAsX9RSk9Sak83dU4GO2Of7Zad7DG6k=
X-Gm-Gg: AZuq6aKuAOT9S06IbYpDnC/Pesp1hqUd6zL/1iGzdC6m1VUG3Aaz49kLxJNb4i5ppgi
 jmL1MjXCTmdw/yqBLree0zGO6U5eHOyD6o2uK/XYtlnYJr9SgZLXmqEG7BOxCLhqwbNAys/E3uF
 X30RDPd+JGBnhgzEGtM1i8S4pumPa8psZLzgwGolkkVqmbCaGzcgsGhYxsnd8deZ744ogJRcju4
 6LxBKdCU30ssqaUbSHSE75LJ1JPQBXu3Z3ty51MOTRDK55jmjvbExGIHCsHiZAFYgKd+84w0vGi
 FR4W/6nK6UOUhF11Ar+ZfB81okSqx8FAvzjOOrHaAH41HcScWzhoxdKQDGSK2ZoMYB+Adi92Coc
 HTjeZRCGlSA==
X-Received: by 2002:a05:6102:e0e:b0:5df:8f4:61e6 with SMTP id
 ada2fe7eead31-5feb310b93bmr3236127137.32.1771847494951; Mon, 23 Feb 2026
 03:51:34 -0800 (PST)
MIME-Version: 1.0
References: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
 <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
In-Reply-To: <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
From: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
Date: Mon, 23 Feb 2026 11:51:14 +0000
X-Gm-Features: AaiRm52aszgholXfDNGG6k-0d1fHGX88p3iT8Mn4sxSWllcwfxYwH-T9tRbXK5Q
Message-ID: <CAD0gVBtWhQqnxVt7kvQoQcbazGiLH-rUNrTfnZZpm40-jKvTUA@mail.gmail.com>
Subject: Re: [REGRESSION] Display freeze on VT switch back to X11 since v6.16
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: stable@vger.kernel.org, 
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

Ricardo,

Listen, I'm right there with you, scratching my head. First thing I
did when I bisected to that commit was modprobe -r that module. Easy
sacrifice; I don't use my camera that often. When it still froze, I
assumed that maybe something related to module init was still
lingering, so I disabled it by kernel boot param. When that didn't
work, I just didn't build it in at all. Then I ignored it and tried a
few other things. Eventually I came back to that commit. Instead of
patching any code, I just added a comment to the file, thinking maybe
this is just some build artifact that's causing a false positive. No
dice. So far, the only thing that has allowed VT switching to work is
restoring those PM calls around the video_ioctl2 call. I am not
presenting it as a solution (quite the contrary!), I am presenting it
solely because it's all I've got to go on.

Andr=C3=A9s

On Mon, Feb 23, 2026 at 8:18=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> Hi Andr=C3=A9s
>
> Thanks for doing the bisecting
>
> On Sun, 22 Feb 2026 at 22:56, Andr=C3=A9s P=C3=A9rez <andres.f.perez@gmai=
l.com> wrote:
> >
> > # OVERVIEW
> >
> > Since kernel v6.16.1, switching from an X11 session to a text VT and ba=
ck
> > freezes the display on a ThinkPad P15 Gen 2. The system remains respons=
ive
> > over SSH; only the display is frozen. Bisecting identified commit
> > d1b618e7954802fe ("media: uvcvideo: Do not turn on the camera for some
> > ioctls") as the trigger. Reverting the logic change in that commit
> > fixes VT switching
> > on v6.16.1, v6.17.9, and v6.18.9, but that is not an actual solution. W=
ayland
> > compositors (e.g., river and sway) are not affected.
> >
> > Last good:  v6.15.9
> > First bad:  v6.16.1
> > Bisect result: d1b618e7954802fe media: uvcvideo: Do not turn on the
> > camera for some ioctls
> >
> > ## Hardware:   Lenovo ThinkPad P15 Gen 2i (20YQ0031US)
> > CPU:        Intel Core i7-11800H (Tiger Lake-H)
> > iGPU:        Intel UHD Graphics (TGL GT1)
> > dGPU:       NVIDIA T1200 (not involved in eDP output; driver: nvidia-op=
en)
> > Display:    15.6" 1920x1080 eDP, 10 bpc capable (EDID 1.4)
> > Webcam:     Integrated Camera on PCH xHCI (Bus 003 Port 004)
> > Firmware:   LENOVO N37ET61W (1.97)
> > OS:         Arch Linux, Nix home-manager, X11 + xmonad, no display mana=
ger
> >
> > ## Symptoms and reproduction steps:
> > 1. Boot, start X11 on tty1 (startx).
> > 2. Switch to tty2 (Ctrl+Alt+F2): works.
> > 3. Switch back to tty1 (Ctrl+Alt+F1): display freezes.
> >    - Frozen on the last frame shown before switching away.
> >    - System is fully responsive over SSH.
> >    - Other VTs switch normally between each other as long as X11 is
> > not active on them.
> >    - Killing X does not recover the display. A reboot is required.
> >
> > # DEBUG ANALYSIS
> >
> > On v6.16.1, the VT switch back to X triggers a full modeset due to pipe
> > configuration mismatches detected by intel_pipe_config_compare:
> >
> > [drm:intel_pipe_config_compare] fastset requirement not met in pipe_bpp
> >   (expected 30, found 24)
> > [drm:intel_pipe_config_compare] fastset requirement not met in dp_m_n
> >   (expected link 269484/524288, found link 336855/524288)
> > [drm:intel_pipe_config_compare] fastset requirement not met in dpll_hw_=
state
> >   (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)
> > [drm:intel_pipe_config_compare] fastset requirement not met in port_clo=
ck
> >   (expected 270000, found 216000)
> > [drm:intel_atomic_check] forcing full modeset
> >
> > On v6.15.9, the same VT switch shows no such messages.
> > no pipe_config_compare runs, no modeset, no freeze.
> >
> > # BISECT AND VERIFICATION
> >
> > The bisect converged on d1b618e7954802fe in the uvcvideo driver. This
> > commit adds a switch statement to uvc_v4l2_unlocked_ioctl that allows
> > certain V4L2 IOCTLS to call video_ioctl2 directly without first calling
> > uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls called uvc_pm_g=
et
> > before video_ioctl2.
> >
> > ## VT switching verification across kernel versions:
> >
> >   v6.12.74 arch pkg:   WORKS
> >   v6.15.9 arch pkg:    WORKS
> >   v6.15.9 from source: WORKS
> >   v6.16.1 with d1b618e reverted:     WORKS
> >   v6.17.9 with PM wrapping restored: WORKS
> >   v6.18.9 with PM wrapping restored: WORKS
> >
> >   v6.16.1 from source:  FREEZES
> >   v6.16.1 arch pkg:     FREEZES
> >   v6.17.9 arch pkg:     FREEZES
> >   v6.18.9 from source:  FREEZES
> >   v6.18.9 arch pkg:     FREEZES
> >
> > ## Things that do not eliminate the freeze
> >
> >   - module_blacklist=3Duvcvideo on boot
> >   - CONFIG_USB_VIDEO_CLASS=3Dn (compiled out)
>
> This is puzzling me a bit... You are saying that if you do not build
> the uvc driver, the freeze is still happening?
>
> Am I understanding this correctly?
>
> >   - i915.enable_psr=3D0
> >   - Bypassing intel_vrr_transcoder_enable/disable (no-op)
> >   - xrandr --output eDP-1 --set "max bpc" 10
> >   - Xorg config FBDepth 30 (No effect on pipe_bpp)
> >
> > ## Workaround patch
> >
> > Reverting the optimization from d1b618e to restore the unconditional
> > uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/u=
vc_v4l2.c
> > index 9e4a251eca88..15057b47ec4f 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1199,33 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct file=
 *file,
> >   unsigned int converted_cmd =3D v4l2_translate_cmd(cmd);
> >   int ret;
> >
> > - /* The following IOCTLs need to turn on the camera. */
> > - switch (converted_cmd) {
> > - case UVCIOC_CTRL_MAP:
> > - case UVCIOC_CTRL_QUERY:
> > - case VIDIOC_G_CTRL:
> > - case VIDIOC_G_EXT_CTRLS:
> > - case VIDIOC_G_INPUT:
> > - case VIDIOC_QUERYCTRL:
> > - case VIDIOC_QUERYMENU:
> > - case VIDIOC_QUERY_EXT_CTRL:
> > - case VIDIOC_S_CTRL:
> > - case VIDIOC_S_EXT_CTRLS:
> > - case VIDIOC_S_FMT:
> > - case VIDIOC_S_INPUT:
> > - case VIDIOC_S_PARM:
> > - case VIDIOC_TRY_EXT_CTRLS:
> > - case VIDIOC_TRY_FMT:
> > - ret =3D uvc_pm_get(handle->stream->dev);
> > - if (ret)
> > - return ret;
> > - ret =3D video_ioctl2(file, cmd, arg);
> > - uvc_pm_put(handle->stream->dev);
> > + ret =3D uvc_pm_get(handle->stream->dev);
> > + if (ret)
> >   return ret;
> > - }
> > -
> > - /* The other IOCTLs can run with the camera off. */
> > - return video_ioctl2(file, cmd, arg);
> > + ret =3D video_ioctl2(file, cmd, arg);
> > + uvc_pm_put(handle->stream->dev);
> > + return ret;
> >  }
> >
> >  const struct v4l2_ioctl_ops uvc_ioctl_ops =3D {
> >
> > Andr=C3=A9s
> >
>
>
> --
> Ricardo Ribalda
