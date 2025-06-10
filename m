Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AD8C5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 14:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C05210E569;
	Tue, 10 Jun 2025 14:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMcGiBKd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3547510E570
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 14:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749564777; x=1781100777;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SXjb3K4ZXju+qWjJZ+qLOaESKc0hJfBVEiQjJmAHyaM=;
 b=iMcGiBKdg50Z8Yd3fVjzkBr5YVVdjgQj7UOtIKs+SI2Hpp7diFj/zBwu
 Re7vBFaw+BzFfzC1rsLms4xau5ehusqrcxUKxpBxA48GXxd9r4eJ1Eeqz
 IKZo1LgXP3tsiwGe7c3Lju/AOXA43pAh0s53RCAIv8IJkA0v38JemBgCF
 ShhFSK/VcaEeOARNVVIx18aj8mfsb5Yb7/LpnKO84QaZyevMPmTWkHx4j
 //OgUnJ0SzB2rS4FilZ8pGrq3gXh0Kk6FqfChrV0okuYo1iFyOkjA6Jrv
 oQJGosjCZpCAhHvFcKv/j2IVJSsFAcXhBIf1yU8DAv8aYxI7Qb8bTIFaJ Q==;
X-CSE-ConnectionGUID: VdWUz/puRv695LHZw+C7Tw==
X-CSE-MsgGUID: 8UK2NbGfQNa1YVHghntsAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="61952072"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="61952072"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 07:12:56 -0700
X-CSE-ConnectionGUID: L+m80E70RzGGaGrd+9aPMQ==
X-CSE-MsgGUID: 6BD4HnluTP2emQS9N5MnXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="147813205"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 07:12:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 07:12:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 07:12:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 07:12:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0PzDjhIIhqLrgbb8iKoBMtyGNZJ28ULStPZQKfOSSitKbZsQOCCdfJHx2YPrLimsbdmRvfiVQFeSnvEbJ7JCO5lVRGcFE6ulowVigtCelRTd1JIZuRfZbmgcfZJl3qpEq5qdOJUXHGJd1sway3Ki+Pwopu8TUYAam6c7schFmhocb/9+CRG6jjAP8/Id0Gf6zZLVEGI1hEAAMWAPm6IRYF9yvuHfoGWNpMDwz/LiTTwQ5jGlRcGjmbUTfdzvzI2k9u3IVsgtKang52K4Qy7VVUs/JW/6M/pjIrT7ebKyI0I5MBPg2zgGRVw3hwdDQscCZ4A39zhVaqPiF23H9Yzwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9EQF6HpYieotjOlh86O279M17NQudAv82zUVXEPxzA=;
 b=HFWv+m8pW1r6TME8JPzxlDuJ/vXehBy8JrJNwtw55FjNodXtkAfJE1l6vsk+L1fFs7WaxN+FHObTuzju4gfJ97n4qsL7vp4FXS/vWsOnCBYxXFOzNgvOZa9qmBaA7z7dGRFGoE1PGfKuFFfmh1OPoyGo8uesrcnX///k9zWDnwWGYyR1BSMXF51v7OYGw2PoaLNm/F4EHWuuQlF8eqkdEs+6/v9dos+Ej/JC+F3yyh7Bw4JF0ge7fQuNe0ftI+glhXg4ZcPKAJM7d1M3ijFqv4qTk/0gYu73nFzXuxbW+sRXAtxCMIxwb9hYUOqWkrMt7xOSt3CQ/GAQtqZq4Kcm8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by PH8PR11MB6976.namprd11.prod.outlook.com (2603:10b6:510:223::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Tue, 10 Jun
 2025 14:12:50 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%5]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 14:12:49 +0000
Message-ID: <f6fa6332-6cab-49d7-98e8-e60ab3121699@intel.com>
Date: Tue, 10 Jun 2025 17:12:45 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
To: Matt Roper <matthew.d.roper@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <koby.elbaz@intel.com>,
 <konstantin.sinyuk@intel.com>, <yaron.avizrat@intel.com>,
 <moti.haimovski@intel.com>, <didi.freiman@intel.com>,
 <shuicheng.lin@intel.com>
