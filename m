Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EDCC02198
	for <intel-xe@archiver.kernel.org>; Sat, 15 Feb 2025 00:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FC210E367;
	Sat, 15 Feb 2025 00:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kVanUiRD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5149910E119
 for <intel-xe@lists.freedesktop.org>; Sat, 15 Feb 2025 00:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739580276; x=1771116276;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=muVhi3KFn+pA1pi++A/mF2kRuIfaYmHWjEUTPE83YQ8=;
 b=kVanUiRDR4XJF0GqvzJqY+stjMnzbdzZQuP6sNh2xj1AhzZmndpQ4NEM
 WrigaiAqA7XGl0NWEKY8rgMNynzHmw5MYdPrxEmCZEe7zhN7ystMMbU1m
 OMpo1HDoa/8NA0/IWOH42B/CLidEv+snoZQuhCi+XGKg+MAsgHu6utqny
 c4wM5UlPF75MToOeC3heLHMtDnFPEV62C5OUpcQEE15aNJzVi/TZPwEfa
 YaySp0TRFwrStheODdKux6vkg8rqtBJxT5V2wKPPPBcxLR4A0wDdgzKRh
 8uRWo3TL9FL8Uu/iLcZbqQAQvvAPUHeyeXsHg1XPPP6C0MsZZm7AsKBnU A==;
X-CSE-ConnectionGUID: 8Bv6FtfCSVCwsSF1jS/Jsw==
X-CSE-MsgGUID: aloImoYMQq2S8uwaZGTV2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40469833"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="40469833"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 16:44:36 -0800
X-CSE-ConnectionGUID: 1WteImfiTlC0vqEi870JXw==
X-CSE-MsgGUID: byg2gDAtQN6gxCMDwgJgoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114511758"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 16:44:35 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Feb 2025 16:44:34 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 16:44:34 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 16:44:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USjxA9XoJEs1i/sk9MdZVX9OIOPShV1FsJqkrpdHgF1HC84wvsq99gvurLsDRJW5nPgTCGqCX/eoZY4JUA4eLz5dy5NYDtNVO9+UZCyc1QBiJn3n7lN4wAFYADVw7TNLiz/e9eo/+gGmFxpRp7D8/qdo0t102x7kMu0XxTVIqE1Fj3+iQbEheo4JpvxfPsZZBM+OrR6u/dHmJKNqe+6nfGc0nwfRgN4++BThOBNXSRfsyM0AV7N2WmR4acKBgUs8tqWPO78baoaNC3N+CHz71pvsSNFwnGB6j1jHrHlWdruAVgg2R7TH5uEDYBedoWbO2M5SeitnkM4ftgmwgn2FPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHFVziyKqodXzNcMBw4PcKfLKE11PCC091gzgRvaq7w=;
 b=UDWRQV1bquZQbFTMSnEK14MT4Fie0s3qQYZ1ZNIzLxUwFitlwqh+yV0wXQcWgNXXBZJ294xto0OmjudryOFTToG55d5nFmhpq84XxN7HvlPha1UPQPDn3BsgK9W374e2lSjO/a1rvzIVuea4pj6q2snouPauRshZRy83ZSkBMHuHJF+q13UpFb+DPORHe9vznwLSBucRnnQtAOMy8C91fhKK0e4zvewiSM3S18eoLM072U1bgy8myx6jHwXuLLAagGI50SUbTw9b/e7GAvh2j2+NLvD/bguZW4ab3nkDlzM+TESFcRNszxWPiOFKHFLixASit9JekM5hcmZAT/860Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by PH8PR11MB6660.namprd11.prod.outlook.com (2603:10b6:510:1c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Sat, 15 Feb
 2025 00:44:30 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8445.013; Sat, 15 Feb 2025
 00:44:30 +0000
Date: Fri, 14 Feb 2025 16:44:26 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v9 4/8] drm/xe/eustall: Add support to read() and poll()
 EU stall data
