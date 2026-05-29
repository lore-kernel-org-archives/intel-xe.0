Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EE0CD6E65
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 14:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB41B11341D;
	Mon,  1 Jun 2026 14:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="n36RXo3N";
	dkim-atps=neutral
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D421410FFA3
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 14:06:10 +0000 (UTC)
Received: by mail-oo1-f67.google.com with SMTP id
 006d021491bc7-69d8f70cb0cso4474365eaf.0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 07:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780063570; cv=none;
 d=google.com; s=arc-20240605;
 b=DLULjM5N8o4HKvxjR1GVWBo3vJil1+oOoNEwmdgALi8o/I5LZpNZPyaVPwFZVbxoVR
 RDHhNhXnnVJs1qujsRL9OASXecilwLm00E0C3fcW+fMJ/b8tOn5cZ6xKpR38HmMladmJ
 n2Ncux8XoyRIMi/6m2YASr/DksSi3VbisJZaRilpooutLXmN0AnifDxah0TeS/eKLVOZ
 Mgh/xmFybIddPlNFI0JZXGtJrYbFe/gM+fL+XJ4f/7GPPrUtNST85kaa2dx3KCgTQUuw
 KLX5YHB3AR67q3BfgB7Fg4PMePVOaflG4+kXFWgOGIqHY55NyC+cdLtpKsxnkmkRkGS8
 c/+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=dvHjpUscS3LGAt7KUFAQnACdb0jmXR2p4L+IG6VyYLM=;
 fh=OGLoHJzKWILyClak8j+5XsUFBKPnPHK34zX0gf/WqKE=;
 b=N76SyXxQOQheIXZwr/ladHTTHjVFuS9G/2koCfKIkINiWje6fBYMowdpzzyd+2d/ck
 jGtKVgjazYmgnrQ1CxRsmu9YAJsPcGCaXhvdekjF5qiyizA9FqYw13tP67LmVGj+tPq6
 VgBhDxHB72VxhSxC4s2lp4uuiv2jt1d25Su+ZG5y0ob7oGNNZXkFWzvSIu8nP/Xet3Mi
 pu24uSMo6H0sTSSC7yfkGONtBmLlPtMwksS3N9s2MyKs07iS0SCwCADDTLIIdngSCj5l
 CNXf2nx+/zaY4yHMZfrmu6dFfBmRfeHxnDAzMroVB3jyYHiFPv61pI2np0eZ7oNfKkCF
 f2Rg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780063570; x=1780668370; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dvHjpUscS3LGAt7KUFAQnACdb0jmXR2p4L+IG6VyYLM=;
 b=n36RXo3NBv3jyb3aAqcMBJDIcQ4A/sVRJQnAaHdeXVxpCMVRla/X9vdDGEsTu0061a
 nW41sVDWV5sF0obVSRlU8r1KRGy/ctH0WjjAoQ0vPzC2f2H7EkZB8rOK2rlX8JoY2QzH
 asmfPri1IvpPTS2+DCsx1gJVG7NcJtlI10XQ6DdyKJCIw01dZyn+wV7P5ezE5rygXxIe
 ZRTCkSyFkKG/YStfe1UQueQAEnr4hHUUGgEg5KqnI/r9++kh/dMbj70r6lV8lFLowNmA
 HOH/n9e4eTvwRwUCs6SFdj1TdNIjCEVYoyFI7E7x/x7Brj5ApcK4LOIlmG46TYlvYEHF
 GlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780063570; x=1780668370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dvHjpUscS3LGAt7KUFAQnACdb0jmXR2p4L+IG6VyYLM=;
 b=WjuyFpDMQOWa9E0tnOND5WkOJrAxw2STDKDH4DnXdXMpe0bPWS/XZ6a3xg+jZoOhjy
 kSV5gd6jXyGqFTtuZTaIqca1yfxokuvWQmvbwxDvKViY+O0HgbhYmUdXs4iXlt3yu0gZ
 +5likO2FU7vkX7jbN6leuJOPwcUyhxxMYvE6MDGLKnLyu3Zt4HuOUlGPTSkzStZM/SDp
 1WI52Kvwf4ihJsXO85Fa89NsmDdgvC/QsbL8L+aNWLJNDiAinAdqFtNEy90+CPFXeWrr
 rgciuNVBbTx50AYEWTHHbnOh7/+AMFfNj38XYN7mXawnZrkX99WvfmnbW0OpxQCADguV
 jhfA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9mhUqKMEYHtZSWeciStk5R1nRuVCC46stsILeI9OJFMF5XymcfdLHIzhP/YI/2tTmc/beamUb3UQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzcCdJOrQbt19RyNiBTzNXqurt+Hfe8BUf0CVuyZEB4zshQTkJ
 jK3EZReZ/nnefcAkEjX7rwPNnZGR4PyjmhEnuXfw7BkzcsC2G3O9AZBviPKc8dy1KW95MTYjWy7
 1u36BB5HUIdE4d/+6Gy8QlmNF9XZw4UI=
X-Gm-Gg: Acq92OEGinSJQykENcvuZiRc8XAktXMj7/eUkwy6lgCBS96/yALl760y/M58pYoq+zt
 m1TOXgvykMYt+wQoJ0gR4wYK60jOyzG5F+nN6uemd3sVDIbBMgjDtL6dc/j9kowiiC6sDBiFmRB
 wGpTmPcHS5q6jD04v9vdfT+7eU8WWghKqewntEmAW2Jml1UfYk7u61CXdi0C2soVWqGXxXfiB0s
 Tc0oj+qDQjqulnBvz2e/qPF3YP3osqQqopsb7gw01qXP4qW5VT7YVTpA5GEvacFMnBZ1EJ9DU9g
 3SBA3usQco5xcgZR1uPH
