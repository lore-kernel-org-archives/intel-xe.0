Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46136D1D882
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 16:02:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5D210E5B1;
	Tue, 15 Oct 2024 16:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyBlgxUH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A5410E5B1
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729008162; x=1760544162;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UjX6vE0YMsKoU5J1VMdm2CbMyg7jrXmCQRhZpuGEgI8=;
 b=MyBlgxUHfwDVgmajdZjGp1TSzYBzVoweDy+jKRwECPcpYn/nWMVWYLDx
 mP8rDdVobdofJcVduqCxzl83xquKffUYbIsFLhNy4Kou681K5Nqi1U2Kw
 QSDCGF+o/VMgKngacnie3DZma8/i5vD0aEFk2AXzFtOSZb8z1nDegNEku
 /Ct6j9Fq4us5cI558coWh4s10ISOoXbk6gZ98ZunikN1iRbAg10J64pzj
 MnFCUXRzFu+eJLrrqVFKTdro9IG7u84JNJqcnfdycjHu2H9sYoW2XJS0Y
 V2fhj67LSAcU4gjPl5U8yKr8vbwPRzCu3RUTYVMDWBjkglKfkcWqvHOLH g==;
X-CSE-ConnectionGUID: dlD+B15fThKYxmWTReQezA==
X-CSE-MsgGUID: hVEs2CftQcuZzDtL+GJ97A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39534044"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39534044"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 09:02:31 -0700
X-CSE-ConnectionGUID: V4TSDAJbTiiVm1N8r4nL2g==
X-CSE-MsgGUID: U+azr+3rStKdKV0tIlAZAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="78012573"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 09:02:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 09:02:30 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 09:02:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 09:02:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 09:02:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=suMFDwLdFBJCaZ57+Dt5HpIoAIR9PXbSx0etsjyLw23St6wzO1ERghdptwfVQy2zyne8iEfYdW/gJnjm6P+5oRW6pZtf5HbcIZbWp/HjrEzIrUJyN7eV4yzETbjtdenFi9QijGRGhdq3PIvf7VREw+kmvPr7bs2xZda1y+hZnGPg+OUBzldVXL5JmaeSMxVOOnEf/DRCyQGMy0gb6JOnVC5JVhF/Cy+PKCtkx4GYaEfIV7ooa4Hldihj6h/3MpgPlEsBpnZ1ZCnlp8DHTlH17TMnjqQrVlNJEGXjeGEEKMoBWTj/5A36IVKdxW5baZT88fGs6VJ+QSABZhxuZsn8EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBmK+XGEHxTWjnwK7nObXlU+nXsuZ3EcbTsHuVo7rT4=;
 b=eMMPH8dLcNou48fttSgG5mb7S7uc4XekAIZY6pf0STrKNTxsAMkGALD013nL16AJqRmfWOpvEi8Biqk1XrKBxk9B5oUeteE+iAPg9a3BhdAZASwcZcxq9BK3dIHE6xJLSH4t2DZYZTC6Tkwb2BErUDoiAtj92MChCxzXfApmfBxLT1moMryW7praCPMbgsWA5JBaNHJsL6wxMsB0fdYk3Y74R1eCUaboECoZcNJ0xuaWiwfE5ykfVj8NVbeZqa1G5gjaGDfAUzPJnAG71CBTlYLa9O6tC1rCGrRIUTf4aLJHtQQFV2fOdZHkFRQJHuQ0n4iX+Y52Yg2k6EzuADO0fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS0PR11MB7263.namprd11.prod.outlook.com (2603:10b6:8:13f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 16:02:23 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 16:02:22 +0000
Message-ID: <e7d6675e-1b93-499e-8bd8-d5a529411d2e@intel.com>
Date: Tue, 15 Oct 2024 21:32:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 24/26] drm/xe: forcewake debugfs open fails on
 xe_forcewake_get failure
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-25-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241014075601.2324382-25-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::30) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS0PR11MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a80749d-cda4-4928-8769-08dced32c10a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDcvR2dveDVNNllKYXF3SzNjMVNXQVNJNTVlakFCQ3Z1RnBFb2lybnBlMEN3?=
 =?utf-8?B?djZGZTBHNE52Z2lzaWFGUFJ4ejRpZUpFRy9PUHcwMk1pcDJJRE9qY0Q3Qmg5?=
 =?utf-8?B?NVcvR1M0elBLUzZ6WnE3U1NwUk15WWRsc2VEYzk5cDYrdVFVdGxPYTUwVEI1?=
 =?utf-8?B?QysyeXFCT2tnRTVkY0NFZGUvVVJtS2l4TmFtTW4zZlR6RUYxNDNURVVQSmxj?=
 =?utf-8?B?bk00UGhweng1YnBnaExGRzVPa3hmZG82TnZQTG82RXlsanM4cHh1VCtPUWFD?=
 =?utf-8?B?cS9kLzA2SG1adjhScUxCbVYrRVIxQ3hBRGNpYWxyWDJhb01oZVJrbkhnWEtQ?=
 =?utf-8?B?ZTVVdjdZc05iRnNlNTlWYW9kejI0ZE5KSmdjS1ZlZ0dweXJoSE9oU0xxNWJW?=
 =?utf-8?B?KzJtc1N6RnpTcGJsVGxHK2NYNVBGTmU2S3A3L3N3Q3hRckZwUUhtaFFKNHNi?=
 =?utf-8?B?YWkxMVpCOVFNd3dRYllRdzlwMmlCUU5KRWFpWGdCTkhPaFppeE9IaTNJbWJX?=
 =?utf-8?B?NGcwckgvYjFXUXFtR2dmQmoxV0lsNTJRWkVadTljcE14U0Mra091UEhGbTgy?=
 =?utf-8?B?aUF2eFJzS0xLUmJ2ZTZCL2NMYzNZVHNxekkzNWwvKzJXZFIwUU40S3c5aEs5?=
 =?utf-8?B?TTZIT1lhclY0UFZudndOZENYdXBLeDNkUHRvRlZ1WmVhbmRhSGlhMG1TYzY0?=
 =?utf-8?B?emduVCt2NkROTnBuZU53bzI1eEFiZThyQkpITXdxVHB6TlJBczh0amhnU09F?=
 =?utf-8?B?YnBrQ0tVWEV0UWZtV2JrdjMwRFlZNm1KWEFXWXM1NVlubnQ4Vjc3SjlLclF2?=
 =?utf-8?B?ek1jL1Y2aVM5Rm1mM1RUZnQreXg0WGUvSThSdXdOUDZaK2w1Uyt5S3k1S3Er?=
 =?utf-8?B?RGtQM1QxZnVsQ2NoZlBmTUFpaWp6ZzU1V3l5MU85WEdNY1oyOGVuQklGa2Fk?=
 =?utf-8?B?bk4yNGtPTHp5RWc1RFdWT29TMExOc21MbEpkR1ozN041eUxWTTN1Ri9PVVVs?=
 =?utf-8?B?Q1hZYUVIbHZFd1ZOWWVMZFZySmgzRmZQamVlSkFUdDVUNkdGczczSXg3TmNV?=
 =?utf-8?B?Ty9rY1Jtd1pUa1NiUjkyYUxnTmduUThjYWsxT1FjVlhXMVlOakZaQkJtaTZ4?=
 =?utf-8?B?V2JkYkxRK2RmcnhlMENzZWZKWTB2SXZKOUtrQW5TSzhQQWdFaTdrT1dlaXpZ?=
 =?utf-8?B?NjJXYk42aGFnSk9reWIxdi9ubzBjNEwrSElJdHNHdHA0S1lVd3J6cHJ4V1lE?=
 =?utf-8?B?bWtzVVFaRit1MWl0Y0pMS3pOcVd2Z01EK1dNRG15REdaN1JZeFc3OUxUTHhR?=
 =?utf-8?B?WGY5aTczVnZBL3IrRkdwRFBjNzhWRkNzYXlOUjlkU3BuaXBWcEVEZFlHTitw?=
 =?utf-8?B?a01jSTVxSDV5MzFXWjc1bkE2N1JtT21yOVBONC8zSGNsdng1bWhsTUVlOGpZ?=
 =?utf-8?B?ZHRIbWp5SW0rVDdNS1J2SXpnZCtOZ1FUcDllY1NGMW1NNzAvNjJhR3RjcVBu?=
 =?utf-8?B?RVl5MWNwNmFNRHFwcXZoUmoxVmU0VVAxTkFPYnpGR3RyS1FqV0x3WFIwSGRj?=
 =?utf-8?B?SUZQTVNBNVpFemp3cjBaRU1KWUNubFl4QW01TzNLK3BjdUxzTXRFbHU5L2Z5?=
 =?utf-8?B?b2x3MjFqWEpGSWZqUS9EOWwrYklodktRTXhvbmhIejJXMlp6MVJRaTBPTDhi?=
 =?utf-8?B?NFowQWFCWDhkM3F6RnZ6VWpGTnhsQzhkM1p4VFMybm5OY1FFN1VsZjh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2RwakZyN1VsNEJ0bFVtVmlwUE8xODlVd25oWUN0WGcxT0pMMWlsWHNjRlJw?=
 =?utf-8?B?THZra0ZtTnZmbkthYk5SaWR0QVhIZThXV2FwNzRDRk5RcjBIRitTUHV2SHJR?=
 =?utf-8?B?YTd5UzRUSHdPTHppeXU5Slltb01rWDh2NnRiZTJqajhvUml3amhtYy9jWXV6?=
 =?utf-8?B?Qzc2T09QUE0zV1djdUttcGlKOE5tMUVqZC9OeFJoWjF1WVFJdGd5TytKQ0x6?=
 =?utf-8?B?WE4rRm43eFNGR3lzWS9zNFdWNkZ1TktQYU5OMXJzWkpDY3BoWUw4UW5LTVlN?=
 =?utf-8?B?T3lHZExrK2ZXY1RPTENLVTkxMlg3NlA4R2FnNjA2RGdnV3hBTlJtMmUwdDh0?=
 =?utf-8?B?czFON0pGRUM5QlhqZUpZNFFhaTRSM3BXMGF1TTc3WEVLTzRJUVlDVDNCTWZM?=
 =?utf-8?B?a0tXU052bC94MFJXWE94ZFVaT0Yvc2pmYzlzaDlVek14N3JQOWxjV1p5OUhC?=
 =?utf-8?B?b2ZHaUlGVmVEdThSRWJCTU9pSFpTTlNRSElxeU1UNkNDK3VMb2RPQ2FDSytM?=
 =?utf-8?B?K2V6WFFDdWVmWjFHc211MTVVbWp3bzhOcXg3ZGZYN05iUHAwRDJVNWJzcG1C?=
 =?utf-8?B?NUI3Znl5VEpJZWlyR3FRSUtDL01ET0cybG1JSHVwQnJqYnIvYmdGREVIOHFP?=
 =?utf-8?B?RGZMMXJxb29JWGJ6QzQ2aEtrK2pCNUlLS2xyWkdlNmgwb3BtbVp6NldwQmg2?=
 =?utf-8?B?bitxb0FpRlpXakFNWFpGcWkwYktmVG9Zbkg4eVI0QlJHUmpaT3N3OERJVHg0?=
 =?utf-8?B?REJlNmJURjZxcFNWMEpVR3JPYitxaUIwelhyekFrc2JIV0V6L1lzT1kwOWtk?=
 =?utf-8?B?VGNTNGhZd2c1Q2Rqa1NmcGIrRlF5MXRscEFlTnRmbnJsd2RoQit1bmFWdTEz?=
 =?utf-8?B?alU2YU8wblBuQS8zTFpHL2VncGlGL1UwTjhLLzhTQ29nOERYQ0ZlMHorZUls?=
 =?utf-8?B?ME1MSlcxZ2pibHZkKzlkOE5JVWpPUFFrZHdoRCtYazZ6WkgzVUd0WVNvbFhE?=
 =?utf-8?B?ZHNsMnV2dG8wRmNuNmdBc2NQUDZWU01FRnBBQ3ltQ1Q0QmdvZFR5bVhBaCty?=
 =?utf-8?B?UTJVQi9wZkNSWDJveVdvVXZOR09ucE4ybHlyMzgvbEpaejd4RElKR3hHYzdG?=
 =?utf-8?B?eU5ZakROS0hsaklqYUZsZ2Y3WUtNczVNNVNHSGFZMmNUSEtXZFhxcVBINHpU?=
 =?utf-8?B?a3pSTSsveFRaN1JvTTdFcENiUFlNVmVreVlQOTZaUDNqN0hQcFkxc29JT3pU?=
 =?utf-8?B?RDZ6RWxEN2pMQzdIRjV5TnJwZ01vNVg4ejRvY3hmU3FmV2xNdW5Cd2txSUUy?=
 =?utf-8?B?TlVBZjBNcXVOZEFSQVZENEpPVzk3Q3BCaFVsd2tIM2RYZDRZd3BUTU95Z2FS?=
 =?utf-8?B?RHNzU0FjM0JhWTI1bnFieFkwM2duM2l1RGRTZ1UvbWI4MzNFVVFBYzQ3d2dh?=
 =?utf-8?B?RXdmOW95K2RoYndoYzJtU0NuRHpvRkt1S2VlWWxsTDNTSFFlZ2Z5RlRZbVhP?=
 =?utf-8?B?NHVqY0U2OUtjdHdTS0w2RW5zK2luMnhGMmp1Tm0zUFh3R0lpTDRLaTJzM3dz?=
 =?utf-8?B?UWgzU1g4S1YraW5SQlBhcm0zZnQyVTlmTWtuQTRZUU5CYVUvN09vaGpwd05r?=
 =?utf-8?B?enNleXNmeE1scTRub285NUd5U3p5TEVEWDdsdE5vK3pnM2RTWllrSmRsNG5S?=
 =?utf-8?B?NTZzZTdHSnJmWGtmbHhQN1ByUDA0OVo2QWwzSDhwY014VkVrTkdUekFocVQ1?=
 =?utf-8?B?QUNuOFpsVHRwd3lSZ2k2cDdZS0l0UWVxSGdQeVRscEVJbU43d3ArTG9sSUl4?=
 =?utf-8?B?SFViT3lhWTlKNWV5bUZWRFhsTDB2RDFlVGtva3pBNEtOSm5BWWZoMy9DRlFC?=
 =?utf-8?B?UTU5ZllhM2dITjN1UlA4Q0g5MUpqV241SzBycXVKMU00Z1ZHbzRWS2VTWVA1?=
 =?utf-8?B?b2N0N0V0TVZOcGNlMUZTQlRYc1dZQllhVVFLYTlRSm4wZENFTlorNVovaE1U?=
 =?utf-8?B?VVdIQUdZZXlvckpEZXBxMU1SYnJmN0hNMEFUZ1o3RnRTVTFBcXhVMWovMDI1?=
 =?utf-8?B?Vy9ob3ptc2RUdTlXYUNzYUwzUUlxS1B0dnZaQkVJZllINXlHN3lSeWZRUy9r?=
 =?utf-8?B?Q1k0NW9UcE42MmxEdWVZMXVKUUNwbGMyZU1saVh6OWpNODVmZm5oU2ZVamZx?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a80749d-cda4-4928-8769-08dced32c10a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 16:02:22.5803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbbeE+bJuKSg17KA4ir9e89RlO6nk750r+PTokjW/4Ws+q+4oX4k71HMP7im/Th8ZH2QUiEEj6j8uMtCBa/ITQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7263
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



