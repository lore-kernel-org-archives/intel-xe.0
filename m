Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92CB606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jiZyL/cn;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=JRjFcuNd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED4210E29A;
	Thu, 26 Nov 2026 13:02:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DA710E0A9;
 Thu, 26 Nov 2026 13:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795698125; x=1827234125;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P+XNw+Gfjdsa1sq5b6xiQNyngnmZn4dMkjxcmkX7SXE=;
 b=jiZyL/cn9iCrRPdCvs1VSqXBQWYIATGQiZMzPtbkthnMOxaNuoTPfHGu
 9LGW5JnWX8eiJohAgK3oc/9haFOFQbCljJk55M/5ASHiQo/p7+TZeSdZs
 GMDLmh2ZbKFUV52bwehYoIEo9EyqGJLOWUndwsPQ7b3Ob3INlIZJvEFYL
 SqQsk7dDxRubxnAkEEephTOQWWc/a9sn6XbmrR8zOPjMBYdXLbE+F8mf3
 7e9vstMs5Ziyj2nRyegVk98ujMrCrqUvW3o5O1i8Z0JM2JTiFK4LGpGg2
 MvDQxVaracq1HolZxow6vEVUovWs+KCu9/vSdkguIgwAW3HKRoU0V+T5A g==;
X-CSE-ConnectionGUID: VKviyQfDRmmS6nucuRPHpw==
X-CSE-MsgGUID: j31CzIfCRICuAZCviCS2vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4693248"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4693248"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:02:05 -0800
X-CSE-ConnectionGUID: s97eCv4gQSuG2xR8sKmRoQ==
X-CSE-MsgGUID: W7FXPl3cRziPjUS0fbUG4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12587598"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:02:04 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:02:03 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 05:02:03 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:02:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8FWGp2v1PDpyOf8NUnbP4tXRMRkLNK9D7Wt79IB65lePOh/HOc/uKI2Y7BRo+H/wryJ4CJ76bNIAstOcUhA2yD2IChUfXYG1qHYk9hAZAAVmZ61ZSeZtuADMflk18Cy9z1db0fATaa51jMAIKPSAaJuACDclnca/pKTL06K1Lp3vEv7WS0xZllQd8Q7UVbn7savKpj0O583UkGBDs/tfCdMBO7Ctc2xpRMbeGbEHZJoSYVniDJ80reTp19zdCz9fAc39SNDnPDbswpQGVBm9Jbi+9u+bNSBEY/8z80V+51dpybzG1nZiUc0Rlx94Cbb1ZcA+CkMtfvivZ/hytmCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Hpxo4ljJT585PWTU6eriER9O5KIP55wV4FAyla9/2w=;
 b=QFKb96xk4dFxAnQpnrN8CN7CdCIklltwEGVA2F6Sht+FLCtK+nOG8bLhooG3tEGtlvhpMn2X+sb3Nf5p6s35DuvNT8yqqQ8sv+XqcNJuTCwLJN8Qt4K0uA5rqX2EH7ybB/TqZuhvqpTaoUfAfMWF62AGYif1/F74hjX88w+rLtqe79ET3mxvCK3OVfQJWgZA1A88fxPwjExnPIMaJKuNiMo18poLr9vdH/ju/nvx2wAYfAt6vAMeYQiV9g1WCkqenXf0d/ZbMmfgOzFD6SsqF280eisq/xV2DVimL4WbBrR2MJsfltUrL8U+UtUAgf4PlkhyJGvUXFhL/nBDd+eUng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Hpxo4ljJT585PWTU6eriER9O5KIP55wV4FAyla9/2w=;
 b=JRjFcuNdgDCt12YO3LQ7Nat1L50R+CMOSMR+JNkhSOIHw0KbdBUtwKHWG5U22ojSpfOz5561k6TYevorWFTzHz+dVT4lZfinJDz7+8SspB8bBb5IQ6ALmAAhBNw8wZIg6J/5GPElSXSZW0KHBZENskKuLWBrrGaF9ndVvV0lGJc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by PH0PR11MB4998.namprd11.prod.outlook.com
 (2603:10b6:510:32::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 13:02:01 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 13:02:00 +0000
Message-ID: <3f3d63ba-d5d0-4b46-bf79-19ad3bffdb06@intel.com>
Date: Thu, 26 Nov 2026 18:31:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] drm/i915/gmbus: move debugfs stuff at the end of
 the file
