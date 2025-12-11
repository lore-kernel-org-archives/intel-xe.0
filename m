Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAF7D41D7E
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 18:19:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD4E10E56B;
	Thu, 11 Dec 2025 18:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxEeHzwV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A78410E56B
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 18:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765477150; x=1797013150;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WrFaYtVx9qSul6Iq3oO+EZv5u+Bwb0/Ln72IjpbxSVA=;
 b=BxEeHzwVU2ohzqEKG6VeytWgCM3U+o2ZFGLlhjjwzCF7zPKy+SYH36yA
 we1MOnIG7XCUC5qswY9Fm65Fc7r76Q1w3AsF6wZDzcuu2I0DxF/LkRjwL
 yeJ36sKJ9kXKVtjmfuE51pK2Aue/JcTBOGs8U8FB+xBMGxkRMnQkHao9I
 iX88yMQThQXlHjfPqXYthmuuVWqSI6R6hdKVbqnP1VxpNasEAbPOruEJ3
 KcWgNXDbZb41CSJa2CmmFjFZZNWek7iBqVo+GRadGbXc/D2YzyDX0zQzy
 N/bekpmYA9tBpwH5BFpyEbGgPKyKi+eCaq7+d1vYcD6foG8KBaOP1+pd4 A==;
X-CSE-ConnectionGUID: gtavR7EAQ4SUM0xQL7dWPA==
X-CSE-MsgGUID: uxUzCzbESxWOJyTBCScfcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67515084"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67515084"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 10:19:09 -0800
X-CSE-ConnectionGUID: zf6Bz7oUTaikAI0HjS9+gA==
X-CSE-MsgGUID: HVAAidDbS62EmZttZ6mq3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="197685014"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 10:19:09 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 10:19:08 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 10:19:08 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 10:19:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCddjIg75OxFY2rUTBsnAwrtS/xjVh+rzsLoxYxDHNNCff9fBX+5GgzcFdhGlyMRZB0URzRsxncv22TK5aIc/3CW5IC4Wabpy0S9ouVNtbrsSv391n5jGgSYP1GndENe0h+UF+AaWFgnXosRYE0nYZgK1zoAx58E3qLHugZ738mt8PucJgjFf8EikT1P8wFdfH3iGe0v0+PcKajPKahdwTCrmsAYsEy0WXP1jKblpUw2ZMZxV7A3C/kb1IqquqfYscZ6uvdnocZam+BejpR6H9uDi1v2pxA7H6T1NAhelA3OkSkIeDwSfFgOuLUvT/YLDypwVMO1RJImhpk+qhDsiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8t17DJETSMMJjTwTCtlX5AP9C1yUlK17MY0WBhm5Mg=;
 b=rzXKXi+c+U7kJvzDY80q++fRkrf8QQKBFe7C8Byg3NcBd8F/NIHC1WsegJJLzRpz9WdBxEm8jc1al1kzqGqhWdekSSgRIvmbPqD22yg0kZ16oH45b13rprpcOk9EIwYQgTrkRRXl1SN0wcr0opreEIzGk/F2CVEK6yP6piYjfErJ0WQfYEDQYuXb1CBdKUdWMgflOTSwTLIDesp90cej6XJGwpHcL9zgVTFt2AWceIg7AloaghrGBQGGRKhkUc0Rh7rZ/OPUzgLsyZFguhYNdbs/WpOyqVoai7XbPeenJMLpIYrdHeXMEOJGLDqtvJHtABLHfwvWcA5nWxJc7+cxiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA0PR11MB7353.namprd11.prod.outlook.com (2603:10b6:208:435::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 18:19:04 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 18:19:04 +0000
Message-ID: <ecf73f17-bce9-4e3f-96fd-f5ceb9d489ca@intel.com>
Date: Thu, 11 Dec 2025 19:19:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] drm/xe/gt: Add engine masks for each class
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
 <20251211015700.34266-15-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251211015700.34266-15-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA0PR11MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f6edbab-fcd7-4400-ebae-08de38e1c3f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dW01enAvYmxtWHVtTlV0amFFbXY1LzNWKzZQZTlkK2h5RU56T3Q3Z3FxNDYz?=
 =?utf-8?B?bWVIVERvSlBkNnprYVFwOWs1VFFuU1Jzd1RqOTZKMUxnNzhYdjd0R3ZYRUd2?=
 =?utf-8?B?dHU5WjZydGlsWll1a1p3VzhUSmUydXBaczBIVmlIS3Y2a2NDd1ZGdmswalln?=
 =?utf-8?B?VVFpVTZodzViTytuKzQzblY0ZkZMZW5CQWxLSTlWTytMK2Vyd0JaTnVjSjlj?=
 =?utf-8?B?Z2xKWjkyTHFGRkZaTG9Gdy9tUUJ0U0M0UDlrQ2ZwQ3FxbjNsUE9kYzh1VDRn?=
 =?utf-8?B?L3gwRTlTaE1VWG8zVUErM3IwR3NkYmNVbFdxSjRCSGJKMDdMUXRvQXo5S3dT?=
 =?utf-8?B?WWpLVmNydEY5QWo5a0JNNW0yM01vQmRvYklQbGQ4SitEVWU4ckNFTUZlRWdo?=
 =?utf-8?B?b0RGT0o3cGtDVDFXTmdzWGNFcFM2VC9DZTZJMTd3NXNTdWcvZ0l2OThKblk5?=
 =?utf-8?B?bTJTb0RUZmFBMlVIdlRRbG9IdDc4SXR0RFRyUWRrQVhhYVJHOE5CamRyU3Fa?=
 =?utf-8?B?c2JOVndMNEJIUWtUNSt0LzQwUjVjSFpnSGc5c1hYbUdNSU1wbWdzSktGNENF?=
 =?utf-8?B?WWU4dXBkSTdLcHNWbXJhcFFiRDFXeGlBY0dIdlJKN2l1U2t2U2FJKzBnbDdM?=
 =?utf-8?B?ZGZxMmFobkNrZFptOU95c0pFYXlCZEZIMUFzQ09NRXErWVlmNXkwK2grMlFK?=
 =?utf-8?B?T1ozN0g1T0s5RFNVRS9ibWxsMDFPSCt1ZUd5QzF2a2tHbC94R1p4THF4eE1W?=
 =?utf-8?B?RUhpdDBYbm5LT3NsaU1halQrK2JFS3VkRnZyMXl2UXRibiswcTRYMnJnSDZt?=
 =?utf-8?B?MFU3SEIrV0xLU1ZPMTFUNzh6UHVjTm5jbThGcTBkTEVROWVrS09uRWUwSGVz?=
 =?utf-8?B?WWpzNVhlSytuMFVoUHFhZGkyY0RpL2pFSEtnL1YyVVk3TlZaaG5tQ0FUYlE3?=
 =?utf-8?B?K1NFWlR0blM1b29OZ2RsNmk5dTByaXo0emRHZGtiNlVob1Z1aXloK1N3SDBo?=
 =?utf-8?B?ZzdtaTRyc3FLSU5kdzJhNnpqc2hXMWFsak4xZTMxbGtjVHU3UXBGYUJmUVJ4?=
 =?utf-8?B?K01HcCttZGFmRnN3NUFGNVVGRzZZenBTRTdhbDE0djNtMi9ocWtBYWFuR3k3?=
 =?utf-8?B?a0pwMVBNSjRucDBGWTNmakFHem5lZWtQejZZNWg0YzZLTXluN2pVdnFKNkNh?=
 =?utf-8?B?N1J2YXhEREhTcldZUDQ3Q0k2YVVrQUs5Z1loaEV0SXVsa0dra2dmSnBaVUR5?=
 =?utf-8?B?WDRBSmJrUVJuY1hwZXFxZTVvdEdaWUlxamZMWmViZEdGeGh1OUlwS09NRnZY?=
 =?utf-8?B?L3dXVUdZYVdUT1pLTzkvYzJ5YWVYVzV0a1h0eGhMSXJlUHRpU0ZuS254eU5C?=
 =?utf-8?B?RDBOeTRtR1I3anBYbUZqc1ZWUGx2TnMrVHZaL2JmUkRSaHFiVHV3RElIbEFz?=
 =?utf-8?B?aGRySkV4ZUJkR1lQQ1ZTK2dHQ2M4VE9pWXNaQ2JoU0RVRkdPSzhjTlEwMDAr?=
 =?utf-8?B?ZFZtVC9zRVZJT0FjUUo0amZmM2xQY1cydWkvcTlic1BkRWJSVTVkMUdqZFJt?=
 =?utf-8?B?NWpnVHJqZUgzaExpdjdMMURCTW9zYVZwNFFrcmZXVlliQmdDaTNGUGtaZUJo?=
 =?utf-8?B?V0YxNU5IUHhtUmo4MmRBc2tQZjBGOUZTb1VBQk1Rcmk0VDZ2bWJJYjZabEc3?=
 =?utf-8?B?VmZhWm5JTkFlLzZSRzIwamFPblhIbzNQSHBUeFduUEprdkJoZWo4bFNHSDVy?=
 =?utf-8?B?UXdCdGx5Y0hiQkJWdXl2bC95cklSMm9vWi9Cc2EwcllwSVJaMmpIVGpYbnZ5?=
 =?utf-8?B?NDA4WGdZblJyMG1RcWlvRnYxbTM2NmpDeVlyQmYyNHNuNXBwUzFYcW1IMjJW?=
 =?utf-8?B?YTFURU1ITm9RY3NiTGxtOEUvaVc4czdRSFN4WmRPdVErRHo1YUtjU2o5WE9h?=
 =?utf-8?Q?rzkAfrx3sfjkpgzA5dIVyz7C8xWOKWSD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2xzZmVsdUFpc3JSM2lDd285VjBoSlRiZEwwR1hJakhPTWV3NW1ITnhpRVpN?=
 =?utf-8?B?WlBzZzAzV051R1IreWlLYVJYZEJxV1U2citPR0ZlRmVpai9MTE83TUJrRngv?=
 =?utf-8?B?bUV3NFRyRlR4VkgvYVhWUjVtWVlDc1kxMlhzTXVyekkxVmhGQ3h4V3lyN0ho?=
 =?utf-8?B?Z1REaDhVd3Y3ajUyWjlZQ1hXR0FnbTE3WENldVMvanQxcllWYjJyRGVDNldj?=
 =?utf-8?B?SXFzWjU2TFdjYVZnQ2UyS3JUZEpXRFdUUXBST0RPdThVYnQvaGV6Z3dBREFF?=
 =?utf-8?B?NkdDZ1hSenVkOGhJMnl3bG9FdFJwTjlKWTZQUTdyckRzdXBYaTk5Yy9CS2l1?=
 =?utf-8?B?MlhLdGh6OWltQjdNNnpHaU5HYnpGT2FnaEpZRmhTS1ZoeU93OWRJZk5NdENG?=
 =?utf-8?B?eWxPWEVMaFNhMk5FTGQ1VE5nZ3VSRXBKT3JMVVFwQ09SNEZkcFpOTnJjWEk0?=
 =?utf-8?B?ZWtrVGZoREtmM2N5eGNpd0N5dWdNZlZFK1hzbGZBYjhhNDcvUThWcmlyUmJF?=
 =?utf-8?B?OG9kY3dCWHNhYUhvaVpIQ2JZSlJ0YTVEeDJLYnRPVjVpZGJpbDRlOSt2THVV?=
 =?utf-8?B?THJ3N2dUTUhTTGFHdWZORnZpNitXVTQyUXNWVWw1cGxtWjBzd3U4RGphQzQx?=
 =?utf-8?B?a1F6NVFYc0ptcWlLek5MZkIxSzNBclRHbnVXckZVbUJlVFdMckFsdGQ2Q3BP?=
 =?utf-8?B?ZUVraFdndzh0anU5dHZHVy9wdThjem9EZk16em4veDlmVGZPbW9BRUxHMVlW?=
 =?utf-8?B?NHM3UVpyZ2sxWjZWeUJYNUJNSTBiY2hNNGtrOXE5L2tOVFNGR3d4bWMwak40?=
 =?utf-8?B?L2tPbS9uMkQxaHNwNU5aVTA5RldyS1RyQ1crRjdGT3RCbGp0SnAxOW9nQ0Jt?=
 =?utf-8?B?M2NYOHQ1MCtsZThZa290b1pGRTRDZWg5c0NVdUpZTC9OaWNoSUdCUWl3ZldX?=
 =?utf-8?B?Y1dMTEwvS0R3UGF4U3dsRmh1eVJWVG85aFJyY1pTN2JLbndlVitqRzZPSUI2?=
 =?utf-8?B?aVk3OHZrRTFYM0FQOVdZWDZhNEJ6ZkJLMFdzODVhRmk3dC9MTUlvL0ZNMVlr?=
 =?utf-8?B?Ny92TlBHNzJkdkQvTGlOYkEycS9vY0k1ZHFQdUwwZTg0L0NucnlOdm5VSUwv?=
 =?utf-8?B?V05MNnhqdWExek1ZQUtFeEVVaDdab092bGpEV005S2hVT3RTRklLSFFsZFJW?=
 =?utf-8?B?T2RYVXp0R3Ftc3Q2OGJ2MFlaQ2ZnN1NCN0U3SUo4bit1U0hKY0FoODNTSDc2?=
 =?utf-8?B?aTdIK0VVd2pRTjJNVHljS2IzOTY5VWt6M2ZKZFZidzFiWWMxVVB1dEhyb2lG?=
 =?utf-8?B?enMrenlTUTZjd2RIMTViUmIxWlAzRHlkdE84amluWnZPWWtmZHZTZHdnbmc1?=
 =?utf-8?B?LzdNMEhnWEI1bVpLYkluNzc1b0VSZ2lLQ1FwemRkQmlJOXVaZVhGOURxWmJk?=
 =?utf-8?B?U1hzNGhJM3MvdSs0blFlVkN1bHpseUh0b21HUnhDc2Y0UXFEb0k0Z3FZTGdC?=
 =?utf-8?B?U241MnpUZTBnRjNUUml2NkVXalNQZzE3c2pTVExYU21kdldDc09VVVhwM1pR?=
 =?utf-8?B?SkNocjVFU0RPbUMwM2NVWkFTemNFRE5BbGJpOXAwUXJNUkl1TWtES042Z3Nt?=
 =?utf-8?B?ZEszRmZKbU1mVnpYeWVBZnFPaURmVFhyY3dxcDVjaHk4ejlQZEU2YnRTTDcz?=
 =?utf-8?B?TzN5TVhMMncvdW1LeDVxODFTS3VXRFhvaHJ0aGZqcllKZGFHUUI3cW9rS2xx?=
 =?utf-8?B?MmtHUFNuVkRNVmtmTmdXWmhHTko4RW9xTTZhTmFjTVRGdkU3b3NEb0pNUFhI?=
 =?utf-8?B?cGRSaW4ydGMvcVV3TlJmd3ErOURKbWJVRVNwRGZDQm1PZmFvWFdjc1p6ZENT?=
 =?utf-8?B?TVdOZGpQeVZkdUtnYkZURUhabW15eFZ3elNDOGIxaStuQkdSOWlkQnBWQ0VK?=
 =?utf-8?B?SWh1cENycUlPV0pnVHlUcENwUXdSQ3U2V0tONk8xQ2ltVGR2S0c5RW1LU0Vl?=
 =?utf-8?B?YW9WTkpSeUMxWVFRVFlPd0o3TXZlNTVlMCtGQ0l1OGRiUU53Qys2M0xMcDNw?=
 =?utf-8?B?YnZXT0p2eTI4dUUvdTFBUzlUUy9vWVNCRURId00wMm5TVlVycmdxSndLRWtR?=
 =?utf-8?B?V2ExbnpSRkpjOHNSc2NTNThaWitTOGFMa3QrMlNLMnRqZXBmSHk4djc2L0tr?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6edbab-fcd7-4400-ebae-08de38e1c3f9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 18:19:04.4107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +sTv4++YLzSYdbx3bE9qWJCBlXW9ehgrsLNZuWtxOhZGgjX9xviIry2FC1cCS7b1MDSe4I77NfIbU2nw1/aieepU0uZUt27fGOrAjjgcIJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7353
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



On 12/11/2025 2:57 AM, Daniele Ceraolo Spurio wrote:
> Follow up patches will need the engine masks for VCS and VECS engines.
> Since we already have a macro for the CCS engines, just extend the same
> approach to all classes.
> 
> To avoid confusion with the XE_HW_ENGINE_*_MASK masks, the new macros
> use the _INSTANCES suffix instead. For consistency, rename CCS_MASK to
> CCS_INSTANCES as well.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

