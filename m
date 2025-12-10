Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB16BD3B9BE
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 17:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7807610E787;
	Wed, 10 Dec 2025 17:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JgfLd1fq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5CC10E782;
 Wed, 10 Dec 2025 17:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765386777; x=1796922777;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5232SCrPx6239z4LgrQsalwvzvk8iWg4gf3hoUFOJAU=;
 b=JgfLd1fqfBQ9PZmEx7adA9C2y3/UxxCJu1jtuN1Z2/vJRNSjsvlfx7zj
 dBrWay6vxpvJCiC/qPxEOOmgWEOkyREyBv5M8KwPsCG5duZItlCNRF5M3
 csvcop6x9CYwbZeefowUakE2DIt3ZvIjGy68gP20kn8hRSaqLlg/mNUbD
 iIKJviMJzYNmfKEzoSF/QxtXCBQdtJToasthjiKXK1ITXv+UIIRUrPwVP
 7JqMFiTuLgAV5bY6Jby9u6wj2m5buclqvRD1oWOPmQ15mVzhLufv/P6CY
 iNx61BaYYrcNWOi+0pSZ1YNobN5HKm92Ebsxk6wsK2jQJvOpAmrf9j6cu A==;
X-CSE-ConnectionGUID: lsUO2pWeSyeg2syRwjFmOQ==
X-CSE-MsgGUID: UyrNnFBpTRuh+bFIg//0WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="84968062"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="84968062"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 09:12:56 -0800
X-CSE-ConnectionGUID: OfA8MYFRSx26JsTUrAbNtw==
X-CSE-MsgGUID: fKPDjXhxQXChi43Pxlpm5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="195642818"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 09:12:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 09:12:55 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 09:12:55 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 09:12:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3trrMxdGagnuEU1Jo+6CklthphJWFc++Oqzj52LBfYgA+W5fVByys5n4JqQEN++Wa96nSXCV/IDA20kx4Ok4N9qH8S+4V8AMhAjrPq9l60GCwQGNpqs/c2h1WVQ470k6pbjBf6y9zJNSnhaO6Q+q79obR6M0bfXhl6ejhzuEie0NgcnqEw0GDsZCik4J/ObWyX6GGrnWAMbGVcz75kd/PSwhCTnON3G3rwPcuF9yRPIuEjLL7YYkuKjCG8HK7vK0VGv0TSKCZRYyRAOxbBB05lkgoeDpeCTdFasdLuLMXMls/sYK1HSC378MNnvodbHsoaeVZbHIY73RPN+fuFsvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eyK5o/C459aXVy042o9zUly8ddbKMTbQXhXjgSZh+g=;
 b=FVnhTL7BpXhK3QaMD4nEGV5GESkAjP6qc7QdCuxzbX6z3NLYEE2fFHYCUIFvOGQhF3a8rMm63KX7/AGVf95FVLFHRl3Rd1QWi8ARQpgeZSJDB2VqjmlaoFTLg2YGlfW3RrPGdUvMWL6nzihJmHepg2ZCO9mltn2ICkNxGTONZhI8uv+3S0S1FN9K0EOldD5iAz/3IbBLqVHu/j4Dd8xQppqsJsqikgn3sDWbl/EhaG4pKBCkyiIIAGqapEUbXtvBMUEaBTrV2BKpfXqjK0X6z4Kz23EoryVcqqb6JB+rY6WTNe9RIMTVPSiCwuYyyYLcATv6UTfqwnIVqaI8eByzcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Wed, 10 Dec
 2025 17:12:54 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%6]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 17:12:53 +0000
Message-ID: <2419baf6-1c41-4b60-9b6c-ba7af1cf2a69@intel.com>
Date: Wed, 10 Dec 2025 09:12:51 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Test_GuC_v70=2E55=2E3_for_LNL=2C_BMG=2C_PTL_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20251209001501.2585995-2-julia.filipchuk@intel.com>
 <176537873461.74285.13218476302443931121@a3b018990fe9>
