Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8345CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 06:12:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCF810E78C;
	Thu,  2 Oct 2025 06:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cHOqiCwB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CAF10E78C
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 06:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759385551; x=1790921551;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7gOpoWkcnjhF9DvPz/oMkZOLgW2JSS5hknLLqzy4Ofs=;
 b=cHOqiCwBJCeg/At5ayFp2H6sY47VfhByBIjPW/AxRHG+68rF4au0FdmE
 pO8OA7GyTBjA+JULlmNbS77GIfnQydnD/diY6q4HKhdq+4ifl6aYBsL1u
 wqOazX5DqYiH9Z/CY5PetLlektZxM0hgFXanRicEfHo92ibPJ2UgeX8n+
 id21U5Exhxn8YlMgyB4V6vpYN88JUfPLLenwPLPdQgbEhS2nlB7I1F3l4
 rPUpuxrcVbYfmPuv4m7r7LF8KaAq/g00yR33PaBxtaSN4iXiSL7+0N3+z
 S19Iv6Znaihky1uGUUhHqpmla0RhZQIb8PyXgafKANoffGj8EWG5ho5Hs A==;
X-CSE-ConnectionGUID: t/iKwbdARfuGNFJ8tharFQ==
X-CSE-MsgGUID: bQz+gvcuT/6K6JP025+BxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61831275"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="61831275"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 23:12:31 -0700
X-CSE-ConnectionGUID: f6stEc7jR/eTzVaXxcqnZA==
X-CSE-MsgGUID: HILOrfRrSsiLe8vqpuyGxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="178926626"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 23:12:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 23:12:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 23:12:29 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 23:12:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UaTdXEwsAiT9PYTIyiJIQDv2gXzeEmQtSJcRqbZLsMOo3Hj4uc0FQ6dyAg3+bBTvp7RhdCeWVCyHF0Mx35btoHpErsWcLK1uUmz5Ji1WUL9sxoH5GCIHs8bE1/KCUhd3kS33WpJggv3zhQQwIbB0IIy2ZiHIqd32SeH7lLQEMF/qTyN/LnRmRSSiRUpBYCHSBz6wMDVZUpNKzmYXVLGs8hmy+i13R+yTv4esMcThT3AALSWcHXnPorAsnjncjf+4ZzdS4rLZyrOhxHWx12aKveLD++1GR/ncS5lg6DG27vzinql9CqCZrmPjjS4B/P+/i7Fxa+rjP7uroEIXBV6Ljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KttnJg66ehhVlgCDYvsIbrUUARHRL6XH5V+WQBQiNYU=;
 b=mguDPk9AFeEmp9/Tbn0FGy4kn8knz/Hc+c8s0EBBcr0KDQK8XUZz0q/eIDCZxO84TfhIlBGrNTcgr6SXx5o4OJ3s1a2IMstpul+KfclhbPBGkAMLxlmfX9j2FD6SiYXql8+voEo+E5V5zYKrCPkibGGxczRvkVko0lMGEUsPpGv3AF+4rqwSoUdqBx4oKhhnHKAUsREHkiBJqxAguCUov3WwHNVbZOOpjeXu6DF2ZnDPjcdQ4u+Jl9Yjb+BpLiJib4DnDVwP9HawpyHYIVAqSwAkOOp8RCShRF+w9q8jAydmEtnhrP7c946QXI6iX6uo7nG2B5ANze2kNDuQVPv29w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4888.namprd11.prod.outlook.com (2603:10b6:510:32::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.19; Thu, 2 Oct
 2025 06:12:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 06:12:22 +0000
Date: Wed, 1 Oct 2025 23:12:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 31/36] drm/xe/vf: Workaround for race condition in GuC
 firmware during VF pause
Message-ID: <aN4Xw5RZVudez6kL@lstrano-desk.jf.intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-32-matthew.brost@intel.com>
 <bf310366-1824-4edc-89c9-817914ce4331@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf310366-1824-4edc-89c9-817914ce4331@intel.com>
