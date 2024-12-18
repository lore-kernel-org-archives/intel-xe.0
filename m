Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4E3E77183
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 07:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739FF10E219;
	Wed, 18 Dec 2024 07:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U0yQ4BDe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B0510E219
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 07:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734507212; x=1766043212;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iMSPJMHWtz1ZC9qlSj0UqUOvRJ8/ZEb5Qxz4CzaN9x4=;
 b=U0yQ4BDe7YqcKz4g/p2zoozMSCxPnnUZY2i1kdknGlI4b1eP9gkqkGkG
 aCHh06vKppChzXiyePE3JgoD2LK9ttQ0ZBlxy+sKXDOveU8+I8KQvcoYa
 PvMW6i/VOFHWGvK5dP2S3YkmVpRIPQCzRGxZdy3EQKl0Lx6DAVhGQ897l
 t1XfGXky4feqjjsSRExEWuEWdACW34oWjU277GAnXHoo3I133PgARQ7gE
 nZOb2ogZi57INLuaN32rHWcxjWNH6+cpI9rttnEC+ViLdtDUWtulUtuo4
 9DcfIM+0whWuFzHDMNAX/R8XlGML19TydrymERhonEnwEkugofnPYb+wL Q==;
X-CSE-ConnectionGUID: HWevkh4pSj+RooA7Eew45A==
X-CSE-MsgGUID: o5/NFQtvQBGEWz/eWmshjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="46360827"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="46360827"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 23:33:31 -0800
X-CSE-ConnectionGUID: BxpSPlQqQb21Bc1QM0Bl3g==
X-CSE-MsgGUID: C5QdBrmWSMWkMn0ZaDks3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98597665"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 23:33:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 23:33:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 23:33:30 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 23:33:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=on+VH3Gl0gsvOSQ4vpxdK9+xWMKuTWtv6+QTgczzwj7bqSvndhDmAi3wYRCju9RzSBOqC5KTFkDIHSD32+1qiDDPq8HooxUP31u0gFzpsSH5aFCLi2mHEkT6GDOIosVroZNv38SC0wmkgUdUgZTd1XF+ntgRJiieZUXDWEWJB5HbR7whCIylIr4ZablvFzU5RcTIDWcuNrJ2onnRTrp7iYnc1EwMuJtmMMnYMcEzLSwCVgOiT8rGgiaQPqihvL1A+5ZN2fCpN27aNB0BVXJYiYqw7pi43muKy7PaWKDWbVPiA7xJjE10KiWgVndnP3/ffwtj8bd3G4jjGxR0p53N3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clvA+39ad84stWa/XZF75gjuq/KbE6BBQVI8ZUx/MC8=;
 b=h84DK1PqqyipCpQwyKt37MUmdhvYdRE9DYoZzrdRyHNJ+7E/4aR9pP0w8jvcpcie4KuuCDCfa+Odln+ZoySDHdlhV8+UNg8s3I/ANCrU4D3xGJ3HWvIu2y4YaLHodGNhhcVoNBAmGBusp/2Vbs9l7Z+88m+FBmND0vvtjB2+SYuSrsln6sbfZEWWnqOWYprK6idzMWqcZu1Jk6p+s8XE63Z0fxgNA2p+naJuIrRXpF7Ou5aD5kt8JDRaTeSZL1OynNdvinmu+lpO4fzhQmD5J2x3os+EPYDjk6lwSDU9rT+aQzjsG3GHLrjwzCfu14ob40wSzN8CWAvhgqYeDmp7VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA2PR11MB4811.namprd11.prod.outlook.com (2603:10b6:806:11d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Wed, 18 Dec
 2024 07:33:28 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.8272.013; Wed, 18 Dec 2024
 07:33:27 +0000
Message-ID: <c47646f8-b4b1-4ff7-b51c-a363990b9c28@intel.com>
Date: Wed, 18 Dec 2024 13:03:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] drm/xe: add function to convert xe hw engine class
 to user class
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
 <20241121063904.3033754-5-riana.tauro@intel.com>
 <Z1jTTEkbCJYNJy1L@orsosgc001>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z1jTTEkbCJYNJy1L@orsosgc001>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA2PR11MB4811:EE_
