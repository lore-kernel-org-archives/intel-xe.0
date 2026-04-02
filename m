Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F92111224B
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 01:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AC010E08B;
	Thu,  2 Apr 2026 01:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKfmjyF4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF45810E08B
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 01:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775092862; x=1806628862;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=W720/zjNfL1gtlr658KzDSyjC3Qt8hTgFjCd3YC+ZpA=;
 b=bKfmjyF4fOpvp9Q//dYzIHm/WWqlFHhBcAoAL9InXtNStQgJMtxMi6Zi
 b4iA3+5mCDireNqxkmcDxz4g8eV3Evnm+mBAwiDEuFUYUsTSo5kVidfSK
 Wk2uA2uGwTciufDW0KlCIa9oO1fVomjPw9IQpTtdC1JFrWW2FfEstquFb
 aflngwG+/LxwLcBQHWLeC60ZH/3nrMxVkTHoSIwirlN9BnMJPWJ0GBl37
 1cjVd4jq6iJXz3SRpjVYOuQSE6B8aIewmRnlLrbSxP+nghWRiZaWgtriL
 K8WrK1Bpw5Tc9Qr49w8XOujr/UStvXMtJHlM6RaiGhbzfw0ElQI/e90wH g==;
X-CSE-ConnectionGUID: 7xUQY6zgQFiliE7mmMD5ww==
X-CSE-MsgGUID: J3NfsyojRK2FGVeYFss1lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="86449106"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="86449106"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 18:21:01 -0700
X-CSE-ConnectionGUID: Vctv6MjrTFO+XFgtNIVfYw==
X-CSE-MsgGUID: 1jftp/LJTXGBSBUWl3YVMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="221989752"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 18:21:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 18:21:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 18:21:00 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 18:20:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dcbYo8ifbGOwkY+AcpzgFOGYdqh97/aaQ8VgLmuzSC+CKf936ZEpIshbtjC++UL99WBDMHnzuRCgvwYB0WMNlKK8jI04SZWdWsbGnKgwugILMk5tQ5Z8H285l8V+PZPNiar2lm1p48UrHObQfj+j8QrgTvo84wO0mbtHmhlyCEfdONz65LGY4dlEvanDuiI4upFhotZHi0RsimTIzAChgyJq4ibpiT51ix0kRZAAjuDemqDXZSr91JtjFGrMRHGZVUeQZADnjkoz9K6ozWrM/PRUAu7HeKChT24lfqrxaSSEoM0wksiJZ8gRAquC+uD1fKAlabYbyHrZ1zwfFFEXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSQNuckwDv+FQMUDks0UM3OsrjQ4O+cDXKSCua2A45U=;
 b=YfWJ+Vvy7lnPWuKmrON1VENUGRBlvHLANnqzddqxEqHZJRCyBDpXLkDkrsQ7aexEVAzkZJZI26Z7AUgXux3u2ARo4hWN9xLXT8gexlUmKb4Ktw/GHCHmboJ/5cT+FYRIhGJgTMrOoF4WAk/p4jCfDNad3v0bG4vZg7hmm4Qs87OGPNd8aNJOSCChIlJIeM5FKZ5kEt0uasG0/zao7VaewED5jxhaFAGqqb6ki+L+S8O78FM+js3fOiRHpvj8z4s1a0FHpNE3Sa1aYENoJpLWGVFmNGob8uyjMYTDuOw2jH6HiCZUiEtgfxR74qScyJQHrgmBRetAO5iT8CzGEcvJbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA3PR11MB7536.namprd11.prod.outlook.com (2603:10b6:806:320::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 01:20:54 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 01:20:54 +0000
Date: Wed, 1 Apr 2026 18:20:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe/mm: add XE MEM POOL manager with shadow
 support
Message-ID: <ac3Ecs78HOF+8j+/@gsse-cloud1.jf.intel.com>
References: <20260401161528.1990499-1-satyanarayana.k.v.p@intel.com>
 <20260401161528.1990499-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260401161528.1990499-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR03CA0342.namprd03.prod.outlook.com
 (2603:10b6:303:dc::17) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA3PR11MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bdd032a-636c-4b4b-0b7f-08de905615d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: V2KcKq4+80WWhBfQT46fOE4FdD07R3rg9qXnVhKVKJJ87BrH2rSP1WQwTAq84UTi9hhFvendMg+j6I/owmsSU7/+V+9jiQfexe7reX8/58tk3R5I5Y0YgPzxM5Cjo0cLyBuJd2H3Yjy5F82u2lFZz3Pbz2/NCjsVR2WygMDUd984Nj57mSci1h5AMG3OcUPxkrXmoIvLshOAjNZFxcYqTirSS+8fq4zGAe/mihn5+UUdSA+2rRbQ1gsweSYoPmiorbCUyFoF+Pr+oVIsCBR6eDrFy5eeyFv+gAzCdT2/P7ShaGeZqdY6d4bc8aD1+pzbiLKDc4Ph66TFSdtuksU4PJZreTIMKIP6UyJz6obGUpijTjuyapBmmxUoOKdWDg/aiQKnSTIBb+kBB+jus825HYzL/C4KOC8hGVjlshbJzN+Nyjv+5NEPPpVQT7vVVCXK5mz+0s07NOrSxPy/+R7VRGJ+RTgc38qx81+rNQzj0xa7cIqKCJVuf0pCW2IIL0vJjr1+U3ENyf8Y2CsAgWtYTpH3sbQE5ql4/xz5MYGZ8UhR57wrvvWOV146JhmgPopBz5Oo/Nc7qjt+R/EI8zJ7bReZb6ta8FXIWdzFlmAdRpJALk5t6uB7cEJati6gEi3JUQIz2UObWmD4RINpvt1Fgsdc7RxLETBzYp9+s35sYTHKlA3qUXsUfPeZGmDpubnZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXBuRWFBN2pPMHlPWm5TblNaT0dieG1DY2hzdWNHbGhtaG11UGRtQUthNDhQ?=
 =?utf-8?B?SHNpK05jMjBNNjY0eCtMYVV1Q0hUN1kwcmZZYUJNbFkzUm5xSFVTNGlMTWwx?=
 =?utf-8?B?WUxDdldCeHNjN2EyTWI2eVlRcnE1YUFvelJ1eW1UYndENFp2SUZ2SytzMHcz?=
 =?utf-8?B?Um9TMjlacS9BUjU1UmF4QWhBeDlHb3FwVlJ0SWhuSWh0cDBnamNiNlRubVdP?=
 =?utf-8?B?eFBBN3ExVU5uVHZXUzB5RXdHb0RGdkdGVWxQU2d4M2g0cEFlUjhZcy9XVTNS?=
 =?utf-8?B?bDBpZUFiY3RwZWltd0hpYXJRdzE4MFJRdkZlYm1zUHFUSGpuOVFTaFJ5YmF3?=
 =?utf-8?B?SnRCM3F2QTdjdEpObkd6bG41YUFlMzEvelNuVExjcElIVTdlL05NYnErMmpF?=
 =?utf-8?B?OTh6UTBvSHhxZk9URjN3Q2JJN2h5UmZzdCs0bXBxNzZLckxTQk1VL0p3QUlt?=
 =?utf-8?B?VGg3RW5iRksvVEFxczJnR2ltQTBjMWZnMVhIVER4czgrUVRMK0JvT2VOWTBG?=
 =?utf-8?B?MHBJTmlFSnB5UVBSMjZ0RGN4RGZpaUZkRFNoT04rY21mNDY2VkFoSHVOaUp6?=
 =?utf-8?B?RGNIZlMzT3lhcGxYUHpDOFFvUmlHSHluTnc1OXlzck9HRnRIQVEzWmJMeU5P?=
 =?utf-8?B?ekV2RjBjTXZpOUt1QncyMFAzdGhobUJQT1FPZUhUaU9YZGRBdnhTVTF1a2Za?=
 =?utf-8?B?c0tqRFBqc1czSmpDRXVjazdTSFgzZWFSNlFFcDB6TTQvaFRHTFM1YnRZUUxa?=
 =?utf-8?B?Y0ZZTGRacW1JaSt2ZU11SERLUmg4WWtiN1VuaTF0Tkx4V1l4czBTeldlNkt1?=
 =?utf-8?B?am0xdzhFSGh2bkhvejVSWlBPbnV1cXcwK2w2Q082L3ZBckFEVzZEU0Z1QVE2?=
 =?utf-8?B?L1l2WFptbXBORXVDcE9HKzlMMXRYY1JGYnVFb0k1c1FsVjQ4dFk4WWRVaE5J?=
 =?utf-8?B?TjR3Z1NldlpudUtVMFVJbXJYTHNTWTN1TFFxZ0JxUmxIUFdwVVdTRmVjemV1?=
 =?utf-8?B?NFVvUWpDMDlST21RWGFraFNDUzhRL21IR0Vrdk55RW5EbEE5ak5TdTNpMjhh?=
 =?utf-8?B?MHM1OE43R0VSa1VSQ0lCUGE2SC85a1puczhRdUdHMnJPRmlCQlpyUmdNMHdB?=
 =?utf-8?B?RWdWQzVxaVJaU2lsQUhZczk0LzNvejBFWnY4U2kvZjFaeDQxU0F6b2RYZjgz?=
 =?utf-8?B?WlpVTUpPekJwbVp5RW5MZjNPOGxSN1U1M081NjBjNGpnaEFteVBlcDFHSkh1?=
 =?utf-8?B?Q25rejdSOWZKYVlaazJLUjhCRVZ2cmpOOGxkTXppYWxhTXpZcVVzdFA4RnZi?=
 =?utf-8?B?WXpPbnFNNFJlSG10ZDRTN0Rka3pRT2psVGFiSlRsU2FxOWp2VjlsSHdtZGcw?=
 =?utf-8?B?cTBSaExVTWU2Y2NwdXo4dEVqVzJJalFCdDUwN09pYzIxT3BlSjFUcTBveDBr?=
 =?utf-8?B?blByZm1WbGMxNXAxMUxEUVpRWjFnTnMvMUhEYkdLQmQ3S2hmd0FpWVFTalVG?=
 =?utf-8?B?dTR0c0RLd3lFcG5TK1VyY1NWRndCaEg3b2N2Z3crMll2bEpjS2tlZjFRTGNC?=
 =?utf-8?B?ZCtnbnhkeTF0cXVKZmZqZ2szM2VuRDJVQytEOERLLy8rdEpIUGtYamNxMTdN?=
 =?utf-8?B?K3o5MHZnS3hFZGtvOUJNcEc2VkFzNEtkcGpUTTZnR1dYY3ZUeUZMSEF5dzRq?=
 =?utf-8?B?NFhacllTWi9ENVBmcm5sQ2V6dVFtSmRQSWhEWjlzYXJMaC8wUjQ5WWozeE9W?=
 =?utf-8?B?V1VxN0lEY3FneDJjcG42L3VscE9PR0o1WUpJam96SFFjUUJnMzZlZGRlSitl?=
 =?utf-8?B?NmZ0OEduUXdrb3BFem8yT0tjd0lvVWdzV3VtY2Q0ZFFXdEtFQVErRVk3a2xH?=
 =?utf-8?B?K002aDl2d2lpVkRpb1NnVnAyUFEwTHRkdXRCcVVRalhsMmw2ZGtlK2wyS1l0?=
 =?utf-8?B?cDVXSVNZV1pzWXZCclpNQ1UzRG1RNE1IWEwyQ3NSa251UnRTNnFNNllPcU9y?=
 =?utf-8?B?TndxZ2lVZENnUzYxdkg1WS82SzJXWnRoREMydXVmeU04am1aMThTV1paMGlv?=
 =?utf-8?B?WnJ2TEJpSHk0OWZWaER3VHJRcVVZZlArUGhPRkZhMGtjdU5tMHhmU3dxK0I3?=
 =?utf-8?B?amFqTm8rcDhUMkJsZld6SHJYUU1OVEM3RnplajkyclVJQlMzbHBHTUgwUzJa?=
 =?utf-8?B?VGJCLzhBMmNRN056aW0vdGwyTTNSWXRONWFnVWFDUmRJUWR1akY3VTR0T0hE?=
 =?utf-8?B?dlBtMmdwRFBmTTZMa0Q2U21yd0sxYnNkYWNwZ3FQcW9salMyOWp1NG9VNjdC?=
 =?utf-8?B?OWNzMEtPdjJaUkg0dWVmaEJrTENjcENZaEpsa1VlQlFyMG56Qll4NWswaVM5?=
 =?utf-8?Q?ApzYtXthfuthZUcI=3D?=
X-Exchange-RoutingPolicyChecked: o85MNDF9IrsOxVUEFV5GNF3OdTnlO+JbFIQGvzZyI9ZvvPcBAzXtxTgTINAAi0wQD0aSrbaMRae9gBJfDk6qo5EJx0K0wRreotiU9zSjkZrWn6xzzsAiUTbEhRrdVii7PMX4MH2YkQl6hWbXb0XLwhZYigyI0CPHD6ZMSx/0OsvlieLamY4nFMALFb87fksD2wiDTU3GDd/JAkoC4tLfeTdbO4+kwir718bcW79sln6aPDmmbvuh1WU4eVOA4fDfkW+97Jt+LNtu4COn4nxODSj1c9lX+GZWkiRym5WUzTVeidY33NyOTnk0WhviIKEYLSbD1NV3c1pZNrAaCH83yA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdd032a-636c-4b4b-0b7f-08de905615d9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 01:20:54.4714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYJp6anlk9uJHdbjC6J6hAS/9776ijTEGRvmN5hAm6UlUugyBqn3p5SrqBMygix+KnZDmkcbs/f+pHuFDVe4Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7536
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

On Wed, Apr 01, 2026 at 04:15:26PM +0000, Satyanarayana K V P wrote:
> Add a xe_mem_pool manager to allocate sub-ranges from a BO-backed pool
> using drm_mm.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> ---
> V2 -> V3:
> - Renamed xe_mm_suballoc to xe_mem_pool_manager.
> - Splitted xe_mm_suballoc_manager_init() into xe_mem_pool_init() and
> xe_mem_pool_shadow_init() (Michal)
> - Made xe_mm_sa_manager structure private. (Matt)
> - Introduced init flags to initialize allocated pools.
> 
> V1 -> V2:
> - Renamed xe_drm_mm to xe_mm_suballoc (Thomas)
> - Removed memset during manager init and insert (Matt)
> ---
>  drivers/gpu/drm/xe/Makefile            |   1 +
>  drivers/gpu/drm/xe/xe_mem_pool.c       | 379 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_mem_pool.h       |  33 +++
>  drivers/gpu/drm/xe/xe_mem_pool_types.h |  30 ++
>  4 files changed, 443 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_mem_pool.c
>  create mode 100644 drivers/gpu/drm/xe/xe_mem_pool.h
>  create mode 100644 drivers/gpu/drm/xe/xe_mem_pool_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 9dacb0579a7d..8e31b14239ec 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -88,6 +88,7 @@ xe-y += xe_bb.o \
>  	xe_irq.o \
>  	xe_late_bind_fw.o \
>  	xe_lrc.o \
> +	xe_mem_pool.o \
>  	xe_migrate.o \
>  	xe_mmio.o \
>  	xe_mmio_gem.o \
> diff --git a/drivers/gpu/drm/xe/xe_mem_pool.c b/drivers/gpu/drm/xe/xe_mem_pool.c
> new file mode 100644
> index 000000000000..335a70876bf1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_mem_pool.c
> @@ -0,0 +1,379 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/kernel.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "instructions/xe_mi_commands.h"
> +#include "xe_bo.h"
> +#include "xe_device_types.h"
> +#include "xe_map.h"
> +#include "xe_mem_pool.h"
> +#include "xe_mem_pool_types.h"
> +
> +/**
> + * struct xe_mem_pool_manager - Memory Suballoc manager.
> + */
> +
> +struct xe_mem_pool_manager {
> +	/** @base: Range allocator over [0, @size) in bytes */
> +	struct drm_mm base;
> +	/** @bo: Active pool BO (GGTT-pinned, CPU-mapped). */
> +	struct xe_bo *bo;
> +	/** @shadow: Shadow BO for atomic command updates. */
> +	struct xe_bo *shadow;
> +	/** @swap_guard: Timeline guard updating @bo and @shadow */
> +	struct mutex swap_guard;
> +	/** @cpu_addr: CPU virtual address of the active BO. */
> +	void *cpu_addr;
> +	/** @resv_alloc: Reserved allocation. */
> +	struct drm_mm_node *resv_alloc;
> +	/** @size: Total size of the managed address space. */
> +	u64 size;
> +};
> +
> +static void xe_mem_pool_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_mem_pool_manager *pool_manager = arg;
> +
> +	drm_mm_takedown(&pool_manager->base);

CI [1] doesn't like this takedown for whatever reason...

[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/bat-ptl-vm/igt@core_hotunplug@unbind-rebind.html

It is likely pool_manager->resv_alloc needs to be called before drm_mm_takedown.

> +
> +	if (pool_manager->resv_alloc) {
> +		drm_mm_remove_node(pool_manager->resv_alloc);
> +		kfree(pool_manager->resv_alloc);
> +	}
> +
> +	if (pool_manager->bo->vmap.is_iomem)
> +		kvfree(pool_manager->cpu_addr);
> +
> +	pool_manager->bo = NULL;
> +	pool_manager->shadow = NULL;
> +}
> +
> +static int xe_mem_pool_init_flags(struct xe_mem_pool_manager *mm_pool, u32 size, int flags)
> +{
> +	struct xe_bo *bo = mm_pool->bo;
> +	struct drm_mm_node *node;
> +	struct xe_device *xe;
> +	u32 initializer;
> +	int err;
> +
> +	if (!flags)
> +		return 0;
> +
> +	if (flags & XE_MEM_POOL_BO_FLAG_INIT_ZERO_FILL)
> +		initializer = 0;
> +	else if (flags & XE_MEM_POOL_BO_FLAG_INIT_CMD_NOOP ||
> +		 flags & XE_MEM_POOL_BO_FLAG_INIT_CMD_BB_END_HIGHEST)
> +		initializer = MI_NOOP;
> +	else
> +		return -EINVAL;
> +
> +	xe = tile_to_xe(bo->tile);
> +	if (flags & XE_MEM_POOL_BO_FLAG_INIT_SHADOW_COPY) {
> +		bo = mm_pool->shadow;
> +		xe_map_memset(xe, &bo->vmap, 0, initializer, size);
> +
> +		node = mm_pool->resv_alloc;
> +		xe_map_memcpy_to(xe, &mm_pool->shadow->vmap,
> +				 node->start,
> +				 mm_pool->cpu_addr + node->start,
> +				 node->size);
> +		return 0;
> +	}
> +
> +	xe_map_memset(xe, &bo->vmap, 0, initializer, size);
> +
> +	if (flags & XE_MEM_POOL_BO_FLAG_INIT_CMD_BB_END_HIGHEST) {
> +		node = kzalloc_obj(*node);
> +		if (!node)
> +			return -ENOMEM;
> +
> +		err = drm_mm_insert_node_in_range(&mm_pool->base, node, SZ_4,
> +						  0, 0, 0, size, DRM_MM_INSERT_HIGHEST);
> +		if (err) {
> +			kfree(node);
> +			return err;
> +		}
> +		xe_map_wr(xe, &mm_pool->bo->vmap, node->start, u32, MI_BATCH_BUFFER_END);
> +		mm_pool->resv_alloc = node;
> +	}

I thought my suggestion was let the caller own setting of the memory contents?

Also I corrected myself that you don't actually need node here either [1]. Search for 'Isn’t this what you were'...


[1] https://patchwork.freedesktop.org/patch/713119/?series=163588&rev=1#comment_1315911

> +	return 0;
> +}
> +
> +/**
> + * xe_mem_pool_init() - Initialize a DRM MM pool.
> + * @tile: the &xe_tile where allocate.
> + * @size: number of bytes to allocate.
> + * @flags: flags to use for BO creation.
> + *
> + * Initializes a DRM MM manager for managing memory allocations on a specific
> + * XE tile. The function allocates a buffer object to back the memory region
> + * managed by the DRM MM manager.
> + *
> + * Return: a pointer to the &xe_mem_pool_manager, or an error pointer on failure.
> + */
> +struct xe_mem_pool_manager *xe_mem_pool_init(struct xe_tile *tile, u32 size, int flags)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_mem_pool_manager *pool_manager;
> +	struct xe_bo *bo;
> +	int ret;
> +
> +	pool_manager = drmm_kzalloc(&xe->drm, sizeof(*pool_manager), GFP_KERNEL);
> +	if (!pool_manager)
> +		return ERR_PTR(-ENOMEM);
> +
> +	bo = xe_managed_bo_create_pin_map(xe, tile, size,
> +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					  XE_BO_FLAG_GGTT |
> +					  XE_BO_FLAG_GGTT_INVALIDATE |
> +					  XE_BO_FLAG_PINNED_NORESTORE);
> +	if (IS_ERR(bo)) {
> +		drm_err(&xe->drm, "Failed to prepare %uKiB BO for DRM MM manager (%pe)\n",
> +			size / SZ_1K, bo);
> +		return ERR_CAST(bo);
> +	}
> +	pool_manager->bo = bo;
> +	pool_manager->size = size;
> +
> +	if (bo->vmap.is_iomem) {
> +		pool_manager->cpu_addr = kvzalloc(size, GFP_KERNEL);
> +		if (!pool_manager->cpu_addr)
> +			return ERR_PTR(-ENOMEM);
> +	} else {
> +		pool_manager->cpu_addr = bo->vmap.vaddr;
> +	}
> +
> +	drm_mm_init(&pool_manager->base, 0, size);
> +	ret = drmm_add_action_or_reset(&xe->drm, xe_mem_pool_fini, pool_manager);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret = xe_mem_pool_init_flags(pool_manager, size, flags);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return pool_manager;
> +}
> +
> +/**
> + * xe_mem_pool_shadow_init() - Initialize the shadow BO for a DRM MM manager.
> + * @pool_manager: the DRM MM manager to initialize the shadow BO for.
> + * @flags: flags to use for BO creation.
> + *
> + * Initializes the shadow buffer object for the specified DRM MM manager. The
> + * shadow BO is used for atomic command updates and is created with the same
> + * size and properties as the primary BO.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int xe_mem_pool_shadow_init(struct xe_mem_pool_manager *pool_manager, int flags)

I'm not so sure about two init functions... Was that Michal's
suggestion? I can't say I agree... One init call with shadow flag makes
more sense to me. 

> +{
> +	struct xe_tile *tile = pool_manager->bo->tile;
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_bo *shadow;
> +	int ret;
> +
> +	xe_assert(xe, !pool_manager->shadow);
> +
> +	ret = drmm_mutex_init(&xe->drm, &pool_manager->swap_guard);
> +	if (ret)
> +		return ret;
> +
> +	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> +		fs_reclaim_acquire(GFP_KERNEL);
> +		might_lock(&pool_manager->swap_guard);
> +		fs_reclaim_release(GFP_KERNEL);
> +	}
> +	shadow = xe_managed_bo_create_pin_map(xe, tile, pool_manager->size,
> +					      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					      XE_BO_FLAG_GGTT |
> +					      XE_BO_FLAG_GGTT_INVALIDATE |
> +					      XE_BO_FLAG_PINNED_NORESTORE);
> +	if (IS_ERR(shadow))
> +		return PTR_ERR(shadow);
> +
> +	pool_manager->shadow = shadow;
> +
> +	ret = xe_mem_pool_init_flags(pool_manager, pool_manager->size,
> +				     flags | XE_MEM_POOL_BO_FLAG_INIT_SHADOW_COPY);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_mem_pool_swap_shadow_locked() - Swap the primary BO with the shadow BO.
> + * @pool_manager: the DRM MM manager containing the primary and shadow BOs.
> + *
> + * Swaps the primary buffer object with the shadow buffer object in the DRM MM
> + * manager. This function must be called with the swap_guard mutex held to
> + * ensure synchronization with any concurrent operations that may be accessing
> + * the BOs.
> + *
> + * Return: None.
> + */
> +void xe_mem_pool_swap_shadow_locked(struct xe_mem_pool_manager *pool_manager)
> +{
> +	struct xe_tile *tile = pool_manager->bo->tile;
> +
> +	xe_tile_assert(tile, pool_manager->shadow);
> +	lockdep_assert_held(&pool_manager->swap_guard);
> +
> +	swap(pool_manager->bo, pool_manager->shadow);
> +	if (!pool_manager->bo->vmap.is_iomem)
> +		pool_manager->cpu_addr = pool_manager->bo->vmap.vaddr;
> +}
> +
> +/**
> + * xe_mem_pool_sync_shadow_locked() - Synchronize the shadow BO with the primary BO.
> + * @pool_manager: the DRM MM manager containing the primary and shadow BOs.
> + * @node: the DRM MM node representing the region to synchronize.
> + *
> + * Copies the contents of the specified region from the primary buffer object to
> + * the shadow buffer object in the DRM MM manager.
> + * Swap_guard must be held to ensure synchronization with any concurrent swap
> + * operations.
> + *
> + * Return: None.
> + */
> +void xe_mem_pool_sync_shadow_locked(struct xe_mem_pool_manager *pool_manager,
> +				    struct drm_mm_node *node)

