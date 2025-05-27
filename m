Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90313C54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 13:07:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532D710E150;
	Tue, 27 May 2025 13:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G6xwlO1C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B18E10E150
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 13:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748351268; x=1779887268;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wioLQOXibLco8Gpcnc3z1JJzXSS11prv1P/SzFzQLGc=;
 b=G6xwlO1CKrmHBhp87ZOBadU799HyuKwH5NnGuaQ+4qkbhDORcxptUlbv
 ewhgOL11HX+TOjUOXbrA3NskBhYNLeblyevV+dHYP+DBHupc4wdNb0p6w
 8WIa9v1rwmYCUgPRDhIlrrkvVkfSFcuRGyxlpRWy3Q9x4/FmMpGTmMdeE
 kl2jIzCukSQLxQw8JgWiuAyAy3LqbEQMyPnfvFCAn0nhLdEvCbuHYswWg
 B/UAhrD83NK3KmYlex0PaBEFWDMVv8Vsf31tu7Q/BY2Rv2yzEgqd6U/ph
 /g21KVP426PX8ldyytR5M759X6yATtMgVhG2dkXXM7Z0EXvc65EJ5tkP8 Q==;
X-CSE-ConnectionGUID: Jjck7LnbTMGVfiRZ9QsWQA==
X-CSE-MsgGUID: kuWazyRwRQ6pH00T36jcig==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="67757342"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="67757342"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 06:07:47 -0700
X-CSE-ConnectionGUID: thjNMi7RRiKvBsNLpLM62g==
X-CSE-MsgGUID: nPqm3dhIQueTc8+krZT0QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="173774171"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 06:07:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 06:07:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 06:07:46 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.65) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 06:07:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aEZCUj9tnhmkJy2lCK2mBvBEK17QIKdS9YcttNgRQ3AJ2It8pyPyqIseUeUl6hYDTjDUOqkxYkSNVP1RhrUKLWGkrIik0FT+jhIVJDIjM1G9ACGJNgrl6ERH9hHujN1wMByuA60v8iWHGNph4S1sXhFr7gIAqCkBZUSpQ/q34BZhSD9qV9lo3KGMoIqzq9Txx50tVL4WPfUtF4STFrq+L92Fc71n4cMpdPcNjeZEzdfocFdeHMH53pbMH1ErbeCUec1CCGjfX4Swc0Fh6sx+DhVs0xHid3zpQjYV19oDW+jaHavtskX4/i32I8WLC9UNaSk3zUCNY3F8xOKOZr+MVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ni0bIZjMOxRBiDWQcZVy4ARfDMnBJKU68hCkGLdGjQ=;
 b=ooKbMKRZPAulMSpN4Dy4oJOfyjd8Tq7P5RL2kBE073FhaOVD1Y7Za4VEdRj+q2nHtOTUp2X2alRo0BODAeVLcxIh9/TWoIeBXhJt1o/sFGDllShiPZkPKfEb/foelAg7bfEeAZdxkMQPvPeEWcyDtGwmCcQRaZU9jAjN/xtGCrYrnY3Zj8QwFSzwmk4/jUBlZ4Ox7Uqoeja5BHIbGyNAOwWbSgzJgr1/eQCRJyhC7MURy7WZS3P69F1TwHrdA0y7eC9b9KvzNBhabSDya6VjlwcKqA8tiGT4uCEH4T1NjXGchpKfd75wM6zJJyFCR+/X3jyE0RD0iY5utFPIN3HU2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 by SA0PR11MB4717.namprd11.prod.outlook.com (2603:10b6:806:9f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 13:07:27 +0000
Received: from MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6]) by MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6%4]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 13:07:26 +0000
Message-ID: <ea09cbd2-5752-4a19-ae5d-68f88484dfa2@intel.com>
Date: Tue, 27 May 2025 15:07:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix out-of-bounds field write in MI_STORE_DATA_IMM
To: Jia Yao <jia.yao@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Brian3 Nguyen
 <brian3.nguyen@intel.com>, Alex Zuo <alex.zuo@intel.com>, Shuicheng Lin
 <shuicheng.lin@intel.com>
