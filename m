Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9BD606A335
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 12:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xq6PkC8c
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E85A1120DB;
	Thu, 12 Nov 2026 12:54:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9641120DB
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 12:54:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 663AE414F5;
 Thu, 12 Nov 2026 12:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F88A1F00A05;
 Thu, 12 Nov 2026 12:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794488043;
 bh=URmBd1EO4U51/tmXQdejeVa76XQyG/EMRhMvuvH3wHY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Xq6PkC8csaXLZEs7KIhHd5SauyuRlW4xShrKFY7bMeOp0SBS6h2yD23RWw8zG0ev6
 aWCu3hdVcrPumQr+UtYME2PwD/cKoXhTTx+cR+fAv8nP573/JPyWdUg7BLAWJaor9F
 6qSwDRMjA57tcfIr5ibor5xaARXR7fzs+MnBO5EoWjvLabj5Cj4E+p/wzfx1kQWsT2
 RxPkiHvkEQKHHnf7u+53af+h69h3GujCw7BUsu09ngwb7xSNXWaLcQmYkmWPrZkwg8
 KtMigasHgrVXg3M4XV7ef4xFCtijjI5mnG7oPWYL7kftAtgCEMUm0rS18SSN1tzemI
 948weSi03xxbQ==
Message-ID: <sashiko-outbox-211118@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 2/3] drm/xe/vram: don't let firmware-confirmed
 permanent bad pages decay back in
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261112124329.2960272-7-tejas.upadhyay@intel.com>
References: <20261112124329.2960272-5-tejas.upadhyay@intel.com>
 <20261112124329.2960272-7-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 12:54:02 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] drm/xe/vram: queued pages not promoted to HARD on repeat
  fault
- [Medium] drm/xe/vram: decay_gc_work not scheduled in
  xe_ttm_vram_retry_queued_pages()
- [Low] drm/xe/vram: missing @permanent kernel-doc on
  xe_ttm_vram_handle_addr_fault()
--

commit 49821b1409082008ca85432821b443bc32f84c8f
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/vram: don't let firmware-confirmed permanent bad pages decay back in

This commit threads a permanent flag through xe_ttm_vram_handle_addr_fault()
to xe_ttm_vram_reserve_page_at_addr() so pages loaded from firmware's
non-volatile offline list are marked XE_PAGE_OFFLINE_HARD and excluded from
soft-offline decay reinstatement.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index ed0ca5f2b1449..07360ab7b0722 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -837,7 +837,8 @@ static struct xe_bo *xe_ttm_vram_block_owner_get(stru=
ct xe_device *xe,
>  }
> =20
>  static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 ad=
dr,
> -					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
> +					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm,
> +					    bool permanent)
>  {
>  	struct xe_ttm_vram_offline_resource *nentry;
>  	struct xe_bo *pbo_to_put =3D NULL;
> @@ -859,7 +860,11 @@ static int xe_ttm_vram_reserve_page_at_addr(struct x=
e_device *xe, u64 addr,
>  		INIT_LIST_HEAD(&nentry->blocks);
>  		nentry->status =3D XE_PAGE_RESERVE_PENDING;
>  		nentry->addr =3D addr;
> -		nentry->mode =3D XE_PAGE_OFFLINE_SOFT;
> +		/*
> +		 * Pages reloaded from firmware's non-volatile permanent list are
> +		 * already confirmed bad by a prior boot; never let them decay back in.
> +		 */
> +		nentry->mode =3D permanent ? XE_PAGE_OFFLINE_HARD : XE_PAGE_OFFLINE_SO=
FT;

[Severity: Medium]
Does a repeat fault on a page that is still on vram_mgr->queued_pages leave
pos->mode as XE_PAGE_OFFLINE_SOFT even though firmware permanently retires
the page?

When a non-permanent fault hits an active BO, nentry is queued on
vram_mgr->queued_pages as XE_PAGE_OFFLINE_SOFT until the BO's resource is
freed.  If a second fault arrives for the same address before
xe_ttm_vram_mgr_del() runs, xe_ttm_vram_page_already_processed() matches on
mgr->queued_pages without promoting pos->mode:

drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:xe_ttm_vram_page_already_processed() {
	list_for_each_entry(pos, &mgr->offlined_pages, offlined_link) {
		if (pos->addr =3D=3D addr) {
			if (pos->mode =3D=3D XE_PAGE_OFFLINE_SOFT)
				pos->mode =3D XE_PAGE_OFFLINE_HARD;
			pos->last_seen =3D jiffies;
			return true;
		}
	}

	list_for_each_entry(pos, &mgr->queued_pages, queued_link) {
		if (pos->addr =3D=3D addr)
			return true;
	}
}

handle_page_offline() receives -EEXIST and sends XE_RAS_PAGE_ACTION_OFFLINE
to permanently retire the page in firmware, but when
xe_ttm_vram_retry_queued_pages() later moves the entry to
mgr->offlined_pages, it remains XE_PAGE_OFFLINE_SOFT and will be reinstated
by xe_ttm_vram_decay_gc_worker().

>  		nentry->last_seen =3D jiffies;
> =20
>  		if (block) {
> @@ -900,7 +905,7 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe=
_device *xe, u64 addr,
>  			}
>  			++vram_mgr->n_offlined_pages;
>  			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
> -			if (vram_mgr->decay_interval_jiffies &&
> +			if (!permanent && vram_mgr->decay_interval_jiffies &&
>  			    !delayed_work_pending(&vram_mgr->decay_gc_work)) {
>  				schedule_delayed_work(&vram_mgr->decay_gc_work,
>  						      xe_ttm_vram_decay_gc_period(vram_mgr));

[Severity: Medium]
Should xe_ttm_vram_retry_queued_pages() also schedule vram_mgr->decay_gc_wo=
rk
when moving a soft-offlined entry onto mgr->offlined_pages?

When a runtime fault hits an allocated page (block !=3D NULL), nentry is ad=
ded
to vram_mgr->queued_pages without starting decay_gc_work, and
xe_ttm_vram_retry_queued_pages() later moves it to mgr->offlined_pages
without scheduling the worker either:

drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:xe_ttm_vram_retry_queued_pages() {
	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
		if (xe_ttm_vram_buddy_alloc(mgr, pos->addr, pos->addr + PAGE_SIZE,
					    PAGE_SIZE, PAGE_SIZE, &pos->blocks,
					    GPU_BUDDY_RANGE_ALLOCATION, NULL,
					    &pos->used_visible_size)) {
			pos->status =3D XE_PAGE_RESERVE_FAIL;
			continue;
		}
		--mgr->n_queued_pages;
		list_del(&pos->queued_link);
		++mgr->n_offlined_pages;
		list_add(&pos->offlined_link, &mgr->offlined_pages);
	}
}

Because probe-time permanent pages no longer start decay_gc_work, soft-offl=
ine
faults on allocated BOs will never start the decay timer unless an unrelated
fault happens to hit an unallocated page.

> @@ -986,7 +991,7 @@ static struct xe_vram_region *xe_ttm_vram_addr_to_reg=
ion(struct xe_device *xe, u
>   * pending if the blocks backing it could not be freed immediately; the
>   * reservation is then completed from xe_ttm_vram_mgr_del().
>   */
> -int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
> +int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr, bool p=
ermanent)

[Severity: Low]
The kernel-doc comment above xe_ttm_vram_handle_addr_fault() documents @xe
and @addr, but does not include the new @permanent parameter, which triggers
a kernel-doc warning under W=3D1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112124329.2960=
272-5-tejas.upadhyay@intel.com?part=3D2
