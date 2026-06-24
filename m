Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211A9CDB47F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 11:57:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E6310E075;
	Wed, 24 Jun 2026 11:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OaOdcqBN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE5B10E075
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 11:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782302232; x=1813838232;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EL+OJXiiFDgm8WyvzzmzBQn8jUDsV9kOsGcTOyIq+c4=;
 b=OaOdcqBNdmYxPWap0HpdZbC+xEHkixn9PEmFKGoy6l+rfaBTeyM+4SOz
 baqonWMc2GeUe1msH26JfYyxmn8qwJ+Vg8rO+pfaifzF6xygmLJW7p2tV
 OzdhGKtlW7lTKRYgmD8B/550BRhPj1szU8jJtanJnYI8AiaehcmZYSdyP
 iixxpnfttnztdQ+S57X0jgn8H5V7M9gOP+tkfi/7RA9pefxoPt2YFhahq
 fUtnb1SlSsKJjjjd8NuvHVW+grxe0XH+t1SuxgB89ElNzUrziW0Vij2y6
 0X4c/1dRfaJZrNkSa7S3/7TtPUeJApKI9Bo5YhbeiPRUBME4mITPzOO8q Q==;
X-CSE-ConnectionGUID: 6UorE0BcTP67vFONqlNHHw==
X-CSE-MsgGUID: ZxlgtyqXTNOYJfWqUjvMTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94550683"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="94550683"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 04:57:11 -0700
X-CSE-ConnectionGUID: /GIAPRSZRFGnk2hrrxGk6Q==
X-CSE-MsgGUID: JOPGc/B+TWuoB3SYFg9F/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="273510596"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 04:57:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 04:57:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 04:57:09 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 04:57:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzxoWkZeaYTC3AbLc9SGOcwSl841/7ZfFbfpSjAP8+tniG5SPJxKBiMDZ5tF4p91OB9US/bj6uhrsQU9y0AKro+xZbPnAt3ruM9IDD8qHNW3fm8boAmonsI3ND1khlqDtgXtEd2hpB2YsBx/uBD5KHrmrJ1fJyus9rJAQh+uMGPN3c//ZYxIjaG1TP51+AXVemuhI2OIcWBDjT11JduG9RlOZM/5mEm7SyrHpB8E+sS1SKnjEi6owXsotMo2ie8FZYlq5U0XD6PRHgsySIAxsGZLfNzjVebLKep4EkU7dmONHdXu6Re7YHsKln+pcSt5QbSp4DCkrsSoLdG7Ok9AmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+z50q6ZIlwtxs5E80EcTy98qToFurD7iVcrujYgRQo=;
 b=TD9ZKolhJyDEVlUwZBRyxks34vhQSfm4vQKAbJU+3CS+3LbiR/wjMYDv2CSihR4UH5qu5bWLwckacs8YTNcNzCBYVb0zJ/E8JVOkModlCdv8hVJ9YWwSYRz0LnKpNfFiUhn1nb7h82Y3/ONGMxHyhzmoARKeCRkzAhdYO4qEbYsqA+ZU+tTiXqx5UqnGbSXouLb0PGzigAOwoivTa+X14p9YI9LcZ+7Lz3URL6mRUFlGuA6o7B3nnChVr0jG077LcAvSAvqI+m4fXg+g7v2ClBcgzaaEwXygi5figQmvLlKvLcm/BLndoPAyC3/mCDHxcNaLXKSmjpjsY01ikh96Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 11:57:07 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927%5]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 11:57:07 +0000
Message-ID: <48752ea7-2c8e-4695-860f-c02a618ec3d2@intel.com>
Date: Wed, 24 Jun 2026 17:27:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Reject duplicated properties for
 EXEC_QUEUE_SET_PROPERTY
To: <intel-xe@lists.freedesktop.org>
References: <20260624111421.1258364-1-michal.winiarski@intel.com>
 <20260624111421.1258364-2-michal.winiarski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260624111421.1258364-2-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::10) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|SA2PR11MB4985:EE_
