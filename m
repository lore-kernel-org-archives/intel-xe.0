Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E49BCCF9E5
	for <intel-xe@archiver.kernel.org>; Sun, 26 Oct 2025 09:43:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C4E10E0B7;
	Sun, 26 Oct 2025 09:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UEyFUJ+3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5F910E0B7
 for <intel-xe@lists.freedesktop.org>; Sun, 26 Oct 2025 09:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761471804; x=1793007804;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z+xi2omq0hOLf1HKDlmI+EQ3nivB01pu2EW1TEaJU6A=;
 b=UEyFUJ+3mF00KFe5Fq1cZarq2VELS+LYufnLiRVhhZz2kRN5eH0ChkiK
 JVApZOX7P2uKz1RtLkttGJN19mFvW2YnST+GKCT4SuwmuQzcYk1DVMAbH
 OBv5ihdQuIlpUQER48UcJSnvj7VxcIkZGHpgW1UCTJ1/OpXYLkT5/aRyu
 8cEU7/qnYHsVF1E0T0YLGv1+EvnnrUDTAnlJRSiT/68DGJEBneGAZQALB
 h3r9oL+7sqs9EG/kZFVoSjoIaLTVxMObb1hdC+EH/I4wmrzEfB1amXr9n
 ib1q480a7hsVNtA7rmGrIPd+i1j259+qZwK6SKruULzx0LrGt4sHJy4V3 Q==;
