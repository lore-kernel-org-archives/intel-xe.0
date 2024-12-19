Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE24E77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 20:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2239E10E092;
	Thu, 19 Dec 2024 20:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMgB7JsY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236A610E092
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 20:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734640176; x=1766176176;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xVVZlLReocixMT2lBP6Z94eyzA6zZjk19J2GZ6VAjpo=;
 b=BMgB7JsYbwwhknZDH5XYScVP+EtDoQNp2ZmWSEneX32L76NUIkINCCJY
 1oAJkWnLKrmQ/wES1BPSBPoBNneb3Ev5IsSTDDvh3zjEt4OzCuDE5tbeQ
 S+FdWYK22swCrYB7vbHbwALHvMw/lt1G7jh7+8dOiE2J+tVLXHR6sTwcU
 gAq4Ub8OaltvU/41WVqA3ySV0WdwwmCEx6BmlQC6iJFLPcuuSrTiagIAd
 NHQsRLJ1aYC4t0E1Lk+6M5smGOrgrR+1hV2OxT1S0cG5Epux1Koj5mEdG
 mrGxVzPgoDuhPbwAbAKfpJ9hx5Lw9EjrZWmDZ5l9GNzEnhStY5yZ0N0ib g==;
X-CSE-ConnectionGUID: TxotOfvoTIqDl0JMOX90xg==
X-CSE-MsgGUID: Q0h6T32pQ8CJhtfFtNOhpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="38957776"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="38957776"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 12:29:36 -0800
X-CSE-ConnectionGUID: 301xAavwSPGZ6SnNc7zDfA==
X-CSE-MsgGUID: ja3qLWBoQT6g5DB1r8KMhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="98700786"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 12:29:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 12:29:35 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 12:29:35 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 12:29:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qe9WY4ZsjuDD8XBtpwWjBbEnpiLJYK28QG1ts389JmIXKIprf1Uo2bymRVsHd8BE/IIynY+J17D92ba7NhZvpVuN7lHbIlHSd+W9rtxMmkI5NPUV6TO0hAlSUbFswHWoC+l7mJgx6CPL8XZCS69l1Ej12YAQhXm269Hlzzt3D63JM2VfI8alPAoEx9Jacb8+DmCzMPBU6C6kvMw+HKAeS6volhscQtXtUxmPWCTBXnVegWIjGQvxdeBZzh4Z57AVEDzdq0M+3V2vHCFG6mvn/kzrulf8e2yUiEI6V9XTric/y7F6XV33dRC/OqvCSHy63S3EEFKhrQfuXEJFcxBg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKMdfdlyHJZT9hIDkOCEu088XBiyIH+HDbTr4P2mZSg=;
 b=a9an4dytMxGSdrm8++iG7gFz1oP2KfCnVV+/GVLf7GZe4olSgnqYASiMCcBqy1RW64f0dVM9eLExHfQujFOsW998zvOsYbnslxvWbL4Wk2alr5L4S774AUd0KTRwHjBMZFf35ROybHJfm9ySCkxygtUS94Ib9oswhCtTNF6nIG8z6W4ORCZ8hTTRhqgqCEdCyxBCyGu2bewDguPMQuCawBDX/dZlm849kzFL56CZ0VNqlbIiYGFDVnzeO7ZdUk59L8FweAXPETfPD3vO8Hl/wC566dK9riudXLYDpMHSKcsrLvMgqytw6LX3MEnH1DqIBbT2TZglkUVaXpaARgyKXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 20:29:33 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%3]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 20:29:33 +0000
Date: Thu, 19 Dec 2024 12:29:30 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <james.ausmus@intel.com>,
 <felix.j.degrood@intel.com>, <matias.a.cabral@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <shubham.kumar@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.olson@intel.com>
