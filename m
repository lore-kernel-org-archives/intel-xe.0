Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B18CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 04:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC9E10E0AA;
	Thu, 18 Sep 2025 04:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZF24/7LH";
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxvJL4+C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B3110E0AA
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 04:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758168357; x=1789704357;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:list-id:list-subscribe:
 list-unsubscribe:content-transfer-encoding:mime-version;
 bh=/JhtPfJaQiCKSIX/TuTfrAD7OYsN3RQ0tOkgWbfXy8w=;
 b=ZF24/7LHF1Qj7GEJ/kHHYeSORy4P+gn/uoXB5tRGZJvky93XLPVCRVmF
 i6ruwBrSGQnFt0Mhls61rOMhDld9O8HHF0GEV+GDRJ35pJ/cAy0X2T+lk
 BojaVjcfaIofISarIuCXBHvb1A6ln244rgFVMCumYluQ7NVkj2rzVNI3s
 rUJ4H0Fjq4Pr9I1whcYkAS5auQ+Avbkqh3U6WotMH+cQKA/1BFT/7yPpo
 AGeaPzgHIpGclTL6X95iqHegAEk7LOGTz6EHQoyXbkl9UuPnT4A+issOC
 WOR4znNe/y5tO5EFy0EjRcwcn9DA8/uKWUrjxuU0KkYuYcePbXuNyFAEe Q==;
X-CSE-ConnectionGUID: NDaHU1D2RReyTrvXETAu2A==
X-CSE-MsgGUID: 1r2yAvj9TGezPImllNUg0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71913033"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="71913033"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 21:05:56 -0700
X-CSE-ConnectionGUID: V9lw/A0bTg6jbgRSX0yIXA==
X-CSE-MsgGUID: CF/vQZvuS5SnbCKnxzMPjA==
X-ExtLoopCount2: 2 from 10.22.229.24
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="179420792"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 21:05:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 21:05:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 21:05:56 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 21:05:55 -0700
Authentication-Results: dkim=error (no key for signature)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Thu, 18 Sep
 2025 04:05:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 04:05:53 +0000
Resent-From: Lucas De Marchi <lucas.demarchi@intel.com>
Resent-Date: Wed, 17 Sep 2025 23:05:51 -0500
Resent-Message-ID: <utipah36h5noj7ymkvzsvyddyixagl5r4ti7ukknx5joxckrev@cdni4qdbbrm6>
Resent-To: <intel-xe@lists.freedesktop.org>
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1758145074; cv=none;
 b=kPxm+6Q2N3ONqsCqjmJgnMC9GSPOquF/BVJlB0oSaDyE9Zpj574DURmWQa39ckVN8xcx83neRT6yYO4eaC6t2RJbtR6PVBrYGNrOkV7fZwgWoM129SjyOHTkehQaqFxU4yuMrtf6hI0vjMstNMBpK3w52CjC9ktvo6NCIIy+1NE=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1758145074; c=relaxed/simple;
 bh=/JhtPfJaQiCKSIX/TuTfrAD7OYsN3RQ0tOkgWbfXy8w=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=G4WAvKBqt8UYzMNF885Uas3kTP+f8mKspzOc0r2B1rlTPWAbfkK+BLsfQQKKkZJ+q5HHa/6PlAhjC3WhmVS1FnqT5ZC6c77ejaF+/SezyE46Pg7mw4vDLOW1EUw3uoRAO1vW+6+E/LOJul06umm7EO4rpFlW6thyHUlC4hLYSHI=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=intel.com;
 spf=pass smtp.mailfrom=intel.com;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b=BxvJL4+C; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BxvJL4+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758145073; x=1789681073;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/JhtPfJaQiCKSIX/TuTfrAD7OYsN3RQ0tOkgWbfXy8w=;
 b=BxvJL4+CJJOfk4gIJL3rLzYA7Vqdg5mDQBJR0vWKo5Ndef2C29uUOzJ0
 0DxZYacP7CKACFTCE+NuNWYbUDNuTyr7OxjVg7gGbIHCbX0q1mRBiFH6P
 5FUbVhog4RJrVrA4R/B4ja78M5okV+qjX4ZrZusnqL/++tppjfiJo3Ay6
 s6EYPwUZ6n27Z76+O1AZhBuFP/HLk0wIN/5TEBcmPBuintWvWfgU9zXC1
 l0QKiaERIg4R5JtVif5C4JwaHlEfx042kyK7vKZuZg/Oo418y1bsWZx8a
 pvKqRGPw9EVuM2N03HsXxVahGFAQct0jlfcu5f3loZfkQEFiKZkFR8kF9 Q==;
