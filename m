Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022DAD2AB2C
	for <intel-xe@archiver.kernel.org>; Wed, 30 Oct 2024 08:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8F610E409;
	Wed, 30 Oct 2024 08:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAYoviTn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D63A10E409
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Oct 2024 08:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730278722; x=1761814722;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=W28XEjfrFc/NPXUFRwCcDryQlA21Kg/gyN8+qeM8xYQ=;
 b=hAYoviTnDZhd5pFdkmNstm5xQnocDfMAnfG/yNQt8JbgNqA+Odg9oLP+
 UR+919VfGO9safOf+DZoKzm9pSAxLCmtOC+rX9t+zDn8wia9d1nZ5Luxi
 mdL0DMTg7NbXdiScav6lF7x1Yzm8qpWw6LZ2bYL4BdIS+vzHfRs0nuieO
 l0xme1NsETUw5GaK1F2O/17m2YndUMg+ZuHVb7pSoyQ1hJXrreMnVLcIX
 MccOU5zz61Pa5FSX4wswbXAKi57AmEgRWPwJ0KoFSKCXUtjsewXlVNHMf
 mCz3Xxzdoo4JsumnJ/TX0ZF4iI6EN0h3w0kcMCMkYBhPQ0dH5fWbExvxK Q==;
X-CSE-ConnectionGUID: 9lYieUrQTyelYykneHwNvw==
X-CSE-MsgGUID: KL4UOv/IS5yYZRD4i3uHCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29808701"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29808701"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 01:58:41 -0700
X-CSE-ConnectionGUID: +iBpqBivT/Kw/4zs6s3snw==
X-CSE-MsgGUID: eZq69kpxQ6mdX3ZS2RrfbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; d="scan'208";a="113044567"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.244.252])
 ([10.245.244.252])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 01:58:40 -0700
Message-ID: <2d46d261-2d28-4e0b-82d3-fce624587c5c@intel.com>
Date: Wed, 30 Oct 2024 08:58:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6] drm/xe/mmap: Add mmap support for PCI memory barrier
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: Michal Mrozek <michal.mrozek@intel.com>
References: <20241025110503.1014162-1-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241025110503.1014162-1-tejas.upadhyay@intel.com>
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

On 25/10/2024 12:05, Tejas Upadhyay wrote:
> In order to avoid having userspace to use MI_MEM_FENCE,
> we are adding a mechanism for userspace to generate a
> PCI memory barrier with low overhead (avoiding IOCTL call
> as well as writing to VRAM will adds some overhead).
> 
> This is implemented by memory-mapping a page as uncached
> that is backed by MMIO on the dGPU and thus allowing userspace
> to do memory write to the page without invoking an IOCTL.
> We are selecting the MMIO so that it is not accessible from
> the PCI bus so that the MMIO writes themselves are ignored,
> but the PCI memory barrier will still take action as the MMIO
> filtering will happen after the memory barrier effect.
> 
> When we detect special defined offset in mmap(), We are mapping
> 4K page which contains the last of page of doorbell MMIO range
> to userspace for same purpose.
> 
> For user to query special offset we are adding special flag in
> mmap_offset ioctl which needs to be passed as follows,
> struct drm_xe_gem_mmap_offset mmo = {
>          .handle = 0, /* this must be 0 */
>          .flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> };
> igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
> 
> Note: Test coverage for this is added by IGT
>        https://patchwork.freedesktop.org/series/140368/  here.
>        UMD implementing test, once PR is ready will attach with
>        this patch.
> 
> V6(MAuld)
>    - Move physical mmap to fault handler
>    - Modify kernel-doc and attach UMD PR when ready
> V5(MAuld)
>    - Return invalid early in case of non 4K PAGE_SIZE
>    - Format kernel-doc and add note for 4K PAGE_SIZE HW limit
> V4(MAuld)
>    - Add kernel-doc for uapi change
>    - Restrict page size to 4K
> V3(MAuld)
>    - Remove offset defination from UAPI to be able to change later
>    - Edit commit message for special flag addition
> V2(MAuld)
>    - Add fault handler with dummy page to handle unplug device
>    - Add Build check for special offset to be below normal start page
>    - Test d3hot, mapping seems to be valid in d3hot as well
>    - Add more info to commit message
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
