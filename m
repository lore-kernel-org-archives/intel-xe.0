Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35E8D35160
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 09:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18EE10ECD5;
	Wed,  1 Apr 2026 09:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VD3oW/VV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B30010ECD5
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 09:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775035967; x=1806571967;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/issFm8KSrp4SnC9Js1mJFmfQzeFKYs4nSiMKhN/bn4=;
 b=VD3oW/VVkC0n/K9HmqWpgEnQTPFaYOjkPBJvY+MD/N08OUY+bjtkAnf/
 qrryk11XOuGYl2txlscEiIBtPrba2nnOLbtvlpa5CIax2RokQmDGyHIS2
 rOGHGlkontZCYptAQm3Vw2rxX71t/dWEFZaihGTiimOYhGtjlOIDiG23B
 3mMJxM5vl6UP94o3CO90xxPpAIEWwSXVtHeQqw/l0mhYi2MPFsiXQk5xk
 P3cXVUfu2Dslw+lkWBzaPljqT0/cXJfNv4wNqqFiR8ecQhXdiTaUjVqbS
 aJuxZadopvQ/iaZsToQEDBDbZgRoyL+HFa63jlM3Cc/YXPH/UmE3cCeHt w==;
X-CSE-ConnectionGUID: o2YGve7YQg6AMh1zwF2v1w==
X-CSE-MsgGUID: aWTYCYq0QzKdSciW06kXEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87143650"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="87143650"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 02:32:46 -0700
X-CSE-ConnectionGUID: 5UmxW+BVThSTA05l81f8Uw==
X-CSE-MsgGUID: hvLks5Z2SBmPJhgPyVJHcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="249841364"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 02:32:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 02:32:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 02:32:11 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 02:32:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QoBK+r7K7erY7Z0g8xwcqwLoTrJXzuuqL65M0m0ckk03Z3OXS5nmX8NORYgS3conmuN4cm9C2lCGQZdHcwMfIzEBq+kWJJb7DylcXPvFZPQkAlxssbmXJbvmxb6T2NltqJaZQ26NjWs7BjL446ir+UtCpTQJYBkoh+dwTV1Ce+/G851zGLj+hzX7pGMO0S4fAvGUSLoVgdGkCbpPXLVR4HhNMtdVVjn7kEIgcLhLuCZKSF85WuK8lMjQEdbHs8UJyH6KRO8DKqcOonXqHSmI/PbZTKS1oskbcf62qVYIDbLYcr+sJedLWfipUf9/iOiSXkmagEQDVz0KAluUgEYfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ku3Fj461jEdVNhOe1IMaIPEJNEZeERwKHT9LOASHLQg=;
 b=eYBo901IBDmeiSOAiCLkc1oSQuUIgxboPzryYGhQ+c4qpELpAvUwzizLb0GvScE54EEJF/cBoiLlEDQiuYlwVu0A3xLDdDzirE4jAcGflCNESruS5xyFJ3geNpjQ5oNS86oPcLhgXqZGN9yhi4ps9otLvcH7qBswN0IMcB0398g4q6QZ0JTBiPMdJxDKpg9+dqNLwkLFYkGNPhdhFnvX6hRRi3CzS+CNwznu0xL+g8zC/SVEqhNqv2TSKbwFnuLEGeLIm6M2W1N18zaYK53h8MvRwGp9fJcAd2oAt/WY2POt5ET1ny6dnVu0fD3IycHrK4hke9Cka3ABeNpN8jpR2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SJ0PR11MB6742.namprd11.prod.outlook.com (2603:10b6:a03:47b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 09:32:07 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 09:32:06 +0000
Message-ID: <31d8faec-78f8-4740-ad6a-19ccb8677fb4@intel.com>
Date: Wed, 1 Apr 2026 15:01:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/xe/ras: Introduce correctable error handling
To: Raag Jadav <raag.jadav@intel.com>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260331102346.1034100-1-raag.jadav@intel.com>
 <20260331102346.1034100-4-raag.jadav@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260331102346.1034100-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0199.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::11) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SJ0PR11MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: 89371969-4263-4a18-bcdb-08de8fd18a77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: zqGNmfA6u4e2ux8oKMontC6CXm9ACGjAOhqnAyyd5F/CuDZeaGNBrF9p1a/UQsK9J/euJkILSaTvS/A7kDh4rqs9OpWPt49Kmez5tlpw1WeObBYtOV8c+ETFP8dzxIVH0SlJnL50g+2Do3zJZzEuF6X2dPb3ey6fZJMyYmKz/8dkF9x06ASzGEYGw5hM+QYVQqT3THcPrT9V3gzbe8weTN2YAU2wSGICmerCAEPcsdUTUq4sPIRRiKh0Pq48DIkL8k7EIOQKcUWug81SuYcrpicwLeORUVe24ozOtM3aRSO+vAJ/etZzvqnK6haU+mV2yRFbveoKD0tqcYEdnunfMixuWYJ1WNKVSWbwHrsSjTwTruM7Di1d3dCHOY3H+6LKsqGeb3khFmP8Cl9wdG9NSc+B3dFTC5RmeG6x3g6WsFpdERFmg9ebRyAQRoiLogs+jV6Gr09UAk0I1J6rb01McROeRkzORv51MNrZWzCmO/yOXg/iU0umoM0v6BW/yEFcN6hDM+aNxGpzPz8m2vcQnwZcGC3Lb+o3Z9Xzbhm5Vb6PFjgFZcsRF4yIUyHcUjNGRg5nlx52r1F237B6pdnyhmedqb4vLXO2roxbx5IhOWETrXT4EPHMJWr009iAU3vfN6PISr5K+oAp4rmQ0VlrkmuHg7mUdrR82jNdcfNeMyp38s3lr5QJLPOcQMC/L3xVG4xECQfYr2vLLvgWrOb2aGu16LBGCtd0xqgfGqsxCjU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1VaQjdEbTRYVDFPQWF5VkVVTnFWNnBHRnZMN3JYVm5mMkJSeFFnWHA0b0s5?=
 =?utf-8?B?NkVsZjZyeVBSNE5jdFE2SFlLQmdGL3ZweUdrcGRoMkRiMkhMVENrVHNMZW1u?=
 =?utf-8?B?OGl1ek9zcEU2ajhMZjY5YnFEc3NMMjhYVTdPWFpzYitxMEhaaVc0WWV6aTZE?=
 =?utf-8?B?dkxheWlSK0xtOGhJUFhFdlBOSi80TkgwK0FEZmtIcHBLV0dqY2RNNFY4WHQv?=
 =?utf-8?B?ejZNVzJMTGtxOFNxMFlZVXJuTnF1ZXlKNjkvVFBtLytMdUNHK2Zrbzk1elgz?=
 =?utf-8?B?dlNpMGdMeEVDNUxLdFB5aWRqbUVFV0ZEWEFaYm81RkZmMmlVbVMrV04zWWY4?=
 =?utf-8?B?NW1ZUUlla2xuYU5hdWxIYWJlemF0OHhQYmc5YWUzWlQwNVdid0dxRnJKOENl?=
 =?utf-8?B?cmU0K0J2ZU5PTlp0QVIxUitYcHJIL1RJQnVjcUZLck1hNjM0S3N2aEUwM3c2?=
 =?utf-8?B?U29CTE1sWnZ4SWEzWk95MWRTV3BXbkZoU3FQbDBRV3hIYUtCTDJYTndCRFpC?=
 =?utf-8?B?eXFTRHFuTUIxRzFrRThRaktURGhBd3pvZTRFRUhzU3pBcXdvZmFYa1oxME90?=
 =?utf-8?B?TnFOTnRSc3k5RDUxVDZTUGxhVUREQW40TU9tTXlZTkg4V3VDNDY0anQ0Y25a?=
 =?utf-8?B?azRHV01YN1BuQnZMZVlJVE5XY2M4bDVQK2hnb1g2bGNFYzFjSFJDbEtFNzFP?=
 =?utf-8?B?bWFyQ0Y2bmt1QVB6ejZpNFdPY2pzbnUzNzdldDA3NlNSRDZLRnhiamMrWXpB?=
 =?utf-8?B?cHZRazNTVjlhMjFoVWg4Q1d3MFZwVUs2TWhpZWxieitnKzlSa1I1d0VkWWtG?=
 =?utf-8?B?U1dRRlBkc0hoTHdVaDY0ZHdtL3cvMnlJRWFZR1hBMWliOFUrMFI1MGpvdkVZ?=
 =?utf-8?B?WXNtYU9KOXNsemxYSS9DWlRSdTBjRnp5K3pyOUVlMWplaUNMR2hIdGhVYTBE?=
 =?utf-8?B?ejBTa1ExQkNjSm5hM2F5QkZFYS85WXcyeXFsVVIxZkpDQWhNT2lrTWJZQk5s?=
 =?utf-8?B?NTJ0NFEvc01QUHVialoxYWI5VUZvZ2NlSGJSSnRzbGNlYXdVSUpsQlZ3cEkr?=
 =?utf-8?B?dUFsVFBkSklnck1qZ3JqeU9xVDhlS2NucWI2TEJzZW1NTTZCdHR3NDFMR3l2?=
 =?utf-8?B?MkV5Y0FBV0FiQzhQY2pjaS9JLzdEY0VCUzV1Mm9EZG5tQUd6YjlrYTlKRFhq?=
 =?utf-8?B?ZnArU3dEeDNvcUcwamFTeHBjWlN4YUZGRFJwK1JBbWVma1Z6QS9BSXBiT0Yr?=
 =?utf-8?B?MlB4cFQ0LzVJdUVObUZNcXZzUFB0bmVacm1PMHJRbXN6L1YrZ3Y3MUo1UDhu?=
 =?utf-8?B?VkpDN0lrRzhuVHNNZFNndEZ1b0RVaXNaWXdOUFlWckJubHVOU2YyT3haQVhM?=
 =?utf-8?B?VVloQU1mejE1anBTR21zcjBVVm5nU3ptVHliM09XdHlEZlplMjl1elk4NStI?=
 =?utf-8?B?MHkwYzRGRFBrbDVmUDM1TnBxeHhSWkY4ODVGazlaZGQ2Z2s5amJxMHVrcTha?=
 =?utf-8?B?MEhvdzJaa2NWRXZDRmZJQ3A0dHRub2tMS0taY3h3dzFHcmxjbmhweEV2b0wx?=
 =?utf-8?B?TjQydk1FSGh3K1ZzUlJjWUlhSnhUbElidzNqU05VbmU1L1hkMlprSkFGY2Qv?=
 =?utf-8?B?QnFGZ2ZKTVBwY2JhTkdleWZOWDJhd252OUQvVitPYTJ4RHZRa24vdUZkWVRH?=
 =?utf-8?B?emdSRnNDd2ZWZUZ4ZmRPOG5hOEMvVE5Hai9oWVdnOTJIT3l6aWY5eGI2SlZY?=
 =?utf-8?B?dFFlUkNVM2tpckVvZWQ1NkRDUlU2M0dNSHU4SXhQRVFDeE1LRUU3d3JVSEts?=
 =?utf-8?B?OHB3M05FMGJnaW5hdkh6QXpMQjZlamwvVUF5Y2s0OGJjZjBndWpmc1RKZ2g2?=
 =?utf-8?B?T0VMNEVWMnNLWHMvYmYrMWMwYzdNM2sxVEVHdHgwS3NOL1Z2Zk5aTjdEL1JI?=
 =?utf-8?B?cER1RVVVa2lFNVhJUU01azlQNjljTndiaUdocVZNeERtOEYwOTAvSjlJZ2kr?=
 =?utf-8?B?ejF6bVRsazQyUDFkY2tBdWh6QVVhKzMxTU9FblJLWFIwTmpUYkhmVjNUczJx?=
 =?utf-8?B?TXZjam5CNWxWT0VUbStqdDFqYm1CVUhtVWpBZ0QzaHNBYTF4QmNmb3JneStG?=
 =?utf-8?B?ZzZtL1QvaTc4UnJpcTBvemVoYUg3MFk0eStIWWV3K0loUlNGMWJXY3FaZm1y?=
 =?utf-8?B?V3NoYXYrN3JxRlBYaFVWb1l4dWM3QTBCSFlaakg1aWVRL3JWS3Rpa3RmSUEz?=
 =?utf-8?B?NUQ1WDdRNy94YmZndXh6YWdzNFJyWUdCNzVYMVVhZmg2UndSY3FOMG5MdU9u?=
 =?utf-8?B?Um91Ti8xN3l5dlJ1UEtxTGtLMURTbU5OanpiSVJEV3UwMVNobytDNW4wMW82?=
 =?utf-8?Q?8GljIb3CE7NI4IhA=3D?=
