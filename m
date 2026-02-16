Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA75E81A36
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 15:30:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E5910E081;
	Mon, 16 Feb 2026 15:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8Esbcsx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E64F10E081
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 15:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771255801; x=1802791801;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7OHCrZd31oclsyXKxjeok4n6BPIa2oCP60EhVR8MUeM=;
 b=c8EsbcsxoYaIqxlGO+ewNDy8neJpOnajMK+w6dwli7jdacUP32Y5mazd
 5l5nL6wQBWlng2NHXK8vVtNhGu4FB+9j1KOGHScroyk3ys22Fif8F4SsT
 VRGx/7vtOV1UgG0cc8iTMi6jmTYIFNxpuV0RjAq35d/9u79PCmiUPu8Y1
 1ijceNrRuWXIFKtg5bPX+1Y/MuNV6oS7kf8O9RXJmyYmmyYsvLaKilnkL
 SEZX11J1Qi6YibXQIKIBQ1r7dUCvuydMn5NkMKzl/Lc1y5B5c7s7dzoV8
 9q9m9V51MtmyYzmMnegnrmsOl2I5ZCgcww1VCK3gc/xLFO4iHIQ6B6zlz g==;
X-CSE-ConnectionGUID: a/bNSWT6TB2nuCoU5TAvow==
X-CSE-MsgGUID: uWlmW7teQPqAmwgxqgWs3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="74937833"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="74937833"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 07:30:01 -0800
X-CSE-ConnectionGUID: FjsdICjYTbe1nWdOacSuxQ==
X-CSE-MsgGUID: 5tohirGxT6+CIma3BCcjdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="244225996"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 07:30:01 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 07:30:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 07:30:00 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 07:29:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOuG6W4p422gvwUnKJWQZjYBWRsZ1z9iqp6uyxCk+0LA5erPWCNLUk5fMeRhfzA7P13Zt9/KD+Q/ZMVP1ofEZTeL0mveSikBnbyGAYBPlypyAYGfoSaCCpe9laXip9cdWkNE6cB0hirKN4z7F2zzf9JF3O3qzqAZ2FbymkrnrXSEq/eYdq1QAiE+DgR+qCEU/+TI80N6nexFOqMgccCIqQgy8pW6U0ca25jC1JWmSdsQGa3F+rg91Makba9Rjb6d0A1DdZ8RePRHWyI33jpo/lOubrSFDYxnV45H6TmdF1MoL7iZM3URj/DcOCHUNtZLrjSUZFPbemriUaGFDvmiXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7HWZywMA+g9EcP8jXTasmdhRPkPKs3dD5kqEk7tAuA=;
 b=ErtovNCJlOrvmhCZZAgTWnkpG4TdXZsLlTjhib9zd2VwPTKKJDDASwJ6CMZ+gbH4T/c8cvCUHpfMLTuWqR7MUVioTINnCO+Z3SvC+Fcfv1srBNv4hpMUYPiJTbtb5m0pMn8ZIKRgXrWonhawU1A42gXjdoJ6X/GkRjvdjTzUnLd/zTEJhwHBUy7k+S+Jwt7yJ517bRYkTFvFjnuC9ttNStggZLjxh9tbRv6daNaMdiKkee0XtbYxlkfIiMhjk5ACQeQZKar+8Bxqb/MDdXtLtmxUgTfkGapIDxcCyWrZO8ijG0oWnsewMkb5JcUHhINafB39TiHfz7ol3IzXNaTEmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ2PR11MB8422.namprd11.prod.outlook.com (2603:10b6:a03:542::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:29:57 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 15:29:57 +0000
Date: Mon, 16 Feb 2026 16:29:54 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 3/9] drm/xe/pf: Allow to change VFs VRAM quota using sysfs
Message-ID: <20260216152954.pv3g6vre7hoql7xk@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
 <20260215203323.595-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260215203323.595-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR0202CA0022.eurprd02.prod.outlook.com
 (2603:10a6:803:14::35) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ2PR11MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b36951d-9986-4406-8ac8-08de6d703d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZERyRVFWWGI5bVUyNkNsM2tObWkrL29wVXlhbUt0Qk11OGVNMnpyNXduV20z?=
 =?utf-8?B?aW1kY0tIUHhqVklkb0hJTzdXODhpWkprWFp4N3FMUVRzYTJWQXordmxiUDhz?=
 =?utf-8?B?UDhiRDUyMExYUzZidkg4cnRpS0lEczNESkV1T1U1ZlBJYXRRa1R4RGlUYmtE?=
 =?utf-8?B?R3JETlJXM0t4a0VsYkJqbWxMTnZCL3J3MGdFWktmNnFOODdIdFdiVzVoWllm?=
 =?utf-8?B?RGt6dkdNWXowNWhhRXp1UTdxODVzSEplSEtXaXNnT1hXMWdDc0lic1h0bmh4?=
 =?utf-8?B?SE1yTm0rWTMrVS92WFhFeVl2YXkrb3BqTDh6RlB6eEtscUkra1lwTEVVdVRC?=
 =?utf-8?B?QUtjTTNhc1dvNVhZcHJ5d2NMc0puLy9YWEh6eDRlbTJybXl5UXRWeDNCNjk4?=
 =?utf-8?B?dzNQMlVDUVdWVUNKbUhueDg0VVFkRlBiN0RucSt0NUUxZVArVFBvYlFPL3JE?=
 =?utf-8?B?U2JPRWpZTmR3UUs3US91d0tXSSsyWHRCcFR2bEYrQXlRajMxZGVhTWZaUWhX?=
 =?utf-8?B?RGdFZjJsRUQvaXA1VlNhZk5BNDFTOTh6aHBBcW5qRFh4ZTdUYjU5SGRPaDZE?=
 =?utf-8?B?Mk1sSE96K0NlWXdSM1VEK3lCc3lQN0pnSW1HVGtackNmWnVzWUtkbGtYSnRI?=
 =?utf-8?B?amo3SThVT3R0QjVvTzFsd0tMVXNOTEJZc3VGY3FNMFlaZjFtWlpHc1A4elhX?=
 =?utf-8?B?aWZmeStvN0tuc0YwVEp6TEhvZEJ1M08ySXJ5M1NlU2FFd3R4aG5JV1RLWVZI?=
 =?utf-8?B?TnhTNTRuYXJJSmN2Q0QxLzVBdERWcTBhVmZNVWhJSURzSktaUzU5dW9sYStv?=
 =?utf-8?B?WFRjTjBZbDhtYzhZSThNTkpwWWV6TWFDQjNkRjJsSEpjb1U4bElxQ3lJZHFG?=
 =?utf-8?B?MjFPaDJaSjN3ZFArb3B3SWpURkxKenRuU1doakxJN2RJOEM0RnRhb29nZ25j?=
 =?utf-8?B?MitKZ3FmdlBNMUFxYnlSZFBTUTJqZCs2MSsvTVAvS0Zyd1h0ZGZOSjhIdmZP?=
 =?utf-8?B?cEV6MUZIT2MxTXU0aFZXS29nVTBjRU1rdXU5SlYrMitnaXEralA3Ylp4RVVY?=
 =?utf-8?B?MWYvMDVsTHlSZjNvcFN0MW1nRTdrVU9ONXB5MmhlbFErV3g1clhEbDltRklJ?=
 =?utf-8?B?RC9NM0tVYmRKSWZ1MFF1RFVaWXlQeUFCS2RoY1V1WUdHUyszMUtFZFJ6eVB5?=
 =?utf-8?B?N3ByQmkwNVhxcTNqV3ZuVXVSaTdob0t2OXRFaVEvZjRsdXZDL2lNTi80ZFRD?=
 =?utf-8?B?YWJCODZkbFJvUkN0d21wMkh3cllIeGVHNXk5bk5SbCtMOWpWRjFBSTNxRlQx?=
 =?utf-8?B?QWRvZ2YxM3NTMWI1QVRlQ2JYZlRkRjVncTlpcEhRTHVCeG13cnNsc0xtQ3Jz?=
 =?utf-8?B?VmRUL2hKZitNSUlBZ3N5d3lsRkEwVGExQzgvRVgzcXJ4NEMrb0tuSnY4RDNY?=
 =?utf-8?B?REwrS3QrK2pudDVqOTJuNU1HTElHZHdIbFpNM3UvQU95QWVkT0k4MkY2TGgx?=
 =?utf-8?B?STlOWlhYMmZaMm5adGVHVVpXVk80U0RxS2NzVStzemd4YkREZ0wzTno2V0Y1?=
 =?utf-8?B?MzF1UlhCVmxnaTFBN1cxenBZeDM1Z1ZTOW9DQjIrUDJjcGY5aHRDa2x2amE4?=
 =?utf-8?B?UW1GNjhDb0dwUXBlVGExK2J5bkxKYWxKTXFlbmxwVTNrZm8xUWxPUUh6VFBj?=
 =?utf-8?B?VElhVzVaQjl0b3R5cCtQMFJZM2NlU013WkVkMW5NaGRKeVNHTzVBMWNPY0g3?=
 =?utf-8?B?NTY2b29OZXBjd2dsVGdDdnNrUDc5cnRHR2dpSjVvM0tpcUFPU0F4NUxVSjRD?=
 =?utf-8?B?ZiszMlJZQ2ZqUkVVTVkvY29SZzlPcDZZY2kwV2FCbFpIQTdIMTZ1Wm5qcVhx?=
 =?utf-8?B?V2J5OWloN2JwdDU2QmpDWnRmQVJCaUUzL2Iwc05jWkl0RG9ndWpTVkF1Z0Ry?=
 =?utf-8?B?dlV4YVFGUGh0M0ZjZlZVTVgyVFlIT1RLVVFFRytiU0VGcm1zWFhvUXlBbTZp?=
 =?utf-8?B?Z01qWktCRGxoUmFueVFacTRzTHFkUmgxOFdOTU5WZk5SbS84Y1VzMHM3c3dF?=
 =?utf-8?B?ZFRydkFJaEhsTXNpcmxXTVp4TTNkSzY5a0h1NENQajBCZm9OL1FrZFZFN3VQ?=
 =?utf-8?Q?pwGg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEdVYlduU212a1RydVdsUlVGOEhERkxOSVhsdnVuTFdYQmJsYzcxOUgwTG1n?=
 =?utf-8?B?YVZaWG53bXM3UnNoMGR0NGVUYit0cWJMT1dLdGQwMGhvVitKV2xpZVk1YXFJ?=
 =?utf-8?B?QlBKTkxVZlNOWmpBMEdETUdtQko3cG0zNE9WN3VwWk4xaWMrWTNpM3Y1TkFY?=
 =?utf-8?B?RXgrUVdLZVVBU3dlY2VJTFh5M0xzdTlEU3kxdlg0RkowMVV1emV0RDV2eXYw?=
 =?utf-8?B?ME5iSnk4MGJIRmM4K1NDUXM5MEFPeitVSDRSdmpKRlZlVXZZVGdqTFRJeFRF?=
 =?utf-8?B?Q2tHQ0xmUmlWeFBYQU1hK3lJS0ZnMmE5TDZyanpDRUZ4anF4ekRqYmJ4Mkov?=
 =?utf-8?B?QjhFS3Q5a2d2MXlza0JzTHhrc3NSdk82MXc5cWVjZ1VJSmpOVHlXVHVPS2Fx?=
 =?utf-8?B?bVdNanJZRFRDV3JZcFBobGk1SnNvUmZ1WWJuc3VYTE91Smxva1piQnVmbUR5?=
 =?utf-8?B?SUNVWmpnL1RuOEduclF0ckd6dVdaRS9rZ2NKblBVNWJ0cUVES3NLMnpERHkz?=
 =?utf-8?B?aFNPWTBUdWVBYk5FSGRCYTVNc3Zoc3B3NXA5cFBNdXZNOURvRmVmL2lybEd2?=
 =?utf-8?B?MjdGeDg2anVUL0ZKcG1VcDZwdDN6dnVUT0dXVXZ0VFVoeHhxUnRBaDBEKzZE?=
 =?utf-8?B?NVhXU3VMY0lDR0dlVzU2VnBuL2pjNTZ1Uks3M0ZhWlU0M0Y4MnZmSXY5VWFW?=
 =?utf-8?B?YUpZTlJaSnVuRUMyTlJiYkFXZ05GM1hTdTg3b1I0MUhhQjk1ZFZIQnRDTGw5?=
 =?utf-8?B?dGxVbWJsTGJWQXMrbi96T3VDYlFFZjFjQzFMQWRVM3AwRXArZzR2S1ZFQ0lX?=
 =?utf-8?B?dWtOeHBSTFdRamdaUExOZlduTEpObnhFaUx4QWRxcVUxOHRoUkFaRW1nY0Zn?=
 =?utf-8?B?ajZvbDA5bWdKZnVSWXBjTm5OYURqdkJCMW4vSXIreTNpa2N3VjJnUlJRMXV2?=
 =?utf-8?B?VldGc1RoSjg0ei9DV2NVdDRsTU9Ed2tHT1lISHp5Y0k3YldpZ3B4L2xqaXhu?=
 =?utf-8?B?cWVqNDRiT1doaVFsZlFVemNDdmlWb1VQT1V4b0xZZDloMlZHRTlZdXJzNS9r?=
 =?utf-8?B?aTFQdlBLaTRhTGpsa1BhQlp5aW1pYXpRS20zcFNadzVnTytic1lJN1JhRTZU?=
 =?utf-8?B?SzVnMFZSTUdVYm1ycVV4Rzh4WitkNnFOWFV0SnNEUWJNMURKNmFmbmJLZ21D?=
 =?utf-8?B?Q1djS2NlNFdpMEpVQ25vV2R5c0ljUDlLSUxBVGJsaEhoa2FJMnNrWUJ2cml0?=
 =?utf-8?B?Z21CamJyM1RZQkViTFJxOEZLc0t4cW9pdm91UlFJYW9Nby9sV3V2b3ZVSkFM?=
 =?utf-8?B?dGlBVG54U0RCSHBURHpxVkRzcjJkTzJzVnNSUi91d1RMTlZudE0rYWZHdWt2?=
 =?utf-8?B?czlEMkZKcDFpR0dPTnFidjA3Uzd3WVMvZDQ1cnFrVndwVk95SHc2cXR5a0pu?=
 =?utf-8?B?OHNHa2IrOUVWbHlDNXNWa2pNamM0bEs1TjVITGg2aTR3SURKMHVIaHhaci80?=
 =?utf-8?B?RDV1OU5JV3Q0a0prajJ6RGtPOUc5d3ZnbHRPZndJNUd6MFAvU3pGYnM2Z1Y2?=
 =?utf-8?B?dFkxUHRQYVFlZ2ZzSGxQdWY0azRGbXptTlNDdUpsQXV3ZXZVQjlkbHRqaElG?=
 =?utf-8?B?emJUcHUxc3VlK1V4TnZzWld6dGVkOXZMUXlZOWtmQWNwdk0rQWMrQnlNQnN3?=
 =?utf-8?B?WG9zTVZiWXpIWVV3Kzc5V1FtTFlxc24xcnY0dXJjdDV2YUpNZ2E3RDFBRWZt?=
 =?utf-8?B?NVpsVUFnL1ZTYmNzU0V6L1ZzOWlVN0tpS050NTVXOHlHZ05hbEM2QzJFRU9h?=
 =?utf-8?B?ZjhwRi90bUwzWTlLN20zQ2NwdUZ2bzBUOG5lQnRmWURnTnJvd1NUUzNpVmZV?=
 =?utf-8?B?K1NkaGxPd3N3Rnc1aml0Z2FlV0RBQ2ZQODlRbXI2KzNSVWJycUNKdU9KY1hI?=
 =?utf-8?B?WE9UR3VIZ3c3eWpSWnZBNVFidis5QVVBa1o1UzlLWDI0Qm5LUjVUL3NxY2dL?=
 =?utf-8?B?ZUpOdER1Q3EreEVmcWMrWjQvVGlCMnRRbXRINFFDQ1ludUNPYlJPTEtFS2NZ?=
 =?utf-8?B?d2hIdFUycDgzMTNCSitWd0ppdEpQamFnZGE5Ri85YndpdzFHSmhkbVFXUE9j?=
 =?utf-8?B?SG4zSmNZektTaU5xbUhENjZpdllVVHAxTUZ4bzdwQXhyaFZtdlhHZ0xUeVdR?=
 =?utf-8?B?NmphNXFEZXA2Q3d0aU5UKzlLUG1IZ0plY1BSb3hUenZLdXhBYU5GVXl4dGl2?=
 =?utf-8?B?YmxaRml3Q2s2SVU1RC85a2NmWXFDTUhGTEtCQnN0NXI4dHo4Y2JpRzVWUGRl?=
 =?utf-8?B?TG50alg1NDlpVVFPK2dTNmdJT0JjTmNVMDBuR3liMWxrL1E4ZUppQW5mK2VU?=
 =?utf-8?Q?/613FFK/3p5j7Umk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b36951d-9986-4406-8ac8-08de6d703d9f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:29:57.2395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgcpeY/SUHiLiPyycPCvQsJRvoAirHnPtkSjA1DT/7hW9qS+sSVVbA+FD2uPeHTNtUFSod4/6J9r1cvk6C/lIcPKlJa0Xv+YbDZkA7XwIyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8422
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2026-lut-15 21:33:17 +0100]:
> On current discrete platforms, PF will provision all VFs with a fair
> amount of the VRAM (LMEM) during VFs enabling. However, in some cases
> this automatic VRAM provisioning might be either non-reproducible or
> sub-optimal. This could break VF's migration or impact performance.
> 
> Expose per-VF VRAM quota read-write sysfs attributes to allow admin
> change default VRAM provisioning performed by the PF.
> 
>  /sys/bus/pci/drivers/xe/BDF/
>  ├── sriov_admin/
>      ├── .bulk_profile
>      │   └── vram_quota                 [RW] unsigned integer
>      ├── vf1/
>      │   └── profile
>      │       └── vram_quota             [RW] unsigned integer
>      ├── vf2/
>      │   └── profile
>      │       └── vram_quota             [RW] unsigned integer
> 
> Above values represent total provisioned VRAM from all tiles where
> VFs were assigned, and currently it's from all tiles always.
> 
> Note that changing VRAM provisioning is only possible when VF is
> not running, otherwise GuC will complain. To make sure that given
> VF is idle, triggering VF FLR might be needed.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> index 82a1055985ba..09deda2fd8b2 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> @@ -44,7 +44,8 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
>   *     ├── .bulk_profile
>   *     │   ├── exec_quantum_ms
>   *     │   ├── preempt_timeout_us
> - *     │   └── sched_priority
> + *     │   ├── sched_priority
> + *     │   └── vram_quota
>   *     ├── pf/
>   *     │   ├── ...
>   *     │   ├── device -> ../../../BDF
> @@ -59,7 +60,8 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
>   *     │   └── profile
>   *     │       ├── exec_quantum_ms
>   *     │       ├── preempt_timeout_us
> - *     │       └── sched_priority
> + *     │       ├── sched_priority
> + *     │       └── vram_quota
>   *     ├── vf2/
>   *     :
>   *     └── vfN/
> @@ -132,6 +134,7 @@ static XE_SRIOV_DEV_ATTR_WO(NAME)
>  
>  DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(exec_quantum_ms, eq, u32);
>  DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(preempt_timeout_us, pt, u32);
> +DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(vram_quota, vram, u64);
>  
>  static const char * const sched_priority_names[] = {
>  	[GUC_SCHED_PRIORITY_LOW] = "low",
> @@ -181,12 +184,25 @@ static struct attribute *bulk_profile_dev_attrs[] = {
>  	&xe_sriov_dev_attr_exec_quantum_ms.attr,
>  	&xe_sriov_dev_attr_preempt_timeout_us.attr,
>  	&xe_sriov_dev_attr_sched_priority.attr,
> +	&xe_sriov_dev_attr_vram_quota.attr,
>  	NULL
>  };
>  
> +static umode_t profile_dev_attr_is_visible(struct kobject *kobj,
> +					   struct attribute *attr, int index)
> +{
> +	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
> +
> +	if (attr == &xe_sriov_dev_attr_vram_quota.attr && !IS_DGFX(vkobj->xe))
> +		return 0;
> +
> +	return attr->mode;
> +}
> +
>  static const struct attribute_group bulk_profile_dev_attr_group = {
>  	.name = ".bulk_profile",
>  	.attrs = bulk_profile_dev_attrs,
> +	.is_visible = profile_dev_attr_is_visible,
>  };
>  
>  static const struct attribute_group *xe_sriov_dev_attr_groups[] = {
> @@ -228,6 +244,7 @@ static XE_SRIOV_VF_ATTR(NAME)
>  
>  DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(exec_quantum_ms, eq, u32, "%u\n");
>  DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(preempt_timeout_us, pt, u32, "%u\n");
> +DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(vram_quota, vram, u64, "%llu\n");
>  
>  static ssize_t xe_sriov_vf_attr_sched_priority_show(struct xe_device *xe, unsigned int vfid,
>  						    char *buf)
> @@ -274,6 +291,7 @@ static struct attribute *profile_vf_attrs[] = {
>  	&xe_sriov_vf_attr_exec_quantum_ms.attr,
>  	&xe_sriov_vf_attr_preempt_timeout_us.attr,
>  	&xe_sriov_vf_attr_sched_priority.attr,
> +	&xe_sriov_vf_attr_vram_quota.attr,
>  	NULL
>  };
>  
> @@ -286,6 +304,10 @@ static umode_t profile_vf_attr_is_visible(struct kobject *kobj,
>  	    !sched_priority_change_allowed(vkobj->vfid))
>  		return attr->mode & 0444;
>  
> +	if (attr == &xe_sriov_vf_attr_vram_quota.attr &&
> +	    (!IS_DGFX(vkobj->xe) || vkobj->vfid == PFID))
> +		return 0;
> +
>  	return attr->mode;
>  }

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


>  
> -- 
> 2.47.1
> 

-- 
