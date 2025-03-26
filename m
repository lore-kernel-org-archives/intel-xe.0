Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D22FC36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 17:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2CE10E766;
	Wed, 26 Mar 2025 17:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYpi/Dr3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D254310E766
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 17:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743011492; x=1774547492;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=aB5rUTb2iCJHR0K99ZMq8oaRrgQp/lMzhMKN0ji1YI0=;
 b=JYpi/Dr3Mr93HsPcJVfJZebpOr4ctuGylMHVMhr1nVOdjehCHut60iBR
 DqdQfQTVZxZiont41r7CdYkKW3MIn0iLzE3u+fOvaKGPdH5UYlHEPLAjZ
 2UoX7js/hFkZQqTm0vJlIPrNScGTkW6g4Llvl2GANWZpJuszCsw/vfzSS
 GD8WRRbq2SVb0mZDv6h/dPzO0ocq3OTiCeDoUsRqtqwugc1VwYRs9MrlZ
 3N8gMmVWMNTFCzzoJ0mCbACT6WHBY2v9JJnmuOT+oC2iQdl++wqRk7PSJ
 h+MXyryuzVNQKQzYWf9AKvi671jwuR6PnEvUCQnj9hFZw/38Xl59mb2Qa A==;
X-CSE-ConnectionGUID: uoz/oNnPThu1lE1AfHsBxw==
X-CSE-MsgGUID: E9PRqDU0QhqzhD/i3KAgbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43471655"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="43471655"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 10:51:31 -0700
X-CSE-ConnectionGUID: NrFvc9pJR5izkiGytwZe4g==
X-CSE-MsgGUID: 6WJpBD9fRXiBeoA3j9LGfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="124591227"
Received: from ettammin-desk.ger.corp.intel.com (HELO [10.245.245.12])
 ([10.245.245.12])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 10:51:30 -0700
Message-ID: <f1efe4a4-0f50-43b5-b372-0cce561a8fd2@intel.com>
Date: Wed, 26 Mar 2025 17:51:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_start?=
 =?UTF-8?Q?ing_with_=5B1/2=5D_drm/xe=3A_Remove_extra_spaces_in_xe=5Fvm=2Ec_?=
 =?UTF-8?B?KHJldjIp?=
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
References: <20250320211519.632432-1-dev@lankhorst.se>
 <174289544214.218.14501066439435038545@e6b6f09ec485>
 <c010cb9d-cfed-46fa-a232-7ce8768f3f4d@lankhorst.se>
 <99ca7aa9bdfd797ad52b43b770136a0dbbcda854.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <99ca7aa9bdfd797ad52b43b770136a0dbbcda854.camel@linux.intel.com>
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

On 25/03/2025 19:05, Thomas Hellström wrote:
> Hi,
> 
> On Tue, 2025-03-25 at 11:41 +0100, Maarten Lankhorst wrote:
>> Cc: Matthew Auld
>>
>> Hey,
>>
>> For peer-to-peer DMA-BUF, it can be beneficial to allow mapping
>> memory as uncached.
>> Initially I tried copying the caching on same-driver import from the
>> original BO.
>>
>> Thomas suggested that since memory access from discrete is always
>> coherent, the
>> check in xe_vm.c can be simplified from XE_IOCTL_DBG(xe, coh_mode ==
>> XE_COH_NONE)
>> to XE_IOCTL_DBG(xe, !ID_DGFX(xe) && coh_mode == XE_COH_NONE)
>>
>> This causes below failures.
>>
>> Should I continue with the original patch, or change the testcase as
>> well?
> 
> This is a tricky one.
> But first, why aren't those tests failing similarly with the original
> patch?
> 
> Also, If we were to use system dma-buf with the exported bo WB, then
> the app would fail anyway?
> 
> Perhaps we should use a separate test for p2p dma-bufs (attach-
>> peer2peer), but then again UMD wouldn't know whether it's peer2peer or
> not.
> 
> I think if we need to access cross-device bos for metadata, we need to
> check with Sima / Dave first. I don't think that's something that is
> encouraged, really.

If this is a concern, is it possible that we rather update the PAT table 
encoding on dgpu to reflect that everything is really 1way on dgpu i.e 
coh_none is not even a thing in the first place? Then we don't care 
about XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE)? But maybe that's too bold.

> 
> /Thomas
> 
> 
> 
> 
> 
> 
>>
>> Kind Regards,
>> ~Maarten
>>
>>
>> On 2025-03-25 10:37, Patchwork wrote:
>>> *Patch Details*
>>> *Series:*	series starting with [1/2] drm/xe: Remove extra
>>> spaces in xe_vm.c (rev2)
>>> *URL:*	
>>> https://patchwork.freedesktop.org/series/146562/ <https://patchwork
>>> .freedesktop.org/series/146562/>
>>> *State:*	failure
>>> *Details:*	
>>> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/index.html
>>>   <
>>> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/index.html
>>>>
>>>
>>>
>>>    CI Bug Log - changes from xe-2844-
>>> 9a42bdcde0f77b2c1e947e283cc3b267b1ce2056_BAT -> xe-pw-146562v2_BAT
>>>
>>>
>>>      Summary
>>>
>>> *FAILURE*
>>>
>>> Serious unknown changes coming with xe-pw-146562v2_BAT absolutely
>>> need to be
>>> verified manually.
>>>
>>> If you think the reported changes have nothing to do with the
>>> changes
>>> introduced in xe-pw-146562v2_BAT, please notify your bug team
>>> (I915-ci-infra@lists.freedesktop.org) to allow them
>>> to document this new failure mode, which will reduce false
>>> positives in CI.
>>>
>>>
>>>      Participating hosts (10 -> 9)
>>>
>>> Missing (1): bat-adlp-vm
>>>
>>>
>>>      Possible new issues
>>>
>>> Here are the unknown changes that may have been introduced in xe-
>>> pw-146562v2_BAT:
>>>
>>>
>>>        IGT changes
>>>
>>>
>>>          Possible regressions
>>>
>>>    * igt@xe_pat@prime-external-import-coh:
>>>        o bat-bmg-2: PASS
>>> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c
>>> 1e947e283cc3b267b1ce2056/bat-bmg-2/igt@xe
>>> _pat@prime-external-import-coh.html> -> FAIL
>>> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-bmg-2
>>> /igt@xe_pat@prime-external-import-coh.html>
>>>        o bat-bmg-1: PASS
>>> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c
>>> 1e947e283cc3b267b1ce2056/bat-bmg-1/igt@xe
>>> _pat@prime-external-import-coh.html> -> FAIL
>>> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-bmg-1
>>> /igt@xe_pat@prime-external-import-coh.html>
>>>        o bat-dg2-oem2: PASS
>>> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c
>>> 1e947e283cc3b267b1ce2056/bat-dg2-oem2/igt@xe
>>> _pat@prime-external-import-coh.html> -> FAIL
>>> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-dg2-o
>>> em2/igt@xe_pat@prime-external-import-coh.html>
>>>        o bat-atsm-2: PASS
>>> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c
>>> 1e947e283cc3b267b1ce2056/bat-atsm-2/igt@xe
>>> _pat@prime-external-import-coh.html> -> FAIL
>>> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-atsm
>>> -2/igt@xe_pat@prime-external-import-coh.html>
>>>        o bat-pvc-2: PASS
>>> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c
>>> 1e947e283cc3b267b1ce2056/bat-pvc-2/igt@xe
>>> _pat@prime-external-import-coh.html> -> FAIL
>>> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-pvc-2
>>> /igt@xe_pat@prime-external-import-coh.html>
> 

