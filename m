Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F612D2A53C
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 21:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E6B10E089;
	Thu,  4 Dec 2025 21:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RLNacPt4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507E810E089
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 21:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764883519; x=1796419519;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XOCBtKFmQ8s343gFReeKiEibnKfGFEOscRh+/imYNUQ=;
 b=RLNacPt4y1ieHfiTyFarx5Ypq4Jy2KJXqe8erUFFuRCeI6s/Mae8v3Kq
 +e86HDJoeZ+UXGq8nocYTpsP8yuIkMrXYk8xgVHtiUyuNgDyBXK7/j++j
 C+UBR3ZTAogErb9BQZApx0iMBN5O7goYEWjpRPiU0KVy7Z9OcMlpEEesS
 Z0P027LIzdSxDHrW0+vwNhmjkbJnidYyoObsnF8g66o2SjwKM1TxDutjf
 iesHhPPMYq5aT3XHm9WfG2pW2Yyg7wB8kNd9b3vCOWhPVfGCDEegc125y
 wvb5UWJFTV1d66ZCduSgz11Qj+HYoQLTlQ7jHlGM4WjVdf1S3imyvgidT w==;
X-CSE-ConnectionGUID: iUsM8eRlR7iEXVPQ2urjPQ==
X-CSE-MsgGUID: CGmVdO60SiCpwIbE69OmRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78382133"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="78382133"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:25:19 -0800
X-CSE-ConnectionGUID: 0JewW7CySKmUdV4Cu8MTYg==
X-CSE-MsgGUID: zAQZDncCStCC7WmmdowoaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="194372939"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:25:19 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:25:18 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 13:25:18 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:25:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9xRux9tTzvmDCVuj5EAp6UW8rLymXHx/QjE2q01aZZx5Gs2mPdG0YUNr4lf2NVHYAn4lxIsYTZjV1nKcA32X//qE2h7KNeqZiW+PHFLnUI3K/GS0U8rQ84IyigShD6E/q2VT7M5PsRU8kD+j830sz5Oz88tofihR8ZHnDBZ9vAJhlNSjX0puSoWOUz+ng4xZaR9+xRQAiTJW1IoH5KYGOom5HK9Csb/X8Yt01+S5pgE4OvCO45zUPmTU4M7hI+xa7jB2vptamFynmzy+KD3ufkJEQhSTEwjV6s617amxLSUWHL+xzjxSttm8t0qCltN0FTAslHPEgTn/BPDrAodoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KzBTPAdDvEII5TB2ZSalEfhQg4QPY/LMUdgAZudd3c=;
 b=KmRh4V8QgQxs7u7NOu7chFv6GspPpmanbIGmSUcNriIJ7q6acORXrjr+Jgey14W42RBrXY2Bxg4iWzQdUzW6PsZ2O6icxUkqqz+0o51QKMNhsWnO65aTBsL4xlPHGy887tzgMalhebLfY+avIB3/ICWxf4cB5KlIL15LpLdrlmjD/jocGI3EuzO75nP5Xkdzsl2GzcoAVHAwYY0VkmiTVsSVRweAOh7ENd7JS2R/9F22D0h8aevfy2/RIg6apMwE3Yav2+1eC6OtBEvpdKemNS9HOKWwV3w+bZDmDWkftQ2NTum2TgQ2nBH35bE74RXZfuBYd5VSozIsjCUInowh2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CH3PR11MB7796.namprd11.prod.outlook.com (2603:10b6:610:121::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 21:25:15 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 21:25:14 +0000
Message-ID: <098845b1-552b-4f11-9e32-8b38f9c27ec0@intel.com>
Date: Thu, 4 Dec 2025 16:25:12 -0500
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Add_LFD_format_output_for_guc_log_=28rev8=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20251127170759.2620994-1-zhanjun.dong@intel.com>
 <176428193149.36740.4156035187788358219@a3b018990fe9>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <176428193149.36740.4156035187788358219@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:303:2b::23) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CH3PR11MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: 2caadf0e-aa25-452c-63e6-08de337b9d43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGNqYzNwaEZoNHUzRy9YUURVSmNRVGNyNjJhejAyYzNtL1I5WVB2d29xTVM5?=
 =?utf-8?B?L0gxZ2Y1eDBXZTE5bjUva1VqSWNINkxZUHpsVkp5TGk2Qjltd2ZxWVVSa0F6?=
 =?utf-8?B?QzZhN2tHU3l5TVJaTEVxYjRvdmxvWGduVDA0SHJvSDZhcWJWaU1mRFhTemNn?=
 =?utf-8?B?MExoaDBoMHhqMGVMb0x4U1BHMStUdnp1cHltTVA3UTdhcDJWTWVNaXQ2eE9R?=
 =?utf-8?B?dzhxbUhWeXJaLzJ6RUVFcVNZN2U0TkcyMVkvUFFBTC93c0pnMXRwNCtqNnpz?=
 =?utf-8?B?bGNhVVBjNWg5SXgrUkF5TytCUHpUTFdQMitvUEd5NkQwQldqdFFTb2RkNGJz?=
 =?utf-8?B?NjRsR1Y4anpVcnhQRmR1NHhoSE9CYTNnS0Rvc25qNjJmUHh1ald5ejBDQW5Q?=
 =?utf-8?B?djVrdit3WGgxSVpXZzIzUXRjRWVsMVYrc2FVSW0zc3YrK0Z1TnhZb28vRW1h?=
 =?utf-8?B?WHhWRVFLalN6b2RKbk9LQWU3ZVNZWDNsaERMdThkOE9Gbzh4YmhRbU9KcEVP?=
 =?utf-8?B?bkh5K1ZCR3NoNFF4Yy9ySWs0QVo2QXFmWGk3MDFvejR5b28rZFhiOUJsMTk0?=
 =?utf-8?B?R3RmbFV1MzdhUGpLai9CZUh3MTVhb3V1R01qNXNSZmlnSWJ0dHJCSVFmRmhs?=
 =?utf-8?B?MW56SDYvS0JFc3UxcXcyMmx2NUVvbkNCZERpQ3NuUkcwbHg3STMwMlJhVlpH?=
 =?utf-8?B?ZEM2bnM3YkVrMTM4b09NNmRybmE4bWpyaE1Ha056bExFL2VOUHY3YjBjVUNF?=
 =?utf-8?B?NUdDd1NpR3I4aG0yZmo1TVZyVERPQjNvRGFlL1BCWWJiR0ZSOWJUS0c1MmNE?=
 =?utf-8?B?YjU4dWNkVUpDcWZpbzhwci9vVXNmcHBtYURRelladmh2cVFDRFR1Qmo5elBT?=
 =?utf-8?B?SnF2WTR3RjMycVJZd2lidlk3ak0zVUxnZW92by94S28zT2hSNGRpdVFTTmpI?=
 =?utf-8?B?Yi9pdXYwNUdGRkdjVlZzSWdQMTRTbUROQWtwNlFwdndIeWhESzNmU2pjeWx2?=
 =?utf-8?B?L3V2VVhxYkxaWElVNHZybnU1bXhPTFh6amV3WFo2dVFaa2lBN0RIc2V5YXUz?=
 =?utf-8?B?djRTZHpCYlpqYitlYllVdjF3WnR1c1VQQlEzOHJGT2lzYXB5TXFtWHE5bzZN?=
 =?utf-8?B?TTZySDFnN2F2dWx5OXQzS0FxbTEza2FrREpmZTB1TVNmM0sxVTByTis2Y01l?=
 =?utf-8?B?alppL1BudXZ0c3hVMTRoVFRzVTNrMy80NDRuMzlVUWNRc3FwZGt1eDFCTm5v?=
 =?utf-8?B?OVRBYU8wR3g3SzBSTWVnUzZybXVCRlpqdFYvZGZOUnQrd0x0OTlPWVRCR3lj?=
 =?utf-8?B?dWNTT1o2K3FBUTNjWUlsQ3Zwc01pMkpwVnRLa2xybWUvMlBzR0VBUy9xN0VO?=
 =?utf-8?B?Y2MwYy8vbzFDemthemVRMHI3QlpCNFdUU2wwa3pmbVdRNnVOQnVMdmtmcUFT?=
 =?utf-8?B?b2dLYndIbWc2VW12c1ZYaVdIS0gwK1lMNElEV0NIYWZjS1ZBQmVmeEdnK1Q0?=
 =?utf-8?B?elE1MTRiQ2tsbHMrWER3V2hNMkd1eU56aXJJQ0VTYXdsR0FaOU85TkJRc3lW?=
 =?utf-8?B?ektQWkoyN3BMa2F2QzhrZ2ZaMDlxelhSeWlFM0tXS2RwMTJGZzJ3Q2JCQXlI?=
 =?utf-8?B?S1I1QThBS2lFd1duclhKQjVvM0EyM3FNaUxIc1dTblZ1YUlWY3dBd3VvVTRq?=
 =?utf-8?B?S1FZdGdJWTRodHZ3L3A2Ym0vQjlNQXgvcFk2MTUzaG1objJ3YWlEZVlqaDhm?=
 =?utf-8?B?SG9HRTRwNVd2ZlBnWkRhcEVHVzlaTnplNXlyU0lTRlF1bTUyd1NSeVR4aW9C?=
 =?utf-8?B?QndsTTFBak0yYWFSSXpCZEVNY2dlZkR4dW5idzkrcit5NC9pY2x4Qk16d3Yv?=
 =?utf-8?B?bkJTNWRxU0FoNVA0WkhVc3F6TTl1N0UxU2JyMXlmdGpWdGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEI0RnBWOCtGbVpGOXpTRllWSklkd3Z6QktnUG52NkVvME95eDgyYjlCa0NN?=
 =?utf-8?B?QnExL05YRlV6RWF0TnRlVFoxa25TWG9iRmlDRkxFaXkySjQvUUxpQnlQbkdq?=
 =?utf-8?B?TExvK1Q5RlY4ckRjemJTbjl0Z0NhRHc3UFpqeldVTDJJWno3dnhhSFNNN3Jj?=
 =?utf-8?B?bGRmNEptc3ZaNm9uOVhJVk1yemd4NitnMDVpWkFyK09taXNPbFpVTFRRSmVO?=
 =?utf-8?B?SkdLU1hkOFVzampXSmZJQkRBdTRvVnRVQ2g5VDk5NTRsVHZiUGUvSFRjUTZh?=
 =?utf-8?B?MFA0QUFxcHpzT0tpSndjZHcrQW5uMnJaT3BhUVI3aWpOUmZBMWJVUFpwcnMv?=
 =?utf-8?B?WjVIWkRGbWYyWjVld3hUeHdnb2VCTnRhM1d2T29DM2pLNGJxVDA5WURFbTA0?=
 =?utf-8?B?dWZyUXpQaVFDQ21abGJHZDRBbDA5YlV4bm10WmJQTVhBdExqUGRCemY3RElV?=
 =?utf-8?B?VkdiU0Rlek1mazBzeml2OW5aWGNJamJFZWM3YzB6QlRrS0s3MGtWS2hqQUJt?=
 =?utf-8?B?VzZDVkEwYkFFVlhnUGo0aWVpR09TdThPcC8xSDJRcE9ZTEkxVERvYWIrN0E5?=
 =?utf-8?B?YkpNZTRacFhhcDZvOWRPYzFvOElRVFlkNEU1ZHRJTHlwN1lsRWc1QmNsdERK?=
 =?utf-8?B?TjkveCtlWUNVMWJCRm0vZ1NmRFh3TUR3TGVvT0ZVZ1UzLzZ5djc0R05aNlh4?=
 =?utf-8?B?YzJuU2JJZnd4VndmY3hWV1VaazRnbGVMS1h6T1pOS3FVajdPUkQzT1BMUnZ2?=
 =?utf-8?B?Y1c3bk5id1l4SGRJTUhzVVhBUkZqV09iWWdMTFA1dUdBME55MkRaU29JMjgv?=
 =?utf-8?B?aFFPTWJvZTRjTkYrLzUweWszaGV0TVdTd0UweUhCd2VtYTBUcU5oZ0t4WnlX?=
 =?utf-8?B?cW1naE01ZlhUSWdKWHNsaURQYk9HV2N3akE5VUhoNFRYY2F4VU9sK0FkZWdn?=
 =?utf-8?B?OTZxVERTRWFLR2swMGhxZmdWOU9GNHlVak56TXBieGNGSEtidXFBQ1EwZ2dm?=
 =?utf-8?B?bFFoWDlaZmtteWpjWlBiVGdLWEdKSFFualh6SlZaS3dQdUcxQzRYRytpUjBC?=
 =?utf-8?B?N2luME10YVpRcjJyT3JiZStKb1hJcjk0cXI2Smp6NU1YdmkvV0dRYlpKNDZ4?=
 =?utf-8?B?NTBUckg5a1p5NW5oUnFIYkVZWk1JK0hVendzOGd4SXJJV2hjS1RpVE05bFRT?=
 =?utf-8?B?VWZYVXVLNUhVZW5jMG5LdEc2cVFBa2gvaC9YcXdiM3pyUHROZlMwejMxT0s4?=
 =?utf-8?B?eCtiQkM5VkZZMnR3Sk5nbnphbkV0Vnd6R2tqdXZIYTFxYU1HYzFZYkp4T1FD?=
 =?utf-8?B?RUlDSjVFWURnTzgxVWRwQWM1bTRnSWNrSVNwZEZRdjk4WkhWZVJOZXNSSW5m?=
 =?utf-8?B?SnM3UElwYkhRMkZLTkdOVlN3aUJreVRWWmdpZ0J6NWhaNnhWNmw2V21FRUsv?=
 =?utf-8?B?MDcvNTk5VnJKRzVjT3JsVDZYR0RHTHpOMXdLbmZvTm8wNUVzTzE5S01xdTNo?=
 =?utf-8?B?MXBrZDRzZ2RLR2w2Q3FYVzFEY0NoUzZYODdYYWQ3ZzJHdnFXUDQyd2lWbDdZ?=
 =?utf-8?B?OUVRaTZpc09PL0VnUERDOFBNVFlQZ20zbFpKZnJYaGlIL2NMZnpORTIxRkd1?=
 =?utf-8?B?dmVkV0pIUUxUcTZsQlV0RHZ0d3RSU3oyREJqREVtUExSTHRFRUFLSStUOXF3?=
 =?utf-8?B?TVJNb2c0cW1FV0xVQVMrNHpkaTNLK3NaNlBIbTg0VzJ5R0tCQXBiWldwdmtt?=
 =?utf-8?B?TkthUnZFYlI2SVZMWHFnRkNUU0I3YlFKa2Z4MVpZTFlOZWNNUzBkUG84OW8w?=
 =?utf-8?B?amlad2ZkVzltRVgrVWJBVDdzNzBCQzltT015SGVPa1cvazYyRHhCbUFRbkd3?=
 =?utf-8?B?eVhJVEFKV3ozMTNLK1pRa0RkNGN6VDdnU3lqbjlVTG9rNjJTNlpZTFh5WThQ?=
 =?utf-8?B?ZFdpR0NmVzRtZjkvWWc4TGQrK1liWGZNWFM2Y0E3b09HdXkzdWdtOTZFZHU5?=
 =?utf-8?B?WktRVnlrQkp0dnh5Y2dZejlxSWQrYjlKNHJQQWx5QW9QQ2dLYWl4OGNHTkJU?=
 =?utf-8?B?Z1FkdS9QUEtUdTllWnlKZEc3Yk5INUcweTNtV0xOUFFWaTdldHRQVnI1TjNT?=
 =?utf-8?B?ZmdEbFEyTmpOcmExblJrLzJoMDdqSWJlUGgwNE4rTWl3K04zbWRaeG9ySEd5?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2caadf0e-aa25-452c-63e6-08de337b9d43
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 21:25:14.9110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEebWoT2RTRX7O5TDVBzrfTRrYJusFd8S/GWUvIKOIj6JJtJ+UTFjOz/xdFb6tPNaObRXBN070SE/rh6WxCHfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7796
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



