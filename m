Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3C8C369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 08:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0827910E17D;
	Wed, 23 Apr 2025 08:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iY5uVjkq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156ED10E17D
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 08:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745397314; x=1776933314;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1TzZevmbp1XwvmN3nrobCx57jfgRqVF4+k9JQTbP6OM=;
 b=iY5uVjkqZ8BchUBxzaWEeJgxmiCI2F38Xrpmgz9ZaYjE5zRMQ2QExNYV
 N2zC0Ct+mJJPIl5XBpp3dndvv9Fg3PBPQlvmkrWY3LGWBPyvjQQxr23M1
 KdTjy750oU2MIElyUhOWCwYUTmqlnAfogER+jvAI2E3bt87wfDEnsU3Kv
 q8yBBnswiCedRrzs9YXC7IKdn8UZMCO4HybvUjASDHYqPHAQ9S+4t+vv9
 q56K1Lea0737LxP+4qTFpqxW6pjzoRJctWMi3lQCURS6tFpv7EXPpdzBq
 lHxYxe+ZSpjzSGc8IukGH/J/V4fLhs6xQLkyAXKZjXRK3fe9vZy/buPp+ w==;
X-CSE-ConnectionGUID: oDxZxQB+TDiRvg6gTzXtuQ==
X-CSE-MsgGUID: cL7mGIxiQjOkpXkYrqQKgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="64390677"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="64390677"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 01:35:14 -0700
X-CSE-ConnectionGUID: KKzTeMiaTaSdU6b0dlV36A==
X-CSE-MsgGUID: W2IWMTXARmCHS/RDQxkzIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="169464448"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 23 Apr 2025 01:35:12 -0700
Received: from [10.245.114.177] (unknown [10.245.114.177])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 68C7E33E80;
 Wed, 23 Apr 2025 09:35:11 +0100 (IST)
Message-ID: <d0d6d5e4-ffa3-4290-bf61-89f71ce9e04a@intel.com>
Date: Wed, 23 Apr 2025 10:35:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/4] drm/xe/guc: Introduce enum with offsets for
 context register H2Gs
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250418141035.3841296-1-tomasz.lis@intel.com>
 <20250418141035.3841296-4-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250418141035.3841296-4-tomasz.lis@intel.com>
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



On 18.04.2025 16:10, Tomasz Lis wrote:
> Some GuC messages are constructed with incrementing dword counter
> rather than referencing specific DWORDs, as described in GuC interface
> specification.
> 
> This change introduces the definitions of DWORD numbers for parameters
> which will need to be referenced in a CTB parser to be added in a
> following patch. To ensure correctness of these DWORDs, verification
> in form of asserts was added to the message construction code.
> 
> v2: Renamed enum members, added ones for single context registration,
>   modified asserts to check values rather than indexes.
> v3: Reordered assert args to take less lines
> v4: Added lengths
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com> (v3)
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h | 31 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 17 +++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 448afb86e05c..3c2808fabc6a 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -161,6 +161,37 @@ enum xe_guc_preempt_options {
>  	XE_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
>  };
>  
> +enum xe_guc_register_context_param_offsets {
> +	XE_GUC_REGISTER_CONTEXT_DATA_0_MBZ = 0,
> +	XE_GUC_REGISTER_CONTEXT_DATA_1_FLAGS,
> +	XE_GUC_REGISTER_CONTEXT_DATA_2_CONTEXT_INDEX,
> +	XE_GUC_REGISTER_CONTEXT_DATA_3_ENGINE_CLASS,
> +	XE_GUC_REGISTER_CONTEXT_DATA_4_ENGINE_SUBMIT_MASK,
> +	XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER,
> +	XE_GUC_REGISTER_CONTEXT_DATA_6_WQ_DESC_ADDR_UPPER,
> +	XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER,
> +	XE_GUC_REGISTER_CONTEXT_DATA_8_WQ_BUF_BASE_UPPER,
> +	XE_GUC_REGISTER_CONTEXT_DATA_9_WQ_BUF_SIZE,
> +	XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR,
> +	XE_GUC_REGISTER_CONTEXT_MSG_LEN,

didn't notice this earlier...

this enum, as it's name says, was about param offsets, so adding here
MSG_LEN is not the best fit, likely should be a separate #define, unless
we want to say that this enum is just a placeholder for random defines
related to this H2G action ... it's just sad that we don't have (and
don't want) unified way how to describe GuC ABI messages consts

> +};
> +
> +enum xe_guc_register_context_multi_lrc_param_offsets {
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_0_MBZ = 0,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_1_FLAGS,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_2_PARENT_CONTEXT,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_3_ENGINE_CLASS,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_4_ENGINE_SUBMIT_MASK,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_6_WQ_DESC_ADDR_UPPER,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_8_WQ_BUF_BASE_UPPER,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_9_WQ_BUF_SIZE,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_LEN = 11,

same here and also this one should be named, as already suggested, as
"MSG_MIN_LEN" since this message has a flexible length and we can be
only sure about its min size (or max if we consider max CTB msg len)

> +};
> +
>  enum xe_guc_report_status {
>  	XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
>  	XE_GUC_REPORT_STATUS_ACKED = 0x1,
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 813c3c0bb250..cfc65f21b2f7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -487,6 +487,15 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
>  		action[len++] = upper_32_bits(xe_lrc_descriptor(lrc));
>  	}
>  
> +	/* explicitly checks some fields that we might fixup later */
> +	xe_gt_assert(guc_to_gt(guc), info->wq_desc_lo ==
> +		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER]);
> +	xe_gt_assert(guc_to_gt(guc), info->wq_base_lo ==
> +		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER]);
> +	xe_gt_assert(guc_to_gt(guc), q->width ==
> +		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS]);
> +	xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
> +		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR]);
>  	xe_gt_assert(guc_to_gt(guc), len <= MAX_MLRC_REG_SIZE);
>  #undef MAX_MLRC_REG_SIZE
>  
> @@ -511,6 +520,14 @@ static void __register_exec_queue(struct xe_guc *guc,
>  		info->hwlrca_hi,
>  	};

nit: since v4 we also have MSG_LEN so we can use it in action[]

>  
> +	/* explicitly checks some fields that we might fixup later */
> +	xe_gt_assert(guc_to_gt(guc), info->wq_desc_lo ==
> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]);
> +	xe_gt_assert(guc_to_gt(guc), info->wq_base_lo ==
> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]);
> +	xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]);
> +
>  	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>  }
>  

as above comments are just about enum names, which could be updated once
we decide on how to unify all GuC ABI definitions, this is not worth
blocking the whole series, so let it be,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

