Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782DFD62073
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 10:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C1910E1C0;
	Tue, 19 Nov 2024 10:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/hhb+6I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6C710E1C0
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 10:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732013522; x=1763549522;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=07ITo+1UGsC7pjGyQFLAxJevd1QSeeyrew+R4oh+g9s=;
 b=e/hhb+6IoXBMMpHJAZOgd3bEtXWHxCr5NjkkE6FAzrt1H27Urz8EXCxw
 vLXUSOzkb4muwmYZzcSpznnD+xZqvHQ0vdADM7yRPK3X9RMMfWHi3pHBf
 FkxXkQfL6f+rrkD2Teb9nVgXzcpT34oZ+G0wmTNlrp3Hj7CnrIzha9ZJn
 ddQ/G4BugoACqsnx9YwNlHimsh4/TYAcSFjZbN42pok2ocg39x5S3zEPU
 3cAPWFA5J8p0Iz5eXGbd29JabnulAOAVoDNxaEWCE63jA42km4n6jOF4s
 BKt8uTIH3Fk4p0FUqjtkKUHrfKYXNjtIgRUOOLdm5h3TsVUtpX9Vpsx8o g==;
X-CSE-ConnectionGUID: Ncr750C/SlOizKc5+VXwGQ==
X-CSE-MsgGUID: 4qgKiSBvQU2lrsDpjCC5HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54503303"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54503303"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 02:52:02 -0800
X-CSE-ConnectionGUID: siT7o1QtRo2ZUjHNiuY02w==
X-CSE-MsgGUID: aN2Pfi7uQIu7xFJ/XktS8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="94352227"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.76])
 ([10.245.244.76])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 02:52:00 -0800
Message-ID: <7f8fccfd-cb92-47bd-b6d3-bbed2a11094e@intel.com>
Date: Tue, 19 Nov 2024 10:51:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Sort again the info flags
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20241118223314.1969166-1-lucas.demarchi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241118223314.1969166-1-lucas.demarchi@intel.com>
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

On 18/11/2024 22:33, Lucas De Marchi wrote:
> Those flags are supposed to be kept sorted alphabetically. Unfortunately
> it's a constant battle as new flags are added to the end or at random
> places. Sort it again.
> 
> v2: Include the other non-has_* 1-bit flags in the sort
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h | 32 ++++++++++++++++------------
>   1 file changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8592f1b02db11..8b2b12daa49dd 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -294,14 +294,21 @@ struct xe_device {
>   		/** @info.va_bits: Maximum bits of a virtual address */
>   		u8 va_bits;

Should we not document somewhere here that the below should be kept sorted?

>   
> -		/** @info.is_dgfx: is discrete device */
> -		u8 is_dgfx:1;
> -		/** @info.has_asid: Has address space ID */
> -		u8 has_asid:1;
>   		/** @info.force_execlist: Forced execlist submission */
>   		u8 force_execlist:1;
> +
> +		/** @info.has_asid: Has address space ID */
> +		u8 has_asid:1;
> +		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
> +		u8 has_atomic_enable_pte_bit:1;
> +		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
> +		u8 has_device_atomics_on_smem:1;
>   		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
>   		u8 has_flat_ccs:1;
> +		/** @info.has_heci_cscfi: device has heci cscfi */
> +		u8 has_heci_cscfi:1;
> +		/** @info.has_heci_gscfi: device has heci gscfi */
> +		u8 has_heci_gscfi:1;
>   		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
>   		u8 has_llc:1;
>   		/** @info.has_mmio_ext: Device has extra MMIO address range */
> @@ -312,6 +319,10 @@ struct xe_device {
>   		u8 has_sriov:1;
>   		/** @info.has_usm: Device has unified shared memory support */
>   		u8 has_usm:1;
> +
> +		/** @info.is_dgfx: is discrete device */
> +		u8 is_dgfx:1;
> +
>   		/**
>   		 * @info.probe_display: Probe display hardware.  If set to
>   		 * false, the driver will behave as if there is no display
> @@ -321,20 +332,13 @@ struct xe_device {
>   		 * state the firmware or bootloader left it in.
>   		 */
>   		u8 probe_display:1;
> +
> +		/** @info.skip_guc_pc: Skip GuC based PM feature init */
> +		u8 skip_guc_pc:1;
>   		/** @info.skip_mtcfg: skip Multi-Tile configuration from MTCFG register */
>   		u8 skip_mtcfg:1;
>   		/** @info.skip_pcode: skip access to PCODE uC */
>   		u8 skip_pcode:1;
> -		/** @info.has_heci_gscfi: device has heci gscfi */
> -		u8 has_heci_gscfi:1;
> -		/** @info.has_heci_cscfi: device has heci cscfi */
> -		u8 has_heci_cscfi:1;
> -		/** @info.skip_guc_pc: Skip GuC based PM feature init */
> -		u8 skip_guc_pc:1;
> -		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
> -		u8 has_atomic_enable_pte_bit:1;
> -		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
> -		u8 has_device_atomics_on_smem:1;
>   	} info;
>   
>   	/** @irq: device interrupt state */

