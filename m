Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA12C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 19:39:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E09310E125;
	Tue, 24 Jun 2025 19:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R9Ti9x+m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64CC10E103
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 19:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750793964; x=1782329964;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bFZRiD/bJoJwbO25AhZDcZ0OIEWNur5nrGTvLfSR7RA=;
 b=R9Ti9x+myR7/24N+nlax0qiGeMKukWM7jzvgsd4N+OGJsO3/CnoPvmQw
 L1XpRaOZY47VML3czNdt7G3ctHB1rAYGE/rlTEBX6w9bII1c20tUf6JxT
 qRYYikZ6+1XKGZezcnYbXilFW8kyUU/FT6PlH+KZH9vKVSaRzI6zrSeXC
 RHuLzfa4e/IYoZ937nFOuSXftvjIuCH3AyzQBUKXq8TCA8sU9gkVbzrff
 CRuDQSh7yPgXICScKP5Qw8R/Pee7AaxjVz1I0jMeGD1Sfl3v3oaDEtFoW
 /u7zccJYVCg0f2Whn2DUsi761zjE3H19idIiR5vgNAriYoeU67bsu2com g==;
X-CSE-ConnectionGUID: NZBQkneIQhyRykJZeI2bIg==
X-CSE-MsgGUID: b8VFpirfTgGqv2FGrV0Tlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="70472898"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="70472898"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 12:39:23 -0700
X-CSE-ConnectionGUID: aBiGD17aSV6ccsZ6jdjCWg==
X-CSE-MsgGUID: wOnNFU8nSN+koIgJb+lVCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="151507064"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 12:39:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 12:39:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 12:39:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 12:39:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8b1X5ZhQDluq99Z4SU1dfIOJpR0Jg32tEL1h6P0kLx56FXOCjor2xkCfzGmT8fVlNhZMHasDfeG3l27uKqWFE9nmnJ3zkODVOJryUNVw9/8N/2e7mddE6GVTRbvx+drzXnqxn6wXj6YofA4oezAuv97Ct2ClnD/eRMdbNPq1LJNiJdnEX8IT22hJ3npg+lJkzv7fhwp7RAlL/G6UTJQ5DFbWOdaNO/lXBTlIhoFQrh0VynRp+7hFfB3abUmt8sMQjD21uwrOeKFJCVGoaf8IJleW26Nw6WdK50F5h/5LlPszTowVLpnAlz/RRjyqz7gsGcokpIC8ZzmBnyWGXXy8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSk8GzU23dT1FriFgMQ6HTIy4mMdvVjf+OlVZ2b/Lu4=;
 b=csI2rFl1N0tkZCgygO5vHz4V0LmYo758C3IBLgxIbgvfXxohR6YspWx5zlL3atEAtXT79pRKy2f2hTQ+OiybtPdfM987w847cJrjLfWZFjkQKhjycsI/23ZYwEHsIwjhF/8fmh1buxCKKbrroMmQQlSMpR9ejXkyJ2F515uBigsEXbctBW0vJsTKP/J+4REU6IyWBQj6SktBi42FmcSL3eZdk9Hx0NBnwfnnqgq1hsHLWFFdKlikgXsZcLKDLSAlbIleRSVuQkeYxjk5vy6R0zYIyO6Zse1n74xeBUz38F/WgrgFs61gukkEZwiGs1VIIhhY4it/rAL4LrN8yJImcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by CH0PR11MB5236.namprd11.prod.outlook.com
 (2603:10b6:610:e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 19:39:07 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::7ac3:745d:bc52:83e8]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::7ac3:745d:bc52:83e8%4]) with mapi id 15.20.8835.023; Tue, 24 Jun 2025
 19:39:07 +0000
Date: Tue, 24 Jun 2025 12:39:03 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/5] drm/xe: disable wa_15015404425 for PTL B0
Message-ID: <aFr-19HqjMgXar6v@msatwood-mobl>
References: <20250620214920.718179-1-matthew.s.atwood@intel.com>
 <20250620214920.718179-6-matthew.s.atwood@intel.com>
 <aFnDJdKKgT_-j69u@intel.com>
 <20250623233130.GE4868@mdroper-desk1.amr.corp.intel.com>
 <aFr7scFlNsmNy32h@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <aFr7scFlNsmNy32h@intel.com>
