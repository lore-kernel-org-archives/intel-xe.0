Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816D8C624D3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 17:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6F110EDFE;
	Tue,  1 Sep 2026 17:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L2xdJpjB";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A522D10EDFE
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 17:41:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C6BBE6022D;
 Tue,  1 Sep 2026 17:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2111F000E9;
 Tue,  1 Sep 2026 17:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788284462;
 bh=Ccg8QHTQxsKYJs6R6VFfhZlAi0RtCufHYbIzn7wKnTI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=L2xdJpjB/KA3drtYu0bdg59CRpSOoNYP4zKGvodx2wJo6n20x8b+ytZ2+V8ZkFtLa
 dscQtUXVnmxnMpC4DysOvarGTOE18SxteU6t4WhkCylRF3n3lJSSZzSCpjxuSeTnBJ
 Zxf2Ph5SzZ0mGQufNDEzrOLp5fi/loB3gbyWdwe8TmDDsQU+GDtWoH0Loh2lsEVnZ3
 YkwcnjXNhxfJftQaTnAUg7UXPQSPwtL60hz4FkXV7xcCwo5zLbKX+YWMnXsqZCKP2f
 4n9PT3IOwUEhcwSettbsTekjlQKUCqlEcn5J8ICZiNieEnjY4z2gIa6Qqhlue6wumk
 ltb5GPU14cF+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] drm/xe/shrinker: Take a runtime PM ref before
 shrinking non-system memory
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260901173059.455469-3-shuicheng.lin@intel.com>
References: <20260901173059.455469-1-shuicheng.lin@intel.com>
 <20260901173059.455469-3-shuicheng.lin@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 17:41:01 +0000
Message-Id: <20260901174102.5C2111F000E9@smtp.kernel.org>
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
- [High] Shrinker walk aborts entirely on a single unshrinkable BO, permane=
ntly wedging reclaim.
--

commit 42955bdd48d36fa90e0e98c5b4e8c6cdb3166430
Author: Shuicheng Lin <shuicheng.lin@intel.com>

drm/xe/shrinker: Take a runtime PM ref before shrinking non-system memory

This commit modifies the shrinker to take a runtime PM reference before
scanning TT memory, as shrinking non-system memory invalidates GPU mappings
which requires the device to be active. It queues a PM worker and halts the
walk if the device is suspended, and ensures the walk stops once the scan
target is met.

> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shr=
inker.c
> index 7f40153911ffa..1bcbe764796e4 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
[ ... ]
> @@ -71,16 +73,32 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
[ ... ]
>  		ttm_bo_lru_for_each_reserved_guarded(&curs, man, &arg, ttm_bo) {
>  			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
>  				continue;
> =20
>  			lret =3D xe_bo_shrink(ctx, ttm_bo, flags, scanned);
> -			if (lret < 0)
> -				return freed ? freed : lret;
> +			if (lret < 0) {
> +				if (!freed)
> +					freed =3D lret;
> +				goto out;
> +			}

[Severity: High]
This is a pre-existing issue, but does this error handling permanently wedge
memory reclaim?

If the first BO on the LRU is not purgeable during a purge pass, or is not
eviction valuable, xe_bo_shrink() returns -EBUSY. __xe_shrinker_walk() then
immediately aborts the LRU walk via this 'goto out' path (and previously via
the direct return) instead of skipping the BO and continuing the walk.

Since the unshrinkable BO is not moved to the LRU tail, subsequent shrinker
invocations will repeatedly encounter the exact same BO, abort, and return
SHRINK_STOP without making any progress. Should this continue the loop on
-EBUSY rather than aborting the entire walk?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901173059.4554=
69-1-shuicheng.lin@intel.com?part=3D2