X-MS-Office365-Filtering-Correlation-Id: a97b126a-0289-4edd-cd00-08ded1e7b70a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 0/hjQVqPSglK9ltasBqSbYDbRpDhyiujO3qZa/a/1/MmPq2vLd0E5sE37UMZbB/ru1W3dREtRTBwTUhCH9pI7Uz3PoxlMXQOLMHncCCO5Dv5yL3F+btduw8c2EfBjlQ8TPLuslY26CF+gPgsZWwlTTWZvbvsmmQcMTgUhAqqpG8EBfl6XUOu8sRbzva7lip9ENeTEsrR36GR9lU0ca0SeZTjznzcmNka5XJuzD2Et7+JFwvBVbmwnkVEVkDxljUf/SxmS7nyIp26B+kBDMa4seP6bb16RLRkAfirw+uuQDGpERcPz6JL050RGfjvcjl7hkn1miOmWvWWHL0eytkX2RP/5loTewaMt53WyqCsOdG4KTUoXCYVBwTWNbjk0en75PzotD3rsPzPxyk9shtH2EB1gbZdJbb8RrEQXVlmid7ZHatzUJ+/+RTAbJ7h46JpNmOlJzO9j/TbZmYStcaspIRzThGhjZsrsgN8soalBFvRnLfXo3Qx3Y432QfTrG7F8xmll1Jkf/Y/qJfiNdaucpA6HDLQ56jA8L/7XzwrKs5KBi+O0ji2QiEr7zexxQvoaltfbyMfKUPpcbPQ/3sL3UugXvUIYfokoRIHexZFZCp7CE4pjQcL7u+Sncjw5bLr41dF82ikV+CC6/OIfhRDriXG+Z2wApvRRlUsi46Ylyw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVl6SHhjMTVxd1dDVTBHdmJINlFZcnZidjNyb3dsTGNQNW9xRmhvS1hVNG5w?=
 =?utf-8?B?d2pkdFEyd1RmZU5mTXFlQmhxMndZc0t4cktjd1EvVDJnOE9rUTNDU2hGdjZH?=
 =?utf-8?B?dnpKM0xBVlo3WDFSU3RVMHhWUThaZmVQT014cDhzQ1lsZmRuOS80WCsrb0FH?=
 =?utf-8?B?ZmthYW5RajhYNy9wM0xXZnVJZFNIb0tnSkJvQU8vd3VCVXJ3S2lkZnhuTEw1?=
 =?utf-8?B?QjJDZ29LRmFzNGZWSVYrSDNXODVXN2p2OW5SN2V0N1BtRGtrOU1Jc25hMDh6?=
 =?utf-8?B?L1p5dzNnSVNHMnZ4bWFpeUJkc1VETUp3MmFNYWFhS2tTQjV3VzJOTEY4aU9H?=
 =?utf-8?B?aGVWTlY5ZSsyQ1YweGIzSkFhWU42YjMxVDBJL3RlNFJsVDhWWXdRS1hwd3c3?=
 =?utf-8?B?R051NTVFbmtxQ2FIUzgyb1grYU10OHBKMk9zY0hxY05wN08xTUoyU2FWRW1P?=
 =?utf-8?B?SklyTjJrRHo5ZERaWmthYUlGSWV1cHhIaUpFUjRtS2tEbmsxNkxLdS9sUEFU?=
 =?utf-8?B?TDl5ZUtyaDJPdnhsVW4zKzl4Y3djOEJ2L1BKQVVFMURtUFRuMm9IWWliMWkz?=
 =?utf-8?B?RE5ZSzAzL3E4TkczcktIV1Y0QVJwVks1SHV1YnlMeVpEV2RzbHk3Z1E1Y05x?=
 =?utf-8?B?UUlxWktOYjFubVJKMWRLeC9QVHg2RGFHME0yOW1TSHltTVdtVUVNdXMwZnB5?=
 =?utf-8?B?cDVycG1neUNrMDc2azdyQm5XelhwWWFPNUw1VDNmbDZDUHg2NURkVnlXZmQ0?=
 =?utf-8?B?NE5FeER3anBxVVlxWTI0OGR6ckdDNEI0dGV6citnQ0tzbmVwYlhVQWJrRmth?=
 =?utf-8?B?RmdHbncvbUVLY2d3SzdkQzNBK3hnMi9Hd3ZVOXR4SDFvL2s1S2FpZTh3UVdX?=
 =?utf-8?B?amNBWHJmMEVmU096bGJ5bVh4eG1hM0JNUDVUMk5TdUM5RGpOTUtSK0ZRUzZF?=
 =?utf-8?B?bmNpZnlCUkFoRk5FL0FzMFZ0MW5haTdCUGJaVkZpKzd2b1IzKzZMMUVWeWMv?=
 =?utf-8?B?WUpwbENBZHZnV21XcGU2TTB0RC9iZlJCTHF3RWxPVjN2MmFhWlV3SE1rMTNu?=
 =?utf-8?B?YmFpNnZEZkZxMDdOdUFmbWlUZmZwY0JXcU9OeXNnNTB6dHVvZUxuYTFEaHhQ?=
 =?utf-8?B?Qlh1TktuanMyaTlHMmZtY0RpNzE2S2w3cFpHOGt4VWRtTTNMV3diZmhRcUJO?=
 =?utf-8?B?c2VuamJLbVFTZ1BwUzJnamlOLzlyRitXQzNFcjFQZmhGTm5ZRlVoOFRUZU40?=
 =?utf-8?B?SzEwUjVBeGZ4ZE1EQldxZUFVWko0WjZQcXRiTGxYUVhLWVRTbUVFbXpxZURL?=
 =?utf-8?B?YVdPVEl6YjBtcDlKcDROSU9BdTZZTEdKRnUxWEpGbjNOOFdDeUFxOSs2cXN2?=
 =?utf-8?B?VndtcTlKNUR3eHBma3AyTk44QTdmMWliVU1waHVSNzQrRURBQTUrZFZEVk93?=
 =?utf-8?B?dVd2cXRhOFZTbGxuN0VNTVI5KzNvbUJFVUNPcGl5Z3lzZVl4UFdMUW8rOUdm?=
 =?utf-8?B?R3R3b1pWUVNvWjltK2loL3lBbmdBV2hHNURKNy9TdEJVZW5xUlAyWGcwMGVR?=
 =?utf-8?B?NlZTQXBNb2ZTaUgzWlBjenVGZGdSTGV6TUpzVy8yY0JRTzQvTk1IZG81ckFv?=
 =?utf-8?B?bm1BUFlVL1N4T2hieks3eUxyeU9CNGd2TWtXdmJoSjJIaFpEMnRjODhaT1NM?=
 =?utf-8?B?NHRwWnVLa05hVEpuemltSHMwcFdrb1gwMEZvVDF2enB5akFPZ2YzRER0YnV2?=
 =?utf-8?B?enVKcnNMZHRiU21MbXBmMlg0N2J6aWFqdm1Tem1aM1hVYTRJcDRKMDkxQk95?=
 =?utf-8?B?QUp4L3ZuTUt2L3BmbU1BbTN5NXh4TjlLRUxsNHVwaFRZeXRJcS9aL25GcU9F?=
 =?utf-8?B?VVo3U3F3V2JvZmNlVis3VUdWNDRER3RubDR6N1cwWkd0U04wRGpYZ1BNVWNp?=
 =?utf-8?B?bWtKYnNxWFFncnp3eW5LaERoZnhQUkdERXB4dllXSGo4em5OaHZreE5NYVNB?=
 =?utf-8?B?YVlSRlBEenRLaXNBQXJTbVFyYiszcEljZWlIeEFTcGtSQTJzcnFuaGlyUGE1?=
 =?utf-8?B?TkVHOVg5QzNFMWJIME1zWWUrL2QrcEN4TEk4SWNMWXdJbFU4bWNzbkFndW1R?=
 =?utf-8?B?NEc5MWdNNXpia3NDaExzQkdpRnhkUVJ6REFWelJGaVM0ZnErUjN6ZlV1aHJ0?=
 =?utf-8?B?MEFnM1BPMjBuUWt0dGQ3VnVib3hVTVphckY0b01UQmhuTzJBc2hIUGZtZ25C?=
 =?utf-8?B?S3RIRytqcDQvamFJYlFNcTFVekxxNm9KZlFESlNRZjZtaUt4dWljejRaWXJl?=
 =?utf-8?B?ODNXOWZmdENpTVNlUzhZUHorNGs2RUVUbVo3OSszMkdXaWM0MDBpMnYva1pz?=
 =?utf-8?Q?JVEG/NjI56HRF3Zk=3D?=
