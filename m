Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E05FD73E83
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 21:13:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E836F10E8E9;
	Thu, 29 Jan 2026 21:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJxATr3b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3D310E8E9
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 21:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769721207; x=1801257207;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8w7Cu0VPvTaaYEIdWLF2WLM5WNyfhg67apsuHZ/COLw=;
 b=lJxATr3biT6d5kDlFM9QC0b375DOHReN+eOE7iUdFZBZYO/dO6hd9MWr
 MAhOximp6LqjAotIGQqeD3WGj+iCkuJFDsQKrqXfck77Mu214ugvWIFZa
 ycQRd05S/85axv+qwYl95tkS8X78P+OXcrxYTFc8YRmIFZ7HXlB2DGAbb
 bjhh3hsjz13fp4GCdz9gSjhT35vCBO9h+OJJkZ5M5vwYv48sI2x9Ak7KQ
 HEMdzrjMhr7eVB5Hhzz1nBfuJCj1iOCDSF34Y6Obi+DePvbMM4IEPfcp3
 SvInHGLAEPhDCOHoHyRBmWoadR8mRBc/i2OYEaEyoC3jvbzkpMDEHDT4G g==;
X-CSE-ConnectionGUID: U5NcM9dVSE2DkGlaKJC7iQ==
X-CSE-MsgGUID: t8jx6mE2SiauDPS+zuqMtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88546387"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="88546387"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 13:13:26 -0800
X-CSE-ConnectionGUID: arWWvjZLRJeH3iDVtgf3ww==
X-CSE-MsgGUID: +ym+xo3WQZydAVHx9M1i+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="239929357"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 13:13:27 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 13:13:26 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 13:13:26 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 13:13:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOVXRR1VqjUYvh2jqAZfWrf5Sh68gCMaMXP4NBWkeMzN1U4CT0d/LVmyFtUpbipa7HORixkygsBBwTsJEAJuwClJwHrhCc8Z6SWijw2rffOV7i9QhOZ7DvMeIjAapQyeYsLlq8+qDCg1ISdMDHYM/7VxoqGMGaHbMRqcCvAqCxhTq4hiwHhPvU85I5GZojtYmQEdTmfQBDRAk1S568r1qRLrcbP0N3XHs28Eo0s4Q3TC4iD8qr0oCgLCgzd2yGT4X/eAOErKwowfZWyNr1RpSP+vYbQsa1DEiQoKal4wk960vP9BREP7Ovrk09J4XoT888wmOES2+GB641whrErmtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxW2bc1MOFh0S3GiuaGOkk4mCs07TFcxqMkgBeKSoxA=;
 b=sCJZ/y1PeHhiMqAtCJ+VLMhHflh6bZjzj5Riav/1MvA5Af2YryzONEvcptjqr0vXkIlq3BSYBbndPgzs8AtXpHEUM77Qn+HxqmhKofT7qGYTB3u3YKFwVs1Q/0wqWlMXDFdYhYz4O0looxDKrGLdwCEqDF1CYsv8sqkLc4YlsuhGrl3uggAgBM/SuLkxzbPnKoxJGJLlNXogIdIc5fkmlIiEZB7/azrUza+G+MY9CK/mWLorDATYQLhPzw+bw+nlkb1hrSHMxT3/VFp3AYTNexqDaKE1vXCLU6sLvDIDg7MqE7ynlZXwi/sr96wV1X4NPnE0vxA3a7DCtjpSdE9Adw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ1PR11MB6178.namprd11.prod.outlook.com (2603:10b6:a03:45b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 21:13:21 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 21:13:21 +0000
Message-ID: <fc0f819c-0712-4b27-8cb2-38462cfc7381@intel.com>
Date: Thu, 29 Jan 2026 22:13:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Fix Prevent VFs from exposing the CCS mode
 sysfs file
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251128171759.2775650-4-naresh.kumar.g@intel.com>
 <20260129172246.1106097-4-naresh.kumar.g@intel.com>
 <20260129172246.1106097-5-naresh.kumar.g@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260129172246.1106097-5-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ1PR11MB6178:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d7bf7c-f5a2-4ea3-84a1-08de5f7b3af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWlkTWRnTUxwaC8vZlEyR1gwUnphdW1yQ3pYcVdhT0F6MFR3bU5LdjBPY016?=
 =?utf-8?B?aFlIa2dRaVg5aHN1NWJUcjRmN1Qvb1lJczVpWkZ2cEhxY1FaVitVVW5wQ1Jv?=
 =?utf-8?B?NTNGVFR3bGxXQU03d2tUWTB0Z3NkcE1oRVIrWUR1MFMvQjNqMVY0d2dBTnVZ?=
 =?utf-8?B?dTlSME9RZ015ZmJQTnRTUFBYRktOVXpiVTI0RkRNVnRuWXRzbTdGSXk1TGlM?=
 =?utf-8?B?bUhreGQrVXlLS21WWHliQ3E2MHlqcFI5MDNNODM0V1l6cG1kYjluYzA5VVJM?=
 =?utf-8?B?RWVaa2Eydjl2aHlKekIvUERUN2t1bVdVL3pjUk50T3haSkErR3FzcFVkYmJF?=
 =?utf-8?B?YXc4ODJMb0dWalZ6NFhjUEEwRlVwTEJJQklLalRNU3I0TVd6MVl5VFYvNUE1?=
 =?utf-8?B?eWRITGJrczhNdDRoUHFUeCtZU29SU21tN3A0SDAyU0xFN1NJWG1NWnJ5Zytt?=
 =?utf-8?B?SEZqVS9Sa2VjUFVZTVdzVVBsc295Rkl6WVdFaFVBcWZTRGcxeG1OK2pGYlYz?=
 =?utf-8?B?YnNBQ3drKzdoeStyMzFYNHpxR0NHQ09ad0FXcWVXSHZRcldOZndvUk9LODI3?=
 =?utf-8?B?STBmeHJRVFhQYVNOd0xQWW5WTXJaQWtTekIzRm1jNjQ1cHpXWm9hRk0wMVlm?=
 =?utf-8?B?UXFIZFViMmFGaGxqeC9Ia2R2YWZ2QTZhK0RZR3ZFc2RPUTB1LzF4d1B5TDFN?=
 =?utf-8?B?VGVFeTJYUEN6YnkyR1F4bFR3K0pjeERIMUE2aTJFUW9YWituazBwZ1lQUUsw?=
 =?utf-8?B?V1hXY2FCdHlrSXBGNnovR1ZPUExwazdlc0g0NVFCRGJnSm9RTHpoV2xobDg3?=
 =?utf-8?B?ZHIxMTRzTHdJV3dsWjd1ZHNJK1pKSzhhd2hRcnBJUVpEQlZtMjlaaEpYdVBP?=
 =?utf-8?B?SVkyTHQ5UlUzZVUzRjNWbGM4MmN5TmhzNkZGYWhhdmF5N0hoeVZMeWxpTFM0?=
 =?utf-8?B?blhSWThZcVBtZjIwY1dCSnVuYlpOZmVlOVdSMmErUzFZQ0l4OEVCVFVjS05p?=
 =?utf-8?B?MFh6NEJwVWZsQnFGSW0wbGd5Wk0wVC8xTWdsL0lYKzlzZDdJVE95Q0hGZkV4?=
 =?utf-8?B?WktJWXZhb1VkbDlBdG1SRXV6QjgwMkdNNnpmcFhqMWRPWUJRVWdzZXlqVCsw?=
 =?utf-8?B?TnFZR1cwcWJjV0t0TWZVTzMxbjJhNTRUV0pkQlNEaWIyRzdKS1lrUVhrbi84?=
 =?utf-8?B?NmdsWTNIN1haaVpVV094RjNoQm8vZ2M1eGZUQlBUSnRZR2ptcDZIdDhTQ3h6?=
 =?utf-8?B?RFA2LzF5WFg5V0dJV3ZuOGRKN3EzOW5WazBJNE9EWnV2T0hxQ2FreGFlQ3d1?=
 =?utf-8?B?eDYzK1YyU3hyYU9rVzNub3FSeXN3QUR0Q3JWeEhLc05JSlVGRXMwOGpXcnFo?=
 =?utf-8?B?NUVBMmJQajNpREhSMi8yWG1lSFNHMUE4V3VYUE51M0U2b0JyYlgvbDNVaFhQ?=
 =?utf-8?B?UFhNNGUzQklZQlpzdGhnMlRMRlRQakRyV3RJVC9BTXI4aDdzM016SWI1WXBm?=
 =?utf-8?B?L1hMbVlqckRMVGFhZ3BYL296RkM0ZTNLNnVRbjVLSDNVYnB5R1lkcVRqdnlD?=
 =?utf-8?B?cGxVMVZTTm5vMFFaNUFVcjNGK0JkS2l4ZWV3WUlEbGpuTDNHQ2ZCRlRaVzdR?=
 =?utf-8?B?Mkt1SGU5T2FNaGFpTmx2U1JpUnhmTUY0Z3VuSFRVNkpoZmE3bUg3a2NxRDV3?=
 =?utf-8?B?bnBTQTRxcWxGc25EWEhPYUhjdDFvT1N2OTFtK3VwZmpyWDZmL1UvbWM4QTgz?=
 =?utf-8?B?OHJ5SEYyYXR0WjE2dWNJdmtTV0hrd1U3QXNmYWkzcm1XMDNySE50bzhIcHFT?=
 =?utf-8?B?UFdrR2dWR2VNcGJFaUNITjBsSU80WEJ3SEJYS2lpZFVMa2hIOW1JVHJVOFhF?=
 =?utf-8?B?cjNBS01YSmhGM0Q4Ry80SEorS2FsQjZCU3JtdXVoK09ucGVMclNNbHNsdXNs?=
 =?utf-8?B?bWhxbmhiRDNkWkRtSW0xSy9KR29wcitsbEtQZnUrWEcxMHp4YjZFSEEzRVE1?=
 =?utf-8?B?TXFCSVQxaFpDakFmb2UrL2J0dDJnWEJ1d2dNUENxQ2xkVVMveGhKVXJta3pm?=
 =?utf-8?B?SzI3VTk3UUVreVFyQitmZFlBaFczUzVhV2hvdktqSnpGNXhYWExzQTEzTlo2?=
 =?utf-8?Q?0mng=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWZtMU9NZjBobkppMmwzb2JhNmtRcWp0ZEFZUUprVG41YkJEdkVYRCtvUlY2?=
 =?utf-8?B?OEUrSGIxdE9yYnM2MVBXbUhraUdVK2M2dFk3dHNTcnV2QTI4Z3ZBV0wreWZy?=
 =?utf-8?B?YmpJMExveWN0SHJZck1tZVJPb2p2S2NoaHBGZVhrQW4xUldoamNpV2dKSDQ4?=
 =?utf-8?B?VVJCT3BGN0JHTy9MMk9yMUxKWFN1a3RSU2x3NktPVXVJRG5xZlhmdzNQaTNs?=
 =?utf-8?B?SmlST25kSTdhSEQycVcya2JudWtCeStTa0ZMQWo4OU01UWhSOEN2VjY3ZlJ3?=
 =?utf-8?B?ejFXdnUrdDZsU1Q4bkFENytyN3NMSnJPOWFSejdOWDVvTVd4bnh0VnVrZy84?=
 =?utf-8?B?ZkNsbHJkWGVOT2xwU1diRGZpS0FHbkxrZDYzV2pkVTZUQlplZERORXc0SHdD?=
 =?utf-8?B?dFFxSTNFWU1Dc204UCs2dWpnR3dObmFsTFBWbWdTY2t0VzhMenR0VGxBbDZ1?=
 =?utf-8?B?TWNOVWJodVpENlFxMG9sVUFJbE4wZXpBbzdKYXlrS1dXOFVNNGVhY2p4bHJF?=
 =?utf-8?B?bnVwRVROMmRKU1NacXJXYlJRb2hUU3dJZnp5VnBQZE5JckUzUXBRUFJmSllH?=
 =?utf-8?B?Y2FzbnFyempkay9GTE1sUzRSVS9Xc3VnV1NUWm5MNGtMWUt4ckxGZTJrbWhU?=
 =?utf-8?B?SjFmU29NcDRacXA4dHB3QjZjN25tMmJJMmMzNGIxR093OEs4RzBBcWlwaWN1?=
 =?utf-8?B?eVRBTDBPdm9BcE02ZjRMMWlUUFpwTy9HUHV0eC9PbDRBTlRCTS9XMTkyQnlI?=
 =?utf-8?B?R3ZVbHZQU3JMSVNZTlNtRlNOZXNLL3I0M2tqNTZKbjZHaDErbmFaRW5yYWVz?=
 =?utf-8?B?TDZxNzZudDhseW5WMGdSV0lwNGtoUkVUa280eG9xVUVIdnFqd0hnNms3VUs0?=
 =?utf-8?B?cDVVZlJ1dklpbDlhZFpjdm9EUS9VQ0hVTGljbTJIMFRrak5zTkl2RjYvNGpl?=
 =?utf-8?B?eHVxVW9UWXJHNHVRdnEyWkIvUE9ZVVBkWVBURTQ4WGQyNjRaTGpaOUFYRWJF?=
 =?utf-8?B?VFdSSEdFcnMvTmZnWHNOSVQ1amRxMDBQV1VOS2tVUEx5MWg0NE1IUUdZQ2Yx?=
 =?utf-8?B?Z3hSbkJ2eUhGWit5Vkd2b0xmMEI3MFZRZ3JjSG5lOUorQVppZHYyNXNSZnRO?=
 =?utf-8?B?UFFQQXNPenRwZVVhdU1MdWxkT0g5Uml4WitTRTh6ZFpXVExqcy9pNDRrUzR3?=
 =?utf-8?B?dEYrWEIzRnB4Rkl4WDVISnAwM3hWMGFwc2l4aTArQjN5UTNHb0NISXk2TEVm?=
 =?utf-8?B?eTVJTVh4dFBHdzNveXBhc25palBTTG56VVliWEg0cnduc25XbGhWWnorNUhK?=
 =?utf-8?B?V2hDZU53TmhjU0dGdkhFY3pwaURRNlFsNlZtamM1b2hGS0NPSzB0WC96Z3ls?=
 =?utf-8?B?YkV5dWp5OWVTUlNDV2tXOElLekdYRlNaeldyRVVaRjFzYm5YT3RwMXpnTDNI?=
 =?utf-8?B?bis0Y0hJV1Y1TGRLOHNQYmZjUFhXWWtkSHlDVWYwemdOcjZBVjhRQ3FuMVlU?=
 =?utf-8?B?Z3pjdDZDUWRqbSs4TlRNRkxUK0dVNEd3SytGcGhEeW5BT2p3UzltNTIxY2w4?=
 =?utf-8?B?VlFlVkVNN0o5dTBuSTczTmVBN1ZhWGQ5TUViZFNQenJ0WExoUms3eGR1Qk1v?=
 =?utf-8?B?ZVFndjhlR1pKZWRqWE9wcSsxR21GbjlzV2JyY09kcEg2dXNtbHRBc055VC90?=
 =?utf-8?B?eWZNVVlzUEk3b0p6ak1SZ21uMTQ1c2RIeFAyYUhXY0lEQVhyUVVFdFQzdW1s?=
 =?utf-8?B?b0l1UnozYVhzRWV3RktRMEljTGJYRXNxZWVNMU9xM1NYb01oZkkxdmQvTHQy?=
 =?utf-8?B?bGxweGRsSitWYm1OY1N4eURkaFNaQmx3TG9rTStVa0VLaEVQWWpDRHNCWkpL?=
 =?utf-8?B?MVJMWHJna3FBckdxUi92OU53ZnNVbXNGSW1IYlJLVlczNEE0cHFiMTJ2RlE1?=
 =?utf-8?B?cFM4OS8ycWZJcHNsMnNqZzh5T0doV3hYajVNRU9NUGlKUnBzQlp0a0FibDUr?=
 =?utf-8?B?RSszNDAyYmFFWkVsZWxvZlJmY3M0MlMzWGErUVJnTkp0Y1liTGUrWXlzTWdG?=
 =?utf-8?B?Qk5YS09MMEFtSWRLSmFhSEhRb3BjamhxeUZYcTg3WmtHQTdHSm5hZkZPYjlz?=
 =?utf-8?B?WjE5d2x5RmZFWEEvd3BIRFVLdytKbDNrMjFTNWwzQlh6cVdGbW56YTkrZXlC?=
 =?utf-8?B?VUc5MTN1bU1YblNNSFcyVXYvWEQzdTNuamRKaENTOWhMeDkvL1JTYTJVZzNk?=
 =?utf-8?B?UDh3YjZRWTRvTWUzUWVqSW1GMWg0YlBjUXNmUFl6WGJ0bVdIR2hiNHI1bU5S?=
 =?utf-8?B?dXBndGd4TzVyRVJZQVBUcWIxMVRPVE9ZUUdHdlhlcmlDakZhK2ZvQU9uY3JI?=
 =?utf-8?Q?Ve553fs0ZAMnVq5I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d7bf7c-f5a2-4ea3-84a1-08de5f7b3af5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 21:13:20.9451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ON5AzB/0BNmJ5XQLE5kagusqVkim+PKxvfRbmlPL7NakfGLvCnixj2u23js10JztfUuekiJ9DvZlxw+4kcOjzOmn0m2qbrN5x0fgrUxk/wQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6178
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



On 1/29/2026 6:22 PM, Nareshkumar Gollakoti wrote:
> Skipping creation of sysfs file in VF Mode to ensure VFs do not expose
> CCS mode changes
> 
> Fixes: f3bc5bb4d53d2 ("drm/xe: Allow userspace to configure CCS mode")

shouldn't this be

Fixes: 97fedf015cd9 ("drm/xe: Use fixed CCS mode when running in SR-IOV mode")

or since it wasn't really broken, maybe we need no Fixes tag at all?

adding maintainers to confirm

> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index 50fffc9ebf62..e146e00b0ca2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -191,7 +191,7 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
> -	if (!xe_gt_ccs_mode_enabled(gt))
> +	if (!xe_gt_ccs_mode_enabled(gt) || IS_SRIOV_VF(xe))
>  		return 0;

I guess there should be no users on VFs that would like to read it back
(as CCS mode was/is always fixed/const for VFs), so this fine,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

>  
>  	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);

