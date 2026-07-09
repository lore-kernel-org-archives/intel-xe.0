Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA05C43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 20:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4F210E256;
	Thu,  9 Jul 2026 20:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ipoVJHGi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F3E10E256
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 20:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783628699; x=1815164699;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Bd+fer4Om8mlkDCry4GxmNRucB6qx1GtSH3GvMD7gkY=;
 b=ipoVJHGi9BDxsr9wJC30YRN/Tdib3Hu95v+dKNx+jJaMW/1DnOr180ON
 +X8Qd+uJQNurYxNvC4EKou8RTcmuXiPuDHLLzglSIL1759Jwu7ycURH+7
 U1oChsokHnbh3LCPmsaNoOhe+gjOd0ZR8Sc+niE2cTPNKrWnRR0OeWgfj
 a0gnSrKSzlfESPatcWbOQ3pmTZh/vYHWMrShhMoOXX7AXTdk6YG6vJloZ
 TiYXLVl/2Mo5oQLbRsa/AnBZcnrsyvkqUI9W/nntp9tTdRuKZ0Huxjdf5
 m2/Uxp+eEHXYXci//CXTuKJyRGdCyOAHme5phUns/u+kqkCRod48A6Cg0 Q==;
X-CSE-ConnectionGUID: WHkxQuHqSUSNxOaSfZCmgA==
X-CSE-MsgGUID: RjzTNgLNRMCep7imqZ5T0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88242530"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88242530"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 13:24:58 -0700
X-CSE-ConnectionGUID: tABTss8fT+ei443fHdilyA==
X-CSE-MsgGUID: CYlJ5tNZSMqW9RVn3BmEFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255336299"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 13:24:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 13:24:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 13:24:58 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 13:24:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmSAtYOOsAFlIjkTYF50EjBW9OekUJyvp/w8Ff79kZc7w3mURLdc6M3LU1NCAYrTKKul2AWvcHdzsB7/GPar74A4r6mT1jX8W/E/2VLcsuqGYT797QHaXzzUfYekLjh1QQpWdv/Bej5jwyBbhQnzYow9V/74jPRFB0rNAA5Xgpt8O55crhSLCbapgN2iLzj0qBHhTvmjpKxhj8Uo4Za3kzSNQskQmdTcgL4iPvFA1PiYxmb3QFpB4vUKQ8DD51lJeHUqP1X461FQeO5W7w1lhToHj3cRN2QC1ggGnortG56dop+a0BeiNjsS250ViVgoHRHHioOkP5Pkrc1KEnsmMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvvRxhU6MdRCxaXnYAZaAergIvfb9s4icuRmGeL7i74=;
 b=XqXJmruhBx9cTB60kv0IZVR9ikSRsciqVjYDxuW3XV3+bKW4vWezirIuqYUhx9XJQAB6qlZci0y7fHu6v7HJ6XBdWSjRORVHyzjOf1RG0HwZ/n/e9yWJEohy/1u9DRlNolRO46Fmw/pHmrfEPyfMTyg+JGbN4KsP6ocJlbY0tMjWjST3xsHnKhymQy72UryE8Z/FLgqDzLLAqloeoEEs/qY6aFGxGzZOeh+j+3dbDVNHvXQibtMMm/EI3C7JC59NNZI/LqwOmE4QVfG5Fmc/g1JBWQA7Qa7V8rhUoD3Dx6RWKnAU79eiAH416Aa5n5G1cdpdg3rmp6AR9xdjKZYyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 by DM6PR11MB4673.namprd11.prod.outlook.com (2603:10b6:5:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 20:24:50 +0000
Received: from SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f]) by SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f%3]) with mapi id 15.21.0181.012; Thu, 9 Jul 2026
 20:24:50 +0000
