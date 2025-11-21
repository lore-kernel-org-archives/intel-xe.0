Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B34CF2564
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 03:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982A410E0C7;
	Fri, 21 Nov 2025 03:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TVwrS2pi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B72A10E0C7
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 03:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763696397; x=1795232397;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WljPNeP05R+4lmKGKfMAFwB/PHVHJMbBLkLlW6GNAIM=;
 b=TVwrS2pil9e15hloJRY3ro0cIWKtQ8irIVW0LLdfw7ODA8Gv9lwvFuPi
 j3c/tmSauPFsw2KXH6bkOwAh723/4nQ3KPTWSOnW6d2ka+wXE+dvbs9cq
 QZ6+Z5A+Rvsa6Yr91/hvsEdLJ8nVnDVoCYnlC5PdfoVjPAfC5dHoe2JJR
 yjxKVrVgS5S3wCqlMlymK1iQqE1/12SDOjzX0BUrzvBKCPWh3LtNKN8hv
 H2AXzivDU39gbqhKH/EuxboKeGoXKiLC+c4G8t3NiHAmRnS3xFxsyoVEH
 cn4NLKTdEHrpXtI7KMzV8lauhQDNxd1LnYvGjsdrbP5Ldd+RfmidSaf6H A==;
X-CSE-ConnectionGUID: 8kYmSYjETRG/lmMZsCRC1g==
X-CSE-MsgGUID: U2/NOb83Srqh7/L0515l6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69641715"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="69641715"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:39:55 -0800
X-CSE-ConnectionGUID: 4fP5cpcdTC2iYhGgcnE6dg==
X-CSE-MsgGUID: JLH5NreLRxe1kU4c2wNrAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="222510919"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:39:55 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 19:39:54 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 19:39:54 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 19:39:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHfsIjhfD9VvPrBR+t/s2yN6091q4V+ZP/8ubDX1faE4tKq9Q15U9ypfFoUHybpM8XoS/r70yZlP6i+dlwPnkHIVATVk4XpK77U8xd0WphTbHwMz/Eg2s+4Pic6QflFS/YLe82TH5pDDyv3LSSIdBfVf8bZknalFcvnpdrbGrcyspArG3MulzI4K2gT2HTW3zYXEC4M9nDkklPXAVyujd+9i9lBLbIHpE0x2BBgJVJ3cpqR8LtvC2ZOw42x0MdId3aDFdJHGhuyKHw08mSw1snvdba72VcVBw94eAmuEsEipGTAODXwuR8WRGhZrqxh34qbZSqRv5SrMHPldVI0Flw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYdXCY6H6sOiKInRW3vzAJp/aJj2Dqci6VUiQ9HeTRI=;
 b=Ohq4hpalK4Z0v4P/iqkuP5lLwYucTcmqBMs2ogAncBqXkaxSjm/W0IfK+JilOKrtMBKBuAApeJnMJ3ivDeJgw2dE04U8dZcPEl0wUe+DTeGUEfVIfNi1OjC4M6CcVe298f+9V6WFiml027tFa+HzquIcTMH0XaOsHq/cEPj/7jA1Hjz3N5jf93kI+4+6aY7sAYkmQGT87ndPTwpJytaf83Q3j7rYekfaz+f9F4P/wfkWg7GxzZXm7Tu319+e9XjSJ4E6gyGOVEs3SLYv4oPuz36DwzFMLCH/QiduBF1YmCfbupFhJbsEk6aqc3/2eg67J/8j1byta/QAzIbvKFnYRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6513.namprd11.prod.outlook.com (2603:10b6:208:3a3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 03:39:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 03:39:46 +0000
Date: Thu, 20 Nov 2025 19:39:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jan Maslak <jan.maslak@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <maciej.patelczyk@intel.com>,
 <joonas.lahtinen@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/guc: Don't run jobs during GT reset
Message-ID: <aR/fAFW8Tyzef5he@lstrano-desk.jf.intel.com>
References: <20251120151611.2205914-1-jan.maslak@intel.com>
 <20251120151611.2205914-2-jan.maslak@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120151611.2205914-2-jan.maslak@intel.com>
X-ClientProxiedBy: MW4PR04CA0259.namprd04.prod.outlook.com
 (2603:10b6:303:88::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6513:EE_
X-MS-Office365-Filtering-Correlation-Id: fd460e1c-6b6d-4491-3488-08de28af9de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzZLUGtKaThiZWh5MndwdXFsM2JvUnM2MEtBUU9NU2FWQ0hGWE9WcmZQUllG?=
 =?utf-8?B?RGhpaThHQmdiS09sTjNReCttRS92R3Q4TlVPNllKeHN1NStHcXZhWmRnNk9a?=
 =?utf-8?B?UXpZZGJBaHkycE5vc2hQTVlsckQ3ZklXZlRtZCthYWUxRDVIZ0wyQzlZMUs0?=
 =?utf-8?B?amJHNFpuclhXTS8ybURHZWwvSTM3SGI3aEh0ZlE5Mm4vWE1RNHh0L1NlVU5B?=
 =?utf-8?B?bm5RTnNoQkFrd0d0Q01oeW9JbDlPODZzekM0VU12ajh3RCtkNGJGaEpBbzEz?=
 =?utf-8?B?M1lWTmhBa2thVzlEVkZKM1ZWdEhlOVcydjUrVGNVVnNodEZ5WDVjRjhEblhN?=
 =?utf-8?B?dnNwa0FGR21mMUUzWis5Um14M3ROYlo1NWpnc1BhQVZsSDNKb3VGaWFqdDRP?=
 =?utf-8?B?OTVObml3bXYzZTZpWEtidGlPU0czY0E0NnVGSHZYdEJBNzY0VStzam8wZ05V?=
 =?utf-8?B?S0h1ajJOSXV5c0I4cFZqY0lqR0pDd2FUODR1eGFTOEtuaWpPcG92Q1dHRi94?=
 =?utf-8?B?UWt6Z0RBTmkwdFA2Q1F0dVRwVFRXSWFqV0VpVEtIVVVTSnJvY240dXExZVQ4?=
 =?utf-8?B?VU5ZanVTdHhBc0RtTEY2eTFOU2VLUnlDNGhlZGRPTHFqU3dLM3U0M2RJNGxH?=
 =?utf-8?B?aFZCYWt5UXplTDFUUlhodmsrRklOQjVweE85Y1ZUSnhDaXRVenEveTJMcG4x?=
 =?utf-8?B?RDRoSHNKYzl6RFBIZHFwaEg5Vm0zTjVxRU1IbkRDbjJpanBacURSVDFmb2NH?=
 =?utf-8?B?WTBNTkdnb1FxSFZNVzZHVkd5bXI3b294Z0VoS3grNnRKbk9JcGRsNDkwZEtw?=
 =?utf-8?B?QysyYXRkY0RSYUpXRHRsMkVVQkkzcHlXSk1uZWdoMjNBMnZUVXd1ajAwaUJn?=
 =?utf-8?B?c2QwRXprWjhDVWwyMVhnUC9ZL0FXNGEwYXJMSEpXTWtjRHA0NWIvTDdIK2dM?=
 =?utf-8?B?cmNwZWRVb1RNTm9SS2ZXam1KSjBnb3lYdEVzZFl1QW0xWktFNlpLSE9MTzVv?=
 =?utf-8?B?ck9Fa1RMeHRkekVodEZ6NGQreHRxejc5TGlLZTk4TzlsaWgzcGxwNlgvRStS?=
 =?utf-8?B?MG5BVXpFREtBNEYzN3BPUEM3SW0yM0ZBeWY2VFdYdllBaWszSEhVbjA0UnlH?=
 =?utf-8?B?Z0dORkhWNDNKNlNGbkhPdWI4dFNQcWcrNW9ZZ0w0d0tkbmt4a2czTmkwM0VN?=
 =?utf-8?B?ZUVKaUxEUTlBSFdqMjRMa3p6SVlBa0x2YUxlTjRPRGhIVlFiM3AybVFQVjdm?=
 =?utf-8?B?VE9PYUhjQjVuRXphRHA5cm1HbVp3akpYYm9XdkxiY3FGTjZvdG5Hdi84VFdY?=
 =?utf-8?B?Zm9CcUlBSnFSdGpURU1VRFA4aTJkMEYxKzUweTZJK1gwQkc3RHRrVDdpMjRL?=
 =?utf-8?B?RS9JbGRqOVBQMkxsTEliNVVDbSsyZFRuaHdhNkQ4SUFaemRweWJ0ai8xbDFU?=
 =?utf-8?B?RnZ6SGlIcGI1QklmVVdFQWl4Wis3SzdRUjB1bmV4RWxuQ1VnVmtvYkFydWUz?=
 =?utf-8?B?SklPdWV5WDkza0J1UGttbXVxWkR1S2hncTc3Rzd2OWRzeUN4SDlqNmxzOTZR?=
 =?utf-8?B?akhZV0xobFpjdm5RcUxlM0VZVXBtUzN1TGk4YUJjUFFCV0cxWlZvMDhFdkZ2?=
 =?utf-8?B?V1l3eEEvSnpQZUNBSkFiaDVkaXhRMlFhSFh5WTJOZE95SENEOWNjS3p5d1A0?=
 =?utf-8?B?eUpMZi9abzJqVUNnamwzay8yWWFveG5mOVZ3VmRJOXhJQlc4N3VqUm9WMHV1?=
 =?utf-8?B?TkZWdEcyMnRPdVRlc2dZeUhDcXNHa3ZWV0p2T2d2c0cxZVVsZUVOWXkzVmZU?=
 =?utf-8?B?amlFRlA0OGg4VDAvZkZEZUR3RmlwUER6Q0o5cHl2ZnQ0WEttSmJJbnRxVi9T?=
 =?utf-8?B?TWhOS3A5RlgySXlhRHZLdlkwUEEwbk13QWhmaVRWd3BIUkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjdVb3huM0xOREN4eFVwaFJHblZ1V3hiWXNFTjBnQ1VOWkhic2pxWlJ0bmpy?=
 =?utf-8?B?YzMyMHRYclBYSmtqQTZsL05lUXY5Z0lvL1Q2QVNYTVd1Q0tuS0pVbEJ4VFlD?=
 =?utf-8?B?N0t6bnlQRHdSTG5tc3R3Sk1qSm5Ca1pTNXdTNllETmtPd2pjd3JCWDJFSVRG?=
 =?utf-8?B?NlRVYlEraUlLNFdUeUlHQ1dFMlNnWEJWRUxQd2pFVjNEaWUyRnU4SUdEeE5E?=
 =?utf-8?B?OEJCbmdtOFFYYzlLejlzYTRFd2dyeDZyVmttRERibUlmZGVET1E4RHdVbEt3?=
 =?utf-8?B?ZzJxaVF4VzQ5NXZCL0VYalVwY2QyN3AxQ1duRVowM2RmR1Y0WFp3alV6c1Az?=
 =?utf-8?B?NmZSZ2YvR3ZETWhPbDFFZGNobGZsS1FmRmg1emg2N2lrYlBnb09HL0oycVdw?=
 =?utf-8?B?K3J3WkVHamVvb1p3Mk9rQ2J6MUtYbnVEYkNWVENlNTdobU1oSFdxTldPOU1k?=
 =?utf-8?B?czdOYlVHdVFWSkRPSjd1aDdVaUFXTUtyVm1BZW5sdENNMnVZU1dxZXpCcDJN?=
 =?utf-8?B?U211S253c1dxQ25hSml1bTBMNmc0cnlLYkhRakIxWVpCdmowUm4wNE5BOXNJ?=
 =?utf-8?B?bVRpYTYzUTlwUmJzS3RlZVE0ZjRKQVZLUUoxb0dRSXpYbXhrenpEcThqR3B6?=
 =?utf-8?B?R0pzdDBHODdYTXovQmVnZ1NHUTBFbGJJTHNiTkdlcFo3ZFdVVGJuRFA1MCtk?=
 =?utf-8?B?S1BORnRBWVoybjRJQVFyb1VtSDF1blZ5KzZ6K09XV0tibmtaaFQ1ZUFTaWd2?=
 =?utf-8?B?N0JGN3VtTmh4MmFmaUpHVldPNWtFbG1HUlVnVjhPaUJod1AwNVM0VGw0ZjdH?=
 =?utf-8?B?c3ZmWUQwa2dkd1JGWjRXdW9XTFNEOVkyN1ZPdTIybFBxUU1PVUw2NEQ0SFVZ?=
 =?utf-8?B?TkVQNzJuTHdXMG1WcHQ3ckxMU3pXMEl3Rkt5aEJDdUFscmlOdnBCWXdKdjJ5?=
 =?utf-8?B?VS9LNStDaUJvK2l0R2FnMFdBTDE3REFZZUpTeFowY2FXSndJWjNFQTBIdE0w?=
 =?utf-8?B?aVRUM2xybHd6T2c5MTFBN3U4ZDRpS0VQaUxKTWdDckl2Y1B2RDFQTkcvdGFs?=
 =?utf-8?B?RzhBblBSckxlMzlxeGMyQjIxN3QrWVRvb1AwOWVwM2N6a2hjSXRUelVRMXFI?=
 =?utf-8?B?RS9mMnBxVFlsZnQybm44S21kbytVcGs2dUJIY2w0UmpCc2o3eDRTL1ZlK3B2?=
 =?utf-8?B?V3UwVFlDU2plT0dzSGlnbnJMWVRpNTJ2MkM3NWhLRmpuUUVSNnlNZUZmTGcv?=
 =?utf-8?B?OW82eXdlZXFHeWtOejRJR3FFRzhTMWtqd2hwamlmWDVnZ0EweDFrUFlIMHAz?=
 =?utf-8?B?OW5aZ0UweFJKd2V6b0VseVNlQ0pYdmpmZUI1TlA1cWJ6Z2s1dXRVQk1iNFF3?=
 =?utf-8?B?Z3FZcnJZTzBWU0NCLzFGempIenB3ZlBRMThFQ1BWVFg1Njh5UlNZaTJUekt0?=
 =?utf-8?B?Vy9YUTA2Mm5NS2R4QzhOc1FxMGdTdkdodkh5UEdFTFl4QTNXNUk1RlVDaDRF?=
 =?utf-8?B?LzlHRHZFQkEyUkRORlFaRHRmcFZnbXZRRHhlb3FGYnJZblRCQnRTWnBvZTFn?=
 =?utf-8?B?MGlmQURkUWgxdWRvTFNRVllDUjJjejFMMXNzQmJQYkYrVWRLSlV5VFZvWHhr?=
 =?utf-8?B?WDRBQmpVS2tVZ2lTRU80bTh2eDJYWXB5SDBYOFFEbHg4WnlwaWQyd05td1lh?=
 =?utf-8?B?cFdSVlo0REd4bGd1SzVpVVdXZUgzczlCV1htN3RwRWRHallaWlFyVDBqUWhz?=
 =?utf-8?B?b0F1M2F5UGVsOTBqbFl1TW5hSk5ybkJOeHZrZVZYTklDVlVqVU50MXVRS1gy?=
 =?utf-8?B?NjVOTFlCaHpKL1ZtNU45eTg3MERDVlc2Q0s0RlArS0cwaTJSNkVSNHJ4Y3Rh?=
 =?utf-8?B?ZEM4YmpLQklVaHFzY0dtK0FTRTFhR01HUzluTlpnU1VYbWZzOUN4dlZKRFdq?=
 =?utf-8?B?eEVEZ3RCdEU0QnlOU0hiVGswSEtCRXBOOXRsTURzR2pjc0ZSeDJ1ajZ6SUxI?=
 =?utf-8?B?UVp4QVVQcTdYb3ZCRndjRlhtdlN4SExVMjEySG1EQ3NwaU1xSHpRRDdkWGcz?=
 =?utf-8?B?SEs1WkhZMWVRS2lRNnlCY3ozUWtoU2J4SFJtcjRRUXhYYkYxRjAxcFRPY0Zv?=
 =?utf-8?B?U2hwY2V6YS9QNGNiREljZjFYcG84VFUrcjFleVlBNGpDZmpEU2dzKzBkdjNm?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd460e1c-6b6d-4491-3488-08de28af9de0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 03:39:46.7848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9y9RLmoeHTOzyCvPTWun4wfFNFkVijSa06D+qO6zUIwlpmmTxXERN3kEAzbsYa5fXNMHTwKz9lU7BfmH+z94g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6513
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

On Thu, Nov 20, 2025 at 04:16:11PM +0100, Jan Maslak wrote:
> During GT reset, hardware is in an inconsistent state and jobs might not
> execute correctly. Fail the job with -ECANCELED, allowing userspace to
> retry after reset completes.
> 

What is the motivation here? i.e., Is this fixing a bug, etc..,?

> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 7e0882074a99..1a5f5bfb05bb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -876,6 +876,12 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
>  		     exec_queue_banned(q) || exec_queue_suspended(q));
>  
> +	/* Don't run jobs while GT reset is in progress */
> +	if (work_busy(&guc_to_gt(guc)->reset.worker)) {
> +		xe_sched_job_set_error(job, -ECANCELED);

This doesn’t return an error to user space—it just signals the job’s
fence (there’s no mechanism in the drm_syncobj_wait uAPI [1][2] to
communicate a fence error) without actually running it. Nor does it tear
down the queue on error, so the user will think something ran when it
didn’t, which is considerably worse than where we are now (see below).

What a GT reset does is stop all queues (e.g., guc_exec_queue_run_job
can’t be called—though this step can race with the GT reset), reset the
HW/GuC (nothing left on hardware), then check all queue states and ban
anything with a job that started but didn’t complete. The ban actually
shows up in user space: IOCTLs to submit to the queue report this, and
queries for queue reset status do as well. Any queue that seems okay
resubmits everything after bringing the GuC back up. As far as I can
tell, this is about the best we can do for a situation that should never
happen unless we have KMD, GuC, or hardware bugs.

Matt

[1] https://elixir.bootlin.com/linux/v6.17.8/source/include/uapi/drm/drm.h#L934
[2] https://elixir.bootlin.com/linux/v6.17.8/source/include/uapi/drm/drm.h#L952

> +		return NULL;
> +	}
> +
>  	trace_xe_sched_job_run(job);
>  
>  	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
> -- 
> 2.34.1
> 
