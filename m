Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B17FEFB50
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 13:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39EE10EB5F;
	Fri, 27 Feb 2026 13:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZRahhQ0+";
	dkim-atps=neutral
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336AC10E76F
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 13:01:21 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-948029fb1f2so1838295241.0
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 05:01:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772024480; cv=none;
 d=google.com; s=arc-20240605;
 b=VNyIL6IEKBD6C51wJXk9buJNsOlS2aua6qrmayocbmYoibMXtsSMu+BR7I+Ephan+v
 3ZFwx1c1O5KBp5whGY1cOOy+hWd/QaFSx2wzjpdPzWQGAlEhjrUw2OhxN51W4K86ekoA
 5RxZ56q8AcxkwiL3GBte1qlnRjKBG5HGNkPKAmTmYZfKS2P9Lnj8xPu17D6zMVA/DhVJ
 asN9mDsf00ziBis7yANdbQfxtccOmaZloEicUi5F7el8CsSLrOyTrgYdNp1i/b0CIbMU
 lIBit1Tseyqy9FkTJyDU9q9qOdOQdMbneCmuii+WlaDRb21ZIEWB5IMFSO41F2dj/tex
 6Sdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Gdcuy9iaPpeMvNyOTp4uTsufvW1t3dj/0T0Nt9nk9jk=;
 fh=RptNElEckXbqsjpN+aSTUvGolWY1zMG9J8ATl1CmWJk=;
 b=FslXpOju5ojBesHTNcL3jSTwvaGSX+PLv2u+my3rc7WkLRL/JnNVxkeQNkV2zQ2w35
 vE4Ay8XMhMsfbjL8U0zq2jqmWeVL6pfVp1jQPbVfzGAd1pmB+XUZzjEvNG4BGj6wNyTl
 hXPlGpdvTMi0XQShgTz2vaqtPV0rWg4XIfF4zhCv+PtoT+L5XAl7D0nGaljiK7uh461D
 6f4nL6XpZvwlpPO2TqGcAVkb3SL7hZkmOW6vVvt5op/igALdWHjvnatEji3tHH2s0ZpJ
 YizaPNMmJXP34JcH/dQiJd0W4RomzSgUm8l2TblRrwiv9sby/IZfahTHAdhZK7lqykRp
 jVZA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772024480; x=1772629280; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gdcuy9iaPpeMvNyOTp4uTsufvW1t3dj/0T0Nt9nk9jk=;
 b=ZRahhQ0+ACEgMCM+crn02npT1O+ESZYwQTlGuex3CaUjMQwoHpnUw76iKcfmHuHmwr
 eRA+9eZHIY6ry9v+vTT7GjqiJJEvznOunKw7Mzak6Omux69OAtRm+ZM9v1HBI5WIxPF/
 7DyJb/t2KHl1NHmHGozm1RDYhINkUQmaHWGQn2WQhtZGg7kUfwS/R1bLx8dRGkc8Cihi
 5OTpWxYBKRh2VeSo9xg01dUapYr8i1H+bRfmkDyFyCIiqI/zJe6dcWtqOysF150zfQXJ
 dRY/g/5hU5PxaGsSCOiR1nwdB2697jEzWzXcpPMYlpRSE9a5EqZY3kfhjkBgFsxdU+P2
 bnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772024480; x=1772629280;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Gdcuy9iaPpeMvNyOTp4uTsufvW1t3dj/0T0Nt9nk9jk=;
 b=C/RNfixmJlw137qWb8jkQTB7C95R2y6F5O1iX8h52l3M2WFvbSDDQqCkOR5HPx07wL
 xPvZ0pGQcGKJKNMxZKpaGnkeOLHz10bF3aByPTyNTRrNCPZPtH/HiR1W/e6xHy92ckV+
 osIuSq80FbCWCvmtFScNDfhA8TlYpvdu6nWwsS/s2nsm2QnGnI4g7p4vyZ9a1pRie/gm
 NpQn/leR3ojNTn0AE5iPbVedFhdTfEB6ng51/p6S+pyh+g0/T2z7VkUZiI1AkSwHJXwD
 5AVmrjScAdpxk1Vh/9L+OxCh3n8zVzXz7mwNV+/L6OghOkm+DGzllva4bD5MaoUTejiY
 m/NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGBMrY2HODqnY0lQXhXVUSSGDNQhVG+bf9uW49DKEc+wpMvNeYFJazBeHpDdn8Izs5Ic7ie6XyTg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGFunIOOYz7+PAcn2frkZLJkCHhsuq7//UTu5O85C1P6F+Hc7f
 hewA2fW70dX9KapUDvN5rtxjzsA5Kh4oMyY8j30/PDBBbCIIqr4XpXut0JGvxv1mj8HI7KMhkR9
 jpVELweye3bQHl/2MgTXmtjlUoQuJQO4=
