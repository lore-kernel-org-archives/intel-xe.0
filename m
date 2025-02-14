Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E5EC02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 11:32:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241DC10EC55;
	Fri, 14 Feb 2025 11:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2KhwPY+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46DF10EC55
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 11:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739532752; x=1771068752;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dNpKEPvLKmDlzpud4y+RvV4ykwpp5woqHGDffqS2cro=;
 b=g2KhwPY+g26RVok7kV8iZVronawBUiyCUS45AzW+4BjRIcEn4+8nSeMY
 VxjTMsq9+K/dPyYwMeR5M0261L9H3THGO9LTPjpbwG/xUbxzxSJOCbgNy
 FWDO+Sp1DobzxHaWvfuWJlte6xavdJ2mFrYecOwMnvDZ2qu7Jjhk0azRI
 AYd/wT08qKCw2JJTvc/TxrM7WLCxJIZIe9PPOtl01SNDDT0pCIx2ZOyfF
 sEeBwTxZQ5nlSjGOWOZ3Ylb4ldlyjMLe7GsrmaAc/zaWc8w+Y5q0EbLuj
 rGu3jAdPLDZLkrtHgLfOwSgJ6s+4ti+YhAgOT7WiG92/C7fOFgCbBtHfQ A==;
X-CSE-ConnectionGUID: xvK4rm6DREqiWi+BE5ZLqA==
X-CSE-MsgGUID: InsNWZTlQfSSySUO3JknOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="65630470"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="65630470"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 03:32:32 -0800
X-CSE-ConnectionGUID: 9lQYhCdST+GWYc9RalQIqw==
X-CSE-MsgGUID: kfGR5aSyTRSEv999W3M0UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="118468055"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 14 Feb 2025 03:32:30 -0800
Received: from [10.245.113.167] (unknown [10.245.113.167])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1D11B37B85;
 Fri, 14 Feb 2025 11:32:28 +0000 (GMT)
Message-ID: <d8fb6e6d-bba6-4b89-93e3-f2e8030a5cd2@intel.com>
Date: Fri, 14 Feb 2025 12:32:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] drm/xe/guc: Expose engine activity only for
 supported GuC version
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com,
 lucas.demarchi@intel.com, vinay.belgaumkar@intel.com,
 soham.purkait@intel.com, John Harrison <John.C.Harrison@Intel.com>
References: <20250214100819.798544-1-riana.tauro@intel.com>
 <20250214100819.798544-4-riana.tauro@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250214100819.798544-4-riana.tauro@intel.com>
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



On 14.02.2025 11:08, Riana Tauro wrote:
> Engine activity is supported only on GuC submission version >= 1.14.1
> Allow enabling/reading engine activity only on supported
> GuC versions. Warn once if not supported.
> 
> v2: use guc interface version (John)
> v3: use debug log (Umesh)
> v4: use variable for supported and use gt logs
>     use a friendlier log message (Michal)
> v5: fix kernel-doc
>     do not continue in init if not supported (Michal)
> v6: remove hardcoding values (Michal)
> 
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 51 ++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  1 +
>  .../gpu/drm/xe/xe_guc_engine_activity_types.h |  3 ++
>  3 files changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> index a424527eddb6..2a457dcf31d5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> @@ -95,6 +95,29 @@ static void free_engine_activity_buffers(struct engine_activity_buffer *buffer)
>  	xe_bo_unpin_map_no_vm(buffer->activity_bo);
>  }
>  
> +static bool is_engine_activity_supported(struct xe_guc *guc)
> +{
> +	struct xe_uc_fw_version *version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
> +	struct xe_uc_fw_version required = { 1, 14, 1 };

nit: could use designated initializers to always be on the safe side

> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	if (IS_SRIOV_VF(gt_to_xe(gt))) {
> +		xe_gt_info(gt, "engine activity stats not supported on VFs\n");
> +		return false;
> +	}
> +
> +	/* engine activity stats is supported from GuC interface version (1.14.1) */
> +	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER_STRUCT(required)) {
> +		xe_gt_info(gt,
> +			   "engine activity stats unsupported in GuC interface v%u.%u.%u, need v%u.%u.%u or higher\n",
> +			   version->major, version->minor, version->patch, required.major,
> +			   required.minor, required.patch);
> +		return false;
> +	}

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

