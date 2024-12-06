Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C28AE7717B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 07:40:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D8B10E5F7;
	Fri,  6 Dec 2024 07:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VThVyI5t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73D510E5F7
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 07:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733470807; x=1765006807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hlvNu75oYSmTXXUd2HKfV31qqpZGHfHy+wN0zHxKnQI=;
 b=VThVyI5tRpRpH1VjmH5M3UdG0yuFssbrSIhW4z9I6HsgTDMUax/K48AE
 L6Ms+3gnwagU0oPXV/cEHaSXS+R1nd9cJ0OJyIzptSThI9I7eYbD2LrGt
 6X6ecQofmRVn6Ee4Du6GfzuvrY/d7nh08BRMPvajpgJFWs/GoA9BR4Vz/
 MY7SSUU9f99KJXBGrgWYmCjr7nkibArn+9Bh++UlPfBsZOXFo6BzskybQ
 KQI6bVGU5sDik7V930xDguPGbV8zoGi0sawSQWmLq80Dy+bRZBTCKS4gi
 87ZPE69EoltraHh2dvPmB8QHQT0xdEqLkA5TIGfBdwOTv4/WrM+Xk4Mgy A==;
X-CSE-ConnectionGUID: Fg7oAUTNQVujLhUW+lAd3w==
X-CSE-MsgGUID: 2aXxMJwGQpyGYSZ4Camp/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="59215939"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="59215939"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 23:40:06 -0800
X-CSE-ConnectionGUID: ElFqhnelQiKyIwg9/yL/UA==
X-CSE-MsgGUID: vU9kH6Q1RYGHAzkilXLYag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="94406475"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 23:40:05 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 23:40:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 23:40:05 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 23:40:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jaWrCI7VOGFNE5cTEHjRH5IDYSZ/SbeEBQdUl/Wp3b1YkTgTVGhKcUSwDJhueqNlBClPujaaIwFFuO8FKpPRRPByF7d7BRqy7qtyUsylsZSWcSOWN9ECb55Mo5dVSn48EzGiM3sEePa8Q8noVeKdNE/a/bmV7tLDwgq1UC7CkFTMadE/HLT44An5wjuv5asap+7dD0akmnnbcK+PqhjPHKVQZScJRafq15iPUhLQ06rI9c3mLK19NDCgIdWaeBus4gXIUNFMjOk1VaBTtXc8liWJauMJJRyGyYtshBtTnY8Xkl+qi5UA9rVdg69RfPkjeLnsvPExCXQGmxDZr/MAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3nEZT95QDt1H3vtf4n+VBjdpYYsJEfc7NHKVBaOrJE=;
 b=GkFoeeK3Uy0Nwnhmwx/jhZ+E9XMi6ognXn9yYCEMbsXxLsGdsrKJgaS+H1vZk/MvQ6GRHAu8QtF5zDUcC68om8zj7QlcKyRBnkPlsWViKKvKS0g0XE2KSx8UrLyUTh6aHUFsM6P25wLIq5mRw9PHx0icbsF7rx/joSqbf1q+25jzXaonrsmExrzYnjQXOc8ZbiySH0N5vWpfwRzS8S7AphIwY3F3DrnbFx+DpFfXSJQFYRieT3VmEYBosTNdZTNE3kwczcK1H2+dv4o0aroNcJhpNqgoyly14Qvg7HbH6DTdaEDyzzwZ6aG3kP1a3QeBz1r3rG0o+kkZzJ9TgWQcvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7622.namprd11.prod.outlook.com (2603:10b6:8:144::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Fri, 6 Dec
 2024 07:39:59 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 07:39:59 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v1 1/1] drm/xe/pf: Use an explicit check to see if the device
 has LMTT
