Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E81C5CFEE
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 17:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E150D10F0BF;
	Wed, 12 Aug 2026 17:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lHy4VP2+";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C5610EFAC
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 13:02:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DE7A260A85;
 Wed, 12 Aug 2026 13:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812FF1F000E9;
 Wed, 12 Aug 2026 13:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786539773;
 bh=NyrGKEhniS2DeSL6hLVGd3IpKT7kvyu58FcmBcE1e3w=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=lHy4VP2+veeYVT1lNj1q6xUh8YWT/Zu9U1LnHWtgqJO/f6YtL3q3OcQynV7PA0I85
 ZS134hzWrEjKGoKX6wX1fyw5PovZ4Oeys81BFYkHwwCP6vWjJXTO3oqW2U3YPcatEJ
 AOaAquTFTg8h146HAez6geIFntIm+U2X6TqVFkJ+zzU5wetf9XZn8PdjRFSYbFLL7o
 OsT6nGYHRsmmAvMvx/HM+JtXJSpbnH975GEp+b95R04v0zX8nxRWQjfV5mQvqkFx0+
 IZc3P7opWwIIywuY6bmdOlfdPUxeKzYujrfxGDAx7q1VzzksNH8Nq22cfbi6JCoZRP
 Y2ZUI9X91D2UA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/7] drm/xe/vf: Add bounds checking for queried VRAM
 size
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260812124313.1377582-15-satyanarayana.k.v.p@intel.com>
References: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
 <20260812124313.1377582-15-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 13:02:52 +0000
Message-Id: <20260812130253.812FF1F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 17:41:21 +0000
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
- [High] Missing upper bounds check for queried VRAM size
--

--- Patch [6]: [PATCH v6 6/7] drm/xe/vf: Add bounds checking for queried VR=
AM size ---
commit 2089489a65d04a75b7e07c3d3903caf61610c1eb
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

drm/xe/vf: Add bounds checking for queried VRAM size

This commit attempts to add checks for the VRAM size queried from the PF
to protect VF initialization from invalid configuration data.

> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_=
gt_sriov_vf.c
> index d805c064377c3..be932ebe6a8d0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -574,6 +574,12 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>  		return -EREMCHG;
>  	}
> =20
> +	if (!IS_ALIGNED(size, SZ_2M)) {
> +		xe_gt_sriov_err(gt, "Unaligned LMEM size %llu, expected %llu\n",
> +				size, ALIGN(size, SZ_2M));
> +		return -EINVAL;
> +	}
> +

[Severity: High]
This is a pre-existing issue, but the commit message states this patch adds
"bounds checking" to reject invalid configuration data, while this code
only implements an alignment check.

Does vf_get_lmem_info() also need an upper bounds check for the queried siz=
e?

If a misconfigured or compromised PF provides an artificially large VRAM
size, there doesn't appear to be a check against the VF's PCI LMEM BAR
size here. Could this unverified size propagate to vram->usable_size and
allow userspace to allocate VRAM beyond physical capacity, leading to
out-of-bounds memory accesses?

>  	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
>  	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812124313.1377=
582-9-satyanarayana.k.v.p@intel.com?part=3D6
