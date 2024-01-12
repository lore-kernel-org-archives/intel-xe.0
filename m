Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D309C4707C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 21:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570AB10E0E7;
	Fri, 12 Jan 2024 21:16:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4995310E0E7
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 21:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705094206; x=1736630206;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k6HWNdR8ArAi31zcKruxoYdn4RLk6AHUTWdZY1jiveM=;
 b=C3VV7HfRtCpgui2FMpbuJN5jpoMmvbpvIgrWrxXph/wjekv1J9gZJMdX
 8xj3pKY75MVkqlSATvia02zCFeUOajA9FxVeophFOqGWsEIuqKODJnlAB
 5U2uVR2Ty6Ak22qO7ixs+EANR3kIGGcqBucDFzP/CDuf6oA7fhV2K5wZx
 8MElLQV/z327IiyxGah3uJOkZiNBZc61l14UZpU0u4R33Aco+tKW93NNw
 mvWd4IsEfjJc8d82xXI85fZOl2DbHWhY69mnUXOyG/TvF9P7mdRdUWeO7
 kRzsrCnpvIEHZ1HRLBAqko4RrjfeDK+et3P6BSXO7MGhgoczF0XCyJZPv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6377120"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="6377120"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 13:16:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="31525304"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 13:16:46 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 13:16:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 13:16:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 13:16:44 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 13:16:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwvw7Nwly6r/mcF/LDVEpwE8ru7XyLKTvMz9+YluBBj5UUADzIirW0zw0QUDJMC2jynEzRp/dN5zJmdVoLO+CvvI1mF9BKt8nbzDEZac7DfAPuo9bAXGhLjkOACbrPp6ZIMADb6MN9sIRTljmKyFGwaAvPLZKKS97idFU1CNlgAh2mVbcnqA3p5BYR+HVZ1xUMzJJkD5CsXNpzjupE6YmRj+GbNpr84Yj0US04w8arVmrFdychDLepZq8+khHe0dWHUB2IUXg/SWCbOq3GdaOfMIMnvGYkV8aodKRb90p0DucxTXdovLAXZop5nO42bqqfU/YquvH/ql5dp1YTCftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1h7dwCmLE4KCDRHVOVOHCC/xemY7QU+fHg2pxJGeN8=;
 b=VFC3G9sWX/0fyOe6SzBwq6eZ3AZdYtXmK9r5bGNBxSlOhX5VhiMI+jxxN+67GOaKPveDzDvxAa0SqwmBhdQaWIs/hW9y7N+g3+SE41ncpsEOBO/t0C4ABN2eTxUaZF0WZRIA4SwtQR+QU/0udgt2NJ31LiaRC5wuqUuzI78zf/HAQQfc7/Ke46C9gPwCcDY4Zj7+xRYHucCmm5HbhrM9BRFvCAN1wNuTECvFoMymeo0U5atvAjX5B9qH0n05kHXj3La1Ftjui8+PG/7tmtqcu7waz0L8cH6HCFIEjPQXUgp+RB90SYYtLMTC1hQL7fhQrURLpX84TotkK8QXJLoLxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CH0PR11MB5235.namprd11.prod.outlook.com (2603:10b6:610:e2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 21:16:42 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::e4bf:f84b:b278:8ff3]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::e4bf:f84b:b278:8ff3%4]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 21:16:41 +0000