Date: Fri, 6 Dec 2024 08:39:48 +0100
Message-ID: <20241206073948.870892-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241206073948.870892-1-piotr.piorkowski@intel.com>
References: <20241206073948.870892-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0035.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d236655-19e3-493c-5fdd-08dd15c9300c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEpWWHU4Rzkyb1MzYS9RS0dmaW9UUGQ5aGd2VE5Xck9vU1ZPNy9WNnVQQ0s1?=
 =?utf-8?B?SVhJNHlLSTI5OWRLdFBtbEl5SHFma3ZaRFVTUzNrVmtTSGFLMWpUOHgzeHVY?=
 =?utf-8?B?aDVIWEdlRHJpdVU3bXpxNk1HVVE2c3U5SkV2VmdoN0oyL25rUVVmSHNoSmQw?=
 =?utf-8?B?a1IyMUhyTHA0ZkQ2ak9uZStqd0lJd3pSRDN5OTYrbDJySE4vRG04SkgwV2dz?=
 =?utf-8?B?bldKWkhrN0ZUSW4yTVRMbTVOMkNsMEpNVFBwZVh6dm8zdzB4dUpJZStibjhB?=
 =?utf-8?B?UXZKQkN4WmlOVnhUOWJDYWdNcmlCeER2bDJEZTU4SnBvR2d3SVZtNlFBd3pa?=
 =?utf-8?B?RXN2R0ttWGZhc2dxMEI2VU9CcXMrV2EzdEpqQlRHaDZNN1JrdWZoMXFNMzRy?=
 =?utf-8?B?b24xMnFvbWNtcko4amROU2k3alJKTlZhQlRRQWNoQlZVWitqb2lSZFZNb1JY?=
 =?utf-8?B?OUZsOE1xbktnWGFuQzlFSlJHUEtZS0FKNE1yZVF2RlVaZnhtaE9IbTFSSnh2?=
 =?utf-8?B?TEkxTU84KzdId01CcWFwbzNmWHE3QkFzUVd2OS9oVDRsRG14VlNCeGREVXlR?=
 =?utf-8?B?OEVLSnYxU1Y4eGRYbUh2anllU1hJL0dVVEdmTll3azgxeEViRnRJOGs1WE91?=
 =?utf-8?B?d2lkV3dPakNoWXY2bk82Wkk5U3hUNDBnRWdwQi9kbDRCUnZORTArVEdYMC9K?=
 =?utf-8?B?RW80Sno2MlNFVno5cjd1KzA4K2NGS2VVemQ5Q3Zoa3lwOUFnYVNsWC9WWGtD?=
 =?utf-8?B?Nm16Q3RtZWNld0tBUnVrcmtJbmd3L09zdElPbUErcTBPUUVuMmtHUXVTc2s4?=
 =?utf-8?B?MHdUZkkwZFM1VFQ4R3lqNTlua1V3NjBhaVg1Z09wR1AvV2ZlNUNZaWtPRjU1?=
 =?utf-8?B?NEpkTjdKeERlc2NDK3RNT3NwTDRTQUNqOE5LVDZBYlJFN0ZraUhzYjI4WWVY?=
 =?utf-8?B?ZVZNZUNYRDJBQXlFaFp1cTZ4YjFJN1pzQVFoZXNJbU11SzBtd3JLWWFkLzRX?=
 =?utf-8?B?UXI5WndkU2I3aDBiZjMrbVZYdENGWDFXdFlUWTMrdUt3WkV4cCsxc1NhR0tj?=
 =?utf-8?B?Nk1HVkluNUhNRzBEYlU3RzRrUng2YlAzbTNyV3VONzRBNXJOYUN3RkI0UHNP?=
 =?utf-8?B?SEVZSHdqc1RkdzJiYTc4cUJZSUloVEVJeUozakx4b0RUOHVTbERtU0gwQzA4?=
 =?utf-8?B?S3dMYU1WcDR5OWlYU0F0TlRtT1RMd2taWnI1cEduc0NKRHlycWN1TGg4dktK?=
 =?utf-8?B?bXp0QVVVaWs2R3M2Vm1KMkNld3cxTVlETkFvSDBFWVN3MEY5b1YzbTh4bnFv?=
 =?utf-8?B?d1F1SjErSnplSXlZZGVqSk5LSlRJKy9kS1pSdEdLT1BmRU9pU0RkS09ySWxH?=
 =?utf-8?B?OEhMWGRTZE5qV01icXN4WEcwUG9NQk83VnZsK2h2eHJhVlVqYmw0a0x0YkhB?=
 =?utf-8?B?UE5NWkwwRUliT3VEcmdWaHNKbjhFZllXUThzc1ljdWtmb0ZPK0hTK3BCS215?=
 =?utf-8?B?UHVNTWpaK1ZabTJ5eFZaWDRvalhIWlk4Q1E4VksrSHpPTnBkOVhoR2tvUXBy?=
 =?utf-8?B?VmpUMGFNZFp3T2pzekZJK3N2OWhDYytZQjNsV3EvL2hGdlFFNzlGbkIvNHgx?=
 =?utf-8?B?WHp6TVZWdllRNlhGYU8wOUFGcnh6elR4TVk3MmtuQWlxdWUzMndXdXBwMG1B?=
 =?utf-8?B?Q0dZeXRiRXdBV0YzeXlydzFnOGhzL2tUb1BuQ0M5MzFaQjhnaitlWWtGWHpo?=
 =?utf-8?B?Wnh3WEJ5RlBVamhSdGxUVEpKbGVDck1Mc1I3Y0N4cTRWM0kxbFJZaHpIREhF?=
 =?utf-8?B?S1B6Tmg4a3kxMjF6dE44Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0h4VHc0OXVzcExSYkFRVUJBM2lCTzhBbEEwUzVqeFZ1N0lqeDBsM1BRR01E?=
 =?utf-8?B?dkUwejJaOVR3T0xNZWt1SGE1cDNPbWQwODZ5RUE0dHBtOTNVNWVOYlVucE9S?=
 =?utf-8?B?QXk4M21tSEN2clpnSUNLMGpNNVc5SzI2RmNvN2VCVFI2UGh0SFNiUjlta0FN?=
 =?utf-8?B?OGJTUkFkZHhKL2sxOHBjd0JuUk5VNjVKR2VjRjl1OURIRFllS0dkWjdjZ1lV?=
 =?utf-8?B?bUNxOGpqSVhHSi80RWh3Y21hdTg3Zk1KdkcvYSswSGp4Q1lJU2pqK21VSXVL?=
 =?utf-8?B?WUJCQ2UvSm4yd3JJdWo3VlNsMkpHUEo0UlZJa0szMi9tTmR1djF4YnJwbHB0?=
 =?utf-8?B?clJzVnJtUlZsSWw0am15ZVhMZE1oMTQ0bDZTYU9FSTJkZlRHR1l4aHZCc0ts?=
 =?utf-8?B?Qm1qRE9ZaUpta2x3K0JUY2E0TDcwdDNudTAwaG5kQ2dremVPSnRvNStmQnIr?=
 =?utf-8?B?NzVaVjYvaGxvZVd0bytka2MySTQ3TjZ3eG90SldsNkxyTUEwVW5PVmFUTWpZ?=
 =?utf-8?B?TzdUUmdJQkFKYzlyRVk5STR2Ykx1b283VnpodjJjanZSemJCeW5ObjJscHp6?=
 =?utf-8?B?WHhoSG5rYzFwcE1CUGxaTENKODZoMFBuN3Rnc2JlOXVCcDRleEpnOVB0QzdN?=
 =?utf-8?B?UFcwRjVUU0xYTkRVZXkxTS9sVHRvZklSK2cxeGV5UHJXSEhWTXFRdFN4WVRw?=
 =?utf-8?B?c3BKZ2k4WkpsdHNndlg1YTRXendVM05KazdtbEtxeStvTzRnQ3RJcjcxcWRr?=
 =?utf-8?B?MUQwbnFLUHVPK3JrU01rdURuT0thU1lZY3RuZnhzN1Joam9OTGxvVTFYeHI3?=
 =?utf-8?B?aCtmWDVQU2FHaWVyeWxEMk50U2tDSXFKRzhYQjZnb2NKRjlRVW1DL2ptdkl2?=
 =?utf-8?B?RTR2cndYQTRjMlVBa3lxMnRjVmJyS2FsbFovWExHU1h6VzVsL29OckpkdFE3?=
 =?utf-8?B?R0pGMzF6bGRaZzdYczNJT3FpZzFqSW1STWIrSkUwbmgydVNYZmd2UnBFelpm?=
 =?utf-8?B?Q1hUMzJqd1YvR1FVVXBwZ2ZVbFhDblNpS2IrS211WDB1bTFlZ1NFTFVkVnY3?=
 =?utf-8?B?c2U1ck5tK2d4a0ZpNTdUUTh3RERmMms5Q3dLTW0vTkpwdHFJS21pVDNzRk9G?=
 =?utf-8?B?K2F6ejlIaFM3S245UEFkb1lwQTh3MXpOVy9Kb241ZEJ5QS9DczZTR1ltYUxG?=
 =?utf-8?B?WlJHZWVtemJocHRLOUwzaGkvNUNXblpRTCt6dzdDZ2JIVHhBaWc4WVNMQW1V?=
 =?utf-8?B?dzBEOGhzV24zUTZ0QmZZbkdxQjRKRC9BUWdGbERseTBhV20zMnhpeEpMZXEz?=
 =?utf-8?B?bllJS1VNTGFDT0pZMlFuTmJCb1JSZnA1TzlmTDZZUTNVSlJLNmFkTDQ3V1FD?=
 =?utf-8?B?Tll1cFROWUV0TjR6ckIvZ1c0bEJScXR6Q2c0TG8rR21lMGFJZCtucDlhN3hz?=
 =?utf-8?B?eUlOcmY0WEFBUlIxVlZ0SFd0MUhTNWpGaldpaFlQdkE5emxCRHl6bm5uV1RC?=
 =?utf-8?B?MEJmMlpqM3llbmtRSWhyT2xmVExuaVJNUmNwajJSZ3oraEtDQnI1RmdmNm9R?=
 =?utf-8?B?cGRBU3J1MnlpWnd3cnRRcEJjMmNPYlhxSSs5aHBmSWlVRWRTWHdxVUtUZE0v?=
 =?utf-8?B?VDlKVUY4NkdweDg4RXBnd1RHakU4allzaE1QTHpNaGo0WlpLakJEK1B1Nkhq?=
 =?utf-8?B?VWd4MnBGbStUTnphN0lmdkNhZW5Rd2hSR2FLYU5zVG9SR1NrbzB0Z0RTdFNL?=
 =?utf-8?B?T3htejh6cDY0L3Y0bzd2aWYwZlBzOGxXQkdncmNRekp1S1oxTFplOVFSdy9G?=
 =?utf-8?B?TmN2ZUtiWkh1anFKMXBURWk3NFhVMVBsbnNPR2hXdWViNENUcUJDcmVMVmVt?=
 =?utf-8?B?VHYrMytZNDdldE41cjZGTnMzUmU2VGlIVG1mR1ZqUXgxT0Nqa0JlaUQ1TVFM?=
 =?utf-8?B?WXZBcSsySWlrd1ZEbHRSam5XYVBQZW51aFRvMVFkRzhmUjRqakNQeXZ4UEhG?=
 =?utf-8?B?NC9ZUm4zWEs5MlN2d205OEg4aU5HS1NrSzJxVUxYZlIyVjlKTjA0OTZzWEN4?=
 =?utf-8?B?S2FNeXIxRHF6SXJYYnRHbENVOWhLV3RZZUNtYmt2MHhOQ3A0UHV3dlZzWTBD?=
 =?utf-8?B?bXF2eFVMelVTc1pOdkg4STZ1clY4T0FOeVhGVWJaS2tDeE1uaTZ2OEJ3Rytt?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d236655-19e3-493c-5fdd-08dd15c9300c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 07:39:59.6149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WY0fcyjX8a857F7SwVOxMdRx6Z3Bd0xQP+JPmXHnA9+c4SjNYtvOpi4ihO4JBAAVUJ5/rhseY/PhQNttDoCxosF/8H4ynL0WllP02Ch9xJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7622
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

