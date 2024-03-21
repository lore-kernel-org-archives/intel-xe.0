Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EC1C54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 16:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329D610ED70;
	Thu, 21 Mar 2024 16:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OgQkb2xA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE9810ED70
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 16:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711037443; x=1742573443;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L/Wl9MlylY33bHmlJmr4gdEyb91vDcEH0w+mhfqjxl4=;
 b=OgQkb2xAOaIe/Y2CyvtYFuAWSq8H+eapN+soRhsTJ5dfXe2IG1cbKoMw
 6nKj0dUWjF7zrDMkJQJMqM/Wq5jXrzW2kY5wFXHJbVVRAAkVwEYOtxmlG
 sufJn/qGLRdnmWjlDQDoGkCTa2OVECPieJyYBeE6ClcUfxVYG0yX3lG+x
 mpj2pYVar2UnSYMNy7nCe57soLRPy2d8HOWfWCCMa5Y4mSJ6g3Xze6LwY
 rFQN2NNLFsqnS6hJNMff3DNtFm3cA9O499+AHvcz35niau5tKJbo5kT+W
 dB6m1Mn/cOn80Kt4H0/t0bk15lajL9CvVm9o9atJ7XRyax/sVtL11rASg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9845360"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="9845360"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 09:09:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14591946"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 09:09:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 09:09:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 09:09:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 09:09:52 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 09:09:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPUXd1da0WkNnifOvEYM0xb6iKEFpPA/5fmz20e9QWKArOlO4683X6jqgGgLsJbkxzhQ5F8czz3/CV17Ru0JVar/UhddCXSyzPcakHEu8YTVR2o8wxtcw9tjS1FV2MqSpZM6ghD6ag72/Kvyd7Fce0yRqlD1rm9l7uBHp6ivWGcr62DAr/1WmhOKtNBA6FM5t3RijPVWOTV/rSJvxA5w5jJx3b/qr2ogQekbY8ulqXfS6e0x1AcNUB4itpSglpMrHjt0KcKD/b5RlRvu9rNhrbBWMuUirMbZ2+Za4bf86jvRC93DvrU1Hw17hf1BWs37r2FQjfKKIHvB5qJSEEgk8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVH1IJYfqQDNLfvyXsKTVyN5/zXdROisLUyhSwUxPyo=;
 b=Fu8//2ECh/v+2GNQm+F/VPfORKuWlvzkhzxoag3gPJEEcgMEFuEQ1V2tPUKW7svyfgu82Xu1ZuWEXWmYOKDE1XQCGXiTrbMKirvUtXGpnAn7wvVBHpUiuoNvq0RNcJ4+amSF6U8nJ2IJYQd1cJysyxJMOqq6Vf9796hBy2RRPZ7bsYe6K8iZvrR23pw1mIry3g2svR48aLqJF0DCqpIRiJmbJz9+8TQq5xTljq31UXpeWOwxi5UrZbJCBnf5nN5XLIV1upzrPEiZm6wyYcus6RvbKtz3Te8FsbpOblM7ycjfrnboN3Ru2IPCRhcrqVRZm0eiQxMyUja6+dJ5GctnKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 DM4PR11MB6310.namprd11.prod.outlook.com (2603:10b6:8:a7::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.11; Thu, 21 Mar 2024 16:09:49 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 16:09:49 +0000
Message-ID: <84440ba0-802c-4a91-ab2d-c0d4bceb358c@intel.com>
Date: Thu, 21 Mar 2024 17:09:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Create a helper function to init job's user fence
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
References: <20240320124556.10337-1-nirmoy.das@intel.com>
 <3xjcawjh2o2v524hxp3pm65l3mrrsm6dsn7vvlic5baucfzow5@ceyr5a76ex7a>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <3xjcawjh2o2v524hxp3pm65l3mrrsm6dsn7vvlic5baucfzow5@ceyr5a76ex7a>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0312.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::8) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|DM4PR11MB6310:EE_
