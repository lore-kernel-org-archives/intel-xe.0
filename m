Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CC9C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 05:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A287910E178;
	Mon, 27 Nov 2023 05:08:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0996310E178
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 05:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701061685; x=1732597685;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iTkGMafFhSkcNdhxmaVL4zBOZhg1UFY+xPYKFmNlfVg=;
 b=LYXUIQiRLxA/pRuin9vgYUZmaAib1TAApYgBBj6uq00QPTAPq9QoXpqV
 j+tDR0L2VZD8gylKect1VMnmVWMJkJSmX08S06uQWUuankb93i/5GJ8Lx
 M9MqI5m5BlL1rcfV+Fygdf18vMbwifbgiZ4uzpo5O1w0K56LUP+0xg7pR
 mjTSvjBagFrLxkWzpfacdrINZdAV4YaoZzOIs8GZ3Ur6T1sTW6GR9yJVA
 b1pABLcyL9QEZF1C1Gn+Ri3tdd2WWf9xhKWolO8tIJ0v5hcoP3rs4vcc0
 68cAuZFXNG7H8TnR9bVIdOtLdYYUcxnLW981Kj6xZtaNrglzgDBcsiRsP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391509254"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; d="scan'208";a="391509254"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2023 21:08:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="768056927"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; d="scan'208";a="768056927"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2023 21:08:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 21:08:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 26 Nov 2023 21:08:03 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 26 Nov 2023 21:08:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNIQwxEPAnurDBJCaRMLSv3Zq0is2pCi9c9aAq0vvdpFUonnQZ7kAqKAsljBisN7t0npgUKYJbpaN6vdY13K8BiuuquLgm8S0Pe/HFaO+0fmFDWUjOGuV331e371Drip6tArFWp0LHIp3YS/+4Z+1k32fcKvyYAcGB4JHgmYqUMl2BsC0qmkFgcPoRY+NzbONb9/wM9P9ZnQcfOMa8LuxQqF6pOSu8wD5ZMwGnPXLkBV0/nIztOdp1XIuAOQikowqCGpTADSiY27d7OcfFS/uKZXewqoxGfCwymVOPJWkCXSQmwcX27HfpQ0nJLSlsPCTiFXfxOUixJnSYn0PbEReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3qjgi6+kA519mUKJhxeb+sfqSNCMWaHMI0MIO5ptYI=;
 b=TT4nwaTq1iy7Ulc4a5T/5/3VTab6dfuReS/50S1RqEiOveOt5T89N0sdVLzHgqNnbGVQlj+Wy8+mNl2IxMA/PNjjlnEXn7hKT5lJXDGuXFgDUK0u0S+enHyV3Q99T+qa2a/Nl6tuUEWz0ldlgcpro4TXzTEa1DFlz44eWqQGXxaGCxPL0Y9/oS9sf3nsLBOdtR+ddLo8j3m5y17wVzfv8eGT6e0YRXJnX60n6g1Lg1+4RdQ9x6gGxkbdpLrKB3HGYmyUUrD/sUtG9ujBHWmgAjCIPryx2wWvFMQcPqt557zMwLYWwsIaBhjVseltYnpNnb8MeI2Vbq3zbpwxq9Ynlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7361.namprd11.prod.outlook.com (2603:10b6:930:84::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.27; Mon, 27 Nov 2023 05:08:01 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::67f:6c6a:220a:db2f]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::67f:6c6a:220a:db2f%5]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 05:08:01 +0000
