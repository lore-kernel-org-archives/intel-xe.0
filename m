Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677ABC71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 10:13:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2819210E5C4;
	Tue, 17 Jun 2025 10:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iR8WdDHs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378D510E5C4
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 10:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750155203; x=1781691203;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BZLwdxGvHXdFgW/pbrYiAV9jx6/P3nAETeQAYRfd5F8=;
 b=iR8WdDHspiGgc1NQzvFFxW4zHbkBGq0CtUFQnwb+7sq1utzfIiBMX2nB
 A2k7KIZBCXdr2mb1ZT1PfjHXGExeoXQyY27c9hyKYXqjglB9FRIwCEOms
 TY+VWbWwBkPn5B8xeThrGiwCY4xj0D44I33YM46mSCC4rUNM2oWwcPaEb
 9Z8UbBKlrjfD3y2xwbojj9on5UBuAodcfODVHMD5jxeECTy3xmtJl98FX
 HuU4UrH8Pyd7B+EIL4t3oPD3W+lX1+LdeQzviSM2fSDLbkIPGwIlb7rp3
 L2iHRbUpch01/VbUUUQI8QoOcGha3Yb6GLTvSlwQAt+Pav+5XLWjBZiXq w==;
X-CSE-ConnectionGUID: vtJnSfiSSm6WljmkK8S0Ow==
X-CSE-MsgGUID: ivVSTKIoTQCNtIlx4/1Hfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63679239"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="63679239"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 03:13:22 -0700
X-CSE-ConnectionGUID: /wbUBNbOSmGqDTJAbcE0rQ==
X-CSE-MsgGUID: uTHYYvWsTA+zIuIchhrpVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="153699646"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 03:13:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 03:13:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 03:13:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 03:13:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyL8ggV9WHRDDi+2l4l+yY8ch60p9PWmiOo2VnEwa0wQ8PdmLoO5/v0/5L+4kCoK2NsOBTF2ehfc52WVrHaVStnoPxGj2L8J8FaIxKAgIyIJHjVH4l6CAyZsMVc3dCmUgV/EkNVpUlFxRxA9sNSXTpjQtibJFV2sFPZii8HHL5MT7u6F7QI3mX4k3Ab2omIjnZlz5fYY4LRn43jXlmyR8HLoMYwceBn0mgL1unkMKeWwCqyyNWOqnQoIwaLA1Q1sYvH0ZcUqBt1got/fs3P+boncnSSP1xqjIkEwNSjz9LrAalj9ZOO33bDzN3WjhoKVqU3IF1HihFiXDuBP87p3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxxqOedyUVZAKTK1vr/xDUv6t3lBAviS0OCUSyaICY0=;
 b=nosg0YRHH+YI3OFWj7Fm2nqqYwlcvLcDZA7kzca+wR9oORblVYBYE1DLqBy+Azl/7Ieywb3W0GyTLdvsrIVH5hcbG13hpJJtgWgZeHn2pHk8Y/cCkCLaHL5Ct9TJSk9v/x/rhRmQMl2P8BbsfshvAyWDVx4zdR7Su8yVwp8B5ZfpYX6MCX1bdaggIyzvsr2gBererUa8ojI9pdzTpM1KYDBdPuB1K9IS08/hDLvJuI5XKGI63npN7RrBPdZH3V4sQ60kwteuA/VQKBcsmh32JqvR/j/Sgl4H47Eam6kbl1XS/d1/EQXZpJQu1ZN5pFEqxmZ34D7dHP3qHeUThrAoGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB5700.namprd11.prod.outlook.com (2603:10b6:208:33f::22)
 by SJ5PPF56FDAD370.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.23; Tue, 17 Jun
 2025 10:13:13 +0000
Received: from BL3PR11MB5700.namprd11.prod.outlook.com
 ([fe80::7fe7:55d4:2fc0:6398]) by BL3PR11MB5700.namprd11.prod.outlook.com
 ([fe80::7fe7:55d4:2fc0:6398%6]) with mapi id 15.20.8769.029; Tue, 17 Jun 2025
 10:13:13 +0000
