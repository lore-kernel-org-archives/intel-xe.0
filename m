Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C0AE73147
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 08:54:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02F110E3B7;
	Mon,  2 Feb 2026 08:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nNOVpcJ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF6910E3B7
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 08:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770022483; x=1801558483;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IN3tHetiCQSl5OgDOGGjFFEp0oGq/wyLQoeI4eZch0s=;
 b=nNOVpcJ/rYCxLx6LwMG/2bD0IsP9LrNFuOnVqNkZOCVSUBls4xBQmSlv
 6StpF3uxKLfdBXB2twEBTXCVxLC1YsK2dsSx9cH87VOlIGEV+nb5B1/Rn
 Yd60yJawpnSsX//4WVlSru8MFMkGByY1nebe6OP1MLezv6t8za+TcaK4k
 N1t9qLEcwEeiiEfpxsgFkprqOejudejjTcCz3SPNKSLKYAuykM+G4WuCF
 sSlb2MbWhdMw628sTjzZcIDUvoOqy5hY+Ui/grNIZlNlGsI0OaOS+pjfO
 4uWUhYjErf+pZf6pLDbmUsdCjbKKb+DFxzKu2Jlp+DOsUiOcppHW1M+Og g==;
X-CSE-ConnectionGUID: pa4egfWsQ72cZYQod5vHOw==
X-CSE-MsgGUID: ANOckFiiTYy0eKRgCY7IBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="74799405"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="74799405"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:54:42 -0800
X-CSE-ConnectionGUID: 5zEHruTfTFiygk1H6mF/KQ==
X-CSE-MsgGUID: fNoZ3YcMQ6iUKjk2w7V9mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="208976156"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:54:41 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 00:54:40 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 00:54:40 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 00:54:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/mF8ee4Xt/6r5r3akPF1zoK+4hhmPJwt5JgJ1NXJeA4IzyLFluxdbKnkylUoRzPb7BPA6m3u5mzdls+5sv21B4MnYLKWnT0ZyyeXsEE/bruB4h+m3Q7ioLOVKBl6Z1T1wPmh5CdZTZnFVcXiXdXGQuKpXHjdRM8w3hvXMOZ98MjmMEQzCHNsKbhfY7KA80ukfLykToDtuYrsI8maICua7fvnmOJom/ldVFwJGPlvvlyurZQDdqFVCSSB/a84uegpEEGKXjOLAGZ6a3xvxuuISzv0PjFa/09q8OELi3rKkxH/jnImtPHyy7yhaOVZv97wAlH/r6E/qnMoBB7Z+4HVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ssiqNBal0l0Gz+9XNBTX6LUsO1t97ZQtYj1+CGo8CE=;
 b=czRQ1kGmQIbdB67e63F+VJo+78Xpr34+plZnbkGVfiT9w9eqFUXe5Sr8rc5Hl6qpyF4qvD2/4r8Oq7/HPAGxmiwMyTBD3JFzoiSGTB6ElKnUYrfM8wYwiHMcuuwCUrRfBf3hHu1PL28Z23Bh1K2ooOXzjg/wSwFTYzyJjm9F5M1+kPfS/cCwsDULQiX95OWBr2s9dox5Q0XrKDNM2JfU5QGS9MxBW6F019OQlNDt9KGPUg5sQsgGVSos9cKMootLz0DV9In0D+AjVjxf3+aEUYlzzib7wgWnLn/cRbbaecTaLDgQVYumAKyAK0Tuv+FpJpze9Q9/OircYWtx97ocdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA2PR11MB4857.namprd11.prod.outlook.com (2603:10b6:806:fa::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 08:54:37 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 08:54:37 +0000
Message-ID: <33cf7b8d-f1ad-48e0-8c03-88b0a23f8680@intel.com>
Date: Mon, 2 Feb 2026 14:24:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/xe/xe_ras: Add support for Uncorrectable
 Core-Compute errors
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-17-riana.tauro@intel.com>
 <d0b58cba-c8d5-4c25-865b-47852661d387@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <d0b58cba-c8d5-4c25-865b-47852661d387@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0040.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA2PR11MB4857:EE_
X-MS-Office365-Filtering-Correlation-Id: 377e62ae-9503-45bd-7a4b-08de6238b1d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3JWczI1di9hRFpwNzhFQXg4UG5Jc2R0MEtJWHRaa3RuTExkYmlKdEJwNFdr?=
 =?utf-8?B?bFRzL1h5U1o0czFjUDI4b0dpaG52a1JEWG0yVXY2cnZEd0duMnpqVXV0Mkww?=
 =?utf-8?B?TFBEYW44RC9mZHpyZEdCRVZqc1FMVTd6MEdxL3ZaY1JnU0VlQjNRWC9XTVFW?=
 =?utf-8?B?SmhEYWZReGUzWVk1L1pPdnBCcCtDbUZ1TlpEMW5HNUVac1Y3eTFJT2dSS2Fl?=
 =?utf-8?B?clpsUnpERmFwVE1Dc081WGNMZ05TeWU4cTFhSGRaZVh5d2xBdXVaMlE0YThF?=
 =?utf-8?B?VWNvdjN5b3ZzVDR5dnB6TlY3dFd1VWd3dllIanlMMTN5VGx4ZVZzNFdqSHB0?=
 =?utf-8?B?N2lHTWtsa0I0S0llc0d1NDVVblFqMVQwNjdkU3NJb2hzVk1VaE1ucVpTOGE1?=
 =?utf-8?B?UzdvZkFhN1J0akUvZHdwVWZpTTA2aTJwQ3VSMDZPUWVFWnpwL1Fyenk1RWxO?=
 =?utf-8?B?QkdpUWlFZnJGUE5aTEw2VC9idi9lQXJqRzNjZmMzcXlnV3g4TnBlcFpVRGFD?=
 =?utf-8?B?TEszZHE4VEIwbWQ4LzdaOFZVcjNERjI4elpTK0FZQ3gybThWY1I3dVRoeE9J?=
 =?utf-8?B?alBqbUNqaTBBdlc1Tm1FbG11SmNTcTk4Y0lBRllVMWlDUkU2SlZ5SjB5aXQv?=
 =?utf-8?B?M1NTbFk4alRORk9ZVGdwNXllanlaYnFFZ1BHTElNVjNDVlcrWjEvVlM1emd0?=
 =?utf-8?B?ZGJIWmJlVVJSV2dQM21ZSnJzNlVBL2I3Y001TTRPUEFPRXFyaER3TksxOG1p?=
 =?utf-8?B?OEhESU1rbmZzWTloK2FjMG5NQkl0TGJ0K0tvc0NjMVlHYVhJd0tTa3UwVXlU?=
 =?utf-8?B?eUZPNjdycjVYTU1RSmdsY3V5VWY3RUVDVHY4WGMzSUNHekh1NUdMb1NGRFVC?=
 =?utf-8?B?bEw2czFkM3ZMS0xpVDViN2lkNVNCTXhCTCt2Q2FtcnJlSmhXK3VVWndRUWlV?=
 =?utf-8?B?aVV2WHdTVHJnTHY2MTdlMGpHbTB6QWZEVHNoMUVlanBNMFVkWFFKNzhicEt0?=
 =?utf-8?B?NTRXYjdWRzM2UXVGdkxSdUxjdmVsQzRCYWRPazlHa0lEL2hhdHlqczBudW5V?=
 =?utf-8?B?ZTlGV3ZxNEl3cUt6RnZtYlZlTkVDVGoyOE9GaWpZbHJYTkkwTkdaaXd2WTNn?=
 =?utf-8?B?NjRWcGtwZi9JTnltcWdJUG4zQWFtNEN6V1kvcUhHOU16bUN5YVlVU1BFRlZL?=
 =?utf-8?B?cXUyekxyWCt2aTBDRkVkOEpVWkNJdzB3U0h3REpUVjl0R2VjQzgrWDlOciti?=
 =?utf-8?B?emREVVFuYUUyK1QwSmNXQnJlWXZhdzg3d2dwc3FBMjNxYTAyL0dPWDFMZHJ4?=
 =?utf-8?B?OFBzcmJOYTdsNjFxV0U4RVVnbVc4NXRGNERpekRDWlJneEF2TW5MdnYwSmJr?=
 =?utf-8?B?am9uekdlbW8yNk4rZlFiVlNoRUZ4T2xQNDZyemE3dHlob3FCcUdIVHRZNXpS?=
 =?utf-8?B?SWk2NjdmZ3ZkQTJueStGaXlLMjBlL3RwNlhKTnNuUnZQRXkzZy92czJEUlBy?=
 =?utf-8?B?N0FzZW1qZTFESFNBZ0lNRlNwazFGY0Q5dVhSR3JVMU5CaTFMcTY2dnBiV1NU?=
 =?utf-8?B?Q1B3RTEySmFJYzVpTitMa1lDVVpWZXFmL0ZiZGZybytyeEZ4TERvN2pJQlpZ?=
 =?utf-8?B?VEozbzNUdmRaQ3dRMVBNU3cvWDAvTjlodU1vRThzU09tZUlDTXdOWWRBTFM5?=
 =?utf-8?B?bzI3Q1l2MlpkY1c0bkxOTWtOaGVOc1hjVVdRTlZITlZFRGVVL2dFUFhiS0JW?=
 =?utf-8?B?M051eVRyRy85OUU0eVUzV29wVEpmVjYrdS9nN0U2ak9zNGJCOWFva2hmK1gy?=
 =?utf-8?B?bktCbDRSNVdmOEgvZ1VpK2Y0bGhydXZsWVB2SWhrRE5aWUs5VVMxSDM3dHpS?=
 =?utf-8?B?SGZ0cDNQcjY5blhFSGhnb2F5UnE1OTlHR2RJRkZzWTJqMzZ1N2NKcHArTk44?=
 =?utf-8?B?S0d2T3hNUTVhOWtwV1loNUtVYStqNW53ZVQ4RER2RWViK3RJZXBjZ2JpYWhl?=
 =?utf-8?B?QXptWGFFQ096ZCsxUk1WV3c0ZlRxVHhkT0JNWk9obGVFelF2Mm1hdmxIODI3?=
 =?utf-8?B?OU0xSXlMYkc5UnNzcjUyNXdLYnArSWRqaXNOcGNmL1JVN3UyUXQrRzBoeXZo?=
 =?utf-8?Q?M30E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkJHSW1oZXl4QlNqeThsU2h4Szc5VU51ZEhZcXJpYXZZekh0aW01Vnk2Qnls?=
 =?utf-8?B?MGpSWDZZUS93bkRIWHJDZE0zcnRJakNnM2VQemNxK2NpKzgvVSt3ZGZORW4r?=
 =?utf-8?B?Y3B1SlE5L1V3OWc2MWFoMEZPNWdvcEtyaWpjcmZsY0xXNnhJdTEzdFdIUjBM?=
 =?utf-8?B?RFVKMWptYWZuZjY1TVJSRWdiYUxqbDczUFN0K1cvdC82Sk1zMFdyekVJZVg0?=
 =?utf-8?B?Zllqb1FUZHp0Y2hHUW91b2hwdGJFQWZSajZQMXNlaUJzS2dVcGJwYko5Mk9w?=
 =?utf-8?B?UXp6SmRIZU4wS1Y1WWRIYkpEc3dCM2IvUW5USzFNQm1wYmMrck5lTjhUbWlS?=
 =?utf-8?B?dTltOW96cXNOSitHcmZGZG9nakRNK3ltWElOTFhsdVcvdE1mUlFaWVJYWDlo?=
 =?utf-8?B?QXdVWExHMVUzVm82S3V0dmZ6VjZQMGhUV2txWFA0V2hIV2NzSmc0QWM4ZVVv?=
 =?utf-8?B?RHF1b1ZOZWFvRkloOXd4dlFkd2ZXUlFoUTRYZUxXQmhQNlpMNzk0Z0pCY1FP?=
 =?utf-8?B?UnlVNXlHQk9hUGQvVlZTREdjdlhieUxudUV3T1hJL3MzSmJWZUl3azV3N1FK?=
 =?utf-8?B?ZVpwVEg3QmhkakhtdWxrbXd2SUFIbUwxV2RqeVJaaHRxdzkwd1B3dCtQL0FB?=
 =?utf-8?B?YXRuZ0tEbDQ2Z3RFVXdMNC9hV3dTZXpCVzlvQThPSVd2UXdQMm0zNVJQd2Zq?=
 =?utf-8?B?OHRTZGlPZlo3NjZFZThpTmU4RHh5MXhxZWZZL3lKSGhkd0UvTW5yVzdJQlEr?=
 =?utf-8?B?cnBoZ2xmZ1V0dUV4TmNxWWsxdWlIK0JoTUQxSEZLbEJHODJtVklwV2QyVWFM?=
 =?utf-8?B?T1l0aXJOcWF4bDlZMldCeXhvd2NYRVpabG1DaWRTbnZkczFuWlFwSC9QRWhF?=
 =?utf-8?B?NVJaNkhBcE14bEtvQmoyREtKSDZtMnN3cGFveHBqSFREbWJaaklHdTF3Q2hi?=
 =?utf-8?B?dnNsUHJnbi8zUWZPK05vRE5ETjdVM1MyUlZWSVRhUDBxNWpuaGc3SmJqZ3RD?=
 =?utf-8?B?VVlpWlBieU1JZmhoZFducnRScEdQUnpJSjE3U3pmeGFVMGNielVVYUoyYWZ4?=
 =?utf-8?B?WWcvQllaNkp5ZEhQS2lTYk5SN080N0p0aEdzSVZYVWpQZ2daOHg4WjMyVm1Q?=
 =?utf-8?B?bVdMQUdpRzN2MmV1QkdXTFptQ0pxc3JRRW16bmh3S0xvSjVGeTR4OG9laGs0?=
 =?utf-8?B?NThxamM1NG5FMU9zOThFVHJodXVCQng3NkpVV3BSeHBnT1lDMklkZ1pIbnlM?=
 =?utf-8?B?Tk1xS1VDVCt1elU4ME80cmdtYzQwdFBONjhudlB5blJMaWI3UE9TTVVkc1px?=
 =?utf-8?B?V1ROZG14YW1ZTHRjSFFLc3BIbTZlOHExSWxMM0hGWFV3bGRWSDh5Z1pKM0Nz?=
 =?utf-8?B?OUNhZkNHSkRNdEdnL1lYS0xJV0txbVBCQStueERZRk5Pa1JKaGtJODBzamVn?=
 =?utf-8?B?NE5jS1h3TmtHb0dpM3VjSnZwZEo2NmtvbTVCdEg3blo4T0pFNnMxRFhhNnpR?=
 =?utf-8?B?Q0p1U3R0U3UvRnpaTUtHMnRBRmZBWU9ta2p3Z201L1JEU3hkRC90TnlyLzJL?=
 =?utf-8?B?UW9yVE1zaFlaRVA4V1prbkg2NWxvWGloem94NlZVV3diNFlvTUljSndWOG1I?=
 =?utf-8?B?WHY5bDhSUnFRT3ZwVHBMMXpWNUVjUUw2SHdHeHBsbmZkcnE1VlBzZ2FEWUR3?=
 =?utf-8?B?MWNhNlBnaElyT1JNVGx4ZzVHaUdXcks4UUl2NmNWMGRPVHJZakNxUzgxNnR6?=
 =?utf-8?B?TXZSK3psRVhWdEthTEJwTFU5NThpZXJtMjdvd3RvZTZUY0luaDFKZWV4SmFS?=
 =?utf-8?B?aUJJRWVSNE9ra0N2a0hKNDQ5V3JMNU5UcEk1UVVPc2M4R3h6eG43bUxaK0tC?=
 =?utf-8?B?ZjR1SW5hVzJIQnh0algxb3JrM3VEVkR1K3FTeHFHcVhEdzYwUi9EL0JDM3oy?=
 =?utf-8?B?cmxZLzVBTFFJN0l4c01IenIwQ0VQblZzNUtpQVNBS1Z2MEZMNG5HQnoxZHBi?=
 =?utf-8?B?SUtaN1ByUUdjemM1aGU5SHJORFFPMTBiRG1RK09oMGhtRTR3V0JHdWVlWFNt?=
 =?utf-8?B?QS9pc3lxM0V0ZkJyNEl2Y2pDd21NUWJ4K0taR3E0U2Q2eTdDMWxEaHBQZ1Vs?=
 =?utf-8?B?U1BtVUMwYnEvMjNYQVJ0Qzk0K3g3c0ZJVFJiWXkxbEZjTTZiMEFlVE1rUHpB?=
 =?utf-8?B?VTZVRm43NnpYRHJDcmIwTTdJS3JkWWRtNEtubUZVV1NsYklZSUhrelJiQTlU?=
 =?utf-8?B?bk51Y2h3bGRxTXIzZHFWeHRLdkxBdE9FTXdoZ3l2UHRjNTI4YmVGc0VXT0Ni?=
 =?utf-8?B?WDBjckNrUm5TYmdjcUY0ZTErOXZiWUswdko4eFZzcGFuZFFxVGVGdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 377e62ae-9503-45bd-7a4b-08de6238b1d0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 08:54:37.7710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmZbBLii+YIAsVh8bi6E/2b3460e1TAvyJ4ulB2Hb3LJpnYgeN9Kf0tw7ZMXvFYcarBY8yZnHCxUEDQXfe+dSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4857
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



On 1/27/2026 7:33 PM, Mallesh, Koujalagi wrote:
> 
> On 22-01-2026 03:36 pm, Riana Tauro wrote:
>> Uncorrectable Core-Compute errors are classified into Global and Local
>> errors.
>>
>> Global error is an error that affects the entire device requiring a
>> reset. This type of error is not isolated. When an AER is reported and
>> error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
>>
>> A Local error is confined to a specific component or context like a
>> engine. These errors can be contained and recovered by resetting
>> only the affected part without distrupting the rest of the device.
>>
>> Upon detection of an Uncorrectable Local Core-Compute error, an AER is
>> generated and GuC is notified of the error. The KMD then sets
>> the context as non-runnable and initiates an engine reset.
>> (TODO: GuC <->KMD communication for the error).
>> Since the error is contained and recovered, PCI error handling
>> callback returns PCI_ERS_RESULT_RECOVERED.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c | 109 +++++++++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_ras.h |   3 +
>>   2 files changed, 110 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index ace08d8d8d46..2a98cb116dc7 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -2,11 +2,16 @@
>>   /*
>>    * Copyright © 2026 Intel Corporation
>>    */
>> -#include <linux/pci.h>
>> -
>>   #include "xe_assert.h"
>>   #include "xe_device_types.h"
>> +#include "xe_printk.h"
>>   #include "xe_ras.h"
>> +#include "xe_ras_types.h"
>> +#include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>> +
>> +#define COMPUTE_ERROR_SEVERITY_MASK        GENMASK(26, 25)
>> +#define GLOBAL_UNCORR_ERROR            2
>>   /* Severity classification of detected errors */
>>   enum xe_ras_severity {
>> @@ -60,6 +65,106 @@ static inline const char *comp_to_str(struct 
>> xe_device *xe, u32 comp)
>>       return xe_ras_components[comp];
>>   }
>> +static void log_ras_error(struct xe_device *xe, struct 
>> xe_ras_error_class *error_class)
>> +{
>> +    struct xe_ras_error_common common_info = error_class->common;
>> +    struct xe_ras_error_product product_info = error_class->product;
>> +    u8 tile = product_info.unit.tile;
>> +    u32 instance = product_info.unit.instance;
>> +    u32 cause = product_info.error_cause.cause;
>> +
>> +    xe_err(xe, "[RAS]: Tile%u, Instance %u, %s %s Error detected 
>> Cause: 0x%x",
>> +           tile, instance, severity_to_str(xe, common_info.severity),
>> +           comp_to_str(xe, common_info.component), cause);
> 
> Please fix formatting issue (Tile %u, new line at the end of message) 
> and include timestamp in log message.

The intention was to use Tile0,Tile1
Will fix end of line. Timestamp is component specific so it's included 
below.


> 
>> +}
>> +
>> +static pci_ers_result_t handle_compute_errors(struct xe_device *xe, 
>> struct xe_ras_error_array *arr)
>> +{
>> +    struct xe_ras_compute_error *error_info = (struct 
>> xe_ras_compute_error *)arr->error_details;
>> +    u8 uncorr_type;
>> +
>> +    uncorr_type = FIELD_GET(COMPUTE_ERROR_SEVERITY_MASK, error_info- 
>> >error_log_header);
>> +    log_ras_error(xe, &arr->error_class);
>> +
>> +    xe_err(xe, "[RAS]: Core Compute Error: timestamp %llu Uncorrected 
>> error type %u\n",
>> +           arr->timestamp, uncorr_type);
>> +
>> +    /* Request a RESET if error is global */
>> +    if (uncorr_type == GLOBAL_UNCORR_ERROR)
>> +        return PCI_ERS_RESULT_NEED_RESET;
>> +
>> +    /* Local errors are recovered using a engine reset */
>> +    return PCI_ERS_RESULT_RECOVERED;
>> +}
>> +
>> +/**
>> + * xe_ras_process_errors - Process and contain hardware errors
>> + * @xe: xe device instance
>> + *
>> + * Get error details from system controller and return recovery
>> + * method. Called only from PCI error handling.
>> + *
>> + * Returns: PCI_ERS_RESULT_RECOVERED if recovered or if no recovery 
>> needed,
>> + * PCI_ERS_RESULT_NEED_RESET otherwise.
>> + */
>> +pci_ers_result_t xe_ras_process_errors(struct xe_device *xe)
>> +{
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_sysctrl_mailbox_app_msg_hdr msg_hdr = {0};
>> +    struct xe_ras_get_error_response response;
>> +    u32 req_hdr;
>> +    size_t rlen;
>> +    int ret;
>> +
>> +    if (!xe->info.has_sysctrl)
>> +        return PCI_ERS_RESULT_NEED_RESET;
>> +
>> +    req_hdr = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
>> +          FIELD_PREP(APP_HDR_COMMAND_MASK, 
>> XE_SYSCTRL_CMD_GET_SOC_ERROR);
>> +
>> +    msg_hdr.data = req_hdr;
>> +    command.header = msg_hdr;
>> +    command.data_out = &response;
>> +    command.data_out_len = sizeof(response);
>> +
>> +    do {
>> +        memset(&response, 0, sizeof(response));
>> +        rlen = 0;
>> +
>> +        ret = xe_sysctrl_send_command(xe, &command, &rlen);
>> +        if (ret || !rlen) {
>> +            xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
>> +            goto err;
>> +        }
>> +
>> +        if (rlen != sizeof(response)) {
>> +            xe_err(xe, "[RAS]: Sysctrl response does not match len!! 
>> \n");
>> +            goto err;
>> +        }
>> +
>> +        for (int i = 0; i < response.num_errors; i++) {
>> +            struct xe_ras_error_array arr = response.error_arr[i];
>> +            struct xe_ras_error_class error_class;
>> +            u8 component;
>> +
>> +            error_class = arr.error_class;
>> +            component = error_class.common.component;
>> +
>> +            if (component == XE_RAS_COMPONENT_CORE_COMPUTE) {
>> +                ret = handle_compute_errors(xe, &arr);
>> +                if (ret == PCI_ERS_RESULT_NEED_RESET)
>> +                    goto err;
>> +            }
> 
> Need to handle non-compute errors.

This patch adds the base for the error handling with a single component.
The rest will be added as subsequent patches

Thanks
Riana


> 
> Thanks
> 
> -/Mallesh
> 
> 
>> +        }
>> +
>> +    } while (response.additional_errors);
>> +
>> +    return PCI_ERS_RESULT_RECOVERED;
>> +
>> +err:
>> +    return PCI_ERS_RESULT_NEED_RESET;
>> +}
>> +
>>   #ifdef CONFIG_PCIEAER
>>   static void unmask_and_downgrade_internal_error(struct xe_device *xe)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index 14cb973603e7..28400613c9a9 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -6,8 +6,11 @@
>>   #ifndef _XE_RAS_H_
>>   #define _XE_RAS_H_
>> +#include <linux/pci.h>
>> +
>>   struct xe_device;
>>   void xe_ras_init(struct xe_device *xe);
>> +pci_ers_result_t xe_ras_process_errors(struct xe_device *xe);
>>   #endif

