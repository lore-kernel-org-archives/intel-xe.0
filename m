Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B21FCAC5B0
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 08:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F49310E3B2;
	Mon, 29 Sep 2025 08:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bxaK2W1Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E74310E3B2
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 08:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759133852; x=1790669852;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6EGNG+AdtogpducWQl1Ir+Cdi1FS7G+GL0INcy2I2ng=;
 b=bxaK2W1Ya/oFAcwMYqTAYpKWM8mPrt2HWrGq+IKDiGw6xWiDup4xP7iG
 PSp4uj8Y+tLnec+oyJ0Ae4DUwliv+j+kRvnZQVx1UJij3gOkuqdKuduvw
 cBFqBbL6S9taNh7wJuXS3Wjl812tpGuHWB5PoGYWN76RYTMrf7657UvGm
 K2vmMtxlZ2FfdsfykTQgnRP2vDobco0VpjBP7V/jcVlmz+EupMYOroBIr
 F/maRTEzdw9fllRSx52QwsDmBeTUA0H0IVJJaPFLz6OWCCvM97ATcMlpA
 VrV2NjnrkibZca+D/FKgGFzsyd8l6TFSxIpGXAbPth+JNnEAesSqvt5F8 g==;
X-CSE-ConnectionGUID: G9FYa86nRhqNfzzStvLFCg==
X-CSE-MsgGUID: VROcJRYwTcSezQyctCscRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="48934125"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="48934125"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:17:32 -0700
X-CSE-ConnectionGUID: obU9c7HMSsGVZ40d/LbftA==
X-CSE-MsgGUID: 1MOmfRyAQ/6/NI3t7p7/jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="215317801"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:17:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 01:17:31 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 01:17:31 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.50)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 01:17:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sp/vfuWHi5WMK3i7KrkzOKL3eDHqZSSq7bNL8uwt3+y4ZcYZDryf8JSCZWgtyTbp+HlhvnjG2TYukPXjfhlee9Z5OhkWawKrkdqI8LvMFrmGHrGfD6lTob3AOIOO7Ru4LOAfWZd3cmgg0gdhoCBZkFROEa/ZZE1q9AlxFbhQv9uqPPHwiBw42B6J7ejqFva68M0+A6dEaI7Q3nGw0hiytbWPvwg/7sUhMlJFv9uq6RvYDVQ1jf8alaPiA9IjYOdqjmruOYnJdGJNqzW/3P3iAdeXu6X5TyqQHNi7O30FqP9f8nM8DSnMZiG0FQuiQF4K2iwoNDW6yRqEQaNO1SVOpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVyhSYp9LDZnN8alZGz7yYfLG21kELyLa4KhvcnJLLU=;
 b=nB2bzif51ji/rt7BwMosvYoFDBS0srMf05U+KKBlPs73oG4/ciBPp05G3OlBC9RrC2HrWnuqb8//jqB9s9knWbhMkLGGxAB34DfKDBmgEH8O4d6QxYvEZyjrD9OjeHKx7vSP3Eu9zuQCDgppFiQmO3AhXyf7z3sU6wDpqqXZ/euzLT4cPeOPAFzZzvlvo5Arz0KRhbuvwH9J7aF6IjYQ4Gff1G0OyL8YXpabBS6431wWjDjYgW0h5mRRP7MqIQaVT3t+7+xZUUv/CB2hyi3Q8rO1xqQrK8U6XeZnDFJjJ+0hZtgqDyHeiYC3lIDiC6hght6TGzQSslEW3K+KArWtow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM6PR11MB4737.namprd11.prod.outlook.com (2603:10b6:5:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 08:17:29 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 08:17:28 +0000
Message-ID: <0122f1b2-7338-453a-b80c-3dcec9fb39c2@intel.com>
Date: Mon, 29 Sep 2025 10:17:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/36] drm/xe/vf: Abort H2G sends during VF
 post-migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-15-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250929025542.1486303-15-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM6PR11MB4737:EE_
