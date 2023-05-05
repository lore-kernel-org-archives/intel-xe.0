Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76278C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 08:43:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA8310E5AC;
	Fri,  5 May 2023 08:43:55 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF8710E5AC
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 08:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683276233; x=1714812233;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gnKRPuGPAegEqBkja9yE2XTs36uI4ic3+HeEV+fQiCY=;
 b=Dr+gS7NRlI5Pgc4KXc9zDk4yYKVp/K/Tp4VRCRykIR6o0b5c9VkdYfOZ
 RLkybzuVNhKTY1lpy7cNnkiMnrcIGxwZG/LbbF+DKBg4lxjX/KZp0WtPN
 21TbiXxfgmZOQirKIhsHf8wkrn14UM93hGacTIkGd0ZMFFSD3YbIzhsJ5
 VWd9dfMw1r/nqmh/hdWY0rdV7SqB9vcxu6zxSQ+5ova7h7e96ZqtsM0LF
 bDEn2HhpsWaim9QK4M/vVStzKUNyEhY74ip46iMFVjZzuPcLegFmmnwjJ
 lsoqLf6Efkh/pWvYGmu18pgZ3N1eZ9R9RFGGSH/1Cn4jSffFm+gGfZMVZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328785619"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="328785619"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943756718"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943756718"
Received: from smorozov-mobl1.ger.corp.intel.com (HELO [10.252.35.96])
 ([10.252.35.96])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:43:49 -0700
Message-ID: <88a16b59-e26b-26ef-1601-a380f2cda6ed@linux.intel.com>
Date: Fri, 5 May 2023 10:43:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
 <20230505082956.2247875-15-jouni.hogander@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230505082956.2247875-15-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [RFC PATCH 14/20] drm/xe: Add function to clear
 scanout flag
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
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hey,

We don't clear scanout on Xe, it should be set only once by userspace as 
a flag to determine caching mode

for VM_BIND, it shouldn't ever be cleared in xe display code.

~Maarten

On 2023-05-05 10:29, Jouni Högander wrote:
> Add function to clear scanout flag. This will be called by frontbuffer
> tracking code.
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
> index c40bb27ac72a..dec11721ef6a 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
> @@ -4,11 +4,22 @@
>   #include <uapi/drm/i915_drm.h>
>   #include <drm/drm_mm.h>
>   
> -struct xe_bo;
> +#include <xe_bo.h>
> +#include <xe_bo_types.h>
>   
>   struct i915_vma {
>   	struct xe_bo *bo, *dpt;
>   	struct drm_mm_node node;
>   };
>   
> +static inline void i915_ggtt_clear_scanout(struct xe_bo *bo)
> +{
> +	int ret;
> +
> +	ret = ttm_bo_reserve(&bo->ttm, true, false, NULL);
> +	XE_WARN_ON(ret);
> +	bo->flags &= ~XE_BO_SCANOUT_BIT;
> +	ttm_bo_unreserve(&bo->ttm);
> +}
> +
>   #endif
