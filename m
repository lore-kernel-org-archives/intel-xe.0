Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FADFE77188
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 22:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3DA10E040;
	Wed, 18 Dec 2024 22:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/zoYkRd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AAA10E040
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 22:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734562347; x=1766098347;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SegTggfn/xUs8l4cODzAaqyI9vSbilUpM78jow26UYA=;
 b=c/zoYkRd72F+oV5QUc81OFRoS4yFZkPNPfvgK4ZE99XKdYS3fAMWVkKr
 PXtqordJ9iJNQVUFNv+i5X6LR6WFvLLCcasuOoWGrv6sA0dy4hT84se/D
 W5hlnLeX0ZweiSnzmri2yI/5wkoALTOUpjjR7feYwxOaGlIf3RCf3BixO
 TyBRL6cwn52j/4orqD0HHVCoX/N6+Rs4r3pGuUDQlyJR1bE7XLvC0agE0
 QThqVUg6IOjpk+T620eiy4pqUKzfBV4SpJhtiASiJ34fD4kEfYgqlKv3F
 jTe+AUIqMtOh964fAVqR5oKXDjyd6Fqu6l2OnWiJxxMswvI+5y1i/ChPl w==;
X-CSE-ConnectionGUID: L/9QMvVeSreUehub0vYoMQ==
X-CSE-MsgGUID: Hd6XliQTQMWvWT8FNTWcqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="22648382"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="22648382"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 14:52:26 -0800
X-CSE-ConnectionGUID: Npe2k5syS8iGpE1g4t4QtQ==
X-CSE-MsgGUID: 6Wzn1bbvTzm7vBYo94cCfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102612970"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 14:52:26 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 14:52:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 14:52:25 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 14:52:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uoV5fKwQxjrJV9Jj7s9ZvoOAG15xTSiTiDWBjp63/OKjmOYz7nK/RvElnlWXCLlckpXTuecYXKsL8U9IRmm/5ztOT5+spJewgeEGokW2QHs1k8GKxKs/ymYk0BK6qUHz0iuJbkHg5Z6pIKXuu/keffTMhelFBlJI15mzPmzdlaqaZnD+2NMA+Vac5qZMMUnwHi/im+tZIRHLzm3XYhT3fC0k33153GyzrkN7hFCZtEQXtAXLPOTQbIU+B+Y9SOpxAH0ulRCAIIZ04qJQNXn3DtwW1NX3heKZhDl2Yb2Mx6w43PBXOc7l42OVFwSuDBGBNZdetf6TwQP7FXCI5euQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGeeqDixXghvJPXqNPxVlw5J9eL3l7Ssy/Tl2QgwGoU=;
 b=UWFjCrdaaKzXr8L0JE9NXyHozUXdGbDjq0DD3VO6GqzV33PbMW+1Ie9DJFytBd4DhtoxCZ9bB4fqGN7GjiPzSI/cD13H6iEUpz5bWmuNeR0sWoKfxhMgoty5R28yi/GEnFpPAR7wydknB+z8w0UHRtyA1/gIcm8qyXGl0uocROokuz17zGv+2i5HjlSSLGSM51uJnebtyjq0t8hkXAfkES4N988fKiWpgpYv2/wARTe6NXqUlO+EL25fwhrQbyOmF2W5t0+N1qWTp64dH3hRCL5tUarmKqJGiBOueWFKMcBmSay/OO/D4+zuKCMUeusbX4DWhhKHKkI7DSI/R0u9Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SA1PR11MB5924.namprd11.prod.outlook.com (2603:10b6:806:23b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 22:51:43 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%3]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 22:51:43 +0000
Date: Wed, 18 Dec 2024 14:51:34 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <james.ausmus@intel.com>,
 <felix.j.degrood@intel.com>, <matias.a.cabral@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <shubham.kumar@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.olson@intel.com>
