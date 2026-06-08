Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC81CD6E79
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 18:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CD310F832;
	Mon,  8 Jun 2026 18:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eYcIfOn3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F9F10F834
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 18:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780941667; x=1812477667;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N5a9cTJpku8nBpSyAIx0xZJeZ/WqUWy94ipGNCsuqNE=;
 b=eYcIfOn3arrMTwMNWBBCvQF0Pm6Te6mmM84wBaOhsO9x7Enxnu6waiAl
 a2NgtKZZBThdCLgEzBlwMc26ulo6Il3t+Y3ZgfcYXLKMgPibHU1fbZPw/
 tLWQG/9WlQpn+mMAIEHEDPm/tFIYOKXr7f+M8DgAY72syn/4G2t2Wn+58
 HlVZXg2gPf0wbSvSd3RlNVGbnbSLRu0CA1DqZYZmDXaiVsEcNkYZjuf+7
 S3HlLXshdauNVKMSIq3HFFM1gEpB09UH/8lu+BzGzsQ8Y3h4l8rKRLXeu
 cfKgTmnN8euIZQER9MZbCUGniociXf5ZwuDyWRvw0EGL1WQ/SMjGS8lk9 g==;
X-CSE-ConnectionGUID: 8LCh8oVIT3iPgJItUMUZOA==
X-CSE-MsgGUID: vpPOTVNfSYu4GZp3mHBtaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="80821054"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="80821054"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 11:01:07 -0700
X-CSE-ConnectionGUID: 3bEQrwTeSeS3CddIxEouKQ==
X-CSE-MsgGUID: q8Rj7ajdQfu/rsRJeAUyyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="245486043"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 11:01:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 11:01:05 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 11:01:05 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 11:01:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0kTjTb52+DUrQHf1DKGXsl8ItGVuzkxaQNVD9RvKtgAgz3vT6v6tUn9e72v/3E6/E2luT/Ew+h4teAGvEjgS2WfZ7pTVUZnh0LoVL9z/Ay9lA5yWK989AomowpSF5hlgtML8eJoTsl2erKUvLKm3WgznwtySVe5MH3bURNnSgAG87FlRud5LtKvNCYTCxylbRZaSxmPbo+pqr5XR6OVs6lFujbOfrUHx+l3lDUu88qrYTFagORyMnKiQ6VJusvxdxltmLfv4B/n9HDTllG+4RWExoo1kEv8kUPM+ppvoHH9VgfP6JEc4sNg5krRYlniW7r/JwpbntOeVMrBCOtlPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeTDiUIL8MOKIbgn8QYLHJdj1eWq4CvZntla7RH1fLc=;
 b=v6TuxVJgzPA9DTgcmcvKPApymTLxBff3Qg48KKmOfKNNRWOzvQb392RqptYRTMf8nKXPHFUSnGreLDLx+IOoGHQ0z8SdfxiRIYnLkuj87qEGRn06wUZFKD9sVBQNimAt1jYV4CCOae59rLJXLtklOFZlQ/jfys6uMTdMeewgA9WWVJD/sXEz2HvtphI4lcmEQR/40Zoq0kA2Us92gNtFsa5ncYb+mYSDOnU5DEMtPtS3pQX+4ssAv+EOH5ueYgnVM7tnDISHTtd2bNr6nTHc0fm43NvfF1E9uS1xR2rGJP/Jv8HCRUk9qU3uUxDt+HU5N0PY9iSulhM9ENUvnUGNKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY8PR11MB6866.namprd11.prod.outlook.com (2603:10b6:930:5e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 18:01:01 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 18:01:01 +0000
Message-ID: <47e740b7-fcdb-4031-8118-4c6b942f788e@intel.com>
Date: Mon, 8 Jun 2026 20:00:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/18] drm/xe: Add xe_client_debugfs and introduce
 debug_data file
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <simona.vetter@ffwll.ch>, <matthew.brost@intel.com>,
 <christian.koenig@amd.com>, <thomas.hellstrom@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <gustavo.sousa@intel.com>,
 <jan.maslak@intel.com>, <dominik.karol.piatkowski@intel.com>,
 <rodrigo.vivi@intel.com>, <andrzej.hajda@intel.com>,
 <matthew.auld@intel.com>, <maciej.patelczyk@intel.com>,
 <gwan-gyeong.mun@intel.com>, Christoph Manszewski
 <christoph.manszewski@intel.com>, Sunil Khatri <sunil.khatri@amd.com>
