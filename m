Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3120C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 07:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E5E10E367;
	Tue, 16 Jul 2024 07:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ppwl8BK6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4682510E367
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 07:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721113389; x=1752649389;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7zSbNX5DEa9bTY7Td7DSlW8QPPTpBO8FXJbXy5wCyOg=;
 b=Ppwl8BK6K1FX8e/YovHOO79DBpRr1Q4+zUYhkZbzpuitoSJwjoVPc1Vy
 jkx8sVadyHx9fBCLYpu0SzS/DTcYmwRbpZ7Vnc8BURDjLflDNzpmAF0Rw
 xw8JBq5DB6XVSZvzFSbDu0BbIpwkwbtQ+cyZL4DijpLXGSMJVqSIBNmCA
 ErKq0q1k3LHjAOq7suGnLNWP5SEOhj4CIJnyo6zTi/nCtFWqCjsiPRzG8
 z2pnrIyR2GKNGGXcHEw0BxAXAC8Nj+9pLfcl0b98UeMasmvmlzZk6L/Ah
 iLjNXb2mIuJbvCDMIZ8tS+63+BAu8In9aQhzKI3kn1+/at6mwGdxudPVf w==;
X-CSE-ConnectionGUID: mthE7fyaTfKfg0ombQBnnQ==
X-CSE-MsgGUID: WrSDkUFcSzSQcHbtfmad4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="22292797"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="22292797"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 00:03:06 -0700
X-CSE-ConnectionGUID: GVIFi3pyQh2v3GeewZMKwA==
X-CSE-MsgGUID: mwfaIraWRmyoAUH1obYWAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="54813353"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 00:03:06 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 00:03:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 00:03:05 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 00:03:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqYUu58n+XmuJFsk76SUCbgJNVkDAcEg8azOoDgni66odPX25SHiDmeu3b3kdQc3gEyqJoVPeXbMSxacAq/wSR0zafme377fR5ctrlmJoOsyZrvklg9CTvhZvqsndySnIy3nyXHiZzIaAGqhic1H8Ef0DTX6XLgAWooC1OXYguBdqACIDrAPbfZXG1slN7+caNut/EFpqQBD6fQlRJyBQGapyhN87zs04T4cNBh65is10CS06bRRxnDc2+aRL3zSR1GdevhO8HeUBeBJ96uCVkdDjlPyBzt+Lf2hG2dJ+HhN63+UnbL3AL3osx1ZXqXkjnp699o7eujzykYkyoJB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYRXgC6iLHyKNPLRUI8OIDta8GvwXyZPrs83XpbURQI=;
 b=UGEZJmWtcjZ/lsOLHldMnN0Lief75wRT/OA1trmrdmp51uqD1zeVDU/hDBMP10C1jGujCoFxp6UNvyiCXzTFJC5Zxu7+rhVr0Wg+EmqlzNKL2VEQwULDXW73kZXSLMSEo8CR6D7StfxUYRRV0mDIEzcQ0c5UBuMmoMXW9cc53IsyF/H8AjPdyMst3CAyNdDfoXaT5Q1hWbD9r3r73mdePsx2m+dEPLDM3C93vIkzvu7edBImCdliHvHIJyPAexNrstRn4lxcJeak/tfjYjRvTDbiX+VBSP/KbcVpPVm7jRVvEi6XaziR2kQXvPmdF9C6qwYNCKFOKqVq27T93znx4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7655.namprd11.prod.outlook.com (2603:10b6:806:307::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 07:03:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 07:03:03 +0000
Date: Tue, 16 Jul 2024 07:02:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <akshatajahagirdar6@gmail.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 3/7] drm/xe/xe2: Introduce identity map for compressed
 pat for vram
Message-ID: <ZpYa+2dV9DTH7f8Z@DUT025-TGLU.fm.intel.com>
References: <cover.1721091282.git.akshata.jahagirdar@intel.com>
 <b98a7f3d85f585484a4b6ea7a7fba501b9e42e02.1721091282.git.akshata.jahagirdar@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b98a7f3d85f585484a4b6ea7a7fba501b9e42e02.1721091282.git.akshata.jahagirdar@intel.com>
