Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2321BC5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 14:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B608C10E57B;
	Fri, 14 Aug 2026 14:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="frVgo/ju";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6260A10E57B
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 14:45:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0FA2143E19;
 Fri, 14 Aug 2026 14:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8CC01F00A3A;
 Fri, 14 Aug 2026 14:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786718715;
 bh=OPBDQhRkBu/cFmxqGs/MB0vQqMRbNyItPlhvsZpLduI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=frVgo/juiYeI9CWWJs7ZOQROdHTcDfAWSLDLyJxibP4kwp074Tl+eBpvwairlrY3+
 Y5XpN3Pnv2hyC1VN7c8AOY4JyPidhtGC7JwQ9tQk9qQLLLpU34R8eJylzKV4rH40r9
 3vBgu+YM9UvevpdaqEONNwW62Te/IXmZzJohqM9NctalJ0dZTGu+EjAYbDW1r18zwY
 TvMXq4+dKAtNDeyRO0tyZvoN1GizL8rSf9pYFxpJckAmfu2ZOS7e1UrdR/37aYd4sY
 uc6+EtUxnOyk29NyvW5sDUYcZ34gXw/BH7dZbix/wP2sy/HeIea8SEhZtIrM2iGGut
 bDarAq41WS4eA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/xe: Update shrinker batch size based on
 average BO size
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260814143737.49684-3-thomas.hellstrom@linux.intel.com>
References: <20260814143737.49684-1-thomas.hellstrom@linux.intel.com>
 <20260814143737.49684-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 14:45:15 +0000
Message-Id: <20260814144515.C8CC01F00A3A@smtp.kernel.org>
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
- [Medium] Concurrent read-modify-write of the shared shrinker batch size w=
ithout synchronization causes a data race.
--

--- Patch [2]: [PATCH v2 2/2] drm/xe: Update shrinker batch size based on a=
verage BO size ---
commit 93a100ad39134ef7ca30d7a7dc94040b4d8bbe71
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/xe: Update shrinker batch size based on average BO size

This commit updates the preferred vmscan batch size based on the average
number of pages per GEM object. It adjusts the batch size as an exponential
moving average to avoid firing the shrinker for requests that are too small
to free an average-sized object.

> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shr=
inker.c
> index cded230f5459c..284fce207705c 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
[ ... ]
> @@ -157,8 +159,32 @@ xe_shrinker_count(struct shrinker *shrink, struct sh=
rink_control *sc)
>  		num_pages =3D 0;
> =20
>  	num_pages +=3D shrinker->purgeable_pages;
> +	total_pages =3D shrinker->shrinkable_pages + shrinker->purgeable_pages;
> +	populated_tts =3D shrinker->populated_tts;
>  	read_unlock(&shrinker->lock);
> =20
> +	/*
> +	 * Update our preferred vmscan batch size for the next pass.
[ ... ]
> +	 */
> +	if (populated_tts) {
> +		unsigned long avg =3D 2 * total_pages / populated_tts;
> +
> +		shrinker->shrink->batch =3D
> +			max((shrinker->shrink->batch + avg) >> 1,
> +			    128UL /* default SHRINK_BATCH */);

[Severity: Medium]
Will this concurrent update cause a data race?

Since the lock is released with read_unlock just before this block, multiple
tasks entering xe_shrinker_count during direct reclaim or kswapd could
perform this read-modify-write concurrently.

While occasional lost updates to this heuristic might be functionally benig=
n,
could this unprotected access trigger concurrency sanitizers?

> +	}
> +
>  	return num_pages ? num_pages : SHRINK_EMPTY;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814143737.4968=
4-1-thomas.hellstrom@linux.intel.com?part=3D2
