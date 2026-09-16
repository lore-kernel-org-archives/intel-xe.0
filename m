Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2582C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 13:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E53F10E3A2;
	Wed, 16 Sep 2026 13:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVH7A6rK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9441810EACD;
 Wed, 16 Sep 2026 13:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789565020; x=1821101020;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U6g1Xy06pm9DYD7gLXtgn3ft8BMM51FMFNOJe0bm2wk=;
 b=BVH7A6rKxzgBOgc3LYhbN0jaSmfPW3JReiOegRD5OBcxIlTmOHmEZfCY
 CVwwcvv99Tg2zvvJW/5sq+zXRugYKLX2+02BGoKLMC4s3t4jkY0sKaIk/
 vyQxQB5e0pRwJeo07f4Y1kKb7n2YfK5QVTe6xalnV6NMfimucO26iAf0u
 me1hXGRJK75BTRXBWxrqDHDROhfPZhDNf50dac5jiUnQ8BzAt/ZZX4HSD
 FaQSuzADGqRTZsSl2nMR31KPJb863c0y+cSJwF/LTjxy4fORN4pqUFEZb
 WZyfXe0VHlXwIEKoKYJwAyZvxsNsvMcgPH0KphDpZvyWMIkxtP9Zo96pc A==;
X-CSE-ConnectionGUID: 86fOR4u0QXex3cZt33cYlg==
X-CSE-MsgGUID: 2UpFygvmStekFAruMaBBNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88877536"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88877536"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:23:39 -0700
X-CSE-ConnectionGUID: ODU1EQCQSdmFsNG9oKGodA==
X-CSE-MsgGUID: L8vgR5xlREWnJNB2O2ouhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270059887"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:23:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:23:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 06:23:38 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:23:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bU88W5YOhD6RemZE5XD1+vb+/IIA0tTw6d5pnLPlOLGogqvSL+TQ29eExNjgEkCwuVF4tno7EGwKorYjllZWfG8lnnjOBJRQwStrLnq7Img0XWYKZxoYHpDmSFcu1PlBdIhtn+9k+zwsI7EECOTDVno9W9ZXXNoEp27Mr3/u7w+jxJtP0Mwqf9dirbbicFqjI07JbtMV7t+G4mR8vNhu3aNdhsJQMlC9MFViyyrIW72Fr4qGGeW137YTQpxt6Al6XN/EJcG6AiPA/7So+1XgWavnPRoPi7gOqMD+YnC9JGAoSkKGljG2sbs9PvT12JE96TXLjuJYUYVE1kpBizTMVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCbWUqAb+n/g267NLqEOqZeQB8d3pePpGf3R3Zt4PnE=;
 b=iXa895jssLrLLbclkwBHOv3krbHjA/psPvDTn6eIKiCeuSQ4/K/fNK+WRjzYWaGBMdXc5IRfhShmgFh80YGDf0cJ098OK9EyGmAXXGdOGtEWRx+ic11MOq1RT6OBMavoUcNsfmSUMk+OSN98K99LoZ70JpqHe/Ylfq7M9TL5v+rs9MQkZF6UzPi5PhaCgrUxHM1y7d326OIIbOCZjr9WhNfqFVrDdVUVxU4mtADaMAZOh4hHi+anE/Zm092gkRzFIgkjOaKORvD38ggLQ6MouSeP3PhyGENBVjO/KEg40w1ZgjzUH02RWA00xx2ybLs7snZEi4ji0JAF5w7/S+bc7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 13:23:35 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 13:23:33 +0000