Subject: Re: [PATCH v6 2/7] drm/xe/uapi: Introduce API for EU stall sampling
Message-ID: <Z2SCKvfqjruxRnQp@intel.com>
References: <cover.1734427624.git.harish.chegondi@intel.com>
 <03e289da2ba0426649774b2a68569003c2aa0945.1734427624.git.harish.chegondi@intel.com>
 <854j322gl8.wl-ashutosh.dixit@intel.com>
 <Z2NR9oP6zdD41RGe@intel.com>
 <85ttaz1vub.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <85ttaz1vub.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0166.namprd04.prod.outlook.com
 (2603:10b6:303:85::21) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: c407c791-d36a-4293-c3f8-08dd206bd923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3dZRGZBVU9nWE51L3pCc1dWUFhnclRiQ2pQTmNnQ05XbjRIL1o3Y1JtdWxK?=
 =?utf-8?B?SENLNWF2MlNmSWdOYUNBWlFPM0ViWlVzSmtwQ2I4TmxJdTR4N2dzdEtNVWRi?=
 =?utf-8?B?STd6THdHckMzT3ErOFBMNnBFdEFrTHFlZEJ4SGRCZVZvY0F3ZXFJTFhpczdK?=
 =?utf-8?B?NXFZc2lRNHFqRzBUL1dSTnE0ZXMxODEvVjdsSUV1dVhNYVJUTExoYUtXWkNE?=
 =?utf-8?B?T2xXQ3VHVUsyMkYyWU9PWFBtUXZmR28wUG12d0l0WXNLR1RvZk1oR1BNb2Jp?=
 =?utf-8?B?M3FEQTc2MC9jalFtVG9TRGc3Y3pxc3NEY1dCY0dqYzFYVGdXMUlyclNYM1k4?=
 =?utf-8?B?NVBIaDhKc2ZscUJUWVJ0b3ZqT0t2cDVMSUUyQm82ZW5yQUlMKy9kaFVOcTdo?=
 =?utf-8?B?N2JJM3QxZzc3MFNJbWJOYkRuYXJZRm10a2dzSWpIbXU1YnovZUM1TVl2MjY0?=
 =?utf-8?B?bElNNW5QTWFaL2xwVSttK2FHK1ByTFVLakY3TFIza3ltMUlVdlZGSTh3aWlI?=
 =?utf-8?B?V2Z1MGF6MGRRL05WdHdCdERlRk1pY2xIbnZkUkNJUmhWR09kbTI5MG5CdUU4?=
 =?utf-8?B?bVJmK0VpNjVvZXk3N2l2S2FQMlgxMXdlMTRBdjg2MGwvSzZxZHFCR2w2bm45?=
 =?utf-8?B?L0hEOWYrK21wRHorYXgvWWI3Q2RvUkFmTk9hL3ZScXlUYXQ5MmpISG1wcXpP?=
 =?utf-8?B?bnNCVlZxa3BwZXJLcko5OEFPY3EwdXdTczYzKzZkU3BtS0RIU0pTR0tUL1Fr?=
 =?utf-8?B?Vm0rdnNTY2NNdGFOajBvaDBSZFgxZ3VBTFErdUZUdkdpL1FSU1B5aTI4SXov?=
 =?utf-8?B?ckwyaTh5NmVqSWZ0UWtnb1BLR3czUDJQUDJ4L1l3eWxtUHFtVkpaM05abHBR?=
 =?utf-8?B?dVJwM0dqR0FkNkgrcU1jL2RCUVRybUNvVElpYnoydDlmdmxzM2ROZC9oTUdO?=
 =?utf-8?B?WEpoTGxabmN0MGpveXJHWlg5U29BK3RjdGFIL0ZPSTBwUndXbXBzS2hsQzBj?=
 =?utf-8?B?Wjh2NEoyUTJSZ01qUWMwZFdTWFJ2aHppNjRIK2kyU3o5S0tFeFdvTG04ZDJ5?=
 =?utf-8?B?ZVZBVXNlakJaMXZ4emZFUkE5UVFPbGczM0NXUGpMQ3YwR0tvY3NJOTBxQmxF?=
 =?utf-8?B?eVhaZnlIUHZDYlZIaTJnR0ZkRHpNdGVjNHpiQTlqQkk1SFE1eEJjV2pPQmY2?=
 =?utf-8?B?VVNlOE1EUzEyM010eXIzbHZoOU9zUTJ3UFhpY2QyV21KMHd4ZFZWUWJqVzFY?=
 =?utf-8?B?c2NBeXh0VElWRnpidEtzRVNhcURtb2MzcHpCYWNHQnVQMjFPM0FXakVtSDBC?=
 =?utf-8?B?bnNScmxQcmZtY2RRMUd0ODcvam85TjZ2NndQU3g5bGk2RVFYU2RZTHl1NjBQ?=
 =?utf-8?B?MHQxRFdLQ3hwNGZNVGlFZ1dRWHB4ekVmWWdrbHJ4SDZrVlhBNFgvbXg3MnU2?=
 =?utf-8?B?VVZKNC9Md3RqYk83K1UwOE1QUzVPbERUSUIybUhub3V5RXZ5aWs3ZGd2VXlm?=
 =?utf-8?B?bFprU1hJNFpPWVNXVTBlQUVreW9YZWgvbmR5MUx4WVV5Y1FQOEV4LzFUajZ4?=
 =?utf-8?B?MGV6Tm55Wm1nZWRiVjNsVUdoZENXV2JPWDNtQVBDTWtrMG9GRDhaTnRjMWd3?=
 =?utf-8?B?Q0EwZFlFUUhZd0ZvOFhQZGYyRmJHL2NwWjF0aVBlMWNVOG10SWFyeitTVytR?=
 =?utf-8?B?azhJSmFiNHFEUkNoR3FLM2poOTFnNXV2ak40NlJMY1J5YzNMUlFzL3FJd0li?=
 =?utf-8?B?dXNyOVRYdVlwOW95U3RKaW80U1lCOGFDOG1FYnY0L1lnaVVXaWlQVkw3NXM3?=
 =?utf-8?B?b2RmWTZiZWFLSmdObE1pUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWFaQkpsaElTNzZnZGhNUDV1aGU1RnJGRmZJYkdmWjNvUDlMRnp4N09QUVlh?=
 =?utf-8?B?S3pMRmpnSkN2Ni9ydk5UMlc2VlFCTXpydjVWT1ZSeGdhOFYyd0Z2RzA5UGVE?=
 =?utf-8?B?dk9VY0poS0ZQLzg4MHREdVk2dk1pMlNGby9LOVdLdXVYN2hqOGVWZUxCQ0ty?=
 =?utf-8?B?dXdBM0l2WkVlMjAyUmhQYU9kQXZCaVhyeHZqMWZuZkY1QzhlUHdUVW1TcVNH?=
 =?utf-8?B?bmlVM25mL1hVMGF2TkQ5bUJvVDNKUnJtUURXYkMvcmgrRklMUTkzZmNyTEhj?=
 =?utf-8?B?bmVKRHE2UzBCbnhuWk1nVUxQNFRkVHY3aVRGMkptTWpabG5HZmdTc3owS1dG?=
 =?utf-8?B?Sys1YmJkUG40YkVWMGlmcE9UVyt1KzBMUzV4c3B5dG1oR0VCMjhWd3VZdzRs?=
 =?utf-8?B?eHpseEdrZFYvNTlBMytOeHdBTXkxOHNZemREMFFJMlRxNVRoSkxqb3dIeno2?=
 =?utf-8?B?SlJDZzdsb3JaclFsTno0ZncvaVdEQ2JGaEUwYmIyQm0xOTdMcjE5M3NkZWtl?=
 =?utf-8?B?aFRWVUUrencvRnNTeGJ4VU9OMEVBUUlIbEIxK0EvOGZydE1DM0dtVklZR09i?=
 =?utf-8?B?S3Uwei9oazJ0OWpkOU8xZzhPWjAvbzFHN2hFOXZoMExrRGd6MEV4TU5jMUJ2?=
 =?utf-8?B?RVlmTUNLRHUwcTNyUk9keHFLc0ZVckVKbVZtb0Zid3psWTZ3M1F2TjhzUFZ3?=
 =?utf-8?B?QStVS1lDd1hjdjMxNzZacXBBODJES1BDb2I2cVFyN24yQ3V3RHptSXVBRlo4?=
 =?utf-8?B?MVFET05kTml5SnJjQ1JGZGpua2RUd3VFR25iRXBVQjh0VVhzNVYwOWNBb3hp?=
 =?utf-8?B?dnBXYWxpVFhMY0ljSndKNFNsNThmVjlRdmFNR3ZacGp5b0lJamdxcnJYWFlK?=
 =?utf-8?B?MjUxbERvaUNGQmhUZFBTQXd6ZGFPeC8xRHQ3aGZPWURjTk50TEdTR3RzMjdu?=
 =?utf-8?B?OHAyQloya0xwZ2s2ZTdoTUN5bUZIcnFrck9MekhrWFVEUm1hSlRHWC9FMW81?=
 =?utf-8?B?bHovam9YWmE4Vys2WUVXbVhvRWVlcmExeWhscTUrRGxhb2FnYTdiRFFuQ1c2?=
 =?utf-8?B?ZTN2T0piNUcwWDk1QXpRQm5mVW5Fd3UyUFAzc3BYWXJlc1dRcHNqUmgzWVpG?=
 =?utf-8?B?VU9BRFVoaTV6VzJyYzdjazhsWFlQRXJjYU02WC90YzZ1UndGRFRvaDg4dVZD?=
 =?utf-8?B?NHB4L3NZSWVCcDZUZHJOSDVaWjd1cWRETDRmK3dhWGhrTTQ1cWdoa2lTRFhB?=
 =?utf-8?B?dy9SUjhaVXlyNDI0dEdEZFNnOURJRG94ZjRWUytSMnpLeUNjc29wRFk0S0Fq?=
 =?utf-8?B?bkRPbnJxbzRVZSt4VVJra3pkYU8xYlJMUEJyTWpscloycGRlek51ZWF2aC9j?=
 =?utf-8?B?eEc1a2cvMUpyRGVxaEZOZzd3T2g4aTNrUnpWRll3ZURjS0xqeDVjVENMd3E1?=
 =?utf-8?B?dk1hMm5veExxZVh0TnJhaXFpS1R2WFhPZVZYeGFkWTdkZ1h3V1ZsZVJ3ckli?=
 =?utf-8?B?TkJ1bUFtWUJVeFFwd29jVFQxMVkyeno4T1A5UnZrNlFaVjdaeFVCRzU1ZGU1?=
 =?utf-8?B?SEkzNTUraDNZUndVSHRVMUJ0K1pUYXFUNGkwK0xuUjIrRlZ4MytMZTdvWnh6?=
 =?utf-8?B?Uk1vNElCWC9LWDZNTFBSYjVpNzNkNmIwZnNOVWE3MlVsR0NZcU1MMG56eFhD?=
 =?utf-8?B?OURadjRNQlNiSis0d1NzSkNVVnhSODlneTF5T3ZnQ3ZoN0Vkb1Z6Z1Vzbktp?=
 =?utf-8?B?WDBHV3luNjZKVC9pcUFHWHI4OEVqVzY4d3FQbWU5YkhQc3N1ODZsYnZhN09v?=
 =?utf-8?B?NllYWDVqZXZkQ2hzNEhmL2dpY3NybGptSi9NTytWV2tBSnpJQ1Iwa0NOTHhh?=
 =?utf-8?B?NWVVc1BQeXZGQzROU2NTelA3eDJyRkZkS0xLaDlIZkVTN0EySjRiMi93WmdC?=
 =?utf-8?B?YUFZU1pzYW15ZjdsUkRqYmxNaFNPdDl5cGgrS1hWeDBySzA1OUk4azNWU0lP?=
 =?utf-8?B?WVhjUnBwU05URzQ1cVV2RnRlV21PS0dhU2p5aWdZbDJxY2VHaVNNcmNNckNB?=
 =?utf-8?B?eW9VVzlrTk5BSm9XbEFWaUYrVVd2TWV6ZEhYaUVweXoyaitzS203UExuTE1P?=
 =?utf-8?B?aUxIVU9nM1c3Z3FpQVMzT3A5eUNPMmRWTTVqTWVHUFg0bUZOUTVvb0tGQ3lm?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c407c791-d36a-4293-c3f8-08dd206bd923
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 20:29:33.4251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rekS/EjFfAn4Py8q6po3bv1yT0TUFXB3PsuX11V6+9EB1ZaqTOpyQWuwkL/Nc47m//xxTH2rl1DJ0w3+xJrwrkKM+6WR74Wni+q1+a3cOus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
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

