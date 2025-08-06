Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDBAC87FCA
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 05:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B5F10E39D;
	Wed,  6 Aug 2025 05:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGJDCKKc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1610A10E39D
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 05:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754458268; x=1785994268;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T3wOIwGPy9ndHELNfHNOMLq0I7D8h/l0cYYW0Pl28hI=;
 b=aGJDCKKcLLd2SN0yb9AZvHehm7Ut0dQcAAI573KEoaQ6YqSb0h9QQPcN
 0iYQzuAHP/Y5srUx6kVQulpv9mwGdoVlDiRYRTprcSJRhOZ1j04cDb86+
 gP6E8lYLwin3H2Zf1/XGEYKpRYunUbMiHW86s6HOp2rtA3xN1gDwzpu6S
 igeAwgFFRsAR1E1cnAIdXryLbp3WYtGGMc5Kv2kbxkRGdZXT6tIMBYl4Q
 UYLxkxetwZ2gPQYG2brcbqFDns6RUVndqDn8BQyCMtUZLddOUKmi6fcgg
 TebWjlyjNuuX6wVjWOlgYuVFNbUxJwwn1h27IL97WwH6eM7ceR+yKg8Sy w==;
X-CSE-ConnectionGUID: Ar5fVHqNRrW7g9SJ9H8y8Q==
X-CSE-MsgGUID: 2FbuFqMVSLKJK4PNJj3Ggg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="74224671"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="74224671"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 22:31:01 -0700
X-CSE-ConnectionGUID: 1oxpsLfRRgqa2CSFgQBjug==
X-CSE-MsgGUID: +N4af+WITye8kXNzSN01RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164587807"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 22:30:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 22:30:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 22:30:59 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 22:30:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbtpEQVtXHEdEY8rMYc0q64tCK8K+kDBFJgUPu05grD2b6OWdYVCoG9bcYOrtbvPS2ACubPacRxA8qBECsm2oI9+oBxAlPbfjoE/GQY6wFki4SmWHTheumNJ9Oh7/022EjV2zkeYfQYL3kSktNDh5SFMG7S2V0TZn6RTCQXM8QpVGLAA23hWNUySdleRV4mBp+gyQJmr6LfIyhhRPcZlVgPtvmChC6k46J8CZ4wtjmGfnoKTXjYPq55/gdVP/2kozAGXzIUnFYebIqwTiB+Ec5Q/1I6g1gVG/TgoLfa7JUs7t4zjVVb+9XCs85lR2RbJEaJy4EC/KMZ5r9kMDprsbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JzZYlP/v/h2X+26QCTL5G1h8iYDoejUod17+CvAyuQ=;
 b=TXaI7oJyAx1kEAMil2loSJU+R+ahXHE5AIxVpxlOEeB0H6Rm0kf6nwYJYvG+eMRocQuPM4cy1Mxjwe0bk+RhvKn6JKoEnlSyeI39gii0ylcbM7OQW8qOKw8N026wTZGexl8wmG2PRVJjqpnjT8LNv3Jw/5mt2bBtUcCW7CEi55ihISyC25CFQqRjdt5XwnxV+TcyGBCYupyNP29Zk2OMKHZIoUx5IqHCc3Gh7ibtrGunkN3ts05ryue0pA1NgX2yWCae4d+m3MLT99da0Qyc4h4pt5SL7dThASN96s1frB1hKudKmqXlliUv6uHH2Y6qWyPDhYA6LT/KycrvHc2LmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH0PR11MB5111.namprd11.prod.outlook.com
 (2603:10b6:510:3c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 05:30:51 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%7]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 05:30:51 +0000
