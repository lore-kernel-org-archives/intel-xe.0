Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCA4CD6E4A
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 12:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B49010FDF6;
	Fri, 29 May 2026 12:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VzT7ecwl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD73110FDF9
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 12:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780056071; x=1811592071;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ts4WuyZabKWCrmwh2UX97kJwSppA4l2/fx3UhMRMmss=;
 b=VzT7ecwlobEFrRUnxu/Gt8OlSqzzdIBi/quevV6DvwmjuuKM7QpNLmU6
 qLp5iCcmZeYR4l8bidUwOQAb+cGL8vywmppjw6QRZFOWhnLFw+ZRZfVs4
 OPPJoE/+tNd70B2D38dJeiMPbLx62J7j3C29kpG2nTNjHNwrPUEfX2sHh
 Pf6N0w7QQKQSVWmNx/kvNde5kgWLP9RmxK/iYICpl174adGavpGYB9jvP
 5gZRvNOfpxN2poV/0KVUJGmPvrrU/DVW3Yr46EfHt0pfvJMZmzGfOZQAl
 rOm6C/w4AQEEAR1KT1k3e53o/Qk5/jUZbJAQEsGKnn/O/CWy8oASq6x97 w==;
X-CSE-ConnectionGUID: stroZ8C/TiGJZEI1UMFUXw==
X-CSE-MsgGUID: VdGBsjJ4RKiL4HykJxYxmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="91216058"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="91216058"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 05:01:11 -0700
X-CSE-ConnectionGUID: bk51SnYhQDSfGimv1jZVPw==
X-CSE-MsgGUID: L1Ct2ggpTtSHRaHpv+aEiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="238639554"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 05:01:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 05:01:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 05:01:09 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 05:01:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jh9MERBYVQ162iFFoKRPAyxm1qCjUsfh1HpUGxCxjViTBnRf5GrsU5Q1OxjiYoASkwZevD8gb4LdW1hAiO4rbeR61JCSqG+OgQfZMEnjr5BEMHkpy6kOlEAr33N4RpF3C3Y16mTUHCn/HkwtbXRGqErC7+yswXLbnhVF5Rh9rPm8JcvHc7zyYwS+jPYglxnxkDCDviA22tJpS0eclgYgKNw1VDD1BEy5iwV/iBUJR6DgoesyDbeZud4OIUt0KHXGNePgPCEXIHTZtPsEx8iUxpe0iqovwTkEVuwrKhJc/VY5+BXIQa/sN0xUf/9zZ8ae+E89oik78VJtsFYSzqOtIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+lVMvqdPepstJKOe8bIi+gdMjMkLuq+WU8eGAAfXjM=;
 b=zIQNDMvT+Ym7CB6KmB++xrVyE22f1kJnyeLe4pfrUGWagQC39z0/dNXe/G4+IfWXXKcQI1whx3Mn89WjKbZDe5EtpFSrfo8cW3xHVu2jPS47jvEviG2EmrM8s59GAJ7wwS11FAQet2VCMJmB+Nik/gL9bPWjDbmJUfUhOlYUB/tYEt42zdOyeHbFGOP+fXMW+otW6AFo5gMWH4e2bIpQE3kedQnU5kf3ztdCYJ5E5oKwR9ioZkbIGpzPvb10dVrrvVasDCfNBXdI1XZmFFL8c8mr/vvT+Enr87KWZpfLRLyMbvSkui4LZCmrl8/6UlZRSqUByBnioavXtA91/dl2YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 12:01:02 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 12:01:02 +0000
