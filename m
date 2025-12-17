Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC01D6552C
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 11:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4377010E53F;
	Wed, 17 Dec 2025 11:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hS2CT2iU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835A810ECB6
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 11:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765971839; x=1797507839;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1AUDNqLsRH8OlE2c1fu8AGjZ6LlkjXU7q2hYJQesP8I=;
 b=hS2CT2iUmxa1d29WRQP+Cdq2Vs0gbBPPyOEobCozCCvDC2e9ZSMZy61K
 QtLR9LCAOtv+rkkI7Yn8jmkTB/W+IxRwRzQmv0fVGK6dC5L0t0qxTkza8
 sChZugAHXoNDbHX+mZfx0ugaoktz4350NxrGOx0gk5PgJy1NE7AVwRXbp
 hyhsNrl1wE8W+JcI7SmTlGG8b9KPMc1P5DR2ILuzO3vZnSLoae8MCk5T2
 lHD76yrRz+08RDKRv9rhbaYcYoIbgiW4WBDVWY9c7x0fSdeJZua3LOSFl
 ORNkRySJmTCxm1LUFfv/a653HsC2JS6a+C/DMVOJkLEx56BhuNMVZ0RGH g==;
X-CSE-ConnectionGUID: QG2hpxctSq2h6cAnD/WUzA==
X-CSE-MsgGUID: nE7WZYN3QQeYRhHunBJLfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="79363657"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="79363657"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 03:43:59 -0800
X-CSE-ConnectionGUID: 3Y0M6NItS/u2/jf6/9oafA==
X-CSE-MsgGUID: ApSsAgBUSOC7s24qyYaBsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="203186325"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 03:43:59 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 03:43:57 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 03:43:57 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 03:43:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkwTRlTiQYhSipY5PQ/TZvvbhjcgCJu8Wdh3hKpzWvFUXn9BmuOIbcQ94oxIs+ZXc0uSCybbnbTp4eIdrp1Cr6XAGADzzNi3T1cZbe2Hcki7kJjEiUfUeCAzthZb/FzbyfHBJgsglLFcc+wjU3DiDv7ylmFgqgbdYMO8OJyzNo5QcGQbNXVs+5NpbesuuuKHWVg+GckoU0V+2oL8mi5+g4cp0y7SRrKEaMe+a/ZJ6vvc37NkM4yZBLlR7sMS+75f/DgfXaSWyyx5wERCIqnT96WZlMHVf9HY98DH8EK/F2RDgGB5gLqaZ245wOt+mu7VFHGzFGHcTEps5A5rpg8d7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7A4kA08swiAGbR+XpQpQzrDz+RyFaMvrtneaKqtdm5M=;
 b=t8cySJMcBQT1ND9AZXfY5XSzrTCBAfdPzAg4T6+UvhTXSYwpnvoahEmHpd9JxkhEhMtrU2WoUFhe+Oc2cdCt7/7EsQCgKtp+rBUoHLVSubkHjIhvmiWYhaVdEylDjLW1Jvi0oo3UkqJvgPg/HnD2+3ULpEjyOKdwZry6R0j3bn/UCy0jU1/MsC6lV41ef7EAYbodtXZWqW7LlLhzoT/kDPDadHIb4KqcS+emTxx6Oc2CMIIqnez9hWlrTLml5t81dCSpoivOWv0PyEK4tc5BzlAXqK3eQnzqeAc7kSbuAjtAwUicsDY+yd2dNFxaByJSiplhzqyvZBdFWNXvNkdvQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19)
 by IA4PR11MB8891.namprd11.prod.outlook.com (2603:10b6:208:56d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 11:43:55 +0000
Received: from CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::92e5:185a:2a3e:2349]) by CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::92e5:185a:2a3e:2349%2]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 11:43:55 +0000
Message-ID: <05b098f3-fe09-455d-85a5-12e7130f341b@intel.com>
Date: Wed, 17 Dec 2025 13:42:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix NULL pointer dereference in xe_exec_ioctl
From: =?UTF-8?Q?Tapani_P=C3=A4lli?= <tapani.palli@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>
References: <20251217061728.35768-1-tapani.palli@intel.com>
 <773d97c4-defc-422c-a3a9-c7769f367493@intel.com>
 <e14dc32f-3c4a-453e-b0fe-09da137e172c@intel.com>
 <dfaff8d8-9158-411c-8feb-b2dfddf85e29@intel.com>
