Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4AEC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 16:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA75710E0E8;
	Wed, 20 Dec 2023 16:17:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459E910E0E8
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703089073; x=1734625073;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Cx+3SOiMlszIe9vsKnWWlSRO9ylL/ViuuFWknQwDtMA=;
 b=iFwQdvE3Q52zuTX+KWmDHnXdeW63Qzx+tXn5fBCjqGAq4kwhKZqPrXRq
 pIkt3ulc+Zpq1PJjTfpgJTjN6pgx8/KqsnMsHwRpHPbXzvm0SwzFS5APF
 dBUEMBhDoWy0WyVNX9QDU4vTZIYjv1dZzCtDowE5XaVk2XR9j88pV+tR6
 iLXfvUwFc6gszapWIVO6M8vIclIT+xnbTPw9xNs0SXs77J8WXKsG0usyL
 ID6uJeXkJBCCUxcmpkZ7f7s1WUhmjjXyqLs5mWiWRfpKl8j7A1YCkqog3
 djNYV8Eo2doYHQR+HbilQiAT2/ikAg8niQl5i/TnWzMTjcqbsWpOxDm6+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="2664300"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="2664300"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 08:17:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="726126984"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="726126984"
Received: from sbint17x-mobl.gar.corp.intel.com (HELO [10.249.254.75])
 ([10.249.254.75])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 08:17:51 -0800
Message-ID: <a3ec9850-19eb-c99d-eafa-ad7eda8cb796@linux.intel.com>
Date: Wed, 20 Dec 2023 17:17:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/xe/vm: Fix an error path
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20231220144214.2077-1-thomas.hellstrom@linux.intel.com>
 <xha45ldvurbfzou45zdtcygtczipw3dfw3jkokqx3oxfvrk7iu@4kswrmq6qrx2>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <xha45ldvurbfzou45zdtcygtczipw3dfw3jkokqx3oxfvrk7iu@4kswrmq6qrx2>
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/20/23 17:13, Lucas De Marchi wrote:
> On Wed, Dec 20, 2023 at 03:42:14PM +0100, Thomas Hellström wrote:
>> If using the VM_BIND_OP_UNMAP_ALL without any bound vmas for the
>> vm, we will end up dereferencin an uninitialized variable and leak a
>
> dereferencing
>
>> bo lock. Fix this.
>>
>> Reported-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>> Closes: 
>> https://lore.kernel.org/intel-xe/jrwua7ckbiozfcaodx4gg2h4taiuxs53j5zlpf3qzvyhyiyl2d@pbs3plurokrj/
>> Suggested-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>> Fixes: 9f232f4ae249 ("drm/xe: Port Xe to GPUVA")
>>
>
> ^ this newline needs to be removed so `git log --format="%(trailers)"'
> shows everything, not only your s-o-b.
Will fix these.
>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
>> 1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 1ca917b8315c..127842656a23 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2063,9 +2063,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, 
>> struct xe_bo *bo,
>>         if (err)
>>             return ERR_PTR(err);
>>
>> -        vm_bo = drm_gpuvm_bo_find(&vm->gpuvm, obj);
>> -        if (!vm_bo)
>> -            break;
>> +        vm_bo = drm_gpuvm_bo_obtain(&vm->gpuvm, obj);
>
> if the issue with that we don't have any bound vmas, why are we going to
> create a new one just to be released?

The expected outcome of this operation, AFAICT is, rather than to error, 
to create  an ops with an empty list of operations, so we could in 
theory kmalloc ops and just initialize its list. However that would be 
fragile and second-guessing what gpuvm does internally, so I opted for 
this solution instead.

/Thomas



>
> Lucas De Marchi
>
>> +        if (IS_ERR(vm_bo)) {
>> +            xe_bo_unlock(bo);
>> +            return ERR_CAST(vm_bo);
>> +        }
>>
>>         ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
>>         drm_gpuvm_bo_put(vm_bo);
>> -- 
>> 2.42.0
>>
