Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDF7C87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 09:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1160410E73D;
	Thu, 31 Jul 2025 09:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TppFAEU6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAD310E73D
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 09:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753952572; x=1785488572;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tZ8o2Bj4yaEWgGcPj/VUxG+reLNJz6trABnet/XRoIw=;
 b=TppFAEU6VcNa23lLdGQ4QOuWqmvjKo7Whmcy26RQ7xbXsrwJBwUmhQjs
 kkB9i7+ywuHwU+A+MPcN+4orRU4j3/HXNa8R484a6kmcD9s7R3Gqy80WL
 8B9IsrDOMEh+pCbaAgaV+d0pnzmvOyNt/LoP8f3ohj3yYmwzhL5eWXt17
 V6uHTtvyo1fDhh4YBzgl5h60uUVfsfhVE0zpsHunPQJeRpHwWuNg5X9/H
 r9oc2nGF24QlxsoPi47tza53jgsK6GpOPYZJq/uUpaFFyEHAjBHVu8Go5
 IPBMeLB9R/PymIB6e49TMTxBFX3hqBEt4uh/NhYojkud44/J9FycyVpMN Q==;
X-CSE-ConnectionGUID: JTbKi1n/QvKrCkoJTOivcQ==
X-CSE-MsgGUID: n1r7kU4zQjuqzMIg0JVykA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="43873949"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="43873949"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 02:02:52 -0700
X-CSE-ConnectionGUID: 0ZYejaqOQGu6Jx7Z1+7oyw==
X-CSE-MsgGUID: ACDiSOlaQKyfzavsNbAVag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="162489307"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.245.250])
 ([10.245.245.250])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 02:02:50 -0700
Message-ID: <9ee7071f-5d88-4b0e-89b4-b50792fa42de@intel.com>
Date: Thu, 31 Jul 2025 10:02:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/migrate: prevent infinite recursion
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
References: <20250730143335.174373-5-matthew.auld@intel.com>
 <20250730143335.174373-6-matthew.auld@intel.com>
 <8947a74a8e0d73a50e29c20b5d6093d22e93d620.camel@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <8947a74a8e0d73a50e29c20b5d6093d22e93d620.camel@intel.com>
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

On 30/07/2025 19:11, Summers, Stuart wrote:
> On Wed, 2025-07-30 at 15:33 +0100, Matthew Auld wrote:
>> If the buf + offset is not aligned to XE_CAHELINE_BYTES we fallback
>> to
>> using a bounce buffer. However the bounce buffer here is allocated on
>> the stack, and the only alignment requirement here is that it's
>> naturally aligned to u8, and not XE_CACHELINE_BYTES. If the bounce
>> buffer is also misaligned we then recurse back into the function
>> again,
>> however the new bounce buffer might also not be aligned, and might
>> never
>> be until we eventually blow through the stack, as we keep recursing.
>>
>> Instead of using the stack use kmalloc, which should respect the
>> power-of-two alignment request here. Fixes a kernel panic when
> 
> Should we add a build bug on (or similar) to guarantee that the power-
> of-2 stays here? My understanding is this alignment isn't guaranteed
> otherwise. Of course the chance of the cacheline being a non-power-of-2
> seems low...

Agreed, will add.

> 
>> triggering this path through eudebug.
>>
>> Fixes: 270172f64b11 ("drm/xe: Update xe_ttm_access_memory to use GPU
>> for non-visible access")
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 31 +++++++++++++++++++------------
>>   1 file changed, 19 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>> b/drivers/gpu/drm/xe/xe_migrate.c
>> index 3a276e2348a2..b6bdc9bd32b0 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -1987,15 +1987,21 @@ int xe_migrate_access_memory(struct
>> xe_migrate *m, struct xe_bo *bo,
>>          if (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
>>              !IS_ALIGNED((unsigned long)buf + offset,
>> XE_CACHELINE_BYTES)) {
>>                  int buf_offset = 0;
>> +               void *bounce;
>> +               int err;
>> +
>> +               bounce = kmalloc(XE_CACHELINE_BYTES, GFP_KERNEL);
>> +               if (!bounce)
>> +                       return -EINVAL;
> 
> ENOMEM?

Oops. Thanks.

> 
> Thanks,
> Stuart
> 
>> +
>> +               xe_assert(xe, IS_ALIGNED((unsigned long)bounce,
>> +                                        XE_CACHELINE_BYTES));
>>   
>>                  /*
>>                   * Less than ideal for large unaligned access but
>> this should be
>>                   * fairly rare, can fixup if this becomes common.
>>                   */
>>                  do {
>> -                       u8 bounce[XE_CACHELINE_BYTES];
>> -                       void *ptr = (void *)bounce;
>> -                       int err;
>>                          int copy_bytes = min_t(int, bytes_left,
>>                                                 XE_CACHELINE_BYTES -
>>                                                 (offset &
>> XE_CACHELINE_MASK));
>> @@ -2004,22 +2010,22 @@ int xe_migrate_access_memory(struct
>> xe_migrate *m, struct xe_bo *bo,
>>                          err = xe_migrate_access_memory(m, bo,
>>                                                         offset &
>>                                                        
>> ~XE_CACHELINE_MASK,
>> -                                                      (void *)ptr,
>> -
>> sizeof(bounce), 0);
>> +                                                      bounce,
>> +
>> XE_CACHELINE_BYTES, 0);
>>                          if (err)
>> -                               return err;
>> +                               break;
>>   
>>                          if (write) {
>> -                               memcpy(ptr + ptr_offset, buf +
>> buf_offset, copy_bytes);
>> +                               memcpy(bounce + ptr_offset, buf +
>> buf_offset, copy_bytes);
>>   
>>                                  err = xe_migrate_access_memory(m, bo,
>>                                                                 offset
>> & ~XE_CACHELINE_MASK,
>> -                                                              (void
>> *)ptr,
>> -
>> sizeof(bounce), write);
>> +
>> bounce,
>> +
>> XE_CACHELINE_BYTES, write);
>>                                  if (err)
>> -                                       return err;
>> +                                       break;
>>                          } else {
>> -                               memcpy(buf + buf_offset, ptr +
>> ptr_offset,
>> +                               memcpy(buf + buf_offset, bounce +
>> ptr_offset,
>>                                         copy_bytes);
>>                          }
>>   
>> @@ -2028,7 +2034,8 @@ int xe_migrate_access_memory(struct xe_migrate
>> *m, struct xe_bo *bo,
>>                          offset += copy_bytes;
>>                  } while (bytes_left);
>>   
>> -               return 0;
>> +               kfree(bounce);
>> +               return err;
>>          }
>>   
>>          dma_addr = xe_migrate_dma_map(xe, buf, len + page_offset,
>> write);
> 

