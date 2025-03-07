Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360C1C282D1
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 00:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC76F10E033;
	Fri,  7 Mar 2025 00:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HAK6jvhG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540AA10E033
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 00:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741306034; x=1772842034;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fpXH+yFQmRPItRJbztjBgndsaJ2pq5jfMqcizKrqRj8=;
 b=HAK6jvhGsnuiA3OLDVuIvsht0LJCA6AetzGDTc/6gSYMwFWiJXiV2frX
 kXsLVmTXWsqZMg0ud8DCdNuValAdx4GVEhGHqjXshYo1WvtOFiiVZ5Hdj
 7jvrCm6WWty6mSoH4herzPEex51fRSiEVf2+V+L721P8rdZQ6m6MwJb8L
 f8Fp9pSFhHAl7U2s2fkQ75XZbovBk9wlQ6L+nSLKEpx9EFFEUIeT3Jj8r
 J7Fm+y+pkWY4i2iQkmg7OSXiPjRXbspwi46CSe7pgMdp31k4EWrOLNLlg
 ocH5S+NM81z3iI8l6Iv9nfxe1luqxtIGW8hYmL/zYqdvEsT32mQuF7a76 Q==;
X-CSE-ConnectionGUID: MoDTDOYUQ9Siz4TVUJefqQ==
X-CSE-MsgGUID: eZLBJ2yKTZa5sEmPaMkdrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52987557"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="52987557"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 16:07:14 -0800
X-CSE-ConnectionGUID: IxgWKSqZS1Cp8A8+7nsFfw==
X-CSE-MsgGUID: LruHq/7ZTzuwGwIwbON/Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124377894"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 16:07:14 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 16:07:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 16:07:13 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 16:07:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJDCdFimwLMdk2AQIC8zpuYLj4lX9zV9VgCD376SyFQKyJFg0l3s3O9vzBn96fzHnTIPS2S19dhiInT0dIjTqDtt6wX260MN4w1V5rFnELh8tAaN8mMtEE0nVbicuOBEOmcr0mdtu9qjwyhsSKKiBtDrg7iuY+zVHf5BA21PR1YQxjDSQ/AYqGfCq9jjtLa2Htnfb3iWylOgpMbVG1b11bfzHA68bt1iXs4XEw6xxuMuX9zUVUOU+ulKNd7sjAnGgNjOnLGodozMfisCmqDqVe2cHtEau83Z6sjjAWODgreE17Lu0I43joQDGD/dGeseFkHEehXeREFCkOuF68sNYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtHyMB1GSSzS+7uoUDOvvz5Qh69esWWgMsA+WeANq4k=;
 b=MxDxCmYSTMG4CLaFpOW4gg2ZKnwoSlZqZtI4p1lD4YxfEvJYlmG00KOyyQo8tiXHFVuGdUBP7n0nsnZZ7iASQqccbqd83UR2xZQ9BaK280WVbBSJgyjLO25nWW6esRhhGD/GeUijIMjzjRnrIYoEcDRd3/8CJRfELqoaFkyMDlhISouM5aMYfKirCNdzAxzIxSTFDjbqN4OLWmFEQIMA+Ft4bgfJX/CXx+JOP8u0flwUVZ9Xv8CuMRdwY25RvBT8GsvigXev709/MxNGJMYFPXjpa+F7TUyUNUInwMdemy9PUWBeBi5HN+MiCIh3tBJFk8FLbcpCa3GeTQtsjkiERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6746.namprd11.prod.outlook.com (2603:10b6:510:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Fri, 7 Mar
 2025 00:07:10 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8511.015; Fri, 7 Mar 2025
 00:07:10 +0000
Date: Thu, 6 Mar 2025 16:07:07 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>,
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/xe_pmu: Add PMU support for per-function
 engine activity stats
Message-ID: <Z8o4q8za9PlUHBfc@orsosgc001>
References: <20250304095743.3274062-1-riana.tauro@intel.com>
 <20250304095743.3274062-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250304095743.3274062-3-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0207.namprd03.prod.outlook.com
 (2603:10b6:303:b8::32) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: f81de4db-6c30-40c3-b87e-08dd5d0c0165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0xSa1h0MG9ZSndMNEx1ajE5aGduMlJXRUxFVFJEQmRJeHMzOEtPVEQ4UlFG?=
 =?utf-8?B?YUYxVVVEeUNiMHVUblhGVklvc3ZCR0NoL3ZWbmRnbTVnaUVMWlc2anQ5K25j?=
 =?utf-8?B?MDc4aTZNZDhUSXlINURYcSs1REl5TjI3cDlrVEQvTnFTTml0WW9Fa1g2VjNU?=
 =?utf-8?B?RWsvalcwQWtHUFJUbXlpOGQrMCs4VHQweE04dzA4Z0w3SS9FMEYxeit4eWlY?=
 =?utf-8?B?TVA1L2VSSzhjTDA5b3V6Qy9SM1hvdUZEVzU5MWM2U1hVWWkzOVp3aU9kSlgw?=
 =?utf-8?B?czVQb1c5aWdEZXFYd1V4T3hCaWdGY2NCc1lhU1hRZFBLSDgyYVRjSmtZcld5?=
 =?utf-8?B?MFQrMlBkMDFmNjBlcldrSGdBQ1pXNk9qZzdCSENyTlNPaFk0TGlXMk9FR3Zo?=
 =?utf-8?B?NG9kRzExbjJFRkNvY0J0Y09MVEpiRnJramtGWFM0NXB4NFhOWGQyYXlDNVgy?=
 =?utf-8?B?ZGZOa1Q4eDd0cXhXSWwxWndPWk9Wczkvcjh5OXQ0OG14a25pYzAxaGtYZnkw?=
 =?utf-8?B?ZWF3ZEhiUEdwMEhtN3luNUxTY2lnWlVUd3ZEL2VYUU5SU1hUa3JKSTV6ekZ1?=
 =?utf-8?B?YWo3ZW1lVitKZzM3MFMza3JSdjA3OUxKV1BCaEY4WFAwdmZpdTZTdFp5TWdQ?=
 =?utf-8?B?SCs1UmVDYVNHSkRNUHBad3ZKbi9TN2IvaG5rK0RjTE5PTFVxYkVBb0JHYXRH?=
 =?utf-8?B?blRxbEFseGFVZDVVRjFJZWpUTUd1SlllYXhiZnltWThSSk1Nb2ZHVWphZ0NQ?=
 =?utf-8?B?MHF0cVdyODlRbW16bmVnMWRBa1BPK09jaGhyMHgxc241aE43K2ZEcjlDV1p6?=
 =?utf-8?B?QjBHNnM2dlFyY2FQeUU1YWU5dHU2aWhaTFFRWEVsZ2tVdSt5YUlmUWh6QWE3?=
 =?utf-8?B?MFAxODVWQ1BBbnNsbVpTL2JoMW4rdDQwei9qZ1BlZVZhbmFXY01TVjFTVGZX?=
 =?utf-8?B?c2lBWDRsWXpkSE12OEtTa3JtdE1yTFVMMzhGVzhTOUp5NGZrQXplRVh5c3M2?=
 =?utf-8?B?UTI1dEh6dEtHZ1drWWlabWU5djZpOVZnRERzVjBYUk5EdGl6MXBzaVdKYkNu?=
 =?utf-8?B?VTY0R1ZwZ3NTZ1puQUQyVUNvbUFhb2FlQXdNQjBSQUVqbnR2U2c3WlJaYXFx?=
 =?utf-8?B?NHRCYVJXUWJldlRQS0VhUjBIVm9uSUZWQ1FCeDNnT2JFc3IvMXJRWDluKzlB?=
 =?utf-8?B?QVYvRk9BNGN1a2pxZWZCcjlMSUx4MlpzTTRNUmx4VWVJOVUrdlhUdUhDT3ZG?=
 =?utf-8?B?b3AyRkZVQTY1OFhPVDRGWFIvcFpmaXUxSDRzT1Z4UHNPbUh4YU4xdWJ5SHZi?=
 =?utf-8?B?bDZFemhMeTA5TllRWGJ4Wk5XRXJKWXFLTGhpWFlHd0NTL1Buanl6ZEQzMmtq?=
 =?utf-8?B?NEFmZFIyQWRUNWptRDRkTzJuTStBVmovQVYvRlA3Rlp1NUl2RWVYeHMwL2hj?=
 =?utf-8?B?M2d1OHFWMG02WHJERmN4UXlQVjgyTGgzd0VVaHdXUndBUk5JTnQvMzl4a2xi?=
 =?utf-8?B?UEZrdk9pOXV1NmZmY1NpUXhSZEpkZmkwK2NVdFNoSGpoTURLNFdBT3pYTks1?=
 =?utf-8?B?dExWNGlXalg4NjFtbDZHL3lWeEw4WGpLVTFPS0NsMllCd3ppalZ3blBZNmsx?=
 =?utf-8?B?NktnZU9LeEdNeXZGM0JWdGt4NG5SV3hJYk45TmJqMFVkSnRpWGNWT0IwdHky?=
 =?utf-8?B?eFRTejVKODd6S2tsUmY4VGN4TTY4bmZsc2lRc251VUpSbC9SOHR5b21KZnQx?=
 =?utf-8?B?SElrS1pjOFA3WXd6aXIvaXlDUUdOMVR2U3ZvK1daR0crcEFVVW91MHpOQ1B3?=
 =?utf-8?B?Vm9oMDBNbnZMOGcyQ0Z3RFNCOTZoUGRkaE0vc2ZwL3p3djRPNTRzeDhUK3Yy?=
 =?utf-8?Q?gDGocsisULW5U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVVzWm5ROFdNMDhwRmtCV2tKbyttYlordmtIdlAwUkc4S3pBR3ZVN21SS3dp?=
 =?utf-8?B?Z0xjMjQ3TGNNTHFGcnMxd3RGdXBxWCtKakhhanhaSXV1KytYei9oeWFCaElQ?=
 =?utf-8?B?aElTdWdXVmtpUWh0d21pZzdiL3NNSDZpbGVqOHorbEFTdHJIVUFSYWoyQ2Fx?=
 =?utf-8?B?U2NYNHBHTHNqb1NkaDR6a1pIQjJhTlUyTFA4Nk1FeWJwRHlHU0JPMktaSS90?=
 =?utf-8?B?ZFh1dVdRSkVpdTFCdlhuV1VldmQzVS9kd3ZYSW0xSkU4OXh6bjhia0IvQ3I0?=
 =?utf-8?B?WWVDM2cvcHp5V0hCd1NaaWF4Wkt4c3RTWkd1b3dZaFJBN0FleEJ3Y0k2RzVN?=
 =?utf-8?B?MUtxQjdVOU1pZjQ3Qit5ZkNpV0RHNVBtWEt4alRXb1Axdmo0aUFObzF5Q21F?=
 =?utf-8?B?SlczTml3L01LRzVLellqblIvbkhFMjI0dm9yT015bWdlQllmUWNQMG0zZmNl?=
 =?utf-8?B?MzAzbmNpNHFLVnhXQ050Y0M5ajdPcnY4MTU1ZVFZQ29KQllSVVRXYlQ5SHBv?=
 =?utf-8?B?bnQzbkZ2UDZjSHFEelpFTHlMMngzVGhFK1BURExxNkVRMGZYaFBNOUFEM0dM?=
 =?utf-8?B?YUtLeVZVMWFDYTRJWHUrNmRlWFp0a3huQlhIbHVFTnpFNTZKL0gyT2tZbnBL?=
 =?utf-8?B?bWdMOG9IaGl6QWJnV1F6dHhldXNTMzVQWmdwOVVUajE1dlJxeCtLYkx3WTdX?=
 =?utf-8?B?aUV6NHRsM3Fud29RZVdNV2ZEK3J6elV1dUFQK0dpa1NpemZIcmNaVFlLTUNN?=
 =?utf-8?B?OGhUa2hsc1hFaXpnQk1JMlFoa2F3RkNjUlRjQkhQUUtvWGNnZnZwUGpGekNG?=
 =?utf-8?B?SCtGTzNVUlVnbE1pOEIrcVJMeDA4UUtXc0xGNnY2WG94Uk14NS9BL0xSYWJj?=
 =?utf-8?B?YlFMM3lZc1BneElLdmtnTXA4VUNTbE5qNDZ5eHQ3OGFRb2NqNW45UjVkSUlP?=
 =?utf-8?B?d0dlR3pJdUNNRW5FU0k0eGJBclhYSWlFUzFXR3ZpNEowV09EOUc1NEpuTit2?=
 =?utf-8?B?dFAvVlR4cHF5UTRFUXlBOUFoWlJIMEdFUGZYdmhVU05CdDJtVDZzb09DUi9r?=
 =?utf-8?B?RkdBYVpqWFAveXhlaHFrQ1lFQjJpZCtwOFUrc2Z6Nm1lL3gwVUp2a0ZSb2ln?=
 =?utf-8?B?Q21EM3dHM1VQYytLS3B4Mmg4ak5SblFEVGlSd2J1Z0V5RGk0STEvTFVlSXNS?=
 =?utf-8?B?b0RjaXVQc0s1Um5kVUI1aFhYOUthMlM4ZDhjb1I4Z1Q2SHppNGVjbmFyMmpH?=
 =?utf-8?B?RG0zaytqMEZGREoxS3gxdi9UUUYvRWR0QVkvZjBHemRNT1o1eDU3bmtUVVFh?=
 =?utf-8?B?NUQ1K1BUYWZZdFJLMW1RM1l4U1FzMmx4OUMwR1FieExDZUJvdVgxak4wU3NO?=
 =?utf-8?B?RU5DUkhuNnNCNWlRRS92aDY3THY2WGUzWXljbHBMOEtkMFZSZjFOa2lSWm5w?=
 =?utf-8?B?WFcweXFnWHo4YzQ4QWIxaXlIc1YrbW5OU2xJK3laSmZDTDE3c1QyaFM1eENj?=
 =?utf-8?B?UU5vQ1hVMHpaZ1JsNXZ2bmhZTVhNdmpxc25CdWhXUURoUDNmc3ZiYUFieHRq?=
 =?utf-8?B?SEVSaEgxM1pYYzg0bElIbVJlMi9Zc0dicUlNTEdvSWo3cjlzUkdhNHl4ZDN4?=
 =?utf-8?B?c1dJZThOMnFtVXBJRkptN0dLZ0FrNmpGMDB0ZFNLWnhaZHZOYlB6OXBod3Vj?=
 =?utf-8?B?MHFTOElrTC9yK24xQlhaUjF6WnZHdmM2RUdGRTQ3TmE2eU5vM09lQ3AxcHQr?=
 =?utf-8?B?Zi9UeUlYcFZpRXErUC9Jcnd5a2FJVFoyd0xKRE1NWVl0QThiVjdFVEJFb3R4?=
 =?utf-8?B?ZFYrK1hCWXJIZDdBTjBidlBWQzJSSFAyNWdOckxwRGlIcVY5QnlxYXZxM1Z2?=
 =?utf-8?B?d3lnNU4vcU1keGNPUitDSjY3OVdweDBYYnFsQUxDSmtFOHhHTlVYTXh4TUUv?=
 =?utf-8?B?bFY1YzltRFM4VGlJellnSWV4OWgrbmRQa1lSLzBNTGV5MXBaSitDMVY3aXRV?=
 =?utf-8?B?YnBuMnRKM0U2bDgxSFc0SGJMMkNIZ2o3RlBTeE9pemE0WFl1U0x2ZGtYQkRH?=
 =?utf-8?B?YzF1djRpc0l5K3VEbmJnNzZMUUdCTTlCbVBmZmpkb25wdUFQd0Q4WUVwaDhs?=
 =?utf-8?B?dzgrTVRtRjBaOGxqRWpPVDlkMURnSnJQNmdWWWlJcmZ2cXpGYkZpdS9ST1FB?=
 =?utf-8?Q?uj37pdTjOCeMxmIfiz5j6Cc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f81de4db-6c30-40c3-b87e-08dd5d0c0165
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 00:07:10.2867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jrh4UahnI7OLb5T4YPNxSoEWrYVVv149KXZChg4KWQaVzz8OAOwI7pWglXNWpClE51KR5eo0ZTsW1LLctkGMgf/uqhUgm7EbkiRQUI/mMHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6746
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

On Tue, Mar 04, 2025 at 03:27:42PM +0530, Riana Tauro wrote:
>Add PMU support for per-function engine activity stats.
>
>per-function engine activity is enabled when VF's are enabled.
>If 2 VF's are enabled, then the applicable function values are
>
>0 - PF engine activity
>1 - VF1 engine activity
>2 - VF2 engine activity
>
>This can be read from perf tool as shown below
>
>./perf stat -e xe_<bdf>/engine-active-ticks,gt=0,engine_class=0,
>			 engine_instance=0,function=1/ -I 1000
>
>v2: fix documentation (Umesh)
>    remove global for functions (Lucas, Michal)
>
>v3: fix commit message
>    move function_id checks to same place (Michal)
>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_pmu.c | 40 +++++++++++++++++++++++++++++--------
> 1 file changed, 32 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index f8f6ebb7c9c6..8922f53ebf93 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -13,6 +13,7 @@
> #include "xe_hw_engine.h"
> #include "xe_pm.h"
> #include "xe_pmu.h"
>+#include "xe_sriov_pf_helpers.h"
>
> /**
>  * DOC: Xe PMU (Performance Monitoring Unit)
>@@ -32,9 +33,10 @@
>  *	gt[60:63]		Selects gt for the event
>  *	engine_class[20:27]	Selects engine-class for event
>  *	engine_instance[12:19]	Selects the engine-instance for the event
>+ *	function[44:59]		Selects the function of the event (SRIOV enabled)
>  *
>  * For engine specific events (engine-*), gt, engine_class and engine_instance parameters must be
>- * set as populated by DRM_XE_DEVICE_QUERY_ENGINES.
>+ * set as populated by DRM_XE_DEVICE_QUERY_ENGINES and function if SRIOV is enabled.
>  *
>  * For gt specific events (gt-*) gt parameter must be passed. All other parameters will be 0.
>  *
>@@ -49,6 +51,7 @@
>  */
>
> #define XE_PMU_EVENT_GT_MASK			GENMASK_ULL(63, 60)
>+#define XE_PMU_EVENT_FUNCTION_MASK		GENMASK_ULL(59, 44)
> #define XE_PMU_EVENT_ENGINE_CLASS_MASK		GENMASK_ULL(27, 20)
> #define XE_PMU_EVENT_ENGINE_INSTANCE_MASK	GENMASK_ULL(19, 12)
> #define XE_PMU_EVENT_ID_MASK			GENMASK_ULL(11, 0)
>@@ -58,6 +61,11 @@ static unsigned int config_to_event_id(u64 config)
> 	return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
> }
>
>+static unsigned int config_to_function_id(u64 config)
>+{
>+	return FIELD_GET(XE_PMU_EVENT_FUNCTION_MASK, config);
>+}
>+
> static unsigned int config_to_engine_class(u64 config)
> {
> 	return FIELD_GET(XE_PMU_EVENT_ENGINE_CLASS_MASK, config);
>@@ -151,7 +159,7 @@ static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
> static bool event_param_valid(struct perf_event *event)
> {
> 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>-	unsigned int engine_class, engine_instance;
>+	unsigned int engine_class, engine_instance, function_id;
> 	u64 config = event->attr.config;
> 	struct xe_gt *gt;
>
>@@ -161,16 +169,27 @@ static bool event_param_valid(struct perf_event *event)
>
> 	engine_class = config_to_engine_class(config);
> 	engine_instance = config_to_engine_instance(config);
>+	function_id = config_to_function_id(config);
>
> 	switch (config_to_event_id(config)) {
> 	case XE_PMU_EVENT_GT_C6_RESIDENCY:
>-		if (engine_class || engine_instance)
>+		if (engine_class || engine_instance || function_id)
> 			return false;
> 		break;
> 	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
> 	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
> 		if (!event_to_hwe(event))
> 			return false;
>+		/*
>+		 * PF(0) and total vfs when SRIOV is enabled
>+		 */

single line comment should be enough here ^.

with that:

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>+		if (IS_SRIOV_PF(xe)) {
>+			if (function_id > xe_sriov_pf_get_totalvfs(xe))
>+				return false;
>+		} else if (function_id) {
>+			return false;
>+		}
>+
> 		break;
> 	}
>
>@@ -242,14 +261,17 @@ static int xe_pmu_event_init(struct perf_event *event)
> static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
> {
> 	struct xe_hw_engine *hwe;
>-	u64 val = 0;
>+	unsigned int function_id;
>+	u64 config, val = 0;
>
>-	hwe = event_to_hwe(event);
>+	config = event->attr.config;
>+	function_id = config_to_function_id(config);
>
>-	if (config_to_event_id(event->attr.config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>-		val = xe_guc_engine_activity_active_ticks(&gt->uc.guc, hwe, 0);
>+	hwe = event_to_hwe(event);
>+	if (config_to_event_id(config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>+		val = xe_guc_engine_activity_active_ticks(&gt->uc.guc, hwe, function_id);
> 	else
>-		val = xe_guc_engine_activity_total_ticks(&gt->uc.guc, hwe, 0);
>+		val = xe_guc_engine_activity_total_ticks(&gt->uc.guc, hwe, function_id);
>
> 	return val;
> }
>@@ -352,6 +374,7 @@ static void xe_pmu_event_del(struct perf_event *event, int flags)
> }
>
> PMU_FORMAT_ATTR(gt,			"config:60-63");
>+PMU_FORMAT_ATTR(function,		"config:44-59");
> PMU_FORMAT_ATTR(engine_class,		"config:20-27");
> PMU_FORMAT_ATTR(engine_instance,	"config:12-19");
> PMU_FORMAT_ATTR(event,			"config:0-11");
>@@ -360,6 +383,7 @@ static struct attribute *pmu_format_attrs[] = {
> 	&format_attr_event.attr,
> 	&format_attr_engine_class.attr,
> 	&format_attr_engine_instance.attr,
>+	&format_attr_function.attr,
> 	&format_attr_gt.attr,
> 	NULL,
> };
>-- 
>2.47.1
>