Subject: Re: [PATCH v6 2/7] drm/xe/uapi: Introduce API for EU stall sampling
Message-ID: <Z2NR9oP6zdD41RGe@intel.com>
References: <cover.1734427624.git.harish.chegondi@intel.com>
 <03e289da2ba0426649774b2a68569003c2aa0945.1734427624.git.harish.chegondi@intel.com>
 <854j322gl8.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <854j322gl8.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:303:8d::12) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SA1PR11MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: 760612bf-d735-436c-bff9-08dd1fb68aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzA4OEtPL1ZqM0VhRWlmcThva0duSFVrOFJldUhWalZlblBzeFFZNkhYT3Vr?=
 =?utf-8?B?WnR6NFFDeEpsQ051a3VPa3Zaa0tFWEJEUDV4VXFsak5heVYyOFJVamI2YXYw?=
 =?utf-8?B?OW9ZK3F4TUdyKzBHU0xHdm1IVStza21NNW5UTG5LVVdCYjJUQ2FtV0Yxakkv?=
 =?utf-8?B?L1lyY2x2QU4wbjZVVFUybHZ1Y2RiTWE0SkJjbDArMnFDcFdSR2xMS1JYVWc2?=
 =?utf-8?B?UWN2eW45Z3A0cHdEVm5WbnVWeVBBbDRrZ1dqRHExWUZ1aTFvNnh2akF6Y3hV?=
 =?utf-8?B?Y0l3MkVFTUZHRHNyVGgzTURjdGJrd3diVnVIRWttaWd5VDVLWG8yMk8vMVZI?=
 =?utf-8?B?ZkRVeXlmOEdKZXl3RUVOcENMb2FEMFJ4Vno4VVRWcG5FQlQ0MnMvY3ZoR1Ri?=
 =?utf-8?B?dWVHQzBqRzhyazRUSHZ5ZHNhTFI5eTBtQjNMZ0JqRTlRSkE4aHlEUHlPOHR2?=
 =?utf-8?B?RGNlRkQ2dlB6N1J1NlRtbVkyOXlZVzJrMlRGbU9WWjZLUjFmTmhPbjhVbUdX?=
 =?utf-8?B?UVkrVUtOdWdhLy8yVmRmRzhFcXdSWVlKa2NZbGEyZGdBUjc0SFBxQUJoQTZz?=
 =?utf-8?B?SklnTU5ENFpXYkd1S1I5RUgrY01ZdFFWNDFMQS9tZkhmOVU4VjVHaUNPalJz?=
 =?utf-8?B?Z0RDQUxUeWUxWDJXLzQ5WURpUlgxNkwyNXYyc0ZqSzE2VkVpa1pxTWlnQ2ZT?=
 =?utf-8?B?QUFtTnBEYS9MZmdnOUdGSUZHSXkzUW1Ra3draHVWNHJocjViZS9NWkVlYUQ3?=
 =?utf-8?B?emJkekxPWDhudE1uK1ZwNm9sOURwalE0V3dUMkk2aXBPTURoU0tiQlF3aU9q?=
 =?utf-8?B?SjEwbUQwc1RJeEhuSmRqRDdyOE53OUl4eGZoMlo4WnFkV0p6MmZGanlocng4?=
 =?utf-8?B?Y1pjd1MxaHdDTUhHSUVpY1BsVlh5elV4Zm10b0hnbzBzN2dBZkI5aUtJWWgv?=
 =?utf-8?B?KzFwQ2pxV2FiUmZvS2VnS0ZpZ1ArNy9MU2t3emE2RlcrNHh1UFVweDloeW5I?=
 =?utf-8?B?YUFNTHJlL2l5OUdqWGMrS1Jrbm5YdXRLVm1vYjdIb3ZKQlVkWTNBczZnYjFI?=
 =?utf-8?B?YmVEMXM2eXFWS0JBSXpyMFp1eEw5QU9RWWZBY0xJeVhIUmF0bStaL1U3aDVX?=
 =?utf-8?B?bmxDcGFxdWp3ZUhMelZqOGpDaVhJclBaUXRmOHA5RkJPZU9xd0xiNjJLbnU4?=
 =?utf-8?B?VjFNejlEOHlZbUJIbHVBd29QZTUwTm1mN25NdnpKVGhlZ1ZNOWUwWVYzYUls?=
 =?utf-8?B?SGhvWlZhVmMrNnJhdnIzaTI0WUFzM1NKZGpvdDdzK3AvcWpjRFBMSGxZNm02?=
 =?utf-8?B?ckVsWlFNdnVhTG54WWU2RWhqYjZ1ZStTcDNXaitjMnNQdng1T1NqNENPcXE3?=
 =?utf-8?B?dEhJRmVoMVA5WXVrT1V0QXIxUDNlalRuRGNpR011bzU0N05lQytkZm5ZZU5x?=
 =?utf-8?B?YzZYaGwrd1BhUEFiS2hIUWgwZmVqNU1HTEp1Rk5MNmlzQ2JBV2hadjBzcWRD?=
 =?utf-8?B?Tm41dmVqQ1RvVFVVbWlFRGRqNWdsYitmcE5KVGJEc1VkbmpKTUl5dDExMUFB?=
 =?utf-8?B?dEVRWFVlWW9VbVltVjhNd25BR0xwQVZtdU0xbWp4c203WGVtZFJlRlVhYWs0?=
 =?utf-8?B?algydzNzUEdtQ1RTUWt2SGxncTN0NXVCZm5wTFovUU5wckxOc1o1TUIyMHhk?=
 =?utf-8?B?SGJ5UGZvWFZzZTFISFE2QlpHL05OQnAvdm1kcENCbWJqLy9lVlV3Ti84eGdC?=
 =?utf-8?B?RlUwS2c3Zk1UdW85Y2o4R0dRWHlMZ3F5aWNFaEZvTTIzdGFNdERPOUt6MDdj?=
 =?utf-8?B?QWFuT0NYMHFXYmgweUx1dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTVLemQ3RjYwWHQ1eDA1SlMyak1DNEljYUFRZDAyN2ZYQ3hQbkxiZkY2d1dq?=
 =?utf-8?B?OFNUMUlOTUdjMjFrVGpxTGdoT2pLelV0d2lwTk5YcmJkZm1nZ1dsMmRlb2hh?=
 =?utf-8?B?dk02TWFWL1UvRGNJR2FYQWR5ZHlyRDZTSGR4YWdidlNiYVF3ZlZyS1dtMkJn?=
 =?utf-8?B?OXJqckRsaTRkVzNUenhMcGpsa2Y4alZQaDBrSVJUS0FDYTlXNzNjcTdYZEhW?=
 =?utf-8?B?NTJDLzlXb01BQWhlOC9hbkdEOWNkbERmWEx3ZlJDUVJSZy9IWU1NSFBBdits?=
 =?utf-8?B?b0pTM1JXZU5qUDlhYURxQjNGTWtoSkpZWWxxRENlM2ZiUUw2WWpnT0UxV05L?=
 =?utf-8?B?WEMxeHhVUENaZkI0VTZLWjZIN2Z3NWNXeVM5MDFuMXQxYWRVK1RlZFdjN2F6?=
 =?utf-8?B?dmZ5Vy8xcExjUkZDS3BKMURZWFFNbUZHbXZoU3NSL09VV0pxbWdYQ0VSQ0hQ?=
 =?utf-8?B?OWhvNU9zd3NMWkkyUGF1QnpxemlHRHNUd2ppTlBuVUtzMU5xeUpEaWs0d2Rh?=
 =?utf-8?B?NWdabmYzc3JxNzlrUmprMlZGN2ZZdVUvdUFKM1dNYnFJdDdWTjVrcklyMnRh?=
 =?utf-8?B?aTZmdEdOdis0SFdHbFpwTFhxZkphNWZQOFdBVDA1MDBvSnh4aFpRUzM0aGQw?=
 =?utf-8?B?ZWZpaXowR0FTZWZQVkE0YzhjYU9JZ3p6KzRFbTBkditoTXk1Q1JNNFRIeGhy?=
 =?utf-8?B?V25ZZjJXWUduVGNDYkdubUVKVVh6VUt4Y1lrQmJkRnlPUDNNNC9SbUo1L21x?=
 =?utf-8?B?Nml0UzVSMitqQmpoR2luVmZkRDBvZkNQaWhMQzlOTEE1ZnIvNGlXTnVDMnlv?=
 =?utf-8?B?WmFuU0xnQW9SS2pmcmxYY1ZiQ1JKWUVkS3RZMHE4dmJlY0FvU2JVRDJ1U2pq?=
 =?utf-8?B?SHJBVGJHa3ZnUmZxOXRQWm5SVDZlN2NVWjh5RUhDdE4zczlPYnl0bVpuUjkr?=
 =?utf-8?B?eWVsTlhGcVRtckxpdWxEY1pwMGcrRlFGQXQ5NTF5Y2oxT0k1WGw0azZ6TkRL?=
 =?utf-8?B?d1N0TmJpdk9DNWg5VUoyeVBvUkdxbGJCdS9MTEFtbkRiajMrSzhXVkhCbm9R?=
 =?utf-8?B?eUgxMWhDYk9sVmZOL0kxZlZ2QTZYeUx2QkZuOVB5L1JYSVFXd042Y0tPUGpq?=
 =?utf-8?B?dE4xZGRzSGRpbnB4M1hRbjg4UlBsZTBZVjdkRnhkSlRobllXM2VEa01qNnpt?=
 =?utf-8?B?TmR4UnZQb2xUR2F4UkhwZGk5cVErRUJWNEN4OEQ3TUdzOUNaRkRpSFBOY05m?=
 =?utf-8?B?TjFGWkZFS3c0UENVMFAxWHk4ekt0YVNRWEU3QmdHSnBjWWFjRlRQeUZtQ3pm?=
 =?utf-8?B?UnhSZ1lWV1lGdDVKdEJXbGF2OFZ4N2FOZVZTZFVtM1k4SVFDTHQ3VnZ6ZExT?=
 =?utf-8?B?NkJqeVlUTWFDZ0R4MnpOUUM0UTkwK0ljZFRJdnBHa0RUdGFnaU5VVndBRmxp?=
 =?utf-8?B?OTBlaU80NXVsOThFcUZoK3JQNlhZWUVkOTRONko2dnprR2RkODJKbk84bTFR?=
 =?utf-8?B?ZDZTcktjRHR0VVlLMmRTM1BsbnlPa1dqZnhxeEplRXRxUVhEMzM3NzY4eFMz?=
 =?utf-8?B?SUhnNm9EOGt4UFhvc0hkMFp1dzBMcFJvZHdIY0owZTBZTGdySDZHditsUG5s?=
 =?utf-8?B?bDdQeEJ4VWl5UWUrL2ZESk1QQU5PM0x1VXF0d2h5ckJPb2Z2UVNRTmFTdjV4?=
 =?utf-8?B?V1hFNGtHM3U1MEdrS0xSZGgrbWFBNU54MnpLOWErcmszdUNOTTZmblIyZzdS?=
 =?utf-8?B?SVV0VUhJTjNRUUtaaUtQOWZKVkVCK1NjbCtUcmsrbWdaUi8rakMxKzVFN1Qx?=
 =?utf-8?B?NEVWOGYzbmlKYXVQL2ladjZtcnNVWlMxOXp6SVRiTXRGWURrSDh2c3NpbVJC?=
 =?utf-8?B?Z1F0YkxVaFJoL1FPWEhVVThTV2J1MWZJQkphNnFWU3ZDVDZQK0VMMWU0VG5D?=
 =?utf-8?B?TDF6eDQyQ3ZJSTVzenBvNTQ1amJDOEY2Q1FRNURJSG1Hc3V6dU5iOWdqdmQx?=
 =?utf-8?B?MjFlYktjMzM0RXlaR1p1ZVM3K0xpQ0tCVXdwdDRLcWVlUGwrVlhWOXNXRGJE?=
 =?utf-8?B?ZzNGcUxKbi9SMHR6YlZwK3RCbGVkRU9CS3d0Q3BvVGNSbmxvTEZXV0cwamhq?=
 =?utf-8?B?Z0dJNm1NZkNiU2dwOFpaUmhwV0xESWgyUVNwQkpzZ2w5c1UzbWpYNWd2SUMw?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 760612bf-d735-436c-bff9-08dd1fb68aa7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 22:51:42.9218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VEMoXiUikI+py3n7b/4ahIbnpvavyyws5B4CvKOUQZFL+OI+NcGgycel/xuMBJNBcnTHy0RXn+MdZT+Z6oEaXebWKC/RCZhWM4qJTvb2rXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5924
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

