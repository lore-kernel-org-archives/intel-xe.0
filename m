Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D403AC25B74
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 16:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEDF1121E5;
	Mon,  6 May 2024 16:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4ctI5hf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDD81121E5
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 16:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715012509; x=1746548509;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OKgZhcdwXee4rqBQt7jNTQa/HsG9YKoyUK/WhLCqK9k=;
 b=L4ctI5hf0tE/tjCosyi2OevRHNAkbREoB8tHLGP1RWq0Bf5iqQmIZU05
 tUCGc/8zScAD4W9K858XItcnkwl+kGKJFiNHP8fYTShpm0l3Xzi8+nSvs
 7vasLqgN6J8LMtOHIWIp0LpBK5MYSpj3nyXRuwdzTzXGP1RItyzwf4/M2
 IRmia8bD0owFLkblCO0OFxBjki7bMs9gZY8RzIbKKt2fgIWE8osLSI4zT
 6sdsgtoAtfP/ZSBjETB2zWgMAuAGlk7WJj3yT18wMbWTG7vA5bcl8r+Z8
 aM38jw15W61Vrzc2DXtqO2NmIobau5Luvx0FobGXlYN7Y0rusitIITWwY g==;
X-CSE-ConnectionGUID: FFQnGE24Rv+3CvEbGRcPOg==
X-CSE-MsgGUID: UhyPzPQlQD+YokBJyKjuIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10982629"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="10982629"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 09:21:48 -0700
X-CSE-ConnectionGUID: XeCUggyyT8mR3Ksx0MjSUA==
X-CSE-MsgGUID: S/AHnzXESAGjl0UVl1SjVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28318806"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.32.254])
 ([10.246.32.254])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 09:21:46 -0700
Message-ID: <a5c00ba6-b6b7-4847-9fcb-735bfd3b6f19@linux.intel.com>
Date: Mon, 6 May 2024 18:21:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] Refactor default device atomic settings
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Brian Welty <brian.welty@intel.com>, Fei Yang <fei.yang@intel.com>,
 Jose Souza <jose.souza@intel.com>,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, Oak Zeng <oak.zeng@intel.com>,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240430162529.21588-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240430162529.21588-1-nirmoy.das@intel.com>
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

Merged to drm-xe-next

On 4/30/2024 6:25 PM, Nirmoy Das wrote:
> The default behavior of device atomics depends on the
> VM type and buffer allocation types. Device atomics are
> expected to function with all types of allocations for
> traditional applications/APIs. Additionally, in compute/SVM
> API scenarios with fault mode or LR mode VMs, device atomics
> must work with single-region allocations. In all other cases
> device atomics should be disabled by default. PVC needs special
> care as it doesn't support device atomics on SMEM.
>
> v6: Only check LR mode to determine compute API as fault
>      mode requires LR mode(Jose)
>      Set AE=1 on SMEM+LMEM allocation when a buffer is migrated
>      to LMEM from SMEM(Brian)
>
> v5: Fix broken atomics on PVC from v4 changes.
>
> v4: Previous assumption that device atomics should be disabled
>      by default on SMEM only BO was wrong as traditional applications
>      will not use such allocations for CPU atomics. So remove the
>      VM bind flag and the query uAPI and instead refactor default device
>      atomics settings as per VM type and buffer allocations.
>
>
> v3: Capture ret value of xe_vm_bind_ioctl_validate_bo(Matt B).
>      Remove redundant coh_mode param from xe_vm_bind_ioctl_validate_bo().
>      Remove has_device_atomics_on_smem from xe_graphics_desc(Jose).
>      Replace DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM with
>      config flag DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM(Jose).
>      Mention that PTE_AE will not be applied to userptr(Matt R)
>
> v2: Add BO helper func in xe_vm_bind_ioctl()(Matt B).
>      Use XE_IOCTL_DBG for checks(Matt B).
>      Move platform checks with help of adding flags in
>      intel_device_info(Matt B).
>      Add document for DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS(Matt B).
>      Create query uAPI for this newly added VM bind flag(Jose, Lionel).
>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Jose Souza <jose.souza@intel.com>
> Cc: Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>
> Nirmoy Das (5):
>    drm/xe: Introduce has_atomic_enable_pte_bit device info
>    drm/xe: Move vm bind bo validation to a helper function
>    drm/xe: Introduce has_device_atomics_on_smem device info
>    drm/xe: Add function to check if BO has single placement
>    drm/xe: Refactor default device atomic settings
>
>   drivers/gpu/drm/xe/xe_bo.c           | 14 +++++
>   drivers/gpu/drm/xe/xe_bo.h           |  1 +
>   drivers/gpu/drm/xe/xe_device_types.h |  4 ++
>   drivers/gpu/drm/xe/xe_pci.c          |  5 ++
>   drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>   drivers/gpu/drm/xe/xe_pt.c           | 37 +++++++++++--
>   drivers/gpu/drm/xe/xe_vm.c           | 79 ++++++++++++++++------------
>   7 files changed, 103 insertions(+), 38 deletions(-)
>
