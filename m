Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276C760A2603
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 15:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ROaaPrDf;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=F3S/48bf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDD010FDD8;
	Wed, 18 Nov 2026 15:31:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD0410FDD4
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795015866; x=1826551866;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=+fppSoixQeUbTlbufL0O/+4HfjhwG//OA/WJrNIqnGs=;
 b=ROaaPrDfHtKAN+HaXyRtjkAwkW/au73OwtrxBgttqabD/Px3R1bb58o6
 AS/kwjgZDemdu+931J0JVsFXiVD7qllKwO8ouR7ABCXAYY2qu1jBdZbuQ
 DaP7Azlb+fihaH5+a9S5nPpCNjqoMkbpijYEDXZfXWvBK6Ukjd76dGArW
 H+o5SzW5RgqIChL4mMpQ80mO+tfROy9G8K3RW+/+sokwzXtLq9gwL2HZB
 mHvG4bwViCH0OQgkuWKju7KsKkI7XEPtLhcnDzwmaoNMqhxUfKfBj+B0o
 Gdw4zcVIplBVQ33pwKt4n5SGVVvP2RAr89Mo/+3Ei1dsEP2JYsVQ4cidi g==;
X-CSE-ConnectionGUID: KE2A61x5Rgi/059GNDxKXw==
X-CSE-MsgGUID: s8yJ0zeJTu6L0mcMs0a7Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3856388"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208,217";a="3856388"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:31:03 -0800
X-CSE-ConnectionGUID: 8yQBdYRvSFugMaX+YEExeA==
X-CSE-MsgGUID: rSaMfu8TR3mP5uaR6brzag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208,217";a="11905258"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:31:03 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 07:31:02 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 07:31:02 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 07:31:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t845jZzqrqT9GSq79Kcv3bYvhQptwBRBRKMbRHcM6BX98bFxz1hCFuHgutsIOJNNdRZoyl56pHDYsmoKJcqjLFi/WxaPcdM8of+/ZpbFHkAaLkwLct96688bB5aH8+RL5bQdHgkKSQ8mo7iqGuQx10ZblAfTl6aO/EAFNzXX+eEGlXg+fOQlCFZ3JTX8TqCObk9+HElui7gNZ5a1dDLMXq/tAxTo+fPQ2AFZ45au19u6G+HBIhzEc1bfsVxcfvF4ppi8/yBbJP0uby30L9vTlL+q44A71AkLaQ9z9tsqFDJ8FTDtDDeHRjn17MJA/AdEHimeT1b7C0HnwBjD4Q4OhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BVMPLQk37VyFhu7diSAPsuRCRAfyJU+6keqkb3dBJc=;
 b=F/NpdrYchfsAMtVQlMtusr2MGBQHfhL3pPRHaOHv4S1qh5XK9RDgFpB3uXBEe+FD7+4c+Tupd+JUum5GbjNj9I8JJeKsb3SY6/ExIw3ZoejQR76GdtzQbxtNlqTGw7sELFTXDI6usqo248p/V3a2TYPMQvzLExnuup+DUvy+ExcNf9Upw1a7KeqBdCRl5Oa+lYSSwLkkwIJvVxAzhDyOanO+0HHKxHB9koItjmXFvkPw4b+HlKElAflHtYAVMAGaBEGYZ1ObP1h1FdAwTpxhgnjhkNsJv0JbkmmE0UdbLxC9T/+TaF5Nw+1rn1vrKrM1iMi9QCUN1OQUfMnEpdB7Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BVMPLQk37VyFhu7diSAPsuRCRAfyJU+6keqkb3dBJc=;
 b=F3S/48bfdvy5/+Y1/633zkK5NxpQgmi1Ie95ZqqreGVd0cfD7X4fOYkUcjkiwFiNk2LPrp5YKukzCix9ckfKT7OFMBVZAdFwE2WziWf7tDDj2iPAS279rysnF35Oq/sBjP4ZUYk68l9O2V7xN9kFUGCk7P4zpn9cwjIVH9ZooGk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DS6PR11MB533224.namprd11.prod.outlook.com (2603:10b6:8:46b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:31:00 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:31:00 +0000
Content-Type: multipart/alternative;
 boundary="------------yy2h10ubC2FKLKjB0rwE9f01"
Message-ID: <6179a816-4d28-4c82-b020-d6282c97c7d4@intel.com>
Date: Wed, 18 Nov 2026 21:00:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_late_bind_fw: Skip OCODE late bind if same
 version is already running
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>
References: <20261117125904.2877468-2-sk.anirban@intel.com>
 <avxyUc1VLSYm7DbG@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <avxyUc1VLSYm7DbG@intel.com>
X-ClientProxiedBy: MA5PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::10) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DS6PR11MB533224:EE_
X-MS-Office365-Filtering-Correlation-Id: 73a6c6d4-0829-4f19-f5b7-08df4588f2f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|261022113327099003|261022075727099003|4143699003|11063799006|56012099006|261026140227099003|261028144727099003|10067099003|261022105027099003|261009223027099003|22082099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: fd+k05qMnJMeLcdbDsL4/njNnlaihWJmvKL0UDBttZUzWj8/gIQbMSamgzJvXAp1xLE9keseEVf1lKzbcy1uLwPiErJB07uTA6a0GCR+XESUdi53Ix29A10aDdpZBBv7WQqqyijNsdeWWnd1QG1K43ZTHs/ADBm2optU4i6zmXHiBFjcQdix52gExVdPIwF8E404SACn4eKS2JSgbEr1A4fEGMnPUSY5AobniWzu0w2sQ6gJGIqx9UumfMMpTXElzRFmX9fEoBjsNN2VAKB/BJWHyzSZxCI0GJUP5Nq7olpo75aso0EK/11FmUxMUOB/mYKHtAOFJ43QvFqFJ8GxbOiPTCJdU+d7Pyg9LKIAVKlSGMi0cve7jNvJh8ZoW+O6y+UaZi6HPmAv4or3jFUvfqdrJcQiRotlJdkfsYbn2sl4rBMF/ZmLaKNdNCH3xdH8MwFyWGgmWn5hpP5ks+wQvhCUSctpm3iZt8rjMyOac7OJLV8x5exT1gQMj4RRXA+KT6PFLgvWtjA9uxov27gp4WrH/8PexyYClMP7zKZly+9aMsmxe1CPBC90QC9PAtrUKlIA/MTKv2Riaa/3Lvv5NfOFgb8UPK6Oye0iKrB7sGKxv1Q+0gysYjKfSbTtYWtV4QFzs0nwip6xih4QM8NGIzF5wnFAZaKvYcNR79ht8Hs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261022113327099003)(261022075727099003)(4143699003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(10067099003)(261022105027099003)(261009223027099003)(22082099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWlTZUJBNVFJek1NMFZET1Ura1B2Yys3YWNtMnRkOEgxL1BMeXpjRk5YaEQw?=
 =?utf-8?B?RTVjdHFuZUpjbmFqcnNXcDIzdUtlRi9XL1Bmd21KbW92bUMrNHRCejEvTHVD?=
 =?utf-8?B?dXlFYVVSRmlNd0RTSHZpNHlnZG1Na0MxUlY4bGxiM2lqdWNCdmJCMDRVSW9a?=
 =?utf-8?B?bm9EVEpJNG4yWENSMXlMZ2NodG5iam4rcnJhSXNQRE9pa1BMZ0NOQ2RNNGg1?=
 =?utf-8?B?c01ZU1VPQkJaemZ0czdRSUMwUXJsYjIvRVpzTi95K0FtMVBlRHBoWFVDejNy?=
 =?utf-8?B?N1A2bUJjUDVFaUwxZzhYcWZyQzluanloc29XUENnQTdXYk1CR3BhZlZjT2g2?=
 =?utf-8?B?QTdUdWprWXB4dEpxUFY4ZEtmRHBvNUpzOTBJMm81dzJjT2hoV3JPZWdmQW5R?=
 =?utf-8?B?bHJvWFhyS1hkVnhnaHNFWjU3aERkbnd6NUVZY1o5WWJENk1oQ1VUUHAvSXd4?=
 =?utf-8?B?YnhpZHI2NmN0UmxlSWJNSjd3VDZBY3ZZb3VROS81UzZoTzBBZnBxbDNFUFYy?=
 =?utf-8?B?TWdUZWlPZnkreUtpQkd0dWJ5YlNnZVhSYzF2ZGRVTTdKZUtiNEsvbVdPa1g3?=
 =?utf-8?B?UlhZLzQzOElyUTdKRXVTcSsySjJGTkQ3NmFDaC9Ucys4ZDlaRHZnSlA5OCtN?=
 =?utf-8?B?TmNqSTNvTy9lZnpVTi9QK0phY1hrWHpjbDhTRGhZR08vTFVEbW5JdFBsMTB6?=
 =?utf-8?B?NUVoQ0JYTTFSTDlrMkMvZTFxbTh4dnp0c0dxMWhzQ1FZZHBLUm9pTUtlTkdh?=
 =?utf-8?B?Z1R0eHdVSDZ0OGt1SGRvdTAvY1EwckNCR2V6NkNlbkNxTCt3TnRkbHNvaU1D?=
 =?utf-8?B?bTVYaTR6UjlvNXltZ1pUS3Rjc2lYTGkzSUw1eHk3eXhEQWtDb3hmSXdVNUNt?=
 =?utf-8?B?dGtLb0hmblYxWEljVWtwVkN1RUl6Ny9iNmFjcDJyUFNzeExIbElONzg0RFRB?=
 =?utf-8?B?ZXVpZHg1OS9rUEZJcDBPWmFDOHdpREkvMTBNd3RBZjJoaEd1REFOeXFrTHFE?=
 =?utf-8?B?QjkzSUdkeDJOMzNQT0RRVkwwOG82bWdnc3p6eWJId3VydUdDUk1xaEV5OXJT?=
 =?utf-8?B?T2x4Z1NPNzI5MjR2WG5PZDdJbStWU1N5bEkyTnJ1NFUybFB0N2liOHlKaUgr?=
 =?utf-8?B?aU9nQzdQVDNaR1pPZlVlNTJMMk52Yi9DeU4yak1pamRyVXNJN3dyVGNVMTBJ?=
 =?utf-8?B?UUlTcGFlUTRPUnUrM0NkcWJqMmV6VEV4TU5QT0g2ZjB3YlFlSzZ2enZRemNS?=
 =?utf-8?B?NzY0U2lBOGV3Umlub3VGV1EwalJWcGJIMHArY0Q3TUp3a3RmWkNnK2RpL1FE?=
 =?utf-8?B?RmJ6TXhrNmF4dkp3eWlPRlRMZ25FTnA3Q1lxSlQwaWhNTEZzbVczemdYZ1RY?=
 =?utf-8?B?NHBrT05jUGRkcjUyTGl1Qkh3V3ArY0NQMTFvQkZSNnp6aThFeERvSjR1Z1RT?=
 =?utf-8?B?RHpjMzYyQ0lNSyttZnN2SUc1Q1FiR09YdHNLaVlDRXA4MytoZzJBM1hhU0N0?=
 =?utf-8?B?K3dHb2luQlJkdWVGRlMyVng4YUVvTWtWUHlXUHRzRHYrSXR4U05RdzlBKzdP?=
 =?utf-8?B?a015NG53M3B1a3ovcHVBSUxnaHo3ZXJJdmxNQ3B3Rk5XQWdiMDRKeEpSR3Vp?=
 =?utf-8?B?dWFaeUxieFU0c0t2TFkrT1U3V0Y4cnNhNEYzK3g2ZFdsN1Y3LzFqRVVQdmRE?=
 =?utf-8?B?MmFLZzdHbzZ3eGFoTW5oVDd6TFBmenMwSnZGVHRNanVaakh2NGxtT2FwRExo?=
 =?utf-8?B?b1ZJVmJtZ3JGMmZjbm95QWgvYXFJNDU0RHhvR0hOUWtwaGthNkRkSGNmY21r?=
 =?utf-8?B?VmJYaTdRWGtMSk5ZSEIvQXdQNVUzZVpndE1YR2g5NCsyT2pBa3dodGtDUk8z?=
 =?utf-8?B?SHYrQ1E3UzdtUnJ1WmIzdHZDajkrbFVLZlh3N0Zsc1VabnlzMGhOR21XWWxC?=
 =?utf-8?B?SFpYWjVCL2xMd0t4bkhTSUNtV1ZuMVY3SWZ3dk9nNGtuWmlOSCtKVkxHSkRx?=
 =?utf-8?B?VTVtQmVubHdKOVJzMXlUU0lGQVJiS1dobm4zYnRtTkRJZGlLZzV2WGhpVVA1?=
 =?utf-8?B?TUZJKyt6YmJicDIvcTd5Yk5wdjlYWlBJb0ZBcVc2NzV3dlZPWEduUlJHeExT?=
 =?utf-8?B?MEdLQ2ZnOXc3VWhtZ0FWYUZpeHFHc0lOUVcwVXpwUUZiTktXclJreWxxaHNo?=
 =?utf-8?B?YXN1NnJ5eDJ2dnV2bUd3MTJscEZDaXZ6TWFkQ0xBL3FIaWliMWZ0ZnZpN3BF?=
 =?utf-8?B?RG1INEFYeno2ajlJQU9Qa2FMM0dEcUgxTkg0T0RZR3kzbDdzQVZMUFV1ODdw?=
 =?utf-8?B?UjBveUlNaEZkYUl4dUxDVlhPYUx6YWFCQUNsS0c1a2o3OENzeEMyQT09?=
X-Exchange-RoutingPolicyChecked: nd6e4ffWpjWY+hZNrObcLbrJxYA2U5nLXStdUN33vdS+FEpo44TQycaxLcU/SW3J+ejuD+yY0vBQIRuR1boNyEMwhMXQlm8Up/4iuVNPwNBgrh1vbMaXkLv3e5xxJUMkeg9XxGqv0sbGeE8PyD37rYmQ0o2Fn8iOiI4c01L3n5CTP7eO7zf8QDS4qP+7Dhd+hpLHzGiwGV3JH6ky3FCIVgv0hqTLn+7ur73DSoI66sMGhxFChE6N5yGxXc80yej58gUd5F4icIUpJxTJBSRIfwKssPWfSmGFKT1hgUqkutyrEUGAZs2ibmD5CVJ5cIAmx7xjhHFIYAF1Fvf8/J1bqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a6c6d4-0829-4f19-f5b7-08df4588f2f2
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:31:00.4729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHmxcALwC+rv1a4ttA6fxTWZtnXyEZ0YKQJxnBdbzKEUw5Jh64kVUhd2MmfAWjvXDTwqQwAOLy8y5DUHL61OQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB533224
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------yy2h10ubC2FKLKjB0rwE9f01
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 17-11-2026 20:57, Rodrigo Vivi wrote:
> - Drop the sdk_api_version check (it also saves a mailbox call). Just check
>    xe_sysctrl_is_oobmsm_fw_ready().

This is fine across D3Cold but not for module reload.

If a user/developer wants to try a different OCode version, the new 
version won't be LBed until the system is rebooted.

Thanks,
Badal

--------------yy2h10ubC2FKLKjB0rwE9f01
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17-11-2026 20:57, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:avxyUc1VLSYm7DbG@intel.com">
      <pre class="moz-quote-pre" wrap="">- Drop the sdk_api_version check (it also saves a mailbox call). Just check
  xe_sysctrl_is_oobmsm_fw_ready().</pre>
    </blockquote>
    <p>This is fine across D3Cold but not for module reload.&nbsp;</p>
    <p>If a user/developer wants to try a different OCode version, the
      new version won't be LBed until the system is rebooted.
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>&nbsp; &nbsp;</p>
    <p>Thanks,<br>
      Badal&nbsp;</p>
  </body>
</html>

--------------yy2h10ubC2FKLKjB0rwE9f01--
