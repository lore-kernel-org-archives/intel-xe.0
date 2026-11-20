Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35463606A526
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 06:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AYtKNzdL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F34112572;
	Fri, 20 Nov 2026 06:13:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E203112572
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 06:13:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 49C7E615E5;
 Fri, 20 Nov 2026 06:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70501F000C4;
 Fri, 20 Nov 2026 06:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795155216;
 bh=xOa09X0Ohra7RqPrzNqrbaRKpQSqdsGyrZaw+8Xh7e4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=AYtKNzdL8fdFzyWT0cdNIMunDHnABexDYdfoVfh4ogxOYeb4/1iyhx3Hc7KF/2VZH
 ORZ9lAyVNDnmVmvonWjDNSibWfiFRn7eca98hz18SgpOLK24NluzlafoXuCZ15p5c8
 M2OMbjyGYRYFhOwZGjwiWJvKxFIfC0pWc2WeYVnNTuaXJ4K0lG+Wya4zLuAi2XZfeT
 bmvQ+FkxvBH6Qje4ML8E0Z10I/z9rpVJgX6ItAUnY6rTJFOhjY9tEeP0yRcCOSUvBq
 8eK5a0FqbU6tLh+zJGjY3YQKhw/DuBP/H04zaxWJfxvyAywxZZ1/wCUTnd+vbGzDIH
 wRu8wYKHVHtaw==
Message-ID: <sashiko-outbox-224544@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/16] drm/xe: Allow probe without a primary GT
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261120054712.377573-33-stuart.summers@intel.com>
References: <20261120054712.377573-18-stuart.summers@intel.com>
 <20261120054712.377573-33-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 06:13:35 +0000
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
- [High] drm/xe: NULL derefs in probe when primary GT is disabled via
  configfs
- [High] drm/xe: NULL program_media call in xe_pat_init() when
  graphics_ip is NULL
- [High] drm/xe: missing xe_ggtt_init() and NULL assert deref without
  primary_gt
- [Medium] drm/xe: unguarded primary_gt in xe_pt.c/xe_svm.c and blit in
  memtest
- [Low] drm/xe: commit message inaccurately states VRAM is a graphics IP
  property
--

commit 9870f1ea44e1074c5fb5cad9863b81c0891dd74c
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe: Allow probe without a primary GT

This commit allows probing a device when either the graphics IP or the
media IP is detected and each tile has at least one GT, removing the hard
requirement for a graphics IP and a primary GT.

> The dgpu concern the old comment raised is covered by VRAM being a
> graphics IP property, so a device without one has no VRAM to manage.

[Severity: Low]
Is this commit message description accurate?  Discrete GPU status and VRAM
configuration (desc->is_dgfx and desc->vram_flags) come from the platform
device descriptor rather than the graphics IP descriptor, so a discrete GPU
probed without a graphics IP or primary GT still allocates and probes VRAM
via xe_tile_alloc_vram() and xe_vram_probe().

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 998cd11802a86..db443828f1d56 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1059,11 +1059,11 @@ static int xe_probe_ips(struct xe_device *xe,
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
Can xe_pat_init() then call a NULL xe->pat.ops->program_media pointer when
initializing the media GT?

In xe_pat_init_early(), every non-MTL platform checks GRAPHICS_VER(xe) or
GRAPHICS_VERx100(xe), so a value of 0 falls into the
GRAPHICS_VERx100(xe) <=3D 1210 branch and selects xelp_pat_ops, where
program_media is NULL.  Having GRAPHICS_VERx100(xe) =3D=3D 0 also causes
ggtt_probe(), xe_force_wake_init_gt(), rw_with_mcr_steering(), and
read_media_fuses() to take legacy pre-Gen12.5 paths on the media GT.

> @@ -1178,21 +1178,14 @@ static int xe_info_init(struct xe_device *xe,
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
When the primary GT is disabled via configfs (gt_types_allowed=3Dmedia) on a
platform that physically has a graphics IP, can probe hit NULL pointer
dereferences in get_flat_ccs_offset() and xe_migrate_prepare_vm()?

Because probed_info->graphics_ip is still detected from hardware,
xe_info_init() populates graphics_desc without checking
xe_configfs_primary_gt_allowed():

drivers/gpu/drm/xe/xe_pci.c:xe_info_init() {
	...
	if (graphics_desc) {
		...
		xe->info.has_usm =3D graphics_desc->has_usm;
		xe->info.has_64bit_timestamp =3D graphics_desc->has_64bit_timestamp;
	} else {
		xe->info.has_flat_ccs =3D 0;
	}
}

With tile->primary_gt set to NULL by alloc_primary_gt(), xe->info.has_flat_=
ccs
and xe->info.has_usm remain enabled:

1. probe_has_flat_ccs() sees xe_root_mmio_gt(xe) =3D=3D NULL and returns ea=
rly
   without clearing has_flat_ccs, so on discrete GPUs with Flat CCS,
   xe_vram_probe() -> tile_vram_size() passes gt =3D tile->primary_gt (NULL)
   to get_flat_ccs_offset(), which dereferences gt.
2. In gt_init_with_all_forcewake(), gt->usm.bb_pool is only allocated when
   xe_gt_is_main_type(gt) is true, leaving tile->media_gt->usm.bb_pool NULL.
   When xe_migrate_init() runs on tile->media_gt (now the tile's
   xe_tile_pt_gt()), xe_migrate_prepare_vm() checks xe->info.has_usm and
   dereferences xe_tile_pt_gt(tile)->usm.bb_pool->bo.

[Severity: High]
When tile->primary_gt is NULL, does probing skip xe_ggtt_init() and
dereference a NULL primary_gt in ggtt_init_ranges()?

In ggtt_init_ranges(), gt =3D ggtt->tile->primary_gt is passed to
xe_gt_assert(gt, full_size), which evaluates gt_to_tile(gt) ((gt)->tile)
when CONFIG_DRM_XE_DEBUG is enabled.  Later, in gt_init_with_gt_forcewake(),
xe_ggtt_init() is only called under if (xe_gt_is_main_type(gt)), so a tile
with only a media GT never initializes its GGTT scratch page or clears the
GGTT.  Similarly, xe_gt_flr_prepare() and xe_gt_reinit() still gate
xe_migrate_flr_prepare() and xe_migrate_reinit() on xe_gt_is_main_type(gt)
rather than gt =3D=3D xe_tile_pt_gt(gt_to_tile(gt)).

[Severity: Medium]
Are there remaining paths after probe that assume tile->primary_gt is
non-NULL or that tile->migrate supports blitter commands?

In xe_pt.c, generate_reclaim_entry(), add_pte_to_prl(), and
xe_pt_stage_unbind_entry() pass tile->primary_gt to xe_gt_stats_incr() and
xe_page_reclaim_list_abort(), which dereference gt->stats (when
CONFIG_DEBUG_FS is enabled) and gt_to_xe(gt)->drm on platforms with
has_page_reclaim_hw_assist.  In xe_svm.c,
xe_svm_range_notifier_event_begin() and xe_svm_invalidate() guard
tile->media_gt before updating TLB invalidation stats, but pass
tile->primary_gt unconditionally.  Also, in xe_vram.c, xe_vram_memtest()
calls xe_migrate_clear() without checking xe_migrate_can_blit(tile->migrate=
),
emitting blitter clear commands onto the media GT's migration queue.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120054712.3775=
73-18-stuart.summers@intel.com?part=3D15
