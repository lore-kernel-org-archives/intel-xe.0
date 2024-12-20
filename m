Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3400E77184
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 00:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A031110E0B6;
	Fri, 20 Dec 2024 00:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ju3KaPZ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1481C10E0B6
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 00:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734653996; x=1766189996;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lDyMUNzpu8/+TeKXlb8ypG6t/WP2cddPT0FlKj8S/d8=;
 b=Ju3KaPZ4gHg4+/nR9nz116Z/R9drC1UUCTiGIfvkcqc5mBpVi/Xb4Nrh
 u416Au4YohiQh5ysRoeJpn2VLXcw2c/cRkyT1KrxL8/azeFneKdX1zvfV
 2MCJm3vuiIbQHSzwlQ2KzgMdVUCiTeTnGWUX2nmmOUMmUCHHuQTWcBXSt
 xCn9dgS/8tNe7i74lQ9LkHD6j7vRgiCmoW+0Sms0sPj8qRdpok1ihIt61
 Cipj8i/lZ7mfQQlYzCV8Cvbo1A9aPD7VZcd7c1nJG3cqSUK4a8vyTltyX
 NiRssrak1jM69tuIgwH3yef7D8ZFlDJhkfVlza7oAsy4zvx+eOA5iqviu w==;
X-CSE-ConnectionGUID: gz7RL1t8TEqDfh3WhtXSxw==
X-CSE-MsgGUID: uCNjnUGNRrqOz09LNsnFag==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34913449"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="34913449"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 16:19:55 -0800
X-CSE-ConnectionGUID: LjUOFy/bRJS+qr2ynu7D1A==
X-CSE-MsgGUID: W3ExNrkaQSS6IeVrFBawEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98187103"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 16:19:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 16:19:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 16:19:54 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 16:19:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcdZoGKhzeT5uw2VAm2J8D6DtO1tHO/BQVOniJLSsf6IB+WfzBAYsE7OEMrfTxiYpvABrmm+sVVKM5IpKAmLwKnrVpxiroJ/IOfAl9QaIT7oqfrT5EQty6kQ5D2N7Y0BeelWkNVQ+MmitEh93Eij0nWOCoqlPQLp+e948fYJpuRfQK+5KrYMHsLrIXb8qyDfGhkstL9cAoWbUtvLQnRoc+GMIusbElpyeRnhE26+zKo0wg6ArZteSACee9hEAqBgIj0vaLhMcRMQ/Y+fbHbqYcAONuBhgzhCwAzGBSyTm/ZOoluV1somv/i704ubP5b0KiCiR89DXVFLtwviPgpuag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akfomxz7CYyvDw4CJUHYXHB9LzmGB1yeAINJIFAm6vQ=;
 b=wtQaX+JzWI27nVDJVcLQDZGGq8xt3ZfksnYYvIJ1lhUWVVPNbrxeNbYhByhFDsBTpNYOgqY3U2EXCG2es/d5vBADz45iEaVBRAIIcgosTuTDGvLiNIryslETMXm859KMsjO/LHr5sg9mgznjwGWm6juyIR+zOlfuER2sQEMdVS+nleFy2iuBPiiUOGW+2xToDr4DouZ2gvWXOk1WFaPNYtS4VM2jrGN7W+QY+wbuqYhBPPUm1VFlVE8nkhABHfuhy+Y0VUgxbon9ZHk8Lqs7mn33GgYBsb/fJZsRz25FZ+vCnxtCLFAPEG7R0Mvo3ZqnDs/Iaxl0YRsptELZrd4qRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA0PR11MB4669.namprd11.prod.outlook.com (2603:10b6:806:99::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 00:19:23 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 00:19:23 +0000
Date: Thu, 19 Dec 2024 16:19:21 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, <jose.souza@intel.com>
Subject: Re: [PATCH 1/2] xe/oa: Fix query mode of operation for OAR/OAC
Message-ID: <Z2S4CWQh3+ud4Ib/@orsosgc001>
References: <20241219002340.13230-1-umesh.nerlige.ramappa@intel.com>
 <20241219002340.13230-2-umesh.nerlige.ramappa@intel.com>
 <85msgr1cz2.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <85msgr1cz2.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0282.namprd03.prod.outlook.com
 (2603:10b6:303:b5::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA0PR11MB4669:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f9edee-678c-4e65-244b-08dd208bf487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkpUazNPYmQ1Z2E2S0VlV0ZiV0luY1FFaFg4R2JOZGNkV1d3dk9QWTdFOEto?=
 =?utf-8?B?SXpJeXZWWEljUFQrcVQ0dytob3krU3k3TmNHRlM4N2cvUmF2OFcwd1JEUEpv?=
 =?utf-8?B?V0NiWW90cjZOVVQzdUZ1YlNsLzJ4YkNUV1Z3YnI4bEpZdzUya2VEK0ZjQVZk?=
 =?utf-8?B?VXBUd2RZcE1UV0JYeFBOcjJRMG53TUxOWFVTd3lGRnFnMDdtTTZ1VDRRMVJM?=
 =?utf-8?B?UVVxQmQ0TTMxNFRReS81cDRWNWwramcxM2Zvd1IyM2N1dGU4ekM2eTFuZXdJ?=
 =?utf-8?B?TXV3dWorWW1CaEgzcGIzdkxiLzBlRjJ5QjV2TmsyY2ZCazlFYnNwcG5NcDhu?=
 =?utf-8?B?SWRVQXQ5bUlvUGxyalRzQjFxSHNneXY2Q0MzVmh4YmFtQjRoZnUyeTAvZEps?=
 =?utf-8?B?dEhNYWR4bUhGZjJNMTdqZDNOR0NYb1NrWVAwMGlPcWQ3UFhmQmd3NjVyUGtG?=
 =?utf-8?B?ZU1JVEgxYWx1WndyQ0pHVFZIM0E5bmxOdFFEZlFmUTRUTnNraEtNVHU2VUJr?=
 =?utf-8?B?ZXJselpoeExPUlBWTWhudTI2dmRiM1FrMWtSSFpaNnQ4S1N3VHA0YXVXdUdw?=
 =?utf-8?B?b0FJRlJxYlg2UUtlSFdwRENsUVlnV0dVWHlCdjBDK05PdVRNaHFTOHF5RXJC?=
 =?utf-8?B?Q2ZteXlkeEZLQ2FQZmF3SmJlMlU2RFZLZVNZOFdkenNCaFBrR1VDZFN1OFlD?=
 =?utf-8?B?UndkSFAwMTE4Nm1GRC9tRFZkQ2ZNZWNsTEIyQjhqaThueUdmV1liNm9hODVt?=
 =?utf-8?B?SXZrbGNBNlZiT2NyeUkwYU5ZMm13QU1rZXNMcGpUa2w2dlZxTlZ5RkF5RjAv?=
 =?utf-8?B?RTBpbmFVK0R0bjJGSGtmaVdNNkNoTzQ4QWwxWmV1Y2tYQWoxZmErL2E2M2k1?=
 =?utf-8?B?c3pnUUI3SUN5U0R3MjM0NHBMQzlDcVlTbk5sK3p6SjF4dWdsQ1RDbnRJajFM?=
 =?utf-8?B?OFlaV1A2b0k4WmdXbnhTajdEdVY4WFRuQm1BV21sQ25JRTRySVpmL2c1eDZz?=
 =?utf-8?B?ZUlWcS9wMU1PbFk0aUZlaUlWOUJkS0FCNjFtZ1BOOFBrSEFuK2hGZkl0T3Bi?=
 =?utf-8?B?QXdkU1BHeitLc21keHBsaElHNVpaK0Y0S0Z4WW4wc1hoQU93ZWorTnB5d05L?=
 =?utf-8?B?bXpnYUphOE0xeEhTS3JNRFBpTVEvRVI3cmRvU0RJdklrelRHdGk0cVZ4emRv?=
 =?utf-8?B?aEx5SE5GZWdqbGlPeFpzaTBxczdBSkFqbVVIVmJ4TjNhb0VxREVLYWVmM2FB?=
 =?utf-8?B?RUFpWmFkbjRFY2piUzZGamdZcjJVNXRTT2Q5d3JhWXBTK3k3aTBhbDkrVU9L?=
 =?utf-8?B?MGtTUnVaUjQycGxISzI1VFNBd2J4ZWQzWmdHeVh0SDRkNzJrdnhTaWI1UGov?=
 =?utf-8?B?MU9iTU1qM2Q5SEtHekRzNGRxTnBnaWlDckJLQVo0c0hldGEvSTBNaDVXck5y?=
 =?utf-8?B?bG54alBOMDVheTgwZVhQTSt5ZXBXZDNSMkFvMXg0RVRRYS8rSVdYSGk4cmFy?=
 =?utf-8?B?TDNXT1Z3T2F1QnpTMENnaTVOYUp4dklaNE51WmZ3TzNlTDFTeVNsQ3ZkQ3pT?=
 =?utf-8?B?eDlEWWh0TE90RTZtVm1tMnFkVHV0ZFprN2FqVE40TG0xOS9jc1IwK2tPMDcy?=
 =?utf-8?B?K2htcUZUTTZBcGdaR25jOHNYbVd5SjRFdjl6Z0FhWWxGZ0IxWnp0eFdhSE5t?=
 =?utf-8?B?dkZuKzBrMWxGYUhVUVp1Vjc4eXZEa3NIckR5ZWpzMkY5NVJ4TEYzNmw4d1pt?=
 =?utf-8?B?VVFYU0NZR1NCZWw1R0pITmFPODdCcS9rM2VpTEh6SnJrN2dNRHgwZFRhdU5D?=
 =?utf-8?B?K0hLcWdCcXRTR0dmdlIyazNPcDVlcmpZbEJ2bGxGdS9sdlNDbGFvc2lYbHA0?=
 =?utf-8?Q?TkmBRSGweU2xB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlduZkNYN3h1MmY0YVNBY1dBY21yQXcxdmFGVmZiY3p6THVuOVhWUFRLbTZH?=
 =?utf-8?B?a015WVp3UWJiSzBnRGtIMDZSUEc1cEpWZVlQQi81clNCclkxUERza0JXck9o?=
 =?utf-8?B?ZXdzRVZsTFZkS2RPOEpTUjRoZDlJTDJ2OVVRVUsrOHJib0RWUnNYYndxaWRU?=
 =?utf-8?B?bVBrNXpnZGt2R0hUM2pEZUJ1Sk1mSnhhaWwwR00wcjJCbzBIcStDbnJabTFz?=
 =?utf-8?B?aGhUTXNNQjBPZUV6NnE0MXlQZldqOUpmdHZ6ZDZUL0oxQzVLM0JseW16d2Ja?=
 =?utf-8?B?M09Qb2VYMVpIQ2p0ckxFcjdHd29rUHRHNFpxalZXR1lJSXhPY1drUFA4RnpL?=
 =?utf-8?B?aG1FRGNtUk5TWTdIcTE2dVR5Q2ZUd0FZUld0N2QwVnU1UytsdS9qQlBnc3hj?=
 =?utf-8?B?Mytuc1pUR0xjNms4WVZ3bnlpRmNLekZ3eWROTEQvclZxOFBxWkVnTG5wMkpj?=
 =?utf-8?B?V2hCL0s2dUJLZVdObGNjZngxWitiQkpvbkZjOTdFbWwySXpNZVR4Qk1McWs4?=
 =?utf-8?B?V29pTnZvUi9mRkp4N0NSMDlEYVY3aXQyc1hwV0tmN21hU29MdmdtS2tTZzNP?=
 =?utf-8?B?TFVQNnlOMWNteWhNU2UydFNEbEcxazE3TnJGcmorZmNyTU5NdlRhUTlHUjQw?=
 =?utf-8?B?UFZYNWtzQXNHVFgwUmdLbFpLRm9jNEpldksrMWs2WFZyTTRVcm5BSFE1UWxD?=
 =?utf-8?B?cllRUDFONC9PRmQwcjVtSGpya0hzOEREdjQwMFpWNlJHbnBQY1A1alNjY21X?=
 =?utf-8?B?Tk54cS9JdHZ3TlVhREEwODNCNjRza3VYOHJHMmRnSWdyZEpLVTk5Z3FKWitW?=
 =?utf-8?B?cVZIc2dRYzFOUkwzMmFWMVV2RlNCalRFb3lCL2lNbXd5VmlmTG03ZGljazB2?=
 =?utf-8?B?NzE3ZzRYM25YNkhNMFVkcGQ4bUxtYkg2ZEhpQzJBQ1RtWDFIWXREaXROUFN3?=
 =?utf-8?B?NGZTQnlndmJMdUR5ODMwTUt6N3l2akhrcWxMeCtsSXlMNTExRWN1MTBXdE5N?=
 =?utf-8?B?NUVjT0tjalBkS01HRE5jczRrWXl1bWdFMjZoWWdlS2JjbUlBdzdNd01tSDNI?=
 =?utf-8?B?SEdlZngyd2hIRFNzNWV4UmtXaXhIeGYrQTZIMXVINThoMmVyam12eHBKVTVV?=
 =?utf-8?B?N0lsdXpxNlo2d09MVEJ5azgydHhnNEUvS0c2RjVhRk9aZW4wUFViUUdqWHlN?=
 =?utf-8?B?T1o0QlRpVUFoUldtdjVjZXdKU2xiUTBab1dpMFFGOVZXakloRXhZcmx6bERJ?=
 =?utf-8?B?YW9PSmxiSHpZbzJWVUNJVkpYUE5EdjhoaDJLaHdkSXdpczFPd2xOSkxxK0l0?=
 =?utf-8?B?RlJYSjhZTnJ0dzlteGo4S01IbVpYblAxTUhRQTljeUZnUmtHZEI2Qi9DWng5?=
 =?utf-8?B?VUJTRWVTWlZFQ2NWUlZGY3RjcDd1anRoam1GeVYrREQ1T0s1V284Vi9pa3Rw?=
 =?utf-8?B?dWorR0hCdk9odXNuR2ZWVWZKMUY2bnpKTXU2L1ZzZk9UWmhHZzhpSmZ4SDYz?=
 =?utf-8?B?NGZhUE90Qkw5Y25vTStQUTlNemYwT0RtMm1ZMG9mV09LTW5KRi9PTVY3N1FH?=
 =?utf-8?B?K3FXN0tvRFRpS0hiODA3eU9ySXNFdUhNWkhiNUJrSFZ3ZUxXVkh0RXdQK3BT?=
 =?utf-8?B?bEc2VXBrenFobUlDdTJuNGpucGJKRFNaN2h5aGZkVkppSmhBN3JOOGdwRnRJ?=
 =?utf-8?B?c25DUEY0bkZHNFEwa0d3WUs5MzB1aTdWUHhJMTNremJlMmgwb1MyY2hrM21T?=
 =?utf-8?B?SUd4eC9VaVpYUlNEWTJGdmVxck5kb0xLb0pzSDROZ0RWaUxaM3lRbDNFQm10?=
 =?utf-8?B?cmcrVHd5cVY1WXRrVUx2QVhNNFJIY3JyQmNjYXo2anFGMklvVVZZNGs0NzhU?=
 =?utf-8?B?UGtvZVIrTFZib1B3UlJOV1ZOdXM3NHBUOW0yUEFyV2N2Zk5hZnljVU83czFm?=
 =?utf-8?B?WHA1N1pJZU93Z0dLMlE1ZjNRTmNMd2lsNnhETytHSnpIZGl4R1RVYnZvTk9q?=
 =?utf-8?B?RXhnTUlrdXpWQ2hSLzRvbENXRXJ4WmZaNjlDVkNnQTE0YURZZzdGQzBBWG9w?=
 =?utf-8?B?amMySFVHbXUrSTg3TzA1UHgyeXRSVXFLeUo5RXZxbFM3TEtsUDNLVlc1M3U4?=
 =?utf-8?B?c3VaVlkyaFpaL1RWaG5lUTV2bXlndmVGbU8xV213Q0VrWUphaFNwdmUxV2V2?=
 =?utf-8?Q?D+t4o+pOfKYSbrJGRXd05EY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f9edee-678c-4e65-244b-08dd208bf487
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 00:19:23.3361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWcXzZxO2C6/I6VofGfP/mrhv6419P+shpUhk5n7XO4ivzh31yuddtD57mbCxxksPKixLr1yox++fth9Vsa56VQNVMgdrmg1HgOxxKlnfHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4669
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

On Thu, Dec 19, 2024 at 03:15:29PM -0800, Dixit, Ashutosh wrote:
>On Wed, 18 Dec 2024 16:23:39 -0800, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>> This is a set of squashed commits to facilitate smooth applying to
>> stable. Each commit message is retained for reference.
>>
>> 1) Allow a GGTT mapped batch to be submitted to user exec queue
>>
>> For a OA use case, one of the HW registers needs to be modified by
>> submitting an MI_LOAD_REGISTER_IMM command to the users exec queue, so
>> that the register is modified in the user's hardware context. In order
>> to do this a batch that is mapped in GGTT, needs to be submitted to the
>> user exec queue. Since all user submissions use q->vm and hence PPGTT,
>> add some plumbing to enable submission of batches mapped in GGTT.
>>
>> v2: ggtt is zero-initialized, so no need to set it false (Matt Brost)
>>
>> 2) xe/oa: Use MI_LOAD_REGISTER_IMMEDIATE to enable OAR/OAC
>>
>> To enable OAR/OAC, a bit in RING_CONTEXT_CONTROL needs to be set.
>> Setting this bit cause the context image size to change and if not done
>> correct, can cause undesired hangs.
>>
>> Current code uses a separate exec_queue to modify this bit and is
>> error-prone. As per HW recommendation, submit MI_LOAD_REGISTER_IMM to
>> the target hardware context to modify the relevant bit.
>>
>> In v2 version, an attempt to submit everything to the user-queue was
>> made, but it failed the unprivileged-single-ctx-counters test. It
>> appears that the OACTXCONTROL must be modified from a remote context.
>>
>> In v3 version, all context specific register configurations were moved
>> to use LOAD_REGISTER_IMMEDIATE and that seems to work well. This is a
>> cleaner way, since we can now submit all configuration to user
>> exec_queue and the fence handling is simplified.
>>
>> v2:
>> (Matt)
>> - set job->ggtt to true if create job is successful
>> - unlock vm on job error
>>
>> (Ashutosh)
>> - don't wait on job submission
>> - use kernel exec queue where possible
>>
>> v3:
>> (Ashutosh)
>> - Fix checkpatch issues
>> - Remove extra spaces/new-lines
>> - Add Fixes: and Cc: tags
>> - Reset context control bit when OA stream is closed
>> - Submit all config via MI_LOAD_REGISTER_IMMEDIATE
>>
>> (Umesh)
>> - Update commit message for v3 experiment
>> - Squash patches for easier port to stable
>
>Strictly not needed, all patches can just have a Fixes and Cc:stable and
>they should get applied correctly. Anyway, I have no problems reviewing as
>is.