References: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
 <20260608161639.1652127-19-mika.kuoppala@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260608161639.1652127-19-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA3PEPF00000512.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::666) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY8PR11MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c000f0-d0ec-4b12-dac2-08dec587e630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: VWGRsCmhQ4PyhjtixhFhUolTpu7q0MAck9gfNfwuAHOQGqz4N8HJFh0NCIiMyZFUNTknZ23gJ+yV6lwGmYLNnBlrJQY2sUUotxBFh8fujHaLwUiu2d/E4ap3wmeKdRuB/bw9qXCYdvyfAXko0fnL90lj+kb7uJoGktFM9K3btwGNfSxVKtUzoIIXqOtRWaBEGFUvM+0J0euBC4S9tL+cSpgZ+nW1Q/SQQKHdkPB9YFg5/RcSdH9mdd+e3eBaaf/E9ffsV3rX8ydYVvMevSzH2Ax4wgygq5rX2XVaOYnkDugothXy1aksXDQE04LHOis5V0ilVGl51spoWN1n9W/MwCtSxz5yp134JxEOD/ldkzyaTLvtYS4ghBs3cb+vwJzdNzzAKhoIEX7eo9JqDcOGyQ3Fkuo40ZDeigIwMh9S4P1u3BWPf/WvR0y0B3AjN1aY0rMO3apES1AMSSTybm6TTZHongty8xdT1F3BvO5eq8gG2hydbLLm+RCePJkfWmYzAaP7bQ5DTULNmWSGIK85TrfNiYjFVqsUshHg6IJtw14UpVOdMSt1+SMR+VlaO4AuurUyfBfJ/Ou+f3mMEK0fLWJoqBbJbwiSaUlbXMBWFwx1ljHiQYC9ZhS5iP0ORAoCPoMZIa4o7XX37vAnl7gyErBoqyiqLrlXH9RD8g8A0Tzf8tMLlXkI+fajMysH+bEo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE11cG81aFZsVnEza2s3eUwzbW5UQlVjdk9KT1BqdmtINFZieGxyQlJ4dzhM?=
 =?utf-8?B?WU80cnVmT2g1UG9VNEZjTzZZV0lQQWREUW4rM2Z0dmlVYldRenBHalZyNlhC?=
 =?utf-8?B?OFZ1SkIya0tSY3RPV0hpVUw0U1V6SGhTcHVRRmdxc01GdldIMXZtNkordldP?=
 =?utf-8?B?d3ZEUlBSSXRCOGhmRnBTeVlua3lheGZXOVhrZkxHZFJ5T3JualFndlNzbXdC?=
 =?utf-8?B?alNpeHlYSHRvNnp0T1ZuU1RtMFlzNFZ2dzluMTAyWHp5WGxOREVQMzVjUzV2?=
 =?utf-8?B?aUdlSXczd1c4ZGJ0WVdwUEJSeCtxemkrc0FPMzBCWHAyZENPMGQxTmlaejhY?=
 =?utf-8?B?MDBkZERvazZDS2dJVkltaTIrYlN5Z051Y0JpL1VKL0Q5U20xZkZxbWVCUEtO?=
 =?utf-8?B?ejdPaDJSejRwbUFGa0xIUGdEZ0FVVDRjbzRBOEpuOTRKY0FDU1JjVnUvNHo1?=
 =?utf-8?B?RlZWMFRvVXhRVTBuRlFUODI0TXIrV3J5VEJ0NGp6L09PbFU2Y1kxKzJjRmln?=
 =?utf-8?B?b2VnRnBjMFZab2RjWkFpUW5ER3kwbHdWbGJvSXg2MkVYY3ZyMWd2S0NZeGo2?=
 =?utf-8?B?amFhSU1NR3hmVUx6WkJsMU5zaHhjd3R5NWdVNzY0YmtOYXFVcFU1Myt2N0sx?=
 =?utf-8?B?TURKOW5ZK2loTmg0cGR4Qm1JUlJFVk0zVDVuUGpPRXdVVmNjRkc1c3lmSW1X?=
 =?utf-8?B?bThZaWV0Tm1CWXZKL2o5ejhEMjhUa3cxcFpaSzlMMFhzcVg1dWVRZFJsc2pu?=
 =?utf-8?B?N3dTbDR3ZnNuRGxlM1NDR0ZCNGE4SHU3UHc2VllWTW0yTnZqcXl4aEM4Y0Jj?=
 =?utf-8?B?YUo1RDhoTWZVbXlybGZUcXpyL1VhUmN4TkRuZW1CSllBbG1aS0dzSWRQQ3hS?=
 =?utf-8?B?cmpzMklhblBPRVcrc2UzWE5lLzN3OWVNQkdNRVdUVnIxa0lpSGhTbUtpSFNm?=
 =?utf-8?B?NG5DSmtjU1lpSVpmdlEvbktaU0tYbnIweUZDOFd3NXVabTRsQ04vU2JLdGdB?=
 =?utf-8?B?dVg4cXZiNUUzbFBuRzEvQmZxZHZERGlFV2h3TGhmVUYwZm1iN3NraHlwNlho?=
 =?utf-8?B?M3hPQ1c5VEhqMUlqa0U1N09aeUVKelpremVoOE9zZTVnY1h3VWpsNllBcFV5?=
 =?utf-8?B?NGEvbFg2RFo4bjdhWHRoLzdnbGNjTFUwa3VxWm9ZbGN5aXo3WlhQTE1ITnpj?=
 =?utf-8?B?ZFdTbWl5L09wNC9zTW5RMTJaYUJVMkoyeGliZXB4aktLT29FRm1kK3Z4ckNO?=
 =?utf-8?B?OTlkOU5pMFVSV1FPZGNaakdPU3hzdmpoTkx1dHJwTjZhM1BrTHFmOHdMd3VN?=
 =?utf-8?B?RUJNcGovbkl2NlRnNksrZlhMMkVpUFV1RzdMMUVVZzlLM2liK2NkeW1RTGdV?=
 =?utf-8?B?YmFUWVJ6alM0MGdTK3IvWkJYWC8wdVlaQVN3dyt4cjI5bVE1M1hTTkZMNTRC?=
 =?utf-8?B?cGRRR2djbHZVNXBrcVRSQVFBZko5TDNDdWVsRG1zbmdyTkZibmgrS01UOUFv?=
 =?utf-8?B?eUFrNXIvQm01bXU3MlBSMkpHUUdNbkFaeXUzckc0akhwSWFuWVdIZnBmSmtL?=
 =?utf-8?B?Z2UvVWQzaitTNFRIK1hvL1RqWDhvTmNiSnorZHVjZDJVVjhBNWdrakc4TmZF?=
 =?utf-8?B?ZVRUNzMrN01qZ3Fka0FPTVRjWUpTUzJsZHNsd2t0RXRTTEs1anBNNHNpUVBs?=
 =?utf-8?B?TU55OXpZWkxwUFl3RjZnRDRPaVlJTm5FTzYwOEhUd2U1OS9qNFZwOXdDcjM4?=
 =?utf-8?B?TmV5ZGJlUlFNR1hDRXlObXlSb1JlRHNJZ0g1SjBMNzdVSHVTTE5wWFpDZlB5?=
 =?utf-8?B?STlHWm1sczEyeWF2L29KWGpmNC9RbnhySTh6MWkvNHl6ejhKNjYxOFJTRGxI?=
 =?utf-8?B?MzdOVGNpWm11YmJ2My9Ubm1aWThLMnQxUTg0TmswaElmMlZXbFZzWTZucTNC?=
 =?utf-8?B?MHRON0ZYYzhFdnpTQXorZ0VkZWRXdjRxOEl6a1VPNzdBV1pUYVljZzc0M2d4?=
 =?utf-8?B?NmxiS0xMTGF3bnFnYTE3MFVINEdsS0gwWUIrbWV4RFJDYVRrSFYrSkgzdkJR?=
 =?utf-8?B?bWFqMVcxcmZDU2I4T2M1bWhKUVlQQ0czL2kvSnI0YTJuSFkrOVByVWc0bkQr?=
 =?utf-8?B?M2pRWUUyb2pZVTQzdWMzYjZNSUZZQWpXR1Qvd3RMVElVN3hMN2ZJYTJpZUE5?=
 =?utf-8?B?aXR1NWtWaFc0NWkxNERkWmVaUk8xZnc1M1h1N2FIWjRzeXI1ZFl6dzVCRFpT?=
 =?utf-8?B?UjFpSkhxNXZKTmxRWU9rNkRieGJ5ajAvT3BhNnAwZnYzZEtJZjV0bVJLdW1Y?=
 =?utf-8?B?cEdqVThGRmRhSVF1aXpNRkJIaU9kQmQrQS9JWWYxRkdweG5jUE9RcHkrSnpT?=
 =?utf-8?Q?FiYbdtBgu4bpsJms=3D?=
