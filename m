Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E06CCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 13:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DB810E10E;
	Fri, 16 Oct 2026 13:44:21 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCBF10E10E
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 13:44:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 16BA860008;
 Fri, 16 Oct 2026 13:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26F91F000C5;
 Fri, 16 Oct 2026 13:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792158252;
 bh=tv4amlGVv035dSO5QR5eM0WQ8j1X5siSQ7kwMqbofIk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=nU/PRvsDxEpYl4kDbasBqqIwa4/0pDUluIkdRvJiyHUgw4YDrQjJDHaKQtilSN0v5
 fWkwWHWtvQ+tLVa9WvxggqRiwuzl8zWpC3KGr8Uvrrd9tyqeRu+IXyxDWwNzIFOums
 /7jxU7AWpTdVs7wjb+WDGn2u0RGLBPEymntGIDkPM/qV27PtVoVd8rgwYye8+xUKzP
 cnULkpZ37EWug8VRHPcr3edgLIYCcN85dpqZbSwztaJjR1vlEsYQjR2zEDPEWclnpU
 NdLs0ECZBn4utXCnpv12wn9dwpjCykaflgbe1481bVw8wTaaj98QoUjRxn+OOfuc8H
 remmqLkuASGZg==
Message-ID: <sashiko-outbox-174395@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] drm/xe: Don't abort the shrinker walk on -EBUSY
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261016133523.3622-2-thomas.hellstrom@linux.intel.com>
References: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
 <20261016133523.3622-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 13:44:12 +0000
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
- [Medium] xe: loop termination check bypassed on -EBUSY causing unbounded =
shrinker scan
--

commit a9661e97694161cd803806ccc4ad309e99a9f298
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/xe: Don't abort the shrinker walk on -EBUSY

xe_bo_shrink() returns -EBUSY for bos that can't currently be shrunk.
The shrinker LRU walk treated any negative return value as fatal and
aborted. This commit changes it to skip bos for which xe_bo_shrink()
returns -EBUSY and continues the walk.

> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shr=
inker.c
> index deb4378c1ec15..4e4da76936f49 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -113,6 +113,9 @@ static int __xe_shrinker_walk(struct xe_shrinker *shr=
inker,
>  				continue;
> =20
>  			lret =3D xe_bo_shrink(ctx, ttm_bo, flags, scanned);
> +			/* Like the TTM LRU walk, skip bos we can't shrink now. */
> +			if (lret =3D=3D -EBUSY)
> +				continue;

[Severity: Medium]
Does this continue statement inadvertently bypass the loop termination chec=
k?

In xe_bo_shrink(), the scanned counter is incremented before potentially
returning -EBUSY:

xe_bo_shrink() {
	...
	*scanned +=3D tt->num_pages;
	lret =3D ttm_bo_shrink(ctx, bo, ...);
	...
	return lret;
}

If a sequence of buffer objects return -EBUSY from ttm_bo_shrink(), could
this introduce a regression where the shrinker performs an unbounded scan
over the list because the *scanned >=3D to_scan check at the bottom of the
loop body is bypassed?

>  			if (lret < 0) {
>  				ret =3D lret;
>  				goto out;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016133523.3622=
-1-thomas.hellstrom@linux.intel.com?part=3D1
