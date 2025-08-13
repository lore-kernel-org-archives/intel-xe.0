Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25DBC87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 16:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACB810E0CF;
	Wed, 13 Aug 2025 16:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BWDL2qIz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E535810E0CF
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 16:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755103141; x=1786639141;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=EvH5u2n9tDqkKU+/pp9oToqcnfxNKYdHJ/TF44JhNVU=;
 b=BWDL2qIzRvQivzYQyzo3Sfqka6KMdtsSsGVTPYUbvAkpuf0bDyGf+hat
 w85CZ34Kkh7zPJLY8SAJxFDtDQ65KApQkjolAiHSwlhYvqZ+sXQCWp1g4
 fKqeWoc5auZM6fquBNLP3HQLvnIfR/7NHMa/ar+pdmmZPuoaZKIYmrLrk
 cJfAbOSndcgzKlps9AWbihdOvqK7BkBCeefHqBkh1OHWV/O42brySFqdz
 pOlq2bYqWuL6qmMcR3Rs7xPbMAJ7ZMhxloXoU+mBara+bBzd6MqKEiWcm
 DAyxtQU1zikwO1uOJVUHh5Ae0LtSugHMAObLbVm/UhNiypMzRFZZT1Wy/ Q==;
X-CSE-ConnectionGUID: ZqZY411rSLigmaf0ExWN5w==
X-CSE-MsgGUID: 09mzBsY5RDiwEA8y2hp8QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57311092"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57311092"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 09:39:01 -0700
X-CSE-ConnectionGUID: N1z3fiu4R7qo/ujR/v20bA==
X-CSE-MsgGUID: vKiy5OcRQ0CcoMHSulPpPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166771915"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.238])
 ([10.245.245.238])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 09:38:59 -0700
Message-ID: <18c05072-3d03-475e-a376-7f08251bff3d@intel.com>
Date: Wed, 13 Aug 2025 17:38:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] drm/xe: Introduce new BO flag
 XE_BO_FLAG_FORCE_USER_VRAM
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250718081752.630122-1-piotr.piorkowski@intel.com>
 <20250718081752.630122-3-piotr.piorkowski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250718081752.630122-3-piotr.piorkowski@intel.com>
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

On 18/07/2025 09:17, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> When using a separate VRAM region for kernel allocations,
> some kernel structures, such as context userspace data,
> should not reside in the VRAM region dedicated to the kernel.
> To support this, we need a mechanism to explicitly force such
> allocations.

Maybe add a bit more commentary here for the why? IIRC we don't want 
anything long term allocatable via an ioctl filling up the kernel VRAM 
region, since it's not really evictable plus there might not be a 
fallback if we run out.

> Let's add a new BO flag that forces BO allocation in
> the general-purpose VRAM region accessible to userspace.
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 5 +++--
>   drivers/gpu/drm/xe/xe_bo.h | 1 +
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 12e899726534..997ebb6fdfaa 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -224,7 +224,7 @@ static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 bo_flags, u
>   
>   	xe_assert(xe, tile_id < xe->info.tile_count);
>   
> -	if (type == ttm_bo_type_kernel)
> +	if (type == ttm_bo_type_kernel && !(bo_flags & XE_BO_FLAG_FORCE_USER_VRAM))
>   		return xe->tiles[tile_id].mem.kernel_vram->placement;
>   	else
>   		return xe->tiles[tile_id].mem.vram->placement;
> @@ -2035,7 +2035,8 @@ __xe_bo_create_locked(struct xe_device *xe,
>   	 * that we are using unified VRAM and we need fix VRAM BO flags.
>   	 */
>   	if (tile && type == ttm_bo_type_kernel && xe_tile_has_separate_kernel_vram(tile) &&
> -	    (flags & XE_BO_FLAG_VRAM_MASK) && tile->mem.vram->id != tile->mem.kernel_vram->id) {
> +	    (flags & XE_BO_FLAG_VRAM_MASK) && tile->mem.vram->id != tile->mem.kernel_vram->id &&
> +	    !(flags & XE_BO_FLAG_FORCE_USER_VRAM)) {
>   		flags &= ~XE_BO_FLAG_VRAM_MASK;
>   		flags |= (XE_BO_FLAG_VRAM0 << tile->mem.kernel_vram->id);
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index dde8e0274ff2..46c36f656ad7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -48,6 +48,7 @@
>   #define XE_BO_FLAG_GGTT2		BIT(22)
>   #define XE_BO_FLAG_GGTT3		BIT(23)
>   #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
> +#define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
>   
>   /* this one is trigger internally only */
>   #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)

