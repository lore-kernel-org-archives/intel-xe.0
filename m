Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB127C54E67
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 19:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D1F10EECD;
	Tue, 26 Mar 2024 19:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RNzo8C5H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4C910EECD
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 19:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711482614; x=1743018614;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=09CJaTcDc0lGv9Xok/pBza1SIz6Pk6HrD9e6vd7fm5s=;
 b=RNzo8C5HOGIjU3LxJwuB8toGkmeY3Csunwbpr5624f+OnuibAV8hVHJD
 Q1+WxcUV7uPuVi69QK3XIf3hT+CgShOoWmrC+ab2WyrIozftUCz/JkWSE
 8FoHzPgCZFbsuvm75ZcYzRmBqMeQwOn1CyIDHYd11tO6HwbcEkUg8oYKz
 5n+qFPm1q4WGbjVH461RlYT0ycQcZnnIkVpFQZa4mfyeHF9HWD4d1K5IY
 6eh0n6ZvHma2uttNQ+XQHJJyD3m8mqej3oR9Y98YghDYaczTowylLwTM0
 MAwoBfIpoAtO9EnApmKTCYF0nR9GJ3TVQ3ISKhqpwZm3aMRsBEz/CyUQQ Q==;
X-CSE-ConnectionGUID: VxTehLLqSs2AiETSdTFucw==
X-CSE-MsgGUID: 76l4SCTHTKGQw71JYVxPDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17699575"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17699575"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 12:50:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="16719274"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 12:50:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 12:50:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 12:50:07 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 12:50:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOy0bf45gTBUHXd8yPmMaAckrTyMdKK0z4BUi4gzuYe7I6vH+MzxIwMWNrpzWCvtyMpNULFSCION3NH0ReDUpEa+zDnW2V23C/jz3/a/o+PLOUkmydpvBScH2kFN1EQ2SWS1mImPgAZWwBDCPL4wTGlUgOkQu+nHKra8Qp1R6sQRy2RYBSCyjGP32inaL6Z3A03robIEzQzMiiX5i+1im1JrWqu97fP5wuDmeXOX0lBizRYTYimebZ3sopgq64VNBfA4rxvI/ioqKkJkJOWLZ16QOocygpfP8Vbxg3A/4R1As6trRi0sQax9FnlCCCqeMqSp9VT0MjRksT9LPRGeJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uO16NJ4IDYnAji3Mk/4uEi2BP6zGJrp7jE8q9J3BaFM=;
 b=XArvTi7Jl2rr+ED9VqUhg6+ecpuveMOUZX88EcCw+f9Qe1aEn4o/LM2aTsgxRgxXubv987ikGhYBMZPrf+8NGlY9XQifb53jGMNifBauPP5FY5K9HN0hyQKSkAVWLaK+8TFrs2ytl06C50rtD5hWvYEbs5CGrrZevg80d802aMaTE8ecx/6NbKq7VHrxnisTclP4/Rd3F1vxuMNQsTjHNjqdmc6+U9npuiaV5O+kSkiCbo5BRTotFdOsQFdcrDlOgOSXOojDEW92sDUqh454co89jw/rXy7ulP/mn5pOPWBu4cdGt01odU0uoqUE7kiXHr8exdukLVmFcA0hpIjC3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by BL1PR11MB5956.namprd11.prod.outlook.com (2603:10b6:208:387::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Tue, 26 Mar
 2024 19:50:00 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::a2d7:1d52:5a1c:88d]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::a2d7:1d52:5a1c:88d%4]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 19:50:00 +0000
