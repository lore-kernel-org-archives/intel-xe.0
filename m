Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A510C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 18:37:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF07010E491;
	Mon, 12 May 2025 18:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6oYJJKC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB21010E491
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 18:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747075020; x=1778611020;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t4DTZPYnJkDieGZ7nKZXYVbOa+01uZLd9kxmt6+GYFk=;
 b=J6oYJJKCzfj20bxJ9Cc5JA/KJRj85xwDqicQHoaod3nVZnZrgNPiZZvH
 ADZJyyoFxQF9BQFnpBCaYrmbco7v1VmuG3QaYfBDvUO2ZO+GI+FCef6ep
 XyLn2usQvUB9eLJoJJdAmUtAG176zY0E/SRfVcdSkX/DHiEnUcs5drQM8
 YZDctyjFOfYg4q8UvMH7uhjycm0rpqrqs0HokgB6lj1cttMAKyEFkRi83
 lc246kx8s8lQzeh/aE8xCIOG3GKHZix7POef4VEq1N2PV2+SLsWmbeSYz
 CbKEat8XwvSh/QuRtMOivtsMXYqKuCQg+r6nm/PLp7QcHjjPRIRV8QZar w==;
X-CSE-ConnectionGUID: I/pIaYlzSgSniQOXCiy7+A==
X-CSE-MsgGUID: x59yB1z3QASp6HhBsFAJAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59527056"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="59527056"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 11:36:59 -0700
X-CSE-ConnectionGUID: V6Hg43zVS7WckaBWR3hmEA==
X-CSE-MsgGUID: 6Ygagp/9TMCXINoXO4cDAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="168371923"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 11:36:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 11:36:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 11:36:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 11:36:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ToITvJoRFHMfE31IIlZPpHg4JXyPEgHeYdK//p7YcfAKEhX6+Sfl1dMYHIOQRQTQ2JF6wQUiZO6s4f8FsFmTe7R7BFMy4X1OOlHGcUoRKVZXdbAsG7yblY9ohJvfwvURgUJEcLrg4VbGPdjKd3zQAjIZc37wfInnA3NaTei/otSlCDFratpy4xwDmQXRyqVX3rDlhaNi2OFwX6WkZTDFZoEOJKVXsP6l3DdV9F1kqjlVtBoNGtt1C+WNntdXSJtvTgauZ0NAl9OP/NDY5ZAE/bkiFPPtyZPcr3uq5w8fMXXvH/Aj8fAP6KjGTg4iI+li2iVxyC7j1WtO2J5YDg+r7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++TWMRmeQQdb4SQ6eOO/Vxko4PSd2udlxozuOBopC0Y=;
 b=w2BQ9OiuFnrvIHuN/uA4sINFMv/mGUjys0LqTixTa+MzU6KRSp1xvWYyGwo0rk3XUR41mSIeZTD4be93r83kfOJH5p7FOU1OefN2CfD8Psqk9DmoNqYl9vOe1Uelgo1LJSbjWbxcdeiNWoADqHRRsm4aBVNfAeGkNiKCx+IbJVCZngNTMJFiqf5WBIEJGB0syY2nNRDa1l5evcJMoAhnj/tGuF97XpLSAZnlJ+BZJEoP7B/veCxGo1htPG1ehv7n0gXcQZ/r1vljBWvyvwYWlbpLJdGf2PI+s5Czkl7XGjCstoFoIUHVcQEa2HNaRo91EWwPYnevpAG9VlhRUQs5sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CYYPR11MB8408.namprd11.prod.outlook.com (2603:10b6:930:b9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 18:36:55 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%6]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 18:36:55 +0000
