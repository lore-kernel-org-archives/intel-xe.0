Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E77D5CC8C
	for <intel-xe@archiver.kernel.org>; Wed, 30 Oct 2024 10:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D65710E77F;
	Wed, 30 Oct 2024 10:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RFok4h+t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565AD10E77F
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Oct 2024 10:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730284571; x=1761820571;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kqQG6FHA5VWbipuqRhoFzziM3Lf1HXNYuBpaAZwGMGA=;
 b=RFok4h+tJ3Qi8GywEnY2A7UQpoZRSdvSVljGgxboB4TEVnyJYobueZlO
 hMw5niVOtTun3C+/vOTutzaVHob7EQ3joBf+E0VHgmHsuibm9bW6kqZzE
 bCAt/yF9mDvtsHxFPA81Piq/sZL823mxnQr7gm5Rzs2OBBgr4YCcv3DRI
 wosROrULAwVmLbiMkFReiI40Sfuu376CJsQfPJKqnTKVypZfDB4PDFjIU
 qyUwMI3pggPFIL6fy9IAX0FpNxcmbCWJXaDrapTx5kaQV17lNrlZJWMAt
 bGReNybYQQD81NzEnGUiRiSRlEYGltkJ9lEK9UyXfZlRXcfhDoR0FEX/g g==;