On 14-10-2024 13:25, Himal Prasad Ghimiray wrote:
> A failure in xe_force_wake_get() no longer increments the domain's
> refcount. Therefore, if xe_force_wake_get() fails during forcewake
> debugfs open, return an error. This ensures there are no valid file
> descriptors to close via forcewake debugfs, preventing refcount
> mismanagement.
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> 
> v5
> - return unsigned int from xe_force_wake_get()
> 
> v6
> - Use helper xe_force_wake_ref_has_domain()
> to determine the status of the call.
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 27 +++++++++++++++++++++++----
>   1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index fe4319eb13fd..492b4877433f 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -90,13 +90,32 @@ static int forcewake_open(struct inode *inode, struct file *file)
>   {
>   	struct xe_device *xe = inode->i_private;
>   	struct xe_gt *gt;
> -	u8 id;
> +	u8 id, last_gt;
> +	unsigned int fw_ref;
>   
>   	xe_pm_runtime_get(xe);
> -	for_each_gt(gt, xe, id)
> -		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	for_each_gt(gt, xe, id) {
> +		last_gt = id;
> +
> +		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +		if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +			goto err_fw_get;
> +	}
>   
>   	return 0;
> +
> +err_fw_get:
> +	for_each_gt(gt, xe, id) {
> +		if (id < last_gt)
> +			xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +		else if (id == last_gt)
> +			xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +		else
> +			break;
> +	}
> +
> +	xe_pm_runtime_put(xe);
> +	return -ETIMEDOUT;
>   }
>   
>   static int forcewake_release(struct inode *inode, struct file *file)
> @@ -106,7 +125,7 @@ static int forcewake_release(struct inode *inode, struct file *file)
>   	u8 id;
>   
>   	for_each_gt(gt, xe, id)
> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +		xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);

LGTM
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   	xe_pm_runtime_put(xe);
>   
>   	return 0;

