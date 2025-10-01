Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14633CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 14:06:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60E010E243;
	Wed,  1 Oct 2025 14:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Le18B7+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A7A10E243
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 14:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759327597; x=1790863597;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=baKH5SAJu2lIVOF26hI7u3NyKTAbdkdcAwR5mPM3x+k=;
 b=Le18B7+5TdwFhXQKcbeJ/mAjekxC2MFafo/dCuF7pnumjmPF0pqV+VNA
 xOfiR38ZQGVdKIkB/ok1TlSF4+fUa1GuJ9DJ5hP65oUnyXSoA3JFb5bZw
 3+H2c4ROuAGldq+tDsOg+Ce7+prv9ugvSdDY1Iaa/GfZD7cOIWaXt+BpF
 HHd7KXkY9UQUR6rd5LZBJK/ptOtzq7eWDSR8u7btfuwAwWCkJN/j5Nrd7
 729ZlEVJ4VT/BtybusTIDcirGAeXC5ThtdTMV8it63t5Gm9SO3Ums3u28
 9JX4t57Yt5+XGyRVPan+6MOIPJ3YMDsC+X892lMkeg1dE5FOpOK0ssC67 g==;
X-CSE-ConnectionGUID: 6SJSQ9+7Rhqw8HMwws2REg==
X-CSE-MsgGUID: q7Wnov+UTguHxCfsePQ7hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="73026199"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="73026199"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 07:06:36 -0700
X-CSE-ConnectionGUID: 3UAiLrq1Sla/V5kgZcCKrw==
X-CSE-MsgGUID: D0NHmj3VQdKsX94z62ObzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="179566449"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 07:06:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 07:06:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 07:06:14 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 07:06:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tygLZNxZX5AN2NutNwPFc3VHm40jxzt1Ny12CS4FIGeJBKyN83jxA30zxpBd2y/8nEJioAeh1x1bVLBwzZrjTBmpnwIHstXKvD0aIkP5sZIa8nS42e6PuY+8yl6zGdwy9Cy+uJ3q+5dNT7MHo/HGRhFAyBDl11xrz6ltm/irwp1i9I0e55puXbFFPEniUku7JxxYsuePHwpCixI5OxzkvFXRGTHFW7tMq5n8XOATdb8YxWB9nzSzsSyt5zLQwaPJlDmv/tGGGbmWjO4Uyd8gsPl362PUvM+tAvTIunauUMNEhRQYoy+h9BBSGg4nINWuDKECnaE2oRwHfFKAKP5NtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8bVBCDslJwaWvxsQDJy/Zh9vWzkhG1eazqDYWVWT84=;
 b=hDYtgepZ1hG1xbA1I2zmspMtgDaMWbF3OhVhbzmFZ33OeymbTFx/MgRMKMNzEmRwohDARHci2EhDiOAt5uZzKIeLr9KL2IlFH9GOcGDcj1k3/MrVCtBt7kVeiTSx1tU+3d4aPaePwqln94gnWvQ7Jr+LeACHKLf/jaKRgBmgPViqsO1ajUO5Yd+pYNHhdhihOTNsF2wX+6RbepHvYBqlDRl4p/SDPwA5+BsmZeOUCdEURkulnGE5W9jgcW6AasuMkDxKjQuLSxPZzLW5lb3+ictT6TbuEsQWVuiyNdMRVBsWc8T/nNzM5CpmuwysFnDCrtPtqJeo87PxEQ8egx2dGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by PH0PR11MB5029.namprd11.prod.outlook.com (2603:10b6:510:30::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 14:06:11 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Wed, 1 Oct 2025
 14:06:11 +0000
Message-ID: <e015136e-904d-4aed-a1e9-2115be18839f@intel.com>
Date: Wed, 1 Oct 2025 16:06:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 27/36] drm/xe/vf: Abort VF post migration recovery on
 failure
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-28-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250929025542.1486303-28-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0060.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::37) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|PH0PR11MB5029:EE_
X-MS-Office365-Filtering-Correlation-Id: fefd9a0e-ff0c-48c6-bdae-08de00f3ace7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWlKSXIyMzdqNGt6MUF5YXZxcVhGMFNKbDNDUHdNWlhOR01ESS9RNDNvY1Bx?=
 =?utf-8?B?UVEydWdDK3E1d1JNWHhlK042cUNXTXJGUjBNK0t6aDZORFg2a2ZYZkVCYXBU?=
 =?utf-8?B?djUwOWZxNTFXSkNlbTN1Q0gyVkxEYWppNzZFYWV1cHJMakFGRTB6RlQrNmdO?=
 =?utf-8?B?bW8xRzk2ekpyRTRWaVB2SXlXRkFjYlBrZWZESGV5YjdUTzh2VGF5ZGNudmhJ?=
 =?utf-8?B?SmNpbEFxZlhCUFViVXRpejZyQmNXdWlXVCs2Nkd4UGRvZzVDYklzUXh1Zjh4?=
 =?utf-8?B?b0xWTWsvNE1aaVkxNzdZaGR6b20rODB2UC9TOS9wM2Q3MG9FZUNQMTZZdVQ0?=
 =?utf-8?B?WEZ2TGN3Wk5DMlg1Y3FUUGxudS9VRERnL05mUWdHd1NwaElqdHUvSWJvTFBu?=
 =?utf-8?B?SWFwTUZoV0gxek5QbVJ2YTZHWmxtUjJpSm5VV1lZYWNOTTlsUFBZcTcrOVRL?=
 =?utf-8?B?UW5rVEc3RnN0bE1UM0I2Z1YzQ0V2bXRMMkhoWUhSQWlLL2dzb0dDeGhRTTR1?=
 =?utf-8?B?cGplS1ptZ1VNWjdNZXowOGlGdndLTjdWdEk4MnJHRFlzUlIxdjEwcVVTVm1r?=
 =?utf-8?B?b3l0SmVuZnJ6S0lFcXFKdTBVK1pxWmJ5RFVtRTh6eGRaSEQ3bVlWenBteFpT?=
 =?utf-8?B?UU1yRzlqZ1lhZ0hxNU5oNDUzSFE2U3l5aWtTeHRHWjIwVmEydkVrd2lHSDNR?=
 =?utf-8?B?V2YyVSt0K0pXcmVYVzFnT3M5clRtR0wxV01ZVE9uWVRMOUZyMCs3N2RJZWNl?=
 =?utf-8?B?VVFIZGpKb1BSd2w3bWNlYmlIc3FxV0RKSTFuR2Z4NzdNTTlMUU1QRHhUVCtq?=
 =?utf-8?B?cnM0dGFsYitiaDY1RllBb3lCZHRLNkdaeHRRb0c0a08yZkRvcDM5K1RRWVh4?=
 =?utf-8?B?RDJ5UzdEWnZsaGl3ZjM4d2E5emJtYzRNVEpMa2RyRFV5QUJkL3M5ZXhVMGdm?=
 =?utf-8?B?SzR0VWNZd0xGdTB3WmVJQXd0cWFHRGZybVlwTHJNL3luNkR0M3I2bGV5bVRC?=
 =?utf-8?B?RjRWUHFpYnhRR3N3ODdabEQrd2svY1lCblp1M3lCOG1pQ3JnOGlHWHAyMmd4?=
 =?utf-8?B?dTFUT0dIbjFXYzlsdERiWFdjRXdsVzJWdHU2ek9LR04wQTRSVmZMTEZZeXkz?=
 =?utf-8?B?NW03UFlTTXFPYXJrUGtNUTBiSUgzZDhwa3pmK0NoUXpweXg2cFF5UVdEbXpi?=
 =?utf-8?B?cXdBb0owWUQ0OSs5cjgwTWlIaXQ2NGlKTHR0bWlDT2htNlhVblJOSDhTRWJt?=
 =?utf-8?B?ZFVxdklwUUZ3RUJTdWZRUnl3b2FTZHhyRFhIbWN6ZGRSWHdjUnFDNnZWelkr?=
 =?utf-8?B?MXJJQW9pTVpqZUYrTjNGR1FmYitJbEFSYWVYUE9WS3J4bW45d0NiVko5WGh5?=
 =?utf-8?B?UlpNTThJMmdXOHNPRXFhcXBMNEpqVmRmd2dNOFBFZ0w3R3plWmZzbC94RU4y?=
 =?utf-8?B?MkN3NTNxY2pnbjc0QTJ5eGxkdnc3Rm9QU1U0Z2tGSFJiMjFGTDU3WWNqVWYx?=
 =?utf-8?B?QjJScVVwK3dJNFdBZCtDb0pidmgxMWpYdnNlb2ZxK2JkNHc5NWRkV3U3TlFT?=
 =?utf-8?B?QThOWEp3Z1gxQXRaZlQ1N3YvdzJUS25OUU1iTjRlYWovcTcyZ3JlUXF4NHll?=
 =?utf-8?B?ZWsydmprZXBWKzVsYlkrOTBTVFhuT1NIb1lXeTc1Ums4MWRNcWl5UlY1VjVE?=
 =?utf-8?B?TmRiVmR1MWw2N0laTEpYTjBCWjlydGtBc0QrZFo4Z0V5dHNYK1VobnBsTDA5?=
 =?utf-8?B?alJSUUNSMWs4cjh4a0NnVWQ1NXBRdjk0VVdHNDlMSFROTm02T0hnZGgyUGpl?=
 =?utf-8?B?Lzhpa2g5dXdDUk9xdnR2aVdTdEVIYk9yL1NqdHFQOTA1RXpSYkgvZkJ3OUNW?=
 =?utf-8?B?V3l5OUJuUmJ4L1pTaHFpclkyNS9lbW0yQ2cvWWpBeVNOYTJWVjNEaEVKN1RV?=
 =?utf-8?Q?8zmMTamUEGzjLia+e3EqdsD6A6n8vC3G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTB1UVY0YjRLYUZ6YUIvenFHYUEvVjhzck9WRmxqOWVDcFJlaTZMZnIrd2J5?=
 =?utf-8?B?Mm9XK3Q5dmJlRGNwSk80TTRGZHJodUVINmU1K1c1SFFocFVIZHZzSDNPY1A5?=
 =?utf-8?B?eXVJR2tMMSsyKzFrQjlRZnUrbjc4cmJoUW14Vk40SEhEYlE3VTRhc0tXL25s?=
 =?utf-8?B?NUdiRWk3Q1RQVmU0Sy90akJCSW5PeHZRTC9ha1o0Q0ZaNXMxV3YvV3hob0Fr?=
 =?utf-8?B?eEdDWStsSVZiUjZYTmhhY2NDVHVCU1Z4cDhsRkk5T1ZDTkdRd2VBTGtmbm9a?=
 =?utf-8?B?RlVxN0FveFFHZ29QbzM0WjFqaDNlQ1U5ZTlERGJJcUZLT1ZQZ2p5NnJ1NW5C?=
 =?utf-8?B?eFpqb1Yvc3A0SmpvaHlBcnZidTVKYktrWkovRmlUSkhjZElSVGJZeTQzTzZD?=
 =?utf-8?B?eG5iekhVS1k5MlZOTStWSXRveGpDcHcyeTRtekFWcVgyRFZmbUVDREo0TkRs?=
 =?utf-8?B?UU1KV3RSSXdmSmxPWHVWMnNVWGlvZWUreDNIRUZ6VjV0MTVGcnVBTzRuclAr?=
 =?utf-8?B?NXpNMjYyTDBQMVVSb2pNaFpITk9wc3pwSGtudHorZThnWlFvbEpISGd3YUM4?=
 =?utf-8?B?dUZzbHVLUWFoaTNLWEEzdFMrUDRjVzVMK0RORU5iMU94aS9wOXFKM3RLMXJW?=
 =?utf-8?B?djJEcnFKYUF1UVNscnczY28ySGRRN0pVYzFuRFlNQjVxTnNmcVIwNUJhbmdL?=
 =?utf-8?B?ZytqaE9QRGlqak0rZjkyY2NHWFVhWEZJZkZ4UTJneDZjczZheEMwZUlEQXdY?=
 =?utf-8?B?R0lJU3Y3N0R1dUpTSEg4RWZ6aThYcXh4cVJ3L0RKWk44ZnNXRFJKV1R4VUN2?=
 =?utf-8?B?M1NDTk5jbmhwN0c3QVZUL2xoc2FSS1pwNjYwVHM0d3RNNFJjTERoVk05TytT?=
 =?utf-8?B?ODZkWjV5SUhUelkyc0NYVnBFQTRXYnNkejRTZHR0Mjg5TkdqVkd6M2FrMER2?=
 =?utf-8?B?SEtCbnIrYkF2QlFucjFJcllXeGQ0d2l5TnMxSmJTWFVPeXJham0zYjBUbXpJ?=
 =?utf-8?B?bUtycG9abnZ0Vjh5MnVWbUdaZmljNjllRkIyK1VWRTJiT3ovVlQ1VGhxS0Y1?=
 =?utf-8?B?MlZXUzI5SEozeWJWaVNiU01BNzBEWHVTK0o1UTBSYmlNQ1lkU0cwem9jU2Jy?=
 =?utf-8?B?Q3NaOVpSTS9xUnNVMmpYT0UvZzl5NnR6alQ4Zm1hTnh3UWtKTmRzWjZKTHBZ?=
 =?utf-8?B?MDgzTjJ0QzI5S2JCa2ZlZ1NHNlR0bkVPZDFLVmxabmRHWHdkTGl1SXJ6c3pU?=
 =?utf-8?B?MVpnRHFId2g3WU9pUUFJaGFQMnkvUU95R1VJQmRGQTloZVdFdDVSOVpFc0JG?=
 =?utf-8?B?ZHRiZ3pSWDJUWTRBZU9DWDVReG4wNmtXRVJhMUdneE1pQlFzRzZJSE5LaFJu?=
 =?utf-8?B?djA0VE5FdEJCUGJjcnR2eEtqdjNOa2k1S3Z6ZkZXNnVvV3phenVGU3MyUThG?=
 =?utf-8?B?WTQrRW9KQmRUT2ZobUI4OC9TcmloU0N6UlVQYmg3TU8yRVd0MHMxQVhITFJn?=
 =?utf-8?B?WTAxZDZvTVp4cVZMSWNTczBEekNSUlIvRVRTd1ZJVFUzRmJicXJMUnExUEtx?=
 =?utf-8?B?UVcyN094WnZDeGVjQkxyRFNyWHBLL0ZPTE5zdkFqcVdqaEI5S0VVOUtVVU45?=
 =?utf-8?B?S3NHTjlNc3pYZHArM25iUzJZTnRUdXlqcnFMT2RpcTB4SDJKTUViT1VVU2No?=
 =?utf-8?B?eVk5RHp6cUFMOGxJZnBFeHBxdkJTTGVvS0FiWUxLMTdjTTRhaGtja3cwa0JX?=
 =?utf-8?B?bTdxTnhYZ21yZVJnR3p2NU93ellySCsxSDNTNzFCS1lDbUJqVWxFY1VNZUVp?=
 =?utf-8?B?ajI4WlpuZG1GdmlwYTlvTzBRYU01Q3IrMVZnTXhHZWhwUTA3cU1MQXhjb3lJ?=
 =?utf-8?B?elZCbU9XUEFXaWNoQ2hJcVJtMWpLSjVzNHZhZmJKVkp6TXJkT0pvQnoyNW5U?=
 =?utf-8?B?NlB1Z3NURDEwbUl2M085QWdicjA1T0dJSEYzOENTUDVzaGlyNXRjaVV1amgr?=
 =?utf-8?B?TG1XcCs0ZmU4TlhEVlprWUVENmxCMDdTZTF0dTlDam1Nbm4wblFwU1hUODVY?=
 =?utf-8?B?ejZnblNIWjZBTHlHMi9vZSt2eGhmdWhRck91QW1rRFNiUnhjWXlZYkNOOFJE?=
 =?utf-8?Q?JL67amkJbUbkHttGNNxQHGjBT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fefd9a0e-ff0c-48c6-bdae-08de00f3ace7
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 14:06:11.3972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Oh2Yx1UgLQo1MH+puKYFb1S0eip3ZLxDO9QcQXox92Kn3C55w4HPrh0lW9OmSlJ1voMKJlqEmxtYpuMA/Rt6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5029
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