References: <20250523150418.168362-1-jia.yao@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20250523150418.168362-1-jia.yao@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR06CA0048.eurprd06.prod.outlook.com
 (2603:10a6:10:120::22) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6864:EE_|SA0PR11MB4717:EE_
X-MS-Office365-Filtering-Correlation-Id: 386d52c4-c5a8-4843-4bbb-08dd9d1f6db9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnY0M25paEVsb2VZT0RBZVBwRnlJQklSemR0N21xcHNVc2crNmRrLzJtTkUz?=
 =?utf-8?B?THl5bEJNdXBoaGw0WXRQaU05NXYrM1JwWExMMjlVMHpMQzdZVDNkY0pRcFpD?=
 =?utf-8?B?UHp5NEhCMGlTUm14VDV1d3p4U1pMK0xwanpkdk5idW9hYndRSDA0bkM0KzJh?=
 =?utf-8?B?NU1IZjQ2K0Q0b09Ic0xZUGFzT3VKdUlOUmRUbjZyaDRLVlUzQ3RqQ1hCbm9W?=
 =?utf-8?B?Mm11UGFsRDliV3JaTXpIT0cva3FldnFodHR4Wkc0aHhEMTUxamM1UVFxRy9i?=
 =?utf-8?B?Y2U0Ti8wcjMrSUVpemFoL3l1V3dkd2xaQzlyTllHRG9keTZxOWtOQmEvMnQ1?=
 =?utf-8?B?YU0wckJmY3IwblpIK29XK1JiRzhHeDJ0L1NjdUlEQWNaQXhzS2dIcjBGMWND?=
 =?utf-8?B?a2REVEpnWXdpamNUQzdZU0NpY1F1Ty9yYmp0NThLWW9KQjJaK3JBTUxQSXlX?=
 =?utf-8?B?SUVLLzhnRE5UaTE3T1RVVHkrTHRBbTZ6VEFub2Y4eW4yNEFCTXB6RlJvaWFp?=
 =?utf-8?B?ZnNxT3M4Y0JrUDBwZG0yeWVPbk5tUnk3Zk1qVkZCKzUxVmNQbWV6U1lWVktL?=
 =?utf-8?B?OUdVWUhkbXVWdkcyQndrb0VEQkNsUkZMUXRZT2ZtdjZIcy9JK252dVdNV0VV?=
 =?utf-8?B?cGQ3MlFhVE00VkZwYm4rUEgxUFZ5VU1aUHA2TTZuQ2I5KzMrckpmNExZb0FK?=
 =?utf-8?B?ZVc5Nm5wWFFTL2pMOVdnZnJOYXgza2RZRXg1MVUwNHRWOGtEank0V1YrRzRV?=
 =?utf-8?B?NGYyQTVmdW9yOGJOQnpQa1NmMCtzUjJuRzEzWTJTUTZkaTZ3enp6cS9Db3hD?=
 =?utf-8?B?ZkpCT0FzTHYzYXh6QmdyUFNZaTJxZGYzMTZydnpFaHd3OEpSL3NSd3Z2Zys3?=
 =?utf-8?B?ZE9qK2cySzkvTkJjUEduQXBpVFZHTE1NajNHQThQSm94SGNrNkZUOWFUeVdH?=
 =?utf-8?B?ZHVsYTRjS2NWYWJaeVV6MTJTWWpKNGIrUGNDVUlTUk16MGY4Q2FhbCtSN0dm?=
 =?utf-8?B?elh3SExMVFpMc3VaMU5FMXhsM1FIaVFHVEJzSi9hZHU1NllGT0FVZzFhajNq?=
 =?utf-8?B?Q0RjTkxNRUdoS29xSVpaTVdRMk1mMGp1emZHY2Q2OHdmb1VJelIzQmo1N0Nz?=
 =?utf-8?B?S3hYVU5uS08yZXp3UE5NNVhLOUt0c0FyQVdVS1FPUDIzbkI3ZW50Q0FyVFhU?=
 =?utf-8?B?NkVFYjg5V1d3Q1NWK1pRbWFFNWtjdDd6anNwenFBK2EwaW1SZ3dpRUhpQ3do?=
 =?utf-8?B?ZXVSZ2V5NE1WNUhRYk51SDRpOWN2amV4QlljRmo5REMvbnhhc2VyM05KVEdG?=
 =?utf-8?B?K1hGYVVVcDJXWU9NekM3dzlWZHYwc1FZcTRxbWY2cG1Od0R4b2hNZlVKcHVG?=
 =?utf-8?B?RmpjblYzckdHdWF0VlN2Qk8xd3dvOGVkRlpOWlJBTVBNZWpnSnJPMkFjWWo1?=
 =?utf-8?B?b21EenB1SUdlNnhIU1hFS1NDUDYyNmRaLytZOUJHVWFkT3ZQNHV1UTdaUlhH?=
 =?utf-8?B?Z29UMjM5aFlkcXAvWW9sOEJJUmVDYjhocDg1cWU5THFuOWQ5WFVJc2lDd05I?=
 =?utf-8?B?cGw3UFNNdElPTTlsVGp3dTJiMXNYTmpYNHlsTm9EQklTK3pmZVcyNmJrV1pG?=
 =?utf-8?B?YzZBMXEyYVV0UGZpNFZpR3I1ZFBHbGdFVTRXRytmd25nb2lyRzlMZCs0amo5?=
 =?utf-8?B?QTlVRCtpdDBjeDh2SExTZWxZd253TlJ0eURKUjBKNE5DRWRGbk9HT1U3NXFJ?=
 =?utf-8?B?bjRLdWhJejgyR0Fyc3JmYzFhYzBldzhoTGppSW52eU4yU2x4eUczQUQvSWRH?=
 =?utf-8?B?N1Znd1ArVXhuTTMvSm15NFBEaG1MUlhzRUNZWWtIR1dvcURVbDNac05jbkty?=
 =?utf-8?B?aU81NVg4bGJNdWxaTVRPWVRkRHVwbXQ5dFpXajY4YVRBMGN6VlQxVXd0ZVV4?=
 =?utf-8?Q?jy+9ILWRVv4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck1memdRRnFFVjVQYTJWTkU5WjdDd1VyQ01YUVlxOUd0Q3JyRERzdElFVmth?=
 =?utf-8?B?eXlxLzZFbXhPNmNOM0N1NDl4YTJpVHJuTmI0bVF6bjMweWs1d2Y2YUdhMEdT?=
 =?utf-8?B?UTVxSHBMeUgzNHBGTVJwNEUxTW1seU55Lys5THhxbUFEbUlUSCtackJPR25n?=
 =?utf-8?B?K2xFc082MjZSQWVWcDNYWE82T256bVExNFluaWNwQVZmQ1U4VDVZQ3lqMkdY?=
 =?utf-8?B?L3pZOUdNYUlXemxEYXZqUENHNktMRW0rMXFLOStJYjhXU3VaMERCL2NOaHcw?=
 =?utf-8?B?SFRLVmlvbDIyaEloVUVDcXc5T2ovUEFLTmxLTWtQZFpBNlZYVVhuenBoUGp1?=
 =?utf-8?B?UnVuZVhLRnh4VjJiK3FYZXlnbWFZT00wSE5CTnA1WlEwS01PQ1d1a2lmTlhQ?=
 =?utf-8?B?bXhOeXpVUGhwaDEwOTdTMGhqRUt1THdFazhLYTlwMFhhcGc2Y1BSTGZoM1F3?=
 =?utf-8?B?VDc2cG1sR05UUCtQcHVkbERiNjhuVjhXSFFJUmltWk1pVmg0czVJcmFtRXBE?=
 =?utf-8?B?U1B0L1B2RWxORlE3c1VMZytnQ2xOVUwzelpDa25jalpSaG5uWDMvT3BTVi9L?=
 =?utf-8?B?RXhLWG95eEhvQVZmNEtzeGpZbk1VbDFJUWxRSHZLYk5GWFU2dE9BK2hBSlNJ?=
 =?utf-8?B?NEFwUURsbktGUFFxbTJkV0pJa3NhOWIvc3BPUHBpVnlsa1lhWG4xOFpnbTJV?=
 =?utf-8?B?ZkNWTnFGVFZpK3d0RUNjc2g1SkFTMUI2WFRBSzNPWHhaMGNzeHZmRlZON296?=
 =?utf-8?B?d1RheXZiNnlab2RqNzNxckNVemRoWXNsMi95S2tReHFhRGhPUzQwMGFZazhZ?=
 =?utf-8?B?V3VDS2orMTU4OFU0YjAvN2pXWkdFRDRIczhWeU8vaWtpTFFwNXJPT2RHVjJQ?=
 =?utf-8?B?TzVwYkdnOUdjU1YrVEJzTEc1UVA5eGZFMTY1bUFtcnY5eXlqYlVkQVR4MU5v?=
 =?utf-8?B?Wm82UG43MkJ3L3lUUUJDeWFJMHR4dFVQaExrMUlLeTV6K2VkM2E5OHp6aVNF?=
 =?utf-8?B?WWlyeng4V0hGZ1k5YzNXWnhwVVVpT0kxTHJRQm5RZm9MdkNZVDVUMWZtMS9P?=
 =?utf-8?B?R3hXYitpMVVYSVVJYkRaQ01KZFNRY1JHRVlUdlJ1YTZtMHl0WDBVMjB3eUlo?=
 =?utf-8?B?dTRFbTNlQ0pDNlRmQlV1Mm9JMnBTTHE2TGJFa1JmUTJEY2Z6UmlKSVcvSTA2?=
 =?utf-8?B?NWQrZDNNUkJieUhUT2Q2c3NwSERBNTFZb3ZLTEdzaXRpOW5SNm13cXNWNk5l?=
 =?utf-8?B?SlpVaGtiajI5QzJRdGdUMS9LUkJSMExydXJTNW5KdkRjWkFNK29zUjdCQzJ1?=
 =?utf-8?B?VW5jRzF3N0ZpK2pBVVNIQUdXMnVWaUlSRDhrZmNOck9HdUxVWTU1Z2Vna2xO?=
 =?utf-8?B?WmF6MDFEa1hOdlkrN2FoQWJzbUdGWXVzS0drY0dFZHBmV0lkQ3hhZkpMOHhB?=
 =?utf-8?B?azQ1T3ZqMmo5SzI5YVRDQUxDNG9Wb3B6dVVaSm9xWnNlQVFkVW5TWnNpNEJz?=
 =?utf-8?B?RXVYRWRxVlZhUmVLNVZxSHZ3ZWkvUTVvTzYrc1ZZSmI0WlI3VWNXbVcrWFRV?=
 =?utf-8?B?SHFCRVM0eC9FQjNKWFZzNndjNDZnU3kwcUQ4bThrQzYrR0hrNVovS2M2MEVq?=
 =?utf-8?B?L0NJbGZja0pNaSs2ZUtQeFF6UUpEekZEMU1uNEZoRmRRUDhYVURmMGhRMm1C?=
 =?utf-8?B?TkFqaEZkT2NKbUtwdmdzcmpJWERBclRkVlVBOUhXaXQxSk8xbHd5WGpSRGFC?=
 =?utf-8?B?OWRvZERiUjg0Z2xaandUUzVIOGdjVUNTL1Vzb2sxdENydDdGRmRxNUhTNzN6?=
 =?utf-8?B?UThRWVBKa1RRYnlRdXZ2Ujl2SFVNOVhueHZzcVpGSURIODV5ZDFOR2hYQUtX?=
 =?utf-8?B?K1ZVQ0xGTG1hcjlCU0F6ZFMzaS94ZXdlTGNtQ0JoOC9ISnY0d2NMeG1CaE9r?=
 =?utf-8?B?MWZpOEhmS3ZaWU5WNWVMM2QvRjYyTjdma2k2TTVxR0VPdTQzRkNaaURsV0RS?=
 =?utf-8?B?dHUrNHptaDArNHFuV2hXOEJvdVB1cXJBVlB3UDdjTVVYRkRGSm9oejBqRm4x?=
 =?utf-8?B?ODMvbEtJWUpPNWV5SUEwL1NZVzRpWithN0lzb1JXekdScWJ4enVFQ2V0QTdy?=
 =?utf-8?B?MHh3THhXY3NyWmtPQjNxeUJvQ0YvSDBHRnppQnlsL1A2OVc0S3J6Mmk1b3Ix?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 386d52c4-c5a8-4843-4bbb-08dd9d1f6db9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 13:07:26.7999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/X5WT/e1p/wBA3fxNmqeAHaZyccW5xfVucgUpgmTlDKT3uEjXRU/cHh8JscyUMhh5ukebz5E5mk8sNg5zVGaYbGtt4A+5sykgPhVAlSD6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4717
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