X-CSE-ConnectionGUID: ZwOOP+4CS5+aVFnOK8DFow==
X-CSE-MsgGUID: PleHImv6TbOtQu1KVKqNzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="32819041"
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; d="scan'208";a="32819041"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 03:36:11 -0700
X-CSE-ConnectionGUID: 8fuIC1eZQxyFzuewEQg/Gg==
X-CSE-MsgGUID: FZD3z+mgQXeiWoG+9tBUUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; d="scan'208";a="82204691"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2024 03:36:11 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 03:36:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 03:36:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 03:36:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbK5K828ZpexSMpJfkKcYc1n0xNyaikP9iiW7FG5bjgjZzOJDm9DAikyMcYTEmpsHMfNE4Hitzd2lQlnD3yikWf72iqh+D1DQQgTpDBzQIu97aZ+wZld8/d8AhimzCFErhuZsrCubzVWcF2H/ZDnZRpxuaSZo3OZ1dl611wdEmvIL6FX98GbbK91XPBChggYRN5uDOHaoua7r0hfE5+Ew5+/tEVjjUNRaNQG0E09QeoiWfqIAvGSjneigpWbFtyBjmudAkgXbw1zL5zlEf6LjRlbTW+BOSVQYZLrqF6SbHY7U0d0JepeaZIm55gKsgWF23QOxr797Npk3BSRaSlATw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QruRRN6zdLM6DYOTaGT/w/iiKzqx7X0oTReK2/CCtsQ=;
 b=RYv69WS5UXMYdhy6bXptRAItaQQNpHsuXSQMHmptNcBJNEHnfJNOP1FT2OIZbqLWEFcUgLX7HAj5a5jogCgncxOuynYF9TR8S/praSGW4edVqYEr9I5UNQXV6Z4xec5KzILG7HiYU8wZHTPZQVNtf9akA/L57HBBksWaFmMxcWqj8gD3/uM+ZTi8JuKxaG70fYmHODHQKxDro9HZge/4K3XNMnOCSjPNdMbTp9nwrvvASDw0rWBWMwsU0tNM858JSQkgV+16rrbnhCzStTQH5nsMhZKNlbTm7F47EeFUrYR5XX2xT7hEp2kSK6y2NqKIv5oFWv0oBRyDM2GXt4qWXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CYYPR11MB8358.namprd11.prod.outlook.com (2603:10b6:930:c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 10:36:08 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 10:36:07 +0000
Message-ID: <d0387bcd-6efa-497b-b09e-f2cb6e3cf751@intel.com>
Date: Wed, 30 Oct 2024 11:36:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] drm/xe/pf: Add functions to save and restore VF
 LMEM and CCS data
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.winiarski@intel.com>
References: <20241016095745.7477-1-lukasz.laguna@intel.com>
 <20241016095745.7477-4-lukasz.laguna@intel.com>
 <b352367d-5f94-4406-ad3a-71f804bed078@intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <b352367d-5f94-4406-ad3a-71f804bed078@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0041.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::27) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CYYPR11MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: 295cd595-8513-46c3-06e1-08dcf8cea9cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzUwYkpObHVPc1Fna2lPVys5dzJPeC9Td0tJaDk4NTg5clg1b3QwU0VSbW1C?=
 =?utf-8?B?RmZ0Vy8wNktPUlRNUkpNeUoyZVhrWER1VlBseC81eFNtckFSMkhWYXI4ZHdR?=
 =?utf-8?B?c3JsUFVxbXVCbzkwUlRtVXFCMjBsRnZ2c05JblowbTVYOEd5endjT3I5UHBs?=
 =?utf-8?B?LytJTW5kTDltblg0ZXdGcTVTZlB2V2c1TS9sdHcrdWhrd3VQZVZwOXp3L2Vw?=
 =?utf-8?B?TUdEZ3hOZXQrMDZrOGd2ckF6VDBJRlNwVytCcy9hVEtWQlAwY2ViQ0x3MlNH?=
 =?utf-8?B?NTlpdWZTZFdKTVh5elowWTBuQ0ZkQlU5eUxmM1F5R1d4OWtWdDZ3UXVPSGdE?=
 =?utf-8?B?Ukoza3cwQjlxMGRYcitHdlVDQThzaE9VVmhid0tHWDliZlNiQzlEVllJeDJj?=
 =?utf-8?B?T0lKODB4M1dzbnlJZjBsSXAxSmJuT1c5U1NqRldhOVJuMzJSSUJuaGp4VTUy?=
 =?utf-8?B?M1ZJRXhKN0NPLzdibDFzQ2RicnBPYlR3b2pLRDFBOFV5NFJKK0JNQXdEZlM1?=
 =?utf-8?B?YTBkeHlUWTFLY0s4WGVkTFJvM0JOT245U05qQmdoVkIrRTVrRWNUcCtoVHJG?=
 =?utf-8?B?eHpaWEVDMmlORGQvcFFhK2prUHBwQndpQU5ZRFd6RE80QWlSVHNPVGhWbzlZ?=
 =?utf-8?B?MzJuWGtZWVVWT1h2R3FRRXhrOHNXUnAwWU40QVN1VEgxNjdzR29KTFJMQ2oz?=
 =?utf-8?B?a0JPNFducEtwdHNBUTFvUkRMWFpmUXQwSWgwaGhLNHlJeFVTdmlLUHJ2bmtY?=
 =?utf-8?B?MFgzRHdJaHVnY0NVNXdxZTE4bVRCMm8zTnc3anVPS0RZNDdvRzBUU1lPbkJl?=
 =?utf-8?B?R1E3Q1cyRm1taDdEZHZPc1BuOVQvQVl2WFNJNU9mU3hjUUIwWlBQTk5PUkxL?=
 =?utf-8?B?RDhUdnJKZTZVcUpKTU45MTQ5UEpDRXN3TEFyYmh3UVNpOTFualhJV3ZqTDNy?=
 =?utf-8?B?cEFYdnRzRllzdm4zSTJHZkljS0tsOEJobVlMMFd0U3V3VzkvK0diWjlrT3dB?=
 =?utf-8?B?Y1owdjFxeGprQ1h3UmErMG5MNExBaWVQMkR1VU50Yjl0d2FoTmQxQ3NpUnRs?=
 =?utf-8?B?MktxLzRjeVhJUVVsZnErd1hOUGZlaGVRTVI2Qyt6aWZIY2sxN0NhTXIveGNz?=
 =?utf-8?B?ZExpNFV2Skhtc1p6bjVjRm0ySGZLMkk3V2pUN3I4V1lLWWxUMm0xN3NFVFNk?=
 =?utf-8?B?cDRyZG11K2NicFdzQ2hvK1dkMTdlSFJFdVdHcGtic2ZaMmhJZDhJWU9sVUZH?=
 =?utf-8?B?c2dWaVdsMXhuckg3VlZmblA1SlMzcVZOZk5iazRidGlyamxHdy81dVdQY01O?=
 =?utf-8?B?US95Q3F4VGpuVWVsbElYVzI5dUZUaGRId3l6WkFmOTdFVG1VVE4xZ0hRNm5s?=
 =?utf-8?B?RlVZbjVxVytTdExkUmZCS1Z5dnVObFVzZW5haFJoWCs1aXlaSG9hM09ubGxL?=
 =?utf-8?B?TzVZYmFBOWZyL3dPTWFaNXRlRlB5K0xHMFF4RVJZQ29VK2wxTWJ3NFlENjhy?=
 =?utf-8?B?amNnNzhhT1YrSHVjVHBKNXdWZEozWVVsNjkvZlV3YjVab042UVRVbm9wSzlk?=
 =?utf-8?B?dTA5L2FnRGpJWGhhY0c2alNlS2xJazRCbUNua2lzUi9KNHJ6eENtcVJWZ1Vq?=
 =?utf-8?B?MVlCNlZRQ1BpVEJtSzRZbDJMNWZQdytBWE5OQzhkM3dEYmdqNkRHaDNwUlkx?=
 =?utf-8?B?RkNVZHNTSW1aNjFpektjYldMS1FKRkk5My9pR1pJM2FZL0N3RFVJSDRTSnVZ?=
 =?utf-8?Q?2LcIZKrPVYbPoo7OWaNKMZKVqTKCykdKscviK+A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0RHdE51YjBEYlBSUDU3Vkcvd1BBWlVRTWZDTlJsaytHV1NCa3FvRlk4YnZh?=
 =?utf-8?B?b2tNdWxrd1dYejhNenF5OXlHTkJMWDhIYi9BbjFIcHVOcGJXVytaRHRNblZn?=
 =?utf-8?B?dlZjMmMzTUFtTUhQOGdRRTJHbUZHMjFRbytKUm16VFlYVndTRWlUUXd4RVZH?=
 =?utf-8?B?SU8wZlBpTUlMTEJuMXBLa2NmSlI2WTBjTlpjSlQyRU1PSHcrUW41eUhsTXdy?=
 =?utf-8?B?K2k1bElUWXBXSWFwenBERC9mV3hPdVlVREhQUFZiRGNoRXRTUmRkeGRvdnZa?=
 =?utf-8?B?S0FGSkJPSXNEWm01amNWaldHRksxVHU4c2wzNkVsMytkT2dEcXN1K3l2RWVk?=
 =?utf-8?B?MDhIYXV2UXpsVlE2UVFiMjlXSVBBblRZakQ1Vk9HR2pCYVl5RSs3b0hlT3lT?=
 =?utf-8?B?aFBQMGNXdWdFZGJtaXpvSGErVDlzWGl5WmFGUzhEaDBNdHJlaXVaTURncGZI?=
 =?utf-8?B?RE1EOFlLRys3T1hocmJ2OUNSU2RXOTVmN2Q5ZzJsYUlaaHhDcUdFdVY0NmxY?=
 =?utf-8?B?M1RaSngrRnR3Q3FFRGhiYmtIUlVpWGoxNlN1NVAyOFlUOFZkbXRFWTVpUzVB?=
 =?utf-8?B?S2pvN09XRXZyRmQ4a2U2RlBQUlNjUllRQ21VRzFpOTVuZXl5cTd2R0xOelNq?=
 =?utf-8?B?UnB0c2xpTUxSZHpSNkwzanV4RWc0d0dGdjR0aFRyUmFYcGlKcy8wWnVTTXRK?=
 =?utf-8?B?ZHNlRGhWSFhiRExvUVVneVh3cnFvUEpaR3pzcnhjTFhRbDAwU0RSeUp5bHlh?=
 =?utf-8?B?L3ZxNnhUeU1QYnp3RXpzVUhvWHJUTDZBM29rVjc0VmlWa0dqR2hXdi9RMnds?=
 =?utf-8?B?MU1DS3lOMndOMUFGYzhKTWhzNTlMdVhzME1GdldoRTdEZzJ5YWZlUHBuMnpC?=
 =?utf-8?B?a1VEcjNKN1RLdjArcnU0ektSSWYvcnYwOFJNWGhvOWh3bG5WVmZmZ3JTWWha?=
 =?utf-8?B?ZFVnaGg1ckJGajlSbm9aSXhISms2VGN0cnJhTVRmNXF0cnVyUHdUd1UrTjdq?=
 =?utf-8?B?VVlYOFprcFNVZ2pPaW41dnRmWnpJbk1xK29OWW51K2FscHdOWVJjeHorSEF1?=
 =?utf-8?B?VjB4RG9QRm1qUnRVWWx4QXJVK1pOcUY2cDdyaklydnlnK01xck9oQ3dHcWxL?=
 =?utf-8?B?bkw2eFFSdS8zcFl3VGYvdlFxRE1QTUlnUDRBNlZ0aXVWbTVObENmSVJ4SGZj?=
 =?utf-8?B?YklNREt5NVVwN1l4eXM0L3VTSGo0ZmtDMFN1dEpXNy8zY2JST1hsemJuKyta?=
 =?utf-8?B?bDRSaERRbVV6S3dYVTM3blVBa3lnYlJnVFlSNkk1UXlqVHBoZWZqcHMzckxz?=
 =?utf-8?B?WEhFazRISFNEc1pLMVh0T0huQnlsK3lhbnhmUmNHVVFoeWl6SFFid0xBOEpq?=
 =?utf-8?B?UkI0MUpnd09LRHo3NXJFQXVNeFlqOTZnUEpxZ0JiSGs5ZElET1JLTmlnRm05?=
 =?utf-8?B?QkVkRVVpZld5bFYxRSs3UkhGRlNqL3RnY08xOXZiY1BvWitaNEJnSW9majVj?=
 =?utf-8?B?ZjZRMy90R0MyaGE0RGw4VEdwOEIrTFo5UU5zOG9Jb3lRYjZ4MlJXVTI2RGpI?=
 =?utf-8?B?UTdSTHgwRlA1ZFBENUYvOVVETjc5cmpqZmJuUmlKMlNHOVJBemtzWEF2anRF?=
 =?utf-8?B?cG4wY285WkJQaU5xSzRiRjgyMW5pN2R0STZXN3ZUcTNpQWpBUGNRSDZkdHpr?=
 =?utf-8?B?VnhidnBON3JpL2xrQ1phcUxSdlRmWklKQU40ODlKbEFjWGNtYUNPRWcvVGw3?=
 =?utf-8?B?WWxCbUp0WEVoOUplcjJ0VXRBQ21JaGhWdE44Q2tTK2Y2VWgxRG55MUJYb3FD?=
 =?utf-8?B?d2c4eEtGVlFYS0JGRmRLZ0ptNnNvYU1lYUs2Yi9GLzlxZ2R4RmN2S0FPejMw?=
 =?utf-8?B?QUxDMktiSmNmdEZaTU9vRVAwUUd4RzJ5Q0RDVkFPZ3hTcDJlS1RsRitGVUth?=
 =?utf-8?B?U1g5M0NSV0k3c3V2eXpncjEvTmNDRy9mUWVEV0tMQzBRbVg2SEVvR3NNUU41?=
 =?utf-8?B?MHNkS0xxa2hTdkZpWVdHMmtmUW44SHFzeWpMN2w1SHpoc0hZcHFPWWZHUUM1?=
 =?utf-8?B?ZWdxeEVPTjRIclJDb1hKT1BSY29HUnF0YjUxVlRqdnJKYVEraVdxNlV4Q1M3?=
 =?utf-8?B?c2RUbzhnc1dOUncwdlBmdkMxOXpQclUzSXphYU9rUTJRa3RZRTltWit1d0h4?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 295cd595-8513-46c3-06e1-08dcf8cea9cc
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 10:36:07.7730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1omJU7JXtO0bC2bT8F3sqLCjgbR6UdrZ80LNA4kOGmQr0Hl3UE2x2vXjWTyczJ9fBTMCNEvh5VakSiJp3PF7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8358
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

