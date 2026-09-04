Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7F1C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 22:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07E710E199;
	Fri,  4 Sep 2026 22:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NwtCCC7Z";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D295310E199
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 22:05:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 00FE060229;
 Fri,  4 Sep 2026 22:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D57B1F00A3D;
 Fri,  4 Sep 2026 22:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788559521;
 bh=ggC8DdPfM22a8ExktEWYjpVUw/GIRME/cHpZ46sqEls=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=NwtCCC7Zf4N2YPLMiySCkyMfl3wx43pI1C/MDcyhhBFXC3aj9Zg1ZJu1lOPZzhfY3
 cQzZtMQAbJK6Aw/wBJDo+Z8aZFkGybd7KVgM+sOcGC81nC+bV9imxKNV7Fbfv1RA+/
 thWtJ9z3NK/mMZBBL/jdEhGE68KEbCLgzjo7u31HxF8fz9Lqj+HsCC8awWWf7hSKq7
 jCWsSCLrshNVionbj2WBFdFuVvVs2ruqyLSluO6ljrtTDOPye6uplJ3CIHyWTbWYS4
 NJ4ZI6keeAqFdnEihXbNuIE3zsbKreq9fq7wN/1zjaeJlMj/ORcVkT1D15ydcbyboV
 z2EYckp3bQA4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] drm/xe/shrinker: Take a runtime PM ref before
 shrinking non-system memory
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904215049.543535-3-shuicheng.lin@intel.com>
References: <20260904215049.543535-1-shuicheng.lin@intel.com>
 <20260904215049.543535-3-shuicheng.lin@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 22:05:21 +0000
Message-Id: <20260904220521.8D57B1F00A3D@smtp.kernel.org>
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
- [High] Premature termination of shrinker scan due to treating -EBUSY on i=
ndividual BOs as a fatal error.
--

commit b598ba1dc223459e465dd240779b658d7d771f73
Author: Shuicheng Lin <shuicheng.lin@intel.com>
drm/xe/shrinker: Take a runtime PM ref before shrinking non-system memory

This commit takes a runtime PM reference before walking memory types other
than XE_PL_SYSTEM in the shrinker to prevent GPU page table zap from
tripping an assert when the device is suspended. It reuses the shrinker's
existing acquire path to resume the device directly or queues a worker if
needed.

> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shr=
inker.c
> index 89445cd202380..13f49ac873b4b 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c

[ ... ]

> @@ -75,23 +95,36 @@ static int __xe_shrinker_walk(struct xe_device *xe,
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
This isn't a bug introduced by this patch, but it carries forward a severe
pre-existing issue in the new error path. Does treating non-fatal
object-level errors as scan-fatal errors prematurely abort the memory
reclaim process?

When the system is under memory pressure, __xe_shrinker_walk() iterates
over the BO LRU list in drivers/gpu/drm/xe/xe_shrinker.c. If it encounters
a BO that is not purgeable or not eviction-valuable, xe_bo_shrink()
correctly returns -EBUSY for that object:

drivers/gpu/drm/xe/xe_bo.c:xe_bo_shrink() {
    if (!(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE) ||
        (flags.purge && !xe_tt->purgeable))
        return -EBUSY;

    if (!xe_bo_eviction_valuable(bo, &place))
        return -EBUSY;
    ...
}

Because lret < 0 triggers an immediate loop break (now via the goto out
statement), encountering a single unshrinkable BO permanently halts the
shrinker scan for that memory type. This prevents the shrinker from
reaching valid evictable objects further down the LRU list, effectively
disabling memory reclaim. Should this loop skip the busy BO and continue
instead of aborting the entire scan?

>  			*freed +=3D lret;
>  			if (*scanned >=3D to_scan)
> -				break;
> +				goto out;
>  		}
>  		/* Trylocks should never error, just fail. */
>  		xe_assert(xe, !IS_ERR(ttm_bo));
>  	}
> =20
> -	return 0;
> +out:
> +	if (rpm)
> +		xe_pm_runtime_put(xe);
> +
> +	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904215049.5435=
35-1-shuicheng.lin@intel.com?part=3D2
