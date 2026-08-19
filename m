Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF59C5DF81
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:23:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A615310E02D;
	Wed, 19 Aug 2026 19:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Uxk/W6JG";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2B910E02D
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:23:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3DD616136F;
 Wed, 19 Aug 2026 19:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBCE31F00A3A;
 Wed, 19 Aug 2026 19:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787167395;
 bh=xNRqwXiAZhv+P1PnYUyo6hV42krzoToGnfjrEgVdhT8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Uxk/W6JGk0mLceu8Gh2I+cSUpEaqcz0qYFH3MHdTtbrgZMgaStvwRREQKnpzw11DW
 DGZDQItYU9ZxGDbs0WAPFTxkFi6lph0bmTYMJfaN9uCh5HcfYbXJQzczX9bQc2muUa
 NMTFqE60W8ccsYJw5zUi2Lx7sXw4xQ73wlnBq9+4AJxXD/6FfsmVs5DJOE+7Z6YmKF
 z4Fch1VJ9zYSdkCmK7Qg7gWNbTztODrpYrhojeFt1fAo6XdWoYWbVNoZ6iwBKUbZmg
 po2I3mOtlKRDkwk1vJH8RtnsjLFtizPQNQHBL2rK5ws/mH8jZeNk3d7eUYeWPkxcLx
 E5D1qaOb1FEug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/12] drm/xe/pat: Report missing PAT table using
 structured xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260819191442.1957986-10-dnyaneshwar.bhadane@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-10-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 19:23:14 +0000
Message-Id: <20260819192314.CBCE31F00A3A@smtp.kernel.org>
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
- [High] The fallback path for missing PAT tables does not abort execution,=
 resulting in an uninitialized `xe->pat.ops` pointer being dereferenced.
--

--- Patch [9]: [PATCH 09/12] drm/xe/pat: Report missing PAT table using str=
uctured xe_log API ---
commit 08576418698c3b8696a3e32ba77fd4f46243b78e
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/pat: Report missing PAT table using structured xe_log API

Replace drm_err() with xe_log_err() using the PAT component tag
when a platform has no matching PAT table entry.

> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 4331ef097ba0c..66a2d76ea00b5 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c

[ ... ]

> @@ -686,8 +687,9 @@ void xe_pat_init_early(struct xe_device *xe)
>  		 * raise an error rather than trying to silently inherit the
>  		 * most recent platform's behavior.
>  		 */
> -		drm_err(&xe->drm, "Missing PAT table for platform with graphics versio=
n %d.%02d!\n",
> -			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> +		xe_log_err(xe, PAT, -EINVAL,
> +			   "Missing PAT table for platform with graphics version %d.%02d!\n",
> +			   GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>  	}
> =20
>  	xe_assert(xe, xe->pat.ops);

[Severity: High]
This is a pre-existing issue, but since you are modifying this error path,
I wanted to ask about the missing early return here.

When a platform doesn't match any known PAT table (such as when force-probi=
ng
a new unconfigured PCI ID), xe_pat_init_early() logs an error but continues
execution. This leaves xe->pat.ops uninitialized.

In debug builds, this will immediately crash on the subsequent assertion:

	xe_assert(xe, xe->pat.ops->dump);

In non-debug builds, it propagates to xe_pat_init() where it unconditionally
dereferences the uninitialized pointer:

	if (xe_gt_is_media_type(gt))
		xe->pat.ops->program_media(gt, xe->pat.table, xe->pat.n_entries);
	else
		xe->pat.ops->program_graphics(gt, xe->pat.table, xe->pat.n_entries);

Should this error path abort initialization rather than continuing with an
uninitialized xe->pat.ops pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819191442.1957=
986-1-dnyaneshwar.bhadane@intel.com?part=3D9
