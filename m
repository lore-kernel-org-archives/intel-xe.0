Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FADFF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 12:41:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1CC10E156;
	Tue,  5 May 2026 12:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlzvcwn7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECE910E416
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 12:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777984862; x=1809520862;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qSbabRuVd0+jF18Pf+b1Jz7hwBBSkjBQKwui+Khkkqo=;
 b=mlzvcwn7B3D1grlC7x32ktmaMNZbTk3t/gPNCQDxsHsIjRVOmopEGQh2
 aZyHoqx6WiiWBNOmo+QQnNBVB7x+2aHe0+4P+TiXN+SHzL7iuG7oQs0SD
 Y9lrVl3Ihcw4WjQpjHenV1CmIexKCb/wMh1MHzHtG6VmfY6omMYcwzief
 Yw4S8L+yKkGc/0jkWSprqDzZrNW/w6XIgNm3tMBGcBotvpWVMyj/ZfqV4
 ZzAIVyZ//mqhBakuXzrW4apqrM9Uq04Wt6xoWQFufB18/xOmknLRtWjt9
 CEz2IroQ3AEwJ7oDt3JMwnOSeJNW0+McJxau/0upE0NRQp4/7ul+KWe/e Q==;
X-CSE-ConnectionGUID: VvZusikwTHSXkeO54KIpQA==
X-CSE-MsgGUID: n81zrYtSQbCpFXgOEZQSVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78760585"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="78760585"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 05:41:02 -0700
X-CSE-ConnectionGUID: OxL/f20kQZW1/h6eUM8PsA==
X-CSE-MsgGUID: gcIw5xOWQhej43Fqj53rhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="233139360"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 05:41:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 05:41:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 05:41:00 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 05:40:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIdg9nQIyrCF0tMhisXrDkHEsH9U+FiDeZi2UqIXbBOnXlIEOSZPJBZolwVHdAVmc2O/ueFEIZWXoojD4dkdUBmQIS1AE6IbsXYW0G0sXqhrE9WlV5sT06nRCSA2GbaeBBbcmCwL4w8SIF7Dmr39qzcFNJwWhkYuJqWxK6nYSTBYw71Bv9MvX5p189RP1n8mAunaDEtUr3+WATBkama/ckqYEoC034Jtrj/gjtYnh27g5IgGj79WVLw8hW00mzhQvT0tJG6h2U64FbIFhKP4MP1jgFqMp9frsKNw0VIssCBH8xcMH4IuPHkLpLRKtA5Ph6U2s6brslqF8tY3a+GuVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jb4ivG6R/kxUUwj4FmLN5AP/P56gnfr4MLh5zfkqbEw=;
 b=D8Z5p3sWTKObDQECgKy393bZjz6DacsgI0yaKEUogHJ8M4MIQN0wRKofdXYbz2gscyDg6et9+mXkZhZe/UsMnUZkcqV9YUCQjPTywciIlipyMbArcSJU3tZ5sEmnsikvqBpr4PvHtJ/7aJvEb3PUs7sOzOr7Bt0D5o4ciaJqDZRajENIKC/5RhI41eEAqtkwlaw6aprgIhGa9ISwWOXXO9GVY1Yp5LdMq1wqktX0knm058F3Jshawhg4fs6OOtJ+VJT0QvBJUOMkl+UHzIYK8JrxLQWIwKIdJ6OhxTEma2BTHlJJCD1cAw6C0nIgtBXY6RL75Cd46/Ger1Y9MXSj9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by PH8PR11MB6732.namprd11.prod.outlook.com (2603:10b6:510:1c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 12:40:55 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 12:40:55 +0000
Message-ID: <a9ddb48c-7c8a-419e-8a0a-1a10270eada9@intel.com>
Date: Tue, 5 May 2026 15:40:50 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] drm/xe/memirq: Introduce helper to calculate status
 vector offset
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
 <20260428142722.582-11-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260428142722.582-11-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL0P290CA0007.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::11) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|PH8PR11MB6732:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b4a0e89-cc08-4f7b-8862-08deaaa38cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: Hmz9MgWieXwfcexPCTSoLpodIB9yZU30BxBaViE+lXsAtGKffoIRFP+xEOELsMhqEwIW/xyoTrnt9h1xk7YWdzciVKOjkWflYnlbBv+B1f/hGc175A4LdcEDcrUqtzuEZcx+s0hEvDko3hHUBGowEkoHU5pYzuIzBVR7U/bjRGlCJbujJFdhqvsxDsnEtoIXKBeLFl0FIc7aqfDNlPrNMKMNpLfE1hP1ULFP08mNRLz0VLG3bOlmgbs5xQeYeVWNCIg61ltkX80+kiIsENlksWoLuu8pZJi7qVdFjN621V+83afaBicVJQ8jbcDH/YpyNM3H4L7dtFLkurtea+ATCm5fvLFsi6PhJJLxe0/u19/XY55fi7W/rlbyu7JMw1Mx9HKENp5+SqBefLKmEOvXJTTWdFezIQpsP+8/70HIptJmFCTaoevoJKHUF6TV/C5Ri88lHzuItRTRg2vTznKF4Qc0R+ur092WNB/gBxCMjmBe/FLuQH/pUIRX9WTNkvfPcTe2N0ww2iBtgIcm2JVchKjD+BUQrBWkOobtFTcrB4KV8JftU3su0f7HcG/mYeUJsoAQDQ9q9tCpes++QOUhwp/n/2rb7PYNagU8rfySO81QN3LxOQYvI/zWXuLEua/2tucdMi0S6uLbWBN/lWJiciPud89r8GnY+M7XMj7GU+OfU7ZENqW5d3xRyJtpjFFO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGQxTDZkaXdjZzNsYVUxclR2dzdYZmZJcjBqQmNHemdNV3Vrd2ZkYlJLbkUz?=
 =?utf-8?B?NFZJNDZUR0p0dTFnQ1l5TTdYcHh4Q3htWjV0WDVOVXpmSEs5ME9icWVnVDY1?=
 =?utf-8?B?b3ppdUpUU0pPMEpWNEh5djVkYWEySHR0YUZpZHpNZHl1MXJTcmdPblAvdnZo?=
 =?utf-8?B?NzlLVlRLQlFRVm0xUlpyWVB2Y3ZiK1pIaW5NNVpSMVVQNEJFV2VEbTFoTU1t?=
 =?utf-8?B?dkFuOEZhaSs5VS94eUZEbUl4RzJxeGVmQ3lKdUwzK0R2cHdtNkVnRElYUmtx?=
 =?utf-8?B?cHZkREJDcjNReVJGaVBQUzdXa3JZeng1RHVSU3VRdW9SYTIyVWJBcVowMFph?=
 =?utf-8?B?aXJqbGIxa0lab2xkSFM4ZG1Ld3pKVUVKWThGT1NOeVQrblZNVW1LRE1ha0ZV?=
 =?utf-8?B?ZHpnYWFVOHp1NGpDZlNEbnBRdkVzVkJYMnlqay9zM2poVjM5NWQzMUF4Z2dS?=
 =?utf-8?B?eWNnd2E0UWM4dHV5cXJhZlg0L3pONGVCZHptYnNjZDQ2bGdTYnJEQlFQZk5a?=
 =?utf-8?B?Z2lCdE02aTc5VWFzSDBPSm15UG15T0ZRMGFaRk5hNU9YNlBTVjE1bml0eThS?=
 =?utf-8?B?ZjljNk5sdmVaM3hYckxuOTY4REhGOSszQmNyMXBqTkthYk56ZHZiajc2NGFE?=
 =?utf-8?B?cU0wcEwzSENtOWtQbXB0WG1XU0V5bERvZElwSUw3cDZEU1dobTB0SjBtanN6?=
 =?utf-8?B?a3I4ODRjSHVuRExsVkhsWE5PbHlrQ2daUG8ranl4NU1yYUtSQjhzNGh1RzdH?=
 =?utf-8?B?OVJUNEpPYnNnQ3gxWFlSNEg4YnpOeE0xenlUSCs2djB2a2NGSVlDS0Vud1lj?=
 =?utf-8?B?TjkyL1VXYTJuTkJjbVN3UHNveGl0MjhsWkdhWFlZR2RFMUd5eEd5UUZXNWJU?=
 =?utf-8?B?UGRtSVRmZE0rb1BOa3k3WVpNbjFvUlBhZHZBTDdOdTl2K1UwdkVudEFMMFQ4?=
 =?utf-8?B?Uno5ZmdRU0FWY25MaGF4YmRzekQrWVA3N0lmTlZqbkZTdFZDTnV2cXZzWXBy?=
 =?utf-8?B?VXVmd0loUGlNSjF4aWJDSEovRUsrTEtEWDYzVnpxZDgyMUNvZU1lUDloZity?=
 =?utf-8?B?bWtwLzZVc1pWb3phMWl1NkRHSXhJZmRnNS92ZSt0SkZTT1ROQUVBVisvNVFH?=
 =?utf-8?B?Sk5ORXNGU1puN2h4U0lQM3g2OUtOem1XVU5MeXJZQ2FLY0swNWRmUHpuRGNL?=
 =?utf-8?B?aFJhV0wrbDNzRGhvY3pTWmN5ZHdnUlc5Mit1Q1hUZHRSTDhKZVFXK3FNMXcw?=
 =?utf-8?B?cU9uczVZQkpENksxbTEwVFdMbXR2RTVlZUNpQ0g1OWZCWFhBd0hkc1RLVWF4?=
 =?utf-8?B?a3hZUmRsTDdaT0EzZFRwUEttZ05Rc1lBcFBhdnh3dWxmVitnYmtaTjVvcU9P?=
 =?utf-8?B?QWUxbjZWcTVGMVU2QmNyU09vZzNLaFFoc2NMUDlMemF6ejlnRW90WHFXUmlZ?=
 =?utf-8?B?V2JkM3oyTXhkV0MxREtNU3ozSHB0dGtJSC9BcnB1dVV6cTcrVlJoY092bWlL?=
 =?utf-8?B?QnhyTDF4RzcyTjByaDkrQk8zVklZYzJtZ3ZlaS9aUUJhVmtYeEhSaThaclFs?=
 =?utf-8?B?ZmR5cDRNUW9rZ0FXc3YvVUhwbzFXMkRmbUM1NHF4eUU3cmRMQ1VVL1BYOHYr?=
 =?utf-8?B?R2s5Umg3bUZqL0lrcm1PZktTUmV1OTB3Z0ZVZUFBWjB0YitjVmdCVEF3bDFz?=
 =?utf-8?B?QzNzREdlQ2c2bE9Tc2duZHpZa2tld3Y1Q0cyWHRtN3l5MlZKN1h2bWgwSGdQ?=
 =?utf-8?B?T3Q0TVVtV1plQS9IdFF4VXRnZjJBNzFyRnE5UzhvWG40dGVhaEJBUkRlblkx?=
 =?utf-8?B?K3pCNnJpcE1JOGhZNGk3bG83emExK0xzTHF6K1FvVzFweEVjOGl3bW8zU3Vy?=
 =?utf-8?B?UCtqZXVkNXREZkl3aGEwcFhmaUx2UXVtcFhoczhrQkV5S3ZXTEtTYXNQWTU0?=
 =?utf-8?B?SEpBY3hUczFGQ25nUDUxNHE2L0l1eWVCbm5iWW01a1ZPYjlONVlwNDhFR1di?=
 =?utf-8?B?aWVSTmVGOHd5Q2xwWWtQMG1ubG1QTVdINGRXRzRGbWg3dzBEMFNkNUdLOGhI?=
 =?utf-8?B?NDNJTkFZaldZNmRsTlJ4Y21UVG82NTdoK0pjS0phQjR5UDY2YW9NR3NGRXFS?=
 =?utf-8?B?QWFQcVNBWWZSblAvdkpYbFhSZ1Z0MUFLaE5aVzlQcEJEL2tabVloQWsrQ3Bu?=
 =?utf-8?B?eUtBeUVvaDdrS0x5OXNZa0lJVjcrd09lTGliWWdxTDdSTWQwNkxWcXNMSnJh?=
 =?utf-8?B?U2tBdVlTSTRiQXVjREE1aUpKSFVYVnByU0M1c0NIcjNNdG83NWdndXNLcDVB?=
 =?utf-8?B?TVFKK21YVjJJWU4zU0o3bXQybVBMdTY0Yit0cEN2bnBLZkdSeHIzQT09?=