X-CSE-ConnectionGUID: Hap5oC5YRGKrEW6jCEVtJQ==
X-CSE-MsgGUID: 2ZqWCf32TYWNOa5HE0VXAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60522745"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60522745"
X-CSE-ConnectionGUID: I48fL1SaSAelzkyZZOGSrA==
X-CSE-MsgGUID: 70k54UhfRkOchs8AuyH1Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; d="scan'208";a="179643051"
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 0/3] drm/xe: Fix some rebar issues
Date: Wed, 17 Sep 2025 14:37:29 -0700
Message-ID: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250917-xe-pci-rebar-2-c0fe2f04c879
X-Mailer: b4 0.15-dev-b03c7
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: 59880019-9ccd-4c0d-77e0-08ddf668a955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4022899009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHc4K1QyUG5VNWNZNWN1UmpudjAzUG96a3ZkcURpL1pqOUFac0lPblJYUXNF?=
 =?utf-8?B?MzVkak1CdTVuWWdIT0FkRlV5STlsZDBqeENhU012bHdYZjRBWFFJS1oyblEw?=
 =?utf-8?B?UDVaa3dYS3RvSmNCNW5jUjJ2SzVjUEl1eS9KUGNyOHpUT29KV1h3YTByODY5?=
 =?utf-8?B?V2gwcC9TMDVXWGR3MTRaZ2JqZC9ETTZQWDI1SUR2cG4vYXBDMnBPcENOSlNo?=
 =?utf-8?B?bnZXS3hpWXJqbDJCT3BVM2k4YnNMM3RPakVVclhSbEZvbXU4ajlMQXQwdDRS?=
 =?utf-8?B?WjViTUxXVHZBY2g3UTJFbkRUc2IvYjFYUDIrSWxPbFdoNVR4aElNVDFKeDlw?=
 =?utf-8?B?MEk4QkZxck14QVQzT2pPcEEydlo2Yjk1dVNXeW1ITzV0Q2M0T3JOVFZGSEYv?=
 =?utf-8?B?UXdJTmNERW9Qdk5rV0dxWnE2NTl0RERVZnBHbG1TbTNHWXFDOEl5bmtyOUtV?=
 =?utf-8?B?RVpJNU5qa3NSckpTZ2t1SW5ZZmVhK1M2SnRpSDJaNjI5ZllmcmppbUhmZm4y?=
 =?utf-8?B?d3dVSXpUVkFITFl3b0Z4eWtqZTlJRUpFWDlJeW1FNnlMdTcxaDNYZ1Z1QlBm?=
 =?utf-8?B?NXZyR0lyNVN4WmsyUjl0RFlMVThzVnR3NkFjdzRKZ1dONlRGSHhvODJEWkll?=
 =?utf-8?B?c25sUkJGMXpBZkF1SW5Xc1ZSUW16Sml4ajJBYXhZSzZzcVBaeVNlWUZLY1A5?=
 =?utf-8?B?NVM4RGY4QzdSaDhzRW8rb2x0eitiNm9iWTc4cjNmaWxGL0g5b0xzRFB1ejNY?=
 =?utf-8?B?RVBzUWhBZU9WdTh2R04rY0s5N3dPb3BGbjJHMjZsQWk0bG5XWEZKeHB5QS9a?=
 =?utf-8?B?eDJKdlBLV2Z6NTNyWml4NWh2U0tFL0sxQ1VJR1VZbUhEbXNMRWlCUG5TKyt2?=
 =?utf-8?B?VDJlN21NNTcyMFJONHlkMGJMckd3SHlNc3FVWEdOMmY5Z2NtQVFEZkZ6Q2Mz?=
 =?utf-8?B?ZDN0S0dQb1ZQS1V1OTFSK3dpWGxsQlUrLzNJVXVtOVRFZ01RWURFd1FxK0oz?=
 =?utf-8?B?SEV4ZnBQNVd6cHFFbGNYODRmb2ZnVEF2U3M2RUczVlNwNGhaUFF6MUYyYi9o?=
 =?utf-8?B?QU5NTlNFMmdFRTAyVGdnWGxoWXRhU1ZwN0x1OEkrMDRFSnpsQ1M3MFNPT0pk?=
 =?utf-8?B?WHJtVnFJd05kaHRWR2tjR1dFWGRYMXBveVRhU0dBMGpTcG9YVHRkdlRISnNU?=
 =?utf-8?B?ampIQ1BCV01Oa0IvTFVNengvRjM2ZEcxOUlyWmZiVVFxM2tjNnRMN1BKcCti?=
 =?utf-8?B?ODl4VkVMSkNSOG1GWU4zSXR5U1V4NnluMS9Ba1JGN0JiaDZqaXVwRHpKSVBL?=
 =?utf-8?B?NjVlemRnUHJrRUF1anJWV2xZVzNERnVsUGNGRmFBTEszcS8yU0tVY3NVSEpX?=
 =?utf-8?B?cXduQ1R1SkFjYXFhWnRkQ3BjNXYwOG5zRzFVOGZDN1NpRUQvQy9TcmpUKytS?=
 =?utf-8?B?cFRqbUZNSURPY1F3TUkwd25tMkpXOWZzMlU1N2kzL1pSblVJUERIN2FPL2sy?=
 =?utf-8?B?ZUpmd2JvOW5OVGVJdzZFWENQMWdxR1dETE5VNkFyWnJQZG1WY3ZyYjgvUGlX?=
 =?utf-8?B?cnB6VXBpYlNpUlVpVno5NllPeWJWUE5xV1BEMUdHb293NEVabXVRb04vMnV3?=
 =?utf-8?B?VHNpQjFCRlBPbFdPWmRpMDhGR3ovOEJYSTZxSm1ETlM1SzdRSjJNWlBVVTkx?=
 =?utf-8?B?bHRSbWt0QW5CcWhINGdSVlYrZnltU3BaaC9FSFJiMW1TZmk2aDltNDRudUNy?=
 =?utf-8?B?dEpOVzNtV0doWjNnUkROYUNzRmZtUml4OE80Q1JlYjNDd1RnSWJ0VkNScklk?=
 =?utf-8?B?K2FUTFBJZGhqTkJzRlExZnp1UDMwcENKR0J0ZGtzei9BNDd1Ui9wUG5sb3p4?=
 =?utf-8?Q?4A6/HyQ/D5tEc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(4022899009); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVhNdVZjc3JhL01ockhrWkdvQS9KU2NNVk5XeVR0dTJadS9qV2tOTnZKVUhh?=
 =?utf-8?B?ejA5OGVxZVBzU0lvRzhzbG5BWnBPdy84cUx2R1VIK0tXcStMZzREVnlFQ0Vz?=
 =?utf-8?B?bGRwQW02eE1nbUUvK3E3TXRQS3lUbWo3RTZUQlkydlNTWnc5UVFOaUNoNk0x?=
 =?utf-8?B?a29xMUdEdlpBVFR3NHJ4SWl1NmFPeHhwNE1CSFAwaHFieXFoK0dpZ1VtRTI0?=
 =?utf-8?B?TDJrSjNuMkhiZnFrSUFoUmozblMxNk5ENTdGYjFKak9MbEt4Szl6dVVlRWtY?=
 =?utf-8?B?QzJKZzVRa1ptZlJ1M3F4amZONzQ2QlJVTm1jcTZhcW5TRCtpREs4OG45L1BO?=
 =?utf-8?B?b0tvT3VqbVhmL0hod2ZDN0JQZENsWnNLYmhyQll1NDBwOGEzZEZYUXBrUmpi?=
 =?utf-8?B?Qmc4MGY4ZUpZckFIZk1vLytIbFpCUTlmTE5FS3lwYzNMZkJsZXl0UXZ5dDRL?=
 =?utf-8?B?L2hRY0Ewb0c2TlV6YXo1aThxWXFSNWVwU2NOK0hoZUVQMFQ3dEhDWU45WEQ5?=
 =?utf-8?B?aHNDVm0zVFU0VkJsMG9JUEx5TU40dnJCZGZxUGs2WUl2ek5RMnhlZ2dyUmNs?=
 =?utf-8?B?Ym5sWGc3WW1IeFphUFpmTUFOTDR0aTh5a0l3RTdaU283a0szejVZazFSZWdr?=
 =?utf-8?B?bFdOQ29BSHl1cWQrZ0VuaUFURW8za3VSd1QyRzVDV0JMYTZHZ2ljOEJrWXlW?=
 =?utf-8?B?RzZMUURtSkpLRFliUitnMWJDQnhYY0xyMDA4ZG5ZVC9STmp5WktnSkd2Z0x5?=
 =?utf-8?B?bi9oWDBDdTFRU3N5ai9abTFPaHo0VzRHakFPS0x0bzBRZkRQMzN2elV0TXJk?=
 =?utf-8?B?cUR0MjR1NjAvTEQ3OE1JZlZrMUJmdFRFaVd6UGdzTmk2OEQzL2VzRkxBdmZo?=
 =?utf-8?B?M3JhaGhDMXhaeXl5cjlKRDNxMlVuU2huLys5dTVTdEJ4MVp4MUtRU1huK0pt?=
 =?utf-8?B?ZUVMbWJXY2I0TUJlU3dMQWZRSU1NUUxDc0JvdHA3c0Q5eXBwaUNnRUFFZDB3?=
 =?utf-8?B?TGoxMk9JQTNJaWlzYUZoRS9BSlk2bXFCNWwvV0wyMHZDa2pRNmJwcE5KZ3Qz?=
 =?utf-8?B?NmFEVlhqdnhmYXZYcXFWWGVpQjhlQVhQQ3pJQnRxbm5MMTVxaU9kbnZWVG0z?=
 =?utf-8?B?cTNiYlIxZzllR0kzS25URFp6THNlTHZDL08vSGZXUFZpeFM5N1lzNE1aaGtL?=
 =?utf-8?B?a0NoWmFqS0J2LzR1K0Q0cktBYkNKWlJzNkU5dE1XSHY4anNscEpUdnhpdWlz?=
 =?utf-8?B?YnF4YlpzZDJuSUZzM1B5TkxCdWVDR3dwSTBHaklmbmRhenlaUDBiTm50YmpZ?=
 =?utf-8?B?OE9iSGdyRUdOOGpGRnVMd2ozS01YdkhYTjV1QWt2YThwdUtFMC9UaEpjMTQz?=
 =?utf-8?B?Uk83NkM2YVYyOTNXOEtjQ2hWUkM3eFd2dkR1U1lYdU5WOWlwNHFocEVYYzg0?=
 =?utf-8?B?QzRaV0R5M0RHVjZnejFzT2hZOTN2M1JTOHRsZXVuby9NZ2JSRFVWWEFpMmU2?=
 =?utf-8?B?Um84c3pmVU9hRVFCMWpxeFgwRTc4OWtRM3JQQ3RRU09udTc1anNUNU1EWUFJ?=
 =?utf-8?B?TmZ2VEN3QVZGQWRpVlU1ZDR4ZnhmeGF5VXdabVJhUDNYdFljUHA4d0pZNjNo?=
 =?utf-8?B?VHZOc2ZueGF1YjVNdFZrN1JkMXVGMUVQOUFIcmVFRkZXYy9qSnVmRnV1L2dV?=
 =?utf-8?B?UThZbEdkVWdlWUVFNDZqK28yYjU1NkVOMkQwbVJTd3Bic1dmM0VPK2Rsc1dR?=
 =?utf-8?B?RzhMSHJoempDOUszTzA3eFlDbVltcEs4TFI3ZGROTHY2MWxzck12RmZEZ0pU?=
 =?utf-8?B?V0NjdjRKUFhONTBPem9NSUxQNEJqUjltazJudE5PSzkvOFMwbXJQU1QveHB4?=
 =?utf-8?B?UzFqV0VaL1g4T2J0cUxtLy9zdTkyUndoVkpNWjlBYnpYQVVUd1QwMHhWZE1T?=
 =?utf-8?B?RGZjUk8rMzdpcmlmbkNwSW4xSUR5ZVdpNnlIZTBjajZVZlBhTGpiSU1Wenhj?=
 =?utf-8?B?aS9lTzcvZmoxRVAweGkrTmZOa3NZbnlCbVVmcUN6S0hvc05LeGdNdGUwN3Zi?=
 =?utf-8?B?YjNjbXo2Mkkwb0s1WmgwcHcxZUhuUGtJM3hhOWJTRWxYeUZLREdVeEZXbkVK?=
 =?utf-8?B?RGp1cXBadFVmektHQnArWXdtMWlncTRKS3BkQ25ZaGpsWDBBWTdjQ1VVRG5l?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59880019-9ccd-4c0d-77e0-08ddf668a955
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 04:05:53.5866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9W08YKNsyumUTkg9OUkwSQwKXT7f+f0Lsd4anId/NRzMx8z3q6bbnq0hHzyPdUGZoGhy/XysF6gM6tTARiNv2nY4fk7FZR7Jm8bkViCKnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