Message-ID: <405708bd-7534-44ba-9ec9-9aaead4fea0b@intel.com>
Date: Tue, 26 Mar 2024 12:49:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/xe/xe2: Send flat_ccs value in struct
 drm_xe_query_config
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <zbigniew.kempczynski@intel.com>
References: <cover.1711447408.git.akshata.jahagirdar@intel.com>
 <b672be6eea948e332ba58b63d6f8c4c71c37a42b.1711447408.git.akshata.jahagirdar@intel.com>
 <f2e72896-8524-44a5-bb75-ff277c50eaa6@intel.com>
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <f2e72896-8524-44a5-bb75-ff277c50eaa6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:303:b7::31) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|BL1PR11MB5956:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7QblJvSeSBAMJq5exvXVtU7r/p8Tht2aVW1u2nIlYC35BGqtaZcyhkBQkjCB7nP8eOpYZb5Up6x57508PTECQ16RHw9YnRdBgp9hiVlEGM7/ZZaeZL5150Pl6GFWcY/LrjB8D03kPase+IeyRphIULjEZNrHTj2gBAIVjr5UBUMyhE2/DImV9+4LdRQfgWy9T+DnH5viE3qnx794bNQ/epDBiSso+m8jdhB0bkudVDwUCspEiW778+3WSL9dBugpI4gvyHXADYUPqbFzuWTSvzu6TP8iYRqoqDGzBsb53n59pGlFjz3fCrj8aKb426054iZ6gfyO2cIdTKCwFPJLGKoU3pntj6hcYSo/MhnI3OPonsq76jJXMiMowsrAyc5p0JXrUmTD7qQoUMkhdfpslgb/UNfdebXk6Apn5ju8jpG0jzWPTTCVIXIgr8YQmNKOZra6AfdwJTVheb5MoCpwxkJAVVjZaviCqffy3MAYbpwSZG5hO8Vm+WUAbrOkTJouCk/Aq0CB4iNk4YyM7n2+xV2x3YORW3M2Qw0LaaJsCbtq16KomTyG+QcMeFVXWjDhrzZCV/48w3hf9CikuGz3iBrDZ9BXJv+V51aK6tTalyXsDhsePIDonABPN5xELde/LAv1hxsqI7gpQjGbfYHIyeH4rJEmBWa9ANaxgNv4vq8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVpFSXBaYTBiQ1N0Z2Y1RE91dkJTdVp0NXE4dDN0Nkl2SEM1aXQxMzEyUDF3?=
 =?utf-8?B?ZTJOTnI1L3BzSzZhWHZ0cUYrRHpSVEVLdkRac1N0aTdOcU50MW05NUo0cFRp?=
 =?utf-8?B?YkNJUXE4K3lwVWNSQytPODU2OTYzekhXYmIxSEI1OS9MYllqbnZZRlF2dUdU?=
 =?utf-8?B?dzdpNGxCTFR0YVJzd3ozcU1tR3E0SkdaQTU4MEZ4R0IzbWhUcEFqNlZTK1Rs?=
 =?utf-8?B?Yml0NWVpcThseGorbFNjUEJJaTNDZ2tqS0F0ak5wNE5KelhheHhMWjZLcXdO?=
 =?utf-8?B?eEhsU0JWVTdVendpLzRoVmV0N1Z5WlM2VjVqdEJuZVU5aFhNYnRseldWOXRj?=
 =?utf-8?B?L0MxVkswTlJoRW9sL3JDQWpIN2M2cjVUQWFXS2hPNjZXL3hGTW9Ga0ZPZGpz?=
 =?utf-8?B?eEYzRndNTFhia0Y1Q2FBVVoySGp4Mkt4dWVmYklpMDEzS1lqZW5GczBuWGw4?=
 =?utf-8?B?eFM5WEM2ZWRtM3ltZHJQdm1YSjVpQjNiNHdNWFhYdy9WQWJvYVhWdldnTTM1?=
 =?utf-8?B?V2czUGx6SE53Y2VicEFYQmt6NTJjTGdHNUlqdWthcUV3RWhWUkVwYVhYZ3Y3?=
 =?utf-8?B?MTBYcVVSUkwzbUpVRlZlM3ZGR0VwYldtbG1FYmxWNDBScnBNRXBHUHdjWTRY?=
 =?utf-8?B?N21DOTlmSFBoMGxGc2I1V29SMFpGZUhSSk0rNTVMYVh0SkdDaTR4ZnU2THpr?=
 =?utf-8?B?bFh4UDRrTVNkYkVVRGkvQnV1YjFIR1l5WWdrMTNNVXgzRU1keFNUaEduWmRh?=
 =?utf-8?B?eURiUEoxVkJmN1Y0WCtRQVZsaGFrUEpjRXI5Y2VXeUxNRDdYUDBBUHo1Qjk3?=
 =?utf-8?B?Nnh6OFhwUWtvc28yTVFYWnpQU1lEQWNmd3ZzdUlYZHliNXhSd3lHOFNUWUN1?=
 =?utf-8?B?TXU2RFZsK1FIakx5TFd4U1lieVhBSHhSU0Z2QTluaGExR2tuTWpYNGRWY2Js?=
 =?utf-8?B?M1pZeTBMTG41eTIwV3BGVzQzY0dtdndpOEM2R2E1UU4rcGlPd2c3bVdCemdx?=
 =?utf-8?B?enM2bTVyd1JQbWFQd2owTnphMmZKVVQzR3oxeDZZWGlwNEtnV21ONU5ZVllH?=
 =?utf-8?B?MEVtQ00wQUZLWVZFSTFwZGllMk9nU0ViM0c5ZTFidk90R3Vtb1BVbkJnajJa?=
 =?utf-8?B?ODVjS29BLzZaS0NzakIvSkF0ekVuejJTSy80UUQ5SkltOXNJTFBnNnRlZ3l3?=
 =?utf-8?B?WVhYZWpjQzNCQTRJMTA4SThnYW8rUU9YWTdPZTFNcVpxMlh2cDY0MWhTdURx?=
 =?utf-8?B?VGNBdnUyUkQrdnRrdENwekVzcW84Uml2MVhyaHJpa3J3aUtHaVowN1JrcTlM?=
 =?utf-8?B?bkxMbjVpYkw4Y25ScjcrZVRyVGNHYm11NUpXU2hLNjdRUmhqUUhlQU96bG92?=
 =?utf-8?B?QlRFcEs0NjY3OGtOei8zTU11cHlEZjc1ZGNuS3ZYcTMvdTVuclZWVmlsRWZt?=
 =?utf-8?B?Z3lRZHA0aHl5RWQ0VXBiZUxyelRPd2FhQzc1TS9DQmJUTi92bWhHb0hPbW9P?=
 =?utf-8?B?bWZjQ09RdUhkTnM1dXFIRTRGOVRtSXp4NzVDa2hCVnM5elBNdWhhOTdHcURK?=
 =?utf-8?B?dmswVThvSEh6QzFUSlZIZUVCcGZWSkI0WlhBL0J3UUdNdThzVFVjM3k1YkxP?=
 =?utf-8?B?a1ppSHh1V0VTVmxTWjRGWW41RmVrekhNb3QwaXR2OUwxQmVYazkxSnlsM09E?=
 =?utf-8?B?RVR3R2wwR0FmWUc0QmFiUG5qZXN4ZjMwOE5YNmVoRlM5cDhpcDRkMTU5aGpj?=
 =?utf-8?B?cXpsMFNmc0lSQnNuQXN6MTRMemU1MHZWcUgyRzc5S25uZHNQMFdNclZPZTVZ?=
 =?utf-8?B?MERpN1BnQnQyT3lXVHF5azkrQk1UODdybE9EZnd2Z2pyVWRwZnZKZ1ZFYWxS?=
 =?utf-8?B?LzR4cm95VGRTd2Jzb3dtRURnQUFzTVYrd3J1bXdVQUJWQ1psS0RLenRnYW5S?=
 =?utf-8?B?YmY3UEdKSWJ6QUIwRTdQNFYvSHp5N1NMK1ZaSlBNeVRzL2h3R1pzQi82SER3?=
 =?utf-8?B?WCtrdDBNNnIxOVZMT1VXZWd0ZFQyZmFTcDhjWmZJeWdsZzNtNXptUVNmZ1Uw?=
 =?utf-8?B?WEFSdWFIK01XSHJ6VnptTGtNaHFhcHNzVXJscVNGNFQ5RGFLdnZGMVNVSmpx?=
 =?utf-8?B?bmtscHNXUUp0OUFqV3RjN1ZWR01HejQyWm1RZnpGRVduR0h0MzE0K2FWMWpl?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30099209-1271-4154-521a-08dc4dcdebc1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 19:49:59.9670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJUMUTq4cRbMUglOG2rnvc34qsW2GkNdAIjp9WxorimfWgfr74ng7n6t9Pyoy/RSS3DxYMuZhdh0r5GPjwPBndAPnHYY8Kt1/jKjNq+Rz8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5956
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


