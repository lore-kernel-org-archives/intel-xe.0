Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B54ECD1284
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 06:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00087113958;
	Fri,  5 Apr 2024 06:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qgz+aXFO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B64113957
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 06:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712297671; x=1743833671;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=raspUBQnW3AOX//D7rW+iW+o85kJIqY6H8pDy2PfFJs=;
 b=Qgz+aXFO4s7Wwe7BtL/7isd5jopogdkbAcrCCz4+Hmx7FWPp35EEtS8H
 TR6IpbF83L/JlBYYrBOaV4EvEB6iE1P6UiThabdF8RF9Cey/KCypam/Or
 UNf1tOh6dDSUX6Ky07xHgTIIaLorbX0gIAJ8UYZoSnl9LcOFlfnE9dkcu
 FhoyxRDkDkMbbDZYZSWBpktG+IdHiL7hB8t5ncPUlRk9AVgDjCfIDbArG
 qzMGloYQrh/ufOTUbebUlSjUJUKy7fH6lhhBwktuvWY4BHfGk2v3s2aaw
 VXF9IKoNZiLVlimkq6yyhkR4EGxyvnhxmIxx/rD8k2fQTeMvdktJ07gKi w==;
X-CSE-ConnectionGUID: ZfaZstQmQY+Se+eFcM00Ag==
X-CSE-MsgGUID: /lMn9cZHTNexJHHHVFzbYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="33013770"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="33013770"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:14:31 -0700
X-CSE-ConnectionGUID: FSW5YwzKRzmTkoXSrI0ehA==
X-CSE-MsgGUID: ABbFGf9vRaqegcUISdAv6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="23732544"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 23:14:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 23:14:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 23:14:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 23:14:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAmTVWhj42M9hkGADlIRGpyKkYKq2fK7OT0O+NDq9KL9vEpDY142Putfp09DKUEM5CosgVso77EPEkmXZ7tVCCMl9InNlG7/TrbfimyFdNhtvKPophw5LAaxuCoNJ9tpeqfPovAYhD1iVtrcg+y0Ss3A+2TlxpJMpC7Dvd2+YIqi0j5pyENyxTDH92NEZq2smmom26Xn6L2e8arx/k7pb/Fhl3srMC2FmPDT1KkbcSBq+swiv+ayC6MxIR1apu2Fzbo1HDBKYf28IWgRYNY33/4a/ZdXD4UZhO2+mAgpOJ1tYXBYwvVNlNvtXFg85GIHTqws5fGgJS3LL9K/WvFgaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOZt34t9JXlutBO5hh/ZmUyOu1dqMdu5+NSQwJtphRo=;
 b=kqgQ8FL7RTprH2fHCxj57eoj7WVC43ALl0xyUxCtsqfmHDyRXBrRdaM0GxuABNDR5hT7LDafN3j9U1PRFCM99vaDQmFCaWgjdgv03e0J6OYN6WL2Q/tsEWjUzXtsKu/8XFBsVJdc7q944CSK9HlXcCjTe/zPI9keLwTpR3myYCoRnGJsGGtij+KjqULJSPjq/WehZwlV04H2/rirRpwtNORbsgGDJLKQqjA/imvRa0ssBGA+axxu9QHT5NcDou6vP2VATO/nzBHKJGsjYnm4NKIHe3uuuusVLC20SknQeYZbo+D7ZFGQaX4FAJlQl3sjCapuXOA65bWH0FoXOt5t1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW4PR11MB7126.namprd11.prod.outlook.com (2603:10b6:303:222::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Fri, 5 Apr
 2024 06:14:18 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 06:14:18 +0000
Message-ID: <06f34e7f-d3b5-47ce-b030-7f180bed6724@intel.com>
Date: Fri, 5 Apr 2024 11:44:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: Use hmm_range_fault to populate user pages
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Oak Zeng <oak.zeng@intel.com>
References: <20240404061631.4150858-1-himal.prasad.ghimiray@intel.com>
 <20240404061631.4150858-3-himal.prasad.ghimiray@intel.com>
 <Zg9PUhutYUXXm5+R@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Zg9PUhutYUXXm5+R@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::11) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MW4PR11MB7126:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XbDJzL2T2s8nyVdZz9+vp/FwG/24mMgYxdkDojZdhG655io4gdcnERFUTpVyYoNpV1f5YzntYwIgBkqSVTv5AfzoxT/P6KBB4LJMFf29+yHcvj60XWS6pxnrL6b5yCNUtcUFD+YI7AJJCH6NUS/SWVnREiMYSOa8yzUGh0Nedgczutr1aFTctu7WJqwBC09bZHOMN4qk9oSszF3gv1p9YYoRzDsp3dmQTjKdppDrFe8mAgxqy/61YqYGzLZJXXp5PLwLExE6Hsy5HXChkodbUr1pLR43kZdFCGlW/hJ4/L9V9FDZvPd9mqt5eu5/iR5hmc9DSbWhdczG+DWP0q6mu6BcYUgeem+kFFGRET9j4flHZ6b8Np4q3k8wGaaW2jZ8REfbZ0VJ9fuaGHJFYq2IGJSyNzoJKZG5o0LGb59FqDr+Zpe2OPKRzrWIMbYaQ3tiuxdDd/7Zk45wJCb/GyfGKYS0s+b+CWcWrZw7QNIMzcc4zgN1ZMgl89qNWQeTfHAsrfUXAfdAnw2tziuEOLwhvwpZGmWhcHVX0RAT0C90YKi6kOR5JGf5rckr2ggNwX9/K/WhqrB40dLPzNz4OOlbNEzHpcy0b9Hln5ME0E410qZj1Myhq4A5/KHnUIBh7yV2NRXUNQHU4niUjulW7KS5c/XPhxOl1dDRa3/BMXz2VMU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3dOQTdhVjF0bzNwL2JObFR4NU9SWkY4a1F1TktNaENrelA0WHJ2RVF5dzNR?=
 =?utf-8?B?em1lc25NRUlhanFLcFF2SUJ6UDl2Q0l4NG10eHZiU3BDekhkS1VxbndiejJv?=
 =?utf-8?B?M3EwMWpaK01vaGxQS1BFTXdWa2sxYXlaQXNycGgvYTJ4WmRuYnRYOGtpYkU0?=
 =?utf-8?B?WXRlYzM5R3pmWkZwamlOdGo1S0M5Nm5nTU1DLzVkZ2FOZHJRbUNIR1hFdEtX?=
 =?utf-8?B?R1pLTmpiTXRaOVZ6MG51L0EwUDV2bGVKa3ZHK1I5c0gveTdwMHVnblBlRmpN?=
 =?utf-8?B?U3hWTXg3aS9UWWh0MjdPc1MxR1lERk9sanFhbHhFOWdWQmVvcnZwVDlpYlMx?=
 =?utf-8?B?aXpJL2E1K0JweEo0WElGa2RQZkFiY05lL0o2QURJVUpVLzcwMzI0RGhKVTZ0?=
 =?utf-8?B?aHdXakNCMzhUVkR0Q2JFWm9COGtCRmhLYmZiTENtQlM2N3Zwck9kYkp4VlBn?=
 =?utf-8?B?WCs3UkptQXBJTkJtNjNlSWVkM3lVcTNXZ1RNVzcxWUNBSzlic1Azc0RQTFdv?=
 =?utf-8?B?dzVBY1loSGVwemZJZWFnVlhjdkQ3ZTBaMlA4TTVqUEE5VTh3Mm52Mlh6b1BO?=
 =?utf-8?B?ZlJ2NW0welZaRTN5UlQ1Z2IxVEF3clJCbFF4bnhtUDQxSGtuWnNidGtJU29Q?=
 =?utf-8?B?azByMlVoUmJQSWxnWDlWN2pXcGFWWlN4cXJkZmlKc3J4RzdvU3VJV1h6THlm?=
 =?utf-8?B?N1dObXY1Y05Eb2tMZFdlcEh0U2YrbzRoQ1hrQjBuVVZPWk1INi8rVVRVa0Rr?=
 =?utf-8?B?bDVndlk0SGxDbDBGdHJBNUdnN2VEYmxIeXAxOWNFMEY2bElGcSs0bEVFcS96?=
 =?utf-8?B?MUlBeVRURFg2ekE4aWJlV3A4MlFxL0tMdGo3ZnFkUk1sVzJOemNOV3dFQzlH?=
 =?utf-8?B?SFM2RTlmcUpCV0tCRmdxdlk5UnlBSGxoQ2ZnOEx3cC9UOVZjV3pGenlWMlha?=
 =?utf-8?B?b1FVK2F3aUZvRkdNUmYydWJKdkFEbDg0TlhLanB3K0FVdWFXRHIrb1hJbkJF?=
 =?utf-8?B?L1djRjVqY0JORmlMOFB5bkFiZkRaNW5JdzNZbUhEVCtBUnBZTVB5dGFjVklT?=
 =?utf-8?B?MW9Cb0N2WnZiQ0FBZ3FUc2hNNGpXNks1bzZvNll3RmZtM1dLSUVhNU1JVS9M?=
 =?utf-8?B?M3hQeHhRamp0ZzlwcWJicjZDejBsZE10UjRNWVpETnU1bGM1NGRWSjhNTkhY?=
 =?utf-8?B?L0JkbFJhOStDd0FndDJpNmhmZk5XZ3lpY2MwSWxYdzFTSlFENVl4WHg2OUxi?=
 =?utf-8?B?QnBPOHM2V2tNK2JLMEZVVFFuSHRTOFdHWjN5cVZTTm5YU2IwUkhUVVlLa2pR?=
 =?utf-8?B?aUp5aXIyV3dkNVpMTThDM2RjdVQ0ZEYxZWFBckcvY2ptbWI2b3R5ZStmNUlH?=
 =?utf-8?B?WnZveUx2SmVrRUhEd0xWZTA2Zkp2T1hYWUFlKzdZaWhXcFpNeU5XSFVvWHR5?=
 =?utf-8?B?S3YvR0owM0lZYVQ1Slc3S0dpY1ExeVd1MzJCQTVhQ0ZsWSthWVRzRlBIZ1F0?=
 =?utf-8?B?b25WQWRKRllFZ25CeVlaVDZpK1lqL0dZR0xCYjRwVkU5NHd0cldYNUxsZXVH?=
 =?utf-8?B?NmtqeFFHVFlDNUNZZTk3Y3JCdGhjLy93RVE3OFFIbWlwVWMrenRJdjJXQ084?=
 =?utf-8?B?VmkzWUpqWGc4M0NVb05SNnoxR0FWblNBTWdaV0U2M3AvTW9mQlQvVGl6dDdV?=
 =?utf-8?B?UG9hc0QzWVZWM2hOVmRYb2J1VkZhUEpuTGZQUzVlZ1g0ZXdkT0VQV1AvRmpK?=
 =?utf-8?B?Sy8xS2tlZXorcGpkY1paK3BoSGZiemJxcGtJVm9zRXpQQXJhYWdweU5UYW4w?=
 =?utf-8?B?Wm1iUVl1bE1uTGtsZnE5ay85SjBWRHZranpDb0pxbUlaa0xEN2tEcGh5UG1Z?=
 =?utf-8?B?REs1cjA1MUJTUnNxd0NNKzVEVmJqY3hpcmYyTzBKSkM2dmFEWlQzRnlBY25J?=
 =?utf-8?B?aFV2cUNId3VqTTlnTGtPRGZaaXVHcng2Wk1nNXVBaUxUaERndlNtZUREZG5y?=
 =?utf-8?B?N24rblNpaHNNS0w2ZEFHWXlUVzhpTGJ3OEY5aXJlZGJDQ2JPdmt2UUtETXpO?=
 =?utf-8?B?b1RoUk9MR0ZDOFF5ZU1VSVJCZ1NZQ0liRmpVcGZlcDdubWtKelBjUFpCbnYz?=
 =?utf-8?B?OVgwSEdaZmMyNVh5cFF5UW1JbzBGQkZWVFlXNk5UNWpTQ3JELzcvWm9hTlZH?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c765623-2d53-4c21-eef0-08dc5537a05d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 06:14:18.4764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hw8WanW5QsHTRHioSODs86QrN/QfQrHX+/OitA28RgNzGWZgTbRjjnEJIlaT1OzQxTiBhAaidZUGJAmup6X4cX4ANAB+RplfvgTfAFEpSfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7126
