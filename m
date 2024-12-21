Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36182E77188
	for <intel-xe@archiver.kernel.org>; Sat, 21 Dec 2024 00:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58BC10E0AE;
	Sat, 21 Dec 2024 00:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6g1AC1F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E7010E0AE
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Dec 2024 00:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734741351; x=1766277351;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qroGEZj9yJiX+Z0nQrRcdApBfZLOtZ17cgfvvvYnrCE=;
 b=j6g1AC1FrB3X4LR+q/xmDQn7p2tDJtgYwxHj3Lbfd9Vosnnb/vDN+dA/
 6kPtrC4J1gqym3udF+hDTbbAQ0/BBNLUYINGw/1x5gjss8kmBTtActDvZ
 6p8OVEJV09RTIWT8WiTsymzUvVjB5Ee/51xjqF7uP2lnP7hx1lRbDDrDQ
 PwvcgJmchG2okLhjfMEnn2U9hLGNPDd2FVqXJi+SIoKrWM4tcTxODhWBO
 mamNCn7qk4RZQ9h8J21fBd31MPd2NC4+LsAdBMda2YE4GKPIQYanYc4jg
 gOxhbV2nA5aDyY47d2TSWsTg0A9gct+YQ6yPS+LyqLRbjxQ9JySW3V3YZ A==;
X-CSE-ConnectionGUID: osHEJFUfTAKv0BvH94aOQQ==
X-CSE-MsgGUID: jGz/UA3ER1K2GCJkGz0eBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45902953"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; d="scan'208";a="45902953"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 16:35:50 -0800
X-CSE-ConnectionGUID: jJG8yBWESteWgKl7v9hDLA==
X-CSE-MsgGUID: /7rjrYvTSZejPzU0hGMOzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121937324"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 16:35:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 16:35:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 16:35:49 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 16:35:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clx/GOexwk0deMPTXIKX88y8COL2YVvUWnRAcfrFdsz9OAeSTNwRmx8ldrdloRJXFWC7TubiZYj8bG+sumzpi8q8BD1wCCjrswv+Pkxn+smk/riZH3gWYf7ZcpPv4mOG7n63jMRjzmeNO9BD7s7d6XFbxrjRfM3jlMrH9tpefY4dUdo2/6U3JxLHQ6jm7qASzv9eRvktnM65nx/7UUMppF2F2d88lQw+Clq0qBrKrOowLc+RpbaaF+9dhXC6jNgR4IEuFpgtC2qiPtirD1t3UjNl2xCq9ePj4jjEAfbeGSfu/2jhBA6dt9Yop5w4u38xw3jUIcBTlQrhBux0XrjHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzOsLOldBSXcV7gKtSmUE/KRC/KNhvIGQBHlLfbZcjA=;
 b=Y/K67G91u+jQtFBEbUWSn3GpnPKDDL3GlLXKIknVyA0ZnLsasYAlLznkIwxIS9aUzLaU+X6kPuN4Vtlayug0A2tjDryXikqLz1UJycXWrZ2VysWaBcTgBXDPr7eqbcOR+vyUlRBuuR7IBmcE2/4oUb6AxEqwtMdHY69oGu0U6Fb5qmUnmhcd/Vamyo6P08tl27HH+NPfMItHoH8nju9ios5QhcjOM+SIx2ALjyyqoV8KjNoJ5s3dxYJKf9c0tJUgKof8vUq6bvyM7ltjDE/mjbxtM4A/OKJZVuZdSPmyKTjHPGjnHjeYTGMY7MV8brNwvomf7js4WMm4C0v56+hiPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB7050.namprd11.prod.outlook.com (2603:10b6:510:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Sat, 21 Dec
 2024 00:35:17 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 00:35:16 +0000
Date: Fri, 20 Dec 2024 16:35:15 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Dixit, 
 Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v5 0/2] Fixes for MI_REPORT_PERF_COUNT
Message-ID: <Z2YNQ/LTFMTCRQBZ@orsosgc001>
References: <20241220171919.571528-1-umesh.nerlige.ramappa@intel.com>
 <d4f89ead15c16e232681fcf96fb1a0669b0d2249.camel@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <d4f89ead15c16e232681fcf96fb1a0669b0d2249.camel@intel.com>
