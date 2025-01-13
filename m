Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AACDC02180
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jan 2025 23:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6699C10E2B5;
	Mon, 13 Jan 2025 23:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TWG/Npz+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BA310E2B5
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jan 2025 23:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736809849; x=1768345849;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=foJq/w+Bd+/Fq1Wi+45Uk2SLz0QUxZxSBqvo+AnIj38=;
 b=TWG/Npz+k1dHLowcIWdmnCDRpAKM0jbCpQfRGfZ6unb+HpseKXgFVim4
 vNy/rvdsHkJIDeai2khStJoP1khgZ9pb/ro87Vzgu0qLOSRnxqIMZg7bu
 N70ByeG8E1gCZDDMvR+pnZ3m3vP0+Xxu/GiRs1zd2WQok0p9f0T+3ye1v
 Kd/Jjsgis11bc6JjMacpFyNRvZel90H0/qKLflTu2xGiNNiI9lF3CWsSP
 P61TkNGQyGJ1tRWoYkdXXtbGNvVKGERG6NjDryIgqYaPitfD/jYyrez5d
 qTLzkIxMaK9ErXe+gX0jZi9fYi4Q/bngbqhMTlvKnZImhUOPChJ15zw1Y A==;
X-CSE-ConnectionGUID: Af7PBgbtTdWJh7GWgkozOw==
X-CSE-MsgGUID: wsIwX9h4RsKcy9/ZZrsm7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36780370"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="36780370"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 15:10:49 -0800
X-CSE-ConnectionGUID: DYflcPK9RXOSlgIe7xHp2Q==
X-CSE-MsgGUID: 9YXPybaITKqlDb/U70S3JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="104708744"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 15:10:48 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 15:10:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 15:10:47 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 15:10:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oS/g+hL0DQcSEdokCpspC9cNNE1QDJ0Sg5nKJjYEkKUFEQ4nSeD8WSS5SVDRRzRR7J/DLccTtFnJ8DVzF2ISVfllHFiG3PZxqHNW43H8/zMTxT5500+bZeeqpE3pqcO1vmnlI33zvaIauKfAXCWBxNkm1pPUadgRapq8z6sNKnZHz3Iq+cwvNH8snnSgNOtql7ImFxHYnEzFCWf8bLUyAp47yLhIlENocWeIs5DMBhyLCVVwUWJnvUTI8XBJk98/8GVobGtAathj736C/Qygw+1Yz95iR3X4ksE4XgxVVhTvKwWgC7WAppf4Wm3/ay9Eb1+mFAqG6jQC8Dx8ohqkZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTmNMJ3CC4lgT90bt9vLv2d2C/YyqUwDRG5mVhd3N5A=;
 b=ccRyDNahAR7Bq10R+EoRl+Z0+hA//GL7eV0XDiFd41EWr8Je/DPRN4C8wCtRJK1bH3w3VII2CTQLLxXiXX8os9MIP1qEDIU3IGNPzNsQxE6p/0egodKpXASxjzHw4F0VSMIMGo46N94+yUYv5gJjQcvT2d8elqkQ1eUxxySCglTBAFd9EJyymNZgaG/ZhFgH2bgGm/q+hAVm0w3muvrVmsXh+T43nKLsUfol8ABAbxgWO/DcvhbkuFpOvEkxlTNod5fS5y9+pHgzuChm799VPqYb8gAfMHNwajfituCHNW43Khz0XVl0vcVKR1uMg31J5NoET44DzFAuijwKHK1bSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH2PR11MB8866.namprd11.prod.outlook.com (2603:10b6:610:281::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 23:10:04 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 23:10:04 +0000
