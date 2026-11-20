Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C01606A33A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 20:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ewlilcpj;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=d68donWi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65BD10E0C5;
	Fri, 20 Nov 2026 20:07:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3122F10E0C5
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 20:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795205246; x=1826741246;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1xSXeV19MDMjQ+NUUvp1FqpfrYGAeAckp6tHWKLCY9c=;
 b=EwlilcpjZ5NlVpFcA0EE894mz7oSDOcYS1fmOImc4TTlb0QHFNE5fzLr
 Tt5WJiBGkaWh+uPtlbRPXRVo0NG7mlEc5KgiJDHP4dL7DruUTuEZK8A7l
 ZwefUyMutYyDRhjGAy/xJewco+R6oREgdYYwvireYz/AFN+aARhriurdM
 LVWvvUIzx+F9K6bIr9RfMHWQ7eGEFhpv1zRYZl/jroD9nzgEk4/eGISJu
 sjKvafNspZP2e2Op8gDpSGv7sIqbKdXiw4EFAwxWYdcEey0RZ90tLJ3qO
 YEm9qjFEvC9zQZDZpjhLiSZ/azhwiLla6Ti/Yw/aUvLjebyds39RtJjFi A==;
X-CSE-ConnectionGUID: tUYdRjI9TXORziy6eDjtpA==
X-CSE-MsgGUID: NZ3B9u6kQvGwpFZN1gNMQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4133821"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4133821"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 12:07:25 -0800
X-CSE-ConnectionGUID: eoWy6IamTXe9sjktONC0aQ==
X-CSE-MsgGUID: 0MKVCEjOTWKpzolaaiwxRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10590681"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 12:07:26 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 12:07:25 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 12:07:25 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 12:07:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Db+4F/rbOygzbyF2nqMaRcO4Y1BTiSWlZgLs9omOmwl6u2o0lTzcstMLW1lRaPcdvkc1NTvcRqOK0dXX2FzBTcc0ZPt5oeQr0VVoRi/iTARuwn+PEr93rO/De74TEZaYrwRQojJSwEqpTCaBC53i86vcAo/h9NLYiwltvOIARSnSq1kVQo/GGPB7AWI+uaeix4yn37FKf3htk6E5/s0WlXa4lSMxmbAsyrmYFiFRM4Bi7QOJP/243xI2eYUQ60SFB5eD4UvqAvSXVUnIAB2B9OUd0oU1zwLibWkj58iPWQWOkVDXNmn+5CvlTXF9P8fkK6nC3NdGfP8MFyqiI0G8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XG+jJkp3+y1V0JyBBS8+a5s3i5FKLDhPPNajQxXTEFw=;
 b=gYyEx3i6Y4h540zyrF1ep8c6mkyYvlWauFt6vNyiuM7FZzGXl6+McK9GmDJsgZ31oDpJmBkuY58UFLzDB8hHbJXMdJpe2gZwwP9wLwjSnkyo7d5ODNHSnfv2jkBbXtNk4FTxf+ij7E68KEO3TQIQpK5t2ZtAy8DhoUKeMQebgC/v9u+YsluEBOpku05Vi1eG0WWvTHPIQF4FeDYtbzni2/d/VH8Jl3Jqtby5l80Kb1tgsjCOibKsO31oDCmFT6vjjTHUoic8KY8Pf5hJfcjmYPgOXKgPN51JEciQds5h+voVqCP2GJtpjAvC6g7SQJ2OMlqZvpykM1xsubp9NUekvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG+jJkp3+y1V0JyBBS8+a5s3i5FKLDhPPNajQxXTEFw=;
 b=d68donWi9yAXi04E2EhBCKpZmJtgnLg89uKvz65nOX6wb8fC0skivioShU3EZ8CHGqL0IDP28mNMbtr2ysVHfi1gJ43rvvPg0KlxPcA9Cqguuc4TPW5JaC4Gq/P2JJyKt6Q6H7C/LQRdyMs1TklYBIB+A5X3uKIRTJ05xlHe+tM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW6PR11MB8439.namprd11.prod.outlook.com (2603:10b6:303:23e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 20:07:15 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0615.012; Fri, 20 Nov 2026
 20:07:15 +0000
Date: Fri, 20 Nov 2026 12:07:12 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <harish.chegondi@intel.com>
Subject: Re: [PATCH v8 1/8] drm/xe/oa: Ignore a HW tail pointer outside the
 OA buffer
Message-ID: <awCocJklLBs+7MHN@soc-5CG1426VCC.clients.intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
 <20261119002737.3899877-11-umesh.nerlige.ramappa@intel.com>
 <a92cf949-2f2c-472d-9161-d948e8b7244a@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <a92cf949-2f2c-472d-9161-d948e8b7244a@intel.com>
X-ClientProxiedBy: MW4P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW6PR11MB8439:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f483c20-d53a-423a-140e-08df4741dee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|56012099006|5023799004|4143699003|11063799006|261009223027099003|261028144727099003|261102123227099003|261022113327099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: Lk5yhuc7+S2j6a65yN1wCwiz1gDBnLlY91D4ijzhqH9XrLiIGalAcDepiV+hhnxOKmQat0wI/ZU0PvDrd8REs5lfKhZmvPqg7cIP2krHxslmDOC0bevawofjCYahG8zszg2mAKxYw0eTbTn4dV1ZhWdusD1hKq+hvzB2SQxm5zRNACDjmFVqREVIv+cWK7o15CEgTZDekDtoYKP3UTbs3D0rU2rd95SIA0a+e6sPv0BdXUKE07sAFHfLgLJmgUDLj/EPxQ7eW/eSPYWf1xenKE1C8DvnA9Y8w48IHSs24qcABBe1IA3CmQ7Ny9DD6e2QcAIIgurMaR+Xo1QX+ZC79ILFE5zEriqXzYQaIkUxHZXg4ChZAotfWYOsqXS+s93rDdCbMmXIjIHoxW01RuqLUrl62IsRJHJEdL5O6d7x0PpGNhFEDoML7zVao624T5VyLCQnW/nuNjMnSIrVDdlk22BZzjJGuUqT6q/Y+yB8MYeIsxxYRSvKfAk9rtdkwcQ9p5ZY1a0+fOojdHlvREwb9CE9i5kLzchNWSy1BrIKDwrGzd2mfrPHtiGTCU/dSvYstPkbFoRrQQjjkcw+uzvMH7XxgK5oQXkGcbFfuQFbQWVp02NTPbeot69ATkEUY8YPlHS0wrpu5NAWoGx+JGl70SnBM/1l74K8/vVYGnenr0I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(56012099006)(5023799004)(4143699003)(11063799006)(261009223027099003)(261028144727099003)(261102123227099003)(261022113327099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(261021121427099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QktDT3QwZGt2VUEvZ3pzdXlxMjlQcHF4aFJwbDB6cGEvQ3Y3MDhuLzU4bnFm?=
 =?utf-8?B?Wjh4aUZBZEx1UTNVMG15MlVJSkRZZUxBLzAzQ3AweFpFTDFLdW9IVS9jOWEw?=
 =?utf-8?B?azExTlBNNU1TQXlCcFZUZXIwOVpFZXBJV2Vha25waFlmM1JIditrdHBGay9l?=
 =?utf-8?B?aFFRMlVwL1N1N1NxSHFKRlJSQTJtQjZjS1F6MkZZd01ZL0Q2aTFPSVNIWlZr?=
 =?utf-8?B?WGNKUzAwQWhjUHJUQ1N3YWZhUzczSkpEMjRDeE1ySG1mM0s2RHcvWmJDNDBx?=
 =?utf-8?B?dTB5NGhCbVFxZnNSMmwzQUFUSlJoYW41czJUZmVpanpub0tZMTJ0bmJ1TkRH?=
 =?utf-8?B?VldNZ1RQMXlPTmZiblV6b3RNM0ljeDR2YWhMeUZ0dkxDZXVVaHROWlF4THQ1?=
 =?utf-8?B?MzZtMktaWjQ3TVo0anFQVXV1N0JTTS9MbEpuY01TSlU4eWtlVFdBS1d4N04v?=
 =?utf-8?B?cDhGTlVxUlhHYW9BYlRhbXhaTHoyVzlUa1JYMVRIYnFvTXRSRyt1OTk3TWZJ?=
 =?utf-8?B?bEZ1dWR5MnMzS3hPT2JkeU9yNDJNM1BYUk12Vi81bXdzYVVpL1hBdlNpTXBZ?=
 =?utf-8?B?cTJxL3BOMkZJL0ZsWFJxRHVydkw0c1ZxM1pPRk01Y0c2MmRHNEhjRnI4Vzht?=
 =?utf-8?B?VHJpNzlPcytNRFhmTUNvLyttcEYyR1FMMHVCYi8wN1dWcWtDbEpCUDVBWW52?=
 =?utf-8?B?KzFkSXdYMG1rRkE0cm9pMDF2UVhJTmtRWDRxQXk2cjhzSjRLKzRRci9YTEdY?=
 =?utf-8?B?NUZMNUtIa3VKd0xnZ0lxNUxJMGNSUlNDa1JkWGQ5ZWdnQ0hlVjZsN1lUMUxo?=
 =?utf-8?B?cDdQVTZaakI2ei9xcThXRnlhL1ozV2QzYVZWY3pKVWxMdVhxWkEzRkpBMTIy?=
 =?utf-8?B?ZFpUTFlLbFExdm9yL28rUXNObmZ2ektDMUZBTnd4ZE5lWEZHczI2TDU2VVc3?=
 =?utf-8?B?WW9OL2RpMFhKbnhZa00weVZuK2N3UEs3cGtlYjVrd1haRkltMHZHZkZVYkdT?=
 =?utf-8?B?aDBDSDNQWUNDZXpHc1Flek1PazhQRUUxeWdTbzJhOFVUNDVSK1VWZWdVcity?=
 =?utf-8?B?TXIvTnBZWEovdzhHczdFQTNoN3BLWnNyZm9yVEVQTnIxZ3lqMEk2c0VPUW53?=
 =?utf-8?B?RDAwYkcyc2UwOGdIbVJZandoZUVUQjUrS3BwSmNxL2RpdW9WYkUvZkZZay9K?=
 =?utf-8?B?WWxRVlp1emFLaE4yNEFUSW1qSjRUMkxzeEl6UEFLazJwN1J3WW9CdnFKYm5q?=
 =?utf-8?B?MmkvcGRmbVo3cjZxRzRlQ0VOczB6ZXRlR1lUVVBacmtVR2l2Zk5STW54SUln?=
 =?utf-8?B?TXpHV0JpRlVjV01RQ1VKMk9zak44cVY1cS9sTGRlMDFPTjAxMnNsVUIrYXcy?=
 =?utf-8?B?QUJyV05kV1NhWkNLMldjTEZOVTdHampJVHg3RklhUThEV3QxSlBxT0hVNGZE?=
 =?utf-8?B?QXZrODRCcTdWcC80M3ZRT3N2c3g5aVJ1NVh1T0oyMUt3SlR4SVlKSGkvK0Fh?=
 =?utf-8?B?SXBsL3dzZy9wVDd6Z0NkdHoybUtaL1V3c2dmdXBtYThrYi9CVThnZTkyS3dK?=
 =?utf-8?B?Q1RpQTQveDk0K1E4UFM2cjBBejJ2aVlHU2RRZVluMEVsVCtUT0paVS83emVh?=
 =?utf-8?B?VlFxaXRZdW9sbEFoWTFhNUtwNWtkVWZDQ0Y4RkoxUVR0Y3BNMVFmZlpqRTho?=
 =?utf-8?B?aHlmN21wMjJNT1poYVYwQTlqcVFpVFkwRXNqL1R5SGZZc3RqZDg1eGpPbFBz?=
 =?utf-8?B?d01JUFQvWnpUNmI0SU9DYjZiTytvL1R4cTdrYlNkMjVSMnBYWTdBZDAxKzdU?=
 =?utf-8?B?ZDNYRnV2UGpSMEJmYUNoQ3M5OXZleFJWZW5pcHIxUlcwNnVPZVdxUmpjNExW?=
 =?utf-8?B?UjBIRTQyWDNvRm1PZkU0Z3lvWXVnMVVSM0FkTXZKVXoxRUNpUXdZK0Q1bUFa?=
 =?utf-8?B?a3ArRzJLb0I1OUhjREg3bzZ5L0ZpRDI4eVJCVGRFb0V2T1JhNHBGWlFBa3Ew?=
 =?utf-8?B?QXFrYzBna0Y5emNrejhQbnAyd0dCTU43b1pMYW50NUdBNnI4eTIzUVg0emxG?=
 =?utf-8?B?UzhpK3QxRmx0RlpMR3lzY1RUMm9yVDFpWTB0QlpFd3psWXJBMnVNaHRhREZh?=
 =?utf-8?B?N0ZMM0gzWkxtQ2h3Sk44bEU1SjRDNEcvNzZTRXVxQ0NuUzBpUE9yMm12N2k2?=
 =?utf-8?B?MkhiZ3k5WG9Uajk1VUpKbndlUmV5VzZxdWJxblBlZlFiOXJaNHBxQ1VsYWR4?=
 =?utf-8?B?YXZQanZobWhEZ3FJa3ZkeDdxZ2VLZUpjZHNseVRaanhTa1liZkU1WVpyVWl6?=
 =?utf-8?B?ZDFCbk56S1JuR0xMVVdMdklCN3ZRc1pPTGt4NE44Z2g1L09GYkczNGdUR3gw?=
 =?utf-8?Q?63Oj9fg8M+bpBVhI=3D?=
X-Exchange-RoutingPolicyChecked: gjlwTDEnLaUl43quB2Sb7LNqG12I/ikbDu20eiWaEqJBcIGHXrc0ui4LuzgbNy7wMPi3tYtraqASu40sSslQxdcnBeMXXj1XdO9GTC03JqAsoAlfWd0FRm696JUF94RmjylTzWeIvs5K64iZHtogbBgtQPpgn52oRBe2AZQbCfNDSG8Mj/8yFQJCzzwq87tb+lQls7TvG9plaAKicV/21klfXuCwRWdSTZd2hkAYd649hRS9KOUqi2G8a0DdzTOHWnVFPY0JAgZtuNGQq4xFRDaM+B73OzVPLJ+JAvz56gS00wy6a7GW9eicRoJnKhbkzu4QajdlETGJ0nXNABZ8Wg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f483c20-d53a-423a-140e-08df4741dee2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 20:07:14.9328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IoT5f7pEhglpFgL6JAa5cGh2ZWHAhvq1b+kYA4bGHmKKJE+BxqyOiJ+Tlhzzs2Tc/LQBaw6CWW+dCPLvUigR8yYTgbCHNSw7fxMB3bg9ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8439
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 12:51:46PM +0530, Shekhar Chauhan wrote:
>
>On 11/19/2026 5:57, Umesh Nerlige Ramappa wrote:
>>A device that stopped responding, e.g. during PCI error recovery or
>>after a surprise removal, returns all ones for the OA tail pointer, and
>>a reset device returns 0. Subtracting the GGTT address of the OA buffer
>>then leaves a tail offset way past the end of the OA buffer.
>>
>>Since xe_oa_circ_diff() replaced the masked OA_TAKEN(), nothing brings
>>such an offset back into the OA buffer. xe_oa_buffer_check_unlocked()
>>walks backward from it, reading report ids and timestamps out of bounds
>>of the OA buffer mapping, from the poll hrtimer in hardirq context and
>>with the OA buffer lock held.
>>
>>Ignore a HW tail outside the OA buffer, as if no new reports landed.
>>
>>Fixes: 3a1fc394ba85 ("drm/xe/oa: Changes to OA_TAKEN")
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>I am unsure about the Fixes tag cause of the Sashiko comment below, 
>but apart from it, everything LGTM, and with that,

Agree with Sashiko, The fixes tag should point to the patch that 
introduced the non-power-of-2 buffer sizes. I will update that.
>
>Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

Thanks,
Umesh
>
>>---
>>  drivers/gpu/drm/xe/xe_oa.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>>index 838802482ada..fdd2d11ce4e7 100644
>>--- a/drivers/gpu/drm/xe/xe_oa.c
>>+++ b/drivers/gpu/drm/xe/xe_oa.c
>>@@ -270,6 +270,15 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>>  	hw_tail = xe_oa_hw_tail_read(stream);
>>  	hw_tail -= gtt_offset;
>>+	/*
>>+	 * A device that stopped responding, or was reset, returns a tail outside the OA
>>+	 * buffer. Don't walk the buffer from there.
>>+	 */
>>+	if (hw_tail >= stream->oa_buffer.circ_size) {
>>+		spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>>+		return false;
>>+	}
>>+
>>  	/*
>>  	 * The tail pointer increases in 64 byte (cacheline size), not in report_size
>>  	 * increments. Also report size may not be a power of 2. Compute potential
>
>-- 
>Shekhar Chauhan
>Linux Graphics Software Engineer
>Linux Platform Enabling
>Intel Corporation
>
