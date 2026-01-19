Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53962D29C2D
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 14:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CB810E47D;
	Mon, 19 Jan 2026 14:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDN3zrno";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F7010E479
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jan 2026 14:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768833072; x=1800369072;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:mime-version;
 bh=vZsvFoOvR9x7QXLE1y5tfKmWg28ESGUqaYuoI2K2aaU=;
 b=YDN3zrnoKL5uMMx2mdZgasm8Mo2h3e/xS5LOmOOknrAhU0JHiMuxq478
 Wl9Og9DiJdSYtVgwNIIGlZh/HeiNQeQXxezlsb4yKjlXwRZNIxi8C4mr9
 HbpwdGVyIrQ3fcQ/UFMDjk0TB/whSt/OH+c0GNhcK14v4WdgpnlsLjwSi
 3IF7U5IVpIQpElmBJlYB++WOD9E4UdQCWSXxD9ROqcwHLohfgYr0EFUVk
 icnh0ymLgsF8nbQRtqCZK+MH1An5aGBS5iQzCvLpSVrQ7bc2/Il0qvEpv
 yifME1XPy4VEAlaLAOzDNYXU3ZWwacpeO9jSHyYK7jIlvdfMwMW3pIKv0 g==;
X-CSE-ConnectionGUID: lTSqpTHlTCa2yNE61wexAQ==
X-CSE-MsgGUID: ymTkRnM1QSyHetX0IhoRHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69947352"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208,217";a="69947352"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 06:31:11 -0800
X-CSE-ConnectionGUID: LCB8mZSFQNCDp11B8VXHtw==
X-CSE-MsgGUID: VDDO6OQXSxCmScboy3oUAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
 d="scan'208,217";a="210895503"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 06:31:09 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 06:31:08 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 06:31:08 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 06:31:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gd0ycMpGU2URLw92h7HtoRA6VxnV13VhNZN9kQXra5mwnGhd86wZO4Fbj3TQcKDRPsiuBS+G9g1i7Yb7JeK9DybS4s/wdJUIpowdXaBcdfGo6nVfKh33vNQtsQW5whwnl7nKNqoci4fYlGnSLSr+pW6OI0dposKzUP/62mlHSwl5XZLTrkgD8zVfsY79VMyLNe2/n7C02g+KcpjtKkfNhLWx9Fi4duyDu6zkSbcNL0j0jfSJ/HTLH5kGE1autwDF6Dsj29s8pyPG0AL5JBtyyRNcouVjeReT0YMD65PwOr4omwlYHt5qBgTM/Oid5Bh/zsBK7yzJFqKmjJIrsMorTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g93jyh2mf6KrmqVKmKbF3It8o6bBNesTAxEJfolSxk8=;
 b=TA0xGUFaqVTzQezgqcrDVRelAXPqT5QtPI9NDYCEoVKwhtTl1Ra5qhWtre2mDDihhTA4aKLCJCZDx+UlMXP4EgAyLA4ZlHChEfssXf6D6q0RepSOy46zCojGKd62JTtQkhFSQp+ABwsL7QukzTNLhriQikAFYRH3AErKyj6HimLpnaHSSukzS4eYYpW+xTheE5DT1AGI/hNC4AWQ/6O7wTZeS2Mxh5XmVHohslO8m0ZYTZ02X9fOqOmcu0TmkYZsycaOsSvw2dWbe6ng2RE6TKwozGGX9QQxsj9er99RWkNY1I88OdMBjZIe9hry6phlFpSuyFybBKFBnhV6CA1onw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CH2PR11MB8868.namprd11.prod.outlook.com (2603:10b6:610:284::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 14:31:05 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 14:31:04 +0000
Content-Type: multipart/alternative;
 boundary="------------NHj0SpMEIWGH28h5LTtBUCP0"
Message-ID: <232d8896-2ea3-4754-a100-b18cec70c57a@intel.com>
Date: Mon, 19 Jan 2026 20:00:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] drm/xe/hwmon: Expose individual VRAM channel
 temperature
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
References: <20260112203521.1014388-1-karthik.poosa@intel.com>
 <20260112203521.1014388-5-karthik.poosa@intel.com>
 <aWYAewvdkrS_WSZx@black.igk.intel.com>
 <e0e82ba8-e277-47c0-8003-d07628e5552a@intel.com>
 <aWdGMjPTy3WnoejI@black.igk.intel.com>
 <578876ef-3d8c-4eff-8853-32d00b81eafc@intel.com>
