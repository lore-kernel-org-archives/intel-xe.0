Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB29C83F17
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 08:18:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B589510E927;
	Fri, 18 Jul 2025 08:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hg2DAEzu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE9B10E925
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 08:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752826695; x=1784362695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ByIMAfbpMD5PE/pQCPmqx0vR5nwmhMspI7lVrNARp3U=;
 b=hg2DAEzujvNTvQRZzdpAQGHU/z2NO6BSLt8ckre8RWvqzo2kM7YGPMD3
 lYohvd44PbNNucNUiZV/d5i2CdnR8tTkajO86XF8Fv70n31XO/W5O9aUO
 KI9MSb4uio6H4/tGsKVmZKnZxl24RK0Cp2SpXmJtgxYB8sS4vY0+azPNa
 BTGUDUNsV5yY9Tl7+gfAjV2Tt3KHEXnn7ygEfrfGpBmf8pMcdOvEgutrZ
 TQS9rbxaJQbLvSEhR9xXwyeSavqWkBxxfQUO3ackFLJBq97r/L8aO7jFc
 /rukkRzGufAm/eWILERgCHwy18X8CuYFGrmqTItTnLObvkw6PkUuRSAtx g==;
X-CSE-ConnectionGUID: wm/bsdrURLi/6JqSmT+Kng==
X-CSE-MsgGUID: kghGfM77TtGDmxnxDEtPUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54328975"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="54328975"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 01:18:14 -0700
X-CSE-ConnectionGUID: EjRu42zUQTOAu7B7pjLxzA==
X-CSE-MsgGUID: m5RivUJKRqenAno+PXfpRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="162271423"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 01:18:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 01:18:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 01:18:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 01:18:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=an2h5Ln1gnCQCSCEhZsQJFJG2bMa6MsrzB6f+9jKub8SCIKhJmqRr8WLJD8oOHjsAEucDJgmj1ZX90IIgeau8xHU1NVlB8mwNm9k06ye4pkO0yksp9d0H6MCyFTmYgsa1SSsbLHDu1TyinW9baF3fd6C0zfe77cfovY8sD595wWp2BE/1TEbh9NV2EQoTwh5wo0XIIdEpP569G4sPODayqJXid3a8rUMB7oRTL6VkzmOtOih6WYeepbjskmTwwxwhsyI5TWAnyY53kfGEqb5EfsArs1aH7vG7C0W8IEj/EuzEo9j91eJDI7tSTVhpAdPpPaR9OcL/L1KkUBNamGq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JINgmu6KGDYMKBlDbtE3HlriNvY2JPQKht86BOiRKb4=;
 b=UpQQ5xX2Jm2IdxN62mSx+gzow0uw2T0ri0UDMzDZCha6HdNyH8ufi+LetFvipwFamJeV15628wB99QV4wTUWEw059kkrJNqBSZtEm+UceNzmnVGV7BvPw+DcCl8NfAtaIpK9A+CcUW8j759OZRJsPaGRQF5jmN6M9rtcy4clnnNxht+bjts0zWQ/aYPHggnNGXrAXMTgj1fvXO1yaS3gSlxsxUo7WS1+A5ZYsJ6SpLsHF3MltweNGJ2Elro3bSf/zCVwEewhLP9/T9ro5RxKfL38fJZgWIjz3huv22XNmLAq0fyIQKHJ2A1jpH9lrgRDoQvzEPaNcy2wwT7NwLxSAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB4807.namprd11.prod.outlook.com (2603:10b6:510:3a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 08:18:11 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 08:18:11 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 2/4] drm/xe: Introduce new BO flag
 XE_BO_FLAG_FORCE_USER_VRAM
