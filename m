Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B97C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 23:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B2C10E201;
	Mon, 31 Aug 2026 23:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZuiVyGk+";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A643310E201
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 23:01:39 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E14DA601DE;
 Mon, 31 Aug 2026 23:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1661F00A3D;
 Mon, 31 Aug 2026 23:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788217298;
 bh=APr3jFCFAaVDuTZascwWHzqczU2Jr95fzhPUhbcdtCE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ZuiVyGk+CgAVrePuqZ4Sy9U53qRrQDAD0l6hdkNh8qGqx8mQNZ10G5miIJJiAXd2M
 ZC58VST24u+0jpHeNZg8lNg+4cOUmAkS2bOs17y4kPw4Y7yv+D9rPlBPpj6+6zuXpd
 zNl15iJCucACq4xiEhTNSJf65SKB1GcVDAP1SfMgGxEumfBAbUPwRrcBVndkQPM9n5
 J/V5FkQyoymnK9rprZKQiR52bj+V5IIx1u+cmsSkkDvC5AXXZnOi3IfsvBzwDNvgRl
 8hqsLhxT+3KF9Gv0febVDO6mD5wn9mIj82Hh5+nfB5S0q4BbIE+r4QXXPXUXKkbkTe
 DgufkG69EyplA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] drm/xe/shrinker: Take a runtime PM ref before
 shrinking non-system memory
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831225232.118607-1-shuicheng.lin@intel.com>
References: <20260831225232.118607-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 23:01:37 +0000
Message-Id: <20260831230138.6A1661F00A3D@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The shrinker outer loop does not check if the scan target is met=
, leading to unintended GPU wakeups via PM worker.

Pre-existing issues:
- [High] Shrinker scan aborts entirely on unshrinkable BOs and discards suc=
cessfully freed page counts.
--

commit 6f70bd030eb1841c2ee7446baf465783428a0cc6
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: drm/xe/shrinker: Take a runtime PM ref before shrinking non-system=
 memory

This commit modifies the shrinker walk to take a runtime PM reference
before scanning non-system memory. This prevents GPU mapping invalidation
failures when the device is runtime suspended by queuing a worker to wake
the GPU if it is not currently active.

> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shr=
inker.c
> index 83374cd576608..175218b5edd99 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -74,13 +76,25 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
>  		if (!man || !man->use_tt)
>  			continue;
> =20
> +		if (mem_type !=3D XE_PL_SYSTEM && !rpm &&
> +		    xe_device_is_l2_flush_optimized(xe)) {
> +			if (!xe_pm_runtime_get_if_active(xe)) {
> +				queue_work(xe->unordered_wq,
> +					   &shrinker->pm_worker);
> +				break;
> +			}
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
> +				freed =3D lret;
> +				goto out;
> +			}

[Severity: High]
This is a pre-existing issue, but does this error path unintentionally
discard the count of successfully freed pages?

If __xe_shrinker_walk() successfully frees some pages and increments freed,
but then encounters an unshrinkable BO, xe_bo_shrink() will return a
negative error code (such as -EBUSY).

When that happens, this path overwrites the accumulated freed page count
with the error code before jumping to out. This causes any memory
successfully freed prior to the error to be lost and not reported back
to the kernel's memory management subsystem.

> =20
>  			freed +=3D lret;
>  			if (*scanned >=3D to_scan)
>  				break;

[Severity: Medium]
Does this inner break cause unintended GPU wakeups?

When the scan target (to_scan) is satisfied while scanning system memory
(XE_PL_SYSTEM), this break only exits the inner loop. The outer loop will
then proceed to scan XE_PL_TT.

When the outer loop proceeds to XE_PL_TT, the newly added runtime PM check
above will execute and can queue shrinker->pm_worker to wake up the
suspended GPU, even though no further scanning is needed.

>  		}
>  		/* Trylocks should never error, just fail. */
>  		xe_assert(xe, !IS_ERR(ttm_bo));
>  	}
> =20
> +out:
> +	if (rpm)
> +		xe_pm_runtime_put(xe);
> +
>  	return freed;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831225232.1186=
07-1-shuicheng.lin@intel.com?part=3D1