Message-ID: <867a3d39-3630-415f-a306-b1a4490feb79@intel.com>
Date: Fri, 12 Jan 2024 13:16:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Initialize freq_lock even with skip_guc_pc
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20240112182949.181403-2-matthew.d.roper@intel.com>
 <ZaGqzR8RXWbWolfg@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <ZaGqzR8RXWbWolfg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0054.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::29) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CH0PR11MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ef86a4-dff0-451e-dc6e-08dc13b3c5b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IZ3DDsRYeSYSwnIfgwBVujMM8i4yzBd8aXY1rHy4kYd3konMSAnRgYwa35i67bGDTbZNu9SvEDQptsXwGQMef5Al2PktHoIERhHVAyaC0jsEIJRPwZwY4YS7Zq35coyHAGybOz2kAP/qRN8KmndjGkfCUHjzCQWKQEF5QRz5Kf20Zq66i+M+8wxiIkBbT9zEZkz2zqKaKFq1SyXrmhCWaawon1shq8Z2O9T/BF6cslEVRDbzW+Oxrc6OO7/dBLZld73CY7kiiITydiQkPkZtmw8DXtjDI0/jK7/wQBxEGT4Pb8qExaF9cut242qCxvKcSEfdCj9BfiHZY00xi3E5J9nqKeddOsrMAKr6fDBTTAkWEE5HoTd+e9tr6qCY6qAmk5EVwOl2KKXtX2bQ/O/d3aJYQPvIDKQvU0oXcRIryurdhvlF+nYBEuAepo3R0OtgeTMkK4Fg/fLo45Rh6yTgEAlXmEf4xp4h2N2gjq3rs1OlKKwmJv1VCoTzSXPmfMDLtK0OYrmYH26VRNK4YQA8RoVd91u7xJJqAx3ODYjmqlGI8U/3WEL5pKO/3HpevbSMrNhS8o1MMP+FurYGWac5BOQyYacZ4KexvAkBv30TkqPXUzomCdILIv59mYW6mu1X4zKsLX0fSUk8PH8HO/sEjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(39860400002)(346002)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6486002)(6506007)(6666004)(6512007)(53546011)(26005)(2616005)(36756003)(83380400001)(82960400001)(86362001)(31696002)(38100700002)(41300700001)(478600001)(4326008)(8676002)(5660300002)(8936002)(66946007)(66476007)(66556008)(110136005)(6636002)(31686004)(316002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tzc2NWxBbHVVYzFxN0ZBdjl5c0tRYk1ZTXE5SS9ZVVc1dyttZzVDbC9KQnZM?=
 =?utf-8?B?VUZiZW1oMERaSUVwaTdjWkw4a2w2QTNCRmxNZjJQUUNkNW0rM29GUEtSNTAz?=
 =?utf-8?B?TWt6bDBlLzZMd2pJbStORkpIbUVnblZpdGhDK0k3Ty9Yd2x2NWJ5akU4N2lo?=
 =?utf-8?B?Q2tNaDVvd0hnUkRESWdyald5NmpPdjFjM0kwbUEzank5NWlaaWw0ckUyZ21R?=
 =?utf-8?B?aWdmYkpkUTFocEJRV3dpbVZVeG0vZXlDYzIyeWUyemt4WUUrYngvTFBMejhi?=
 =?utf-8?B?dzIwMXNWZ2V5VVJtVUZQRmVwaXlDMVBmdU1RQmpHRENzQWEzam45Y0xXUU8r?=
 =?utf-8?B?QVhDdndhL1Yrc0dUWVljaWM2a0pZRm44M0sxVktBa2hqcXRKQk1GM3ZjZndX?=
 =?utf-8?B?SytMMCtaemkzdUVZNGVlOGlZL2pHLzJKSng3bXV2RTNHVWVPL25UMkI3V2w1?=
 =?utf-8?B?OXlRNXRIRWVoamtrZFl5OU1QZ1A0MHN2UC9yMzJjSHFuamw1RnhXVnRwMHp1?=
 =?utf-8?B?bGtGWlA0ZmdXd2lDOWcvMkFpb1FJN2hRN1dvNDJUdmpacU1NcHBVOHJNSCt0?=
 =?utf-8?B?MGtsYndkWlpLWWN6bStmdGpteFk0WTNuaGltcTlGWFZ0VStLTk5aMWRRQm92?=
 =?utf-8?B?Q1R1dVFqemN3dzNmdjllSlFFWjM1WlJtUWJmaUQ5b0ZkN2xrZU5PRmIvZStO?=
 =?utf-8?B?aEFkak01N2ZWSmgrU0JjM2ZDc21NUkNjWkd4Vm5jZFpmOGJPM0U2cyt1SjN5?=
 =?utf-8?B?ZkNQdVBkek1RNTZ3eEVKV29sSXdRTk9tZEkwYVhjem9Za3hsQ043WEx5bHhu?=
 =?utf-8?B?b3hzalVTeWhoOExHYWplOVNDejM0aFdWWDVZdklpakRlNnB6RC9ZVjd5cndF?=
 =?utf-8?B?TkQxbDd5SHhsdjFoa0NPdXJjSFFKUjVORkkzakRFNHhNV0RvVFplU1hVbDZG?=
 =?utf-8?B?dytiaDFWclFNazN0OWJHZEsvTjRqN0hXYm00K3RPaXI5WEZkMEJkZVZqMUNW?=
 =?utf-8?B?SFNibDBWTDhuNENPVEw1VXBGVEpNdDk3bWl4R241aEhMTEsrdGd0VHZkek85?=
 =?utf-8?B?M2JqTGJrcHFLWTVGU2xoNkROVmlqYU9ZZFlMUExScVo5b2s0M1p0M21aemJF?=
 =?utf-8?B?THdpVy9EVjJpU2R4NVpJQkRFMnlOVGhDaFgvWU8zdDVNU0hpR2RUdFlLSUQ4?=
 =?utf-8?B?aW9Nalo1eERjV2tmV2xLVmwzK3pheXBkSzdTV1lQd0h2eFVuTGpLL1VTRjR0?=
 =?utf-8?B?VmRiTjVHY3MyWnZvMmJkMDNyRlJqTTZvZGhmZlZ3MHhJNjZaTGRRNnpxZlFi?=
 =?utf-8?B?MDdiTy9sYWZaeGxBR2FEMnk3V0R1RUpxcEx5UU5iN2hUbG11TGVjNUJXSjRQ?=
 =?utf-8?B?aFczNElpT3pvekcweDIvN3J3aEh4SDluR0c5QTNyM0c5ZmYvUGZGcHN5SW05?=
 =?utf-8?B?UHVDc3ZpV0RLUmE5cnVLczh2dmhTY0lFdVk2eGhMS2VNUHN3ZGtsSVVmTHlI?=
 =?utf-8?B?ZFVmeldjZi93M1VPU2F3L0ZCeEZCUUtyQld1RFNMeDF0VmVVRGdZZDZTLzB2?=
 =?utf-8?B?aW5DMm02U3pCcXNGVXFVTHoyLzJicHhRSUhWbkk2OWpvU2Ftc3ZhWm4yU0JN?=
 =?utf-8?B?NXRSY1NKUXQ5bTI5RkpQU1kxc3dSMW1jdjhaOHVzWVNWQ2JaQ2FoNmsrSFJs?=
 =?utf-8?B?L0NQQ0M1ZUtycmhzRlNXV3BFTnFabFJCUGhZVUZnR1BDSnR6RlJxYzdFWkY0?=
 =?utf-8?B?cWdxQUduekZBYmR4TmE5cncvYjc2MDNDQnlJbS82cXpMdXhmZ25sQXUxWE5y?=
 =?utf-8?B?Q3R3U214emFhREVkb2J6cjdDeWpPRXFZR3drblFyK1dqZy9Wa0tLVkl5anly?=
 =?utf-8?B?cjlOM3dZaEVwSllzRUQ4TUcwcVovOG4vNHV2WFh0S3JlMHVDYTVOdHcxbTVC?=
 =?utf-8?B?ZjVmT2gvdjNZRVAvWmtmcEpKa3FQSVNLUzhtbUdpc2tYQ2JLMzkxVzdKazRm?=
 =?utf-8?B?ZTlrK1pDTmVNMzJNdng3V08ycDdTWXdVTVgwSEpMUWsyZU94ZS83cXFCeE1M?=
 =?utf-8?B?cTZqRy9ZeFRZd1F0cmp0cmtmajNVMGZEYnNLdzhIWnRBN0U3cWhUUEQvY3k1?=
 =?utf-8?B?OUpvQnNpSjd2TFRKVk9rbzhwaldHUkJjYmE0UFY5cXVGTmZVRzUyWU1STVdw?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ef86a4-dff0-451e-dc6e-08dc13b3c5b5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 21:16:41.8678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vFwfD4zwelJpiBYCvwBDRTjHUtKrX4uTylVJfHpX2Hom3F2c6Deg2QpiUR3dF+Bc+g8Y2pp1++WMS3LsAIN3PWZZSulGGVgbfEhYZCqxejg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5235
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 1/12/2024 1:10 PM, Rodrigo Vivi wrote:
> On Fri, Jan 12, 2024 at 10:29:50AM -0800, Matt Roper wrote:
>> gucpc isn't initialized when skip_guc_pc is used, but some of the sysfs
>> frequency entries still try to grab the uninitialized frequency mutex
>> before realizing that they need to bail out.  Tweak the init/fini code
>> flows so that the mutex is always initialized properly.
> hmmm... good catch.
> But I honestly don't believe we should be calling/running any function
> that is trying to get the freq_lock. If guc pc is skip, why would we try
> to communicate with guc to get or set the freq?
>
> The shared buffers are not set and all. We need a deeper decoupling here.
> Vinay?

Yeah, the frequency related sysfs are definitely not being created when 
skip_guc_pc is set. @Matt, do we know which sysfs entries are causing this?

Thanks,

Vinay.

>
>> Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index f71085228cb3..67ce24fae79d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -964,11 +964,12 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
>>   
>>   	if (xe->info.skip_guc_pc) {
>>   		xe_gt_idle_disable_c6(pc_to_gt(pc));
>> -		return;
>> +		goto out;
>>   	}
>>   
>>   	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>> +out:
>>   	mutex_destroy(&pc->freq_lock);
>>   }
>>   
>> @@ -984,11 +985,11 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>   	struct xe_bo *bo;
>>   	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
>>   
>> -	if (xe->info.skip_guc_pc)
>> -		return 0;
>> -
>>   	mutex_init(&pc->freq_lock);
>>   
>> +	if (xe->info.skip_guc_pc)
>> +		return 0;
>> +
>>   	bo = xe_managed_bo_create_pin_map(xe, tile, size,
>>   					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>>   					  XE_BO_CREATE_GGTT_BIT);
>> -- 
>> 2.43.0
>>
