Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6418BC4707B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 06:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB07E10E02C;
	Thu, 11 Jan 2024 06:02:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3079E10E02C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 06:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704952938; x=1736488938;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZMhggT6iyBVCSWvwXsthYrS5XYMEXoqFAVkMwmc0RU0=;
 b=cxRHnGXEqf8eQ18aS/4kd5JFkNRLvVBV6xD6FG3SslTNlLSdZeyBg73U
 J9q3EX+dW2TkMVSlOvH7/c2xJdgZj5K9EWrEOnw6sa46pUwQcsQX/O91b
 Vwnp509XBQ/36noxbgxJsyd743Rgc+P5CSv1lJgGP69Gb+d7nYWh95/XY
 Hb8unaGmuWnJWy8vPIcJUB3Csqe8iwB83Fbu4B6HrL7DyIYb76LIeLFrm
 dBGt5+jPrJ/PyWB9ix1+ogC9oi5OdbScS+m8gDntsGTOE0kYPPGhezI2f
 UERHV8Rnbu282ghcwa9WPArXn9TwzlOrHMWouoIcAfdVVuMexlidldXZn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="402523024"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="402523024"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 22:01:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="732104032"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="732104032"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 22:01:25 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 22:01:25 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 22:01:25 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 22:01:24 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 22:01:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krFVpNIjoLU/rV5F8Jkl8N10rKYtClyfJxLKoN0AaLT42kbpA6TlPFJ/ckn1jRReSRl1xq5gRJ2QNdnADi9d82GRjd/NGrveZOsSqlzXFH+ao5egLTmDbfNSM0THWqqS2gJ4iDq07NTf2Z98JLnSa1KH3RHGuWg3+o3XL3l81zdomthdaSC6/B1NYdDeQ/9I/XoVPuluN3R6V2OnWZgKqWnx+EBDjfpTApmZa1OfzQuarHa0BbQKrazfSnOaK6VOO3JA93KuHOamDqJ271GkdkFZ9a2m3E8NqhHYkDizWUAUgl4cUHy/KunwRr0vyjIgwe9cp/9sy4yvDYnfMdBRtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqwIM19D7YZUR723FMqioDKIdBc/C0wiJtbJGesMxy0=;
 b=TtKJx9u5NX03X9kpUH93PFmFTimyn8/2+5UGOp1j6r00ATWb9RrldVqEQBS+vqC+M3jmos+ImlyIrovgcDA39AFsdUN/7m7iV2Sjn8+E0v70vE1CQ55/sXXfT02vsZMBZIE+OAuGf69Ox4RAwgjtX8obw/g3jUHZv3MoCflQe4DMwC7qpssEIs1SzAgEgYs7/kTJ3TaAMgaO+iicfhNFJtaM6m0XG5pz2qZDf+J9wXQhtiT7BmNBPSGdxyiteUbK6CN0T387k74LlwlF/wT4F/vrJ/yqVQIfDFeJSP81mKjBq9qURp01zxheBwWTnSjhbsYLLt6VSH0MWb162SJTmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by MW4PR11MB5890.namprd11.prod.outlook.com (2603:10b6:303:188::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Thu, 11 Jan
 2024 06:01:17 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::1ec3:e3e7:c7e7:b89c]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::1ec3:e3e7:c7e7:b89c%7]) with mapi id 15.20.7159.020; Thu, 11 Jan 2024
 06:01:16 +0000
