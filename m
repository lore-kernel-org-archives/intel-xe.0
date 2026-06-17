Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1967DCD98E1
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 05:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C918910E93D;
	Wed, 17 Jun 2026 05:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJxEBMsf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEB310E93D
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 05:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781675942; x=1813211942;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=htm26EsRYZjZg6pe7fwNMQ1lGtkz1YP34aSLG8PnTbU=;
 b=OJxEBMsfWnMk7k77WklR3r2C2dw3n8nAqt861EGDwQ/O/9Zi3CUEzBg9
 /V7b4BWionIMlguEqbEJw5+rpk8yDcH9YuEbSVURdlMLnQop8gOFoXoOO
 NAgsFOBOPiaUBsk1gZt4gDgcVoc5W+/LNYwsCXpSKXpf6ZjJFlx6FMnH2
 YdbJBpWsL48ihNHQP+oV17EdanbGppI+bc0UCeDz4u3eHLRdtLr8FJfpU
 Z0JEPGAo1ruZ+/OnJ7Qx+KtK+Gv9++sG9w/dNisZCrC+gzcw2lvfVTT95
 d6yVkSiuejnwE1zW7cJTQuBiKC65LANMHAiWT9UsQGcr5LEbz56P2N0NL g==;
X-CSE-ConnectionGUID: cnPhdYn9QLi4Mt7doCHVjA==
X-CSE-MsgGUID: vzbQYE37SGCaEjqmiaRsJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="69993778"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="69993778"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 22:58:59 -0700
X-CSE-ConnectionGUID: CUuTBv6WQGeYXMOjCx3skg==
X-CSE-MsgGUID: rQPAH+LGRb2ZzHKiaFswpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="246838510"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 22:59:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 22:58:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 22:58:58 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 22:58:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4urahgFCA+r7LbCZzNIxlABs74qWHEV3zuq+2rtzRD4rZuwOGOHKgAOkf8Rd4GBtkIIxXXfkUudpur5zaqqhe52U7fpcuqFZGKhfQyEpTO/DvY8pLcBG2WEMJndlKtwvef8V+l0R0+GNWr6CzbY5gg31TIcC98HNcH9EAEy9AY35JA9CAx9Z8S6SqjlVs34XnmkEcQ1FLjLL/8nLhgvAQR8JBtTsHukhsEkF2oMxxJ0R8flCtWnNQZ7r98Newr2Ae3GQAy28OUFHfag47dxdXYry5dfGLIWFA5V0Ih1of6mZiQkR7RdUTog1tUNJliRbcKYErL+R5gUci6GV+cIAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VI3bwQhuUxcjU/K8y3wqmfYWQFDUXxA1Rw5f413gijA=;
 b=Ls1oPs3JsUfMUB2B17aLR2okcJJT2kYXdraGtaRvwYMIA0NBapgT95PxquNCTviVESXFhm+u0oaPXJe8Ofj20sKyPGE5heJmbfbng97r1lbtBFokIWVR5WTboXWui6bvaGviN+KKk8gOBDjObmtyCOQWKLaSRJoIrjUpr2eTS+90Gzt8IYMkC+6kBriXOJOKYrYOI9r+QT7MU2MlxTLDRepZz2pB0a6pHPSws19hPin8DfItBltgynRw91msI6liGTMu8at6DgcxgDqMDYcyXo2N5tbDAx4/GVD2Y4uXmkXTW2XxSLD3rle6Es0jQ+hlBDuivE5YbWGc81hSnBUjmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB6566.namprd11.prod.outlook.com (2603:10b6:806:251::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Wed, 17 Jun 2026 05:58:56 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 05:58:56 +0000
Message-ID: <578dc1ba-88d6-4ef1-9912-d58f49fcced2@intel.com>
Date: Wed, 17 Jun 2026 11:28:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/10] drm/xe: Improve wedged state management
To: Raag Jadav <raag.jadav@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukasz.laguna@intel.com>, <zhanjun.dong@intel.com>, 
 <lukas@wunner.de>, <daniele.ceraolospurio@intel.com>,
 <badal.nilawar@intel.com>