X-OriginatorOrg: intel.com
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


On 05-04-2024 06:39, Matthew Brost wrote:
> On Thu, Apr 04, 2024 at 11:46:31AM +0530, Himal Prasad Ghimiray wrote:
>> From: Oak Zeng <oak.zeng@intel.com>
>>
>> This is an effort to unify hmmptr (aka system allocator)
>> and userptr code. hmm_range_fault is used to populate
>> a virtual address range for both hmmptr and userptr,
>> instead of hmmptr using hmm_range_fault and userptr
>> using get_user_pages_fast.
>>
>> This also aligns with AMD gpu driver's behavior. In
>> long term, we plan to put some common helpers in this
>> area to drm layer so it can be re-used by different
>> vendors.
>>
>> -v1
>> use the function with parameter to confirm whether lock is
>> acquired by the caller or needs to be acquired in hmm_range_fault.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 118 +++----------------------------------
>>   1 file changed, 8 insertions(+), 110 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index f4bfb2705956..61448e9520b0 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -38,6 +38,7 @@
>>   #include "xe_sync.h"
>>   #include "xe_trace.h"
>>   #include "xe_wa.h"
>> +#include "xe_hmm.h"
>>   
>>   static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>>   {
>> @@ -65,113 +66,17 @@ int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
>>   
>>   int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>>   {
>> -	struct xe_userptr *userptr = &uvma->userptr;
>>   	struct xe_vma *vma = &uvma->vma;
>>   	struct xe_vm *vm = xe_vma_vm(vma);
>>   	struct xe_device *xe = vm->xe;
>> -	const unsigned long num_pages = xe_vma_size(vma) >> PAGE_SHIFT;
>> -	struct page **pages;
>> -	bool in_kthread = !current->mm;
>> -	unsigned long notifier_seq;
>> -	int pinned, ret, i;
>> -	bool read_only = xe_vma_read_only(vma);
>> +	int ret;
>>   
>>   	lockdep_assert_held(&vm->lock);
>>   	xe_assert(xe, xe_vma_is_userptr(vma));
>> -retry:
>> -	if (vma->gpuva.flags & XE_VMA_DESTROYED)
>> -		return 0;
>> -
>> -	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
>> -	if (notifier_seq == userptr->notifier_seq)
>> -		return 0;
>> -
>> -	pages = kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
>> -	if (!pages)
>> -		return -ENOMEM;
>> -
>> -	if (userptr->sg) {
>> -		dma_unmap_sgtable(xe->drm.dev,
>> -				  userptr->sg,
>> -				  read_only ? DMA_TO_DEVICE :
>> -				  DMA_BIDIRECTIONAL, 0);
>> -		sg_free_table(userptr->sg);
>> -		userptr->sg = NULL;
>> -	}
>>   
>> -	pinned = ret = 0;
>> -	if (in_kthread) {
>> -		if (!mmget_not_zero(userptr->notifier.mm)) {
>> -			ret = -EFAULT;
>> -			goto mm_closed;
>> -		}
>> -		kthread_use_mm(userptr->notifier.mm);
>> -	}
>> -
>> -	while (pinned < num_pages) {
>> -		ret = get_user_pages_fast(xe_vma_userptr(vma) +
>> -					  pinned * PAGE_SIZE,
>> -					  num_pages - pinned,
>> -					  read_only ? 0 : FOLL_WRITE,
>> -					  &pages[pinned]);
>> -		if (ret < 0)
>> -			break;
>> +	ret = xe_hmm_userptr_populate_range(uvma, false);
> Nit:
> return xe_hmm_userptr_populate_range(uvma, false);
Sure. Will fix in next version.
>
> With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Thank you very much for the review.
>
>>   
>> -		pinned += ret;
>> -		ret = 0;
>> -	}
>> -
>> -	if (in_kthread) {
>> -		kthread_unuse_mm(userptr->notifier.mm);
>> -		mmput(userptr->notifier.mm);
>> -	}
>> -mm_closed:
>> -	if (ret)
>> -		goto out;
>> -
>> -	ret = sg_alloc_table_from_pages_segment(&userptr->sgt, pages,
>> -						pinned, 0,
>> -						(u64)pinned << PAGE_SHIFT,
>> -						xe_sg_segment_size(xe->drm.dev),
>> -						GFP_KERNEL);
>> -	if (ret) {
>> -		userptr->sg = NULL;
>> -		goto out;
>> -	}
>> -	userptr->sg = &userptr->sgt;
>> -
>> -	ret = dma_map_sgtable(xe->drm.dev, userptr->sg,
>> -			      read_only ? DMA_TO_DEVICE :
>> -			      DMA_BIDIRECTIONAL,
>> -			      DMA_ATTR_SKIP_CPU_SYNC |
>> -			      DMA_ATTR_NO_KERNEL_MAPPING);
>> -	if (ret) {
>> -		sg_free_table(userptr->sg);
>> -		userptr->sg = NULL;
>> -		goto out;
>> -	}
>> -
>> -	for (i = 0; i < pinned; ++i) {
>> -		if (!read_only) {
>> -			lock_page(pages[i]);
>> -			set_page_dirty(pages[i]);
>> -			unlock_page(pages[i]);
>> -		}
>> -
>> -		mark_page_accessed(pages[i]);
>> -	}
>> -
>> -out:
>> -	release_pages(pages, pinned);
>> -	kvfree(pages);
>> -
>> -	if (!(ret < 0)) {
>> -		userptr->notifier_seq = notifier_seq;
>> -		if (xe_vma_userptr_check_repin(uvma) == -EAGAIN)
>> -			goto retry;
>> -	}
>> -
>> -	return ret < 0 ? ret : 0;
>> +	return ret;
>>   }
>>   
>>   static bool preempt_fences_waiting(struct xe_vm *vm)
>> @@ -955,8 +860,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   static void xe_vma_destroy_late(struct xe_vma *vma)
>>   {
>>   	struct xe_vm *vm = xe_vma_vm(vma);
>> -	struct xe_device *xe = vm->xe;
>> -	bool read_only = xe_vma_read_only(vma);
>>   
>>   	if (vma->ufence) {
>>   		xe_sync_ufence_put(vma->ufence);
>> @@ -964,16 +867,11 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>>   	}
>>   
>>   	if (xe_vma_is_userptr(vma)) {
>> -		struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
>> +		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>> +		struct xe_userptr *userptr = &uvma->userptr;
>>   
>> -		if (userptr->sg) {
>> -			dma_unmap_sgtable(xe->drm.dev,
>> -					  userptr->sg,
>> -					  read_only ? DMA_TO_DEVICE :
>> -					  DMA_BIDIRECTIONAL, 0);
>> -			sg_free_table(userptr->sg);
>> -			userptr->sg = NULL;
>> -		}
>> +		if (userptr->sg)
>> +			xe_hmm_userptr_free_sg(uvma);
>>   
>>   		/*
>>   		 * Since userptr pages are not pinned, we can't remove
>> -- 
>> 2.25.1
>>
