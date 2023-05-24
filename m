Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE88C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 12:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D479610E0F5;
	Wed, 24 May 2023 12:40:26 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D039710E0F5
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 12:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684932025; x=1716468025;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aswQFkwk1wNED4OjcuwbRlI0NSFTcR9eHvzrRCmH1II=;
 b=htYO42m+Urm0JNTm4ig3gSDPTFcSVP+VoR9ueGhqEQMxP+zHdS2Twjvj
 db8cu5Vi/pnIdJSDQKpWvY7Ygn4pDcY3NrsL3mDkc/qmkH/QTN2zdGujM
 58mFIzMWqRPEdPGkQoOPvZa3Kymd9oXorgKpRnPgQC5oDSGZch7rBq3c9
 acInA3KVkFHp3HJ2rinci5EmzskbOUtsu/P0AytfLB2ILMs493QoRPkm9
 Y2aE0gFBronBFpF/GfSjGgKxSHFYw9+ELgU8O5eKhm5gR1V8nJ++Cibcv
 SleGx4hXFNZ91dQxFykyp2v0W8LAVpn3z7wSZHdoDC82jWbpKDTVuQEqQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="353575091"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="353575091"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 05:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="737287511"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="737287511"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.39.193])
 ([10.249.39.193])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 05:40:05 -0700
Message-ID: <b4370476-3b11-c419-2859-34437ea0701f@linux.intel.com>
Date: Wed, 24 May 2023 14:40:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20230523202412.14671-1-nirmoy.das@intel.com>
 <ZG1Mm91KwwDrf8e2@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <ZG1Mm91KwwDrf8e2@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Do not unbind destroyed vmas
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

Hi Matt,

On 5/24/2023 1:30 AM, Matthew Brost wrote:
> On Tue, May 23, 2023 at 10:24:12PM +0200, Nirmoy Das wrote:
>> Fix a vma UAF when userspace calls unbind ioctl more
>> than once.
>>
> I see the problem, yea this is kinda an issue but will conflict with the
> GPUVA series where this is also fixed by removing the async worker.

Yes, the issue is that the async worker will access the freed vma. I did 
try to remove the

async_op for that vma from the pending list but I missed some fence 
signaling somewhere.


>
> Is this a problem from any UMDs? If it isn't I'd say defer this until
> the GPUVA series.


Not sure about UMD but I hit this while trying to implement madvise for 
VMAs where I would unbind a vma if it is set to DONTNEED.

 From my side this can wait.


Regards,

Nirmoy

>
> Matt
>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index a0306526b269..7a9f1ba432b8 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2769,7 +2769,7 @@ static struct xe_vma *vm_unbind_all_lookup_vmas(struct xe_vm *vm,
>>   	xe_bo_assert_held(bo);
>>   
>>   	list_for_each_entry(vma, &bo->vmas, bo_link) {
>> -		if (vma->vm != vm)
>> +		if (vma->vm != vm || vma->destroyed)
>>   			continue;
>>   
>>   		prep_vma_destroy(vm, vma);
>> -- 
>> 2.39.0
>>
