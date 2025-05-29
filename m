Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1028C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 18:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629FC10E767;
	Thu, 29 May 2025 18:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CyAruR49";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805C710E767
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 18:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748543320; x=1780079320;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BQ+Fzk53j/xcOYUT7/iPKXDlOSehNgzw6iJW63orHLk=;
 b=CyAruR49KM9nUBACsMowOmqo2U+qmUW6ts0W0GgwxbkH6oVJmZVaWhCx
 0qG1ozUgpyKmEkiJ+nRydnRYttUoS52jV0nyZVTr/OkVV62/Z1AH+SjmE
 yDxQvg42fAnK2xIGXDoXUxFaqy96B6C/UYWYeJ4XvaC3aB1UAPZhWWX5F
 3QI7K2r/95scr2MvZbkqcDo5JouarIb3NF3PnqZRFHVRdvuiKKXhS/c1/
 IGBaFi0/2uKfxIm9hrrYwfpovu8kNP3ZmwHChDvdNF/urDmUKKIZc1u9s
 /LazfBbhDNqaWorV27EzrVwg3ibzpIF0ZS3f2tFc6gIw9hGBzfXLVSR0G A==;
X-CSE-ConnectionGUID: 7MjCsQpyRnaU0hG21pVC+A==
X-CSE-MsgGUID: 2MLysG1MRJ6PtoZlepXdYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="38247171"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="38247171"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 11:28:39 -0700
X-CSE-ConnectionGUID: qxdeggoxQ6Snjk/QmyhZpQ==
X-CSE-MsgGUID: sfIvyDa+QEOBOWU8LdotFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="144116319"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 11:28:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 11:28:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 11:28:38 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 11:28:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ei/BdMpPtm/bTuU/AvKSz5BoE+hhhzd+ZS0/Y6OclDkvmnPCB2YeKZhd2M9ghzVYfygvPBH9TRzf0Sy6VYEvc/toP4kxizz0Gx2Dkpuwx4ABQt+vnuZud5K6EduiEGM+WEMFcSGxkccNTOlmSFsfTjRGOgOmoKD3XgGWWVJDRiBPvxvwFEu8xZtUxqmE2bHDLMTTvsL9JBiZAMDn9i1RLY0rG5xmUTv8XCxTgSxF2N/lwjutZoe8xfdmojHEwsm5hA+x4lsp20BEXXUJo0QLVqkhS/EVFxel62fLbwQDh/bsrZLs3MtEx+THjmKj6IL03cYxNC+NQZJDu4jYV48C2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXJLg4XL0Y9VdCU6tpPpg41SIcdamxFk0OtYPaugiFg=;
 b=dYm+XIyQQd8xfFreLJA3vf/xk3c05w001rtDzs9t/tTlt89TgxvgBiR8Pi30FaLZE8vkHk175u+ji6OQoBdsRLrrBekeXGIALsCqivCh+0815AXge0yMWoKUeeVe02HZh5v5ORHFLtUvxCkd0ezzYS8ZFJZYCJ/MmqiILtyRy29yuxyhh/ipXTDdsJTeaY8RR1rJ4rl+urrgn5TnOI+IJeqJIq+x275N1Dc71ssJSZ4dYQdKGNQhjINazNX0fgr+XAgYGuJyMEUIcWiWbq++QVgnQi2bNDxnjbb+QUOVYWgaU9Lk3I4GXy/0j/1dETC7tfD24hzHIqbpwWMKQmz3ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7133.namprd11.prod.outlook.com (2603:10b6:930:63::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 29 May
 2025 18:28:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 18:28:36 +0000
Date: Thu, 29 May 2025 11:30:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 19/19] drm/xe/bo: Update atomic_access attribute on
 madvise
