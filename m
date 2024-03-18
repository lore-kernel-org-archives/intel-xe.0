Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE75C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 09:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE1810F15A;
	Mon, 18 Mar 2024 09:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEWxM7mC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E161810F15A
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 09:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710754049; x=1742290049;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PLPltH5xK1u4WACUBF/aBal1qOezhpBK7bTX3PP0PJs=;
 b=eEWxM7mCEJAzgmdZ6uNMeMTY4Tf+KYGuZRcI+42CKoNrCc5LSfUzSKea
 tJCXGDEYc7ZdukrJuQpSf1390xqufx2uNQIFRk3CyMO4D02iOujCbG7oV
 M2l1MuwpSsYbqwb0Kwxmy2ZJYobCxBnvIoD4HbOBaq6G8qFH6FenMfOap
 kshcYzMK/F7NVKLTjGeOdqMDktLrtr6QReh3XXf41IfUdQtGUxME5yGGZ
 qbgjLCMPLibOy1EPUibzXHq3H+Z0whNL+XmqQE+XF3cFI7Y1HTJ3/wSXu
 mmitQx3vk4AyasTJQIk6w0FvwuBhyZ4xiTN+mC/qCDy2RKlL2Bp0393wY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="23072013"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="23072013"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:27:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18019967"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 02:27:18 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 02:27:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 02:27:17 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 02:27:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmD2RHCwO9Ovf0VdQd2CodBdKK0yNjZPwTml0iZo9xBaJlP5qatOHCc1DcIByNv4oFxWaY8MlEGxpv8blqKM6mv0cLBXgfDfKeTAC+wuk4g6/RkbMibGcGAypxNW7PReVPiE5fKFBQ6J/GYlDor2hWZgPc/Zl3wC5axdUn0coHwTRnp7vPKWeC6HRSSHE+YYhCbHC4IIL5UV0fF+Kha6w192LOuPBwuRlHGGAZqWqEJZK0jzx/3WCfMh8089CA4LHKTxn7A/L+9NnuTY8rh1jJ/MTv/iP82twZdm93vbG9274yLBMi498vQLicVfmJcYwhwduimMPC45UDnv20jPQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuDU+OJLTQuULGP5thVqVDxa32UJ9Z377TrN/wsms34=;
 b=nIRgN9U0CBftin857HIuOv+13zyWL6rnnM3t4icOc6ffTYHcKkT1RsYb4ql2TCjqjPUKAj9Wa8umW7euI682c+7PGgFPzw+pE2D2N3vjPPzLCdnsqh9BOp28PiRrkZGkRAtM+9NygopKHyS5dfv7WXygtVeMd0T0lg0iF3f+xtyXVRh+5Zh7XhSmCtiUrX5KPIrKA8lfXWbtk4DDK1M4yH/hz2h2yZBNbfW1P/blF7/Au0IA1ckv78v0gdaA0JLt1GsS7A0lXqbTYZnrNuS6Kxx384YxxQrM3X0CgqRhTBxXWkFgka8jfZ1RJ/shOXoC3fHmxwfeA/AIZxSEH+RqWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CH3PR11MB7916.namprd11.prod.outlook.com (2603:10b6:610:131::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 09:27:10 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7386.015; Mon, 18 Mar 2024
 09:27:09 +0000
Message-ID: <125c0aad-2dbf-4b80-a68f-08ba0d05003f@intel.com>
Date: Mon, 18 Mar 2024 10:27:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Warn on NULL job when user fence used in
 xe_sync_entry_signal
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240314095442.32153-1-nirmoy.das@intel.com>
 <20240314095442.32153-3-nirmoy.das@intel.com>
 <73503874-c5d7-4f73-a9e9-7ff62cb5745b@intel.com>
 <ZfT1zdhMaNhvCZZa@DUT025-TGLU.fm.intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZfT1zdhMaNhvCZZa@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0192.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::15) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|CH3PR11MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: d79be1bc-c7df-41a9-7e8f-08dc472d95e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j+uzI7eWJE0GW/9l7X+rDZlb4jTS/ilp1t3T4+F5h0Nsw5Xj5w0mklCu5pCmHYkr6qFJQjyu8dcdwkDfrxClCIAUVCGEt4P2mX3dJSCMTgsxZotknV0P1dCiO4uo/8eluAt/+U3ckI3gtJ4vbMj2YtSfTX0ALRNjfnaO0e8y1um1pE5DOiWZRhxT0aXJcRO5qZoNMj2/WCM1pEseQuyPPjUCECiQNGUQYJJcA+3mSzqSAdr4sYbv1onnVubo0GyP+OV7ODF4J278CAC3jXxFatA8URucELK03jfB3W2PpHi2Ll5m3wgzrpXPPIAn9R0I1HEu0mImG/kU3+KLd0iUn9lJ8bPJn/3RCBwpqgxdRNqHFCDU8LcYuS5xbMKurR7YRysF53RDVQSroSfTHZ78iFgMNpNnQFOlz82TlQ/M+JXjQ4CW/OsTs76NuZEgt/CkXh3NPGuGDx1pgJkVcslEu9/ZOy7fbBCnPOxKjmMPpbPxuHZAap5MTtB6CkuAu83w4IEvSyv5tqFdj+S0gunah/n0KOQO8bFFtDGxmaDcJrg9shruuxTmUcpW59M0WThtcmSTGyF9xynDL3ukOVoFfT/3sltSvorMaZqJBlAaPMw7zc0A1oof9QfcHk2XPnbGfKzO8+o1F0c05Tdd9w1tVV5GCKdrjSSdB14D0v+MXCI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cy9rZ3hYWEVJWEc0S0VMWmxyWG5PeVQ5a2tPQXF4aldKSWpsN1Q1YmVVRVUw?=
 =?utf-8?B?YXhWWFMzS2VQYUJhSTF2dDhnVXRKVlJsUEFKVUVZWkxhQk5WdnJqVGd1cStS?=
 =?utf-8?B?Vm5JUjdBTTBFcHJHbG9VcEgzVDM5Y3gzTHpIb3B5ZVF1bWJRZ2xxbWNrU29Q?=
 =?utf-8?B?eVNvZFVuUE84b1RVZnlZTlJScitPNk81S2FNSkhuU3dOMnNQZTY4eDVFbmFu?=
 =?utf-8?B?SlVBbXBKNWhXTS9CMzJwT2hjdmNveHp0Qk14VlVuU2p5a3FPbGlWTkFWS3or?=
 =?utf-8?B?bjVtOHc5cWpRSTA1VDBIVDFLU1BnZGswYk9yaHl1alA5bkJlcEJybzdDSHFE?=
 =?utf-8?B?Sjhjd1hCSnpSYUxkbjVyVGlzakVReWpuWThHRG9Pa1MvTHlXUjR0LzNZZ0VR?=
 =?utf-8?B?UytjTHZ2aDBIQ2pqYUI3OTdBZzNLSzNDOWhYU2NLSU5FK1E1b2dpcWkzRDNI?=
 =?utf-8?B?Nkt1YXd0N0xzdXpCS1N4NXhSWVluSld2bFNoczFFUkZwRVB3aTJHTjFwQjZa?=
 =?utf-8?B?MHBaOVBQSmlreE9iM3NrMEhpQ2d4anA3RG1TSlVDN3ZvVkRWa1o4WFc0dncy?=
 =?utf-8?B?WHkvOUpUVFRCSXZGU2thaFl5R08wNUs4Q3RUZW9pZUpxWnplMUFqNnpub2lk?=
 =?utf-8?B?ZDVQUk9DNHg3d0lYb2ZWc0hOZWxWR1VKNW5zQ1pKZXgvY2F5UVp5ZUhvMlZS?=
 =?utf-8?B?MFJXYnlNUWpEWmZsSGU2RGdSZWlyTkdSVzZacExya3o1V2FFNTJsaklIbFFQ?=
 =?utf-8?B?Z3BxUUZBUm9YbW93Z3RFcWdnME0rVFk2NUU3d3dCOWxhYWVYbG5YRVhIWDNK?=
 =?utf-8?B?ZTBIMlF3SnErTDUweFRVOE5TdFhKSjRacU9IMmdrYlBhTHZaZWxWY1J6QjRv?=
 =?utf-8?B?NVBFUmM0empBdWJiNXp0eWljUjRVTjl5cFRvREhXYjYrNjVSZm1XL1E5bWNi?=
 =?utf-8?B?cmZTT1JCdlUxVWQ2ZnRhcDhzZjEvbVBkQzd4TEI0RlRBMDVQSXJRb0RkS25S?=
 =?utf-8?B?My91L25hc2I5eU56Z1hOQkhsL1RXVC8wN3k2NmJSQzd6dExLU0tsd1VCTG1V?=
 =?utf-8?B?TElZQkZNYm92QVNmdkYwa0hKRkpIRlppUXM3QmxGQURYV3lSNW44MW5sTnV2?=
 =?utf-8?B?dTlyajlGU1BPNkhENk15WGxkL1V5MTA2YmRRUmhOTU9oUjErYVJqTnEvUGk1?=
 =?utf-8?B?Vjd0L1FBQTBCSENDZTdFSUJYTitRRFZuRHZOdUhodWdIQzFPM1EreWRRbitn?=
 =?utf-8?B?Y3c1WitXOTZGdXdpcWNDbk5Qd3NhTWpsZEV2SzB4K3R3ZDZYQnA5YWlNSEgv?=
 =?utf-8?B?bUZkL0NpYSs4MkVqWDBmR09MbnBWc3A2SVphOFRIWFhvbFd3S3FnVVBwSFFl?=
 =?utf-8?B?K3ZDcTYwaThPVW11K2ltQU1raXhjYmZmUU9xeE1WQW82VnIwTU5zQWJSRkNZ?=
 =?utf-8?B?OVR1MEZmZXFDanFyVjFYVXlwOUx5UFBmVG1BMGVSbEtXZGJ5NjFTenNpQThE?=
 =?utf-8?B?dUVBcFpRa2tHNDhMMlhRSzQ2bUsrd1Nqb1JrMkdTSy9ZUVlxYU5JWlFaK0lm?=
 =?utf-8?B?MytLL2RXdXdyM0haUE1Fd0phVHUxNWlMMUNIRXR4VFRxTlFadGZNQUdtTWNB?=
 =?utf-8?B?Ylp6c0F6UVlVSWE3N2lwTU9sTEk2UHV4Qk5GdnpWeTczanZxQ05GdUZvKy8x?=
 =?utf-8?B?a2w3QnpyQlFQWGtKblptR2R3Y05jdnRvdWlWWGV6elUxWWxPbzgreE42SVVV?=
 =?utf-8?B?R0ZaZDZJeDZSRkg0cmczK096TllGdzN1amZxM2d4ejZqaEh6UGNqVFZUY3BQ?=
 =?utf-8?B?aUlxUForRTBBcGNyRndrRGU3SC8zMG1wV08zV0N2OEp4T1c5TVZ1NVNMdnNv?=
 =?utf-8?B?bjJuVW8xdGhvWGFXQXBzbHlEVHpYay9rdllZMjdaeUV5aC9lb2JxeUVGR2pM?=
 =?utf-8?B?TDZ4TnI5RHBxU3lRa3FIVXZxYlVqNVZLSzJ3emJPZXFRTktnR2xQa0FzQ1Ux?=
 =?utf-8?B?M2FkVkJNcEVNT004ZmJhaFFCUzJNWkU5YXJ2ckxRaXJZWWtIUXRlTHF0ckVy?=
 =?utf-8?B?YXVOdW1jcHZvSVIwWi90YUJNZkVGODlQZm4zZ1ZSMWpUOFRLd0ViTmt0UEF2?=
 =?utf-8?Q?vsS16kdVXE/m5sCw9MCF96hEK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d79be1bc-c7df-41a9-7e8f-08dc472d95e8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 09:27:09.4834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XoozlWqRmGBCUY6NgRkKVOqEx7gfQO2pWDI267+9TpJOIKPOsgCOmosAeV8NIxCJSG0J+Za+iP9wMl85AQEh+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7916
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


