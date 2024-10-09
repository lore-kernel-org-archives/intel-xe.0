Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625C6CEE343
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 20:13:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB9810E7F1;
	Wed,  9 Oct 2024 20:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lP87vIIE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F018810E7F1
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 20:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728504780; x=1760040780;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wlNW1QKsq77XMi9mx/iiJ6x9hxK32+MBK+S8UKmdLhs=;
 b=lP87vIIEmFapp0wHwB2JeZdxp4+vzRXZcLtQ3+A2v7R5JmBQO5A76tnr
 fAm8KIQ4t+EXX2j4AyMNHJ9L4MoY/V8QNNvxFwNJlk6x3vtXcDi1sWREk
 rxlAFJ2oWHpxSzFLLPHxQZR5Wk6G/bms1LUzJXL6hMo1O9TwW1TCgAMXn
 8UQonv/4ol2Ie6wVI4H6Ek6ZRoU03LjGKY8u8k1zF8BiY6GG+UqqWyQyx
 p8gT7Vfm5TwvhznvlBKfeHjUgcrim23UH2VLdwZSBFAOlOFnrc5fbA4Q8
 Jeo7JuR+ggrqSu6t68TCpb2gbu7gDik07QAkoZZBnNAqimVSuNSMlntyf g==;
X-CSE-ConnectionGUID: OtQPQGe5RJ+2mcLg2/avqw==
X-CSE-MsgGUID: CSIyWQ0ZTkWN2Go9OyWPfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38416356"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="38416356"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 13:12:59 -0700
X-CSE-ConnectionGUID: qvoIk0xvRhC6Nm75pIAJeA==
X-CSE-MsgGUID: TyiZv4A9TNGTwkA52gVmDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="76364441"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 13:12:59 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 13:12:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 13:12:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 13:12:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 13:12:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBbxcYnFBi7jS3OoVaJULXtF+ZlSrYvYcBx3ff1Li4FVTlqTZ78/DfhXdBkUqxGqfITwaGd1OUxLVYWItgiUs6rHwNBbjV7/cqffowI2DZ6LsvodAwq2KWTpEY8sgWVOEnHd9jj0j7j4i7mZ6qdHHjt7Wa7M+OpJWcY9XlpI+O56jr79dFaGO/TUDlj9jz2CfAR1zv11c38OYWHDtpYXWgslN/kI/+v2PUVcjRo68cXACluy6cfiUsjw6cnejSdgQtrm3zRFZrvA23altyl2CMdc3mu5ATGxo/rctI3xIQfkeu6IBBupvMXNkUyIEsWTc0LhExPdOpwZnzPMaYlnlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3DaM3l/gpDBRJlaP3ydnKYI4vv2/nBitEq2gvcOzoc=;
 b=BQL72ZLnzWTin/bmLwWyiXgEtM5sws25EiX5ro+vIEj4AlWWjFODpfOs/BVt1AAnM3cZ6mLn0X/OQEbs3YkpkRmJT5eW1Cy63OxaXPBFqrwnfonq9W/UQ4aVxS6kzyTdSG/TDKmdwkXhwoBxzIrELE+jtb2UrDBJ6QC1myeks03ayj5NJkn0jWrsXiQJ/4OtWWrSDnhOVkiriP2s5js2U+hRQQtxN4U4Ti96kDCZv/e31oQaIL8LZtGEP4PGwmEvBIXLZk30KmRc6zLkR+WdD/u31WriRuUCD/HBQXUJcfr++1u3Lm16p3lYWMz7r3iJEmdVj3zmQ+D7S4BP04bO4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SJ0PR11MB5918.namprd11.prod.outlook.com (2603:10b6:a03:42c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 20:12:55 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 20:12:55 +0000
Message-ID: <61465e66-ff3f-49af-aa1a-0c899e90d486@intel.com>
Date: Wed, 9 Oct 2024 13:12:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe: enable lite restore
To: <fei.yang@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>
References: <20241008233059.125021-1-fei.yang@intel.com>
 <20241008233059.125021-2-fei.yang@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241008233059.125021-2-fei.yang@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0136.namprd04.prod.outlook.com
 (2603:10b6:303:84::21) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SJ0PR11MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: c8056ac8-b1d3-441f-915b-08dce89ec2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alNlb2k4b2w3THBTdGN0YU9wcFF2UTM2NWROUGZWMW9Lbll5OUMvalkzd1V2?=
 =?utf-8?B?SXk1N0xaVXRic0ZhbTBGRVRVeVZkOW12Tm1xR2ZDdmZxSnBaZjUzeTJpQVB6?=
 =?utf-8?B?MHdFS2d5OERGaWk0ZUMza3RmYXg4Y2NUZE4zblpNUEpRWEovYnJJQlVRalY4?=
 =?utf-8?B?WEFqY09VSUZ5blY2QUZRdHhNdXR1NmRaNFdpMmpGSEJ6ODdsZmlMTVEyVnJ6?=
 =?utf-8?B?b0hZZnlZZXJvNVlET08zbWRjT2ZtcDJvYlJRKzgrbE5qVTg0YndwaXhhZ0w5?=
 =?utf-8?B?dm9Bc2tPWTFZbWtyY2dwUEJTTjJ0dWVMUTgycXhhYzkybWNQNUVEOUc4NG9h?=
 =?utf-8?B?Wk5WODBOVzdBdnlUbjBkVk13VW8zeVhmdDlUQzBNOFNxSC9wekRuMGVPc0sw?=
 =?utf-8?B?dEQxMlFhOFV2cythcVloUS9aMEg1S3Y0MlhOZUJkbTVmNnIwVHRXb0hWNFg1?=
 =?utf-8?B?VEMyMEtLSk9Pei9IeFdRL043bjhBNHBKaENTa2FBVksxQWY4aVU3Z0dyTCtL?=
 =?utf-8?B?K0ZkZjdON09ZUCtTaHFVVFdxMTVGVmxlWUNJQ25qQ1pQR3BUV0NzUE5MTld3?=
 =?utf-8?B?b1g1RWZqNHNkMGduUk85RTk5UE81enloRTBNT0VpTmRjMCsxUVVYZ2E1cDdL?=
 =?utf-8?B?VEtnSmZPeXF2N1lkYlI4K3F1aVJsZXc4ck1XeXJPd2VYOWgyM2ZMcyttNXFM?=
 =?utf-8?B?aG9qcVBiMy9iVnJwQmFrc3FPMW5obXJKb2FheEFZOExhV1MySzhoWkVEREFV?=
 =?utf-8?B?SHNkcmlnNDEwM0Y2NlpHR01CYTFOMmpud2tUUmp5YkJ4VjYzV3M0ZTE1ekp5?=
 =?utf-8?B?anZmZnBJMy9VWUMrUkFEK2FuR1ZtbWVQSjNycGVITk5RaUNJb2xCUmZOL3RU?=
 =?utf-8?B?YXo4SHovc0p5Y1JWV1F5c1JRanlMaDJYK085VWkrRXZBNHh2T1FKbTE0S2pr?=
 =?utf-8?B?akZhbkRoNWtLVzE0VE5ieEMrL3RCTnlCWkdzRjdwWTZEUkFhUW54WXVPQUx3?=
 =?utf-8?B?SExRQTBVYjRiYU01UHAwRXd6bGR1Z3h0YVpOQ0VGQVFJMEZ6dWd0Q25Xc3A0?=
 =?utf-8?B?bFhMQ2tjU0xjUGZWV1Z5Qkdhd2h5aDRPQWpyT0c0b0FjT3dZQ1hmV0JBOUJz?=
 =?utf-8?B?aWVDOVo5RmtEdWd3TlJqUlJ0NXVrSzM2QVlKWTVIWE1VdnNCUWtlTlNJR0RT?=
 =?utf-8?B?anlReG4xOGtTaGJsdEg4NlYwMmUyeVFiaFlzSHVRQWN3ZGlxUC9SaEd3czhl?=
 =?utf-8?B?dkFkL3I3QW5Ga1A4aFF5U2hLMUNDNzhvRDNMS0NwSloyTDVoazQ1U3F3TDcr?=
 =?utf-8?B?OE54bFRxeVR1d1J0K2JJeXRkak9KbGRFMzJFeC9GTldSSnF6eWFFdXU3Q0No?=
 =?utf-8?B?QjhkOVJsTU53RkRWaWVnYkhZYzNVVkVmTFlMdFhaVXVnQlRKbW1DL0wxcVBC?=
 =?utf-8?B?Q2ExenNtL1EvdUM4K05ndjFnbFAxWDFXRHdCRTByM3ZNeURGTmVPakZIWSta?=
 =?utf-8?B?aHVCdkxDbzg4MFNaeG55SFdxYmNrQVNLcE0wWXBJQi9tZGVyaXZVTlVBcnhs?=
 =?utf-8?B?Y1NKRWdSWVdybWVHMWYwaG5YVTdITnNnYjlUL3VyOU5rc0wzMS9Xb1VXUDRB?=
 =?utf-8?B?UFAycXdCMHgveXBjYjR5VFh2Tlh6NE5RQ2IzTy8ydHVjREw1VG0wcHFHODZD?=
 =?utf-8?B?cmdDWFRQbGMwNURNQXJqMUVwV1FhSUd4amFYSGNPNXRIdno2Z2NqNk1BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enNBK1kyTEYvYjdoMXJldWxpQVpBZEFiZWRwMzlHaEJjWW1LVHFFdHYwRnVr?=
 =?utf-8?B?RTV2cDNGK3NpczgxVnU4VDk4TUROYWZLT0IrSC9TMFFqSDhWbUpBa1pUbzVK?=
 =?utf-8?B?K1Z3NWFoUjlpUEVOVzhEMXRBcUJVeTdaVFY3cUh2MnRRVHR3VCtmekY4bDVx?=
 =?utf-8?B?YUxHcWloL1FIeVlOZFUyZFN4aE9sUDBFWXVyQnFGYWwyVmNja0V6c0w0ZFhC?=
 =?utf-8?B?SlNaOHc4NXlVYjdBbjl1YXNHQW41YTJrRGI3ZENWM3FwdmprNHA5OXVhbUxT?=
 =?utf-8?B?UFpFQi90bVJVRkJ5NHlZLzhPakZCalRMdXdpT0l4akJFS3g0dTZiZHBycVFS?=
 =?utf-8?B?NHJxa0pCMWVCWjRJVnROemt4amhVaEo2Wk0vTFVSNStBVDFjMnlWZitwTWkx?=
 =?utf-8?B?N05Lc2I1ZEdDSjhTSXNWSHFuV0tLV1dhQ21RdEcxZ2trNjR4clhzRE1QWlVt?=
 =?utf-8?B?dUZzcklGUUZqOHhSUFd6aXY0UUovdjFNR3N0eGMybGp2czdjR1Z2RG5tU0N0?=
 =?utf-8?B?cUwvT205MXFjS0IrMUNQeGhzVGh3cE95dG5FTHZsY0lZMGJTbXg3Ui85N2NG?=
 =?utf-8?B?Q0tjK3VVK05hNlVHVm9Gc2dvZGh3TWR1VFZ3R2hXRXJ5VHA2aHpxY3kvSlFz?=
 =?utf-8?B?TnhzQmdYTmI0N3publNvNDhYMVpKZXdtRkVBVU9aVVVML1FtaVlGOTdyZkhG?=
 =?utf-8?B?ZFRnQk9DbmtBMkhvalRWWWI3cDluUUhvQ2d0cWQzU082dWRrbERhemxhQXRn?=
 =?utf-8?B?andXUnlxOFpYV2Q4MTlMTk5iSCtUd0t4WEFtOGt2WTB2ZWpIcjl4YnRDQ2or?=
 =?utf-8?B?NWdzU2g3MTlwN1ZEZU1RTDJHKzlwc2ZreVUrRTFFelJ2cUZ2cEdLWTRyWXZp?=
 =?utf-8?B?VmZSTnUvcDI2b2dDaDQrbEpkQ2ZtMUZ0T0QxdnZ5L1hwQUN4Q3pSMTIrUnpF?=
 =?utf-8?B?NEd0V0ZCRHBCMll4YXRpZk9QQVN6OTFPei95YzNpRXdDdmJqR2VQcmpqdlpY?=
 =?utf-8?B?QkNCU0lkRXRBdllsWWtTZXRHMDM5NkpnV1dsYmM1NHBlTUlVL0FlZVNrZlVp?=
 =?utf-8?B?MThzWjBEb1VNcy9xcll1bUNyT0NTcjE3OUhCRmg0a3NwWDlJU3pZNjVJQkhT?=
 =?utf-8?B?TXF4dHVDR01kL3JzM1JwSGFRYm8vc2FyVm1KQzRaUGJPNUN3dnZSeUVLYTNw?=
 =?utf-8?B?bmU2Mm11SGFhKzRNTFNrVFVkQ3laQmYyY1RYR0ZISjFHUCtpcWJ5cXNrUktD?=
 =?utf-8?B?eFlLeHg0TkFKcnJsa0Rhb0QxYnhoQ0FTV2pVWVZYTHJsNGF3MzJJdXBvMnRp?=
 =?utf-8?B?cDFWUlVYM2Y1Z2dldmFKd2x0RityYmNXK0hxNCtyUis2QmdCeEdpVkRpS0pK?=
 =?utf-8?B?RmlaUC9IZXd0TTV3Mk9BK1BxRmpXcStFRml3R3RCZDQ2dm5hZU5mbGxsRy9F?=
 =?utf-8?B?L2hTMElsOENpQU1rWVh0YjNEOWhHVjVGQ1RlYTdkQVBwY0hDbEtyOG1qM3kw?=
 =?utf-8?B?bUFHbHZnZ1hBSk1GUlpqZk0xQzd2UGNua2pVajl3cVFsK0hBSWxObzFhaXdM?=
 =?utf-8?B?RUcrT1NMd3YvNUJxQ2ZQV09IMi9nRjREZVVuUnlZRTEyNWVxUi9hVnFhd2JH?=
 =?utf-8?B?b3V4MXh1K01lY3BySzEyM1JYZFhEYVdJWmdGR3dXalF1aEhXQ3h3RGtDbEp2?=
 =?utf-8?B?Y2hvM3RFTk03TzQ0TVFyZGFoNmxzbVRJMFNlVmlhajF2Vk4vdTVsRDhkdG54?=
 =?utf-8?B?RUY0UzU1T0QxYWtVc0VvbDN1SGR3YVRYYUdzWjYrRzNOVkF4ck11NjhJZEgw?=
 =?utf-8?B?L2NrSzF3aFJXS1BZM1paVTBZaDdSdnNMT0NvdTJoRWkrSEsxNjlIQURKVFdJ?=
 =?utf-8?B?dVlUd25WTUZRMGZKSGsyZVA2OE1HZ3RpL0ZTK1NmcDVvNlF6eWtaQUs5a1Bv?=
 =?utf-8?B?anJOaElSTW03OVkrVDJ3VmtvaUdYKzVUTWlZck5GMGdzYUxRb2tYNm9ULzJz?=
 =?utf-8?B?cjJPZVJKTHgyeUZIV2duejJtd1lEZ1ZkUWdOLzlFR0Nwb2hIMlhhNCtFdllp?=
 =?utf-8?B?MlJHeG9waHVVWjdINGtyQlF2ZlRmMjc1RUM1b2VTNGNHUXlnMlhOTWtiMVp3?=
 =?utf-8?B?Q0NPaGFaTjdVd01JV243ZmxRNFRUdHRkYm45MHF4a3p0Z3gvMk5wSUtxaHJs?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8056ac8-b1d3-441f-915b-08dce89ec2f4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 20:12:55.4375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 486a1M0AfNtv8hGg+zJH0QuN97ZxT0CcThe00P0V/rZUZ24Rzo1udyn3xqPmPVA9CYdv2xj20JAmVdJsfzhIj7qb84XtyKylkwgmfabWyrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5918
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

On 10/8/2024 16:30, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
>
> The lite restore feature is supposed to be enabled by default.
>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c      | 2 ++
>   drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
>   2 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 8570b1218287..e1dad02b0770 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -75,6 +75,8 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>   	if (!guc_to_xe(guc)->info.skip_guc_pc)
>   		flags |= GUC_CTL_ENABLE_SLPC;
>   
> +	flags |= GUC_CTL_ENABLE_LITE_RESTORE;
> +
Given that this is unconditional, you could put this before the 
conditional one and make it a straight assignment (and drop the =0 from 
the declaration line).

john.

>   	return flags;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 01e3ab590c3a..08ffe59f22fa 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -105,6 +105,7 @@ struct guc_update_exec_queue_policy {
>   
>   #define GUC_CTL_FEATURE			2
>   #define   GUC_CTL_ENABLE_SLPC		BIT(2)
> +#define   GUC_CTL_ENABLE_LITE_RESTORE	BIT(4)
>   #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
>   
>   #define GUC_CTL_DEBUG			3

