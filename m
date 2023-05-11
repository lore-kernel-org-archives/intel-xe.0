Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DE3C7EE22
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 07:39:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C339810E1AA;
	Thu, 11 May 2023 07:39:14 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E650410E1AF
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 07:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683790753; x=1715326753;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tEi6lgu04CHW+Rskw72K/Cl0CsK4ZvpXYfRHyBOBn7Q=;
 b=M1hEguM70vn9uZ4gGVvcnhQMic81KVAAUE7o2t+sXNW3TrBfWsVfFATZ
 Ej17BVlXdutqB1KXXX6fWUNmGWe7dEP0IbOwPAsQIdrXtKIsACui4YVNE
 vFy2Tzx4DicrNrvnF4/0V90/xSjcXCEQA6jg8nQ586W457H9DGc+bfuRY
 EQjdxUXMUf+qyS9w65VKVzloWDxdaApk8qsWdumycE7J4rEwoxwBw1IQg
 773BZbPIoat4KdO2CwfESmCLlpWyicpZT1Wx/jxC8uhBpWXD+jdAlJ6pW
 8UOvGmc1qk5KEiv6OImzaBW/PPpkDl2LAsWjWlb+qmy1rt/H4I69IcwBC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="416017580"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="416017580"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 00:39:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="843837241"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="843837241"
Received: from cuphoff-mobl.ger.corp.intel.com (HELO [10.249.254.120])
 ([10.249.254.120])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 00:39:11 -0700
Message-ID: <c8d813b2-0cb5-7c90-194e-9b09151a1759@linux.intel.com>
Date: Thu, 11 May 2023 09:39:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-17-matthew.brost@intel.com>
 <87710316-f6d8-5fa4-e320-7c2a1969ca6c@linux.intel.com>
 <ZFxV7ko6wKRvFF3W@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZFxV7ko6wKRvFF3W@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 16/31] drm/xe: Port Xe to GPUVA
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/11/23 04:41, Matthew Brost wrote:
> On Tue, May 09, 2023 at 03:52:24PM +0200, Thomas Hellström wrote:
>> Hi, Matthew,
>>
>> On 5/2/23 02:17, Matthew Brost wrote:
>>> Rather than open coding VM binds and VMA tracking, use the GPUVA
>>> library. GPUVA provides a common infrastructure for VM binds to use mmap
>>> / munmap semantics and support for VK sparse bindings.
>>>
>>> The concepts are:
>>>
>>> 1) xe_vm inherits from drm_gpuva_manager
>>> 2) xe_vma inherits from drm_gpuva
>>> 3) xe_vma_op inherits from drm_gpuva_op
>>> 4) VM bind operations (MAP, UNMAP, PREFETCH, UNMAP_ALL) call into the
>>> GPUVA code to generate an VMA operations list which is parsed, commited,
>>> and executed.
>>>
>>> v2 (CI): Add break after default in case statement.
>>> v3: Rebase
>>> v4: Fix some error handling
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Before embarking on a second review of this code it would really be
>> beneficial if you could address some comments from the first review. In
>> particular splitting this huge patch up if possible (and I also think that
>> removing the async worker *before* this patch if at all possible would
>> really ease the review both for me and potential upcoming reviewers).
>>
> My bad that I missed your comments on the list, yes I will address your
> comments in the respin, expect it by Mondayish.

NP, basically this was a comment saying I'd rather wait for a respin 
before tackling this again :).

>
> Removing the async worker first doesn't make a ton of sense as GPUVA
> makes the error handling a lot easier plus that basically means a
> complete rewrite.

OK, yes I guess from a reviewer's point of view the other way around 
would be easier, but if you keep the ordering please split into separate 
patch series for GPUVA and async removal, because invasive changes in 
code that is later removed in the same series is typically not well 
received.

Thanks,

Thomas


>
> Matt
>
>> Thanks,
>>
>> Thomas
>>
>>
