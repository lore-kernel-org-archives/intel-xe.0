Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CC2C531F7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5FB10F15B;
	Thu, 23 Jul 2026 16:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ELYk7Iby";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6637E10E5C6;
 Thu, 23 Jul 2026 16:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784823563; x=1816359563;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sGYsZp2vgIkEmnf4Vx0MpxZd5ASMp7aPOCAlEutpq14=;
 b=ELYk7IbysK7rd+NDv+xjY9UJXMx69CVMkzLY1zsyLS/csFc5vwP9K4hr
 L0B9oZkJEmEYb8LPUU+o6snkekKlyq3NZChojEdENKn2OReO2Qlvv/6WW
 RS0m+i2P/nzA4zSqwsBvuHyaRgz49H3Ej5D9ZBkHxhO2RgwM6G1C7B+in
 cht29e1oTP5BMGdyubAPsLreTSNzrkeYuyYQtX4APnjHNwPeyhK6MYcIt
 8vofLgv3LGCVqS6lcP9IlLxo7G73XpQpBuYzsG50r7wAKl/sB4Zp6xJYr
 WV63rt6xAteQyqcqQ4wjKzc2ePFRvU1Zh7cKTfoZJKvYlxIwv8PZb0rqB g==;
X-CSE-ConnectionGUID: bs5QyGe/RviYPpgBppUXKw==
X-CSE-MsgGUID: GyYhzDPTS8iw5Z7ojmigEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96144505"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="96144505"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:19:23 -0700
X-CSE-ConnectionGUID: fTSZlHktTx+T2k39oA4SsQ==
X-CSE-MsgGUID: cVt6nbjXQWOEEVbzYgLVLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="263425897"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:19:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:19:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 09:19:22 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.49)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:19:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+TzjcT8CzgcTNq1M6FCcYT2T36Nkg71PZfokrEAQBRIowe8U4nL1uQ9oBkkOf2KkHnogboshUPzg7oPugr2z5kLY6ycu8DwjFTP40RB3X1OT9jljGTXXC5KJJOatURo7mcO9qEsC17FcNVMhUFBa04iNXTE7RBeckvgR3elnZC11QgHl33dLyNE/Inn+jI7OEgrZ6rGEWh7BdySkJW5X0xuqbF0NlmC2Vp2N2rZNl4iLFHRzlWA8VEwPCjGIAnZ/2fd9RMtxYN8ZXLk3Y8PP6ip7shs4iUS5sXG6Nab5Mo1wT1IGnyor2BmwruMTCIAq3HYjpz3lt48r/BIIiXjFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRgR8g7eAciFUI8jxptH2AfaRR8m9fo06YrB9eVLMl8=;
 b=KHc+dT4okcEF8J56Lm+U2rjYrLKPgN/qcSbUNZ5qGE6QhNy86K6atuE5kDUTnGRNFC6CRSmG642SwXi7bR93Ao1sOgLeR2YjkjgJZAr1yvVSmUAA0ULWNXdLg193qTqJDQ+7bklArRFXGY/iLB22VHH4mImFkUq5A4KtqAVGyM7sVzEAl1UgAlEdrhHgU8KRQDZ9R0lXlb3Y0+2eiGwycioUz/anG/SO6uz/p3Br7tDdbFaAq33js/CyNWsKxIWAlA4zJWm7QdmMdBIvcU0pAuKR3Kl86iR1YV4oaOnul9zn2ZQkCppNBOi02FMH+Y8zkxTaQHmw98IUz5fxtaUZLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by PH7PR11MB7642.namprd11.prod.outlook.com (2603:10b6:510:27d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 16:19:19 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:19:19 +0000
Message-ID: <1dfc5773-4a13-4f59-b89b-0e1667a1171c@intel.com>
Date: Thu, 23 Jul 2026 21:49:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] drm/i915/vrr: Compute CMRR fractional timings
 generically
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>
References: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260722043923.3241977-7-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260722043923.3241977-7-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::17) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|PH7PR11MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: b21d9d61-463d-4780-2c66-08dee8d62603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|4143699003|3023799007|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: X03adZVmg5iZMYzdZxqmNXFDJFHGbEe4HMlVY94uaSTjUBPjKQF9GuxdW5BpXYsSKvrULeRV6dkifXu7sXmZlVpVrTDJkLp31GW822lKswiuU0dIXdNVGJKaK8jihHs5TLx+mpEAT9KXj9jwMOPw2w0nKqozypCo34Lri0mu5OnagJ9cUdHzBkYG6yP3fmuKavFbX2PprSmGf7fgf7vDRtryFWHu2H7g/axExeA32oGMkuiG7fM0Kpn9BriNB9LF9SVn4sWKxKbH1B0ms5IxCbp7aZnsZFBeFXsoV+CzoRKoh1aR35uhgWN+oQpGg/rtnB1kjqVh0OBitil4/8v7sqjgzdnC+W2B5DFs3Ws9vFL289BLB1IREGmqLmWs9NvOttUuml2rR5ocD+RP0tgL6P1KHwS7a8g7B0ySII0E7u8syg7sBzPBJRMy8N5mpojQXm1hudPUKHibIt93UhyIvo6TT4riSf6RIU1YYXmX7DU2Jdkmha+th8aDrx+ijTX0rYr8cXin7hQM4BNElFKFQRL9ptm4sz8sUZo5q/bBZeezhrEbsgdh7T/USRUXYrH2Bo7vB0poTP4xPq02NAquPQp0fntPdt2ekIOXkP2XbAE+OF2Nx2uRNJmDFqIkn26Vl7j0DAq3eMRpcz4C3yDBaIdpIvOXnKtMtm+QdxksucU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(4143699003)(3023799007)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1N4UDV5SUNOUXFRNUl4dU9EVXlTR3h0NXdxZTZjSDZkUFd1dkhjN1Q3VG1E?=
 =?utf-8?B?ZmFMQkY3V1pXc1QwMUJ5Vkt3RTM2NWYwVVZQV2YzYXBtWnZ6QW9tcXNVNFJ6?=
 =?utf-8?B?blBKeEFmakVzVEpJdXpRc2QyYVdnSjNaN0Z6OG81L0g2ZTJBL0VETSswZGlr?=
 =?utf-8?B?WlJBRXB3aWU4S2dLRnhrNnRJQTFuVzBWTXljN2hrbnQyWFQvNE9KTHZrQWFj?=
 =?utf-8?B?Z0E2MGVPRzBxU1ZRVDBLL3NydjhGOTgzN3JtSUFKbUl0UTVNU0VldTY5d2Rq?=
 =?utf-8?B?QzVIY0xMQ0g4dllPaGh0MHF3SjNJMTZqNlI1b0NMdHMvdW1lQnlhbm1JSDVG?=
 =?utf-8?B?UEkyVS9LMmZFSGhVbERRYzlaZk14KzNmanFOdGhXcHMrbUtDQkxabDg1b01E?=
 =?utf-8?B?UjdjNFozOXRzT0JDOXFPanJmZFZCY3VhbzFOa2thZ3R2cnRZYnZPNVZxeE9F?=
 =?utf-8?B?U0dYU1lNcTdGSWozTmlJUHVZRGVnQ1JLUXE1M0Vxc01WenpIUS90UW9hTzd5?=
 =?utf-8?B?bjBSVmpQTnR0UzBLcU9UOWtCS0ttaHBYOEFFSnJYaFl6WTJ5M211MS9ONzkv?=
 =?utf-8?B?M0ZaWmVCUFd1Qk1lUDVkeE5PTnY5dmhSRC9GWW1LVCtyZ0tKSklnNEVCZjlq?=
 =?utf-8?B?WnpSNjY5VTUzTmY5MVQ5VFhzVGdReFpnQlZDNDFwd0NwQ3pjQ1h0TnlaNmNP?=
 =?utf-8?B?NkUzbGNQWU9SNVA0UmluRDF4ZFluanNTZEVmYVVKemFTVC9DQzB2bFlkbFcr?=
 =?utf-8?B?OEM3MEhQTWVEOGhtYVhacFl4OG5ueVNKSWVUbXQ2THVOTU9DQzlGNENacy9N?=
 =?utf-8?B?c05wcHQrS0oybWJjajZjYW1Zd24vbjVJS3JMRkd3UHBGZjZ3WG1xVFRaeUxH?=
 =?utf-8?B?WmVrd05JMlMybnl3YmJJbHEzRDQxd0RRY2dWWVowNlVPaUlIS09ta0gvUytO?=
 =?utf-8?B?V1d4ZzEyZkZlQVlha1BhWnI5cTFQZERBbGFQVElZdTZvZ1pYM09XdTlBTDUx?=
 =?utf-8?B?WGxXa2VCOE9YUXBYU0NNQXZFblA1RS9zUk13K2VkV0wyMkFhQ0lyVGM4dUhq?=
 =?utf-8?B?cXY3d3VLTDErb25oZVhJd2hRSWlwYzNuZkJTWmVVR3d4bzJTMS9TdG80eW51?=
 =?utf-8?B?K1cyL3lKakc4dWI3bm04WjBmWUVsWnE4bW9VM2FMdzdqMEVzTFd2eHIraldz?=
 =?utf-8?B?ckNwWE52V3R4MWU4T0s4MnBYYm1CZXo1dU5leFBQZkhsVGV0eEFrTkxBOW9y?=
 =?utf-8?B?VUNFTnZ1LzB6aTVtMC94MldmbDlPQ0JsREJEclpFVnZnREtYT1loZ2RMNWhp?=
 =?utf-8?B?dThwcnJoVGswaG4wM3Q1WXJyb3lESHFEaVNJMDNCRHA4TXFSZGdFc3RVM01j?=
 =?utf-8?B?L005OU1FSHFxcDlQSWhNU05YeUxDc1NLODBqNFROOGRFeTMxSzVoR1d5dGZD?=
 =?utf-8?B?eGZDTVN6czlPNHBiMm8yaWxjTG81N244S0o1RUlNQnJOcEdTekJSNElodUE0?=
 =?utf-8?B?TXdBOUhPckxqK1Z1NW9KUDJORmR5NlhxZHRmSzdWNUhwdE5MN001M0NkM3Iv?=
 =?utf-8?B?amprRmhVTVBBcEp3SVRpNkJscFRDemdxQnN3dUk2Z2ZsLzFrbnlHUktEMStF?=
 =?utf-8?B?YmxOOWNyM0Y5aUxDWHVIUkhpVjUvNlVGbDZRQXdiSnhwaFAxNkpnZHozeGl4?=
 =?utf-8?B?OXlHbFNwSkc3VFdJbERHdjduc3h0TnViRE9DMFM4MU9ROW9lcUhkcGFEZDJH?=
 =?utf-8?B?SitnTXhyVjVROWJHWFpGWnl3OUNyU2NFdDc2bmwra2ZQdkJQWkdIZUkzL1Bk?=
 =?utf-8?B?d1FtbTlybk1rN25oTy9sWnJ1djJldjM4dXZnQ0RiYm1zMkpXTXNIeEs4K2l4?=
 =?utf-8?B?TnhmaG5ZbGVjUVhMdTI2WkZwUnRrNy9lR0pLV2VhNTMyMTg5RURBRVdqZDU4?=
 =?utf-8?B?Nk5jaHhlMFhaQlJrSTdPRWxxdUw4QklOa0ZaWWJseDMzcnJUOGdwdU9jc0JE?=
 =?utf-8?B?ZFM4NUlzajdPQzc0S0hBeTIrUThNeGhiYWozdGxaaXRXclBwYnBKZ0ZXcllM?=
 =?utf-8?B?L0VTeVI3MW9adE56cGk5V1NvQVc3cm9BNUVIdC81T3E0VXBvZkFZZ1p3V0JH?=
 =?utf-8?B?UHk1WXpwZlJ6dmJORjhxTjZpRGxTbDlsOVNzbjVUWFNaek5KajloZVBtYjc3?=
 =?utf-8?B?ZHlJNkRwaHAzek83cW1LYWlSTkc4cnlQNklUU1I4ZnJ5MnA1cTRXVHdRWWRn?=
 =?utf-8?B?VkRoZUZXNzU2Ri84TDVFU1VjOTdvSzZKRWJzYURWT1psTGFLVTkyUFBObDc1?=
 =?utf-8?B?aW1tTzFveWl2QjZrNFJhMm0vMTVlMUtOdC84cUxBdko4aStaVEhkM3lNa0s0?=
 =?utf-8?Q?mjtpl33I6bqaSjII=3D?=
