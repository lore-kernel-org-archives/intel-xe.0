Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9D0C9832A
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 05:15:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7B110E78C;
	Tue, 29 Sep 2026 05:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wx9PwEby";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E7010E78C
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 05:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790658933; x=1822194933;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6aiDZKFQgYGM5xveubYWiL5qKtmcbBoCHAdsoxjc3Qw=;
 b=Wx9PwEby+6UcVbaOuhz7bPIxPIzv6Evi98JS0yKuzAMxQGnTznY7ji9t
 NdLh6ywtymqCrWziCCHh6pVhL1kMPTVsQuxDC1+5lZE1+ReSs5gU2ZHA9
 YLDAN+eZMOHnihC/Bpyy8hmyla/xv0HzoXU1sZJD9Gzp8c8f3orN5YGa0
 lhPZVbmvVUojjBrxXY68a3iuP95K9IPigL2JYBgphtm1QmMLUVazQRLJf
 53IwuCPRQ8L2niMrL/ev76whceQyan43QOueqhKQAjc0VBVTuNkuDVkVL
 x1Mr9rJJ8k54SVt/tXwcDYC6FRd9Myixypw/lr3pOYuaJ00nbOE6V2ri5 w==;
X-CSE-ConnectionGUID: hpg9Q28HQombfxN3q2RENA==
X-CSE-MsgGUID: Wsxhr107Ty2xJ67QuLt3vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101938770"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="101938770"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 22:15:33 -0700
X-CSE-ConnectionGUID: UwhvkiZ0TAycL7oykTwjmw==
X-CSE-MsgGUID: 0WVQeFpvQci2OAX8r2IxGQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 22:15:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 22:15:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 22:15:32 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 22:15:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ykKvDZzWU7AEuTQn4gKsln9sNMIQWV1tUe6UkZwEGE2Wz30xpxYz7syPJpI3O+LS5R7ZXF4RxWGysR/eeRaYjucU69pdLra7iX0LW+R1Lw17TQNRY3vQWJhukQmmUaqjg9Jfo+eeYQBPw+3BqI8NvVtLuC3df6LsZg81Afc7cp6pCVZtqXk+zTcLNxOtsVqJchAlySjsDGz7cGxEtZzyzvoq19PsS0ICgqxRHNbA06cba0cAWyqYugjADQBUFm0i+uA2kYjgKJIzkWL6YoUNJwI3ENUF4fHgOEK9tYmShinNCpipl+oNyaSE866+iBMxzb7xpBR/ze7fq0r/F1X1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4jjcWhjBuhlyJV53j1eeQMdrZQ1jPytbI/As+XOUwI=;
 b=VGIwxfPxAx8t7grIwD8s7JnoEi1niqNy1hxFfm8NrXQMv9VIkU5+Guuycg2KIIAVqLlRbgGwD2sVwJQvVn84tABkzkARin1u06rUGx3FldXW3ffviOf6nea7tTW9m3EObqSwB6gaCZzgsk1d8vruCnml4tgBkeCWLoaF/7jkkf+mUnH2/M2XcREXow4cRJ3X/DwA5vy4sbeYaltSLtqJDBhlbBcvWvZFp9eLx7KQqVtPmD9OcMltSifjjlft2PZN3U2dsPt79+WZ9G7oyvhHx9G45525lkhgs3eOZeSqFdPq5fUrZMkf+SkjGC0qUDJhIrrtmht0hKEJJ4N8JhYIng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SJ0PR11MB5199.namprd11.prod.outlook.com (2603:10b6:a03:2dd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Tue, 29 Sep
 2026 05:15:30 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0451.014; Tue, 29 Sep 2026
 05:15:29 +0000
Message-ID: <d9d9c21e-a5d9-44cf-a536-8d803fcddaf8@intel.com>
Date: Tue, 29 Sep 2026 10:45:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] drm/xe/ggtt: Report GGTT errors using structured
 logging
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-3-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260928092114.1610203-3-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0172.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::16) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SJ0PR11MB5199:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e7ac31-5287-4cdf-78b0-08df1de8ad54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 6F9PMvalhqoV7m9MZI0gOnVpakKX7weamc5usxbUsdAXnav9+h7l8HOMhgbZIUkhLTD+DljJItGtpSO84FYNK4RWTierZ37UbMUnjyYmG9h38D8HDNVAuatVEG1AlxGLMeKdtVEOzc1cDUIFeYuBeB/62JH56BJFRP8eXn3QOOf1BwqEKNSVmr2AcwYJop/vyyx0ObUZHfk4nT7kSMT9tAsoXSolkC7ieiVgR6NT6nbVuZg+LSJHypHUMhzuBUlIbi8hIPhQKXA5KtnSTF/CihwzXZwOnL8lCJ4xcHTBtai6DxLdX9gUnd2raW2MT/7ZEHQEggRDhBSlxfqdGXGlxnu+3j4JN0rpGQozLOVl/XqPehcMkRm4JfhTEfkSvrN6PkHq6TgeupQrDy3rp6BGW58xZy0zN3TArIL9s4DmqAoyb7LIf2msMKPS9/zD6kn6nEsOlUBpN9ultLdY3XzWdpXMGr5IWVNj8wLzm9bZVP1mC97dwMknYtS3TFWj4ehU/cMEgoeArBIaz5Fnt+VVu+TxeWZrIqq13QaKJWVho8HSoRcCoKU3ART7e+NyAK2elgyac5VW8ErZFYlTlgm4jRgberwBXKRgvCkZVzubBHN5yCbx0KM2LluyK9ChwAr3XHDeRAyZGYmzk3z6VSh61vEslC7QKMCiQujuc4Kf0vw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTU4Q2tDWEZkZVpzZDRhNG9oNlU1SXhXa0dXbnZLRGpqMlZUZUVNRnpxZUx2?=
 =?utf-8?B?VlpzY0ZZTmF2WVNXTmlvZnI4cHFlQlJkOStVSjZPZDFiL2FpNGxBc1gzUFZ0?=
 =?utf-8?B?ZWx6cUdYb2hQZVNRV0p1NUZJZG4rc2FDSjVlRlNtMG5pS3AvWHpsSmhKWUg2?=
 =?utf-8?B?TzV5d0xJclcwRi9JZy9qdXFoNWUrNEVwQy9idVgyL09OSEpxYzk5clRwNnZz?=
 =?utf-8?B?WTd2QkYzT1NnT2tFdXFqT05ZWnJaSVZDQ251SEJXTXR0bVJJa2JGRnBpN0oz?=
 =?utf-8?B?VUcxUVgvMUlzckdFTUdPMkN6UEhnUE00R3RScWZ4Y21Jc3hzMWQydUs5bVRC?=
 =?utf-8?B?c3JVRlc0bTIwb3Z3dmJKb2UwWHJKcjVoMTh1ZTdrS1pLSnFJT0I5Z0QrN2c0?=
 =?utf-8?B?NUdjMkNwNFl0S3JJU2ZzUnBSSklEZThxdkx5cTFnUnFFNDJCWEdJd05UKzZt?=
 =?utf-8?B?T0FUTHZSZHlGUVp2UC9rVUR6M1hVSDNLZXVWdDhERjMzbGpEVUViSDRYUWpL?=
 =?utf-8?B?SlRlRVkvSVc0MnY0OXNwSnRVWFZNVk5UazBTT0k5YUxyT2RTamtnaXNPUThX?=
 =?utf-8?B?ZnQzTGFMY01tOHl4OUtFYVR3Y2lTcXI2WDR5UkhUWDgxcU5Md0VZYXJ6di90?=
 =?utf-8?B?WVZQUGt5VE5rMkorZ1JPTjdsa1VFemdXVDBOaEpWaXBmTjhUcDlTL1FCd0JM?=
 =?utf-8?B?aHdWUldzZTJ2b0QvRUpBSGUrblRTakpHWk5JTkh5RWUrV0tESjRIQU0zZmRu?=
 =?utf-8?B?dDlEcmovTVRoQzFpNDNzQVlJZ3pqcmtQUU9leENvVkdCeHJCOWZaTEFVZEVx?=
 =?utf-8?B?OGgySkw1eC9NRTNKQ3pGMitjRmtYR1N0UXBXc21YbGMzNmdtMU45UVI5USsv?=
 =?utf-8?B?ajhGWmlBM2FSVDc0UDNJQWl6UFV6SUt5T3NMeUZlRkZvNENpRUREdkdTZjlJ?=
 =?utf-8?B?aTZ4K29Dcld0OXl6cHoyaXNyN0tRYUFKMlMzckRWZTJuYUt3b1lDRit5am80?=
 =?utf-8?B?SEFPNE41Y1c4bTJORkp4WWFBM1ZoV01LMm4zQUFrcU9kUTdicGd1YjVOeVM0?=
 =?utf-8?B?NnE3bzh0QUQxcGJBVlNkUWEwcHZoaU9jZHRGTi9OY1ZVTGxNZjU0NmtCdHNu?=
 =?utf-8?B?M0hpWjJXSE1xNnlPSkdENzVUV2ZIWW8ySkpwZFBEV0RLTkE0Q2tJWVZqR29M?=
 =?utf-8?B?NTlxWDJxb0trZk5ZRUJhSGZrU2xzWFNjdVcwMXoxSkJodUdrT2l5QVFIdFZx?=
 =?utf-8?B?amVsZEJzVXltVklrdXpGcDhNamdveWpDMVJkSlZyOUQ0dXFOVlFnekJwRC80?=
 =?utf-8?B?czFCVnNNQUdTWWwrQk1CNUNoZDdLZW14dVBjTDNjdGFiZWtlR21UNS9raWxF?=
 =?utf-8?B?c3BMUE9wTU5Rd0xvdnQyMnZqN3hKU0VkeU5zWXJhYUxjRStnNnNXZHdnRDRV?=
 =?utf-8?B?OXpCa08yaVhJZkliN1ZIMmtuTytMUmw4dU1MSkhwdkxaTjVuMllaa3VjTmlS?=
 =?utf-8?B?ZmdYMGtsVU4xN0x5U0JKaFBxM09ETmtnbFZkTWpLSVFFcmpmYXBtcjQ4OEJi?=
 =?utf-8?B?L1ZWenRhU0x3dnhKNThEOXd4ODQ4UVFvOEFJVGcvUTg4VFcrMjVWWXZ1UXJE?=
 =?utf-8?B?aVh4NlNYcDRnZjJobG1iSkt5QUtzQi9ZOFIrSGN6M3NTYVVHYncxc1AzR3FM?=
 =?utf-8?B?M2lRc1dTUDFDVXIxaDRibUIwWk9FMFhFbGpzMTgvclRiMStKbDNRQytNNU03?=
 =?utf-8?B?WW5FejV4WkhQUXJEK3R6T2hFWkhnSHl5QkVXZmtIV1ExZFIzZmx5eUxTVnYv?=
 =?utf-8?B?RjRLYjhUUlgxdmZvbStOczNmMVFmZ2VtSDNCUk0zKzg1bkhGR3dQUkNPWGRJ?=
 =?utf-8?B?d0ZvczRMNkZuQmZtV2JhWS9FV2pvdEF0SWVpS0JiMHdieEd5ZEhURTFGaDZF?=
 =?utf-8?B?N1ljK2xJOVp5dG9saTVmS2gxSm8vQ1lVdTJZZVBPRlk3aWJ6WVV6dVVHM2Zv?=
 =?utf-8?B?OFVBRG83Z1lIdWlSMXdvM0JEVVAvaFlqWUpvMkhWSHJEYzFvL01BSC9rZnd4?=
 =?utf-8?B?VU9FL1RBVkFjbGlPZW8wdnJrendvTlBwb0hja04rU2djcXFqTTdzUDFPRDhq?=
 =?utf-8?B?RWNOc1MzNFJVbFRoM3dYenpxdlpaZkRWY2VrYlJ1VE9hSm1WV0V4bXpybjhC?=
 =?utf-8?B?aS9aMFdLZncwYjkxL09tak9KM296WFl1MWhmL25abUZ1Q1NBVVBONGNWT3RM?=
 =?utf-8?B?eGxHR2IzcHZ5Z0dzNnJBd2ZhbnBHVzJNOFlnZEorRjI5aVpVOUc4NFBXNTlM?=
 =?utf-8?B?N1J4di8xcGRHcldtWXN1aDl0L1ZrOUQrTWZwSGxRbTVPR0p6bVlPTDhvemFp?=
 =?utf-8?Q?7MyYN5q3KKG4EI2w=3D?=
