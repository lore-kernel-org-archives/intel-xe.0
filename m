Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F64FC4828F
	for <intel-xe@archiver.kernel.org>; Fri,  9 Feb 2024 06:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3412710E8B6;
	Fri,  9 Feb 2024 06:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTzdJCFc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC51410E8B6
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Feb 2024 06:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707459915; x=1738995915;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GBpGiM6jaIpx/lEXnAcaw/6oh4OdNzR1pfmO/j8QSJk=;
 b=WTzdJCFc1AXFoxhhpihRtgMzT/37x9CK3u6kuswD5evVu6A+3RjSZOVm
 d7PS+YIfn2CGA9Bg+GX42bmVlUWdZy4WxHRXEjk0n7xao2V8i3M+yzTuC
 Gs/9rxh8NlkvuClHeeAY1I7iFaXWrNtn5AcrvpMrtAUwS0+STpTjkwlNr
 G+hCtFYYD1YbVEwdbuyeuFKUpyEqoD5PycL+jYbeMh9/cZjlNEZgOw99T
 rdVXe1XAo90f+0ybkwk9aksZnBo825WxqpjHweELI90oSyXMxa0y10CY8
 SxmoL658RoVnbB4Y0pTbI/QozOBVEKtCyzfq2cnLbh2gjJpJ1lA0MPRtV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="5197840"
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="5197840"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 22:25:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934349475"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="934349475"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 22:25:13 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 22:25:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 22:25:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 22:25:12 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 22:25:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRmchKa8aYatmdLqa/aEXpdTX7DpnXdhdzIKyZSArRtFG5a+08AoeYPnLzcwMt1pCbSASoyodWNVlGwBb+GChBiUs3+jNKD0B0wo/hjnB8GsBw2P/euYr7Ut5o+FtcXlm+ipTU4tWDB2BNQKz/YE/Tj40SHWK4Y+YU8GCtAUIz+szGnEFMUgCOWCBT7/gti42ODa+wvVrDVgIIA18Kam+Ek45fwk90LQh2qZPnru3NMxOJik7xJphZiUuGDoSmzJEIn4DbKvZyrF7A1A0ijTIjUSnkht+pmp5q7a0i2RvUslTqxVPFAr1lRNn4QEF81sdyhPB3FBmfD4HUS3JgdcKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Wq3Rq3Nr47Yx2JwYNqOhjHmD9+FK53D7zPdIA+NuxU=;
 b=L0aK6qaRl6b4VWXJYd1fyHmF1TVp9NCB8RgyHJ4SievD2P7BW/cYT7CEAM16OjTR+7Si3z4WRbQZ5r0Vejw/cgx6cW0NEynRyyzGpiMZJBUM/e11XJ3b3PVDM79xVPjy0BmvvfjJfNQ2Hv3/Kkd+soX9VgsYVnxtOr03zIF2IiBzWbiC9qWI4AeWVQAiX+od7GWG886WG9P0UN5jObVvhHzR3zEoRDCO4F0Z2Irm8ZQEttYHUuNCPmMHV9rldz8s3K//xUAWr1hfcGE3MmBUoPExirWVeG5q7YzNpi3ZWGISxsTbsCVAAsoqM6RxN4qzyu3CXrL6SH+oLXQw9Wu1Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Fri, 9 Feb
 2024 06:25:09 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::85a8:9b9b:5e2f:9431]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::85a8:9b9b:5e2f:9431%4]) with mapi id 15.20.7249.035; Fri, 9 Feb 2024
 06:25:09 +0000
