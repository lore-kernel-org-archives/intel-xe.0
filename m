Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B12D43356
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 22:07:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DBA10E884;
	Thu, 11 Dec 2025 22:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLLXZRUP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55ED510E884
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 22:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765490850; x=1797026850;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=80c9f4KyjVE7TyBcUAWYVMNGKFzaB6KQCoa0SujkEow=;
 b=HLLXZRUPE/dVZjXpXBwJq7FxdNBnojuLUfJBXy4nSLMnTBkt9R4CnqZe
 rdLzhVtuZcgAxiVGwcHLm7UTqaF5bdYaJsyMNugcGrCAi/H9gJ35CFu5h
 yw7wZLJUGotTxXfKR1eCGNLnftj1+J5Rhmdo4tgjP0lhfk6E9MTxXpP7V
 XdY8u+1YCkE9gyYUeLLjQ+WhKAfNyGOk+4akSoCS40inAl23c/aXxWWqO
 TBpwI8zxOH2xhlNE8haeg7wSzeVWZv040gbS8Rv2aV0omCVJM4NDtllFX
 0My56/ymGlzcLUbDxVybgMHK5DcPk4p5cVQbkW3jv23Zs+33J6TlUgR+P A==;
X-CSE-ConnectionGUID: s2JcQvMOQHyxpzTTvUwtgQ==
X-CSE-MsgGUID: 7FPflDAyTO+GUEkv74SE1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71329037"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71329037"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 14:07:30 -0800
X-CSE-ConnectionGUID: gBW6KjHLRGGlxQWVIe5rxg==
X-CSE-MsgGUID: VJNE23V6SOOtdt3liJxXQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="227972385"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 14:07:30 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 14:07:29 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 14:07:29 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.47)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 14:07:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Az4c9rOE6XPGppWRUied3jmfXYa0kb7D75TLXpro++5RsUCy55Zvlls1F/d8wvkuZZ23TrpPYeijs2pxqj7IpwdmoYWKJ3nxAPQBHVF4l14wWjh3lRUuAC5lOaNqv2+P5Bst/em5j0KkhXrVf4obV48whoB+EE1lfu3GgK+/BzXyD8EoXDuNlxtMSMMo/eYOlrfu26dCSU4LzXgDesPuThuUk53ocLL7rMN8kDQ4lLPf+UNVO/nJ2+OMhLRPgWOs+8/ok5XvJIe4kD2lwvjfcKwuk4iSWbaZQ+t+itdoYATvC5QVz4mDlkNQMRDQjBAP6RHlWcFK8JDBKCIz9FmeoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubalk26xnoXIMFJdnqSsJtKL2A/JHvesAju6t366SQU=;
 b=aUzN8AjPGhcAuhr6bcaXXntY0BjdpFdZZ3BqepwUZ+ynboi4juQOnGK8lVXFhK7/g6RqOVbS5YADl6gJwIhc9ZaTd7a1z1hMUjaYVNE0cVrNJ9f/FofnOdA6N+2VDUqi8L5wgx5qqI26Cfn2LUO+jik69+fhYtCVo4a6Pno4xu5vI4GlCFLxsSZosDx48wuqONfmgnDd16izcMZ26iqdjAgzB72SC90oDQ12NBOIzbMo30CeX5JmmKPHNkqe/WJoSCsxEFEFBTi2znrWSH1vF3A4X0vagmDoaY4MX/QpWLXW1++HSG2GrmzRVROwqxLeQEdIjd1K6BEPAdTqlvSEfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by PH7PR11MB8526.namprd11.prod.outlook.com
 (2603:10b6:510:30a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 22:07:24 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::28e0:9ef7:24f0:c21b]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::28e0:9ef7:24f0:c21b%7]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 22:07:24 +0000
