Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3FECCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 14:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF27210E3FD;
	Mon,  6 Oct 2025 14:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BI20bok5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E7210E3FD
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 14:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759761365; x=1791297365;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=h8+4/oQdomFAVfJdRPRiGDqivyqXxfOeK1Bd0qFSAEU=;
 b=BI20bok5CjbOBold2fXI0XWVFoPA1ut9t9wmgD6ixgWf7UDxKJik031L
 HYa3iPcqD+Z244hneMsUrslssd6953VxjroHeYT4uDRGB6vOblFg167As
 8munTTho5uI8oKvPbKMeW57w23HRRIVWMAwr8HHcVkddckzb2p8f8y0UT
 gE+6nN0LxOcamGlYEBB1U5/oP4uwPb6qCDg5UsuaNtWrEGreAs+bnxi0D
 kIAI5RsPBxhaiNn7nlNX4ZuQVkwxvPW2Klgv6NVvVICjdsTDeMjUDTnDq
 DzuxKc39xkaACjL+WYoq1zavsZlbkQLgxGewHAM79P2EG3ntvd/ko2623 A==;
X-CSE-ConnectionGUID: VeS3uuTkS0CA3UvRaIAFGw==
X-CSE-MsgGUID: P5oGa/VSQouU/xbB8Ctj4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65580612"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="65580612"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:36:05 -0700
X-CSE-ConnectionGUID: DBadX9RFSMCCHGCJBFyzXQ==
X-CSE-MsgGUID: ncCHlbNTQkCLWRohZDxdCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="210581227"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:36:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 07:36:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 07:36:03 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 07:36:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmyPo8Cy3Jl2MDp9+JPFVrLG6tBgOpBvSGG9qogUXsyGvF4PxG+qldpcgrJt0IuKXSW5ZiKhJRiSvrbVtWn1b59fvE/DmPXNrghPsjhNu4ttcF2727uzAbsTPQ17EDD+f97atv11VBC5vkFXT5xLNzvzodIlinnO41525v+BFCiByXllSm1M10L3onpl8A8Cn8qtaO6yxcaoaoeKslQQ77fTltqCFcY1AVdzsqhaziTTEb7/slT9Imr6NotlalA6f4acMicdrJBkedMPudoDsXx+CBhw1qGaAmCr697bTyfYjdnigIwnZz+6yjWWBXoU7FKTlTo39AQ3Io/k+5e7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiVza4l9I2MdeirwCNNV5twQDZQJU6nAEExkSW0L4b4=;
 b=Hg2jQP3B1lObSe4vbbOBYwmelt08/Fk0fwnhjWWLRDsjSnq22xkvLiJtymr/x034BuuHHhvkRu7SzKFqYH6KpxA6xuHFnmOljtNuaj/Q/SH3HdM7BsrxYxHbb6Y6+a6tr7ltZJZAaBtHaIVBv23wol2NoJARuKhRsp89pwsl1GkpyF3der4+W4X3BeglSwXTQS0/8ss8wNGwSyYbD2kZLmhTtmPeQAGZtvja2RQ3JsG0AhoxVa9OPAX5fcE/UXD3im/CXEr2i0iNIAgYB1j5mVTaZqfJxsR9IUUhYnPHsNcKtuwXlIiv7id4PwxTxwPjc4fp5HjoAA6ub+o7UFhkTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 14:35:55 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 14:35:55 +0000
