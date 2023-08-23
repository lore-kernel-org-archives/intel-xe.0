Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B8DEE49AB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 07:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3B710E389;
	Wed, 23 Aug 2023 07:17:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D0710E3BC
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 07:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692775043; x=1724311043;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lbT/RpCd7WGNMmc1O+lPdwdzKkhNZuI1WWS1egA9BCI=;
 b=TuJ6Nae+eYhjr/MnWtN+WOq0cvENVcB0p66vJzPosdH0lu0eIluUBtz1
 ZPGW5TqTNlpX1wCO1GbTNg5aattKeoDtnBl8gaCUJMMTl6SJG+vmuMLlT
 +bGGd2xk3Oqvnk+EhWPYu/eQkPpuJ/cWuDfPtzn3U4RWqpxxHoEXMdt+o
 1rlS4TvN4aFcbdQJppj0Mb3o8fR4mhswYcDqbKiUc6BdoCVByB9kjFdEx
 MPvrwI2QJJz8dCWQvItONZuVtJRnZie4sF9GsPuwpTOXN5S9QoZ+/4FxL
 F90TevZdBFUSH60D9eRnUwlp+HBx1QM8knm3YG7jdOnkpw4IDVi7CuyYA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="377849418"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="377849418"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 00:17:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="801996069"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="801996069"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 23 Aug 2023 00:17:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 00:17:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 00:17:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 00:17:21 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 00:17:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJ1eY0kvlr8hWkd5FUU97qd1EuvgWJ6gffqzJkeosiNySJ/MJW3pyOPuPkyMeapLZcgUB9YypjwKmM0spwkg7boDnD5ztIWswjRFaENn6UwfUF3TQdaHlit5F8RIrQnNGKNBkShVXyKgUp+I0KNr9VSy79JNrCAhsyJjt9kzLc0HSuVrcWE7HVY4NPKVovZcfekJMqZOCFMGuUCbpxTQ2iyrt0WojgCYRcBk29+/pgiMLjRotAlaeyWUdy/KttVN4misALT7Iqx+wP3Cr1JHFGQz4BAANbD0Eukn13jW6b448mWxubREZUHhV+VUHHUe0r8od5eqL2lsLjVz0Wv1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5yr9RZ0hFxmZEsbR309Lg89YmF63pHc0FjD45sraHM=;
 b=Dih0ubVPmGjMP30eOB/5izqhhxXD0FgHpy67995DYFZc1TVUSIlfLnNOgY54UqBS058pp/pRDKpy0H99eNIbsCcKooYJKzt3vZOXR5tt0lli9NkZGeauDJI11SkZjfkt1GhO/UHS/z2pNo22khLypzbR4AoiSsyTDaCyakMV+zrIddzBQB90nFqpElzpgIqQgztyEwHQCymrUZ007TcjddO376DNSYG/vJLi7YlBg+H0H3NygI3mt0SD8zPescr4vaRpSLku4QLQ6X1TwaHxk3g6HIwKpY/GVB493Kog8n+7hRBPAe95Ts62jLSOyZSZGjCH1gKIC4RyiWdTwTM4YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB7727.namprd11.prod.outlook.com (2603:10b6:208:3f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 07:17:19 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294%7]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 07:17:19 +0000
