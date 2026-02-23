Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2563DE98E03
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 08:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23B110E278;
	Mon, 23 Feb 2026 08:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XHDhFNTZ";
	dkim-atps=neutral
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D42F10E267
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 08:11:06 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-65c0891f4e9so7020553a12.1
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 00:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1771834264; x=1772439064;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fPcLFGqvXQ/TrcZMbc9zEuLscnPpwUEKK1FNGlp3euE=;
 b=XHDhFNTZ+GLCmPVY9WLg099RU7Gt6W4RTFqClep2EkRzI+yMRKnchRT03qeDViObRr
 5UaDMBOYPZcLhgg5dsb/fIqd+kO5huppb6fnLAa/6eVjxZEzC9gmiLDN5JNEXnXK0baj
 SZt/TyjLYxCat6xwi68ig/5CkiOfSp5xr3k5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771834264; x=1772439064;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fPcLFGqvXQ/TrcZMbc9zEuLscnPpwUEKK1FNGlp3euE=;
 b=ZqiAysql+UbBximuLBwAt5yM40jucp0V7HyaH48WrWYTU0Sf3eC1kZ6Pmzvrz2tDOZ
 LuR3EFjltw4xmxXnqun+73dIbnEa8Im6tAAM7ZLScgX6nRSxbT2UCa+JhnLgh52zXLL9
 WUqqoDm92FWdxIekY+bI9DxbEmk5vNhWp4OWQYpMJmRgqvk4oZ7pnoenW5aaaNDMTdyO
 bLaPPj/BU9VfYn9UUbhuy+2V41ulenTF2TTlpyvljYe+CooTBO4buC54XYuUilhwK+oE
 AnbrrWfbi/Tsm+4vjkbjdTvrsAkXBzB/hNgBtnVQ96b9ivKXrxi0ti9BDRaMXRo99ZuE
 0frg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLlnejDzLgDakldehCnPvCUNOMmD6kPuh647OFc4IMf+sQy0BPeeJu6L7OCZc97S9uWE3paZLYAg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwbHEpjuaWLPIFmkVQB76vnzrveRU7nS/RwBlG+fwiapE/u+XU
 2S01o2rF84rbfFtNNG3uQfJTH7wEgiNBxvdKAUmckEPWbjnSW35c8J7Xg5liumBe64AHTaE0RBt
 L5F6NIQ==
X-Gm-Gg: AZuq6aK0xF4U3nrAPXxXeUgVZjhuHuYKANryP/jMpHQSvG5XWTjtS5OdZEFOir5uBlk
 GZSLnVubiIk10YiMinHm++08eg+4b1HB3yeiH7ta/vgx2W2ded2nWjBc9bT44o979k+tYUqiwGM
 761yEIc68urGyTgezi368N9zmUl6oBnme7Z8bBN/cSbDZLMnFgOh00qm84Ml4DEb0/H9zBeIRBS
 +ZxokaFv2irNzIGbq+JGP6GGdd9ZHtSEGrUFiX7S9jNc0b/piwBTD/qpSdKnipnAzbz01wWylXR
 SbJfoLphvKA3pbGbmpeSg+/LbxNOqOEFk1/SFZ29k50bu1fYu66zN4grRKm1FgthGuwxc1FBOjD
 omIZb9MmYJ3wV9EaAkOBNMBPOcTitBktvK8jfDWQG5ZoJqTmcPsLPthYRfVpYtbSNiF/MT6R8iT
 S5LI6oMv7mVOy+tp/6Nnh6urSX6JAuRtyDWVo5iMmqE5sw9kHMZGQp0DhKyYjPsgNzj1iDyOs=
X-Received: by 2002:a05:6402:34c9:b0:65c:3361:5339 with SMTP id
 4fb4d7f45d1cf-65ea4f0c01cmr4183626a12.18.1771834264128; 
 Mon, 23 Feb 2026 00:11:04 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65eaba13871sm2399658a12.22.2026.02.23.00.11.02
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 00:11:03 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b8845cb580bso617333366b.3
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 00:11:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW/3pPoBYG5bQN2OcfPfsGYrFnrCHxk0Au6eirrnNp9SUTgSHqyZMX+VF59rqy986Li6/UcksWS9Q==@lists.freedesktop.org
X-Received: by 2002:a17:907:94cc:b0:b87:12d2:fa1a with SMTP id
 a640c23a62f3a-b908191f1d6mr445251466b.12.1771834262096; Mon, 23 Feb 2026
 00:11:02 -0800 (PST)
MIME-Version: 1.0
References: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
In-Reply-To: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 23 Feb 2026 09:10:49 +0100
X-Gmail-Original-Message-ID: <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
X-Gm-Features: AaiRm53F0LIMOe6xezXE30KkDM_p2uBY1AB8eOErFcvfTTb2PhOgsWveImx1C0M
Message-ID: <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
Subject: Re: [REGRESSION] Display freeze on VT switch back to X11 since v6.16
To: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
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

Hi Andr=C3=A9s

Thanks for doing the bisecting