X-ClientProxiedBy: BYAPR06CA0068.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::45) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a569d7f-6357-4c15-4e44-08dca565561b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZW1wc1FJMEtET1R3Z1pXQ0Y2SHZya0dadjdtSFE0RVFTVzR4UHZvMms4ZkJV?=
 =?utf-8?B?UjV3TzFkN3QrRUlsT0dlSXNGazdMajEvNkR5ak9lT3g0cEs0NWJGYmhyUjFB?=
 =?utf-8?B?S000dVRaNG5ucGRLMEhRbFNwb3VLOXdlYkJJNG5RVnlqalp4U2lsNlYyc0tC?=
 =?utf-8?B?c093MEVhVmthTmM5TVhYd3JTZFZHb1ZCd3lQK2pFZ2gwZHdwTFFkMHpFd0cz?=
 =?utf-8?B?YnQvSmpOWUx1UHRJdTFXM2FKTEs2dk5XQjZVME5MR0huWnZLbGRxc3Ava1Rj?=
 =?utf-8?B?bmdUQWxKVER1b0FudjczbzNlL3NBdTlZZ1dQeFZJSHJnZUxjRm5LbXowamNt?=
 =?utf-8?B?MzBNMjU2RlF3Z1d3UTQySWVHSmRTM1pPbWFZaDI2K0NVeURQYWNxakN5ODRC?=
 =?utf-8?B?OWhkRUNTdWRoSi9nYVFlZE5wVGZSVno1dGhvYTNSdEMxR0hhckgyckp6Um9l?=
 =?utf-8?B?cmo2VTRLb0Z4NlR5NE05MkFTRnVQdi9yMnorL3VEVXdBQk9qWkpiRTJWWmds?=
 =?utf-8?B?ZXlrSG1ZbUZoTmJEV1RiRVJDZkJRamdBNkxtcCtRdXZMUnd6RU5Pck1yb21y?=
 =?utf-8?B?Yi9oQlkrdTdqRDdpT0E5UmdHUGUzUjFRT1VxZ3BqeDlpUEp3b2crd2ZYbnps?=
 =?utf-8?B?MndhTXhqcXVHL1dnd0RvdnZoalZoc0JXM29WRmpxS0ZRVEg5dDBRYkRacmNm?=
 =?utf-8?B?RHdIbVB6cXpiUWZjTzlmYUkyclFLVi9FYUQxTFd5MVZNcFU3bDhNK1grZzZn?=
 =?utf-8?B?ZFF6dk55akRZeGQ0RGtpRE40RUJxRDBYTFlrVE1WR0FQWVZyMmRBOWgyUzd2?=
 =?utf-8?B?d1FBZmw1WGNCSElXVVF0c2ZEcXhCQi84Mk1QSmtLR2w0d0ZOdkZVMlkyZ25m?=
 =?utf-8?B?bGw1UGNMeVM0Y2JrYkxnTTltZlRVLytRcDJFNytFbVIvd2dTZWI0OFFnQ3pt?=
 =?utf-8?B?dmREbDUrT2ZOU2dFa054YTBHcEREc3FYQ1NrKzdGTUE1K3kwNjJGdDlNaEpu?=
 =?utf-8?B?Wi96Uzk5RVd4NVpxa0VJb3pWZTlremYyQnFJTXUyZHBCZ3ZQdlc0b0c3aXRG?=
 =?utf-8?B?M3RIS3dkN1dTYmludU50VnJucVRrc1ZSS2lVamkvdC9kU0tMcDJaZi9uYWRl?=
 =?utf-8?B?MGt2a0VUV3hLcDVDT2pOTDBPMVBUUWdEMlJzM3JESVQ0Mm5ZR1dHdmw3T3Jy?=
 =?utf-8?B?Vk5GeUNIWC9weUtlU3JVcllGdkRqZEhaUjl3cnNjRjA4UlByTkdwVWFUT2pO?=
 =?utf-8?B?Z0NRdy9GcXQ3bE04WTh0T3A3aGRZaXYzSXBScCthSHFSMTNNRDA0U045Q0sw?=
 =?utf-8?B?SnlVVVFlVExqbE1WVWJERk0rTExkWFFac2gyWlJxblBlb3RSZlBiNUVTRFFW?=
 =?utf-8?B?NktGeGFuQzJmUkZqd1FzTnBOUmFEQVdhSjVPR0t6MXBSenJLNFQxWlVpTDQw?=
 =?utf-8?B?VU9GUWZaci85UTkrdzNJbEFUWEkrUXFCZk1LVzFVemFuMFNudG9UOFhJOGRK?=
 =?utf-8?B?enBPWDdDVnIzNThSdUgxYzJNU0t6Q29wRnp5Z3BuQ0sySUpBbkdyWnZrNUww?=
 =?utf-8?B?c2NucVljb09mcEc3Q2piUEtRd2IvZm5BT1pMN0Zrb3NKbThqVVd3OHVONFVX?=
 =?utf-8?B?dHVZY1l1bDBSSi9BaEtIQys0cDd4VjVmVnJFZ3M4RXd6djJmUWF3bEg3OFQ0?=
 =?utf-8?B?c0RlM1QxekFTQ3F1WVF4RlhRT0xJeC85bHNKemNtenFYVjE4LzdORThNZjB3?=
 =?utf-8?B?aEJXOERxVG0zbVZOYmZySEFuS2pkeitxSlRONEttaXVweGRWcWl5ODhwSms4?=
 =?utf-8?B?TUVUOTM0UDBnZDZ6SjF2dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFpBc2JWK3pGNHlSNldOVkZLUmxjTmt5SWpvN0lPRDRRNkIxQU1pTGNQNVpv?=
 =?utf-8?B?UmZGYWJ4cm1NWk9vdW00ajI1d1pXbUlYNlhoeDJ3SWt2aDJPSW92U28zRkt5?=
 =?utf-8?B?a1VnSmJndUJWVjhRTUdleEJ1YTJmQ3l4Vkh3WXVqSU5EWmQwNTZHODhpSjJm?=
 =?utf-8?B?ZWRvWWxUVlZyczEyc2l0T3h2NkoreVpMejlpYlFkU2RxcXd3U3M3aXBaT3dP?=
 =?utf-8?B?R3F6YVVQTWladU5sK1Z3MVBmYndqdGxsUnZsem1qSDhNblBqK255MlhSZEpO?=
 =?utf-8?B?T2dIZW5ZSDIxZ3FMdjhZNDRhSG1YOTRZUWlLaWRYTkZWNG9xUXUrdC9SVVNB?=
 =?utf-8?B?SnJ5U09Sc1Z4ZUdzbnRJN1dKQmRrbCtnTEFBMHZnVG1nUC9zSUZYSktNdjBO?=
 =?utf-8?B?cm0zakNxTzBnMEJ4a1JGR0NoSlBzUDd6RnpnNVFlZk9zNnRLcE5mTTF3c2ta?=
 =?utf-8?B?TkhjTVZRZnBWaCtkcTk3N0ZMb25XTS9CamhuejZFK0dINXRRSkR4QTNOR09u?=
 =?utf-8?B?UnBxenV5cVM1TmFlNzlVN095QzBjbTZ2RzdMZWF5cWJsVDByYm9BbGd5Wnkx?=
 =?utf-8?B?OXljcnZkOGdHRHBja0htOUFUK29FbUQ5WWt4ZEs4QkUyQXR1anI5TmFMMGdt?=
 =?utf-8?B?b2FiWDRad1RKNG8xckJzMFVySWUxYS94d2h0MVBMK1JoL0lWL0EzVVVRcGYy?=
 =?utf-8?B?Zko2WlFKV1lTUHFXOGVRaHlPaVR0SmJLbW95UEcyN09QNW1oZXZKdEdmR2ZW?=
 =?utf-8?B?YVZ5ODhxVWdGYXhpZmtIZHBjTVhCSjBxaUUwemFTMVcvREQ5SE5SZHZQaXI3?=
 =?utf-8?B?eUVVQzlKY2d4UEZoVFdHYkFMSEJ6YlVwV09kNmxsaUVaMlVmYlNhVHdhODF0?=
 =?utf-8?B?eER1QmxndDBtZHhuSEFwMFRBNmNtRnZlNVpCN2RuaFZ1c3VaRFh2bXpSM1hP?=
 =?utf-8?B?MmZnaWJwaEd2S1ozd2VrR0R0SUEyUXlBRlVqbW1BZ3gwUXBSOFg4NnJuaDh5?=
 =?utf-8?B?aUdxMThiamRZN292NTRwYWxLMFJJS0htVUJEcG5ZR2hiWURYc0xJUGUzZGJE?=
 =?utf-8?B?MGR1Uk5Ba2dPeWgwMVc4Q3hoUlhMWTVVVEQ2Yy9SQTZOeC9saU9rRWZoeDVx?=
 =?utf-8?B?MUlEL0pCSjFCT3FrL0MwV2VwQW92VHhWREZpNmJ6T1RxQ2U5SGlJdFpsS25O?=
 =?utf-8?B?SXlreG4rQ0ZjOEpoNmlObzlNcXJYTGtlbzZieUcrblpkYi9udUFhSFhsT2xo?=
 =?utf-8?B?dW9zTHEyUnI5bitFL2tIb3hRcVN0dHAwZ0lEVHVaTlphYW5vbjdITURMZmtE?=
 =?utf-8?B?SlgyeWpKNitOVVlZSXJLVVN4eGp4cFJ3TWl0TCtRanBybjV6TE11b0lxbUFa?=
 =?utf-8?B?ckttbWU1ZVZKY1Z1SExiSEowK0FaUW9SciszTGZkVHA3YTQ1MTJmRG9HT296?=
 =?utf-8?B?Y0c1MDlaUXBJNjNXL3g2cXVoa3hlMGsvUGhCdjdzem1hZlEzdHhHUTVSWS92?=
 =?utf-8?B?V1cydlU3SExTaThLdWJBaVpJQkdJc3N1cm90THpvMVZWTFU5cEcvNFBFa3Bl?=
 =?utf-8?B?a2pvc1BZYW8raDVDQjRyc2tmcWJxL20vY0EyMWs5SXlTQXNLaTBaMXdJWmlP?=
 =?utf-8?B?OE5hODBHK21CcXltM1pQcnNYNkZvM3FJb2dXLytjZGZvNmxJaHN6b21yWWta?=
 =?utf-8?B?c2FnU0xwSzFZRTFOd3JPQmI0a0cyY1dxZTI0cVFiYUxmb1k2TTlaTVRsQ0ZQ?=
 =?utf-8?B?Y2M5WUFwTjJJWUxkV1lmMmxWbUpFbVNjWENEeFd5UHU2UysvSEMwdnQ5cDBF?=
 =?utf-8?B?d085d1VVYjVBaFZtTnBDY3Vrc0xQR1VLMkhpMWxEZmpSVjZHOUg2NU5ZcVRU?=
 =?utf-8?B?K3lPS0wwMFVSMS9iekdvZWVzRlNJcFEzb0RSUHlaR1F0WnZwbmNwb2xzZjhE?=
 =?utf-8?B?cWlOOFJKQ3NwWmdDdFc3dXd0RkwrYUJ1cVExZG1QVldhRXhsSjZ5NEJyK09j?=
 =?utf-8?B?ajBqUDl0WVBZMHBvVHN1WHpRcjVTYjRiYWFPSnBOT3F5MVlxZWMxN2R6aE50?=
 =?utf-8?B?b1VvNUtwaUhoRXREQmZaclpCMUw3M0xzN1B2YW13a05raTRFeVJVK0pINU80?=
 =?utf-8?B?d1ZYamdzUWI5UlJOVjJEWjNmRzFmNlkwM25LSGZpblpIUTRWNXpXc2tScHM2?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a569d7f-6357-4c15-4e44-08dca565561b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 07:03:03.5907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9yK86eYBMRYqOvAAjCC4WLuO3vEhJtUE+sXHTAOvBHH7WwlYGSMDoHYeNGuV/tGpt4EzeqJ2e7GyiX94MdaYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7655
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