X-Exchange-RoutingPolicyChecked: bC4w9gN5G6HsORJsF4Hpm+Ne/vwTMeHb3bLEFwZuFtAgpMO5luyyUikIvN8ooyPO0sqSLMafnthznqYh4k614ZZfaTWQnpSq4iLfuvcSFqegLLQLgSWRSlSIBR2osU5138kjyfM7rSrEzFcwTz/7tSap7zC2l2cV/a31h9C5PI7lQNv+bnOQOSxAkNAU83m8KDyDYswtsPodyt3jOceKYmDwjV1WsCJUW+IgcDp+LqGtiGafIBzwBWMp/HN6TT0daYGAJE0LFbMAQ9Xru9sen50lVgwdBxIlfj+tXRgf2xeB5IqBFRkbhWJD8D+MEBpfKJfLoZcQzIHQKpVQe8x1ng==
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c000f0-d0ec-4b12-dac2-08dec587e630
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 18:01:00.9077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEk2I6Urp/DGah1EwBkZ3QURj5xHUwXb7ibcc/Gbtzs4fs206xOQD/h1GTls+3QHXf5SDnXAita4R8DQGe5VWePVrQ5WKjxwzuqLmVNcpcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6866
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



On 6/8/2026 6:16 PM, Mika Kuoppala wrote:
> From: Christoph Manszewski <christoph.manszewski@intel.com>
> 
> Create a debug_data file for each xe file/client which is supposed to
> list all mapped debug data and attempts to mimic '/proc/pid/maps'.
> Each line represents a single mapping and has the following format:
> 
>   <vm id> <begin>-<end> <flags> <offset> <pathname>
> 
> v2: trim len in debug_data_read() (Sashiko)
> 
> Cc: Sunil Khatri <sunil.khatri@amd.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile            |   3 +-
>  drivers/gpu/drm/xe/xe_client_debugfs.c | 132 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_client_debugfs.h |  19 ++++
>  drivers/gpu/drm/xe/xe_device.c         |   3 +
>  4 files changed, 156 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_client_debugfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_client_debugfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1531ea9b3a93..e43d89a45d39 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -354,7 +354,8 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
>  endif
>  
>  ifeq ($(CONFIG_DEBUG_FS),y)
> -	xe-y += xe_debugfs.o \
> +	xe-y += xe_client_debugfs.o \
> +		xe_debugfs.o \
>  		xe_gt_debugfs.o \
>  		xe_gt_sriov_vf_debugfs.o \
>  		xe_gt_stats.o \
> diff --git a/drivers/gpu/drm/xe/xe_client_debugfs.c b/drivers/gpu/drm/xe/xe_client_debugfs.c
> new file mode 100644
> index 000000000000..3ce9527188c4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_client_debugfs.c
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation

