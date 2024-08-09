Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7400DC49EA1
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 04:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B79110E70B;
	Fri,  9 Aug 2024 04:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UaAZ4hVG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBE310E70B
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 04:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723176455; x=1754712455;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TopHdyTeZOJYlV6DzoDMH8XTOtCWa6JIxoazIKWlBRo=;
 b=UaAZ4hVGCN8F4z2OQlU36oWCqFSeQ4E86CWL9Bgg+evPXHtIVBEXuDrU
 LoGHr5+PwNfAMlojMqjOXKgKN294Rp7OU4YgHkil+L51Xs9j4JMCrsdg7
 /TsbCOGttVgx+f3/74ZnO4g1JnTble5eWFMqVy5UXdt6QmYMBJ4BosQIP
 thBsW8dSG6yv5va4y8OrqE5YFny5POcEIY6KzYkuBT235sQHb/b+EdvUx
 8mmKPqTIx3Gl5C5v+PqMf7pK5XKdg/+B9ENi2ouC8w00/VyBwswMUCrRa
 qK7PUWZ0HSoqvWvyY+F163zBnhS0LmE0HNm/YR1CZayPTSe+S3On+kBsN A==;
X-CSE-ConnectionGUID: NA5ZLVBWQnypKd+KjAXr6w==
X-CSE-MsgGUID: yApNymQ3TF+CR9B/HENrRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43851337"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="43851337"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 21:07:35 -0700
X-CSE-ConnectionGUID: OLOzTYQzT/SQHbMjIBEEsw==
X-CSE-MsgGUID: WL8aCUQqSxurUS45M/ylBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="57662709"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 21:07:34 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 21:07:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 21:07:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 21:07:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lt/xwQnDwfb1Pzh+HrGydjUswoM2c2re5Lwo2UjLgY53V0l7lKlGlMc5aJ7/wv0G+EF+7XDAn8432tWuL/Bbc90NqgxLvMSX1XGMbY901UsUAagOojBUpe8d5w2BHSi9BSF2avkAwTkDK2eSYNlnfu9d53ih/Tvnf2EXNnk4oRHuRvkTYWzJ3hU013n51rveZMpf3e75uVM+DMTZYdBrdPvuSDFozf6CqUKhGuwjsQEZr321Jn90edUiKWlp+Q0H+yYah7KTFqt8j7BDjh41FaCoZgh6a73/4cBPrOzwzm9sQptpjIc5CBJLa2+tDzc0ubBU/TqGit2mIpa9Wp5/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zq1bEXVLrNp1Ib0R9DSqg5ft50bTgoooteFICcofneA=;
 b=GOtqXuxjxeET0gP3kS+4Gh8osMSbNFoX3KcN1Nm/yW5SvSvIHhZ6FV0jSkoHP6CKqQEbng+afVA7H9wLpEHxNRK48O7mSku4l5GJT/9hfZKW8JTeZ3f0yaxoYF57vrIzREiTz8/dXqIoZCeAuaL1tCJX71jzu6gzjOkJ/exW35xyLDyJdLf18vlYoym9zcfFAPzmROfSvAncFssQPkwymQuR4M5p+5S2GkhkbbAgwxaFBu5cKMuBk0ZS5w1zlyCbeOldBSID/loEc6FqNf6HHPwlIdNNQnS+FGe3yLmZF2Kl544u/sufgbgfgMa1ZrWSxlXN+b81lubN/DGeqyWQEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 DS7PR11MB7833.namprd11.prod.outlook.com (2603:10b6:8:ea::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.31; Fri, 9 Aug 2024 04:07:24 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%3]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 04:07:24 +0000
Message-ID: <09eb6fd4-e333-4b0c-82c3-2ffee7295304@intel.com>
Date: Fri, 9 Aug 2024 09:37:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Fix xe_hwmon_pcode_write_i1 param from u32
 to u16
