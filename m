Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA93606A888
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 13:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VsnfpJv9;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=lkMRHvzi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E7311212D;
	Thu, 12 Nov 2026 13:58:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B3011215A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 13:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794491911; x=1826027911;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NHxUTaNGeUhsHl2NVlFXjR8/+mvtRtCfrdsFr9IsadU=;
 b=VsnfpJv92b3UWXLRwE5qti8r4LsGuMEFO/tftNEAMw8J2hNTUPzCqFe5
 RYrVk78zEoqDPPtgTwFSNzDeoESqEUHMx8i6M+8SJtQZudq5qnqJA7I5l
 Cm9Fxbjwqn4ycg00BaiQtj9MUPf5ZJ3XOnF7s3E6ZdUOBbFZdQzAuJr3A
 A9CtaCQ9bcbm/iRmtaVQef7tIwSXiLOhw10zFfsK8VZd3CwQd5slrBFlR
 Xwtm3zjpUPGuOOzhF4BaitexJc9jRQZtRMhWuTDDUCvN1w4O+XZYbUwem
 HiLtn+SxillfOjwa2HkT+T08hO+T8JwpfYC81uVWKBZop2JkCMFnop2q3 A==;
X-CSE-ConnectionGUID: Yf12MFaRTkmRM4xMC4S7Gw==
X-CSE-MsgGUID: SDussASqTUCAsMyuifLbrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3307861"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3307861"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 05:58:31 -0800
X-CSE-ConnectionGUID: oTcZ4B8cSa2r5D/T2ZyKjw==
X-CSE-MsgGUID: eLvqSUqtQgahmzuv2ET4oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8489526"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 05:58:30 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 05:58:29 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 05:58:29 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 05:58:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ez6isP+RYH2+hskTY/bg5nFaqcaV93JUgY+doB5yPKTZKtjQPG6aQU/SdRIGY/bn4qWiAIsppMCdwh/svQKeRLDOQHHBvcdAIEy2s4fpNNLXizt/vq+wiKYL1XsbdD7GB5WaDd6U27tz2Hd+vhDidY/WIUQq+NK6di09sSCpB35i78MlD16ZeuIMp+wHj6Cx0g+n5NlpqGOpU7oOV/+FgDl8vCWTKVS2ZRV+e3orK99ol1C6iuP5va25UKL1KIAt2Ah8Lu1aJvCFKt3KR2lMBn7MrC25ELW5JRUr5f6SfGT9zFKCZcuw04gUUQU8ZQTLJ7HNOPrklbkYWZm0SBlMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qx1XhMyHLpRm5yfHP0wKtUm47fBOOUiJzKuW8XG8fg0=;
 b=UcHQ6QYICUok+ypCX90FBdoF/zvaz+Z5Tc2piWnA0UmJkVcyqx6mhFpp+QWXAlWXtoGQgxn8aZk8rCepq7uQDpniZbxJ27Pmdd0/4VgMFLvA01q1gTRscUYv/uqdZsoRVGmPO6weZvan74N32P0qfWK/4vmOqImLJTDoG0TzGnlfemRGqaGptJqyQrErFVGF83fDLcCp0itGSbSWjeSmxi175k9cVl7TWvyPOiJ7KaBaikb5bFcIhGNKJgvAB9rdUpF8BsPgE86F7bTHMHtgBpTzgGHalqEgzwRqwC8+Duq5DlwurkdcAw/DefoqLDK3LAxBSJIRQQyRvd52xPL0dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qx1XhMyHLpRm5yfHP0wKtUm47fBOOUiJzKuW8XG8fg0=;
 b=lkMRHvziCOs1U/OSTJkDNxhPZYVTPJH/qLqyZMjQoZX8QdqbXRK4IStx7r95O22N2L0sT0Qr26unDbEyUEuS9tfgfwueu40O5Vnq75JKDnShOEqjW3exJ/ZGt7T3mezVX1c0sjN1U07D1WM4APRMU16ZuN99kTFIV0C+h9uH05o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by EAYPR11MB9945.namprd11.prod.outlook.com
 (2603:10b6:303:2d5::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 13:58:27 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 13:58:27 +0000
Message-ID: <694b2214-4285-4f46-8c46-ee4691c5dd1c@intel.com>
Date: Thu, 12 Nov 2026 19:28:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Add a per-client debugfs file reporting bo
 NUMA node distribution
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matthew Auld <matthew.auld@intel.com>, Andi Shyti
 <andi.shyti@kernel.org>
References: <20261104151335.163299-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: Himal prasad Ghimiray <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261104151335.163299-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0342.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::9) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|EAYPR11MB9945:EE_
X-MS-Office365-Filtering-Correlation-Id: 71193468-4ef2-4402-cecb-08df40c50646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|6133799003|261009223027099003|3023799007|261021123027099003|11063799006|10067099003|261102123227099003|261028144727099003|261102130727099003|261026121527099003|261022105027099003|261026140227099003|56012099006|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: +Kk7Aq2Adjvt0Vz6P4Nw17ug6VnhFdgjJqj170y7HgHRUm5/VJT4ze//264n3jeJ0EwE5+FvVuOAEJdJaE8+94mC2ugNG4g9VXmKGSsMHiq1Q48X5baJvg3/S+62Air8px16CujE9tTMV1PvmXEUcljGz4hPZUL6Ijt0z7YKd+DeMalXq+4wn+ZmP9Nc0R06AW7GVaLW1CX9zJYaRfcFRpXGprKN+AwKDYDu7tcVXKXsI91DMbYPmCypSEXt1TCabe313zZKPLwPtSVD/mPiB+Fwqu4ryVm1tXIaHbBDcV5usmSS1C+mIWqZ0ViA5asPJaTlfGr2wXR2gSOpQA4znq4t7N+CjdXawNvWWr61ohwFgYMeeItkUi5BUMLNfdbn2HQvYdv2Vd6Ulx1BwpaOVTmOt8DqhilrR2It2FEzoW3eBCbhIxWhG81H8/55eJMNDkPPhIIq2Y2+q+0ZIdljRXXdI0O9lGkr3dMK7qjuCR27x4Noi/VP6gPlFwk0EHQTn3Sxk1dZ5JO3uPjjhgJsQtQ+Eext7oG/NPy0a8XeZvmfNVP3TzqkW9ZwEPlPx6C1uBOUuzKyMbPS2ELiFIPAg76+LRr7q+GsmFDpJZROdWLo6uXXoQDJAr2Z6GhRfrtgHSuaZObNyIU7vWdOnFRPlndEjMEymY7g37Dc6BlWgyo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(261009223027099003)(3023799007)(261021123027099003)(11063799006)(10067099003)(261102123227099003)(261028144727099003)(261102130727099003)(261026121527099003)(261022105027099003)(261026140227099003)(56012099006)(261022075727099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzZ4V1RhUXl2ZUdjcml4MVZtTTdKVSt4eGZCMHV5ejEyZVhKL05FOHpWT2F0?=
 =?utf-8?B?cFdFNkxSYmFoVVNsMUphREJtREVPWXEwajhVVE41T3N2bHFLdUJwTm1nNWZ0?=
 =?utf-8?B?a09ld09neEJDR1poellOK25kMGtaMS9sNEZhcFZVMGlMOC9EWmhJcXhNeWNa?=
 =?utf-8?B?SytxOUdtcXRSbmdqN2dvMTJLaGkvK2RnNVgvMzNkNURwVkNGWWUyN0ZZb2R5?=
 =?utf-8?B?bW5senpPa0hGL3BzRkZhTWVjTGRxSUt2UWJiWFZGa1E1emdJc1Y5MXM2bWk0?=
 =?utf-8?B?UGdSeXp0Vmd6YjZSYUJUbHlsSkRSUlBJb3pkWHAxRW5uZUFOYm1IdlQ4ZjdU?=
 =?utf-8?B?aVQwNEozZmZjMG5uQzIrN2prQXZXb3FzVUF6djlKV1U3MVNZVk4wdzlPcVhz?=
 =?utf-8?B?WS9nV1piNHZqdTlmQ2QrcmFtQnBGWGR0QWUvWUtsWmJEQWduQVpJN01aaXp6?=
 =?utf-8?B?U3dvN21xbzdhd1Q4dGhZVnJST1R4WU50SzAyMHlYUnR3RVZUempQMDgrdzlG?=
 =?utf-8?B?Sm1oN1F5bVdRNTRBZFZ5dXJKSTRZM0huVHM3ZGQweTlQNnpzeFFQN2lNb3lX?=
 =?utf-8?B?T3IxeDJBMDQ2bzA5TktIUUZUSGNkNFYvbk4wc0ZxeFk4UWFDZCt3dHZTbzN2?=
 =?utf-8?B?VVA4L1FXNDE0eloxK2FYOGczWGExMWZ1bFlzNHlOVC9FREU5bEMwUmc5RE9t?=
 =?utf-8?B?U0pHSEFVY3FnS0ZIQTdJc3kwbDM3cHAvOGN0VDMxSWdBK2hUYkhqdVIybnJB?=
 =?utf-8?B?dzRuTExLNFpVb2lFKzZIR1pIb290M0IzSjY0aG5tNW0xRGhIdGQ2L2Erb0Zj?=
 =?utf-8?B?OWhpcDdDbWZpYmlzd2xpSE5hb0xKK1d4VllOYVJIQXc4Rkg1czBHQ0RhYS9F?=
 =?utf-8?B?MUJzdVgvMTJZVkNSaitUcTZxb1RqNDVOK3phU1RISFNxZGlQMHVya0lCOXVC?=
 =?utf-8?B?VkdwOVFUMEZoV1I1SFlDTXlOUysxSktLbjlGY3dMVG02Q2w0a2FZMzlONHNo?=
 =?utf-8?B?clNkTGFNaVU4RHNRYWQ4L0hOVFNnV1dPRE9GNWxYY0luL0ZFNXpGRk9NK1BH?=
 =?utf-8?B?bnVnVG5wdmlrSG5VM2c1SDRKakVLOURtaFE2NitjakZSTWg3ZjNUajR0Tndz?=
 =?utf-8?B?QnozWTg5WksrSGFYOFIxZ3huRFNlMnpVaW1Md1Q3cVkxdjE4Nnp5N244eW42?=
 =?utf-8?B?WjVuMm4wNmpldFBqMURvTElyM041alRyR2NZOUg4aWYzclF0VmZ4KzlSNWto?=
 =?utf-8?B?SnhxbkpOdXZpeGN4Z2tObGJFYVFsSWxuNmdRVEVUSHB0ODdScG9EdnJzYnpa?=
 =?utf-8?B?NUJFYURPNlhyYWc3YkN3b3lwd1hMRkExOFY2VWVlUFg0V2FWcCtqZFBGcUNo?=
 =?utf-8?B?bUJxc1c1KytHYTFuRkN0N0JOaUFSMmUvNmZnYVFnN210VjIxSk5oeTB0QXZm?=
 =?utf-8?B?RThITnlGNTNraG04WTlqaDJDVjhpd3VIelFJVFcvWi9LbnpVZVVHYXFiZ2dW?=
 =?utf-8?B?VWlSbzhHQzN2ZFU0Q0tPVUV2dnpIc21JeWpWeDRKbEsyMVV5TWphU2tLNEVY?=
 =?utf-8?B?WEt3VFBqVjl2SzB6d3pMc1I5MlV6MWYzc0pmRFBUOHpqcXhmTzI4VEt5ZXJy?=
 =?utf-8?B?bmpGbjVwMXdUVXlXUEtvTWt0d05xakJ4UGV3T3JXWkZNSFpPbGZzWTRaZmJI?=
 =?utf-8?B?MUd2OStOV2F3L0l4ckZuNEV4Y1F2RXFLT20xYWNxL29qRUtLTTJQTUNMeDRJ?=
 =?utf-8?B?SFNmbFAwbitxbHNvSWF1SmhuUzZuRFlEVEVzT2sxYUIvUWV4SE50SkM3ZW5Y?=
 =?utf-8?B?cURDV1p5blgyQ3JaZHdhTUNMOVFrOHhnc2ZHWXN3M0VMZXU5L1FaS0xOd2h1?=
 =?utf-8?B?TVIwL09hSkdkdHZSNTdROFNOSElQSVpkbzdaQWUvSHNnTkJmbGRBTFhJNE5l?=
 =?utf-8?B?bkxhSmZEZVFUV284TWlVYUpTYWpJdFVBanpTVGRqZ2ZWditFMUVLaGcwNFMv?=
 =?utf-8?B?MEN1NGRWODlBdHhObXRFYmFBUDZUT0cvbzFWTHBnblZRcTBLZDhpV0d2TFJJ?=
 =?utf-8?B?OEVhdzE4bDFDUVZWb1hhOVhKKy8vUGp0TXFEcFF3dUl0V0RaeXRwcEJiaEpX?=
 =?utf-8?B?VXoxTFQzcVV2cGI3MWRzOEhjK0hpSkZLbkc0Q2lSTDQ2UEtGQzZvRVRIYWhm?=
 =?utf-8?B?bTEyUlM4dnJGb1RDdXIrWW85d0lveVE3REFHb1BnYUVIZm5ZQzlNU1p4bkR2?=
 =?utf-8?B?VUxCLzczRktVY0xhdnp4S3ZqbDYwdE43NHFSL1R0THFTczJXUW5BazJyOXI0?=
 =?utf-8?B?ZFE1aGZyVTk4WVBsYjYwaElBYmxhQlhrMTNjM0tXWFpJMFlWeFcwSW9PM0Fv?=
 =?utf-8?Q?0RkZJF3A5cshNVbQ=3D?=