On Tue, Jul 16, 2024 at 01:01:07AM +0000, Akshata Jahagirdar wrote:
> Xe2+ has unified compression (exactly one compression mode/format),
> where compression is now controlled via PAT at PTE level.
> This simplifies KMD operations, as it can now decompress freely
> without concern for the buffer's original compression format—unlike DG2,
> which had multiple compression formats and thus required copying the
> raw CCS state during VRAM eviction. In addition mixed VRAM and system
> memory buffers were not supported with compression enabled.
> 
> On Xe2 dGPU compression is still only supported with VRAM, however we
> can now support compression with VRAM and system memory buffers,
> with GPU access being seamless underneath. So long as when doing
> VRAM -> system memory the KMD uses compressed -> uncompressed,
> to decompress it. This also allows CPU access to such buffers,
> assuming that userspace first decompress the corresponding
> pages being accessed.
> If the pages are already in system memory then KMD would have already
> decompressed them. When restoring such buffers with sysmem -> VRAM
> the KMD can't easily know which pages were originally compressed,
> so we always use uncompressed -> uncompressed here.
> With this it also means we can drop all the raw CCS handling on such
> platforms (including needing to allocate extra CCS storage).
> 
> In order to support this we now need to have two different identity
> mappings for compressed and uncompressed VRAM.
> In this patch, we set up the additional identity map for the VRAM with
> compressed pat_index. We then select the appropriate mapping during
> migration/clear. During eviction (vram->sysmem), we use the mapping
> from compressed -> uncompressed. During restore (sysmem->vram), we need
> the mapping from uncompressed -> uncompressed.
> Therefore, we need to have two different mappings for compressed and
> uncompressed vram. We set up an additional identity map for the vram
> with compressed pat_index.
> We then select the appropriate mapping during migration/clear.
> 
> v2: Formatting nits, Updated code to match recent changes in
>     xe_migrate_prepare_vm(). (Matt)
> 
> v3: Move identity map loop to a helper function. (Matt Brost)
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 123 +++++++++++++++++++-------------
>  1 file changed, 74 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 85eec95c9bc2..53d3c044d30e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -120,14 +120,67 @@ static u64 xe_migrate_vm_addr(u64 slot, u32 level)
>  	return (slot + 1ULL) << xe_pt_shift(level + 1);
>  }
>  
> -static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
> +static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
>  {
>  	/*
>  	 * Remove the DPA to get a correct offset into identity table for the
>  	 * migrate offset
>  	 */
> +	u64 identity_offset = 256ULL;
> +
> +	if (GRAPHICS_VER(xe) >= 20 && is_comp_pte)
> +		identity_offset = 256ULL +
> +				  DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
> +
>  	addr -= xe->mem.vram.dpa_base;
> -	return addr + (256ULL << xe_pt_shift(2));
> +	return addr + (identity_offset << xe_pt_shift(2));
> +}
> +
> +static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm, struct xe_bo *bo,
> +					u64 map_ofs, u64 vram_offset, u16 pat_index)


