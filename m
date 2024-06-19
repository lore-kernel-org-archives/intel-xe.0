Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5E3C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 22:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503CF10E296;
	Wed, 19 Jun 2024 22:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTMXLzdZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7339910E296
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 22:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718837783; x=1750373783;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lDMXIZ9p64wmJPGDVxmyRDxFE53yEDqS4tNMGx6vDdc=;
 b=XTMXLzdZLVm0ujHLTtlV/P3SBGqgBULpQuFnnS7lF4Tswukdz6YDwMHn
 MsGbfIJ4UpPfBg09hCQlRVyX5REkNkJXVu70stTq0d2T92FJEr5StJjII
 maiSQQ6xg8hnwQkLzOTxYLY49n7FxnOaY/zR6JJmlA4Xi633esa3NBwq2
 ZVpYfMEUZPz7pT4Ox+4JyRfQL6ZLFHVEEC4YTFoF/5xzyJk/4+zCgE2vs
 h6nV8i1tpTr8mHBklzZh4BNzOUM2V0yGbOsTE6U29mehr5gUhKoisBWI8
 nBJckbH8FNHUIKf9tLVIwQpiJcW48O9nvRnLMjaHW5+hpkei4F3AfOQQe w==;
X-CSE-ConnectionGUID: SEU9bhDpRQWJySCnPNg7/Q==
X-CSE-MsgGUID: 3AJfXCbsREuOxAIeARl9NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15768438"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15768438"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 15:56:22 -0700
X-CSE-ConnectionGUID: gubmWvGrQTyJhHQjMvhRlw==
X-CSE-MsgGUID: UbSHke+tQP6sAKoFM0c4qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42711968"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 15:56:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 15:56:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 15:56:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 15:56:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 15:56:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKWOwbxfBRREIG3epBf1jqFLivh1QDEfz9FF6aTvvVGUQnCAomLAdAQWd+uluXBOe8rBxOWUxXawLGD0HE2acf7pXEyfIapYgcG/wNgx0XM2lstOY+kV8haFd69DAGksL9FXTT7+YaVS4WAS7IqWbrFBKXtugpbSFxlWtOIYNDoSyjq6cUGYBqeFY6SbNeCrz6qPL68R+Bt/5Pg0jIfiLkMdqznAud2bPr6rvshS/5Z/dalTOrydlEt3YLA+47MffwbYjFG7qN3NMlbM32fgluOorgajhpLVmUDtGyD+wOmXXPvMOMaXNtOyDPtg2hlL/2y+Y3QzOQ0PsBilYGf/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rI8uOPGb1MOw2RqVgorWipwOA38RempNSOq+NpqKxk0=;
 b=Qmk9HflIXZwB3ACGqHbHv40MYXjUjQu5QF8TIVfxy7dvKUK645cfNzxGdL6jV/M4k0ub0VpATES+wqBtv4fhSI9AqmkOvYB/EC28iOv4h30tH7M5ySBpUEgn0Rebu5R7FxEblgmSFZcSLcHC9ogtvpXf639vxfosCXePlJXje7cNsUPvyNl/IyL0UXdaAM/c1UEpKfaC9ypQF7rri5l3zCQ2grUlNn8WBKLkgiIeQnYqsjrzzajuntLVirRvGwmIjOi1kvFnXXZ981jpji3ZWFXA5EaKNqotfBVeBUUuo+/XE2vWMtjasdNjTjA1mM2RlvxeF3vCZmAjHiSXWX4ehQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DS0PR11MB7767.namprd11.prod.outlook.com (2603:10b6:8:138::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 22:56:12 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 22:56:11 +0000
Message-ID: <b90925ed-1d88-4ef5-9f54-0027f38a2b76@intel.com>
Date: Wed, 19 Jun 2024 18:56:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] drm/xe/guc: Add capture size check in GuC log
 buffer