Content-Language: en-US
In-Reply-To: <dfaff8d8-9158-411c-8feb-b2dfddf85e29@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0053.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::21) To CO1PR11MB5169.namprd11.prod.outlook.com
 (2603:10b6:303:95::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5169:EE_|IA4PR11MB8891:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d093f44-8301-49ec-10b8-08de3d618ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHpPS0lRYXphRGdkNlRmeWZia2t6RDdodlJlRTBZWDQxTGtNRXVUK1BaSGFm?=
 =?utf-8?B?UVVhNHNheEFGZGtMSWhzT2pJUUZwd0kzMnZER1cvUWxCK3FHaXdVekFQRmpu?=
 =?utf-8?B?SkMzUm9zSmxZT212bHQ1T0pzRzVQcDN1QUJxbGhXSUVyTDExRW5JUVI3V3pG?=
 =?utf-8?B?RzB6SG9KY3QvcUxKR09RMEl2Q1JPUnF5dktGb205T2hjL0w3bVpXWXVUVnl4?=
 =?utf-8?B?eVZuSGhJZkN4TDhvUGlKQzRHTzhKVW1NVU9FSXdZbEsvb080Rkp0QkFtMmFl?=
 =?utf-8?B?ZHlCQXJkSHVPakozak9PRTdRN1llRDJpZG44c01paXNzKzJ1WFdzYWtkSDdw?=
 =?utf-8?B?Q2YrbUdqQzZCajZqM0lVN1o5OExmMnQyN0tYSWdCcjZuVVpsT0xwbzlOa2VI?=
 =?utf-8?B?VE9pdHBHb3VmamNRdTMvT28yTVZycHlVSXd1YVQxRGY3VmdyMnV1eGlVeml1?=
 =?utf-8?B?RU9uaXc0c0RZb25KMkJaVTdkd2ltUzU2a1U5cmVVNmRhb2pseEUwMjZWbmlL?=
 =?utf-8?B?cGFNQXVsbjVBM0JDNnl4ckRqSXF3MXNCaGVKa2lNYUxsYXQyeG1oOUpMZDZU?=
 =?utf-8?B?MG81L1pwYWloR3RJajdYdnVleXY4Y3BWZEdXRlEzcGVGSTV4UUVmZFVuMyto?=
 =?utf-8?B?Sjh4Q1c1UkJrWnJ3clBMZE5wSUI1NUUra29DQjdWZUFydU9tMW1HdEdMSGpq?=
 =?utf-8?B?NEtFZThwbzJUenZxSHdjUmtoaTR0V1YwWWlGY1B4MktrcU5NZFpsaGNBRHRV?=
 =?utf-8?B?L05UUm1WT1FKWTh0RU5vN0I5K3NCalZzYjhjaWF0NTVXeG54aHNCMC82WndF?=
 =?utf-8?B?WWhtTGVURlZiOWRpTVVFMkd1OGF0bDIrdFFGVURTbXJ1azVuY2FSZmU4T1NL?=
 =?utf-8?B?NDFjZ1JwRDJwNnhMWVZvaHBFY0tWejlYZzI3Rzl5ZElkaGQ0cW1EbFNBK3pQ?=
 =?utf-8?B?M2hzR2Q5a0c3dXNaNVI2dFBxNWR2Rnhya05taUxuSkdOSkxwZnRLYytGendp?=
 =?utf-8?B?Q1hEbEhpK0FGRXJlYTFYeEtmV21RWVdsY2ZsejMyUWZ5ZkErYTZ0M0xCd04r?=
 =?utf-8?B?akFCRDczelFETTVzbE5uSXh6aE01Vjl0anNHbkRyMnpTYUZDNlg5UktkQnps?=
 =?utf-8?B?SWphWW90dXM2YmQvMlRwd01qWGtvM09SS3NmbjFTMlljTzM5NEpjS3FVRUlj?=
 =?utf-8?B?ME9qRlNwbitRMmoxU0Y1V09VbHhualc5MHU3VzhmNXlnK2tnYTR4Ums5dXFN?=
 =?utf-8?B?d0tVMkpaTU0yQjZDZCs4Rys3cm9Ebk82R0MrbVl5NXJOS3BXZTB4aElNMXhE?=
 =?utf-8?B?Qlc4UENLcjFvY0F2SzVYV1pFNnlIQmlsVDZyQkEzZ0FRNXczdFcxeWRMREh1?=
 =?utf-8?B?V1IyVVdrMXJXOTA0NEw5WEFWWnFLVDRYSUpFR3c5dk1RRTNnSHJLb1haYnJC?=
 =?utf-8?B?N0VFeng3Ni9ScWdWSWpiMU1nSStESlU2b0JZSXpVMFp6cms1ampmUndFWHFL?=
 =?utf-8?B?VGIvTVJFbUJ4ZkVVQVRzRjQ0SWVHODh6QjF0WlliaVUzczE4TWJLOGRVb0VJ?=
 =?utf-8?B?NVQwMksya3MrTlpwWG9nbm5kanV3NW9oRENHUm5OMXJNUjlSaHljaVIvaEgr?=
 =?utf-8?B?NjRsbHVjblYxWnBHSWIzbE4zTzk0cytIdlFXMEZKclJUdWZSR3V4bVV5OXhj?=
 =?utf-8?B?SHgvZU9YQ1dDUnB0VjJ1emxBa1NYZkU0YXp5eFFzeERPYXJXdTZ5Wk5qMmtR?=
 =?utf-8?B?MUJic0FPOUU5cS9ndEUycWlyaXFBZjhkL3AvMlk0cXBuV0dEQlZtZlNTdi9m?=
 =?utf-8?B?eXhiK0N1ZlYxSkVQWldkenV6eWI5T3h2TitQNDF4ZCtPdWtrQ0xVOU5QbGNP?=
 =?utf-8?B?OFJJdzBGQ2llSXc0dVlnN3Q4SEYwNk9Yc0dpUFdDUWkwWWNuaGFseGZWd3JK?=
 =?utf-8?Q?KSU6mnOIT+a8gAaNWTSQq26Jxyh8APRc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5169.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEc0MVdpRmo4TU9JM0liQkFLZHZEcUZOOVo5OWRGcnlVT1BKWERvZy9UUmdw?=
 =?utf-8?B?Y1JqdEw3OHg4dGJNb21ZMUh2M2tBOVV5OFJSQUNaYy9iRUwwZUdmdlZiRkg3?=
 =?utf-8?B?THd0T3JoSWVFeDJwSmZQeThkSE1NbjRBUC85V0VhZFBlUTVYOFYvQ1JHazlp?=
 =?utf-8?B?ekswVlFnRDZuV1FzTHQ5Sm1JakE5UWxNRDJ1UFk2ZmZlMUdFaHRHaFhWQm54?=
 =?utf-8?B?SjMyOCtpbDBncXhMTmwzZ3Jwd1FaVHN5Mitxd2tBK0JNRWtSV1BtQUx4anA4?=
 =?utf-8?B?Zy9uTlJYUjIzNHhCQ3hFTXdXL2JNc1VUb0toUC9tblA4dVdkVThpekszcnRh?=
 =?utf-8?B?QkpMeGcyZm5OZG5KNmR5YzNkQkRvNHBkZTBXdW5tV3ZWT0tkT1hMYXNpZ0hP?=
 =?utf-8?B?bDRqcjBjZzVoQTd2azdOc2hTMCtDemlQUkRMR3FNMTREWkozMWlJUXZQaWNi?=
 =?utf-8?B?R1dNM3FnUTFOcWdPQ01xRUEyYWh1WWZ6L1pET0NUQnJLeUh3OXI0bmpTRkFH?=
 =?utf-8?B?NXZ1SThkc1k4cll1TGZzK3pvUDlrRXhnbDFwWHJmOXlONDgrUVNZZU54NEtn?=
 =?utf-8?B?ZkZqdlRWemxEZFlQYTlwNkFWQkVXTFhwdnJLWFdrR3NqWEt6OXZ3b3lNV0kz?=
 =?utf-8?B?TmNOckYzK1JPeWRGQjJOZVQ5TjFpRWgwRllvdlN0Z0NTb1BNak5CMG5qc3JY?=
 =?utf-8?B?enBqeldyQ0NDUEIzQ1ovVVBYU3lTdUlhTkRFWjBNVFBvbWwwZmtMUkFkYlJM?=
 =?utf-8?B?ekRjc0FYeU9McjFTMHcwaWc3cXJoTW9EeXEvVy9aQzFKZVlhakszOFEwZGJi?=
 =?utf-8?B?MFFLNjJLM05vdWVIdWNOYTExc1R6VTZ4V21QQUhaaGU2S0E3bjJMdXo5K2ZO?=
 =?utf-8?B?MDVZSCtnTmFLWGR3dFp1UW5IMUt5VDNzMUlJbFNUNEVmMHMwRGFVSHpVbTV4?=
 =?utf-8?B?Unk5WkZkZFZLWkJtWmtjRGorMDgrc2RGaHI1aEowSFlMblRSVUYwUXN2U0Zi?=
 =?utf-8?B?WnhLM1FzY1VxTzFCT3J0OXErSmozZks3d1REUlZtdnN1cU1qMVRKdEhYR0xj?=
 =?utf-8?B?K05YQlpkS016blBib3BXeUNBYUxkMFlyTUlUelRmQmdSVG9rMjl0Ty91QTBs?=
 =?utf-8?B?MlU1ai96MHRaUUM1Tm4zbmZvdXZOSUhwbUNNQzkrQWllUUhhM21BNWVUbk9C?=
 =?utf-8?B?eTh4aG5rM1hOZDYraGNhYVExYUJWVGd0MkgvVWV0bG5kemF4SE1VMDcwdENN?=
 =?utf-8?B?anNZcU1HM2tJWmNjaFBOR2xSVnYvVW1vZFo5RVF6dWJCcUdRZ3ZQejd4WFVW?=
 =?utf-8?B?SW9JTkl5cVFEZjBqeU5iazhETWtYMHM4RXpBY3J0cG9DaVpNRTM0L0RtWFRI?=
 =?utf-8?B?TG9kemphWlV5TVJ0dlBpc0RWNC94Z0RiODNBbXZ2YUxpdlpPYVQ4QU5pVExG?=
 =?utf-8?B?RDN1WTQ2OURTNTJhTmVDUUp2QVE5QjUzQTJockw4NkJ6MUlpSmZpN25rODg3?=
 =?utf-8?B?WkY1cmtVMEpIRmIxMGlYb1VNcCt1enhiQ2hsdHVvY050eFRmaEQ0Q0IyVkND?=
 =?utf-8?B?WUtBYXpRUmdBbkhZYVJyV3Q5NDB6OU1XUUFNQ2cxUUg5SEplSXBwQVJMcmdW?=
 =?utf-8?B?WDE4MDJCNTNPOXJObUdheGZGT2dHY2VpS01kUjdyTU9CbUI5OTVYYmdNWndV?=
 =?utf-8?B?dXgrcnlQeWJlSHNCeThleExVNGhpOVF5R0FtanVjMzVEK1p5QmpINWkxT1Qz?=
 =?utf-8?B?ME1sRXhiVzIzckxWVFJCbXNUdDhDRm0zaUlmbGs5SWl2MUFKYk9yU3NQQnJL?=
 =?utf-8?B?TFBTQ2FnNXg0eGczQ0QvV2pNVlIrT2N5dnZJWHdtY3ZlQ0pETm10T0ZNaVNZ?=
 =?utf-8?B?K21Sd3RDSlM3UERjdm16TDA3WFhIYStDNjRCL1VPeVptcnVWOVkrQ3k4NzZR?=
 =?utf-8?B?bWNtV0VXaWpmdnNoeGZVK25GZ1h5YWpZRUx5OHhBcFRVaEhJeEo5N3pMZ1R5?=
 =?utf-8?B?cy9za2hXWVhxSE5YK0tuajVERlVjUjhUTXdFTDAxc1NheWVaUGtVYys2d0FM?=
 =?utf-8?B?ZHFGTTYycHcraWpmZ201ek5UVzhiTFlRZEcwTjBqOUlBZHQwM29ONU5HbmFw?=
 =?utf-8?B?STJucGNwRVYxVXdodHdaU1NDODlVOTk2dDUrSjdlcW5ROGpyR1VKZ043TGo3?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d093f44-8301-49ec-10b8-08de3d618ed3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 11:43:55.3539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZljHywzFHgth4tGw3HhDULyuKdKI9FjPJwnfRjEk1UY7EPOBzLrb1rqYDhPF/NwjDbt3tTzxWZBUzFLF0RaiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8891
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


On 12/17/25 12:51, Tapani Pälli wrote:
>
> On 12/17/25 12:31, Matthew Auld wrote:
>> On 17/12/2025 10:27, Matthew Auld wrote:
>>> On 17/12/2025 06:17, Tapani Pälli wrote:
>>>> Helper function xe_sync_needs_wait expects sync->fence when accessing
>>>> flags, patch makes sure we call only when sync->fence exists.
>>>>
>>>> Fixes NULL pointer dereference seen with Vulkan workloads:
>>>>
>>>> [  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]
>>>>
>>>> Fixes: 4ac9048d0501 ("drm/xe: Wait on in-syncs when swicthing to 
>>>> dma- fence mode")
>>>> Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_exec.c | 3 ++-
>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_exec.c 
>>>> b/drivers/gpu/drm/xe/xe_exec.c
>>>> index 730a5c9c2637..ea368f02cb9f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_exec.c
>>>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>>>> @@ -184,7 +184,8 @@ int xe_exec_ioctl(struct drm_device *dev, void 
>>>> *data, struct drm_file *file)
>>>>           if (xe_sync_is_ufence(&syncs[num_syncs]))
>>>>               num_ufence++;
>>>> -        if (!num_in_sync && xe_sync_needs_wait(&syncs[num_syncs]))
>>>> +        if (!num_in_sync && syncs[num_syncs].fence &&
>>>> +            xe_sync_needs_wait(&syncs[num_syncs]))
>>>
>>> In xe_sync_entry_parse() it looks like it will always populate the 
>>> fence for the !signal case, otherwise throwing an error if that is 
>>> not possible. And xe_sync_needs_wait() will only touch the fence if 
>>> it's the signal case? So it seems like this should not be possible?
>>
>> Sorry meant to type:
>>
>> s/touch the fence if it's the signal/touch the fence if it's the 
>> !signal/
>>
> I'm not sure of the complete flow but it is quite easy to reproduce.
>
This "quite easy" meaning requires Steam and running games on a BMG 
system. Case where it reproduces reliably is game called "Pragmata 
Sketchbook". I can try to collect some more information, I earlier 
printed out stuff via drm_err and noticed sync->fence is null in the 
case. I'm not really familiar with this area so if you let me know some 
particular things I should be looking for I can try to find out.


> Here is the stacktrace snippet:
>
> [  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]
> [  118.410940] Code: 90 90 90 0f 1f 44 00 00 55 48 89 f1 48 89 e5 48 
> 83 ec 08 48 83 7e 08 00 0f 84 79 be 1c 00 31 c0 f6 41 4c 01 75 11 48 
> 8b 41 08 <48> 8b 40 30 48 d1 e8 83 e0 01 83 f0 01 c9 31 d2 31 c9 31 f6 
> 31 ff
> [  118.410949] RSP: 0018:ffffccec8ea7bb18 EFLAGS: 00010246
> [  118.410957] RAX: 0000000000000000 RBX: 00007ff23812f460 RCX: 
> ffff8c1790db4800
> [  118.410964] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
> 0000000000000000
> [  118.410968] RBP: ffffccec8ea7bb20 R08: 0000000000000000 R09: 
> 0000000000000000
> [  118.410973] R10: 0000000000000000 R11: 0000000000000000 R12: 
> ffff8c1790db4800
> [  118.410978] R13: 0000000000000000 R14: ffff8c178b67e000 R15: 
> 0000000000000000
> [  118.410984] FS:  0000000101aff6c0(0000) GS:ffff8c27350d1000(0000) 
> knlGS:000000007fe20000
> [  118.410992] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  118.410998] CR2: 0000000000000030 CR3: 00000001037ef005 CR4: 
> 0000000000772ef0
> [  118.411004] PKRU: 55555554
> [  118.411008] Call Trace:
> [  118.411013]  <TASK>
> [  118.411022]  xe_exec_ioctl+0x375/0xea0 [xe]
> [  118.411377]  ? __x64_sys_ioctl+0xbd/0x100
> [  118.411392]  ? do_syscall_64+0xa7/0x580
> [  118.411403]  ? dma_fence_free+0x1a/0x30
> [  118.411419]  ? __pfx_xe_exec_fn+0x10/0x10 [xe]
> [  118.411752]  ? drm_syncobj_array_free+0x56/0x80 [drm]
> [  118.411915]  ? drm_syncobj_query_ioctl+0x20f/0x460 [drm]
> [  118.412035]  ? __pfx_xe_exec_ioctl+0x10/0x10 [xe]
> [  118.412372]  drm_ioctl_kernel+0xae/0x110 [drm]
> [  118.412524]  drm_ioctl+0x2ee/0x5d0 [drm]
> [  118.412649]  ? __pfx_xe_exec_ioctl+0x10/0x10 [xe]
> [  118.412989]  ? __pm_runtime_resume+0x5f/0x90
> [  118.413002]  xe_drm_ioctl+0x61/0xb0 [xe]
> [  118.413329]  __x64_sys_ioctl+0xa3/0x100
> [  118.413338]  x64_sys_call+0x1060/0x2360
> [  118.413347]  do_syscall_64+0x74/0x580
> [  118.413355]  ? x64_sys_call+0x1060/0x2360
> [  118.413360]  ? do_syscall_64+0xa7/0x580
> [  118.413368]  ? __do_sys_getpid+0x1d/0x30
> [  118.413377]  ? x64_sys_call+0xf9d/0x2360
> [  118.413383]  ? do_syscall_64+0xa7/0x580
> [  118.413389]  ? x64_sys_call+0x1060/0x2360
> [  118.413395]  ? do_syscall_64+0xa7/0x580
> [  118.413401]  ? sysvec_apic_timer_interrupt+0x54/0xd0
> [  118.413410]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  118.413418] RIP: 0033:0x7ff29c93287d
>
>
>
>>>
>>>>               num_in_sync++;
>>>>       }
>>>
>>