X-MS-Office365-Filtering-Correlation-Id: a00e3320-e176-4e99-4fc1-08dc49c1555d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JkcTrKU6nMY/ap/dVrdAikyzo0sZcHhP+DOf6M6x15yK+h9VFYfl9kIAVKF4+T5mSisL/g/AY7l0xTKQkVjxkSNLVkCN4BgRW2CH17whF06FHrjWTfoTXUvUkHd6HTYNGRnb+UFb7JrgEGYgEUXiuDTvFZet9DOqMvM4u3rZmP7ra4nvNmjrSyzvbsg4jkpFn7HczsTW0en3Bg94fvWclb2qp9J9svp5O7H9aj3i7ewHSOjxrbbcgtFMvZ9AOmgbcf+vAOqf+9APQaDJYXbBnLAHBlrYzZPOGqStqUCkjNZySFKL0LZat5ZM0eVhMi8QEt2dRd+/7BP2m2fRS54Jbq2hZ8Wf2AEcwlmyCVytJULeiJzni0lU/+uXLE9eyHfvOYb6RAFlvY9GGG2chaA5oZS8arJHKcLJj+hzR7gK3obowK4udVJh4n1uYC1eUxM3m64fG+MBT5LFywbSVs0F9WgQ+4ryu2ygDvOfrGxajFUR435Cn0CobzAq0csn6QSr6jIrH/py4wyQad0faWYqYHRLqnhTjdcc24RQDqERgWywSnlYfPnkdwM42CUw4VjJbmYSxGEIbfVEy2G/vSr7DWofKPjdrjL1DYa7BTE8dyYwQccx5rV90RkbVYobcXyUSfbfoW0lO0gxwz3/j6NbkVDouy9fGFgmg+SCaz6yD8g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGdBRFFmdjRqUG95ZU14cXVZTk5GVGRLcy9vdHh1UU1SZ2I2RDlPUG8wN1hr?=
 =?utf-8?B?d3FWc3c0aitGQjZjcWk2aEJ0OUpNVERlMHpaSUs1M2JtdnNiYlZiT3ZzeEhU?=
 =?utf-8?B?U1hFWnFieVlxVGcweWtXT09na0Zsc1oxZjlSMlVCNDBkK010RTIzN1duUTB1?=
 =?utf-8?B?bER1V2xoZ1BoQ2pzRzJpbUQvNlZaZnBxb2R1SUI5RVVoTnladHlvdEEwRHJv?=
 =?utf-8?B?eEtiTHFTTTlrYktnZ1hYNmZ6YnlzdS92VjRRVmt1bGZ1bnZxOGdiWURaZ2RU?=
 =?utf-8?B?NkhBTzVhWWdQV0IzcUhGOGFrMitpU0ZxUStNd29QZlNpZ1hjV01tRE92R3hO?=
 =?utf-8?B?MGVDYjVtdVMvK2IvRWs5MitvdGJwVExBNEVyRkQ5L1U2Vk1hL05QT2paaGE1?=
 =?utf-8?B?azBld1BFb1A1VWlZWHJUWUJPNnYvVEVwZGdRNHUwR3RXMld3anhOU2VLWi9n?=
 =?utf-8?B?VFVySXVQR0crZU9oL1l6QXBYVWVUY2ZVcW8veElzVnFUUXFkQXJGL0FWdDdw?=
 =?utf-8?B?VUtURVBRTWRPNUtiZG1WKzljVXBLVVVsZlBPVUVUbEtVNk94c1NvMnFrNEhh?=
 =?utf-8?B?Y3dtdEpEa0ZadDVxalNCc2pPMjR3Qnk1MERCajZGS25LTEhRV2I5WGljVGJs?=
 =?utf-8?B?aC9rODlRT0hpQ0Rab3phdVpGOU41b2t4ZVZjS0xuV0RhMVMvTXNweGk5dks3?=
 =?utf-8?B?QTJ0U0h6MDZxT0VmRjJkN2M5TnVCSU9rZmtmRWV4NHpRd0hmWXpzTXQvME52?=
 =?utf-8?B?SmZ4V2N5QjdWdHc3bzhnb0tsZHBzV0FZekkyQ2IzZ2lhNlp6TEJoaVB5cDZ6?=
 =?utf-8?B?UEEybVZiTVA2N1dSUEZDU0FGa1JtR0JOK2ZxZVErM2V0ZEY5dUVVb2dsemNw?=
 =?utf-8?B?ditlSnVjczdBdGFnMVRQUlAvWjR6cmRLYzFYbzBqdlg0MDNDdEtzY0RvL253?=
 =?utf-8?B?Ulo2WkJTbWpIb1U3SDNLQTZTMzcwbDErZ1hpVnVNdkVXRThld25rMmNWUlVu?=
 =?utf-8?B?Ly9yM1dqNjMranhnOHo0SFVOQk9qWlpuZkNCNm5wTEFWN2VVS2ttbTZPU0Zh?=
 =?utf-8?B?ckF2Um5pc0ZjNGx5aitxQ1FiZjRyVUJRM0dYZVdFcVdzaUN0b0hldTlWVVBr?=
 =?utf-8?B?ZCs4eGlxRFFJbFlNbkhiK1JrZjN4N3RDaVhSZ1hZSzJkNlp1UWZReGUzWGpP?=
 =?utf-8?B?blREdDkyeVVtYUE5d2s5MElRS2I0ZGNoRlRkN3NKUHJTL215OVcxVXI5V1hs?=
 =?utf-8?B?OC9VZFFGR2V1a0FiZnM4N1FHUW1aYUVZTWgweFZxdXNuRXgzTzhldlRQZmFY?=
 =?utf-8?B?VmNDaXl4UlRVM05CVkVBano5NDYzOHJrTXlpNUxWdUZicHhEU2ZCakxkNGh5?=
 =?utf-8?B?UHEybThkd3B1Ull4NGJoVURORFZqSitsQU54Nk1JcFJBQjE2YkdHV1RHV3BD?=
 =?utf-8?B?bUVoTWRZMGNzN0lFd2hHUllwS3ZOc2RweTRycE1RN0NqUmZRLytMQkFudktU?=
 =?utf-8?B?THdZUjBsU0xzR2tsS2RMNWI4Z0ZOMk5aMTlkZWNzcnQ2N1FiSlJyUCtzRStS?=
 =?utf-8?B?Qk4vZnUrd2dtaFg2dUFYQTBmWmhYR3pEZkJvbVg4R2phRmczTjlWZWFxVFBV?=
 =?utf-8?B?aW9IVVRuL3hScVBqYm9Gb3k0MTdBVytBNXgvK1VPNDNUVUVCWXFSZ0d1SHRY?=
 =?utf-8?B?bS9zUld4TnhtV3JDVVVDSEJoMmhLUk1DSWtkL3YwbEQ1a0tTa0pWN3JuSGcy?=
 =?utf-8?B?K1UvSVRFejAxOVZTSmhPNTRtMG9BaEJXQ2tFMWo2TU9jZS9FVzlzMnlUM3Zt?=
 =?utf-8?B?SjFPWGsydmoyUzZ0RW9idWd0TE10c0VZVjFTWm9pYTQ1UFdPOE5GQklhOVk1?=
 =?utf-8?B?bnc2WFhDZEhzd2pGZ1M1NEhMMGNEK2tlcDBISzRJWGVhVW9icHRXNFM2UkhB?=
 =?utf-8?B?dklQS1ViV0pZNHFxN1dOR21TNEIxZUQwQ1pVaVNwZjlVdHlaZUJYdThmMk93?=
 =?utf-8?B?aFF4cnJLQjJYK2pJNmhuZXg5ZHFSMk9yZEpKTjJDQ2ZJRFV3Szh0R0RDcG1w?=
 =?utf-8?B?cHRTVkZ2N2FVWjYyRmhSbmRic1pHbkJLSmhodjBGVWVyc014dElYTTFlNVBJ?=
 =?utf-8?Q?J4dfUz+mJ6bs9mxy70XxwD/U6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a00e3320-e176-4e99-4fc1-08dc49c1555d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 16:09:49.1895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rO9wgSwQw5nI/YeYbitWs4Jhbmc/dfemm0L4ohDhMmM9yyeow5KmpG0Ie3+njiK7AQjG9kuGZ8ITbLHu/Ye76g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6310
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