X-Exchange-RoutingPolicyChecked: HGsSSuNtd09xi2Jny79TkBJ8DYH4LdexfXgsC6XWbV41p5e3d7eUr2XdNf0XfC9ITK5Ohc1ztr0qxT6W+lkN7RRtXcu8itFkuN5KaGjMSKFw3ykN16yNG3ibtULkNlx6dWdK9hkxI4nycYF8CAgqZ+L6+cfRq+RubbEFnIGWxY1EJHXGNXF5u0yoeBLnK/TmqTLUM6wJOKICA1MivNgqfdAYl17oEk0BYWCH88kmfOC1wVooGpey7r93YGfoP6Wkfyaq5cPuak4qCF9woX7+2m9XE1X6wQGCJR+enSf/k19NvcRQgjhulKvtgdbaefTGZFe0JNvlD+CMcr5vUFZ+uA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 89371969-4263-4a18-bcdb-08de8fd18a77
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 09:32:06.8470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+PLCikFrCmYho+NtiZN5oM17q69ssD8NXK1Ho7c0MbRHMYwILct9Q/eG2yBBTIRSqcpM+PCX9+ro7zsoMcrT+xXgFRXGzctrL8s3WOh774=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6742
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


On 31-03-2026 03:53 pm, Raag Jadav wrote:
> Add initial support for correctable error handling which is serviced
> using system controller event. Currently we only log the errors in
> dmesg but this serves as a foundation for RAS infrastructure and will
> be further extended to facilitate other RAS features.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v4: Fix Severity/Component logging (Mallesh)
> v4: s/xe_ras_error/xe_ras_error_class (Riana)
> ---
>   drivers/gpu/drm/xe/Makefile           |  1 +
>   drivers/gpu/drm/xe/xe_ras.c           | 90 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h           | 14 +++++
>   drivers/gpu/drm/xe/xe_ras_types.h     | 73 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_event.c |  3 +-
>   5 files changed, 180 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>   create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 593b359bbaca..1ecafb854355 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -113,6 +113,7 @@ xe-y += xe_bb.o \
>   	xe_pxp_submit.o \
>   	xe_query.o \
>   	xe_range_fence.o \
> +	xe_ras.o \
>   	xe_reg_sr.o \
>   	xe_reg_whitelist.o \
>   	xe_ring_ops.o \
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> new file mode 100644
> index 000000000000..4048350def97
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_assert.h"
> +#include "xe_printk.h"
> +#include "xe_ras.h"
> +#include "xe_ras_types.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_event_types.h"
> +
> +/* Severity of detected errors  */
> +enum xe_ras_severity {
> +	XE_RAS_SEV_NOT_SUPPORTED = 0,
> +	XE_RAS_SEV_CORRECTABLE,
> +	XE_RAS_SEV_UNCORRECTABLE,
> +	XE_RAS_SEV_INFORMATIONAL,
> +	XE_RAS_SEV_MAX
> +};
> +
> +/* Major IP blocks/components where errors can originate */
> +enum xe_ras_component {
> +	XE_RAS_COMP_NOT_SUPPORTED = 0,
> +	XE_RAS_COMP_DEVICE_MEMORY,
> +	XE_RAS_COMP_CORE_COMPUTE,
> +	XE_RAS_COMP_RESERVED,
> +	XE_RAS_COMP_PCIE,
> +	XE_RAS_COMP_FABRIC,
> +	XE_RAS_COMP_SOC_INTERNAL,
> +	XE_RAS_COMP_MAX
> +};
> +
> +static const char *const xe_ras_severities[] = {
> +	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_SEV_CORRECTABLE]		= "Correctable",
> +	[XE_RAS_SEV_UNCORRECTABLE]		= "Uncorrectable",
> +	[XE_RAS_SEV_INFORMATIONAL]		= "Informational",
> +};
Please use a blank line after structure declaration
> +static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEV_MAX);
> +
> +static const char *const xe_ras_components[] = {
> +	[XE_RAS_COMP_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_COMP_DEVICE_MEMORY]		= "Device Memory",
> +	[XE_RAS_COMP_CORE_COMPUTE]		= "Core Compute",
> +	[XE_RAS_COMP_RESERVED]			= "Reserved",
> +	[XE_RAS_COMP_PCIE]			= "PCIe",
> +	[XE_RAS_COMP_FABRIC]			= "Fabric",
> +	[XE_RAS_COMP_SOC_INTERNAL]		= "SoC Internal",
> +};
Same here
> +static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
> +
> +static inline const char *sev_to_str(struct xe_device *xe, u32 sev)
> +{
> +	xe_assert(xe, sev < XE_RAS_SEV_MAX);
> +
> +	return sev < XE_RAS_SEV_MAX ? xe_ras_severities[sev] : "Unknown";
> +}
> +
> +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
> +{
> +	xe_assert(xe, comp < XE_RAS_COMP_MAX);
> +
> +	return comp < XE_RAS_COMP_MAX ? xe_ras_components[comp] : "Unknown";
> +}
> +
> +void xe_ras_threshold_crossed(struct xe_sysctrl *sc, struct xe_sysctrl_event_response *response)
> +{
> +	struct xe_ras_threshold_crossed_data *pending = (void *)&response->data;
> +	struct xe_ras_error_class *errors = pending->counters;
> +	struct xe_device *xe = sc_to_xe(sc);
> +	u32 cid, sev, comp, inst, cause;
> +	u8 tile;
> +
> +	BUILD_BUG_ON(sizeof(response->data) < sizeof(*pending));
> +	xe_assert(xe, pending->ncounters < XE_RAS_NUM_COUNTERS);

Boundary check is required, in production line xe_assert as no_op.

Thanks,

-/Mallesh

> +	xe_warn(xe, "[RAS]: counter threshold crossed, %u new errors\n", pending->ncounters);
> +
> +	for (cid = 0; cid < pending->ncounters && cid < XE_RAS_NUM_COUNTERS; cid++) {
> +		sev = errors[cid].common.severity;
> +		comp = errors[cid].common.component;
> +
> +		tile = errors[cid].product.unit.tile;
> +		inst = errors[cid].product.unit.instance;
> +		cause = errors[cid].product.cause.cause;
> +
> +		xe_warn(xe, "[RAS]: Tile:%u Instance:%u Component:%s Error:%s Cause:%#x\n",
> +			tile, inst, comp_to_str(xe, comp), sev_to_str(xe, sev), cause);
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> new file mode 100644
> index 000000000000..92ee93d4e877
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_H_
> +#define _XE_RAS_H_
> +
> +struct xe_sysctrl;
> +struct xe_sysctrl_event_response;
> +
> +void xe_ras_threshold_crossed(struct xe_sysctrl *sc, struct xe_sysctrl_event_response *response);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> new file mode 100644
> index 000000000000..0e3ba9e81538
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_TYPES_H_
> +#define _XE_RAS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#define XE_RAS_NUM_COUNTERS			16
> +
> +/**
> + * struct xe_ras_error_common - Error fields that are common across all products
> + */
> +struct xe_ras_error_common {
> +	/** @severity: Error severity */
> +	u8 severity;
> +	/** @component: IP block where error originated */
> +	u8 component;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_unit - Error unit information
> + */
> +struct xe_ras_error_unit {
> +	/** @tile: Tile identifier */
> +	u8 tile;
> +	/** @instance: Instance identifier specific to IP */
> +	u32 instance;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_cause - Error cause information
> + */
> +struct xe_ras_error_cause {
> +	/** @cause: Cause/checker */
> +	u32 cause;
> +	/** @reserved: For future use */
> +	u8 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_product - Error fields that are specific to the product
> + */
> +struct xe_ras_error_product {
> +	/** @unit: Unit within IP block */
> +	struct xe_ras_error_unit unit;
> +	/** @cause: Cause/checker */
> +	struct xe_ras_error_cause cause;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_class - Combines common and product-specific parts
> + */
> +struct xe_ras_error_class {
> +	/** @common: Common error type and component */
> +	struct xe_ras_error_common common;
> +	/** @product: Product-specific unit and cause */
> +	struct xe_ras_error_product product;
> +} __packed;
> +
> +/**
> + * struct xe_ras_threshold_crossed_data - Data for threshold crossed event
> + */
> +struct xe_ras_threshold_crossed_data {
> +	/** @ncounters: Number of error counters that crossed thresholds */
> +	u32 ncounters;
> +	/** @counters: Array of error counters that crossed threshold */
> +	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> index 800d100f09c5..139ecd4aafcd 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -6,6 +6,7 @@
>   #include "xe_device.h"
>   #include "xe_irq.h"
>   #include "xe_printk.h"
> +#include "xe_ras.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_event_types.h"
>   #include "xe_sysctrl_mailbox.h"
> @@ -38,7 +39,7 @@ static void xe_sysctrl_get_pending_event(struct xe_sysctrl *sc,
>   		}
>   
>   		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) {
> -			xe_warn(xe, "[RAS]: error counter threshold crossed\n");
> +			xe_ras_threshold_crossed(sc, &response);
>   		} else {
>   			xe_err(xe, "sysctrl: unexpected event %#x\n", response.event);
>   			return;