So far, the main condition for using LMTT has been to check that
the device is a discrete gfx. In addition, we have checked, using
assertions, that the device is PF.
Instead, let's add a dedicated function to check if the device
supports LMTT.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h             |  5 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 12 +++++-------
 drivers/gpu/drm/xe/xe_lmtt.c               |  6 ++----
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index f1fbfe916867..b2f5cbd111bc 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -171,6 +171,11 @@ static inline bool xe_device_uses_memirq(struct xe_device *xe)
 	return xe_device_has_memirq(xe) && (IS_SRIOV_VF(xe) || xe_device_has_msix(xe));
 }
 
+static inline bool xe_device_has_lmtt(struct xe_device *xe)
+{
+	return IS_DGFX(xe) && IS_SRIOV_PF(xe);
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 65082f12f1a8..a7c222c6a6d5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1302,8 +1302,7 @@ static void pf_reset_vf_lmtt(struct xe_device *xe, unsigned int vfid)
 	struct xe_tile *tile;
 	unsigned int tid;
 
-	xe_assert(xe, IS_DGFX(xe));
-	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, xe_device_has_lmtt(xe));
 
 	for_each_tile(tile, xe, tid) {
 		lmtt = &tile->sriov.pf.lmtt;
@@ -1323,8 +1322,7 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
 	unsigned int tid;
 	int err;
 
-	xe_assert(xe, IS_DGFX(xe));
-	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, xe_device_has_lmtt(xe));
 
 	total = 0;
 	for_each_tile(tile, xe, tid)
