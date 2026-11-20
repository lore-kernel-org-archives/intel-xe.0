Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68E3606A32C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 06:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QdJsPHzk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4A9112545;
	Fri, 20 Nov 2026 06:11:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070D7112545
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 06:11:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B7766444C5;
 Fri, 20 Nov 2026 06:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8091F000CF;
 Fri, 20 Nov 2026 06:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795155085;
 bh=aBUjud+cd6gHgx26sG/0AdS/WL8snJeemrQqKLUaTR0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=QdJsPHzkHEJttump/jHJtVyoAkbGVFrlu49G0gmJR6s5A6SkaHZA79asr99LEZICL
 w984gzqf0v1Vene9srgJh1qxuZKvLyO7bhSIPd8+lGIs+NMPczpWYIWbSPHDyIEHrc
 C13ypMQdQTKWWPsrxy0f4jCJTjDs6WOSFwM8l1TsqNbe1bwzlCT5wQYmiZFcdxrrs4
 uIYWcZT/Q8oyZhW8ohgljubG0bs3pdpuLdEK48f3Lc1fyQh5lal6BKsz0SLZKXb8Sq
 Jw4byGF7BLT8+Y4qB21KnpSlk8s3QxgfYjXgM4Tm3UYmZQB7rOsmp03Fehp8lJHKkV
 GW3PqwIh7jqxw==
Message-ID: <sashiko-outbox-224540@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/16] drm/xe: Work around media 52-bit limitation on CRI
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261120054712.377573-34-stuart.summers@intel.com>
References: <20261120054712.377573-18-stuart.summers@intel.com>
 <20261120054712.377573-34-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 06:11:25 +0000
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

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] drm/xe: unexported DIRECT_MAP_PHYSMEM_END in
  cri_media_addressable()
- [Medium] drm/xe: stale gt_count and zero-GT crash in
  sysctrl_media_drop()
- [Medium] drm/xe: ATS defeature sent without forcewake in
  xe_sysctrl_media_defeature()
- [Medium] drm/xe: clearing has_media_feature_disable skips defeature on
  later resumes
- [Low] drm/xe: unconditional xe_info() log in
  sysctrl_media_defeature_send() on resume
--

commit bfba7658ba4dafcad71b1d3fc6d2e7a7e1c0e5dd
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe: Work around media 52-bit limitation on CRI