On Sun, 22 Feb 2026 at 22:56, Andr=C3=A9s P=C3=A9rez <andres.f.perez@gmail.=
com> wrote:
>
> # OVERVIEW
>
> Since kernel v6.16.1, switching from an X11 session to a text VT and back
> freezes the display on a ThinkPad P15 Gen 2. The system remains responsiv=
e
> over SSH; only the display is frozen. Bisecting identified commit
> d1b618e7954802fe ("media: uvcvideo: Do not turn on the camera for some
> ioctls") as the trigger. Reverting the logic change in that commit
> fixes VT switching
> on v6.16.1, v6.17.9, and v6.18.9, but that is not an actual solution. Way=
land
> compositors (e.g., river and sway) are not affected.
>
> Last good:  v6.15.9
> First bad:  v6.16.1
> Bisect result: d1b618e7954802fe media: uvcvideo: Do not turn on the
> camera for some ioctls
>
> ## Hardware:   Lenovo ThinkPad P15 Gen 2i (20YQ0031US)
> CPU:        Intel Core i7-11800H (Tiger Lake-H)
> iGPU:        Intel UHD Graphics (TGL GT1)
> dGPU:       NVIDIA T1200 (not involved in eDP output; driver: nvidia-open=
)
> Display:    15.6" 1920x1080 eDP, 10 bpc capable (EDID 1.4)
> Webcam:     Integrated Camera on PCH xHCI (Bus 003 Port 004)
> Firmware:   LENOVO N37ET61W (1.97)
> OS:         Arch Linux, Nix home-manager, X11 + xmonad, no display manage=
r
>
> ## Symptoms and reproduction steps:
> 1. Boot, start X11 on tty1 (startx).
> 2. Switch to tty2 (Ctrl+Alt+F2): works.
> 3. Switch back to tty1 (Ctrl+Alt+F1): display freezes.
>    - Frozen on the last frame shown before switching away.
>    - System is fully responsive over SSH.
>    - Other VTs switch normally between each other as long as X11 is
> not active on them.
>    - Killing X does not recover the display. A reboot is required.
>
> # DEBUG ANALYSIS
>
> On v6.16.1, the VT switch back to X triggers a full modeset due to pipe
> configuration mismatches detected by intel_pipe_config_compare:
>
> [drm:intel_pipe_config_compare] fastset requirement not met in pipe_bpp
>   (expected 30, found 24)
> [drm:intel_pipe_config_compare] fastset requirement not met in dp_m_n
>   (expected link 269484/524288, found link 336855/524288)
> [drm:intel_pipe_config_compare] fastset requirement not met in dpll_hw_st=
ate
>   (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)
> [drm:intel_pipe_config_compare] fastset requirement not met in port_clock
>   (expected 270000, found 216000)
> [drm:intel_atomic_check] forcing full modeset
>
> On v6.15.9, the same VT switch shows no such messages.
> no pipe_config_compare runs, no modeset, no freeze.
>
> # BISECT AND VERIFICATION
>
> The bisect converged on d1b618e7954802fe in the uvcvideo driver. This
> commit adds a switch statement to uvc_v4l2_unlocked_ioctl that allows
> certain V4L2 IOCTLS to call video_ioctl2 directly without first calling
> uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls called uvc_pm_get
> before video_ioctl2.
>
> ## VT switching verification across kernel versions:
>
>   v6.12.74 arch pkg:   WORKS
>   v6.15.9 arch pkg:    WORKS
>   v6.15.9 from source: WORKS
>   v6.16.1 with d1b618e reverted:     WORKS
>   v6.17.9 with PM wrapping restored: WORKS
>   v6.18.9 with PM wrapping restored: WORKS
>
>   v6.16.1 from source:  FREEZES
>   v6.16.1 arch pkg:     FREEZES
>   v6.17.9 arch pkg:     FREEZES
>   v6.18.9 from source:  FREEZES
>   v6.18.9 arch pkg:     FREEZES
>
> ## Things that do not eliminate the freeze
>
>   - module_blacklist=3Duvcvideo on boot
>   - CONFIG_USB_VIDEO_CLASS=3Dn (compiled out)

This is puzzling me a bit... You are saying that if you do not build
the uvc driver, the freeze is still happening?

Am I understanding this correctly?

>   - i915.enable_psr=3D0
>   - Bypassing intel_vrr_transcoder_enable/disable (no-op)
>   - xrandr --output eDP-1 --set "max bpc" 10
>   - Xorg config FBDepth 30 (No effect on pipe_bpp)
>
> ## Workaround patch
>
> Reverting the optimization from d1b618e to restore the unconditional
> uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc=
_v4l2.c
> index 9e4a251eca88..15057b47ec4f 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1199,33 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct file *=
file,
>   unsigned int converted_cmd =3D v4l2_translate_cmd(cmd);
>   int ret;
>
> - /* The following IOCTLs need to turn on the camera. */
> - switch (converted_cmd) {
> - case UVCIOC_CTRL_MAP:
> - case UVCIOC_CTRL_QUERY:
> - case VIDIOC_G_CTRL:
> - case VIDIOC_G_EXT_CTRLS:
> - case VIDIOC_G_INPUT:
> - case VIDIOC_QUERYCTRL:
> - case VIDIOC_QUERYMENU:
> - case VIDIOC_QUERY_EXT_CTRL:
> - case VIDIOC_S_CTRL:
> - case VIDIOC_S_EXT_CTRLS:
> - case VIDIOC_S_FMT:
> - case VIDIOC_S_INPUT:
> - case VIDIOC_S_PARM:
> - case VIDIOC_TRY_EXT_CTRLS:
> - case VIDIOC_TRY_FMT:
> - ret =3D uvc_pm_get(handle->stream->dev);
> - if (ret)
> - return ret;
> - ret =3D video_ioctl2(file, cmd, arg);
> - uvc_pm_put(handle->stream->dev);
> + ret =3D uvc_pm_get(handle->stream->dev);
> + if (ret)
>   return ret;
> - }
> -
> - /* The other IOCTLs can run with the camera off. */
> - return video_ioctl2(file, cmd, arg);
> + ret =3D video_ioctl2(file, cmd, arg);
> + uvc_pm_put(handle->stream->dev);
> + return ret;
>  }
>
>  const struct v4l2_ioctl_ops uvc_ioctl_ops =3D {
>
> Andr=C3=A9s
>


--=20
Ricardo Ribalda