X-Exchange-RoutingPolicyChecked: TJnTRKVxMNJoQ9HXiMEe3WDW97sIVIwtMWG4/ZQl7Logq/as7ADY6CgZt/qK1q5d/bcE4x6H7WRtIkZrEUTw91uUzK8S7vvqjnRruzbdRvTc8GiUxQnngpxp+WOoMDi+XRxuYBE28t8klgVuJos3+UQnjZTAWZrA4EY1VETJxnjCcqPw//DRO59zV0Nj93GMWyqsg/2f20w1E1FkRbXZNmBGoGlx7yqCJx/jIJPZkW6tYo46HNZjlqSMK8BTB3wSH9sZ9bnvdyaLwEw8lwPrTdfLDcZXRRsrnJ1wsIDvbibdp4Sau8+YLZkDVsiixYLITiIF4COhYiL6GX/RKBuRsQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e7ac31-5287-4cdf-78b0-08df1de8ad54
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:15:29.1290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5j+TBExGTtqUH72mlxWHUaEw/xrem2fB8dsrlcX7pvds+VYTawibBiGxUC6qE9f+QplEbpdIqMXnkmUkK6wZPw+FmM/paF+pas9YqDU2xAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5199
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


On 28-09-2026 02:51 pm, Dnyaneshwar Bhadane wrote:
> Replace xe_tile_err() calls with xe_log_err_fatal() using the GGTT
> component tag in GGTT initialization error paths.
>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ggtt.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 63e8bf193605..773777afc68a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -23,6 +23,7 @@
>   #include "xe_gt.h"
>   #include "xe_gt_printk.h"
>   #include "xe_gt_types.h"
> +#include "xe_log.h"
>   #include "xe_map.h"
>   #include "xe_mmio.h"
>   #include "xe_pat.h"
> @@ -403,7 +404,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>   		else
>   			gsm_size = probe_gsm_size(pdev);
>   		if (gsm_size == 0) {
> -			xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
> +			xe_log_err_fatal(ggtt->tile, GGTT, -ENOMEM,
> +					 "Hardware reported no preallocated GSM\n");
>   			return -ENOMEM;
>   		}
>   		ggtt_start = wopcm;
> @@ -414,8 +416,9 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>   
>   		if (ggtt_start < wopcm ||
>   		    ggtt_start + ggtt_size > GUC_GGTT_TOP) {
> -			xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
> -				    ggtt_start, ggtt_start + ggtt_size - 1);
> +			xe_log_err_fatal(ggtt->tile, GGTT, -ERANGE,
> +					 "Invalid GGTT configuration: %#llx-%#llx\n",
> +					 ggtt_start, ggtt_start + ggtt_size - 1);
>   			return -ERANGE;
>   		}
>   	}