X-Received: by 2002:a05:6820:4dc3:b0:69d:8879:b68d with SMTP id
 006d021491bc7-69e04031c40mr1576978eaf.47.1780063569742; Fri, 29 May 2026
 07:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260527115311.13398-1-zhanwei919@gmail.com>
 <20260529135028.20763-1-zhanwei919@gmail.com>
In-Reply-To: <20260529135028.20763-1-zhanwei919@gmail.com>
From: =?UTF-8?B?5Y2gd2Vp?= <zhanwei919@gmail.com>
Date: Fri, 29 May 2026 22:05:58 +0800
X-Gm-Features: AVHnY4JSxROazTZrUw4k9CKjlOr2tJ7BgWyUtPWVIMQB2u2A0wFiRfrZym4I1SI
Message-ID: <CA+qUFckr9uC7h4S9xw0JMxGnehXyrQ8HpOYdwoFoMsLk-HM_nw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/xe/hwmon: document DG2 fan speed reporting quirk
To: Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Raag Jadav <raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 01 Jun 2026 14:40:04 +0000
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

+Cc Raag, who authored the fan support and reviewed v1.

Thanks for your help, this v2 drops the code change and documents the
DG2 shared-tach behaviour instead, per your feedback on v1.

Zhan Wei <zhanwei919@gmail.com> =E4=BA=8E2026=E5=B9=B45=E6=9C=8829=E6=97=A5=
=E5=91=A8=E4=BA=94 21:50=E5=86=99=E9=81=93=EF=BC=9A
>
> The number of fanN_input attributes on DG2 is hardcoded to two because
> FSC_READ_NUM_FANS returns an incorrect value on some boards. How the
> physical fans map onto the tach channels is left to the board vendor:
> some OEMs route multiple physical fans through a single shared tach
> line, in which case the unwired channel's pulse counter never
> accumulates and fanN_input reads a constant 0 RPM.
>
> This is expected behaviour for such boards rather than a driver fault,
> and the driver has no reliable way to distinguish a shared-tach layout
> from a genuinely silent fan. Document this so the flat DG2 fan count is
> not mistaken for a bug and "fixed" by lowering it, which would hide a
> working fan2 on boards that do wire two tach lines.
>
> Signed-off-by: Zhan Wei <zhanwei919@gmail.com>
> ---
> v1 -> v2: Drop the code change. As pointed out in review, the same PCI
>   device ID ships with both shared-tach (multiple physical fans on one
>   channel) and 1:1 fan wiring, and FSC_READ_NUM_FANS is unreliable on
>   some boards, so the DG2 fan count cannot be lowered without hiding a
>   working fan2 on boards that do wire two tach lines. Document the
>   behaviour instead of changing the reported fan count.
>
> v1: https://lore.kernel.org/intel-xe/20260527115311.13398-1-zhanwei919@gm=
ail.com/
>
>  Documentation/gpu/xe/index.rst    |  1 +
>  Documentation/gpu/xe/xe_hwmon.rst | 48 +++++++++++++++++++++++++++++++
>  2 files changed, 49 insertions(+)
>  create mode 100644 Documentation/gpu/xe/xe_hwmon.rst
>
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.=
rst
> index 874ffcb6da3a..3c14cdcaa8a6 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -30,3 +30,4 @@ DG2, etc is provided to prototype the driver.
>     xe-drm-usage-stats.rst
>     xe_configfs
>     xe_gt_stats
> +   xe_hwmon
> diff --git a/Documentation/gpu/xe/xe_hwmon.rst b/Documentation/gpu/xe/xe_=
hwmon.rst
> new file mode 100644
> index 000000000000..8cd48df59386
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_hwmon.rst
> @@ -0,0 +1,48 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Xe HWMON support
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The xe driver exposes hardware monitoring sensors (power, energy,
> +temperature, voltage and fan speed) through the kernel hwmon subsystem,
> +typically consumed via ``/sys/class/hwmon/hwmonX/`` or tools such as
> +``sensors``.
> +
> +Fan speed reporting
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Fan speed (``fanN_input``) is reported in RPM and computed from a tach
> +pulse counter: the driver reads an accumulating pulse register, divides
> +the delta between two subsequent readings by two pulses per rotation,
> +and time-averages the result.
> +
> +Number of fan channels
> +-----------------------
> +
> +The number of ``fanN_input`` attributes exposed in sysfs is the fan
> +count returned by the ``FSC_READ_NUM_FANS`` pcode command. On DG2 this
> +command has been found to return an incorrect value on some boards, so
> +the driver hardcodes a fan count of two there. As a result up to
> +``fan1_input`` and ``fan2_input`` are always exposed on DG2 regardless
> +of how many tach lines are actually wired.
> +
> +Zero RPM on DG2 is not necessarily a bug
> +----------------------------------------
> +
> +How physical fans map onto the tach channels is left to the board
> +vendor. Some OEMs route several physical fans through a single shared
> +tach line, while others wire each fan to its own channel 1:1. The
> +driver has no reliable way to tell these layouts apart, and the same PCI
> +device ID can ship in either configuration.
> +
> +When a channel has no tach line driving it, its pulse counter never
> +accumulates, so the corresponding ``fanN_input`` reads a constant 0 RPM.
> +On DG2 this is most often seen on ``fan2_input`` for boards that drive
> +both physical fans from a single tach line. This is expected behaviour
> +for such boards, not a driver fault, and reflects the board wiring
> +rather than a missing or stalled fan.
> +
> +For this reason the fan count on DG2 is intentionally left at a flat
> +value rather than tracked per board: there is no driver-visible signal
> +that distinguishes a shared-tach layout from a genuinely silent fan.
> --
> 2.43.0
>
