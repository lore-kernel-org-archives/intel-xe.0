Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34E9C87FD1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 05:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA6910E39D;
	Wed,  6 Aug 2025 05:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IjMDDMjz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9239710E39D
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 05:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754458192; x=1785994192;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=12omLf6pgESWHr5t5DkAwnqRoOEiXZGU712d6+Kz6Wc=;
 b=IjMDDMjzkQ7588O0P+Tjp4VmDs6Imii361PHnRBdbZkwArXorgDX+NBq
 LGs7YBBsF31uasNkmT5RbZe2c++m3SKleihGAGAfQ1hcGWESSuUlteTs9
 VH6GJ2jg7pG1AW1jucaRMLOIOw9yrUxuiuHHDKiC1dNtvRjpyxNPa+/Vs
 oDbgvb+zlYl5c8INzWbmUGPg90X3BdaNdESCkPwxRwdDgLhAiRr+tDSpN
 bza6HDE4hOqdDB488Q/XV0nrrADSwjuI0HLbcZWmFh7YY72TsvRwpvxl8
 foJZAgBU3KJdRMJCNK5AeYZtpDwFV3FFdWIO163OQDcEtWF+V3R0JyeEc g==;
X-CSE-ConnectionGUID: +cJ7JMADRWW27SbR1lPQXQ==
X-CSE-MsgGUID: suNr37x/Sx6e+CjnZ132LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="60597658"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="60597658"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 22:29:52 -0700
X-CSE-ConnectionGUID: i9DeFzyIQwqIxYDgwwTyEA==
X-CSE-MsgGUID: 2QupgqL5SpyJtemtE3r8aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="188351121"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 22:29:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 22:29:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 22:29:50 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.73) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 22:29:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Orn139gSdBmX/0VcGUh3L3PdOwbSX0uXI03nseBQnWXSJVIMvpmbqjljziFajxoTDhIwCbZwWxmCrLBjeWXTvkswbctmrCBpxUyvma/zcBVP0B5KdOzTmHwtfDCGivTScCK640BDHn2zJFdVerLbXYA0xMg7dEnDy68aSabazlsTA1qUgWleyXBoj6DLstsx5XxwGjvWq/E4SOX4K6GBUgblDWqf73ieqonYbUENOaYPhY0wV0IutlXrUQNXjuuXjcrtWVSFBVyHDfs5zaEnlyi4LCPNNf3YWzYnyJJrra+Hlw5h9JAOPh+kZxGlaBvEyrWDNt51IRlpLnPHUe+EqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxdpRPPi0vm4+LjrWRrM5ealMD82kBSlEO4PZAUGq40=;
 b=nTydYHLe8owQrhcDxzuiaeGEaWTByhzwMJva9SmsrPUX9qaRzr3RYkdi61jNjyzHHbzFd2UMHmzPJErb40jJE8Oic4x6RGECHKuPxP2Z3sL4Wyay8D+YcV0jNkRzbxJYXOLpw+JnWamgzy7K5y/00jBXB6J8gMWRPZZQowzlPSizmK2FOAS+EfA1JyN3ywm9fH9Mx476DkR2oAoRzPLHKcibHB2Hlv6TB0R/Hl4CtDy+QLZWhG2BJdjnPi1f7p+DcIfOutl2+yWJ1VFJAjh1Wof/gdNAI82YshpyBqDLaTgIB8qZTWOEUVVEqf9U2C88B2aVGdJKNbULIm0W4qd9Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH0PR11MB5111.namprd11.prod.outlook.com
 (2603:10b6:510:3c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 05:29:47 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%7]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 05:29:47 +0000