Content-Language: en-US
In-Reply-To: <578876ef-3d8c-4eff-8853-32d00b81eafc@intel.com>
X-ClientProxiedBy: MA1PR01CA0164.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::34) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CH2PR11MB8868:EE_
X-MS-Office365-Filtering-Correlation-Id: f364f470-5fb9-4af1-3ae7-08de57675fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckNQUVkwVVpTOHR3ZEtyOFg2azRwdTM0bVhXc0M4d0QyVGhNUVVlNllMSWtU?=
 =?utf-8?B?OCtEckhoS3pzSGJOSElBODZyT0lRYWhXMTh2TUNzZnVLRlBuOURXUko4bjZZ?=
 =?utf-8?B?NDBXVjNwMUZxZUdqT2pYS3k5cDkrN3NVeVNzcldvY2Q4a21KN2JvbE4xM25Q?=
 =?utf-8?B?ekNab29na3lNOU5PeHlkT3BxS3RjNUk4WXFXK3hJdnZMbmJ6VjEyS1ZuZldp?=
 =?utf-8?B?T1VOZEE5MUtEWlpGVVdYY1NEY05zZy9hOWRkZk1BL3pWNm9MTk5sR0Y3TjFM?=
 =?utf-8?B?Q2NLU1RKMzV3TU54dXdqME9xSFJsOWxpRSs4MldDUElzSndmbDB4d082bkRo?=
 =?utf-8?B?TWVUYkp2K2VZajF4WVMzTE4vOUJoVDNmc1Z5ZlhvNkpVcGZpYW42cHo5Mk5y?=
 =?utf-8?B?bzJ2VkpLcGljOVB5Y09pS2xaWEs2UWI2TE9DSTF5bFRGSlI0dFNmM1BNR1Zn?=
 =?utf-8?B?bzdXaVlMNEwvTE9wUk9DL0p1cUF0WktWRHZHazVQSVdsUkxxdnI3Z3pnV2N6?=
 =?utf-8?B?b2kvN1lmajVmcGZ4WjJPdFBIU3Zoekl5SWNFSVB0Z3RpaHFWMjlNUiszejZa?=
 =?utf-8?B?M3M4cDBzT3p1dmNwWlRqYXNicFZRWktEQm9Qd2pXM3NTZlBFM0Q5NW16NTBy?=
 =?utf-8?B?aFhpUUxpVExyVHFaVDlpS0FISzNhU3ROam5mMkxYM3ZwRTdMQnBIYjhrNGZh?=
 =?utf-8?B?SHZKNFNwZzA5UU9JYmswbFRYc2dXdXBBYkxXV0o1dExDS3AxVWZIb1B4Qmd0?=
 =?utf-8?B?RkZlcTQydUVmVm4zb3ZhSHN3MUlyM0MzNFlCWWdJZkFtYWg2SWFDbjYxSEJS?=
 =?utf-8?B?V3JuTDFIa2FrZnZOaTUwQklrOVNLeGZDSE5XZnd0VkIrcHhQamdkNkZoWXB3?=
 =?utf-8?B?T0pWSkZHY0liMzZHRUQrTy81Yk0vaHYwVE1DOFQ0eXpRdVJoNVNvZzhvMi9C?=
 =?utf-8?B?eTZTNTBlWklQUkNBcmNHTk9aRlBMaEI3ajNOOXdUMllRTkZKUk5mTkJRbHhs?=
 =?utf-8?B?VTFBRVAxY0pobUlCeENPNlhBdjVYcUhxTXNjajNnZ0xZMGpQUlZwanlWK2oy?=
 =?utf-8?B?V3prQnIvTHA5VWI4WlBrL096R0lXMERyWWsveEs5SWtkTVh1UEFpNnM1cFZL?=
 =?utf-8?B?enZTSTZrMnVRTjdVMW5DZ2FzRVpJQXBqRG5hYTNCaUJIR2hvRVdPM1F4SXE2?=
 =?utf-8?B?RUxKNjY2bGpSZ2NQRUl5R2EwTVI5RUlYSVRMWlZ4Z0RGdDBmMmNUT0x6QVNi?=
 =?utf-8?B?OTcyV3N0MjdVRUNYSFVzdHVRdHI5dDJCQm1iTmFvb3M3L1AvNUE0bGkwOEFW?=
 =?utf-8?B?VUNNVmRvM0U0bjgvREZETG9lNFMyMUR3eExJT3FPUHNUN3l6Y2QwTHNIT1pk?=
 =?utf-8?B?RG1vYjkrNDZMdkh0UFZvYlFiWWF5Nm9YSm1BeHNLUWNmUXdSMW5OREV3em00?=
 =?utf-8?B?MTQ0VzVPK29iMnF3dkd6citMditOTnZtVksrYWNNLzJyeFprL2ZxUWlheHpC?=
 =?utf-8?B?OXhpdXRUTmZPVWxUY1MrZklRWnhhNjJuS2V4a2FJL0J1QlJpL3I0Z3lMa1dC?=
 =?utf-8?B?cUNFSmFFUERnMnFqNVYxRFh3SGw5VGNhZlhuQ3BwQXZKbDJvTFl1N1pzaTlD?=
 =?utf-8?B?VHU4TUFFajBTaFdBTzhVL0wwR1o3MlBVY245MzdDT045b2RDeXB1Vis5V1o3?=
 =?utf-8?B?NmY4M0p5VUdKUlF6Zm9rWGd5d3dIK3RMLzNVSTZSeGZsdDVNYzdkQUQwQ1ov?=
 =?utf-8?B?MDQ4dk1iNmNORXFDZGhkbUlDS0hXblpBdWdKNndUZytiSFRMUytvMFBuc29C?=
 =?utf-8?B?VlZhZUwwL05lTHZ5R2dUYjEwaHI5eU9yKzdOelVkSWxsK2p3TW1Ra2lIVXBM?=
 =?utf-8?B?UFN2Q1VTNk8vTmRWMVplbUdUK3A5SHNTVGtTek1iOGZxcUJTUXZiWlhvbjRv?=
 =?utf-8?B?NG1paGVsbHdlME1DV2l2R3huSUVubGZhT1JSZGhFY0dwV3VuUmxDZG1tTjhK?=
 =?utf-8?B?a2sybHdoSWswMDJvY3EvSGtuWkRBUHpJd3c3K3NGQnNuQ2ovV242Z2U3ektv?=
 =?utf-8?Q?luw2lg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXpJQWdnaXZsYWRnTjQyV2pZN3B5OWg0MjZ2Mjhhbm1FcjRtZWNTYlF4bm5T?=
 =?utf-8?B?S2RBSUprNzN6MHVyazQ1TGFrWnZwNXVSUGZzdWNocnozZnRIREhZY0czSkVV?=
 =?utf-8?B?cFBLRUgyQU9tNHRYTDF3QWYvYkZiMXNNSnFTcFZ3SCtVR0ppYU92dXFDNG9S?=
 =?utf-8?B?UXVlYXFwOGRRUzRMR056U21ldy9sTFR0d08wWEUrNGhQV1YyMkpBV1pCUHY1?=
 =?utf-8?B?Unpwc2l4RUY4RFhMZmdDeGNYRHRVN2tJcFluZUVOUyt2VGFqZ1krV3ptVmha?=
 =?utf-8?B?L29haTN2YlB4R3VuQldWL1huaGNFc084ZHZhSlZ1Tk9NY3d5OXFNUDhJanlR?=
 =?utf-8?B?WHV0ZHpWRnIxeXdiVmM5RWtONCs2MkJXUkVoVU5Mek9TTnZTbnBIUFQ4eHpJ?=
 =?utf-8?B?UnVhbFlLSTBCTDBiSFBydmpKM29pTFVuSUhYZFlxZHpmMFZxdDJDMWQvakVM?=
 =?utf-8?B?blFnN2JMU013K3g3UUtFaUNJZlAvejFkZWhDZGxLcVBMOHhUNkxUdnJiamdN?=
 =?utf-8?B?VVVNZGx6TkZ4QStNakcwcFBnb0hiS1JkZW5XRlpJT0JvL2hFTDdyR0lqTEE5?=
 =?utf-8?B?aDNUb3VLZmlpNmlhR0kvVDBFYjA2ZTF2MUMxUmYrSW55RE1XQkdJNDBJRk5Y?=
 =?utf-8?B?a0RoWDhKUjl5K0NkSXVNOENDOE1scC9VWjUvazlWM1NXNXM0WFdpU3pneGd5?=
 =?utf-8?B?cXhkUDlwK2dWMkZuMThtUVVVTWtCVWR5L2Y5cmxQa0lIdHZMdFNFTkdDZGMy?=
 =?utf-8?B?WWZIRFJmWlBhbVBpQWtJRzJvcThEMHQrVUhNS2tIMkl4bGtLenRTM0R6OE5R?=
 =?utf-8?B?UUdZV1dNM29LVlYrQkQ4T1NYSVZ3cTlWM1NCVU8xalVtWG9wbklma2RxZ0Vp?=
 =?utf-8?B?eHZGeG40YVJXenZBMElJdUtIL3hCRkh2eDBtc1ZjSjBFUmFBOHFGL0pTb3pH?=
 =?utf-8?B?cU1ySS83clY0RzBvUGxQTXZDZjJKa2NNY1dYS2JJbmM0NnlGY0dEVk04aytW?=
 =?utf-8?B?K2QwV0crWEZJYW5xdzJPWTdlKzQ0czlVSFFCTW1vaFljQ1RvSjV0aHo5NjVL?=
 =?utf-8?B?ZW5ielZvS0hvQk9XSXQxMzFSSlp2ZFZxSU9DSDhyZjRpTDAyTG1Kc2xWQVZa?=
 =?utf-8?B?UjE3VExTbUoydnJQWXpHeDhzcVdJUFFZQVhSbmRkdGlYOEZVYzdXanloN3ds?=
 =?utf-8?B?bEFUU1pxbkZSTnoveEc4ZmV6dlpvQVM4UU9hcmlta2pJNWRJdWI3alpyN1FV?=
 =?utf-8?B?V0VXNU03cTFOUzNySW5QQklqd2FNMXM0MzBKRFFIRWlOSFAxQ2oyNVcrNVVk?=
 =?utf-8?B?aFdFSmFCQ1BwMU5DZG1NOEdmak5McEhoalBNeUxndTBIN2UraVNYeDcwOGs0?=
 =?utf-8?B?RmJNcUl4b0d2aXRITldLSW5XZmdjdWtDeUhmaG1xalNUN0FxWGNoR2dUSmFK?=
 =?utf-8?B?MU5JSDh1QmZScXZZcDVUdkFnckdWNXZlQjFXd1dodEd1ZW1yVlVZMjBmU2RB?=
 =?utf-8?B?cDJoRWczMlJ1UlQ3NXlHYm5UWkF3a2tsTzU0OWxwR2R2OTBIVDVnM3hRbGd0?=
 =?utf-8?B?UHN6bGNYN244cEFMUysrRWdXWTJybWQ1WDMwTlVMNGJLYkl4bkZkQy93eXp2?=
 =?utf-8?B?UVZYaE1PQlJhNG5CQzFXTHhIckIwOUR5L3Z3SlI5Y0xYT0c0RzVkblFEL3Ru?=
 =?utf-8?B?YWdhTVQ3OGRQcVpJVjdMb0dHTzFwNzYxSmpjMEo3cDhzMHY2RDFIWlYyOVRX?=
 =?utf-8?B?L2NqZ0xWM3dveWl3NExUc1FUYXg3UUxqTXJPTWZPODl6MmNuWG50VW9aMGZq?=
 =?utf-8?B?VjZIelhpMTRIcTAyVlFMS1JvRDU4cXRKZ2Y0Yjl3ZGZBcnBiRm45UEh5R1RE?=
 =?utf-8?B?SU1iRDJkakFRNkgrakh6RExrdG9KWkMzdlBzelBlbUJlbnhzL2hhN1JJaERI?=
 =?utf-8?B?OGV3K3pybHdUYysrREFnTHhxYW51REJsMEV2d2d6U2tUaTBBRVl3Q3NPQm8y?=
 =?utf-8?B?VGxTbmZvU2ZxZTdqcDJhWWFOMzROLzBIMjdxbEU1cDFxQ0EvNFFPVXdseUdi?=
 =?utf-8?B?N2JkNVR3M2pFSFRwN0wxVzE4T0RWbWRhQy91QjM0Zjc5R0hLZWtsOTVac3kv?=
 =?utf-8?B?R25VZ0RuNGVKTFFLSXhBdlpDNVJkN1NoOC9HdW42UDJMY2cramI1UVRFU2dP?=
 =?utf-8?B?VE15RExzUUpValZXUCtjdmV6S1krS1Q5ZmFsZEJxSjg0SmMwRWxmWGg5TjVJ?=
 =?utf-8?B?NmxDaGVMMkVsNis5OVlaQXlpdFREK2Fmd1V6RHhVWkxaS3phdHlCa3YzNXpi?=
 =?utf-8?B?eVdKK3BtMG1mNlMxbTU3VkFobFpsU09xVXJ3S1ZIbG95REpzNko1dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f364f470-5fb9-4af1-3ae7-08de57675fe5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 14:31:04.0079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfn6Tl6cqSRLH+0ECCMUjDNl175NCmleawyAxDi7avKBWCmpD5lbSRd787Q96yg3G0TJmaPmK1a5VS/s2VFFWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8868
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

