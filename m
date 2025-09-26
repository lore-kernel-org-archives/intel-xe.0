Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AB7CAC5B0
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 01:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C7A10E9C6;
	Fri, 26 Sep 2025 01:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cdwgjF/v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C8E10E9C6
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 01:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758850729; x=1790386729;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2De8f2DPmqb2SaNKBP/qgT/gEarlGmdCoOzyqSMZ80Y=;
 b=cdwgjF/vpbh5wlqcfqY6ha25pwuezv7KxISfd8rRcx9mKOmFTnB/SOye
 wSmH5TO5fLOpSBL+Ez7DoZHckP0jMBpZ8ASaex1DyaBSKzb5yrLxp/CAT
 TZy6RbAp1GiK9IehhjBeCHlE0OWrbOkrJWjpIcxGnc4ShcLyApVVPJG6l
 doaVgMbCNJ5U77myWKDTGCR1NElBOWHpsliL+p7UxRqKN0yprfGlBlEpR
 twpfEPQsvFIJMwVg5+LGY3fjxgdMY/3jHl5T7mhlChQww+u+MHHtyTmBk
 tttzSiD8r7YCR9LuLsQR91DzhrEXpilkQz+frSPh/pr5WV6WPL/2Rg418 Q==;
X-CSE-ConnectionGUID: kocMnNrAQC6RJhWnhuIt9w==
X-CSE-MsgGUID: EYc5BWzEQcyiLLujiXRkpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="71800348"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="71800348"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 18:38:48 -0700
X-CSE-ConnectionGUID: JEj9QxzvQP21hep88ABhBg==
X-CSE-MsgGUID: jsV/D1bdQ7eDdr5XIc5T6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="182641997"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 18:38:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 18:38:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 18:38:47 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 18:38:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASpR8AQGfra1/rvU+K/3T0lZW/0SBN60/HF7I6XJkhtDJsSEInLgEkkWDU7omioj8/4CqfeN5IMSdy7GUKyZdDEsO4yAp1asqGXHmSMqUYSMD/AELlR7ftYzHYjO3s8DG+ctw1c2QKjC9Evd7BvdiR9PQv2ufHq3MOQqG+eAVMwZjfUdAJWiBaMNj1Zjv+uUiMPIm2DUil/k2pQebRyW4Ypp0IM79jt9VVaVBZ8mjNtsnikhs7hDHdXRH5rghMONiatiCikaW4ePENV6zYHoYoUUoi8CXAO+F/AZVuxgRBoUjtjv4OvnoSNNk4Fu4dp8wN6dx9uKlwPTiw/kv8zr9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrObMDHN/qiEPjycLt+ODyN4FZ5klKRSndoPGvVHO6c=;
 b=IZfNlGKjHrS0jrRztEKJd4NJM/gKAZJSjb/2D+Jeo3lgfg8iVKQe1vatqNRL8wHidfUwQEWcHvszVq+WkG/mDxTtZ9QzczhrXcBdZsDnzzEF7gj/72WCSdZJI8yzx6y7G42Gays//RnXUpD/eXTYwptGID8omE9pK9/oSSYnFfPrwlE/8/Nf0QQaeV3Gc7UQQkPelsDy3Ys7wobdKpARJy+pBpFYrY7Q1Zy28JvlVVuTSvfc9o5dlCpYtBaiqu6daf3fNAruZYBnKArT5OoSKKLwhceznd33eGueGoSG9TqIHnTUcjiiSuupFy4+vPvDnX4MgDfc3NHmiv3G0tUsXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SA3PR11MB8048.namprd11.prod.outlook.com (2603:10b6:806:2fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 01:35:38 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Fri, 26 Sep 2025
 01:35:37 +0000
