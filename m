Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F11C61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 09:18:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A677510E79B;
	Mon, 31 Aug 2026 09:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GAKmxXZ3";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D6C10E79B
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 09:18:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1693260120;
 Mon, 31 Aug 2026 09:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4EA1F000E9;
 Mon, 31 Aug 2026 09:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788167892;
 bh=aIQ/akv3lyNNqzM/P4540eSm/4cKXz5jmuyn16UydUU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=GAKmxXZ38VwGZUGS3gTXQ/0x7XLK3CcIutZCw1xqYC3b8Kzq0Gr3Dw8XR+F0GgR/G
 snQdng49dG6x/5HzbC1WW3z8+LIdATh0K6S59mzZFY8xWwTOzh26KL1iWxt3AJ7uHJ
 sPCHYPs+fZZVFDqVNA1B5U0tPDTR/3pcQFH/n2lqfl765GbvGbSwMIIqYCEnAvv2fy
 LJ9WditW9d7YPZ8/nOm7hFt2jFsUFlvfpUbbqhrLbU/xBfV2qAvTVfQl5ks/tsfCui
 avQP4JbFjrPQmDIScPl/mZxs2AOLb9iJAh+cbIygkAP4DZ4UvuxBQ8+pnU0koh0Cx+
 0zTTpHYoZWUYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V19 13/15] drm/xe: Expose bad VRAM pages via debugfs
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831064942.315720-30-tejas.upadhyay@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-30-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 09:18:12 +0000
Message-Id: <20260831091812.9D4EA1F000E9@smtp.kernel.org>
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
- [Medium] Incorrect PFN calculation and page size reporting on architectur=
es with non-4KB CPU pages.
--

commit 582114b5c95fb63375e25846ac38204e4e81d526
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe: Expose bad VRAM pages via debugfs

This commit adds a debugfs file vram_bad_pages that displays offlined
and queued VRAM pages across all tiles.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index 286c866f1d581..456ea78a31e2a 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
[ ... ]
> @@ -845,3 +846,61 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *=
xe, u64 addr)
> +static int vram_bad_pages_show(struct seq_file *m, void *unused)
> +{
[ ... ]
> +		list_for_each_entry_rcu(pos, &mgr->offlined_pages, offlined_link) {
> +			u64 pfn;
> +
> +			pfn =3D (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
> +			seq_printf(m, "0x%016llx : 0x%016lx : R\n", pfn, PAGE_SIZE);
> +		}
> +
> +		list_for_each_entry_rcu(pos, &mgr->queued_pages, queued_link) {
> +			u64 pfn;
> +
> +			pfn =3D (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
> +			seq_printf(m, "0x%016llx : 0x%016lx : %c\n",
> +				   pfn, PAGE_SIZE, pos->status ? 'F' : 'P');
> +		}

[Severity: Medium]
Will this calculate and report incorrect page frame numbers (PFN) and page
sizes on architectures with non-4KB CPU pages?

On systems where CPU page size is greater than 4KB (such as ARM64 with 64KB
pages), using PAGE_SHIFT and PAGE_SIZE in vram_bad_pages_show() will trunca=
te
the 4KB-aligned address bits and display the CPU page size instead of the
intended GPU page size, breaking diagnostic statistics.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831064942.3157=
20-17-tejas.upadhyay@intel.com?part=3D13