Message-ID: <94961e87-1826-4059-bb81-b79073074ea8@intel.com>
Date: Mon, 6 Oct 2025 16:35:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/30] drm/xe/vf: Wakeup in GuC backend on VF post
 migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-15-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251006111038.2234860-15-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0087.eurprd04.prod.outlook.com
 (2603:10a6:803:64::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY5PR11MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e93c5f-6cc9-4a79-8efc-08de04e5a869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1oxempsbndJM0sxcFFmc09KQ2lya0tZbXpiemVKWEk3aVErN1EyMkNvK0ZN?=
 =?utf-8?B?RXUyWFFobjk3amRYUGkwUTh0dzJOaFJPYUx3MzVjemR4QW5CUSttK0Fjc2Jl?=
 =?utf-8?B?dXJ5eHA0YkJBSkdKNzlFTEdBSHJUK3FOSVNKRis3bHdlMHZVRzdOMy8yNWlO?=
 =?utf-8?B?U1FCRVpma1J2ZmlWd3NKNFErQW9TQzRCd3BkSjBLcU1Lc0o1SDA4TllmNGdP?=
 =?utf-8?B?Sjl6UC9heFhKKzZVQ2ZETXRnMGY1SmN2QXdlekxTL3QxZkYxK0ZHeitEVjhn?=
 =?utf-8?B?a3Y3czFUUTNuY2prcHgyWGlGcVRTUko5UkJXRzV3QnhmZi9tZnJLUldzYmNE?=
 =?utf-8?B?SytvTWRTa0hVTitWbnhsVWNPcE9CY1VhRW02VVRwU0k2c1p0YktXaklQTXhE?=
 =?utf-8?B?TTZNZExwREgyNzVaSGkyZWYvSDE0amJxM3RTQXFwTmpoc0NnUE9hTVJYMk9R?=
 =?utf-8?B?TWdGYnNNaXAxVnJjdHdoMTBxTHdzbzBmQkVMUTlKSnpjWUNNaG45Zm1qN3Fs?=
 =?utf-8?B?WVZZaWJLbXY1Ri9lbmxBbXQ1Z3hUMEFnMGUzSm1BME55eVAyRWJqLytlWnpN?=
 =?utf-8?B?VHA3OW9yRTBXWFI3QlVWK3VkL3h2L000MmNvNnhobE01KzlwTWJscm1JcUhw?=
 =?utf-8?B?Tm9LY1JYNEhkRFFlZnN2bXdFWExCVDlyWGpsejdLUTZla0dWWjNjL2dRalI1?=
 =?utf-8?B?bGlLVXY1T1B3R3MxeUVvSk1zL09GRTNncGFTQy9RSTlwV2RVZXVwOXFHWUhK?=
 =?utf-8?B?aDRGcUtDbFlpTzZOcitPTzZ1NmVCVk9zUEtLM20rbCtlRkZPd0V6ZVVHZ2Vk?=
 =?utf-8?B?RzJoQlgwTFJqcHMvTjZGTnVtL2xlQWt5Uzc4cnJFRm5KRk1FZlYrRGdqSy8v?=
 =?utf-8?B?V25Cd3g2M1JKWk9ma3BRSU80VDRRZjJmMmkzSm03YmlkRktBdWhIUEtOc3gr?=
 =?utf-8?B?YVR5N0M2V0lndzZVdmV0RDdnUFRtTVFVUFI5eHhxZ1Y0bHFpcGZzVXpRcDc4?=
 =?utf-8?B?UVBFK2JqM2U1VXQweWJ5ZHpqZ0pPVG1TemNZWGxQaFdxZHpSVFZqT1Bna2FT?=
 =?utf-8?B?Y1RmMkpWQ3ZhZDJFL3FoVGdJbXBwNXpZdnlza1R5akREbHVGZERJVGF2NFl3?=
 =?utf-8?B?Tm1mdzNJSDhLQTlKZ0VhT1RTbHZ4M2JhYmtlZlVNcHY5VGVoQzhsbGYwODYr?=
 =?utf-8?B?aHE0dno5bnF0cmhRR1k2aG03OWpSMDFid2ROcEdncy9hNFRaM0hGdHorOUUr?=
 =?utf-8?B?c0JVc0NJNnFvQ0ErMnU5dGFaOVBIcDBCcGFLRWYxanFFSEtDM0FQM3ErVjBR?=
 =?utf-8?B?VWZkenEzdkppb1JvVXBWeUVzS01GL3dReDVyeS9UZERXSldhc1RQWDlpdkVY?=
 =?utf-8?B?KzdhbDJOK1ExZ0Ztc1JYTTdNYXVGZjRhMkxUUUltM0lmUEpOeW9lMHRzcVRj?=
 =?utf-8?B?UVBKZWljYytmQ05QZGRYMlVHbU5BWmVreGpUSjJkZG9XQXQ2TWJ2VkllMVVV?=
 =?utf-8?B?WW9ZVmdybEtSQnRFbnJqL3JuZTdYb0J4WXVzTlVGQ0E0SnZsWmZHM2xuZ0Nt?=
 =?utf-8?B?SCt5Z1NxK0JJQTVJZVowVCt4aHpJallDV0o3WFJSZHJDTlllVGs4YTNEc2Zw?=
 =?utf-8?B?Y1ZCZmNoWU10SXBmcCtJdTJHVmp3aVZoVnN5Qjd1SjFyMHNjNm9IQWpLclhh?=
 =?utf-8?B?cHovQWZOcy9sQkVsdHdqQ0wrWnRSSHRuNHpCZzNhd0FBT2daa294UlpFL2RY?=
 =?utf-8?B?WDZkN1BVd2NaOVBoSm9wRkJkWnAyS1htVnZYRHBEWkFWTFphU0JCTmgrNzNH?=
 =?utf-8?B?SFYxMTFGNWo5Z3JZVkNNeFRpNzV1U0s1Qzk3M2k1RHhxd0N1bHo1bEJGZms4?=
 =?utf-8?B?MS9DTGozRG5XV2t5RTloM3NrSEJPTzZYOUM4NWNQNWF5c1V2RUZ1TDRIQjc1?=
 =?utf-8?Q?UCcJLS04qwKBdC9ADygfIFe1U6tnEx4i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2JBYkoxalduSmhQUFJDdU94SWFHbUhBQWVpU3lDM25qdW1NbE5aWTBzZnpW?=
 =?utf-8?B?UlVsWVdEVWhDTGg3REc1anF5amx5a2ljQTVNdFNRcExxYXY3eEsrOEtYL0Mv?=
 =?utf-8?B?cFIzanZmVVVMYUNpNDJ2RlhsOE5SaHMrRWkxRmZVRlFxWXJvVG1KVEQ3VkUz?=
 =?utf-8?B?UFhnNnlPQW5UZEp1S1diZXBVMjI5UTFFZFFuQnV3MS9DWm9xK3pxdkFXQk5q?=
 =?utf-8?B?VFNYUWtZejIzai90c2JUQUVlMW42dGhVQWt0dnpQdElLSVZSdjVQa3NnQlZL?=
 =?utf-8?B?bWRvdTNhWXAzcm9iNkN4VlBCZ01Vd3pKSFBQc2pBTlhKSnE5T2RZNVR2M1Fn?=
 =?utf-8?B?dnNsVit3Z21NTkF2OUJnTWdlOUtmVVc5WTFia2c2YWtCM0oybVY1M3NWOW51?=
 =?utf-8?B?WElqQ1YxQkNTS2ZxeVpwQVdIaTBSZXJaVTA2SkhNUTNuaHFHdXdvQUJkTVY5?=
 =?utf-8?B?bElkM0ZwNzB5cVpkMi9CTEx3bGhwNTBTNTNJWkw5SUdzWFRtdGs1NUd1Yzh6?=
 =?utf-8?B?L0ZIZENPOUk2blpqWEZCR2p2Q0NPZWpZN1ZJdUdrck9SL2NkbjVEWE1iMWZR?=
 =?utf-8?B?WkgvTHdabVAxYllXRzZ1Sk5qU2tUREU3Qkc4OG5sVHBOZWJ6VFgwcDNYam95?=
 =?utf-8?B?R1FFemc1djFUM1VKbCs5SjRNTVRrN1dFZHBaTGtEUitXU09rUzIzR001L2Nu?=
 =?utf-8?B?UnR1aUdJS1ByZlgxQU52Q3hTZXVIZUNuZ28rVkFoU2NtT1Y5R3l5S2VBR0pn?=
 =?utf-8?B?cnVWbWllRzdnU2cwS2MvOXRFU2tYUlRHZ0xwcm42c0h3OUYxQXVpOVN0U29z?=
 =?utf-8?B?cmQxOG1iTXJHQ0d6ZTFMZndSWHRDUVZFNmxwTGhYNUhJZXpyVEJncUdiVm4r?=
 =?utf-8?B?MENDT2Zwc2VwYk04a1ZRWkZUbHhKZW5zWXZ4UDFBYkxwMi9QRk1uNDlnRHZi?=
 =?utf-8?B?WmdZVHFNL2czNVBMckFvOUJkdERrVkkrbm9vdmErSEUrMlZBTjVTTzRvMzRR?=
 =?utf-8?B?WmJhYlN3M1VSU3ByMjNkRnJXVFZXWjU3OUh5Nk5DNXRZbkZCcnhwY3JZc05H?=
 =?utf-8?B?SEhBaEhiRWFiWEl2SkgxZ1dvN3YwdTE5Rm5Oa2grQ1VTSGFuTVdwbVNqMGJo?=
 =?utf-8?B?RTJrTyt3YkxqLy92TXhXdTFXU2t0dE5FSmtjN2FpdlJLbTc3dUNOY1NsNUMw?=
 =?utf-8?B?ZjFseG5iRW9MdlVydm9wMXVCUndHQ2xrZUpzTWtEa3FoRkR1YXhTNjNSaE9h?=
 =?utf-8?B?RzA1QlpqQVNCZnU0VWpyNCtkV2NyQ0tPQzhydy92d0tuMTNzOXV1bXlYdnFx?=
 =?utf-8?B?czZQMi9xaDZEcE9vOHJacUZkMjNUSmNRRXJsRDJ6YlgwUFY2YkNnUmdjNU9r?=
 =?utf-8?B?WDI4UStoSmJvMUdhem0vdlMwZGxqMTcwNmh0WFplNnZwaHZCTkEyUEdrZGRy?=
 =?utf-8?B?NnpURm1WMjNnQTdqWjUzQU5LZ3F1SHRWaU90ckxmRlJGeGJiaXNkbTFUZktt?=
 =?utf-8?B?SndlMUFvWnlKbC9RYWg3ekdJcWlxd1RJWE5hYVNxcVhmeUQ1NlFiekhPd0Y2?=
 =?utf-8?B?MjFHTm0rOE9ZbmRyVUlNR0ZmdHk5ZUpRaVJlb1h3VXhhQTFGUGhHM0FDQ3F2?=
 =?utf-8?B?UHMrdVVBdDNUM2tkcEk3djNTYkNEK3FvUVFNUUhsdXdqNkdObS9Ec3dpUDVx?=
 =?utf-8?B?M3hMY2pFN3JXUnJTL2RwS0YwdnZNcE1aK2pGem10dEZZY25FMEs3TUFlamdS?=
 =?utf-8?B?c1BXd00wVzRiNDMwc1kybXRhbzB6VVlPY2Fobk9HUTU5RnA3OVF2amxsUzFM?=
 =?utf-8?B?Szl3c2FGUjVGc2NubkUvVTlrK2pOb1cxeFBYNWR0cmJUWEg2RVZ0MTJNV3Jj?=
 =?utf-8?B?SjBNNCs3dXl3ZGNxTE9zcHhvZzhTM3lRT2Z1dTlxWldPVktwajFSTTZXb3ZM?=
 =?utf-8?B?NXU1dzd0R0xCSmp1bWNXSllRTnJuUWFvRUFHTFAvYkl0eHRtMm9UTThVZk1m?=
 =?utf-8?B?TnBpNFhEWDVSTDVwLy8vcVBVM0JDSVpxRFMyZzZVOWFqUlk5S01yaUhGRURw?=
 =?utf-8?B?elJsTzFJREYwKzAzUGNiVUdadFRMdnN3R0hRVGRTVkhRZkRadTFhVlFVb25w?=
 =?utf-8?B?MW52OWhDYUxsdXZ5SEZpb21RRFU3TWlrQWljRS8xVlN4NkpDQzRQQ2FsSENj?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e93c5f-6cc9-4a79-8efc-08de04e5a869
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 14:35:55.4878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2x5oF7kH9B9dlSDHGK/6deZAJecoxLKbhrt+yU1cqLWMm9sJu30YXwtfooJXRUiDaIvmg3zotyrPgefjLgAy4+u4ZwyLVgqmmgeNlIdkrlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6342
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



On 10/6/2025 1:10 PM, Matthew Brost wrote:
> If VF post-migration recovery is in progress, the recovery flow will
> rebuild all GuC submission state. In this case, exit all waiters to
> ensure that submission queue scheduling can also be paused. Avoid taking
> any adverse actions after aborting the wait.
> 
> As part of waking up the GuC backend, suspend_wait can now return
> -EAGAIN indicating the waiter should be retried. If the caller is
> running on work item, that work item need to be requeued to avoid a
> deadlock for the work item blocking the VF migration recovery work item.
> 
> v3:
>  - Don't block in preempt fence work queue as this can interfere with VF
>    post-migration work queue scheduling leading to deadlock (Testing)
>  - Use xe_gt_recovery_inprogress (Michal)
> v5:
>  - Use static function for vf_recovery (Michal)
>  - Add helper to wake CT waiters (Michal)
>  - Move some code to following patch (Michal)
>  - Adjust commit message to explain suspend_wait returning -EAGAIN (Michal)
>  - Add kernel doc to suspend_wait around returning -EAGAIN
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c      |  4 ++
>  drivers/gpu/drm/xe/xe_guc_ct.h           |  9 +++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 82 ++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_preempt_fence.c    | 11 ++++
>  5 files changed, 88 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 27b76cf9da89..282505fa1377 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -207,6 +207,9 @@ struct xe_exec_queue_ops {
>  	 * call after suspend. In dma-fencing path thus must return within a
>  	 * reasonable amount of time. -ETIME return shall indicate an error
>  	 * waiting for suspend resulting in associated VM getting killed.
> +	 * -EAGAIN return indicates the wait should be tried again, if the wait
> +	 * is within a work item, the work item should be requeued as deadlock
> +	 * avoidance mechanism.
>  	 */
>  	int (*suspend_wait)(struct xe_exec_queue *q);
>  	/**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 7057260175f3..7f703336d692 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -23,6 +23,7 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_gt_sriov_vf_types.h"
>  #include "xe_guc.h"
> +#include "xe_guc_ct.h"
>  #include "xe_guc_hxg_helpers.h"
>  #include "xe_guc_relay.h"
>  #include "xe_guc_submit.h"
> @@ -743,6 +744,9 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>  	    !gt->sriov.vf.migration.recovery_teardown) {
>  		gt->sriov.vf.migration.recovery_queued = true;
>  		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> +		smp_wmb();	/* Ensure above write visable before wake */
> +
> +		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
>  
>  		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
>  		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index d6c81325a76c..ca0ec938edac 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -72,4 +72,13 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
>  
>  long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
>  
> +/**
> + * xe_guc_ct_wake_waiters() - GuC CT wake up waiters
> + * @guc: GuC CT object
> + */
> +static inline void xe_guc_ct_wake_waiters(struct xe_guc_ct *ct)
> +{
> +	wake_up_all(&ct->wq);
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 59371b7cc8a4..b2ca4911efe9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -27,7 +27,6 @@
>  #include "xe_gt.h"
>  #include "xe_gt_clock.h"
>  #include "xe_gt_printk.h"
> -#include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
>  #include "xe_guc_capture.h"
>  #include "xe_guc_ct.h"
> @@ -702,6 +701,11 @@ static u32 wq_space_until_wrap(struct xe_exec_queue *q)
>  	return (WQ_SIZE - q->guc->wqi_tail);
>  }
>  
> +static bool vf_recovery(struct xe_guc *guc)
> +{
> +	return xe_gt_recovery_pending(guc_to_gt(guc));
> +}
> +
>  static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> @@ -711,7 +715,7 @@ static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
>  
>  #define AVAILABLE_SPACE \
>  	CIRC_SPACE(q->guc->wqi_tail, q->guc->wqi_head, WQ_SIZE)
> -	if (wqi_size > AVAILABLE_SPACE) {
> +	if (wqi_size > AVAILABLE_SPACE && !vf_recovery(guc)) {
>  try_again:
>  		q->guc->wqi_head = parallel_read(xe, map, wq_desc.head);
>  		if (wqi_size > AVAILABLE_SPACE) {
> @@ -910,9 +914,10 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  	ret = wait_event_timeout(guc->ct.wq,
>  				 (!exec_queue_pending_enable(q) &&
>  				  !exec_queue_pending_disable(q)) ||
> -					 xe_guc_read_stopped(guc),
> +					 xe_guc_read_stopped(guc) ||
> +					 vf_recovery(guc),
>  				 HZ * 5);
> -	if (!ret) {
> +	if (!ret && !vf_recovery(guc)) {
>  		struct xe_gpu_scheduler *sched = &q->guc->sched;
>  
>  		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
> @@ -1015,6 +1020,10 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  	bool wedged = false;
>  
>  	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
> +
> +	if (vf_recovery(guc))
> +		return;
> +
>  	trace_xe_exec_queue_lr_cleanup(q);
>  
>  	if (!exec_queue_killed(q))
> @@ -1047,7 +1056,11 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  		 */
>  		ret = wait_event_timeout(guc->ct.wq,
>  					 !exec_queue_pending_disable(q) ||
> -					 xe_guc_read_stopped(guc), HZ * 5);
> +					 xe_guc_read_stopped(guc) ||
> +					 vf_recovery(guc), HZ * 5);
> +		if (vf_recovery(guc))
> +			return;
> +
>  		if (!ret) {
>  			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
>  				   q->guc->id);
> @@ -1137,8 +1150,9 @@ static void enable_scheduling(struct xe_exec_queue *q)
>  
>  	ret = wait_event_timeout(guc->ct.wq,
>  				 !exec_queue_pending_enable(q) ||
> -				 xe_guc_read_stopped(guc), HZ * 5);
> -	if (!ret || xe_guc_read_stopped(guc)) {
> +				 xe_guc_read_stopped(guc) ||
> +				 vf_recovery(guc), HZ * 5);
> +	if ((!ret && !vf_recovery(guc)) || xe_guc_read_stopped(guc)) {
>  		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
>  		set_exec_queue_banned(q);
>  		xe_gt_reset_async(q->gt);
> @@ -1209,7 +1223,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * list so job can be freed and kick scheduler ensuring free job is not
>  	 * lost.
>  	 */
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags) ||
> +	    vf_recovery(guc))
>  		return DRM_GPU_SCHED_STAT_NO_HANG;
>  
>  	/* Kill the run_job entry point */
> @@ -1261,7 +1276,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  			ret = wait_event_timeout(guc->ct.wq,
>  						 (!exec_queue_pending_enable(q) &&
>  						  !exec_queue_pending_disable(q)) ||
> -						 xe_guc_read_stopped(guc), HZ * 5);
> +						 xe_guc_read_stopped(guc) ||
> +						 vf_recovery(guc), HZ * 5);
> +			if (vf_recovery(guc))
> +				goto handle_vf_resume;
>  			if (!ret || xe_guc_read_stopped(guc))
>  				goto trigger_reset;
>  
> @@ -1286,7 +1304,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  		smp_rmb();
>  		ret = wait_event_timeout(guc->ct.wq,
>  					 !exec_queue_pending_disable(q) ||
> -					 xe_guc_read_stopped(guc), HZ * 5);
> +					 xe_guc_read_stopped(guc) ||
> +					 vf_recovery(guc), HZ * 5);
> +		if (vf_recovery(guc))
> +			goto handle_vf_resume;
>  		if (!ret || xe_guc_read_stopped(guc)) {
>  trigger_reset:
>  			if (!ret)
> @@ -1391,6 +1412,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * some thought, do this in a follow up.
>  	 */
>  	xe_sched_submission_start(sched);
> +handle_vf_resume:
>  	return DRM_GPU_SCHED_STAT_NO_HANG;
>  }
>  
> @@ -1487,11 +1509,17 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
>  
>  static void __suspend_fence_signal(struct xe_exec_queue *q)
>  {
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +
>  	if (!q->guc->suspend_pending)
>  		return;
>  
>  	WRITE_ONCE(q->guc->suspend_pending, false);
> -	wake_up(&q->guc->suspend_wait);
> +	if (IS_SRIOV_VF(xe))
> +		wake_up_all(&guc->ct.wq);

maybe xe_guc_ct_wake_waiters() ?

and I guess some small in source comment why we differentiate between VF and !VF case would be beneficial

> +	else
> +		wake_up(&q->guc->suspend_wait);
>  }
>  
>  static void suspend_fence_signal(struct xe_exec_queue *q)
> @@ -1512,8 +1540,9 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>  
>  	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
>  	    exec_queue_enabled(q)) {
> -		wait_event(guc->ct.wq, (q->guc->resume_time != RESUME_PENDING ||
> -			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q));
> +		wait_event(guc->ct.wq, vf_recovery(guc) ||
> +			   ((q->guc->resume_time != RESUME_PENDING ||
> +			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q)));
>  
>  		if (!xe_guc_read_stopped(guc)) {
>  			s64 since_resume_ms =
> @@ -1640,7 +1669,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  
>  	q->entity = &ge->entity;
>  
> -	if (xe_guc_read_stopped(guc))
> +	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
>  		xe_sched_stop(sched);
>  
>  	mutex_unlock(&guc->submission_state.lock);
> @@ -1786,6 +1815,7 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>  static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
>  	int ret;
>  
>  	/*
> @@ -1793,11 +1823,22 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  	 * suspend_pending upon kill but to be paranoid but races in which
>  	 * suspend_pending is set after kill also check kill here.
>  	 */
> -	ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
> -					       !READ_ONCE(q->guc->suspend_pending) ||
> -					       exec_queue_killed(q) ||
> -					       xe_guc_read_stopped(guc),
> -					       HZ * 5);
> +	if (IS_SRIOV_VF(xe))
> +		ret = wait_event_interruptible_timeout(guc->ct.wq,
> +						       !READ_ONCE(q->guc->suspend_pending) ||
> +						       exec_queue_killed(q) ||
> +						       xe_guc_read_stopped(guc) ||
> +						       vf_recovery(guc),
> +						       HZ * 5);
> +	else
> +		ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
> +						       !READ_ONCE(q->guc->suspend_pending) ||
> +						       exec_queue_killed(q) ||
> +						       xe_guc_read_stopped(guc),
> +						       HZ * 5);

nit: maybe both magic 5sec timeouts deserve some comment?
> +
> +	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
> +		return -EAGAIN;
>  
>  	if (!ret) {
>  		xe_gt_warn(guc_to_gt(guc),
> @@ -1905,8 +1946,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>  {
>  	int ret;
>  
> -	if (xe_gt_WARN_ON(guc_to_gt(guc),
> -			  xe_gt_sriov_vf_recovery_pending(guc_to_gt(guc))))
> +	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
>  		return 0;
>  
>  	if (!guc->submission_state.initialized)
> diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
> index 83fbeea5aa20..7f587ca3947d 100644
> --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
> +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
> @@ -8,6 +8,8 @@
>  #include <linux/slab.h>
>  
>  #include "xe_exec_queue.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc_exec_queue_types.h"
>  #include "xe_vm.h"
>  
>  static void preempt_fence_work_func(struct work_struct *w)
> @@ -22,6 +24,15 @@ static void preempt_fence_work_func(struct work_struct *w)
>  	} else if (!q->ops->reset_status(q)) {
>  		int err = q->ops->suspend_wait(q);
>  
> +		if (err == -EAGAIN) {
> +			xe_gt_dbg(q->gt, "PREEMPT FENCE RETRY guc_id=%d",
> +				  q->guc->id);
> +			queue_work(q->vm->xe->preempt_fence_wq,
> +				   &pfence->preempt_work);
> +			dma_fence_end_signalling(cookie);
> +			return;
> +		}
> +
>  		if (err)
>  			dma_fence_set_error(&pfence->base, err);
>  	} else {

just few suggestions, but overall LGTM, trusting you (and CI) that it works, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