Content-Language: en-US
CC: <I915-ci-infra@lists.freedesktop.org>
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <176537873461.74285.13218476302443931121@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::29) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SN7PR11MB8283:EE_
X-MS-Office365-Filtering-Correlation-Id: 16533eb2-ee90-4a20-4c3f-08de380f5ae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1lNSUQ5bG1xUE9hL29Ya0dZaGFGblBaL2s3ZXNHdnJNamdmWTNRVlpkbS9a?=
 =?utf-8?B?VWJuc0gyWWp1R2tEVlZHUHR4UTJpZTNOSEg4aDdZZlJwbDhkcjRlZmtYdmVt?=
 =?utf-8?B?NklMbk04K1kzRVl5eGlBVjkwNW9qcTV5d3dsRjZPRHkyY2ZxRUQrLzBuTnp1?=
 =?utf-8?B?dTk2ZjBkRTRCMzRnWlEyK1NMYSswaXFqR0V5U0UvcXphWU1hZ2RoUnQxckZ3?=
 =?utf-8?B?dU12dGpqcE9WSTcvV2FCQTk3SG9mck5oQjZzR0o0Y2k5VjAyazU1L0dkS0hW?=
 =?utf-8?B?b3lWc004bzRGcWQvTXZDL2tiZnA0WnU0Rjk0YWpzaGFLalBjK05RSnVPOGJE?=
 =?utf-8?B?ckw1UzZ6czNVV1huMFI2eGlIb1hiNmYrbmhEeXBUakQrVWJsNnNvQ1JiU0tT?=
 =?utf-8?B?UzRIMU8yakJWYjN4K3E3NUZYUVd1UGNZRFdLQks1RVpzLzFXaUg1VGhqZkNj?=
 =?utf-8?B?Z2xCSXlieUsrZ1J0dHFhQWI0bmN2R044V0w5SklrN2tPNVhtSTgzOGFtUXRM?=
 =?utf-8?B?TzJGK3NuTFdxWUx5VW1ZbFQ5WVpFY2ozY2dKeEtDYXFNVGJVeDFqN0I2M3dN?=
 =?utf-8?B?S040TXlCdSs2VDU4TG9ZdTRld1lHbWppY3FkMXdMTmpFT3JQaGs4SUlSWkxG?=
 =?utf-8?B?V0h0TWJCNjRIOElxNy9HSzlGR3g2K09GdVV6SE04WEtZUXpWZkhyemRwWXQ4?=
 =?utf-8?B?bDBuM29mVHBHSGV4YjN3ZFpkUlhHSGJtSVFSWEY2ejJOckV3d2RpWXJuVmw5?=
 =?utf-8?B?eTA4WG9zNVRNNzZHNTZ5ajZMVDY3NmluM2ZTL295R2Uzc1JMc3RYeWI1Z2I1?=
 =?utf-8?B?TitsaVR4K2EyYWJEU0IxNWJwaWlHTTZRNE1UYzJFY1BjdE4yZ3pRVVVtQmVJ?=
 =?utf-8?B?UVBBcFRTdi9NVG5aTGlPQ05SanVJQ0dTMEp3L0dQd3dYdWN5WlhpSCsrdkRE?=
 =?utf-8?B?Q3BHRVduY2VUTDYwMEV0OWdCSWd3aE1jdmJyNmtha1M4VHRMdzlPZWRwQUpx?=
 =?utf-8?B?TmJUdnhSNlh1N29MV1BaWkhncTNhaEF1Vjl6cW50czFRbUpmVEpCUHN3ZWFQ?=
 =?utf-8?B?Q0l5TnFCYUZXVW54a1dIc2dPOTFieXovZnNNbTM0ODdJQk9RMlE3b0lObnFU?=
 =?utf-8?B?RXpCU25zMTFUMFhZRTRwMlZDT0wxcHp2eGpSUi9IOWNXakRmOHR3M1NiaW5z?=
 =?utf-8?B?eVhla0pzajQxRzZWdWJIZGtWZGpEVmRIUE5Hb2FIYm82UUF2aFZjSk8vdGNh?=
 =?utf-8?B?Qmp0N3l1MmdES3I0SjU2Qm9hRmMwZnFHekxmOGdDYXZYbFhrTUdqUC9UMHJh?=
 =?utf-8?B?eWg1bEE0eUo0REZKV3lGVWp4UE85ekZ3T2Q0ZzFMRlZkOExOblRuMCtBVTgr?=
 =?utf-8?B?d1dWNXRnbVVLVUVqL2daV0pJa1Arak9EdnBnN0hUbGJSSU1nZS9IL1QyRjFi?=
 =?utf-8?B?Z3A1NWNNWFdySGFiL1BuSXp4a1JiOVkxWnIxZUhoU0FHMTJ4SzBMVkRXZzdN?=
 =?utf-8?B?RDd2bTduazlYTFhsL3RFSFRTTDZNaGtuYWpGQ2J5Q2JTVmkwTHBGdFhUcmcz?=
 =?utf-8?B?TVFGY1kwWWxmdkJpN2JZUU9FcWpVUDZiYTlNZkRjZEdRaWJ2VWx0Y2thek50?=
 =?utf-8?B?aTVYYzBZaWJITXVGR05LQmovRzZEUElucG55dDhSQnJ6WmIrbjlYKy9mR3BB?=
 =?utf-8?B?a1REMjVWWmhUajRIdTFTMGdMOWJoWDhaWndZcEgveXJCLzYvWFZnLzl0UEs0?=
 =?utf-8?B?ZEovSGZXZk1NV0FRS0grSms3a1BUMldGZTNLWXpPUzhIM1NkdkhXeUxtd05F?=
 =?utf-8?B?MmdFa3pDNys1L0lHVFAzSStoSXczR2FmaUVDZVF5OHBuNm1rTk1EUnppUUox?=
 =?utf-8?B?bjFaWTREa0pWUnZsbjROSGRUMmkrbE9WUHJ2NnNBUzRld3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3E5ZUhvLzFBN2Z2cWNLc0JyU0NwUEtYVTFxRHh4MGdnd0RES0M2cmJhQTcw?=
 =?utf-8?B?c1lkOHpITVE5ajBwNFhla1YvWjJSZFByTWNTeE9mbkVab1lSUEhpNzZ5U1Ba?=
 =?utf-8?B?dzZWdnpUeHJoZWh2dXdzZ2hTSDJ3SkdLVlZlOGhjTVhMUnV5YktiaEkwUk5u?=
 =?utf-8?B?KzBsc2dMWnhKdlVUUXB5czhjMTM3SHlUOVUwakxGaGt3OStxeTBreVFVeTFK?=
 =?utf-8?B?N1JVVlNRek5wZStZK2dRVHYzWmFSVXdMK2N3RzI5RnZwYVRaV1ZGN1NnSC9J?=
 =?utf-8?B?TDZhUmJOYmpLN2czR0ZtWDNpaFVVWmdkMHNDb1lDckFLN1QrcjhienV1K2lx?=
 =?utf-8?B?T0cva0ZycTRmVUVOWnRlZktGa3NYQUdtR2xSSUpCeG02VGVQdUlBMEZtZzBm?=
 =?utf-8?B?cjI0UFBsSjNvMkVkUVd3VjIrZEgwZDNBYkJFZ3ZQSW92bnRSckljVHZrUjk4?=
 =?utf-8?B?VmJBcDcvbTRUWFNhYUFNbWhqdTFRNXRaSTYwS2NuUVBYTDhoRytnS281cDJI?=
 =?utf-8?B?cFFyQnBPWjl3V2t0c1d0RGNMMTdoS09VbXF0UnkzZ0lDOE81Zy84bnBlU0lZ?=
 =?utf-8?B?NnJoSmNqcXZ0R1lqeE5LVGgrUFVIT0s4Z1V4bTFkOW5SUC84bXR6UlBHV0kw?=
 =?utf-8?B?enR1ZERXOEpoRVM4SDRyZ3lzemY5WUNxWmtpV256anJ5OGtvL3FqK1FEWHc5?=
 =?utf-8?B?bjFnN09icWN4UlM4RTdQTXcvTGNNZEh5Y0liSndnVkVKTG9MKzNZMk9lekw2?=
 =?utf-8?B?U1dtRjByVmpKSnJJYmMwZ2VsbjdML3BqbTRQa2VHQlFZdmhGZ2EwekhwVUYw?=
 =?utf-8?B?TEN1S2pLc2hYVTg1bjZqUTBkZUMvVjliN2FVZVVzd0p4SHBKa1R5UmlhaHhD?=
 =?utf-8?B?SXI2VTJIbkRpUnBpaGtiM0pBZnRucTJCVXpoYmV4K0JrenBsTVlUdU9OZTdj?=
 =?utf-8?B?OTAxdXZKM0ZLd3A0T2FuKzREYkhpRTdVNW1LcnowNEZ0bVpIQllOZTJweXBI?=
 =?utf-8?B?ME00Smg5dHhvZDZ4RlZjbWtpTm8wcWcrTzFlbUdFRjRaWDdwRmIrVXNCWVh6?=
 =?utf-8?B?ZDN0N1k1dWtvUEJFYkJRU1JSbzRXdHpZbzlyT0JRcmxBekd3cTNvQ0RjZEl5?=
 =?utf-8?B?THlUTjFmYmxWcVIyR1RTV3lDTUQxTHFSTXVYV3ovRWxLQThyRjZ2QXFKSmZn?=
 =?utf-8?B?NjFPWE42SXoyNjVoU0Qya3Rtb2hnNVJ3K1pLUVczWVBRajJmTUV6UzZDZG40?=
 =?utf-8?B?dk1FMzlCbVNSVmF5djJwN3huMXFnSWdoMHpjczR4Yi9mUnJjRXV5dEJON1ND?=
 =?utf-8?B?N1FJdkVUV2RBcWhCbWlsWGgwa1NFM3NRRWRtSmhEdlpBL3YveVd4TkkxRDh6?=
 =?utf-8?B?NDVRKzc1MDZLc0RHenJ5eC9IYkFGVXBFeWFVUmFYbHBSVFlZTFB3cmhMSFBo?=
 =?utf-8?B?d0RJT1lMdTFaWUpJT3NkRC9zempvUFJlSUpoK0dqSEdvN1pKNnRUSXVqQnhm?=
 =?utf-8?B?SFh4dFJKdExTbS9sZE5NS3AzSUtkNkFNdVhoUlVrOTJVUVJBSkpDWWMyVVll?=
 =?utf-8?B?WXZwNGM3czBEZFI1TkJuKzg0RG5TdTg4Znl1ODltZGM3NklKdDA0MkZvM0kv?=
 =?utf-8?B?My9pZDFDMnk3N1YybE81eUtPZ1FNNGcvMHNWUjRxZzQzMVNVeXp2YjlucVZr?=
 =?utf-8?B?QURCNklKOTBRUDJxbGZSc014V242cFR6WDUyTGtGMWdKZTIxZWpxNUJBeFFw?=
 =?utf-8?B?aGp4S1B5Zk5oNTlnVStXdGpmTGRHYmJjSitFeXYzVjdOdFVJS1FTYlRhbkw5?=
 =?utf-8?B?NXd4TFZkYnE1ZW5qVkxHbGllUFpsZGhPMnJqRTh4aDFCeHJkUkdRbkZtSW1E?=
 =?utf-8?B?WG5ZeE1ZSUtIUXhtYi8vR2tlNFpodkNkTHZPUC9Qbm13Nk1mdWw4RlN1QXJa?=
 =?utf-8?B?N1p4NExPcnp4VFJzb0ljY0pVS0JyQzRCM285V0ZyYzhwZVBWS1BiT0NjcTMy?=
 =?utf-8?B?amVJR3M0bjdzYndKWkF0SEg1a0lCdDRVbWJuWHo1ckk4L2wrUGFkL0lTcXdw?=
 =?utf-8?B?QTNYZU15OC82TlE5NkdWL1VrU29DRk1CRTViQ1gwMmIwcHdHbDFZaG5IYVlx?=
 =?utf-8?B?OTR1bmJKMGh6bWZGTmpuSW5QYmtPc3oxejQzby95RFE1ckVTdEdwTXdXNTNZ?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16533eb2-ee90-4a20-4c3f-08de380f5ae9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 17:12:53.6976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLXgR+T10MRx47p4FdzJLAX1IPWYa33l5BTyqdFqPlFvsa0dh5iqsofi5P2t/GJQMbX9JaxPhi8itTI1KjjQRKYGtByJ69gr2TEHLKxvlyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8283
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

On 12/10/2025 6:58 AM, Patchwork wrote:
> Series: drm/xe/guc: Test GuC v70.55.3 for LNL, BMG, PTL (rev2)
> URL   : https://patchwork.freedesktop.org/series/158660/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4212-46691bf8a4a5a4887c079a41007e98b037e06ffb_FULL -> xe-pw-158660v2_FULL


>   * igt@kms_async_flips@async-flip-hang@pipe-d-dp-2:
>     - shard-bmg:          [PASS][1] -> [FAIL][2] +2 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4212-46691bf8a4a5a4887c079a41007e98b037e06ffb/shard-bmg-8/igt@kms_async_flips@async-flip-hang@pipe-d-dp-2.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158660v2/shard-bmg-6/igt@kms_async_flips@async-flip-hang@pipe-d-dp-2.html
> 
Failure in display code unrelated to changes.