Hate to be pedantic but I'd make adding this function a standalone
patch.

> +{
> +	u64 pos, ofs, flags;
> +	u64 entry;
> +	/* XXX: Unclear if this should be usable_size? */
> +	u64 vram_limit =  xe->mem.vram.actual_physical_size +
> +		xe->mem.vram.dpa_base;
> +	u32 level = 2;
> +
> +	ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
> +	flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
> +					    true, 0);
> +
> +	xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
> +
> +	/*
> +	 * Use 1GB pages when possible, last chunk always use 2M
> +	 * pages as mixing reserved memory (stolen, WOCPM) with a single
> +	 * mapping is not allowed on certain platforms.
> +	 */
> +	for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
> +	     pos += SZ_1G, ofs += 8) {
> +		if (pos + SZ_1G >= vram_limit) {
> +			u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
> +

We can't reuse pt31_ofs twice here. Both identiy maps need a dedicated
PT for 2M entries. So I think the 'pt_ofs' needs to be an argument with
the first call passing in pt30 and the second passing in pt31.

Also then this code will have to change to use pt29:

 163         /* PT31 reserved for 2M identity map */
 164         pt30_ofs = bo->size - 2 * XE_PAGE_SIZE;
 165         entry = vm->pt_ops->pde_encode_bo(bo, pt30_ofs, pat_index);
 166         xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);

e.g.

 163         /* PT30 & PT31 reserved for 2M identity map */
 164         pt29_ofs = bo->size - 3 * XE_PAGE_SIZE;
 165         entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs, pat_index);
 166         xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);

