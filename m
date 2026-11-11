Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CF1606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 04:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g0tGVzf/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D87810E05F;
	Wed, 11 Nov 2026 04:57:47 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938EC10E05F
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 04:57:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 74BC96118F;
 Wed, 11 Nov 2026 04:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5F31F0089F;
 Wed, 11 Nov 2026 04:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794373059;
 bh=+r6dseYH7HtPRvIYyQrAeR8cTZBrvdr2dVkbiWprCeU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=g0tGVzf/hmI37LrWf4wNq26dL/y6aYlZsg84Hb00IU7XBF2Conz6O6ZGDjHCIH0nY
 kkXjgWaPMBdqi0zWFmJAZYQtRsCDa2x91lNoELK9tVdWBtvtr8BByvrPjRF+1IVfB0
 N/jdvH0nXFGpOwSuM3a3gOSnwdsnT6IKsQB0U0aoO4K6WWDJ84k8+RmnG+OQfhe1v0
 SUZzn0suFpsmQzQLxAonBSxqYHtHapQ2IT774848NwmypjHEFIqF7fAysvVoyhz/WK
 c+62/XYCg97uE7rXdsZOnPtXskZgRDDlpbqkXF3DULu4rXE6OrWfXIFkeoT5jFpp7C
 5qbKvUYxLvOBg==
Message-ID: <sashiko-outbox-208318@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/11] drm/xe: Allow probe without a primary GT
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261110231442.218721-24-stuart.summers@intel.com>
References: <20261110231442.218721-13-stuart.summers@intel.com>
 <20261110231442.218721-24-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 04:57:38 +0000
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

Thank you for your contribution! Sashiko AI review found 8 potential
issues to consider:
- [High] drm/xe: graphics_desc features left enabled in xe_info_init()
  on media-only GT
- [High] drm/xe: xe_probe_ips() without graphics_ip leaves
  GRAPHICS_VERx100(xe) at 0
- [High] drm/xe: has_page_reclaim_hw_assist left set causes NULL deref
  in xe_pt.c
- [High] drm/xe: pick_engine_gt() returns NULL primary_gt in
  gt_irq_handler()
- [Medium] drm/xe: xe_ggtt_init() skipped in gt_init_with_gt_forcewake()
  without primary GT
- [Medium] drm/xe: unchecked tile->primary_gt dereference in xe_svm.c
  TLB inval stats
- [Low] drm/xe: xe_vram_memtest() calls xe_migrate_clear() when tile
  cannot blit
- [Low] drm/xe: commit message inaccurately claims VRAM is a graphics IP
  property
--

commit d8aec1e526d9f27e3b37444973501f4b05a0116d
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe: Allow probe without a primary GT

This commit allows probing a device as long as either a graphics or media IP
is detected and each tile ends up with at least one GT.

> The dgpu concern the old comment raised is covered by VRAM being a
> graphics IP property, so a device without one has no VRAM to manage.

[Severity: Low]
Is this explanation in the commit message accurate?  xe->info.is_dgfx comes
from struct xe_device_desc rather than graphics_ip, so discrete devices
without a graphics IP or primary GT still allocate and probe VRAM, and
earlier commits in this series ("drm/xe: Fall back to CPU copies when the
tile cannot blit" and "drm/xe: Require a fully visible VRAM BAR without a
primary GT") handle VRAM management without a primary GT.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e4220cb0cc298..26b20fa114d2b 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1028,11 +1028,11 @@ static int xe_probe_ips(struct xe_device *xe,
>  	}
> =20
>  	/*
> -	 * If we couldn't detect the graphics IP, that's considered a fatal
> -	 * error and we should abort driver load.  Failing to detect media
> -	 * IP is non-fatal; we'll just proceed without enabling media support.
> +	 * Either IP on its own is enough to go on with.  Only a device where
> +	 * neither could be detected is a fatal error, since there would be
> +	 * nothing left to drive.
>  	 */
> -	if (!probed_info->graphics_ip)
> +	if (!probed_info->graphics_ip && !probed_info->media_ip)
>  		return -ENODEV;
> =20
>  	return 0;

[Severity: High]
When probed_info->graphics_ip is NULL, xe->info.graphics_verx100 remains 0.
On any post-Meteor Lake GMD_ID platform, won't xe_pat_init_early() match
GRAPHICS_VERx100(xe) <=3D 1210 and select xelp_pat_ops, causing a NULL
function pointer dereference in xe_pat_init() when calling
xe->pat.ops->program_media on the media GT?

drivers/gpu/drm/xe/xe_pat.c:xe_pat_init_early() {
	...
	} else if (GRAPHICS_VERx100(xe) <=3D 1210) {
		WARN_ON_ONCE(!IS_DGFX(xe) && !xe->info.has_llc);
		xe->pat.ops =3D &xelp_pat_ops;
}

Having GRAPHICS_VERx100(xe) =3D=3D 0 also causes xe_ggtt_init_early(),
read_media_fuses(), and the IRQ handlers in xe_irq.c to take legacy pre-1250
and pre-1210 branches.

