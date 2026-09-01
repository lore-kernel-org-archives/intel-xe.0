Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08FBC61DD3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 21:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77ED810E0C1;
	Tue,  1 Sep 2026 21:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XjfLZfMz";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C97C10E0C1
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 21:41:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 17BC0600D4;
 Tue,  1 Sep 2026 21:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06E61F000E9;
 Tue,  1 Sep 2026 21:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788298899;
 bh=efjFAf8oCAAGvKhaKgqI3l0Zbc4nz/joTs5IrdfdDAc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=XjfLZfMzvZeFdBNhIaZPvhnNgE2iDUeBUvNzS5qDpuxcoCeiSoREsJu8Yb8aDzVn5
 YSVk2NEcoOqjeIdGXMvjtzDKRMK80B2HjODDw1vZBosFJ2zpN8otMNEjQtNAFl3U1U
 wim3AWy0SZvn6Ki4EaTOObEjCcdbuUa7TQBosSwZq2ZBjVBsoMHOVTecFCOP688VsW
 O2cQON1KsnUKZa+xAvy21r+nMGQZ8YmfmCVYs0m9AaqCDMpRvxaIQrH1TANYwHsPPq
 ETQmwtmEsl7do7d54MZh/hdKqSMr1l2g8v8kfP/KHFR0d0JNG8vt2YYBP0uVDXq1QB
 +fC8l3LfQsecA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] drm/xe/shrinker: Take a runtime PM ref before
 shrinking non-system memory
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260901213331.458982-1-shuicheng.lin@intel.com>
References: <20260901213331.458982-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 21:41:39 +0000
Message-Id: <20260901214139.A06E61F000E9@smtp.kernel.org>
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
- [High] Unbounded spinlock-held scan in LRU list iteration due to skipping=
 entries without advancing the scan counter.
--

commit 63284e08ce6cb6db797af1075279023e72aafb0e
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: drm/xe/shrinker: Take a runtime PM ref before shrinking non-system=
 memory

This commit updates the shrinker to take a runtime PM reference before walk=
ing=20
non-system memory LRU lists. This prevents invalidating GPU mappings while =
the=20
device is suspended, and also stops the walk once the scan target is met.

> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shr=
inker.c
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c

[ ... ]

> @@ -71,16 +73,31 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
>  		ttm_bo_lru_for_each_reserved_guarded(&curs, man, &arg, ttm_bo) {
>  			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
>  				continue;

[Severity: High]
This isn't a bug introduced by this patch, but is there a risk of an
unbounded spinlock-held scan here?

During memory reclaim, __xe_shrinker_walk() iterates over the GPU LRU lists
using ttm_bo_lru_for_each_reserved_guarded(), which acquires the lru_lock
spinlock. If an item is not suitable for shrinking (e.g., pinned or busy),
the loop skips it using continue without incrementing the *scanned counter.

Since *scanned is only incremented inside xe_bo_shrink(), skipping entries
bypasses the bound check entirely. Under high memory pressure with many
pinned or busy buffer objects, could this create an unbounded loop that
leads to soft lockups or CPU stalls?

> =20
>  			lret =3D xe_bo_shrink(ctx, ttm_bo, flags, scanned);
> -			if (lret < 0)
> -				return lret;
> +			if (lret < 0) {
> +				freed =3D lret;
> +				goto out;
> +			}
> =20
>  			freed +=3D lret;
>  			if (*scanned >=3D to_scan)
>  				break;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901213331.4589=
82-1-shuicheng.lin@intel.com?part=3D1