Lastly, I think num_setup will have to 'num_level + 2'.

You can do the PT shifting conditional if 2nd identify map is needed
too.

This one of more complicated parts of the driver so please do not merge
this without an Ack or RB from me or perhaps Marteen.

> +			entry = vm->pt_ops->pde_encode_bo(bo, pt31_ofs,
> +							  pat_index);
> +			xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
> +
> +			flags = vm->pt_ops->pte_encode_addr(xe, 0,
> +							    pat_index,
> +							    level - 1,
> +							    true, 0);
> +
> +			for (ofs = pt31_ofs; pos < vram_limit;
> +			     pos += SZ_2M, ofs += 8)
> +				xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> +			break;	/* Ensure pos == vram_limit assert correct */
> +		}
> +
> +		xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> +	}
> +
> +	xe_assert(xe, pos == vram_limit);
>  }
>  
>  static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> @@ -214,12 +267,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	} else {
>  		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>  
> -		m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr);
> +		m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr, false);
>  
>  		if (xe->info.has_usm) {
>  			batch = tile->primary_gt->usm.bb_pool->bo;
>  			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
> -			m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr);
> +			m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr, false);
>  		}
>  	}
>  
> @@ -251,49 +304,21 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		  | XE_PTE_NULL);
>  	m->cleared_mem_ofs = (255ULL << xe_pt_shift(level));
>  
> -	/* Identity map the entire vram at 256GiB offset */
> +	/* Identity map the entire vram for uncompressed pat_index at 256GiB offset */
>  	if (IS_DGFX(xe)) {
> -		u64 pos, ofs, flags;
> -		/* XXX: Unclear if this should be usable_size? */
> -		u64 vram_limit =  xe->mem.vram.actual_physical_size +
> -			xe->mem.vram.dpa_base;
> -
> -		level = 2;
> -		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
> -		flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
> -						    true, 0);
> -
> -		xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
> +		xe_migrate_program_identity(xe, vm, bo, map_ofs, 256, pat_index);

