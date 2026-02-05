Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93BFEC1E8A
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 09:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978F810E865;
	Thu,  5 Feb 2026 09:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Llj5JHtZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F385910E865
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 09:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770285384; x=1801821384;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oYLfM9fdUw4A8qh1J1fg5qlB/AzfcvFGRpLfiNBiAF8=;
 b=Llj5JHtZxuP7adstAGCkkGH5oY1W4DPu+Tkl7vzsuqAXaVrpK/lSaRnD
 CRQK3z6lWILQmVRdXadSIuicQgWYs+n2WCLRw5UsVSOYCxtZH2hpK5mWE
 +9mxGgmyd6teXXFNq5qspdm9z1zZpMJ1x1YhhgPKwppvpYev+AWaRwSfx
 oYt/hNDjHPuGp45mPc8Cefbm845jZslLMnupXLY3zKnqrRq2/4rHqKbh1
 iSNVE9gDqMe6af0hbVw9s0tJSS1t8bSF+sxWavjmQVRjwts+u0hHpfWd8
 QL7gFNN6Jc8KRcoTVzLgj+QliNjuM/KT6kbkQWz4IPPtFkUXLYmN57aUH Q==;
X-CSE-ConnectionGUID: E5DyP3T7R5qGZgz7O3a5rw==
X-CSE-MsgGUID: 2LrqZWKyRWCFsvnUBXej5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70678869"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="70678869"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 01:56:23 -0800
X-CSE-ConnectionGUID: jYo6VjBdQ+6BpClIaTqtiA==
X-CSE-MsgGUID: xOp6NPPkSvWE3tmAJNGI1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="233405337"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.124])
 ([10.245.244.124])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 01:56:22 -0800
Message-ID: <baaa9fe2-5fa5-47da-a5f4-4647d0d431af@intel.com>
Date: Thu, 5 Feb 2026 09:56:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/query: Only advertise NO_COMPRESSION hint on
 devices with flat CCS
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
References: <20260205082048.2988738-2-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260205082048.2988738-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 05/02/2026 08:20, Sanjay Yadav wrote:
> Devices like CRI have GRAPHICS_VER >= 20 but don't have compression
> support their PAT table (xe3p_xpc_pat_table) has no compression-enabled
> entries.
> 
> Only advertise HAS_NO_COMPRESSION_HINT flag when the device actually has
> flat CCS and thus compression capability.
> 
> Fixes: 78d91ba6bd796 ("drm/xe/uapi: Add NO_COMPRESSION BO flag and query capability")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_query.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 34db266b723f..c152ebfbd7d8 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -335,7 +335,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>   	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
>   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
> -	if (GRAPHICS_VER(xe) >= 20)
> +	if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe))

I think we need to also update the check in bo_create() to match this? 
If we claim the flag is not supported, then using the flag should be 
rejected, I think. The IGT for this will fail otherwise?

>   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
>   	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=

