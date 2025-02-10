Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CA1C0219E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 17:56:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F367810E07E;
	Mon, 10 Feb 2025 17:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kP1Jp0L4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8173A10E07E
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 17:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739210203; x=1770746203;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c3XboRVSV6gPDoVt8+MaIeyBUEuBojoCSQU8v8EvNUw=;
 b=kP1Jp0L4qCh3mb6F0/YnxzO4VDSQeekEBopPQ0ZvU4qy36zxdD3iGw/R
 A+R5KyShaojc3dr3/nAGhjsGGSAXKF0mSXz7VtIYiDhkZzPOAvTJJFj/h
 OXDFRDNd4HiBz/ThZQBcOu95F+sZ1pajdzU2tceXQX9DaS5anjRQAxhVO
 T8x5459uVHhDZRvzJ0ar0sKmEZIQ9/ULpkmmF8UniIc/nWiKayyJoZN9t
 +tYxT6zxHmdLALWuUPGLiAimj578AGanabP3ZqzpFJgqQl/Qx3wFo0QTF
 am+OCaFGcS1FbTjmjGeFWKB9j5do+cC52EKythP2igZPLDCisoCFgevcN w==;
X-CSE-ConnectionGUID: Qk5Q0E04S5OMmkLGebUk5Q==
X-CSE-MsgGUID: gqljA3aKQnOmA0HQ7RdMvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50788864"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="50788864"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 09:56:40 -0800
X-CSE-ConnectionGUID: aiQAluW1QPmof4wNGBzAAA==
X-CSE-MsgGUID: cO3vv/GYQVqrsDSUI/K8Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135524938"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 09:56:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 09:56:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 09:56:39 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 09:56:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3qOl1LeZzfdGbMYBsYQ1zKJZ774zORQqgFEvSD/A41I1vKWpoo74ND7cDQZvk7i8lRbeUK5SYihQEBBmUa+rbl1vafShXZx+g7QY3o/YTKIuizpXJ9IwzGLdSwUFt7Pz2iT7LHLC8gCpp1ChKQn3WtG7emXd0SgoKkGJitQhPgg86ZzD3alvXRwpA1rhq5BoP1mMobRAvYM1r15oUb1ZOIAK807zPAJLRk4jvfjgPZF432U/46yFu5qLL5Ivn6qn6FKhhw+fwMn5W9L21pdSNGrBZXPtzX6R7nvR6nQRKSQbd9WgmqrvaXB37fEhUn/w7GmWoxx304zdnv64k6zWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0q2OXV1OcC0aTjpYsIeV5WA5ov19AF9fkyQpCp0HyOI=;
 b=gpqlUFOwB6HU/jm0W0hGNg87x18ZccV4gS2vaNw7uirz8mstZybuAGXHKGx7RVXTRoTytIHyQ04lVKWe4+p1C8A0rQ1CDQuDkvRinC4Myvvgt9w6atWwwk/3cVsLhvLoz86V1EAowIMZ1VlXSk7gIlxDPdir/ljYQMGRHGoKpIC+0kakGRe14AJubQWalpzFfgh9RoXzc0HSMZYt9CRzypjyJLVQrjAhG8GGrZS3ls7Ea9V8bC50tqjlrASNBKFd9AVdEJisIkNFC0IJ6lKYZaDtKMqQfza4Z9Kslt4au03foxCf3mYLVcGxHe3JphTXUaDdy2iUcVnNMScUTe5fng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Mon, 10 Feb
 2025 17:56:33 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 17:56:33 +0000