Message-ID: <39d17ad0-964f-4771-9cdf-bc65c53524c0@intel.com>
Date: Wed, 6 Aug 2025 10:59:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/25] drm/xe/svm : Add svm ranges migration policy on
 atomic access
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-15-himal.prasad.ghimiray@intel.com>
 <aJJlPMHRsiQQmfNV@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aJJlPMHRsiQQmfNV@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::16) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH0PR11MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: 228539d2-fbfe-42a2-7624-08ddd4aa41f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akN0OE4vMlVmYlpwUzZWT3poRUJUaEUrY3ZhcTU3Q1ZmOUVobmJ5WW5seWww?=
 =?utf-8?B?TGx6R1V5ZHdkWlpaTlJZSEVrZ0Zsd1JtZUgrbTFGcFpoa2o5OXVzYVVKSDVx?=
 =?utf-8?B?ZlV3MmhBbVZpUEtJMjFocy96eVlmbFN2RktFclhkY01NalFsdjdKZVA2TG9I?=
 =?utf-8?B?WGpScEY5Zk1PcGVRT0VnRi9ha2JqenZ4Q3BXMVZVUWpFaTBsRDVyV1hiQmVK?=
 =?utf-8?B?eVNaR3E5eUtuVFFZbVdxS0p5V0lqZjRRZUhZVUtaWnk0VmhuQkg0bUN5VzBT?=
 =?utf-8?B?L3Mrb1F3MG5tZGI4aFY5dmNHaktRcThuMGVVc1A2Q2ZxbjFnWXBRbFpRU3Iv?=
 =?utf-8?B?VXJXWW5LUnBXNERqbXIveE12Qk80ODJlcDRrSnZ3eFRQRWRNTVljb0phSUto?=
 =?utf-8?B?aTByaWFlZGl6VHQ4MTJUMHY2NW1QdW56eTNkVEg2NGg1eEJ5T003STV6MG9S?=
 =?utf-8?B?d0lCWHJrZmdObmRlYnR4aWZiekgyRXFpUllYdHF3SkFVMUxpYmEyQUdJMk54?=
 =?utf-8?B?WDJNMGNvQlpDekRlZytSOXN5YUkrdHQ0Rm1Hd2VCN1NzT2pMNDZzRFFpT2Vs?=
 =?utf-8?B?OFZ4TlFieUJrelIzTlJNYVVRREx5emZXVmdiaEdMK3E1azhSZXlZc0dYcTRW?=
 =?utf-8?B?MjU2UmhqbURYOXJEaGVUUFk1ZGtRaUJPcjBIcExGTEdtL3RTUFl2M3dpclJB?=
 =?utf-8?B?ejFoRnNMZkpkS1BwUExBRUczcWgxY2RGNkt3U2tEWWRPelV0SkNycFNQbkJx?=
 =?utf-8?B?VGpaV1FCSW5EL1A4Q0hhZlN3Vit4eFBtRlFhLzhITkhscFpsaENuV1l4S2Q4?=
 =?utf-8?B?QWpXV2QxU3ZoRHNsck9tN0FnN3BqcFNKMHJVMnZjNFlaWGxDZEd6R09jdUVj?=
 =?utf-8?B?V292Y0Q2Q1FKK0o4SXpyeWhQT0w1Wi9DaFZia0JtRjVIVzdnczgvZGN5a1Vz?=
 =?utf-8?B?aytRSzc0UlJHYlJWaE8wU0pEdlRoYThzc3psWFUrMFhpR1p2TVdxcXRtK3Zi?=
 =?utf-8?B?NzkwYTlHMlFiRlgyOWxwdU0zUkpwQ29tM0haVEVsK1BsQmZlZktwOTVYMCsy?=
 =?utf-8?B?ZFZKeEdtNkdsRE5CaEY3REU4SUVobWxTQ2hiKzVTb3NuczcvVTVqZWlGdm1Q?=
 =?utf-8?B?cHlpeUd3MkhVUjFVQU1CTmhEa2ExUjlIa2xzYXRXR0thblFmemFCSlNjYWd6?=
 =?utf-8?B?MWlhd2VsY2p0YTZidENZdjVRYVVBM3Mzdy9hWDhYcWhhSjFpKzJPV1VYT005?=
 =?utf-8?B?c3JGU1VhSHprWEJnVFlWN2wwSFpzclpYRTNZK3luNXdFODFSYXlNN2J3bkRk?=
 =?utf-8?B?RDk2eUtsdG5Xd081cWRnNnlWWEZEWEZmSDBBVjZXZ21JNHBWdmwrOFdaYi9q?=
 =?utf-8?B?RGtDWXRyaENkYkttWUdqUlc5SW9lY01ORkVLMkh1WStJalU3UFAzam9FN25t?=
 =?utf-8?B?bHdkOWlXcEY3a0E0dEVIOGtNbFVmV25pTElQempxMWlxMGZrOSt3bWRsVFNV?=
 =?utf-8?B?L2UzdGNobXU0MjY5VlpNeG9RelpUelFkMGFHekowNE1KYTZxeVU1cjRrUExD?=
 =?utf-8?B?Wlpkay9mOGJ1WFdJVUFTMDFsRmFubUYrNUl1OHpvcTk3USt4QXJrSkYyeHdv?=
 =?utf-8?B?WmpOZVpIcStKaUcxNFVnOG1JWkR3WHFkWTF2V3JJYUtJZWFRWGRSLzZOZE84?=
 =?utf-8?B?OTc2L0o1N3kzdDZ5WGUzYzJZNGJaZWVMMFVKcVQ0cU9wUVFWbHBWRmZKQWpH?=
 =?utf-8?B?N0VmWXgyK1B5a0xLYzVFNDY5RnJQSkhnWEJYTHBPWEgvT0NJUXJudE0rYmhC?=
 =?utf-8?B?TTJCRWRSa2lUQkJjcFRDOXB6TnUzenY5TDVRQ2FPMmQ5YzM3NE1NWVZhRng1?=
 =?utf-8?B?cSs3WUl5U1lvM0o1TW5YbWhqMFFtTi9FemNKL3U4aVNucjNxK3YwQTVLeFRi?=
 =?utf-8?Q?cBq/dVTIsio=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzBzOXo5NVdic25sL3lLVjliNHl6VERMR2dhVWI1dDNhTFgydklsWjZQbGZI?=
 =?utf-8?B?VVE2K2FUL1IxQmQxenRLM3ptS1NPVkREWVFPdlRtbVkzZ2FwMEtoamRxdTJp?=
 =?utf-8?B?aWR2Vi9sTnlPa2hHNGdyT2FWcnRubG9GK3d5RVBuMlZscm9MVktod0dqMVVx?=
 =?utf-8?B?Y0Q3NWNUQ0NxQWFYdXBHYnBaUnROOGxGOElVckZVWTk1bkl5UW1yMTNMU3hR?=
 =?utf-8?B?MkdqY29KZDlwa1RFTDU1b0FDQmNtSHFnZXJuU0x4OCtHbFZRdGRudVIxbDlQ?=
 =?utf-8?B?N3BjQ1gxWE9tUnpNYXJhUHZJdnVkcDVSZ1hlVHA0OHdVWmtnK0hWOFJodEph?=
 =?utf-8?B?bDUwaHBiVUduOWhFWU1TMTZUUVFVMml1S1hwMjk3eTE2VXNYNndDQjBEMEpD?=
 =?utf-8?B?Unp3a0dmVTBKZ0VQTjQ2L1NQZ0I5ZFYzLzhDL0diSS9rYlNFamx6cEUwYkND?=
 =?utf-8?B?Ung2TG1rNjJYTW9xeDk2TU92cXRGY1c5TmhkSnJaYlpuaERlR0VLN1ZmT0RS?=
 =?utf-8?B?NTBrYTBGTEwrdEJLeE05VWwraTFhSmwrSkFUbGJNWE9UU2dLUFEvMWx0UEIx?=
 =?utf-8?B?bStSMkhiampmSE5qY2VITWd5MlFxYkxZZUlpenZkN01tWXR1OG54NXpwZzQ3?=
 =?utf-8?B?aGcwSnZib0loNjRkY0ZPNjg4ZE1RNmJNUlZHN1VNN3F1b1RlazVGWmZPa0Iv?=
 =?utf-8?B?OC83SG1lNXcwbFBWRi9SQ0FDZVB3ZHdsS3lRcU9vZFBDSS9vcUtaeDhYWFZX?=
 =?utf-8?B?YlJVR2l1b3VSQ0tBK056NFZ2WEJOaGNkWjhzejU5SEV4WnJGSERqOGxPVEVr?=
 =?utf-8?B?aWcwVFAzRTdHN2kwUEsrR2tSNE12aGJsKzNER21qS2tWZVl3Mk5nWUE5dnp5?=
 =?utf-8?B?QnZsZlpMUnJtZGlyN3NjL2l2eTJjTy83Z0E1NGs0VDZ6ZFZ1cFM0MHZvYXhm?=
 =?utf-8?B?MjNlV0c4RWs1QXNUMW5EcHpIVTBnMzlWQTllR0MxQXpKdHRIQjE3dDJwYTFi?=
 =?utf-8?B?bGVXK2EwRmRMajBzaHdSYlVpZkVvWE5BVXRON2QxTDZrcjBwRDBLSHFYWFhx?=
 =?utf-8?B?WXQrenV4Ris2TWdWK0hVQm1iOTJCWEZKbWx4dnAvd1U0RGF2Vm9UU2k5a3R2?=
 =?utf-8?B?blk0QzdPNmpjVDZLQnpBOFNycmFOS3NiTWs4M3pxdDd6YVZwTTFxdmpKYWFT?=
 =?utf-8?B?U3FUT2RmN2tKU05VdjRvciswS1BRU1kwenJGYmVYck5COFhLT3RXczNnMitE?=
 =?utf-8?B?QWlhOEhoTmFQWE5UbXRqbzFwMDZPcEZ2MTA4QlRYV0R1MlR3RUduM3lkamxM?=
 =?utf-8?B?YUdlWXJPVUVQeXk3cFB5andBOHZEdVV6RWhaVUhpVU9BbUVoNG5ueGx5ejJm?=
 =?utf-8?B?cUpWMjVnRis5RVZsMjhMcDA1QnQxdzdKbjNIKzRLRmc2TE1tN2szKzluVWc3?=
 =?utf-8?B?OU54NVB1ZmR0OTNOWWdMSW9mMXVDbCt1RzA5TU03M2tkKzB0b3ZPODFWL3U4?=
 =?utf-8?B?UmZETXVzem94TzVERjYzME9oU2hHWDk5TWhjMWVOVVI4b1EyeWR0dk9ZQjl3?=
 =?utf-8?B?T2JIa0orYS9DdldsK1JCdG9HWXJZQlpNdjRCVkk2MkdzN3h6YWhYby9RZi9u?=
 =?utf-8?B?WEJsRjZOb1dheG10eklXSUd4QXN6VjhSNW8yZWJPMXIxcXVZV0VkbG5CRjJl?=
 =?utf-8?B?UzV0MkdSWVJHOGJRMnorVHI5M20zbm9zSW1Rbk5BZzN1bDJYa3NhRTBna0wz?=
 =?utf-8?B?Rzd1WkpveDFuNmdSZTdRNEhjVzFFSEJwYVJ3OC9US2l3c29qYnBZQTdUZDVT?=
 =?utf-8?B?M2ROQ1UxUzhtenlmSHZKemd3MnZvNUF6UVczLzVtNk5xNjBWaCt3Z295a3Qz?=
 =?utf-8?B?TWN4bzVLaWsxNVNoTC9FcFdsWm1oZVRteGIwbDZ3SHNoaURqZHpCWUlwWGFp?=
 =?utf-8?B?WE1meU14Tk5JekY4aDlwcnFoYUV0cFFQUTV6eTJyWlVBR0crMVZLaHZjaE1a?=
 =?utf-8?B?NW82UUNTbzdLRndXNVRNK2wrZklGOCtmL3hsRTRNQkZSb29YUkVzai9JRXZI?=
 =?utf-8?B?NXVBcTYrakdKc0VYRG9zeVY2U2xJcjY1bzdpMzcvNEZTbDFnVktYOVpzb0NC?=
 =?utf-8?B?TFVyUE1hQ0s0OTZ0SENEVWt6VDB0b3FwWDZUekgzL1lJbzNBZzd2QnUyOC9B?=
 =?utf-8?Q?B/qeNMrt07J/cCYcp0zm2Es=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 228539d2-fbfe-42a2-7624-08ddd4aa41f8
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 05:29:47.6145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifxb7VBIhgqrkEYot6Nmze+jYtPSrd+qAIGbAxUzYuJOq2ZxdIjiJ8sMMdoxp3aMhjTGBCX7MYjmgh/M7gtDl9Y8nB9v3LJZ8MRORq5komA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5111
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



