Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A25DC5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 10:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E8D10E850;
	Thu,  5 Jun 2025 10:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYJVTmrH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9ED10E850
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 10:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749118555; x=1780654555;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XmtGPfS0SvkR/D9LS83Op0ti6RKToKPvTrIL4XmI6+c=;
 b=mYJVTmrHgVjZ1l4AO43jGlVUxF7EnOHIlDH51JlaljV5gC72E3xcGdwL
 +VRXWyxrViuIiDcGKzIQ4paftOtLX7B5MK5eJc7LDZUcIqxH2/Eh/7BoY
 03Y22qB1QORf9Payo0I6CF90gfw/Le1y138b8ILBS/Fy352oWBpsS211Y
 U1BsUUetOTsrvftgTE9JVBWZ3chI89tjmA09gQhsNgn+t1b4VQMslcePW
 boKBkZoHk7R7nloqEzapttUugJvRcUcBGBX8DK0FpFuNtGaBVFsJA9TgH
 fAri5enxIygtPvGgnz+ibcYIcHduY+oPBRLgAqcFeU0ao/9pMKE88jvnP w==;
X-CSE-ConnectionGUID: jpKJ1OIQSKWH/mz915XtNw==
X-CSE-MsgGUID: Z23n8iaNTy+zqlYWW6z1Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51322949"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="51322949"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 03:15:27 -0700
X-CSE-ConnectionGUID: n4W8jn/IS8uVC9WxmWt9aQ==
X-CSE-MsgGUID: 2XLFDTpzTg+K7kPWYGBVzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="145419791"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 03:15:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 03:15:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 03:15:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.86)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 03:15:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jiClT6XjBRgXq3KvZBuJUk19IaYSryYpxjtFQaLpSdpAD62ueOIsEbWX371oo9iFyU9bMMrKLM3sl5K/8iL+GYtBMRTscuz5FVuAv8Rtm2tg2oddVmx1Cyqjuishve3VggS188fHpm7I3raQUvZahZd1963JmmcRUYDetpRErQgyw4owBzJoOiX4H/L4BjhY2E7jKbWWEqb+mMXYr69rj+xIMCAuh630Izzr26EJkWQC8dWygecWinsuMCiIVHToXJBi4RPDDeyhIa0ScZjFnNbxfhyLjAa4eAQFolYIQutj60+hy1H93UUMu8rx7IGgsdhmnp2GbMRLopJuzpb1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pr6selZrLKlLZSpUZX2HgxnLd5w8/KV81hZ0uihbsX4=;
 b=SAMtngwdMqMxuNC9KHha+jX+i/0wI6D6D7LJUBvMO5KboeaZb5b6JMsl/oA1yLwFZAIMhMJE7MIKflWCfUtPCFbaja8fjEleh4k/YYDWOlawOBCPvKIvWncNqTmqO6nxqX96Ve6ERKc7keA3xn2by5VGUC5XeDB6QzCtsxqOL6WsvI4QcLEgNwqktCr1GIL+XSiyiMx3UHGMZtbCExw8NMdMvWwfRMNKEtwwABEgkf562fNfzgVq317vbj80oYMfTFC6rmcC9efkyTYazijrQYfjNPIqH7GbJjCa8x0vPyFW4YEFf5Fb61s6f3X+WKU8Q5Y152vlNwnwZ163YXh8LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Thu, 5 Jun
 2025 10:15:24 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8769.025; Thu, 5 Jun 2025
 10:15:24 +0000
Message-ID: <7ed80aa1-4226-46b5-8fb9-49580d8596d0@intel.com>
Date: Thu, 5 Jun 2025 15:45:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add debugfs node to expose G-state and pcie link
 state residency
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>,
 <riana.tauro@intel.com>, <jani.nikula@intel.com>
References: <20250603181205.1680363-1-soham.purkait@intel.com>
 <8c096d90-9ed6-4789-a8d2-0189fe4699c7@intel.com>
