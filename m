Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC597CE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 22:11:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6172010E035;
	Mon, 17 Nov 2025 22:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nncpQqOG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4624810E035
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 22:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763417508; x=1794953508;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=HlQkni933sWusMrKeg5qweywtYlSjPXkfnusZagLu4o=;
 b=nncpQqOGfSnuZbrH2tdVwS4/wm7FObf3l94aovrsm8Q1XH1tJSecCnU1
 F0Kmu46mr0eT8kcsKHaE8EYaglfz9F/UUN0Tsa0iZvF8RjPBDwELYzWzw
 5+/rJZKt7qc9uxkVa2s0QyrrXP+zhmGsKy4JjEo5xsxmaHAukIUxtymRS
 ocMCpRi4iK53hDK9lC5LHMqMwhfiVpwZ6DxYzHiYP1ghfYLYMVhvhxuS7
 G95v/cQ3IIC2LYVZbumjqqGDLPibo34tt3FkhxyHHgp3DkHMP9hXWhmNk
 mJnoW67GY6s+bKhK1sKfoMgSoBvgT/3DibBOdkLng27ZnNoui7OmDAaey A==;
X-CSE-ConnectionGUID: fMw45fipSkK3RRYS5MyoDA==
X-CSE-MsgGUID: WkMqEcCoRe+QGx+yvCyxvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65470170"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="65470170"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 14:11:48 -0800
X-CSE-ConnectionGUID: /I3qzywVTP245/5+m3Xq/g==
X-CSE-MsgGUID: iPMdP1kpTDuCFRl0qqBkAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="195500840"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 14:11:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 14:11:47 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 14:11:47 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.32)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 14:11:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OK8ML7nbUzd0z8e9ZRM6rFnec5YV7hoHpLd8talYHc0zDoR6yV0w/C6xYa3RUnAt2wxpZ2yT2udcuIWQJG4Z9BiAGdvU8AOpPHU1sK+RdWdIQ65qTY87xOaz51H/ob2BIr5SrgGLpLWaLClkCNS2PR3TFC6quXi8VWNAu3hgdj1Q/K4LYFHJaMVwm5JCgJJD1vBTQx28yt7sS4oKnlWx9ptCTrWweGAbTMBel/s2ypA8VQgg+HoBLVtpmVYSKnrXy2IAZHkncGRRkqFeYGW/5EiKLtXLDBp4HstXnBcmDw4LHMsKuZAVcsDcK15gYM1A3Ktw8g/TYHymw7Z9YOm7HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0bJFxgb2r/lSlUNEWWgTdSr2JXjlK3Xjkndv+7ROZ4=;
 b=KMHtegY+6sm/yHv/zXf884ZfyXaxhUBYWFtuKXCzoujLExzr2Fc0CSTfljfwrfyRoHzS+nIyIfp3TDmfiOh0w19hSkEqUyAWNG8Ab/YqtFyFuReEPR7RHCR40MvvOdNiKP1y5bSyANHUHh01WItLc9bUzL7eicbWBwKPhyVW5eRRUre5RrrBoirqz6Y/pEUsBv4ofeF3bAiGCCfLvj+Os2+XI4YxJ9mKL4WMIvrB1Mb4NIj/xEbZKmR187p3ljb0ImX1q0Bagzcp2YvOR0VuAOMiP+8wkTeMODVqBmF4uG2KiyP45CRiA8icsAiWt2OMuKQL60T4+8PzXnqgoB0eog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 22:11:44 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.019; Mon, 17 Nov 2025
 22:11:44 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251114214335.2388972-42-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
 <20251114214335.2388972-42-matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 13/27] drm/xe/display: Use scoped-cleanup
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Mon, 17 Nov 2025 19:11:39 -0300
Message-ID: <176341749971.5989.17296693505198711220@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::6) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: 85015d92-93b2-4f4b-8963-08de26264ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWJvbVZJN01nRVdXTGVkS3lRU0ZxeEUzNW1IOE1ibnVlRnVKS0xzMjg0VHRl?=
 =?utf-8?B?OC81NUlQRUlKVms2VU5hcEZRQnpQTUE0a2VSMTJYUUpWdnk2N0dMUjcrNWNi?=
 =?utf-8?B?TExENU11YUhBNEh3VUphdVp1L25wbUErZzgxMGtwTmxqM05uM1VQeWlhR2pp?=
 =?utf-8?B?aTdCNVpGNndKczd0NjEzenUzWFBhWmtPWFdVZmkxVzVkV2FpaWZpWmNNUFdD?=
 =?utf-8?B?OUVlRFR5WFVsV1RQUUxBRlRiV0lZQm1BamhuWFExN2xHeHk0RDFNUnl3bzRC?=
 =?utf-8?B?Q1cvTjVKSjlaWGhhS1lqYnpoSFFITThtcHVGTElURGdOc0h5VFJhb2hjeDlL?=
 =?utf-8?B?dWVBYi9OSnl1a2FZRlFyMFYwS1RJWFkwOHllMmFVTmtWbE95RERPclVMSlJa?=
 =?utf-8?B?dDhjcTdQOU1xRUpVY21tUUtZNGI1ZU4yU1o5cFV4ck9QYWJQMkJERmZzZFlT?=
 =?utf-8?B?UXhDMEJiRU1ZVGdmV3dnN0Qwc1pmM2oyaVFxdTcranR3bUdTdHpIdEdPbnZP?=
 =?utf-8?B?dWlWMGtsR0xabWkzQW9WRWZFRVN4b2dJQ1htRms0eE5GYkJPbmx1K25oVG9x?=
 =?utf-8?B?RkRwa3lZb0dpelJkczlDSEVVZDNLVXpXZFFWUmxoY2UrMWxnT2xuTkVEWm9D?=
 =?utf-8?B?VjhXUVlDU1BFSExBdXJSWnVPMzU3SzM0dkIyNDBiNjhsK0dac3NnV2tzMXZJ?=
 =?utf-8?B?a0UxNmRuMTZnNnlXRkRCeDJJbFM5aVU2Si9LNHIxeG03dnpHdExHZmNlUUdN?=
 =?utf-8?B?YUVETHhqcTg2M004VzV6azkvWitiM1hwTUhBWjM0NHloWktzNC9wbEhKazF0?=
 =?utf-8?B?UWFwZEVHSEZwOUlwdWtQbnVwcFFrVnordzlzVlhFU004MFNmalA1TjcrN0kr?=
 =?utf-8?B?MHRVRXVkSFphWEdXa2x4amQ2cStzWlFRNmsyYnRuWEtlUHFoaWRQd1Fob1Fh?=
 =?utf-8?B?UWVzRWptUmdDRjczVldyT0xNWkhrRUFRYzZjT2xuVVNwb09MVTEwSWdGMytl?=
 =?utf-8?B?cHVKaWVVZ2FCQzRhQnJURDRSVDlxTWdrb2ozMUNha0ltM0FGZVpTUWlvdWhZ?=
 =?utf-8?B?SFBUVTdhRXlxUW9EUVhlbDFJZDBJdnVVdnFwczFLeHcxWkJJTjZWZlVzK0Jn?=
 =?utf-8?B?QlpMRmJXNmt6dVJYN3JCUnZmTUNZUzVydFBzQllzYWtpTWl2OVJ4Tk5pdFh2?=
 =?utf-8?B?Zmc4STVZUGxnWU1lTDhTWnZ0R1E3V2NxOUFUc25PRzFBUDRhU2hyZHBDZGV2?=
 =?utf-8?B?SFBkWlpSOVdQYW1OeWg3MTJJOEZaNmgweVJSVWxZd1NRTUIrZXBROG9TNzFP?=
 =?utf-8?B?M244dG5BUU4yU09vbWFYeDA5d0FUZTJFbUJjWGVkYzZZTlN4eGtadUx1Ni9G?=
 =?utf-8?B?QUVJSllWQzBsMHJUc0txL3VEM00zZkNXWDdHNUVGK3M2OVRtQ3o1alpKRVY2?=
 =?utf-8?B?NnIwbjI2YTFlZ0NWQXc3UVFYdkZwaGtDaE83dTlHNjdoM2IrWW5nSkE5TUhN?=
 =?utf-8?B?VnJLbTJSazlQZ2tPenZDZ2FGb29zN2V5b3UyVUh0VTNuL3lJbkpnNUhPSExk?=
 =?utf-8?B?YW95OWxxOEs1aDM1dE4wVWpuM25DVEFRdEk3WUxYR0dXRktFQ25HcVlwYVgw?=
 =?utf-8?B?eDdHaVVGUVd4V1MyV3FBWjF6NHF2RGRMemkvb2NFQS9xTFdzQ2xSaFJuT0pz?=
 =?utf-8?B?dlVrTFllYWE4UHM4eGdWdkRYbjkxVCtLSHV3L0pYa1k2eDI3Q0dpS2NnZTg2?=
 =?utf-8?B?WnZTQnF2OXY0aFVzUk5FSnJrM1BFS1RiN1JTY05hREpuT2tiejNGbHNaYWQ3?=
 =?utf-8?B?TW92aVVlYS9hOTRoNS9xRk1zVjZVaFg2SlZnZG9iNjlJNktlSFRQQlcyWWJD?=
 =?utf-8?B?NXUzUlI3WGNQRGFrSzMrZDh2N0hTRWE1ZHBXN3ZuTTdmWE9XUjdvRmMrKzNS?=
 =?utf-8?Q?iFp3kJxmtNRxDPBxPXRV2eTFGdxIbF0H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUJTcXJFTXk3QzU3VElxQ2NoUHdESnZMQzVKNUNwTDBCQzZLcHhFSjFFQ3dq?=
 =?utf-8?B?TURWcnFaY2RadXpreVpaTStYd2orUi9rODZCK3d5NXhWU0FmR0o1ZFpKYjFn?=
 =?utf-8?B?R1ZyVEhISXU0Nkp0QnNRckJMbllXWlJPUmhmZm1sTWo3RHJ2dk16aFl2ZTBB?=
 =?utf-8?B?S09obmFiTU8rQjkwTFoxdkttVjU5dnN4ek82RUNWbmkxUGQ2OXRaL2FMM3NU?=
 =?utf-8?B?d05ic2g2VzZLbktGYnBwQXFqMnlzUUxQQkloc1pzUHpGelZIaDgvR25yb3B1?=
 =?utf-8?B?MFNKb0xMbXJjS1JuWFJyd3lIYUo4UlZiQ29SQVlicWNuelRsTkc5UkN0dDBH?=
 =?utf-8?B?czRnelNNUmlHZWU2d0NMbVdnQW9nTSt1Y2RxM2pOazU4eUoxSzVES3dCQWFP?=
 =?utf-8?B?a1pTRjdrT29vSEp0d0lxdDlqRVZCQVRCTDc0Wk40M0d4eE1USGNKU0tlbUJm?=
 =?utf-8?B?RlJneURKU0VtazdpMkhMYjdhSG1hdGkvVnkraCs4VStRb1ZIUDQyY1lGU1JJ?=
 =?utf-8?B?Y3BXNVJReS9CTjBZWkFoYVR5RjJvWGliMnJGS2VUcWhRUjJIdy9SY25JMVJG?=
 =?utf-8?B?L244eEV1UEwweW5vN3pPSDRjQ04yalhRNWk0dE1EekdzNlB2WGhYaTRkZGRk?=
 =?utf-8?B?dGNsMEN2eVplamNBTXBPQ0hlT3B6Lzl1RElKZ2RRdXdpWEhHTWZvZUpFa0Vq?=
 =?utf-8?B?VDZUUm5MeGlDYUdxN3Bpb01QeGVYVGVhNDYwV1g2ZWlMcWJNREpYai9MeUhj?=
 =?utf-8?B?NytXamp6clFwZW4rRDRoWGdzczJMRldDcitOaW9QYkFmK2czeUJRRjFCWkhw?=
 =?utf-8?B?MHJKYWh0bks2WHhNN0NPSnlLQWFKUFM3cHJId1dNWHJGRHkvKzM3dmdlMVpQ?=
 =?utf-8?B?MEhLNURCdFdQYllGazBPalgvTjFmdHRtNW5keFIrZkp3dWpvZXoyd25nYm9N?=
 =?utf-8?B?NmxneklCMnd3eDJoOUFxZmo0TTBqdER3YWNwNmRXT21GV1d0eWs2VHB5OHBn?=
 =?utf-8?B?bXNlblpqYjVSdUd5Tzl5OWp4NllreEhMdmRXYzdxeHA2YjJQa0hQWVVJUkdU?=
 =?utf-8?B?NlJTNXlEeFhnSVMyVk1XVnF2aU1LSnA1SmovYVpqZGJLakVrc0dpK2tNTjdI?=
 =?utf-8?B?a2FNdzBHTmovMG11Tko0akkwOWplUWdkOEF0Rnk1SzZtOGtwU2IraDhUWTRp?=
 =?utf-8?B?cEkvL3I1K0lLcW9TM096NGZlaCsyNU1qdGRDMC95bE9vTWxPTFdsL3pSNUU4?=
 =?utf-8?B?MktTS2pWOUhNeTBmY1dTYldxYTgvaklRNCtBdkJtUFk0ckhWdUpxSngyUkZL?=
 =?utf-8?B?eHNCOXBEazR3cGdRS05MTGVFQzJIQ3BxZTV4S0toOGhPa29LVlFUbjI2QkNh?=
 =?utf-8?B?M21FVlcxSG5pZ29Sem5tSmdnUVk3dEx0RG1Rd21WZGM5LzlyNTFBOC9wdTlT?=
 =?utf-8?B?NHJXYzEwTGkxbWFHMHNyVDZ0b3JtRU96c3RiU0IrRFJoTlZvV3FZNXJEQUtZ?=
 =?utf-8?B?RGI2TnM2ZkVFMHJTVGNtK0FueEVrdVlMZDU5aStESkd0RE5zSkMxTWVIZFps?=
 =?utf-8?B?MjRGdXJMdFNQUlV1cWJrWlA5YUVUbFFmZFd0YzFXd3o5WVM0MDhZL1I4MVpY?=
 =?utf-8?B?T2hYRGg5RzJLemNZYW9TQ0xjeE9CNGs0YitEQ01MTDZEUjN5WmhlaG1VSi9Q?=
 =?utf-8?B?b2N0N3UvT0ZBM0tCUENZL3J4VElPQWhEU1BkL1RwZGVRbmZ0MjhWSnhDWnVz?=
 =?utf-8?B?VDErTytlSkhtUFpWQ1ptRW9DMnFWVlMxa3VVNlZISThlTUdVbEc4SnFLTnRn?=
 =?utf-8?B?RjVYSlFWU2docnB6TldzMEMwSDhrWXpPb1hLdVBvb3dWaHFXNHlXVkVQbWFC?=
 =?utf-8?B?TVUwNFpjWDVLOXlVOFErRE9QUWdIMVBxWHYxZzcyVndFd0R5YXo4TERENStp?=
 =?utf-8?B?bjA2Sm1WMUt1N3dEZ3B4TjdvWTBkYjhRajBUdlNOQlp0YnI0STM3eUorYm9D?=
 =?utf-8?B?Snk2WEVhVjZhOTZkZHBZRWhzZFpBYVo2ejArempXRlpOQUlzSGtxcnRJbXVm?=
 =?utf-8?B?Umc0Qmt4TVk5R2wxMHRFU1I2R2hzdnpjK3NRaUpUUXF3V3grS3FFdExESEJZ?=
 =?utf-8?B?QlRvNGJWUk50STVtYUJHaDFoRmR0Z0VvUUpSVEVXblowWGZQNjZ6WUpwZ0FB?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85015d92-93b2-4f4b-8963-08de26264ad1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 22:11:44.2508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYVGt1FRQR+lOsTUTAvAXWkcf9LN46LBn4i85tP2XHC0vmFralFyanYaFpKX6yxOlhLqha0ZlB3cRk8ZXTuyag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6397
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