Message-ID: <02f87f0d-b66d-4d45-a105-2818aaed5c2f@intel.com>
Date: Mon, 13 Jan 2025 15:10:01 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] drm/xe/pxp: add PXP PM support
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250106211212.3418231-1-daniele.ceraolospurio@intel.com>
 <20250106211212.3418231-12-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250106211212.3418231-12-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0318.namprd04.prod.outlook.com
 (2603:10b6:303:82::23) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH2PR11MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: f21ff723-8bbf-4a79-1757-08dd342769ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUc3aHdhOUQzZGd6eTFQZ1FDWkRZaERLeFViOFhXcERlYkdnRisvcXNzSVRM?=
 =?utf-8?B?VXpSaksySjBwSlpmY20rVy8vTlJkV3o2UEdaU2FRaTV1N20yajdnT2l4bEUr?=
 =?utf-8?B?TENBWEpVOWwwS2JkRjZEQ0JGRVJOUlBLK3U5UkdEd1dqb0o3L1dDSjQ4dzVt?=
 =?utf-8?B?TVBHYU1XODNMajk5bktaZW1ENzg3WDVxd09Ca0E3RGd6NjFlTlNNTFRHQ3hs?=
 =?utf-8?B?dTIvSzRtWXZvZC9ScHI3cVc5aVh4M1FnSGE2c3IzMjdGb1dMZzFDTEpVd29C?=
 =?utf-8?B?cU5Jb2I1RHduNGthSCtSQkNaZ1VMaUpoWEMwK3QyQ0Jwbi9BNWh4dlFaMzQz?=
 =?utf-8?B?a0I0MFNURWZ0c3JCS2dEMGo3dm05b05leHV0ZUNMNnZWNXF5Q29ZbXBjQW9C?=
 =?utf-8?B?dE4reGNkWTFTS0NXS091NHNaalNTR3lLL0ltSDhuMXJqaUEzSzdJbWpVZHVx?=
 =?utf-8?B?Z2xuREkwOG0rWkd3MGRkTSt5NzdHdm43bHAwQmc1a1BjeWhMOGNzdXR2R3NG?=
 =?utf-8?B?bXZjK1lQaWhkM3djazJQaTNpMlJJVHdGZ2lwMld4MUF4Sm4xK1RTL3pPZ3Ey?=
 =?utf-8?B?b2s4a3ltVE5mTFJob1Fjd1htZEdPYlB6S0RKekxwUUdMREZleS9oV1pUM3NH?=
 =?utf-8?B?NnNid2p2NFRrdnNkTUNJRndrS2lEQWQvQlgxcG1yN09XeGFEWUd1cVRFZitU?=
 =?utf-8?B?ZzBkVXhIdHlsRTdxVEFZQis5RzZTRmZMenpGUG1ZeFZEVWhuV1JIN01LaFBZ?=
 =?utf-8?B?OUxPalR3STdNbEFmQ3J5NWcycnJWRW8yeThlYzZoYllLM202S3dqRDkyZDJZ?=
 =?utf-8?B?dzVDNmZrT3dhK09HQTFidnB3cEJoa3ZwNHovbEJhZUI1V3RweENFUWp3QzY5?=
 =?utf-8?B?THphamJUWDBMSlZXbzZRaXJ5QXMrY2lWM3Y5TlZEZU54YTBTUWFBZ0hTeEdV?=
 =?utf-8?B?bndwa2J0NU5lcmEwVmtMUm5GbUJwN0t6Q2xUUHdadEtISTY1T0JFcjVQYVlu?=
 =?utf-8?B?UEFmQWlISkx3cHdSL1h3NWlUUExienZRQ2pxWGxWVjZQa0ZtOHl0UUZldVhx?=
 =?utf-8?B?RTk3cmZGbjllZGZhaWVXQk1lZk5lYkRXOHVTUVNlcm9tVXBEcDQ3Sy90N2Ur?=
 =?utf-8?B?YW1LcGxUK2JBWForMlZ2aVBnOCt1NTYra0pMZWorZ1E3cXQ0RFduNzFRcTd0?=
 =?utf-8?B?MDRQZXhaYXdRZG9obVphVEdpbHlJUVNYYVFyTjJVSFpPSVFyNFlqYUxWZk1E?=
 =?utf-8?B?dkNCU2RuaDVZdXlxRXpCN3JMcnhLekFOR3lQYWk3a3F3MGFZZUtHWUhGaEQ5?=
 =?utf-8?B?b1pvV2N3ejhqLzE1dEVtZWRiQThMeko1UU1sNTFKWks0eEs3UHhNTFRHTFFE?=
 =?utf-8?B?Y1ZkVWV6ZzlxdnRNc2RZSHZDK0FScGk4RWhzZXlvY2RXd1JXZFBTZzRNWDk4?=
 =?utf-8?B?TmFJQzZHTFZOS2FqVk4zNTFPeWYzSUhGMHo5UHlkendKclNSYnpjVDZnWXZL?=
 =?utf-8?B?dytwVVF5Z0ZHbDFLVGNPUCs3Skx4a0t6dWdXbDRrZ3J3L0NzUm1uelVObStQ?=
 =?utf-8?B?cWpLL1UzZWFaaE1DSDVJT0EzU05LeU9iYWs4eHJVODd3dUVJb093eVgyWjlQ?=
 =?utf-8?B?c2ZudlkzenpQek9OTFpuaFpCbUozSXd3Y3orNG9OSEdxdDRCY2twZ3BXZEUz?=
 =?utf-8?B?V2F4Znp0ZGViMk11d3VqZGwzemY5TTNONlMyR1Z5TmhlWmRzRWlJUnBmOHZq?=
 =?utf-8?B?VDFnVFJpMCtSOG4rV0wydDZmaS9hVEkwRDFvelJ5RE0yUjJkTU9tZmtUTktY?=
 =?utf-8?B?anJNaC9wV1RzbW0yZkN5N2IrQ1Y3c3k0cktUY1RHVmYwMlhxM25nbUMyYXE0?=
 =?utf-8?Q?7Eh5bPMNaOYmD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVY3Z1FIME15M1BLc3luTHBUdS9pYVp3cWFTWE9YWkFBM1VMRGpkNzNQYll2?=
 =?utf-8?B?YmtTZU5jYVNaRFM2cTZNS1VhNXQvM3BNeEU5Lys1cVM3cGpsbEtRYWg0N04r?=
 =?utf-8?B?WU1sd1RpQkZIWG1rUUw5SVFKRmc4YTRiTENBVEJPekgrN3gvKzA3R2s5ZzFF?=
 =?utf-8?B?M3RqTm5UVTZKUVA0WXVsYitkalJWUXFOdUZ2OWF3YXV2NktEWmFPN01UMS8x?=
 =?utf-8?B?MGdRZFBmNmRFTk91YjdSNXU5b0dIU2tXbFd6SmlZYVUzdVJZcWx2Q0ZoZFV4?=
 =?utf-8?B?OXVYL3o0dEZMeUcrT1FXcjB4MGh5eExwS3RacnY4aUk5Ui8vbVVCT25QS0hK?=
 =?utf-8?B?MjBzVzhuekl0eWdIQkVkTmQrNDZKT2ZnY1VpWVA0TW55U1pPa0poMlhPOW8v?=
 =?utf-8?B?UTFrQW9iaVFxb3hicFVoWnVHQnZhNXpXRDdHak5ROXFXdERHcEU0b2tudlBD?=
 =?utf-8?B?b0xlNnhDbThoQXFuWmdYVzI2UXp3cmZGYlYycDZCeGY2aE9tbjF6VTV3OE1o?=
 =?utf-8?B?dG9jRGlwZ0xscjVZenVYeFNleGtYRUJ2elQ0QlJLbFYxVkh3VUNJRVcveU1C?=
 =?utf-8?B?SWRweHM5SEdzLytRdUtINTZ0MVNlWFVkWGxVWEJEcS94MjRHUTVuRWtrcDZW?=
 =?utf-8?B?V3d2UzZZdjZiMDl3dStGdUtVdEJvYy9JQmZlYzFqcENJWDgwLzhPRURucG4v?=
 =?utf-8?B?Wk9oVXJjOUwrK3MzQ2ZwV0g0bFMzSjhFeVFncFJjanJCM2NMY0d5YXFTWm0r?=
 =?utf-8?B?NXNEUjgvVlhPazJtN3lWVThKSjFTcHJPaGNWRWVRL3ZTMkg1NEY5b2VIOXZM?=
 =?utf-8?B?bFN6UE9BMnFWMWtUSmo2eEtxeEphaG5qUHZDb0UzSTZCLzJuN2RURm82RUlS?=
 =?utf-8?B?MjdsT3dDV0lQKzAzREVBT09zK096SGYwOG92UkcyR21VTGx4cktOaHF1YkpD?=
 =?utf-8?B?R21sc3hvaEhqWEo4ZUhSKzZtNVQ5dTFlRFFuZkVyZk1LZzZyMU5FVk5EbUlv?=
 =?utf-8?B?L3FwVXg0eW54SXRKSEhZYWVGVGhSTGhnUy9GbzNaRURaNjhFdlh5WUI5cWc5?=
 =?utf-8?B?MlY0U0V5Uy9lcE1zMGdOaFdvemYvNTlYaXBjZHNRTUVsMzlxVWlKWDBlWXNP?=
 =?utf-8?B?aHJobzNnUkNRL3BJY2NwYTM5YWI0cklhNnlLMmNwYjB5SjdMYm8xaGpabjVo?=
 =?utf-8?B?cExYTktNNWYxeDFyZHl4TGpWTkxyRGppM2FjT1NEcUM5TXZzQTE0MnNRbklU?=
 =?utf-8?B?dVdFMnpBMmlBekc0dnA1ZW9PT29FL1J0eHJXVEdKcFJrUkl3YU5aNi90UDZy?=
 =?utf-8?B?OHo0UHVBT29JZ2w0N2xuM01OVWZPMDNTUVpJRHhHdDhjNVNweW1LRUtsKzZI?=
 =?utf-8?B?SG9EbGRFVXRVRnJERjNnUzFTdjVMVW45QUtRSm5UajJubTliOHpBblRSWHA5?=
 =?utf-8?B?MUwyTnBlVkVpWXZFYzZPblI2TTVFb01taEJ6KzZOUVlEZlVFemlRTlBTcUxp?=
 =?utf-8?B?cUZET24wRGROL1QvN0tBZlhWNFNJVVhPaWFReE5yejIrSEVEMWtHQWZpT0xG?=
 =?utf-8?B?ZFNxaDBlbWFoMEhlNWRicFpJZFpGd2RhVnRVZ0NyWWlITDl5bDVjMTJobnNu?=
 =?utf-8?B?Sy95SExBbVBjcTJRMFpTZjZuZmdwaksrUkdHbEVRaDBMaklTcUVsbU8rSWFp?=
 =?utf-8?B?NjQ5bzNUUUhIM2kzeDFGYWJ3U0RZYlJKc3hCNkdPSzFvWU84UzZod2RsUmEv?=
 =?utf-8?B?NlpVZ0xLajBqL083OGsrejJ1WnhOZk8yWWE2c0lJZWRla2QzTU1qVkFhMnMw?=
 =?utf-8?B?ZnlubERPZjg5VWluNVpRdHFwODhJNVR3YXVOYmhYdFdNQ2k2UlBRVlFOVU9W?=
 =?utf-8?B?TDRCb2RHV3MrMVFBemN0emU0VFFTZDBkTzdiM2dwRFNMcDd3c0hxSmM1eDh4?=
 =?utf-8?B?NGtocjI3amhGdGYrOWpYVFdVU0l3RVFiSWZqVE5DWG1EVU9GY0NUNnBmcmow?=
 =?utf-8?B?SlBsbi9WcjY1b1JhaFdlTUNZMmtwL3hoTnUxQXFjeU4xNkhDSVhTVUVMVjg0?=
 =?utf-8?B?bStqNithd3hqWWZGZGtuYUhlbmpOdVVHZDEzVWZMcXQ2emd6cWd0RmxoR1Q4?=
 =?utf-8?B?VHp5Ryt4aWd5Z2liUW90Wi93UmFjQVp6NHNvUVZJWmNLSUNFeEswS2c1OEhF?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f21ff723-8bbf-4a79-1757-08dd342769ba
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 23:10:04.0572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ChEFBTdQFvYkvhP99gsOXr5cIaa6+z8t7kSJC2Rak9QAzGHRovmpVMd4BzlHI46wR93g2GHKuYX9rw6YmAaDinnloruTrBx46DfCCJoZsYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8866
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