Content-Language: en-US
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, John Harrison <john.c.harrison@intel.com>
References: <20240607000719.1012422-1-zhanjun.dong@intel.com>
 <20240607000719.1012422-4-zhanjun.dong@intel.com>
 <8c58b7df-6d4d-45ce-9b55-0d352e132148@intel.com>
 <39bf8731-fc40-4edc-a014-89841d5d5375@intel.com>
 <32df3a98-ed81-4a07-aa7e-17abcc136aa8@intel.com>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <32df3a98-ed81-4a07-aa7e-17abcc136aa8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::26) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DS0PR11MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: c49ae47b-a837-4c8b-5ae8-08dc90b3038e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDdLNThnZmo2MWxCRjRlckFDYkZ0U2tqM05DSk1FaktQSzFKTU9RdWM0R3Fs?=
 =?utf-8?B?MW5jMlQrMnFaK2N4aGVEaFp2ZGx3QXdpNGQ3OWlZdUlsUFRMK0tpY1BqUUV3?=
 =?utf-8?B?cFp4S2VQSktTczJpSDZyd2pTKzI3ZnlvR0swaThwK2NWWkdqamR4NmZWTXJa?=
 =?utf-8?B?dTZuSTdKZ0U3eDBLZytud2w5YUNWNEFueTJxUlY2UzRvZnErQjFNdkhnMjFi?=
 =?utf-8?B?c2JYWW1KcnRnaDVaTVh3SUhkUVMrckdrMTNHdVRFM3ErbnlnSU5ETDZNQWR3?=
 =?utf-8?B?QzhQOWlqaGFJWTcxcmhZTWFoK0F5azNkUTk4OE1yTjNWOFByV2dKOUtTYnJi?=
 =?utf-8?B?aHdjN21TQmFvWWswOGpmbEJIZEVxWmRORGtpN3FSMjZhUG85bUQ0Qk4vM3JK?=
 =?utf-8?B?bE5ndVJMd0ZweG9rUnZpVUlJa3RacVBGcUd1KzhURjJKeEd3WUsyQTFzRlZy?=
 =?utf-8?B?aW1yYUx4ZVVVLy82ZWltY3lvUmhhYnNtRzBYUEZBaG9pdkFJQ2hmLzRzOXdE?=
 =?utf-8?B?Ny93Tm1mdWNoOVRsa0hnY3ZMSWcxYTRuWDJCSlpkMmtiNkcwY1JKRFk5WENI?=
 =?utf-8?B?R0JVbzZhSnkyOXllcFdpMG9YZkgyelJ3ekpOSGlmRkRZdHhFYngvV3NxelZ5?=
 =?utf-8?B?RHR3dmVwNng3aUN0RVpJYnUxSHphUW5RQ3AyVGZwVUVEcWF3WWphbUpQSGtY?=
 =?utf-8?B?UExQeGtNdmMrbjJFNHc0aEsrT01EZDRTTVczRFRicEpNamJmTXJnQ0lQcGNt?=
 =?utf-8?B?ZUs1K1poWUQ5czlzTXVELzU1L1g1ajNzTjBMTkZRUFRDT1hnNWh1RUQ0d3pQ?=
 =?utf-8?B?YWZFV1NWU2dmVnFaeFByci8wa0Y1TmhHbllXOGJzRk1hZktqZlFaL0ZjRTEx?=
 =?utf-8?B?WWN3THBHT1VIVTZ3bnBJcG5kb1RkZnRPTHRQOXZVbmc5aFRhN0NqUjNZemxD?=
 =?utf-8?B?YXNJaHFTZFZvZ1JvWVdXU1dwVmNMVzZkKzBtL2NITjlWQTUyRVF0aUFjSDdz?=
 =?utf-8?B?UnY0cm5Lb0dkWmVHdThrL1FjY2tqc0lkY2plRXJBSFpyRW4xdnRYa3paS2Mw?=
 =?utf-8?B?dnZLYVVZaWF0R2d0RGRXL1MxOEI5RkZRSG1OeVVhNFI0eVlVaC9JZktVelMr?=
 =?utf-8?B?cGNZWUV0enBiRDk1TEIwYmFacW15aDJaRmhxVHZiaEFMaXlaWVZPL2JHaEJO?=
 =?utf-8?B?cnlGbzFlaUtJbkdDSzdDV0NqNUpmN0haR2lhL01kRUQ0VFVyVGpQM0h5b3dI?=
 =?utf-8?B?dEc3eXFuRzlyZXJ5OWF6MktFenNNT0tVa1p0eW5zOGk5NksyRmRXSjRtbk1a?=
 =?utf-8?B?Z3dYb1djdmtlUHBGekYrWHVoZkRiamlORkJwdFFrUG9WcnVHMFpsbGJvYU1E?=
 =?utf-8?B?ekRqWkRhaXBZOWJVS1ZNNzJEdHlPWXNQd3NoUHpaS3ZSdS9HaEpjZ04vM25q?=
 =?utf-8?B?TGowRlZPWCtHWW1TMTN5OXg3a3JtNUozTFdlayt0TTl4RGc5cXR1Mk5PajBj?=
 =?utf-8?B?S1F6UDh4WDlBVzdhcDBTK29RbFNFNHhCWDh4SWhtS0J0VDlyYkl1Y29GajZ5?=
 =?utf-8?B?NmVpR2tYMVNtR1ZmcytkU1RaMHRZVTFON3JTenBXaTlFZ0pMaWhQdjVJRThZ?=
 =?utf-8?B?RXhIRFdyV3VEc0xMWEF0eVJ4c01NMHpkd0VvbDhDT1BsM1FBYTMwYk1KbXd5?=
 =?utf-8?B?VGJrTmU0MUxzT254RDZrblROT3F4dWdtNGJ0R2gyTW00Wi9acjdXOFE2Tmk5?=
 =?utf-8?Q?FOX6aq1YNeiDRTM2zM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlEyVzFxbmw1Rjh5ZEU4UXFybnhkS0RSdWZ3djdySHpETEV6YkdkTVQ2UFZp?=
 =?utf-8?B?ZWlIeXJjU0hvS0lrMkZhMS9WWDJpM3NQeHFZT3c1UWg0S3pPbUkwL1VPOXlE?=
 =?utf-8?B?VElGdFVKUnJGb0JlblM2WThwZjlidHE0RSsyK0RpcWRJUUFhdFdDV2E4d3JN?=
 =?utf-8?B?V1dRaHRCaFd5YUh2TkV0eXVtbE9NWUpzNW1vT1Vsc1RNR2VaL1NkMXh1c1Zi?=
 =?utf-8?B?dER0K0NJVXB2T2RUbzlUL0ZuSGZiWGloTVVqUWFzTlRlRnpubysyZGFhRVBw?=
 =?utf-8?B?aTFzSlE4QXphZURDb242N3g0UDl4WUpvY1h4TmkxZ1JiV01WQ01QTlUvRmJp?=
 =?utf-8?B?d2RlekFMVzBYZEU2SVhabHR2MFNLMGQ0N3Zha0NjSk5KTnllOXdFMjVPRmRC?=
 =?utf-8?B?TVluN3pBaWc5eHo1QTZ2RHVOWGdIbjVraEhrUmRwU2o4NS9TeDRISndOQU9V?=
 =?utf-8?B?dlArazJLYll4elBXb3RQd1EwRXU4c1QyS1o3c0pWQnQwQVNLNHNScG1PREVY?=
 =?utf-8?B?UzQ2NGJhaCs5V1NOYXVWK2FVK0NnenUwV2lNYWxxeFV4bjhIUU1ybU85SHVB?=
 =?utf-8?B?cVZNOFI4SmFyN1owaEpyK1hYek93a24vZ1J4YlhNVzA0bVl0Q3NOZ29JQU10?=
 =?utf-8?B?NTl5Y1A2L29pR3JBcUZtYkVUbGdiVnJlVmlKVnU5TElwUVZ6Wkd2ZkFHRXZ4?=
 =?utf-8?B?OTBZblNyU2pNVWdPZTJmbVBHRmVmVHpPd1JaOUpPWEQzaHV1UUJJeERxTExW?=
 =?utf-8?B?Q1lJcHZQYjBqa3RGeE5zeWVVcG1aemdrbE5XU0NIMXZ0VnEyZytpcEpNWURF?=
 =?utf-8?B?Vm1nRTNQOWt2N1E3QlIrQ3NmaFVzRkJhZ3kzSEhFSTdFSFdFVnQ1dDlKNUEx?=
 =?utf-8?B?VWhrbGR4cG9zbjFRd1hPNUEzWkYySm5Zbm12c2toWHV0K0RjTUoyek9iL3RC?=
 =?utf-8?B?THloVXltUTJ5RHRNSms2Ny8ycXpTK0dNcVhRUThISVdKRTJUTnlZTG8vYk9i?=
 =?utf-8?B?R0RsRnhtWDFFQ1FCTXIyUVo4TEk3dE1FOXN5ZnVZa0lta0JOSm1WK0FBb0ZR?=
 =?utf-8?B?YmRUdHI1S1NVaTUySkF0UExuQUxPd1pnUEVUOVhYVURtSGpHY2pqTGlMd1VK?=
 =?utf-8?B?YmxWb01YTkhEWDNZSHpDZ1RUeFdUaHg0WGxZQUcvenBzdG5xcmhrcGJUNDB0?=
 =?utf-8?B?c0E1WUJ4L2JSeFpRTnNpRnU1M2d1aEI3ekVZMGh5MTBXVEJKL241RGxzUEpY?=
 =?utf-8?B?SEkzRjJubVBWbVVBdTF4YWVrUWluclc3SmRrajJUaW01Y3A3SUM4aXpWb1Bl?=
 =?utf-8?B?RUhCSUFnZks4akg4L0sxRWFtNzl4NzVqaE9PeTMwZXlMY2phbEVNS05nb3Q0?=
 =?utf-8?B?eTJvTXBFUmtQMTZLRjArbmlRVWtDc09JMnBHSk5wcGFVRnhaZXYrVWhpTnND?=
 =?utf-8?B?djVUazk2cVJTS0VTckVRWlBUUzR1bkNXV3BJMkhOcDJRZ3RyS1lHWktmM0s1?=
 =?utf-8?B?blMyTUFmUzU3MW15a3RaVExzeFZDbGtGZno0QkIxQXpUOEpLQUwvWTJWc0la?=
 =?utf-8?B?S0ZaWFU5T21tY2pJSk9HK3JRSDdwd2tXa2psUkQ0WnNjUFc3bkxHWmJtNGFp?=
 =?utf-8?B?QmtIZGdNa1NKSDBweStUeGFlNGsyOHM2L0lwZFhKNnZCaFB6MWJ4T0V5TWJz?=
 =?utf-8?B?bTBUeU95bDdSMjVodytKVFdpSVRqMWVYUTYxdmNvQjBFcE5kN3oza0JFN1hl?=
 =?utf-8?B?NEU2Wk1KREs1RjdUclVueW5IZnoyMmdlRTdXaGlzOFRlS1ptbHJxSm55bnk4?=
 =?utf-8?B?MjR2VER4WERBREVBOFRGc2ptUUUyMTdBblRNRlFJOENVUVR2MC9vQXpwS1Fu?=
 =?utf-8?B?WFVxNGZXZ2NaZkJvZVdrS0FCNnZFKzY2T1lRbGFsSTRuTVBobjIvMFZMeHhy?=
 =?utf-8?B?UnRtSXZFWm5Ga3RLaVBKbVVLRFJjWVJhTHVFVW0wdDhjYjlYbEpWSitUajMz?=
 =?utf-8?B?dml3RjMxNVFiNXQ2cHdEejJicEc1RVQ3QTBnR3FzSElPQ1lZaDR3WGVlODNl?=
 =?utf-8?B?YjFlcnB1TmtQY2ZBK2hkbU1LQTA1Y0JvbUpCaTh1KzNMZ1dHdDFIRThQYjdI?=
 =?utf-8?B?Z2o5dkhjTi9IcGt0YU04d1dncU4vT043UmFVeHUzamJOd0NKbDdYOFpFRFB4?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c49ae47b-a837-4c8b-5ae8-08dc90b3038e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 22:56:11.4611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVG2A2MBNjd0pbItXRGczl38sgb7CkYvdW+pbH/0BVy9tcUZDqDZw2vhJZ9Gv/yMViFIko3djlgK7k0DJ3XH/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7767
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



