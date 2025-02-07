Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2AAC02192
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 08:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1883B10EA3E;
	Fri,  7 Feb 2025 08:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAZbdEQ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF92910E248
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 08:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738915214; x=1770451214;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vOtOzE82y71kqziUisN5j5RL19ie+6gH/Tq9K5rJvNY=;
 b=fAZbdEQ8vv+bcs9lAP4Ufs1LlSadRqn/Zau9DvdxaDIRspl6nu/lVw1Q
 0b2eiu9NizbcuErNEbcB2277mLbfhAn2+sKhOiJ80KMYoRjQ32+1RxnGO
 11O4roC2LrDIJMoUVb80A5t2avsV3bi5vze8bvigVHukHfuLj5ZyDomYX
 oSmfsFOEMCATDKU736hA1tWZxO7I/1bhUyWpb+MrNTROZynXnQ7eBGyRV
 Zhym4sT1aaEtW+k2h893ygbpyAxO8nEYslwfVUnXWd1G5egV3++Rxnqus
 uUl9DAvT7u+yJ6DOjN00XR2QuXE7gU7X9KKiv3mO7s0JNcYlKKsPodgvR A==;
X-CSE-ConnectionGUID: xDJ63qfzTe6yTcNnoyNIEA==
X-CSE-MsgGUID: 6BzgZulVT/u4KQBarqfn2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50938503"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="50938503"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 00:00:12 -0800
X-CSE-ConnectionGUID: Vu4LEdgBTJipfdGWKzjNOg==
X-CSE-MsgGUID: ghsSppC5Q+iIehAr3bGuFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116076516"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 00:00:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 23:59:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 23:59:40 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 23:59:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYKTW6q34BurygLKhW2Ig1d+4Bd8p7SPhMfnw70wmgL9YSdBaowVUELegFFvV9pPZd6zv65+XF85h+8zFZ2QFqWARZAVWAgUdflXNQ/am0t7jUG2WdlLiD6eZ+KdCPUXoKiL6xwG3Cx1VZFOzYnsFRC8SrmF9w3YPq+2rKjNP+z0xnmLoSEXv1HKqSpHAjVfH5xKQeJOcZxTDKXVHG38slnzzlwpePu2RTdelVyJAF8zLe6CK5dPIT4WWvevTNDdCFGpEw2oSIiGVpnsqLdddEseqDhYye/1qk2A050KXazRmsWOoAPYHinOpkC1kxytTfho2z953Bw4EBRNoPClTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPjra//Y93J+99xO/2+XYqQQWgSbGF5R3vt1ZD02ofU=;
 b=UlSSX45zxyg62igIYcpTjLYJqBg2M5pzEPeoEIskILYls2k+Vj2vKRkZXv3JeKPWhnG/rFhpR01b6t1KulfUkfOAuLnVWIgfUz6vct+BYrvus2bxVrzvmjA/jzwxfFMzfGZ7nSwNiknBucz/MgIkSZ2n0N3f7GOCY99Eg+/9GVkQhEtHKr80rYj1QQoaz6B69ydoby1PTOw99JB/3qwW3hZYib9g/WXhjdIwn6jWXLtnnQaF3Bu3hBgvVCiq65pz/3FjrEsA+c7A+K/eMiBX7waLBXZPpZfa60vclKfXy1xxlkmrAB9DCrU3fivPxSEBxK369ejX8aJ8lcD88IaeAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB7849.namprd11.prod.outlook.com (2603:10b6:8:fd::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.25; Fri, 7 Feb 2025 07:59:33 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 07:59:33 +0000
Message-ID: <f3b65371-51e7-4532-ab23-bf50cf4a94dd@intel.com>
Date: Fri, 7 Feb 2025 13:29:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] drm/xe/guc: Expose engine activity only for
 supported GuC version
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, John Harrison <John.C.Harrison@Intel.com>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-4-riana.tauro@intel.com>
 <810aa04d-0781-43be-8914-8f6c60f42f5e@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <810aa04d-0781-43be-8914-8f6c60f42f5e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: d3cea2a2-7cc2-4aae-86b6-08dd474d5b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTEvTThEdzJrOWlyVjZlbkNNV0laem9ydCtTLzZNSFYyV3Q0TUswN0lZeUxI?=
 =?utf-8?B?U2ZBb2R2T0o2RE9oZmR1OEhyRkpuU3hHN2x3R0p5TmR3ZUNsSDE1b2dWNmVP?=
 =?utf-8?B?dWYzVnk0ZllHakNTRWpGMmI0Nzl2UFAyRVNZWUMycmkwOVpLQjFiQkNld1lo?=
 =?utf-8?B?bXp1dVlSTVVRTnlUZTVMRkVwUS81S0lZSEFiMzBqQzRlU0Y4d0tOTnRFUGtl?=
 =?utf-8?B?eWx2SmJ5RzlMeGhnQzZ5aVZqeHY2NVVMaGtjNDVCK2FIMDlncXN1RG42TVdP?=
 =?utf-8?B?OFJrMkFrdTl1aEU5N2dINjl5bTNuai9hVGJUQmVMNzh3WEFlcUNwN3VuVThN?=
 =?utf-8?B?WUNOWDdyNnRBM3JxTyt1RnhPT0UreFdkaElhZUpDcEwxVUlxYWFyeGRySGZ6?=
 =?utf-8?B?TXc0UkNHQi9qSkIvM2lCNWpIQUFScXVpT2QrSkhwZHJCdG4rZmQvTVpoQU9j?=
 =?utf-8?B?bEhPS1ErNk1BVzdLRXBFRG5SQUV6NGhHaE85SVVwNDNQQUlKekNYV3pBNGNS?=
 =?utf-8?B?M2h0OTRrNy9FcFZTSmNDcURNQjIvZ0dpS1BYcDRBQ3lqenM3ZENiNU0zWnds?=
 =?utf-8?B?eTFGMUhZYWVVb0R6MmdEcFNrbEIrYk1PMTMvZXBYY1pTdTRMMnpyT092Q2tz?=
 =?utf-8?B?d0NDa2taaE1KRElnaXNCRytNWk9LNWdDdjhWUE1sOEVUc0hHTEl6WUZjK05n?=
 =?utf-8?B?eTJMMjQ0cEp4K00xMHJkcXExY3ZYQ1oxc2o2WjhyTG16YWtIWm9uVDJpa0s3?=
 =?utf-8?B?TVdLNDRZOWpTdHdXbTI4bUVBdldMRyt0WFVRNHpBSVhRS3dVQXBlYnJwQ3RW?=
 =?utf-8?B?bHNyVFA2cFlVTUZ2eVBDYVRjUFlWTTdYL1MzQ1MrUXVpdlh5YkFVcS93YzNS?=
 =?utf-8?B?WFNRaFZPQytkYWtDcnFQZ25RZk1VNUMrNUNmRXlScWlrRUpXQ1ZnQ1NTVXlN?=
 =?utf-8?B?bUpoeTZDN0JnK0NxZUdiaHBaeTdYSnMrcnVLOGxZUUN4MFRvcmsrYzVxTStm?=
 =?utf-8?B?TkF4QVl4UURnbUFFUTBjN2xWTExPV3kyUDBscXdXcGlpTlRuTytCSjRVQkhD?=
 =?utf-8?B?QU4wQmgxY3U5QXB5cEVTV1lDMWlHcEZrenF4d052cXBSemlqZmhhd0RlU2N1?=
 =?utf-8?B?ZGRPOWVzR3ZwT0NQTU1SWEViOVhYczFFS3FOM0NWUlVVVjdxRTFUWHdTYnF4?=
 =?utf-8?B?c25ITDlTcE1RYloxRTdJQUp0UGdnMHh3TU5hN002UHk0ZTl0SDRndG9mRmtP?=
 =?utf-8?B?QkJoQkVWWmJuclg5UUo4Uk8zTkxhc1JnUHliT2NseGJOUG1taFJMdTlDTlc1?=
 =?utf-8?B?K2pDT091UVlycEVlLzJSVitJTzRUaTVHKzdFQ3JiaWd1bFBZMFNBUHZoeSt0?=
 =?utf-8?B?S2lMSVpPbG14S2RxL2dVeTM0c1VWUm9XOWtBY1VrKys4Z0dmUjdLeWkvN3ZE?=
 =?utf-8?B?NFROL2x5MExEdWM0MEZpR01vb3YxK05KMVNOcEc4clF1UUNrVEdqSURPYzZP?=
 =?utf-8?B?TFVVa3lVNGJvOU1JcTY5ZUxOVjMwOEZsTVRuL2V4NUhITU1tb0JPL0RKc2x0?=
 =?utf-8?B?NTFQeU5TWUpxK2VGVENUVUhGeWpLRWVWTHMxeDY0UzRkWjE2dXlRUWlrZllO?=
 =?utf-8?B?cDBFL3ovMTMzbmFXN2REREZra2JualUzSUNlcWQxQlREYTg3OTNqaks0S1Zz?=
 =?utf-8?B?SUxQdGlqcW8xd0NRVkYxWStNZFYxQTZ6N2JBVEwrV2UzZStGUGpWbHdxRHJx?=
 =?utf-8?B?akdRWklVTWU5T25MUE9HL0VhVTVYQkcvT3JvMklxSEJQc2JRclRaWnJFeFdP?=
 =?utf-8?B?Z1NMVTBGZnBWdkRLVFBmQ0tZeXMrRWJESHQwSWtKNjc4dmFPbUtLRXlTUUUw?=
 =?utf-8?Q?MF9gcVsgp7YEk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0EwTUprQmxtODBac2dnNEthMFQxT1VxcmFDd0ppWHp2V3ByemszSWNLKzVD?=
 =?utf-8?B?RGlKQ0c4dEEzN0ZmR1YvY29nY3BUR1RUaS9GcXlHVEdEaE1Mbmx6ZVBJNXVx?=
 =?utf-8?B?Mm5tbzF2VTdBcHU3SzBaVkFMRGJzTmNnOFlkRG9tSmRDSFFMazRsN21SZ2tR?=
 =?utf-8?B?NWFQZ0hZcHB2b2l0MklyTUUraDlwUHM1YW9NZmFSOEt6TGZ0cGJRdnczaGYr?=
 =?utf-8?B?T1BqN2tuL1g1dmhlQmdNd2l0cjNVYzRXZXJ3TythanpZajRrcVRrWHRMYk5T?=
 =?utf-8?B?NlRJNnlXeldMN3RBbmNlblVreEx5Q1ZKK1FTU3BuTDdrbmQ3UWlJUzJ0S1hp?=
 =?utf-8?B?RDZJZXVOUjErQUk0Nm1PZUlCTDM1ZlRJa1RycE9XWURHcnEzQjdiekVpWkN0?=
 =?utf-8?B?MTg3U1I3Rk1PWnJoc0syQS9GQ1oxalNrakUzZ1EwUFM5WVBuNldwb05GRXpC?=
 =?utf-8?B?QjZoVlhnWGhwb1B3Y1RGdTBxT055QnBjSjNSRGZKV1JNM2JudkpBbWt0ZHRn?=
 =?utf-8?B?RFg4MDlSMVBaYTNUaXZDYzREUGcvT3JNdTJJeXNxQTRLajJQUGRrOWNoQ0xy?=
 =?utf-8?B?NTk5bE4wKzJTYnFaNWVyeGIrWjY1ekhZbDFLYWlHZUQ1OGdHWi9rTWFMS1ZV?=
 =?utf-8?B?REp2UEVEeGM3N0NVZEwxRlFmVDRRQ1F5ZVZXN1MvaVNwOE5rZ3VTSHArRVZL?=
 =?utf-8?B?M1E2aXdOZVpKeGdEbUR0Kzc4YkJGZ1p1Y3pMaDR1ZFlndWZ2T2R3MW52a090?=
 =?utf-8?B?ZmhlVi9xMU4zRzZnL0tQa1NkRmEwTTBHSWJkN3VZV0FINmtmQnE4TngwdUdO?=
 =?utf-8?B?Tk5YdzZGZVZEbS8vUndncDg5aVA1c0k3T3NrQ1QxZnBrRTFXWHhPM3Y2Mllx?=
 =?utf-8?B?Zjl1amtUNlRqc040TzhJWkNXeHBXT2o5a0wxNzRCSUN5Z0Q2dC85VDhsV3lS?=
 =?utf-8?B?c2psNzRHWWxMVGxVQitKL3F0eEZIQncyRVNyR0t0cmFDVVJaaHJtZVBzalU3?=
 =?utf-8?B?TU15aURndWxrWkNEbGt1KzRWcisvWWZTYVl3aFhBMFMxbTAzdnpTanlUMTdS?=
 =?utf-8?B?N3Z4UzVXM3JhTDZZQ2NpWC81YmhnWnVnODZaNUtkM3BpUDBrbm1ISndmQnJZ?=
 =?utf-8?B?S1BaWThMY1U4TDlnVFVIYklWL0grclE4V013SlRNa09nYXpYamYwcmtiamFH?=
 =?utf-8?B?SFNQUnFpZ0EzUklqS296RzQvbi9vdUVqRnZFc09KQ0MxTUdXWnpKMnR2VHFh?=
 =?utf-8?B?TExpOGU2S0Z2ekhrNnB6eUNnUGlQeUhCd0JXQlVsVWg2Wmp0LzFUbUN3Y2pR?=
 =?utf-8?B?OGwrcE83VEtmY2gvTU5CbWVwUm9JblYwTW5UVFRCRmE1Q3luRjRIcmI5MURm?=
 =?utf-8?B?cnNHYXluL010aTE2aE5wMlJtQXN2c0RqQmpQd2kwaGdlYmFJbmdaS3dkbVZ2?=
 =?utf-8?B?SGs4MTk1d3VvZWE0cE5iUjQ3Q05uUmVHaHFrc2dmdGR5eGNNTWRQVjlFTTBz?=
 =?utf-8?B?bHNLWWthRTAvS0kyd0VwMERQcEwwL3d1Y1RXczlSbE1ZM1VJSFFPeXk2YVNS?=
 =?utf-8?B?cnB5VGtkOU9iT0JwWVp2b3V3ZmlTZGFKV2ZaSDA4ZUloZXFOeXhLeXh6bkZn?=
 =?utf-8?B?Rko3UzNTNDU4bW1PUjBlZHI2T3djZVl6RlRmY1hZZlkwY2JRRVAwdjBpdDZO?=
 =?utf-8?B?ODI3ZERzMXZQMGQzSWVkdXF2WWJsektrcEtsVk5oRmMyeGg1c2ZVZnVFaHdC?=
 =?utf-8?B?d2d5T2daS2hQL0F3bWNlRFF4RDJvMWxjdG5BdDZMS3k3cU1xUjVXVXZOTGJa?=
 =?utf-8?B?c0UvSkVWSVRnKzN6a1VzUXpWWms1MWRacENEZ29VMVpUTllqS3F1eTlVbVRW?=
 =?utf-8?B?dnRRL3Faa0RhYndBNzNhcDRTY2VsUytEV0YySGlsU3I4MDZ4UnpqQUR4endC?=
 =?utf-8?B?N3grWU42c1AvNC80c24yV1huNVdaekg0OExoS0ExYngwSTFIYTFPdWoxQVlr?=
 =?utf-8?B?bEVwL00zamEwVkZaWnU5UDZicUNRcU9HMmZwUzJBUGxKTHMxeHlSZU9nOFdP?=
 =?utf-8?B?S2s5STRTR0pHZFlnQWV3NS90YloxODltWXlDbkJZY1Y1MXhyNS9YYnFrRFlr?=
 =?utf-8?Q?oh171YzHmimdKHQ9s23Z5Xm5K?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cea2a2-7cc2-4aae-86b6-08dd474d5b46
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 07:59:32.9367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dsU6gyrUHk/IkXfzEBqLh4Tl83M1R3sLe7YlBy7YLFgx8QPwFviHwa6Xc0KurX3SvkfPCc5y1g19E94Onas9Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7849
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

