Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FE3D73E83
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 20:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CB110E8D4;
	Thu, 29 Jan 2026 20:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vqtcd01F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F9710E8D4
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 20:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769719984; x=1801255984;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SgyEfoPlNsh6H3rw0/S4ew0NymH4E2BgtPamz66TkY4=;
 b=Vqtcd01F5hCq3ZxUg30mS1NmJoFX5xF+4uRxJouvO8dE+XrCeM0dxoCV
 UUx0MG44rVlii6gh5Tlnvciu65kkJdPiDGLOwmWOOxdl4OrxtpE9Gm5Lp
 iKBLFKGErnkLOp3MwBt5yDIT+BogylsFVKfCuG4mTT5IzjmVAXPeTRSFr
 4Sm/ItqSksxg90/IMscT1UelO2bQ/HXhFzvnlxfIa53ypEodQKO55PIhh
 pQUirDmbVZqjhd9xMbQJtfS46TTubE58xhllux05Vpekj1JOZEPzjA6C3
 MZeihCBqKzlW04/wH8tDttJJVhwrPXBfiOQiYX/Dk//OjAF/xOS7VhnRy A==;
X-CSE-ConnectionGUID: Oa/PzO/qTU+pdPKCRYQTfQ==
X-CSE-MsgGUID: va7mA58ySRaGLcYQ49LRFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71009396"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="71009396"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 12:53:03 -0800
X-CSE-ConnectionGUID: UmI1My7nQgGnmPUeQ5HykA==
X-CSE-MsgGUID: AllQCrClRpuMksJ+gDswsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208790595"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 12:53:03 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 12:53:02 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 12:53:02 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.13)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 12:53:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7gLZFU3WkA6P7r9I4lbofoYBW9LXGsMCDD8QN0eyLDXx7SRtAV+VBQRgw+pxDB2BNMEyONfc+EkfWENZo1M4GGcxeMmAJc+lBTRRseX27T6mIOvIfES4RqrCzt9AugzPbB6cqgMtHmjU35hnupkdCO9SH43ZV1OGqvG2UasttedSPO7W1d7mOKn8dbnnhims6VcDsRz/J2u34K0PCpplnbH41Loj31fl7KCQnS0c79D33bLdwdUvkrD26+QtQF1hUusDR1xPl19BZWTPkGozxTtu8LrdXGcTVkXgtuvamRzq+nRsfKkI8c4dVNF6a4RjptnIcLTZD3VP297SsEDzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUF0ZNmeVf1vmWApp8IlnrcezrPFTc1V4CwmqQY4V+A=;
 b=NL6YGqPebCWTSo7mNFiHp72ZiIkpo+F0a73jTbvhjgdEsNqZf3aSOgc/kBM9O0p5uyc1EboIEL8Yga+BaSNTN1akZ2tOlkd88LEUjme5kA8Oy0WZ7m4YF+GkiRRDScaSkia5XMT8TnZcugQwAxA5c/u02z3BHC7z2/gGm4/qmPW2k99oA+bcTIQoQZ6AfQwYXg3MwJbADi+TuHewcAQohLEvFDPtS+41SmqSL3a2nLxfB71xB0O+Q+n0480xabUFSYjEvVasD1WZHxBCrxHi4AARL/kBw4nTSB9KAwwTAnCcJt6zzT+I8VBTXjbDzFm08Jl02783XS2sR8mtIstnjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB5765.namprd11.prod.outlook.com (2603:10b6:510:139::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 20:52:59 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 20:52:56 +0000
Message-ID: <d14315b0-6a58-4f9f-8dc9-91f3af96303e@intel.com>
Date: Thu, 29 Jan 2026 21:52:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Fix CFI panic due to function signature
 mismatch
To: "Meenakshisundaram, Mohanram" <mohanram.meenakshisundaram@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
CC: <thomas.hellstrom@linux.intel.com>, <matthew.brost@intel.com>,
 <Meenakshisundaram@freedesktop.org>
References: <20260129183659.492395-1-mohanram.meenakshisundaram@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260129183659.492395-1-mohanram.meenakshisundaram@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0206.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::27) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: dedf6f20-2d93-4234-1c26-08de5f7860eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjRkTnd1QWNKYWdzbGlxKy9FSEs0d0dpd1VxYW5NbjkwZDJ0akg5M3BMUTN1?=
 =?utf-8?B?MFVEcmlwaEZGWWtLeHZmdW9Dclp4Zis4RWZabEgzU0hiT3RZVCtzRUNDQzND?=
 =?utf-8?B?K3RTVmErRXpPRk5ITEFtcXIzOHk4ckZ2WlJhdFJYSzYzM1cxQTQrY0kvRjdQ?=
 =?utf-8?B?OFJKbm03Y29pTnhHRml6Nk5tRVhnSVpjdURWb2tjczdhZkZtTUU3UlVEQ2o3?=
 =?utf-8?B?SS95Y1J4TXZGRi9qb2RPdkdSeTdnSzlycm1oTzh3aFU3V1EzcyswL3VGVi9O?=
 =?utf-8?B?Q3MrOXZVa2o0dFF6NjFwekZKTGQvWnNJdkdsWDZzWFIrdFBQN05sMVVCY0t2?=
 =?utf-8?B?YXBTNkNlOVZOeTd4V1QvbURILzFEbGZWM0I3TmdtSU1tOWIzWWpWTEdaTVdY?=
 =?utf-8?B?azQydTlCV25adktFSytKUXRYWlV3VCtqVWw0KzZncCtNUDR1VmNYMUF0MjJD?=
 =?utf-8?B?eXFnZ214QWlUZC9UVW85akp3S043RUJSMEZIcndWK0lvMDFWWmtsRGZ6QjBn?=
 =?utf-8?B?R2dsdGNzVVdwS2JrMGZRUXV2Q0doRlFablV1ZzBVSnZncEU4MFZGZGxRNTd2?=
 =?utf-8?B?NTUwTUJwd0hIWnJiREVYUllHcEZzSDd5WThGTHVnTXIvVm1La2hUanU0cjJW?=
 =?utf-8?B?dmh4WjlaL3B1YW5rUlN5SElGL2FMVTN3OVhqQ0dFZU5EZGVUTnY3Mmw3TUty?=
 =?utf-8?B?MXhKa29jOVpxdWdhY3F0VVNDenRQcjlmSDliL0RUcDdKcm8vUll2Q2pzVU0y?=
 =?utf-8?B?dWFlL2MyeWdHUk5TZDNFZk50T1h2bjBFcXJOOElqSXl0YndJTkxpK3B5cWFC?=
 =?utf-8?B?Vk5TRHhxRzZXTnVaUjhWQS92QmYvaDNRcVBCTUdFN1dublo5Uk5MY0lvMmw4?=
 =?utf-8?B?a09La0VGUGpGeFZwdUZaeDBYYUI1U2hxMkF3TWlyUzBTT0MvbXJ3LytJQnBZ?=
 =?utf-8?B?dG5KWm1IL1F3NHp2NHMyTDdvV3BmTzNYbHA5SlNWQUFRMjk1VVlaZ0tMczJ6?=
 =?utf-8?B?bWpWV0Z4dHA0L0dPNzIxSWZDMG52a3BsU0trVWE3cEdqQlFHRWlhc1phUWdI?=
 =?utf-8?B?c0ZmT3ZCRDZtcmVwQ044YXRXUzFsbFpyYk0rVytnOEhyZzI3VTIzNGczaVgv?=
 =?utf-8?B?WDdxbVBsL1FSaWNuRUpubVMva2lBdUVuQ0d6RktJaHN2Y1pmNFFPbFNvRElV?=
 =?utf-8?B?MFg0RjJwSUp0MjJvNEg3ZUxxUFZuZEVuNi9weTNjOVU0akpXSTc2ZllBMDNq?=
 =?utf-8?B?RkVYVjhZOGxIV0srWitUWENUTFB6UFpKa0xnZ2hJQXBITVRucHB2WjJldSs3?=
 =?utf-8?B?YXlVS20xT3pwUlZMNXp2N2lQSVlWNjhKd1VKem1GSzdKelZhRENXR041UFc1?=
 =?utf-8?B?TW4raEZiVmQrUHNoME1KYzNxN3RtYlFQL09hb3U5U0tnWGlJdXZVbFFKTGpr?=
 =?utf-8?B?bnE4SXI0RFJtUUhOVUJxd2RxTGlmK0dCT0NNdDJNY3BxVXJ0OElmNWQ2RWQx?=
 =?utf-8?B?RldxWFYwYnhhYmlxcVF0NGpFN2VnUzdDTmxKOFBXOFhlYmh1eWU3bXVvSFpm?=
 =?utf-8?B?NU1YU0ZoS0FSQjc5cUNKR0hldlM0RVR2ZmdCanVuaHVQMFMyNnRKK3RqcEp6?=
 =?utf-8?B?RzQxQm5TT3ZpT1B2VTRnWmhma0RjMForeFNvRXBIYlF0R2lGSzZ5YkZWNTk1?=
 =?utf-8?B?MEZ0c21SOHlPenBLMjQvTVVZSXNqK2lFS2IwajZnUStzRnpqWTJjRFZoK25t?=
 =?utf-8?B?MHBNUHVoQU9ITS9BaTZwdW9YK2xhalR6cjVLeHN4czZOekpPdlZlTXgzYXJx?=
 =?utf-8?B?NVpRNjhyR2xCUGxrSDVnV1BsaFErY2VGUnMveHJqQllFd0FSWncvUDdndlA4?=
 =?utf-8?B?a2ZTdmo4c2gwMTBMdTRZZGFScU1qUmVheWt5V25aUVJta3QrOU01elZKa04y?=
 =?utf-8?B?aWp3bFgrYmdFK3dlcWlvWW1FbkNzT1RPT3REVDJoamtmdFVDcHMyd214NVV6?=
 =?utf-8?B?NDVpaDQ4OVJleUZEeldmT1dkbnFHcDVtOTNoRlZPVG84aG5wUEN0SFJNZG5r?=
 =?utf-8?Q?dlZcGC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlRYSGNDRk4xM3JjN1phckRFZzRjSStuZkE3WnZGZiszdnVLQXNjRVRpVHJu?=
 =?utf-8?B?L0huS2toV2o4clAyL0l6bFRsblc1VWUwZnV6S0hTZUljREZqQ1R5S0wxWWl6?=
 =?utf-8?B?LzdlRmNVYkFiT3dUVWJpdEtFV053eE15TFhnTUJwM1BmdjBFeXZINlRBeG1t?=
 =?utf-8?B?Z0llUDJzL042bEtMeTVDU0FrUGdIbUl5WVRwY2xwOUZYOFBhai80TG9nKzQx?=
 =?utf-8?B?SWo1Rm53VXpUUS9CY3AxdEV2c01JK09lb2ltU0txSmQzR2poZk05QStsNDR2?=
 =?utf-8?B?M21CYmVlY1VGVkJ4K2Y3Z2puV2F6SkQzRklWeGhxckZxY0dta3l3SFVLcTZ5?=
 =?utf-8?B?WjVhYUgweWhDRDFwTXVaVU9PbHorS01vQ0E0SkZOVGs2aUwyVEp4RWRnVm9P?=
 =?utf-8?B?djdyWmN1N3RNdDFYMUN3YWN2NFg1QUlKMlhwU1JGK0ZWM21LZnNZOWRwMml1?=
 =?utf-8?B?V3p2ekhSNzFZc2V0VXlRSXpVZ2g1TUVFTVM0ckVJbFR1M0pTaEFYWnFBc1lM?=
 =?utf-8?B?L2VHZUw5U1NUeGFuQlB6MGYzTy92ZEpXYjNmTGxlaGo5cXF3c0k5UG9JTllT?=
 =?utf-8?B?SDVhQmh3RHYvYkhrd05pV005dTJHaEtuRjJvand3ZEJKYWRWUUxnQVZZeEFM?=
 =?utf-8?B?VTlVYzRTWXZFNWxCcmNqeGhtS0oyakwrVXhTQnN6TnVNd3U0UG5rSkRDQVBI?=
 =?utf-8?B?dlRBRExUZ3A5QjhNRk9YQlpyY0FWNmg5UFc2ZDVPOVVab21ydjRQb3pURTJq?=
 =?utf-8?B?SnQ1S01FN2RTSTF6M3dnMUVpNEcvUEVUUS9DaWRpUU1rMERSeUo0S05qUENY?=
 =?utf-8?B?cWo3SnAvUUZJdUtVcUlMbnBnTzBaVFBSOE1EMzhOTmQ3UFRXMkhxTkg1eitL?=
 =?utf-8?B?aVRXbDZwc29PcXJoeFlzc3M2VWpKUzRVR3ZTK3RocjRENmlXT0d0d3hyeGxm?=
 =?utf-8?B?WWx2Q0lodGpNR0p3ZGVJaHJvN2R1cFozdlRLQVZzcDJVVFRtUkFNUnZ3RzlU?=
 =?utf-8?B?bnZKaGdBQzF2RENLelVObE9KdFIvVWZ3bGJxUjl1blRJWWo1L3RoN3dCbDd2?=
 =?utf-8?B?Vm04SnRNcjdneTAyWTdrWlFDRzNaZzh1OGI5eVcrZ1AwQmc4eDR3dnRSQ2dO?=
 =?utf-8?B?WW1IUHFjbTRqQkxRaXY0VmN1VGtrSExJcXpIN1RGQXQ3ckt2YUNDb0dZL25n?=
 =?utf-8?B?eHJGYnJhRHVudGQzeDNXeXdTRTIwcVNNdUtaQStxMWVBSHRwVm9teDkyNmFN?=
 =?utf-8?B?OWJYTVJlTnR4TVhsNnF3ZnlRd3RabTBvNXpZZHI1V3ZjMlNXTW02S0wvMEc5?=
 =?utf-8?B?Q1NHbE5Hb09NOFlkcEhVOEpNem5GMVkxcExtYnVXb0VxL1UxQWxaNmtlK1J2?=
 =?utf-8?B?eDVEZ3pmbnVPNDJWVGV1ZVg2VlpQVWY0MUc4N20xeWt2MEs5QkpVZlhibURS?=
 =?utf-8?B?RlNzNEFuU0ZiNGR5WEJwNVBWWHIvVG04N0FhaFFUSzhCSjZqRjd4MUdRNndm?=
 =?utf-8?B?ajYzdm1WZXdMb1YyeGtpdCtjOWl1eUJUODdzQmRxVktkVkYrRkthRW9DNUZk?=
 =?utf-8?B?eTRBYTRvUE1ERTVPSWE5ckg4UjlWcWs4WHdmOGlwSVFjdHRucXRCci9QVnV0?=
 =?utf-8?B?akdtYjArWjZ0MDd6SkUxd01pMm9wa21xeWpFdFpyaE9VRHRrb0hMK0orZWp0?=
 =?utf-8?B?MStDdXBodW41bnJucWU4eUxHTlMrc3VlVERYVkhGZFlzaDhjcS93M0thOW5G?=
 =?utf-8?B?VTJyeUEvdERXK0V0eXJqTDRNLzdzcVAxUGxOMUJ3QTVMZ0F4WFA3emx6Z09j?=
 =?utf-8?B?aGczVEtYZ0tFUXJlODVKbUFPc3VhdVo4Mko0YXF3NFFqdTRxbEU3RVByUlJh?=
 =?utf-8?B?bDBXNTZtOXl4azkrSW9PU3B5NDRXM2VuSUpZTEd0UUJwOWhIanFFWEZHcUJE?=
 =?utf-8?B?SU5NcDIrdG15b2FFRjFGSy85R0ZLMngrWnpiYVpvTk9PM1Q3Znh4RHBtK3Bv?=
 =?utf-8?B?T21VL1BlUXJaNzB6ZFlMU3BBRjJleW15KzNWTWZBdGVBeEpkMWtmWFJmeE5U?=
 =?utf-8?B?WjNmSXNjYzEvZHU3QW9xK0kxZ3hpSjNzZkZ4S2NtdzNzQlowNTFiM2dyUCth?=
 =?utf-8?B?a2RrNllQOHFOa1Jtbld1QXMwcndIdDltV3REMjAxZUtpUjQwNVhzL0xDb3o2?=
 =?utf-8?B?WjNsd0orOEg2UHJuWTZ3TmtHallhbUNCVG9yRTA4ajdwVXJjeU16bERvZTV0?=
 =?utf-8?B?ejFQa1gvcUxTS01JQXArd0c3VzdVc3NRcVJoQXNNMTJJSFNMSGRIUmUxMHdn?=
 =?utf-8?B?V3U0aDl0dTJpdnFvWXZYRXZFdkd6NDRJbHZGUzYwRG9VeEI3RHNvbUdzS3k4?=
 =?utf-8?Q?bQSK0AEoeyBlNTxQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dedf6f20-2d93-4234-1c26-08de5f7860eb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 20:52:56.2507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HoO8WhzfbqgdQUXF9LVpapuf0+KEDAMpAHjWiUpbllAXS6r5qa8cTQsqa+/zadQsDvyqSgDaxFOIM1w1Dvkn4gTeHrKcI/sLZ7SEnKcLOC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5765
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



On 1/29/2026 7:36 PM, Meenakshisundaram, Mohanram wrote:
> When reading GuC debugfs file (/sys/kernel/debug/dri/0/gt0/uc/guc_info)
> with CFI (Control Flow Integrity) enabled, the kernel panics at
> guc_debugfs_show+0x9f.
> 
> Root cause: guc_debugfs_show() declares a function pointer expecting
> int (*print)(struct xe_guc *, struct drm_printer *),
> but xe_guc_print_info() was defined with void return type.
> CFI detects this type mismatch at the indirect call site.
> 
> Fix: Change xe_guc_print_info() to return int instead of void, matching
> the expected function signature. Return -ETIMEDOUT on force_wake failure
> and 0 on success.
> 

There is already [1] under review which addresses the same issue

[1] https://patchwork.freedesktop.org/series/160668/ 