Message-ID: <ca4450cb-8bbc-4343-9f87-94918430a93d@intel.com>
Date: Fri, 29 May 2026 17:30:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe: Unify fault injection hooks for CSC, GT reset
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260522120628.538631-2-mallesh.koujalagi@intel.com>
 <49b334e2-a40c-4d6f-95f0-9cf5e959d717@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <49b334e2-a40c-4d6f-95f0-9cf5e959d717@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0239.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::15) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SJ0PR11MB4845:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e2b77d-6962-4ffd-4e28-08debd79f419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|6133799003|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 9Rp6+dghvwy2aoWEQ5MKYWeYfROR2fcZ0rNmHljv3p6/ZbE1TZ0v7ZcpHbIJq/EgHUWO+nBwNBafgqcoMMbgJ5cAeL4YuQzw3pOUmpZmHLwoJ5NQVgbeUWMR7DCUghgIqpqMYl4HUuL5MEx7fLYRFPeAmfCVey7kyZH4tLmoiKF/SWdDExPmo84K3NzuhuV1qUD1dcDQ1BnW5AkkEzEK+obS2SbCdsxGyvw9NeL79VvuTR5wIlURymv81SccI7KAY977cafhfCvgjZsLsQn9pM8LC2nifk7j0kQUWHawJxlv7pkkyOzYpJ7SG+XAJvHa2F3qQ5FfF7XK8otYrUINjFzmuaSmvfgKutmtiALijYZBdQffA0BzS8Agx4qWZgrTOdwqfyS2sa1G2RY7gU/iHiBW2nbvlQmaJ0Bov/tHzDqfEjCaU1iKy8j2FX8OyqjKKA8MfB7TNie0chchdGQcgYYpLFiLSo1iNG++gyV9r9N+emy58VV1sca6ewxRrCbEzfN3wJ3ZgLFbVWNumjZA5AJe5ztyTkkpC3YvQwIax+k2X79/3qyKFJ8o8g3awfee334yeVyWXH2093+EhO8ikGCaAbKjHC07FpHadM04mpqc6d8zd/ZDcpCiLYCV7NYRYkq8fzNtkbhADxOG0EUWLrzwZgSgByzOZqiu2yIgD9UOwW4Vjno/tnpHuLedRiFlmD9uJyULMD5FAlajmvC7Xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjluUkdKZUg4WTV6TUZrRDhMak5qQmRzYmtKOXdWZFg4V0hJeGIyN2RPVDNz?=
 =?utf-8?B?TWkydjJSODQwcUZPYkFRLytldFVnK1RqNlkySlhGaStrL09DRTg2VUJDV3Rw?=
 =?utf-8?B?MzBSV3htYTF4MDVNRSt6b1NtOGZxUURJVXJrMGdNVzZVZFhpOXZqVGlwaVJJ?=
 =?utf-8?B?RkNCVklROEx0eGRYYjRlbVR5RFBJR25KM1VUZDBuUGphajBSVHdTMVptUGQ4?=
 =?utf-8?B?VTd5aDJTSTlEYk5nQmlDYnltQkZZM1VGcmxKTDJNV0dJc3plb0NtSms5Q2VL?=
 =?utf-8?B?d2xwM1VqNmMzYURaSkhjdnV5a2ZmL0dDZnZ0TE5aWFAwRjlVMTZxdm15bVV2?=
 =?utf-8?B?TSs5elRDeXFYQ0xkOUEzdWIyajZhZjZ2RHVjaFZZcDZ1b2JhcmFMaFRMZGMx?=
 =?utf-8?B?QzFwQkVMRU1Id1J2Q0NQdjlnQmRzWm1lL3NKazV5N1BiQVhpdzNYYzNYbTRu?=
 =?utf-8?B?MFlmNHBEbTlVT3BFUWJMRW40VHJTb2s5aUZFMUJvVVJTeXducE90YzNjYTgv?=
 =?utf-8?B?dnBRa1oxRzFJNmRUanJGNUFieFhPMDIzN2hEeUowckkydkhYalRpVTNTZEVT?=
 =?utf-8?B?SCsyaHZ3VkxqcmUwcVVUcTM4YUpWWWw2TFFvT2tibFo2SFR0bkN6TUpzM1N2?=
 =?utf-8?B?b1FKU2Vjd0ZjOEUveXMvSFdRdmVqcWlXM0p4cm83NzFoVXRhR2l0M283TnFN?=
 =?utf-8?B?c3FpZk5JUHFDWndtc24zN3ZuQzEvSEk2Ly83TVQxWVBVY3RhUWxZbVluMjFP?=
 =?utf-8?B?cVAxYU15NlhYekVTbzhyN2NhMGNNWERNYVJ3Uk9XQUhxd1BxSWphM1NseUE3?=
 =?utf-8?B?RU13NUdINFppYkdHNVhvWDJ1OXFuWVlWSit0dldKcGVjNm1xU0t5YmdCUlUr?=
 =?utf-8?B?cjRxRzVQVmdtS085eUVkZnFqLzhwbnNDK0pYamhja1duZ1MrRzZ0K2UxSC9C?=
 =?utf-8?B?dzR3Tm5ndlVLc0V5R29PYjR1dU9qRzNzUkpaY0tBaVdxS3VGREVGMklKZW4z?=
 =?utf-8?B?M0xSWUk5Vm0xSmhvcEh1NHl6REo0OGttSmNPNzBSZEdqTE9kY3FCNWVreml5?=
 =?utf-8?B?N3NzSDVoNDZ4Z3cxNkpVOWp0c2kwdm9MYUhYcU9YMG5FLzZUcWNvUE1wYWF1?=
 =?utf-8?B?VU1xcWQ3cHhuems3djZBSStFUzVtSWpiRnYzeVVGSWx6d2tRdVNiUXNrV0E3?=
 =?utf-8?B?RzJqdU13SmErQjlMN2ZIOVZsSXkwZWhGSXJDdWozVEJ4SzZIS3g3OEJ2V3My?=
 =?utf-8?B?aFBEQmI5VkRuSS9XQ01BbWM2dUI3NmZIVEtvdUo0VkZvY2ZjSTRJWld6cjQ1?=
 =?utf-8?B?bUFubzFYVVg5V2xFREJITm16SWhSQXdDS2RpMlpXczJHOEpRUzAwdzF3WkZ5?=
 =?utf-8?B?N2o2SnN0QlNLclAvTnZlMFBXTGhMRVE3dFZVVG0wZHZCYWltdTU2ZnEwS3Av?=
 =?utf-8?B?S0Jlc29BVGlUKzBHNlV4Yng3dVBjeVFxd1Z1OEZkL2dFSjZMM04xT25iMzFq?=
 =?utf-8?B?STMrVlhjS2FXb0l5V1VINk9EWEJXK2J2bDJEOUdhN0xMSTJjSUFHZFhwcSts?=
 =?utf-8?B?UVE4THdTS1lHd2gvM3U1NnkvTGVVZzFxeEZLZXhEL1ZWOS9sbVZKL2xpWHZ4?=
 =?utf-8?B?WmF6WGY0SHRXa0EyblFEQUlKSmZudEQ1WjQ4SmJMbFNBUC9rd0M0MTZPcllZ?=
 =?utf-8?B?Vko4SlFCa1dZR3krZkZjNmVjRmc3dE9rdW1QTnc0NnBQcWtqNTlVQnZ5RWtq?=
 =?utf-8?B?UU9CMFJEd0VEaHE1NEJWQ0pFRnJYdjNoMjUzKzh3WWMwcEF3QnAxUXc0YjNx?=
 =?utf-8?B?enhhZlhISEpnYlEzL3UyVlJyZlNRQ2cyWGNZNm1RUE8xOUpVMmp0ZVlsd0NW?=
 =?utf-8?B?eStyL0RvNUR5cDdqUTJVc1hOTXNiMFNWcFQ2eUNlYjRoU2s0QnlCTGtWSlRY?=
 =?utf-8?B?SzF4dng2NUk1bFNoQVR2OFM3cEpXdmFtZU83NTJPbHpwNkNVczg5L3N6Sk1B?=
 =?utf-8?B?aFlodUR3MUNoL1RIV1dKRGlsVWRQNWlaaFdiVC8wcUR6VFMyazQybjNJT0d1?=
 =?utf-8?B?TWhqZGU2cHI4YXpRaVc1QkRiYlBESllrRDJQdVBkYTBFTFFpbkJpYVl1NUQz?=
 =?utf-8?B?WUtGS0dVSEJXN2pjVnpRYm8xdkVqUGxTY2I2ejFLdW9DczdHckxHVzRqZ2FS?=
 =?utf-8?B?SjcraGRrL3ZqZTgvR2tSVzBKKzVlVjg0U3hUdXBsNjdxcFR6MVQyRVBVNCsy?=
 =?utf-8?B?bXdDVmN3SXRjWjVTQTEyc0h2NHplSTJrYTBhWERWRkdjaytpOCtVWGE2RUFQ?=
 =?utf-8?B?QXBCdm5BT0xCQXhFb1o5OVk2clpXUzlDenVyM3JxNFU3cnFLeHBOaS8vTmpp?=
 =?utf-8?Q?z4A6v0iORrxvLJOI=3D?=
