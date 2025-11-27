Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D729D111A8
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 16:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E9510E7E0;
	Thu, 27 Nov 2025 16:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RbAJvKzE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997E910E7E0
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 16:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764260286; x=1795796286;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vf4iSAd8WsvdKgZMhCoFcp2VLT4PZVbkbImAIv8yjBM=;
 b=RbAJvKzE8qnP1BMMjEJ8rRE1jRMuOF6W7ZSj0rYJ6U5k8nXMczrmzEFY
 FTn5ydKwwYgx8h/LbqptjDxOoV09A/zeLsterwQSvif+mpiAhup/Oxuzv
 p1dSW82tOQw1hiVhWTQQ5jWXEPkHghvGefTG1MnYb1YppS67W/UlYDrz6
 +QEO/65Qz+jSkMslH3Sx/G4v0L+e2qwjDFJz0GMcV9yqUb0mv4SIzQeRq
 iidbuAnbS8hW1doIuEkHLoAKj1dBsnvNv74l2k2ZlKMxMFWLAS8emTrEP
 5CvCK++5x9fJRtNaF3YhXc4UO5HpjdhVS1tABWd0izjGXZQU2gcYK6xrq w==;
X-CSE-ConnectionGUID: OgcTR3oWQMmz+j7K3OFLTg==
X-CSE-MsgGUID: aHuPsoEzRlOo7AmcIp51Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76633237"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="76633237"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 08:18:05 -0800
X-CSE-ConnectionGUID: 2JUzIwaWQQiGBJtr6HC37Q==
X-CSE-MsgGUID: 4vlEtlvqThG2wTdXQl8Xvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="193282841"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 08:18:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 08:18:04 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 08:18:04 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 08:18:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6TG2CEoWQYyNBMskBMz1LgfzSl0wUtLKn4btMNuMtNxZba88W7nI8yiHZb8RzmWLD8+G1WAPxnETqua8hkXsz2wNIVWm6ANStgutMhjiNlAekx0SQiQHoMB94br4sv4vNpljGATeuGVH9AE2a15yEBBM9ZvRHcHHmvxJCMe9VyGhh12TYTcFSZ2xXEXYY3h/VpdFT8xj4kM4fQUyMgVD52N00r0DeD8fX0N+VG1RFkx1/gA7cir/Tg0dWZy+SkR9ag83t35zEqRO7CwXuGxHPxvML9JSTly88mDenSW4X29dY2Q/wzVvts69Yf4nOiPYhepp0tY5pMvDuGb2aNLtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgWAZGXNSjwA2ksqoVYKF4bZKqXbSDa86IFDT//XXS0=;
 b=qoNKA1gTCOaseF0M/sDHq0HJ/vBV0aYBhAM0BD0Q5KnRvAjt8RUICRzjxmmAggoXPMrh2t4DE1WwPeyKvi5vi3mxETK5Q89oe7Ix1zBmyk6JYtyXGYL22VNel219D+O7ESH0i5pQayq7iD7tu5bFpRQgP2DrxLsYkKJV9VxtfWCLTAtGcsYCreAAEyDzM6kavcloD4quBxZv1tO9skhoghx08K3NrdQUQ7RIeV029JhgfgAZmHrgzRzgtXhVglLPcbp+NHRpylLaP/+qVvSV7abG+0LkkpVPJBRXC4VbPjvCNCHoZAv61dXWEmbJtRwpYc2r2RBH2HL+uMy/itNeHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ1PR11MB6300.namprd11.prod.outlook.com (2603:10b6:a03:455::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Thu, 27 Nov
 2025 16:18:01 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 16:18:01 +0000
Message-ID: <1dc47e29-cc98-40a5-b0bd-d47eaccbc75d@intel.com>
Date: Thu, 27 Nov 2025 17:17:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] drm/xe/vf: Introduce RESFIX start marker support
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251124160719.29812-5-satyanarayana.k.v.p@intel.com>
 <20251124160719.29812-7-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251124160719.29812-7-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0202.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ1PR11MB6300:EE_
