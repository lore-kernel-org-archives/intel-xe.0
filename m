Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D885C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 10:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F8488284;
	Fri, 27 Jun 2025 10:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwmGuYOo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEF688284
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751018639; x=1782554639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=j8Q17BzwI1yXT3h0g38GMqYIzL1DAsZ7moRj6k80MDY=;
 b=WwmGuYOoa6ywOZWH8PwsK6mGlegZXg19JdNMPMiAhRH6ul4kZ+YxkJal
 xWmG5BFRjUfGDQSETSz9gQ75yyXpQMTDswqMBQEdN+yPmal9ZuCFgEJZ/
 iEGgTh6plgmYmhr/c3DKpRS9ARv+sM0sG6s+gPZ5zbHXJltFvz0hT7UAR
 kc1w5wEnw6sivfvN8ktyx9pxTxzExNJXufqbJap0N30I5cKocz4Ecdh1n
 aFP+RSrm8NCcA7XMjayAeUKwrm+jxxWoxY70dhXAl3FcrZAd8rxewTWl5
 3pLBch2FLcEWn9PqczbvvTBAymG26s9PPEI1qge810AAyHxJqARxDdT+H A==;
X-CSE-ConnectionGUID: 7suC/V4qQtCjO9txWBco0g==
X-CSE-MsgGUID: KvZTgRloTLWH9KrvqvNBXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64019082"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="64019082"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 03:03:58 -0700
X-CSE-ConnectionGUID: rSPNiRAdSRO1be0S4eb3dw==
X-CSE-MsgGUID: vwMBzwtsSU2DyN4YgDV83w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="157314807"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 03:03:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 03:03:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 03:03:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 03:03:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzxKGrZlxjofhz0Vrql//4W5nh1soA4CjaPS5iXVgHEgIDlEHQiQZI21oXrIvR8nOKBPl1o+6Ps9oebeV0gsJozRdsh710REQickxoFsXZp7My7nc0o2sF/gUwsjSgMISy1ArcFYKnWCOqLf/+TECTGyMHRHKfKVdMydXLIPGAtnmmtVJjWoaXADOsJQW7vz7NKLryr2wq2Pmp9cGq7TBlk5iweGWWUFQn5TEjqTJ+mOjRRSvE6oKlBai2oQ7tliHURMYsTHK5CJO+hE/4QDuABFN5wd87ILfVomKW+lptTXnKZIh+JcDeEgkMWdr4ly8/YRT3FDSOZ/geTZ2v1GRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFKngCQZqLoyFqGbydFHmuNuC8qRnEip5K7rvaLg8IU=;
 b=CuecHEDWKEpGlDLCUlAvcS9X9Fqe6vKLriu+KkWMRqOnomOft4V4i+Z+NwNWr4P9yG9esXDdUaCySdym8/JG64D8rvbTnruN4gwieJIP99mgMnokfpzyiFE07Mga47ZFszfEn3TslwSE6YBotgtosHWb3DphF2FdSpVXVOgsQn+rychsl0mjATu0WyW84LyHT/XtoprXigfQt9/N59j7foG1zoiSvSLB6dyyllqSnQPZV/CJHEZVkmYt3qh85H3wyQKic2JfVST6FD5LcKGym7NTOdHfuuAztE9F/7Gt0RFHcduYurXhPqvvOx+z3q9dXxgoAxm79AOoc4ROpxrqqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB7042.namprd11.prod.outlook.com (2603:10b6:806:299::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 27 Jun
 2025 10:03:29 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Fri, 27 Jun 2025
 10:03:29 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Jani
 Nikula" <jani.nikula@intel.com>
Subject: [PATCH v7 3/4] drm/xe: Move struct xe_vram_region to a dedicated
 header
Date: Fri, 27 Jun 2025 12:03:07 +0200
Message-ID: <20250627100308.3401653-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627100308.3401653-1-piotr.piorkowski@intel.com>
References: <20250627100308.3401653-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR02CA0007.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: b0898c9c-dd5d-41fd-cb73-08ddb561ddec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blBXeG53K2lDWWJ4Qm5Ga0NSRzNsNVJaZUNia3EwdnFLT3prcGVqTVhrbitY?=
 =?utf-8?B?ZXlXTDMxemZQbm4zc3JnREN5ckNJcTVDNHZUQ2ErUzdORCtaWDJIOTVhNGZO?=
 =?utf-8?B?TVZEd1NnKzNpeHhtbkN4YWs1OExuMU56UWo4d2EzRE1rQzJuWXMxb0VvSFFO?=
 =?utf-8?B?dDFmRmRZMW1LK1FlaFRhVjBhcnFWcEFqVTJFWGVpQ0Y1M0NxQnpqTXR0dlhP?=
 =?utf-8?B?Y3NFc0RXQThQREJ0eEF2eEtVNkVLQUM5SlhFR1ZiMU8xc3B4S0FHanJjVURr?=
 =?utf-8?B?VVJ4NjNDbGlISG82VGVTMUdlZy9FQTZlTUk0N1hmTjZrYm11Y0RYVUM1Z1FS?=
 =?utf-8?B?N2wwTGlkbEtRelRNR3NGSmJ1bHZaV1JpSnlXWUp0V3N3N0lWMldCVVY4VDY3?=
 =?utf-8?B?SllrT2RpMXlmUENqZkdab2Zya1lpRnRpeDU3eXY0bHk4TWJWMVhZMU5DcEI3?=
 =?utf-8?B?QkFSdjBtNUoxUjIzN3p6SDZhRjM0dTNxVEJhVVVKRE9QNFFmUzZnc015eHNE?=
 =?utf-8?B?SmxhYVlNdnl3dVpRalMxTHBkbVhqYVpsUUNja3FCTDF0ZzdkdjAvd1JWTHpY?=
 =?utf-8?B?UGlyNHdJRi9rL3dVNWR4STN0dkFKK3oxQUVWK0FZL0VFQzk2NTEvU1pBZzht?=
 =?utf-8?B?emMrY0tjWEx3TXVIalFia2QwajdNMGVMdnVNYzFuUGZ1cm04ZElLemVGZi9y?=
 =?utf-8?B?eDdIREY0dVNVZXhzTmU2Y0RnRklLUnU4NG9yTWlYTWw2MWcvdGhieGNBZEdy?=
 =?utf-8?B?V2VQLzNjMXFncFozdlB4V2hFVTZtMzJDYUFrbkNseTQ3Rk5sQTA5Q0JXSjBl?=
 =?utf-8?B?Y3ZKaXNldmxHd0VGOHk0ekZSRCtEU3JObk8zcnZZS2ROeEhnOW1pS3ZnemZI?=
 =?utf-8?B?dmRRdi8wNEUwb0VBNUN0L2c3SFh5SUUzNlhVeDhsbTJsRFZmU1JibC9hZFlO?=
 =?utf-8?B?Vit0MmliQk52bTV4SENBU1BNZE9SK3FWTEJaQ2ErZlh2YmVkWmgydU5vaFNP?=
 =?utf-8?B?ZFFWaXFYT2lZWDZMMXp4Rzh2S3lhSUxwZHN5TVNVQ29JTXhLRGpSTGZDSWc2?=
 =?utf-8?B?amRza25XZjNxRzFraVR0VkRzOWo3Zi9Ha09XaVRnWEY0NzdSaUp2aU9tbUFi?=
 =?utf-8?B?a2h4M3hhUkdNQ2NWUUVCYUxjRHl4Z2VGZXgrWGNWbXFEOXUrQzM5RUZqdXox?=
 =?utf-8?B?ME5rR0dJRGxwejdvTk44T1FoNDk1dzhiYzlUNzd3TW5ReUhJWTZ0YTg1Q1Fk?=
 =?utf-8?B?N0JTMlZTNDR6VzJIT0RqWHppNFhvRERPVFVYSkxsME9rWW04ajA3djRWU0J4?=
 =?utf-8?B?ZFJucFZGQWNWVE41bG1JL2o4aEFKVS9IejBibjB4UGNjb1FWZWFMZ2QwMlZK?=
 =?utf-8?B?ZU5PaTJzcVNtMXV2c2pZb2ZReW1TZUZ4a2xkSVYzZWFENmdCYko2NVVtT0I4?=
 =?utf-8?B?Z05KQTVCRW01aVJyejY2QjhZeXZYa3NCQ200VEpMN1d1azQrc0RURHZ3cmpx?=
 =?utf-8?B?YUE3OWc2U1N4ZHNKNnZEVmNMNC83RjBDdUVXWUdUdUV5RjczSXBiVnAxbW9G?=
 =?utf-8?B?U0FFOHM3WmJxV2pYejI4RjlSbHZMM293UnRoZmx6QmRBRCtEUXo3S3BWVEpL?=
 =?utf-8?B?Q3Q4QVpTOWZIb1VwZDE4VEV2T2YvVEJ5MU9HR0xsNGt3TTFBWFVqNm5HUXJF?=
 =?utf-8?B?aWNJQUdaUGdiWHdXcEVVVmVQbGhOZkphM084K0VXOSs4bVhqRWUzV2Vwc3d4?=
 =?utf-8?B?QlJmaDk4cm1iRENBY1hYcVpzTk96SlRtWFZxQXYyTmdHSlAzRXhCZ2xQQmpZ?=
 =?utf-8?B?ZlBRYmF1QXlQZkpzQ2M4M21veGhrd1V6NkROWTBFdkM2czFSWW5OQnd1cDFM?=
 =?utf-8?B?YjA3ZjZEeGJoaGdBbFRtSUdMQnpVV3NLNUdVTEwwUUFZckE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmxkMzRqR3B3alNocnRDMTltQzRESlJmdk1nSHNRSllpY0xrQlllZU96WVBr?=
 =?utf-8?B?K1BGMzBBOXFMd3hnNjc5T0hjeTZReVpXdzkvR0hVZHRpc3h6Z0QyU0JzK1ZY?=
 =?utf-8?B?WEgyTVBGekx2alZGSEFsSEZYTHFMWnhNMi9sNWJjaUpsS2dyL1VjV2E2SEd4?=
 =?utf-8?B?OXpTODRtNlBrUWk0QmZLUHBWNGxnb2tiblM4WHNKNDAveTdsNC9vSFdWeHN5?=
 =?utf-8?B?VHNtSnErUzZBcCsydnM4TTF0dGxQRGFrajhkeUZtR2FrWGJOalFaVHB2RDU2?=
 =?utf-8?B?UG5jdGsvU1NTcHZDLzRzeVN2NVV3YjQ0RUpMajBOOFR3dlJYWVJiRXQ5Tjhp?=
 =?utf-8?B?OG9hRVVWVVQzSVVrM0J5NEhoUGFkYTdJdEc1cFUxbzVia3pJemtjSG0rUFVB?=
 =?utf-8?B?elNkS2FoclkzWnJ0RE9LOUN4NTYyYlBvMUFIUEoyYjc3bWxnZTg3RHM1Mmwv?=
 =?utf-8?B?bUQxNkliZWUwSWI3L2UrbU9lNzdBMXNEY3hUWURPdWVYbEFaOWpCU2hNMU82?=
 =?utf-8?B?MS9QWHAyakVBT25mUlNsOGZJVkZGb0tlczVUWDlNeUVXTnFHNHRzSlFjQmdt?=
 =?utf-8?B?cWZ0WG9rSm1UNHg5U2pnTXR1MTJEdTJGOXV5aXZJVDA3VTVGZThiQjZ0cHN6?=
 =?utf-8?B?dDVNQjdSNHJadUN4OE1vclcwSCtKRWc1TWhqQ0gvcit3Qk9qVVEraUVUVEoy?=
 =?utf-8?B?MHF4OGFlRFVrREJzOC9FVytvUy9oRWJXMURmL24zWU4zOGdqeTFnT044cGpr?=
 =?utf-8?B?Wmk0Q3hZZDZWcmQ1YXczNVBFbEU1QktBNzZORjgrZEdyTENXT3ZvNVFjanc1?=
 =?utf-8?B?ZktCcTR5Tlcyc2xzRFNmYk9MVjZxZ2xIQUQxQkJlYnBIb0NoYXBzdnhFK204?=
 =?utf-8?B?VUdMUTdpbGh4TXJZNGtGam5UMGRWbzl4T1AvTlkzLzVxcDBoRDBXaGd1QlJL?=
 =?utf-8?B?YjVJU3BjMnJCaDlXU2NHSlhVK3kzbUM4QktRclBmS2JlUXFrZ1czUmZ3ZGIw?=
 =?utf-8?B?eUp3UyttZGFPUGhIQURqemdSZWM0RUkwL0h3WUI5bVRtVjhoaXJDU2pDREQy?=
 =?utf-8?B?VS82SUhpbXY1QndjTUxlbGJUYXZES3NDS2NETEVyUU5VeDZXZHMyczdBQ3cr?=
 =?utf-8?B?d2YxZ2NsbG0waFFmRlpNYWVudUZTam1naHJLZWtFemR0VndDT2J6V0NnWjNS?=
 =?utf-8?B?amtVTjEvZURMWTVNTGN5UUxtSzB4ZXdYa0pWMHNCbGVXWTIrcmF3V2RzUlpo?=
 =?utf-8?B?N1hvdVdsWXdQWWkzMVI5VjRVSFFlVjdzRU9wRHkwMTRQYUNrcTZuVGFkSncz?=
 =?utf-8?B?djBYTmoxQzNSNGlaUzdWTnhCRGNWWEVWaEM0SVh6NGtCcTgxc1ZYOHNXdWlE?=
 =?utf-8?B?M2hMRHlyWklURGtaNUt4RVNia20xc0k4N2JHdEkvNzgzU01vY2x2UnZFZVVM?=
 =?utf-8?B?dnhWT1UyVHg0V0UzcVNxSHlGVzlTNzhIdWdHQjl3cVhueWlyWVk1RHhKbWVa?=
 =?utf-8?B?djM1RmV1Z21zZnREemYxQkNldE9LQU1URUJDZyt0NDFqcFdoRVdpSGx5NDhM?=
 =?utf-8?B?anp1aVhwWUdkNXE2eXlwbExKaCtydVFaTFcydDhlOGFKeEo3ejkrZTdGS1NK?=
 =?utf-8?B?THNrLzJqNlZkUVFjZDhmT3pEZjhGRHp4RC8yeEc4Q1JncTRXYUh5TldGUGx0?=
 =?utf-8?B?UGVtbGlvZE1oVUozVkE2aFdQbUJqMmhHdVFJTFQ1SFZaODBrYllTQ3kyTFR5?=
 =?utf-8?B?ZlZvOWZ2SDl1OVlPY3VjN3lQTVEvM0pnd2dySUNRaXU4VnBRQTV0cFRKTk9i?=
 =?utf-8?B?QTRjMi83SnAwOHhPejBjdDNQZHZxL1ZsaVN1c2oyWVJaMlh6SEtPQXl5S0hR?=
 =?utf-8?B?NHN5NmRUcWtvaXBYNm1QVTNjK1F0dVM3WW1lUEJtdmlGMjMxWmJTdU50L244?=
 =?utf-8?B?WFNxUS8za2RQZmxzd09xcVdNQzU5ekFneDFmeFRoMVZTWUx5UGNqTGdZZ3dH?=
 =?utf-8?B?QXNGYWZBSmp2VDhLZWlJa3JiTVVoYklIb1RRMlZvK25PVVJ0ZmVoTXlnanox?=
 =?utf-8?B?bXU2dnVGejlsV3RJckxUWThyV3VGYSthamRpdHZqOWg2d1ZTcUV2akxka044?=
 =?utf-8?B?Rkl5azBENVNoQVZDQzBCak83L1JvTS84SWdQRWl1Vi9KQWdPNVlnNU81akd2?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0898c9c-dd5d-41fd-cb73-08ddb561ddec
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 10:03:29.8342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++4QAdATnh4oLuyv+F3RwIzwzbkSEvlhHhCOzFioMc742xSZfdT8C+6BpnlLZqRhxAjnOBOce2+mwwIa71Qd6d9gCdgO/6jcDqSR8ijTn/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7042
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Let's move the xe_vram_region structure to a new header dedicated to VRAM
to improve modularity and avoid unnecessary dependencies when only
VRAM-related structures are needed.

v2: Fix build if CONFIG_DRM_XE_DEVMEM_MIRROR is enabled
v3: Fix build if CONFIG_DRM_XE_DISPLAY is enabled

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Suggested-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  1 +
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  1 +
 drivers/gpu/drm/xe/xe_assert.h                |  6 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  1 +
 drivers/gpu/drm/xe/xe_bo_types.h              |  1 +
 drivers/gpu/drm/xe/xe_device.c                |  1 +
 drivers/gpu/drm/xe/xe_device_types.h          | 60 +--------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  1 +
 drivers/gpu/drm/xe/xe_migrate.c               |  1 +
 drivers/gpu/drm/xe/xe_svm.c                   |  3 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  1 +
 drivers/gpu/drm/xe/xe_tile.h                  | 11 ---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  1 +
 drivers/gpu/drm/xe/xe_vram.c                  | 12 +++
 drivers/gpu/drm/xe/xe_vram.h                  |  4 +
 drivers/gpu/drm/xe/xe_vram_types.h            | 74 +++++++++++++++++++
 17 files changed, 106 insertions(+), 74 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index dc8547640d44..7d3633881c53 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -16,6 +16,7 @@
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_pm.h"
+#include "xe_vram_types.h"
 
 static void
 write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 97b58c0ff39a..056d771b24f6 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -22,6 +22,7 @@
 #include "intel_plane_initial.h"
 #include "xe_bo.h"
 #include "xe_wa.h"
+#include "xe_vram_types.h"
 
 #include <generated/xe_wa_oob.h>
 
diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index da357dd42546..a818eaa05b7d 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -12,6 +12,7 @@
 
 #include "xe_gt_types.h"
 #include "xe_step.h"
+#include "xe_vram.h"
 
 /**
  * DOC: Xe Asserts
@@ -145,9 +146,8 @@
 	const struct xe_tile *__tile = (tile);							\
 	char __buf[10] __maybe_unused;								\
 	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
-		      __tile->id, ({ string_get_size(__tile->mem.vram ?				\
-						     __tile->mem.vram->actual_physical_size :	\
-						     0, 1,					\
+		      __tile->id, ({ string_get_size(						\
+				     xe_vram_region_actual_physical_size(__tile->mem.vram), 1,	\
 				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
 })
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4e39188a021a..196acffe0180 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -34,6 +34,7 @@
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
 	[XE_PL_SYSTEM] = "system",
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index e0efaf23d051..368a2c51fe8e 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -9,6 +9,7 @@
 #include <linux/iosys-map.h>
 
 #include <drm/drm_gpusvm.h>
+#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 19019b032c78..4bd0619574ff 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -63,6 +63,7 @@
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 #include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
 #include "xe_wa.h"
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 56219984f347..619728bba77a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -10,7 +10,6 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
-#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_devcoredump_types.h"
@@ -24,7 +23,6 @@
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
-#include "xe_ttm_vram_mgr_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
@@ -36,6 +34,7 @@ struct intel_dg_nvm_dev;
 struct xe_ggtt;
 struct xe_pat_ops;
 struct xe_pxp;
+struct xe_vram;
 
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
@@ -68,63 +67,6 @@ struct xe_pxp;
 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
 		 struct xe_tile * : (tile__)->xe)
 
-/**
- * struct xe_vram_region - memory region structure
- * This is used to describe a memory region in xe
- * device, such as HBM memory or CXL extension memory.
- */
-struct xe_vram_region {
-	/** @tile: Backpointer to tile */
-	struct xe_tile *tile;
-	/** @io_start: IO start address of this VRAM instance */
-	resource_size_t io_start;
-	/**
-	 * @io_size: IO size of this VRAM instance
-	 *
-	 * This represents how much of this VRAM we can access
-	 * via the CPU through the VRAM BAR. This can be smaller
-	 * than @usable_size, in which case only part of VRAM is CPU
-	 * accessible (typically the first 256M). This
-	 * configuration is known as small-bar.
-	 */
-	resource_size_t io_size;
-	/** @dpa_base: This memory regions's DPA (device physical address) base */
-	resource_size_t dpa_base;
-	/**
-	 * @usable_size: usable size of VRAM
-	 *
-	 * Usable size of VRAM excluding reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t usable_size;
-	/**
-	 * @actual_physical_size: Actual VRAM size
-	 *
-	 * Actual VRAM size including reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t actual_physical_size;
-	/** @mapping: pointer to VRAM mappable space */
-	void __iomem *mapping;
-	/** @ttm: VRAM TTM manager */
-	struct xe_ttm_vram_mgr ttm;
-#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
-	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
-	struct dev_pagemap pagemap;
-	/**
-	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
-	 * pages of this tile.
-	 */
-	struct drm_pagemap dpagemap;
-	/**
-	 * @hpa_base: base host physical address
-	 *
-	 * This is generated when remap device memory as ZONE_DEVICE
-	 */
-	resource_size_t hpa_base;
-#endif
-};
-
 /**
  * struct xe_mmio - register mmio structure
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index a33a6f3a6731..140d55ebd476 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -33,6 +33,7 @@
 #include "xe_migrate.h"
 #include "xe_sriov.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wopcm.h"
 
 #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 0fc7875978ce..44dd1e3062c9 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -34,6 +34,7 @@
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 /**
  * struct xe_migrate - migrate context.
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e6871734ffa9..ee015e3f5d9e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -17,6 +17,7 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_types.h"
+#include "xe_vram_types.h"
 
 static bool xe_svm_range_in_vram(struct xe_svm_range *range)
 {
@@ -1006,7 +1007,7 @@ int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
 	xe_assert(tile_to_xe(tile), range->base.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
 
-	dpagemap = xe_tile_local_pagemap(tile);
+	dpagemap = &tile->mem.vram->dpagemap;
 	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
 				       xe_svm_range_end(range),
 				       range->base.gpusvm->mm,
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 47cb09edab33..87217d62d6a4 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -18,6 +18,7 @@
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wa.h"
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index fb0473fa9098..8dd87ccb2aca 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -18,15 +18,4 @@ int xe_tile_alloc_vram(struct xe_tile *tile);
 
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
-#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
-static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
-{
-	return &tile->mem.vram->dpagemap;
-}
-#else
-static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
-{
-	return NULL;
-}
-#endif
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 19bfc22b9706..dc94d133310d 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -24,6 +24,7 @@
 #include "xe_sriov.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wa.h"
 
 struct xe_ttm_stolen_mgr {
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index d9afe0e22071..585bc1232658 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -15,6 +15,7 @@
 #include "xe_gt.h"
 #include "xe_res_cursor.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 
 static inline struct drm_buddy_block *
 xe_ttm_vram_mgr_first_block(struct list_head *list)
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 7e3980bcb4e6..cf92a9aa2435 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -20,6 +20,7 @@
 #include "xe_module.h"
 #include "xe_sriov.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 
 #define BAR_SIZE_SHIFT 20
 
@@ -375,3 +376,14 @@ int xe_vram_probe(struct xe_device *xe)
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
+
+/**
+ * xe_vram_region_actual_physical_size() - Get the actual physical size of a VRAM region
+ * @vram: the xe_vram_region struct
+ *
+ * Return: the actual physical size of the VRAM region, or 0 if @vram is NULL
+ */
+resource_size_t xe_vram_region_actual_physical_size(struct xe_vram_region *vram)
+{
+	return vram ? vram->actual_physical_size : 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index e31cc04ec0db..9092ae86df22 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -6,8 +6,12 @@
 #ifndef _XE_VRAM_H_
 #define _XE_VRAM_H_
 
+#include <linux/types.h>
+
 struct xe_device;
+struct xe_vram_region;
 
 int xe_vram_probe(struct xe_device *xe);
+resource_size_t xe_vram_region_actual_physical_size(struct xe_vram_region *vram);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
new file mode 100644
index 000000000000..f4e06c9a4648
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_VRAM_TYPES_H_
+#define _XE_VRAM_TYPES_H_
+
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+#include <drm/drm_pagemap.h>
+#endif
+
+#include "xe_ttm_vram_mgr_types.h"
+
+struct xe_tile;
+
+/**
+ * struct xe_vram_region - memory region structure
+ * This is used to describe a memory region in xe
+ * device, such as HBM memory or CXL extension memory.
+ */
+struct xe_vram_region {
+	/** @tile: Backpointer to tile */
+	struct xe_tile *tile;
+	/** @io_start: IO start address of this VRAM instance */
+	resource_size_t io_start;
+	/**
+	 * @io_size: IO size of this VRAM instance
+	 *
+	 * This represents how much of this VRAM we can access
+	 * via the CPU through the VRAM BAR. This can be smaller
+	 * than @usable_size, in which case only part of VRAM is CPU
+	 * accessible (typically the first 256M). This
+	 * configuration is known as small-bar.
+	 */
+	resource_size_t io_size;
+	/** @dpa_base: This memory regions's DPA (device physical address) base */
+	resource_size_t dpa_base;
+	/**
+	 * @usable_size: usable size of VRAM
+	 *
+	 * Usable size of VRAM excluding reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t usable_size;
+	/**
+	 * @actual_physical_size: Actual VRAM size
+	 *
+	 * Actual VRAM size including reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t actual_physical_size;
+	/** @mapping: pointer to VRAM mappable space */
+	void __iomem *mapping;
+	/** @ttm: VRAM TTM manager */
+	struct xe_ttm_vram_mgr ttm;
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
+	struct dev_pagemap pagemap;
+	/**
+	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
+	 * pages of this tile.
+	 */
+	struct drm_pagemap dpagemap;
+	/**
+	 * @hpa_base: base host physical address
+	 *
+	 * This is generated when remap device memory as ZONE_DEVICE
+	 */
+	resource_size_t hpa_base;
+#endif
+};
+
+#endif
-- 
2.34.1