Message-ID: <d03eda9b-d090-4ebc-901b-31916df24fbb@intel.com>
Date: Mon, 12 May 2025 11:36:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Introduce flag to indicate possible fault
 injection
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250512161947.128-1-michal.wajdeczko@intel.com>
 <20250512161947.128-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250512161947.128-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::16) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CYYPR11MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: 47363f15-7c4d-49f8-6693-08dd9183f8a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S29FbW93d0dsR2VvS2t0RmR5LzQ5dWtyNUhpVzVKb2tubzNaV2t5dk9LWm1i?=
 =?utf-8?B?dXlLVzFlcWxuT3MrQVdsVy82djVEdy93YXpVTktQRHBhaXNWd3B6TDR6SjBJ?=
 =?utf-8?B?UU43eDRheFhPSGhSNGYveUhHVStXUUMwdHByRThPYUJTUXhtbzBmeTUwYmVH?=
 =?utf-8?B?WEF4djJPNDNjWkRvWExMOGwxOWt1U2dSTmVaa0JFN2ZCR05lMUhzMmZtdFh0?=
 =?utf-8?B?MDJXZ1ZOeDMxNXhQNXBtV2Z5ZmljSk5XZGVhNDc1T2RDbEg1aGUvY3B5ZWgz?=
 =?utf-8?B?S3dyQmlVOUNXT0JqSFE5K01mN1NQOG5HcXJVamMvNDV4VytiaXNLZHNRcUZJ?=
 =?utf-8?B?eWJoME5adzVqR05GQzQ3cVhIT2t3V0RZb1d0N0VrMVZRZWZYcjY2eDdhdVJ2?=
 =?utf-8?B?Rkh4QWtVdlpPVXJKVVBKK2N4Y2JMZzVuc2VNNlVpcEhNd0MydTA2U2J0eVl6?=
 =?utf-8?B?VE1HODQxVCtlQ1hmMDVjQ0NCK044aE9mU0ZzMTBZZUt3eThZWlZJNzVqTmlv?=
 =?utf-8?B?K0N2V2xVUU1ZVWxGSW5ySXYveGJqZDljZUh5TE5tYU1udjhRNlR0WlltMzlk?=
 =?utf-8?B?cTFRL0x2Sko5KzZrV1BWdkRxU2h5UzJJUUl6SkxJQWVmbDRiSWwxbjVoYWo0?=
 =?utf-8?B?Slp1VGdWUjVzU3RoYVVmZFhLbkJmQ2FQMDM4cDBpTnRTNk41TTNHaWxlbXhu?=
 =?utf-8?B?cUlJWm5TTFVDSVVQS2sxeXgxN1dPVEtGZ0xBV3VDN1ZUUUZJUHZEN3ZYT1hE?=
 =?utf-8?B?MUtpalpleTZmTVcxa3JtenVzLy9SNEE2SjdWazBLazQ0NDYvQ3FnbXg5MUJx?=
 =?utf-8?B?L2w4NjJqdlo5SmtaaE1neCtLcnRNTGc3dWw2VzdQc045dW53NlVtZ0c0Qm1j?=
 =?utf-8?B?QzZjN3NWOG0yem1hMDF5TUoxaFQwVzRXQ1dMTnZXWnE2cXFIZ04rNU9zcVBF?=
 =?utf-8?B?RGs2L0JVRHVQWnoramdpRHFCUytZODBFNU9oVmc3bjZkcGQ1WlE5NVBwT1c4?=
 =?utf-8?B?cVNRNzErSFZBNCtiRXNCQkJ5NzNqK2ZsajkyRkY4NmVwQW9taWhNN3kzWlZa?=
 =?utf-8?B?d1VhZUxEUEJyN1REWXg2dFRhTlBOdFM0NUlWV1Rhb1QyVzJyUk8ycjVSdzNQ?=
 =?utf-8?B?clJFMStqa3FmNUZvMDUzUSt6bTg5bjhGcmpJS2JuRUZpdnlrajFxenVyRDZx?=
 =?utf-8?B?SjdEQ1R0V3V5bWhZaktSUkZjandUVjMxVHlhNkJIWDVSV1cvcktvTUpJS1RD?=
 =?utf-8?B?bzRibzFJeTJpUnZaeUVTUVpwL2RGRE5VTXNQNjNIdmszMWg4YjR5VS9WUUVp?=
 =?utf-8?B?MDgvdVF4aHRLYm9yYU5xUnM2MUFXUlVCaG1aRElNaDJvd0R5eU9XMWRXd2w2?=
 =?utf-8?B?V3kwczljN3RFdkdETmhmb2hxcGRJdHAxRzU1ekdndUc5QjZiRWxOUmwxUDlj?=
 =?utf-8?B?K3ZnMUF5ZEtwcUNxZE9JaEZ2ZTdzcExZQzJ1OWRERE5GbHpEb0FZS2YrRW5M?=
 =?utf-8?B?VG0wT2cvQXRadzhYSjF4aThxQWN0aVpvWkV5S3dqcVp3K0dTbWtHZjIyaVIw?=
 =?utf-8?B?Q3ZDMUx5WTlvVlJ5WmdEa1JPVFBVUDk0aVFpL3R4dDdPaDNQWG9LZlp1SVUx?=
 =?utf-8?B?blVhVFZYZ1pnTmp5cnppU3hiZmxRd0Q3UE1GU2VlQUJBWUNzeHVJN2g1Ynlx?=
 =?utf-8?B?czkxNnpnams3cGowbVJmZjhPdUVhVEJpRjQwZFlXcVpKci9vSTZCNHlxclV0?=
 =?utf-8?B?SFFDd3AzM3FFaE5VTGpoYmFNVCs3YmJQcnFrbzVjL01wSU5qL1NQcStXUlpk?=
 =?utf-8?B?aHY3U2Z2OHloYi9xN3hSUzN6bkQ1RUxKRGY4TmIxaVFWdTV0Um9LUHFEeEFC?=
 =?utf-8?B?MnpPaU15WGlzQlJkSkh4YUM1dE5jVkxTRE1lSjcwbWhhUnV3VkFCZXA2bnJD?=
 =?utf-8?Q?MPYuQQH/+Bo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUFxSGZHVnRUT0pJNTdxR25iemdobmpLdmNaS2xHL1ZWRE0vL3NYMmx2emJD?=
 =?utf-8?B?aUk4RjRIV0h4UjZaTTRCcGgvQ2xoWU1nOUFONFUyREQxeS93QWN1T0dXd05P?=
 =?utf-8?B?K2xUc2lHN1ZmNnkyQ0tjbWErMS8zVDVTajdQZWE5aTR0ZGpFcTE2MU91V2FW?=
 =?utf-8?B?cTB1cXpLLzI2NXJzcG9uNmttN1NGdUpaRDI0TWwvMDZGMlo3czNuOTZDSUdr?=
 =?utf-8?B?a3FROTJHRWxHVHhjd2szdjdJelhhR3BxbHlFMVorTytEcVBXUTZrWHhCUkxJ?=
 =?utf-8?B?ODJ2VjI0VXlWVHNZak8zYWt6RjlqRXcxZm5KTEVUcTFGNmpuN0lmbjFGUy9Y?=
 =?utf-8?B?bFJDdTcvdjlkN1BFdjFyanhWSVRTOE5RTFZsOE12cU1hMDRvb2Vtanl6NHJy?=
 =?utf-8?B?TzFjVmJ0clFwYVA3OTQwN3psQmJYb3hlaU5GcHkzVjlyK0dvSmxvMFJpUE8v?=
 =?utf-8?B?akxaOW1IWlRQYVFySnk2d1QwYW9DTFRicjFyZVV1T1NKUE1UTVR4U2l6NUpx?=
 =?utf-8?B?YmE5UUkxall5NmFDVmdxRnVTckh0djJMbTRIM28yQ0wrelBvcUxXbzZUWTlM?=
 =?utf-8?B?UHlUL25xdndJN2tPamVFK21BOU9lMEhFTlhpWFF1Z093UmVnSGxxU2RZNXVm?=
 =?utf-8?B?MHlGWkJSQitlaGdtK1RCcE5Lcmkzc2RTbkZUTFQreUZFczV0S1lneXJJa0VI?=
 =?utf-8?B?WitVRitlcXQ3QkJmMjZyUmFTTGdYa2tNRnkrWjIzTEFZZ3Nqd1NZNk5ERFJV?=
 =?utf-8?B?ZnN2b29rcnNaWWFGdjlWeUNvYjFrN0lmNk5zRW1jdW5iNU1uaVI4OXg4U0lv?=
 =?utf-8?B?WE5PMndyaytzRjZsYU9iWExJeWR4WmFZSWF3WCszZnBpNmNRb1B6a0ErNFZ2?=
 =?utf-8?B?NG5LeWhzdlpoWURQQ2krSlMxY2xwQWhWS1ZjblpuYmZDUVc3TzU2NkJEaVQ3?=
 =?utf-8?B?ZlA3WGdBZ1M5RFh2LzdkVzBNdUhyV1hqU1NiczdDaEQ0S3lmTHRWdjZTZ1Ez?=
 =?utf-8?B?dEZnQW1QVExkekthUC85WHNWT2ZRZmh1Wlh3RXJ3cUd2Q0dBYUsyN2FiZnJq?=
 =?utf-8?B?a0R0b0NsbWlyU05od1ZkV2c5MjFRZ21uZ0lSK2F6VEU0ZkhzcGwzNSs1dmE3?=
 =?utf-8?B?NncyUjhWMzhmaHVrbFBwMWJnK1l5QWxxQld6K09JcllTREYrbjMvZ2xNOUZG?=
 =?utf-8?B?YWNGNXFyR042dUZtM0FZNkxRbCtUVFR3UzA1QWx4eGxHTXNENkd0dWFBYitQ?=
 =?utf-8?B?Y3R3WFM4b3FETWRlVWtPYjF6UmZLUUN1N2lvSHdidXVJc0lqclNmTCtCMVh4?=
 =?utf-8?B?eFU4a3hYK1VNTW5XOWlEUmpQMzFJd0RCT3RQdlR2Zi8vaSs2SURXU0l3VnNp?=
 =?utf-8?B?OFRRNjcwWWhIMldMUEIwMUxsMDc3ZDFQK0NrQUVMSk5jTDZzZGY5bGZGNUNi?=
 =?utf-8?B?Z3BhMzN6NzlsRTBMd29BVmo1dGNQbGNuU1Y3M3B4YjREUXFCS3RhRVBWbnU4?=
 =?utf-8?B?dVozbWdWb2lnL0dQMVZSbFZRVXZwRXBrS2JiRnNOQ3VXUm9rTlJMdUljdGRV?=
 =?utf-8?B?K2dZRE1xazRZa3J2dzdtVDFZN2lWV1hHNUdCVnM3RGFtY3BhS1l0dVZac0Nq?=
 =?utf-8?B?MlByYy8vMVhnUDZ4Mmxtd1o3WXlVL00wVUllME9rTVAvQSsrRzU3ZmZHQ2Jr?=
 =?utf-8?B?dHZPM2I4U0hoSHEzWmJ2N3AvTXg4UTlGSXc5YUFKcnpESVY0VG05VWdpNDdS?=
 =?utf-8?B?T3V1MFhyaWJURTNTbEJTeHIvYXY1TWJ0RERueWRNMTVCSHNtSS9PTllOYlB6?=
 =?utf-8?B?YUdpa0Y3T3dXcVhJWk5Ya3VEVVFGR3cwckNzT3F4T1NDbGVXZlFPMDJNVjU4?=
 =?utf-8?B?cnplRUluQWRjN0RJaWM3V1YyaVRmS0VrNmxDaUJaM291V3N6cGZhZVQ5OHds?=
 =?utf-8?B?SnhsUWhadHMxR3YvRUVyUDg2TEZDMTUwK2ZSdmN0Zi9GMVZLWG9CNkxvTHR1?=
 =?utf-8?B?dXJoMlpzTEVkOUR6M1ZSR0thSWQweUNyL2ZXY3htWlAwTEJaUjZDK3lTZkFq?=
 =?utf-8?B?bmZ5SEQ0eHNLeW9kSk12dFdHOEZ5M0dHL2hudkRkeVdxS0tmOWw3NjZyemVG?=
 =?utf-8?B?VFUxdkVLTzU5OXA4dDZkZ0ltQWZab3IzUkl0U2dqVTZQQzJxdzMyWXQyZVlP?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47363f15-7c4d-49f8-6693-08dd9183f8a4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 18:36:55.7158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9+hnXMnAV2U45pVT870O/mQkPEysJIa4RuTFvIKmZTeeb+YJt7gW4LZfwFcJYAJS/6ucz8Z/lYSt7ouUrWQu+6ufEply+TChoUwL4RXhVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8408
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