X-Exchange-RoutingPolicyChecked: asU81kzkFIOV47cIM6fyR43Hrpg4uK2mPeaOXNZOHhuFvVmXU2KPP3Pq8RqrECeVMkEXxQUhtM70SCI6avyFx1iS70luVTgLPDBhS53+A03MZK/FXm/YXDDIwcK6Gp2xWpjxaUJKtBKqRInZdFlL+e8q5dl4psN344YCk0Hs45d63wMe+n22vAjXqMSY3bB7PFZzRnmV01KQLDOcBuqncCyN8/DOQoLvi/0wKaKd5wIssIjf4FUI4Slqo5yluCsdtD7uYuetq74ucTvGFXcHPl2rf5eqkqhl3X2N8UOgt9U328PpFodFwq3E7xYun48GKM1+xvjPxXoYu+Z1NHQBYg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e2b77d-6962-4ffd-4e28-08debd79f419
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 12:01:02.1666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhTB2EExtQWWUzF3KGzIuqL6k2RuIpea+nlF537t0RwDpF5ky81T1XeouD8hGFY7E+ltpxICeJkgNfBxdpX8ehk5TBoX0O94xVAyb5tcmg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4845
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

On 29-05-2026 01:22 pm, Tauro, Riana wrote:
>
> On 5/22/2026 5:36 PM, Mallesh Koujalagi wrote:
>> The fault injection code was scattered: the GT reset
>> hook lived in xe_gt.h as an inline function with its own global
>> variable, the CSC hook had a separate global in xe_hw_error.c with
>> an extern declaration, and each was individually registered in
>> xe_debugfs.c. Adding a new error type meant editing many files and
>> copy-pasting the same boilerplate.
>
>
> Since Xe kmd supports other fault injection mechanisms such as 
> fail_function which injects error with ALLOW_ERROR_INJECTION.
> This patch does not cover all fault injection hooks.
>
> If we are only picking debugfs hooks. This is not really unifying 
> fault injection.
> Can you please elaborate why this is needed?
>
> Thanks
> Riana
>
This patch solves a different problem than fail_function and 
ALLOW_ERROR_INJECTION.
Although both are used for fault injection, their purpose is different.

