Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715E2C55162
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 08:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234EE10EE4B;
	Thu, 30 Jul 2026 08:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzjVwoSs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61A310EE42;
 Thu, 30 Jul 2026 08:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785401085; x=1816937085;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2ep1PYoVTSAXXTmHwQoRD6U998CbDrEgBh6wFmTRpJw=;
 b=nzjVwoSsggnGhbv7eGAWIuOPDa68y9qLmahYhfXvuI7X0xulvqpZG+7P
 rGGz1bJ/xF+m4cr+Eyq+4GtRei2SPjamhMMC0j3eIt8HbmFTS4CAmwwZM
 KRLyPqphqeHU/uMJbswXQJbCGACzwke+ZTIBzD1b8oodos99kHjWp7+2I
 QLrUbmJe8fDJ9JXADqSfCvjFD4sUdc2F5FxTHT9t0ucM1/nr8/sqCVGKV
 8cjwatL8eR84t+WrOqZm/Hm1lJ5U98rh/AwY2yzGnu0tSsBl/xJ+aQ2Sa
 l8RTAC+v353IEbUTyLarPD8PVgEI3AcAnuf+Cj922bGkDIM+Zc3D6uOkg Q==;
X-CSE-ConnectionGUID: vfwq5lB9RCSl5iiElRQAOw==
X-CSE-MsgGUID: 8dHAEjOQQ0+tHz/0niWBUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103552118"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="103552118"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 01:44:44 -0700
X-CSE-ConnectionGUID: YPMbGz9IR9uH66dlHU4M8Q==
X-CSE-MsgGUID: dxy2osCSStiHocN9ul0K8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="257563003"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 01:44:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 01:44:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 01:44:40 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 01:44:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8FnC4M4EkWY5OnavUha4NgLSMXKnSiWBouV3ZcKdLLYNGJayRWo/DEyPS7qtSBHqAUU4GvEn1NBk0TLeOG7z/Y+2R6gJkdgMqb41LZ5fr/P1xd4CG8C9kIUbYdOdn0zh7hkg/0uUaTv8VApaDPI7Ke4jRwk/Ym7MVOWGfUdKGcjfxhxEdhuVyUGISd0mQAAAesr7/XPqUqJ08eeO+vNe/JRvjM60yOH8zulxxHXpYvgADQAviZXwCi9xfvc2HESqEcIRgm0h9W5CvwIVBCUR5MurDiQ8xYneBA1vJaiD+z+AJb8BLUacksTA/6pQcAPmfw6actyH1WNphLwQVHOFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzDrGenJhM/G+Z0hxDgGVoERD6dRUMUd7NnBvcN6bHU=;
 b=HTnkuqqTpnIpNpTOAUmT1ptq2USe2ZD7E6ymYD+hj/rHEOR+lx14NKA7iuOo3y3PRKkFQLhGd2iMp+DZNn6oxHxwYtSEIVSM0i9Tk8fOb5or3r0jMcTT6Jk2nkCpgX0kzqDWLMW+8sEZzreB6maAY54IMsDWQVJpChddApeFYCaB7v7jwa8m8N7Yhpabi2y9OFCfKKUC4ltuQkVTkgMs+rEBR9tAa4wjuhMvwucUa83Ef3hppRcilXezt0LdVBfp8MDeUKFR/9XHUDzI3BrAiqLqCaUM4ks1VDpi1epGb4I+earTxI/99PzxKIygvjfTWphxUjYFlk0E1BY1hmi3FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by DS7PR11MB5968.namprd11.prod.outlook.com (2603:10b6:8:73::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.10; Thu, 30 Jul 2026 08:44:37 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 08:44:37 +0000
Message-ID: <5af1d00f-ee11-4daa-8182-adb4ee9b1b1e@intel.com>
Date: Thu, 30 Jul 2026 14:14:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] drm/i915/display: Move CMRR crtc_state members
 under VRR
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>
References: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260728145943.3848704-6-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260728145943.3848704-6-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0148.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::18) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|DS7PR11MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: 5acf30be-84e7-456d-78b6-08deee16c9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ZaB++uytx6UUl2D5OZFy0GLuxC1B9PbE4Um3/EWzvgO3AbJPSpRTGq1E6+O223bbKFbng/1O1lv/FuYrjYeVXaFzqJCJ1d4vE3ACwZDDA15IojHauwQoZ5zZv6sfnDkUkoIWHbFJMWzdL6WJytFAA9bIYI32IGuD0YNMMPTF59iJX5yH8iA8uSJmtSijeYCtqxsk3pfljuaM79mP5pfFWIqIV+HuoNjqNkQDIkRK6OAdmjCWj3wR61u5891PvZHjoUral/2lIjB+By3aBIjPK0e/3JaT4F3wRIUrkMS/hlZL3vsFu8clv96+fbPOeSbalT6eksDe2UjBuXc5uE4of56/p2QT004QQzLMlhQ4HDtQ/XOymoyTOClGilLATMgQHrfgjZ/gKlIqtv8YQEP3WMA9bb1kftmH1gJ4yPDMIPtfDaw4KuIAz3Dclmr/uDJirfOpXWb5AAhIer/omFIDEUwhYC2mWZvtuYsjs1Vl16oO9crM1g1QMPyYHMnCMdwZDBXyAyHLXDgQqSsOMlZ1tj754nV0pRMvuuRI6eTAZTwCuyqg6Gr9/AHQir7lSjM341nWwg9/B2OIyj+qL5aGH/NEjw2fwOg5TDkXMyyQNYdUd7N6yIoLFHvL17QvB6PU5WP+ycI/iXUB0jGCF4Qpjpk8cVXdb1k2bugGgaXBdwA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVRHekppNVFvbkIvK3Vrc01rK3BnVi9Va3F4eU1iTHhJL0s4d1Zqd3VrTGJS?=
 =?utf-8?B?bEJzNGsxU2pFb2pFb2JTR2lVMHZBRTZjQmpHUFJ6cjVrWEhzS1U3K3VWN1V3?=
 =?utf-8?B?ZTN2VC9MRzZ1dXFPR2tPSVg5OS9aRU92ZWFsN0VmTWt0MXJCd0R6V3lzOENZ?=
 =?utf-8?B?bXhaaEZ5QUs2bERrR3MxdFk0WEZZMk5CRVZMWk14Wk9rL1ZTeDBEUUNzaW83?=
 =?utf-8?B?ekNxOHF5QVJVUkFLbnlYYkZZczhyOC81dU1zekUyZmFUSjlWV2xMZEFMWDUx?=
 =?utf-8?B?azBJczlVM01jeWNZYU9GWnRxTmFYQ0VtMjMxMnFjT2xrblErcG93WW5mVDFD?=
 =?utf-8?B?aGNnVExYekFnV1BTY1c5VnZKdElDbmUxZGV3YW5oYUpJVDBhaHo1RjF5c1RR?=
 =?utf-8?B?V0RMWXU5UkxpSUZlVzNGUldjektSeHgvdEY0aVdpanhIcllibkVnekRnL2J6?=
 =?utf-8?B?SzZCTkJlcytrODZUSlpYUjAxWmIzZ2d2clNoQXQxSDVMY2NpdmtqaTJEM2JE?=
 =?utf-8?B?cFdjTmdmNnFYMXJvNGg3d2I0aU9pS0NseEw5bml0emEyb3NUeFBFODFvQnlL?=
 =?utf-8?B?ODZHUmhLdG9yTk1oTDVpNElFV3pRM0hSaFUvVVNMM3RNaWszZ0RMLzcvdWFV?=
 =?utf-8?B?US9JVTdZelNUY3FvVE81NGp4bUJQcXRnZDFka2VkTmVodGMzT3REdDlPdUx3?=
 =?utf-8?B?ZGlTZmhIcVFuZVJ5MzFmNXo2Tytyb0hRTGltMk5zSXFGaTFQUlNSVWY5QkYz?=
 =?utf-8?B?OHRGZzdOeTBhSG01MVVDMUNRdHVVRndCSTdFU1J3bUx1elRsQVpIZk02cjZZ?=
 =?utf-8?B?SngyOVk3cE8zQzVGTEpFU2ZXdnVVYzNIZlU0ajlRVW4yZFR4TlJ0T0hrMDN6?=
 =?utf-8?B?NkNUQlJ2YkJvRlJBQjg5T2pXazJLdzZONkJLVDA0NWpWTW1YMnE3TVB0RlQx?=
 =?utf-8?B?YVR4UFRHTGl3TWhZWDR0SWFSdE16UEhEbTRBV2RRbndjNGR3UUgzNUpkQ1Bi?=
 =?utf-8?B?cHJqOS9OYlQwQnVwOVJJdHVYYng1cTVyTDZrVjBIelVmaGRsNUJxL003Rnoy?=
 =?utf-8?B?Y1FQM1pmRWJsTzR2Rm9BbXY1S0ROYWtlNjVWVTFiUkVxQ0JITDlQdmswRG1T?=
 =?utf-8?B?a2t2MmJHbUR6djhMYXE1VTlyTDFOUldacWtSbnAxWHJ0V05JUnQrbmdiSUl6?=
 =?utf-8?B?SW5wanhjRlZHYkZWTm8zcWxXT3pnNmlCT0ZqbmVqQnJqU2wrQmlGUTBsY296?=
 =?utf-8?B?c0NMdVE1NncrSEM5d3BXK0lJSVlsY3J6Y2lYSmx6SzVhMSs2aWpmbndhZTJK?=
 =?utf-8?B?b0JwUGRBQzlLa1NwNHhWZ2FPT2R0U3RGamV0RmM0VzduTi8zNi9sbml6NDZt?=
 =?utf-8?B?YnJMeEJRUE95cjA2UlFTbmlGOU1mS0hEblM5bnhYaStKczZaY1ZYaWNJY1lt?=
 =?utf-8?B?RGlycVNTVVllOENoL0NXWWowMnhOc3JZeWl4SmxaaWdrTlRaT3ZtMHBCQXhG?=
 =?utf-8?B?Yzd5eEx3dWRTajVMWTQ2VnF4K2RrbzlCNzBPcW1wV2pmTHdmb01xaXpvV1Ba?=
 =?utf-8?B?a21XZkVTOGpFSGN1T09tYjdRRjVzK2VCb0M3SGlpZ0JTMUphcGlLK1hSWXpC?=
 =?utf-8?B?Qm4yZDE2Qys1bkIrNGIxMld6SWtlQXRzVVhISk42cVgwcXdJd3VsVXRnZytm?=
 =?utf-8?B?Z21aQ2hYUjdZaTVncGpTakFHVjJLSkEwTXlCTzNLNEMyNHFLVHpWbTNSb3I2?=
 =?utf-8?B?aHVxYVdFNGNrMkZMQU1YL2FDbjhweFdVdXlZZWd4QldyQXB6ZVN0bEdIY2hZ?=
 =?utf-8?B?SXY3blNWQ3lsQXB0TG5IaUNwNUxLUnZaMlBWL1p5ZTZVL1ZOUUVoRG9VZURV?=
 =?utf-8?B?WUJjV3R1ajhXUGJkYzVVSUpzVm1YTWdSOTlRUFVQb1I2RWJ5Z0tjS3VGTEVR?=
 =?utf-8?B?K3RiUEMybVZkazgzOWdGaURZVDMvOGUxZWtYYW9QdjZ3WGdtL2lHSVdoRHJz?=
 =?utf-8?B?b1dlbFVUWGg5ZlY4Qy9TeGRsRVdJZHkvK3RIbUxSOHloYjBhckJkYlNTNDU0?=
 =?utf-8?B?S2tiR3pDbGZpSXVzeklvWGk4eFJJMjhSRzJHUzNSeGt3NVU2Nk94bzhZSEhX?=
 =?utf-8?B?dDdEUW9BK05GYmV5Sm1IRS9mOHFOV09mMVRmQmhnbzBrQWNtRDBHS0gwbDhj?=
 =?utf-8?B?VVpoRUU1UTRTS0JXTnUxQ0Y2UHM5UDdxOWFoWVp4UWEwbXpiMzg4dnhhTjgy?=
 =?utf-8?B?VVUxcEMrZFBnMjhvdGswRU5oaExxcWRUWmRBRGR0bFM5S3dWeXpxS3pVTHR0?=
 =?utf-8?B?YXRPWXo4UmtRQUdMNlY2MzVGMjRQUnA5VlJOTW5KemFnRTlIZmw3UER5RnRO?=
 =?utf-8?Q?zWCRE4UbMOaneTzK7AH4Ac3QhoH3kKlNylvXT?=