X-Exchange-RoutingPolicyChecked: G6LF/A6Dll1m7GcIQUd/haZLKHr7FSrmzau5lIL3aH3ExBCdtwotxD6lzL/ad12JX0DgRli3r/B0aUBEH1Iy6BgpdasJl45mLkgFbcI0rUGZ3SUzF8dI1PqknL8LPmxWbVdZlIkY05BadKar/7u8V1VEioMUnk04U929co0hcfvjuN2Tox4P+YRp4Y4CEanr656PKzAZeGSEDN/WIL0xj5sqxb73XVE5kFz11CpbQSYa6GnXKyAtRmPQGEUa67MqH9PCtuBAHPNWrgdgQTrSjYLUmNUHOj6JM41bDeA0fqXI0zdkT6GPpILXr/urDr/reoiCFwL7cWlojxekLG5emw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a97b126a-0289-4edd-cd00-08ded1e7b70a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 11:57:07.5366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEnqvWxn2SV+AjJMaXXaM+WDfcuLmHLn6bbDqtE/Ve1co6cMXmhvtXfqvtdOT8x0SeXL//rQRy2ZrJdkYkQ1glof6ebWhs8EcBOpUXURp2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4985
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


On 24-Jun-26 4:44 PM, Michał Winiarski wrote:
> All of the properties are idempotent - setting them multiple times on
> the same exec_queue within a single IOCTL doesn't make sense.
> Return an error when duplicated property is found.
>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 663decb19304d..c5edff8397353 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1112,6 +1112,9 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>   	if (!exec_queue_set_property_funcs[idx])
>   		return -EINVAL;
>   
> +	if (XE_IOCTL_DBG(xe, *properties & BIT_ULL(idx)))
> +		return -EINVAL;
> +

Any reason to return -EINVAL? If it is already set, can't we return success?

-Satya.

>   	*properties |= BIT_ULL(idx);
>   	err = exec_queue_user_ext_check(q, *properties);
>   	if (XE_IOCTL_DBG(xe, err))
