Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E08C36002
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 21:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123CF10E055;
	Wed,  9 Apr 2025 21:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+4iDevI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894EC10E752
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Apr 2025 21:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744232625; x=1775768625;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N7lJ+GbN4C/PamJSVZY7DdCPL/reNnRAlqMQ9Q/a7qA=;
 b=F+4iDevI0F5j0nL5CIohaUPW43ct1WJ5Xl0EUNe08rKR+FxWvwJsUsER
 M0+l3tu8bAPo/WxxQMuU8B7AHS5VH31HyWonkw8TOsVk7QjrgaAa6Wbxe
 RUX7Rc2NV2BzBtkV/gZOFnHACJVKNURWz2G/vf+rOBvEcUCsF2hn/0D9A
 HWdp643ZkG4ZK4fIppdZRoFlJ2FJF2rILVWuFhjo6GPK2oLt7LEEvpBhs
 YgqQ9VigHeqSULHltnL6ocnIVIozv5lfBhUDiusyLBlYuPZL8YeJoTXw9
 hf6dyQYb2vCe/kxK29wz8OamN1ZAxZAb9ZIb1UU+/WhYggIxMtgsRixDW g==;
X-CSE-ConnectionGUID: ZWPp1YX2RJmIIPkhpwvIRA==
X-CSE-MsgGUID: NQup0ox3SPOfItqSaGLRHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="49529273"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="49529273"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 14:03:45 -0700
X-CSE-ConnectionGUID: W7Elsw63SYGAiMqwFXImrA==
X-CSE-MsgGUID: OrNtk51USXiUn/xMHv0F0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="133675755"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 14:03:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 14:03:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 14:03:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 14:03:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnVEBvEuTEjJgjS6cxIAIZ8+tyAGAwZiCzAojGs+uf0fNPQNzCQ4XdiP5taGZailTB3EU0wBSXsBe0joa8raGKMAiOhdKSjcpLBbTEMnW5gHEbYOeH0BW6MbOsd3xOUkzHs60LJtO/J0SkdC9pEvaJyNt6FWWrsCqIBp+j19KCDAQQ4bhsr2XOiDi5bTRP5f0B+mnAGUf4r3vahQuVvrTEpeANsR/RnjUe3g+Scy5ETRFKYGTY+xg9V1/0LEAjJuey0/8Y3uo7aEYAwGOK+IAL4BSoSiskEuCZqGw9s3gLv57T/7Qvh4BdL9VoOknw2WSDpXW5RaY1HyxdQQJPF8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYHJ8us+syck0hQu+YStabevpI7AFYB8nzwFiPc7zeY=;
 b=GBEL2yfUalobhpeHFjR1EaCl2c3BBDgIcLOUIdCpokOQCCEvL22620YC7IseSULgrQSYDn+slbvzo8M3Ed4A5qXG0gjajGNtR6HezoY7w9BLUiVBaWVaMzpPS39ecWdKzxDRQ46XClK7rXxkauk9NoJXfqx/orlmSz1k+VaH0ZkBvGzJEBb7ezdKI7ShWTYrTQnv2aXPFF3gGniZ/GEVJoQ2mRkqTam16sLp5Uqx0ZwSGMkSomRxGSN/8dkkz2nJdbWsiFUIPv9bh4qG2b+JDve2v96LxJa7PyPvWFfEIFfqIvq7I2OmBBBq1+BaXRdakBDzZ5Ns84OWQMkVARk14g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.20; Wed, 9 Apr
 2025 21:03:41 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%4]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 21:03:41 +0000
Message-ID: <937feeb4-0c33-465f-a34d-0ea57c390f63@intel.com>
Date: Wed, 9 Apr 2025 23:03:33 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v7 2/4] drm/xe/vf: Shifting GGTT area post migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250403184055.2317409-1-tomasz.lis@intel.com>
 <20250403184055.2317409-3-tomasz.lis@intel.com>
 <bb10b91b-9a47-4642-a023-15ae4780b7b4@intel.com>