References: <20250609095938.16782-1-ilia.levi@intel.com>
 <aEcByyaKe82P91RT@lstrano-desk.jf.intel.com>
 <20250609215820.GR5080@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20250609215820.GR5080@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0009.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::10) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|PH8PR11MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: c68f3a6a-1476-48c8-0211-08dda828e1c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STUvdE1CekkyZ1dTQUxkTzl4QktoUE80bFdjNThzUGZTdmhRMW9DTVVTaEhY?=
 =?utf-8?B?YUQvRUFYaDhJZC8rTVlOL2VuVE0yVWFJelNXNkQ5REZWbVgyc3UwU2xKU0NS?=
 =?utf-8?B?UGxuSUJER1lwUjVjb2VDTU8rTm5aamFKZ3BrY1ZFV1EyNjRHMldndDhVcllT?=
 =?utf-8?B?VnIvT2ZHMk1SN1g2anJVaEpTa0xJak9ROCtJNDlwTm1ZemRVMmhVb2RDY3My?=
 =?utf-8?B?M3U2YVhFRVd6djN3c0JKbThtcmgrVzB0MGNUZ2o2eGpCaGFjK096aVM4Sk5q?=
 =?utf-8?B?dG1oWHpYSDkySTErb29HaTBwcm9JQlp5Y01CSVdLUjJENWtJMXEvbE94M0VP?=
 =?utf-8?B?dyszaE56Mnl2MUlod1RhRWZKVWxoejc2SkNQMzR4Ym0rc0lOOStvYzVtd0hZ?=
 =?utf-8?B?cG1pMmxYclB4NHhCZmFVVG8zdGZkckxneFRITHAyWXNKTlp1VlA1dVNYRzd5?=
 =?utf-8?B?bGRLQVh4UENTdUphQnpMYjBSSkc3OVNSQWpWeFM1eTJzeURpS3N6UHp3TFY5?=
 =?utf-8?B?QkwyNnZabDJDeFRoTklhYlVJZU9rWnJrQVlXUktMZDBzVldIVWphNERZUERz?=
 =?utf-8?B?Y2ZzOCt2ZmJsenpBdlVXS3VuVXl6cGNaQ3FZcnQ2WlF2Tk5YaHhvMytCYjZE?=
 =?utf-8?B?SWU0T3QydkpqL2dCSGpORHJmVVo0d0s5N2pxNmR3a25MNmIveFczaHV2N2N6?=
 =?utf-8?B?ZXRiNmI5Qk1CNHpqMXpPb0lhT0tXbWwvMk82WFQraVRqM05DNHFCVU8xekRF?=
 =?utf-8?B?Q3VhRllzN3NZTUJBQktMMloxenZKRUQrV3o3bU9qd1VCR0VFTDllbFVoY0E0?=
 =?utf-8?B?MTEvWEl2Q0tkRG1HRE8rQXhVNmxlbFI5ckgvNloySlR3cmIxY2x4Q250bHNx?=
 =?utf-8?B?Q01wcGNOWGtpbkxOQnhDWjVCMzlTdkx6aXdrblhGcjRxbUExbTFQM1hjQWRt?=
 =?utf-8?B?WkRsK05xcW1iWEFRSnhSNzFvdEdmQ2FZM1Nld2k5aTdTdExlRVFrY2RHN2Uv?=
 =?utf-8?B?eERjU3dnU01ONWN4MGVFRW5XZ0JhT1hXR0JwNy9VUlJ3V3YyU2UwTW00a2wz?=
 =?utf-8?B?b0JOOFRpcE5DMW44Ri90b0xNOFpKOUxrK2xkdHNXeEtaWjloQ3c4NEg5NVB4?=
 =?utf-8?B?U2JwZHNZWGo2ZFQxMHFBSzBNZWpiNllwd2c2ZXdNUDc3RWJiRmhsSmFWVWRh?=
 =?utf-8?B?QVZoR3RlRHJselhQeFlhRTBEYkwyRmhudDZJWUFqTVRzMGhkUFBiRXMzSmJ1?=
 =?utf-8?B?WGNuMEFtQ1Q1RmQ5RHVkZVZFczJTeUwyaDZLRE1CbXF1YndXb0RYUjlqQmFH?=
 =?utf-8?B?cFFhbE4yVU1GWnR2Wmt2cjhKQ09aTjZ2YjRLaEVEQ3o3cy9nSFVrWGNpT0NI?=
 =?utf-8?B?bkk2Ym1sL3ZRR2p0cmxVOXUyZFZKTUN5aFdFeE4xL3pWTXpGeHV5dXd6N3NW?=
 =?utf-8?B?OWVid0ZmSmFnWWRHa05nVm5LNnhsSHF2ZUZBOU5JWkEzRmNPSWdtMzhlTytJ?=
 =?utf-8?B?a3gzSmVRY3F0WmNJZVVQdjlrOHVSdFBJOU5SOXpBbHZmWUxxOFZIdGZTa1Ex?=
 =?utf-8?B?RExGbE4zZVdHU1hMTGV0NTZsQmJsa0lCODFyU1FmQ2ZZZzk3YlVvZ0tmdUlJ?=
 =?utf-8?B?WFBlTUVZRmJTUE9ZY2pvVkpxNWg3ZXFNSDN4bURzdy9hTGN3cG1LZEJHZVZP?=
 =?utf-8?B?U2dQdlBhbnpld0JESENFN2xVc29DS1FSVjg4ekhmd0laSHcyd2xmTkg3ckho?=
 =?utf-8?B?MllEVlZON1BHcC9NbmtmRU01OVEvdS9La3hzRTVTQW1YdlZhZ0VnRHVMWlFK?=
 =?utf-8?B?cm5sMlJ6U3NIZThVYlZrRThJUTRhem1obUFVMHZkaG83UlE5cHhPSFVRTUpV?=
 =?utf-8?B?VENCajZtdHVVQkMvWHlJemp6cXIyUUcxWVRsNjFVdjY0UzFjcXoxTTFHVDM0?=
 =?utf-8?Q?IwdJ9/QbyTQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFJLUHhVMWk2OGdXdW1adGw3NVFtblVIdlh4T0hMVHJDYmFWQlcvM1RLdVNa?=
 =?utf-8?B?dE03V2dYTDI3V3ovSlhJci9QTnVqTnFoNnphT2RIRHBZUk9OUnRZWHpBZ1lB?=
 =?utf-8?B?UTdEWklDTk03MFBoRlMrUk1hYlhFa054bzVXTTFyQzlRR0tXVnNsVUo5SmhN?=
 =?utf-8?B?bU5KU2FGbVE2QVdZOSs1bmJ5R0w0VUhBTkpHb3lnR3duZ3pwckMyai9DbWNY?=
 =?utf-8?B?VCtJZEdHd0NwbU92V0drWmpTZUVXNWgyTE5Jbm0xSzkyUFRHak1DU1QrNUM1?=
 =?utf-8?B?dER1NG54VFIrQnkxSkNyWWtHYWpVZHc4eURveVNlVDJaa1dMMVBRYkZuZk9k?=
 =?utf-8?B?YVlSZWFvM1BrM2NkYlNhQ3l1OW1rSlQyR2VCNmtZRGJLL3VTUWllNXRPQWk4?=
 =?utf-8?B?N3RBbmdhcGJtam80M2xQWHR0bVBVVVhXWWIxWkNNaVBGbDBxNDlXZCtRK2lV?=
 =?utf-8?B?WHhPTFZ6anVjMWhhMVFhQWZVbi9hRVBBRWtFMHJHU1kyaFVmOERVa3hzZWhx?=
 =?utf-8?B?bEZPZ05FYXhwMGxWcGdNTjlpa3k3YnRDZnV0UFlDblI0VXh2MlNnSC9qRUpQ?=
 =?utf-8?B?RUVocWFWR2hQQTBmQ3JIazVVZlhiNkk2YXR6ZXFvVDFReGt2OS9zdjk1WEp2?=
 =?utf-8?B?N2RlblhGMWpBU1cwaU9SMXVLL2g0NDYwSUxQSzRYc2RpLzkrbk5qUStsT2Ri?=
 =?utf-8?B?U1RKS2ZKczhud1JKSStWTTJkWFUwK2hvMEtkUjQ5eFJ3bnBYUDc0dFgvYXp2?=
 =?utf-8?B?dVBaeWx2bEZ3Zk5saXpXRjQ5QnBpdUo3YWJsWFhnMThFZFVZMjlzTDBIT25r?=
 =?utf-8?B?VWFVaVNGcnU5WURJdnJ5S09ZSW1EdkJpQUJkZFdiZEh2N24vZlpNYmpndmxl?=
 =?utf-8?B?TW9sRFFBWm1veG11MzEveW5jbWNxZ2Qvdlc5bmVQUG9sYWt2dkpEdUpoekhN?=
 =?utf-8?B?SnNKajdsd0l6RlN1SkhLM1p5TmlUWFRWaGhoRHpuU1F0cU5na21Sa0JTd3RJ?=
 =?utf-8?B?c3VYSS9JcnkyQlFRSzlRWEM1ajhzSHNMU2dFV0oyL2p1dkR4eS9iRzVDY0Ja?=
 =?utf-8?B?OTZ0RW1wRkZDMXV1eDZTWjMzVk55R1MyNllyQ0dwcmE5RjIrYVI4L1dVdmNz?=
 =?utf-8?B?MStMUTJrVmIxOWpoZmV3cXJyckt2bE1ETnNYVjI0Q3hGSi82MStxOUFNaUJF?=
 =?utf-8?B?dVBRb2lXSzBTK05sVTR5QmhhWDZIZnIrRlpyelp1UlZJTWp2M3B6WGgwYzNw?=
 =?utf-8?B?MzZKc0ZUNFJaWDZsbFdGSjBvMFZDUDZ1R3hkQTcyYmR2eWhOL1UzMFlUV2dE?=
 =?utf-8?B?K01JTlErSmdFdmoxOUhTSDIyNzVFYjErUXd4d0h6L0ppbTN6NmIyTWZ1SnRC?=
 =?utf-8?B?S3NSblZxbVNTbE5KYnZYRHQvRlJpdk50cmUxRXFFd1dEeWdtMFdPajN1bDhS?=
 =?utf-8?B?TlEvN1FnMThaN0hFcnVLbE9VRGNZa0VhUkgzaWw2QUtYaG15bDlKaHNSbFRB?=
 =?utf-8?B?UXpsQmQwK253UkwyQW9TSmFyQU9UZkE5Znl1azdhZTNkOW9OOTRRejJwZVdy?=
 =?utf-8?B?RUxnZG56RlZpQjJKOS9OWnB5OWdaZkExUnBxZklZN2J0NkY4NFhSc1RDOGtD?=
 =?utf-8?B?MWNVYmU0M3d1YUU1bHpndGhFVzhHMitRNWc1MSt0WGx2UXY0aFlJdW01bmhs?=
 =?utf-8?B?Zk0zKzBDRTQ4ZFd6WDBpdWIrVTZWK04vQzBxZ1VUSkNYSVhRc2xVTUIrMjBT?=
 =?utf-8?B?K0dISHNOTXQwMDdzREdrSUxmVFV4eW1wL3R0c2xZaSs5Skl6c09TdHJiYm01?=
 =?utf-8?B?blVVbUJ5Z3MrRUJ3dEZtVDZmcGZkYzB4UkpkTjQ4QXRFN3R3Wk1wNEZoUlly?=
 =?utf-8?B?bmNiWkQ5SjNnVHRjRnpwemF0OVF0Y0JHS05zM0pNYmJpU3c0Y1hWVDFETjZG?=
 =?utf-8?B?cFlwb3hSMXJiczlGbTA1VzV6REI2d0pBTnhoR0hmWVZ2TFRrQStXbGg0ejYz?=
 =?utf-8?B?ZVR1RTBKTlNDSi9OQ1dXTEVXN3VzVDByQk5NR2NQNmxFT3JZekNrVmZ6aDZY?=
 =?utf-8?B?UjhGU2pTcjh1d29NTGV5Q2FpQXkrd0txZzlKQmVydHJscjRSOHNpZjIrNmlY?=
 =?utf-8?Q?w8sBhYDCqvwz3ZKhUZO0Xwwf/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c68f3a6a-1476-48c8-0211-08dda828e1c2
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 14:12:49.8896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwEYRoPrr9mCMiScTNp0RLDtn3tP7jem8B6+JZ4hyfkOvQLjV0j0vyrQlM/Bmz2NUVxzudrVIIAsFUdsaCr48A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6976
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

