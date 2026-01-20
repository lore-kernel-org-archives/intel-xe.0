Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58A0CA5FB8
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 17:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0DE10E63D;
	Tue, 20 Jan 2026 17:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CBIUJ+IZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0705F10E63D
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 17:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768931068; x=1800467068;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5DtkZUfaDyWN2bg0HmN9BsGX0ek+V1HjSTitvJozThs=;
 b=CBIUJ+IZ4ud+k0cDIrZow4F9bniiF039nfpa9jyMibeVZOlEIrsDz8QS
 rkDiZJ/QxoYLfCdxoQw+zl2Xv7Loq4iFLLzk4wapbPbyv+kqpCZxbO8Qh
 4fKvibiZyn1sIT1EeY2V4sFg+eES3e9WMCMQLGkXeHf1TMLZFlcA/kMSr
 j7fXiOo3c/royg3jA1ph6hHegyDZ1+x/pu0H+8M2ufwuDbnxWpEA2yP7E
 ugwoS01jrTBpXyBHPu2W4wE/CtaKmSoNLT12ExV0UpqsPMdoRJqjsQzWo
 SpbLzsmsJ251Fb5psWZ6oU+GEbb1ppX0uisdANbZr107lMFS5ZOq4+scF Q==;
X-CSE-ConnectionGUID: ZoWHxSORRPSzi8MLVhVJkw==
X-CSE-MsgGUID: gFn2wjLrRPqMjsd3Xr6K3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87560585"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="87560585"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:44:27 -0800
X-CSE-ConnectionGUID: XbREYCHDS/eoPQyZHoKgmw==
X-CSE-MsgGUID: qw+VONh6Sz+SkbX0t5p2DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="210646070"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:44:27 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:44:26 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 09:44:26 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:44:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxLCtMAhz1AFsxmlIYYM0AVkR7Rw9qw7xr64r6IYP/8b2LQXG7lWvfgbkL2aVK+4kEIMdOna3o7pczDskG955voS/OOcGUh9of/o/uP7Keb9Q+KKBMFTdkkOExSr4KQxnzJGYAxj8XXom+l+hos1ktDJS//7lVsdWWcH1/Rn0I6Dn+s4yFKyoNJf+rlbDI47QZIpLc/yE5yxTJz71smm2i/2czspexWiMVTaxNswFGSsskecegtLEp1alPUB7d4B+3aN7Abvd5/8KrHIe4VXHbCq3zJwfBsyGQ1w8DeMaqDwYtqBmkpogVY789qn4R/N2J07+JslKBYnLANCyfl/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnyaHC7wVCEj7PVfHaCZ/siB+nvKIeTH7gAEj1JNfR4=;
 b=jPKEmx7eAIegEeiUV/e6M2rEJfkL5nRPlXMCnly+qpDEjV8cyDDDTuVpkgwvLv76M2m14tA7ohyksj9qOjJ6YfcaCmLucr3EQQjTXZ3h5THW+/y4dfWrAZsP9yzdZPdOhMB46bMHQIZKu+7rAQXUaeHyfMJNo5tA2EPKXgkL+bU5UvsJdzawP1WrAQ+B6Uss3TYhujvAwwB7g5qSwRdMTbp8yIylOprS1zoXnRM3fAcvShjqudb5dBnEES0X5JvjO38zb7UWsq2UlFlC1Niu2KHTc7tWnQlRdtNcP6fJ+52TXZXgUgPZyi81tuWfDUF1Pf3NzRG8Pbp4hbixwHO0hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF4AE904FD9.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Tue, 20 Jan
 2026 17:44:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 17:44:24 +0000
Date: Tue, 20 Jan 2026 09:44:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [PATCH v4 3/8] drm/xe/madvise: Implement purgeable buffer object
 support
