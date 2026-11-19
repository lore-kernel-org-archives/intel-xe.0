Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E47606A333
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 14:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IuU5xy9G
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD011124FA;
	Thu, 19 Nov 2026 14:52:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B001124F2
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 14:52:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 90D5441410;
 Thu, 19 Nov 2026 14:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A121F000C4;
 Thu, 19 Nov 2026 14:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795099946;
 bh=bnCzvPyoCC4kqxvAsg3+E6trroIYWAt2Fjo/I27eCtE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=IuU5xy9GkLSYRN/5ixWNH3n8mtAWFNuMqY7ju7VhmChba0MU3KjV9ZizbPkmZKeIv
 gru8GJAIJyKzXUEoXmnsDTJUCKFS3j/wFWlNKYzonylXB7UYOdFgSxlN8OrueD8Awl
 Axt8hoWY6m3sKqP8yGdiIp7ELKj9lbWsHxWZ/lazTDwp3EdPmGC8DHFkgCTrp5omfw
 R5djx3FIN3sVHXQOdCxn7P8ScDi0wTV733I2DruE9YMg1VxlwP0KsZsv71+UXtzQq9
 4jOx85K+sQzs8Vb1USa/9t/Q42dG4JAu68+kIQ7S1g+5tkmHboUEtrPpeUCLxBJfmM
 DTWfNFeu49dCg==
Message-ID: <sashiko-outbox-223323@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] drm/xe: After VF migration, repeat BO mapping in
 progress
To: "Tomasz Lis" <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261119141741.1720650-3-tomasz.lis@intel.com>
References: <20261119141741.1720650-1-tomasz.lis@intel.com>
 <20261119141741.1720650-3-tomasz.lis@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 14:52:25 +0000
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
- [High] drm/xe: UAF and double free of ggtt_node in
  __xe_ggtt_insert_bo_at()
- [Medium] drm/xe: race in __xe_ggtt_insert_bo_at() on VF migration
  recovery abort
--

commit ffaea991a62518238992d72726824a9a18cd6e5d
Author: Tomasz Lis <tomasz.lis@intel.com>

drm/xe: After VF migration, repeat BO mapping in progress

This commit moves the post-migration retry loop from LRC creation to GGTT
BO insertion so that any GGTT PTE writes racing with VF migration are
redone once recovery updates the GGTT range.

> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 44480fad27679..2a7b4322c7a5f 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c

[ ... ]

> @@ -1080,6 +1086,41 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *=
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
> +			 * Only abort fixing the PTEs if we're wedged; if the wait timeouts,
> +			 * the cause may be that VF migration recovery was just repeated or
> +			 * prolonged, so do not treat that as bailout condition.
> +			 * If the VF migration was detected, we can be sure that recovery
> +			 * will start or already has started. The recovery worker assures
> +			 * on finish that this loop will exit - either by marker or by wedge.
> +			 */
> +			if (xe_wedged(tile_to_xe(ggtt->tile))) {
> +				xe_ggtt_remove_bo(ggtt, bo);
> +				err =3D -ECANCELED;
> +				break;
> +			}

[Severity: High]
Does this leave a dangling pointer in bo->ggtt_node[tile_id] after
xe_ggtt_remove_bo() frees the node?

Unlike the earlier error paths in __xe_ggtt_insert_bo_at(),
xe_ggtt_remove_bo() frees bo->ggtt_node[tile_id] via
xe_ggtt_node_remove() without clearing the pointer to NULL.  When
__xe_bo_create_locked() sees -ECANCELED and drops the BO with
xe_bo_put(), xe_ttm_bo_destroy() finds bo->ggtt_node[id] still non-NULL
and calls xe_ggtt_remove_bo() a second time, causing a use-after-free and
double free of the GGTT node.

> +
> +			mutex_lock(&ggtt->lock);
> +			xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pte);
> +			mutex_unlock(&ggtt->lock);
> +		}
> +	}

[Severity: Medium]
Can this loop exit with err =3D=3D 0 if VF migration recovery fails and
aborts before fixups_complete_count is incremented?

In vf_post_migration_recovery(), the failure path calls
vf_post_migration_abort() before xe_wedge_declare():

drivers/gpu/drm/xe/xe_gt_sriov_vf.c:vf_post_migration_recovery() {
    ...
fail:
	vf_post_migration_abort(gt);
	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
	xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RE=
SET);
	return;
}

vf_post_migration_abort() clears ggtt_need_fixes and wakes migration.wq
without incrementing fixups_complete_count:

CPU0                                  CPU1 (recovery worker)
__xe_ggtt_insert_bo_at()
  marker =3D N
  ...
  xe_gt_sriov_vf_wait_valid_ggtt()
                                      vf_post_migration_recovery()
                                        vf_post_migration_abort()
                                          ggtt_need_fixes =3D false
                                          wake_up_all(&migration.wq)
    returns N
  if (xe_wedged(xe))  (false)
  xe_ggtt_map_bo()
  while (marker !=3D
         xe_vf_migration_fixups_complete_count())
    (N !=3D N is false, exits with err =3D 0)
                                        xe_wedge_declare(xe, ...)

If CPU0 reaches the while condition after vf_post_migration_abort()
clears ggtt_need_fixes, xe_vf_migration_fixups_complete_count() also
returns the unchanged count N, so the retry loop and its xe_wedged()
check are bypassed altogether and __xe_ggtt_insert_bo_at() succeeds with
PTEs written to the unfixed GGTT range.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119141741.1720=
650-1-tomasz.lis@intel.com?part=3D2