Hi Michal

On 2/7/2025 12:09 AM, Michal Wajdeczko wrote:
> 
> 
> On 06.02.2025 11:43, Riana Tauro wrote:
>> Engine activity is supported only on GuC submission version >= 1.14.1
>> Allow enabling/reading engine activity only on supported
>> GuC versions. Warn once if not supported.
>>
>> v2: use guc interface version (John)
>> v3: do not use drm_WARN (Umesh)
>> v4: use variable for supported and use gt logs
>>      use a friendlier log message (Michal)
>>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 42 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  1 +
>>   .../gpu/drm/xe/xe_guc_engine_activity_types.h |  3 ++
>>   3 files changed, 46 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> index 9c08af273397..5d67fe38639a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> @@ -89,6 +89,22 @@ static int allocate_engine_activity_buffers(struct xe_guc *guc,
>>   	return 0;
>>   }
>>   
>> +static bool engine_activity_supported(struct xe_guc *guc)
> 
> maybe rename it a little to distinguish from other function that just
> look at engine_activity->supported flag?

Hmm, this is static and internally used. Not sure what to rename it to

Is this okay ? is_engine_activity_supported
> 
>> +{
>> +	struct xe_uc_fw_version *version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +
>> +	/* engine activity stats is supported from GuC interface version (1.14.1) */
>> +	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 14, 1))
>> +		return true;
> 
> it also doesn't work on VFs
> so maybe it should be different logic:
Will add this
> 
> 	if (IS_SRIOV_VF) {
> 		xt_gt_into("EA not supported on VFs\n");
> 		return false;
> 	}
> 
> 	if (GUC_SUBMIT_VER < 1.14.1) {
> 		xt_gt_into("EA not supported on vA, need vB+\n");
> 		return false;
> 	}
> 
>> +
>> +	xe_gt_warn(gt,
> 
> does it really need to be 'warn' level?
yeah CI flags it as a failure. Will change it to debug
> 
>> +		   "engine activity stats unsupported in GuC interface v%u.%u.%u, v%u.%u.%u or newer required\n",
>> +		   version->major, version->minor, version->patch, 1, 14, 1);
>> +
>> +	return false;
>> +}
>> +
>>   static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
>>   {
>>   	struct xe_guc *guc = &hwe->gt->uc.guc;
>> @@ -250,6 +266,9 @@ u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
>>   {
>>   	struct xe_guc *guc =  &hwe->gt->uc.guc;
>>   
>> +	if (!xe_guc_engine_activity_supported(guc))
>> +		return 0;
>> +
>>   	return get_engine_active_ticks(guc, hwe);
>>   }
>>   
>> @@ -263,9 +282,27 @@ u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
>>   {
>>   	struct xe_guc *guc =  &hwe->gt->uc.guc;
>>   
>> +	if (!xe_guc_engine_activity_supported(guc))
>> +		return 0;
>> +
>>   	return get_engine_total_ticks(guc, hwe);
>>   }
>>   
>> +/**
>> + * xe_guc_engine_activity_supported - Check support for engine activity stats
>> + * @guc: The GuC object
>> + *
>> + * Engine activity stats is supported from GuC interface version (1.14.1)
> 
> what about VFs?
Will add the check to return false in case of VF's as suggested above
> 
>> + *
>> + * Return: true if engine activity stats supported, false otherwise
>> + */
>> +bool xe_guc_engine_activity_supported(struct xe_guc *guc)
>> +{
>> +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> +
>> +	return engine_activity->supported;
>> +}
>> +
>>   /**
>>    * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>>    * @guc: The GuC object
>> @@ -276,6 +313,9 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>>   {
>>   	int ret;
>>   
>> +	if (!xe_guc_engine_activity_supported(guc))
>> +		return;
>> +
>>   	ret = enable_engine_activity_stats(guc);
>>   	if (ret)
>>   		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
>> @@ -302,6 +342,8 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
>>   	struct xe_gt *gt = guc_to_gt(guc);
>>   	int ret;
>>   
>> +	engine_activity->supported = engine_activity_supported(guc);
> 
> should we continue if not supported ?
Thanks for catching this. Shouldn't continue.
Will fix it
> 
>> +
>>   	ret = allocate_engine_activity_group(guc);
>>   	if (ret) {
>>   		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> index c00f3da5513d..9d3ea3f67b6a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> @@ -12,6 +12,7 @@ struct xe_hw_engine;
>>   struct xe_guc;
>>   
>>   int xe_guc_engine_activity_init(struct xe_guc *guc);
>> +bool xe_guc_engine_activity_supported(struct xe_guc *guc);
>>   void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>>   u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
>>   u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> index a2ab327d3eec..81002c83d65e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> @@ -79,6 +79,9 @@ struct xe_guc_engine_activity {
>>   	/** @num_activity_group: number of activity groups */
>>   	u32 num_activity_group;
>>   
>> +	/** @supported: checks if engine activity is supported */
> 
> indicates?
will fix this

Thanks
Riana
> 
>> +	bool supported;
>> +
>>   	/** @eag: holds the device level engine activity data */
>>   	struct engine_activity_group *eag;
>>   
> 