Message-ID: <Z6_jaiUEyoqoXz3Y@intel.com>
References: <cover.1739193510.git.harish.chegondi@intel.com>
 <2c6ba4545b30b3f7ff0055fd9994618fd31d12ab.1739193510.git.harish.chegondi@intel.com>
 <851pw37zrk.wl-ashutosh.dixit@intel.com>
 <Z672GhrHuyQaGVBd@intel.com>
 <8534gg2rl9.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <8534gg2rl9.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0237.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::32) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|PH8PR11MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: 73852aef-03d7-41fd-a781-08dd4d59e838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzBkd0xzaFVmRFlXK1VGa3lLWVlBZGhpS0NRUXhzVSsvVktCaS9HLzh1UW5x?=
 =?utf-8?B?VStJbS8wVTJZMjI0VElyL3IrMHpVQTZPcVN3ZzhZVloyRVJJUDFEaG9zZmdr?=
 =?utf-8?B?aTFKaXpZWGhQNG1IU0wzTURVNHpHcTRnN0twbXlpVHB0UUFHSHkzcllGeS9Q?=
 =?utf-8?B?dUJaRk1SQWZkeU5ER0RjSFV0TXR6c1QyQzRtZGsvYzFIOEpnc2h2bzd5dTR2?=
 =?utf-8?B?S1JuV2NHdERWNUdJZ2JzUEpsa0cwTWIxdWtVbkJFcDROSFpBcktXM0p2Qmpw?=
 =?utf-8?B?U201dmo1SWliUllkZGFncHlSRkM3bnVxZWEvejlBelh4RjQyM2EyaGNoL2RR?=
 =?utf-8?B?Sm11UHlld2hVWXJ0LytJMlhLbEF1OWdWUXJBdm9MbHpGN1VTRnNyTVYvRGFm?=
 =?utf-8?B?cGtoMVdzaDBkVDZKcVZ3QXd1S1VaYm5ERXhZQ3hSMGY0WjFNMUIzNUprNzJo?=
 =?utf-8?B?cE8rZm13TDlsV28xcDVRclNTcytrUVhHVzBEZUFRSEZMTjNabXl4ankraFBq?=
 =?utf-8?B?ZE1LNXlTTml6cjQ0RjE2aXZtNmJEaTdXdE1lN29BRS9wOTc0V01TL3FTd08y?=
 =?utf-8?B?Y0VQSzdmczFhUWo5R29qeEpTMzlnUjZhYzNtSGNWSnVEclh6cHgwVHdrOFNB?=
 =?utf-8?B?dGQ5dnlURXdIcGgxb3cxZGVBbStaTkRXK1BKNVk1ZjJnWm43Q0k4dUNSUzUw?=
 =?utf-8?B?RHpTTGdwbXc0Nnd3S0pkZWtzQUg1cHVqQmhIUDhYcGFNN1ljeCs5UXNOeVAx?=
 =?utf-8?B?b21UY2J1VzEyUDFzRk1PWEJGNkJScjNvSGo5NzhMeXJVS2hNZkNkdVdZTjY4?=
 =?utf-8?B?MDcreFRpMkdHWnBTaXNtV1F5cmRKc3N1S2QvZVZiQXk5dGdjMTh4S3RIQjZ1?=
 =?utf-8?B?eUtxYm9XeFF5TExJVWtTV25nU1MwN09jOHBaMVlDNUdJMDlUSmo1OTNYQmFr?=
 =?utf-8?B?VGlPZHRFVWRyZkZsRkdWUGd0OGczelNaMUZ6Wlp0VGxpSkhZeE1JdnhBVmdJ?=
 =?utf-8?B?L29XaVQwR1loNHNURDdhd3dKRmF4a2VyY2ZuemloUnlzakdCelVkb2s4OUpa?=
 =?utf-8?B?dERuWUtvVnk2MVV2cUd6M2t6ZUQwQTVGM2xqTHQrN1hxUHFYZlJ0UnNwQUtq?=
 =?utf-8?B?VVVFS3BtejRKVEpsRkNUYUJFenczT0M2YmFwamUyNnVyMTJhQjY2VVhlQllt?=
 =?utf-8?B?NHZHMkdrUnpuZ3picHlvRlo3b3hsVm5jSXlPa3gwQ1ZRNG9ROGgwanMxTkNw?=
 =?utf-8?B?d3JyUDgzUjlwcWpwbUNlQ0hmSk1CRnBnV2VaUmdzYVBycE9ucHp4d3JXM1Ur?=
 =?utf-8?B?a2RyVWo2TTljREs5RW1qZGVFNWZ4SmswcnNSTGZJdUY1QS8yNlhBdjI4MG5I?=
 =?utf-8?B?TTJUelV4U25wcER3Skt2MDE0NGdwUzVHQ0NEcXMzTHNiZmFZQkdRdDF3K2Zz?=
 =?utf-8?B?V1BCSWQzR2ZKdkVHODJ0WFlBREhSQmFqVExaeVhtemFTSG1rRStSVStXZkMy?=
 =?utf-8?B?SEg4T3B6Q2R6dW5XRDczWjVoL0RQQnpZTjQ2YXJvbktHM1pvYi8vU1VPUG5w?=
 =?utf-8?B?M0VQZ0t4dEN0SkZRb2JqbU1zMituTVZPUGVBV2t1T01tTWZ6bWlBT0FMV0VW?=
 =?utf-8?B?akowSEI5VFB1QVVYc0tnSkhYcG5LK2t0dTZHMllOd0ZoMVo0dWFMRUVQMXFD?=
 =?utf-8?B?dUhGeGdmTjFDN2JsbDgvZ0NYbDdNWk5RcDFWanplRFRvUE1hS1psNTA1VUdr?=
 =?utf-8?B?M3ZibTNDMENpS2RXUUZNZzNrRHhrUXI2SUlCWXR2bENaWG4vTW5TK0JlSFRN?=
 =?utf-8?B?ZkVISzFiWWlMcVQydVZGZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REx5UVNRLzZMOHNKalZ1TWdjYTdqZ0sycDRNaDVMVjFOTGluam12eU9pQkZu?=
 =?utf-8?B?Wk8wODdNajBnMVVFYlN0UklDcG01Q1h4eStFYWhJMmpaOTZEQ0V2Y2xxV3g5?=
 =?utf-8?B?R085RWJHcWpFcTlRS3MyS2p4d1VEZmp6RDc0YmY0dWFFS05ac1lXVlZHVFgr?=
 =?utf-8?B?OTcrTEVQMkxNZ1JEUVlnMzV6dlVTZU5PYitYcjhRaGFxZ0FYQTJUUXFuelB6?=
 =?utf-8?B?TjJTc24ycTlJc0UvcE1nWXZzR1U3VElYbHB0cTYzMGFtQlhRL0g1T1JvSjJp?=
 =?utf-8?B?VElmY3FqTEoxU2lCZXlYK2dmd1RYQmdFY1VrMElUMWZMZTljb3VwTlhJU3JW?=
 =?utf-8?B?UDRPdkN3V0toQ1lDekp0TitsL0tyYXltV1Azbjc2WHM1eEVVN0NCL3NmR2ps?=
 =?utf-8?B?RFJMVDJ3blpUcmdIbW5teUh2TFpsQ09UT08rbDBlcHVEMXY0WWFTNVFlT0VP?=
 =?utf-8?B?WE5Hd2dydlRxOVViaURGUUZQMXdteDlvVjhWTDFyUHBOcXFHQ0hSSFVxdmQr?=
 =?utf-8?B?UlpXNlV0REJway9tT1ZaYjg3RFJYZlFhS3l3UTZOTXczWENSaHFiZExBRnFP?=
 =?utf-8?B?SnduMU9qZityazkwSWZOMll6VC9OM2ErM0hlUlFCZk1uWW81azFwOUV1azRw?=
 =?utf-8?B?SlhSUnUxckFOL2p0a0dNRW5UVXArbVBCL3I3SVp5aTdRVC9ST05qR3FKc0RY?=
 =?utf-8?B?aXl4ellPVnUxM0tiOG9tNzFQVHZoRzNSR0t3RnNpVjlEbGhsYnpOTDErSnRw?=
 =?utf-8?B?T0N2ZTdVbkRCTEpkbklORDVYQlNSUWlDM3FQalNwNkhwd0VPMldjd2xCZS9S?=
 =?utf-8?B?VC91NVkyNlN4VEpPQkhyR1NCMlR3YXZlcnB4U2QzaUp1NTJlZ3JiOG1sVHRR?=
 =?utf-8?B?TU9FK1V1dmV5T2dZaWtxTGM5Z2FraFdnTGR3MHlrRjFGY2N5aUM1LysvSUJK?=
 =?utf-8?B?dWRyaExaRXF2Wms1TkVndXJTdzRvOW0ySzdZc3RIc0EvZ3l6L1Q2WDV6bVNo?=
 =?utf-8?B?WllEcWlETGJoSDBUNlhOeVdrMmxjemtrWGtpcjljZnk2N2NyR3RnTndUckRT?=
 =?utf-8?B?elVPUWRKRE9aU25EaXEyU0pvV3FXNmlsZVlIL3RGNThvM3pUMGZsWVlBUDNo?=
 =?utf-8?B?aVdxRmNuODA0NzhTWXhLdWYxM2loMjhjMklPTVF0cVc2UWdDNGRhdlF4Sm5T?=
 =?utf-8?B?VFhTOW0zcnJQcUk3a1NxYnRXQ0JoMytCYXJXWmsySFMvU1hxdVFQRHV2Z0xz?=
 =?utf-8?B?dUhydmtHUjdodENYWWpseUxvRnBlbEtUQWFiRTg4cDBXYVpPRFFmcmRRV0lU?=
 =?utf-8?B?L2oyV2VWUE5idFRkbWl1aVN5S2NBYVUrVytVS3RKdDV2OU0rR3F4cTRBcVJ1?=
 =?utf-8?B?T1dVd1doOHlhUUNlQ2ZlMjNVNzhuME13UWl6ei8rZ1JVTG1KWGxnZ3R1cEJ2?=
 =?utf-8?B?WFBTOWZTVC9BNHpNenFvZ3NSeWdhWGwrQ3RMQUVlNW1NL2NxVnA5emhIUkdQ?=
 =?utf-8?B?dVVuYjd1YWdhY0Nsd1orV3I3RmtiMnpRSUk3T1BrVlZsQkxwUHg3L1M3WVk3?=
 =?utf-8?B?LzJSekY5VDJhRzQ5QUcwWlM0SGJZUFo3eHArYnJnWTBibkFYa2NpaTUxR0JB?=
 =?utf-8?B?ZTkvaWN4NmJ3YjVYWlRQVXYzdjBoeE1LZEUxWUEwWVFTa2haMWh4NnFrNmZY?=
 =?utf-8?B?WE9JN0l3VHdLQWlsbHJReVZHNjF1UTUrbEVSc29FOGhCdEFMWnZWWVM3WDNi?=
 =?utf-8?B?R1NDOUtXYjlxelVXbDJXVERUU0Y2Ti85UE9FWTRRaEZpeWZGZXo1WFJKeE5C?=
 =?utf-8?B?czdicEZyTTQzU0FpOFlKRDRjeG9PVU40MmI1YjlXSGtERXQ0TmlkY2pSSXJZ?=
 =?utf-8?B?NFhvWkRFcTJXVjA5SWduSnRVUysvbXIya2NoMUY5WjdCbXdrUjJoWGpRSFNK?=
 =?utf-8?B?NTJXZTRXZjVZRWwwWk0yc3g0VmFBSm5DYkNCZ1A5TTdwekU1c1NCTHNxakRN?=
 =?utf-8?B?YUJKZytlZTBXNXNvOGtNRXJkOVBVVjM0NFJ3dVdBdXhkcnovMkFkeHpyZ05u?=
 =?utf-8?B?LzJIajNyWEs5N3N0cW1qSzR1Qm8xK0FtNUtJejZJRTFyWDBmTmg5OWhBU2R3?=
 =?utf-8?B?L0VZZ1BRcDBSUHQzKzJJV3NnVWlONlNvcmJUMDJib05wT3VuZWs3bFpMY2tp?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73852aef-03d7-41fd-a781-08dd4d59e838
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2025 00:44:30.2096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Y0aYNKm5NC0wE2DZD0s5YlLL5t9xB13YhcFZLF2A4O19RopqXxXDCvwD/RHnLG3TKdNjPfYbJPqCN/IidNO2zKEKdW+bVYRpRX3VP0VUN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6660
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

