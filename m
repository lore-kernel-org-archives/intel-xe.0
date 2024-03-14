Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB15EC54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953CD10EA1C;
	Thu, 14 Mar 2024 17:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jfqb/tfR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B63010EA1C
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710435917; x=1741971917;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=MHAsmnaZ4w/02+qN2Xu0shFcigvENnAsdmHN34VFPhQ=;
 b=Jfqb/tfRLHw6YyrxMmo/6qlMi9bRQud5CNRE/gXfE7PymlT58fPAUf4x
 c5x0vnTN/gsYzmH2d/usaUiqY8kMrHGjpfC0WJ2/+UzxqjA1ti/d2dg63
 sEwgmgS1l0SJW+8bML1Do/cyH+079HMuejopY+ZyVHrUoY73mAAIWDeU0
 xq9SImfPpv29L9/uda6AaDkKrWvlJKnB8dsjahzuc0AVNP4WXQvZmKofk
 KyB4zF2+4HWnHxz6DjTDtnI3BtH2eJuMaTw/iALAZMfKEZXPC2Nflnk+w
 9q75TdvVsnly7lEU+Kozp3VwsZixRbVVx0Apvp/lSqsJGUWlCpJ3Hhs/9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16665647"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="16665647"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="16954966"
Received: from unknown (HELO [10.245.244.240]) ([10.245.244.240])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:05:15 -0700
Message-ID: <4c12d45a-366d-454e-ba1d-af813732c551@intel.com>
Date: Thu, 14 Mar 2024 17:05:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/display: mark dpt as uncached
Content-Language: en-GB
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 intel-xe@lists.freedesktop.org
References: <20240314162054.75751-1-juhapekka.heikkila@gmail.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240314162054.75751-1-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 14/03/2024 16:20, Juha-Pekka Heikkila wrote:
> make dpt as uncached to avoid pipe faults on some devices

s/make/Mark/

Also missing full stop.

> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Did this help on ADL btw? I don't think there are any PAT bits in the 
GGTT on that hw so this just noops, right? Or am I misremembering...

In addition to this I think we might also want something like:
https://patchwork.freedesktop.org/series/131148/

> ---
>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 722c84a56607..98592994c8d4 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -30,7 +30,7 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
>   
>   		for (row = 0; row < height; row++) {
>   			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
> -							      xe->pat.idx[XE_CACHE_WB]);
> +							      xe->pat.idx[XE_CACHE_NONE]);
>   
>   			iosys_map_wr(map, *dpt_ofs, u64, pte);
>   			*dpt_ofs += 8;
> @@ -62,7 +62,7 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
>   		for (column = 0; column < width; column++) {
>   			iosys_map_wr(map, *dpt_ofs, u64,
>   				     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
> -				     xe->pat.idx[XE_CACHE_WB]));
> +				     xe->pat.idx[XE_CACHE_NONE]));
>   
>   			*dpt_ofs += 8;
>   			src_idx++;
> @@ -119,7 +119,7 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
>   
>   		for (x = 0; x < size / XE_PAGE_SIZE; x++) {
>   			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
> -							      xe->pat.idx[XE_CACHE_WB]);
> +							      xe->pat.idx[XE_CACHE_NONE]);
>   
>   			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
>   		}
> @@ -165,7 +165,7 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
>   
>   		for (row = 0; row < height; row++) {
>   			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
> -							      xe->pat.idx[XE_CACHE_WB]);
> +							      xe->pat.idx[XE_CACHE_NONE]);
>   
>   			xe_ggtt_set_pte(ggtt, *ggtt_ofs, pte);
>   			*ggtt_ofs += XE_PAGE_SIZE;
> @@ -211,7 +211,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>   
>   		for (x = 0; x < size; x += XE_PAGE_SIZE) {
>   			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x,
> -							      xe->pat.idx[XE_CACHE_WB]);
> +							      xe->pat.idx[XE_CACHE_NONE]);

This looks unrelated to DPT? Maybe tweak the commit title/message.

Anyway, I think change looks reasonable since you usually don't want to 
mess around with caching for display stuff.

With commit title/message tweaked,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   
>   			xe_ggtt_set_pte(ggtt, vma->node.start + x, pte);
>   		}