On 23.05.2025 17:04, Jia Yao wrote:

> According to Bspec, bits 0~9 of MI_STORE_DATA_IMM must not exceed 0x3FE.
> The macro MI_SDI_NUM_QW(x) evaluates to 2 * x + 1, which means the
> condition 2 * x + 1 <= 0x3FE must be satisfied. Therefore, the maximum
> valid value for x is 0x1FE, not 0x1FF.
>
> Bspec: 60246
>
> Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM support")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Brian3 Nguyen <brian3.nguyen@intel.com>
> Cc: Alex Zuo <alex.zuo@intel.com>
> Suggested-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 8f8e9fdfb2a8..be8f05574850 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1555,13 +1555,13 @@ static u32 pte_update_cmd_size(u64 size)
>   	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
>   	/*
>   	 * MI_STORE_DATA_IMM command is used to update page table. Each
> -	 * instruction can update maximumly 0x1ff pte entries. To update
> -	 * n (n <= 0x1ff) pte entries, we need:
> +	 * instruction can update maximumly 0x1fe pte entries. To update
> +	 * n (n <= 0x1fe) pte entries, we need:
>   	 * 1 dword for the MI_STORE_DATA_IMM command header (opcode etc)
>   	 * 2 dword for the page table's physical location
>   	 * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
>   	 */
> -	num_dword = (1 + 2) * DIV_U64_ROUND_UP(entries, 0x1ff);
> +	num_dword = (1 + 2) * DIV_U64_ROUND_UP(entries, 0x1fe);
>   	num_dword += entries * 2;
>   
>   	return num_dword;
> @@ -1577,7 +1577,7 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
>   
>   	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>   	while (ptes) {
> -		u32 chunk = min(0x1ffU, ptes);
> +		u32 chunk = min(0x1feU, ptes);
>   
>   		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
>   		bb->cs[bb->len++] = pt_offset;

In xe_migrate.c there is MAX_PTE_PER_SDI with proper value and used in 
similar MI_STORE_DATA_IMM context.

Even the comment for MAX_PTE_PER_SDI is similar to the one above.

I would suggest to use this define here.


Fixes my issue with xe_eudebug basic-vm-access test therefore for now

Tested-by: Maciej Patelczyk <maciej.patelczyk@intel.com>


Thanks,

Maciej

