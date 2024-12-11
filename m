Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D073E7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 19:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA6E10E619;
	Wed, 11 Dec 2024 19:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cyxeXC4n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACE810E619
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 19:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733947140; x=1765483140;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7pyBrEzgcvL0jFU1Pi8FzWQD/9ondIAWGmsOkRzrBsw=;
 b=cyxeXC4nxDU2l5sUcTcw2bJWg20NJGnIBG5ha+eIv+6xhQ3ruIvDtjQ7
 jxlmePD3LuxUP6y+vqB6P3cR4CLNnfQnP+SMW2XwSPw8R6Hti+FSjpHRz
 x7sAH1BZs0UMpginlLfM2BRnN8sCO80gB/Kz5ivvNPjA7Y/6Twx66TwZK
 DIr2NBJMufM4q+U6m/OGdJhC3HoOcM2ewym7AOnmK66CwLqV0FBoG+/aa
 AR/WGD245txyxrhoHtMCfjnTN1BM4X5TYYxFN7EYnDaw+LFHVRIW/F7nl
 sDY9w3pKvKRax6DlmdKqWn2m/8adgImoOqKP+CFXOGPrO9f+Kfc4HBt3F A==;
X-CSE-ConnectionGUID: i/+jxQBASrK0MxNTwzLhyQ==
X-CSE-MsgGUID: WkMsp74JS1KE7h3tvbElRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45354696"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45354696"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 11:58:59 -0800
X-CSE-ConnectionGUID: H6i8Rv7jSLme1zV+MlsIRg==
X-CSE-MsgGUID: ID6BnTOzReOipTZRCSqNxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100876714"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 11:58:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 11:58:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 11:58:58 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 11:58:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpXzrtvQA1ltX/Vh39M6mMqyqTJ6fQiz7294tvR7d1fu3OXK10cNY4gYHMrtY4xyNHZrG7L5Q6HxVRnL96wraE32wT7LV9HcT2zf+6Idr2AEWbCYc7dQfYLbIcl+04Vh+emoAh9bA5HjorJKPJlwzVCeq0LFkZCIlrdQotXrygIyui9wkXmHnJyMSdlgihTL9IxS2j/6TUV93I87rWttimS/gsGPPXLpITPD44UhT1vZ5R+Uj5p5XiP4UZ/TEiDtuTZG2E59AGTxhgz0cg6lBj/Zn232nQzJNGOQ+SnOx/BTZuUZqV9CyRe/Zl39IUf96RGdoIacr+TvlbhQZYXCYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOc8ZosrSN2PL80Bm9HCFN4zeIp/0bAwlY/O4MPZLqU=;
 b=ips4i7eg8lmKd65zS2NMpDciGGQoFGHEl9J3OgmSsGQmyhX56SIeirOG5SqnMOP0ZevBoaAtns4TtbCH+lnlyMlbeVu/s3hQAdGrzAdGExJ1tEErY2gUWV1wG/P79gTj4koby9nnBff0HONjQY06mfq8wLK+h+Vi5Wq5azJhG4GnvukG06d9uvuxAy95di5pRPFA8QeG5GpNR58ZiIstRawMD7Xa3wP8ex2YjCoUdAciGwwLD5Bk33ejLeyAPIVmXwqIk45jUmap5gKkvHfR7IUPcYzt6SWQaIeJtq7tCWjhv2GOovgsVX/TGBXXpyDkH1iISBkEwfavTYlhVWXBkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB6480.namprd11.prod.outlook.com (2603:10b6:8:8d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Wed, 11 Dec
 2024 19:58:35 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 19:58:35 +0000
Message-ID: <bba5b895-2212-4f9e-b45c-201d9f589027@intel.com>
Date: Wed, 11 Dec 2024 11:58:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Narvaez, Jesus"
 <jesus.narvaez@intel.com>
References: <20241127011105.1306924-1-daniele.ceraolospurio@intel.com>
 <CH0PR11MB5444295F27D256C3970B419BE53E2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <CH0PR11MB5444295F27D256C3970B419BE53E2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0042.namprd02.prod.outlook.com
 (2603:10b6:a03:54::19) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a4c71c-0769-4fc2-848e-08dd1a1e3263
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1VIRUpWV09YWHNYSCtPa29tL3ladlBPdFI3eHN5amJNd2lhZG91NWVBaDFN?=
 =?utf-8?B?MXJzaFB2RHltYWhzMEZRSk9hNG9tRE8xYXIrRHA4dTZTQlJuY1MxcWZzLzdH?=
 =?utf-8?B?VkdTUFV4Vml4UjVsQ3Jad3Z3eFkxenVRNDRneEZSMHVoSEpBZ05LNExJTkJT?=
 =?utf-8?B?cnhkQW50SHhQUyswR01HR3RlOStKL3NkL0s1Mkp1bDJHa1pLbjJRVjNKU1dS?=
 =?utf-8?B?WnF5cks5TEJBNjdDa0lpVXovcFdGd0QvMS9NcXJjUW5JeUE2ZVRaNzk3b2xM?=
 =?utf-8?B?dmNTRUVjaGR0YW9LaHBWUi9BYXAvM2hwenBzc1JDWU9wRGhGYmFoTVdwZCsv?=
 =?utf-8?B?ZlUzTkFZUGpkb0RaZ0IycFVFTHc0OFgrRkZEcTFtNDcwQXpOajN4aTBMNW5W?=
 =?utf-8?B?N0UxeU1idEw5cFkwRDV4KzdjQ3ZzT1V5NDF3b0lkc3dCQTlrT1RLTE4vV2t4?=
 =?utf-8?B?bjdXb0RKQVNGS1JuMm52TmdSMnFBOVNVeUlzdEl3MjI1ajFjc0FVY1JFYmNm?=
 =?utf-8?B?SldpWTBvdnc2YmpJMy9udVBrb1prVFNsVXdFdlBETS9BNjZCMGhmNnQwZ25u?=
 =?utf-8?B?NmVBUDNJWXVQZTBCUHA5ekNyK3VwNTNDQUltUWZFckljT2E0ZTllM3MrRjF4?=
 =?utf-8?B?OWl4SG5XMWY3T3VxalRkMWc0dGxXRjgreCt3WjRlRXpDRW1ReURtcFVXcWpl?=
 =?utf-8?B?LzVyT1M5Mnc3NFR3U1hGeFJNL01ud1BjTVI0SkJ2SFhHQlZmUDM3Y0xOd3c2?=
 =?utf-8?B?UVd6STNLUEozQnRjQkRzb1p6YUFtekR5eTVUeWlIOGd6a3lnNkJtU3ZKN0Vi?=
 =?utf-8?B?bVN5cVBIcGxZUVFXcGpwNHVCSHM1LzJJMDhYRDFVTVo3cE05NUJ1NmNtZThr?=
 =?utf-8?B?WUxnZmZCZ05xZ3c3bEJCdnZVOUNKNVlDSVFPV2NSZTBsSWdKY2owa2hMREpM?=
 =?utf-8?B?LytvZE40MVZuWE1EMlUwSFlGenptWll4eGppbGQ5TFg0dEVyNjdtaTlndFYr?=
 =?utf-8?B?ampoS1cwNjRpTnFUMGNhaVR3ajl4MGZEZVpJaStjcHBqbGcxSlAxenBTRm5E?=
 =?utf-8?B?cmlBQmFoNmlJc01TUGpXa1ZVWmFRYVJIbmh3T0FSVncydEdOS1c2VzNaNUVI?=
 =?utf-8?B?Z3haNmYxb3BxMWVMNG5iVmZGRWJzRWRLQU1vNFI5RVF4YWpZUEplY252dUV1?=
 =?utf-8?B?cXR3cWJQNzJQR0RiQWI4SlRIbXpoMjVIazkrOEFscnZHSWFiMVdxSzg2WlFu?=
 =?utf-8?B?U2NKSk5nVVE3U0hVWlJrREM1TlZLcWVKL09wZStRWDFaSWtGUXJGYUg1dlNB?=
 =?utf-8?B?Z3R4WlFnMjlqdUgxdXFEbXhBdWlBWlEvSm9YUUFOVFhNbXd6Q1RpTDlVb2Fj?=
 =?utf-8?B?TnVvK2lNY085QldwL2FqNTg0c2Nid1dvek5iY1pvU0hTY2xnYzVtTFdoeFQ2?=
 =?utf-8?B?Sis0RGRJYTRmT0ZXOUR6OEMwcXRpSjRFU2NNa0VZeXl3MytMa3diU2tkTlp5?=
 =?utf-8?B?ckZRcndIUnhReHllUm4ya3UwSFlqd2I3NE9LMWxJK0dEZjVvZkd1YktpZVc3?=
 =?utf-8?B?cE96Zzd3OHpIZlpKUkdja0R3USszVUtFRnlwbXg5N2NHOGpHNnhxdDdkdUJF?=
 =?utf-8?B?ZGN6a0Y1UytjTVladGZ3SmhHWEZuUGlrZFJYeTIrOFN3WVFCQkhkNDkrNjM3?=
 =?utf-8?B?emRBMWs5MWxZMWRicU9xWDNPWlRPb2s2U08zb0pNMFhtRFNLeVkwSnp1cHV0?=
 =?utf-8?B?WFpTQjZLRDEwU2Z2L20vUHYxVTdPMUxVRCtTWWlxUEZOa1lwUGdzQ0xnLzJF?=
 =?utf-8?B?MzJCektJTWVWT2RmVDBhZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aW16MXJldHBVakV2bEtrTEsxSXpDcjNNeStkVW9IaFNwbTB2TnBMRC9BM1B2?=
 =?utf-8?B?eENGQ2s0WEtmYjlUR3cxRG84KzdwN2ZxV01JVjdPSC9ySTdNWWxGL3RnRDFX?=
 =?utf-8?B?bkd4aThOWU91YVVrcWFUSGgvV2Fxb1hHWFh3d2RNRTFzZVNYRGV3V04vZGJH?=
 =?utf-8?B?UHpydzl1czR2MTBsenhhUU0yRFVyWmg2N1NITHcrWTIrdXFhcUM1RFU3Vlk1?=
 =?utf-8?B?aVFpSm80eUgzbWx0SWQxWG1NSzNmU29CWllXMm5MMlZJUGNCeTA0T3BTNGhE?=
 =?utf-8?B?Z2JhRjlQSWZiRkZ6TkdETnZhOEVDWHFsK3dBN1gyRWltb3JkSUNJWW9lK2sx?=
 =?utf-8?B?QXpDVmlmNkdrTm1ZR3QydU9haDVjQUl1RGlYSUxqUEdXTHRJYm1oeFlvNVJP?=
 =?utf-8?B?WEVxRTFZeS8xTUp3bFZFam5RZWROWXh1a2UzbmRSbCtEUWhsRXNMTVJENU05?=
 =?utf-8?B?ZEI0bWxzajU4QjJReGhIbFNseE5WOUZUT2VJNlpxdVp4cDIzUys3UVFsT0ds?=
 =?utf-8?B?Yk93T2dlOW5yQ3FsSk9ycjljL0g4Szc2Ym9MVFJnQ3hNZTR1Vzd3bW9mYVQ0?=
 =?utf-8?B?bjJ0OG12R05jLzJ2TkQ5RU1BTTJrRlFLTnRSWStjK2tSVmtMRU8rQVova3hw?=
 =?utf-8?B?bHpiV00xdkM5SlM2WXVzTUFwa2NXTndrdlhMa2U1OWtoblZPaU85a3BINEpm?=
 =?utf-8?B?OTFtSGNWUlZPL2ZvcWtWWERINmlmNVFpcXRLaWhQeWJOTTJJTHJEbjdsbmp3?=
 =?utf-8?B?R0NiTHVJVkNwUHNpV1ZueTNkNnNFZjNCWlJsaFI1UGNNaFBUN2Ntc2ZWbmhU?=
 =?utf-8?B?VG44WXBXQ2NuWXdYK3NPM0NyVlpDT3VsMnlYT084T1QxTTZ3U0toTS9nUjFP?=
 =?utf-8?B?SjlqeWFxckFMTWNuTUhNOExqaXZDMFRYajB6bCtpanlWY2VBb1FOZExzckFh?=
 =?utf-8?B?WkFkV3BzMzBwOWdBMFlISEJsNU9SdkkyOTQzcmh5SU5aRXJhN2NReGtiMXlu?=
 =?utf-8?B?RDJVTWpwSm1nK2NSNitCNlg2MldocmJDTncxb21CdlNCV2FseVpVcElQZk1U?=
 =?utf-8?B?MHRKN0FDKzkwS3VXRWFMOFgxWEJ1ZGxJSWJrb0NIUms5RTJVSmFybVRpa3VO?=
 =?utf-8?B?d052emh6WG03OTAzVFNRYnd4d3Y5K0ZpSGhnNFBFcm5VRmJBOTN6TVA5d2JV?=
 =?utf-8?B?clpVa1ZxZEhLYTUzZkpYZ01VZktYcVFnTm1xamEwNWwyYVFxRVlra08xb292?=
 =?utf-8?B?VWxNZ21QNlYyM09LNjlVeTVpQzgreXNoYzhwTWtaV2hQRTY1NUk4aDVzakZi?=
 =?utf-8?B?WXdwZmd6bkx3WkV2UjdnWkorbzRaWnVjcTd0c0RiT3dhZEpOdVM3WlB5L3Mx?=
 =?utf-8?B?Qmx5bW9JKzloUS9uN3RBS1l1QzhJeEdCTUtwUlo2cndGdjRYaWNOVjI0azF3?=
 =?utf-8?B?bU1OVTg4TzBXbDgybCtVVnIwWk1nazdvbHd2VlU3RVh2NG5tM040ZzBqdXlX?=
 =?utf-8?B?T0o0UnFrVlpsbkNyS1NTS0ZMbjJwWjVvN1c1ejNTekswMDZvOTdaY0p4dGVL?=
 =?utf-8?B?ZUt6TWFYM0RLcy80MFpHS1pDRVZPUVpBdVUxRjQwODNESVVlNG1EZk1tS21B?=
 =?utf-8?B?WlA3b0RxZFB0Q3phOXlBcFYrK2lacG5CbURmd3NmNE5jYVN3aTRWMmN2S0dr?=
 =?utf-8?B?a3N0SjNsUEpmQlJrejhkZXdJWEhRVXFoMG13YUsvenZnN0NTWWhZclZ3dm9x?=
 =?utf-8?B?SUVWekM3RzgwSlV0Zmc4dTNFRGRrYWNIRVd4cHdPZjd4aEpJWm1hYk1KdjE4?=
 =?utf-8?B?Q1RQcmRNZlluZDhJcExUOTMrd2tndFduK1l6clc4WE4wSE40VDNKUjdiNlc0?=
 =?utf-8?B?cm14TEUrOVhlS1pwM2h5Q2dneE1jT21XbS9FS1ZhVkVFTjhNN25NNzlESElR?=
 =?utf-8?B?RFFBbWJ5Yms4emlrR2FIOStTQkY5YkhHSmxjV2QxL2I3Y0dOYVBKMTA3WUpa?=
 =?utf-8?B?R2VRREdMVzQxbldqaVUzcEhVNWlBc2s2anNiaUUrcEhMMkM5blVOWXlIMlVW?=
 =?utf-8?B?Wk9GdTU1NWYvT3A3S043OS9nSmFvZ3g4NUtMbFpqVkFRMHkvRkJic2t2R3FQ?=
 =?utf-8?B?bEZvRnpvbTJRQUtjSkhTeUE5cTF2RUhrZWI0NHh3akVFUzcrSEw3Rzc5NWda?=
 =?utf-8?Q?HrW6s+mv2oTwEHWHWm6UPI0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a4c71c-0769-4fc2-848e-08dd1a1e3263
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 19:58:35.5157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUew6Sabp4SBE2YjlGrO0rj297JmxtC82V7ezJurmakgUt5ZjMvdlU/qNWRiluT1mNINhu4cxbRpcslRualgjQJyLPywoUsecAwEJSlaRfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6480
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




On 12/11/2024 10:56 AM, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Daniele Ceraolo Spurio
> Sent: Tuesday, November 26, 2024 5:11 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Harrison, John C <john.c.harrison@intel.com>
> Subject: [PATCH] drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms
>> The DUAL_QUEUE_WA tells the GuC to not allow concurrent submissions
>> on RCS and CCSes with different address spaces, which on DG2 is
>> required as a WA for an HW bug. On newer platforms, this block has
>> been moved in HW at the CS level, by stalling the RCS/CCS context
>> switch when one of the other RCS/CCSes is busy with a different
>> address space. While functionally correct, having a submission
>> stalled on the HW limits the GuC ability to shuffle things around and
>> can cause complications if the non-stalled submission runs for a long
>> time, because the GuC doesn't know that the stalled submission isn't
>> actually running and might declare it as hung. Therefore, we enable
>> the DUAL_QUEUE_WA on all newer platforms to move management back to
>> the GuC.
>>
>> Note that the GuC specs also recommend enabling this for all platforms
>> starting from MTL that have a CCS.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index df1ba94cf4ca..ddbfbdf901b0 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -151,7 +151,21 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>   	if (XE_WA(gt, 14014475959))
>>   		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
>>   
>> -	if (XE_WA(gt, 22011391025))
>> +	/*
>> +	 * The DUAL_QUEUE_WA tells the GuC to not allow concurrent submissions
>> +	 * on RCS and CCSes with different address spaces, which on DG2 is
>> +	 * required as a WA for an HW bug. On newer platforms, this block has
>> +	 * been moved in HW at the CS level, by stalling the RCS/CCS context
>> +	 * switch when one of the other RCS/CCSes is busy with a different
>> +	 * address space. While functionally correct, having a submission
>> +	 * stalled on the HW limits the GuC ability to shuffle things around and
>> +	 * can cause complications if the non-stalled submission runs for a long
>> +	 * time, because the GuC doesn't know that the stalled submission isn't
>> +	 * actually running and might declare it as hung. Therefore, we enable
>> +	 * the DUAL_QUEUE_WA on all newer platforms to move management back to
>> +	 * the GuC.
>> +	 */
>> +	if (XE_WA(gt, 22011391025) || GRAPHICS_VERx100(xe) >= 1270)
> This is acceptable, and preliminary testing shows that this fix will repair
> several observed issues.  Though I'm a bit confused why we aren't adding
> the additional graphics version check to the workaround itself?
>
> Is it because the workaround implies a hardware problem, whereas the
> additional applications we're applying it to here are not related to hardware-
> specific limitations/issues?  I think it's a bit odd to make such a distinction,
> but that's just my opinion I won't block on it.

Yes. The wa_oob.rules file matches what's in the WA database, so I 
didn't want to add anything there that wasn't reflected in the database.

>
> Regardless of if we decide to keep this implementation or merge the check into
> xe_wa_oob.rules:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Thanks! I'm going to do a respin of this to not apply the flag to the 
media GT, will cc you on it.

Daniele

> By the way, this patch was also separately reviewed by Jesus Narvaez, so
> don't forget to add their RB in as well.
> -Jonathan Cavitt
>
>>   		flags |= GUC_WA_DUAL_QUEUE;
>>   
>>   	/*
>> -- 
>> 2.43.0
>>
>>

