Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CF6CD4F49
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 08:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754E010E6F7;
	Mon, 18 May 2026 08:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="iVjwhs5/";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE02510E6F7;
 Mon, 18 May 2026 08:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1779092112;
 bh=uxeYgyaUk9ehJvth/JCSoeHRgs0GPMHlTXmLGWlZIro=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iVjwhs5/jA29nHD/XegfnVZQnbqQKynQmfJ+S9+It1b11Vt/JcKYaqUJBrNZ2Z4wf
 DMQgqF+/1pD+ytdwuleVHOSJXixF5mZy4I4bXMCkzXEyzgDPV/u/+7R19l2+gPFwXi
 +QO8qgOcYwKIz3nqPOVLRV8sSR/guKV8wPKUDPQOFOizo/C26CXhePiTOQk0SISQx0
 88INne7aGp23hLfau5BtmfmBnP7QDqrWlRnzLlA24TLlqBi0oa07JL0g4UmPK6nH9f
 5UohWUUgXLJZOIGdgTsgsd60W/Tg9VeIdUWbRAqdi4kzVS3SpdAfU5ifO0ba4s60CE
 09sjxUDmdqpVg==
Message-ID: <54bd10bc-84e2-45ad-9df9-cefe91dcf208@lankhorst.se>
Date: Mon, 18 May 2026 10:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/14] drm/xe: Abstract the initial FB PTE checks a bit
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
References: <20260511214122.8468-1-ville.syrjala@linux.intel.com>
 <20260511214122.8468-10-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20260511214122.8468-10-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hey Ville,

Den 2026-05-11 kl. 23:41, skrev Ville Syrjala:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Add a few helpers that allow us to abstract the xe initial FB PTE
> check a bit. Still very ad-hoc compared to the nicely abstracted
> i915 counterpart, but whatever.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_initial_plane.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> index b7e0685351bb..0dabc5709d01 100644
> --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> @@ -18,8 +18,19 @@
>  #include "xe_fb_pin.h"
>  #include "xe_ggtt.h"
>  #include "xe_mmio.h"
> +#include "xe_ttm_stolen_mgr.h"
>  #include "xe_vram_types.h"
>  
> +static bool is_pte_local(u64 pte)
> +{
> +	return pte & XE_GGTT_PTE_DM;
> +}
> +
> +static bool need_pte_local(struct xe_device *xe)
> +{
> +	return IS_DGFX(xe);
> +}
> +
>  static struct xe_bo *
>  initial_plane_bo(struct xe_device *xe,
>  		 struct intel_initial_plane_config *plane_config)
> @@ -43,13 +54,13 @@ initial_plane_bo(struct xe_device *xe,
>  	if (IS_DGFX(xe)) {
>  		u64 pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
>  
> -		if (!(pte & XE_GGTT_PTE_DM)) {
> -			drm_err(&xe->drm,
> -				"Initial plane programming missing DM bit\n");
> +		if (is_pte_local(pte) != need_pte_local(xe)) {
> +			drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
>  			return NULL;
>  		}
This is unnecessary, this is already inside the IS_DGFX branch, so all you're doing is checking twice.
Remove need_pte_local and use the has_lmembar() check directly in the next patch?

>  		phys_base = pte & ~(page_size - 1);
> +
>  		flags |= XE_BO_FLAG_VRAM0;
>  
>  		/*
Extra newline.

Kind regards,
~Maarten Lankhorst