Message-ID: <07f9fb1c-4376-4d4c-abf2-3e89920d43c8@intel.com>
Date: Wed, 6 Aug 2025 11:00:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/25] drm/xe/svm : Add svm ranges migration policy on
 atomic access
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-15-himal.prasad.ghimiray@intel.com>
 <aJJjqO836wXuAB2Z@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aJJjqO836wXuAB2Z@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::19) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH0PR11MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: 438abbef-98df-43df-57e3-08ddd4aa683f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RElaOTNSa1JTOG5SWGJNc3RZR2ZvL3RBRWFKT2pzVENJKzh0YS84ZTdsWGZV?=
 =?utf-8?B?UjBFaDlPWm1uZG9PNVMvZ2hIZUduY09lMVpHYVVScFByTFJiaU5waC81UWdi?=
 =?utf-8?B?cVFQUkNBVytvM0s4TnJmK0lYUnVYZTdNSXNxdjRTVkJ3N25XRGRpK0xzNjV4?=
 =?utf-8?B?ZVIxZ25pMENuQWtPbW9IQkFDSExSOEZTU0RSQzZKNkdmZXIxYVg4M3RCL3U2?=
 =?utf-8?B?ek5aaSt5RnE0VFlrWThQR1ErVW5sQmkwM0lYbk1jNkszWkxsWm05RWkzRERy?=
 =?utf-8?B?Nk5zQlhjb1F6WTAzcVBHVEQ0R2RPeTZ1TVlZTzBFa05PK2tucWtkd01Sa3RO?=
 =?utf-8?B?cnZuclhtNXQrNUN5STQvenpqRGhQQVl4NlpkVUxYRzdlZ0tvcDgwaWgzVU5n?=
 =?utf-8?B?SGxwZ0lqbDNiS21sNXpiWEZFbWwvSzdxZFd2RC9OU1dZbi8yOTI0OERNYUpi?=
 =?utf-8?B?Qm1GQ29KTnJDVzhBcENkYVROemR3aVpBcTBMaGJNK3lLckdrRjRuYnJEK1ZK?=
 =?utf-8?B?aU1RcEl4SDJLSVhvTFpBa2FFNjA0amxzZzl0aklOcDZlS3RnRjh5U3Q1dkNv?=
 =?utf-8?B?TktNeDhuTFppblNLTDZpWjJjcUFpL04yYnVCamJjT29KZXhlaExyUjl2V1Zs?=
 =?utf-8?B?eHZoZkpvZWlseEhnT3duMWR2UVlMcm84WG12WmtQQnlSVmR3UkpCNThFajNJ?=
 =?utf-8?B?QXRZcFpHVE16ekJhS3d1YTV2dDF4dEF4dG5PNDRWVUFZRWxoOFhiK0gwenl5?=
 =?utf-8?B?d2Nack5rbG42eUc5ZWJjSFhHWjIvVHdTamowUWpSSDNSTVlsVHdxOVJKM0o5?=
 =?utf-8?B?a1c3cHJuUE9hcEtnVVE3ZG1RNFZrS1dUT0lTcWFlUXdLQS80emJqTExHd3JG?=
 =?utf-8?B?WWwxbm9VK2Q3VlVkYUtaNDVLaGJyVkxUWDR3QStjeHlsZ3E2cDc1bjVuRVps?=
 =?utf-8?B?K1pTaEduZlQ2RHRPVUE5K3ZDNW51VDF2T0tmVStOb1E4Qk1tdnFqTk9Jd3hl?=
 =?utf-8?B?ZkdaREpSS3QzRmNqYlNzVmNHaFpaWWYyOFhFYWtzVi9GanNRdDkrSXY1b0Rt?=
 =?utf-8?B?Nk9nOWdKaFdtK3p3ZXVtVUlaTXpXejBxR2dKd0RQZ1M1K1FFcjQycTdYVXQ0?=
 =?utf-8?B?SlBPaHM0Yk5hdjQzVmNJOFliQzUzZFYzc3h4NXFmeDlCVGZhbWtaZkhxbm5r?=
 =?utf-8?B?L3VGcDZnZ1lnRUNJOTFzWnJUenpEOUZzNTFzSldwSmxWNUI4M01ndUMyV2N4?=
 =?utf-8?B?SkFzd1M3WFpjU0s0RXFTeU9CZ0paM1BVbHArSEFpKzlDMm5sU3A4R0NWelo5?=
 =?utf-8?B?ZEtEcEhjZkpVVUp4QmFuUjQwNFF3Q1RZMExJVFJiUWhGYzBrZTZmeWdiZm5R?=
 =?utf-8?B?M3luVTJHVlBOTGVHbVJVNTdZZk1BZkx2VjkxRkVsejVTM3BLN05wS0xHS3B3?=
 =?utf-8?B?V0RpejJhNkZKcS9lV1QzaThaMGMyeFUydll4RmU4YWEwaHZUd0ErZXRHNDlL?=
 =?utf-8?B?VHdGOU1NNnZlWEdydmVldkMrOXhyNWZ4SkxmY0lFa0ZCQlVHTWNGaTd2UmNr?=
 =?utf-8?B?bmNoTDJua09pS2VPWWNqQis3Ynk4c1RpZHdRekFNTStGUVFxekxEdENNV0s0?=
 =?utf-8?B?NEp6YnF6aFlobVg2MGtKZ3hrM2Nmb0ZkYUltckMwMmVWQWhIOUNSa0c1N2lN?=
 =?utf-8?B?czNMWXZCMHlXYkNoTWRZZ24zTjhmT1VyazErMnFyZXdVOFp1QWlJZ0t1OSth?=
 =?utf-8?B?Wm95OE9XQzJrVG84TUdWeHNKNWU1QkRwbHcvZkxVSWdSd3BiTmxiNStCNllS?=
 =?utf-8?B?bmdpSmJodDZldnAzS1ZBWnVad3Bmc0JETHl1T3RxMnBYMktBemN5Z2RWSW1L?=
 =?utf-8?B?Q1ozWnNaRUtSNElXYjNaVnFHcVdMaWZOcndIK0Zudm1tbFZPK09sOXhmNkNk?=
 =?utf-8?Q?SBoSGXu6z1k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXppRndYUklKTG8vRkpiMkIrSzdiNnAxRlVINGN4Y2pLMEZJWVpLN1ZNclo1?=
 =?utf-8?B?SUFjcjdicWMza1ZhcGVWb1IyYXA0ZFA4MGlKSzZndzVFUUJwWUtDWXBCQU5j?=
 =?utf-8?B?VTE2eXJoak9hQ1kxaEU1WDBxZVErTDFxUnhpWUJ3UmhybFo1ZzVZamJ3ZGt0?=
 =?utf-8?B?a1dCNDVsQkNaTE9pMXRSVXpuL2NWR1N5MHVVMzJuMUFRYzRaR1dmcysxazhm?=
 =?utf-8?B?eGdoSU83M2JaaGVDRWJOWjZjdjBoYUpLVEdIK0UyR3cxV3lMcWNLdVZ1TWY5?=
 =?utf-8?B?WmdYRmFhcXVYNEVaaUdQZjhhaG5wb2RkZmoyREM3Q1REdm5mb3FmdW5UVzRv?=
 =?utf-8?B?MnMxSGQzT3VJZzFsci9DSDcyUUhyNU1JcXo4SUcrTVA5d3NrZjNLYWUrampJ?=
 =?utf-8?B?azRHaml5ZldKRDhvMmdrRmxveDdRa0FLYUgvRk1VMmt0STQrZzNZdk82ZkN1?=
 =?utf-8?B?M1NzUmo5MHJmblZ5Vi9BRE5YL05seEtzcUdVRkF0TTBWZE5jbHhFaEJXY1ZF?=
 =?utf-8?B?N0NUNkYya2J3N04wSHlRZDRrV2hIdVM5c2pzRUZib0JwaTk2bzNNWStrMXdH?=
 =?utf-8?B?ZVZMd1VGcDhSd0xZVjdJbWZMTHF1dHVWOENnMStvajhIeFJ4UVZaRXlONk53?=
 =?utf-8?B?WEVGN3hVRS9uSXMyTXBmWFdlOTYwTGFHRC9RNXBNb2ZJN2U3YjhMZndaa1NI?=
 =?utf-8?B?cGRBUzdCZW5yQWYxRjZNVUF2UUV2dVdLUThaUmhFYTdPTkUxQUFoR052ZXRN?=
 =?utf-8?B?cDBxZ0htYXpKS3NJeWhmQ2VmQm1xQmNLU29PeW5VcGlHWGh6MWg4WDE4bkky?=
 =?utf-8?B?aGQrdzQrU1BDcDQySDVTOU5EYmhZcFJROWFWSWZBcS9qTXdoaXgxeURwZVI4?=
 =?utf-8?B?aG5kK09ZKzlZTlp2NHB3Y1pPSWg3a0IrY056NkplL0IrVUFLb2RrcFdoZ3ZW?=
 =?utf-8?B?SGl6SC96QkwwRUtZa2NQMnB1MGMwSlRvdU1lQ1lpcE0rTldnUzJrL1hrMit5?=
 =?utf-8?B?V0tUL2c1OWlObkdzWERVME1DcURCbHJOVkpvTzhlMTU4c0ZCSkc4RERiZU9G?=
 =?utf-8?B?VUltcW1LQm1pY0g3UVZNR2s2dGM0aHNJUGQ4Rk5jbC9KODkrN21tTGpncm9n?=
 =?utf-8?B?OU13TnluTURmTEtaTFAwMTd3alh1WkZUS1lqUzNZNmJ2NFRWdFFobTdYcVlT?=
 =?utf-8?B?UGVCY1l5RDdIeC9ONFkySko1L0lyVWJmZ20yeXZEWTdzTEw5TXltUlU2NlU2?=
 =?utf-8?B?b3UrcDhBd0xFMnBpeWYwdG9VMjlFRzdXTTkrKzV3dmRMZUw5WUo2TkNFTnFY?=
 =?utf-8?B?UHZxQ2Q4NFhFNWk4NEhxalVidER6SXRkQW9adTc5eDk0UzBWY1hWbVR3bHNS?=
 =?utf-8?B?L1ZMMkN4VHQyRWlGd1BNaUdaM0loTHg2eEVNWHg3N3RKNW0wNmwrUmFNR1FQ?=
 =?utf-8?B?VllJTXExTm9oOUZyaTlMaFIzUllDVklER3dwUkpGay80dGRUMUNCaDhlVnBF?=
 =?utf-8?B?L3hMNEZ2QmNTbFBQc21Hb3V0bjFvSmxaS2FWT2I4L2o5bTIwVStYVEdTNm5n?=
 =?utf-8?B?UnJBcTB1TW1kOFREcThiNHhnYXpJK2lBUHcyT09vTzUzbEIxdmVPUW5FRnM1?=
 =?utf-8?B?ME90S3FLZm5PYVVkbkJ6M3diOFgxS092QUEvK1R0K0o1WVV4dFA3WW83Q0VU?=
 =?utf-8?B?TzF5L1FRV2FYRzE2R2xwVnA5SVpoaGVXQ2xkUXQ0VmJ0a0l4bUw3dzBqQlFE?=
 =?utf-8?B?SmNIT1RYZmF3cWhNU283ZllSbWY1eXNqQjN3MXduVThuR2RJU1RQdk1iWUV3?=
 =?utf-8?B?eFNZRWc2RHhWR2JkcTZiNGhTZGNsemhvODNqWkhjeG85YWFqSUkvSHFoSlVW?=
 =?utf-8?B?VHBJMzNRYTFEY2p6dXhTY1FZUEVvaDI5NjN6Q2lsSXBFbm9PbW1xWFpPenBk?=
 =?utf-8?B?RVU0cmg2R0wrNHE0RGVuNlJBNmV3UmNXSFRjaGRYQVpOY2lRcTMyVmF0b0Zy?=
 =?utf-8?B?Mm4zb3orYlVTN1ZBQU1UT3ZwdmY5VXYrUGlGZXU0TUw0b3dEcDdLbEx4SkE3?=
 =?utf-8?B?SjdPOEtZRk8xWjRWM2UzSy93WE12SHg1VEtqaFYvSGdzQjY4KzQwK1Y5d0ZF?=
 =?utf-8?B?cmNlNU5uc3duZmpKNUNlcURPTko2U3FGWHlGeFBUenNZQldwczRhZzZBQmFS?=
 =?utf-8?Q?tUUuXh4RMfMDx63BitCJ6Ik=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 438abbef-98df-43df-57e3-08ddd4aa683f
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 05:30:51.8200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9VEzfHVNYrK0hAtW4PXEmWtvpdd44vpf5b1KFqUnZ2I5Dn8HU4mvmfJcm9vkVyAk2Fm8LHY24YbJBTE8vyee3r/t9Zh7VSQcpegN3dDu3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5111
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