Date: Fri, 18 Jul 2025 10:17:50 +0200
Message-ID: <20250718081752.630122-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718081752.630122-1-piotr.piorkowski@intel.com>
References: <20250718081752.630122-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0271.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::27) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB4807:EE_
X-MS-Office365-Filtering-Correlation-Id: f25c0eff-2ae1-4a9b-195b-08ddc5d3a296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sk1udnB0REI0NmJiNHRyWmRoaXZhbnlqRWFDSDgxajlBNWlmYUd2UFpPbWNU?=
 =?utf-8?B?K1g3ZVI4ZEFuc0IrQkI1NGNtc2FSRS9tVW1yVFR4czF3bm9keHE0VE1nd292?=
 =?utf-8?B?STRYSTlSalBqZHF2c05Cb0pqaW9JSXdSWWZYZ3NELzVGUEczYUNMdTBya2tR?=
 =?utf-8?B?R0IwS2JsYWhVVVlWNnF5MWtUMlF6Z3NlTCswUW5oY1pMVmxuZUNON0N0OUlF?=
 =?utf-8?B?UDBNNWhOVmplOExvTUNrZUFzbk55U1diY2F6NXFHMVYxVjBkWHMrM1hoNHY0?=
 =?utf-8?B?NmdBSGdDMjNlc3pocW8zS2lCU0FPSVR0Y3BReVJNL1FqaDRxT2JrckJXc3Bx?=
 =?utf-8?B?MTFhSmM1Yno0RjEwbTl4cXhtMlloT3BGNWY2M1huR3l2M3RDUnlKcFV6MXJi?=
 =?utf-8?B?ektBbG04VCtxcmhraWxBMXN5NVNOb3ZkSzJyVm1odThoSmZZbFRrWWppY1ZI?=
 =?utf-8?B?QXphS3ZvaXZNQlNTZEZ1Q3FRRkhpSHV3YVpZeGgwV2E3ZjhETk9NdEZPSVBQ?=
 =?utf-8?B?Yk85VVFxOTV4c0Y1dEpVeEdRVG1vMWZ4UUh3SHpCVzJVRTRxd1hDeE4yb2NC?=
 =?utf-8?B?anRGcHoxTkRub0RQcmpoemdpc0g4dUR4NDRBd1hWcVZIMzVTVjgwNllVdERn?=
 =?utf-8?B?NTVvNVo3TWZod3crRkxPZ0ZkVjJ0L2VlVmJNZDdaMzJndGluMXhndFJnTkdm?=
 =?utf-8?B?OFhnMEx1L0dyVG04RlZJVksvWjFIN0M0TTViVmRDcFdRUFBPbU5CNVVJNXp0?=
 =?utf-8?B?WTFaYlp5Ym5qeENrWEZyQmR1Nmc1TEpWODFTeVZNVno0Rk96ZGNMR3NoN3Ex?=
 =?utf-8?B?YmFYVEhrdGRaMGVvK1hHT1pMeHpKQWpuNGJGRjZzeTlvTGFvS2xkYWRQYW5L?=
 =?utf-8?B?OWlvRTBldmxpYXFqbExXMFhtZ3ZuTUxqZCtMb2lIcWFldmh0N1VhU2llSGM4?=
 =?utf-8?B?RzNlWURFd1I0SEFDNTFTeURqM0o3SjRSMlhjY3d1SnFSZ29ZSGhFQzZ2dzdG?=
 =?utf-8?B?dVk5ZUsrdDcvall6bTd3T0I4bThkUmt2UFJFdGZwM2RHdi9UMy9kdHRkUVNs?=
 =?utf-8?B?Q2NWOEJwMGlmWWdzQ0owZEtFRUJWc0xXMTNCSlVZWlZPWnhHaFBmSXRJWGNL?=
 =?utf-8?B?TFBVRjk2MmdVcnQ3MXIrdGtSTmxiMTBVaitmT2xOTThGVENzNDNyY0tGMk9I?=
 =?utf-8?B?bTRXVlk3amNHUmMyVFIvY2h1aU9kN0s0ek4yWUg0em5WN2FGeHo0U1lkQ1hj?=
 =?utf-8?B?Y1RXc0VTZUlXK0xuZitiNDF3eHczb2Y2N25MaW92YjRDQzRseDNPRTlZdzJi?=
 =?utf-8?B?YWFkV1l5YlBhdTVYNFhGT1h1R1FwTEJ1ckRNeGpsSHRCSjR6N2dkWmRraHMw?=
 =?utf-8?B?cW5Mc2J0WWVIaCtNbzU2aEZ0SjFQTHZlT0ZPdmlBQnAxaFk0UytBZ3hKcGVY?=
 =?utf-8?B?UnV1M09waDBXZ3dvbE03Q3o0Q2dNM0xHd3dsajNYU2g5anpPa05CY3BDemVU?=
 =?utf-8?B?d0FFMnE0dTRhTjkzcnhxZzR4NG51N1hXbG5NWUc5OHhCNnYvU3RoVFh3T1Jl?=
 =?utf-8?B?Q3B6cVVERmtNQmFUeXBIdldsY3RIWnh5S0ZaaFo5VmpJQUlJOHlkQ2FBRk1U?=
 =?utf-8?B?ZVp2RHNlS1diKzlmU3M5dTVpKytKZThkajVIZ1U4ejdWVXpNRUhCNmVqRHl3?=
 =?utf-8?B?YXhZbVo5VklyK1dYQWVWS0pQNkVNRW9OQWZYb2JnSzBhUVRzVWFWeGZPZlpY?=
 =?utf-8?B?VmxaZHNoNDlLdk9jdEZxZjFHbDdtam9FTTJ3TnNTMnJYUlpycUxvUzJGWDhT?=
 =?utf-8?B?UVA3QU9PdnpJRTFuMnJPZTB2bFBDU0NaZVUvRm9oeU8yN0xCTTVNbFB6YnAv?=
 =?utf-8?B?ZkdvVGIyQ1J3aDhnU3VoVCttb3QxUVZvbEoxY1NQWmZHYmdtOW1IaFlSN1pM?=
 =?utf-8?Q?hWG6Zzl6bjY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWFYNi9RS21HcGxoNmtZTndaTnFMaVEwQ2l2NFJUN2czU09KSi9Pb3FZTTlV?=
 =?utf-8?B?aE5EU2Z4Nkk1UHROSDdYRjRHaFFXV1Y4UGQ1RDF4S20vREg5QjhnVm9pLzlx?=
 =?utf-8?B?bG5pYWx1bFJYQmgwd0RLWkM2V0tCQ2kzQUJ2VWp4aWJUcFNzRnI4dmVCUmlp?=
 =?utf-8?B?c1NVNkRJU0ZVYmc1WFZ3K3BhSnBac3VhNWJxWGdPVGtWNkh0a29Jb09acFph?=
 =?utf-8?B?MytsZjhDRUlpS1VrZGRIdVRkejNUNW5aKzRtTGJBSkxuUnoyUmdKNTBidUhn?=
 =?utf-8?B?U3pteG9jQWJrL2lQWkZlc1lJRm1ha2dlZm1mMDRWVDZIVjFLVDRNY0FPQVZX?=
 =?utf-8?B?SXpNWEpTV2tvb3NCWUswRnhWZDRTRGJKUWlUdzh6V0ZlODN1eG5WTyt1VkNu?=
 =?utf-8?B?cWExVlFEZ3RRdTZqajBUd1Z2NkoxQitPOWZua1hKRlVwMHowSmdzR2RPdU5I?=
 =?utf-8?B?b09tbVdKZFNJbmZFL0F0N0FROXN6S1dRcEZuZXpBellJV0FyWkdCNlZVZDZW?=
 =?utf-8?B?TXpQZTR0cm1SVjVxNkVZQzBxdXZyeE1rMXNhOHhjNmV2T0c0eW04QlVPT1hE?=
 =?utf-8?B?TWowbnkrSWJhUzJDMk9HdzJJOVFKbFptQkM0Nmo4KzV4Q1d2MDdGUmJEeEJO?=
 =?utf-8?B?WlI2RENoemM1SWVqTzhMQ1BjV3VVaWk5KzR2YnU3clpwV1BJTXNFTmoxOHNr?=
 =?utf-8?B?Z0RLVnAxOUJ1V2szNmY0ZkIxeHRrdUhmRDVtNFB6L2tKNUtGRG55d3BhMzRO?=
 =?utf-8?B?Z1RWcnI1cERvTHZNbEVEd2JLVG5NRllvRUZrdDNjYnlFeExPcW8yd0tSNGRR?=
 =?utf-8?B?Q0dYNWQ0MTk0clBqd1plVmgwZm1WUm9ncklGcUh6OE52RFptNTdLV0pFQVpR?=
 =?utf-8?B?QW02QSs4dlU0QW9LR0U3dXpEYngrRjRZOFUzcm1zTzV6eUc0SWFqUWMySVZq?=
 =?utf-8?B?a0Jtd3BCZk1pQkxsNW5nTTBmK3hSakZUd0lzWW85dnNPVGpJYVE2bzV6d2J0?=
 =?utf-8?B?cGtub094N0JNTE5TMm5NSXdwOENwTU8ya2xoOXRmNjF5UzgwaGRsTmhZMC9q?=
 =?utf-8?B?QVdzLzVXZXlFd2JmQ09SbzJQS2xMNXA1TkdSOFdEaEFIakhkTm5mQVhKQjZk?=
 =?utf-8?B?cmxBZko4QnozYlZIWkFCSCtzTFpqTmtOVG1EdUNyZnJPb3N1My9tZHdXNFZS?=
 =?utf-8?B?bXNpVVQ0Q0tURU9nUE9QanFnUGg1Nk9WRHkyTTNoUVZxUTZMMHgxSWZncnU4?=
 =?utf-8?B?ejRvZWtoVmFvU3lPQ0cySW1RRlhrMHVvVFU0Mks1RkRrVldBaVpMU3kwWm83?=
 =?utf-8?B?ZGZ3MHJXbnJMcWEvZ1VzY1d4MmlrUWxZWFUyUWNCME1wVmxFMmswRnBrdklM?=
 =?utf-8?B?cm9Md1RmMXprVUk0L1pOT3RwWU9uQnUycnZWQU9DNThscThhck04N01URXRK?=
 =?utf-8?B?aWR4MklVdUF0bFF2N2YyVFQxbllJV1pZTFN4MDQvK3RYMjN3Mmp5a1crajk0?=
 =?utf-8?B?MUpVVXVqV01lOWR5SVJ1N3krbkhlQkJLSEduamlSaS9VQ0N1dVJiVm81R1Z1?=
 =?utf-8?B?L0JXWXVqQVhzZUx0UkNaVlRjczJ1bzBlVmxROXpEL2ErSmRFMmFoanhCQXNp?=
 =?utf-8?B?dUR3NldCM2cwMHNSQ2V1b3B2cE9OYmxtU0J1aHpTaS9YMVYzWTFWd0h6dU04?=
 =?utf-8?B?bldwcitlZVZCZDVnNVpJbzgzR2x4aDc3dU8xL2ZZYzNRSHRSUTFoY1BiUWw0?=
 =?utf-8?B?YUZtMlJlWXVlb0RwNm1HRG4xNWxTbzlabkE4UjZyeEZTQ3JGU3B4OC9NQWxz?=
 =?utf-8?B?cHZROEx6Y2V5UThXTHhTeEZ3Z0pTL1ZBTi9NUDNsOXJmd0JXNjhWSVl0d2p4?=
 =?utf-8?B?eUwzUVA1Z21aQkxhM1BGN280V0swNHlYMTY1NWhqMXE1STJqY3J3VnMxVUNM?=
 =?utf-8?B?cFBmZWxJWDhWdFN3amg3STI5S1VqRjIwZmxEQjdjZjVIS3Y4TnFSVngvOXlF?=
 =?utf-8?B?bjl1cVBvQTFwU2IwdFV5SUJ6dys3V05aVUJTOFhyZUpxNXh6T3F1QWg4ZnZn?=
 =?utf-8?B?SGdQZjBFdm9nUUVJQTVVVStGelRxUmNpRmhyTCs1NVFScStWOHlJdFZSQmxL?=
 =?utf-8?B?ejU4QVV1em1jYks1c2cwdVlYck8xcE9GN1hZTytxUFhkY0p4dlNaQjJMcE1u?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f25c0eff-2ae1-4a9b-195b-08ddc5d3a296
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 08:18:11.4307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GznwIw0PCRLxoo3soUmV0QYITHQvGgGhA/uvt7nEwoRj9cvxba7a5Fmcf1eUqDRXxSm2YCA8kKl91QXGhjmgIil/K2XF6CZwEeoFDdaFbBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4807
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