X-Exchange-RoutingPolicyChecked: QYXzJaBt+6I8hkSEJclnP1l+FZWNA39Tv+T761GR01SjTUGNITDCblVCMLSQPYCzaowMZJhcJlra+vk6i00owxawK4arUp4vRgFmlxDZQxw9YJF6Li29NCTQes+bAR7da44ZijFcZrCZXc/GqbleDjaeCusU/kkkfZ7mhtQc88i8KofUeZN+vylWPjnDKU1hce2nIoTwr7Xn8oG7uK0ZN6JTf9gGqTI4fwJnBDRBAICfFOeeQXFlVnpSafpZaShdah192HhCSh0i1kFWaBXNeKcXn9SWaEFYfVK/5dCbUlDNSEzXZ+LJhaLRSgG6ytz0KsjQHaY2nEwPfh1KPQXXfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 71193468-4ef2-4402-cecb-08df40c50646
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 13:58:27.2235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7AANkf3x7F4IidJosMhf9caxs5qp1KSGHyJ2Pu0MKRFBkNSDpbOqpzTSOg7ppJlBEDItsrYnwGM0d3+CAN00QHXGDW/0/ajmfeoKRbVS89I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR11MB9945
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


On 04-11-2026 20:43, Thomas Hellström wrote:
> When debugging NUMA placement of bo system memory, there is currently
> no way to tell on which nodes the pages backing a bo reside. The
> /proc/<pid>/numa_maps interface doesn't help since bo CPU mappings are
> VM_PFNMAP, and clients may have thousands of bos, so a dump of all bos
> is undesirable.
>
> Add a "bo_numa" file to the drm core per-client debugfs directory,
> client-<id>/. The file implements a request-response protocol per open
> file: Writing a GEM handle valid for the client takes a snapshot, under
> the bo's dma_resv lock, of the bo size, placement, and the number of
> pages on each NUMA node. A bo whose pages are swapped out, backed up
> or purged is reported as swapped/purged, and one whose pages are not
> populated as not populated. Subsequent reads return that snapshot. Once the
> snapshot has been completely read it is discarded, and a new handle
> may be written. Until then writes fail with -EBUSY, so that a pending
> snapshot can't be replaced before it is consumed. This allows querying
> many bos using a single open file.
>
> The write-request / read-response protocol per open file follows the
> simple_transaction helpers in fs/libfs.c, used by e.g. nfsd and
> selinuxfs, and amdgpu already populates the per-client debugfs
> directory with its vm_pagetable_info file.
>
> For sg bos, typically imported dma-bufs, the backing pages are owned
> by the exporter and can't be inspected, so only size and placement are
> reported.
>
> Example:
>    exec 3<>/sys/kernel/debug/dri/client-<id>/bo_numa
>    echo <handle1> >&3
>    cat <&3
>    echo <handle2> >&3
>    cat <&3
>    exec 3>&-
>
> The client id can be obtained from the drm-client-id fdinfo key.
>
> v2:
> - Use drm_coredump_printer_is_full() (Andi Shyti)
> - Drop the Assisted-by tag and add a Signed-off-by (Andi Shyti)
>
> v3:
> - Report swapped or purged bos as swapped/purged (Sashiko)
>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@kernel.org>


Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c      | 109 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_bo.h      |   6 ++
>   drivers/gpu/drm/xe/xe_debugfs.c | 157 ++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_debugfs.h |   3 +
>   drivers/gpu/drm/xe/xe_device.c  |   2 +
>   5 files changed, 277 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 42a6aa1a2e4a..ee232e73bc3b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -6,12 +6,14 @@
>   #include "xe_bo.h"
>   
>   #include <linux/dma-buf.h>
> +#include <linux/nodemask.h>
>   #include <linux/nospec.h>
>   
>   #include <drm/drm_drv.h>
>   #include <drm/drm_dumb_buffers.h>
>   #include <drm/drm_gem_ttm_helper.h>
>   #include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
>   #include <drm/ttm/ttm_backup.h>
>   #include <drm/ttm/ttm_device.h>
>   #include <drm/ttm/ttm_placement.h>
> @@ -4248,6 +4250,113 @@ void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
>   	list_del_init(&bo->vram_userfault_link);
>   }
>   
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +static void xe_bo_count_numa_pages(struct ttm_tt *tt, unsigned long *nodes)
> +{
> +	pgoff_t i;
> +
> +	for (i = 0; i < tt->num_pages; ++i)
> +		nodes[page_to_nid(tt->pages[i])]++;
> +}
> +
> +static void xe_bo_print_numa_info_locked(struct xe_bo *bo, unsigned long *nodes,
> +					 struct drm_printer *p)
> +{
> +	struct ttm_resource *res = bo->ttm.resource;
> +	struct ttm_tt *tt = bo->ttm.ttm;
> +	unsigned long total = 0;
> +	const char *name;
> +	int nid;
> +
> +	xe_bo_assert_held(bo);
> +
> +	name = res ? xe_mem_type_to_name[res->mem_type] : NULL;
> +	drm_printf(p, "size: %zu\n", xe_bo_size(bo));
> +	if (name)
> +		drm_printf(p, "placement: %s\n", name);
> +	else if (res)
> +		drm_printf(p, "placement: mem_type %u\n", res->mem_type);
> +	else
> +		drm_puts(p, "placement: none\n");
> +
> +	/* The pages of sg bos are owned by the exporter and not visible. */
> +	if (bo->ttm.type == ttm_bo_type_sg) {
> +		drm_puts(p, "pages: unknown (sg bo)\n");
> +		return;
> +	}
> +
> +	if (tt && ttm_tt_is_swapped(tt)) {
> +		drm_puts(p, "pages: swapped/purged\n");
> +		return;
> +	}
> +
> +	if (tt && !ttm_tt_is_populated(tt)) {
> +		drm_puts(p, "pages: not populated\n");
> +		return;
> +	}
> +
> +	if (tt)
> +		xe_bo_count_numa_pages(tt, nodes);
> +
> +	for_each_node(nid) {
> +		if (!nodes[nid] && !node_online(nid))
> +			continue;
> +		drm_printf(p, "node%d: %lu\n", nid, nodes[nid]);
> +		total += nodes[nid];
> +	}
> +
> +	drm_printf(p, "total: %lu\n", total);
> +}
> +
> +/**
> + * xe_bo_print_numa_info() - Print the NUMA node distribution of a bo
> + * @file: The drm_file of the client owning @handle.
> + * @handle: The GEM handle of the bo.
> + * @p: The drm_printer to print to.
> + *
> + * Print the size and placement of the bo and, for bos with
> + * driver-allocated system pages, the number of pages residing on each
> + * NUMA node. If the bo's pages are currently swapped out, backed up or
> + * purged by the shrinker, the bo is reported as swapped/purged, and if
> + * they are not populated, as not populated. For sg bos, typically
> + * imported dma-bufs, the backing pages are owned by the exporter and are
> + * reported as unknown. The information is gathered under the bo's
> + * dma_resv lock and thus represents a consistent snapshot.
> + *
> + * Return: 0 on success, -ENOENT if @handle doesn't refer to a bo,
> + * negative error code on other failures.
> + */
> +int xe_bo_print_numa_info(struct drm_file *file, u32 handle,
> +			  struct drm_printer *p)
> +{
> +	struct drm_gem_object *obj;
> +	unsigned long *nodes;
> +	int ret;
> +
> +	nodes = kcalloc(nr_node_ids, sizeof(*nodes), GFP_KERNEL_ACCOUNT);
> +	if (!nodes)
> +		return -ENOMEM;
> +
> +	obj = drm_gem_object_lookup(file, handle);
> +	if (!obj) {
> +		ret = -ENOENT;
> +		goto out_free;
> +	}
> +
> +	ret = dma_resv_lock_interruptible(obj->resv, NULL);
> +	if (!ret) {
> +		xe_bo_print_numa_info_locked(gem_to_xe_bo(obj), nodes, p);
> +		dma_resv_unlock(obj->resv);
> +	}
> +
> +	drm_gem_object_put(obj);
> +out_free:
> +	kfree(nodes);
> +
> +	return ret;
> +}
> +#endif
> +
>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>   #include "tests/xe_bo.c"
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 77b3a02e9b8e..13197e4e0358 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -112,6 +112,7 @@ enum xe_madv_purgeable_state {
>   	XE_MADV_PURGEABLE_PURGED,
>   };
>   
> +struct drm_printer;
>   struct sg_table;
>   
>   struct xe_bo *xe_bo_alloc(void);
> @@ -458,6 +459,11 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>   		      struct drm_device *dev,
>   		      struct drm_mode_create_dumb *args);
>   
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +int xe_bo_print_numa_info(struct drm_file *file, u32 handle,
> +			  struct drm_printer *p);
> +#endif
> +
>   bool xe_bo_needs_ccs_pages(struct xe_bo *bo);
>   
>   int xe_bo_decompress(struct xe_bo *bo);
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index e59d4964d811..1a74a7106462 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -11,6 +11,8 @@
>   #include <linux/string_helpers.h>
>   
>   #include <drm/drm_debugfs.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_print.h>
>   
>   #include "regs/xe_pmt.h"
>   #include "xe_bo.h"
> @@ -785,3 +787,158 @@ void xe_debugfs_register(struct xe_device *xe)
>   	else if (IS_SRIOV_VF(xe))
>   		xe_sriov_vf_debugfs_register(xe, root);
>   }
> +
> +/*
> + * Per-client "bo_numa" file: Report the NUMA node distribution of the
> + * system pages backing a single bo.
> + *
> + * The file implements a request-response protocol: write() takes a GEM
> + * handle, valid for the client, and takes a snapshot of the bo's page
> + * distribution under the bo's dma_resv lock. Subsequent read()s return
> + * that snapshot. Once the snapshot has been completely read, it is
> + * discarded and a new handle may be written. Until then, writes return
> + * -EBUSY, so that a pending snapshot is never replaced before it is
> + * consumed.
> + *
> + * See xe_bo_print_numa_info() for the snapshot contents.
> + */
> +struct bo_numa_snapshot {
> +	/* Serializes reads and writes on the open file. */
> +	struct mutex lock;
> +	/* The pending formatted snapshot, or NULL if none. */
> +	char *buf;
> +	/* Length of the formatted snapshot. */
> +	size_t len;
> +};
> +
> +static int bo_numa_open(struct inode *inode, struct file *f)
> +{
> +	struct bo_numa_snapshot *snap;
> +
> +	snap = kzalloc_obj(*snap, GFP_KERNEL_ACCOUNT);
> +	if (!snap)
> +		return -ENOMEM;
> +
> +	mutex_init(&snap->lock);
> +	f->private_data = snap;
> +
> +	return nonseekable_open(inode, f);
> +}
> +
> +static int bo_numa_release(struct inode *inode, struct file *f)
> +{
> +	struct bo_numa_snapshot *snap = f->private_data;
> +
> +	kvfree(snap->buf);
> +	mutex_destroy(&snap->lock);
> +	kfree(snap);
> +
> +	return 0;
> +}
> +
> +static ssize_t bo_numa_read(struct file *f, char __user *ubuf, size_t size,
> +			    loff_t *pos)
> +{
> +	struct bo_numa_snapshot *snap = f->private_data;
> +	ssize_t ret = 0;
> +
> +	mutex_lock(&snap->lock);
> +	if (snap->buf) {
> +		ret = simple_read_from_buffer(ubuf, size, pos, snap->buf,
> +					      snap->len);
> +		if (*pos >= snap->len) {
> +			kvfree(snap->buf);
> +			snap->buf = NULL;
> +		}
> +	}
> +	mutex_unlock(&snap->lock);
> +
> +	return ret;
> +}
> +
> +static ssize_t bo_numa_write(struct file *f, const char __user *ubuf,
> +			     size_t size, loff_t *pos)
> +{
> +	struct drm_file *file = file_inode(f)->i_private;
> +	struct bo_numa_snapshot *snap = f->private_data;
> +	struct drm_print_iterator iter;
> +	struct drm_printer p;
> +	size_t bufsize = PAGE_SIZE / 2;
> +	char *buf = NULL;
> +	u32 handle;
> +	int ret;
> +
> +	ret = kstrtou32_from_user(ubuf, size, 0, &handle);
> +	if (ret)
> +		return ret;
> +
> +	ret = mutex_lock_interruptible(&snap->lock);
> +	if (ret)
> +		return ret;
> +
> +	if (snap->buf) {
> +		ret = -EBUSY;
> +		goto out_unlock;
> +	}
> +
> +	/*
> +	 * Retry with a larger buffer until the snapshot fits. The coredump
> +	 * printer is used as a generic bounded buffer printer, and reports
> +	 * when its buffer is full.
> +	 */
> +	do {
> +		kvfree(buf);
> +		bufsize *= 2;
> +		buf = kvzalloc(bufsize, GFP_KERNEL_ACCOUNT);
> +		if (!buf) {
> +			ret = -ENOMEM;
> +			goto out_unlock;
> +		}
> +
> +		iter = (struct drm_print_iterator) {
> +			.data = buf,
> +			.remain = bufsize,
> +		};
> +		p = drm_coredump_printer(&iter);
> +		ret = xe_bo_print_numa_info(file, handle, &p);
> +		if (ret)
> +			goto out_free;
> +	} while (drm_coredump_printer_is_full(&p));
> +
> +	snap->buf = buf;
> +	snap->len = bufsize - iter.remain;
> +	*pos = 0;
> +	buf = NULL;
> +
> +out_free:
> +	kvfree(buf);
> +out_unlock:
> +	mutex_unlock(&snap->lock);
> +
> +	return ret ?: size;
> +}
> +
> +static const struct file_operations bo_numa_fops = {
> +	.owner = THIS_MODULE,
> +	.open = bo_numa_open,
> +	.release = bo_numa_release,
> +	.read = bo_numa_read,
> +	.write = bo_numa_write,
> +};
> +
> +/**
> + * xe_debugfs_client_add() - Add xe-specific per-client debugfs files
> + * @file: The drm_file of the client.
> + *
> + * Populate the drm core per-client debugfs directory with xe-specific
> + * files. The files are removed by the drm core together with the
> + * directory when @file is released.
> + */
> +void xe_debugfs_client_add(struct drm_file *file)
> +{
> +	if (IS_ERR_OR_NULL(file->debugfs_client))
> +		return;
> +
> +	debugfs_create_file("bo_numa", 0600, file->debugfs_client, file,
> +			    &bo_numa_fops);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
> index 88d91c78036b..90effba271d9 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.h
> +++ b/drivers/gpu/drm/xe/xe_debugfs.h
> @@ -8,6 +8,7 @@
>   
>   #include <linux/types.h>
>   
> +struct drm_file;
>   struct xe_device;
>   
>   #ifdef CONFIG_DEBUG_FS
> @@ -16,12 +17,14 @@ bool xe_fault_csc_hw_error(void);
>   bool xe_fault_wedge_cold_reset(void);
>   bool xe_fault_mempage_offline(void);
>   void xe_debugfs_register(struct xe_device *xe);
> +void xe_debugfs_client_add(struct drm_file *file);
>   #else
>   static inline bool xe_fault_gt_reset(void) { return false; }
>   static inline bool xe_fault_csc_hw_error(void) { return false; }
>   static inline bool xe_fault_wedge_cold_reset(void) { return false; }
>   static inline bool xe_fault_mempage_offline(void) { return false; }
>   static inline void xe_debugfs_register(struct xe_device *xe) { }
> +static inline void xe_debugfs_client_add(struct drm_file *file) { }
>   #endif
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 273e2c45fea9..e1f457d03b09 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -126,6 +126,8 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>   		put_task_struct(task);
>   	}
>   
> +	xe_debugfs_client_add(file);
> +
>   	return 0;
>   }
>   