Message-ID: <7c0bfb21-ead6-472b-b68d-62eece414472@intel.com>
Date: Mon, 10 Feb 2025 23:26:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] drm/xe: Fix xe_display_fini() calls
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Daniele
 Ceraolo Spurio" <daniele.ceraolospurio@intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
 <20250207221945.2878241-2-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250207221945.2878241-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::9) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ1PR11MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: fd832fde-8e6d-4743-d4ad-08dd49fc4111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWxObVJSd0toeHhCNURZYkp3eWM1SHdFa2NIbERURHhtMHgzYWhGRmthek5J?=
 =?utf-8?B?NU1jQWoyRDU2aGRRMGJXMnZybWI5dXVmVHJOSE51RWxzbWpyQ25DS0FTREMv?=
 =?utf-8?B?T0NMQWE1S3dBMkdZZURKdVVKZEdZZlZVUlRHTFZOaXRYdGRIeTc0TWlmc3NJ?=
 =?utf-8?B?Y24yZE42alhIbE5BMUYxbElNb0ZCdjdSQVl2MlI4cDFLbnN5R21oMHdHOG1Y?=
 =?utf-8?B?bWgybE0rMXc1L0xYaXRhS0tOajBKVnJhOThXR0NxTzd1ejVBdWdsWTR6d1gx?=
 =?utf-8?B?Y1lmVG01OHVlQ1RGeUI2ZmZjU1NJQXp6djBYVW16MDJVNFJQVk05WVhhbVpq?=
 =?utf-8?B?dkNkNXREa2xPSklsYjlCb3NoUlRPZ2NuSmlvVEZHa1VrL1RmQ3kxemhVUDVQ?=
 =?utf-8?B?aGtmUlF5ZlRCaWxRUE5aa0NHZEFZMlNTeG42KzljZnhSM0FSMFlGRnl0T2ZB?=
 =?utf-8?B?eWhWODIrYlVCTmk0ckNSREo1VVhQaWxWUGtKT0NtVEduVUtDY011SDJQVVpp?=
 =?utf-8?B?NUVUazF0QXo2OGZDS0RQZHVRNHltdWVjeTJMVUQ2aGlJR2V5RFZnSUg3a2hS?=
 =?utf-8?B?d05NNThGMHdhUGp0cS93dGJJaDh2eW1nbDdGSUhEMXpnY003bkY4eGdTWUhr?=
 =?utf-8?B?WFNCbnR5VytpVW9qcitySDRVK2RlMkRCaXIydGk0MHZmZFFvVWxHMWJ3aXFH?=
 =?utf-8?B?cTRFU29CV1BpdEZZdjM4Rk91WDFQOVRDMS9mTTFNdVV4bWxTUzBpTDNPcnRj?=
 =?utf-8?B?MjlCK1ZSTXZ5ajB3b1dWS2dUeFZCVVFBR3E5RTE3cVlGR3BnVU4ybVpLSXRi?=
 =?utf-8?B?YjRKUkVxTytYRWxYNmVMR1hBSG1zWCswcGlvVHdCcHJnMW85b3Q1YU51M1pF?=
 =?utf-8?B?YXFITUNuYTJWRyt4TGkyaXNsT1BtdFd4WHpnazZsdzQvejJQdzRtc3VINWph?=
 =?utf-8?B?eTlia01xZElvV1Z6R2Z3NTdyejFDNmVGNzhqVkhHTWVoa2QrSDZqRE92djJD?=
 =?utf-8?B?QXVYYXp6Zzl5UFFxSE8rZU1VSVpPSWtjMTJRYlVPRkhQek16Y1h5RS8wL2dw?=
 =?utf-8?B?S1BCNjdxYmxIcTlwQzB3THEyRlJCV3dYa2FaZExVSXJienRIZ0grcENON3Nl?=
 =?utf-8?B?VUl1clM5NDBiS3RLaUYvUkJkOVFpL291UmRGUVFqMEp1ZDRoNWwxNUdpNkZl?=
 =?utf-8?B?TlJTSllaT2Jrbi85U25JYi9LYTFWSXhOZFdUR1QwVkRkTlJqeUxLelZJU3pB?=
 =?utf-8?B?QnM0c2UrUU5VNW9vUy9MVVV1bDM2VDhhY1UrczExL1F5MmZPK1dDWnh2SWE1?=
 =?utf-8?B?QkFrRW4vU21LcEhBbm1rU1JYcXI2V0hOcXU2UDdMV1VNai9uL0JPbHh6eEdJ?=
 =?utf-8?B?RnkxQ2RYcXdsb2syUk5FUTlQaktqWUdBS2JmYk1mS0UwSnNSRUs0R0ZIU29t?=
 =?utf-8?B?VlNkaCtRS0ZzbkdNOTVzcUU1ZjRjTk80VkVDLzhWTTlBYlBGWTRTWElUQ1Jm?=
 =?utf-8?B?OTVWVlNuT0t5YkpOMm9mZi9FTFR5eC9uTmRJZmNDaEJoL1VDMXJHb1NEUERK?=
 =?utf-8?B?ZmdwUFJwbGlKUmo1OUpmWGZkMlM4c3VycmdOTytCdHFjZEdOejBOM1YzR1NP?=
 =?utf-8?B?QVRwbVFEUXVSSzIxN2NyRjBKQ0h5V1I3OFFpNmQxenB2RkFsbEF1ajV6czB2?=
 =?utf-8?B?dVpGTC9LMHVnZ1ZhQkVzdXlTc0JkOGRDdjJ3T3hwMURNK0cxMEE3ZlMrY2Ja?=
 =?utf-8?B?VDVWOFFLTzlHN3J5bFR6L1BTM3FRNTR2ay93S0Rvc3h2dGFSSGVabFFWdlJs?=
 =?utf-8?B?WWRsMVF3cHg4cXFEaXNuSDRjK1Y2aFFPZXB6RFdIUExGeWR1ODh6SG5WVlFF?=
 =?utf-8?Q?wURyVUV8gsJXI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXFwTjU3RWtrUGw5WktWM2ovTGJjUU9Ja21Vekt6ZTZIc1lxYVUrVExSTHVp?=
 =?utf-8?B?Qk8rUHlkOUQ3VmpmK2wraXdBelhZSENxcU9NR2FzRWRuYXhrZVRrcUtLYkxW?=
 =?utf-8?B?WDJTT3Qyc1hqWVFUb3dtZ1dHdCtwbDZUZlBodTlYaGlhWXh0WVcrTFZvRVhJ?=
 =?utf-8?B?Z3c3L2FyOXNrNjE2UnNZaXF1RWtROEcxdHU2cTc1Z2ZXUlJwMnNiVnNIRlpr?=
 =?utf-8?B?WDB5WEFlYnNPM0pGNmhPVnVnV1pvQ0Fqdk9rSytoSnJTUDFacHZhd2VLS05T?=
 =?utf-8?B?dFJqSXptWnQ5czlCSTF1bThNK1pBdWRWUE1xL2NibWZzcTN3RWtDbVBzRFZN?=
 =?utf-8?B?ZGdTVkJuem5WVUk0djBLT3V1RXFuQjBTM3lyT1l4VDNNMWRhRGtYSTI5U280?=
 =?utf-8?B?YkZyamJubEZCOTNIck1XM05xNVhyT0UwL1c1d2xjZk9IRzZFcEhPU1JEK3NP?=
 =?utf-8?B?RWRYcnl4SG9wTWJKMllDVUM1WEVQb0ltRFZKZmJzTjlDdG8zbmUvcjhHRVVm?=
 =?utf-8?B?ZXZSaG1Nejk1bjBxL3RYeHNuYnRlTHE2YS9LV1VlclNRQzBQTlBJSGdCVlpC?=
 =?utf-8?B?MzgwRUhoZUtGUXlNZ1VQU1hiMzNtUVE5UC9DNlFJaW1RUTZVYXBScjA3UFFM?=
 =?utf-8?B?N2IxYnJ5UVJXSmFaTDBLY3dBU0M2OGxSMmJxdzlTdmdteGs5WjlvbEdJNkI2?=
 =?utf-8?B?RUJGdjdsL296SXBoUlFFeFZ1cytJclN5cjhLaGpKb0o4S1BHY2dJQkNEamNt?=
 =?utf-8?B?Mkg3KzR1Y2N0MnFteEVDcUpOR1pmOVZ3ZHgyRHpsUnZvNGlKTWxMRS9kMURj?=
 =?utf-8?B?MC8xb05xUFNidnhsc0haUnFJUWtBcWtzU0cxVFh2R210WFJJc1hoWHlBQ2VS?=
 =?utf-8?B?bUZnSks2SmlmdCtmQm8rMXJQOTB2MXc1SHE2ZE5jVmdiM2VINmtEUGQ1MWlI?=
 =?utf-8?B?eXJLRithTVBENVJtZzVEb3IvQUZlYWhrKzFCQXNOZmJtRXF1NjhpY25xbWho?=
 =?utf-8?B?TTVkVG5kOEFhRlR3Z1VzcDVqd0phTm5NK2JFdnVreEtaa21GTzhqMHpMbVM1?=
 =?utf-8?B?ZmtaVFN6NEt5aXZrMGx6dDEwMUtNc09nU2VaRkFLN2RkY2JqVE8xRlhWSmhF?=
 =?utf-8?B?eHZKSldYS0RKbTRvMHMxYzBEWUhueDRwL2xpOFEwU2VzOTdxbXpuUHIvWTJj?=
 =?utf-8?B?b09DdVErei9pREFOTWY3eU9VRlg4MGhuMzNXRXQzNTB0Y1BBMktQcVozRy91?=
 =?utf-8?B?QW9Da0lCVUtObm55c0JwU1Y2clAwZURObmYzaFVRektILzcwU3ZJRlB5Tk1O?=
 =?utf-8?B?V2FkL29pYUZ0LzhRZHNoR2o0ZVV2a2t5NGJOemMrendtaUw0UmN3dUdmZi9X?=
 =?utf-8?B?cVdHNTcveHlIdmFOSkhRMEEzK3ZteDBFcDlWMktJK3RWU2ZSUHBGTW45WkZy?=
 =?utf-8?B?eHNhNDlCZTBtSURXdHJhUE5MRmpEY1ljbjNKV3lZMUhkVkFrMnlqNnUxRFkv?=
 =?utf-8?B?MkpBMzZWNStIajZWUmtyT1g5dWQxM1NaWWhGUi9malJibzRjWTlydW9PaHVF?=
 =?utf-8?B?RE1JS2VFYUcyMTBNcUJadGl5UTdUYmp0SmpPc1hVcFgxeTBySnUyZ0IrWFNR?=
 =?utf-8?B?ZTBwbG50TmRaa25TT0lyeE9FczJETlVMdUE1QzU3MTVvVW1TOUYya25JYTdx?=
 =?utf-8?B?VUJOSUYzd215cElmckJoYm14N0VrQXVRRWFHWERnNEgwcTc1aW9WM2JveFY2?=
 =?utf-8?B?ZWkyaUpIdFFpSUtudHVKOXdPczRlcWNObHJJREc3aFN2Y2xZZlBuUmZJVEtm?=
 =?utf-8?B?YVRWZU5zSk9OU1ljemNUOTlmSS9UODJyalUvSkNPK21VWE1HbGR2TTJZclhm?=
 =?utf-8?B?eWp5YVoydkx4TGFKdnE0K2tpYVJCanhKcDlweS8wWVh0ODZBR3k4bWNoRUMx?=
 =?utf-8?B?NmFYTStVOEIxMGpwYUJmZEdFTVlCS3JtUjZGVXRYWHJyczFHS0ZqNUo2aGN3?=
 =?utf-8?B?eldDZzVjQ2pjNFRGZWp5blN4d1daL283d3oxejdMZVVIY0JXUjYzLzQ3VTlF?=
 =?utf-8?B?azBTT2xvcWM5bjlWVE1vdUV1QlZOdmtZd3d1YWdpWm1NN2xIcG1pSjJrejlN?=
 =?utf-8?B?VFZKSEJxcFBBUHRxbEIxNmNLTWVFK0diY3dLNUpsUDdrSS9PR2U4dGJ6OXFR?=
 =?utf-8?Q?rM+9Cd2CuYU3fSkEe4WNPb8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd832fde-8e6d-4743-d4ad-08dd49fc4111
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 17:56:33.2171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gDLDr6+IardEv5PBvhALyWTt3OwlN2R1miGVK8AVFu2XtX+OG/zpQ7+5d2xUKWIsCSa59E+IDy8+q8PAHNp7RQO1L/xMfKRiuCf2tRTuZW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6129
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