When using a separate VRAM region for kernel allocations,
some kernel structures, such as context userspace data,
should not reside in the VRAM region dedicated to the kernel.
To support this, we need a mechanism to explicitly force such
allocations.
Let's add a new BO flag that forces BO allocation in
the general-purpose VRAM region accessible to userspace.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +++--
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 12e899726534..997ebb6fdfaa 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -224,7 +224,7 @@ static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 bo_flags, u
 
 	xe_assert(xe, tile_id < xe->info.tile_count);
 
-	if (type == ttm_bo_type_kernel)
+	if (type == ttm_bo_type_kernel && !(bo_flags & XE_BO_FLAG_FORCE_USER_VRAM))
 		return xe->tiles[tile_id].mem.kernel_vram->placement;
 	else
 		return xe->tiles[tile_id].mem.vram->placement;
@@ -2035,7 +2035,8 @@ __xe_bo_create_locked(struct xe_device *xe,
 	 * that we are using unified VRAM and we need fix VRAM BO flags.
 	 */
 	if (tile && type == ttm_bo_type_kernel && xe_tile_has_separate_kernel_vram(tile) &&
-	    (flags & XE_BO_FLAG_VRAM_MASK) && tile->mem.vram->id != tile->mem.kernel_vram->id) {
+	    (flags & XE_BO_FLAG_VRAM_MASK) && tile->mem.vram->id != tile->mem.kernel_vram->id &&
+	    !(flags & XE_BO_FLAG_FORCE_USER_VRAM)) {
 		flags &= ~XE_BO_FLAG_VRAM_MASK;
 		flags |= (XE_BO_FLAG_VRAM0 << tile->mem.kernel_vram->id);
 	}
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index dde8e0274ff2..46c36f656ad7 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -48,6 +48,7 @@
 #define XE_BO_FLAG_GGTT2		BIT(22)
 #define XE_BO_FLAG_GGTT3		BIT(23)
 #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
+#define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
-- 
2.34.1

