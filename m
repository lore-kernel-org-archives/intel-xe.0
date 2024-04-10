Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262B1CD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 06:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255681131D1;
	Wed, 10 Apr 2024 06:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNxuYGLh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6263D1131D1
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 06:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712731828; x=1744267828;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gocTuru5poalTmh2VSu0AII0JECB59kWVJUC42C1ISI=;
 b=LNxuYGLhkqH0BRLAOfvL6Mm3wJxroAwTSOUSTw24X2f5B8gB7iGeDY7V
 iEnc2ktXoN0/BVuiRxdxR7H/7dIcjegWiSYkpiQDZu/KysID8EgkLiMtW
 5x2XyQew3hukGeTE6ARhjv7PYatd5T/uRN32QILoygdHsmyx7hAoBGOvx
 IP4YSYeLUAzByuLSlZ7C/h71QyNiCUoIVH66awk7FX8tKcYHqtN/ZJiQO
 QzxDIltagBC4rLpCuDe2yE95/4P3xMFQsA0XtNNJhjJ2UF0vl+fwQS/qd
 VILE8F5idGmJjQb3IU9k7ZiK+xg+rnMxLJGwRFoGVhELqzX7zw9JRM54z Q==;
X-CSE-ConnectionGUID: mylRpm98RkCfXAY6uFoE+Q==
X-CSE-MsgGUID: 6UzHyl+FSgGNg7e4eGiToA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7989872"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7989872"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 23:50:28 -0700
X-CSE-ConnectionGUID: E+/+8PC7TdWDMB44uYN5Vg==
X-CSE-MsgGUID: +uW1ffi8S+2WcjeZ8YsdiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="51427469"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 23:50:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 23:50:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 23:50:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 23:50:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 23:50:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ujkshz4Jn+VQc8K1XQRe6xFBRODWDX+XY9gLsqeG5M4/hZuShlgcQQyrXGW6MvBlQeZILWpst/iwWCn1vBdc54JmLW3tjOIqykCWfz1efSIp+f1fnpcQz5UDpYpMvE/Gx92WqI8Yn+2de+sxYBH4XvybgCBqCWhAe4P403EUvSwQHQuEy6Oe1wE4QpsNY9V9mTodAEw+gh36F76H9lhOysiBv8m4YnKrDVjfMLKOe8bc3vx78UfX7LKQsM9cUU7ERbH6ISvpJ9IcLnN6TRehVCmGPs5WWXkDcKiAw1dGceJI9mdUBBOtfzdaH4TOREUyEhf8BNBJn+H4u5tURpgnDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LO4IanQ/4H2I4no+eosGDC/4w864+Y+mliCT4DjZ6xc=;
 b=k4hnmt0wvj83yo9dnWByJrYw+gq0UDbBNgc2U7LyN3dvz5QCsjsnmH1YhPvndBOGcMcX6M11vLjA2zDOo4fxiZe7yAb8gbIcILE+9JmjyLRI8OI4tpASoxIYHY96KJeFWxMPpMsXD4HHBuBz5oOIkpu/gvn62aB+Uw1/xeJ9F9M9z3XCsDjOLxZGpaTPk2HTgIG8Z1TMpcOQmSrDuPQq1mrlu0M5iHkkLu8BtinqSfar4Zr6z0cA3L+RwrYSSYPLJ6wTUKLR+NGCxgFqqox4vnwuT2CzFdyCbFSxggL0C+wmF65mpAbEsBfUmXCf40AK/gKsQr/kgGU4tE8WMXkg2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:95::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 06:50:24 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 06:50:24 +0000