Message-ID: <802ff062-1030-aa8e-754b-ea2c3a2f9ee4@intel.com>
Date: Wed, 23 Aug 2023 12:47:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Content-Language: en-US
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230823050955.1226024-1-riana.tauro@intel.com>
 <20230823050955.1226024-3-riana.tauro@intel.com>
 <ZOWpNQhjHinmzzk9@bvivekan-mobl>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZOWpNQhjHinmzzk9@bvivekan-mobl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c22da32-5963-43f1-e6f2-08dba3a8fc69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8FTe9q4puaXbidLAx7jPtEmgN3NLRNOYTB9S62yQz2avtR5h8Kv43AtNUaPVA+0i97bx2YNYj7La9gvZwLLQLvGRPKw+F3/o3WcvzjPXH+8FrEF6/TRvUpBqTFbZuiM6IINz0sqSO2/qoCzLHFZlEUoJd/+VeY8jSyZbjwvSiRY08jMa/4Vvk50OzfWU2C+Fge3F4HmhtyfeF7YfBd+vR1e0P3BxyYMfnP2kidoRelQp+Y94xKJ9ovF5ZJG5+FbfkCTS5PWQQ7tiVs0953+zNszXlqX4gQfft8l0bdhjnZhOtEYQScbD9Exmp8J/LwR81MKLFbnCHPvTzC6+erNwIhNk3ltF6azDdhEw9k7LUK9PBU2mofJFmSRKMVWKQt1+ryF9VFe1SCx0MZdb6Y0T9HMbk6Ang1590qJYj/S0lkXuQXSCLFD13zV2+dxMjJif3C4M446r1tLmm5t95MRR6IYTRVzh+/NmWhWuYd6LpRjwtp7wD5r7wLxOKGMV5tfER8IIM3bPCUZImnxiixHB2Q/FrOpmeAt62MSRpLC0JuDx9YwD3mypJicyj4cTNnOgaACk/xAviPEi7gk+tV2xlVKDCzbpsD3LrOgGuij3UK6J+3Fto0wYOwF4RFiDog932SzNUqsSVI2POZwCw4eMM4yB8isSrWHcnq3rBeisC1U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(136003)(376002)(39860400002)(186009)(451199024)(1800799009)(2616005)(6506007)(6486002)(316002)(53546011)(8676002)(8936002)(66946007)(66556008)(66476007)(41300700001)(6512007)(26005)(5660300002)(44832011)(6666004)(478600001)(31686004)(83380400001)(31696002)(36756003)(86362001)(82960400001)(2906002)(38100700002)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHhhZTJDN21QQVdwc2lCbDJPVXM4Z1pwYlVEU0ZqREhjSjkvaDk1dlJkZ293?=
 =?utf-8?B?K3d5RCtrN3dTR0NWbytwRkxlQ1p6NzNEbm1heW83K0hCaHVSbXRkZ1o3VVJs?=
 =?utf-8?B?ejdFV3JPWFFNZjFoWUVJSGlhMU15YVhBc3NaY1FNZzJSRC9YclYwOEVKcHQ2?=
 =?utf-8?B?TEFQZkEzY044Vk95Y010ams3cG5OR2x4OTdsdTY4ZVZOTVdaS0szcVo5M05p?=
 =?utf-8?B?ZzZTQXI1VGc1N29qd0YyajI2b29vczJqTjQrK2lENWs1OSt5a2FQQktESjRI?=
 =?utf-8?B?STJkQVFwaEE5VldnOVpUVFlheEVCK2xHYVE4cDBsT2w2cnpCM0hodHBDVEV0?=
 =?utf-8?B?Um1Cb2xLTFZmLzRwUktOTzh3OEo5RVY5eG9uRDEvMEVYVGJGNk9yS3RGR1E1?=
 =?utf-8?B?ZFNqUG9RZVBkOFROZnluS3I5cTZpZ2hVRUEyL1hlc05HVFNFRS9XOFFldVBU?=
 =?utf-8?B?eUo0a2NlaytGNW1HV0VSMFBkbmdMdnBBVGNRVHpkOTh5dHNNaTFPZ0FBRmZk?=
 =?utf-8?B?MmpmeFM3WkQydGhNcllFV3hLdTBTc1NTamI2UEJOWC9DZVl3dGxkWTNmc1Nw?=
 =?utf-8?B?bjE5dXR6S1Uyd0lNcnBLV01jS2JIZXR1aDN4NkhOcHM3dk5vNFJnRUdxRFgy?=
 =?utf-8?B?YlNoK3l6Z1M4dDhIeGlOREx4NVRHaWxDMW5mVzlVckwydXhtd25SRGV1enA1?=
 =?utf-8?B?ZUgxMXdzTXpDRi9lS2pkSGZxOWV6aTdPTkJvby96WHFXWWRjTnFzS1dteWJH?=
 =?utf-8?B?OXBSU0JyMEFCSDJvbC82SlR1eXV3cElYY3IwV1dCdlovVERBZisxYWV0UnZQ?=
 =?utf-8?B?ek9iSlVDVDNCNWNFcFVLeGZibmlRVVRnSmZDTk1qcFdmOWtSYzBmZUlyVWFR?=
 =?utf-8?B?KzF1enhCL0xOY0tmQzFpZUwrb0ZGSWFoemhKTjkraXJUSmRuRXJSd2E2SnFL?=
 =?utf-8?B?ZHB2dmpsaE8wZVZiUitUaEhQVkVWTENRS3Bwcm5SWURYejFRWmQzZXZMV00x?=
 =?utf-8?B?VW96Y1EvdnRwRGIyNjJsSDRJdVVUNXRNOENtL21VVExOWVpGaGFqeXlZWDlS?=
 =?utf-8?B?ZlppZ1dRV1FzbmZBK2grWDhBNmxVeU1YTU1POVBkWmFOR0FZOGlIaWhxcmt1?=
 =?utf-8?B?QTNPSFFSVHJKR3RtVmNJNW5XOWNPVmU2cjFBanhNRkdoV2svb2dGcUpyTWJM?=
 =?utf-8?B?NFpDN0EvSFpTV0xPSUlJUUZ0SDEyejdHd0dWL3ArZUtOT2xIL1dwcS9CY1l4?=
 =?utf-8?B?TUpSVWVtZ2VIMkREY3NqMCtRUFVtblhodGFqVnhJN3AvVzQ2amJpd1FRSlNz?=
 =?utf-8?B?WndVdzd1dWQ0NmlxbTZlVXdDUUVNVGowM3ppZlV3a1krQmdmNjVRNkpyZ1ZX?=
 =?utf-8?B?eldHbXFwOWFudjYxbVNHYkUzeTZxZ3JZK2ZoeE01V2tuNjMxY2dZUjFLdjJM?=
 =?utf-8?B?VkxoVjh4SlZzM09wQnl4TEpnbmJ5aTRFUWVQem81cWFUNTVhK0w4dmNUTHNE?=
 =?utf-8?B?eDlJY0Nja3JhRUZuQmJHdGpkQ3RLSVRkTHdvZzFxTHlGQ3p0cE55NzU2MzBj?=
 =?utf-8?B?aGRKbGZ5eWF1V2Y3VUVwVmZsdzR0bEpTZytxOFZscitqYWloR1JRdlJiU2Fk?=
 =?utf-8?B?eFd4TmdRa3NHU2k4UVZqNytnM1V2aDhkY01MR05HTmpVdFJ4Q3VWWDZWMGRN?=
 =?utf-8?B?Z2tXMVdqREZMTTRqbER6QUJYQU91aUZOaHBoT0hMOXZWaCttYTczajE3a1Rs?=
 =?utf-8?B?L1gwVWdPMkVYbFFWdkhzM1F2NkVCOVdsamlOdm9CZHBsYTNPUXA3WnR4YVc5?=
 =?utf-8?B?NlFuTEV5SVJOS0Fhd3RsTDA4MUdoeDd4Y0syQmdIb0JFZGI3TG9TUzBHY3B2?=
 =?utf-8?B?S2EyZzd5N2xYNWM0RkJLZmFMOFF6WDlIdmcrUzBCN3dvSW51TC9BSDI2WUFB?=
 =?utf-8?B?Z29INWJ2anJDSGtKTHV0bnFpVkNpUlpMZ2Y4TUJHMXl0RExCaXZWWUE1ZTNW?=
 =?utf-8?B?V1p6NUhGWVk5MXBLZ0RsdVA4bGFmclRnazVtL1lyQVg5N2VpeTVCYUZoVUVC?=
 =?utf-8?B?elVkMGVocDFIR3lJUmN6UnlTUXFsTFpYNHhlYU9Pck1hM2pLQTVZeEpZM3BU?=
 =?utf-8?Q?CsjK4whFYcA8DP99o5bh7DxDx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c22da32-5963-43f1-e6f2-08dba3a8fc69
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 07:17:19.1727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3g4wHNXcafKSgOhKeZYSiWbHjL2WH0aZmPX6igCC6JFbLrV9NuP6rpCQcqaCJK1zhHjZRGOqX0yNwf1rEpG+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7727
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] RFC drm/xe: Disable GuC CT communication
 for D3Hot Transition
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

