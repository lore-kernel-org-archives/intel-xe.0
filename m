Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95689D66BB3
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 05:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A34D10E479;
	Thu, 18 Dec 2025 05:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fao6fktY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45AE10E479
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 05:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766036628; x=1797572628;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6yWe1MoU3rg+m5z+b9N5KU2Xptq3wTiNAMWwkf3ZqVs=;
 b=Fao6fktYx1JKYUS3C4CsDixmzV5+H2LNBK+Kv+mCqnk1Rk6Ih/XzJYx1
 UeqsUbxxl8zVdvl03ay1F5/gvv/x3feTdrpOQlrlrENJ8A+TVvA3wRrLg
 z9408JFoUlWdT+ZFwM+Ajc+ayd9/TKEAzwaDRcXV8U491PfK9aMf6yfSj
 DRXNEiEKlhGEUTqYYjVK/1WIQrEwY/MGvA0m6H3OP+kRDgJPjBzCDB/4q
 tpP4K+HSVAhG4EYq9ox0z5fbogxZE7vj7MzObrQ01uS2tFTd2A6FGBSLF
 NqFUPSKQcvMidqzXCbeksfsfn4tcOBJxGCQfUdzvl/J/sdwX89Cun+xUK A==;
X-CSE-ConnectionGUID: vvy5WZOIRTy1WyO+aqGUHA==
X-CSE-MsgGUID: 7tLxedIRTkaOgfA3vzWeUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="68138181"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="68138181"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 21:43:48 -0800
X-CSE-ConnectionGUID: 9oY0UJFoSGq3sM/9QKoonw==
X-CSE-MsgGUID: VuAJcLJlTUiw640XgArDjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="221899848"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 21:43:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 21:43:39 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 21:43:39 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 21:43:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCYPrTkst5UpRnQcXfy7B5ZpznT5Rn3jpfMMAbU771Yd9PFB4WavYmxymPsC8UnzjuHja96n18ph9FhNChU6TJjkje0bOazDiPS3NNfpL/QlywsWP6dzsJ1/Iy7PfQ142Mvdmvo9E+QD1Y8/gwFIz8JJSOCHXppoQ83Oo35ewecEPOL9OjRNsrq1m2g75ztv6S5AYgJOsAzUkE/PbV9Jk9nP+pULvrjaRY+qk4CWDUX1AqbiOUfRWnMqaOOjJCfK+8KWUStYvBWNrEy7/sc225xORwEDOUc7ot79hq0Rx/VyPP+XSw+VjO03rkbkeYre3eTLj/DR7edIao+RIxrpjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xw0pOymqz9y1+bmCwvBxlixBYuYXPG8RFb++Agt3wFc=;
 b=RCZZkm8WDSN7ELinSpoXmnEmm7VMvL0k7kXHFLVAL+lYe9z0kgbdw9uZwJv6UMw1Hcpk7dz/b5sUzs8grEHcXpRSmPmQGG7KAyeFJ9NnYb6Kpien3F957zhYc1vFHdUZW1BcrktNV9RjOCSpgR3bkhZqmlbvOJngxH+/9Td+fQ+bUQQiijit2+BY0NUZ90T99RXhqGSsQII5HEKXuROuqXfQ8UBYdTSvr6n5iShqbLa0a5wR3NogwPYVpryVdBnMccGGzlPCvTkxjePevGmHb8MVrC2ZZnEPzhe8KmGyqYZRsUahdRotTyirRxAnbl97gAl3P1BI5k/6gDsqECDeLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH3PPF7A88A980A.namprd11.prod.outlook.com (2603:10b6:518:1::d32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 05:43:38 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 05:43:37 +0000
Message-ID: <f2eb63ba-2e7a-4270-847f-9598d56f3850@intel.com>
Date: Thu, 18 Dec 2025 11:13:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 5/5] drm/xe/sc: Add system controller component for Xe3p
 dGPU platforms
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <matthew.d.roper@intel.com>,
 <michael.j.ruhl@intel.com>, <mohamed.mansoor.v@intel.com>,
 <kam.nasim@intel.com>
References: <20251122045803.3616201-7-anoop.c.vijay@intel.com>
 <20251122045803.3616201-12-anoop.c.vijay@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251122045803.3616201-12-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0224.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::7) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH3PPF7A88A980A:EE_
