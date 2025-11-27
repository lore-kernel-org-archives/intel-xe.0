Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D674FCFD2F6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 09:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA6710E7BE;
	Thu, 27 Nov 2025 09:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdGwFB8X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FDA10E7BE
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 09:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764236251; x=1795772251;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=WM4i849sMcLDh7sGTkO111ZQfWa9Bcote8vJim3AO28=;
 b=bdGwFB8Xsk83DvjR3WD2iY7i1qou//QTzZehYFZDgwlYvjrNrmMpGCD5
 WfiQAJU441OQBUTlYBwooCEIygG6WUKVsTzhlduyWAXBusA5siyaehvoW
 LXg3Sed7oTigzIetbQxRzNoKVjbmwBgbZBkbOtMDvgP0JlPQNNkn785wk
 ZOCFIZYbEls1bqI/2k0w6EF42Ybv3FPbV4mfISUouLhePyHwM3MhzwqoJ
 bR905uZgUILEicOC0N7koX+0bDLKv4hbP2X7yryHKswkGUlCtzQ4P5B+a
 4Imq4bNtsz72sgnLTZqtneDvyx55sN5nf1H3SofKmYzaaWAYmpvKY0uQ8 g==;
X-CSE-ConnectionGUID: 3Jc2DOsoSJ29OB6N3P4rXg==
X-CSE-MsgGUID: y52AnH/IQGWdqcT+2zHvZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65467075"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="65467075"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:37:31 -0800
X-CSE-ConnectionGUID: nNvuIaH0S0COHo2pyf2JSQ==
X-CSE-MsgGUID: 30X/xM5UTROa/GrpnUwsTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="193998215"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:37:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 01:37:30 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 01:37:30 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.17)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 01:37:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6ntnj5Jh8NMhT0rEEBMyqX6x6TkSpbRKjqvb30hjHmyhfMdbKBPT+T/E3gTiQn3BRpu0LytLv0N+nHKFhKs5wVL1j+wHlRvkJbiFomGiOzRm7uZzZrC0xrepFXT2JrFKZF5uUUgoxzL7Mrw0Jf4j1K2cdLpFIcGP8iKRr6AHX2M2Ty2AnZLaA448XxdAxhYr89tk0xZ7vlbhQehKLNeRqEhF7gmlVVdLIp0H+5tmy9UZQYcheqPzWU79S5E9IREVNrBkwvV8qMJFHHJpP6Skyzg+US5mCgJLbNSow67+GTOqJ4egsOlsdRauEuscxkZ+d/3oPMkSIsTnDFpNPcJuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SFF2UtCkCTj6rbNAyWqWq/0IgemATEB97AMwSFiA34=;
 b=CGo3egh/bfePv0H7xr6uIqQqd9zcmDIPi01uVp+H+wVGRc3Iz8e0rSPCuRwPjUGHMJVSVTY7DQdAXeduaZ5L+W8wWGyrrHRR6Sew4BAyj0K96Z5zP3yPd61tGmrWK/B/5OV3V6BBB51jgDTcpiZLfsUAfZhaslm9QHP36KNO+e/aPndujyVLUzS22VciQhF7CYaWP5UbIsQueZw4kKdvgAZDDvbTiitUCiKUZFUl7PsBKCuTqnt3P/VUBfoekr0qErqTJ2+upIweKYY3+jz0oJneL3eLmboOrXTbmJa6Dcqyt1qBqn7YOxR62DIOFdFsEu8kApC1vxUvN+ZoxpId6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 09:37:27 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 09:37:26 +0000
Date: Thu, 27 Nov 2025 10:37:23 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmbw==?= =?utf-8?Q?r?=
 drm/xe: Move VRAM MM debugfs creation to tile level (rev2)
Message-ID: <20251127093723.5uwvn4zzs2wkb4p6@intel.com>
References: <20251127073643.144379-1-piotr.piorkowski@intel.com>
 <176423365709.33971.13939370040667325150@a3b018990fe9>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <176423365709.33971.13939370040667325150@a3b018990fe9>