On 1/6/2025 13:12, Daniele Ceraolo Spurio wrote:
> The HW suspend flow kills all PXP HWDRM sessions, so we need to mark all
> the queues and BOs as invalid and do a full termination when PXP is next
> used.
>
> v2: rebase
> v3: rebase on new status flow, defer termination to next PXP use as it
> makes things much easier and allows us to use the same fuction for all
> types of suspend.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c        |  39 ++++++---
>   drivers/gpu/drm/xe/xe_pxp.c       | 128 +++++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pxp.h       |   3 +
>   drivers/gpu/drm/xe/xe_pxp_types.h |   7 ++
>   4 files changed, 164 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index c6e57af0144c..bfd797516a7c 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -22,6 +22,7 @@
>   #include "xe_guc.h"
>   #include "xe_irq.h"
>   #include "xe_pcode.h"
> +#include "xe_pxp.h"
>   #include "xe_trace.h"
>   #include "xe_wa.h"
>   
> @@ -122,6 +123,10 @@ int xe_pm_suspend(struct xe_device *xe)
>   	drm_dbg(&xe->drm, "Suspending device\n");
>   	trace_xe_pm_suspend(xe, __builtin_return_address(0));
>   
> +	err = xe_pxp_pm_suspend(xe->pxp);
> +	if (err)
> +		goto err;
> +
>   	for_each_gt(gt, xe, id)
>   		xe_gt_suspend_prepare(gt);
>   
> @@ -130,14 +135,12 @@ int xe_pm_suspend(struct xe_device *xe)
>   	/* FIXME: Super racey... */
>   	err = xe_bo_evict_all(xe);
>   	if (err)
> -		goto err;
> +		goto err_pxp;
>   
>   	for_each_gt(gt, xe, id) {
>   		err = xe_gt_suspend(gt);
> -		if (err) {
> -			xe_display_pm_resume(xe);
> -			goto err;
> -		}
> +		if (err)
> +			goto err_display;
>   	}
>   
>   	xe_irq_suspend(xe);
> @@ -146,6 +149,11 @@ int xe_pm_suspend(struct xe_device *xe)
>   
>   	drm_dbg(&xe->drm, "Device suspended\n");
>   	return 0;
> +
> +err_display:
> +	xe_display_pm_resume(xe);
> +err_pxp:
> +	xe_pxp_pm_resume(xe->pxp);
>   err:
>   	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
>   	return err;
> @@ -195,6 +203,8 @@ int xe_pm_resume(struct xe_device *xe)
>   	if (err)
>   		goto err;
>   
> +	xe_pxp_pm_resume(xe->pxp);
> +
>   	drm_dbg(&xe->drm, "Device resumed\n");
>   	return 0;
>   err:
> @@ -389,6 +399,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	 */
>   	xe_rpm_lockmap_acquire(xe);
>   
> +	err = xe_pxp_pm_suspend(xe->pxp);
> +	if (err)
> +		goto out;
> +
>   	/*
>   	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
>   	 * also checks and delets bo entry from user fault list.
> @@ -404,22 +418,27 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	if (xe->d3cold.allowed) {
>   		err = xe_bo_evict_all(xe);
>   		if (err)
> -			goto out;
> +			goto out_resume;
>   	}
>   
>   	for_each_gt(gt, xe, id) {
>   		err = xe_gt_suspend(gt);
>   		if (err)
> -			goto out;
> +			goto out_resume;
>   	}
>   
>   	xe_irq_suspend(xe);
>   
>   	xe_display_pm_runtime_suspend_late(xe);
>   
> +	xe_rpm_lockmap_release(xe);
> +	xe_pm_write_callback_task(xe, NULL);
> +	return 0;
> +
> +out_resume:
> +	xe_display_pm_runtime_resume(xe);
> +	xe_pxp_pm_resume(xe->pxp);
>   out:
> -	if (err)
> -		xe_display_pm_runtime_resume(xe);
>   	xe_rpm_lockmap_release(xe);
>   	xe_pm_write_callback_task(xe, NULL);
>   	return err;
> @@ -472,6 +491,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   			goto out;
>   	}
>   
> +	xe_pxp_pm_resume(xe->pxp);
> +
>   out:
>   	xe_rpm_lockmap_release(xe);
>   	xe_pm_write_callback_task(xe, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index ae45c663b81d..0a36d40152d1 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -132,6 +132,14 @@ static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
>   
>   static void pxp_invalidate_queues(struct xe_pxp *pxp);
>   
> +static void pxp_invalidate_state(struct xe_pxp *pxp)
> +{
> +	pxp_invalidate_queues(pxp);
> +
> +	if (pxp->status == XE_PXP_ACTIVE)
> +		pxp->key_instance++;
> +}
> +
>   static int pxp_terminate_hw(struct xe_pxp *pxp)
>   {
>   	struct xe_gt *gt = pxp->gt;
> @@ -185,10 +193,16 @@ static void pxp_terminate(struct xe_pxp *pxp)
>   
>   	mutex_lock(&pxp->mutex);
>   
> -	pxp_invalidate_queues(pxp);
> +	pxp_invalidate_state(pxp);
>   
> -	if (pxp->status == XE_PXP_ACTIVE)
> -		pxp->key_instance++;
> +	/*
> +	 * we'll mark the status as needing termination on resume, so no need to
> +	 * emit a termination now.
> +	 */
> +	if (pxp->status == XE_PXP_SUSPENDED) {
> +		mutex_unlock(&pxp->mutex);
> +		return;
> +	}
>   
>   	/*
>   	 * If we have a termination already in progress, we need to wait for
> @@ -219,11 +233,13 @@ static void pxp_terminate(struct xe_pxp *pxp)
>   static void pxp_terminate_complete(struct xe_pxp *pxp)
>   {
>   	/*
> -	 * We expect PXP to be in one of 2 states when we get here:
> +	 * We expect PXP to be in one of 3 states when we get here:
>   	 * - XE_PXP_TERMINATION_IN_PROGRESS: a single termination event was
>   	 * requested and it is now completing, so we're ready to start.
>   	 * - XE_PXP_NEEDS_ADDITIONAL_TERMINATION: a second termination was
>   	 * requested while the first one was still being processed.
> +	 * - XE_PXP_SUSPENDED: PXP is now suspended, so we defer everything to
> +	 * when we come back on resume.
>   	 */
>   	mutex_lock(&pxp->mutex);
>   
> @@ -234,6 +250,9 @@ static void pxp_terminate_complete(struct xe_pxp *pxp)
>   	case XE_PXP_NEEDS_ADDITIONAL_TERMINATION:
>   		pxp->status = XE_PXP_NEEDS_TERMINATION;
>   		break;
> +	case XE_PXP_SUSPENDED:
> +		/* Nothing to do */
> +		break;
>   	default:
>   		drm_err(&pxp->xe->drm,
>   			"PXP termination complete while status was %u\n",
> @@ -391,6 +410,7 @@ int xe_pxp_init(struct xe_device *xe)
>   	pxp->gt = gt;
>   
>   	pxp->key_instance = 1;
> +	pxp->last_suspend_key_instance = 1;
>   
>   	/*
>   	 * we'll use the completions to check if there is an action pending,
> @@ -574,6 +594,7 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   		XE_WARN_ON(completion_done(&pxp->termination));
>   		mutex_unlock(&pxp->mutex);
>   		goto wait_for_idle;
> +	case XE_PXP_SUSPENDED:
>   	default:
>   		drm_err(&pxp->xe->drm, "unexpected state during PXP start: %u\n", pxp->status);
>   		ret = -EIO;
> @@ -779,3 +800,102 @@ int xe_pxp_obj_key_check(struct xe_pxp *pxp, struct drm_gem_object *obj)
>   {
>   	return xe_pxp_bo_key_check(pxp, gem_to_xe_bo(obj));
>   }
> +
> +/**
> + * xe_pxp_pm_suspend - prepare PXP for HW suspend
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + *
> + * Checks whether a BO was encrypted with the current key or an obsolete one.
No it doesn't! Cut and paste from a previous function?

With a more accurate description:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> + *
> + * Returns: 0 if successful, a negative errno value otherwise.
> + */
> +int xe_pxp_pm_suspend(struct xe_pxp *pxp)
> +{
> +	int ret = 0;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return 0;
> +
> +wait_for_activation:
> +	if (!wait_for_completion_timeout(&pxp->activation,
> +					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
> +		ret = -ETIMEDOUT;
> +
> +	mutex_lock(&pxp->mutex);
> +
> +	switch (pxp->status) {
> +	case XE_PXP_ERROR:
> +	case XE_PXP_READY_TO_START:
> +	case XE_PXP_SUSPENDED:
> +	case XE_PXP_TERMINATION_IN_PROGRESS:
> +	case XE_PXP_NEEDS_ADDITIONAL_TERMINATION:
> +		/*
> +		 * If PXP is not running there is nothing to cleanup. If there
> +		 * is a termination pending then no need to issue another one.
> +		 */
> +		break;
> +	case XE_PXP_START_IN_PROGRESS:
> +		mutex_unlock(&pxp->mutex);
> +		goto wait_for_activation;
> +	case XE_PXP_NEEDS_TERMINATION:
> +		/* If PXP was never used we can skip the cleanup */
> +		if (pxp->key_instance == pxp->last_suspend_key_instance)
> +			break;
> +		fallthrough;
> +	case XE_PXP_ACTIVE:
> +		pxp_invalidate_state(pxp);
> +		break;
> +	default:
> +		drm_err(&pxp->xe->drm, "unexpected state during PXP suspend: %u",
> +			pxp->status);
> +		ret = -EIO;
> +		goto out;
> +	}
> +
> +	/*
> +	 * We set this even if we were in error state, hoping the suspend clears
> +	 * the error. Worse case we fail again and go in error state again.
> +	 */
> +	pxp->status = XE_PXP_SUSPENDED;
> +
> +	mutex_unlock(&pxp->mutex);
> +
> +	/*
> +	 * if there is a termination in progress, wait for it.
> +	 * We need to wait outside the lock because the completion is done from
> +	 * within the lock
> +	 */
> +	if (!wait_for_completion_timeout(&pxp->termination,
> +					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
> +		ret = -ETIMEDOUT;
> +
> +	pxp->last_suspend_key_instance = pxp->key_instance;
> +
> +out:
> +	return ret;
> +}
> +
> +/**
> + * xe_pxp_pm_resume - re-init PXP after HW suspend
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + */
> +void xe_pxp_pm_resume(struct xe_pxp *pxp)
> +{
> +	int err;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return;
> +
> +	err = kcr_pxp_enable(pxp);
> +
> +	mutex_lock(&pxp->mutex);
> +
> +	xe_assert(pxp->xe, pxp->status == XE_PXP_SUSPENDED);
> +
> +	if (err)
> +		pxp->status = XE_PXP_ERROR;
> +	else
> +		pxp->status = XE_PXP_NEEDS_TERMINATION;
> +
> +	mutex_unlock(&pxp->mutex);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
> index 3dd70eac9da6..546b156d63aa 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.h
> +++ b/drivers/gpu/drm/xe/xe_pxp.h
> @@ -21,6 +21,9 @@ int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
>   int xe_pxp_init(struct xe_device *xe);
>   void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>   
> +int xe_pxp_pm_suspend(struct xe_pxp *pxp);
> +void xe_pxp_pm_resume(struct xe_pxp *pxp);
> +
>   int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type);
>   int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q);
>   void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> index 8e4569f0173d..53e9d48d10fb 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> @@ -27,6 +27,7 @@ enum xe_pxp_status {
>   	XE_PXP_READY_TO_START,
>   	XE_PXP_START_IN_PROGRESS,
>   	XE_PXP_ACTIVE,
> +	XE_PXP_SUSPENDED,
>   };
>   
>   /**
> @@ -123,6 +124,12 @@ struct xe_pxp {
>   	 * that case in the code.
>   	 */
>   	u32 key_instance;
> +	/**
> +	 * @last_suspend_key_instance: value of key_instance at the last
> +	 * suspend. Used to check if any PXP session has been created between
> +	 * suspend cycles.
> +	 */
> +	u32 last_suspend_key_instance;
>   };
>   
>   #endif /* __XE_PXP_TYPES_H__ */

