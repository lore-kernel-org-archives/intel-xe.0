Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D30CC47077
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 06:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AA010E042;
	Thu, 18 Jan 2024 06:13:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC08910E042
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 06:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705558412; x=1737094412;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JlqthqdOJQ0YikhIkoSdkD1ic4Si51Ic18VWzREVAIs=;
 b=YHDzLOH8BKcfUfQfFeUOVHi1lNSUqcYQIIPupDm+pdPG/A9KGz+s7MUq
 rB6eNLEjK5hDx5s6bvZqOnVXC4xqvWL3etToodxk2KeGwjNsI2GKhk+KM
 FHPAqRzJOfGxlOy0mX4fUhHdX6yV+qUuHtuVetFQ+DfEknhx2qGkZllRi
 bG5zOmMfrJFsra4AwvkJxW7oEw0Fcqu208k9DkROAJSUogLKMc0NXNI8J
 sxiAq30f27SqzqajNdhiIIS3abF7SmzUJYcO71nSL/i1Z+8arrIsqwD7K
 1/9+sBaVdWCBcp59oatlpgXxnqCWb56LkwBYncC3Y5+yqoiJaIttYREeF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7118691"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7118691"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 22:13:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="957731259"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="957731259"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 22:13:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 22:13:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 22:13:28 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 22:13:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJ30Doy6MPvXjcqe68WIgwaqfKN4xBEUQhVh9SMibPRGOhJgkK/Ld1iTX6tGu8NffLQtFtyQskulN56vKVNYb4Vlm68NLjxlM0uBOlGPHU2bHyNZxGH20W8hK5T8YIeJkWAat0kZEJCsOzUV3uTK/+bbUOBfJrtiF0K0z5gjhPZ+ITbYV9fOFNPNBPqRZ2w03Ua7j+HZ80LOrk/No0x6dwmLbIpE4jrCol5i+K19H+t/z0GlVzhFbwMaRLAK4faL4xrciOsGgVrk80Bysbs/9mqupI5S/KWkllfWuXLriLvvAnmiIVA+XlOhcjifEqZEtNWFGolQ4tWkS2VUeWkTkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGLMErzJp+jxe0zgrS9BSd5hQUaK+U4B3ltdDh6LWIA=;
 b=lUCe0ssJsaJuTdzu6ZF6C1xxnPE4tCfP5pzsJGoycSlKtNuhTNx89WrP0fxAMP7Oo9FWkPiavkw5ovEuHssSJW6mMWszq4BP/Io6C7vSQrZ/QCYOPNt51X724WCvSq86wAj5ZcwVrtzN1m1yHNcPIKZGYPWE0EJrC8oe42OF61U8dzqJ9xJLTVfAuYCoL36epcsJYr/PQXxqbRnwt7XxWIbrBMXCXnSsLuhs+fvS7N5JjG7excJBs5loWCssItUo2RNbJBOMQfBpFrvorqtX3grhHGCZFusMMNyyqZtiG1MaqyERHM/TfCXgiKaTGQNDI8wZZSscUsmuMeYFbjkxkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS7PR11MB6223.namprd11.prod.outlook.com (2603:10b6:8:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Thu, 18 Jan
 2024 06:13:27 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136%4]) with mapi id 15.20.7181.029; Thu, 18 Jan 2024
 06:13:26 +0000
