Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81A0C282EC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Mar 2025 15:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECB410E429;
	Mon, 17 Mar 2025 15:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TlwQiRNF";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1F710E429
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Mar 2025 15:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f1aW78Ahfhe8ar1oBJlfIWss6eS+1u4ltd33nX9ZmVs=; b=TlwQiRNFXV+9h2/OD5tiYkZsqn
 4pydE3q9Ers9QaYL39xK8XctKqKogcgr5Jhiv9RAl8wSuvMDnrrQOaHyPh6BUhw8xtEcry40rylMK
 opcrA0OJgig6LiUHCP2/vcJB/H9r2C4YiTI1iUNnGovQlcLABeA1oaqsO1MikuAi436zxGMZN9ODY
 S/zWGReN70Y5EuhwQ1DdMHg/yu63cGSgXp2OmhaFBdlYB2MjbPScXA4WJZMyo8PR0vXtb4ypvJiKt
 yjPgIlB2/f4xMzDFKwHwbOVpKx9cSXH4zLUcpg6OxbjVYKeFFN8PO2yGkYFviuM2gCXr87TGHrT5O
 VfqJlyow==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tuCLM-002Hpd-K3; Mon, 17 Mar 2025 16:25:32 +0100
Message-ID: <7f9ddeac-c8b8-4a62-b723-8eccb3f87848@igalia.com>
Date: Mon, 17 Mar 2025 15:25:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Flush delayed frees and retry on user object
 allocation failure
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250314145750.34362-1-tvrtko.ursulin@igalia.com>
 <471650d18746045024220697f5858af141662711.camel@linux.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <471650d18746045024220697f5858af141662711.camel@linux.intel.com>
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


On 17/03/2025 13:02, Thomas Hellström wrote:
> Hi, Tvrtko,
> 
> On Fri, 2025-03-14 at 14:57 +0000, Tvrtko Ursulin wrote:
>> If userspace workload is operating near the limit of available memory
>> and
>> it moves from one large working set to another, in other words free
>> some
>> large buffers and immediately allocate some new ones, the TTM
>> eviction
>> attempt during new resource allocation may not be effective due the
>> combination of relying on trylock and the fact released buffer might
>> have
>> ended on the delayed release path.
>>
>>  From userspace point of view this reflects as sporadic
>> VK_ERROR_OUT_OF_DEVICE_MEMORY ie. sometimes the application will
>> work,
>> sometimes will fail, even if it does exactly the same thing on an
>> otherwise idle system.
>>
>> Good examples are two tests from the VK CTS suite:
>>
>>   - dEQP-VK.pipeline.monolithic.render_to_image.core.*
>>   - dEQP-VK.memory.allocation.random*
>>
>> To improve this we can flush the TTM delayed object free workqueue
>> and
>> retry when encountering ENOMEM, which so far looks like a significant
>> improvement in mean-time-to-failure.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 22 +++++++++++++++++++---
>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 64f9c936eea0..53f45c766e59 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -1900,9 +1900,25 @@ struct xe_bo *xe_bo_create_user(struct
>> xe_device *xe, struct xe_tile *tile,
>>   				u16 cpu_caching,
>>   				u32 flags)
>>   {
>> -	struct xe_bo *bo = __xe_bo_create_locked(xe, tile, vm, size,
>> 0, ~0ULL,
>> -						 cpu_caching,
>> ttm_bo_type_device,
>> -						 flags |
>> XE_BO_FLAG_USER, 0);
>> +	unsigned int retry = 3;
>> +	struct xe_bo *bo;
>> +
>> +	while (retry--) {
>> +		bo = __xe_bo_create_locked(xe, tile, vm, size, 0,
>> ~0ULL,
>> +					   cpu_caching,
>> ttm_bo_type_device,
>> +					   flags | XE_BO_FLAG_USER,
>> 0);
>> +		if (!IS_ERR(bo) || PTR_ERR(bo) != -ENOMEM)
>> +			break;
>> +
>> +		/*
>> +		 * TTM eviction may sporadically fail due reliance
>> on trylock
>> +		 * and delayed ttm_bo deletion causing trylock to
>> fail. Work
>> +		 * around it by retrying after currently pending
>> delayed
>> +		 * releases have been processed.
>> +		 */
>> +		flush_workqueue(xe->ttm.wq);
>> +	}
> 
> We should use xe_vm_validate_should_retry() for this. (I think actually
> I saw a patch for that floating around somewhere). IIRC the bos are
> lockable also when in the delayed object free workqueue?

They appear mostly lockable while delayed delete is pending, apart 
during the window when put on the queue, and while delayed delete is 
actually executing ttm_bo_cleanup_memtype_use() but before it managed to 
report freeing up of space. I think the sporadic -ENOMEM is when bo 
creation races with one of those two windows.

But I see now this landed very recently:

commit 1d724a2f1b2c3f0cba4975784a808482e0631adf
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Mar 5 17:26:26 2025 -0800

     drm/xe: Retry BO allocation

And I was testing before that commit.

> So could you try with that instead? If you think that doesn't help, we
> should perhaps consider also flushing the we ttm wq from within that
> function instead.

So I am pretty sure 1d724a2f1b2c3f0cba4975784a808482e0631adf will work 
around the issue but will double check just in case and report back.

Whether or not to put a flush inside xe_vm_validate_should_retry() feels 
a bit moot at the moment given how weak the implementation of the former 
is. Only if replacing the mdelay(20) with the flush would be enough for 
all use cases. If it wouldn't then having both mdelay(20), in 
combination with its up to 1 second retry limit, and a flush does not 
appear to gain much. Neither in latency or robustness. Only if one would 
entertain the idea a single flush taking more than a second in some 
ultra pessimistic scenario.

Regards,

Tvrtko

> 
>> +
>>   	if (!IS_ERR(bo))
>>   		xe_bo_unlock_vm_held(bo);
>>   
> 

