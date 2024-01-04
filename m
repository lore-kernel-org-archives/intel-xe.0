Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ECAC4706F
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 04:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C172D10E034;
	Thu,  4 Jan 2024 04:57:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D18310E38D
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 04:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704344221; x=1735880221;
 h=message-id:date:subject:to:references:from:cc:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DjFCY8U+YklF4AsAsUAXUa5GlM1ndZATEaB2KMWa/DE=;
 b=BkukN4vjnGlMt2KEPLSHPAPW3xGmb247+KdqVeBAgS/fSKvYgB/AYMXx
 /pk4QJrplMgQOlJ9lPs9joc9/TLrBo1FP5+WlRVir0Rz1nq9qvPgQeoyt
 FyjBJi7qhReE2ftgx2TkB2n98SByCTU+hyoUb0+WFrfsUl3mRwLwFTNdH
 E+lRqJn9+z8Q87wLPHObEjqj3xveQCAUWo50UueVrW51Yb+YqvNDu8wEo
 Ua5NC3/UW3Gu+/vCNskntgl0dBK8jKR/eLl2XwrFhcwvBCKdKahSe0qQ7
 Ea+AiQIjRqWAszMW6vhox+nnSD34D9lHztVgqcoydyEvIEYunh8pJWukq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="483306197"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; d="scan'208";a="483306197"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 20:57:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="846110536"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; d="scan'208";a="846110536"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2024 20:57:00 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 20:57:00 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jan 2024 20:57:00 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Jan 2024 20:57:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKpw4qZbgErOVZsQDcMGIO6GmPPSDdLePmkMsk9DHfoP5I88SngIQRypAF0weJWw9lw+UEvLhqMOVP8BY4ucXqHLuPUBv7vUALo/1qJ93DvZKDusH/HLepiXjeZqb0wuHLgBKxqhrBLn9QEMISO0uIs3egLRDjE6vQiKsrecXRnT50oVm3VoBY/E1+C/df7j8Ch755lqp7L5WkYWkg+i4WAuhFjzqKWVuhftpgWGXNj0f468xjDZo4J4t52IfP78H1dM+IucHMf5vD6a8TVuubH5sUC10nP7NhgdaJrovjWLcXun9nk9fweviVqfgPAyoRSQUb+tV5OtexA2h3U+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJnpyGc8wJTQmrkgTrsJCgqXlprAbkortDydmhV2e9c=;
 b=gjJaQ7kF97cLEsbNtfYpO33iqYdkY5lgCQPf1TpULjBQwEgB7dqYIQ/aFgqBrFMotslms7/aGCsF73AlWmBubXJAac84RVtVT3o0XIVm0jjiGMaZyTS+2znkdci9RORTU73XNuWZiK5pj5zLVhqIM9l8jLY9fD8Kyl7ACFIsgYES/Yd6F16MJR2u6az+i30jZSQ3WGU/LezHqhwbwv5+cwHKZ4AKNdiarmbmKajFakB9yFqgue8j5KG21/ahE1HSzK3k1/YwJFDf1bJgLEHARk8+9wRFNaZo+9+Mg6ypJCfLFGuPmbxz11H4zQeVO77/L9OuZT0KM8m/qwAxKZ8k2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Thu, 4 Jan
 2024 04:56:53 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::7c9d:1857:d17d:53da]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::7c9d:1857:d17d:53da%3]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 04:56:53 +0000