s/struct drm_mm_node/struct xe_mem_pool_bb as the argument?

> +{
> +	struct xe_tile *tile = pool_manager->bo->tile;
> +	struct xe_device *xe = tile_to_xe(tile);
> +
> +	xe_tile_assert(tile, pool_manager->shadow);
> +	lockdep_assert_held(&pool_manager->swap_guard);
> +
> +	xe_map_memcpy_to(xe, &pool_manager->shadow->vmap,
> +			 node->start,
> +			 pool_manager->cpu_addr + node->start,
> +			 node->size);
> +}
> +
> +/**
> + * xe_mem_pool_insert_node() - Insert a node into the DRM MM manager.
> + * @pool_manager: the DRM MM manager to insert the node into.
> + * @node: the DRM MM node to insert.
> + * @size: the size of the node to insert.
> + *
> + * Inserts a node into the DRM MM manager and clears the corresponding memory region
> + * in both the primary and shadow buffer objects.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int xe_mem_pool_insert_node(struct xe_mem_pool_manager *pool_manager,
> +			    struct drm_mm_node *node, u32 size)

s/struct drm_mm_node/struct xe_mem_pool_bb as the argument?

> +{
> +	struct drm_mm *mm = &pool_manager->base;
> +	int ret;
> +
> +	ret = drm_mm_insert_node(mm, node, size);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_mem_pool_remove_node() - Remove a node from the DRM MM manager.
> + * @node: the DRM MM node to remove.
> + *
> + * Return: None.
> + */
> +void xe_mem_pool_remove_node(struct drm_mm_node *node)
> +{

s/struct drm_mm_node/struct xe_mem_pool_bb as the argument?

> +	return drm_mm_remove_node(node);
> +}
> +
> +/**
> + * xe_mem_pool_manager_gpu_addr() - Retrieve GPU address of BO within a memory manager.
> + * @pool_manager: The DRM MM memory manager.
> + *
> + * Returns: GGTT address of the back storage BO
> + */
> +u64 xe_mem_pool_manager_gpu_addr(struct xe_mem_pool_manager *pool_manager)
> +{
> +	return xe_bo_ggtt_addr(pool_manager->bo);
> +}
> +
> +/**
> + * xe_mem_pool_manager_cpu_addr() - Retrieve CPU address of BO within a memory manager.
> + * @pool_manager: The DRM MM memory manager.
> + *
> + * Returns: CPU virtual address of BO.
> + */
> +void *xe_mem_pool_manager_cpu_addr(struct xe_mem_pool_manager *pool_manager)
> +{
> +	return pool_manager->cpu_addr;
> +}
> +
> +/**
> + * xe_mem_pool_bo_swap_guard() - Retrieve the mutex used to guard swap operations
> + * on a memory manager.
> + * @pool_manager: The DRM MM memory manager.
> + *
> + * Returns: Swap guard mutex.
> + */
> +struct mutex *xe_mem_pool_bo_swap_guard(struct xe_mem_pool_manager *pool_manager)
> +{
> +	return &pool_manager->swap_guard;
> +}
> +
> +/**
> + * xe_mem_pool_dump() - Dump the state of the DRM MM manager for debugging.
> + * @pool_manager: The DRM MM manager to dump.
> + * @p: The DRM printer to use for output.
> + *
> + * Returns: None.
> + */
> +void xe_mem_pool_dump(struct xe_mem_pool_manager *pool_manager, struct drm_printer *p)
> +{
> +	drm_mm_print(&pool_manager->base, p);
> +}
> +
> +static inline struct xe_mem_pool_manager *to_xe_mem_pool_manager(struct drm_mm *mng)
> +{
> +	return container_of(mng, struct xe_mem_pool_manager, base);
> +}
> +
> +/**
> + * xe_mem_pool_bo_flush_write() - Copy the data from the sub-allocation
> + * to the GPU memory.
> + * @node: the &drm_mm_node to flush
> + */
> +void xe_mem_pool_bo_flush_write(struct drm_mm_node *node)