Message-ID: <2ceb365d-5ff0-44b1-a566-4ae58b0a01ce@intel.com>
Date: Wed, 16 Sep 2026 18:53:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] drm/i915: Extract intel_dsb_supported()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
 <20260909161730.12969-8-ville.syrjala@linux.intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260909161730.12969-8-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0113.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::13) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: d4faed0b-5255-4a3b-2238-08df13f5b4ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|4143699003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: coQEQICbHuU2T6sY9U1MIjHezbn7G9OcBV8a9LUQvdOFPRPi1Seq/hXWtfw3dkYG9tlDRICfOfvvDmfC++itc/nCCoXi0eFH2S16alKr6xplIjrxwNeu7k/V3KP1UBxW/3/ZEGv1Ra0uwCU71wV9F+p/f+BNtel8JXclEdy5W4evjzZg2nDEe26b9VwfUQmuoJAr9TjJ8p+JiKd+zE1+qo3AgDAre57ZKcbHu7MVnEQI16qmagIGCcNDkJJHSaWu01Em3F77E3rARR1wAQd1ojiI5cGvlbuQolDSGcUXSPXik3ykdxNWImXzjkLu9BoCpjhHEf1t7EGLGqaJonrVWJtyS2KkdonF3CbdwmTHMSaclNeckR5Rkup9IvM8bWQUCz74XVqT7Bm3lFZHcZxE51qtw4qajFxPNVI0RQdr9+RDGAeYvhK9a1s28Am+hyjiP8vZp5KRDcaD0lbEI/UHCg92e9YNdpoAT5HX6xZOEW54AD4n4eMYh3sS/eR2c+UsvRFbJvdQnRM0h19smL+9gusDDtelo/urJiQ0Bxy80zkpxP9qQI2xrxLogStaWMwl45MmCIFzi+KCGOTSNCoIBSDUqziMdbLkpRWn5VXWnR9jHXVbiGYK8T7VSr9j14IDr1pu5f46BX4N7oXsl/q1zqMnpLm++HY1ldfDlknvc80=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zms4dDhKanpzVTA0T0poSnY4b2ErVzRkTVNDWVROa2REMDczQlpsc29WZDI5?=
 =?utf-8?B?RTZnVjJRL1lYcmRzTm96SjdIWEMyZ0sxVFdtUS9oa3ltRVM5c1FzTDVRa1R3?=
 =?utf-8?B?OU9DWTUwRHdVYTBXWHd3YWQvQXVBcjg2NUd3R2hhdGZnNjZpZUFjK0F0Y3Vp?=
 =?utf-8?B?bXVsRXFRczU1UG5WSFYrdzJ2bnJVajNsRmR4eXZzMWgrZVpJZDNKV1FWMW5j?=
 =?utf-8?B?R3oxY0lFL2xkU0NRR2FDMDR1L2t6a3MzQkRvWjFZSnlzRWdBOERZQ09GNW5y?=
 =?utf-8?B?eS9UUDdPUEpodG16MGNPRkdZZGd3VkQ5c0hIMnpPZWNrUFIwWVBYRWtrRHhM?=
 =?utf-8?B?a2NGRkl2L0ZwYkJ0SVVjWkZhS2ZtODJ0QnVwbnVpN0s0ZjB0WUJKMTZwNFFG?=
 =?utf-8?B?c2JhMks1bWRQcmYxL08rUGp4aEx5SEM0dXBKSGlMZlFkU2RkK3h6ZFowQnQ0?=
 =?utf-8?B?bnN4d1NGTHZheHd5emFlNlZ6T1ZTNU5UQzVIQk1iUTBmRWtmNWNnOVI3TmdQ?=
 =?utf-8?B?eGFXbVBOck1UaVhpU2NxVkRIZjM3ZmIySmh4NlBlMTdXSUVIL2o0cEZYVVd0?=
 =?utf-8?B?azlzOE5veVhHS2ZvMXh3dzlvTDlzdlZuMXhmT0hLd1lhd2RCQzljK2dPOGVR?=
 =?utf-8?B?eW1PQVdwdVNqN04rMDFHYkdUMHRtVGhiN0JWU1NvNzliNDRwNHY3Q3V3QTdB?=
 =?utf-8?B?WnhMRGRCVTFvMHZtOFRFQnluQnd6Y2pMQnA1SnpUZ1Uydkx0WmhuRVlqTnNl?=
 =?utf-8?B?QkVEMGVCdW9kZ3dWQmxlRWJYcFdydW9GVWFRL0V6UDhKeUZKSWU3ZXZFam94?=
 =?utf-8?B?WGhrSEpzZ3NsdThlWk5IQzQzS2hvTHkyMXkvc2hsYUZDSEtGNWZCSjZBaEo3?=
 =?utf-8?B?Ykl3SVlQRWU2NW1aN2hES3ZnU01lWmpJVVI2elBTUFY1eURRYWRURW1GUzhh?=
 =?utf-8?B?RUZzNlJGSG1mNTRVZzc3ZlJWVCs2d01GcXFaMVJLVTlpMkltYit1d0pUOXFW?=
 =?utf-8?B?TEc5ZlVNRldkM0p4M082VGhlUlZiMUVFVWhPL2VLQ0VRMGtPM3VRc2pTOG82?=
 =?utf-8?B?SlZwdlVjbm8zQkNwTTNJbzFPa2s2N2EzTUQrbVJNOWZ2L2pmWHg1T2doejBz?=
 =?utf-8?B?VW95K056NmJMb0gwU0VkOTFjdm96Qyt6eFEzckNhOGVBNU05M3VmNW1ibHlW?=
 =?utf-8?B?UkpyRTV2aE4zQ01zTEZNc3FwSmlBKzUyekZYUWJsWkJqTU5jR2VqdDlsWWFD?=
 =?utf-8?B?L3d5WXU3WVo1SkhDUmE1YnVHVlIrSUx3UDE1VnRhaWRCOHhxTFh0THVQdDZJ?=
 =?utf-8?B?SFg1VG81TGFWYThYSktiWWloU0FBRWt0cFcweTZXUXR0eEFUbDJjOWZFNHVy?=
 =?utf-8?B?M3ZEdHFvSDkzTEpCYVlRU3cyTVU0a3k0ckJsK1FXa0ZWdmd6Nmw0TUl6a1N4?=
 =?utf-8?B?R25mb1JVSVlmUEZhTEh1OFIvazZnSnRNVnl0Unl0NlhSZGVPbUc5cGZlcFAw?=
 =?utf-8?B?dHpFMjdkZGJNWCsxSDhNLzdVUlhabFhrbkNTZW5pcmx4T2lUN2VhbmxaMGt6?=
 =?utf-8?B?NFp1YlhTY0V0NFo2bWV0emoxTWdDeVY4dzRoU1NycUxMZFhSTk1mdFpEK0dv?=
 =?utf-8?B?WWVGbDlabVdjU1MxQTFpdHVxNjNXZlk5WldiKzVybEZBdEVmdFdTTXo4Q01K?=
 =?utf-8?B?ZXB0MmVQZ1dwQVlDSytaT3o5Q3RKdUE2UStvS0hRYlJRVkNISktLYXMxMmEx?=
 =?utf-8?B?OEJSZEF0bGRSbkFmSFZsTjAyMlZ3RGkyWGo3UWFVMml2a2UvbFpIV045dzdU?=
 =?utf-8?B?RFpCVGFLSkZJeGN4NS9rUk4zbk9aVnYrR25PMUFBMmM4WVZQS3EzNWhTczF1?=
 =?utf-8?B?c3FEcllUR2VQM3ZFLzg5cE0rOTBKcUlhS0FyYWFWL0VYRERMRjQyWllxVGhh?=
 =?utf-8?B?WGFDNzBqNmZYVEwrdUFVemlQR2IzNUFXbWtmL3lCRUk1a2pzODY5YXpDWHoz?=
 =?utf-8?B?dnNmWmJpemhaNXFCZzRvZGdtZDE2ell6QnRkTi9uSUl6N0JWNjhLU01id0xm?=
 =?utf-8?B?ZzlQVXY5TWxzdXBINFpUd2w5eTlrUkN3eWFKNGxoN21Rb2pJbG1pS2lGVkd1?=
 =?utf-8?B?c1BCakl3QUljTkxDbys5L0FYSHMzcjI1ZEZaQUNIbGJBZWJCeGd4Nlg1K2xX?=
 =?utf-8?B?ckorQ3RUQ1VCQzJDR2JsQThCdUVydmw1VkVWTHR5clJJK0ZLY29QVDgvdjJt?=
 =?utf-8?B?Um82ZVJkaEFUa1RQVWIxQnVlcURlY3FZT29JQmtQS2dUM0lZOEYyNk9nYnZG?=
 =?utf-8?B?RDcwUEduUXJhUTQvb0dpc3pmMFNPQmdqQTFRbTBOdzVSVzBTK2g0RWMxUWtm?=
 =?utf-8?Q?/dOs4BBG3URr1c4o=3D?=