Message-ID: <18424588-8d90-4c5b-8b25-e652e5288349@intel.com>
Date: Thu, 18 Jan 2024 11:43:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] drm/xe/guc: Expose engine busyness only for
 supported GuC version
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231222074602.817518-1-riana.tauro@intel.com>
 <20231222074602.817518-7-riana.tauro@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20231222074602.817518-7-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::25) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS7PR11MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: 4251c0a2-9bb6-4061-cf2d-08dc17ec9562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vpfF2Agowz67GehQXYJA19APfzS6Bi8GQa+VsEWjbL3jcH6RhEM7Eye6b/mI7wJkmZpHQwTd5CUM9EAoP3JOxVrFTF0LNFqSmQDmlQh7OCoMEV+67Pct4DrsIcHHfvnP+CkfeuOTKEBXUXsRa3e4e+w/nU4D6eGVXwjDiXKv4ie1cgIeRrf4Zu85EUJhcet1fOUMGELfGzcly1YzpQvXRKBf2U6oKwaISws6ED5a+3rJYpXSHLtgBuLWd3kn8rFA//SFnTW6siUC9aC2LL/+fYmC1NLRV2JtRMZzX8Vy4w22i+jPM3W3E5WloIG4NzTMsp1gyoCb0S3sgBe+9GZZMfV/u2rJQBK3h7rs7v4f11cJ2SMmbenlm8MeUxuKbP/rpuTU/ZU/5+yFG1/iAm09i1laNoe0yCnJTdU1vvASHoVJX5x77cIyRIcnFRTru/CuODOzA5VydDIt98ZR3v47yVax4364BXA9BFxL4wSOfS7CbHWyL2RjCifHR9oRRuTuufR1liYSqGpQ3WTYttZy2o93wAytGAjo69eYlTUVm0KgwdU5wbJtFWqT/7GrgeoTx1bTwHusQ2Qt0U9ISKl9HkUnKBV2PUfJAH2ozMl4MQwciYT2/+RxVIryZAIwGXKlUtYDD9X3UH4FmZ12TaoBJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(136003)(366004)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(82960400001)(41300700001)(31686004)(36756003)(86362001)(38100700002)(31696002)(8676002)(66556008)(8936002)(316002)(66946007)(66476007)(26005)(4326008)(5660300002)(478600001)(6486002)(2616005)(83380400001)(6506007)(6512007)(6666004)(53546011)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlpGUDIvSE4vOGNBcHVYOFJLVGI0UUlmZ0YzRHBUeHRMNTVNTGxlc2d4UndC?=
 =?utf-8?B?TWhsR0pLZGFlbGNJbUpJQnczaTR2YXczRGJMZkd5UFdQMXh2MFZBVlVNajMw?=
 =?utf-8?B?YUQ1dGdYUjdiWlZ4aElKd3VzWkJFSUhzK0tBOEsya1dIREhxVHpETTI4TFgw?=
 =?utf-8?B?Y2tkdm9NTlBnenRlT1ZFTlJkaCtwTXJLV2ZrcDhxMWhPV1M5NTZheDY4Yk5r?=
 =?utf-8?B?VlQwY09GcnN0Q1NyT0tsZ0VOeVYwcWlCT200UlBFczZYaXp4cUZNMUM3WG94?=
 =?utf-8?B?YnR5Q2NvK0RadnB6blUzWVFNTUQvd2dYTG0xV0l0dGhtWDl3UllpazlucmQ5?=
 =?utf-8?B?a0wyVDVreUxGTGlIT3lmbzhydUxUNUNRbGhCVDRmN0FZMHh5MHAwRW1FMi9T?=
 =?utf-8?B?WDcxRDJhVFoxRURoRkFOU3FCQXE1akg3ZFZaMjk1LzRmVTJEUzNQN1RtQzZ6?=
 =?utf-8?B?ZzVnemQrWFRlOHdueFFhanZISmQvSWE1YllLSEtiMHV4K3dXOVg5L3JYd1p6?=
 =?utf-8?B?bnJ0aU04eUNQRjBJbUJIYWxROUpMZ2Vwcmk2NGJFakZxdzFnR2Zrd2RTSHBZ?=
 =?utf-8?B?bTNkK25WLzNkSHdkRGcyM3Q3M1R1YmhVdWZQckhsd3B5L1pKeDloeDgxakFW?=
 =?utf-8?B?L3U1cDQxMng2RXhPZkw3OVRVWFpOd28wciswZTNGazJHUlJtSDFvelg0WXMz?=
 =?utf-8?B?MkJmN0MrV1lXeUlBVVAvSDVtRUpFRGxJNGdXbkVXSVJVRHhTUVFSeXRDaVYw?=
 =?utf-8?B?Ty8welM0Zlg1bytPSlA5aEZpSmtuVW0zTHlxTkszc1AzUnFJaVhHK3lXUWpH?=
 =?utf-8?B?WHhNdWx6TC9iTTdlNjM4UHVuYWhGRUlxQ3hZZGtVSjJ2VzNqM3JzZ3JtVndU?=
 =?utf-8?B?a1pqWnFLUm1uYUVXa0o1OUt3Z0l0NGcySittWkVKR0RnQy9vZWdoWG42ZW85?=
 =?utf-8?B?dWhhTEVYVXlhc1pCVndDL2JZajVxdktDazJZclEzNEdwamdPSFZMeGt2UDQ2?=
 =?utf-8?B?RzVKOEErL1ptZ1RMVnhGZnIxT2xReU5EdWhpSWl2eG81cHBwdEtvcEd1UkY3?=
 =?utf-8?B?NkFXeFo2ZkRXRS9BODB6YUpJb2J2WExJRFBuL0N0TDBpMUJneTlWTG5TSWwr?=
 =?utf-8?B?SVFoMmlLZG5vbVM4REhGTTBJcHc1VUFSTkNsYXBuZ2NoLzRjWHVIUFhHekRI?=
 =?utf-8?B?OGFxajJqejRiMFBZK2d5YUhxTXJkNDVoK1F2K1c5UmJrUGFCK210amdMU0dZ?=
 =?utf-8?B?Z1B1dmxMWmMzUmNjOXoyaWlNN3ZOSDFBbVZLUVJvWHBEcGVTQklzcXNSMFZo?=
 =?utf-8?B?SlYyNEIvWnRJcVpueTM1L3lvd1BscVBjVmZjTXJCWHNRN2hUS2hmWmN6ZlYr?=
 =?utf-8?B?ZndWOVVuaWh1eWM5eTd5WExNangyS2hwTjQ2NFRHSkxtNmg5RGlJMjNnbDBr?=
 =?utf-8?B?bW9yUmpsYmJ5MnRYbFZLaE52WFM0eEF4SmtzTGdja0hrYzdXRFZnTFRNdTlF?=
 =?utf-8?B?eHFiZzJrSHhybHFKSTlQMCsvdXNqZlg2WkE3VUtYL3NwMnAybDJKTmFXaEh3?=
 =?utf-8?B?OTJpZzdVZG84aTZoVjRkdlV1TUplK09wZ3VLaWd0N254bUJ3bTZGRW02bTNH?=
 =?utf-8?B?L1JFZTJZTko3dFp6N0RHS1hpcEdQYnd3dXBXdFhvMFM5NkJVYVhqdjB5QTF5?=
 =?utf-8?B?U3pTelZZTXVJR2VwUW9zV05oc3B0RjNsZE16aFN2QkJ4M1RNTmNvalJabzM5?=
 =?utf-8?B?aEFNMmMrRndXUVJkMU41RytBeUJjVW94QW0zTFVVRGsvU3ZTVExpbUNxR1p6?=
 =?utf-8?B?bDFqWVFEK1FQaHd2UEZnWXZ1VnRwN29JaU55WE1KQkdBVjlPR2RUWjd3Sk9s?=
 =?utf-8?B?eWp5RmREWXN1dFZlN1FmYmtSTkdHQ0VzNTBxc2s5VHdzTFJCdHdreXRkYXU4?=
 =?utf-8?B?WC9NelpEMW5HZjZWVkZDTUo3ZkpjNFlIdHMzVDlIZS83UnJra1lIU2FJdSs0?=
 =?utf-8?B?SUprYWpvUlhjMzRRU0YxLzlBMVVmMVd5VElJODVzZG5xWWtGSGFpR2JsT0dT?=
 =?utf-8?B?SDJNT1QrYnhuazdYREMwbjBadGlvQ2Vsdk1RRGltRkFHVGRsdmZXcVJVTVVa?=
 =?utf-8?B?Sm9YZlRtc3hxOGZESUU3cFFYVUgwYXZUY2VEaW4xOUNldWJFaXVjaktGeWox?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4251c0a2-9bb6-4061-cf2d-08dc17ec9562
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 06:13:26.8814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9tkyTwbvMciSS+h7+ZFsWelr6bgth58joUK9VYQBK/So+/gM3PJrnv1Vrun8/aFfDDu45sEgX1rvy/xjYbkaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6223
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