Message-ID: <60a52da8-6949-4c51-b7a1-16c71e4b4fe6@intel.com>
Date: Fri, 26 Sep 2025 03:35:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/34] drm/xe/vf: Remove memory allocations from VF
 post migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-15-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250924011601.888293-15-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0073.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::26) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SA3PR11MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b947880-5827-4425-6981-08ddfc9cfec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1ozbkVTTWt6UkowVGVFa3dTTnVEaG1OVlZ0cHpVVk9UVHpvS2F6Sy9hdkRq?=
 =?utf-8?B?NFhSU254ZWgvVEcwMFFYZW9ESDN2YUQ4QTBrdXJDUkNGSmdrY0M1bHdJZFBJ?=
 =?utf-8?B?OFo0eTdMNE5PYmJOR1ZjNXArYXd0WFlhMVUzemJpQ3hlcVdDZWg2TUI5eHJZ?=
 =?utf-8?B?QzZHWlVMRlZRaGY5bEhnTit5NHpza00rZmNwQjNhRVMrbVViaVgvbHNBMmt6?=
 =?utf-8?B?cm42NTZQRDBsc2Rnb2c0bFZ2WDBBNFY1Y0FpRVZYSGNpcDB3ajB4Zmx4aTdi?=
 =?utf-8?B?aVZKUWdEWHN4ZllXSnpoV1VjNFRNWmRhUHBGYXVjZFFTUU9ldCtoQ0Q4UHE3?=
 =?utf-8?B?YjNkV1p6NzFwK29wcDdLNUpZWnpuS2h3OW04OEpyWmx0VWdKQ1lEbkxNem5p?=
 =?utf-8?B?UU03dmpWcFRaQXUvTkxyVk41eFR1TlJTN2lDS0xJWmQ4N2pHTlBWalZLSW9l?=
 =?utf-8?B?akRYSWlVSU44TlQ4YlVFS245aGlRWHQ3bk5pSW12dy9SWjVVWUNwZWlEM0NV?=
 =?utf-8?B?VWJRU2lkUk95NC9qanprbStSSUEyNWJBaGhOcEV6Q0U3T2RCMjNJSk90d2l0?=
 =?utf-8?B?MVJzL21qd1MwazNoc3RvQjRrLzErQ0lhWmhpYlRjZjk3QTNGL1dMeUJ2c2NG?=
 =?utf-8?B?dDE2RWt5NzBxRFlIOGFDdUlGdldjTVRPeXdMbkU3TzFQMXI1bGtTdm9xZkhy?=
 =?utf-8?B?MUVtMHhPcW1oZlRta1lnQlByU3hxQjdLd0tTc05Dd1p6UHBTQ3A4T2ZMS09L?=
 =?utf-8?B?TkZEMVlFVHNaY0x1d3FIYlhrdzIrV3NxeU5oQUFqcEsvdUtGWURRWDNJSG85?=
 =?utf-8?B?VUVuRS8ya3lsMTJOa0YwT1psVWUzbUhGM1ZGbHVmRmtoK2xUa3MxM2U2N1ht?=
 =?utf-8?B?a3JqWi9VQ1VVWFMybGU0a24xNURlSzA3eTRsa2hObmdLVHZ5UERyZExScUh0?=
 =?utf-8?B?RitxVUYxeDFaZzFWTHRwTmxJOWpaWGxuQ2E2eGZzdW00MVMweFdRaFVCdGNK?=
 =?utf-8?B?azQyS1o4WWR0KzZKb05TT2VGVFVsQXBtdWxjQk9wTklROS8vR1JuUDVQSEpp?=
 =?utf-8?B?MUpVd2lpNHdLYlBKQ0w0aXhnVnIyQklOYS85d09qYUMxU0hIVERRMFhDZGRO?=
 =?utf-8?B?UzN2RHpkeGw4NkJNRmJXa2tZVkRZdWJEQVR5QWhrTWtFY2MrYzk1ZDVRRUhZ?=
 =?utf-8?B?bXFQQzNvaE9JQVZHb3dqaE1VeHVud1JnY3FLcmFmTlR4YXl0U1gyZEx1cWJ3?=
 =?utf-8?B?c3Rld0NPQVhGUlN1cFQ3MDRabmh2VVh5dnNpcEhSd1dZd2hpemFRdk5sYmQ4?=
 =?utf-8?B?STF2MldZdHdpUmdBUk50M0p2NHdPZUhVTEtjMXp4U3FrWGRSa216K0lXN3Zq?=
 =?utf-8?B?bFNia21FMlY1UVZGSVE5OUhTRU5rZUd3d0lKMER0OWpFb2Q4eXpndlJrUXd1?=
 =?utf-8?B?TSsvRUkrNXpnK1J5QVVBeGtuanBXamZXb1lscC9ZcEVkQVV0RGlsNldwUnFR?=
 =?utf-8?B?Rmd5WkJxSkpHOXprcjVZbkNyT3NMc2Q5dHdIQUZYWGhMbzFiTzFvSVViN1ly?=
 =?utf-8?B?bHFhbkYzYkUyYWQ0QUFqbzE3MGF6Y2VkMFlIL1Q0c3Y4aWNIZExHRitydkpG?=
 =?utf-8?B?R1VSZWJhVHNEMWYwcVUwVXVrREx1VVJKckVVbzM5SC9WM3puTlpDR2djdEFW?=
 =?utf-8?B?UGR6TkkzVUZ6ZmJLQUJvRkJZdEhtbCt3eVRkNW94blhXZ3AwTkNJYkU5WlRr?=
 =?utf-8?B?Wnd4MmVDRHpDWHpsK0ZvRGs3dGgrQkpvcXpsbWdaQis4SFRJenpNZmVTcXl3?=
 =?utf-8?B?MmF1RHV2ai9wUVBvVzZxOURCMFBuK1BKcmRJZUNRcEFPOE5meitpQW5OZndh?=
 =?utf-8?B?TTRBTExyeDQ4TXBITFdTU3JNL1hyT3ZzdnM2TThyMXdYbnpReUFRamRqUXBy?=
 =?utf-8?Q?oAEl230nZ1U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUkxSGErTGpLTEduMEM4MTRrMlRhQjdrYzdjOTl6SXpaRllqdU5XTjR2cHFY?=
 =?utf-8?B?ZlpRNlh4ZGlwVVQwRzJTUVRTQTBkdlJ4eXFJM29DVFhPckRrbUpQTVYrTk5E?=
 =?utf-8?B?OExDcFBTUmMxTHAwTGM3YllCYzdRRk1qeVFtY1VjWTBaNzNGQlJRRnNrYnZV?=
 =?utf-8?B?SXd3cFdTM0hxOHNkN2tRNGVrR01zVU4vU0ZTcDNCY0ZHVnRFcmp6azUveGl6?=
 =?utf-8?B?Z1huSmI3SDQzZzcxaTI5dmdaUVdwWGE3aDdSQndDTWJXZ0NVM2xHdFZYc1pZ?=
 =?utf-8?B?M1hkTnZHcXRBeU1jQ0VuVmRlY0p1V2lWQldsbUYzWkl6eDFhQ0N3UTJvV21x?=
 =?utf-8?B?ZjQ1VlhOUkUzcmsxbm9tYTcvL0Jmd1BXSUlEcERhRUdJQ0JXM1crZmZYY01v?=
 =?utf-8?B?R09aN1p3cEpqR0prYzl3UThmYVNNVUtZUzBSTHVVZW5MdzNhOW9LckE1ejYz?=
 =?utf-8?B?ckMwMk5naDlHREg4bzhIS3FocVVkbjJjT2xNN0tnQzZnU0l0SklLS2tOdEVn?=
 =?utf-8?B?VGNLY0RmMFB2VjVTcFNFcXFRV3JERUNZNStUSXppcEZEWGJNaTc4aVBBWWdR?=
 =?utf-8?B?N0N6WTEwOHYrL1dPRWVrWXN0d3RsbVVHZWY3bDNTcnh6NDBHV1B3ejltOFAx?=
 =?utf-8?B?Q0N1Y1BOWWx2Sm1sbUtLaFpkK01GeVhCSVFZd1RsaUVkc09hTE5mUE82UXhC?=
 =?utf-8?B?Q2dYZjBxZjI2ZG16dDF4eDRkdXpaMmlQUzlQazhnY1BZeldhcmFRbk55Snhy?=
 =?utf-8?B?ZHNWSmlEZ1RKaFRWMGdhVzJIeVZnMnRGVjBrL0pBUFc0UWNNRFd6M3F2bzMv?=
 =?utf-8?B?dm1WVWRFZ1RqOUczREU1VnZndGJwdHRMSm9MaG15b3VLTDFlSTArN00weW5X?=
 =?utf-8?B?eFZDTFllazFYY0EvSGFnaXFGRlh1Yit3dFgxcm5na3BxLzVpOE9scHNpVDJH?=
 =?utf-8?B?OGt2djJZRjdHNGNvK1QwNEF3WUpRejJmTmFJQlcwb1Z3Qzh5NTVsZFBGbURq?=
 =?utf-8?B?MjhQZ0dHK2lyUWZDbTRBRURnSkw1M0l0Y3JjeG96dG52YlhQNCtkNjZyRmgy?=
 =?utf-8?B?V29hTDVyUS9TSDdkVW9hYTl5UjFmaEZUMnhFSnJRUHUvWFZlZzhyMXFXdjh6?=
 =?utf-8?B?N2J0cGFRQnRpWk5ucFovaEZ6N3FwWS9POEVCd0ZMTmdmekdkaEozZCtrUmw2?=
 =?utf-8?B?b2pwOWhQRElsTEJtSTZ5RE10bWFHTlBkczQvc0pYeTEwdTRnY3B2K2hNQXo1?=
 =?utf-8?B?cDl5enNlb3FSMFRhOVdKN2dyb0hkdnNhN3RCYlJRT2dRM2FSaDdoZDJDUnAr?=
 =?utf-8?B?bE5yelRuNjBoTG0rekRrZGRDaVJvZGltaFBFVkIzQlROV3JHT2YxUTF1Snln?=
 =?utf-8?B?TVMxNHFhTTdxT2JBT0YyeGgyVjNNRkFjNXBBdGpPZkoyRUFYSCtDWHFUTy9X?=
 =?utf-8?B?ak16RjArVGhleE1Lb1g0N2QvSnlGZUJlaWhyOHFpTC9CTVZOWVRoc2lVYmtE?=
 =?utf-8?B?M3FhYXpYeGpVTE9RbXFUc3NiYmlMazlSMWlqTVA0TWV5eThOS0FxWkZuVEFW?=
 =?utf-8?B?UnNWR2VHUjcrVU4xMnpJbEtNMWF5MDJLRyt6Umpnb1pFNExZLzhKREFlU2tY?=
 =?utf-8?B?SnhQczQ2Y3Vud0tkVC9ud0FIVHhnVytZNTlPNGJEOUVjMkhiQXNreEdmOGdG?=
 =?utf-8?B?TWgwZUhCZGdGUEJCbm1lbzdpNXBBdnZlcTFSWVNMTFZiSEtnWjVxdWVwVWY1?=
 =?utf-8?B?eExDK0E2emFCK1pRZzdQaS9Wbjg3WFBaR0NFdHpTbUJmYzFqc1lUZTNXcUZo?=
 =?utf-8?B?MTRLM0lwQ2U2MElBc1lmR3J1SzhrM2x1TWFHL3VEK1FONjRzakFGbTZwRkpn?=
 =?utf-8?B?cXp6MHp2LzFWNFZFUGhOSzlZQStSc29UVnZISEo1L1hETjV3cGdPTUkzZ1JB?=
 =?utf-8?B?eHQzdTYvajR2WU11c3dVOFhpVjQwalJZaEZpaElzK1B2bjdlb0hTQUlqUFRj?=
 =?utf-8?B?Z1k2MDdVSnIzWHRHVExaa1dYYXRTMzdwWGpxNzNLRTlLQ01LL3VzWGJBZzNI?=
 =?utf-8?B?RDVUZXpCcldqN2NyTytXZi9wYlN1bDVSUVlPSGczenh4dXluVmU4RC9GeTlQ?=
 =?utf-8?Q?jGl8NXUf3EQ5SYkbt4rUcWtQX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b947880-5827-4425-6981-08ddfc9cfec5
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 01:35:37.7513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O5esmgMFUKP5HT1jzIfTLfcdrrvx+CM9ezC08E3rE58yg3oMJO822v47m5rrrYXA+e8SLEgUypRJ4zUmvEn6eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8048
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


