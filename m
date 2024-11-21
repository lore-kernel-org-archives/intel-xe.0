Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8E7D78793
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 16:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6641310E9D6;
	Thu, 21 Nov 2024 16:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqh2XB7w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2DE10E9D6
 for <Intel-Xe@lists.freedesktop.org>; Thu, 21 Nov 2024 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732207487; x=1763743487;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wmd6mYkHosA2j8+x4yTm7g4Yst3kzqBicQRNRNBp0h8=;
 b=eqh2XB7wGpRxPJJmWg15CwiYzBa2CJB7kSDcwkfUpsvI6hwzkI7QoOwE
 tS0hcDaL8uYF9eOFfYoXI6J5WPn6B1KjteYzx8t0NAV0NPaOZyhseNJIZ
 jA5QBEt54OtoQiScd+YJeOaOms4xbcB80bfvrTIVoTnDI5mv1ObRFbm89
 +4pgh1vRcOclKZ1bmhGah3TRiuAE65hJukBOOy2EUOQqgmwKhbgdzFtXj
 0EUOBRdVkp6L5yRl4Utzio15GKCLkw/MBxTRJduYz3XjAlNr/5W0GFb9M
 oCGQsg8p8WbZ+j91xJsYYHJHOKx+xVFasUh+z3SrRqDcarQCnyYO4WjE+ Q==;
