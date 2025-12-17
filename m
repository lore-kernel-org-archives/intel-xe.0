Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091BFD6552F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 10:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3EC10EC31;
	Wed, 17 Dec 2025 10:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SlU3kFBn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602E110EC31
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 10:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765967475; x=1797503475;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=0P9GQ4HYqV+c3IdvgNKj7wuo6ZX9KicCBLWUNbK43eQ=;
 b=SlU3kFBnQpyCL4dgUF7Q9kzcUpEmIMf/wunEvp5AVzyEcmk/8aUDcv+O
 vX16ppMhdEy8WNJ6MpI/0777Qbf1PtYH6mGbfrj9X+u008vi1nF+Vm4Ve
 5Hc0tdWHTKjbtDk7qQTDKVXcdbN8w19RL7B5wkXOyDnHVmPn8k3tsDgGi
 SKsm719I0ecsWThBEArag+rgXv2eMSbDXqXt+cPXYSnnXNMrqNmgQxWMb
 Xn0QRT5RxZwongueXNnJ/O5AAUWOsjgZ19b3y2z+p8zzM+7229dRJ1jh3
 ckekujASoLrqPBOebjGX60KMr/vGSxwRBukeDnFW9qTirFxwC+tgXiZzp w==;
X-CSE-ConnectionGUID: YcnmKaXQQn2FfCNze4prGg==
X-CSE-MsgGUID: J67T1VKMSjeI7+GUky07SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71760523"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="71760523"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 02:31:15 -0800
X-CSE-ConnectionGUID: Drgjm3xMTFa03OlUHKYApw==
X-CSE-MsgGUID: 4mkREyt2QtaYmnQShdOgoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="198156392"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.182])
 ([10.245.245.182])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 02:31:14 -0800
Message-ID: <e14dc32f-3c4a-453e-b0fe-09da137e172c@intel.com>
Date: Wed, 17 Dec 2025 10:31:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix NULL pointer dereference in xe_exec_ioctl
From: Matthew Auld <matthew.auld@intel.com>
To: =?UTF-8?Q?Tapani_P=C3=A4lli?= <tapani.palli@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
References: <20251217061728.35768-1-tapani.palli@intel.com>
 <773d97c4-defc-422c-a3a9-c7769f367493@intel.com>
Content-Language: en-GB
In-Reply-To: <773d97c4-defc-422c-a3a9-c7769f367493@intel.com>
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

On 17/12/2025 10:27, Matthew Auld wrote:
> On 17/12/2025 06:17, Tapani Pälli wrote:
>> Helper function xe_sync_needs_wait expects sync->fence when accessing
>> flags, patch makes sure we call only when sync->fence exists.
>>
>> Fixes NULL pointer dereference seen with Vulkan workloads:
>>
>> [  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]
>>
>> Fixes: 4ac9048d0501 ("drm/xe: Wait on in-syncs when swicthing to dma- 
>> fence mode")
>> Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>> index 730a5c9c2637..ea368f02cb9f 100644
>> --- a/drivers/gpu/drm/xe/xe_exec.c
>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>> @@ -184,7 +184,8 @@ int xe_exec_ioctl(struct drm_device *dev, void 
>> *data, struct drm_file *file)
>>           if (xe_sync_is_ufence(&syncs[num_syncs]))
>>               num_ufence++;
>> -        if (!num_in_sync && xe_sync_needs_wait(&syncs[num_syncs]))
>> +        if (!num_in_sync && syncs[num_syncs].fence &&
>> +            xe_sync_needs_wait(&syncs[num_syncs]))
> 
> In xe_sync_entry_parse() it looks like it will always populate the fence 
> for the !signal case, otherwise throwing an error if that is not 
> possible. And xe_sync_needs_wait() will only touch the fence if it's the 
> signal case? So it seems like this should not be possible?

Sorry meant to type:

s/touch the fence if it's the signal/touch the fence if it's the !signal/

> 
>>               num_in_sync++;
>>       }
> 