In-Reply-To: <8c096d90-9ed6-4789-a8d2-0189fe4699c7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::16) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|BN9PR11MB5275:EE_
X-MS-Office365-Filtering-Correlation-Id: e0122755-12c2-4b8c-8097-08dda419e252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDdqMnNoQkt3Y2t3b3B0K3dnNU0vTHJyMGJka3VLaXVQSnZML0wwL2x2L3Rt?=
 =?utf-8?B?ZlI1bm0xb0JmejFVSmEvcFBoV1h6ZjROeEliS0NteGMveFNjSEVybGdvSVdX?=
 =?utf-8?B?OC96QWp3NVM5TmRMSm54dHdOY24vUjE0b3hpcEpsSlVmZCtPT2hQNS82SDVT?=
 =?utf-8?B?QzdDNlpNRXlZTStTT0IwN3BRODNoVEZKdmFQN2VSR2Z6VXVGTGcyUklCSzBF?=
 =?utf-8?B?OExiUnEya0tTT3ZVaTVpRjRMTGZqajFoc3c4RXJZbUJ6TGNRaVNSTnovSHJn?=
 =?utf-8?B?UjlDalFOUGZsT21UNWFseU5kWTJHVC9uQTRmTnFrbndOdzN0MzVoayttZFFI?=
 =?utf-8?B?L0lVMmllRkJYK1lpN2FxNTgvNzhJTzBWYnB3TVNVdFE0bmhydkZac1gybTRS?=
 =?utf-8?B?UWpPd2FacVhvZEVmYzROYjNlYkZJaDNIMzdtRi9CYXcvU3duN0xhaUJTOEM1?=
 =?utf-8?B?M1hkY0FxNWtoY00vb2JLSjl1ejJpRUUwYjBPYWt5a2tCNVRxeE8wOTduYnVv?=
 =?utf-8?B?MS9YUDFKVndVQS9oQmhlcE43engyQnViZk1LaXpDMzNVZmFWTjU2M24yMEZH?=
 =?utf-8?B?Snp1dllBdWwzYWIxdVlMQ0FobnExdGdtK1Vadlc5aFYvQlRJdHNjWGdOU2Qy?=
 =?utf-8?B?TVVxVTl4N1lBcE80RjBTQjByVlhpTVdrdjltb1AwdU5VQy83SnRYZ1hWenc2?=
 =?utf-8?B?RlhZSTZobzlIZEVNS2l3b29HL3ZZQVF1b0JtVXMwWWZZcHNWT05Ca0hSZXdh?=
 =?utf-8?B?ZWtoZGhjU2hBSjdqUTJRUzJRc2Y3UlVXSlNScnVMNUxGb3FRckd1Um9sbjg4?=
 =?utf-8?B?M0l5cVdBSTNkdFRrRkdUNmRPTmZpOWtvMjVRcU4vaEYxcFJSVXNhSmlNNFR4?=
 =?utf-8?B?QzJyMnJQZ0UybmF0WElTUmZYc3ZDSXFmaUtrOVBNaUpGNERuRWJDeEJscFoy?=
 =?utf-8?B?UWlsNWFXSTBTbVk0RUt4REZZejBra0t5NXFJRHZqN1hIOHMrWDNoUHF2OXJX?=
 =?utf-8?B?ZFJFeDNoTlhROG90NUNIeEN1ZTQ2L2ZENEVDME1DZE15TFR3aTMxaVZuUFEv?=
 =?utf-8?B?NmRhMjVrTW0yVGpsOXhKeUdNdlpwYlBzTzBDWUUwY1M0TVNPZ2ZtUFN5K3h0?=
 =?utf-8?B?WDl6TGJ6SnlocFpCYjZzZjdpK09JSVVhK1FzbzVjdkFQb0JhOHJFV3NleDI4?=
 =?utf-8?B?eEg2Vk82VnN6QkRNcUxLUVlPc0g4elkyd0FpNUxUeUtXVUp2bCtMdng5dHhr?=
 =?utf-8?B?ZGdxUEVUSnMxeVpXV1lFamFsZEc0eVU5dlBoZWpaZGxETFdNcXR6V1ppU2Vh?=
 =?utf-8?B?V0lkU2xWVnBRZFI0VThTQzExcG1XWjF2azUxcE1yUmZTbkhPbU0wR2oxYmpQ?=
 =?utf-8?B?VXRaaVQraG5sTGhOMHlYMVRxWjJxSWMzdlJibHpUczBzRlRPM3lHaUFKdTNE?=
 =?utf-8?B?eU5vQUFqam5mSlFMNTJEcnFlR2hOUzFvaVF1bVdNSlNmWjFwb3FnOTA0TzRh?=
 =?utf-8?B?VmZkeDIzSVlaeTVsM0E4T0t6K0pKV3JJSHZReWpNQmRhZVhoUkZJczZOL2U3?=
 =?utf-8?B?QlBObUJpdjR0WHpaOU5nYTlmTzhDZUJabmNNVmRPQTlSN1BmMUduRU4vTi9N?=
 =?utf-8?B?WFdCNFlLZnZUSkdtcmdnNmo2Vy8rRDBheVpGVG1abFBKdnE5RnJFTm5VUVRX?=
 =?utf-8?B?RURBdzZjZlJCU2xDMkxyVTN0d0diQWxMMFl6UWQ4Q3NKalNNTzBac0V6Kzc4?=
 =?utf-8?B?QUFwaG0zTnAxd21rREY0N2daWkRUOUV2NDYySHFCMnZucGlRRDVyc2VqaExh?=
 =?utf-8?B?S292MkprbG16TGlrNmJOUTZMcVlydndDSlN0QXRIY1hLV0RRTy9tLzZyUEsz?=
 =?utf-8?B?a2t3TUhiVWJHOTdmNFdFQmNqazhIMHl6Zm9VSXI0UlZPRXc1Z3VXUkhpdHZJ?=
 =?utf-8?Q?ku0zv+GdTNA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlBIYktVV2lUcDZINys2QmRlZFVKK0pLb3RwbWR6QXpFNjNlT21vN3BNOTk2?=
 =?utf-8?B?OUNZSy9OallpQTZQazJraUJMN08wTEQwK2p0UUJhcmhaRzdtNWM2bVBDcmNW?=
 =?utf-8?B?RlU5c1FYUDVaWW1oeU5xNlVMNnV4TEFkLy9lMGtlblR6TGg1K2ZPV2dCVGtw?=
 =?utf-8?B?LzBaeFlRd3poak55QTgzcDhvd1k0NGpNc05tVUthM1NGZlltVzVNaUQ1cXRH?=
 =?utf-8?B?SmFCOXFEVm00SnIxaElCWXJlL1oyWk4zR3RHdWVwUzVhNDlBNGZPR1dsYXQz?=
 =?utf-8?B?TmZoRG4rejFJand3VjEyMFZ0cC9nd1g5MURreGZaSzEwbDMvZFpqcm42cHUw?=
 =?utf-8?B?ME9nS1lxaCswVlFIUldFYkthdHkvcGNETERBUXZiYUdZWTlGMEYzOEpSaFpn?=
 =?utf-8?B?N2drLysreWt5UmpuUmdLVUswU0RuWVpEOFFwaWlaVkIycVkwd1lZVzZqMlBK?=
 =?utf-8?B?UTVOYXFpc21Ib2ZuVnAxeTlPZEdFbmVocWhjVWhwK3AxZzA0K1JHNkE3N1Ft?=
 =?utf-8?B?QXdEUFJLR2RqK0I5am1zQ3FjRUdsWmdrcDdMeUdwUFZZYzRWZDljY1lHMkt3?=
 =?utf-8?B?ZHdpU3N3MlpHVVRETlo0aS9FYVd1bHgzVzk3enNLc2E1NmJ6bFgwMkVFYUdS?=
 =?utf-8?B?OW5LN1Mvbk96ZUN4U3dDU1prUUlqNWpRZVJwNUR1UU5ITHh2eVBMaTNIT29T?=
 =?utf-8?B?dHA0WFFGNndUaWx2ZlZtd1A5MFlTV2dLUWVBMjIyeG5ISXZtNVo4eG5yMmZ0?=
 =?utf-8?B?SGZyQkJEUDJzSzIwS2p5dkNOWEs1bzZ4V0dsVEovaXlvYUhEUWhiQ3dFVjlN?=
 =?utf-8?B?YzNlTXlGUkhON0FSVWRXekZFQytwdEN0WC9MTUlNTEY1amlpOUVaaU8zQThY?=
 =?utf-8?B?SnBKV05MaWIxQnhHVGJRTGJJNkhDWUdlTit5dmQ1b2FDbTlHSlN3NWFQd2Mw?=
 =?utf-8?B?UXFpeC94Uk5hY0l1RDhZMFRsVmVHVElpa1F4UXBEV1FiMlc2K2VQMmNIb1VD?=
 =?utf-8?B?RWhHYjU5MzZ0Vk54dmpCOWgvOEl4cjJsbWpMWGZ0MTR6b1c2b2tiMWFwMit3?=
 =?utf-8?B?VDRnamFNUk1nQ0s1NCtieERIdlA4RTdoS0ZTbldqb0FyNkFwWEFGWGFaY2hw?=
 =?utf-8?B?SndjaC92azdZdEthSDlqeFpZNEhHT0ovbDR2c3Z0WkxmQ2wrdWVMYk9RL0s0?=
 =?utf-8?B?NUpmd2JFSmdVT1ZiNkt1NWRoYUNiWGlVbmZpTGM1TlNSeHQ5S1FTcExMMU1j?=
 =?utf-8?B?UG9INCtLMkpCZXgydWZJUlQ1RnN1NFVYdEVLU2ZkcFZOTXhzYm9YejV4S09G?=
 =?utf-8?B?L29RZExZNjdtOVZHZXYxT29ZaXpLQWttdXVjU01PSFVmQ1Urd1lZc0tFQk9O?=
 =?utf-8?B?d0Z4dXJYd0FUeDdpWFpXT1g4Kzg3QUViVXhhTzYwUUtIZnFJN1Rta3o3VTRL?=
 =?utf-8?B?S2pjT2IvayswZ0J1TzNaU3NMdGYvWXN0eEJYNXNKRWsvdTRhdG5OblhhQnpT?=
 =?utf-8?B?MXpTampQWWpPYzIrVXhPZjljeW9Gcm5lMlgyTHozMHhFN1Z5ZkdHR2lBR1RS?=
 =?utf-8?B?SUVCenl2dm5DbGFpbVhhZDlMTkhlSGdwQ2VKeW15SGlSU3dsTmxaeW45bXo2?=
 =?utf-8?B?c2xXbzJyd0dvQlhhU3NyRWlJTUlUNHJLNEVrRkkyS0RyMk9lTnJVbmdCd0xR?=
 =?utf-8?B?L0JuSUI4d0FLVk03by91ODRndHFlU3A1TjdIbU9VMmJ5ZlZPeG4zNFlJZkt3?=
 =?utf-8?B?c0Vxc3NHelV2MVQ0WU1QL2ZhTjBxV052Q2hhQnhsQ21YU3NsM1hLUjZnY3BN?=
 =?utf-8?B?dTk4cTIwMWJxS2JOZTlPWG9pTGVydUdxNWJhcmprNGRLb052YUpJWnh6THJx?=
 =?utf-8?B?YVY5VXFoVUcwaWFwTisvYXRpQXBadzV1b1hxR0p0SmdaY3U1V3RuRWpHQ09E?=
 =?utf-8?B?V0FSd1FyL2wrSHpiRVFLcUJHa0RnWThocDkrR2J5ZzlkZjdCZ1JQaDI2bFdW?=
 =?utf-8?B?ei9CblY1K3lnRkRxZU90Tno1L0puNFlRVTdLTGpOZzV5eUtlbERXZG1qTEN5?=
 =?utf-8?B?RTkxcjdOQVZybi9kZkVuNXNiZnI4MnVGaCtjR0xEUk8wd1Blb3VVWDY3VnFk?=
 =?utf-8?B?TlVqd25tS2ZKUzhmQnlMbm01RGNYRnhGRzR0MUtBa3Jodk9VZnRkNWk4aTJZ?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0122755-12c2-4b8c-8097-08dda419e252
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 10:15:23.9364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jn6RVhFx+0yR0JoN8W/J4F2xHVYDHIvSJqOdlxYHiYD3SyMkv12cRMyKwyzLHLIkJlOGgK3trQG2PHmcYjRcRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5275
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


