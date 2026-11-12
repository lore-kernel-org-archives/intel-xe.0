Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3552D606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 13:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oM6uLllo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA2510E605;
	Thu, 12 Nov 2026 13:03:22 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8529410E605
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 13:03:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C56E563219;
 Thu, 12 Nov 2026 13:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F17B1F00A05;
 Thu, 12 Nov 2026 13:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794488595;
 bh=xEPLRE4nSl2nwm2cNXMgKj4BVE619Wv9/EJb5Qumhag=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=oM6uLllob5WGwGY3sQl5/h4oIs+XOfWSbxe3qxdtZsPWa3DaqlPegGjRHN5LYV2oq
 iYbz6I9cE/+JsaY1qO4Fl33HXEdfSKK1W5b0tda6Kkh/n3PbZhZAm4RyH0dppkuFcJ
 bW3IQsTIsR577GjhxzVJnBnqQXR3XKj2+A6eHvi2cVGzkpZO3JzrRtzg61kfkb1bBP
 5k7l7rVbIzG+//w7LNbTqeQO2vPVq47QJ9DnCIgSS8oMnRUHbS5T7AYu9p6plZwxT7
 +G11+so9Fr3CuoX6mE0NZjCf7/RpIyJeV3Oq78MJBWOa8LLGwtF9zIgtZxlRXOiWzb
 b54OiTDFrdroA==
Message-ID: <sashiko-outbox-211135@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 1/3] drm/xe/vram: add decay-based reinstatement of
 soft-offlined VRAM pages
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261112124329.2960272-6-tejas.upadhyay@intel.com>
References: <20261112124329.2960272-5-tejas.upadhyay@intel.com>
 <20261112124329.2960272-6-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 13:03:15 +0000
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

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] drm/xe: missing configfs stub for
  xe_configfs_get_bad_page_decay_secs()
- [Medium] drm/xe: missing decay_gc_work scheduling in
  xe_ttm_vram_retry_queued_pages()
- [Medium] drm/xe: queued pages not promoted to HARD on repeat VRAM
  fault
- [Low] drm/xe: xe_ttm_vram_decay_gc_period() clamps period above
  configured decay
--

commit 09a44ea2bd1a1ebe78a3a684e47f0dc29c05f989
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/vram: add decay-based reinstatement of soft-offlined VRAM pages

This commit adds a per-VRAM-manager delayed work timer to reinstate
soft-offlined VRAM pages after a configurable decay interval, while
promoting pages with repeat faults to permanent hard retirement.

> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_con=
figfs.h
> index 327b648944ffa..406b722247020 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -26,6 +26,7 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>  bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
>  u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev);
>  bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev);
> +u32 xe_configfs_get_bad_page_decay_secs(struct pci_dev *pdev);
>  u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>  				       enum xe_engine_class class,
>  				       const u32 **cs);

[Severity: High]
Does this break the build when CONFIG_CONFIGFS_FS is not reachable?

