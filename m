Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24361CAC5BB
	for <intel-xe@archiver.kernel.org>; Sat, 27 Sep 2025 02:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867D810E05B;
	Sat, 27 Sep 2025 02:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtYKwrwi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8547010E05B
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Sep 2025 02:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758941976; x=1790477976;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KG+JWOTXPx/TR3Ouz9wx6B3rF+V4czffjt04/z5EyCo=;
 b=GtYKwrwi6Ori0WLMV5ZVq3W6VSNXlERLaIZrEq2hoGu75izEWznPFKWx
 o+1qH3RSsqLiMf95FYMANF2okTPwfF3Lflq5fFfA83K9H7bH7yb/amymX
 JT88Una6QemPq2mi7DcQLWH5NqO+JVqGQW6DBwSkWb9Wp9XvxCJk9QwmZ
 2SHGBl1EJ0KsfjO1cNIBsS5/Se7YvW6Eq2PXkQCtMLOCzG1sW5oBu+qLH
 bCmAhOCdJc7LBxZFOhgJKsX1DaiprQMJ3yQ4idLuDRg59TF5aGHWG1o6F
 ntaX0K3SX+SZUtrEAh65MUA8CSJMt+hzhyJqkghawWu36+xx2d8jGe3H/ Q==;
X-CSE-ConnectionGUID: WLAQe8WxReWAzJ4BQPFEoA==
X-CSE-MsgGUID: cEJxekC9Q0W9Rf5OZOV/Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="60977172"
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; d="scan'208";a="60977172"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 19:59:35 -0700
X-CSE-ConnectionGUID: o/WW1YhfRgaO2D9A/YvPMQ==
X-CSE-MsgGUID: dKcLSEBeQPi9ByOdD1b36Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; d="scan'208";a="181773642"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 19:59:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 19:59:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 19:59:34 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 19:59:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uctIy/QpoMPo/rF/6PkHraGmH6eCcWkA2w3K+C/Xbbu6Y+P5lfOShVymIldavFPtfpp6D56GVESzqqDmkFkm689QDwmzF0Hv5iU4XhRPQzCt2H/oThH60jhU0kzSjl0pHXFYhCL4C43uxmZZFEKAQ45U2mFBjYtv8n5PFHA1vYsXq/MOKi/qHOIUeMYBWeCcc5K1XGkYC1kGTJBJ80lLkzdag9xUFwUKtyiPjuC5+mKb8A2HTPHpHkEhr7zzn2oDcz30G6SCUerZDrqFexGrmRcom2lhcpvuHtNFBYE0CWsmdiM+qr0lmTDJDgcm90t8y2Ip1FP9N5iLT4WRjnrEsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmXWVTcWhQ1sH+QAmUM2IziCSMgW2BZI9necS9oOc7I=;
 b=kKgqsc1aOIn7fphbiH92QXj92DDpfGytL6JfBWagdNgZocmhTQQk2jqGVhoBCjT5Y3EGohndBgGHHrP0jbvC1g8frfZ3qd1oOTovVN6XKX/Lsd+Y+u0ZeaCcmaqeRwy4zi7MVfvYpreWRKMgb9AoIeQmSMh+wjrqkynwhQ5YqL3bnOB/4uyxuUg4ddOhwUFPf5c+L9aCMqonbJAbYLoTUmvTu/Da0KYiW0wGmt3HwM7Uexi76xEnTZGZWZbsvQDqaQ7jTqT5JFY8sI3CCuKJFZcDqnsFtQ6ahCdL0ogvOydBuktc3CxjvzgXC14+uUFBS/weG1sXoWm6GTAyV0nIkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Sat, 27 Sep
 2025 02:59:31 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Sat, 27 Sep 2025
 02:59:31 +0000
Message-ID: <e9246fdf-a0bb-4345-ac4c-59135181c6d6@intel.com>
Date: Sat, 27 Sep 2025 04:59:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/34] drm/xe/vf: Don't allow GT reset to be queued
 during VF post migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-18-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250924011601.888293-18-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0295.eurprd07.prod.outlook.com
 (2603:10a6:800:130::23) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|PH0PR11MB4952:EE_
