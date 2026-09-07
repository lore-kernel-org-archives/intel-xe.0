Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09D8C79FA0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 19:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF9010E081;
	Mon,  7 Sep 2026 19:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WglSvUuk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4BE10E081
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 19:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788809200; x=1820345200;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T1IRxY6zwqR7Mq/7uFHyPGQo9m4SGY0gdQ4HuSX285E=;
 b=WglSvUuk3LkHlM36cC57kAbxVMrxlpe8S+jhjMU/WIODNyEq2qjobgS2
 OArJqWeMmba15t71GtFE+Id0YIJwH6mwDltMgSxIJ48MDG5LNlaAHyAX6
 kjQ1BKTpR8mVaOTU0WSmHMEIqVqWTXveTLn9YR7X8PGu94AQNGHwy1lkl
 u1OkjXTiqi+x2gqqicZej6SAa4E/pVMr/1uVfJqnll9gcU8Gc7yREitRe
 1zAU5dBRWrpEn36zOL6I3v9moXXe1gmjFlOR4GWelDB7BkuL4HF7AEEEj
 +onBSDX2hrXIDQhSzFBuNRF5f6ER6//Rm8mPbdFcgt7T1uqwsq/jM2XaI w==;
X-CSE-ConnectionGUID: Qim559qEQmmaaOXyhFBD/Q==
X-CSE-MsgGUID: DFUnXmPTTYCLhXzGavudlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="92912043"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="92912043"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 12:26:40 -0700
X-CSE-ConnectionGUID: Uhr/IUbhRRmLaT0+Z3PI8Q==
X-CSE-MsgGUID: sSd79JReQE+dWJmA2AaAug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="294257470"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 12:26:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 12:26:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 12:26:39 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 12:26:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMGNT0ZNBx2yCEpCYNxZKBqO0J0W6A1uzzQa65NDPaKQ979+Hw4mdDTUkdX+FyFF2IJ6c+GRXgoVQOj/cmi8DNEWNb594rK2SXUiMvqevHSB76/4AkxK+v33W1jO8y6kYtxNhtetdDWkn18MnisMWSf5HkAbVjPr+5Rs/ozTNwt6xzXYTqZCmeWoEUqDHORmw+w8ymAu/WEfyyrvCFRPgXd1S4s+VesogY90voT/whr1s+o197Msnr/JoMaPwyv+vOTKXaq/hV2G/jjQsKs1loPNLWn5p8hQFkDPW4oro4iLp+2CfnDsnJkq72dZ1UpxJBzbUnacijVdKQWFEKx79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0MWhUOcEZowNtA0RzXcwOdmIT8GXm8TeBhJGYXGa1k=;
 b=YgMkRovCyfj8F2j1VV5D+dIEBy0FmWevdBmxi0x3XYLXiFX+t8JSEo3oq3yLnd8SfRITwwif5SFBCz4TcE7OiqCncWBc6gsdWztmJa9yopwZWoLmktu9kLXVbcfo5yMptl2zTVkkYqtLBx2L7Zhr/AwuCLOGUVZwOnXR59EKglb6ujjOOBgw/hfM2l4dV8f2eckJVGXE41MCQ8Mc1tS9s2yERNiyhuqtLXi6D1H2OHsD9wzIYuM/s7RMblfjoOxA4YAMlnJ1wje/NCLHukUmAtXa4eizx2U7jp44sPgbhZSn6NFlMf+GlPXwUSaLh7YekNvkaeUUwCIMePgFvGH6vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DM4PR11MB6454.namprd11.prod.outlook.com
 (2603:10b6:8:b8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 19:26:31 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 19:26:31 +0000
Message-ID: <d2ff1764-17f9-4b41-a124-2f1acad021a8@intel.com>
Date: Tue, 8 Sep 2026 00:56:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] drm/xe/xe_ttm_vram: Report max_pages reported by
 firmware in debugfs
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
 <20260907094706.1407436-13-riana.tauro@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260907094706.1407436-13-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::15) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: cb76d17a-7d8b-40da-8a3d-08df0d15ebb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: cmfWY5AvGEM8CeBkGz3+N/blEzVpSDuA3zGYq284D63J0/hCtuQ/J+alfzPe7HoVblxf+un9oZMEBUj2B7N0Jel0HjQ1iqRFZE/tUjog+OaW8Mb8zOS6L5Gb3OEYCSq42aeZv6HgziERTKE0Vtf/tEIKKGC/2q053rccRNDuSo24LVYcFbAM4GS6yUBpe3HqBzVTV7f8iW5fg5y1oO5MbfbH53A8rpPCmWWC/YELH5upOictPyW8tice+RA7PPHxmnkRTZTkp8EnTqp8YLKVSpWE/0cbBm3Ru5Pn6TzJNmsUP46WPVh/Lmysu4UgOklPmURnyq3CVGkaXx9GaWfUbqu9hTRAu805DN3RUvpwzaq/ks/92Uj//8pWVH2cMwq0BTs7S4G7j6P96ZJ0nG9vS+ql77dMJ57glCcLtVNNltKozIjJiTSHOb2KdXq0ILasEJDw0ImwZso9+TEUhsZlwK/kyVhiYB+eluNujf71QEDLv/Q6hP9zo90qyVJBkGKfa7K2F31NMbykCt6Y2Efq+wj04gSLZz1GsJsRTl3WrsmdDm7u131najqcCBGC/q1kubTZjcIdGl4QlzQ2k9xQFb34vJmxsxqORBE381YiK/Ml7Soknn7zignZ0uoOcUwtHMPlRKt8qGtEWsSBaKepgJnUAucCImiCZpWvYt2QCK8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGRqcWZFOEVVeTM2YUNLNERmcEtNeFRKTnVNSW5jV3EzVFNiRGhwTiszcThZ?=
 =?utf-8?B?VFc0TWdOVUxkMHl5WUZKOFJCSWdqQzV6cHlwaFVzYkVwNnFKdEFjN2o2OGps?=
 =?utf-8?B?K1FGcjBpUlE3ZGJjcEJCZkxwVzYwTHhNaXVhY2NIZFRSMFJKb0U1cllKYjdF?=
 =?utf-8?B?SFU0Ri9kamZ6a0JQMGpVUEZOZkgrN2FSRDk1UEcraDBOSkRTTy81RXoxWGkz?=
 =?utf-8?B?NFhIKzYydnZUemE0RWpkaXllUnBSYU1GQlc2MnNIeW1HQklqcmlWNHVmWXc2?=
 =?utf-8?B?cXdzbkdkR1RBQmNXaWs3WEM1cGNBbGw3K1FIS0lsTE9MQmw3ZVY1elBmRXNk?=
 =?utf-8?B?QjNOMnlpakFrczJUenNyTUhRNVBlMGFMcGthN0F2ejFkazNvZk5Gc0U1SUIr?=
 =?utf-8?B?c1VlRXlCMmdVSXlsUDIvOGVNTlVUMDNVSlMyTWNOT0tqVllIZEp0SDlkOUlW?=
 =?utf-8?B?T2EwTHZnUDc5WVVVZUxmQmZNeFlxMCs2MGtFQkFqL0RHcFVXVjF0MjJCM21T?=
 =?utf-8?B?a2cwZW00b3VKOEg2cm5XdDZLS0xiTmlzMmlnYmx2MWNwZmlEbFR3bVZhMVdT?=
 =?utf-8?B?SnQrQ1A2R1I1NDRvaVNoclYyQm9sT2JFdGxLT1BkNWpmUzVpakhWSUs4aEZL?=
 =?utf-8?B?UjI4M2lTNkdFYXBjNXNyMWdXL2JxV3dQSWpldFZGQ2FuR0lmOWI1cFZteEVn?=
 =?utf-8?B?bFY2Zy9yWmk1WGJYd2RNUnF6NUJURWJ6cWNRRWt3c2NMSktLUC9MN1BrVHdO?=
 =?utf-8?B?WHRZajVRVFNtOFBJZ2xPRHo2NmtnUGRiWE00SXJURnlqbkF6aHFEeFYyQXZp?=
 =?utf-8?B?L1hDMjhYeHhZUlVyUVEzc2c1M2hyWVBaMlY0cWJjb1dtdC9UejE0SHRhR0pM?=
 =?utf-8?B?U1NBQUJEdVl4UDZscFllNjJaVVptRHFOUkI1Qk5nNUUvbG9YM3JIZDhKd1Zh?=
 =?utf-8?B?UC9qY2M4dkU0cklVK3JOclMwMWlzSWR1aWx1SWtIK2x0ZEk5MlJ2MHREZURz?=
 =?utf-8?B?NzJOZXNNaUlYTzdzTjA3NWhQYVI4OGhoR2o3RGZuZkRwd2NwRm5HQlFiZnc3?=
 =?utf-8?B?cVFoeFBJQy9GUVc0aytXVWE4WVJJQ3ZuNHBERlB2dXAzRkdNRW13OXRiaVlk?=
 =?utf-8?B?L0YzREpkMjdCaVRLVlVtZHd5bDFEVVl5ZUQrampLbmQrOXZmMytqWlRTdWRq?=
 =?utf-8?B?c2pUaitOblQxR01xSWUxdnV6UmtyQUQ1MWxNVFdXbmtIUDlEVy8rTERxSHBX?=
 =?utf-8?B?WjR3OVFwMnZwamFndUI5eWFYckNZa2svUjhQNDZQa0VyQzN4MDAwMXpmcTJY?=
 =?utf-8?B?SEpHT3ZHb3pqaUEwSHBIQ1pQQXU3NUlydHg2VlJ2V0NhbW5IWjF4S1lydU9n?=
 =?utf-8?B?Y1V3L0pENEl6K3Q3ZVluUEVEUXcrMU5kQ2dLdzczUWV4YVcrRzMzRVlVTlY2?=
 =?utf-8?B?SUFiQSsyc0xVeEtEbmVGMVh0WXFqY01CT3RVc3JPNWJXUTVvcEl0UnRPQWVO?=
 =?utf-8?B?Umg5cGRkZ3BNdnQ3NktvZFNaY1RkNkpkc1R1VmZkOUFrUmg2OVp6am0vamtl?=
 =?utf-8?B?Q0xrM0crVXE4TDZqNWdBRDhLTHR1SXBYd3pHcGNkY1VKUDIzdXBJdUFDUWl1?=
 =?utf-8?B?Q1U0QVNhV0Q2bi9YV0FWQlVMaTR6NmtvaUExemk4emtTbkZOamlFQ0RQd0xB?=
 =?utf-8?B?L2xCblUzdFpQNlJRNlR1UU14bVJJSWIyY2w2WU91c29nWWhOaE1yRVRYbWhS?=
 =?utf-8?B?RVp4UWZSeTBqZWxLTjlRZ0VSN0JLRFJKNmtOTVVENVNQWmZXMTdLbjlUR1VP?=
 =?utf-8?B?aytLY0VpNURHVjZQR1ZPclBqVXh0UTJtaTFtMjhKS0orNzhJM1Zpa0RySW90?=
 =?utf-8?B?NEx6K2Z2M3dXdndIOExPTTJncUs4azlnMHZlUHpTUnlLWFlqYWxLejc0Q0hU?=
 =?utf-8?B?RER1QTMwYWxMT0tFajA1dUV1UzV3VXJlM0RFMkFsMldxbk9WYVJuSDVKeFk0?=
 =?utf-8?B?emcxamZwWDR5Nm01NzhyUEs5MWdQZTZpZ3dVQ2c3RlhEUjhDR3BoWHhOMVVm?=
 =?utf-8?B?RGRFbW1yWWpqclZUQXljSXo0bGpwTzhyNDJXVW0xYkkrdXhGL1hsSVBVOFo0?=
 =?utf-8?B?QzBBQzIxeUFTdEtqVGE0Wm0vRnp0ZW84cHdPVkJCUlhEV2ZVUy9iTllsS3lT?=
 =?utf-8?B?YUJVWTJvakp3UVJFcTJzVVF6azViY1IzSU83b2dIaUFOdTlWVHVyTS8vS0tV?=
 =?utf-8?B?Q3FNS0lkaGMxOEFiVU9sSTA4dXROYVNhSFFSdEh4Y2Q2REtGaFZMYWxUWHVN?=
 =?utf-8?B?bHpNWmJ0SXB6djB1VGcxQWtxWEpqaWZra2NxQXBWOEIrR2R1OExqalBvc1ow?=
 =?utf-8?Q?UZdiZIbmbYLcbfEc=3D?=
