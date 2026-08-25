Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5BEC61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 18:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21F210E0DB;
	Tue, 25 Aug 2026 18:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JnlnEMOL";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC4010E0DB
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 18:03:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 360BE60053;
 Tue, 25 Aug 2026 18:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36D71F000E9;
 Tue, 25 Aug 2026 18:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787680984;
 bh=UHwGI+2ZOXbWsooivRVynvf7OiQS62qRxm2qyFKfX9Y=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JnlnEMOLNIIdJTHOFoQ0DmH+xlGbzvRXFZOQPsSgx5CYVuXyNJLOQKFNTm8CfL6cT
 HJc+saJMAZ68EYrwHY/ugZoNbWqen7xuj7iSlMhc+pvAWARv6MpgMoJrLRGgWU3btu
 FvXA+8TI0ye9kXG6iEKmiJY65LWMEW/d4vX7yQWfoXxY3NdHs5WXLwb/kWYZ2kz+uB
 fx6nkLKRGmrROlnOPthQ9P2OHVhtVP/AR+gpTdu24dwYorDVebkb4HIOxuXaL9+zXA
 nRzmQSJouN3lpnSzPdJx6r2RtwEwLhrbKsLgAvqsgg20Q5XyWPIqrZnBnBvxoFddGy
 Rdg9ruZI1lgJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/11] drm/xe/ras: Report correctable errors using SIGID
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825175916.1103841-24-badal.nilawar@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-24-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 18:03:04 +0000
Message-Id: <20260825180304.C36D71F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Passing raw `enum xe_ras_component` to `xe_log_from()` instead o=
f a properly constructed `enum xe_log_component`, causing incorrect logging=
 format and kernel warnings.
- [Medium] Unmapped `XE_RAS_COMP_RESERVED` causes `U32_MAX` to be passed as=
 a default SIGID, breaking the stable signature ID tracking scheme by loggi=
ng `SIGID=3D4294967295`.
--

commit 9b392e724340e7b28bbb985e627346fd4f036a93
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/ras: Report correctable errors using SIGID

This commit replaces the xe_warn() call for correctable errors with the
xe_log_from() helper to report them using SIGID format.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 4cd1d5eb75f4d..0becfadbb4cdf 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -458,8 +458,11 @@ void xe_ras_counter_threshold_crossed(struct xe_devi=
ce *xe,
>  		if (!ras_counter_is_valid(xe, &errors[id]))
>  			continue;
> =20
> -		xe_warn(xe, "[RAS]: %s %s detected\n",
> -			comp_to_str(component), sev_to_str(severity));
> +		xe_log_from(xe, ras_sev_to_cper_sev(severity),
> +			    ras_comp_to_hw_sigid(component),

[Severity: Medium]
Will this leak U32_MAX as a SIGID to the logging infrastructure?

If ras_counter_is_valid() allows XE_RAS_COMP_RESERVED (3) to proceed,
ras_comp_to_hw_sigid() hits the default case and returns U32_MAX.

U32_MAX is then passed as the sigid to xe_log_from(), and __xe_log_emit()
blindly formats the sigid using %u, logging "SIGID=3D4294967295".=20
Does this break the stable, machine-matchable token format?

> +			    component,

[Severity: Medium]
Does this pass an invalid component type to xe_log_from()?

xe_log_from() expects its component parameter to be a constructed=20
enum xe_log_component (via MAKE_XE_LOG_COMPONENT), where the lower byte is
class and the upper byte is type.

Passing the raw enum xe_ras_component directly causes it to be misinterpret=
ed
as CLASS=3D1 and TYPE=3D0. This triggers log_unknown_component_prefix() to =
be
invoked, printing a corrupted "DRIVER? " prefix and triggering a kernel WARN
on every RAS event if CONFIG_DRM_XE_DEBUG is enabled.

> +			    &errors[id], sizeof(errors[id]),
> +			    "error detected\n");
> =20
>  		/* Send event once per component */
>  		if (sent & BIT(component))

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825175916.1103=
841-13-badal.nilawar@intel.com?part=3D11
