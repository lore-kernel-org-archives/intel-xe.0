Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D246CCFA13
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 17:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9826C10E993;
	Thu,  6 Nov 2025 17:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eBBLIuFJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267BF10E993
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 17:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762449328; x=1793985328;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=GQ8STrktUdS/QBvvZvwT/o6wEF8wrPdR/JmgAJNX/2Q=;
 b=eBBLIuFJB2rG5UNpSAJ4U7lPBt5r5L11khBGhs71EMOvb6X5f2o7Ue6Z
 JLXREPNWwyivt45QS3YryFxDW4cHyomtDv9BE8RFovAuv3bWpBsJWBb5F
 KAY0kMNd1Y6ItL7cDKaTOYmcYDhaskWXs//pFR5Q9NUN0f9FYhVb/9tF/
 T+3zR3D94ZnbT3t5VnasXP9AyZcrxAQWwOLd8l78bfx9MnKH043Kg5Ysd
 WBYQb6w9EQnQT3386lh44vxOL+hS9q2GE3XbXnTrsAoEJdkKMJEX/kPA7
 A/dc1cRQ/w9P4kCfmPjw04CaVTf/zMnhXREpx3BVllK9YqLhCtpFcSYkq g==;
X-CSE-ConnectionGUID: lVGQpyfRRuCM3gH4D3SYnQ==
X-CSE-MsgGUID: +I349q8mQcuMhHLu3YkARw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="76043456"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="76043456"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 09:15:27 -0800
X-CSE-ConnectionGUID: vd6rolteRfaEVY8Zk7PyRA==
X-CSE-MsgGUID: P/HMjN7FQT+q00rcIZ7lCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="188252861"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 09:15:27 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 09:15:27 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 09:15:27 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 09:15:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQoQEgNh5dqIEZa/BC/3cO9jCn4PY3PV+SO+QpL7nGt+cYTTU3Ivoxec84tTsD82qCNU/cPUTbRWQbLeMhgwo/+fnrlpXHuJAhhfKpyMm6T8HWbOx93CtElzVUu0icpe4W3v1QaviutnFKZLlygniV63GulDvcvqE8BPf4itiTwD56iuu8eEQBXAb9G1UirFxB0eLnbIQn0s7IybePZk/KSYsfbfhRkKnSq3N3akf2yFEsavcYLif5UxgmIy0AMGCAVjay3x/XhyvytNvjbYpXY2ezfJJ30+c30h8g6RmV0U0ifc0yNhRm4Nf6FDFsoxXtK+KWfhvFfarZuEHNdcMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJ/OEXn/P6zGU8D7yPP7Xxhit5mCspIlwUH1ORC06vw=;
 b=c4fIZrBHR2qMF979ZVbNje1lu1B7JJ+tDqj9En4eo0ieMr0VQmXtE/cXNwtrmpy78ECPALlsunhT4slYmj+/UXp1cDmYWfPSDLj7Cqg0VVlR9nRUuGnRuvzM6Fl3MSZJ+33wT/XSlJ8+A6RywQRoyyA+dVJ+YrvVjlYJW/ZPCMGayU64iQKA5uE5CD1tWjsF594YuixDwVVefLEMGRDf5Jfoy8oVfMkZLltAVaXCsYmQ5VAEwbTHQRFm/e8WbR7v3kzbJhneuGnf07pWKlm4kbrqJ9fzOOUAtnQMxQEY/ZwP8UKtGCzF7TXTdTS/xwZB7mja7MHpV/aerwRjE2hi4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB6766.namprd11.prod.outlook.com (2603:10b6:a03:47c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 17:15:22 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 17:15:22 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1] drm/xe/pf: Add runtime registers for GFX ver >= 35