Message-ID: <aDinr86j4upLgtVe@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-20-himal.prasad.ghimiray@intel.com>
 <aDegZWGbMc1pNw5V@lstrano-desk.jf.intel.com>
 <1d9199e9-bcaf-4755-9ce6-d9b6bfec2bc0@intel.com>
 <aDimXEhce5BUR7+J@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDimXEhce5BUR7+J@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0069.namprd04.prod.outlook.com
 (2603:10b6:303:6b::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 04584a47-74e7-4878-7f6e-08dd9ede9feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVR0WVkvRVdlTVNCd09KbHpWaEl5bDNsTGh5TDkxVG9Xa0ZsVk9lMFFmazB0?=
 =?utf-8?B?THl6eFRSZGRvSEtDbnVRK2V5anI5eEhvT05ST3c2TndndjdBTzdteFhHSlZM?=
 =?utf-8?B?TjNZMmlXVVM3V1ptdDREWXpiOUhxcDZ5cU84dkpOTXNLak9tQlVJeU16eER1?=
 =?utf-8?B?Wmp3V1Nya1RuK01vcHdVSUhUNnBJdEZQaVlYSGZoclpLZmM0SUsxUU8vL1dz?=
 =?utf-8?B?UVlQWDV2dFZUVmluTlBOc0Vza3ZrTERsdlZqeXZrR29aY2lUaXkrZEFGR2c4?=
 =?utf-8?B?SG0rOXljQ1pub0doSnZVSEM0M0s4ZjNRUWYwQWZScXRFejlZNk1Hb2s5Nnl2?=
 =?utf-8?B?UmFLZmYzS2dKNWJsbnZZQ1VQRGVlc290c0VZZE9VU0tVMkJqRURKQTRNMlQy?=
 =?utf-8?B?a29GejZ6V05DODdQeHlBU2RJdUtpc2x0RU5lUU04Y1M3RnAwNGpQQjNMZWg3?=
 =?utf-8?B?ZkgwdkRQbGM1VE91MnNLOXNVcEUzR0U2MjBkeW8xSFNqMFNiU3VJdzZPRHEy?=
 =?utf-8?B?bUxOQ3VQUkw4VzVqZUlFbndSWkl1ZjBrU2E0akZGcjRiWWRGZVprN0dWYTho?=
 =?utf-8?B?ZDFQQ0JJUUY2bkhkZ0pUZS93WGs1SXV6L29EK2JUbG5HeWlOd2srN1JqVmhP?=
 =?utf-8?B?cVB6bVFUOWI2ckdia3NZa0N0UFVYbWdrUDhDMFBaY0p6WWRzSWdveDN3S3FX?=
 =?utf-8?B?K1BQaFpmV252blJoZUVDdWVzYWw3cGVpQWh5aUJxY1E0VnhpOThBTkZYc1A0?=
 =?utf-8?B?V0xSM1dEa2NyM1VFOXBqQmxodExlQXlaY3ppajBYaE1JWXdGZGZaaXlNY0U0?=
 =?utf-8?B?dis1Q3pXUkpMeHVuMm5RYnhsL21vZWxOdWxtelgxd0U4QlJpQmhhN20yWEYz?=
 =?utf-8?B?Z0NqeWdxVkdkajFaOW5aSFdETENaNWFXbER5dTJoMFRTWUpaRkxjQkRqZ3FV?=
 =?utf-8?B?RmtKN1YweVVJc1pLNXA0WER5N1o0aGlQNDhSSEFSRXk4MUROaTIxSThQRFBN?=
 =?utf-8?B?ZlJxOXVwZ0VZU3BpTjVmZldKYVlheDJzMmRQUzQ4NE9VWTVlNHloTEpsZzBW?=
 =?utf-8?B?VUtzWlZQUUJ3M3kzcVIxSUVaNGFvZUp1RDllYUYxOVAyUk44OUY4Tm55TXhI?=
 =?utf-8?B?ZmZFWmVQOU9jaVdDMEhUVW01bDVwd21kQmVScWdGdHMrRFVCRVA5K2lMWEtN?=
 =?utf-8?B?cnZPTmdFTGJleEZhd0FTdW15bCt3clQ0VGFSQjFCTkRVREZXR1poSS9nM2Ju?=
 =?utf-8?B?MUR0ejBEcDRjOFhnQlVUTXZsdlJSdVBVb3RFWjUvT1FvSW5sWWI0Ukh6MTI5?=
 =?utf-8?B?cHpMR090QW5UNW0xcnpHQ084UmEwbFBNUlRzUGRBQllTRzdEcmp4WDJRNTlU?=
 =?utf-8?B?eFlYaHROUjg0K2lCSHNyTmpiOVVZTjF3RGsyK3VCbHh5dGZGN3gwekMzRVN2?=
 =?utf-8?B?SGRqSUU3cVBlNmdscnRlNlFKTjBxNlNUUUdWdHJGQ2JqSUF2dlRKckJEb3Jj?=
 =?utf-8?B?bUNWYjloY1ZIS3pBcmxNbFFNUXBlVyt5c2xqNEpLR3BxWUtOeE9vMExBbTRt?=
 =?utf-8?B?VzZOTU5acHQ1WmVkblFqQ1hTQXpCOFpTbGFtaXNHLzRZZyswZmJ0UFlXb0wz?=
 =?utf-8?B?aDk2UUVqMCtlempDZWR2ZnBBZFNlVnpiNFl6MkE0R1Zha0dRODMrV0dIUklk?=
 =?utf-8?B?MThQWmM4WjRvZDlJY0loWGlKOWo4VER6bTM4cmw1WHVia1RmcTM5UkhFaDlR?=
 =?utf-8?B?a2RPQUJBVmhkaFkrSmFPcXVpcnFiWmlnaGFUY2JMTHNndG1TMkhCR1ZIY2Vj?=
 =?utf-8?B?VS9iRE9oV2VvOXdOK2RZQTFhamd6YTJUMGRIaE8wbnQvcW53VXF5YjB0ejBI?=
 =?utf-8?B?ZTVYdmtqRzYwTzRaRFl0Nk1PWmtYWW92QnN4aXlYcnhRSnFIUWl3T1ZZTU1Y?=
 =?utf-8?Q?hccwFQDpmL8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2J5SkZTL2hBUEQwcmFkN0lEK3F4TTFIR3UvdDJxZE5XM21QVFM1ZkphSTJp?=
 =?utf-8?B?enRMYWdyM3BXenJIV3VvamQ0bU92bHBFdmlTL0UzRDE3SEhVcGlGUEo1bUJX?=
 =?utf-8?B?WDNCejY3eDB3TlNLb1d2bk1Lc2djMUkzdUpZczhrQ2pETXQrU3czbHAvSGQz?=
 =?utf-8?B?eWlqYURISXBmWDBEUjFjTk00SG1tZ1UrQ1FYS1ZvUlEva1BGVjFYNDlxU2Ny?=
 =?utf-8?B?TGpUMjVyKzEvQXlXejVsNHpTTkZtT0xsak5FaXpmTXlEQ21LOXlDbHRTNVhE?=
 =?utf-8?B?cWI3aytCdDRTenJ1WWxCcERjZGdoQ0xxdDQreGpEcmhNeXNpNzRYbndZZUNR?=
 =?utf-8?B?RWlqZC94NUVTSG1QVXFiTmFhTHJlemJKUnlQRXV1aFNqVS9Qc1dWUEMyUmRo?=
 =?utf-8?B?eUZ5aVByeDF3dXhkK0lmNXJ3ejNlc1ZXQlRqL2Y4ZGdsSDFVeVRra2UvSkM2?=
 =?utf-8?B?QXRGWmdjMUpNdzJQamYxOTZJRzBFYldNL01iZ1pWUEVKemQvMnlqZ3B2TldV?=
 =?utf-8?B?WHJOQy8wNEk2Z0REamVmVktKN3RnZnpSNXlpSjBQeWtlVXVvTEZCYkhMbDZ6?=
 =?utf-8?B?ZGMwckpsMUpBd3lReVk3b2RjUVBFemxyOWljTGJYdU0xMmRBZUhYQm9weDZT?=
 =?utf-8?B?YTRHUkdJK3NqL3dPM1JaR1hwMEg4YUdDR3V4c3FSaTUxUU9rR1Q5Tko1dlFl?=
 =?utf-8?B?b2tMMDRQNll1WVNPTGNPSWpzUW85RG9TREFpU1UyclZJR1dDTFhvTlFqaGRN?=
 =?utf-8?B?RVE3Smgrb2psQUFrVEhUTVkxS2JpbXY0L05SK1N4UFAxajRDaXBVazlWazZk?=
 =?utf-8?B?ZVRoK21vME1uQjJPQXNNdXRNK0c1K0hzNTQ3Vjh1RCtFMzBtNHNNRXlWbWs5?=
 =?utf-8?B?Tll3K0plMU1PT1B2K1dVUkIyVnlHc3dSZ25VcjUzcjVTZTJqdHh3cmZSaEdX?=
 =?utf-8?B?RWpvZ09vOVM4dlpRK3BEejlsWTdRUk82NXhhUEsrUGYweVhNMWlTcGZlRmxo?=
 =?utf-8?B?OU43Qmg1bE9ob1VvVFcxdW5mWm5xc1BYTnkvQ1VPa1VPWVYvL3FuUWZEb3ZD?=
 =?utf-8?B?UEpoUWs0b2l4aGtzUS80T05GU0RNUU9YVVVoek9XVFFKd05CcTQ0Sis5MHlV?=
 =?utf-8?B?cEdBQmVHTFhGb0tveXNTMndtYlJMUjB3YitvYXk3M3M3d0RIS2F2ZlE4TERC?=
 =?utf-8?B?ZXhWZjZSZDZIcHkzVGkyWnAwQk1pa21KYkU4cjV0L1hSRE1WajRNK2JYak9Y?=
 =?utf-8?B?cEN0a09QVnllSFhpVjhvbXJaNVBZT0tnbU1EREk0RThPQ2VoVzdScXNJVjdH?=
 =?utf-8?B?ZmNNTG1GQm5jZ2VqbHdROXdxdFZta3JXRnN6SkdTUmFsOVhOaFhWc1NtOHR6?=
 =?utf-8?B?eVdZTzVyczRXbFEzTGFNcEdwYlRFZnMyNUdnVG1IVU0vZUx5elpJcGNyUnRp?=
 =?utf-8?B?bUFNblc4T3JiT1dpSmptcC9xNWVUdTJMOWwyWlc2YmwvN3dHa3MvR0h2OExv?=
 =?utf-8?B?ZHo5N0RCYWZNTXV0SU95ZFZydGt6QlhnakQrc0NDeWVjYi9YVU1FWGt4SThp?=
 =?utf-8?B?NGRGMHVDZkNPQXArdDhlblhsa0srd09IRkYyc1ZvNjRRTU1GWW9MQ3dpcDdM?=
 =?utf-8?B?MHRTYkd5TmZrbG1sWlQ4SE03OVF1OVpDQWEzWkcvdkIyQlpYVVFlbEpnaWp1?=
 =?utf-8?B?djBUQXpvOVk3V0JackZZR2tOUmFxWWRFWDRCcHhaeWQvSnlocmw0TXNDN3M3?=
 =?utf-8?B?SnYycmVZYWh0L09aVXVtQ2plWER2bzRwc25OZWRGS0M3ZHBNUUFPV29BUU5x?=
 =?utf-8?B?QWEzakxQZUErQUYwYnByN2Q5bjM1N3hURXFYeFB1QlZmZEpqMXp4V3JzYnRJ?=
 =?utf-8?B?SDJ3SjAxUHgrZHBRQU5panEzNXdsNzBaN1daK2tPcDVjbEE4VUVzTDVxNmpz?=
 =?utf-8?B?dVhlNitMcU4vWGdmTjFFN0xsT3NTYXQ2bUhBa2RiMDdySitkRGMwMG0wRi9h?=
 =?utf-8?B?UHNtckNjbmVYQ1dRckFjenFXSmJuVXBWbUZqVk1Ec2c4OTMwZU92WE40cU5Q?=
 =?utf-8?B?ZnU0a1RSVjQyNzBJbTF3NzVKWlVnVGpHdHFYQXpZVDFnTWNod1FoTm1iLzFm?=
 =?utf-8?B?c0NhRWFnbzVxSkhDZjNQeG5tZTM4NERtdFVQM2JLNmJGOG1jUEdTV3BibUJS?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04584a47-74e7-4878-7f6e-08dd9ede9feb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 18:28:36.0735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P6I/WaXrwV+UJzc4IUAH++0/vR9+pTaXEmwpJvk4zqniweQZ9SRF0LWzDkwR0M7UPjdLSTT7Wc8Fd935VyS1uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7133
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

On Thu, May 29, 2025 at 11:24:28AM -0700, Matthew Brost wrote:
> On Thu, May 29, 2025 at 08:33:39AM +0530, Ghimiray, Himal Prasad wrote:
> > 
> > 
> > On 29-05-2025 05:16, Matthew Brost wrote:
> > > On Tue, May 27, 2025 at 10:10:03PM +0530, Himal Prasad Ghimiray wrote:
> > > > Update the bo_atomic_access based on user-provided input and determine
> > > > the migration to smem during a CPU fault
> > > > 
> > > > v2 (Matthew Brost)
> > > > - Avoid cpu unmapping if bo is already in smem
> > > > - check atomics on smem too for ioctl
> > > > - Add comments
> > > > 
> > > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_bo.c         | 21 ++++++++++++--
> > > >   drivers/gpu/drm/xe/xe_vm.c         | 11 ++++++--
> > > >   drivers/gpu/drm/xe/xe_vm_madvise.c | 45 ++++++++++++++++++++++++++++--
> > > >   3 files changed, 69 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > index d99d91fe8aa9..9072e8ae3f3e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -1662,6 +1662,12 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
> > > >   	}
> > > >   }
> > > > +static bool should_migrate_to_smem(struct xe_bo *bo)
> > > > +{
> > > 
> > > xe_bo_assert_held, more on that in reply to previous patch.
> > 
> > Sure
> > 
> > > 
> > > > +	return bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL ||
> > > > +	       bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU;
> > > > +}
> > > > +
> > > 
> > > Hmm, this is tricky. I guess this means sharded atomics on BOs do not
> > > just work whereas for SVM they do (i.e., DRM_XE_VMA_ATOMIC_UNDEFINED
> > > means atomics do not work for BOs but for SVM they do). I suppose this
> > > is the current behavior. I think this will need to be document in the
> > > uAPI kernel doc.
> > 
> > Makes sense
> > 
> > > 
> > > >   static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> > > >   {
> > > >   	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
> > > > @@ -1670,7 +1676,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> > > >   	struct xe_bo *bo = ttm_to_xe_bo(tbo);
> > > >   	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
> > > >   	vm_fault_t ret;
> > > > -	int idx;
> > > > +	int idx, r = 0;
> > > >   	if (needs_rpm)
> > > >   		xe_pm_runtime_get(xe);
> > > > @@ -1682,8 +1688,17 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> > > >   	if (drm_dev_enter(ddev, &idx)) {
> > > >   		trace_xe_bo_cpu_fault(bo);
> > > > -		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> > > > -					       TTM_BO_VM_NUM_PREFAULT);
> > > > +		if (should_migrate_to_smem(bo)) {
> > > > +			r = xe_bo_migrate(bo, XE_PL_TT);
> > > > +			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
> > > > +				ret = VM_FAULT_NOPAGE;
> > > > +			else if (r)
> > > > +				ret = VM_FAULT_SIGBUS;
> > > > +		}
> > > > +		if (!ret)
> > > > +			ret = ttm_bo_vm_fault_reserved(vmf,
> > > > +						       vmf->vma->vm_page_prot,
> > > > +						       TTM_BO_VM_NUM_PREFAULT);
> > > >   		drm_dev_exit(idx);
> > > >   	} else {
> > > >   		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 9611d7ca2bed..1bdf85c12374 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -3116,9 +3116,16 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> > > >   		err = vma_lock_and_validate(exec,
> > > >   					    gpuva_to_vma(op->base.prefetch.va),
> > > >   					    false);
> > > > -		if (!err && !xe_vma_has_no_bo(vma))
> > > > -			err = xe_bo_migrate(xe_vma_bo(vma),
> > > > +		if (!err && !xe_vma_has_no_bo(vma)) {
> > > > +			struct xe_bo *bo = xe_vma_bo(vma);
> > > > +
> > > > +			if (region == 0 && !vm->xe->info.has_device_atomics_on_smem &&
> > > > +			    bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE)
> > > > +				region = 1;
> > > 
> > > I wonder if it better to just leave region as is and let the next atomic
> > > fault trigger the migration.
> > 
> > Ok. lets do it that way.
> > 
> > > 
> > > > +
> > > > +			err = xe_bo_migrate(bo,
> > > >   					    region_to_mem_type[region]);
> > > > +		}
> > > >   		break;
> > > >   	}
> > > >   	default:
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > index 0f0b94cb43f2..e048eb48826c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > @@ -82,15 +82,54 @@ static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
> > > >   			  struct xe_vma **vmas, int num_vmas,
> > > >   			  struct drm_xe_madvise_ops ops)
> > > >   {
> > > > -	int i;
> > > > +	struct xe_bo *bo;
> > > > +	int err, i;
> > > >   	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_ATOMIC);
> > > >   	xe_assert(vm->xe, ops.atomic.val > DRM_XE_VMA_ATOMIC_UNDEFINED &&
> > > >   		  ops.atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
> > > 
> > > Do you sanitize ops.atomic.val prior to this? Also do we disallow a user
> > > setting DRM_XE_VMA_ATOMIC_UNDEFINED? If not, then this needs to be >=
> > > DRM_XE_VMA_ATOMIC_UNDEFINED.
> > Agreed it should be  >= DRM_XE_VMA_ATOMIC_UNDEFINED. And instead of
> > assertion will sanitize it here only.
> > 
> > > 
> > > > -	for (i = 0; i < num_vmas; i++)
> > > > +	for (i = 0; i < num_vmas; i++) {
> > > >   		vmas[i]->attr.atomic_access = ops.atomic.val;
> > > > -	/*TODO: handle bo backed vmas */
> > > > +
> > > > +		bo = xe_vma_bo(vmas[i]);
> > > > +		if (!bo)
> > > > +			continue;
> > > > +
> > > > +		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_CPU &&
> > > > +				 !(bo->flags & XE_BO_FLAG_SYSTEM)))
> > > > +			return -EINVAL;
> > > > +
> > > 
> > > Note when we fail here (or anywhere else in madvise), we could be in a
> > > state where madvise has partially completed. I think that is actually ok
> > > as nothing in madvise is fatal as we are just changing attributes. But I
> > > think we need to document this in the uAPI kernel doc that if madvise
> > > fails, the state of madvise attributes are undefined.
> > 
> > Will add in kernel-doc of uAPI.
> > 
> 
> Actually, on second thought, it might be better to sanitize user input
> before attempting madvise. This is similar to vm_bind_ioctl_check_args.
> I think that would be cleaner.
> 
> I believe we can make the failing state stable if we can avoid failures
> in madvise_funcs (i.e., by returning void), which should be possible if
> we take locks in non-interruptible modes (likely fine, as we’re not
> doing much inside any locks) and avoid mallocs (none are used in this
> series).
> 
> We’d also have to restructure this loop:
> 
> for (i = 0; i < args->num_ops; i++) {
> 	xe_vm_alloc_madvise_vma(vm, advs_ops[i].start, advs_ops[i].range);
> 
> 	vmas = get_vmas(vm, &num_vmas, advs_ops[i].start, advs_ops[i].range);
> 	if (!vmas) {
> 		err = -ENOMEM;
> 		goto free_advs_ops;
> 	}
> 
> 	attr_type = array_index_nospec(advs_ops[i].type, ARRAY_SIZE(madvise_funcs));
> 	err = madvise_funcs[attr_type](xe, vm, vmas, num_vmas, advs_ops[i]);
> 
> 	kfree(vmas);
> 	vmas = NULL;
> 
> 	if (err)
> 		goto free_advs_ops;
> }
> 
> xe_vm_alloc_madvise_vma and get_vmas would run in the first loop (which
> can fail), followed by a second loop that calls madvise_funcs (which
> cannot fail). If the first loop fails, the worst-case scenario is that
> we've split some VMAs into smaller ones, but their attributes would
> remain the same as before the IOCTL.
> 

