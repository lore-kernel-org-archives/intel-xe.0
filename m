Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2B2CCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 20:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AE710E55C;
	Mon, 27 Oct 2025 20:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIt4d/pH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE1210E18C
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 20:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761596130; x=1793132130;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U0/U3tr9/k67zJvBKUeHTE3lzDewrmAwidxkVwdMqeI=;
 b=jIt4d/pHJNGvoWtYr0vOjNyeQi1zx2c1lyaiFbijJZra5M+kdy7iRKyj
 qu3HtdtOk3wD9qhkVO9CgzCJ1KuHDG9XcRezOk4An6Zt7G01AiMj51Gr6
 8ZHqBlGMWpVbKjzr84Jx4RRRUx+8MiuQNb5y7yAGLp+yKDLMxlmbrrhel
 ncfaoCkYfCYjPSq/GJ3a6Si84s02zeZa8u7ZOBrLk2GmJfQfVqRmJETk/
 4djjlr7hyfmYLv1zbmH3xpbxeeVD9IHwH+qqLe42uUE9KpkwIgTJTFAc8
 iGVeABnJDM87ey/u2s0IeNbUBVZ4WVCGeL5MgU27jaKGpzKU4/Byf3YY6 g==;
X-CSE-ConnectionGUID: LrKdIvP8S8OT7SyhsmpgrQ==
X-CSE-MsgGUID: IKTrdjf4S7C4tQio1Db5+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81110866"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="81110866"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 13:15:29 -0700
X-CSE-ConnectionGUID: 5g/M2BnHT/+lJbhqf4R4UQ==
X-CSE-MsgGUID: JikNz95/RSO5C4tt4zwd9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185609170"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 13:15:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 13:15:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 13:15:28 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 13:15:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iw2h3K67ttKwllIivQgZujUtJAu9W+8q2O14aaIBvCZD9B31DHmWaD9uWjQBXWXXj08Xjf7X2trgsY2HHDci+qrN59THeMZkJCQ7MuXnnegWd7jU6GiO4m7HzjE/ySrlda65Ie+mql0Jnjg+RSqJ3yuZcbLbOC4vUwteUyOWoUxLO3uz+DIfeYjGXOovtzcFzzouesU24GOxaSdglezV9RIj/9y0VPlplkVWAG9/uubB/v7gHp+JHRd31oe8wwRpsDUI2dYbRpVs2usxCPwGf1qr7xkDSoqQYKVqvwZrElxuvJLFsMReO/OIfexAFf0xarNQd+maI1dETZPwnLDCrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ii6FqkfVNq6FfEYszOZhmEGoF6qsWkt0G4V2jO2dhu4=;
 b=e3z049V+POL5ogODAI/Qs0BxczaziCHrQCBxwj24ntRrhs1ZRbU41eL5dto04w2SpDQSQmPpICjhHSwLvT6Ix7VzkY3umDvs2J9Hh9op/eDduSHw/kX3cdPhESrg66pWSl1ScqAQ9bRy5VmDDGU5x7SPQwzH7ngR9Pa4Up2F3O4k9ZZe13vgdEDh25BDn/pILl36rKiV4t2gdVFGukg/k4ykyJmLIXbNRcTtsYZTkcL+jTlpAE9yitUg4eWTOkjuWPL3A8vvQ+xr6BDSJHngy6P/S7CU3m76fsrwDqqNXswMPRsD6coFtgkpz5VVpb6zv9psl/48SqcR++qbxlNPtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM3PPF076C797B1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f07)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 20:15:26 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 20:15:26 +0000