Date: Thu, 6 Nov 2025 18:15:02 +0100
Message-ID: <20251106171502.3566894-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB3PR08CA0034.eurprd08.prod.outlook.com (2603:10a6:8::47)
 To MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e176740-b7a4-4b06-e04c-08de1d581169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjRrNTV4L1hKMGxPWU1Eb1hLNndNaTFxdjZJd1l6TlEyNkcveTJyV2JnYWxC?=
 =?utf-8?B?cEREbVZMYVVZTGMzL1BIb2VyUE1VVFUyTHVOVmtUMUw0ZCtkUUlFdWRZQk9i?=
 =?utf-8?B?azVIWTJIOTNoenBTV2t3T1dTcTRjZE14a3RZTVdDZUMxclg5ZEljdGhtTTdk?=
 =?utf-8?B?am1RWlVIN1NONXQ0UGh0MldiOWhZdGRpdmRYNnJiWGtZTnR6SmYyTU42QW9n?=
 =?utf-8?B?N0pHUE1TUFFUZS9XOEJPMzdpLzNnOUQ3VTFuN0paL0xFYXFtcnBld25OQjZL?=
 =?utf-8?B?RU1aUGRaRmcrUFhXTnRpWEc3cS9pcU5PdklKcW15Y2hZeG5qY3dXelJkMVRE?=
 =?utf-8?B?YTJPTzJCcFlzeUpueDJ3TVFnbTg1V0EyMS9haWd1Rjk0ZWsvcUQrNjgwZW14?=
 =?utf-8?B?c21TQTZvTVQwY3BjSXdTbW1sTU9ubm1NWXZscmk5bDFucjZzeENyRFc4Y25a?=
 =?utf-8?B?MFdUNmlpbmFUN0toOVdHUGZRUk8waFdkTDhkcXVtZXhLMkQ5NkxJY1BvT0hi?=
 =?utf-8?B?MG95M0FUeEZwWVF4REc2YWNPVmRzMDhjeUhoSWVuaytHeEdncktWeTlkWkgx?=
 =?utf-8?B?bWNySkg5QlZrNzFtbnlXcW1pSkYrYlViVCtSL0wveVRZUGYwVnRQSmJEZ3JW?=
 =?utf-8?B?Qy9TOWhudzdaeGpXbWk2RDU3SHYwajRERVJ3NkNENWZRMm96T2lXcUJFczU1?=
 =?utf-8?B?VWJadnNVaHMzeDZuSnNNbUp2SlpFZDBscE9peEVxeDdlRVFjWkFsZVRHQUdu?=
 =?utf-8?B?ZjJ4a2haeHVkNUhvY1ZoSGdnOUdnR1gvRHhMZFl3UWJYWVJFSXpLOEM2OWFW?=
 =?utf-8?B?bnd1eUJPY1ozQktsRFNKd1lVYmdla1pORm4wMlBoNHYxQ1VybEJzdDFEdUE1?=
 =?utf-8?B?bW12K0RNaTFkR1NoUXJ0aHU1OGpWMzBMaEJKWWg5Qjk0V1BMenVITStpT0hN?=
 =?utf-8?B?eDdZaTZzZkVpZzFMWGZUdkdnd01saXdybzB6c25IMDdmbkZCN3k2d25zclF6?=
 =?utf-8?B?K1F0cyt4WndjNUQxRVREa25MUlFHUzZYMU8rQnMvOEdQRUd2ekx0SnVueHE5?=
 =?utf-8?B?OUVjazMraDRkT1lJM3FzaUxodERhWlEzMmN1UDE3MU44Uk13Q0xDdkNKZ3E2?=
 =?utf-8?B?R0d0RkpCa3lqd29LQ2xtZDlEdkdLSTBTSldFbjY1RnBoQ2VYdkdrMlhvdmwx?=
 =?utf-8?B?djdqS0NGa0tpVHc1WVl1RTFORmNmeE9KTUVCNkl5ODM3MXhta0F5TGlxVy9K?=
 =?utf-8?B?TmNrL05NZzdvV1piTjM4UTl2R20veldtbmNKQVluU2pyVTdlMER3MzNUOElx?=
 =?utf-8?B?WERNd09ob2JXVEZaY2JqYVZYN0hpWkNQRExBL1lSd2lKc2I0QjBzK1BGbFMx?=
 =?utf-8?B?M2orQWZmWDVvdGtwZEEwU0FGdWEvdW5WSk11MkdOTlhoUGFtOGVqRGx3S3RB?=
 =?utf-8?B?b0xGTTZVNXJIb1NqUThEanExSXRMamJtMU4vTFJpSnk4Qyt0REM1T3dGZVFj?=
 =?utf-8?B?TFdWVzBSdUdsMXpnWTNOQjhBOEk5dUtXYXFCZDJ1a3o4dkFFSldkK1FDOWVK?=
 =?utf-8?B?ZVgwZEVjUGpMd29rejRCM0pKWEdOUE80YlJ4V1RCOWFBNmoyTlJKYkJrak84?=
 =?utf-8?B?NW1GcGtxTkVHWitRNHZqSExiSGVSMktkU09SN2diSTlHbkhObnZkdmhQNGtU?=
 =?utf-8?B?MDVoYk1XNmJJMlJCeW9TY3cyQnNsRGMzdDJkaU1VUGJNRnppbTZoTTR6N2Yw?=
 =?utf-8?B?aFFBVEE3Q2svQWg1Ui9qZ05rZ3cwZnRqUEI3eHZwN0drUjVkbFVOODZMTjVo?=
 =?utf-8?B?VjBNMG1IWlBQZzhQQzh1NTJCcG5rR0FaNmYxc3BraDdub3JtSmJ0WXgvUGJP?=
 =?utf-8?B?RXhyWm1zd29YbTFSWXNsTWlLNFFUemxTcmJiYVZHQXcyTFpMazl6OTVBSzk1?=
 =?utf-8?Q?SDLtONPn9iLPM3sgJvdbUyBkluFsEUFr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elVqM2h4ejM2TGxMOTlTcyt4Q3h6NGZZbEFTd3U4ZCtKbFlkSTRIaWs5MUlQ?=
 =?utf-8?B?bnJwTWtOVFlqdlU4Y1Y0SEpZNDcvNnBybDNZM3BlVC9GMDh2OTY2M3ZmTjV6?=
 =?utf-8?B?Q1kxUkdXUnAvbU41cjRNT3pueFpJRjR4anRjV0NjMHRudk1RRHlaNG1JL1Ri?=
 =?utf-8?B?Z25wcFJwOW5sdXF3bE9iWWRvU0FyMytRM2l0eW5UWXBCOFB5bDlVWWlKbllp?=
 =?utf-8?B?SSs3aGwzTWovVXduZFczSDc2UG5wRUdQOElqbXJKd0JGQ0E3Y2pSVkw1RzRU?=
 =?utf-8?B?NDdjeEhwZksvT2dNNi9NTTZYVnRHOU1nRitkekZFaXFMVG5SK0ppZjFCWXox?=
 =?utf-8?B?THdtbExxYTJKUG9pTjd0VjFoVHhEUzJDbjBDaDhVdXhXRW02d3A4ZW1UOElz?=
 =?utf-8?B?dkVlUXRQY3VncnozT2NXOUdDdjRQaDIreDBidlRsSDZpY3JyY0xIQmdXdG1B?=
 =?utf-8?B?YTQ2emRweDhjd0YrTWZicTF4VXVEU0JMakQ1NTROV2Vza09qRlUwMDIvQSt5?=
 =?utf-8?B?aGNDR2QveVM2VGFubHNtOWhxZTk0TWYzRGFQZmphbEJ0S011UXVtTGZtVVBK?=
 =?utf-8?B?cWdENjdQMFhaV3FNdnZMcXVOSkxLUWJoNjRaMFQ3QjdzY1p1Zi93VUhzQ2l4?=
 =?utf-8?B?d25zdTdDT29McFhZb3BFNkxpbndvZDVwRWdXc013QVRNaTZBczVST0J2L05L?=
 =?utf-8?B?ZmtOa3pJN2NLeXhhMEgwRFAxNk9aWUIvQ2RWVUJ4VUtNTTgxRWdINWdMdkZh?=
 =?utf-8?B?MmJJY082K1RkMnRaaTRNb3hIU1pnUzRvY1owYkw0NklKYjEyZ3ZMZXpld1Br?=
 =?utf-8?B?S25QTnJXZDZIMlpWaVR1clpMVTByMzdpUEFZWE4xdmV6UHFPY0dBcU4yY2lh?=
 =?utf-8?B?ZWh0Q1dDSUVaV0JZWU5qbklBT0pZVFRiWW5zU1N1bjhNY0NJbUxNcGwxK2VM?=
 =?utf-8?B?aUQzeFM5RUViN1c3TUFWUU5UZzZ2K3lxZzkxUi9idG92eWJ1R2ZCWnprTG5L?=
 =?utf-8?B?c1dMcFZnalBScWJmQi9BdTRCa0FDSWFKOHpESnVjaVdxNldVL2Rid05lalhI?=
 =?utf-8?B?SDN3M1dZKyt5ZDFzbjV5dlpabzFKSFc0Z1pINXF0VFRNUHZ6cTRMT3dSblNM?=
 =?utf-8?B?SWE1WTQ2NW1UTDZYRU1RM3JGcStJdkkrZldZQUFmemRsajMrUjhjanFxSmRt?=
 =?utf-8?B?ekIvMkc1bjd2UWI4ZWM3Kzh2bllHakcycGFFaU1wSi9SZyt1MHYxVFNGdkor?=
 =?utf-8?B?aWJ4M0lQTzgwNk5Gd25WWWIxcmpvMWNHdi9GV21sbEtuaHZRZXJWdDdrNHpy?=
 =?utf-8?B?TmZWV2l4bVJpRVVyeDZENEdLVHFudGVUNk1DZXBoWWR4VkdRMXpuSXVMMWMr?=
 =?utf-8?B?WW9JMENUSkhJYWwxck9EcENmTEZ6ODdKa0J3MmtzNHRyYU5Fc1VjZGVvUDNR?=
 =?utf-8?B?aTJQVmpURFc0STdON2pMY2pheDJVcWRlcEVWL2h1eXlwbFptLzc0OUdyUzdy?=
 =?utf-8?B?Wm5pU2VvdVlXSVo1RVpISTRjYzBvUzFSTFRPRUhqc1h6UzFpV201YkI3RUFT?=
 =?utf-8?B?R3pVZkZibWwxejNxYlpmWEZnaHI1UjNnTFlsR1VVeEFQR2wwTXp1NERGK0hW?=
 =?utf-8?B?SDZzeGt4aVZ0b1dYVmU2ZWdTUVI4ek80KzdtOVlVVW5nVFYzTnZZcTJGRDFq?=
 =?utf-8?B?T01mQjdmdmczNWhnaFZzSHNlKzRqUzlTN3RCQjd2cmtlVkZSVEg1QWpya0tQ?=
 =?utf-8?B?UG5kUnkrNG0yMlRqc041N3hWaG9hbklOWmcwaXdaUG14KzFyT0szVzhpT3l5?=
 =?utf-8?B?eUY3NloyYzVmT3ZuQzRSWXNzL25oeU5Yc1dqSllhSHRZbXFFTFd2VFVGSVE5?=
 =?utf-8?B?c000WHN4Uy9ibFM5Yi9YOGZrSzZERWc5UkRoVm9wU2ZTd2p2ZHVvL2IwVzRw?=
 =?utf-8?B?TlRmd1ZYZ2pxSFMyR1hYS21JcnVlYSt2UXVXeFdsK0UrRGJmNXlHMjBTdDBU?=
 =?utf-8?B?WlJWVVBCTWxpV3I2RnN4dVB4T3lBNFloL1FXRjFiRVQ4bElvRElzbjkydE1x?=
 =?utf-8?B?Y0xiWXVQdnNEY2doM1FpNmZMc3FaTlhJdkxjcVJlak1vcFFtdmtVVG5kOE9z?=
 =?utf-8?B?anVJVHdpSWtGbXNNcTl3OGZZNFo4WFBSVjZ0dzVDajdpOCtrTGw2NXQwWjRG?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e176740-b7a4-4b06-e04c-08de1d581169
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 17:15:22.1219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3AZMuPtfB5/7nwwIiaSAtOWrxhYCF2hPgmOmIYpUkCqLytT0VwnKRuhyumC/gVJr8oK5QbRI3oYz7tp+YgcxrujtfwzEwGseYPMwizN8SM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6766
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

