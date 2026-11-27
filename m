Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B590606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 05:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M0fZfqcp;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=CG8qlaLu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F286910FAA0;
	Fri, 27 Nov 2026 05:59:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EB110FBA0;
 Fri, 27 Nov 2026 05:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759145; x=1827295145;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y5L2W50yKCh8NgAa5RqD+dBFVLvLhY94soM1M3jWi3g=;
 b=M0fZfqcpyknkwWZVReHPWBfzFjQke2ZGTLYSpsfwmeNWlafQ/88CUo5E
 IABmWmJ+LnPE3AaBHJmgVJ2sEAZ6A+qRNB7xETM/NqTMji6UP44KfhVjo
 EkiUfHxRo5j538ZLtbclH+UTTngnSDTcgQjvjWKFRAX8tm373RzLi2kvm
 DyI1vkEsYsnUihVxZQfkjDiRJM0/8BaqOVPeG1Lamq6CBYOFVk7ijxshy
 cTBYKPdflA/DUHVllmDCNuJGuReR9rhpg6SwRr/ho+3feR1E7eaVYWY4O
 jg/WKyGgD5qtMbKwlRRLBS5g/oqBrZApFTbOs2/sXcHxC/ErX3GPk6mP/ A==;
X-CSE-ConnectionGUID: KxmZ9CqgQjGyu9YqsAVKzw==
X-CSE-MsgGUID: J3feyUMyQROm+M+WpzBKoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4575965"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4575965"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:59:03 -0800
X-CSE-ConnectionGUID: s89EYLOmRYmd0K5JE+wV7A==
X-CSE-MsgGUID: beXlJsrLT8uU8ZHP/pdC2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12176232"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:59:02 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:59:02 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 21:59:02 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:59:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGyNWrPad7usu5Y19IkRlgmzxd6gZiRVuiif0GYzDgC9CCdbNT7+Dnt4iM2SkS49zMZlfkW+MyqhuwPxe2t1HXTEzY14lQK/XmV8Hmp/lWD76Gm7WEJOV+edaEGLGCCIBpLXwz4qaeb5qVOHybnjCMUwBcC8So1Aj3WnMOATgfE8ZUYCScsbgF0EsbdywqXqjM93g4RNYY5U10pyihy651KMacMHHC8lcpDhnT8tmd8EZO2DgUw3G1QpK5rNtZqJZSwALyNkmcXKD7dTYE4bYGjx3GWeTAVRDYLeORJR7NLMHcM/cXlUZchZbA2MNJuE5PDBEdNGZ/XS3whTHlS6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wt8SyMHj83EKGeZrMldfRHPC6PBuu0Te/Va9HpbR8M0=;
 b=LWKxcSIZ3Wp8FcrAat83FQ+0WRZRaQDLfdyTs5Cr7aqEHjKI+9ehiwy6VOoqd6364SKBZ1awGOZu3atdJwSWmIji7zrN5yho6J/hLrt0uGPC6ko2ULynLsse90pAwxcT1B6fyABXLyaIFsw00PWfmQvJPP6R+MYyU0OJVk8YImn2ycRa/hfbwNMwO5cgQ69DNlGElgF9EOf+pG8xlhKP3TMM7+Ttm6eznTiXsMIam82WEOGcGHZeyIFlAAMD/H43Pf08ayskX+mWPN0+MUi4d1hf3DOGGMQeG5h45YO1p3kB6oBIk/uUPWppAZsEukFudkyrU2uVCxWQBlQ6YGgIxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wt8SyMHj83EKGeZrMldfRHPC6PBuu0Te/Va9HpbR8M0=;
 b=CG8qlaLuUIX/6pshCQ5QnUF4FuuLgwWFJ3xNmLMIf9jqiIQ5FQL6iLr8S/xA6iGy+H432kOutEyAlX89iuPEA4J0EUKltFaljwh7YeXrtoMuAg6CcKEQ5WsiARHRMmcER+ToUiNoIyeaRUJ7r1io9pnPwvgtEP7sT/bCKRCdJ08=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by IA3PR11MB9397.namprd11.prod.outlook.com
 (2603:10b6:208:573::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 05:58:54 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 05:58:54 +0000
Message-ID: <d13ab1bc-23c3-469c-9c06-7088baca93a8@intel.com>
Date: Fri, 27 Nov 2026 11:28:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] drm/i915/vrr: Shuffle code around
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
 <20261023165803.31016-9-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20261023165803.31016-9-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0071.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::10) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|IA3PR11MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1957ba-abd8-4ca5-f2af-08df4c4b84c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|261026121527099003|10067099003|11063799006|56012099006|4143699003|261009223027099003|261021121427099003|261102123227099003|261021123027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 7c0dReGqUbGzh5/iTC8dgg7ZTGrUIzGNjQytKHq0oYNbD17P84ybQk3z6+ahnYMHOkMYK3V5lYCT/rtKwfiUyT8BZxdRstxZVIsE8oQsuQLViV9XllgIfaWB2Ci5+93M98OnsPaM2Uk2rYYOYp3ENC79Q+1xsjTTqKExgRmz+jt/ElTqePOfS/kqt4hxTwPqOeeGAS7v7Ir6KkPbyOXhedYc4vvkR1O3h54NPEcqhlY0Uj5qYleGkkHRJ9jKoyfp0Up74cUSkNwYRsFJpCJT9MtHlLkDITolZwIJAtkaNzPxMmdU0zq2hGywIiD07wOYlwcPIRK/H01OqW+l9sj0lsILuFDleKIf8pJEdMkq0cvG4HR2JtezXG7QrZ/tLul0Kk3nSE4fgS26lWfrzTkNAMT4i3xyUoQIwb2l7U8sBNNVlftY3x7eNpzGW+dvEkQhL9FHdCQBZCTwD92V6mPt0Qqy9fyRbrDUrcsJj1jYL2iKJ7tRqB276U9Uiz9F8UcZIybCfMG9dM0qKo+6E3tzdE1vSW8I/SykeKpgLXy7L5JO4kgglfVytxXuQBnnw8jyygVL5oHPV4OTgZY8Z4OFu01wv5fXsqYPeNIEUrZ3jmKMXebVr57ab4uQW/Pr8Pny5NyDSQzQyZVs8sZ+WJm9248eRCDM00rxYi4qFdh52Zg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261026121527099003)(10067099003)(11063799006)(56012099006)(4143699003)(261009223027099003)(261021121427099003)(261102123227099003)(261021123027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alpBejZnUGl1alFyaEllVEpWOGo5RTEzalM2ekwrVGtPRlAvNXpNZ2hUam5L?=
 =?utf-8?B?a3lMNmduYU5CbWZzSTY5diticGVaenc1Y2FBQmZrU3F0SnRyRFBjUDFOMEJZ?=
 =?utf-8?B?QzVNenJMS3NHdkNUTlVHSnNxT0k4dHlESS9UTWExOUJOZVl6N3R4TVZUMDhB?=
 =?utf-8?B?dy9CWk9tOTBxaXhnYXNVdGFjR1hhTmJIdzJ6RjMzbnNVK1Vla3JMelBNQ2Zp?=
 =?utf-8?B?c3Y0UVh6ZzVVUUw1amxqMWphK3d0cjUzdXg1Q0RuRW1ob1Qra0NCWDdKYURL?=
 =?utf-8?B?a2RqUE9MSmUxMlViYUlpajBHQjBpM0xWUDdaaEFrdVE1WDRqVDJiZEp5WXZV?=
 =?utf-8?B?bSsrODZFUWpwaG1wQkhzSEY3ZFlSTmlNbnJvekt5N0Z1SFpyeXhNTEE1NktM?=
 =?utf-8?B?ZFVOVlQrSWlzcklUdThMWjdMRGJBSS9TTmxRanpZZXVTdm9LSXArUG5FUFVw?=
 =?utf-8?B?ZitwZjMwaTBIbk80NjNOK3NJbkJxZDRIVnp2NlRSUVJIMXNwaVdjdnhYM1da?=
 =?utf-8?B?Ykg0ZW1COWxPUzJ2WGZUWW1yWmZKVC9xTCtQTllXVm8xSVZmd1IxYkwrVEkv?=
 =?utf-8?B?dDVzRFRuSnFXTVExSlZhWmVUY1RpNTd2cVJYeGIwb1AxZDArY1FKc08rdzd3?=
 =?utf-8?B?VkROMU9obTBNWkJGN0NmeG4xbWdmTjNtQzQyQklPS3hUTTg2U1MvYnBoZ3Nm?=
 =?utf-8?B?QVU5SFdJOENnTSszVjdkamIxUlNuVHRhODR2aUZLR21UazNnejdMNEFiWUVt?=
 =?utf-8?B?clB2bE1GTHNNamRySDd5aFRiUW1CaTdKK2xzOVVLcDJXL0FNWDlOeGVIWmdB?=
 =?utf-8?B?YktRcEdRczNqdERnMEJkNmpqR1ZoL1htdU5NQ05QS0t6NVVhYVQ5M2pOUjNs?=
 =?utf-8?B?S1g5S2Y5WlhrbksvZXkrc1FWS3NIUGVsQ1BtcnFVckRvUmJKQkRMNitjcXVZ?=
 =?utf-8?B?MmRLTlBrMEtUTUV6bzdjVndCc0ZORGhBeDBxMnlXY1ZiUDRsdEFqWDJHM084?=
 =?utf-8?B?RVBWT2tyNy9uU3Y4VGlmY2Z2dUV0MSt5MThuVTU1Q1NMYkMzaENlMmMvTmhO?=
 =?utf-8?B?R1dHSGZ5UHh5WTBYQVNiSkpnVVAwMmh6VUZzaWdTMlUvMVB3TVJkbkRWNDhJ?=
 =?utf-8?B?d1o0Z1M3SEZuQk12V0dUcnkzUEpGeERvZXU1RjF3WXA1Q0dldllqZkYxNnBr?=
 =?utf-8?B?MnpFWEN5QW5YTDhnY2RScEhkVDdiaUhtd2tnOThCK3Y4bjVWMjFRekh6UGFB?=
 =?utf-8?B?STZaR2QzNG9oTnI0ZmVCUFF2eitNKytBdGg2U21ibDJRY1dUMjRkNUxaNk93?=
 =?utf-8?B?bEJZTWRIc3FRbFQ5bXp1WXhpckg4MUVnT2NHWW4zMHFTSU1iNVF4N3gxSXBp?=
 =?utf-8?B?cExjZ2JvalYwSGxtbTdibzlUWkcvTEdjNU5mU1ZvNFpDakpMM1Q4RWlyb25x?=
 =?utf-8?B?S2xPL3Y4djJiL01qSHNGZytTWHlrS292QlJSSGN0VDN5MDEvWlZNU0lJYWE4?=
 =?utf-8?B?T0JOVmozNDlKTGlUaWZuK1NVOWRYUW9lbWp3SVp3M1pqV2o1N0wvZThmRERz?=
 =?utf-8?B?TXpBTkhCYmVRcGd0L1RkNE1vZVZDRkJMTVM0T0JaZXNEVkhQVU9qSERDQkND?=
 =?utf-8?B?VG1JL0txZm11UlA4N0t3N3dXcGpRVXFLeExrT0h4Ky9KZUdsUlFCUE1SWlQw?=
 =?utf-8?B?ZHk3TjdmL0dYVWRoeDJ6NGlVTkZHcGZ5ajdaRWc1dXhmNWNkRjhJMmExTXlm?=
 =?utf-8?B?VUd5N2lCMUJrcHVBUlhTU3ZMenQxQ2VhYnB4MEpuM0hxK252Y1B5dGlsRFR4?=
 =?utf-8?B?U1QvbjNWVytGRUpsU3dVb0tzK3VUdG1yaXFuVTB2SGhNenVpeUoyd2QreE1P?=
 =?utf-8?B?aVVIZlhCU2oyWTNJdm56VVgwZTdVYitBNlpqVTF5dHpPTy9GT1Z6TVB5TEhn?=
 =?utf-8?B?aXgwaloxVm8zTXB2S3dvUndqS096ejlwdjlOSWdlYnIvMG5vc3czWUI2bks5?=
 =?utf-8?B?SlFqdWowbVdYVGpOakNDZVVXK2g4RlYwZnk4NWExMG9waklnaG5SQ3YzUElE?=
 =?utf-8?B?MTY0UWxjTzB5WEp3MUpyVjdVVWN4Y1YwSHdUZDhUNi94QUhhVVN5ZStKTHNV?=
 =?utf-8?B?RUtnNGFpc09oSElIUnJSQS8zbUhqd2FKVWgvUHRvaUFrVTdKSFRLSzhXb21L?=
 =?utf-8?B?aE9mWThzNVJQcmJPU3FKOHVvd1hPUW5YdGQwU2MrK0k2L0s1WEc0enAxcWRq?=
 =?utf-8?B?M2VTNmc2Rkw2YXpGVzI3UFRRMHY2VXJTOHhkaGpBVlNucVpyMHIzdHVLM2tX?=
 =?utf-8?B?ZDQ1ZGM2cjR4YkREMElyczMrNmVJSzFmNTEyYTBkZFEzRjVlMEs3a0dZdTVw?=
 =?utf-8?Q?WY/qtKWifo6AaMc8=3D?=
X-Exchange-RoutingPolicyChecked: GUmqRRxEfnKsKYE9/QzNnkEdBDhJk4SFyJ6SeeyhrBdYTm8xjyIW8NN9Az+UwLOhJ2Qm2twP74ahjWi+dDxSmzR027/QXxPL8y7qj2+jY/GsaQa7qu5WsP8DrURkp/mkXtTAcPt9ST9f366J4FQSaHtja+c/n10giFHCoJQZTpOwT05a2dzWKL4mJ7KZu/etxOgDgBqhYyCeJAwzu1jcSe3pX17D1iPUb4lp4xaFWxFSZx8sZkgjIPPi7wDXkf4+oE6IOEMCti96XmfYM/q03NzIdwGI2r0aV+kAh01NICRuTfkzmjExLjmPu5OBQUL/s8DsdIYkPbENV6jHfoFW9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1957ba-abd8-4ca5-f2af-08df4c4b84c5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 05:58:54.6284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aN8qKwY4sjLSgcECLK0iIlShzOzjcmDOHAHGhm4S0EUYrNjBlTzdyemy8f7aX8A4yUlZvsPHaTFOmUtXJQWn1zh/RpIVcRnN8r6Ol3fr/jM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9397
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


On 10/23/2026 10:27 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> The VRR/DC balance functions are sprinkled around in a somewhat
> illogical order. Reorder a bunch of them to be roughly in a
> low-level -> high level order. And move the safe window
> stuff to their own little section as well.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

LGTM.


Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 64 ++++++++++++------------
>   1 file changed, 32 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 1042d00d1732..528f72f43022 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -1188,38 +1188,6 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
>   			vrr_vblank_start(crtc_state, adjusted_mode->crtc_vtotal);
>   }
>   
> -int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state)
> -{
> -	struct intel_display *display = to_intel_display(crtc_state);
> -
> -	if (DISPLAY_VER(display) >= 30)
> -		return crtc_state->hw.adjusted_mode.crtc_vdisplay -
> -		       crtc_state->set_context_latency;
> -	else
> -		return crtc_state->hw.adjusted_mode.crtc_vdisplay;
> -}
> -
> -static int
> -intel_vrr_dcb_vmin_vblank_start_live(const struct intel_crtc_state *crtc_state)
> -{
> -	int vblank_start;
> -
> -	vblank_start = intel_vrr_dcb_vmin_vblank_start_next_live(crtc_state);
> -	if (vblank_start < 0)
> -		vblank_start = intel_vrr_dcb_vmin_vblank_start_final_live(crtc_state);
> -
> -	return vblank_start;
> -}
> -
> -int intel_vrr_vmin_safe_window_end_live(const struct intel_crtc_state *crtc_state)
> -{
> -	int vmin_vblank_start = crtc_state->vrr.dc_balance.enable ?
> -			intel_vrr_dcb_vmin_vblank_start_live(crtc_state) :
> -			intel_vrr_vmin_vblank_start(crtc_state);
> -
> -	return vmin_vblank_start - crtc_state->set_context_latency;
> -}
> -
>   int intel_vrr_dcb_vmin_vblank_start_next_live(const struct intel_crtc_state *crtc_state)
>   {
>   	struct intel_display *display = to_intel_display(crtc_state);
> @@ -1270,6 +1238,38 @@ int intel_vrr_dcb_vmax_vblank_start_final_live(const struct intel_crtc_state *cr
>   	return vrr_vblank_start(crtc_state, VRR_DCB_VMAX(tmp) + 1);
>   }
>   
> +static int
> +intel_vrr_dcb_vmin_vblank_start_live(const struct intel_crtc_state *crtc_state)
> +{
> +	int vblank_start;
> +
> +	vblank_start = intel_vrr_dcb_vmin_vblank_start_next_live(crtc_state);
> +	if (vblank_start < 0)
> +		vblank_start = intel_vrr_dcb_vmin_vblank_start_final_live(crtc_state);
> +
> +	return vblank_start;
> +}
> +
> +int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +
> +	if (DISPLAY_VER(display) >= 30)
> +		return crtc_state->hw.adjusted_mode.crtc_vdisplay -
> +		       crtc_state->set_context_latency;
> +	else
> +		return crtc_state->hw.adjusted_mode.crtc_vdisplay;
> +}
> +
> +int intel_vrr_vmin_safe_window_end_live(const struct intel_crtc_state *crtc_state)
> +{
> +	int vmin_vblank_start = crtc_state->vrr.dc_balance.enable ?
> +			intel_vrr_dcb_vmin_vblank_start_live(crtc_state) :
> +			intel_vrr_vmin_vblank_start(crtc_state);
> +
> +	return vmin_vblank_start - crtc_state->set_context_latency;
> +}
> +
>   static
>   int intel_vrr_cmrr_parse_ratio(char *str, u32 *numerator, u32 *denominator)
>   {