On 05-06-2025 15:32, Poosa, Karthik wrote:
> You can simplify cover letter title to: Add debugfs for G-state and 
> PCIe link states residency
>
> On 03-06-2025 23:42, Soham Purkait wrote:
>
>>      This patch exposes G-state and pcie link state residency
>> counter values through debugfs for G2, G6, G8, G10, ModS and
>> L0, L1, L1.2 respectively.
> This patch series creates debugfs for dGPU G-states (G2, G6, G8, G10, 
> ModS) and
> PCIe link states(L0, L1, L1_2), residency counters.

1. You can provide an example of debugfs node and its output here.

2. Please fix checkpatch errors:
WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line 
(possible unwrapped commit description?)

you'll need to run
./scripts/checkpatch.pl --strict FOO.patch

and fix the errors and check again,

There shall be no errors and warnings.

>
>>
>> Soham Purkait (2):
>>    drm/xe/xe_debugfs: Exposure of G-State and pcie link state residency
>>      counters through debugfs
>>    drm/xe/regs/xe_pmt: Macros for G-State and pcie link state residency
>>      offset
>>
>>   drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++
>>   drivers/gpu/drm/xe/xe_debugfs.c  | 99 ++++++++++++++++++++++++++++++++
>>   2 files changed, 109 insertions(+)
>>
