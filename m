Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EB4C83F03
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 08:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEDB10E99B;
	Fri,  4 Jul 2025 08:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="arZDsQ6R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA80110E99B
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 08:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751619513; x=1783155513;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GjPr9CIoj0uCuaxetymyPhoeZSCUEhclBagOxrmMGBA=;
 b=arZDsQ6R7Ketg0E9rpoEQv6a/JhMKuWAbmxSblAXCQLlFGcUmQUFx+rx
 UrvjyaxCSilCsiuEt1chQ1qKCSD4HbNWLVSCIV5BUPcC9Qq2aipSWM7dE
 ii2R6LXWqaHywlFGZ6DotYXA5VXwCP6l3DwMbCPrfYY0NVvno/dkCNvzy
 0rhZBqBHrZViRkxemDtZ9GmZD8AMOG9SK97Z8AI6Z97c1Zt6nMFfzsuRF
 VxeUiQdVS5shZY6+qy7kmvNLn3hZVtcEBHMZvUFmUkqJKMBiw1/FHYAYY
 dxH/eA9AfrJ6vgBEoJb+51RjwXIxHHorjG2B3PPye8dLkJzpvLJzeEh/e w==;
X-CSE-ConnectionGUID: rLjuFHC/QW6htwqTEsmhMA==
X-CSE-MsgGUID: J3InTikaRYKMAYUG5Pp7qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57761425"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="57761425"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:58:32 -0700
X-CSE-ConnectionGUID: GSFoCRrBRKeXASvTJIGT6g==
X-CSE-MsgGUID: XJrq3mLkQnGgj8dEoGes+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="154008451"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.51])
 ([10.245.245.51])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:58:31 -0700
Message-ID: <767ffe9f-58b0-40b0-872f-6d3adb54c3af@intel.com>
Date: Fri, 4 Jul 2025 09:58:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/xe: Add xe_bo_tt_has_data helper
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
References: <20250623151929.2422584-1-matthew.brost@intel.com>
 <20250623151929.2422584-4-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250623151929.2422584-4-matthew.brost@intel.com>
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

On 23/06/2025 16:19, Matthew Brost wrote:
> Add xe_bo_tt_has_data helper which determines if a BO has TT data (i.e.,
> a BO has SRAM or swap backing store).
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 21 ++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_bo.h |  2 ++
>   2 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c93381fa4858..7a412121477e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -766,6 +766,23 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>   	return 0;
>   }
>   
> +/**
> + * xe_bo_tt_has_data() - Xe BO has TT data (i.e., Xe BO has SRAM or swap backing
> + * store)
> + *
> + * Helper to determine if a BO has TT data. Useful to determine if copies or
> + * clears are needed on BO when it is moving.
> + *
> + * Return: True if a BO has TT data, False otherwise
> + */
> +bool xe_bo_tt_has_data(struct xe_bo *bo)
> +{

Maybe add an assert-locked for the bo? I'm pretty sure caller needs the 
lock to check such state?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>


> +	struct ttm_tt *ttm = bo->ttm.ttm;
> +
> +	return ttm && (ttm_tt_is_populated(ttm) ||
> +		       (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
> +}
> +
>   static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   		      struct ttm_operation_ctx *ctx,
>   		      struct ttm_resource *new_mem,
> @@ -801,9 +818,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   		return ret;
>   	}
>   
> -	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
> -			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
> -
> +	tt_has_data = xe_bo_tt_has_data(bo);
>   	move_lacks_source = !old_mem || (handle_system_ccs ? (!bo->ccs_cleared) :
>   					 (!mem_type_is_vram(old_mem_type) && !tt_has_data));
>   
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 02ada1fb8a23..150e98ce6fac 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -374,6 +374,8 @@ void xe_bo_dev_fini(struct xe_bo_dev *bo_device);
>   
>   struct sg_table *xe_bo_sg(struct xe_bo *bo);
>   
> +bool xe_bo_tt_has_data(struct xe_bo *bo);
> +
>   /*
>    * xe_sg_segment_size() - Provides upper limit for sg segment size.
>    * @dev: device pointer

