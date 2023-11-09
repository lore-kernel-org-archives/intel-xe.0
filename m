Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE83C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 05:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596B410E1BB;
	Thu,  9 Nov 2023 05:57:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CF610E1BD
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 05:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699509467; x=1731045467;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3LisWiMXk25IuiUFsD8Uy3nOs80yxTsl4+m7cVyqK5Y=;
 b=k+QuBv5HZxzYHI0w1PwCNW8Ffi2X6yIZN81tghThtuxT1EhNESq9hzmJ
 vkTk38HuzdtE1WCpMgWPUzVcri89BUAXqSE5LtPpVCPzaCgWnM5wHb58n
 4eyhJqwFJdU7DeTs9EROUR+DhRPaPYddvHZpIkop9l1tZU3NKlxcHCin0
 tUAZjNqFtdmTpE2YURScJ9HE9HL96G+I1MM76scNd844aL58Uk7K6mnzk
 ZbAvVQsscV4vh6Y+d9W0udd8vj+kA/0fOSLLlYNYrKLYgyXarjt/+skjy
 TgNLYLgWiVhYs/29qmMD5Vt7GyTzMhXGACB1B2aW3ump5udydd6ce1Ckc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="392795755"
X-IronPort-AV: E=Sophos;i="6.03,288,1694761200"; d="scan'208";a="392795755"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 21:57:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="756790412"
X-IronPort-AV: E=Sophos;i="6.03,288,1694761200"; d="scan'208";a="756790412"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 21:57:45 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 21:57:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 21:57:44 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 21:57:44 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 21:57:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPZc+ZwgVmEsLCyr52T4Ve1y4fjafK4kElns6q88P9EfwOMNsB60jWbOi9uZFI1Rk47DWhFoKjxe0XZojYkZ5T0hiWgm1v0vs2ijvlp9Wj81QjsYUaNAPXpb/geiKrHTibx7V3BGirqlWho1FePpMaN4uLTMD8C9/AXggmZ3ubT6v+IX5pBGkKnu7+TfXoLtOiy1PFcaUR6H9HAviWxnQyLMI5jGB+yQyWhXcKG0UaS/guMGYaQaxQFlvjnpSSMc1ucsFJgSlQhBFmtoXEbjhHxGuvEWv320SnTyHy5MO0I9fQE0Pi4elSoCEIG6Kxomymeg4tesVswS8WmiPEwX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yI2Q7mwPdVhsLuR8jBR1K1sw9DNhERbldZo2EqHdev8=;
 b=FiyWZ1O/s+lJA6Yx5JpQIRfy6Q3X4gCsgGcKT6Urrebq7yPZrTIAqb+0aVlk7vPk5cyqw6Iwf0ZzIeEtajiWWbkLNcrsC/OULuLrGNde4nECTWe1xckxwirFj8sMeOJEbzOe6uAAXeCkBFbB4PK6PkYhIJyABJXnTCN7Z7dCv2hv9acQMCkKSLpqEdIzr6ZjV05ErGCTFAvz11oikB4zXxdwboh2udCsafANd9dMY5xdyA+tOP0bCxIrymdY54cKtoLBGt7Xw0LEbirFpaEyH0sGWOnYW9DMAZFylhcuY/edcGEebUJaSIUzyXGoQbTCLLdDlJN1VRmT+WEC6+LHSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8597.namprd11.prod.outlook.com (2603:10b6:510:304::22)
 by CH3PR11MB8239.namprd11.prod.outlook.com (2603:10b6:610:156::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 05:57:42 +0000
Received: from PH7PR11MB8597.namprd11.prod.outlook.com
 ([fe80::4005:2e09:e456:6f4f]) by PH7PR11MB8597.namprd11.prod.outlook.com
 ([fe80::4005:2e09:e456:6f4f%5]) with mapi id 15.20.6954.029; Thu, 9 Nov 2023
 05:57:42 +0000
Message-ID: <f41106e5-1c59-4384-b365-850b4bf38086@intel.com>
Date: Thu, 9 Nov 2023 11:27:36 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20231108073351.3998413-1-haridhar.kalvala@intel.com>
 <20231108175935.GT5757@mdroper-desk1.amr.corp.intel.com>
From: "Kalvala, Haridhar" <haridhar.kalvala@intel.com>
In-Reply-To: <20231108175935.GT5757@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::29) To PH7PR11MB8597.namprd11.prod.outlook.com
 (2603:10b6:510:304::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8597:EE_|CH3PR11MB8239:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f21ed2b-d492-49c1-48c2-08dbe0e8c940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h7cYbOaypU1vWhHgYSoUnZuqmQPXnBcNcX2/BYelbrsyHd0t1aXIRW26Ttv54z1bOXfdKiCXy5BO4BfAwOs1/k/plMGqWWHCk8x3G2r5rz3AAmksqCrOHrkoOczusAVctsoy/JT2F9pxIuvPSxPDkQrfxa720wM9ADJCQR9rv2zARQsCeblBpKGDeuoi8TBuYkp3psSiNr9S1sCUrTpaBQQzw0k8x4DkPDnr5B8IPGPr4Eykqcl4YaApMAnbRGL75bsOQp64WSMFMomz9FSkMUPXPGD7WH6rG2+8nS/tUSGx0Owirxp6s5F7em2w7MjOroQujxQiuCG0Rzo1beE19d3s9rUwx7HBkFrzU2699a8eK996Z3R3OBCTdGVW7UkfKqUGo2ajguEEuos3r1h83ys5rd2Bhd0DY0mVEi5kEPNVb5hk0C2wroNUeCWuT+O23B8pDA83I2MuBj44TYC2YkesRJIjll4ZOUPbMS88e7L9ULkRhKX0fknexV3i8aIHUsTSda7MdrR+mroYWYiICxDnlN+XR/H9D41qHXC4BpZlCunS+BJGyAcuNQV1F7Jr78sFDGALtdhOd4QHEGZH+r3S3j8xuafQ+PSaUhvNoM68QXGyWhQlu77EmHB/L01lqfubuI2QhPBJs71ihVUMMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8597.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(396003)(366004)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6506007)(53546011)(86362001)(8936002)(6486002)(6636002)(6666004)(4326008)(478600001)(6862004)(5660300002)(36756003)(38100700002)(6512007)(31696002)(66946007)(66476007)(37006003)(8676002)(66556008)(2616005)(316002)(31686004)(26005)(2906002)(41300700001)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW16MVNHMVJ1cmR3L1B2cXE3azJnOHNzUVF4NFYzVDZOeWJQZnhrTW1yY0Fq?=
 =?utf-8?B?aXcvdzlPcXdLSmgybHpud2xLUnVCTmJjZ25CcGh2TlgxTlRDUHUyTjMwc0tp?=
 =?utf-8?B?dFRRRlFMaUs5Wm84S1kzeU5RNm9OdHRISkZhNlhlVlhNczFrWXh1Y01UcnQ1?=
 =?utf-8?B?dFVJWnptZkNnVjROdlB4Qkl6aklUTjVFZURmMlRxSTZSeDdWaTV0UHhTMElX?=
 =?utf-8?B?U0NhSlNKMUl1VWFYbGE5MTVUZzVEYzN6dWhHRlc0S3dYNDJTVk11YmhINUdT?=
 =?utf-8?B?S2lVVGNqM1BaVHhjVDQ1b2FGYUFNaWIrYW52TlpISG56UDNtS2c1bzBPM2s0?=
 =?utf-8?B?ZjAzWlF6YnVGaTV1d2xMK0hWakdqZU91a0FraGxkNUFJejM1eVFEUk1qWlFk?=
 =?utf-8?B?dFBraklFcU1oQkJBYkpoVWFwYVFPS0U4RytwTStSQ3dDcEVxRGJsNFN3TW5Z?=
 =?utf-8?B?SVlZd3k5WFVoZTRxRExzZS9qMk1yckhxVzlqQm9NblRCRUNMR29qeFQ3MUFt?=
 =?utf-8?B?d2NaZWg0K1VYSDdhWjAwNzBGZUlKKzNKaTBwVXdMZSsvQUNnYWdTYzVhRWw3?=
 =?utf-8?B?b2dnbHc5akF4WUJvTERJNUJlcFV2QUw1Z3FQV0lROGt0OVh5RU5qZW9tKzha?=
 =?utf-8?B?ZnhMWEZteWNQbHlLa3BUakFRc05HT0hEWnhYa2RlL0hFeDkxZi9FSnFMMDNh?=
 =?utf-8?B?OVZpK3VuMDdSZis5ZTBZM0FEK3grWnkvbkE5OTlvSDVHVlNTRFQrYkk4NlZK?=
 =?utf-8?B?N0pYK2duUC9TS051THFwVTBaOUFwSnJsZC9BNnd1OWxwT1pXUmRKNTFVKysz?=
 =?utf-8?B?OE9jaUF5T2FzdTlCbmFieGRjNUhhYUhSdDhldzBSekhWako1UFNYWGlHUlNr?=
 =?utf-8?B?Nm80S2pMOVQ0RWh5d0ZyRDcvSUlKeEhJMG96U1NvdDJScEpjaHB0TW4rMVhw?=
 =?utf-8?B?RHdvdmw3M0FEVHBiNGNpdjV1NUhqWVZQNU5Vei82L1VTMEQ1YmtPY2VmOW9i?=
 =?utf-8?B?NlpkblRUUFpNd3ZWRTViNUtwZStZbEZmaUNjNDN1SVV3cEZKMWtCZnJBWlU3?=
 =?utf-8?B?ZGtkZ1o1RFVsMjhlRXlLOFpwbDN0VTN4QzNZTVAwY3ZGa1hySWptb1JYN1BN?=
 =?utf-8?B?ZHVkaG0wRVRTdDVuaEQxNlczdHdSVkNRaloyOVZNci9WZzV5clVrcnp3emE5?=
 =?utf-8?B?dUhXb242bEtHUjNqVmhuUEswWW1tVlNrNU9YNHRycWd3ZWsvT2JadkZndDFr?=
 =?utf-8?B?UTlISzUrcjF6SEpIdkRvaTRtQUdLVlNZZ2RYWkNva3FoWU8yV1ZmditJN0Jv?=
 =?utf-8?B?RDNzNTBxakhUeDJLdTF4dWtDMGhDWHpMbmsranpKdXpwODdocytDc2tObnFa?=
 =?utf-8?B?NkthS3oyMzZQOS84RW5YMFJmNU1VSjBqSUFyVWZDb1lKVWVoTU9HYjVzcGlh?=
 =?utf-8?B?Z1Y3V2cwTzZtUWVlOWd2WnFvQlpyTUFqQ1h1QVNjaUc4NG1DeG5ON3BoYjRv?=
 =?utf-8?B?Mk91ZGlCeU1yU3N1ZHJvRFRnVXVsSzNrSENzUm9uTm03M1FCZjhWdUI2ZnRh?=
 =?utf-8?B?QjNkYmE5L0lEbGZZNEZEakh5dGlwQThBTXNqNW4veG1neUUzRlRqclF5RFJY?=
 =?utf-8?B?YTVDaHVIMmdJVmo4V3d4eWtDNjZaWDI2dFVrbkRyaExEM2NWNnhWaGJoLzRq?=
 =?utf-8?B?cnRYVE4rRHpSdVg5M3QyYlV2UFdFN3Arb200RXA3ZnQxNEhXRk54YVkyRjFz?=
 =?utf-8?B?T2s0dGltbENpTVpLdXV3Z0FIaEwrdFB6MzMwZW10aVErOVBDcGs4RDRlY0ly?=
 =?utf-8?B?dW5Mb1EvVUI2OHFLek1wb2NNcFg5a0xSZTdtWUZxaWRaZjA4OFhBaVNzcmVI?=
 =?utf-8?B?azZMK1Q0V3dDdjQvZWFvQThIVnJacUh6ZWgzdkk5bjZobFdrM1BIS0tZazN3?=
 =?utf-8?B?QUVWQTNGMkJvUThkVW1NTW0vNmUrODhCUG1takttdlBlQnMwa1VFYnVaT2R3?=
 =?utf-8?B?L1JBRnI4Sjl3ZTBDdWdMSUJHbDRvZlVxTFJNaFdWQ3BwT1dxbUduVmRZMkNN?=
 =?utf-8?B?b0lQRSttRVhXRzdxd0x0bDlZVy81a2Q3cEpGTHY1UUNYc291bWpVUC9JNHda?=
 =?utf-8?B?T2o4YlI3c25WUXlPVnFYUkE1MFFLdW91ZkFJSVZVR0l2TGxpWlZMMS9xNnRh?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f21ed2b-d492-49c1-48c2-08dbe0e8c940
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8597.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 05:57:42.2990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+wgry6LguXtoOvvn1s/U92JFEJ8lCWIhF9cHVmlV4fGn5Ta19E2Pji+4zN7NjB5BOpf+wlHE5FmpdZCN47YNXt7HZ413Az2YeH5sRm8yXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8239
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1] drm/xe: Add Wa_14019877138
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


On 11/8/2023 11:29 PM, Matt Roper wrote:
> On Wed, Nov 08, 2023 at 01:03:51PM +0530, Haridhar Kalvala wrote:
>> Enable Force Dispatch Ends Collection for DG2.
>>
>> BSpec: 46001
>>
>> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
> and applied to drm-xe-next.  Thanks for the patch.

Hi Matt,

Thank you.

>
> Matt
>
>> ---
>>   drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 614e114a5342..d03e6674519f 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -677,6 +677,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>>   	  XE_RTP_RULES(PLATFORM(DG2)),
>>   	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
>>   	},
>> +	{ XE_RTP_NAME("14019877138"),
>> +	  XE_RTP_RULES(PLATFORM(DG2)),
>> +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
>> +	},
>>   
>>   	/* PVC */
>>   
>> -- 
>> 2.25.1
>>
-- 
Regards,
Haridhar Kalvala

