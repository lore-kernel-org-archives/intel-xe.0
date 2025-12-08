Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DD5D3B7EA
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 17:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7354810E15D;
	Mon,  8 Dec 2025 17:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZjiM1/p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D2110E15D
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 17:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765216088; x=1796752088;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OGsljUDfcP2b3mAjZcZErXadFVvyc1LVCd01WWsASv4=;
 b=gZjiM1/pyNz/ZHanGKuy2YPFbYkurUCM3qwoxe+evrG6xhLQdV2SWqnm
 ySb9wFyLPDdZv0Zl1JdEA2QbsXGVrBreXpyV83pid/4arVLcMmrfkX4FY
 6yMXU5Jxj8D7nMx8D+vY/tHr+dvd7EIZCfMsWKxU4jDYVNqRfIYL6ZQxO
 9ztC+Cs0kZSYjUJrx+C37Fk1zRAlQbaY+PBqxsZ1Ugf3RYjhoNa2Z1Z+I
 kSlp67ZSZNRFoqvuzZDC6O/oNi36tLB9ZaiNaQT4nXR6o3hP2qaV4bK7Q
 6pEuikOMJCjPHKjKMizrF+OtyFkKHoRd9M75uYJYv3qKfLznjwQyNb/L2 A==;
X-CSE-ConnectionGUID: NTDmkekmQaek/KLLjY4HHQ==
X-CSE-MsgGUID: 7U0UmMcJQBe/BhYWPa7iBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="77486854"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="77486854"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 09:48:07 -0800
X-CSE-ConnectionGUID: r3KdIWoGTqmx19PPXqZ5hg==
X-CSE-MsgGUID: Gc6FpFBkRuuguZDtc0PEjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="227021851"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 09:48:06 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 09:48:05 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 09:48:05 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 09:48:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRREpsfeNEJdQ4gvxKVnRZPe6qLFfsCVS4u5zUu49xvcl+SfetqcGjOpc5UKPocYBmylA3rIauke5O6W1yUV9i35O/zKChh48n1SrugtBURi1e1nIVgYncRGX7znfIHaBrB0nm+uf6rrMuTe2M8GzkatQPmWGbzzFdGNuHIr0hSrWDzIPajsy6s5EOWxWRk+EcoLdNSSNyFn4sjC1njfMmZ+7b6Rr6njXNLMf752TC3NMiDju8lSdn6Yca6o1VeOxMp3xvZzrU0yQ5GPDlyeHxGHG9wHgS2Bzt5C/ppHZ4K44t0CIvgUzbkid3/zJ/InEc8jFrfv8w62cPnX4Sdm/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IN65kNYOJibjwPdh2mVTPemVJLkNtJBUj9yzZGSMvgU=;
 b=H+U5oPwD/REIAgVxIb0l0ew/VqgFBxM8lsdIdTqNVb7+7OOIttSDgFTScBHh1e1SEpL2vSERrfJImwDjMR2KECl++ASPrSFNDrbxCJW/+PhnO5ZWetApYSC+gcmoOW2T5wSGwf5ty+0he056LjobuaDY/kaTh8Ykuk5HaWDpTkUQLvhkjoim+9ZYkqOHNNA+KUG1fmgV59ABzAPKPnnBmYunYgm8Mngv9PfBrwd5/1VnlOJHMyoZnyD69JaL34JyzdLksgeMKeN06jCXzRnK/gxRxP1YIeI8K2V2qz5wZqU/p2rWwguhkOkcUhYt+B+gh6eEPd28FRuJNIT/t2zEug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MN2PR11MB4742.namprd11.prod.outlook.com (2603:10b6:208:26b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 17:48:03 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9388.003; Mon, 8 Dec 2025
 17:48:03 +0000
Message-ID: <3d4ca5f6-8861-49e8-bbc8-4ed945c696a4@intel.com>
Date: Mon, 8 Dec 2025 09:48:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] drm/xe/sriov: Scheduler groups are incompatible
 with multi-lrc
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
 <20251206230356.3600292-17-daniele.ceraolospurio@intel.com>
 <00656e7e-09d7-47d8-80da-35f035c9db20@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <00656e7e-09d7-47d8-80da-35f035c9db20@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::28) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MN2PR11MB4742:EE_
