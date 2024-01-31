Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C444C47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 13:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3D510F9CE;
	Wed, 31 Jan 2024 13:12:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B9010F9F5
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 13:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706706740; x=1738242740;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ssLt/Z0V4IWCLQrvTkZbSTv+7oygSPqc5MwVs66ZEI4=;
 b=DwvvfTvgk/ILWH0N7HVa+6p/Jx+0IH2nFpEEZwvwFdviisRo/jqoCHzV
 nZcJKpKw5uR1pfZKEV5GA+9F1kBm0kB2P8kKwh5nKUqdx7HyFCbXpuS5y
 /3ajv/z6ScvJttb7D8cyWpdYE/UfZgRQpT2az9hyL4o2n0QAuRbXhpl8T
 MQ53Zke+txY8fLbFvlP9NaAizIT5HSFbeOFTuZ/w1eYeNHAP0WQaGdRWj
 0Ih/zXT2CCdvln8Viy+JKuGUg+bcy9xICRCapinF0mTkbSeHxmDBICWIn
 jh9LTDv20T0ij67M1CROKV28PY3fxPjehowlnjanAj4uBooCm6nlpMrS2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="467834825"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="467834825"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 05:12:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="738091253"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="738091253"
Received: from skallurr-mobl1.ger.corp.intel.com (HELO [10.249.254.124])
 ([10.249.254.124])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 05:12:18 -0800
