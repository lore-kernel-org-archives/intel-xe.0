Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FFEC79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C795610F1E9;
	Wed,  9 Sep 2026 16:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OgqE6ecd";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA22910F1E9
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 16:29:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id CFE53601EF;
 Wed,  9 Sep 2026 16:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2A01F000FF;
 Wed,  9 Sep 2026 16:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788971359;
 bh=XhMwJhUea01O8BYdatJPf8kelMjAzU20nHBhnfdNLNw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=OgqE6ecdzlbiAZeIfnm5jb5+hjSIKO3fY0lKwkMeYYbajifYj5p1meTaZODzVa6z6
 lnPCSixXbPlc81Cha7u+mi3Wtm5SkbVlMff68U+Fo8PgKzHPuxIWsUChFLzrNcu8pZ
 4G4ja5ufUBvny5oBR+r00PBfkZDPvHipbWeiI4yBNmpUpGDA618Gbbx9ak4zr6JKwG
 OCg26s1pJls00h/Txhg5bYLlWws7wUBWIrs79vRuXL8qEkGsBwzQixTOUvwjoRmOCq
 Dq13tZqoS+jzFRg4D2TJjnDoOI0DdDiloZq+8YPUw7o82pxADwZRhM/v0YJiaXCLrf
 VGUbFbHhgZ0XQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] drm/xe/shrinker: Return the freed page count
 through a parameter
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909162102.1097006-2-shuicheng.lin@intel.com>
References: <20260909162102.1097006-1-shuicheng.lin@intel.com>
 <20260909162102.1097006-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 16:29:18 +0000
Message-Id: <20260909162919.5B2A01F000FF@smtp.kernel.org>
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
- [High] The LRU shrinker walk aborts entirely upon encountering a buffer o=
bject (BO) that is unsuitable for shrinking, potentially causing a livelock=
 where the shrinker fails to make progress.
--

commit fdbe7158df33982691ee678948191c46bf0f5148
Author: Shuicheng Lin <shuicheng.lin@intel.com>
drm/xe/shrinker: Return the freed page count through a parameter

This commit refactors __xe_shrinker_walk() and xe_shrinker_walk() to return
status errors and accumulate freed pages via a parameter. This prevents
dropping the count of already freed pages when an error occurs during the s=
can.

> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shr=
inker.c
> index 83374cd576608..89445cd202380 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
[ ... ]
> @@ -82,7 +83,7 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
>  			if (lret < 0)
>  				return lret;
> =20
> -			freed +=3D lret;
> +			*freed +=3D lret;

[Severity: High]
This is a pre-existing issue, but does this early return abort the entire
shrinker walk if a single buffer object is unsuitable for shrinking?

In xe_bo_shrink() located in drivers/gpu/drm/xe/xe_bo.c, -EBUSY is
legitimately returned if the BO cannot be shrunk. For instance, when
a non-purgeable BO is encountered during a purge pass:

        if (!(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE) ||
            (flags.purge && !xe_tt->purgeable))
                return -EBUSY;

        if (!xe_bo_eviction_valuable(bo, &place))
                return -EBUSY;

If __xe_shrinker_walk() receives this -EBUSY, the entire iteration is abort=
ed.
Because the iteration starts from the head of the LRU, an unshrinkable BO at
the head could perpetually abort the shrinker on its first step, failing to
make progress under memory pressure.

Should the loop ignore -EBUSY and continue scanning?

>  			if (*scanned >=3D to_scan)
>  				break;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909162102.1097=
006-1-shuicheng.lin@intel.com?part=3D1
