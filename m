Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE58EC25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 08:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1795510E1A3;
	Thu, 30 May 2024 08:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHv85XXX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A2B10E1A3
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 08:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717058887; x=1748594887;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=I97ofJS1qpOJx3V3E4PP/lzqMz2KS7Izu/1hdDlFTMk=;
 b=mHv85XXX6OaCbq1Xrl40pYqU46jFgLUls+zTWdPOxIvvMegMiutKuPmc
 XcsBKEyaBVrskyZuyTgfpxxeki00NSvHOw5EwI7IuP3/e9YQdtiO40sl3
 3nCd3PATZ9dbCrxOrei++p6kp690QJnJz0d4Aay3xbIv9DD3lIVuA0DKR
 lox6r5pbLhn2C5UOQvHJmFflp23gDxOLIruZnCazSDEanIhTSwGfshbDB
 0ez5tVVblekonYo2fzdO8qYIEU3LTKqeCS5btJBAyTT3iAAhjaPtJN8Ky
 1BoqHt5d0/4r8eWM9bot1PJBnHeUGStH/OvSys6t0ZWUH5PjkGiKb1iqk A==;
X-CSE-ConnectionGUID: IhRiX1Y1SyKRGIZ7oJTgrQ==
X-CSE-MsgGUID: 6+n/ZDxoR32bOx+2K3zaOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13705768"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208,217";a="13705768"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 01:48:06 -0700
X-CSE-ConnectionGUID: isC7G1ovTfSK0BT9F3O0rw==
X-CSE-MsgGUID: 6FfijoG4QVq+TX+wWVV1lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208,217";a="36224711"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 01:48:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 01:48:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 01:48:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 01:48:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPYCkIbd79A5l7on4paTvs2CAZcdVl7iXU6/rpeJtexw0Osg41P2gakkwMmzwrs3g+qFX66r3CUbFIKjDwnEuV5YnrGgYI5elNHjDLB76aPEZ9/W96hAMYzxn4ZjLbNWTBaSt3f79G72g0xa6VX3Gu0auIh8QIPZhuGNOxX2wix/O+MVuiRKz3TqgpcO7KQvBGfCDC1TkGTFhEaEn11B4PK4ul27fvesVP59XUA7qWvNYJjIu93Zs6WP2BWrHiEI4AfdNk62qA5XuvnjW4G/o3imJm9X4xz6+gEojqX5k4u87rbBidDrVukrm8caH7TTHeySnbymVLwpaXayCzSWRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZPvAQJhCZCrrVD0mIHNpCrs5lakxDhTf96M/Dpalng=;
 b=YDDMkO+Hr4/vQpg3KucY1lUtzbekPT2OpHIhHSYT7vrv9rNgXP0VaHomhn1cDnROn3rGRLf/EF/e6BWoe+oIryOjAo3PaxPnkZTH4gSL/T4QM1gpperWMEsFVEz+NWsICQWsbjMJ6alXRvUZPaWB2FOzvXrSoqAcbBF0TQtiCERNKImkOpJgnpcoVcb3SFX8Rh7MlpVTDyE/91PwkKVXZ6vFfe2sdidoSZMjHxBiC2WamIYAmTXkqqZFAnkyoxg7UcFftAMIAbq403LNos7HYSWz076tQJ7XvdqHGaN0t8QuuU/oVXKXJiOZDgQOexO2cPyS1lXsxsG5369gAifSiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB8749.namprd11.prod.outlook.com (2603:10b6:610:1c9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Thu, 30 May
 2024 08:48:02 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.7611.030; Thu, 30 May 2024
 08:48:02 +0000
Content-Type: multipart/alternative;
 boundary="------------WjEsJIClhYgjyrQa3krP29Da"
Message-ID: <f5171a4f-5722-45a9-884a-45f006d507c2@intel.com>
Date: Thu, 30 May 2024 14:17:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/client: Check return value of xe_force_wake_get
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240528101132.14788-1-nirmoy.das@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240528101132.14788-1-nirmoy.das@intel.com>
X-ClientProxiedBy: MAXP287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB8749:EE_
X-MS-Office365-Filtering-Correlation-Id: 61247643-36d8-4012-664a-08dc8085370c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0U1ZytJbk0zVlVvcjRRdVFCR1djWHhVK1ZNeHJVemtzTlpqcVNFSEdiSjkx?=
 =?utf-8?B?M1ZHTzhTczh4akpNdFRvRmZ1SUs2UWcrMEdCMDNQM3kzK3hzSWIydmRveS8x?=
 =?utf-8?B?SXpqQTBIUEF4bW5EblAzZjBzbVUxdUdjcFpubzRWUHVhSmk1MnA4N1duMTBM?=
 =?utf-8?B?NEtCRys3RXRWRUlOdUxIelk3ZVVYMnZvSXRMdUJMNnNPZHROQms4UkgrUnJN?=
 =?utf-8?B?VWhZVnh0VlREdjdwYlNnb011RWE0UVF1bmNZa3hTRjJ6cnRBaVJPalYvRGth?=
 =?utf-8?B?MW9UcXJldnVKUzcxV1ZNRzBRZ1pId1drQkoxVmRtSVI2K2c2WUpSTk9UZllz?=
 =?utf-8?B?UFRsQ0RGZGFCb3BwRTQwczJMc2Y3ZTdOWHBOY0V0cFhLQzRsamRNZkpiejlX?=
 =?utf-8?B?VVVhVnQwZ3BEZDFHN0g1bk0wRzBBaUhuT3JzNHd1bzgzaVFVd2d0S3VjZXZh?=
 =?utf-8?B?TldOaVU5QmFQSTRSS2dyNXRjbm16bDk2UFY3cC96UnI2UlZzMTJPTTJFbzVz?=
 =?utf-8?B?UHlrbm9kUzVlOHJqek5GQTdUOGE0SHJEUThlVHdWbXRwMjVlQ0c5MzNRY3pS?=
 =?utf-8?B?aTlKVkFTdDRsblV6VytlSHpjMURnVEJOQ3RwQXltNkdGT3NXWTF2Qit1Rm5L?=
 =?utf-8?B?ZUdmaWp0eEYyR29CcEpUWmh5TUtvUHcvRHR5MkpkOStEN09jOG9PeWNoTmRi?=
 =?utf-8?B?Q29GWldhN1RQRkF2UldlN05yamR1NWNweXpSeVNLRGpkTkIwZkxEZGUyekp0?=
 =?utf-8?B?KzgwczJtU2tnbjdvU2haa0JORHBicjg2ZjVZcVdsRlBvaWNSKzZCVzV4ZXNQ?=
 =?utf-8?B?aFluMDNVMG9DWmFiUThRK0drRnd1Y3p1TThGTkxab0ZTL3M5a0FCZ3BEUVBl?=
 =?utf-8?B?bWl0MXRMNVgxSnY2bXBndmNPUlFYWW9vTnJQNU1WMXBSdll1Zk5qNDMzRGRD?=
 =?utf-8?B?eUM0cFFmZW9HS200SzU0dlRJNitYSFJaazR5M0tyWnNPc3RGUmhRWW1RRHhv?=
 =?utf-8?B?Z20rcmY0QVEvNk5PS04rTUVXcHJsL0tWemhXdFFCaHlseHBWZlN3TmZ1TnhX?=
 =?utf-8?B?amEvWFZEaEFPajBpOW5rZE11NHEzcTJvVGIydUxkb2pLNVBoYlBqOUFKQlli?=
 =?utf-8?B?NG51NTRQRDFYVVNTMjVmZGJOZ1VnZDhQNTd4d3gwNVQ3SitEalNqMnZ5T0hh?=
 =?utf-8?B?SnhVR3BzRThnd2hEODR1WWc1bm94WU9sVkNuTVoxMG9SUXFoQXk0OEZ0Z1Fw?=
 =?utf-8?B?TnMwWHVsd2ZSazFBVUNrcVNnaXBwb0luNWRua0xLTS9nNklmclhPRTJTYXZV?=
 =?utf-8?B?eEpycWl1aFdVU2Z3QkhxdklDWitHRTdScTRHZ2xSWTlDZ0p2MytPS0ZMUUR1?=
 =?utf-8?B?cGpqaW1zOVc2WWlvUiszMVczR0doenlHalN3WkF2TUV6NlR1SmFmcDZQMktJ?=
 =?utf-8?B?T01oMGVZaktwUWpnYVNINm9DbkNoeldTVlhrb1pBSElGYnVRYnlaMndYb08x?=
 =?utf-8?B?dGVUQVBwWEppTlhaWGQrNjk0S3hpL0R6Zk00UXY4MTFIeXJLVGJISTZjcTh6?=
 =?utf-8?B?WXlFQVk0K0tFdm9ld1dVU3ByTllhMTBkaHh4aGZTYXc1Z1ZEd2dGQUdGUEV0?=
 =?utf-8?B?Z2FxbXZ5enNSWUZzbmdDTGZvaWRwWGVnei95VEsvRVF2cTJTaWt1VU04UGh5?=
 =?utf-8?B?ajRmTytjMi8xdFhsK3RJVnRsd09XMlRDMFQ4YkJYZUlIcEwzVEhHb2x3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1E5bFpyTmwraVN6cjRBSi8xbFEvY3dpT1NNTDkvRSt3TDFIam5QT3NxYzVl?=
 =?utf-8?B?eDFQU295WUR6ZERVbFlYZzdtNDB3UGVRdnFQL1lYczlxcWFZbXBWRDhQWjB3?=
 =?utf-8?B?VzlHRVVMbDZkc1c3WGZ0emJocHpaT2N1ZkVXOGYzbTMxdEFNaFR4WjBRQU56?=
 =?utf-8?B?TktpcDFnMzQrelhzRTNoa3RuQ29uL1FBN2JhNU00VGx5c0RqOUdJV0FhU0VU?=
 =?utf-8?B?QWd1TXpkbnoxMlhFZnY2dWJ5Y0ZoWlpQR3NvNFdaMTl2VnpNRENKZER5M1ZT?=
 =?utf-8?B?SC9CRFJwRS9ZaUNjRFFsYWZIZU95MW13czlKdlRpanI4UmNRbjZFbWZCZWtk?=
 =?utf-8?B?QnNYbGxHOGFUVWxFa2hZei9paGtVbE1zT2NCeUUrL3NJK2F0dU5sUEZuMGx6?=
 =?utf-8?B?RENZKzhtRDkrTmZYSTJVQVdWUVl3YkhJSnNncFlZRWdKb1UvTENiWmhBMG9Z?=
 =?utf-8?B?QlM5RHJMOVFQYk45eEdVUkZpbkNDd2FTRFhyWWYvelpldGNma1NXbkYvcXJD?=
 =?utf-8?B?Y01zMUdvUUFlSnRxOGZaZXBBMzg2akN6UVVYM2dYODIvSlBlWE16Tm9La3di?=
 =?utf-8?B?UXRvV0d2WVdUNXFHa01IUzRRaEhvMEVQbjhwSmVhcnNzY05uWmdOVEFSd1R0?=
 =?utf-8?B?TnNGWVNuWVI4cnc5Y1RLUU1LZ1l1U2lCNk9BcGNNN08xYmt6ZXZtQm1YQlpy?=
 =?utf-8?B?ODVSd25nY2c4cC90aUFYTjQvV2VPVHA1MlUzMmlGUXpURnJmamhYMjR1V0F0?=
 =?utf-8?B?L2tacXNZZEJLaHErWklkdFdKQk9JQzArT2pTczR4NFdIVkJhOVZnV3N6MVdi?=
 =?utf-8?B?Y25UR1cyZ1REd2hCd0pmM1lzenFzNlc4QTVjRlNjTlNCMzRYYTFnM2d5Q1Iv?=
 =?utf-8?B?TVFzd2l0VjZKTmFQYnN1MjcyL051L1JsNGhKYk5BbTVoZ2tCWWpnZk9FdUlx?=
 =?utf-8?B?TTJSK253ekdydTFKVElMRHNlc253VTRsZTFWdnVGRmpXSG5nTnRkRU91b2dS?=
 =?utf-8?B?YmN2N3Z6c2d6K3JiTzc2UnJMWmNUdFIvU0JWUGtjaTRKSy9WQ3lJbXVIejRu?=
 =?utf-8?B?Y1lrcGpKTGxhQ2JQRUZhQVhNREY4dWQvWndhZjFKVXhDZm1FZkJDSHhqZzRo?=
 =?utf-8?B?UWNhc2JydWhKM0xVZVdvLzcwcWhqZUJLd1BtcUY1ckwxY1J3NjZndUN3cW1W?=
 =?utf-8?B?ZEtNbGNmM3I1Rmg4Q1c5enNtQjhkUDIwdlk4KzhJdVd1aTNQenFRdFJmZkN0?=
 =?utf-8?B?Q2RHSmp1MFFwTjlKd3IzbGJPQ09OR0JhTThRRWJlVy9IWmdWc2hCd2k0R3Vu?=
 =?utf-8?B?ems5NTZxZVZpUmNseGVFVWpyOG5jdllsc2ZzL0dEWXBBNlp4UjBNajBlUXJx?=
 =?utf-8?B?YjVReVNTS2xaWnY4Yjh2azZPVjhQblJQMklqQ3BZVzBMQjNJVG90KzJCNVoy?=
 =?utf-8?B?QTRONEhReWJDWS9GRHlSOGtnQ1phNnFKZVFPbjNIWm9EOGh6T05uQnJiUkI2?=
 =?utf-8?B?aUhsOXFnMTkyc0p3Y2pQejlhYXlabDFhNlpHWmkwRDJ0UWx0aityMGJEWEs2?=
 =?utf-8?B?ODRFNnBXRWNZbVVZZnFUOUlPcE9rS25lVkdQYXZHUmg1UW1YV0pJN2Z3Nkp1?=
 =?utf-8?B?bjVKVHhZOWhFb21UeldONzlRTkVzbklhSzRjY2FxQUk3V2NLeU9HMVJlNHc5?=
 =?utf-8?B?K0libklFVXM0U1lZWXpsTG8rYTRYWDdlaUh0SW9TclNjdmVhTUNJWHBiNmU5?=
 =?utf-8?B?U3NiRjU4cHlaRFY0Q1ZLZFVBaVcvMUVaQWlHQ0ZVcHNveXBpN0laS2xDYlFJ?=
 =?utf-8?B?Y0lyMy9XZVBUcUFLeWZFTkxudktYelRIVS9RL0NaaEVzN2JDVTI2cHNRNjRN?=
 =?utf-8?B?ekFlZTRwQ29FTzBrNFFPU0U0S2I1NldLZ3FRTFIyWjdsQ0N6VkVSTWNOT2tX?=
 =?utf-8?B?Q1hndlZ2VlRtRis1SmZhMUt3ZnJhTTFadHRiZE9WL2VBUktyKzZMNk5BNG9X?=
 =?utf-8?B?Qm5zMVZXMUZDQURWYUoyWDVqTGE3SWRrbGRoVXdBK1JQcHkyVnh1WUIraGpk?=
 =?utf-8?B?RWt5cEVjTWFXaE1CZlNZdTl6TDljNTJmSHBkMGhvNTF0R2Y3S2tOTU1FQzVm?=
 =?utf-8?B?M1p1ZVR1YmoyUzRONXQvd3B2RDdZNklpMmNMZnNhblpTbyttVnJuNHRjMFNB?=
 =?utf-8?Q?2PDStSEUkTFk8p1V2YCCOQg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61247643-36d8-4012-664a-08dc8085370c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 08:48:02.4987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pic/Y5Nz9Q1JmGFo/vEYUp6LeeMPlJkGzat4oZJekkhnnaGcf8Cvt+1TAZ9rpL7H3Zn2/TiLSnbR9ogpYsvUDKvkEGfts1CSfOWIHUdEmDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8749
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

--------------WjEsJIClhYgjyrQa3krP29Da
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 28-05-2024 15:41, Nirmoy Das wrote:
> xe_force_wake_get() can return error so check it's return value
> before reading gpu_timestamp value.
>
> Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
> Cc: Lucas De Marchi<lucas.demarchi@intel.com>
> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_drm_client.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 4a19b771e3a0..0c13395ffd34 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -245,7 +245,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>   	struct xe_gt *gt;
>   	struct xe_hw_engine *hwe;
>   	struct xe_exec_queue *q;
> -	u64 gpu_timestamp;
> +	u64 gpu_timestamp = 0;
>   
>   	xe_pm_runtime_get(xe);
>   
> @@ -264,7 +264,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>   		if (!hwe)
>   			continue;
>   
> -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);

