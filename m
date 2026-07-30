Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59091C55160
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0C310EE95;
	Thu, 30 Jul 2026 11:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KJxnZs2C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4975F10EEBF
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 11:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785410602; x=1816946602;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oZnVuwsdYI44LQGjRuL65ZXWD+wuxjwxtVXK2xAd3R0=;
 b=KJxnZs2CahhT97e2Zqt5GI1sIpOSZqQHDfZifM9i25/6zrun24BWABFi
 N8rV8BMha0mdktg1enyPP2F3NjUGi4zo0R5q3h+mnt+2KOhg07qxyPZLT
 LywJv0VQ9NpNIESa4rq/8wsUk+eY0dqJotyCOoTyy6keoFC4NfbjbIJcM
 IM5gusY80qOqdqIHznNchV47qrqqykiNKD3Pg8CyY33Brb5vIEdpsW9hE
 SyhMGdYi9B0kYVbW/xzaEtW0ClOjdQ6eaBdNJItaxz7EWmYLamHgL5Fjy
 o0Tln4EilIlGlkjnP7EZuVKbUQJBoe/fBez+WvgqqfnqCSS7pDse7Oj/i A==;
X-CSE-ConnectionGUID: NGeuhIcET6+7nQR26muCsg==
X-CSE-MsgGUID: U4TkdGzxTW6SAvtaf5yTNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96689700"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="96689700"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:23:22 -0700
X-CSE-ConnectionGUID: BAirZQ0tTRKAGBXghH0qwA==
X-CSE-MsgGUID: YXtwwKcTTVCEdCZ+ZG0P2A==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.245.197])
 ([10.245.245.197])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:23:20 -0700
Message-ID: <d44bbc54-ea0f-471c-bebe-19499fa47b93@intel.com>
Date: Thu, 30 Jul 2026 12:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/xe/guc_ads: use uncached mapping for UM queue
 BO
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, stable@vger.kernel.org
References: <20260722053410.2767369-1-jia.yao@intel.com>
 <20260730004735.344627-1-jia.yao@intel.com>
 <20260730004735.344627-4-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260730004735.344627-4-jia.yao@intel.com>
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

On 30/07/2026 01:47, Jia Yao wrote:
> The HW unit that writes fault descriptors into the UM queue ring buffer
> may not be coherent with the CPU cache.  If a descriptor write is still
> sitting in a GPU L3 cache line when GuC reads the slot, GuC sees the
> stale (all-zero) content from DRAM and forwards an invalid descriptor to
> the driver (Faulted Address = 0, ASID = 0).
> 
> Mark the UM queue BO as uncached (XE_BO_FLAG_NEEDS_UC) so that writes
> bypass the cache and are immediately visible to GuC.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

As per Michal this is too old. I think we can instead do:

Fixes: 9c57bc08652a ("drm/xe/lnl: Drop force_probe requirement")
Cc: <stable@vger.kernel.org> # v6.12+

> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Jia Yao <jia.yao@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_guc_ads.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 53636333fb45..76029575aa45 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -412,7 +412,8 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>   		u32 um_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>   			       XE_BO_FLAG_GGTT |
>   			       XE_BO_FLAG_GGTT_INVALIDATE |
> -			       XE_BO_FLAG_PINNED_NORESTORE;
> +			       XE_BO_FLAG_PINNED_NORESTORE |
> +			       XE_BO_FLAG_NEEDS_UC;
>   
>   		bo = xe_managed_bo_create_pin_map(xe, tile, um_size, um_flags);
>   		if (IS_ERR(bo))