X-MS-Office365-Filtering-Correlation-Id: 05076486-676c-4e68-6d56-08ddfd71e130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXo3SjdBTnJLbXkvQ29WWURzUXFqT3JrWHN3VlA2V0JpTk0vbzBJNlZmUFdO?=
 =?utf-8?B?RDAvM3lWTmlEVGgreGVZbE9UdDVPUWlxWkZGVnBEZXhxUzh5WWo5RTJISW1a?=
 =?utf-8?B?eEtONkNlWHgxSTVkRi9YUHBIaVpjSEhpS1owUDhRb1FrZi9hSmdaK2g2am95?=
 =?utf-8?B?VFRSWWFLUWdaV3lrRHV3ZEowMXlVNFVnV1dIZkFxQjhCK2JmY2NiS2Q1L0tV?=
 =?utf-8?B?YThFOURhMFgrazdTcDBzcUowSjd2OVpMczdXam50dmdsQmc4dmExZERtVTND?=
 =?utf-8?B?MVBUN0lDcWx6QXJjN3R0Q2JNcHdBd0dVd2VPYm1OMDdHV2ZFM041MXd6dklY?=
 =?utf-8?B?aVVXTmtRWEYwMWUrRHZlNjhSa1RDZy93ZlJRbWRVZk9jS0FTcDUvZjRWUk9W?=
 =?utf-8?B?VGdYZzRZUXhxcE1VempjWW1zamlwWk95VzlOKzMvTkxuZVhyZlo0YkdBY2VY?=
 =?utf-8?B?MDNpNkNoSFNqd2RjZnpTbEZRN1I5UnVFQmg4enlpSTZQVEMvemZ2a0NzYndt?=
 =?utf-8?B?T0lvR3lUQ3RqZ21tMEYzNjdIS1YrK1BmNDhPRk5mbTI1SDVyQjN3OHh4VW1I?=
 =?utf-8?B?blpHZjlVVjBNNVVGcUw2dmVxQzFWbGhiQStvc2JhZlZOdStTT3ZLRTVJemhx?=
 =?utf-8?B?L1pQbWxaWDRBRVc2SW81ZVpLd1FKMDB5LytWU0NLNE5nTERkVU1hNlFYNnVW?=
 =?utf-8?B?YnpvZ0JXREJ6dmNGeXM3LzdqL1llKzVFZjFWczRRWXhVQVVHRlJOSkZWMzgz?=
 =?utf-8?B?RWJ0bXJzMzJWNWJFZmVXbVlQZFdCU09BOFlQUXIrWWFwaW0xMkVZR0RFU3p6?=
 =?utf-8?B?WXpROXJmUWhuNVF1b3BDNHpXWEV1ekc5dzVuVzVkR2c0SVVsZWlLZFpxRzBj?=
 =?utf-8?B?a1FERld6Sk9uaktvdmZ1RnJ3WUZCUFZIaHoyTEJYd3NadFliTUtyWWNQSitK?=
 =?utf-8?B?dmtScXVRNmVUMzBIU0lBVkpWTi9FTXFYbjVGM1h6a0w3dGVWaFgxeUZET0lW?=
 =?utf-8?B?d2dUK1JVdS9xdzltejk2SFNsNGZBNndubUhLRDZWZkR0YUVUM3dpTWoreFE0?=
 =?utf-8?B?T1ZoZXNFdjhqMjUwdlRHMEVPQUVVY3ZaT3l3dWo4eUZsMWN4TEJDUFdMeXc1?=
 =?utf-8?B?bTdyU1hRK2FsN2dIdUtCZjN5WnduTHNzS2pTME92aFpKc1BHbEpsTXFyR2M5?=
 =?utf-8?B?bmY5QzFpblVVeU54eDdmWm5TN3RlMUM2ZEtjMDZrNnU1dXJFV05nUHh1ZHhI?=
 =?utf-8?B?N2dEQkVLUEJjMjZab1A1cTMxcHpKZjBaVWFCQWgwUXQrZS9lMkN5MWlFTTkr?=
 =?utf-8?B?eEJZL0J0RlVBSlJxMUFxTkNXaUlGS3oxZFJCbm82cS8wRVEyU3dwU1NleTlm?=
 =?utf-8?B?QmVuT0k4ekR1c1B2anZrcFVlQ1hhWHZDRUprUTVIajFaV2NFN3p1ZERWUWU0?=
 =?utf-8?B?akozaGVUV0dhTk92Z2pkUisreXNsUmx6TDhCWWNTN1Jxd2ZNMkdIbzVxOXpt?=
 =?utf-8?B?dWZtSUtML3NPdEJKY0VYektKRll2TE1vUWlVMnZWblFOa1FkNGFVWTF0MGlH?=
 =?utf-8?B?NldPZXNtK24rTDN4dGJxQWJpdjdmakxkdzZ0OUtMZjR5WGI3YUZSU0d6aVNH?=
 =?utf-8?B?dEJmR2RxdU5nSlFKaU5US1QvWnJvdE40M1k3eVpPbGhVSkp4QWloNzJLdndy?=
 =?utf-8?B?cGZCWjQ0Y0Z1U0llU2VLRldoV3pNbjcwK01JMW1obFJqSlFPL0NjSXI5NFpJ?=
 =?utf-8?B?YUd3NndxaCtmK2NSOVY5eE8rcTQremxKSzAvSGpVaUp5UjlhTHZlT1J5VDZC?=
 =?utf-8?B?Z3EzWGd2TktkMmNGOE1DM1loaVhsNFlVaXJkdEtFZ1dwWkxpWUxqblZrMFFF?=
 =?utf-8?B?Vk5MaE10V3BKVDlxME5jYnJmSmlJRExsS2dOYkU2dG56MUxCN1NUV3FsRzRM?=
 =?utf-8?Q?x9EhQFb1e952CdhCVYlg4IVGNCpsjtlP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkFqWStBbGswSzNEeFpjOW5JNmw5ZDRZTmVwU1Z3TmZNN0l2bDc5Nk5kTTJ6?=
 =?utf-8?B?Mk5KY0RpRXBmSi9uZ3hFSTdCVDh3L29pMVkvU2xUbURuMTdQZE5BQXVoQm1K?=
 =?utf-8?B?NUYzZmZvdGZ1by9IK3k0OHNJWWUzSjc1QjA5emdmZjJ6VnBaYlorbzlySjhO?=
 =?utf-8?B?MjZjNzhtM1pDTUgraTRtTGdvWFNKaTdEbEM1ODQvTlBYY29uUEsrTjUxOERi?=
 =?utf-8?B?VUhUSDBPazA1U1JPL09yekljeUhiaHR4cisrVEo5YzBtaVpyODE2bklxY1U5?=
 =?utf-8?B?VEYrWEJoTDlsUEE1cDM4MWpDY1l0cU1ENEsyb0xxRkZhNXZ3NFNSb1FaNzkv?=
 =?utf-8?B?dFgyYUxLekw5NThJZ052MHhGeno4UEFWd2sxb1VVWWlvVDdVcEoySHEyTzE1?=
 =?utf-8?B?MkNXd3dXa0J4V05yMUVRdTEyREw2U3ZOSk5sangzWDdLbFhMb2ZpOTZSaWxx?=
 =?utf-8?B?WjltM0tuZWNaMTdFQjV5Wkw4ajgzTytSWXRMMHdUY0FZWG1Ibk9pMkQwamNW?=
 =?utf-8?B?Z2xoc0sxSTZqSGFTUnh4VndRT0E4UUgxU09acmJPOVRleEpJVHlvYlNnb3lu?=
 =?utf-8?B?RWVBTjBDT0Y2TVcya2VLRHlrazZzdG1Cayt4Y0RRMWNZRzczOUgxN0VXWU12?=
 =?utf-8?B?bklNdk5CY2c2WTBhS3Zld3ZxcHVnZXVKTHFzQjU2QVRrd0pQUnVaU2NESFZL?=
 =?utf-8?B?RlpmRHhKMUJ1aFQweGhwaHd0dXR5YWEzZmVMS2I0c1Ayei9ZMENHWVFjVG1p?=
 =?utf-8?B?OUhxV255c05IWndzSGt5OEE1RTdVemJKaFhVZ21QUGdiOENrbmNIMThHRlVZ?=
 =?utf-8?B?aDNVVllkTkl2OVRBTFZSbDVLVGM5eDB4YS9WZlhkaGhvTVJEQjdhYlBTcTJs?=
 =?utf-8?B?ZGlNS0J2d2N6NTNFdWJDSzFGQ01jVXVkelZRRkEvalNBem0rK1dnYVBtWjQ1?=
 =?utf-8?B?N2lXWTExSUxDdDkwdW1sWXpGZGdjM0thcnJ5TkFMcFZpb3VMOXlXMkpIbktI?=
 =?utf-8?B?c0JjUG9SdFhhaTc2T0F6aHVsZnUyTUVJMG81UzNHNHNIcm5ES3RRK1dxdGsx?=
 =?utf-8?B?Yko1c0lFdlNrWHpnWnBIeW5LV1ovallhcWRYMGc0WnJCYURBM29UeWxpL0pH?=
 =?utf-8?B?T09oQzBCQjZzaVcvdCsxSUxYRk5MS21CMnlwaTBqb21QODFQbGdNWVRqRlJw?=
 =?utf-8?B?bVo3OFY1R0pzK2VBeGFFSFM4V0hzY1lPQjh5SnJ6ZEx4WVFiWlNCRDZlNU9i?=
 =?utf-8?B?VnRuN0FLSkQvYUViT3QrcFlzNEZOVnFHN2pObS91Wmh1dkVoK3VOdzlPemtk?=
 =?utf-8?B?dGNMdjV1ZkdCdlVPb2ZWTlFiT3BuTUVXNzg5L0c3R0llWmcrMldCN3FZQlhh?=
 =?utf-8?B?bmk0MlBWakNnL25HU1ljamZPczNLakRSY2tuNHYwQUpoTmduaWFVVUt0OFBR?=
 =?utf-8?B?YS9qdzdvWEN6K0FsVmM1eHB0bnkrOHBKRjlpY1VIN0xDLzFmYXJFeTBOWWFx?=
 =?utf-8?B?bGlOb3FTQktxU1VqZ2k0SVZXVU1tNnhaRzJXRFVtbUdBVUJnVWdRL0dQTlVa?=
 =?utf-8?B?ZkNiSmNXTnQ1Z04yQ1JQcVBTbnFUWisvZHBTTEtCUW1lNWRqTmVWRzBMSm10?=
 =?utf-8?B?SlN0b0hLeSszTGlDajU2RzJibzdyeDVzTHF3Y2h6elJHNmovS0Y2cGszT0pr?=
 =?utf-8?B?N3VzNTd3aW5UWmtxdG1UUEFqK0FLUlhsWXNoZHNjbWd6NVhNZzNxTGNzbWhF?=
 =?utf-8?B?Y0Z4aEpFVmFRb1hTY3dDQWoxVFNkU0pZVG9nc1M2T0M5blRweTNaSngxM3hq?=
 =?utf-8?B?cXBNY1hXUTZnNmRXbldSK3UwQ2xmZGlGeGxPcmZPZ2JQNUhvZUVCOUwwZi9Y?=
 =?utf-8?B?bGNIWWRROVVTcHFXNElvc0dCYkliWkI4Y2ZYZVRXV3RDMTVtc0o2YW5scG91?=
 =?utf-8?B?WUF2Q0dBcDBVencrZ3pkQ0UzRVpqSlhyRlV4NXJURTEvRGpGbTJqWFN1ZmpH?=
 =?utf-8?B?SzFiVHhnT0p3WXN5ZGhQL3Q0bFE5d1cxaEVuQnlwNThZbUVCcmpiUGZ2UGRJ?=
 =?utf-8?B?ZEhtUTZWdFpQWm11TmE0R1N4NTMwQ3VXSzA5Q25jdVFuYmNsYVl2Q1BCeUZ5?=
 =?utf-8?Q?jPHLfaApvP/NRG4yVP/LZN6QC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05076486-676c-4e68-6d56-08ddfd71e130
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 02:59:31.0702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0FQzey+XeqFFR/oU5cnlEki3Nnep0vX+vK5+ge46NGNjjCUJLjNW6aPhycLZ0cQLPdePusNL4ZJbZIDwnM4Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4952
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


