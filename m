Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B18606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 17:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wc+Be7HK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F8F10FD89;
	Wed,  4 Nov 2026 17:19:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAD310FD89
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 17:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793812759; x=1825348759;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y/RtY9QXpAKpvRQolDWCV0C4P/4x5XPg2rjdUtqAg84=;
 b=Wc+Be7HKT466ydSSlygb4VQybOWzC6ylxer1meehF8PAQsPtqdWFF3KR
 vNKwKHITThObCEunNQyR9xGTG0Sng+YhiyYBNApvOWA82OFPFHAxqfMYN
 STfUTVxJx5FtoaQPmMddDGlelGvFrSGkuYUCg+qhi0VO/QnNl5G1p9ffm
 XpRKLhjwE2ehY3ofOC8uzKBHR5smSVVxX8N7hfFraYA3rxBT2kYah8JXX
 HJXQ0j0I12V72CKD0QYnK7vNf+/cdQXv2lc6DXK6t31bzE8nqEljV+TRc
 lyxetHT4efRGVT7AWM4Oks5VSKyAFnXSjYYKhgYDuzC7EAMZHkHSOwKPW g==;
X-CSE-ConnectionGUID: bbHys9t/RCCRpEdz7L5P1Q==
X-CSE-MsgGUID: uLXcXcYkRFOy5DEOyWZFLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2478294"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2478294"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 09:19:18 -0800
X-CSE-ConnectionGUID: +2ZJv0NZT6G3ZWkaAqr6jQ==
X-CSE-MsgGUID: yHWLy7rxRQaBpyia/8033w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6673685"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 09:19:19 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 09:19:18 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 09:19:18 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 09:19:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MY+7ECF1EjPcdjhim3akrBtul5xEvb9QrO/eA3+NJwY4mfzzHcvUevXfKH6iqxNsxN8wVC5k9VkL9KA/umnLOB/KP6baXEmF7UxRssJy8gUzKMVoVLn7ByT9QAaNSJXuEKNJPa0xCyQwXbmA0TWijV/O0e8cSGnuwlP00+MjgUUJCgsKWt9D+KgKO5A/HnaMJKgzIZIBdmVlZ5e8VEBFP89C3xFNHt+NDu+Y7DZWD1x5r9SwbIq8k/Ncyzwa84phVIXQPf3wM6t5waX3pFWQ73zoHMoa2FMjHcvwS0MPsnFEsEWcb7MNOiXKCz5LKa+1HnqdVuXNUnQp1Qf1Jx8s0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0AEgxW5nxTMtRAmBBnJR/1Dnq5b2xUFMN88LKxdjQA=;
 b=snfIXn7nt4CgGsQLenypo2z9ck9V15qPF+vCyCO1KjZLLGM78hG0zw1teGiAZotT2V/9ux6ijBrqzU0nhzaPzo8J9nlHuxIieZF7z0fHL3vb2rfXEDIVbYg/duQ68hzkLGCPC3fwfZyQKQARWh1euyTdfzlEUZJqXi2LuKn0qPuKmjZwpKs5m4gbTrBZQ7ACe1ORvxY+JJpq6rcreDVk1mwGh2SoxltHBhFbtXTUtEcMy6fIhnbASIux08t8AyW3EziF54WPXIGrouUfIZhD6Yn1z6dQ8P+lww3vSJuI0z4Xc+VqsvljbT3Awz82MX4i9ZWu/4BaWnjtw0vDR5da0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SJ0PR11MB5940.namprd11.prod.outlook.com (2603:10b6:a03:42f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 17:19:15 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 17:19:15 +0000
Message-ID: <4e1e2c47-7281-4ffb-8f4c-f2583d1a45f0@intel.com>
Date: Wed, 4 Nov 2026 22:49:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/xe/cper: Decouple RAS error class
 initialization
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <michal.wajdeczko@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <jani.nikula@linux.intel.com>
References: <20261029132609.907017-8-mallesh.koujalagi@intel.com>
 <20261029132609.907017-11-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261029132609.907017-11-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0223.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::10) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SJ0PR11MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: 52bd17e8-8606-4217-d5f6-08df3a97c08b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|10067099003|22082099003|261102123227099003|18002099003|261009223027099003|56012099006|5023799004|4143699003|11063799006|261022113327099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: LvUBwSC3Ua5ESIb0R7yhuCMumPlLJTKwMXX1jFF+DdX4WEkhOrjCkbOxHSL6y+9Ncc9QzND4MNH4WjcYhY4BHSQSHRUquVgkBHIlePi2rxQYj1dpqqM7gQtdpNMcNcsl3SGToArV0u2jYw880NB7XNT67ASt9B+TgRH7O8Ozwup7WiXmMmMRaKxo4/G2Ww5GBvRWElDVGOevk73JX8mGHo0R9mD3WcXZ5VHMRppdwZq1F4L6HHE6ujc5AsKJS9Kclooumi/JPlB9+xJCiOrlCyKRnJPtYahhlM+1nQgV4kQqLutPBiMUnZfUcStDaApDbT9YaJIuRv+5EhitS+G2HuErLP0+uAGm3mUv0T8XjQO1Izy2IyY/fIK+go+gEU8kRMO/DrQaSzSo4atypIWstO3MUHyqwNx3xsZhe4TYXI2dOwI+nJmoPWuVWMt9Lbt/zh1t1IRTuBpEBDBPANQGKTCD5bKhwHpG/S9D1nXV+IiqL87OnaKWxEKXQQoKOKZAlqIviry7rpBsu+Axrb6Riw8o9gn38p76aH7ssyw6wFieXOUML2yhcsA0jup440cYgmo9FHPiUmJ6pAYzmnhjSHn6/hrxDENH3QpYNl0PsuvAOqi1ueyxQKWyOz9pykNKZcTGzk9YEtRU4lnEqa+TCV6x+kfE7iYS5i4EwL7bXe0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(22082099003)(261102123227099003)(18002099003)(261009223027099003)(56012099006)(5023799004)(4143699003)(11063799006)(261022113327099003)(261021121427099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmhXVGFydDhxUW01aWpjaldBWnlrcVc2cmZqWFVjaHdBeXpZU2ZpQThGS0hI?=
 =?utf-8?B?M3B5S25LdGNiV3lWZjh1NXgwYWs0OEJVcklLOWxSOEdqc3ZhKytDWTJwMmlC?=
 =?utf-8?B?T2ZrT3cvWDdjdkRrRm9OL3k5blI3d1FQRVhNWXdKc1dqUnk5UlExTEJiR0c5?=
 =?utf-8?B?UFVqNTMwT3BEaGRtbFpmQ2kvOEFrVnhJWkFaNGlwcUM5YVBmTkR3OHBVZjdu?=
 =?utf-8?B?NGlOV3JEbjU0UWNITFAyU3VsdmRzSGFzNVU5VXlRcUFsK1pmbFMvU3dnZ0RH?=
 =?utf-8?B?MDc3ZmJNbW0vMzI0QzJMV2lYRHRTZG03aE5hUXBiUjZvWHJCREhyaFZ5ek9w?=
 =?utf-8?B?S0FaVVlXNmxxY0VySVNwdkFKaWFWeko2eXRoVkdFeHd3ME5Gb2tPOXV6MnV4?=
 =?utf-8?B?TEtQcENlOGllU0ZWSWxDZCtZV0pCYlFiV2x4YXVMWjlLNGRsTnRjRXNReElK?=
 =?utf-8?B?blBTdUxpNGNVelBiZDQybmNHbVI1THdJYmdkSDdRaDRqL29iZjVUSFV6MG4z?=
 =?utf-8?B?Wkh0ZnQ4OTNRbmJkWEwyenFYempTcDBjNjN5Mm1zaEw5L0VueW1EQm1HWmFV?=
 =?utf-8?B?VE9nNmdhM2FLYXJZMFFYRWtaMndCR2tSVTVrbGpLSFZUNTQyYWV6ajVDM0l0?=
 =?utf-8?B?cWtiM1MrWVQ0QVZLMXJUMmNYZDdqWHhVQlNvR21EbkxZL2R0RUdsMFYvZW8w?=
 =?utf-8?B?NEowYzFZc3ZPL3BkTTNKMXViaHBWMktmN241YW43bzREN1B5Y0FTR1YyZFJl?=
 =?utf-8?B?dE1IcXN0T0w5TXZ3UjNEY1d3K2M1NnR0VTdERlFxU0p1VFlLTmxycERiNW5N?=
 =?utf-8?B?cVdzaEZmaFFVQ05GeE44b2QwVXdWWnJKVnBsZFVDU0hDc2pjLzVWK1pUbHZ2?=
 =?utf-8?B?eTNhUGhHVWZKY282Y01GYTlkY3B5dmQwWTZ2NmMxZGt3c2NKK28yUGJ2L3dj?=
 =?utf-8?B?NlFuZk1pRDQwajV6M21ybUowVEd0d28xaXNKQk5abEpxMFdxN0NKN2lkT2VP?=
 =?utf-8?B?R05sUmNock9YRkUwNitCbi9WSm54elZ4ZUlDWldEVEJFSTBSVjBPOWJNYjFk?=
 =?utf-8?B?c1hpZ0NEbUR6a1Fyc2EvOUYxeEo0d2kzeVZNRnd5SkROK2dEcVRscEszb3lJ?=
 =?utf-8?B?ZHZJcTBDM2pxNHFUSlYxMmhKNmFrZDFudENhM1lvSWhDN3R3cFZWYWI3cTJE?=
 =?utf-8?B?c1ZtTHNnc3VSdGNJc2o3YUNTRldMVTcvTzNPVUpYcUxCM0hkMk5ybVFlNjVQ?=
 =?utf-8?B?bmVxUTJKQVFodXhGRTY3SjdxN1hnRk1PdTNXaDc2Zi9jUGlBSXcybEZZWlUv?=
 =?utf-8?B?QlZGWTFkcU5KWFZKY2QzTGlNai9IUmhxbHdYRkFRcmxqczdUZGQrRW1Mb3h1?=
 =?utf-8?B?aTJ4ZE1teHE4SFFIV2U4Q2hzTkN0OFBTTGdycXBsZ3V6L2hKQmljSlhrdU1w?=
 =?utf-8?B?OW4vSzFmQjMxR0J3ay9yV01nR3BQUjJLQ3loSHh1OHlCd1NMMDdZaHpYZGtw?=
 =?utf-8?B?dGt2bTlaRjFZVnpPMkVDenlaU0xnQTE4TmdjcldjMjNRMGVkNGY4c1V0VkJ4?=
 =?utf-8?B?cmNqT2E4TE5QWVFFNDg5cjRmeXVtVHdSN2Iyd0xpZU1BZEJDMzhqaWhpWlpY?=
 =?utf-8?B?V1VGL2IyeEs2djBPZzFnSUwzWTEwdGl2QTVrN2NKMXNuQTM0RWxTNERLNys2?=
 =?utf-8?B?clgyQmRWSVpKM1crdngzWkdvWStkQytockJ3K2gwNG5paUg0QWpPdWVnd3F3?=
 =?utf-8?B?V3p0UXJXRXNxUGFmaEVXUTczK0UzbE85QlVyL1cxbyt6ZmE4RVdUeUN2dWxB?=
 =?utf-8?B?TmN0OUozcFpwTUhVc3pIazF1L3llZXR3RVEvYXV4UTdlRFdQZHdsZ3I2QWRR?=
 =?utf-8?B?VVdkNFl0QWk4TElWS3BsK0dFZk9pa1lmaGFiNS91a1lVNWhvakhVaHVDT2NP?=
 =?utf-8?B?TlU5aFZsMHdoQmFDR3N4aXMyR095TFhQb0c5U0FrK3M4SVVLVVVxdHJ3Qnpz?=
 =?utf-8?B?NVhsYzFxQnd5MGd2US9OU0JhaTg0OTNqbUM1VmNTZ2RBaExvNXZiOVZ5MHFI?=
 =?utf-8?B?MkFKS2huZnFUU0xCRTRaVTM0WExEdFFDWmJneU11NSs4RThBMnk0QWFTbGs0?=
 =?utf-8?B?cmRuaFJrd3ZZZWJIbDczSkZzRi8wNCtXNVBHTHppT3BTSGt2bE5taHpoYTZw?=
 =?utf-8?B?b3RueS91b3ZadVl0YjBCWnFMTUN1RXhycFZ5dnU4c3B0UHZnRU5DT1QweTdu?=
 =?utf-8?B?NCt1cWlYVG9xamZkYXUybEM0K0pUYytqOVZRRjNMbCtQUGQ1eHZwOFBGNEdp?=
 =?utf-8?B?bEUzeis0azdUdjR5NEZjd1gyRnNNVWxzNXQ3dnoxVFJyWXpXUCtYdz09?=
X-Exchange-RoutingPolicyChecked: IQG+5on3F/mlJ/jakTZ4w/mpz+NZjTDMb4LnFxt+hTotPmh3dBbU/ZnVYLdc+jw5GwntHq1GPsZEEkYVbld7Pams8oNxL8h/AhFpQX9saM6KYYlBhFN9wzVe5tb7JNViep8HwieyIb551ouTiYTtjH6PlM1+B0Lv6BIdKJvbYIjjIXqaFxT2WMUmdWOYaSB04rtWEfMWwnnOXk2AXxoQxG2qNieV6QdVQdC+q3iOWGkS3AwFZlBuCZh4/dVYvRr6vfN8fGH2rjg5fMRPVsykVd4KR57Q9q5uwG66rHVNxty+ecG8uLWKVlG5ZsG8Q6MUGtYF178eucvbIev2LygD9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 52bd17e8-8606-4217-d5f6-08df3a97c08b
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 17:19:15.5740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4iD01NREpUFq9J0DVdaAkoZ1n/3HhsP4I367rtAigoVqMxttwYNuIiuTd6rExykWXFN4s1GplcnbGLpxfR4Dwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5940
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


On 29-10-2026 18:56, Mallesh Koujalagi wrote:
> Move RAS error class initialization from cper_init_intel_hdr()
> to xe_cper_emit_counter() so the common header initialization
> can be used for both hardware and software CPER records.
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_cper.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index bb90030bcd2d..e802f534eb45 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -87,11 +87,10 @@ static u64 cper_timestamp_now(void)
>   	return ts;
>   }
>   
> -static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_class *counter,
> -				u64 first_timestamp, u32 sig_id, u32 error_count,
> +static void cper_init_intel_hdr(struct xe_device *xe, u64 first_timestamp,
> +				u32 sig_id, u32 error_count,
>   				struct xe_cper_intel_hdr *ihdr)
>   {
> -	ihdr->counter = *counter;
>   	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
>   	ihdr->sig_id = U32_MAX;
>   
> @@ -218,8 +217,8 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
>   
>   	xe_assert(xe, is_hw_sigid(sigid));
>   
> -	cper_init_intel_hdr(xe, counter, response->timestamp,
> -			    sigid, response->value, &ihdr);
> +	ihdr.counter = *counter;

Instead of moving the error-class assignment out of 
cper_init_intel_hdr(), I suggest making the error-class union a named type.

+       /** @error_class: Counter-sourced or driver-detected error 
classification */
+       union xe_cper_error_class {
+               /** @counter: Counter-sourced error classification */
                 struct xe_ras_error_class counter;
-               /** @driver: Driver-detected (software) error 
classification */
+               /** @driver: Driver-detected error classification */
                 struct xe_cper_driver_error_class driver;
-       };
+       } error_class;

The counter and driver paths can populate their respective union members 
and pass the result to cper_init_intel_hdr(). This keeps the complete 
Intel header initialization in one place.

Counter path:

union xe_cper_error_class error_class = {
     .counter = *counter,
};

Driver path:

union xe_cper_error_class error_class = {
     .driver = {
         .error_type = cper_sev,
         .error_component = component,
         .tile = location,
     },
};

cper_init_intel_hdr(xe, &error_class, response->timestamp, sigid, 
response->value, &ihdr);

Thanks,
Badal

> +	cper_init_intel_hdr(xe, response->timestamp, sigid, response->value, &ihdr);
>   	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
>   }
>   