On 3/21/2024 3:43 PM, Lucas De Marchi wrote:
> On Wed, Mar 20, 2024 at 01:45:56PM +0100, Nirmoy Das wrote:
>> Refactor xe_sync_entry_signal so it doesn't have to
>> modify xe_sched_job struct instead create a new helper function
>> to set user fence values for a job.
>>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_exec.c      | 10 ++++++----
>> drivers/gpu/drm/xe/xe_sched_job.c | 14 ++++++++++++++
>> drivers/gpu/drm/xe/xe_sched_job.h |  3 +++
>> drivers/gpu/drm/xe/xe_sync.c      |  7 +------
>> drivers/gpu/drm/xe/xe_sync.h      |  1 -
>> drivers/gpu/drm/xe/xe_vm.c        | 10 +++++-----
>> 6 files changed, 29 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>> index 7692ebfe7d47..1fb4dd4d0557 100644
>> --- a/drivers/gpu/drm/xe/xe_exec.c
>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>> @@ -249,7 +249,7 @@ int xe_exec_ioctl(struct drm_device *dev, void 
>> *data, struct drm_file *file)
>>                 goto err_unlock_list;
>>             }
>>             for (i = 0; i < num_syncs; i++)
>> -                xe_sync_entry_signal(&syncs[i], NULL, fence);
>> +                xe_sync_entry_signal(&syncs[i], fence);
>>             xe_exec_queue_last_fence_set(q, vm, fence);
>>             dma_fence_put(fence);
>>         }
>> @@ -359,9 +359,11 @@ int xe_exec_ioctl(struct drm_device *dev, void 
>> *data, struct drm_file *file)
>>         drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, 
>> &job->drm.s_fence->finished,
>>                      DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_WRITE);
>>
>> -    for (i = 0; i < num_syncs; i++)
>> -        xe_sync_entry_signal(&syncs[i], job,
>> -                     &job->drm.s_fence->finished);
>> +    for (i = 0; i < num_syncs; i++) {
>> +        xe_sync_entry_signal(&syncs[i], &job->drm.s_fence->finished);
>> +        if (syncs[i].type == DRM_XE_SYNC_TYPE_USER_FENCE)
>> +            xe_sched_job_init_user_fence(job, &syncs[i]);
>> +    }
>>
>>     if (xe_exec_queue_is_lr(q))
>>         q->ring_ops->emit_job(job);
>> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c 
>> b/drivers/gpu/drm/xe/xe_sched_job.c
>> index 8151ddafb940..734900b9c7d2 100644
>> --- a/drivers/gpu/drm/xe/xe_sched_job.c
>> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
>> @@ -17,6 +17,7 @@
>> #include "xe_macros.h"
>> #include "xe_trace.h"
>> #include "xe_vm.h"
>> +#include "xe_sync_types.h"
>>
>> static struct kmem_cache *xe_sched_job_slab;
>> static struct kmem_cache *xe_sched_job_parallel_slab;
>> @@ -278,6 +279,19 @@ int xe_sched_job_last_fence_add_dep(struct 
>> xe_sched_job *job, struct xe_vm *vm)
>>     return drm_sched_job_add_dependency(&job->drm, fence);
>> }
>>
>> +/**
>> + * xe_sched_job_init_user_fence - Initialize user_fence for the job
>> + * @job: job whose user_fence needs an init:w
>> + * @sync: sync to be use to init user_fence
>> + */
>> +void xe_sched_job_init_user_fence(struct xe_sched_job *job,
>> +                  struct xe_sync_entry *sync)
>> +{
>
> here we need either an assert that sync->type == 
> DRM_XE_SYNC_TYPE_USER_FENCE,
> or we remove the check in the caller and just silently return
> if type doesn't match.

Yes, would be nicer. Let me resend.
>
> otherwise LGTM.

Thanks,

Nirmoy

>
> Lucas De Marchi
>
>> +    job->user_fence.used = true;
>> +    job->user_fence.addr = sync->addr;
>> +    job->user_fence.value = sync->timeline_value;
>> +}
>> +
>> struct xe_sched_job_snapshot *
>> xe_sched_job_snapshot_capture(struct xe_sched_job *job)
>> {
>> diff --git a/drivers/gpu/drm/xe/xe_sched_job.h 
>> b/drivers/gpu/drm/xe/xe_sched_job.h
>> index f1a660648cf0..c75018f4660d 100644
>> --- a/drivers/gpu/drm/xe/xe_sched_job.h
>> +++ b/drivers/gpu/drm/xe/xe_sched_job.h
>> @@ -10,6 +10,7 @@
>>
>> struct drm_printer;
>> struct xe_vm;
>> +struct xe_sync_entry;
>>
>> #define XE_SCHED_HANG_LIMIT 1
>> #define XE_SCHED_JOB_TIMEOUT LONG_MAX
>> @@ -58,6 +59,8 @@ void xe_sched_job_arm(struct xe_sched_job *job);
>> void xe_sched_job_push(struct xe_sched_job *job);
>>
>> int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct 
>> xe_vm *vm);
>> +void xe_sched_job_init_user_fence(struct xe_sched_job *job,
>> +                  struct xe_sync_entry *sync);
>>
>> static inline struct xe_sched_job *
>> to_xe_sched_job(struct drm_sched_job *drm)
>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>> index 02c9577fe418..65f1f1628235 100644
>> --- a/drivers/gpu/drm/xe/xe_sync.c
>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>> @@ -224,8 +224,7 @@ int xe_sync_entry_add_deps(struct xe_sync_entry 
>> *sync, struct xe_sched_job *job)
>>     return 0;
>> }
>>
>> -void xe_sync_entry_signal(struct xe_sync_entry *sync, struct 
>> xe_sched_job *job,
>> -              struct dma_fence *fence)
>> +void xe_sync_entry_signal(struct xe_sync_entry *sync, struct 
>> dma_fence *fence)
>> {
>>     if (!(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL))
>>         return;
>> @@ -254,10 +253,6 @@ void xe_sync_entry_signal(struct xe_sync_entry 
>> *sync, struct xe_sched_job *job,
>>             user_fence_put(sync->ufence);
>>             dma_fence_put(fence);
>>         }
>> -    } else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
>> -        job->user_fence.used = true;
>> -        job->user_fence.addr = sync->addr;
>> -        job->user_fence.value = sync->timeline_value;
>>     }
>> }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
>> index 0fd0d51208e6..3e03396af2c6 100644
>> --- a/drivers/gpu/drm/xe/xe_sync.h
>> +++ b/drivers/gpu/drm/xe/xe_sync.h
>> @@ -26,7 +26,6 @@ int xe_sync_entry_wait(struct xe_sync_entry *sync);
>> int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
>>                struct xe_sched_job *job);
>> void xe_sync_entry_signal(struct xe_sync_entry *sync,
>> -              struct xe_sched_job *job,
>>               struct dma_fence *fence);
>> void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
>> struct dma_fence *
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 80d43d75b1da..497e49b867fc 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1696,7 +1696,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct 
>> xe_exec_queue *q,
>>         xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
>>     if (last_op) {
>>         for (i = 0; i < num_syncs; i++)
>> -            xe_sync_entry_signal(&syncs[i], NULL, fence);
>> +            xe_sync_entry_signal(&syncs[i], fence);
>>     }
>>
>>     return fence;
>> @@ -1770,7 +1770,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct 
>> xe_exec_queue *q,
>>
>>     if (last_op) {
>>         for (i = 0; i < num_syncs; i++)
>> -            xe_sync_entry_signal(&syncs[i], NULL,
>> +            xe_sync_entry_signal(&syncs[i],
>>                          cf ? &cf->base : fence);
>>     }
>>
>> @@ -1831,7 +1831,7 @@ static int __xe_vm_bind(struct xe_vm *vm, 
>> struct xe_vma *vma,
>>         fence = xe_exec_queue_last_fence_get(wait_exec_queue, vm);
>>         if (last_op) {
>>             for (i = 0; i < num_syncs; i++)
>> -                xe_sync_entry_signal(&syncs[i], NULL, fence);
>> +                xe_sync_entry_signal(&syncs[i], fence);
>>         }
>>     }
>>
>> @@ -2052,7 +2052,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, 
>> struct xe_vma *vma,
>>                 struct dma_fence *fence =
>> xe_exec_queue_last_fence_get(wait_exec_queue, vm);
>>
>> -                xe_sync_entry_signal(&syncs[i], NULL, fence);
>> +                xe_sync_entry_signal(&syncs[i], fence);
>>                 dma_fence_put(fence);
>>             }
>>         }
>> @@ -2930,7 +2930,7 @@ static int vm_bind_ioctl_signal_fences(struct 
>> xe_vm *vm,
>>         return PTR_ERR(fence);
>>
>>     for (i = 0; i < num_syncs; i++)
>> -        xe_sync_entry_signal(&syncs[i], NULL, fence);
>> +        xe_sync_entry_signal(&syncs[i], fence);
>>
>>     xe_exec_queue_last_fence_set(to_wait_exec_queue(vm, q), vm,
>>                      fence);
>> -- 
>> 2.42.0
>>
