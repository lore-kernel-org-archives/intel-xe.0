Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD032D2F7D1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 22:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B45710E185;
	Wed, 16 Oct 2024 22:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YhX1zoaj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7486310E185
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 22:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729118381; x=1760654381;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0c/uAGt6T9WIype350V1ErPP6MbOPj0vgRrmO7Oxc7k=;
 b=YhX1zoajZE39e9VWtplrCo1veSpFTL7nGR32xEJxXD2sxbytch912MMH
 czLzz4tCCM9K26IvsWzNte+2IoPmXZFuPcqUyV/VCJyXMf7R99/3POOdH
 PA9TBAdnc77/C8zggewkafevRy0yvnQMgVp4T4GBu/WlbN2pLSX6hzSJQ
 4/bxFwQ3+qXR8jPtbvydARpEejarybXWxZZkQKdL7fFYCjc0eBci4MJLh
 FDQgZfud+PdfX3CfGJCWagDmRYrUandQVMc2xNlKOXXW5HaQPRU+HHlLY
 E2AlDMumoJJIFAaIANK+aYf9eylz5Ify7TJcDrd/zG8jvf7O/y2Hk/ap2 w==;
X-CSE-ConnectionGUID: fi8MeuIPSmi7ecAfTJ3rdw==
X-CSE-MsgGUID: 03ja0thxTtCVTsJ45YuMlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39982184"
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; d="scan'208";a="39982184"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 15:39:41 -0700
X-CSE-ConnectionGUID: 1etCJzs9RWS8LCldI5uQBw==
X-CSE-MsgGUID: igpxVrgMSTekClhu9ZWaTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; d="scan'208";a="115804267"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 15:39:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 15:39:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 15:39:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 15:39:38 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 15:39:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+eKTVziXevZZf7MYGrupRDt5pDTDroT7gg/oichGIn/aaVispQalbjJiNEPArHE30gh421x4iIErPT0yISKK5XL0Z07VC8284+hPKxCjALxuTcH2s8FicVLOAIOytmS2yyo4QLbeqlc0AQHCvEeewFMedPfbFjtxMe0kBKomVTCLek4bf8GSe3GVxByx/uO4s7L9qDCP7SL4EEAyolnZo6zB2BcW+h4xudijq/TemcPj7Nvp45XBIyl0FK1wm/FtQ/MN5lM3aiL9W2eyNwEPG8bJmkh/kiTboe1E1IRKWOxKJ5buWqg5lK4FityM5YxKMT8FTFZZXfqvWXlZeidKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0c/uAGt6T9WIype350V1ErPP6MbOPj0vgRrmO7Oxc7k=;
 b=j5L7s/lanRkrHacdOP5Ens3J1OI7plT4yENd+htA4CAvd2rKRhwFHFm9P41OxEAk9TCoNBz9as83nRmH5NNMvul1KQDMruCphD7xCLr000EDoGBn+Q33Avs26esWhnEc99PpvNmjGA44LCtMoSGQaovWt8f7iZMWa/Bh4Mo1JZdFFtuagaqvpR2QgziIKt8RvXZKoHaOW6pX3AbFK8+VZBj52izs44h+8BgktSMoZpxnnGVfEJOMXJR5gINZDLdUeLzBolYUsO8tyL329acrE5SQfzuGHlgcFZ2XRDbLOGqAefKYBIpA6FhUCGhiuIl6B6XvVspxe5MKSDxOtBrlzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 by DM6PR11MB4740.namprd11.prod.outlook.com (2603:10b6:5:2ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 22:39:34 +0000
Received: from BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f]) by BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f%5]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 22:39:34 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 1/1] drm/xe: enable lite restore
Thread-Topic: [PATCH 1/1] drm/xe: enable lite restore
Thread-Index: AQHbH/y/X6K0kN3Ko06KTcYdfnjZh7KJvwCAgAA4feA=
Date: Wed, 16 Oct 2024 22:39:34 +0000
Message-ID: <BL3PR11MB63629629C60BF54A7B012E719A462@BL3PR11MB6362.namprd11.prod.outlook.com>
References: <20241016185726.907844-1-fei.yang@intel.com>
 <20241016185726.907844-2-fei.yang@intel.com>
 <382341ca84abda4653f56b99690a9a63de882a35.camel@intel.com>
