Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5953BC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 10:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1776210F53F;
	Mon, 22 Apr 2024 10:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UT2N7of3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F346F10F53F
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713780833; x=1745316833;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rbobbWsWtj/LQQc69joQLehEZTXDDymxdk6IxGuPb3s=;
 b=UT2N7of37NpP9SyVnyQG8or+Ot72Kyh4w803hX/uwa8NKSlYo+mhX2ug
 FnvcbDCmGSICl9PZKu3iOTyXthaj8z8gh1OViJ0cVAHQr3FfH3KpzZcfJ
 jvg1NrKfxfGkllCmd8QCJQW0qy6eOjOMgCAcpHryPnA7x91125BqNJptE
 zSBJ9rni7AdCMRtqjfloyGdSalXLXvAoweeZbO3pT8ozvHwKTnlmHR9du
 tirFxTHeakQtrJ+keyKuzj/RKIASer2uli7k2EQ4SCyY5+XsoXYOI+yPE
 7iK+HjdQvuTCIk0Hu+nSe70Os8s/MewtVbm60Z8i2+6A+4flmh4fH85aB g==;
X-CSE-ConnectionGUID: VHrybxiRTK203+11odK3LQ==
X-CSE-MsgGUID: tt1oMX79Qb2XKeBbtj57CQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="34709284"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="34709284"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 03:13:52 -0700
X-CSE-ConnectionGUID: 993xj+yiRlWY2zDHuzOINQ==
X-CSE-MsgGUID: nmbdUMbHTEynqAQqW8wkwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="23841187"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.249.155])
 ([10.94.249.155])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 03:13:49 -0700
Message-ID: <de7b5890-5aec-4637-ad1a-4634751f543a@linux.intel.com>
Date: Mon, 22 Apr 2024 12:13:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Enable device atomics with a VM bind flag
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Brian Welty <brian.welty@intel.com>, Fei Yang <fei.yang@intel.com>,
 Jose Souza <jose.souza@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, Oak Zeng <oak.zeng@intel.com>,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
References: <20240415145214.25641-1-nirmoy.das@intel.com>
 <13c03470-ed7f-4e64-ad77-1c45a40d7966@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <13c03470-ed7f-4e64-ad77-1c45a40d7966@intel.com>
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


On 4/19/2024 9:17 AM, Lionel Landwerlin wrote:
> Just uploaded a Mesa MR for this series : 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28823


Thanks a lot, I will add this as reference in the next revisions.

Nirmoy

>
> -Lionel
>
> On 15/04/2024 17:52, Nirmoy Das wrote:
>> Currently device atomics in SMEM only buffer is not supported and
>> given that simultaneous usage of device atomics and CPU atomics on
>> the same SMEM buffer is not guaranteed to function without migration,
>> and UMD expects no migration for SMEM-only buffer objects, so this
>> provide a way to set device atomics when UMD is certain to use the
>> buffer only for device atomics.
>>
>> v3: Capture ret value of xe_vm_bind_ioctl_validate_bo(Matt B).
>>      Remove redundant coh_mode param from 
>> xe_vm_bind_ioctl_validate_bo().
>>      Remove has_device_atomics_on_smem from xe_graphics_desc(Jose).
>>      Replace DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM with
>>      config flag DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM(Jose).
>>      Mention that PTE_AE will not be applied to userptr(Matt R)
>>
>> v2: Add BO helper func in xe_vm_bind_ioctl()(Matt B).
>>      Use XE_IOCTL_DBG for checks(Matt B).
>>      Move platform checks with help of adding flags in
>>      intel_device_info(Matt B).
>>      Add document for DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS(Matt B).
>>      Create query uAPI for this newly added VM bind flag(Jose, Lionel).
>>
>> Test-with: 20240415143528.4107-1-nirmoy.das@intel.com
>> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> Cc: Brian Welty <brian.welty@intel.com>
>> Cc: Fei Yang <fei.yang@intel.com>
>> Cc: Jose Souza <jose.souza@intel.com>
>> Cc: Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Mrozek <michal.mrozek@intel.com>
>> Cc: Oak Zeng <oak.zeng@intel.com>
>> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>>
>> Nirmoy Das (7):
>>    drm/xe: Introduce has_atomic_enable_pte_bit device info
>>    drm/xe: Consolidate setting PTE_AE into one place
>>    drm/xe: Add function to check if BO has single placement
>>    drm/xe: Move vm bind bo validation to a helper function
>>    drm/xe: Introduce has_device_atomics_on_smem device info
>>    drm/xe/uapi: Introduce VMA bind flag for device atomics
>>    drm/xe/uapi: Add a query flag for has_device_atomics_on_smem
>>
>>   drivers/gpu/drm/xe/xe_bo.c           |  14 ++++
>>   drivers/gpu/drm/xe/xe_bo.h           |   1 +
>>   drivers/gpu/drm/xe/xe_device_types.h |   4 +
>>   drivers/gpu/drm/xe/xe_pci.c          |   5 ++
>>   drivers/gpu/drm/xe/xe_pci_types.h    |   1 +
>>   drivers/gpu/drm/xe/xe_pt.c           |   4 +-
>>   drivers/gpu/drm/xe/xe_query.c        |   3 +
>>   drivers/gpu/drm/xe/xe_vm.c           | 106 +++++++++++++++++----------
>>   drivers/gpu/drm/xe/xe_vm_types.h     |   2 +
>>   include/uapi/drm/xe_drm.h            |  22 ++++--
>>   10 files changed, 116 insertions(+), 46 deletions(-)
>>
>