So this is existing code but it breaks if
xe->mem.vram.actual_physical_size > 256G, while you
are here add an assert for xe->mem.vram.actual_physical_size < 256G.

>  
>  		/*
> -		 * Use 1GB pages when possible, last chunk always use 2M
> -		 * pages as mixing reserved memory (stolen, WOCPM) with a single
> -		 * mapping is not allowed on certain platforms.
> +		 * Identity map the entire vram for compressed pat_index for xe2+
> +		 * if flat ccs is enabled.
>  		 */
> -		for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
> -		     pos += SZ_1G, ofs += 8) {
> -			if (pos + SZ_1G >= vram_limit) {
> -				u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
> -
> -				entry = vm->pt_ops->pde_encode_bo(bo, pt31_ofs,
> -								  pat_index);
> -				xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
> -
> -				flags = vm->pt_ops->pte_encode_addr(xe, 0,
> -								    pat_index,
> -								    level - 1,
> -								    true, 0);
> -
> -				for (ofs = pt31_ofs; pos < vram_limit;
> -				     pos += SZ_2M, ofs += 8)
> -					xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> -				break;	/* Ensure pos == vram_limit assert correct */
> -			}
> +		if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
> +			u16 comp_pat_index = xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
> +			u64 vram_offset = 256 +
> +				DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);

