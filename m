Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629AAC79F8C
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1487810E1F2;
	Sun,  6 Sep 2026 17:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HEbH81Mv";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1616010E2BD
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:27:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C7FA043CB6;
 Sun,  6 Sep 2026 17:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4DA1F00A3A;
 Sun,  6 Sep 2026 17:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788715626;
 bh=YoyvS/IhcFAEh0gBMB74ZW5U5CflD/kXWpd4xzpL5nI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=HEbH81Mv+Yc/P/Zzfc5wBgH/tiGPvEVCY8+6fHC4mjnebS//BNgpBkTl3TUyBCtn7
 Iv+xLlYko/o+7J17P3zXeMjuuEhBZ1BFpkGotNE5FJD2nbJD42NsHWOij/fIM78EkW
 wzcB6o1yvOaQW67SgnTCatTeQlsU2nP+U7hC1y38+bW64CdDOFC4tJzFhhioLZtQTA
 zyvuvpON8wuCPosEx/Jw2OCZreLDs+h1h4lsC+CxAP8R/jFoAEH/JaJyIxragN3xKM
 2pxL/mDXrOxQOA/fdjL4D30SKb3MvRAe1iFWRnrn+e1Qg1hZXXOkxClX4Vw8hHhloR
 bGypHmIqpA8jQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/12] drm/xe/xe_ras: Report correctable errors using
 SIGID
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260906172604.2215987-25-badal.nilawar@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-25-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 17:27:06 +0000
Message-Id: <20260906172706.7E4DA1F00A3A@smtp.kernel.org>
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

New issues:
- [Medium] Raw hardware component ID passed to xe_log_from() instead of a s=
tructured log component identifier.

Pre-existing issues:
- [High] The function xe_emit_hardware_error_cper() contains an inverted co=
ndition that unconditionally skips hardware CPER emission.
--

commit 477ea5ac3298dd8da692c324d242eff3e7e49b28
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/xe_ras: Report correctable errors using SIGID
   =20
Use xe_log_* helper to report correctable errors.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index e93a989fc8f66..8cd6544b5336c 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -464,8 +464,11 @@ void xe_ras_counter_threshold_crossed(struct xe_devi=
ce *xe,
>  		if (!xe_ras_counter_is_valid(xe, &errors[id]))
>  			continue;
> =20
> -		xe_warn(xe, "[RAS]: %s %s detected\n",
> -			comp_to_str(component), sev_to_str(severity));
> +		xe_log_from(xe, ras_sev_to_cper_sev(severity),
> +			    ras_comp_to_hw_sigid(component),
> +			    component,

[Severity: Medium]
In drivers/gpu/drm/xe/xe_ras.c:xe_ras_counter_threshold_crossed(), does this
code pass the raw hardware component ID to xe_log_from() instead of a
structured log component identifier?

Passing the raw 8-bit component enum value instead of a properly formatted
value could trigger a runtime WARN trace when debug is enabled, and produce=
 a
confusing "DRIVER? " prefix in the dmesg log instead of the correct hardware
component name.

> +			    &errors[id], sizeof(errors[id]),
> +			    "error detected\n");
> =20
>  		/* Send event once per component */
>  		if (sent & BIT(component))

[Severity: High]
This is a pre-existing issue, but does xe_emit_hardware_error_cper() in
drivers/gpu/drm/xe/xe_cper.c skip CPER emission for valid hardware error
signatures?

drivers/gpu/drm/xe/xe_cper.c:xe_emit_hardware_error_cper() {
    ...
	if (!xe)
		return;

	if ((int)sigid >=3D INTEL_SIGID_GPU_XE_HARDWARE_START)
		return;

	if (!counter || !xe_ras_counter_is_valid(xe, counter))
		return;
    ...
}

It looks like the condition if ((int)sigid >=3D INTEL_SIGID_GPU_XE_HARDWARE=
_START)
might be inverted.  This appears to cause hardware RAS errors to silently f=
ail
to generate CPER records when sigid is a valid hardware signature ID.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906172604.2215=
987-14-badal.nilawar@intel.com?part=3D11