Message-ID: <19f2c829-9055-4cd5-855a-6fc7f151f63f@intel.com>
Date: Fri, 9 Feb 2024 08:25:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] drm/xe/oa/uapi: Define and parse OA stream
 properties
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
References: <20240208054916.3788133-1-ashutosh.dixit@intel.com>
 <20240208054916.3788133-7-ashutosh.dixit@intel.com>
 <1c3fef48-f59b-440a-bfb7-275fb5f5d57d@intel.com>
 <857cjewq1s.wl-ashutosh.dixit@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <857cjewq1s.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::11) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|BL3PR11MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a03eed-bffb-4cd1-09c5-08dc2937dd5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JlMNzB9UpffB8gMqlBUQUPCNL4CYlMcj15edLsEMMt2hlyjj1ZSLf7cbmBZO8q6iTuxFw3ax6WbQM4bSyEp1GS5iSMiNsWA/w8UFutSapz7mYwuGL8/3sbNc9ZOeMTE+k50YgjME/hCFud6CvHrIFUgGuUwvmde/kmK112tM6LAY69Ker5XK6KrbQkGDuhLIpyOXIkoW+00ZNpWYykVNiVS1QJPevBVgqPf471qMxjsNsHX//JUBo9PZIsJa9rSKqaUw+2/5/TxcV5fqEu4HFBNz+fXDwj5weVD/2onhTq4xlgzrWGoCh0XQcVgd4crxN/ZbwNJqC8APBkR+EwxvwcW9RjSO5F84RndB+pj9JpfnbA/7RXwJFsh3Df/hE8xtrf6znSWJK64wGnS5oWcW5rAuZ5vKo++m37I4eK0vVACeUptlLxrYAA0UDaXD+R3np+n6HV4iCPzMfsxYLlmwf+oTC8v3FQHmer70IX/k5715j9J9PJ53y7TKi52PkIOysgpkGtZpXRRRzoY5UNf5YlE9ILmdtKi3lmI4zEKw7Mmjf8E5KqbpEb9EUm1PJlBc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(39860400002)(136003)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(31686004)(2906002)(83380400001)(38100700002)(82960400001)(41300700001)(37006003)(66946007)(316002)(6636002)(26005)(66476007)(66556008)(31696002)(86362001)(8936002)(8676002)(6862004)(4326008)(2616005)(6506007)(5660300002)(6666004)(6512007)(53546011)(107886003)(6486002)(478600001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1ZXTEREQ25TQ2NHMWdrSW5iVmU0NWZ5aTRKWTR5cjhpWUprd1lwUEZyUjli?=
 =?utf-8?B?RFNSY2kwem9Bd1RqYXdHMFdtcWJNRjUyOEpOYkpJVjlodlNuT0RwcytRaTFE?=
 =?utf-8?B?UWZNZ2JndlZLRkRVRVdkZUx1K1JFanhUZFVZa2xoN2U3QW9OMFJ2YjZtVUxl?=
 =?utf-8?B?ZmFONStia1czT0RkeTk2blBabnRpaGVDWGRJUDZPWjllWUxTb241U3ZpZmtq?=
 =?utf-8?B?SEVWVHlhcnJBWllWbWEraksxODBTSy9nc0p6c0ticStTSk1UQUREM1BLaCt1?=
 =?utf-8?B?SlE3YTNvRDV0REJ1clR0Zkp6QVo4OWd3VjFIS2VRWXZ4azBlWmo1aUdzRmlJ?=
 =?utf-8?B?UlJtQVJRWVBBSUNBalZMYnFUL252OVJKaDFSR0ZabmsyQ3J1c1hZVTJZUitx?=
 =?utf-8?B?bVQ4SW5GUXNCaFUycEIrWG10TW5qak1vQUdpbjl4cndJc3I1Z0NQRmhZSkxF?=
 =?utf-8?B?LzNnaVE2RlJHSXdjUlNtSXpzOHFZT3g3UWtQL0VJcWl6Y3J6Zk1ndCtNUzlQ?=
 =?utf-8?B?RlJMZW00K3FrNWFjMFJRMXNheklndzZVUjl4eDZ3Ujc1dG5DdWVIam1RT1ZE?=
 =?utf-8?B?MTJLcXZSemFva1c4a2xPRUFQZS81UFFhd0REczdTbkFJTjhBQzE3cU9EN3Iy?=
 =?utf-8?B?SnpGSFVnUjJ3cCs4L0Z2TDdJdHgxWlk2aG1nMDQ2RnJZbEwyNXhMVHIzSVB1?=
 =?utf-8?B?QTJtbWdiOWI0QmVINjlGMGdxd0RFTjg4UjZzeEZsaTVLbW1jVUZjSnhIcXIw?=
 =?utf-8?B?cEt2YkIzdWdrLyszSWh0ZS9mOUpLSUhSNktqWHJkcVNZUyttbXkvNk00RGZY?=
 =?utf-8?B?aXgyUUY3NExNOEU2WkJFcUZWSkhRRTRHSHB6Y2dscTF2Sm1ySlJFbzZCSzNk?=
 =?utf-8?B?TTVOZ29nYVdhRzZmQjZYc3F0YWZxSjlBamRUYlhuYmpCN1R3OFpmODV1Vk0x?=
 =?utf-8?B?cmJ6S1hET2ZTUXR5UFlTZ0JuOENuMzVLQnE3UXJBRTc1YlYzbjBXeUtTVXN2?=
 =?utf-8?B?KzBuQUFIelFWclVyc0w0VUpJcDV0WFZnNVZ0eVNGdlhvTE82RGYvZi90MnFh?=
 =?utf-8?B?b3NYd3E3VktYRTc0Y3hDWmNTL2lCNDdqY3J2dlNSUTlkVG96ZWJrWGFOWU9X?=
 =?utf-8?B?cEYrblZ2R2JocTJvQTBaNE56YlFEU0V0TlFyRUR4dVdIR05WbStkdmJMYWdk?=
 =?utf-8?B?d1J3TSt4alZ5cGZSaU5XREt2bDM5K2kvQ3hWdm5YVFpTYTMyRDhOMXd3Nlpq?=
 =?utf-8?B?dkx4Tno0UjdpQWxycDBMRTdGc1lKamZ2TDhUMnQvZlo2b3hGVk9qRDBTdjBW?=
 =?utf-8?B?QmZKODhZdDczTWZVOEczdUhHNC8vVnVzMnpVSXhLcnRySHB4V25Zd0JhSU16?=
 =?utf-8?B?K2h3TmF6YnJsNmprcVJlWkFzZ1VEaU1oTnpXQlprTnNDZ3JXU043WitEVXpz?=
 =?utf-8?B?R0N4aW5ONXdnUFhjakVWdDdpa2ltMjRkK2hzbW93RFZ2TFUveWE0TlNJK0V0?=
 =?utf-8?B?UkdSdTEzSnlxNGlVR0lYUVRqWjlRMGlkeHVOMVZZWGhnSkFBamhNQ3ZKTTAx?=
 =?utf-8?B?dDE2WjV0dWxHaWtBQTNWYjN0WkRWZ1htYlNFYXI0M1ZNV3JCNUZ1SEMvUXc5?=
 =?utf-8?B?Ynd2TXd1M21XVmlVSkt6OHE2R2hVd3NiZGt4MzZtZ29vaDNNTWwwOGk1Yk5V?=
 =?utf-8?B?c3grS1ZUeW5aNzFmS3dMMkQyVTRJdEI3MFZSYm5UQ09ON0gxWTRaTElnM0Ri?=
 =?utf-8?B?ODh3M0l1c0hMSUtpK2hvYkRKYWFpc3RIUS9iOFZhaHZzOW5sUXJCTHpNbm5k?=
 =?utf-8?B?N3Bwb1JMMTJGNGxWYTBBNXpjTXJLeVM0L29JYVVUcldPUG10RGJWL0dLVnVi?=
 =?utf-8?B?RHk0UjhZQVY1MlNVUFRZN29RQ25JU2VDa1VrZjRhd2VLMGpDUjM1UlE4UHBv?=
 =?utf-8?B?REF2V29HKzRFNzBubnlFeHZjY0lqL3dWTzhqK2tKOE1zdVR0T1JUZ3BNMjZU?=
 =?utf-8?B?OVE5b3djN0gyTkxDQWdiZGtMdkl2YWdiOC8wc3BLMmdGbSszTUR4WitsNENW?=
 =?utf-8?B?Tm9EWkhnSjVMd1Q4UXR5WCtLMGIvWGxzT04rVUlFakZyOWRXNlJMWTFpQ1pl?=
 =?utf-8?B?K2VpVmIzK0lQU2ZmZXVFU1pjMjBwNXFiN2lXb3BaUG9oRHUydE9yUGJadXR5?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a03eed-bffb-4cd1-09c5-08dc2937dd5c
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 06:25:09.5066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqrcyOAmZTR6tdp/JC/graHh0ceKfyv5h0fKIPwCY3qMHotle5gZV8O9kcaJgYR5aXCQhhbe1Z2OwtjD2XLheNnvEcEB6sYlfORHzBG7KAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6410
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