X-MS-Office365-Filtering-Correlation-Id: b0523fda-853d-413b-ee40-08dd1f364312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlZhTjJnSk1FNUI2TWxucnB3SWVIQ3BFL0E3cC8xTVB3OS9aMUNCdGdDNktT?=
 =?utf-8?B?c001Lzg1UnlXN2h5STdZTll6Qm9MVEZnbVRGOW95WTRxcjlwdi9vL09aRTUr?=
 =?utf-8?B?QkhRWHBhSS9aL3VYL2VFUFk3VW1oL1JIVFI5RkllUE14MVpUb3JTYjdMN0l5?=
 =?utf-8?B?RU9OWjJiUmVFSHhKUVdicGk3WEZ1ekNmbkV4RzVmUTlEa1crOWROOTRMUEVK?=
 =?utf-8?B?eURXUGZFVEJwUlc5OStHTkxNSFdialB2ZWRKVllTNHdvc2hQYVNHZWFpay9W?=
 =?utf-8?B?SXJKMkVweEVmakd2M2NZaFlBZG9BNUcrbHlDSkI1bVNWOWowMFNOeDFYTUE2?=
 =?utf-8?B?N1RmcnF0V1hZd0lHWHRJUG4zUVEwQlJ6U1hrLzZSNU5rUDhPZHB2V3R6ZVFH?=
 =?utf-8?B?ZjY2VWVYUmthZXNzM0pXSkR0ZnA4cG1Ra3BWNUZwSzZrWC8zMlk2Y0N2NUVZ?=
 =?utf-8?B?bkdDSHU4dHdRSEJOZVF3bktUTC9Yckh3bldKTE5WaHIrWEZWbHJOUTdpRHQy?=
 =?utf-8?B?MUV5MjZ0bU5GdXI1NDVyR2pLWnIrYkt1L3RzeFNKUFhNN1VYbWxjVXhMQnRK?=
 =?utf-8?B?aTNQZ2lyYTU2c3hoamZkQjFVL3Z1YXNVVEpEOFVWT2FGaTRRNENvVFg4NmVV?=
 =?utf-8?B?bmxoeUk3cXFJa0ZYWTdhVEhydjl4SVZHTjRyMXAzMVNhRjFhMkE4MTc4dGpW?=
 =?utf-8?B?ZHEwOWt2S3B6bnZLTWpWTjNIMUxYRVMwcTRkNERMRTM0UVJkeUFDOW10Rzgx?=
 =?utf-8?B?RGI0ZVdSbGMzS3ppcUlCSWZ6VHZDQ0FJQnUvd0RCTE4vVzRnamFNckx3Y1VB?=
 =?utf-8?B?M1hDU2NJb1lDVVBySExiTld1UnBuZk9kNlZBd0NhYVJJWWhKcjZrZTFKYmxH?=
 =?utf-8?B?UVRyUUcwU2tWNUFSdi9GaGwvY2pwcGhEbHV4WGNCYXVmYit3RUhrckl3aWRQ?=
 =?utf-8?B?TitNUlhYM1pQYzJYcGw2a05vOWxOeW9DbXBTYzBxQW5qdkV2aWlYclhyZGRj?=
 =?utf-8?B?S2xtTDlOQzFXekgwWmd3ZUc0bktldkUwSjdPSHE4c3VsNkg2clZkdlRMWENV?=
 =?utf-8?B?bUdJU0ZTZ09Vcnlkb05CeUtQY3NxbW83MDc5YXBRRU9rcFZUTjBYeWliYmVp?=
 =?utf-8?B?ZmxXeGlNOHREcm9iVUIwbjB6WEFIUERwVlEyVDVablJGVnVKUVFUSXNXb2l6?=
 =?utf-8?B?ejZRcHdoOFF4NEpqL0RvR0x0bUFBLzAwMnJTaXZMU3hCUVpZa2M0bTBQczlH?=
 =?utf-8?B?bDV6bHVGVGhsdG1KanBtRHhONGNBYlBSYXdqNGtxOTc1TWN5bkNKMnM4VTlx?=
 =?utf-8?B?SFo0SzkwemJCa2x6V2tkdlVQc1JNZkhtWCs2aXJtV2w2N3ZPY0NhOEI3ZCtz?=
 =?utf-8?B?YTdZci9ZN2xRdDE1SGhIRmtIUzR0R1JoU2p4US9ldm14UHRVelZXY1N6cXdr?=
 =?utf-8?B?cERGUlM1TGo3QWllLzh0c1FsblptbEVwYjBtZUhtNkRXYUlsWGhWNzNKeGk2?=
 =?utf-8?B?UFU3R3FCaHNhSjZWYmJNM0JKd2Q5bUo0VkVWNm05YTFkRm92ZVl5T05NVXJM?=
 =?utf-8?B?cEZ4N2xqSW5KTHI0U3ZtQ29IVFRwR2hPMHFhNGgrUGFuODE3dUcvRWN5RlFS?=
 =?utf-8?B?VkNoVnczeGJpRjY3b3E1ME4yVGYzUmJnaHJiVnJNSTgzZjZNUDhCckdscU9K?=
 =?utf-8?B?VmtxTkZDUVhwM3JSOE14ZHdHUnE2OE1CeDAxK1BLOEs0cjJHMW5DckNOK3dh?=
 =?utf-8?B?WVZnZS9yeWUwTk9MZ05reEluNGZ4TXNjbWlmVityUXppMk9KUmlBVHBsOEFO?=
 =?utf-8?B?RFlzN243Y2ZyQStJK3ltZStZRDlBNTBFdmRVVGhXTUxxZkJFTURML1Z5SnNM?=
 =?utf-8?Q?YRlcUwZdUfABq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVh2TzJFRDZFMGNsS2JUd3pxbU40VGlOWThScko5RjgzZm5Zc1BoV1RDcFNC?=
 =?utf-8?B?UXd5eHJYZW96ai9yUFY3Vy9hdDRYbktuREVyQnlBMlhPb2hHdGQ4SzZNdjNM?=
 =?utf-8?B?V1J0eDhuMnlYS0pTcFZ3Z2daVXdiRXk0cThaYnZDMkRWL3NMRjN0bnFQOGVy?=
 =?utf-8?B?dG5hdy9oeTdUa1RsNFJ5QnRvNVFwS0xzNmZaOThsTlVpQVhMMG5yVXlGcm4v?=
 =?utf-8?B?UUVVZjlmRkJ3dUFSTWRiV2QvaHkrQXA2Nm5iZWU1UjZYK29IZFJhMnBRTG1F?=
 =?utf-8?B?dHN0UDI0WXY3dENVYS9xNjNJWG5XR3o1eXlib1NxNGlKMlRrUHF2S0RrTE1p?=
 =?utf-8?B?aFlLekFYZmkxazU1NDNFNnkvK0l0Um54MlppYnEyM0ZPb2RnanZoUjRCTHpP?=
 =?utf-8?B?MWJKWjc3SVBadUY1bEVzTWxzNm1Lemh1dUtMckt1RG5lYmxhTGhtYmx5alVY?=
 =?utf-8?B?aVBMT053QS9CaWl5RVhrc2tKQXduV3gyc2NCWGk2WDlYTC9IbkhzYXJFZkhM?=
 =?utf-8?B?YkNML1diSXBpSXhwbmdnQWNRaHIxaVkwUWdPR3VpcW5CS3kvdjJSejZqejN3?=
 =?utf-8?B?T3dWaFJxdFYyOFl3SGtXZnJXbm8xcFY5MVlPbVJEOUJQTktGSU5MakJsZGZs?=
 =?utf-8?B?SXVCVWlGYm1PbFRMbkkxWTdOWFVwV1ZIQ2R2VGFzNnh0dXM0QlBZYmlwSHIx?=
 =?utf-8?B?MFlKWFFZS3pZcVJaSDV1dnVzTTRmaDRPT1JxejhuU3lBRy9GaXFHRFRRVjFk?=
 =?utf-8?B?Zmo4eFlkVWduV1p3UHRhK0ptOVlSUG9ESmx4MnQrVnZuenJXY20xbnlyMGFU?=
 =?utf-8?B?N05oQjUrTUdCWDVoaUFSa1hnZEtQR0x0RzVnd3dJNndYei9KUGFVdlEvTW5p?=
 =?utf-8?B?UG00dU1WNDVxMEJTbGY4c0l3aHIzOURQV0RhS3JCL2FiTEVmR0FpdnBLZnZu?=
 =?utf-8?B?V1d3YVhES2V3SG5KU0F2dmZiZHFzOStJRUNTeEhyRnBGbVE3UHJzK3lTdTVJ?=
 =?utf-8?B?ejRKOXpIeVYxbGFrK3VWZFc0WTV0SmJWVXVHaWFJM2V3M2V6L25rUEZaR25C?=
 =?utf-8?B?TllqcVlIQ1JVYWRGYmszUUZPVzBXYXAyN3dwaEo5WGVxdkJJMWIwWGlqMEdp?=
 =?utf-8?B?NnY3Y1dUazlCZUZDR2pHcEZLbHh1ajRlYmJ0S1JEaTZvc2JBWlM4bVNxSm1B?=
 =?utf-8?B?VnkvK1N1STdVY1RTc01GcmxqWGFtNlVsK2JLcEVYV2RxczJKVm1MTFpPaURj?=
 =?utf-8?B?bjBDYnVHTEtwQ1diRndGRnFBbW5mTDBuZ1QxWS9aVldJNlUxN3VkZGR3R3Rz?=
 =?utf-8?B?T2xFc2dTelAzbTExWWlCV3NnWWR6MkRQYjZHd09xWkt5S1B3dkQ2VnZJbmhs?=
 =?utf-8?B?TWU5MUlDTUsvNTBUQTN3NDFiRkd2ZEdCYTFyNDloSHU1eW5Ld2g5dzhoWFdt?=
 =?utf-8?B?M0RRTWZBNDdDQmNMV2pNNTYrYUxhVjErN3MvVnU0VU13dVVkSjQ2dit3Rml4?=
 =?utf-8?B?Snk5SWM2b2wxWHM5ZEJlWUI3MFlFcjZ4Vm1GRlpnUzEzSmZXU1NoODhNdnlF?=
 =?utf-8?B?TUdxQ2VTbDhoaEozYTNZZncxTUNjRThsejFoWjl3SWxnQ3c4QnY0UzZvSDRq?=
 =?utf-8?B?NzY2RG1MaGIwUFRwc2ZQb2t3NkpJSG1CeDFYWDRkb1ZUQUN4YVh5c0Iwalcy?=
 =?utf-8?B?UGo0eXRSUHBOellxR3lrcnp5S1g4dW01cXlUZ0l6S09HQnVrYlo5aXlYQWhM?=
 =?utf-8?B?YXVVUkVTRExEc1k0T05xTUNZbEJYN3JOVnNRbHJraUtibGFkSTlXSXp6MFoz?=
 =?utf-8?B?bC9HczlRdURLWGNiYmNBeVFTRW42RUlaMmpFdCtXTmNTeGViTXFCQ2JpOGtj?=
 =?utf-8?B?ZThSRDYra0xnT2QwR0R5MnRaWkJDaDFmV1ZiOWF5ZTZqQmVCdUJpcExBNExy?=
 =?utf-8?B?bkxmVnU4MXNmc0NidGtvcWRRdUlmU0g2VTRxaU1Hd1FwZDdMV1NpdmFldGZu?=
 =?utf-8?B?ajF0T0c2bGVndEpodTgxa0VMYWk4Z0tEamt6SzF6WnFWWFJ1MnFSZVhLc3c1?=
 =?utf-8?B?YndsamNkR1I4Q3lqNFlxa25PVWhSU2hROGIxVVVFMGFIN0tQSVZUc3I3QmRF?=
 =?utf-8?Q?iRGnGJxBzZ1ot3EB1k5d4RjTk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0523fda-853d-413b-ee40-08dd1f364312
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 07:33:27.4311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cauqXQf+eyXYbI4yn8aqi/seFm/C2gyDs1YeQQN7XmYg4pALVdjFogSWiIaspm9hASKjdTaitcixHHCpQDX4nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4811
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