This commit disables media by default on CRI to work around its 46-bit GPA
limit.  When media is enabled, it clamps the device DMA mask to 46 bits and
adds a System Controller mailbox command to defeature either media or media
address translation on probe and resume.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index db443828f1d56..af7cf08fcfb86 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
[ ... ]
> @@ -815,6 +818,44 @@ static int xe_probe_info_early(struct xe_device *xe,
>  	return 0;
>  }
> =20
> +/*
> + * Number of address bits media is able to reach on CRI, where it has no
> + * address translation of its own.
> + */
> +#define XE_CRI_MEDIA_ADDR_BITS	46
> +
> +static bool device_iommu_iova_backed(struct device *dev)
> +{
> +	struct iommu_domain *domain =3D iommu_get_domain_for_dev(dev);
> +
> +	return domain && domain->type !=3D IOMMU_DOMAIN_IDENTITY;
> +}
> +
> +/*
> + * Decide whether media can be used on CRI.  Media there cannot translate
> + * addresses, so it is only usable if device DMA is guaranteed to stay w=
ithin
> + * XE_CRI_MEDIA_ADDR_BITS.  The IOMMU guarantees that by allocating IOVAs
> + * below the device dma mask.  Without it, DMA addresses are host physic=
al
> + * addresses, so media is only usable when the host cannot produce an ad=
dress
> + * wider than media can reach.
> + */
> +static bool cri_media_addressable(struct xe_device *xe)
> +{
> +	u64 host_max_addr =3D DIRECT_MAP_PHYSMEM_END;

[Severity: High]
Does using DIRECT_MAP_PHYSMEM_END here break modular builds when
CONFIG_RANDOMIZE_MEMORY is enabled on x86_64?

arch/x86/include/asm/pgtable_64_types.h defines DIRECT_MAP_PHYSMEM_END as
direct_map_physmem_end, which is defined in arch/x86/mm/kaslr.c without
EXPORT_SYMBOL, causing modpost to fail with an undefined symbol when
CONFIG_DRM_XE=3Dm.

Also, DIRECT_MAP_PHYSMEM_END is the end of the virtual direct-map region
rather than the highest installed physical RAM address.  In
kernel_randomize_memory() in arch/x86/mm/kaslr.c, direct_map_physmem_end
stays at (1ULL << MAX_PHYSMEM_BITS) - 1 whenever CONFIG_ZONE_DEVICE is
enabled (which CONFIG_DRM_XE_GPUSVM selects), so cri_media_addressable()
will reject media on 5-level paging hosts without IOMMU translation
regardless of how much RAM is installed.

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysc=
trl.c
> index 405d339d6a7dd..a7f8c8edd0128 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
[ ... ]
> @@ -251,3 +257,182 @@ int xe_sysctrl_sdk_api_version(struct xe_device *xe=
, u16 *version)
[ ... ]
> +/* Send the media defeature command and report the outcome */
> +static int sysctrl_media_defeature_send(struct xe_device *xe, u8 feature)
> +{
> +	bool media_allowed =3D feature =3D=3D XE_SYSCTRL_MEDIA_DEFEATURE_ATS_DI=
SABLE;
> +	int ret;
> +
> +	ret =3D sysctrl_media_defeature(xe, feature);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to defeature media (0x%02x): %pe\n",
> +		       feature, ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	xe_info(xe, "sysctrl: media %s, %s defeatured\n",
> +		media_allowed ? "enabled" : "disabled",
> +		media_allowed ? "address translation" : "media");
> +
> +	return 0;
> +}

[Severity: Low]
Since xe_pm_runtime_resume() and xe_device_resume() call
xe_sysctrl_media_defeature(), will this xe_info() print on every runtime
and system resume?

> +
> +/*
> + * The System Controller reaches into media while processing the request=
, so
> + * hold the media GT forcewake for its duration.
> + */
> +static int sysctrl_media_ats_defeature_send(struct xe_device *xe, struct=
 xe_gt *media_gt)
> +{
> +	int ret =3D 0;
> +
> +	xe_with_force_wake(fw_ref, gt_to_fw(media_gt), XE_FW_GT) {
> +		if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
> +			xe_err(xe, "sysctrl: failed to wake media GT, defeaturing media ATS a=
nyway\n");
> +
> +		ret =3D sysctrl_media_defeature_send(xe, XE_SYSCTRL_MEDIA_DEFEATURE_AT=
S_DISABLE);
> +	}
> +
> +	return ret;
> +}
[ ... ]
> +int xe_sysctrl_media_defeature(struct xe_device *xe)
> +{
> +	bool media_allowed =3D xe_device_media_allowed(xe);
> +	struct xe_gt *media_gt;
> +	u8 feature;
> +	int ret;
> +
> +	if (!sysctrl_media_defeature_needed(xe))
> +		return 0;
> +
> +	feature =3D media_allowed ? XE_SYSCTRL_MEDIA_DEFEATURE_ATS_DISABLE :
> +				  XE_SYSCTRL_MEDIA_DEFEATURE_DISABLE;
> +
> +	media_gt =3D xe_device_get_root_tile(xe)->media_gt;
> +
> +	if (media_gt && feature =3D=3D XE_SYSCTRL_MEDIA_DEFEATURE_ATS_DISABLE &&
> +	    sysctrl_ats_enabled(xe))
> +		ret =3D sysctrl_media_ats_defeature_send(xe, media_gt);
> +	else
> +		ret =3D sysctrl_media_defeature_send(xe, feature);

[Severity: Medium]
When media_allowed is true (so feature is
XE_SYSCTRL_MEDIA_DEFEATURE_ATS_DISABLE) but sysctrl_ats_enabled(xe) is
false or media_gt is NULL, does this fall into the else branch and send
XE_SYSCTRL_MEDIA_DEFEATURE_ATS_DISABLE without holding media GT forcewake?

> +
> +	if (ret)
> +		xe->sc.has_media_feature_disable =3D false;
> +
> +	return ret;
> +}

[Severity: Medium]
If XE_SYSCTRL_MEDIA_DEFEATURE_ATS_DISABLE fails during
xe_sysctrl_media_probe() and the fallback to
XE_SYSCTRL_MEDIA_DEFEATURE_DISABLE succeeds, does clearing
has_media_feature_disable here prevent xe_pm_runtime_resume() and
xe_device_resume() from re-applying XE_SYSCTRL_MEDIA_DEFEATURE_DISABLE on
later resumes?

Similarly, if XE_SYSCTRL_MEDIA_DEFEATURE_ATS_DISABLE succeeded at probe so
media_gt is active, a transient mailbox failure during resume permanently
clears has_media_feature_disable, causing subsequent resumes to return 0
without disabling media ATS.

> +
> +/*
> + * Drop media from the device.  Only safe during probe, before the media=
 GT is
> + * brought up.  The dma_mask_size cap derived from the early media decis=
ion is
> + * left in place, which is harmless since it is only more restrictive th=
an
> + * needed.
> + */
> +static void sysctrl_media_drop(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	xe->info.media_allowed =3D false;
> +
> +	for_each_tile(tile, xe, id)
> +		tile->media_gt =3D NULL;
> +}

[Severity: Medium]
Does clearing tile->media_gt here leave xe->info.gt_count stale and allow a
tile to continue probing with zero GTs?

xe_info_init() already computed xe->info.gt_count before xe_device_probe()
runs.  When tile->media_gt is cleared without decrementing
xe->info.gt_count, query_gt_list() sizes and reports gt_list->num_gt from
xe->info.gt_count while populating entries with for_each_gt(), exposing
trailing zero-filled GT entries to userspace.  In addition, if
tile->primary_gt was disabled via configfs gt_types_allowed, dropping
tile->media_gt leaves no GTs on the tile and causes a NULL pointer
dereference later in xe_device_probe() (for example in
xe_cpu_bind_init() -> xe_exec_queue_create_bind() when accessing
tile->migrate and xe_tile_pt_gt(tile)).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120054712.3775=
73-18-stuart.summers@intel.com?part=3D16