I had done that in the past and Rodrigo had suggested to squash 
dependent patches if they are fixing one thing, so not sure if I 
misunderstood that. Will leave it as it for now.

Thanks,
Umesh
>
>But this series is a really nice cleanup :)
>
>>
>> Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close")
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com> # commit 1
>> Cc: stable@vger.kernel.org
>> ---
>>  drivers/gpu/drm/xe/xe_oa.c              | 137 ++++++++----------------
>>  drivers/gpu/drm/xe/xe_ring_ops.c        |   5 +-
>>  drivers/gpu/drm/xe/xe_sched_job_types.h |   2 +
>>  3 files changed, 53 insertions(+), 91 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index ae94490b0eac..86dd8fe0b6a5 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>> @@ -74,12 +74,6 @@ struct xe_oa_config {
>>	struct rcu_head rcu;
>>  };
>>
>> -struct flex {
>> -	struct xe_reg reg;
>> -	u32 offset;
>> -	u32 value;
>> -};
>> -
>>  struct xe_oa_open_param {
>>	struct xe_file *xef;
>>	u32 oa_unit_id;
>> @@ -605,19 +599,39 @@ static __poll_t xe_oa_poll(struct file *file, poll_table *wait)
>>	return ret;
>>  }
>>
>> -static struct dma_fence *xe_oa_submit_bb(struct xe_oa_stream *stream, enum xe_oa_submit_deps deps,
>> +static void xe_oa_lock_vma(struct xe_exec_queue *q)
>> +{
>> +	if (q->vm) {
>> +		down_read(&q->vm->lock);
>> +		xe_vm_lock(q->vm, false);
>> +	}
>> +}
>> +
>> +static void xe_oa_unlock_vma(struct xe_exec_queue *q)
>> +{
>> +	if (q->vm) {
>> +		xe_vm_unlock(q->vm);
>> +		up_read(&q->vm->lock);
>> +	}
>> +}
>> +
>> +static struct dma_fence *xe_oa_submit_bb(struct xe_oa_stream *stream,
>> +					 struct xe_exec_queue *q,
>
>The new q argument is now strictly not needed. We can just do:
>
>	struct xe_exec_queue *q = stream->exec_q ?: stream->k_exec_q;
>
>here, since all batches are sent to a single exec_q.
>
>> +					 enum xe_oa_submit_deps deps,
>>					 struct xe_bb *bb)
>>  {
>>	struct xe_sched_job *job;
>>	struct dma_fence *fence;
>>	int err = 0;
>>
>> -	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec_q */
>> -	job = xe_bb_create_job(stream->k_exec_q, bb);
>> +	xe_oa_lock_vma(q);
>> +
>> +	job = xe_bb_create_job(q, bb);
>
>There is a issue here, which is:
>
>	struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
>					      struct xe_bb *bb)
>	{
>		...
>		xe_gt_assert(q->gt, q->width == 1);
>
>So xe_bb_create_job is used to create kernel jobs using kernel exec_q's,
>all of which have width 1. This may not be true for user exec_q's.
>
>The assert is needed because xe_bb_create_job() passes only a single
>batch_addr to xe_sched_job_create(). If userspace passes in a queue with
>width > 1, from xe_sched_job_create() it looks like bad things could happen
>(not just the assert/warn).
>
>So for this, I think we should do this:
>
>@@ -1981,8 +1981,8 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
> 		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
> 			return -ENOENT;
>
>-		if (param.exec_q->width > 1)
>-			drm_dbg(&oa->xe->drm, "exec_q->width > 1, programming only exec_q->lrc[0]\n");
>+		if (XE_IOCTL_DBG(oa->xe, param.exec_q->width > 1)
>+			return -EOPNOTSUPP;
>
>Basically earlier we were just doing a drm_dbg, but now let's just make
>'q->width == 1' a hard requirement. We can revisit this if indeed we need
>to support q->width > 1.
>
>>	if (IS_ERR(job)) {
>>		err = PTR_ERR(job);
>>		goto exit;
>>	}
>> +	job->ggtt = true;
>>
>>	if (deps == XE_OA_SUBMIT_ADD_DEPS) {
>>		for (int i = 0; i < stream->num_syncs && !err; i++)
>> @@ -632,10 +646,13 @@ static struct dma_fence *xe_oa_submit_bb(struct xe_oa_stream *stream, enum xe_oa
>>	fence = dma_fence_get(&job->drm.s_fence->finished);
>>	xe_sched_job_push(job);
>>
>> +	xe_oa_unlock_vma(q);
>> +
>>	return fence;
>>  err_put_job:
>>	xe_sched_job_put(job);
>>  exit:
>> +	xe_oa_unlock_vma(q);
>>	return ERR_PTR(err);
>>  }
>>
>> @@ -684,67 +701,22 @@ static void xe_oa_free_configs(struct xe_oa_stream *stream)
>>	dma_fence_put(stream->last_fence);
>>  }
>>
>> -static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
>> -			     struct xe_bb *bb, const struct flex *flex, u32 count)
>> -{
>> -	u32 offset = xe_bo_ggtt_addr(lrc->bo);
>> -
>> -	do {
>> -		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_GGTT |
>> -				    MI_FORCE_WRITE_COMPLETION_CHECK |
>> -				    MI_SDI_NUM_DW(1);
>> -		bb->cs[bb->len++] = offset + flex->offset * sizeof(u32);
>> -		bb->cs[bb->len++] = 0;
>> -		bb->cs[bb->len++] = flex->value;
>> -
>> -	} while (flex++, --count);
>> -}
>> -
>> -static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lrc,
>> -				  const struct flex *flex, u32 count)
>> -{
>> -	struct dma_fence *fence;
>> -	struct xe_bb *bb;
>> -	int err;
>> -
>> -	bb = xe_bb_new(stream->gt, 4 * count, false);
>> -	if (IS_ERR(bb)) {
>> -		err = PTR_ERR(bb);
>> -		goto exit;
>> -	}
>> -
>> -	xe_oa_store_flex(stream, lrc, bb, flex, count);
>> -
>> -	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_NO_DEPS, bb);
>> -	if (IS_ERR(fence)) {
>> -		err = PTR_ERR(fence);
>> -		goto free_bb;
>> -	}
>> -	xe_bb_free(bb, fence);
>> -	dma_fence_put(fence);
>> -
>> -	return 0;
>> -free_bb:
>> -	xe_bb_free(bb, NULL);
>> -exit:
>> -	return err;
>> -}
>> -
>> -static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri)
>> +static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri, u32 count)
>>  {
>> +	struct xe_exec_queue *q = stream->exec_q;
>>	struct dma_fence *fence;
>>	struct xe_bb *bb;
>>	int err;
>>
>> -	bb = xe_bb_new(stream->gt, 3, false);
>> +	bb = xe_bb_new(stream->gt, 2 * count + 1, false);
>>	if (IS_ERR(bb)) {
>>		err = PTR_ERR(bb);
>>		goto exit;
>>	}
>>
>> -	write_cs_mi_lri(bb, reg_lri, 1);
>> +	write_cs_mi_lri(bb, reg_lri, count);
>>
>> -	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_NO_DEPS, bb);
>> +	fence = xe_oa_submit_bb(stream, q, XE_OA_SUBMIT_ADD_DEPS, bb);
>>	if (IS_ERR(fence)) {
>>		err = PTR_ERR(fence);
>>		goto free_bb;
>> @@ -762,71 +734,55 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
>>  static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
>>  {
>>	const struct xe_oa_format *format = stream->oa_buffer.format;
>> -	struct xe_lrc *lrc = stream->exec_q->lrc[0];
>> -	u32 regs_offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
>>	u32 oacontrol = __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_MASK) |
>>		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
>>
>> -	struct flex regs_context[] = {
>> +	struct xe_oa_reg reg_lri[] = {
>>		{
>>			OACTXCONTROL(stream->hwe->mmio_base),
>> -			stream->oa->ctx_oactxctrl_offset[stream->hwe->class] + 1,
>>			enable ? OA_COUNTER_RESUME : 0,
>>		},
>> +		{
>> +			OAR_OACONTROL,
>> +			oacontrol,
>> +		},
>>		{
>>			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
>> -			regs_offset + CTX_CONTEXT_CONTROL,
>> -			_MASKED_BIT_ENABLE(CTX_CTRL_OAC_CONTEXT_ENABLE),
>> +			_MASKED_BIT_ENABLE(enable ? CTX_CTRL_OAC_CONTEXT_ENABLE : 0),
>
>Hmm this does not work because when enable is 0, we are setting bit 0
>rather than resetting bit 8 :)
>
>We need to go back to using _MASKED_FIELD which was changed in 0c8650b09a36
>("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close") or do
>something else.
>
>>		},
>>	};
>> -	struct xe_oa_reg reg_lri = { OAR_OACONTROL, oacontrol };
>> -	int err;
>> -
>> -	/* Modify stream hwe context image with regs_context */
>> -	err = xe_oa_modify_ctx_image(stream, stream->exec_q->lrc[0],
>> -				     regs_context, ARRAY_SIZE(regs_context));
>> -	if (err)
>> -		return err;
>>
>>	/* Apply reg_lri using LRI */
>> -	return xe_oa_load_with_lri(stream, &reg_lri);
>> +	return xe_oa_load_with_lri(stream, reg_lri, ARRAY_SIZE(reg_lri));
>>  }
>>
>>  static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
>>  {
>>	const struct xe_oa_format *format = stream->oa_buffer.format;
>> -	struct xe_lrc *lrc = stream->exec_q->lrc[0];
>> -	u32 regs_offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
>>	u32 oacontrol = __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_MASK) |
>>		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
>> -	struct flex regs_context[] = {
>> +	struct xe_oa_reg reg_lri[] = {
>>		{
>>			OACTXCONTROL(stream->hwe->mmio_base),
>> -			stream->oa->ctx_oactxctrl_offset[stream->hwe->class] + 1,
>>			enable ? OA_COUNTER_RESUME : 0,
>>		},
>> +		{
>> +			OAC_OACONTROL,
>> +			oacontrol
>> +		},
>>		{
>>			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
>> -			regs_offset + CTX_CONTEXT_CONTROL,
>> -			_MASKED_BIT_ENABLE(CTX_CTRL_OAC_CONTEXT_ENABLE) |
>> +			_MASKED_BIT_ENABLE(enable ? CTX_CTRL_OAC_CONTEXT_ENABLE : 0) |
>
>Same comment here as for OAR above.
>
>Thanks.
>--
>Ashutosh
>
>
>>			_MASKED_FIELD(CTX_CTRL_RUN_ALONE, enable ? CTX_CTRL_RUN_ALONE : 0),
>>		},
>>	};
>> -	struct xe_oa_reg reg_lri = { OAC_OACONTROL, oacontrol };
>> -	int err;
>>
>>	/* Set ccs select to enable programming of OAC_OACONTROL */
>>	xe_mmio_write32(&stream->gt->mmio, __oa_regs(stream)->oa_ctrl,
>>			__oa_ccs_select(stream));
>>
>> -	/* Modify stream hwe context image with regs_context */
>> -	err = xe_oa_modify_ctx_image(stream, stream->exec_q->lrc[0],
>> -				     regs_context, ARRAY_SIZE(regs_context));
>> -	if (err)
>> -		return err;
>> -
>>	/* Apply reg_lri using LRI */
>> -	return xe_oa_load_with_lri(stream, &reg_lri);
>> +	return xe_oa_load_with_lri(stream, reg_lri, ARRAY_SIZE(reg_lri));
>>  }
>>
>>  static int xe_oa_configure_oa_context(struct xe_oa_stream *stream, bool enable)
>> @@ -1023,6 +979,7 @@ static const struct dma_fence_ops xe_oa_fence_ops = {
>>  static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config *config)
>>  {
>>  #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
>> +	struct xe_exec_queue *q = stream->exec_q ?: stream->k_exec_q;
>>	struct xe_oa_config_bo *oa_bo;
>>	struct xe_oa_fence *ofence;
>>	int i, err, num_signal = 0;
>> @@ -1041,7 +998,7 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
>>	}
>>
>>	/* Emit OA configuration batch */
>> -	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_ADD_DEPS, oa_bo->bb);
>> +	fence = xe_oa_submit_bb(stream, q, XE_OA_SUBMIT_ADD_DEPS, oa_bo->bb);
>>	if (IS_ERR(fence)) {
>>		err = PTR_ERR(fence);
>>		goto exit;
>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>> index 3a75a08b6be9..c8ab37fa0d19 100644
>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>> @@ -223,7 +223,10 @@ static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
>>
>>  static u32 get_ppgtt_flag(struct xe_sched_job *job)
>>  {
>> -	return job->q->vm ? BIT(8) : 0;
>> +	if (job->q->vm && !job->ggtt)
>> +		return BIT(8);
>> +
>> +	return 0;
>>  }
>>
>>  static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
>> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
>> index f13f333f00be..d942b20a9f29 100644
>> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
>> @@ -56,6 +56,8 @@ struct xe_sched_job {
>>	u32 migrate_flush_flags;
>>	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
>>	bool ring_ops_flush_tlb;
>> +	/** @ggtt: mapped in ggtt. */
>> +	bool ggtt;
>>	/** @ptrs: per instance pointers. */
>>	struct xe_job_ptrs ptrs[];
>>  };
>> --
>> 2.34.1
>>