X-CSE-ConnectionGUID: /WvxtcijRCecoCM+44OL1Q==
X-CSE-MsgGUID: o3wPz4UWSnqqLDQTMQT4kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54841327"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="54841327"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 08:44:45 -0800
X-CSE-ConnectionGUID: Z2HlQ8XzQZiPILEZyCr/Bw==
X-CSE-MsgGUID: BD5tM9v0TUuP4wwbch85hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90472994"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 08:44:45 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 08:44:44 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 08:44:44 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 08:44:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwAulhUDIYK3gI3xe4FzeBcidZl5yVWGd/oos4Vf9ObjhX0EulMEfby6UmE8CZrLEuH5eIkDj1L0Pbculvlig2dx7zN492CkB08gbzc6EZN8x559Gsy37h51GMdlFsO6ea1kPZ1U5sObzV10FfEwFyekBxTa+chNWwENT/ntzucN01nIUGwVX+OnPZfi4lRZvTSO61PTBxJ2B9oPqu/6J7amaRc0Mo2ioP2n2cv06eNHDn7aCorH819PnFQlJTAArq0KlgnlqwNnQ86LgOKI6ufdmejW/WSVjzfBmlkn62xxtSMYlD/Kluad8/sG1lr7SVdk9Sc2Kg06m20vn+U2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSEVYlJ7Oap3GoW4HAW65w1sG+ClVxDlV1G/MTZY40Y=;
 b=gF/ps/l68+QMvR5+AiLMXGUTrJEFGhitTtC2YpyD4y8C71e9t6pwkeuHFTa7nfptHUpgB8rdMj4n28v16Uh9LXfNkWTGnP5v1fh0FiuVZvLVeanIA4YIt4akSZa/2j8rvy+47OEoEwqUBB8xMcYmHynhn7MtgqBWeEgfmilegsZ2uPpFvRPqEHKNAdenotBVNyJqNJmcPr1GRVIQIsE4wuPeL1zNhhDVzhQebO660jzBIC4RZ0qjU6+yfvQn79lPG0RYpI6KsENUBAc8zBjj0hxAnu1wgyrs84zClJfGEkIyoeecYlONA5qav0m8TOaelBk/lJcY4m/FVp0Wpd/jPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB5958.namprd11.prod.outlook.com (2603:10b6:510:1e1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 16:44:41 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 16:44:41 +0000
Message-ID: <75c993a1-b8f9-4d85-adcd-f28b26109633@intel.com>
Date: Thu, 21 Nov 2024 08:44:37 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Add a reason string to the devcoredump
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20241120232257.1025282-1-John.C.Harrison@Intel.com>
 <20241120232257.1025282-2-John.C.Harrison@Intel.com>
 <Zz6rNo0s6y5W0Hrp@lstrano-desk.jf.intel.com>
 <Zz7G9MKChzMefclb@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Zz7G9MKChzMefclb@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:303:16d::23) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: b772719c-0402-41de-59d8-08dd0a4bcb60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3JiYXl0bnhHRWtUZXY5b0xYWTZqZC9JZ1o4MGJhMERTdGtTRW1HK3dXcC9Z?=
 =?utf-8?B?bWtUOFVMSjJscUpMaU1QRCt0TFBwd3UySjV2aUJrNWNmaStOdThHZVh6a2Rk?=
 =?utf-8?B?M0FvenVjekt3bENNTnRWYWJaQ2RUa0x2Ty82elJPVjhEYjNOb0daaXVtaVNW?=
 =?utf-8?B?aUdEQncrMGNBUFJnQ3NSOHJuSEw2alF3YzZVak0zdWV4TWYyNHlmV1kzZEV2?=
 =?utf-8?B?SlpMRi9CODd5WDBEaGNqa2dCeitzdGIweStmbzFienI2YVNmMjhpMDZkcnNJ?=
 =?utf-8?B?RmZjT3ZSMVNVZzAwOXVjRE5OWDg5K1VYYjlYa0NtT2hnaUptcFhHanUxZC9M?=
 =?utf-8?B?S1FLVERRVE0yN01mQ2h0Y1gvdGo3eUM4aGRaWER1MmRBQnlTWW1JZEROZVFQ?=
 =?utf-8?B?Qk1PdHBEMEJIc2Q2MldBS2l3NHNGL1FIVXFoOGdCaG1HdHh5SXZBK1pSUE1k?=
 =?utf-8?B?QitpaG0wMDJtSG1oV1dORVk2WVFjaW96WFU5c3F6Uklhd3JzR2gyRm9KZ09n?=
 =?utf-8?B?UVd3ZDd2RTR0bmMydEpyNnhwK1JmaWx6eWdQSzYza2RzNXVzQmpVSWVHKzdq?=
 =?utf-8?B?Q2srWmpRb0oxcTFQY09KeXpNRjhOT28zU1o5M2hjdVRBNFFzRzVhK0lHZjll?=
 =?utf-8?B?cFMyNFJnbHpCNERNenljSHJpZCs2Y3lybndwTEFRQWU2TzlSNER3WVh6RVhC?=
 =?utf-8?B?dDdTRnpFT3U3cUZxZzUxQURmWWtMMTVMcDUxWXU0ZGRtVWg4N3JSR1FPU1RR?=
 =?utf-8?B?T05TSU1idStMWkhFdWdJUDJxMitZUDNZdmZ1VTlhTmdONjhLQzBmckZTdEhZ?=
 =?utf-8?B?cWdlVjgxT0kxQzJJNHZWL25yemhzWEs3bzhOTnlGQ2VsMkJ2NG8xYUhCd3lN?=
 =?utf-8?B?TTlvMkZGcW9oT1hvblozWnJWVDlzWXpmeUVqUy8zbHJLRFpjVUFraDBFT2Nl?=
 =?utf-8?B?ZWswWlhWODVSN2toOGJyRkhOaTNKRythZ0w3ZFFyb2w0dklseHRaQ2xmMjlJ?=
 =?utf-8?B?bGErZFVGTGs0WmlNeUsvOU5iSWNwNWp2YVB4bFNZVXBiVVJVWERtN2gyZitP?=
 =?utf-8?B?a2xOTTZhNXJDcjlIbitSMWtiQ0R6UTVuZ1FQdFoyaU0vUDAyTDZUNVI4MkxJ?=
 =?utf-8?B?cWkrYys1NXZjRzlzSU16ZkVKYzZtUXN3TDVoMldaQXRwZkZRbDg1cld1WmZ0?=
 =?utf-8?B?V21PSVNPYVZua2V5MU41aFJMbW9oRVJyK3NSZDlqY2xJOHRYNENNemRrMjE1?=
 =?utf-8?B?aFd4NitqdXVJc3RZVFUyMGlIcEVmOWJocG9YamhKblp2cU1mOWlReEdpRUtQ?=
 =?utf-8?B?bFlhSDBkYmNqQ1FIc3pKN2NIbWsxenBPWndpVnlEY25mNzZVQ0FQY3BYS1F1?=
 =?utf-8?B?MDRUNFZlOEZWQXpFN0VadmhLWTBpbHVueU9oNW51dkVNYmdhRzlPQ3lOOENv?=
 =?utf-8?B?L0hONnduMEU4TDhPL0t2ak1YUGh3b0JEL1MwRG9jMmg3OUp4Rm8wK2NnNDFN?=
 =?utf-8?B?NjRPckE5ZmplVGVSYVgzL2E5VWI2MXA0d0dPL29WYmtYTjc5a0RuZFBIUHVU?=
 =?utf-8?B?U2FWZXhsVUxPeXpBc2F6TDVrOGVIRlAzQ1J1cGlaK2YzNUIzRDdDdUlhdE1C?=
 =?utf-8?B?SWFLa3ZHaU12OUNYL0pQMVRWL081UmZac0xCSHlVVDBvWnpGQ28xeDJLS28w?=
 =?utf-8?B?NnpiY1dDMDg4K0hURENmL3prZ25FZzBSNUpLNzNxdlE0Q1d5MjJvek9FN1M1?=
 =?utf-8?Q?FNfjL1yL/GAXKGEwt9PBgTlNWOjBuMRVduDy70G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nlk2cU03VC9PTGp4QjlxWXZPWEpndTVEeWp6bjh3bnJSbjYxVDJSaUh6OWZX?=
 =?utf-8?B?REs0NXZUeW5zL0VxWGE2MVNOUDI0Ym5Nd0NTVDNsYzFRbHZIeHdPdkFEWXRq?=
 =?utf-8?B?SjhwYWxhUnJRWTFZbmpKZ3ZrOWVGWWJRRjVOWWtVelh6SElHcmxoaERNa2h3?=
 =?utf-8?B?VjIvTm9DcmR0M1FYcUhYY2xGNlpPNUxocUloOEl6MVQ5UE5FNTVQbUhRcGd3?=
 =?utf-8?B?Q1haaTA0TXNOQjIvNHZGcmJnaVJjYklyeW1iUkZyMHFKSDNnQ3hLdEYxMUEw?=
 =?utf-8?B?ZDBheWc3QkxySkpJUnoralhSN2ZEbnRvTUtmYm1wTWJRbUlJV3hoc1RGMVNQ?=
 =?utf-8?B?TWZuYkVucEZDSkVPQmRBS09CbkE2d3pBbUZ4bnAxcFdlNGhqYVlLSnZCQXEr?=
 =?utf-8?B?dzVpKzArekxyMStRU1BQRERFS0VhRmhKKzVGdE9BVGQ4YUNzZlY3Sk93TUw1?=
 =?utf-8?B?NFo0RFVEbGRzcXJUTnhpZGp0ZCtFeFFVZnN0aTJVbHUybDJSRitCR3VGVXNY?=
 =?utf-8?B?WUxwcjF1cmhKWmgwckYzeU1yQTBmNjB3QkRqWHVWNDdCSDNBZDBjektTT2Y5?=
 =?utf-8?B?cWVBY1FudFFRTElIZ1JyYXdlVFRvK0NxT1I2Slo4TEFHYzdOdlI5Z1ZMSUdl?=
 =?utf-8?B?bzlGZE4zMjQxS1hNUlFvLy95anZ5a2JJYXhPVHNwK0lRb1k2QUJ1SXVPRmgw?=
 =?utf-8?B?aEpIZmVlK0Nsd3Vselh1emowa3RtZkdZT0NlU3dmRk12ZTNIUFZzRDlOdE5R?=
 =?utf-8?B?c2hPejVVZ2YzREYrbUxhUVJ2SHlLQUFWdHFrdHM2SjRlWS9oeDd1RnRuZDEy?=
 =?utf-8?B?RzRQS01Yc3IxVmRuc0Zia1grczFYdHh4TjVPTWc2TGx2cUNZWFRuSU41WTVX?=
 =?utf-8?B?T3h5MFBmVmdiUzF6N2lQV1orV2JSNWhTUTUvazNNbVgwcDZia1p0ckFUUFJY?=
 =?utf-8?B?RDdNa0ZrS1BsdjBpT0lkYzZ1bnRHSnF3dUMyZVNDdnNSaVJuYVNIcHF5M1Uw?=
 =?utf-8?B?dVFYMHdvRDdRR1ExanRwbCtEeSttbnJyWFRub3djS1RwV2V5bXY0V01zREFa?=
 =?utf-8?B?Z00zMjNHZXM1c2x4OWhqOEx5RDlMTCt1dE1jYmliS0JCRXFsNTVhZ0YvZzQ5?=
 =?utf-8?B?K1pOWS9GOVkxS0hCY0pjWFVvRXFoc0N1NEVQaUdVN2VaaUZlWFRla04vRHlk?=
 =?utf-8?B?UHU0emZNQm16d01HWW9mRVZsTlArdUpBelBmT2pFU2NhRCt5b09rTHNaVVZy?=
 =?utf-8?B?QUpEeURlaTlha2VITURLZ2ZyeUUxRkRIYUo4S1ZNOVpsL054Y1lRTmxsT0p2?=
 =?utf-8?B?Q1FoNjQ0ZUV6clZuTWpqWGsrWSs1TXhOb1NVOWx6Q24wT1R3TTVrdkkrYVVn?=
 =?utf-8?B?ME0ycDJzM1dML1FQOGxoWUhEUXhNZUJnbUl5Qk8zRnA0MUJZT0N4QXc5ME1q?=
 =?utf-8?B?M2hsZFpYM0xpV0I3WWJvZ0s4MEpKUy9FcnR5bVJrTU44ME1wd1VTUEcvTitF?=
 =?utf-8?B?blFFV0RRSElUaklZRzJ3SmN2U2VGNUMrRStRcU1ZSk5FRTZ2WXlmRmtzeUhC?=
 =?utf-8?B?RFlMWlZSRjZKcmFybXd6NUlDMTlxd1NxY1A0WEdMWk9kU1JyRlN1akx4eURY?=
 =?utf-8?B?YWY4cTBoL2pQRmdpeVRvR3ZmZnRtVlN3c1RHT0xka1FYdzZQVmdhbVNSb3g2?=
 =?utf-8?B?K0llVUJnM3MxSTZpYzVucktpbys1ZmtDMlZZRDBKSzZKcVhpdzRBS0pzaEdG?=
 =?utf-8?B?OXpwMUdOcTkvYjdFaW5PQ3VqaFVhbjBsZjF4OUJ6RHozUTJoMlFubk0rK2ZF?=
 =?utf-8?B?NzFlSmprWmh1MEtyb1l4TUFGQUhOUHZGaUo4YTI0QTFVV2gyOWNlTXhGa0Jw?=
 =?utf-8?B?NzRyeXB4dGhydWRJY1UrcVgrTlJhZVNDU1pzVGt1N29WQmtOdkpsQmdMVURy?=
 =?utf-8?B?cDZEb0lwR3ZTTXRLdkxhSkJqamkzWDAyd3FnaExleWRyaWFCRjlQYXVvby9i?=
 =?utf-8?B?YVpLQ3FtREhHVVNsdmFvMVhUYlVvUzJ0b3Y0ejdhWVMzRk5FckkxN2I5WHZy?=
 =?utf-8?B?TXBsclIxSjg4N1BrSGo0M3ZpSmpJdjYySERuaDlQZnNBSXBCRGZBTkFpbzZS?=
 =?utf-8?B?ZHl0TGVZTVVYc3VZcFAzTDVBeW9xS2k2YmZsaWhNMXNWOEZPc2kvY0ZTMmxn?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b772719c-0402-41de-59d8-08dd0a4bcb60
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 16:44:40.9762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rUtV08bCRqpNETCIoUdloCptXrSrZL1Wxqrq/d+ZaZSpGeNn0szKcmEZwOpsXuNJMvIXEJ2pGmJWLqv/L1wqvAPczYw4rhWYV/cI6g4t4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5958
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