Message-ID: <be0f922d-7ad0-4d43-b2fa-0a168664535d@intel.com>
Date: Wed, 10 Apr 2024 12:20:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe: declare wedged upon GuC load failure
To: <intel-xe@lists.freedesktop.org>
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
 <20240409221507.1076471-2-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240409221507.1076471-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CO1PR11MB4803:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6fjM4l2Kt0L0Pqt6x7tHanlEDgrKOKxgcRG5Ed5KHHNDZXbl8pxpbqDff7RL4gOulLvVFYd7/p9/hM71e6TTyVKWpOzgldCzGNz+hyH4orW7QbHAwZmcQTvEj3+HWKvwA3O93G+ebD4gSffIs6mWdPnczfRSLXT8pWT8yhGn9yVhc9nGdfzIkvOiOjWSjJ5b1rnnd6Sr/GfPbvZD21+5Qd92D9sLcTh2GuBLbW9LGjJBGy6W4Tzhg+jceIwnFfRJNp/CIJ4/Eyg74Gnitcm7F6qV3nZ8x+kyLjRo3YOCciJJIGuXJmwXeNUmT4b2km1cjLZoYBlFto4vddGfkxBbbt16BqJm4aTJYTuUANEvvHBxyiGLVaYZ58qiZK98le5CSZRsg81tg5pu4APAYYwv5kvaYB39Kof12FuE37zRsNOtQs4h//2XcmIHJ86Hw26S+OoQA+NUUmgwAac/OhWxMuDJIcUkdzS+XvITLAH2EDnUobVvwCzZGOe3cv6xtJjITXp2oDcMIZWjcKiSqXpRx/JcID6AD7+oUagSyXZz3aGWYKjuXh1E1WFat8S7d/evzs213RrParnqqzUke7UWxOE1clGR+fAZyNgTpC2M3Zg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDNTeFhlYnBVNVRzeXNEQktzWEd6enZmU0Vqb25USi9yRmJXQlZYUFEwc09U?=
 =?utf-8?B?NHhsR3QzYWJHVHIzemlMMXNzWi9JMndZMG9oNDJVV05wL1phUUdXWmhGRHFJ?=
 =?utf-8?B?UUhLTTlLeHJnb3ZJRTUvTW95c0E1OVp6ejJGQlE3S21JcG8xcEQxWWJ5L2xm?=
 =?utf-8?B?U3J0SXZITzZEOFhIeWdEUmIxOG9naWlJckV6TWZ6U0xTSU5RWE4veS80eUdK?=
 =?utf-8?B?VVRKMWN6bGpIdUlxZm5keHNGRithcktVVHQ2ZE1VYlpzUGhBeGdXVlBhS0hW?=
 =?utf-8?B?KytvSitsSXFxNFVyU3d0SXJLUkx2U2dNUWhNbjZyOTZZVHRiSnN4b3hwMHdZ?=
 =?utf-8?B?cTVRMmY0ODJnejRaeVBzVk1NUXRIdnhzQkt5QkhYdFVlQ05uSTNTait0T3Rx?=
 =?utf-8?B?OEcybkRWOStaMEJ5d0toU2ppWEhqQnpWeTdIOStFZVo2TU9vOUsrbS9zWjQv?=
 =?utf-8?B?NEFWMlREaGowNC94cWtlWlA0Um1DZUxaZ05ZdUN6M2JSQk42bHVhWm96M3NY?=
 =?utf-8?B?aEh1ODRkamdjalNxRWd3UmZhbjlaUy8yNmdvN1RwWXhCblhkdFE3WjFHRlpy?=
 =?utf-8?B?Wk5oS20zVi9GUkovc3Y2VFRpZ3IvS00wZ3c4N2R6ZWtIZEc4S0dFSC9qQWZl?=
 =?utf-8?B?WnJGZHJKRGp2bXRsY29LT3dhWllSb2lPWmxTOGN0OG9rNER3MnBFa1daMjYx?=
 =?utf-8?B?RTE0ZFpCdmtENVl1UGpVYnJwSEN5aS9GY1ZpSWxnbjNKeEdxS0kzNmVsdUFa?=
 =?utf-8?B?VUpIN3pCYUhpbDBJRHlnSlYzUlFjTHJoNjRONmNib0VaZDVhcHhWUGxKamlq?=
 =?utf-8?B?N1dyN3BQaG9ja3FGcjU3dDRUYTUwRFRuQzRUYWlHSktzVHVQY0JCSVpWNE9q?=
 =?utf-8?B?YWZKejF5UkR2Z1EydkZYWjhXRXRTVVVIcnVBbW1Ici9PbmNROFhCejVJUXBV?=
 =?utf-8?B?R1pCWUlIVTdpY0ZoQUNWR0t5dVlVeG5JUk43Yk5BMW83UlhNQ1oyV3pmeTZh?=
 =?utf-8?B?clNVVkgvcFdoV2pmemZ2c2FseWRSVktjd0JwZXQ1bzQ3UHU2dS94d2pQUTQw?=
 =?utf-8?B?QXR5RWtkVU9FMmdJZWVJVEVVUkVqMndQZFV6VlNCMG5hTmh5UzIra0srSWpC?=
 =?utf-8?B?U21HaUNkWGtiVkQ0eWN6MG1UaXpZRVRYWVlTVldiemNBanQ3SS9ab1RFNDRR?=
 =?utf-8?B?aWhhS3VETFBRa0Nzd3RPbXRUOE1oMVFxZFhYY3Y4MWxldVMrbWYvUDF5eEJW?=
 =?utf-8?B?MXU4QVNKcU12NWVXejZaelFObWdScGFkUiszUklONjNMaWZTRFUzMW9zbVRk?=
 =?utf-8?B?azJWY2FHVDFZSW5MMDMvdVBOK0hGaVJxcGFHT2wwSHpNeEdKNDZXZWJUNkd1?=
 =?utf-8?B?RDM5OHMxWkFEYmtlRWJkMVl0NU5VS0d2WlplQkR1dG52cThwRFFENnoxS2lE?=
 =?utf-8?B?UG92ekdIRjFGckxGZzhMNG8rSTBPY0ZiRjNPMGwwdWI5VVVlTnZNWWpndWE4?=
 =?utf-8?B?RkgwUjVkek5VQkFzU215UEw2U3FSQkZ0QjVoaUVVVlZQYVQwc0gwb2Y3and5?=
 =?utf-8?B?TGdxclJDYlBWaWNtSVVMUFlGcHcreXdNRWlHRzh1cmJTV3BsL29iN2JFeC8y?=
 =?utf-8?B?eFJlKzFuR0ErcE90dE0ySXNhbWF0QWRUYklncjNrWk12OCtrTHFUYWVZUllC?=
 =?utf-8?B?U0RvZnRnZTFXeHQrUkJWckJ0R3ZraERhaEduK1ExaERSa1Byd2FIRmZob21J?=
 =?utf-8?B?bHpkZzFDbTd4TUh1RWtXa1ZmQ1BJbW00cTlXc2V4UTE2bVFCQVRVb2tmZ3VP?=
 =?utf-8?B?WG1KM1VLb29pWkk1OWVEeUR3Uzg1RmIyUG1BcU1HUFRNUzV1dkg0Tk5icWMz?=
 =?utf-8?B?RUVBWHZOZUQzWklxQVViZ3poK3dibEU1Q2VUV3pycVFrcVBvS2J4emp5WERo?=
 =?utf-8?B?aGlmbHVkWmQ1NkJsemJLUVF4akVlS1ZBT2NiRFhyYVErWkc4T2xqd1c5TFVw?=
 =?utf-8?B?aXhNSm5GVnc3bC93dlY4eGxIU3JoMitlTndPb3JHTkN0bDlLN3hVWmx0aHhI?=
 =?utf-8?B?WnZwLzQ0djZDMlFQSDlLZG5TQ2xGekRVT0ltdnJDd2VrQTRFenlxMGFobEha?=
 =?utf-8?B?bHE5QXp3c2hacURNOGl3Sjc0WnhYUDBxdS94d2NGait4L1cyZWtLczBaUVBB?=
 =?utf-8?Q?DPvohJ2RMg2ENNP/VTJBNxs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8feebc-2ef9-4ac4-9245-08dc592a7f67
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 06:50:24.3815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9Q744Ljm4o9EtePMTOQCkT6HrXk7jlzajlYLj5ZeSNCljHLSc6sVkksMylJtschcfO5BXvzn/IFGzGuB3HWSHcI+AjoShKMYxcChfkfJLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
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