--------------NHj0SpMEIWGH28h5LTtBUCP0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 15-01-2026 14:57, Poosa, Karthik wrote:
>
>
> On 14-01-2026 13:00, Raag Jadav wrote:
>> On Tue, Jan 13, 2026 at 03:28:51PM +0530, Poosa, Karthik wrote:
>>> On 13-01-2026 13:51, Raag Jadav wrote:
>>>> On Tue, Jan 13, 2026 at 02:05:21AM +0530, Karthik Poosa wrote:
>>>>> Expose individual VRAM temperature attributes.
>>>>> Update Xe hwmon documentation for this entry.
>>>> ...
>>>>
>>>>> @@ -255,6 +264,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>>>>    				return BMG_PACKAGE_TEMPERATURE;
>>>>>    			else if (channel == CHANNEL_VRAM)
>>>>>    				return BMG_VRAM_TEMPERATURE;
>>>>> +			else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
>>>> I think this should be
>>>>
>>>> 	if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
>>>>
>>>> or did I miss something?
>>> I’ve ran IGT hwmon test and lm-sensors and didn't see any discrepancies
>>> there, all available channels are seen.
>> Sure, but shouldn't we fix the buggy logic?
>>
>> Raag
> I shall address this. We didn’t observe any issue during verification 
> because there are no new channels beyond VRAM_N.
> I’ll raise a patch for this.