X-MS-Office365-Filtering-Correlation-Id: aeb13b32-7c0b-474e-4050-08de2dd0891c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHdVUjk1MlhhUzB4eWVVTDd5aW93dXluK0EvN3NHRGVzQlQ4bFpkekY4UzBW?=
 =?utf-8?B?OWNYUjJ5N2RhVW9ibWVhaTVjVk4ydXA3WFdnVlZZRVJ1RlRIbnhjaGlGWXNG?=
 =?utf-8?B?WHljQ2JtdWFVOGxqZkYwMmdycldDZE5BVG9HKzFHRVphRVZNQWFMOUVaR3ZP?=
 =?utf-8?B?cVA5bEQzUmdvN05rOEcwdldHVFhLbUNuMjZ6UGtoenJjcXk2T3VMUlRyQUhl?=
 =?utf-8?B?eDcweFdhTVdzakh1TzJTVnBYUHlBSzFoSVFMa0Z6TFlYeXZtcE5yL2NYZ2M0?=
 =?utf-8?B?bXN0QnFZS29JSlZyZm44WTdIQmNMZWFiZWRIemRCUndYRnBsbERIN3hjODN3?=
 =?utf-8?B?ZSswRGZ1NmxnNlFZNWtXcHR3Vk5XRDB3UmFIbndGTlN0QmFKNTBoKzlIK0FF?=
 =?utf-8?B?QnhxL3lQdUg0Sm5DalcvZVhuUWM0SUN2UGRSdHdFOW1KakZqb0lYU0Y4UXBu?=
 =?utf-8?B?ekVpeWFRNGZTR1BobTJ4ekVQSVBEcE9EMng1RVh4STJnMEJIV0xtUzVkSkJx?=
 =?utf-8?B?S3pzZjc2R3daMGpUemNVNmNBd2Q1ZHF3MGVaM0txUzNNRVEyeVBSVWlpai9W?=
 =?utf-8?B?RDVna1hyTm1ZNlBGQ2MvSzRBWmZjMEcwRUdDZDE5WUkxNjR6cytQNmRtSWc2?=
 =?utf-8?B?L2U0REV3RDdtM0s1cVpBZi9SZ25Ud3dvQWZMMDNUN0VtNGl4ZDN2N2JOVTRL?=
 =?utf-8?B?d241TnA2V3hCNmx2TnhBN290WVJBb2lVRm8yYm9IWHZQWjhFVENVWjJwdVBl?=
 =?utf-8?B?UWtETjJMRVFia01KdXdJeTEwUlV6Y1ZOY1hWa2RMSHBRVDZONmNwM2RnOXV0?=
 =?utf-8?B?Y01VUENhZ3p6M2prT2RZaWRPOFF0QW9NcXkyQzllQkNlY1M4cXkwNm5yRjU3?=
 =?utf-8?B?djlrT2lBa3hKbTBBWmFyc2Z6MlZqcHRrSUpvR2I1YU1JakllOEhNbVFTQW8y?=
 =?utf-8?B?UWxVbkVpQkFoQUdXbWpoK1BLbDhYOGVJR1lJVnhDWlRBL0F0amIzSi8xYVFm?=
 =?utf-8?B?RjNURzdjeFVyVG1tL29adTJHV0tXUXJ4M09hOE85alRMcTR6T1RlMHlVSVJ5?=
 =?utf-8?B?Z0taZmRSUlZ1b293YS83WW50V0FVVTNRakhNS1FhUC9nNmhGbldLTXpqeU9M?=
 =?utf-8?B?NjVkT1FpK2drdVFtM0VFc1JwUDJkNDBCOG5pNUFEK3l2Wi9MUXF3QW5YNnlr?=
 =?utf-8?B?aVhOdUJtQ0wycnR5SkkxVzZxSmlaclIzM0NFVWFESEl4anlKa2s3NVdyemxx?=
 =?utf-8?B?dGxZakpXbEpMTWdtczVnK2tIUzNqRXJGRXdGeWJTazdyMVhFQUJ6TW5JcXN0?=
 =?utf-8?B?RFpwSXl5YnA2VjV2eVR3UmVQTldneUordkFPL2FFWUtmY0lDV2Fublh0Titp?=
 =?utf-8?B?OUJKZEFXNnFlb2ZMdzVFbkp2U29meU1ZK000MytNVGRsdFR1MkF1dCt6bms3?=
 =?utf-8?B?SVpXaTM4UmxVbFNKS3pjMGNpbXBHTUc0REZ3bVdNNmpaK0hpR0xNemszWVpm?=
 =?utf-8?B?RHVyWXh3VUVlRmh5cG9QaldaMkc3ZytTa0dIbjBtMm5kU2ZwdGszSVhRbDE4?=
 =?utf-8?B?V2tsSXdGVnY1WnA4TFZ0a0lDalNvajcwazN4ZTZOOGVGNnpmS3N4ZEFtd0dY?=
 =?utf-8?B?cmpMWGcxR2h3RU82OS9QamkzamFkL0twcjFQcWN6UGlvaWE2OCtqWmpkbmtN?=
 =?utf-8?B?eWtPN0tZR3hQWW00QWEyR29BMmFMSHQ1dlBHR2xZYnBpWFN3QnovTkU0eVNr?=
 =?utf-8?B?bXIwWXA1bC9PM3JveUMrY1NraHAvUm1WTzBpTEVvZklwUDlpMlpQcnlVWTVK?=
 =?utf-8?B?NndzVUl5Tzc5b01xQ2ZSSXMvRzB6ZWFNVVlSWlcwTDlKaFpQSEhsV044UHZP?=
 =?utf-8?B?N1h5eVFDUGNVQzBHYmoxQjVXMGZNV1BLUVJMUFN0YktFbkQxWEpmM0ZYSDJZ?=
 =?utf-8?Q?3rfBKynKFqPqVKZq9AoEKhg0SUCcuF2F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MllOeGNvbjIzcnJnSFprWWJXWUwyaUtFb2FsQy9XVFpoSVYvNmdVUUsvRnBF?=
 =?utf-8?B?K1dQa0E3N2Q5SjVoTnA5THM4TThJbXJ1eGZGOFhucUw5MzFCL3pwbkRWWUlB?=
 =?utf-8?B?UjFIZDVac09pTzNCYUtWWWxndEZWWTFWQ0U4MEZNa2h5dGlPZ2JNTVRFQjNi?=
 =?utf-8?B?YUZJSE9QU1VQQlpDNGVyOTBzdXJhTmZEeEFYVVpzS0Z1QkdIUUxGVnpVS3VY?=
 =?utf-8?B?NFVzYXRmcXNmL3hFYkFuQWpqelJ4QzdxRmgybS9nQTVWbUVTL2ZQc3c3Wms2?=
 =?utf-8?B?dGFTbmpwTjBZYVlYWHpTOUt2Smx2Z0lwZ1grNXNaVG5nZzJxY0JJNDJZQUJK?=
 =?utf-8?B?L0ZBWnV6MXZkVlcvc2FSUlRSdDFUSUEwMGhGZ2dPa081NDZUemx3UlFhSUpX?=
 =?utf-8?B?TS9qTmM0L1FPWExoekRnckNsTVRNMWpHN1A0dzNaak1ocnkrQ3F6VHhCZXBp?=
 =?utf-8?B?V1VDL0dIK0E2VDkrcGhGWkM4K0ZnMGhMSVQ1a3VadnhUTm9vRjl1cjdVUWFO?=
 =?utf-8?B?ZTJVVHNQdG9ldnlEU1RCRjhIVmlWSEV5ZjY2NzVMSjE0TXlRYUtua0dDL0gz?=
 =?utf-8?B?U2ppT2luUldFOEd0WS9uSVhVS2R6TTd3YWhHYmNTNTFEa0Z6ZXlHOEZNaEM5?=
 =?utf-8?B?TllYbDJLLzVDalNZaHdkbEN6VG1veHdSTmk5SWFZeDNLQitGNVVhejBSQ2lj?=
 =?utf-8?B?VVFITzBEMFNyY2padDFVRGxPRGNhQTZUWkVGdEFuQjJzSktqanFhMGFIcTBT?=
 =?utf-8?B?YndTSzkvYUxHUWNQNlRrc0U3YnZDTnplSXBZZ0FZZUtpWU50OVdiMEtscWl6?=
 =?utf-8?B?dFNDaTVkb1lTaE85TG9HT3JHRms2ZHlwVnR6MlgwVTdjQU10VW5FRTBJRlc1?=
 =?utf-8?B?aDl0L1lab2EwdjVHZmZxWmYxdkNicUFtMGVwVEpuYzN6Y0JpUWI1QWVxclMx?=
 =?utf-8?B?QjFSa2FVSUhQRmgvc1FRL3pQLzR5T2NybGNNajBGWGVyQjlwQTZlMDBNTVJp?=
 =?utf-8?B?MDkvZlgzb1NzeTlMMTRTVXY4ZFdGb0hDZUlDSG1yMUZoajBWcUkvczBVZ29o?=
 =?utf-8?B?dzB2ZnJEYkgrcmpXNm1sbXBvMVZBZGxkaXRMWUdYdndYS2RRajZSckhFdjBW?=
 =?utf-8?B?eUEvS1g1d2VuUDMzU1F5bUdiWEt3V2hGRjNJei9BeXM3Z2dzV1lYYTBUL29m?=
 =?utf-8?B?QVp2ZVUrNERKeDlNSEVaekIzK1QyV1Z2TFhmVlRGZEdZdXpqWWgyWmljM3dC?=
 =?utf-8?B?V09Td2dML3Aram0walpmejRxbGFycXpaMFdETjlIMFRxLzJEVk9OUlhNMkJ2?=
 =?utf-8?B?NDIvakJ4U0JHR1I4ZEhQd04wYTVzZDRmTDlFRzhxanU3dnRZV0pidTRoZ1c2?=
 =?utf-8?B?Z28rRWtlMThxMWxUMjFWb0tCQ3o5czNYMFdTVjFidDFhZE92UW1aZGpUczND?=
 =?utf-8?B?bExXWSt5RjJGbzJ2NUc4SldSVjZhZGFEeFRoRTd2M3RxMUpSV2VzSEJ2ZktB?=
 =?utf-8?B?bUt2bldjY2pJdE1SRHhVUlA1MUF6ZGRIQ0oxU1k0cGg0QU90ejRCTU0wVCty?=
 =?utf-8?B?cjUydmdaTGhFdm8ySFI3b1Z1QVFpL3A5SGUrcFpGZFdNRWNydEZUN0drTExv?=
 =?utf-8?B?MzJCclVXS2dES1U4SzB1b0ludlZnYlpVNDBaTmZWb3RYcW9UVlpySG13MUVU?=
 =?utf-8?B?bmJ2aWtTWFhobUlYOGxxWTZUV2o0dmJaUFEyNkxtd28xZjJENmVVbFltR1Vt?=
 =?utf-8?B?NmJhZEkxNlZmZTZVV0lrTmZRTk1lUytSZVVvbjI4cXNhblFlREdERFd1dnBV?=
 =?utf-8?B?NXJ1TXFBc2hwT3pxajdGRXUyMjdkVlV4ZHBEY0ZmMStSZWxDZUs1YWt1Y0xH?=
 =?utf-8?B?bHp6RWhMRVNoRXFPUy9TdnpTaTVmNTZpZ0RJRmNhSUthczlIWEpJM1FIRXdU?=
 =?utf-8?B?SU8vQUozd3VuK0l6dUVXcy9FcklPUUxGUVBHSk1HSjdCcS9abGFSV29DbDRV?=
 =?utf-8?B?ZjNqUUhVWXd3eTN0b0ZrOFF6UHE2TkEvaEEwcnFWaERxQ3lXd3l6Q2NIdk9r?=
 =?utf-8?B?UkpvOUtUd255cUdBSFI0TXVqVVI0a1JGc0ducFMwank1UzBWOU5ZenVDVGdw?=
 =?utf-8?B?NytFNVljVW1jZ082cEVUcElXNlUvOWoxS3JPcUZScmFCcmpFd0dXSHcvNkVn?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb13b32-7c0b-474e-4050-08de2dd0891c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 16:18:01.1938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPc+2TLW6RfiEsAYOMI4j4alZCDxF2dZweuSieIoOPES48E2j2bfsyAwFUFyaowIUsDrlODiU6D6t2wnUYED9EgAZ0H/ROb0jgHaNEvLsik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6300
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



