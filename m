Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037BEC27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 09:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B7810E882;
	Thu, 20 Jun 2024 09:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d0C073cl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6090F10E882
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 09:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718875208; x=1750411208;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GB1nfp58h97YgXBxUQUm5WDrJvB2Vl5vnTbovY4YvdQ=;
 b=d0C073clPFSaL0DTR373RrutMwvVQtqjHJDE4NGdttNT/C7fXvmEZBiX
 4qekiWasUt6dFvhvTCDjaw2Ri2T27scNYw0lNZCBKfOyBoLABTpgSA9ey
 cqz5RuwzjwZLoBDy+B4zyPr3GkySr0qqhKHMJB3cDGidJOmOLauYOYlir
 hoh+NumuAAgejYdUhxc5IcHnv9jZu/0LLZUTrK48AEHejkp9nkxOsr2rW
 lwux9oyuDFMD6fVlmCtBo48TBPL4yjBPU/SAeUrukZXvFrlSSvTpiJOCI
 +dbIESZXnNCorh42LrMi1nEXYyQq5sJb8N5NqLNIa4peJOn3Zcxc4R+ft A==;
X-CSE-ConnectionGUID: avogO3+bSeeHLofelivsXw==
X-CSE-MsgGUID: CnmIVI3+Q0Ct64qEVDG5qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26429348"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="26429348"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 02:20:07 -0700
X-CSE-ConnectionGUID: 627lilraQxSbwQzAXmIuMQ==
X-CSE-MsgGUID: 3CFDdcsSRAGO3mG5xL3NIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="46699059"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 02:20:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 02:20:06 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 02:20:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 02:20:05 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 02:20:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhZjC8kCVOt/F3uFBzAjswZDKpy6nU2vhdkIeY0OZmQ/5aFLEGNlrCUP2l6/0s9aNubLvPasLIl4j7GKjkRqcqESimPTCl/JzGOjDJkaJwkadmKCVR+SIrpMPFKVwG6z7CN2s+48Rqazy5hvg1ed1qlqK51gNB9QAPh+eREW/YRHDJQhl20CxAP3jpFxAbjpEB7WiYATsPv4xfU3i5fS1TpOOUAoIZlPX9hpuche1xV6VXtFsVRLkatnrG5ZiMj4fKkj9BNxnN1jkx19ope2mPRZoJzH0MJucRasSXO9ufEc5q11Q86u0ChachVvxJSSDedlXK10mTdD2eAmjRLlVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4odFaSYOiKjsXE/slRnjmZsXmpasVfRBQLWrGLCnqJE=;
 b=QRZrIsD9EOKWVa1RICMGnu7E6dA8Yk+QuVm7m5bCyk6SlFPuFmFB1kKYM/MdNWO0GpIoDWCRLysmy763UJpUgEXSAOcOUefKY1baKIL85eWLjcxqeuoTOFpIL5MqmrsYIOEX129U9iP2WxXUpGljRd8oLSgU1yNPb5Yvym62sASnF85vNOAmuB1CU6O+CLVMxOpHU6g+jwxkEjRwM3diChhZgesLRmvyCzBl6SP+wZxXuctyH0iVJj8Al1R2I69DX+f6+yvCNxmh3RFx9oqp4utyURjaJH+Z/rQsnBdMjRlU5fUuI1iqzLJoulbMTkYgYaQpvntfMX05dqEfBWDUIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW3PR11MB4636.namprd11.prod.outlook.com (2603:10b6:303:5a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 09:20:04 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 09:20:03 +0000
Date: Thu, 20 Jun 2024 11:20:00 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/9] drm/xe/vf: Don't run any save-restore RTP actions if
 VF