Hi Umesh

On 12/11/2024 5:18 AM, Umesh Nerlige Ramappa wrote:
> On Thu, Nov 21, 2024 at 12:09:00PM +0530, Riana Tauro wrote:
>> Avoid duplication of code in PMU by moving hw engine to user class
>> to a separate function. Refactor existing code to use
>> this new function.
>>
>> v2: replace with array (Umesh)
>>    fix commit message (Rodrigo)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_hw_engine.c | 21 +++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
>> drivers/gpu/drm/xe/xe_query.c     | 12 ++----------
>> 3 files changed, 24 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/ 
>> xe_hw_engine.c
>> index c4b0dc3be39c..c41b4038dbb3 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -979,6 +979,27 @@ const char *xe_hw_engine_class_to_str(enum 
>> xe_engine_class class)
>>     return NULL;
>> }
>>
>> +/**
>> + * xe_hw_engine_to_user_class - converts xe hw engine to user engine 
>> class
>> + * @engine_class: hw engine class
>> + *
>> + * Returns: user engine class on success, -1 on error
> 
> 1) Depends on what you want to return on error since you return u16. If 
> the WARN_ON fires below, you may just want to return a default like:
> DRM_XE_ENGINE_CLASS_RENDER or 0 and change the comment above accordingly.

This is called as a part of iterating through hw engines both in query 
as well as pmu.  So it shouldn't hit the warn on condition.

Returning render would cause wrong mapping, how about 
XE_ENGINE_CLASS_OTHER or XE_ENGINE_CLASS_MAX ? or do i just remove the 
warn on?
> 
> 2) Returning -1 means use an int return type and make sure all callers 
> check for the return and act accordingly.
> 
> I would recommend 1.
> 
>> + */
>> +u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class)
> 
> since now this is a xe_hw_engine api, pass the hwe to this function 
> instead of the engine_class.