X-ClientProxiedBy: MW4PR03CA0322.namprd03.prod.outlook.com
 (2603:10b6:303:dd::27) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|CH0PR11MB5236:EE_
X-MS-Office365-Filtering-Correlation-Id: 40fd75b4-70e0-4d0c-3543-08ddb356c850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEZBTmgzVlNPWXpZZ3p4VHJhWXFrT3ZCSHd1ZURYT0ZTdEtDTHI0Q05lUkNq?=
 =?utf-8?B?QlBBVlVQaVcvVlRwY0tkN1ZDdlJxdFhRN3NvdS8xbzJYZE9xWXY0SmZGMDNt?=
 =?utf-8?B?M0t5KzdLK2V4UWtZWFc0eWJiN3VqOXBTZmp6Z00wdWdlU2VlWlpPblp6eXAw?=
 =?utf-8?B?b2laNFVza3lqVzJGSURNWUNKWndNSlBDQVErcjRDR0RXWWxYSTVjRmJPZGx0?=
 =?utf-8?B?bGZkbFMrZHA1Y2ZxUmNtN1QzeTZaWEJDdjNZd2JGcTRjNVdkWnZMdjg0VjR2?=
 =?utf-8?B?eElxSmVDcmVDS0d2Z1NNSWg4cUVDb3h1MTBSY3BwemVySjc0Y0lZck12VWZJ?=
 =?utf-8?B?ZkYxSHRPSzFwQXd3TUJURUFaU1l4TDc1aWUvb2VIT2NRVTNpRGJQNzBDYjVx?=
 =?utf-8?B?czRoVW9mQ1ZvZk1WUXpkU1JIZW9DeEpNUHlVT1Qwd2hHKzcvTmg3RTFkeXpk?=
 =?utf-8?B?SVZCaXpSY0VkcmVUSE9ncHJlWWxJeUhwWlNydmhhLzNsdUpGT2ZpMnhlQzR4?=
 =?utf-8?B?ZElzNk5neXdJQi9ZUXdZZUJ3QXkyQS9lcFllQUdGZWp6d0ViWTNCYldpb083?=
 =?utf-8?B?L29QYUtvUm9oNElxMTFwbmdlVjFnbFgrMTNyb3RwbVN1QmlmMTlnYmozM1BC?=
 =?utf-8?B?RXdpbmpwa29ZWEttT3VkLzVOcmFMTHZSdkROMTlFVm4zZnR1bnZYRytLRG1R?=
 =?utf-8?B?bHJjZkV2emxoMmVldEtacmlycXpWU1RacmhnR3ZKOC9GdjdBUFdWWW5HU3ht?=
 =?utf-8?B?SFQyOE55N0VrWkhHVGZGMmFucjBtUWJDTXM2MVh3d0ZLNUZVbVRDRU03T2FB?=
 =?utf-8?B?OGpnTUpiSjFvWGNYMS9jbElYanhmMkY2bXpabmVHWWFXZ0dSR0d1VUFqcjJD?=
 =?utf-8?B?ZTQ4UXNGTlg3SWl6YzFCWkZhQVFuVXRJWjR3RmFyZW4zR2ZONis1anBLbVdy?=
 =?utf-8?B?S09PUHNqTUZDb2JyZmUvVWxVOVVmbzZwRGVFM1c0ZVcwemNCNlpjR2xrK1hF?=
 =?utf-8?B?YnpkTHRYQi9RMEZNcVFRVXlIeU1tdHpwU1p0Z0JycHhtRWdMQnNoSjU5cXFZ?=
 =?utf-8?B?azRZWEIwNmo4eHVXVUpheVc4RjI4Z2V1RUtwWmx6K2lscTkvWkxrK3Vzb1Bo?=
 =?utf-8?B?NjUwemhNRHE4VGNWckUvUUFoTC83WXJpQTNMQW1jWi9GSnFhUllubFZCaHll?=
 =?utf-8?B?WDNVRTRhSW5PREFUdlpyZnFSOHJZQWc0c3J2NmdOdWN6emlkQkk1aUpXNkZI?=
 =?utf-8?B?a1ZGeHNUMk01YVl3QmpEUUszRUcrZVQ2LzZWQXoyS09mQ3dvUE1xUkthYnhZ?=
 =?utf-8?B?VFlHRUpCU3VNeFhIclpPZzVFbm1ic2ZBZkxZTnJ6QkIzVXVDLzlOMUFoQURX?=
 =?utf-8?B?alZ4aldFd29OL0QxVktSRng1RTFhWW1DTnVwNlpTbWNmV29xNmZudmhab3px?=
 =?utf-8?B?SktVSExPVDRXV0RHem5mVU93STJTNE5xY2xaVzJTcnpUSUltSFJmQ2lKWUdW?=
 =?utf-8?B?YkRmV3FsSVFjTWdSSHRJT0hxVlNvZFplV3hyRUdEUUxDOGlEL21XclZXNHJ5?=
 =?utf-8?B?dXhQQjg5YkRVOGFvQmQ0K2ZZR2pIdlpSalFqOHAzaHVuS25ia1pYRFkwOWwy?=
 =?utf-8?B?MDVpaXA5RjZMYkVpV0NUMDExaEZSZ2NBWEFsUy96aG91NmFHZm1aaHF3eU5L?=
 =?utf-8?B?eVBITE5Ud0hVOCtqOWxwTi9DRG5zdWdLNTdxbHgrZlEwM0Qwc1VUekhNakFW?=
 =?utf-8?B?UnFEd3VVaGd2MjQwazA0M2tLTWVNUU1CRGVhVTZtdkZkWmVkc2hPWWo2RTky?=
 =?utf-8?B?UWl3US84a2xHV0lUb0hYczJETnRqYlFiVUhMcllhUlZVQnpGRWNRazJBWUpX?=
 =?utf-8?B?MFdUb0NBM01vbjlDMWdId2E4bVd6bmw1RWk5bERUeXBrcWoxaWh5MVdBSXRE?=
 =?utf-8?Q?bwPRbSiomF0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTMrNVlKc2NMOUJ0UE8xb09CSWJoVTlPOFdxaXluTmk2aUx6czMzelA3a2Qx?=
 =?utf-8?B?Y2FMVUdLUUpOV3lKM1ZUekVzQXdKUlN6TDAyK0tzcEhJRmxWYUhYNEllY3FR?=
 =?utf-8?B?RDgwZEh0RGRqa1JCQkJYNnZCZEhkWkZRNUdRYTBqK1JIWFZiQ0UvZ081Rldh?=
 =?utf-8?B?eEprUzBsWVZDWmEwRnJqbEt5NFBWaGlRcWVseC9NSGZWdU9IYkN2NkRIeTYz?=
 =?utf-8?B?YUxmYzRQcFdKZlBJb2RDS3lmc0U0Y05SWmNlb2RUbW92eHBDTWpybFVzU3Bz?=
 =?utf-8?B?QmwrUHZ2YVZ6VEw3UjRlUFo0dWVzcVFBY1lwaC9aR3RmZytWWEI1Y3F6Ympy?=
 =?utf-8?B?ZGhCMGdrcS85bkdGR01JOFE2SmNUWmxCOVFwQjl1NXdheXNYTUc0Mm9hUDM0?=
 =?utf-8?B?MkZtanY2QjQxODdTbXVXQWFzM3dpMlBoM0pyU2lOaGFPaDg2dGJoVGlCY0pm?=
 =?utf-8?B?c3lWWDFZNEdDUHViS0ExYXZUa1lodlh1Y1QzWlZ4bXpvTDFyVTVKTzZkUjYy?=
 =?utf-8?B?MCt2ZEhXZDFRdUUvblZpaWNMZHdKYUZHc2loWTNFRjhXQ3c5djd2T1dFMUJV?=
 =?utf-8?B?M2p5OGY4ZzA0QmowNU5WOHMwYlBqeEdPa0h5anJ5R1oweXpOYjJEckdKVTBS?=
 =?utf-8?B?Q0h4TC9GOFJleVhydmMwOUNHTDZhZ0NZcjB1QnNZQU91ZkxpZ2ZMQ1ByUFIz?=
 =?utf-8?B?WEx6bEQ4cGZmWUo0SlpDNDU2Y0lTYVovR0xzRms5S1E2MjRqWTRaYjEreksr?=
 =?utf-8?B?THpVY2xtczJpUVZsOHpEc1ZpNlliMisrNFlGZkFlK0hZRktGS2dBRUkrV1R6?=
 =?utf-8?B?WENQL2FFZStLcFlETzhZTXZlSnE4QmxZMU1Ea3NiNWE2QnRibWJCb0lWY2ZX?=
 =?utf-8?B?amhzc0hkaUNtdmt5c2N3d3RYZmZEUmUrRnRDczZUM0MvYnhMT3RQVWtSZ1F1?=
 =?utf-8?B?a2ZtQVFNMHRlVTlxVERINENzSlpEMGY4SVBpb01HUGpZVy9QZlgrRFZTYUVl?=
 =?utf-8?B?L2FISlo0cVNVbmRtSXlTWjB5K0NUOEVVUmlYWXhkSXV0WGlFY2tnYlBiM2Vt?=
 =?utf-8?B?NmZJNElicHNtSGtJTS9LdUM1UHZIcG5QcE1yZUFWT1BuQlVZRlYydk94bDZG?=
 =?utf-8?B?MEt6cXB3Q1MzODVyMmFtMkNRblFQZHdIZjNhaC9HK1ZsZS96YkxTTnB4VU5L?=
 =?utf-8?B?SjAyM21ZcnphL1ZLUzRqUWVEcFd0K0NlT3dwNkRSV0F0WkJVS0ZpbUdqbStm?=
 =?utf-8?B?Y2NpQ1VIejJobjhTV25ZT0h5QTlLNFN6SWZlWENiMm94cFR4RW5tajVzeFph?=
 =?utf-8?B?NFJRMDVBbGlYRHYwRTlvcGhBejhmNVBiR2xqMTVld2VKVHdkN2RVdHhjWEN2?=
 =?utf-8?B?WmpyaWtYc3dTdHVQSkhBcGtQTVlXOTJSbmliK0d6Sld6VlUwUTBIeHJlVDZN?=
 =?utf-8?B?ZThWZDMxdkhKQVZHUUFROVEzRDNyYlZzNzJWR0FLeWo2dDI2eDJsaGdiZldp?=
 =?utf-8?B?RU91ZjZyR0xQbGtSM09rQis3a2tzb3E0bkNlZlE0VWNNeFRjNXVaVGlzZ0pM?=
 =?utf-8?B?S2dxRXpkM2xaNVFwSHV6TFhNczZ1MjhuNnFhZXhmRFFUMVg0RXBMUmtxditU?=
 =?utf-8?B?MDhkY25CZ3NSRHB4TENpZ0lxN2pEVDYwb3h1NjFablNzMW9YeEtlckl3ZjVm?=
 =?utf-8?B?MWg5SjU1SGF0YWZoSGF3OVd1eE8vdSs0WmpMOHlNRkxWVWRyaGFNUkVLYjZY?=
 =?utf-8?B?T0dOd2NRaDFXUk0zV3BHQUxjcEJqZWJuSjFVbFl5ZXg5SXpyL1lyOVpEd0VE?=
 =?utf-8?B?Wm55Z3p5T2NmVXExR3ZwOURINitONEZLL1RmQjVxb3RVcHZ0Wm5NcWlPbm1Y?=
 =?utf-8?B?bEdtS1RHRjJxallYUDZnTjdKaDRuZ1A5cHY5M0l3MGhiUWN0bi9IMWY4YWs1?=
 =?utf-8?B?VnJ2aE1VSHhvRUQ4OWRpcjI5NUd5aEdqdi9pRklSRFRZV3JXcWg1bVlaNGU0?=
 =?utf-8?B?VG1yRkQ5MloyRVdUK1JMdUhPaE9kZ2Z1eHJKTVBsb3ZMYlN2Sm9zTHNjQml2?=
 =?utf-8?B?L0tlVTVMY0ttdHZGOFk5QXZYTDd4ZzVVcGoxMHF1a1UrZ2F2MnVhN3Z1MHpF?=
 =?utf-8?B?WGdOdUFZV2RFcHgwRGUxemVFd0RxNzdNQ1g3K0FJQmg1Sis5REQwQnJpZzNm?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40fd75b4-70e0-4d0c-3543-08ddb356c850
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 19:39:06.9448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atgDh4t0H6MPr4mamt2LpZL3kd/t4UriJX+MOhOvSun6gTZIF5Csbo1DolBp6J9hO6VP/s5MXy+W6odXxcirfFvpTdWlMiQ4Ul7npN3cjas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5236
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