Message-ID: <7b39f2bf-f772-4646-8ef1-2147251fc4f0@intel.com>
Date: Mon, 27 Oct 2025 21:15:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/14] drm/xe/pf: Allow bulk change all VFs EQ/PT using
 sysfs
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-8-michal.wajdeczko@intel.com>
 <ckmsitfkv6w6wmtbhdu7wjglnrvdpvcftxvzcvzj4lgrpsfamy@msxzfdoaczzk>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ckmsitfkv6w6wmtbhdu7wjglnrvdpvcftxvzcvzj4lgrpsfamy@msxzfdoaczzk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0028.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM3PPF076C797B1:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d48b71-dfc3-47fe-f82e-08de15959125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTM4Q0x0d1Rkbm1jOHlEcHhrc1psYkVkdXJCdXc4dUNQM1VMR0h3N3d3V29l?=
 =?utf-8?B?T1Q1Slh2QnBZd3VZS2MzcERFZ085K3doaE5FUlA4WVBuUTF4azZiUXZROVdE?=
 =?utf-8?B?NTRaQkFQR3FneXNMVG9GYnVrdW5JUGg0WGxSYzZLUUFXTWNWb1I0Z1BoZGtB?=
 =?utf-8?B?V1JUa0oyOTlleE53b0pld0pDSUVMZm56OXkrdXRBcWFWVXByYlBhTkFrM3Vh?=
 =?utf-8?B?VEYyM2RUb0lJei85dFZxemV4cm5NRHNFMjVqeHoxM0FkMU91cGVSQmQrZzJS?=
 =?utf-8?B?aVZBTyttTXBtRDJyZ0IzeW9ZSWNzd053QWdqc2NWeTV1SWdLY2F2T0RIZ0wy?=
 =?utf-8?B?OEVGakJMUnk4aGhUSWFmRUNBR012ZkhDa3gxaHRxbXQvNlFoQktrRlgxTitP?=
 =?utf-8?B?eEpoMnlaR1BzOUZaMks2YkE3eUtldzE5TmxVOFJ4aXRyd2JSN1NqTW1iYWxj?=
 =?utf-8?B?RlFmSzRWYnBnZzdLM2RFN3d5TXBFNitqMTJuV0hiVXU4VDVsV0ZRK1V5NWRS?=
 =?utf-8?B?ZEQxa2JJNllLL3J1TjhJUlhRSnNWMVE4OHlxcGpxZXB6N0x2ZjRMd0JITE1n?=
 =?utf-8?B?M3VVQUJ4MkkzclNCa2hDQjZsZklwT2YyTE1tYVB6MG9ZWHhVWmN3eTVKRm1r?=
 =?utf-8?B?OUJQc1VPcnAxNTFrdE0rVHpKNWxnR0sxbWdYNm9GTWpNdGppVkNoeHE5SWtX?=
 =?utf-8?B?Y1ZuZE9mNU5WOWdrbk1DNFlPaFBuL3BDSUg4cEpOV0pXUnlmQXdMYkU5Q2Y3?=
 =?utf-8?B?TkVMdmkyM2MvdmpIbmZqS3dyaTlRcDFVdGJ3MWpmOUUrc3laRThoYmd3dkFp?=
 =?utf-8?B?dXUwbzFaY0hSQnF2d201bkdTSm1pZDNOODBOZVRGWFB2Wmk2R25IUm84MUZo?=
 =?utf-8?B?RnZLbGJ1TlFjZWNTYkg1T2o1Z1hTS2IxRmR6cXAzcDJlaERVaFZKVnZXT3h2?=
 =?utf-8?B?bkdiYldDLyt0cTZaVmh5eVZqVUFIdGhNeU1LNHZudis1enNMYmMvSkxlZW9S?=
 =?utf-8?B?citldHVpa0FwQnRzTFZqZW41TE5abGw2Nm9zaTVUYXJzUi9HWklqdEVDdDhm?=
 =?utf-8?B?NHE3bk5xdjhmR3ZiMURvSjZOUmx6b1VRZnM5eEdRR1dxdUlGZ3ZYMnNFMURK?=
 =?utf-8?B?bk1EdkhnS2RCQW1US2xTNC9veUU3dFJ6QndlRWVndmtJM1BaOFdwM0cyR2VT?=
 =?utf-8?B?ckJ2ZFhyQWg0UXA4amcxMFdTOFdFaEYyZGQ1SVE4blZ5bm9YaDc1Z1BLWXM3?=
 =?utf-8?B?YnNDNWM3My9rMk12L2l0QmtYemlha1pnZjZPNldGT0dDYU1NTzhuUzBwbzBT?=
 =?utf-8?B?ZjQ0TWgxY2lVQVU3MHNuaXFwUFdjNmpLRWU0Nk5hSklnaHNtUlNJbUIwVEQw?=
 =?utf-8?B?K2NjVVE1QnFscDlxY3lrRE9iOGc5WG9HdVdwbVRQVGdLakkvQVMzWkxOakhU?=
 =?utf-8?B?Rm13a2w3anVxQ21SSVdpUWNZTjZ2ZWZqcURzQ2VlbGUvdms1bmZWWGJUSnJ6?=
 =?utf-8?B?dEE4NmdPK1dlV2YwUWU4azlhQmRraEpGOEJrV0IyU09YcTNEdkVmME5DejFv?=
 =?utf-8?B?K0dpNkRtY3dSOWdCd3hhUmtMeGVKYTNja21VTVhnTkMxTXdzOHRRdHcybU1w?=
 =?utf-8?B?WHRBVVlIOUdaWllHQ0FFY3NYdFdtZSszUVFUUWJNYnMyTmROejJDeFlNRTVP?=
 =?utf-8?B?ZW9uS3RMMjN0RGd2aFozVFJwWklpWW12RVJMeXNFcWZ3ZmFieWo5RVVXT2xN?=
 =?utf-8?B?UVN0WXhvTGQwUGxRNzVmbWh1S082dURIdTV6QU1vOWFOQm5rYkpYa0N4cUZs?=
 =?utf-8?B?SFphd3oyc29lWHNHRFNOUjdQR3poTFVYZ2ErSmNQVHJEUVk3UG5PNTgxcnhX?=
 =?utf-8?B?ZkUwY1d1NG9qaWt2NDZDQXhRRDZVMTE3YmNLNU5RYnJSY2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1lNZFFaVDNXR0EvVzVMWXoxYlpBZWdUbUN6N1FKV3RKNlhkSlhYOHdIR2RX?=
 =?utf-8?B?NXRORXdFRGtvWUtYTnJjL0VhVzJyRkFBZVBzUGR1a0dzdkVpSTJYMHJGblBD?=
 =?utf-8?B?MnpJVDJBMURlRzNHcnFkM3pBSGl6ZnhPNmRHbENMSUE1dkRLeURLcWNDSGNT?=
 =?utf-8?B?d1V4T3ZzM1FDS0VERThZTjgrbGxJL3BkS2RyaURjdDhQcjNlZzFMUzMzQ2tB?=
 =?utf-8?B?dXdGelRvQ29zRXRueGVkTmllZFJHM09YQWFHWmJ5R1ZJRTJCblVXdVdwaHVs?=
 =?utf-8?B?ZndPZmN5dHFBYTRKZkZGVnArSmZ0TDFYeEVrdnEzZi9jenJGUGUyYllSb3Bu?=
 =?utf-8?B?NTdJVTZRKy9xRWw4RnA5SWZiWGQyUkRubnd2ZE1WcGI4Z01jR05YbW9TWThy?=
 =?utf-8?B?UmY0Q0N2QWs1Sk5Kak1xaEora2ZURlVZaVZ5VUZCdkoxRGpqTDdEYXYzNm56?=
 =?utf-8?B?U2pvRXBOemJrMGQrTWtCYmJxRlJGZmkxeEtvSHRtcmU1VVZGc0tZeFROa3hY?=
 =?utf-8?B?K0VPOFhGcHFjMzFzcVBMUXh5cml3TlFnL0RPZmJueG41bjVoZHNQK2M0VDV2?=
 =?utf-8?B?WUEzOFR6elJaOXF6OW5WVjArN28rcnUrUThBUzkzdndNMzFkY0E1YTB6c1Fw?=
 =?utf-8?B?bktiMHNoOThHN3BTc3RXYTI0KzBZZDFmaGFsWm1NWUU3em90M212UDg4SWVH?=
 =?utf-8?B?UmRWQlJQV2JPQlplcGpUblNRVUlUY2JQZ1J5YmdmcktYaHJ3bXh2WEpGU2hJ?=
 =?utf-8?B?eWJ3VmllYnFzR0tQdzdVazdyMXBXNFh5Q3h5UUFObkNRUG96RmN3a3VHK01v?=
 =?utf-8?B?NFgrY3E0OVRpV0h4RTdHYjE0Y05qT29kTkFKU0NKaFVJK2NtMm85VjZ2QXZx?=
 =?utf-8?B?cHFzcDRtWXg5WXNCLzNxYWdNMXhETVFrSThwRHY0NitMMmNndC9TUzBSTXo3?=
 =?utf-8?B?Vk9wREE5NC9VOGUvRVg3dVFXQWVGcUl2RERqS0djYnJyRjlGVjBzVjVXZmN6?=
 =?utf-8?B?NS8zSGZIdElzZFRVYk9EaFV3MVZIaDFtUUZiQWF1TUJxbDAwdXJtTVRtdkda?=
 =?utf-8?B?Rm5mZWJWeVp6cFdSMERYRHlZYThvY3Z6NHVMbWNBSndtRGNqNTRpZzBCN3c2?=
 =?utf-8?B?cloyellkVG0zRDNocWxrV3BhSGNZdDZ4OTRoVGZJeC9wQmNmcVBEUlR6bW1o?=
 =?utf-8?B?ZGtyL0dzM29sUHd1Z25mSUVHdmJmNmJzdDJVd0xxUkV6THg1N2dTYWZHa0FI?=
 =?utf-8?B?bUdxUEwwYmRRZCtueU9rcUZWYkFYQko4RDIwUzd2T0VsaWtJdTZzM3VTWmV0?=
 =?utf-8?B?QjU4N2NTMHVDSWJOcjhnOWZET3NwdTlZYlFyWnMwQmlEbzFESG9rUjNkeWhR?=
 =?utf-8?B?UmhBWStqOU9LbUQwcDNrTXB5VUhLbTRGdHVNb21MaFA4R2hRTCtmc29vUkRU?=
 =?utf-8?B?SE5odkhmYWxFdmV3bnh4ZThGZ3BQZmdOTXVzc2lIa2xuVlNxQTA2UlpjaGpP?=
 =?utf-8?B?amR2YTZ6TVI4ZkZxOUFQVUk3VHhuNFNvQ1BXV2JMT0VFNXM1ak1BZlRYdmoz?=
 =?utf-8?B?aUt4alhPUzBQYTg5Ukwvbk5PcFBXdHkyMWRsa3dPajJWWGUySnpXTGM1dGR5?=
 =?utf-8?B?OGJuOHRsVDZ3WEU3QXZyeFFTM2dyR0d2a2NWc0pPcGQ3eHRwSnZKYitpckRh?=
 =?utf-8?B?ZkIxdnBWeFptZ1pqS2M0UE1iZ0hKeTN3U0p3T2MzM3ppNUQxb1VCV1Y4TmQy?=
 =?utf-8?B?ZUFXai9nYVJnZ2VDUStiTFJLam9IVHBncGxMN1pWNU9yUk9ZRmNZRnl1K3Ft?=
 =?utf-8?B?d1lLb0JyMzZpdlJwYzM0TzhOcUwvRGZjdGNqcG5mbEh0TjM1RjVxTjJobGo5?=
 =?utf-8?B?dWVUaCs3dVBYWXVLR212NFBMV3B4TUJYZDRWWEpia2VaREZDZ3E4cDZCL0Fy?=
 =?utf-8?B?bWZjMU9WT0RJbnErcUtMM1hlbUFvREdZaWRydTNXZzBHODEva1hrUm9PVFQ2?=
 =?utf-8?B?Kzk2TmUyOVhNeUNVeklLY3lJZ3UrMmtyRnR1dStXQ0xDa3hXd0QxcktTUVIw?=
 =?utf-8?B?WXh6SnZBU2dlbjBOL2tPR1dMT05TcUswcjJVR1BhYXJDbURWbXFTRFZMRUI5?=
 =?utf-8?B?YVFNZzZHZFR0WDd0dlBFakNDSUMzU0djWVpUUDdvZFl1WEZlbTB6TlRWMUZZ?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d48b71-dfc3-47fe-f82e-08de15959125
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 20:15:26.4931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dehOeBMtsEc5mJ2zBVblftGXzLGr0nG9q7QT1sDJQfjcZsOL26vHX4AX8ov0a5oSgcVS53y7otuO2zG9B5PjYnRVfgXbfMAnKZ/ItaVTyzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF076C797B1
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



