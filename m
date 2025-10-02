Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2B0CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 21:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3EF10E858;
	Thu,  2 Oct 2025 21:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAZN1ijj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B22810E858
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 21:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759441847; x=1790977847;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kill00P32g2D08+65smtDjcO8PGMu44XuTI2+um/oEI=;
 b=fAZN1ijjN4/KH5syboZAsCn5nv5zv9le9RnUAHhfRWhKFIiPpvRiMYP9
 Yebp9uxl/W0SPoKzd48aK8NEJ8xhWK+HH+H8xAXYdwdiVXYjkdxb0YkWq
 D0JmaugApjaHMhcJZu4Mfv0SUi3AWAT8lttpm4xk83h4a9j3anEi9+Zsa
 Zx7BEgMqb2DhGoJzVaAt7C3bVY0zWZLnm+T5gJBZLkHUc252wZgUZthj2
 ArqilUpIB76dAIMwt3kD/GpAzHthiZ0lXrD9K8K/GXhxTBQsjMB/HO67S
 zYLY2kWJcJ7ht1lm3iRODlW+vAPPLqCtFzt8ffn46hYMZn8896LOtJK7S A==;
X-CSE-ConnectionGUID: wS1dquwXQyaVBCZlQ3hMpg==
X-CSE-MsgGUID: /twgQZ4zT4C8UbBrAsxuUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61896198"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="61896198"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 14:50:47 -0700
X-CSE-ConnectionGUID: h75Y994EQkG/aaiVNy/qFg==
X-CSE-MsgGUID: jeMwC6k3Qvmmu33L9H6zpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="216262481"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 14:50:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 14:50:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 14:50:46 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 14:50:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsGUScwbJq+2KFYb9xKzJhj5sfsjLGdoWjTqGagJd1OlDfquOL4XKq2ejwC1qFoj1hvVeXqW8t4gVG+r7liQj/gyRCLJhAWmKurXKd2wQx0uixyJJW/zVPbBUDyy1+b292C1jYH1hoav/T2dNo7ZXNhe7IGfnjcjnWIzjqqu5ev2DmDIFJO6kqHiSp9mUP4wyHROg65GNOIYvyjRrmZ3uh0jtXkN7y9c40TbcCdP2drwPTKBaY8p6d4xhKeUPc5776b36M+CmTae/y3xHmyEpBqZ+IjFcJWcDVZS43XtKgHPY8W91119mcgPSQ34+xBVvhpZ3Yl8GEilzoD251L/Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13ztZCoc4zheAOXouv9+1wTKs5B90tTy+ALuxmdykEU=;
 b=oZOsR6p2YSac9k/dJ5FBo/neEqUf2/Y0Xns/DpNRGoON+PtKvGQO8HQQuq5llC5vhCiKb125CbH56OkWM+T9JI6dPwZhn1Ki4kcR+uePO1UTf6jZANkX0PothR5SMSV3xcvC6450nwXChB8a57OhgyoTIWv+0L9SutSVCeOP6ZGBqWmhDswiwuZ9mtO/BB3RUynvty72uRJ2mJOEqD3LJB/GexCd+YuG6IZb8W3kIfVyeF8Ru7vS3LnEYt84ua7WEsf4rMgQeMdgQx10ipfUTMtsi2c42F6e/K8TqGceNrHquplPyySE8ZxJB1jltmZsvqurPsq/bkmpbYZnbDU/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Thu, 2 Oct
 2025 21:50:44 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Thu, 2 Oct 2025
 21:50:44 +0000
Message-ID: <4a8fbc94-92cb-49d0-9c93-d4e6d4c0202a@intel.com>
Date: Thu, 2 Oct 2025 23:50:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 24/34] drm/xe/vf: Start CTs before resfix VF post
 migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-25-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251002055402.1865880-25-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DM4PR11MB5310:EE_
