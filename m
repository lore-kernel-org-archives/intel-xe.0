Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B985C021B2
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 01:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFACD10EA0B;
	Fri, 21 Feb 2025 01:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXN2OdxO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0AD10EA0B
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 01:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740101788; x=1771637788;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FF8ZlSFmup9HbHyan+aLlT/a5mS4ihFDvVBLmD7N6c4=;
 b=hXN2OdxOQq9xq1IwOOrw1cA3S4GhkNU1nR+ABDUDxI875ZBlzxfGkEB5
 5nuUsV/YNiF4qNu/5rK4w4Q1mcYrYcrny1IbhPXk8jc9+A/boI8kUEaIv
 tXbXiIjhO0usisoj3pJLogqBtgq045DEyCPT2fmxnXSNX8sknX1r5BYDG
 rq/d1e9iRYw6PFuxmz1xjHGVYeivAAfiLywedJk6lrOWKWDWj8okx/rER
 G7vDWN7nbVzUf505nDsKfZJH4r3OPX1cvmQ5tVu1+pzPfhXYvuCDwXyai
 vrQaNX9vCma/0+lDyG3Ngp3sEl9Azu4tspqC1N0fa66FFdswV0qTdXNmn Q==;
X-CSE-ConnectionGUID: X0LwYR7iRyuSjDlWm+4rSQ==
X-CSE-MsgGUID: 6zUroMIWShilA+4p45wtzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41045578"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="41045578"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 17:36:27 -0800
X-CSE-ConnectionGUID: g9xNQq2LRf6/mPpmqbeS6Q==
X-CSE-MsgGUID: HIbO5EjgRzG7oWFv7gZ+rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="114945609"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2025 17:36:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 17:36:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 17:36:26 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 17:36:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prah2Mxp71WGsl3CkSDtgRkPvfcChiD3Cb+URumLgUrq+Ph+8H+Qdz1fCs76cYNOj42nGUEijwGXy81R+dvVhK8kG3VvyiJKjY1BaqTFV1rzhLG4nRGGmQh9RPK8gZkMA/8eKNwhGL+svWa73erZkpD3uyxrJjyR6xfF6/5qFsgSViA85kQVbRSLLVzQIZ2j9KW/x5qyfSU2lLf+PHtv6f/R3L/JrlyvCrGZQtB1ZPOjSOHNRMQ1PZEIxERNM2fTKiTZ/A85SzblkeTUBiLAfeC1qSZvz6Zc09cUmBYc6kHofqLrdmDju0nmAuho3A/JOpXBRTSpYDRY5DhGJb8bQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZLOhw9ngjZagq+3IJzyHKlpsxWTM1z6CXBkzVBeIYY=;
 b=XxgJa6emuAznDVKThBYBTWWJMvNGMLlAqfDmSCE/k3G+Nepn8y4l9fhyMo903KS4WQn8judBSxV8p7nkGkB53oI35Jm9p/BH/wztLvVKqlPuenkaDyvyPQHSVw80vzkb5Fz5mG714/3x0PEaM/kuxncnf/1gycalg6vbMQ49tJ2OzeFDE8xBmCWh4f3lHtka7qj85lmmRx3mHzBwL3NbbVSor940ogRYvMyJN/mCXJKKI8iu+EwTQH6cUyjZ5ejj6A9f34Jom7RvwG3NPW/cY1psxlexXNa2KxKFP2tcvN8DklmUgHBRuo2ILKaY+iwmPMiMlh3vmLnnn133eoDCZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Fri, 21 Feb
 2025 01:36:23 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 01:36:22 +0000
Message-ID: <ab15704b-20d9-43c1-abe8-607e070c2cdf@intel.com>
Date: Thu, 20 Feb 2025 17:36:19 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/devcoredump: Remove IS_ERR_OR_NULL check
 for kzalloc