X-Exchange-RoutingPolicyChecked: bdb8Rdj95B1yFm/6yDBZM+ob8D/ZQWZ3hoDlVIASGjklApMKrP0cIztrMG42Es3vMxxL5gOoo78ZBZIxphJlz/lwFcEFSuVnsCxAZIklI4TLDkLQhEP6RiH6zG8hymfBtgMTyM98ZpsT0w8jXeDpCNYncILFK/yPkLCXSiF5mz5LvspHoGGT6wwU3+khW5HFg9xzKgH32IPTXuuWK6TLlQaQ3yT+5E3/Iq8r+MgSHCMIzDy5oUb5IXn0cNyDDmFk5h3bPbb55mE5PTfW/dZ3UbleJrNeVnJ8l5fLrTgShWZMXbrifwZ2OMCRmHtH3I7Xoqzgi7fR46ZjRTTtWKRGUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d4faed0b-5255-4a3b-2238-08df13f5b4ac
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 13:23:33.1653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUosTI5soPS7y6XvG2GqTMHZe6jjjhUE4TMwhpC0qK/BKj2S04V4ybhDDl/p3o8SSylXpeawyqdsRrgqNfaAeqOm65rNV4Ix9UkxrdiRNJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
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



On 9/9/2026 9:47 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Extract the "do we have a DSB and should be use it?" check

