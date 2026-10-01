Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2952CA5FCE
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 10:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A5E10F623;
	Thu,  1 Oct 2026 10:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEhBqpTW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B998310F60E
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 10:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790850470; x=1822386470;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3ouR/TlQxa8GPEfiDuaanL12hMVAz+D5eCUK4jp7oUU=;
 b=bEhBqpTWTKEK+ITaT2qU1bBu1msJcMOUXzObXIHO0GbGsx62sbKSOGNj
 JcwDBeRS4s5bu4qbqO4VuM0j+oCA4y5YBYiomncZ4W1zI3tcEeujN7YHk
 KYh3w7Yz25VxwpFMdobs4zrVwJoRAcqUZO3H4ODvB2cMUmjLYA2n0rtIU
 e690QKQaOOyQPds+LQ+ef5ajAuQD9TFbKpqbhVFS4P9h8/KWwKY+Jv3mo
 ubFVEuDLD/2VU6qdEdxUPyT52nQOn7Wsy+thscNgzuaIqQk5zeE0Gjp2L
 LUU0iTknOBIyihFSjtr2lRKySimbE4w4GGlTP9NRRrtObGZob9CO0IkNb A==;
X-CSE-ConnectionGUID: FKR7jMiDQoWeE8CMsbkzdA==
X-CSE-MsgGUID: 23FXyCDXQ4Kug61XyszCkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91619519"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91619519"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 03:27:50 -0700
X-CSE-ConnectionGUID: fwjlNCptQcuQz/bak070sA==
X-CSE-MsgGUID: FcxDyNxKQ8eBACmgxn2b5A==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 03:27:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 03:27:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 03:27:48 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 03:27:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbgQFFay7FbBju3QpRI30ZVS1RONEAu2UJyisXz+p4PyqKzpDGcoFqUf+GrSCbA4/rmXDdADVFiD8pIDX31GPARAUGClOhYcZuKiqkZLFPUd7zlkkAITuXPqUYXvFLkWe2f3NfvD+Q0hMNXDfNHd+NdoTUstAnYcArJ3DE2/9/3xixPbiiHVPlvDBdIch7rgYjOxQWUQFSVZGZgwu1QLMpd9+5v4+awE7fdXWyIJnZ5Hwrg120nGUNwZbDQLXZtT4beO9GvHnRkRcJFDydbSFjG1Wmbj9VRkvarEPfyaZoa1jUgd94PQiZw/Pl5PqkFqco8l0GtvsOUsxJwKk7qxrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1H+Zv3/mc3mcoln5C/o+BmyDlgNsRIXnlaIzMILd2hw=;
 b=BYgensg4qRMQY+KyhEzwhMud8jFhS04r2TfBPU9+HqtzwUzKfZ8Q3uVe9alXc7NmB/WX5qGiJNk/1KPIk+mQzxOfX84pmQc9/cQF5lGliMMYyLINFsXmLVDI4wIdARXu/MeWSSOwrlny19xycq+LQvcYhsXYRiHMsqEsxgCmnxMNn9jNwI5zdE1a1kH2CSAgwvWTtkngGeHKso9Vvy2UpO9M8xAofQZ2p6aXEUtFg+Mc6xYCp+s2h/qpeEyeKvkP6qycsEyxL0f6TkuXZY0ZnNRKW+MZT34XHIKog4zSpYYzneYS1I8+NdS744YJkog7QO+DpA0KBVS9byrDdNZFpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DM4PR11MB6480.namprd11.prod.outlook.com
 (2603:10b6:8:8d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 10:27:46 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 10:27:45 +0000
Message-ID: <b85c6c08-7915-48a9-86b9-afcbd67e0f31@intel.com>
Date: Thu, 1 Oct 2026 15:57:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe: Keep VRAM fault injection within the usable
 range
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>
References: <20261001094518.1493651-6-tejas.upadhyay@intel.com>
 <20261001094518.1493651-10-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261001094518.1493651-10-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::11) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DM4PR11MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: fb16db73-b74b-4eb8-0b24-08df1fa6a207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: k5j//jA4ALsz+EHBaugQLANWwSwYt3Bz2AHYNlPrqBsZG5Zy6C7qRoLKZqMPFPPcbcEJ41coGD6HdWsnnzbB2nzUwFzO4pTq2ecXnz6rwe5Gpij6Ix2s8xnzn/288CdxdHGSRFMgQFDmVd/9qKoSMkHAEVuYNSllFBvTpJh7383KnY29gvPpGGIHO1/2Q/tbausq88MkRQWAd8bdCk0A+tLFqR8kkFgTSLwiOgJclVeXO1pmytSnHZ1hBovKg3hDf6XaH+y+FbECKIEcdiQajKaf5x+DZuWdXBz3WDfDnqCCcqTVLM8bjt7zvcUufAaLBdNTaGALtrtTceekQkna8TUNOS9DNMOUQ9Qip9sMk7+s4eWiuWkL1hJEhqyDPbewJetNbacSToCNQpxdCEVN6iJ8AOEXmtcFBokoHdtzKYJjjjSqS7E8oz5YkykyJGdtfdJO1kbCYaLPF2aLrcvOVgq8IhA6eD+EyNjiH2U3Y0/i+BUJXc+GR0YpgIInwU6zik1qFrV3W3thK4+EVb6wi8fpXPMLW27vx5pGJml1NXhm3UxI/HBvo/vlpFbaC8kIAakA0kOrY8hKfbE78U9I18UR4RDKoJilEEDdNUy+ebwW5owsoVxI7AT++xvhlgj5SNSpQmLf04f7hKQpc2cW8njJlxwmIBk3HSRoWg+2dOo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmRPcDNkVmxNTmxtRE1KUkRrdTB3RjhUMEMxRkRXZ21QSmUycmp0V1ZLWnM1?=
 =?utf-8?B?Nys4djA4U2ZJcjZ5UnVYdTFaL0dZWm5YakpEOG5qTTFTNnB2cUpPTjFqTXlL?=
 =?utf-8?B?RkNhZkFKcXl3QU1hY2pQUmkzR2VZalNOOGE4Y0xGMWp6OFFwNjBrVStwUTV1?=
 =?utf-8?B?Y2lLSHB1SXRhQlNQUlBiczkzOWR5TVhibTIwOW1WUGwyUlhlcVZVdVlZU0g5?=
 =?utf-8?B?UUNaUGZVWlJvTjB1K2srSFJud3J3ZklmKzRoNkQxNGpPYkM3RHhPMjZDSFli?=
 =?utf-8?B?MG1YcUFNNFJsZWJMOVA3R3grbkw5UWExVWgzRC9oR0IwdDZDTU4zZ0FYQzN2?=
 =?utf-8?B?eFBxazNCaE1JUWJjVTJpN0FBTWtpTk1vMjlBY2Jub0Q3SjdEdGVRd3M0a3kz?=
 =?utf-8?B?c2JtclIzeHpxVDVOYmxpRzlRd0dJZlNMMWFzUlpDMktvV29jdnlINk1UOHRr?=
 =?utf-8?B?NC8wUVV3WUFmK0FIRlRlUU9xRW4wNFF2RVhRT3g3dFZjczh6djE5Rmh1WUdQ?=
 =?utf-8?B?Y0tFZEdaZlNNRi9TRExTM1NTUVVMYmZ6QVRJVE9MTm5OUk9rRFlOcUF0ci8v?=
 =?utf-8?B?dWZUeDd5bUtQUHhGR3RiRXRDTkIvcXRhT1Y0ZjdrMFByanVYVnEyb0RpVXpr?=
 =?utf-8?B?L292RWZJVG1HNW9ZRjBIcHkxQjIvRWlzQUxTNFJQM2ZlS3owVGVYWlVGK2Na?=
 =?utf-8?B?b2JPYTQvRVdza1VLQ0Z5bzJPeEpmcWR0YlRQektvRW9BcVdnSmpnSzU2TG1m?=
 =?utf-8?B?dnlad1d4cVVLeHl1TmYvbC91Y0RUeGVDM29Va3FQSUs0OUtpdUNMVjlkUUgv?=
 =?utf-8?B?VjFHL3lvbm8yWWhneVVBOXM1aU1COFpDTEd1R01jUysySDRRTWpPeVp0OXF5?=
 =?utf-8?B?bHI5bHJuUHd3Rnd4dTcwV3pyWGQ1dVE0a1g1b3JJN2VNUXlLSFNLa1h5bE83?=
 =?utf-8?B?T1Z6YzhOcXhzbkFHcmx6NDNPNThuYlJ0ZWg1L240emZvdlo5ejBQZzR6VnVV?=
 =?utf-8?B?TVplK0JMajRscStjdzhuUjR3NmVlRURTQ3pINEhJZzFJaGZDN0xZYzI4TTBN?=
 =?utf-8?B?aVpZOExTK1Nack0vcnM4cVZlM0lyR2g4UlpiN0RhNTNrUElkMWcyL1lGS3Vq?=
 =?utf-8?B?TnI5S2RPQkRmVkxZZFRTUFRqUzV0ckJjTUhUdlJTMzdlZnhKdVVlMFgrQ0tu?=
 =?utf-8?B?cVZEY2FDS1d3MlpHMmlXSEU4TlhHL1ZDNHJZSUxxOWdLVjlnTUpIZmxTNkF5?=
 =?utf-8?B?dlp4ekE2SFk3Z21kM1VYT21sbVV3amRRSjEzenMwdE02cjBTa3J3UHh0TVA2?=
 =?utf-8?B?SEhRVXRyYWlSUGRja2svaDlhT2E1b2RiNXZ4V1NSRWc2ZEQ3VlZWUWhVK3gx?=
 =?utf-8?B?WXZ6WmFiT2o1cmlKNmxsZkh1MjJTbGlZWjYyT1dzdWtvb0VGRXVGdk5GVWlI?=
 =?utf-8?B?UFVsQk01ZzhneEF1dVFLY04xR1FKUjJKYUtaZnRYWGlRam42RnpxQkJhUGVw?=
 =?utf-8?B?Q3FqL3dXTHMvVjMzaVgrYndwNjBMY3NnUmFIcHdzbVVSUm1YbnNvQjN0NWp0?=
 =?utf-8?B?bmlDdFllODNiMVVPTVRuTUVVeUdjYVdQUlNPZzVpQ3R2ZkVzbTN0cXdtZlJU?=
 =?utf-8?B?L3prbkt2VDNGM2NzemxSa01NdzdjYUg0ekc5QitKaER1ajRLU09aWXltdG1J?=
 =?utf-8?B?QnZpMEtkd0hOUVQxR3Q0VTZQZFRsTThHQjFLb3F3elFBbmxWT3NKT2JBTVFL?=
 =?utf-8?B?TlF6ZTYyZG5QMzlHTUVJTGlkdlA2KzBGdnhydElpemVPUU53aWpvcEM2ajMr?=
 =?utf-8?B?MldwK250VDRJUWlwZ0hHVGtoTGF4TzlTT2Z5enM1VmhjMitoZW9DanJINUZv?=
 =?utf-8?B?R2xPNFFuNHJZV1o1TlloN3U5a1IrVHdoTU1hTytUdHl3WGIrRm9OMWl5eG0y?=
 =?utf-8?B?N1dDUG1CV1c5T1hoMndra3BKVGpCUW1aalQ2L3k3aUQzREZhaVhyaVczWkZp?=
 =?utf-8?B?MjUzQ0lucU9mYXFjSkxiMk0rRGhuc1NlZFB4clJGbVkzN3F0cmRmOWUzbUMw?=
 =?utf-8?B?N1FCaVlheDN6QjI0UXhmNmYyTE15dnJyNEt5cU1uOXF3UE1xcGZOQU04b3Zx?=
 =?utf-8?B?UTBETDlsczRQSWg3alQ2ek5kemU4T1NJWE85alpDSm5MRG1tRzhWWEZqRzFo?=
 =?utf-8?B?MTkrc0djU09kTXN1dDRzN3p5bzlOcVNUT05FS1h2WE9sR0FIRlNhOGZJNnlN?=
 =?utf-8?B?RlU2NUJHVFhMVHNRazdvZTJKYVBOZTFTQlpQRm12VzdNeEJmL1JnSU9RUFhx?=
 =?utf-8?B?RktYdEo3RnlpNklJaEVCQUxQb1BhRnh2R3FoVXJ6aG14dXE1K2hqL1lqZ0pU?=
 =?utf-8?Q?yx2RPOUiVPXQdO34=3D?=
