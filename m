Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7EBE7716C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 14:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD67110EE93;
	Thu,  5 Dec 2024 14:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPOvqlKr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D34810EE93
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 14:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733409306; x=1764945306;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1swxaMB0dApRQOxK2DV7xjzGON9H487xZSTSDeaX4AY=;
 b=RPOvqlKr18qV6RjscaAEf5BpwdEcZ8PSE2I1dbJ+pVe/wVRDz3i7ggib
 yJMnIVpLZH59GC0DaboXlUUG5pAmezPv+wf8S5IawIy/A5DwF970NudXC
 pVY0Q/eHS8/aXqueKvlhNeCOI6gRn5RKw139YVTzb6zCmTFJ6fb7CZwoG
 jvCgMqkIBHMHXeOxyr08hoLitvA2VH0TEGg7ae8Ted5IVNg4fywb/9maE
 fkiIIpTt/JIcNbwY7umHckMbjHVQwQ5XTxQmI5EM0gcCrXVtVhB3TyeyA
 uGRQHnnhfcxKbHuCALlE/VrYMk1c3kMhJzLWgFXhmHcWsZeuL3jZ7ZjES w==;
X-CSE-ConnectionGUID: RUpX4R/VSPeDgKoBXoEpkA==
X-CSE-MsgGUID: i+OsH+LwS3KAgTDC2TMIuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="21309735"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="21309735"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 06:35:06 -0800
X-CSE-ConnectionGUID: /2mAvWT5QrSSi+cJ21AVoQ==
X-CSE-MsgGUID: VimTWzhaSSa7hvepJ208Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="94304947"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.163.217])
 ([10.245.163.217])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 06:35:04 -0800
Message-ID: <46df595d-4b94-4f5d-8fde-2854fb70295f@linux.intel.com>
Date: Thu, 5 Dec 2024 15:35:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/tests: Wait for clear fence operation to complete
To: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20241205114702.1963303-1-nirmoy.das@intel.com>
 <01abf9d9-f1c4-4ac4-a69a-c9f1ae36bd4e@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <01abf9d9-f1c4-4ac4-a69a-c9f1ae36bd4e@intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 12/5/2024 12:49 PM, Matthew Auld wrote:
> On 05/12/2024 11:47, Nirmoy Das wrote:
>> Ensure the clear operation completes before proceeding, as the clear
>> fence is not attached to the BO's dma-resv object.
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>
> In theory it is all single timeline underneath, so the later copy job would anyway happen after the clear, and we should wait for that. So hopefully in practice this is not issue.


I haven't seen any issue caused by this yet but found it while looking into the IOMMU+CAT error issue.

>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>


Thanks,

Nirmoy

>
>> ---
>>   drivers/gpu/drm/xe/tests/xe_bo.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
>> index 3e0ae40ebbd2..c9ec7a313c6b 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>> @@ -49,6 +49,13 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
>>               KUNIT_FAIL(test, "Failed to submit bo clear.\n");
>>               return PTR_ERR(fence);
>>           }
>> +
>> +        if (dma_fence_wait_timeout(fence, false, 5 * HZ) <= 0) {
>> +            dma_fence_put(fence);
>> +            KUNIT_FAIL(test, "Timeout while clearing bo.\n");
>> +            return  -ETIME;
>> +        }
>> +
>>           dma_fence_put(fence);
>>       }
>>   
>
