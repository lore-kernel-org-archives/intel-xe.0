Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BE7C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 05:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A02F10EA5B;
	Wed, 20 Mar 2024 05:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GaysKkiz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E4310EA5B
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 05:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710912307; x=1742448307;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=csfsnN2TgGkUINk88ak4VqXnPLLTGkkjBIuyIKOCwXw=;
 b=GaysKkizYeqxpxDST9uXJUbFu1WWp5pnpm02jQy9HC2JP+WP2GC09GyT
 qJtJEHoBlrxxSzIXHoXFNHlqy125+KAfYbRKI4wIrskd/I3xK48dmO/aR
 JaWFyXhOVJmKVSWar0P8CwZvZTNjvVUCkMLjBGd/Zh6AreyHrflx6wsaM
 q8IbY+t+RWVUoSp9mtFsg7L2f/ILkrkPi8wxhxLR0h1eM0chgWudr8Lon
 fGtH2n4NXJ9H/K1tzZcRlsaIDL8u2sAFOFetP5ijRMuv4DjlTHO0muDWm
 ecpvxlViMPTSHTJH8P1MHiGN/hUIVnNrU0EDC2u/t9kC7MOjKN4O1HycR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5696289"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="5696289"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 22:25:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="37168183"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 22:25:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 22:25:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 22:25:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 22:25:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUkjc2aX5Yx+DtGqBWo7hQ3/5CeEKO/BaBR1Dml0Np0x6iEMDboh3cVMVX6eafO+You61YbcylDRSFheUgPvu7JJXp8kcJfhvfzhljekMcG3LBbsNHkS+Hydu5SSX07YHieGrOTfxByasgpekgV3fUzRrpA3Hm4aYeWMnwle1tSS2oJRhpQVWl14x2wZaTQaUmUbVQqla984WUP8HPfFkgpOxbJL0kK67iXgj4Rbdx/xn+QF42ynuLTaC37wcr+J8pktz8+R0FCTvtFXpBGNHoHsGvFj80I1HWy+q5qoDBvfse+ZoLmwzjnheD0J2AHVW/6nobJpuwMIWyfBz2HiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idmt1VaCAGndQCu6qJaHPOiNLePMklU0FzyzocaZ7KI=;
 b=SbRvndH9xJzcXD8OMywsTd6eGuHUYtz7oxozIf/xhzOyRa0I3eKgu6GzUCyF1lIrTqvtsUuqnL1KIlrsapR5kU8lFEwuJns8gdplHvmR4MHOXkvthnIw+4MJd1GuosJw3Ur6otemQEv0z15c4C6YeNOWgmjPsOzB/JpzsJ3aE2fJFte5sVXQwFrT7GDPAtSLViug/6EJrYyBb2mQ9lbxulygqNvjkCJVJ7vmtFgAsO1qAm+TCwObvFdVveyuGa2hMq7Q+bjDPQrJY39JQP1lpKUKhdCzB0kyfZDGP3eZWQkh+IT1Rbu2bkX0nHA+xCYx5vybmI3L8uhruT2LQ+d0nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ2PR11MB8472.namprd11.prod.outlook.com (2603:10b6:a03:574::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 05:25:04 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 05:25:03 +0000
Message-ID: <98d1434d-c701-4435-873f-023b2df2abce@intel.com>
Date: Wed, 20 Mar 2024 10:54:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu/drm/xe/xe_devcoredump: Check NULL before
 dereferencing coredump.
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240320051719.3248723-1-himal.prasad.ghimiray@intel.com>
 <85le6d5w27.wl-ashutosh.dixit@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <85le6d5w27.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ2PR11MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a3db68-3d79-48b0-5a18-08dc489e18b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QwhzPYpmh9ptinen+zl6liJpHgCR6gX/CGqQsQHI9kTMgAZDiuliv1LpUEn/JWCU/wOWg7T9M9F6zIRsGBiVXpR6ch0OYYTP9ni0hVSMGWp+PJtR0KYUSXC/5xYU+RV9EAlolFvEl3QnS6tCALH0DEa8jA1sPFr+fuDL8yxAnbLrgK8EZsCEu31O69917SyaNkbdfQCcjypMRwKEw/J3sLAhGqMC+yR7HHnaSXvgYLNED6IdJXtaJLX1/p30G2jYcS3+TN70HGjAQXzgluOE7wQ555mgyNvJEYoXxcSHCtdjQ+hwTPhDBvJIAHn54327wjxjzZR8WAmJvpWIt+JDoSbqDuEIxyRx+MfgWAYa0QsYThKyCKiJVmcCdoMkUkHWKkajMGzdjncKEXfuIT7BHMEelw9e0nKePuIb8/khumAd91DYSIyRZziVOXQBy4K6YA3w3xEGq7LzMwa8DBtYPLb4hQ8PFapGU5+Dklxiy5TodmSX2+4+xSa1pt0zmeh+QUaiuKgVLBHN9zH8IiZEQTLaaF42tars+CgrVxm9xmfJVgmQX6NiXsZl1Ik0HUcbB1Qee6BPtwMzM5djCC2N3Fknq3B1DWCDyG7FlhkEZnJkAYPi3VZbz4Z0VGX+A/fmgNLmQyddzSs3mZqAhqMfBgUEPiclHG6akAFyxxxPurA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0xHdElvSDdkcFV5QXEvQkkrUWw1S3IxRFZzQTdCOTcyNW9hWFRDTHhneXcr?=
 =?utf-8?B?S0YwbWdxempjd0ZQeFJIRUpMVGhaT01UbTZodFVtUlBicWptcnkzdVM1cG5t?=
 =?utf-8?B?YVh2WTI3RFRJMU9PemF3b3ZFRWZtR0JkYVFQbGp6OFJnVXU0ZTZVK3BUWTB5?=
 =?utf-8?B?U0dTc1pmWGNxYnE0RjhBUS92Q0F0a3RBb01UNThNUXNmNjIyUWUyQWliMGMw?=
 =?utf-8?B?N0RHVm1NZkYrMHR4MEZPNFp1SmllZG5wQndBSlM2QjFqbkRJaVovT0dGWnNm?=
 =?utf-8?B?cHNmSmFBQ20xV1RuZktrT1hrU0JGSjNkTWJ5R2pPSTBjSGFhK29QVjlrRTVZ?=
 =?utf-8?B?dlJKSnhldExDdHBzbExVNjhnTkQ5M2hIV0xBSjZ4UTRwY1NPMFZqTVNnaGFj?=
 =?utf-8?B?UU8rQXJuU2hPZFZZRUpTSi9MYWoxVlpldXA0M1d3RGxGdU5uU1hxcWRMTHRz?=
 =?utf-8?B?NTYrdGl1Tzg4RHJsbm5xbFlsOG82SDk5Nm5nR2FSeG4wUWk0MjF0WVl5cUlE?=
 =?utf-8?B?d3A4WGxPek85RzVCT2MvUXpuSDhyQVU0c3FyVGNBVmNISzJXTkdPS1RFdHBU?=
 =?utf-8?B?OUNHZ21JK3lUOHFPUXpNN3NRTnQ3M0ErQVI4eGpXZEl6UUIvOHFGVzlzdTRB?=
 =?utf-8?B?UW1CeEF1dUxxS2VMdzRURXdNYThZVkNPV2did1oyODNnanlOaTZKWUt4b0Y5?=
 =?utf-8?B?aGVWVkM4QkJua3p1aXdYYmNXRU93UHBiWU4zdjRWSkt0Q0pYL2E1bXNUeUhi?=
 =?utf-8?B?enlvbGtENFFYSmlTVU9TL1NRNFlNaU9UYmR3R081S0Y1bU4wellpS3k3anky?=
 =?utf-8?B?VTJPYndMbG9jVy9GaXlGMnpES0h3ZHlaT3dUb2YremJRZEpmODVMZU1JdWc4?=
 =?utf-8?B?ZkRLaWY3d29Jd01pcWtMQkRJRVZDNUlDN09iWGoyekVlWDR0anJJMU9qVk05?=
 =?utf-8?B?aGNTa1g3Wk5UMXZmcTRkQW1KM1pnRzZzUkluQ0Z3b0xmeThjYksrbDZNVHps?=
 =?utf-8?B?N0thSElhak9VWitJcUZ3KytjSWJWTUI2amt6MDlJT3Y5OGFld2FUYitpdGxl?=
 =?utf-8?B?L0h2Y3p0NUdZakRwcmxhZVh4dFJmY243WFFoa0FQck9FRzNwU2I3WmNPYkF2?=
 =?utf-8?B?OS9BT2NUYjhoM1RQRlNTQk1kMFlMK0I4M2FtaktVZ1RhdzBlS0NjZWxkeVgy?=
 =?utf-8?B?RXhvc044OXBBdzdGcXE5d2VqSTZ0UjVEcG5FbkF2OWdacFZKeVVtcW9CUU11?=
 =?utf-8?B?SGZLTVdHNlo1Nm1wN2RtOWpYU2k1WXltLzJwQXVnWThDMWZTYVZhYVZaTXo1?=
 =?utf-8?B?NTVqQ1ZnTndXTks1OXV1YlE0SmQwaUovQzU2RnZmTURQWUE4NFA0a3hvUnlQ?=
 =?utf-8?B?RjNVelFYS3dIcEJKR1Y5WGprdU9nRk1pMjhGVEZBZlhLV2Rka21uNWdLMURl?=
 =?utf-8?B?NWdtMGx3TUFQaGdHWVp1eGFWR1V5YkFOOS9IUnAzZGV2eUw3Q1IrZ0wxRGI3?=
 =?utf-8?B?UmE3bC9QS3lPWkRreGhHdXlvelRRczFHMVJuYzQ4VjlVbmRPTVM2cTljQmVK?=
 =?utf-8?B?VXZITnNoamhxcXhkajdkcUVORjhHK2Z3YUhEYllkSTZ0L1BnMzVibHB3bHM2?=
 =?utf-8?B?eW9TV0UwTGNMTjR4amhKUHVoZHhDekkrWjN6cUFJcERzSE1zYmVWWTdvdjA2?=
 =?utf-8?B?TmpGMTlNOUNENHRqWUtJalJRbkZsYnN4aVB4MktLZnZtVDdqSE5iSzBXcEtl?=
 =?utf-8?B?aVFGMlFYK1RzYUVadm1CZXZFcURUdENqcVRUMDIwL044d0Q5by8vL3dVZGRv?=
 =?utf-8?B?RUVoN1ptVWNnS3htMm1oMHBORERHbmtLQThpSVo2bVBwYlhlaXUwM1lEb0pJ?=
 =?utf-8?B?S1N3cFZqWU5xVE1rNDluSVZDb2MxK0lnSEt2UzQ1c1VJZFg1ZWMzQzNJUDRE?=
 =?utf-8?B?d1ZPd05DdERNUkNRR1o1dEo2M3Nubzh2SUxETFMxVlRSTWRML3B4WXExMVN3?=
 =?utf-8?B?M3RRMUlnRUl6OW1JN1kxNXJxcTZlNSs3a05uc1cvMlA2OWpNd2JRUHNaVTN2?=
 =?utf-8?B?SE1uQXdpRmhKeXB5UUc2R256SVJJdFdZaHk5ODluVkQ2T3FYTllhUUJYM2M4?=
 =?utf-8?B?L2dEc1NrSXRLaGE1MTRiQ3k2LzBySHIvUGYyUnRmQVUwZkpMTXdlbC9TRW1P?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a3db68-3d79-48b0-5a18-08dc489e18b2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 05:25:03.9001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/qBmYrWgnmw8Q5raySZ/EQHrqfnumGqtHlxPVxn2+PC5N3JKl30/4ySTBcvk+EgT+j6WtUO7ZqDevRpxgksM4XMx2T4SzZuYduABpIK/9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8472
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


On 20-03-2024 10:39, Dixit, Ashutosh wrote:
> On Tue, 19 Mar 2024 22:17:19 -0700, Himal Prasad Ghimiray wrote:
>> Derefernce coredump to get xe_devcoredump_snapshot only if coredump is
>> not NULL.
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_devcoredump.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index 0fcd30680323..83a1f3cd37cf 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -74,17 +74,20 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>> 				   size_t count, void *data, size_t datalen)
>>   {
>> 	struct xe_devcoredump *coredump = data;
>> +	if (!coredump)
> Needs empty line before this line.
sure.
>
>> +		return -ENODATA;
>> +
>> 	struct xe_device *xe = coredump_to_xe(coredump);
> Declarations after code statements are not premitted in standard C. Does
> this compile?
I was also assuming it will fail but it does pass compilation.
>
> If you fix these things looks like we're back to the original code?
Sorry I didn't understand this. Can you elaborate on this ?
>
>
>> +	/* Our device is gone already... */
>> +	if (!xe)
>> +		return -ENODEV;
>> +
>> 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
>> 	struct drm_printer p;
>> 	struct drm_print_iterator iter;
>> 	struct timespec64 ts;
>> 	int i;
>>
>> -	/* Our device is gone already... */
>> -	if (!data || !coredump_to_xe(coredump))
>> -		return -ENODEV;
>> -
>> 	/* Ensure delayed work is captured before continuing */
>> 	flush_work(&ss->work);
>>
>> --
>> 2.25.1
>>