With this change, this code breaks if xe->mem.vram.actual_physical_size >
128G, add an assert for xe->mem.vram.actual_physical_size < 128G.

At some point we may hit these memory limits so best to protect against
this.

Matt

>
> -			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> +			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset, comp_pat_index);
>  		}
> -
> -		xe_assert(xe, pos == vram_limit);
>  	}
>  
>  	/*
> @@ -480,7 +505,7 @@ static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
>  }
>  
>  static u32 pte_update_size(struct xe_migrate *m,
> -			   bool is_vram,
> +			   bool is_vram, bool is_comp_pte,
>  			   struct ttm_resource *res,
>  			   struct xe_res_cursor *cur,
>  			   u64 *L0, u64 *L0_ofs, u32 *L0_pt,
> @@ -492,7 +517,8 @@ static u32 pte_update_size(struct xe_migrate *m,
>  	if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
>  		/* Offset into identity map. */
>  		*L0_ofs = xe_migrate_vram_ofs(tile_to_xe(m->tile),
> -					      cur->start + vram_region_gpu_offset(res));
> +					      cur->start + vram_region_gpu_offset(res),
> +					      is_comp_pte);
>  		cmds += cmd_size;
>  	} else {
>  		/* Clip L0 to available size */
> @@ -783,17 +809,17 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  
>  		src_L0 = min(src_L0, dst_L0);
>  
> -		batch_size += pte_update_size(m, src_is_vram, src, &src_it, &src_L0,
> +		batch_size += pte_update_size(m, src_is_vram, false, src, &src_it, &src_L0,
>  					      &src_L0_ofs, &src_L0_pt, 0, 0,
>  					      avail_pts);
>  
> -		batch_size += pte_update_size(m, dst_is_vram, dst, &dst_it, &src_L0,
> +		batch_size += pte_update_size(m, dst_is_vram, false, dst, &dst_it, &src_L0,
>  					      &dst_L0_ofs, &dst_L0_pt, 0,
>  					      avail_pts, avail_pts);
>  
>  		if (copy_system_ccs) {
>  			ccs_size = xe_device_ccs_bytes(xe, src_L0);
> -			batch_size += pte_update_size(m, false, NULL, &ccs_it, &ccs_size,
> +			batch_size += pte_update_size(m, false, false, NULL, &ccs_it, &ccs_size,
>  						      &ccs_ofs, &ccs_pt, 0,
>  						      2 * avail_pts,
>  						      avail_pts);
> @@ -1034,14 +1060,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  
>  		/* Calculate final sizes and batch size.. */
>  		batch_size = 2 +
> -			pte_update_size(m, clear_vram, src, &src_it,
> +			pte_update_size(m, clear_vram, false, src, &src_it,
>  					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
>  					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
>  					avail_pts);
>  
>  		if (xe_migrate_needs_ccs_emit(xe))
>  			batch_size += EMIT_COPY_CCS_DW;
> -
>  		/* Clear commands */
>  
>  		if (WARN_ON_ONCE(!clear_L0))
> @@ -1151,7 +1176,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>  	if (!ppgtt_ofs)
>  		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
>  						xe_bo_addr(update->pt_bo, 0,
> -							   XE_PAGE_SIZE));
> +							   XE_PAGE_SIZE), false);
>  
>  	do {
>  		u64 addr = ppgtt_ofs + ofs * 8;
> -- 
> 2.34.1
> 
