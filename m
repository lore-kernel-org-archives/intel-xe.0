Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C91C624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 16:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FFA89906;
	Wed,  2 Sep 2026 16:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Pq57KQ72";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2279289906
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 16:57:01 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6FFF56013A;
 Wed,  2 Sep 2026 16:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F104D1F000E9;
 Wed,  2 Sep 2026 16:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788368220;
 bh=YVhWU2DF3Xx0v1etRDMwVGp176JQzgzXMtxHqqmwqwo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Pq57KQ72XyizRcFm2uuMteaPEPSMfCrEsrH5AlFzFFGCgQVcZlwUMeFw9VdpiC/jO
 F8KiXR2vyF/cfLOtwwsGrQQixuzuQS8Bs5YW/M8/nfgVc2v08/FCpmeK1T7sivl1LR
 C5usVqitSoRQv46DNHgwDPttudKWV7anOnYE4xG8TVGCS/Sh2NlNVQ7Xk1hQoyjZ8k
 ePvEUdl2Kqqvu4be+YG57b5/oLo4VpkzvRboQWma1cqw+U3/1thIW3j2mSQ0UF5Ja/
 r1j4S0rJvxX27MxZLXQafCmYUFyq8nkC2AIpb/nXc6bMYh3wEJtQstHXcvWE118q8r
 mkas7yNS1haaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V20 13/15] drm/xe: Expose bad VRAM pages via debugfs
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260902145343.465686-30-tejas.upadhyay@intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
 <20260902145343.465686-30-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 16:56:59 +0000
Message-Id: <20260902165659.F104D1F000E9@smtp.kernel.org>
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
- [Low] Debugfs output computes GPU VRAM page frame numbers and sizes using=
 host CPU macros (PAGE_SHIFT and PAGE_SIZE), causing silent truncation and =
incorrect reporting on architectures with non-4K CPU pages.
- [Low] The VRAM max_pages limit is printed globally using only tile 0's ma=
nager, ignoring limits of other tiles on multi-tile devices.
--

commit c12841d073a619e5edeb8c8306adf6fd03042edd
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe: Expose bad VRAM pages via debugfs

This commit adds a debugfs file to show offlined and queued VRAM pages
across all tiles, displaying the page frame number, GPU page size, and
status flag.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index 00569c5279a83..d9da2454d968e 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c

[ ... ]

> @@ -917,3 +918,61 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *=
xe, u64 addr)
>  	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_m=
gr, mm);
>  }
>  EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
> +
> +static int vram_bad_pages_show(struct seq_file *m, void *unused)
> +{
> +	struct xe_device *xe =3D m->private;
> +	struct xe_ttm_vram_offline_resource *pos;
> +	struct ttm_resource_manager *man;
> +	struct xe_ttm_vram_mgr *mgr;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	man =3D ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
> +	if (man)
> +		/* TODO Hook with RAS to show max_pages fetched from FW */
> +		seq_printf(m, "max_pages: %d\n",
> +			   to_xe_ttm_vram_mgr(man)->max_pages);

[Severity: Low]
Does this correctly represent the limit for multi-tile devices?=20

By querying only the manager for XE_PL_VRAM0, it seems the max_pages
value is printed as a global limit, which might ignore independent
offline queue limits configured on subsequent tiles.

> +
> +	for_each_tile(tile, xe, id) {
> +		struct xe_vram_region *vr =3D tile->mem.vram;
> +
> +		man =3D ttm_manager_type(&xe->ttm, XE_PL_VRAM0 + id);
> +		if (!man || !vr)
> +			continue;
> +		mgr =3D to_xe_ttm_vram_mgr(man);
> +
> +		rcu_read_lock();
> +
> +		list_for_each_entry_rcu(pos, &mgr->offlined_pages, offlined_link) {
> +			u64 pfn;
> +
> +			pfn =3D (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
> +			seq_printf(m, "0x%016llx : 0x%016lx : R\n", pfn, PAGE_SIZE);

[Severity: Low]
Can this cause incorrect PFN calculation and page size reporting on
architectures with a non-4K CPU page size?=20

Using the host CPU macros PAGE_SHIFT and PAGE_SIZE to compute GPU VRAM=20
addresses couples the hardware memory topology to host CPU page boundaries.
On a system with 64K CPU pages, shifting the 4K-aligned GPU address by 16
truncates the lower 4 bits of the GPU PFN, and reports 64K as the VRAM page
size instead of 4K.

> +		}
> +
> +		list_for_each_entry_rcu(pos, &mgr->queued_pages, queued_link) {
> +			u64 pfn;
> +
> +			pfn =3D (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
> +			seq_printf(m, "0x%016llx : 0x%016lx : %c\n",
> +				   pfn, PAGE_SIZE, pos->status ? 'F' : 'P');

[Severity: Low]
This has the same PAGE_SHIFT and PAGE_SIZE host CPU macro coupling as
above, which may truncate the PFN and report the wrong size on non-4K CPU
architectures.

> +		}
> +
> +		rcu_read_unlock();
> +	}
> +
> +	return 0;
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902145343.4656=
86-17-tejas.upadhyay@intel.com?part=3D13
