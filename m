Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7234CC88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 07:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2814D10F31A;
	Tue, 15 Sep 2026 07:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HfPizy/Z";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE9910F31A
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 07:27:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3F5FA60267;
 Tue, 15 Sep 2026 07:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899C01F000FF;
 Tue, 15 Sep 2026 07:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789457238;
 bh=VGokVADtXRY8cjDRf4UVlICuQHI2H8lzeGSbHBOXHZ4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=HfPizy/Z7+hs1wcFsMDkRSeoVJNOIcRESdDFL+RwXhlgWGcCtlW9PjoUq4G3MLrqr
 vHDxIK9OO/5dv1xTiFFV1ElHPjOwARKKMn0/8hkcXxbMRGjEyiwpcCyfyJdMWoJlyU
 U4RUiFLrFZup40eWfeyEJeOJeoxQ1lhgQLbGGvxtmVXru77pP4HqipRC9DvE8fEOWB
 BDfJev12y0FaPTiPG+zi9tiy6jg8eX87zZ59RO+RrpOJt+BxNUmbXWwl1YzZY5tdTW
 /eY6MKPYz33cbxs5bkSgBAmoAr6w1CmGrnTV50cKtTlAAV7qBk0hfu5ED6YkkGOI6E
 W6E85+RGxM+1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 07/10] drm/xe/pf: Align VF GGTT allocations to PAGE_SIZE
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260915071159.51402-19-satyanarayana.k.v.p@intel.com>
References: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
 <20260915071159.51402-19-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 07:27:17 +0000
Message-Id: <20260915072717.899C01F000FF@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] xe: SR-IOV GGTT alignment allows memory isolation bypass
--

commit b273b43c9c7b2ba3519285921560775aacbe0985
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

drm/xe/pf: Align VF GGTT allocations to PAGE_SIZE

This commit reduces the PF's alignment for VF GGTT partitions to the host
CPU PAGE_SIZE (4K) to allow finer-grained partitioning.

> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm=
/xe/xe_gt_sriov_pf_config.c
> index 6947aeed458ed..91ec8e898e3b5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -441,9 +441,7 @@ static int pf_refresh_vf_cfg(struct xe_gt *gt, unsign=
ed int vfid)
> =20
>  static u64 pf_get_ggtt_alignment(struct xe_gt *gt)
>  {
> -	struct xe_device *xe =3D gt_to_xe(gt);
> -
> -	return IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_=
64K : SZ_4K;
> +	return PAGE_SIZE;

[Severity: Critical]
Does this regression allow a VF to bypass SR-IOV memory isolation?

By unconditionally returning PAGE_SIZE, the PF provisions the VF's GGTT
partition with a base address (ggtt->start) that is only guaranteed to be
4K-aligned.

In the VF, the local drm_mm allocator is initialized with a start offset of=
 0,
meaning it aligns local offsets but not the absolute global GGTT address:

drivers/gpu/drm/xe/xe_ggtt.c:__xe_ggtt_init_early()
    drm_mm_init(&ggtt->mm, 0, size);

When the VF maps a VRAM object, it requests a 64K-aligned local offset from
drm_mm:

drivers/gpu/drm/xe/xe_ggtt.c:__xe_ggtt_insert_bo_at()
    if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
        alignment =3D SZ_64K;

Because the global GGTT virtual address is local_offset + ggtt->start,
a 4K-aligned partition base offset produces a globally misaligned hardware
address.

Since the GPU's TLB masks the lower 16 bits of the virtual address for 64K
pages, will this misaligned absolute address cause the TLB entry to alias w=
ith
the preceding 4K-aligned memory range, potentially exposing another VF or P=
F's
memory?

>  }
> =20
>  static u64 pf_get_min_spare_ggtt(struct xe_gt *gt)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915071159.5140=
2-12-satyanarayana.k.v.p@intel.com?part=3D7