Message-ID: <aW++9XUUEp8IpKBO@lstrano-desk.jf.intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-4-arvind.yadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120060900.3137984-4-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0292.namprd04.prod.outlook.com
 (2603:10b6:303:89::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF4AE904FD9:EE_
X-MS-Office365-Filtering-Correlation-Id: b5af5823-22c3-4d4c-d9e1-08de584b8ca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTJVVld5Wnh3bFB6SlV0ZFRkVU9QZndlNGhab2RWUXdySjJmWkJOTWluWGNM?=
 =?utf-8?B?eVdnT2dxUS9vZEVWSjNmU2laZ0xxcjRKR0ljcm5Vd0E1YjIzb2YrM3REdTVp?=
 =?utf-8?B?dGNRSzlsMVNnNTFRcjVRVU9INkppRDZHRitENEFEd0d3ZlExeTJsbmRpSE9u?=
 =?utf-8?B?dm5CQzVmamxWYjhtdmNoL3hUQW9NYmxmWEFzM08yUUUxVkdudGp1SXh4UG83?=
 =?utf-8?B?T1Yya29lQWtrSUZHMGdVdDRMRlVhZHlaQWlDWmlnWTlNdVJRSm1xcmE1R3F6?=
 =?utf-8?B?S3pTWmdYbnd6UmJYOCszM0sybXEySUpQTDl3WnZJem5FRzkyMmtuVGQyT1J6?=
 =?utf-8?B?cjFvSGRWM1o3UkZpUmJ0ZDFRbVhvdG00WXVyRkFqcCtOaFlRd2VPZnFvKzFB?=
 =?utf-8?B?NU5PdVFoNkpLTldHZTZ3S0F4ODlsRW5GUFVwUzlGazRUSVVhRVpSSm5SQWcz?=
 =?utf-8?B?cy9vejRaVEJLZmRJZHE0QmVDc3VVcnp0Z3pITjgrdncwemNNNWFOR2doWWsv?=
 =?utf-8?B?Q1BqbXhMTFJMMzdpV1dxT1lVVlZ4eHF2LzlVaWpGSTdheVllVHVwZEN2LytL?=
 =?utf-8?B?MWZBclZvaFRGWlhuUGt3dGUxU2xlSklOMFhtSmhiaFI5S0ZNUzFPaURQZUNS?=
 =?utf-8?B?K0RsSDFwQ3FyTmFoSitRSWlNUDBvUys4WW5tc1lwSHF0MXVzTnZNeEFtcDRW?=
 =?utf-8?B?MU8wOU5BOFAxWkZpcW44bC9jS0c2LzlWZGFBUzc2U3BEWW01NFNjSzQ4dmhv?=
 =?utf-8?B?UkZqeGFJMjNjbjhMNlJ0UkxtZk1TMFhHcWxVK1VJUHA2clZ0S0VXM0prMm05?=
 =?utf-8?B?Z0pDdEM3WHpqNmhPMm11OFR5ZThZWHRQaEVwNzRIOWdIQ3d1QVZaK1cvL0RY?=
 =?utf-8?B?elZxdi81WnRqdjlqU0U0N1ZKNXo4N2pUSGFUR1ZENXlpMW5MOHcxZExJbWxW?=
 =?utf-8?B?OHhJWlR1MkpPcWdwN3FRdG1HYVFjUVdLcC9ONWNmcEUyK3NEalI5ZzcxTWtk?=
 =?utf-8?B?bFZYNmN5WWNRNjE1SE8zRG4reU5GUXdzbXBhcFpXUEhGTDVvRzEzZGVyUm1l?=
 =?utf-8?B?MnMrRzZjekVlNWlaL21rM2JoeHl0WEJ1M3NKU0R0SFdveVNrZmxHemNZRUEv?=
 =?utf-8?B?WmdRWHJVMUhFaG9NSEZydWl6Vklja2lJOXZvc282dFJkRC9jUkJQUVJHRnVO?=
 =?utf-8?B?bVhRa3AwTnoxM0JxSVI5NENFenVBUGNobmlvUGtMd2RzbVh0bHNBTkRJaDhO?=
 =?utf-8?B?OUlWUGlHdDBYM2JWZDlNYlNLUzZNcVhCYktwbHVLb0hQYTQ4T2lweHprdkxI?=
 =?utf-8?B?SFd1UWZISzgxM25WTVBCVmh4V2tpUHhRcEx1WG9QQW8wb1NKZDB2dVJodEcz?=
 =?utf-8?B?SkRtYldabTNZak9wS3JuWmF6M0orU0JKUWh6MGJhWDA4djNxVERPMmxSSnlQ?=
 =?utf-8?B?KzZabzBuajVYd0xKdFRhcFdwQXErcU1TdWQyTTJmUFJoSlRTUFhaQjBXOUZs?=
 =?utf-8?B?eUZqZS9zNkxqVHp3cE8zazdGTXB5ZDFSNDNIaTlvMWtyWVlaZ0ZnSUc1dU9i?=
 =?utf-8?B?U0h1VXpxSVJSa3BXd1A0ZWNRcTIxemZZaHZadE93Q1NmdytGZGd5YzgwVWFQ?=
 =?utf-8?B?U2svdGErZ09nS0lZZ3pocWdranloaG9WTVNnMHJ5eVliTnpkRVNIMWpIZzdP?=
 =?utf-8?B?T3RMbithVElPSkxCb1ZUSm95SlR4TjhLcitGU0k3UlVhSDA2TXVWNG9yVFIv?=
 =?utf-8?B?RDhJdWRjbklBbU9Kc3FnZXRpVUVNallIbTdXM20zSEE5S2xlUUQ1ZW5FbU1H?=
 =?utf-8?B?YlhQMXZlbGgyQklNZXBrNSs0VWZEZXQxc1duRFdzTFEyRzdXd3JVTnRRNTAy?=
 =?utf-8?B?a0tkSWYzYnR1d0YxL2xETkowdGg3NmhaS1kwS0c0MjlhNE1Ndm1pZjRiQmpV?=
 =?utf-8?B?YWxhNEsxejFKRzhqM1BsaTU0MHp5SEdLSWd4d1dJV25hU0VJQk1tZWZJc2Rs?=
 =?utf-8?B?NlRCUnNKTnRhdzNQRHhsNDRsa3NGWGpnOHFZY21uV25ObDVlVFJBTTB2akU5?=
 =?utf-8?B?YzlTS2YvcjNmM0hLeVNTbGpyVlExeWZBeXJ2dVFtZHFtc0FJcStNcWUyVk5H?=
 =?utf-8?Q?qyqs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0I4NkNzTE94T2Z5eU1adTFuWnh3UlBYRkh1UDR4R0psZ3o2bHFtdTZpUHow?=
 =?utf-8?B?YVJnVENxQWtHN0FOMTdvaVp4UERtbFVwVjJwa1hSaHBmcjJIZVpwN0o3MVFN?=
 =?utf-8?B?NnRXTjdWeUFXYjRZSUpSN0R1SENpMER3eVRhcGFMdGhXWmcrSVArSU9rR2lo?=
 =?utf-8?B?eXVlM1pteFFadGl0ZEUxYVE4MGEzQ0l1RFBIVjhoOEdEb1FhaUVBNnFHNXFt?=
 =?utf-8?B?eGVwYXkrMlE4OWlNZlYvc0YycGtKcVRVd0J0QjF1enFWSFNzaXpEOE1RNFQv?=
 =?utf-8?B?RzNzWkpubjlXcGVHbmczVlZhSGFPeExDa0NXZUJzQVQxOFdvaDkxNHNUYWoy?=
 =?utf-8?B?QkUzOWl1cVJMcm51cGw2RW5DSGY3NEM3QmgrNnlPQU9TaFlUV2ZBR2dJdlJh?=
 =?utf-8?B?aHJBcVN2bUY3cHRCY0k1WGh6cVhGSUw4bmpWb2k0cU1oYjJRZ0IxTkxQSTFF?=
 =?utf-8?B?a3Y5Nld2NXQwaWhWZjRwT1Ntb0xCRXFqMWVreU01U1ZuTDQ2NkNJRFh0cGF4?=
 =?utf-8?B?TVBPNHZqMktGU2x1ekw5c21EazR6WDdMYUJMeDBOVEZabnQzMTVQTzRkc1E2?=
 =?utf-8?B?a3ljaUZMSlBHdWpucGdsa2daYkRCeEEyaWpmc1cySjJRSUdGY2RRdys4QlNX?=
 =?utf-8?B?RDhDMzZpNmV5N2QwUjR2RStSeFZ6NjBzbGhGN2VHNlJ0Rnd5QjdOaTZTQWdG?=
 =?utf-8?B?MlRDUW0xaERqbEZMUHA1UFBPV1hnVzlwWFFHYy83V2xLLzg2ZExkNGJZUCty?=
 =?utf-8?B?TUsvVTdEeHJCWnFnckRZQkx4a0NlclpCQy9BUXBLRDJHekR1am5pYTNQRUtq?=
 =?utf-8?B?aGlUODhweDhhaEhHZE5RSU0wYU1TRG8vYnNTZjNVQ0VueWlVWjgwcVY4eXdj?=
 =?utf-8?B?REVzQzA0Tk9rM0VaOTc1YVN6a1NOVm5vc1JqY3RRbDRVOVZkenFSYmlZeEh2?=
 =?utf-8?B?WlVCdSt2bmYzL09uZy84a0pRMWp3OWZ2RUh3ais0d0dMb1loZ3JrYzFCOWNS?=
 =?utf-8?B?R2RtbnJNRXhXb0FpUkNzQ0VoODdVMVFIM2JOZG1UMjluVnRpbmZVdGlSTVk4?=
 =?utf-8?B?eGhqSVpTR2FFWkNPSGlVdWVLSkhpSUw3UmxYUzNQT1Q1MUxxeHRHV0hiQ3cv?=
 =?utf-8?B?cU1DTzlVbk5SNlc5THlOTlFxNERENFBRNm5ZRVd4bmlzZmd3V2pQNWlXWWJH?=
 =?utf-8?B?OGNVZldHcEJoZnpnLy9OKzlCUWtBNWtIV0ZsSTM4aURaNEdqQS9adTJHQXoy?=
 =?utf-8?B?VThFd3ZFcGg3WXdwVHRzaHh4dWxvWUV3a3lwMWIzeVpvQ3VPcTh2M05KWit3?=
 =?utf-8?B?Z3QyaGZCb1AwK0JiUFI1NGtzRjZRc2FnWUI5d1JSNmUwSmRCUWF1UEFJcDND?=
 =?utf-8?B?OUxzRlpsZGZVTW1nblRRRVVEeVY1bm1iU1crU2xMZzRjNnhzbitIL2dWNmVt?=
 =?utf-8?B?dFF4NWRpNjg0VHM2MkI3TTNxUDZzeWhEUFdqY2kwellBbWxSVGdvcVdFdVRO?=
 =?utf-8?B?MzVYNjlqdzdCNEJGeWdyZUl5dWU5ZUM4UUsrN1dEY0JDdk5DSFdnNUhUZlll?=
 =?utf-8?B?Z1JCUFlLM3MxamsydFpjaUZVTkNKdkc5V1h0Zjl1VE90SExWR3lEbEVrcG5h?=
 =?utf-8?B?clV6Z0pKVURKcEY5SXBCREFRQTdEVHVFTE8xc3lsQUpUbDJWUUswaWgzOVFx?=
 =?utf-8?B?ZExWZmVDVCtPSys0WmFsdVVwb2hTT3dNN05qZ2pXWHJiRGxoT1VMQkVuNzNr?=
 =?utf-8?B?OThONGJ5THZsMHc0WWw3M0l1UVBzQzF4TUhWRE14VjlwUFNrQzlWNjlvbFA2?=
 =?utf-8?B?YTdlUHgxb3B0eU13M2ZZRTIxNW9CY1gwRXFzZ2FsZWhqaCs2eWwxa0l1eHdD?=
 =?utf-8?B?RGFXME9xYTZOOEJSaVk2WHVDNHZvZGhlbmNPRVNwTWF2anNuN29lWktYWXN2?=
 =?utf-8?B?TG1MV256OStsdm53M2ttbHMrRXdrR0lLZ3FUalQ5MGQ0ZllEbmRQTlVTaXIz?=
 =?utf-8?B?VTMrRXhWNEtCbzJtNE5RVW5YMmh2VG1mcFF4VFNTY2s3S2xtTDJkbDh4MDM2?=
 =?utf-8?B?WjJGU1pwYVJIcnlUa1VwUXkrK254bk0rZEtXKzRQWk9RUWs3UVdMQnlmTXlV?=
 =?utf-8?B?aC92NzV2czgzai90Rmo2UXIxSkovTVc1L3piRHRqSzNCaG1uZDRvOVFzWGxL?=
 =?utf-8?B?WWY1Z2MzaG1CSVErZmcrcGNSOWloNzVVOEwyZlRGeGNRRWxleDUwdk5wU3U4?=
 =?utf-8?B?ZFNjRzR5T2Zna0VtSW5Md1QrenhqbGppdVd3aGxaTldwOWxDWUxrZXNTS3dG?=
 =?utf-8?B?TksxaHN5Z2o5K2dqaVo1NjVoT2FGYXRwcVdZNGEzYnpHWnpqRm5oN3Z5M0Ew?=
 =?utf-8?Q?nba/NbDIjI3XhsOE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5af5823-22c3-4d4c-d9e1-08de584b8ca6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:44:23.9960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5XEKQ0BzNiFvXmgaBZy9Xi7G8OW+BL9wLgUTOwgwee91Q+C50kZ6SIOKAZcisPVH2l48bHOFnERaz37MdE5Lcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4AE904FD9
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

On Tue, Jan 20, 2026 at 11:38:49AM +0530, Arvind Yadav wrote:
> This allows userspace applications to provide memory usage hints to
> the kernel for better memory management under pressure:
> 
> Add the core implementation for purgeable buffer objects, enabling memory
> reclamation of user-designated DONTNEED buffers during eviction.
> 
> This patch implements the purge operation and state machine transitions:
> 
> Purgeable States (from xe_madv_purgeable_state):
>  - WILLNEED (0): BO should be retained, actively used
>  - DONTNEED (1): BO eligible for purging, not currently needed
>  - PURGED (2): BO backing store reclaimed, permanently invalid
> 
> Design Rationale:
>   - Async TLB invalidation via trigger_rebind (no blocking xe_vm_invalidate_vma)
>   - i915 compatibility: retained field, "once purged always purged" semantics
>   - Shared BO protection prevents multi-process memory corruption
>   - Scratch PTE reuse avoids new infrastructure, safe for fault mode
> 
> v2:
>   - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas Hellström)
>   - Add NULL rebind with scratch PTEs for fault mode (Thomas Hellström)
>   - Implement i915-compatible retained field logic (Thomas Hellström)
>   - Skip BO validation for purged BOs in page fault handler (crash fix)
>   - Add scratch VM check in page fault path (non-scratch VMs fail fault)
>   - Force clear_pt for non-scratch VMs to avoid phys addr 0 mapping (review fix)
>   - Add !is_purged check to resource cursor setup to prevent stale access
> 
> v3:
>   - Rebase as xe_gt_pagefault.c is gone upstream and replaced
>     with xe_pagefault.c (Matthew Brost)
>   - Xe specific warn on (Matthew Brost)
>   - Call helpers for madv_purgeable access(Matthew Brost)
>   - Remove bo NULL check(Matthew Brost)
>   - Use xe_bo_assert_held instead of dma assert(Matthew Brost)
>   - Move the xe_bo_is_purged check under the dma-resv lock( by Matt)
>   - Drop is_purged from xe_pt_stage_bind_entry and just set is_null to true
>     for purged BO rename s/is_null/is_null_or_purged (by Matt)
>   - UAPI rule should not be changed.(Matthew Brost)
>   - Make 'retained' a userptr (Matthew Brost)
> 
> v4:
>   - @madv_purgeable atomic_t → u32 change across all relevant patches. (Matt)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