On 11/20/2024 21:36, Matthew Brost wrote:
> On Wed, Nov 20, 2024 at 07:38:30PM -0800, Matthew Brost wrote:
>> On Wed, Nov 20, 2024 at 03:22:56PM -0800, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> There are debug level prints giving more information about the cause
>>> of the hang immediately before core dumps are created. However, not
>>> everyone has debug level prints enabled or saves the dmesg log at all.
>>> So include that information in the dump file itself. Also, at least
>>> one of those prints included the pid as well as the process name. So
>>> include that in the capture too.
>>>
>> This looks helpful.
>>
>> A couple of nits below.
>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_devcoredump.c       | 20 +++++++++++++++++---
>>>   drivers/gpu/drm/xe/xe_devcoredump.h       |  5 +++--
>>>   drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 ++++
>>>   drivers/gpu/drm/xe/xe_guc_submit.c        | 14 ++++++++++----
>>>   4 files changed, 34 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>>> index 0e5edf14a241..b5aebe8fb06d 100644
>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>> @@ -99,6 +99,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>>>   	p = drm_coredump_printer(&iter);
>>>   
>>>   	drm_puts(&p, "**** Xe Device Coredump ****\n");
>>> +	drm_printf(&p, "Reason: %s\n", ss->reason);
>>>   	drm_puts(&p, "kernel: " UTS_RELEASE "\n");
>>>   	drm_puts(&p, "module: " KBUILD_MODNAME "\n");
>>>   
>>> @@ -106,7 +107,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>>>   	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
>>>   	ts = ktime_to_timespec64(ss->boot_time);
>>>   	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
>>> -	drm_printf(&p, "Process: %s\n", ss->process_name);
>>> +	drm_printf(&p, "Process: %s [%d]\n", ss->process_name, ss->pid);
>>>   	xe_device_snapshot_print(xe, &p);
>>>   
>>>   	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
>>> @@ -138,6 +139,9 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>>>   {
>>>   	int i;
>>>   
>>> +	kvfree(ss->reason);
>> Do we need kvalloc / kvfree here? Seems like this would be small in size.
The type of free used is dependent upon the alloc itself. But I think 
this should actually be kfree after all, see below...

>>
>>> +	ss->reason = NULL;
>>> +
>>>   	xe_guc_log_snapshot_free(ss->guc.log);
>>>   	ss->guc.log = NULL;
>>>   
>>> @@ -253,8 +257,11 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>>>   	ss->snapshot_time = ktime_get_real();
>>>   	ss->boot_time = ktime_get_boottime();
>>>   
>>> -	if (q->vm && q->vm->xef)
>>> +	if (q->vm && q->vm->xef) {
>>>   		process_name = q->vm->xef->process_name;
>>> +		ss->pid = q->vm->xef->pid;
>>> +	}
>>> +
>>>   	strscpy(ss->process_name, process_name);
>>>   
>>>   	ss->gt = q->gt;
>>> @@ -297,10 +304,12 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>>>    * gt_reset. It is skipped if we still have the core dump device available
>>>    * with the information of the 'first' snapshot.
>>>    */
>> Seems like kernel doc should be updated.
>>
>>> -void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job)
>>> +__printf(3, 4)
>>> +void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const char *fmt, ...)
>>>   {
>>>   	struct xe_device *xe = gt_to_xe(q->gt);
>>>   	struct xe_devcoredump *coredump = &xe->devcoredump;
>>> +	va_list varg;
>>>   
>>>   	if (coredump->captured) {
>>>   		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
>>> @@ -308,6 +317,11 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job)
>>>   	}
>>>   
>>>   	coredump->captured = true;
>>> +
>>> +	va_start(varg, fmt);
>>> +	coredump->snapshot.reason = kvasprintf(GFP_KERNEL, fmt, varg);
>> See above. Off the top my head idk if there is a non-kv* version of this
>> function but if there is, maybe use that.
> Ok, scratch this comment. I do see these functions defined:
>
> __printf(2, 3) __malloc char *kasprintf(gfp_t gfp, const char *fmt, ...);
> __printf(2, 0) __malloc char *kvasprintf(gfp_t gfp, const char *fmt, va_list args);
>
> The former call doesn't work here as va_start is only safe to call once
> in a call chain [1]. The former internally needs to call va_start again.
> Unsure why this seemly equivalent functions have different signatures
> but I think your usage here is correct.
>
> Matt
>
> [1] https://stackoverflow.com/questions/59608636/can-we-call-va-start-twice-without-calling-va-end-in-between
Yeah, that was the conclusion I came to. But note that the v in the 
above is for va_list not for virtual. From looking at other bits of the 
kernel, it seems that even with kvasprintf, the correct free function is 
just kfree. I thought I had checked that earlier but evidently I managed 
to confuse myself again!

