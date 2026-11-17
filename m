Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9386A606A881
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AEHm3nZM;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=OZ8Tfss6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385FB10F763;
	Tue, 17 Nov 2026 14:05:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D344510E406
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 14:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794924341; x=1826460341;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JEJyW8IcXr9XmhpGkre9yj0VVpbvovNdr0w7MCj3Dkg=;
 b=AEHm3nZMc+zNSxu501GlWObStzTXeG4QgwOpQxLRLhhinMYYQMbJROTh
 rih+rWWAHuTrJtoIxXgZ1CTonhBIvfITtWKWK9rtQD+70DO8iRbSgoKvk
 hm6T0FcBM/FE22mn6a2oLQGF0/QrsoOQB1jqvBnsVz/sZvL9qbZIhLzwl
 SG5tXcBZvq5JREc5rs3lSX28Xfz9OQkEUAuT543YveUlyIsnl2lLMnPfq
 /0dlSqP+4XuS4PNUJwXo6UrrbdEAO4mf35t79Q0U+7eHBFL9ZYNVD8nAi
 Ko8n80RW6nB/XvTJym/QhGhGB9zVrRkFBdNZYz98HyKgy4oYpHzeNC7hV w==;
X-CSE-ConnectionGUID: 94rxpqVHRkmpE2Dcu/HeLQ==
X-CSE-MsgGUID: bVncGwAHRjKyWYlrRCgyAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3608862"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3608862"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 06:05:36 -0800
X-CSE-ConnectionGUID: GijdQWxTR7KhtERdnwnT5w==
X-CSE-MsgGUID: 0RphZJ8USeWKdIYJpvjcyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9751630"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 06:05:36 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 06:05:35 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 06:05:35 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 06:05:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4Pbfq2UTY+oxYvBDUBkR0WKdu6ROlz6pzjfinwJJVY7yTQ7B39KPsWgdI2mGgmfbWk8TF9lAPe3T8g9xtJ5o6f5ypu4RPaeyX/+plAave+dSQk3dR9yu9d0hfsEjUCoOBDk/UOKYgTW3l1IIbqBELlYYs8vQRTRY7w1QfxXLZ/JEMoj4YftBHu7u0fhPEhBZ65Ib2zpiu4Ax5+FIaoGksxjgGVIWaMGqVp4ZgIMlungqsDTYgRybYP0Ld0nmrQ6LHbDL9lR6oYI2GZLwBNM54A7bTHdNU3m08jlMBYAWMYyO3CSzSH7kNG+WMubix43yZB7vevPiJ74SHfuI/ELKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pg6lXcu5yz3CTE46naZmTXnyVBr1WrgFaSEJYlPrY50=;
 b=vaCgMqVHTqpcJvLksjHA7EJLq4AGcx/sO33LWDrGj6bdG7rqV4z64mBfO4yGXMU5nMz4Va7Uik0xQkSPrGo5QNrl3akz6SgkqBTb0z+GfBy19uRGLHmKI1g1REx/i3i6mGhVuSLNlk1KBFE2yEDk5ERvKSpTV396FmX3FLVJK0Tm6eVWetccM/mHuDMnyqjEVMdBXsvV8qSPtvnsfmIdKDYi6Etn1Dme+0NIstLDIztw0xxC8Sh134mP2Q2qGqAVYpga3jZdZY7N/ZB85z/EmLtXDa4s/9Nh6BdtLMGD1t5Ymg0DA5pt9bXC7zJbLwijYUZsz8a/HLnSxMJPZZQZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pg6lXcu5yz3CTE46naZmTXnyVBr1WrgFaSEJYlPrY50=;
 b=OZ8Tfss6HMR+O1SYW/H7rBDRpMMv/1mTvn8tkWDSPqVkkpI8RPUNtg+vZ4LDlIGlFbxP4cz0L9ioaEgjx0NRUqgLz7MRR9sN6wprJhFyerKg7W7486Pz1o0gcpjXfsobngRfvGtgX2RVzSN+KWOuYP6gN/gwNE5YW7Fp/kIdv9U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DS7PR11MB6199.namprd11.prod.outlook.com (2603:10b6:8:99::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Tue, 17 Nov 2026 14:05:32 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 14:05:32 +0000
Message-ID: <707a0b50-cb1a-47fa-a4e3-f78465fe0b1a@intel.com>
Date: Tue, 17 Nov 2026 19:35:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] drm/xe/log: Test software CPER emission parameters
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20261112134636.1860446-8-mallesh.koujalagi@intel.com>
 <20261112134636.1860446-14-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261112134636.1860446-14-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0119.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::7) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DS7PR11MB6199:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a9f1aec-1218-4493-be2c-08df44b3d7cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|6133799003|11063799006|4143699003|56012099006|261026121527099003|261022113327099003|261021121427099003|10067099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: zQoMVG/+/3y2uYN5IKHPi7IOLEwyMifBDR9IS1BcvmFhc+L5MdG8FahqkhrLqMOqCF63qt0Ef57Bk6gYRLffuiKGlMq0qGx29woD+hwbpp+WyGmi1FYok3a1gdm3ISnGn+bU8oa8SqqD13RMay7TCskRKQj/5l6Gybz09okynhaOTfvgOM+KdJRGDZcardsjZyAZPjxLkDGAzxlGqtz8YCyZDQHJ6rJISV3GoK7lRskb7+rrT1Ah2Le3UQq3eZQ38YfiwEigDP9gPD1eOYfnqlS3KJSL+YLhEgloe/UJTtDUBIGHVi7kuLF6hpdb8D55Bcpdu/KsCsnPWOJ8IRek80CASdNnvELudugsUVnfrIc2D0Jm0gvY5OSYkcOxS76OM7qZv4dycv8lExuX41yFDa+y21oUFyObX3ecpyjbxVMxlgDflmu60geJvgJs0F8cbdjtzfVEqgM8pyVTdX/PuNF35dpLK8nGQ8gtTwAvhxO55mqB9Bpud1BtDfvlGF6y/NBfKrZBbwqMFE3f8oROYFA9eC3Q8fQIkqp3svEHATvNwJ8MI2gfLWzNe5h5kDs8HCrlQk7J6IyPDiL6uzO28O7pY4g40HHvVLWkUF0JkIgOUgc/idEpsI4xMNI/t+kCGLOANHk5XMDqsb5V7fMfIZmtqYw37RG6qEumdA3jzC8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261022113327099003)(261021121427099003)(10067099003)(261009223027099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDg1MUQvTmwwbGxrYVYxWk5uVmMzcEZZQVpHelNGMWlHZU0xdDZwblNaQ2hY?=
 =?utf-8?B?RWFvTXBDcWhFaXkvT0JwNVJSL3RrczJ4YVI2bEVCY05aNklMZG93Mi9Ra1lQ?=
 =?utf-8?B?N2RWQnl0eGszOUZuRmNIMkxMNVpSNnNEaEpFNzFaRTVBd0JndjFJWmptNDho?=
 =?utf-8?B?ZE81RGxkWC9BdXdJWitrblpvVGFGaTJVSWlWa0t3YmxDK1VtVHoxRXc4YjRO?=
 =?utf-8?B?UVppZFppeWE0MFpLWEZaamR0YUJrT1NnL0JnejgzOVlselhKQnlRRDlyS1dE?=
 =?utf-8?B?UlNrTEJjS2VmOWNFTDF4bUpiVmNCSW5LNnE2M0tEVGhqaGk0TXBkSUpRaFNV?=
 =?utf-8?B?RG9NbldsVWkvSUs3U2Nwc3hVRHNMaHl2cFE4NEJZTEVucjU0dEhmcm1ZRGRD?=
 =?utf-8?B?U1JnVy9Dc2FmaFZKT0k5amZGenRxajN1M1AzTGNiRzhKOUlqSlk4RDZmaVNK?=
 =?utf-8?B?ZCtjUFlYb2x5SzIvOTRINFJCTDRDVWpRWGRwN2NpMFlzRWpHN3dzKzVtcS9U?=
 =?utf-8?B?YW1hSHVVVzlQWUJkeitYWVZ6dE53VnhIdFBxYnhFdEVGWDAvb2hXbzM0TG5s?=
 =?utf-8?B?emxjampIMnRVMEwzZEdFdGNFR3RUblhibkYwNi9tTjhGaS83N0tJU2M5VE54?=
 =?utf-8?B?enFST3dQTzd2YTdlUmo4MFlGR1ZnRFBOcmxiNENSUmZSTm82RHZ4ZGJxZ1B0?=
 =?utf-8?B?Q01nVzVpdC9aS213ODZWUnZUVkpndWkvc043bDZmMFJUTDM1SWJUZDkzbm85?=
 =?utf-8?B?cUFxcmF1YzlwM0RwUnVibHN4WkdwQjBCTkVZZlgvTDlpUmZZcTFUZDNuR2M2?=
 =?utf-8?B?dXdJUzVSb3RzNmEzRk5kZDgzK2d3cGFyUWZYQ1p1STFlSW8rcmFneG16SWJ6?=
 =?utf-8?B?Y3FoRTBGUlMraTdSZWYvZ1dJWWZTTkRaSVhuVGxhSk1VQmE0TmlWK25MTHJI?=
 =?utf-8?B?UFZmb1VoTlJzRFZzTXNKTHMzaWh3em1mSzZRVFE4RkV2dExxZExzUXR1cWUz?=
 =?utf-8?B?TFYzNS8rSTM5US9mMm1hY3lnb3NZSlJzdjFJWVJvaFN3elU1SDl0dmVtS1FQ?=
 =?utf-8?B?U2dmZWlPRlJpNVVjVEM5ZFprTGFwZHdiQjhiVjhMVFA1STlwMzBLRFN3QVI1?=
 =?utf-8?B?MzMrLzl0R3hleUxKeGhJWXpTWFd2MG9LYmZ4elh4VWFSTzNzUG9qZzdKVWo2?=
 =?utf-8?B?MXJSTmZkYW9QUHJRSkUwNkNmNXYzUllRdnEvdDhEc3NraGM2M3p1SkI5UzNp?=
 =?utf-8?B?Zm91R0V4N0pSWVVuOE96ZDVYb0N2Mk9WdkxmeTRsYzFKS1gvZDVYZkc1RXZm?=
 =?utf-8?B?a0xBWmtmMjBVWW1YSXZpUjB1ejFQdGtyUmtRelRVVFF1QVJLa0VwdU1JVlVF?=
 =?utf-8?B?eXN6UzR2aFlVTmJlNG9ubGp5ano2ZkY1cXpGUnZlWFRMYlkvNm1UR3lhdWVI?=
 =?utf-8?B?NVZTN3MxTnlRaGszR0tpY3NPeU14WVRFTUFEdWpNSUFBTi9lV0x0Z0hDb2xB?=
 =?utf-8?B?TnlnbG84cGlsQ3R0aHJDbHJzQzRyTTkrZUFZN05sMitWUjM4b3RKMUJXeFNu?=
 =?utf-8?B?RnlSTGVQMDFKV0p6TVZ1cEZEblloY2lsTjE3ZVBkY3l4Ymh3eTJzT2ljV0kr?=
 =?utf-8?B?OHcrR1ppTzVlUU9DRUtWZlhSWmQxWHFvRC9CVHF6anY5YUtEekJWTlNhWmtn?=
 =?utf-8?B?KzlUaEdsMEJRUkhrYnFyZktlYUJtbkNZazNuWmJDYTZ6ekhKcnh1MEhkK3Vv?=
 =?utf-8?B?OWphZEhCSmVSVFVmeUhUaFc2TUUyZVZXVVJ4YWlCblNSNHJNZytYd0trRjhS?=
 =?utf-8?B?eWs0dHJ3SElZbUxFVW1mdjZHR1ZsS2Z4Z05LRWhNYjBYMDEwdXMxN3d6ak1L?=
 =?utf-8?B?NmVQUkkza0Y3aVZyS09LQ3pzZ0FWMDdmanNzb0RwZ05SUGVkYkcvcWRjR3FO?=
 =?utf-8?B?OTNyYXR1cDhXamxaWk5vZGt3UEdySitkU1R2aGVDRkY1THBHSnNLSVhUc0pn?=
 =?utf-8?B?VFRkRDF1SkIwcVk3eGRJSHhkSUJkMmcvcjZ0VHZhcndDSmVOb2Fza0p2OWx2?=
 =?utf-8?B?WVRDT00wVVNDaEU2d1h4RkFMVVVoRUZVbXJVKyt5NGVEbmFZRXM0R0pPc0NR?=
 =?utf-8?B?bDRXUzJTcldieXFYb3hFT2N1SjV3YkhCaW1QdXJ1UnRmTStYSlNOOUJEczZJ?=
 =?utf-8?B?cWtMSFM4MkdPdHJEdHJxNTBJbXZRZXRuQ2FrU2RqUHc0VjJ0VituZVEvckp4?=
 =?utf-8?B?OWVZSE82N2ZSM3ZVSkdISFdJZDVkMC8raFl4cmxBMFhKWlJxdlh3bk1YaVNz?=
 =?utf-8?B?MU5WTjZyZk5LcUl6VUNobzdiQXVKM0ZDNjFUT3VFRE9nNlFoLzZndz09?=
X-Exchange-RoutingPolicyChecked: 5PWKoa3iUFmpecgGV5EKF+fYjvH5SbNREaqGBhnIsEDTcFxLcyhLqy1sIy+tnZ2K4bVdXr7MEkaryepVMN65UyOQDu+jOkOkL3jNIF7aVMnvXE45z7qx0HPvPqnFxLz1YpwlnDp97R22I86dKKUDqlIUn3kaMmLbtemTyzLOMkyXq8bvAhL8qb4lcsHO3kHvJJdQWfFUo8f2lb1uEPwXvCeKi5+Vc85wqqfLOoI68J/LZbkqroqwuU3Yi7sZKoj6TVBES4tQ33OZu8ZcDgHaqpcGEGwIC52AiD2pSW5PUp9HmHqyYbkrfyUsYY4ZZ2hWV6gLsd5WmUJ0AgWesMVZAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9f1aec-1218-4493-be2c-08df44b3d7cc
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 14:05:32.3327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBe2J7JyFfggh01jrqQyCS8SR7TdS7WZjnHcYKgnOlc0ZT7ZKrV8aWqv5oFGKS54cT+6T7FpXLtuF3S37EaWzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6199
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
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 12-11-2026 19:16, Mallesh Koujalagi wrote:
> Add KUnit tests for software SIGIDs to verify the correct
> arguments are forwarded to the CPER emission path.
>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_log_kunit.c | 82 +++++++++++++++++++++++++
>   1 file changed, 82 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_log_kunit.c b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
> index 08828ecc9098..9d8966a3177f 100644
> --- a/drivers/gpu/drm/xe/tests/xe_log_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
> @@ -142,6 +142,14 @@ static void demo_dmesg(struct kunit *test)
>   	demo(test->priv);
>   }
>   
> +static void test_cper_null_xe(struct kunit *test)
> +{
> +	xe_cper_emit(NULL, CPER_SEV_FATAL, XE_SIGID_PROBE,
> +		     XE_LOG_COMPONENT_PROBE, XE_LOG_LOCATION_NONE,
> +		     ERR_PTR(-ENODEV), 0, NULL);
> +	KUNIT_SUCCEED(test);
> +}
> +
>   static void demo_cper(struct kunit *test)
>   {
>   	kunit_activate_static_stub(test, log_emit_cper, fake_emit_cper);
> @@ -149,6 +157,78 @@ static void demo_cper(struct kunit *test)
>   	demo(test->priv);
>   }
>   
> +/*
> + * Software CPER
> + */
> +static struct {
> +	unsigned int count;
> +	int cper_sev;
> +	enum xe_sigid sigid;
> +	u32 component;
> +	u32 location;
> +	const void *data;
> +	size_t len;
> +} sw_cper_capture;
> +
> +static void capture_emit_cper(struct pci_dev *pdev, int cper_sev,
> +			      enum xe_sigid sigid, u32 component, u32 location,
> +			      const void *data, size_t len, struct va_format *vaf)
> +{
> +	sw_cper_capture.count++;
> +	sw_cper_capture.cper_sev = cper_sev;
> +	sw_cper_capture.sigid = sigid;
> +	sw_cper_capture.component = component;
> +	sw_cper_capture.location = location;
> +	sw_cper_capture.data = data;
> +	sw_cper_capture.len = len;
> +}
> +
> +static const struct sw_cper_param {
> +	int cper_sev;
> +	enum xe_sigid sigid;
> +	u32 component;
> +	int err;		/* reported as ERR_PTR when non-zero */
> +	size_t len;		/* bytes of @blob passed as data */
> +	const char *name;
> +} sw_cper_params[] = {
> +	{ CPER_SEV_FATAL, XE_SIGID_PROBE, XE_LOG_COMPONENT_PROBE,
> +	  -ENODEV, 0, "sw-fatal-errno" },
> +	{ CPER_SEV_RECOVERABLE, XE_SIGID_GT_TDR, XE_LOG_COMPONENT_GUCSUBMIT,
> +	  -ETIMEDOUT, 0, "sw-recoverable-errno" },
> +	{ CPER_SEV_CORRECTED, XE_SIGID_MEM_FAULT, XE_LOG_COMPONENT_PAGEFAULT,
> +	  0, 0, "sw-corrected" },
> +	{ CPER_SEV_INFORMATIONAL, XE_SIGID_SURVIVABILITY, XE_LOG_COMPONENT_SURVIVABILITY,
> +	  0, 0, "sw-informational" },
> +	{ CPER_SEV_FATAL, XE_SIGID_SW, XE_LOG_COMPONENT_NONE,
> +	  0, sizeof(struct xe_ras_error_class), "sw-with-error-class" },
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(sw_cper, sw_cper_params, name);
> +
> +static void test_sw_cper(struct kunit *test)
> +{
> +	const struct sw_cper_param *param = test->param_value;
> +	struct xe_device *xe = test->priv;
> +	struct pci_dev *pdev = xe_any_to_pdev(xe);
> +	const void *data = param->err ? ERR_PTR(param->err) : param->len ? blob : NULL;
> +
> +	memset(&sw_cper_capture, 0, sizeof(sw_cper_capture));
> +	kunit_activate_static_stub(test, log_emit_cper, capture_emit_cper);
> +	kunit_activate_static_stub(test, log_dmesg_vprintk, nop_dmesg_vprintk);
> +
> +	xe_log_emit(pdev, param->cper_sev, param->sigid, param->component,
> +		    XE_LOG_LOCATION_NONE, data, param->len, "testing %s\n", param->name);
> +
> +	KUNIT_ASSERT_EQ(test, sw_cper_capture.count, 1);
> +	KUNIT_EXPECT_EQ(test, sw_cper_capture.cper_sev, param->cper_sev);
> +	KUNIT_EXPECT_EQ(test, (u32)sw_cper_capture.sigid, (u32)param->sigid);
> +	KUNIT_EXPECT_EQ(test, sw_cper_capture.component, param->component);
> +	KUNIT_EXPECT_PTR_EQ(test, sw_cper_capture.data, data);
> +	KUNIT_EXPECT_EQ(test, sw_cper_capture.len, param->len);
> +
> +	KUNIT_EXPECT_TRUE(test, is_sw_cper(sw_cper_capture.sigid));
> +}
> +
>   static const char *test_fatal(struct xe_device *xe)
>   {
>   	struct pci_dev *pdev = to_pdev_safe(xe);
> @@ -558,7 +638,9 @@ static int xe_log_test_init(struct kunit *test)
>   static struct kunit_case xe_log_test_cases[] = {
>   	KUNIT_CASE(demo_cper),
>   	KUNIT_CASE(demo_dmesg),
> +	KUNIT_CASE(test_cper_null_xe),
>   	KUNIT_CASE_PARAM(test_dmesg, log_gen_params),
> +	KUNIT_CASE_PARAM(test_sw_cper, sw_cper_gen_params),
>   	KUNIT_CASE_PARAM(test_invalid, invalid_param_gen_params),
>   	{}
>   };

Looks good to me.

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

