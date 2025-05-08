Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF65DC3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 20:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602D810E219;
	Thu,  8 May 2025 20:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVq7HaTT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D20210E219
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 20:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746737072; x=1778273072;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yL9kjlohJxNuhzURbhB33PixQ2GeSMRuj0oQL2p5lDI=;
 b=BVq7HaTTsJBIF91uRmQBQYcm6rQyPrF7PmZ74mTBR3fFKBKRmiqhzIv8
 U+f8uuRKt/2CfASdoSG4UGPYUc//godfoDGmi6tdExEioHFaksOvAZLo6
 QCeIVpkQ2YNfyROXrhIE8ItG81+bcVPNwVackLERLeQRTgrlQzHpjzYaF
 629QDrZbtd6XxcCy4Dz+JqTbEALwuwjEKmDMpQu0m9W54POxHDN0N3fBe
 3VDhfi8HQISI3Xo55x1RFwdclDAjvcl6nLILAXvDRbAAdAE3vIir+/rJu
 BEf4i9ZV+vmNc/x8w+0dyZZ9kNEVsXGLhibKAGjiK34OcKVr4MO9lj1vk Q==;
X-CSE-ConnectionGUID: sQs8/6rFQAS8OpV3AMCCug==
X-CSE-MsgGUID: 2ekSOIULRqun9S6yf85vQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52351265"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="52351265"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 13:44:32 -0700
X-CSE-ConnectionGUID: eZIpwF+DSoKtWXmfAUKc8g==
X-CSE-MsgGUID: mP+u+nc5RiSG36XRRdQNgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="136796642"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 08 May 2025 13:44:30 -0700
Received: from [10.245.114.177] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.114.177])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E62FB34334;
 Thu,  8 May 2025 21:44:28 +0100 (IST)
Message-ID: <e46c142b-9a96-41e1-b050-08eff6ca667c@intel.com>
Date: Thu, 8 May 2025 22:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Enable the Dynamic Inhibit Context
 Switch optimization
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
References: <20250328172837.2607990-1-daniele.ceraolospurio@intel.com>
 <20250328172837.2607990-3-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250328172837.2607990-3-daniele.ceraolospurio@intel.com>
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



On 28.03.2025 18:28, Daniele Ceraolo Spurio wrote:
> The Dynamic Inhibit Context Switch is an optimization aimed at reducing
> the amount of time the HW is stuck waiting on an unsatisfied semaphore.
> When this optimization is enabled, the GuC will dynamically modify the
> CTX_CTRL_INHIBIT_SYN_CTX_SWITCH in the CTX_CONTEXT_CONTROL register of
> lrcs to enable immediate switching out on an usatisfied semaphore wait

s/lrcs/LRCs

and typo usatisfied

> when multiple contexts are competing for time on the same engine.
> 
> This feature is available on recent HW from GuC 70.40.1 onwards and it
> is enabled via a per-VF feature opt-in.
> 
> v2: rebase
> v3: switch to using guc_buf_cache instead of dedicated alloc
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_guc.c           |  8 ++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 7d142c70b811..185d46f6c46a 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -134,11 +134,24 @@ enum  {
>   *      Adds an extra dword to the XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR G2H
>   *      containing the type of the CAT error. On HW that does not support
>   *      reporting the CAT error type, the extra dword is set to 0xdeadbeef.
> + *
> + * _`GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH` : 0x4003
> + *      This KLV enables the Dynamic Inhibit Context Switch optimization, which
> + *      consists in the GuC setting the CTX_CTRL_INHIBIT_SYN_CTX_SWITCH bit to
> + *      zero in the CTX_CONTEXT_CONTROL register of LRCs that are submitted
> + *      to an oversubscribed engine. This will cause those contexts to be
> + *      switched out immediately if they hit an unsatisfied semaphore wait
> + *      (instead of waiting the full timeslice duration). The bit is instead set
> + *      to one if a single context is queued on the engine, to avoid it being
> + *      switched out if there isn't another context that can run in its place.
>   */
>  
>  #define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
>  #define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_LEN 0u
>  
> +#define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_KEY 0x4003
> +#define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_LEN 0u
> +
>  /**
>   * DOC: GuC VGT Policy KLVs
>   *
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index efb1afa1d42d..c13ef2cb2d9a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -606,6 +606,14 @@ int xe_guc_opt_in_features_enable(struct xe_guc *guc)
>  	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 7, 0))
>  		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
>  
> +	/*
> +	 * Dynamic ICS is available for PVC and Xe2 and newer platforms. It
> +	 * requires GuC v70.40.1, which maps to compatibility version v1.18.4
> +	 */
> +	if ((xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) &&
> +	    GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 18, 4))

maybe promote to xe_guc_supports_dynamic_inhibit_ctx_switch(guc) ?

> +		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH);
> +
>  	if (count) {
>  		xe_assert(xe, count <= OPT_IN_MAX_DWORDS);
>  

otherwise LGTM so,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

