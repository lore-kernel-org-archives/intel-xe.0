Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47328606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SXw9dbp5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0178110F39A;
	Tue,  3 Nov 2026 06:23:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F82810F39A
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:23:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0E95341AF8;
 Tue,  3 Nov 2026 06:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBDB11F000C1;
 Tue,  3 Nov 2026 06:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793686984;
 bh=kOLz5l8OQnt0nF3vjFPcf33YxPeIxfBUqw5IpbvoLf8=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=SXw9dbp5gHJViTAPUk5XsOzdBZdJOIByb+b61BfzF6Vre2/9ksjeKUoxvi3BnDA8G
 T1SHOVWl6Z/Fl1iYYHJTfvExg0jx5xagUnCGdD2kN+/V1rxdf+LbIBXnnXEXqVsaHh
 cJS+DnL5keCkLA/EqRitHefWFgj7bqQiZBQo3xc3l5BAwo9cvSMoZPQNCqrTfkssjV
 JZnLDWmhvL0EXlXx98RH9A/0u6F4BoBZaKLBJl0+pZ6JqwmAfx4DTY+pQ+K+ehxiAy
 9jVcOsV/ECeCpyBrix9e2FK8ypvD4LZawU35apacmNSm1Vu/ZYSn0qQv1rPZxwFGyZ
 1R0EVUElyRUng==
Message-ID: <sashiko-outbox-194619@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] drm/xe/xe_ras: Skip double-bit ECC page
 offlining on AER path
To: "Riana Tauro" <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261103060929.1586783-16-riana.tauro@intel.com>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
 <20261103060929.1586783-16-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:23:04 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/xe/xe_ras: duplicate handle_page_offline() call on DB_ECC erro=
r path
--

commit 3c39adabce266f3b2fd96c271c13abe952fe58d0
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/xe_ras: Skip double-bit ECC page offlining on AER path

This commit skips double-bit ECC page offlining in
handle_device_memory_errors() when running on the AER path so pages are not
unnecessarily offlined and dropped from the firmware queue before a Seconda=
ry
Bus Reset clears them.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 1809c3c893dee..32aa376555bd5 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -676,6 +676,23 @@ static u8 handle_device_memory_errors(struct xe_devi=
ce *xe, struct xe_ras_error_
>  			    info->sw_address);
>  		/*
>  		 * Double-bit ECC errors are non-fatal errors and are reported via IRQ.
> +		 * On a race between AER for device fatal errors and non-fatal double-=
bit ECC
> +		 * errors, if AER pci error handlers execute first it will get all err=
ors as
> +		 * a single response from system controller, which can include the dou=
ble-bit
> +		 * ECC errors. This leads to unnecessary offlining of pages, since an =
SBR clears
> +		 * them on reload and firmware drops them from its queue once read.
> +		 * Skip handling of double-bit ECC errors on the AER path to avoid thi=
s.
> +		 *
> +		 * TODO: Remove this check once AER handling is optimized to retain so=
ft
> +		 * offlined pages.
> +		 */
> +		if (xe_ras_is_aer_internal_error(xe)) {
> +			xe_info(xe, "[RAS]: Skipping double-bit ECC error handling on AER pat=
h\n");
> +			break;
> +		}
> +
> +		ret =3D handle_page_offline(xe, info->sw_address, true);

[Severity: High]
Was the existing call to handle_page_offline() above xe_log_comp() in
handle_device_memory_errors() meant to be removed or moved here?

drivers/gpu/drm/xe/xe_ras.c:handle_device_memory_errors() {
	...
	case XE_RAS_MEMORY_DB_ECC:
		ret =3D handle_page_offline(xe, info->sw_address, true);
		xe_log_comp(xe, ret ? cper_sev : CPER_SEV_INFORMATIONAL,
			    DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
			    "Double-bit ECC error detected at sw address 0x%llx\n",
			    info->sw_address);
		...
		if (xe_ras_is_aer_internal_error(xe)) {
			xe_info(xe, "[RAS]: Skipping double-bit ECC error handling on AER path\n=
");
			break;
		}

		ret =3D handle_page_offline(xe, info->sw_address, true);
	...
}

Because the earlier handle_page_offline() call is still present before the
xe_ras_is_aer_internal_error() check, the AER path still soft-offlines the
page and sends the page offline command to firmware before breaking out.

On the normal non-AER IRQ path, handle_page_offline() is now called twice in
a row for the same info->sw_address. When the first call soft-offlines a pa=
ge
on its first error occurrence, the immediate second call sees -EEXIST from
xe_ttm_vram_handle_addr_fault():

drivers/gpu/drm/xe/xe_ras.c:handle_page_offline() {
	...
	case -EEXIST:
		if (xa_load(&state->offlined_pages, page_address >> XE_PTE_SHIFT))
			action =3D XE_RAS_PAGE_ACTION_REMOVE;
		else
			action =3D XE_RAS_PAGE_ACTION_OFFLINE;
	...
}

Wouldn't this cause the second call to treat a single first-occurrence ECC
error as a second occurrence and request XE_RAS_PAGE_ACTION_OFFLINE (or fail
in send_page_offline_cmd() and wedge the device)?

Also, note that xe_log_comp() evaluates ret ? cper_sev :
CPER_SEV_INFORMATIONAL, so if the first handle_page_offline() call is
removed, xe_log_comp() would either need to be moved after
handle_page_offline() or updated so it does not use an uninitialized ret.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103060929.1586=
783-9-riana.tauro@intel.com?part=3D7
