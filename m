Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF99ECD98F2
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 16:47:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B354010EBF9;
	Tue, 23 Jun 2026 16:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MNiI07pg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA24E10EBF9
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jun 2026 16:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782233262; x=1813769262;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/kEKH0qS99oxK+G93rOKaWeyaXY9Eaz09SU+oji1nYA=;
 b=MNiI07pg3u1TMceLNvBacT3AlChJVd3mXxqyWopZGX9GUQpt4OOGxrnr
 2rzKwHZYlLO9NTPsO2Idf0dRQNrF+Ez+K/0NopAK1sNSIpm5z7Maw/uAi
 5qPMpSAZGvGBJ89aHt5E5ARE0qQvWUa5vVD1YRPFdcOPijyABfNWrA8Nh
 WHIm4Bqt9WeLQqOv4xucR+JyoD9aLCQw6SXZLt5rnJUrunp0C5Dq9kwZP
 hNQW5To5CCTm6R4bo4A1iSIpSYXUJH2uHfljMH+EXyDKyyf8sfoFoHo0X
 GsH+fXSdLh123cLs6kwBFgRPALkSWCfAfpG6WY7kz7ep6vfEnI6KWBNxY w==;
X-CSE-ConnectionGUID: jeywjZ4+Rpm1hLm4UmCwPw==
X-CSE-MsgGUID: I7cjBZ+gSl68+Bj+mKgbWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="108524535"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="108524535"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 09:47:41 -0700
X-CSE-ConnectionGUID: 0/n8R0jBQnmEoik62Dk4wQ==
X-CSE-MsgGUID: oiP6UUJ4SY6NeEDGhqqftQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="245195930"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 09:47:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 09:47:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 23 Jun 2026 09:47:41 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 09:47:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJXRJZ4mFRnaXUzhLGHMPVspMQxWzkc853Q++hz8E0db4Sa/YilcfqWVs3aB7Uj8kuxAjuXMJl7bbrgIX3h9suUGLRRnDBjWEft3dyN56ZmCEcoK+KsEkKeP2jbmWsfQJKaXWKxC8iXpx301XGDLYXJSNZr+dTi9fChZ+EADfDWdwMHVkIR6O5vNUH3SVRjJ/iy0TBtoiap28xTs/hjoeHeBao7gI+GtJpHVVaHXC5KZXyM2I7+aLgTbvLz+viHIPGzg31sW/9FzEV342DgL18I1QX129dihnBUNm0ace3unycHsP9arwcPhVcG8PlZwjLZTo9GSXtvFnkLR1zU1Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LFBzRsil69Ggxmz7MFtlbu6NpUmKtqkgZyoZ+3h59w=;
 b=MzFRK/cDsjRW86fVjnq+kcD1luL+5it2t5gSiuy58M40AwOXG+0jBUn90dlVQOESoWqVZgfHCCWh2CaabTjYBfBJOGqN2wmkCbW6+R3KQaYTCz6xri7zz+xbFro9cQ7gXmutv+6yo6Xnr3OUdZvm1yLgtNoRKHFY4+zTRCFOvQ6n8qywzTVeKtbYgtFeTPTpFa5FBnKL+enh2zU7XWXDvF2CVHbqqP/b5LAefPMsCIFgd3nXq8cwL/k45TrnDhDR4PoZlB+uePAsDodLLtbsChNg07fmrOlTCHQZ2Lx4kek/xOalZcQILWBV1deSp8dCyHkZBdnP4yfqtYGWgxwNZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DSVPR11MB9556.namprd11.prod.outlook.com (2603:10b6:8:389::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Tue, 23 Jun
 2026 16:47:38 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0113.015; Tue, 23 Jun 2026
 16:47:38 +0000
Message-ID: <ca65bd5e-abe2-47f9-8bef-84b8abc864ca@intel.com>
Date: Tue, 23 Jun 2026 18:47:34 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/mmio?=
 =?UTF-8?Q?=3A_Small_improvements_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260622132342.19600-1-michal.wajdeczko@intel.com>
 <178217002636.103867.1310763212766721326@6beec6c84f66>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <178217002636.103867.1310763212766721326@6beec6c84f66>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000525.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::679) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DSVPR11MB9556:EE_