X-Exchange-RoutingPolicyChecked: XYZqAD5vyI23CvLum5VdRT/pXDbw2QlsXItgBAfTO1WmaVAptANqrfHMM9wyqzZUYJE561E1Jb0JjdtIID/Ttl48WEmnLg4YGGpXzJfs6lS3Jn6fiAAKOZrWhSjfp0Ef1YcR625kXhQm1LjkreoTdxYKXHNojAwGilF7m15zhwT1UTC4k33p+DGbmbZJMa1hYyNhPb7jl1+X84OSuJrfSrCDx0OmatQOgAEUalbnGH3/EUvJBqBIUd6pmJUme+V2MWcS9s3pdCx6ts8E7AQM7VEaZ4cNb3d+7O42O+/UfbhYSIXl6twVN5pK+TX2aGxw8hl2MuFnJtPsMHwi04Af8g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4a0e89-cc08-4f7b-8862-08deaaa38cea
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 12:40:55.6515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DwEB2tFPgtsa4PczG/UF5qp9vqpFp6W3u0LRb3iva6LLJaTRFQ1YE++Mej+tEjyp7PnT946gPd3ej/+ljTnnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6732
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

On 4/28/2026 5:27 PM, Michal Wajdeczko wrote:
> We already have XE_MEMIRQ_STATUS_OFFSET() macro, but it expects
> that instance parameter will separately prepared based on the
> MSI-X status. Add memirq_status_vector_offset() helper function
> that will take care of this and by using engine specific offset,
> return an offset to the engine's status vector bytes.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

