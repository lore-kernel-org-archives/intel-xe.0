Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D493C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 18:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6904898F5;
	Thu, 12 Jun 2025 18:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qb5Ytdho";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B7C898F5
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 18:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749752809; x=1781288809;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=78gS25oM5tlB+Z/6HQ52DRnzu3f0xQWKCYm2PWdX+Jk=;
 b=Qb5YtdhoEo7ZZ5//tuwbeHZhavWGGGYcRTGMnvPhhAyUk5ie7dpTn5YW
 scKOYEsQ94tXm72RCtpUY8a6KxpntGwuZCHkZu6X+GDatcsZchMtpTekn
 mteEMJTfjb1Ete2zhl1y7nMmqGgyQRRfdLLND/P5PvsrCADNQWavaEtqJ
 ZuD7ahL6mxgBdPtvb8c4nPPJ4lrEqNpCJGolr7ioK9YIAQvA51E4omo9M
 sNA+8tD5aDT8WyYXsX1nbgOw7BPkeKRUXF4+xrg2CuPM7WEDOxPbXrPvL
 5dsu2RM/Y7EPDQwpvU89/VNxBJHOcY64gRdt9RwvCY7FeEH3dQRxgXmbe A==;
X-CSE-ConnectionGUID: As42mqtwRtevUwC7sEB+AA==
X-CSE-MsgGUID: IIO/UlgMRVK/RnOJxJY9Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63297735"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="63297735"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:26:49 -0700
X-CSE-ConnectionGUID: Rq5txBpTReS4rRyAEq2i4g==
X-CSE-MsgGUID: bJmVsmHVSkCTOMrbiW0PiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="147436606"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:26:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:26:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 11:26:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:26:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3pbjvvC4Gv+gs2jzkb5zOj/Lkhp5zQ+2T+GNOfGMIyMtz5QYrgTGiLuVTCgdvj+EjUrVR56dUZn+Q5ZXUSOZDQQRavEt37HG548JnS4hOIu1QN5WN9dzxk6wXqAaSnt8yJD4bQBiTacOjP4ePKElHbU4SVkZFFeywUcEKqR6vtl/xD8Mh662LRzJfI1lXMHqi2jsFTv13f6H2PTjivVllg/gNwmYxV6HVSC8MddfIHbABoA5aW+srf0GEINV5QruvbhDnh0uIaOpfb/OP5zDGH8yclcSATrQM/9M3Y+Ob2VIPv/ZHpJ/FRGmhu0C7EOT50hbNdtGYXqO3KVvvW/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WiIrmTF4BwAj+S/MPezcI9MaszdPJu2BYl0iR8PTxI=;
 b=DptDUxr5JRvh3ybL2tiEDOGobdSf5Ti2B/HTPVV9dMD2W8qH46aXGcbN6Bn0JZ3i9xNO6eM2Tu4BBtIAA1wgnj0Z2ngS0DyUfdOsw31fwsBUbixexVs2bGCVTqmBZOZccFOZOIrwxmFzZw525FPG2qzGEqk5dEjDSjIKBzXLlJLBTZjeFilxE8u0M8FLOoOBGOZz3MfhlXVEbWDl8G1DLn8EQzGCfL0Qda6ckNF7sIJ5xkxpTZsHta6FbjIFeyvzG1qRRORovAt7sXBHEzI34BSEu4aewTzHVmIqUHP/R9nl3CBbkdQaYjN7Kn3crGpk74KGfhnaoCVtln9vfuzoaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB7277.namprd11.prod.outlook.com (2603:10b6:8:10b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Thu, 12 Jun
 2025 18:26:44 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 18:26:44 +0000
Message-ID: <b18ef656-adf9-4880-8839-c3484fe6ee8b@intel.com>
Date: Thu, 12 Jun 2025 11:26:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Annotate default for guc_log_level param
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Mrozek <michal.mrozek@intel.com>
References: <20250612-guc-log-level-v1-0-51f124a3be6d@intel.com>
 <20250612-guc-log-level-v1-2-51f124a3be6d@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250612-guc-log-level-v1-2-51f124a3be6d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0167.namprd04.prod.outlook.com
 (2603:10b6:303:85::22) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d50c4d3-0082-4235-f829-08dda9deaef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnlsZERjdmVuQ28xVTRUTFVITTVITzlWSGhPd0o4SnZ4UkJRTlVlV1dEMUgx?=
 =?utf-8?B?YWpPU29xOFFMVUV1TWJOakxyNWlPTmlpZlFaRzV5MmFSN1dQaDZ1N2VZTlUv?=
 =?utf-8?B?dVNpd0J3ZHQ2ZkdranIyNGlaOGR2ZWJSejVWUmxON1pkTU56TWJCLzg4RmRt?=
 =?utf-8?B?S1pCR0FBTmEvQUpEZTFTbzZxVnJHbzRJcVlLQlIwN1FiOGgwNllucFp1Qk5n?=
 =?utf-8?B?aE5CS0xkTEgvamFhNmNyb0k1Vm95dG1RblVGcE5hcForZnJ6V21mSmQ4OEtD?=
 =?utf-8?B?OEpIOTNtanQzWGRaNU1sOW1tMHMvZmd6WDhGbjBldWwvR1FmcUVJeDNZWnFO?=
 =?utf-8?B?Ym0rVEw4K2xNRmpIeW5tY0xGaFZpQTVsWWRpNEdKQkxXdjZSTzVGSVhaM3JD?=
 =?utf-8?B?eXdhT3ZVNDZVYjFFVEliYmhzNXprRXNLQ2ZNMDJFRXFOcHRTVDZVNTVFellv?=
 =?utf-8?B?TU1oR0RvVmg3SjBqVE1UWVNjcGYzNU9iRENUYzZBOHBPclZwczg5QXppc1dI?=
 =?utf-8?B?RjlLaDluUDVObzJoT2JCQy9jMGxHMmVzOHAxSkV1dGJ6d0J3MWRpSkFLa1Uz?=
 =?utf-8?B?NzNFbHZ5VVlLU2kvMzdqMG42VkhLbHN1NmIrMG8yS3VtNUhlb3lFR1hIeUg5?=
 =?utf-8?B?VXN2c0J5OFFIWHkxeThFRW1RMnVuWVFNWDR0dWZFYmpEUUhMVUpRLzdhMzU0?=
 =?utf-8?B?MG51VThCYUE3aW1YRGVDaFpydXRqUG1BRjB1ZGJiSmpOY1FXSUs5QzZ3VDJQ?=
 =?utf-8?B?RmN4WGt0bDZkVHpXbGNRRVlEMDRrYW5hcTlHNTI5cXJlb2JBVndWemFzY0hy?=
 =?utf-8?B?RDIzSDQxZEJwTHYzNEtIR1o2em5lVUtkWFY3SkNaN3VPc1RyU0t2SVFZeHNR?=
 =?utf-8?B?QmdPZHpjZDNQdXpoTnR0dTNwbUJGZzdJNTlsRXo0MC8vRUptR3pQSkZQQ1lp?=
 =?utf-8?B?VEVYdmp4aHFPSjh2MmZiNmFpSWYyMENEcjNiSkhJRm1mbjJOWTkvS3Bqc1pE?=
 =?utf-8?B?ZXhFbHJ1eS9iNDFGcTJoN21DRGMyczNhc0M1R0UrZ3BzM1ZFbVN5QndzZXI4?=
 =?utf-8?B?Q0RacjZpOEg0d1hvUHM0eDFTVzhLQmdlQU1kVkc2K1dIUEhBS2h0cEdXQkN2?=
 =?utf-8?B?bXhnZmFKNzViVU05NEpsZXJ0cVNvMmhCbmpwWGtiNGI5Uk9taWYwL2ZtSlZ5?=
 =?utf-8?B?bjN2Q1N2T3h1V0d6SEJhSHlxbXJ3WGRlMHVTU1czOWhnL2hla0kzSjR0ZmdJ?=
 =?utf-8?B?K3R1QkM4b3BEZU10NXZYRUdBRHZWOVVzRDhaKytJWDBQYVI3RUFHSG10SEhL?=
 =?utf-8?B?YzBmL0g0eW1sb1RLdDExandUZ0NSNWpXa2poQTRhS1Y0VXZFZE9tN21mVEky?=
 =?utf-8?B?WStnWmkyeG1ST2JHK09VQ2FIbFpyTmhLcGsrNjBGc3RSM3NndkMreE00Zjlm?=
 =?utf-8?B?STREMnRKZytDejA1NGY2cHN2MGJzNFVOMzBER1U2VDFOMlpZQ1I4WDF6MEZO?=
 =?utf-8?B?dEM0OTY1Q0Vydzh6ME9iRkRLemFTQmhzd1lJZkdmRXQ5WFYwSlo2aUllaHRW?=
 =?utf-8?B?aEw5eHNBTWdHdFFkZytwNVNpU3FaRGVMTFhGTzQ0ZHJKblpOWUlkNGFmK1BQ?=
 =?utf-8?B?WmIzdFhONUZncHhQZkFQN3VLbUlBbUo3aEZDM0ttOUFvaFRtNUdwTUhQdnNX?=
 =?utf-8?B?N0VLSW5nVitZd1NoRkJmNys2RmVsNHR1U2dhbXh3eVVGY3FWekVtaVpzV0Rz?=
 =?utf-8?B?VEJKQnE2L3VVZU5pdllGcXVoeHp3bFVESzVIQ0NhdWpYR0hBUjgrSCt0Rndn?=
 =?utf-8?B?N212S1Uvc2RHaGlRMG9uL0M2TmtTZE04eTMzMkFUWUkrYlVjRzcwNW5Cb2VK?=
 =?utf-8?B?QVJGakk3WHYzeUxvTkR6ZDYwRkRCeWRZQlVKcmxhdW1MYjVNN2kvQ0xGVVJV?=
 =?utf-8?Q?gb0sYoLem2Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTdjVzVUakNIZVh3MklVdGFHZFRDcUVoZlE1eW1FanVlL2dRMElJaEE1d0Zr?=
 =?utf-8?B?YkdwZndwSlg0K0JjRlU2cjNpT2EzblZJZUFBOE9kSzZZMUx0aFpGTzRTS2tJ?=
 =?utf-8?B?S3FRY0ZVbjNZZjU3TDVWUkhQeWkrbmlIRVdEdlFKVGdPVTFKKzBXbTVQZHZr?=
 =?utf-8?B?aGlyNGhQMXNpMmVhUTdWSGxlOVZvOTNERjhGRUsydkNabE8vdm4zaWE2T0FS?=
 =?utf-8?B?RFlIMzFzd1p3OWZhM3dOcHRPSjlobDJyODZwcXF5NHFSQXIxdVErQlJiWWtG?=
 =?utf-8?B?YURneGNRaUp1N2RXUUZHVm5sWXFjMkIzSjJBeUsvR2Y2N3BCL0JlcGY5K0I3?=
 =?utf-8?B?VmhOSkZGN0NyWVc5ZGNLV1Q5Z29nVk4rVCtwUlBqNGhjd2o1WFNVbDAxbGhB?=
 =?utf-8?B?Ny9kQ0UrSDhaMmtGU2p3QitTTHNrUWU5N0Y4eU5CN2kvSVZuaVhYWGQ1UVJi?=
 =?utf-8?B?K2VYbTc1LzJscDBxaFEzTUwzWmlZbk5YM29qOUNyZEdtRE5ETFJmVHpxWGZr?=
 =?utf-8?B?ZlhzQlJndXBDcUYrRmhmcU92d21LaHdQUVozd2hsblU1OEo4dzJBV3J0Zmpt?=
 =?utf-8?B?NEdURWkxQS9wTXFhNk51dWxYS0xaTk03QkFmWEVOK0Y3R0NoZXdQejVQU1VX?=
 =?utf-8?B?NUVTRFpYZWJtSzg3dnRMMFo2NFJ0TWlSS3NnU0RKUXBCT2R5Qy93aUpkMGc2?=
 =?utf-8?B?amR2R2lCUmdkemJoTUZoUFViejhCMGw1YUQzZkxTMnkvREZRMFdKSFBya3Ev?=
 =?utf-8?B?eEFjOVRRQWxlZ3EvT3pHbVBqR050QzdDT29IYVlZTzFSbDBvQWxaUG9Ha01j?=
 =?utf-8?B?Q3hVL0ZzUUw0VjYvbk9IckpKQUhBa1REcTFCL1J5c2hlRFBQOXdYZ1JZNmNi?=
 =?utf-8?B?V1QvL2piVDcrbzRTNTdCUWdrbHNRV2s0TFR5SWcwOFVCcmhRUVRaMDFyaGhN?=
 =?utf-8?B?dHRNRDdIN3NDK01BOFpCamYrb1Z6bXhMbHRzWE5Bd0JlQUhnT1lTVXBLM2ZD?=
 =?utf-8?B?QlEwdWprSEpjbU5FUDl5Nk9Nek5NVWwzUi9XUDM3M3kvOGtYZ3NJQXdaREpB?=
 =?utf-8?B?WnhkT1ZwemVPRUhzZ0VDcVBPbklKOTl3REpsREU5ZmVxVU1WR1VPVXJ4SHJY?=
 =?utf-8?B?TjRjQ1BicE02ODZEZllsV1B1TUEzNUlSQVNPQVZtc1B2VmZvWFN0ZkoyTTla?=
 =?utf-8?B?NnBtWjJxL24ySTMwdUlkWTBhUnVMekdxN1hldm5YVGMycExNc3JPOEF6a1hy?=
 =?utf-8?B?MTBlRlp3b0pQQk93V3V5cmtuS3JZdjB3RG5URnZtd0NreSsxcmdXbHhuN3N3?=
 =?utf-8?B?am1XU056MUVubzZkTjNseDBES0N1M052UlRTSTJJU05sV2VkdVY5V0NjRURF?=
 =?utf-8?B?VVIzUDVJK254SzlieGlqWkZaS21BcnQwdzJNSWZhK2hzajhZUHltRTRyK044?=
 =?utf-8?B?N0EzazVsMHh2c3E4MTBWT3loaGhpb2NFUll2cWYyMVBMb0ltYWJmNUx2L2VN?=
 =?utf-8?B?MWp5U1VXcVhnYVQvOXhwMnphc1FsS05hTnczMDVTU0NNUkduNG5jaFRONXFG?=
 =?utf-8?B?MGdwcVM5MXFLWkhHdjZOZnZycXBlWkFwbHo0bUcwZDVDaEFpSW9mN3VnTjU0?=
 =?utf-8?B?YXJ1cTlETVpRZVljaHgvV05WN1lQV2xpYmNzNndMLzFXa0tML3N4WjNDcVRB?=
 =?utf-8?B?aEhENVhWQWZUVkZzRDdlOXBzTWFud2puaU81cWtoZ0dnbERqc2JpWXBhUTIw?=
 =?utf-8?B?TEJLbVorVlNPREVnckh5ak11bFpuTDlqZmRXNmo4TENSaVI4bUJxaUwwTmRa?=
 =?utf-8?B?azZqSENCU0txME54MGcyUENpanJHM29CTkliVWYrSHhxWm9vazZZTWptOGt4?=
 =?utf-8?B?Vzc4bzJJVmxIalVXdElSRFFNY21rRlVNV0VpQ1FmSkJkMnVsa29YVS94V3Rq?=
 =?utf-8?B?ZU0yZ2hxaDZYZ2hFWFVZeG1ycXU2cXpXaGtqZlduWnlEcE56Um01SGVlTHpL?=
 =?utf-8?B?eGRCdm8xLzFzenduVjRNRFpFZjJwYTJ6L09nRFJLbGl6MkFDMHBVREV0VGJ3?=
 =?utf-8?B?cThJYkFUakVzU1BDcFNLWVY5QWtaelVmbXB3a0t6Vm9ld3ZGMzcrQkR3Lzdu?=
 =?utf-8?B?SVB6amVuTm0wdmhMV2dISTFNcDI0VEczTDhqM1VlUURTSjR6NmhYaFp1REth?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d50c4d3-0082-4235-f829-08dda9deaef7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 18:26:44.4666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCbTQBOwEKc/M4boBrJIAOFVgsv0qt7DocrZMyuLztG56DVUUeyDh6zS7uegHdhZV6ZRM0G7HRyXxhUAT8cN0WeYlbTdIxWFhFbRRaBsVs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7277
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

On 6/12/2025 11:05 AM, Lucas De Marchi wrote:
> Reword the parameter description so it's clear what's the default and
> what are the verbose levels.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_module.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 4809afa7ce3f9..3ca25bea5a15a 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -43,7 +43,11 @@ module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
>   MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size (in MiB) - <0=disable-resize, 0=max-needed-size[default], >0=force-size");
>   
>   module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
> -MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1=normal, 2..5=verbose-levels [default=3])");
> +#else
> +MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1=normal, 2..5=verbose-levels [default=1])");
> +#endif
>   
>   module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
>   MODULE_PARM_DESC(guc_firmware_path,
>