On 11/24/2025 5:07 PM, Satyanarayana K V P wrote:
> In scenarios involving double migration, the VF KMD may encounter
> situations where it is instructed to re-migrate before having the
> opportunity to send RESFIX_DONE for the initial migration. This can occur
> when the fix-up for the prior migration is still underway, but the VF KMD
> is migrated again.
> 
> Consequently, this may lead to the possibility of sending two migration
> notifications (i.e., pending fix-up for the first migration and a second
> notification for the new migration). Upon receiving the first RES_FIX
> notification, the GuC will resume VF submission on the GPU, potentially
> resulting in undefined behavior, such as system hangs or crashes.
> 
> To avoid this, post migration, a marker is sent to the GUC prior to the
> start of resource fixups to indicate start of resource fixups. The same
> marker is sent along with RESFIX_DONE notification so that GUC can avoid
> submitting jobs to HW in case of double migration.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V5 -> V6:
> - Fixed review comments (Michal W).
> - Updated resfix_done and res_fix_start function names.
> - Handled XE_GUC_RESPONSE_VF_MIGRATED error case received from GuC.
> - Remove skip_resfix error when another migration is in queue.
> 
> V4 -> V5:
> - Fixed review comments (Michal W).
> - Fixed minor debug log levels and documentation part.
> - Moved complete marker logic to vf_post_migration_resfix_start_marker()
> 
> V3 -> V4:
> - Updated RESFIX_DONE action name and documenation part. (Michal W)
> - Enable resfxi_start marked by default as sav/restore is gated on
> Guc version 70.54.0
> 
> V2 -> V3:
> - Fixed review comments (Michal W).
> - Updated commit message.
> - Fixed CI.BAT issues.
> - Added helper function to assert on unsupported GUC versions.
> - Updated RESFIX_DONE action name and documenation part.
> 
> V1 -> V2:
> - Squashed "Enable RESFIX start marker only on supported GUC
> versions" commit into a single commit. (Matt B)
> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 67 +++++++++++--
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 99 ++++++++++++++-----
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  5 +
>  drivers/gpu/drm/xe/xe_guc.c                   | 13 ++-
>  drivers/gpu/drm/xe/xe_sriov_vf.c              | 40 +++++++-
>  5 files changed, 182 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index 0b28659d94e9..d9f21202e1a9 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -502,13 +502,17 @@
>  #define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>  
>  /**
> - * DOC: VF2GUC_NOTIFY_RESFIX_DONE
> + * DOC: VF2GUC_RESFIX_DONE
>   *
> - * This action is used by VF to notify the GuC that the VF KMD has completed
> - * post-migration recovery steps.
> + * This action is used by VF to inform the GuC that the VF KMD has completed
> + * post-migration recovery steps. From GuC VF compatibility 1.27.0 onwards, it
> + * shall only be sent after posting RESFIX_START and that both @MARKER fields
> + * must match.
>   *
>   * This message must be sent as `MMIO HXG Message`_.
>   *
> + * Updated since GuC VF compatibility 1.27.0.
> + *
>   *  +---+-------+--------------------------------------------------------------+
>   *  |   | Bits  | Description                                                  |
>   *  +===+=======+==============================================================+
> @@ -516,9 +520,11 @@
>   *  |   +-------+--------------------------------------------------------------+
>   *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
>   *  |   +-------+--------------------------------------------------------------+
> - *  |   | 27:16 | DATA0 = MBZ                                                  |
> + *  |   | 27:16 | DATA0 = MARKER = MBZ (only prior 1.27.0)                     |
>   *  |   +-------+--------------------------------------------------------------+
> - *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE` = 0x5508    |
> + *  |   | 27:16 | DATA0 = MARKER - can't be zero (1.27.0+)                     |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_DONE` = 0x5508           |
>   *  +---+-------+--------------------------------------------------------------+
>   *
>   *  +---+-------+--------------------------------------------------------------+
> @@ -531,13 +537,13 @@
>   *  |   |  27:0 | DATA0 = MBZ                                                  |
>   *  +---+-------+--------------------------------------------------------------+
>   */
> -#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE		0x5508u
> +#define GUC_ACTION_VF2GUC_RESFIX_DONE			0x5508u
>  
> -#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_LEN	GUC_HXG_REQUEST_MSG_MIN_LEN
> -#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
> +#define VF2GUC_RESFIX_DONE_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER		GUC_HXG_REQUEST_MSG_0_DATA0
>  
> -#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
> -#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
> +#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>  
>  /**
>   * DOC: VF2GUC_QUERY_SINGLE_KLV
> @@ -656,4 +662,45 @@
>  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_0_USED	GUC_HXG_RESPONSE_MSG_0_DATA0
>  
> +/**
> + * DOC: VF2GUC_RESFIX_START
> + *
> + * This action is used by VF to inform the GuC that the VF KMD will be starting
> + * post-migration recovery fixups. The @MARKER sent with this action must match
> + * with the MARKER posted in the VF2GUC_RESFIX_DONE message.
> + *
> + * This message must be sent as `MMIO HXG Message`_.
> + *
> + * Available since GuC VF compatibility 1.27.0.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 = MARKER - can't be zero                               |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_START` = 0x550F          |
> + *  +---+-------+--------------------------------------------------------------+
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | DATA0 = MBZ                                                  |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_ACTION_VF2GUC_RESFIX_START			0x550Fu
> +
> +#define VF2GUC_RESFIX_START_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER	GUC_HXG_REQUEST_MSG_0_DATA0
> +
> +#define VF2GUC_RESFIX_START_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_START_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 4c73a077d314..8e3fba6521f0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -299,12 +299,13 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>  		*found = gt->sriov.vf.guc_version;
>  }
>  
> -static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> +static int guc_action_vf_resfix_start(struct xe_guc *guc, u16 marker)
>  {
>  	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
>  		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>  		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> -		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_START) |
> +		FIELD_PREP(VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER, marker),
>  	};
>  	int ret;
>  
> @@ -313,30 +314,54 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>  	return ret > 0 ? -EPROTO : ret;
>  }
>  
> -/**
> - * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
> - * @gt: the &xe_gt struct instance linked to target GuC
> - *
> - * Returns: 0 if the operation completed successfully, or a negative error
> - * code otherwise.
> - */
> -static int vf_notify_resfix_done(struct xe_gt *gt)
> +static int vf_resfix_start(struct xe_gt *gt, u16 marker)
>  {
>  	struct xe_guc *guc = &gt->uc.guc;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	err = guc_action_vf_notify_resfix_done(guc);
> +	xe_gt_sriov_dbg_verbose(gt, "Sending resfix start marker %u\n", marker);
> +
> +	err = guc_action_vf_resfix_start(guc, marker);
>  	if (unlikely(err))
> -		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
> +		xe_gt_sriov_err(gt, "Recovery failed at GuC RESFIX_START step (%pe)\n",
>  				ERR_PTR(err));

maybe better fit for this error is the caller ? vf_post_migration_recovery

> -	else
> -		xe_gt_sriov_dbg_verbose(gt, "sent GuC resource fixup done\n");
>  
>  	return err;
>  }
>  
> +static int guc_action_vf_resfix_done(struct xe_guc *guc, u16 marker)
> +{
> +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_DONE) |
> +		FIELD_PREP(VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER, marker),
> +	};
> +	int ret;
> +
> +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
> +
> +	return ret > 0 ? -EPROTO : ret;
> +}
> +
> +static int vf_resfix_done(struct xe_gt *gt, u16 marker)
> +{
> +	struct xe_guc *guc = &gt->uc.guc;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	xe_gt_sriov_dbg_verbose(gt, "Sending resfix done marker %u\n", marker);
> +
> +	err = guc_action_vf_resfix_done(guc, marker);
> +	if (unlikely(err && err != -EREMCHG))
> +		xe_gt_sriov_err(gt, "Recovery failed at GuC RESFIX_DONE step (%pe)\n",
> +				ERR_PTR(err));

same here
in case of VF2GUC status != VF_MIGRATED there will be already some error message from guc_send
and we have another check for -EREMCHG below, so maybe move this message just there?

> +	return err;
> +}
> +
>  static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
>  				       u32 *value, u32 value_len)
>  {
> @@ -1183,22 +1208,16 @@ static void vf_post_migration_abort(struct xe_gt *gt)
>  	xe_guc_submit_pause_abort(&gt->uc.guc);
>  }
>  
> -static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> +static int vf_post_migration_resfix_done(struct xe_gt *gt, u16 marker)
>  {
> -	bool skip_resfix = false;
> -
>  	spin_lock_irq(&gt->sriov.vf.migration.lock);
>  	if (gt->sriov.vf.migration.recovery_queued) {
> -		skip_resfix = true;
> -		xe_gt_sriov_dbg(gt, "another recovery imminent, resfix skipped\n");
> +		xe_gt_sriov_dbg(gt, "another recovery imminent\n");
>  	} else {
>  		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
>  	}
>  	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>  
> -	if (skip_resfix)
> -		return -EAGAIN;
> -
>  	/*
>  	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
>  	 * must be working at this point, since the recovery did started,
> @@ -1206,14 +1225,34 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
>  	 */
>  	xe_irq_resume(gt_to_xe(gt));
>  
> -	return vf_notify_resfix_done(gt);
> +	return vf_resfix_done(gt, marker);
> +}
> +
> +/*
> + * Reset the marker to 1 after it overflows since GuC requires a non-zero
> + * marker to be set.
> + */
> +static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
> +{
> +	u16 marker;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	marker = ++gt->sriov.vf.migration.resfix_marker;
> +	if (unlikely(marker >= FIELD_MAX(VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER))) {
> +		gt->sriov.vf.migration.resfix_marker = 1;
> +		marker = gt->sriov.vf.migration.resfix_marker;
> +	}
> +
> +	return marker;

maybe we don't need all 4095 possible different markers?

I guess 255 different markers should be more than enough for debug
then can rely on the compiler:

+	 * @resfix_marker: Marker sent on start and on end of post-migration
+	 * steps.
+	 */
+	u8 resfix_marker;


	BUILD_BUG_ON(1 + typeof(gt->sriov.vf.migration.resfix_marker))~0 >
		     FIELD_MAX(VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER));

	/* add 1 to avoid zero-marker */
	return 1 + gt->sriov.vf.migration.resfix_marker++;

