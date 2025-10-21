Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60070CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 17:49:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5C610E636;
	Tue, 21 Oct 2025 17:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gC1YEVoi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A1110E636
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 17:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761068981; x=1792604981;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aky9dsdXbq/fhHTJJQsh8O145oI0dy50//Mg7LX3HuQ=;
 b=gC1YEVoiVEorDyroa0CR+G8rTdG/nxEiRiO5iBX2yfwEsq4A0DiZI31h
 bgXItsu9QWZDTGEXTXJnU/1b12e5PhTCmhU0PneXyGucr/1SDK7pxi+0z
 C0br/e3zw8u0PpciyyJilIEQ2RrR9ZQngbUtHCCbVzolNeD/T2ltgXzD9
 jpopf8Mzge9F+GJtqooP8w/sotMZiEz8sX9SnPG+FxjOR7ig9gQun06Qb
 KewJSZGV7d0IUBV/aLddZkTgAED0hfXNibiqKFpbyc5wZB5fGWl7wTsUQ
 hw3B8GVPuyBIeFtKZIlwB0nSi5BtVlrUeo9qSyywOlBXw8oA49LecOkck w==;
X-CSE-ConnectionGUID: Lr5Gy8sYRQOiWxuDJZy0Og==
X-CSE-MsgGUID: T6FIYNqzRX258kRjmL6Iig==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63353187"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="63353187"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 10:49:40 -0700
X-CSE-ConnectionGUID: RP21XgKDSWicWVU2U4vymg==
X-CSE-MsgGUID: Rq3VvZ/lQHK96spICOeejQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="183682531"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 10:49:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 10:49:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 10:49:39 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.45)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 10:49:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCu3SIpfSLFXwrvRuID8+9IRuSv+vyWog6q9y+N/q5VNHNKOQDO98QO92EArPYR54OHcTSyaNS6jxL4b2JrR+n3/eyXwFlWxB9sF6Y+7OXrm2+WPE7bOdQshgswmSvEyg25zFiineeRIAqSMeiNlYoMrKO5Zdb+6qgCvh8CV+QJb7riT3RjhnOVkGXvX9pvzylyuZsto3eRbrvDe0jizzzyALDArpSEJTfteL6zmUHrPtBBJX9Myo0Fyw7BYzf+6naQyp4fH8it1IxSyOA5mSPK4VGI566H9r3VbjsYxIMkaCCHr33bD1+mLdrEJ+oWe8KG+6SwrfGH7oSPVZiOiCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+MsWjcS5oclZlMo+VB/pRPQMMXPkMExxrXUzquJr1o=;
 b=JukuNzVBaPmp7XYOf/fDtUaX/wmdiqEdLcC1n+IxF4TSXcGeX0bDfYL4YSrEn7qIfSWT3btzMYa3G7vYJYNinuXBncPH9Q7/c1z1f7fCAyNmjoYhEiKjTO7Nx9y8TSOd8AkVGvuT8UHq3df42kvgldEEnJRBh8Z3tJHbzxrdc90LHphotd/Lk3LsDWhkP/4qzBJDYsqGP3ukrFOJWsYgstjq7KXi0aNLq5IGehVWfbB5cJGMoejmvPWQon52d9Y9oJhzhcdGJw8obSRrV50m0oM2EI8+dspfoz6KcMrXqvxO6v4aDmGqbXD0yvlvl4Invz4CvYexSbdQSlxc6XwvSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB7644.namprd11.prod.outlook.com (2603:10b6:510:26a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 17:49:35 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 17:49:35 +0000
Message-ID: <046b8be5-1b11-4c43-94ba-095638e48be8@intel.com>
Date: Tue, 21 Oct 2025 19:49:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe/guc: Add prefix to guc log buffer macros
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>
References: <20251009215749.378905-1-zhanjun.dong@intel.com>
 <20251009215749.378905-3-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251009215749.378905-3-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: d32d09e0-5e1f-490a-5086-08de10ca3219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEtWSVB1VnkvZVZVWXEwOHNWdGZ0NHlmVXdKdExiRjVuRmpOd3pPd2xDS2ZB?=
 =?utf-8?B?RmxKQU5mNHdLM0tIUXBUS3h6WStEaURHc1JSMjlzUUc2SkRPYWJzZXA0Qnpy?=
 =?utf-8?B?VTNEM01TNElnNFRLU2wwTHpVd2JIZ3hsK0drSzFuTlp1UzQrMWxQRlExQlRr?=
 =?utf-8?B?R05CUFR4QS9ZMStHczV3eGRPdHE1MG9SRDJ2STVtcW1pNFJUS3dlZUw5NTFL?=
 =?utf-8?B?THFDd3pzOWxqVnQwWjNFVEpDclVVeXQ4ZXZwUHpydFBqMU1HVDZLRUtvSnB1?=
 =?utf-8?B?aC91Vm1YRHR5bkpnR29nY2JjMk0zRHVsdFhDbEswV2JQUW1TbG12T1ZmaitC?=
 =?utf-8?B?SjJ1cm5kaGNHb1gybmpGUkV3d2tBUkJKMVltcTRzN01BKyswL3VBZ3A5T01H?=
 =?utf-8?B?THAvQ0ZTMG5RZUFUbVFTOERBVkErS2szZnkrK1FCZ3hlSGV5UWFxTzZvWmYz?=
 =?utf-8?B?VXNKNlFmUEcrMVJIbUx5eFNrYUV0QnFIdC9CZzZyM0RJYWIwelFHdmhuVFFU?=
 =?utf-8?B?WmFvSlBQSjF5OUJLYnVCeHRiMllCYlRwT2drOFdwZ1FSQUhidGR1dThKd01N?=
 =?utf-8?B?K2FMTUZnQmNSZmJ2ZnoyVC9nYmZBZm5Ia3ZNZ1J3OEcrYWdIbm45SU9WWlRS?=
 =?utf-8?B?WTdrUHFQS0lIUVNPd1NDaWxMUFNkZ3pZVVhjUStxZ29WYWJSSnRXWW5sSGpx?=
 =?utf-8?B?cVB3cmJiNGZEYmY4bUpWaDl6WHZHZzZadlJNUEFHRlJ4clFiRDl2WTBzQ3k4?=
 =?utf-8?B?cWVEUXgxazQwOUdvWklYb0xaN2xTRnpxc3l4RnE1Q2NtYmJZVVJXRkd1aHpO?=
 =?utf-8?B?TEdhZnA4djBsT3NRNU50dThKZU9tOUxYZEIrd0RxbjlLNHVCRDlDQU50V0p1?=
 =?utf-8?B?WjRza1BCQmpzdGtjS2w4cGIycjF3azZyd29HV2tHUGY1bFNMZkRZd2ttbTRt?=
 =?utf-8?B?QnZDZlVEOVBSVlZuZDNLbkY0d2xZZUVJeVdYLy9vQzhpeVQ1WGVyWW9IaXRV?=
 =?utf-8?B?SGZxM2t3NmNIUldiTnRBcDYvSDlFNW1WY1RNa0ZpOCtXL3RiL0h5bFJ0RHYr?=
 =?utf-8?B?Wm9xZGtaL2hiMjNwMXk4OG1BV2NndkxwSk8wMitUMEZlaFVOZWp6UXFOZFhN?=
 =?utf-8?B?TGd2VzB0Yi9udkduWnZQbFRFT3h5UnNNbUVJbWg0eHl2S0VpRVh0cWVJSkp6?=
 =?utf-8?B?OFJoQjloSjNaZWd5UHhTdUEyMy9UU2g0enNEQVh1QzZ2Qmlxd3JIM1lDRm5z?=
 =?utf-8?B?SEwzelVGOFZJNnoxMDdUM0hQRG4zUTR6NEFHR3I1ZllweVpxVUlpeVpYcWR1?=
 =?utf-8?B?T29NVi96bjEwSzdBMUVuZ3NXUFF0RktDbUxXa1FyM3dZMWU5L0Y0ZUpKb0Y0?=
 =?utf-8?B?YmVySnZhaHJZaXY4b0wreEwrL1pZMkU3RDloTm9VSk1ZbTBZMUh5YWw3cS9S?=
 =?utf-8?B?VE9XVXJXclYzTnhtTStiWm1IOHV3NEhhT0VyMVYwYk1uVm5ES2sxdTJ0bU9h?=
 =?utf-8?B?TzBBL0M2QzFCd1pwRXRhZXNGMGY2aVBvT3VEbWZITTVKUER0N25vYzcwTnBD?=
 =?utf-8?B?cDZzU3FGZk5ZaUdWZ01CRS95RkllcFJkYmVEcEk4UGpQTDlHMFQxenBVa0sr?=
 =?utf-8?B?dXNUUHBLY2JHalI0THF0bDcrU040MWhNbTNoUGFMOVhyT0d5WWIvQnprVlVY?=
 =?utf-8?B?Rm1VRW9POUFTV01Jb0VGRkRzNTdJT09KWXkxeGdHUUpleFU5L2Z3VGVXT0V4?=
 =?utf-8?B?Rm5CUG13UHZ6Ym9SYU9kN25pUTkxV01qSy9CWWFuK0ROcUdsOGV2U0Z5SUhU?=
 =?utf-8?B?YzVva0lTZ0pleFZnVEQrcFFIMHlFYzFWM3o2REJOYytsTWw2Qlh4N2hub1ha?=
 =?utf-8?B?QnhQaUYyM2lGL0R4UEprTXRJMXViM2JaTTQ5TXUxWjBTNHBXTUd3bDhGWUdh?=
 =?utf-8?Q?5crD8VX/1/MWyk6n+AvKBcWBg9U79X85?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFQrL1lKOFFyRmJnMFozNFQzcTl1S2ZaeFRpNnFteHhjQU5reDMwZTR0SmVN?=
 =?utf-8?B?cDFhRG4rZWdvdXV3YWVLcVBkeW9PQmgzaEsrcHhaUVU5QUtacjg1RjdwRHJx?=
 =?utf-8?B?c2NTVkMvVGhsVmliTFY5TCtjbEczSm1SL1NUWjB0TjFQNkkxZHk2Z2VnL1Ny?=
 =?utf-8?B?emRaWlA3RXRTNkw5MVFheTBSU2tYeEhCSTdldmE0OExodjBmZTk5UTNESjdU?=
 =?utf-8?B?R0wrSG1sNnVOYTcrWHFxaEZSVUhKRHJLaFMvVVVRRlpCUDdvK1RJbjhOam1N?=
 =?utf-8?B?VnJhbWNZWEN4UG1FeFpkUnRXU04wbnpRU3FxdC9lRExIM2hFSnNHV0dXRVBV?=
 =?utf-8?B?VHJDdldPbkJwNXJFZW5SUVVLcTlrVi9JZC9sSmN5YUNQa1ZpNWVKOERYZktU?=
 =?utf-8?B?K25TWkZneVNjakZsNGI0M2VweW9wSndFZlFPdGx1WFdUYW5wdFQyMGVVcnRF?=
 =?utf-8?B?NEY0dnZRRVJCb3c4aFJkNkZzSU9VUDkrOXVVb1Q1Z0p3S0ZSZ1lqM1phYWtp?=
 =?utf-8?B?aXhDMzhuRTc0Mk9DL1V0eEhKRUFWZzNzSUNvSGVaTDd6dCtEYmxxZjRrR0xV?=
 =?utf-8?B?cjBmL0l4NjluRVNleWRjY3R5a25za0lJNWhxYisvbUxMZGRDV2NjMVhTcm1Z?=
 =?utf-8?B?YlZYU0FJcHg5UlZyVlBQWjg0VWt3cittamlOM08yR0RLOEVZblNsQkpmbFlG?=
 =?utf-8?B?cmd6bW8vSWlJeEdnMFBGS2hJYy9hMks2WnNXajlpVzFkUjNXYVNIaVZ5c3Mr?=
 =?utf-8?B?WlhSNDlaMHNmdU5vL0JZUDJuMnlqaVdzQTl6dzlJQnVxYWFibkVmZlB6MWhq?=
 =?utf-8?B?ZE45dTNpeDlpK242TStFeU8weDJiNGNXdkdyYm9yWWh4U2lsNUoxcUJ5eVd3?=
 =?utf-8?B?b2E3ODkzMWhwTVo5S0tiQUxPMjIzMkUrZ3NhTXo5eEpSMnhGU0ptZHRxUk5s?=
 =?utf-8?B?ZGsyN0h5Uk1TVm1QV1c2L2x1cWFIQnBTVklXRnNCTkhtSDJ5ODVGSENCSlZj?=
 =?utf-8?B?WlVWQlVlNEtITmdVYlc5dHhWRU8zcjgya3FRMEtYQWJGZmx1UHpFN1JzNnNy?=
 =?utf-8?B?QzlYSE9mSGVTR1RjSXd6UjI0VTR2ZHFkR3JRZVQ1N0NrdG1rTDlhZVNpWDk4?=
 =?utf-8?B?Ulo3cWZDd29IK1dMRmE4N1pIcU5ZS3JERnZtM1UrR3JSeVJkOWpaZEp3QzFU?=
 =?utf-8?B?TjhlQ3M0bmx5ZTZ3QjZ0Q20xaFp6R2xoSjZoWTdXbmZzT3NicmFZYk9VQjFL?=
 =?utf-8?B?SE9FTjR5cmxVNCtPM1BrdWorOGR1OVBERlI2TE82UHJKcklaSktHdzN6R0pE?=
 =?utf-8?B?ZFpMV1Y0NkJnZUxDeTJnNWpwamEvY3NDZEVkTEZpWlZVUHRWbWlOK2ZWdG4r?=
 =?utf-8?B?dzIwYTlpcDFJb05WazdEWUZjQy9YUVRlVnZLRzdnMUw0c2xDRklON3pFeTZG?=
 =?utf-8?B?aHlCL2kvK21hbE1lZnlyMGFaS3hKT1MzYkN2dFBvTzRXYk1lRGVIMmhzdjZZ?=
 =?utf-8?B?MjJZaUxEakJURUJkR1ZsVk11eCs3THo2Yk9CTHJBUUdOZjduMFQ5WVZkUHRR?=
 =?utf-8?B?V1RxcUdFZ21GaWNPWU1Id21HMWZDTDFUVmV3SzNKSHF3bnFLZTdPaXlFOFhq?=
 =?utf-8?B?VWhVVmJYNUljRUdER3hrcGhReXN0Q2h0T3YwalB1Ym1ZaTlNSi9xUXVKWi8v?=
 =?utf-8?B?cnJKQ05tRitlZmdSek5WNmZ2ZXIvYzFDSE52enJFWkpJbk9WcWl3Nys3S1hI?=
 =?utf-8?B?NHVISHRYOWRNYVUrVW9STXBVV2pTelFCMUhxSzVWV29Ha2FlaVh1Mk04UnNB?=
 =?utf-8?B?VXh5VGZZK3ZaVWwvQUNrRXJMcUJXNXN4MG42TSt3RlFQbnBxVFE0WkFtZ0R0?=
 =?utf-8?B?SUQrUlZXOTFKWFRuK1NDVXFLOTQ1c3lUb3RwMzcrZkJIY3J1bEs3QjkvN1VO?=
 =?utf-8?B?YmRYNHpJUk4vZk9pd3pqVXZaU1JhVmw3Y1RRUXMyY0FRMkxkR2hVL1ZYZFpC?=
 =?utf-8?B?MXpxak55dnphcFpNemRDYzBGR21SUzRIWEVlTCtKbXNveWw2RnhxUU1RZmxB?=
 =?utf-8?B?NGFSRVdxNHJ1czllcmwzenBFaHA2SldFY09QMEV2elVXaTRCajBIdDJwN3ZY?=
 =?utf-8?B?U0JiLzhZQkRmR0QrNFU3UmtHL0xzZmU5WkNqVzBkU3RHT1lQWVA3MkpsS1lU?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d32d09e0-5e1f-490a-5086-08de10ca3219
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 17:49:35.2984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJlceE9Gfm5kBVtFEQQV/3XGLxLTbjw4Erp9vSLeHy48OgvXihtC5c/VaymJwYDGNNjJMi1Wdl42jklCLvF4Y759BiF6tqCiTclFTO+x7NI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7644
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



On 10/9/2025 11:57 PM, Zhanjun Dong wrote:
> Add prefix to GuC log buffer macros to follow Xe naming styles.
> Remove helper functions, replaced with macros.
> Rename GuC log related macros.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_log_abi.h |   4 +-
>  drivers/gpu/drm/xe/xe_guc.c          |  23 ++---
>  drivers/gpu/drm/xe/xe_guc_capture.c  |  16 ++--
>  drivers/gpu/drm/xe/xe_guc_fwif.h     |   6 +-
>  drivers/gpu/drm/xe/xe_guc_log.c      | 121 ++++++++++-----------------
>  drivers/gpu/drm/xe/xe_guc_log.h      |  14 ++--
>  6 files changed, 75 insertions(+), 109 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> index b1819679fa35..fb5e2b8e7cf9 100644
> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> @@ -10,9 +10,9 @@
>  
>  /* GuC logging buffer types */
>  enum guc_log_buffer_type {
> -	GUC_LOG_BUFFER_DEBUG,
> +	GUC_LOG_BUFFER_EVENT_DATA,
>  	GUC_LOG_BUFFER_CRASH_DUMP,
> -	GUC_LOG_BUFFER_CAPTURE,
> +	GUC_LOG_BUFFER_STATE_CAPTURE,
>  };
>  
>  #define GUC_LOG_BUFFER_TYPE_MAX		3
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d5adbbb013ec..82a22479b741 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -99,7 +99,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>  	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
>  	u32 flags;
>  
> -	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
> +	#if (((XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE) % SZ_1M) == 0)
>  	#define LOG_UNIT SZ_1M
>  	#define LOG_FLAG GUC_LOG_LOG_ALLOC_UNITS
>  	#else
> @@ -107,7 +107,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>  	#define LOG_FLAG 0
>  	#endif
>  
> -	#if (((CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
> +	#if (((XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
>  	#define CAPTURE_UNIT SZ_1M
>  	#define CAPTURE_FLAG GUC_LOG_CAPTURE_ALLOC_UNITS
>  	#else
> @@ -115,20 +115,21 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>  	#define CAPTURE_FLAG 0
>  	#endif
>  
> -	BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
> -	BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, LOG_UNIT));
> -	BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
> -	BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, LOG_UNIT));
> -	BUILD_BUG_ON(!CAPTURE_BUFFER_SIZE);
> -	BUILD_BUG_ON(!IS_ALIGNED(CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
> +	BUILD_BUG_ON(!XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE);
> +	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE, LOG_UNIT));
> +	BUILD_BUG_ON(!XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE);
> +	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE, LOG_UNIT));
> +	BUILD_BUG_ON(!XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE);
> +	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
>  
>  	flags = GUC_LOG_VALID |
>  		GUC_LOG_NOTIFY_ON_HALF_FULL |
>  		CAPTURE_FLAG |
>  		LOG_FLAG |
> -		FIELD_PREP(GUC_LOG_CRASH, CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
> -		FIELD_PREP(GUC_LOG_DEBUG, DEBUG_BUFFER_SIZE / LOG_UNIT - 1) |
> -		FIELD_PREP(GUC_LOG_CAPTURE, CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) |
> +		FIELD_PREP(GUC_LOG_CRASH_DUMP, XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE / LOG_UNIT - 1) |
> +		FIELD_PREP(GUC_LOG_EVENT_DATA, XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE / LOG_UNIT - 1) |
> +		FIELD_PREP(GUC_LOG_STATE_CAPTURE, XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE /
> +			   CAPTURE_UNIT - 1) |
>  		FIELD_PREP(GUC_LOG_BUF_ADDR, offset);
>  
>  	#undef LOG_UNIT
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 243dad3e2418..49b47727cd5a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -816,7 +816,7 @@ static void check_guc_capture_size(struct xe_guc *guc)
>  {
>  	int capture_size = guc_capture_output_size_est(guc);
>  	int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
> -	u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
> +	u32 buffer_size = XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE;
>  
>  	/*
>  	 * NOTE: capture_size is much smaller than the capture region
> @@ -922,7 +922,7 @@ guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *no
>   *                  ADS module also calls separately for PF vs VF.
>   *
>   *     --> alloc B: GuC output capture buf (registered via guc_init_params(log_param))
> - *                  Size = #define CAPTURE_BUFFER_SIZE (warns if on too-small)
> + *                  Size = #define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE (warns if on too-small)
>   *                  Note2: 'x 3' to hold multiple capture groups
>   *
>   * GUC Runtime notify capture:
> @@ -1340,7 +1340,7 @@ static int __guc_capture_flushlog_complete(struct xe_guc *guc)
>  {
>  	u32 action[] = {
>  		XE_GUC_ACTION_LOG_BUFFER_FILE_FLUSH_COMPLETE,
> -		GUC_LOG_BUFFER_CAPTURE
> +		GUC_LOG_BUFFER_STATE_CAPTURE
>  	};
>  
>  	return xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
> @@ -1357,8 +1357,8 @@ static void __guc_capture_process_output(struct xe_guc *guc)
>  	u32 log_buf_state_offset;
>  	u32 src_data_offset;
>  
> -	log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_LOG_BUFFER_CAPTURE;
> -	src_data_offset = xe_guc_get_log_buffer_offset(&guc->log, GUC_LOG_BUFFER_CAPTURE);
> +	log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_LOG_BUFFER_STATE_CAPTURE;
> +	src_data_offset = xe_guc_get_log_buffer_offset(&guc->log, GUC_LOG_BUFFER_STATE_CAPTURE);
>  
>  	/*
>  	 * Make a copy of the state structure, inside GuC log buffer
> @@ -1368,15 +1368,15 @@ static void __guc_capture_process_output(struct xe_guc *guc)
>  	xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, &guc->log.bo->vmap,
>  			   log_buf_state_offset, sizeof(struct guc_log_buffer_state));
>  
> -	buffer_size = xe_guc_get_log_buffer_size(&guc->log, GUC_LOG_BUFFER_CAPTURE);
> +	buffer_size = XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE;
>  	read_offset = log_buf_state_local.read_ptr;
>  	write_offset = log_buf_state_local.sampled_write_ptr;
>  	full_count = FIELD_GET(GUC_LOG_BUFFER_STATE_BUFFER_FULL_CNT, log_buf_state_local.flags);
>  
>  	/* Bookkeeping stuff */
>  	tmp = FIELD_GET(GUC_LOG_BUFFER_STATE_FLUSH_TO_FILE, log_buf_state_local.flags);
> -	guc->log.stats[GUC_LOG_BUFFER_CAPTURE].flush += tmp;
> -	new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_LOG_BUFFER_CAPTURE,
> +	guc->log.stats[GUC_LOG_BUFFER_STATE_CAPTURE].flush += tmp;
> +	new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_LOG_BUFFER_STATE_CAPTURE,
>  						     full_count);
>  
>  	/* Now copy the actual logs. */
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 50c4c2406132..8b5c58b1857c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -91,9 +91,9 @@ struct guc_update_exec_queue_policy {
>  #define   GUC_LOG_NOTIFY_ON_HALF_FULL	BIT(1)
>  #define   GUC_LOG_CAPTURE_ALLOC_UNITS	BIT(2)
>  #define   GUC_LOG_LOG_ALLOC_UNITS	BIT(3)
> -#define   GUC_LOG_CRASH			REG_GENMASK(5, 4)
> -#define   GUC_LOG_DEBUG			REG_GENMASK(9, 6)
> -#define   GUC_LOG_CAPTURE		REG_GENMASK(11, 10)
> +#define   GUC_LOG_CRASH_DUMP		REG_GENMASK(5, 4)
> +#define   GUC_LOG_EVENT_DATA		REG_GENMASK(9, 6)
> +#define   GUC_LOG_STATE_CAPTURE		REG_GENMASK(11, 10)
>  #define   GUC_LOG_BUF_ADDR		REG_GENMASK(31, 12)
>  
>  #define GUC_CTL_WA			1
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index b5d837efaf74..90648968d4d9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -19,6 +19,44 @@
>  #include "xe_mmio.h"
>  #include "xe_module.h"
>  
> +/*
> + *  GuC Log buffer Layout

maybe this could be promoted do kernel-doc:

   /**
    * DOC: GuC Log buffer Layout
    *
    * ::
    *

> + *
> + *  +===============================+	      0000h
> + *  |    Crash dump state header    |		^
> + *  +-------------------------------+ 32B	|
> + *  |      Debug state header       |		|
> + *  +-------------------------------+ 64B	4KB
> + *  |     Capture state header      |		|
> + *  +-------------------------------+ 96B	|
> + *  |                               |		v
> + *  +===============================+ <--- EVENT_DATA offset
> + *  |  Event logs(raw data)         |		^
> + *  |                               |		|
> + *  |                               | EVENT_DATA_BUFFER_SIZE
> + *  |                               |		|
> + *  |                               |		v
> + *  +===============================+ <--- CRASH_DUMP offset
> + *  | Crash Dump(raw data)          |		^
> + *  |                               |		|
> + *  |                               | CRASH_DUMP_BUFFER_SIZE
> + *  |                               |		|
> + *  |                               |		v
> + *  +===============================+ <--- STATE_CAPTURE offset
> + *  | Error state capture(raw data) |		^
> + *  |                               |		|
> + *  |                               | STATE_CAPTURE_BUFFER_SIZE
> + *  |                               |		|
> + *  |                               |		v
> + *  +===============================+ Total: GUC_LOG_SIZE
> + */
> +#define GUC_LOG_SIZE ((SZ_4K) + \
> +		      (XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE) + \
> +		      (XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE) + \
> +		      (XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE))

too many ( ), only one set is needed to wrap all additions
> +
> +#define GUC_LOG_CHUNK_SIZE	SZ_2M
> +
>  static struct xe_guc *
>  log_to_guc(struct xe_guc_log *log)
>  {
> @@ -37,33 +75,6 @@ log_to_xe(struct xe_guc_log *log)
>  	return gt_to_xe(log_to_gt(log));
>  }
>  
> -static size_t guc_log_size(void)
> -{
> -	/*
> -	 *  GuC Log buffer Layout
> -	 *
> -	 *  +===============================+ 00B
> -	 *  |    Crash dump state header    |
> -	 *  +-------------------------------+ 32B
> -	 *  |      Debug state header       |
> -	 *  +-------------------------------+ 64B
> -	 *  |     Capture state header      |
> -	 *  +-------------------------------+ 96B
> -	 *  |                               |
> -	 *  +===============================+ PAGE_SIZE (4KB)
> -	 *  |        Crash Dump logs        |
> -	 *  +===============================+ + CRASH_SIZE
> -	 *  |          Debug logs           |
> -	 *  +===============================+ + DEBUG_SIZE
> -	 *  |         Capture logs          |
> -	 *  +===============================+ + CAPTURE_SIZE
> -	 */
> -	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
> -		CAPTURE_BUFFER_SIZE;
> -}
> -
> -#define GUC_LOG_CHUNK_SIZE	SZ_2M
> -
>  static struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_guc_log *log, bool atomic)
>  {
>  	struct xe_guc_log_snapshot *snapshot;
> @@ -257,7 +268,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
>  	struct xe_bo *bo;
>  
> -	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
> +	bo = xe_managed_bo_create_pin_map(xe, tile, GUC_LOG_SIZE,
>  					  XE_BO_FLAG_SYSTEM |
>  					  XE_BO_FLAG_GGTT |
>  					  XE_BO_FLAG_GGTT_INVALIDATE |
> @@ -265,7 +276,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> -	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size());
> +	xe_map_memset(xe, &bo->vmap, 0, 0, GUC_LOG_SIZE);
>  	log->bo = bo;
>  	log->level = xe_modparam.guc_log_level;
>  
> @@ -274,49 +285,6 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  
>  ALLOW_ERROR_INJECTION(xe_guc_log_init, ERRNO); /* See xe_pci_probe() */
>  
> -static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
> -{
> -	return CRASH_BUFFER_SIZE;
> -}
> -
> -static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
> -{
> -	return DEBUG_BUFFER_SIZE;
> -}
> -
> -/**
> - * xe_guc_log_section_size_capture - Get capture buffer size within log sections.
> - * @log: The log object.
> - *
> - * This function will return the capture buffer size within log sections.
> - *
> - * Return: capture buffer size.
> - */
> -u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
> -{
> -	return CAPTURE_BUFFER_SIZE;
> -}
> -
> -/**
> - * xe_guc_get_log_buffer_size - Get log buffer size for a type.
> - * @log: The log object.
> - * @type: The log buffer type
> - *
> - * Return: buffer size.
> - */
> -u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type)
> -{
> -	switch (type) {
> -	case GUC_LOG_BUFFER_CRASH_DUMP:
> -		return xe_guc_log_section_size_crash(log);
> -	case GUC_LOG_BUFFER_DEBUG:
> -		return xe_guc_log_section_size_debug(log);
> -	case GUC_LOG_BUFFER_CAPTURE:
> -		return xe_guc_log_section_size_capture(log);
> -	}
> -	return 0;
> -}
> -
>  /**
>   * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
>   * @log: The log object.
> @@ -327,17 +295,16 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type
>   */
>  u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
>  {
> -	enum guc_log_buffer_type i;
>  	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>  
>  	switch (type) {
> -	case GUC_LOG_BUFFER_CAPTURE:
> -		offset += XE_GUC_LOG_CRASH_BUFFER_SIZE;
> +	case GUC_LOG_BUFFER_STATE_CAPTURE:
> +		offset += XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE;
>  		fallthrough;
>  	case GUC_LOG_BUFFER_CRASH_DUMP:
> -		offset += XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE;
> +		offset += XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE;
>  		fallthrough;
> -	case GUC_LOG_BUFFER_EVENT_LOG:
> +	case GUC_LOG_BUFFER_EVENT_DATA:

maybe to avoid changing the same lines in the same small series twice,
in patch 1 change not just order of enums but also update their names
and don't do anything else..

maybe patches shall be in this order:
 * reorder enum guc_log_buffer_type to match spec
 * rename enum guc_log_buffer_type to match spec
 * add XE_GUC_LOG prefix to public macros to match naming pattern
 * use macros instead functions for size/offset

or if the split is really not feasible then do everything in a single patch ;(
>  		break;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index 98a47ac42b08..a3620462f44c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -13,13 +13,13 @@ struct drm_printer;
>  struct xe_device;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> -#define CRASH_BUFFER_SIZE       SZ_1M
> -#define DEBUG_BUFFER_SIZE       SZ_8M
> -#define CAPTURE_BUFFER_SIZE     SZ_2M
> +#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_8M
> +#define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_1M
> +#define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_2M
>  #else
> -#define CRASH_BUFFER_SIZE	SZ_16K
> -#define DEBUG_BUFFER_SIZE	SZ_64K
> -#define CAPTURE_BUFFER_SIZE	SZ_1M
> +#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_64K
> +#define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_16K
> +#define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_1M
>  #endif
>  /*
>   * While we're using plain log level in i915, GuC controls are much more...
> @@ -51,8 +51,6 @@ xe_guc_log_get_level(struct xe_guc_log *log)
>  	return log->level;
>  }
>  
> -u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
> -u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type);
>  u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type);
>  bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
>  				   enum guc_log_buffer_type type,

