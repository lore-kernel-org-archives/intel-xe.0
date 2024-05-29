Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0454C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 19:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FA410F05A;
	Wed, 29 May 2024 19:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lLEA2NLN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728A011A234
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 19:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717011951; x=1748547951;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yHMMjuqX1eEh3vKalLEa/ziv5zNr+Jhks0ymFwWjNFQ=;
 b=lLEA2NLNAv134bbL77EfQ0H3WxFvJ0LDppShOM7NTKImBy+LvsS02s8W
 J+RY7HxMUgH2L5CToGtP8UAdt2hSlMgFJAD0glrasKX25+G9hNHO8mIiJ
 Bs4WmYRkcQIvn/TNBjWRyCJsC96Xyd8FRjGbJa91taaANMpCnYC4xDjwX
 nexPJlnGrJ0JlBxCV3jYV/xBuoX1QEQk0KLu9F8b4KfyvnvqhFKM+ybBE
 V4t6R/l0dObNUKBKZPzPT2qoYKj6W1Ng8nbyfiKn+NOWK5LftUB5sSYDx
 JlzwtPAKg3rBd3ValeyjgEVKtxevX6o1BCDOdCR2UNNuvzNfNKgIvzh9x Q==;
X-CSE-ConnectionGUID: 44aWjw6DRDGahc7g7pcPyg==
X-CSE-MsgGUID: TWBXpB5CQpiVEe6OLgFAyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17276941"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="17276941"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 12:45:51 -0700
X-CSE-ConnectionGUID: XvVdGvkCRpWszBkWSnBBoA==
X-CSE-MsgGUID: fRUjyyuzTtmyZyWAH40ZKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40547428"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 12:45:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 12:45:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 12:45:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 12:45:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 12:45:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=expG8OWy5v/YOMVAZ9p5AsmvxEGyGDJEp7PpOejwdp8oIA6AHqCz8IyxooLmLaLE5Jndqj30dwwx9p21yETUsvyQKSX3LqVCmtNK+8t8qkjZZ2agSOnzhO2LwYaIkVX1QXJL6vPbu9wB78fj0GD0vO317TOvY22pbhLcPrlm6C1a61OpU+XfFzn25vj/praR/OdrybRqHAPYc/Fx5H+SKb8yjB2KdONGwuhvsW64lnLZRpoZX/2mzidIZuTSzPG0e2WgIyZqSPOih+xhNp51WWeS+EIR8IWZhYxnMrEZXalNNzyqOBEtyhPBE0NUaacKMpXFSUFZgTztI10XGUD5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSmxOgVd0ATHqCerGUjmLujUxnQaG2SK2jk/CBQXc1E=;
 b=Im4zeBdZxV2XL4Ex/YTP/h2XgE+JX3LnCgkozh/UJWPLH8eXde+qZdTCOd14KDg5/oOJ7Kbc5h23vRPUvZIZVivYVPoDr1T6cvQw69XisFooe7lMEjpC/2QbMoYH+AE/Pm1WVQfxO/xKEb2n17RplCek76ShKgE6mfmDPm0IVkZmBs+iV5HIMChc1ANpUchx7UHVfd7IFXuwvTn0RcmY+TxI8pOXfXUVTGnZb2MfQlJOcQjSREzaS5CnOOeeJlK5Bz3GO8fOKX2TUcl1xyoHQT0ii2ATBZgol33IiQvcUZkf510n2gKxKcltzhXVFBlaAKTc0PG8zU+4QFkIJiMJlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB7250.namprd11.prod.outlook.com (2603:10b6:610:149::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 29 May
 2024 19:45:47 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 19:45:47 +0000
Date: Wed, 29 May 2024 12:45:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Zhanjun Dong <zhanjun.dong@intel.com>
Subject: Re: [PATCH] drm/xe: Split MCR initialization
Message-ID: <20240529194544.GK5383@mdroper-desk1.amr.corp.intel.com>
References: <20240529162945.1240-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240529162945.1240-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c65ac2-29a8-40b7-4277-08dc8017ef71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnQvYXdCbVkvWFV6akkvYmx0T3JTOVNaclhwbHBLdGZPV2RXWGVxZlNjQzlD?=
 =?utf-8?B?eUZiekZpWmdFZENOL0tBQ0NxVC9NTERGZ3ZyZXB1aHQyd1ZYZU4wVlh3bWhk?=
 =?utf-8?B?c2Z0ak1yNkdRWm9GelRIbWVUeEk0Vmg2dytYdStpalY2VlpsdkkzY0pENU9P?=
 =?utf-8?B?QWtYdG5WakVleWxucTlBb0lGWk0yd2lUOEFjaEJlMlVUMjZQTXoxTzE5YnpS?=
 =?utf-8?B?ajJIV1JQd3piZXFKS2hnVHV3LzJzOHEwWVV1TUhaUHhNMGFjdjFiZzVwcEdw?=
 =?utf-8?B?clQxTTRabzlOTXpWNFRoTjBDTXFFSTVkdXhDRFFRRjJxa29IcFI2Qi8xU1Ey?=
 =?utf-8?B?dHdweVpUcit3cjJ5MWJSMFRQaW0rY29ROVZSOE1LVmpxYzUrOU5FN0JmeS9M?=
 =?utf-8?B?Z3NpeU55dzlyeTlycm5KazNDK1RXOWpFeGFqSG5LK3dZUVI1U1REb08xenAx?=
 =?utf-8?B?emZJNm5hVzhnQTk1VFhKZVFuN04xdmFOazhUSThpWlU4N29mYkgzUTVyaG92?=
 =?utf-8?B?cnFQaHp2Tnh6eFdCTlk3Q0d0d1ZxSlhZWEI1S0pCUGdKcnNtOUlmVTQ4V0xG?=
 =?utf-8?B?TndEV3hzMks1RDdVd1o1ejZLdzVCMzd4UklvN2pXVkxFemtWNUx1MEtPcHBk?=
 =?utf-8?B?eVRlczN1eCtLOUZFUk9qcENkMWRqTWZaSGhaa2h4bnlXV01aN0c5M284MWIx?=
 =?utf-8?B?TFlqa2VteVpZV3VQUE1rOVpRRWJ4VmVkMjZTTWFnUkt4TytMeFhZcHV2MkZ5?=
 =?utf-8?B?NnRlMTE4YUN3bUtXSFVYZDFTNDZlMzVCd1puZ0J2RDBPWnlUWmszM2pmNGxE?=
 =?utf-8?B?L3RGNlZBclU3NmRta1RHNm94VnRjMnp5bk5FR0h6WCtRR2ZRQU1IQ1EvNTd6?=
 =?utf-8?B?NG1YenlEQ3J3a0I2cDdWNmxnMnNScnhwdzZWNW5xVjZHdUkxT3BuYk83cXBT?=
 =?utf-8?B?WWU4M0RIVGFFWWRabit0VlNrNUN3V3hPaE9zcS9UdkFQaDJBTWRweklYNjBs?=
 =?utf-8?B?S0h6aUNYK29WZ0tleUxlSFRYUUxDU0xyNGhVQjJjb3pWeU4xMWZYMnhnd2dT?=
 =?utf-8?B?OC91WThNZTQxaXVxRTFXTC96VUtETm5xQzAvcmZjZzJ6eGEyY3Azc0d1aEtV?=
 =?utf-8?B?c01ZRDBuMklMRUh6Yk9YNUE1RXBDTDZORmxOdDRnWVh2aEZ1NHVKUVE3UEIy?=
 =?utf-8?B?TGN0d1l0cytiVVE4MWNGdTZBcjNKVGprUTlQaFFWbXp6V3BNbHFwa0UzRVJw?=
 =?utf-8?B?SlJzU1YveE1aWHdLaHpEWFdEb1AzMHZYQ3d2R2RnR3M5eWQ5QWVQSkdHejc1?=
 =?utf-8?B?NXIxdWRLV1BJalFjT29UQkxBWUFqOXkrUE5GK0hCem9zYlJpb0NBdGgxcUZP?=
 =?utf-8?B?aHhLejlmNXkrS1JsWG0wUUtncndIRk9IczJpZUxTb2s5VUZQNm5kc2I5WDVt?=
 =?utf-8?B?THJjV2MyVWpSMzNxMFJXSHF0QnBCNEkrZVM2b3VXWTRYZmpha3JOYUZ6TlZ2?=
 =?utf-8?B?eEQ5U281WEUwSzJoL0l0c2NuUnhSWUNKeWh0eDBteFo2d0RGWFZHRUNLQndW?=
 =?utf-8?B?SGdRN0U1V1d3amJxRFUxdnZrMktxRm5yUFptWmdZc3ZDN1h5UlRBWGJaRTJ0?=
 =?utf-8?Q?Xj2QK3cXXaxmrw0kIG+7igJqUZl8FgFHoZq6XwXbJq5Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzlnOXpJUm8rV2pzWDA2M3FmMzlaMG5KSzNidE5aT3BhMml5NFFrWWM4aTlx?=
 =?utf-8?B?WDdLYkZ5dzJkbm1TdzZHdlpKdGVCcnE1Q1drUkhpcEVjY1F0NklaSUp1RWVE?=
 =?utf-8?B?U3NVQmpmdkpJRUE1Vk43QU5lWTMzdzlXUFJhNmZGYmhMQlV6cFFQR3hKY3pZ?=
 =?utf-8?B?K1NCdWJLVHZEM1BPOGJQOXdOaWdkNkpLcDNoU1FVV3h2L1hCVWZwZVR2R3BF?=
 =?utf-8?B?cnc4WHNPWWFjU0hmOWo1cWlxZVFYOXFxQjBMN0hiR094WGJzL3grbW1nU01C?=
 =?utf-8?B?UU1UZWdIcXc3a1VHdElrbm80clphNGlET0VZNWFMUEgwdTZKdlF0empRMGJO?=
 =?utf-8?B?cUdGaHh1ZWN5c0d6TkJHZTAyNnU0dXJXZGtsbjVtNGgxNWt5MlRjUW83V2Fl?=
 =?utf-8?B?WmxhSHVoKzhxYzNqYW5HUThyWnQvMUlqVC9LV00rN1ZzZ0h4ZjRPaXpLMG41?=
 =?utf-8?B?SDR1cDhkMDdKZjNLR2g0UkUwSVdJQ00yazN1ZW9vbzV4QkVKenBjMXlENDdu?=
 =?utf-8?B?Sk52UXVLWURLcE83QWFPT3FaMmt5aUtXdUFNNkhyZlcvSHVOZUJYVE5VamJZ?=
 =?utf-8?B?bTlnVzliRS9IV3RqVmhQZWI4WGRscHJJYWo4TDk0LzJyM0hmRFQwMnFNUnh1?=
 =?utf-8?B?NHNqVzJUeW5WL2pmNWlSOGEvQmpFajdKZDl3Q2QzZ1poQzlxK2pVck0yK0xC?=
 =?utf-8?B?SzRDdDl6U0Y0YjBDRlVTSENOM29MbTJ5RW1QZi9xdTNtTW9zdEZsUXVMSHdQ?=
 =?utf-8?B?a0YyWkdtd1d4VWY5ZjBTaEZlcGNXOGtxNUFpNmVTeUZBQWd4WExqeVY3eVM3?=
 =?utf-8?B?UjN0Szk4UDFWekRuajJVVFFWaElxcmtKNCtsbUxrRWFvK2M3SFgvaHFDc21p?=
 =?utf-8?B?NXFnN3pLbHZzQjJOU2xxQXFJckhac1pJTEcrZVhYUEZNRmpwV2plQWo3Wkt3?=
 =?utf-8?B?ek9KUklUY2ZxK0c0dklhT1I0cWJRVVVKV2NZaWZVSEJDeG1FeFZobVlvckxv?=
 =?utf-8?B?UnhkU1NUSW52YmZ3SVAvQUJ3SGg5MWZXa011Ykd2N3EybUVPZ3ZZY2dNL3Y0?=
 =?utf-8?B?ZDFwRjN6NHJjUEppOU1JTFZtRFVsS0VqVjZ1NGppWWxPL3N1b1BJQlNFUVAy?=
 =?utf-8?B?blVhbjQyWDdtMEJndGVROXhNZllBQml4QTEyQ1VITmJDSkFkL2c2WnM0NVBY?=
 =?utf-8?B?NSsxRS9EbXpXVHBFVlI0Y2ZoRTJHWExUU244YzQxSVNhbml1ckNzbkM1SEwy?=
 =?utf-8?B?bnIvMHpHbWVXaGRaQk9GQU1ERTR4UTVSUlFwN0hQTFQrV0Ntb1FLbVB2OEZF?=
 =?utf-8?B?cVV0Z2R2YTVEekpteXkySzRxQmY4STNKeUI5Skk0VXhUZmJKUjRmWmozREJ2?=
 =?utf-8?B?TG1ieGluVUZ0ZTdHOG45clE2K3RHVTFGaUJzbDZteXJhUWJoL3UxaHlDYmJP?=
 =?utf-8?B?SnNXT2x2TDhnNnNUbUE1R2hxWnpzRmdPVWlGNWtRVzNBVkxHMGxyRWdpaUcy?=
 =?utf-8?B?WUR6TXZ1bWR4Y0h1bXlzb2syR1lYb29NelcyTDNXZWJjTllQc0E3NndtTEJF?=
 =?utf-8?B?dmRKWGZPSmVUNGpoY1lLbUVPY3c1czJZNGxZNzNVd3NQVXhHcm4zM0xtVDFn?=
 =?utf-8?B?dGh1Q0dhS1dFS0k4aENsTDZ1RkZjUFdOM0F2YkxiVjhJYUpwMldLL09BQXhj?=
 =?utf-8?B?UU1XVHBrZ2xJVTd5cEpwZUhXcGtTRTFaRGlNS1duUm5MTWpxUlhTdW9LTHUw?=
 =?utf-8?B?SGJDa0pCd3U2dGhJRWtNYnNSenFSY09nRDNpQnh0M1JUT3JIeVBrYTh6OGNN?=
 =?utf-8?B?Rmg5SUdDekpMVlVoMWw3R04wL0UvNmhhTjRORExDNHNCMFVoRmlxVjVpTHIv?=
 =?utf-8?B?d3A1MDI2a21GNDRMdWErZ2ZuVk9mbVk5Uzc3UTFjMUltc0EyZWw4QWdKZzky?=
 =?utf-8?B?dFljMWFUVmR3U21yaDZBQ2JWYXRISVhRYXYvVlUwRlpVR3lsSi9XUHhIa2NC?=
 =?utf-8?B?SVgvREJ2clRTNWFhb3FzdDFyTVhkYnVKTHVUa2Y1bTVGc2pmbjBha1dlbXB2?=
 =?utf-8?B?dGo0VFlLNXlDQVdyb0lYb3VwRUtyNXFUdmxjVlJ3dVpYZUMzdzc0TlRmWmIw?=
 =?utf-8?B?OW1Eckk1Rmdua0F5T0RWbEZ2YnR0bzRuOWw1TDhCUFliU2lHRFR4c0loR3dw?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c65ac2-29a8-40b7-4277-08dc8017ef71
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 19:45:47.0891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+ALJxP/u9h/osS5vMNapb+c9kwDSK2Es3y9czvB/NoDZODMqTCW8EbqoS5EGGtgffVrCbrXmAs/GG9vkF2NBKIa90uRE2syf7Q5cYnEDNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7250
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

On Wed, May 29, 2024 at 06:29:45PM +0200, Michal Wajdeczko wrote:
> We can't follow the same initialization order of GT topology, MCR,
> PAT and GuC HWconfig, as done today on native/PF driver, on the VF
> driver, since fuse registers used in GT topology discovery will be
> obtained by the VF driver from the GuC.
> 
> While we need to program the HW PAT table prior to loading the GuC,
> this requires only basic functionality of the MCR code, which could
> be done separately from the full MCR initialization that may need
> the GT topology.

I'd elaborate here that "basic functionality" is specifically "multicast
writes" and is something that can be performed without initializing the
steering tables, which are only needed for read and unicast write
operations.

In general I'm a little nervous about how hard it is to know during
various parts of initialization whether it's safe or not to do general
MCR access and it seems unfortunate that in VF's there's no way to get
the initialization done earlier.  Loading the GuC is a bunch of
complicated code and I guess we just have to trust that there will never
be a need to do any MCR reads, rmw's, or unicast writes during that part
of the initialization.  We'll also need to keep an eye on error paths
going forward as well (e.g., if GuC initialization fails, we don't want
to do anything that would read from MCR registers in the error handling
path where MCR never got fully initialized).

Anyway, this should work and I don't really see any more future-proof
ways of solving the chicken-and-egg problem, so

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> 
> Split MCR initialization into two steps to avoid introducing VF
> specific code paths. This also fixes duplicated spin_lock inits.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
> This is alternate solution than proposed in [1] that VF needs.
> 
> [1] https://patchwork.freedesktop.org/series/134157/
> ---
>  drivers/gpu/drm/xe/xe_gt.c     |  6 ++++--
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 29 +++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_gt_mcr.h |  1 +
>  3 files changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 34c1896807e9..7c87edc06ffc 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -502,8 +502,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>  	if (err)
>  		goto out;
>  
> -	xe_gt_topology_init(gt);
> -	xe_gt_mcr_init(gt);
> +	xe_gt_mcr_init_early(gt);
>  	xe_pat_init(gt);
>  
>  	err = xe_uc_init(&gt->uc);
> @@ -514,6 +513,9 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>  	if (err)
>  		goto out_fw;
>  
> +	xe_gt_topology_init(gt);
> +	xe_gt_mcr_init(gt);
> +
>  out_fw:
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  out:
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 577bd7043740..386ac3269909 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -375,17 +375,34 @@ static const struct {
>  	[IMPLICIT_STEERING] = { "IMPLICIT", NULL },
>  };
>  
> -void xe_gt_mcr_init(struct xe_gt *gt)
> +/**
> + * xe_gt_mcr_init_early - Early initialization of the MCR support
> + * @gt: GT structure
> + *
> + * Perform early software only initialization of the MCR lock to allow
> + * the synchronization on accessing the STEER_SEMAPHORE register and
> + * use the xe_gt_mcr_multicast_write() function.
> + */
> +void xe_gt_mcr_init_early(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
> -
>  	BUILD_BUG_ON(IMPLICIT_STEERING + 1 != NUM_STEERING_TYPES);
>  	BUILD_BUG_ON(ARRAY_SIZE(xe_steering_types) != NUM_STEERING_TYPES);
>  
> -	if (IS_SRIOV_VF(xe))
> -		return;
> -
>  	spin_lock_init(&gt->mcr_lock);
> +}
> +
> +/**
> + * xe_gt_mcr_init - Normal initialization of the MCR support
> + * @gt: GT structure
> + *
> + * Perform normal initialization of the MCR for all usages.
> + */
> +void xe_gt_mcr_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
>  
>  	if (gt->info.type == XE_GT_TYPE_MEDIA) {
>  		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index e7d03e001a49..8d119a0d5493 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -12,6 +12,7 @@
>  struct drm_printer;
>  struct xe_gt;
>  
> +void xe_gt_mcr_init_early(struct xe_gt *gt);
>  void xe_gt_mcr_init(struct xe_gt *gt);
>  
>  void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt);
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
