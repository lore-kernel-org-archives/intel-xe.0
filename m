Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47CBE6ADCB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 23:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B58C10E31F;
	Fri, 22 Nov 2024 23:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gERmWxTq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E4B10E31F
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Nov 2024 23:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732318174; x=1763854174;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yn4Shux+lbBk+C7E2r2nJZbJAaHejJKH1junLsZHKBI=;
 b=gERmWxTqy4mXwVvdPKlbid6XnbcXwtx+sQy7OJoiDtofRr+LEeSWNebz
 HzG/Ays8STJVc/OAVMQV4onOe/G1dd74SJLza1weKL7YaN+bzc9TSCk82
 7NjLZK+glxHrjtL/9Pt/7zViFvyzUdFiNwvrJPQN+hZedZb0nSpfqwtrP
 efXPMeUwJoNd4tTtrYK9W8GDp9q5rV3VqKMsCK/vN+HyIiQskpjvuxCef
 7M1YEkTlD0MQumnGft5KqYxRYOBGxO7lS72di9kpcbjqJZ+34X0C0127L
 qms7+nn6Cl5752f2n//YlgyiktXyDEhZccIsDrxkS62fDijOD3Er+TBJS A==;
X-CSE-ConnectionGUID: Ke+6QeiaSdSmv6H0u67pVA==
X-CSE-MsgGUID: pfX9I4EaRVSfwwcI+Tvr2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43134278"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; d="scan'208";a="43134278"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 15:29:33 -0800
X-CSE-ConnectionGUID: 8G0qkjYsQ5OVW91unbtyjw==
X-CSE-MsgGUID: 5FuESllPS7mTA1Hat9yh6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; d="scan'208";a="95646357"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 15:29:33 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 15:29:32 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 15:29:32 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 15:29:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=przHPJikC/LRKi1Ah9oRYtJx/qFlAHyGJbGxL/UydWPx9KZU+zkIrtUftsam2GbT2Igi44n44/R8+rDUEhWF6DSPfp0wo+f56imV2jFo9v4tjpE1kI3P/iORmXOjphJN4yl1HW9YnhF7Qmzz9PIsjAcLieC82uwAwBP+llmKpp/aNZhtabo3BqP4cy0Z87L2L5Rla3NjvUvVSnvbqvK0ZO+56qfRLda5G2dDFjwNscvTdBokM373R6vZ5YN6oa69RBQRVAiZ3/oSeu2F76nG7rkE6R2h71608MEhYtNlR5vhBfWvedTSS2PrZrKfb5jf/X7w3EYFinCfOgFAhqwiWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5G2HjESwBhej0hF24Y9Xgd35JpoHRqba+nuTiNGJ5qc=;
 b=hAM5Lp4+7zKCWNtuPI4PYspXhrhQaW6CGObHef6cf4QkpzcTyZZwzNRjIEC1I5F2vzewbKh2I9TYOuUYxn1DmEfc+Z2UGu02ECCVH9SIvtYdDq+mLnhpQJC23n9iRQyu6O1JdKV7iB7ylc3tJiQipU5Fih8pDARK9J66m7IpYmH/eN9xoHHhyMB47gv3jqGWYgpdJ2HhkWlU3VvX5fa7vhoL5kk3sZ2VLfwPJ4p/BHjpweNn2U+dfw7bOifdcF+IA1zj/W0U12KWPUpLBBN15mWrBykeuWWg0Qlwi6So8g3OWr+bY1VyvP7R3xAcNDj1PwprwqCvMh6e08l9zuPuYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH8PR11MB7048.namprd11.prod.outlook.com (2603:10b6:510:214::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Fri, 22 Nov
 2024 23:29:24 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 23:29:24 +0000
Message-ID: <7361a112-3553-4d49-8951-2eb2ef2be23d@intel.com>
Date: Fri, 22 Nov 2024 15:29:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/guc: Add support for G2G communications
To: <intel-xe@lists.freedesktop.org>, John Harrison <john.c.harrison@intel.com>
References: <20241120000222.204095-1-John.C.Harrison@Intel.com>
 <20241120000222.204095-3-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20241120000222.204095-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0042.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::17) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH8PR11MB7048:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d47f2fa-eed1-4c76-7d9b-08dd0b4d7ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkVsVWgxZmRubkdpTWVHWUZYR1pzNlZqNUQ3TGtSd2pXWjZpTVJqUWgwZWNK?=
 =?utf-8?B?bmplcnlZVnRGWC9mY1dqR09RMkx1ZDlpeE1xcmJyeGVRaEQ2aThsNWtVNUdt?=
 =?utf-8?B?OVBhcHF5aFlidVIxZC9XSTcxUjViN1pabFg0Y0ZLQ3VVWmI2L0hHWTdNS01D?=
 =?utf-8?B?cS9DTHZLaDFiSnBwMmFwcUZuLy9KT1NGRkpLbCtlVVJYSUd4QUZiTmI1ZHFp?=
 =?utf-8?B?VTZsTjJoMVFrd3gwM0ZUSWk0eW1xOGRXeWZTam4vWVVqM1dIMVByTFZPOERp?=
 =?utf-8?B?ek4zRytDalJyZjhSOW11NWI1cnd6T1NIUHl6T2cxbVhuVE9LZTNYT01zSHZV?=
 =?utf-8?B?a1ZCTGoweDl5eGVIR0pXY2plU3NNZnE5SUViWU51Zkc2SWdKeTg1T00xWVo4?=
 =?utf-8?B?dVVlUkRSQ0xhY01tRUV1aXMwOEJlQ1pCVElrbXNuQzEwdTZZb0ovUnVNQ2k2?=
 =?utf-8?B?SWtxR0d1NzdtOEMvZEwxYU0yT0dudFZheWhOc1diek1uOUZCVURWb1NUcmlD?=
 =?utf-8?B?Q1JTWjhRYS85elNYQU9ZRi9GUFRmVlR2VnhiMUEyR3VEWFUrM0hjdTdnejJy?=
 =?utf-8?B?MEdQUHJ2SmZrdmxodjBxd0xDMnRWMy8xYWNLZTdpd01GUFdpUzZkV3o1dURY?=
 =?utf-8?B?UE1GZUR5dmx4VjdCRDh4S2xkT3VZWlp5NDI5d0ZTUkc3djNaTnVEOUpKSHdD?=
 =?utf-8?B?QXc2T2JQaStFNnpHTHptSGtBTGsvRXhscVgzMVZWVG5iSG1wTStaVzUycGpx?=
 =?utf-8?B?c296MkQvcU1qUVlnMnFjK0NOWGY1VEM4UWUzcnpWOTkrWFNoSDFjVWoyYldQ?=
 =?utf-8?B?c1hnSTA4SDR5M1p5SkxRakVEY0ZNaDY1MWpPQkdITGRzRU5VcDRqdWxkVVpI?=
 =?utf-8?B?azE3Wko5bGMyeUVFRUYrVDFvZHd1ZlBXd05NcUZtejAvUmRsTllveWNSb3I4?=
 =?utf-8?B?ZzBhUGpFNVZnRURSaERMY0hmK2VCNUJIRlVIZmhiL3l3K0lXTks2dWZDUkZQ?=
 =?utf-8?B?Z2NpYzZuODdxMXFmTEZ5eTZLU09qeWFCZ0l1R3owUEQrV201MG1DZG1CSk10?=
 =?utf-8?B?YTQ4RktPRGd5YlpiWklmYmpVbndybVdCRTl6ZzNrVUxFbm8zRzZPRGpmZFY3?=
 =?utf-8?B?V2RseEhobDdxRjBzNzhsVHRwYjJCOSttZnNlS0V6U2h1YnFRdzVXS1dHVkNi?=
 =?utf-8?B?UTdrRTNXM0JmOFhUeDZBY0dSTkxQcjNnNHRpMVpLR2dPT0htWW8rUHZGaWQz?=
 =?utf-8?B?ZzlwelZUL0xPUS93Z2EvaTgzSHhhUHpCU0VvSTFFMDVLN2RvVHFkc3FvMVZI?=
 =?utf-8?B?dW8zMmJIQnpsZUJtYnA2ajhRSyt3S3dENklaS29RNTRRbUpYQmFsTzNIeURZ?=
 =?utf-8?B?aGFiUjQxbnMvQlhNUG5Fc1ZrVHB1SGZma1k4d2lxUlgvSHFicE54ekh6dkR6?=
 =?utf-8?B?dzEraEpHQ1g2Q3ZDYS9qYzBpSGJvMEcrSTN2ckpZM3kzaDdMRFZIRldGZkkw?=
 =?utf-8?B?UkllME9lZFJ5SUFoSkVhZzhRMVZGWXhpaEJlYlJoazVqRnp0TWhzRjd3NTdX?=
 =?utf-8?B?d2RWK1p0Z0gyQVZpYWZHUXV0WTk0UW5pcUVybWI2SStMa2lHbjhMRlNxcGww?=
 =?utf-8?B?bGVjRGcxWnBuWkI1Sjl3MUlvQ045SkRFM2ZhOWU1ZWNIT1pqY3p2ai9pWmNh?=
 =?utf-8?B?MXFXWFhNT1JvbFlrSzhZajQzQnRLU1kxb05JL1hCblNKcjhxTjl6ajFZZGxY?=
 =?utf-8?Q?LF5FF8yDpa1U/8hzxaHK3tXvfnU+8Pq4tAYS24O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmdYNytEUTFNSWQ3WDdXRHFMQXJzZ3VSeGlScWVQTVBQSWJXZzVLM1NxdFVj?=
 =?utf-8?B?S3pBaUJJRUd2Vml1c0ZhWnlWRk1RRGdLUFN5NzlFQkdMWEJtcFErYW84TjNT?=
 =?utf-8?B?L3hONkJYbXNiT3RoVzU3eFcycWcwNUdZL0Y0NFBxeVdUUFg3N2hCMEpzSTFi?=
 =?utf-8?B?MCtSbzVDcEttd0ZWMmdrYUh6Wk4zWTFWRkwrcTN4NkhnQlpnL2xIZkFlQ3Zt?=
 =?utf-8?B?M1lyUE92ZStPQ1JMbDdVcCtuc0lPcWhhdGtVang4eEZmN3VnbEt3SXNJOGF5?=
 =?utf-8?B?QTFna2ZwZmdCODF6N2JhRlhwM2c4d2txVTUweU8yeHIwNTFEMGNGbXp0M3Uz?=
 =?utf-8?B?aEV3S0w1emR1MTJnTzZzUXg2VlJOL2Y4My9mM3hiUTBJTjhiTDRTZmd2Qk9M?=
 =?utf-8?B?R3ViL0h1NHV3OVBOdzdBQ1MwdW1iQlYra2Q5NHdlZmU0SFdNUG9WNkV4SnRw?=
 =?utf-8?B?aFZvQW9WYkU1d0o2Y1hiWTVSN0Q1VWVrWDlBd3RGaVJpUDhMdDlLS09KZklJ?=
 =?utf-8?B?R2JSU1ZlM2N2Qmd2Ni9WMmQ5RUM5REFFNm1pZ0owbXpFN0tjOTEreXIvbkNJ?=
 =?utf-8?B?SUN0b0lNbjNLSzl1MFNzeTgyRExteWFTeVdZT0NJS282VmxCRGVXUUFTRzhD?=
 =?utf-8?B?dGpLS04zeEFXQ2IvQjhSWDcxSGMzemJTWmhXNnJGbXNnWnNEaFcvTDFxUzZJ?=
 =?utf-8?B?Z21XUjBuc2NNNTloek1qRlB5UXRmZldOVnB1bU9CdHF3UnhVNWNOSVFzTUVx?=
 =?utf-8?B?ano2L2RwbjYwUjE4Mmw5UEhMeUNuanU2WERud2Y4QWgreEE5dVdrVUlwUDVr?=
 =?utf-8?B?ZlAzZytsZ1AxTXcxRHhGN0RFOFlIYTkxQUl5bTJKN0lEUGhvODdPZFFESUtr?=
 =?utf-8?B?ODdXQ29lZ2l5S2hxNGRpanowZmh1T1p3U2RSOXNtNmxJU2RnVTNuTkF0aGRt?=
 =?utf-8?B?M0p2SDV5eG1pSVJXeEdwcFFiNWRJcUFhamtrcjNQeXlMcjF0THNKR3BJcTg2?=
 =?utf-8?B?RUhLMk5aOXdQbmwrenJYWjU4UFEyekpFbi84YWRNY3c2REZCcXRmVHIzOC9E?=
 =?utf-8?B?WGw0UlZXS1Y5SWE0TWtSaW5Wa0lKajRINXk0cmgybXVEVUJ1OHgxY2NFUGFa?=
 =?utf-8?B?d1VNRkpESEdTUElCTWZ4K29JdXBsNEI5aDVDZHdBd09LRjhPYzdrcjJIZDVN?=
 =?utf-8?B?dGlaTEUzcFh2dTlRdnY4Z1hhV0s3dUJQUWxXVXQ5NUxqdkZVd3UwVDMxMlNq?=
 =?utf-8?B?KzliMGZFNW84REhjTlFqV3BYQWV0c05pRVhyOEdwNC84T3JjT0dEYUNaMlA4?=
 =?utf-8?B?RDBZT01PTXhYTUl6SllkVURIc2tCWmd2OVRlY1JmYllraDFoUXZRODQrYkt3?=
 =?utf-8?B?ZElqRjc2d0xsaUtZWWllMFdrcWQzOGp5SmJNdExvYkYwaGRDRzhMUkpFaHRM?=
 =?utf-8?B?NXFhek9iSm1CaVNGWXFKYVBocHdtTUlXbWs3VEc3MDdWcTNGZjRZRVJrYW5Q?=
 =?utf-8?B?a0w5djlJSUpOZ0pMa1RMSmhTSkxPZkFVTExMdUNPdmc5SmNLczltMHJVRzl6?=
 =?utf-8?B?NG9GamhYeWpvak5laTI2N25VWjFQZlVRTnNyVGsxdFZ2akw1eTNUVGdRZ2tr?=
 =?utf-8?B?akN0UWZqN1BIWi9MQzFkUlpnNktJU0FnTmZkdDA3ZFRFaEJKaHREMzMxTXcy?=
 =?utf-8?B?c2xpaHNwbEQ1NCs0L0ZMeGo5UWpFZVIvcXYrZUFEcGhpZ1hOMzg2WHBraHRB?=
 =?utf-8?B?cDJGU01YS0t5MkptSjBHVjVPK09yWDZGazJ5OUJiRVl0YWV3U0RqNE1GcE12?=
 =?utf-8?B?QWFLcjRPZ2tNcTVEZ0hkUjVIdW5HcVRtV0tHbW5Rc3lBMXVYYnhRejRqNVdl?=
 =?utf-8?B?ZWczZjUrVk8rZVRUaEh2a09lK2tXbFdCVHFsTzE5bHpQeS9JdUxYZHlnYis3?=
 =?utf-8?B?N21sU1lNSW1lKzVlQWV6MGZjNVVYVDBVWDBURDExVUV1R1pBZ0QraDVMMGVv?=
 =?utf-8?B?MC8vckdmVjgzdDY0RERtY3FaU3hDNnVNV29BODZhdHlWa0JMc3BnYnYyZ2h2?=
 =?utf-8?B?Nlo1bVc2ZDlkQmdqdzM5d2x0MzVSZzhjZHVLOEpVZi9aT0RSMU5FcEhaS3Jo?=
 =?utf-8?B?OEoyWjdPbjFzekQ5NVJyU2NsVUtTdzJheFdSVFlIbk9VWUVIRXR3WXBta3ND?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d47f2fa-eed1-4c76-7d9b-08dd0b4d7ff1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 23:29:24.5276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R516E/SX/QDGPpTRqoH+es6Pi3uyoZ0c/oc4ZCrcZHQntce9IVk50Mn5Qzq7lOWadqEQTUQoh/qVuqhYvrZXWTGsRugeKl8Q9qBjMAxlaew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7048
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