typo: we

> into a helper. This mirrors intel_flipq_supported() and should
> help unify the logic around selecting the codepath which will
> be used to perform the commit (mmio vs. DSB. vs. flip queue).
> 

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dsb.c | 13 +++++++++----
>   drivers/gpu/drm/i915/display/intel_dsb.h |  1 +
>   2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
> index d9a270362a82..8e01e1eed291 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -1025,6 +1025,14 @@ void intel_dsb_wait(struct intel_dsb *dsb)
>   			  dsb_error_int_status(display) | DSB_PROG_INT_STATUS);
>   }
>   
> +bool intel_dsb_supported(struct intel_display *display)
> +{
> +	if (!display->params.enable_dsb)
> +		return false;
> +
> +	return HAS_DSB(display);
> +}
> +
>   /**
>    * intel_dsb_prepare() - Allocate, pin and map the DSB command buffer.
>    * @state: the atomic state
> @@ -1049,10 +1057,7 @@ struct intel_dsb *intel_dsb_prepare(struct intel_atomic_state *state,
>   	struct intel_dsb *dsb;
>   	unsigned int size;
>   
> -	if (!HAS_DSB(display))
> -		return NULL;
> -
> -	if (!display->params.enable_dsb)
> +	if (!intel_dsb_supported(display))
>   		return NULL;
>   
>   	dsb = kzalloc_obj(*dsb);
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.h b/drivers/gpu/drm/i915/display/intel_dsb.h
> index 3dcca9ed5371..87d9c90da08f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.h
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.h
> @@ -26,6 +26,7 @@ enum intel_dsb_id {
>   	I915_MAX_DSBS,
>   };
>   
> +bool intel_dsb_supported(struct intel_display *display);
>   unsigned int intel_dsb_size(struct intel_dsb *dsb);
>   unsigned int intel_dsb_head(struct intel_dsb *dsb);
>   struct intel_dsb *intel_dsb_prepare(struct intel_atomic_state *state,

