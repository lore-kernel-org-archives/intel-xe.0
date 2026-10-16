Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2580CCC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 13:45:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBED112847;
	Fri, 16 Oct 2026 13:45:21 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF908112837
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 13:45:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E997860008;
 Fri, 16 Oct 2026 13:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745381F000C4;
 Fri, 16 Oct 2026 13:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792158313;
 bh=QmPEipRgQ4paJqmc9puuystf/KXwsxKTfc9UcfNQotg=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=AkmcYn1CQh9bLAiURbRY+l7gak8bUxP5rJDzjuR28tRFIWOqCP8OFsCCqTlnTfpN/
 40N/IyEupSnT3KV+kYpP+VkMKlxDfNrwpkQUWTkAkETFt8ry+luK3GBubqJR2d21bm
 VgiGRgIcTGwybiAN98x2hLNMUIlxY4oFYinCbMLFxdBXsqgG6uTppokrzLiVLhVZgU
 eHzqU+RcG9mfjvVL27ysEKNkmcGZR7TIHiYtoMnm0Hjr75efZ621kjcsFnriOridF1
 6MlNvfRkzEpO0PaihZl7fTfybyKV+ueg44o35+TW/7crJIWICg+h2CqzQenwRhN6Ej
 dbIRki4SG8Dfg==
Message-ID: <sashiko-outbox-174403@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] drm/xe: Update non-purgeable shrinker batch size
 based on average BO size
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261016133523.3622-5-thomas.hellstrom@linux.intel.com>
References: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
 <20261016133523.3622-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 13:45:13 +0000
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
- [Medium] drm/xe: shrinker count callback serializes direct reclaim via wr=
ite_lock
--

commit a78bd8842e67f957a2ced6d827e1c4a6430ff29b
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
drm/xe: Update non-purgeable shrinker batch size based on average BO size

This commit updates the preferred vmscan batch size for the non-purgeable=20
shrinker based on the average buffer object size. It introduces an=20
exponential moving average that is updated during the shrinker count phase.

> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shr=
inker.c
> index 8e3fe675e0f34..955908b3bdf3e 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
[ ... ]
> @@ -210,15 +235,26 @@ xe_shrinker_count(struct shrinker *shrink, struct s=
hrink_control *sc)
>  	unsigned long num_pages;
>  	bool can_backup =3D !!(sc->gfp_mask & __GFP_FS);
> =20
> +	if (!can_backup)
> +		return SHRINK_EMPTY;
> +
>  	num_pages =3D ttm_backup_bytes_avail() >> PAGE_SHIFT;
> -	read_lock(&shrinker->lock);
> +	/* Consistently use write_lock() for simplicity. */
> +	write_lock(&shrinker->lock);

[Severity: Medium]
Will this exclusive write lock create a system-wide performance bottleneck
during memory reclaim?

The core mm subsystem frequently calls the shrinker's count_objects callback
(xe_shrinker_count) from do_shrink_slab() during direct reclaim. This occurs
concurrently across multiple allocating tasks and CPUs when under memory
pressure.

By changing read_lock() to write_lock() to update the batch_avg heuristic,
this forces all concurrent direct reclaimers system-wide to serialize on th=
is
single lock, which could lead to severe lock contention and performance
degradation.

> =20
> -	if (can_backup)
> -		num_pages =3D min_t(unsigned long, num_pages, shrinker->shrinkable_pag=
es);
> -	else
> -		num_pages =3D 0;
> +	num_pages =3D min_t(unsigned long, num_pages, shrinker->shrinkable_page=
s);
> =20
> -	read_unlock(&shrinker->lock);
> +	if (shrinker->populated_tts) {
> +		unsigned long avg =3D 2 * (shrinker->shrinkable_pages +
> +					 shrinker->purgeable_pages) /
> +				     shrinker->populated_tts;
> +
> +		shrinker->batch_avg =3D max((shrinker->batch_avg + (long)avg) >> 1,
> +					  128L /* default SHRINK_BATCH */);
> +		WRITE_ONCE(shrink->batch, shrinker->batch_avg);
> +	}
> +
> +	write_unlock(&shrinker->lock);
> =20
>  	return num_pages ? num_pages : SHRINK_EMPTY;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016133523.3622=
-1-thomas.hellstrom@linux.intel.com?part=3D4