X-MS-Office365-Filtering-Correlation-Id: d240d0ba-1a4f-4781-3042-08ddff30a157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEdYWENDTlZrZCtUbFhxSG56VG9nSEo4Tk5IMnoxSUdiVzNLRmZ0ekFBMzUz?=
 =?utf-8?B?YmRXRU1ycEdVMzd3c3YxVi96bFpnUzl3QUhySi9sUGxPaU5TRkttc2NqQUxZ?=
 =?utf-8?B?MG5ta0NwS1BuUGk1WFdVWTZFU0ZGN2t0RGJVY3FyUy84TlE5NXlQWDlJbFFT?=
 =?utf-8?B?aEtxWjVabkxRY3Jvamh3QnJtalBNL3hoZzd5TU1zOUJ6OFNsLzdSb2RmQ0NV?=
 =?utf-8?B?YXFlbHBqdUg2NElubU5KQm9lTFdZYjRJQzdSR1FyUHF6SU50S2crdDhSOXo0?=
 =?utf-8?B?MHNsOHNMWmFKQjM2ZjlTbDd5SWVUcCtDWjBncDE0SkpYR0Q3VTVna3JKdW9x?=
 =?utf-8?B?Z1JDVFlXWU84bFg3elNrMTJkMHhWY1VJN21BcjIzcUhqQUx3Q1JZRGZzSXA2?=
 =?utf-8?B?czJpMnJiYlh0cHJVQUcvelQ5QUVBdDM1ZEF3WDhyb2IyMkh6eXVxRjhvNy83?=
 =?utf-8?B?STdjR2dxQ0lHWm8zSUJJWjl4L3B1MEtzRlVGbU9XdmJ2bjNnaElFbmJzU2Ir?=
 =?utf-8?B?dTMzaGRCaC8yekJjVGpVMlJBQUhpUkYydW9KbWpLYU80dVZLTStPdmkvUzZY?=
 =?utf-8?B?SE1RbXdhMDNubHp6Z0gvWko5Zk9aSmc4TzU0NTllV0VIZGtRVEFzeGpmRXdY?=
 =?utf-8?B?OXlFeDMzVmJCazY4NXVpc3M3RCtOeVhWRElEMDhIQWhNR1UrcXNER3dKdTBs?=
 =?utf-8?B?S01BbFFBRWZrSjZXWDdYbE1BTWx2V3lnWHN3d2ZobTNhQ1pEYXlCUzZ5T2ht?=
 =?utf-8?B?ZjcrL0VjWlVkN2lhdDhvcEp2eWh4RFBONTZtaW53YXdVWmlNMFJZenRaQ0h3?=
 =?utf-8?B?MGtPa3ZqeTVtZDZtU1pOY1RoSS9zTTRVNitTME9NUDFVUUdrbXA5UmpJUk92?=
 =?utf-8?B?UkZrTVYwSGJpdms1RmI2eXMrMzdMdlV6cTIrM3cwM2YwRHlnZWthOEVrdXFt?=
 =?utf-8?B?ODVrL1J4dlJGdk5wSDQvRTFnTmloelIzRklyMzhIZFRGZGY0eW9JNUlvUjF2?=
 =?utf-8?B?V0lwK05rU09HdUhjT3NFaDA2LzBwYjhXT0JKVEx1cmZNVGxVU2hRMHR4ZXhZ?=
 =?utf-8?B?cUNMSVR6aEErKzVrSG52ektobHNQc29YMnIzU2ZGNTlCTXBFeGsvaWc1TjBS?=
 =?utf-8?B?eEQrWEJDS0VlTThYRWp5ellqK1MvSEpTeHpKbXZ2RU5kVFVyQ3M5Lzk2bS9S?=
 =?utf-8?B?bXNQWnZ1NDNFbzFIM3dFdVpmWENwSjZvWVlwcE52eEVGOExjMjBjQnE3dWRZ?=
 =?utf-8?B?VHM2eVdWcFJwOGluUGRqdzlMQWRhT2Fid3BzVFpFeUZSN3l3T2hOQU0vd0M5?=
 =?utf-8?B?aEtudzNDR2hjNEZKaGNpeXdKV2I0WUpJTXJSMHdyUkR6dlNWbE9uZldyUDZP?=
 =?utf-8?B?cWRnTlM4MGFvakxKcGE3RzZZS1RaTnl4a0RlR2tZemlBd1pldlhuS3lNWXM2?=
 =?utf-8?B?UzdSMTIrSXlvK0twT0R3a3YwT3h0Vy84MTl1NXJTQmJFN3JycGZKRVhFUkJj?=
 =?utf-8?B?Y0tQeVg4VHR6SWZQMFVsMnJCeXdRUTdMVlVTd2V2RkY1YXNWb2lsWUF5UGwr?=
 =?utf-8?B?Mkg4OUZndzVNSmx1SGh3THp0LzZxcCtCL1hnMENjNkYyQjNoYnUzdFRobkFF?=
 =?utf-8?B?ZTd6YUNCc2cwSzdQSFJHUVo0UVZ1U1Z3MHVzK1dOdmtqRTNtU05jRDdMY3NB?=
 =?utf-8?B?a2JHdXNkRG1wdk13elZuYk5pc2wzSUVyemcwL3BIUytjbUUra3R1VzhlUFF1?=
 =?utf-8?B?b2xPOVQ5WlpSSGU0c1BoK1E2Vm5uaWtzbGQwUVUzMVR5ckQ5WkFHQ3hmK3Ba?=
 =?utf-8?B?VjhrYUlWRDZqZ1RjQVdSbWJkZ1VvMER2S2srM09EYXJuS3BPZFJ0QjRTZmRC?=
 =?utf-8?B?amZhUnpCK0pvVVdkOERuTTdkUFB1VERUMytNYXVBSXVIU2hWM3NJZnl0S0Jr?=
 =?utf-8?Q?Co1bQhNAbjwzHUjTjD0KCsytS3kd8/oQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUk5QTZtYUFlU0hQU3N1Tnk0UGNEc2FTM1o1djQveW5NV0ZYR0E5N2lZTXRa?=
 =?utf-8?B?aGdKNGZXU0pGRlJHMkYwSkNYcWRudmcyZDAzTG1sZytDWWpJdEdob1NrdzVH?=
 =?utf-8?B?WElYRlA0SU5ROGdlMEMxZGd2V3p4VkJoSG85dFQ3eGRpK1FHTEpVQ2xPMVFo?=
 =?utf-8?B?RzYrUmJoMTdES3lkZ25QYnRpVzJuNitKRDhIcVR4VmtUV2RFQU1zbUo5WlFu?=
 =?utf-8?B?TFRuVFNOSnlUdGdjOEJncVhUYTF6TkRDanZVYTBkWE44amoyTm9laXh5MGVl?=
 =?utf-8?B?aytIeUVNalA3STBpMWp1M1RQUDI2MVZZbnIybVVUZkZtcDcvOVVtblJwNXRs?=
 =?utf-8?B?aGxrS1QycTZScktRVjQ1QkJrUU51TGh0RkpYQWZVUy91ajNvVmY1VkxJK0hX?=
 =?utf-8?B?SkFqdEJpTTB3ZzhoQ1FyRy9mNkZ5Nit0b0dpaHNEZGROSTVKWVJTTVhTT3hC?=
 =?utf-8?B?ZHhVRDUwdncrRUVhQmllSXBnQjJSeEgyeUxJdEtCdWlZc0ZpdXdaNjk0cEF6?=
 =?utf-8?B?YndlWk5iL1ZTbXFpVWhBcEhaSEVkeUlWMjB0TDhpZVdGR21iNk1oMWgyUVlm?=
 =?utf-8?B?bDdNK0FFTmZ1VkVyU3A2MWRDb0hxVFhZTUg5eGMvMHU2UmR4ZUtCdHJYTzVm?=
 =?utf-8?B?SVV1UGlKWUFwSmM3N2xUUEZJUWtMT1VCZmFGVFdDMW0yTFJ5c0l3b2FjaDFJ?=
 =?utf-8?B?alNHbVdNd08wWHo2V3ovUm9PZjZDYnRoTkhPeko4VUZoU0hreFlOWmYrcUlr?=
 =?utf-8?B?cGtHL1E1L090S3RiN3RpeW50L3MydHNxQkVQQ2FsWHZEa0JNR2dKNm9DVVBK?=
 =?utf-8?B?cHNWaUNCUVlWUkgyc2xpZEMyMHYxQjZ4R2Y4WVdlL3BKekxBQU51VzE2RWcr?=
 =?utf-8?B?ZWtIa2pMcCtObGMzNHMrWXMxdSt4WWlBcUU4cFJTY0svTmx1Y3QxdDdtaFBu?=
 =?utf-8?B?d2hkQ0hmNXNPb25lbnR4a3Z3RHFRbjB0Z1VwbE4xaGdCRXpNMHQwWklVQXZM?=
 =?utf-8?B?L1I4RWVVOWtOY0NrWTB2b2Y0UlVMRGdldVV3cVVMZmR6OGY1SW5wYVY5d0E0?=
 =?utf-8?B?dEN4WlVOWUhBNi8wWmtMRUwwdklEdlBKVXZaeWc3cE0vZUxJNTBqQ1FhNWJK?=
 =?utf-8?B?NkJiQk9xTVZoTGZXaHFYVjJvYjJyMVFFRjJHalMzMlg2L0RpL1FDZkpWSlFY?=
 =?utf-8?B?cnJ6ZE5GaktmRENGbmNSSVNSYkxYTkVybE5DbTYzV24xdjc4T1dPRnVQSDVS?=
 =?utf-8?B?bWpXWVFLMzUyUHpoQnB4djRrRmptOG83dEJaVEIwZzVWdkExR3FZZEhBNWIr?=
 =?utf-8?B?MGV1YzBDcUw2cmQzK1RJNWlFUi9QS3hXUUI5WEtnUUhhUGQ0SzQ0K2VmZjVv?=
 =?utf-8?B?QkNScVlvSldiWEIwN3EzK3RkT0tTNUpXODFyT09IcUF4Wm5SQjVDcUlXU25t?=
 =?utf-8?B?SVpkZXA4TU9HQXVGeGNuMHEyWlNVWGFraU84czAwcEJ5Ynh3K3I3YU1XckNJ?=
 =?utf-8?B?SDYwTnRuUUlZZWtFaFBNSCtMaVNSTGEyVWRSUnZvNkFsOVlxR1FmNGpIYTNZ?=
 =?utf-8?B?aVZGVGE0SHkzNk1oQ21zTEdHOEdabmx2RTU2Q3NxcFlKTUxDU0l5SFRCTGlr?=
 =?utf-8?B?VmxScENSVWpWMEJoMVNoYlFqZVk3QS9GbE42WDYvOVNmYU85T3o0bHQ1dS9C?=
 =?utf-8?B?ZzNMTmtpMG0vQmhhakxlTTBISXRqVkdjN3M3WHVmOGRkazN1b3JPRmJNeVJo?=
 =?utf-8?B?RXhUdEVlNXpoM3VzK25wbmZyb3JWM1NaT3NRRlNyMWw3U3o4c0hRaDJlOUl2?=
 =?utf-8?B?b2VNR3ZTbk9vUlRBaytjSDBXcWZZQkxzeEVPcTRzV0xHRG45QnpmMU8wNUxz?=
 =?utf-8?B?dkhweGx0V2tGYWp4bytYdE5xbzMxR3VWNEdOeGFFV0NqY3JLaXhjMUdtZ2Fz?=
 =?utf-8?B?b21SaEFPamlSUm9KZXd2cUUwNkdUa0ZwUHdxSDZZQm9vOTlLT0plU0Jhc1VO?=
 =?utf-8?B?ODN6RDU4TnZLVXBTVTF4WmlHNHlxS0JFaWR5NGNlS1M4YVVhVjhRandiWWk2?=
 =?utf-8?B?eDdjTGVydkM3dmNia1JXb2NoQ3FzNHZXQlVBWkFsRkMzMmoyeUlBa3NQTFpL?=
 =?utf-8?B?Uml0ZVF5Q2hUd3hpWlNSbE5Jek1NN0pnOUkxeTEvd1pTTVVrUGp6dDdoLzdy?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d240d0ba-1a4f-4781-3042-08ddff30a157
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 08:17:28.8615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6w8h/WcZWnjuRv8b8Jdl14M0tAFbAXiJ7Yo8p6Ie/IH5khrRKIl+OzWacZusOIxS0VvnoIUaFgbLmRma9dFJNZ30VDfsdHcScuY3WiMyog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4737
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
> While VF post-migration recovery is in progress, abort H2G sends with
> -ECANCEL. 

-ECANCELED

I'm still not 100% convinced that we should reuse the same error code that
we were using to indicate some more or less final CT state (STOPPED, DISABLED)
as while it might be no difference for submission/TLB invalidation code, it
might not be same to other code that uses CTB (relays)
but I don't have a prove now, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


> These messages are treated as lost, and TLB invalidation
> errors are suppressed. During this phase, the H2G channel is down, and
> VF recovery requires the CT lock to proceed.
> 
> v3:
>  - Use xe_gt_recovery_inprogress (Michal)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 47079ab9922c..d0fde371fae3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -851,7 +851,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  				u32 len, u32 g2h_len, u32 num_g2h,
>  				struct g2h_fence *g2h_fence)
>  {
> -	struct xe_gt *gt __maybe_unused = ct_to_gt(ct);
> +	struct xe_gt *gt = ct_to_gt(ct);
>  	u16 seqno;
>  	int ret;
>  
> @@ -872,7 +872,8 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  		goto out;
>  	}
>  
> -	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
> +	if (ct->state == XE_GUC_CT_STATE_STOPPED ||
> +	    xe_gt_recovery_inprogress(gt)) {
>  		ret = -ECANCELED;
>  		goto out;
>  	}