On 06-08-2025 01:33, Matthew Brost wrote:
> On Wed, Jul 30, 2025 at 06:30:39PM +0530, Himal Prasad Ghimiray wrote:
>> If the platform does not support atomic access on system memory, and the
>> ranges are in system memory, but the user requires atomic accesses on
>> the VMA, then migrate the ranges to VRAM. Apply this policy for prefetch
>> operations as well.
>>
>> v2
>> - Drop unnecessary vm_dbg
>>
>> v3 (Matthew Brost)
>> - fix atomic policy
>> - prefetch shouldn't have any impact of atomic
>> - bo can be accessed from vma, avoid duplicate parameter
>>
>> v4 (Matthew Brost)
>> - Remove TODO comment
>> - Fix comment
>> - Dont allow gpu atomic ops when user is setting atomic attr as CPU
>>
>> v5 (Matthew Brost)
>> - Fix atomic checks
>> - Add userptr checks
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c         | 23 ++++++++++--------
>>   drivers/gpu/drm/xe/xe_svm.c        |  8 ++++--
>>   drivers/gpu/drm/xe/xe_vm.c         | 39 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_vm.h         |  2 ++
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 15 +++++++++++-
>>   5 files changed, 74 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 593fef438cd8..6f5b384991cd 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -640,28 +640,31 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>>    *    - In all other cases device atomics will be disabled with AE=0 until an application
>>    *      request differently using a ioctl like madvise.
>>    */
>> -static bool xe_atomic_for_vram(struct xe_vm *vm)
>> +static bool xe_atomic_for_vram(struct xe_vm *vm, struct xe_vma *vma)
>>   {
>> +	if (vma->attr.atomic_access == DRM_XE_ATOMIC_CPU)
>> +		return false;
>> +
>>   	return true;
>>   }
>>   
>> -static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
>> +static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_vma *vma)
>>   {
>>   	struct xe_device *xe = vm->xe;
>> +	struct xe_bo *bo = xe_vma_bo(vma);
>>   
>> -	if (!xe->info.has_device_atomics_on_smem)
>> +	if (!xe->info.has_device_atomics_on_smem ||
>> +	    vma->attr.atomic_access == DRM_XE_ATOMIC_CPU)
>>   		return false;
>>   
>> +	if (vma->attr.atomic_access == DRM_XE_ATOMIC_DEVICE)
>> +		return true;
>> +
>>   	/*
>>   	 * If a SMEM+LMEM allocation is backed by SMEM, a device
>>   	 * atomics will cause a gpu page fault and which then
>>   	 * gets migrated to LMEM, bind such allocations with
>>   	 * device atomics enabled.
>> -	 *
>> -	 * TODO: Revisit this. Perhaps add something like a
>> -	 * fault_on_atomics_in_system UAPI flag.
>> -	 * Note that this also prohibits GPU atomics in LR mode for
>> -	 * userptr and system memory on DGFX.
>>   	 */
>>   	return (!IS_DGFX(xe) || (!xe_vm_in_lr_mode(vm) ||
>>   				 (bo && xe_bo_has_single_placement(bo))));
>> @@ -744,8 +747,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>   		goto walk_pt;
>>   
>>   	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
>> -		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
>> -		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
>> +		xe_walk.default_vram_pte = xe_atomic_for_vram(vm, vma) ? XE_USM_PPGTT_PTE_AE : 0;
>> +		xe_walk.default_system_pte = xe_atomic_for_system(vm, vma) ?
>>   			XE_USM_PPGTT_PTE_AE : 0;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 1d0b444bf2ae..5e78beebe114 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -793,14 +793,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   			    struct xe_gt *gt, u64 fault_addr,
>>   			    bool atomic)
>>   {
>> +	int need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
>> +
>> +	if (need_vram < 0)
>> +		return need_vram;
>> +
> 
> Does the compiler not complain about logic before declartions?

Nope.

> 
> Either way how about...
> 
> xe_svm_handle_pagefault()
> {
> 	/* Logic above */
> 
> 	return __xe_svm_handle_pagefault(.., need_vram);
> }

Will do it.

> 
> Matt
> 
>>   	struct drm_gpusvm_ctx ctx = {
>>   		.read_only = xe_vma_read_only(vma),
>>   		.devmem_possible = IS_DGFX(vm->xe) &&
>>   			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>>   		.check_pages_threshold = IS_DGFX(vm->xe) &&
>>   			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
>> -		.devmem_only = atomic && IS_DGFX(vm->xe) &&
>> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>> +		.devmem_only = need_vram && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>>   		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
>>   			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
>>   			vm->xe->atomic_svm_timeslice_ms : 0,
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index d039779412b3..463736db19d9 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -4183,6 +4183,45 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>>   	kvfree(snap);
>>   }
>>   
>> +/**
>> + * xe_vma_need_vram_for_atomic - Check if VMA needs VRAM migration for atomic operations
>> + * @xe: Pointer to the XE device structure
>> + * @vma: Pointer to the virtual memory area (VMA) structure
>> + * @is_atomic: In pagefault path and atomic operation
>> + *
>> + * This function determines whether the given VMA needs to be migrated to
>> + * VRAM in order to do atomic GPU operation.
>> + *
>> + * Return:
>> + *   1        - Migration to VRAM is required
>> + *   0        - Migration is not required
>> + *   -EINVAL  - Invalid access for atomic memory attr
>> + *
>> + */
>> +int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic)
>> +{
>> +	if (!IS_DGFX(xe) || !is_atomic)
>> +		return 0;
>> +
>> +	/*
>> +	 * NOTE: The checks implemented here are platform-specific. For
>> +	 * instance, on a device supporting CXL atomics, these would ideally
>> +	 * work universally without additional handling.
>> +	 */
>> +	switch (vma->attr.atomic_access) {
>> +	case DRM_XE_ATOMIC_DEVICE:
>> +		return !xe->info.has_device_atomics_on_smem;
>> +
>> +	case DRM_XE_ATOMIC_CPU:
>> +		return -EINVAL;
>> +
>> +	case DRM_XE_ATOMIC_UNDEFINED:
>> +	case DRM_XE_ATOMIC_GLOBAL:
>> +	default:
>> +		return 1;
>> +	}
>> +}
>> +
>>   /**
>>    * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
>>    * @vm: Pointer to the xe_vm structure
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index 0d6b08cc4163..05ac3118d9f4 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>>   
>>   struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
>>   
>> +int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
>> +
>>   int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index b861c3349b0a..a53b63dd603d 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -85,7 +85,20 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>>   			   struct xe_vma **vmas, int num_vmas,
>>   			   struct drm_xe_madvise *op)
>>   {
>> -	/* Implementation pending */
>> +	int i;
>> +
>> +	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC);
>> +	xe_assert(vm->xe, op->atomic.val <= DRM_XE_ATOMIC_CPU);
>> +
>> +	for (i = 0; i < num_vmas; i++) {
>> +		if (xe_vma_is_userptr(vmas[i])) {
>> +			if (!(op->atomic.val == DRM_XE_ATOMIC_DEVICE &&
>> +			      xe->info.has_device_atomics_on_smem))
>> +				continue;
>> +		}
>> +		vmas[i]->attr.atomic_access = op->atomic.val;
>> +	/*TODO: handle bo backed vmas */
>> +	}
>>   }
>>   
>>   static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>> -- 
>> 2.34.1
>>

