Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6B1C61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 14:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527BA10E211;
	Wed, 26 Aug 2026 14:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JCmFCqOA";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD4710E211
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 14:13:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B17DB42A96;
 Wed, 26 Aug 2026 14:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D4E1F000E9;
 Wed, 26 Aug 2026 14:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787753598;
 bh=zGB0UPXWoXTsyIcHq0qL5+f+jir7ZBl4xMnxzT+In7Y=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JCmFCqOAB++b0BLZBgHyK473AorKPcGwJ/Xh83F/yHfk9LxD8VfT6J2pJNGaFDd7b
 4JV56XuFmYUrpxsqDH8CzOBoECfIfmY2Gjo/uYf/8LUfiLTHpiQSiKOqCkI9Ma9Vq2
 uzEIqtBaa3JjOZYqbBBtKVEqP8oPmOE0XZ7ER2bkoqQfLE4y+S7gnT3n46XA3R6El1
 kSxKsVDecvGMW8Nm9vF95nHBLDzN0HSEVeI6vvHS7iAwSl24RyAe2o/XZetRstst6O
 Xi+tvpyHH8V/sfwNAimfysIT0BLQPLskOIc461bxS0jLXP6ELuIygUDiUXhzDyfGXH
 hX4PWVrXE0kYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V18 12/14] drm/xe: Expose bad VRAM pages via debugfs
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260826135136.204044-28-tejas.upadhyay@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-28-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 14:13:17 +0000
Message-Id: <20260826141318.71D4E1F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Use-After-Free and data race due to lockless traversal of pos->blo=
cks.
- [Medium] TOCTOU race in xe_ttm_vram_reserve_page_at_addr leads to duplica=
te tracking entries and state inconsistency.
- [Low] The max_pages field is printed in debugfs but is never initialized =
or populated.
--

commit b60ddd8b2f9645ba022492a4803a15126cca2249
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: drm/xe: Expose bad VRAM pages via debugfs

This commit adds a debugfs file vram_bad_pages that shows offlined and
queued VRAM pages across all tiles. Each entry displays the page frame
number, GPU page size, and status flag.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
[ ... ]
> @@ -874,3 +875,68 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *=
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
> +	struct gpu_buddy_block *block;
> +	struct xe_ttm_vram_mgr *mgr;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	man =3D ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
> +	if (man)
> +		seq_printf(m, "max_pages: %d\n",
> +			   to_xe_ttm_vram_mgr(man)->max_pages);

[Severity: Low]
Is there a regression where max_pages is printed but never initialized?=20

It is defined in struct xe_ttm_vram_mgr and printed here, but it doesn't
appear to be assigned a value anywhere in the driver codebase.

Will this debugfs file always incorrectly output max_pages: 0?

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
> +			block =3D list_first_entry_or_null(&pos->blocks,
> +							 struct gpu_buddy_block, link);

[Severity: High]
In xe_ttm_vram_reserve_page_at_addr(), an entry is published to the
queued_pages list via list_add_rcu() before its blocks are populated:

xe_ttm_vram_reserve_page_at_addr() {
    ...
    ++vram_mgr->n_queued_pages;
    list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
    ...
}

If the subsequent buddy allocation fails halfway, it rolls back and frees
the blocks directly back to the slab allocator without respecting RCU grace
periods.=20

Additionally, gpu_buddy_alloc_blocks() modifies the list using standard
list_add and list_del rather than RCU-safe variants, which could create a
data race on the list pointers themselves.

Could an RCU reader here obtain a pointer to a block just as it is being
freed, resulting in a Use-After-Free regression when accessing the block
later?

> +			if (!block)
> +				continue;
> +
> +			seq_printf(m, "0x%016llx : 0x%016llx : R\n",
> +				   (gpu_buddy_block_offset(block) + vr->dpa_base) >> PAGE_SHIFT,
> +				   gpu_buddy_block_size(&mgr->mm, block));
> +		}
> +
> +		list_for_each_entry_rcu(pos, &mgr->queued_pages, queued_link) {

[Severity: Medium]
When xe_ttm_vram_reserve_page_at_addr() is called for an unallocated
address, it allocates nentry under the lock but drops the lock before
adding it to queued_pages:

xe_ttm_vram_reserve_page_at_addr() {
    scoped_guard(mutex, &vram_mgr->lock) {
        if (xe_ttm_vram_page_already_processed(vram_mgr, addr))
            return -EEXIST;
        ... if block is NULL, nentry is NOT added here ...
    }
   =20
    ... lock is dropped ...
   =20
    if (block) {
        ...
    } else {
        scoped_guard(mutex, &vram_mgr->lock) {
            ++vram_mgr->n_queued_pages;
            list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
            ...
        }
    }
}

Multiple concurrent faults on the same address could both bypass the
xe_ttm_vram_page_already_processed() check because neither added their
entry to the list yet.

Both threads would then reacquire the lock and add their nentry to
queued_pages. One might succeed (moving to offlined_pages) while the other
fails (staying in queued_pages).

Could this iteration encounter a regression with duplicate tracking entries
for the exact same physical address, resulting in conflicting states being
exposed here?

> +			u64 pfn, blk_size;
> +
> +			block =3D list_first_entry_or_null(&pos->blocks,
> +							 struct gpu_buddy_block, link);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826135136.2040=
44-16-tejas.upadhyay@intel.com?part=3D12