__xe_ttm_vram_mgr_init() calls xe_configfs_get_bad_page_decay_secs()
unconditionally, but xe_configfs.h only declares it inside the
#if IS_REACHABLE(CONFIG_CONFIGFS_FS) block without a static inline stub in
the #else branch.  Also, XE_BAD_PAGE_DECAY_SECS_DEFAULT is added in
xe_ttm_vram_mgr_types.h but never used (device_defaults in xe_configfs.c
open-codes 24 * 60 * 60).

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index 36d47de8b11ba..ed0ca5f2b1449 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -355,6 +355,51 @@ static const struct ttm_resource_manager_func xe_ttm=
_vram_mgr_func =3D {
>  	.debug	=3D xe_ttm_vram_mgr_debug
>  };
> =20
> +static unsigned long xe_ttm_vram_decay_gc_period(struct xe_ttm_vram_mgr =
*mgr)
> +{
> +	unsigned long period =3D mgr->decay_interval_jiffies / 8;
> +
> +	if (period < msecs_to_jiffies(60 * 1000))
> +		period =3D msecs_to_jiffies(60 * 1000);
> +	return period;
> +}
> +
> +static void xe_ttm_vram_decay_gc_worker(struct work_struct *work)
> +{
> +	struct xe_ttm_vram_mgr *mgr =3D container_of(to_delayed_work(work),
> +						   struct xe_ttm_vram_mgr,
> +						   decay_gc_work);
> +	struct xe_ttm_vram_offline_resource *pos, *n;
> +	struct xe_device *xe =3D ttm_to_xe_device(mgr->manager.bdev);
> +	unsigned long now =3D jiffies;
> +	unsigned long decay;
> +
> +	mutex_lock(&mgr->lock);
> +	decay =3D mgr->decay_interval_jiffies;
> +	if (!decay)
> +		goto reschedule;
> +
> +	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
> +		if (pos->mode !=3D XE_PAGE_OFFLINE_SOFT)
> +			continue;
> +		if (!time_after(now, pos->last_seen + decay))
> +			continue;

[Severity: Low]
When bad_page_decay_secs is configured between 1 and 59 seconds, does
xe_ttm_vram_decay_gc_period() delay reinstatement to at least 60 seconds?

xe_ttm_vram_decay_gc_period() clamps period up to 60 seconds without
capping it at mgr->decay_interval_jiffies.  In addition, when
bad_page_decay_secs is 60 seconds, period equals decay, so if the worker
runs on the exact expiration tick (now =3D=3D pos->last_seen + decay), the
strict time_after() check evaluates to false and defers reinstatement for
another 60 seconds.

[ ... ]

> @@ -725,8 +776,12 @@ static bool xe_ttm_vram_page_already_processed(struc=
t xe_ttm_vram_mgr *mgr,
>  	lockdep_assert_held(&mgr->lock);
> =20
>  	list_for_each_entry(pos, &mgr->offlined_pages, offlined_link) {
> -		if (pos->addr =3D=3D addr)
> +		if (pos->addr =3D=3D addr) {
> +			if (pos->mode =3D=3D XE_PAGE_OFFLINE_SOFT)
> +				pos->mode =3D XE_PAGE_OFFLINE_HARD;
> +			pos->last_seen =3D jiffies;
>  			return true;
> +		}
>  	}
> =20
>  	list_for_each_entry(pos, &mgr->queued_pages, queued_link) {

[Severity: Medium]
Should a repeat fault matching an entry on mgr->queued_pages also promote
pos->mode to XE_PAGE_OFFLINE_HARD and update pos->last_seen?

When a fault hits an allocated or busy page, the entry is placed on
mgr->queued_pages with XE_PAGE_OFFLINE_SOFT until the owning BO is freed.
If a second fault arrives at the same address before
xe_ttm_vram_retry_queued_pages() moves it to mgr->offlined_pages, the
mgr->queued_pages loop returns true (causing handle_page_offline() in
xe_ras.c to see -EEXIST and permanently retire the page in firmware via
XE_RAS_PAGE_ACTION_OFFLINE), but leaves pos->mode as XE_PAGE_OFFLINE_SOFT
so xe_ttm_vram_decay_gc_worker() will later reinstate the page into the
buddy allocator.

> @@ -804,6 +859,8 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe=
_device *xe, u64 addr,
>  		INIT_LIST_HEAD(&nentry->blocks);
>  		nentry->status =3D XE_PAGE_RESERVE_PENDING;
>  		nentry->addr =3D addr;
> +		nentry->mode =3D XE_PAGE_OFFLINE_SOFT;
> +		nentry->last_seen =3D jiffies;
> =20
>  		if (block) {
>  			pbo =3D xe_ttm_vram_block_owner_get(xe, block);
> @@ -843,6 +900,11 @@ static int xe_ttm_vram_reserve_page_at_addr(struct x=
e_device *xe, u64 addr,
>  			}
>  			++vram_mgr->n_offlined_pages;
>  			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
> +			if (vram_mgr->decay_interval_jiffies &&
> +			    !delayed_work_pending(&vram_mgr->decay_gc_work)) {
> +				schedule_delayed_work(&vram_mgr->decay_gc_work,
> +						      xe_ttm_vram_decay_gc_period(vram_mgr));
> +			}
>  			return ret;
>  		}
>  	}

[Severity: Medium]
Will soft-offlined pages that were allocated to a BO at fault time ever
schedule decay_gc_work?

When block is non-NULL (or when xe_ttm_vram_buddy_alloc() defers a busy
page), nentry is placed on vram_mgr->queued_pages and later moved to
mgr->offlined_pages by xe_ttm_vram_mgr_del() ->
xe_ttm_vram_retry_queued_pages():

drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:xe_ttm_vram_retry_queued_pages() {
    ...
		--mgr->n_queued_pages;
		list_del(&pos->queued_link);
		++mgr->n_offlined_pages;
		list_add(&pos->offlined_link, &mgr->offlined_pages);
	}
}

Because xe_ttm_vram_retry_queued_pages() does not schedule
mgr->decay_gc_work, any soft-offlined page that passes through
queued_pages will stay offline permanently unless an unallocated page also
faults and starts the worker.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112124329.2960=
272-5-tejas.upadhyay@intel.com?part=3D1
