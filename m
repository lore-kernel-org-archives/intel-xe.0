Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09D8CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 16:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6850F10E27D;
	Tue,  4 Nov 2025 16:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lxO2qDYs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D73610E27D
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 16:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762273523; x=1793809523;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fciasBcFR6GYGNa+SkQN5CHD6TQgbVZsIAxRS4toD08=;
 b=lxO2qDYs/F5Ck76ZSih1n9coKeslltSaHmGhiTk2avc26fautob3xaHr
 J1ftmadE3/w7BfwBqf2RCT9kKOFp3mTxdVBfWikE1OjrnyBoHqpgSWhwL
 h53U+VfrDrNsCKt4O5BJ8OgLzSav7ugO81CIX1ofLC3rAf2SEdO3ZkOqR
 wLxOXuTlG8vIprpzcKzaZRIRUFyVfFCX/ALbg7gCzWCzpTHsSvd2y9eQ1
 ePXMLQeqiDecXFm50a46GHmzJJAqWMnEh71jJdQ07DX1gULTbh8/BpYxM
 QcifueuQD38pMgb/maybqXsy7RS+82sR47/N7u4AuJWxK9prb3BexSZHk g==;
X-CSE-ConnectionGUID: WtDPhNIVRECUKEKGOZaY9Q==
X-CSE-MsgGUID: GiFkqZfaTEe2ETP2wvu69A==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64289833"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="64289833"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 08:25:06 -0800
X-CSE-ConnectionGUID: 9MjELo7MR1euC4VJoj2f8Q==
X-CSE-MsgGUID: sAKhM4AbROOyYZzZaHK4AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="191551842"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 08:25:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 08:25:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 08:25:05 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 08:25:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbkb8Jj0TNKHlcj/HZhJNrXiBk1QH6uLyMflzsxU3Yr1qzHr1e6hrRbaY6pRt8AA9duxpv8wmuyi+Ym8TMJ/2k9ZQp8D/K3rUK9UVDqhQDoMdKN36i4QLES6k8lpK9coF5SUx1EW5iL+QGyFfGk3c7vg1OM1a3mphsLQNtiwk8VHx6nHR+TK1moLYuBF6Od+e6E5CPklj1Nqcx5Oy1bDUl8M/ap+cEM1Dlf2xQzpOvuytK6D0jxMt1aRAx0DQTMDJEayP342vMCj86iAzDrvYRi/ASSLcMZjSRPCu37J461M2S3grf13L86qfNxv4l0qn/JR0/U68F+ehQpf2LpmTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1dnQ7GgytQWhJq0xVgvLc715JW8v3gAqqorut//D1M=;
 b=q0QkWR+mUKlmgy/DGNWVTlHCHqmcu9CV/amx6NeoD/0S+gTXsxc6JXaEFb6ETm3kGn1tMj2AczirTJudv+LgPBGmpiAvMfcE07lf2zGAKOek/QBNFHt5eh6e63aZKbXLDkAbKQUkgIw17Jc3yeuqcJ/N304zeXUz+1CNl/7I1LSNSX0wpoP5hMIkINenWl77aCcF15+HQl1s3Z8bozCs6DTa0BJimYn9+Y4+EyGbRqjuy1nbn8SDL0ZygQm9AiE3Qz/clxi6/YWTsTDLzW4XTx/I1nkkwh6FXMo1++SgaVjT8Ti34mBbxf87WL1lq9cbKN+3CdunHAI5IxcHvszNzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CH3PR11MB8187.namprd11.prod.outlook.com (2603:10b6:610:160::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 16:25:03 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 16:25:03 +0000
Date: Tue, 4 Nov 2025 17:24:46 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH v4 0/7] Pagefault refactor
Message-ID: <aQoozpynadgwyfP0@fdugast-desk>
References: <20251031165416.2871503-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031165416.2871503-1-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: BE1P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::14) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CH3PR11MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff9ceea-9afe-4b91-0bf5-08de1bbeb387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SW9TU3FGend4Q0dhaFd4MTNSajQwWTkyK2xvNUFQRDFPS2ZJUExUUFl3UmhE?=
 =?utf-8?B?ZnRDeWRNZTAwaE1ON1NockVhaWVYRlI4OVUwbnMyYzd0cG5CZWUySWFJWHJp?=
 =?utf-8?B?WDMzS2xiYm9NQXpreURwaFR4TEFNcXY0MVN5cXYveW52NHRIM01rVktkZXJX?=
 =?utf-8?B?d3k2YlBZWHJuaENQZmJzT3hvSis3T2JteE5GdDJGMnM5N05kNktNN2hsMmlV?=
 =?utf-8?B?aDF4QW9BZ2xNWmhxaWZEc0tPcFN6K3Q2NFljNjYycWRqVnEzR0FEQVN0SFc4?=
 =?utf-8?B?dVFoU0luSkxKZG1kbERYNGlCaHdCaDNJOVNjSGkxOUlFRHFvenVLVnNYbmhV?=
 =?utf-8?B?SVI3UFRuNEcyYkI4UTJCbnlnaWhOK3BGRDBYcU0zSFFCZStiT1dadnJVb0xJ?=
 =?utf-8?B?UVRNZkYyaGRZY29iY202TjBOQnE3ZE9zcGgyZG51SzcrcXRzZ1M3REtQeGp2?=
 =?utf-8?B?SVVhK1VJWjhmOElyNTlCZmxXdEtoNjZDdXdubzlqWndTOTRKcnBNTHk4cGp6?=
 =?utf-8?B?VGxSWWcvL2dFZjVyczU5elV2V1FBYmZJeCtXbG9Qc3AxWnY4NWxVRlUyVEV3?=
 =?utf-8?B?bUN5U29uaWRVTjE1ZGFwV0x4UVBYWFJ6QzR1SnkxZU5CbE5JMXU5MFdHUGVy?=
 =?utf-8?B?YSs0VWNlQno0Ty9lb1FGcHF2OXFoZUZVV0tRNU9KOFp1dy9CMUlrdzlkUVkx?=
 =?utf-8?B?bTRFMEFMa0hHMHowWXhBTjZXVS9vS2V5OTNaVUxGSXZvaUxVazBIMUMwcnJ3?=
 =?utf-8?B?QVlpcmZMUUx1dElvZHptc2VjNVB1b1JHelpHdHhpRmh5SmZpYThKZDZYbXBl?=
 =?utf-8?B?QmFqWVF3QVZvcjVFNXFPYjdwRWdnTkZUcUJmMWQvcVF4VjYrZkpDR0dyWW94?=
 =?utf-8?B?c3ZjMWpKNzVjUnZUbnVPRTAxL0NuN0tTbnE2TEpMZjJsRTNJMXI5MFNHRVk3?=
 =?utf-8?B?UWlaWjRMTXVFbzBnQVp3ZnVZNWlaVzZsTkQ1d3EvVXNrWGtOcDBBUFBBOFl0?=
 =?utf-8?B?U2xMMVlNTlJDSDVBTzhxeUFrS0JIc3c0cXBCRGN3bGZCQ01kQ3pGM0pGMCtE?=
 =?utf-8?B?Y09WcUlDZ3FFeGVET3UraW5WajcrS3g3Y1EvNTdzNWxyWEJyQXhWbWkwb21y?=
 =?utf-8?B?TnRWSVBpT1FXMkxXVisrUHIrbCtKamFXMlZZaFFRZ0RXVXB4L0ZJMExKaWpl?=
 =?utf-8?B?V0Z3djBRVnFLYWtITCthVHNLR0h1S3VOUWN1UVB2dDZwUitSTFFteEpPSE5Q?=
 =?utf-8?B?bVdZeXIvSjhyeWNieXpRYmE4VVVKZ05Kc2pPZFFwVTNZMXM3V3R0bEt3MTR2?=
 =?utf-8?B?VjlNLzZHUjlpQ1d6L2dTVHNnd0dabnJpaHhkZ0dPN3Z1MStGMThtcGJudlRO?=
 =?utf-8?B?aGxBTHkrOFZmL0JQTy9aK0I5NnQ5RVpudUxUdXY3VStWY1UyT1NsdXcyK3RF?=
 =?utf-8?B?REhieThQWGRyTVJaTmVEWlBJQVNYTjArRFlnWnpOWWdwd1psdVA3VTJTYWdk?=
 =?utf-8?B?ZXp0TDRiSVlxT2l0K3NXS0ZlL1VkYVJJMTBDQlJkNCszTi9sSGd0K1Z3N3B6?=
 =?utf-8?B?RlBHM0lLYm5CQUhyL2VJdTBhbEhRNjF0VUV2TnJ1R2pRNWtwZ0I2R2NjakNz?=
 =?utf-8?B?LzdTcUx5SG5IWW5sVDI1bzMzeGY2Nm1LVU0vdVFNYTdaVE56REUxMWFJUHl5?=
 =?utf-8?B?TTNENUZES2s3NmZUdTNuTXVIb3hyUkJVRmNHbVd3bXpPTHlxeXRFQmoyV0RM?=
 =?utf-8?B?SXc0dzAvNEFOc2IxM3AvOUI2enFUWitvTmF3a0c2ZW1BSVY0bXk2MmhYeHl5?=
 =?utf-8?B?dFNLbi9IZ2hFQTdQaXg5WnlwNkVJSlR2ZGlCYi9nV3MzMHVmRlB4UjV3Unlx?=
 =?utf-8?B?YUw2YzN0T2tBektsTk9WWlNIWkFqbjJZS1RDalBtOE1wdHFCaVFjcFM4VEtP?=
 =?utf-8?Q?SNHztUl6MFgvWQUoEMaIGODypFDSoSnV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTdqNXFaM3p6cTc2N250d29LcU1ZeDhLQlp0S21oaThYckpvRGFwcm5HZXR5?=
 =?utf-8?B?WmhKdUdqMU5ncG9FK0NpWUgzRDR2L1piSGRoTXdVWEs1eVRPeWlpN3c4Nm04?=
 =?utf-8?B?WXI2QjVnVzIrY2lPT01sNzBRTmI4ZFBNTnRucXViYURBVU1mWWZyUjVOV2lM?=
 =?utf-8?B?UHZ3dERyR25LVmswa3VPSUlrV1pKZnM0ZGt0NEs0M25hTWNtdmFtZ1hyNk9N?=
 =?utf-8?B?YTdVTlN1S0pXMm5sNUhlUXRTajJXY1V4VnJwVWFJRGVQVDRtSlJNTnBsczI0?=
 =?utf-8?B?YlN4R3NKRVBHdzN0UVVnMENEeCtPbGRLNWpmSUNCT09rZWQzTm04UTZBT0FP?=
 =?utf-8?B?T2FkMGFnbEtsVUVnR1djaHlDQkdLOTIvbkpFV3FOVDIvN2E4U2c5THhrV0Yy?=
 =?utf-8?B?ai8yMEFvajJlc08xVDk5akdnRjZPK3hDUkg0UVJUVDl2a1JrRDNrTDBlcFU4?=
 =?utf-8?B?WStmbFU1bUJVMHFVL0YrYnhaRTFVQVpoYUJYYWRGSmRKSEJ0S0djNks2YzNh?=
 =?utf-8?B?Skpna1lUcGNDUktYbUxaQ0tEM1RPL214K0sxVWZPN0ZLWi8vVm8wemFGRllr?=
 =?utf-8?B?aWFFSmdaczZjTmc3dzY0VXgwWGVkc0VuTGRZaGppL1ZuVEkzUk84N3ZtQk96?=
 =?utf-8?B?K28veXErSFU3UTZGRm04d2xKY1c0YitiRi90eVh2UjhhNllTem5BaDk0eng3?=
 =?utf-8?B?OEVORkh0NlpMTWxiUUhseFlsbG82S3N0dmZYaGNSRVpGZXlXWTVwUXJhS0tL?=
 =?utf-8?B?bklGZnBja2pGeGxENVpVZEcxR2VXMEx1U08wKzQ0T3dYbThyK2RNMU95eThD?=
 =?utf-8?B?QVBncDV0ZHZHaVlkUDhYeXhzSzRKL0xnNDJzZDRPRmlNSnNTc1hSdlJTbjE3?=
 =?utf-8?B?cDUrL2l2UEt5L1k3OVNFTHZsTEhtWlJ6U0FKeURtcllDL0RzZktaREpXVXlu?=
 =?utf-8?B?YVRkakd5d2E0ZStzS3J2SzcvVmZGVHVmV3VmRHduT0dtQWJuNFRRd0VaRFBY?=
 =?utf-8?B?YURqT2d6bXY2aVErT2R4N3RSMjlUMXBtY2IwdjVJZDlldzZNaVhMeVpQSDRw?=
 =?utf-8?B?dndHN3Npd0RGSFlRZ1dydVhKRTlPRm9PNEMvRXFCVTliRzdVUUVOZWZ3bTRE?=
 =?utf-8?B?QWgvMUg4akJ2cFNxaDB5SFY5T2N2Tjkyb0xnM3ZPODZXWHhaSmo1ZjFlb2RL?=
 =?utf-8?B?b0dtL2tOa05jNXZOOElGS0ZkVlNPVXgrZ0NkR3JnRlZpZjB3dTNaUWtnNld1?=
 =?utf-8?B?M2dacTV3dzlQeDZaZTFtUkZURGZ2a0llMW11WmNpeDNielZlZyswZ1pHUlJM?=
 =?utf-8?B?cTNOMHdWUVVkWmlaU0VSTVpmdjgzeHVtUmMxdVo0TllIemdmSUZoeTl0Qnpj?=
 =?utf-8?B?TWN4Y2RYQncvVmhnOFRhbHJSOTdjVzlGRmdLdUdiNk9QSUtmT2Jub3Z0THhw?=
 =?utf-8?B?THhsSFU1bzV6VGRJRzZLVnRLYStYOEFRTEsyMjFoVFB2SFdXYWxOOUJoUEdh?=
 =?utf-8?B?MXpTeEp4OUhSY1lFNXFOOCtIZ1V3eHlxKzhqdVp2bzRydHhwUWNEanNFWUpm?=
 =?utf-8?B?d2FwSS9SZ1ZMaEZYRnZYckloNXl1aWk3R0hXTDFxdTlJUjhCa3EyREt4MzJa?=
 =?utf-8?B?eG8xWTlnVDF1cG9rZXI3d2tPOUYyZy9UUFZCQkMvU3RnYytLK1YyNFBQdTlz?=
 =?utf-8?B?aGhXaDBMa2hoK1ZCN0NPc2NZYkFMbW10WklvWklPYzdQWmJCc01yNVdycTlz?=
 =?utf-8?B?WDFDZlA4Z3VjUFNjSE95dm5yRHh1RkxDY1NxQVBEajhPbkVxL1ExUFA0RndG?=
 =?utf-8?B?WXMyY05jWXE5ZGp3Y1lJVGNCOFpVWGFFQkdkbVRSRENLdFFMRWN2NjVUVDh2?=
 =?utf-8?B?eG1PcXdDS1lwZDFFWTQ3NHk2RlFNb1l5ZDg1OGl0Y3VUanhxMFZoMkZEOFNy?=
 =?utf-8?B?L096eEI1OGVqT2lqQWk3d2RyVjFySGJOV0pQUVZnVmhCbEk2RHk0K2JxdlBy?=
 =?utf-8?B?MHphV1Q1YnFzNWxzUjlET2hydUFRdHJDd0N0SlB4WXplUGVDWWNQRW5wR0NW?=
 =?utf-8?B?b3paVzV2cTZNWFJ1U25VLzVwWHZZdXpLcldrV3J6bXdXUGxQTm81V2VEYlh5?=
 =?utf-8?B?UEtuMzdEKzE4Q1J2bFF1UmpNSHl2ZmgraFg2cDNocFhEK3dpWmswWWNPOS8x?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff9ceea-9afe-4b91-0bf5-08de1bbeb387
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 16:25:00.6507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rl62z5P3spLWycXQDadFLTTZRYBLM3hU2CCLVJ4KaXbuKl2tsx89+mSvWP+PHEH6CdSpL8OJOnV0fOYfMwBLcJIOVO26ewovL2ov5v+Lpmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8187
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

On Fri, Oct 31, 2025 at 09:54:09AM -0700, Matthew Brost wrote:
> We likely need multiple page fault producers feeding into a common
> consumer backend. Additionally, our current page fault work queue
> design—being per-GT rather than per-device—makes little sense. Clean up
> pagefault handling with clear layers.
> 
> Matt

I ran some HPC performance test with the series, feel free to add:

Tested-by: Francois Dugast <francois.dugast@intel.com>
