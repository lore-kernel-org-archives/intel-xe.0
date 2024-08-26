Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8696FC5321E
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 07:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA2710E10F;
	Mon, 26 Aug 2024 07:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dG1DNz5A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E6110E10F
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 07:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724656118; x=1756192118;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5Fp8LSfkK7gGjvYujorOcI+CFni2eOm+Blv+hjw0p7Q=;
 b=dG1DNz5AoLr2FAQCPpyFyUw4UZrauZxHxgRHKmox+Z0hmHmf8JC42z0/
 g34D8la9OuV4MKOtq5jJNz8rVVWotpYpFrAoRHaZ0kaxJBFXNrcboxt+X
 Lxjo2bA/KuS4pb8e/bwiEAJvdfKe7Qbs04r5UzRfHGytbtJn03l2R/WP8
 maJnxpzTeZrwoH/d0t0/iXBWhbR8jiqWAHPgoeA0gq0VCWlNeZLl4dvVN
 2gyVEOcBhO52B7w4aWdMAoq0bAk2rIpXetmZH7pfeqGhaPzIFu7lsCZna
 P5VGY5hOW6EOnDbBzj7mDV5+C3bCzLIY8Ds+N1ZsxjU6DIygoQY8ksY54 w==;
X-CSE-ConnectionGUID: dARK5tYKSQe5A5YgF9csLw==
X-CSE-MsgGUID: tEDIyo2TST6wpIb+PRgglw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="26939091"
X-IronPort-AV: E=Sophos;i="6.10,176,1719903600"; d="scan'208";a="26939091"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 00:08:38 -0700
X-CSE-ConnectionGUID: Smo1HOniQvud+cmrNkRvbw==
X-CSE-MsgGUID: n4Qlx7K2Sv26F9Wc+Yz6rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,176,1719903600"; d="scan'208";a="66594952"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 00:08:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 00:08:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 00:08:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 00:08:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnt6ojB6CIzUq1+lBkTjo/0PXakDlo7qj1dTHXqzpBE2RRrc8MVKITynI4hqoYg8G8EE2ebFcd+AgC4Wj5Bh0wYQRiA+3psDjze3EzLWviI4fsSOWe8nrSoYlEoB9CkHZCFjhLk4jRMao2Cd8B6yxRA9IWQoDIGkFxcRKn1BAbjd8NaxN52ITEwr0O0YLFcB6qpsfqr8HBdYSKbKXHOueX3egxc0zvX4UcewmvnzChdASeMMo9/hHwhzVs6d3/SUycf6mAySHFlXSlHie1fBqpOxU2kOhguHjGJuXav78oaeNGq5JEjX2L70D7U9/Z2dwZeS2dwJW4Ts47w6xRB2eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFE7yGXGOs/ohJ9VlhQ5BfNDMOKoaanV+dN/4x3NHow=;
 b=xQlhkfHeGZAXnX6gUgFuBTLme77ssSp1Ecmz/qfqBUAFv6XoITmrha2oV24gpy/p4QOqXuAcSBbfIX4TEQ25e2vgMxrSbPiYYGU1/wmnLay762ec25mj6IT/S/ClYVfOtwVmzENCcjRdY5ReWkamuWn3fgCx/uVPrMzY/cpwKxVPKZaczGwPmyRbpfYTikgcEjrlOmtS8wZLWle44Z8fC3zE0dOhDZhE5icG9MQwfDjVwisytSWQsQHAnEze/ES63OIZzDMFqAgHFB5WFqcKt4uGMRnheKXYGjpi2bVPmbx38zmaYt/EIwehtw741DEHJKH6BlNp3WWFkINci/XQXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 MW4PR11MB7161.namprd11.prod.outlook.com (2603:10b6:303:212::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.25; Mon, 26 Aug 2024 07:08:35 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%3]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 07:08:35 +0000
Message-ID: <3650fdb0-af3c-4732-9f72-21bab3304d76@intel.com>
Date: Mon, 26 Aug 2024 12:38:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Fix xe_hwmon_pcode_write_i1 param from u32
 to u16
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>
CC: <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20240808172734.2233594-1-karthik.poosa@intel.com>
 <09eb6fd4-e333-4b0c-82c3-2ffee7295304@intel.com>
