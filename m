Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C39D606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GOMNlrgX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1D910E0E9;
	Fri, 30 Oct 2026 14:13:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E61B10E0E9
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 14:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793369615; x=1824905615;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RADahiU1gjjPGaW8KM/TkDRaM/wP/IlKopBoGRh8F+M=;
 b=GOMNlrgXsn5iV+ZHy25NbuqXJJY/YaQ1gVY0+jNDxz2VVy/auPbok/40
 4dAJy1dtSmxHJQU1kWZRUgV0mFK0RqxFcvhTcpo1XI8GfI9RmahdnHzz1
 9TpH6nAxUO8kDYQlTbPOKQXVJsUWrMrFv3UfMV9N0/1opFucY6T3N+9FZ
 qdYCXY6UqhMrucB83+EVC/2Fw706HTjzeVaqdPuR/dKF+l9Pk4dHZ2fmT
 ByGBLzt8VAiDjqpUPHUoAb/e8dH2rZFjcH6N30vq86lhudYFf9qibfaUy
 NzWPr74o1Mgi8mnIfuUvjyabd/COg+DhXdSxBkvD/wSU/C/vUNlQf6jKg A==;
X-CSE-ConnectionGUID: 9aLqhDE6TWeFHiGVLU7v0w==
X-CSE-MsgGUID: BgLIxra0Sg2T3bBkyBeMcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2166889"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2166889"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 07:13:35 -0700
X-CSE-ConnectionGUID: N7rl2yJwSRiXE3HiA+uEtw==
X-CSE-MsgGUID: foH0owRGQY6NXc8+y+OxgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7270409"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 07:13:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 07:13:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 07:13:33 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 07:13:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeRfhbYpiea94vyGi22hxGHWAWTWs2SQtkn6bhKFY/vENDQ3gVR+rv117EtjGnoB6G+mTKL/lSkBDB+b4XN99pi/ZsLJvCmGHR0PqU1b2IY5d23m/WdwqnU7pIZgq/XjxBq+KZtXa7aVf0LtwaG/A3K1j2201jzv9dKukeesPIxcKY3vkpa+hWWqZwLkZv7yXYCwORKGxPclRQzcS0Cu9UUz0CW4myZXb/hPpNFfNhFY0x6VTrPZbC3cBlKm0697bIrNoRIfyAjAcko13nKeFq5l7faMw9XmFgnpz3JvIoy6f+c/7xOm0gduHs/+zv+VZKNXMmjm2xIfQeXCIHeItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdBw/XJzFbD6gPUjMSgUBXldm0+CzDVsi3LvlBBPlYg=;
 b=aUo8U8evLR1henQdajgnL2VpRKlrq8poWU3CmWuWZ/iUg0vVRxwpsWgHox7sn1VEbhoMUpn9KTbxpuyIiaSBWsr5tDOWYWhVyV0Px8PplQQTzZi8gfiQMc6yzW3X2jXjzEgOSnI1zqmEZ+kuIwmjlp1bmOidToo1t8CZuYddB1UqDi4M03kifkGevvPqLW0ePs1e+wkm/VpsCNe3RlwMzpLSWFMkuPQmcLYnt8XQotv6gWrn/9PykvcjlVkExHkY2Y4fX5NpwD8Ll1ScfZQiim4V3l4ee3L4CJIlnXm42eTpAVCHkMHrQNQYzSm3o8AmZaACTFMOpTzV8sTKxdaUZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by SAAPR11MB845451.namprd11.prod.outlook.com (2603:10b6:802:303::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 14:13:26 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 14:13:26 +0000
Message-ID: <37efee46-93fc-4f65-ad23-33b4666351cc@intel.com>
Date: Fri, 30 Oct 2026 19:43:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/xe/xe_hw_error: Handle non-fatal errors routed
 via direct IRQ
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-15-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261026060459.771448-15-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::14) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|SAAPR11MB845451:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d818ba-994d-418d-2c22-08df368ff6c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003|261026121527099003|261026140227099003|261028144727099003|10067099003|261021123027099003|261021121427099003|261022113327099003|261022105027099003|261022075727099003|261009223027099003|260925022911599003|260925021911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: qnl6CVnNBwNSzVBFAaU5oHggz5otUxSVB2zYsCkaignIupPjNbtp4nydzh5xUVNVM0Y26z34P32B2hYMj1nRYvnbMTqrSK3/Of9YR3uRhvEnBLoarGxmxp00P28FqO6mf2NbXo9jU4yzV2dmjd7hXaon7S4G4vQNZXb2/3VknOz/La2bbDg6r1+q7b2qh7UVOmY/OYixfRHFd+yDm9HYQdjOJZlNorvvHBdLmnKXRhr0tnhJ1nzrgmIMH4BPyDsbqZTWMCQhPMHDjYs30XBTMBK40rfiyuYjyoFCOk3oVlqQYSZtLy0V0WOh9MDS9RQ2yvxk2Ew1xcMknhYEenwA8WUC87FO4d/zTXyhY1IfnPyGvJB1WK0BW6Pn7W7PehzZtssBy0LvcE/iA8SiGeUI3B7iY6h1Dk0MA7Sn7zEc5STUOSwuihbUQg9bUqzEd+EdpHWhmRTfl+kzM4sH1Fc7Bw6VFBr2v8WJX+oExybsFkdZKOd6bnQ4tgoxfk2AYvY3aIPurRN9E4VItbC2aI9MvOxybChDo1k33iycdGX3WGBqZ2+j92Zk2lZTecOFm49KMAt/uU1c1uq/YnommUDP6i/xBUoHcC3tFRbT2mNOZxTEqWej0O0k7QCR73rPoyXDusoegMU+C6+7BoizN6LE6i6SpZkRIO01OpzD85Qtvxw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(261021123027099003)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003)(261009223027099003)(260925022911599003)(260925021911599003)(260925021311599003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bS8zOHdzWUxWMHE1ZkwxTjFvSjkzQVU1ZS9JckJhbmZkRlRBQlNIMkVjb0VB?=
 =?utf-8?B?SUU0RVlIL0lHTHVqRnlmOEdHRTMyTHdsM1dKWnNrSGlpWnEzbGU3K2hXbDlX?=
 =?utf-8?B?V2JQZHFtRWpucHVKM3pEdkNFZjlDTlVqbTk2VS9NakhrUWRBTGh6VVgrUXdF?=
 =?utf-8?B?Z1lIVFR0Yk4wQXJjeUxHY2ZUVEpzc1lrY01sajEzcWNiVVIxanBBandNMU5l?=
 =?utf-8?B?b0p6c0tMSjM2Z2l6WUFIUzJBcWdBeTJYbWw2L0hlcnpYdEVSNWJYc21aZjFj?=
 =?utf-8?B?MUFUdEdlemY3bTRXRjB6VzdJdW5GT1J0QnB4bzZkSVp1bENrb2N3d1lzcWhG?=
 =?utf-8?B?ZXBpeU9xcGJ5Tk5ycjVRVlE0SnowNXdUZnh3Z29BeUd5clV1WGRmenlaZmto?=
 =?utf-8?B?T3FCNlAwZkliZVBLVDNYb09oZFBteVZZZnN4MUl5UFAwVXhUME91clVUaGIy?=
 =?utf-8?B?aDF0UFdBMC9xZ0NtS3p2RzNtNWhZcWptRkhjVSsxUEdSQUZUREpFN2VucERB?=
 =?utf-8?B?SWdySXBYS05FK0Yrb0tzd2lNa3hDZDdhS0pzL2hVREJSWTNxS0F6RXEya0My?=
 =?utf-8?B?eTIzd1VCOTc1SnM0bmNQVDFFMi9ZaW81N0VnYzVwbEZXdTU4MXJsT21NVlh2?=
 =?utf-8?B?ZUVDQlgxbjVHeDZ1MGZFZjR2SzN1QVhaSW1uLzdnSGRiMkdBRGJGRytHVGM5?=
 =?utf-8?B?ZktRSG90YVlObmIreW1XM09pTnhhSjhxdWRTT25pSWNsM0FYV1M1U2UwRnkz?=
 =?utf-8?B?SzJWNHlNbGwyOFFwcjNvMUdWS3RJVmVLTHhyV0g2dFFlZ0hoTm96WUJTNFg2?=
 =?utf-8?B?KzJvUXFZUWNRM2NtVzkxUy9JaUJZeElOU3ZrbnZyaWkyZ0g2dnJ6UUlkVWl1?=
 =?utf-8?B?ZGFlUVlBcllDa09vSTVyb1gyeGVNNmNBUko2VGl2S0pnZGNmSUpleEplWE90?=
 =?utf-8?B?SW9BMVVYTFRpbXEvb0ErTS9qUml1a0s3azhqUUNJREtqcEcxNkN5U1p1V2JV?=
 =?utf-8?B?emcrU3dwTU53cGVlV2d2V3ZHNmJ1QTR5czZiWXBQbktMQ0NRUzA2eGoyY3d6?=
 =?utf-8?B?YWtTNEd1YjBCeCtoWGx6bGVSemUyUW1VTjY0ZU5JTlJXeTlyQU9vaHpqTGVo?=
 =?utf-8?B?SEpJbkkwOUU1UDZUcXB6SktDNUJOa1BncXU4QjJSK3g5WlVTd2FuSHpxRmhr?=
 =?utf-8?B?czlkaTdRVk5nQkRMVGlHZXlOaHJ3OTJCRmhBUXhGSzNEd3hPUFllODkrUUdq?=
 =?utf-8?B?TFFqVHVzeFVmOVFvdUxpbStQbERWRktiV21KSUZNaUZYUjdtVC9DNjk4Q01S?=
 =?utf-8?B?dW84cC85Z2hhYk1IbmIva3ZualQxcWZVYUttV25Ld3lzbWp3ZmtjdytRL3NP?=
 =?utf-8?B?WkF4eld0bkdWanE1YmNqMlpRR2pOTGF6YmlUZ0tLaXpSbGZ4RTc5MzRpNW0w?=
 =?utf-8?B?SmZ3eitkWTNCQTFuMlgvdmd1OW8reW43NkZKYWtZS0x3bnNPU1JGd0QySE14?=
 =?utf-8?B?VjM1bXp3TW5GcmNabWc4VGg5S05YcVFJZkJ3ektybmU0SmhiQTRVYWU5dUt0?=
 =?utf-8?B?ZjRxNVVicjQwQmt2YWd1TUV1TXFMeXBZWjNBRVRWdFlrdlQyTDMvU0hOL0Fw?=
 =?utf-8?B?ZFFURE9Pd1h2dXVFZ3pPTjdMNi80TjBpdXViTlpXZ1k3NHA5NTc2S01yK2hv?=
 =?utf-8?B?V2Zydk9JSVpFMGUyKzBTeG9Yd2o2SXRLemxFS3RMejdMb3N2SHlhOEcvSU9Q?=
 =?utf-8?B?ak5sYmtxVFYxT011L3Fpek9aSU13UTNaMXRyQXl2R0NqMTZHWENDMW9YUjVR?=
 =?utf-8?B?Q0VvemdnTHlLakVHNmpsSDBzM05NUXd0YkdyT3REZVRLWSs2R1g4L3IvYVRR?=
 =?utf-8?B?dWw2UnZTeEtDWGF4aFhtSm1TNUhBY04xeVZnYnkxTXJQNnBXZ1hyZUNGOHdU?=
 =?utf-8?B?MWVLZ3YrRHBWMUl4QndhQkhCMjZuMnJiMENKWHg2TnRJMGtZeHNGVDBxYTRY?=
 =?utf-8?B?ZkJ2V0krRU9wa1BQVGpUZS96OVZ2YjBRL0FCeklERGZCdzNNZXU1QzRZWFdP?=
 =?utf-8?B?Y2l5V01YeFRURjZNSmF5VDJiWEdLWFhUNUpvT1ZkQ2J0UlNkdUYvUmdMVmR5?=
 =?utf-8?B?MkJwZzc4R3NHOGErNmFnSGhORm9PSnVTNjF2WGpOeHFicTNQNk01am4rZmVq?=
 =?utf-8?B?cU1OemJRdEp2dnNDVGRjK0lJTnJXbFBGbERZLy8xNEZVa08yZ3AxbWFLL1JL?=
 =?utf-8?B?Q29pcTRIZzRlZ0JCMVdWV3JqSElkTTU4MEh4bUhFM1V4ZzF6VXE3RERaRkdH?=
 =?utf-8?B?STEyMWxTbERydHhwSi9lbmY5c1k0M3lJdlJHNDNlSllNOEhHeHNEYllMZDZ1?=
 =?utf-8?Q?T+Ya9Y5XqppAOJeg=3D?=
X-Exchange-RoutingPolicyChecked: U/HZf7D+jKIrZwpHuX4BArxnJC9HLJKFYQgV0cE9gdFf5lvStD+4L3F8IZxO3jJTjUkdSAfCa6W+FUTm/tgSI1zTlhs0GLZiwUsEzt1uEr/8Z3PEOBz0wuUZdo3kgMvwfpprFd61dJ8o1ANbAG9nThJV2flfr41pLofxjFEYpv6HBHAxFjqPWh1exf33qSrLSPRHPX8WUb23UenonrPLs5ozxpEUyjY/UjOeYmGy4IzuUgCtq6w489oQch+9LEnYw6gjnH00KclICRXavkpXz1HaXkyPnbX8AAF59oOeD3eRuvtXMspun/kWZsC/l0GOM1sevQyL8tWwExBIWyJzhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d818ba-994d-418d-2c22-08df368ff6c1
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 14:13:25.9851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9U9n9XbLI03YDGSixjVvPYqwthz9cdEzKtDyJoZq9uOLKOFxnaOlXNeyYApE9Vo3TDbKl/Vn+aMSn04HB0PTbydnDQarY68VsdGJ3jsvok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAAPR11MB845451
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26-10-2026 11:35 am, Riana Tauro wrote:
> Process, log and recover non-fatal errors routed via direct IRQ.
> Double-bit ecc errors belong to non-fatal error category and are reported
> via irq. For pages that belong to critical BO, wedge the device with
> bus-reset as the recovery action.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hw_error.c | 37 ++++++++++++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_ras.c      |  9 +++++++-
>   2 files changed, 41 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index f7799c3c08aa..269ce6a19a80 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -5,6 +5,8 @@
>   
>   #include <linux/bitmap.h>
>   
> +#include <generated/xe_device_wa_oob.h>
> +
>   #include "regs/xe_gsc_regs.h"
>   #include "regs/xe_hw_error_regs.h"
>   #include "regs/xe_irq_regs.h"
> @@ -15,7 +17,9 @@
>   #include "xe_hw_error.h"
>   #include "xe_mmio.h"
>   #include "xe_pm.h"
> +#include "xe_ras.h"
>   #include "xe_survivability_mode.h"
> +#include "xe_wa.h"
>   
>   #define GT_HW_ERROR_MAX_ERR_BITS		16
>   #define HEC_UNCORR_FW_ERR_BITS			4
> @@ -166,12 +170,36 @@ static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
>   						 pvc_master_local_fatal_err_reg : \
>   						 pvc_master_local_nonfatal_err_reg)
>   
> +static const char *hw_err_to_str(const enum hardware_error hw_err)
> +{
> +	switch (hw_err) {
> +	case HARDWARE_ERROR_CORRECTABLE:
> +		return "Correctable";
> +	case HARDWARE_ERROR_NONFATAL:
> +		return "Non-Fatal";
> +	case HARDWARE_ERROR_FATAL:
> +		return "Fatal";
> +	default:
> +		return "Unknown";
> +	}
> +}
> +
>   static void hw_error_work(struct work_struct *work)
>   {
>   	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work.work);
>   	struct xe_device *xe = tile_to_xe(tile);
>   
>   	guard(xe_pm_runtime)(xe);
> +
> +	if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
> +		/* If the device is in reset in AER path, skip processing hardware errors */
> +		if (xe_device_is_in_reset(xe))
> +			return;
> +
> +		xe_ras_process_errors(xe);
> +		return;
> +	}
> +
>   	xe_survivability_mode_runtime_enable(xe);
>   }
>   
> @@ -433,12 +461,13 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>   		return;
>   
>   	/*
> -	 * Hardware errors are reported through System Controller on the platforms that
> -	 * support it, and never routed as direct IRQ to SGUnit. So we should never be
> -	 * here for those platforms.
> +	 * Non fatal errors are routed as a direct IRQ on platforms that support
> +	 * system controller.
>   	 */
>   	if (xe->info.has_sysctrl) {
> -		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
> +		drm_err_ratelimited(&xe->drm, HW_ERR "%s %s reported\n", hw_err_to_str(hw_err),
> +				    severity_str);
> +		schedule_delayed_work(&tile->hw_error_work, msecs_to_jiffies(MSEC_PER_SEC));

A:  Fatal error via AER

B: Non Fatal error via IRQ/MSI


Did u check behavior or impact with below combination?

1.  A occurred then B occurred

2. B occurred then A occurred

3. A occurred B then A occurred: 1 sec before and after.

4. B occurred A then B occurred:  1 sec before and after.

5.  AAB: 1 sec before and after

6. BBA: 1 sec before and after combination etc.

Handling two asynchronous event bit tricky :). Hope it should not break it.


Thanks,

-/Mallesh

>   		return;
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index db3cbc186a51..e6a0ee468b17 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -628,8 +628,15 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>   		break;
>   	case XE_RAS_MEMORY_DB_ECC:
>   		ret = handle_page_offline(xe, info->sw_address, true);
> -		if (ret)
> +		/*
> +		 * Double-bit ECC errors are non-fatal errors and are reported via IRQ.
> +		 * Wedge the device with a bus reset for errors that require SBR to recover.
> +		 * TODO: Trigger SBR using pci_reset_bus
> +		 */
> +		if (ret) {
> +			xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET);
>   			return XE_RAS_RECOVERY_ACTION_RESET;
> +		}
>   		break;
>   	default:
>   		return XE_RAS_RECOVERY_ACTION_RESET;