X-Exchange-RoutingPolicyChecked: Qf53/1NzMUbFs/u0b6QdxZvNbGv5QlTZlXupELj1u+l7rlJuqjZDyGwQwWQZi+X19AejgDbzr5StxX5urBfACEKf1fH8r/pq1txBnreAKjvXIwp/5qPAAladnbT4R9KEvYwO5DoWZwbWTScw7IepPDp1x2W3xozkgyJhVycFQ8aV486qnW2LwQzrKF07n5KB8qd5Y+A+KcZeTH1kXCrZjxuq2YfedzLO/qytCPvTTjauV9orPuM7m9cSjWCw/aG9AOZx2/JpHcgluxISfW9utoVxDtKLxt931i2PL7+FLBnuWUVbbymrJNmD/xm/+wbSluOUK43JKLJLm7B82qmvjw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b21d9d61-463d-4780-2c66-08dee8d62603
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:19:19.2845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvvKN/a2sndSNzYUm6DxdbiBxPKkZ+DR5HB0ZL/GVYxUhOf8Apwzo3xfLpMWcneGDPKrQo7dSEm2Yr6HN3pPll2yDqYvbv97+zJEBKshKmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7642
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



On 7/22/2026 10:09 AM, Mitul Golani wrote:
> Rework the fractional-CMRR computation into a generic,
> transcoder-agnostic helper driven by an explicit per-CRTC debugfs
> target, replacing the previous disabled, eDP-only code path. Compute
> CMRR_M and CMRR_N timings based on the video mode requirement. Note the
> CMRR enable path is wired up separately; this patch only lays down the
> generic computation. Remove computing mode_flags, I915_MODE_FLAG_VRR
> as we are moving CMRR to fixed refresh rate path. Also return early
> from CMRR computation if existing computation is well sufficient.
> 
> --v2:
> - Derive video_mode locally instead of caching it in persistent
>    struct intel_crtc state (Jani, Chaitanya)
> - Fix numerator unit in comment: milli-Hz, not kHz (Chaitanya)
> - Fix "reqirement" typo and clarify CMRR is not yet enabled in the
>    commit message (Chaitanya)
> - Fix precision issue while computing M/N ration (Chaitanya)

