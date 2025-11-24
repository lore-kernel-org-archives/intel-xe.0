Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775CFCFA466
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 13:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3632E10E2C8;
	Mon, 24 Nov 2025 13:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZG4Ho0Qt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1229F10E2C8
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 13:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763991827; x=1795527827;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=y5c7Yxlm9ZTXW/tAa0csmzuyXuLv0imiYbHsuLEcOLg=;
 b=ZG4Ho0QthTGnA0yyDNI2m4y5D0JI2UDhUF6YryI9tpuAbObhhIQQO9OE
 d7VI3lfCjMuOjHtyqiG9pzubwzznk4eLLjHBJpStW8CGIK+bPhS5Hxg8w
 KSHCDtIFrW/qmlx2xrSKeyxkuZZGjQuJwKZHNIKr9DWB9MtCvda7/ytpX
 d+3FGM4fPibVGn/wTaz8CsnSdL41Ol15TrcukXKPQVBBt+oQeTsMqI2bB
 GuPh19dzNZZyRt+GlqnfO9bJ/Tim+NoGVEj5VIS8NJAXX1WyEDzFT88I1
 M2RwPvID2GBQsxCrclrgK1IH/2ttG4Ih3gpR4yGSZf5M5HNP83qnykV35 Q==;
X-CSE-ConnectionGUID: 7OLeUjxFTTqOsLkUuA2v+Q==
X-CSE-MsgGUID: t64Zf50RQjeEBj782BoPwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69607159"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="69607159"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 05:43:46 -0800
X-CSE-ConnectionGUID: oogFpWJDShus4k1OftvR1w==
X-CSE-MsgGUID: Vhi3Rn6VTNi/QFyiu5ooAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="196792707"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 05:43:46 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 05:43:45 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 05:43:45 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 05:43:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTL6alslN41A5tdu8Y39SYfPLnIaXyJ23/DZbipVD/n+3/W9BcFwujabQefpMRHoO/f6gTeyza5NyCzwborBDnvEtpB6LFNANjex0S+8zFohRqTrS970ZoDACiY/+EgW5HGiSMMGGpQkCpZ6JfzgSK3rEv85d6ohUH9trSBdwKJAXcox4aym2Jc5DRPZDtFsIx1IqJBIvXs9gU6X6oQvi7pnwx2nJ+bJJQTuzDbNzSq4Gu8Ra+S2VmwWtcQtKWsrQ0wwz3frvcYw03mEYvQorUTA2ZuWgotdCvL3ZR662H7qQerBVL0W1grWy2m+8WvIhw9FTIxyK7C0DUPRVReGug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okArpC84mqAAhWdHsYfh5zSJbg80onOGrIoStelKFFQ=;
 b=f0EtwlQX/Yzprphj28LAZFiW4UdUz/KVTPIn4GBtyrZj5rV9ILkxN7FXl9buHkAaW19YphU35j0t1QuB3XZl9riEqVyxiCK9b+un6zr/VXlh6CnYNVrKDO8xLke9KM3U5WBuochswjFDAmT9lbwZ+QY8O6lujBo9+dw6wbWGrm/jLsikJs+CwHzHajxrTGV5AVD1q6fQIM4F1frNJhaK0yZtUPJ8b0RCXRlEVgYDCN5Qdz/qYQl30/MmhjejhLwBcinZ7Z12azIPB48KPJITxLDKoiDKlX8KD26GSHSyDj4V+qEV27tqjigbSqQz+KiMdyAcHJDg9/tDFwl1XnDXkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7334.namprd11.prod.outlook.com (2603:10b6:8:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 13:43:43 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 13:43:42 +0000
Date: Mon, 24 Nov 2025 14:43:39 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 3/4] drm/xe/pf: Add TLB invalidation support for MERT
Message-ID: <20251124134339.cauzham6bamvnww2@intel.com>
References: <20251031080501.844-1-lukasz.laguna@intel.com>
 <20251031080501.844-4-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031080501.844-4-lukasz.laguna@intel.com>