Content-Language: en-GB
In-Reply-To: <09eb6fd4-e333-4b0c-82c3-2ffee7295304@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::7) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|MW4PR11MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: a45c2efb-b0df-49b9-06fb-08dcc59de682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1VtdjJLaVZwRDZmLzZicVFJUUlWTnQ0Q1o2cXBHT3hoTG5JNTZHdXIxN0N5?=
 =?utf-8?B?bDl3OUwyQUE5OHZ4Z3NrSTJKUGxWMlU1L0xoUEhuUTNxV0hMR052S3llckRQ?=
 =?utf-8?B?Y2dxaGRCa1IybytpdVlzOTFUU0ZtZlhybXJKdkVKVGhqeTNVZDZXWEFDMmU1?=
 =?utf-8?B?SHFzSXYrYm5IUmxhdFlvQzBQUk1YUEN6LzJPcU14UmNvUXBTSnBlbVRadFds?=
 =?utf-8?B?ZjA1ZStTMUhYbVdsWkFQRStySXlYdW9hbGljQlJ4N25UTnZrNHBhaHIwQU9o?=
 =?utf-8?B?SE5ZUm11dE4xeDRMQnNidXloNTEreWlFTnZNVjJDSVB2cklkZDAyTHZtS2J2?=
 =?utf-8?B?THVmZndnUEJ0dWhYM2tqaTJkUnY0c09ZRkNLbWNWWUJPamhBaldWc0Z3czJ2?=
 =?utf-8?B?bTNGNHFXTEo3eDcrWnhsdFdjRDhPZG0zRk1iYkNja2U4VGJ1U25CbkpOUU82?=
 =?utf-8?B?K0JrK3J6a1VoQVM4U08xUUxzOWxmcVVUM1orcVV3aU5neEUybCsvUXVFNWNI?=
 =?utf-8?B?KzhQYUdKQ2pvL282b0pTWVV3ZkZBWDFMN1FzR2NtTlhuSXVJWlRIUHFNaS9B?=
 =?utf-8?B?cUxvbTJ6VitmeTg4ck1uUDU2RU5JbnZjV2l1ZTZUV2pTSVFrdXVlRFk4dExt?=
 =?utf-8?B?bFlXN0lMSXZhNThuWHYzMFVwUmZEOTNlWlQvdHF2bXZEWWFOVHQrTDVKYklh?=
 =?utf-8?B?Q0ZvSUloNDVKblpUS1UyQUNHTFhmcy9aamZOSk9JcTlFVUQ0dDFWZkdWZU9h?=
 =?utf-8?B?Y2QwdmlrY2ROd2QzV0tFUWZUM3NNWmJkT3JhblZPMlBmUHVLdTRHUmJxc29I?=
 =?utf-8?B?VXZ0MExCblY4R3ZRZVQyRm9wMUt5VEZzU1liWWJ5bVhvYTkyeDRNcDlDSE1v?=
 =?utf-8?B?RGVjMmZIT3dJU1ZQb0hWRk5VTVVrQys3cDY4K0lXWDFWdlh2WXZUdVdvK0JC?=
 =?utf-8?B?QlJZWDVDemRLVk9ZczJ2VW9yK0tTeDZJekt3MGVzdEFHdDNTeXJwamh2djBK?=
 =?utf-8?B?RkZYV0xmUkVlOUNaNnlsWXFWUE83cks1eHJXdDZGTGt5NWxrdytDSVVJSk1Y?=
 =?utf-8?B?dk90dGpUQ2MxYTRqcEVRNi80d3FJK2lVOE9XQnZvaVFoSkhKWndPeDVEbGRD?=
 =?utf-8?B?OVJscFBZZis3Q3pFRm42RDZYRG9IQjBoUFZxNWwvdk5rdXpaQlA2cE42R05J?=
 =?utf-8?B?Z25pQ2ttWTVRMnBsR3RJUU5ubVFwc2x2aGhrazIrWVNkNXNiYW14ZjZQY3Mr?=
 =?utf-8?B?WnJqMHRpZzFPcDAwdHNJTUpsVFZ1RThnckovenVHM0J1a0IvblkwK2FHUkRL?=
 =?utf-8?B?WFBuR3BsWG9jUWR6UWtOUC9DamdFbEowak8rZXRpV09jYTlrWTl5K0V6L3Zm?=
 =?utf-8?B?WjkxYjlmd2lsTHlqa1AxKzh0VWx3YUNNMjd2ckh3OTdrRGsxQXRxN2ZOWVNR?=
 =?utf-8?B?bkIzbFU5cUhPZThWUFRjMXJRK1dpR09jT2VPbzFoK09UUklWNVVleW8yVm5y?=
 =?utf-8?B?blZEMjJna1ovUEV1VkluUTZoOWl4dndRTnpBTnI1WDhzdjNjR0F4ZjdTYzdP?=
 =?utf-8?B?U01iK2VYSGwzR3lmTkw5TFFMNUorbzlNdHRYcEpLUXB5WVVvdURpM25mb3Fr?=
 =?utf-8?B?c0V5M0V3T29KL1VFVnhJclhaamhPczByZXM0YnJqRXdhNjlvc095VU1IdHlh?=
 =?utf-8?B?WmhBWHpEYjgvZkFTMzZNaVNSRUdXb3dBVUFMdS9pcnRnc0g1dTJUbnNrNlh1?=
 =?utf-8?B?SUtDamxkUDdndW83K1VjLzVDSHQrT2kvZ0Z1TWorakJvY1Y3VUhMYk91OWFU?=
 =?utf-8?B?ODltRmlkSE9qVHcxbTA5dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmhnKytjTmplZ29obWZLR1c3YVhQVFBCdndoUkxpaHlTM3JObWM4Umd2akZu?=
 =?utf-8?B?MzRVNjFCUUZRVGtqbTg2R0JPMkxlOFh2QVQydGpUREV2QW9QS0lRQXRGanZU?=
 =?utf-8?B?YTBrdi9iUmF6VW5pSEY2RkJCdnoxbW9pdXdXNHdpY3lZN0VMMzJLbmY4WUJz?=
 =?utf-8?B?Q2F6KzBkMUtKWlRnQ1EyWk1TOXJ3RGExVEZHaUpCTytsOXdPUVk4ZmxEMlZU?=
 =?utf-8?B?eHNnWWwxTDREQU1FM3dFK2EyVURQOXVKUVpIT3RRcWtRNXRCYm5hVFdBSWlX?=
 =?utf-8?B?RE9tM0NoVWI3N0ZDODM5T1pTbGd1ZTB5WEFuV1FWYjJxajdJMnFRZmRuMzVk?=
 =?utf-8?B?S2Z3L3B1ekxjMXM1clFCMEEwY0EvWTNSdkE4T2J3bUVuOUtIUGo0ME5GdDVa?=
 =?utf-8?B?SDBPREtSZ1pqSWQ4NGhJRWs5SFYxT3Y4M2hvTE9UdCtCMHd1aEo2VzVmdmZY?=
 =?utf-8?B?amZaa1VYYmtIL1c2LzRCOWNBMDVvd05WSktBalgrRHorclljOTk5SnJ0VVpp?=
 =?utf-8?B?L2ZjTmpXdGFpYlpzaVh6YzhQYy9CY1VDNXlkYVQwRWpCVnQ4cDRhS2xwS090?=
 =?utf-8?B?V2JMNTAvVk9XeUp1amNJLzBTN0ZWRGJpaVNsT2VudlRLVk90Q3NLaGFSKzVz?=
 =?utf-8?B?c2h5bTVWV2hpRGxuWFUxbFREanlQRTAyZE1jUEQ1dWRuUENaMGc5Y0t1bnF1?=
 =?utf-8?B?aFEwVGFScVVIL3pZZW5qclZMdkVPckFuQVZScGg0dVd3YjczRzhWMDNzL1RB?=
 =?utf-8?B?NmNqOU0rSHRnemRkdWNOSFRUbHNDTjNTZVFtWEc0UkhXeUdDcGs1Y1BBbHBC?=
 =?utf-8?B?L2EvSWFiN2N1bXd4ZlI1TG9ZcVpQRndvUVRxMllseE5rZlhTbW1Sb0F0Zytq?=
 =?utf-8?B?emFRaDA3WElTMWJYamRaOUx5b2lMcERucU9VK3ZGODVXeHhIK2lsVkNqTUNm?=
 =?utf-8?B?dVpveXZXK1JuOExNS0hhVXN4OStTd1UwSURRWkZOazFQaGZGbEliVTZuVCs2?=
 =?utf-8?B?c1R0Und5OGwvQUFEeHJJSjFyRmhYSEtRNUR5QXEzUHdPajk0a3l2L0ZCRDgv?=
 =?utf-8?B?YXkzUXFuclMxWExkb2J0eElEVmZUSWpHRDM4eEpBUjRCazJyVk9PSDBZSmtR?=
 =?utf-8?B?VGtqODFHSXdjNURSN2QrMndEbUlsN3FqWmdGVk9iS2xvcVlReTRycm10c0xC?=
 =?utf-8?B?YXIvd0pIZGhpMzFldjJYc3BSTnpZUjlVS2Z6N1psT0FTWHJmaFp3blNBaFB2?=
 =?utf-8?B?SWNzMlpKOTVMcW1FbFNDazZ1cHBFNHMvVzVXWGRtTnhBTUNsdHZrM3FHSU9N?=
 =?utf-8?B?UThFeWtnNDZpL2prT0RwVVZVWEI1b1oxbUFSV2UzV2E2T0VqL1dxZU9JVktu?=
 =?utf-8?B?ZzNCVVlHeU1UanQrYy9vdmk0R0pDOE1uL1NSdmZzY3pnOHM5SjlsRlo2ZjRF?=
 =?utf-8?B?TWtZNzhmS2YwanVaQnZPcDhQbWtvdnF6bTFuVURPZzdtdllWK3h4ZlU0b0FJ?=
 =?utf-8?B?T3Q2T29CZm9oS05jZkpNN3BpN0gxWUNjelJxY1ByY1JkN2drV051cTNnY2JD?=
 =?utf-8?B?QjUwUHg0cXlUVDhrNWVGN0lHbHFsVzRyOEVGcDA3T0ZpRFdmL2NkTUxLR0JC?=
 =?utf-8?B?TUZnMGpweUFmRkNGSEZQVU9NWm95OHFqbWtRSkhEbU5ybU8yVEk2dWRIamEx?=
 =?utf-8?B?LzZ3TmdWMGtGMnNvMXdSem0rRnlFNEEyU1RZQmdYS09EK2ZDSTgrWUtpZkZs?=
 =?utf-8?B?YVU1L0Y2elZtYTcyUU5HQ0doOHJGQk1mL2krcTN1d1dEdWk2WExPY3plMDlF?=
 =?utf-8?B?bmErWERUNXovYWcyQjdVNWx0LzQwQjRteUtZbEdDa2pNR2VFSUhHZkQ2d082?=
 =?utf-8?B?ZDlFaUNXQjh6T3RqcDZsc1I0TUVCd2lRWlA4SW43c05FODhpeCttU2UzcFBI?=
 =?utf-8?B?UDhiNGtVVjhjT0xtT2kzM0hWWmxpVVJpZ1dYV096QVovVll2Wkd5NDJ4dG82?=
 =?utf-8?B?WDJuSTFYbTIrQjBGNnhlZU1McHBYSDZ1ODNneHNva29VbTBLeWdyY2ZGcXlX?=
 =?utf-8?B?dFNNcnp5dmkxUDdFbHhueDdFaUI2cXRVS3gwZ3NYZ0RhajV1MVBPQTB5NEVU?=
 =?utf-8?B?UldDMmUxZjk1SzJBSzdCQ0UzZndGdlVYcFZLaW1EaGd1TzJ4ZUFDZFFrMllr?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a45c2efb-b0df-49b9-06fb-08dcc59de682
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 07:08:35.1348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBPxQmmVSJguXATrk5U/NCkwgdhYhVhWxE0sbrMhMnRwgtfSq8q1dS9/2dY1JVFp8u8wZhedfdZ9J2IRSZWp2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7161
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

