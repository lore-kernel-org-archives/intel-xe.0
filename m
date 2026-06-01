Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5909FCD6E55
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 20:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B94010E908;
	Mon,  1 Jun 2026 20:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXS0w/la";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB51110E908
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 20:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780344030; x=1811880030;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kE/skddWAlecef+tSgCAsVtJlXbCS0AK33j/P7pzw/k=;
 b=hXS0w/laHM2VXDOYV3d+hE3fXKOmjsqLxcN6wg3MRNmMadFwArd6KqAg
 opJ4MwirNdO6ZRQjWf8SGvzWKt5lNgQc5TRW6jDYpPoPhbQ1bu7wYUXBB
 ISPFkZ37vK7oWial1Fbevbp+G2FIrkiTDOfedN+rdaDw4HGlnBPSL00CN
 JKdC46A8yQ1E6l4vd7yq98U6Dn0gGVYfANWY2kcXy0UltXfol0fzJ8XAM
 v/bE4UPoWeMsbwsZHDiAlJxKVi8mOXeYKY0TxyC/pkXudVTO3Pf/xciOk
 CXMeImHL3RSCs4L3HaU23aD8rCzZFB40+PJNmMTc3oebUddXAKoTra0Er g==;
X-CSE-ConnectionGUID: 8iwHrRewQOCMWFWr4KqE2w==
X-CSE-MsgGUID: bVg25sQJTYaOD1DQIoSVSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="83690435"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="83690435"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:00:29 -0700
X-CSE-ConnectionGUID: HnTBwmYBSjmXJliSoEjWUQ==
X-CSE-MsgGUID: 5TZpmuVzTXmAbv9UUZZCow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="242630381"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:00:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 13:00:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 13:00:28 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.24)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 13:00:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCmHygO+LmkGG6ftZbZHCzmFiiPlRZFZm+YbNJ2Ta2X8nz7hOUsdgzxwhIxFfkgXs+DUrLd8s51Oduos3q494aJcDFomPlJKUlihqokxB0cUGrcoJfh22WMtiJu3Vj88p0tb6T9lzSNCuObTORq7SFTWzOqeTPZCzix3tRMFm7P0HNe6sxjnD8vX7FKJy6Ezj2NulzsUavUAg64GjoK1+1CrIkCywsDhvbd4TG1HK39uM2dH4IgGQ7tUftVu3DXgxYoV8vUABF/HlkUUrwFEWPZnK5az4P5DwGkrmv8uEyW/wJJt/r/wuBOEqh2oIwkjLUqX+N5vjOUflGfF3Pf8dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVi9wKSK9W99ImfwO/KWyUm5ABTnnZhLovDSCHNyl+s=;
 b=GdtVTlHct+ZlsIQnHz7Jj2LcIR7gDEHGdxM3c16otvMFxkA9B0AqWUHasKXXAAjHI8qbZGCoEkGrFHnxqXunbPemtMOhK/mo3Yq1CrJRQcRcnRy2zryjz6OHQDz4yYCjDaJ7xKeanBk4bfS00bWkZUwGEICdBm2HV5nrxSpGn8Cq3hKgXvIuxHKDOyrGGsbxujUgJGOs6U2DXDaeu+LK1UBy40wP9lKcxuL7g9U2JQz5DTo2Tu+4/AlqMNgMAyJ/azfhGlAWvbC7ZlarFp3n6YeI/oWz74eE5YObZVpD0Z2BTOb/CjF5pL8CU+PCQd/HBYeYLGsLIEKdyYnJbE9C4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CH9PR11MB9903.namprd11.prod.outlook.com (2603:10b6:610:341::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 20:00:25 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 20:00:25 +0000
Message-ID: <fa0b788d-a809-4d02-8b38-9deca6c3e877@intel.com>
Date: Mon, 1 Jun 2026 13:00:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add wa_14025941587 for xe3 and xe3p platforms
To: <tilak.tirumalesh.tangudu@intel.com>, <matthew.d.roper@intel.com>,
 <tejas.upadhyay@intel.com>, <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260601164316.2870984-1-tilak.tirumalesh.tangudu@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260601164316.2870984-1-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0237.namprd04.prod.outlook.com
 (2603:10b6:303:87::32) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CH9PR11MB9903:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b29a27-b765-4853-0e0c-08dec0186bf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: kKF0s2BI/tGJkdWPnjbJlm6HGKEiuApKBeOQYsUz/mFuHgpgA8/QXH5fCGlFjU4mvclkp3lWkBlUfTREjCxW1RhOEQWa5b4YkZbHiojguz2pbW6Tnh2cLPGWvWMpk4g8orcb6saGKaEcNO7T13kWv0Do3mDd8kR2lxnCkt4s0Q8/2LKDwsmWpSMswYQ8kR9b8GmwK8xYB3dCMWGeuC4X/AzY5C/MXZsg6OaYLdILToxiugsR6ZhD+XGYyu6KWxcOgDNKQxPX8Wzrja77OfOZaHz3Q/0q/WlRZlYV5DOzjLYzQk0IQ2JLFxmmRXYtmZlOrN14lxfR3oWPLxreRz3j1v/UovjhA7uRWlN0LEPrxA+iYzdhED/SnpW4vfNefn/Egx6UjMapEsUtDkF5R4u+cM4Oz4ek5UuxIrCzSGeZgLxHNhfpR5Ffys+1dFhXKFyoZmM8PkTH1WDIb44jQZjQNuIvbmTgmq9Jq6vXjS224KpA1uqDDGzwmvm77Qr9EbJydUsf9jp26KIreF1xYANg6S9ji2nDR0g4CvJnoA7QxVviXPpXnQUlXXWqZetAUgJcoJK7L0QMVBvxGkeH22FudgqAgXQ3UiZa6Ah1juNoDs/fCltrNvPcrA1kJ/k60dvamV2RbgadkM1mkn2tHjBG9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXAxUmtiSXNWZWtpM1d1WCtJMjRDd3pLejFENUxOQ2ZicDdmaUs0ZVp3VHNI?=
 =?utf-8?B?OExVZk13cG5CSVF6Tnh6K2E4ODYvMHFVTGdtMGFZQkROUmdaV2pNa0ZhOEZS?=
 =?utf-8?B?eWlZSE1wMG1sclJiUloyM2ppSVZwT0oxTGhyazgzSmt6engvZFBDOWxMVzFt?=
 =?utf-8?B?dkdsclp1aGNrQ3Z6UUt2QmFMK2wxOG5RNXAweFpFeUxMVHFBV3RvNTZBOWJQ?=
 =?utf-8?B?VGMrMGpGZ3M0MjNyNzB1TjFoWXJHYjlHRVEyUVRsUUJhYjN0SUpSL244YTJ6?=
 =?utf-8?B?SENxWXpPeHZJRVA4R1BnU2VTZ0VScVZyTnVVckxVQW95NDg2WGt6cUV2K3li?=
 =?utf-8?B?R0Q3aHhvM0hGMnlPTHdmb3JvYyszSTNOU1NkSkdhd0FFQ0NpUzduVldPcVUr?=
 =?utf-8?B?dUF2MlZ5MEF0OGVIMForWFM4RjYvQTQ0WjN3MHhnSUVFaFZLWGFNQjFkWkly?=
 =?utf-8?B?dkY1SW93U0tKL0loMVdFemFEbmZJd3R3TVJBOWVqdjE3YzdMQWFvTjhtZGVm?=
 =?utf-8?B?RWRWSmlsRmVTZnlMK2VPVDUrOVc3TjdpWTQ5K3JFMit5MEhTamExRHUxMjJE?=
 =?utf-8?B?MC9KZWhyQ1FUQ1RHUGV3WW1HcU14djNXSmE5aFNWTFRNa3lvSjRueVg5V1dG?=
 =?utf-8?B?cEd2bktyMWplREpta1dDdDlRTCtCMEVXaTNLdEJlQ2VwWnNocC96cXdCK3N2?=
 =?utf-8?B?VG5YY0RMOURzWlJuZ3EvYkhaZVFtSW9XUnN5UGoreFNINGRCZis1VDBZc0Vz?=
 =?utf-8?B?NDlnYWh0VHpMUWRtYUJDVVRrS045d0JTVm1wMEdVcnpQSytlM3E2bkI5aEo5?=
 =?utf-8?B?L3RpQnR1c29mc3NPa2NaMzl4d2hYSGM2VC83eGkzSWhJMXhWWXJwWlVqemhM?=
 =?utf-8?B?TFRSM2FHUTk5WU83T0NxeUJyRi94OVBoK0dDWlJvemNBWU82UDVnWWhRUndF?=
 =?utf-8?B?bEpCcG9LL2xkcG81YXFaSGZ0dzJnREFjSHJ5OHZWOThLS01pNFBJdkV4SGIw?=
 =?utf-8?B?R0x0Nm5tMjE3djBlbmlLdURtczlkeXFobUk4SVE2MVh1RUlGMWljc3ZybG93?=
 =?utf-8?B?dVhBSUM1WTJnSUhoN2Y0QXFyU3pSTmova21TTzJyalI2a1R0akNDMWZPbEdt?=
 =?utf-8?B?UzBhL1ExWkcyRnkwUktXR0JIZlVINDdqcUt3MFhIT0FOdmRQeVlIWVFGWUJM?=
 =?utf-8?B?ZzBZZDczcFlRSG1Da3BIR2V0M3FhL1p0b3NkbDlSdk9GQWhoY2VUUTlpenhB?=
 =?utf-8?B?TmhBaExBRjdSUmk4dm9pcHhESWZEU0Y5ZE5kZFMvVGFMZzZzSDM3Mm0veDFG?=
 =?utf-8?B?MENUUkdwSzVkMEpXaHJXcHJwRHgxTEZGV2Q2Y3lQaGJoaWtKZWU5QjB6Z0k3?=
 =?utf-8?B?RVdRQ0U4aHJKOU9pMzZLVm5tRHUvdWhROTVWMERlL2tQclNNYVZ6UjFDWjF1?=
 =?utf-8?B?VDR1a2F1Y1JIRmxnYitaQVdtTVBSTXgyRkZZRjIrTXhPN0Z0Z0czcVI5MGps?=
 =?utf-8?B?MW5NNUZLY0xEVEFiaTJlbmd4ZUNGaXExYjhOSHBTUTQyYWZOUTRhVVNVVWNF?=
 =?utf-8?B?TTdnQ09yWkRBMzFveTBGRURiSmlBQ01SclhHWDZBaGdFa3lwaytrYTFMSWxG?=
 =?utf-8?B?cTQ5cW1zTWZCWnNkN0pCcFVEaXE1UTNXd3gybXJvSG9JTmZiVDI5c0huekx2?=
 =?utf-8?B?TGlpYTd4OG5uL3F6cGJqNWtrcUdpVVdXS3hvV3RlbHJNcDNFTXhueEVzdzRm?=
 =?utf-8?B?WVFzUVNsRXNudWNTT2xtR083NFd0czVNUExyM2xNaDFCTWg2QVdvTGJudEVk?=
 =?utf-8?B?Z3lvMzdoYjloVHdpVndSQm9lNTZwQUVaWi90QjI2Qm10ZENGcjlaTU8yQ3U5?=
 =?utf-8?B?Qk50Ynk1TTR2M05YRUF2VTcwUlBad2V3K2YrMXlLNldHcnpUYytOeVFzS3ZP?=
 =?utf-8?B?Q1g4N1dGa05qS25IZUMvVHJ6bDdBMWpqUDdWNkUxYjF2MEdzM0g1MmllcjNO?=
 =?utf-8?B?ckduc0VwNmVpNWZtNGNsNEdCK1RlTnMxNzlPZ1ZoS2VvK1JaU3ZWVW1nbUIx?=
 =?utf-8?B?eDJPY3lQeEJqbEp0TTRneGRsMVQwUkNEdlNWWWwybTcwMlBZQ2xDMjF6TlEy?=
 =?utf-8?B?Si8zMThuOGxldnBpSTM1bm5TOU9uRit6N2FvNzdVaXlUVlY3c0Q4MzdXSHpt?=
 =?utf-8?B?Rk13eEs3QTRxcHdyVmVTeC9WVUc5S29jTzloRUZSYnFFcUJkdnJPQnhVZVVD?=
 =?utf-8?B?NGRzTzBlR2lqMlR1T21oZklQUEZpY05tYlh1WEV0bkpEMXRqQzdxU2I2VHdh?=
 =?utf-8?B?SkU1Y3g3bzdaZ3pGV3o0Vk1nTUtYYkR0bnYySUtnVFlFd01QbFRrbVFZd3pS?=
 =?utf-8?Q?7mrPzk4p0P48rijE=3D?=
X-Exchange-RoutingPolicyChecked: jt/EkLLc8aoDQBoemcKlKm0zEUAF4G3dfnU/B48rB4KceuiHHfZF8dV/m921Q00PgA7EANK7V/GKjuyxci5Gne5i4otsHSZwQ58H5KnRKs0t7mVmMQ9mW9FaRFKx3qo35R2NP1wS6m+W8fEfj1Z/x1Xx64eQnekvUSUiC4/lKK/ECSzxUPITOex8z3TN9tro264ZFZbjxad8riWTenGXpZokXF93Lgst0XtXGue80rEKfYVn9cFIZgEp5RZfAG5y2CVmpBE8koLofat2OxtQOyO+3T1v8AG1JrN4uHjeVafj5cFPY86pUNdd19zw7dEBctTn4OODMYNMV07+ih4+YQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b29a27-b765-4853-0e0c-08dec0186bf1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 20:00:25.7507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QN6wGi04DHNIweAGI8t97/3STFGRq3qKRs2q7KkJn8yyF5zG0zY1m6Xnz94weZrn7ns1gn1onS7Ump0pOoI5e3h8muuBXz7VcXElLXkrxf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB9903
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


On 6/1/2026 9:43 AM, tilak.tirumalesh.tangudu@intel.com wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
> Avoid IDLEDLY timer programming lessthan 5 micro secs.
nit: Reword - "Avoid programming IDLEDLY to less than 5 microseconds" ?
> Apply wa_14025941587 to Graphics Versions 30.00 to 35.11
>
> v2: Use xe_rtp_match_not_sriov_vf, move to local variable
>      Remove warn and other knits            - Matt R
>
> v3: Add verbose comment - Tejas
>
> v4: Restore IDLE_DLY register on engine reset.
>      Add it to GUC save-restore list. -Vivek
Isn't this being taken care of here - 
https://patchwork.freedesktop.org/series/167123/ ?
>
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
>   drivers/gpu/drm/xe/xe_hw_engine.c  | 26 +++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +-
>   3 files changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index c98454545a85..2080e0e650eb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -768,7 +768,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>   		}
>   	}
>   
> -	if (XE_GT_WA(hwe->gt, 16023105232))
> +	if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587))
>   		guc_mmio_regset_write_one(ads, regset_map,
>   					  RING_IDLEDLY(hwe->mmio_base),
>   					  count++);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 8c66ff6f3d3c..dd8eec098bdf 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -584,8 +584,12 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>   	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
>   	u32 maxcnt_units_ns = 640;
>   	bool inhibit_switch = 0;
> +	bool wa_applied = false;
> +
> +	if ((!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) ||
> +	    XE_GT_WA(gt, 14025941587)) {
> +		u32 mincnt_idledly_ns = 5000;
>   
> -	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
>   		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
>   		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
>   
> @@ -595,8 +599,24 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>   		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
>   		maxcnt *= maxcnt_units_ns;
>   
> -		if (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
> -			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * 1000),
> +		/* Wa_14025941587: applied prior to Wa_16023105232,
> +		 * as the latter has higher priority, although conflict
> +		 * is not expected.
> +		 */
> +		if (XE_GT_WA(gt, 14025941587) &&
> +		    idledly < mincnt_idledly_ns) {
> +			idledly = mincnt_idledly_ns;
> +			wa_applied = true;
> +		}
> +
> +		if (XE_GT_WA(gt, 16023105232) &&
> +		    (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch))) {
> +			idledly = (maxcnt - 1);
> +			wa_applied = true;
> +		}
> +
> +		if (wa_applied) {
> +			idledly = DIV_ROUND_CLOSEST((idledly * 1000),
>   						    idledly_units_ps);
>   			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
>   		}
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index f8a185103b80..2d531b8a946f 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -62,6 +62,6 @@
>   15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>   16026007364    MEDIA_VERSION(3000)
>   14020316580    MEDIA_VERSION(1301)
> -
>   14025883347	MEDIA_VERSION_RANGE(1301, 3503)
>   		GRAPHICS_VERSION_RANGE(2004, 3005)
> +14025941587    GRAPHICS_VERSION_RANGE(3000, 3511), FUNC(xe_rtp_match_not_sriov_vf)

Does this affect media as well?

Thanks,

Vinay.