On Fri, Feb 14, 2025 at 12:34:26PM -0800, Dixit, Ashutosh wrote:
> On Thu, 13 Feb 2025 23:51:54 -0800, Harish Chegondi wrote:
> >
> 
> Hi Harish,
> 
> > On Wed, Feb 12, 2025 at 11:02:07AM -0800, Dixit, Ashutosh wrote:
> > > On Mon, 10 Feb 2025 05:46:45 -0800, Harish Chegondi wrote:
> > > >
> > >
> > > > Implement the EU stall sampling APIs to read() and poll() EU stall data.
> > > > A work function periodically polls the EU stall data buffer write pointer
> > > > registers to look for any new data and caches the write pointer. The read
> > > > function compares the cached read and write pointers and copies any new
> > > > data to the user space.
> > > >
> > > > v9:  New patch split from the previous patch.
> > > >      Used *_delayed_work functions instead of hrtimer
> > > >      Addressed the review feedback in read and poll functions
> > > >
> > > > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_eu_stall.c | 267 ++++++++++++++++++++++++++++++-
> > > >  drivers/gpu/drm/xe/xe_trace.h    |  33 ++++
> > > >  2 files changed, 298 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > index 12afa9720971..53f17aac7d3b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > @@ -21,6 +21,7 @@
> > > >  #include "xe_macros.h"
> > > >  #include "xe_observation.h"
> > > >  #include "xe_pm.h"
> > > > +#include "xe_trace.h"
> > > >
> > > >  #include "regs/xe_eu_stall_regs.h"
> > > >  #include "regs/xe_gt_regs.h"
> > > > @@ -41,7 +42,9 @@ struct per_xecore_buf {
> > > >  };
> > > >
> > > >  struct xe_eu_stall_data_stream {
> > > > +	bool pollin;
> > > >	bool enabled;
> > > > +	wait_queue_head_t poll_wq;
> > > >	size_t data_record_size;
> > > >	size_t per_xecore_buf_size;
> > > >	unsigned int wait_num_reports;
> > > > @@ -50,6 +53,8 @@ struct xe_eu_stall_data_stream {
> > > >	struct xe_gt *gt;
> > > >	struct xe_bo *bo;
> > > >	struct per_xecore_buf *xecore_buf;
> > > > +	struct delayed_work buf_poll_work;
> > > > +	struct workqueue_struct *buf_poll_wq;
> > > >  };
> > > >
> > > >  struct xe_eu_stall_gt {
> > > > @@ -256,6 +261,190 @@ static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
> > > >	return 0;
> > > >  }
> > > >
> > > > +/**
> > > > + * buf_data_size - Calculate the number of bytes in a circular buffer
> > > > + *		   given the read and write pointers and the size of
> > > > + *		   the buffer.
> > > > + *
> > > > + * @buf_size: Size of the circular buffer
> > > > + * @read_ptr: Read pointer with an additional overflow bit
> > > > + * @write_ptr: Write pointer with an additional overflow bit
> > > > + *
> > > > + * Since the read and write pointers have an additional overflow bit,
> > > > + * this function calculates the offsets from the pointers and use the
> > > > + * offsets to calculate the data size in the buffer.
> > > > + *
> > > > + * Returns: number of bytes of data in the buffer
> > > > + */
> > > > +static u32 buf_data_size(size_t buf_size, u32 read_ptr, u32 write_ptr)
> > > > +{
> > > > +	u32 read_offset, write_offset, size = 0;
> > > > +
> > > > +	if (read_ptr == write_ptr)
> > > > +		goto exit;
> > > > +
> > > > +	read_offset = read_ptr & (buf_size - 1);
> > > > +	write_offset = write_ptr & (buf_size - 1);
> > > > +
> > > > +	if (write_offset > read_offset)
> > > > +		size = write_offset - read_offset;
> > > > +	else
> > > > +		size = buf_size - read_offset + write_offset;
> > > > +exit:
> > > > +	return size;
> > > > +}
> > >
> > > Looks good now :)
> > >
> > > > +
> > > > +/**
> > > > + * eu_stall_data_buf_poll - Poll for EU stall data in the buffer.
> > > > + *
> > > > + * @stream: xe EU stall data stream instance
> > > > + *
> > > > + * Returns: true if the EU stall buffer contains minimum stall data as
> > > > + *	    specified by the event report count, else false.
> > > > + */
> > > > +static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
> > > > +{
> > > > +	u32 read_ptr, write_ptr_reg, write_ptr, total_data = 0;
> > > > +	u32 buf_size = stream->per_xecore_buf_size;
> > > > +	struct per_xecore_buf *xecore_buf;
> > > > +	struct xe_gt *gt = stream->gt;
> > > > +	bool min_data_present = false;
> > > > +	u16 group, instance;
> > > > +	unsigned int xecore;
> > >
> > > u32 and move above to u32 line?
> > >
> > > > +
> > > > +	for_each_dss_steering(xecore, gt, group, instance) {
> > > > +		xecore_buf = &stream->xecore_buf[xecore];
> > > > +		mutex_lock(&xecore_buf->ptr_lock);
> > >
> > > One thing I am wondering about is: do we really need these per xecore_buf
> > > locks? How about moving ptr_lock into xe_eu_stall_data_stream and just
> > > cover for_each_dss_steering() calls with the ptr lock. Because the polling
> > > thread runs every 10 ms, this should give plenty of time for the polling
> > > thread and the reads to go through, even with lcontention. And it will
> > > eliminate all these locks and the locking/unlocking overhead.
> >
> > I used a per dss lock so that polling and read on two different
> > subslices can be done in parallel. I will try moving the ptr_lock into
> > xe_eu_stall_data_stream.
> 
> If you do this, please rename it to dss_lock or something like that, to
> indicate it is guarding dss level info, not just the ptr's. Maybe rename
> the lock to dss_lock even if you end up not doing this.
> 
> > >
> > > > +		read_ptr = xecore_buf->read;
> > > > +		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
> > > > +						       group, instance);
> > > > +		write_ptr = REG_FIELD_GET(XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK, write_ptr_reg);
> > > > +		write_ptr <<= 6;
> > > > +		write_ptr &= ((buf_size << 1) - 1);
> > > > +		if (write_ptr != read_ptr && !min_data_present) {
> > >
> > > Don't need to check for 'write_ptr != read_ptr' here, it's already
> > > happening in buf_data_size.
> >
> > Yes it is not needed. But eu_stall_data_buf_poll() is invoked approx every 10ms.
> > I am not an expert on compiler optimizations. If the compiler definitely
> > optimizes and prevents call to buf_data_size(), I can remove this check.
> > But if the compiler doesn't optimize, wouldn't this check help avoid
> > function calls given that this function gets executed every 10ms?
> 
> The function is called every 10 ms * num_dss and then it is called every
> dss for every read(). Even then I am not sure why you are obsessed with the
> function call overhead. See here:
> 
> https://github.com/torvalds/linux/blob/master/Documentation/process/4.Coding.rst#inline-functions
> 
> Specially "The cost of a function call, after all, is not that high" (it is
> typically memory accesses which reduce performance, not code execution). I
> would let the compiler handle this sort of optimization and decide whether
> or not the function can be inlined.
> 
> Another option is to use always_inline if you are really concerned:
> https://gcc.gnu.org/onlinedocs/gcc/Inline.html
> 
> 	static __always_inline u32 buf_data_size(...
> 
> though I am not sure if just inline is already sufficient:
> 
> 	static inline u32 buf_data_size(...
> 
> So let's do one of these two things and remove this check, I'll approve
> either. Sorry if I asked to remove inline earlier :/
Okay, I will remove the if write_ptr != read_ptr. But I am not sure if
want to add inline. My understanding is we only add inline for very
small functions. 
> 
> > >
> > > > +			total_data += buf_data_size(buf_size, read_ptr, write_ptr);
> > > > +			/*
> > > > +			 * Check if there are at least minimum number of stall data
> > > > +			 * rows for poll() to indicate that the data is present.
> > > > +			 * Each stall data row is 64B (cacheline size).
> > > > +			 */
> > >
> > > I'd say this comment is not needed and should be removed, the code below is
> > > clear enough.
> > Will remove.
> > >
> > > > +			if (num_data_rows(total_data) >= stream->wait_num_reports)
> > > > +				min_data_present = true;
> > > > +		}
> > > > +		xecore_buf->write = write_ptr;
> > > > +		mutex_unlock(&xecore_buf->ptr_lock);
> > > > +	}
> > > > +	return min_data_present;
> > > > +}
> > > > +
> > > > +static int xe_eu_stall_data_buf_read(struct xe_eu_stall_data_stream *stream,
> > > > +				     char __user *buf, size_t count,
> > > > +				     size_t *total_data_size, struct xe_gt *gt,
> > > > +				     u16 group, u16 instance, unsigned int xecore)
> > > > +{
> > > > +	size_t read_data_size, copy_size, buf_size, data_record_size;
> > > > +	u32 read_ptr_reg, read_ptr, write_ptr;
> > > > +	u8 *xecore_start_vaddr, *read_vaddr;
> > > > +	struct per_xecore_buf *xecore_buf;
> > > > +	u32 read_offset, write_offset;
> > > > +	int ret = 0;
> > > > +
> > > > +	/* Hardware increments the read and write pointers such that they can
> > > > +	 * overflow into one additional bit. For example, a 256KB size buffer
> > > > +	 * offset pointer needs 18 bits. But HW uses 19 bits for the read and
> > > > +	 * write pointers. This technique avoids wasting a slot in the buffer.
> > > > +	 * Read and write offsets are calculated from the pointers in order to
> > > > +	 * check if the write pointer has wrapped around the array.
> > > > +	 */
> > > > +	xecore_buf = &stream->xecore_buf[xecore];
> > > > +	mutex_lock(&xecore_buf->ptr_lock);
> > > > +	xecore_start_vaddr = xecore_buf->vaddr;
> > > > +	read_ptr = xecore_buf->read;
> > > > +	write_ptr = xecore_buf->write;
> > > > +	buf_size = stream->per_xecore_buf_size;
> > > > +	data_record_size = stream->data_record_size;l> > +
> > > > +	read_data_size = buf_data_size(buf_size, read_ptr, write_ptr);
> > > > +	/* Read only the data that the user space buffer can accommodate */
> > > > +	if ((*total_data_size + read_data_size) > count) {
> > > > +		read_data_size = count - *total_data_size;
> > > > +		read_data_size = (read_data_size / data_record_size) * data_record_size;
> > > > +	}
> > >
> > > As I said, my preferred way of writing this is as follows. Isn't this cleaner?
> >
> > Most of the times, the if condition would evaluate false and the body of
> > the if statement would not be executed. Whereas in your code the two
> > lines of code get executed all the time.
> 
> The only thing extra which maybe gets executed unconditionally in my code
> is the ALIGN_DOWN line. the min_t() part gets executed for you too in the
> if () check. Correct?
> 
> But once again you seem to be obsessed with these micro optimizations: it
> is not that simple:
> 
> 1. We don't know how the compiler will optimize
> 2. The CPU itself does out-of-order and speculative execution, branch
>    prediction etc. So for you the CPU might actually be executing the code
>    in the if () statement (both when result of the if is true and when it
>    is false and then discarding the branch which is not taken).
> 3. Execution speed is driven more by memory accesses and lock contention
>    rather than code execution itself. So mostly code stalls at locks and
>    for memory accesses to complete.
> 
> So with all this going on, my rule is to only make easy to understand and
> maintain. And let the compiler and CPU take care of running the code
> efficiently. Of course we can't do ridiculous things, which we are not
> doing here.
> 
> Also, since you are obsessed with optimization, ALIGN_DOWN() uses bit
> operations (AND etc.), rather than integer division, so is more
> efficient. Also, use of pre-established, standard macros, like min_t and
> ALIGN_DOWN, is preferable, rather than rolling your own new code.
> 
> > >
> > >	read_data_size = buf_data_size(buf_size, read_ptr, write_ptr);
> > >	XE_WARN_ON(count >= *total_size);
> > Wouldn't count (size of the user buffer) be greater than the total_size
> > most of the time? I am still not convinced with having a WARN_ON here.
> 
> Sorry, I meant an xe_assert() here:
> 
> 	xe_assert(xe, count >= *total_size);
> 
> To make sure that (count - *total_size >= 0) in the min_t statement
> below. So if we use XE_WARN_ON(), this would become:
> 
> 	XE_WARN_ON(count < *total_size);
The code has sufficient checks to make sure this doesn't happen.
> 
> So either is ok. I think it is good to have it.
> 
> > >	read_data_size = min_t(size_t, count - *total_size, read_data_size);
> > >	read_data_size = ALIGN_DOWN(read_data_size, data_record_size);
We don't need this ALIGN_DOWN() here if we have the ALIGN_DOWN() you
suggested down below.
> > >
> > > Since data_record_size has to be a power of 2 for this to work (which it
> > > is), I would even put a
> > data_record_size is fixed in the hardware. As of now for both PVC and
> > xe2, it is 64 which is a power of 2. I am guessing that it will remain a
> > power of 2 in the future too. Why should we put an assert for the record
> > size which is determined in the hardware?
> 
> Because we are explicitly making use of the property that data_record_size
> is a power of 2 in our code. The ALIGN_DOWN results will be wrong if
> somehow data_record_size were not a power of 2.
> 
> And it also makes clear that the code is using this property and will break
> if it were to be false.
> 
> That is the purpose of the assert(). If we weren't making use of that
> property in *our* code, we wouldn't need the assert.
> 
> > >
> > >	xe_assert(xe, is_power_of_2(record_size));
> > >
> > > in xe_eu_stall_data_record_size().
> > >
> > >
> > > > +	if (read_data_size == 0)
> > > > +		goto exit;
> > > > +
> > > > +	read_offset = read_ptr & (buf_size - 1);
> > > > +	write_offset = write_ptr & (buf_size - 1);
> > > > +	read_vaddr = xecore_start_vaddr + read_offset;
> > > > +
> > > > +	if (write_offset > read_offset) {
> > > > +		if (copy_to_user((buf + *total_data_size), read_vaddr, read_data_size)) {
> > >
> > > internal brackets not needed     ^
> > >
> > > > +			ret = -EFAULT;
> > > > +			goto exit;
> > > > +		}
> > > > +	} else {
> > > > +		if (read_data_size >= (buf_size - read_offset))
> > >
> > > internal brackets not needed          ^
> > >
> > > > +			copy_size = buf_size - read_offset;
> > > > +		else
> > > > +			copy_size = read_data_size;
> > >
> > > if (write_offset < read_offset) how is this 'else' ever possible? So
> > > shouldn't copy_size just be set unconditionally to 'buf_size -
> > > read_offset'?
> > If the user buffer doesn't have enough space to accommodate
> > (buf_size - read_offset) bytes, the else will get executed.
> 
> Sorry, yes, you are right here.
> 
> > >
> > > > +		if (copy_to_user((buf + *total_data_size), read_vaddr, copy_size)) {
> > >
> > > internal brackets not needed     ^
> > >
> > > > +			ret = -EFAULT;
> > > > +			goto exit;
> > > > +		}
> > > > +		if (copy_to_user((buf + *total_data_size + copy_size),
> > >
> > > internal brackets not needed     ^
> > >
> > > > +				 xecore_start_vaddr, read_data_size - copy_size)) {
> > > > +			ret = -EFAULT;
> > > > +			goto exit;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	*total_data_size += read_data_size;
> > > > +	read_ptr += read_data_size;
> > >
> > > Because there is an overflow bit we can just add without worrying about
> > > wraparound?
> > I want to make sure only one overflow bit is used and doesn't overflow
> > into the second bit.
> 
> OK, I don't follow, but this was just something I was trying to confirm, so
> ignore this comment. The code is fine because of the overflow bits.
> 
> > >
> > > > +
> > > > +	/* Read pointer can overflow into one additional bit */
> > > > +	read_ptr &= (buf_size << 1) - 1;
> > > > +	read_ptr_reg = REG_FIELD_PREP(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, (read_ptr >> 6));
> > > > +	read_ptr_reg = _MASKED_FIELD(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, read_ptr_reg);
> > > > +	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT1, read_ptr_reg, group, instance);
> > > > +	xecore_buf->read = read_ptr;
> > > > +	trace_xe_eu_stall_data_read(group, instance, read_ptr, write_ptr,
> > > > +				    read_offset, write_offset, *total_data_size);
> > > > +exit:
> > > > +	mutex_unlock(&xecore_buf->ptr_lock);
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_eu_stall_stream_read_locked - copy EU stall counters data from the
> > > > + *				    per xecore buffers to the userspace buffer
> > > > + * @stream: A stream opened for EU stall count metrics
> > > > + * @file: An xe EU stall data stream file
> > > > + * @buf: destination buffer given by userspace
> > > > + * @count: the number of bytes userspace wants to read
> > > > + *
> > > > + * Returns: Number of bytes copied or a negative error code
> > > > + * If we've successfully copied any data then reporting that takes
> > > > + * precedence over any internal error status, so the data isn't lost.
> > > > + */
> > > > +static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *stream,
> > > > +					      struct file *file, char __user *buf,
> > > > +					      size_t count)
> > > > +{
> > > > +	struct xe_gt *gt = stream->gt;
> > > > +	size_t total_size = 0;
> > > > +	u16 group, instance;
> > > > +	unsigned int xecore;
> > > > +	int ret = 0;
> > > > +
> > > > +	for_each_dss_steering(xecore, gt, group, instance) {
> > > > +		ret = xe_eu_stall_data_buf_read(stream, buf, count, &total_size,
> > > > +						gt, group, instance, xecore);
> > > > +		if (ret || count == total_size)
> > > > +			break;
> > > > +	}
> > > > +	return total_size ?: (ret ?: -EAGAIN);
> > > > +}
> > > > +
> > > >  /**
> > > >   * xe_eu_stall_stream_read - handles userspace read() of a EU stall data stream fd.
> > > >   *
> > > > @@ -272,7 +461,35 @@ static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
> > > >  static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
> > > >				       size_t count, loff_t *ppos)
> > > >  {
> > > > -	ssize_t ret = 0;
> > > > +	struct xe_eu_stall_data_stream *stream = file->private_data;
> > > > +	struct xe_gt *gt = stream->gt;
> > > > +	ssize_t ret;
> > > > +
> > > > +	if (count == 0)
> > > > +		return -EINVAL;
> > >
> > > I believe we need to also handle the fact that count might not be a
> > > multiple of record_size. The easiest way to handle this seems to be right
> > > here:
> > >	ssize_t aligned_count = ALIGN_DOWN(count, stream->data_record_size);
If we consider the aligned_count here, we don't need the ALIGN_DOWN()
you suggested above.
> > I think the code handles buffer sizes that are not multiples of record
> > size. Copying few lines of code below. Wouldn't read_data_size be only a
> > multiple of record size ? and leave any remaining space empty that is
> > not a multiple of record size ?
> > /* Read only the data that the user space buffer can accommodate */
> > if ((*total_data_size + read_data_size) > count) {
> >	read_data_size = count - *total_data_size;
> >	read_data_size = (read_data_size / data_record_size) * data_record_size;
> >
> 
> No, I don't think it is handled. The issue is we have this check here:
> 
> xe_eu_stall_stream_read_locked()
> {
> 	...
> 		if (ret || count == total_size)
> 			break;
> }
> 
> And if count is not a multiple of record_size, the 'count == total_size'
> will never be true, I think. Since total_size returned by
> xe_eu_stall_data_buf_read() is always a multiple of record_size.
> 
> > >
> > > And used aligned_count rather than count in xe_eu_stall_stream_read_locked
> > > calls. So that we don't have to worry about this in later function calls.
> > >
> > > So above will become:
> > >
> > >	if (aligned_count == 0)
> > >		return -EINVAL;
> > >
> > > Unless there is a minimum user buffer size we want to support, in that case
> > > this becomes:
> > >
> > >	if (aligned_count < minimum_user_buffer_size)
> > >		return -EINVAL;
> > >
> > > But to me looks like a good value for minimum_user_buffer_size is not
> > > available.
> > I guess the minimum user buffer size should be the data record size (64
> > for PVC and Xe2)? If smaller than the record size, the drive will be
> > unable to copy any data.
> 
> That is this check:
> 
> 	if (aligned_count == 0)
> 		return -EINVAL;
> 
> Apart from that, is there a minimum_user_buffer_size which is greater than
> record_size? That is why I was saying it is not available.
> 
> > >
> > > Anyway, better to handle this degenerate case here itself.
> > >
> > > > +
> > > > +	if (!stream->enabled) {
> > > > +		xe_gt_dbg(gt, "EU stall data stream not enabled to read\n");
> > > > +		return -EINVAL;
> > > > +	}
I will remove this check. User space should be able to read any last
remaining data even after EU stall is disabled.
> > > > +
> > > > +	if (!(file->f_flags & O_NONBLOCK)) {
> > > > +		do {
> > > > +			ret = wait_event_interruptible(stream->poll_wq, stream->pollin);
> > > > +			if (ret)
> > > > +				return -EINTR;
> > > > +
> > > > +			mutex_lock(&gt->eu_stall->stream_lock);
> > > > +			ret = xe_eu_stall_stream_read_locked(stream, file, buf, count);
> > > > +			mutex_unlock(&gt->eu_stall->stream_lock);
> > > > +		} while (ret == -EAGAIN);
> > > > +	} else {
> > > > +		mutex_lock(&gt->eu_stall->stream_lock);
> > > > +		ret = xe_eu_stall_stream_read_locked(stream, file, buf, count);
> > > > +		mutex_unlock(&gt->eu_stall->stream_lock);
> > > > +	}
> > > > +
> > > > +	stream->pollin = false;
> > >
> > > Carry over comment from previous rev: this breaks if user buffer is smaller
> > > than available data. But this is a corner case so let's fix this after the
> > > initial merge.
> > I will check your fix in OA to better understand the problem here. If
> > the user buffer is smaller than data record size, it just returns
> > without copying any data.
> 
> No, it is the issue when user buffer is larger than record_size, but still
> smaller than the size of total data available. In that case, basically we
> should let stream->pollin set to true, so that the user thread does not get
> blocked, enabling it to rapidly consume data, even with a small buffer.
> 
> Otherwise the thread is getting blocked every 10 ms, even when data is
> available. And because new data keeps arriving, the user thread constantly
> falls behind and soon HW will start dropping data (because the kernel is
> blocking the user thread, it's a kernel not a user thread issue)
> 
> To handle this OA does:
> 
> 	if (ret != -ENOSPC && ret != -EIO)
EU stall read() never returns -ENOSPC. Even if the user buffer is
smaller then the size of total data in the buffer, only the data that
can fit into the user buffer will be copied through read().
As long as there are atleast wait_num_reports data rows in the buffer,
stream->pollin is set to true. It sounds to me that this issue is
specific to OA code only. Is there something that I missed?
> 		stream->pollin = false;
> 
> Anyway, we can do this after the initial merge.
> 
> > >
> > > Let's put it a list of to be done's in the cover letter to do after we
> > > merge in the next revision.
> > Okay.
> > >
> > > >
> > > >	return ret;
> > > >  }
> > > > @@ -281,6 +498,7 @@ static void free_eu_stall_data_buf(struct xe_eu_stall_data_stream *stream)
> > > >  {
> > > >	if (stream->bo)
> > > >		xe_bo_unpin_map_no_vm(stream->bo);
> > > > +	destroy_workqueue(stream->buf_poll_wq);
> > >
> > > Don't put this here in free_eu_stall_data_buf, put this in the caller of
> > > this function, like the destroy/close function.
> > >
> > > >  }
> > > >
> > > >  static int alloc_eu_stall_data_buf(struct xe_eu_stall_data_stream *stream,
> > > > @@ -351,6 +569,21 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> > > >	return 0;
> > > >  }
> > > >
> > > > +static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
> > > > +{
> > > > +	struct xe_eu_stall_data_stream *stream =
> > > > +		container_of(work, typeof(*stream), buf_poll_work.work);
> > > > +
> > > > +	if (eu_stall_data_buf_poll(stream)) {
> > > > +		stream->pollin = true;
> > > > +		wake_up(&stream->poll_wq);
> > > > +	}
> > > > +	if (stream->enabled)
> > >
> > > See comment at xe_eu_stall_disable_locked. If we do
> > > cancel_delayed_work_sync there, I think this stream->enabled check might
> > I will explain later why I used flush_delayed_work() instead of
> > cancel_delayed_work_sync()
> 
> See below.
> 
> > > not be needed here. Also see comments at cancel_work_sync in
> > > kernel/workqueue.c.
> > >
> > > Could you please check and see if it works out. xe_guc_ct.c (and
> > > xe_gt_tlb_invalidation.c) seem to be doing that.
> > >
> > > > +		queue_delayed_work(stream->buf_poll_wq,
> > > > +				   &stream->buf_poll_work,
> > > > +				   msecs_to_jiffies(POLL_PERIOD_MS));
> > > > +}
> > > > +
> > > >  static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> > > >				   struct eu_stall_open_properties *props)
> > > >  {
> > > > @@ -361,6 +594,11 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> > > >	u32 vaddr_offset;
> > > >	int ret, xecore;
> > > >
> > > > +	init_waitqueue_head(&stream->poll_wq);
> > > > +	INIT_DELAYED_WORK(&stream->buf_poll_work, eu_stall_data_buf_poll_work_fn);
> > > > +	stream->buf_poll_wq = alloc_ordered_workqueue("xe_eu_stall", 0);
> > > > +	if (!stream->buf_poll_wq)
> > > > +		return -ENOMEM;
> > >
> > > Now we also need to destroy_workqueue during error unwinding (see comments
> > > regarding this in Patch 3).
> > >
> > > >	stream->sampling_rate_mult = props->sampling_rate_mult;
> > > >	stream->wait_num_reports = props->wait_num_reports;
> > > >	stream->per_xecore_buf_size = per_xecore_buf_size;
> > > > @@ -391,6 +629,19 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> > > >	return 0;
> > > >  }
> > > >
> > > > +static __poll_t xe_eu_stall_stream_poll_locked(struct xe_eu_stall_data_stream *stream,
> > > > +					       struct file *file, poll_table *wait)
> > > > +{
> > > > +	__poll_t events = 0;
> > > > +
> > > > +	poll_wait(file, &stream->poll_wq, wait);
> > > > +
> > > > +	if (stream->pollin)
> > > > +		events |= EPOLLIN;
> > > > +
> > > > +	return events;
> > > > +}
> > > > +
> > > >  /**
> > > >   * xe_eu_stall_stream_poll - handles userspace poll() of a EU stall data stream fd.
> > > >   *
> > > > @@ -401,7 +652,13 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> > > >   */
> > > >  static __poll_t xe_eu_stall_stream_poll(struct file *file, poll_table *wait)
> > > >  {
> > > > -	__poll_t ret = 0;
> > > > +	struct xe_eu_stall_data_stream *stream = file->private_data;
> > > > +	struct xe_gt *gt = stream->gt;
> > > > +	__poll_t ret;
> > > > +
> > > > +	mutex_lock(&gt->eu_stall->stream_lock);
> > > > +	ret = xe_eu_stall_stream_poll_locked(stream, file, wait);
> > > > +	mutex_unlock(&gt->eu_stall->stream_lock);
> > > >
> > > >	return ret;
> > > >  }
> > > > @@ -416,6 +673,9 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
> > > >	stream->enabled = true;
> > > >
> > > >	ret = xe_eu_stall_stream_enable(stream);
> > > > +	queue_delayed_work(stream->buf_poll_wq,
> > >
> > > A blank line before this line would be nice.
> > >
> > > > +			   &stream->buf_poll_work,
> > > > +			   msecs_to_jiffies(POLL_PERIOD_MS));
> > > >	return ret;
> > > >  }
> > > >
> > > > @@ -429,6 +689,9 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
> > > >	stream->enabled = false;
> > > >
> > > >	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, 0);
> > > > +	/* Check for any new EU stall data one last time */
> > > > +	queue_delayed_work(stream->buf_poll_wq, &stream->buf_poll_work, 0);
> > >
> > > I am not sure if this is needed, especially if we use
> > > cancel_delayed_work_sync.
> > There was an ask from the user space to check for new data once after
> > disabling EU stall sampling to make sure we capture all the data.
> 
> But they won't be able to read it because we set stream->enabled to false?
> So what's the point?
Good point. I will remove check for stream->enabled in the read function
xe_eu_stall_stream_read().
> 
> > >
> > > > +	flush_delayed_work(&stream->buf_poll_work);
> > >
> > > I think here we should use cancel_delayed_work_sync() instead. See
> > > e.g. xe_guc_ct.c (and also maybe xe_gt_tlb_invalidation.c).
> > I though about it and found that the difference between
> > flushed_delayed_work() and cancel_delayed_work_sync() is that
> > cancel_delayed_work_sync() cancels any pending work items and wait for
> > any work under execution to complete. Whereas flushed_delayed_work()
> > schedules any work pending and wait for it to complete. Since I want to
> > execute the work one last time after disable, flushed_delayed_work()
> > is more appropriate here than cancel_delayed_work_sync().
> 
> Above I am questioning what is the purpose of the last queue_delayed_work.
> Also we could add the cancel_delayed_work_sync after the
> flush_delayed_work, if that is needed.
Okay, will add cancel_delayed_work_sync() after flush_delayed_work().
> 
> As pointed out above, I think it is preferable to eliminate the 'if
> (stream->enabled)' check in eu_stall_data_buf_poll_work_fn() and handle it
> via cancel_delayed_work_sync(). Which I think should work, but probably
> needs to be checked.
Will check on this. I need to find a different way to check for any new
data and update write pointers one last time after disabling EU stall.
> 
> >
> > >
> > > >
> > > >	xe_force_wake_put(gt_to_fw(gt), XE_FW_RENDER);
> > > >	xe_pm_runtime_put(gt_to_xe(gt));
> > > > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > > > index d5281de04d54..1cc6bfc34ccb 100644
> > > > --- a/drivers/gpu/drm/xe/xe_trace.h
> > > > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > > > @@ -427,6 +427,39 @@ DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_get_ioctl,
> > > >	     TP_ARGS(xe, caller)
> > > >  );
> > > >
> > > > +TRACE_EVENT(xe_eu_stall_data_read,
> > > > +	    TP_PROTO(u8 slice, u8 subslice,
> > > > +		     u32 read_ptr, u32 write_ptr,
> > > > +		     u32 read_offset, u32 write_offset,
> > > > +		     size_t total_size),
> > > > +	    TP_ARGS(slice, subslice, read_ptr, write_ptr,
> > > > +		    read_offset, write_offset, total_size),
> > > > +
> > > > +	    TP_STRUCT__entry(__field(u8, slice)
> > > > +			     __field(u8, subslice)
> > > > +			     __field(u32, read_ptr)
> > > > +			     __field(u32, write_ptr)
> > > > +			     __field(u32, read_offset)
> > > > +			     __field(u32, write_offset)
> > > > +			     __field(size_t, total_size)
> > > > +			     ),
> > > > +
> > > > +	    TP_fast_assign(__entry->slice = slice;
> > > > +			   __entry->subslice = subslice;
> > > > +			   __entry->read_ptr = read_ptr;
> > > > +			   __entry->write_ptr = write_ptr;
> > > > +			   __entry->read_offset = read_offset;
> > > > +			   __entry->write_offset = write_offset;
> > > > +			   __entry->total_size = total_size;
> > > > +			   ),
> > > > +
> > > > +	    TP_printk("slice:%u subslice:%u readptr:0x%x writeptr:0x%x read off:%u write off:%u size:%zu ",
> > > > +		      __entry->slice, __entry->subslice,
> > > > +		      __entry->read_ptr, __entry->write_ptr,
> > > > +		      __entry->read_offset, __entry->write_offset,
> > > > +		      __entry->total_size)
> > > > +);
> > > > +
> > > >  #endif
> > > >
> > > >  /* This part must be outside protection */
> > > > --
> > > > 2.48.1
> > > >
> 
> Thanks.
> --
> Ashutosh
