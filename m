Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFE7C87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 09:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD6310E63C;
	Tue,  5 Aug 2025 09:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OAvwJrTC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113B610E636
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 09:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754385612; x=1785921612;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=skFG5ZPoYm8c1X4LiZUCcKt8OGo1VfDQPHVdPK44PpQ=;
 b=OAvwJrTCblPNY0E2Yw1g0o9PJ59P2irOVvP+xe9UjYF909/3bHFyssSN
 zKPH62utT402HUUkcJnSni2vgLaMMfU4l9KM6LsoU1IXasCo2zhRBULEJ
 OJTG/l2An2MdFObjN0s630yUpHGPF21HXDH2+ClBgFkPy7q4xvn9Vvlwo
 53UDTaeLwHdv4IDA1l5u26N1BmNC7BVFLjXC1d6EKuP8pywcUcC5avSJA
 wQziLYo/ZSPqT3GeqB2Z40L/QshtqDgUdE373I5eFxkYnKrArSuYyD56y
 WrO7otv2i1I5VqrU6liCB/bIsvANpIEV/B5F532Qy0Y/CouZt7f6fQBTy g==;
X-CSE-ConnectionGUID: q0bajJ74Tc+i7BCl2EKIOg==
X-CSE-MsgGUID: in1Q37T4Sxm4C2dHAnergQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="74251038"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="74251038"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 02:20:12 -0700
X-CSE-ConnectionGUID: +tlIYYKPQEWocit09yb/Yw==
X-CSE-MsgGUID: y8sJITlsQnaYvwgCQpa38g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="195270769"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 02:20:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 02:20:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 02:20:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.89) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 02:20:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+xCrM5jPXgR9p+fEaj2uOMgBcYp62Cr7ynBwAyrHauKrIonJZ1PO5EgI04gEcG3LkVmQfacL05ynPVTnsHqtZhfSbCCpqUDccga2RB7r3Wp9qZrad9eInUToV15OzfFgnaL/M2MNbcYe324mW8OhsGHpQz7AESxURWx2Yj1ojO+WqZkiJdDALr0krL7Ai5r7paU4J4jYSf0phglC7CVBALS/GaEu3mrosTusIK/VKYZYihNmAgK5bpWeheKOFEc9mtT7drjXmp4hdgymAfswyCrJZ5JTUKOHCsNr1k8fKqnBYAiX9+jJpG+V89xe0OG0jV4tZ5ikNDoEAEbEAR7Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewFUDddPXolCGcg6P3pgkqkACMpea1N38wZcNDJfSuA=;
 b=Vpf1R6wPKeH+qjJI3z0FkrX9mYETvTUCGlVPRFXfwbr2QcfkEHGiuvuShIoBtFjG0LsDwkOZZRv5ljVvHfACGnLf7xPLuAHTerz9VAmqPSYccWg1kJvsPgry1TB+wBePXric2yVvqBUvgdrLL03MXlxOWnadffjvBFTnp5eQHNY0ehR2NU4Ib0PpCpOD2et27Gt9O+va6Gp7hGL5DsFflc+mLtdL7wGKhtjS1eCYWKHjPB2gFXeop455tgtLMFUOyLghZ4c7lju6Zqu7C9S6CsNcNHDyuYzCkIBV1LPzka5IAbSuAVJlNpVU37C53ROecrIR8ppauXfuu1yvNrMVtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ5PPF0D72A1BA6.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::80c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 09:19:27 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 09:19:27 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH] drm/xe/pf: Program LMTT directory pointer on all GTs within a
 tile