X-ClientProxiedBy: MW4P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::23) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB7050:EE_
X-MS-Office365-Filtering-Correlation-Id: 77cc0849-4250-4ad3-ece4-08dd2157574e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WCtGdHU3UC85NVQwYkFqM2kyeW5SWHFDeThZTTkzc280dEhNUE0xT00vVnQx?=
 =?utf-8?B?Y0VKTk1VTms3M0VES2lPU0NtTUJyMUJpZFJEU3RDY1N1YmVKWXRCNFhlNDNr?=
 =?utf-8?B?eVp4MnVtS2Jnem5HWCs5cjBkSitWZHVzaVRGbVV3Rmc3NjZyKzhTMldPbGw4?=
 =?utf-8?B?TVZrQmFkMmRJTzBSOE9kc2QwZjFPTXNLOGNNY2RaTElReWQvNFpTVEcxT004?=
 =?utf-8?B?T0owRDROZUZGc2g2WStWbWdQUlY1YnExUzNHLzV3c3B3VUhIeDNOakozbHBr?=
 =?utf-8?B?NFRSc2l4ZUxZbG9wNzQ3NDdVMzQrTWlFcERRSDR2eGhKY29XYmdDR1Zqbmgz?=
 =?utf-8?B?RytseUwyMW1jcHJ1elFVQndsTkpVRXRHS3l5cXAzUlRLZ1FtZGQwbWpqQnFk?=
 =?utf-8?B?bFU0UmQzWnp1SExTSE5QdW5pM1Z2RERXZGN5OXF4ZEMxVFd3MHdFQitSNjJ0?=
 =?utf-8?B?RmhzNDB6T2c3WFdIeDhBVDhGNU1UeHpaWUtmSWFDaHptUmk1Z1dPWGhCSEtw?=
 =?utf-8?B?YkVjM0hpU3ZMdlFZdHYzYndqL1BvTU1KLzE4MjNnZ2VMYUU2L0I0a2NVVzhk?=
 =?utf-8?B?UEYzak4zaUg1dHNKRnREYXBDRUhhSllPK1NsQnVYZS9HOGNFeUIzMzRkL3JP?=
 =?utf-8?B?enhBMWNnemVoSjdvOGx5RVc3WWRORGVPbVNBc0VVZmlTcHRKaS9EYzFEcUhq?=
 =?utf-8?B?aEV6M0tMMXBwVW1DQTRRL1FuYUVURm1wU2xYTE5jUG1FaGc4L1Jsb3dEMWJh?=
 =?utf-8?B?MHRiMkVoSjd2VFFuL2NaamdUdUZqR0R1ZWVNQjNMRnh4bzJBUE1kdzVKR250?=
 =?utf-8?B?TE1FZXlxRHpoL1ozY3F2N1dyeDRtN0RiTVcvSmRHU1B5ZmU1dUpsUmQ5UEhI?=
 =?utf-8?B?RHl1UjJpWERtRjV5RjRXWTFKVzV3SjEwdytDL0tGWktPdkJwZUZNMmxWUUhP?=
 =?utf-8?B?ejRhSHNBSlJRVXEyd1BnaENyNHYzSzhwUDVBN0E4ajlwZStzakFYWkhVZm1B?=
 =?utf-8?B?UnRyamp1b0VFUWt0dmltRVdjV1A0QXVPNjJjeHBYNDhjNDN1R0hKc1Uxcy84?=
 =?utf-8?B?bW9GK3ZxcU4vVFA5UlgwcURCQ3hwV01NdUxPWVVKOTJvVnAvWFhDeFFVUTd1?=
 =?utf-8?B?VStJcWQxaUw0SllIV1NiZ1cyUnFWTlNUVlVmdHhJeHFhdU1pT3JHMTV3eWc4?=
 =?utf-8?B?dDdYbGk4MDd1MVdnYVZuZU4ybEZpaWE4MUpKZ3ZWTVlUckRPVnB1QkV2SkVv?=
 =?utf-8?B?VmZKU1J6NEV5cmRqZlMxdnZhMmNWdXUwWjF5c0sraEJBS0FZaWFsUXNMT0Nx?=
 =?utf-8?B?Z1JkbEFWeDhDOUh1L254YUdYcHJoVXhrdzlIU1E4RGdWbUFOQ2svQWduSWIr?=
 =?utf-8?B?c24yRlBWVDJvaFVsWjFQZm5WSlZuUVNaNVIyZGF6MktxeE9iTURTR0dtVkRU?=
 =?utf-8?B?c2cxcmxzRXZEWDJDNDlaVzl2djRvaFl5a296ZUZVbmcyZWNodXlBVFhqMlJV?=
 =?utf-8?B?K1FOM0hKZmZDbkZrczE5TkREUEJ5dW9uSndVSW5xZ3ZLN1pLR0RpNVZpVExF?=
 =?utf-8?B?ZVpJc080cEdBaVNpWFpVWlJpVFQzOStRQy9mZDVrZkt6dFhSOWRpWG1Ld1l0?=
 =?utf-8?B?VEtLdmpDMEVTM0ZzU3JWcVhDb1NsYTk5K1cwOTRheFhpN1IvMFdFZUVGYytZ?=
 =?utf-8?B?YmdlQlljcEdQTzRkeHRaR2xocVhoR0NZZzNjMzdPeXdPZ3B1WTY4Y1lBMGo4?=
 =?utf-8?B?b0Z0T2VhUDl3dlVNeTVZVGpCaDVGOVljcXh0aDhtZGRZWnhmV2dpQytXUDNq?=
 =?utf-8?B?eW9sMEdrQXgvRWY4WVIxRm90YWVmUEhycGZmNVFOMW1INTF0TjhLZHY2MmFO?=
 =?utf-8?Q?rIy2uT9VoGgon?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWZidUlmS0ZvK2Z6cDFPV2hMM2hDZSt1Yk5zbm9mOEF1RmxaN3lFY1piZkp5?=
 =?utf-8?B?eE1LTFU2b1NVcS9qTTB6TTdlak50R3FQV0lidjlNd2EvcEVvQVNpWDgzUW45?=
 =?utf-8?B?Nm4zb3RQdDNVaXRaQnlVSmFNQXBlcUJpNzEzU2dYUVNqSXdTQkR0b3pnUmNO?=
 =?utf-8?B?WVhhSFg3UVp5emFnb0VDUlVtTnpUVXl2ZmNwVnNpeDhXSGtMb2VsRGNQQTVk?=
 =?utf-8?B?cXR4TEMxamlyallmdUQwbnd5OW1ySW5hOUEwRHRscC9uQlF2VXMxZkpPUkJo?=
 =?utf-8?B?MjF5WWd6dHp5OFpnSERyMnkwYXZLNkpqU0RUTXZvSGQ0NHVsOHUvL1ZodExv?=
 =?utf-8?B?OHNJSXA5cDZIbEc1ZzgwczcvcjluSVd6S0dScjlnTlhpWnJVN2xzdjFvQU5X?=
 =?utf-8?B?TlV2ZmJYR2hpQS9WU3p2aVViVFlxV0VtSlRJM0VqQ3hYRHo3NXZFdlBxbVIz?=
 =?utf-8?B?WVJXOWVsNm0xVGZBeHMrNU1zejRvenJZUGhYTmVoSkd2Sm1sdjZsWXBsdTVo?=
 =?utf-8?B?SWZZZ3BWTTF0VnJyZk15QzZFWVcveWowM2dBcGJ4MU5ZVTZlVk42VEY5UVZw?=
 =?utf-8?B?bzAydlJmNGRxdlA1Y2JMM2M4YXdEdHB0WDlLL2plYUVUZ2k4S1BSdlJiajVY?=
 =?utf-8?B?cTMxc0hWR01uT2RBRWNqMjE5WFd1eTlYS0tQcll3SU9NbVlKeUFjdkZKTGpi?=
 =?utf-8?B?V1ExdWVjdUFIV013c1crNlEyYzdVbVVrNThkNVhRVHFRSjlTR2g0QlFGSm4x?=
 =?utf-8?B?SjBuRko4TDZ0blhtcjNVWDNtLzZKQkF1YjdTMGovOXlHdVAxUlBBRFFOQkFC?=
 =?utf-8?B?VmxDOGxBUlFUMmdaMXVxWC9XYUhQc1daTVkyUmthYUdTTUF1MlZibTZyRVhu?=
 =?utf-8?B?d082THh0U0Q1UkZpVVc3eHJpTXh5cnN4eUJCYVZYRjBmQWM3cTRHRTVBMWRI?=
 =?utf-8?B?dGZRbGZqRVpSZmNQK2RiVktrdGR3VUloMlMvQWVFdFF6Q2dSQUtEQkZnWVZ4?=
 =?utf-8?B?K2hDSmlKWmxUa2dFU0ZPNzRsb2xhNStFQnVlVUhHejU0bkhEWDV3UElaMG5F?=
 =?utf-8?B?ZmFsaVBGQ0Jvb1FmRTBjTnE4VWt5QUlqaXpSdUFIWmZROVJxZHhSamE2UTZZ?=
 =?utf-8?B?S3ZZWkJvbnE2cXhvemlWUWxvYyt3a3pNeVVNOXY5dWtneWZVOUZOVUtVWHJV?=
 =?utf-8?B?M0hKTXFYVXp5YlhJV2I1Y0dtTUxDbVVvWUJqU3YzSjZVRUZwTEVpVEhMeFd5?=
 =?utf-8?B?a29PK1d4b1lwQW81U2dRMVd6VmRWd0VWTFc0R1ltUmFLYkdESDF1WS9MazNC?=
 =?utf-8?B?cGZYaTQyaDlITlRDbDZtTU1lRjVVaS9mTEtmNUtQZklIcytPdXQ1N2ZKVjZ3?=
 =?utf-8?B?VG8rc0l5b0pNK205VXRFc0hoZ2JsRmt2WGtxOHVCbVU4MWFWaDlxL1ZQa3Fl?=
 =?utf-8?B?UFR6TG9hKzFlaUZFYXNkRFNSK1BBVmFmbFM5VzVTUXUvV0liWG13WUxUSm5J?=
 =?utf-8?B?NEJ6V2Q1cjVhb3pDbUNVT01vR29vUWFTQ2xrbWxQazZoNFBlT3NTQU50SXNS?=
 =?utf-8?B?bkN5RHJqSEVOZVJMUXdOWnZXRGN1QnQyUlZsZGRGRm5kQ1NpSndIZlJwWVVS?=
 =?utf-8?B?VnZJeFgyalZWOHg5MFljUVBPTncvSlZDQVVId0ZFTTREV1JHYzA4WS8vUHRi?=
 =?utf-8?B?NHFRRWFBaUYrWnZHTGQ0UVZXQnB6TkhxdXhEZmxVOVpsZHlrK09LRUFjNjE1?=
 =?utf-8?B?alJ0cTlVV1hKTGNKZi90VTZhdVRSNlczYVQ2RklYdW9LWXRFNGY2TVVHemZI?=
 =?utf-8?B?Z05WVWtDUUZNOHp5L08rTnloM08wOHBNNEdVVUprY3ZyR0RNamhKeld3c2Ja?=
 =?utf-8?B?YW03VE8rMkg4NTU5UVAzbHJFT2JPUXV6SGV0aG1wK0tyYXJKcW90WmVkOHlo?=
 =?utf-8?B?alFlY01iOHl5cGpZSVdqWjhPOHJxUmwwcjZHeTdhNTdYcGcxUXVIRWpuVUNu?=
 =?utf-8?B?K0RMZmNSUEV2R1Z3ejd5eUJUUXBZa25INzNCOXRnL0pxc1dQT3ZNV3VqejhN?=
 =?utf-8?B?T3dJK2hKeVA0U2xUQ2VOWEJMeUVwb1lDUVdPbTdqQmdCLzVOV2RycXZsOW5X?=
 =?utf-8?B?enJyQytUWTVYd3Y4QlRTYjVUQ3hFU09FaFRFUklEY3NjQzZxMVhzK0V1ZVYx?=
 =?utf-8?Q?7j9WreEEKsV18mhE1E0Q1wA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cc0849-4250-4ad3-ece4-08dd2157574e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 00:35:16.8328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMiymBgYREH1HTNRqt9O4V5+84qhiYfR3bVit2iVRI1M+Zh7f3sj4rvDdn5R4edB8R/ZaSfKnNl8TPRBiI+6DjyLtJ5+9L0B8TnV1Zlj7iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7050
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