On 3/16/2024 2:28 AM, Matthew Brost wrote:
> On Thu, Mar 14, 2024 at 10:53:20AM +0000, Matthew Auld wrote:
>> On 14/03/2024 09:54, Nirmoy Das wrote:
>>> Added a check and warn for NULL job when sync->type is
>>> DRM_XE_SYNC_TYPE_USER_FENCE to prevent potential crashes
>>> and aid in debugging
>>>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_sync.c | 10 +++++++---
>>>    1 file changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>>> index 02c9577fe418..fae466ba8e75 100644
>>> --- a/drivers/gpu/drm/xe/xe_sync.c
>>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>>> @@ -255,9 +255,13 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
>>>    			dma_fence_put(fence);
>>>    		}
>>>    	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
>>> -		job->user_fence.used = true;
>>> -		job->user_fence.addr = sync->addr;
>>> -		job->user_fence.value = sync->timeline_value;
>>> +		if (job) {
>>> +			job->user_fence.used = true;
>>> +			job->user_fence.addr = sync->addr;
>>> +			job->user_fence.value = sync->timeline_value;
>>> +		} else {
>>> +			XE_WARN_ON("NULL job passed with DRM_XE_SYNC_TYPE_USER_FENCE");
>> Just wondering if it might be better to just let it crash if that ever
>> happens? Assumption is that it's impossible and would be programmer error.
>>
>> Matt, any thoughts here?
>>
> The usage is probably add an xe_assert(xe, job) and then let the kernel crash.

xe_assert() would require passing xe device struct which is probably bit too much. How about a XE_WARN_ON(job) ?

Regards,
Nirmoy

>
> Matt
>
>>> +		}
>>>    	}
>>>    }