On 10-04-2024 03:45, Rodrigo Vivi wrote:
> Let's block the device upon any GuC load failure.
> But let's continue with the probe so guc logs can be read
> from the debugfs.
>
> v2: - s/wedged/busted
>      - do not block probe or we lose guc_logs in debugfs (Matt)
>
> v3: - s/busted/wedged
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 42 ++++++++++++++++---------------------
>   1 file changed, 18 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 240e7a4bbff1..f1c3e338301d 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -451,7 +451,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>   	return 0;
>   }
>   
> -static int guc_wait_ucode(struct xe_guc *guc)
> +static void guc_wait_ucode(struct xe_guc *guc)
>   {
>   	struct xe_gt *gt = guc_to_gt(guc);
>   	u32 status;
> @@ -479,30 +479,26 @@ static int guc_wait_ucode(struct xe_guc *guc)
>   			     200000, &status, false);
>   
>   	if (ret) {
> -		xe_gt_info(gt, "GuC load failed: status = 0x%08X\n", status);
> -		xe_gt_info(gt, "GuC status: Reset = %u, BootROM = %#X, UKernel = %#X, MIA = %#X, Auth = %#X\n",
> -			   REG_FIELD_GET(GS_MIA_IN_RESET, status),
> -			   REG_FIELD_GET(GS_BOOTROM_MASK, status),
> -			   REG_FIELD_GET(GS_UKERNEL_MASK, status),
> -			   REG_FIELD_GET(GS_MIA_MASK, status),
> -			   REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> -
> -		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
> -			xe_gt_info(gt, "GuC firmware signature verification failed\n");
> -			ret = -ENOEXEC;
> -		}
> +		xe_gt_err(gt, "GuC load failed: status = 0x%08X\n", status);
> +		xe_gt_err(gt, "GuC status: Reset = %u, BootROM = %#X, UKernel = %#X, MIA = %#X, Auth = %#X\n",
> +			  REG_FIELD_GET(GS_MIA_IN_RESET, status),
> +			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
> +			  REG_FIELD_GET(GS_UKERNEL_MASK, status),
> +			  REG_FIELD_GET(GS_MIA_MASK, status),
> +			  REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> +
> +		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED)
> +			xe_gt_err(gt, "GuC firmware signature verification failed\n");
>   
>   		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
> -		    XE_GUC_LOAD_STATUS_EXCEPTION) {
> -			xe_gt_info(gt, "GuC firmware exception. EIP: %#x\n",
> -				   xe_mmio_read32(gt, SOFT_SCRATCH(13)));
> -			ret = -ENXIO;
> -		}
> +		    XE_GUC_LOAD_STATUS_EXCEPTION)
> +			xe_gt_err(gt, "GuC firmware exception. EIP: %#x\n",
> +				  xe_mmio_read32(gt, SOFT_SCRATCH(13)));
> +
> +		xe_device_declare_wedged(gt_to_xe(gt));
>   	} else {
>   		xe_gt_dbg(gt, "GuC successfully loaded\n");
>   	}
> -
> -	return ret;
>   }
>   
>   static int __xe_guc_upload(struct xe_guc *guc)
> @@ -532,16 +528,14 @@ static int __xe_guc_upload(struct xe_guc *guc)
>   		goto out;
>   
>   	/* Wait for authentication */
> -	ret = guc_wait_ucode(guc);
> -	if (ret)
> -		goto out;
> +	guc_wait_ucode(guc);
>   
>   	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
>   	return 0;
>   
>   out:
>   	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
> -	return 0	/* FIXME: ret, don't want to stop load currently */;
> +	return ret;

Hi Rodrigo,

Can you please confirm whether the concern raised on 
https://patchwork.freedesktop.org/patch/582990/ is valid or not ?

With current changes error return from guc_xfer_rsa(guc)  or 
xe_uc_fw_upload will lead to driver probe failure. Probably we don't 
want that.

>   }
>   
>   /**
