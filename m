Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9EDCA0EC4
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 19:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4327010E196;
	Mon, 11 Aug 2025 19:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IbYXkgrx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C696A10E196
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 19:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754940362; x=1786476362;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HWYIWjm6MO1/tjLY5cH92oCJqvjXY9EC+tJ6Tw06cT0=;
 b=IbYXkgrxqvtdI8iuIZQSxjIyUu19XjIlQLIBxJdRVDMWNVJvKbZ6LnJx
 GBc5+c0+aoauLAw74wXuxlWmJpfyWcXuRtXv56ao6JdYWgfwcJYWhSBlT
 mt0R072j94cNpX2wKrENzGR8s4rNEQrKzJd5ekW10P9Emh10WwtEhymZ7
 hAQdkW9lW+ekSjB2AUIdMyK2ea0h68/GUABuP8ORM0rgKGtGTKzVg/kt3
 mNueXoZquTGpGGCtmyyAZFxOsFoXH9H+gVV4zg3eU+0aZwNHSeJbmz38A
 nSt1qLxwH/uUbspSw1ObJER3oYknjDUFjUxS/9VUarQFM0eZSNdYwTZyU Q==;
X-CSE-ConnectionGUID: 9Tp27V6xRBOZHxEMu/WZ/A==
X-CSE-MsgGUID: z+LnhLN1Tjq1q+aZ7WDh6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="44785220"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="44785220"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 12:26:01 -0700
X-CSE-ConnectionGUID: bykZzrWZQA+hvN8YG2vHsw==
X-CSE-MsgGUID: N+6tP+t/Rg+Pz4A/2mAeCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="203174700"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 12:26:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 12:26:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 12:26:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.57)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 11 Aug 2025 12:26:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgC/aMF0Dbv9YSNp6AJWi6+G+II8EwS9I8a0jFKNaVwIffB2LlHeGkjHpNR2yiPFt3cHil7qfNJybKrQwwtm3dgewVjW6nldqiS2A63eXB567TyQzC7uAlYV60pxfrV8oMf+FhqybSvG+u+pOIOjurqfxrHwnSdNIoThsUaY7LsjV/bIa4MEPQAp/caENSIxedVOYzJrK6vLpsgxqH2Y4+58MFSSqPWDX7KIPrdWNofJxIV68Q99VnFvzUHmVYCWac0xvstNGYTR4apld+3OkG2t2LXPa6Z0PTQktiQeHZF9xycS04waZx6Yue6A9unCn2yUjB0nXV9ONE8IS9w4oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITbb42RyiSCodxGd74GZpcg3CUqOZpTrq9YqL2qq0Vg=;
 b=MHWy9EzJMcpab6tXs4piSboWsRou3wuJ78hwTC2A9EzmiVTH6tnrRpQPpqcc/DWFefg1WtlDMZy+UzA7a5DROX94kf5wIG7MscROSOR5yDTQqI0ddKMXWhbF5Pp78jCO1UEpYQtPd5kn4pPa4bXPgtor62G1fkxgkOWWS2tVtlRzWOk1DB9y3fHZFiAdAeOj+WESOfEwbxIYbsqqaw3VKrrsU8Zoeo0hdYk7bdbvjxDk7Kse1AAj+kBrfZFR4LIZ0MJbYUKC4g4xPrTiuFv9MTPSks0O9tWlX0gQ+r9SB9SIHjnhmWBBLlD+pCadGm1/6oAXmRIA+MRk3/WN2b4fZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB8937.namprd11.prod.outlook.com (2603:10b6:208:57c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 19:25:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 19:25:57 +0000
Date: Mon, 11 Aug 2025 12:25:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 0/7] Use DRM scheduler for delayed GT TLB invalidations
Message-ID: <aJpDw9ruWXJjXg1X@lstrano-desk.jf.intel.com>
References: <20250724191216.4076566-1-matthew.brost@intel.com>
 <5339ecf6-05f7-4714-8032-c0508259f4a5@ursulin.net>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5339ecf6-05f7-4714-8032-c0508259f4a5@ursulin.net>
X-ClientProxiedBy: BYAPR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:40::36) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB8937:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b0a298e-cddc-4c25-c413-08ddd90ce5c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NktuZFdCcm0wRzg4Q0pnTmdCY1kzRTRYd3RjOXliUGJKN3JTb1VSK2ZBZzc0?=
 =?utf-8?B?dHFsVXd3N1d3YkVobXdBTEtrUVRrbVI4MXYzUzU2Y1NqZ2lxY1hMdXMreTFj?=
 =?utf-8?B?OFhwWUpzekRWVHNtRnk0NVAvSlJHTjJLMW1lWFpZUEFrVnhzU09WSVRqTW9Q?=
 =?utf-8?B?RmtMY3FZNjVVeURDRHoraEthc3FMWER4WmF6OVNsRkNYWVI5V3VvRXlKU1I1?=
 =?utf-8?B?RUUvSHl3ZXVVRDd5bGo1dEY0NFB6dExHWlpEeUhZV285V1BLZzZDZTFvMFIr?=
 =?utf-8?B?QzhGcjJtZnRRZzZ0N1Q3ZG0vTzROR2dNeEJEa0wwbVBFdXI1eXdoOUV4UWYz?=
 =?utf-8?B?ZCsvbmFiMkJiSlowSENtZlRxZHFyOFcvVGF2RE1BRldCSE1FOHZqQ1lIRGRi?=
 =?utf-8?B?bVVPYitUc1FFVXFNenZtR01acExjUHJWcWp6eGpTMURDWjZIM0xTYjcrR2ha?=
 =?utf-8?B?bHkvNEhHTThZNEVQK01kTllBb2hwaFBkK2hlaFVieFk4KytXQzJYaWNaUWtN?=
 =?utf-8?B?SzBoQm0vdXFvMzlzQkdCaS9FSVo0QkFERGV4a3YzWFpYTHUwb2dabnUxWXNN?=
 =?utf-8?B?Wmx6cTBDTjJOZ28xNTZtZkZqTFpFVFRCajhKTmZjbzVsZ3AycDNjQ05HMTUv?=
 =?utf-8?B?UFphVE5COG1yRUtKZ1FqOVVQblhReml2UUlGeUpXUENpZHFtQ1J1UjlDdzAx?=
 =?utf-8?B?c3pDOXc3VnJObzAvaTlMSzhqWWgrT29hYVZjbER5NWg4b0ErRWVNUlFocUdl?=
 =?utf-8?B?Q1c0SXUzMmIwYWY2clpnLzY0OVlTaEVGVTdYQnBMdFlQczVHaFJESTIzcXR5?=
 =?utf-8?B?K3FFQ0NLR0hzdExZYmFLSE9Fb3FqT3h6UEtGQ0Q5RHprVHkxN3U4akIzTTVH?=
 =?utf-8?B?NzM4d0FQU2xwckI2N1pOKzRqWUdSUitFcW80WDhURWdrYXZPYnA1Snh5S2Fm?=
 =?utf-8?B?akxzZUhMaS9yTmg3UzB4anJrcUhQWHJOR0xBVFpJaDBqMEZwbW5ZN2VBQ2x2?=
 =?utf-8?B?TS8vZmY2NHFPa3NwUnlvU016SFFhblZPQi9jdHpuMVduWTUvZllwVFV2QjdQ?=
 =?utf-8?B?d29QbjhLbGtzRldvTHNFSWdxbmpUSGlRMzBKTjhpVTdkaDFiemFqMnpGV2Ja?=
 =?utf-8?B?ejQzdFZtdEVmb3l6K1YzRjJ5QkREQVhUN3Exd0NRTllpMGFmMDNQek5VcUs2?=
 =?utf-8?B?eHJGRnE3SkEwNFNFU2gxNlFkR2lBWmc3TWdzTFpnVXRlcUdFbnVxQzJBVzFj?=
 =?utf-8?B?NHpFcGZlQ1BFS1BaQlJldlRzdDlFRCtKM3hyeXF5T1dYWTFUL215RHFBWVdm?=
 =?utf-8?B?TzRhRzVvWFZvL0VWdnA0S2l6Q0srVEZHdVZpNjQ1NmMwRXBMLzMyeTd6LzNJ?=
 =?utf-8?B?YXd6cThPOXQ4NXNnbWw0NWRqUld0ZExWTWllVHJXZFBHWmljSmpwRVlyMlFW?=
 =?utf-8?B?b2FEVllZanlWdkxOOTdwVks1Rk1uVmlOU2VCZnUvMUp1clR0TEUxaUd5MkpW?=
 =?utf-8?B?NHlpZG1vUmtpSEd6bDFkSXlLSWpra0puSTJ6bDVkUTUzZ21vREx1VkMvWDFC?=
 =?utf-8?B?bWhMMGZpZW42bjhLRzVlWW1ENmdXeU9hWFNkOHl6T1AySy9wY3NVanlrSUpr?=
 =?utf-8?B?cnVBV01LMmNNSE9leFk0Sjd0d0dhbTRud2JKNVlML2JpYmVoUnEveWorNUYz?=
 =?utf-8?B?cExudjl5TnVjOVpVeHcrWW5SUnJnRXlZZDROUGJZUnI1cW9jSkFoMlZEUHlG?=
 =?utf-8?B?ejFwTGtwaElrOUxFeHBhSWwwUzZyRmVadFV6YnZPanpwLzNWZGpDNnRWRDRr?=
 =?utf-8?Q?Jdh9QslFqT4uZduWLLCtHfsDSp8UyiYJd7TG0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0pmTDg3L1Bia2tIK1JwbDltd0NQeXlWY3NaUzRsZkJvaHBiNmthc1pvdmNZ?=
 =?utf-8?B?MkdXUm5wcEhuQmlxWHFGUGpaNmdQZXlpVEFiUC8rV1N3WnczRkNOUWl0K203?=
 =?utf-8?B?dTdJdjhsTzNKTzhoNFpwUnU5b3FNaDF0Z1R4eTUxZzJrSHlDeGJVelBBdzNJ?=
 =?utf-8?B?YlFlYkZKamxwTzJIVmxKbzRRK1RHVHFHWkM4SHJPVml5QkNMcVREUEUyOTh4?=
 =?utf-8?B?UWkrRGZhb3h2VGh6NEh6UEpsN01DWFdoaTdNaTc5VytMWUx6TUo2WGJMbm9M?=
 =?utf-8?B?UDh4YXpCWllYUlh6ZExWSS9TYUV4OFprRU5OK2VrQnV0WEJLNkgyR1FMZndn?=
 =?utf-8?B?SGZ4blhaZE13cFNRUlZ3SlQrZ21GdEJ6bVpOYk9YK2ZONnVFaW9NVzl4M3hR?=
 =?utf-8?B?azNWVEZ6UUJnSkQ5SmROSkFOLys3bC9DcHd0RERYZGFQTXFyeE9ScXk0em92?=
 =?utf-8?B?N3VGdmlUVGUxZElqdlNzTll3VlhaT3JQalE5cjRCdGV3S2h3b2drT3FZTVNY?=
 =?utf-8?B?aEVwemVubXNDczBQak5YUDhDWlpVcWNsb1pCNkFhbWZBTStWRzJ1SCtqUWtL?=
 =?utf-8?B?NVN2VnFkRko4ZW01UlFZZ0hjQmdXY2REbFZtL0dpcFZOV292YWxOTGxlQzhm?=
 =?utf-8?B?Q05Xenk2L0E1VTlONkZuaE8wd1hIWHZtNjFJdW4xWFJSanllLzZ5L0RmcnBU?=
 =?utf-8?B?TnY0Nm5tdDhxVU9Cc3dJd3VIODlnQ2xRbVA2QXM2Q2d6aGZ4a1RGUmU3M3Z2?=
 =?utf-8?B?VGg5V1FUN3NaQkdkbW1mMDRxTkNhc2k1cmlVL2NtK3YyOUdORHpQRHcrNlFM?=
 =?utf-8?B?c3NmTVdqa2dvejFiVW5QcEppYkFKSlh4aDBJb1h5bG0yYUlSbGJGanZMcDQ2?=
 =?utf-8?B?eU5ISHhHcjdVS012RVBDUCtudElVTVMzK3NkVWk1Tmx2QmR0OUNzTjIrcity?=
 =?utf-8?B?MWdaOE94SlVXK3Z3TWlCaGtTbUVSdzd4M2QxQmM0enoxU3IxNHRoVGFmQkh2?=
 =?utf-8?B?eVR1Tzg0MHMvK1I0RGJvNzgrMEt6NWNmelJISVl0L0FQdVZSV1pFbG5nQzBF?=
 =?utf-8?B?VGpsNXFzZ0pteHlla3FvUHZTL3lJc2xHVTVOS3gra0I4OTVpb1YvenBWeXRE?=
 =?utf-8?B?a0JwQkdOZTNSeDNxR1VLMUVQMEZCZTdXRHRnVndLdXVFSjlZTFljUVdmdkxI?=
 =?utf-8?B?Qk01WmRLbVpQb29PdmtGVXJmTWsxaHpUakdDWnRGb0tRTEpWV0k0YS9mL2NP?=
 =?utf-8?B?bnpUZTlFaDB1Q285d1lTSnpVUUp6S3c2Z281OGJ3WjlxcjNMTnRqcmhMWDB3?=
 =?utf-8?B?elFjaUIveWlaaitGb0N5MmFNWHR1eHlDVmJiWFptZVJhdmUvbmxCWE5ZRFRD?=
 =?utf-8?B?anZOMnJQQ2YvalozUUVRNmpob2hnTjJkK0ZoL3VjZWxJVkthZDFTTFE2ajZv?=
 =?utf-8?B?amxHb0hKVXlNSDdpaE41L0dsaE5OMFc3Nkp6OVhBRFhaZkVDMnp5Z0kvNFN1?=
 =?utf-8?B?NjhDdE5TTUNQTHJwaXdxRFF2ekF4MG9TUHZsNzF0YWRqUEhYYTVsZDBXb3Bx?=
 =?utf-8?B?UEI3MU1jUll2aVJUUHRNRGhjMExLZmVvTnhRSEpGaFJuRWcvR1cvamFzYXRm?=
 =?utf-8?B?NDhaUEV3eFl3ajlqaHdQNGZORitrWnJudytacHBRQjJEMEZSUXFoVjA1Z3Zw?=
 =?utf-8?B?dkdVTS9LcUVLeEVLTGtqdzZBejE3UnpuQjlLNkt3VDFWZjA3WXAvSWwxZTdY?=
 =?utf-8?B?N0VUZEZDN0lNTmFqR0Q3eGd2MlRYMUQ0b281SCt4WURubU5Od05qRHkwYVB1?=
 =?utf-8?B?TWRXREJMNmVFa2trRzd3eUNNWVoyb2U4b2tKZSt1YmRSVWtqMEVpZlRJZzJR?=
 =?utf-8?B?OFdFdldiQktCN2RPY3hkSSsyd0UwanAxV2JPREt2U2w2dkg0czFGTDdlTnps?=
 =?utf-8?B?Q2VON2hVa1VRM1FqYkRsL3k3Yld6c25GblVtdUJkeVBMbVdXb2JTRjdvQnlx?=
 =?utf-8?B?U1BIQmRSY0JHVFU4OWJPL1cwYzRqVGtoYUtnSlhra0ZkMUF5dFdmdUtzdUpa?=
 =?utf-8?B?aW90d3A1d05mRll3NCt6czNPL1Y2RkVjS2NUZlNCYkxsU3pBbUNnMXg4RHpu?=
 =?utf-8?B?bDRnVWczVW1ZN3ZMWlFKNUxqbGVPL1lPS0RNMzV3NzluZHBqNnV1TEVKRTkv?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0a298e-cddc-4c25-c413-08ddd90ce5c3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 19:25:57.6757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQy+JH2aOeT96ixNxLEM25ju+ee8CrV4mCq0nHrYc44xo9f+jSQO9K92MPwwk+sfskcrrLErQ7eT98SzTJqClg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8937
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

On Mon, Aug 11, 2025 at 09:31:08AM +0100, Tvrtko Ursulin wrote:
> 
> On 24/07/2025 20:12, Matthew Brost wrote:
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=UTF-8
> > Content-Transfer-Encoding: 8bit
> > 
> >        Use the DRM scheduler for delayed GT TLB invalidations, which properly
> > fixes the issue raised in [1]. GT TLB fences have their own dma-fence
> > context, so even if the invalidations are ordered, the dma-resv/DRM
> > scheduler cannot squash the fences. This results in O(M*N*N) complexity
> > in the garbage collector, where M is the number of ranges in the garbage
> > collector and N is the number of pending GT TLB invalidations. After
> > this change, the resulting complexity in O(M*C) where C is the number of
> > TLB invalidation contexts (i.e., number of exec queue, GTs tuples) with
> > an invalidation in flight.
> 
> Does this series improve the performance of the TLB invalidations in
> general?
> 
> I am asking because we are currently investigating a problem with Google
> Chrome which apparently suffers a lot from latencies caused by TLB
> invalidations piling up after a lot of tab switching causes a lot of vm bind
> ioctl activity.

It doesn't improve performance of the actual invalidation rather the
time to create a VM unbind job as it avoids O(M*N*N) complexity
explosion. I originally saw this in a case of many SVM unbinds (i.e. a
free / unmap is called on a large piece of memory) but many VM unbinds
in short period of time could also cause this complexity explosion too.

