Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE575606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 12:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eHBiF7iD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64AA10ECE3;
	Thu, 19 Nov 2026 12:51:16 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F9010ECE3
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 12:51:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C919962531;
 Thu, 19 Nov 2026 12:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6300D1F000C6;
 Thu, 19 Nov 2026 12:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795092668;
 bh=9OQpEPmXCTT7fAdOGRulAaZvh2zZevnui6SrM5jr37U=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=eHBiF7iDEuzmxBYRWfNtpdjFpJuH8R3aV19XUnYxFGbPbWIp8us8kasPoBBEPPrv5
 K52tSY3oorHj1CvP+r8f7xNaE44CupT51VwsIkPnPKwESsVzl2a8wEvXifokeaRtML
 uAF9LmG0tO66+2hztDYyicYEeAU9OtDmLmDPeZP5R7FzIpUQDNfZMaz34rCuYjoyPv
 CopbzfS4lQiyXPEgbu6tZyty+NpQwtYB+suiWIUR3GqI1QoZaQfRhASRVFAmEVyBxN
 DmC/BtjUoBHjwuig/4NPyuh6T0xqXdB3xTj+k6JPW+OpOyYHLPnhGLMh+qMkQoRFYC
 t/6rEgWOF0t6A==
Message-ID: <sashiko-outbox-223118@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] drm/xe: After VF migration, repeat BO mapping in
 progress
To: "Tomasz Lis" <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261119123514.1658712-3-tomasz.lis@intel.com>
References: <20261119123514.1658712-1-tomasz.lis@intel.com>
 <20261119123514.1658712-3-tomasz.lis@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 12:51:07 +0000
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
- [High] drm/xe: dead -ERESTARTSYS check and busy-spin in
  __xe_ggtt_insert_bo_at()
--

commit b16142a275191b42c8c4d7d66be1c8cd542936f0
Author: Tomasz Lis <tomasz.lis@intel.com>

drm/xe: After VF migration, repeat BO mapping in progress

This commit moves the VF post-migration retry loop from LRC creation in
__xe_exec_queue_init() to GGTT BO insertion in __xe_ggtt_insert_bo_at() so
that all GGTT BO mappings rewrite their PTEs if a VF migration occurs while
mapping is in progress.

> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 44480fad27679..ec770f2968a95 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
[ ... ]
> @@ -1080,6 +1086,38 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *=
ggtt, struct xe_bo *bo,
>  	}
>  	mutex_unlock(&ggtt->lock);
> =20
> +	if (!err) {
> +		/*
> +		 * If VF migration happens during BO mapping, some PTE value writes may
> +		 * be ignored by HW. This can happen in case GGTT range changed; alrea=
dy
> +		 * set PTEs are moved by the VF restore, but xe_ggtt_map_bo() within VM
> +		 * may still loop at old position. To be sure, redo all PTE writes.
> +		 * Make this a loop as another VF migration could start immediately.
> +		 */
> +		while (marker !=3D xe_vf_migration_fixups_complete_count(ggtt->tile->p=
rimary_gt)) {
> +			u16 cache_mode =3D bo->flags & XE_BO_FLAG_NEEDS_UC ?
> +					 XE_CACHE_NONE : XE_CACHE_WB;
> +			u16 pat_index =3D xe_cache_pat_idx(tile_to_xe(ggtt->tile), cache_mode=
);
> +			u64 pte =3D ggtt->pt_ops->pte_encode_flags(bo, pat_index);
> +
> +			marker =3D xe_gt_sriov_vf_wait_valid_ggtt(ggtt->tile->primary_gt);
> +			/*
> +			 * Only abort fixing the PTEs if we're signalled or wedged; in
> +			 * case of timeout the migration recovery may be just repeated
> +			 * or prolonged, so do not treat that as bailout condition.
> +			 * If the VF migration was detected, we can be sure that recovery
> +			 * will start or already has started. The recovery worker assures
> +			 * on finish that this loop will exit.
> +			 */
> +			if (marker =3D=3D -ERESTARTSYS || xe_wedged(tile_to_xe(ggtt->tile)))
> +				break;
> +
> +			mutex_lock(&ggtt->lock);
> +			xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pte);
> +			mutex_unlock(&ggtt->lock);
> +		}
> +	}

[Severity: High]
Can marker =3D=3D -ERESTARTSYS ever be true here, or will a pending signal =
during
VF migration cause this loop to busy-spin?

xe_gt_sriov_vf_wait_valid_ggtt() discards the return value from
wait_event_interruptible_timeout() and always returns the non-negative
fixups_complete_count:

drivers/gpu/drm/xe/xe_gt_sriov_vf.c:xe_gt_sriov_vf_wait_valid_ggtt() {
    ...
	ret =3D wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
					       vf_valid_ggtt(gt),
					       HZ * 5);
	xe_gt_WARN_ON(gt, !ret);

	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
}

Meanwhile, xe_vf_migration_fixups_complete_count() returns -1 while
!vf_valid_ggtt(gt).  If a thread has a pending signal during VF migration
recovery, wait_event_interruptible_timeout() returns -ERESTARTSYS immediate=
ly
without sleeping, marker receives the non-negative fixups_complete_count, a=
nd
the loop spins without sleeping while repeatedly acquiring ggtt->lock and
rewriting all BO PTEs over MMIO.  On a single-vCPU guest VM without
involuntary preemption, this can starve the migration recovery worker and
cause a soft lockup.

Also, when the loop breaks out (on xe_wedged(), or if -ERESTARTSYS were
propagated), err is still 0 and bo->ggtt_node[tile_id] remains inserted, so
__xe_ggtt_insert_bo_at() returns success with stale or unfixed GGTT PTEs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119123514.1658=
712-1-tomasz.lis@intel.com?part=3D2