On 10/27/2025 8:28 PM, Lucas De Marchi wrote:
> On Mon, Oct 20, 2025 at 08:24:07PM +0200, Michal Wajdeczko wrote:
>> It is expected to be a common practice to configure the same values
>> of execution quantum and preemption timeout parameters across all VFs.
>>
>> Add write-only sysfs attributes that will apply required EQ/PT values
>> globally, without forcing admin to update PF and each VF separately.
>>
>>  /sys/bus/pci/drivers/xe/BDF/
>>  ├── sriov_admin/
>>      ├── .bulk_profile
>>      │   ├── exec_quantum_ms        [WO] unsigned integer
>>      │   └── preempt_timeout_us    [WO] unsigned integer
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Are there plans for a admin-oriented Documentation/gpu/xe/xe_sriov.rst?
> Besides rendering the kernel-doc, we should give an overview of setting
> these attributes, provisioning, etc.

some initial draft was posted 2 years ago [1], I'm still waiting for some
more official white-paper, that hopefully will include suggested values
tailored for specific use-cases

[1] https://patchwork.freedesktop.org/patch/567127/?series=126289&rev=1

> 
> Lucas De Marchi
> 
> 
>> drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 36 ++++++++++++++++++++++++++
>> 1 file changed, 36 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>> index d5ad7aa7a899..5c445094e223 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>> @@ -22,6 +22,9 @@
>>  * :
>>  * ├── sriov_admin/
>>  *     ├── ...
>> + *     ├── .bulk_profile
>> + *     │   ├── exec_quantum_ms
>> + *     │   └── preempt_timeout_us
>>  *     ├── pf/
>>  *     │   ├── ...
>>  *     │   └── profile
>> @@ -84,7 +87,40 @@ struct xe_sriov_vf_attr xe_sriov_vf_attr_##NAME = \
>>
>> /* device level attributes go here */
>>
>> +#define DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(NAME, ITEM, TYPE)        \
>> +                                            \
>> +static ssize_t xe_sriov_dev_attr_##NAME##_store(struct xe_device *xe,            \
>> +                        const char *buf, size_t count)        \
>> +{                                            \
>> +    TYPE value;                                    \
>> +    int err;                                    \
>> +                                            \
>> +    err = kstrto##TYPE(buf, 0, &value);                        \
>> +    if (err)                                    \
>> +        return err;                                \
>> +                                            \
>> +    err = xe_sriov_pf_provision_bulk_apply_##ITEM(xe, value);            \
>> +    return err ?: count;                                \
>> +}                                            \
>> +                                            \
>> +static XE_SRIOV_DEV_ATTR_WO(NAME)
>> +
>> +DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(exec_quantum_ms, eq, u32);
>> +DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(preempt_timeout_us, pt, u32);
>> +
>> +static struct attribute *bulk_profile_dev_attrs[] = {
>> +    &xe_sriov_dev_attr_exec_quantum_ms.attr,
>> +    &xe_sriov_dev_attr_preempt_timeout_us.attr,
>> +    NULL
>> +};
>> +
>> +static const struct attribute_group bulk_profile_dev_attr_group = {
>> +    .name = ".bulk_profile",
>> +    .attrs = bulk_profile_dev_attrs,
>> +};
>> +
>> static const struct attribute_group *xe_sriov_dev_attr_groups[] = {
>> +    &bulk_profile_dev_attr_group,
>>     NULL
>> };
>>
>> -- 
>> 2.47.1
>>