On 10/06/2025 0:58, Matt Roper wrote:
> On Mon, Jun 09, 2025 at 08:46:19AM -0700, Matthew Brost wrote:
>> On Mon, Jun 09, 2025 at 12:59:38PM +0300, Ilia Levi wrote:
>>> Allow the driver to expose hardware register spaces to userspace
>>> through GEM objects with fake mmap offsets. This can be useful
>>> for userspace-firmware communication, debugging, etc.
>>>
>>> v2: Minor doc fix (CI)
>>>
>>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_device_types.h |  14 +++
>>>  drivers/gpu/drm/xe/xe_mmio.c         | 142 +++++++++++++++++++++++++++
>>>  drivers/gpu/drm/xe/xe_mmio.h         |   4 +
>>>  3 files changed, 160 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>> index ac27389ccb8b..78542de0d48d 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -10,6 +10,7 @@
>>>  
>>>  #include <drm/drm_device.h>
>>>  #include <drm/drm_file.h>
>>> +#include <drm/drm_gem.h>
>>>  #include <drm/drm_pagemap.h>
>>>  #include <drm/ttm/ttm_device.h>
>>>  
>>> @@ -161,6 +162,19 @@ struct xe_mmio {
>>>  	u32 adj_offset;
>>>  };
>>>  
>>> +/**
>>> + * struct xe_mmio_gem - GEM wrapper for xe_mmio
>>> + *
>>> + * A GEM object for exposing xe_mmio instance to userspace via mmap.
>>> + */
>>> +struct xe_mmio_gem {
>>> +	/** @base: GEM object base */
>>> +	struct drm_gem_object base;
>>> +
>>> +	/** @mmio: The MMIO region to expose */
>>> +	struct xe_mmio mmio;
>> Any reason not this is not a pointer to xe_mmio?
>>
>>> +};
>>> +
>>>  /**
>>>   * struct xe_tile - hardware tile structure
>>>   *
>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>>> index 7357458bc0d2..6bfa915a9602 100644
>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>> @@ -408,3 +408,145 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
>>>  {
>>>  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
>>>  }
>>> +
>>> +/**
>>> + * DOC: Exposing MMIO regions to userspace
>>> + *
>>> + * In certain cases, the driver may allow userspace to mmap a portion of the hardware registers.
>>> + *
>>> + * This can be done as follows:
>>> + * 1. Define an xe_mmio instance that represents this portion.
>>> + * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able fake offset.
>>> + * 3. Use drm_vma_node_offset_addr() on the created GEM object to retrieve the fake offset.
>>> + * 4. Provide the fake offset to userspace.
>>> + * 5. Userspace can call mmap with the fake offset. The length provided to mmap
>>> + *    must match the size of the xe_mmio instance.
>>> + * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to release the GEM object.
>>> + *
>>> + * Limitations: The exposed xe_mmio must be page-aligned with regards to its BAR offset and size.
>>> + *
>>> + * WARNING: Exposing MMIO regions to userspace can have security and stability implications.
>>> + * Make sure not to expose any sensitive registers.
>> This is no secondary issue, it is a primary one. There is no way we can
>> expose entire PCIe MMIO register space to a non-root user (a root user
>> itself can just mmap the PCIe MMIO bar bypassing the XeKMD if it wants
>> btw).
>>
>> What is the requirement for this patch? I know on other PCIe devices
>> I've worked on we had similar issues where we needed to expose a subset
>> of the PCIe MMIO register space to user space for kernel bypass
>> submission - everything we needed to expose in that case was 4k aligned
>> + tied to a single process via a KMD config before mapping to user
>> space. I suspect to do anything safely here, somethine similar needs to
>> be done.
> I don't think it was the original intent of Ilia's patch, but I can
> think of at least one feature expected on an upcoming platform where
> there is a page or two of registers that the hardware team designed
> under the assumption that they'd get mapped directly to userspace in a
> read-only manner (i.e., information read-out only, no control of the
> hardware).  I think some of the internal discussion was considering just
> going our own direction and exposing the contents of that register block
> via an xe_query instead since the contents likely wouldn't be changing
> after boot, but if this infrastructure exists it might be a simpler and
> more natural match for the hardware design.  +Cc Shuicheng since he
> might find this interesting.
>
> But if we're allowing this to map registers to userspace in a read/write
> manner (or map any special registers that have side effects on read)
> then we probably need a bit more scrutiny of the specific use cases to
> determine what kind of permissions are required, whether they're safe to
> access in concurrent / racing manners, etc.
>
> And of course since this is new uapi, the regular graphics upstreaming
> rules apply and we'll need an opensource userspace consumer fully
> developed and reviewed before we can merge the kernel changes.
>
>
> Matt


So one use-case is direct submission in upcoming platforms. This would require write
access. One thing (pointed out by Tejas) is that I probably should enforce that the user
passed MAP_SHARED. Do you see any other gaps here?

Why is this considered uAPI though? This is an infrastructure done as a preparation to expose
certain MMIO regions in upcoming platforms. It will be uAPI only when someone will use it
within the driver and returns the generated offset to userspace.

- Ilia


>
>> Matt
>>
>>> + */
>>> +
>>> +static void xe_mmio_gem_free(struct drm_gem_object *);
>>> +static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
>>> +
>>> +static const struct vm_operations_struct vm_ops = {
>>> +	.open = drm_gem_vm_open,
>>> +	.close = drm_gem_vm_close,
>>> +};
>>> +
>>> +static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
>>> +	.free = xe_mmio_gem_free,
>>> +	.mmap = xe_mmio_gem_mmap,
>>> +	.vm_ops = &vm_ops,
>>> +};
>>> +
>>> +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object *obj)
>>> +{
>>> +	return container_of(obj, struct xe_mmio_gem, base);
>>> +}
>>> +
>>> +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio)
>>> +{
>>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>>> +
>>> +	/*
>>> +	 * All MMIO instances are currently on PCI BAR 0, so we can do the trick below.
>>> +	 * In the future we may want to store the physical address in struct xe_mmio.
>>> +	 */
>>> +	return pci_resource_start(to_pci_dev(xe->drm.dev), GTTMMADR_BAR) +
>>> +		(uintptr_t)(mmio->regs - xe->mmio.regs);
>>> +}
>>> +
>>> +/**
>>> + * xe_mmio_gem_create - Expose an MMIO region to userspace
>>> + * @mmio: xe_mmio instance
>>> + * @file: DRM file descriptor
>>> + *
>>> + * This function creates a GEM object with an mmap-able fake offset that wraps
>>> + * the provided xe_mmio instance.
>>> + *
>>> + * See: "Exposing MMIO regions to userspace"
>>> + */
>>> +struct xe_mmio_gem *
>>> +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file)
>>> +{
>>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>>> +	size_t size = mmio->regs_size;
>>> +	struct xe_mmio_gem *obj;
>>> +	struct drm_gem_object *base;
>>> +	int err;
>>> +
>>> +	if ((xe_mmio_phys_addr(mmio) % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
>>> +		return ERR_PTR(-EINVAL);
>>> +
>>> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>>> +	if (!obj)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	base = &obj->base;
>>> +	base->funcs = &xe_mmio_gem_funcs;
>>> +	obj->mmio = *mmio;
>>> +
>>> +	drm_gem_private_object_init(&xe->drm, base, size);
>>> +
>>> +	err = drm_gem_create_mmap_offset(base);
>>> +	if (err)
>>> +		goto free_gem;
>>> +
>>> +	err = drm_vma_node_allow(&base->vma_node, file);
>>> +	if (err)
>>> +		goto free_gem;
>>> +
>>> +	return obj;
>>> +
>>> +free_gem:
>>> +	xe_mmio_gem_free(base);
>>> +	return ERR_PTR(err);
>>> +}
>>> +
>>> +static void xe_mmio_gem_free(struct drm_gem_object *base)
>>> +{
>>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>>> +
>>> +	drm_gem_object_release(base);
>>> +	kfree(obj);
>>> +}
>>> +
>>> +/**
>>> + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
>>> + * @gem: the GEM object to destroy
>>> + *
>>> + * This function releases resources associated with the GEM object created by
>>> + * xe_mmio_gem_create().
>>> + *
>>> + * See: "Exposing MMIO regions to userspace"
>>> + */
>>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
>>> +{
>>> +	xe_mmio_gem_free(&gem->base);
>>> +}
>>> +
>>> +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
>>> +{
>>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>>> +	struct xe_mmio *mmio = &obj->mmio;
>>> +
>>> +	if (vma->vm_end - vma->vm_start != base->size)
>>> +		return -EINVAL;
>>> +
>>> +	/*
>>> +	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
>>> +	 * whole buffer from the start.
>>> +	 */
>>> +	vma->vm_pgoff = 0;
>>> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>>> +
>>> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
>>> +		     VM_DONTCOPY | VM_NORESERVE);
>>> +
>>> +	return remap_pfn_range(vma, vma->vm_start, xe_mmio_phys_addr(mmio) >> PAGE_SHIFT,
>>> +			       base->size, vma->vm_page_prot);
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>>> index c151ba569003..2990bbcef24d 100644
>>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>>> @@ -8,6 +8,7 @@
>>>  
>>>  #include "xe_gt_types.h"
>>>  
>>> +struct drm_file;
>>>  struct xe_device;
>>>  struct xe_reg;
>>>  
>>> @@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
>>>  	return &xe->tiles[0].mmio;
>>>  }
>>>  
>>> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file);
>>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
>>> +
>>>  #endif
>>> -- 
>>> 2.43.0
>>>