Hi Riana,

On 22-12-2023 13:16, Riana Tauro wrote:
> Guc version numbers are 8 bits only so convert to 32 bit 8.8.8
> to allow version comparisions. use compatibility version
> for the same.
> 
> Engine busyness is supported only on GuC versions >= 70.11.1.
> Allow enabling/reading engine busyness only on supported
> GuC versions. Warn once if not supported.
> 
> v2: rebase
>      fix guc comparison error (Matthew Brost)
>      add a macro for guc version comparison
> 
> v3: do not show pmu counters if guc engine busyness
>      is not supported
> 
> v4: add version check comment only in the check function
>      remove it otherwise (Umesh)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c                  | 11 ++++++
>   drivers/gpu/drm/xe/xe_gt.h                  |  1 +
>   drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 37 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  2 +-
>   drivers/gpu/drm/xe/xe_pmu.c                 | 12 +++++--
>   5 files changed, 59 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 5825471a3422..a48cceaa7750 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -800,3 +800,14 @@ u64 xe_gt_total_active_ticks(struct xe_gt *gt)
>   {
>   	return xe_guc_engine_busyness_active_ticks(&gt->uc.guc);
>   }
> +
> +/**
> + * xe_gt_engine_busyness_supported - Checks support for engine busyness
> + * @gt: GT structure
> + *
> + * Returns true if engine busyness is supported, false otherwise.
> + */
> +bool xe_gt_engine_busyness_supported(struct xe_gt *gt)
> +{
> +	return xe_guc_engine_busyness_supported(&gt->uc.guc);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 9bac85cdf609..bef99eb2fed2 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -42,6 +42,7 @@ int xe_gt_resume(struct xe_gt *gt);
>   void xe_gt_reset_async(struct xe_gt *gt);
>   void xe_gt_sanitize(struct xe_gt *gt);
>   
> +bool xe_gt_engine_busyness_supported(struct xe_gt *gt);
>   u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe);
>   u64 xe_gt_total_active_ticks(struct xe_gt *gt);
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
> index 24e72555647a..2dd06563d0ad 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
> @@ -32,6 +32,9 @@
>    * engine busyness % = (ticks_engine / ticks_gt) * 100
>    */
>   
> +/* GuC version number components are only 8-bit, so converting to a 32bit 8.8.8 */
> +#define GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
> +
>   static void guc_engine_busyness_usage_map(struct xe_guc *guc,
>   					  struct xe_hw_engine *hwe,
>   					  struct iosys_map *engine_map,
> @@ -110,6 +113,9 @@ static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
>   	struct xe_device *xe = guc_to_xe(guc);
>   	int ret;
>   
> +	if (!xe_guc_engine_busyness_supported(guc))
> +		return;
> +
>   	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>   	if (ret)
>   		drm_err(&xe->drm, "Failed to enable usage stats %pe", ERR_PTR(ret));
> @@ -122,6 +128,28 @@ static void guc_engine_busyness_fini(struct drm_device *drm, void *arg)
>   	xe_bo_unpin_map_no_vm(guc->busy.bo);
>   }
>   
> +/*
> + * xe_guc_engine_busynes_supported- check if engine busyness is supported
> + * @guc: The GuC object
> + *
> + * Engine busyness is supported only above guc 70.11.1
> + *
> + * Returns true if supported, false otherwise
> + */
> +bool xe_guc_engine_busyness_supported(struct xe_guc *guc)
> +{
> +	struct xe_uc_fw *uc_fw = &guc->fw;
> +	struct xe_uc_fw_version *version = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
Why not XE_UC_FW_VER_RELEASE here? Or should we check firmware type 
(compatibility or release) first and then derive version from it.

Regards,
Badal
> +
> +	if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(1, 3, 1))
> +		return true;
> +
> +	drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
> +			 "Engine busyness supported from 70.11.1 GuC version\n");
> +
> +	return false;
> +}
> +
>   /*
>    * xe_guc_engine_busyness_active_ticks - Gets the total active ticks
>    * @guc: The GuC object
> @@ -133,6 +161,9 @@ u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc)
>   {
>   	u64 ticks_gt;
>   
> +	if (!xe_guc_engine_busyness_supported(guc))
> +		return 0;
> +
>   	guc_engine_busyness_get_usage(guc, NULL, NULL, &ticks_gt);
>   
>   	return ticks_gt;
> @@ -150,6 +181,9 @@ u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>   {
>   	u64 ticks_engine;
>   
> +	if (!xe_guc_engine_busyness_supported(guc))
> +		return 0;
> +
>   	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine, NULL);
>   
>   	return ticks_engine;
> @@ -173,6 +207,9 @@ int xe_guc_engine_busyness_init(struct xe_guc *guc)
>   	u32 size;
>   	int err;
>   
> +	if (!xe_guc_engine_busyness_supported(guc))
> +		return 0;
> +
>   	/* Initialization already done */
>   	if (guc->busy.bo)
>   		return 0;
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
> index 57325910ebc4..e3c74e0236af 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
> @@ -14,5 +14,5 @@ struct xe_guc;
>   int xe_guc_engine_busyness_init(struct xe_guc *guc);
>   u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc);
>   u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
> -
> +bool xe_guc_engine_busyness_supported(struct xe_guc *guc);
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index c2be157a6f5d..f91652886b67 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -55,14 +55,16 @@ static int
>   config_status(struct xe_device *xe, u64 config)
>   {
>   	unsigned int gt_id = config_gt_id(config);
> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>   
>   	if (gt_id >= XE_PMU_MAX_GT)
>   		return -ENOENT;
>   
> -	if (config_counter(config) == DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0))
> -		return 0;
> +	if (config_counter(config) == DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0) &&
> +	    !xe_gt_engine_busyness_supported(gt))
> +		return -ENOENT;
>   
> -	return -ENOENT;
> +	return 0;
>   }
>   
>   static int engine_event_status(struct xe_hw_engine *hwe,
> @@ -71,6 +73,10 @@ static int engine_event_status(struct xe_hw_engine *hwe,
>   	if (!hwe)
>   		return -ENODEV;
>   
> +	if (sample == DRM_XE_PMU_SAMPLE_BUSY_TICKS &&
> +	    !xe_gt_engine_busyness_supported(hwe->gt))
> +		return -ENOENT;
> +
>   	/* Other engine events will be added, XE_ENGINE_SAMPLE_COUNT will be changed */
>   	return (sample >= DRM_XE_PMU_SAMPLE_BUSY_TICKS && sample < XE_ENGINE_SAMPLE_COUNT)
>   		? 0 : -ENOENT;