Message-ID: <787db959-383c-4e9d-abbb-58d56a7d57d3@intel.com>
Date: Tue, 17 Jun 2025 15:43:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/hwmon: Fix xe_hwmon_power_max_write
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>, Riana Tauro
 <riana.tauro@intel.com>
References: <20250616071133.458363-1-karthik.poosa@intel.com>
 <2298dfdc-f17d-43e5-9fe0-bffda4f50690@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <2298dfdc-f17d-43e5-9fe0-bffda4f50690@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::22) To BL3PR11MB5700.namprd11.prod.outlook.com
 (2603:10b6:208:33f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB5700:EE_|SJ5PPF56FDAD370:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d5da65-7ee1-49d9-20e5-08ddad879172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVord3h6MGhzYUE2Q01nTGtvemtDSkdvY2IxbzFXQngzVjFxd09iRmEyMGpn?=
 =?utf-8?B?dXpJbDdFU1JldFpFK0JBdU83TmplOHFacG1Vc0FvRzExSzBLZmFYNjZlMWMr?=
 =?utf-8?B?YlRjV2hWM1RZSkVnL25zYWkveWpsYmUrc2haSVhLUHcwSE5aMTVwYldKdDli?=
 =?utf-8?B?RFArS3hZUi9HR3I1aHF1Vy8wMUFEellmbGE0NEJjUFdGRElBWkQ2L1haRDBy?=
 =?utf-8?B?QW5XV1VFUnF1NWkrWGpuekVib0ozc0IxK0grSm1BZTlCY0c2dW9lTzNWYVRo?=
 =?utf-8?B?am5YZWpxMkNUSHcrL3h2Zi92OGVhM0xiNGtVMGYrTytYR240aFpBd2NuQmx3?=
 =?utf-8?B?elJ2TURITVVocHFPZG1LQ29wTUVGVFp1dnBGYVA1MkVIQUMxV1RNMng4R2tD?=
 =?utf-8?B?UjdET3VxaGxKcHZPQWJiQXlscFdsdEh1OXZaTG11TjVBV0I0UTFSaElveHhJ?=
 =?utf-8?B?YlQwdFlkcDBZb1FRajdTVENnL1ZaMzZDVnVSRHc4bWpFUjJ4OGpLRWtHODVD?=
 =?utf-8?B?YTFOVU5XaVk5dzZFNU9BbHUyaXZsQkRDdWtIaXIwb1lmcllXRk5JK1lsc2RZ?=
 =?utf-8?B?by92Z2k1ekNvTGgvdFR4dktNK0dNT2RkQk9USlVGZ0E3dUdEb0lWd3lDUWxR?=
 =?utf-8?B?RWJiL1NtMXZUSHhSbzkvWTNVVjlKNDdqNTREV2o3TUJycXl6MlRHT01qeVZv?=
 =?utf-8?B?b0pYWjdDTnR3cUNWdDRER0pBMmFHMitGUzRyK0JuQW92RHZ1ZTBTK3BGTjd1?=
 =?utf-8?B?WkZ6VnpDVVVxaFUxMi96K1UxM1Q5bnE0NEZrSEJsaWw0QjJmQkhoK21UNDg4?=
 =?utf-8?B?ZEF6bWliNlRSMWJTWHBRYnllc1BucXZTUGZXKzBhb2ltOGh2SlQ0NWlLL1Az?=
 =?utf-8?B?MlhVcVFGTU81Y3RqdEhTM015dUY3STJQblFUR055UjltS1VXcnp0SFEwamYw?=
 =?utf-8?B?bHMyYml2ck9aQ3pXTTgzVHVPSWdsTjlrMGZHYjV5dW0vMTE3RmtvZkI1NXB3?=
 =?utf-8?B?VWl1K2xXMWRBdGFxYkRtVDZ2c1ZHWFUrTUl6SVJ5dlpjUmZxQUhncWlyQXFI?=
 =?utf-8?B?bkNmc2MrWExCeTJmMHdpcnBReEJhUDFHSUJSN0tRZXdXZ0VTY2xvRXNSOXRG?=
 =?utf-8?B?OXlrcGc4TDkxZlkzRHVtVWRqaXZCZ1FubVRkNHRUNFg4di8xbG8xd3RwQ2o3?=
 =?utf-8?B?NTBmOVZBRFhzTFIyT1RPUmtodHF2K2F6KzZwdVhIWVBMM2srbW1KZlZrSjVv?=
 =?utf-8?B?dC9Cbld4dWFoQmdMN1hENHJ3WVVVRmFRZ1c0RDZCdG0zelJMU2plenRwaHkv?=
 =?utf-8?B?R1dyMmJ0SjNXWWViRzc0N21QWWFjK29rVWxFQUZNcC9LRWVxSjdnUktOeHhm?=
 =?utf-8?B?ak12NnZ3OGZDUWMzVEVzTUVWZWhnNmN2djBJQ0lHUjI1ZEFCejY0eW5uQldv?=
 =?utf-8?B?Sk54NlAxTnI4RkV6WFRaRk9qSUVRMkp6dHdJeVBYZlJNS2c4eDYxQythN3JL?=
 =?utf-8?B?VlgwWlNFZWE4K0QydkZiM3NUZEo4Q0dHa05XZEc3S29pcS9ERUxyeVFQbVk2?=
 =?utf-8?B?V24xenIxSnozb1lra1lZcmo5cXJhV1NQaU5SRlVzZ2xIV0lCS0VUclNteVFF?=
 =?utf-8?B?RzJHckliVHFmZ3poUFAxanJUaWxkYkN4akEwNWI5amloVkdIc0padUpCdks5?=
 =?utf-8?B?cVhncy9GWWRxRVBpS294WjExODFpcU8rWkNZc1pCS0UvMmFXam12d0RPUVRG?=
 =?utf-8?B?c3VBVzZMZ1djTWlCTzYybHpIMGpTYS9ZRHo4Sk5RUjRPMHQ2WFc4R29nNkEy?=
 =?utf-8?B?alpndWxqbXZrRWp1MmdQWjRmNS80eEJqYTNHZmt3cFdyTXpTUXBDNjJxR1Az?=
 =?utf-8?B?TVA3b0lEN242MTIrL2VoTCtpek9jUVRRMUVTOXhOeHhxUUluK0FpNnhZTVhl?=
 =?utf-8?Q?Ch4zt2rjLnU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5700.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTBPSExIb1Y1b0hLSWg3TEh2dkZVdTFtOWdZS3pJeXRSbFNHTXlna0hDbW5z?=
 =?utf-8?B?eFVyQW10NWphOWpOSzNYRkE4VjJBYU13aHgzNkhvV2NScUxSRDJWdG5rajFE?=
 =?utf-8?B?YlVJVGJiUlpUODI2eG1jbC82SXk5Zm9qUWR1S3JYTTlrR3dSazFSUU1oZGRI?=
 =?utf-8?B?cHAxRXdTbjc0aUx2UjR5aEtxdlFCcEt0Q1ZKY0dHK29RV0kyM1FoMjlOVEc4?=
 =?utf-8?B?eGVjc1h3OEZTcVYvRS80ZEx5UnF1Qm9DTDFaVGtvMzU1YUJNazhxbkIzbktR?=
 =?utf-8?B?cGZMMFZ0SlROeENNTGJORnF0ZHpMajRJdTc5a3JYNnJRT00ybzlqYWZ1Q0Uv?=
 =?utf-8?B?ek1URkFLb0hnVEVaKytJYURYRGFDRTQxaEl2N1pYbm00RVEwcUw2cWdUU0JO?=
 =?utf-8?B?M3FNcW10NUorekxjNlFWbmEvTy92ZmFFYTM3V3Q0TTlqUFJsZU1BN0hRcU03?=
 =?utf-8?B?emZsYmZBTXluYVlYMTJ1VEFuOXY0YU9ML09pamErWTJkYUdEUkpSNUVVcHhV?=
 =?utf-8?B?NGJ5eU1YNllqaTI2Nm9INC9lcXVXSHdXOS96Ti9PVWxGazRiWG1GK01qeW4w?=
 =?utf-8?B?Si9reGVKVVpPaFdHVnBOM3Z6L1pHTjM2QUwxanlNYmhPdVAyNlBLZG1kUW9T?=
 =?utf-8?B?VEdSamQ3bEVheGNXV05TT3NTNGROSXNvaE9NT1h6c09lcGkzNlFqLzhGZGtE?=
 =?utf-8?B?WWVWejNoY1hKa1oyelA0eG14SHZHdE91SjNaZTU2K1lBOUp1RjZUZTJHaHFG?=
 =?utf-8?B?V2dCYStnQUhlNVFYVXRraDRrdTV2S1M3aFNobE83RXRoT2dpQkpueDFRdkpw?=
 =?utf-8?B?Nlg0bWRuUlNlbHVxMmZETDI3ZnRaQk5UN1VST3BQcnlnZnhxWDNuOWlwR2JJ?=
 =?utf-8?B?QlNlZjJJb3BpZndPU1hiVXNKYzVEenk2TkRaMkVyN09tVFJORWtoL3g1OGw4?=
 =?utf-8?B?Q1ZxRmJ2NDRSc1BCdW1mZHZGRHBMcS9kdW1xcmpNN25jaEM1cDc3azh5U1Zs?=
 =?utf-8?B?dnhyNTB6Zytrbnc4UVV2RzRUaDZrQjNXRlhEZXZ0UmZMb2JSTHJCWjlzL01U?=
 =?utf-8?B?dy9JTEJVT3dLY0JBSXQyaU1aUFQ0WE5EcWZ3aE1xUlJZenQxNXpsSXBRWi80?=
 =?utf-8?B?TzZPMHJtaW1HVHNrUkwwR2k5NnpQeTJUcUMzTnVkSkswZEFtdllXSnJtRDc4?=
 =?utf-8?B?aXlsWk50T0NDT1U2QW1LajF2eWNhcTcyVVFCdHJuenAvZmkvSDZ2elJCWFl3?=
 =?utf-8?B?Uk1RcHNiWGJtd3V6SzIrdDcyNnZ5ckdVbUpVV0F0OTZ1cFp4WFkxaEVOZUhY?=
 =?utf-8?B?YmdLd1ZzajNEcEFyYzVKL2cvWWl4QU01TzRMV3Nqc1p6WHhLV2RvSmFuWFpl?=
 =?utf-8?B?ZzVqRGYxYWMxMlRDZUVkL2k5c3ZBZWlDRXZ3US9tcUhjRklpU0tudWw4c1E1?=
 =?utf-8?B?YlJGNzNRWEJsMi9QZ3BJWDJnN1B5TWlBanQrUXhTSDdQS0ZXWGdWTm0remRr?=
 =?utf-8?B?bE9nV01XbWlXNXdKbmtoSWlod0VtRG1waXRJdVVnZnJqbmIwZGQzWW1rcFNi?=
 =?utf-8?B?UEF2TUhxUFoxMEJiWkRSMkVFV0Q5WFAydXgwMDlXMWp0dzF5d0g0dmRPTXZy?=
 =?utf-8?B?aHo3YXhrZHNhdmczMVlZOGZ4T0p1MDVZWlpCa0xUN2tzelZIQUJTUXNoaHdU?=
 =?utf-8?B?SXNPaGE1NHFvdW1wNzNhenYvK0ZDaVg0V0FGY0NYejV0SnFjNFk3S05UTFB3?=
 =?utf-8?B?NjBvL1J2bHQvS3NMNEwzNlRLb2NXRFFPVWh6dk5YK1hkcWYwQWlweUpuSkhz?=
 =?utf-8?B?aklSZFJETEJEdWluMExYaDROOEkyQm80QnIwb241bDQ2K3B5bEx3cXBsbzRS?=
 =?utf-8?B?YldHU0FUZDkvdWJyWENCQzZsWXlUM3E4UGtHU0JNaVd2Vm9UQlFicTJjc2VU?=
 =?utf-8?B?L01keUR4cXNzMkJ4ZHIyaG1saU9ja1p6OVNqQTBKWUluZmpDV1hrWWhqZVcr?=
 =?utf-8?B?V1lSWlFLUGFUd3hmTWtTd0hzdEhaN0ovSEY1MnZ1akREclhIYUxLQUhCME8z?=
 =?utf-8?B?VWZhYWdLMkl1YjM1MC9WbjcxZ1I0eUtqYUhHZElHMHQ2TC96ZDFwaXQ0c1pR?=
 =?utf-8?B?Nm1ZVXhXQmVWT29NU1ZPdWxwTGVueUZsSFgvTFoyRGlJV2FaV2hkWmIwMkI2?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d5da65-7ee1-49d9-20e5-08ddad879172
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5700.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:13:13.3094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cy/8dYzjF3MUXtJaRQMdaYWPXxdTo+gFV1DIX+DHPDwrTVpljFDdM325UITDAQtY1hIP5OwhjfG/6wLIIyzqzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF56FDAD370
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


On 16-06-2025 13:10, Riana Tauro wrote:
> Hi Karthik
>
> On 6/16/2025 12:41 PM, Karthik Poosa wrote:
>> Prevent other bits of mailbox power limit from being overwritten with 0.
>> This issue was due to a missing read and modify of current power limit,
>> before setting a requested mailbox power limit, which is added in this
>> patch.
>>
>
> Since you are making changes to power interval also .Split the patches 
> into two. One to add rmw and make changes to existing code. The other 
> as the new fix. 

We can't split xe_hwmon_power_max_interval_store changes in separate 
patch, as it would cause compilation issue.

>
> Thanks
> Riana
>
>> v2:
>>   - Improve commit message. (Anshuman)
>>
>> v3:
>>   - Rebase.
>>   - Rephrase commit message. (Riana)
>>   - Add read-modify-write variant of xe_hwmon_pcode_write_power_limit()
>>     i.e. xe_hwmon_pcode_rmw_power_limit(). (Badal)
>>   - Use xe_hwmon_pcode_rmw_power_limit() to set mailbox power limits.
>>   - Remove xe_hwmon_pcode_write_power_limit() as all mailbox power 
>> limits
>>     writes use xe_hwmon_pcode_rmw_power_limit() only.
>>
>> Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power 
>> limits though mailbox")
>> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h |  1 +
>>   drivers/gpu/drm/xe/xe_hwmon.c            | 48 ++++++++++++------------
>>   2 files changed, 24 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> index 5394a1373a6b..ef2bf984723f 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> @@ -40,6 +40,7 @@
>>   #define PCU_CR_PACKAGE_RAPL_LIMIT XE_REG(MCHBAR_MIRROR_BASE_SNB + 
>> 0x59a0)
>>   #define   PWR_LIM_VAL                REG_GENMASK(14, 0)
>>   #define   PWR_LIM_EN                REG_BIT(15)
>> +#define   PWR_LIM                REG_GENMASK(15, 0)
>>   #define   PWR_LIM_TIME                REG_GENMASK(23, 17)
>>   #define   PWR_LIM_TIME_X            REG_GENMASK(23, 22)
>>   #define   PWR_LIM_TIME_Y            REG_GENMASK(21, 17)
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 0d32e977537c..fa841311bdcf 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -175,8 +175,8 @@ static int xe_hwmon_pcode_read_power_limit(const 
>> struct xe_hwmon *hwmon, u32 att
>>       return ret;
>>   }
>>   -static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon 
>> *hwmon, u32 attr, u8 channel,
>> -                        u32 uval)
>> +static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon 
>> *hwmon, u32 attr, u8 channel,
>> +                      u32 clr, u32 set)
>>   {
>>       struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>>       u32 val0, val1;
>> @@ -195,9 +195,9 @@ static int xe_hwmon_pcode_write_power_limit(const 
>> struct xe_hwmon *hwmon, u32 at
>>               channel, val0, val1, ret);
>>         if (attr == PL1_HWMON_ATTR)
>> -        val0 = uval;
>> +        val0 = (val0 & ~clr) | set;
>>       else if (attr == PL2_HWMON_ATTR)
>> -        val1 = uval;
>> +        val1 = (val1 & ~clr) | set;
>>       else
>>           return -EIO;
>>   @@ -342,7 +342,7 @@ static int xe_hwmon_power_max_write(struct 
>> xe_hwmon *hwmon, u32 attr, int channe
>>           if (hwmon->xe->info.has_mbx_power_limits) {
>>               drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
>>                   PWR_ATTR_TO_STR(attr), channel);
>> -            xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, 0);
>> +            xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, 
>> PWR_LIM_EN, 0);
>>               xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, 
>> &reg_val);
>>           } else {
>>               reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 0);
>> @@ -378,7 +378,8 @@ static int xe_hwmon_power_max_write(struct 
>> xe_hwmon *hwmon, u32 attr, int channe
>>       reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
>>         if (hwmon->xe->info.has_mbx_power_limits)
>> -        ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, 
>> reg_val);
>> +        ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, 
>> PWR_LIM_EN | PWR_LIM_VAL,
>> +                             reg_val);
>>       else
>>           reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN | 
>> PWR_LIM_VAL,
>>                       reg_val);
>> @@ -591,14 +592,11 @@ xe_hwmon_power_max_interval_store(struct device 
>> *dev, struct device_attribute *a
>>         mutex_lock(&hwmon->hwmon_lock);
>>   -    if (hwmon->xe->info.has_mbx_power_limits) {
>> -        ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, 
>> channel, (u32 *)&r);
>> -        r = (r & ~PWR_LIM_TIME) | rxy;
>> -        xe_hwmon_pcode_write_power_limit(hwmon, power_attr, channel, 
>> r);
>> -    } else {
>> +    if (hwmon->xe->info.has_mbx_power_limits)
>> +        xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, 
>> PWR_LIM_TIME, rxy);
>> +    else
>>           r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, 
>> REG_PKG_RAPL_LIMIT, channel),
>>                     PWR_LIM_TIME, rxy);
>> -    }
>>         mutex_unlock(&hwmon->hwmon_lock);
>>   @@ -1217,25 +1215,25 @@ xe_hwmon_get_preregistration_info(struct 
>> xe_hwmon *hwmon)
>> &hwmon->pl1_on_boot[CHANNEL_PKG]) |
>>               xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, 
>> CHANNEL_CARD,
>> &hwmon->pl2_on_boot[CHANNEL_CARD]) |
>> -            xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, 
>> CHANNEL_PKG,
>> +            xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, 
>> CHANNEL_PKG,
>> &hwmon->pl2_on_boot[CHANNEL_PKG])) {
>>               drm_warn(&hwmon->xe->drm,
>>                    "Failed to read power limits, check GPU firmware 
>> !\n");
>>           } else {
>>               drm_info(&hwmon->xe->drm, "Using mailbox commands for 
>> power limits\n");
>>               /* Write default limits to read from pcode from now on. */
>> -            xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
>> -                             CHANNEL_CARD,
>> - hwmon->pl1_on_boot[CHANNEL_CARD]);
>> -            xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
>> -                             CHANNEL_PKG,
>> - hwmon->pl1_on_boot[CHANNEL_PKG]);
>> -            xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
>> -                             CHANNEL_CARD,
>> - hwmon->pl2_on_boot[CHANNEL_CARD]);
>> -            xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
>> -                             CHANNEL_PKG,
>> - hwmon->pl2_on_boot[CHANNEL_PKG]);
>> +            xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
>> +                               CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
>> + hwmon->pl1_on_boot[CHANNEL_CARD]);
>> +            xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
>> +                               CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
>> + hwmon->pl1_on_boot[CHANNEL_PKG]);
>> +            xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
>> +                               CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
>> + hwmon->pl2_on_boot[CHANNEL_CARD]);
>> +            xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
>> +                               CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
>> + hwmon->pl2_on_boot[CHANNEL_PKG]);
>>               hwmon->scl_shift_power = PWR_UNIT;
>>               hwmon->scl_shift_energy = ENERGY_UNIT;
>>               hwmon->scl_shift_time = TIME_UNIT;
>
