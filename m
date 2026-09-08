Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F028EC79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956A010EB16;
	Tue,  8 Sep 2026 10:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHx/gxlj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CF510EB16
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788863049; x=1820399049;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CnwoAjALtAK7fmj9/T6G5nMrCNod3dw2UtaaFsAkqyQ=;
 b=HHx/gxljtdzrhFY+ZCiaUqGJdF9c3kmTBatzKStKTzC9YgWfKcPuSSDy
 cvG+6QPSZRjypXqc0vhGgJO4dgTW75UCvKM4RhFVlo4NxZbrygQHG9ZY6
 GEqNSPWLK83T/AlLtSoBg6IzEfHpvSxZ5xxvREkjXKLdjXfN6qHTPVtS7
 yMtGl8JIKpe9TkKxtGudbn6oQ7p9Rs5TNuT7hiMRXy8olmiGyRGPn+4+k
 z+g2Prs7mu1b/YHivnXahDCBZ8cYhsgbivNRe8/cKxJ0QCJqPqyZpHuhg
 MYGYZ51nIPpABQG1dWCB+Khu3yZBlEEPatRweoEf7tyNvZ9nQxM+rYvjy w==;
X-CSE-ConnectionGUID: JWbBs9zTQOWWXUpHaFtcHw==
X-CSE-MsgGUID: vvJ9wS5BS9W3R9Impe85aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89278647"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89278647"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:24:09 -0700
X-CSE-ConnectionGUID: OelauuELTQKN7HR0EW3sIw==
X-CSE-MsgGUID: oIUd/UguSD2Vd+rWFpfyrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="269628918"
Received: from unknown (HELO [10.66.117.203]) ([10.66.117.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:24:08 -0700
Message-ID: <bca4af8a-7029-4cff-88fe-f1eeaf0b3885@Intel.com>
Date: Tue, 8 Sep 2026 15:54:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] drm/xe/memirq: Report errors using structured
 xe_log API
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-6-dnyaneshwar.bhadane@intel.com>
 <a478cbbe-abaa-4a3d-861a-8531b360300d@intel.com>
Content-Language: en-US
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>
Organization: intel
In-Reply-To: <a478cbbe-abaa-4a3d-861a-8531b360300d@intel.com>
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



On 26-Aug-26 3:39 PM, Mallesh, Koujalagi wrote:
> 
> On 20-08-2026 12:44 am, Dnyaneshwar Bhadane wrote:
>> Replace memirq_err() calls with xe_log_err() using the MEMIRQ
>> component tag for memory-based IRQ failures
>>
>> Signed-off-by: Dnyaneshwar Bhadane<dnyaneshwar.bhadane@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_memirq.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
>> index 9dfe965cb46e..45eae58d418f 100644
>> --- a/drivers/gpu/drm/xe/xe_memirq.c
>> +++ b/drivers/gpu/drm/xe/xe_memirq.c
>> @@ -15,6 +15,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_guc.h"
>>   #include "xe_hw_engine.h"
>> +#include "xe_log.h"
>>   #include "xe_memirq.h"
>>   #include "xe_tile_printk.h"
>>   
>> @@ -232,7 +233,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
>>   	return 0;
>>   
>>   out:
>> -	memirq_err(memirq, "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
>> +	xe_log_err(xe, MEMIRQ, err, "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
> Already logging errno, no need log again, drop ERR_PTR(err)
Yes sure thank you.>>   	return err;
>>   }
>>   
>> @@ -370,7 +371,7 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
>>   	return 0;
>>   
>>   failed:
>> -	memirq_err(memirq, "Failed to setup report pages in %s (%pe)\n",
>> +	xe_log_err(memirq_to_xe(memirq), MEMIRQ, err, "Failed to setup report pages in %s (%pe)\n",
>>   		   guc_name(guc), ERR_PTR(err));
> ditto
>>   	return err;
>>   }