>  }
>  
>  static void vf_post_migration_recovery(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	int err;
> +	u16 marker;
>  	bool retry;
> +	int err;
>  
>  	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
>  
> @@ -1227,14 +1266,22 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  		goto fail;
>  	}
>  
> +	marker = vf_post_migration_resfix_start_marker(gt);
> +
> +	err = vf_resfix_start(gt, marker);
> +	if (err)
> +		goto fail;
> +
>  	err = vf_post_migration_fixups(gt);
>  	if (err)
>  		goto fail;
>  
>  	vf_post_migration_rearm(gt);
>  
> -	err = vf_post_migration_notify_resfix_done(gt);
> -	if (err && err != -EAGAIN)
> +	err = vf_post_migration_resfix_done(gt, marker);
> +	if (err == -EREMCHG)
> +		goto queue;
> +	else if (err)

'else' not needed after 'goto'

>  		goto fail;
>  
>  	vf_post_migration_kickstart(gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 420b0e6089de..66c0062a42c6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -52,6 +52,11 @@ struct xe_gt_sriov_vf_migration {
>  	wait_queue_head_t wq;
>  	/** @scratch: Scratch memory for VF recovery */
>  	void *scratch;
> +	/**
> +	 * @resfix_marker: Marker sent on start and on end of post-migration
> +	 * steps.
> +	 */
> +	u16 resfix_marker;
>  	/** @recovery_teardown: VF post migration recovery is being torn down */
>  	bool recovery_teardown;
>  	/** @recovery_queued: VF post migration recovery in queued */
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index cf92de1c88a7..cf9820e036fa 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c

this change below should be placed in a separate patch with separate commit msg

> @@ -1483,9 +1483,16 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
>  		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
>  
> -		xe_gt_err(gt, "GuC mmio request %#x: failure %#x hint %#x\n",
> -			  request[0], error, hint);
> -		return -ENXIO;
> +		if (error == XE_GUC_RESPONSE_VF_MIGRATED) {
> +			xe_gt_dbg(gt, "GuC mmio request %#x: failure %#x hint %#x\n",
> +				  request[0], error, hint);

since we know it's a VF_MIGRATED status, we may use more tailored message:

		"GuC mmio request %#x rejected due to MIGRATION (hint %#x)\n"

> +			ret = -EREMCHG;

and you may "return -EREMCHG;" immediately here

> +		} else {
> +			xe_gt_err(gt, "GuC mmio request %#x: failure %#x hint %#x\n",
> +				  request[0], error, hint);
> +			ret = -ENXIO;
> +		}
> +		return ret;

this will leave existing code as-is

>  	}
>  
>  	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index f53d68f2f1d2..0cc6ca3082e6 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -49,11 +49,13 @@
>   *
>   * As soon as Virtual GPU of the VM starts, the VF driver within receives
>   * the MIGRATED interrupt and schedules post-migration recovery worker.
> - * That worker queries GuC for new provisioning (using MMIO communication),
> + * That worker sends `VF2GUC_RESFIX_START` action along with non-zero
> + * marker, queries GuC for new provisioning (using MMIO communication),
>   * and applies fixups to any non-virtualized resources used by the VF.
>   *
>   * When the VF driver is ready to continue operation on the newly connected
> - * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
> + * hardware, it sends `VF2GUC_RESFIX_DONE` action along with the same
> + * marker which was sent with `VF2GUC_RESFIX_START` which causes it to
>   * enter the long awaited `VF_RUNNING` state, and therefore start handling
>   * CTB messages and scheduling workloads from the VF::
>   *
> @@ -102,12 +104,17 @@
>   *      |                              [ ]        new VF provisioning  [ ]
>   *      |                              [ ]---------------------------> [ ]
>   *      |                               |                              [ ]
> + *      |                               |   VF2GUC_RESFIX_START        [ ]
> + *      |                              [ ] <---------------------------[ ]
> + *      |                              [ ]                             [ ]
> + *      |                              [ ]                     success [ ]
> + *      |                              [ ]---------------------------> [ ]
>   *      |                               |       VF driver applies post [ ]
>   *      |                               |      migration fixups -------[ ]
>   *      |                               |                       |      [ ]
>   *      |                               |                       -----> [ ]
>   *      |                               |                              [ ]
> - *      |                               |    VF2GUC_NOTIFY_RESFIX_DONE [ ]
> + *      |                               |    VF2GUC_RESFIX_DONE        [ ]
>   *      |                              [ ] <---------------------------[ ]
>   *      |                              [ ]                             [ ]
>   *      |                              [ ]  GuC sets new VF state to   [ ]
> @@ -118,6 +125,33 @@
>   *      |                              [ ]---------------------------> [ ]
>   *      |                               |                               |
>   *      |                               |                               |
> + *
> + * Handling of VF double migration flow is shown below::
> + *
> + *     GuC                                              VF
> + *      |                                               |
> + *     [ ] VF2GUC_RESFIX_START                         [ ] <--------
> + *     [ ] <-------------------------------------------[ ]          |
> + *     [ ]                                             [ ]          |
> + *     [ ]                                     success [ ]          |
> + *     [ ] ------------------------------------------> [ ]          |
> + *      |  VF driver applies post  migration fixups    [ ]          |
> + *      |                                       -------[ ]  Restart |
> + *      |                                       |      [ ]   fixup  |
> + *      |                                       -----> [ ]  process |
> + *      |                                              [ ]   again  |
> + *      |  VF2GUC_RESFIX_DONE                          [ ]          |
> + *     [ ] <-------------------------------------------[ ]          |
> + *     [ ]                                             [ ]          |
> + *     [ ] Error - XE_GUC_RESPONSE_VF_MIGRATED         [ ]          |
> + *     [ ] (new migration was detected while the       [ ]          |
> + *     [ ]   resfix process was still in progress)     [ ]          |
> + *     [ ] ------------------------------------------> [ ] --------->

there is no 'go back' in sequence diagrams

> + *     [ ]                                             [ ]
> + *     [ ]                                     success [ ]
> + *     [ ] ------------------------------------------> [ ]

'success' is only in regular migration fixup scenario (covered by diagram above)

> + *      |                                               |
> + *      |                                               |

so maybe:

    *     GuC1                                             VF
    *      |                                               |
    *      |                                              [ ]<--- start fixups
    *      |                  VF2GUC_RESFIX_START(marker) [ ]
    *     [ ] <-------------------------------------------[ ]
    *     [ ]                                             [ ]
    *     [ ]---\                                         [ ]
    *     [ ]   store marker                              [ ]        
    *     [ ]<--/                                         [ ]
    *     [ ]                                             [ ]
    *     [ ] success                                     [ ]
    *     [ ] ------------------------------------------> [ ]
    *      |                                              [ ]
    *      |                                              [ ]---\ 
    *      |                                              [ ]   do fixups
    *      |                                              [ ]<--/
    *      |                                              [ ]
    *      x     ============== VF paused / saved ==================
    *                         
    *     GuC2
    *      |
    *      |     ============== VF restored ========================
    *     [ ]
    *     [ ]---\
    *     [ ]   reset marker                                           
    *     [ ]<--/
    *     [ ]
    *      |     ============== VF resumed =========================
    *      |                                              [ ]
    *      |                                              [ ]
    *      |                   VF2GUC_RESFIX_DONE(marker) [ ]
    *     [ ] <-------------------------------------------[ ]
    *     [ ]                                             [ ]
    *     [ ]---\                                         [ ]
    *     [ ]   check marker                              [ ]        
    *     [ ]   (mismatch)                                [ ]        
    *     [ ]<--/                                         [ ]
    *     [ ]                                             [ ]
    *     [ ] RESPONSE_VF_MIGRATED                        [ ]
    *     [ ] ------------------------------------------> [ ]
    *      |                                              [ ]---\ 
    *      |                                              [ ]  reschedule fixups
    *      |                                              [ ]<--/
    *      |                                               |


>   */
>  
>  /**

