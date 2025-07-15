Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F01C83F1D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 08:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D0C10E558;
	Tue, 15 Jul 2025 08:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8UJI60g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C913410E57D
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 08:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752567333; x=1784103333;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bgHqEHDnZY1iOgD5mGNfQ2QZUuBw+LlMsjhE1ieKMfY=;
 b=I8UJI60gzo/mOesewvtn4S0HtuYow/KjF4E6VQ0fohO9ycAtpvhT7YMQ
 b12icYUZu1KK8YNQuINNmjD5jC5pGYFwOTh8T8jHSfeKiuNp56LkTzjSO
 CDshPBcueRcq/cMUjAfgiepb3BMRxrsXsm9JpbnPT9ymGXRfC6DSoxjXi
 Z66AOrxUV/pQKhn/PX3/YVB7quE/IHbbJIBmXu+OLckpWLcJjyVaOnz/B
 HcosUF9P1xMDeMW+zxBOnESwR8gwFj0+zvPN+eT+f/lfQkRVzBcLkNPRo
 EK1bA+d3G5IRzZ9bEKQxNXXbW2ZdFzoh5iJskvhoFTnHG3sfRd7y6sxS4 Q==;
X-CSE-ConnectionGUID: Zh6LJ3CQRTymvm7a/5mBrw==
X-CSE-MsgGUID: otegovE/QaqldSDaFl9JMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54485009"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54485009"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 01:15:33 -0700
X-CSE-ConnectionGUID: 1nBRDwioSfS8enMfRbmbhA==
X-CSE-MsgGUID: S+VFLky1RByUPEvheuvcyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="161703767"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.193])
 ([10.245.244.193])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 01:15:25 -0700
Message-ID: <338a3400-1202-4c12-a99b-6a45004ce548@intel.com>
Date: Tue, 15 Jul 2025 09:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Disable compression on SVM
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: michal.mrozek@intel.com, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, thomas.hellstrom@linux.intel.com
References: <20250714173342.2997396-1-matthew.brost@intel.com>
 <20250714173342.2997396-2-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250714173342.2997396-2-matthew.brost@intel.com>
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

On 14/07/2025 18:33, Matthew Brost wrote:
> This is not yet supported, forcefully disable by setting pat_index to
> zero for CPU address mirror VMAs.
> 
> Cc: stable@vger.kernel.org
> Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2035604121e6..73cb981c0956 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2362,7 +2362,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>   			op->map.is_cpu_addr_mirror = flags &
>   				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
>   			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> -			op->map.pat_index = pat_index;
> +			if (op->map.is_cpu_addr_mirror)
> +				op->map.pat_index = 0;

Is this meant as a safe default or is this just a dummy value? If this 
actually gets programmed in the hw, maybe XE_CACHE_WB would be better 
here? That way we know exactly what it does from driver POV for a given 
platform. Index zero for example might have no host coherency (might 
then need WC on host). In some world index zero could enable compression.

> +			else
> +				op->map.pat_index = pat_index;
>   			op->map.invalidate_on_bind =
>   				__xe_vm_needs_clear_scratch_pages(vm, flags);
>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {

