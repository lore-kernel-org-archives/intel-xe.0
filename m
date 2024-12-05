Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878C2E7716E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 23:14:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E46610EFD5;
	Thu,  5 Dec 2024 23:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CqXITrGt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E6710EFD5
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 23:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733440453; x=1764976453;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tbnl0YHdCkrnDffdHbhYW0TcXOxmv9q9MPS5uymxYy8=;
 b=CqXITrGtWnWKCbhhZjwv6vyzgnm33+KekVTHVU723qZGD3S6Tg26moFF
 j6d8JaVDSH3bFjIA1LEBhVfe833e9Fz65wAhDCPF2ghmn/34/rHIlt3Hw
 GUj1g7klmnqbwVEW8wqS3stQdHsaLN8Ds5KI+cmaqBlC3Wj9U1mMooriW
 fPZIwyZ1DyXSrlGCbOHjAc+0iK9UFfgLrGFP7Yoa00pO0+A60Ef4o44ER
 yz9jXVR2wFYua18XHTyTWVcTiCMc0Dia+GHrO8cvUcDkzujQng/7kWKq9
 r0yjoooiBLDl3PK3abg8YqRebA7eeN0T7fc2bMuliH+x7QamYR/6nKjCV g==;
X-CSE-ConnectionGUID: kLjSYaeiTXOtKwuE/aRROA==
X-CSE-MsgGUID: +1NvmhTlQJyh7VFbDj+IxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="51197757"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="51197757"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 15:14:13 -0800
X-CSE-ConnectionGUID: bMhJeLXCSb+KDPLAiZvUMw==
X-CSE-MsgGUID: Cvil6TpFQ0W+Ft1S6IHoJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="94101645"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 15:14:12 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 15:14:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 15:14:11 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 15:14:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYNDcty7/DNEfMphcvLdpv/+bgqPzXJ2tD89U+Q2uBmE2bilHRrxu6xBoQ12lzhuyYAXyYn2nC3EEcE1EjV2bBlvOEkwOkZQNCTyRWLer+1ESSucofE3ByLvKrWUtO8kIN4CAWnZCAXp+y3h+uEIFzV1pBIbGGSLur2G06Z7dVoeVxt9q/UZ7ws6VtZxzuMUz67Sq0494HEKlRXz6D75g/wKJ7Du/sID8zM/ld1Qlq6cpV0yPFmWfrxn+/vYhC7tQoPFCfx9QRZiTvBhIJi+AsHvwBoxJEWine//NkuUgl25UHSgkUJQ4XBBrKDbvdWWrxmef5UY5OH3JCRGJWhwAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYpl5Rc/NER51z8DF7SDYluXaeF8TVFcEZyaXrl3YO0=;
 b=mB5N5vLVC04vBG9VJDjjf4I6hrTO66xrYBcb9QoC47EILf9D+rIXQO4l0fMS9joNiF/jf6MeRI3hQzhYp+aIfq/xqM5CDV4onxd9FMenOqGwZ2JeW4FPvCETXcjvCHs3haHKAV2fNTF40V0WvP2z/C2fW8JrtY8Ht0T/9OISw7xHPVy8pSVrCjAtMzlwl7NLBRJZhvwxYrInMaKpLBWW0htMDSnf3BRKhz7LqV4wj/t30JRnc8zmYW+usWwzCAa5FbZuCaZsvic9o/76edyr8BZkKDKh97dE5C/Kor957/SAWZvd8J/Dgs91PcKnUiqPPrT0jklgVsshpYCvouxiSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA1PR11MB8491.namprd11.prod.outlook.com (2603:10b6:806:3ac::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Thu, 5 Dec
 2024 23:14:08 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 23:14:08 +0000
Message-ID: <6d2c1813-d602-4509-9e7c-3de3f6f2d085@intel.com>
Date: Thu, 5 Dec 2024 15:14:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/xe: Apply whitelist to engine save-restore
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, <ashutosh.dixit@intel.com>
References: <20241205182240.3463027-1-lucas.demarchi@intel.com>
 <20241205182240.3463027-6-lucas.demarchi@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241205182240.3463027-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:303:16d::27) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA1PR11MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 88214404-e8fa-4d8f-e33c-08dd15828545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEpoQXJiT2Zhbk00Y29RRTlXdmY0dlhhWDhiblJteWFzU053YmNxenZmelZX?=
 =?utf-8?B?UGExd2JzS0x1T0l2bFJ4NGNMazA4Y05SL01YMjZxNmIxcVg0aGp6a3d3dnlF?=
 =?utf-8?B?SmVEM3MyVHVJMWswa2NxU3MwbDdNN2Y1M1Q5OEhqb2ZnOVp1bmRWYktMQzJo?=
 =?utf-8?B?L2JPV1FuUHFQRG9hUEpkUU1sU1E1amZSejRidDEwUHVKQmVCa0lHVW5qeWxz?=
 =?utf-8?B?dk1IUW9KL1pFaUZlZVV1cmZVdGt2NmtOYmRrdE43RkdjWmN0YmhhblRUKzIr?=
 =?utf-8?B?Y1A5OEpOZDlJSVZhRmd0RkVIVldjbkJFNURkMHZHa1dPVDRWam1IQnR1L2RN?=
 =?utf-8?B?NkJvRkJoSkNiMVN4OE40N1Q3b1ZMRjRIcWlGMkNVVFREbkgxRFFuNTNJNFhY?=
 =?utf-8?B?R2xWQjEvdVczMDdSSnBra1ZBcjJlVUEwdndLOXJCS2xMNitXN2xkSEJDVUZk?=
 =?utf-8?B?ZG82SCs5T3ZVeTFOVHJnUGYxRHh2eUd5ME4xUmxDSHdWcFNWZFdma0RVa0Q2?=
 =?utf-8?B?bXNHZ1FBaHUrc2l5ajFQNFhIV3haMFlZT3pWUFZxcXc1NDQvWGUrRUZ5MTk4?=
 =?utf-8?B?dGNXYlYyKzJlWFNLQTN6U2xLYjI3OVppYjBQbGNHK3FJa1BmWDJCK3NubCtq?=
 =?utf-8?B?cU45dEpyMnBzUkc0ejZ4Sy9LcnBISHRkZXVuNk1PbWxnbkpCbWN0RGRxRS9k?=
 =?utf-8?B?cnVIQzVWanQvTkNWQ2pOaC94elkzNllNZTZSTTF2T3JFNUdQbHVQRXVGMkVK?=
 =?utf-8?B?TnVwbmtDeWpVQVUwbStGVFVsQko1UjNWZEhWbXpmV1d1VXQ5VnBHd3RqMXIv?=
 =?utf-8?B?THFNakpqc1JkOXd4cU5NaVJPYnpIN3UyUnNycTUyWEkxNTY3YndBUGx2dTJl?=
 =?utf-8?B?U1lJSlVBTk84RDU2MEwrRFFNNUtTRm5GTTZBVytLK3BOeFJxWUVTVmlTd1Jw?=
 =?utf-8?B?SDNTVHRxbENsYzdZSEFETm9pNGU1eWQwRWFHUitWZWtDUEJrYmhhRDh5aXZR?=
 =?utf-8?B?VXVENTRxeFhKL1FqamswS3RIL2NxUGdNTzhGSW1rVDdvT1VDckVpN1krb3ll?=
 =?utf-8?B?MlllMktiUU1FdnhHeDBUNFFFdmY0aTI0YVBKOU5HMU1nVmZtNWVDSVlKb241?=
 =?utf-8?B?RlVCT09yY1BldFVaYXB4N0xsTGhxL3lKMmhXVEVkQ21xS0YvNzNXVklkelR0?=
 =?utf-8?B?SWxjbFpjRDNiZEVEc1BmbWF5MmVnejdhMUVVWnB2S0VONnJpR0RNQWxsTUtq?=
 =?utf-8?B?U2xtVERTNlZESCtEUzRPQnhhcW1yUXJZc0NDbVQxN1RsWUp4S3BuNGlXT1Jl?=
 =?utf-8?B?cFBYU052SHVTdlZma2JTZUMrUjVaQ2g0UlRwRkVPc2hzYkNycHhqMmlXeWJW?=
 =?utf-8?B?MUk4b2hJNzVMaDZueHUzRUtDMjV6aHJmb2U5UmlhalpxdVROOFBLVFViUzBZ?=
 =?utf-8?B?V1QwVll0WlE3K2tuYk80R1d2MGVjdUx5QzJ3Zk5mbUdVckgxWjZ0WUE3cnBI?=
 =?utf-8?B?dDZTVEs3VXpJZFlHQXFycVZTdm5tRzB3TGQ4RDl4KzFvMDJDaEZHQWdkbXAw?=
 =?utf-8?B?SkZwUzhwK0hSTzV1OUFwMU5MNlFiZ1JOTG9vVkl3eGpMbk5pZllUSXM3Wlk5?=
 =?utf-8?B?QUZuZkRRcTVKUWtLRUpVTUhhS3FvNm9SSGdOT0IrbXN2VlYyTDUwRGN3UFdF?=
 =?utf-8?B?NUp5UzBIMmtFbzFvK1RaWCtCb1ZUZ2NFWEgrcmRrajJzVEdSbnhhWUtaV3li?=
 =?utf-8?B?QUxkcmhOK3Y5Rkt4SWlxc0dXaGtVcWFaNEozUkJ4aEt6WVh2RHQxWVhNSVg5?=
 =?utf-8?B?TlQ0Z2YrL3lYTllOTGd4UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGY4K2QyZVFoSkYwWGkvVXJueDBpUmJZT3IwN2s0dWNwNkN1aEdtM3FhOW9J?=
 =?utf-8?B?NVErSGNGRUFBMHhmNDJMamJTWHh6Zk5PdUo1MFBteFNDbzcrWGpWUTVUWjR2?=
 =?utf-8?B?MnJyUkF6MW5jeUpLZm5KLy9TMTc0a05HR0I0VHRqMzhzemNOd01wR3dtbmtx?=
 =?utf-8?B?a0FDYzhpVHdQSkU1VjhjbThPY2VHVDhIS1B5WFhjdUE5MGM4elhMNHpFRVZo?=
 =?utf-8?B?cmM2M3E5c0hGYm1OQ2d2ZTZDaUFYVjVVc01ZNkIzL1YraDRIYWJvY0dJaHlr?=
 =?utf-8?B?clV0VjNrWFZlY1VodVZaUTNaaUJzUWhVR3Zab3ROaUhqd0ZkcDlTZ2ZlMXkr?=
 =?utf-8?B?SmpXaHlJRVRidHN4TFZvMUVsMk9lcCsyOS9kMDdiMHhBY2MrNjVSbytYUWt5?=
 =?utf-8?B?czlKQ00zMWJ0YTRwdTNFa2ZlS3RjZVJUelBFeG8rOHkrSVBURVpybnduWEtU?=
 =?utf-8?B?aEVvUmwwaUhRUHNkdjN3Y0YybUFrSEg0TFp5aWZvWVFtcnNzT1RXem8xZkk2?=
 =?utf-8?B?bWhRYm03MUhJL3ErSVBrMnlwS1Y1blNLVVNIUlQvZ0NNSWxOeC9FS0lTTE9q?=
 =?utf-8?B?NUo2VTZwZkd1QnJlSEkyZzhMVjhwN2kzdkFWNUpsVVZQRS9XcllzWGIxTzZY?=
 =?utf-8?B?VlVSZ2Ivam5ubnowTUQ0NDRHaWpwRTNkanRSY1JEQkJsZVNIWjE1ODFacHQv?=
 =?utf-8?B?dmZIcWdLaVV4bkdsL0V1V1JQbC8xNGFXR25YK3R1WXljT1MxT2xOSTVjUmtq?=
 =?utf-8?B?N2dDSm9veStydEpiZzRhYjZ0Rno0UXkrUkp6ZG5ZU2VFaXdBWTVyN1JEZDJQ?=
 =?utf-8?B?TGVwN3l2Q1YyQ2hTRTdJeFdUczJ6dWk5SHdSUldHMHc5M3I3bkdRb1djYVp6?=
 =?utf-8?B?eEFBQXNQSk1WWEhxVUhvNjAvZWNDTTVzdUh5ZDUrRnJYeHoyQ3RvS201WTlO?=
 =?utf-8?B?NDFoY04wK00rWVdQcXJhVjV0dlRaK0w2dDJTdG9QME8yT0VtWlRHVVFqeU80?=
 =?utf-8?B?Tk1pejR0Q1lDWjYyajZwWXBLQ3hRbFhwc2lQVC9hWVpjR1V4ZUJSbkt0TDJJ?=
 =?utf-8?B?dWRuY2ZsMlNxVThsVThwUUJmRVp1NlQ4b0hvUE1pVzNBMnFSaEhVYW92NDhI?=
 =?utf-8?B?YVg3d3k4R2QrWWMzY0hPRGF2Z3paUGV6ZzZJVUMxd3VsdEZNQUVWejROcmVp?=
 =?utf-8?B?QWI0OFRSZkVRSFJNOWpueHlvYkJvZ2hWdmoveXdrdzdPdWtNQm1sdENQT0xx?=
 =?utf-8?B?ZHNsYitwcTZmbUV6b1g0M0RHU3hMMEhRcUZidncvSmJiQWFkM1EvM0F0bmZI?=
 =?utf-8?B?Wk0xQzAxUzdCR0pwVzgycEpnaXovSVd0Qld0cVBzRUJIZFRVMWlqSXhCTTNN?=
 =?utf-8?B?a1NiVTYzTVNyQWlSczFCVDRLVmRMY2RUbU1lYUkwQVhWU1h4bi9oNmFocjJN?=
 =?utf-8?B?MDhxbld2ZTY5TlRpZkJPQ0Q2S1lqVldqdVpDMkZ6MEtraGhPSm9ONWZLNjZw?=
 =?utf-8?B?bk9SN2s5TndVSk1wR0hORFQ1c0tDWDVpdHhkNVVhOFFidGZpcGlPejJpQzJi?=
 =?utf-8?B?UjBMeDNxMnMvNXNHOVVBSE9MMnI3T0t0NW1wTk1DR2FTSmhueHA4M2F6VDV5?=
 =?utf-8?B?V0YrSHV2NW1CeGRmQzd0VWJ0K29LbEx6R3l2S2xZb2xoWVRXWmRoa0JWMnNR?=
 =?utf-8?B?ZVYrdldpQ3hwOGFXcVJQRXBQZ2h5cDFSazloMVRja3RvVERZNVRvQUFvaWtE?=
 =?utf-8?B?VTdrQmZJd1VaRUh1eTREcjBEMXNhbTVQME9oWGZMN2pBSlc2UUl3eVgxZFRN?=
 =?utf-8?B?OEozbUdRcUlScXFhWUxJOW00eDcvQ3lTUXhkcXd6dWJTS1IvT0VDNVZocUpj?=
 =?utf-8?B?bnRDdGc3TGU5Mm1rbElhNzA0bmF6eG5pMlBjRGRHd0sxT2xtbkh2UHJGZVZ3?=
 =?utf-8?B?TGE1WktrQXFyUnRpbWtjMnZzVk5mNTdnb01HMG1EdkRVbFlCZEFoYk10dkE3?=
 =?utf-8?B?dHBOYngzQlBYb01POFNOWlcyRXVZQTJPRi91WTFDMnlvTklXWlM5elMzbVA4?=
 =?utf-8?B?MVVHcXUwOWs4Q0V6b0hYSVNES0tXSGo1UnM1Tm1vYjZ6c3pOTHZzYjRhTHVm?=
 =?utf-8?B?VnF2QnBFbTdlMU4wSWd2eXJudEJtMGkvbTk0a1RQOW11OEhGTmJLZmFlT2x5?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88214404-e8fa-4d8f-e33c-08dd15828545
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 23:14:08.4416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uep4q4vtHq48co7pGi6l/c7GDyABgbTwjVLvFIpz0HYq1+pw+oc2ftOr2S1dNnXaO3a8ibLYikQc3pxLko5cPYmOErx+6pDYJy9jQyOOM5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
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

