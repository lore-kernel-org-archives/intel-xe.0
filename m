Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7109C61DD6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 06:46:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF1810E54F;
	Fri,  4 Sep 2026 06:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R9j6kQ/B";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E245510E3A8;
 Fri,  4 Sep 2026 06:45:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id EB7D960A6D;
 Fri,  4 Sep 2026 06:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D59E1F00A3D;
 Fri,  4 Sep 2026 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788504358;
 bh=Xs6g+BBEEe5TdIfZ3uv+bhRKfMeHtjZFW1ADkQcJLTQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=R9j6kQ/BlvuZC7H2v/KmyT+OCPHWkbIFnH5OEmhFu1Y/fHhMPVuzlthGk/D5IankY
 Y2qvSojwG3hNweL9aZxZHiMMIL9/p/BYNlShbG0ntzFVlq+e27OaAmwPZRbl8hhf65
 0TPyFD4poKxtOGUIc0XSV+r+honrYNn/vJ+M4/5GxSkd9S/ECvlerK/hRKZR/YcBBV
 Q3sYkyFmyVIzOs0gIbSn3x1vfWxpxVEQRDIwcwoYx+TqsAX4DqcV2E749P9iKvi8IL
 tjSIEcxtflCRS1eiRSzN9LNol6e0V5tILw/zOUs+tvWW9nZls+03Gj60hmau32s8Ef
 9x7HYz2Q6X0RA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/display: Limit SEL_FETCH clear to supported pipes
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260904062744.3010375-1-nemesa.garg@intel.com>
References: <20260904062744.3010375-1-nemesa.garg@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 06:45:58 +0000
Message-Id: <20260904064558.6D59E1F00A3D@smtp.kernel.org>
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
- [Medium] The patch adds a check to prevent unclaimed register accesses fo=
r uninstantiated SEL_FETCH registers, but incorrectly limits this check str=
ictly to Display Ver 12, leaving Ver 13+ platforms vulnerable.
--

commit 5a2a4e5321d7248032644f135d53b64d20ede511
Author: Nemesa Garg <nemesa.garg@intel.com>

drm/i915/display: Limit SEL_FETCH clear to supported pipes

This patch adds checks to skip clearing SEL_FETCH_PLANE_CTL and
SEL_FETCH_CUR_CTL on pipes that do not implement these registers,
preventing unclaimed register accesses when disabling planes and cursors.

> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/dr=
m/i915/display/intel_cursor.c
> index cce041e1da51d..de4359cbe306d 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> @@ -545,6 +545,10 @@ static void i9xx_cursor_disable_sel_fetch_arm(struct=
 intel_dsb *dsb,
>  	if (!HAS_PSR2_SEL_FETCH(display))
>  		return;
> =20
> +	/* Display ver 12 only instantiates these registers for pipe A */
> +	if (DISPLAY_VER(display) =3D=3D 12 && pipe !=3D PIPE_A)
> +		return;
> +

[Severity: Medium]
Does this check leave Display Ver 13+ platforms vulnerable to the same issu=
e?

Because PSR2 is only supported on transcoders A and B on newer platforms
(like Alderlake P), the SEL_FETCH registers for pipes C and D are not
instantiated.=20

With this check strictly limited to DISPLAY_VER(display) =3D=3D 12, disabli=
ng a
cursor on pipe C or D on Ver 13+ will evaluate to false, bypass this
protection, and still cause an unclaimed register access.

>  	intel_de_write_dsb(display, dsb, SEL_FETCH_CUR_CTL(pipe), 0);
>  }
> =20
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers=
/gpu/drm/i915/display/skl_universal_plane.c
> index 5cda1ab90e40f..252df30debc9b 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -893,6 +893,10 @@ static void icl_plane_disable_sel_fetch_arm(struct i=
ntel_dsb *dsb,
>  	if (!HAS_PSR2_SEL_FETCH(display))
>  		return;
> =20
> +	/* Display ver 12 only instantiates these registers for pipe A */
> +	if (DISPLAY_VER(display) =3D=3D 12 && pipe !=3D PIPE_A)
> +		return;
> +

[Severity: Medium]
Similarly for planes, does limiting this check to exactly Ver 12 allow
unclaimed register accesses on Ver 13+?

Disabling a plane on pipe C or D on a Display Ver 13+ platform will also by=
pass
this check and attempt to write to uninstantiated SEL_FETCH registers.

>  	intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe, plane->id), =
0);
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904062744.3010=
375-1-nemesa.garg@intel.com?part=3D1