References: <20260603101814.916948-1-raag.jadav@intel.com>
 <20260603101814.916948-9-raag.jadav@intel.com> <aiAIcAihJhDwOj5e@intel.com>
 <9da04b52-c43e-4afd-9d1b-8248034f58ab@intel.com>
 <aiE52oh3F-5OOqLh@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <aiE52oh3F-5OOqLh@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: af6ecd3e-5dd3-4ede-3998-08decc3584a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: TpmDaYY9toHPMC3pT6somH5zB5orC4M4fSh4d8twl59DUZmfz+n1h2DpHw7EY6qw2vpnw9DgmfdfAtWFsJC2dQB0IsZ5F5iaqHV0k1SZLYPxCbRRuY3AoaX86sMfwu6dY+uU8tVjX+QluMu+LY/9oiOqq6ET42vq6W9Djcf08gDVy/Z4IJutp7xscKhzcd5nf6LKq/kagQOFwW0xG7YIjKdbUFb3mNEDlwbAx8maqiRiIk1AWggsJHd77sj5+AAgTnk3KQonQtqGGDIzRQazG5PSYwHG2VDh3peyuoYcfPZogeVGwUGuUpiXYf+tj4J4WNjhqxAsgdqiAufklX8y9CrP3QTmyqkOYk2ziO2Mf705aC+Z5n8qaAzxNBR7Bt0RdcGFJhErG+laoqwfUoREJcG/1fQ68s5K3iePcy9mErJbb/beRliW0G+4oYN1WO1FGYXDzpA2jxF497rP8RYAWmKMSp7BEhadWzK4Cn3gYxzLPeKL566Cey6/iVP2QMaJwKIf1YXdM0Cs/PpYJy8L3iJaJalW6kc+lbiw6cTOPiZe+r3OK93RyPTUNrGcpdwlZOHr5Z5RAiMDgW0H8f9kJDIaUK33CKoCM3wm8S8WIZcWmiIt4oGCYMF9fIKoUVyyFwh7ot2F/luTupMUQrX66ONTMNmfo5RHuJzknb/1M6UCjwtmGBHEgo6yKqSzV+qN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXFMMm9mMnJQamdPeVlhV25vYWFYS29zNFlvZWdieWtXY0pJWkptMUw5RWNV?=
 =?utf-8?B?QWhYVHNuUU1xa1ppSk9WeGJqYWhnQ0VYV1RUUHFKS054STVaSmJIazhpcGRs?=
 =?utf-8?B?R3V3WUk2d0JKT2M4ZmhXT294dXhINGNlMnlkWTBGWlFEbDRzenU5UFV5VDIr?=
 =?utf-8?B?Q1VJdzF5RlhPM2pkbDQwM0NPRHBxSlkwd3JYL3Bnb0x5MVpkMzZsZWFLUDBS?=
 =?utf-8?B?SzBGNTgzNHRwYXBlaTFtRXgxdXlMak45SzBOZmd5N2hNbml6czRaS0pUMG1L?=
 =?utf-8?B?QXRKSjUwTDFBQmZ2SHk1YytQS3ovdXByYUZxclF3RC9XMEtHMVhpUGdURWdP?=
 =?utf-8?B?cGhGbjdnUWdCTzN4V0FqaGJLdllSNjc4MVcySzQwaUxkTHZ2Mk5HZ0t0QS9Q?=
 =?utf-8?B?T09IRks3TFhleEFiMUJ6N2psS1gySEtOVk1jUHBCVFRRT0JyNkpXM3RCeHBj?=
 =?utf-8?B?WFhHNVFUV2EwY1Y2TnRGVExTZFpWeDZ6UjVSelIrOWZ5bWRoZVJkSU5tQURx?=
 =?utf-8?B?dHhxVjc5NllVVU9JY1phbHdvRHZMZ25DOGltbkkzTHE2SEZGV0ZKQ0tmWll6?=
 =?utf-8?B?c0NnOXBIQUtqNnJHRUcvM21OU043ZnFodEl0dlRZT1p1NFFOekt6d3FreUgy?=
 =?utf-8?B?SmNNbUhXTXhGdE92U1luSmtpY3FNS0drOG9iQWloSHUyQ08ybDFQZ0toYnd5?=
 =?utf-8?B?TXVmaDZKVUlOUW04NHB5aGdNUkdObVlmVWhMRmRDL0t1SjhTYTJxT3dubkNJ?=
 =?utf-8?B?VW5BMnpxRlFMR09JUFRJcHg4WWtXOHAvK1ZyN2ZEc3ZWVG8wQXVXdG1KREtm?=
 =?utf-8?B?OUpoSjE4MWxyZU5tMjZlQzh6T3h3OVNIYmg3cCszd29JOUUrYTBWTXB6KzIv?=
 =?utf-8?B?cERWZ05MY2pKbk14RDNJR1puYW5HcFBqQXhTTUFFUElYVFltaGJBaHRlM295?=
 =?utf-8?B?T1FNMjZSWHU4VE9xQ2l6SURzR25mVzRtdEFRNDZGa2VhREYwV3ZHN0s4Qy9m?=
 =?utf-8?B?Z3VjVmZqbjNPeXBCT0J1OHhUNHhLb2lsZUI5WVY0T05uckd1K3Rvc3craXBs?=
 =?utf-8?B?WlEvc1JlZnNJZUcxbDNCa29JdmxzK1ZqMlB1c1BoV0IvQVVPd3gva04wR2Z1?=
 =?utf-8?B?VGxoQnpzVTdFWHQvbnBlRXdlUjRQSTFwZ21QTklPZ0QzVXJtTzFpNmp4U01H?=
 =?utf-8?B?TEZjOEpUd2JUWGw1c3lGcWRKRHlyUXBtVThpMmwvVFg1YjJsSThHY2dBK3F0?=
 =?utf-8?B?eXd2QjNGUTBlenZvQVJuSjhkZ0gzMSsrTDV3SjhyWDFWZDRXSi9wd0haVmRs?=
 =?utf-8?B?Qnk1Sk8vaUZJTHpvditrYUhWUHRHODI0NDRNTDhYazhOUUliOEFXNi9hTktJ?=
 =?utf-8?B?MUxmaGJWUExyN1hrc05vTlNvTkx5UTFLWnJ0YmFvRGFBMGc1eVNPRFZDK3o4?=
 =?utf-8?B?bVpzV1VsTE40R1FVN3J5clRvWXpJYjNKS2NVQW11Vnp2aGVhcGhCeSswTnJ6?=
 =?utf-8?B?UklXNVZjUk04NlpLSG9RRlQvaFhsN1NSU0Y4S1Zwd2dBR3RLVkp2T1lnY3E0?=
 =?utf-8?B?UG1TZlBYQ0hQM3hDT1RPYmlpZDNkTmxSdzU1M0xxZlo1RWpISkJIZ3dlM0ln?=
 =?utf-8?B?K1VYT3Z5dVJmNURkZEdNb1VIM1c3aytOZUdzOGE5SXBoU1ZiYm00R3JtV3Az?=
 =?utf-8?B?dzdNcW8vR3dYTXRZWERURU1oVUlVL1czMy8reDUvZldqQTYxUGprN2N5ejFn?=
 =?utf-8?B?YkNXZHp1UXllbEVtR3poaW45cm82a2FkYkV1NmJuWXhTbG9FTE1HaWtJRjJ2?=
 =?utf-8?B?T05FQXNvRzlsM3dyZDhsWk9wdlE3cHlIeUYxejNJTVh4TU5WQkwrdzljcnY5?=
 =?utf-8?B?Y3MvNHhTNGMvUUJ0cXZUeVdYVE1ZR0hHQ010eGUyd21ZL0h1VWZmak1RSmJT?=
 =?utf-8?B?RHlrYzFTbkRyRUlIRWVuTU5vYUgwSmJDSjJBK1VFNGNZdDdnT0xWcmlJYXRx?=
 =?utf-8?B?MDdTVmRTY1IxZnovc0RpQkhSVTV1UmlJTFpUTlUzME56SkxPS3d4NldHUk0w?=
 =?utf-8?B?aVppUjE1a0FTeEFwbmEwUSt0QzlLQWJYR2N3NjIwU1FuRytkdHB0V05iZzVZ?=
 =?utf-8?B?dVdxa2tGcGlpMDBBN1oyVzlxekJ5TnRCVEdER0docFU5dkk0SVpxZ2szWGZH?=
 =?utf-8?B?UFIxNkJVSDIrZXh5RFYrTGw1VmdLbUpiVjRKcG5paWFEVkFQblZ3UDllMTVM?=
 =?utf-8?B?QUpIY0tRYjNWRUZ2SkhpZkhMUWJMSkJaVWMweXlNVG5RRFhKUVZIS2UwM1Qz?=
 =?utf-8?B?MzNZVXRmbEZxa01CM1J3M1ZwSGVXak4zSkNVd29jd0F3ZEVmVVpkUT09?=