On 9/29/2025 4:55 AM, Matthew Brost wrote:
> If VF post-migration recovery fails, the device is wedged. However,
> submission queues still need to be enabled for proper cleanup. In such
> cases, call into the GuC submission backend to restart all queues that
> were previously paused.
>
> v3:
>   - s/Avort/Abort (Tomasz)

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 ++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.c  | 20 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.h  |  1 +
>   3 files changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index cb3e9f6e83fa..9f33561b91c6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1224,6 +1224,15 @@ static void vf_post_migration_kickstart(struct xe_gt *gt)
>   	xe_guc_submit_unpause(&gt->uc.guc);
>   }
>   
> +static void vf_post_migration_abort(struct xe_gt *gt)
> +{
> +	spin_lock_irq(&gt->sriov.vf.migration.lock);
> +	WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
> +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> +
> +	xe_guc_submit_pause_abort(&gt->uc.guc);
> +}
> +
>   static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
>   {
>   	bool skip_resfix = false;
> @@ -1282,6 +1291,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>   	xe_gt_sriov_notice(gt, "migration recovery ended\n");
>   	return;
>   fail:
> +	vf_post_migration_abort(gt);
>   	xe_pm_runtime_put(xe);
>   	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
>   	xe_device_declare_wedged(xe);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9320fe9fbb29..99ea9b3507cd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2359,6 +2359,26 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
>   	wake_up_all(&guc->ct.wq);
>   }
>   
> +/**
> + * xe_guc_submit_abort - Abort all paused submission task on given GuC.
> + * @guc: the &xe_guc struct instance whose scheduler is to be aborted
> + */
> +void xe_guc_submit_pause_abort(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		struct xe_gpu_scheduler *sched = &q->guc->sched;
> +
> +		xe_sched_submission_start(sched);
> +		if (exec_queue_killed_or_banned_or_wedged(q))
> +			xe_guc_exec_queue_trigger_cleanup(q);
> +	}
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> +
>   static struct xe_exec_queue *
>   g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index f535fe3895e5..fe82c317048e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -22,6 +22,7 @@ void xe_guc_submit_stop(struct xe_guc *guc);
>   int xe_guc_submit_start(struct xe_guc *guc);
>   void xe_guc_submit_pause(struct xe_guc *guc);
>   void xe_guc_submit_unpause(struct xe_guc *guc);
> +void xe_guc_submit_pause_abort(struct xe_guc *guc);
>   void xe_guc_submit_wedge(struct xe_guc *guc);
>   
>   int xe_guc_read_stopped(struct xe_guc *guc);