Content-Language: en-US
In-Reply-To: <bb10b91b-9a47-4642-a023-15ae4780b7b4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0286.eurprd07.prod.outlook.com
 (2603:10a6:800:130::14) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|LV3PR11MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: 10863d33-ef81-469f-a82b-08dd77aa0167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnJsUHdwWjByd2xtUHRMQi9ERWllMXFseW1ZbDloTUIxekxlek9xWS9ncEVo?=
 =?utf-8?B?Uis1MnNpQ0I4Z2MwbEg2QWNacHhacmFrMVIxeEtNaTRoOEVIQXNiRGFXUCtk?=
 =?utf-8?B?QjhmR1NUSnlXeERiMjJ6MWVwMGdGNzhpV1Zkck53cmovQ0JLMEVpcXQyNVBU?=
 =?utf-8?B?aHdKbFlBZFMxYk15N0ZiRmdaNU5RVVlxbUdtZWMxQ2Z2WjdCUEs2VkExZ1Br?=
 =?utf-8?B?ekRFeElOaDRLZVFXWk5QLzd4SkRHbDl6T1JWQ25KeHZudyt1a3UzQWRjRXJQ?=
 =?utf-8?B?S1BVb3ZzdFAybTdPaDhwRTZrdGx3U3pod3IrSTJPMG9ybkpJTm1kQmZpRm5Y?=
 =?utf-8?B?MkRMTS9DakdJeGhzM1pVYzZ1ZllkZHVhMk1GTWtuMjA1R2YxanNEKy9NamJ4?=
 =?utf-8?B?NCtQZFo2ckZFd3JXMDkyR1JNODgrVHF6QlVtcWxrVkRKdU1FL2pJVk1KN29B?=
 =?utf-8?B?Z1ZBWjd3ZDV2WE5NYzFQT0I2R2p2dnZCZGlEY2ExaDhzWE5ZVzQySDFLS3Ba?=
 =?utf-8?B?R1hvYW9mWlN3THVKeGtYVDBQS21WU1F2RmtVMzV1UC8vSWxxV2NyYkRvZmhY?=
 =?utf-8?B?YzdORXhOM3M5NnhuMVBlYm1zbGFMR3kyeXlMeStmK20yMTByNGtkUzhDdGho?=
 =?utf-8?B?M29vc2hmdUJnQzNlRUM2TkVUYUVTc1NCUGhrZTV6Z2wwY2c5TzlkY3lnV3RZ?=
 =?utf-8?B?SjJBYTk1eUtkRVl4UHNQcFkrMUltRlc1QUtSenJTdXhvT0laMitWclYyS3ov?=
 =?utf-8?B?RmZwMXM4SVEvZ0dmU2dueFlnQVFMSFNnL1BBMnhoQmttUlBYN0t6Z3paMUNm?=
 =?utf-8?B?OXNSRHplakt1dUpJRFppN0RTZFlzeENyckpmWnQzN3RLZjIweHYwKzE5OE5z?=
 =?utf-8?B?ZTdkMTR3U2FTOXVSTDMreStFZTBnVHVLb0Nwc1drVTh2SE9INStpZGN4b3lo?=
 =?utf-8?B?UnBidGcrM3M5MVZqWE91K0xwRzcwRDBKbFBCNW56bFdIMlQwOGE2aExNTXNX?=
 =?utf-8?B?ZVZZTXIvUERTL2RwU3loaWNxd2VRbU5KdEw1VjBKT2xBNmRjR1RzdCt1MHhv?=
 =?utf-8?B?R2hETUQxZjRQbHlydFBabVFJRW9rSGEvY1NtRk8xQ3dGWDc0ZHppMnp0aUJC?=
 =?utf-8?B?UDhXVjgzTGFBSm9keFJxN2h6ZWFQd2tuSnVhWUNqbm0xRlByeXliY2VNNmxO?=
 =?utf-8?B?L1RRSk5FVEU4bXp3d1VaZmZyaGNZNFpGbmpWV1pNckMxYUdOVnR2dWRNNnhZ?=
 =?utf-8?B?SGh2WnZXMmlZZzFYRnVXdEpkMXNKOFRyT1ZTWUlDWU5hbVNNdmZUWkJSVnV3?=
 =?utf-8?B?QzVQZzY2UTArbkVObU9DYnNSNGtCMGtlM0RJSytuSWhBYWtheFdwY0lSNS83?=
 =?utf-8?B?YU5BS1U3UmRlaHFraGl0L1R2K0NNSk5hQjVVNTM2RE8vWDdMa29rNVpzc2Ju?=
 =?utf-8?B?cGsvM3RxQTdEOFBzVi95TXhtRTl1cnJ1RENOVUtjbjZjZXJvMUhxdTNMOUlN?=
 =?utf-8?B?REVnZ2FJTXBKUENqVVlMMlRKSE1xOThQa3BVMHFjUGh2MU9SVWM0NFV2TzI2?=
 =?utf-8?B?djEzVFliYlVJd01EV1BGTEt5Z0paMitydTN1Q0ZEcnplOHNHeGRYUmx0RGtq?=
 =?utf-8?B?RVp6SjJ1QlJaR1VTVTFOMzAzeHQxOW1pZHJhb2F3S2FTUTZaSWRaVExVa24x?=
 =?utf-8?B?N3JTUkp6VysvUzd4NnFESnRLMGpmV1JXTEsvY2VUZUZqWk4vZnBKR0dSdDdq?=
 =?utf-8?B?dEdGdlZwQkRFK1Q5Znh0bHZ1c0FDcWtkcFllZ1lkZUdRb1Z4YnJrZ3M4OFlP?=
 =?utf-8?B?QVRQaUdSYkQ3T1hqSnNVdnFrc1I2Z2IxNW1DWkdCNjZuUGlpWVB6OVhJUG41?=
 =?utf-8?Q?/jguQ5egc8bjF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STAydnF6VDlram1VUnBaUktXendPZXRtRklMemM1WDFQYzcxbEJUTG8xWXQ0?=
 =?utf-8?B?NlhJeEFzb0VEQ0lkY0hFTWFWSTFxbEVyeWxDUzJmSXNLVXRBY2lJZnpTWTBQ?=
 =?utf-8?B?dzRGR1RwcTZGemdqTnBmUERLWU1ZWEdZMHdxV003SVZ2aFluTTZMdlVXQ3Ft?=
 =?utf-8?B?dHh4VDdZdFZFNDFxbEp1RFlqeWxYN3hxK1NPMitMaHBtTUk1VzkwbUg0QlEr?=
 =?utf-8?B?Q0FjQkRCVFZIMkVvWEpsYVFsNlhTZ0Z6SmRkN2tHdDArRnVSeU5NQ1dlTUVm?=
 =?utf-8?B?SE4rTzlveGdVUDBMQ3JQSDRtQkI3YUluQm1WSkxlOXJ3bUFLakJMV3RPY1Bl?=
 =?utf-8?B?NUNwQVNxVjRHRHdSODBPSGJJaE51OHE5cGtSRTZOeS9XWFZPdGloUEhkcUpu?=
 =?utf-8?B?bENrdkxnckdlMVhpejdlVE1rbWIwMVA1UE0wOFVyZ3JlemU3NnFxK2s4elFW?=
 =?utf-8?B?VzRNQStDRTQvTzd1bFdtOFQ4ZGdIb0VJMjBybnRodG1zbjNIUHQyL0tzengv?=
 =?utf-8?B?WFMrRmk0YTJRb0daRkRkaVhlamFnNHMrdmNzTDlVNmJRdGg5WTQycTlsblVV?=
 =?utf-8?B?SEp3L2dzVFFnN0dFMDhUN2Q1ZHd4Q2NreDZxNmI4enZWdFg5d0dkUk5rVE9B?=
 =?utf-8?B?RlhDM0VDTitpaHJBbWtXa2FNaS9EU0RJcFhpc0p1S3NSaDZwOEx6NTU4eThV?=
 =?utf-8?B?K3BycHo5MWZoaTh4WVNqWlZVcG9WdFFBTkR4MU1ac3hUWGJ5VGIrdlpsY21P?=
 =?utf-8?B?TzVmc0V4VTNRdGVDZ2hEb1VxKzFQU3JrY1N1Y3kvNkdmMmNDeXQ3TUZhRENw?=
 =?utf-8?B?bzVhWDhqSHUzQVViUVdRMlBXYU9YM3J3aWZkZlVmWGdxQW9RODNyTnhpLzR5?=
 =?utf-8?B?dmpadXNhNE1QN0xtdXBreXhTNnk5VnNyeUhWWVVZRmJWQ3RyNUtyWXBJdFUr?=
 =?utf-8?B?Slp4d3JlWUJZbk54L0tNZEhYczlObnhzZ1ZWcnVhdVd0MVNoeXhTc1FiZWxW?=
 =?utf-8?B?eCtiN2FXZHgrQWZRYXdsUWxPaG1ZTGFXQ0srSE5McVJSSzZ5Rk1XaUpBRWJ0?=
 =?utf-8?B?bThxb09vMnlHVEx0ZEhUbTUyUEoxVlc1QUFpWVZBWTBHamxEN3FSTmx4NDJu?=
 =?utf-8?B?ekxiMStmWG5SQTU1aE9BR3hxM21FSnN4dEwvcWd4bmpXYkZyR0twUnQ5VUc1?=
 =?utf-8?B?OTFIZVpDQ0ZTSWwyY1hhejlwbTJaeVhETzlKeC8yTUUrN0hEVGZrS2UzRGd6?=
 =?utf-8?B?eXFnVUZPL09TM1MyMGxUd1djWU9zblR1bWpPV2xXVzRDYmVUUXBrOC83U2p0?=
 =?utf-8?B?VjlFdGNHZUhlN095ODZCZEIzdkllYXU4RURwWlF5RmNWbmpxaXN6clJ0MHl6?=
 =?utf-8?B?TlNLTVRFZUxLalRKcWs3alhlT1Rmb0hrbXJDODNrVWx1eFhxSlNjTlBxM3dZ?=
 =?utf-8?B?dVpDNUtWYmoybUpQM1F4YmpUS1pjdldXQUc0S0FhUXcvcnJCdi9tMWVLNWNz?=
 =?utf-8?B?d05qNk1CRCtoZytlT2JtZWIrdGRqMlVLK3Z3Ti8rdCtzT3loM2ZESjhuMFRI?=
 =?utf-8?B?T0dzTDFJR2FjZERscVpkWjAwcEpsUi82Zmc2TVZxb2tLNCtJZ3dYSFhZVzB2?=
 =?utf-8?B?ODNLQlF5ejh5cWxXNFV2VmQ1bVB4cXo2U1owbGhPLzNKdlp6cVd2bXFPOXRG?=
 =?utf-8?B?M2o4UlRjTmh1bVJRbk43ZFh0VmRhS3phWXhEQW5VMlZJSWZ3SWk3OTVFVHJI?=
 =?utf-8?B?cmtQTDFQQXdRbm9LMmpMQVZOM2ozQ21oUUx2TkFPOFhPVDlXdFk4bk12TnQ0?=
 =?utf-8?B?OFNMWFgzVzR6WEJNRU5pU1hkUEdWK3RNODF3cjY0RHdoRDI0R2xJM1FVb1J2?=
 =?utf-8?B?M3Z2cTF6YWxDV3Z6czVlZy8ydyt5dEpCQnZ2SnNKWXJzeFZmYitoVEVyVzFp?=
 =?utf-8?B?VFd0QUNXQUVKSVhrWFdJQUhFcjN5WnJMSWJpdUFXU1RmakZ0Umd6aktCVnNH?=
 =?utf-8?B?VWN3UUhQZUU4REd1cmJWWWRPYWplK2E1WTBSV1JkSzVsZTR6S2dBWlNkMkxa?=
 =?utf-8?B?ZjZwRFZ1NVo3MmgxZUVrRnlsZHowazFkOUZSbkhLT1lTZHN3L3NuZE82bzFk?=
 =?utf-8?Q?TEBymWmggiMv9Hb8j6YOdnoR8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10863d33-ef81-469f-a82b-08dd77aa0167
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 21:03:41.1600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxfp/t/cZHB0PKJ4sn0Vnzg9aqbzz47XewG5nWRnbJISVrCJa5svsgoI1NBFSpFPIJe43DpTE8H/hNwqoxJ2ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
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


