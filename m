Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745C4CCA462
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 23:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2912E10E08E;
	Thu, 15 Oct 2026 23:27:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9120310E08E
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 23:27:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 05AEC43F65;
 Thu, 15 Oct 2026 23:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B6D1F000C4;
 Thu, 15 Oct 2026 23:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792106866;
 bh=E5izsR8HvhoT2eoqT3BZG52RnGUmTOLudfb8nnwjBPQ=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=fFRf6pVW+D2WOlqnqtBIwNZAjcvKbprW0UmOjuLHFI5W612RjYpxVRcL4KI8O/TxV
 9SpqttfZgM52FeQ0cupu/FSTf30wnrEYjZ0BEhhNlk14NV46OvXxLaHxhtZqfo8hxX
 BW+L6EI7Ytv/zAbdyXdyxVcngderlX0llCJrY8EDjSUDDFBLkDQeJCdNOr0bfviAtm
 fRKDTgHvSjb9tjusgvkRBLIxFzy5p2dM4n+vXG1bCwrQCfbsL3JO9jTa6YWAWUxi0M
 5bIsDl4Utpl89insPtZWH/MK7b7EAPsbW3YX+iq+/9Iz3hptNt7iXX0QYumSFaLZh9
 0VDGiGGvaDCVQ==
Message-ID: <sashiko-outbox-173463@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Add a minimum age gate to the shrinker
To: "Matthew Brost" <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261015231733.624746-1-matthew.brost@intel.com>
References: <20261015231733.624746-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 23:27:46 +0000
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
- [High] drm/xe: early exit on young BOs during non-blocking shrinker pass =
skips wait and writeback passes
--

commit 6b83dedb1afbfc65819c5071643ac8eea0a4a7d4
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add a minimum age gate to the shrinker

This patch introduces a minimum age threshold for the BO shrinker to
avoid evicting recently used buffers, providing a sysfs attribute for
the delay. It implements an early exit mechanism when encountering young
BOs during the shrinker walk to prevent thrashing.

> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shr=
inker.c
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c

[ ... ]

> @@ -112,6 +116,16 @@ static int __xe_shrinker_walk(struct xe_shrinker *sh=
rinker,
>  			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
>  				continue;
> =20
> +			/*
> +			 * The LRU is roughly age ordered, so everything past
> +			 * the first young BO is most likely young too. Stop
> +			 * here.
> +			 */
> +			if (xe_bo_shrink_too_young(ttm_bo, min_age)) {
> +				*young =3D true;
> +				goto out;
> +			}
> +

[Severity: High]
This logic sets the young flag to true on the first young idle BO. During t=
he
initial non-blocking pass, older BOs that are currently busy on the GPU are
skipped because ttm_bo_shrink_suitable() returns false. Will this cause the
walk to abort prematurely if it encounters a young idle BO immediately after
skipping older busy BOs?

>  			lret =3D xe_bo_shrink(ctx, ttm_bo, flags, scanned);

[ ... ]

> @@ -155,16 +165,16 @@ static int xe_shrinker_walk(struct xe_shrinker *shr=
inker,
>  	swap(no_wait_gpu, ctx->no_wait_gpu);
>  	save_flags.writeback =3D false;
> -	ret =3D __xe_shrinker_walk(shrinker, ctx, save_flags, to_scan, scanned,
> -				 freed);
> +	ret =3D __xe_shrinker_walk(shrinker, ctx, save_flags, min_age, &young,
> +				 to_scan, scanned, freed);
>  	swap(no_wait_gpu, ctx->no_wait_gpu);
> -	if (ret || *scanned >=3D to_scan)
> +	if (ret || young || *scanned >=3D to_scan)
>  		return ret;

[Severity: High]
Does this early return prevent the subsequent blocking and writeback passes
from executing?

If the first non-blocking pass was truncated by a young BO, returning here
means the shrinker completely bypasses the second pass (which waits for the
skipped, older busy BOs) and the third pass (which writes back older dirty
BOs).

Could this break the multi-pass shrinker escalation design and severely
restrict memory reclaim, leading to premature OOM under memory pressure?

> =20
>  	if (!ctx->no_wait_gpu) {
> -		ret =3D __xe_shrinker_walk(shrinker, ctx, save_flags, to_scan, scanned,
> -					 freed);
> -		if (ret || *scanned >=3D to_scan)
> +		ret =3D __xe_shrinker_walk(shrinker, ctx, save_flags, min_age,
> +					 &young, to_scan, scanned, freed);
> +		if (ret || young || *scanned >=3D to_scan)
>  			return ret;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015231733.6247=
46-1-matthew.brost@intel.com?part=3D1