X-MS-Office365-Filtering-Correlation-Id: b52f0e96-37be-4f3d-7957-08de3681ef78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1lkcC8vM1RXQU1tYmhnT21kZk9JdVJZRStTeGV0S3E2UzlzWmgvOWtEUWt1?=
 =?utf-8?B?cFRxUTRNRG0rK0U5dWtnemxybFEyYyt2dzdoTEdzeFpYUzI0cUQ4M1BFcktV?=
 =?utf-8?B?YStMTW9qcUNHQjdFL3ExK3NGYUtlU3AxWk80SVpHSWFoc214S2pWaHU2OGt0?=
 =?utf-8?B?dmpQamkrelBWZmJiY1grZUdKZ29UelN3ajJ4ZzhkTzFkYVNVcDBEWlBqYStY?=
 =?utf-8?B?WVBxNE55L2ZwWHBRY2U3c0I2a2w4OHk5UCthUjhyMG96SEI5UC9WVXBuQUtw?=
 =?utf-8?B?ZlZ2V3VnTDF4L1VHWk5BS285a3FGWVlGbVByR0NSeW5jK1drTnhuUVVKNDdh?=
 =?utf-8?B?OUR3dTdnbjVLemQvQmdNb2hadkZ6RndYWUZVckhGZXJXUFBnRFVSUUNvUm1y?=
 =?utf-8?B?b3A4V3ZocGVUQlF2RS8vL1ZiNnJZYmhSUE9FWDFlKzkwQ0NDN2p3bURWZDNN?=
 =?utf-8?B?NlN4MkJyR1ByRm9NdndTWE5Oem05dGMzTkpCSTZkSFFTZXdjTEFIZHQxaVlt?=
 =?utf-8?B?bmQ1L3U4Ritha3QrbDRVa3U5RGJxUW84KytzQ2dMd0s3MFoyZytPNi9BN3Ar?=
 =?utf-8?B?RlVZaE53ZmlaU1FnSHBlQWE4L2Z1WHMydUdTYVRMUXloS1dqeENkWVQ1eFU4?=
 =?utf-8?B?bks4eTU0OVgrbE1hb3JIS0N2Z2MreDQyb2lOaU42VCtYa0pHQ0xtc1FoUktm?=
 =?utf-8?B?S0puZXhFOFJyOEVGVW9aKzNzZUFnQ2VETzdsbGlHR0JYSDFzaVRtbmpHV0Nj?=
 =?utf-8?B?UklMZVBpOWs3NlQ4TCtEemVrNTVlbU12N1RpM3VVYStSL3ZGZ3FBOVREM1dP?=
 =?utf-8?B?WXZacFUrK2dtd1lWQnprdy9wUGFjYzhXM1NOOU5tb3YrYWlKMkJTSFlPcWc3?=
 =?utf-8?B?ZXF4RnR2aGZNalpJMHhZdk1HUWJUUGIyZTZacDBydm9mSUhWWU4zM05lMmY0?=
 =?utf-8?B?UDN5dXJMaCt1cDBySWoyL3JqZW5VRlpLeEIwYzZqdHdGWEVpS3JJdGxGS2No?=
 =?utf-8?B?a2Iwelp0TGx4M0crcERhSFhKRGd5czhFb08wRGRCWGx3ZXlQZ3FNNU4zWEJG?=
 =?utf-8?B?OUw4b0tOUmMrYTFtRXhjZ0I3a01acCticE9TYUd6NU9TVlZhU3U3RjN6TVBh?=
 =?utf-8?B?OEUyN3BjVklWVit3WXdGSTBuK1FrVTllcnJnOTd6YmpnQzNuVjBIdWZmSGNn?=
 =?utf-8?B?NlRweDgwQnJzQWJGS21UTXBrMW5FcEhWZjZ4VUhyU3FOVTdpYVBycFhjd3Zs?=
 =?utf-8?B?NXlZWmdqYThONDRxVlcvWFdMSS9nZDY5NzJ1bnNXeGNySXhORlpwSlRFQlpU?=
 =?utf-8?B?cHh4L2JTMVZEMXFDK01MRTQ0Wk5jZUpWMkdxUThiZkdXOHRWSk5hK3NwaTFL?=
 =?utf-8?B?Y0Zic1VRSzhWMmw4aVVxUnU4UTBpZno5ajZSSjZXUzZhL3Z1eUNZVXhaL3R3?=
 =?utf-8?B?cW53U1ErQjhUUHMzWEszNVhrRitPMGM3UHpFU2k4YmMwUGI5UkhLRjUrWUl0?=
 =?utf-8?B?SHpLMHFmTThuM0c4QVRHTzBmWHJPS0VhM0JzcXIrVWhZTmdrZjJwVnMzcnhp?=
 =?utf-8?B?NldNZUR3NGtqYU1sN0diekhROFpMcldQck9WNEYySnhYWkhzazRncW83KzJi?=
 =?utf-8?B?MnpGeHd0cVoyeGpLUklXSEFvaDhLK2xOQ2hlSFh2aEx1OGRpKzNZZ2hVOFQr?=
 =?utf-8?B?NGxaNkk2TzZZZ252Z0ZpL0U4bkVRL2d1MG1UbDdPNGhwTlhKWlc5c05sVUFZ?=
 =?utf-8?B?T1MvVnpiNTlPaHVLNXRPOWE4dUt5ckxPaUsyelJXeXp2djBrK09tN2NQZzlR?=
 =?utf-8?B?TlZZT09tL0xGWjBNSGdzTXg3TGRQUVhGQ1FSYkY1eWFJSzVLektFd1Y1T044?=
 =?utf-8?B?Umphc2RTOXVwejRGWlp4aHA4MlREWDFkSmU1d3A1NjljOUk2SzBSZ0F0UXIz?=
 =?utf-8?Q?VU3trqZTHaCUjfNvv+8M8ztDA4zVBmjc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVI3OXc4d3M5MUR5VE14cDNJbXk5VjU0ZkYzWVdwc1IzZk9mSDY5NGliSFZT?=
 =?utf-8?B?dDJDclBKU240RmJ3aUhHOUk0U3ZTL053ckdaU1duQkFwazZiVmlJa3owTEpv?=
 =?utf-8?B?TmZBZlpvcVlJTy9KSForTUp6c3pyV2dJQzkzT0F6S3hXa0NmTnlRQ0ZaY0lu?=
 =?utf-8?B?UFFwMG5mL1hDRFQ1djhNeVUvNElwVGV3WjUwV0dBdm1FRG5FNHpYZ1FvOS82?=
 =?utf-8?B?UytLNXl1SGM2c215dUI1Y2pRMk9tWUJSUXVqZHFKVmsrK2dGV2pEM3JkSmVj?=
 =?utf-8?B?ZkFXU2ZYYlQvZTM0Wit2cGtxSGtlVkFxSEhLSEdEeHBoNnNaOW5pODFpTFVV?=
 =?utf-8?B?K0tEMHVxWlN2VDd5cWw4V1oyTjU3QklON1hEWlZBcy82VnBJU0I1ZmxwelRv?=
 =?utf-8?B?WnIvNkV0WitvS3FpV05DZUZhcmg0S09MMEIxVFo2SXh4QnYzUlVJdFpGRDR3?=
 =?utf-8?B?cHpuUE1CbXdYNng1UDRiUkdmKzlJbXFSSm55Wkp0NG5SMDhQOUtjTEJoQSt5?=
 =?utf-8?B?anZ1MUVkM1hGYm9JYlpPZ2dBazczOUxBZWNTeXRMMk9XdkFyOEJBQVpkVmJj?=
 =?utf-8?B?bUtyZjQvMGFyRHhCN2pRWnhnZGRWOHM4RFdwNmM4UG5RdHRTT3ZSK3NNM1Rz?=
 =?utf-8?B?d3o0TFAycjNSWlRLeWc0TGpqbENPT3RSV1JuUnJKK3I3NmVjMEN1SFlqeXk5?=
 =?utf-8?B?K0xMY1R4VzBUTmZlZ2puTzRTOTlqY3N5dm5iRWtQUzlobHoyaExHZy9sYlV2?=
 =?utf-8?B?M0JiOVNkZ1VDV1RqTXJYZVE3ZERjUmdneXZmbHU1TWZnR2thdG9LRldaMkRj?=
 =?utf-8?B?UGNxeldFV2RvdkViTmpOOXduNGpUV2h2SkgreEozUkgxbzdpRUdIYW1UOTlG?=
 =?utf-8?B?WlI4NjIwb1JhQXBONU82UjlRcVcxMGNSUlhIelQyL3RMNXEyTElFQ1FLZEtQ?=
 =?utf-8?B?aFA1L1RtUk5ndGptZjE4QTlDVE01cnRhOEV6MFNMeWowdHA5ZGx5bnIvUXNr?=
 =?utf-8?B?ODJscTcrdHd3Qkwzb1BLSXZUL2tuYWFndFNNNGdrTVpPVitoUkZBLzVzN2ds?=
 =?utf-8?B?K1RmR014ZzZFSExNaEozTElBM2FRamRmMG9EWnRQYjI3NmdHOXErUUd0Qkhx?=
 =?utf-8?B?QUVFdWI4S2pISk96clVMcHRScDdzMFpKNEZEbnc2Sk03UE9YRnhyRG4yK2NM?=
 =?utf-8?B?WXhGZm9XRGFTMmVsUXE4dWRYYjBtY2paVk1JY2lxUmF2ZlBIc3lqTWZNKzNv?=
 =?utf-8?B?a1pxamM2eHNIYy82UU1XUzVSNXJJQ01zUy9JRjN1K2gzaTFQSm0vMlpIaDhM?=
 =?utf-8?B?LzhIQVJoSGhIMVZIQ1RnWkw0c0Vra001RG8xTFZTM01MQlREdUlacWlWMU9C?=
 =?utf-8?B?aHVGRmp3RTQ1QUY0Z2F0c2Z6S0RKVmxXdXl1VU5Lbnp4QmVzYVdIUjhRTTU5?=
 =?utf-8?B?Y1U4WWZPc1ZqWkEyTmZaSmV1NWtuUnNlMTRvaE1iTVNFMndxV1gyOE42QUxt?=
 =?utf-8?B?Q1dmakVYRy9JV3NOcFhmaWU1T3JIUkthVG55TGZWdW9QQ1VoOHZZVjdtdVA2?=
 =?utf-8?B?R0ROTlN4aCtSRkJ6endRcEJtUk5NR0dMb1g4d1BkbG1BOXJLblErK0l6cUUx?=
 =?utf-8?B?bDU5cjdESW04dzlYY0lHeGNra0FhM3RYS3ZkNExJOSthSGtCVlM4MmVjdWNY?=
 =?utf-8?B?bnJ6UjhqUTEzSmNTY3hRN2dSRFI5T1p5ajhRQXRDS2F6UzdTU2cxT0xBSlE3?=
 =?utf-8?B?UThKODJTblZ3WGJ0VXhMcjZTcHYrYnI0T2E3SGdNeU5EU3ZYdThIN0I0aTFW?=
 =?utf-8?B?Mnl3WEF6cGhHaHpGUzMxamNTOWJ2aXNRaDNNQUZZUHRWSjlPbmg5Q1pzYmFM?=
 =?utf-8?B?cjFoWXFTMEs0WHpHK3pSRGdaVmNINVg4MURJMWZlSjZVUHNQbURlSkJhWnY2?=
 =?utf-8?B?OXN0a3VFdG9MNkFLdElUQ2lyMDJBcjNpa2VHY0c0MkR2UlRZRW9pdVBxc0w0?=
 =?utf-8?B?bGxSWnh3QlJiWE41MHYyRzhmNktkU2lUdHFSOHo0OUt3dm9XbzM2b2dtY1hu?=
 =?utf-8?B?WVRwVFoxYzkwSVVEdXRseGUrL0ZiOVZmTjR6YWVrcUgvRXBIazNOZnBXc1Nm?=
 =?utf-8?B?RFNsWjh0a3RQeHprSHpCQ2xmTFBZN21kVnU5cXJwVStBSDJXSk1BUU15akdi?=
 =?utf-8?Q?qd7BcdaxzYNaJxJrZmXFIbA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b52f0e96-37be-4f3d-7957-08de3681ef78
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 17:48:03.0934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ei3Agj0E/8WvJsIeCfjkbrE7UspqOvI2Mh6Kqm1poIYMKT6RXAGTHByld1TSHZswE0yvkGTgpzo2HkYnEAw603vyWVsZoOeydtMG31S9bqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4742
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



