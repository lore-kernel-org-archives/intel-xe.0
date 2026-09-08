Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CA2C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 18:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D8510E173;
	Tue,  8 Sep 2026 18:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z8vC/E7d";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A3610E173
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 18:55:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AD80741AEB;
 Tue,  8 Sep 2026 18:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC501F00AC4;
 Tue,  8 Sep 2026 18:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788893723;
 bh=ETKeuVU2tC8BLHG5LohsP2zQvnnBy4o97aVLaYu5Bgw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Z8vC/E7df+E84e7I1aIbGlc4zbNazeg76sgX9cQOpoD4QqWUCVZBxcZSOb+swmnV+
 rbFcuD0jphvcnlsmFaK7w1W/E9rRMN1nr61abi9ZeBfWT51A0G16cEqrkB8WB87pOe
 wTV/BDLFuenpN9v+mUTb8qCiYQqZD8UqYL79tiRVm4Q4Vxvesrqxa3qOxH0jfUxV7R
 jEpMCXfnqq7mcIEbr7e7OCjc5UhXTX/PeLL2PWf2aq5K8hMMjaQ49KYIMb01fOZDBS
 JasgSf0oH44C/xWBFXdIiSJtljTi1CCzfckRqdcNH52dSM3rSfHAmBcY6K4GyRerfU
 pB4ImOC2D0xeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Keep walking on SVM eviction failure
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908184346.92332-1-matthew.brost@intel.com>
References: <20260908184346.92332-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 18:55:22 +0000
Message-Id: <20260908185523.6EC501F00AC4@smtp.kernel.org>
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
- [Medium] Unconditionally masking `xe_svm_bo_evict()` errors as `-ENOSPC` =
hides fatal errors and triggers TTM error log spam.
--

commit 8fcbc00a7aa0e3b2119f7df96129747882247423
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Keep walking on SVM eviction failure

This commit adjusts the error handling in xe_bo_move() for SVM eviction
failures. It overwrites the return code from xe_svm_bo_evict() with -ENOSPC
to force TTM to continue walking the LRU list for eviction candidates.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1043,6 +1043,11 @@ static int xe_bo_move(struct ttm_buffer_object *tt=
m_bo, bool evict,
>  		} else {
>  			drm_dbg(&xe->drm, "Evict system allocator BO failed=3D%pe\n",
>  				ERR_PTR(ret));
> +			/*
> +			 * The semantic we want upon SVM eviction failure is
> +			 * keep walking for eviction, which is -ENOSPC.
> +			 */
> +			ret =3D -ENOSPC;

[Severity: Medium]
Does unconditionally overwriting the error with -ENOSPC hide fatal errors l=
ike
-ENOMEM?

When system memory is exhausted, xe_svm_bo_evict() can return -ENOMEM. By
masking this as -ENOSPC, it seems we might break proper error propagation to
higher layers, preventing expected OOM handling.

Furthermore, could this trigger a TTM error log spam loop? When returned to
TTM, -ENOSPC causes ttm_bo_evict() to log an unconditional
pr_err("Buffer eviction failed\n"). Since -ENOSPC is converted to -EBUSY in
ttm_bo_evict_cb(), it signals the LRU walker (ttm_lru_walk_for_evict()) to
skip the BO and continue walking.=20

During genuine resource exhaustion, this might cause a fruitless iteration =
over
the entire LRU list, logging a pr_err() for every single buffer object. Even
benign SVM races might spam the kernel log with errors.

>  		}
> =20
>  		goto out;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908184346.9233=
2-1-matthew.brost@intel.com?part=3D1
