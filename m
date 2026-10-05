Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BCFCA5FFC
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 09:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03DC10EC33;
	Mon,  5 Oct 2026 09:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j8Oqk//e";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D407910EC33
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 09:16:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 044F26022B;
 Mon,  5 Oct 2026 09:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9126E1F00893;
 Mon,  5 Oct 2026 09:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791191765;
 bh=ZwYmUeptXB51gEm4w52DDrnchEurhzJ9T6FlHFXcyqs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=j8Oqk//eamJ7AgvtySyAM0HIGGzm5CjhUP8oXtG8UW4PVUtjLGkLH8skXaF36iPGz
 LUsw3R+mAioISXcyu7tmyQLrGep/gzaNSL5X/b4UOJL2KKIBiXpaXVMhy8C7w4uSDR
 hU7bRJv1EmVhhAoIKaUXTTgEHZL9ssqFxcgi2xvyLcbRtDuEUCLmMTu2v5I0TRp3ke
 cxI3cS1fguZpUv9RKMwDlOsjTvKFfv+Co8PUniPLdKi1J4j1BG/7ji8iw6c7W+gWbe
 JFe8KITIMnCaTmyTpTSpc+1PA705u9H0UFt/UQnbVgtYlNXb7+uO9EwROHw4jQMn1Q
 RuQLBZwx1/mZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/6] drm/xe/xe_ras: Handle page offline requests for
 device memory ecc errors
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261005090156.1233748-10-riana.tauro@intel.com>
References: <20261005090156.1233748-8-riana.tauro@intel.com>
 <20261005090156.1233748-10-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 09:16:05 +0000
Message-Id: <20261005091605.9126E1F00893@smtp.kernel.org>
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
- [High] drm/xe: handle_page_offline() masks address fault errors, preventi=
ng GPU reset
- [Medium] drm/xe: missing __le64/__le32 in xe_ras_page_offline_request cor=
rupts data on BE
--

commit dfae5aa8d25c44eda9036e3a3cde9ebb95f9803e
Author: Riana Tauro <riana.tauro@intel.com>
Subject: drm/xe/xe_ras: Handle page offline requests for device memory ecc =
errors

This commit adds support for sending page offline/remove requests to the
system controller and uses it for device memory ECC error handling. Pages
are soft-offlined depending on whether they belong to critical buffer
objects or standard user space.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -201,6 +204,127 @@ static inline const char *comp_to_str(u8 component)
[ ... ]
> +static int handle_page_offline(struct xe_device *xe, u64 page_address, b=
ool notify_fw)
> +{
[ ... ]
> +	switch (ret) {
> +	case 0:
[ ... ]
> +	case -ENOMEM:
> +		xe_log_err(xe, DEVICE_MEMORY, ret,
> +			   "Poison detected at physical address 0x%llx, failed to soft-offlin=
e\n",
> +			   page_address);
> +		return ret;
> +	default:
> +		xe_log_err(xe, DEVICE_MEMORY, ret, "Failed to handle address fault at =
physical address 0x%llx\n",
> +			   page_address);
> +		return 0;

[Severity: High]
Does returning 0 here unintentionally mask unexpected errors from
xe_ttm_vram_handle_addr_fault?

If soft-offlining a page fails with an unexpected error such as -EINVAL
or -ENOENT, returning 0 causes the caller in handle_device_memory_errors
to assume the recovery was successful. This skips the required Secondary
Bus Reset, which leaves the system running with an active corrupted memory
page. Should this propagate the error to ensure a reset is triggered?

> +	}
[ ... ]
> @@ -368,11 +492,12 @@ static u8 handle_soc_internal_errors(struct xe_devi=
ce *xe, struct xe_ras_error_a
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
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ra=
s_types.h
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
[ ... ]
> @@ -295,6 +308,28 @@ struct xe_ras_memory_error {
[ ... ]
> +struct xe_ras_page_offline_request {
> +	/** @page_address: Page address (4KB aligned) */
> +	u64 page_address;
> +	/** @action: Action to be performed, see &enum xe_ras_page_action */
> +	u32 action;

[Severity: Medium]
Could this struct layout cause data corruption on big-endian architectures?

The struct uses native host types for the 64-bit page_address and 32-bit
action instead of explicitly specifying __le64 and __le32. When the sysctrl
mailbox transmits this data via MMIO writel in 32-bit chunks, a big-endian
system will word-swap the 64-bit value, sending the most-significant 32 bits
where the firmware expects the least-significant 32 bits.

Since send_page_offline_cmd assigns these fields directly without any
cpu_to_le64 conversion, should this struct definition use little-endian typ=
es
to safely maintain the hardware ABI contract?

> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005090156.1233=
748-8-riana.tauro@intel.com?part=3D2