On Thu, Dec 19, 2024 at 08:27:56AM -0800, Dixit, Ashutosh wrote:
> On Wed, 18 Dec 2024 14:51:34 -0800, Harish Chegondi wrote:
> >
> > On Tue, Dec 17, 2024 at 12:35:15PM -0800, Dixit, Ashutosh wrote:
> > > On Tue, 17 Dec 2024 01:46:52 -0800, Harish Chegondi wrote:
> > > >
> > >
> > > Hi Harish,
> > >
> > > Only reviewing the uapi once again.
> > >
> > > > A user space consumer for this feature is Mesa.
> > > >
> > > > Mesa PR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30142
> > >
> > > Mesa PR should be in the cover letter, not in the patch itself. And we'll
> > > need to eventually show that the Mesa PR is consuming all aspects of the
> > > uapi being introduced.
> > Okay, will fix in the next patch series. Mesa PR still need some uAPI
> > changes I made in this patch series.
> > >
> > > >
> > > > v6: Change the input sampling rate to GPU cycles instead of
> > > >     GPU cycles multiplier.
> > >
> > > Note that if your series is v6 each patch in the series is not necessarily
> > > v6. A patch can be v2 e.g. So you should capture the version and changelog
> > > of each patch separately.
> > Makes sense. But how would the reviewers know if a patch v2 in a series
> > v6 has been updated?
> 
> They can check, say in v7 if the patch has gone from v2 to v3. And anyway
> reviewers need to be aware of what is going on. There should be no
> significant changes to the patch after a R-b, otherwise typically the patch
> will change and it versions increment.
> 
> With what you are doing, the patch will go from v6 to v7 even if there are
> no changes to the patch.
When I do a git format-patch, I specify the --subject-prefix="PATCH version".
Since this is a patch series, all the patches in the series will be
assigned the new version even though I don't change some of the patches
in the series. Is there a way I can specify the version for individual patches?
> 
> > >
> > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > index f62689ca861a..4ee3b04a1bb5 100644
> > > > --- a/include/uapi/drm/xe_drm.h
> > > > +++ b/include/uapi/drm/xe_drm.h
> > > > @@ -1397,6 +1397,8 @@ struct drm_xe_wait_user_fence {
> > > >  enum drm_xe_observation_type {
> > > >	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
> > > >	DRM_XE_OBSERVATION_TYPE_OA,
> > > > +	/** @DRM_XE_OBSERVATION_TYPE_EU_STALL: EU stall sampling observation stream type */
> > > > +	DRM_XE_OBSERVATION_TYPE_EU_STALL,
> > > >  };
> > > >
> > > >  /**
> > > > @@ -1729,6 +1731,45 @@ struct drm_xe_oa_stream_info {
> > > >	__u64 reserved[3];
> > > >  };
> > > >
> > > > +/**
> > > > + * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
> > > > + *
> > > > + * These properties are passed to the driver at open as a chain of
> > > > + * @drm_xe_ext_set_property structures with @property set to these
> > > > + * properties' enums and @value set to the corresponding values of these
> > > > + * properties. @drm_xe_user_extension base.name should be set to
> > > > + * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
> > > > + *
> > > > + * With the file descriptor obtained from open, user space must enable
> > > > + * the EU stall stream fd with @DRM_XE_OBSERVATION_IOCTL_ENABLE before
> > > > + * calling read(). read() returns number of bytes of EU stall data read
> > > > + * from the EU stall data buffer or an error. One of the errors returned
> > >
> > > No need to explain what read() returns, read() is a system call, user can
> > > read the read man page.
> > >
> > > > + * from read is -EIO which indicates HW dropped data due to full buffer.
> > >
> > > Just say "EIO errno from read() indicates data loss due to buffer
> > > overflow".
> > >
> > > Also, -EIO is not returned to userspace, errno is set for userspace.
> > >
> > > > + *
> > > > + */
> > > > +enum drm_xe_eu_stall_property_id {
> > > > +#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
> > > > +	/**
> > > > +	 * @DRM_XE_EU_STALL_PROP_GT_ID: GT ID of the GT on which
> > >
> > > @gt_id
> > >
> > > > +	 * EU stall data will be captured.
> > > > +	 */
> > > > +	DRM_XE_EU_STALL_PROP_GT_ID = 1,
> > > > +
> > > > +	/**
> > > > +	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
> > > > +	 * in GPU cycles. Valid values are:
> > > > +	 * 251, 251x2, 251x3, 251x4, 251x5, 251x6 and 251x7.
> > >
> > > This 251 stuff needs to go, as was already mentioned the last
> > > time. Something like:
> > >
> > > "@DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate in GPU cycles, from
> > > @sampling_rates in struct @drm_xe_query_eu_stall".
> > Will change.
> > >
> > > > +	 */
> > > > +	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
> > > > +
> > > > +	/**
> > > > +	 * @DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT: Minimum number of
> > > > +	 * EU stall data rows to be present in the kernel buffer for
> > > > +	 * poll() to set POLLIN (data present).
> > > > +	 */
> > > > +	DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT,
> > >
> > > We called this DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS for OA. So maybe
> > > DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS? Or WAIT_REPORT_COUNT? Not sure what
> > > EVENT is referring to?
> > Here is EVENT is referring to POLLIN (new EU stall data in the buffer)
> > from poll(). This property would specify the minimum EU stall data
> > records to be present in the buffer for poll() to set POLLIN.
> 
> Note that above I said use EIO errno, not -EIO return code? The reason for
> that is that this is userspace facing file, to be consumed by
> userspace. Userspace doesn't know what POLLIN/EVENT mean, those things are

Userspace knows POLLIN - https://man7.org/linux/man-pages/man2/poll.2.html

> internal to the kernel implemenation and kernel API's. So these need to be
> changed too. Here is the example from OA for this property:
> 
> 	/**
> 	 * @DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS: Number of reports to wait
> 	 * for before unblocking poll or read
> 	 */
> 	DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS,
> 
> So here there is no mention of kernel implementation/API's, only about user
> threads getting unblocked. And anyway there are no events to userspace
> kernel is sending.
If I remember correctly, the name event report count was suggested by
the user space folks. I can change it so it is consistent with the term
used in OA to DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS.
> 
> > >
> > > > +};systemctl start gdm3
> >
> > > > +
> > > >  #if defined(__cplusplus)
> > > >  }
> > > >  #endif
> > > > --
> > > > 2.47.0
> > > >
> > >
> > > Ashutosh
> > Thank you
> > Harish.
> >