In-Reply-To: <382341ca84abda4653f56b99690a9a63de882a35.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6362:EE_|DM6PR11MB4740:EE_
x-ms-office365-filtering-correlation-id: 6e7d4f78-f301-4e61-b550-08dcee3368ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Wm90RVBjUVAxMlZOY0QrbitwbTRLeWlPUzkyQ0F1SGpnTWRLN1JxVTRoaWpW?=
 =?utf-8?B?M0NoOWhxOXdLRWlvU3FuL1pOaGs5TU9hUFhwamdMOVZnYklwQm44VEJhTTFv?=
 =?utf-8?B?SWxZUmQ2eEd5cWJiU3c3cHJDRkJFaE1EZ0VkbHNweW9Pa2ZKN2VUNVFMTlNW?=
 =?utf-8?B?bW51d1hoUWNLNm1zSFdQN2hseUQrMDE3eHlNelNJYXFlM2VpekhIbm9qR3Yx?=
 =?utf-8?B?VlQ4c1FkZW1icnJqcHdJaXBMMG1TL3UzRnQxdEw5dUw3ODNTNDhTNktKNDc4?=
 =?utf-8?B?TDZOS0JKSWlIaTBWdTFvdHQ0bitBbFQ5SGVUWWE0Y3hsLzF3bHlWS1FseFpB?=
 =?utf-8?B?K3g2WEllTkhGbzFmc2R0WTRMZFRKWkhIbVptWUVTZmdCQ3BvL0pyNEZhTWFw?=
 =?utf-8?B?OUZaQ3kxUDREMnJIVFpRVVVaSVI2S2ROWmJkRTg5WlVLUGhISEs2Z1hJdnlU?=
 =?utf-8?B?Zm9hRFYrM2lLRlJ0MU5iZnpxd1pFYjE2S2JsWmkxSGJ3R1Rta2dSYmlOcDMv?=
 =?utf-8?B?aG1wVDN5QXlOa0ovbHhLSnVwM1ZoQ2xubTVOd3VOYkdNd1JuQnQ1K1orZktl?=
 =?utf-8?B?RnBqSndPWUpzb2R5VWhjamhsVTFtcDQ0Q0YrUjZUOW5vRDVwVzJ1NEpBL3Rj?=
 =?utf-8?B?akRhcmwzMCsya1p1aDlHUnhLUHZENlJ2UWduN2Y1WHBRUnluWHBYUno4Mmhn?=
 =?utf-8?B?Vmw2LzhEQlpnbFFvaE5HaUwvZjVHMlNBTG9OMG1qR2xSMWpScDkyMjJMVlpU?=
 =?utf-8?B?aXhTeGt5eHpKWVBWdmNkTktySlB6NzFjclA0Qk0rYURscHJRdTI1NVd4VWVD?=
 =?utf-8?B?UlNmREJOOFB2WUlZclBhT2JxeFlmb0VrUnZjQkoxSUxsWnMxa0ZpbStYelBD?=
 =?utf-8?B?RExXRG5kbFF1djFjRzZ5TzlDOUt0K0FnenNNNEpwTVNYajNZVXdnWFdpeVN2?=
 =?utf-8?B?R0JURmFpZzlIbkNnZVBWKzZwNjNGLytabndnY0hwSVVwUUtZYWwwazk3WDUv?=
 =?utf-8?B?NTdGTDA2aTFXZUtHcEU2OCsxYUxxbk9XaEhOWC9sTGN1UElnL3NEWDIxVm5N?=
 =?utf-8?B?ZjQyamNBVnh5N2RNNmpsejM4N0h3RFlBK1B3KzFkVXNvdFJPNjlrYnBXQmJl?=
 =?utf-8?B?M3laOHkrOGx0QkMrc0JJekdXNWhWdHRLV2hISHJ5eW5WWUtJbHI1Z2xXVVVm?=
 =?utf-8?B?T2JBYXlOLzYraXoyZ1R6SDRWY1NxNkVvTElOaFZTQlYzM00zRWs0QzlnaUxP?=
 =?utf-8?B?SFVqZ21WbFJMWjBxOGxXS3BQc1FvWGVwcDJNSm9Qc1QxSGQ2dFpQNkd1eDdv?=
 =?utf-8?B?d0FuM2hidVMzUFI4WDIzNUpLUGJvMTQ2MzFuVzYxMURyMHl0UUJCMTVmRlZO?=
 =?utf-8?B?ekpzLzBnVEJPcklidjF2eVdZMHgxZHVZLzgyS3EyYzlHcjI5aXBBSEEzKzVO?=
 =?utf-8?B?eElJR3ZKRHJpZFVuZG5ZRnFwYVpQS3MxTWQzWCt4WWVuRDFVUTdkK2U1Y0pE?=
 =?utf-8?B?S21EM2FmYmYyaE8zUGUwdjloQ1JUUnhNQ2x4NmN2cmNTSzlhUDJnR3JwanNY?=
 =?utf-8?B?TUdjb0lhMGFKNE1LcFVMYnZoNkx1eUQ5YUtIdmIrM3h2aUtYbkFGeVV2cW5q?=
 =?utf-8?B?Mm9zM3ZISWlkYUw3UlhvUndqNTBuNXRIU0FDQkRoSWZKRFgyTitOcUIvSmVD?=
 =?utf-8?B?ZHl0bWdrVkp4MHM0RjI5MG43NmlIOUJuM3VyTjRWakh5S2huSlpsME9OM0ZB?=
 =?utf-8?B?c0RYNjk4KzV5RGJJT25ueDhLQmROQjlPVDFOMk1kRE9Pb2lZdFMxbExRTkhQ?=
 =?utf-8?Q?9xjgvWZDG2gZByMoOKU3bm3PCY7OfJa4KZ+9w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6362.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjBHR29qUy9wUE5zdGdwMlRrVUxXVEVKNkRBYUxEZ3BpQmZlVStleDVhYXhJ?=
 =?utf-8?B?QTBxaEc1VURlM3V4b1RvZjRZSWUyYzBIVHJpMmxzOG1CV3U1L2NYcjhnaytJ?=
 =?utf-8?B?aHM4UzVFWHNxK0hlRjRQZTJwYkg3NFFySEh6S0pPckF3MFJsSDhTSk8yL3dw?=
 =?utf-8?B?VVNXL3A2bS84bUQrTHV0ak5uRlNWVHlBdUZubWUrV1A2ZHhWZzl0aUNvaWZ2?=
 =?utf-8?B?djduNW1xQm1rOUV1cUQrd0g4T204WjZJK1R5TXE2cmE4QTBJQ1puSjNBejlE?=
 =?utf-8?B?UU5TQUorNzV2bW9IMkVmYXFLbDN4bTA1eDhBbWh4eENZbGRYVkM0Z3hmaUpz?=
 =?utf-8?B?TDNBcnF5TXVibEdab3RCTmh4NElxc2ZyWWozbTczOXNTalhPVndEc00rOU1t?=
 =?utf-8?B?V3VkT3BLdFF2d2l1U08wVk8xZSs1b05NQ05tM1MzOEQ0YmwwWlA4eHlHclZM?=
 =?utf-8?B?Z1hmZ2RVVjY1ZnF3cnloN3liQ01nVkdKbTFydXBHTkR0d3VXRHhZMS8zdUpG?=
 =?utf-8?B?OUlaVk8yMlZzcm85SXl1eEdjMzREKzBSelc3VEZJWHNYMHdDeDRsWkpYeXFm?=
 =?utf-8?B?dS83M0JlOHk5WURrcEFnYmNEL051UGNwUWlJYW9ZUVNDWG5ESXhoRUVnK092?=
 =?utf-8?B?elNublBUdVp0VG5rcU43cGpmVXQxaTBiNU0yZnpuc0l5TmxGNWFZcVp4Y0Iw?=
 =?utf-8?B?VVQ2OS9MbTZsYk1ZdjJrdHZwOC9lQzA3TDgzNWpKU3pFbndPWm5OQWhvNWww?=
 =?utf-8?B?OUZJVG5aa3F2Qk5BeDJkcEF2YW96eU1JWVJwekd1MVhFTHRNRXRPMWsrZmxI?=
 =?utf-8?B?bUlFc1RabmUwazlVL1ZVQ1kxMlhLd0IxL2syWmZ4UTlETTBlTGFEMjB2VmVs?=
 =?utf-8?B?Rk4yOGx1UkxVM3RyY29MamJTdUVNeVd0WVRMSnNvdUxLU0RpVXp3SmlzK3RM?=
 =?utf-8?B?SWpxV0x1TDIzRXdUdzVHTkkyQ1FSaFFnQ1VJSjV5TjA1ODVxUXpremlOWk9E?=
 =?utf-8?B?eXhSUWdVSm9jMlZNMWhmMDcwV1hPSEF1N2o3eFprODVkc0x6QndnZ2RUWVZn?=
 =?utf-8?B?UTRjWXZaTEsrTTRMQjljOUVIdHpXS0ZyNkhQOVQ2dkFEa2ZBOVVDNHVPV09o?=
 =?utf-8?B?eHZlcVBXeWxFaFlzbXN1TGttSXZpSEhBTHpyaXdRL1o0S3QwTGlIZXBuUDUv?=
 =?utf-8?B?SDZSMlRTdEtNaDFMa1ZoalZKNnJiang2Unh3bUJadzlBRGtQVGxOSkFLY3Y1?=
 =?utf-8?B?UG1kVEJTakdubVpZMXk5cmRpME51MWd3cDduZVl6UkVyU0RhVEN3UWdqbnNR?=
 =?utf-8?B?K3BHZ2VIM25qUldjRTc5VVkrcTYrZTQyaCs1Nm1sSlp1ajQ5ajZtb2NBdUpQ?=
 =?utf-8?B?Uzh1cFZzWGJGbmRGWUxFcUFlVll5TXh4aEtBOUM0bHdORGg3OG1zOE8zZmwz?=
 =?utf-8?B?MWVCT1h5S1FiNW04UThpRFdhS3hwU3hwVmxSQ0ZmVUM2ZXZsUFhLNjFianJ5?=
 =?utf-8?B?UDM2eEduYml1eHZlVzVubEZmckNCYmJ2WjNkYmxwM3JDZ2JTSmxmMEJ4MlhI?=
 =?utf-8?B?SDlkZmJvSFZiNVZQODViSks4dDdqTzlDc0RiUWJpS2VyN2xkTlJQd1MxMHhT?=
 =?utf-8?B?RXVoZGZUay8waWVzWHVVRWtkSHRnZkt3aGtYLytSYUtSVlhMNlA4dVlTOFBq?=
 =?utf-8?B?VUNyMm4waU1tS2t1QlB3YjNUTnYzMnRIWkFwQVZwTW5neGZTaWMzelVlUDBj?=
 =?utf-8?B?N29ET2UwOGorOGtGYUJuVnZ0SFg3NkRDNFN6SDFXa1YvSUZ2bUY4WWpoYjBS?=
 =?utf-8?B?azYzZXByU1hXU2VwQVA4Ty9QeVhoS3c1eHUvZWpqdmRZZkc3STl6NHdkdzlJ?=
 =?utf-8?B?VktlSkpadGJMVVc0c2ljRTdBSVJTTEVlZWFqUTR2OVIzRlNwSlBQaXp4SFNW?=
 =?utf-8?B?c0VkWUh6c2FjdnErYndQZjNVSENRYUR5cVEybko5QXFHMHJ0eSt2WXVkR0hU?=
 =?utf-8?B?eVJjNkRZOFlpUEx5bzh3dTNwWDZGZUNnaUFYdElSVlE2aTJjdjI1ZjlwcHFw?=
 =?utf-8?B?d1ZXblA1Ly9GRzg1Yk42Qlh6b0pGL0hLUGkvMUE0UXJIR01vZGVQSk51V3NO?=
 =?utf-8?Q?d4y5wgaMBYSFspJAQCTXRY2wk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6362.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7d4f78-f301-4e61-b550-08dcee3368ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2024 22:39:34.6383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: asNqUrrpdVzuux0Bn1x0Sub5nFVadmp4rrp/rDwex4YUJJflVbcBGV3WQFXpufC2EjIv9QFkMLIGBDHOhaEhlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4740
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