Date: Tue, 5 Aug 2025 11:18:50 +0200
Message-ID: <20250805091850.1508240-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR06CA0028.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::33) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ5PPF0D72A1BA6:EE_
X-MS-Office365-Filtering-Correlation-Id: f62a5c26-d63f-4e54-b660-08ddd4012cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekZIWTd3QTNmbjBKekNoZ1gyL0xaRE9Sd2NUNTFLWEZ1amg5YlpvaE5Ta1du?=
 =?utf-8?B?Z2pHUGNZV1hkYUVOck9adTNBRm5Ed1h1WFRLMGNRWE5TVVdac3ZNb1oxRXhF?=
 =?utf-8?B?bHR6ZGlYUjFFeXQxd0dya2pSaEtDeEw1WFVidHVZY1lPVElWTnVVaUp1UUVt?=
 =?utf-8?B?cHUzYVVPQ0xUaDgvTFdPeGpZZVJLejBJSnp4NWI5UW9NTmNLUDc5L0NzUCtl?=
 =?utf-8?B?MnNCaFlITWxyejlaVTU0YzI0M00weEtkZDR1eU4yREdablJXRE82VG5JYXNB?=
 =?utf-8?B?anVMRjZDWUJSRUN6dlpqZEdVR01Jd3kxMmhuVCswQlBlOVRQRjhwNG55ZVFO?=
 =?utf-8?B?dHF2cGxPaTFrMVQraEVUVCtraXFoY1FNLzdkbkljWkUxUTFORGhSU2RuSHhC?=
 =?utf-8?B?NEdnQ0JyUU40b1lzQU54NjI2ekI0aW5LR1lCSkFob241VVFpc1ZUOWJKSTEr?=
 =?utf-8?B?RHc5RXJwU1oyeGZXRTdCbkVoRlNHTUtLQWNLUU9mcEtsOVU2L0tPSHYxM2tF?=
 =?utf-8?B?ZnVTZTF1eUhkYkF2VFUzWlJOL3cwZGlrdysvR0pXTm5QbWpWZzVhSHRmSDln?=
 =?utf-8?B?Z1EwTnNtVEtPaE5VVFVpalZzeFlnMWVWVXBsNURsbElRa0JDQ016VDVlcnRB?=
 =?utf-8?B?d0NVdGtlM3cvNDVXRG1rT3VDTFZJajZYaXpMU1lGcGw1VVFybHB3SCtUb0o4?=
 =?utf-8?B?VkVjUzloYThneWRtVTVBeDF2b3BvaFBsQ3dwNVdCbm5tZlpDb3N1RzRjVG9X?=
 =?utf-8?B?QlV0LzB5dFFoSFduaFhmMmdTRWw4YXp6TGVmOTZJdXlrVnZtQ28wYnFUVUdS?=
 =?utf-8?B?SGlPSGdneWZUODNKUGNNbXB1U044bzZ2VlFtaEt6RytDRUxPcUxiVndEQncr?=
 =?utf-8?B?ZncrZ05qQXpvU3lKK0cvc3JsYm1Ud0FzTkhMUnIvK3J5eGFVSWdGMzZid2Yw?=
 =?utf-8?B?RTAvWWk5UXI3N1RXdzFtQmNEWURRdzB5OXVyNWVRNXJZdFZvTGxlbzR6TEx2?=
 =?utf-8?B?UkZJOHoxcnY1ZVB6cTV1TjE2V2V1em96blR4dEk5TkxqUnk5SmNnMHR3T3RF?=
 =?utf-8?B?d2dsYm13ZUwyNEJ4Vlp3V1hGVGphNjdmUmsyYklINjhsTHc5K3kzalBCOGNo?=
 =?utf-8?B?NDFnQnFVQXd5bXcraEhZOTZhZzRSUUpib2JXOEp3dE9VT1JYdWpOYXJHTkFC?=
 =?utf-8?B?OFBidkkxQW1CcCticUVZNjFBU3hlN3IzMUpERFNVK21UZGJjaHpkd01sVDAx?=
 =?utf-8?B?ZTZEVFlDYlNiU2F4V1Zib3lVRHhXczU3cDJEOUNOQUZ2T21idldiZzdVeFdT?=
 =?utf-8?B?RFdXQld2MUJOS2hBR0VwZnFnRytjVlY4eUJmdmpmWVE1WjJDMEpqT1hQTjRp?=
 =?utf-8?B?dUJscXYzcUswYnRWeDhsaXBXZjRRVHRlL2lFSFJjQS84OW55YVhvcGNQaERn?=
 =?utf-8?B?VEo0NkdMRkQ5R3J5SDJsdmZvakE5b2tGM2w4T3FoNC9kYS9jaHFteFhaU2Vw?=
 =?utf-8?B?cEVGMWJ0ZFFXRCtIclF0c0EyTnVwOXh2ckpwdjVTOFIzeS9wRFlyZXpibjFs?=
 =?utf-8?B?aTdyMHF2eXRudFczLzRoYUhiNXZoNjdwT09ZanRvTzN5d3NnV1Z5RFpVelEv?=
 =?utf-8?B?YU1tNFdkejk5RnhQOFFwWng1d29PcnJvR1RidzhpaUd2NHdsWUZwRzBBVHpS?=
 =?utf-8?B?WEh6b2VPcUFHNUE4emVtU080RXlvMUF6ZWlGcjZOeWxCbGdISXNmUTh4YnZU?=
 =?utf-8?B?T1phcTZ3eFZNdmcrTEwzVkVaVmVCK2FHMVFmK0V2d0o0ZEJYbEMzVjkyVERD?=
 =?utf-8?B?dWdlSEZjR2VBcEpCam1xSXc5c2l3d2hFUWZsSFB5Q3FnQ3NyVWdEN0RaL2t1?=
 =?utf-8?B?dW12WDNsQ3EzNENXZVZEQ3hGTXZYYm1GTW1CRFdxK2dqS0EvM3haWWdEZWVx?=
 =?utf-8?Q?enJYlcdVQmg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnRzQ3JDWGZDQ0tscVlRVmt0S0ZXWGhFMzY4ekg2MksxTC9IT2ZzS2EvNHZP?=
 =?utf-8?B?RytyTTdVOEhWV1hFVU9NWmR6NC9hYW53a1FZaGVDQVdnSkVUNjRDSmhKMGEz?=
 =?utf-8?B?cTFVZk0wQ2xoV1EweXJpSkkrWnlvZkg0ZmFleXh1OEV0K1YxUG1lMWxKdGpK?=
 =?utf-8?B?ZVdPbmlvYWlrUHpHemY2c3FkY05yNngxeEhUVnJRb2dDckFORHBDK3JoUHR6?=
 =?utf-8?B?L2Qyb24vcndCaEorWVVUb3BwZllENW12ejRwMURmdTQ3UWZkUXF6Um9VdWNY?=
 =?utf-8?B?eTIwdnRHUkdGeThFZldvSitoVjNvVEw1QnFxMWN0RG1oTjRWcWVXQnpoL2Rs?=
 =?utf-8?B?SVVqWjIvZkFKeDU0NzJDNFRRMVh5NHd4S2cwbDVKMEpuY2ZUNHhqb2V4NEl5?=
 =?utf-8?B?ZjVaTElkTEEzdCsvR2hJY2xqSlNEL0lUYWN6M05Nb2RkVnV5bWZWZkY1cHRY?=
 =?utf-8?B?YzR1b3kzTUdMdUlBQ3RJMi9KK2RCSGgzSjdCcTh1UDJQT21ITUg4SWRwd3Vt?=
 =?utf-8?B?UTA2YnFYMEp1MHMwNXNvUVJXMm4yeUlCeStXTmZGVEIwQW1rVWo4WU83SVdh?=
 =?utf-8?B?NGZUdmQ5dEVFSG5vM2ZQS3JCbFhDbjYyekZOeUtTZVNHUVZZNXFJWVVremRi?=
 =?utf-8?B?MHpKQy9vbmpuMjJKOFhIOGFsWnIxVDE4SGlSSk02ODhYekJSTW51NnNlUEtt?=
 =?utf-8?B?dGpmcjVuclNaN1VCajFWUDNiM0U1NnBnV1NCQWRQcnVLcE84a04zWVd5d0RL?=
 =?utf-8?B?WWU4dVMvV3BBMkVLbGRmbkFsWTVPOUl2Ymw3MFpSNEh4SUNaY2pSeWFBUFJn?=
 =?utf-8?B?bjhFNHg5ejhwQ2NPclpsNHEyQitwQjFuM2FXcGlGSTZUOWZjcFdUdVU1TDl5?=
 =?utf-8?B?eCtyZnBpTzN3c1RIS2ZYcklGUVdqdkVYcDNPMzZ5QTNoRTUyZTh6RzVZVEJ6?=
 =?utf-8?B?TFJ2WHhKUU0ySnJEa3ZuQWJ2blBvcFhDZHZ2M1I2NWZ5UzRZa3BPZjhERm1s?=
 =?utf-8?B?eUxyb0UxM3BPVzFXMDllMitnZ25ZcnFyN2U3UmZPSzVVWWhnUkRBL2ZQcURL?=
 =?utf-8?B?TjVveDk1Ym0xMnFXQmhkaGdTcDcwck85RlRwcDZxMHhWYlhjdUxOMEhqS1l5?=
 =?utf-8?B?QkN5U05mUVg3ajgxNlRjaWlZS1hWVkhRWHZvWDVESlg2cVVCVFpNTmpHK1Ry?=
 =?utf-8?B?TlY0MmZIKzRvMENzU1huRHJJVVk0STlOTVE0SlNtN1B1MlBVZTRJNUo0SGM0?=
 =?utf-8?B?NGc2Q05yQ3h3N0xJcC84Q2hzVmtCOEpoT3F0RnM0YURKamJWZ3MzRFV0NU9r?=
 =?utf-8?B?NzR0TlhNb3c3OThkQkF1Uks3bHBHdksrb2o4V1BSSHd6elQvc2dIeGZIRUc3?=
 =?utf-8?B?OXM0UTdwUitlTFVmVHhibVJ2UnhMS1B1dGJuRUMzaGJtQkd6WGx4QlVVRFJ2?=
 =?utf-8?B?SDZiSkxBYlp5KytlNnZXN0hLZjBha0Zta2ZacXhJVEIxU1JXZmZRZ1MzNGM2?=
 =?utf-8?B?aXNIU1U3UEJobUl4SFNudVJVMmE0ajlYV05ERGhsNXpwZnY0dU95OVArZ2Jz?=
 =?utf-8?B?V2JiSUVUWm5jeUxMcXRSVWlkSTBkV1h5cnFJV1NaVFFYaXI2UzVNMHBiOVVa?=
 =?utf-8?B?UkRvZmlrQWF2bm9ESEJMREhPdkVEZU1JTmhlQUppYVhzM2ZoU3FJUXlhM3Ax?=
 =?utf-8?B?djJ5WW5qekx5ZHdiVGhJQ2QyTHJCbXJIT1dzRDhUNGQvMFdvTHNDa1dadVEz?=
 =?utf-8?B?UU0xaVpVenpGY1B6TFNkN3ZzRkJyNGV2TWdzTUtDQ1hyZTVnZFZqeThSZ0lt?=
 =?utf-8?B?UU9hcng3aFg1QTRxaWsxb1RrOUo2dnk1blBNTEZ5NVpReFhIUGx4dHRhYm5C?=
 =?utf-8?B?UmtkS2hJNkg5NHFHZE5HYjNmUTRaaXhpWmQ1SklRYnJHekZSMmxBbC8yVW9k?=
 =?utf-8?B?T0VZRDdRVWRGWStVSXgxVjdDbC9GL3cxMTExb1hVMCtSZUZLK3M4QXQ0UXNZ?=
 =?utf-8?B?QXhSbmtKM3daRDNLWjJVSlROT1Q2dWZmMmUya1EyaUo4MmpZQVBqK3RnVVJ3?=
 =?utf-8?B?SzJqak1BY09TTXE2dkFkZFdGbkNldkZuaTBqVVFKQVR0YW9mNFZFejJMeWpT?=
 =?utf-8?B?cEZ6eDRKL2pyRm9iakpzUDZvTWdFUmR3SkdZNmNuMzFLVG9Da0lXZ2w0alZq?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f62a5c26-d63f-4e54-b660-08ddd4012cea
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 09:19:27.2455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAi8pTVF8xpQIq1m5GKDsWQbfXxZkaoPMWwqsb3NmnaJeiJcFYMAsc8F+z/6RhBK+hU4BYWSq6dGmpwwVJVog06TLH1G5v4XW6LZ2aMvfY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0D72A1BA6
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Previously, the LMTT directory pointer was only programmed for primary GT
within a tile. However, to ensure correct Local Memory access by VFs,
the LMTT configuration must be programmed on all GTs within the tile.
Lets program the LMTT directory pointer on every GT of the tile
to guarantee proper LMEM access across all GTs on VFs.