2026 ?

> + */
> +
> +#include "xe_device.h"
> +#include "xe_client_debugfs.h"

keep then in order together with other xe includes below

> +
> +#include <linux/debugfs.h>
> +
> +#include "xe_debug_data.h"
> +#include "xe_debug_data_types.h"
> +#include "xe_device_types.h"
> +#include "xe_vm_types.h"
> +
> +#define MAX_LINE_LEN (64 + PATH_MAX)
> +
> +static ssize_t debug_data_read(struct file *file, char __user *buf, size_t count,
> +			       loff_t *ppos)
> +{
> +	struct xe_debug_data *dd;
> +	unsigned long vm_index;
> +	const char *path;
> +	char *kbuf;

maybe

	char *kbuf __free(kfree) = NULL

to avoid leaks?

> +	struct xe_vm *vm;

keep vars in rev-xmas-tree order

> +

no spaces

> +	struct xe_file *xef = file->private_data;
> +	ssize_t total = 0;
> +	loff_t pos = 0;
> +
> +	if (!xef || !buf)

can xef be NULL here?
if xe_file_get() can return NULL, then maybe .open shall fail?

can buf be NULL here?
it's unusual check

> +		return -EINVAL;
> +
> +	kbuf = kmalloc(MAX_LINE_LEN, GFP_KERNEL);
> +	if (!kbuf)
> +		return -ENOMEM;
> +
> +	mutex_lock(&xef->vm.lock);

maybe
	guard(mutex)(&xef->vm.lock);

to simplify and have more robust code?

> +
> +	xa_for_each(&xef->vm.xa, vm_index, vm) {
> +		mutex_lock(&vm->debug_data.lock);

ditto

> +		list_for_each_entry(dd, &vm->debug_data.list, link) {
> +			int len;
> +
> +			path = dd->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO ?
> +				xe_debug_data_pseudo_path_to_string(dd->pseudopath) :
> +				dd->pathname;
> +
> +			/* Format: <vm id> <begin>-<end> <flags> <offset> <pathname> */
> +			len = snprintf(kbuf, MAX_LINE_LEN, "%lu 0x%llx-0x%llx 0x%llx 0x%x\t%s\n",
> +				vm_index,
> +				dd->addr,
> +				dd->addr + dd->range,
> +				dd->flags,
> +				dd->offset,
> +				path);
> +
> +			/* snprintf may return more but string is truncated to size */
> +			if (len > MAX_LINE_LEN)
> +				len = MAX_LINE_LEN;
> +
> +			if (pos + len <= *ppos) {
> +				pos += len;
> +				continue;
> +			}
> +
> +			if (pos < *ppos) {
> +				const int skip = *ppos - pos;
> +
> +				len -= skip;
> +				memmove(kbuf, kbuf + skip, len);
> +				pos = *ppos;
> +			}
> +
> +			if (total + len > count)
> +				len = count - total;
> +
> +			if (copy_to_user(buf + total, kbuf, len)) {
> +				mutex_unlock(&vm->debug_data.lock);
> +				mutex_unlock(&xef->vm.lock);
> +				kfree(kbuf);
> +				return -EFAULT;
> +			}
> +
> +			total += len;
> +			pos += len;
> +
> +			if (total >= count) {
> +				mutex_unlock(&vm->debug_data.lock);
> +				mutex_unlock(&xef->vm.lock);
> +				kfree(kbuf);
> +				*ppos = pos;
> +				return total;
> +			}
> +		}
> +		mutex_unlock(&vm->debug_data.lock);
> +	}
> +
> +	mutex_unlock(&xef->vm.lock);
> +	kfree(kbuf);
> +	*ppos = pos;
> +	return total;
> +}
> +
> +static int debug_data_open(struct inode *inode, struct file *file)
> +{
> +	struct xe_file *xef = inode->i_private;
> +
> +	file->private_data = xe_file_get(xef);
> +	return 0;
> +}
> +
> +static int debug_data_release(struct inode *inode, struct file *file)
> +{
> +	struct xe_file *xef = inode->i_private;
> +
> +	xe_file_put(xef);
> +	return 0;
> +}
> +
> +static const struct file_operations maps_fops = {
> +	.owner = THIS_MODULE,
> +	.open = debug_data_open,
> +	.release = debug_data_release,
> +	.read = debug_data_read,
> +	.llseek = default_llseek,
> +};
> +