On 11/19/2024 4:02 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Some features require inter-GuC communication channels on multi-tile
> devices. So allocate and enable such.
>
> v2: Correct use of xe_bo_get/put (review feedback from Matthew Brost)
> Add extra assert, re-order a calculation for better clarity and add
> comments to slot calculation (review feedback from Daniele). Also
> slightly re-work the slot calc to avoid code duplication.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  20 ++
>   drivers/gpu/drm/xe/xe_guc.c              | 307 ++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_guc_types.h        |  10 +
>   3 files changed, 336 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index b54fe40fc5a9..fee385532fb0 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -134,6 +134,8 @@ enum xe_guc_action {
>   	XE_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
>   	XE_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
>   	XE_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
> +	XE_GUC_ACTION_REGISTER_G2G = 0x4507,
> +	XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
>   	XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>   	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>   	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
> @@ -218,4 +220,22 @@ enum xe_guc_tlb_inval_mode {
>   	XE_GUC_TLB_INVAL_MODE_LITE = 0x1,
>   };
>   
> +/*
> + * GuC to GuC communication (de-)registration fields:
> + */
> +enum xe_guc_g2g_type {
> +	XE_G2G_TYPE_IN = 0x0,
> +	XE_G2G_TYPE_OUT,
> +	XE_G2G_TYPE_LIMIT,
> +};
> +
> +#define XE_G2G_REGISTER_DEVICE	REG_GENMASK(16, 16)
> +#define XE_G2G_REGISTER_TILE	REG_GENMASK(15, 12)
> +#define XE_G2G_REGISTER_TYPE	REG_GENMASK(11, 8)
> +#define XE_G2G_REGISTER_SIZE	REG_GENMASK(7, 0)
> +
> +#define XE_G2G_DEREGISTER_DEVICE	REG_GENMASK(16, 16)
> +#define XE_G2G_DEREGISTER_TILE	REG_GENMASK(15, 12)
> +#define XE_G2G_DEREGISTER_TYPE	REG_GENMASK(11, 8)
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 0a61c948f631..b52fe528597d 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -44,7 +44,15 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>   			    struct xe_bo *bo)
>   {
>   	struct xe_device *xe = guc_to_xe(guc);
> -	u32 addr = xe_bo_ggtt_addr(bo);
> +	u32 addr;
> +
> +	/*
> +	 * For most BOs, the address on the allocating tile is fine. However for
> +	 * some, e.g. G2G CTB, the address on a specific tile is required as it
> +	 * might be different for each tile. So, just always ask for the address
> +	 * on the target GuC.
> +	 */
> +	addr = __xe_bo_ggtt_addr(bo, gt_to_tile(guc_to_gt(guc))->id);
>   
>   	/* GuC addresses above GUC_GGTT_TOP don't map through the GTT */
>   	xe_assert(xe, addr >= xe_wopcm_size(guc_to_xe(guc)));
> @@ -244,6 +252,292 @@ static void guc_write_params(struct xe_guc *guc)
>   		xe_mmio_write32(&gt->mmio, SOFT_SCRATCH(1 + i), guc->params[i]);
>   }
>   
> +static int guc_action_register_g2g_buffer(struct xe_guc *guc, u32 type, u32 dst_tile, u32 dst_dev,
> +					  u32 desc_addr, u32 buff_addr, u32 size)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 action[] = {
> +		XE_GUC_ACTION_REGISTER_G2G,
> +		FIELD_PREP(XE_G2G_REGISTER_SIZE, size / SZ_4K - 1) |
> +		FIELD_PREP(XE_G2G_REGISTER_TYPE, type) |
> +		FIELD_PREP(XE_G2G_REGISTER_TILE, dst_tile) |
> +		FIELD_PREP(XE_G2G_REGISTER_DEVICE, dst_dev),
> +		desc_addr,
> +		buff_addr,
> +	};
> +
> +	xe_assert(xe, (type == XE_G2G_TYPE_IN) || (type == XE_G2G_TYPE_OUT));
> +	xe_assert(xe, !(size % SZ_4K));
> +
> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> +}
> +
> +static int guc_action_deregister_g2g_buffer(struct xe_guc *guc, u32 type, u32 dst_tile, u32 dst_dev)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 action[] = {
> +		XE_GUC_ACTION_DEREGISTER_G2G,
> +		FIELD_PREP(XE_G2G_DEREGISTER_TYPE, type) |
> +		FIELD_PREP(XE_G2G_DEREGISTER_TILE, dst_tile) |
> +		FIELD_PREP(XE_G2G_DEREGISTER_DEVICE, dst_dev),
> +	};
> +
> +	xe_assert(xe, (type == XE_G2G_TYPE_IN) || (type == XE_G2G_TYPE_OUT));
> +
> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> +}
> +
> +#define G2G_DEV(gt)	(((gt)->info.type == XE_GT_TYPE_MAIN) ? 0 : 1)
> +
> +#define G2G_BUFFER_SIZE (SZ_4K)
> +#define G2G_DESC_SIZE (64)
> +#define G2G_DESC_AREA_SIZE (SZ_4K)
> +
> +/*
> + * Generate a unique id for each bi-directional CTB for each pair of
> + * near and far tiles/devices. The id can then be used as an index into
> + * a single allocation that is sub-divided into multiple CTBs.
> + *
> + * For example, with two devices per tile and two tiles, the table should
> + * look like:
> + *           Far <tile>.<dev>
> + *         0.0   0.1   1.0   1.1
> + * N 0.0  --/-- 00/01 02/03 04/05
> + * e 0.1  01/00 --/-- 06/07 08/09
> + * a 1.0  03/02 07/06 --/-- 10/11
> + * r 1.1  05/04 09/08 11/10 --/--
> + *
> + * Where each entry is Rx/Tx channel id.
> + *
> + * So GuC #3 (tile 1, dev 1) talking to GuC #2 (tile 1, dev 0) would
> + * be reading from channel #11 and writing to channel #10. Whereas,
> + * GuC #2 talking to GuC #3 would be read on #10 and write to #11.
> + */
> +static unsigned int g2g_slot(u32 near_tile, u32 near_dev, u32 far_tile, u32 far_dev,
> +			     u32 type, u32 max_inst, bool have_dev)
> +{
> +	u32 near = near_tile, far = far_tile;
> +	u32 idx = 0, x, y, direction;
> +	int i;
> +
> +	if (have_dev) {
> +		near = (near << 1) | near_dev;
> +		far = (far << 1) | far_dev;
> +	}
> +
> +	/* No need to send to one's self */
> +	if (far == near)
> +		return -1;
> +
> +	if (far > near) {
> +		/* Top right table half */
> +		x = far;
> +		y = near;
> +
> +		/* T/R is 'forwards' direction */
> +		direction = type;
> +	} else {
> +		/* Bottom left table half */
> +		x = near;
> +		y = far;
> +
> +		/* B/L is 'backwards' direction */
> +		direction = (1 - type);
> +	}
> +
> +	/* Count the rows prior to the target */
> +	for (i = y; i > 0; i--)
> +		idx += max_inst - i;
> +
> +	/* Count this row up to the target */
> +	idx += (x - 1 - y);
> +
> +	/* Slots are in Rx/Tx pairs */
> +	idx *= 2;
> +
> +	/* Pick Rx/Tx direction */
> +	idx += direction;
> +
> +	return idx;
> +}
> +
> +static int guc_g2g_register(struct xe_guc *near_guc, struct xe_gt *far_gt, u32 type, bool have_dev)
> +{
> +	struct xe_gt *near_gt = guc_to_gt(near_guc);
> +	struct xe_device *xe = gt_to_xe(near_gt);
> +	struct xe_bo *g2g_bo;
> +	u32 near_tile = gt_to_tile(near_gt)->id;
> +	u32 near_dev = G2G_DEV(near_gt);
> +	u32 far_tile = gt_to_tile(far_gt)->id;
> +	u32 far_dev = G2G_DEV(far_gt);
> +	u32 max = xe->info.gt_count;
> +	u32 base, desc, buf;
> +	int slot;
> +
> +	xe_assert(xe, xe == gt_to_xe(far_gt));

Maybe add a comment to this assert? something like:
/* G2G is not allowed between different cards */

Sorry for missing it in the first rev.

> +
> +	g2g_bo = near_guc->g2g.bo;
> +	xe_assert(xe, g2g_bo);
> +
> +	slot = g2g_slot(near_tile, near_dev, far_tile, far_dev, type, max, have_dev);
> +	xe_assert(xe, slot >= 0);
> +
> +	base = guc_bo_ggtt_addr(near_guc, g2g_bo);
> +	desc = base + slot * G2G_DESC_SIZE;
> +	buf = base + G2G_DESC_AREA_SIZE + slot * G2G_BUFFER_SIZE;
> +
> +	xe_assert(xe, (desc - base + G2G_DESC_SIZE) <= G2G_DESC_AREA_SIZE);
> +	xe_assert(xe, (buf - base + G2G_BUFFER_SIZE) <= g2g_bo->size);
> +
> +	return guc_action_register_g2g_buffer(near_guc, type, far_tile, far_dev,
> +					      desc, buf, G2G_BUFFER_SIZE);
> +}
> +
> +static void guc_g2g_deregister(struct xe_guc *guc, u32 far_tile, u32 far_dev, u32 type)
> +{
> +	guc_action_deregister_g2g_buffer(guc, type, far_tile, far_dev);
> +}
> +
> +static u32 guc_g2g_size(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int count = xe->info.gt_count;
> +	u32 num_channels = (count * (count - 1)) / 2;
> +
> +	xe_assert(xe, num_channels * XE_G2G_TYPE_LIMIT * G2G_DESC_SIZE <= G2G_DESC_AREA_SIZE);
> +
> +	return num_channels * XE_G2G_TYPE_LIMIT * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE;
> +}
> +
> +static bool xe_guc_g2g_wanted(struct xe_device *xe)
> +{
> +	/* Can't do GuC to GuC communication if there is only one GuC */
> +	if (xe->info.gt_count <= 1)
> +		return false;
> +
> +	/* No current user */
> +	return false;
> +}
> +
> +static int guc_g2g_alloc(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_bo *bo;
> +	u32 g2g_size;
> +
> +	if (guc->g2g.bo)
> +		return 0;
> +
> +	if (gt->info.id != 0) {
> +		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
> +		struct xe_guc *root_guc = &root_gt->uc.guc;
> +		struct xe_bo *bo;
> +
> +		bo = xe_bo_get(root_guc->g2g.bo);
> +		if (!bo)
> +			return -ENODEV;
> +
> +		guc->g2g.bo = bo;
> +		guc->g2g.owned = false;
> +		return 0;
> +	}
> +
> +	g2g_size = guc_g2g_size(guc);
> +	bo = xe_managed_bo_create_pin_map(xe, tile, g2g_size,
> +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					  XE_BO_FLAG_GGTT |
> +					  XE_BO_FLAG_GGTT_ALL |
> +					  XE_BO_FLAG_GGTT_INVALIDATE);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
> +	guc->g2g.bo = bo;
> +	guc->g2g.owned = true;
> +
> +	return 0;
> +}
> +
> +static void guc_g2g_fini(struct xe_guc *guc)
> +{
> +	if (!guc->g2g.bo)
> +		return;
> +
> +	/* Unpinning the owned object is handled by generic shutdown */
> +	if (!guc->g2g.owned)
> +		xe_bo_put(guc->g2g.bo);

If you create the BO as non-managed, then the automatic clean-up won't 
include it an explicit put will be required from all GTs, so you can 
ditch the special case. Not a blocker since you said the owned variable 
might have further uses later on.

With the comment above added (I'm ok of you add it when merging):

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +
> +	guc->g2g.bo = NULL;
> +}
> +
> +static int guc_g2g_start(struct xe_guc *guc)
> +{
> +	struct xe_gt *far_gt, *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int i, j;
> +	int t, err;
> +	bool have_dev;
> +
> +	if (!guc->g2g.bo) {
> +		int ret;
> +
> +		ret = guc_g2g_alloc(guc);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* GuC interface will need extending if more GT device types are ever created. */
> +	xe_gt_assert(gt, (gt->info.type == XE_GT_TYPE_MAIN) || (gt->info.type == XE_GT_TYPE_MEDIA));
> +
> +	/* Channel numbering depends on whether there are multiple GTs per tile */
> +	have_dev = xe->info.gt_count > xe->info.tile_count;
> +
> +	for_each_gt(far_gt, xe, i) {
> +		u32 far_tile, far_dev;
> +
> +		if (far_gt->info.id == gt->info.id)
> +			continue;
> +
> +		far_tile = gt_to_tile(far_gt)->id;
> +		far_dev = G2G_DEV(far_gt);
> +
> +		for (t = 0; t < XE_G2G_TYPE_LIMIT; t++) {
> +			err = guc_g2g_register(guc, far_gt, t, have_dev);
> +			if (err) {
> +				while (--t >= 0)
> +					guc_g2g_deregister(guc, far_tile, far_dev, t);
> +				goto err_deregister;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +
> +err_deregister:
> +	for_each_gt(far_gt, xe, j) {
> +		u32 tile, dev;
> +
> +		if (far_gt->info.id == gt->info.id)
> +			continue;
> +
> +		if (j >= i)
> +			break;
> +
> +		tile = gt_to_tile(far_gt)->id;
> +		dev = G2G_DEV(far_gt);
> +
> +		for (t = 0; t < XE_G2G_TYPE_LIMIT; t++)
> +			guc_g2g_deregister(guc, tile, dev, t);
> +	}
> +
> +	return err;
> +}
> +
>   static void guc_fini_hw(void *arg)
>   {
>   	struct xe_guc *guc = arg;
> @@ -253,6 +547,8 @@ static void guc_fini_hw(void *arg)
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
> +	guc_g2g_fini(guc);
>   }
>   
>   /**
> @@ -423,7 +719,16 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>   
>   int xe_guc_post_load_init(struct xe_guc *guc)
>   {
> +	int ret;
> +
>   	xe_guc_ads_populate_post_load(&guc->ads);
> +
> +	if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
> +		ret = guc_g2g_start(guc);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	guc->submission_state.enabled = true;
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index fa75f57bf5da..83a41ebcdc91 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -64,6 +64,15 @@ struct xe_guc {
>   	struct xe_guc_pc pc;
>   	/** @dbm: GuC Doorbell Manager */
>   	struct xe_guc_db_mgr dbm;
> +
> +	/** @g2g: GuC to GuC communication state */
> +	struct {
> +		/** @g2g.bo: Storage for GuC to GuC communication channels */
> +		struct xe_bo *bo;
> +		/** @g2g.owned: Is the BO owned by this GT or just mapped in */
> +		bool owned;
> +	} g2g;
> +
>   	/** @submission_state: GuC submission state */
>   	struct {
>   		/** @submission_state.idm: GuC context ID Manager */
> @@ -79,6 +88,7 @@ struct xe_guc {
>   		/** @submission_state.fini_wq: submit fini wait queue */
>   		wait_queue_head_t fini_wq;
>   	} submission_state;
> +
>   	/** @hwconfig: Hardware config state */
>   	struct {
>   		/** @hwconfig.bo: buffer object of the hardware config */