On 08.04.2025 15:23, Michal Wajdeczko wrote:
> On 03.04.2025 20:40, Tomasz Lis wrote:
>> We have only one GGTT for all IOV functions, with each VF having assigned
>> a range of addresses for its use. After migration, a VF can receive a
>> different range of addresses than it had initially.
>>
>> This implements shifting GGTT addresses within drm_mm nodes, so that
>> VMAs stay valid after migration. This will make the driver use new
>> addresses when accessing GGTT from the moment the shifting ends.
>>
>> By taking the ggtt->lock for the period of VMA fixups, this change
>> also adds constraint on that mutex. Any locks used during the recovery
>> cannot ever wait for hardware response - because after migration,
>> the hardware will not do anything until fixups are finished.
>>
>> v2: Moved some functs to xe_ggtt.c; moved shift computation to just
>>    after querying; improved documentation; switched some warns to asserts;
>>    skipping fixups when GGTT shift eq 0; iterating through tiles (Michal)
>> v3: Updated kerneldocs, removed unused funct, properly allocate
>>    balloning nodes if non existent
>> v4: Re-used ballooning functions from VF init, used bool in place of
>>    standard error codes
>> v5: Renamed one function
>> v6: Subject tag change, several kerneldocs updated, some functions
>>    renamed, some moved, added several asserts, shuffled declarations
>>    of variables, revealed more detail in high level functions
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ggtt.c              | 39 ++++++++++
>>   drivers/gpu/drm/xe/xe_ggtt.h              |  1 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 93 +++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 +
>>   drivers/gpu/drm/xe/xe_sriov_vf.c          | 22 ++++++
>>   6 files changed, 159 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 769a8dc9be6e..ab6717671542 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -484,6 +484,45 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
>>   	drm_mm_remove_node(&node->base);
>>   }
>>   
>> +/**
>> + * xe_ggtt_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.
>> + * @ggtt: the &xe_ggtt struct instance
>> + * @shift: change to the location of area provisioned for current VF
>> + *
>> + * This function moves all nodes from the GGTT VM, to a temp list. These nodes are expected
>> + * to represent allocations in range formerly assigned to current VF, before the range changed.
>> + * When the GGTT VM is completely clear of any nodes, they are re-added with shifted offsets.
>> + *
>> + * The function has no ability of failing - because it shifts existing nodes, without
>> + * any additional processing. If the nodes were successfully existing at the old address,
>> + * they will do the same at the new one. A fail inside this function would indicate that> + * the list of nodes was either already damaged, or that the shift
> brings the address ramge
>
> typo
right
>> + * outside of valid bounds. Both cases justify an assert rather than error code.
>> + */
>> +void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift)
> xe_ggtt_shift_nodes_locked() ?
will rename
>> +{
> 	struct xe_tile *tile __maybe_unused = ggtt->tile;
  ok
>> +	struct drm_mm_node *node, *tmpn;
>> +	LIST_HEAD(temp_list_head);
>> +	int err;
>> +
>> +	lockdep_assert_held(&ggtt->lock);
>> +
> what about doing early exit here if shift is 0?
>
> 	if (!shift)
> 		return;
>
> your asserts below will be simpler
I don't see how this would make the asserts simpler. I see this as just 
extra 2 or 3 lines with no effect on functionality.
>> +	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
> btw, shouldn't we have asserts here instead?
our intention is not to verify the previous list of nodes, but the new one.
>> +		drm_mm_remove_node(node);
>> +		list_add(&node->node_list, &temp_list_head);
>> +	}
>> +
>> +	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
>> +		xe_tile_assert(ggtt->tile, shift >= 0 || node->start >= (u64)(-shift));
> shouldn't this be:
>
> xe_tile_assert(tile, node->start + shift >= xe_wopcm_size(xe));
> xe_tile_assert(tile, node->start + node->size + shift <
> 		ggtt->size - xe_wopcm_size(xe));

