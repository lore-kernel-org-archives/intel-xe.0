Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDD4C61DE2
	for <intel-xe@archiver.kernel.org>; Sun, 30 Aug 2026 07:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6F510E011;
	Sun, 30 Aug 2026 07:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fwq/SPBN";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5997F10E011
 for <intel-xe@lists.freedesktop.org>; Sun, 30 Aug 2026 07:14:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E1E1643CD4;
 Sun, 30 Aug 2026 07:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A301C1F000E9;
 Sun, 30 Aug 2026 07:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788074087;
 bh=b/WKPhZX8A6MudRRtYvXsqeiB82Y4yjWmGlHFPRYpUU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=fwq/SPBNgTkjjMrrszPuh5sxyMoGiDzGkUi4AbI7+uhYibeplpIfu67zu7JdcK6kU
 rZJJBwdxJx0fm8kaCWG8gajwJ5uimlIozzLYWtxJc9HqS4h+th/DYrfDwecQlEhwEk
 8YhTja5MDObHb1Ih2F4xLEavbGB3tjCTz6eD3XtU0UrUMs+tOxOlrdQ5G3ZGLozFrO
 SURIavumZshG9eTvHiCfOnNGSa2noAoQeHhsiNF7VgnZx8Xnnbzrb56BWq53cE0yLy
 ZvX460IB4C9mCgST3TPdWPYrASOVR12LOPhieZJ1YYKIFRkgF466e4CI7p2ZDy//Bg
 EgQBjdy8lPxSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] drm/xe/hw_error: Initialize hw_error_work per tile
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260830065603.419055-7-riana.tauro@intel.com>
References: <20260830065603.419055-5-riana.tauro@intel.com>
 <20260830065603.419055-7-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 07:14:47 +0000
Message-Id: <20260830071447.A301C1F000E9@smtp.kernel.org>
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
- [Medium] Ignored return value of devm_add_action_or_reset() leads to sile=
nt failure and permanently disabled workqueues on allocation failure.
--

commit 4131be68c9832cc5157abbfbeb9802dae9fcbca5
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/hw_error: Initialize hw_error_work per tile

This commit updates the hw_error_work initialization to iterate over all
tiles instead of just the root tile, preventing the use of uninitialized
work structs on non-root tiles. It also adds a devm action to cleanly
disable the workqueues during teardown.

> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_=
error.c
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c

[ ... ]

> @@ -544,12 +554,15 @@ static void process_hw_errors(struct xe_device *xe)
>   */
>  void xe_hw_error_init(struct xe_device *xe)
>  {
> -	struct xe_tile *tile =3D xe_device_get_root_tile(xe);
> +	struct xe_tile *tile;
> +	u8 id;
> =20
>  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>  		return;
> =20
> -	INIT_WORK(&tile->hw_error_work, hw_error_work);
> +	for_each_tile(tile, xe, id)
> +		INIT_WORK(&tile->hw_error_work, hw_error_work);
> =20
>  	process_hw_errors(xe);
> +	devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);

[Severity: Medium]
Does this code need to check the return value of devm_add_action_or_reset()
in xe_hw_error_init()?

If memory allocation fails internally, devm_add_action_or_reset() will
immediately execute hw_error_fini() (which disables the workqueues) and
return -ENOMEM. Because the return value is ignored here, the driver will
continue operating normally but with the hardware error workqueue permanent=
ly
disabled. This could lead to a silent loss of functionality where hardware
errors are no longer handled.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830065603.4190=
55-5-riana.tauro@intel.com?part=3D2