NIT: same as in previous patch regarding commit message.

> ---
>  drivers/gpu/drm/xe/xe_memirq.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 113b792d373e..f5e139f4525b 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -289,13 +289,25 @@ u32 xe_memirq_source_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
>  	return __memirq_source_page(memirq, hwe->instance);
>  }
>  
> +/* Return: offset to the status vector used by the given @source's nth @instance */


The semantics of source & instance become somewhat complex. Or rather they already were, but
adding the term "source" makes it more pronounced. Perhaps we should consider modifying the addressing
scheme to (irq_page, irq_offset) and set hwe->irq_page in hw_engine_init_early(). 
This will alleviate the need of overriding the instance in those helper functions. 

For example for BCS2 engine we'll configure:
if (MSI-x)
    irq_page = 2, irq_offset = ilog2(INTR_BCS(0))
else
    irq_page = 0, irq_offset = ilog2(INTR_BCS(2))


- Ilia

> +static u32 memirq_status_vector_offset(struct xe_memirq *memirq, u16 source, u16 instance)
> +{
> +	memirq_assert(memirq, instance <= XE_HW_ENGINE_MAX_INSTANCE);
> +
> +	instance = hw_reports_to_instance_zero(memirq) ? instance : 0;
> +	return XE_MEMIRQ_STATUS_OFFSET(instance) + source * SZ_16;
> +}
> +
> +static u32 memirq_status_page_offset(struct xe_memirq *memirq, u16 instance)
> +{
> +	return memirq_status_vector_offset(memirq, 0, instance);
> +}
> +
>  static u32 __memirq_status_page(struct xe_memirq *memirq, u16 instance)
>  {
> -	memirq_assert(memirq, instance <= XE_HW_ENGINE_MAX_INSTANCE);
>  	memirq_assert(memirq, memirq->bo);
>  
> -	instance = hw_reports_to_instance_zero(memirq) ? instance : 0;
> -	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET(instance);
> +	return xe_bo_ggtt_addr(memirq->bo) + memirq_status_page_offset(memirq, instance);
>  }
>  
>  /**