X-MS-Office365-Filtering-Correlation-Id: b4fd816e-aa4a-4abc-9f44-08ded147227d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|13003099007|56012099006|22082099003|18002099003|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: hQ2w2yPx4e5JymhvMzJPMRLcajFbwEH5XkVEQ0/ma+V9b/Sx/TM91xqByQ4iXc3YZ8WXKYETT+i2aZ8iEbU7S7Ocm3C64VE1q189eyJSKeJn19H8b+eSjKSwS4kDX5Cc1B8gJs+aelwA9vHqDOl1gadiyubXCsj2wB63t6NWKKQSQAfG0RKyUouRtMMP91N9RQnI/WhnKWTpKqBuhFIRTo97vkhSrTux3x3V52fnFFryStgV4xlxHIpe/4B+Ru97UrnaHkM/vPjTGb3rWvlo7pBE8e0k60y4O0wY8yGx3d2WbIL/3txlfk6IKOA+60AmnEnT1fcG13Um8dDxiZugdxt3PJ5oVy1LbOadqLzcDshzCaAzmc19F/WYH5fif21M+BQtoFpoZBA0UyssFKe9lU/oELINvGG8TGTVxxsbaZDraXhVFXX12jTZw7Kc0plPeLS8TEUCrieyjh0wENFCGzlcqk8Le7dCFPgbFFQElgQBdp4nbEMxyu+2K0x47g1C8tXwUHUd+ctgha/Xes0MJweoP9vIbQjSsWozD2QAjxYNR6F/9/Wg/7ImLi5T/Oxmm4xmDg6VAJlFes+jfO47Xi7+xYnw7zfFZtZa5aHttwI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(13003099007)(56012099006)(22082099003)(18002099003)(5023799004)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1pSRW5PSmljYnRIOWJvTkZvQTRVMzFjcUZCMHJ1eG03NGV0eWJmdHRaZ3Qx?=
 =?utf-8?B?VnkzWDlOem5kSVUrekpJOXFaZ1hCSnJyUVJ0L0IzWVlZMWpMR2lZSXNqZGhm?=
 =?utf-8?B?bEU0NDlheG42VDBscGFuMEFQTzlPNGJ2eTU3ZGVncjRnZ09NWDh1R3dXcnY2?=
 =?utf-8?B?YjB0bi9YV3lLK3VlSy9jd2dBUWVNWm9XbzJaazV2TVBia0lqV3lSeDU0NHJz?=
 =?utf-8?B?eGg0TUIzVDhRZnFrZjdDbWw0NHRoWkgzYy9Oa2xDUzIwVkZaM2w1eGpTVGxI?=
 =?utf-8?B?eUgrQTdhN0hkak1YcE5sdEVMMmNMRWQwSjRZYlhyNWZEOU9TVHo1L0lhckhr?=
 =?utf-8?B?NEhmWGdQNkxVWlJFV1h1bDJ4amllY0NpUzJRMFUvUlM0Nk1VVTluaGs5b2J1?=
 =?utf-8?B?aVJrdWJWSUxpb1F3R3VMNHd2aUUvMEhFa1RSM2JQNzF3eSttS2R6SVBhYXda?=
 =?utf-8?B?dGNUUXhkY0RYMkw4TGREY2ZXb3QyeThSQll1c2lQM09CK2RQb2NDZng1WmNi?=
 =?utf-8?B?NkFSZXlGZHBmMG1lbjg2M25pMnExcmppZEM3YzI4Z3JCeVIrZWtEZzBUbmNX?=
 =?utf-8?B?TFBYY25hYlJYdFE1WkxTSWpXc1BzMFQ3WG9QdWdSZXJCODJVZG50RlBIaERn?=
 =?utf-8?B?Z01HZTFxL09LcEdaS3gzR1dkOXFiRWFoeU4rYlhDemsxTXZPei9US3VCZVFt?=
 =?utf-8?B?YkEzK1ZuWTIxL21YSTcyQkVyZWwxYkhzU0g4ekJhcndZSFZQU3phZDZOYkpv?=
 =?utf-8?B?Y3BNWU1BWGhDR1pBYWoyMndoeFhVK3FZZVVYTUJOeEF3K1lqRnNEY3JTVDc3?=
 =?utf-8?B?WnZaVTkxTXVVa1NHSDNlU3VyL0RUL1E1WFA5Z0dxY2tTbUIvNU9tTG9SYlVt?=
 =?utf-8?B?SXJ2NWFrQzkzTUV2YTlHOFBOTUZQS2xyaDV3M1UwL0VrZ3hXT21NMVlHeEJM?=
 =?utf-8?B?SXNIQ1k1OEs5eDVRN0RjVWlFaCtZL1Rsb3ZEMkQ2WWw1SStqN0FnVFN0emlR?=
 =?utf-8?B?RE0rU2R5cHVnRHpXdmdIdDU4SFJPejBFWURzb3lWQ3Rmak54SmNHcGhJajZt?=
 =?utf-8?B?TmJ2QTFHODlJVk80TVdBUmQ4SXN0VnQ2ekJOU1VSR21sdTBlakNiZ2QxRGlB?=
 =?utf-8?B?UFZGZGR5Mk1SaDc0dGM5TiswR0pzd0NueW9ySFNGZWtWa3R4cHc2STR4VWk1?=
 =?utf-8?B?ZjF1SndCeUNtVGlnYXdTeG5RMmszemxDRmM0YXduV3VkQzMxRC90UlluZEFF?=
 =?utf-8?B?cFNHYTluZVh2RU5GSVJZSjF0NmhVOHExcTNEOUNVMjMvYXFZQ2MxbmU5UkMw?=
 =?utf-8?B?c2VPNURZSWVuamgrVXRYSEZOVmpCU3ptWlVwa3ZTbm9JazJzRTlERU9zM1JC?=
 =?utf-8?B?MzBlTGJqM2dQNjRyUys0RFZ2cXJ5a0xRM04vc3J6TjNkSXJ2ZWxPTmxhdWx5?=
 =?utf-8?B?WURQeWtUdTBzQmZ0a2xjNFJvc2VnSk5GczR5NnJCckJFQXNKWWxhZGNDN1Ni?=
 =?utf-8?B?QkhxTllWV3hGbkVyd25ML2U2aGVjTWhrZUY2ZSs3ck41VHByU1RqemVseVdC?=
 =?utf-8?B?VThKSjhLRjREdGo2UWhvenQra1dmTEs0bGFUcC8zUnRwS1E3aEhZTXBnNkgw?=
 =?utf-8?B?SU9YckF5ZVpZc2RxWDY3b2NRTTlQejZXcWk3ZmRCUXNubW92ZzJndTQwc09P?=
 =?utf-8?B?T2pDVlVkS1gzamJWUzd0U1Jia0QwbS91eEFaWDliV25VQjY5YjZZTWFzcFhv?=
 =?utf-8?B?aVpBTXRZOGNTVXFSczROdnVMaVZmT1lNbFVaQXc5aStidGFENDFKcUVnaisy?=
 =?utf-8?B?dEdZM1Q2RGJLZ3JXMjQ5RlYyNkZHV2IxOUcyWVB4VmVTWEVtZnhGcnkrdmtL?=
 =?utf-8?B?Y1p3end3YkJpTXJ3MThhT0pVUE85K21EMmdZWTZLRFlaYWlTbmcvUkxHM2RB?=
 =?utf-8?B?UnpOaXY0SGlleG9SVnB3SnZ0dG9FN2pGK2NaTTUvWmI5Si9yMjVjekt2SHIy?=
 =?utf-8?B?YVY5YWpqeFpWWVA3bGJZRW53L2U1UHFtZzJnSmFqYlZDcjFJeHhSSDNzeTRI?=
 =?utf-8?B?d2pqYXp0dUFzZFZMVlcwRFk5QVFpSU42WllBa3VDd2t0THQ2NS9QQTR0UXZF?=
 =?utf-8?B?QUtGUEMrOUJWd2p6L3FuQ0lFcVg4Tm5wN1dtc2gycjdVWFVMNkRhUzNLb1A4?=
 =?utf-8?B?SVprcmV1eW4wR3dKU1BVT2RXYmwzM3dPNGZiQ2QvWlp3S1hVeE1hTCt5czB2?=
 =?utf-8?B?eHQxcm1VYzlDYlNiN2RzNU0rV1I1RFVIZThmTGNDMEoySEgyRWRMVVhCalJL?=
 =?utf-8?B?V1BGV2xraVc4UzBJcHBRZG81TXhvSlVpaXQ1WS9VZ0FvNFlRazN4ZzMvU3lP?=
 =?utf-8?Q?0wOiuQFDCA5UiboE=3D?=