On 12/7/2025 1:58 PM, Michal Wajdeczko wrote:
>
> On 12/7/2025 12:04 AM, Daniele Ceraolo Spurio wrote:
>> Since engines in the same class can be divided across multiple groups,
>> the GuC does not allow scheduler groups to be active if there are
>> multi-lrc contexts. This means that:
>>
>> 1) if a MLRC context is registered when we enable scheduler groups, the
>>     GuC will silently ignore the configuration
>> 2) if a MLRC context is registered after scheduler groups are enabled,
>>     the GuC will disable the groups and generate an adverse event.
>>
>> The expectation is that the admin will ensure that all apps that use
>> MLRC on PF have been terminated before scheduler groups are created. A
>> check on PF is added anyway to make sure we don't still have contexts
>> waiting to be cleaned up laying around.
>> On both PF and VF we block creation of new MLRC queues once scheduler
>> groups have been enabled.
>>
>> v2: move threshold handling to its own patch, move MLRC check to
>>      guc_submit.c, hide SRIOV interals from exec_queue creation code,
>>      better comments/docs (Michal)
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h      |  7 +++
>>   drivers/gpu/drm/xe/xe_exec_queue.c         | 19 +++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf.c        | 17 ++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf.h        |  8 +++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 28 ++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h |  1 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c        | 60 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h        |  1 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h  |  2 +
>>   drivers/gpu/drm/xe/xe_guc_klv_helpers.c    |  3 ++
>>   drivers/gpu/drm/xe/xe_guc_submit.c         | 21 ++++++++
>>   drivers/gpu/drm/xe/xe_guc_submit.h         |  2 +
>>   12 files changed, 169 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index 45733a87183a..edb0546fb163 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -46,11 +46,18 @@
>>    *      Refers to 32 bit architecture version as reported by the HW IP.
>>    *      This key is supported on MTL+ platforms only.
>>    *      Requires GuC ABI 1.2+.
>> + *
>> + * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
>> + *      Tells the driver whether scheduler groups are enabled or not.
>> + *      Requires GuC ABI 1.26+
>>    */
>>   
>>   #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY			0x3000u
>>   #define GUC_KLV_GLOBAL_CFG_GMD_ID_LEN			1u
>>   
>> +#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY	0x3001u
>> +#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN	1u
>> +
>>   /**
>>    * DOC: GuC Self Config KLVs
>>    *
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 226d07a3d852..df01c0664965 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -16,6 +16,7 @@
>>   #include "xe_dep_scheduler.h"
>>   #include "xe_device.h"
>>   #include "xe_gt.h"
>> +#include "xe_gt_sriov_pf.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_hw_engine_class_sysfs.h"
>>   #include "xe_hw_engine_group.h"
>> @@ -718,6 +719,17 @@ static u32 calc_validate_logical_mask(struct xe_device *xe,
>>   	return return_mask;
>>   }
>>   
>> +static bool has_sched_groups(struct xe_gt *gt)
>> +{
>> +	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_sriov_pf_sched_groups_enabled(gt))
>> +		return true;
>> +
>> +	if (IS_SRIOV_VF(gt_to_xe(gt)) && xe_gt_sriov_vf_sched_groups_enabled(gt))
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>>   int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   			       struct drm_file *file)
>>   {
>> @@ -810,6 +822,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   			return -ENOENT;
>>   		}
>>   
>> +		/* SRIOV sched groups are not compatible with multi-lrc */
>> +		if (XE_IOCTL_DBG(xe, args->width > 1 && has_sched_groups(hwe->gt))) {
>> +			up_read(&vm->lock);
>> +			xe_vm_put(vm);
>> +			return -EINVAL;
>> +		}
>> +
>>   		q = xe_exec_queue_create(xe, vm, logical_mask,
>>   					 args->width, hwe, flags,
>>   					 args->extensions);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> index 0d97a823e702..fb5c9101e275 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> @@ -284,3 +284,20 @@ int xe_gt_sriov_pf_wait_ready(struct xe_gt *gt)
>>   	pf_flush_restart(gt);
>>   	return 0;
>>   }
>> +
>> +/**
>> + * xe_gt_sriov_pf_sched_groups_enabled - Check if multiple scheduler groups are
>> + * enabled
>> + * @gt: the &xe_gt
>> + *
>> + * This function is for PF use only.
>> + *
>> + * Return: true if shed groups were enabled, false otherwise.
>> + */
>> +bool xe_gt_sriov_pf_sched_groups_enabled(struct xe_gt *gt)
>> +{
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>> +
>> +	return xe_gt_sriov_pf_policy_sched_groups_enabled(gt);
>> +}
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
>> index e7fde3f9937a..1ccfc7137b98 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
>> @@ -6,6 +6,8 @@
>>   #ifndef _XE_GT_SRIOV_PF_H_
>>   #define _XE_GT_SRIOV_PF_H_
>>   
>> +#include <linux/types.h>
>> +
>>   struct xe_gt;
>>   
>>   #ifdef CONFIG_PCI_IOV
>> @@ -16,6 +18,7 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
>>   void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
>>   void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt);
>>   void xe_gt_sriov_pf_restart(struct xe_gt *gt);
>> +bool xe_gt_sriov_pf_sched_groups_enabled(struct xe_gt *gt);
>>   #else
>>   static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>>   {
>> @@ -38,6 +41,11 @@ static inline void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt)
>>   static inline void xe_gt_sriov_pf_restart(struct xe_gt *gt)
>>   {
>>   }
>> +
>> +static inline bool xe_gt_sriov_pf_sched_groups_enabled(struct xe_gt *gt)
>> +{
>> +	return false;
>> +}
>>   #endif
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> index 1109fec99fc3..6a682d788b02 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> @@ -16,6 +16,7 @@
>>   #include "xe_guc_buf.h"
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_klv_helpers.h"
>> +#include "xe_guc_submit.h"
>>   #include "xe_pm.h"
>>   
>>   /*
>> @@ -567,6 +568,19 @@ static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>>   	if (xe_sriov_pf_num_vfs(gt_to_xe(gt)))
>>   		return -EBUSY;
>>   
>> +	/*
>> +	 * The GuC silently ignores the setting if any MLRC contexts are
>> +	 * registered. We expect the admin to make sure that all apps that use
>> +	 * MLRC are terminated before scheduler groups are enabled, so this
>> +	 * check is just to make sure that the exec_queue destruction has been
>> +	 * completed.
>> +	 */
>> +	if (mode != XE_SRIOV_SCHED_GROUPS_NONE &&
>> +	    xe_guc_has_registered_mlrc_queues(&gt->uc.guc)) {
>> +		xe_gt_sriov_notice(gt, "can't enable sched groups with active mlrc queues\n");
> s/mlrc/MLRC
>
>> +		return -EPERM;
>> +	}
>> +
>>   	err = __pf_provision_sched_groups(gt, mode);
>>   	if (err)
>>   		return err;
>> @@ -615,6 +629,20 @@ int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt,
>>   	return pf_provision_sched_groups(gt, value);
>>   }
>>   
>> +/**
>> + * xe_gt_sriov_pf_policy_sched_groups_enabled() - check whether the GT has
>> + * multiple scheduler groups enabled
>> + * @gt: the &xe_gt to check
>> + *
>> + * This function can only be called on PF.
>> + *
>> + * Return: true if the GT has multiple groups enabled, false otherwise.
>> + */
>> +bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt)
>> +{
>> +	return gt->sriov.pf.policy.guc.sched_groups.current_mode != XE_SRIOV_SCHED_GROUPS_NONE;
>> +}
>> +
>>   static void pf_sanitize_guc_policies(struct xe_gt *gt)
>>   {
>>   	pf_sanitize_sched_if_idle(gt);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> index 6b3e294bc934..ceaf797ca21b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> @@ -20,6 +20,7 @@ u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>>   bool xe_sriov_gt_pf_policy_has_multi_group_modes(struct xe_gt *gt);
>>   bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode);
>>   int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
>> +bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt);
>>   
>>   void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>>   void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 97c29c55f885..48e11c1a2d08 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -438,6 +438,30 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>>   	return value;
>>   }
>>   
>> +static int query_vf_sched_groups(struct xe_gt *gt)
> s/query_vf_sched_groups/vf_query_sched_groups
>
> and keep it closer to vf_cache_sched_groups_status

