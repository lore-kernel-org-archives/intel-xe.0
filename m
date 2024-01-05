Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C03EC3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 05:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A4410E564;
	Fri,  5 Jan 2024 05:32:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05D710E562
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 05:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704432728; x=1735968728;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V+L5VoeXnFtPyQ246sXTesMm6xodpWhIOrcYJWNz25k=;
 b=R1PlunSlnK9Uu8v43iwwK6BkWHbJUTcm+SibWSCrSfouMASG4V0Vg+8R
 U9NFuqsBAhXWka9zuHwBLHOCMGYGw3pNop7I/BZrY569iDcXQ9tdv7wEf
 bXtEpreQXspQhpVwsqMvYT7/YpPPvflC+JUCZnUaVMaUA4etJ10p2q895
 I9RPZPCST56m+8HyiGDo70/axDE/Woa6NVxEfScAlzFiqa2pioczIHTue
 gs2+IXRCgNqGQwyoccilpUAJsjEcaoZJWTGxX+ot2zEvMUyqiBbQqW0wQ
 BAPUItQddeYUl34gI/uZDedZFsqySRWv8jj1hk5Iq2BU8icZeQ0r8qtf1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="10809450"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="10809450"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 21:32:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="22742159"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jan 2024 21:32:07 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 21:32:06 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 21:32:06 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 21:32:06 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jan 2024 21:32:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hk8al9pwhMD1jmiIa6y1SF/mRml9BL2PqO7jh2rx+p2GA+wBHzSlUxLdOQP2x3VbuDAUFv/CuJYWF2s9ElqXvwu9pjlfGvWczhwc7F5C0Yd75LKyv6NdRMBfoC5TlQukdkgSdIfU+zQLFs4vb4sDnbjobsmEKEoOtYkHbw232aetkC56r2GXkgLjnttEe1yjmC6jq0fPbHWahmH2J8u2NgZicGva1wHdsnU53WR/NdEIYiU0bNa0KBrNv0HZMgTOWLjg3ZCUdUKI6NoDt/5gJ7FdYWZJu9OI2KWZ5+QgEcd6FX7dmIwrhidVzKg+7QmG94JtUrleR8MngKUL333ntg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSo5ABAkzuIr5CAlI3v4Agg0M02FgqGWK49SszL/ras=;
 b=TzRbft3L4k6eLU++/JUS911vnkE9Ufmhbigzlb7nvWBBbl5Rs6caETDqJ3FIK4ZSBp1btRadK93yNEV+WSLm1gVygf10q0fHBhidOWscx3+YJxQsh7QniB8SBHYblorDLy7IbL3XOOlN3KdRqiJaYPX01xrWJLuzbjfkK+Oc5okY8cXgQKEsXl6oP7THG1v203p/wObx8wcVGVw1Kne6c0h9rNCJS893qtTcvIaD7hLt1GPVO+IsCxW23xc8OqHz6vkJmUATPuP6e9h6k+ujd1WVfsys1ATBXQImxELhHGV9qpcA1HB1XElLf0ch7u46wTr3guwHyZpfcvFqA6wrmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW4PR11MB6691.namprd11.prod.outlook.com (2603:10b6:303:20f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 05:32:04 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 05:32:04 +0000
Message-ID: <3cea3a05-26cf-4d1a-9a1b-837232d34181@intel.com>
Date: Fri, 5 Jan 2024 11:01:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] drm/xe: Move user engine class mappings to
 functions
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231222074602.817518-1-riana.tauro@intel.com>
 <20231222074602.817518-2-riana.tauro@intel.com>
 <1edf70ed-4efe-4a0b-a7f9-63fce7969150@linux.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <1edf70ed-4efe-4a0b-a7f9-63fce7969150@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW4PR11MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f3cd9f5-0621-4291-51ac-08dc0dafa5fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IrRrAd9uNkwp/1QkTHEGrgmjMIi9EdlDW1z2iRr1bwHiC6R0FL1sRpl1z+XLh5bRNkcXYSLeomeiGrVd9JMREvJ1Oi1eaQ3O/IweRpUBP+UHtpXItUKoVIbfI388aNEWbCtIi8uoIAxBnYglP4je1vvmY/K0k50GIlCG37ReSwKt/CeWSZ0dY5onkfix2ROaq+56wggPTlNusOwjGp9YHSFj8oDlZU+2g8LykniLlKkxpVXlWLv83Wu5raYp7WI5oBlB9YZKQptBSCltEk+25gl+RqRvGS4cPoOvCbfzd7dRcZd17HLZYNCvBQ8aXZM2Mgvs/DjU1pt8zEVMhsY9h/HCYmUIJbNRlMwB3evS+lxPPDz7SVL/DEJ6umxOQ00CQK+nRn9+bg0Js3WQG1MdO98dB82lCT2ATdwKrJK4JJA+WUFA/PuqrblY2YR/FOLnQVeOwpJdoy7lnCM526fokhlS3kl4IXWwYh1+abSqN79Vrym0KoeM9fItRJAVmV5wvIuyqTMtf7QOdQn3WiNQg4KRYfHhQPfRUEKNTxV6HvC3PabwRZlv+Qn873b9WzLdcQcRJw4efsTIePuRhKEkM2hwKJuwFjNe317Rg+aM4otMBLWT/wFLddW8QED5JOVvIZ0n5J6Xwvst7+2YThfH/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(346002)(136003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(31686004)(2616005)(6512007)(6506007)(478600001)(6666004)(6486002)(26005)(53546011)(86362001)(38100700002)(31696002)(36756003)(82960400001)(2906002)(83380400001)(5660300002)(41300700001)(66556008)(44832011)(316002)(8936002)(8676002)(66946007)(66476007)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXhJNUFvZ3lnOXBmV0dyYk45a3M3K1p3ZXVnemRHVWxjZyt1bGtiMDlQYzZW?=
 =?utf-8?B?RnVlVmFja0Z0eUVWR2Jtalcwd3FrV2s0amk1RnVNdmVKclczejBjYWNwa3lH?=
 =?utf-8?B?Q05qQ3FrT241cWZpZVJFajlvdi80dXorajB3SHhMdmxJRWhjakh0YVFLQzZQ?=
 =?utf-8?B?THMrcW5xdmt0YU50dW9HRG9RMnVJNlJqRzRRdUh2dDVGc09yS3ltMXBWSEhs?=
 =?utf-8?B?RmxXdWVxT2tMQTRuWGx4Zlc4VFlhZU1QWVZVVmwwVEVxWm9HWHkyclpmLzZ3?=
 =?utf-8?B?Y3pHbVQ4T0VOMjFib0p3eTgxUmhHUUlZSjVFcmVHYVRVeXQzeTFMSWhzcHpn?=
 =?utf-8?B?NzF0UjVpNlVQSHQ1SEVXaWQ0UG5QS2tzV0lUbWZlTm5JSVlERjlKQ1psWGFR?=
 =?utf-8?B?eEtqeVJyb1E3MkZKRHp0RW5zTWpZOW0yTlNnc0J0d0dJT3UrRGdxNnBra3JL?=
 =?utf-8?B?VDIwcVlpTXpOQjVpK29FbFRzVWhVd1RPWWdDT0hPaTNnR3IvTU1sZFVlaURD?=
 =?utf-8?B?Y2lWcXp0UUdUaFFISHRoNkJabk5mRWJxUVdKek9sU2poejlqRWdBSks3OEdx?=
 =?utf-8?B?cHlxYTZERnl5R21UcFZzc1NkNzdLelhOUlliellBdExTZVNWRm9vYTZDZHpy?=
 =?utf-8?B?K2xubEZURmRZTG92SkhHOXZMNVR2eGE4ZFlrN3Q1ZHlrSlpJd0Q2Uk52VGFl?=
 =?utf-8?B?NUhVQ1V5WlRBQWY2b0g4dUJmU3lQZGRMWit2VTJySklzM0UvT2FIcjg5d2Zm?=
 =?utf-8?B?eElnNkptUVgvTWJzQ2I0U1RUNFk0MGR5ajNYZUpUcUgzR1FrUnJtbzZnLytV?=
 =?utf-8?B?RWs2dmFhNzNRSmJKTjlNNGNub004a29OY2VGUlJINEFlcm9DUmdReDF4MzdY?=
 =?utf-8?B?ejQyRVc0TGpGODZySEl1Q3ZMTFFjT2V1cVoxZytNbkVhcmVySVlnQzNBa0pI?=
 =?utf-8?B?T3hJdTFmbWVBSWtpUS96YzRMclowS2IrL0kvZklJcHMzOG1yeEtibCtWUTNx?=
 =?utf-8?B?L0RVN0JpeGpVeFBNa0dURHExWlpLZjA2Q015SHM3WS9JZ2x3aUsreTkvZHkw?=
 =?utf-8?B?ektjZmh2UkViV1R4ZkNoR09rSU1pbmQ3U3RxanoxbGM0dUtpbmdiWkk4REVu?=
 =?utf-8?B?V25ZcXovRi9LSEZuc1g1UUhjUFI1S2IrbFRFMHkrTTBmUmc3L09tajc4Qzl0?=
 =?utf-8?B?Sk45YThQdUh5cjI1YXRJcFpJQS9TcC83YlhzTFp0aXVjQjFIZnlqQXBmNm8v?=
 =?utf-8?B?VnVLRjBtSkUrZ1Jta05vZi8vL3V6WStOandlWkttcGJJR0ZpczJaZ0FDNC9r?=
 =?utf-8?B?d3NGQ2ViRU1RR2tsU3gwdnk3NHNoQTJGWi85cDhnd3NhOFBBWStsQmhVZzVu?=
 =?utf-8?B?Zi9aUCtTTmxrUDB0Ky91WVlpQW9HUURxV2JFNFZzTmRVN29mT2o0MEtIT1l2?=
 =?utf-8?B?RkpoTW14K21xRGE0elk1a3V2ZkwrNmN4eloxT0ljY0MyMDJmT3NzK2VwazVC?=
 =?utf-8?B?OFdpVDJpaGZ3RGRwVnhSRXQvaTI1M3gwTFlQcnlKL1k4Qzk2WEZmOVY0Lysw?=
 =?utf-8?B?a0FZQTZmeXU0QjZ6UFFYVWF5NTljcHQ2NWZpWGtQQ3pNNGhXdGEzQUVQc2s5?=
 =?utf-8?B?R2hrcFdKTFFYaWVKYTJuWG1KZmRZMnZiR3dxM3Bsa2dUY2JxU2g5MzM4RHhQ?=
 =?utf-8?B?TFdkRlgzOHcwU1FkeC8xQU9tSm03bXlTZDd1M0JWczZKdTVOT01SRFZCZ2JB?=
 =?utf-8?B?ems4ZmxLUGZ2SGxkNCtuZDB4dVNwWktORkk5TTJGRk8rWjVBcHRZQUY2RWps?=
 =?utf-8?B?amw2MU9PZ1ZIZHV6OEo4S2pJaklYMURUM1lTby9nVG1mRlp6TkZCcUlmQ3lJ?=
 =?utf-8?B?VmhCWm5QcW1KV1NuVXdXSEdkS3NibGVzTDV3TXNpUHFzcXNZQWZtUDNOd1hU?=
 =?utf-8?B?eVJCYW9HWFNqRzR2bWl4QXNEZXpWYzNHM0VSUXZKOG1lZXBSUGpPc2dUczI2?=
 =?utf-8?B?NUJ1QTRpZzg0dVZ3MG5PRGZhNnZhT3I1NDN3SEcxZkdtSGRXR21senF5dzNq?=
 =?utf-8?B?a0xvT1ltMkVFWUZPMVRQQm5RUEZVTUNRMGxOTzhsMkExSG9iQXlIaGtiVGVX?=
 =?utf-8?Q?D66k6tnH1UETjhFj1rBqpo9MK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3cd9f5-0621-4291-51ac-08dc0dafa5fc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 05:32:03.8526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2ZYm+8RRYQoUQTZKNxFG31+9rEqA3UvKoh05Hc7yrlpx5CPyeNi5g5QgYkHTxjkK/dfenoJubi+lxGlNT6d5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6691
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

Hi Aravind

Thanks for the review.

On 1/4/2024 10:34 AM, Aravind Iddamsetty wrote:
> 
> On 12/22/23 13:15, Riana Tauro wrote:
>> Move user engine class <-> hw engine class to function
>> calls so that it can be used in different files.
>>
>> No functional changes.
>>
>> v2: change array to function
>> v3: rebase
>>      add header xe_drm
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c | 19 ++---------
>>   drivers/gpu/drm/xe/xe_hw_engine.c  | 51 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hw_engine.h  |  3 ++
>>   drivers/gpu/drm/xe/xe_query.c      | 23 ++------------
>>   4 files changed, 58 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 44fe8097b7cd..366f5714c6f7 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -482,31 +482,16 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>>   	return 0;
>>   }
>>   
>> -static const enum xe_engine_class user_to_xe_engine_class[] = {
>> -	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
>> -	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
>> -	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
>> -	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>> -	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
>> -};
>> -
>>   static struct xe_hw_engine *
>>   find_hw_engine(struct xe_device *xe,
>>   	       struct drm_xe_engine_class_instance eci)
>>   {
>> -	u32 idx;
>> -
>> -	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
>> -		return NULL;
>>   
>>   	if (eci.gt_id >= xe->info.gt_count)
>>   		return NULL;
>>   
>> -	idx = array_index_nospec(eci.engine_class,
>> -				 ARRAY_SIZE(user_to_xe_engine_class));
>> -
>>   	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
>> -			       user_to_xe_engine_class[idx],
>> +			       xe_hw_engine_from_user_class(eci.engine_class),
>>   			       eci.engine_instance, true);
> 
> in xe_gt_hw_engine introduce a check at the beginning for hw_engine_class and return NULL if it
> is XE_ENGINE_CLASS_MAX, so that we can skip for_each_hw_engine.
Sure. Will add this
>>   }
>>   
>> @@ -532,7 +517,7 @@ static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
>>   			continue;
>>   
>>   		if (hwe->class ==
>> -		    user_to_xe_engine_class[DRM_XE_ENGINE_CLASS_COPY])
>> +		    xe_hw_engine_from_user_class(DRM_XE_ENGINE_CLASS_COPY))
>>   			logical_mask |= BIT(hwe->logical_instance);
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 832989c83a25..ab78019b44ff 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -6,6 +6,7 @@
>>   #include "xe_hw_engine.h"
>>   
>>   #include <drm/drm_managed.h>
>> +#include <drm/xe_drm.h>
>>   
>>   #include "regs/xe_engine_regs.h"
>>   #include "regs/xe_gt_regs.h"
>> @@ -290,6 +291,56 @@ static u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
>>   	return xe_mmio_read32(hwe->gt, reg);
>>   }
>>   
>> +/**
>> + * xe_hw_engine_to_user_class - converts xe hw engine to user engine class
>> + * @engine_class: hw engine class
>> + *
>> + * Returns: user engine class on success, -1 on error
>> + */
>> +u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class)
>> +{
>> +	switch (engine_class) {
>> +	case XE_ENGINE_CLASS_RENDER:
>> +		return DRM_XE_ENGINE_CLASS_RENDER;
>> +	case XE_ENGINE_CLASS_COPY:
>> +		return DRM_XE_ENGINE_CLASS_COPY;
>> +	case XE_ENGINE_CLASS_VIDEO_DECODE:
>> +		return DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
>> +	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
>> +		return DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
>> +	case XE_ENGINE_CLASS_COMPUTE:
>> +		return DRM_XE_ENGINE_CLASS_COMPUTE;
>> +	default:
>> +		XE_WARN_ON(engine_class);
>> +		return -1;
>> +	}
>> +}
>> +
>> +/**
>> + * xe_hw_engine_from_user_class - converts xe user engine class to hw engine class
>> + * @engine_class: user engine class
>> + *
>> + * Returns: hw engine class on success
>> + */
>> +enum xe_engine_class xe_hw_engine_from_user_class(u16 engine_class)
>> +{
>> +	switch (engine_class) {
>> +	case DRM_XE_ENGINE_CLASS_RENDER:
>> +		return XE_ENGINE_CLASS_RENDER;
>> +	case DRM_XE_ENGINE_CLASS_COPY:
>> +		return XE_ENGINE_CLASS_COPY;
>> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
>> +		return XE_ENGINE_CLASS_VIDEO_DECODE;
>> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
>> +		return XE_ENGINE_CLASS_VIDEO_ENHANCE;
>> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
>> +		return XE_ENGINE_CLASS_COMPUTE;
>> +	default:
>> +		XE_WARN_ON(engine_class);
>> +		return XE_ENGINE_CLASS_MAX;
>> +	}
>> +}
>> +
>>   void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>>   {
>>   	u32 ccs_mask =
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>> index 71968ee2f600..89ca96063644 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>> @@ -62,6 +62,9 @@ void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
>>   void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
>>   
>>   bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
>> +enum xe_engine_class xe_hw_engine_from_user_class(u16 engine_class);
>> +u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class);
>> +
>>   static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>>   {
>>   	return hwe->name;
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index 9b35673b286c..d4793e79e283 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -22,22 +22,6 @@
>>   #include "xe_mmio.h"
>>   #include "xe_ttm_vram_mgr.h"
>>   
>> -static const u16 xe_to_user_engine_class[] = {
>> -	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
>> -	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
>> -	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
>> -	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
>> -	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
>> -};
>> -
>> -static const enum xe_engine_class user_to_xe_engine_class[] = {
>> -	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
>> -	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
>> -	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
>> -	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>> -	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
>> -};
>> -
>>   static size_t calc_hw_engine_info_size(struct xe_device *xe)
>>   {
>>   	struct xe_hw_engine *hwe;
>> @@ -139,10 +123,7 @@ query_engine_cycles(struct xe_device *xe,
>>   	if (!gt)
>>   		return -EINVAL;
>>   
>> -	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
>> -		return -EINVAL;
>> -
>> -	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
>> +	hwe = xe_gt_hw_engine(gt, xe_hw_engine_from_user_class(eci->engine_class),
>>   			      eci->engine_instance, true);
> 
> looks like this changed, may be rebase on latest.
query_engine_cycles still has this function. rebased on latest
>>   	if (!hwe)
>>   		return -EINVAL;
>> @@ -208,7 +189,7 @@ static int query_engines(struct xe_device *xe,
>>   				continue;
>>   
>>   			engines->engines[i].instance.engine_class =
>> -				xe_to_user_engine_class[hwe->class];
>> +				xe_hw_engine_to_user_class(hwe->class);
>>   			engines->engines[i].instance.engine_instance =
>>   				hwe->logical_instance;
>>   			engines->engines[i].instance.gt_id = gt->info.id;
> 
> with that addressed Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> 
> Regards,
> Aravind.
Thanks
Riana