X-Exchange-RoutingPolicyChecked: Eq4+mPjVrn8KblJEV6Ljk4/X7XytDTLpDeoSJ9239FUaLsKRCB7Bf/QKDN0mD9PpSjISIgX+FMxfayZSM5niRpc26X70faBGw86I1MAiWCSYoyqncvGqIL+F08oMRSdyvVlOkjGSgNab3NEcqYTaLPQkjK/F26jimgxbeAz1ssP6kWvKqxhS7H3uY9s4dT2GXTJDf4ob4S1S+PQHkercLAF6FUvAS338hVuDmUU2JT9nurZDR5tzjVegJX/VowSZKHPa/K8OAqX5eLc/NjYSm1BX51eM/72Y+WRxQqz2iyVGSPaI9hSRUqeQghW4S0lPaO6eDqv4DKOnXHmjzr30SQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5acf30be-84e7-456d-78b6-08deee16c9a3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 08:44:37.5675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/t4udmbTZAkO3lHqlg2JgC4j6gHSpCm/ix01o+7jW01DIVx4qsFWH+B6OGImPlRtSj+QcxKHnEOfpnF3qn/PBtwtHJxW2uPbo4D1c89o7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5968
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



On 7/28/2026 8:29 PM, Mitul Golani wrote:
> Move CMRR crtc state members under VRR infrastructure as
> it is enabled during fixed-refresh-rate VRR timing generator
> is enabled.
> 
> --v2:
> - Move cmrr structure under vrr umbrella.
> - Remove dups. (Jani)
> 
> --v3:
> - Update commit message
> 
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_cmtg.c     |  2 +-
>   drivers/gpu/drm/i915/display/intel_display.c  | 10 +++----
>   .../drm/i915/display/intel_display_types.h    | 12 ++++----
>   drivers/gpu/drm/i915/display/intel_dp.c       |  2 +-
>   drivers/gpu/drm/i915/display/intel_psr.c      |  2 +-
>   drivers/gpu/drm/i915/display/intel_vrr.c      | 30 +++++++++----------
>   6 files changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
> index c8e0f90af910..3c0f5b2fb2e7 100644
> --- a/drivers/gpu/drm/i915/display/intel_cmtg.c
> +++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
> @@ -326,7 +326,7 @@ void intel_cmtg_set_vrr_ctl(const struct intel_crtc_state *crtc_state)
>   		  XELPD_VRR_CTL_VRR_GUARDBAND(crtc_state->vrr.guardband);
>   
>   	/* TODO: The code below may need to be revisited once CMRR is enabled */
> -	if (crtc_state->cmrr.enable)
> +	if (crtc_state->vrr.cmrr.enable)
>   		vrr_ctl |= VRR_CTL_CMRR_ENABLE;
>   
>   	intel_de_write(display, TRANS_VRR_CTL(display, cmtg_transcoder), vrr_ctl);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 9dfd095f325f..8ce762188665 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -950,8 +950,8 @@ static bool vrr_params_changed(const struct intel_crtc_state *old_crtc_state,
>   static bool cmrr_params_changed(const struct intel_crtc_state *old_crtc_state,
>   				const struct intel_crtc_state *new_crtc_state)
>   {
> -	return old_crtc_state->cmrr.cmrr_m != new_crtc_state->cmrr.cmrr_m ||
> -		old_crtc_state->cmrr.cmrr_n != new_crtc_state->cmrr.cmrr_n;
> +	return old_crtc_state->vrr.cmrr.cmrr_m != new_crtc_state->vrr.cmrr.cmrr_m ||
> +		old_crtc_state->vrr.cmrr.cmrr_n != new_crtc_state->vrr.cmrr.cmrr_n;
>   }
>   
>   static bool intel_crtc_vrr_enabling(struct intel_atomic_state *state,
> @@ -5536,9 +5536,9 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>   		PIPE_CONF_CHECK_I(vrr.flipline);
>   		PIPE_CONF_CHECK_I(vrr.vsync_start);
>   		PIPE_CONF_CHECK_I(vrr.vsync_end);
> -		PIPE_CONF_CHECK_LLI(cmrr.cmrr_m);
> -		PIPE_CONF_CHECK_LLI(cmrr.cmrr_n);
> -		PIPE_CONF_CHECK_BOOL(cmrr.enable);
> +		PIPE_CONF_CHECK_LLI(vrr.cmrr.cmrr_m);
> +		PIPE_CONF_CHECK_LLI(vrr.cmrr.cmrr_n);
> +		PIPE_CONF_CHECK_BOOL(vrr.cmrr.enable);
>   		PIPE_CONF_CHECK_I(vrr.dc_balance.vmin);
>   		PIPE_CONF_CHECK_I(vrr.dc_balance.vmax);
>   		PIPE_CONF_CHECK_I(vrr.dc_balance.guardband);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 46dd980b315a..20a07ea06b5e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1408,13 +1408,13 @@ struct intel_crtc_state {
>   			u16 max_increase, max_decrease;
>   			u16 vblank_target;
>   		} dc_balance;
> -	} vrr;
>   
> -	/* Content Match Refresh Rate state */
> -	struct {
> -		bool enable;
> -		u64 cmrr_n, cmrr_m;
> -	} cmrr;
> +		/* Content Match Refresh Rate state */
> +		struct {
> +			bool enable;
> +			u64 cmrr_n, cmrr_m;
> +		} cmrr;
> +	} vrr;
>   
>   	/* Stream Splitter for eDP MSO */
>   	struct {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 9e2db310b7d8..7f13595f40c1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3143,7 +3143,7 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
>   	as_sdp->revision = 0x2;
>   	as_sdp->vtotal = intel_vrr_vmin_vtotal(crtc_state);
>   
> -	if (crtc_state->cmrr.enable) {
> +	if (crtc_state->vrr.cmrr.enable) {
>   		as_sdp->mode = DP_AS_SDP_FAVT_TRR_REACHED;
>   		as_sdp->target_rr = drm_mode_vrefresh(adjusted_mode);
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index 5ddcede6db27..d2009e317024 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -1491,7 +1491,7 @@ static bool intel_psr2_config_valid(struct intel_dp *intel_dp,
>   	int crtc_vdisplay = crtc_state->hw.adjusted_mode.crtc_vdisplay;
>   	int psr_max_h = 0, psr_max_v = 0, max_bpp = 0;
>   
> -	if (crtc_state->cmrr.enable) {
> +	if (crtc_state->vrr.cmrr.enable) {
>   		drm_dbg_kms(display->drm,
>   			    "Selective update cannot be enabled when CMRR is enabled\n");

The log was changed in Patch 1 so this does not apply anymore.

>   		return false;
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 615c8fa8c063..6d3333fd5281 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -235,12 +235,12 @@ cmrr_get_vtotal(struct intel_crtc_state *crtc_state, bool video_mode_required)
>   		multiplier_n = 1000;
>   	}
>   
> -	crtc_state->cmrr.cmrr_n = mul_u32_u32(desired_refresh_rate * adjusted_mode->crtc_htotal,
> -					      multiplier_n);
> +	crtc_state->vrr.cmrr.cmrr_n = mul_u32_u32(desired_refresh_rate * adjusted_mode->crtc_htotal,
> +						  multiplier_n);
>   	vtotal = DIV_ROUND_UP_ULL(mul_u32_u32(adjusted_mode->crtc_clock * 1000, multiplier_n),
> -				  crtc_state->cmrr.cmrr_n);
> +				  crtc_state->vrr.cmrr.cmrr_n);
>   	adjusted_pixel_rate = mul_u32_u32(adjusted_mode->crtc_clock * 1000, multiplier_m);
> -	crtc_state->cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->cmrr.cmrr_n);
> +	crtc_state->vrr.cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->vrr.cmrr.cmrr_n);
>   
>   	return vtotal;
>   }
> @@ -258,7 +258,7 @@ void intel_vrr_compute_cmrr_timings(struct intel_crtc_state *crtc_state)
>   	crtc_state->vrr.vmin = crtc_state->vrr.vmax;
>   	crtc_state->vrr.flipline = crtc_state->vrr.vmin;
>   
> -	crtc_state->cmrr.enable = true;
> +	crtc_state->vrr.cmrr.enable = true;
>   	crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
>   }
>   
> @@ -651,15 +651,15 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
>   		return;
>   	}
>   
> -	if (crtc_state->cmrr.enable) {
> +	if (crtc_state->vrr.cmrr.enable) {
>   		intel_de_write(display, TRANS_CMRR_M_HI(display, cpu_transcoder),
> -			       upper_32_bits(crtc_state->cmrr.cmrr_m));
> +			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_m));
>   		intel_de_write(display, TRANS_CMRR_M_LO(display, cpu_transcoder),
> -			       lower_32_bits(crtc_state->cmrr.cmrr_m));
> +			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_m));
>   		intel_de_write(display, TRANS_CMRR_N_HI(display, cpu_transcoder),
> -			       upper_32_bits(crtc_state->cmrr.cmrr_n));
> +			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_n));
>   		intel_de_write(display, TRANS_CMRR_N_LO(display, cpu_transcoder),
> -			       lower_32_bits(crtc_state->cmrr.cmrr_n));
> +			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_n));
>   	}
>   
>   	intel_vrr_set_fixed_rr_timings(crtc_state, cpu_transcoder);
> @@ -980,7 +980,7 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
>   	intel_vrr_enable_dc_balancing(crtc_state);
>   
>   	if (!intel_vrr_always_use_vrr_tg(display))
> -		intel_vrr_tg_enable(crtc_state, crtc_state->cmrr.enable);
> +		intel_vrr_tg_enable(crtc_state, crtc_state->vrr.cmrr.enable);
>   }
>   
>   void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
> @@ -1077,12 +1077,12 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
>   				      TRANS_VRR_CTL(display, cpu_transcoder));
>   
>   	if (intel_vrr_cmrr_possible(crtc_state))
> -		crtc_state->cmrr.enable = (trans_vrr_ctl & VRR_CTL_CMRR_ENABLE);
> +		crtc_state->vrr.cmrr.enable = (trans_vrr_ctl & VRR_CTL_CMRR_ENABLE);
>   
> -	if (crtc_state->cmrr.enable) {
> -		crtc_state->cmrr.cmrr_n =
> +	if (crtc_state->vrr.cmrr.enable) {
> +		crtc_state->vrr.cmrr.cmrr_n =
>   			intel_de_read64_2x32(display, TRANS_CMRR_N_LO(display, cpu_transcoder));
> -		crtc_state->cmrr.cmrr_m =
> +		crtc_state->vrr.cmrr.cmrr_m =
>   			intel_de_read64_2x32(display, TRANS_CMRR_M_LO(display, cpu_transcoder));
>   	}
>   