ALLOW_ERROR_INJECTION is mainly for generic function-level testing.
It injects failures at the start of a function and skips normal 
execution completely.
Examples include xe_device_create(), xe_pm_init_early(), and xe_pt_create().

The debugfs mechanism in this patch is meant for changing specific 
runtime behavior.
It allows testing of particular scenarios, such as simulating CSC errors 
or forcing GT reset failures.

The main issue before this patch was that similar debugfs fault 
injection code existed in multiple places, with repeated copy-paste 
implementations.
This patch improves that by:

a. Reducing duplicate code,
b. Making new fault injections easier to add,
c. Providing consistent behavior,
d. Supporting platform filtering,
e. Making the code cleaner and easier to maintain.

In short, this patch unifies the debugfs-based fault injection 
infrastructure for better maintainability and flexibility.
It does not replace or duplicate ALLOW_ERROR_INJECTION; both mechanisms 
serve different testing purposes and can coexist.

Thanks

-/Mallesh

>>
>> Create a single, centralized fault injection module
>> (xe_fault_inject.c/h) that manages all fault types through
>> one table. Each type is just an entry in an enum and a one-line
>> row in a descriptor array -- no more scattered globals,
>> externs, or per-type inline helpers.
>>
>> Debugfs interface (under /sys/kernel/debug/dri/0/):
>>   - fail_gt_reset         - GT reset failure
>>   - inject_csc_hw_error   - CSC firmware error
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>> v2:
>> - Add multiple platform support. (Vinay)
>> - Handle VF properly.
>> - Rename to XE_FAULT_GT_RESET/XE_FAULT_CSC_HW_ERROR and
>>    create xe_fault_inject_types.h file including those name.
>>
>> v3:
>> - Solved patch apply issue on tip.
>>
>> v4:
>> - Add proper header file.
>>
>> v5:
>> - Properly refer FAULT_ATTR_INITIALIZER. (Vinay)
>> - Change xe_fault_inject_descs to xe_fault_inject_entry.
>> - Change 2025 to 2026.
>>
>> v6:
>> - Change return comments of xe_fault_inject(). (Riana)
>> - Remove full description of xe_fault_inject_debugfs_register().
>> ---
>>   drivers/gpu/drm/xe/Makefile                |  2 +
>>   drivers/gpu/drm/xe/xe_debugfs.c            |  9 +---
>>   drivers/gpu/drm/xe/xe_fault_inject.c       | 62 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_fault_inject.h       | 31 +++++++++++
>>   drivers/gpu/drm/xe/xe_fault_inject_types.h | 21 ++++++++
>>   drivers/gpu/drm/xe/xe_gt.c                 |  5 +-
>>   drivers/gpu/drm/xe/xe_gt.h                 |  8 ---
>>   drivers/gpu/drm/xe/xe_hw_error.c           | 11 +---
>>   8 files changed, 123 insertions(+), 26 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 09661f079d03..d4acb8e9c3b7 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -361,6 +361,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>>         xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
>>   +    xe-$(CONFIG_FAULT_INJECTION) += xe_fault_inject.o
>> +
>>       xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>           i915-display/intel_display_debugfs.o \
>>           i915-display/intel_display_debugfs_params.o \
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c 
>> b/drivers/gpu/drm/xe/xe_debugfs.c
>> index 22b471303984..8402189b24ef 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -6,7 +6,6 @@
>>   #include "xe_debugfs.h"
>>     #include <linux/debugfs.h>
>> -#include <linux/fault-inject.h>
>>   #include <linux/string_helpers.h>
>>     #include <drm/drm_debugfs.h>
>> @@ -14,6 +13,7 @@
>>   #include "regs/xe_pmt.h"
>>   #include "xe_bo.h"
>>   #include "xe_device.h"
>> +#include "xe_fault_inject.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_debugfs.h"
>> @@ -38,9 +38,6 @@
>>   #include "xe_vm.h"
>>   #endif
>>   -DECLARE_FAULT_ATTR(gt_reset_failure);
>> -DECLARE_FAULT_ATTR(inject_csc_hw_error);
>> -
>>   static void read_residency_counter(struct xe_device *xe, struct 
>> xe_mmio *mmio,
>>                      u32 offset, const char *name, struct drm_printer 
>> *p)
>>   {
>> @@ -563,8 +560,6 @@ void xe_debugfs_register(struct xe_device *xe)
>>           drm_debugfs_create_files(debugfs_residencies,
>>                        ARRAY_SIZE(debugfs_residencies),
>>                        root, minor);
>> -        fault_create_debugfs_attr("inject_csc_hw_error", root,
>> -                      &inject_csc_hw_error);
>>       }
>>         debugfs_create_file("forcewake_all", 0400, root, xe,
>> @@ -610,7 +605,7 @@ void xe_debugfs_register(struct xe_device *xe)
>>         xe_psmi_debugfs_register(xe);
>>   -    fault_create_debugfs_attr("fail_gt_reset", root, 
>> &gt_reset_failure);
>> +    xe_fault_inject_debugfs_register(xe, root);
>>         if (IS_SRIOV_PF(xe))
>>           xe_sriov_pf_debugfs_register(xe, root);
>> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.c 
>> b/drivers/gpu/drm/xe/xe_fault_inject.c
>> new file mode 100644
>> index 000000000000..096e1949624d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_fault_inject.c
>> @@ -0,0 +1,62 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <linux/bits.h>
>> +#include <linux/fault-inject.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_fault_inject.h"
>> +#include "xe_platform_types.h"
>> +#include "xe_sriov.h"
>> +
>> +static struct {
>> +    const char *name;
>> +    u32 platforms;
>> +    bool skip_on_vf;
>> +    struct fault_attr attr;
>> +} xe_fault_inject_entry[XE_FAULT_MAX] = {
>> +    [XE_FAULT_GT_RESET]    = { .name = "fail_gt_reset",
>> +                    .attr = FAULT_ATTR_INITIALIZER },
>> +    [XE_FAULT_CSC_HW_ERROR]    = { .name = "inject_csc_hw_error",
>> +                    .platforms = BIT(XE_BATTLEMAGE),
>> +                    .skip_on_vf = true,
>> +                    .attr = FAULT_ATTR_INITIALIZER },
>> +};
>> +
>> +/**
>> + * xe_fault_inject - Check if a fault should be injected
>> + * @type: fault injection type to check
>> + *
>> + * Return: true if fault injection is triggered, false otherwise.
>> + */
>> +bool xe_fault_inject(enum xe_fault_type type)
>> +{
>> +    if (type >= XE_FAULT_MAX)
>> +        return false;
>> +
>> +    return should_fail(&xe_fault_inject_entry[type].attr, 1);
>> +}
>> +
>> +/**
>> + * xe_fault_inject_debugfs_register - Register fault injection 
>> debugfs entries
>> + * @xe: xe device instance
>> + * @root: debugfs root directory
>> + */
>> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct 
>> dentry *root)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < XE_FAULT_MAX; i++) {
>> +        if (IS_SRIOV_VF(xe) && xe_fault_inject_entry[i].skip_on_vf)
>> +            continue;
>> +
>> +        if (xe_fault_inject_entry[i].platforms &&
>> +            !(xe_fault_inject_entry[i].platforms & 
>> BIT(xe->info.platform)))
>> +            continue;
>> +
>> + fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
>> +                      &xe_fault_inject_entry[i].attr);
>> +    }
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.h 
>> b/drivers/gpu/drm/xe/xe_fault_inject.h
>> new file mode 100644
>> index 000000000000..91883ffb5f4b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_fault_inject.h
>> @@ -0,0 +1,31 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_FAULT_INJECT_H_
>> +#define _XE_FAULT_INJECT_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#include "xe_fault_inject_types.h"
>> +
>> +struct xe_device;
>> +struct dentry;
>> +
>> +#if IS_ENABLED(CONFIG_DEBUG_FS) && IS_ENABLED(CONFIG_FAULT_INJECTION)
>> +bool xe_fault_inject(enum xe_fault_type type);
>> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct 
>> dentry *root);
>> +#else
>> +static inline bool xe_fault_inject(enum xe_fault_type type)
>> +{
>> +    return false;
>> +}
>> +
>> +static inline void xe_fault_inject_debugfs_register(struct xe_device 
>> *xe,
>> +                            struct dentry *root)
>> +{
>> +}
>> +#endif
>> +
>> +#endif /* _XE_FAULT_INJECT_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_fault_inject_types.h 
>> b/drivers/gpu/drm/xe/xe_fault_inject_types.h
>> new file mode 100644
>> index 000000000000..d5402b5a3fd6
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_fault_inject_types.h
>> @@ -0,0 +1,21 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_FAULT_INJECT_TYPES_H_
>> +#define _XE_FAULT_INJECT_TYPES_H_
>> +
>> +/**
>> + * enum xe_fault_type - Fault injection types
>> + * @XE_FAULT_GT_RESET: GT reset failure injection
>> + * @XE_FAULT_CSC_HW_ERROR: CSC hardware error injection
>> + * @XE_FAULT_MAX: Number of fault injection types
>> + */
>> +enum xe_fault_type {
>> +    XE_FAULT_GT_RESET,
>> +    XE_FAULT_CSC_HW_ERROR,
>> +    XE_FAULT_MAX
>> +};
>> +
>> +#endif /* _XE_FAULT_INJECT_TYPES_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 783eb6d631b5..242683cd5906 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -25,6 +25,7 @@
>>   #include "xe_eu_stall.h"
>>   #include "xe_exec_queue.h"
>>   #include "xe_execlist.h"
>> +#include "xe_fault_inject.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_ggtt.h"
>>   #include "xe_gsc.h"
>> @@ -923,7 +924,7 @@ static void gt_reset_worker(struct work_struct *w)
>>         xe_gt_info(gt, "reset started\n");
>>   -    if (xe_fault_inject_gt_reset()) {
>> +    if (xe_fault_inject(XE_FAULT_GT_RESET)) {
>>           err = -ECANCELED;
>>           goto err_fail;
>>       }
>> @@ -980,7 +981,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>>       xe_gt_info(gt, "trying reset from %ps\n", 
>> __builtin_return_address(0));
>>         /* Don't do a reset while one is already in flight */
>> -    if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>> +    if (!xe_fault_inject(XE_FAULT_GT_RESET) && 
>> xe_uc_reset_prepare(&gt->uc))
>>           return;
>>         xe_gt_info(gt, "reset queued\n");
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index 4150aa594f05..f8e3ca63aabb 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -6,8 +6,6 @@
>>   #ifndef _XE_GT_H_
>>   #define _XE_GT_H_
>>   -#include <linux/fault-inject.h>
>> -
>>   #include <drm/drm_util.h>
>>     #include "xe_device.h"
>> @@ -38,12 +36,6 @@
>>       xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>>   })
>>   -extern struct fault_attr gt_reset_failure;
>> -static inline bool xe_fault_inject_gt_reset(void)
>> -{
>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>> should_fail(&gt_reset_failure, 1);
>> -}
>> -
>>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>>   int xe_gt_init_early(struct xe_gt *gt);
>>   int xe_gt_init(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c 
>> b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 5135e8e4093f..192e68e847a5 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -4,7 +4,6 @@
>>    */
>>     #include <linux/bitmap.h>
>> -#include <linux/fault-inject.h>
>>     #include "regs/xe_gsc_regs.h"
>>   #include "regs/xe_hw_error_regs.h"
>> @@ -12,6 +11,7 @@
>>     #include "xe_device.h"
>>   #include "xe_drm_ras.h"
>> +#include "xe_fault_inject.h"
>>   #include "xe_hw_error.h"
>>   #include "xe_mmio.h"
>>   #include "xe_survivability_mode.h"
>> @@ -25,8 +25,6 @@
>>                            (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
>>                            (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
>>   -extern struct fault_attr inject_csc_hw_error;
>> -
>>   static const char * const error_severity[] = 
>> DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>>     static const char * const hec_uncorrected_fw_errors[] = {
>> @@ -167,11 +165,6 @@ 
>> static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == 
>> XE_RAS_REG_SIZE);
>>                            pvc_master_local_fatal_err_reg : \
>>                            pvc_master_local_nonfatal_err_reg)
>>   -static bool fault_inject_csc_hw_error(void)
>> -{
>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>> should_fail(&inject_csc_hw_error, 1);
>> -}
>> -
>>   static void csc_hw_error_work(struct work_struct *work)
>>   {
>>       struct xe_tile *tile = container_of(work, typeof(*tile), 
>> csc_hw_error_work);
>> @@ -507,7 +500,7 @@ void xe_hw_error_irq_handler(struct xe_tile 
>> *tile, const u32 master_ctl)
>>   {
>>       enum hardware_error hw_err;
>>   -    if (fault_inject_csc_hw_error())
>> +    if (xe_fault_inject(XE_FAULT_CSC_HW_ERROR))
>>           schedule_work(&tile->csc_hw_error_work);
>>         for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