On Tue, Dec 17, 2024 at 12:35:15PM -0800, Dixit, Ashutosh wrote:
> On Tue, 17 Dec 2024 01:46:52 -0800, Harish Chegondi wrote:
> >
> 
> Hi Harish,
> 
> Only reviewing the uapi once again.
> 
> > A user space consumer for this feature is Mesa.
> >
> > Mesa PR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30142
> 
> Mesa PR should be in the cover letter, not in the patch itself. And we'll
> need to eventually show that the Mesa PR is consuming all aspects of the
> uapi being introduced.
Okay, will fix in the next patch series. Mesa PR still need some uAPI
changes I made in this patch series.
> 
> >
> > v6: Change the input sampling rate to GPU cycles instead of
> >     GPU cycles multiplier.
> 
> Note that if your series is v6 each patch in the series is not necessarily
> v6. A patch can be v2 e.g. So you should capture the version and changelog
> of each patch separately.
Makes sense. But how would the reviewers know if a patch v2 in a series
v6 has been updated?
> 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index f62689ca861a..4ee3b04a1bb5 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -1397,6 +1397,8 @@ struct drm_xe_wait_user_fence {
> >  enum drm_xe_observation_type {
> >	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
> >	DRM_XE_OBSERVATION_TYPE_OA,
> > +	/** @DRM_XE_OBSERVATION_TYPE_EU_STALL: EU stall sampling observation stream type */
> > +	DRM_XE_OBSERVATION_TYPE_EU_STALL,
> >  };
> >
> >  /**
> > @@ -1729,6 +1731,45 @@ struct drm_xe_oa_stream_info {
> >	__u64 reserved[3];
> >  };
> >
> > +/**
> > + * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
> > + *
> > + * These properties are passed to the driver at open as a chain of
> > + * @drm_xe_ext_set_property structures with @property set to these
> > + * properties' enums and @value set to the corresponding values of these
> > + * properties. @drm_xe_user_extension base.name should be set to
> > + * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
> > + *
> > + * With the file descriptor obtained from open, user space must enable
> > + * the EU stall stream fd with @DRM_XE_OBSERVATION_IOCTL_ENABLE before
> > + * calling read(). read() returns number of bytes of EU stall data read
> > + * from the EU stall data buffer or an error. One of the errors returned
> 
> No need to explain what read() returns, read() is a system call, user can
> read the read man page.
> 
> > + * from read is -EIO which indicates HW dropped data due to full buffer.
> 
> Just say "EIO errno from read() indicates data loss due to buffer
> overflow".
> 
> Also, -EIO is not returned to userspace, errno is set for userspace.
> 
> > + *
> > + */
> > +enum drm_xe_eu_stall_property_id {
> > +#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_GT_ID: GT ID of the GT on which
> 
> @gt_id
> 
> > +	 * EU stall data will be captured.
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_GT_ID = 1,
> > +
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
> > +	 * in GPU cycles. Valid values are:
> > +	 * 251, 251x2, 251x3, 251x4, 251x5, 251x6 and 251x7.
> 
> This 251 stuff needs to go, as was already mentioned the last
> time. Something like:
> 
> "@DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate in GPU cycles, from
> @sampling_rates in struct @drm_xe_query_eu_stall".
Will change.
> 
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
> > +
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT: Minimum number of
> > +	 * EU stall data rows to be present in the kernel buffer for
> > +	 * poll() to set POLLIN (data present).
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT,
> 
> We called this DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS for OA. So maybe
> DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS? Or WAIT_REPORT_COUNT? Not sure what
> EVENT is referring to?
Here is EVENT is referring to POLLIN (new EU stall data in the buffer)
from poll(). This property would specify the minimum EU stall data
records to be present in the buffer for poll() to set POLLIN.
> 
> > +};systemctl start gdm3

> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> > --
> > 2.47.0
> >
> 
> Ashutosh
Thank you
Harish.