X-Exchange-RoutingPolicyChecked: L5u6/+rRJlT8HQSrPmAQpEfQj7Q9+L0JGXDJcFzHN+zjQk4LBXcRtg6k9cJbRvuXoNbpGveY/NOjcIChdhZF7w/W7YpmuHS3vAIHEzu3z/l/pY2XKrPOpc6kJiiZLJKyBOSBFRQLEkuI7/Dpb4temAlC93g01IUWpJKyr0d3RjFxyEbYgTeP1wTvnUOYw9GKv8MuLboRbLt8IZ+qNEgORAomd7NEx1w7fZPx8AkIVCz6ZZIQTnFWCBmrp9aS/txO10GzzCxlh9HJKyedip4OVjR0Q1EImB8u3jmgHTSopfzLdwLqquiPcaQM5LnKIH2NTEiw1rSwk9fHGCKIcHFEyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cb76d17a-7d8b-40da-8a3d-08df0d15ebb0
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 19:26:31.0776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NcwhQKn2FTD4RB4lzi0hpg/A3I3NLPcpfST8Qjd0Ub8IX9RpBXZuGZW5hcDR7KZNNatrCxGm5naiQ2iHgT4htQF+AOBi5fylDt8AHc9b1ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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



On 07-09-2026 15:17, Riana Tauro wrote:
> Report the maximum number of pages returned by firmware at probe,
> resolving the existing TODO.
> 
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 6 +-----
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 2 --
>   2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 2c4722a956a0..cc33ba7e23c2 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -1012,11 +1012,7 @@ static int vram_bad_pages_show(struct seq_file *m, void *unused)
>   	struct xe_tile *tile;
>   	u8 id;
>   
> -	man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
> -	if (man)
> -		/* TODO Hook with RAS to show max_pages fetched from FW */
> -		seq_printf(m, "max_pages: %d\n",
> -			   to_xe_ttm_vram_mgr(man)->max_pages);
> +	seq_printf(m, "max_pages: %u\n", xe_ras_get_max_pages(xe));

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   	for_each_tile(tile, xe, id) {
>   		struct xe_vram_region *vr = tile->mem.vram;
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index efcf3e1d4e80..dc97b0ad0e51 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -37,8 +37,6 @@ struct xe_ttm_vram_mgr {
>   	struct mutex lock;
>   	/** @mem_type: The TTM memory type */
>   	u32 mem_type;
> -	/** @max_pages: max pages that can be in offline queue retrieved from FW */
> -	u16 max_pages;
>   };
>   
>   /**