Message-ID: <94211fd4-dccb-40c7-bc79-088c18258dc0@intel.com>
Date: Thu, 9 Jul 2026 13:24:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/1] drm/xe/guc: Handle GuC local uncorrectable error
 notifications
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260706234353.3874355-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260706234353.3874355-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0020.namprd21.prod.outlook.com
 (2603:10b6:a03:114::30) To SA2PR11MB4985.namprd11.prod.outlook.com
 (2603:10b6:806:111::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4985:EE_|DM6PR11MB4673:EE_
X-MS-Office365-Filtering-Correlation-Id: ac821f53-2918-492c-cda6-08deddf820a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|11063799006|6133799003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: trhRn2nuPOsuI/GDdMbrTE+fSW+Lv2G9vYPi3HqQvoTjjg352qx6a/e2SzPMNTRFwYF0SXWZtLirboOjy+RN3CZyo6x+MlF8xKH4aVevtSejE6rELPA1eYZ5cCA/HGwL8+dvihuxftWRRQ0rIUlVvJag7Ezbv17uTFadDqhVlMmnOsaFR2OQjvX7AZG6yJc2DgqPMOEDIKxQ4OQFdCorCX95Yn1YGLYFhpNbmYqx7oxAofMyqGFaX5tVI0oms7yib6X/1O/kmXyZPZrgc7gUKrFoPkok1fnAwmhK6wHzfzo34f+sVnCBGMsgukHu2hXd6pHLdiR0+1tstkOkbXz6Lcewf/mZQjaSyey6yhsdoCW41pTdC+uOQzKn86hqxGboHICDxLTmuj212oSqrR5Ysiloj5WoQKa/GFXnd7P5n53VVhybm11NWDvceg9c0vMgdYGjdVaQPBPUrEjNbtYoQtyyz/IfrdcjEdSetDPLKGf3LwGDVFPu3985MZz4d2nrzzacaVXqGvvTyESEgoRqheG0mEirrTBAwwzPvRpz8gVRmyMxpcaDahtLf3dsOMZlZ8wLSPH0jDRL3OcIB2z8reS4m+s6b5J3Pemu+Dg8WtYVYakS5RpVOiA8Vv5eLN8K1sNmImGfOUmyREn7WxKJKYOm9V2B7c/7KuVEl1Rx6vw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4985.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(6133799003)(22082099003)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0w2U3RYcDFOL0krTlE1NnN5VFNZZkhEUUtoaHVaa1JRdXZhYzYwUlRLcE8x?=
 =?utf-8?B?MmZaclpnMTFEQ0RsSmgrZXBGUVNoMGZkT2JqVUFwOFpUSVJ3aitQZlJNWXFO?=
 =?utf-8?B?RnFXdy9DdENHN0NCRU9BRS9vNVByWUxBazBtSFlTV25DQmZUS0RkamdIdzZm?=
 =?utf-8?B?TE9wc21Oc0lDUnZGVXZBZE82cHJFeEw0YVN2amRVdy9iakFCMis1bmJIV1Fi?=
 =?utf-8?B?N0ZlMzJlRjBQeWpLUHNQdkY3UVByNkxvTG1GamFCdm9WeWo2RGtMM0pWRk00?=
 =?utf-8?B?UEwzdDM1RnJ1TGJ3bnBEZGJEL09yK0NWMVcwQThPeG5rUEdnMlIxNnBJbzFT?=
 =?utf-8?B?TmJZR3FOa3VBSlE5anMwMmV3RllKN1RtcEdJbFY4VElGb1VaNGIwN0wzOXZC?=
 =?utf-8?B?MXBnUy9DOG1pT0dPRkt5SDFzMUV0TmJ1RmZEKy84c3RJL0d4Rmo1dGI5K1R4?=
 =?utf-8?B?bVI3ZEd6cUxGNWk5UXRkMXd6U3ZXMDc4R1RWR3htU2RpKzZRZ0Z6T0M0U25i?=
 =?utf-8?B?bHdmWktxN2dXR0h4bFM4T1dMZVpVT0JyWXQzdDdBa2VBUVVhdmxVNFQ5cTVx?=
 =?utf-8?B?NzYza21GOGVpOGRBY3hBSXRYV1oyVU1hbVIzWWU5K2VMcjE5VjZsdUowRGtM?=
 =?utf-8?B?SndMVVlGOGdweWQrWU44NnhPNXdRN0NKejcrZENaWnAwRzVHRkNuekdlWFlX?=
 =?utf-8?B?MUFKZEMwbHNvNVJSUWNjUFY1MmxvZ0liNnFsN1ZmK0EvUmJCQXYybVhQdDRG?=
 =?utf-8?B?ZmU2T2xEU1oxWFpnQVlzdEtsK2hHbWZxcmFmMW53RUl1NDcvL1pWaEJMaUFm?=
 =?utf-8?B?cW9CRjdvZmFhV2w3a3JvUUIwQU9CbHlxNGZ0OXRPRG42M1pvMGtWTUY2ZDUy?=
 =?utf-8?B?K2xjb1I4cW9vdEZoU3BENnB4Tkp3NkYrSW9Zcmt5YnBJSWFGdkN4c2tMN3Zv?=
 =?utf-8?B?a3BEY3B6aFdmMEdMQnJvY0RNakxxZ1FTdUMrMmxkeGpJODNPaXNmSlozV24w?=
 =?utf-8?B?QXFOZDJpVXZhNmp2R3U4bm1uTGxZWTdjR2JTNDFCclFKZU93QW11ZWRIbklk?=
 =?utf-8?B?WThWRkJwdzNISHcrSVhTbDZNOUNTOUZaZ2NIbkZyK1ZLbkVCdkIveGcwYVhn?=
 =?utf-8?B?ZWVCUk0zMXFPNW9qUWhXS1VPekx6QVBMV25mQVUwN0tkMG9NTVhVa0dNd3VD?=
 =?utf-8?B?REVBMG5aTUpXOXQvOWErT1FFNFRQZkI5amNuaEhrUWJXckNwSEM4OWk3VVNW?=
 =?utf-8?B?NG9VZEtHVWx3alBEODRFWlFDNm5pNlkvQjdPTmEyczlpYmFNb2oxN1lSSW8v?=
 =?utf-8?B?WDRiR0NMcXN5U0U1MUw3ZXoxVXJRUncwNjJweU1ubHN2ejh1TlZPNXg1bStE?=
 =?utf-8?B?SFJnbGtvMW5YL1RWWFZmbXpaSHlPUXJtZXR1eHBnWXVJQUtTbE9IY1ZHRlJY?=
 =?utf-8?B?cmdObVlTc1FoWFViWjZzVDh1ak0rSjRMZXVPb21rek42d2dER004RDAxUndM?=
 =?utf-8?B?NVVaQ2pmNHRBbmFjempGVjZ2VzNZNEtBaUlFODJsMU9Xdk9LSkEya2N0YTJF?=
 =?utf-8?B?eVBMZWxYQnNhaW9UbVNiV1R6YkdGbFhucmJwT0N6dTZQelZGVlQ1R3dGWjQz?=
 =?utf-8?B?M2Radk13UWVPRDd0Y01RVTdhalhOMk1qUXh0aGdON25GYWZYbGduUlp1N1NY?=
 =?utf-8?B?R2RrUmVzaDdEK2ZEcndjUTdXbm42NXZhVjBiUEozQmh0Y2V5Mmx1YXhOb292?=
 =?utf-8?B?cGd0UElNS1paUG1ncmdxODY3NW5kdTNLbXJMdCswQXlSbUJjNGpMYlppY2V1?=
 =?utf-8?B?OWFQcXgzaFdha2tTWUxIWWl4bUk3aHpiN3VkRmpwd0hQdktubENxaTQ0ZE01?=
 =?utf-8?B?bWhTaUYyRFlDczhWejlUeFR3UFJ5TjM3VFk1UjVUQWkvVWtXckJHbnFVZTVt?=
 =?utf-8?B?NDd4U0NDeTNaVFRKUUR3cUhpVVhLM1Q5SzhCR3QrekVQbkJkVXpsaE1JaXR5?=
 =?utf-8?B?cTdVaENaclhHMStTRlFHSE5TNWpTYjhYTUZBQ1ZiaGltTUxvVHFHSEdTSDlx?=
 =?utf-8?B?STBkVEdrQmJ2dW5hcDB3cmU4TzhqSCtUOTdVSUYwcHFaYWNBK0d2eUpCWEI2?=
 =?utf-8?B?a214UmxDNkJkVm9TVlU1eStnV2hSRlJFMkZ6dmNSUU9nZ0xTUGRlUWlXaVFM?=
 =?utf-8?B?UldFb0hrekpHUm9XZjJUVEkzR2xTeXNSazNFQjE4ZEMxWHF0VVIrS0hNQnNT?=
 =?utf-8?B?RjRUNXZEUWdIUG9melYxbWpyQlhCRnhYVDFIMXFiRytyT1daZk5CTmFGenVE?=
 =?utf-8?B?Q3c2dUJTdGZ5QThHNlFXWExBaVJhLzd5L2ZXcDlkRE8vT3RVemNuV0szdHdD?=
 =?utf-8?Q?8kdk2a0rqbUT3w5Q=3D?=
X-Exchange-RoutingPolicyChecked: UjJYzYSjT1YSueB0+5N/Qp1+HWXfhGS1mYRDI0aH3RHhWsWHeRv37rqN9/fUHoT9ftR6Qsi8Hw+4U4gvHDsI9wDjU8PMlox/PakyFSNI8ANjFs0SjSgSX2gPEIhmIfQ4aWxk3XkSq0gWfPbrnWQwb5UAhMDJ4zYst/hXrvvEhALUg8rN2FpwCGRPmM9i4qHaxAbdjQh1IbbyMqsRggm9GIPLab3vK5kQRbDiTsz02djhX1QHpS1Cn8y7ewXp2F9SUCmRIdYOedFRQZYZ8xadCVs1hi5tRMDJMv3CIKRXRfvUt8YZVyznyLidcPWJluCVKxsrtjWWmtEavOuhR0hr3w==
X-MS-Exchange-CrossTenant-Network-Message-Id: ac821f53-2918-492c-cda6-08deddf820a3
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4985.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 20:24:50.4979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z225l9sMZS82IdQJbU13AbbQ24CX0R+Q/NAH1RZ0/ZH5PsFxKnMR6NWbfDPL2NS/1OIkSr7bKuOe8zcmWpDJfnv2YvFeAicJiEoBZQViJ/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4673
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



On 7/6/2026 4:43 PM, Zhanjun Dong wrote:
> Add support for the GuC uncorrectable local error G2H notification and
> opt in to the feature when the submission ABI exposes it.
>
> When the notification targets a known exec queue, treat it like an
> engine reset request and route it through the existing timeout cleanup
> path. This keeps the queue teardown, pending job cancellation and error
> capture in one place instead of open-coding a parallel recovery flow.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
> Changes to previous version:
> v6: Updated unknown GuC id error message (Daniele)
>      Updated length check (Daniele)
> v5: Switch to opt-in by has_uncorrectable_error_reporting in gt structure
> v4: Optimized GT and silicon version check.
>      Remove wedged mode==2 handling, which is handled by other feature
> v3: Remove not used flag bit and timeout worker check (Daniele)
>      Remove wedged mode==2 check, which will be handled in separate patch(Daniele)
> v2: Opt in for Xe3p only, excluding media GTs on NovaLake-P which don't support the feature
>      Remove timeout bypass, which is outside the scope of this patch and can be added separately
> ---
<snip>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 12416bfa3255..49c5cf764e70 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -9,6 +9,7 @@
>   #include <linux/bitmap.h>
>   #include <linux/circ_buf.h>
>   #include <linux/dma-fence-array.h>
> +#include <linux/workqueue.h>

When merging I noticed that this new include is no longer required in 
the latest rev, so I dropped it after confirming with Zhanjun and then 
pushed.

Daniele