On Fri, Dec 20, 2024 at 11:54:04AM -0800, Souza, Jose wrote:
>On Fri, 2024-12-20 at 09:19 -0800, Umesh Nerlige Ramappa wrote:
>> OA programming sequence for query mode or MI_REPORT_PERF_COUNT requires
>> modifying some HW registers in the same hw context as the user exec
>> queue. User passes the exec_queue to the OA interface and OA
>> implementation submits an MI_LOAD_REGISTER_IMM to this queue to modify
>> the registers.
>>
>> The OA implementation submits a batch mapped in GGTT to the user exec
>> queue and hence, some plumbing is added into relevant code to enable
>> that (as per suggestions from Matthew Brost).
>>
>> v2: review rework
>> v3:
>> - review rework
>> - original patches squashed for porting to stable
>> - code cleanup
>>
>> v4:
>> - review rework/fixes
>>
>> v5:
>> - minor review rework/fixes
>
>v5 fixed the oops that I got in v4 and also fixed the GPU hang when closing OA stream.

Thanks a lot for catching that in v4 and ensuring v5 works.

Regards,
Umesh
>
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>
>> Umesh Nerlige Ramappa (2):
>>   xe/oa: Fix query mode of operation for OAR/OAC
>>   xe/oa: Drop the unused logic to parse context image
>>
>>  drivers/gpu/drm/xe/xe_oa.c              | 224 +++++-------------------
>>  drivers/gpu/drm/xe/xe_oa_types.h        |   3 -
>>  drivers/gpu/drm/xe/xe_ring_ops.c        |   5 +-
>>  drivers/gpu/drm/xe/xe_sched_job_types.h |   2 +
>>  4 files changed, 51 insertions(+), 183 deletions(-)
>>
>
