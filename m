Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF49C8303F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 15:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4E710E0D9;
	Thu, 28 Aug 2025 15:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ia1VGh7T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBC710E3BD
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 15:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756396750; x=1787932750;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qH446A8JxTvE5pekJJF5poG5cTIN4FMdbv4TKf/QINk=;
 b=ia1VGh7TOgu6NhbCMmkKMbG5o5QRIIEm16Dul1Er4naYz78iWOFKOsJz
 uYg750cZV5tx/SuTTkBe3CM2yZoWfoYA2LB7WMkRUOcr6US8rheJKNmSL
 cTja2Zt4fFhpYiKHDsXoaHZ3MFzMHFOD9ZLQvOzooI5Y/T0+1WT7wqgIJ
 /sCOJRN0wzKY9UWhwG1NAe5O9v6doCdJoSdggaUM+uOeVcHXx5mV1qU6J
 Tl7aGozt7t6j6W/6hCMj+MjQkYSSTrltzf2vGtuBUvlD76heG3RJIzrmz
 ra3MM9KKru/Q6n59uOv0TD62pGKjKBga6SBASy0mOeznvcLrt1ZRAaDhz g==;
X-CSE-ConnectionGUID: RYvGNDQiSCWCM1SQu3630w==
X-CSE-MsgGUID: ipVucDGdRu6/QBXXnR8YJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="61304584"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="61304584"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 08:59:09 -0700
X-CSE-ConnectionGUID: iMUXeLYaR628ps+8NlhPxQ==
X-CSE-MsgGUID: 8ykOVGRgTE6KHGbqG/QAVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="170537967"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.84])
 ([10.245.245.84])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 08:59:05 -0700
Message-ID: <8621165a-68d0-467b-8fe5-c28b500c0d5e@intel.com>
Date: Thu, 28 Aug 2025 16:59:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Attempt to bring bos back to VRAM after eviction
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
References: <20250828154219.4889-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250828154219.4889-1-thomas.hellstrom@linux.intel.com>
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

On 28/08/2025 16:42, Thomas Hellström wrote:
> VRAM+TT bos that are evicted from VRAM to TT may remain in
> TT also after a revalidation following eviction or suspend.
> 
> This manifests itself as applications becoming sluggish
> after buffer objects get evicted or after a resume from
> suspend or hibernation.
> 
> If the bo supports placement in both VRAM and TT, and
> we are on DGFX, mark the TT placement as fallback. This means
> that it is tried only after VRAM + eviction.
> 
> This flaw has probably been present since the xe module was
> upstreamed but use a Fixes: commit below where backporting is
> likely to be simple. For earlier versions we need to open-
> code the fallback algorithm in the driver.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5995
> Fixes: a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: <stable@vger.kernel.org> # v6.9+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4faf15d5fa6d..64dea4e478bd 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -188,6 +188,8 @@ static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
>   
>   		bo->placements[*c] = (struct ttm_place) {
>   			.mem_type = XE_PL_TT,
> +			.flags = (IS_DGFX(xe) && (bo_flags & XE_BO_FLAG_VRAM_MASK)) ?

I suppose we could drop the dgfx check here?

Either way,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +			TTM_PL_FLAG_FALLBACK : 0,
>   		};
>   		*c += 1;
>   	}