bspec: 67468
hsdes: 18042797646

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_lmtt.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index a2000307d5bf..a78c9d474a6e 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -195,14 +195,17 @@ static void lmtt_setup_dir_ptr(struct xe_lmtt *lmtt)
 	struct xe_tile *tile = lmtt_to_tile(lmtt);
 	struct xe_device *xe = tile_to_xe(tile);
 	dma_addr_t offset = xe_bo_main_addr(lmtt->pd->bo, XE_PAGE_SIZE);
+	struct xe_gt *gt;
+	u8 id;
 
 	lmtt_debug(lmtt, "DIR offset %pad\n", &offset);
 	lmtt_assert(lmtt, xe_bo_is_vram(lmtt->pd->bo));
 	lmtt_assert(lmtt, IS_ALIGNED(offset, SZ_64K));
 
-	xe_mmio_write32(&tile->mmio,
-			GRAPHICS_VER(xe) >= 20 ? XE2_LMEM_CFG : LMEM_CFG,
-			LMEM_EN | REG_FIELD_PREP(LMTT_DIR_PTR, offset / SZ_64K));
+	for_each_gt_on_tile(gt, tile, id)
+		xe_mmio_write32(&gt->mmio,
+				GRAPHICS_VER(xe) >= 20 ? XE2_LMEM_CFG : LMEM_CFG,
+				LMEM_EN | REG_FIELD_PREP(LMTT_DIR_PTR, offset / SZ_64K));
 }
 
 /**
-- 
2.34.1