On Tue, Jun 24, 2025 at 03:25:37PM -0400, Rodrigo Vivi wrote:
> On Mon, Jun 23, 2025 at 04:31:30PM -0700, Matt Roper wrote:
> > On Mon, Jun 23, 2025 at 05:12:05PM -0400, Rodrigo Vivi wrote:
> > > On Fri, Jun 20, 2025 at 02:49:20PM -0700, Matt Atwood wrote:
> > > > This workaround only applies to PTL Compute Die A0. However, this
> > > > information cannot be determined until after the GT is brought up. This
> > > > means that we will assume that it is required for the initial bring up of
> > > > the gt. After GT init, the oob workarounds are enabled for the GT. Use
> > > > this flag to then manually set the bit in the soc oob bit field to 0
> > > > which will help performance after device bring up.
> > > > 
> > > > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pci.c        | 6 ++++++
> > > >  drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
> > > >  2 files changed, 7 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > index ded0f3dc8d73..a624c3fb9498 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > @@ -34,6 +34,9 @@
> > > >  #include "xe_tile.h"
> > > >  #include "xe_wa.h"
> > > >  
> > > > +#include "generated/xe_wa_oob.h"
> > > > +#include "generated/xe_soc_wa_oob.h"
> > > > +
> > > >  enum toggle_d3cold {
> > > >  	D3COLD_DISABLE,
> > > >  	D3COLD_ENABLE,
> > > > @@ -890,6 +893,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > > >  	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
> > > >  		str_yes_no(xe->d3cold.capable));
> > > >  
> > > > +	if (XE_WA(xe->tiles->media_gt, 15015404425_disable))
> > > > +		xe->oob[XE_SOC_WA_OOB_15015404425] = 0;
> > > 
> > > We are discussing this offline, but I need to make it very clear here
> > > that we should not move forward with this as is.
> > > 
> > > Two unnaceptable points in here:
> > > \
> > > 1. _disable. We either enable or we don't. If we need to wait for the gmdid,
> > > let it be and enable the workaround after that. GMDID should be one of the
> > > first things and I confirmed this workaround is so rare that in an a0 situation
> > > you could wait to only enable after you read the gmd-id and confirm the
> > > media is A0.
> > 
> > This is exactly what we *can't* do for this workaround.  The requirement
> > is that on any impacted platform, every single register read must be
> > preceded by four extra dummy writes.  There's no such thing as "early
> > enough to ignore" ---
> 
> What I got from the Architects on this is that it would be safe enough to
> read the GMDID without this workaround since the condition for the issue
> to manifest is not on a single read like this, although the protection is
> global.
> 
> But okay, let's work with the assumption that it is better to protect
> anyway.
> 
> > it's specifically noted that even pre-OS firmware
> > and such needs to be careful about doing this as well.  So this causes a
> > bit of a chicken-and-egg issue:  we cannot read the GMD_ID register
> > without having the workaround active on impacted platforms, but we
> > cannot figure out whether the platform is impacted until after we've
> > read that register[*].  We also do a bunch of other register reads
> > during early driver probe before the xe_gt is initialized enough to be
> > able to service workaround lookup queries.  So there are a few options
> > here:
> > 
> >  * Mark the platform as always being active on PTL, then come back and
> >    disable it later if/when we confirm that we're on a stepping that
> >    isn't impacted by the issue.  This is pretty simple conceptually, and
> >    is quite likely something we'll need in the future for other
> >    workarounds.  That's the approach MattA has taken here.
> 
> ack.
> 
> > 
> >  * Add two separate workarounds in the driver: 15015404425_early and
> >    15015404425.  15015404425_early is an SoC workaround that applies
> >    unconditionally on PTL, and 15015404425 is a GT workaround that
> >    applies only on specific media steppings.  Both do exactly the same
> >    thing (4 dummy writes before any register read), but
> >    15015404425_early is checked before all early MMIO accesses and
> >    15015404425 is checked on all others.  The downside of this approach
> >    is that we'd need to use a completely different set of MMIO
> >    operations for early driver boot (i.e., no xe_mmio_read32 and such).
> > 
> >  * Ignore this workaround completely if we can confirm that it only
> >    impacts pre-production steppings.  I don't think we have confirmation
> >    yet that A-step hardware is preprod-only, so we can't take this easy
> >    path yet.
> > 
> > > 
> > > 2. Don't mix SoC with Media. If the Bug is SoC don't wait of the media stepping
> > > and check directly for the SoC that needs this. So, don't create an infra that
> > > already has an exception in it. And if possible, avoid the infra at all. This
> > > might bring even more confusion to the w/a handling.
> > > 
> > > This w/a in specific here is soc, but it is getting mapped to our media-ip,
> > > so let's use the media check...
> > 
> > I think more explanation needs to be added to the patches to clarify
> > exactly what's going on since it's still a bit non-obvious.  The reality
> > is that our modern platforms aren't actually "SOCs" at all anymore;
> > they're technically MCP's --- Multi Chip Packages with logic (and
> > sometimes hardware issues) spread across the various dies.  The hardware
> > teams still refer certain things to be "SoC" logic for historical
> > reasons, even though that logic is technically distributed across
> > multiple chips these days.
> 
> Well, I still see the glue of all the chips as the SoC. It is easier to
> understand.
> 
> > 
> > We absolutely need some kind of "device" workaround framework that isn't
> > tied to the GT and that can be used before GTs are even up; we have some
> > non-GT workarounds today that we're not really handling properly, and we
> > know there are more coming.  I think when this workaround first came up
> > I suggested a "device workaround" infrastructure and using the same
> > general XE_WA() calls, with a _Generic() implementation to lookup the
> > status of a workaround in either the xe_device or the xe_gt depending on
> > which is passed (with the xe_device workaround table being initialized
> > much earlier in the probe sequence).
> 
> If we split in device_wa and gt_wa that would make much more sense with
> our Xe design indeed.
Is the ask here to change the name from XE_SOC_WA -> XE_DEVICE_WA?
> 
> > 
> > Issues outside of the GT can live in different places:  the GCD die, the
> > compute (aka CPU) die, the IO die, etc.  Each of these have their own
> > steppings, and the MCP itself has a stepping too.  In some of these
> > cases, the proper way to determine a stepping is to map PCI revid into a
> > die stepping.  In other cases the proper approach is to "fingerprint" a
> > die's stepping by inspecting some other IP that lives on the same die
> > (similar to how we used to fingerprint the PCH back in the day by
> > inspecting the ISA bus device).  For this workaround the stepping we
> > care about is the compute (CPU) die stepping, and since standalone media
> > happens to live on that same die, the bspec tells us how to figure out
> > compute die stepping from media stepping (A-step compute die <=> A-step
> > media IP in this case, although that isn't something that's guaranteed
> > to always be true).
> > 
> > 
> > [*] An alternative to fingerprinting compute die based on media stepping
> >     would probably be to check the CPU stepping through whatever
> >     mechanism is used to print the stepping in /proc/cpuinfo.  We'd have
> >     to find separate documentation on how to map the numeric value there
> >     into somthing like "B0;" I don't know off the top of my head where
> >     that documentation would be but the core kernel guys could probably
> >     point us in the right direction.
> 
> Yeap, in this case it would be the combination of the pci id + cpu-revid.
> This makes much more sense for this w/a, but it is hard to generalize indeed.
> 
> But also, any device_wa is hard to generalize anyway, since we won't have
> a device stepping or anything like that.
> 
> So, okay, 15015404425 in xe_device_wa enables it and
> 15015404425_disable in xe_gt_wa disables it for MEDIA_STEP(B0, FOREVER)
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > > +
> > > >  	return 0;
> > > >  
> > > >  err_driver_cleanup:
> > > > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > > > index 8c2aa48cb33a..822cbff13819 100644
> > > > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > > > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > > > @@ -71,3 +71,4 @@ no_media_l3	MEDIA_VERSION(3000)
> > > >  # primary GT GMDID
> > > >  14022085890	GRAPHICS_VERSION(2001)
> > > >  16026007364 	MEDIA_VERSION(3000)
> > > > +15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
> > > > -- 
> > > > 2.49.0
> > > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
MattA
