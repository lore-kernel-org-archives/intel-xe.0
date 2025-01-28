Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15207C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 23:38:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B289E10E27B;
	Tue, 28 Jan 2025 23:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fS4tMTpG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E616910E27B
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 23:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738107484; x=1769643484;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CdwR2+98WBWutFy/MB4Qu8tvZXTxgSOdaa5ZT/ahDaU=;
 b=fS4tMTpGEj/6wWmnCRAKYS5tX+GbGCdq2atlV8FRE1B8Iyu1bxPa1asS
 6CdjCJz9LB/u3UIe5SVvWr8gHzPJrZm3s+ZKPwwSOW81JsuHkotFTP67e
 MEvgvU1Yq9ZOMhma5ejt9t69JyOchGNFCWEcZaphfEyEGzvedVUATrl9j
 I1Dsk7n93iWRRFQOChTQnHK+HzrvLBqYfGeGLeJASDc8+VH1w6uBNgXuz
 EYOEyIxybvNlMGZWjioTbrEmKewIIgvLkpbn4Ek+YGJUEi/CH3IaojM0d
 NKX4u97Vw0GLWhY2T2nUDjNdbn/8e013KIWdcrncO1H8qAwEQeDFEnBIw A==;
X-CSE-ConnectionGUID: vkMS9ohJT0Oid0erwM0hkQ==
X-CSE-MsgGUID: JETeW/GISuuyY9YAZvoz5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42365019"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="42365019"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 15:38:04 -0800
X-CSE-ConnectionGUID: ddzZR+whRnOh1xoRePo9TA==
X-CSE-MsgGUID: N8PKKyH8RWqIXyDexE9ehw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109325469"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 15:38:04 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 15:38:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 15:38:03 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 15:38:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3SM1ZBYAZmb8fVK1JOpbXiNuXBFj5bhCsa7GWW5xeti0pevr5+xTn7goZSZUc2DvjBw9bsRvuWUPFrMe09vtb+WXYweN6wn3FTtAzfu/co2Y1wYjOj4izWs1rmvjIueSkJuqvo/XMqdCJ/2a2t75mPjtL4i/nZi9PgDAnU5rOTtAZetrRc2ptEM551JfndOqslvJAAKJMkZTX+/zUDKviPxUbMZ5uEkCMv+UsWemg3JViGA3+Nz3ACPQM0zDivhvX3BHtEKzHsJRUuB0jjRsICPvDQDQfAWB6SRVYHrjY2cMpzgWljM/2ii2tObXcljNv0LHC0nPahsQXWs6osisg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwL+CwtvT88Son/DIbDZYX5bOtFBY1p6ITSuEX9yw08=;
 b=FC8kR4N7DgQK51H0FETMy7Tk3lIl7bJanfFncPoOgKs44wCwqrdZywacaxNdVetgfgQ+O2cvhE3TzRJdjtzvREpF81bmWq8/dF1ItIrnPrD9Ec5651Do5QcI89VO5OPRo4FkRiBJ3XfoFPOAn6SfFp+9C94GOzDydPN/6Nlhpd+E5LopExYRiLkAWPfFXZ6CZLOtoK1L3MN4EySRfypWQro5RG0TCfiHLDU7lnfB6Z+RcF80r8puNgnSMInMchb+vkajzur8B3l8kA9Xp6aMMCJaWQi9ysTAjH2WSZ35pNKHpOrwyT5RgseR7NukozDc8r1dRETx43JdcRtjPJUSWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5245.namprd11.prod.outlook.com (2603:10b6:5:388::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 23:37:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 23:37:34 +0000
Date: Tue, 28 Jan 2025 15:38:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <joonas.lahtinen@linux.intel.com>,
 <Thomas.Hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Add a function to zap page table by address
 range
Message-ID: <Z5lqdWe/TK4O2uV/@lstrano-desk.jf.intel.com>
References: <20250128222145.3849874-1-oak.zeng@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250128222145.3849874-1-oak.zeng@intel.com>
X-ClientProxiedBy: MW4PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:303:dc::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5245:EE_
X-MS-Office365-Filtering-Correlation-Id: f7296564-05e3-401e-c333-08dd3ff4bd57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkJLd2JKQXh1UlRlSStGd3JGRC9tbVhkK29GeUd4aStodGdhZHhpdjNVN1ZE?=
 =?utf-8?B?WWl5bTVYTkl5UHplYWhIVUozbXV4Rng3cDZ4a3hpRWpDTnMrY1U1UVl4U3dR?=
 =?utf-8?B?WHpTTVd5d01OcjZ4WWZKWEFLaTVHbFRjRDFDZlV3ZjFVM0dYVWxLODNUd0JS?=
 =?utf-8?B?eXU5WkNDbDgyWS9kdkxnUU5WS3VhTmNZd2NmdUdEaFRucHcvZFFFNlJPT2xF?=
 =?utf-8?B?SGpZVlcvTHY1OWVlNE95R1ozQlptWGRMNHRLelNkMDlLL0J5d2g0bmxibXZz?=
 =?utf-8?B?NWdneUszWkhOSlpDUk1hdnhQTHFCa0NFZ2FhNE5YS0MzTmJjeVduOWdzV3hG?=
 =?utf-8?B?V2RQZ3kzR3VvU1VRUWVvUFl0eUUyN28wclFiMkp5bFNNUis4TGhBb2pXQUds?=
 =?utf-8?B?Z0J2b05ZSzMzbEVoMlhwRFFxcXFEeE0vMWRxR0NubkFDalVBTmhEaWs5eHNN?=
 =?utf-8?B?NWhReEZNYVEyNmpqSzJzSlVlcGJNOVg3KzVGNVFWNEdJaXZrYnBhbTk5UnJj?=
 =?utf-8?B?dEhEdHZrR1pwYjhvK1o5aENZRU9ub1Y5NzNQYzNmVHlEd1RML1BVd1g4elhv?=
 =?utf-8?B?YzY1WWRQWG94c1Q3OHg4bjhYWlF4U1YycnQ2VmdRK2IyMUp5RytBYitmQ3Ey?=
 =?utf-8?B?b1k2WnQraThWQnBlZTV2K3B3dVNJdHFlWHNxZG13Q1JFd2lzMkpFVXlRTklo?=
 =?utf-8?B?TnAzSVdLdTFTTXhueVdweWRjRDlPQ1dFRjFBbWErV213WEdVT0hUSGg1YjJk?=
 =?utf-8?B?WjR3MzF6VjFORUhjNGRJNXd4UW9INkZTcnowWDRlWm1DMEwrd0VYcGl1L1l4?=
 =?utf-8?B?RS96OWNlZkM1TlBGSUpSVk5OZ2RES3ZLYW4xSjhFWG0xNk00T1Y5cmNvQnE4?=
 =?utf-8?B?SnR4UEdDcDV0YVhyRTNNclZxaW1lN0RyNm1sT1Z4REh1aCtGaCs4RkZiMmkw?=
 =?utf-8?B?d3FWbXc5dEVSYW8xNysxZFY4Qlh1QzQxRVBDQnR1ZmFEQ1pmS0ZBNCs2M2Z5?=
 =?utf-8?B?TWQvS0ZRUG9sZ3FMWDI4MGxhdDEwaWxMSWtBcnNBWlowaDV2Qmd6YmZWMmsv?=
 =?utf-8?B?MktCZVovL3ZPQzIvNGwxREY2aGhxMzh2cUhGWDRQRjZTQzhxZ0FXUlF4UUlU?=
 =?utf-8?B?K2FqdEN5bFhhSERHaW9KRGVvZEZmTUhGZHlXc21KU090T1FOU2FDd0Qyc1I0?=
 =?utf-8?B?eFQ4T1ZzODEyUHYzelNkdE1FN1JvKzZ0L3FzOWx0MFhWeG9yT0NoMDdQV0pu?=
 =?utf-8?B?SmgwYTh6TXE3OE9DSmhoZ0duMWE5ZjBpSnVhc2tlNzA3a1d3WW5oSEFrd0pD?=
 =?utf-8?B?NWtCbms2R2hzelV3aDhLMU9pemkydHRPRi9uMGd3STFLTHBiQStXYlFBSkcy?=
 =?utf-8?B?bmcvS3NET3dvUDRodGhhWUtqZnZ4bVdKRjNCZXhVdURtYW5Cc1ZZVzJQeHh1?=
 =?utf-8?B?WWJiMHlqenZVMVRqRmNTODE4dklCcG1CTkcwU1hXZXdCbnI5RkhNMkVCTTZS?=
 =?utf-8?B?Z2ozbS85aGR6TnZpWmZOeEhnQml1elJaS01oNFYyVWo3Rit1SkJ5eWozcFIv?=
 =?utf-8?B?Zml4UTQrUU13TTgyWnUvL0pLUWFHWG1Ia1pxRVg2RFpheEZPd01KckVySFZ3?=
 =?utf-8?B?dGYvMy9qNWZRQVZKK3IzZDlib3o1U0FLcWJ6WXNjVVlTaXdIYjlnREJyZGZS?=
 =?utf-8?B?My9tMHRFcU1UZS95V29DREI1NmQ0cVFJS25IckNTeFZvditMRHgraVlCTWNM?=
 =?utf-8?B?eG1uUzJQaHRvdjlrMHhmSUc2ZjdNVms1N0dmV0J3UW1GOFV0aThhRHpHSDFq?=
 =?utf-8?B?UXc4Ni9nUVh0M1d3OG5ySlNQTXh6cFFFeURIdkdiK01IY0x0TmVqVzkrSzJx?=
 =?utf-8?Q?9I2eGY36JOy+u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anNydGYzeTN0ZVZ5VHBZVFB1WDVocDRNWFNLdUplYVVDNjVVQlFqNE1hSUNY?=
 =?utf-8?B?cllJeXR2L0l3aWkwZ3FrWFZnR3d4aHJXSG45MTBnWHlFc3RxOHB6TjFybUt1?=
 =?utf-8?B?K2ZFaVR6YWFuMFh6WHQvOHY2WC9FelFaU3V0QmRnZTlTTDk4ZllPd0FDdU5n?=
 =?utf-8?B?dk1FR25wZi9sNCtjVEE0NDVtYlMvYXFPN2RSN21DSGJaTFFLc0pkVFpzd3ZG?=
 =?utf-8?B?TTRpR2lBODh3THEyanZGY1ZRZnQ3TWw2aC81aVczMGlGMk96WDkzejUxc081?=
 =?utf-8?B?Z0RMTmJCbWZ4RWtCZUZsaDNpeGJRVEduRDAvTFNFWkZHTGlhdFZXQmZvdjlz?=
 =?utf-8?B?OW9QWWh6YUJ5SmFWRW56VXpKWjcwSEQrZGkyZmw4Q2Q3WkNNU2p0UFVwS1Na?=
 =?utf-8?B?UnFvTVhLdWdWV2wvOHRRdEZndkxibHcwd3lxK05Fc21RR2xHd0NEU0xpeWxy?=
 =?utf-8?B?K0NWcGNNQ2JrTVNCWi8yOFI2M203cGRaNWFkNHNSTzBscXhyVjlrUmRQYW9E?=
 =?utf-8?B?Tjd5ZFdBNWZ0bkRPYUhyUkdOU2wvQXN2SjBLaDRUenF2L2VEUjBjMTl2aGRU?=
 =?utf-8?B?cVdnTHVpcDVISFpqRmZHbWlDSXVnY1o4WWlocDljYnB4NXIvRVY2K0lrSi80?=
 =?utf-8?B?VWkwNGw0NTFsRHkxRGVVOGJabkhpWU1pVTMwUVdXMVRFYTBDK1ovN2RHeUZK?=
 =?utf-8?B?NFh4NGYvd3FnblRwZXYrMGpCTGhLQVlSYXN6TkVna3BEeVVJaStFeHBldXhu?=
 =?utf-8?B?R2NVdW5FRDFHcm5lSjVVRUJRSkVUcjF4cEt3Rk5ST0pEY011RmtORWZXTzJL?=
 =?utf-8?B?bmRmTk9POXMxbHlLOXRqMitEMWxic3lGSVR1UyszcTQ4M2hZdXFsWXZoT0Ny?=
 =?utf-8?B?U1hsNDF3TFNXWDlLN0poUEluZXlQR2twNFVSNWFLOGpoVktIYnZ2WlZXVHc0?=
 =?utf-8?B?d0NhOVlJNlE3ZzBBeDhkUTJMcUw4Vk96L2I0UUs5ZE1mRWMyMHQxbXVrT0hl?=
 =?utf-8?B?ekZkWmZSMFByM1pUOEMwZVFYdWZ2cW1CVThEdEQvOGZHLzNWVnEyVVJlK0Zk?=
 =?utf-8?B?TVNyRncwNnpPYnpqM0lGUUZ6Mkk4YWhPUzhnMVhjTkpoUU9rS0xreUNSekQ0?=
 =?utf-8?B?UXV2VUdoaWF6L01PWE9yK05oRExyWVRGZ2FWdHYrUW8zSnZ0THc3UVc2MkQ4?=
 =?utf-8?B?OWh6MWxpdnVDb0lHYlovZFRiMXZXWE1rZlRHZkFoa0xsVytON2JiWXoybWJr?=
 =?utf-8?B?a0czSTlZK25ZL290M1Z4bWh3cmtTTWU3bHpHbE9qd1hrVXAyT2lrRkJCNTRT?=
 =?utf-8?B?dWdsREtMd1l6c2tkVXdkeFgzZFo0Ui9DR29uUUMra3N4a3ZBWUJDQXBNVzhv?=
 =?utf-8?B?aFFKUDlZb0F4R3ZqY1RaSG9FdWZTU2JlVnY3OW1KL013c3krbkY5b1hRTmtl?=
 =?utf-8?B?ZzJmaFUwWHlSdldGSGcwWlJaQXJyNTRvZ2MxbGdsR1ZRYlRSa1VMK0JaQ002?=
 =?utf-8?B?NWViRU5LSjhQQUJkbGQyNktqakpUTUtZZVNwZ1NZMUVDSnpFbW11ZzFZVkZL?=
 =?utf-8?B?UlByL3NKWGhuSnphdDZjT29UcUptRkZabExPZW1DM215MGl5YWtLc0p6VWlT?=
 =?utf-8?B?bEdFY3VkZTdVazFSSjI4Rm9zT0FadldTQi8xcGEvK0IwQkxaK3d6SlRYaWVt?=
 =?utf-8?B?enp3U0V5NS9BbEZkL3ZTbmNPRUYwMWl4ZDN6c0lNb1YxK054NUQyRnRHNSsx?=
 =?utf-8?B?eXBieDhTT1hROGVsbDZsMm10Y25SaE9vd09saUN5T2praFJ5bStHbzdiNmdF?=
 =?utf-8?B?NEEzR2hCSlpCQXFMSnN0aHRMTmRnM3ZZRFN1MFZGUys2UG14d2ZDeVBrTHp2?=
 =?utf-8?B?ZDJQSXBYZEY3aFJpWXFMaW9SK0RBY3pWdHVUZFNJMHZEU3lEelhuVjFJdVpt?=
 =?utf-8?B?OEFJZ1o5dnZrSXFCOFIwNVV6eVhRdFZkdm1WSW90OFNvRUo5dVY4bkJ0SnQy?=
 =?utf-8?B?aHJpUThmZjBUdEU0bHpPTlM5WXA0OGEwWjBYT3VNV3B0bVN1cXh2QS9rdnVt?=
 =?utf-8?B?WnN1dTJjd0dYMDB1ZitKMitKVE1nWWxQK25ZeVNCSHg0d1YybVJMM0xNQ3h1?=
 =?utf-8?B?eGZ3MlMyamRQT1hGVUZWbUV6SkZ0N0IyTnZsa3QrSmRjdFlwVHNCaHRxeUJ0?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7296564-05e3-401e-c333-08dd3ff4bd57
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 23:37:33.9059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuOiGIu7rpb/AUUTwYKkE5qG+wKYVsadvIqesNA0in/WujvfqG0WzAtFLWrqshTnvLX0ils/rvzF0o4RlvdVng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5245
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

On Tue, Jan 28, 2025 at 05:21:43PM -0500, Oak Zeng wrote:
> Add a function xe_pt_zap_range. This is similar to xe_pt_zap_ptes
> but is used when we don't have a vma to work with, such as zap
> a range mapped to scratch page where we don't have vma.
> 

See my reply to the following patch. This won't work and isn't needed.

Let me explain why this won't work.

When we set up scratch PTEs on a VM, we create shell PTE structure to
largest page size (1 GB), which we 1 GB entry pointing to a scratch
page.

With 48 bits of address space, this is 1 level to 1 GB pages, with 57
bits this is 2 levels to 1 GB pages.

Now, let's say we perform a 4K bind from 0x0 to 0x1000 with immediate
clear in fault mode.

How can we invalidate just the 4K range of memory? We can't. We need to
allocate new memory for page tables so that 0x0000–0x1000 points to an
invalidated PTE, while 0x1000–1 GB points to scratch. This is why, in
my reply to the patch, I indicated that the entire bind pipeline needs
to be updated to properly invalidate the PTEs.

I hope this explanation, along with my reply to the next patch, makes
sense.

Matt

> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 28 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pt.h |  2 ++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 1ddcc7e79a93..2363260da6a6 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -792,6 +792,34 @@ static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
>  	.pt_entry = xe_pt_zap_ptes_entry,
>  };
>  
> +/**
> + * xe_pt_zap_range() - Zap (zero) gpu ptes of an virtual address range
> + * @tile: The tile we're zapping for.
> + * @vm: The vm we're zapping for.
> + * @start: Start of the virtual address range, inclusive.
> + * @end: End of the virtual address range, exclusive.
> + *
> + * This is similar to xe_pt_zap_ptes() but it's used when we don't have a
> + * vma to work with. This is used for example when we're clearing the scratch
> + * page mapping during vm_bind.
> + *
> + */
> +void xe_pt_zap_range(struct xe_tile *tile, struct xe_vm *vm, u64 start, u64 end)
> +{
> +	struct xe_pt_zap_ptes_walk xe_walk = {
> +		.base = {
> +			.ops = &xe_pt_zap_ptes_ops,
> +			.shifts = xe_normal_pt_shifts,
> +			.max_level = XE_PT_HIGHEST_LEVEL,
> +		},
> +		.tile = tile,
> +	};
> +	struct xe_pt *pt = vm->pt_root[tile->id];
> +
> +	(void)xe_pt_walk_shared(&pt->base, pt->level, start,
> +				end, &xe_walk.base);
> +}
> +
>  /**
>   * xe_pt_zap_ptes() - Zap (zero) gpu ptes of an address range
>   * @tile: The tile we're zapping for.
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index 9ab386431cad..b166b324f455 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -43,4 +43,6 @@ void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops);
>  
>  bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
>  
> +void xe_pt_zap_range(struct xe_tile *tile, struct xe_vm *vm, u64 start, u64 end);
> +
>  #endif
> -- 
> 2.26.3
> 