s/struct drm_mm_node/struct xe_mem_pool_bb as the argument?

> +{
> +	struct xe_mem_pool_manager *pool_manager = to_xe_mem_pool_manager(node->mm);
> +	struct xe_device *xe = tile_to_xe(pool_manager->bo->tile);
> +
> +	if (!pool_manager->bo->vmap.is_iomem)
> +		return;
> +
> +	xe_map_memcpy_to(xe, &pool_manager->bo->vmap, node->start,
> +			 pool_manager->cpu_addr + node->start,
> +			 node->size);
> +}
> +
> +/**
> + * xe_mem_pool_bo_sync_read() - Copy the data from GPU memory to the
> + * sub-allocation.
> + * @node: the &&drm_mm_node to sync
> + */
> +void xe_mem_pool_bo_sync_read(struct drm_mm_node *node)
> +{

s/struct drm_mm_node/struct xe_mem_pool_bb as the argument?

Matt

> +	struct xe_mem_pool_manager *pool_manager = to_xe_mem_pool_manager(node->mm);
> +	struct xe_device *xe = tile_to_xe(pool_manager->bo->tile);
> +
> +	if (!pool_manager->bo->vmap.is_iomem)
> +		return;
> +
> +	xe_map_memcpy_from(xe, pool_manager->cpu_addr + node->start,
> +			   &pool_manager->bo->vmap, node->start, node->size);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_mem_pool.h b/drivers/gpu/drm/xe/xe_mem_pool.h
> new file mode 100644
> index 000000000000..f9c5d1e56dd9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_mem_pool.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#ifndef _XE_MEM_POOL_H_
> +#define _XE_MEM_POOL_H_
> +
> +#include <linux/sizes.h>
> +#include <linux/types.h>
> +
> +#include "drm/drm_mm.h"
> +#include "xe_mem_pool_types.h"
> +
> +struct drm_printer;
> +struct xe_mem_pool_manager;
> +struct xe_tile;
> +
> +struct xe_mem_pool_manager *xe_mem_pool_init(struct xe_tile *tile, u32 size, int flags);
> +int xe_mem_pool_shadow_init(struct xe_mem_pool_manager *drm_mm_manager, int flags);
> +void xe_mem_pool_swap_shadow_locked(struct xe_mem_pool_manager *drm_mm_manager);
> +void xe_mem_pool_sync_shadow_locked(struct xe_mem_pool_manager *drm_mm_manager,
> +				    struct drm_mm_node *node);
> +int xe_mem_pool_insert_node(struct xe_mem_pool_manager *drm_mm_manager,
> +			    struct drm_mm_node *node, u32 size);
> +void xe_mem_pool_remove_node(struct drm_mm_node *node);
> +u64 xe_mem_pool_manager_gpu_addr(struct xe_mem_pool_manager *drm_mm_manager);
> +void *xe_mem_pool_manager_cpu_addr(struct xe_mem_pool_manager *mm_manager);
> +struct mutex *xe_mem_pool_bo_swap_guard(struct xe_mem_pool_manager *drm_mm_manager);
> +void xe_mem_pool_dump(struct xe_mem_pool_manager *mm_manager, struct drm_printer *p);
> +void xe_mem_pool_bo_flush_write(struct drm_mm_node *node);
> +void xe_mem_pool_bo_sync_read(struct drm_mm_node *node);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_mem_pool_types.h b/drivers/gpu/drm/xe/xe_mem_pool_types.h
> new file mode 100644
> index 000000000000..bae7706aa8d2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_mem_pool_types.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_MEM_POOL_TYPES_H_
> +#define _XE_MEM_POOL_TYPES_H_
> +
> +#include <drm/drm_mm.h>
> +
> +struct xe_mem_pool_manager;
> +
> +#define XE_MEM_POOL_BO_FLAG_INIT_ZERO_FILL			BIT(0)
> +#define XE_MEM_POOL_BO_FLAG_INIT_CMD_NOOP			BIT(1)
> +#define XE_MEM_POOL_BO_FLAG_INIT_CMD_BB_END_HIGHEST		BIT(2)
> +#define XE_MEM_POOL_BO_FLAG_INIT_SHADOW_COPY			BIT(3)
> +
> +/**
> + * struct xe_mem_pool_bb - Sub allocated batch buffer from mem pool.
> + */
> +struct xe_mem_pool_bb {
> +	/** @node: Range node for this batch buffer. */
> +	struct drm_mm_node node;
> +	/** @cs: Command stream for this batch buffer. */
> +	u32 *cs;
> +	/** @len: Length of the CS in dwords. */
> +	u32 len;
> +};
> +
> +#endif
> -- 
> 2.43.0
> 
