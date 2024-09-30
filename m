Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA0CCF649D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 09:42:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609DD10E3DD;
	Mon, 30 Sep 2024 09:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fYQh2R8c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA2810E3DD
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 09:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727689356; x=1759225356;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L9CDQUt/Fl9ndXQj5JPOOrlB+VDd0+D438rO1DOYlIc=;
 b=fYQh2R8caIny5aIDoA9cRSFicNVQEcbk/nxoULiEL6ws9dGztCBgB04F
 ZOlLJYTgY2RgOEe0sVPcfPLaYh1/UbJqpmk05Y9SK+g6o9biKfxf5LPC6
 HOthSDEJt0/cLYshMNbwI6yzipJYxIoZ/KvnkG5NMxShfXaCdqOJz1j/2
 u6vkUYMk8dCn9e8DBlJoWDuovUWtPqOtGKSfSe7Pp1LpK+WBJtcOVm8va
 Ch+ZAQd+32IDjeiFugm6aELyIvbTfeqxLguXDgq73do2sL92h7kT/EAWp
 L8zOKrdf/lso+3qnSdaDWx1TYdEMyFX9G5ztrfycaR6NIZM4E9712OvLV Q==;
X-CSE-ConnectionGUID: RXnroCD2R8Sbhimrf+Kl8Q==
X-CSE-MsgGUID: VRj+kWHqRBqPqWkVp+BxTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="30467654"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="30467654"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 02:42:36 -0700
X-CSE-ConnectionGUID: 91IaCdMHTzWfD0huWTyIcw==
X-CSE-MsgGUID: ticI849TRIizKAHT32SHIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="110728310"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 02:42:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 02:42:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 02:42:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 02:42:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 02:42:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 02:42:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpwkkoahxTjQJ0UybLqVqpP1mePaiaQHgYhpoBQFPkS61d2CctN3Z6VhSPDO7xl6mHrHoWxRL37b1228BK4vwu6w0taGanP3sHoqasnv0mJyFe6LrXn8rxgJ86116dSeUDE1c8syi6mkP/QLxbSua++9rA3rA/lKkveAThLCel7gDH0LVxR6GpCPiaD3qD+Gwr3dYyhwITo5EsRz3MNUOGxsuAl5V5jIo8PoxLlPZTsWRZ7m8vLYOqrUUYANm3Rpa+BPS6nmt4mRbo4NRJYZxL5FKs9Y3oecDMaQMqZhb31Xf+Oxu+6eNOJhO9ZkH+oX/BWA+jFpKKzdkUiDPKpJYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsaZxq1P8Og55vTqB55sgBF2mWJ3iNopSLBxZtlN23A=;
 b=maLlxkcy/j0BH1MuQ/fnxVI2OYv6Px3EccQ1OMLEGspzdqGEbKPUbtUPiTna1JyMEtj7kTISCXksl6BITY3N4+5AQ5v/BIHJMgYsVyjVCSaESY6cJT7vaCKutiyEs+a5Md3rSnJ5a/i0WEs8AXgmoCzNvlSmcswakSHh4ORXzD7V5Tja2CKLK3Bs72cOxegsNt063XLpxv4ZNaF/3/xSqZxO2z7DQRq1+V4FDg91NSlYqbO3M8BrwvUHCwlbH/TT5Xak9Gylehh34TT6Gl+Dqr7tKgMpkskeS7jJp/tcNJM7p8NZLswYrqz6tg3EsNZYwSHkuoNTBY5yHI8FbMWjIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ2PR11MB7520.namprd11.prod.outlook.com (2603:10b6:a03:4c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 09:42:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8005.026; Mon, 30 Sep 2024
 09:42:20 +0000
Message-ID: <341cb49e-f10f-459c-b7bc-8785f5a8db4d@intel.com>
Date: Mon, 30 Sep 2024 15:12:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/pmu: Add GT frequency events
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240927002344.2565250-1-vinay.belgaumkar@intel.com>
 <20240927002344.2565250-4-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240927002344.2565250-4-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::23) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ2PR11MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: a9745be2-d4c5-425e-ff27-08dce1342d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFpHRUVvSG9TWmtRSG55bVVHUGc2Nkp6eFZqVmF5emRSZGlRUmhnSXdob1pR?=
 =?utf-8?B?QXV2Z3FxWUNpMFlwTHBuUENWNmtmeVkwUDAzM2hvWWpjUXUrSk1FSEh5Y0dp?=
 =?utf-8?B?OE0vOU5DazVTTlBiT0VjQm1uK1dnVVJzWmxxOGhBMjlmdWpqeVc1d2xWaGZj?=
 =?utf-8?B?TXRRc2k4WDJpZmFERGtjaUZRSEFGL0pTaDMvMTQ1WjJ0MkNZaUdFODNiK3Jq?=
 =?utf-8?B?bWlvUGladXVCeFNheGNFaHFNMVFDY2c1VHNpNEpDSTNLLzJhdVlYellVb1Rx?=
 =?utf-8?B?bUkvS0VLYnZ4RG5oSzVxVGluanhxL3VpZGZMQWp2akFEVzlpd1VmdWduMUVh?=
 =?utf-8?B?ZWJiN1N3bmJQTERRZjVYRFJCci92bzhhWEJIaWpGbTQ0SmtaclZtTE1lQWM4?=
 =?utf-8?B?a1hWdXZtSUp1VFc0VWlBVTlmY1cvUGVNcUJRVklqNmIvNGNXQ1k0djMvVTBt?=
 =?utf-8?B?OXhMVVR4emdvWGFBRllieDE0cDF4OXZ3RHQyTFNQN2ZrTTBReEU2WUd3cFlt?=
 =?utf-8?B?TEJ2QUtwYXBDUm1TVUNIUUNFaXVONjdLbFNGMVZIc2xkaEd1blhQVmlhbnlp?=
 =?utf-8?B?SUxsMWxrTTBGKzVrc3RIQ005T0hTVC9ESXNmVGNBM29rQUJiajBqRzBlbDZR?=
 =?utf-8?B?R0NUQUhWWFpzdzN6Q0NvbGkwSE1Vc000cUJoREtBTkJBUE5XYmE0SVovRjho?=
 =?utf-8?B?aW9JZXpJamlzeHhUbHJ1MDFNeEc2aFoyM1NiOFI1Z1d6QTVnTW10WWFTc295?=
 =?utf-8?B?OVl1RzNkU0pjZWpiWTRrVEFwV0xwTUUzT0tWRFo0MkZhY3JRcUwreFhyZjRm?=
 =?utf-8?B?cGRWYmtwNGRrZGJsZkV2UWYxNXRmU0MzbkZuRUs0NzhkSExxcnJNenRxeEQz?=
 =?utf-8?B?YkpHQ3VLdTR4akk1UXRzN0k1TTZsS0ZobjhSY1ZabUpLSGdXNnJaSVBXY2FD?=
 =?utf-8?B?NVNqM2dzY292YUdzUHFQZ1JabURGTmRockY4L3BnL215QTVpT1BSaC91bVUr?=
 =?utf-8?B?UHA0dVdOUk9KQW9MbkNiL0pRR3IwbHlEWjAxYmU0cXNlNEZYWWNlaHZIaUJX?=
 =?utf-8?B?TSsvb3Y1TFFkNDh3b0R2cG0rMExCQTd4Z2draVhCUUlQcnVRbncyTjJiVklK?=
 =?utf-8?B?bkNNU1NuMlhsWUJwMyt5TndrYmx6TzJ3dndvZm1GODdzWEplY3hjZWNkTnh5?=
 =?utf-8?B?SnlFVWl4azVQbzdvUENlaVYyaDYzenRYSEQremJTdzVIbXpDMmh0d0RFM1Q0?=
 =?utf-8?B?UGpWTlBYZktuREJRQWlRMDR3ZnMxNUswcFF3N1prMzcrdGFuS2lJV0VuU21I?=
 =?utf-8?B?anNPL0xBT1ZLQmN5WW9PVDk0ZjQrbk01WEZBNmNJVUYvREw3S3NlQ2twNEVu?=
 =?utf-8?B?UlF3ekE5VTFka2prVXZFblBrQmZ2eTd2YTBZOWlyb1ErUWo2NjBEdjk4czJH?=
 =?utf-8?B?N3hYd29KekJYVTJSTDFFMnhTRlBHM2FBbXh0elNxYkNhZlNMemUyYU5iL21W?=
 =?utf-8?B?RmpaMHVRQ2gxR09QNUFKbTVPNHZSL3pUbDhKM1FMRDkrQjI0SXp3RzBTRFJD?=
 =?utf-8?B?Sm1KODF6TW9mMUp1SURiSElwKzBncTJFU09rTmw4b21IN05Yd1c4alhCeHFi?=
 =?utf-8?B?cmhlVGJWckw0dlpmcndVMnpWa3dZQUtxd1VVTHBPR0orUnpjaVAzeUJCc0hY?=
 =?utf-8?B?LzVyWVFlaDBPMHF3N1BiNjlXY0c1djJvT0x1Tnl4V1czMkNDaFliczlRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUtvT0t6RnVkL3hNWmdQNmVWdURWQlhVaGxDYmN6UndyVmJGVFNUeHp3WUIw?=
 =?utf-8?B?clVCT1F5WVBGT2V1V0kxN0NLdVRvVW1PTzJTR05MVE5TUExabjlNTTBmMnRS?=
 =?utf-8?B?YlRFRXF6ZWhaSThaQ1FBNEdDVWxETUhTdjE0VE5wajlCYXBoTjBnUE1XVHB5?=
 =?utf-8?B?TXErcnpMR1JCc2hSSHNUT1VXc1N5ZnBZMGpQWEZUdjE4UGJ1WlRLcUtJdmxy?=
 =?utf-8?B?UEFVOW9pb2FjSThVUzVFdmJqQTl3c1pkdnU1TythcXB1TDRqSGhBVDBoNXQ1?=
 =?utf-8?B?MXo3ekV3NFg5d1VrUnNoMGwzWXB3Mkg5cnFMSzkzR2NVbnNTS2FlWEhtY0t1?=
 =?utf-8?B?ZDc2TXgzdHBHRGdSZ04xOFpKcXJGell1REQ0KzJzNTNYV2tSL0pjTVppTkpU?=
 =?utf-8?B?TmdjWTRtN013Nml4WGhqU0RUbEEvVG9oK1loQjJkbUNyemJMRmJOUVNBdkZk?=
 =?utf-8?B?bVZVaitvNnlHMEtPdmFTZGtLSUt1c21RZ0JWSzBLajhldWorZWdiNmttSEdu?=
 =?utf-8?B?NGgyRjlpQkZHdkhxR3cvMnphOWZCQ3FtU3NkREtWR3VXZ01qaDVBcjR0ZEtM?=
 =?utf-8?B?SHpHdnBFYVZ4UmNZRUtucGh1SFhxLzZUaThaOFlXdjVHdTI4anJjeDBqQkJu?=
 =?utf-8?B?UXZzRmJGckZuV1ZwL1JqcG1HL2xRRzN5NVI4dnNVNDZnTmZiVnFEWkVVYnBh?=
 =?utf-8?B?ckRHVjNrWE1BdkdUTmt4aTdUVGkxUWFzaGRKSnB2ZFhFOExUTzUzNjUzS2FM?=
 =?utf-8?B?Y2Z5Wkg1M0pNR01BUmVlOG1QRkNONkM1cmhDdFA3UXU4VGQ5TzNGRGVkekxX?=
 =?utf-8?B?dDE4V2FqOXFaSGJ6Z3psQXBlRExCVkxWNUdQKy9SdmxXdVhZMGhJZXFzVVF4?=
 =?utf-8?B?cmFKbVUwRFBRUVVQV3VISm9TU0gvcnNFdWdwMnltQU1yeU9OSERBZlFkQURw?=
 =?utf-8?B?YUE2UnBnakVNK1YvQTRpUUZoSk9NL1A2Z092ODJRdjRvZkplemtqUmZMZ0Fs?=
 =?utf-8?B?K0llUnNqTlRxYmJpbGZqQitKazN0VTJWZmJ6UkJiQlpsY1d2YVFVL3FYc2lK?=
 =?utf-8?B?dE9CbUFaa0VycTlRbGk5OWNBb0NWU1pNL25ZVHVSQ0pVNmxEdDZwc1dQZmpW?=
 =?utf-8?B?T0gvcUtxeTJrL2s5K3JMd0sxWUdPRHQvVW5TQlBETHhYTEUyUHFwQTdXeUcv?=
 =?utf-8?B?REpHTkRoWFVXY1FEdWdwVHNEVW5PRmZSaG9WL2lJVmdieko3cHBCaWpKMDJC?=
 =?utf-8?B?a2pjYmh0SUlQeWJ2aERVaElobEVtd2poNk10Ni9NczdhUE13Ykd1K2lEYlNJ?=
 =?utf-8?B?QkYxN1VIQ0x3VU1vN05mc3QrclY4YzU2V2tJRWtWQ0dkaCt4clRMQWd3LzBt?=
 =?utf-8?B?emdyYTJQNmlpNnBzbUxRVEkxRUF0TXJqMTk0MWVKaG5hWmZ5TUF2ald3K2Zo?=
 =?utf-8?B?d1g3enhBVThJK2owREdLR2QrdFhGVVpiYWpIYWhUZXVqL1d2OVduQjZyYkM3?=
 =?utf-8?B?aW8wc2JrNW9LN3pGTFdJR0RsVlJ5aVo1TXYybkxDTU1VY2d2b1FnYnFlaWRl?=
 =?utf-8?B?VGNMcGhoVFh4OUhjVmhNZVJkeFFocTJLVHE1bXlKbEVZZUJVdzE1cGVzcTVV?=
 =?utf-8?B?TjVvUDRGeVBqY2tSTDg1d2RKaW0rYnNFVU5paFVFQ2QrbllET1lYRkhUZkhp?=
 =?utf-8?B?NzZmd2xMSGd4UnhLczNJcERKZVI1dlIyZk9zOFdycVpRenRLaG96cVR4Lzdk?=
 =?utf-8?B?emNwUlc5VmhEYytzcmxpOVZ2a1BIcER1RmZGK2lRMWVBVXp5TEt1cDdWOHlw?=
 =?utf-8?B?L1pMeEJUZHZ1Q0txNmdFZVdFQ0pJQkxsWXI1ZFRuN1p6cXJYeW1QY04zYzNB?=
 =?utf-8?B?VWFnaTludUQvU0tRbm5RVENyVzhjZGFwdkNzamRWWjN0UFF1aGFPdENLZ0VO?=
 =?utf-8?B?RmcvVjVkMWNFaTBIZnlDdjd1UVFNN0dDVEtWS281dEwxdFU5UTBJWkcvNTI1?=
 =?utf-8?B?ZnN3WGZ6UGp2OXUvK2RUVnVOVnU4Q1ZMREo0ZXVhK2ljajdRQkxPeFZyQjdl?=
 =?utf-8?B?Tmt3NXpjYmtzQWZucFRNUlRGeUprZWtiMTRTYllCdE1CMVpEVXdDRW5BZ3hK?=
 =?utf-8?Q?0v4RejwRUT7uCcdE1IvtXYicy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9745be2-d4c5-425e-ff27-08dce1342d64
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 09:42:19.9056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+f554PcW6wE4moAObR6xziv7Xho8HoxkjiLTG+AhrXdTEAAv5Z01FN7ZUyAHlX1psXytU0lJfCCiixSjnmC9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7520
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

