Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BF6C79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66FD10F1F8;
	Wed,  9 Sep 2026 16:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dGxXZFUk";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7368810F20E
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 16:33:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 28BA741755;
 Wed,  9 Sep 2026 16:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63781F000FF;
 Wed,  9 Sep 2026 16:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788971582;
 bh=y3b2IHA5BIt3cEoM5rQ8WwPTUG6PzzS2bamIUGN/Auc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=dGxXZFUkxtjMf9sCCrIuNEms0CjUBAZZDAdCDFhflTz0FHBG+4yCLAGXBtxIVjYoI
 WEVotspU3RrtyFTc5Xm/DHwXRubuo3sV4/mOTzXX2WFkvzHBY8bMSAuABGuFOoKOoc
 XJaHM4L3CO2XQ/6Aq70v9MgTTa/95Bkje4g8+ThCIs2R9JKmxKIvyZCU29HJlQAz9u
 Go607LKoKZn8aCJf9N4qXm++VfBwbowf72qUc8pt/MSG2RjSBFK4vA2nJ1ZRbciGJH
 EvZz6dg3n/YTn9dAvcFeaAk/RgRpPQzFgE5PGes1fVFPapmdJst4nlNIZmnMpk4tfo
 /FC8HEGuu9uwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] drm/xe/shrinker: Take a runtime PM ref before
 shrinking non-system memory
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909162102.1097006-3-shuicheng.lin@intel.com>
References: <20260909162102.1097006-1-shuicheng.lin@intel.com>
 <20260909162102.1097006-3-shuicheng.lin@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 16:33:01 +0000
Message-Id: <20260909163301.D63781F000FF@smtp.kernel.org>
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

Pre-existing issues:
- [High] Shrinker scan aborts entirely when encountering a single unsuitabl=
e buffer object.
--

commit 90a5cf734495d4bcf94edcf044500adfd18b2a39
Author: Shuicheng Lin <shuicheng.lin@intel.com>

drm/xe/shrinker: Take a runtime PM ref before shrinking non-system memory

This commit updates the xe shrinker to take a runtime PM reference before
walking non-system memory LRUs. It reuses the existing acquire path to resu=
me
the device directly or queue a worker, and stops the scan early once the
target is met.

> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shr=
inker.c
> index 89445cd202380..deb4378c1ec15 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
[ ... ]
> @@ -75,23 +101,35 @@ static int __xe_shrinker_walk(struct xe_device *xe,
>  		if (!man || !man->use_tt)
>  			continue;
> =20
> +		if (mem_type !=3D XE_PL_SYSTEM && !rpm &&
> +		    xe_device_is_l2_flush_optimized(xe)) {
> +			if (!__xe_shrinker_runtime_pm_get(shrinker))
> +				break;
> +			rpm =3D true;
> +		}
> +
>  		ttm_bo_lru_for_each_reserved_guarded(&curs, man, &arg, ttm_bo) {
>  			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
>  				continue;
> =20
>  			lret =3D xe_bo_shrink(ctx, ttm_bo, flags, scanned);
> -			if (lret < 0)
> -				return lret;
> +			if (lret < 0) {
> +				ret =3D lret;
> +				goto out;
> +			}

[Severity: High]
This is a pre-existing issue, but does this inappropriately abort the entire
LRU traversal rather than skipping to the next buffer object when a non-fat=
al
error code is returned?

During the __xe_shrinker_walk() LRU iteration in
drivers/gpu/drm/xe/xe_shrinker.c, if xe_bo_shrink() returns -EBUSY, the loop
treats this as a fatal error and immediately aborts the entire scan via the
goto out branch.

This can happen frequently, such as when xe_bo_eviction_valuable() evaluates
to false:

drivers/gpu/drm/xe/xe_bo.c:xe_bo_shrink() {
	...
	if (!xe_bo_eviction_valuable(bo, &place))
		return -EBUSY;
	...
}

Will the memory shrinker fail to reclaim pages if it encounters a buffer
object that cannot be evicted, potentially leading to system OOM because
reclaim progress is permanently blocked by the first unsuitable BO?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909162102.1097=
006-1-shuicheng.lin@intel.com?part=3D2