On 12/5/2024 10:22, Lucas De Marchi wrote:
> Instead of handling the whitelist directly in the GuC ADS
> initialization, make it follow the same logic as other engine registers
> that are save-restored. Main benefit is that then the SW tracking then
> shows it in debugfs and there's no risk of an engine workaround to write
> to the same nopriv register that is being passed directly to GuC.
>
> This means that xe_reg_whitelist_process_engine() then only process the
> RTP, converting it to sr entries and then add those entries to the
What is 'RTP'? Isn't that just a generic term for any table of 
registers? Also what is the 'sr' in xe_reg_sr? Is it meant to be 
save/restore or something else entirely?

It would be really useful to have some top level documentation somewhere 
that says how the w/a, whitelist, etc. register lists are handled - how 
they are constructed, how they are applied (in both the KMD and the 
GuC), etc.


> engine sr. With that all the registers should be covered by
> xe_reg_sr_apply_mmio() to write to the HW and there's no special
> handling in GuC ADS to also add these registers.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c            |  4 +-
>   drivers/gpu/drm/xe/xe_guc_ads.c       |  7 ----
>   drivers/gpu/drm/xe/xe_hw_engine.c     |  1 -
>   drivers/gpu/drm/xe/xe_reg_sr.c        | 49 ----------------------
>   drivers/gpu/drm/xe/xe_reg_whitelist.c | 59 +++++++++++++++++++++++++++
>   5 files changed, 60 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d6744be01a687..41ab7fbebc193 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -748,10 +748,8 @@ static int do_gt_restart(struct xe_gt *gt)
>   	if (err)
>   		return err;
>   
> -	for_each_hw_engine(hwe, gt, id) {
> +	for_each_hw_engine(hwe, gt, id)
>   		xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
> -		xe_reg_sr_apply_whitelist(hwe);
> -	}
>   
>   	/* Get CCS mode in sync between sw/hw */
>   	xe_gt_apply_ccs_mode(gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index b0afb89d9d90c..943146e5b460d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -243,8 +243,6 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>   		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
>   			count++;
>   
> -	count += RING_MAX_NONPRIV_SLOTS * XE_NUM_HW_ENGINES;
> -
>   	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
>   
>   	if (XE_WA(gt, 1607983814))
> @@ -729,11 +727,6 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>   	xa_for_each(&hwe->reg_sr.xa, idx, entry)
>   		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
>   
> -	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++)
> -		guc_mmio_regset_write_one(ads, regset_map,
> -					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
> -					  count++);
> -
>   	for (e = extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
>   		if (e->skip)
>   			continue;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index c4b0dc3be39c3..b193667441488 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -574,7 +574,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>   	xe_gt_assert(gt, gt->info.engine_mask & BIT(id));
>   
>   	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
> -	xe_reg_sr_apply_whitelist(hwe);
>   
>   	hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
>   						 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index ea958400a15a1..9475e3f749580 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -24,7 +24,6 @@
>   #include "xe_hw_engine_types.h"
>   #include "xe_macros.h"
>   #include "xe_mmio.h"
> -#include "xe_reg_whitelist.h"
>   #include "xe_rtp_types.h"
>   
>   static void reg_sr_fini(struct drm_device *drm, void *arg)
> @@ -192,54 +191,6 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>   	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
>   }
>   
> -void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> -{
> -	struct xe_reg_sr *sr = &hwe->reg_whitelist;
> -	struct xe_gt *gt = hwe->gt;
> -	struct xe_reg_sr_entry *entry;
> -	struct drm_printer p;
> -	u32 mmio_base = hwe->mmio_base;
> -	unsigned long reg;
> -	unsigned int slot = 0;
> -	unsigned int fw_ref;
> -
> -	xe_gt_dbg(gt, "Whitelisting %s registers\n", sr->name);
> -
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> -		goto err_force_wake;
> -
> -	p = xe_gt_dbg_printer(gt);
> -	xa_for_each(&sr->xa, reg, entry) {
> -		if (slot == RING_MAX_NONPRIV_SLOTS) {
> -			xe_gt_err(gt,
> -				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
> -				  hwe->name, RING_MAX_NONPRIV_SLOTS);
> -			break;
> -		}
> -
> -		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
> -		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot),
> -				reg | entry->set_bits);
> -		slot++;
> -	}
> -
> -	/* And clear the rest just in case of garbage */
> -	for (; slot < RING_MAX_NONPRIV_SLOTS; slot++) {
> -		u32 addr = RING_NOPID(mmio_base).addr;
> -
> -		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
> -	}
> -
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -
> -	return;
> -
> -err_force_wake:
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
> -}
> -
>   /**
>    * xe_reg_sr_dump - print all save/restore entries
>    * @sr: Save/restore entries
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 3996934974fa0..0be105b305907 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -10,7 +10,9 @@
>   #include "regs/xe_oa_regs.h"
>   #include "regs/xe_regs.h"
>   #include "xe_gt_types.h"
> +#include "xe_gt_printk.h"
>   #include "xe_platform_types.h"
> +#include "xe_reg_sr.h"
>   #include "xe_rtp.h"
>   #include "xe_step.h"
>   
> @@ -89,6 +91,62 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>   	{}
>   };
>   
> +static int whitelist_add_to_hwe_sr(struct xe_reg_sr_entry *entry,
> +				   unsigned int slot,
> +				   struct xe_hw_engine *hwe)
> +{
> +	struct xe_reg_sr_entry hwe_entry = (struct xe_reg_sr_entry) {
> +		.reg = RING_FORCE_TO_NONPRIV(hwe->mmio_base, slot),
> +		.set_bits = entry->reg.addr | entry->set_bits,
> +		.clr_bits = entry->set_bits,
> +		.read_mask = entry->read_mask,
> +	};
> +
> +	return xe_reg_sr_add(&hwe->reg_sr, &hwe_entry, hwe->gt);
> +}
> +
> +static int whitelist_add_nopid_to_hwe_sr(unsigned int slot,
> +					 struct xe_hw_engine *hwe)
> +{
> +	struct xe_reg_sr_entry hwe_entry = (struct xe_reg_sr_entry) {
> +		.reg = RING_FORCE_TO_NONPRIV(hwe->mmio_base, slot),
> +		.set_bits = RING_NOPID(hwe->mmio_base).addr,
> +		.clr_bits = ~0u,
> +	};
> +
> +	return xe_reg_sr_add(&hwe->reg_sr, &hwe_entry, hwe->gt);
> +}
This function is effectively just this?

static int whitelist_add_nopid_to_hwe_sr(unsigned int slot,
					 struct xe_hw_engine *hwe) {
	return whitelist_add_to_hwe_sr(RING_NOPID, slot, hwe);
}

But there is no way to create an xe_reg_sr_entry from an XE_REG() that 
is simpler than just doing it manually here?


> +
> +static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
> +{
> +	struct xe_reg_sr *sr = &hwe->reg_whitelist;
> +	struct xe_reg_sr_entry *entry;
> +	struct drm_printer p;
> +	unsigned long reg;
> +	unsigned int slot;
> +
> +	xe_gt_dbg(hwe->gt, "Whitelisting %s registers\n", sr->name);
> +	p = xe_gt_dbg_printer(hwe->gt);
> +
> +	slot = 0;
> +	xa_for_each(&sr->xa, reg, entry) {
> +		if (slot == RING_MAX_NONPRIV_SLOTS) {
> +			xe_gt_err(hwe->gt,
> +				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
> +				  hwe->name, RING_MAX_NONPRIV_SLOTS);
> +			break;
> +		}
> +
> +		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
> +		whitelist_add_to_hwe_sr(entry, slot, hwe);
> +		slot++;
> +	}
> +
> +	/* And clear the rest just in case of garbage */
> +	for (; slot < RING_MAX_NONPRIV_SLOTS; slot++)
> +		whitelist_add_nopid_to_hwe_sr(slot, hwe);
Note that RING_MAX_NONPRIV_SLOTS is short. There are actually 20 NONPRIV 
registers on newer platforms. It's just that regs 12 onwards are 
somewhat scattered and not consecutive addresses with the first 12. We 
should really be splatting all of them not just the first few.

John.


> +}
> +
>   /**
>    * xe_reg_whitelist_process_engine - process table of registers to whitelist
>    * @hwe: engine instance to process whitelist for
> @@ -102,6 +160,7 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
>   	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>   
>   	xe_rtp_process_to_sr(&ctx, register_whitelist, &hwe->reg_whitelist);
> +	whitelist_apply_to_hwe(hwe);
>   }
>   
>   /**