Our implementation for BAR2 (lmembar) resize works at the xe_vram layer
and only releases that BAR before resizing. That is not always
sufficient. If the parent bridge needs to move, the BAR0 also needs to
be released, otherwise the resize fails. This is the case of not having
enough space allocated from the beginning.

Also, there's a BAR0 in the upstream port of the pcie switch in BMG
preventing the resize to propagate to the bridge as previously discussed
at https://lore.kernel.org/intel-xe/20250721173057.867829-1-uwu@icenowy.me/
and https://lore.kernel.org/intel-xe/wqukxnxni2dbpdhri3cbvlrzsefgdanesgskzmxi5sauvsirsl@xor663jw2cdw
I'm bringing that commit from Ilpo here so this can be tested with the
xe changes and go to stable (first 2 patches).

The third patch is just code move as all the logic is in a different
layer now. That could wait longer though as there are other refactors
coming through the PCI tree and that would conflict (see second link
above).

With this I could resize the lmembar on some problematic hosts and after
doing an SBR, with one caveat: the audio device also prevents the BAR
from moving and it needs to be manually removed before resizing. With
the PCI refactors and BAR fitting logic that Ilpo is working on, it's
expected that it won't be needed for a long time.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Ilpo Järvinen (1):
      PCI: Release BAR0 of an integrated bridge to allow GPU BAR resize

Lucas De Marchi (2):
      drm/xe: Move rebar to be done earlier
      drm/xe: Move rebar to its own file

 drivers/gpu/drm/xe/Makefile       |   1 +
 drivers/gpu/drm/xe/xe_pci.c       |   3 +
 drivers/gpu/drm/xe/xe_pci_rebar.c | 125 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_rebar.h |  13 ++++
 drivers/gpu/drm/xe/xe_vram.c      | 103 -------------------------------
 drivers/pci/quirks.c              |  20 ++++++
 6 files changed, 162 insertions(+), 103 deletions(-)

base-commit: 95bc43e85f952ef4ebfff1406883e1e07a7daeda
change-id: 20250917-xe-pci-rebar-2-c0fe2f04c879

Lucas De Marchi