@@ -1390,7 +1388,7 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 	int err;
 
 	xe_gt_assert(gt, vfid);
-	xe_gt_assert(gt, IS_DGFX(xe));
+	xe_gt_assert(gt, xe_device_has_lmtt(xe));
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
 
 	size = round_up(size, pf_get_lmem_alignment(gt));
@@ -1583,7 +1581,7 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, num_vfs);
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
 
-	if (!IS_DGFX(gt_to_xe(gt)))
+	if (!xe_device_has_lmtt(gt_to_xe(gt)))
 		return 0;
 
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
@@ -1945,7 +1943,7 @@ static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
 
 	if (!xe_gt_is_media_type(gt)) {
 		pf_release_vf_config_ggtt(gt, config);
-		if (IS_DGFX(xe)) {
+		if (xe_device_has_lmtt(xe)) {
 			pf_release_vf_config_lmem(gt, config);
 			pf_update_vf_lmtt(xe, vfid);
 		}
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index a60ceae4c6dd..edb3527789c3 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -161,10 +161,9 @@ int xe_lmtt_init(struct xe_lmtt *lmtt)
 	struct xe_device *xe = lmtt_to_xe(lmtt);
 	int err;
 
-	lmtt_assert(lmtt, IS_SRIOV_PF(xe));
 	lmtt_assert(lmtt, !lmtt->ops);
 
-	if (!IS_DGFX(xe))
+	if (!xe_device_has_lmtt(xe))
 		return 0;
 
 	if (xe_has_multi_level_lmtt(xe))
@@ -485,8 +484,7 @@ u64 xe_lmtt_estimate_pt_size(struct xe_lmtt *lmtt, u64 size)
 	unsigned int level = 0;
 	u64 pt_size;
 
-	lmtt_assert(lmtt, IS_SRIOV_PF(lmtt_to_xe(lmtt)));
-	lmtt_assert(lmtt, IS_DGFX(lmtt_to_xe(lmtt)));
+	lmtt_assert(lmtt, xe_device_has_lmtt(lmtt_to_xe(lmtt)));
 	lmtt_assert(lmtt, lmtt->ops);
 
 	pt_size = PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
-- 
2.34.1