> @@ -1147,21 +1147,14 @@ static int xe_info_init(struct xe_device *xe,
>  		if (IS_ERR(tile->primary_gt))
>  			return PTR_ERR(tile->primary_gt);
> =20
> -		/*
> -		 * It's not currently possible to probe a device with the
> -		 * primary GT disabled.  With some work, this may be future in
> -		 * the possible for igpu platforms (although probably not for
> -		 * dgpu's since access to the primary GT's BCS engines is
> -		 * required for VRAM management).
> -		 */
> -		if (!tile->primary_gt) {
> -			drm_err(&xe->drm, "Cannot probe device with without a primary GT\n");
> -			return -ENODEV;
> -		}
> -
>  		tile->media_gt =3D alloc_media_gt(tile, media_desc);
>  		if (IS_ERR(tile->media_gt))
>  			return PTR_ERR(tile->media_gt);
> +
> +		if (!tile->primary_gt && !tile->media_gt) {
> +			xe_tile_err(tile, "Cannot probe tile without any GT\n");
> +			return -ENODEV;
> +		}
>  	}

[Severity: High]
When gt_types_allowed=3Dmedia is set in configfs on a platform with a physi=
cal
graphics IP, handle_gmdid() still populates probed_info->graphics_ip, so
xe_info_init() sets xe->info.has_usm from graphics_desc and leaves
xe->info.has_flat_ccs enabled while alloc_primary_gt() returns NULL.  Does
this cause NULL pointer dereferences during probe in get_flat_ccs_offset()
(called with tile->primary_gt from tile_vram_size()) and in
xe_migrate_prepare_vm() (which dereferences
xe_tile_pt_gt(tile)->usm.bb_pool->bo, whereas gt->usm.bb_pool is only
allocated when xe_gt_is_main_type(gt))?

[Severity: High]
Can a VMA unbind dereference a NULL tile->primary_gt when
xe->info.has_page_reclaim_hw_assist is enabled (such as on Nova Lake-P)?
xe_info_init() does not clear has_page_reclaim_hw_assist when probing
without a primary GT, so unbind_op_prepare() allocates a page reclaim list
and generate_reclaim_entry() passes gt =3D tile->primary_gt to
xe_gt_stats_incr() and xe_page_reclaim_list_abort().

[Severity: High]
When a tile probes without a primary GT, can an interrupt such as PXP's
OTHER_KCR_INSTANCE dereference NULL in gt_irq_handler()?  pick_engine_gt()
falls through to return tile->primary_gt for any class/instance not
explicitly listed for media_gt, and gt_irq_handler() passes that NULL
engine_gt to xe_gt_hw_engine() and gt_other_irq_handler() before checking
for OTHER_KCR_INSTANCE:

drivers/gpu/drm/xe/xe_irq.c:gt_irq_handler() {
			...
			engine_gt =3D pick_engine_gt(tile, class, instance);

			hwe =3D xe_gt_hw_engine(engine_gt, class, instance, false);
			if (hwe) {
				xe_hw_engine_handle_irq(hwe, intr_vec);
				continue;
			}

			if (class =3D=3D XE_ENGINE_CLASS_OTHER) {
				if (xe->info.has_heci_gscfi && instance =3D=3D OTHER_GSC_INSTANCE)
					xe_heci_gsc_irq_handler(xe, intr_vec);
				else if (instance =3D=3D OTHER_KCR_INSTANCE)
					xe_pxp_irq_handler(xe, intr_vec);
				else
					gt_other_irq_handler(engine_gt, instance, intr_vec);
			}
}

[Severity: Medium]
Does probing a tile without a primary GT skip xe_ggtt_init()?  Commit
"drm/xe: Run page table updates on the media GT when there is no primary"
updated the xe_migrate_init() check in gt_init_with_all_forcewake() to test
gt =3D=3D xe_tile_pt_gt(gt_to_tile(gt)), but gt_init_with_gt_forcewake() st=
ill
guards xe_ggtt_init(gt_to_tile(gt)->mem.ggtt) with if (xe_gt_is_main_type(g=
t)),
leaving ggtt->scratch unallocated and skipping initial GGTT PTE clearing.

[Severity: Medium]
In xe_svm_range_notifier_event_begin() and xe_svm_invalidate(), tile->media=
_gt
is checked for NULL before updating TLB invalidation stats, but
tile->primary_gt is passed unconditionally:

drivers/gpu/drm/xe/xe_svm.c:xe_svm_invalidate() {
	...
	for_each_tile(tile, xe, id) {
		if (tile_mask & BIT(id)) {
			xe_svm_tlb_inval_us_stats_incr(tile->primary_gt, start);
			if (tile->media_gt)
				xe_svm_tlb_inval_us_stats_incr(tile->media_gt, start);
}

Won't this dereference a NULL gt in xe_gt_stats_incr() during SVM
invalidation when tile->primary_gt is NULL?

[Severity: Low]
When CONFIG_DRM_XE_DEBUG_MEM is enabled on a discrete GPU without a primary
GT, does xe_vram_memtest() fail probe by calling xe_migrate_clear() without
checking xe_migrate_can_blit(tile->migrate), emitting BCS blitter clear
commands to a media engine?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110231442.2187=
21-13-stuart.summers@intel.com?part=3D11