Message-ID: <c3745a68-cd56-408d-b64d-acdec1336986@intel.com>
Date: Mon, 27 Nov 2023 10:37:54 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231124055818.1769898-1-aravind.iddamsetty@linux.intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20231124055818.1769898-1-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0137.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7361:EE_
X-MS-Office365-Filtering-Correlation-Id: d9bedae2-91d6-4564-2107-08dbef06d3d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RQu1H+S3sufs5/iQqku0KPPxPBWl69a+0DGlW+7RrXBA99VAyh4p9wa7UmzIoku9rtEOHYQaOYGqG0qhtVfphXUej2B0DKPiy22rpX+CIbW8yrltU+tGGCtuhllHOBmWB0WLtoSa4UmV+5Fovh3XLkaNnyLCiBMPQH1VEwoHUGR6gM45s7kkrAPKnJFEIzqxypcwhNqG/w55OgdOjjzjryWIIQIvBRqI21tCuf56+wVD4pAsIIdXsmfcG4vs0DBiK3VHA/2im7YgwDNMEV05IXhkB0XhlZPO0k5LNXyHm9w/3uePKHu4htbRdcEc5oT/T9bJxXI3YeX8tJ2p8yksrjkkp+dmyHvaouYjt5u6oHGe1f0O4eh2MvjXGLeMDMM8HfAM8stfBV9SpqOMLCYkP/BO2xSqSDfT0IpH4dPxvXz0k//Et4Js98TdxggxLRFwAfjxYvXbkbfgElSshFom4etxEL6MrD/x4mMaGF46JGf71JLpOVuNJotMc5mW6J74soqr9acVDu5FbleHEQ+q65T0BXomWUhtJaVypzqnGYNqecgk4T5lqj2i68OhR7Hen5gh5JGTX+qYUn8cmgcHjO+DhoFw1wyXalirMg4nxkS2cZv55VtxzX3n82wI5ide1Oe4V5r1xIkilSQGBHaIMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(4744005)(44832011)(31686004)(66946007)(41300700001)(53546011)(6512007)(8936002)(8676002)(316002)(66476007)(66556008)(6506007)(478600001)(6666004)(5660300002)(6486002)(2616005)(26005)(83380400001)(38100700002)(86362001)(31696002)(82960400001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUwvelhDTTFQdGhySGMvMUFUUSsvZmMzVVJWT3ZXVlB2U25pK2RwV0lrNTQ1?=
 =?utf-8?B?c1hPdzRqdDloMVJpdm0vSU4yTzNCMWNlYU4zM2hsNWprbGQwQ0lhMzcyb1Jk?=
 =?utf-8?B?RVg5VXppOVR4VThwRnNsZFBiTTBxdVV6MCtWTmV5K3d5WWlrMmFCR2d1S2Fy?=
 =?utf-8?B?dTUrMmc5aytDcUZwN0o2RExQNU1xaytkeVc4bGQ2S2NiYmtMYzZrbUg5WHBZ?=
 =?utf-8?B?QzBvSy9HT0NUYlVsNVk5K3ZnQkRrSUJZYkZwQW5zV2thT245bDVTV3ZMcXhF?=
 =?utf-8?B?bGhrdzM1cTBQODFJb1N0Y1NUNnlwQVJ1VTY0Vk85c2ZUSGxpSGh1Y3huLzFu?=
 =?utf-8?B?dnlPdjlwNVZFYlhYVnlUcURZNzEwWjNtSWVMTEZjeXJMSTBOZG40NVk5d0g5?=
 =?utf-8?B?aWtYR2JKdE8vYlNMbjJZMG54bG1NcmNSVUxuWkh1bmRhSEtKTGViSUpnWkZt?=
 =?utf-8?B?bi9Ma05wTXVKdzFRd0l0b3p0VHdBYnNZbW1JbTUzNHJjN1NWTkRVVEFyRGFP?=
 =?utf-8?B?VmRsRGdxUzVYbUREMk5BRnRHSEkxVWZLbFhLVG9GV2ZtV2hzRTZzUjdJWHVW?=
 =?utf-8?B?dSt3UFczVU1xRDNyeit4Z3pVWkxQT28xdnFndkY5OTg4YWVUMWR6VFN1TUNo?=
 =?utf-8?B?UUVVVGNsaXN0SzF1NkVQVUEvYlhLekN0OTk1SnNpdUJ1YzJCaG1sTmV1OGp3?=
 =?utf-8?B?Q3I1ODNmcUJrTlVSNGRLVE5EQXZ6WnpqQnVwYStQTHFCMVkxcDU5VVlUbmxt?=
 =?utf-8?B?Wm5RcjlDNmFkVzlWRmFlN2habkZKeGM3bmI0M3pTc09iMjlib0tOWTlGNmx5?=
 =?utf-8?B?bXE0OGNhbVpkRDRTMFIvU3Z2VVFCK3hFcWNxYkZmU0FZT1BXZEVCZTBSWERk?=
 =?utf-8?B?SnFMTitKMXEwakNWRWJPZWp5NjNWYzd6cDZaZmRtc3NUZVR3ME05dldMYWEz?=
 =?utf-8?B?cVlTYy9TRDBESlc2RER6M2MvZmk5MDBOd3JBUUt0UUxpb05td2JzVk5UNGNH?=
 =?utf-8?B?QXY2ZUN1bGdRWFNKUWFLcDNmMklWVFdURGlneVl4S2R3YllBNEc1Z0JmaEgx?=
 =?utf-8?B?NFVTaGJKcXU5TVhlOGlQUld3TmtYY1hyS280clhxMk92a3hZMlpWdVozdlQw?=
 =?utf-8?B?WXJyVVhZVkVTcnhRTFIxeG52MjlSSlRONk9LWEsxcVFCeXYrYzF3NlZjN1J1?=
 =?utf-8?B?YWhsWHIrU3JKSGFxLzU0cGV3bzV0V3VRSU0zaXV1U3pTajl6dFFzVEVHYzdl?=
 =?utf-8?B?a21HNTNlS0x0ak44SEVSczlERzNBSnlja3hSeHladE11WmE4Y2g0S08yY1dG?=
 =?utf-8?B?dUtBT0J0ZnA0cy9VbGVJMW9kckpTWHQyVHUrYXFGYVphUmoyc3ZGOC8wNVJm?=
 =?utf-8?B?b21ZZ1J3VlBGaWZ1TmttZ3pBMHRLK1lwWXdWc0M1eGFNMEErRVdESFZIWmVM?=
 =?utf-8?B?T29wZmQvNFVsVWxheHRRWkpqckh4RVFHcUFNb2VlTzRPNkpqendXU1hvc0hy?=
 =?utf-8?B?RVJqUURGZVptTEwwd0RraDlrYkdPWGhycUkzdlczZmNseTJ6RmYrb2hiRk55?=
 =?utf-8?B?N2VrWUJ0NUlwQVNCRXdZbEhOQzlWNnNtSTRqMGh4cnlMK0tXQVk0TStodDdN?=
 =?utf-8?B?dkNJdHQrMkVveU0rL0JlL1Q3QS9IVldpY0FyRExFeTByS1VXT0cwRGVXMUlO?=
 =?utf-8?B?T2gzWG55TWRaMUhPWnBiaDdCeWtyNXhDa2VpZTVsdXB1T2poUzBtMzEyRWZq?=
 =?utf-8?B?Vk43TEhQVmNYdUVmbHJ0MFNRb3VJelFud2x2aW1HMy9ZbitqajRtd2JrR21w?=
 =?utf-8?B?NmlMWU5FWU0rVnNsRVEyYi9OaUwvQTBlbjAvNlJuanFMaFNLOVhEREtlNTVv?=
 =?utf-8?B?RGwrVlo5b0ZtcFNsaDZBQnJyZU1zQ1RXbG1TV0ttUnVJaXQvMzFKTXYyM1pv?=
 =?utf-8?B?S0xOY0ExMVhOSmpaNHVzY2pkTjFEOUd2YVlDbUsxQm9OY3dFeVBzWEFhcXdx?=
 =?utf-8?B?UnkxMG5YQWZ4RWNDc2dsOUtGc0ZiZzFDL2I0a0dVcTNRUTVNdm41cEx0NjlQ?=
 =?utf-8?B?aGtOQzkwdE9xbU5JWjE4YjREVTRSRWNKSXR5TlVkZmU0b2dQVnR5dzFwSjF4?=
 =?utf-8?Q?ON2io8ddVcFBsNfeVGNuV4AWJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9bedae2-91d6-4564-2107-08dbef06d3d5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 05:08:00.6981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adg/UZqFnfck3+QLCvg9N0R9EfYYKqSXiGc0VsPRoRcqIs3sKdHKm2XlNk2N82f3/MEhZ3jxkkv8739jzyQzag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7361
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/pmu: Drop interrupt pmu event
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



On 11/24/2023 11:28 AM, Aravind Iddamsetty wrote:
> Fix the sample type calculation for engine group events in
> engine_group_busyness_read
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index b573d26f87ad..4fb77c7693c2 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -61,7 +61,7 @@ static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
>   
>   static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
>   {
> -	int sample_type = config_counter(config) - 1;
> +	int sample_type = config_counter(config);
>   	const unsigned int gt_id = gt->info.id;
>   	struct xe_device *xe = gt->tile->xe;
>   	struct xe_pmu *pmu = &xe->pmu;