X-ClientProxiedBy: WA2P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: 02443b3e-d94b-474d-1fe1-08de2b5f7b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YysyVFR5QmpxTmRHQXJkMklNckUydzU1bnFzbXdiem8rY0wzOWRBRE9VN1RC?=
 =?utf-8?B?Yk5raC9oYml0anNlK3hXYVYrb2ZjWVNvZ3RRYUp0bFpaZlEzaVJ3K09KMENo?=
 =?utf-8?B?akRoS0FTT0lYaXZCNUFPeGdmbEN4T3VIOTEzMVBYaU4yeDhVeFoxVVZhcUVP?=
 =?utf-8?B?UkZyNVA0N3k2QkFINVZTVmkzVDArMSthaHpVdDIxYzRmbGFIVWk1N0hTT2Jy?=
 =?utf-8?B?WkV2dlU3Q1YrWmV2WHpoWTZKWTluUGd0bHBuMW5sb2hSYjdXRVJNMWxub0kx?=
 =?utf-8?B?ekN0enc5ZzZkVXJyM0Q0cWUxeEV3MThKUk9pMEpkSmk2OHJwT2VwOXpoQUxD?=
 =?utf-8?B?emVyUSs4cnRVVDRISFFDTkVoNHVRUG5rcmJGcEhTMWZIUWl5NVJYOUJZZjYv?=
 =?utf-8?B?Wnk3MW0yMmRrcCt1cytNMFNadEVHYk5EMkU1cWdTUGIxdHJjN2dva0hFWkF6?=
 =?utf-8?B?RXo4NjZORmFsWE02OUNXaUxHb2dxdyszdXNZdzZmUU1RTjUvNTgzU0hmTnBU?=
 =?utf-8?B?c3l1eDNiUWVIVmhja281L01nMVdHSUFVZ0htek5ySjFOM3VQS2hOVkVPY1k5?=
 =?utf-8?B?bzRXWTh0VDdyamhZLzMxdXRUektsL0RWbWdER2ZqUTRQK3d3d29XYWh6dFJm?=
 =?utf-8?B?WTUvVWlkYlg2eDBKcVdhQ0lOL0c0N01ieUlkMXNzeGlmREoweTE4TlFtYnZR?=
 =?utf-8?B?NWhmd2Y2YTZ4cjVCN0RraGZwZndXOFdka1F4cCtUbDUyTXhQcXhUUVU1Z3RC?=
 =?utf-8?B?aXJJZWpWVTlmSXZXUkF2OThCbnhBRmdmYktrQnV5a21JWUptUmRTajIzZWEr?=
 =?utf-8?B?VVV0VTRlYVVuWlVSTjVQWDFvTHVoU2o1R1MwTjBtNGtEYkFVWU05SXo2Ykwv?=
 =?utf-8?B?N256R3VvVzlOUm9IZFEvQ2VlaUtoTWh2YWQ5c015WmVTZC9nbi9JWkg2QWNr?=
 =?utf-8?B?QUsrT3ZoYzRyS1BaWUhoVlgzbCs1Nm05V21SVHc3UkFmR0g4b2h5TlpqNGFR?=
 =?utf-8?B?Y2hvWUZLdmdLWFczeEFpWlY5V3VHSzUzYk44dmx5aXVNdksreldZeXk1V2RG?=
 =?utf-8?B?QUU0WDFkWTFWd25ST085ekUvQk9nQTZPS3ZKZzFRMnlOR1pac09SZWVMd0JJ?=
 =?utf-8?B?SkRQRXZhUjlEelArZ3JQL1lNMGdtbXNEd1UvYlRwcW5kZGUzOE85U3ZES1pT?=
 =?utf-8?B?ck5pa3NvTzNMY2FjeTFHVXM5SjZIbnNhRksyaVYwMG1jYzhXNEsyOWh6a2tK?=
 =?utf-8?B?TTYrUEk2QTBYLzJkQ2VuRU94QTBnZmNyTHlWTlkrdFFxWkEvQTZweDcyS0xm?=
 =?utf-8?B?OGF5WDdoM0JreVM0dm9vSkU5TWkycXlkTm1tU0Q1S1ZYOU1xazhKZ0JVRll6?=
 =?utf-8?B?WWlSazZxUVNQUjVDWjliUzc2OGlRTGF6MlF0d0ZYbXovejk1NS9aemZRenlp?=
 =?utf-8?B?THZIZXZmMGI5eUlWRVJORWtrV1JPQUVRc0duemdyUjlabWdFQnJyQ2xNZm1X?=
 =?utf-8?B?dndqdjF1U2pBdUdIb0dzdHNYbkl5U0hHdnZla3lQUm5rTkhCZVFTQWJSdE1m?=
 =?utf-8?B?Wi80TkJRVU9mVnlUUHZ5VnN4ellVSlM0MkpqaU5BQm9xTDdWSXJHcVFLWGVo?=
 =?utf-8?B?eERyQlg0VnRUYXdxeGtnaGxQTTZFUHFqd0ovaktwbGFaRDJwOVRtemVlc0Nl?=
 =?utf-8?B?eDdTWGU1TXBXODhnTG5nRHFrQjQyekxiaUVnYnR3OUlac2RYc3RQNlRDRjl0?=
 =?utf-8?B?S0l5N3J3MFJuTk9YY2M2Mmo4THVzaDhSbTlKb3IxajR4bXdHVTdOTDRiUUda?=
 =?utf-8?B?S1dia3lIcnRmcCsyUWRWUzNUTmEvRTBWcVFha0xPR0ZYRVlMTWR3TUdldFpF?=
 =?utf-8?B?aXJaTk1YRXduNVVVbVk4TVdJS1RkQnVZWVRWa245MmJxOCtUL0doTzFaWXRs?=
 =?utf-8?Q?gVUxd6KOsKUYmDKIek0qhMSfZLkXHIx0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVVQb2ZoT3AwVXhYU1hkd05YOG1Vd3ZDK2lvS2ZlT09XaHFiaG0zSHJPcUdU?=
 =?utf-8?B?UVlXaUVxZHM4U0x3RVhVaUFZS2poQys5OWRXZGFERXZQOThWL3J6SS9NYXRu?=
 =?utf-8?B?emVEaXczdkxQTXpFT2svUTliMUI0T2FIdjdONWNNSDBMVHFEQmNXVmc0aHFL?=
 =?utf-8?B?SVNKSUl5WU8rSnZxUjJIbXJ0RHNJUmxmRUhRMFNRYVkrVEJDd3FvL05iNTlU?=
 =?utf-8?B?THJxNUwxais5K3hQeWdBUmczYXJFTGRYbHIyZmlqQTN3cG9KMUppbXlkWW5M?=
 =?utf-8?B?Nm9wbG1GTlJYWEdHUHlja1ljY1BqZm42dkVlUXVjSUlEMmEzN0crMWRWWXE3?=
 =?utf-8?B?RDBjWVJhL2VKL0RHbTlQNFp2S2tyRi9SbVYxQUNHMnlZelhpM3M5SUl5TWRV?=
 =?utf-8?B?Q2Zrdm1SQUREWlc3QUhLZXdQc04rTG1QYkZXY1pteDZ0ek1vNXk5a0g5a2dq?=
 =?utf-8?B?T0JzQlE1TTJidnNFZVBNUFZjdzBITnBQVGhRSzJuTkhXNVcwNWpjZ1UybnpP?=
 =?utf-8?B?RE9LMXhqYXR4djI1YlA4bUo5bVU5dFM5QmlvRnNEMWlrRHl2eTRDeU5FdFZJ?=
 =?utf-8?B?NFZFQy9wc0xLVGF2VC9BUisvajVmdkoxeDRaY2xxWVgvYXVubHlCMkUvWC8x?=
 =?utf-8?B?T2ljUVc4QkVqSjJyUjZmV1RGZVNraFVDNnNDTTdhVXJEdDVHM2xnQUlCUmlV?=
 =?utf-8?B?Y1BuYjZsdWpjMjRUY0lXbDA1NGtkbWNtU3kweFFaQU43OFBnLzVsRFBxSkN2?=
 =?utf-8?B?a0N4WG1XZWpjWXY0Z0VTNVg0UVBGbkJyckxSUjc1UDU5Yjd6eUh0OWxPaGVF?=
 =?utf-8?B?WWdJdC9OV0lOZFVYOUY3UU1kVTQ1aERRbGNlVURaQjRzWEYyb0d1dEYycTFl?=
 =?utf-8?B?cFNic0ZlNW8vaHcreDF4TEovRHZocXRPKzFNL2JWWTlwazNhMmRtUVZtQjVG?=
 =?utf-8?B?cXZjY0txYTNnN3U1SENuY1NMODE4Vmd3NHRiWVJDOGo1ZklaU3RVSm9Ea0Ny?=
 =?utf-8?B?dkdHMG16MVVhZWYvS25mMHR6ZUdaZXBaeEgvWWFWc3JUVG9WNGp0WWZMUGxl?=
 =?utf-8?B?WFBPdDQ4ZEVoUWh3dzFmTFZJZnVvU0NxOFlvbGcybW96Uy9FbjI2MS85WEUx?=
 =?utf-8?B?dEtMTlZNL2J3OVBUK3duYzhjNE5IcHJIakxjUi9FUjVzdVcvS0VMTXNzSzNO?=
 =?utf-8?B?RXlsTUhBY0NFOUM3ZERjMzlPNlNsbmRUR0FOd1dieS8xVGpmV2t6YVRXdXpY?=
 =?utf-8?B?U25OU2k0THhrejRkY3A5eklSTlB2emQ2U0hKbXBwS3ZPWUpwMVY2NmJldXBz?=
 =?utf-8?B?UFN5SVlUSEdUeXpEMjdaYVhPNHdEMUw0b05ZckJvTGVRNVBTL3lhL1NHYkI2?=
 =?utf-8?B?MFlBTDhBYlhwbjRpTlJILzJZUUpMaTRpT3VtWXNaTnk0YVRTK3pEOFNIVUtr?=
 =?utf-8?B?ZW0xS2xXeVdGTGVrMnNBZjg0ckZla0dqaG9kaUtFVE11WUhWTFJHR3NKd1Vk?=
 =?utf-8?B?dzVOdEdZYWJXelprOTFwb1ZoeWVJRW9RelliNEY4SmJpMkFHSnZJNnhhQjZT?=
 =?utf-8?B?MVFSczZRbTNuSWdMT0dQZWJoNjNkZXJOMW5jc2F0TTFaTHRWVWNqUkxQY2NW?=
 =?utf-8?B?Zmp6YTduVXQvVEZqN29Ed0wrL0VmejdLOEVmZHQ1L0dTOXpCQ1JIL0ZOOW5u?=
 =?utf-8?B?VGJEZmNmczREQlZ4VXRBQmdFS3FyN2l3UXcxZDhFTVdlSk1ma2VDaGtNNE5t?=
 =?utf-8?B?aS9ueVIrK3RTWVZFL3lIbzQ3Z1ZVN2ltc004UCtrL1BsZXJ2aFpkZzE2ZDIw?=
 =?utf-8?B?NUFGa2o4SFZLNDU1UWpLVmVLUHRxNG1oMVpkWnNHbEdZQkNWSEowb1NSLzNS?=
 =?utf-8?B?d1h2UUIrTW1BTVJtMlRDRTlDdnBSYitJVkZ0ZVduQjhJZ0t1WjR5ckJrKzha?=
 =?utf-8?B?VUZ3cDlTdURScDcxTWpoYjdhK3JEaEt3M0t0d2ROUlpOOFZ6REdPaXo3STRi?=
 =?utf-8?B?bURNTThsT3diSmhGbFVOWkZJMTFXUEkrUG5pcm9pYUFWMmc3N3JjVHQ1enZF?=
 =?utf-8?B?MkQrTElYSk91ZjlaTzhQVWtOSHVYMk56bFIxRGVqN3pnZUdHMDE3YjEyZ0g1?=
 =?utf-8?B?VTdvU0paclRJTWRla1pRdWhRdTNINXJ1YnNvcld1TEdwNWRTcTR6ck9yc2ph?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02443b3e-d94b-474d-1fe1-08de2b5f7b5b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 13:43:42.7724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9f4qU14SREl3W3Yj5V4GoyqfyJCrhV+LpsSGjJz7w2DCr5wcWFYj2ZuLLfI+SEaRD4yIbgy1cNAaQ6OYbSW94OCMRyG1U82Qn0qbAZKBDyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7334
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