To: Lucas De Marchi <lucas.demarchi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250219212631.1788586-1-shuicheng.lin@intel.com>
 <20250220001710.1803749-1-shuicheng.lin@intel.com>
 <20250220001710.1803749-3-shuicheng.lin@intel.com>
 <60047a3a-9919-486f-8fe1-4c2f90c110d9@intel.com>
 <wtk56h75pu66dnnqx6az6dxyfhvgqbovp6sdihtenuhxuoneh5@yo2joqcv75sk>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <wtk56h75pu66dnnqx6az6dxyfhvgqbovp6sdihtenuhxuoneh5@yo2joqcv75sk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0366.namprd04.prod.outlook.com
 (2603:10b6:303:81::11) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: ce3b1208-a290-4a10-1425-08dd521825fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YW5SczMzVGlUN0poTjlxeWtST3lrVUdMc0FTa1NhZGJPUHdES2RYM21zSjBN?=
 =?utf-8?B?Ti9XbTBQZTUvdUROSG5XMzFycWNVd1FvSUJtVXhHbFp5d2J6anpFdm84Z3h6?=
 =?utf-8?B?RXQ3amU5MWZNdVNuZ1ZWeDhJSjAwS1R0Qm95ZzliMjdrUnFlaFI0bHI3NjVP?=
 =?utf-8?B?VVBZRjVxZHRlRU9LNjJ6OUdPOHlQelpFcjM5dEx5ZEJMVXQ0bWYyL1RBWGNN?=
 =?utf-8?B?aDNZZEt1czVldFJmdGNsSEJCVlE1VmxPN1BMOXc1dms4dkY5NFZUenloeDB3?=
 =?utf-8?B?Z1I4cTJYek0wVnRPV3EyVVplU0ZZUEVEOVcwQVRzZU91TG5lNHQ2YTZaTXZ4?=
 =?utf-8?B?aC93MERBemtZK2lyY0sxQU1RTXFnYmQrOCtaN0EwYkh5NFV0OThyWEFsUS9B?=
 =?utf-8?B?eHVFZzhmUkRmYkQwaVBVYkRHbU5hazdCMzdRQmYwVkN6ZDdWNnpMRnNHK3Bs?=
 =?utf-8?B?ZEtwT09hT2xwbDFEUTAvK25OQVY0NFhxS1RXOG9JUVNLWWFBcFg1bkxUNmU3?=
 =?utf-8?B?UzVvRXp0eHp6dEt2Ull1dmFNSzNvTThiWXJhTEtTdDBtZUMraTFtOFhRRkZU?=
 =?utf-8?B?a1N3c2RCbEI3ci84MlM1QzRaa28zREdTbm0xcmVqK3RKcUdaUndIUThSL05Q?=
 =?utf-8?B?Wk43OU1HNW5pQ2xJblJTeXJCbVd1TnU4aEdIVStxQ1Fsb3BjSHlrN3d3NkJZ?=
 =?utf-8?B?cVlRbHloVWlFZW5INkZUekIwMFd4U1Noc1lEYURkdk8vd0Y1VHJNeHFVU09j?=
 =?utf-8?B?RHRIM1dRaGszSmJIc0JnYktYV2pmRDhYR1I2a2tla3ZPVUsxNkY5ZGxpcTFx?=
 =?utf-8?B?enk1Q3hrQ0lUQWtvUE9qeXJQL3pqUXZYVkJtcGozM0pJcmQwVkhQY0pTajh3?=
 =?utf-8?B?Ymg4bDZDQnQ0SXl5QlArWUU0d3ZxVXl3dEJzaWNpcHZZbzJUZVVseHlZL0s5?=
 =?utf-8?B?WDQ5ang5SEhXcHBhYWtneHd5cDRyOU1WRm9mQUVBYlJtdmg4Sm0xR0tmMGNq?=
 =?utf-8?B?eWJCbitLZzFGcElrVm9EM0VuVFFUMTVQOS9XNkNGZXdCNmtuMWpnQXRKNGFa?=
 =?utf-8?B?THlNdTVrVjhmaDhXdDduSlRveFNoZmJzeGMwNElLY2NEaFROamphckNnS3Vl?=
 =?utf-8?B?Slp3RUk1OCthVHVCbnRjekJqUUd3MTVkLzFSZ05wY0RZWjNEVXdJUGtYQURB?=
 =?utf-8?B?bU1PdzdFdmM2TUpYeEgrVHVydHFBWklNbTdBZG4zUE5HcWZiL2FpSmFxcEhP?=
 =?utf-8?B?N01jQ1ZtdlNoWElJVjY1NGUyTC9uVVlhNVF1ZnVTWER2eGQyaGM0aHhYdHNQ?=
 =?utf-8?B?RFBUUFc0Yml2b2NWREdDejlhcE1zZS9Ya2tXLytJUVZMY2JIV1BHREFkZkZa?=
 =?utf-8?B?cEFpb2p4bnJjMWg4UVUzTEtVbkVraURwM1p2VVNhTFgwaUFPbWU3UWg1cGpW?=
 =?utf-8?B?dmdtNllYeHcxNmsxeDhpKzlBWTVidTdrdy82eTRZOG4yTTRKQUd4NnA2bS95?=
 =?utf-8?B?K09UcER6SHVrS2crdlRUWEljYnVpelFrWGhPSm9BZHdNSFlnZ1lSQTFtSTlh?=
 =?utf-8?B?U1hZTThVZFpyQzl1K0JveThZc200ZFg3Y2NaZ3VYSjNxMmFOMTJVZnhTK0s3?=
 =?utf-8?B?QzdYNlRyMEZFM0s0VzBtZGZRVXBEaEZtWU1mRWpRUzE1Rmg3MEUzYk5iVjFu?=
 =?utf-8?B?cCtiNnpKK0Z3bTE1eG5SUVdTY3psdzArRVI5RHVtUDZ5b044cFN4ckZlZFJK?=
 =?utf-8?B?TDBFOW1wR29EZWlMbHBXK0IzU2pDdkVPRGk5OC9BWGhyNWZPVFE2eXc3c01D?=
 =?utf-8?B?ODZEbnZKa2JOdXh3cnZwYVpTM1VLSEY4a0E3RlRKQW9jR3d0L2hjN2k3ZGJi?=
 =?utf-8?Q?/3oU2uEDscuO5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWNOVUJ4Um94SVMvejByME5oVnJ1Zkp3UmdQYm92S0V3eFZEdGxnL3hiUTZD?=
 =?utf-8?B?dHpQOVNrbDRpcGdQVGhwZ2FtNm90WTF4T3UzMVN4eUNBeUtmVXEwVGlGVWRF?=
 =?utf-8?B?SVhtTVdBTytMR01iMHZZRzdrRnk4Vk4yNm5lTzU4dDhpWGZWWkFUWU94T3RB?=
 =?utf-8?B?SHFRdlJUVzBPSXIvbUl0QWVrbUhJWGk3U1d3dTU4VHZwTjFtd2ZaR24rQ0FY?=
 =?utf-8?B?dThyaTl5ZzYzSXRHSkZrNUhsS2pDYXFBUjJSNU5MNlRaRkozQ3hIWElVVGl4?=
 =?utf-8?B?NEdzd09xQmtFdnA4emh1QllhWGNRbDZlbjRsWWZxQ2VwUjJjSWpmWis1Rlls?=
 =?utf-8?B?MUVPdkpkNmZsSmJ0VTc2bHd1ZGpTMU9saWVOQldncVI1VlhiTGtXd0ViSzRh?=
 =?utf-8?B?YjBFQWRUYnBuU1Nlc3pRWGhSU05YWW0wOVFzc2hwcnBuNGhaZGhIMzU3UlJY?=
 =?utf-8?B?WHRFUEdBVlA4NTQ5eFUyWnk3ZUUxcU82d2hHTzRPLzBheW54NmhMRnY1U0o1?=
 =?utf-8?B?OXZoRVpVblBLRHNKZEJjeURiK3UzMjVubit0RUgxSVVONGJlOXQ4SUk4aGVo?=
 =?utf-8?B?ZEdJaWRBRi94RGVTUFp6WCtoV3VMNG5IWkg0LzJmYm9BZUdVeGUrSjFlRUkv?=
 =?utf-8?B?dUtpNXc3K000Um9md2dMMVdoRUdXcy9aUktSbWs5UCswWllCTEo1L0dRRjdW?=
 =?utf-8?B?WG9jRzJwVGpsSFVJSGlkaE1EWllpalhWM3ZYRVYxeWtDaWxhVzZmN3hQWS9h?=
 =?utf-8?B?aVZDSFA5dFptUVp1bi81bUJpZzE1aW1xM0Q3ZmJKcUlvOEtHRWFyT0VBUEQx?=
 =?utf-8?B?MlMrZ3JJMEpKUlE2aGlWWkpXeDNiaHdvdnZ3d3QwUUxnRkQxSWdJUmNLY0Ex?=
 =?utf-8?B?M0Vxam9seFpnK2NzMEQ5ZmFkekhkSmJsZkVYREZpejJlU3N2VTZWNnBSY292?=
 =?utf-8?B?VnpnM3Vtd2t1eFFXN1ZZaHE5QmpzZ1MvSDBTRmNycWY3OTEyQy9DK1QrWVJI?=
 =?utf-8?B?c2VHYklLU3YyalZjaHI2azhyOVo2OFkvRlgvaXd2RGNDUG03UTB1OGFDNW5L?=
 =?utf-8?B?Vit0NFZUUWh0bGRsQWYva2hMMkprVnp2K1o3WGJSakhzT3UxQ01IbUhtK0ZO?=
 =?utf-8?B?cm9lalZNUWRvU3RmVWJ5ZWo3dHI3OUduYzNpWlZtQ29FeTFZSXI4Qm1ZRWZ5?=
 =?utf-8?B?L1BYZ2hsUFp2ak1CYnpnVXNvaDJTbVBNMmpMak5sRk9BcnVDSFc1a3Q2dWFl?=
 =?utf-8?B?UkZJRDNGN2pwT2JLS1B4cGVFNkZhdFVrVEswbDVsT0x4aUd0TkdTcitUcWEv?=
 =?utf-8?B?NmxLRDhmdGhickRIcjdwUGJkaHprVzdaZHRmOE1QUTdERTVEQm1peUNKdFdF?=
 =?utf-8?B?b0ptbmVJY2xNbnAxUW12ODJYVzJaSHlsSGpUS1V0Y0RCaEJRTEJFS2R5L2cw?=
 =?utf-8?B?T1NIblRtYWx0djY3N0Rob2FsOEVxczRlNk04T2VtNGptMWxRcEVyakNnTGUw?=
 =?utf-8?B?ZDhNQWEvL1p5cVd1NW9KNFlKMXBBaHJ5MzhIVkVPN2N0TFVjU1d4ZTdOL0ta?=
 =?utf-8?B?Tzl5YzBiaDFCakExRWhFUUJvakJmWTlvN20rNlFndEVaODc4Z1BIZ0xEcGRI?=
 =?utf-8?B?YXBMU1hySE1WTEJLMlh5TzZCQUlCbXVXeXRVRU55VEZmbVZ3UTh2YVk1VE1Q?=
 =?utf-8?B?MXFhV01ORzBhbHRGcmMyTXFtWFlqUHRZeElmdkFRODhWUlFXZlpjNGJvQnpF?=
 =?utf-8?B?U1ZDZHVoNGF0d3pGM0RjbHR4NUZ6QzdwTFZhcUFuY0FpcDN6S05KS3k1TW4x?=
 =?utf-8?B?MTZNYnRBYUFuKy9ZQ3g5eWlQMnNJTktsRW9NR0JVU08zVk9SN2FSWThNc0Ev?=
 =?utf-8?B?ODNiOGxST0NBSTFhZDFwN1Nwek5FWjhPMG9NSmdNYkJlaEVBMXpkcGFNdGtN?=
 =?utf-8?B?OTR3Y1B4ZjNkYm9jaFhxdGM1QmZjeldVZDZQV3ZoVEhvNGpnWi9uZHFjalI2?=
 =?utf-8?B?djNMNnNza2RqSCtHUjc2YUQ5d2w1WGp6RVBSbGVuR3E0WFU2UHRuMXFMS2I3?=
 =?utf-8?B?eFQ0SGRhMzFaeFhsdEYxRVVJQTVPbkZ5RVRVT2FGMzJuRWFSWm1TanZ5aDRZ?=
 =?utf-8?B?cEgwcndTT0gzQXdocDh4RUFPTXR5ZlAreVEyY0cvNVk5SnJzM01nUGp0TEJU?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3b1208-a290-4a10-1425-08dd521825fd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 01:36:22.8940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxEfmfG4J4GF8OWdJOigm6mJ0n8kpzNPkNbqdywj5zg2V4FD8z0A2dXCgg7GuhpjR1sYOo1Iq6EzKLSpIFTjnem43Q5R15xY2pmUbwnLXvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8774
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