X-MS-Office365-Filtering-Correlation-Id: b574dd31-94dc-4f9a-5e35-08de01fdbce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHJWejRxc2VVMHZ1V1Q5a09XUC8rWlZkTk45Z3lLMDFMcjdzajhFQ2NBTXl2?=
 =?utf-8?B?RFBLT1l0elBRYS9Mb0JPNHAxbDNmWGQrZXFmQlR3QVAxZFl4bzRseFVnRmRC?=
 =?utf-8?B?OE53Z2M2OFR0OXV5ZmlrWnV4KzRmaTQrU3IzL1JNOWh1ZG5vcS83d09oS0d1?=
 =?utf-8?B?OVVZbnN6RTBSdXA4R21XUTViRWcrNzVuSFBlUVJpckxLZ2lHazArT1N0eERJ?=
 =?utf-8?B?ZVFtcWwyL1AzNmlmNjBCMnB2d2dNQUJEdVVrbGZSSkdSVGltbDR4dStKeFdT?=
 =?utf-8?B?dDdsVER4NkRwa0tGUWl6dGRkSlF4M3BSbUpTeXA1N3lSSnVLd3ZFcm9RS1N2?=
 =?utf-8?B?OGZSOVorc3NvMm5oK3dRdDMxS1BqY0lQamxaOFE1eHR1VnNnMHBjTFM5UC9C?=
 =?utf-8?B?YVJhZDUzZzZoYVZJNHBNb1VQWmRXb0VnbHAwc01ZQmJxUFNhZFF5amRrOEk0?=
 =?utf-8?B?a252Ujl2NXRDNnYxRDJ5NG4zUzBwdWxqaUdlbUxMckU5VHF4Z0ZYemNycDM2?=
 =?utf-8?B?QnlkdVVLVVhJVGcyR1NCOGUzZG9JQm1mSWZPY09zYkpZUTdYdlY2TWtPWENm?=
 =?utf-8?B?cXh0aENKOElOeEh3V01Ob2VMNzZZN2ZQbVJRQXlGSk5Nam9rekFscExZOTlH?=
 =?utf-8?B?VGVPcjhLaEdQekorZ3RoQXdJSnczeDN3eEtyYjhDWFlBR0xXbUd2NFBoU3pa?=
 =?utf-8?B?bEpldTVtVEF6VlNwamhMNVFyZGhQbWtOQnNNbGV5YjQ3aWJwakRIOU5wSUgv?=
 =?utf-8?B?enRCRHFON2VJdW55OHVGc0hWZ2lVb1ZGZ0dmT0lLcUhsN09UMG0vVysvYjlR?=
 =?utf-8?B?UGowaDdPSS8vaWIrSnhaQlZoYmpLRDVuSlBtTmVMT1ZkQTNkTnFUUXFWUkM4?=
 =?utf-8?B?QnZkWUlvYmpJM1ZuUmVyM3k2akxMeEN2c0hyUm1aNEswbTJrbkp5enhyanQ5?=
 =?utf-8?B?em9iaTZabmJCUlJZb1pCNDBXY2hLbmNqQzBEeXdpUlZkMkdmbS9EN1grMkdK?=
 =?utf-8?B?Nm9hRWJZeDhBcC9aVVR2NFdteHBZcmpiMm1kWm9nNVhsMVA2YlNZTEdMTG0r?=
 =?utf-8?B?OFgrUGhZTXloMTkrUG5KWG5nQk1oUnloNFJNbklKc2JhdlBxRGpoNFFxTDIz?=
 =?utf-8?B?OEVnMWdSbkx3Ym56NTFsN3pMNlZMb3J6VU45UHFWalMxM0l3dUJCcDBQbzJZ?=
 =?utf-8?B?NU5qR0tqQ0ZnZ1N1TTYrYkFuc1EzcUdCTXRobWxTTG4vbHhtaXhiMFRoT083?=
 =?utf-8?B?bTg4NFdkK21sWWNJZFhOdkZUd2owRFRZeGM0d2lielljbzRXc0dYeVpTQW9i?=
 =?utf-8?B?ZE1GcjdxQ0QwdElOK3JxRytORmJ5c2dqcHNibjVFRVFZK1pBa1BQNVB3YlNN?=
 =?utf-8?B?MUozbFYxd0NtTDVBQURWa2FlV1RBNGZxSE45UFRPbVpBR3ZhbS9sc2U3UTc0?=
 =?utf-8?B?dHBNTUxsQ01MU3k2RFVvQ3pUUGFzWlN0c2hWTi9SUXZoeGNGRlBMdk9uekdB?=
 =?utf-8?B?ZFhNQjZLWDRFTnVvbU43Mi9EMXBQaTFQcElrSjQvclNRRy9nZUlybnBmRWxX?=
 =?utf-8?B?Qm5rNm5oUUdreUhWcFBwRWpCNzBYWlpRYTF4c2tvcGxSOGxXVXl2WHIwM0JB?=
 =?utf-8?B?VWdWN0JEM1NUOHE5WlYzTlNxQlVYZk44QXV1UzNLWS9YNzcveGFDVTh6eEo5?=
 =?utf-8?B?Q1pJY2Z4eS9ZbmtRUDdTL2NwSnhjVFZRQWZDYXJGOGg2ZHd3UkNMNVYvRFNB?=
 =?utf-8?B?MWFDZjJuL0FIWjFhOFJnTzdTU0NNSFlEa0QzbVd3SVdkSXg4TzFEUFdmVnA0?=
 =?utf-8?B?TStYbWxrVjA0Z0hsSlovS3BTSmFnQnJVSGxnTGxZejlxYkZUeWRKV096dC9q?=
 =?utf-8?B?R3RCMGZWNnJ1VTk3OGJSQ3h5WGhCQjdBck9BYm9Rb20xU1FIcmdTaUlDTXZL?=
 =?utf-8?Q?Tf7HK5VQg9uCPxOZkJR/kIj77Oa9d+LQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHVKQ3BKeWdSaGFCelRMUVlYSS9iRlFmd1U2K09McCtuK2lQdlVOOC94cTVU?=
 =?utf-8?B?OExHaTdnaFBMUHhrMDNxSkVTdHlFd2ZaWWhjbVFrU3diS0JUVWp1NnJCbVZI?=
 =?utf-8?B?UmduOXFOcUx0MG9iUVBCYXJvREo3WWFsYUNXOC8xRGtHek5uUDg2YTBpVmJF?=
 =?utf-8?B?TW5wWnQrWFN6WXZtQjl3MXB4Zy9TSFdhOHBPVmtzU2hzU2xQdlB2RHdYejhN?=
 =?utf-8?B?enNWbmIxdndNdStLU3FRWVpRc2FHUklGcDNrMm5iOXUyNkdLNUp6RE8xT1g2?=
 =?utf-8?B?QTJhRTBPWmFSamNVYm9GR3poa0YzazRldm1JSnM2QUpxWDZ5bEZBSTlORnJS?=
 =?utf-8?B?KytaVFhCVk5DajJoZ2NSSEpCcWlOcHlieWtZNGpNRytLc2hpS2RqcGV2cWc1?=
 =?utf-8?B?eHpVeHhSekZob0p5SDhaWlowak5FTHlDK2E3S004YXB2UW80VDdlUW1WTzB5?=
 =?utf-8?B?T293YVV1TWZ1SG1wWXFWV3lYVVhyS2w0SFdaZjhVN2hRdkR6a2dMaHZjUjJJ?=
 =?utf-8?B?em9MMHNpQjFob1dJM1ZQdG1peklmU3NJT2tZdk9jdXJCZHI0c0VGRlAreldy?=
 =?utf-8?B?KzNrc0lleGpJQlRkcjJoT29HcWh0WVNya1FnMzNVK3VUcVJ1RSs1T0RWYkVI?=
 =?utf-8?B?NEtOMVpyN1I5TXN4cGNHY1lvNWNQaGhMaWFEdlJ2dXF3bm5wYlljYzhYQUxN?=
 =?utf-8?B?YWoxeS96WTlDZlFWdE16K1ZkNXZSRm10ZHNmRGM4TlRwdnYzOGJ0eGhtVXN4?=
 =?utf-8?B?NEppOFAxNjBVbi9WcGp0akRRb1B2eHFGOXZ6ZGpMU2ppT1hKZ0k4SXh2ZHRD?=
 =?utf-8?B?SDB3VENRSFcyOXUzOVpDZmh2QkxtUFBDSm0yVmdTWC9KSzlON3ZQU1pFZjMx?=
 =?utf-8?B?Rlp3T2UyUFVDeml4WkpiVDFIMVdxZ2ZIZFpUR2xML2cvS0l3bUo5ekVrL1R0?=
 =?utf-8?B?NCtjMDkxYTJzR05nRGRQN2wvZXp2V0c4UG9xTnJOa0R1SnB3UThpTFIvK0Q5?=
 =?utf-8?B?TTQrTTkvN0YxemkvWmlLREN3N2NBOGtkczArdk5uOStXSjErZ2FFZ0JOT1cv?=
 =?utf-8?B?R0VIWHhvUzkrWnlXTGpCTWFWWUgyYnhJcVRrcmZxRHRvODBWL2FrK1NqUXZv?=
 =?utf-8?B?dFArVi9ad1hkYVVPa2pDdXlJZE1mYytLM1U2NVl5a2Q2cmt2TXFCR0pzZWpB?=
 =?utf-8?B?VjV5dTNFV3FRVm01UDExdzNoZ01BT0k4TlFGNzBnNjlSZ2hRVk91OWhrV3NH?=
 =?utf-8?B?WjhiYi9QTEordkYvbFpPYWtaRDVub05WVnQwWkJiUDl0SXZiY2V2MzQrR2FH?=
 =?utf-8?B?Y3BUTlNZa2tYZEl6R2RFa1E4eXlsRjducm94TVpwR2ljb1ppQkQ3YzVLcnZr?=
 =?utf-8?B?RnhaeG9ud0x5V2FnclhFdUJQWVJtRXNQQUVDNEJjSVVtUHZDUFF4NGg1NWxl?=
 =?utf-8?B?dEtjZExrNFJGV0tuZGFHRkJNUWwvZUxMbktja1JUS09SdUVzcy9NYnZ0SmFC?=
 =?utf-8?B?OE9JMTV3ZkNoeUM3blFJalZidXlrMTlkUkVpa2NjbUJDZzBFVG9sNFByU0FC?=
 =?utf-8?B?Vk03c1lTalB4cjREeFpMOEtFRXFndkxUKzJLekwyZ1VVYkNBUGQwb2xQdTF0?=
 =?utf-8?B?cjVhcTJaL3hFL294RFRWaFlOL0I5TGZOTm9NbnhmNXZXRmFpYnBuMVc5emY2?=
 =?utf-8?B?dDBYRjBKbEVXRHZVLzR3dkdpYUlYVE5TWU9BdThSS3dON2FyeU5mcjZjK1ZE?=
 =?utf-8?B?a0hFNkovS2RmVVVJYXdNbElPZFAzZTI5STBUcnVqam1BcCt1RnRkMjRiUDNK?=
 =?utf-8?B?QUN6UlJFRTUvR2xCZEF1cVRRaW41U2hyeTVBL3ptS3BSR0FkVERHMHgxWTdL?=
 =?utf-8?B?dzAyakZvcERlZS9YR1p0ZWxNVHlnQlFFRXl5aHMrdWpvanhLZlNNYVA4M011?=
 =?utf-8?B?Q05udVhiVXFKcHF1WFU3SHBtbHV2S3kvUmM0S0wxVFIwc2sybk9nMnlVeHZS?=
 =?utf-8?B?OWxtVVFGdytlWTJCRE5mTGVJZmdYYk9VWldxcktBU256WlVWRjhWU0NEQVhL?=
 =?utf-8?B?QVpEWjVEVDBHOXY2emFsNE5zOVNWOWZUajM1TVRrQ21oZ081aG4vTkM0LzZ6?=
 =?utf-8?Q?q6hBb/ZOPMW9c/s1MLOt2rs3v?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b574dd31-94dc-4f9a-5e35-08de01fdbce6
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 21:50:44.3162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PXaKZVEnJVOYCAfHiK9jIi/kz9He9Aa7SGvnkXHroJW/3Whwnve1fs2fOOXOsqAG3vc7dk95ZW76HsQSdtdCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5310
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