Lukasz Laguna <lukasz.laguna@intel.com> wrote on pią [2025-paź-31 09:05:00 +0100]:
> Add support for triggering and handling MERT TLB invalidation. After
> LMTT updates, the MERT TLB invalidation is initiated to ensure memory
> translations remain coherent.
> 
> Completion of the invalidation is signaled via MERT interrupt (bit 13 in
> the GFX master interrupt register). Detect and handle this interrupt to
> properly synchronize the invalidation flow.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v2:
>  - squash commits (Matt Roper),
>  - fix locking (Matt Brost, Lucas),
>  - move the implementation to xe_mert.c (Michal Wajdeczko).
> ---
>  drivers/gpu/drm/xe/Makefile            |  1 +
>  drivers/gpu/drm/xe/regs/xe_irq_regs.h  |  1 +
>  drivers/gpu/drm/xe/regs/xe_mert_regs.h |  3 ++
>  drivers/gpu/drm/xe/xe_device_types.h   |  4 ++
>  drivers/gpu/drm/xe/xe_irq.c            |  2 +
>  drivers/gpu/drm/xe/xe_lmtt.c           | 15 +++++-
>  drivers/gpu/drm/xe/xe_mert.c           | 71 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_mert.h           | 32 ++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf.c       |  4 ++
>  9 files changed, 131 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_mert.c
>  create mode 100644 drivers/gpu/drm/xe/xe_mert.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index bfc72f3dd61b..e2a7e460c2d9 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -172,6 +172,7 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_lmtt.o \
>  	xe_lmtt_2l.o \
>  	xe_lmtt_ml.o \
> +	xe_mert.o \
>  	xe_pci_sriov.o \
>  	xe_sriov_pf.o \
>  	xe_sriov_pf_control.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> index 2f97662d958d..9d74f454d3ff 100644
> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> @@ -20,6 +20,7 @@
>  #define   GU_MISC_IRQ				REG_BIT(29)
>  #define   ERROR_IRQ(x)				REG_BIT(26 + (x))
>  #define   DISPLAY_IRQ				REG_BIT(16)
> +#define   SOC_H2DMEMINT_IRQ			REG_BIT(13)
>  #define   I2C_IRQ				REG_BIT(12)
>  #define   GT_DW_IRQ(x)				REG_BIT(x)
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> index 5b7c15e08747..aef66c04901d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> @@ -10,4 +10,7 @@
>  
>  #define MERT_LMEM_CFG				XE_REG(0x1448b0)
>  
> +#define MERT_TLB_INV_DESC_A			XE_REG(0x14cf7c)
> +#define   MERT_TLB_INV_DESC_A_VALID		REG_BIT(0)
> +
>  #endif /* _XE_MERT_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 0b95d6539bc0..38623def6f30 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -17,6 +17,7 @@
>  #include "xe_late_bind_fw_types.h"
>  #include "xe_lmtt_types.h"
>  #include "xe_memirq_types.h"
> +#include "xe_mert.h"
>  #include "xe_oa_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_pmu_types.h"
> @@ -219,6 +220,9 @@ struct xe_tile {
>  
>  	/** @debugfs: debugfs directory associated with this tile */
>  	struct dentry *debugfs;
> +
> +	/** @mert: MERT-related data */
> +	struct xe_mert mert;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index e5ed0242f7b1..919ef19149be 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -21,6 +21,7 @@
>  #include "xe_hw_error.h"
>  #include "xe_i2c.h"
>  #include "xe_memirq.h"
> +#include "xe_mert.h"
>  #include "xe_mmio.h"
>  #include "xe_pxp.h"
>  #include "xe_sriov.h"
> @@ -525,6 +526,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  				xe_heci_csc_irq_handler(xe, master_ctl);
>  			xe_display_irq_handler(xe, master_ctl);
>  			xe_i2c_irq_handler(xe, master_ctl);
> +			xe_mert_irq_handler(xe, master_ctl);
>  			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
>  		}
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index f50c5a4b9edf..3059ea6525bc 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -15,6 +15,7 @@
>  #include "xe_tlb_inval.h"
>  #include "xe_lmtt.h"
>  #include "xe_map.h"
> +#include "xe_mert.h"
>  #include "xe_mmio.h"
>  #include "xe_res_cursor.h"
>  #include "xe_sriov.h"
> @@ -270,19 +271,29 @@ static int lmtt_invalidate_hw(struct xe_lmtt *lmtt)
>   * @lmtt: the &xe_lmtt to invalidate
>   *
>   * Send requests to all GuCs on this tile to invalidate all TLBs.
> + * If the platform has a standalone MERT, also invalidate MERT's TLB.
>   *
>   * This function should be called only when running as a PF driver.
>   */
>  void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
>  {
> +	struct xe_tile *tile = lmtt_to_tile(lmtt);
> +	struct xe_device *xe = lmtt_to_xe(lmtt);
>  	int err;
>  
> -	lmtt_assert(lmtt, IS_SRIOV_PF(lmtt_to_xe(lmtt)));
> +	lmtt_assert(lmtt, IS_SRIOV_PF(xe));
>  
>  	err = lmtt_invalidate_hw(lmtt);
>  	if (err)
> -		xe_tile_sriov_err(lmtt_to_tile(lmtt), "LMTT invalidation failed (%pe)",
> +		xe_tile_sriov_err(tile, "LMTT invalidation failed (%pe)",
>  				  ERR_PTR(err));
> +
> +	if (xe_device_has_mert(xe) && xe_tile_is_root(tile)) {
> +		err = xe_mert_invalidate_lmtt(tile);
> +		if (err)
> +			xe_tile_sriov_err(tile, "MERT LMTT invalidation failed (%pe)",
> +					  ERR_PTR(err));
> +	}
>  }
>  
>  static void lmtt_write_pte(struct xe_lmtt *lmtt, struct xe_lmtt_pt *pt,
> diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
> new file mode 100644
> index 000000000000..304cc8421999
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_mert.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2025, Intel Corporation. All rights reserved.
> + */
> +
> +#include "regs/xe_irq_regs.h"
> +#include "regs/xe_mert_regs.h"
> +
> +#include "xe_device.h"
> +#include "xe_mert.h"
> +#include "xe_mmio.h"
> +#include "xe_tile.h"
> +
> +/**
> + * xe_mert_invalidate_lmtt - Invalidate MERT LMTT
> + * @tile: the &xe_tile
> + *
> + * Trigger invalidation of the MERT LMTT and wait for completion.
> + *
> + * Return: 0 on success or -ETIMEDOUT in case of a timeout.
> + */
> +int xe_mert_invalidate_lmtt(struct xe_tile *tile)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_mert *mert = &tile->mert;
> +	const long timeout = HZ / 4;
> +	unsigned long flags;
> +
> +	xe_assert(xe, xe_device_has_mert(xe));
> +	xe_assert(xe, xe_tile_is_root(tile));
> +
> +	spin_lock_irqsave(&mert->lock, flags);
> +	if (!mert->tlb_inv_triggered) {
> +		mert->tlb_inv_triggered = true;
> +		reinit_completion(&mert->tlb_inv_done);
> +		xe_mmio_write32(&tile->mmio, MERT_TLB_INV_DESC_A, MERT_TLB_INV_DESC_A_VALID);
> +	}
> +	spin_unlock_irqrestore(&mert->lock, flags);
> +
> +	if (!wait_for_completion_timeout(&mert->tlb_inv_done, timeout))
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_mert_irq_handler - Handler for MERT interrupts
> + * @xe: the &xe_device
> + * @master_ctl: interrupt register
> + *
> + * Handle interrupts generated by MERT.
> + */
> +void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	unsigned long flags;
> +	u32 reg_val;
> +
> +	if (!(master_ctl & SOC_H2DMEMINT_IRQ))
> +		return;
> +
> +	spin_lock_irqsave(&tile->mert.lock, flags);
> +	if (tile->mert.tlb_inv_triggered) {
> +		reg_val = xe_mmio_read32(&tile->mmio, MERT_TLB_INV_DESC_A);
> +		if (!(reg_val & MERT_TLB_INV_DESC_A_VALID)) {
> +			tile->mert.tlb_inv_triggered = false;
> +			complete_all(&tile->mert.tlb_inv_done);
> +		}
> +	}
> +	spin_unlock_irqrestore(&tile->mert.lock, flags);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_mert.h b/drivers/gpu/drm/xe/xe_mert.h
> new file mode 100644
> index 000000000000..2e14c5dec008
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_mert.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2025, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __XE_MERT_H__
> +#define __XE_MERT_H__
> +
> +#include <linux/completion.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +
> +struct xe_device;
> +struct xe_tile;
> +
> +struct xe_mert {
> +	/** @lock: protects the TLB invalidation status */
> +	spinlock_t lock;
> +	/** @tlb_inv_triggered: indicates if TLB invalidation was triggered */
> +	bool tlb_inv_triggered;
> +	/** @mert.tlb_inv_done: completion of TLB invalidation */
> +	struct completion tlb_inv_done;
> +};
> +
> +#ifdef CONFIG_PCI_IOV
> +int xe_mert_invalidate_lmtt(struct xe_tile *tile);
> +void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl);
> +#else
> +static inline void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl) { }
> +#endif
> +
> +#endif /* __XE_MERT_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index bc1ab9ee31d9..00e80f6d0634 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -88,6 +88,7 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
>   */
>  int xe_sriov_pf_init_early(struct xe_device *xe)
>  {
> +	struct xe_mert *mert = &xe_device_get_root_tile(xe)->mert;
>  	int err;
>  
>  	xe_assert(xe, IS_SRIOV_PF(xe));
> @@ -103,6 +104,9 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
>  
>  	xe_sriov_pf_service_init(xe);
>  
> +	spin_lock_init(&mert->lock);
> +	init_completion(&mert->tlb_inv_done);
> +
>  	return 0;
>  }

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


>  
> -- 
> 2.40.0
> 

-- 
