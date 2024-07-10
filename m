Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CB8C38150
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 08:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4131A10E686;
	Wed, 10 Jul 2024 08:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G6LAMPBs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD3710E686
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 08:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720598482; x=1752134482;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zBYJPVasKQ/zwd729dUN10B1kgja4e39ft0YUTOXGzs=;
 b=G6LAMPBsriVX+KltZkallVL51AB4GWRbozoxtbbKzKA3fSO4QAWvh42j
 IBdBte6dRuxRtGJNMh68mE2/ibYy/On3MJV+sqcUMfMt87pJVwCfV2SMT
 m3vQNeN9zKrLb9LVr/Gd5ZowZ3c4Q5WrZHvrHBQsLtkfuIy93s5WF22V5
 ORD7P3uDFFnh5aLCjQ4fdO/qUZq+WyksdRCrkLnPMax3OjQMyqwg3qOc0
 Y58XLTdFbubYCpD7+X7yhHF/W1dpe4sNxHV3IiHvvpmPEmYiHDYIdIQXr
 oUnDbKLe9qCwJK8ERIyjyVHHIOp0agOZ0zH79r1NY6A9x+rgq5CpH3uK8 g==;
X-CSE-ConnectionGUID: vzbeaWT8THOqbG3tLxDRUw==
X-CSE-MsgGUID: s+gMB9rORXCRJfbG3BdX4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17850166"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="17850166"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 01:01:22 -0700
X-CSE-ConnectionGUID: oQOzgdMBScG7Q710cALbcw==
X-CSE-MsgGUID: gI4nBCg7R4iLO0TwHXomQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="48864038"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.254.89])
 ([10.94.254.89])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 01:01:20 -0700
Message-ID: <4121fb1b-8766-43fc-a237-3fde5f6abbef@linux.intel.com>
Date: Wed, 10 Jul 2024 10:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, lucas.demarchi@gmail.com,
 Matthew Auld <matthew.auld@intel.com>
References: <cover.1720515376.git.akshata.jahagirdar@intel.com>
 <e597e39b0c22d3b58cda09e0e4b33f883b9140db.1720515376.git.akshata.jahagirdar@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <e597e39b0c22d3b58cda09e0e4b33f883b9140db.1720515376.git.akshata.jahagirdar@intel.com>
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

Hi Akshata,


I have two patches(2,3) in 
https://patchwork.freedesktop.org/series/135743/ that deals with this 
which I sent to

to handle bo clear for igfx. Those two patches are independent of my 
series and I you can incorporate it.


https://patchwork.freedesktop.org/patch/602287/?series=135743&rev=1

https://patchwork.freedesktop.org/patch/602288/?series=135743&rev=1


Regards,

Nirmoy

On 7/10/2024 10:17 AM, Akshata Jahagirdar wrote:
> For Xe2 dGPU, we clear the bo by modifying the VRAM using an
> uncompressed pat index which then indirectly updates the
> compression status as uncompressed i.e zeroed CCS.
> So xe_migrate_clear() should be updated for BMG to not
> emit CCS surf copy commands.
>
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.h  | 5 +++++
>   drivers/gpu/drm/xe/xe_migrate.c | 6 +++---
>   2 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 0a2a3e7fd402..c3093506c28c 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -144,6 +144,11 @@ static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
>   	return xe->info.has_flat_ccs;
>   }
>   
> +static inline bool xe_device_needs_ccs_emit(struct xe_device *xe)
> +{
> +	return xe_device_has_flat_ccs(xe) && !(GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe));
> +}
> +
>   static inline bool xe_device_has_sriov(struct xe_device *xe)
>   {
>   	return xe->info.has_sriov;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index fa23a7e7ec43..2fc2cf375b1e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -420,7 +420,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>   		return ERR_PTR(err);
>   
>   	if (IS_DGFX(xe)) {
> -		if (xe_device_has_flat_ccs(xe))
> +		if (xe_device_needs_ccs_emit(xe))
>   			/* min chunk size corresponds to 4K of CCS Metadata */
>   			m->min_chunk_size = SZ_4K * SZ_64K /
>   				xe_device_ccs_bytes(xe, SZ_64K);
> @@ -1034,7 +1034,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
>   					avail_pts);
>   
> -		if (xe_device_has_flat_ccs(xe))
> +		if (xe_device_needs_ccs_emit(xe))
>   			batch_size += EMIT_COPY_CCS_DW;
>   
>   		/* Clear commands */
> @@ -1062,7 +1062,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		if (!clear_system_ccs)
>   			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
>   
> -		if (xe_device_has_flat_ccs(xe)) {
> +		if (xe_device_needs_ccs_emit(xe)) {
>   			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
>   				      m->cleared_mem_ofs, false, clear_L0);
>   			flush_flags = MI_FLUSH_DW_CCS;