One last nit here - it is fine you want to implement parts of the IOCTL
eariler in the series to make this eaiser to review but please don't
flip on functionality of the IOCTL until all parts are in place so we
can't biscet the tree and get half of the IOCTLs functionality.

Matt

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c         | 61 +++++++++++++++++----
>  drivers/gpu/drm/xe/xe_pagefault.c  | 12 ++++
>  drivers/gpu/drm/xe/xe_pt.c         | 38 +++++++++++--
>  drivers/gpu/drm/xe/xe_vm.c         | 11 +++-
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 88 ++++++++++++++++++++++++++++++
>  5 files changed, 191 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 408c74216fdf..d0a6d340b255 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -836,6 +836,43 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>  	return 0;
>  }
>  
> +/**
> + * xe_ttm_bo_purge() - Purge buffer object backing store
> + * @ttm_bo: The TTM buffer object to purge
> + * @ctx: TTM operation context
> + *
> + * This function purges the backing store of a BO marked as DONTNEED and
> + * triggers rebind to invalidate stale GPU mappings. For fault-mode VMs,
> + * this zaps the PTEs. The next GPU access will trigger a page fault and
> + * perform NULL rebind (scratch pages or clear PTEs based on VM config).
> + */
> +static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
> +{
> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> +
> +	if (ttm_bo->ttm) {
> +		struct ttm_placement place = {};
> +		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
> +
> +		drm_WARN_ON(&xe->drm, ret);
> +		if (!ret) {
> +			if (xe_bo_madv_is_dontneed(bo)) {
> +				bo->madv_purgeable = XE_MADV_PURGEABLE_PURGED;
> +
> +				/*
> +				 * Trigger rebind to invalidate stale GPU mappings.
> +				 * - Non-fault mode: Marks VMAs for rebind
> +				 * - Fault mode: Zaps PTEs (sets to 0), next access triggers fault
> +				 *   and NULL rebind with scratch/clear PTEs per VM config
> +				 */
> +				ret = xe_bo_trigger_rebind(xe, bo, ctx);
> +				XE_WARN_ON(ret);
> +			}
> +		}
> +	}
> +}
> +
>  static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		      struct ttm_operation_ctx *ctx,
>  		      struct ttm_resource *new_mem,
> @@ -855,6 +892,15 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
>  	int ret = 0;
>  
> +	/*
> +	 * Purge only non-shared BOs explicitly marked DONTNEED by userspace.
> +	 * The move_notify callback will handle invalidation asynchronously.
> +	 */
> +	if (evict && xe_bo_madv_is_dontneed(bo)) {
> +		xe_ttm_bo_purge(ttm_bo, ctx);
> +		return 0;
> +	}
> +
>  	/* Bo creation path, moving to system or TT. */
>  	if ((!old_mem && ttm) && !handle_system_ccs) {
>  		if (new_mem->mem_type == XE_PL_TT)
> @@ -1604,18 +1650,6 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>  	}
>  }
>  
> -static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
> -{
> -	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> -
> -	if (ttm_bo->ttm) {
> -		struct ttm_placement place = {};
> -		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
> -
> -		drm_WARN_ON(&xe->drm, ret);
> -	}
> -}
> -
>  static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
>  {
>  	struct ttm_operation_ctx ctx = {
> @@ -2196,6 +2230,9 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
>  #endif
>  	INIT_LIST_HEAD(&bo->vram_userfault_link);
>  
> +	/* Initialize purge advisory state */
> +	bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
> +
>  	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>  
>  	if (resv) {
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 6bee53d6ffc3..e3ace179e9cf 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -59,6 +59,18 @@ static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma *vma,
>  	if (!bo)
>  		return 0;
>  
> +	/*
> +	 * Check if BO is purged (under dma-resv lock).
> +	 * For purged BOs:
> +	 * - Scratch VMs: Skip validation, rebind will use scratch PTEs
> +	 * - Non-scratch VMs: FAIL the page fault (no scratch page available)
> +	 */
> +	if (unlikely(xe_bo_is_purged(bo))) {
> +		if (!xe_vm_has_scratch(vm))
> +			return -EACCES;
> +		return 0;
> +	}
> +
>  	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
>  		xe_bo_validate(bo, vm, true, exec);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 6703a7049227..c8c66300e25b 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -533,20 +533,26 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  	/* Is this a leaf entry ?*/
>  	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
>  		struct xe_res_cursor *curs = xe_walk->curs;
> -		bool is_null = xe_vma_is_null(xe_walk->vma);
> -		bool is_vram = is_null ? false : xe_res_is_vram(curs);
> +		struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
> +		bool is_null_or_purged = xe_vma_is_null(xe_walk->vma) ||
> +					 (bo && xe_bo_is_purged(bo));
> +		bool is_vram = is_null_or_purged ? false : xe_res_is_vram(curs);
>  
>  		XE_WARN_ON(xe_walk->va_curs_start != addr);
>  
>  		if (xe_walk->clear_pt) {
>  			pte = 0;
>  		} else {
> -			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> +			/*
> +			 * For purged BOs, treat like null VMAs - pass address 0.
> +			 * The pte_encode_vma will set XE_PTE_NULL flag for scratch mapping.
> +			 */
> +			pte = vm->pt_ops->pte_encode_vma(is_null_or_purged ? 0 :
>  							 xe_res_dma(curs) +
>  							 xe_walk->dma_offset,
>  							 xe_walk->vma,
>  							 pat_index, level);
> -			if (!is_null)
> +			if (!is_null_or_purged)
>  				pte |= is_vram ? xe_walk->default_vram_pte :
>  					xe_walk->default_system_pte;
>  
> @@ -570,7 +576,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  		if (unlikely(ret))
>  			return ret;
>  
> -		if (!is_null && !xe_walk->clear_pt)
> +		if (!is_null_or_purged && !xe_walk->clear_pt)
>  			xe_res_next(curs, next - addr);
>  		xe_walk->va_curs_start = next;
>  		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
> @@ -723,6 +729,26 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  	};
>  	struct xe_pt *pt = vm->pt_root[tile->id];
>  	int ret;
> +	bool is_purged = false;
> +
> +	/*
> +	 * Check if BO is purged:
> +	 * - Scratch VMs: Use scratch PTEs (XE_PTE_NULL) for safe zero reads
> +	 * - Non-scratch VMs: Clear PTEs to zero (non-present) to avoid mapping to phys addr 0
> +	 *
> +	 * For non-scratch VMs, we force clear_pt=true so leaf PTEs become completely
> +	 * zero instead of creating a PRESENT mapping to physical address 0.
> +	 */
> +	if (bo && xe_bo_is_purged(bo)) {
> +		is_purged = true;
> +
> +		/*
> +		 * For non-scratch VMs, a NULL rebind should use zero PTEs
> +		 * (non-present), not a present PTE to phys 0.
> +		 */
> +		if (!xe_vm_has_scratch(vm))
> +			xe_walk.clear_pt = true;
> +	}
>  
>  	if (range) {
>  		/* Move this entire thing to xe_svm.c? */
> @@ -762,7 +788,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  	if (!range)
>  		xe_bo_assert_held(bo);
>  
> -	if (!xe_vma_is_null(vma) && !range) {
> +	if (!xe_vma_is_null(vma) && !range && !is_purged) {
>  		if (xe_vma_is_userptr(vma))
>  			xe_res_first_dma(to_userptr_vma(vma)->userptr.pages.dma_addr, 0,
>  					 xe_vma_size(vma), &curs);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 694f592a0f01..c3a5fe76ff96 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1359,6 +1359,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>  			       u16 pat_index, u32 pt_level)
>  {
> +	struct xe_bo *bo = xe_vma_bo(vma);
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +
>  	pte |= XE_PAGE_PRESENT;
>  
>  	if (likely(!xe_vma_read_only(vma)))
> @@ -1367,7 +1370,13 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>  	pte |= pte_encode_pat_index(pat_index, pt_level);
>  	pte |= pte_encode_ps(pt_level);
>  
> -	if (unlikely(xe_vma_is_null(vma)))
> +	/*
> +	 * NULL PTEs redirect to scratch page (return zeros on read).
> +	 * Set for: 1) explicit null VMAs, 2) purged BOs on scratch VMs.
> +	 * Never set NULL flag without scratch page - causes undefined behavior.
> +	 */
> +	if (unlikely(xe_vma_is_null(vma) ||
> +		     (bo && xe_bo_is_purged(bo) && xe_vm_has_scratch(vm))))
>  		pte |= XE_PTE_NULL;
>  
>  	return pte;
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index add9a6ca2390..dfeab9e24a09 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -179,6 +179,56 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>  	}
>  }
>  
> +/*
> + * Handle purgeable buffer object advice for DONTNEED/WILLNEED/PURGED.
> + * Returns true if any BO was purged, false otherwise.
> + * Caller must copy retained value to userspace after releasing locks.
> + */
> +static bool xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
> +				       struct xe_vma **vmas, int num_vmas,
> +				       struct drm_xe_madvise *op)
> +{
> +	bool has_purged_bo = false;
> +	int i;
> +
> +	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE);
> +
> +	for (i = 0; i < num_vmas; i++) {
> +		struct xe_bo *bo = xe_vma_bo(vmas[i]);
> +
> +		if (!bo)
> +			continue;
> +
> +		/* BO must be locked before modifying madv state */
> +		xe_bo_assert_held(bo);
> +
> +		/*
> +		 * Once purged, always purged. Cannot transition back to WILLNEED.
> +		 * This matches i915 semantics where purged BOs are permanently invalid.
> +		 */
> +		if (xe_bo_is_purged(bo)) {
> +			has_purged_bo = true;
> +			continue;
> +		}
> +
> +		switch (op->purge_state_val.val) {
> +		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> +			bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
> +			break;
> +		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> +			bo->madv_purgeable = XE_MADV_PURGEABLE_DONTNEED;
> +			break;
> +		default:
> +			drm_warn(&vm->xe->drm, "Invalid madvice value = %d\n",
> +				 op->purge_state_val.val);
> +			return false;
> +		}
> +	}
> +
> +	/* Return whether any BO was purged; caller will copy to user after unlocking */
> +	return has_purged_bo;
> +}
> +
>  typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
>  			     struct xe_vma **vmas, int num_vmas,
>  			     struct drm_xe_madvise *op,
> @@ -306,6 +356,16 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>  			return false;
>  		break;
>  	}
> +	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
> +	{
> +		u32 val = args->purge_state_val.val;
> +
> +		if (XE_IOCTL_DBG(xe, !(val == DRM_XE_VMA_PURGEABLE_STATE_WILLNEED ||
> +				       val == DRM_XE_VMA_PURGEABLE_STATE_DONTNEED)))
> +			return false;
> +
> +		break;
> +	}
>  	default:
>  		if (XE_IOCTL_DBG(xe, 1))
>  			return false;
> @@ -465,6 +525,34 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  					goto err_fini;
>  			}
>  		}
> +		if (args->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE) {
> +			bool has_purged_bo;
> +
> +			has_purged_bo = xe_vm_madvise_purgeable_bo(xe, vm, madvise_range.vmas,
> +								   madvise_range.num_vmas, args);
> +
> +			/* Release BO locks */
> +			drm_exec_fini(&exec);
> +			kfree(madvise_range.vmas);
> +			up_write(&vm->lock);
> +
> +			/*
> +			 * Set retained flag to indicate if backing store still exists.
> +			 * Matches i915: retained = 1 if not purged, 0 if purged.
> +			 * Must copy_to_user AFTER releasing ALL locks to avoid circular dependency.
> +			 */
> +			if (args->purge_state_val.retained) {
> +				u32 retained = !has_purged_bo;
> +
> +				if (copy_to_user(u64_to_user_ptr(args->purge_state_val.retained),
> +						 &retained, sizeof(retained)))
> +					drm_warn(&vm->xe->drm, "Failed to copy retained value to user\n");
> +			}
> +
> +			/* Final cleanup for early return */
> +			xe_vm_put(vm);
> +			return 0;
> +		}
>  	}
>  
>  	if (madvise_range.has_svm_userptr_vmas) {
> -- 
> 2.43.0
> 
