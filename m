Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E009606A32D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oLk6YRqN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1BB10E422;
	Fri, 13 Nov 2026 19:40:17 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1601410E422
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 19:40:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AB2F045606;
 Fri, 13 Nov 2026 19:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747CE1F000C5;
 Fri, 13 Nov 2026 19:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794598811;
 bh=A2NNxkkK6ihDugeV8qAAaTYeUxFY6QulVSW28/X/dNM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=oLk6YRqN+GPVUxHoj6OTuI1CcDr9rO/OdYfs1UoSCDfVYO1JA9wQoYOKPuvRii60W
 nO1o23hjVR01EtjqpLUrdU8UiPJ+PfxRCldf3tANokNSY+tz3M+rFygnrCQjIhPEGZ
 BC3C0AgCHxsH/qbRSo6G3d1dw1DPFI0KG9S5JEQPuv4EATWkgemb6UeoZQY838je/j
 aylQanVAl3ASgsLWxggjwDPumYvuHZ8fUecx4bamHPQ0UKs6zVEMgd3Hjm3MsGUMLO
 M5+nS4C51jmkBrwmW0UfrJmNgB1CavJKGwPQ72ucPfkIBdKWIBbjjTGYBbwkYXL7b1
 Sc+a71Fra9ncQ==
Message-ID: <sashiko-outbox-213560@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [CI 1/2] drm/xe/wopcm: Use the size from HW when excluding the
 wopcm range from GGTT
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261113191739.1447747-3-daniele.ceraolospurio@intel.com>
References: <20261113191739.1447747-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:40:10 +0000
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
- [Medium] drm/xe: guc_bo_ggtt_addr() asserts against hardcoded
  xe_wopcm_size()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] drm/xe: out-of-bounds write in xe_ggtt_set_pte() [1]
--

commit 4a9c3b5b3550bed91fd0e4d956401869552dfe0a
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

drm/xe/wopcm: Use the size from HW when excluding the wopcm range from GGTT

This commit reads the per-tile WOPCM size from the STOLEN_RESERVED
register during tile initialization and uses it to set the GGTT start
offset and stolen memory size instead of relying on hardcoded values.

> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 9ef2ce743770f..cd8b9000046c9 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c

[ ... ]

> @@ -394,11 +394,13 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  {
>  	struct xe_device *xe =3D tile_to_xe(ggtt->tile);
>  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> +	u64 ggtt_start, ggtt_size;
>  	unsigned int gsm_size;
> -	u64 ggtt_start, wopcm =3D xe_wopcm_size(xe), ggtt_size;
>  	int err;
> =20
>  	if (!IS_SRIOV_VF(xe)) {
> +		u64 wopcm =3D xe_tile_wopcm_size(ggtt->tile);
> +
>  		if (GRAPHICS_VERx100(xe) >=3D 1250)
>  			gsm_size =3D SZ_8M; /* GGTT is expected to be 4GiB */
>  		else

[Severity: Medium]
Does guc_bo_ggtt_addr() also need to be updated to check against
xe_tile_wopcm_size()?

drivers/gpu/drm/xe/xe_guc.c:guc_bo_ggtt_addr() {
    ...
	addr =3D __xe_bo_ggtt_addr(bo, gt_to_tile(guc_to_gt(guc))->id);

	/* GuC addresses above GUC_GGTT_TOP don't map through the GTT */
	xe_assert(xe, addr >=3D xe_wopcm_size(guc_to_xe(guc)));
    ...
}

With ggtt_start now set to xe_tile_wopcm_size(ggtt->tile), early GuC BOs
such as guc->log.bo can be placed below the hardcoded xe_wopcm_size(xe)
whenever hardware reports a smaller WOPCM in STOLEN_RESERVED (for example,
2 MiB on DG1/DG2 where xe_wopcm_size() returns 4 MiB), triggering a false
xe_assert() failure during GuC initialization.  Conversely, when the
hardware WOPCM is larger than xe_wopcm_size(xe), the assertion checks
against a stale lower bound.

[ ... ]

> @@ -647,13 +648,15 @@ static void xe_ggtt_invalidate_engine(struct xe_ggt=
t *ggtt)
>   * This function may be called multiple times during recovery, but if
>   * @new_start is unchanged from the current base, it's a noop.
>   *
> - * @new_start should be a value between xe_wopcm_size() and #GUC_GGTT_TO=
P.
> + * @new_start should be a value above the wopcm size and below #GUC_GGTT=
_TOP.
> + * VFs can't access the register with the wopcm size info, so we trust t=
hat PF
> + * has done the correct programming for that and we just assert on the u=
pper
> + * bound.
>   */
>  void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
>  {
>  	guard(mutex)(&ggtt->lock);
> =20
> -	xe_tile_assert(ggtt->tile, new_start >=3D xe_wopcm_size(tile_to_xe(ggtt=
->tile)));
>  	xe_tile_assert(ggtt->tile, new_start + ggtt->size <=3D GUC_GGTT_TOP);
> =20
>  	/* pairs with READ_ONCE in xe_ggtt_node_addr() */

[Severity: Critical]
This problem wasn't introduced by this patch, but can a large new_start
from the PF cause an out-of-bounds write in xe_ggtt_set_pte() [1]?

vf_get_ggtt_info() queries start from GUC_KLV_VF_CFG_GGTT_START_KEY and
passes it directly to xe_ggtt_shift_nodes().  In non-debug builds where
xe_tile_assert() compiles out, an out-of-range new_start is stored into
ggtt->start unchecked, causing xe_ggtt_set_pte() to index past the end of
ggtt->gsm[] when writing PTEs.

[1] https://sashiko.dev/#/bug/linux-eb71dbae-ad75-4245-85dd-767544ad0c44

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113191739.1447=
747-3-daniele.ceraolospurio@intel.com?part=3D1