X-Gm-Gg: ATEYQzy0n3P8bVevlXC7wm5xpw3hRWtFCpuTcw96YUp5rPtuqUsHkhZHLJi//nuO+IK
 +kxxpIYWVKkUiJnP+7FwzicnN0/pHZBZLoddiDJ+JwczD5N1zJn5ZRwJJkJ1DC9cmQrRUiVTd62
 QO17q2HfVlqBvpNkd44Rupi2z02eZPzntYFJ5D8C2hhubcZg5W2QdXW+3VjciTLfI/vQG93mLRs
 2Mp+LGtU/UgIz6d5HvlR6i5ywCLL6R2CP9+g0sbogYJAHfahMq2KtUD9xaB/NPzxPUJQ6sCvBeV
 zK4LYVgB9vjw5uFsjiyhfgxSFOOzJeKCpKpZ32FhxdnYxX6hE1jSdr7+cGTadOOzo/esOYpqJBQ
 de3YYbvv5Cw==
X-Received: by 2002:a05:6102:c48:b0:5fe:13bc:f13a with SMTP id
 ada2fe7eead31-5feb30f2f8bmr6491053137.36.1772024478156; Wed, 25 Feb 2026
 05:01:18 -0800 (PST)
MIME-Version: 1.0
References: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
 <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
 <068a5363-de97-4d67-94a9-c9a2baed68b0@leemhuis.info>
In-Reply-To: <068a5363-de97-4d67-94a9-c9a2baed68b0@leemhuis.info>
From: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
Date: Wed, 25 Feb 2026 13:00:55 +0000
X-Gm-Features: AaiRm53w9VqfdeuFM3tO4rVuI77Og9DiXXronH78foC19VF0BgkGYZqa119Jqws
Message-ID: <CAD0gVBvB6grt+Px_KV15eFFp8akuttEk6XY_r6L1yyuP75K+7A@mail.gmail.com>
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
X-Mailman-Approved-At: Fri, 27 Feb 2026 13:40:28 +0000
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

So I built vanilla 7.0-rc1. I also added these kernel params:
    nvidia-drm.modeset=3D0
    modprobe.blacklist=3Dnvidia,nvidia_drm,nvidia_modeset,nvidia_uvm
    rd.driver.blacklist=3Dnvidia,nvidia_drm,nvidia_modeset,nvidia_uvm

then I booted into it. this is what my nvidia loadout looks like on my
usual 6.18.9:
    + uname -r
    6.18.9-arch1-2
    + lsmod
    + grep -E nvidia|nouveau
    nvidia_drm            147456  3
    nvidia_modeset       2121728  3 nvidia_drm
    nvidia_uvm           2568192  0
    nvidia              16306176  34 nvidia_uvm,nvidia_modeset
    drm_ttm_helper         16384  2 nvidia_drm,xe
    video                  81920  4 thinkpad_acpi,xe,i915,nvidia_modeset
    + lspci -nnk
    + grep -iA2 VGA\|3D\|Display
    00:02.0 VGA compatible controller [0300]: Intel Corporation
TigerLake-H GT1 [UHD Graphics] [8086:9a60] (rev 01)
        Subsystem: Lenovo Device [17aa:22d8]
        Kernel driver in use: i915
    --
    01:00.0 VGA compatible controller [0300]: NVIDIA Corporation
TU117GLM [T1200 Laptop GPU] [10de:1fbc] (rev a1)
        Subsystem: Lenovo Device [17aa:22d8]
        Kernel driver in use: nvidia

and this is what it looked like in vanilla 7.0-rc1 with blacklisted nvidia:
    + uname -r
    7.0.0-rc1-dirty
    + lsmod
    + grep -E nvidia|nouveau
    + lspci -nnk
    + grep -iA2 VGA\|3D\|Display
    00:02.0 VGA compatible controller [0300]: Intel Corporation
TigerLake-H GT1 [UHD Graphics] [8086:9a60] (rev 01)
        Subsystem: Lenovo Device [17aa:22d8]
        Kernel driver in use: i915
    --
    01:00.0 VGA compatible controller [0300]: NVIDIA Corporation
TU117GLM [T1200 Laptop GPU] [10de:1fbc] (rev a1)
        Subsystem: Lenovo Device [17aa:22d8]
        Kernel modules: nouveau

when I did a VT switch, it froze. my 90s failsafe triggered and rebooted me=
.
then I rebuilt 7.0-rc1 with my patch, rebooted with the same efi
loader, and was able to perform VT switching without any issues.

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