X-Exchange-RoutingPolicyChecked: mAMm89zaaql9C+OIyT1fLob27z69xePT+6vJSJMUjcsgt39cGtYYMBgWuco2h64bARlbop1c/qtP+wvCSa50NZREKHq1e0Kit6HXx5lEaZ0k1qbqbe4dWMzMPHQkrPk/i5SscCGsXBV74n5Pi8f0cJN54vx0KJnvrftSC6xSvq9buYm9j1AzfhY5NgsZoXuwqcX/E8E6qsJXvNzbmF+dV4Syi5GWvhbwnn3ezA/1C0gniYk/3fAs7TeqXaH59dbHTB0xC1UCNKGDowF8pjP/u6lbiMzedVhCg8lWA6Eve5UPPr/LEw5Sd8oHemREARPKeYSOjtMwg8gOiIboaQ7sBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: af6ecd3e-5dd3-4ede-3998-08decc3584a0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 05:58:56.4931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+0ePGzpKgFvEvwCoJarMMuQ8OP2NOcGDQDhQPOHoPJRmXL0FMPUEKIZisJNpQgfw0p/YjF6jVFD3EUttJc9wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6566
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


On 04-06-2026 14:09, Raag Jadav wrote:
> On Thu, Jun 04, 2026 at 12:22:35PM +0530, Tauro, Riana wrote:
>> On 6/3/2026 4:26 PM, Rodrigo Vivi wrote:
>>> On Wed, Jun 03, 2026 at 03:47:08PM +0530, Raag Jadav wrote:
>>>> Currently, wedged state is serving a single usecase where the device is
>>>> declared wedged, but this doesn't allow any wedged state management for
>>>> runtime usecases. In preparation of usecases which requires to facilitate
>>>> temporary device wedging, convert wedged.flag to wedged.ref which serves
>>>> as a driver internal refcount and blocks critical path execution during
>>>> device lifetime and while at it, introduce wedged.fini and use it as a
>>>> cleanup indicator during driver unwind which operates independent of the
>>>> refcount.
>>>>
>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_device.c       |  5 +++--
>>>>    drivers/gpu/drm/xe/xe_device.h       | 12 +++++++++++-
>>>>    drivers/gpu/drm/xe/xe_device_types.h |  6 ++++--
>>>>    3 files changed, 18 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>> index 9e0cbad8adb0..d77f8f054a1a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> @@ -917,7 +917,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>>>>    {
>>>>    	struct xe_device *xe = arg;
>>>> -	if (atomic_read(&xe->wedged.flag))
>>>> +	if (atomic_read(&xe->wedged.fini))
>>>>    		xe_pm_runtime_put(xe);
>>>>    }
>>>> @@ -1413,7 +1413,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>>>    		return;
>>>>    	}
>>>> -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>>>> +	if (!atomic_xchg(&xe->wedged.fini, 1)) {
>> Just curious. Why do we need runtime pm reference held throughout till the
>> end of driver unload?
>> Even if this is needed why not associate releasing runtime pm wakeref with
>> the flr_on_fini flag.
> I guess flr_on_fini has multiple setters and it's not always clear how many.
>
>> I was facing a similar issue for uncorrectable series and i was thinking of
>> releasing runtime
>> pm wakeref based on flr_fini.
> Sure but I'm not touching any existing behaviour in this series. Probably
> worth exploring as a follow up.
>
> Raag
>
>>>> +		xe_device_wedged_get(xe);
>>>>    		xe->needs_flr_on_fini = true;
>>>>    		xe_pm_runtime_get_noresume(xe);
>>>>    		drm_err(&xe->drm,
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>>>> index d61fdb362f91..14677729aa24 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>>> @@ -194,9 +194,19 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
>>>>    void xe_device_td_flush(struct xe_device *xe);
>>>>    void xe_device_l2_flush(struct xe_device *xe);
>>>> +static inline void xe_device_wedged_get(struct xe_device *xe)
>>>> +{
>>>> +	atomic_inc(&xe->wedged.ref);
>>>> +}
>>>> +
>>>> +static inline void xe_device_wedged_put(struct xe_device *xe)
>>>> +{
>>>> +	atomic_dec(&xe->wedged.ref);

Can you please add a WARN_ON here if reference underflows.
Since this is already reviewed can this patch be sent separately?

Thank you
Riana

>>>> +}
>>>> +
>>>>    static inline bool xe_device_wedged(struct xe_device *xe)
>>>>    {
>>>> -	return atomic_read(&xe->wedged.flag);
>>>> +	return atomic_read(&xe->wedged.ref);
>>>>    }
>>>>    void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>> index 32dd2ffbc796..66e673e4e3e7 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>> @@ -485,8 +485,10 @@ struct xe_device {
>>>>    	/** @wedged: Struct to control Wedged States and mode */
>>>>    	struct {
>>>> -		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
>>>> -		atomic_t flag;
>>>> +		/** @wedged.fini: Needs cleanup on fini */
>>>> +		atomic_t fini;
>>> to me it is easier to see this as a 'permanent' flag than
>>> a flag to 'clean' on 'fini'.
>>>
>>> but up to you...
>>>
>>> either way:
>>>
>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>
>>>> +		/** @wedged.ref: Refcount for wedged device, blocks critical path execution */
>>>> +		atomic_t ref;
>>>>    		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
>>>>    		enum xe_wedged_mode mode;
>>>>    		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
>>>> -- 
>>>> 2.43.0
>>>>
