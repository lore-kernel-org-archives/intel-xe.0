Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85CEE7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 17:26:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D3D10E26D;
	Fri, 13 Dec 2024 17:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2huoa2N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D727110E26D
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 17:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734110767; x=1765646767;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=IXUKotj/npK1ol9agYIv9gim1e0UawLd1j5xIRhHjOw=;
 b=e2huoa2NYXNJSHtHERXIwz/2mplKjXfNo+Ygc4QMp0MVxyZ15EB+K4pG
 q5+U8LIeJtktGXxcvq1q5nCyvTU+oOz0vZrnqBOQ39M2otWnBac7qrKae
 k3CJ1Qsn9P/WrSfctlG7Q8E7f2Q4XvyEFHsUAzCJXuKW2Bj7TzKrWSEFC
 RGaoxGN20N/ybn/MtonbCI220GzPXk1TFrF/HDJudLOcxdARLoi6qapIF
 AahM3kHjeWKnLEQgPEDP9UgJxxn1spcHAPP3NMq8+8l0kw68qS6KYBNZr
 Sa9vGNNkw95lN8CIOIFNUK+m6MLwpjGMBsYZn/+WAPPNDRcFa1zx8w1oc w==;
X-CSE-ConnectionGUID: hW16hN4NRvufkGH+rz41VA==
X-CSE-MsgGUID: kdka0YULRx6TdnV0aeshgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="45179231"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="45179231"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 09:26:06 -0800
X-CSE-ConnectionGUID: u/LmzhKSS5mrgSvRO6FxQg==
X-CSE-MsgGUID: 5/5a/W/2SbCNOGQ0/P5JpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96457098"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 09:26:06 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 09:26:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 09:26:05 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 09:26:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAuH73NAkQBBgOGYBT2ukiUOR7Rd/5kM/gAZg62bfW2KcW7PrxCUHxA7y5cr99cQnKIZoKSn9LrADC6FKO2sGukybQGJo21kmcMzB4zVkbnCQFuHCORyK2X5i1/6jiasPISHtwaDaG9W1FYUxP/fMXM+TzkEer9nqHZbPR7zpxUERBPUZFOaWWvEtDjWUI53ZTTLn0Gw8neimCqt0ipFzNFCi2gvQIilet0Jh2aYEI720sVdAVIFRlnoo0UypllvEzQmpdJTgN+qkGihJ9FrvlkMzK4+tL3MRFXkWA/8I8QBMfhEGA+7w7CT6lP+85hxo01RE7QJpCCqEwqf/xcCCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXUKotj/npK1ol9agYIv9gim1e0UawLd1j5xIRhHjOw=;
 b=JHf7Ir6Oc0PHEU++EBbRWlDVS++coiFF6mT5qyMIAg3Qv5qmWKt4nhgmC+oJRmdiqIekPB2P6GAgSg5q9pUM7NOWxss/zaXbUL6LzygQvHMKQSFtGkgXvU0fBdzWVt2EtsIlzpkc6s34xKyA04RfjX09IFN2RXxfL8AfmfsrI+TinqmdOaMrZPXzAmhkW3ZRZ83L1LniQbWBN67CDM5IQm1K6Lk34C5rWb67jpJfiDC6tFXOsPkD+0gLvRwwbLP5+bch86yE2Y6acawAFEmq+9GBORKwHU1xvMAtNZf7Q2CMQDGzWwsRmDZph+M5tp5Ydk7e14YidKCni8BShGTT5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY8PR11MB7171.namprd11.prod.outlook.com (2603:10b6:930:92::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Fri, 13 Dec
 2024 17:25:18 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 17:25:18 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
Thread-Topic: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
Thread-Index: AQHbTWkcZhgIo/ttdkKNQ0lly9C4rLLkPnMAgAAI5oCAAAQoAIAABxGAgAAK0ICAAAWGgIAAAjQAgAAIA4A=
Date: Fri, 13 Dec 2024 17:25:18 +0000
Message-ID: <29a8ead7e28a72f7d9498d1701932836d7c14981.camel@intel.com>
References: <20241213141252.1488109-1-rodrigo.vivi@intel.com>
 <t6j573cbepbjwiclv5ulewcapwqyf7np4bvdut6gjario6wmeq@sk3cxg6mnos7>
 <a49a74a0b2ac363691f26dddde60aae60461ccbb.camel@intel.com>
 <7cd068ff3630f40e31cd4d971ad794986b017ab5.camel@intel.com>
 <26263eveox7cc3dqfqezodcunjamqgd7wrotzwmbci2o2ia42v@kkc3kpaizsef>
 <11116b4e7978ad7b5dc91d25c1d0232c809912c6.camel@intel.com>
 <w6zmdulew6aqkrkmjme7bdjp6jkllhswpazppd3t5gqnpysg4j@alphmd6gcxcr>
 <74c5a108-c5aa-49e3-b841-ff7ca838fae0@intel.com>
In-Reply-To: <74c5a108-c5aa-49e3-b841-ff7ca838fae0@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY8PR11MB7171:EE_
x-ms-office365-filtering-correlation-id: 2f71786d-ed2b-48d1-c650-08dd1b9b1d38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cVJDSkdGVlV4ZmdDNkNhWGtRNFNWS05DL3BtdVhGSU9rem15RExmU0pZdFRs?=
 =?utf-8?B?QW9keTVhc2NqZTF6YmZuNlIxeEFuTERFTmRpVmJYQnozem5mVXE5MURPZU5M?=
 =?utf-8?B?V2cxa2JneS8rOVJNVWRycllETFl4VDN2ZEhNR3VVQ1RzcnV6VDVDSUxLdi9D?=
 =?utf-8?B?UmdxSVd6eGMrZUtrUzN3VE10elBRTElRamVSZVdIZjNPcTdUU0xUakNmNmVE?=
 =?utf-8?B?R2NmeWFTQzgrbm5URzJaUDRuRkwvY2hRQVJjVXJQTE5yQnZxbnZuVVRNL21D?=
 =?utf-8?B?K2R4VU8vWFZVeEFsSTNzbnp3dDZreWZVeFpjSzhQVWhUVTZCaHpORytlaUl0?=
 =?utf-8?B?YXMwOFNJL0pva3NPbG5WeTZxRjdVNWdMeWM4cEo5emhPYldsUTJHWTFxYm9j?=
 =?utf-8?B?d2E3enplZjJxRG5ud3h2NmQ0bEM4cVowMU9hQmFEV3IrVkxEZUErR05rczIw?=
 =?utf-8?B?ODRFOXFvQVFVUlkwSzdTMUM2bm90cDdTR25kYmFEUVpaT3h4SGRFczEza1dt?=
 =?utf-8?B?cFAvcEc4WXJvUGUwckk2WXZReVBlT3hHQVJyUkVVd1l1NzAxY0RDTndpWUh1?=
 =?utf-8?B?R05VWDMyZTVMMVQ1clV0MGEwTExBdVZlTFp3ZCs4bFptZVVKU1Z2WnpKTVRF?=
 =?utf-8?B?U1MvVTRSWEhRamJFTkY0eU5FcEp6RFFlQTlhczZHRDI0OTV0eCs2Q1JDL2RB?=
 =?utf-8?B?Sjd2QTZTRW54U0NERmlOaFlWYjNtRUVMQVZjNlFrVzc2R01oYWxRblBVMjhM?=
 =?utf-8?B?Nit5TFF3MDZmS3FZRjZ4REhWOFlFclMxOUFZeHNGTjkycW1EYVpGc0R6S0Fw?=
 =?utf-8?B?MFM1cjNmUHdNcUwzSVdBak1jY1VzN1dYZ21yKzdLdXRIdkowY3RmQU9kclh1?=
 =?utf-8?B?TUVTcVpoWlc4QWhYVW9ZM25QdStPRmVBc1JrMUJTT21ZT1RjMVZjTjRDMzk1?=
 =?utf-8?B?U0hKK1lsczhFdG1oVGJ6NnNTam5reXh1MjlxMGJzTXRRL2hKL3ZIaDZBZ2xP?=
 =?utf-8?B?UkRvTHJMdlpJcUxoWXBWYWhvZGRscjVuRy9GRFBvQmJYeXRQOGRaNVpCVVlU?=
 =?utf-8?B?OEc5NUpUYnoyL3RTSnFHMTRQMHFYdHF1VGVaNnZlc1NXb3BBMzZteml0K0tu?=
 =?utf-8?B?UXUrMElLMThwK2x0ek45VmZVTnZpd0Z6ZDErV1k5NC8zc25nNXVyZWxVeVR1?=
 =?utf-8?B?NzV6WVFiRXdGS3ZmQzFkQkZPWUVnaEY5ZXV5aVFvNmJMeFMxT1NsaTYrQ0R3?=
 =?utf-8?B?MHlmZ1VRelhDa2U5UzRqOWc3TWU3OFhlRzB3OTVKTGtwbFdxdStNOVJaQlU3?=
 =?utf-8?B?WUhGUUFXaFBBRmNteHNLalhnMWZJK3BIckFLQVRyb3hmU0Jyek4veHk3QUNu?=
 =?utf-8?B?Q0VvT3BtNmNDUGREeEZuZWZtcDZsU3BJSHJWc2hVZ2JmVGtVU01WMVZqZXdr?=
 =?utf-8?B?NUg1bXB0Rndac0d2MHhMZUlTdmYySFV4TU15Tzd6R29kTEtmUHhka3dwdnpF?=
 =?utf-8?B?dDdKd1lRRUVpWmJjb0dsVDd2UmxpRGNoNC9nNTNtODI5SlBSL2sybkpoUDdT?=
 =?utf-8?B?YStnbUF3OXptK1o2eUFLOHlIYzFBSFVEWjJ1TW0xMHRXYlUrT2J5RnZBS3hD?=
 =?utf-8?B?dWpDQWlaVUhNQUxNeUJjVjZxVVkrYXBiUWZPVVR4NlhaWGU5V1kzYzhoK05j?=
 =?utf-8?B?V2xZdkc4ODd4MEptRVZzUG5JVkRqV21RZ2d3Yit0MGxxanR2THZLMlJpdGFo?=
 =?utf-8?B?S2prZVV3eXBtcHJNaGIzTVFEL29yMm9HQloxY1REYWZpQ25kYWVKUE9TaTUr?=
 =?utf-8?B?a0prelE5YXRUbEpxTGMrNElpWFBpU1Q5eHFNRlhJQ3MydXlaaWRxY0ZFbTBW?=
 =?utf-8?B?Wm1WK2wzM3paWWs4Q3JoM3NHNTNNOGNOVUkvYzRyTEZEVHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0g0U2E0WTZFT3NFSkQyWTlWU3VYSTF4L3p0aVNTRUFYNUxCN3pwNkhMOGtF?=
 =?utf-8?B?MEtoNVVGMW42RGVNaE5ibGJtWEMwTWcyeTYrTjZwNFdpSmtqTDFUQUI5Q0Nl?=
 =?utf-8?B?cmhnRTg3cStSSCs3Wms4SE5Sd3BzTGJ3bThFejR5MVN4Ry9EVzA3aXhsWTRV?=
 =?utf-8?B?Vm05dE9TdFlVUTlNVjc5TDM3bFZNMGFmMTlSaDg1VE1CMXRRcXFmK3c0dDlM?=
 =?utf-8?B?alhhaThRRndKNHFzQ1hBb2NyV1hNdzJ6QXozNGYwY3drN2dpOHdRNk9wSTU0?=
 =?utf-8?B?dENDTUQxUW1aR3ZyWjdKMWN6YUQ2MDhFQmF6VTdDSUs5U09qR2F1a2duaFpR?=
 =?utf-8?B?UHRvUUx4UG9uNTBnTDhIcW5BM3huSkhBMnBKaEVlVjU3Y2tzeGVJaDZ3cUZI?=
 =?utf-8?B?TEtZUjBJUG5RNzRwQXdSRnViWS9nMWxkM1ZXSk5heXBaQTZ2UUsvdVFtUGRt?=
 =?utf-8?B?N1dvUVd1U2ZNcnFoUnFKa3kyK29RalNDZkxaUHlwOHpvcjRXYmpMN0kvRUhR?=
 =?utf-8?B?bWxkejVDTS8rYitRZ0NNejVuUnJxU1NFYzh2U0d3SXV1Mm93SGJkVVQyTnY1?=
 =?utf-8?B?Q1A0N3k4aG9TUEhMSm5hNDVaNDZxZGgxVlN5NTJXSExsMXh6WVpBQkJEcWp0?=
 =?utf-8?B?MDZFS1hKY0sxTkFDYUl6NXkwRG14YXEybmd5RFNxOFc5dVAvR2Z0OVpVK3Fu?=
 =?utf-8?B?TjRKUHJCRGZZckxzczA2ajRRVFVJbUxjV2g1QkRob2NTTmlFT1I1Y3laMnpW?=
 =?utf-8?B?L2ZpTUl5SDBYNUpqWmE5a0I1dVFhUEJKQ2tzTTlwZTBXeHBKVWY0YlhNYlhX?=
 =?utf-8?B?NDhGdGFzZlpla3lTOU5EYUJxdUFYSi9ISm9BSHlmOXRZSkR4czZMbk9VNFNX?=
 =?utf-8?B?Nm9FeWk4TmZRdWhyQnF4cGZpb0MwRVZDOTlvbHdySE5Qd0ZwdVk2K0ZUNkpH?=
 =?utf-8?B?aUMvY0VlcHpYUjF4OVduVmtaR2VxdFRKVnBGbXg3THFjdWM1VXdDWmFnOG5K?=
 =?utf-8?B?aDNnQy9rdTRqYVFLRFRSTzcwcCtkdmg4SXdBNEtkYmRkZ1pjVmQwb3FodFd1?=
 =?utf-8?B?aXRKSStBWGswbUlzaXI5MjJXdFF5TCthdWpEbjRDNlVxMXZSVWVXMmVNdVBT?=
 =?utf-8?B?ZzVSYXovN0pFM0NkZGJYcVBzRzEyQSt0NlFNWWV5TWJIaXRCY1BRUDduc2h3?=
 =?utf-8?B?ak5LZzdMeVBFSWNEUnBtZ1AveTN5ckkvV3J2QzRLNncraGFBa3p6bUdBTmcr?=
 =?utf-8?B?aUxLMTVsUUtQYllnSXhkdXV6RVo3RE56SG1SRHd0YU00Qk9FVDBKSDZ4Tk5Q?=
 =?utf-8?B?bzVVR0FOS2lTbnhUZWJoRmxnMzVlZ2lHWEpzaXg0M0JQZ3ZHQ1h4ajEzYkN3?=
 =?utf-8?B?ZDg5VldHajZxdm1FL0xNYmtzcnRtSTlZYlo0dlM0UVdOVG9qd0xyMFAzOVZy?=
 =?utf-8?B?STIrK3lrZ1BrRlMwQVhiTC9JMTJxQTNoY3lseTFaeWJrQUoyQlpjWEtZS0Vh?=
 =?utf-8?B?UVpCbnJRS2dRMXcvdElzd0h4VXpOSnMya1Y0TThLTHVWYU0wblp4TjRpTXV2?=
 =?utf-8?B?dFdKSDIwQjFZN2hmMDdYOThYOXJlYnF1ZUFweHVQR2JqWjlVZmtKVEl2SzRp?=
 =?utf-8?B?Y1E0bjlwSnl2c0ZOajkzK3RUeG52UVMxV0RVc2pqamNJOWRSRnRLNjczZUow?=
 =?utf-8?B?dnRiaUJrSSs3Vktmc0hyZ3o3UDY1ZlRvVzFpN0VDR1ZFYVFGOFBQNm5JN1ZR?=
 =?utf-8?B?Qi91aWdlK05uS0RkTlcwODF3UUtJSEt5bm5iQnN1c1JPcUprb1Q3TDNVK1RO?=
 =?utf-8?B?ZXY2Q1JPWDlydTdrMTlnSnFHb3Z5MEcrc1p3eGlOVmxnbTYyMmd2VWdpN0VB?=
 =?utf-8?B?TlJaV1g4elUyanFQVXc4R2htNHdZSGVOQy95Mk5xUzdjWVE1TXJ2RWRQKzI1?=
 =?utf-8?B?MS9uK3R5RDlXeVhhQlNmV1crL0hYOEFWYjJzbFRESlNnUzdCQjhOdFFWeEcv?=
 =?utf-8?B?ZHcrTEJFY0haV3p4QkdCT1Q4K2loR2VFbDdOOEpiVmZ6TTcvWkhzWnUvMnd3?=
 =?utf-8?B?emtJcktLdHduZ3dPNStZakptUThIVGd1eEo5YjJmcklRTkQ0UkZHdCtkRXd0?=
 =?utf-8?B?ekRjZUR1WHFQSVM1NjdGL2gvdU9kV2d3U0JwY1dOSVJJeGlyR1VjVHJTdTFU?=
 =?utf-8?B?Tnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A7849EB516C8643818AAA7128138639@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f71786d-ed2b-48d1-c650-08dd1b9b1d38
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 17:25:18.0432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rq2lljR46DgoSp1Bw8VEuvET6nP0hmkUf+wpnHbE4oiUBTkQZu+DqeQr7V7n+g4kjI2dCHeGnrI9c6Di6PqiBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7171
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

T24gRnJpLCAyMDI0LTEyLTEzIGF0IDA4OjU2IC0wODAwLCBKb2huIEhhcnJpc29uIHdyb3RlOg0K
PiBPbiAxMi8xMy8yMDI0IDA4OjQ4LCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6DQo+ID4gT24gRnJp
LCBEZWMgMTMsIDIwMjQgYXQgMDQ6Mjg6NThQTSArMDAwMCwgSm9zZSBTb3V6YSB3cm90ZToNCj4g
PiA+IE9uIEZyaSwgMjAyNC0xMi0xMyBhdCAwOTo1MCAtMDYwMCwgTHVjYXMgRGUgTWFyY2hpIHdy
b3RlOg0KPiA+ID4gPiBPbiBGcmksIERlYyAxMywgMjAyNCBhdCAwMzoyNDo1OVBNICswMDAwLCBK
b3NlIFNvdXphIHdyb3RlOg0KPiA+ID4gPiA+IE9uIEZyaSwgMjAyNC0xMi0xMyBhdCAwNzoxMCAt
MDgwMCwgSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSB3cm90ZToNCj4gPiA+ID4gPiA+IE9uIEZyaSwg
MjAyNC0xMi0xMyBhdCAwODozOCAtMDYwMCwgTHVjYXMgRGUgTWFyY2hpIHdyb3RlOg0KPiA+ID4g
PiA+ID4gPiBPbiBGcmksIERlYyAxMywgMjAyNCBhdCAwOToxMjo1MkFNIC0wNTAwLCBSb2RyaWdv
IFZpdmkgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gV2UgZG8gbm90IGJyZWFrIHVzZXJzcGFjZS4N
Cj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gVGhlcmUgaXMgb3RoZXIgcGF0Y2ggdGhhdCBhbHNv
IGJyZWFrcyBNZXNhIHBhcnNlcjoNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gZHJtL3hlL2Rl
dmNvcmVkdW1wOiBJbXByb3ZlIHNlY3Rpb24gaGVhZGluZ3MgYW5kIGFkZCB0aWxlIGluZm8NCj4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IFRoaXMgcmV2ZXJ0
cyBjb21taXQgZWMxNDU1Y2U3ZTM1YTMxMjg5ZDJkYmMxMDcwYjk4MDUzODY5ODkyMS4NCj4gPiA+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IEJ1dCB3ZSBoYXZlIHVzZXJzIGNhbGxpbmcgdGhpcyBm
dW5jdGlvbi4uLi4gdGhlIHJldmVydCBpcyBub3QgDQo+ID4gPiA+IHNvIHNpbXBsZS4NCj4gPiA+
ID4gPiA+ID4gSSB0aGluayB3ZSBuZWVkIHRvIHJldmVydCB0aGUgZnVuY3Rpb25hbGl0eSByYXRo
ZXIgdGhhbiANCj4gPiA+ID4gcmV2ZXJ0aW5nIGFsbA0KPiA+ID4gPiA+ID4gPiB0aGUgcGF0Y2hl
cywgb3RoZXJ3aXNlIGl0IHdpbGwgY2F1c2UgYSBsb3Qgb2YgaGVhZGFjaGVzLg0KPiA+ID4gPiA+
ID4gPiANCj4gPiA+ID4gPiA+ID4gSSBwcm9wb3NlIHdlIGdvIHdpdGg6DQo+ID4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gPiBhKSBkcm9wIHRoZSBcbiB0aGF0IGJyb2tlIG1lc2EgYW5kIG1lcmdl
IHRoYXQgd2l0aCBjYyBzdGFibGUuDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBiKSBt
b3ZlIGJhY2sgdGhlIGVudHJ5IHRvIHRoZSBwcmV2aW91cyBzZWN0aW9uIHRoYXQgYnJva2UgbWVz
YSANCj4gPiA+ID4gYW5kIGNjDQo+ID4gPiA+ID4gPiA+IMKgwqDCoMKgIHN0YWJsZS4NCj4gPiA+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IMKgwqDCoMKgIEpvc8OpLCB3b3VsZCBpdCBiZSBvayB0
byBtZXJnZSBhIHBhdGNoIGluIG1lc2EgYW5kIHBvcnQgdGhhdA0KPiA+ID4gPiA+ID4gPiDCoMKg
wqDCoCB0byBtZXNhIHN0YWJsZSB0aGF0IHNpbXBseSBsb29rcyBhdCAyIHBvc3NpYmxlIHNlY3Rp
b25zPyANCj4gPiA+ID4gT3IgZXZlbg0KPiA+ID4gPiA+ID4gPiDCoMKgwqDCoCBkcm9wIHRoZSBz
ZWN0aW9uIGNoZWNrcy4uLiA/DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gQnV0IGlmIFhlIEtNRCBp
cyByZXZlcnRpbmcgdGhlIHBhdGNoIHRoYXQgY2hhbmdlZCB0aGUgaHdjdHggDQo+ID4gPiA+IHNl
Y3Rpb24gd2h5IHdvdWxkIE1lc2EgbmVlZCB0byBhbHNvIHBhcnNlIHRoZSBuZXcoZnV0dXJlIHRv
IGJlIA0KPiA+ID4gPiByZXZlcnRlZCkgc2VjdGlvbj8NCj4gPiA+ID4gDQo+ID4gPiA+IGZpcnN0
IGlzIHRvIHVuZG8gdGhlIGRhbWFnZSwgd2l0aCAwIGNoYW5nZXMgaW4gbWVzYS4gV2UgZG8gdGhh
dCANCj4gPiA+ID4gZmlyc3QgYW5kDQo+ID4gPiA+ICp0aGVuKiB3ZSBhZ3JlZSBvbiB3aGF0J3Mg
cG9zc2libGUgdG8gZG8gdG8gYWNjb21vZGF0ZSB0aGUgMiBwYXJzZXJzIHdlDQo+ID4gPiA+IGhh
dmUuDQo+ID4gPiA+IA0KPiA+ID4gPiBJZiB3ZSBjYW4gZ2V0IHNvbWV0aGluZyBpbiBtZXNhIHRv
IHdvcmsgdGhhdCBpcyBiYWNrd2FyZCBjb21wYXRpYmxlIA0KPiA+ID4gPiAoaS5lLiB0aGUNCj4g
PiA+ID4gY2hhbmdlZCBwYXJzZXIgaXMgYWJsZSB0byBwYXJzZSBib3RoIGJlZm9yZSBhbmQgYWZ0
ZXIgdGhlIGtlcm5lbCANCj4gPiA+ID4gY2hhbmdlKSwNCj4gPiA+ID4gdGhlbiBpdCBjb3VsZCBi
ZSBjb25zaWRlcmVkIHRvIGEgbWVzYSBzdGFibGUgYW5kIHRoZSBrZXJuZWwgc2lkZQ0KPiA+ID4g
PiBjaGFuZ2VkLg0KPiA+ID4gDQo+ID4gPiBPa2F5LCByZWFzb25hYmxlIHBsYW4uIEJ1dCB0aGUg
YXNjaWk4NSBlbmNvZGVyIHdpdGggXG4gd2lsbCBub3QgYmUgDQo+ID4gPiBicm91Z2h0IGJhY2sg
cmlnaHQ/DQo+ID4gDQo+ID4gbWF5YmUgbGV0J3MgYWdyZWUgb24gaG93IHRvIHBvc3NpYmx5IGJy
aW5nIGl0IGJhY2s/IEkgc3VnZ2VzdGVkIHVzaW5nIGENCj4gPiBzcGFjZSBhcyBjb250aW51YXRp
b24gbGluZSBjaGFyLiBUaGlzIHdheSB5b3UgY2FuIGp1c3QgY2hlY2sgdGhlIGxhc3QgDQo+ID4g
Y2hhcg0KPiA+IHJldHVybmVkIGJ5IGdldGxpbmUoKSB5b3UgYXJlIGNhbGxpbmcgYW5kIHNlZSBp
ZiB5b3UgY2FuIGdvIGFoZWFkIGFuZA0KPiA+IHByb2NlZWQgb3IgaWYgeW91IHN0aWxsIG5lZWQg
dG8gZ2V0IG1vcmUgZGF0YS4gTmVpdGhlciBzcGFjZSBub3IgbmV3bGluZQ0KPiA+IGFyZSBwYXJ0
IG9mIHRoZSBhc2NpaTg1IGNoYXJhY3RlciBzZXQsIHNvIGl0J3Mgc2FmZSBhbmQgeW91IGNhbiBo
YW5kbGUNCj4gPiBjb250aW51YXRpb24gaW4gb25lIHBsYWNlIGluIHlvdXIgbG9vcC4NCj4gPiAN
Cj4gPiBpZiB5b3UgYXJlIGp1c3QgaWdub3JpbmcgYW55IGFzY2lpODUsIHRoZW4gSSBiZWxpZXZl
IGl0J3MgZXZlbiBzaW1wbGVyOg0KPiA+IHlvdSBjaGVjayBzZWN0aW9ucyBhbmQga2V5cyB3aXRo
IGEgc3BhY2Ugc2luY2UgYm90aCBrZXlzIGFuZCBzZWN0aW9uDQo+ID4gdGl0bGVzIGNvbnRhaW4g
c3BhY2UsIHdoaWNoIGlzIG5vdCBwYXJ0IG9mIHRoZSBhc2NpaTg1IGNoYXIgc2V0Lg0KPiA+IA0K
PiA+IEx1Y2FzIERlIE1hcmNoaQ0KPiBZZXMsIEkgd291bGQgc3Ryb25nbHkgcHJlZmVyIHRvIHVz
ZSBsaW5lIHdyYXBwZWQgQVNDSUk4NSBkYXRhIGZvciBhbGwgDQo+IGJsb2JzIGluIHRoZSBkZXZj
b3JlZHVtcC4gSW5jbHVkaW5nIHRoaW5ncyBsaWtlIGJhdGNoIGJ1ZmZlcnMgYW5kIG90aGVyIA0K
PiBWTSBlbnRyaWVzIHRoYXQgdGhlIG1lc2EgdG9vbCBpcyBwcmVzdW1hYmx5IHdhbnRpbmcgdG8g
ZGVjb2RlLg0KPiANCj4gSWYgYWRkaW5nIGEgPHNwYWNlPiBjaGFyYWN0ZXIgdG8gdGhlIGVuZCBv
ZiBlYWNoIGxpbmUgaXMgYW4gYWNjZXB0YWJsZSANCj4gZml4IHRoZW4gSSBoYXZlIG5vIHByb2Js
ZW1zIHdpdGggdGhhdC4gQnV0IG5vdCBsaW5lIHdyYXBwaW5nIGF0IGFsbCANCj4gbWVhbnMgaGF2
aW5nIHRvIGNhcnJ5IHRoYXQgY2hhbmdlIGFzIGEgbm9uLXVwc3RyZWFtIHBhdGNoIGluIGVpdGhl
ciB0aGUgDQo+IGludGVybmFsIHRyZWUgb3IgaW4gaW5kaXZpZHVhbCBkZXZlbG9wZXIncyBsb2Nh
bCB0cmVlcy4gRWl0aGVyIHRoYXQgb3IgDQo+IHdlIGp1c3QgY2Fubm90IGRlYnVnIGEgbG90IG9m
IGhhcmQgdG8gcmVwcm8gcHJvYmxlbXMuDQoNCkNhbid0IFhlIEtNRCB1c2UgdGhlIGxpbmUgd3Jh
cHBlZCB2ZXJzaW9uIG9mIEFTQ0lJODUgd2hlbiBwcmludGluZyB0byBkbWVzZyBhbmQga2VlcCB0
aGUgcmVndWxhciBlbmNvZGVyIHdoZW4gZGV2Y29yZWR1bXAgZmlsZSBpcyByZWFkPw0KDQo+IA0K
PiBKb2huLg0KPiANCg0K
