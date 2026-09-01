Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D847C61DD6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 03:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9299A10E372;
	Tue,  1 Sep 2026 03:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OFwN70Rh";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7329010E372
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 03:42:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5FE63601DE;
 Tue,  1 Sep 2026 03:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEFCA1F000E9;
 Tue,  1 Sep 2026 03:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788234171;
 bh=bzw8No3ogiFBFnVRug5mRK1xLgmyDopy2ls04SGGkZw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=OFwN70Rh0HJbSkfsrkYIVVV6HRnhjKhj+G6Z35T0KRb1ycccAqWXzPs4elKEPkkKd
 0BOGfXVp4U9qQbtk5Tclmqehh39/Q9E+Oxm/R+GgSkP2p6MpFHA0vANjpePWm+hYvb
 9EUrA5MGrWTXkRPxXgDtkveYYwsKWTGTaMj5rwCTRlF7MNPlTJo/dPNVGwZmLJY/XU
 XQD3MYQvAceU5uiOzfO6b/40DNgvXInIHHi9j/IC3QPGEgzq9kZjz2QXqeKB1phf59
 HMHToJLBQmVAPBh9DZzSw+XqL6B4RTeoX45OpPJU9hA49uOp9Wy2y9FBBsxbhGBzJe
 xoqHoS++F/WLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] drm/xe/shrinker: Do not abort the walk on
 unshrinkable bos
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260901033153.219481-2-shuicheng.lin@intel.com>
References: <20260901033153.219481-1-shuicheng.lin@intel.com>
 <20260901033153.219481-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 03:42:50 +0000
Message-Id: <20260901034250.DEFCA1F000E9@smtp.kernel.org>
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
- [High] Skipping unshrinkable BOs with `continue` without incrementing the=
 `scanned` counter creates an unbounded traversal of the LRU list.

Pre-existing issues:
- [High] The caller `xe_shrinker_walk()` drops all pages freed in earlier e=
scalation passes if a subsequent pass fails, causing lost reclaim accountin=
g.
--

commit 81485d1f41620f8c926444a5582c744bb5207d71
Author: Shuicheng Lin <shuicheng.lin@intel.com>

drm/xe/shrinker: Do not abort the walk on unshrinkable bos

The commit makes the shrinker skip over unshrinkable BOs instead of aborting
the walk, and attempts to fix the lost reclaim count when returning an erro=
r.

> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shr=
inker.c
> index 83374cd576608..953a911b51b30 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -79,8 +79,10 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
>  				continue;
> =20
>  			lret =3D xe_bo_shrink(ctx, ttm_bo, flags, scanned);
> +			if (lret =3D=3D -EBUSY)
> +				continue;

[Severity: High]
Does skipping unshrinkable BOs here create an unbounded traversal of the LRU
list?=20

If xe_bo_shrink() returns -EBUSY, the scanned counter is not incremented.
This bypasses the termination check, allowing the loop to endlessly traverse
the BO LRU list when it contains many pinned or unshrinkable buffers.

This is a pre-existing issue in the same loop, but the
ttm_bo_shrink_suitable() check also fails to increment the scanned counter:

			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
				continue;

>  			if (lret < 0)
> -				return lret;
> +				return freed ? freed : lret;

[Severity: High]
This isn't a bug introduced by this patch, but is there a similar lost recl=
aim
accounting issue in the caller xe_shrinker_walk()?

When xe_shrinker_walk() transitions to the second pass (non-idle objects), =
an
error drops the pages successfully freed in the first pass:

	freed =3D lret;
	if (!ctx->no_wait_gpu) {
		lret =3D __xe_shrinker_walk(xe, ctx, save_flags, to_scan, scanned);
		if (lret < 0)
			return lret;

Could this cause the memory management core to receive a report of 0 pages
freed, incorrectly assuming reclaim is failing and triggering premature OOM?

> =20
>  			freed +=3D lret;
>  			if (*scanned >=3D to_scan)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901033153.2194=
81-1-shuicheng.lin@intel.com?part=3D1
