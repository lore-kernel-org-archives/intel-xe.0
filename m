Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC6E606A320
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 03:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y6CDAUh6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891B110E980;
	Wed, 11 Nov 2026 03:21:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A8210E280
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 03:21:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2EBC143246;
 Wed, 11 Nov 2026 03:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4841F0089F;
 Wed, 11 Nov 2026 03:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794367289;
 bh=GXQfdplOLhnvwgaeezZqQEeweUpQjvBLPHJk9ESuGt8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Y6CDAUh6qNQWQJrRunFxam7wHuo+L+Sew9ZwRKfBDiGVTt+Bi0NVZ380DrEPzvBae
 jb2nFzWd2ehzQLJGkDVWa8+hzccuV/L0JH2D4NhPOn4NBeT1WolOHE832kGaCug+Ay
 6qSbzdGZyJhOlsKBTmXSkBDqKX6Twf3InEcVNv02Gsp0EkwsuL6GwQt49RjJxW54BB
 Hld1MMCA4dV4JzOiIZ3qMw7G9Re0I4QXboe/Wy7PUJi8XMgvNcMq3xKxfSqkdUmq0l
 3aXl3NQwI3yWPjbDL4XoAY3O9GbeoByScbBIjyzYfmZ9k7ZoepBp+5JucE0gdbRD/f
 lrS8krcAoKcmg==
Message-ID: <sashiko-outbox-208170@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/11] drm/xe: Do not claim flat CCS without a graphics IP
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261110231442.218721-19-stuart.summers@intel.com>
References: <20261110231442.218721-13-stuart.summers@intel.com>
 <20261110231442.218721-19-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:21:28 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] drm/xe: clearing has_flat_ccs in xe_info_init() enables AuxCCS
  on media GT
- [Medium] drm/xe: xe_info_init() leaves has_flat_ccs set when primary
  GT is disabled
--

commit f555718484d7a834cd43df271a384a71adacc98b
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe: Do not claim flat CCS without a graphics IP

This commit clears xe->info.has_flat_ccs in xe_info_init() when the
device has no graphics IP descriptor.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b3e5c025677cf..e4220cb0cc298 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1106,6 +1106,14 @@ static int xe_info_init(struct xe_device *xe,
>  		xe->info.has_ctx_tlb_inval =3D graphics_desc->has_ctx_tlb_inval;
>  		xe->info.has_usm =3D graphics_desc->has_usm;
>  		xe->info.has_64bit_timestamp =3D graphics_desc->has_64bit_timestamp;
> +	} else {
> +		/*
> +		 * Flat CCS comes from the device descriptor rather than from
> +		 * the graphics IP, but it is still a graphics feature: its
> +		 * layout is read back through the primary GT, which is not
> +		 * there to be read.
> +		 */
> +		xe->info.has_flat_ccs =3D 0;
>  	}
> =20
>  	if (xe->info.platform !=3D XE_PVC)

[Severity: High]
Does clearing xe->info.has_flat_ccs when graphics_desc is NULL cause
has_aux_ccs() to return true on Xe2+ platforms without a graphics IP?

When graphics_ip is absent, GRAPHICS_VERx100(xe) is 0, so has_aux_ccs()
falls through to return !xe->info.has_flat_ccs:

drivers/gpu/drm/xe/xe_ring_ops.c:has_aux_ccs() {
	if (GRAPHICS_VERx100(xe) >=3D 1270 || xe->info.platform =3D=3D XE_PVC)
		return false;

	return !xe->info.has_flat_ccs;
}

During media GT initialization on Xe2+ platforms without a graphics IP,
xe_ring_ops_get() then selects auxccs_ring_ops_gen12_video_decode and
auxccs_ring_ops_gen12_video_enhance, emitting unsupported Gen12 AuxCCS
register invalidations and semaphore waits (VD0_AUX_INV and VE0_AUX_INV)
on every video and page-table migration job.

[Severity: Medium]
What happens when the hardware has a graphics IP (so graphics_desc is
non-NULL), but the primary GT is disabled via configfs
(gt_types_allowed=3Dmedia, as enabled by commit "drm/xe: Allow probe
without a primary GT" and commit "drm/xe: Document that
gt_types_allowed=3Dmedia now probes")?

In that configuration, alloc_primary_gt() returns NULL while
xe->info.has_flat_ccs remains 1.  On discrete platforms with Flat CCS,
xe_vram_probe() -> tile_vram_size() then calls
get_flat_ccs_offset(tile->primary_gt, ...) with a NULL gt pointer and
dereferences it in gt_to_xe() and gt_to_fw().  On integrated platforms
with Flat CCS, leaving has_flat_ccs set without a primary GT keeps
xe_bo_needs_ccs_pages() and handle_system_ccs active in xe_bo_move() even
though xe_migrate_can_blit() is false.

Also, the commit message attributes the primary GT layout read to
probe_has_flat_ccs(), which only checks XE2_FLAT_CCS_ENABLE and returns 0
early when xe_root_mmio_gt(xe) is NULL; the layout read is in
tile_vram_size() -> get_flat_ccs_offset().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110231442.2187=
21-13-stuart.summers@intel.com?part=3D6
