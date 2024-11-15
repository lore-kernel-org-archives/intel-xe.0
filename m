Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96710D6DDEA
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 10:14:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646CC10E27A;
	Fri, 15 Nov 2024 10:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kK5deNya";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C19F10E051;
 Fri, 15 Nov 2024 10:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731665673; x=1763201673;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=bylL+rw0p74Dah++6R9E0wMcX2zS1qaPofo6hqZjsgE=;
 b=kK5deNyaBtsOK931k0O9eKE6Z7l2VT33s+naTF5xqzezhDwFW964OSNP
 8PxLTxf4agRoXo3Kw2CeIKTayAK/zHODv98gj9SZpLNY+oJhTiot0VINS
 iK7uwGYox2uoKlbtpAx5N7kch/8h+vDq90iHy8GCnfmliLQ8A4eiDsEjl
 hlEJvOT+ZVVUq5g4WASyrc4Ca4T9n/Jt+w3en7UmVEl0QwyXqxRdvxwzO
 Q0jFZ/uEQBmvFArfU7wljkKB5Gho3DKXmomeDyV0dazBijSVMjinwbfb7
 jrHzlAC22iUGqtP4JG5t5ZAH0KD4N+8KO/3aTVUdPn8BulaAgTcRbt15I w==;
X-CSE-ConnectionGUID: molqvtQwRA+RSbCGL+cleA==
X-CSE-MsgGUID: DDOLLNp7QhyBHq/Q4luuEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31801729"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31801729"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 02:14:33 -0800
X-CSE-ConnectionGUID: VowZQWo9RbeRxkT+nE4ssw==
X-CSE-MsgGUID: muNkyjPsQEKa4UUYbmOnEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="88939015"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.175])
 ([10.245.244.175])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 02:14:32 -0800
Message-ID: <ea60848c-8b64-4275-93eb-dc669f948c27@intel.com>
Date: Fri, 15 Nov 2024 10:14:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t 1/4] lib/i915_drm_local: Remove macros added via merged
 kernel
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, igt-dev@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20241114050129.1381711-1-tejas.upadhyay@intel.com>
 <20241114050129.1381711-2-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241114050129.1381711-2-tejas.upadhyay@intel.com>
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

On 14/11/2024 05:01, Tejas Upadhyay wrote:
> The uapi on the kernel side is merged, I915_ENGINE_CLASS_COMPUTE,
> DRM_I915_PERF_PROP_OA_ENGINE_CLASS, DRM_I915_QUERY_GEOMETRY_SUBSLICES
> and DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE  is part of drm-next,
> remove this.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   lib/i915/i915_drm_local.h | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
> index af0176500..dd646aedf 100644
> --- a/lib/i915/i915_drm_local.h
> +++ b/lib/i915/i915_drm_local.h
> @@ -19,12 +19,6 @@ extern "C" {
>    * or local_ prefix and without any #ifndef's. Attempt should be made to
>    * clean these up when kernel uapi headers are sync'd.
>    */
> -#define I915_ENGINE_CLASS_COMPUTE 4
> -
> -#define DRM_I915_QUERY_GEOMETRY_SUBSLICES      6
> -
> -#define DRM_I915_PERF_PROP_OA_ENGINE_CLASS	9
> -#define DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE	10
>   
>   #if defined(__cplusplus)
>   }