On 10/2/2025 7:53 AM, Matthew Brost wrote:
> Before `resfix`, all CTs stuck in the H2G queue need to be squashed, as

Can we expand the shortcut here to "resource fixups"?

It's ok in patch name, as long as it's expanded here. Otherwise, it 
suggests we're talking about GuC states, as that it their name 
(RESFIX_BLOCKED and RESFIX_PAUSED).

> they may contain stale or invalid data.

maybe more detail:

```

they may contain actions which contain invalid GGTT references or are 
unnecessary after HW change.

```

-Tomasz

>
> Starting the CTs clears all H2Gs in the queue. Any lost H2Gs are
> resubmitted by the GuC submission state machine.
>
> v3:
>   - Don't mess with head / tail values (Michal)
> v4:
>   - Don't mess with broke (Michal)
>   - Add CTB_H2G_BUFFER_OFFSET (Michal)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 +++
>   drivers/gpu/drm/xe/xe_guc_ct.c      | 70 +++++++++++++++++++++--------
>   drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
>   3 files changed, 60 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index c7bd1f6e9dca..55662b9a4f5b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1137,6 +1137,11 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>   	return 0;
>   }
>   
> +static void vf_post_migration_rearm(struct xe_gt *gt)
> +{
> +	xe_guc_ct_restart(&gt->uc.guc.ct);
> +}
> +
>   static void vf_post_migration_kickstart(struct xe_gt *gt)
>   {
>   	xe_guc_submit_unpause(&gt->uc.guc);
> @@ -1188,6 +1193,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>   	if (err)
>   		goto fail;
>   
> +	vf_post_migration_rearm(gt);
> +
>   	err = vf_post_migration_notify_resfix_done(gt);
>   	if (err && err != -EAGAIN)
>   		goto fail;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index fd6e731c0395..92822d131612 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -166,6 +166,7 @@ ct_to_xe(struct xe_guc_ct *ct)
>    */
>   
>   #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
> +#define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
>   #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
>   #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
>   #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 2)
> @@ -189,7 +190,7 @@ long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
>   
>   static size_t guc_ct_size(void)
>   {
> -	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
> +	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE +
>   		CTB_G2H_BUFFER_SIZE;
>   }
>   
> @@ -330,7 +331,7 @@ static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
>   	h2g->desc = *map;
>   	xe_map_memset(xe, &h2g->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
>   
> -	h2g->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE * 2);
> +	h2g->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET);
>   }
>   
>   static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
> @@ -348,7 +349,7 @@ static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
>   	g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
>   	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
>   
> -	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE * 2 +
> +	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET +
>   					    CTB_H2G_BUFFER_SIZE);
>   }
>   
> @@ -359,7 +360,7 @@ static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
>   	int err;
>   
>   	desc_addr = xe_bo_ggtt_addr(ct->bo);
> -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2;
> +	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET;
>   	size = ct->ctbs.h2g.info.size * sizeof(u32);
>   
>   	err = xe_guc_self_cfg64(guc,
> @@ -386,7 +387,7 @@ static int guc_ct_ctb_g2h_register(struct xe_guc_ct *ct)
>   	int err;
>   
>   	desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
> -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2 +
> +	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET +
>   		CTB_H2G_BUFFER_SIZE;
>   	size = ct->ctbs.g2h.info.size * sizeof(u32);
>   
> @@ -500,7 +501,7 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
>   		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
>   }
>   
> -int xe_guc_ct_enable(struct xe_guc_ct *ct)
> +static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>   {
>   	struct xe_device *xe = ct_to_xe(ct);
>   	struct xe_gt *gt = ct_to_gt(ct);
> @@ -508,21 +509,28 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>   
>   	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
>   
> -	xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
> -	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> -	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> +	if (needs_register) {
> +		xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
> +		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> +		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
>   
> -	err = guc_ct_ctb_h2g_register(ct);
> -	if (err)
> -		goto err_out;
> +		err = guc_ct_ctb_h2g_register(ct);
> +		if (err)
> +			goto err_out;
>   
> -	err = guc_ct_ctb_g2h_register(ct);
> -	if (err)
> -		goto err_out;
> +		err = guc_ct_ctb_g2h_register(ct);
> +		if (err)
> +			goto err_out;
>   
> -	err = guc_ct_control_toggle(ct, true);
> -	if (err)
> -		goto err_out;
> +		err = guc_ct_control_toggle(ct, true);
> +		if (err)
> +			goto err_out;
> +	} else {
> +		ct->ctbs.h2g.info.broken = false;
> +		ct->ctbs.g2h.info.broken = false;
> +		xe_map_memset(xe, &ct->bo->vmap, CTB_H2G_BUFFER_OFFSET, 0,
> +			      CTB_H2G_BUFFER_SIZE);
> +	}
>   
>   	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
>   
> @@ -554,6 +562,32 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>   	return err;
>   }
>   
> +/**
> + * xe_guc_ct_restart() - Restart GuC CT
> + * @ct: the &xe_guc_ct
> + *
> + * Restart GuC CT to an empty state without issuing a CT register MMIO command.
> + *
> + * Return: 0 on success, or a negative errno on failure.
> + */
> +int xe_guc_ct_restart(struct xe_guc_ct *ct)
> +{
> +	return __xe_guc_ct_start(ct, false);
> +}
> +
> +/**
> + * xe_guc_ct_enable() - Enable GuC CT
> + * @ct: the &xe_guc_ct
> + *
> + * Enable GuC CT to an empty state and issue a CT register MMIO command.
> + *
> + * Return: 0 on success, or a negative errno on failure.
> + */
> +int xe_guc_ct_enable(struct xe_guc_ct *ct)
> +{
> +	return __xe_guc_ct_start(ct, true);
> +}
> +
>   static void stop_g2h_handler(struct xe_guc_ct *ct)
>   {
>   	cancel_work_sync(&ct->g2h_worker);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 0a88f4e447fa..b1cba250c51c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -15,6 +15,7 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
>   int xe_guc_ct_init(struct xe_guc_ct *ct);
>   int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>   int xe_guc_ct_enable(struct xe_guc_ct *ct);
> +int xe_guc_ct_restart(struct xe_guc_ct *ct);
>   void xe_guc_ct_disable(struct xe_guc_ct *ct);
>   void xe_guc_ct_stop(struct xe_guc_ct *ct);
>   void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