On 10/17/2024 13:12, Michal Wajdeczko wrote:
>
> On 16.10.2024 11:57, Lukasz Laguna wrote:
>> State of VF LMEM and corresponding CCS metadata needs to be saved and
>> restored during migration of VM with attached dGPU VF. Add helpers that
>> allow it. We will start using them in upcoming patches.
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 100 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   7 ++
>>   2 files changed, 107 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
>> index c712111aa30d..feb22d3e5dd5 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
>> @@ -12,6 +12,7 @@
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_guc.h"
>>   #include "xe_guc_ct.h"
>> +#include "xe_migrate.h"
>>   #include "xe_sriov.h"
>>   
>>   /* Return: number of dwords saved/restored/required or a negative error code on failure */
>> @@ -382,6 +383,105 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>>   }
>>   #endif /* CONFIG_DEBUG_FS */
>>   
>> +static int pf_save_restore_lmem(struct xe_gt *gt, unsigned int vfid, struct xe_bo *sysmem,
>> +				struct xe_bo *ccs, u64 offset, size_t size, bool save)
> bool flags are not welcomed by the maintainters

I understand that bool flags should be avoided, but in this particular 
case using bool seems to be the best option. It doesn't impact code 
readability, doesn't add any complexity in the function logic and 
doesn't introduce any confusion.