typo: ratio

> - Multiplier_m and n naming update to increase readability. (Chaitanya)
> - Compute vtotal as it is required to deither as per algo

typo: dither

> implementation. (Chaitanya)
> - Replace misleading adjusted_pixel_rate to dividend which is somewhat
> relatable.
> 
> --v3:
> - Mention rationale for not to compute I915_MODE_FLAG_VRR. (Chaitanya)
> - Remove redundant return statement from last line of cmrr compute.
> (Chaitanya)
> - Correct cmrr_n calculation. (Chaitanya)
> - Add early return condition is current computaion is well sufficient

typo: computation


> to drive without CMRR. (Chaitanya)
> - Take round up for requested_refresh_rate. (Validation)
> - Correct integer overflow
> 
> --v4:
> - Update cmrr_n calculation to aviod aggressive dithering

typo: avoid

> - Use div64_u64 to truncate value to floor value, as DIV_ROUND_UP_ULL
> rounding to ceil value.
> - Add TODO comment at cmrr_n calculation
> - Add condition for custom refresh rate request
> - Update CMRR computational comment block in copute config

typo: compute

> 
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 138 ++++++++++++-----------
>   1 file changed, 72 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 84b1ec7f1616..e8c6516fd36a 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -27,9 +27,6 @@
>   #include "skl_prefill.h"
>   #include "skl_watermark.h"
>   
> -#define FIXED_POINT_PRECISION		100
> -#define CMRR_PRECISION_TOLERANCE	10
> -
>   /*
>    * Tunable parameters for DC Balance correction.
>    * These are captured based on experimentations.
> @@ -198,68 +195,79 @@ static bool intel_vrr_cmrr_possible(const struct intel_crtc_state *crtc_state)
>   	return (HAS_CMRR(display) && intel_vrr_always_use_vrr_tg(display));
>   }
>   
> -static bool
> -is_cmrr_frac_required(struct intel_crtc_state *crtc_state)
> +static void
> +intel_vrr_cmrr_compute_config(struct intel_crtc_state *crtc_state)
>   {
> -	int calculated_refresh_k, actual_refresh_k, pixel_clock_per_line;
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
>   	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
> +	u64 dividend;
> +	int requested_refresh_rate, current_refresh_rate;
> +	int rr_multiplier = 1, rr_divider = 1;
> +	bool video_mode;
>   
> -	/* Avoid CMRR for now till we have VRR with fixed timings working */
> -	if (!intel_vrr_cmrr_possible(crtc_state) || true)
> -		return false;
> -
> -	actual_refresh_k =
> -		drm_mode_vrefresh(adjusted_mode) * FIXED_POINT_PRECISION;
> -	pixel_clock_per_line =
> -		adjusted_mode->crtc_clock * 1000 / adjusted_mode->crtc_htotal;
> -	calculated_refresh_k =
> -		pixel_clock_per_line * FIXED_POINT_PRECISION / adjusted_mode->crtc_vtotal;
> -
> -	if ((actual_refresh_k - calculated_refresh_k) < CMRR_PRECISION_TOLERANCE)
> -		return false;
> -
> -	return true;
> -}
> -
> -static unsigned int
> -cmrr_get_vtotal(struct intel_crtc_state *crtc_state, bool video_mode_required)
> -{
> -	int multiplier_m = 1, multiplier_n = 1, vtotal, desired_refresh_rate;
> -	u64 adjusted_pixel_rate;
> -	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
> +	if (!intel_vrr_cmrr_possible(crtc_state))
> +		return;
>   
> -	desired_refresh_rate = drm_mode_vrefresh(adjusted_mode);
> +	/* No CMRR ratio configured through debugfs */
> +	if (!crtc->force_cmrr.numerator)
> +		return;
>   
> -	if (video_mode_required) {
> -		multiplier_m = 1001;
> -		multiplier_n = 1000;
> +	/*
> +	 * The numerator encodes the requested refresh rate in milli-Hz, so the
> +	 * requested refresh rate in Hz is numerator / 1000. It must match the
> +	 * refresh rate of the current mode.
> +	 */
> +	requested_refresh_rate = DIV_ROUND_UP_ULL(crtc->force_cmrr.numerator, 1000);
> +	current_refresh_rate = drm_mode_vrefresh(adjusted_mode);
> +
> +	if (requested_refresh_rate != current_refresh_rate) {
> +		drm_dbg_kms(display->drm,
> +			    "[CRTC:%d:%s] CMRR requested refresh rate %d Hz does not match current mode refresh rate %d Hz\n",
> +				crtc->base.base.id, crtc->base.name,
> +				requested_refresh_rate, current_refresh_rate);
> +		return;
>   	}
>   
> -	crtc_state->vrr.cmrr.cmrr_n = mul_u32_u32(desired_refresh_rate * adjusted_mode->crtc_htotal,
> -						  multiplier_n);
> -	vtotal = DIV_ROUND_UP_ULL(mul_u32_u32(adjusted_mode->crtc_clock * 1000, multiplier_n),
> -				  crtc_state->vrr.cmrr.cmrr_n);
> -	adjusted_pixel_rate = mul_u32_u32(adjusted_mode->crtc_clock * 1000, multiplier_m);
> -	crtc_state->vrr.cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->vrr.cmrr.cmrr_n);
> -
> -	return vtotal;
> -}
> -
> -static
> -void intel_vrr_compute_cmrr_timings(struct intel_crtc_state *crtc_state)
> -{
>   	/*
> -	 * TODO: Compute precise target refresh rate to determine
> -	 * if video_mode_required should be true. Currently set to
> -	 * false due to uncertainty about the precise target
> -	 * refresh Rate.
> +	 * A 1:1 ratio (denominator == 1000) means no video timing is required
> +	 * Any other ratio (e.g. 1000/1001) requires the video timing.
>   	 */
> -	crtc_state->vrr.vmax = cmrr_get_vtotal(crtc_state, false);
> -	crtc_state->vrr.vmin = crtc_state->vrr.vmax;
> -	crtc_state->vrr.flipline = crtc_state->vrr.vmin;
> +	video_mode = crtc->force_cmrr.denominator != 1000;
> +	if (video_mode) {
> +		rr_multiplier = 1000;
> +		rr_divider = 1001;
> +	} else if (crtc->force_cmrr.numerator == current_refresh_rate * 1000) {

As discussed this should be a comparision between num/den and actual 
refresh rate derived from the mode line. Moreover, this check should be 
done for both video and non video mode branches.

> +		drm_dbg_kms(display->drm,
> +			    "[CRTC:%d:%s] Requested mode refresh rate %d Hz can be driven without CMRR\n",
> +				crtc->base.base.id, crtc->base.name,
> +				requested_refresh_rate);
> +		return;
> +	}
>   
> -	crtc_state->vrr.cmrr.enable = true;
> -	crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
> +	/*
> +	 * Let pixel_clock_hz = adjusted_mode->crtc_clock * 1000.
> +	 *
> +	 * cmrr_n = (numerator_mHz x htotal x rr_multiplier) / 1000
> +	 * cmrr_m = (pixel_clock_hz x rr_divider) % cmrr_n
> +	 *
> +	 * where numerator_mHz is the requested refresh rate in milli-Hz
> +	 * and rr_multiplier/rr_divider = 1000/1001 when the video timing
> +	 * is required, else 1/1. The integer vtotal term is tracked in SW
> +	 * (it is the programmed mode vtotal) while the fractional part
> +	 * represented by cmrr_m/cmrr_n is tracked in HW.
> +	 *
> +	 * TODO: Using the actual desired rate for cmrr_n in video
> +	 * mode produces more aggressive vtotal dithering than
> +	 * expected; revisit once the Bspec algorithm is clarified.
> +	 */
> +	crtc_state->vrr.cmrr.cmrr_n =
> +		div64_u64((u64)crtc->force_cmrr.numerator *
> +			   adjusted_mode->crtc_htotal * rr_multiplier, 1000);
> +	dividend = (u64)adjusted_mode->crtc_clock * rr_divider * 1000;
> +	adjusted_mode->crtc_vtotal = div64_u64_rem(dividend,
> +						   crtc_state->vrr.cmrr.cmrr_n,
> +						   &crtc_state->vrr.cmrr.cmrr_m);
>   }
>   
>   static
> @@ -435,8 +443,6 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   	struct intel_display *display = to_intel_display(crtc_state);
>   	struct intel_connector *connector =
>   		to_intel_connector(conn_state->connector);
> -	struct intel_dp *intel_dp = intel_attached_dp(connector);
> -	bool is_edp = intel_dp_is_edp(intel_dp);
>   	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
>   	int vmin, vmax;
>   
> @@ -470,12 +476,17 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   		vmax = vmin;
>   	}
>   
> -	if (crtc_state->uapi.vrr_enabled && vmin < vmax)
> +	if (crtc_state->uapi.vrr_enabled && vmin < vmax) {
>   		intel_vrr_compute_vrr_timings(crtc_state, vmin, vmax);
> -	else if (is_cmrr_frac_required(crtc_state) && is_edp)
> -		intel_vrr_compute_cmrr_timings(crtc_state);
> -	else
> +	} else {
> +		/*
> +		 * CMRR is a fixed average Vtotal mode and is only computed on
> +		 * the fixed refresh rate path. It is generic across transcoders
> +		 * and gated on platform support and a valid debugfs ratio.
> +		 */
> +		intel_vrr_cmrr_compute_config(crtc_state);
>   		intel_vrr_compute_fixed_rr_timings(crtc_state);
> +	}
>   
>   	if (HAS_AS_SDP(display)) {
>   		crtc_state->vrr.vsync_start =
> @@ -1142,11 +1153,6 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
>   
>   	intel_vrr_get_dc_balance_config(crtc_state);
>   
> -	/*
> -	 * #TODO: For Both VRR and CMRR the flag I915_MODE_FLAG_VRR is set for mode_flags.
> -	 * Since CMRR is currently disabled, set this flag for VRR for now.
> -	 * Need to keep this in mind while re-enabling CMRR.
> -	 */
>   	if (crtc_state->vrr.enable)
>   		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
>   