To: Jani Nikula <jani.nikula@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
References: <cover.1795607055.git.jani.nikula@intel.com>
 <aea3a014dcae0666a6336c075db34914dfc8ca57.1795607055.git.jani.nikula@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <aea3a014dcae0666a6336c075db34914dfc8ca57.1795607055.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::13) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|PH0PR11MB4998:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b059db7-0def-4edc-91a7-08df4bbd75ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|6133799003|22082099003|18002099003|11063799006|4143699003|56012099006|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261022105027099003|261022113327099003|261021123027099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: R7+uE+IZKWrdbZAshhRZc5k8Tij2P9OP4MTlGtwQyIrwi2OE8LHG8DPTGQ/zyg5kzbhKtpjhJYgqecBmlnbTPQX+i42ULoevROs8yAbs0wWZSdeS/5obE+7vXWQ32GKb4SA3x/GOfpj2ywe/r4wyOg6uV5m10YLVyHLk5PQF32uxMgbKWAZjcMqcwvq++kChCtIA97MczAXL1YHMDk7GbKDqu3h8jljUx5Jm/UXsD0SCfvwI654HX8pdfJMuH5xG86F/oHiw/6KtGQe9ZdEi1y3FCq3SgVB0XJ3czfCPdE+rXM9D9CleNB3hYNXB404QCF1loVl9f1fdJ8AJwP+kxPZULyMBRjTvN4R7TR4kQ2n2lXypIY87qssbwaaN5lb611jUZhUtBya5n7gvTj5rEIQGzIheZMWv11jHpzAOhNWKiIVCNWnJXcVxcfNlx2oDoxmW/gO39A+OFYR1u5OIzMDYP2iXv8E9JgUMQWYuEMjjzw7adKawBzt5L7CWXihxfLBeh9JRK2kXwKI3QV7hZrSncyJw4feZI01sRwAD7LJrlBWPisGNchwiVbdxYqZKVNJipKPXpeTlaWm11E1RgUtTfFVhRU/geI3AZ+26bTWGW5Dv0FBk2p21yYD5bstuIk3dAfjeVc0oGv4LRvjF5J17Desej2R7RwgVg+MoGZs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261022105027099003)(261022113327099003)(261021123027099003)(261102123227099003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWI2Ym8xeGpOT1B0ZFYrRjd5WTJ3bnM0UG9Kais5OXdlZ1VxbS94SEE0K0FX?=
 =?utf-8?B?dm41OXVVZEg0dUozaCt5TzZyY1pabVdMdVJnVlliZTVMTUYxSjlYWlJYbnhj?=
 =?utf-8?B?cnBGeHR6Z3czcEVEM2FMbWI3ZmpqVlcyZFVUV3NTY3RpcERsQTEzWWx3cGl3?=
 =?utf-8?B?RDZrME5HcWdkKzZ3dTdId0tjZWdoV2tQT2tNTG5DZkVhNXRkNXZYd1JRcEVp?=
 =?utf-8?B?RkZTZURXV096ZTgydFFhK3lJK0xjVGcxTEpaYXpFM1FlQlpJSFltUlZCbDlE?=
 =?utf-8?B?MnJpU1E3Zno4eDVoRUNFSWNjUWpNNk9pMnp1NjBVa3VScENmOXkwalJMbkVO?=
 =?utf-8?B?RE1vNGl0MkxoNVArTEhTQzVWUlRrTkZJKzdYd0tEM3pvb1hmdjRHaFc4VGcz?=
 =?utf-8?B?Z1JvRnF3QWJqTERjUklsaE90eWxoMnJQNytrcTk5dFROQ3U1NFFJYVEyQ05o?=
 =?utf-8?B?YnZKREFKai9NWWJGVkFpWUZjOUZzR1BMbVR3VG5kaXZycFRTM1hvdUZjcUs3?=
 =?utf-8?B?cGRjclVkUXZMVFpPZWc4Z2ltQXFncFhud2Z0OUNpN2NYNXhXNng4SmN0a1Mz?=
 =?utf-8?B?WERpOG0rVVZyRGlhNkViUUJxbHJMWWFYUVZtaFpObHlGbUpZMkVHc3hKZVVB?=
 =?utf-8?B?SnJnemFSOW0vbFZNT0dneFQxS3EzN3dqSWN6ZnRLTjdpU0pDQzJycERST0py?=
 =?utf-8?B?d3JITzltcDg3VlNxMjhKUSt6MXVKZ1YrSUorSUFPWnh5aUFHdXpmeVdMaU8z?=
 =?utf-8?B?Nm1raTVqM3RHbnh1VVIwOHp0dENMaWpWWjZVdzFqSnlrSmYrUUpoYWJ4VWRE?=
 =?utf-8?B?TEVKSk1VL2tGUm1Ga0phZTgzVkx3dk11RjB6RHlqZVRGM2RzT3YyZ2Z5WUdJ?=
 =?utf-8?B?L0xMNmVwK3dCVjN0di9iUGI1M1V3UWwyMG5oVXI1Vzd0Y0F3TlgwSmhhMzZx?=
 =?utf-8?B?eCtqUjZwY2hkRWlxUGdpQUVrelRkOEhVQkZVdmpXOERSQjAydXN1elBxS1oy?=
 =?utf-8?B?NkJxdFRlRGtpeHNJcDIyUzNKWmhia2svWW9Ga1FyTzV1WXFnTkZXN2wxUkRx?=
 =?utf-8?B?UW51L3JPd2ZVaTN0cDAxTGMwRHNleWxIMnpEdnphZktLenpTK0FSVFFob1Nw?=
 =?utf-8?B?ZjF5T0NUQTBFQzNJVHQxLzdMSytQYzViUm1PemF5UnlaMUcxdHZId0U2L29W?=
 =?utf-8?B?QUhYYk9oQzBHNjd0eVFnQlZtMEUvcFFsZW4wM3dlMXFYelBWdFF5SGhKdVY1?=
 =?utf-8?B?amVmeWlDaWgvRWJzMU1IamFKY3FmRk9iN1NnakdZclpWdU9ENUNjci8yUmhR?=
 =?utf-8?B?aktNRnhrNXJmUjVVc3JqQ2Z3TjFzQjRORFNqL1ZqYkRCOGJYcExxY0syTnh6?=
 =?utf-8?B?OERhWmxXNGIwUWNlczJXREswcGpQdWlEbVdyd1VWd0g5TkdlM3VuSHp6dW9r?=
 =?utf-8?B?dmJjZ3JTZ2JtNithbTF1cUN5NTF6WmtoeCt3bTJEdFNmTUl6QUFVSTVJdnBK?=
 =?utf-8?B?dGtCblFRVVBTbFNHemUxMnhnS3ViSlBzdG15OVNaRVBIVUVrWUtPMXNNbkpq?=
 =?utf-8?B?enpZMW01cFdIc2ptMGN0eXp2WlhtL3ZkQnBjUjlxc0RuWklFL1JGRzhpMlZm?=
 =?utf-8?B?c0RPY3FPejVGQmRnbGhSYStGQXg1QlV5eWVHWElmYWR4Nm03V2x1THlEVmR6?=
 =?utf-8?B?cDFYR1JSY0VyMG1IaTBSTytYWTZPQ3dqY3FQYVFBLzVYMWFJQW1IVVE4WXZw?=
 =?utf-8?B?WC95U04xbW5JYmhhNFR3d3loUWhzdDZITW5YazlIM1BBQ3N1VHJnVXhJWmdx?=
 =?utf-8?B?L2RCbS9nMlNYM3FqL1Y3V0p6NlpQTlNreld2ZnBzeFF5bzhKUHAzWHFsWGZk?=
 =?utf-8?B?VER6RlhNZTVsbmZzQmw0ZzB4MlpGeEdoZlgrL1JqWmpCS2hOdis0M290dEpi?=
 =?utf-8?B?d3gzcHkxN0M5SU5ZYmovMjBOSlhlRHlicVZJdVJ6b2xIMVhKeG9lVVNVbklK?=
 =?utf-8?B?ZjVRNUhqOFo2Vk1IK1g2UXFMT2hEWHN1dHR1N2NLMnZJNkhVaGZKMktLbkZL?=
 =?utf-8?B?eWNxdVA1SU1KQUdGcE5INjN4dFlLbkIwcE4xejZUVk9KVXRqMXJHMzNLZCsz?=
 =?utf-8?B?aENmOElWZEY5aUpnUEp5TGgyZk1qSDNGM3gyYVBhbk5JYkp6d1p3VUllMGVF?=
 =?utf-8?B?OFlwY2ZVbS9veFYxbTdHQXdIb203V2tOb0hpdjMzc3I4aVJCZ0I1dW9MelNm?=
 =?utf-8?B?S3RwU0ttSnJBeWd4RXVHeVF4MGxQZjZGZmhBVG54YmUvaFliOVUyM3A0dVF4?=
 =?utf-8?B?MTBYWENFeE9UcWZnMllDcEpPK3Q4eS81LzhoYzIvM2YyK3BiSWg2VTFpNFp0?=
 =?utf-8?Q?+tzSO8iK+bBrGm4Q=3D?=
X-Exchange-RoutingPolicyChecked: TU22z3DGLd/qVnDxDpCUXH5+AddREnUUqvr3gjA7nd4B3iEk++4Ee6JMLDln92RiJ2WDZdGs3wArlMa3Ci1GrWqR0dY5o+t+dwzHl4r9hIVdoXRX5B0GkNSHDnjH2oUd8btBUcYU36WL5zGboWaecKQErKGK+2AZymwVZT0a36QUYmhAbe8s1pnrmIG2Ws0j30Z4a8fJbJwu8SBxF7/9Mw0ej+yPVoqLb1f5bwIXp6OSgXdSe57Vj54L/aTrMald63GTorYns7yNhy1dXgFT8hHoY4n96dWQErXJwm7YOfyjGwC5Rp0zX8LKL7xjYFfUxqJ5bfKDCdcSCMU7lhMz/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b059db7-0def-4edc-91a7-08df4bbd75ad
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 13:02:00.8190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYXVg1xsqRbSb2Fei38jVZ2kIWwxb9X1iOQ9JPUynK38StCQUXUEMGImxUv0XFOaV8/9e4zWRx+aj/+prZVUN20UII7GuzqjYU+MrPdS1pE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4998
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


On 11/25/2026 5:16 PM, Jani Nikula wrote:
> Basically everywhere the debugfs scaffolding is at the end of the file,
> as it invariably uses functions that come first. Follow suit in gmbus.
>
> Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Should've spotted this while reviewing the original series.

Change LGTM

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_gmbus.c | 154 ++++++++++-----------
>   1 file changed, 77 insertions(+), 77 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index d43c81d362e6..70784e7dae2a 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -898,83 +898,6 @@ static bool intel_gmbus_is_adapter(struct intel_connector *connector)
>   	return adapter && adapter->algo == &gmbus_algorithm;
>   }
>   
> -static int intel_force_bit_banging_show(struct seq_file *m, void *data)
> -{
> -	struct intel_connector *connector = m->private;
> -	struct intel_gmbus *bus = container_of(connector->base.ddc,
> -					       struct intel_gmbus, adapter);
> -	struct intel_display *display = bus->display;
> -	bool force_bit_banging;
> -
> -	mutex_lock(&display->gmbus.mutex);
> -	force_bit_banging = bus->debugfs_force_bit;
> -	mutex_unlock(&display->gmbus.mutex);
> -
> -	seq_printf(m, "%u\n", force_bit_banging);
> -
> -	return 0;
> -}
> -
> -static ssize_t intel_force_bit_banging_write(struct file *file,
> -					     const char __user *ubuf,
> -					     size_t len, loff_t *offp)
> -{
> -	struct seq_file *m = file->private_data;
> -	struct intel_connector *connector = m->private;
> -	struct intel_gmbus *bus = container_of(connector->base.ddc,
> -					       struct intel_gmbus, adapter);
> -	struct intel_display *display = bus->display;
> -	bool force_bit_banging;
> -	bool changed = false;
> -	u32 force_bit = 0;
> -	int ret;
> -
> -	ret = kstrtobool_from_user(ubuf, len, &force_bit_banging);
> -	if (ret)
> -		return ret;
> -
> -	mutex_lock(&display->gmbus.mutex);
> -	if (force_bit_banging != bus->debugfs_force_bit) {
> -		bus->force_bit += force_bit_banging ? 1 : -1;
> -		force_bit = bus->force_bit;
> -		bus->debugfs_force_bit = force_bit_banging;
> -		changed = true;
> -	}
> -	mutex_unlock(&display->gmbus.mutex);
> -
> -	if (changed)
> -		drm_dbg_kms(display->drm,
> -			    "%sabling bit-banging on %s. force bit now %d\n",
> -			    force_bit_banging ? "en" : "dis",
> -			    connector->base.ddc->name, force_bit);
> -
> -	*offp += len;
> -
> -	return len;
> -}
> -
> -static int intel_force_bit_banging_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, intel_force_bit_banging_show, inode->i_private);
> -}
> -
> -static const struct file_operations intel_force_bit_banging_fops = {
> -	.owner = THIS_MODULE,
> -	.open = intel_force_bit_banging_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.write = intel_force_bit_banging_write,
> -};
> -
> -void intel_gmbus_connector_debugfs_add(struct intel_connector *connector)
> -{
> -	if (intel_gmbus_is_adapter(connector))
> -		debugfs_create_file("intel_force_bit_banging", 0644,
> -				    connector->base.debugfs_entry, connector,
> -				    &intel_force_bit_banging_fops);
> -}
> -
>   static void gmbus_lock_bus(struct i2c_adapter *adapter,
>   			   unsigned int flags)
>   {
> @@ -1144,3 +1067,80 @@ void intel_gmbus_irq_handler(struct intel_display *display)
>   {
>   	wake_up_all(&display->gmbus.wait_queue);
>   }
> +
> +static int intel_force_bit_banging_show(struct seq_file *m, void *data)
> +{
> +	struct intel_connector *connector = m->private;
> +	struct intel_gmbus *bus = container_of(connector->base.ddc,
> +					       struct intel_gmbus, adapter);
> +	struct intel_display *display = bus->display;
> +	bool force_bit_banging;
> +
> +	mutex_lock(&display->gmbus.mutex);
> +	force_bit_banging = bus->debugfs_force_bit;
> +	mutex_unlock(&display->gmbus.mutex);
> +
> +	seq_printf(m, "%u\n", force_bit_banging);
> +
> +	return 0;
> +}
> +
> +static ssize_t intel_force_bit_banging_write(struct file *file,
> +					     const char __user *ubuf,
> +					     size_t len, loff_t *offp)
> +{
> +	struct seq_file *m = file->private_data;
> +	struct intel_connector *connector = m->private;
> +	struct intel_gmbus *bus = container_of(connector->base.ddc,
> +					       struct intel_gmbus, adapter);
> +	struct intel_display *display = bus->display;
> +	bool force_bit_banging;
> +	bool changed = false;
> +	u32 force_bit = 0;
> +	int ret;
> +
> +	ret = kstrtobool_from_user(ubuf, len, &force_bit_banging);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&display->gmbus.mutex);
> +	if (force_bit_banging != bus->debugfs_force_bit) {
> +		bus->force_bit += force_bit_banging ? 1 : -1;
> +		force_bit = bus->force_bit;
> +		bus->debugfs_force_bit = force_bit_banging;
> +		changed = true;
> +	}
> +	mutex_unlock(&display->gmbus.mutex);
> +
> +	if (changed)
> +		drm_dbg_kms(display->drm,
> +			    "%sabling bit-banging on %s. force bit now %d\n",
> +			    force_bit_banging ? "en" : "dis",
> +			    connector->base.ddc->name, force_bit);
> +
> +	*offp += len;
> +
> +	return len;
> +}
> +
> +static int intel_force_bit_banging_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, intel_force_bit_banging_show, inode->i_private);
> +}
> +
> +static const struct file_operations intel_force_bit_banging_fops = {
> +	.owner = THIS_MODULE,
> +	.open = intel_force_bit_banging_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +	.write = intel_force_bit_banging_write,
> +};
> +
> +void intel_gmbus_connector_debugfs_add(struct intel_connector *connector)
> +{
> +	if (intel_gmbus_is_adapter(connector))
> +		debugfs_create_file("intel_force_bit_banging", 0644,
> +				    connector->base.debugfs_entry, connector,
> +				    &intel_force_bit_banging_fops);
> +}