On 2025-11-27 5:18 p.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/guc: Add LFD format output for guc log (rev8)
> *URL:*	https://patchwork.freedesktop.org/series/146541/ <https:// 
> patchwork.freedesktop.org/series/146541/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/ 
> index.html>
> 
> 
>   CI Bug Log - changes from xe-4158-
>   d858d76d3596e85f00b062a894e38e7fda3d9916_FULL -> xe-pw-146541v8_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-146541v8_FULL absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-146541v8_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-146541v8_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:
>       o shard-lnl: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-lnl-2/
>         igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html>
This incomplete is not related to this patch.

Regards,
Zhanjun Dong
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-146541v8_FULL that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-436/
>         igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (Intel
>         XE#623 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>)
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-0:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-9/igt@kms_big_fb@4-
>         tiled-32bpp-rotate-0.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@kms_big_fb@4-tiled-max-
>         hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#3658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658>)
>   *
> 
>     igt@kms_big_fb@linear-16bpp-rotate-270:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-9/
>         igt@kms_big_fb@linear-16bpp-rotate-270.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-1/igt@kms_big_fb@linear-32bpp-
>         rotate-270.html> (Intel XE#2327 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2327>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-436/
>         igt@kms_big_fb@linear-8bpp-rotate-270.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@y-tiled-32bpp-rotate-270:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@kms_big_fb@y-
>         tiled-32bpp-rotate-270.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-1/igt@kms_big_fb@y-tiled-max-
>         hw-stride-32bpp-rotate-0-hflip-async-flip.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5
>         other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-6/igt@kms_big_fb@y-tiled-max-
>         hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1874 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-435/igt@kms_big_fb@yf-
>         tiled-16bpp-rotate-180.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-5/
>         igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html> -
>          > SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-146541v8/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-
>         displays-2160x1440p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-2/igt@kms_bw@connected-linear-
>         tiling-3-displays-1920x1080p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@kms_bw@connected-linear-
>         tiling-3-displays-1920x1080p.html> (Intel XE#2191 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/igt@kms_bw@linear-tiling-1-
>         displays-1920x1080p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1 other test skip
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-3840x2160p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-436/igt@kms_bw@linear-
>         tiling-1-displays-3840x2160p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-2/igt@kms_ccs@bad-pixel-
>         format-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +4 other
>         tests skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-436/igt@kms_ccs@bad-
>         pixel-format-yf-tiled-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +9
>         other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-8/igt@kms_ccs@bad-
>         rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html> (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +21 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-9/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@kms_ccs@crc-primary-
>         rotation-180-y-tiled-gen12-mc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +3 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-
>     hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-435/igt@kms_ccs@crc-
>         sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>         (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +34 other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/igt@kms_ccs@missing-ccs-
>         buffer-4-tiled-mtl-mc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3
>         other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/igt@kms_ccs@missing-ccs-
>         buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +5
>         other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-2/igt@kms_cdclk@mode-
>         transition.html> (Intel XE#2724 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2724>)
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-b-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@kms_cdclk@mode-
>         transition@pipe-b-edp-1.html> (Intel XE#4417 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4417>) +3 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-0-50:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-1/
>         igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#2325 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>   *
> 
>     igt@kms_chamelium_color@ctm-max:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-9/
>         igt@kms_chamelium_color@ctm-max.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-change-during-suspend:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-436/
>         igt@kms_chamelium_edid@dp-edid-change-during-suspend.html>
>         (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-resolution-list:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-2/igt@kms_chamelium_edid@dp-
>         edid-resolution-list.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +6 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_frames@hdmi-aspect-ratio:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-2/
>         igt@kms_chamelium_frames@hdmi-aspect-ratio.html> (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3
>         other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@kms_chamelium_hpd@vga-
>         hpd-enable-disable-mode.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-2/
>         igt@kms_content_protection@dp-mst-type-1.html> (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-9/
>         igt@kms_content_protection@legacy.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +7 other tests
>         skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-32x32:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-1/igt@kms_cursor_crc@cursor-
>         onscreen-32x32.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +3 other
>         tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-random-32x10:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@kms_cursor_crc@cursor-
>         random-32x10.html> (Intel XE#1424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-9/igt@kms_cursor_crc@cursor-
>         sliding-512x170.html> (Intel XE#308 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-5/
>         igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/
>         shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-
>         legacy.html> (Intel XE#2291 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2291>)
>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-toggle:
> 
>       o shard-adlp: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-adlp-3/
>         igt@kms_cursor_legacy@cursor-vs-flip-toggle.html> (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4173>) +2 other tests dmesg-warn
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-2/
>         igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-
>         varying-size.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-9/
>         igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html> (Intel
>         XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-6/
>         igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/
>         shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-
>         transitions.html> (Intel XE#5299 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5299>)
>   *
> 
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-
>         ioctl.html> (Intel XE#4210 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4210>)
>   *
> 
>     igt@kms_dp_link_training@non-uhbr-mst:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-1/
>         igt@kms_dp_link_training@non-uhbr-mst.html> (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>)
>   *
> 
>     igt@kms_dp_link_training@non-uhbr-sst:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/
>         igt@kms_dp_link_training@non-uhbr-sst.html> (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-formats:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-
>         formats.html> (Intel XE#2244 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2244>)
>   *
> 
>     igt@kms_feature_discovery@dp-mst:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-2/
>         igt@kms_feature_discovery@dp-mst.html> (Intel XE#2375 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2375>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/
>         igt@kms_feature_discovery@dp-mst.html> (Intel XE#1137 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1137>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms-on-nop:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-9/igt@kms_flip@2x-flip-vs-
>         dpms-on-nop.html> (Intel XE#310 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/310>) +1 other test skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:
> 
>       o shard-bmg: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-3/igt@kms_flip@2x-flip-vs-
>         suspend-interruptible@ab-dp2-hdmi-a3.html> (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) +6
>         other tests abort
>   *
> 
>     igt@kms_flip@2x-flip-vs-wf_vblank:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-2/igt@kms_flip@2x-flip-vs-
>         wf_vblank.html> (Intel XE#2316 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2316>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-5/
>         igt@kms_flip@2x-plain-flip-ts-check-interruptible.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-
>         bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html>
>         (Intel XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2316>) +4 other tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@kms_flip@2x-plain-flip-
>         ts-check-interruptible.html> (Intel XE#1421 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +2 other
>         tests skip
>   *
> 
>     igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-2/
>         igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html> -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-
>         bmg-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html> (Intel
>         XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2049> / Intel XE#2597 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2597>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend@d-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-dg2-433/
>         igt@kms_flip@flip-vs-suspend@d-dp4.html> (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2597>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
>     downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/
>         igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
>         downscaling.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1745>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/
>         igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
>         downscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +1 other test
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-1/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>         downscaling@pipe-a-valid-mode.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +2 other
>         tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-3/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         upscaling.html> (Intel XE#2293 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2293> / Intel XE#2380 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +2 other
>         tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-
>     downscaling:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-436/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-
>         downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-9/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/656>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-rte:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/
>         igt@kms_frontbuffer_tracking@drrs-2p-rte.html> (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +5
>         other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html>
>         (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2311>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-
>         blt.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4141>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/
>         igt@kms_frontbuffer_tracking@fbc-tiling-4.html> (Intel XE#1151
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-
>         draw-render.html> (Intel XE#6312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6312>) +1 other test
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-
>         mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/653>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) +10 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +4 other tests skip
>   *
> 
>     igt@kms_joiner@basic-force-ultra-joiner:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-3/igt@kms_joiner@basic-force-
>         ultra-joiner.html> (Intel XE#2934 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2934>) +1 other test
>         skip
>   *
> 
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-436/
>         igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html>
>         (Intel XE#2925 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2925>)
>   *
> 
>     igt@kms_panel_fitting@atomic-fastset:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-2/
>         igt@kms_panel_fitting@atomic-fastset.html> (Intel XE#2486
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486>)
>   *
> 
>     igt@kms_pipe_stress@stress-xrgb8888-yftiled:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-2/igt@kms_pipe_stress@stress-
>         xrgb8888-yftiled.html> (Intel XE#5624 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5624>)
>   *
> 
>     igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@kms_plane_lowres@tiling-
>         x@pipe-b-edp-1.html> (Intel XE#599 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/599>) +3 other tests
>         skip
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-none:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-5/
>         igt@kms_plane_multiple@2x-tiling-none.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-6/
>         igt@kms_plane_multiple@2x-tiling-none.html> (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-
>     factor-0-5@pipe-c:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/
>         igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-
>         factor-0-5@pipe-c.html> (Intel XE#6691 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6691>) +3 other
>         tests skip
>   *
> 
>     igt@kms_pm_backlight@fade-with-dpms:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-1/igt@kms_pm_backlight@fade-
>         with-dpms.html> (Intel XE#870 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_backlight@fade-with-suspend:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-435/
>         igt@kms_pm_backlight@fade-with-suspend.html> (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-5/
>         igt@kms_pm_backlight@fade-with-suspend.html> -> ABORT <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-1/
>         igt@kms_pm_backlight@fade-with-suspend.html> (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) +4
>         other tests abort
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#1129 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1129>)
>   *
> 
>     igt@kms_pm_lpsp@kms-lpsp:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-2/igt@kms_pm_lpsp@kms-
>         lpsp.html> (Intel XE#2499 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2499>)
>   *
> 
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-
>         unset-non-lpsp.html> (Intel XE#1439 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1439> / Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>   *
> 
>     igt@kms_pm_rpm@system-suspend-idle:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-dg2-436/
>         igt@kms_pm_rpm@system-suspend-idle.html> -> ABORT <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-dg2-432/
>         igt@kms_pm_rpm@system-suspend-idle.html> (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>)
>   *
> 
>     igt@kms_pm_rpm@system-suspend-modeset:
> 
>       o shard-dg2-set2: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-436/
>         igt@kms_pm_rpm@system-suspend-modeset.html> (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) +1
>         other test abort
>   *
> 
>     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-
>         primary-update-sf-dmg-area.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2893 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>   *
> 
>     igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-1/igt@kms_psr2_sf@psr2-cursor-
>         plane-move-continuous-exceed-sf.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) +3 other tests skip
>   *
> 
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-435/igt@kms_psr2_sf@psr2-
>         overlay-plane-move-continuous-exceed-sf.html> (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>)
>   *
> 
>     igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/igt@kms_psr2_sf@psr2-
>         overlay-plane-update-sf-dmg-area.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) +3 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-render:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@kms_psr@fbc-psr2-
>         primary-render.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +1 other test
>         skip
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-render@edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@kms_psr@fbc-psr2-
>         primary-render@edp-1.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#4609 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609>)
>   *
> 
>     igt@kms_psr@psr-basic:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-436/igt@kms_psr@psr-
>         basic.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1406> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2
>         other tests skip
>   *
> 
>     igt@kms_psr@psr-cursor-plane-move:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/igt@kms_psr@psr-cursor-
>         plane-move.html> (Intel XE#1406 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1406> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +4
>         other tests skip
>   *
> 
>     igt@kms_psr@psr2-no-drrs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-2/igt@kms_psr@psr2-no-
>         drrs.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1406> / Intel XE#2234 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850>) +4 other tests skip
>   *
> 
>     igt@kms_rotation_crc@bad-pixel-format:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/igt@kms_rotation_crc@bad-
>         pixel-format.html> (Intel XE#3414 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-1/
>         igt@kms_rotation_crc@primary-rotation-270.html> (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3904>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-2/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel
>         XE#2330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330>)
>   *
> 
>     igt@kms_scaling_modes@scaling-mode-full:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-1/
>         igt@kms_scaling_modes@scaling-mode-full.html> (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>)
>   *
> 
>     igt@kms_setmode@basic:
> 
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-2/igt@kms_setmode@basic.html>
>         (Intel XE#6361 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6361>) +2 other tests fail
>   *
> 
>     igt@kms_sharpness_filter@filter-formats:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-3/
>         igt@kms_sharpness_filter@filter-formats.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-
>         lnl-4/igt@kms_sharpness_filter@filter-formats.html> (Intel
>         XE#4537 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537>)
>   *
> 
>     igt@kms_sharpness_filter@filter-scaler-downscale:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-2/
>         igt@kms_sharpness_filter@filter-scaler-downscale.html> (Intel
>         XE#6503 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6503>) +1 other test skip
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/
>         igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>   *
> 
>     igt@kms_vrr@max-min:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-5/
>         igt@kms_vrr@max-min.html> -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-lnl-1/igt@kms_vrr@max-
>         min.html> (Intel XE#4227 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4227>) +1 other test fail
>   *
> 
>     igt@xe_ccs@block-copy-compressed:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-2/igt@xe_ccs@block-copy-
>         compressed.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455> / Intel XE#488 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/488> / Intel XE#5607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607>)
>   *
> 
>     igt@xe_compute@ccs-mode-basic:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-9/igt@xe_compute@ccs-mode-
>         basic.html> (Intel XE#6599 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/6599>)
>   *
> 
>     igt@xe_compute@ccs-mode-compute-kernel:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-1/igt@xe_compute@ccs-mode-
>         compute-kernel.html> (Intel XE#6599 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6599>)
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0x3fff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-436/
>         igt@xe_copy_basic@mem-copy-linear-0x3fff.html> (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>   *
> 
>     igt@xe_copy_basic@mem-matrix-copy-2x2:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-9/igt@xe_copy_basic@mem-
>         matrix-copy-2x2.html> (Intel XE#5300 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5300>)
>   *
> 
>     igt@xe_create@create-big-vram:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/igt@xe_create@create-big-
>         vram.html> (Intel XE#1062 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1062>)
>   *
> 
>     igt@xe_eu_stall@non-blocking-re-enable:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-9/igt@xe_eu_stall@non-
>         blocking-re-enable.html> (Intel XE#5626 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5626>)
>   *
> 
>     igt@xe_eudebug@basic-vm-access-faultable:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-2/igt@xe_eudebug@basic-vm-
>         access-faultable.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +4 other
>         tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@xe_eudebug@basic-vm-
>         access-faultable.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +2 other
>         tests skip
>   *
> 
>     igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-436/
>         igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html>
>         (Intel XE#4837 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4837>)
>   *
> 
>     igt@xe_eudebug_online@stopped-thread:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-9/
>         igt@xe_eudebug_online@stopped-thread.html> (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837> /
>         Intel XE#5565 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5565>) +4 other tests skip
>   *
> 
>     igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/igt@xe_evict@evict-beng-cm-
>         threads-large-multi-vm.html> (Intel XE#261 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/261>)
>   *
> 
>     igt@xe_evict@evict-large-external:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@xe_evict@evict-large-
>         external.html> (Intel XE#688 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/688>) +2 other tests skip
>   *
> 
>     igt@xe_evict@evict-small-cm:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-9/igt@xe_evict@evict-small-
>         cm.html> (Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/261> / Intel XE#5564 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5564> / Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1
>         other test skip
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-9/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-userptr.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392> / Intel
>         XE#5575 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575>)
>   *
> 
>     igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@xe_exec_basic@multigpu-
>         once-basic-defer-mmap.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1 other test
>         skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-1/igt@xe_exec_basic@multigpu-
>         once-bindexecqueue-userptr-invalidate.html> (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +3
>         other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-435/
>         igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-
>         imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/288>) +5 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-userptr-invalidate-race:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-9/
>         igt@xe_exec_fault_mode@many-userptr-invalidate-race.html> (Intel
>         XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288> / Intel XE#5561 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5561>) +8 other tests skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-2/igt@xe_exec_mix_modes@exec-
>         simple-batch-store-lr.html> (Intel XE#2360 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>   *
> 
>     igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
> 
>       o shard-adlp: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-adlp-3/
>         igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-
>         threads.html> (Intel XE#6299 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6299>)
>   *
> 
>     igt@xe_exec_system_allocator@fault-threads-same-page-benchmark:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-436/
>         igt@xe_exec_system_allocator@fault-threads-same-page-
>         benchmark.html> (Intel XE#4915 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4915>) +63 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-
>     free-race-nomemset:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/
>         igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-
>         free-race-nomemset.html> (Intel XE#4915 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4915>) +118 other
>         tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-
>     new-huge:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-1/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-
>         mmap-new-huge.html> (Intel XE#4943 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +10 other
>         tests skip
>   *
> 
>     igt@xe_exec_system_allocator@twice-mmap-new-huge:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/
>         igt@xe_exec_system_allocator@twice-mmap-new-huge.html> (Intel
>         XE#4943 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4943>) +2 other tests skip
>   *
> 
>     igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/
>         igt@xe_fault_injection@exec-queue-create-fail-
>         xe_pxp_exec_queue_add.html> (Intel XE#6281 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6281>)
>   *
> 
>     igt@xe_gt_freq@freq_suspend:
> 
>       o shard-adlp: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-6/
>         igt@xe_gt_freq@freq_suspend.html> (Intel XE#6675 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) +1 other test
>         abort
>   *
> 
>     igt@xe_module_load@load:
> 
>       o shard-lnl: (PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-1/
>         igt@xe_module_load@load.html>) -> (SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-7/
>         igt@xe_module_load@load.html>) (Intel XE#378 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>       o shard-bmg: (PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-4158-
>         d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-5/
>         igt@xe_module_load@load.html>) -> (PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-5/
>         igt@xe_module_load@load.html>, SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-5/
>         igt@xe_module_load@load.html>) (Intel XE#2457 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2457>)
>   *
> 
>     igt@xe_oa@map-oa-buffer:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-6/igt@xe_oa@map-oa-
>         buffer.html> (Intel XE#3573 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3573>) +1 other test skip
>   *
> 
>     igt@xe_oa@unprivileged-single-ctx-counters:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-435/
>         igt@xe_oa@unprivileged-single-ctx-counters.html> (Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>)
>   *
> 
>     igt@xe_peer2peer@write:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-2/igt@xe_peer2peer@write.html>
>         (Intel XE#2427 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2427>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@xe_peer2peer@write.html>
>         (Intel XE#1061 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1061>)
>   *
> 
>     igt@xe_pm@d3cold-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-3/igt@xe_pm@d3cold-basic.html>
>         (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2284>) +1 other test skip
>   *
> 
>     igt@xe_pm@s2idle-basic-exec:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-adlp-8/
>         igt@xe_pm@s2idle-basic-exec.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-adlp-1/
>         igt@xe_pm@s2idle-basic-exec.html> (Intel XE#6675 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) +5 other
>         tests abort
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-prefetch:
> 
>       o shard-lnl: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@xe_pm@s2idle-vm-bind-
>         prefetch.html> (Intel XE#6675 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6675>)
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-userptr:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-2/
>         igt@xe_pm@s2idle-vm-bind-userptr.html> -> ABORT <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-bmg-5/
>         igt@xe_pm@s2idle-vm-bind-userptr.html> (Intel XE#6675 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6675>)
>   *
> 
>     igt@xe_pmu@engine-activity-accuracy-90@engine-
>     drm_xe_engine_class_video_decode0:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-7/
>         igt@xe_pmu@engine-activity-accuracy-90@engine-
>         drm_xe_engine_class_video_decode0.html> -> FAIL <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-lnl-3/
>         igt@xe_pmu@engine-activity-accuracy-90@engine-
>         drm_xe_engine_class_video_decode0.html> (Intel XE#6251 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) +2 other
>         tests fail
>   *
> 
>     igt@xe_pxp@display-black-pxp-fb:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-146541v8/shard-dg2-435/igt@xe_pxp@display-
>         black-pxp-fb.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>   *
> 
>     igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/igt@xe_pxp@pxp-stale-bo-
>         bind-post-rpm.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733> / Intel
>         XE#5594 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-extension:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-2/igt@xe_query@multigpu-query-
>         invalid-extension.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
>   *
> 
>     igt@xe_sriov_flr@flr-twice:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-lnl-8/igt@xe_sriov_flr@flr-
>         twice.html> (Intel XE#4273 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4273>)
>   *
> 
>     igt@xe_vm@out-of-memory:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-adlp-3/igt@xe_vm@out-of-
>         memory.html> (Intel XE#5745 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5745>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-
>         dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2705> / Intel XE#4212 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4212> / Intel XE#4345 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4345>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-
>         dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-
>         dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-
>         dp-4.html> (Intel XE#2705 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2705> / Intel XE#4212 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4212>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-
>         dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-
>         dp-4.html>
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-6/
>         igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html>
>         (Intel XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-146541v8/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-
>         flipb-atomic-transitions.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-2/
>         igt@kms_flip@2x-flip-vs-dpms.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-
>         bmg-3/igt@kms_flip@2x-flip-vs-dpms.html> +2 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-5/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-146541v8/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible@b-edp1.html> +2 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-suspend@c-dp4:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-
>         dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html> (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2597>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-146541v8/shard-dg2-433/igt@kms_flip@flip-vs-suspend@c-
>         dp4.html>
>   *
> 
>     igt@kms_hdr@bpc-switch-dpms:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-5/
>         igt@kms_hdr@bpc-switch-dpms.html> (Intel XE#6662 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6662>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-
>         bmg-2/igt@kms_hdr@bpc-switch-dpms.html> +1 other test pass
>   *
> 
>     igt@kms_joiner@basic-force-big-joiner:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-6/
>         igt@kms_joiner@basic-force-big-joiner.html> (Intel XE#3012
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/
>         shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html>
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-adlp-3/
>         igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html>
>         (Intel XE#6675 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6675>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-146541v8/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-
>         read-crc@pipe-a-hdmi-a-1.html> +4 other tests pass
>   *
> 
>     igt@kms_vrr@negative-basic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-6/
>         igt@kms_vrr@negative-basic.html> (Intel XE#1499 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-
>         bmg-4/igt@kms_vrr@negative-basic.html>
>   *
> 
>     igt@xe_exec_reset@cm-close-fd:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-
>         adlp-3/igt@xe_exec_reset@cm-close-fd.html> (Intel XE#3868
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/
>         shard-adlp-9/igt@xe_exec_reset@cm-close-fd.html>
>   *
> 
>     igt@xe_gt_freq@freq_suspend:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-
>         dg2-464/igt@xe_gt_freq@freq_suspend.html> (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/
>         shard-dg2-436/igt@xe_gt_freq@freq_suspend.html>
>   *
> 
>     igt@xe_pm@s3-exec-after:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-3/
>         igt@xe_pm@s3-exec-after.html> (Intel XE#6675 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-
>         bmg-1/igt@xe_pm@s3-exec-after.html> +1 other test pass
>   *
> 
>     igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-7/
>         igt@xe_pmu@engine-activity-accuracy-90@engine-
>         drm_xe_engine_class_copy0.html> (Intel XE#6251 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v8/shard-
>         lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-
>         drm_xe_engine_class_copy0.html>
>   *
> 
>     igt@xe_pxp@pxp-termination-key-update-post-suspend:
> 
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-lnl-8/
>         igt@xe_pxp@pxp-termination-key-update-post-suspend.html> (Intel
>         XE#6675 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6675>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-146541v8/shard-lnl-8/igt@xe_pxp@pxp-termination-key-
>         update-post-suspend.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-
>         blt.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4141>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-
>         blt.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4141>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>) +10 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-146541v8/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) +6 other tests skip
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916 -> xe-
>     pw-146541v8
> 
> IGT_8642: fa854cbfe25f3d64ad02bfd3f7804b5d7ccda71d @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916: 
> d858d76d3596e85f00b062a894e38e7fda3d9916
> xe-pw-146541v8: 146541v8
> 

