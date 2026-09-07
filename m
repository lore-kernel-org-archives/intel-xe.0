Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F390DC79F99
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 10:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10EC10E495;
	Mon,  7 Sep 2026 10:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U0IACGRn";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FA310E495
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 10:14:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2093060D86;
 Mon,  7 Sep 2026 10:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76C11F00A3D;
 Mon,  7 Sep 2026 10:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788776086;
 bh=4xvL1Jm7nNW7gCbkfOotfCIBq0bIYhK3SXT+kuJJsLg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=U0IACGRnDTxV1sFmsXHXENifn8jyk7hLpo7qGgQ7VMKe1MhDjNL9FmzAa5m6ux8lD
 ACekdDQz/VRLALK0NZLMnU75QGiSithrho5bicS7cnVMP6zYaMoIuJ4iI5bPurNYm7
 yRGki5X6HnHQQEZr4O0NzA5IQYeSmT/16efvY6UX1wDjMeAibYOH0HvXYrSHnjKcJR
 slktMXikjww6ru+z+ZKpazxObNDXuYuMLNBjagJTZCTIPNhix/lkzXolBKrGSHKH35
 O3TovvSHB1IZzT2XqaUzKzoKmAYQUZ8is7QT1H9EJa5jcAWzE+5vi8gS1a0a1zu5n1
 eFaOEHgkH8pQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] drm/xe/xe_ras: Handle page offline requests for
 device memory ecc errors
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260907094706.1407436-9-riana.tauro@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
 <20260907094706.1407436-9-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 10:14:46 +0000
Message-Id: <20260907101446.B76C11F00A3D@smtp.kernel.org>
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
- [High] Unhandled errors from `xe_ttm_vram_handle_addr_fault` are silently=
 converted to success (return 0) in `handle_page_offline`, bypassing the re=
quired device reset for Double-bit ECC errors.
- [High] Mismatch between hardware page size (XE_PAGE_SIZE) and CPU page si=
ze (PAGE_SIZE) causes page offlining to fail on non-4KB page architectures.
--

commit b5f7912325b590064c71dc561b34bee2f792f1f0
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/xe_ras: Handle page offline requests for device memory ecc errors

This commit adds basic support for sending page offline/decline requests to
the system controller. It uses this to handle device memory ECC errors.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 7a85735c57d58..94ffd08529384 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -201,6 +204,110 @@ static inline const char *comp_to_str(u8 component)
[ ... ]
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
> +	ret =3D xe_ttm_vram_handle_addr_fault(xe, page_address);

[Severity: High]
Can this validation cause page offlining to fail on architectures where the
CPU page size is not 4KB?

Here, the address is validated using XE_PAGE_SIZE (4KB). However, the
downstream function xe_ttm_vram_handle_addr_fault() rejects addresses that
are not aligned to the system's PAGE_SIZE:

xe_ttm_vram_handle_addr_fault() {
	/* Assert that the address is PAGE_SIZE aligned */
	if (WARN_ON_ONCE(!IS_ALIGNED(addr, PAGE_SIZE))) {
		...
		return -EINVAL;
	}
...
}

On architectures where the CPU page size is 16KB or 64KB, providing a
4KB-aligned page address will pass the XE_PAGE_SIZE check but fail in
xe_ttm_vram_handle_addr_fault(), returning -EINVAL.

> +
> +	/*
> +	 * Handle return code from address fault handling function:
[ ... ]
> +	switch (ret) {
[ ... ]
> +	default:
> +		xe_log_err(xe, DEVICE_MEMORY, ret, "Failed to handle address fault 0x%=
llx\n",
> +			   page_address);
> +		return 0;
> +	}

[Severity: High]
Does this default case incorrectly return 0 when an unhandled error occurs?

If xe_ttm_vram_handle_addr_fault() fails with an unexpected error (like
-ENOMEM or the -EINVAL from the alignment check above), returning 0 here
converts the failure into a success.

[ ... ]
> @@ -368,11 +475,12 @@ static u8 handle_soc_internal_errors(struct xe_devi=
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

[Severity: High]
Since handle_page_offline() returns 0 for unhandled errors, does this bypass
the required device reset for Double-bit ECC errors?

The caller relies on a non-zero return value to trigger the GPU reset on
unhandled DB-ECC errors. If the error is swallowed in the default case abov=
e,
memory corruption might remain unmitigated without a reset.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907094706.1407=
436-8-riana.tauro@intel.com?part=3D1