X-ClientProxiedBy: MW4PR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:303:16d::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4888:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b534e95-4632-47ef-8d95-08de017aa63f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFRtNmhPTkhDYlY0elgyUFY0UFNaNVZYeXVkekpnMEN1QytQWS9JWlVQSWtF?=
 =?utf-8?B?ZUY5SnowR0NldWxwYjg0bjBNbXdlcGFmaXBsSWFKOG1vc0YvRnN6UUp0UUI4?=
 =?utf-8?B?bjVzZDZnZGdGMjJFMmFvc3ppN0xpWmxXenJaelpQOFFoNDRGYkJxZEZiZVpR?=
 =?utf-8?B?aDBjTjFQQStmeWpJUWhSZnRGRWN4WUJPV0lXSStud0RGUUFLZ1l4Vkd4cisv?=
 =?utf-8?B?Z2x0SXN6NzNXZXBzellDbWp1SU9OcFBLWlRYRHlKL1BPelgyTWhabEdtandG?=
 =?utf-8?B?MHJDMkpJTllBQVllUWxZTElnZjJnNXdMOXlzRFhKOGM2bE5HL1hvRGkzMEFa?=
 =?utf-8?B?RlRFVVdWVjJVTnJ4THNWSUgwTkllY004VEVOcjdqbnN3V3ZwRG1sbTZkaFox?=
 =?utf-8?B?TFA2aStRUUlnTGsxTlJsNTFqUTB0YkVnYTBFTEV1bjJDWUlNQ29JMFpaamVK?=
 =?utf-8?B?Z2tRUTJwUnkyZytTYUJCNmovRGdqY2ZPRVBUK2hmbXg2OTZIQmoraCtBblRJ?=
 =?utf-8?B?YkZHYlpBY0ZGMnBGRXVXaTVhaXZnelNOdGhObjF2Q0RidUdwVmdDb0U2VGRB?=
 =?utf-8?B?R1Jvc25hR21yNHNCbDJhWDhJalhxU1VlZ1JPUmNuaDFDemRoOW54QXh1ZXpD?=
 =?utf-8?B?VWR1NVd2cmc4cTNOTThaTmRncVdBQU9zRW9rS1RmUGU2cTJkZVR4Vk5GUEtq?=
 =?utf-8?B?MktlRzdmZnJNaGFEVWthT0Ira0tEcUg1RG0wYktPUHVLcm9qL3l2Q1FJT2R6?=
 =?utf-8?B?NEtIeDdSRFBpWHpSTWZOd2dYWGpMRjJuOXNrME9TYWQxUnZhemFDZHI4MHBW?=
 =?utf-8?B?TjM3UEFwazZpWEJRTWFuQ3FHY1JuWHhaenUvemkxUFBxNmdDTldpTUZHbVM5?=
 =?utf-8?B?ZUhGWHlJUmtWc2lIOXBGbU5way9PSFp5enJqaUljdHpyaGttVzBaeVJPWkJp?=
 =?utf-8?B?S2p3RjhkS012K0o3VXUwSVo1R3UvcHMyUW01Tm5SaWFiOXVWb295Si9mOU5I?=
 =?utf-8?B?cCtvZEd4MDNXVDlZZldYalNrbG9nMU1CalRCTldlQlp3TzQ0REdDcEZnbDZ6?=
 =?utf-8?B?VWNISDhKb3VOUzZSOE1FUUxLbzMxQWZzS0N2K0d5ZHdXN0VvcC9TZHY4cnFX?=
 =?utf-8?B?NFkwcXN6eXhDdU1wb3VLaFhEL2dTQ1ZkQ0xDTjBmZmZReUQvUUV5WXNHdkdE?=
 =?utf-8?B?ZUxxdmQxTnNCVVQ3YnY3bGFMZXROT1Rhc3BINkNaa3p2dDcvT2FKRkMxUUlX?=
 =?utf-8?B?ZStNWVVBUU1RR0NmVUQwQURjODRFbFhidld6WC84ekgzQ3MxRHZZT0MxaDdR?=
 =?utf-8?B?UU1MVHZ1M044ZzlNeDdzd3pvVlFjN1Fic0laeWNwSE9zNGFpTFh4UDFWODU2?=
 =?utf-8?B?ck8xaWE2cHdwZUJqVG9XaVNrOEFaTjJGa0p0WjYzQ3NJQUpxMkpJNHJXdXVk?=
 =?utf-8?B?M0JIblh4eWpnZ0pvMXZ6L3pSKy9UY2Z0dW90amRyQXBUbkowUFM5ZG5wMWRr?=
 =?utf-8?B?WVcyRTFGajN0OXZKRkNjL1JuSlh2RWwyNlJuTnA1cHhSR2RpUzBheVRxdlpR?=
 =?utf-8?B?VUIzYzBmZDVLengxVTdjNlpOcVNyWkxKbUlJMm1EWUFqNmJsaStTVDBlb0Za?=
 =?utf-8?B?dHNvbktrMEFNd1VUYmFSTk13dk0va0FDSDBVR1ppYlB3NVhlanRCUit0YUh2?=
 =?utf-8?B?RjVPUCtmZnAzSTlOaThqZ2RFU1RYSG1JRFRCaXN5MFljeC9Gazljb1FwbW5S?=
 =?utf-8?B?NE4xUllocFRvaU1rOTNiMG83TjlNWUZWcFY2N2hRRk1nNDNhMVNrc0ZHWmdL?=
 =?utf-8?B?SEhNOTY0OTJYZFhmUUpmeElpWG5CNFNMYkpjcTFMZ1N3TklLVm1XMHZmUWtZ?=
 =?utf-8?B?eE92Wlpkck01cDlMbVhRbWJMTVpNcTV1aHlPcDVWQ2YyeXJ1YW5udEZxZ3Zq?=
 =?utf-8?Q?AftKkRnP9tHCsigVQdxdAy8AgLEHPGfE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkNsSTdBUHFiSUxJanZhT05kMDNYWFNnQ1c5M2tSZnB4ckVpSDdQUTVWa0Nh?=
 =?utf-8?B?c0ljRG0wVkc1ampWMEJvUFFXSkFtZnBEM1podUhFUlRoemF0dlA2cTZBRXFB?=
 =?utf-8?B?bmE3emI4OGZvb1h6OC9TZldjdlVocWJGOG11ZjdoWUY2SWZDSVBMWVc2T3NZ?=
 =?utf-8?B?d09malVYWEc3USs2Z252U3FRZCttTTcyQ0hUN1QwbHhURUdrVEc1b1VFWHIy?=
 =?utf-8?B?YTcySlBoQUUwbWhIbU9SK1VIam9ka1A1MTF5bmlhYkc1QVh2bjZtSUE5cUFp?=
 =?utf-8?B?MmYwbDFxYVdaZTQvS2NYZE5UQ01xNzdnZVhNOVp4bTNBVncxd21DaGUxdTk2?=
 =?utf-8?B?UGtKUGNiVEJsaG5XbnF2ZlJuTEEvK3paRUxBdUxaU1V1YlJxRXY4WHpsNUF4?=
 =?utf-8?B?c29wOGEvbkdiQXFabXBYQ01sWFdIVXlWRkt3MHNEa2I5S2hyV0d3SWFnWXFC?=
 =?utf-8?B?MkNyKzFWZGhtdDZLVHRnaHREc2c1Q2MyN3dKbUFuL0gvbzhvUEFGTU1rQ0Fm?=
 =?utf-8?B?VkIrYkFkZmdwSmJtcmNpT0dVZWFpNXlmQ3ZTUEp4UzhCNFJ5VlpYTVZqRk90?=
 =?utf-8?B?YkgwZ3NDV0RhR2N2VmRFdVFKZWZSSWFsZEd1TitBbGZsWXoramtmVHpwa1Vo?=
 =?utf-8?B?UTVyME8vZk03dk5aUitVZFZOYVExWEMyZit4MGRRWHN5WkdSTmk0MW1USHhR?=
 =?utf-8?B?RHZMVjJ4aVBmT04xOTBpR3lYNVFrM0J2cmdDWnU1NExjczZBdmcxZnFwbVYy?=
 =?utf-8?B?VlBIMlRVaVl3TDlJNVljTzAvRnpFLzBqN1VOSlhEcXhnWEo0NkJBS3dzd3Vk?=
 =?utf-8?B?ZHdaWVhKTWZJVEpBQ0tYSHA4TmVTQ21XWlJnWnhJQmFKTTE0Z0xlNy9Gc3lG?=
 =?utf-8?B?TFFEWHZpSG44ZFd5SmxOZWZIeTRqLzJHNjdVR0NvV2FRWS9mS3Y5bFlSZDJN?=
 =?utf-8?B?eWZJbDlyWUV1aDBNM3VHcjEwMklwb2VZdlF6UVU4QlV4VkQ1aHdOcmFlb3Z2?=
 =?utf-8?B?QWFOS2J2RTZGZXBsTnJZWTcwcmFZODFHV2UrWGJvbk5Fc29BL3FmUFlNMnNH?=
 =?utf-8?B?L2NTNSs0THZVQnFtVko3OE1uUHZPOUJpM3Jwb3FFUndnays1a0hFdXF6Qy9s?=
 =?utf-8?B?SW44WWxFL2RYK1kvZDZTRlJjWnBLM3FhQWJjWDJsTk5tWmVQNk5qelNIR3dL?=
 =?utf-8?B?RlRZM2IrK0ZMMFAxcDdSem9Mb2orL213K2JPRkd4czZkeEdxUVhoOS8yS2lZ?=
 =?utf-8?B?YjFTMzdES0V2SnJpaVdScUdRZmRwZzRyWlppZS94REUzS1hON013bVFSd0g5?=
 =?utf-8?B?eHlzcUR5VFB0MmdPaXhyWnk4bWk4aEJZU1VNMnJDZGltRDJxSmhmT05FeExS?=
 =?utf-8?B?VXlRbjEySFcyNUdGRmJKMGRGNTY2bmFKRis5VGQ0V08zRHJsUGN2SHEyaGhC?=
 =?utf-8?B?eGlJQjc3d09ZSDNNeVF4bDFXaDBhcDdDZ2E3QTFFL0o3dzF1TmpEYUJBSi9T?=
 =?utf-8?B?VHh5amQ3Vm1QL0Zmc01BazByVWNrMFRtSngvRTJiRG9MSUlZUzlXVmpsMUIv?=
 =?utf-8?B?eG1NVkprUTRndm04cy9vSnQ4R0t3VDJkZnJTd2VXSlUvTWcrUVJZcVdRNTFz?=
 =?utf-8?B?bEZkZkQrTnNuZE1iSVMxL3o4QTdzTVB1QlRYRmVWWWsraVJPTXFIMDNubm9s?=
 =?utf-8?B?MEJrMWVlR0w0NnNYajRKbTNEbThmRjhOQ1d5V3l2ekJ3YVNFZ3k1NzhSVkta?=
 =?utf-8?B?SFplc1Jobmc0L0xXNlBXMi9mUGhOWVFFVmRYTDVvNEZGOURRb3dtN2VSa0tD?=
 =?utf-8?B?cHJWNC84eTBQdStBNlI4NG9iOTJSNDhJMTk1dFhkcnJwNW1ucm1SdDE1bXVK?=
 =?utf-8?B?cEpDbUZKMjJHNS83TmozTURubkhjcUFOUzc4TkpqeVRNZjBMNEVwbTZiU2lY?=
 =?utf-8?B?eldOQ0xuSm1TR1VWQWZJRGtXdnVvZVFhNkFpcUV1UmJZdGc1MzBRL3FnWlVw?=
 =?utf-8?B?SU85cWpsa3FnMGdTOGNnNXFEMk9KUExoK3BSR21rMTRoV0JiTjJDckpPMGli?=
 =?utf-8?B?VTFoZzU0c0VYZkhlUGpneHhhc2c1VmdSQlhtRUozZEw5dHZtSzFvVWJNZU42?=
 =?utf-8?B?cXIzWVNzZ2dPM2NkTWRna0tDRjFLS21vSitMd0ZVTEhXRWpkT0V0ZHVZYmRJ?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b534e95-4632-47ef-8d95-08de017aa63f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 06:12:22.1766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TyxqAS53Hop5YCE//8EooO8Le/gm5/5ChW0dWSVgd6ynq6Yg0d+TAMd2ZQB9HwTlTTZWbuhYB8CgOaDeRhxhiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4888
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

On Thu, Oct 02, 2025 at 03:09:45AM +0200, Lis, Tomasz wrote:
> 
> On 9/29/2025 4:55 AM, Matthew Brost wrote:
> > A race condition exists where a paused VF's H2G request can be processed
> > and subsequently rejected. This rejection results in a FAST_REQ failure
> > being delivered to the KMD, which then terminates the CT via a dead
> > worker and triggers a GT reset—an undesirable outcome.
> > 
> > This workaround mitigates the issue by checking if a VF post-migration
> > recovery is in progress and aborting these adverse actions accordingly.
> > The GuC firmware will address this bug in an upcoming release. Once that
> > version is available and VF migration depends on it, this workaround can
> > be safely removed.
> 
> Shouldn't this be tagged with the corresponding GuC issue reference?
> 

I think that is an Intel private link.

Matt

> -Tomasz
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 25efc1f813ce..89ee68828f07 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -1394,6 +1394,10 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
> >   		fast_req_report(ct, fence);
> > +		/* FIXME: W/A race in the GuC, will get in firmware soon */
> > +		if (xe_gt_recovery_inprogress(gt))
> > +			return 0;
> > +
> >   		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
> >   		return -EPROTO;