ok

>
>> +{
>> +	struct xe_guc *guc = &gt->uc.guc;
>> +	u32 value = 0;
>> +	int err;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	if (MAKE_GUC_VER_STRUCT(gt->sriov.vf.guc_version) < MAKE_GUC_VER(1, 26, 0))
>> +		return 0;
> nit: maybe we can split above 'check' code from rest of 'query' code?
>
> and as we have more and more cases where version check is needed, maybe it's also a time to add helper like:
>
> 	bool vf_runs_on_guc(gt, MAKE_GUC_VER)

As far as I can tell this is only the second similar check we do (with 
the other one being the one in vf_migration_ccs_bb_support_check), so 
IMO a bit early for a dedicated helper.

Daniele

>
>> +
>> +	err = guc_action_query_single_klv32(guc,
>> +					    GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY,
>> +					    &value);
>> +	if (unlikely(err)) {
>> +		xe_gt_sriov_err(gt, "Failed to obtain sched groups status (%pe)\n",
>> +				ERR_PTR(err));
>> +		return err;
>> +	}
>> +
>> +	xe_gt_sriov_dbg(gt, "sched groups %s\n", str_enabled_disabled(value));
>> +	return value;
>> +}
>> +
>>   static int vf_get_ggtt_info(struct xe_gt *gt)
>>   {
>>   	struct xe_tile *tile = gt_to_tile(gt);
>> @@ -564,6 +588,21 @@ static void vf_cache_gmdid(struct xe_gt *gt)
>>   	gt->sriov.vf.runtime.gmdid = xe_gt_sriov_vf_gmdid(gt);
>>   }
>>   
>> +static int vf_cache_sched_groups_status(struct xe_gt *gt)
>> +{
>> +	int ret;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	ret = query_vf_sched_groups(gt);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	gt->sriov.vf.runtime.uses_sched_groups = ret;
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>>    * @gt: the &xe_gt
>> @@ -593,12 +632,33 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>   	if (unlikely(err))
>>   		return err;
>>   
>> +	err = vf_cache_sched_groups_status(gt);
>> +	if (unlikely(err))
>> +		return err;
>> +
>>   	if (has_gmdid(xe))
>>   		vf_cache_gmdid(gt);
>>   
>>   	return 0;
>>   }
>>   
>> +/**
>> + * xe_gt_sriov_vf_sched_groups_enabled() - Check if PF has enabled multiple
>> + * scheduler groups
>> + * @gt: the &xe_gt
>> + *
>> + * This function is for VF use only.
>> + *
>> + * Return: true if shed groups were enabled, false otherwise.
>> + */
>> +bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt)
>> +{
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>> +
>> +	return gt->sriov.vf.runtime.uses_sched_groups;
>> +}
>> +
>>   /**
>>    * xe_gt_sriov_vf_guc_ids - VF GuC context IDs configuration.
>>    * @gt: the &xe_gt
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index af40276790fa..7d97189c2d3d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -30,6 +30,7 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
>>   u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>> +bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
>>   
>>   u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>>   void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> index 420b0e6089de..5267c097ecd0 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> @@ -27,6 +27,8 @@ struct xe_gt_sriov_vf_selfconfig {
>>   struct xe_gt_sriov_vf_runtime {
>>   	/** @gmdid: cached value of the GDMID register. */
>>   	u32 gmdid;
>> +	/** @uses_sched_groups: whether PF enabled sched groups or not. */
>> +	bool uses_sched_groups;
>>   	/** @regs_size: size of runtime register array. */
>>   	u32 regs_size;
>>   	/** @num_regs: number of runtime registers in the array. */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> index 1b08b443606e..dd504b77cb17 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> @@ -21,6 +21,9 @@
>>   const char *xe_guc_klv_key_to_string(u16 key)
>>   {
>>   	switch (key) {
>> +	/* GuC Global Config KLVs */
>> +	case GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY:
>> +		return "group_scheduling_available";
>>   	/* VGT POLICY keys */
>>   	case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
>>   		return "sched_if_idle";
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index af43acf7baae..e8921219ac4e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -2985,6 +2985,27 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
>>   	mutex_unlock(&guc->submission_state.lock);
>>   }
>>   
>> +/**
>> + * xe_guc_has_registered_mlrc_queues - check whether there are any MLRC queues
>> + * registered with the GuC
>> + * @guc: GuC.
>> + *
>> + * Return: true if any MLRC queue is registered with the GuC, false otherwise.
>> + */
>> +bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc)
>> +{
>> +	struct xe_exec_queue *q;
>> +	unsigned long index;
>> +
>> +	guard(mutex)(&guc->submission_state.lock);
>> +
>> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>> +		if (q->width > 1)
>> +			return true;
>> +
>> +	return false;
>> +}
>> +
>>   /**
>>    * xe_guc_contexts_hwsp_rebase - Re-compute GGTT references within all
>>    * exec queues registered to given GuC.
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
>> index 100a7891b918..49e608500a4e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>> @@ -49,6 +49,8 @@ xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapsh
>>   void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
>>   void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
>>   
>> +bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc);
>> +
>>   int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
>>   
>>   #endif

