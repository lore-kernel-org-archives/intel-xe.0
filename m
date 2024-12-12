Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A97E77182
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 19:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAEF10E2C0;
	Thu, 12 Dec 2024 19:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVu/5ZvF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D4910E2C0
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Dec 2024 19:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734030872; x=1765566872;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wQtg/2b5jaGATGJAUe5x9vmHaJOX+Mi94AsHz3AxSZY=;
 b=dVu/5ZvFaGc9I7ZZ6LyvzUZJDSxAxfzeoLVYiMoJR4pKF0rBLNuOGimB
 tKoVHhCxAeGwdkxjuQAgGivIsr/tmqZe1+j4dLeajFauMLko1TzDgSnT2
 LSoP4WYF2mTJ6BwlOqiF6IQLGkJe1Mx375euLK1EBSV0KN7DtIr4TBV18
 DY/NKL0Ocg3SDfbPMuNIPWx3XcmTJJQ56S8yA/+UQuISc/MuNyzCH4APp
 +4eXeAk3DAkPyb8MoqogKXul95UcK1MrjiyxCqzx31rvQCue0N69xKTgZ
 OpyOYPrUAT5KwBno7YG6fKvzYFIVtpgJ4JSspgOKB3Irzf7Blv7mN6ptv A==;
X-CSE-ConnectionGUID: izM7Vv4SSZixo4YeL3zd8A==
X-CSE-MsgGUID: D23fNIF8TGClBzl1Rbea5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34196166"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="34196166"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 11:14:31 -0800
X-CSE-ConnectionGUID: kXtP1wJFSzO8DJU+oVi+fg==
X-CSE-MsgGUID: HEATM6iYQXy6IlB3Jl0MZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="96855743"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 11:14:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 11:14:30 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 11:14:30 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 11:14:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3UMPZTfA+HmCB+tiNRusPAsUBOnucnAH5k3eAnL3/MHbLsJqduKlEg2WDm9UegeTYTh908v5vnTmGi5jj5GC/D92Lq67K0OPrrCKNmzmoV9Iql2Dz73BTCtVup1G4inhGYFL4z8DcC6CNxIDxq88Iotjqcd90YIcM+GW4zqlHDmh6mPm2ieDkAD9O2tByn0iaJqBwz2BU3EhWJul0k2RJTIm1+lvz3kvJZ0c2jBABiVlV1BC19QSoA5Gn7TpGpaCZ3o+XBQ5ygyo5dZKSWxlp1m77E3bLUbjPefa/zIm+u7wRapHlZ4Hoye6YjmRYw6J9kilqWmjBaWR/08vbPZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtAAg9WjZM8j3Pr2e8ndAy4KpPFwA9gr0HtJYArf5yw=;
 b=pZO0ZzuZxHlQYiKyDAR76YJKXHX60QcoRnCsrerT8fKvVCHW4EW+YV2wj0GNcKGg6xN6DQ8YPUThfZWrW7+x365C3JOuAxAJLEyePKXRxdzadRxE6h4rZMHHBNCBJmpb3FAmIMg43STumRc7rnsbaA+EiRFwd0sofQU8YVNbzs2Ah7B+8UIAMWSWqZJAv2jmAcv52REV/Uc7IyWP5W/M6khI0ucoIMacuSAijHBISCrZlnU+9nZziUpZstdVmcYprT3DLvbcJKgZ32lD8omjokv7N/2BIIa7iNXKW4yYVZ60LcuQZ8vqE0Ileow1Ay+0BIS5zjHwBx11lbhwEjVpfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH0PR11MB7562.namprd11.prod.outlook.com (2603:10b6:510:287::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 19:14:26 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 19:14:25 +0000
Message-ID: <208f50d9-58e8-413e-915f-95ca077e0fa0@intel.com>
Date: Thu, 12 Dec 2024 11:14:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/11] drm/xe/devcoredump: Add ASCII85 dump helper
 function
