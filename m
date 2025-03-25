Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D46C36005
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 13:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C9810E39C;
	Tue, 25 Mar 2025 13:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vc3X0jW+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A13510E39C
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 13:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742910096; x=1774446096;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=fu0cW++Ia3YTqB/AL/8Ur/zAcZOzohg/+6bR/HYjgTw=;
 b=Vc3X0jW+Au30YxFGngQbdv8Gw0t1khdnI+hTNfFJah2Y5noyqxSh7Tjq
 uLUknhY9EeF/2zD3fpWYirDUnjdIdJ6emdJwNGvaweINZ9VuIgmYDGtzZ
 STw89iWJ9Bs+F90yHXBGUzKIOh6UZZT0lS/H/jrfGHb0wAWllZdpODEuH
 /swkac4U+5yKMlC6+wLW9OgEP0F2zCFeicl05kjDVyD0+Aw13vT6KgBc1
 zGann8BKW2q6T2CIobefaEr7zggVlaG8WBHGUeyU1Z9tg4X3DOZoovnvH
 5sd5+3zIuKkb3aK2m3V28gfVuagHhvKT9LsjW0gLzNTN8lqqbaLeF2JgC A==;
X-CSE-ConnectionGUID: VdM7/petRbWMCR2UYRMxFw==
X-CSE-MsgGUID: xa+Z6nTSQ4mf4uCUJA/7ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43313515"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="43313515"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 06:41:36 -0700
X-CSE-ConnectionGUID: aRU9Xcz/R1aEmPbb5Hsssw==
X-CSE-MsgGUID: Czz4HmoSQCCyhzfjxKkIKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="125319227"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO [10.245.244.125])
 ([10.245.244.125])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 06:41:34 -0700
Message-ID: <58e41b9c-aa87-4885-befc-d45cacd8f149@intel.com>
Date: Tue, 25 Mar 2025 13:41:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_start?=
 =?UTF-8?Q?ing_with_=5B1/2=5D_drm/xe=3A_Remove_extra_spaces_in_xe=5Fvm=2Ec_?=
 =?UTF-8?B?KHJldjIp?=
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20250320211519.632432-1-dev@lankhorst.se>
 <174289544214.218.14501066439435038545@e6b6f09ec485>
 <c010cb9d-cfed-46fa-a232-7ce8768f3f4d@lankhorst.se>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <c010cb9d-cfed-46fa-a232-7ce8768f3f4d@lankhorst.se>
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

On 25/03/2025 10:41, Maarten Lankhorst wrote:
> Cc: Matthew Auld
> 
> Hey,
> 
> For peer-to-peer DMA-BUF, it can be beneficial to allow mapping memory as uncached.
> Initially I tried copying the caching on same-driver import from the original BO.
> 
> Thomas suggested that since memory access from discrete is always coherent, the
> check in xe_vm.c can be simplified from XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE)
> to XE_IOCTL_DBG(xe, !ID_DGFX(xe) && coh_mode == XE_COH_NONE)
> 
> This causes below failures.
> 
> Should I continue with the original patch, or change the testcase as well?:

Yeah, I think we can go ahead and just tweak the testcase.

> 
> Kind Regards,
> ~Maarten
> 
> 
> On 2025-03-25 10:37, Patchwork wrote:
>> *Patch Details*
>> *Series:*	series starting with [1/2] drm/xe: Remove extra spaces in xe_vm.c (rev2)
>> *URL:*	https://patchwork.freedesktop.org/series/146562/ <https://patchwork.freedesktop.org/series/146562/>
>> *State:*	failure
>> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/index.html>
>>
>>
>>    CI Bug Log - changes from xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056_BAT -> xe-pw-146562v2_BAT
>>
>>
>>      Summary
>>
>> *FAILURE*
>>
>> Serious unknown changes coming with xe-pw-146562v2_BAT absolutely need to be
>> verified manually.
>>
>> If you think the reported changes have nothing to do with the changes
>> introduced in xe-pw-146562v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>> to document this new failure mode, which will reduce false positives in CI.
>>
>>
>>      Participating hosts (10 -> 9)
>>
>> Missing (1): bat-adlp-vm
>>
>>
>>      Possible new issues
>>
>> Here are the unknown changes that may have been introduced in xe-pw-146562v2_BAT:
>>
>>
>>        IGT changes
>>
>>
>>          Possible regressions
>>
>>    * igt@xe_pat@prime-external-import-coh:
>>        o bat-bmg-2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-bmg-2/igt@xe_pat@prime-external-import-coh.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-bmg-2/igt@xe_pat@prime-external-import-coh.html>
>>        o bat-bmg-1: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-bmg-1/igt@xe_pat@prime-external-import-coh.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-bmg-1/igt@xe_pat@prime-external-import-coh.html>
>>        o bat-dg2-oem2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html>
>>        o bat-atsm-2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html>
>>        o bat-pvc-2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html>