Message-ID: <dd42753d-5cda-4e95-a299-0cda55df4184@intel.com>
Date: Thu, 4 Jan 2024 10:26:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Check skip_guc_pc before setting SLPC flag
Content-Language: en-US
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231222210109.533215-1-vinay.belgaumkar@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20231222210109.533215-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW3PR11MB4649:EE_
X-MS-Office365-Filtering-Correlation-Id: dafe2ab0-a1e5-4d36-80fb-08dc0ce19194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5E9AGMq4UZbmCSYWqanj8TD12njbmUloKcUMJDPWfGRtbgxoRii5jZcF95PyYDa0Gj9Bobij7ewiuftwb5nqcFl0VWuKOUKq61Gu/Q2eok5PAGN41sUnc+Kb5Fqkc7yvOQN8S+mzWUPQ7is3eGJMfPydCxFoenvqsRbP9u3arV85iSwrdlIfGsIX6XSmnbPZ7Odn3H52J4jepOgryLlFoMzGPABGD0p/Hb8atOpAXqs1X8mY2bE5pD3/uWxeX1AyqGRGjm2Vj01CJot6QFfKn+tnOcK8eiS7mVbYO0KpXmrSBdJA1Q98/zuYIFRMx2quilrsxFcY7d50NLu1aOmXjJEP2AkU1z6qxw8Cx9wAkghyJ7kaAUUhzOW2s/KxvXk6CPuOb7t/clhzu/edjdW1g43zlrBT5e6A5Y5H/mTXgBda0vpGSWlcYRR0e8qF8oj1fWjx0GaS33R4aAAFEyNwojFUE6p1xlvO65IOfHKlxqaLcZEhOmYGTQsXXbWSbQ7jfaetqo1RnZnmHW+57d8Ua0Y/6dHp7b1b+zWD/ftx9eWXSPI2A/GRvYa7IHJp39paq07QmbbDJ4Yzz+EKj7mtrN/9o0ZVJXnKxR5wm5k+gSLEJOwhvfrlmjMQ+iIXg441L9hD417+1ZneTdG5XGzzUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(396003)(136003)(346002)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(31686004)(107886003)(83380400001)(26005)(2616005)(6506007)(38100700002)(31696002)(86362001)(36756003)(82960400001)(6512007)(4326008)(5660300002)(6666004)(66476007)(66946007)(53546011)(8676002)(8936002)(66556008)(316002)(478600001)(41300700001)(2906002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckRwekxJVGlUMHdMV0VUc1d0WE5QWUZrcTZiaE9xeGxTQVNaelM3dHJOTVFJ?=
 =?utf-8?B?RTdMbVVzVGZNYSswYjIzVStqWmw3M2J2SlVXQkxnNTBoSUdlZGx5YnI5dXM4?=
 =?utf-8?B?Q25RcEdNWFVxbUpVeDZTcVBWV0I0LzVteTUwUXlsV2c1aUlpSitSeXpyRkcx?=
 =?utf-8?B?emc1TzhEbHZhcDZjR0FJUlQ5QzdrNFRVWTd5N2EvZDljSHRieGM0OGg0c2Fh?=
 =?utf-8?B?dGZmVHhqMXBIcWFaMEdBdzAzQldlOGV1YnhLRnkvMlU5OXN3MWE4eS9laFRP?=
 =?utf-8?B?MDAzNWMvWGlReGZFWFhkMkFvOC96ZTE1YzF2OXErY1RuaGZtbzZFRlhuNjhH?=
 =?utf-8?B?YWRialBOUWh5M2dCSktEaHVCYnE2VFJwYXp5QUQwQjJCcUtaRUdSSllEbnZD?=
 =?utf-8?B?bVVxaS9NZ21mYk1TOW1VR3ZtNGdkcmEzS0ZtK05yc2lQWmhuMEdNblhwUnJ1?=
 =?utf-8?B?TThTWE5lVlRzeXlDQVJuUWQvdFJLUnh1M3JtUkkwNGgwb1J4VEdzQnBpZXlw?=
 =?utf-8?B?UkoybHJBb25uMmhJKzVOcXZlUVdVTkcxSkYvb0hGNUhDVVVmMGRPRC9teEp1?=
 =?utf-8?B?NnNlRm9QUFlFVENLbjkxbFFVSTJncVFnWktXRmNqeTBaRDVYQmRUaVFVZW14?=
 =?utf-8?B?YWltY0dBRnRVVkkrMG5BN2RFTGZUMzB0ZHI4bERwMjBVWTR1L2lIczdkY0Uv?=
 =?utf-8?B?REYwSzBuZ1ZoYzd4QWdicXAxRjdGK3d0QitUK2VwZGVmblAvNFVMV3dxWGVD?=
 =?utf-8?B?TGU5L3h0dytHeUo5dDYvbDJmZEdVNjRJTnExRUpmcGhzQm9yZFc0M2hnYVNR?=
 =?utf-8?B?endKTXl6dXJLbmNxM2w0cTluTlpBdS9jVjc1aTFFVFV5b2ovdFh1VVJRUjAz?=
 =?utf-8?B?djJOM051R2pGY29XWXl3dUpzRmVzMWg0N3FEdzJ0Z1I2MjJ6ZmhMODdKamo3?=
 =?utf-8?B?YjkvenExQythY3Zyd3NvN3Q0aHN6VVR4UUQ4aWdOQmZ6VkJwelYrRTFTRlRz?=
 =?utf-8?B?Y1YrNVRMMUdsUUx4MlRaclpDOXVDRi94ZG9RWnIzZGxVcnBDY1Y5YWI1K21C?=
 =?utf-8?B?NzdyYTNLTmN2alVkdXR6Z3lHOUk4TVo5SC80WWJKcHhpR2U5b2I1VlNZeER4?=
 =?utf-8?B?eFRqM1ZMd082ZDFwRWFDRXRnTW5pMUhPQ0pnb1NBSHVGVStzV1JzRTVwZGFq?=
 =?utf-8?B?OUZ6UFFmU0l2cVI3d2FVMW5hbXVBQUJCb0xxQ0hmb0VuRG5EektJTVZUaGkv?=
 =?utf-8?B?a1Bxb1BQcW9pQkgwdEZHUE1PMWtKbUlKMm9rS0lTak9USGNpdnI0eDZDNys3?=
 =?utf-8?B?a2tFZzNsWWtFbG1vdEtDU251UU1yQ3NsblNocmJQMS9JZHpTYmkzMXh5dXBO?=
 =?utf-8?B?MGpFVlEva3kxTHJEazFDRWlaRHpSSitNQjM4RXV1MG9vMkZGZGtieUFEZzZ3?=
 =?utf-8?B?QnpzYXVEVmNvWjI4OWlRZkJxTEZkNzFyV25yRkgxc1NKRjZWY3NYTFAyQWdL?=
 =?utf-8?B?S2l1Qjl1STBZcGt6T2RpaFRweEVoSFN5L25hQjR2c0lHb3lzSmE2K05lM3Zo?=
 =?utf-8?B?b1JyMUZpanp0UWZibGNHQ0tGajhuU2NUZzZLNi9mRHZ3ZDJDVXhwL0txYllJ?=
 =?utf-8?B?alZSSUhCZ3JPNFpSaXl4Q2Q5am1BM2JKVzdMTmdpdXZNbVhSTnRHY0pVZ0d5?=
 =?utf-8?B?QjBVbE0wRmNhT2NySlgvZWJrNHRzcmFYSC9lK3lUbkpXWlQ2U21BQjB5SmND?=
 =?utf-8?B?aXp0ZE5XRXlwYUx1VytkZjNQRHptY3JLaEh1SldNc05SNDk0L0I2M2FZTU83?=
 =?utf-8?B?T1psTk9QaWUyQitOWGZWRmhGYUJxNy9wOTZtdi9jQzF2OWs2c1dRT0ptYWRj?=
 =?utf-8?B?WlNab1M2c3Jxa3BVejhkdTBBcmJRMnpsWVNhUG54dHMwamlxbzNKM1ZxTjhW?=
 =?utf-8?B?ZFhOM1VmWkFDZ0hpTE03bjdnNURXbGtOZ3l6U25UL3FxMnFlek9tazNSMFJE?=
 =?utf-8?B?TFVZSmdBSDN3TjhSQUh2cW9QSGc1Yks4Vkt3YmxpSEdaRUJUdWdNZTlLOTha?=
 =?utf-8?B?UCtEZWw2NWFzMWJnZ0ovdDBpd0owa3d1MzBaU1hSTE9seEUyOTFmOHRZa29o?=
 =?utf-8?B?SEt3b1ZPdzJrRlpzMkVWRnZHOC8vblVUMGxMNjVkUElaU0tzY01jMGJRM2pO?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dafe2ab0-a1e5-4d36-80fb-08dc0ce19194
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 04:56:53.0486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVaaqsRATD6JA4gAMNt3Q3gG5MPvfOitwQRvvLBVs8uco/mjEe2kHtcCq23o+0MOOd2FJOmAXXESnzxvYtA1qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Vinay,

On 23-12-2023 02:31, Vinay Belgaumkar wrote:
> Don't set SLPC GuC feature ctl flag if skip_guc_pc is true.
> 
> Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 811e8b201270..0e112b144ec8 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -62,7 +62,12 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>   
>   static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>   {
> -	return GUC_CTL_ENABLE_SLPC;
> +	u32 flags = 0;
> +
> +	if (!(guc_to_xe(guc))->info.skip_guc_pc)
Frequency attributes freq_min/freq_max may not work when skip_guc_pc is 
set. freq_curr also may not work. I think these freq attributes 
shouldn't be exposed for skip_guc_pc case.

Regards,
Badal
> +		flags |= GUC_CTL_ENABLE_SLPC;
> +
> +	return flags;
>   }
>   
>   static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