>
>> Nits aside, LGTM:
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>
>>> +	va_end(varg);
>>> +
>>>   	devcoredump_snapshot(coredump, q, job);
>>>   
>>>   	drm_info(&xe->drm, "Xe device coredump has been created\n");
>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
>>> index c04a534e3384..6a17e6d60102 100644
>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.h
>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
>>> @@ -14,11 +14,12 @@ struct xe_exec_queue;
>>>   struct xe_sched_job;
>>>   
>>>   #ifdef CONFIG_DEV_COREDUMP
>>> -void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job);
>>> +void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const char *fmt, ...);
>>>   int xe_devcoredump_init(struct xe_device *xe);
>>>   #else
>>>   static inline void xe_devcoredump(struct xe_exec_queue *q,
>>> -				  struct xe_sched_job *job)
>>> +				  struct xe_sched_job *job,
>>> +				  const char *fmt, ...)
>>>   {
>>>   }
>>>   
>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>> index be4d59ea9ac8..e6234e887102 100644
>>> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>> @@ -28,6 +28,10 @@ struct xe_devcoredump_snapshot {
>>>   	ktime_t boot_time;
>>>   	/** @process_name: Name of process that triggered this gpu hang */
>>>   	char process_name[TASK_COMM_LEN];
>>> +	/** @pid: Process id of process that triggered this gpu hang */
>>> +	pid_t pid;
>>> +	/** @reason: The reason the coredump was triggered */
>>> +	char *reason;
>>>   
>>>   	/** @gt: Affected GT, used by forcewake for delayed capture */
>>>   	struct xe_gt *gt;
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index e132294fde51..7d0e7cb977ad 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -898,7 +898,8 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>>>   		if (!ret) {
>>>   			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
>>>   				   q->guc->id);
>>> -			xe_devcoredump(q, NULL);
>>> +			xe_devcoredump(q, NULL, "Schedule disable failed to respond, guc_id=%d\n",
>>> +				       q->guc->id);
>>>   			xe_sched_submission_start(sched);
>>>   			xe_gt_reset_async(q->gt);
>>>   			return;
>>> @@ -906,7 +907,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>>>   	}
>>>   
>>>   	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
>>> -		xe_devcoredump(q, NULL);
>>> +		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
>>>   
>>>   	xe_sched_submission_start(sched);
>>>   }
>>> @@ -1132,7 +1133,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>>   				xe_gt_warn(guc_to_gt(guc),
>>>   					   "Schedule disable failed to respond, guc_id=%d",
>>>   					   q->guc->id);
>>> -			xe_devcoredump(q, job);
>>> +			xe_devcoredump(q, job,
>>> +				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
>>> +				       q->guc->id, ret, xe_guc_read_stopped(guc));
>>>   			set_exec_queue_extra_ref(q);
>>>   			xe_exec_queue_get(q);	/* GT reset owns this */
>>>   			set_exec_queue_banned(q);
>>> @@ -1162,7 +1165,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>>   	trace_xe_sched_job_timedout(job);
>>>   
>>>   	if (!exec_queue_killed(q))
>>> -		xe_devcoredump(q, job);
>>> +		xe_devcoredump(q, job,
>>> +			       "Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
>>> +			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>>> +			       q->guc->id, q->flags);
>>>   
>>>   	/*
>>>   	 * Kernel jobs should never fail, nor should VM jobs if they do
>>> -- 
>>> 2.47.0
>>>