To: <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <ashutosh.dixit@intel.com>, <rodrigo.vivi@intel.com>
References: <20240808172734.2233594-1-karthik.poosa@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20240808172734.2233594-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|DS7PR11MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 50bd6c7d-15f2-4322-2b75-08dcb828c5d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uit5QytNbTRtTTZ5U1BWRHg2UzBaVDRuazBHbmRFYjdKZXJra3ByVXpnZEd3?=
 =?utf-8?B?endFRXFQNWd6bkRaOWZxVVdBbWk5emJpRnhSdUxhdHVUcDhuZGh3cjJFR254?=
 =?utf-8?B?YlNycDdGeVVIMHJOeFA2bVhQUTdpU09heVdXOHZ6TEcvcjg4ZjArV0tTZGhm?=
 =?utf-8?B?cEdpZ2J3TXR2YmplbDhadzN3c0ZzL0VVQ3dxUytsQXhabkx2aTJORmVRL2ZM?=
 =?utf-8?B?b2k0SDk3YU82Um5SMjJUSjk3aTZlNFhkQlRrU3pPS0N1MDFEQ3VRUHRoUmtX?=
 =?utf-8?B?TGhHczlvbmtaQXUwWlhFMUpJR1dhSWtXY3g2cVk1YW5RZ0l1NjM5ZjZLU0s5?=
 =?utf-8?B?RHA3OE9VNEFKMGJIMU96QnNCRmtZanI5dXdOU09hYXo5NEZFT0xvejR6dGk2?=
 =?utf-8?B?MWZQTlYzUWxKcCtTQU1TWlkyYzRIRk9WaW5GNUV3aXVBdGlLNnV4MUZWbU1Q?=
 =?utf-8?B?RDJ6QnMrOUhjUXMvTTFKRkdPL3RKUUJrYjVzZnJ4amJLdlFQaUNacDNKeWx2?=
 =?utf-8?B?SkUycUdVSVA2TEduemhmK1NyUVRDVjdpQmtJeUZQKzhrUFZCNlNQd05tNkF4?=
 =?utf-8?B?RkhjZmdVb21FMkV6WGtyaUV0cWFNN0ZzM0NDVUxZR2VqK2xRVEtNZ2toeWJ0?=
 =?utf-8?B?TXB3NkZ0RGN3TjlERVpUc3UyeGJ6YjgybEpDVHFLaHh3R3lUQmtvRys0VUQ3?=
 =?utf-8?B?YjdraitYa1k1TGJnS2FkazRxMThZWHk3Y3JaMTJ1aGE4Nm5ib2J0aENBN0Q2?=
 =?utf-8?B?QlpobE9POEhLeVkwc1VzWXhvNXdXSnA0U2NRZ3pQK05xTlpnMG9ObThaQ2Zn?=
 =?utf-8?B?V2g5Ym4rVkxOSkQwRy9TYzRwc3R1dnVMbEVNdEh5UlBHTGhlaEEzVnhkY3dh?=
 =?utf-8?B?TE1tdlFUZ2xNVkx2MXhtM0IrOEI3K0ZadlR1QkppSkNOMzdQbTBXYncramRa?=
 =?utf-8?B?ZDg2NkYrdXJxSUF6Q05MZDFuT0FLWDVUWnk4SXRqV2kxRnNadkVvUmh2STlu?=
 =?utf-8?B?dGltNHNoQ0F6alpLZHdFSlRFZzNCSGtMMm1zSTAzOW9hT2VJemNjTDdQWWl4?=
 =?utf-8?B?Q2NoM1VYYTNvUE05ZGNEYXpJOVVheEk1MnNPQkRCV1VORE93NGVmcVJpNzM4?=
 =?utf-8?B?dWhsVUtsT2IzRUtIVlgzc2dXVzNCemw4KzV6WFhtOHN2eEROcm9wVEZHNzUw?=
 =?utf-8?B?YzNWQWFsY1dqa3Y3bEFrWmNsYngyZmEvdkt6ME56RzVaakIwYm9Fd003SUdS?=
 =?utf-8?B?TWtmZnBoR1hSZ3oxdVhBVmgxSW1XR29sWUJyV0c1V3p0N2lxYVpFVGxaVS94?=
 =?utf-8?B?eUxtcm5EZjEvSmp6OVQzTmJwYm92UnFicFZCT1ZMd2VzS2kvc3VrZWMzUEdF?=
 =?utf-8?B?ZGJLWUZDZkZzK3VDRnZOVUd1UzRXL3FHVStUMU5IWmVtQ3pZQzQrNlNoYVRR?=
 =?utf-8?B?RlVIdENRVUZZQjEzZTJYM3Z3MUp3Nkd0SkswRWdSc2JsZ3UxQVdWY3d5TjFS?=
 =?utf-8?B?RlZlQldzZHpIdmlUSHpXQmJPb1VPOFVtcHNQdDRmUG1sK2JZY2xnQjBUcm9V?=
 =?utf-8?B?TE5mYWg0SVA5ODBiWHdPWWhsVjJ6dWRwQW9XdkE4Q2lWLyt3dmdPUGpFb0xS?=
 =?utf-8?B?SUc0UUpMQTJ5NkZRUGF3SUdOU2t6eXE0bFBQRVVUOVQ1N29USlVHekMyNVRq?=
 =?utf-8?B?ZG5qOWVEYmgvWWg0NlZxV1VrOWpnMFc2aDgrbDljNy8yWGl4d3dkWTNKZXJn?=
 =?utf-8?B?S2lMdGo2dFRjcjFLdEhmbnlzWWVZZGlvbkxhN3E0ZmljRVR2UVMxbk9OZ2J1?=
 =?utf-8?B?S0x2b0w2L0xydmNtUlBYQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1VKdnZRa1FUaUpyZEd0ZzdPVytrakhxMEN3NGRNV2xVcDJCcTF5ekZLK1pj?=
 =?utf-8?B?Y0kyYTRZSXE5dU9GQ0lPbXhBM2tjZWgwWGZSOXBWRkFCUktodkVjMG53YXZ3?=
 =?utf-8?B?ZjlXTVlJV2k4Wk9xS2QvTWtmOFlUYjZMWmR3Y3l6NXZtTnRaTEszRG1CWVdP?=
 =?utf-8?B?VHFmYzJqM1lRRzBlS1dSZXQwbkQ2bTVtRWpxRlYycndBYS93OUtXNm4yYnVJ?=
 =?utf-8?B?T3Z0bzdXNHJlV2UxTExHNUhmeEF3VE1BWjBvcU9scHhvUld5YzJNRGxTSGNJ?=
 =?utf-8?B?bGhkNTBlNjBSNlBFbjlNT0I3UkZwNWY3NCtHZisxVWNmdjVQUkVnUm4vdUxJ?=
 =?utf-8?B?VjJPa2RKWHY1b0I5T1d5cTY2RlpWVFFYd0JlVzNpMi9meGsxVGZhMEJndkp4?=
 =?utf-8?B?VlhWRENaUjFSMmhPQVliNG5yWnVSZXQ5aC9WNDhpV1hSMWhKNmtLMURaYVM4?=
 =?utf-8?B?VDI3bTB6RkZQSGVlM2RaZHRpenFUUFBqbkhJYi9yWmJDQUxyUy9aektRVHhp?=
 =?utf-8?B?SW02bEFzNEFkbXlidFVSbXM3QWVhMHpJbzN4TGRIcXdBczV6VGpzSTM1amtT?=
 =?utf-8?B?STY3Z0tIZTZBUTZORUJtWkhocU5pUUxoREFKMmtHT0dUMlE0Tzd5QVBRVytk?=
 =?utf-8?B?SHVFZllpS3FISXFqdVlXN0syTk05cE1GSGhkaldsYUQzSys2MVd3MEJJNmdQ?=
 =?utf-8?B?aHhTUC9aL2NnWWVGVDA5ZFVNb3h6MHdCT1RvNEdMRytHMUVRNTliMXBXV3ZY?=
 =?utf-8?B?em5zSnd2TVRQSm9IVDNzbWlOT3R1cjRCUXpsblR0RGlGalZZQzgycHlrc3hU?=
 =?utf-8?B?a3ZvTmJXMGpxNVZZY3ROZU1DZlRmZXpBWm9tU3BRNER5d3VhcFgydWtQRHRt?=
 =?utf-8?B?VmQ0aGgxYTBSa1k1d1AxejJIN1RlTGE3RHRja3BCT1AxWHJnMUJURmx2a1Zr?=
 =?utf-8?B?NWk2d05oOG9mQ0NDY2E4WFl0UG9BS0VTS250RHJrcDNLZUFxc1hPTS9qLzhm?=
 =?utf-8?B?cVV6dVQxNnl5MVBpM2VoNUl3ZWNqeWdCdFVLL01obFZ4RFpvNzlhWHZtclI4?=
 =?utf-8?B?cXVvU2hqUm9pM0hPUnVCa0xTbi9OZ3pmdVlNc1Q2NUp6TU1BN1NGSFk2dEk0?=
 =?utf-8?B?aFo3WWZLbVJTQWtvNGZyTU5oZ3BhTFlvT05HYzN0akFJTFhsWlNnV1ZETmtD?=
 =?utf-8?B?eGZTRGdtdTAwOG1rc1hpVXpHSTM4aGhIWnpPTkorVE0zZXY4dzQ2SHJsSGVo?=
 =?utf-8?B?Y2d5MFdvdTdUb2hzQ1hGclBDWjdzS0dkd3RzUzlzWlNKbW9DeXlSNjJtQy9N?=
 =?utf-8?B?VlhOVlFlS0JMdXIwU1liclArSCtGRGVDbVdnTDh6R0tBV1ZQMnV1M3dzTHR4?=
 =?utf-8?B?SmRGc1N6YS9hdUkwblZUMzBEZVJ5U0p0OWIwR296dVVDOXpRNzlqdEZ3V29W?=
 =?utf-8?B?Nkx1cjFCZnBpY3JtaGVmRU1TbCs1dHJYNVZZY25kTVhkZ1JOV1lEZXE0V01m?=
 =?utf-8?B?S3MwWDlJbWZ0QzM5MkVZSWdkbWJpdzkzY2NBWTRuM0NBN0xubkE3SURzc2F2?=
 =?utf-8?B?RlI1UzM4Y3pSVzQydGpVdDlkcGJYanY3cnVjQnQyUTBKbEZuZGRMUTBiK3VN?=
 =?utf-8?B?SzNhUCtsU1lMSnRwRFBmSDBqQjAyZmF0VlJUZ2pDcXI4Z3VSYXhTM1RzaFMr?=
 =?utf-8?B?NFh0TkZaNnV6cTBCbElvWHhUYXY5OXpBcTltaU5LSk4rUWxyS2czeUY3c1No?=
 =?utf-8?B?QUpnb002QWZKSVUzNUNtbGk3YnpKTHRTenFQRXhvd2tqSjdKOWZOamVDc3lt?=
 =?utf-8?B?dWhyQWV6ektZbDVNUG1PRjdWVDFVVVBzWXZrNS9KbVYwU1Z5VGxXYTV5aTBw?=
 =?utf-8?B?ZnFpZWNpQUNoek92NjNqWnZ3Z25ic0xZYWdrRGJ4WnJqVmkxT08zeUFOQ01k?=
 =?utf-8?B?U3JSVjN1cFpHRnl5cXZhemxLY1NQUnZTTldQWHA3Y0tsWVdVRTRvWDR3RTcr?=
 =?utf-8?B?R2c2aVBYcGE0eWI4SVBHZHBCcXQwc1crQ2hTN2VndW9QT0FXamJVQXg4ZU9S?=
 =?utf-8?B?TVFmNk9wT2FXdEpqMi9sUHNRT3JUci9mTUlybW03OTV2MnBIV1pKajFLVWwx?=
 =?utf-8?Q?s0MuWR+jJTMHITuboNraoepEA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50bd6c7d-15f2-4322-2b75-08dcb828c5d7
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 04:07:24.1518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/kvGH9bwXC0PFibQ/OGqLwJb4rfkPpegRK5uhcWAwXw6Ja9k/qmOTHvRGw2XGyZaf/RU2LWaOwyRkb6QGWCSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7833
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

