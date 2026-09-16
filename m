Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EB1C982C1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 21:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CB810E05F;
	Wed, 16 Sep 2026 21:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KfiDm5jk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765DD10E05F
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 21:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789593899; x=1821129899;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M5xEiCJlGnRzODQRLGQSN9hmJmyfXKsxLhxynRh+Z2U=;
 b=KfiDm5jkDpWWX7uc3EqagT3SBJHZavSnOemmATC53nRH4tjUXLfd6CZM
 zLqvNCP6nQGjOYyIudEpXQPaniOZLW7hr39hk+q96Ai2/WKe7NVObnQyJ
 lz3xhHYsKnSsR7my/7Acf0li5zF+rH3mhs7BbP4XkCmOeW8K4RyyK5Lvz
 3M9/uGYVemlpBiJauKFmcbc9pMRinQGgyR4yUwM9V9ZJUrd4RLPSrYZzH
 ddKvnoZs+gU+qWfIhr2UaugX61fEOdh6GSlpG5QCu8bwSNcMtb4LppScU
 jv1qedMJ6PxO3KoZkgbHnw3xX1UiTETlLoq+sAtfWUmu1El+VEMzPfZ9n g==;
X-CSE-ConnectionGUID: UIMBjqFvRpe42y5lWh1m8w==
X-CSE-MsgGUID: 97LyilcZR7esJOm6MOlxqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89917694"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89917694"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 14:24:58 -0700
X-CSE-ConnectionGUID: zr/uxCufRNiGdU/SILmrrg==
X-CSE-MsgGUID: ofs9EBtXRu+ST/sUW1P7xA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 14:24:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 14:24:57 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 14:24:57 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 14:24:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyOOiUgF7xVlNlqfoxvRxX4qLgU+zqH2hy1b16DUsB7EJFUARg1bn6D5D5aparFwDUFengOfMM5HgME1LJX4JWAK8WdmYuwg4aPooo6KHwJzdyfjJqM4jjQILQshce2IqGdUJNU/KYU/XT2VTOqDCGCjo4EHyoZHORBJ78xKl0QkQCTVljpC/mFo0L0JnI2GY8LiTpI1XYEUK586XN1TqnUITsww8R8lI5wpLbJkzgA7br4azGfGRYu3b0OwMFeDFv3IjcasU7/C25JCjpFiyLcvAPuF8us8koSH5j0PcAu+OGYWEflupHaYlIlyMlhQVmKG9Zk/D3qcZ3IruSlR9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5xEiCJlGnRzODQRLGQSN9hmJmyfXKsxLhxynRh+Z2U=;
 b=B55lJEdFjAq4gN8I0F9QoFvjs1LdwyfwFCmI1CM+kPakX0IR44Wv2/No0yqVpsfhupovNkmwRfxkvwxtOvbB3PQT6zbbOuEo/Gn0mHccrlfNRmJSkkV/w/nOPf8+Q4IhYfAtQOCM0fzEO+Hrt8gTJR821go1iByaE4Me077B5y7dy7tm682eNOlTjEcEajZVl62dYWsdeUUyU02AmWS1UWviAZksXVkNcs0OHI34ro8WK8x9X1fZlXm2uZjYngm1mEsHvw/Po2FPILDGLJUPrJen5EzZbxyS6FDmoUUBr2BOq6gu6Zc7N63AzskdH5rDO7X05MzLKkIELktSnxJt2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by LV2PR11MB638815.namprd11.prod.outlook.com (2603:10b6:408:415::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 21:24:54 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 21:24:54 +0000
Message-ID: <3c1102ba-b2f6-460f-8312-72bac481efbe@intel.com>
Date: Wed, 16 Sep 2026 14:24:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>, Zhanjun Dong
 <zhanjun.dong@intel.com>, =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?=
 <jose.souza@intel.com>
References: <20260915174840.531473-4-alan.previn.teres.alexis@intel.com>
 <20260915174840.531473-6-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20260915174840.531473-6-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:303:16d::29) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|LV2PR11MB638815:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb79131-6db3-40be-16b8-08df1438f33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|4143699003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: o0+1KeLsSenFLU/fcfMKUQJX2isTJseA8JTawgOWfRVuP9GwzitaPPXm1CtY6EhzvTLdqmnDerLVQDtSlP/FkU6hdyUFjOTzqH1/R0PYmRi298lbGS8cFInqaPYUk3Hd5KIiOImZMueAnfC7dL+Zu6n3WSqYO1hyMCgpROoVoCkMbAiJ+jUgxosOBUcQniP9IBWcnl9AwJuHMlpeYatv8bEO6jilylJ03TuwQ+5MPoVQSZ4YAwn1oYG1jgHPBmgxFXPJP//6KsOKd6XxzojHKm4GE/Vrm81PPo6/nZyc0tijqR+3rtAKM21SufW27URW3BVmY4kyaf0HC15kUWrp9Z5i1K8cc5Nz1tCJwSDyWnPZh8Cv0iNax+H9W4HvEwvWVEkMe3fHN9l7v3Y9/YJEn5ZfjZ+tlQIe5v5r1QXWcKrQYFgo+94vszL3XtasdZSkeN67l/4k240Ew+jCwmSfI4BNDkygOHOwIZhTnUJ2iAhjdJ+FLpWhsRJ73pbUb9Nzv/eOcxcji7CDfxVGh4Ifri8U++c9fKV1wmhLIKAWdzuLAm8Oey5nuARAkWm+TsvqR52q08pCyNkgL8vdBs/Mz8lT+vQx+aOfbhryofDd+ExDGTVR9iSsznXspaipbBW8OhHCN9RDsUYZlQ6k59cHWij9+Lg9zRQd/Udi91l56Y4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(4143699003)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDNYMlRkazBPVFkydXlEekFJaVdSa29YaWZ2alJ2dk14aUgwbTJzRDdGWUpH?=
 =?utf-8?B?dFQyZjhDTGdSMy84TG43Y213OVhIRE5IMzBleHZNdk84Sk1oU2hWQ2c5MXRs?=
 =?utf-8?B?ZjNrTGRIVWVnZ1Z6RkVIWXZlU1hKWGNpNVFZeHZxQWQyb3Q2bGxzMlpsUFRR?=
 =?utf-8?B?cEZVRDhGSTZCTU1sbDAyS3h3dHZEQ0NtM0lKN3JWNi8vKzNBZHk2NUdpNDNF?=
 =?utf-8?B?N3lCeWo1Tm1lVTloUDhQUHdQNDV6cG9halJwNmg0RWxzcXl1TmV0QW5aSXQ2?=
 =?utf-8?B?WDNYdFowUEpQZGpoTUcvWXR5SGlaQ0QxS1U2dTlBZ3F6eDlGRlNtRmJNQjlv?=
 =?utf-8?B?ZFlHU1M4OXJWZlZYdWI0YUlycStYQjFsYzVwSGNvcHBENE4rejhwMWd3UWhp?=
 =?utf-8?B?NTRVNzNvbWdjeHJNRUU1RzREN0VINGZGRzJBQ2pvcGM2UUl1bUpLYzdRTkgx?=
 =?utf-8?B?UjN6UjlJRWFxaUZuV0VSMy9TOU0rN0lBSi9KS3UrcUlsTEMvUHpaT2g3ZFJT?=
 =?utf-8?B?YUtjSjk3RGU1YmFaY25leXVUcis1bUZFNnRqdk9nRWs1VG1ZdnViMmkxUFds?=
 =?utf-8?B?QTh5NSsxRnd6QlhFaXNIbU1UMTAyOC93dElVdThzQUJ3YXBHK0NUQ1ZOUmJs?=
 =?utf-8?B?NVY0Mi9lR2k0QStOVlE0dHhiaE5xSjQweERPQ09qT3FYaDZaREtuSEREWFpQ?=
 =?utf-8?B?dXlKTndsbTByZUJOU0dzazdibE1SNjlDZXoxVWl3dFNLeEFuQWh4dGFOYkFE?=
 =?utf-8?B?TVp6M0swakdWb0l6LzFyK1R0K0g3NjVNQlFTaXhySlI0OWtEdHRPMkw4VWQw?=
 =?utf-8?B?RXlYNTRsTzdMcmV1VjVXY2pHWlo3MWcxbzRGS1d0SjFPM1VMeXY4Znd6VnRJ?=
 =?utf-8?B?ZFlINjFXV0pVd1ZHaUFNVmI2UlliSTN2NHEvZHhpanNqOE1WMmwrRHliNnZt?=
 =?utf-8?B?VmNlTlZPZ3NYTlQ1SXNGc1JLL0VZTmZ0MU44bXNCWVd5cEYyaXQwd2djTXJY?=
 =?utf-8?B?Uk9ybEZaZ1FmWEJ6ZkNFUGpXVjI2Q0I1bWRhaStvM0pnbmhkRjFEV1EyazRY?=
 =?utf-8?B?enFOVEhrQlhTOHE2MGQrV0p4TVdpUE1TV0dEUW5wdFhMUkhnN3Z0M0pHaXor?=
 =?utf-8?B?aGtaZGo1V2RldHVKVllnbU9lU3FlQ2hzcC9wY2dFd2krVVMyK1AxRVYxaUdp?=
 =?utf-8?B?UUlTUE13YzgvakpvZ2tZTWZtY1FSSWZOcWpHYStqaTZDS3E3MWJSalM1b2JZ?=
 =?utf-8?B?SG5nK1FtUGIreFROODZTR0tGQi9Ed1lSNkVyLzYyYURlZW5FRVp1MndqYmJZ?=
 =?utf-8?B?ZlFpU1BvTE1sWGUrYWJjM1BHc3ljY0I5NHVvVDFzUlRNMHFmOEowK05NTEdo?=
 =?utf-8?B?WnZXc1NmbmhOclpEQ1pYS210UDRCdmFVbHg5SThQRVhsSm1tanptVFBUeFZQ?=
 =?utf-8?B?bGRlV00yM05DMFQvTElGeFhydzZtMWlKNjVpNGY3Z1FWeXVlUTBUbHgwd1kv?=
 =?utf-8?B?YXF0ZFVzRytNZXlyNVhpcm1CR3NFbzNyQnUrVlVvZUdFRmxVNVdSb3gxeU9l?=
 =?utf-8?B?MlhTTDB6bUd1eUFWb29mckhrTndzc04zUlpSLytmYTgzWC9mcUVQQ2lSMGUv?=
 =?utf-8?B?SXNEeHdwRy9xS1g1MWc2Nzdub2J3Ymo5a0pNQlduVDBQTmVuaGs2bUt1dUFz?=
 =?utf-8?B?b0dWZ3JnMnV0TlVtOWllM0NzV3lOb1NxdlhaWThTd2JNekFMR1RaZUthK3NT?=
 =?utf-8?B?ZEFEYU5BTUdPa3dsTGJqQVRFK0RVMjlMak5qSFpoNGJjUXF4dGZWT1NoWkVW?=
 =?utf-8?B?c3ViaWFZMFJ2RnRtS2c0VjIxMzlWQTJwWXo5VHBzdVdJYnJRNUsvODI0UVRs?=
 =?utf-8?B?UGlINnBHUkhLZk96UFNkUnBKZDhoVXRiMTYxOC9jQVNSN0J2cDhsRU1nMDl6?=
 =?utf-8?B?b3R3L00yMUFzQnY2WDFUd2dOQk9HeTZ1NVJLOTdSQTJXNGc0RnFHalRhejdL?=
 =?utf-8?B?RGwzbGtHeGZjTkZaTUJJM0F1ZjNrRjVNSjhGaDN5bkpMYkxUcm1kZmNnR3pH?=
 =?utf-8?B?b2JpR1lUREd1eW1YallOS2RPRzBHb3hFdkZUVUZlTFNpQWRXRnBKdmxTU1R5?=
 =?utf-8?B?UUxSTHhtOHFyUjJ2WVYvT0NLUHBnejRKL1puMWg2WDFNT0crQSttUG5lK2Ir?=
 =?utf-8?B?NWpQdVJmZzduek5MMzFzMEV3TExMZmxVSDRMT0ZtYXhyL1FKYWNaRjRuZ3Ro?=
 =?utf-8?B?bXNOc3hGNDRHcFM2enVqc1djN05ibGx1MDlqZ2hJOG50NHJzQlpBOXNoekV0?=
 =?utf-8?B?NGJwWFVONTg5UW9XVmh0YVp3Sm9SNjBnNEN4djFuSkE2VEpyNkJDZGVub3k5?=
 =?utf-8?Q?2NkTVLUFMHUWbMJs=3D?=
X-Exchange-RoutingPolicyChecked: X8xSylWEBdQzIKOIJ8uE1yJF0TOM36P6r8W5kJ6KpBK47E8naTedJN5AVm3EzAYD+0nE0GYzpyjeXfBHMacUTC9c9/rrPzs59fnYlO2ywmECHParIPPIbEyUnjSJvLSpN5yIr54ddrFoqe+dHXAArGFFuUkdz4fdRtk02AV1biv4DNCLcPwS9l0zQmOHKWPXJhzBrte3R5xSz5EraGvBX4uNabj4k4lGdLGHOHgzcVndkFHun4I/qsJtclzLsOxs9061M7/ZtqNA2q0F9jcy6C34+9VRcq+6f8jSZ5PmFTdmEpwo4Wma9vlRUYj2SHmSe38kyMBjI3MOIBL97je0DA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb79131-6db3-40be-16b8-08df1438f33c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 21:24:54.3672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4cGjh5zqptHdhk9LDWPPBIkTDcY5c6+vx8H91NdvjZeTZR6WYmlw7Jj65cFp/dc0KcLjrotjW4LKi3S1lIL9iNyET42KtgmaE3OGgzbPUbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB638815
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


Changes look good as before. Went through the compression logic and calls again
to be sure.

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>