Date: Thu, 11 Dec 2025 14:07:12 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <lucas.demarchi@intel.com>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 03/12] drm/xe: Add xe_device_asid_to_vm helper
Message-ID: <aTtAkIXPJ8VonqFZ@msatwood-mobl>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
 <20251104195616.3339137-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251104195616.3339137-4-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|PH7PR11MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c202c6-32e3-4c63-3853-08de3901aa29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajR2TmhRYlJjanFwUXYzYWl5eTlYWkdXZWN4WXhmU3lXdUVjU25Kdy9aSVVr?=
 =?utf-8?B?NXhHZ0xmTGphczhYNnlWOUhRWUtFZUVPVm03eFZ2RG5sRnlHZkNWVGlheFRE?=
 =?utf-8?B?VFFkMW95Wlhtb1VES2dGSmhmV2luR3JNL2ZFcERia3hEWEkzdmdVMXVFcUNB?=
 =?utf-8?B?VjlxUVlvdkhUV0tZWkIxU0FuaVJkL09HWVdWMTdYbndxbkV0ZHpuRks5N242?=
 =?utf-8?B?WTR0Y3ZRR3lmaEkyUzVMY24zdEdwU0dWQnVRLzBzN0p4YkxXYjRNQ3I3ajNX?=
 =?utf-8?B?OTMvdndmYzF6eFp5bThaTHVTVUhkQjZlallmd2hxV05qUm1iMldDbVFxZHUx?=
 =?utf-8?B?VERhL3JlSGNodUhLdjhBRVhsbEZIc1hQNjY5aWpCeGd3eTh6Y0dVZVlCM1VW?=
 =?utf-8?B?bEdtZ0NhSW1xYUJCcWZVK1BoTklUWVUrZlZpanp2MVlnSEorRG9HSUpUSTJD?=
 =?utf-8?B?VDRVQ0lDaE5MN1hVS245dTdScStuSXp5ZEMzd29CamN1c0JoZ0lVa2xyNHQ5?=
 =?utf-8?B?bkgvV3Q4a0xYYTErNlpRdk9XZmIzLzJudTJGYXpDQk51dk44dmQ0WERUQlhU?=
 =?utf-8?B?em9tOU11NUNjYkVzbnFrbEFnOTlDaXQ1eUFsSmRJQzFUTXMyZW11ZzJIcFNj?=
 =?utf-8?B?L3NtYXAzVGlEcHNCM0VTbHFRN2xFejhIVytMbWRrUXRvWWwyZnV0TmJvbmNv?=
 =?utf-8?B?VzRqYy84SjNNWWZyV2o0dGZuWEZ3ek5UTkxMTmNMaGxtL1RNUFBmTTFoa2Vz?=
 =?utf-8?B?TjhCSHF4WkVCZkQrUW1OWi9sdmhXc3pJOUI5elNCbU0rak1YSFZJY25xUjQ0?=
 =?utf-8?B?NVZlemxDQ2VoM0plek5hWmI3Q2o5S00rUUQ2b3FvczBTNzQ1MzEwMSs0cFhp?=
 =?utf-8?B?dXBQRUdXU1RTK0VVWi91TjZsRkRSK1R3RmQ0ajRlWUV4QnJUMy9VazlINFk4?=
 =?utf-8?B?bnNJZkhZTnlKaGJlanFrRDJPaTdZTGc2YWsrR2poZE9ldkE5UXE3aGZpNDNF?=
 =?utf-8?B?ZXpEZU9MTUROUWlhcGRlL3VwUEVobS9WczRkZmdCMitYam1uVlJMK0NuQURl?=
 =?utf-8?B?MXZzZFF1SzZFMWJJZ2JkOW9nanhWMGQxcEJiaEU2STh2SmMxVnR1bzJGZzQ4?=
 =?utf-8?B?aFA0MlNHbGNDQXRRU00vcUpRQVQ2UGhhSjMvSWU4R2o4U1c1MVdBQksxbkFo?=
 =?utf-8?B?dWZaQUYxYkpMWThqYnFQS3dUeWcwdG9IbURpcGY5a2VadXhhSmRqM1J6YlNN?=
 =?utf-8?B?azQyaUNJQVpFQ1hnTC9tZ3dyQ0c2ZUhmdC9BZzFVY2t5RWRkMGdrOEJkR3pN?=
 =?utf-8?B?Ump1QlhvbFFmVGJNNGlHcTJXMk0zb1NCamNZL2JLUVkvdGt2QkFjbytrN1Na?=
 =?utf-8?B?NjY2RHJ6ZkNaaC9UZzlMNGVaTmlqeHltRm1OMWZpTkQ4SmxNQ21NZ0EvQ0p4?=
 =?utf-8?B?RnducU5EQXdnRHhaRkc1T3pGSmxUNjZ1QUROVCsxVTJyKzA2SWdJU2g3WFZT?=
 =?utf-8?B?V3dobXBrU3czdVJIWUs5bVJuTWRxR05uYS9qc0V2UzlFRXMwWWdldlNsenFs?=
 =?utf-8?B?aUtxa1k2UG1TZVB0d2owWERacnFIUjg0L0NsMDBSSjFZTnB5NWVyeGZ1QUI0?=
 =?utf-8?B?bXorbnZvWkY0MlBuOXZJQ0RiYzJQY092NCtmbGVVbUhOQXV5MnFLRVFQR2cz?=
 =?utf-8?B?cTAydVZvajlGSmxOVDlyY0x1M2JHK3gyejIwVEtyNVNDTzI4NThLZUlJcE85?=
 =?utf-8?B?TXhFc2lZZklyUnZ4RkFXekt4NEN0T251Z3dWMm9JUnQrZ3MrZzBnOTg0RkJM?=
 =?utf-8?B?eTA4UGlrVUFINnVvbFRzMXZ5cFBhajBVMDYxSUV4bUpBSERyK0g5d0lLY1Zw?=
 =?utf-8?B?UmYyUUVVd25DVzFoMml1dnBqaXVxOHNlRFhQVG9pbGhTSE1kKzArNGRTNStm?=
 =?utf-8?Q?s2pmEKIt2+a7yaDjeQAHBDWKqqUTptLK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUwrQ3JueXREK2MwK2RCNDlqNmRVa0RXQUNtK29TUkQwcE10WDJSVlh3bW14?=
 =?utf-8?B?QUhnaTB3NkxhbUFVMTFHRk5ERXNjKzlRbTMyZXI4czVHVTFMODQ0N290YUJp?=
 =?utf-8?B?ejNodlppL3pVbDVwZFQ2VVg3Z3dLOFk0eXArbFZlWHExanp1dWNPSGpQRHRH?=
 =?utf-8?B?UzY1RmpMRm9TQ2lWYzAxbzFoZm5CTW5oZStwZEpianQ5aVc5SUhSVnVqakZo?=
 =?utf-8?B?N0lzL05LaDFuVXVTSXAzZENPRHQ0UlhGU3BGREpkbk5yTHFMUVAvVlZUcGlP?=
 =?utf-8?B?RnN2VVRydFhPcThvakVUaVJwb0h2aVpETnhRQldKb0RHclZCQjRaaVhaNkZ4?=
 =?utf-8?B?dVV0SVA3bGhWYUFQL2d5ak5iOFlnQll4VlAxemVpUURuMHVPL2lyTFh3c0hC?=
 =?utf-8?B?dm8rb2p2ZG0zSmJIQXViT1ZyM3Fwdi9KRXprMm1wSTRsejZIUlpmQVFvYU1Q?=
 =?utf-8?B?MnkwaG03dFVja1FDMVg2c3V3UHlIOEFKRVN0M0R6eUt2aitJdUhQa2tKK1A0?=
 =?utf-8?B?T1I1OE5zb2E5RTM0SzVEblY5ZG04ZU5GSTV5UkpDYjZMVXFsZ2x5OW9PblFk?=
 =?utf-8?B?dEtTM3d5czVjamNadEFQcUNMb0k5M0F2MW5FS2drblNCcWRkZzdsaUpSbS94?=
 =?utf-8?B?L3V2Rnd5MTVRSWJ3eTRFQXhqMElsdW02VUYrZXM1WmFPTGFldjFzSDl4OUV3?=
 =?utf-8?B?VGVYN2d3ejZqckNXU0dqTHNhNkVud2hRckE0dm81R1JzZDllUkg3UDFrcWJH?=
 =?utf-8?B?YTF3Y3VocHJJdEY2djB4ZTRUTnJJZnVUL0ZVdlJacTl6TG9RNmFrUnRid1NE?=
 =?utf-8?B?TGRvazV4Qjc3cDl0YzgrMSs0YjdIZmo3UHhqclI1eDVrenZzWW5ZZmJGQzdE?=
 =?utf-8?B?OWNaaUd5b2x1Tktvb0xVdmdYQmhzUml1MGNJandpZUFKejJack9BcDdQdWNL?=
 =?utf-8?B?a3BMei9TMUpmcG1GRnNaUjhLZ1FyVlI5SzRIWHJqczFEc2ZtNFdIZ2FBT2pn?=
 =?utf-8?B?d2M1TU5lVHBiK1A2akRJSjFNOEtsYUFLMWQyS3hXVVpyRWFGeXdIUWszNElI?=
 =?utf-8?B?TG9sVXNZemNEQkJhQVdWa2tnRDBnbERyVkdETmViOWxWUEFjVVVpVmkweENS?=
 =?utf-8?B?RzdMMmpxMVJxZmdsL3JnYng2SEljVXRtT3pLVHRsRTdGaHBYbXhQN1V0ODFi?=
 =?utf-8?B?ZVIyd3c4eGwvQkY3SEZtRmlyZ1RZaTMyekNQbVBMRVVZcHgwaXlldG43aG9I?=
 =?utf-8?B?TzRjWjByTkFYWU5vZ0ZFT1dxZHl2UUF1YlBSOEt4RVpPMmdEOHZVUkN2bHMr?=
 =?utf-8?B?NFNQQ2g0RHRtV1pRSEhJWWNaUEJ5STlTNmRoNFFYN3hweEFmUWFNMEp3Qnhx?=
 =?utf-8?B?cW93czRpRkRzK1hQUEhxVWpBclRITjNWdENvRGwrY1Jtbk8zbG13blc3UXdQ?=
 =?utf-8?B?RmdoNGRKRmhYbnN3RklUU2d2M3ZXb1RiM0tmVk5HSXRsWEVlcm1ib3ZMZThC?=
 =?utf-8?B?ci9EUFBFZFJqNjh2ZkZYTjIrWno3bnVRRno1RGFLWi9tSWFuVnE5VjZEejQr?=
 =?utf-8?B?MVFwMFFNemIyUFdBeXczS2lnOW8zeDhWTjRRMVdQOGVxa2ZaWXRIb3JkSUw3?=
 =?utf-8?B?RjVoVHhoTWI4c0Y4ZFZqNER2MmJtUktwM0RrUnl4MWhOWXl0cW1Oc2RGZGxy?=
 =?utf-8?B?UWU2U0krWjRzcjZhYXMvSExheW9ibzUybFp5cXNXSjducU5TQlFRWUpHVWtn?=
 =?utf-8?B?bDRhQ3FhMUdIWUNSK3hjeDNQM1RaVTBsbXEySW10MDFrRTBlV2FjUUhQRWJL?=
 =?utf-8?B?THIyOUkxcys4YzJpSjEvdUVvcjB4RWtxVklRZDVkamRWeXNYSUFnT09jWTRw?=
 =?utf-8?B?b1l5dzQyVWdpR213MkQ0MDlHcFNmMkNyRGdVVnJhWjRWUmZRV1VJbC92RmJT?=
 =?utf-8?B?N3ovaXdsb1FURTVmcUFKZTFlV2c3NDl2RVV6b2YvcU5PWGlEb2tHMmZQNEJU?=
 =?utf-8?B?eHNkYXVTZ2xUQ2NITitVNkhRUHorWk10RkpkZ2RsK2JINFJFNGdBbTVPVmRo?=
 =?utf-8?B?NmNtZStsVDZyK1J0aFhHdTU2U2xidDFlTXpTZDljZ0JLaUtDWmhPWXBOVHJV?=
 =?utf-8?B?U0Q5MXFacHJwVDNsQnQ3RG8vMzcwQmN4WC92dHJPM0c3bTExMEpJcmw2V204?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c202c6-32e3-4c63-3853-08de3901aa29
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 22:07:24.7668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrYBrrKmMOZL2JSjOL/5RspNmWzsqKU3y3XZRCeLDMHnOptAPdVRIotP+tUscRTjSfKo+4hdNOT7pmiAV2/d8xCaiB98gwzHhnioGny9kSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8526
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

