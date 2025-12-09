Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B24D3B7EA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 00:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C227210E19F;
	Tue,  9 Dec 2025 00:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PNrQvpBO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DAE10E19F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 00:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765238918; x=1796774918;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Jp6RZftntkEOO4ST9AKmIEUlXwwLZDSCOaR1CCjBQN4=;
 b=PNrQvpBOSazbjHDA7y91JtOHywxj22ryvxPArTK/ojbfyA+sR+HvKA/3
 AeoXhkw0iEG34cZDwVDaBM27+G6srd8a3G21gJF5pRFiQvbd/q0Z4DW3F
 ieaSDTGCTW8O1t7dh6DLL7Atd6iAPquYMCEZuc4mdez2hDFxm+vfixj2j
 hcEecvyuWNSxT/fpr4mAwJTuctKPaAbDIju/RIC45MUeQkZyMvswVeyrP
 dCmyfnK1NEHu6yVveA+gEkmRWNrUmD3ji5wZmH1VbYa9tXFjH84eNMNVK
 tBxtuO6bxWXC1K/DlJpSa1jeiWS9xg1v6fIykt1C0sxnbd8tBKmee2aC2 Q==;
X-CSE-ConnectionGUID: ousV4PVSSsqQLwdNle6paw==
X-CSE-MsgGUID: +n0VNFT6TxyiLXuf9tXc5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="89843524"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="89843524"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 16:08:37 -0800
X-CSE-ConnectionGUID: VGqo0TWLSAiWOzqt/9zsVg==
X-CSE-MsgGUID: cBYcFU2ORAOPyzbabb5PiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="200988946"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 16:08:36 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 16:08:35 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 16:08:35 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 16:08:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBluhk7HaTzIhzLsor5ASBIw/bv+B+byovO/CYuJaDpTgAf9RJ8TZSLLG6KPVCfZDXm94JTN/gpsGmwqb3R7OM0E9iTkZBrB3O8C6ZNXGO8c9FhKRgBAOyF5GfgGfGeilwgN6QrgMC/T/vm7yN2vW/hmfnYTQWO5FK+sDBKkLprreILzJ1SjUpG9qXs1POg4bcGnRHGHbBlIF8g3zGFshUiMH5I2PC2k9LYGcBo8HUuLESCIY4fhExkPGIa8C3GBIU6Hc8/haPEKH4exmXBfSWpng8FxnFtaObDf37fstlvYxe4kVXZAiZUgRj+8gk9cLRXTu71zww4kndAYzlwODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmcYrEPfK9QDo4gM5xVDJuETTjQGBMpp7ybtmrrkPDc=;
 b=UCIJVVBKHDDqhuqN8fgHwhLMu3m+zwlWQ2kOK3zDjdkk/HC8oYDaAwi/RPNoaMGwys/4HpixMaVyLVuHj+DWoA51VZl2yMidemU336Q/tfKcd0dFkIo4ct+vgswLIIAF2QADb2v/QvxWhkXAECgaJTagrf4qT4+8iKLZSjXhZBOfrySlC4UJgHAuuEn9HWhec04QiPGRtdtwgmjUXbWj0PQePbwQx3sbWFQhmjCkfCj7uJqJtvY89/4n6B04H616dJJXYf9/vOn5+GiViWCzEP+P6mbxa0vwLQnI/Sj1ZSsU+B7/3u4Y8OVj1C0fxDJYINUPp1kJoZxQ7bEQ0Ly4iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB5012.namprd11.prod.outlook.com (2603:10b6:303:90::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 00:08:33 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 00:08:33 +0000
Message-ID: <fa7c593a-5147-4a4a-8d12-566b2ebc40d3@intel.com>
Date: Tue, 9 Dec 2025 01:08:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] drm/xe/sriov: Add debugfs with scheduler groups
 information
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
 <20251206230356.3600292-20-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251206230356.3600292-20-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR02CA0045.eurprd02.prod.outlook.com
 (2603:10a6:802:14::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB5012:EE_
X-MS-Office365-Filtering-Correlation-Id: 6958f198-cf83-4d1a-ce85-08de36b71748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THM3OExudEx2ZVJHRzQzamgzYzRxNnVFS2dpZ1NwSkgxb251YW1paHdzWE9Q?=
 =?utf-8?B?MmJrQU9nSGcvTGJ0N2ZvbnhGZXcrWXAwWVZsVEZja0crb3RnbWlBUXZJZjBu?=
 =?utf-8?B?WDhPVjQ1aE5yYnhRaFhGd1Y4bzY1Q0kzOXFuZGsyeXhQc3JvQXg2U2s0bFk2?=
 =?utf-8?B?ZmMwYnkwbUdZNjhpazM5cHo1RHp1TCtIL0lvRUdDdlJLSHh0Ym9BOTM2SkM0?=
 =?utf-8?B?ZGQ4c2Qzd3I3dHhKYkhPR0lUQkl0KzhYbWZvN1d2Sms2SHJyQ2lKSm00aENk?=
 =?utf-8?B?eCtpQWJBRVVWRXlqbXp6eWNQL0kxZlpGZUhXenY5b3VmUExWZWZvVVp5SHFE?=
 =?utf-8?B?dC9lMVNOb0NTek41SG1nWFlWZlh4ZTJEYVFvMVY0T1Vmek9iTnFybE5OaXNy?=
 =?utf-8?B?Wmk4LzNRVXFnUmlhdXoyT1o4eVJSYWtIRUF2aUdrTmJnOGhGMGYydW85SXI1?=
 =?utf-8?B?aGZxUzVoYTc1aUJTQktuaGlQL0M4aDdlWnBTa0YyZzM4QlhlNnkrckEzQldT?=
 =?utf-8?B?ZkR5d3dFVUVFYlovbjgzY0F5MW5QVG15ZjlodkN1S1RUUE85cE1rRmdlRW9D?=
 =?utf-8?B?U1RIamRVNy9udWdSZXhBT2hJK3dBZU15a3l4RGZEUy94cnV0eTZaNHR6TUxV?=
 =?utf-8?B?UGtJZys3bGR6OFlwaWhQOWFuVmNGMEIzQWZGMnljc0thUzZvN3JpN1ZLV2lE?=
 =?utf-8?B?eTRiZSs2ZmtkS0dEQlJXc2o0SHlML3Z2U3BCU2NXWElHc2tDTjA1dlZlRzJa?=
 =?utf-8?B?ZDdOdmxnamdGUEMvUXp6WFlZRXlmbzMvWWRnclpGRjRESWVTbXF2bTBEZU5S?=
 =?utf-8?B?Z09BdlAzVHNhK2ZiTDZ6cFlQQzFiemt6WmNWWm5lSjlkaXk3UnBWUnZoTHBJ?=
 =?utf-8?B?a2kxZWRScjhlbVBvc2lkOThJYnVPOXJOYjB3QXVYM2NPQmp5TGNlWGhSMG1h?=
 =?utf-8?B?MWNJQjlQK3FSN2czZ00zcjNubjRyMVRDNEFRcjdxVldSSmZiTW1JYUpGcm5o?=
 =?utf-8?B?eUtobzV4a1JOTWJyZ3dNZVVnYUF5aW4xNk1KamdNMCtLWmlKd040UGVuZHZ6?=
 =?utf-8?B?emdFWi9BN2c0OUd3eDFUSGd0cURZMXZMNHBLU3loTXphTGw5UTBLbUhEQmll?=
 =?utf-8?B?bkJ2NjJZVzB0NHNnc3lJVmNRUHExLzE5RDdYTUd0ZkMxUGR2RjFwb29lYjRD?=
 =?utf-8?B?cnVxamtHY1p6SnA3SUQrd205RCs5NldFU0RMVFAwK3VnSXk4djdlb21RaDNq?=
 =?utf-8?B?bHBpc21waXE3K2o2aFY4L2JZbVcwR3N5djZYWGNHSXhYdEF5QzVmODJBUGZk?=
 =?utf-8?B?Mi9CQW82TWdIMXErTXdZN1NOOTBRR3FoSTFIZ2tWSHkvQmdLelNQVzBxaUlw?=
 =?utf-8?B?NzM4UVQyN1ZubUd3aGR4RTJHVktYdTM2engxbTJNTFhxNWV5MXdiZktVd0FQ?=
 =?utf-8?B?alo0STR2OW4vdHZsWllHemVjRTNlMXFwQWwyTi9LWVR4S2VnMlh4WmsxQml2?=
 =?utf-8?B?YTZCcUcraHNOOTFRVkwyK0RhWjNlVUpqL2JzZTRPOEh1WWxsN3pnVVFjY0dH?=
 =?utf-8?B?OTRQMlo1TXJLRXh1YW9XUnpyeVB4d3gwMXdyYXpNMGZTa1NTdWhQVnRxRUdu?=
 =?utf-8?B?OFpoRTgvcCsrSTRlOVc3R2pja0ZPQTIyNGtkdVFlSEpHWW1XV0hMU2N1SENT?=
 =?utf-8?B?MWR3MEZJWnlvUlBoUkFybkNLczBLaU40RWhKVTlRbkMwY0wwa04xZDArTGVK?=
 =?utf-8?B?azVlQVROR0I5S2JMUzhpQWhhbGZpaDB6Y01jeGNYclFWZS82R1hXVDNyV2xW?=
 =?utf-8?B?dVBqVjFYaGIxYitXRWwyNUM0U0ZQamxjVzVxR2U2TGF1N3N1OEExaXdVeUVX?=
 =?utf-8?B?UUdmMTRWenVZYXpzcWVZSFJxbk5lRC93S1RoMGJvM3ZUN3o1eU41N1Vzc0s4?=
 =?utf-8?Q?4r0w7xdIcRHZQJoARWRpZMMPwZl+cGou?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmlEUWNVMGdOdTZnN2l0YWgzMCtCRDNqTkpqT2J0K1lWTk5SV0Z0YS80d3ZV?=
 =?utf-8?B?bnVKTCtpU3FtaG5yWVhMejY2ZXlkUzUxYjVNYlhzdmFFQ3BZTWZJVWpiYm1k?=
 =?utf-8?B?WklsaEFMb2lEbWRZNjYzSmgxd0gvcDVhbUlUUit5eW5CQVhMRStJZlpZbUtB?=
 =?utf-8?B?MllFMThJS2xuRVR6VXlNYjRhdllrNndJbyswQ2QrdS9UZlhCSHlSWXJJNHha?=
 =?utf-8?B?aVAxbzB1YUpKZWM0dzRaT3dLRmxXRDVVWkgzZldFMmFmNzNYVVFYMW9ISlNy?=
 =?utf-8?B?QzNoM0N5THU5ZGgxWXVJeGlpVitxSlI3YTlqRUEwMVg1MG5IQzNlM2lBaTRp?=
 =?utf-8?B?NWhCNDRMVlpsckZ0Y1dGdk1XY1grZGxBeUlzeE1MNjZZaXFHaFd6aythYmdF?=
 =?utf-8?B?eko4WXp1QmNkRlpMZ1pvbDVrRWZ0YjJ4S01DWXNoV0dyRXBaYzh3SHVYaDZY?=
 =?utf-8?B?ZG5DME5RMWNMVmxMM2s5dzZDMnhycDdiR0hrT1BITDVkMlY2K3hEYUpUNkFB?=
 =?utf-8?B?bkxnbk1WQkY0NWhZZWxPMS8xZVQwVENiUzkrdmpIR2xncjlHd0k0c1RyNEpM?=
 =?utf-8?B?VGxYNHJXOVhFd0d1WmppRjNYcEs0ai8zRG9SWUNxYURoK1hsYmZHUXNNd0ZL?=
 =?utf-8?B?Tk5tN1RhNDkxY0Z4WFhQSzJNUFdvU3hlY2k0LzZ2NUYwdFZhek5iZ240R2lZ?=
 =?utf-8?B?NDRCNm9rMGpEOWVpcDZFMEt5Qm13U0VEU3o3ZEJJUUtPbDNkT2Y1M1IxOEZE?=
 =?utf-8?B?b2dIKytqelFvMWdhQ2F2RGdwblpVTFNpQWRQc3FuaVJKVGlPUHRCUk54KzlK?=
 =?utf-8?B?SEhLYjRGZjR2QURPVFpaS0Z2VXFNZUFYYlhRQlNVbEYyQXNvQlJNOTk0V1BC?=
 =?utf-8?B?OHp6S0NxckxwYTFRVTB2MTg5NzdsVWk3NTFVMjQwYVNqS3oycTZaL0J4V1Z6?=
 =?utf-8?B?UzV2dk91QWRWNmpJV1NHS2lJMi9GRHJKUTBOS3UxWURTQXB2SHpEQU10b0Zp?=
 =?utf-8?B?TDJaVUppdy9iMzZlOTREdUtUWUd0TnZ0bmFOZTA3eDI0Z1kvYlcxajJpSjYr?=
 =?utf-8?B?azNlZnV6WXp1ck5mTVJ4SHRiN0I4LzIwbWZnTXNpYzRKS09uZVBzNllOTzM5?=
 =?utf-8?B?WFNuN3IwdlNZOHh4U0JsTzRHV0hVWXBLdW9kWmdoOU9veWVvUDAvS2tQcE9Z?=
 =?utf-8?B?REsyYlJjVVNNSXhEZWxCZjRLVDdKUWowVENXV0lkUVVMR1hCUllpMmFpT2wz?=
 =?utf-8?B?ZEIzQzd4ZW8zRWVsbXQ3M3dvODlMaXdqVkd4ZVlvdGZ2Nlk1RDNDY3ZVQjRL?=
 =?utf-8?B?MUZpMklra2dTODUwQVJzUVVsWkpsWi9Bayt4NG9qS0NpSzdyZU0xbVhza3Vv?=
 =?utf-8?B?VDVCclozRGFlK09JR0FJYU0rbldna1JLd1U2ZE51ODJzdUttQk9hcCtxbTl0?=
 =?utf-8?B?Zkx4TS9pOFhOVkNleEMxR0pNbFFHZlR0V0lYaGh4NTBGeWtPMU9KNEdSK3Z5?=
 =?utf-8?B?bVVUeU5rbzFmSDNsNVJFZmhXQk9TTUNhSGdmdGNHa1E0MCtXaGJRTHhMakZ3?=
 =?utf-8?B?TUlNcW5mTmRIWkI4VVVqdXE1MEEzVE1nMENGbjNTV0ZtS1lSRGNEZXNEZWw5?=
 =?utf-8?B?Q200aGZtOURrRkkzenU3OXVFenFmQVhDNWFaNUl1UGJEM1BScFU4L0lwVE12?=
 =?utf-8?B?RStsRWx6cHp1ckpCdzg5Qm1IZmR0VjVwZUhkOE9jVy9RQmExek5UMVhUMHpU?=
 =?utf-8?B?NldldjRERTdZSjhKa2poY3hkemwwbG1Vd2p6NXJlZU9pTkFMcXpGaU9taWlG?=
 =?utf-8?B?ZXBqUmJhNng2b0ozNm9XL1c5M0N6VGhxRjlQOGZEOHRNWEcwVmNabDFTVmYy?=
 =?utf-8?B?cFY3V2JDVTZvTVo3cHJobmNmaEthem9zbFh0NW1vVVhDS3JGMVVUUml6SXN0?=
 =?utf-8?B?UllQdi8xRDkzQW5qR29NQlZwM0plU3lsS0s1TjVZc2luTTVUcnViT0RLNHBU?=
 =?utf-8?B?QlpDVUY5M1Z6bkdGZ2ZrMEM1UHFCSks2Wm9iUktxUDRnM1N4YnA5TnlsTWtl?=
 =?utf-8?B?dXo2TDVMdWtZcURRd3Y0a3ZLazhmKzlnYW9kZjhlVTdmNXhhU2MxRitNOWVm?=
 =?utf-8?B?ZWMxdjkvM3NFajc0elJjWnJzcVAwWVdGWFZGaCtoUlpGbEl3elYyalV4bmlw?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6958f198-cf83-4d1a-ce85-08de36b71748
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 00:08:33.2535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iY4O5vzqQV4AA7xgfyeVyGVwSwGPzbj8p8JuK+87qyJl0zkry+/pgsqPOwI3ZdE5gbcWjGgHOzqmHey19meIpxRWEfqSrOvfzm1Z4CEgY3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5012
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



On 12/7/2025 12:04 AM, Daniele Ceraolo Spurio wrote:
> Under a new subfolder, an entry is created for each group to list the
> engines assigned to them. We create enough entries for each possible
> group, with the disabled groups just returning an empty list.
> 
> v2: drop subfolders, always register debugfs for all groups (Michal)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 70 +++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 1be23809e624..15f5f3a40471 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -163,6 +163,10 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>   *          :   ├── tile0
>   *              :   ├── gt0
>   *                  :   ├── sched_groups_mode
> + *                      ├── sched_groups
> + *                      :   ├── group0
> + *                          :
> + *                          └── groupN
>   */
>  
>  static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
> @@ -260,8 +264,60 @@ static const struct file_operations sched_groups_fops = {
>  	.release = single_release,
>  };
>  
> +static ssize_t sched_group_engines_read(struct file *file, char __user *buf,
> +					size_t count, loff_t *ppos)
> +{
> +	struct dentry *dent = file_dentry(file);
> +	struct xe_gt *gt = extract_gt(dent->d_parent);
> +	struct xe_gt_sriov_scheduler_groups *groups = &gt->sriov.pf.policy.guc.sched_groups;
> +	u32 num_masks = groups->modes[groups->current_mode].num_masks;
> +	u32 *masks = groups->modes[groups->current_mode].masks;
> +	unsigned int group = GUC_MAX_SCHED_GROUPS;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	char engines[128];
> +	int ret;
> +
> +	ret = sscanf(dent->d_name.name, "group%u", &group);

see below

> +	xe_gt_assert(gt, ret == 1 && group < GUC_MAX_SCHED_GROUPS);
> +
> +	engines[0] = '\0';
> +
> +	/* If there are no masks it means that all the engines are in group 0 */
> +	if (num_masks >= (group + 1) * GUC_MAX_ENGINE_CLASSES) {
> +		for_each_hw_engine(hwe, gt, id) {
> +			u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
> +			u32 mask = masks[group * GUC_MAX_ENGINE_CLASSES + guc_class];
> +
> +			if (mask & BIT(hwe->logical_instance)) {
> +				strlcat(engines, hwe->name, sizeof(engines));
> +				strlcat(engines, " ", sizeof(engines));
> +			}
> +		}
> +		strlcat(engines, "\n", sizeof(engines));
> +	} else if (group == 0) {
> +		for_each_hw_engine(hwe, gt, id) {
> +			strlcat(engines, hwe->name, sizeof(engines));
> +			strlcat(engines, " ", sizeof(engines));
> +		}
> +		strlcat(engines, "\n", sizeof(engines));
> +	}
> +
> +	return simple_read_from_buffer(buf, count, ppos, engines, strlen(engines));
> +}
> +
> +static const struct file_operations sched_group_engines_fops = {
> +	.owner = THIS_MODULE,
> +	.open = simple_open,
> +	.read = sched_group_engines_read,
> +	.llseek = default_llseek,
> +};
> +
>  static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
>  {
> +	struct dentry *groups;
> +	u8 g;

no cryptic names, please ;)

> +
>  	xe_gt_assert(gt, gt == extract_gt(parent));
>  	xe_gt_assert(gt, PFID == extract_vfid(parent));
>  
> @@ -274,11 +330,25 @@ static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
>  	 * We should rework the flow so that debugfs is registered after the
>  	 * policy init, so that we check if there are valid groups before
>  	 * adding the debugfs files.
> +	 * Similarly, instead of using GUC_MAX_SCHED_GROUPS we could use
> +	 * gt->sriov.pf.policy.guc.sched_groups.max_number_of_groups.
>  	 */
>  	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
>  		return;
>  
>  	debugfs_create_file("sched_groups_mode", 0644, parent, parent, &sched_groups_fops);
> +
> +	groups = debugfs_create_dir("sched_groups", parent);
> +	if (IS_ERR(groups))
> +		return;
> +	groups->d_inode->i_private = gt;

no need to store gt here, you can grab it from

	parent->d_parent
or
	parent->d_parent->d_parent

> +
> +	for (g = 0; g < GUC_MAX_SCHED_GROUPS; g++) {
> +		char name[10];
> +
> +		snprintf(name, sizeof(name), "group%u", g);
> +		debugfs_create_file(name, 0644, groups, parent, &sched_group_engines_fops);

why storing 'parent' as private data? 

better store group index there so you will not need to sscanf it back

and parent can always be retrieved from the dentry

> +	}
>  }
>  
>  /*