On 9/24/2025 3:15 AM, Matthew Brost wrote:
> VF post migration recovery is the path of dma-fence signaling / reclaim,
> avoid memory allocations in this path.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 29 ++++++++++++++---------
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +-
>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 ++
>   drivers/gpu/drm/xe/xe_sriov.c             |  8 +++++--
>   drivers/gpu/drm/xe/xe_sriov_vf.c          | 14 ++++++++---
>   drivers/gpu/drm/xe/xe_sriov_vf.h          |  2 +-
>   6 files changed, 39 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index cfb71b749e52..8304c26c076e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1214,17 +1214,13 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
>   
>   static int vf_post_migration_fixups(struct xe_gt *gt)
>   {
> +	void *buf = gt->sriov.vf.migration.lrc_wa_bb;

can we just call it 'scratch', or 'recovery_scratch'? The current use is 
limited to lrc, but besides temp buffer for WAs it also stores MEMIRQ regs.

This name makes it look like something more important than it is, and 
does not describe all uses.

Besides that name, LGTM.

-Tomasz

>   	s64 shift;
> -	void *buf;
>   	int err;
>   
> -	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_ATOMIC);
> -	if (!buf)
> -		return -ENOMEM;
> -
>   	err = xe_gt_sriov_vf_query_config(gt);
>   	if (err)
> -		goto out;
> +		return err;
>   
>   	shift = xe_gt_sriov_vf_ggtt_shift(gt);
>   	if (shift) {
> @@ -1232,12 +1228,10 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>   		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
>   		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
>   		if (err)
> -			goto out;
> +			return err;
>   	}
>   
> -out:
> -	kfree(buf);
> -	return err;
> +	return 0;
>   }
>   
>   static void vf_post_migration_kickstart(struct xe_gt *gt)
> @@ -1314,15 +1308,28 @@ static void migration_worker_func(struct work_struct *w)
>   /**
>    * xe_gt_sriov_vf_migration_init_early() - VF post migration init early
>    * @gt: the &xe_gt
> + *
> + * Return 0 on success, errno on failure
>    */
> -void xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
> +int xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
>   {
> +	void *buf;
> +
> +	buf = drmm_kmalloc(&gt_to_xe(gt)->drm,
> +			   post_migration_scratch_size(gt_to_xe(gt)),
> +			   GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	gt->sriov.vf.migration.lrc_wa_bb = buf;
>   	init_rwsem(&gt->sriov.vf.self_config.lock);
>   	spin_lock_init(&gt->sriov.vf.migration.lock);
>   	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
>   
>   	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
>   		xe_gt_sriov_info(gt, "migration not supported by this module version\n");
> +
> +	return 0;
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 2ac6775b52f0..195dbebe941e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -23,7 +23,7 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>   
> -void xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt);
> +int xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt);
>   bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
>   
>   u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 53680a2f188a..496b657119de 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -58,6 +58,8 @@ struct xe_gt_sriov_vf_migration {
>   	struct work_struct worker;
>   	/** @lock: Protects recovery_queued */
>   	spinlock_t lock;
> +	/** @lrc_wa_bb: Scratch memory for LRC WA BB in recovery */
> +	void *lrc_wa_bb;
>   	/** @recovery_queued: VF post migration recovery in queued */
>   	bool recovery_queued;
>   	/** @recovery_inprogress: VF post migration recovery in progress */
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index 7d2d6de2aabf..358a35c80d5a 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -116,8 +116,12 @@ int xe_sriov_init(struct xe_device *xe)
>   			return err;
>   	}
>   
> -	if (IS_SRIOV_VF(xe))
> -		xe_sriov_vf_init_early(xe);
> +	if (IS_SRIOV_VF(xe)) {
> +		int err = xe_sriov_vf_init_early(xe);
> +
> +		if (err)
> +			return err;
> +	}
>   
>   	xe_assert(xe, !xe->sriov.wq);
>   	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 7d91553c4acc..e622a7c562c4 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -180,16 +180,24 @@ static void vf_migration_init_early(struct xe_device *xe)
>   /**
>    * xe_sriov_vf_init_early - Initialize SR-IOV VF specific data.
>    * @xe: the &xe_device to initialize
> + *
> + * Return: 0 on success or a negative error code on failure.
>    */
> -void xe_sriov_vf_init_early(struct xe_device *xe)
> +int xe_sriov_vf_init_early(struct xe_device *xe)
>   {
>   	struct xe_gt *gt;
>   	unsigned int id;
> +	int err;
>   
> -	for_each_gt(gt, xe, id)
> -		xe_gt_sriov_vf_migration_init_early(gt);
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_vf_migration_init_early(gt);
> +		if (err)
> +			return err;
> +	}
>   
>   	vf_migration_init_early(xe);
> +
> +	return 0;
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
> index 4df95266b261..13969c6910ce 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
> @@ -11,7 +11,7 @@
>   struct dentry;
>   struct xe_device;
>   
> -void xe_sriov_vf_init_early(struct xe_device *xe);
> +int xe_sriov_vf_init_early(struct xe_device *xe);
>   int xe_sriov_vf_init_late(struct xe_device *xe);
>   bool xe_sriov_vf_migration_supported(struct xe_device *xe);
>   void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