X-ClientProxiedBy: DB9PR01CA0026.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::31) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|BL3PR11MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f7b782-6562-40fb-2d52-08de2d989373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVdCMHoxdDNQc3RiS1U0TDZFWVBjNkJKSVRTRGRIZmd6YkcwWW9GY29hTTZw?=
 =?utf-8?B?eUd3ZS9CV2ZpSU9qWWtjTXAyTFNFdklZRTdZVWo5ZXZxeTNFZ2l1TTI4NEZO?=
 =?utf-8?B?UUFQUGp4cGkxSU1Cb2xoMlhVYzA0ZkxnSWI0QTRQT2tnZlJ3bFArSWNaTEYr?=
 =?utf-8?B?ckRpSTh3UTJjbXYwOFFjRG1kdFlrcmo0aFVyZ2FyZXJxWHczclhBbVFVV0Vn?=
 =?utf-8?B?UzdqQWI0Z1YwOFhVbGt1L1ZpMk00UnJLb0x3Ym4yYWNjQ1ZWK0N3dGwwbU5Z?=
 =?utf-8?B?Z3Z3amZNc0tRSkxTVWJvM050azZsZ0NuaCtuNGNjNVBDaUh0S2ZVL0dEK0JW?=
 =?utf-8?B?V0lRaFZUZ3Z3MStvQnFnSUVrNUxEMGJSaTE0RHQ4eHhydlduVUJmQVFoRHRh?=
 =?utf-8?B?NmhDeHdOZWJ5UWl6bTRiKzQrRWRYYnBldWJ1U0NaSWJxbmlPWGpzbC95ZUZs?=
 =?utf-8?B?T2RxdEkyeCtrK20rZi9NMVZSdzNmbnl2dVE0MC8rdGo0d1h3VC9Pdjd6SjYv?=
 =?utf-8?B?K0tITWVYRzgzcUdScXdTU2o5cTQ1MWRoVFBNS2tBbE5YNHpuSTJqa3JYN09x?=
 =?utf-8?B?OGx5UkE0VEduTzk4TnVOb3VSa29xdU5VaFkxM0szNmxaMWdmOFhpSGg4RFRM?=
 =?utf-8?B?ZjYxd2hvRVBLNXBYVVo0NHJJNHFGYkhXaTVmK3FGbU13S0p3Q1Z3MUxqRXdI?=
 =?utf-8?B?TEFlcHlNTjQ1QlNPQkw5RGZvK3A0MWRoT3BmMTFWc0xDa3RMMHVab0lVMGRw?=
 =?utf-8?B?Y3hCN29hbERFZVJtWG0vYnUyWklhR0lnM2wwNWhCQWVmVVBTblJpUnhSNHJl?=
 =?utf-8?B?Nm82ejlIKy9qUXQxUkppbGF1M2NMR3ByM0lUYm9xbFhxY0dGdHBnRlNiclRa?=
 =?utf-8?B?TmJTUzl4cTE5NTU5OFRxT29rRDVpVVNGbklEZUU3Z1l1eWlmbnN6d0tWVG9P?=
 =?utf-8?B?MHJ6QlhMZXRhbDhTYlg2NEdsRldFZHplYUgrd0RzaXZWbmNoalZpdktaWlkz?=
 =?utf-8?B?YWQrQVF1cGt3U3VLb3RxU0hvWURxUklPTzhQVzNKNW84WVM4dnQ0TUFNUHNG?=
 =?utf-8?B?aDFPNkZHeDVRTXFyV0NnY0dvbGVacVY4a1VVS0tKZ21lSFlxdm0rTXY4ck5Z?=
 =?utf-8?B?ejI1dkpkanRMR1J5ZlE1NTVwbERLV29zUVdPZ0RkekRDTVVSVXZlMlBsaDdZ?=
 =?utf-8?B?U0FBRWNwQ001UTA2dGNmOUZkRCtGY2FXOUh1WkJzdzQ3cXAzb1pMY0F5U2pW?=
 =?utf-8?B?NCtWeWh3Wko2SFpTUk1RaW5PUEJMczlhVzdaQ3lTOHlLS0NNcW1NcWZnQS9G?=
 =?utf-8?B?QUFxdWRWNzU1VkMvSXNsWFFnaUNTbVlsWWtEK2hMMnc5NlJHZTlkZENoRG5L?=
 =?utf-8?B?dE90WnRMQ01uT0VSVUVGNW9KekxhL3FQcEI2WkI5TldBVTl1MnFlb2xQazgr?=
 =?utf-8?B?eEpUb3g0ZlRHS2R5ZGpPK2pnd3d0MkdKdHZmOVNJSHJYK2Q0RUxaYkNzdE1P?=
 =?utf-8?B?ZUxUaS9qNXFTbG5QcjR2RjdUZkkxbGVUemFoSCtJZDZLZGl3SzU3UWx0azVs?=
 =?utf-8?B?UXgwb1c2cTRQcnE5UE1Ec0V4TWFWWjE4Y3NydlpvdjJCQ3UyRVZYV3VYVVRH?=
 =?utf-8?B?eVlxOGtKN0g4R1V6V0RmdVVBRXhCVTZyT3FJQ1NQSFBQWXYvVVBURnIzRkEz?=
 =?utf-8?B?aUFqQk45R0N5azVCYWVkeTk2aUFaYzRKeWlDYTJza0RteG51WEpYbUxTbXFm?=
 =?utf-8?B?TDY1Tm9aTno1TkZNUFp0UFoyVExqRkNLZ3JLMHg4V2xySENiUzVJcEJZRm5B?=
 =?utf-8?B?K01VTzN0MEhzdzJFRitKWm82WWoyWHVTb25vc3JwY2kveTIvbnNTWUFQcG5R?=
 =?utf-8?B?OTM4UDROd1BRTldKZkg3TXpJSWVOSXpETU94emJXZ3JnYkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amg0clo3OVVValpzQ2I2clZFTW5Kc3E0NjMxdENLWllCdTBLQWlFV1dkZDFj?=
 =?utf-8?B?T1JYaGxWN3I4TzNVWGtyWGtoOFE3U2hUb3FicHNyQ1JMcHIvVktvT2RBZ1VU?=
 =?utf-8?B?eEJ1YnFMekxpK1Rra2ZoUGN1NkF3MHFJMFdidFhMenBtMVE0K2cxYmNKMFIy?=
 =?utf-8?B?eldvdlZ3N0l3UzlHQ3EyeEVncW51U3YxRHJnM0RGT2c2YzRlVS92UjFsNTFZ?=
 =?utf-8?B?b0wwWW40TFNPSjBaYVM0elBwWU50RGFlTFc1M3hsd1N6LzdGK1poRmRBSWps?=
 =?utf-8?B?Njlld2ZCQXRqN2FpYnduNFJnV0J2N05LZkZvNUQ0YTZwVmhXUU1xSkRTTXlY?=
 =?utf-8?B?UkE4Z2lsYTNreUdPU3JiekxSeFZEZkxvSTlPbVg5bEg5UzJNUGJ5SWhid1Rn?=
 =?utf-8?B?S0pyZEhIWE9qT1VqVm1yUlNUb3NwUGFXZE1oNUtNTmdQdHBlVDhvTFl0RHdE?=
 =?utf-8?B?QXV1UnV4TysvSGsyVkw1NHpkdjAvbFpnZVpUNmxlbE4zaW1uajFta2UvQ21q?=
 =?utf-8?B?eFMxUi9IWUtTVHp6RkRpLzREYUtZcElwZ2RVYnVsQnBUcnFzYTVqWndYVWpt?=
 =?utf-8?B?eUtSL1BXN1B4ZGNhdlVtQ1lyWTBNL0RMQXhYN245UlVXUm1DN3dIQUt4M0lr?=
 =?utf-8?B?MmIzRFZHSEg1SCtNRUZ3MVN2d2ZMQXBERmtoeWxoK1phRHgzR2dWdVF1NGta?=
 =?utf-8?B?Sk15WXBBQ3AvVUF3bUxESWM1ZjJpcFZqSFZMZzIwS28zKzQyUS9JeXlldEZw?=
 =?utf-8?B?K2JSTlJKRW0xV0NxdFNCdExJUTJXeXlZRGlaOXRwNlFxS1ZWK1NQZ0lKRFU0?=
 =?utf-8?B?aUxWVlNUR2lFTW13c001RFVTZ2hwNThaL01sQk1lQ1B4dlNFak51MU0wVlJS?=
 =?utf-8?B?WWJYdVErSGxDUzVOOFJxSGxkTFRMT09IWFhzcHBWckl5TG9WNXVQcVhiTzZF?=
 =?utf-8?B?UEVaUW1WSHpMR0lWSk9RRi9uQ09oSE9CYkF6d3htZE5maWFhZ1RmNzBWRFYz?=
 =?utf-8?B?S1BVK2UybmhqemhldmFJa29xd2d2SFFNYU1qbzI3NGdZRDZFSm5Dc0JOTHpG?=
 =?utf-8?B?VDlka3BvK1oyN29WUDZTdkNpWk5kRUxydnUxTGxXaklYUURBOVhyUEh6Y0w1?=
 =?utf-8?B?aWdoYTlqY1JwNmJHVGt3ODRKNkhmeDk4STdBS3JVM2NoaE5Fem5oNUc3N1FI?=
 =?utf-8?B?UG9rMnVsTDZHWG9hdGc4aVVabHl1NDQ5ZHlSNERhNm56R2hZajRVWmEzcjN3?=
 =?utf-8?B?YlhheVpPbkRINHg1RUw3ZzEvMDlscUtJWXZJZG40SDZCazJiQXl1NTh3ZkhD?=
 =?utf-8?B?KzJESWUxSTVJS0dveGFaMkI3ZStSQ3A2VFpSQnBVNGk5d2JvUUJKd0RyTVQ5?=
 =?utf-8?B?UnQ5d3U0TVI3V1JEdVVReDdwdzNzam5oSFRoK0NQSzM0a1NqSGJqQmU0OGg0?=
 =?utf-8?B?SnRLQkJ0Ui9ML09xbDRvSEJtcmZVOG53NUxZc1psZFRrSllQVEFQYU1tSFJ0?=
 =?utf-8?B?bElIYXorakVVdVd0S3FUUkNNUzhDTkJkRFRIeUJPNk9XSUlsRTVlNjdMdm1C?=
 =?utf-8?B?M3hZZ1dUM2VoZnQwZjZVREt0enNvMmpKVXVmaFBxNmUwdk1WeDkvOVE5YmNy?=
 =?utf-8?B?eEV0eHVNTmxJcVBna21CRFV5SnRvSDFCM2dmYjZEQW5rbUkxTG5id2tieTQx?=
 =?utf-8?B?TFB1WGJsaVpSdnlIQnQ4V3NYcUNYUkQ4S29vTlhibkw4aEVDYlA1UG5ReWNT?=
 =?utf-8?B?U0ZBV0dmaEM1QnFaQTlUb3d1RFlwZ3BKTG0xL1hQY2tPelZZa0ZLQy9wd3dQ?=
 =?utf-8?B?QXhYL0VrMjlPZ3o0OHNUZkdRZXE0MXBzU2R5MkNQeVh2Uy9uZ0xZNGI5T1Q5?=
 =?utf-8?B?OWdGeXdBK3czRFBXYmFVUCtrR3pmbFdTWnlPSWZ4Zm5SNEdyOTFwejVxVnVz?=
 =?utf-8?B?N0VoUG9OSFpqZ3hTNmV5UnQrWjQ4NkE5TkRpc285QW1lUHBEdVRZeDgrQlFP?=
 =?utf-8?B?OFRkM3p2R0U1Z25XMnBBT0hRc01uRkFBaWZ4Nlp4OEpTaDhyK0Y0QU1ibkR4?=
 =?utf-8?B?bitxdy9qSi96NFJVdGppdHpmZUlKZHBVTk9FN3lDUFltSGRFR3dJOVBrZWor?=
 =?utf-8?B?dFVzRlM3UWxpeVV6MEJVRTIxY2x1QUVaZjFFa3ZzeWNpWVZPYzJadUttcm9U?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f7b782-6562-40fb-2d52-08de2d989373
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 09:37:26.6509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u71x75pUtLYe7nZyycnARoa5SNlGUgUgHiHUZPOC4SnZQAgo6KtQHZAHlLRASW28CkNmiUghBZzg9cM/7XX+H/W43Zhia6E9PFaNUEkdUY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6410
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

