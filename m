Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E748C9832F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 06:34:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5810310E7A4;
	Mon, 28 Sep 2026 06:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m5Li6jxV";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8245B10E7A4
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 06:34:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4F93F40066;
 Mon, 28 Sep 2026 06:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B651F000FF;
 Mon, 28 Sep 2026 06:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790577265;
 bh=028vtSp+3y0BfUWBwNINsn56EaZu7EwEYjshT09E7VU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=m5Li6jxVuDKh7BOU26iP3g7z/gbbOAIc61XPYzfcz9W1+qlkxS9DU/zsjtehKxBqD
 g2xY+//OtW4wi4uu81HeuttHoQcN7KaCtzqg+uahUBk7tMYzGuVipcUJwAuavgCdm0
 /rr/UPybPVM0E66vMCqftM5Z0Hz0HvYysmI8SQiTzOhoymbjNrdf820QDs1cS6Xa/m
 GBLPMJWJKxvQEUHIIoKFXIOUaDOg5bLG+Hyi0nBXl7VEqNmI8ob+QC5Y+exmtfPXQ3
 NcnxN+Taxg4KXTzsEj3revXvITd/wxhIunQQhlx8HG+XVoKSs3XZTlg9IRL7CsD+qM
 u6koy/wEYResA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/6] drm/xe/xe_ras: Handle page offline requests for
 device memory ecc errors
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260928061830.417395-9-riana.tauro@intel.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
 <20260928061830.417395-9-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 06:34:24 +0000
Message-Id: <20260928063425.12B651F000FF@smtp.kernel.org>
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
- [High] xe_ras: unhandled page offlining failures bypass fallback GPU reset
- [Medium] xe_ras: out-of-bounds memory errors mischaracterized as user pol=
icy disable
--

commit 68428995a0f62e84ab14e112b823a469bad65984
Author: Riana Tauro <riana.tauro@intel.com>

    drm/xe/xe_ras: Handle page offline requests for device memory ecc errors
   =20
    Add basic support for sending page offline/remove requests to system
    controller and use it for device memory ECC error handling.
    Pages that belong to critical BOs cannot be handled by offlining and
    require a SBR (Secondary Bus Reset).

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 7a85735c57d58..96ad473388a95 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -201,6 +204,119 @@ static inline const char *comp_to_str(u8 component)
[ ... ]
> +static int handle_page_offline(struct xe_device *xe, u64 page_address, b=
ool send_cmd)
> +{
[ ... ]
> +	switch (ret) {
> +	case 0:
> +		action =3D XE_RAS_PAGE_ACTION_REMOVE;
> +		xe_log_err(xe, DEVICE_MEMORY, ret,
> +			   "Poison detected at physical address 0x%llx, page soft-offlined\n",
> +			   page_address);
> +		break;
> +	/* User policy set to decline page offlining */
> +	case -EOPNOTSUPP:

[Severity: Medium]
When xe_ttm_vram_handle_addr_fault() encounters an out-of-bounds address, d=
oes
it also return -EOPNOTSUPP?

If firmware reports an error at an invalid physical address outside VRAM/GS=
M,
it looks like this will mischaracterize the error as a user policy choice a=
nd
still send a XE_RAS_PAGE_ACTION_REMOVE command.

> +		action =3D XE_RAS_PAGE_ACTION_REMOVE;
> +		xe_log_err(xe, DEVICE_MEMORY, ret,
> +			   "Poison detected at physical address 0x%llx, user policy set to de=
cline soft-offlining\n",
> +			   page_address);
> +		break;
> +	case -EIO:
> +		xe_log_err(xe, DEVICE_MEMORY, ret,
> +			   "Poison detected at physical address 0x%llx, page belongs to criti=
cal BO and cannot be soft-offlined\n",
> +			   page_address);
> +		return ret;
> +	case -EEXIST:
> +		action =3D XE_RAS_PAGE_ACTION_OFFLINE;
> +		xe_log_err(xe, DEVICE_MEMORY, ret,
> +			   "Double-bit ECC error detected at physical address 0x%llx, page so=
ft-offlined\n",
> +			   page_address);
> +		break;
> +	default:
> +		xe_log_err(xe, DEVICE_MEMORY, ret, "Failed to handle address fault at =
physical address 0x%llx\n",
> +			   page_address);
> +		return 0;

[Severity: High]
Does returning 0 here mask the error code from xe_ttm_vram_handle_addr_faul=
t()?

If an internal error occurs (like -ENOMEM), returning 0 instead of the error
code causes the caller, handle_device_memory_errors(), to evaluate if (ret)
as false. This masks the offlining failure and bypasses the fallback hardwa=
re
reset, potentially leaving corrupted memory in use.

> +	}
> +
> +	if (send_cmd) {
> +		ret =3D send_page_offline_cmd(xe, page_address, action);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> @@ -384,10 +501,10 @@ static u8 handle_device_memory_errors(struct xe_dev=
ice *xe, struct xe_ras_error_
>  		xe_info(xe, "[RAS]: Data parity error detected\n");
>  		break;
>  	case XE_RAS_MEMORY_DB_ECC:
> -		xe_info(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx=
\n",
> -			info->sw_address);
> -		/* TODO: Add page offlining for Double-bit ECC error */
> -		fallthrough;
> +		ret =3D handle_page_offline(xe, info->sw_address, true);
> +		if (ret)
> +			return XE_RAS_RECOVERY_ACTION_RESET;
> +		break;
>  	default:
>  		return XE_RAS_RECOVERY_ACTION_RESET;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928061830.4173=
95-8-riana.tauro@intel.com?part=3D1
