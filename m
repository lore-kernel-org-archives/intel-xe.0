Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1CBC5B543
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 04:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7B710E465;
	Tue, 10 Jun 2025 04:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWbmvY9j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7AE10E258
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 04:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749529994; x=1781065994;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NUm8PuZNYM/dlzHPW50HS9KHk1tPQAWFkhveH4Ne04I=;
 b=WWbmvY9juZE8ss1Ltn2OzPTtCu1Q6VQPFvDcRIFQn8VFCB1kQeBCj+O3
 FW1uTtSrejkNru008F9mJLEN3CQWZMDvk8EqO58VlzZTNwlgPMlBZc1Fq
 8/do1c9EZVWyVmt5tE5zUEMgST3G6vhdjA+TocoR7DGlOvvDeIQSCLdjl
 DvECdNP0X/g4p1mL5z3szWpaIjyEZH2dG0nCALyVt9sc+7/QhVvCpPXJv
 fGzVRlY+Zwfazmka1QfKhxFuHjhhWVsjX+VlBN5kAHHrmEjZNgyjmAAmB
 QNgpfYJ+dkLFZxeQsqlS7rzlU+7JYcDiXCR6EdmrZVPsvhPaeGhfZtl92 g==;
X-CSE-ConnectionGUID: iGaEiKquT+avokKg7FDRkA==
X-CSE-MsgGUID: OZteGMJfRyOeRKky02BRow==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="77022681"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="77022681"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 21:33:13 -0700
X-CSE-ConnectionGUID: 2QSFtnyERe6LBUwZmAY7WA==
X-CSE-MsgGUID: 6YuI1ZrHRuSAc4MXg71jYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="177650988"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 21:33:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 21:33:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 21:33:13 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.82)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 21:33:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXCVK/z4J04bNGWPWi4f/F3IDgfskym4XAtBb0s3BeY714HWmccqp8MgDGdjfOR3pNa7ndaqw24o03SQI+hCDv/wTixlGbJ7x1ZGVSbdLHAVDZbX8xiBj3l7c51cw2JBWVI621n/HJo4vFB5LCi04a7o42Ilai0WRAMiJlPpIUhEjqlyVVGxdSHDTwK1puCpBFJ5ugqET0cFqffWq9lBMwCjktU79o19pBu9B3VjTip6aSBJK8hLbPmL037WmEs3517EremSkWHwTyj3XwWSRk5v1qUWW7MSOD/W3AxVgcekxsQyp3/Xk5/HABSdtlUi/O8PCteGVQhWxPIL9SuAhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YC5j8rDerVGzpS//IkURFfqSy80sKZRLD2AI0cguTJ8=;
 b=gLh4eHU9x8+0rcJer00SjHludcdwCmKankH8Vd53iVJtwx+yiFLsIHaKmtELyjwQh+xDTk4jN1TAuDB/o3Ui8SU1vpLQ9SzV6qDGJCJEq+zHJRvnKPJNY/CQbicaKN4+lft/7ttAb+GtYfPhBsrmJRPipkn45vehHsF82fJaSVAFZwIQEL+/77ZliHVSfdlgC19gjfLcb7eyfZdPQwkf3uSjpWbecC75clEeP8xf7ogR2Flb942izYaOgQp61CtO1nCI7oEqI7HFbtwfOQkbAraVktsvYPuaS/RBkNKKsOcoLDU1xtGBip0/x/th3PwHE8128hLsUf+4jHJSv7c4Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SJ2PR11MB8588.namprd11.prod.outlook.com
 (2603:10b6:a03:56c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Tue, 10 Jun
 2025 04:32:29 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:32:29 +0000
Message-ID: <cf24e905-14c4-4c56-b437-1d9e733dafc8@intel.com>
Date: Tue, 10 Jun 2025 10:02:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/19] drm/xe/uapi: Add madvise interface
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-3-himal.prasad.ghimiray@intel.com>
 <aDig2SBgYWmgglcK@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aDig2SBgYWmgglcK@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::23) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SJ2PR11MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff5fd12-15be-47a6-d1b3-08dda7d7cee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nk5aVVI2a2pxampkVnEzZVl1YVFldDl2WjBsdGtOSWVPVlVYVFpDZjlsMnYv?=
 =?utf-8?B?SVVkSzYxbDlQK3R0WFhzZ0dPQjVLTFV5eElXc3diUEdFZUxEZk9iTXpoNnNp?=
 =?utf-8?B?RVZrSlFRa0xBUXVOYzBYRUNraGRPV1kxNHRYdk4zQ1VGMlNxOTl1NDFDbW1N?=
 =?utf-8?B?ZVJBd0hPSk5mcjBSUmFpQ1JrWmpmZW9TS0F2NDJCQkEvQ2tMU21KMG5TVkQ1?=
 =?utf-8?B?aEJWZlFNREJralpGR2hwQWxRbnorT3V0anUwS3ZpQWVrSmhleFlNaUI1bTdF?=
 =?utf-8?B?eFdCVk1VV0V4elI4WTlVUDAxQ2k2bU9NQzRLZmlSYlZDZzF0d3V4TjlyaE5q?=
 =?utf-8?B?NWJGdmdFYXdnZ2VQWnBkaUF0eUlkSU9oUHhwMldJeHVVRkRSTm04WFpFNzJx?=
 =?utf-8?B?VTd5S1dDczV6Q0xTYU1vQk9FUVNTUUZlQWhQL2VKUklDTWdETitqUjlOVkVZ?=
 =?utf-8?B?VG5DaVVwNFgzbVYvSWxHd0RyWldYSlF3ckRIWFUrb255a1pGKzNHWENnVHpN?=
 =?utf-8?B?c0J4QWkzUXV6ZlFmbTd4T0VNRXBDMU15WU9FVVUzcjcxbzBYMXdDVEdLZ1cv?=
 =?utf-8?B?RTZ3TldMdjkzZVV3dVI0cVNrWjFKK3ZqeHBQcVI2VUIzendiYmpNK0tybktj?=
 =?utf-8?B?OWREZGtEWVNxUnFQQ2VCaGxVYlZkdFVYaWRKMzVFNEdQS25HcFZralNPVDhV?=
 =?utf-8?B?dUZNVjZQRzVWSkQzbUxUSWVOQi9OT3hNNkcvV1JPcE8veG5ITVNjbU4wZ2Q4?=
 =?utf-8?B?Z2dFQUovRUdqTEQ2dlVMQXdSQjBSdTB2UUxHNVFBVWtYbFExaUNrM3FTS1E4?=
 =?utf-8?B?ZlFvbGNwMENYNzhWSzVWamUyTVdOMXF6ZWtwcDJEZmJjQmZwcXJUQ1hHODg2?=
 =?utf-8?B?MTJsYm12TjIyMWl0ZDY0dzd3K2JwdllVMThFWkVaTkozZVVtbmVyaURJc3VF?=
 =?utf-8?B?RnhYYWxNYUlwaFh4MTBmUTBWSkZ3RW03MUhzdHJneXRkd09VOG8yZ3NndHRq?=
 =?utf-8?B?dmZabitnYVdWNkVGTHJuVmgwUE9mNUJWNU02anJVejZIaDFtdFk4a0Y4TldV?=
 =?utf-8?B?dWtVa3dJMzZFd0g4M2c4cnpzNXd3bjc4M2ZYMmJrdDNoRTB1U05QS1R5emc2?=
 =?utf-8?B?SHl3emlPd095UUYyWVZxZmhRYWFwUUN2dTBvc1o2cDJUcUxmWDQ2SjUxUXFn?=
 =?utf-8?B?V2dvZlp2dStzNW1MU3I4UFJtd2Z4cUxFZ2pOblFpR3BVbkd3SXdnaG4zYlNk?=
 =?utf-8?B?QUFNZTBRR09GU3l0TUJ2cU04Y0FqQkViUzFLQ1llZHl2Y2VSTUgvM3p2TjlW?=
 =?utf-8?B?OTd6bXpoZEhRSzc1Snp3MXpQbktDajVGaU1VOUV5eGJxTWg0aUYxMFFnUkww?=
 =?utf-8?B?NXJZUTFOc242a3E2YVNrREI4UFZlNFNqZVZtbE9pY3BkMWJSaXM1YU5mcEQv?=
 =?utf-8?B?U1NxdkhyRHVWanlvcE1XeVVKcXU4TnEzbUtvMGlvdTB2bjcxNmVaYmJuRUNT?=
 =?utf-8?B?b3JZZTBlelV2dnJWM0c1eUtyZWlSTmRpNDA2TWN6R3BFQ3VoZkVSYmVkNGg0?=
 =?utf-8?B?YVFJZzFVVHJQd1phZjNtbFA3RDBKN29YdDdCaWE1dXJmVzdLd3ByRGxhQWpR?=
 =?utf-8?B?L000enI2YnBCRkZldGJ4amtSbEU3czdmaDIwN3VXUm5FOHJLdEpQZHdUSGY0?=
 =?utf-8?B?TlRzUndnSG1FNlEwRkFoUzR5VFEyZFBlMjdTMjBiWkdCN0llVG1vYlRoYkwz?=
 =?utf-8?B?RXMyZGVFTmtSVkM1N1hQWDZpWk5DR0toU1F0N0VSKzB2S0dCOHZYd05aOXdB?=
 =?utf-8?B?R3JSN1dKR1dtMllvQWVuNjBuS3plaWxYbStKSHZYckgvbE5rVUhDMVh1cG5k?=
 =?utf-8?B?YWFGUnVzeGx1cnBVWWxDL0U5VjVnYkIvVnRsMVcxMjFmL3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rnh0SGVhK1FkRjFaZVNxMHlxNmxmSVFodkRLRzBEVTYxMXhhUWlrTGVWQlhX?=
 =?utf-8?B?b3d5N21BRWRVbkxCaFlrTnZVcGF2R05OcnEvNDc3RE1rUlZIMFlyNjUzZVYz?=
 =?utf-8?B?QkdFRHQrRUFWVjNRVHF6S0JLWTVwMVJFL0krWTBwekEra1I0Q3I3a1NvWUpv?=
 =?utf-8?B?WllWNmpTVFQ4UkJTdUczOUt3QytpM1VsY0FINVJvNlNaMFFXZ0ZHdXBEendD?=
 =?utf-8?B?Ti9KYnBLbVJCZ0N1ZFJVSHBHVG04NWJ6T3VSd2Vsa0NJSDVqRDhCUUxhL0Rm?=
 =?utf-8?B?c0h3SExQeWFKbXE1a0ViUFJueDJqTmIzUUNJM1dGN3BlNGdTaHlhQVNCSTNL?=
 =?utf-8?B?dE5oNkpMcVBmZHVlcFI4SVhOVSsxN0Y2bENENnVZMlhnMGNmOStnMCtQUS9o?=
 =?utf-8?B?dDYyeGgrQVpzWmdXQ1UwNVNCa2V0cjlIK0w5cnJCd084aHpkYW0vaFByeUJh?=
 =?utf-8?B?Z3FYMHAzU2JSWkFaekJCbG5FM2FmTkxlTmVFYmlQZklzenR4a0JRekV0TlZO?=
 =?utf-8?B?SExGc2tPdUhuRUJHRWNzZkhiYjVDNkxidmV2SEx5RHBtYUhjcXVEOUtYbS90?=
 =?utf-8?B?TkU5c3dLMTF6YllrU3k3RldoRDM4NnN4R1ZFNS9GSTNWekpmVjErTEtSM01H?=
 =?utf-8?B?ajAzODgxS3ppck04UnpneHhyQVFMMStrZHQrV3BHL0MrbGN4d0lRR2NoOHRz?=
 =?utf-8?B?Ukp3SUdzUHF6N2VHRnJQRFRVNmh4a3NLOUZhMHd4SjUxSmhKNUV2dlhqOVpD?=
 =?utf-8?B?YUlML2xqdGZTUi83ckRFYlhVNU9BRGtDcFloSEg0Y21xUFJaaXo4Z0Z1eDho?=
 =?utf-8?B?K2Q2bDlQa2xNb3ZtRUhZMU9MZWk0ODlDOGpMYlZzQlVOWTMxTk1YVTVkV0Rx?=
 =?utf-8?B?dHV1Yk9ZTURlZml2Y1JmYVMxU2pwblJkcGU5UE81MDZ1THRvVUFoV3p2bjJt?=
 =?utf-8?B?NHI3RzI1QWlJR0FzdllNNngvbDBSQWlvcVRZY2dPODR6ZmtBVGVLVFlHOGZP?=
 =?utf-8?B?eUxnOGx5RkxvNkxCcEwrdm42YjVaV3VJd0Z5NEQweDZlTnJwbXoxMTh6R1pB?=
 =?utf-8?B?V2FwNU94aHFUWnBlY2xVYk04YnZZc1ZsU2Q1cUpON2tabjVhVFZhdVAxM2Yw?=
 =?utf-8?B?cjYzK3JRWVFlNktISEdEQWFHcTNZTDlZYnRUNDQxb3JiMWRMTlY5Mm1ZanhE?=
 =?utf-8?B?eHZRKzVDd05kZ3BDQk9TZ1BXZ0VjZU9SdFI3SzFCRzlLZUpYSzZOeHNHUDRm?=
 =?utf-8?B?TS9qdEZpSzNnWER3WGVEUnNyNkljUTVaMG5NL2xlT2V4QzA2R0FTY3ZDcWdi?=
 =?utf-8?B?YThHMFdQVUdGbkNWandBVFluYU9iNCtSRStpZmtTMVduZHlQSmV2bnFEUk15?=
 =?utf-8?B?SUdhVWxoSzRWS0JlaDB0akJMVnpXYzhSbWpaYUprZUhYWnBIT0M0aXhzT2hM?=
 =?utf-8?B?OFRkSlBRU3huUnl0dGVyQlg1UzQvZXBzV3BYdUVxcWVVR09scnlzb1NCVVBD?=
 =?utf-8?B?RU15QXpDZm4rTmg0Y2xlTFFsdENsWnJPc0poMFVNMzFGSTZ0ZlBEdmpHMG95?=
 =?utf-8?B?MXQ1MVF3U1J5MEYyQUd5YkF5S0YrMzlSKzBidnlIQjBtak8vVk5vVkxMUWpG?=
 =?utf-8?B?SDVvckRyU0dNTm5pN1JZUDZNWnRNeXZmVG9jV21yaFFSeHM1ajJ2RnpNSzRl?=
 =?utf-8?B?RzhZbTl1R25vblR6WVgyMVBBSlI0ZHhHb3RIdDNTR3lUNkhDSW92UlJQRGQz?=
 =?utf-8?B?NjdrOWNaNzhmd0hzK3pDdWNtc1hXNXh4eUJqQU1BWlc2NHFmc25tdlBkWEhZ?=
 =?utf-8?B?ek1Pbm91VWdKdGNzS3JURzFTTVdzQk1xR1kzdDhJalFySHRGOXQvS3Z4MC9w?=
 =?utf-8?B?SXBwWllGYzgvTDM5b3hzeFo0dG0vUDFnOStnZEVjMlMwd0I5bG5YZTg5WkRH?=
 =?utf-8?B?bFFDMGhoR3l5MFBqV01IdGpJNm1qdmo4dlA0dHljUEpjQlBveDRKYTRHUVhJ?=
 =?utf-8?B?SHV4Q3BjYU50V3FrU3Q2cDhDVWh5OTlaV3FNTEZKdk9BWFduR2VaVW1iWTda?=
 =?utf-8?B?c1JFTHhwQnlvclNVNmJOOCtoWlVzSm9aSFNPSTQwbHZ5K2g5Q0lOSzkvM0oz?=
 =?utf-8?B?dzhyaS9qYWN1ZmdmSXdUcGJmSXBMSUM4SGF3aFUvYlgxcnZmbG1GRGNMV0JK?=
 =?utf-8?Q?vwong94DGytINYvJ/IN6kWM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff5fd12-15be-47a6-d1b3-08dda7d7cee8
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:32:29.0750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: undJ/u2Kb8y58tyiw1zMyU0Iola7E20YjDM9xaF3NnNV+59zCMWePD2V8xcyqZOQHFftUt9m3DNwHV/8h9SExxS3NNzNdNqzgMzIj1zs8Pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
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