>
>> +{
>> +	struct xe_bo *vram;
>> +	struct dma_fence *fence;
>> +	int ret;
> you may want to assert that vfid != PFID

OK.

>
>> +
>> +	if (!sysmem && !ccs)
>> +		return -EINVAL;
> input parameters shall be validated at the top public function, in all
> internal static functions/helpers we should just have asserts

OK.

>
>> +
>> +	vram = gt->sriov.pf.vfs[vfid].config.lmem_obj;
> access to config.lmem_obj should be under xe_gt_sriov_pf_master_mutex

OK.

>
>> +	if (!vram)
>> +		return -ENXIO;
>> +
>> +	if (!xe_bo_trylock(vram))
>> +		return -EBUSY;
>> +
>> +	if (sysmem) {
>> +		if (!xe_bo_trylock(sysmem)) {
>> +			ret = -EBUSY;
>> +			goto err_vram_unlock;
>> +		}
>> +	}
>> +	if (ccs) {
>> +		if (!xe_bo_trylock(ccs)) {
>> +			ret = -EBUSY;
>> +			goto err_sysmem_unlock;
>> +		}
>> +	}
>> +
>> +	fence = xe_migrate_raw_vram_copy(vram, offset, sysmem, 0, ccs, 0, size, save);
>> +	if (IS_ERR(fence)) {
>> +		ret = PTR_ERR(fence);
>> +		goto err_ccs_unlock;
>> +	}
>> +	ret = dma_fence_wait_timeout(fence, false, 5 * HZ);
> do you want to keep this hardcoded 5s for all cases?
> maybe the fence should be returned to the caller?

Good point, will do it.

>
>> +	if (!ret)
>> +		ret = -ETIME;
>> +
>> +	dma_fence_put(fence);
>> +
>> +err_ccs_unlock:
>> +	if (ccs)
>> +		xe_bo_unlock(ccs);
>> +err_sysmem_unlock:
>> +	if (sysmem)
>> +		xe_bo_unlock(sysmem);
>> +err_vram_unlock:
>> +	xe_bo_unlock(vram);
>> +
>> +	return ret < 0 ? ret : 0;
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_pf_migration_save_lmem() - Save a VF LMEM and corresponding CCS.
>> + * @gt: the &xe_gt
>> + * @vfid: the VF identifier
>> + * @smem: the sysmem BO to save LMEM data to (NULL if not needed)
> likely the vfio driver will not be able to provide such BO, so do we
> plan to introduce yet another layer for it?

Yes, for now it will be operating on virtual addresses of mapped objects 
and in the future we'll probably switch to dma-bufs.

>
>> + * @ccs: the sysmem BO to save CCS data to (NULL if not needed)
> shouldn't the logic about need of the CCS data be somehow hidden from
> the caller?

No, it should be a caller decision, plus we want to have a separate BO 
for CCS anyway. It was added on purpose.

>
>> + * @offset: the offset of VF LMEM chunk
>> + * @size: the size of VF LMEM chunk
>> + *
>> + * This function is for PF only.
>> + *
>> + * This functions saves VF LMEM and corresponding CCS data into sysmem buffer
>> + * objects.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_pf_migration_save_lmem(struct xe_gt *gt, unsigned int vfid,
>> +				       struct xe_bo *sysmem, struct xe_bo *ccs, u64 offset,
>> +				       size_t size)
>> +{
>> +	return pf_save_restore_lmem(gt, vfid, sysmem, ccs, offset, size, true);
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_pf_migration_restore_lmem() - Restore a VF LMEM and corresponding CCS.
>> + * @gt: the &xe_gt
>> + * @vfid: the VF identifier
>> + * @smem: the sysmem BO to restore LMEM data from (NULL if not needed)
>> + * @ccs: the sysmem BO to restore CCS data from (NULL if not needed)
>> + * @offset: the offset of VF LMEM chunk
>> + * @size: the size of VF LMEM chunk
>> + *
>> + * This function is for PF only.
>> + *
>> + * This functions restores VF LMEM and corresponding CCS data from sysmem
>> + * buffer objects.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_pf_migration_restore_lmem(struct xe_gt *gt, unsigned int vfid,
>> +					  struct xe_bo *sysmem, struct xe_bo *ccs, u64 offset,
>> +					  size_t size)
>> +{
>> +	return pf_save_restore_lmem(gt, vfid, sysmem, ccs, offset, size, false);
>> +}
>> +
>>   static bool pf_check_migration_support(struct xe_gt *gt)
>>   {
>>   	/* GuC 70.25 with save/restore v2 is required */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
>> index 09faeae00ddb..dc1e6c5b44fa 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
>> @@ -8,11 +8,18 @@
>>   
>>   #include <linux/types.h>
>>   
>> +struct xe_bo;
>>   struct xe_gt;
>>   
>>   int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
>>   int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
>>   int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
>> +int xe_gt_sriov_pf_migration_save_lmem(struct xe_gt *gt, unsigned int vfid,
>> +				       struct xe_bo *sysmem, struct xe_bo *ccs, u64 offset,
>> +				       size_t size);
>> +int xe_gt_sriov_pf_migration_restore_lmem(struct xe_gt *gt, unsigned int vfid,
>> +					  struct xe_bo *sysmem, struct xe_bo *ccs, u64 offset,
>> +					  size_t size);
>>   
>>   #ifdef CONFIG_DEBUG_FS
>>   ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