On 09/02/2024 00:26, Dixit, Ashutosh wrote:
> On Thu, 08 Feb 2024 13:40:29 -0800, Lionel Landwerlin wrote:
>
> Hi Lionel,
>
>> +
>> +	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: Perf counter report format */
>> +	DRM_XE_OA_PROPERTY_OA_FORMAT,
>> +	/**
>> +	 * OA_FORMAT's are specified the same way as in Bspec, in terms of
>> +	 * the following quantities: a. enum @drm_xe_oa_format_type
>> +	 * b. Counter select c. Counter size and d. BC report
>> +	 */
>> +#define DRM_XE_OA_FORMAT_MASK_FMT_TYPE		(0xff << 0)
>> +#define DRM_XE_OA_FORMAT_MASK_COUNTER_SEL	(0xff << 8)
>> +#define DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE	(0xff << 16)
>> +#define DRM_XE_OA_FORMAT_MASK_BC_REPORT		(0xff << 24)
>>
>> People outside of Intel don't have access to the BSpec.
> Hmm, I was assuming Bspec is public, at least parts of it. Since we keep
> dropping Bspec references in patch commit messages?
>
>> And since there is no page number either
> Page numbers are in the commit message, but you are right, they should be
> added here.
>
>> , it would just be easier for everybody to say :
>>
>>       "Refer to the oa_formats array in drivers/gpu/drm/xe/xe_oa.c"
> Umesh, what do you think about this? I don't like the idea too much, of
> referring to the internal implementation in the uapi, but if Bspec is not
> public, and we want to keep this uapi, we'll probably need to do this.
>
> Also, we are directly returning the oa_status register in response to
> DRM_XE_PERF_IOCTL_STATUS ioctl (see 'struct drm_xe_oa_stream_status'), so
> that also needs access to Bspec. But there I think we can just document the
> relevant bits in xe_drm.h.


What got me confused is the BC field, which I expected would take some 
non-zero value so Gfx8+ formats (since some of them has B/C counters).

But actually it's zero in xe_oa.c


-Lionel


>
> Thanks.
> --
> Ashutosh


