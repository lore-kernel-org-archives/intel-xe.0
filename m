Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE49606A887
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 12:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R/rtrH+3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAF51120F3;
	Thu, 12 Nov 2026 12:56:04 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875021120F3
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 12:55:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A9E8F61CFC;
 Thu, 12 Nov 2026 12:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB7E1F00A05;
 Thu, 12 Nov 2026 12:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794488156;
 bh=IpbJeKHHx55ATaEcQFlAioULFRpPel4bng3Ki9Tx7Lk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=R/rtrH+3l7wkak0OX0JoG7FNPkXbm79nEikGfx9MLTjD+dFp/76QzeBZ+9gLxbeno
 /mpuRQgPLVN6JvfLICny6+fd7CItpqeAdYeZKBnuW/r7iz6dS28NVlE4O2y2oK9jZ2
 nbwFRlXsh0OjsVHE4yEwGE8zE1hmxAGkmtTOfEi+M7z17yLO3W3hAqk+asxaXHgPBa
 SwEJa9ulSRn5LAYON66aR0Iu964RQYeK3abgZS8pvuJF13FquMJ6u9WF+yTynElLEn
 obCWHuChPYKREpTrn00vn5Wt6g7FCv/8u1TPSp7umPVzj7J/Do2QHuribZTXKphQQz
 V/1iFdOvPJZ5A==
Message-ID: <sashiko-outbox-211122@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 3/3] drm/xe/vram: stop decay worker from rescheduling
 itself forever
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261112124329.2960272-8-tejas.upadhyay@intel.com>
References: <20261112124329.2960272-5-tejas.upadhyay@intel.com>
 <20261112124329.2960272-8-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 12:55:55 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/xe/vram: soft-offlined pages via queued_pages never arm
  decay_gc_work
--

commit 22ff2c502172a757420f34aa8acb6ee7e2f6e05c
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/vram: stop decay worker from rescheduling itself forever

This commit changes xe_ttm_vram_decay_gc_worker() to only reschedule
mgr->decay_gc_work when XE_PAGE_OFFLINE_SOFT entries remain on
mgr->offlined_pages after a sweep.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index 07360ab7b0722..7613024a1410a 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -373,17 +373,20 @@ static void xe_ttm_vram_decay_gc_worker(struct work=
_struct *work)
>  	struct xe_device *xe =3D ttm_to_xe_device(mgr->manager.bdev);
>  	unsigned long now =3D jiffies;
>  	unsigned long decay;
> +	bool soft_remaining =3D false;
> =20
>  	mutex_lock(&mgr->lock);
>  	decay =3D mgr->decay_interval_jiffies;
>  	if (!decay)
> -		goto reschedule;
> +		goto unlock;
> =20
>  	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
>  		if (pos->mode !=3D XE_PAGE_OFFLINE_SOFT)
>  			continue;
> -		if (!time_after(now, pos->last_seen + decay))
> +		if (!time_after(now, pos->last_seen + decay)) {
> +			soft_remaining =3D true;
>  			continue;
> +		}
> =20
>  		list_del(&pos->offlined_link);
>  		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
> @@ -394,9 +397,11 @@ static void xe_ttm_vram_decay_gc_worker(struct work_=
struct *work)
>  		kfree(pos);
>  	}
> =20
> -reschedule:
> -	schedule_delayed_work(&mgr->decay_gc_work,
> -			      xe_ttm_vram_decay_gc_period(mgr));
> +	/* Nothing left to track; re-armed on demand when a new SOFT entry appe=
ars */
> +	if (soft_remaining)
> +		schedule_delayed_work(&mgr->decay_gc_work,
> +				      xe_ttm_vram_decay_gc_period(mgr));
> +unlock:
>  	mutex_unlock(&mgr->lock);
>  }

[Severity: Medium]
Can soft-offlined pages that go through mgr->queued_pages be left on
mgr->offlined_pages forever without arming mgr->decay_gc_work?

In xe_ttm_vram_reserve_page_at_addr(), schedule_delayed_work() is only
called when block is NULL and xe_ttm_vram_buddy_alloc() succeeds
immediately.  When a transient fault hits an allocated page, nentry is
placed on vram_mgr->queued_pages while the owning BO is purged, and
xe_ttm_vram_retry_queued_pages() later moves it to mgr->offlined_pages
without scheduling the worker:

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

Once mgr->decay_gc_work is idle (either because no free page was offlined
earlier, or because xe_ttm_vram_decay_gc_worker() ran while the entry was
still on mgr->queued_pages), any XE_PAGE_OFFLINE_SOFT entry promoted via
xe_ttm_vram_retry_queued_pages() will never decay and remains offlined
until driver unbind.  Arming mgr->decay_gc_work in
xe_ttm_vram_retry_queued_pages() when a XE_PAGE_OFFLINE_SOFT entry is
moved to mgr->offlined_pages would avoid this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112124329.2960=
272-5-tejas.upadhyay@intel.com?part=3D3
