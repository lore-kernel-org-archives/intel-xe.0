Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67B2C61CE3
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:49:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A8010E8F3;
	Tue, 25 Aug 2026 06:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A30mZoyP";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B95610E8F3
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 06:49:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C36F36011F;
 Tue, 25 Aug 2026 06:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF671F000E9;
 Tue, 25 Aug 2026 06:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787640564;
 bh=21ffJIeD8bb5TkfIMXFY/VLPIWr8rxtxygam0OuyMgs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=A30mZoyP2nbYcw0fzT/jsyCJx2tnxmYdLHAzTnOY3U/yTzdFqi2R6QLqipGS5MhDl
 OI5iccSp8Pdr+HrFqYv3QKAydV+R6/DTStKtlKdrDNuUixvxrfyLubT5uZ8Sy1fIH0
 Tk0x2AXdpzb4Ez2pMurwpod8mrvwZZ3R1PXRtF7ECHoVeWgBR0CGsdAVnwOLGovTDh
 VY51SgE40ecyyDAfsB+X2ZvJMxybXZhxieiKPCdA1FmSqbAcLudsBkU3eMCCFj1sVy
 ZBSRMBmj2sgaaDSen7c0BtajQiOMXZ/s9cRUzW0aVr2Ze6S9zKq4QOoUOgK9XsENzi
 b1pNI6La0SsGw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/5] drm/xe/xe_ras: Handle page offline requests for
 device memory ecc errors
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825063615.3697317-9-riana.tauro@intel.com>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
 <20260825063615.3697317-9-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:49:23 +0000
Message-Id: <20260825064924.4FF671F000E9@smtp.kernel.org>
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
- [Critical] The dummy implementation of `handle_page_offline` unconditiona=
lly returns success for Double-Bit ECC errors, preventing the required devi=
ce reset and leaving corrupted memory accessible.
--

--- Patch [2]: [RFC PATCH 2/5] drm/xe/xe_ras: Handle page offline requests =
for device memory ecc errors ---
commit e03bc1fc60d0c3e2b16dd451f580bbb4b02ed43e
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/xe_ras: Handle page offline requests for device memory ecc errors

This commit adds basic support for sending page offline/decline requests to
the system controller and integrates it into device memory ECC error
handling.

Link: https://lore.kernel.org/intel-xe/20260818104055.3833974-14-tejas.upad=
hyay@intel.com/

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index d25d25f775310..a6fa755ffebf7 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c

[ ... ]

> @@ -200,6 +201,115 @@ static inline const char *comp_to_str(u8 component)
> +static int handle_page_offline(struct xe_device *xe, u64 page_address, b=
ool send_cmd)
> +{
> +	enum xe_ras_page_action action;
> +	int ret =3D 0;
> +
> +	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
> +		xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page address: 0x%=
llx\n",
> +			   page_address);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * TODO: Call function to handle address fault
> +	 * ret =3D xe_ttm_vram_handle_addr_fault(xe, page_address);
> +	 */
> +
> +	/*
> +	 * Handle return code from address fault handling function:
> +	 *  0: Page soft offlined, decline to firmware
> +	 * -EIO: Address belongs to a critical BO/stolen area that cannot be of=
flined
> +	 * -EOPNOTSUPP: Address is valid and can be offlined but user policy is=
 not to offline
> +	 * -EXIST: Address is soft offlined but yet to be offlined by firmware =
for second occurrence
> +	 */
> +
> +	switch (ret) {
> +	case 0:
> +		action =3D XE_RAS_PAGE_ACTION_DECLINE;

[Severity: Critical]
Since the fault handler is commented out and ret is initialized to 0, will
this unconditionally trigger the 0 case and decline to offline the page?

[ ... ]

> @@ -367,11 +477,12 @@ static u8 handle_soc_internal_errors(struct xe_devi=
ce *xe, struct xe_ras_error_a
>  static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ra=
s_error_array *arr)
>  {
>  	struct xe_ras_memory_error *info =3D (void *)arr->details;
> +	int ret;
> =20
>  	/*
>  	 * For memory errors, the recovery action depends on the error category

[ ... ]

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

[Severity: Critical]
If handle_page_offline() always returns 0 due to the TODO stub above, does
this inadvertently bypass the fallback reset for Double-Bit ECC errors?

If the device is not reset and the page is not offlined, it appears the GPU
could continue executing with uncorrectable memory corruption.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825063615.3697=
317-7-riana.tauro@intel.com?part=3D2