Actually CHANNEL_VRAM_N_MAX needs correction,

Raised https://patchwork.freedesktop.org/series/160302/ for this

>>>>> +				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>>>>>    		} else if (xe->info.platform == XE_DG2) {
>>>>>    			if (channel == CHANNEL_PKG)
>>>>>    				return PCU_CR_PACKAGE_TEMPERATURE;
>>>> ...
>>>>
>>>>> @@ -1353,6 +1415,8 @@ static int xe_hwmon_read_label(struct device *dev,
>>>>>    			       enum hwmon_sensor_types type,
>>>>>    			       u32 attr, int channel, const char **str)
>>>>>    {
>>>>> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>>>>> +
>>>>>    	switch (type) {
>>>>>    	case hwmon_temp:
>>>>>    		if (channel == CHANNEL_PKG)
>>>>> @@ -1363,6 +1427,8 @@ static int xe_hwmon_read_label(struct device *dev,
>>>>>    			*str = "mctrl";
>>>>>    		else if (channel == CHANNEL_PCIE)
>>>>>    			*str = "pcie";
>>>>> +		else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
>>>> Ditto.
>>>>
>>>> Raag
>>>>
>>>>> +			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
>>>>>    		return 0;
>>>>>    	case hwmon_power:
>>>>>    	case hwmon_energy:
>>>>> -- 
>>>>> 2.25.1
>>>>>
--------------NHj0SpMEIWGH28h5LTtBUCP0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15-01-2026 14:57, Poosa, Karthik
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:578876ef-3d8c-4eff-8853-32d00b81eafc@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 14-01-2026 13:00, Raag Jadav
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:aWdGMjPTy3WnoejI@black.igk.intel.com">
        <pre wrap="" class="moz-quote-pre">On Tue, Jan 13, 2026 at 03:28:51PM +0530, Poosa, Karthik wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 13-01-2026 13:51, Raag Jadav wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On Tue, Jan 13, 2026 at 02:05:21AM +0530, Karthik Poosa wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Expose individual VRAM temperature attributes.
Update Xe hwmon documentation for this entry.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">...

</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">@@ -255,6 +264,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
  				return BMG_PACKAGE_TEMPERATURE;
  			else if (channel == CHANNEL_VRAM)
  				return BMG_VRAM_TEMPERATURE;
+			else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I think this should be

	if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))

or did I miss something?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I’ve ran IGT hwmon test and lm-sensors and didn't see any discrepancies
there, all available channels are seen.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Sure, but shouldn't we fix the buggy logic?

Raag</pre>
      </blockquote>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">I
        shall address this. We didn’t observe any issue during
        verification because there are no new channels beyond VRAM_N.&nbsp;</div>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">I’ll
        raise a patch for this.</div>
    </blockquote>
    <p>Actually&nbsp;<span style="white-space: pre-wrap">CHANNEL_VRAM_N_MAX needs correction,</span></p>
    <p>Raised <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/160302/">https://patchwork.freedesktop.org/series/160302/</a> for this</p>
    <blockquote type="cite" cite="mid:578876ef-3d8c-4eff-8853-32d00b81eafc@intel.com">
      <blockquote type="cite" cite="mid:aWdGMjPTy3WnoejI@black.igk.intel.com">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">+				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
  		} else if (xe-&gt;info.platform == XE_DG2) {
  			if (channel == CHANNEL_PKG)
  				return PCU_CR_PACKAGE_TEMPERATURE;
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">...

</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">@@ -1353,6 +1415,8 @@ static int xe_hwmon_read_label(struct device *dev,
  			       enum hwmon_sensor_types type,
  			       u32 attr, int channel, const char **str)
  {
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+
  	switch (type) {
  	case hwmon_temp:
  		if (channel == CHANNEL_PKG)
@@ -1363,6 +1427,8 @@ static int xe_hwmon_read_label(struct device *dev,
  			*str = &quot;mctrl&quot;;
  		else if (channel == CHANNEL_PCIE)
  			*str = &quot;pcie&quot;;
+		else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Ditto.

Raag

</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">+			*str = hwmon-&gt;temp.vram_label[channel - CHANNEL_VRAM_N];
  		return 0;
  	case hwmon_power:
  	case hwmon_energy:
-- 
2.25.1

</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------NHj0SpMEIWGH28h5LTtBUCP0--
