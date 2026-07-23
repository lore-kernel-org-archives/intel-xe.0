Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9991AC531F8
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC8E10E5FE;
	Thu, 23 Jul 2026 16:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eHZubC6v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7187810E5FE
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 16:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784823910; x=1816359910;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DQL+0bkA9gAmVpsHtimryNhc8gT6PqNGf5KywhzftM8=;
 b=eHZubC6vwW5obWmQ6Upx5puATaYHoxDI5H5UZA+ZXIXVZmGHTuDBnDf5
 G01WxzxEboXgL6Q1WS20HBVtV2z7tyh4o/oAF3a34nfAV2kgj2lDyPaJO
 +NsD5q/L0+qcSfVoGizdicc9R0OyQn0HiUMvh4djYdIbfl2kFLi8Wbp9t
 zMzwgpa250Y8Ff/3npiW0CNAnW2Rcb3/5aQbi1F2so8b3uRmlVLPZjcEK
 trCVk14rgZ95BqbAMINYC0oLIYhOKVlZfiws54+3vV9Eatz7UfjWXCpml
 HE5/R0oz7MuscTJCdA/YDhYzYOK3kbBfgEu6XC9G/MrqslJ/YKBLnVceS w==;
X-CSE-ConnectionGUID: bMFQOzrWTmy0CNaN7jPM1Q==
X-CSE-MsgGUID: cEqRs5IPTsuyniolwBDCLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="88023414"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="88023414"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:25:10 -0700
X-CSE-ConnectionGUID: lBfo6EhdR9SU+RqpZXeryA==
X-CSE-MsgGUID: cwMoTXTxQh65Vsh8PiOZhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="255087617"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.109])
 ([10.245.244.109])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:25:08 -0700
Message-ID: <b6640f65-df11-431a-a8a5-61fd65c407c9@intel.com>
Date: Thu, 23 Jul 2026 17:25:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] drm/xe/mmio_gem: forbid VMA split
To: Ilia Levi <ilia.levi@intel.com>, intel-xe@lists.freedesktop.org
Cc: koby.elbaz@intel.com, meny.yossefi@intel.com, shuicheng.lin@intel.com,
 thomas.hellstrom@intel.com, matthew.brost@intel.com
References: <20260723161832.137153-1-ilia.levi@intel.com>
 <20260723161832.137153-2-ilia.levi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260723161832.137153-2-ilia.levi@intel.com>
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

On 23/07/2026 17:18, Ilia Levi wrote:
> The fault handler assumes it always operates on a VMA spanning the entire
> GEM object. This does not hold when the VMA has been split, e.g. by a
> partial munmap or mprotect. In that case the handler may map wrong
> physical pages or cause SIGBUS.
> 
> Handle this by forbidding VMA split, as partial unmaps are not deemed
> useful for MMIO GEMs.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_mmio_gem.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
> index 8c803ef233cc..f15a6a84af15 100644
> --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
> @@ -39,10 +39,20 @@ struct xe_mmio_gem {
>   	phys_addr_t phys_addr;
>   };
>   
> +static int xe_mmio_gem_vm_may_split(struct vm_area_struct *area, unsigned long addr)
> +{
> +	/*
> +	 * Forbid splitting. Together with VM_DONTEXPAND, this keeps the VMA
> +	 * matching the GEM object exactly.
> +	 */
> +	return -EINVAL;
> +}
> +
>   static const struct vm_operations_struct vm_ops = {
>   	.open = drm_gem_vm_open,
>   	.close = drm_gem_vm_close,
>   	.fault = xe_mmio_gem_vm_fault,
> +	.may_split = xe_mmio_gem_vm_may_split,
>   };
>   
>   static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {

