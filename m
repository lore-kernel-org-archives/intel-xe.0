Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8386CC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 05:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14870112139;
	Mon, 29 Apr 2024 05:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KfE/tBoK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31349112139
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 05:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714369260; x=1745905260;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=6plKbiNnFqYfTprEMVCsy39Dw4223XdN80kFIfJLIb0=;
 b=KfE/tBoKew8UnTBTGFID8ipjpZQC6P1KCT6YkL8Iv25bJXHpdXJmXaUt
 fqWUhUg0dUdnc1yWMGql8b8RvJAh/ZrJGRoZRcxyezOjzkV3flrZDDKfU
 rAGRv40jPgEf9PYaQGx2qINCXYH3Qa5oBa98Q4GExyzkmfI3hW1KkJonY
 E3kH3v/Xwb+cQTSLxapoN5/dXD3pf/hM4KsFbGE7WlsOC7orm/x6wozlB
 VgMZO5iJ9GfExTt05mK5j7EhACv1uqLxaqeKw+XxaA68+J2OKpbb6WbrY
 abKCUNac29cypEYDA6BoePbgYaKp4a05NUvLZW4W5NspMKAHiF6zjTBkO A==;
X-CSE-ConnectionGUID: B49PgfKJQ/2hxnoSDJdutw==
X-CSE-MsgGUID: gfb6iRzFSIC9v6ChqT5UoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="32518459"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; d="scan'208,217";a="32518459"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2024 22:40:59 -0700
X-CSE-ConnectionGUID: qF/adAtcR5uGbg98WCf8Dw==
X-CSE-MsgGUID: 5RiGCLkDT8GPlbXQUxRsgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; d="scan'208,217";a="56899747"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Apr 2024 22:41:00 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 28 Apr 2024 22:40:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 28 Apr 2024 22:40:59 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 28 Apr 2024 22:40:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dzamgc8u4Q4uWxOIb3D5/7TOTwJoiHWXXLh4KVLc//Uz6feH2slkyJz/saehW8wLyibR9dw39lpFkaLK9L3KQsquR1oSnGR21JkrEvtJzqRVBJ1XJu4OEuiHdLGJmmKjCipZgrUMsIFEP/yVqR1L0CwtTDAcMATYkY7HC8dPgjrVb3OMeNjHJVZpS/J4fbK9sS7ZFlIoWKi46O6boH5Hlzo45P7YWgpLsCiY6ZR6hPZjWN2kIazBx3dEOnKb4AaIahuUBq6N+VgFuPt4Hk66iuB5gwsPMHt5CJhzYb9Y1Yovf9nQkcRtFXgeBgFTQU46ouOO0r2H32iLbeIiGGeEHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ji5LgzML/rkatUZ2hkR3pykauFBCYNho0C8KewS4Mm8=;
 b=BSoqURv6wbMUoBtt8c0fnSSgWjpwYe4pUd7/z3+I4S7kDfyd/L5Y3TWkoR1BDWddjMEplcIQpOG8gyyxSSdZ44aHAaf/eKg9SwHxuX5vNJefCCVRrb0qt2v9ZQqIBrTAqjIJrzR/HFo6Lch+/2dLZ5AUk+GKb0pBRXMc8z68/cCQsnbttnFKEgbjzNORXrmVBCGtE017U6hvccIzzf4e/v2EAR2KbjRUVX/Dgh/jC4UcGIYE6uy2FlNzD2eumYXJ3N23EYtFvrofthpSFfS7WcRW5Upf98X3qFVR+Cax7iXuHryuLzfNc2qIvnL+4un1W5c6A5hmoFxB152Ip3DUEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7321.namprd11.prod.outlook.com (2603:10b6:610:150::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Mon, 29 Apr
 2024 05:40:56 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 05:40:56 +0000
Content-Type: multipart/alternative;
 boundary="------------kfOzCRYrPgADHWKfLMWFcyQF"
Message-ID: <a21cfdbb-a276-4981-add6-96b4c28cddd2@intel.com>
Date: Mon, 29 Apr 2024 11:10:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Merge 16021540221 and 18034896535 WAs
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Matt Roper <matthew.d.roper@intel.com>
References: <20240427135339.3485559-1-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240427135339.3485559-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: PN2PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: 228e74a9-bd97-4eaf-b72f-08dc680ef11a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnU3a3dnQkF1NndES2Z5aEYybXJ0WnVKZnp1WERYQ012TE0zV3lHLzhUclUz?=
 =?utf-8?B?UGxiK0dUODAzaHZveVV5Z2VpTytQczQ2cFhqd0xTYTE3NWJFSzZOWHZKbVJ5?=
 =?utf-8?B?WXhxOU1mbUJ1dVo4UzdkV0trOEdWMk1pa2plMDlKUFFKdG5uc2RCa2hkNkU0?=
 =?utf-8?B?MHR5Z0ExZTFDRnR0Q2hicnJHY2ViWExZTVY4MFdJUEtWaVIwU0VIUTEvaEpp?=
 =?utf-8?B?cjU0NTFMcWdMYzNvVXNiNWZjRFlEWW0rZWc2RFdkeUN1dm4yU0RCU0o3WHA1?=
 =?utf-8?B?R1BDSFppVUVtK2tNdEQzbWlYOHVpdFU3NDg0SEordS9Jakk4TlorUG9NZlJM?=
 =?utf-8?B?SzJxM1N2L2dYVFNnNDdDSlNoOUQ4OUVkdWtuSEpIeTVWQlh2NTd4NVZSWmty?=
 =?utf-8?B?ZGEzZHdkMk5CUVpRV2JHVlRGNzRieHlnSXVaTUNQS1d4dmxEUERzdHNadUNx?=
 =?utf-8?B?SWlNdlhZNG53c3JyRlFsa1BBTmMxTWl1Sk1HM0Y1Q1V6dUNYVGNWSEtpNFFI?=
 =?utf-8?B?RmczamZ5Q1UrZVlnMThnbzFQaU4wYmZmbUMrUWVhbC9kL21XT1B5OUhOMWlL?=
 =?utf-8?B?OFVPUkpYdmsxN09vOU1qYVd2d3RYM3BZVmVUREllNG5aZ0M0S3RESE10WkNi?=
 =?utf-8?B?YXFlWjNmY2s2eWJzTWQwRlRjMXNmSi9Hd0cxbUhEUmIwK2dDeG9MOUUyTk9Y?=
 =?utf-8?B?RmZqd1VnVE9TUVUzQW5iTm5wMktBVlgxZ0RZQ084Q1A3NTdPRlZsMlNCNWJ3?=
 =?utf-8?B?Mk0xRGhBZmJVVVFyWG9qbG41QVA0d1JLWWowYVRNT2MzOVVzMDF1M1N5R2dm?=
 =?utf-8?B?R0lFTzZ2Qk5ybHBrRisxSVRGL1Y5aEV5amc0cVB0SnE4WFV2cGtzdTZiTnJE?=
 =?utf-8?B?cHI4WjA3Q3JzMlVUdndJOGtxSS82a0ZFNUtNRCtGOUM1OWM5ZWRGaTJ1YTFC?=
 =?utf-8?B?SitQYld6cW5ENzFvSlBlNzZERFNDSW8rVGJoUStMb05CM1NZbnhzckNCT2Ry?=
 =?utf-8?B?bm5KYWJ5Yjh0OUFad1Vhcm05dTlNTUxZajAvSWhqU3UwcUVxaWVDaU1PeWFN?=
 =?utf-8?B?YXo0c0lZUVQ0R2h2aldzdGNpRHhTQUlXNHEwN1BMUGhMb1RVa3U4L0ZydEhZ?=
 =?utf-8?B?QjlFMHhHSjhidHk0MmhlY043WlAyWDcraDkvWHN1VEtLL2hWR2FBSm4rOUVK?=
 =?utf-8?B?ckw5aEVrMnUxSzMwQTBsZ2VjOTRMT0pXYTNPM0FrVkNPTXl6UUtRdnR5QnJo?=
 =?utf-8?B?V0twNnpOZVZ0a2RhMWtOcWhhbkN4WTN1L2c5Zmc5Wnk2ZXAzaVRicmZVSUVH?=
 =?utf-8?B?SElwZFJaV3A5WkdkYjNBcFlGN0VCRS9ZdUg2UVRlSDFkeHZKREgxVmd5WVMr?=
 =?utf-8?B?QmJ4M2p1TDVFKzZVK0FkUWp2M1owa1pLN21iR202NkRZaDBlNmEzdkhyMGRn?=
 =?utf-8?B?dVhrYUxycURuNG9BUGVMU3dtdVQxT25uRDJxQXdoTkNyQzFFa1dWZjVpamFI?=
 =?utf-8?B?NHlNN1pXakptRGRiWHFSRDVJbkhsemlDY3d5WVpUcnc2aEZEdFdWKzFqZVQy?=
 =?utf-8?B?MlMzckJJZzlDa0VpdHJSQk5TMmlzKzBIWVVNMDhDWHdBTHVGR2plU3Nwc1ZE?=
 =?utf-8?B?KzFjR1lBQzBlQlV3aG1hZlFxTVNTa2FxQVp2Sm9hMzNWRE81a1lNWW5mdW9D?=
 =?utf-8?B?S0tlUVplNVIvNW0rZE12MTB0Tzl2UjlXd2Y5aXlpOUhSbGNwekFjZUZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVVkdFB2UDN4Q29tZWtPOFZIeHN0Z0kvNURsTkcweVpyck9OZmZ6aTBKTW5m?=
 =?utf-8?B?M05nQWZ1ek1TY0VuNjZvaWV4UzJCWG1kbCszQmpodCtNNWYrRjZKeFlGZmJR?=
 =?utf-8?B?TjFsS1lrb2hoZUZvVUNsR2QrV2VYa0xtMkZwazJJL0lNWlViSU4zWUN5dnpv?=
 =?utf-8?B?T2dLbWdJbEFjcWRLQVpJb3IyclhWNHpWK0xxQnU4N3FDQXVlc0wvK1llZXIw?=
 =?utf-8?B?WGUydmpIUW04NVlsWS92YlphVUxqNlhzb0JhYVAzZVgyOHRZRUd6QmdmRjJz?=
 =?utf-8?B?cEtlZ3RTbEhCdzB0ZDBmZnBFVzlOenl5bzRLUjdteEI1K0hqanhnWnNKZm1w?=
 =?utf-8?B?bUZ3dkpnWjZBSlJtQTIrQVNIV2tjVFFHVVZ5amhSemtZdDAvTkZlYWlXYjlq?=
 =?utf-8?B?V1E2N1NYb0NiVXJRNUdkZmE3MUsxZEZpTm5Ud2hkZzNHd3NScTdKT3orSmdy?=
 =?utf-8?B?K0ZXZzhWSG1DZjdvYmFqRDZVQmd0Qmcxa0FOZ3dNbDI4WVlUN0t3NC9WNlZk?=
 =?utf-8?B?L1BodUZUcmVlVURQTjZ4aU12TWZKRDcvM2M1QWQzbU1oZTdFRlM2NHkzSisz?=
 =?utf-8?B?clpHM0FteXBaczB3MUpnRWFqQ2VWZDlSYTR1ZWFHWVExeVBDRHUzaFoxcUJC?=
 =?utf-8?B?Zmg5TDU3RUtob3orc1NaUENqQnZpaDBMV1gvVmVUcytnNnVkS29zTHc0bTZn?=
 =?utf-8?B?VndGbEFxU3JzTkJuY3lGZEVYM2hXVWoxd3hFem1yazJWTHozRCt2RU02RVdE?=
 =?utf-8?B?Znl4NUo1bVFIRC9ienhFT0R3UHNYSUJZVXpTc0lRTHZXUVpQOWI4elkxbW9p?=
 =?utf-8?B?UXhubjh2Rll5blpmR2lydkpsWjFIbjNRQi9iRFpOb2dwUkxvbldwMUZjWEYz?=
 =?utf-8?B?ZEdpYk1Va3lqM0QwdC81YnJwV1hwa2Y4TmlmanpuYXlYVWpTa3RCTEs0LzZ6?=
 =?utf-8?B?dHo3a3ZhMXF3RWRLemNweFREVlcyMkt5NDBrY1FpdU1DRVhvTk5GZzdJYXFv?=
 =?utf-8?B?emhTL045NGthREUxbmtKNStldHRURStOK2VRQTAyRmNRWmZ3V1FXOGJsSS9D?=
 =?utf-8?B?UzJ4N2xESDBzY241ajNWbXNxaVdjZ2tWK0ZmSWhYQ3FHalY2TzZ4VEVRYlg4?=
 =?utf-8?B?N3kvUEVHayt3NjVJM0huL044TVRTaWxCREZQd240RllMa0FDVlRSTkdIK1o4?=
 =?utf-8?B?bEFhc0oyNVlNeGtvdklyc212bnVySjB5WkJsa2haZm1YbTZINkE5ZmFCUTgr?=
 =?utf-8?B?QkRsUDFGQkloRUxRb1RVV2dxdkkxWk54WmMreGxXSTBBblQvd2RWczRROHlr?=
 =?utf-8?B?ckVXRXN5MzB0OHgrQVVHSmN3eXBGVVpVY21KRFo4ZUdidkdFVHRobVBvOElC?=
 =?utf-8?B?UGJJbEpOMlN2UHB1UjdlWXRqY1NJa1NxL1FlTm14NjFIRVQwdlN3VVRCVVJo?=
 =?utf-8?B?N2pPNHRHZ3c3V3hlSHU1YmVPRkZCRnpuc05DSURjVDhEUG8wQlBnRTZvYndL?=
 =?utf-8?B?T2E1anVCc2tVdnFHS1MzdUR6VGMxVTRQUHhEWC9TclBpQWZicVM4blRXZ3hV?=
 =?utf-8?B?LytPSUh6ZTFJVllWOWFKNFltUzdaak9NazZ0WFFPY29Fby9rMUtZUU9PUFZj?=
 =?utf-8?B?YTBzbjZkdWJoMER2T2dadWJoVmNaVVNJbS9UeWxxbGVjU1VDMzV4WklVaXp3?=
 =?utf-8?B?aDFvOTlLU2I1bVVjbW9IbzFVMmJadWY2dSt5YmlycnU0UStnMVc4OWxnZGZo?=
 =?utf-8?B?REVhenR5VXpQY2pmY3dTazhZUEFpKzBSRC96dkFaMlVzS0FqSmo1TjluUk1P?=
 =?utf-8?B?S05BTHY5ZnU3S0JBTW53REVITmZBK0ZTMWdNWHo0YjVnWklpT1YzYk1Tc0o0?=
 =?utf-8?B?TWJwSjlpbEwzS0hyS0tZNmtJUkhtU2UvanJ3Z2JHWlJ0NXNVYjdTeVVxbzRJ?=
 =?utf-8?B?OVVCUWliOE1MZ21wOU5VNlQvdjQrcnV4OFJ1TGFGeU1QV0NyVjY5cXQrUHhB?=
 =?utf-8?B?YkRZV3dTeWNPeTd1YVhlWHBYdUlibjRLN3lzaXlxUU1xbmdUbFhCMnZkSk52?=
 =?utf-8?B?RXRsMzcrc2pzbkozZW9yeDVnODdkVlBURklOdFRGcktwOEx5MmVHeXZCSnR1?=
 =?utf-8?B?NXpLTTB4cVZBUTdoTHNGei8xUGNzOTJCb3lzNFZKZ3EyTGhpd0hEdENDdGpi?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 228e74a9-bd97-4eaf-b72f-08dc680ef11a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 05:40:56.6548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBaoqi3fppx9jtUrfVLy+z2K97Kg4+0jZCfikTwlbAkv5sHrdTF4dMkYrysOqHLdYhpspjyD6VWIis6uV74c15PX0g8RMMwa5r3+Pxg/yKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7321
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

--------------kfOzCRYrPgADHWKfLMWFcyQF
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 27-04-2024 19:23, Lucas De Marchi wrote:
> In order to detect duplicate implementations for the same workaround,
> early in the implementation of RTP it was decided to error out even if
> the values set are exactly the same. With the introduction of 18034896535
> in commit 74671d23ca18 ("drm/xe/xe2: Add workaround 18034896535"), LNL
> stepping with graphics stepping A1 now gives the following error on
> module load:
>
> 	xe 0000:00:02.0: [drm] *ERROR* GT0: [GT OTHER] \
> 	discarding save-restore reg e48c (clear: 00000200, set: 00000200,\
> 	masked: yes, mcr: yes): ret=-22
>
> RTP may be improved in the future, but for now simply join the entries
> like done with e.g. "1607297627, 1607030317, 1607186500".
>
> Fixes: 74671d23ca18 ("drm/xe/xe2: Add workaround 18034896535")
> Cc: Bommu Krishnaiah<krishnaiah.bommu@intel.com>
> Cc: Tejas Upadhyay<tejas.upadhyay@intel.com>
> Cc: Matt Roper<matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi<lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_wa.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 9d9b7fa7a8f0..db7c7c7875c5 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -449,12 +449,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>   	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>   	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
>   	},
> -	{ XE_RTP_NAME("16021540221"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> -		       FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
> -	},
> -	{ XE_RTP_NAME("18034896535"),
> +	{ XE_RTP_NAME("18034896535, 16021540221"), /* 16021540221: GRAPHICS_STEP(A0, B0) */

Since 18034896535 is applicable to all variants, the patch looks good.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
>   		       FUNC(xe_rtp_match_first_render_or_compute)),
>   	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
--------------kfOzCRYrPgADHWKfLMWFcyQF
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 27-04-2024 19:23, Lucas De Marchi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240427135339.3485559-1-lucas.demarchi@intel.com">
      <pre class="moz-quote-pre" wrap="">In order to detect duplicate implementations for the same workaround,
early in the implementation of RTP it was decided to error out even if
the values set are exactly the same. With the introduction of 18034896535
in commit 74671d23ca18 (&quot;drm/xe/xe2: Add workaround 18034896535&quot;), LNL
stepping with graphics stepping A1 now gives the following error on
module load:

	xe 0000:00:02.0: [drm] *ERROR* GT0: [GT OTHER] \
	discarding save-restore reg e48c (clear: 00000200, set: 00000200,\
	masked: yes, mcr: yes): ret=-22

RTP may be improved in the future, but for now simply join the entries
like done with e.g. &quot;1607297627, 1607030317, 1607186500&quot;.

Fixes: 74671d23ca18 (&quot;drm/xe/xe2: Add workaround 18034896535&quot;)
Cc: Bommu Krishnaiah <a class="moz-txt-link-rfc2396E" href="mailto:krishnaiah.bommu@intel.com">&lt;krishnaiah.bommu@intel.com&gt;</a>
Cc: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
Cc: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
Signed-off-by: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_wa.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 9d9b7fa7a8f0..db7c7c7875c5 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -449,12 +449,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
 	},
-	{ XE_RTP_NAME(&quot;16021540221&quot;),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
-	},
-	{ XE_RTP_NAME(&quot;18034896535&quot;),
+	{ XE_RTP_NAME(&quot;18034896535, 16021540221&quot;), /* 16021540221: GRAPHICS_STEP(A0, B0) */</pre>
    </blockquote>
    <br>
    <p>Since <span style="white-space: pre-wrap">18034896535 is applicable to all variants, the patch looks good. </span></p>
    <p><span style="white-space: pre-wrap">Reviewed-by: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite" cite="mid:20240427135339.3485559-1-lucas.demarchi@intel.com">
      <pre class="moz-quote-pre" wrap="">
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
</pre>
    </blockquote>
  </body>
</html>

--------------kfOzCRYrPgADHWKfLMWFcyQF--