X-MS-Office365-Filtering-Correlation-Id: 33156064-ee53-465d-50c4-08de3df8640e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Skk5cHZkbnBDQTZnNEx0V1FJeFh6aFFET1lyNkNiZjBJb0ZHSFBZT2ppRXdV?=
 =?utf-8?B?aUd4Z1JjSnREa1V0YkdDaXZ4OUpSSld6T2RJbHpSMS96MTc4WEYrc2JnL0o2?=
 =?utf-8?B?NEdVZlVQOHZ1WndOL2hTZ2cyb3MzeG1HSXhXRjlyVFdqUCtiVmJ0WjhuRVJK?=
 =?utf-8?B?Sm1yeTF6NW9uTi9tWjBYWEpEaW5UOVo0OHZUd0pJeUpaV0lHaG5sc3ZxVnRG?=
 =?utf-8?B?clFnOUxhSEFkUlczclhuQTRpL2FMbVpNQ0ErdUtmREVOb05mQ0dkcjVNcTQ0?=
 =?utf-8?B?MnpkbVFKTVBUNlZGYkt4ZDNHZWVNZm1iRE5MbzVobFJHZlcrWGhpU0JHdTdN?=
 =?utf-8?B?eU1Qb0Fpb2MwSXVoL1FCTENJbDZrUWlvY0ZUWUtCUFg1OE52S3ExaFZiSVNR?=
 =?utf-8?B?RmRTZUhxODVKRmxJc05xcjZ3RVJIaXM2TjhMTGJIRmpLYXdQWEwyTGdtTEQ4?=
 =?utf-8?B?K2tDclNHMzFJM2xIT0thbU9MSTEvRHpzaFBjRmhVeFg3MUN6N094VW0vRmtG?=
 =?utf-8?B?YmV2YTRSN0tmbW1Ea0lnVlUvWU1scnVFRXNGaE9QdElRN0RueiszaVp0TVpM?=
 =?utf-8?B?UGpxM3F6RWxXbFA1ZUw1REUxT0VNTVpwOHZVTkFBMGcycUdFbzRkcGo3SkhX?=
 =?utf-8?B?M3RpcUxIdmdwUkR3cWVrbnprOElUL3Y5UFZ0NExuTVRNenU1T1hhV1FWRW1U?=
 =?utf-8?B?Z0lqNFNQVWVOV1RsUlRTYU5rVkUzNWRnc0dVUm91Z3BHMEV3WmJqRDlST1ZS?=
 =?utf-8?B?dlhZRkhWZGhxT2IrY1NPZmlxQ0dRRmI4Zyt4ckVsWXYrZkRpc0ZLdnFpRlBt?=
 =?utf-8?B?cENUdTFTempnUVlRWFBQT1lnYjlUY3paRFhQbDBMREg1cm9Wc0w2ZzdSbm9B?=
 =?utf-8?B?WHBXenZrU0c3NHBtQTNjZHc4QlhjSXY5Vi9RcklodXdGdG5Hb3dKaHdBQ1Z4?=
 =?utf-8?B?N0dWRWc0UG1takt4V2MzZHE1bEFuaHNkaitVRG14alM0bVZIVGgyeGM5RHph?=
 =?utf-8?B?ekhrSHZxYi82TmE0bEdhK05aR2YxdlJaMDdMMUpDWExCWTlrY0NNQm1MRkpk?=
 =?utf-8?B?VnloSFJtZlhiay9yQ1gweUhMVWJRc1lIdWZNTzkrbDBvZWp3RWl4b2lCS1BU?=
 =?utf-8?B?eDhLbUZxYUIwL3RCaFNzVFowYnlpUmJQTGpFN2NpN01LRTlQVTUzM2ltNXFI?=
 =?utf-8?B?NTBvVWhobTROajc4YVIycXczYnlIdWN4Vy9TT2F1bHVWaE1yQWliamlBbkVT?=
 =?utf-8?B?bFFsT2dHL3Z2Qjd2VGZqN3NqS1p0UFQzQnF5bkpZZVhna3pKQ093NUdEUmY0?=
 =?utf-8?B?UnhzTTFVZzROdmEweVp5cm9GUWZpVnFPbDNjcjJrMlpmZVJWdU55enBFWllt?=
 =?utf-8?B?UGowcmFrNHNsL1ZtalpZUFRvZXUyL2FsbW9HdVFTQnd1YURORW1nTmFVTnNY?=
 =?utf-8?B?LzhOYWFva2hPNDBoc29CY1M4YlR1YmY5bHZ0d2hRMzFDWnd0a00rem5oYU1u?=
 =?utf-8?B?di9EaXBKOWFwdmlQcWRDeVJoS21zbDhNd21GVHMyUlJkb05NbUtxSXRIOXRQ?=
 =?utf-8?B?U1ExRXF5YUZsRVdGeHFvWlNORm9wUitSSWxxVFpadHVDV0t4RUhVSnNLMkxo?=
 =?utf-8?B?RUFLMlMvTUl2SnNvNnFrSXhLQ25yVFJGVHMwdHRWajlwMGVrYTZ4QmdaWWNk?=
 =?utf-8?B?Wm9qK2VUc1k0NGF0ck0zQWdCT2tCblUwZ2FSNGUwb0VjUXI4eTUzOEE4YWJK?=
 =?utf-8?B?dU12UnNmcHIyOGRNa3J1RytHd0owMUZ3WnhxZlA3dDlFVytqajZNUEVDWGNr?=
 =?utf-8?B?REhMUUVCcXk5Q00zZ1lkZHJqOWxPUE1POHlQcW1aOXppeDJIN2N5L1dPTmtE?=
 =?utf-8?B?cytGbmZBZ0swdjZTTmp5eWpxUEVYdFpvZ1lCcko1UVlIR2J3bEdQL2VnVEVo?=
 =?utf-8?Q?lfYn0m6ha4AMtbHISS/L3uCwF9f5roFf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWlyRytQZWljYzJxcDhZdHkxaXJXMEl1c00yOFJ6QlduR2lIMTlJcGY0bVBl?=
 =?utf-8?B?ckk5SHR2czgzNUJ0MnBHTmF2OUF0UUVPODEwWmFQeCtScElmcy9xS2kveGRL?=
 =?utf-8?B?Si9FbzhxcjRXNGgvL001cFd3VG1BZjEwTzN1RkU0ckFwUXJobFNxaGJ2LzRV?=
 =?utf-8?B?ay9vTXVSamJnUFh6ZTRuQlNkbjJ2QlhwdW4zUzBucmpNTmJselp5dGJlSVdY?=
 =?utf-8?B?Z1FOL1hxSzR3bmd6WlZIdG9JVFhjeFNpa1oyY0gvRDhvVUVzRHBzTnJSWDRT?=
 =?utf-8?B?NFp6WHFFb21pa2pCVGFrTlppSXdBUTZtWWllSTVwREYwSzNLNDY1K2xMUmJW?=
 =?utf-8?B?MGhjR0pzamdnd2d4Rjd3VWI0bEQxdmI2UytDbVNSMk8reForT0MzUWpZZGdK?=
 =?utf-8?B?SUVGc3FhNE9xVkFQbTkxK1k1cWI3TFNycXIrY0lQRHpKLzcvdDYxRmlyUGNj?=
 =?utf-8?B?b09jdTh3alF0R0hiV0JHZWdOY1YrWnlXa0FqakJsNHM4Y3owa0dJdXRCMG56?=
 =?utf-8?B?MHNNV3ZtNE5yemlVUTBjNXFFeEJycnM0STF1UC9HT3pqSmVPYnpna2M2Q00v?=
 =?utf-8?B?SlRoN3Qyay9PSTZJanpkN2xmenEyK24yekhjMlMrS21DZWR5bml6bTVkUG5P?=
 =?utf-8?B?OUNDVDQrd3JXWUE3OFhxaXVIWTZyNWYyUFFzTVlmaDNlL2hpQWRhOHlzd2sy?=
 =?utf-8?B?a05OQ0RwVXBwWGJhbzdnZHN6aW5Na0o2SkErUjZ6OFVHRTdlaVA5KzhJbkdq?=
 =?utf-8?B?NUxOUzlvUXI0dkJBZnBVbTZRYmFBcThZbmJuRmgxQVdKSGlkcFdrWjdMQ2dr?=
 =?utf-8?B?THVBZmVlR05IZUVZNGVUNkNhQU83cUticHJ5SFpKT3JtU2F6cmJubG43K2Mw?=
 =?utf-8?B?R2ZWcFZvMmxBK3EzcW0vL3RTOUF3a2JYV0tzVnJPU1p4NHdOVnd3ajlXM21z?=
 =?utf-8?B?S2hTU041SGNRTzlQWkg0a2EwU1JlMElpaG1CUUlJN3dWT1ZhKy9IaVk0YmFO?=
 =?utf-8?B?RkMvaVVtNDN2VDhOWi9JbTE2YkdrZnM2QWF6SjFhdlptU1JZMWgxVGdTWFc3?=
 =?utf-8?B?Y0xJY25GNDVRcm90eWFyS2RBK1Z6RlNJOU1wWHVmRkJWQ0E3L1Q2VkdIR2NL?=
 =?utf-8?B?U1kwM2ZLN3dIb2FsWFZmdlQyeEcyVzRrZldEOExtcW9vb3FRWUs5Z3lhZmtU?=
 =?utf-8?B?S3JFbFJFNWFKV21DQzdLTXhzZDR4RTVPdzZkaGgxZHc5RUJpVzdCdTEvNlJl?=
 =?utf-8?B?Z2ZvMUdEV3pHZHdZOWdrcno1ZnRYck5GL2hyK01pSFdpQXEzSzlrVnQrMzN2?=
 =?utf-8?B?NEhIS3RlRzNjQmxob0JtdEtkZktBMTQ4MXBOQlZqam90WkliRWFiVXFJTXpV?=
 =?utf-8?B?WVZTTktuV2JQV2VWa1J6NW1iL0pIWm1CNVRnREhiTVNIUkRPS0o1SHFkd2R0?=
 =?utf-8?B?L3FoMDZkRDZxNzAvdmhkT1pvdnJ5N0hEcUtZSytxVEJyZk9UR0dEblNZQnps?=
 =?utf-8?B?QnBxblk1OTBTdmszV2VpZGNZb2lTS2g3K210WW5zR3pQZldCRUduTHUvZDFZ?=
 =?utf-8?B?dEwwZ2hiVVB3enBMWkd6ZWNUZmtOMDFPWW9adW5SR1RUS0NvNTd1MUhWWFN3?=
 =?utf-8?B?RXJaQUhtUUo4ZCtzSE1neUxxYTgvZ0dXY2p5cGh1SzlQYTNxNTA1NkphTU5r?=
 =?utf-8?B?ejZWbzQyTkFVQ0NWaTNSaUp6cnBTQW9laXdCMEQ1d2paZUxVU3FubElEaDM0?=
 =?utf-8?B?QXlLWW1JRTljYTd1UnNEOFplN250SkVSZlJUVkNndGJld2JjNEg3N0wvSnlU?=
 =?utf-8?B?TVUxam5Vb3ZMSzBqeklqOGxTbEFJNWhCY1BhNllCeU9XbVJMWlJkbG5lYldK?=
 =?utf-8?B?RGdFMGxJaWFYQVg5SlBkSjFTZGJRdkhWWlo3aEpjWE1iV0hVUExDaHFWYzAv?=
 =?utf-8?B?a3QyM3NZZ1I0TUk0bjRBbXJ0VlJtNCtyb0hWZHJpNEdXeE96ZEtUS2lZRkN1?=
 =?utf-8?B?UWVEQ21HZ2NXbEJSd0pjd0dnaERoMDRoZmlEcXdWUDVRVGxRbG10WElCNkdq?=
 =?utf-8?B?UW1Ma1dIM3ltcm02T2hYb3dlVEpCR1lkMlB5QkRJWGNVcXpEWGtsaHArSXBU?=
 =?utf-8?B?VHVTUkNlQ1FMZS9YY2ovUWYzTWFRTWZYL09YbFlOUUk2bllJMTcwRlpFZ3Zx?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33156064-ee53-465d-50c4-08de3df8640e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 05:43:37.7002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ytNphSS+AYP2Isb3YOVz/xt3l4YWkzaBPlZurEBKGb4hNrvjr2B0UD4NSUXeeCZxF/bad+FSeqncfKH/TsBANA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF7A88A980A
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