On Tue, Nov 04, 2025 at 11:56:07AM -0800, Matthew Brost wrote:
> Introduce the xe_device_asid_to_vm helper, which can be used throughout
> the driver to resolve the VM from a given ASID.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 25 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.h |  4 ++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 86d5960476af..57907904c49d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1290,3 +1290,28 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
>  	}
>  }
> +
> +/**
> + * xe_device_asid_to_vm() - Find VM from ASID
> + * @xe: the &xe_device
> + * @asid: Address space ID
> + *
> + * Find a VM from ASID and take a reference to VM which caller must drop.
> + * Reclaim safe.
> + *
> + * Return: VM on success, ERR_PTR on failure
> + */
> +struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid)
> +{
> +	struct xe_vm *vm;
> +
> +	down_read(&xe->usm.lock);
> +	vm = xa_load(&xe->usm.asid_to_vm, asid);
> +	if (vm)
> +		xe_vm_get(vm);
> +	else
> +		vm = ERR_PTR(-EINVAL);
> +	up_read(&xe->usm.lock);
> +
> +	return vm;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 32cc6323b7f6..538202eebc16 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_DEVICE_H_
>  #define _XE_DEVICE_H_
>  
> +struct xe_vm;
> +
>  #include <drm/drm_util.h>
>  
>  #include "xe_device_types.h"
> @@ -195,6 +197,8 @@ void xe_file_put(struct xe_file *xef);
>  
>  int xe_is_injection_active(void);
>  
> +struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid);
> +
>  /*
>   * Occasionally it is seen that the G2H worker starts running after a delay of more than
>   * a second even after being queued and activated by the Linux workqueue subsystem. This
> -- 
> 2.34.1
> 
