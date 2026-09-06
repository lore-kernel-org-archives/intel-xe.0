Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7E4C79F8C
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EAC10E088;
	Sun,  6 Sep 2026 17:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fPn/rwjw";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C813410E088
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:21:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0CA6941A48;
 Sun,  6 Sep 2026 17:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82231F00A3A;
 Sun,  6 Sep 2026 17:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788715275;
 bh=vBOeWcFv/AyhSDXincIko3Cbf8rmyuTE5eXURdReFDY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=fPn/rwjw/oTGQl4XI6G7LD2vVUzRFFEQUMK/Qc5rUsLf8YeaKk5L4ikKzBR8jEE6p
 7m2zIppFHthdcOegrCF1t+TbCuTcdANTSIgs83qbb3fH6AEwt0nb8HvAbHMxp+Ud/g
 YF0V6yT8wKnkNAW8t7u9kxOO2sYt+g/IHYPjsdRXOvlzgSzGtVJu8yq74QFaY8uJO8
 xrbd2iftzDh/iDRigDQTQEB8TLv3UW1LAT8V+Lhbvf1uNnHJCteirPJkIJffYsdb3m
 F6EOTojmOo74kp8V4N2V6ZmweBlbQyIaagFcp1BTONi/A+bg8q9en1XikKBrfouFpR
 iEpATzjK+yzKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/12] drm/xe/xe_ras: Report core compute errors
 using SIGID
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260906172604.2215987-23-badal.nilawar@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-23-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 17:21:15 +0000
Message-Id: <20260906172115.B82231F00A3A@smtp.kernel.org>
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

Pre-existing issues:
- [High] Hardware error CPER emission is completely disabled due to an inve=
rted condition check on the error signature ID.
--

commit 5c8af98618264b3c8466a350a075ee0f1ad606e7
Author: Badal Nilawar <badal.nilawar@intel.com>

    drm/xe/xe_ras: Report core compute errors using SIGID
   =20
    Use xe_log_* helpers to report core compute errors.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 3a7f80370827e..78ea5e33e244b 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -310,21 +310,27 @@ static void ras_send_error_event(struct xe_device *=
xe, u8 severity, u8 component
>  	xe_drm_ras_event(xe, drm_component, drm_severity, response.value);
>  }
> =20
> -static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
> +static u8 handle_core_compute_errors(struct xe_device *xe, struct xe_ras=
_error_array *arr)
>  {
>  	struct xe_ras_compute_error *error_info =3D (void *)arr->details;
> +	u8 cper_sev =3D ras_sev_to_cper_sev(arr->counter.common.severity);
>  	u8 uncorr_type;
> =20
>  	uncorr_type =3D FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info->log_hea=
der);
> =20
>  	/* Request a reset if error is global */
> -	if (uncorr_type =3D=3D GLOBAL_UNCORR_ERROR)
> +	if (uncorr_type =3D=3D GLOBAL_UNCORR_ERROR) {
> +		xe_log_comp(xe, cper_sev, CORE_COMPUTE, &arr->counter, sizeof(arr->cou=
nter),
> +			    "Global uncorrectable error detected\n");

[Severity: High]
This is a pre-existing issue, but will these hardware errors actually be em=
itted
by the CPER infrastructure?

Looking at xe_emit_hardware_error_cper() in drivers/gpu/drm/xe/xe_cper.c, w=
hich
processes these hardware SIGIDs, there appears to be an inverted condition =
check:

drivers/gpu/drm/xe/xe_cper.c:xe_emit_hardware_error_cper() {
	...
	if ((int)sigid >=3D INTEL_SIGID_GPU_XE_HARDWARE_START)
		return;
	...
}

Any time xe_emit_hardware_error_cper() is called with a valid hardware SIGI=
D,
does this inverted check silently drop the CPER record instead of processin=
g it?

>  		return XE_RAS_RECOVERY_ACTION_RESET;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906172604.2215=
987-14-badal.nilawar@intel.com?part=3D9
