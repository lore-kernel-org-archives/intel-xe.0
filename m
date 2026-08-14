Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031A6C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 14:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B5E10E57C;
	Fri, 14 Aug 2026 14:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ke0Yq/zj";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF0B10E57C
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 14:56:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 801F360120;
 Fri, 14 Aug 2026 14:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5771F000E9;
 Fri, 14 Aug 2026 14:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786719382;
 bh=4O/vJgoLOkrJfHmzTfuRVs/jd4S26960DZb0VsLCPoo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Ke0Yq/zjdYADzJxgllr3N6WCXvz2D2Z/oP+hDeR1qMHn3S25ZAa5+fQXJhW7F6rR6
 qA3H4/kB7xyZi7emMZkyOxDpTF4H6pPMZCINftz8EDHWqIvlt7F0m+a9ry08fNLFVu
 7qv7v3YeHyAhUuMCfuKaYJPAP7xsg/HdEd/V/vGrohq/yf6W2hOy3bp5bJNRWlhUuh
 7aDGa9dh26Hbkf25hEB9AEg217hN3NSqZw0+5vlp8VNpagNYJBjFMmkelqYmaNNLSl
 FGr+8gQMUT/nWlZN0x+M8SyZeVLXnBp6ObK5HNQVkYlprfLXhoeaeV7f864fwvX+Ke
 AZvDMZX6uKYMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] drm/xe: Track number of populated ttm_tts in the
 shrinker
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260814143737.49684-2-thomas.hellstrom@linux.intel.com>
References: <20260814143737.49684-1-thomas.hellstrom@linux.intel.com>
 <20260814143737.49684-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 14:56:21 +0000
Message-Id: <20260814145622.0E5771F000E9@smtp.kernel.org>
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
- [High] Double subtraction of shrinker accounts (including the new populat=
ed_tts) during nested external pins.
--

--- Patch [1]: [PATCH v2 1/2] drm/xe: Track number of populated ttm_tts in =
the shrinker ---
commit 96b66a44985d6775af6634dd1b400406d1705547
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/xe: Track number of populated ttm_tts in the shrinker

This commit introduces a populated_tts counter to the xe shrinker to track
the number of shrinkable or purgeable ttm_tt objects. It modifies
xe_ttm_tt_account_add() and xe_ttm_tt_account_subtract() to increment and
decrement this new counter alongside existing page accounting. Additionally,
it updates xe_shrinker_mod_pages() to handle the new tts delta.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index dde309821237b..0ddc1d13d6ba6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -450,9 +450,9 @@ static void xe_ttm_tt_account_subtract(struct xe_devi=
ce *xe, struct ttm_tt *tt)
>  	struct xe_ttm_tt *xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
> =20
>  	if (xe_tt->purgeable)
> -		xe_shrinker_mod_pages(xe->mem.shrinker, 0, -(long)tt->num_pages);
> +		xe_shrinker_mod_pages(xe->mem.shrinker, 0, -(long)tt->num_pages, -1);
>  	else
> -		xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0);
> +		xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0, -1);
>  }

[Severity: High]
This is a pre-existing issue, but won't the new populated_tts counter also
underflow here when external DMA-bufs are pinned multiple times?

In xe_bo_pin_external(), the BO is unconditionally subtracted from the
shrinker tracking even if it is already pinned:

	ttm_bo_pin(&bo->ttm);
	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
		xe_ttm_tt_account_subtract(xe, bo->ttm.ttm);

Similarly, xe_bo_unpin_external() unconditionally adds it back without
checking if bo->ttm.pin_count actually reached 0:

	ttm_bo_unpin(&bo->ttm);
	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
		xe_ttm_tt_account_add(xe, bo->ttm.ttm);

If a userspace process imports an external DMA-buf and maps/pins it multiple
times, xe_ttm_tt_account_subtract() is called for every pin, and
xe_ttm_tt_account_add() for every unpin. Since xe_ttm_tt_account_add() was
only called once upon initial population, the nested subtractions cause an
underflow.

Could this lead to the shrinker fields, including the new populated_tts,
becoming massive positive numbers when evaluated as unsigned long in
xe_shrinker_count(), potentially misleading kswapd to continuously scan
and consume 100% CPU?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814143737.4968=
4-1-thomas.hellstrom@linux.intel.com?part=3D1