On 9/24/2025 3:15 AM, Matthew Brost wrote:
> With well behaved software, this should never happen.

Not a very reassuring description.

But the patch doesn't really lead to ignoring that situation as that 
sentence suggests; there is a bailout from reset if VF recovery is in 
progress.

This will work fine (for migration, it's actually better as we don't 
need any reset of the new HW), and adds way less code. I'd just improve 
the description.

-Tomasz

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c          |  9 -------
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 -----
>   drivers/gpu/drm/xe/xe_guc_submit.c  | 41 +++--------------------------
>   drivers/gpu/drm/xe/xe_guc_submit.h  |  3 ---
>   4 files changed, 4 insertions(+), 56 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3e0ad7e5b5df..1a4796cd885b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -803,11 +803,6 @@ static int do_gt_restart(struct xe_gt *gt)
>   	return 0;
>   }
>   
> -static int gt_wait_reset_unblock(struct xe_gt *gt)
> -{
> -	return xe_guc_wait_reset_unblock(&gt->uc.guc);
> -}
> -
>   static int gt_reset(struct xe_gt *gt)
>   {
>   	unsigned int fw_ref;
> @@ -822,10 +817,6 @@ static int gt_reset(struct xe_gt *gt)
>   
>   	xe_gt_info(gt, "reset started\n");
>   
> -	err = gt_wait_reset_unblock(gt);
> -	if (!err)
> -		xe_gt_warn(gt, "reset block failed to get lifted");
> -
>   	xe_pm_runtime_get(gt_to_xe(gt));
>   
>   	if (xe_fault_inject_gt_reset()) {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 4eaffad6ebcf..b8e02bba7360 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1175,17 +1175,11 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>   
>   static void vf_post_migration_shutdown(struct xe_gt *gt)
>   {
> -	int ret = 0;
> -
>   	spin_lock_irq(&gt->sriov.vf.migration.lock);
>   	gt->sriov.vf.migration.recovery_queued = false;
>   	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>   
>   	xe_guc_submit_pause(&gt->uc.guc);
> -	ret |= xe_guc_submit_reset_block(&gt->uc.guc);
> -
> -	if (ret)
> -		xe_gt_sriov_info(gt, "migration recovery encountered ongoing reset\n");
>   }
>   
>   static size_t post_migration_scratch_size(struct xe_device *xe)
> @@ -1219,7 +1213,6 @@ static void vf_post_migration_kickstart(struct xe_gt *gt)
>   	 */
>   	xe_irq_resume(gt_to_xe(gt));
>   
> -	xe_guc_submit_reset_unblock(&gt->uc.guc);
>   	xe_guc_submit_unpause(&gt->uc.guc);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index cd5e506527fe..b82976f031e5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -27,6 +27,7 @@
>   #include "xe_gt.h"
>   #include "xe_gt_clock.h"
>   #include "xe_gt_printk.h"
> +#include "xe_gt_sriov_vf.h"
>   #include "xe_guc.h"
>   #include "xe_guc_capture.h"
>   #include "xe_guc_ct.h"
> @@ -2182,47 +2183,13 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>   	}
>   }
>   
> -/**
> - * xe_guc_submit_reset_block - Disallow reset calls on given GuC.
> - * @guc: the &xe_guc struct instance
> - */
> -int xe_guc_submit_reset_block(struct xe_guc *guc)
> -{
> -	return atomic_fetch_or(1, &guc->submission_state.reset_blocked);
> -}
> -
> -/**
> - * xe_guc_submit_reset_unblock - Allow back reset calls on given GuC.
> - * @guc: the &xe_guc struct instance
> - */
> -void xe_guc_submit_reset_unblock(struct xe_guc *guc)
> -{
> -	atomic_set_release(&guc->submission_state.reset_blocked, 0);
> -	wake_up_all(&guc->ct.wq);
> -}
> -
> -static int guc_submit_reset_is_blocked(struct xe_guc *guc)
> -{
> -	return atomic_read_acquire(&guc->submission_state.reset_blocked);
> -}
> -
> -/* Maximum time of blocking reset */
> -#define RESET_BLOCK_PERIOD_MAX (HZ * 5)
> -
> -/**
> - * xe_guc_wait_reset_unblock - Wait until reset blocking flag is lifted, or timeout.
> - * @guc: the &xe_guc struct instance
> - */
> -int xe_guc_wait_reset_unblock(struct xe_guc *guc)
> -{
> -	return wait_event_timeout(guc->ct.wq,
> -				  !guc_submit_reset_is_blocked(guc), RESET_BLOCK_PERIOD_MAX);
> -}
> -
>   int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>   {
>   	int ret;
>   
> +	if (WARN_ON_ONCE(xe_gt_sriov_vf_recovery_inprogress(guc_to_gt(guc))))
> +		return 0;
> +
>   	if (!guc->submission_state.initialized)
>   		return 0;
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 5b4a0a6fd818..f535fe3895e5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -22,9 +22,6 @@ void xe_guc_submit_stop(struct xe_guc *guc);
>   int xe_guc_submit_start(struct xe_guc *guc);
>   void xe_guc_submit_pause(struct xe_guc *guc);
>   void xe_guc_submit_unpause(struct xe_guc *guc);
> -int xe_guc_submit_reset_block(struct xe_guc *guc);
> -void xe_guc_submit_reset_unblock(struct xe_guc *guc);
> -int xe_guc_wait_reset_unblock(struct xe_guc *guc);
>   void xe_guc_submit_wedge(struct xe_guc *guc);
>   
>   int xe_guc_read_stopped(struct xe_guc *guc);