On 2/20/2025 15:54, Lucas De Marchi wrote:
> On Thu, Feb 20, 2025 at 05:29:56PM +0100, Michal Wajdeczko wrote:
>> On 20.02.2025 01:17, Shuicheng Lin wrote:
>>> kzalloc returns a valid pointer or NULL if the allocation fails.
>>> It never returns an error pointer. It is better to check for NULL 
>>> directly.
>>>
>>> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_devcoredump.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>>> index 60d15e455017..81b9d9bb3f57 100644
>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>> @@ -426,8 +426,8 @@ void xe_print_blob_ascii85(struct drm_printer 
>>> *p, const char *prefix, char suffi
>>>          drm_printf(p, "Offset not word aligned: %zu", offset);
>>>
>>>      line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
>>> -    if (IS_ERR_OR_NULL(line_buff)) {
>>> -        drm_printf(p, "Failed to allocate line buffer: %pe", 
>>> line_buff);
>>> +    if (!line_buff) {
>>> +        drm_printf(p, "Failed to allocate line buffer\n");
>>
>> btw, since this line will be included in the output, where one could
>> expect ascii85 data, shouldn't we print that diagnostic message with
>> some special prefix to make it clear there is nothing to parse? like
>>
>>     "# Failed to allocate internal data\n"
>>
>> also since caller may have already provided a prefix, shouldn't we also
>> include it in this diagnostic message?
>>
>>     "%s%s# Failed to allocate internal data\n",
>>     prefix ?: "",
>>     prefix ? ": " : ""
>
> or stop printing and return an error. we are missing the `.error: ...`
> already that is used in other places.
>
> $ git grep '\.error: ' -- drivers/gpu/drm/xe
> drivers/gpu/drm/xe/xe_vm.c:             drm_printf(p, "[0].error: 
> %li\n", PTR_ERR(snap));
> drivers/gpu/drm/xe/xe_vm.c:                     drm_printf(p, 
> "[%llx].error: %li\n", snap->snap[i].ofs,
This is the place that should be printing an error. The whole point of 
this helper is that it wraps up all the blob output. However, do we need 
to distinguish between a non-capture-process error (e.g. bad VM object) 
versus an error in the capture itself (e.g. out of memory converting the 
binary data to a text string)?

Not sure what error routes there are in the VM capture? Are they things 
that are important to include in the devcoredump because they have 
significant meaning about what caused the hang? Or are the only possible 
errors related to the capture process itself - failing to allocate 
memory to store the capture or such?

If the only errors are capture related then yes, just change this line 
to print "[%prefix].error: %errno\n". But if there is use to distinguish 
between bad VM objects and failed captures, then maybe this one should 
be "[%prefix].capture_error: %errno\n" or something?

John.


>
> Lucas De Marchi
>
>
>
>
>>
>>>          return;
>>>      }
>>>
>>