Message-ID: <20240620092000.uxsc5rxl5caon6jh@intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <20240619214557.905-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240619214557.905-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU7P191CA0009.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW3PR11MB4636:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca1e4bd-6f31-404a-9584-08dc910a2b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFhkU016TjlrOERsTlhQNGU3bVJyZ25VYWpEODZ4K3dlaXFYS1JmK20zQnpW?=
 =?utf-8?B?eU9NVnE1Y1NKRkFud1hYVThzQWswWHozUEU5bHkrQjJ2NkNINm5LOFl0VGZ5?=
 =?utf-8?B?c05sSVZjWlQ2aC94WkxtZWJ3eVdBRkFjd1hxdkwyTS8vU0o2cXNkQ084L2xi?=
 =?utf-8?B?MFU3dXQvWFVHTUpxU2kyRUFzVzJRbDc3WW5kSHlZOW9XUThBZ2lGSjV0dFYy?=
 =?utf-8?B?RmJTdWFjekExdGNWdDJPSWI2b2RwcUt2dmdSMkJmNE9sUzNCVm9RMTk3cmFF?=
 =?utf-8?B?cnM2ckltYUh4U2pROTA3ZDg1Z0ZJbWEzYVdDRUhIc1ZIemZiT2FhRkdjeTVw?=
 =?utf-8?B?Zkp5S1FQZFNXR2tRbHRnTEpaUm0zTHkvR3VHQUIzOGhnVzdIU1dMSG9MWk9s?=
 =?utf-8?B?eUJqZHE2emRrUVp2WjViVGVZalBzd2tkc1NoUUdsaHlZQVNqenF0MzJIZ0p0?=
 =?utf-8?B?N0xoT0grZ280Uko5RGxTcFR6MGZpaTRhbkxzREo0cnJScmFreE9HSEtEanZQ?=
 =?utf-8?B?NzhDS0I4Q0k5NmVobDlkSzIxUnBwdm43dkZGdWNuS0tPWGZRdDI1MnJlMEov?=
 =?utf-8?B?YVNzWGdLRkREZ3FOaHZENm16UENOaTNNdDF0aG9YZG5NZU43QURQSVhYTDRW?=
 =?utf-8?B?L3BNU2V3dWdMU1dVN2cxa3BzQXRpK3hEa1ZoTmwzUzVqOFhnYUlrbFpvNEdq?=
 =?utf-8?B?Q09yVlJXdGViay9jODZZQjBmZCtXb0xLZzNmOWJjNnBJR2I5UFQ4R0R6bGcz?=
 =?utf-8?B?YmdjQTJZUWFhUU9CVXI4MUxtaTV2bjk2RTNpaFdEL2JuYlQ4RElRbVREQWlq?=
 =?utf-8?B?V2NrcGNiVXdzTUZhc1kzSisvSUlacW1laE1wL0JHQXZqV0NQNlEvUm5xSUo5?=
 =?utf-8?B?WHJWclcrRTR4RWtDdHlQZGRwM0daS0RCRXNia3J2T2dreDZIcjVBc0t4d3hh?=
 =?utf-8?B?ckNyU1l0b3Z1YUFDZG5rUTR0c00zdGV3YnFBS0Z2WGx0N1J5SVJMZGhqNlZF?=
 =?utf-8?B?RmpxTDdFekhVWXA4ekF4cUlQYXJLYkVEMVlTQ1BUTXM4R1BsZ2txenBXdnZE?=
 =?utf-8?B?UnhIT1hOWTArdFoycHVtWUZQK2xNeWdXaDBxZTZGajZTRnp0UlIyN1Y5ZnNT?=
 =?utf-8?B?Q01meng3YUpxdit2RHQ0NytwUHVtK3lEbDVwQWJJR2dtQkV4b0J3b3JCcW9l?=
 =?utf-8?B?Ums4REpvSWhxRVZRNUJ3d2NJVlZ0ZUhTbXIreStkVitrWG4reGZDckI4am1J?=
 =?utf-8?B?NngydTdLZUNQbmtUV1l6am5pTWtTZTJMSWRVbEdlVzVWZHZhZE5sK3dXcFd4?=
 =?utf-8?B?VEszQnN6SXp3amg4akU0NDlwdW5xb1g0R0xYakVEQWlzbTJsMXRWb1d4T3l1?=
 =?utf-8?B?WEZqanBjUGJSWGE5eTVTakNXYTF0OHQ1VC85ZzFGMWwwT0kwS2xoc2owV0d2?=
 =?utf-8?B?SFk0QVY2ZHpPZWJ0bWlqUU1UdzQrZjNQZ3p5NHJqRFBMSlYwUUEzdmFxSHhE?=
 =?utf-8?B?Z1kwbEhZYTVxTGdwR0JidnF2NDRnL2tzN1g3bkxDdHBCQjdMaHp4TWlabWRx?=
 =?utf-8?B?ZnJyNFAyNkIvZEYwa0JISm5HS3duMXQ2WFZQdVJFaEplSnB1QTVFTUx3ejY5?=
 =?utf-8?B?ekN3YnNIbDlubFNWbEFwNnJxUDl3eE4xSUpjQjdnc0kzTFhPS2Q1MW41b09o?=
 =?utf-8?B?MFZOSFhwbjNZUzRITjc5a3hqMmVJalNITWtvMXNIS0V2UDI2L1RCN2lFN3FO?=
 =?utf-8?Q?TBSzuXr60Auiw6jWoUJynU34bB2RVgLJOkULj+Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2hmcnlTZytCek5ZV3ZPOVlMS0orWVFjMXBmM3FyNlgrNFdnWDJzZ1ZjMDlF?=
 =?utf-8?B?NjcwSGk5ZVY0a0ZoV2hUUHBhcmtPOUxQNDh3R25Md3VDMmxyUm00ODRoeXJC?=
 =?utf-8?B?SlExZEJPMEZZTTI3OXlISVAwRjVlSVhhUzFtcW0wNUZNbmdJR3pPUElHUzNs?=
 =?utf-8?B?bThPOEQ1TWdPQ3BkRmg1aHZ6QU5OaldaMEFjaDlTMk0vQ01YVXJrM2d2Qndw?=
 =?utf-8?B?bU5yL1VXcFI2SGVVbmVrVjZSdG1vM25DZU1udVErN3VQTk1oRnVTVlU3Vyt0?=
 =?utf-8?B?ZDF6OHJHeFFoa1V3Q0UvaWsrbFdmbWtYb1pJOEZXdXJnbys2dzlHYzhtUzM1?=
 =?utf-8?B?dTdyQ3BMMXVFZGc1czBCNktvcE9TQzcvSmRsMTBLMFFvY1NhMFN1cmZSY3Uw?=
 =?utf-8?B?YTdPMmx3SnpXazlGY2taODRhS29zT1BFbkMwS0dDS0kzQkZYS2k0dFZhWDBK?=
 =?utf-8?B?NDNrazFVQ2VRV1B4V1BVMDJ4UVg0dVhSUlNDZ0wybHVLUTV5cmRyTHNxNytt?=
 =?utf-8?B?MzVzejZCWnB1Vy92RlRraE5iQkcvSlhXUjNwNjdoaEd1dG9HTkxxRm1WVExP?=
 =?utf-8?B?Yzk2aHQvMzg5SXdqVW1zWVdKMU81MUpseFdraEhVRm9ZbTNkdFF2bmZWZ0lr?=
 =?utf-8?B?djVnNkZBQ3V3bUlaMWdwRDgwWXdHS0dGMlFjNmNJdHRVeWZiWkJmVjN5cTZL?=
 =?utf-8?B?Y3BUWXdmd1NqMlhTMVgxOG9mTkU5SGZ2MkJvU3VCMndoTzdCMEpsWFlJMW9p?=
 =?utf-8?B?MngveTcrTGZDUzdDZ0xUbXRwbXUyTVJrdmZFYlV1Y3RGa1A3aCtjRGJsVXpq?=
 =?utf-8?B?Y0JjSDcwamE4dlU5aUlBQTY2b3hWdGVZbCs4Qndjd09rNnRlTVZ2N204SnVh?=
 =?utf-8?B?MDRwUmJCSGRydU1qUWduZXkwVjlDeEYrcE03VEw1WnBscjhFM2Fxcmgzd3BO?=
 =?utf-8?B?VFZjNkNQOHdxbk9Xa1F0M1EyVTR6eitlaWlQWmFzZTVhanBsU3FzVUhrY0s2?=
 =?utf-8?B?MCtTT3FKamhsN2FqbWYvMkN2c0NZNGVqYk9GTHovYTlUVmY3ajkyNnpCVFhk?=
 =?utf-8?B?MlRvOG9Sbk9KV2NYdi8yUy9nVktaU2MzQ1U5RExDUUhKRStIM2xESTVrZC9a?=
 =?utf-8?B?MWcrcjRaQTE0WUJtQ09NZjBOZUZQS3pyVDR6WlV2cmlGZTVzOEZwaUlZWlVD?=
 =?utf-8?B?cnhGaWYyazA2T1RuZ1E2cGh3Y21BU1YydFliNkxoOEEydzgxRWVRWDc3SnhO?=
 =?utf-8?B?Um9uczlEdWJxbzI2bHlqQXpxeFFURzNkR01YcmpuQUZ2cmVKUWtvSjZTUDNM?=
 =?utf-8?B?YU53aWQ3dUJhM0VBSENFTVpFQk1FY1l4UHF6ZWQxU2NHMk5hREZTcEx2WE41?=
 =?utf-8?B?cmFHR2I5T0I2dVZiMEdwZE04VjBtZnNJaTlTdGNsWFNnWGRXNDRTajhuWmNJ?=
 =?utf-8?B?K0VSTWVVNmtsUkd6UGZnaGNjSjh5Kzd5QXVSMWVyUG5xRGNEanJ5THl4eHdS?=
 =?utf-8?B?Qnc3eklGNUdTdzZNRXZsMzJwRlBya1liV0VwVUJXcU1iTUcvbGlTZTU3Ujcw?=
 =?utf-8?B?ZjFWYUNtZ3pjQnhGelhIVWNsNVI3V2xIWm1RcGJPdjdqeGx4UEQ1TGQxMVd5?=
 =?utf-8?B?Mk1RQnVYUVZlbzVZWTRPVzhTbU9iYlZ6Q2lqc3h1cjM1Tk9pNWthcTg4UGtE?=
 =?utf-8?B?K2lXOWlNenFFemtEYkM3TjVrSlBtanRySnhyR0RFcWYwV2FIb1BGSzc0TG5l?=
 =?utf-8?B?R050bS9SbUliNVFLbVNDRWZoSEM5MFNXRk10UW1Ga1U3MFNOTWcwZm5JeVN6?=
 =?utf-8?B?VkF2b29uT2RVekMwUjlDR1ZES0pGMjZaV1N6SHA1VzNsaE00L1Y2RFl3aWNP?=
 =?utf-8?B?d1JQT25oTWtqUUE0Rkp1QlBXK2pjZU10N0UxTFowdnoyVncwODkyZ3Bxa0VC?=
 =?utf-8?B?RlZVZjk3NjZHL3QzMVpjb05kM1VSNHkxanZuS084UGJ3dkRIZCtXWWg1UGtK?=
 =?utf-8?B?dWNRQm1qSVZOcjZuby80dHZmd29tTTBBOGVxb1JEYWZwMno2Q1FkY0pRaUJj?=
 =?utf-8?B?S0xWRnFycmVZNEZ0WlI0ZTNwRDNFTmwrdXg2Vm8ramFSQnVBRHl3M2lINm9i?=
 =?utf-8?B?RW9EeDA5cUpBVE1BV3g1Y1YwN3h5cVo3YWRVOHdXeUlyVnI0cnpXNURnVXp2?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca1e4bd-6f31-404a-9584-08dc910a2b17
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 09:20:03.9338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1AHtVth8Kf5kq2wyWOkRhRbXYAAlHU8tYmwvH7TkyCy/F54zB75xHp0ZmWBYBR3r4zOCnjrqNeEvKzv7tcGOCWruxguSbBm/cOKYC1b52Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4636
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-cze-19 23:45:50 +0200]:
> There are no RTP save-restore actions applicable for VFs on
> current platforms. If any future platform will require some,
> we will need to update the RTP framework to support VF_READY
> or VF_ONLY actions. In the meantime, just skip all actions if
> we are running as VF driver.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_rtp.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index ac31cba1dbea..5b27f7c45ea3 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_topology.h"
>  #include "xe_macros.h"
>  #include "xe_reg_sr.h"
> +#include "xe_sriov.h"
>  
>  /**
>   * DOC: Register Table Processing
> @@ -257,6 +258,9 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>  
>  	rtp_get_context(ctx, &hwe, &gt, &xe);
>  
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
>  	for (entry = entries; entry && entry->name; entry++) {
>  		bool match = false;
>  

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