Hi Bala

Thanks for the review

On 8/23/2023 12:07 PM, Balasubramani Vivekanandan wrote:
> On 23.08.2023 10:39, Riana Tauro wrote:
>> During Runtime suspend, GuC is reset for both D0->D3hot/D3Cold
>> transistions. It is not necessary for GuC to reset for D0 -> D3hot,
>> only enable/disable ctb communication.
>>
>> Add a function that enables/disables CT communication when d3cold
>> is not allowed.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c | 56 ++++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt.h |  2 ++
>>   drivers/gpu/drm/xe/xe_pm.c | 10 +++++--
>>   drivers/gpu/drm/xe/xe_uc.c | 18 ++++++++++++
>>   drivers/gpu/drm/xe/xe_uc.h |  2 ++
>>   5 files changed, 85 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 13320af4ddd3..0d52621ce64d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -676,6 +676,62 @@ int xe_gt_resume(struct xe_gt *gt)
>>   	return err;
>>   }
>>   
>> +int xe_gt_runtime_suspend(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int err;
>> +
>> +	if (xe->d3cold.allowed)
>> +		return xe_gt_suspend(gt);
>> +
>> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +	if (err)
>> +		return err;
>> +
>> +	err = xe_uc_disable_communication(&gt->uc);
>> +	if (err)
>> +		goto err_force_wake;
>> +
>> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>> +	xe_gt_info(gt, "suspended\n");
>> +
>> +	return 0;
>> +
>> +err_force_wake:
>> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>> +	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
>> +
>> +	return err;
> 
> Can this be simplified to
> 
> =====
> 	err = xe_uc_disable_communication(&gt->uc);
> 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> 	if (err)
> 		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
> 	else
> 		xe_gt_info(gt, "suspended\n");
> 
> 	return err;
> ====
Followed the pattern in the file.
Can be simplified
Will make changes in the next rev
>> +}
>> +
>> +int xe_gt_runtime_resume(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int err;
>> +
>> +	if (xe->d3cold.allowed)
>> +		return xe_gt_resume(gt);
>> +
>> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +	if (err)
>> +		return err;
>> +
>> +	err = xe_uc_resume(&gt->uc);
>> +	if (err)
>> +		goto err_force_wake;
>> +
>> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>> +	xe_gt_info(gt, "resumed\n");
>> +
>> +	return 0;
>> +
>> +err_force_wake:
>> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>> +	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
>> +
>> +	return err;
> 
> Same comment as above.
>> +}
>> +
>>   struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>>   				     enum xe_engine_class class,
>>   				     u16 instance, bool logical)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index caded203a8a0..e6574e51004f 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -37,6 +37,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
>>   void xe_gt_suspend_prepare(struct xe_gt *gt);
>>   int xe_gt_suspend(struct xe_gt *gt);
>>   int xe_gt_resume(struct xe_gt *gt);
>> +int xe_gt_runtime_suspend(struct xe_gt *gt);
>> +int xe_gt_runtime_resume(struct xe_gt *gt);
>>   void xe_gt_reset_async(struct xe_gt *gt);
>>   void xe_gt_sanitize(struct xe_gt *gt);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 0f06d8304e17..6bc01bb45fc2 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -245,7 +245,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>   	}
>>   
>>   	for_each_gt(gt, xe, id) {
>> -		err = xe_gt_suspend(gt);
>> +		err = xe_gt_runtime_suspend(gt);
>>   		if (err)
>>   			goto out;
>>   	}
>> @@ -294,14 +294,18 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>   
>>   	xe_irq_resume(xe);
>>   
>> -	for_each_gt(gt, xe, id)
>> -		xe_gt_resume(gt);
>> +	for_each_gt(gt, xe, id) {
>> +		err = xe_gt_runtime_resume(gt);
>> +		if (err)
>> +			goto out;
>> +	}
>>   
>>   	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>>   		err = xe_bo_restore_user(xe);
>>   		if (err)
>>   			goto out;
>>   	}
>> +
>>   out:
>>   	lock_map_release(&xe_device_mem_access_lockdep_map);
>>   	xe_pm_write_callback_task(xe, NULL);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index addd6f2681b9..b5b53c8c3edb 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -216,6 +216,15 @@ static void uc_reset_wait(struct xe_uc *uc)
>>   		goto again;
>>   }
>>   
>> +int xe_uc_disable_communication(struct xe_uc *uc)
>> +{
>> +	/* GuC submission not enabled, nothing to do */
>> +	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
>> +		return 0;
>> +
>> +	return xe_guc_disable_communication(&uc->guc);
>> +}
>> +
>>   int xe_uc_suspend(struct xe_uc *uc)
>>   {
>>   	int ret;
>> @@ -232,3 +241,12 @@ int xe_uc_suspend(struct xe_uc *uc)
>>   
>>   	return xe_guc_suspend(&uc->guc);
>>   }
>> +
>> +int xe_uc_resume(struct xe_uc *uc)
> 
> why not xe_uc_enable_communication?
Added a generic name to allow adding any other functions.


Thanks
Riana
> 
> Regards,
> Bala
> 
>> +{
>> +	/* GuC submission not enabled, nothing to do */
>> +	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
>> +		return 0;
>> +
>> +	return xe_guc_enable_communication(&uc->guc);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>> index 42219b361df5..29bd692d8800 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.h
>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>> @@ -12,8 +12,10 @@ int xe_uc_init(struct xe_uc *uc);
>>   int xe_uc_init_hwconfig(struct xe_uc *uc);
>>   int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>>   int xe_uc_init_hw(struct xe_uc *uc);
>> +int xe_uc_disable_communication(struct xe_uc *uc);
>>   void xe_uc_gucrc_disable(struct xe_uc *uc);
>>   int xe_uc_reset_prepare(struct xe_uc *uc);
>> +int xe_uc_resume(struct xe_uc *uc);
>>   void xe_uc_stop_prepare(struct xe_uc *uc);
>>   int xe_uc_stop(struct xe_uc *uc);
>>   int xe_uc_start(struct xe_uc *uc);
>> -- 
>> 2.40.0
>>