that's not equivalent, as addition could lead to overflow. This way 
we're ignoring overflow, and accepting the shift if only the wrapped 
value falls into proper range.

but - while it's less useful, it's also a lot cleaner looking and has 
lower chance of getting misinterpreted later. so, will change.

> or maybe better introduce:
>
> xe_ggtt_assert_fit(ggtt, start, size)
> {
> 	xe_tile_assert(tile, start >= wopcm);
> 	xe_tile_assert(tile, start + size < ggtt->size - wopcm);
> }
>
> and then:
>
> 	xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);
This make it completely impossible to detect overflow. But, will do.
>> +		xe_tile_assert(ggtt->tile, shift <= 0 || node->start + node->size <
>> +			       node->start + node->size + (u64)shift);
>> +		list_del(&node->node_list);
>> +		node->start += shift;
>> +		err = drm_mm_reserve_node(&ggtt->mm, node);
>> +		xe_tile_assert(ggtt->tile, !err);
>> +	}
>> +}
>> +
>>   /**
>>    * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
>>    * @node: the &xe_ggtt_node to be inserted
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>> index 27e7d67de004..eb39023c4e1b 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>> @@ -18,6 +18,7 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>>   int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
>>   				u64 start, u64 size);
>>   void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
>> +void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift);
>>   
>>   int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
>>   int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index c3ca33725161..50b0c3b7be8c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -415,12 +415,20 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>   	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>>   				start, start + size - 1, size / SZ_1K);
>>   
>> +	config->ggtt_shift = start - (s64)config->ggtt_base;
>>   	config->ggtt_base = start;
>>   	config->ggtt_size = size;
>>   
>>   	return config->ggtt_size ? 0 : -ENODATA;
>>   }
>>   
>> +s32 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
> public functions are required to have kernel-doc
ok
>> +{
>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>> +
>> +	return config->ggtt_shift;
>> +}
>> +
>>   static int vf_get_lmem_info(struct xe_gt *gt)
>>   {
>>   	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>> @@ -809,6 +817,91 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
>>   	return err;
>>   }
>>   
>> +/**
>> + * DOC: GGTT nodes shifting during VF post-migration recovery
>> + *
>> + * The first fixup applied to the VF KMD structures as part of post-migration
>> + * recovery is shifting nodes within xe_ggtt instance. The nodes are moved
>> + * from range previously assigned to this VF, into newly provisioned area.
>> + * The chanes include balloons, which are resized accordingly.
> typo
ok
>> + *
>> + * The balloon nodes are there to eliminate unavailable ranges from use: one
>> + * reserves the GGTT area below the range for current VF, and another one
>> + * reserves area above.
>> + *
>> + * Below is a GGTT layout of example VF, with a certain address range assigned to
>> + * said VF, and inaccessible areas above and below:
>> + *
>> + *  0                                                                        4GiB
>> + *  |<--------------------------- Total GGTT size ----------------------------->|
>> + *      WOPCM                                                         GUC_TOP
>> + *      |<-------------- Area mappable by xe_ggtt instance ---------------->|
>> + *
>> + *  +---+---------------------------------+----------+----------------------+---+
>> + *  |\\\|/////////////////////////////////|  VF mem  |//////////////////////|\\\|
>> + *  +---+---------------------------------+----------+----------------------+---+
>> + *
>> + * Hardware enforced access rules before migration:
>> + *
>> + *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
>> + *
>> + * GGTT nodes used for tracking allocations:
>> + *
>> + *     |<----------- balloon ------------>|<- nodes->|<----- balloon ------>|
>> + *
>> + * After the migration, GGTT area assigned to the VF might have shifted, either
>> + * to lower or to higher address. But we expect the total size and extra areas to
>> + * be identical, as migration can only happen between matching platforms.
>> + * Below is an example of GGTT layout of the VF after migration. Content of the
>> + * GGTT for VF has been moved to a new area, and we receive its address from GuC:
>> + *
>> + *  +---+----------------------+----------+---------------------------------+---+
>> + *  |\\\|//////////////////////|  VF mem  |/////////////////////////////////|\\\|
>> + *  +---+----------------------+----------+---------------------------------+---+
>> + *
>> + * Hardware enforced access rules after migration:
>> + *
>> + *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for VF ------->|
>> + *
>> + * So the VF has a new slice of GGTT assigned, and during migration process, the
>> + * memory content was copied to that new area. But the drm_mm nodes within xe kmd
>> + * are still tracking allocations using the old addresses. The nodes within VF
>> + * owned area have to be shifted, and balloon nodes need to be resized to
>> + * properly mask out areas not owned by the VF.
>> + *
>> + * Fixed drm_mm nodes used for tracking allocations:
>> + *
>> + *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
>> + *
>> + * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
>> + * overlap; but our node shifting will fix addresses properly regardless.
>> + */
>> +
>> +/**
>> + * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
>> + * @gt: the &xe_gt struct instance
>> + * @ggtt_shift: the shift value
>> + *
>> + * Since Global GTT is not virtualized, each VF has an assigned range
>> + * within the global space. This range might have changed during migration,
>> + * which requires all memory addresses pointing to GGTT to be shifted.
>> + */
>> +void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 ggtt_shift)
>> +{
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
>> +
>> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>> +
>> +	mutex_lock(&ggtt->lock);
>> +	if (ggtt_shift) {
> early exit before taking a lock?
This whole condition is pointless and brings no benefit. Will remove.
>> +		xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
>> +		xe_ggtt_shift_nodes(ggtt, ggtt_shift);
>> +		xe_gt_sriov_vf_balloon_ggtt_locked(gt);
>> +	}
>> +	mutex_unlock(&ggtt->lock);
>> +}
>> +
>>   /**
>>    * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration recovery,
>>    *   or just mark that a GuC is ready for it.
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index d717deb8af91..904a600063e6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -20,6 +20,8 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
>> +s32 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
>> +void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 ggtt_shift);
>>   int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> index a57f13b5afcd..5ccbdf8d08b6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> @@ -40,6 +40,8 @@ struct xe_gt_sriov_vf_selfconfig {
>>   	u64 ggtt_base;
>>   	/** @ggtt_size: assigned size of the GGTT region. */
>>   	u64 ggtt_size;
>> +	/** @ggtt_shift: difference in ggtt_base on last migration */
>> +	s64 ggtt_shift;
>>   	/** @lmem_size: assigned size of the LMEM. */
>>   	u64 lmem_size;
>>   	/** @num_ctxs: assigned number of GuC submission context IDs. */
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index c1275e64aa9c..e70f1ceabbb3 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -7,6 +7,7 @@
>>   
>>   #include "xe_assert.h"
>>   #include "xe_device.h"
>> +#include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_pm.h"
>> @@ -170,6 +171,25 @@ static bool vf_post_migration_imminent(struct xe_device *xe)
>>   	work_pending(&xe->sriov.vf.migration.worker);
>>   }
>>   
>> +static bool vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
> nit: the "fixup" word in the function name here, which means "shift"
> here, slightly conflicts with the "fixup" in the steps we plan to do
> later, where we actually will do some "fixup" due to shifted GGTT