On 08-02-2025 03:49, Lucas De Marchi wrote:
> xe_display_fini() undoes things from xe_display_init() (technically from
> intel_display_driver_probe()). Those `goto err` in xe_device_probe()
> were wrong and being accumulated over time.
> 
> Commit 65e366ace5ee ("drm/xe/display: Use a single early init call for
> display") made it easier to fix now that we don't have xe_display_* init
> calls spread on xe_device_probe(). Change xe_display_init() to use
> devm_add_action_or_reset() that will finalize display in the right
> order.
> 
> While at it, also add a newline and comment about calling
> xe_driver_flr_fini.
> 
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/display/xe_display.c | 22 ++++++++++++----------
>   drivers/gpu/drm/xe/display/xe_display.h |  2 --
>   drivers/gpu/drm/xe/xe_device.c          | 21 +++++++++++----------
>   3 files changed, 23 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 651799c946ace..302f533af037d 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -161,27 +161,29 @@ int xe_display_init_early(struct xe_device *xe)
>   	return err;
>   }
>   
> -int xe_display_init(struct xe_device *xe)
> +static void xe_display_fini(void *arg)
>   {
> +	struct xe_device *xe = arg;
>   	struct intel_display *display = &xe->display;
>   
> -	if (!xe->info.probe_display)
> -		return 0;
> -
> -	return intel_display_driver_probe(display);
> +	intel_hpd_poll_fini(xe);
> +	intel_hdcp_component_fini(display);
> +	intel_audio_deinit(display);
>   }
>   
> -void xe_display_fini(struct xe_device *xe)
> +int xe_display_init(struct xe_device *xe)
>   {
>   	struct intel_display *display = &xe->display;
> +	int err;
>   
>   	if (!xe->info.probe_display)
> -		return;
> +		return 0;
>   
> -	intel_hpd_poll_fini(xe);
> +	err = intel_display_driver_probe(display);
> +	if (err)
> +		return err;
>   
> -	intel_hdcp_component_fini(display);
> -	intel_audio_deinit(display);
> +	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini, xe);
>   }
>   
>   void xe_display_register(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
> index e2a99624f7064..685dc74402fb8 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -22,7 +22,6 @@ int xe_display_probe(struct xe_device *xe);
>   
>   int xe_display_init_early(struct xe_device *xe);
>   int xe_display_init(struct xe_device *xe);
> -void xe_display_fini(struct xe_device *xe);
>   
>   void xe_display_register(struct xe_device *xe);
>   void xe_display_unregister(struct xe_device *xe);
> @@ -54,7 +53,6 @@ static inline int xe_display_probe(struct xe_device *xe) { return 0; }
>   
>   static inline int xe_display_init_early(struct xe_device *xe) { return 0; }
>   static inline int xe_display_init(struct xe_device *xe) { return 0; }
> -static inline void xe_display_fini(struct xe_device *xe) {}
>   
>   static inline void xe_display_register(struct xe_device *xe) {}
>   static inline void xe_display_unregister(struct xe_device *xe) {}
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 36d7ffb3b4d90..ac3e344fe04ec 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -735,6 +735,7 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>   			"Flat CCS has been disabled in bios, May lead to performance impact");
>   
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
>   	return 0;
>   }
>   
> @@ -803,22 +804,26 @@ int xe_device_probe(struct xe_device *xe)
>   	err = xe_devcoredump_init(xe);
>   	if (err)
>   		return err;
> +
> +	/*
> +	 * From here on, if a step fails, make sure a Driver-FLR is triggereed
> +	 */
>   	err = devm_add_action_or_reset(xe->drm.dev, xe_driver_flr_fini, xe);
>   	if (err)
>   		return err;
>   
>   	err = probe_has_flat_ccs(xe);
>   	if (err)
> -		goto err;
> +		return err;
>   
>   	err = xe_vram_probe(xe);
>   	if (err)
> -		goto err;
> +		return err;
>   
>   	for_each_tile(tile, xe, id) {
>   		err = xe_tile_init_noalloc(tile);
>   		if (err)
> -			goto err;
> +			return err;
>   	}
>   
>   	/* Allocate and map stolen after potential VRAM resize */
> @@ -832,17 +837,17 @@ int xe_device_probe(struct xe_device *xe)
>   	 */
>   	err = xe_display_init_early(xe);
>   	if (err)
> -		goto err;
> +		return err;

Currently, xe_oa_fini and xe_heci_gsc_fini won't be called in case of an 
error. This is incomplete without also moving xe_oa_fini and 
xe_heci_gsc_fini under devm_add_action_or_reset.


>   
>   	for_each_tile(tile, xe, id) {
>   		err = xe_tile_init(tile);
>   		if (err)
> -			goto err;
> +			return err;
>   	}
>   
>   	err = xe_irq_install(xe);
>   	if (err)
> -		goto err;
> +		return err;
>   
>   	for_each_gt(gt, xe, id) {
>   		last_gt = id;
> @@ -902,8 +907,6 @@ int xe_device_probe(struct xe_device *xe)
>   			break;
>   	}
>   
> -err:
> -	xe_display_fini(xe);
>   	return err;
>   }
>   
> @@ -924,8 +927,6 @@ void xe_device_remove(struct xe_device *xe)
>   
>   	xe_device_remove_display(xe);
>   
> -	xe_display_fini(xe);
> -
>   	xe_oa_fini(xe);
>   
>   	xe_heci_gsc_fini(xe);

