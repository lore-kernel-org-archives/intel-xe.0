Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7D3CCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 10:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697C910E152;
	Wed, 29 Oct 2025 10:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="miI4N18D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE2010E152
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 10:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761732677; x=1793268677;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=k+I9qZ68/FxTFRpxleQxTajgiIgPDysdPAPFNFJ0NoA=;
 b=miI4N18DSg9NxiW/gx1adJGu8za/OiPfukmdsgPMG5ZJQMxDsEsE+3+h
 Kw5PYW9DIXJkUnncs4aw/M+B06/OlCITIiDPF6Tf/HmLT5YM2hvk1PIH2
 xZaIxG339TtbLjFHBe1KBYDZJ9/PwTNALoq/2NWEQ5pPwtYflWNNxek/a
 turTSf/sxJBM9G2dAgMmqSrBeVKlUyzFu/Y8fZ2DDbf/jygdORFw/l4og
 yU2YKTYv/cpHM1SfjpeTfiSAdjmNcXfQhelOQi+YuIW11WoP6HJG9/LCk
 eMBlOffwt6F08FBX9bVwjBCfoNAqyiitYaERtI+rZ//Co9Fmr72W5VW4e A==;
X-CSE-ConnectionGUID: OhzNJjwRRZS92kjXAYgIXw==
X-CSE-MsgGUID: TNHHY6MESjOo0KJjIpYCYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="74967104"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="74967104"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 03:11:10 -0700
X-CSE-ConnectionGUID: S6DQmr2kSCuPknVztjJ0/A==
X-CSE-MsgGUID: Vv4FPdaJQbu9bASABj8MJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="184803120"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 03:11:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 03:11:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 03:11:10 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 03:11:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJFf2MQvvKWz3tyQC9iIMK7v92UEq61hkqFJQQ6pbNsf71X5IhsluPP3H/0a/CB+KA3TNKiJU4fGpjwRoxPQ+GG/kW2Ukqqvtt6lAFKHs4NDnjrdxZxmHPnPQzQ82Mo+IC/6ZznMT294+AmydMtnI93EPlbr8UOxd1p22LH7UdM8+0kYfNZ10IJP3k2XpdzGwEI8l6BcLVD1glDiHcWWTOgihS+9ISQJDX/gLvYSyfzjYEhnYbgMmjmyGyjfq09UW7KaLseV94oPKT5sNlql/rIkCGyyNYRuMBkBdJkzLBNH4ronjQTwFcLvwjm0inTipsd1DjyyBmxUyT5CrI6DNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMyP2fvK2qJY1tERAK2gHB3Cns72zEFiU9IxQ5+prQ0=;
 b=SwVzvLWRgv6dwloOvX27MiLEN/YeWmAizKpEMmN5csrdMUndj1tl1OXV9c6RMBDaIF9jbTT1ujPsP4pY/UHX7vghNS5ArSXM9p3TJNpYiy8rSY8mZUT4GUx1XT3JrnbW6gFjSlnGVkPGY7lS2IjZMErQ5BV5a7cJTFQRhwGl5Y4uz9KO85o++Vpf9qHeuakOtpua2AoVQvBXiFl9xGOwCYbtqrq7mGNmgLVRXeYCDiH7a9aR5h5q/B3vqTqds2j5BQWByOkt0k+sR8VlFHHw1uWN852aXPJ7wnigHnBNxIlRgp4E/GbURILKnFURJIl7/NhNjc13v4eIYJvAuRx2Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB6674.namprd11.prod.outlook.com (2603:10b6:510:1ac::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 10:11:07 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 10:11:07 +0000
Message-ID: <18803b22-f0ba-47a3-8939-63dd98989485@intel.com>
Date: Wed, 29 Oct 2025 11:11:03 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBQRjogQWRkIHNy?=
 =?UTF-8?Q?iov=5Fadmin_sysfs_tree_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <176172212689.66492.10938669440209675382@97596180aaec>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <176172212689.66492.10938669440209675382@97596180aaec>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0062.eurprd04.prod.outlook.com
 (2603:10a6:802:2::33) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de479b6-8828-4645-410d-08de16d379ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVc2b1pCdEk0M2VZQUoxYTdxSUdYdURNdER4b3Y5Q2YyV1c5a2lBV1NJMXdu?=
 =?utf-8?B?Y1J1TGZpTGdsS3o5UGNjWVZpYWh1aGd6ZjFybnlzVHc5S0V4MFNyU3Z6OVdt?=
 =?utf-8?B?eE0xZkhLQTB3NTdKT1l4NWVlNkV4WjBEcnROUmRmTzd3bFVIOGplZGMyZlly?=
 =?utf-8?B?MkN2bmtkc0dHcDVBNytNbEl3dWpqTnA4eVV1MTV4OWJnOXEwMGNsL0NaQW5v?=
 =?utf-8?B?bmdhTGtXMmxvQzlIOC9TWmVqQlJUVlBlYTJJTHdTZ1A2anVSa1h6YXZWYmFu?=
 =?utf-8?B?MU9SVGUzSFZ4Qk1xUzFPUVR6ZzI2OHlxTUs4Nk9LNExxUGFRb2tIMjZ1Vmpl?=
 =?utf-8?B?V010R3pEWjZnQlRReFZ0SjErcGh6S3BjU1JodFMxZ2loaDZibjNNQTkvbTJZ?=
 =?utf-8?B?dzcvdXZRNjBIM3libGZFQmNneTg4b2ljSVVhVXB0WVovSit0TkNuVWJURlNV?=
 =?utf-8?B?a2JWTFF3clJ2bDhhOGhVamtTdjQ0SkJoM0l0Qnl2QnZYR3pxSXJLbUQyUXNL?=
 =?utf-8?B?bU11WXp1azlSVkZnQmhnbXBoOENYVFRDTkJPWjFJME5zVlJ4b2VuazZPak5l?=
 =?utf-8?B?RExFVmptYkUva2JhL2NVL0VSbWxWVWtORjBVa21MYjRRbWI1Z21KRUlsaTcw?=
 =?utf-8?B?c1JnOXVib1F5TXhzVHhHNEk4ckdURStKQ1Q1TDErVkdMOW0xeDh6ZitzVjhn?=
 =?utf-8?B?YjB0TWIzQVRSWi8wZTJXQmhhTm0vdWFHOFF6REIwRnpYRlM5N1Iva0M1NmFX?=
 =?utf-8?B?Ry9JRDU0YWExbEY0VWlSK0NVR3BYSmxnRmpOWCs3aExod1RNdTRhNXFPYUo1?=
 =?utf-8?B?ZVdWZEFJbUpySWxCbnJ6Q3dYbHZiMWcvdTFoR3RJRTFicC9NaU1OZFVneU4w?=
 =?utf-8?B?eDRDdUhRRDR2RStmazd1UG1UNW9HR2x1b2NPWTlyRHJIOEF1eVVybmk3Nk1p?=
 =?utf-8?B?ZE9WN3RjREt3dkxQT0VuNVY5eGlldE0rSmJWaFM5VmJWcFRSbzViaFlWS0E0?=
 =?utf-8?B?TG5JZTR2Y2RoWnhLOFJyYXVpUno0VmZ4ZnorZnlMcDM5bmMvZ2tGWnVscDhm?=
 =?utf-8?B?c09HeGhGOTlFT0Y2YnkrUUpzUzlac1lNdkZXSFNja21nWWFRaFpiSjluVDVw?=
 =?utf-8?B?S0JnaDZueW5qcFByWlBVbW9VWDhxVDdjMnd4TU84V09xOWNZeUEvTUYzYktj?=
 =?utf-8?B?bmRzZ1I0RzVYTWNXV0dCSm8xMEgrd3pmZXVUOTIxb0kyMGtOQXV1alFtc0tO?=
 =?utf-8?B?TG9PRUpJS3FKeHA2L3lKdHVYN3YwQWM3cHcvOG13R2hHOHhvNkRWdFI3VlR2?=
 =?utf-8?B?ejdFZG1uVG9qMjdvcFJTbWJ0RTloVDVDWGZMQjFnaWJRQVpkOStCUFFob2pI?=
 =?utf-8?B?UGVSZU5MZlJXOTNUQ2RIZXVSTGpJcnE5dnpCaVF3ejJEZnNnaXZRSDBpMm9P?=
 =?utf-8?B?NndWd0wxbVBHNTF3bVdpNzJXK1YxNlZhVU15OGthdyszWU9xWk1XYVdFOXBq?=
 =?utf-8?B?WjM3MEpXRzFYeXhESnFreERmVUFRSmg4SkNMTTVZMEd6V1pBVnpGejZTd0RD?=
 =?utf-8?B?WGRzNkxVYWJPQU9SamIxNGNrQkdTVE9Kb2N0UHY1QlMwQ2FhaWVMN0VIVjhv?=
 =?utf-8?B?aCtwdDBnZzk3eldiTkxFK0tzejJWU0F0amFPbDlZZkxzNEwvQW9TT0U5K2R6?=
 =?utf-8?B?NXl4SE9HODZCVnlEVnk3TFcyKzI5SWdpT2hlNVpFSy83UXMrQXE3UWE3WDFm?=
 =?utf-8?B?UDRkdkJzUnZpYTY4WTQ0TjAwYTNXTGpCTnpWNDRJeDF2TzUzMHR2NmRjSGd0?=
 =?utf-8?B?N2p1dmdZRFF6c2t4cWpGTUhwTUlHcHV6ZXVvQWh0VHR0NTFBV0hhVnJVakhx?=
 =?utf-8?B?Sk5DRkc1eTNmWnFpcTdaTFBQSitjNEhiZEdMNml4MnJRTlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDhvaVMxWlJxZWNQalFOOHErWFNrOUpPS1BNam9hcFZkTnBwRGgwMmRZV1FU?=
 =?utf-8?B?K0pSQnY3NnVwK2FDU1QydjFKMmErU1o2eU9DeElaTW1VR2xaaFdFeHJUOU5x?=
 =?utf-8?B?aFU4U1lpVjg3bmZ4MVNkY0t4LzlNRi9BVGFHVCsyRmdSTjM5cWRlbDN2UGE4?=
 =?utf-8?B?K0t4MTFkTUUyYW9mZEVlSVUyS2xpclRvZ1d6emtvVzBQTWh1QWdGNm1nK2dP?=
 =?utf-8?B?a0RzcGYxK2phRkh1aGZHMWFPcWtiK1BLZGtFcndQTitnNkpXSE9EODFQUEpn?=
 =?utf-8?B?NVpiTHhzck1BWHk1K2xNa2Y3NVdlSzNaY1Jpd1VYc3hRQ1Y1bzk1N1lhREYx?=
 =?utf-8?B?Sk1mWDlISjhrZnhuRzN5d1diSnZudzRpLzR4UE54cDVHQ29mdTUzcEY5WFls?=
 =?utf-8?B?VGJxempKL0V0ZzZ5U2ZpaVRlTmNFNHk5UUNRVUZwOG1yUTkvRmErck44R3VH?=
 =?utf-8?B?d2ZMZEhxc2hmeXRxVWVNSU9VOEdUVk96VnFicGUzbFJTM1lYdVBQbXBkUDdO?=
 =?utf-8?B?eEVMOVdYc0pSUDgva1EvUHNibUpEUnd0SW4xRlMwWUViaEc2ckhNaGQ5RXE1?=
 =?utf-8?B?Z3crbmJoVlRlZjNVRGNKY3ljRmlGQVdjUmZqSGlOY1ZDS0JWWTlITFZQSXZD?=
 =?utf-8?B?bDFhcGQ1M1BFSkVxOVVZM3ZtTTRzZzVTd05QQnVvY3MxN2VJZkE1cEdDWEh3?=
 =?utf-8?B?MS8vTTBEUFVZSkJCeXlrdzNicFUyQnlnZ2NMNkdRdng5c0ZjSG9zSlMzUkFk?=
 =?utf-8?B?Z3VjbTU2M2paajBSSVord1ZRZmNMak1JLzBpNUV0LzVEQS8rTXFORjUrVVFK?=
 =?utf-8?B?QURZQXpiTjg3Z2I0Vk5MQ0tQZzV0Skx2Ynlybzd0UFBvRE1qTVhSaWdjcVE0?=
 =?utf-8?B?OUdkelg3UTJFN0o5NDlxOUhkU1pTQ0hoUnRTNmI0ejYzK1RzLzNqTFpzNHFh?=
 =?utf-8?B?bGF6ODM4RXhaZkozVTd4eFY4WFdLSUkvRTVMYVd6dElqQm1HMzVuSzkyR0Zi?=
 =?utf-8?B?TDdUR0NIS0R0czRwbkZRSG9pcllmTDRRYW1BZCtnQmtJQUtOdXk3OUpDNDg1?=
 =?utf-8?B?UUFhcTBhOWNJbUN3N3h5RVZIcVY1QWN4M2dBWmhLMC93SXlmYkR6UkVpbWFh?=
 =?utf-8?B?RzN2b2pqbnhVOHpESTFOUWVSSjRnYTFYZm14NmJxTFI2UFBqU2MweUFqU3NJ?=
 =?utf-8?B?VEFlaVVlcFY2aThPRTZMazVMcllneWJNNWc5UWkybkhpRy8zSjZqb1N0ZWRH?=
 =?utf-8?B?dktiY2JEMHI0MjZZcDlId09yVGhOUDl5L3BLSUJZT09jYkwrcU5aZDhQZnJt?=
 =?utf-8?B?RXhncDVKVzJKZ2gyUzRKR2hhMFBFeUlWWm90Y3c2c1MxdFJNTVJuK1VHSVk3?=
 =?utf-8?B?ak52QU9OOHh5YmpkVDNTZnF0U3NBWjJ6RGIvdEY5Smk5dFRYT2dCNVpwL0Z0?=
 =?utf-8?B?QlFMT05UOVZzM0NQcHFFMHlFVW56TG9ZM3ZkZlpscTJzbmpZN2hkS2RlQ2Yw?=
 =?utf-8?B?cS9lMkNFTDNzTEVJRFFkblhONnBRVzRweDFmcFM1SW1kekUwOHMrU3lSNVlY?=
 =?utf-8?B?ZW5EN2tEVkdsb3pMRnphZmVZODhvaUsxc2pYV2tVT3l1NkpET1NqU3hacjkz?=
 =?utf-8?B?Yy9hbzdqMndRdDVSeWgwaWh0SzhMdThoSUNlM1l1eW1EQ2FxeTYzV0hzYmJY?=
 =?utf-8?B?YkxZTE9PaU1CcldnbDYvUEp2alNtenI1dkxTQ3M5MnpvenpESmNBNlgxUjlP?=
 =?utf-8?B?NnFnTHI2UlVScHYrN2Vkd1BLU21OaEJBc05KNWVraUhnTDlRbzY3cW5QMnc0?=
 =?utf-8?B?VFlXbmo5K0NNOEtLcU5jK0QyMEpuNmFyWHFXUCs2R1JiMURra1oxRmxSOGU2?=
 =?utf-8?B?UTBoUnp2TkN5Z1h3UXpqUW91bDlyazRST3JBSzkyalFSaHFLSXM1dFNpOXds?=
 =?utf-8?B?RzVIbkl0YmlCQ04zaFo3T3pwWHVUTkptSmtEUlEvT3hIOWtvc1ppRHlRcW5N?=
 =?utf-8?B?dHd1T1BpckRyMlBiNzloZDU0T1dFUWI4MnEvOUZMNzNHU2dlaTJTbGE5VkRD?=
 =?utf-8?B?eGtyZ2UvSTh1OU11WlN0cU9BQ2NNZXdaVzU1STNaRXZwU1RYMkEvZjNid0ti?=
 =?utf-8?B?Nk5EUGkzUFlCOW5CSXh0dm9ncEdyY3hSYWZ1L0QyM2ZHL2N2UWJaZkw0MDh6?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de479b6-8828-4645-410d-08de16d379ea
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 10:11:07.4312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBTcgq7dKb+7WaQNDc4BlBrenBl2gQa0KyMSxGjwOTfSCW4s5MfIRa9CUQ07M1O9y3t+1ptl8JjztOUWn/fCxwgF1OA4bnqlqz6zWjtPJaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6674
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



On 10/29/2025 8:15 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	PF: Add sriov_admin sysfs tree (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/156220/ <https://patchwork.freedesktop.org/series/156220/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156220v2/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156220v2/index.html>
> 
> 
>   CI Bug Log - changes from xe-3996-5742fc7aea99a1326637a7106eeaeac383a1c76d_FULL -> xe-pw-156220v2_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-156220v2_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-156220v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-156220v2_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_flip@2x-flip-vs-suspend@ad-dp2-hdmi-a3:
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3996-5742fc7aea99a1326637a7106eeaeac383a1c76d/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend@ad-dp2-hdmi-a3.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156220v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend@ad-dp2-hdmi-a3.html>

unrelated

<3> [435.370057] xe 0000:03:00.0: [drm] *ERROR* [CONNECTOR:281:DP-2][ENCODER:280:DDI TC2/PHY G][DPRX] Failed to enable link training