On 22-11-2025 10:28, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
>
> Add a new system controller (SC) component for Intel Xe3p dGPU platforms.
>
> This component provides the foundational infrastructure for communication
> with the SC firmware using the MKHI protocol over a mailbox interface.
>
> Key features introduced:
> - Detection and initialization of the SC interface on Xe3p dGPU platforms
> - Mailbox communication with SC firmware
> - Fragmented message transfer for large command payloads
>
> This implementation establishes the base for future SC feature
> enablement and firmware command handling.
>
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile          |   2 +
>   drivers/gpu/drm/xe/regs/xe_sc_regs.h |  49 ++++
>   drivers/gpu/drm/xe/xe_device.c       |   5 +
>   drivers/gpu/drm/xe/xe_device_types.h |   5 +
>   drivers/gpu/drm/xe/xe_sc.c           |  89 +++++++
>   drivers/gpu/drm/xe/xe_sc.h           |  15 ++
>   drivers/gpu/drm/xe/xe_sc_mailbox.c   | 374 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sc_mailbox.h   |  61 +++++
>   drivers/gpu/drm/xe/xe_sc_types.h     |  35 +++
>   9 files changed, 635 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_sc_regs.h
>   create mode 100644 drivers/gpu/drm/xe/xe_sc.c
>   create mode 100644 drivers/gpu/drm/xe/xe_sc.h
>   create mode 100644 drivers/gpu/drm/xe/xe_sc_mailbox.c
>   create mode 100644 drivers/gpu/drm/xe/xe_sc_mailbox.h
>   create mode 100644 drivers/gpu/drm/xe/xe_sc_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 7ebfbf9051bf..50e8dc86d915 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -114,7 +114,9 @@ xe-y += xe_bb.o \
>   	xe_ring_ops.o \
>   	xe_rtp.o \
>   	xe_sa.o \
> +	xe_sc.o \
>   	xe_sched_job.o \
> +	xe_sc_mailbox.o \
>   	xe_shrinker.o \
>   	xe_step.o \
>   	xe_survivability_mode.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_sc_regs.h b/drivers/gpu/drm/xe/regs/xe_sc_regs.h
> new file mode 100644
> index 000000000000..2b7053586197
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_sc_regs.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SC_REGS_H_
> +#define _XE_SC_REGS_H_
> +
> +#include "xe_regs.h"
> +
> +#define SYSCTRL_BASE_OFFSET		0xDB000
> +#define SYSCTRL_BASE			(SOC_BASE + SYSCTRL_BASE_OFFSET)
> +#define SYSCTRL_MAILBOX_INDEX		0x03
> +#define SC_BAR_LENGTH			0x1000
> +
> +#define SC_MB_CTRL			XE_REG(SYSCTRL_BASE + 0x10)
> +#define   SC_MB_CTRL_RUN_BUSY		REG_BIT(31)
> +#define   SC_MB_CTRL_IRQ		REG_BIT(30)
> +#define   SC_MB_CTRL_RUN_BUSY_OUT	REG_BIT(29)
> +#define   SC_MB_CTRL_PARAM3		REG_GENMASK(28, 24)
> +#define   SC_MB_CTRL_PARAM2		REG_GENMASK(23, 16)
> +#define   SC_MB_CTRL_PARAM1		REG_GENMASK(15, 8)
> +#define   SC_MB_CTRL_COMMAND		REG_GENMASK(7, 0)
> +
> +#define SC_MB_DATA0			XE_REG(SYSCTRL_BASE + 0x14)
> +#define SC_MB_DATA1			XE_REG(SYSCTRL_BASE + 0x18)
> +#define SC_MB_DATA2			XE_REG(SYSCTRL_BASE + 0x1C)
> +#define SC_MB_DATA3			XE_REG(SYSCTRL_BASE + 0x20)
> +
> +#define MKHI_FRAME_PHASE		REG_BIT(24)
> +#define MKHI_FRAME_CURRENT		REG_GENMASK(21, 16)
> +#define MKHI_FRAME_TOTAL		REG_GENMASK(13, 8)
> +#define MKHI_FRAME_COMMAND		REG_GENMASK(7, 0)
> +
> +#define MKHI_HDR_RESULT			REG_GENMASK(31, 24)
> +#define MKHI_HDR_IS_RESPONSE		REG_BIT(15)
> +#define MKHI_HDR_COMMAND		REG_GENMASK(14, 8)
> +#define MKHI_HDR_GROUP_ID		REG_GENMASK(7, 0)
> +
> +#define SC_MB_FRAME_SIZE		16
> +#define SC_MB_MAX_FRAMES		64
> +#define SC_MB_MAX_MESSAGE_SIZE		(SC_MB_FRAME_SIZE * SC_MB_MAX_FRAMES)
> +#define SC_MKHI_COMMAND			5
> +
> +#define SC_MB_DEFAULT_TIMEOUT_MS	500
> +#define SC_MB_RETRY_TIMEOUT_MS		20
> +#define SC_MB_POLL_INTERVAL_US		100
> +
> +#endif /* _XE_SC_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index f15489c100af..9fbd0b084c74 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -60,6 +60,7 @@
>   #include "xe_psmi.h"
>   #include "xe_pxp.h"
>   #include "xe_query.h"
> +#include "xe_sc.h"
>   #include "xe_soc_remapper.h"
>   #include "xe_shrinker.h"
>   #include "xe_survivability_mode.h"
> @@ -963,6 +964,10 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		goto err_unregister_display;
>   
> +	err = xe_sc_init(xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>   	for_each_gt(gt, xe, id)
>   		xe_gt_sanitize_freq(gt);
>   
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 3f118c64a124..86a0c83c802d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -314,6 +314,8 @@ struct xe_device {
>   		u8 has_range_tlb_inval:1;
>   		/** @info.has_sriov: Supports SR-IOV */
>   		u8 has_sriov:1;
> +		/** @info.has_sysctrl: Supports System Controller */
> +		u8 has_sysctrl:1;
>   		/** @info.has_usm: Device has unified shared memory support */
>   		u8 has_usm:1;
>   		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
> @@ -576,6 +578,9 @@ struct xe_device {
>   	/** @heci_gsc: graphics security controller */
>   	struct xe_heci_gsc heci_gsc;
>   
> +	/** @sc: System Controller */
> +	struct xe_sc *sc;
> +
>   	/** @nvm: discrete graphics non-volatile memory */
>   	struct intel_dg_nvm_dev *nvm;
>   
> diff --git a/drivers/gpu/drm/xe/xe_sc.c b/drivers/gpu/drm/xe/xe_sc.c
> new file mode 100644
> index 000000000000..18448efc173f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sc.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_sc.h"
> +
> +#include <linux/mutex.h>
> +
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +
> +#include "regs/xe_sc_regs.h"
> +#include "xe_device.h"
> +#include "xe_mmio.h"
> +#include "xe_platform_types.h"
> +#include "xe_soc_remapper.h"
> +#include "xe_sc_types.h"
> +#include "xe_tile.h"
> +
> +static void xe_sc_remove(struct drm_device *drm, void *arg)
> +{
> +	struct xe_sc *sc = arg;
> +	struct xe_device *xe;
> +
> +	if (!sc)
> +		return;
> +
> +	xe = to_xe_device(drm);
> +
> +	mutex_destroy(&sc->cmd_lock);
> +
> +	xe_soc_remapper_set_sysctrl_region(xe, 0);
> +
> +	xe->sc = NULL;
> +}
> +
> +static int xe_sc_probe(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_sc *sc;
> +	int ret;
> +
> +	sc = drmm_kzalloc(&xe->drm, sizeof(*sc), GFP_KERNEL);
> +	if (!sc)
> +		return -ENOMEM;
> +
> +	sc->xe = xe;
Using container_of would avoid the need for an explicit back pointer.
> +	xe->sc = sc;
> +
> +	ret = drmm_add_action_or_reset(&xe->drm, xe_sc_remove, sc);
> +	if (ret) {
> +		xe->sc = NULL;
> +		return ret;
> +	}
> +
> +	xe_soc_remapper_set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> +
> +	xe_mmio_init(&sc->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
Is it necessary to maintain sc->mmio? It seems we could use &tile->mmio 
directly when accessing SC MB registers.
> +
> +	mutex_init(&sc->cmd_lock);
> +
> +	sc->phase_bit = 0;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sc_init - Initialize SC subsystem
> + * @xe: xe device instance
> + *
> + * Entry point for SC initialization, called from xe_device_probe().
> + * This function checks platform support and calls the main probe function.
> + *
> + * Return: 0 on success, error code on failure
> + */
> +int xe_sc_init(struct xe_device *xe)
> +{
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return 0;
> +
> +	ret = xe_sc_probe(xe);
> +	if (ret)
> +		drm_err(&xe->drm, "sysctrl: Probe failed: %d\n", ret);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sc.h b/drivers/gpu/drm/xe/xe_sc.h
> new file mode 100644
> index 000000000000..0e5c89ddc957
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __XE_SC_H__
> +#define __XE_SC_H__
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +
> +int xe_sc_init(struct xe_device *xe);
> +
> +#endif /* __XE_SC_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_sc_mailbox.c b/drivers/gpu/drm/xe/xe_sc_mailbox.c
> new file mode 100644
> index 000000000000..6f2500c63a3c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sc_mailbox.c
> @@ -0,0 +1,374 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/errno.h>
> +#include <linux/minmax.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "regs/xe_sc_regs.h"
> +#include "xe_device.h"
> +#include "xe_mmio.h"
> +#include "xe_pm.h"
> +#include "xe_sc.h"
> +#include "xe_sc_mailbox.h"
> +#include "xe_sc_types.h"
> +
> +static bool sc_mb_wait_bit_clear(struct xe_sc *sc, u32 bit_mask,
> +				 unsigned int timeout_ms)
> +{
> +	int ret;
> +
> +	if (timeout_ms == 0) {
> +		ret = xe_mmio_wait32_not(&sc->mmio, SC_MB_CTRL, bit_mask, bit_mask,
> +					 0, NULL, false);
> +	} else {
> +		ret = xe_mmio_wait32_not(&sc->mmio, SC_MB_CTRL, bit_mask, bit_mask,
> +					 timeout_ms * 1000, NULL, false);
This code can handle timeout_ms = 0 use case as well.
> +	}
> +
> +	return ret == 0;
> +}
> +
> +static bool sc_mb_wait_bit_set(struct xe_sc *sc, u32 bit_mask,
> +			       unsigned int timeout_ms)
> +{
> +	int ret;
> +
> +	if (timeout_ms == 0) {
> +		ret = xe_mmio_wait32(&sc->mmio, SC_MB_CTRL, bit_mask, bit_mask,
> +				     0, NULL, false);
> +	} else {
> +		ret = xe_mmio_wait32(&sc->mmio, SC_MB_CTRL, bit_mask, bit_mask,
> +				     timeout_ms * 1000, NULL, false);
Same as above.
> +	}
> +
> +	return ret == 0;
> +}
> +
> +static void sc_mb_write_frame(struct xe_sc *sc, const void *buffer,
> +			      size_t offset)
> +{
> +	const u32 *data = (const u32 *)((const u8 *)buffer + offset);
> +
> +	xe_mmio_write32(&sc->mmio, SC_MB_DATA0, data[0]);
> +	xe_mmio_write32(&sc->mmio, SC_MB_DATA1, data[1]);
> +	xe_mmio_write32(&sc->mmio, SC_MB_DATA2, data[2]);
> +	xe_mmio_write32(&sc->mmio, SC_MB_DATA3, data[3]);
> +}
> +
> +static void sc_mb_read_frame(struct xe_sc *sc, void *buffer,
> +			     size_t offset)
> +{
> +	u32 *data = (u32 *)((u8 *)buffer + offset);
> +
> +	data[0] = xe_mmio_read32(&sc->mmio, SC_MB_DATA0);
> +	data[1] = xe_mmio_read32(&sc->mmio, SC_MB_DATA1);
> +	data[2] = xe_mmio_read32(&sc->mmio, SC_MB_DATA2);
> +	data[3] = xe_mmio_read32(&sc->mmio, SC_MB_DATA3);
> +}
> +
> +static void sc_mb_clear_response(struct xe_sc *sc)
> +{
> +	xe_mmio_write32(&sc->mmio, SC_MB_CTRL, SC_MB_CTRL_RUN_BUSY_OUT);
> +}
> +
> +static int sc_mb_prepare_command(struct xe_sc *sc,
> +				 const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
> +				 const void *data_in, size_t data_in_len,
> +				 u8 **cmd_buffer, size_t *cmd_size)
> +{
> +	struct xe_sc_mailbox_mkhi_msg_hdr mkhi_hdr = {0};
> +
> +	mkhi_hdr.group_id = msg_hdr->group_id;
> +	mkhi_hdr.command = msg_hdr->command & 0x7F;
> +	mkhi_hdr.is_response = 0;
> +	mkhi_hdr.reserved = 0;
> +	mkhi_hdr.result = 0;
> +
> +	*cmd_size = sizeof(struct xe_sc_mailbox_mkhi_msg_hdr) + data_in_len;
> +
> +	if (*cmd_size > SC_MB_MAX_MESSAGE_SIZE) {
> +		drm_err(&sc->xe->drm, "SC: Message too large: %zu bytes (max %u)\n",
> +			*cmd_size, SC_MB_MAX_MESSAGE_SIZE);
> +		return -EINVAL;
> +	}
> +
> +	*cmd_buffer = kmalloc(*cmd_size, GFP_KERNEL);
> +	if (!*cmd_buffer)
> +		return -ENOMEM;
> +
> +	memcpy(*cmd_buffer, &mkhi_hdr, sizeof(struct xe_sc_mailbox_mkhi_msg_hdr));
> +	if (data_in && data_in_len)
> +		memcpy(*cmd_buffer + sizeof(struct xe_sc_mailbox_mkhi_msg_hdr),
> +		       data_in, data_in_len);
> +
> +	drm_dbg(&sc->xe->drm, "SC: request: group=0x%02x cmd=0x%02x payload=%zu bytes\n",
> +		mkhi_hdr.group_id, mkhi_hdr.command, data_in_len);
> +
> +	return 0;
> +}
> +
> +static int sc_mb_send_frames(struct xe_sc *sc, const u8 *cmd_buffer,
> +			     size_t cmd_size, unsigned int timeout_ms)
> +{
> +	u32 ctrl_reg, total_frames, current_frame;
> +	size_t bytes_sent, bytes_to_send;
> +
> +	total_frames = DIV_ROUND_UP(cmd_size, SC_MB_FRAME_SIZE);
> +	if (total_frames > SC_MB_MAX_FRAMES) {
> +		drm_err(&sc->xe->drm, "SC: Message too large: %zu bytes (%u frames, max %u)\n",
> +			cmd_size, total_frames, SC_MB_MAX_FRAMES);
> +		return -EINVAL;
> +	}
> +
> +	if (!sc_mb_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
> +		drm_err(&sc->xe->drm, "SC: Mailbox busy (RUN_BUSY timeout)\n");
> +		return -EBUSY;
> +	}
> +
> +	sc->phase_bit ^= 1;
> +
> +	drm_dbg(&sc->xe->drm, "SC: Sending message: %zu bytes, %u frames, phase=%u\n",
> +		cmd_size, total_frames, sc->phase_bit);
> +
> +	bytes_sent = 0;
> +	for (current_frame = 0; current_frame < total_frames; current_frame++) {
> +		bytes_to_send = min(cmd_size - bytes_sent, (size_t)SC_MB_FRAME_SIZE);
> +
> +		sc_mb_write_frame(sc, cmd_buffer, bytes_sent);
> +
> +		ctrl_reg = SC_MB_CTRL_RUN_BUSY |
> +			   FIELD_PREP(MKHI_FRAME_CURRENT, current_frame) |
> +			   FIELD_PREP(MKHI_FRAME_TOTAL, total_frames - 1) |
> +			   FIELD_PREP(MKHI_FRAME_COMMAND, SC_MKHI_COMMAND);
> +		if (sc->phase_bit)
> +			ctrl_reg |= FIELD_PREP(MKHI_FRAME_PHASE, 1);
> +
> +		xe_mmio_write32(&sc->mmio, SC_MB_CTRL, ctrl_reg);
> +
> +		drm_dbg(&sc->xe->drm, "SC: Sent frame %u/%u\n",
> +			current_frame, total_frames - 1);
> +
> +		if (!sc_mb_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
> +			drm_err(&sc->xe->drm, "SC: Frame %u acknowledgment timeout\n",
> +				current_frame);
> +			return -ETIMEDOUT;
> +		}
> +
> +		bytes_sent += bytes_to_send;
> +	}
> +
> +	drm_dbg(&sc->xe->drm, "SC: All frames sent successfully (%zu bytes)\n", bytes_sent);
> +	return 0;
> +}
> +
> +static int sc_mb_validate_response_header(struct xe_sc *sc,
> +					  const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
> +					  const struct xe_sc_mailbox_mkhi_msg_hdr *resp_hdr)
> +{
> +	if (!resp_hdr->is_response ||
> +	    resp_hdr->group_id != msg_hdr->group_id ||
> +	    resp_hdr->command != (msg_hdr->command & 0x7F)) {
> +		drm_err(&sc->xe->drm, "SC: Invalid response header\n");
> +		return -EPROTO;
> +	}
> +
> +	if (resp_hdr->result != 0) {
> +		drm_err(&sc->xe->drm, "SC: Firmware error: result=0x%02x\n",
> +			resp_hdr->result);
> +		return -EIO;
> +	}
> +
> +	drm_dbg(&sc->xe->drm, "SC: response: group=0x%02x cmd=0x%02x\n",
> +		resp_hdr->group_id, resp_hdr->command);
> +
> +	return 0;
> +}
> +
> +static int sc_mb_receive_frames(struct xe_sc *sc,
> +				const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
> +				void *data_out, size_t data_out_len,
> +				size_t *bytes_received, unsigned int timeout_ms)
> +{
> +	u32 ctrl_reg, total_frames, current_frame;
> +	size_t payload_size;
> +	int ret;
> +
> +	*bytes_received = 0;
> +
> +	do {
> +		ctrl_reg = xe_mmio_read32(&sc->mmio, SC_MB_CTRL);
> +		current_frame = FIELD_GET(MKHI_FRAME_CURRENT, ctrl_reg);
> +		total_frames = FIELD_GET(MKHI_FRAME_TOTAL, ctrl_reg) + 1;
> +
> +		drm_dbg(&sc->xe->drm, "SC: Receiving frame %u/%u\n",
> +			current_frame, total_frames - 1);
> +
> +		if (current_frame == 0) {
> +			u32 temp_frame[4];
> +			struct xe_sc_mailbox_mkhi_msg_hdr *resp_hdr;
> +
> +			sc_mb_read_frame(sc, temp_frame, 0);
> +			resp_hdr = (struct xe_sc_mailbox_mkhi_msg_hdr *)temp_frame;
> +
> +			ret = sc_mb_validate_response_header(sc, msg_hdr, resp_hdr);
> +			if (ret)
> +				return ret;
> +
> +			payload_size = SC_MB_FRAME_SIZE - sizeof(struct xe_sc_mailbox_mkhi_msg_hdr);
> +			if (payload_size > data_out_len) {
> +				drm_err(&sc->xe->drm, "SC: Response buffer too small\n");
> +				return -ENOSPC;
> +			}
> +
> +			memcpy(data_out,
> +			       (u8 *)temp_frame + sizeof(struct xe_sc_mailbox_mkhi_msg_hdr),
> +			       payload_size);
> +			*bytes_received = payload_size;
> +		} else {
> +			size_t frame_size = SC_MB_FRAME_SIZE;
> +
> +			if (current_frame == total_frames - 1) {
> +				size_t total_response = (total_frames - 1) *
> +							SC_MB_FRAME_SIZE +
> +							sizeof(struct xe_sc_mailbox_mkhi_msg_hdr);
> +				size_t remaining = total_response -
> +						   *bytes_received -
> +						   sizeof(struct xe_sc_mailbox_mkhi_msg_hdr);
> +				frame_size = min(frame_size, remaining);
> +			}
> +
> +			if (*bytes_received + frame_size > data_out_len) {
> +				drm_err(&sc->xe->drm, "SC: Response buffer too small\n");
> +				return -ENOSPC;
> +			}
> +
> +			sc_mb_read_frame(sc, data_out, *bytes_received);
> +			*bytes_received += frame_size;
> +		}
> +
> +		sc_mb_clear_response(sc);
> +
> +		if (current_frame + 1 < total_frames &&
> +		    !sc_mb_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> +			drm_err(&sc->xe->drm, "SC: Response frame %u timeout\n",
> +				current_frame + 1);
> +			return -ETIMEDOUT;
> +		}
> +
> +	} while (current_frame + 1 < total_frames);
> +
> +	return 0;
> +}
> +
> +static int sc_mb_send_command(struct xe_sc *sc,
> +			      const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
> +			      const u8 *cmd_buffer, size_t cmd_size,
> +			      void *data_out, size_t data_out_len,
> +			      size_t *rdata_len, unsigned int timeout_ms)
> +{
> +	size_t bytes_received;
> +	int ret;
> +
> +	if (rdata_len)
> +		*rdata_len = 0;
> +
> +	ret = sc_mb_send_frames(sc, cmd_buffer, cmd_size, timeout_ms);
> +	if (ret)
> +		return ret;
> +
> +	if (!data_out) {
> +		drm_dbg(&sc->xe->drm, "SC: Command completed (no response expected)\n");
> +		return 0;
> +	}
> +
> +	if (!sc_mb_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> +		drm_err(&sc->xe->drm, "SC: Response timeout (RUN_BUSY_OUT not set)\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	ret = sc_mb_receive_frames(sc, msg_hdr, data_out, data_out_len,
> +				   &bytes_received, timeout_ms);
> +	if (ret) {
> +		sc_mb_clear_response(sc);
> +		return ret;
> +	}
> +
> +	if (rdata_len)
> +		*rdata_len = bytes_received;
> +
> +	drm_dbg(&sc->xe->drm, "SC: MKHI message completed: %zu bytes payload received\n",
> +		bytes_received);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sc_mailbox_send_command - Send command to System Controller via mailbox
> + * @handle: XE device handle containing the system controller
> + * @cmd_buffer: Pointer to xe_sc_mailbox_command structure
> + * @rdata_len: Pointer to store actual response data size (can be NULL)
> + *
> + * Send a command to the System Controller using MKHI protocol. Handles
> + * command preparation, fragmentation, transmission, and response reception.
> + * Optimized to move memory allocation outside the critical section.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int xe_sc_mailbox_send_command(void *handle, void *cmd_buffer, size_t *rdata_len)
> +{
> +	struct xe_device *xe = handle;
> +	struct xe_sc *sc;
> +	struct xe_sc_mailbox_command *cmd = cmd_buffer;
> +	u8 *command_buffer = NULL;
> +	size_t command_size;
> +	int ret;
> +
> +	if (!xe || !cmd)
> +		return -EINVAL;
> +
> +	sc = xe->sc;
> +	if (!sc)
> +		return -ENODEV;
> +
> +	if (!cmd->data_in && cmd->data_in_len)
> +		return -EINVAL;
> +
> +	if (!cmd->data_out && cmd->data_out_len)
> +		return -EINVAL;
> +
> +	might_sleep();
> +
> +	ret = sc_mb_prepare_command(sc, &cmd->header, cmd->data_in, cmd->data_in_len,
> +				    &command_buffer, &command_size);
> +	if (ret) {
> +		drm_err(&sc->xe->drm, "SC: Failed to prepare command: %d\n", ret);
> +		return ret;
> +	}
> +
> +	mutex_lock(&sc->cmd_lock);
> +
> +	xe_pm_runtime_get(xe);
Will suggest to get lock at this place i.e. after resuming the device.
> +
> +	ret = sc_mb_send_command(sc, &cmd->header, command_buffer, command_size,
> +				 cmd->data_out, cmd->data_out_len, rdata_len,
> +				 SC_MB_DEFAULT_TIMEOUT_MS);
> +	if (ret)
> +		drm_err(&sc->xe->drm, "SC: Mailbox command failed: %d\n", ret);
release lock here.
> +
> +	xe_pm_runtime_put(xe);
> +
> +	mutex_unlock(&sc->cmd_lock);
> +
> +	kfree(command_buffer);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sc_mailbox.h b/drivers/gpu/drm/xe/xe_sc_mailbox.h
> new file mode 100644
> index 000000000000..d5ca43c40f1a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sc_mailbox.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __XE_SC_MAILBOX_H__
> +#define __XE_SC_MAILBOX_H__
> +
> +#include <linux/types.h>
> +
> +struct xe_sc;
> +
> +/**
> + * struct xe_sc_mailbox_mkhi_msg_hdr - MKHI protocol message header
> + */
> +struct xe_sc_mailbox_mkhi_msg_hdr {
> +	/** @group_id: Message group identifier */
> +	u32 group_id    : 8;
> +	/** @command: Command identifier within the group */
> +	u32 command     : 7;
> +	/** @is_response: Response flag - 0 for request, 1 for response */
> +	u32 is_response : 1;
> +	/** @reserved: Reserved field, must be zero */
> +	u32 reserved    : 8;
> +	/** @result: Result code from firmware */
> +	u32 result      : 8;
> +} __packed;
> +
> +/**
> + * struct xe_sc_mailbox_app_msg_hdr - Application message header
> + */
> +struct xe_sc_mailbox_app_msg_hdr {
> +	/** @group_id: Application group identifier */
> +	u32 group_id  : 8;
> +	/** @command: Specific command within the application group */
> +	u32 command   : 8;
> +	/** @version: Protocol version */
> +	u32 version   : 8;
> +	/** @reserved: Reserved field, must be zero */
> +	u32 reserved  : 8;
> +} __packed;
> +
> +/**
> + * struct xe_sc_mailbox_command - System Controller mailbox command structure
> + */
> +struct xe_sc_mailbox_command {
> +	/** @header: Application message header containing command information */
> +	struct xe_sc_mailbox_app_msg_hdr header;
> +	/** @data_in: Pointer to input payload data (can be NULL if no input data) */
> +	void *data_in;
> +	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
> +	size_t data_in_len;
> +	/** @data_out: Pointer to output buffer for response data (can be NULL if no response) */
> +	void *data_out;
> +	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
> +	size_t data_out_len;
> +};
> +
> +int xe_sc_mailbox_send_command(void *handle, void *cmd_buffer, size_t *rdata_len);
> +
> +#endif /* __XE_SC_MAILBOX_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_sc_types.h b/drivers/gpu/drm/xe/xe_sc_types.h
> new file mode 100644
> index 000000000000..5ec2126cebe4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sc_types.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SC_TYPES_H_
> +#define _XE_SC_TYPES_H_
> +
> +#include <linux/completion.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_sc_mailbox.h"
> +
> +struct xe_device;
> +
> +/**
> + * struct xe_sc - System Controller driver context
> + */
> +struct xe_sc {
> +	/** @xe: Back pointer to xe_device */
> +	struct xe_device *xe;
As mentioned above, drop this. Either use container_of to get xe or 
instead of passing struct xe_sc to mailbox functions pass struct xe.
> +	/** @mmio: MMIO region for SC registers */
> +	struct xe_mmio mmio;
As mentioned above. No need to maintain this, just use root time mmio.
> +
> +	/** @cmd_lock: Mutex protecting mailbox command operations */
> +	struct mutex cmd_lock;
> +
> +	/** @phase_bit: MKHI message boundary phase toggle bit */
> +	u32 phase_bit;
> +};

This structure can go inside struct xe_device.

Thanks,
Badal

> +
> +#endif /* _XE_SC_TYPES_H_ */