Message-ID: <85ff43a8-022d-41ea-9a38-5806c0cebb17@linux.intel.com>
Date: Wed, 31 Jan 2024 14:12:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Make all ABI shift values unsigned
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240131025424.2087936-1-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240131025424.2087936-1-matthew.brost@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 1/31/24 03:54, Matthew Brost wrote:
> All ABI definitions are unsigned and not defining as unsigned is causing
> build errors [1].
>
> [1] https://lore.kernel.org/all/20240123111235.3097079-1-geert@linux-m68k.org/
>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Took me a while to set up a gcc-5 aarch64 cross-compiler, but verified 
that this indeed fixes the build errors.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/abi/guc_actions_abi.h      |  4 ++--
>   drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  4 ++--
>   .../drm/xe/abi/guc_communication_ctb_abi.h    |  8 ++++----
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  6 +++---
>   drivers/gpu/drm/xe/abi/guc_messages_abi.h     | 20 +++++++++----------
>   5 files changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 3062e0e0d467..79ba98a169f9 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -50,8 +50,8 @@
>   
>   #define HOST2GUC_SELF_CFG_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 3u)
>   #define HOST2GUC_SELF_CFG_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
> -#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_KEY		(0xffff << 16)
> -#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_LEN		(0xffff << 0)
> +#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_KEY		(0xffffu << 16)
> +#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_LEN		(0xffffu << 0)
>   #define HOST2GUC_SELF_CFG_REQUEST_MSG_2_VALUE32		GUC_HXG_REQUEST_MSG_n_DATAn
>   #define HOST2GUC_SELF_CFG_REQUEST_MSG_3_VALUE64		GUC_HXG_REQUEST_MSG_n_DATAn
>   
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> index 811add10c30d..c165e26c0976 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> @@ -242,8 +242,8 @@ struct slpc_shared_data {
>   		(HOST2GUC_PC_SLPC_REQUEST_REQUEST_MSG_MIN_LEN + \
>   			HOST2GUC_PC_SLPC_EVENT_MAX_INPUT_ARGS)
>   #define HOST2GUC_PC_SLPC_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
> -#define HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ID		(0xff << 8)
> -#define HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC	(0xff << 0)
> +#define HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ID		(0xffu << 8)
> +#define HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC	(0xffu << 0)
>   #define HOST2GUC_PC_SLPC_REQUEST_MSG_N_EVENT_DATA_N	GUC_HXG_REQUEST_MSG_n_DATAn
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> index 4aaed1cb4e12..8f86a16dc577 100644
> --- a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> @@ -82,11 +82,11 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
>   #define GUC_CTB_HDR_LEN				1u
>   #define GUC_CTB_MSG_MIN_LEN			GUC_CTB_HDR_LEN
>   #define GUC_CTB_MSG_MAX_LEN			(GUC_CTB_MSG_MIN_LEN + GUC_CTB_MAX_DWORDS)
> -#define GUC_CTB_MSG_0_FENCE			(0xffff << 16)
> -#define GUC_CTB_MSG_0_FORMAT			(0xf << 12)
> +#define GUC_CTB_MSG_0_FENCE			(0xffffu << 16)
> +#define GUC_CTB_MSG_0_FORMAT			(0xfu << 12)
>   #define   GUC_CTB_FORMAT_HXG			0u
> -#define GUC_CTB_MSG_0_RESERVED			(0xf << 8)
> -#define GUC_CTB_MSG_0_NUM_DWORDS		(0xff << 0)
> +#define GUC_CTB_MSG_0_RESERVED			(0xfu << 8)
> +#define GUC_CTB_MSG_0_NUM_DWORDS		(0xffu << 0)
>   #define   GUC_CTB_MAX_DWORDS			255
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 47094b9b044c..0400bc0fccdc 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -31,9 +31,9 @@
>    */
>   
>   #define GUC_KLV_LEN_MIN				1u
> -#define GUC_KLV_0_KEY				(0xffff << 16)
> -#define GUC_KLV_0_LEN				(0xffff << 0)
> -#define GUC_KLV_n_VALUE				(0xffffffff << 0)
> +#define GUC_KLV_0_KEY				(0xffffu << 16)
> +#define GUC_KLV_0_LEN				(0xffffu << 0)
> +#define GUC_KLV_n_VALUE				(0xffffffffu << 0)
>   
>   /**
>    * DOC: GuC Self Config KLVs
> diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> index ff888d16bd4f..534a39db7772 100644
> --- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> @@ -41,10 +41,10 @@
>    */
>   
>   #define GUC_HXG_MSG_MIN_LEN			1u
> -#define GUC_HXG_MSG_0_ORIGIN			(0x1 << 31)
> +#define GUC_HXG_MSG_0_ORIGIN			(0x1u << 31)
>   #define   GUC_HXG_ORIGIN_HOST			0u
>   #define   GUC_HXG_ORIGIN_GUC			1u
> -#define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
> +#define GUC_HXG_MSG_0_TYPE			(0x7u << 28)
>   #define   GUC_HXG_TYPE_REQUEST			0u
>   #define   GUC_HXG_TYPE_EVENT			1u
>   #define   GUC_HXG_TYPE_FAST_REQUEST		2u
> @@ -52,8 +52,8 @@
>   #define   GUC_HXG_TYPE_NO_RESPONSE_RETRY	5u
>   #define   GUC_HXG_TYPE_RESPONSE_FAILURE		6u
>   #define   GUC_HXG_TYPE_RESPONSE_SUCCESS		7u
> -#define GUC_HXG_MSG_0_AUX			(0xfffffff << 0)
> -#define GUC_HXG_MSG_n_PAYLOAD			(0xffffffff << 0)
> +#define GUC_HXG_MSG_0_AUX			(0xfffffffu << 0)
> +#define GUC_HXG_MSG_n_PAYLOAD			(0xffffffffu << 0)
>   
>   /**
>    * DOC: HXG Request
> @@ -87,8 +87,8 @@
>    */
>   
>   #define GUC_HXG_REQUEST_MSG_MIN_LEN		GUC_HXG_MSG_MIN_LEN
> -#define GUC_HXG_REQUEST_MSG_0_DATA0		(0xfff << 16)
> -#define GUC_HXG_REQUEST_MSG_0_ACTION		(0xffff << 0)
> +#define GUC_HXG_REQUEST_MSG_0_DATA0		(0xfffu << 16)
> +#define GUC_HXG_REQUEST_MSG_0_ACTION		(0xffffu << 0)
>   #define GUC_HXG_REQUEST_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
>   
>   /**
> @@ -119,8 +119,8 @@
>    */
>   
>   #define GUC_HXG_EVENT_MSG_MIN_LEN		GUC_HXG_MSG_MIN_LEN
> -#define GUC_HXG_EVENT_MSG_0_DATA0		(0xfff << 16)
> -#define GUC_HXG_EVENT_MSG_0_ACTION		(0xffff << 0)
> +#define GUC_HXG_EVENT_MSG_0_DATA0		(0xfffu << 16)
> +#define GUC_HXG_EVENT_MSG_0_ACTION		(0xffffu << 0)
>   #define GUC_HXG_EVENT_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
>   
>   /**
> @@ -190,8 +190,8 @@
>    */
>   
>   #define GUC_HXG_FAILURE_MSG_LEN			GUC_HXG_MSG_MIN_LEN
> -#define GUC_HXG_FAILURE_MSG_0_HINT		(0xfff << 16)
> -#define GUC_HXG_FAILURE_MSG_0_ERROR		(0xffff << 0)
> +#define GUC_HXG_FAILURE_MSG_0_HINT		(0xfffu << 16)
> +#define GUC_HXG_FAILURE_MSG_0_ERROR		(0xffffu << 0)
>   
>   /**
>    * DOC: HXG Response