On 5/12/2025 9:19 AM, Michal Wajdeczko wrote:
> When running some fault injection tests the driver might generate
> a lot of error logs which might unnecessary stress our CI systems.
>
> Introduce a flag exposed in debugfs that can be used by the fault
> injection tests to give the driver a hint to suppress non-essential
> error logs or dumps that might be otherwise generated.
Why use debugfs? The whole point of the fault injection test is that it 
replaces an existing function with something that just returns an error 
code. Seems the perfect way to have a function which is simply "return 
0;" in normal usage but modified by the injection test to return an 
error code when a test is running. Which is what the original patch was 
doing. That way everything is self contained, there are no extraneous 
interfaces in unrelated subsystems.

Unless you are wanting a more generic 'test_in_progress' function that 
is not specific to fault injection, then using debugfs seems like an 
unnecessary complication.

John.

>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c      |  5 +++++
>   drivers/gpu/drm/xe/xe_device.h       | 12 ++++++++++++
>   drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++++
>   3 files changed, 26 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d0503959a8ed..0567a57597d3 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -235,4 +235,9 @@ void xe_debugfs_register(struct xe_device *xe)
>   	xe_pxp_debugfs_register(xe->pxp);
>   
>   	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
> +
> +#if IS_ENABLED(CONFIG_FAULT_INJECTION)
> +	debugfs_create_bool("fault_injection_in_progress", 0600, root,
> +			    &xe->fault_injection_in_progress);
> +#endif
>   }
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 0bc3bc8e6803..ea25d8161050 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -209,4 +209,16 @@ void xe_file_put(struct xe_file *xef);
>   #define LNL_FLUSH_WORK(wrk__) \
>   	flush_work(wrk__)
>   
> +#if IS_ENABLED(CONFIG_FAULT_INJECTION)
> +static inline bool xe_fault_injection_in_progress(struct xe_device *xe)
> +{
> +	return xe->fault_injection_in_progress;
> +}
> +#else
> +static inline bool xe_fault_injection_in_progress(struct xe_device *xe)
> +{
> +	return false;
> +}
> +#endif
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 06c65dace026..513a811a3121 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -578,6 +578,15 @@ struct xe_device {
>   	u8 vm_inject_error_position;
>   #endif
>   
> +#if IS_ENABLED(CONFIG_FAULT_INJECTION)
> +	/**
> +	 * @fault_injection_in_progress: flag used by the fault injection
> +	 * tests to allow the driver to suppress non-essential error dumps
> +	 * that might be otherwise generated due to an injected fault.
> +	 */
> +	bool fault_injection_in_progress;
> +#endif
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)