Ah, as soon I typed this, I realized this doesn't work as this is
iterative process (each xe_vm_alloc_madvise_vma depends on the previous
madvise_funcs being done). So scratch the loop restructure but I still
think validating user input prior to madvise_funcs is a good idea, along
with madvise_funcs not being able to fail if possible.

Matt

> I think this approach would be better avoiding a unknown state on
> failure.
> 
> Matt
> 
> > > 
> > > In practice this really should never fail unless a user is giving bad
> > > input or extreme memory pressure and kmalloc fails.
> > > 
> > > Matt
> > > 
> > > > +		/* NOTE: The following atomic checks are platform-specific. For example,
> > > > +		 * if a device supports CXL atomics, these may not be necessary or
> > > > +		 * may behave differently.
> > > > +		 */
> > > > +		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_DEVICE &&
> > > > +				 !(bo->flags & XE_BO_FLAG_VRAM0) &&
> > > > +				 !(bo->flags & XE_BO_FLAG_VRAM1) &&
> > > > +				 !(bo->flags & XE_BO_FLAG_SYSTEM &&
> > > > +				   xe->info.has_device_atomics_on_smem)))
> > > > +			return -EINVAL;
> > > > +
> > > > +		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_GLOBAL &&
> > > > +				 (!(bo->flags & XE_BO_FLAG_SYSTEM) ||
> > > > +				  (!(bo->flags & XE_BO_FLAG_VRAM0) &&
> > > > +				   !(bo->flags & XE_BO_FLAG_VRAM1)))))
> > > > +			return -EINVAL;
> > > > +
> > > > +		err = xe_bo_lock(bo, true);
> > > > +		if (err)
> > > > +			return err;
> > > > +		bo->attr.atomic_access = ops.atomic.val;
> > > > +
> > > > +		/* Invalidate cpu page table, so bo can migrate to smem in next access */
> > > > +		if (xe_bo_is_vram(bo) &&
> > > > +		    (bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU ||
> > > > +		     bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL))
> > > > +			ttm_bo_unmap_virtual(&bo->ttm);
> > > > +
> > > > +		xe_bo_unlock(bo);
> > > > +	}
> > > >   	return 0;
> > > >   }
> > > > -- 
> > > > 2.34.1
> > > > 
> > 
