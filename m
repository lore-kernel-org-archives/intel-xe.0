Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6D2CC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 20:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4985210F9C5;
	Tue, 13 Oct 2026 20:59:24 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B9C10E58C;
 Tue, 13 Oct 2026 20:59:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AD876601DB;
 Tue, 13 Oct 2026 20:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35AB01F000FF;
 Tue, 13 Oct 2026 20:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791925157;
 bh=2z8Z1czjbzB+Q6ROmS/4mSzbvCH5w3mBH88ANrCvAz0=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=b9iHsjgUKSwb2rDPmifbIVcHEZ1CrFafcoj0Hxno0QuJLNP/c5iubMEQvK0z11+SI
 N81kcwhDCRb8UnVt5QD5s+y7jF+MvYmvMU5RfkC9FmvVmRFgz8HQ77HKwPcE7YiMvW
 z+ZQ36ZmFHYxNc12/+KEO9KQUyLOH9tLn/nNQmLGmXIjBzTWs/jDgbgK6BXbRpnINN
 HB63qzyPTFbXEYiDNUugEWvOoC4ihgj5k1oobbMpYinOazCCSIxELAxhEMNdzbGEkY
 TaR3mFYr+nCz4aJAueIFzw7c5boKOrlnrS1jpSDAv1NxFqVeo0y4WH2YlAzorq2pvg
 fNMftWnzXNDkw==
Message-ID: <sashiko-outbox-170497@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] drm/i915/3dlut: disable 3D LUT for pre-GLK
To: =?utf-8?b?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013204705.1574475-3-michal.grzelak@linux.intel.com>
References: <20261013204705.1574475-1-michal.grzelak@linux.intel.com>
 <20261013204705.1574475-3-michal.grzelak@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 20:59:16 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/i915: 3D LUT remains disabled for GLK/ICL due to unmodified =
version check
--

commit 31c6b1070ace7be34ebe695316e80a7d65a5d1a7
Author: Micha=C5=82 Grzelak <michal.grzelak@linux.intel.com>
Subject: drm/i915/3dlut: disable 3D LUT for pre-GLK

This commit adds a has_3dlut field to the display runtime info to indicate
whether 3D LUT is enabled. It initializes the field to 1 for GLK and newer
platforms, and adds a HAS_3DLUT macro to check for support.

> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm=
/i915/display/intel_color.c
> index f1df0f9ba7624..95de75e1de984 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -4304,6 +4304,9 @@ intel_color_load_plane_luts(struct intel_dsb *dsb,
>  bool
>  intel_color_crtc_has_3dlut(struct intel_display *display, enum pipe pipe)
>  {
> +	if (!HAS_3DLUT(display))
> +		return false;
> +
>  	if (DISPLAY_VER(display) >=3D 12)
>  		return pipe =3D=3D PIPE_A || pipe =3D=3D PIPE_B;
>  	else
>  		return false;
>  }

[Severity: Medium]
Will this still return false for GLK and ICL platforms even though they have
the HAS_3DLUT flag set?

The commit message indicates 3D LUT is supported on GLK+ hardware, and the
patch sets has_3dlut =3D 1 for GLK (DISPLAY_VER =3D 10) and ICL (DISPLAY_VE=
R =3D 11).
However, in intel_color_crtc_has_3dlut(), after the new HAS_3DLUT() check
passes for these platforms, the function still evaluates:

    if (DISPLAY_VER(display) >=3D 12)
        ...
    else
        return false;

Doesn't this existing version check unconditionally return false for GLK and
ICL, defeating the newly added flag and keeping 3D LUT disabled for these
platforms?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013204705.1574=
475-1-michal.grzelak@linux.intel.com?part=3D2