Hi Vinay

On 9/27/2024 5:53 AM, Vinay Belgaumkar wrote:
> Define PMU events for GT frequency (actual and requested). This is
> a port from the i915 driver implementation.
> 
> Following PMU events are being added-
> 
>    xe_0000_00_02.0/actual-frequency-gt0/              [Kernel PMU event]
>    xe_0000_00_02.0/actual-frequency-gt1/              [Kernel PMU event]
>    xe_0000_00_02.0/requested-frequency-gt0/           [Kernel PMU event]
>    xe_0000_00_02.0/requested-frequency-gt1/           [Kernel PMU event]
> 
> v2: Checkpatch fix, moved timer code to this patch
> v3: Fix kunit issue
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c        |   2 +
>   drivers/gpu/drm/xe/xe_pmu.c       | 218 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pmu.h       |   2 +
>   drivers/gpu/drm/xe/xe_pmu_types.h |  22 +++
>   include/uapi/drm/xe_drm.h         |   5 +
>   5 files changed, 249 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 7a190c49c573..796b330ffd62 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -929,6 +929,8 @@ int xe_gt_resume(struct xe_gt *gt)
>   
>   	xe_gt_idle_enable_pg(gt);
>   
> +	xe_pmu_resume(gt);
> +
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>   	xe_gt_dbg(gt, "resumed\n");
>   
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index b1b38d245e00..39bae25a92ed 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -63,6 +63,12 @@ static unsigned int other_bit(const u64 config)
>   	case XE_PMU_RC6_RESIDENCY:
>   		val = __XE_PMU_RC6_RESIDENCY_ENABLED;
>   		break;
> +	case XE_PMU_ACTUAL_FREQUENCY:
> +		val =  __XE_PMU_ACTUAL_FREQUENCY_ENABLED;
> +		break;
> +	case XE_PMU_REQUESTED_FREQUENCY:
> +		val = __XE_PMU_REQUESTED_FREQUENCY_ENABLED;
> +		break;
>   	default:
>   		/*
>   		 * Events that do not require sampling, or tracking state
> @@ -79,6 +85,22 @@ static unsigned int config_bit(const u64 config)
>   	return other_bit(config);
>   }
>   
> +static u32 config_mask(const u64 config)
> +{
> +	unsigned int bit = config_bit(config);
> +
> +	if (__builtin_constant_p(config))
> +		BUILD_BUG_ON(bit >
> +			     BITS_PER_TYPE(typeof_member(struct xe_pmu,
> +					   enable)) - 1);
> +	else
> +		WARN_ON_ONCE(bit >
> +			     BITS_PER_TYPE(typeof_member(struct xe_pmu,
> +							 enable)) - 1);
> +
> +	return BIT(config_bit(config));
> +}
> +
>   static unsigned int event_bit(struct perf_event *event)
>   {
>   	return config_bit(event->attr.config);
> @@ -107,6 +129,10 @@ config_status(struct xe_device *xe, u64 config)
>   		if (xe->info.skip_guc_pc)
>   			return -ENODEV;
>   		break;
> +	case XE_PMU_ACTUAL_FREQUENCY:
> +		fallthrough;
> +	case XE_PMU_REQUESTED_FREQUENCY:
> +		break;
>   	default:
>   		return -ENOENT;
>   	}
> @@ -169,6 +195,12 @@ store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
>   	pmu->event_sample[gt_id][sample].cur = val;
>   }
>   
> +static void
> +add_sample_mult(struct xe_pmu *pmu, unsigned int gt_id, int sample, u32 val, u32 mul)
> +{
> +	pmu->event_sample[gt_id][sample].cur += mul_u32_u32(val, mul);
> +}
> +
>   static u64 get_rc6(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> @@ -214,6 +246,7 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>   {
>   	struct xe_device *xe =
>   		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
>   	const unsigned int gt_id = config_gt_id(event->attr.config);
>   	const u64 config = event->attr.config;
>   	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> @@ -223,6 +256,18 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>   	case XE_PMU_RC6_RESIDENCY:
>   		val = get_rc6(gt);
>   		break;
> +	case XE_PMU_ACTUAL_FREQUENCY:
> +		val =
> +		   div_u64(read_sample(pmu, gt_id,
> +				       __XE_SAMPLE_FREQ_ACT),
> +			   USEC_PER_SEC /* to MHz */);
> +		break;
> +	case XE_PMU_REQUESTED_FREQUENCY:
> +		val =
> +		   div_u64(read_sample(pmu, gt_id,
> +				       __XE_SAMPLE_FREQ_REQ),
> +			   USEC_PER_SEC /* to MHz */);
> +		break;
>   	default:
>   		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>   	}
> @@ -252,6 +297,144 @@ static void xe_pmu_event_read(struct perf_event *event)
>   	local64_add(new - prev, &event->count);
>   }
>   
> +static u32 frequency_enabled_mask(void)
> +{
> +	unsigned int i;
> +	u32 mask = 0;
> +
> +	for (i = 0; i < XE_PMU_MAX_GT; i++)
> +		mask |= config_mask(__XE_PMU_ACTUAL_FREQUENCY(i)) |
> +		config_mask(__XE_PMU_REQUESTED_FREQUENCY(i));
> +
> +	return mask;
> +}
> +
> +static bool
> +frequency_sampling_enabled(struct xe_pmu *pmu, unsigned int gt)
> +{
> +	return pmu->enable &
> +	       (config_mask(__XE_PMU_ACTUAL_FREQUENCY(gt)) |
> +		config_mask(__XE_PMU_REQUESTED_FREQUENCY(gt)));
> +}
> +
> +static void
> +frequency_sample(struct xe_gt *gt, unsigned int period_ns)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	const unsigned int gt_id = gt->info.id;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	bool device_awake;
> +	int ret;
> +	u32 cur_freq;
> +
> +	if (!frequency_sampling_enabled(pmu, gt_id))
> +		return;
> +
> +	/* Report 0/0 (actual/requested) frequency while GT is suspended. */
> +	device_awake = xe_pm_runtime_get_if_active(xe);
> +	if (!device_awake)
> +		return;
> +
> +	if (pmu->enable & config_mask(__XE_PMU_ACTUAL_FREQUENCY(gt_id))) {
> +		u32 val;
> +
> +		/*
> +		 * We take a quick peek here without using forcewake
> +		 * so that we don't perturb the system under observation
> +		 * (forcewake => !rc6 => increased power use). We expect
> +		 * that if the read fails because it is outside of the
> +		 * mmio power well, then it will return 0 -- in which
> +		 * case we assume the system is running at the intended
> +		 * frequency. Fortunately, the read should rarely fail!
> +		 */
> +		val = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
> +
> +		add_sample_mult(pmu, gt_id, __XE_SAMPLE_FREQ_ACT,
> +				val, period_ns / 1000);
> +	}
> +
> +	if (pmu->enable & config_mask(__XE_PMU_REQUESTED_FREQUENCY(gt_id))) {
> +		ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
> +		if (!ret)
> +			add_sample_mult(pmu, gt_id, __XE_SAMPLE_FREQ_REQ,
> +					cur_freq,
> +					period_ns / 1000);
> +	}
> +
> +	xe_pm_runtime_put(xe);
> +}
> +
> +static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
> +{
> +	struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	u64 period = max_t(u64, 10000, NSEC_PER_SEC / FREQUENCY);
> +	unsigned int period_ns;
> +	struct xe_gt *gt;
> +	unsigned int i;
> +	ktime_t now;
> +
> +	if (!READ_ONCE(pmu->timer_enabled))
> +		return HRTIMER_NORESTART;
> +
> +	now = ktime_get();
> +	period_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
> +	pmu->timer_last = now;
> +
> +	/*
> +	 * Strictly speaking the passed in period may not be 100% accurate for
> +	 * all internal calculation, since some amount of time can be spent on
> +	 * grabbing the forcewake. However the potential error from timer call-
> +	 * back delay greatly dominates this so we keep it simple.
> +	 */
> +
> +	for_each_gt(gt, xe, i) {
> +		if (!(pmu->active_gts & BIT(i)))
> +			continue;
> +		frequency_sample(gt, period_ns);
> +	}
> +
> +	hrtimer_forward(hrtimer, now, ns_to_ktime(period));
> +
> +	return HRTIMER_RESTART;
> +}
> +
> +static bool pmu_needs_timer(struct xe_pmu *pmu)
> +{
> +	u32 enable;
> +
> +	/*
> +	 * Only some counters need the sampling timer.
> +	 *
> +	 * We start with a bitmask of all currently enabled events.
> +	 */
> +	enable = pmu->enable;
> +
> +	/*
> +	 * Mask out all the ones which do not need the timer, or in
> +	 * other words keep all the ones that could need the timer.
> +	 */
> +	enable &= frequency_enabled_mask();
> +
> +	/*
> +	 * If some bits remain it means we need the sampling timer running.
> +	 */
> +	return enable;
> +}
> +
> +static void __xe_pmu_maybe_start_timer(struct xe_pmu *pmu)
> +{
> +	u64 period = max_t(u64, 10000, NSEC_PER_SEC / FREQUENCY);
> +
> +	if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
> +		pmu->timer_enabled = true;
> +		pmu->timer_last = ktime_get();
> +		hrtimer_start_range_ns(&pmu->timer,
> +				       ns_to_ktime(period), 0,
> +				       HRTIMER_MODE_REL_PINNED);
> +	}
> +}
> +
>   static void xe_pmu_enable(struct perf_event *event)
>   {
>   	struct xe_pmu *pmu = event_to_pmu(event);
> @@ -263,6 +446,11 @@ static void xe_pmu_enable(struct perf_event *event)
>   
>   	spin_lock_irqsave(&pmu->lock, flags);
>   
> +	/*
> +	 * Start the sampling timer if needed and not already enabled.
> +	 */
> +	__xe_pmu_maybe_start_timer(pmu);
> +
>   	/*
>   	 * Update the bitmask of enabled events and increment
>   	 * the event reference counter.
> @@ -403,6 +591,8 @@ create_event_attributes(struct xe_pmu *pmu)
>   		const char *unit;
>   	} events[] = {
>   		__event(0, "rc6-residency", "ms"),
> +		__event(1, "actual-frequency", "M"),
> +		__event(2, "requested-frequency", "M"),
>   	};
>   
>   	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> @@ -617,6 +807,30 @@ void xe_pmu_suspend(struct xe_gt *gt)
>   	spin_unlock_irq(&pmu->lock);
>   }
>   
> +/**
> + * xe_pmu_resume() - Restart the timer if needed
> + */missing kernel-doc format

Thanks,
Riana
> +void xe_pmu_resume(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->base.event_init)
> +		return;
> +
> +	spin_lock_irq(&pmu->lock);
> +
> +	/*
> +	 * Re-enable sampling timer when GPU goes active.
> +	 */
> +	if (pmu->active_gts == 0)
> +		__xe_pmu_maybe_start_timer(pmu);
> +
> +	pmu->active_gts |= BIT(gt->info.id);
> +
> +	spin_unlock_irq(&pmu->lock);
> +}
> +
>   /**
>    * xe_pmu_unregister() - Remove/cleanup PMU registration
>    */
> @@ -635,6 +849,8 @@ void xe_pmu_unregister(void *arg)
>   	pmu->closed = true;
>   	synchronize_rcu();
>   
> +	hrtimer_cancel(&pmu->timer);
> +
>   	xe_pmu_unregister_cpuhp_state(pmu);
>   
>   	perf_pmu_unregister(&pmu->base);
> @@ -678,6 +894,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
>   	int ret = -ENOMEM;
>   
>   	spin_lock_init(&pmu->lock);
> +	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> +	pmu->timer.function = xe_sample;
>   	pmu->cpuhp.cpu = -1;
>   
>   	pmu->name = kasprintf(GFP_KERNEL,
> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
> index 17f5a8d7d45c..fb6e3819d7bc 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.h
> +++ b/drivers/gpu/drm/xe/xe_pmu.h
> @@ -16,12 +16,14 @@ void xe_pmu_exit(void);
>   void xe_pmu_register(struct xe_pmu *pmu);
>   void xe_pmu_unregister(void *arg);
>   void xe_pmu_suspend(struct xe_gt *gt);
> +void xe_pmu_resume(struct xe_gt *gt);
>   #else
>   static inline int xe_pmu_init(void) { return 0; }
>   static inline void xe_pmu_exit(void) {}
>   static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>   static inline void xe_pmu_unregister(void *arg) {}
>   static inline void xe_pmu_suspend(struct xe_gt *gt) {}
> +static inline void xe_pmu_resume(struct xe_gt *gt) {}
>   #endif
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> index 1213d2a73492..f4cf85d72aac 100644
> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -13,6 +13,8 @@
>   enum {
>   	__XE_SAMPLE_RC6,
>   	__XE_SAMPLE_RC6_LAST_REPORTED,
> +	__XE_SAMPLE_FREQ_ACT,
> +	__XE_SAMPLE_FREQ_REQ,
>   	__XE_NUM_PMU_SAMPLERS
>   };
>   
> @@ -23,6 +25,8 @@ enum {
>    * current state.
>    */
>   enum xe_pmu_tracked_events {
> +	__XE_PMU_ACTUAL_FREQUENCY_ENABLED,
> +	__XE_PMU_REQUESTED_FREQUENCY_ENABLED,
>   	__XE_PMU_RC6_RESIDENCY_ENABLED,
>   	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
>   };
> @@ -116,6 +120,24 @@ struct xe_pmu {
>   	 * @sleep_last: Last time GT parked for RC6 estimation.
>   	 */
>   	ktime_t sleep_last[XE_PMU_MAX_GT];
> +	/**
> +	 * @timer: Timer for internal Xe PMU sampling.
> +	 */
> +	struct hrtimer timer;
> +	/**
> +	 * @timer_last:
> +	 *
> +	 * Timestmap of the previous timer invocation.
> +	 */
> +	ktime_t timer_last;
> +	/**
> +	 * @timer_enabled: Should the internal sampling timer be running.
> +	 */
> +	bool timer_enabled;
> +	/**
> +	 * @active_gts: GT active mask.
> +	 */
> +	unsigned int active_gts;
>   };
>   
>   #endif
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 3ef3926551dd..1f0ddbd77838 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1399,7 +1399,12 @@ struct drm_xe_wait_user_fence {
>   #define __XE_PMU_OTHER(x) ___XE_PMU_OTHER(0, x)
>   
>   #define XE_PMU_RC6_RESIDENCY                    __XE_PMU_OTHER(0)
> +#define XE_PMU_ACTUAL_FREQUENCY			__XE_PMU_OTHER(1)
> +#define XE_PMU_REQUESTED_FREQUENCY		__XE_PMU_OTHER(2)
> +
>   #define __XE_PMU_RC6_RESIDENCY(gt)              ___XE_PMU_OTHER(gt, 0)
> +#define __XE_PMU_ACTUAL_FREQUENCY(gt)		___XE_PMU_OTHER(gt, 1)
> +#define __XE_PMU_REQUESTED_FREQUENCY(gt)	___XE_PMU_OTHER(gt, 2)
>   
>   /**
>    * enum drm_xe_observation_type - Observation stream types
