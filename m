Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97001CD37B5
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 06:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B04110E169;
	Mon, 11 May 2026 06:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="cDeM8dxd";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9F110E169
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 06:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1778482718;
 bh=pAZ9FanEZN6R8rYl2PLQfiHi6tRKFHYXt7hOQ4FzaKU=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=cDeM8dxdoFW04fuOofF+RVBCpMeHVWqZVpquj/fTkQKEIeGzMb44fIEQdlfRhyp60
 IN5EW6kDfzrWdt7pkQuXgvO+TMce6Q8q4aLzsNLy/xrC8PXvU5JygMpeFgDwjczEws
 iAzu5EQvtDJmZIow8MPHOyagJWAtUb/wYQ65TC/f+At6oXIGLhCEYPHeYtQ0lS0Hmm
 hkhoA0ixTf4thN10CLRsl7IOh495O60z9XY8ne6SMnLZQDVcDHg0zcuVcspBu1+PzQ
 Ww0dEB5JPrGVK+wJGvmLb5mgGv4SFiN9QicYtc3l7QVrA5QAlb4QImtaKsGfm+aEY5
 DY4vDdmVBZBKg==
Message-ID: <56f80dfc-4a87-4423-8ce1-e94e6c60ace6@lankhorst.se>
Date: Mon, 11 May 2026 08:58:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Drop unused ggtt_balloon field
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260510205605.642-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20260510205605.642-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hey,

Den 2026-05-10 kl. 22:56, skrev Michal Wajdeczko:
> During recent GGTT refactoring we missed to drop now unused field
> from the xe_tile. Drop it now.
> 
> Fixes: e904c56ba6e0 ("drm/xe: Rewrite GGTT VF initialization")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_tile_types.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
> index 33932fd547d7..0048100ccb72 100644
> --- a/drivers/gpu/drm/xe/xe_tile_types.h
> +++ b/drivers/gpu/drm/xe/xe_tile_types.h
> @@ -106,8 +106,6 @@ struct xe_tile {
>  			struct xe_lmtt lmtt;
>  		} pf;
>  		struct {
> -			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
> -			struct xe_ggtt_node *ggtt_balloon[2];
>  			/** @sriov.vf.self_config: VF configuration data */
>  			struct xe_tile_sriov_vf_selfconfig self_config;
>  		} vf;

Can't believe I missed that. Must have slipped when rebasing.

Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
