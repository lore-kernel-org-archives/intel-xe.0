Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A33BC624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED99210E199;
	Fri,  4 Sep 2026 21:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S3OymedV";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE5A10E199
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:59:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4393942EAA;
 Fri,  4 Sep 2026 21:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76C11F00A3D;
 Fri,  4 Sep 2026 21:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788559156;
 bh=SGK70l8ltpEkgVvI2yuPGB5QIjG3SwPVRnKja0+vd4E=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=S3OymedV2AflQJ9OfkiCHZiUD3nqj1esiXgT9lFF/khw+BegVnnf6GiqQTWtv9+Xk
 sIOnAbGUsFCPgGGjR2vrZWsoaB/pH7cwjbnf3M/bSLBKPi4whFB01DXnqKZ110UrlD
 NCFErP9tDW18WHKz904NuL/lGIH7b7Zy5fkmHDApJdydWyj3rbZ6rURDQ2JwFwB61Q
 YcPwAM4GKpkzE24ENTA8bYPQyuhjGRe0cmf25XGNLDADRBJN1giEhgbawDs5ZXPllA
 sTWMFNr0C+WHLmzNFYBukzNEeVIelQBRw3fNuphlxRF6XAs7yUEcv+miPQu12DIrkf
 rDXSUV/2jpclQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] drm/xe/shrinker: Return the freed page count
 through a parameter
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904215049.543535-2-shuicheng.lin@intel.com>
References: <20260904215049.543535-1-shuicheng.lin@intel.com>
 <20260904215049.543535-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 21:59:16 +0000
Message-Id: <20260904215916.C76C11F00A3D@smtp.kernel.org>
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
- [High] The shrinker scan aborts completely upon encountering a non-eligib=
le BO, degrading reclaim effectiveness.
--

commit f040cd7950a53bb8a92b925733431f658c554101
Author: Shuicheng Lin <shuicheng.lin@intel.com>

drm/xe/shrinker: Return the freed page count through a parameter

This patch updates the xe_shrinker_walk and __xe_shrinker_walk functions to
return the number of freed pages through a pointer parameter. This prevents=
=20
accumulated freed page counts from being discarded if an error occurs later
in the scan.

Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")

> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shr=
inker.c
> index 83374cd576608..89445cd202380 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c

[ ... ]

> @@ -82,7 +83,7 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
>  			if (lret < 0)
>  				return lret;

[Severity: High]
This is a pre-existing issue, but does this logic prematurely abort the
shrinker scan?

When xe_shrinker_scan() initiates a shrinker walk with shrink_flags.purge s=
et
to true, __xe_shrinker_walk() iterates over the TTM LRU list. For each BO, =
it
calls xe_bo_shrink().

If flags.purge is true but the BO itself is not purgeable, xe_bo_shrink() in
drivers/gpu/drm/xe/xe_bo.c intentionally returns -EBUSY:

xe_bo_shrink() {
        ...
        if (!(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE) ||
            (flags.purge && !xe_tt->purgeable))
                return -EBUSY;
        ...
}

Because -EBUSY is less than 0, __xe_shrinker_walk() will immediately abort
the entire scan instead of skipping the ineligible BO and continuing to the
next one.

Could this lead to poor reclaim effectiveness and potential out-of-memory
conditions if the shrinker encounters a single non-purgeable buffer object
on the LRU list?

> -			freed +=3D lret;
> +			*freed +=3D lret;
>  			if (*scanned >=3D to_scan)
>  				break;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904215049.5435=
35-1-shuicheng.lin@intel.com?part=3D1