On 06-08-2025 01:40, Matthew Brost wrote:
> On Wed, Jul 30, 2025 at 06:30:39PM +0530, Himal Prasad Ghimiray wrote:
>> If the platform does not support atomic access on system memory, and the
>> ranges are in system memory, but the user requires atomic accesses on
>> the VMA, then migrate the ranges to VRAM. Apply this policy for prefetch
>> operations as well.
>>
>> v2
>> - Drop unnecessary vm_dbg
>>
>> v3 (Matthew Brost)
>> - fix atomic policy
>> - prefetch shouldn't have any impact of atomic
>> - bo can be accessed from vma, avoid duplicate parameter
>>
>> v4 (Matthew Brost)
>> - Remove TODO comment
>> - Fix comment
>> - Dont allow gpu atomic ops when user is setting atomic attr as CPU
>>
>> v5 (Matthew Brost)
>> - Fix atomic checks
>> - Add userptr checks
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c         | 23 ++++++++++--------
>>   drivers/gpu/drm/xe/xe_svm.c        |  8 ++++--
>>   drivers/gpu/drm/xe/xe_vm.c         | 39 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_vm.h         |  2 ++
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 15 +++++++++++-
>>   5 files changed, 74 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 593fef438cd8..6f5b384991cd 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -640,28 +640,31 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>>    *    - In all other cases device atomics will be disabled with AE=0 until an application
>>    *      request differently using a ioctl like madvise.
>>    */
>> -static bool xe_atomic_for_vram(struct xe_vm *vm)
>> +static bool xe_atomic_for_vram(struct xe_vm *vm, struct xe_vma *vma)
>>   {
>> +	if (vma->attr.atomic_access == DRM_XE_ATOMIC_CPU)
>> +		return false;
>> +
>>   	return true;
>>   }
>>   
>> -static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
>> +static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_vma *vma)
>>   {
>>   	struct xe_device *xe = vm->xe;
>> +	struct xe_bo *bo = xe_vma_bo(vma);
>>   
>> -	if (!xe->info.has_device_atomics_on_smem)
>> +	if (!xe->info.has_device_atomics_on_smem ||
>> +	    vma->attr.atomic_access == DRM_XE_ATOMIC_CPU)
>>   		return false;
>>   
>> +	if (vma->attr.atomic_access == DRM_XE_ATOMIC_DEVICE)
>> +		return true;
>> +
>>   	/*
>>   	 * If a SMEM+LMEM allocation is backed by SMEM, a device
>>   	 * atomics will cause a gpu page fault and which then
>>   	 * gets migrated to LMEM, bind such allocations with
>>   	 * device atomics enabled.
>> -	 *
>> -	 * TODO: Revisit this. Perhaps add something like a
>> -	 * fault_on_atomics_in_system UAPI flag.
>> -	 * Note that this also prohibits GPU atomics in LR mode for
>> -	 * userptr and system memory on DGFX.
>>   	 */
>>   	return (!IS_DGFX(xe) || (!xe_vm_in_lr_mode(vm) ||
>>   				 (bo && xe_bo_has_single_placement(bo))));
>> @@ -744,8 +747,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>   		goto walk_pt;
>>   
>>   	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
>> -		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
>> -		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
>> +		xe_walk.default_vram_pte = xe_atomic_for_vram(vm, vma) ? XE_USM_PPGTT_PTE_AE : 0;
>> +		xe_walk.default_system_pte = xe_atomic_for_system(vm, vma) ?
>>   			XE_USM_PPGTT_PTE_AE : 0;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 1d0b444bf2ae..5e78beebe114 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -793,14 +793,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   			    struct xe_gt *gt, u64 fault_addr,
>>   			    bool atomic)
>>   {
>> +	int need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
>> +
>> +	if (need_vram < 0)
>> +		return need_vram;
>> +
>>   	struct drm_gpusvm_ctx ctx = {
>>   		.read_only = xe_vma_read_only(vma),
>>   		.devmem_possible = IS_DGFX(vm->xe) &&
>>   			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>>   		.check_pages_threshold = IS_DGFX(vm->xe) &&
>>   			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
>> -		.devmem_only = atomic && IS_DGFX(vm->xe) &&
>> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>> +		.devmem_only = need_vram && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>>   		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
>>   			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
>>   			vm->xe->atomic_svm_timeslice_ms : 0,
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index d039779412b3..463736db19d9 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -4183,6 +4183,45 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>>   	kvfree(snap);
>>   }
>>   
>> +/**
>> + * xe_vma_need_vram_for_atomic - Check if VMA needs VRAM migration for atomic operations
>> + * @xe: Pointer to the XE device structure
>> + * @vma: Pointer to the virtual memory area (VMA) structure
>> + * @is_atomic: In pagefault path and atomic operation
>> + *
>> + * This function determines whether the given VMA needs to be migrated to
>> + * VRAM in order to do atomic GPU operation.
>> + *
>> + * Return:
>> + *   1        - Migration to VRAM is required
>> + *   0        - Migration is not required
>> + *   -EINVAL  - Invalid access for atomic memory attr
> 
> Also how about -EACCES here?
> 
> Matt

Sure

> 
>> + *
>> + */
>> +int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic)
>> +{
>> +	if (!IS_DGFX(xe) || !is_atomic)
>> +		return 0;
>> +
>> +	/*
>> +	 * NOTE: The checks implemented here are platform-specific. For
>> +	 * instance, on a device supporting CXL atomics, these would ideally
>> +	 * work universally without additional handling.
>> +	 */
>> +	switch (vma->attr.atomic_access) {
>> +	case DRM_XE_ATOMIC_DEVICE:
>> +		return !xe->info.has_device_atomics_on_smem;
>> +
>> +	case DRM_XE_ATOMIC_CPU:
>> +		return -EINVAL;
>> +
>> +	case DRM_XE_ATOMIC_UNDEFINED:
>> +	case DRM_XE_ATOMIC_GLOBAL:
>> +	default:
>> +		return 1;
>> +	}
>> +}
>> +
>>   /**
>>    * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
>>    * @vm: Pointer to the xe_vm structure
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index 0d6b08cc4163..05ac3118d9f4 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>>   
>>   struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
>>   
>> +int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
>> +
>>   int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index b861c3349b0a..a53b63dd603d 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -85,7 +85,20 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>>   			   struct xe_vma **vmas, int num_vmas,
>>   			   struct drm_xe_madvise *op)
>>   {
>> -	/* Implementation pending */
>> +	int i;
>> +
>> +	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC);
>> +	xe_assert(vm->xe, op->atomic.val <= DRM_XE_ATOMIC_CPU);
>> +
>> +	for (i = 0; i < num_vmas; i++) {
>> +		if (xe_vma_is_userptr(vmas[i])) {
>> +			if (!(op->atomic.val == DRM_XE_ATOMIC_DEVICE &&
>> +			      xe->info.has_device_atomics_on_smem))
>> +				continue;
>> +		}
>> +		vmas[i]->attr.atomic_access = op->atomic.val;
>> +	/*TODO: handle bo backed vmas */
>> +	}
>>   }
>>   
>>   static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>> -- 
>> 2.34.1
>>

