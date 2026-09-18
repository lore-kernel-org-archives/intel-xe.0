Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080A3C982DA
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 10:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B829B10E4EE;
	Fri, 18 Sep 2026 10:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lfh2AYN5";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF9210E4EE
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 10:41:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C073C60A65;
 Fri, 18 Sep 2026 10:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598FE1F000FF;
 Fri, 18 Sep 2026 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789728097;
 bh=z5hTuHVwcrImyyYbX97A5VwLlG8oSKUTyvKDUPrhnMk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=lfh2AYN5FavfOhRwTHN1Bgysy/z6//3mq7evYMm8tv554YBaXf/5EVt6h7akT2cgt
 WEtWHbgbxZ3lO+0EnQCc0KJkYPDGYFnGWAN470JlX5jBd0GpRhYXjC3kZdknJ+Of5w
 gxhqPfKj2uBqrEGSOQ29PscCLMTH1+gjbFjWPLc/ehr0G7BN3IzrwxhEy6eKEZT9U2
 38SnAjw+j4WbJmKI45TmhCH/yLnOkHNEoD9qf7p6JMpAYiJ8b/M8xhqiMZKCRj0HQf
 mnd9iMBwZnoYSf5vOc7fTZqTMocgIg7FTVXIYKpkgsLtDNsiBwIooU++eaNee0Xqiu
 ECuffi/LbXkxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 07/10] drm/xe/pf: Align VF GGTT allocations to PAGE_SIZE
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260918100533.567225-19-satyanarayana.k.v.p@intel.com>
References: <20260918100533.567225-12-satyanarayana.k.v.p@intel.com>
 <20260918100533.567225-19-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 10:41:36 +0000
Message-Id: <20260918104137.598FE1F000FF@smtp.kernel.org>
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
- [High] xe: mismatch between VF GGTT base alignment and VRAM BO 64K alignm=
ent
--

commit e8215b94fc1fb931f84ceb50cd8a30a2324322f3
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
drm/xe/pf: Align VF GGTT allocations to PAGE_SIZE

This patch modifies the Physical Function to align Virtual Function GGTT
ranges to the host CPU page size instead of 64K VRAM alignment. This allows
for finer-grained GGTT partitioning without imposing VRAM alignment
constraints on the GGTT base address.

> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm=
/xe/xe_gt_sriov_pf_config.c
> index 6947aeed458ed..a2083d3b2eeeb 100644
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
> +	return XE_PAGE_SIZE;

[Severity: High]
Does dropping the 64K alignment requirement for the GGTT base break the
absolute alignment for VRAM BOs in the VF's GGTT?

When the PF allocates the VF's GGTT base at a 4K boundary that is not
64K-aligned, the VF driver will still allocate a VRAM BO requesting 64K
alignment from the relative allocator:

drivers/gpu/drm/xe/xe_ggtt.c:__xe_ggtt_insert_bo_at()
        if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
                alignment =3D SZ_64K;

Because the relative allocator is initialized with a base of 0, the node's
relative offset is 64K-aligned. However, the absolute address
(node->start + ggtt->start) will inherit the unaligned 4K base, defeating
the explicit 64K alignment required by the hardware on DGPUs requiring
64K VRAM pages.

Could this cause hardware page walker faults, or silently break the
alignment of existing mappings if a new ggtt->start during VF migration
has a different alignment modulo 64K?

>  }
> =20
>  static u64 pf_get_min_spare_ggtt(struct xe_gt *gt)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918100533.5672=
25-12-satyanarayana.k.v.p@intel.com?part=3D7