To: Lucas De Marchi <lucas.demarchi@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>
CC: "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
 <20241003004611.2323493-5-John.C.Harrison@Intel.com>
 <ccc1066ab139e800cd8f67535c97aca486bf105d.camel@intel.com>
 <7qhmppwrqj5fsr3tkvufwua3iw7noadrefajrii66x7yydfeba@lqhgd7b5decp>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <7qhmppwrqj5fsr3tkvufwua3iw7noadrefajrii66x7yydfeba@lqhgd7b5decp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0317.namprd04.prod.outlook.com
 (2603:10b6:303:82::22) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH0PR11MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 4710925b-1581-487b-47f2-08dd1ae13178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGF3Q3VDL0ViajdKTERwRDJsSWZ0SjdGSVErSmY3L1RNMmVYL3JSaDJzdnYr?=
 =?utf-8?B?SjBXcm90SWJ2NWpGanNDNnhJaGhpQVFqSHZzRk9Vb0hxUVhYNTRUeENGakl5?=
 =?utf-8?B?TEh1YkxlL25jY05aRE4wZXVJQnNqd0hvU0QrTG5rZUt1eUdQOEhzdW1IQmg5?=
 =?utf-8?B?YVZtQ1VHekZVWlcvazgrVERTa0ozQUU0NmpaVG9QZllhN0k5aGFwRTUrR0tp?=
 =?utf-8?B?Y0orQXdrcG95YnVUYmNyZFgvbkJ2bThHWWJBZS9oak4zSWF3RmYzNmlNUDhQ?=
 =?utf-8?B?dTBMUTY3S3FwTitWR2tWRHRNVEFyOG5aczhIMXdXUlhvTXBWTlBidE12MlFH?=
 =?utf-8?B?dXpIRzlaTUpoSnJKNzBNVC84dTU3U0NaVmZ5TDlsV3hEQWNabEVhZUQrdmNN?=
 =?utf-8?B?azRTOHF4YTljMXhMTUs4WXUrNis3VmQwRE9QMXEzaWRjSlRmVGxrbmR6T1o1?=
 =?utf-8?B?RzRUZW5WUWNFRFhrVEVuYzhmN3dVN0Z5ZHliMTZiOWVydEQyREpsQjBYZFlS?=
 =?utf-8?B?YUdzcFZ1RXY4eU1xTGJJNjl5eTc1SXhGMzZnNVpRZ2JEbytMZ1A5M1cyeXZW?=
 =?utf-8?B?dmhsQnZkQmVRWlI1V3QvUDIrb0oyYk9SbHE3MjhQeXpnTzAyc2NMU0NPUEhF?=
 =?utf-8?B?K1NhTWcwQjlKaDdhNGFhcndXMkQ2aDFJV3BFb2ZhT0V1em9GWEE3Sm9CRFp3?=
 =?utf-8?B?dFBUaG9tZTVqUU9kcGYvZlN1VThYeGVXL2oyK3NLcWZWUWo4RXJKd0dUUkEv?=
 =?utf-8?B?MFhieitVbWJRdkFyZ2N3L3dCdEFqUkFrcEFTazhhaUViSVRnS1d6d0VzN0Vj?=
 =?utf-8?B?UW1IRkFxRURiVnQ4bVN4MkdXMnA1bG1hQmlaaU1wYjlYWndKKzQ0d1c4a2Rk?=
 =?utf-8?B?NUlRWkY2Z2kyR1FqVEZNNlR0VlZBbVllYmcwTmI5cUdzT3ZvWWtmQURVbzNl?=
 =?utf-8?B?RlFwWmpkNDNLSitZQ0ZJSDNEbXlvQXdLeHlqREVRMjFUaFBEblgwYmoxVVl2?=
 =?utf-8?B?MnZWZ01nNDFqUFV6bU9BOWZ3VU1YR2M1bUVNTkFNUWhwdVBnVXJnNHRxNFJQ?=
 =?utf-8?B?VWd4d2JnbWpBR1VFbTNWcFFiQy9wa0w5NFFYZTd3SXlHZ0MrQW9MTWVPc013?=
 =?utf-8?B?UkliNC9mWW0xTWh0ekF3dWt5T2pMVVZYTmJwMjlmSmhqaVU0eS9FRHRiclN2?=
 =?utf-8?B?UTJYQ1ExR2tEUmpWTG5Iak55WklKWG9zUnU2TWdzSGtKbkd2dEF3ODlpTjRt?=
 =?utf-8?B?ck9KV2s0VkJhZzd6bVBmRklrdWRmZmVwN1hDeXdGeTZhUDI0ZFpacGR0Sml0?=
 =?utf-8?B?a3IvV01YZzVtakNsRlJ3TmNsWjNYYURkWGlPT211ZW9nNVhNZHExWEo2a3d4?=
 =?utf-8?B?bXhZZWlobWxJZkN5SHh2MEpHUWRmeEsySS9CSlQwelUzSGxLQlNtMzZlcnhp?=
 =?utf-8?B?Q3RGVXJZTW5BZUp3OTNRcVdyMThjemNVWGdYVXQwbUZFZ2lKZm92RXg3NnZo?=
 =?utf-8?B?UjhxN3BOdzE1Qlg5VGsvN1psMW9yWDdSaVZGTFRxSDBJZjd6TFRvQkNHSU5X?=
 =?utf-8?B?Sk45akhnRi9XZGFpL0hmY3FTNE11TGs3c1VqbU5HQVJKRk5sMm9sa3ZvWGxv?=
 =?utf-8?B?dDNnR1hya2VGYmVZYTd0dGJWK1ZxZFZSL0xaUjFmdlNKdWF5OVd2MUJnL0JF?=
 =?utf-8?B?SDYrMWQyVy9YWUFGYjMrSXJLT2lMZWJoYVhVUURONmVWcEFKSXpjdnQvZVhW?=
 =?utf-8?B?MFpOVkNjSEUwMUFSWXFJbnJnSk1OblU1QytyQ3ZvWjNkbnVaSjVLQjd0enJB?=
 =?utf-8?Q?xmAbBBzrIy2djRoWAjXMq96qJdKvS0IgFYqt0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WW90ekxQSnFzSUlEcDViUkU5QmZLT0V2Z2hhbkpMY29oVXdGbElVTXpQZGN0?=
 =?utf-8?B?TU5hQWpDMVBtTDhkN0lIVUd2Z2YraVNuVDFvMmtNSWFLQ2tDT2h6bXhwbEtC?=
 =?utf-8?B?cXlzU1BIL3N1SEJZSTdSeVowWkszcDNYNFRRZFN4aXFLN09jZzc0K29XU1JF?=
 =?utf-8?B?bkRsV3VhMFRZSXYrYnRabCsveDVZS1gwanhiN0g0RHBkTjR4bjIrLytYVWww?=
 =?utf-8?B?Mm1iay84eWlNVHlXeUE5SzJnNWx0TjZhZ1lna3puOXJKc1JwRGg4dmRFb3Ni?=
 =?utf-8?B?bUdEVmZvamNlbndhTGU1TUZGTjNtK1FrSk9pUC9iNEkrWHNHQkRWd29JZzJL?=
 =?utf-8?B?WTdkRDdOUitVWk52OERFTGJOTUNta3lYZEl2NitEeVhBOFliaVcxb3E5d0xD?=
 =?utf-8?B?b1ZNUzIraG40TXVvNFk1ZkJkck15QWFxRHhRNzREOC9VK0pxZGxsZytMK0FP?=
 =?utf-8?B?UDRLZE5kUXNSWStZaUhKM3cxUzVtYW83eHZCQTVoSlV5SHdidVBCeUJCUDla?=
 =?utf-8?B?SXhNOWJTb0kvUkYwTDdDWVlwVkIyamZiMG1hdDdwbDRVNHhHOUpob0ZxODU5?=
 =?utf-8?B?M2FjNnlRa2gxR2dOL3FZbDB0KzYzUldwQkFSTWh2NTRNRm1xL2VvRFQrWW5O?=
 =?utf-8?B?c1MrWHoxQUZScUdlTlQzWlpXbnB4bWExRWdPRkVhY2xDQTRSelRtL0dxYXlm?=
 =?utf-8?B?YXFCYys1SThCV29WcDFmeU82V1RZZ1RXbE4xMkJXWk1PUk1hNnpuWi9FQ2o1?=
 =?utf-8?B?NDVTTTFSTzhTQnExbEw0aEkzYjJxUmpXYkV1RW1hRmY4TDVsZnM0dzkzT2pl?=
 =?utf-8?B?ckpBZlJnZ2xueE41a3ViTmRZWExpM2J2cXgyazBQaFpvVEtnNHNRV0Qxd1p0?=
 =?utf-8?B?RWpvSzZxT0lNNHJDdmhZcC9QZWJReDA1dDh2N2tjamNtYXJCQVdZSTFYZk9n?=
 =?utf-8?B?ZHE4a1MvcGx0cVNZN1ZZSkpBZEhITUNSMi9KZWc5bzhwUzZya3BabHB1WE1j?=
 =?utf-8?B?eXFGRHNRUDU1OVlaOGhsaS85MEdJZW0za1VsL1I5Mll2alg3YURsVHN4T0J0?=
 =?utf-8?B?SzJWc0NiVjh6R0k4VnRtUWRvYzMrRmhpcEQ4UC9mdGJvckVhSXRFVytlajhp?=
 =?utf-8?B?OExySXIyZjgrYmdKZ0p2eDFlNHRQQkxCM1laeVZXMVQyZWlvcHc4QmlTWkZz?=
 =?utf-8?B?QkRPWHVtOG40QitHRFhBdlJJeFozdTY3WVlRZ3ZJYSsxZXJWTlFWc3FzQnZ2?=
 =?utf-8?B?T3gzbjR3U3BtNEN5SWFSOWtoa1VuSnNMRjFWR0YvTkE3RlIxamFZcGhlRW1F?=
 =?utf-8?B?NDlIK3M5UDVMNjFMV3FncjdhQmxvdTJCOUlPT3FuVDZTMHN3TlE5R3d2KzVP?=
 =?utf-8?B?SjFhYXhXUmFFWTRxZ1N5VENKd0w3enhaT2VoYm1acFlYdk1xM3c2M0lHUWh3?=
 =?utf-8?B?NXlSZk9tdTJYWXh3N0xtWVpSZDhKNXBncGlZenNhQUhiTFQxQThQajFsbTY5?=
 =?utf-8?B?WFFYYjVtRHlEcS9UKzlsNU1ZZDdaUnZub0xwc3FoM0ZUNHlLM29yRG9Lam5I?=
 =?utf-8?B?ajltcjEzTm4rOWM2VUZLTlNKR3RYUnczZDI3WU1uc1ZhdVVpYm0wdzlORjFX?=
 =?utf-8?B?UnhNMWEybFI4RTJrRjdyWG1ZalVoVEg0eHNoeVFPbnFlZWtUZVoycjlTV3ZY?=
 =?utf-8?B?dFk0cmx3OURpeXRhSmQ0VjFrYjdKVEI4OXlmMjZPVlVNRnk1aEJZblZGVlBT?=
 =?utf-8?B?VVQ0R3BDL1lzRCt0WlA4L2NkazBpMEMxdDRiREdUWjRQNGRreTNGR2Exc1Jp?=
 =?utf-8?B?aG42ZHhqaWpXMEV1RFowVGVyWE9HZjE3RkhOYjdDanRvNFlZZHhJbERPb3Mw?=
 =?utf-8?B?YlFzaDZIay9oaHBuOWpLS3VIRE1GNVZPTzFEQzNMcTRzb2RGLzB6UklzM3NO?=
 =?utf-8?B?MkVYRVBLSlRUOWgrQitJZ2JZV3kxQ1FZZjJKbzhIS3F4NzA3VkJaMzlwVkFP?=
 =?utf-8?B?RlByUUNLZldiblkwY3hjSnhGVDR4cC9iMUVPd1J1Vm9XMFQxZERqQTFZK3Fr?=
 =?utf-8?B?ejh1N0FHaDJ5c1VyVzBIS3cySzlFOHpSNkYvNWxVeExVWjJaYlM5cUx3ck40?=
 =?utf-8?B?bHpDRTlFb3FmbjJLT2ZDRkdjdkEycENwcSt3NXV5NEtZUGhrUVVmYnZpajVn?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4710925b-1581-487b-47f2-08dd1ae13178
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 19:14:25.8239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iYc6Jn51IsCpuBt3zw3CyGc4uJGOO1MeHf02HsfED28AoCUh4baZVIZcwVUqIh7KQQ0jFJHyhU8kMFx/DqXrO16YpcboSajXXH+kWV5oDps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7562
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