Quoting Matt Roper (2025-11-14 18:43:49-03:00)
>Eliminate some goto-based cleanup by utilizing scoped cleanup helpers.
>
>v2:
> - Eliminate unnecessary 'ret' variable in intel_hdcp_gsc_check_status()
>   (Gustavo)
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/display/xe_fb_pin.c   | 23 +++++++-----------
> drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 31 +++++++-----------------
> 2 files changed, 18 insertions(+), 36 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/d=
isplay/xe_fb_pin.c
>index 1fd4a815e784..6a935a75f2a4 100644
>--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>@@ -210,10 +210,11 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_f=
ramebuffer *fb,
>         /* TODO: Consider sharing framebuffer mapping?
>          * embed i915_vma inside intel_framebuffer
>          */
>-        xe_pm_runtime_get_noresume(xe);
>-        ret =3D mutex_lock_interruptible(&ggtt->lock);
>+        guard(xe_pm_runtime_noresume)(xe);
>+        ACQUIRE(mutex_intr, lock)(&ggtt->lock);
>+        ret =3D ACQUIRE_ERR(mutex_intr, &lock);
>         if (ret)
>-                goto out;
>+                return ret;
>=20
>         align =3D XE_PAGE_SIZE;
>         if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
>@@ -223,15 +224,13 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_f=
ramebuffer *fb,
>                 vma->node =3D bo->ggtt_node[tile0->id];
>         } else if (view->type =3D=3D I915_GTT_VIEW_NORMAL) {
>                 vma->node =3D xe_ggtt_node_init(ggtt);
>-                if (IS_ERR(vma->node)) {
>-                        ret =3D PTR_ERR(vma->node);
>-                        goto out_unlock;
>-                }
>+                if (IS_ERR(vma->node))
>+                        return PTR_ERR(vma->node);
>=20
>                 ret =3D xe_ggtt_node_insert_locked(vma->node, xe_bo_size(=
bo), align, 0);
>                 if (ret) {
>                         xe_ggtt_node_fini(vma->node);
>-                        goto out_unlock;
>+                        return ret;
>                 }
>=20
>                 xe_ggtt_map_bo(ggtt, vma->node, bo, xe->pat.idx[XE_CACHE_=
NONE]);
>@@ -245,13 +244,13 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_f=
ramebuffer *fb,
>                 vma->node =3D xe_ggtt_node_init(ggtt);
>                 if (IS_ERR(vma->node)) {
>                         ret =3D PTR_ERR(vma->node);
>-                        goto out_unlock;
>+                        return ret;
>                 }
>=20
>                 ret =3D xe_ggtt_node_insert_locked(vma->node, size, align=
, 0);
>                 if (ret) {
>                         xe_ggtt_node_fini(vma->node);
>-                        goto out_unlock;
>+                        return ret;
>                 }
>=20
>                 ggtt_ofs =3D vma->node->base.start;
>@@ -265,10 +264,6 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_fr=
amebuffer *fb,
>                                            rot_info->plane[i].dst_stride)=
;
>         }
>=20
>-out_unlock:
>-        mutex_unlock(&ggtt->lock);
>-out:
>-        xe_pm_runtime_put(xe);
>         return ret;
> }
>=20
>diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe=
/display/xe_hdcp_gsc.c
>index 4ae847b628e2..71d21fde1736 100644
>--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>@@ -36,8 +36,6 @@ bool intel_hdcp_gsc_check_status(struct drm_device *drm)
>         struct xe_tile *tile =3D xe_device_get_root_tile(xe);
>         struct xe_gt *gt =3D tile->media_gt;
>         struct xe_gsc *gsc =3D &gt->uc.gsc;
>-        bool ret =3D true;
>-        unsigned int fw_ref;
>=20
>         if (!gsc || !xe_uc_fw_is_enabled(&gsc->fw)) {
>                 drm_dbg_kms(&xe->drm,
>@@ -45,22 +43,15 @@ bool intel_hdcp_gsc_check_status(struct drm_device *dr=
m)
>                 return false;
>         }
>=20
>-        xe_pm_runtime_get(xe);
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
>-        if (!fw_ref) {
>+        guard(xe_pm_runtime)(xe);
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
>+        if (!fw_ref.domains) {
>                 drm_dbg_kms(&xe->drm,
>                             "failed to get forcewake to check proxy statu=
s\n");
>-                ret =3D false;
>-                goto out;
>+                return false;
>         }
>=20
>-        if (!xe_gsc_proxy_init_done(gsc))
>-                ret =3D false;
>-
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-out:
>-        xe_pm_runtime_put(xe);
>-        return ret;
>+        return xe_gsc_proxy_init_done(gsc);
> }
>=20
> /*This function helps allocate memory for the command that we will send t=
o gsc cs */
>@@ -166,17 +157,15 @@ ssize_t intel_hdcp_gsc_msg_send(struct intel_hdcp_gs=
c_context *gsc_context,
>         u32 addr_out_off, addr_in_wr_off =3D 0;
>         int ret, tries =3D 0;
>=20
>-        if (msg_in_len > max_msg_size || msg_out_len > max_msg_size) {
>-                ret =3D -ENOSPC;
>-                goto out;
>-        }
>+        if (msg_in_len > max_msg_size || msg_out_len > max_msg_size)
>+                return -ENOSPC;
>=20
>         msg_size_in =3D msg_in_len + HDCP_GSC_HEADER_SIZE;
>         msg_size_out =3D msg_out_len + HDCP_GSC_HEADER_SIZE;
>         addr_out_off =3D PAGE_SIZE;
>=20
>         host_session_id =3D xe_gsc_create_host_session_id();
>-        xe_pm_runtime_get_noresume(xe);
>+        guard(xe_pm_runtime_noresume)(xe);
>         addr_in_wr_off =3D xe_gsc_emit_header(xe, &gsc_context->hdcp_bo->=
vmap,
>                                             addr_in_wr_off, HECI_MEADDRES=
S_HDCP,
>                                             host_session_id, msg_in_len);
>@@ -201,13 +190,11 @@ ssize_t intel_hdcp_gsc_msg_send(struct intel_hdcp_gs=
c_context *gsc_context,
>         } while (++tries < 20);
>=20
>         if (ret)
>-                goto out;
>+                return ret;
>=20
>         xe_map_memcpy_from(xe, msg_out, &gsc_context->hdcp_bo->vmap,
>                            addr_out_off + HDCP_GSC_HEADER_SIZE,
>                            msg_out_len);
>=20
>-out:
>-        xe_pm_runtime_put(xe);
>         return ret;
> }
>--=20
>2.51.1
>