all public xe functions shall have kernel-doc

> +void xe_client_debugfs_register(struct xe_file *xef)
> +{
> +	debugfs_create_file("debug_data", 0444, xef->drm->debugfs_client, xef, &maps_fops);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_client_debugfs.h b/drivers/gpu/drm/xe/xe_client_debugfs.h
> new file mode 100644
> index 000000000000..9eace15c0a49
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_client_debugfs.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_CLIENT_DEBUGFS_H_
> +#define _XE_CLIENT_DEBUGFS_H_
> +
> +#include <linux/debugfs.h>

is this needed ?

> +
> +struct xe_file;
> +
> +#ifdef CONFIG_DEBUG_FS
> +void xe_client_debugfs_register(struct xe_file *xef);
> +#else
> +static inline void xe_client_debugfs_register(struct xe_file *xef) { }
> +#endif
> +
> +#endif // _XE_CLIENT_DEBUGFS_H_

we don't use // comments
we don't use trailing guard comments

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 02ab8b307c9f..539ce3be8d42 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -25,6 +25,7 @@
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_bo_evict.h"
> +#include "xe_client_debugfs.h"
>  #include "xe_configfs.h"
>  #include "xe_debugfs.h"
>  #include "xe_defaults.h"
> @@ -125,6 +126,8 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  		put_task_struct(task);
>  	}
>  
> +	xe_client_debugfs_register(xef);
> +
>  	return 0;
>  }
>  