Ignore this revision of patch. Raised this to get igt results.

On 08-08-2024 22:57, Karthik Poosa wrote:
> WRITE_I1 sub command of pcode takes param of u16 compared to u32 for
> READ_I1, so corrected it. Without this pcode shall return illegal
> sub command errors.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 832ea81faeee..617c8bdb8f28 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -446,11 +446,11 @@ static int xe_hwmon_pcode_read_i1(struct xe_gt *gt, u32 *uval)
>   			     uval, NULL);
>   }
>   
> -static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
> +static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u16 uval)
>   {
>   	return xe_pcode_write(gt, PCODE_MBOX(PCODE_POWER_SETUP,
>   			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
> -			      uval);
> +			      (u32)(uval & POWER_SETUP_I1_DATA_MASK));
>   }
>   
>   static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
> @@ -476,11 +476,11 @@ static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
>   					  long value, u32 scale_factor)
>   {
>   	int ret;
> -	u32 uval;
> +	u16 uval;
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
> -	uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, scale_factor);
> +	uval = DIV_ROUND_CLOSEST((u16)value << POWER_SETUP_I1_SHIFT, scale_factor);
>   	ret = xe_hwmon_pcode_write_i1(hwmon->gt, uval);
>   
>   	mutex_unlock(&hwmon->hwmon_lock);
