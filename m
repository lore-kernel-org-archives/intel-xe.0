Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56671C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 17:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DAC10F247;
	Thu, 11 Apr 2024 17:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZX6a/oC0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5B710F247
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 17:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712854881; x=1744390881;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2OPAfFOfbSNMNQMPgCI9PASFttHzv4quTB2LvPR0dB8=;
 b=ZX6a/oC0KE2PH+i5tJDQdgULiDaI11do/lhPlcCeXQl5jvwCyrWKpi1a
 iZFjjaKj5DcDICRfIT4uQqKmE1hPLsqQNULkRMwjA85+2uUPXB6+Y1eN4
 XMRzkwobG8049j8ZgGI6gr5BOyH9zapOdaS6GjxFJWS0n5V0mi+ut/CZM
 nKhXTbhD7ZLf2O6p9+8adKb8FhPKc/somfJW1F6iHX6vfQcLusiDYddGy
 EuqD1dW/ks7JuJCAyfZ2fAI5t4EefJQEz+DhJm9Wy5xxG02uQmx3xXmq0
 xt3sqq+Yu8oJMolc7qYgWmCIUBbgQrDGdghgaEXalssrvT55XhXL1SEuL Q==;
X-CSE-ConnectionGUID: cBmBuAgbRYSnAYLNCL9jeg==
X-CSE-MsgGUID: pojju86HRraJz6GdvVI+/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8134275"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8134275"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 10:01:20 -0700
X-CSE-ConnectionGUID: +Mo648UxToaCteBGIZpuNg==
X-CSE-MsgGUID: jsyE+8/GSfK6nErifxSQjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21043163"
Received: from anishett-mobl2.gar.corp.intel.com (HELO [10.246.52.84])
 ([10.246.52.84])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 10:00:57 -0700
Message-ID: <545742c9-5f62-46de-a69b-944bc5e6f510@linux.intel.com>
Date: Thu, 11 Apr 2024 19:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Enable device atomics with a VM bind flag
To: "Zeng, Oak" <oak.zeng@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>, "Yang, Fei" <fei.yang@intel.com>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Mrozek, Michal" <michal.mrozek@intel.com>,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
References: <20240410170308.409-1-nirmoy.das@intel.com>
 <SA1PR11MB69919E24A17807B65DB2EA2692052@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <SA1PR11MB69919E24A17807B65DB2EA2692052@SA1PR11MB6991.namprd11.prod.outlook.com>
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

Hi Oak,

On 4/11/2024 6:22 PM, Zeng, Oak wrote:
>
>> -----Original Message-----
>> From: Das, Nirmoy <nirmoy.das@intel.com>
>> Sent: Wednesday, April 10, 2024 1:03 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Das, Nirmoy <nirmoy.das@intel.com>; Vivekanandan, Balasubramani
>> <balasubramani.vivekanandan@intel.com>; Welty, Brian
>> <brian.welty@intel.com>; Yang, Fei <fei.yang@intel.com>; Landwerlin, Lionel G
>> <lionel.g.landwerlin@intel.com>; Roper, Matthew D
>> <matthew.d.roper@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
>> Mrozek, Michal <michal.mrozek@intel.com>; Zeng, Oak <oak.zeng@intel.com>;
>> Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>> Subject: [PATCH 0/3] Enable device atomics with a VM bind flag
>>
>> Currently device atomics in SMEM only buffer is not supported and
>> given that simultaneous usage of device atomics and CPU atomics on
>> the same SMEM buffer is not guaranteed to function without migration,
>> and UMD expects no migration for SMEM-only buffer objects, so this
>> provide a way to set device atomics when UMD is certain to use the
>> buffer only for device atomics.
> If I understand it correctly, per umd-kmd contract, kmd should assume all shared allocations support system-wide atomic by default

Do we have any reference to this ? I wish this is documented somewhere.

For Level0, the system-wide atomics is default expectation only when 
there is KMD migration and on buffer with SMEM+LMEM placements. This is 
my understanding

after long discussion that I had with Michal, Matt, and Lionel.

This patch is needed because a vulkan application can always try to do 
cpu atomics  on SMEM only BO and we can't allow device atomics on that 
by default.

>   (i.e. even if there is not any user settings). So if we want to introduce API to let user to say "only device atomic is expected on this allocation", the API would be "No system-wide atomics on this allocation".
I think the flag name suites well with existing 
"ZE_MEMORY_ATOMIC_ATTR_EXP_FLAG_DEVICE_ATOMICS".
>
> Similarly, we can introduce API to let user say:
> 	there is no atomics expected to this allocation
> 	no device atomic or
> 	no host atomic

We can add those once we have such requirement from UMD.


Regards,

Nirmoy

>
> But the above assumption (all allocation by default support system-wide atomics) doesn't work for device or host allocations on some platform, i.e., as explained in the commit message...
>
> So the API format is still an open to me. Should we define thing similar to umd api here: https://spec.oneapi.io/level-zero/latest/core/api.html#ze-memory-atomic-attr-exp-flags-t
>
> Oak
>
>
>> Test-with: 20240410170041.24963-1-nirmoy.das@intel.com
>> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> Cc: Brian Welty <brian.welty@intel.com>
>> Cc: Fei Yang <fei.yang@intel.com>
>> Cc: Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Mrozek <michal.mrozek@intel.com>
>> Cc: Oak Zeng <oak.zeng@intel.com>
>> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>>
>> Nirmoy Das (3):
>>    drm/xe: Consolidate setting PTE_AE into one place
>>    drm/xe: Add function to check if BO has single placement
>>    drm/xe/uapi: Introduce VMA bind flag for device atomics
>>
>>   drivers/gpu/drm/xe/xe_bo.c       | 14 ++++++++++++++
>>   drivers/gpu/drm/xe/xe_bo.h       |  1 +
>>   drivers/gpu/drm/xe/xe_pt.c       |  4 +---
>>   drivers/gpu/drm/xe/xe_vm.c       | 32 ++++++++++++++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>>   include/uapi/drm/xe_drm.h        |  9 +++++----
>>   6 files changed, 51 insertions(+), 11 deletions(-)
>>
>> --
>> 2.42.0