There is one other function in that file with the same parameter. So 
used this.

*xe_hw_engine_class_to_str(enum xe_engine_class class)

Thanks,
Riana Tauro
> 
>> +{
>> +    const u16 xe_to_user_engine_class[] = {
>> +        [XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
>> +        [XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
>> +        [XE_ENGINE_CLASS_VIDEO_DECODE] = 
>> DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
>> +        [XE_ENGINE_CLASS_VIDEO_ENHANCE] = 
>> DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
>> +        [XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
>> +    };
>> +
>> +    WARN_ON(engine_class >= ARRAY_SIZE(xe_to_user_engine_class));
> 
> Revisiting this, it should not index into the array if the engine_class 
> is invalid.
> 
>      if(WARN_ON(engine_class >= ARRAY_SIZE(xe_to_user_engine_class)))
>          return <something>;
> 
> Thanks,
> Umesh
> 
> 
>> +
>> +    return xe_to_user_engine_class[engine_class];
>> +}
>> +
>> u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
>> {
>>     return xe_mmio_read64_2x32(&hwe->gt->mmio, RING_TIMESTAMP(hwe- 
>> >mmio_base));
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/ 
>> xe_hw_engine.h
>> index 6b5f9fa2a594..06b39cb1a434 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>> @@ -74,6 +74,7 @@ static inline bool xe_hw_engine_is_valid(struct 
>> xe_hw_engine *hwe)
>>
>> const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
>> u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
>> +u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class);
>> enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct 
>> xe_hw_engine *hwe);
>>
>> void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg 
>> reg, u32 val);
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/ 
>> xe_query.c
>> index 3eda616f1502..a260c43f13f4 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -27,14 +27,6 @@
>> #include "xe_ttm_vram_mgr.h"
>> #include "xe_wa.h"
>>
>> -static const u16 xe_to_user_engine_class[] = {
>> -    [XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
>> -    [XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
>> -    [XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
>> -    [XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
>> -    [XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
>> -};
>> -
>> static const enum xe_engine_class user_to_xe_engine_class[] = {
>>     [DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
>>     [DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
>> @@ -207,7 +199,7 @@ static int query_engines(struct xe_device *xe,
>>                 continue;
>>
>>             engines->engines[i].instance.engine_class =
>> -                xe_to_user_engine_class[hwe->class];
>> +                xe_hw_engine_to_user_class(hwe->class);
>>             engines->engines[i].instance.engine_instance =
>>                 hwe->logical_instance;
>>             engines->engines[i].instance.gt_id = gt->info.id;
>> @@ -678,7 +670,7 @@ static int query_oa_units(struct xe_device *xe,
>>                 if (!xe_hw_engine_is_reserved(hwe) &&
>>                     xe_oa_unit_id(hwe) == u->oa_unit_id) {
>>                     du->eci[j].engine_class =
>> -                        xe_to_user_engine_class[hwe->class];
>> +                        xe_hw_engine_to_user_class(hwe->class);
>>                     du->eci[j].engine_instance = hwe->logical_instance;
>>                     du->eci[j].gt_id = gt->info.id;
>>                     j++;
>> -- 
>> 2.40.0
>>