Patchwork <patchwork@emeril.freedesktop.org> wrote on czw [2025-lis-27 08:54:17 +0000]:
> == Series Details ==
> 
> Series: drm/xe: Move VRAM MM debugfs creation to tile level (rev2)
> URL   : https://patchwork.freedesktop.org/series/157089/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884_BAT -> xe-pw-157089v2_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   
> 
> Participating hosts (12 -> 12)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-157089v2_BAT:
> 
> ### IGT changes ###
> 
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@xe_debugfs@root-dir}:
>     - bat-bmg-2:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-bmg-2/igt@xe_debugfs@root-dir.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157089v2/bat-bmg-2/igt@xe_debugfs@root-dir.html
>     - bat-bmg-1:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-bmg-1/igt@xe_debugfs@root-dir.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157089v2/bat-bmg-1/igt@xe_debugfs@root-dir.html
>     - bat-dg2-oem2:       [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-dg2-oem2/igt@xe_debugfs@root-dir.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157089v2/bat-dg2-oem2/igt@xe_debugfs@root-dir.html
>     - bat-atsm-2:         [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-atsm-2/igt@xe_debugfs@root-dir.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157089v2/bat-atsm-2/igt@xe_debugfs@root-dir.html

(xe_debugfs:6235) WARNING: Missing debugfs file: vram0_mm

The results are expected, as the purpose of these changes is to move vram_mm to the tile level.
The test has already been corrected and is ready for merging [1].

[1]: https://patchwork.freedesktop.org/series/158118/

Thanks,
Piotr

> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884 -> xe-pw-157089v2
> 
>   IGT_8639: 2ce563031e6b2ec91479f6af8c326d25c15bdb26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884: e7a767430515c3a6e8aee91c2a68cba8b06fe884
>   xe-pw-157089v2: 157089v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157089v2/index.html

-- 