By making all invalidations from the same (queue, GT) share a dma_fence
context, dma-resv and drm_sched can coalesce them into a single
dependenct per (queue, GT). That keeps the dependency count bounded and
eliminated the SVM panics I was seeing under heavy unbind stress.

> 
> Also, is it related to
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162 ?
> 

Maybe. In this case, a flood of TLB invalidations overwhelmed the GuC,
leaving it no time to do anything else (e.g., schedule contexts). It’s a
multi-process test, so the driver-side complexity explosion likely
doesn’t apply as this explosion is seen within a single VM. What we need
is to hold TLB invalidations in the driver and coalesce them to issue
fewer operations. I have patches for this, but I haven’t cleaned them up
for posting yet—we’re in the middle of other TLB-invalidation refactors.

Matt

> Regards,
> 
> Tvrtko
> 
> > Admittedly, it's quite a lot of code, but the series includes extensive
> > kernel documentation and clear code comments. It introduces a generic
> > dependency scheduler that can be reused in the future and is logically
> > much cleaner than the previous open-coded solution for delaying GT TLB
> > invalidations until a bind job completes.
> > 
> > v2:
> >   - Various cleanup covered in detail in change logs
> >   - Use a per-GT ordered workqueue as DRM scheduler workqueue
> >   - Remove unused ftrace points
> > v3:
> >   - Address Stuarts feedback
> >   - Fix kernel doc, minor cleanups
> > v4:
> >   - Rebase
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/patch/658370/?series=150188&rev=1
> > 
> > Matthew Brost (7):
> >    drm/xe: Explicitly mark migration queues with flag
> >    drm/xe: Add generic dependecy jobs / scheduler
> >    drm/xe: Create ordered workqueue for GT TLB invalidation jobs
> >    drm/xe: Add dependency scheduler for GT TLB invalidations to bind
> >      queues
> >    drm/xe: Add GT TLB invalidation jobs
> >    drm/xe: Use GT TLB invalidation jobs in PT layer
> >    drm/xe: Remove unused GT TLB invalidation trace points
> > 
> >   drivers/gpu/drm/xe/Makefile                 |   2 +
> >   drivers/gpu/drm/xe/xe_dep_job_types.h       |  29 +++
> >   drivers/gpu/drm/xe/xe_dep_scheduler.c       | 143 ++++++++++
> >   drivers/gpu/drm/xe/xe_dep_scheduler.h       |  21 ++
> >   drivers/gpu/drm/xe/xe_exec_queue.c          |  48 ++++
> >   drivers/gpu/drm/xe/xe_exec_queue_types.h    |  15 ++
> >   drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c    | 274 ++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h    |  34 +++
> >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   8 +
> >   drivers/gpu/drm/xe/xe_gt_types.h            |   2 +
> >   drivers/gpu/drm/xe/xe_migrate.c             |  42 ++-
> >   drivers/gpu/drm/xe/xe_migrate.h             |  13 +
> >   drivers/gpu/drm/xe/xe_pt.c                  | 178 +++++--------
> >   drivers/gpu/drm/xe/xe_trace.h               |  16 --
> >   14 files changed, 700 insertions(+), 125 deletions(-)
> >   create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
> >   create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
> >   create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h
> >   create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
> >   create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h
> > 
> 
