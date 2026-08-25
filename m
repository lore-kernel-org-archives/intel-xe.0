Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A784EC61CE3
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6764889FA7;
	Tue, 25 Aug 2026 06:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QvgSKfF5";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946AF89FA7
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 06:52:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 092CB40996;
 Tue, 25 Aug 2026 06:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67211F000E9;
 Tue, 25 Aug 2026 06:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787640756;
 bh=m1E6alNTC7Exkoftdw9PKnrM0QaXTUu3OVMcvZAUSZQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=QvgSKfF5MDs5rU186hPUkTY9toKZDyDSRuxvJuZbRXOqx8RykRHwCc+8oRTZsfX9Y
 h98Lf4tH0VA4mx2oa0ZMqug/1g+VsC1maUwovxaFzywK+oaKuGIVhTm64YfHwEMfD7
 NjYL8DhnPm+y2EOY98f1zqC7lL/0iOUVaXhGT6UUJLIgv/fPqJKBsOPPKuzUFYWrwv
 8lQoQbOhJTTxnEYgNTfH23aZqZ21tDPanUzEg22AcO/3ISwqyGly8IimvC6uYGyrPl
 H7ATYwR/MzUVwGdX/5pbHf5tFptVwt8dCl1rzHBttZNQqKHAQO2xV8C0Fo0c7ZXdTR
 +oooQ7dGu0Qgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] drm/xe/xe_ras: Track offlined pages by firmware to
 avoid duplicates
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825063615.3697317-12-riana.tauro@intel.com>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
 <20260825063615.3697317-12-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:52:36 +0000
Message-Id: <20260825065236.B67211F000E9@smtp.kernel.org>
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
- [High] Using PAGE_SHIFT instead of a GPU-specific page shift causes multi=
ple 4KB GPU pages to map to the same XArray index on systems with larger CP=
U pages.
--

--- Patch [5]: [PATCH 5/5] drm/xe/xe_ras: Track offlined pages by firmware =
to avoid duplicates ---
commit a03c3279356ffe1e7132d6c4d017e5f44ae3cc0b
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/xe_ras: Track offlined pages by firmware to avoid duplicates

This commit adds an XArray to track pages that have been offlined by the
firmware to prevent issuing redundant page offline requests for the same
memory address.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 5303d1a4e485a..f0dac06f050b9 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c

[ ... ]

> @@ -244,6 +248,10 @@ static int send_page_offline_cmd(struct xe_device *x=
e, u64 page_address,
>  		return ret;
>  	}
> =20
> +	if (action =3D=3D XE_RAS_PAGE_ACTION_OFFLINE)
> +		xa_store(&ras->offlined_pages, page_address >> PAGE_SHIFT,
> +			 XE_RAS_PAGE_OFFLINED, GFP_KERNEL);
> +
>  	return ret;
>  }

[Severity: High]
Does using PAGE_SHIFT here cause aliasing on systems with larger CPU page
sizes?

If the CPU page size is larger than the GPU page size (for example, 64KB on
ARM64 vs 4KB XE_PAGE_SIZE), shifting by PAGE_SHIFT will truncate the lower
bits of the GPU physical address. This would cause multiple distinct 4KB GPU
pages to map to the exact same XArray index. Should this use a GPU-specific
page shift instead?

> @@ -287,7 +295,11 @@ static int handle_page_offline(struct xe_device *xe,=
 u64 page_address, bool send
>  			   "Physical page address belongs to critical BO: 0x%llx\n", page_add=
ress);
>  		return ret;
>  	case -EEXIST:
> -		action =3D XE_RAS_PAGE_ACTION_OFFLINE;
> +		if (xa_load(&xe->ras.offlined_pages, page_address >> PAGE_SHIFT))
> +			action =3D XE_RAS_PAGE_ACTION_DECLINE;
> +		else
> +			action =3D XE_RAS_PAGE_ACTION_OFFLINE;
> +

[Severity: High]
If aliasing occurs due to PAGE_SHIFT on 64KB CPU page architectures, could
this xa_load() falsely return a match?

If a subsequent ECC error occurs in a different 4KB GPU page but within the
same 64KB CPU page block, it appears this would return a false match. The
driver would then incorrectly decline the firmware's request to offline the
second page, allowing the system to continue using poisoned memory.

[ ... ]

> @@ -409,8 +421,11 @@ static void get_offlined_list(struct xe_device *xe)
>  			return;
>  		}
> =20
> -		for (i =3D 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
> +		for (i =3D 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++=
) {
>  			handle_page_offline(xe, response.page_addresses[i], false);
> +			xa_store(&ras->offlined_pages, response.page_addresses[i] >> PAGE_SHI=
FT,
> +				 XE_RAS_PAGE_OFFLINED, GFP_KERNEL);
> +		}

[Severity: High]
Similarly, syncing the initial list of offlined pages from firmware uses
PAGE_SHIFT here, which might suffer from the same address truncation issue.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825063615.3697=
317-7-riana.tauro@intel.com?part=3D5