On 29-05-2025 23:30, Matthew Brost wrote:
> On Tue, May 27, 2025 at 10:09:46PM +0530, Himal Prasad Ghimiray wrote:
>> This commit introduces a new madvise interface to support
>> driver-specific ioctl operations. The madvise interface allows for more
>> efficient memory management by providing hints to the driver about the
>> expected memory usage and pte update policy for gpuvma.
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   include/uapi/drm/xe_drm.h | 97 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 97 insertions(+)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 9c08738c3b91..e0d75226a724 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -81,6 +81,7 @@ extern "C" {
>>    *  - &DRM_IOCTL_XE_EXEC
>>    *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>>    *  - &DRM_IOCTL_XE_OBSERVATION
>> + *  - &DRM_IOCTL_XE_MADVISE
>>    */
>>   
>>   /*
>> @@ -102,6 +103,7 @@ extern "C" {
>>   #define DRM_XE_EXEC			0x09
>>   #define DRM_XE_WAIT_USER_FENCE		0x0a
>>   #define DRM_XE_OBSERVATION		0x0b
>> +#define DRM_XE_MADVISE			0x0c
>>   
>>   /* Must be kept compact -- no holes */
>>   
>> @@ -117,6 +119,7 @@ extern "C" {
>>   #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>>   #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>>   #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>> +#define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
> 
> Missed this in prior review - DRM_IOW as I don't think madvise returns
> any values to user space, does it?

true. DRM_IOW is sufficient.

> 
> Matt
> 
>>   
>>   /**
>>    * DOC: Xe IOCTL Extensions
>> @@ -1965,6 +1968,100 @@ struct drm_xe_query_eu_stall {
>>   	__u64 sampling_rates[];
>>   };
>>   
>> +struct drm_xe_madvise_ops {
>> +	/** @start: start of the virtual address range */
>> +	__u64 start;
>> +
>> +	/** @size: size of the virtual address range */
>> +	__u64 range;
>> +
>> +#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
>> +#define DRM_XE_VMA_ATTR_ATOMIC		1
>> +#define DRM_XE_VMA_ATTR_PAT		2
>> +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE	3
>> +	/** @type: type of attribute */
>> +	__u32 type;
>> +
>> +	/** @pad: MBZ */
>> +	__u32 pad;
>> +
>> +	union {
>> +		struct {
>> +#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
>> +#define DRM_XE_VMA_ATOMIC_DEVICE	1
>> +#define DRM_XE_VMA_ATOMIC_GLOBAL	2
>> +#define DRM_XE_VMA_ATOMIC_CPU		3
>> +		/** @val: value of atomic operation*/
>> +			__u32 val;
>> +
>> +		/** @reserved: Reserved */
>> +			__u32 reserved;
>> +		} atomic;
>> +
>> +		struct {
>> +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
>> +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
>> +#define DRM_XE_VMA_PURGEABLE_STATE_PURGED	2
>> +		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
>> +			__u32 val;
>> +
>> +		/** @reserved: Reserved */
>> +			__u32 reserved;
>> +		} purge_state_val;
>> +
>> +		struct {
>> +			/** @pat_index */
>> +			__u32 val;
>> +
>> +			/** @reserved: Reserved */
>> +			__u32 reserved;
>> +		} pat_index;
>> +#define DRM_XE_PREFERRED_LOC_DEFAULT_DEVMEM_FD 0
>> +		/** @preferred_mem_loc: preferred memory location */
>> +		struct {
>> +			__u32 devmem_fd;
>> +
>> +#define MIGRATE_ALL_PAGES 0
>> +#define MIGRATE_ONLY_SYSTEM_PAGES 1
>> +			__u32 migration_policy;
>> +		} preferred_mem_loc;
>> +	};
>> +
>> +	/** @reserved: Reserved */
>> +	__u64 reserved[2];
>> +};
>> +
>> +/**
>> + * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
>> + *
>> + * Set memory attributes to a virtual address range
>> + */
>> +struct drm_xe_madvise {
>> +	/** @extensions: Pointer to the first extension struct, if any */
>> +	__u64 extensions;
>> +
>> +	/** @vm_id: vm_id of the virtual range */
>> +	__u32 vm_id;
>> +
>> +	/** @num_ops: number of madvises in ioctl */
>> +	__u32 num_ops;
>> +
>> +	union {
>> +		/** @ops: used if num_ops == 1 */
>> +		struct drm_xe_madvise_ops ops;
>> +
>> +		/**
>> +		 * @vector_of_ops: userptr to array of struct
>> +		 * drm_xe_vm_madvise_op if num_ops > 1
>> +		 */
>> +		__u64 vector_of_ops;
>> +	};
>> +
>> +	/** @reserved: Reserved */
>> +	__u64 reserved[2];
>> +
>> +};
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
>> -- 
>> 2.34.1
>>