On 12/12/2024 10:45, Lucas De Marchi wrote:
> On Thu, Dec 12, 2024 at 05:41:41PM +0000, Jose Souza wrote:
>> On Wed, 2024-10-02 at 17:46 -0700, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> There is a need to include the GuC log and other large binary objects
>>> in core dumps and via dmesg. So add a helper for dumping to a printer
>>> function via conversion to ASCII85 encoding.
>>>
>>> Another issue with dumping such a large buffer is that it can be slow,
>>> especially if dumping to dmesg over a serial port. So add a yield to
>>> prevent the 'task has been stuck for 120s' kernel hang check feature
>>> from firing.
>>>
>>> v2: Add a prefix to the output string. Fix memory allocation bug.
>>> v3: Correct a string size calculation and clean up a define (review
>>> feedback from Julia F).
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_devcoredump.c | 87 +++++++++++++++++++++++++++++
>>>  drivers/gpu/drm/xe/xe_devcoredump.h |  6 ++
>>>  2 files changed, 93 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>>> index 2690f1d1cde4..0884c49942fe 100644
>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>> @@ -6,6 +6,7 @@
>>>  #include "xe_devcoredump.h"
>>>  #include "xe_devcoredump_types.h"
>>>
>>> +#include <linux/ascii85.h>
>>>  #include <linux/devcoredump.h>
>>>  #include <generated/utsrelease.h>
>>>
>>> @@ -315,3 +316,89 @@ int xe_devcoredump_init(struct xe_device *xe)
>>>  }
>>>
>>>  #endif
>>> +
>>> +/**
>>> + * xe_print_blob_ascii85 - print a BLOB to some useful location in 
>>> ASCII85
>>> + *
>>> + * The output is split to multiple lines because some print 
>>> targets, e.g. dmesg
>>> + * cannot handle arbitrarily long lines. Note also that printing to 
>>> dmesg in
>>> + * piece-meal fashion is not possible, each separate call to 
>>> drm_puts() has a
>>> + * line-feed automatically added! Therefore, the entire output line 
>>> must be
>>> + * constructed in a local buffer first, then printed in one atomic 
>>> output call.
>>> + *
>>> + * There is also a scheduler yield call to prevent the 'task has 
>>> been stuck for
>>> + * 120s' kernel hang check feature from firing when printing to a 
>>> slow target
>>> + * such as dmesg over a serial port.
>>> + *
>>> + * TODO: Add compression prior to the ASCII85 encoding to shrink 
>>> huge buffers down.
>>> + *
>>> + * @p: the printer object to output to
>>> + * @prefix: optional prefix to add to output string
>>> + * @blob: the Binary Large OBject to dump out
>>> + * @offset: offset in bytes to skip from the front of the BLOB, 
>>> must be a multiple of sizeof(u32)
>>> + * @size: the size in bytes of the BLOB, must be a multiple of 
>>> sizeof(u32)
>>> + */
>>> +void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
>>> +               const void *blob, size_t offset, size_t size)
>>> +{
>>> +    const u32 *blob32 = (const u32 *)blob;
>>> +    char buff[ASCII85_BUFSZ], *line_buff;
>>> +    size_t line_pos = 0;
>>> +
>>> +#define DMESG_MAX_LINE_LEN    800
>>> +#define MIN_SPACE        (ASCII85_BUFSZ + 2)        /* 85 + "\n\0" */
>>> +
>>> +    if (size & 3)
>>> +        drm_printf(p, "Size not word aligned: %zu", size);
>>> +    if (offset & 3)
>>> +        drm_printf(p, "Offset not word aligned: %zu", size);
>>> +
>>> +    line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
>>> +    if (IS_ERR_OR_NULL(line_buff)) {
>>> +        drm_printf(p, "Failed to allocate line buffer: %pe", 
>>> line_buff);
>>> +        return;
>>> +    }
>>> +
>>> +    blob32 += offset / sizeof(*blob32);
>>> +    size /= sizeof(*blob32);
>>> +
>>> +    if (prefix) {
>>> +        strscpy(line_buff, prefix, DMESG_MAX_LINE_LEN - MIN_SPACE - 
>>> 2);
>>> +        line_pos = strlen(line_buff);
>>> +
>>> +        line_buff[line_pos++] = ':';
>>> +        line_buff[line_pos++] = ' ';
>>> +    }
>>> +
>>> +    while (size--) {
>>> +        u32 val = *(blob32++);
>>> +
>>> +        strscpy(line_buff + line_pos, ascii85_encode(val, buff),
>>> +            DMESG_MAX_LINE_LEN - line_pos);
>>> +        line_pos += strlen(line_buff + line_pos);
>>> +
>>> +        if ((line_pos + MIN_SPACE) >= DMESG_MAX_LINE_LEN) {
>>> +            line_buff[line_pos++] = '\n';
>>> +            line_buff[line_pos++] = 0;
>>
>> This breaks ascii85 parser that we had up to now.
It should not break the decoding of existing sections. This helper is 
only being used for the new GuC objects at present. As per the TODO, the 
intent is to use it for all blobs in the future. But that was 
deliberately left to a future update (which hasn't been posted yet) to 
avoid breaking the mesa tool.


>> And I think there is not safe way to parse it now, how would the 
>> parser know that the blob reach to end?
The GuC decoder tool simply ignores leading/trailing whitespace and 
keeps decoding until it finds a line with a new field - i.e. anything 
with a non-ASCII85 character such as ':' or '*'. It is totally reliable 
for me.

>
> Just looked at this code to check if we also had a "Size" as I remember
> seeing it in previous related patches, but we don't. If
> we did then you could use that to calculate how much you still had to
> read, ignoring the \n. With the current scheme I think one
> way would be to continue the previous key when the line doesn't start
> with a new key. Awful, yes, and not future proof.
Any new field is guaranteed to have a colon in it and any new section 
header is guaranteed to have a star in it. Sounds pretty reliable to me.

The other option would be to have an explicit prefix at the start of 
each continuation line. E.g. "A85:".

The problem with a size field is that ASCII85 encoding is data dependent 
- it has extremely basic run length encoding of strings of zeros. So you 
only know the size after the encoding is complete. Which means either 
the size field is in the dump after the encoded data (which is therefore 
useless) or you can't stream the encode and must encode to an in-memory 
buffer first, then print the size, then print your pre-encoded data.


>
> John, I explicitly said *we can't break the existent users*,
> pointed to the one in the mesa repo and confirmed with José it would be
> indeed a breakage. Please check again the past email thread at
> https://lore.kernel.org/all/3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu/ 
>
That discussion was a question for Jose not a statement. As there was no 
response for several weeks, I assumed that it wasn't a problem after all.

>
> Did you at least prepare the mesa parser for that additional \n?
>
> We shouldn't have merged the kernel patch as is with the excuse it reads
> better in dmesg, when we also said we should not print that garbage to
> dmesg :(
Not following. Should not print what garbage in dmesg? As I keep saying, 
none of this goes to dmesg by default except in the case of catastrophic 
CT failure. And in that case, it is extremely useful and the only way to 
debug issues.

John.

>
> Lucas De Marchi