PiBPbiBXZWQsIDIwMjQtMTAtMTYgYXQgMTE6NTcgLTA3MDAsIGZlaS55YW5nQGludGVsLmNvbSB3
cm90ZToNCj4+IEZyb206IEZlaSBZYW5nIDxmZWkueWFuZ0BpbnRlbC5jb20+DQo+Pg0KPj4gVGhl
IGxpdGUgcmVzdG9yZSBpcyBhIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50IGZlYXR1cmUgd2hpY2gg
YXZvaWRzDQo+PiB1bm5lY2Vzc2FyeSBmdWxsIGNvbnRleHQgc2F2ZSBhbmQgcmVzdG9yZSBpZiB0
aGUgdGFzayBiZWVuIHN3aXRjaGVkIGluDQo+PiBpcyB0aGUgc2FtZSBhcyB0aGUgb25lIGJlZW4g
c3dpdGNoZWQgb3V0LiBUaGlzIGlzIHN1cHBvc2VkIHRvIGJlDQo+PiBlbmFibGVkIGJ5IGRlZmF1
bHQuDQo+DQo+IGluIHRoZSBzYW1lIHdoYXQ/IGVuZ2luZT8NCj4gcGxlYXNlIGFwcGVuZCB0aGF0
IHRvIGNvbW1pdCBtZXNzYWdlLg0KDQpTb3JyeSwgbm90IHN1cmUgd2hhdCBleGFjdGx5IHlvdSBh
cmUgbG9va2luZyBmb3IsIGJ1dCBhbnl3YXkgSSBzZW50IHRoZQ0KcGF0Y2ggYWdhaW4gd2l0aCB1
cGRhdGVkIGNvbW1pdCBtZXNzYWdlLCBob3BlIHRoYXQgd291bGQgYmUgYSBiaXQgbW9yZQ0KY2xl
YXIuDQoNCi1GZWkNCg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEZlaSBZYW5nIDxmZWkueWFuZ0Bp
bnRlbC5jb20+DQo+PiBDYzogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNv
bT4NCj4+IC0tLQ0KPj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYyAgICAgIHwgMiArLQ0K
Pj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZndpZi5oIHwgMSArDQo+PiAgMiBmaWxlcyBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Yy5jDQo+PiBpbmRleCA4NTcwYjEyMTgyODcuLmZlZDMwZjI4NzJmNyAxMDA2NDQNCj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Yy5jDQo+PiBAQCAtNzAsNyArNzAsNyBAQCBzdGF0aWMgdTMyIGd1Y19jdGxfZGVidWdf
ZmxhZ3Moc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPj4NCj4+ICBzdGF0aWMgdTMyIGd1Y19jdGxfZmVh
dHVyZV9mbGFncyhzdHJ1Y3QgeGVfZ3VjICpndWMpICB7DQo+PiAtICAgIHUzMiBmbGFncyA9IDA7
DQo+PiArICAgIHUzMiBmbGFncyA9IEdVQ19DVExfRU5BQkxFX0xJVEVfUkVTVE9SRTsNCj4+DQo+
PiAgICAgIGlmICghZ3VjX3RvX3hlKGd1YyktPmluZm8uc2tpcF9ndWNfcGMpDQo+PiAgICAgICAg
ICAgICAgZmxhZ3MgfD0gR1VDX0NUTF9FTkFCTEVfU0xQQzsNCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Z3aWYuaA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjX2Z3aWYuaA0KPj4gaW5kZXggMDFlM2FiNTkwYzNhLi4wOGZmZTU5ZjIyZmEgMTAwNjQ0DQo+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Z3aWYuaA0KPj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d1Y19md2lmLmgNCj4+IEBAIC0xMDUsNiArMTA1LDcgQEAgc3RydWN0
IGd1Y191cGRhdGVfZXhlY19xdWV1ZV9wb2xpY3kgew0KPj4NCj4+ICAjZGVmaW5lIEdVQ19DVExf
RkVBVFVSRSAgICAgICAgICAgICAgICAgICAgIDINCj4+ICAjZGVmaW5lICAgR1VDX0NUTF9FTkFC
TEVfU0xQQyAgICAgICAgICAgICAgIEJJVCgyKQ0KPj4gKyNkZWZpbmUgICBHVUNfQ1RMX0VOQUJM
RV9MSVRFX1JFU1RPUkUgICAgICAgQklUKDQpDQo+PiAgI2RlZmluZSAgIEdVQ19DVExfRElTQUJM
RV9TQ0hFRFVMRVIgQklUKDE0KQ0KPj4NCj4+ICAjZGVmaW5lIEdVQ19DVExfREVCVUcgICAgICAg
ICAgICAgICAgICAgICAgIDMNCg==