The shifting of nodes is not a pre-fixup part, it is already a fixup. 
The xe_ggtt requires fixups.

Whether subsequent fixups will use already fixed xe_ggtt or apply the 
shift directly, it just an implementation decision.

> so maybe:
>
> s/vf_post_migration_fixup_ggtt_nodes/vf_post_migration_shift_ggtt_nodes
> s/xe_gt_sriov_vf_fixup_ggtt_nodes/xe_gt_sriov_vf_shift_ggtt_nodes
>
> but likely you will resist like always ...

True, I will always resist changes which go against some general concepts.

In this case, we have post-migration recovery. The purpose of 
post-migration recovery is - by arch document - to do fixups. One of the 
fixups is shifting drm_mm nodes wrapped with xe_ggtt.

So the order of detail is: recovery [contains]-> fixups [contains]-> 
shifting. Naming of functions should correspond to this order.

With that, `vf_post_migration_fixup_ggtt_nodes()` is the name best 
representing both what is being done, and the architectural concept.

For what is called within - currently 
`xe_gt_sriov_vf_fixup_ggtt_nodes()` - that function is doing the same 
thing just on different level of objects, so the name should use the 
same wording.

Especially after, due to the review changes, it now consists of 3 steps: 
deballoon, shift nodes, re-balloon. These 3 steps can be nicely called 
fixing up ggtt nodes.

-Tomasz

>> +{
>> +	bool need_fixups = false;
>> +	struct xe_tile *tile;
>> +	unsigned int id;
>> +
>> +	for_each_tile(tile, xe, id) {
>> +		struct xe_gt *gt = tile->primary_gt;
>> +		s64 shift;
>> +
>> +		shift = xe_gt_sriov_vf_ggtt_shift(gt);
>> +		if (shift) {
>> +			need_fixups = true;
>> +			xe_gt_sriov_vf_fixup_ggtt_nodes(gt, shift);
>> +		}
>> +	}
>> +	return need_fixups;
>> +}
>> +
>>   /*
>>    * Notify all GuCs about resource fixups apply finished.
>>    */
>> @@ -191,6 +211,7 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
>>   
>>   static void vf_post_migration_recovery(struct xe_device *xe)
>>   {
>> +	bool need_fixups;
>>   	int err;
>>   
>>   	drm_dbg(&xe->drm, "migration recovery in progress\n");
>> @@ -201,6 +222,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   	if (unlikely(err))
>>   		goto fail;
>>   
>> +	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>>   	/* FIXME: add the recovery steps */
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
