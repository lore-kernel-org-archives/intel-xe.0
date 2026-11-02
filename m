Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E35606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 12:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQf8ZKyt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA1E10EDA9;
	Mon,  2 Nov 2026 12:41:07 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B961D10EDA7
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 12:41:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6B26860612;
 Mon,  2 Nov 2026 12:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074601F00A1C;
 Mon,  2 Nov 2026 12:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793623259;
 bh=GKE/7WW1HNdFhT1ig25UjKwW72YxbPfW5ekSirB/W/Q=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=RQf8ZKyt5WEcVIfygUY+yi057JKlpCoojA/N7b+8/DuHq86+5TEF5ccJqAINU6H2/
 qB/dDiP9R4RRgzugge93GeJTVbl22sDpsZrQDqHgMtV7k8Ur3xxhw1ofef9Jr3Pk9S
 LUM1pcKG8EC8TPaZPjYQGF48fJ/eniTeGGK1MMYy4krzXCB8IfaKIAecR1+s7Ns3oT
 b1vouunmEgwRNpF7ZOkJt/LgdRAqnHhaC9ERK3o6U+Fx9ioWpCfOXAHNVArV2520uO
 fjbzgFU9C5s9tDpfGT38/qOmlKdRICsVOCXV0mJD85pNTJxg/YGMIbACPcFr4eY7Mg
 wauLfnnOf2gtw==
Message-ID: <sashiko-outbox-193439@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/vram: add decay-based reinstatement of
 soft-offlined VRAM pages
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261102122147.2361513-2-tejas.upadhyay@intel.com>
References: <20261102122147.2361513-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 12:40:58 +0000
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

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] drm/xe: permanent bad pages from get_offline_list() marked SOFT an=
d reinstated
- [High] drm/xe: queued pages not promoted to HARD on repeat fault
- [High] drm/xe: decay_gc_work not armed in xe_ttm_vram_retry_queued_pages()
- [Low] drm/xe: missing stub for xe_configfs_get_bad_page_decay_secs()
- [Low] drm/xe: xe_ttm_vram_decay_gc_worker() reschedules itself unconditio=
nally
- [Low] drm/xe: bad_page_decay_secs omitted from dump_custom_dev_config()
--

commit 46cc37a480016d26168ac9267631e7a2c7b48ce8
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/vram: add decay-based reinstatement of soft-offlined VRAM pages

This commit introduces a per-VRAM-manager delayed work timer to reinstate
soft-offlined VRAM pages after a configurable decay interval (defaulting to
24 hours via configfs bad_page_decay_secs) if no further faults occur at the
same address. It also adds soft/hard offline mode tracking to promote a page
from soft to permanent hard retirement upon a second fault.

> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index 2ddd707a6dbd3..110459b8980f4 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -305,6 +305,7 @@ struct xe_config_group_device {
>  		bool enable_psmi;
>  		bool enable_multi_queue;
>  		bool disable_vram_page_offline;
> +		u32 bad_page_decay_secs;
>  		struct {
>  			unsigned int max_vfs;
>  			bool admin_only_pf;
> @@ -327,6 +328,7 @@ static const struct xe_config_device device_defaults =
=3D {
>  	.enable_psmi =3D false,
>  	.enable_multi_queue =3D true,
>  	.disable_vram_page_offline =3D false,
> +	.bad_page_decay_secs =3D 24 * 60 * 60,
>  	.sriov =3D {
>  		.max_vfs =3D XE_DEFAULT_MAX_VFS,
>  		.admin_only_pf =3D XE_DEFAULT_ADMIN_ONLY_PF,

[Severity: Low]
When bad_page_decay_secs is modified via configfs, xe_configfs_check_device=
()
detects the change in struct xe_config_device via memcmp() and invokes
dump_custom_dev_config(), which currently only prints:

drivers/gpu/drm/xe/xe_configfs.c:dump_custom_dev_config() {
	...
	PRI_CUSTOM_ATTR("%d", enable_psmi);
	PRI_CUSTOM_ATTR("%d", disable_vram_page_offline);
	PRI_CUSTOM_ATTR("%d", survivability_mode);
	...
}

Should dump_custom_dev_config() also include PRI_CUSTOM_ATTR("%u",
bad_page_decay_secs) so that non-default decay settings are logged alongside
the other custom attributes?

[ ... ]

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

[Severity: Low]
Will building with CONFIG_DRM_XE enabled and !IS_REACHABLE(CONFIG_CONFIGFS_=
FS)
fail in __xe_ttm_vram_mgr_init()?

In drivers/gpu/drm/xe/xe_configfs.h, xe_configfs_get_bad_page_decay_secs() =
is
declared inside the #if IS_REACHABLE(CONFIG_CONFIGFS_FS) block, but no stat=
ic
inline fallback stub was added to the corresponding #else block:

drivers/gpu/drm/xe/xe_configfs.h:
#else
...
static inline u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pd=
ev) { return 5; }
static inline bool xe_configfs_get_disable_vram_page_offline(struct pci_dev=
 *pdev) { return false; }
static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,

Meanwhile, __xe_ttm_vram_mgr_init() in drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
calls xe_configfs_get_bad_page_decay_secs() unconditionally, and
XE_BAD_PAGE_DECAY_SECS_DEFAULT in drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
is left unused. Should a static inline stub returning
XE_BAD_PAGE_DECAY_SECS_DEFAULT (and using that macro in device_defaults) be
added when configfs is not reachable?

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
> +
> +		list_del(&pos->offlined_link);
> +		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
> +		--mgr->n_offlined_pages;
> +		drm_info(&xe->drm,
> +			 "decay: reinstated soft-offlined page 0x%llx\n",
> +			 pos->addr);
> +		kfree(pos);
> +	}
> +
> +reschedule:
> +	schedule_delayed_work(&mgr->decay_gc_work,
> +			      xe_ttm_vram_decay_gc_period(mgr));
> +	mutex_unlock(&mgr->lock);
> +}

[Severity: Low]
Does xe_ttm_vram_decay_gc_worker() need to reschedule mgr->decay_gc_work
unconditionally once it has been started?

After all XE_PAGE_OFFLINE_SOFT entries in mgr->offlined_pages have been
reinstated (or promoted to XE_PAGE_OFFLINE_HARD), or if!decay is taken,
jumping to reschedule keeps re-arming mgr->decay_gc_work every period until
driver teardown. Should the worker only reschedule itself when decay is
non-zero and at least one XE_PAGE_OFFLINE_SOFT entry still remains?

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

[Severity: High]
As reported by Sashiko on RFC [1], what happens if a second hardware fault =
is
reported for the same address while the page's reservation is still deferred
on mgr->queued_pages?

In xe_ttm_vram_page_already_processed(), the second loop checks
mgr->queued_pages:

	list_for_each_entry(pos, &mgr->queued_pages, queued_link) {
		if (pos->addr =3D=3D addr)
			return true;
	}

When a page was allocated to a BO at the time of the first fault (or its
buddy block was still busy), xe_ttm_vram_reserve_page_at_addr() places nent=
ry
on mgr->queued_pages with mode =3D XE_PAGE_OFFLINE_SOFT while
xe_ttm_vram_purge_page() / TTM ghost object cleanup is still in flight.

If a second fault arrives before xe_ttm_vram_mgr_del() calls
xe_ttm_vram_retry_queued_pages(), xe_ttm_vram_page_already_processed() finds
the entry on mgr->queued_pages and returns true without promoting pos->mode
to XE_PAGE_OFFLINE_HARD or updating pos->last_seen. Once
xe_ttm_vram_retry_queued_pages() moves that entry to mgr->offlined_pages,
won't it remain in XE_PAGE_OFFLINE_SOFT mode and be reinstated after the
decay interval despite having faulted twice and being permanently retired in
firmware by handle_page_offline()?

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

[Severity: High]
Won't this also mark permanently retired pages loaded from firmware at driv=
er
probe as XE_PAGE_OFFLINE_SOFT and reinstate them after the decay window?

During probe, xe_ras_init() -> get_offline_list() -> process_offline_pages()
queries firmware for pages that were permanently retired on prior boots and
calls handle_page_offline(xe, common->page_addresses[i], false) once per
address:

drivers/gpu/drm/xe/xe_ras.c:process_offline_pages() {
	...
	for (i =3D 0; i < common->pages_returned && i < XE_RAS_NUM_PAGES; i++) {
		handle_page_offline(xe, common->page_addresses[i], notify_fw);
		/* The pages are already offlined by firmware */
		if (!notify_fw) {
			index =3D common->page_addresses[i] >> XE_PTE_SHIFT;
			ret =3D xa_err(xa_store(&state->offlined_pages, index,
					      XE_RAS_PAGE_OFFLINED, GFP_KERNEL));
	...
}

Because handle_page_offline() -> xe_ttm_vram_handle_addr_fault() ->
xe_ttm_vram_reserve_page_at_addr() is only called once per address at boot
when vram_mgr->offlined_pages is empty, nentry->mode is set to
XE_PAGE_OFFLINE_SOFT and decay_gc_work is scheduled. Once bad_page_decay_se=
cs
elapses, xe_ttm_vram_decay_gc_worker() will free those permanently retired
pages back into the VRAM buddy allocator.

Should pages retired with notify_fw =3D=3D false (or where firmware retirem=
ent has
already occurred) be initialized as XE_PAGE_OFFLINE_HARD?

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

[Severity: High]
As reported by Sashiko on RFC [2], if a faulty page is currently allocated =
to
a BO (block !=3D NULL) or xe_ttm_vram_buddy_alloc() fails because the block=
 is
still busy, xe_ttm_vram_reserve_page_at_addr() queues nentry onto
vram_mgr->queued_pages without scheduling vram_mgr->decay_gc_work.

Later, when the BO is freed in xe_ttm_vram_mgr_del(),
xe_ttm_vram_retry_queued_pages() reserves the buddy block and moves the ent=
ry
to mgr->offlined_pages:

drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:xe_ttm_vram_retry_queued_pages() {
	...
		--mgr->n_queued_pages;
		list_del(&pos->queued_link);
		++mgr->n_offlined_pages;
		list_add(&pos->offlined_link, &mgr->offlined_pages);
	}
}

Because xe_ttm_vram_retry_queued_pages() never schedules mgr->decay_gc_work,
won't soft-offlined pages that faulted while in use stay offline forever
unless an unallocated page happens to fault separately on the same manager?

[1] https://lore.kernel.org/r/20260911094616.1333590-2-tejas.upadhyay@intel=
.com
[2] https://lore.kernel.org/r/20260911094616.1333590-2-tejas.upadhyay@intel=
.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102122147.2361=
513-2-tejas.upadhyay@intel.com?part=3D1
