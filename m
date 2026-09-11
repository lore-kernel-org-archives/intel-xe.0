Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4088C88E4C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 10:05:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A003210E3AF;
	Fri, 11 Sep 2026 10:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HZ9uobY6";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2245710E3AF
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 10:05:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A74F940952;
 Fri, 11 Sep 2026 10:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED421F000FF;
 Fri, 11 Sep 2026 10:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789121151;
 bh=iZDUfKKG6cZhcxd9eBghU9RVJMva+1RAgyLKtSg9FTw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=HZ9uobY6dSr7a0AIsuPxBRRllcYaYI1XdEITl+fynJOnqRnilfv3CfgXK8XIwwxo6
 2Ri5NGAyOpV0fzLZ5B7KG6S681NMa0bkWHrDFWMQLSzzvzyVVm1cKu17zujMdtrkYy
 PFt7chvILX1DtM2r0BsYwjEUL0d81EgHGbapoZWMKfophNKRM8IvXtfD0XkGL8uftV
 a2xBGRsbyUQOrspgz4pomDDinzoFFr53jDJf4kcLVTG7Yl0r6nmSGEpa9LpWe2HJ+6
 nNVRxb9td7BQieFi/ddt1f9TNcMSY7Gb9aGq1qnT01cJslMWCWSZA1ZgyEXjsiS8SX
 eSwmZd6/jSWJQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] drm/xe/vram: add decay-based reinstatement of
 soft-offlined VRAM pages
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260911094616.1333590-2-tejas.upadhyay@intel.com>
References: <20260911094616.1333590-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 10:05:50 +0000
Message-Id: <20260911100551.5ED421F000FF@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Secondary faults on queued pages are ignored, failing to promote t=
hem to HARD offline mode or update their timestamp.
- [High] The decay timer is not armed when queued pages are successfully so=
ft-offlined, potentially leaving them offline forever.
- [Medium] The new configfs parameter 'bad_page_decay_secs' is ignored, cau=
sing the decay timer to always use the hardcoded default.
- [Low] Decay intervals larger than MAX_JIFFY_OFFSET will cause pages to be=
 instantly reinstated due to time_after() wrap-around on 32-bit platforms.
--

commit 2fea07001f29f1688568140a8cffb0e02a08838d
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/vram: add decay-based reinstatement of soft-offlined VRAM pages

This commit introduces a decay timer for soft-offlined VRAM pages, allowing
them to be reinstated after a configurable period without further faults.
It adds tracking for soft/hard offline modes, promoting pages to hard
offline on a second fault. Configuration is exposed via configfs.

> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index f5c828cf7e8f2..d866eb93f05ff 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
[ ... ]
> +static ssize_t bad_page_decay_secs_store(struct config_item *item, const=
 char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev =3D to_xe_config_group_device(item);
> +	u32 val;
> +	int ret;
> +
> +	ret =3D kstrtou32(page, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Cap at ~68 years to keep secs_to_jiffies() sane on 32-bit HZ=3D1000.=
 */
> +	if (val > (U32_MAX / 1000))
> +		return -EINVAL;

[Severity: Low]
Could this validation allow values that cause wrap-around on 32-bit platfor=
ms?
Values exceeding MAX_JIFFY_OFFSET (approx 24.8 days on 32-bit systems with
HZ=3D1000) will cause time_after() to immediately return true, instantly
reinstating the page instead of waiting.

[ ... ]
> +u32 xe_configfs_get_bad_page_decay_secs(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev =3D find_xe_config_group_device(pdev=
);
> +	u32 ret;
> +
> +	if (!dev)
> +		return device_defaults.bad_page_decay_secs;
> +
> +	ret =3D dev->config.bad_page_decay_secs;
> +	config_group_put(&dev->group);
> +
> +	return ret;
> +}

[Severity: Medium]
This accessor is added to retrieve the user's setting, but does the driver
ever call it? The initialization logic appears to ignore this and hardcodes
the default macro instead.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index 9a514d983e90b..c1bfb9bc826ce 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
[ ... ]
> @@ -446,6 +493,9 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, stru=
ct xe_ttm_vram_mgr *mgr,
>  		return err;
>  	INIT_LIST_HEAD(&mgr->offlined_pages);
>  	INIT_LIST_HEAD(&mgr->queued_pages);
> +	INIT_DELAYED_WORK(&mgr->decay_gc_work, xe_ttm_vram_decay_gc_worker);
> +	mgr->decay_interval_jiffies =3D
> +		secs_to_jiffies(XE_BAD_PAGE_DECAY_SECS_DEFAULT);

[Severity: Medium]
Should this be calling xe_configfs_get_bad_page_decay_secs() instead of usi=
ng
the hardcoded default macro? As currently written, the configfs parameter
seems to be completely ignored.

[ ... ]
> @@ -711,8 +761,12 @@ static bool xe_ttm_vram_page_already_processed(struc=
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
>  		if (pos->addr =3D=3D addr)
>  			return true;
>  	}

[Severity: High]
Does the queued_pages loop also need to promote the page mode to
XE_PAGE_OFFLINE_HARD and update the timestamp for secondary faults?
Without this, pages that fault repeatedly while they are occupied and in the
queued_pages list might eventually decay and be reinstated, which bypasses
the two-strike permanent retirement policy.

[ ... ]
> @@ -790,6 +844,8 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe=
_device *xe, u64 addr,
>  		INIT_LIST_HEAD(&nentry->blocks);
>  		nentry->status =3D XE_PAGE_RESERVE_PENDING;
>  		nentry->addr =3D addr;
> +				nentry->mode =3D XE_PAGE_OFFLINE_SOFT;
> +				nentry->last_seen =3D jiffies;
> =20
>  		if (block) {
>  			pbo =3D xe_ttm_vram_block_owner_get(xe, block);
[ ... ]
>  			/* Queue free(to-be-purged) pages */
>  			++vram_mgr->n_queued_pages;
>  			list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
>  		} else {
>  			/* Immediately offline unoccupied pages */
[ ... ]
>  			++vram_mgr->n_offlined_pages;
>  			list_add_rcu(&nentry->offlined_link, &vram_mgr->offlined_pages);
> +			if (vram_mgr->decay_interval_jiffies &&
> +			    !delayed_work_pending(&vram_mgr->decay_gc_work))
> +				schedule_delayed_work(&vram_mgr->decay_gc_work,
> +						      xe_ttm_vram_decay_gc_period(vram_mgr));
>  			return ret;
>  		}

[Severity: High]
When occupied pages are added to the queued_pages list in the upper block,
the decay timer is not armed. If all initial hardware faults occur on
occupied pages, could this result in the timer never starting? It looks
like the decay worker is only scheduled when unoccupied pages are
successfully offlined in the lower block, which might leave queued pages
offline forever once they are eventually purged.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911094616.1333=
590-2-tejas.upadhyay@intel.com?part=3D1