On 3/26/2024 1:25 AM, Matthew Auld wrote:
> On 26/03/2024 10:10, Akshata Jahagirdar wrote:
>> Currently, we don't have any check in IGT testcases if platform supports
>> compression or not. Send this flat_ccs value as part of the struct
>> drm_xe_query_config so that we can read this value in the igt testcases
>> and proceed accordingly.
>
> AFAIK it's not valid to add uAPI just for an IGT. uAPI normally needs 
> a real open source user (like Mesa etc) with UMD acks. However if this 
> is going to be used by Mesa etc, how do they tell the difference 
> between "this device doesn't have flat-CCS" and "this KMD version 
> doesn't support FLAG_HAS_FLAT_CCS"?
>
Yeah, maybe we can add some checks using helper functions of debugfs to 
see if the file actually contains "flat-ccs" line.
> If userspace doesn't need this, then other option could be debugfs. Or 
> if this just a single test perhaps we can just dynamically check if 
> the CCS state is zero for compressed buffer at the start of the test?
>
I got your point, I will try to explore the debugfs and other 
suggestions that you provided.

I thought this was a better/cleaner solution than debugfs, but didn't 
realize the actual uAPI use-case here.

Thank you for your review.
-Akshata

>> Fixes: VLK-56136
>>
>> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_query.c | 3 +++
>>   include/uapi/drm/xe_drm.h     | 1 +
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_query.c 
>> b/drivers/gpu/drm/xe/xe_query.c
>> index e80321b34918..8a3a3117491c 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -332,6 +332,9 @@ static int query_config(struct xe_device *xe, 
>> struct drm_xe_device_query *query)
>>       config->num_params = num_params;
>>       config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
>>           xe->info.devid | (xe->info.revid << 16);
>> +    if (xe->info.has_flat_ccs)
>> +        config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
>> +            DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS;
>>       if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>>           config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
>
> This tramples the previous value AFAICT, like when we have VRAM + CCS 
> on DG2. I think we need |= here.
>
>> DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index f44a19ae9333..08783234bae1 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -405,6 +405,7 @@ struct drm_xe_query_config {
>>   #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID    0
>>   #define DRM_XE_QUERY_CONFIG_FLAGS            1
>>       #define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM    (1 << 0)
>> +    #define DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS    (1 << 1)
>>   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT        2
>>   #define DRM_XE_QUERY_CONFIG_VA_BITS            3
>>   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY    4