This is becoming continuous efforts. How about introducing __must_check 
to xe_force_wake_get ?


> +		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
> +			break;
> +
>   		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>   		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);

Handle any errors that may occur if xe_force_wake_put fails, possibly 
XE_WARN_ON.


>   		break;
--------------WjEsJIClhYgjyrQa3krP29Da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 28-05-2024 15:41, Nirmoy Das wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240528101132.14788-1-nirmoy.das@intel.com">
      <pre class="moz-quote-pre" wrap="">xe_force_wake_get() can return error so check it's return value
before reading gpu_timestamp value.

Fixes: 188ced1e0ff8 (&quot;drm/xe/client: Print runtime to fdinfo&quot;)
Cc: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 4a19b771e3a0..0c13395ffd34 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -245,7 +245,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	struct xe_gt *gt;
 	struct xe_hw_engine *hwe;
 	struct xe_exec_queue *q;
-	u64 gpu_timestamp;
+	u64 gpu_timestamp = 0;
 
 	xe_pm_runtime_get(xe);
 
@@ -264,7 +264,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 		if (!hwe)
 			continue;
 
-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);</pre>
    </blockquote>
    <p>This is becoming continuous efforts. How about introducing
      __must_check to&nbsp; <span style="white-space: pre-wrap">xe_force_wake_get ?</span></p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20240528101132.14788-1-nirmoy.das@intel.com">
      <pre class="moz-quote-pre" wrap="">
+		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
+			break;
+
 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
 		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);</pre>
    </blockquote>
    <br>
    <p>Handle any errors that may occur if xe_force_wake_put fails,
      possibly XE_WARN_ON.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20240528101132.14788-1-nirmoy.das@intel.com">
      <pre class="moz-quote-pre" wrap="">
 		break;
</pre>
    </blockquote>
  </body>
</html>

--------------WjEsJIClhYgjyrQa3krP29Da--