Message-ID: <689757b4-aaae-466f-96a2-c373047ca443@intel.com>
Date: Thu, 11 Jan 2024 11:31:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix typo in vram frequency sysfs documentation
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240110074203.2169233-1-sujaritha.sundaresan@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240110074203.2169233-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::23) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|MW4PR11MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: 72427cf4-3f57-4e60-4ac4-08dc126ab969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fa1yRuKYL3g6WlJSgc0SNx3sCkI6TP90yxCB3mES1hUSL37lVO0b1uaEjAf44e6olKKNOeaevFFxJVJRKU3MMF9ABAi7Suvu0nZGbVkfl3/beeueOQ6y0vlK/FqcunxZ33rOgu2ghdJEYs9piC15z37z4RC+MQXEeB5Tx3UMNtLXYiI8JWYBu+pFTUJDhBfIy0P5FmFa+Xw8R/OZVggGuiS7T36Te+3hDHJk8KAd1Tf2SvtZG3SuzazXnWf7B8nW1Vor9+PfgOiQlJU8JPCfQMFztCyqKgtLn46nekNHcBIJ/VpHNr7fCHm4N+9Pt6j6jODlxTLlqKipnqU2Rmrpyx4tFW/+iaot7Un6+DhjHvSoC8/kXiGUWxpq6fR78eBdAfcb0JYAHhArnKy/UQ39nyitikaLB5V+cENbkvIg9VMC5zDeqb9Hw5TbqHCGxSIkZWYc2OpeR1X3V2oLfu7dre22spKP5GhklCLG+1P4qvuTNvR5k3ymMTft/O5E67EX4NCk9iR0UBNvaH6wyfMLNAodciW3lq7p6iddZd9FO5S0N0wxIXjPDh8dWm/g0Lv8Ah69wpstMF52+A59XPX6GAINzmBPrIjvvYUxFzste+vCTptkjghszUsr45rYUfC0X0p5j5pDRAEq28U9ML036A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(39860400002)(366004)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(6666004)(26005)(478600001)(53546011)(6506007)(2616005)(6512007)(6486002)(5660300002)(4744005)(41300700001)(316002)(66556008)(8936002)(2906002)(66476007)(83380400001)(44832011)(8676002)(66946007)(82960400001)(38100700002)(36756003)(86362001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0h6amdCYnJSdFdnNTA0TnRKTksxNk1qOFZKK3dwZVJGbFlXSjlZWTNnUHFP?=
 =?utf-8?B?K1pIOGVBV3FyMlFIbDc3YUZvMytJNTdWUWg1SXZOR2VaeGdkeUJXNWg0dTlu?=
 =?utf-8?B?MHZYcTRtZDUzd1RIM2djdjJnNUR1dk5xZlU0SC9NRldMemtjZ2JxODVnVTBV?=
 =?utf-8?B?T0o5ZzFnTnltMVNNWkdsaFBFZlh0M1NDYjVPSkFpUkNaZ1NPRWVkS2F1bDh4?=
 =?utf-8?B?dWRENmRoRjMwR1d3SVNCeFQ1WnJ6MXJsb0UrUWNwWVkwSjZzM2FvNEdZcTNy?=
 =?utf-8?B?SFRVMDRRV3dlRElCT09MTG1Oa3pDdEdpN0pCNUd4enNlNktTQXlqVm9RVlBs?=
 =?utf-8?B?RStXeFVYbFN0c2dXL1B1STJWUHR4SHlKaElBQmtjTy9wZGcwcnFvdnMrNmFo?=
 =?utf-8?B?aXlkZldyeHFMQ0ZMek5CN01aWGYxZTdBbjZZSUVkcVpkK2E0N3J1NkYyZjhV?=
 =?utf-8?B?anBFMUEraUVicDFrdDZWSTRiSWdtK3VzbTFhOHQwUVI0RzFUbEpvbzBIK1dL?=
 =?utf-8?B?TGJXZDVQNEcxYmVXNUt3VFVMMEF2Wnc5WXpOOGsrUit5MzE4SlNKOG1UTFhz?=
 =?utf-8?B?aXF0dlZJd3NkOHFjVWRGNEpmRGNjVE16dGZhSWY4THRaUTFlL1Zub1F0TmJY?=
 =?utf-8?B?NzFLZndHZFIybmdycndTQjg1VktlaHRyRHRKbXc1b0pKRkdxYi9xNmNKZ0JN?=
 =?utf-8?B?TFVtMXNBd2Y5UmVSbUxLYVNzRWxONmVIZ3pDU3VqOVpMK2pwVnEvdEdsNlRq?=
 =?utf-8?B?L2s5SWJ5eEYxS3JkMW96S2tjODd1a1c5cTF6c1YxbzV1T2hLK0lNMk5CanhY?=
 =?utf-8?B?Ymx3enNvN0ZSOGRjZnpCZkxmZVBKenJic1pqWmFlVHRXVy8zMVN3NVpWYUJr?=
 =?utf-8?B?eC83dVY3U05HUGE5MWtrUExIRnJjQjBscU1FUWJLYnZYREtOWE5LamlBRDBh?=
 =?utf-8?B?SkR1RzRCdlQ0ejdyTU44NlRUcVFxeG5aampkL21nRDFLSGJQVDFzM0RhcEJl?=
 =?utf-8?B?THJDai9zSTBaS1drQzIzUGY3NXZWQk9talA4T3dxK25UaHgxaW9haUhHQzZp?=
 =?utf-8?B?cmxUbEd4akRzRTkrd3hFTSsxd0tmRXk0YzJIT2RrdnErRzh0WWhJbEdzRHNH?=
 =?utf-8?B?TW91MUh5UDcrd0JPRmhkbC9aVVNUVkZ4d2tZOVN4RVpuNW00M2MzR0lDMWx6?=
 =?utf-8?B?Wk9yUDVOUFFjWEtSUFBicDdHYUZTQjk2dURqNTNPWGhGNy9WdlNVby9RKzlr?=
 =?utf-8?B?amxiekxiVzZ0dUNmZmo3WHYzVVkrWnNzOG9CTmVzSnphUGxwbTJUMkc2YSs4?=
 =?utf-8?B?Y1REVDVZeXkwK285Q3A4Sk1WWjVMM1Ixc2psSFN3d1JoZkNYMmlsZXJ3N3Fi?=
 =?utf-8?B?ZXJ5Y21FbXJZOStldjRwRmxrbmQrekcydDI0RHlBVHpOcXdqRVZZQ3Q1NzU1?=
 =?utf-8?B?d3pRQmFKdWRQRWxvL3ZqaEliYTFORG0vZmZ0WEpNUkVOa1h2OXViS1Vpd2V1?=
 =?utf-8?B?a1NBMWphUFMySFpqTGprZHdrbVZ1ZGNnNWs3azB4ZTRzTWZEYlNYKzZXUm9P?=
 =?utf-8?B?OHp2bDFwNUxlcHdVMEhoTTcxVGRJcHZ6amg3QzJKeGtJWEQ3a2RqenVmTnFK?=
 =?utf-8?B?NWEvdndnUEpIamdqbHB3WW1sZW9nSVBhcUQvRSt2V2VzbjIvbW5UNUg4T2Zl?=
 =?utf-8?B?VnlDVGJMWkVOcDNqSkZKK0tOYUJUa3dCZkE2cjM1VXlYUjJtU2lRNUZaeUl6?=
 =?utf-8?B?bWYwMEE0UjNWb3BiMm9JbGdLRkc4cXdkUEtrRHhyRTI4R3ZEM0xoS2g3Wndy?=
 =?utf-8?B?d0hHUnlDMkIxem5NNFJEZW1vOTNkWUVnL00wRE9SQW5kUnFzV3JsWldnRFVm?=
 =?utf-8?B?WDJzMlBqbFMwVWhwU1lRWW9UNEQ5b09HdHdsZDl4WHg1RTA1T1J3RFJNREVZ?=
 =?utf-8?B?RlhkY2FRSGpod1BrdXNqek5PbE1vV1A5NWppQi9xVTFEU3NhZVltcnA0MVRB?=
 =?utf-8?B?REp5TmhRY3czRUtzeGErU0taTUYvLyt4Kzk4S0ZUWmhlZ2F4bTlOVGVJaXN4?=
 =?utf-8?B?NzU3YUM4QTY4cm8vZE1qcTFJanAvNkp6T0Rrb3l0Qksxc3MrQWVYRmxzbm96?=
 =?utf-8?Q?6khnFUVEGvbQ1QHtvgQSeYNAE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72427cf4-3f57-4e60-4ac4-08dc126ab969
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 06:01:16.8270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ysYpoeK69hguKf7lN/FnKFqcC4QAEN0UfDy2wjOO2eVtjTh4x5mLk/oSUpIlzRAiPiPD0J5HSj6OJnQHIp1vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5890
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

Hi Suja

Add "Fixes:" for this patch

Thanks
Riana

On 1/10/2024 1:12 PM, Sujaritha Sundaresan wrote:
> Fix function naming and description for xe_vram_freq_sysfs_init
> function.
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vram_freq.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
> index 733146293307..838f582e5632 100644
> --- a/drivers/gpu/drm/xe/xe_vram_freq.c
> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
> @@ -96,7 +96,7 @@ static void vram_freq_sysfs_fini(struct drm_device *drm, void *arg)
>   }
>   
>   /*
> - * xe_vram_freq_init - Initialize vram frequency component
> + * xe_vram_freq_sysfs_init - Initialize vram frequency sysfs component
>    * @tile: Xe Tile object
>    *
>    * It needs to be initialized after the main tile component is ready
