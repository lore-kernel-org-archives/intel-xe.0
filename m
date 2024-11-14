Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCF5D637D6
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 02:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EA510E791;
	Thu, 14 Nov 2024 02:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B5uY/mIN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF3610E791
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 02:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731549690; x=1763085690;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rOCVV5u0+0qC+8i1jMX/PMVhCrbK3WCthWAFABIvzKM=;
 b=B5uY/mINoUxthxQ/Gn1+4CdPnrQQMIdvfqac6xHNA5aXQYdx6IYPRJor
 SnwQN6nuZwMuJ/R4LnwrnllaNNxxkhXbaqJM6s0e2NKrBy2domLgq/i96
 ECFy+IqJAGqsTNKvzH40jq7wZj1SL6TjYLJvoIFiMv6XssBvGv5pUCE+Y
 ErTwjnbHQnhK1Co0fZeQdLTJzl2wJriFtsebyz1qLu9fVP8G7wbqjgg7h
 VdCyf5taiQZkFgqdjb57JY949yr+1XmBel9ZrJQw5/Khz38GiRBKvOBn/
 ohAIeR/cFWpq6h7X6bzgMnU+IlLabL8NwSCBT3fHpzGjnXikzSLUIvVM4 g==;
X-CSE-ConnectionGUID: y5GlXFRqQCS/RUEpZ1ZfGw==
X-CSE-MsgGUID: hUMzcL+eSleB5XZ5Q9rrFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48921585"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="48921585"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 18:01:30 -0800
X-CSE-ConnectionGUID: kSwD+gnBTvmBBkoarqncPA==
X-CSE-MsgGUID: TGWzWqLAQ5Whq16DWiRNRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="88470919"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 18:01:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 18:01:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 18:01:28 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 18:01:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjIRSpuTlnXzegYIZbcG3aRkLfTozPXXm1Bq2lwQ9TM8tm0tSBQsJ9ka0/FtWt+fkkyeUokAOhLMy/rDrwYqJuCzf4YrQLAyOO2+2kcJ8y32XtVA3XPWBiN7p3bOOzFxds0HfqUljECcztaUDsrZRi3v2kH1Qz+pTsBFFK4+TIlon6J8V9ZzYM/KQcByHO1jl+7mM1igp16LxR8bhLn2jtqFb49JtOKIhHuOpNIhn7GRuj1QsnZjJeOCBTXmULFewssfdGW8r5QIHlDSUUQTVXR82/QYSwiH4E78Z2QJRfHLXZvQicIrPs8hrfcGWwGYqmiqrkZ6SHFtZ4gziLoi5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NA1Z+pxLFBjp+ZX4RheMsMzMcLBu7YVPHk+kPG2WJFk=;
 b=kW/U9SgK/gRkyhjmnU+9NPKMQKKkbM/7aIbndgMHKAYxAjWi+kG8v4tk0ytJlJZUP7w7yjqGq3cnI8xd7MsmP84+reDBcY79A/grCHMFlw4xKUpIQW8k0eIK7VROa2tKHjyyKMKNE431gOq6FZQg8KnQoTiAnPtcZcRPzptDI+PHeUNA+HxqwqwBzu85xwO95oLNn5Sq+BeEK1PjX4UuSk7SgePipeDSn2XOeMnNJZGa7ToZP+Ju4jCUgcONHKr9CRSw7mBv9hUhG5hXokyMbLRVOb5BW3OpArzOX0mjsXZ+szYsyCoR5XciM7K3uYFIWrau1mxgo1CoKWRowks7Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB8657.namprd11.prod.outlook.com (2603:10b6:610:1ca::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Thu, 14 Nov
 2024 02:01:25 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 02:01:25 +0000
Message-ID: <6197184c-e1f0-46e5-9be7-5999bf130eac@intel.com>
Date: Wed, 13 Nov 2024 18:01:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] drm/xe: Wire devcoredump to LR TDR
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20241112220127.1369527-1-matthew.brost@intel.com>
 <20241112220127.1369527-8-matthew.brost@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241112220127.1369527-8-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0144.namprd04.prod.outlook.com
 (2603:10b6:303:84::29) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c6e4187-8c3a-4ff6-155a-08dd04503ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFVnTDhXRG9zcDMzajBuS1dMUERyR09USloxV0dFS2dRNm1IYlNPSUt2ODRo?=
 =?utf-8?B?OTdnakdQTldQQzVQT2R4d3pWaFdkcng1U25hM3BzNlR2WGhCYitqNjNPbEJU?=
 =?utf-8?B?Y2pQMDVuQTRiYXBaWXdENHphZk1yZ25aT1p1MUtzbG11ZThheVNmSUFrTkVm?=
 =?utf-8?B?VFcvS3hKb1ZlT2Z5cTdvRldORk1KQ3Ira2RBb3lyckVGbVBNZ0ZwSGNTWWJK?=
 =?utf-8?B?LzBIZWxna0NNUUhvQ25hV3hYZEhrV2ZrZzIxWDU3bnBXc3dGNzR4TEc0V0VG?=
 =?utf-8?B?V0IxUWZrcHhMaUZSRWUxRFRIK0dOK1hic3FpY0kxL1F2amxycWxDNldsWDZx?=
 =?utf-8?B?elg4NjhGMkh4clA2L01Wb1ArZjFhTm9UdTlaMi9udVRYYlJBWEpDaWxFNnFB?=
 =?utf-8?B?dDVDYlh0VlpEUkdLZG8yRXRLUEU5SE1NZ3pWSXZOWWk2RGtSQ1BsZklKR1pU?=
 =?utf-8?B?UDVKN09iaWM5VzhJYzBEK0pMNHBPUng0dW9NckVoVXFJWmZkSmUwdVU0SnZr?=
 =?utf-8?B?WkhQanJTNGp2ZExTNW02c204L05RcFRmdEk4OHp2MmpxT1dWYUsyMkdCQzlh?=
 =?utf-8?B?MjVPUHpjR0RYTHE4NkdIeDN5NFpUV3hYbTFKMmxER0lldm9GTk1SOVZrY2E4?=
 =?utf-8?B?Zk42ZmpiR0cvdXltcUM2bnhQUnZXSkdKUE00alRSZkVXSWxWVHFreFdURXN5?=
 =?utf-8?B?WExoNzY0bDF2cFF2TFN3THZHNGFtVHNOTjdKUDh6c1BpbFJncXpITjFFNitV?=
 =?utf-8?B?eldPRXgrUDVTd1c4RXh5eVhubDZSOENEczFpRDJvZFJDK3I0Smo5WlF3UHdw?=
 =?utf-8?B?M29rRjNwbFlNSStsVm9VMFEvWDVwRkR0WWs3MGhlUkxnb0diRWdjSU8xazl2?=
 =?utf-8?B?ZmtXTFRCVGZJditBQnQ4MEpuWWdqL1E3aG9pTHhLb0FWN0szdFhPNjJoWmts?=
 =?utf-8?B?dWY5K2tINGdiR2djVEx1QUVtakVpNSs1dzA0ZmRkVWpONzhEQ3VxZFc3UTJF?=
 =?utf-8?B?Ti9sMjlTUmU2TVZuZkFRQTd0TUJObWczcHkzczhmMWRFN0k3Q2pYbTdMU0pJ?=
 =?utf-8?B?T2YxTkNFTDlUMXRGQkk2a093eGt6cXhxWUpKVEgzeVc4VVo3bzUyY21JcFBN?=
 =?utf-8?B?c1djQ3ZmaDBYUjhkM0RLMVlCenpYUmw1OUhIQ1lKQkN2ejlBZXdlRkx1WDdR?=
 =?utf-8?B?elZWcndKcUdVMjRvR1lBT2dJS0xoZ0FFUWRxRjFML0NpRXBUU0F1WWtRU3JQ?=
 =?utf-8?B?cVVjc3lSZTdnN1k1aUIzSXZGREFYZlA0RlpzblZ4VTNpYVA5VmJ6aGZuRU4z?=
 =?utf-8?B?U3I5dFhSUVBJY1JrUUJ0eGl0NDZlNjJIQkZPVHQyUkFvTnRMQjQyb0NFbzN5?=
 =?utf-8?B?UzdKUEE0eUgwTmErTm11LzNjT2dnMnVsb3RsS1pYemhIRlBYa1dheThQUmYy?=
 =?utf-8?B?elBtL2R5VWNnNlZSUisxZ013c1daNUlVY3ZQa04zUHRNU05aSC9MeTRZeEtp?=
 =?utf-8?B?UGhCUVZMWUJScVZHK3phOHlPbVhPQkw2NEdlbFBxcU5xQXRxcnB6dlQvVzJt?=
 =?utf-8?B?MmdpdHQ2b0VUZjcyQW9KeGxoWGVMdWFwb0JhV2JleGdxZVFhVW40d25LWEI5?=
 =?utf-8?B?SEZBN3JqWTIrVkxXdmJFWThSaE1yWElDVHpwa1d2QXVnMks0eXUxYWE4aTg0?=
 =?utf-8?B?SFpUNm5Ob2RvQ1FNOHFLdkFKbjhHNStDekhKV3lhd3Fac3NrMkNwMlg3K0hP?=
 =?utf-8?Q?VfMolCGTDz0y1bO9JNCJPMfaYxINdNegM2iyeiV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXZOVCtYekMzV1V6aE9PMkZQSzdDTzIxbDZob0xmNzFOWHBEdWF5V3lZalBI?=
 =?utf-8?B?S0NNTjR6MXBpeFhLbktVZ3ZXblBTbmdPN1I5ZHUwSVhqazgrWmZlczZLYXhM?=
 =?utf-8?B?dHdzRzZDQkZOSkw3MEpMUkMyUUxZQzBIK1VMQjdxVm5BN25ZekVaTHpaL3pw?=
 =?utf-8?B?SXF2YWgzWlVxRzUxRHFTR3ZpVEh6eHBCNFVLSXB1dHpwU0xUeDFFT3pFVTM3?=
 =?utf-8?B?UFUwVzAyd1l3cWtmRWJUSmIzNDc0SnNKangzVTQ3Y01PREozVnRmYWVheVZD?=
 =?utf-8?B?SUgwMmU5cmQrclczdGJoUW1nYzRJdHlVbGZWWmJKcWQyckNPanFjaWNNTFd4?=
 =?utf-8?B?TkRNWEN6NzVYbnQvd0ZwQVc4UDB0Ni9YaGhsOG5odEZBUjlDdzJFL1JPd1hY?=
 =?utf-8?B?YkpiRnVvRW5aSlJ2S1RaeTNIc1d1eXFrcy9DK3hnY3pycGxiOVB3TkEwRUc2?=
 =?utf-8?B?MnZ3MU9HcFJhQVRKbHFJM1hXVGlLbGNPNXZ4bzZEOWNBVlpsdU5hMStxaWxp?=
 =?utf-8?B?RzVpL084S2ZaNGtmN0wzazBYaFdSZWlmVEJLclVXSFZwV1g5WkNra3hxeTdl?=
 =?utf-8?B?UjcxTkVSTGxFby95V1lsRHhFYkl2SXZnUXl2TFdPbHRUMUJkZmg5V0NwU0FE?=
 =?utf-8?B?MEdUSkhreDZoc2l6UGxmZmdwVUNFZHF1TUF3NUZIQzJnRm1SSWJJdFZqazc0?=
 =?utf-8?B?N3pWQnZrMDRLVTJyNmhFOEpVQ3YrOTFLaUM3SGhWRWJLZnhXSC9KQ0F2eXl4?=
 =?utf-8?B?NzlVMFNUeFR4cTBkNUMwUWRaUFIwRkRKK2FKazZsU0ovcWMzb0tKYnM5YWtK?=
 =?utf-8?B?RXFtY29SakhhdjVKQXpFUnR6SHNHR2VtRUdjYW9ERFZxam1ueTQyS1JFS2xC?=
 =?utf-8?B?dDhpYzdQMlFOMXZYZjhpcUcxa3lEUmtpV291Z2VvZnZqR3o4WThZQVZ0cUFD?=
 =?utf-8?B?bGs5UXJ3anR4K1VycVNTSVpFL0duQkZrR1hiYUxCTHNuMG1HOXZWNmppaDht?=
 =?utf-8?B?N1F2QlZ0NitINWxUay9iU3lpL2dvUHQvbXl5bXVYd1RDKzgwVmdBaVZ4aVcr?=
 =?utf-8?B?MWhodndxRjFQaEdGdllBdFF0YllXMXlXN1JLOG9RVHVUZVpNVk10TnE5a0ll?=
 =?utf-8?B?NFowQSt2bXV1Qkh3amgybE9kWHZoTkFzNzhKZkJPbWZKTlpRMW5raEczQVFz?=
 =?utf-8?B?Slo1dGVpRXFRQVlzNExzMjBveGpIM0FEWDMvYzYzNXI2UWpCMTBzUytBWklw?=
 =?utf-8?B?UElHaUxHazVYUm5NU2drNEJ6YjVCOHFTSHFqaEdoT0JKR3lmaGlxQUpqOUpK?=
 =?utf-8?B?SHM3aFFuWEhySFVMYmpBMFRBdkNRcW9uOFdnR3pMeGJvc1lUYitIbHJ4dmRp?=
 =?utf-8?B?NWx6Mk1LWlNWOU5EcHdjY2RjUjZTSUNoL0hmMU5oWEtYci9JMTNIeWJhUlQx?=
 =?utf-8?B?eGd1ODY1VUpoMzN3ZHZRcFlBSlBoTXh3bTZlU1JqVWNmSTRTMkkvbVJIc3Y2?=
 =?utf-8?B?UEZIcXIzVHhqT1JjcWVGdGo2L29QQ243YVFUeUhQeTVFSENGSEF4bDRDMHN6?=
 =?utf-8?B?YmdrQ2g1NlVJYjJvOGwyeVYzSUV2bXpnVEM3cVZNcHdiSE5HMnBNWlRMNElH?=
 =?utf-8?B?MjFlaFdaUWhQVzhadmZrYklwYmlEQ0ZWWHVqN1hpcDY2NmlES0g3L0w3T3Qv?=
 =?utf-8?B?UzFaWEpKL3JySFVwR1VEVHRIZXhPVEdTSGhSRlFNSDlDYjl5Y3g5bkJ2djBM?=
 =?utf-8?B?dTRYZGtLVWU4WUpRNEJjMGpkVFYvZ2k2QTduMHVzNGFzZXhHQ3AxTldPNkVP?=
 =?utf-8?B?Z1ZuR2FldndvcTVNbE9aVFVxb1lVQ1FIZFpRMVY4VTNDMHRIYjNsb0l2MWtZ?=
 =?utf-8?B?YjE1a2ZWYkNUY3cvY1h1NEdHbHhmUG1wUnBXWTlXR1ZrR2F0SDh4dCs1eFdE?=
 =?utf-8?B?U21SeTFXWmdQaG4wQzMxSUVWbGRULys3L2ZRdHd4MXZnWnVwUUZENmFuSkJh?=
 =?utf-8?B?dTV0cU5VY01XbmpRWmVOb3BzNW9oZjRIbDBPU1FvL3JTVUtxajBvUEJKRjlY?=
 =?utf-8?B?YnFuUmxTaGZBNCtwTk1JbTZVM2xPYStpMUpmd3ZKdEh1RWRJTnFNeXRvQkZu?=
 =?utf-8?B?RzRHT2NmWGp2VlFYb3dsZTBrMGpzaGRsUVN1U2p2TTVvaDBsY2F2WjVVNVRu?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6e4187-8c3a-4ff6-155a-08dd04503ec6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 02:01:25.5524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pskn0NTOyG4Ov0llJX+HFXyIKNouAq114QKyE1e5h/HsacQO8rK1J5ac4FUtqjjHZblxP77y1UIoQQf4oLn5Z13Hohr/myt+1sCk2SRsw80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8657
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

On 11/12/2024 14:01, Matthew Brost wrote:
> LR queues can hang, cause engine reset, or cause IOMMU CAT errors.
> Collect an error capture when this occurs.
>
> v2:
>   - s/queue's/queues (Jonathan)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 985a21a72da4..29099497429d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -896,13 +896,17 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   					 !exec_queue_pending_disable(q) ||
>   					 xe_guc_read_stopped(guc), HZ * 5);
>   		if (!ret) {
> -			xe_gt_warn(q->gt, "Schedule disable failed to respond\n");
> +			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n");
Missing the guc id value.

John.

> +			xe_devcoredump(q, NULL);
>   			xe_sched_submission_start(sched);
>   			xe_gt_reset_async(q->gt);
>   			return;
>   		}
>   	}
>   
> +	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
> +		xe_devcoredump(q, NULL);
> +
>   	xe_sched_submission_start(sched);
>   }
>   