X-Exchange-RoutingPolicyChecked: haF2kW33MbiLch6SqJYSuEHC6dmsI6uPGhhTM/8t4lmxHv0a0qKAl0b/Ffkg5RpywSlGvQtRlneOY6PgLIWpmuvuIBhBNDtRvkyN1UZ34Ug5lS1fszt2Xb4uIZ3MIPE3I9prdc8M6Nx+7rq0UsO9mL2UYCdfgCCdcpWmCv6VX75fWPOWSiNnDMq6NJQZq5LukA3XIdFdr2MrUHsAH70TawH3Z/YQFCvdM49k7OiTHefN9cm8tcGQLIxJiRawzpTT0I46Oxy9u/01aq0vpHSwD0wPEnqhGsnc5Y3jhRei8tI6HyUK4k1ISZjwl2WZopb1DZtj9nXGGOG2l0K7SgjDCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fd816e-aa4a-4abc-9f44-08ded147227d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 16:47:38.7314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZUUF96TIdQU5qu9ZzmlLPa7cvMcVkNkZEum2GfdBd5rzMjR1JgLCA1yQTJWvKUfdMyTP98frbWB5m4ldWbyvP1TToVVHNWlDS1LdcU1IiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9556
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



On 6/23/2026 1:13 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/mmio: Small improvements (rev3)
> *URL:*	https://patchwork.freedesktop.org/series/167104/ <https://patchwork.freedesktop.org/series/167104/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167104v3/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167104v3/index.html>
> 
> 
>   CI Bug Log - changes from xe-5286-6583dd200482a34bb17e5dc54551f91f53b79798_FULL -> xe-pw-167104v3_FULL
> 
> 
>     Summary
> 
> *WARNING*
> 
> Minor unknown changes coming with xe-pw-167104v3_FULL need to be verified
> manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-167104v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-167104v3_FULL:
> 
> 
>       IGT changes
> 
> 
>         Warnings
> 
>   * igt@xe_sriov_flr@flr-vfs-parallel:
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5286-6583dd200482a34bb17e5dc54551f91f53b79798/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html> (Intel XE#6569 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167104v3/shard-bmg-10/igt@xe_sriov_flr@flr-vfs-parallel.html>

no useful logs, likely just another CI glitch

