Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2852FC531D2
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 14:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7370A10E370;
	Thu, 23 Jul 2026 14:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ty7zuN9h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E3F10E5A3;
 Thu, 23 Jul 2026 14:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784815250; x=1816351250;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=C4s1ZVBFQgml8MTs7lYEZbh9cTdFyG9O3eI432VPktU=;
 b=Ty7zuN9hT1Addkk1zGZtq/VSKeUb6KTgDOqLCdr8GmcS4QM/z5/dgHQW
 tQRMdCNF7/qGPNMQc9NujltWOtEmrz04nvbUMRqIgCKvPHObgRvtBqJHL
 bLJXnC2MqWLdPQ+9SXOpfTOF2bNvo8GA/cnC6ME+iu1cAJgnj9mKRYZCe
 rnX6ArGLaZDGYcbemk0NoNthWHEAV48HetIy3B5t155kezlB0YmCqGF50
 OAuVRb2PQPUHuqcbWr/cQkQOjNyyUPTWtLSJDG6EQc3q9pP5aWH2M7cfG
 JwJDjT8KzmAIhL5wjnelv/ULeEbwQW/hT0DvgSEY6oTta6gCOYgWRaXTD Q==;
X-CSE-ConnectionGUID: TJTF6E97T1mNnfQase3n9Q==
X-CSE-MsgGUID: ogAd8bblSSOwukHLEzNodQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="95824646"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="95824646"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 07:00:49 -0700
X-CSE-ConnectionGUID: WYYYxRj7RTG88WDbR45iVw==
X-CSE-MsgGUID: XjXaDlG8Qne0F9gpLbrukw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="255782784"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.109])
 ([10.245.244.109])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 07:00:47 -0700
Message-ID: <ad6535e8-a125-4bdf-8dfc-d868b5ecbecb@intel.com>
Date: Thu, 23 Jul 2026 15:00:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/migrate: Support copying between sysmem and stolen
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
References: <20260721142610.93804-9-dev@lankhorst.se>
 <20260721192540.115548-2-dev@lankhorst.se>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260721192540.115548-2-dev@lankhorst.se>
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

On 21/07/2026 20:25, Maarten Lankhorst wrote:
> Stolen memory is used on integrated devices to hold the
> firmware framebuffer. In the next commit we want to copy
> the framebuffer to normal system memory.
> 
> This requires treating stolen memory mostly as VRAM, but
> without access to the identity mapping.
> 
> On discrete the identity mapping can be used, but we never
> need to copy there, so just prohibit identity map on stolen.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 4366c41bd3254..505d105472fca 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -574,6 +574,10 @@ static u64 xe_migrate_res_sizes(struct xe_migrate *m, struct xe_res_cursor *cur)
>   
>   static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
>   {
> +	/* Stolen only used by integrated, no VRAM or identity map there */
> +	if (cur->mem_type == XE_PL_STOLEN)
> +		return false;
> +
>   	/* If the chunk is not fragmented, allow identity map. */
>   	return cur->size >= size;
>   }
> @@ -879,6 +883,14 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>   	return flush_flags;
>   }
>   
> +static bool is_devmem(u32 mem_type)
> +{
> +	if (mem_type_is_vram(mem_type) || mem_type == XE_PL_STOLEN)
> +		return true;
> +
> +	return false;
> +}

Do we need to worry about XE_PPGTT_PTE_DM in xelp_pte_encode_addr() ? I 
don't think that bit is used for stolen until recent platforms? We seem 
to guard against this in xelp_pte_encode_bo() with xe_bo_is_stolen_devmem().

> +
>   static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>   					   struct xe_bo *src_bo,
>   					   struct xe_bo *dst_bo,
> @@ -899,8 +911,8 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>   	int err;
>   	bool src_is_pltt = src->mem_type == XE_PL_TT;
>   	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
> -	bool src_is_vram = mem_type_is_vram(src->mem_type);
> -	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
> +	bool src_is_vram = is_devmem(src->mem_type);
> +	bool dst_is_vram = is_devmem(dst->mem_type);
>   	bool type_device = src_bo->ttm.type == ttm_bo_type_device;
>   	bool needs_ccs_emit = type_device && xe_migrate_needs_ccs_emit(xe);
>   	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
> @@ -1597,7 +1609,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   				   struct ttm_resource *dst,
>   				   u32 clear_flags)
>   {
> -	bool clear_vram = mem_type_is_vram(dst->mem_type);
> +	bool clear_vram = is_devmem(dst->mem_type);

Do we actually trigger this path for stolen? Or is this just for 
symmetry with copy?

Also, I guess overall idea here is to call copy() directly, and not mess 
with this at the bo_move()/validate() level?

>   	bool clear_bo_data = XE_MIGRATE_CLEAR_FLAG_BO_DATA & clear_flags;
>   	bool clear_ccs = XE_MIGRATE_CLEAR_FLAG_CCS_DATA & clear_flags;
>   	struct xe_gt *gt = m->tile->primary_gt;