Add missing runtime registers for GFX ver >= 35.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 22 ++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
index 76dd9233ef9f..c3281ed76aa1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
@@ -99,11 +99,31 @@ static const struct xe_reg ver_3000_runtime_regs[] = {
 	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
 };
 
+static const struct xe_reg ver_35_runtime_regs[] = {
+	RPM_CONFIG0,			/* _MMIO(0x0d00) */
+	XEHP_FUSE4,			/* _MMIO(0x9114) */
+	MIRROR_FUSE3,			/* _MMIO(0x9118) */
+	MIRROR_FUSE1,			/* _MMIO(0x911c) */
+	MIRROR_L3BANK_ENABLE,		/* _MMIO(0x9130) */
+	XELP_EU_ENABLE,			/* _MMIO(0x9134) */
+	XELP_GT_GEOMETRY_DSS_ENABLE,	/* _MMIO(0x913c) */
+	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
+	XEHP_GT_COMPUTE_DSS_ENABLE,	/* _MMIO(0x9144) */
+	XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,/* _MMIO(0x9148) */
+	XE2_GT_COMPUTE_DSS_2,		/* _MMIO(0x914c) */
+	XE2_GT_GEOMETRY_DSS_1,		/* _MMIO(0x9150) */
+	XE2_GT_GEOMETRY_DSS_2,		/* _MMIO(0x9154) */
+	SERVICE_COPY_ENABLE,		/* _MMIO(0x9170) */
+};
+
 static const struct xe_reg *pick_runtime_regs(struct xe_device *xe, unsigned int *count)
 {
 	const struct xe_reg *regs;
 
-	if (GRAPHICS_VERx100(xe) >= 3000) {
+	if (GRAPHICS_VER(xe) >= 35) {
+		*count = ARRAY_SIZE(ver_35_runtime_regs);
+		regs = ver_35_runtime_regs;
+	} else if (GRAPHICS_VERx100(xe) >= 3000) {
 		*count = ARRAY_SIZE(ver_3000_runtime_regs);
 		regs = ver_3000_runtime_regs;
 	} else if (GRAPHICS_VERx100(xe) >= 2000) {
-- 
2.34.1