Didn't find failures from HWMON tests from CI results.

You can review this patch now.

On 09-08-2024 09:37, Poosa, Karthik wrote:
> Ignore this revision of patch. Raised this to get igt results.
>
> On 08-08-2024 22:57, Karthik Poosa wrote:
>> WRITE_I1 sub command of pcode takes param of u16 compared to u32 for
>> READ_I1, so corrected it. Without this pcode shall return illegal
>> sub command errors.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical 
>> power")
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 832ea81faeee..617c8bdb8f28 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -446,11 +446,11 @@ static int xe_hwmon_pcode_read_i1(struct xe_gt 
>> *gt, u32 *uval)
>>                    uval, NULL);
>>   }
>>   -static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
>> +static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u16 uval)
>>   {
>>       return xe_pcode_write(gt, PCODE_MBOX(PCODE_POWER_SETUP,
>>                     POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
>> -                  uval);
>> +                  (u32)(uval & POWER_SETUP_I1_DATA_MASK));
>>   }
>>     static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, 
>> int channel,
>> @@ -476,11 +476,11 @@ static int 
>> xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
>>                         long value, u32 scale_factor)
>>   {
>>       int ret;
>> -    u32 uval;
>> +    u16 uval;
>>         mutex_lock(&hwmon->hwmon_lock);
>>   -    uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, 
>> scale_factor);
>> +    uval = DIV_ROUND_CLOSEST((u16)value << POWER_SETUP_I1_SHIFT, 
>> scale_factor);
>>       ret = xe_hwmon_pcode_write_i1(hwmon->gt, uval);
>>         mutex_unlock(&hwmon->hwmon_lock);