X-CSE-ConnectionGUID: +SwmCT9aQ1ON4nJ2Hj2ybw==
X-CSE-MsgGUID: yHmZD1EiSdSyPlLXbEPP2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81211808"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; d="scan'208";a="81211808"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 02:43:24 -0700
X-CSE-ConnectionGUID: 9idPwjWJR+yrrrdRO5gsrw==
X-CSE-MsgGUID: cPGXaY/bSHaGBDvW79o8jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; d="scan'208";a="189101552"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 02:43:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 02:43:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 26 Oct 2025 02:43:23 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 02:43:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWDSy1Sp+HMTPX9qe5XREC/HfTRk5BF9iaLp7AbrjZePvQiRQCFG3GdBwtGdAci57qHWOyB9aFUpbWwwmoADFZtk8mwhvI2EL4ZYe34lTqgMjLt6F7eSP2X6LIKsBYPzZe5FL0wUSgpRatnAGp35iHMPVM3NFiaGxopUmek5b3ZxsIJrTKAbV61b/HORcesJbv+xNTzAdVdA6OnvPonLGRrr31EnAIt7fpWSNXMnEwQw4zzReZfNdv8tHzrtSdQUkiHAtbK7XVAD5bY+o/CSID+ehEJ4LF/kgXiSXHLSxaqYcIfTUnLW5XmR4jVD2NkGKmbKR0g48tYLsJNaG8oLvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kucN9CwTwg1BaP2n+xez1Z+Sg6cxAgNunwGSznWgZk=;
 b=lkRrEwFyjANE3yRM14p2Yhw4k9j8OmX2hPJyTosLeS9tyIVjYyM8ezESodEY11ZtyFS9Muh4eo8U/JIJlnXJfQLhuGFFlVudUwg8hqr0BRNHd4AZ5QSDA3WWcCbwjBZFWAxH7ClrFNC/VxczxpR2D5BzRUEVQCQlfqUR5r4rlV8ycrznqi9iqXeL32BGDjZK89Erpuf7H0LOdG+c6Fnm2AlQJITWh2rHvgeOHFfsjOQvTjTkml9E3b6PggKijc/s362vWF18pZuEG7gokdNuekRuPnoy6+cTbFuybp8zzFt/DiH7u1Wv9KV01VKayB2+DPnBvCXb174zmJ1WWOsQHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA1PR11MB7917.namprd11.prod.outlook.com (2603:10b6:208:3fe::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.16; Sun, 26 Oct
 2025 09:43:21 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.013; Sun, 26 Oct 2025
 09:43:21 +0000
Message-ID: <d74cd7ba-98a6-4b11-8261-5e732e6c6c71@intel.com>
Date: Sun, 26 Oct 2025 10:43:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Access VF's register using dedicated MMIO view
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>
References: <20251024205826.4652-1-michal.wajdeczko@intel.com>
 <20251024222740.GM1207432@mdroper-desk1.amr.corp.intel.com>
 <1ffe8cdd-717f-4d16-bfbc-e0d6028cc46e@intel.com>
Content-Language: en-US
In-Reply-To: <1ffe8cdd-717f-4d16-bfbc-e0d6028cc46e@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA1PR11MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b0dbeac-0282-47fd-d64c-08de147419b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHV0aVNZdE5SSk5NTUJwL2I5L3hXWVQyMFRERnZNSGpRY3luVTZCWVhyY0Uz?=
 =?utf-8?B?SWdKejRjcnh4NG12aFkxa2JxU1RwS1Z3NHo4Z1lUL09rZ0M4R1NkSitZQmVT?=
 =?utf-8?B?QnFPdDlMVjR6VUdsQWJZRmdWb3VCdEE4UnV4dVBFd0RZbGpteG92eStYZmto?=
 =?utf-8?B?cTltdXNhK2JFL1FhOUdwaTBvcUlYbitaY3FVZ21QQ0dXOTJwNFNTQkFWYXRG?=
 =?utf-8?B?RU1iKzN1RjJydDZGaHlhbllGUjZSYUxMQnhnUzNnVzlmQXdESklIUEpGcG1Y?=
 =?utf-8?B?U3F5bHI4Y1l5QThNSVpqMW0zMUluWW9TVUprRTBTM0IvMGM4U1VkbTN3VnZP?=
 =?utf-8?B?WXBsUWxsUnFKSEZTUmUvU1NidTBhZkxGc2FOUWtRaXg0L0cxQ3MzQ2ZZb2Zh?=
 =?utf-8?B?Y2RFZHhBRnF0ZXhjeTRjMjIxSlZQM0h6UXpZUUYrMEVEQTFndy9taUpQSkli?=
 =?utf-8?B?eE1Ka3V3VHFaajlhR2FkWXR2NEtJakVFcGcxZ3dCNzVZSXVFZjdkbXRYWUE5?=
 =?utf-8?B?Nncwa0hoY0FiV0ZtK2E0T0w3ZFpCc2F3UStlZUwyZ1pDSlNLNVFpNU9oZW9E?=
 =?utf-8?B?RTNkOWNGYTlXN0VCREhYMW9hak4yTXBBQkgvOGo2YTBuVDI1ZUUvaVdudmlO?=
 =?utf-8?B?MnZyTHRwSFlDUGhHUWRqMUExQkd0MjQ4c2d3R1JPc1QvSzVIbFlGTjdjcTNE?=
 =?utf-8?B?MGEyQ1BwVzFuUm1QQm5nU0lqSUo5ZWEwRkxQajZjQXplRWYrWjFKcEUxR1lu?=
 =?utf-8?B?STI0OVE2SFg5Y0MzVEY3Yk9JOGZjZHl6alNhUHcxSzFtaFVaNGhtT202aWwr?=
 =?utf-8?B?UkI1TjFJeXphbUNqcWVacnh1N1ExaDJQbkJrbUpGM1lMU1NjL2hwTFl5QUxP?=
 =?utf-8?B?NkhXWWgyQytSSUFCZkNtdTd5OXZrRWUyZk1Tam5GMUpwQk9VckdGaXM0aVlJ?=
 =?utf-8?B?RTNCTWFrNTBUMTVLQk16RE5lSmRZbEx6MGhEa1pZTllBc0cxUnJoK3BYeVUz?=
 =?utf-8?B?bGp1MnNOSmhzc3E0RDBGaXFLdTk2ZkhBb1ZNd3lBNG1kZUVxWXNSTUpKVXIy?=
 =?utf-8?B?YUI0c2ErS3pCMnVVMk5QMk13OS9COURZL3dBVzM3WW1hVUlHSHRsU2pYV29Z?=
 =?utf-8?B?SWxKbXhSTzQ2dzduMkdSTS82bHF4ejUwcDZPZDRrR1lQVEVCWGdNMXZZcENM?=
 =?utf-8?B?bThuLzNxYUtmN1RjWVFGSmRDa3ZNQlNQWmdkWktxSndQRHBCRXdmZldlTG5t?=
 =?utf-8?B?T2kwTUJtaW1JdThJdnQzYk9NYjllZUt5QURBQWsvSExXSXF2Q2pmanV2Mmww?=
 =?utf-8?B?SVdoT2M0Um1BK2dJMlRQbmVxWThrc1pQMElKdHRIaEg4TytXWnlYNjUxYkha?=
 =?utf-8?B?VGRwalA5cGJFUjY5eHdVU2VRMEowSHVNODBLMVZMcFBpbDZ3Kzg1VmpZK2w1?=
 =?utf-8?B?bmNZanhaRWZUZEhmTEFYWE1GR2FWV0lReDMvUVNjdDQvRFRwVll6MDZJTEho?=
 =?utf-8?B?aHFJQ3NSSWpMbzZwOWZSRit2MmNzYzBncFJMNjZMRXZISzZ2VG84V3VUQ0l6?=
 =?utf-8?B?UjJyRVFuSWl1ZklSTFdzWUFGRmF5V2VvL2VKb1poTWExYzF5N3pyMU05SVo4?=
 =?utf-8?B?VEprNFFLaHpMV1BmbGNvZ0RibU5Nb1huV3ZXbFNnanlnZGNjRUdDUmhrQit5?=
 =?utf-8?B?cWM3MlZkWnN3UmVZd09iMHc5Vm0wRzJIdXcxaG55NWV6TFdCbUhWR1RMVEtC?=
 =?utf-8?B?azR2Mlhma2RGVmhrdC8wckNZa3p4RkFKRk85ZThOZTJXeHZyaWdmZ0ZDS1lO?=
 =?utf-8?B?cnp6Um0zajYvQ2NGWXNWWkNURFkrc3pORm1lMlE0NlRrMUUraTB5aitabnM0?=
 =?utf-8?B?dlVkN242L2p0RGpUcUVsTWZHOStDOEUxRU44NHNSWURXUmE4UnAxQVhPYVBD?=
 =?utf-8?Q?3vs81ZVEGtjCKYAxDjJFXx0Mebzx4N77?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUdxZU9yODhyK0tXaytCdVV5bmZoOWMvOXd3eHFkeWNxWEcyZHpTSEdFNWpt?=
 =?utf-8?B?TGVOTEdGaitzczdyUGdobDhZRkVUQTVuVCtnb3pjeWNJbHZGa0J2NzcwaERY?=
 =?utf-8?B?Y3ZCY29sRzVIQjZleEE3dnVSdDZ0akFnYStKZ1BFQ0ZsRUxPTWFBTDNMQWpl?=
 =?utf-8?B?MUd4WExRK1dPeVlHTWlxYzJxcDBsMXliY25pNXNpYlBaWXMrL1JUaEVCWkhu?=
 =?utf-8?B?Q21iS2gyOUJhQmlac1VPdmpVcEZpSnF5R1pUSklDMUpUQkcrKzV0SzU1eFhm?=
 =?utf-8?B?N1A1dzM2OHlMN1JtRXk0WldIampHb1ZPbmpIUjhFdDJXTmxzYVRrL1AyVGtU?=
 =?utf-8?B?NlJESnpGZlpRYngxRFlsbVZpV0l6L1poZXQvcm5ubEtJSi84VWVFTzd3OXN6?=
 =?utf-8?B?YnQ3a3lPNXlqc0tZeTJXeXpDMk95SVI0dlE0QmVaZnhkaE9SSjRpdFJSd1ZT?=
 =?utf-8?B?aVhIMDRoWnFUeGtPaFUveW56bnRkNUxiQU1kdUhCanJQall3YzNlamRWR0Jm?=
 =?utf-8?B?bXFEaVpGclNOb2M5SHFXNFRuNWhpRytsY3dFZHZTVElJaCt3Yk5jekNITnJk?=
 =?utf-8?B?K29COEVBcXRCUG0vSDYyYkoxZWc1VmdUT0ZyekdMeDNnbDFISElEcGR1Nit3?=
 =?utf-8?B?NXE3eEVJSjA1bm5oRmh0b3V6R2d2cGJlQUs4OG1xOW9hcDZCYys1M3RGVUNx?=
 =?utf-8?B?L0tqakdjelQ0anlnZVhPVytlY3RLS0VCVVBMT285TWhaeCtjdSsvdjZTVXhK?=
 =?utf-8?B?ZklKRS9YY25qbzVJL3diTUY0ZWFXVHRQd29kUjRaTnBnVExVV3Zwb1BFV3Z0?=
 =?utf-8?B?ZGN2UURaMTZTdTJOWVZNUGt5U1JoaUpTcDNJZlYxVmg0NlBiQldWTFdkN296?=
 =?utf-8?B?RzZVcW1aZVdvaFJaV1BKTm80OWR0cUZOQXRhRXk5d3lTeFNFNnMxY1RwWXJS?=
 =?utf-8?B?L2xSYTYvb0VTVjFEdFhCa0krYmd5bzJZbm0vZjN0T3VRQTh4SDlRN1huWmdV?=
 =?utf-8?B?N1YxdnFqQlpnMWpoV2doV21UMmF4YklocUFsbHJoZ2J2cjgzL1VldHFPWk4y?=
 =?utf-8?B?Wi9zZncvdWJkZzQ4L1pyYVpBZFVsS1dkL0VlNGRPYWdUTXVneC9HS3dObmJN?=
 =?utf-8?B?VS9VVHgrU3UzblpmaUhBSDhSTWlOTkF1dkJsTGN3aHozWG4xRnlNdFYrMFJI?=
 =?utf-8?B?dWlUSFVISmZUWGlWTEs2b2hacnBzU2MrZHNzbEs0S0JTc2FKSWh6eUp1clN6?=
 =?utf-8?B?MnJaNC9Uc0lkWTNrMWo0U1oxUjNLTzRGUjFtV0xCTUMyNWlXY0F5VlhlZW5K?=
 =?utf-8?B?NFg4RDI0WEZzSFRCd3hYODhsbDVPa2JqQlE0VnUvTVZCNmNqOW5IcGlpUHVR?=
 =?utf-8?B?ZCs3VTcrc3ZJcUM3VjVSVVdGUDlLV0xsaWRwaEFKNEQ2Z1dHN2ViamxYR1c4?=
 =?utf-8?B?a2hSU1NPZE5CdjlrSjdtSmpUeVhpSWJibHozakJmVm9JcVh3TTlyWkhtdXFh?=
 =?utf-8?B?c3ZOcjJobXNLOUtJaWpKQzVBV1JiRWk5SFh3a1psTVZpL0hobVFDZTJkendU?=
 =?utf-8?B?MzVhVUxJMVZ5RVVJU3JQQXJ5bWdUa2kzMGtSRjc4VDJUczdOaUplM2o1eEZm?=
 =?utf-8?B?TDAwWTNhcDgvNzFyVjBKNTQ4OThLa1JGVEhzVEt3aHVJU291WmQrZUdNSmQ3?=
 =?utf-8?B?MjBXNUNEVUtyQ0Nvb2d1Ti9RWExweDJZdDUwaWZPNmVERDluRVRvU0ZQdWdh?=
 =?utf-8?B?UUhoK1hkWkZRTUZuMERwUVRIUjkvY1dGVVBjUkcrazgyR3RLT3g5aFM2aHFH?=
 =?utf-8?B?NjJjVVViMXNTNTQrWEZPa3NhWmtnbElGeWhGaHg0Y0Z2djBBeHZyc08zcUN0?=
 =?utf-8?B?MGZQeE9QZC81bXBydW5MU1UxZTZuQkZZZ2YrQkRQNTBORTY5dE5vRHFZUC9o?=
 =?utf-8?B?NlpVUEp1Z1BHamhsQ1ZSZE1xTGJudUZJNFdBYzZ5U21wb0MreVgrdndMUitB?=
 =?utf-8?B?WkhWQnpUU3RPWkN2YWJ3ZXBmTjdGT1krdU9iNjBwZXVmOTJRdXJVUTRVdVc3?=
 =?utf-8?B?VzNuRlZ2V2RUQnVtR2NrTjR0ckhOSEpOT09sZXNZUUVHV3RhOTFXOUpPQUpQ?=
 =?utf-8?B?NHJKcFlrZmhobnI4emsyVmFTV0E4UWRSZmZQWUYyTDI0Z3ZRa0J2eWV3bkQ4?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0dbeac-0282-47fd-d64c-08de147419b0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2025 09:43:21.5293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+r5mPaO939OKuFBoyZLeWRdS1HoWiErWb3gnzqtUT/ftMue9Hq8Kx1OYXqYeG4FgV5pGvHZ0dzMKM4ASw3wcPu7Xl4xpGOV1j4VERHsh7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7917
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



On 10/25/2025 1:21 AM, Michal Wajdeczko wrote:
> 
> 
> On 10/25/2025 12:27 AM, Matt Roper wrote:
>> On Fri, Oct 24, 2025 at 10:58:25PM +0200, Michal Wajdeczko wrote:
>>> Instead of creating ad-hoc new register definitions with altered
>>> register addresses to mimic the VF's access to these registers,
>>> prepare new MMIO instance per required VF, with shifted internal
>>> location of the register map.  This will allow to use unmodified
>>> register definitions in all calls to xe_mmio() functions.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 36 +++++++----------------------
>>>  drivers/gpu/drm/xe/xe_mmio.c        | 29 +++++++++++++++++++++++
>>>  drivers/gpu/drm/xe/xe_mmio.h        |  4 ++++
>>>  3 files changed, 41 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>>> index c4dda87b47cc..0714c758b9c1 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>>> @@ -158,39 +158,19 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
>>>  	xe_gt_sriov_pf_service_update(gt);
>>>  }
>>>  
>>> -static u32 pf_get_vf_regs_stride(struct xe_device *xe)
>>> -{
>>> -	return GRAPHICS_VERx100(xe) > 1200 ? 0x400 : 0x1000;
>>> -}
>>> -
>>> -static struct xe_reg xe_reg_vf_to_pf(struct xe_reg vf_reg, unsigned int vfid, u32 stride)
>>> -{
>>> -	struct xe_reg pf_reg = vf_reg;
>>> -
>>> -	pf_reg.vf = 0;
>>> -	pf_reg.addr += stride * vfid;
>>> -
>>> -	return pf_reg;
>>> -}
>>> -
>>>  static void pf_clear_vf_scratch_regs(struct xe_gt *gt, unsigned int vfid)
>>>  {
>>> -	u32 stride = pf_get_vf_regs_stride(gt_to_xe(gt));
>>> -	struct xe_reg scratch;
>>> -	int n, count;
>>> +	struct xe_mmio mmio;
>>> +	int n;
>>> +
>>> +	xe_mmio_init_vf_view(&mmio, &gt->mmio, vfid);
>>>  
>>>  	if (xe_gt_is_media_type(gt)) {
>>> -		count = MED_VF_SW_FLAG_COUNT;
>>> -		for (n = 0; n < count; n++) {
>>> -			scratch = xe_reg_vf_to_pf(MED_VF_SW_FLAG(n), vfid, stride);
>>> -			xe_mmio_write32(&gt->mmio, scratch, 0);
>>> -		}
>>> +		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
>>> +			xe_mmio_write32(&mmio, MED_VF_SW_FLAG(n), 0);
>>>  	} else {
>>> -		count = VF_SW_FLAG_COUNT;
>>> -		for (n = 0; n < count; n++) {
>>> -			scratch = xe_reg_vf_to_pf(VF_SW_FLAG(n), vfid, stride);
>>> -			xe_mmio_write32(&gt->mmio, scratch, 0);
>>> -		}
>>> +		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
>>> +			xe_mmio_write32(&mmio, VF_SW_FLAG(n), 0);
>>>  	}
>>>  }
>>>  
>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>>> index ef6f3ea573a2..350dca1f0925 100644
>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>> @@ -379,3 +379,32 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
>>>  {
>>>  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
>>>  }
>>> +
>>> +#ifdef CONFIG_PCI_IOV
>>> +static size_t vf_regs_stride(struct xe_device *xe)
>>> +{
>>> +	return GRAPHICS_VERx100(xe) > 1200 ? 0x400 : 0x1000;
>>> +}
>>> +
>>> +/**
>>> + * xe_mmio_init_vf_view() - Initialize an MMIO instance for accesses like the VF
>>> + * @mmio: the target &xe_mmio to initialize as VF's view
>>> + * @base: the source &xe_mmio to initialize from
>>> + * @vfid: the VF identifier
>>> + */
>>> +void xe_mmio_init_vf_view(struct xe_mmio *mmio, const struct xe_mmio *base, unsigned int vfid)
>>> +{
>>> +	struct xe_tile *tile = base->tile;
>>> +	struct xe_device *xe = tile->xe;
>>> +	size_t offset = vf_regs_stride(xe) * vfid;
>>> +
>>> +	xe_assert(xe, IS_SRIOV_PF(xe));
>>> +	xe_assert(xe, vfid);
>>> +	xe_assert(xe, !base->sriov_vf_gt);
>>> +	xe_assert(xe, base->regs_size > offset);
>>> +
>>> +	*mmio = *base;
>>> +	mmio->regs += offset;
>>> +	mmio->regs_size -= offset;
>>
>> I feel like it might be more intuitive to use adj_offset / adj_limit
> 
> I couldn't just update adj_offset as it will not be used on the main
> GT because it is 0 there and we have this condition:
> 
> 	if (addr < mmio->adj_limit)
> 		addr += mmio->adj_offset;
> 
> since I didn't want to touch adj_limit here, it was easier to move regs ;)
> 
> but if it is OK to change adj_limit in the xe_gt_mmio_init():
> 
> ./xe_gt.c-686-
> ./xe_gt.c-687-  if (gt->info.type == XE_GT_TYPE_MEDIA) {
> ./xe_gt.c-688-          gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
> ./xe_gt.c:689:          gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
> ./xe_gt.c-690-  } else {
> ./xe_gt.c-691-          gt->mmio.adj_offset = 0;
> ./xe_gt.c:692: -        gt->mmio.adj_limit = 0;
> ./xe_gt.c:692: +        gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
> ./xe_gt.c-693-  }
> 
> then I can do:
> 
>  +	*mmio = *base;
>  +	mmio->adj_offset += offset;

hmm, after second thought, this will work only for the gt->mmio, and while
it is our main usage right now, it will be unable to provide VF "view" if
source xe_mmio would be a tile->mmio one, so I'm gonna to keep it as-is

> 
>> instead to select the appropriate per-VF instance of the registers and
>> leave regs/regs_size unchanged, representing the underlying iomap
>> itself.  I see this selection of a specific VF's instance of these
>> registers as being similar conceptually to selecting which instance
>> (primary or media) of a GT's GSI registers we access.  But this approach
>> works just as well, so I'm fine if you want to keep it like this.
>> Either way,
>>
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Thanks!

>>
>>
>> On a slightly related note, I do still have plans to add optional
>> allow/deny ranges to xe_mmio structures that debug builds can do runtime
>> checks against to ensure an xe_mmio isn't accidentally being used to
>> access register ranges it wasn't intended for.  Probably not super
>> useful for what you're doing here since the lifetime of your xe_mmio is
>> a single function, but I think there are a lot more uses of xe_mmio
>> coming in the future, and that will help us catch mistakes in CI.  I'll
>> try to get back to working on that soon.

actually it might related, as under the normal usage, the PF shouldn't
look at the registers exposed strictly for VFs, so initially we should
see some complains from your new checks, but likely we should be also
able to make this 'view' somehow compatible with your upcoming checks

Michal

>>
>>
>> Matt
>>
>>> +}
>>> +#endif
>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>>> index c151ba569003..15362789ab99 100644
>>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>>> @@ -42,4 +42,8 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
>>>  	return &xe->tiles[0].mmio;
>>>  }
>>>  
>>> +#ifdef CONFIG_PCI_IOV
>>> +void xe_mmio_init_vf_view(struct xe_mmio *mmio, const struct xe_mmio *base, unsigned int vfid);
>>> +#endif
>>> +
>>>  #endif
>>> -- 
>>> 2.47.1
>>>
>>
> 