On 2024-06-19 6:28 p.m., Michal Wajdeczko wrote:
> 
> 
> On 19.06.2024 21:44, Dong, Zhanjun wrote:
>> Please see my comments inline below.
>>
>> Zhanjun
>>
>> On 2024-06-14 8:13 a.m., Michal Wajdeczko wrote:
>>>
>>>
>>> On 07.06.2024 02:07, Zhanjun Dong wrote:
>>>> The capture-nodes is included in GuC log buffer, add the size check
>>>> for capture region in the whole GuC log buffer.
>>>> Add capture output size check before allocating the shared buffer.
>>>>
>>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_gt_printk.h     |   3 +
...

>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>> b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>> index 04b03c398191..908298791c93 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>> @@ -250,6 +250,54 @@ struct guc_engine_usage {
>>>>        struct guc_engine_usage_record
>>>> engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>>>>    } __packed;
>>>>    +/* GuC logging structures */
>>>> +
>>>> +enum guc_log_buffer_type {
>>>> +    GUC_DEBUG_LOG_BUFFER,
>>>> +    GUC_CRASH_DUMP_LOG_BUFFER,
>>>> +    GUC_CAPTURE_LOG_BUFFER,
>>>> +    GUC_MAX_LOG_BUFFER
>>>
>>> this last enumerator is not real buffer type, so better at least name it
>>> in a different way (at least add __ prefix?
>>>
>>> or best, since it looks like ABI definitions, just move it out of the
>>> enum to benefit from compiler checks that John prefers:
>>>
>>> enum guc_log_buffer_type {
>>>      GUC_LOG_BUFFER_DEBUG        = 0,
>>>      GUC_LOG_BUFFER_CRASH_DUMP    = 1,
>>>      GUC_LOG_BUFFER_CAPTURE_LOG    = 2,
>>> };
>>> #define NUM_GUC_LOG_BUFFER_TYPES    3
>>>
>> Will changed to:
>> /* GuC logging structures */
>> enum guc_log_buffer_type {
>>      GUC_DEBUG_LOG_BUFFER,
>>      GUC_CRASH_DUMP_LOG_BUFFER,
>>      GUC_CAPTURE_LOG_BUFFER,
>>
>>      GUC_LOG_BUFFER_TYPE_MAX
>> };
>> The empty line speprate real type vs MAX
> 
> empty line is not enough to let the compiler see the difference between
> real _type_ and _max_ definition
> 
>> I would prefer to stay within the enum, which make add new type easier,
>> the MAX will be updated by compiler automatically, no need to manually
>> add 1 to NUM_xxx macro.
> 
> but this is (or should be) a stable ABI so we shouldn't rely on the
> compiler to automatically making any changes to any of these defs.
> 
> and as of today we have exactly 3 types defined as:
> 
>      GUC_LOG_BUFFER_DEBUG        = 0,
>      GUC_LOG_BUFFER_CRASH_DUMP    = 1,
>      GUC_LOG_BUFFER_CAPTURE_LOG    = 2,
> 
> so if you want to use enum to get some help from the compiler, like to
> check that in your implementation you are not using bad types, then
> there should be no other enumerators in this enum, as otherwise you kill
> that feature
> 
> also note that your approach will not work if for some reason the new
> type will be defined as something different than 3, like:
> 
>      GUC_LOG_BUFFER_FUTURE    = 345
> 
> so while will have 4 TYPES, your automatic MAX will be 346, making it
> almost useless
That's true, it is a stable ABI.
Will be changed to John style.

> 
>>
>>>> +};
>>>> +
>>>> +/*
>>>> + * struct guc_log_buffer_state - GuC log buffer state
>>>
>>> this is not a kernel-doc format, intentional or typo ?
>>>
>>>> + *
>>>> + * Below state structure is used for coordination of retrieval of
>>>> GuC firmware
>>>> + * logs. Separate state is maintained for each log buffer type.
>>>> + * read_ptr points to the location where Xe read last in log buffer and
>>>> + * is read only for GuC firmware. write_ptr is incremented by GuC
>>>> with number
>>>> + * of bytes written for each log entry and is read only for Xe.
>>>> + * When any type of log buffer becomes half full, GuC sends a flush
>>>> interrupt.
>>>> + * GuC firmware expects that while it is writing to 2nd half of the
>>>> buffer,
>>>> + * first half would get consumed by Host and then get a flush completed
>>>> + * acknowledgment from Host, so that it does not end up doing any
>

...

>>>> +    }
>>>> +
>>>> +    return overflow;
>>>> +}
>>>> +
>>>> +unsigned int xe_guc_get_log_buffer_size(struct xe_guc_log *log,
>>>> +                    enum guc_log_buffer_type type)
>>>> +{
>>>> +    switch (type) {
>>>> +    case GUC_DEBUG_LOG_BUFFER:
>>>> +        return xe_guc_log_section_size_debug(log);
>>>> +    case GUC_CRASH_DUMP_LOG_BUFFER:
>>>> +        return xe_guc_log_section_size_crash(log);
>>>> +    case GUC_CAPTURE_LOG_BUFFER:
>>>> +        return xe_guc_log_section_size_capture(log);
>>>> +    default:
>>>> +        MISSING_CASE(type);
>>>
>>> there should be no need for 'default' case if you properly define your
>>> enum type
>> Compiler could check static error, while 'default' here can cover
>> run-time errors. I would prefer to have it for public funcitons.
> 
> but this is still driver only function, called only from your code,
> where you should be using only valid enumerators, so no need for any
> random runtime protection (unless you already abuse this function by
> using random integers as params)
> 
By switch to John style, this default case could be removed.

> 
>>>
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +size_t xe_guc_get_log_buffer_offset(struct xe_guc_log *log,
>>>> +                    enum guc_log_buffer_type type)
>>>> +{
>>>> +    enum guc_log_buffer_type i;
>>>> +    size_t offset = PAGE_SIZE;/* for the log_buffer_states */
>>>> +
>>>> +    for (i = GUC_DEBUG_LOG_BUFFER; i < GUC_MAX_LOG_BUFFER; ++i) {
>>>> +        if (i == type)
>>>> +            break;

...