X-Exchange-RoutingPolicyChecked: W8un1anJsKNuV6X9dwswjCAh5c0wmBHQeTnMv8+MWkfEHYK1TfcEcaMF9SmipOQdCjs0MTb577OKu7j7E9uiZ/XDhzuWaWPFR63xU6KGe/Lrwa8aZXy5za34JntOHSo0V9AzmsXm2cozutjlKCrLbj+aw5qjCOjGc1ITTj6GUgB7aqFaALbpk8509WxdRp1ET07fXtc6BX/Fo6JSLTcTwpsuBFr7PIs1IJkr+TiAbNIY1KF1RUSLf/IGf4CuChYDQlc5TyqkCgk/v3A/pUXAIja3M0vRkVa2bnvO626IZspnewpN5ezAQtl4V3zNJ5B0CM3crq/5H5BrzOxxUkytCg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fb16db73-b74b-4eb8-0b24-08df1fa6a207
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 10:27:45.6568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7i5UklGrdAUApZJwkDHRegY//G1bVhb3AIOYxMDDQ8Ax7CQgVNZ6FWpO2ZOZDfWoSL3/rrlBX68unc/GLoTQ6mflKDssRHqI+zGKP8jg3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6480
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



On 01-10-2026 15:15, Tejas Upadhyay wrote:
> xe_ttm_vram_inject_fault() picked its starting address from
> vr->actual_physical_size, which includes the CCS/GSM/DSM infrastructure
> zone beyond vr->usable_size. The buddy allocator (vram_mgr->mm) only
> manages usable_size, so the first probed address can land in that
> infra zone; xe_ttm_vram_addr_to_region() then returns NULL for it and
> xe_ttm_vram_handle_addr_fault() requests an SBR instead of exercising
> page offlining.
> 
> Start the probe at usable_size - PAGE_SIZE and stay within
> usable_size so the injected fault always lands on real, buddy-managed
> VRAM.
> 
> Fixes: 6ef3eb10aea4 ("drm/xe: Add fault-inject based VRAM page offline injection")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 7211ab5f66e9..ec15eab1a2ed 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -988,11 +988,12 @@ int xe_ttm_vram_inject_fault(struct xe_device *xe)
>   	struct gpu_buddy *mm = &vram_mgr->mm;
>   	u64 addr;
>   
> -	if (vr->actual_physical_size < PAGE_SIZE)
> +	/* Stay within the buddy-managed range; CCS/GSM/DSM sit beyond usable_size */
> +	if (vr->usable_size < PAGE_SIZE)
>   		return -ENOSPC;
>   
> -	addr = vr->actual_physical_size - PAGE_SIZE;
> -	while (addr < vr->actual_physical_size) {
> +	addr = vr->usable_size - PAGE_SIZE;

Nit: align addr to PAGE_SIZE

With Nit addressed
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> +	while (addr < vr->usable_size) {
>   		struct gpu_buddy_block *block;
>   		bool found = false;
>   

