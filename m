Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B000CC10F15
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 13:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3C510E4C1;
	Tue, 23 Apr 2024 13:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qbr1r9Jm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2619B10E278
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 13:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713877984; x=1745413984;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=GBrKcwOicDrMTI/nympWQ+iOauyCnBnfEVXrMxfIREk=;
 b=Qbr1r9Jm1anV80Q2efCDCcxXItxCynByhljb5/i2oRUllqEhcTTbOuWo
 FpHvrNk+dlbeRUNEd1q/Q/vkh4MMxcjQJth82xzXWKjEg82/XiZvXewgI
 Ab0u+gMnJRTT+Xs2sFgsdNnWoFWZbcY2aZHD8kQuJVtWWI1F+A6xCqEzv
 9hANfZdJ22aXRjxb9Ggue0dtDn8pKqRLrU7eIjdvDviUM7d/ynj6PM9IK
 FwHDNqePQWSCqoWJ3+TQOzpLhvU03pY+uJHutUtibTuAsUd8yRz5PtjKs
 Ynza5cXgUVS7br0G8hs+X0UczRdwCRwo9b1ljd1dqSyJk72q6dkGIPjVJ Q==;
X-CSE-ConnectionGUID: 8JH0zg5GShiVIL4IRumvZQ==
X-CSE-MsgGUID: EAAiS2znREuzIU/CzdURdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13244633"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13244633"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 06:13:03 -0700
X-CSE-ConnectionGUID: YV5pZjlIR522sCHWjW295Q==
X-CSE-MsgGUID: O0qhl/HPTcOM6KaZ0VKOnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29160765"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 06:13:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 06:13:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 06:13:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 06:13:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 06:13:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvGBzFfHRP668aIIzWgjwu5/TKfPFqCBYMyJazTRm83TNA+seDRBxh8gStofSnn0dmwbzHKw1mrxoT273bns6dnVB3lDeF+Tt1nm6p0IPFek6lJV7OwThzTWSOu+zn44rlkzLmrwbSf11ES0NHw+fLGaYG9/rD2ehOrmYhQsv6ThCOQwjGkuSmSsBi8EEoqM6YbowvXCPJLn0juuQhxCE81Sjb5jxybh1fQK7uhugBKMs7qwWvH2kQxXVYh2nTPjO6YQ2Uu0kfmbGzAST9ey5sNjP/5d5FZE2KuW/5zvR0TzBTRHgh/GTSPZthHhgCHMrv94LtuNFAIPvckaKjymvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D43keDFoT86Vpmslzb3xhNhpqP0Vz8B1vqN2kRBYh/E=;
 b=TFAEA0UT7DmyJIwsh/swAhtTbUSGajk4rrTyrWFzDbcvsyq2Tm2lQ0ZrIMV3cmqCU8MCE9cXOtp+i0RSvTBkCoWslvt9u8zyBrxCeuwbVn5hU5F4zshaS6t9hoWpoQpkUBPsuC5Ykwo3i8Vs0r0qdU2y6Necpu9FeAZy7GIzKNSctUgKvSPtlFbPRq4lIyZmNOtl83QTDsgns1oaAJU3IpYLVm7o8pOoqHJI8zgCP0y0uQMAheqm3DZecnleTSTsRFK+kEJeENz2V58VbKLAEFg15LPBHQ7Rvo0TPsietZmUah9PUhiddinaxDYUfRctgraIa5ODa8BQZ8wzTFbD9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH0PR11MB4919.namprd11.prod.outlook.com (2603:10b6:510:34::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 13:13:00 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3191:4863:ad54:bdb1]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3191:4863:ad54:bdb1%4]) with mapi id 15.20.7519.020; Tue, 23 Apr 2024
 13:13:00 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240423071039.1350633-1-shekhar.chauhan@intel.com>
References: <20240423071039.1350633-1-shekhar.chauhan@intel.com>
Subject: Re: [PATCH] drm/xe/xe2hpg: Add Wa_14021490052
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Tue, 23 Apr 2024 10:12:54 -0300
Message-ID: <171387797429.2243.662780441265614501@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY3PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:a03:255::16) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH0PR11MB4919:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b5d419-60e2-47d9-c63e-08dc63971986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjJpMnB6d2pEVithU3ZUeWErcWJZaDM0M3duQityNFBqVUI5MnB2dk9LWTRY?=
 =?utf-8?B?UjlDcVN2WFBFTmlSVERJc2YrVHJTMFVYYnJTUmZVM094amJ1d3FpZDR2UGdU?=
 =?utf-8?B?cm9SYVRDQVNOQjQrMkRMWk4xWnplWGhuak5GUlNhazJSVzNrMDBjVS9mMkZu?=
 =?utf-8?B?dXVoM1VPWUtmQTNSWGg5TndoU3hKZ002MldmK280eHlIbDcxRlo3RlUyTHdO?=
 =?utf-8?B?eU5PcnU1MEJISkg5QjYzcnpqMVVZSHVuVGNDMk5TaFdVV3YrdlE1dHV4cGtq?=
 =?utf-8?B?Qmx6azFMZGlkV2Yvcm9lbnlPMzJJVitPcmdXc0dVc2pFTVhGSUErRGkvbTly?=
 =?utf-8?B?NVhKZVFqTEFXZi93aDdTUHRXT05FaGdieHMwb05tVWl2cldiYm13WGFHdXNx?=
 =?utf-8?B?WDkxdVZzSzFOM250QXFXUytWMnZKM2ZseDJvM2RxZ0trb2Y2ZEY4aGE4RGZE?=
 =?utf-8?B?b3lWd0NLM21udVE2T1pVeCtKdEkzVzYyNG1FbUkvS0MrK2xROStOdkgvS09v?=
 =?utf-8?B?bm95UHB5Z3ZxSmF0aHZlNS9zTG9aR05MaUZSdFphd3Rzd3JqL1VBYXpNTGRR?=
 =?utf-8?B?RVRBcDd5bW82dkJaSFFUUzhxTnVlMW5oMmIyaGczZ1BraWYzOVZPWDFKSFFy?=
 =?utf-8?B?TGhKY01LRThvSXY5N0N2ZURYR1hSZTZzSHo0cndjMUEvbjlDRWhNVFliNEoy?=
 =?utf-8?B?Vm9GUTZGSzZjYkxCWlR4YW92S0I3Q2RQU2p2VlJEVjFKK0tDTUpZTUIzTks1?=
 =?utf-8?B?V1ZJb1dTTW1KOEtvOWxuTjNSMHVJR2U5cVZxVysyTWRrcG55Y1FBd3VNMS9w?=
 =?utf-8?B?MEhmZzdtRHZkenlmc0Y0cGxOTnVCRERsUDdCblVGUExnbWkrVEh0ZGExb0RL?=
 =?utf-8?B?bmpBTzVLcDRBbG1JSnpGV0J4QlFSVTVldzhyN2RXMlgyOExoMElHYStqV2FE?=
 =?utf-8?B?NnljMEllRGdOZ1BMb29Qank4Sm9lYUJuN0JNOWozYWxROVZIaHR3dEFqTHpu?=
 =?utf-8?B?bVBLcWR2M25UM2Q0SEZXT2V2cTN0aTlrWFozaXJiaVAwZTVlQm4ycGN0OTY3?=
 =?utf-8?B?WDYxVCtUL3BMVHRWb0owU1dta2tSQ21FTnJRYzdnTFkxNzlaQ0NMWVEweEhW?=
 =?utf-8?B?KzRlVzhLTGVmSVBFRm5LcEd1QlppK2xZQk1DNkVoY0swR3hMemJJSzNWbFQr?=
 =?utf-8?B?OFdyWnUxamRrQWR4Tjhnb2VVYzVaT1Jpdm1lVWFlZGh6aDhnTmdyTUUya3kv?=
 =?utf-8?B?U09leGhWbHJ3WWRhZVhWTGJSSnNWaVBnNXp6RWRwWFNkcTBOYTJkcmdoV21U?=
 =?utf-8?B?VmxJblhIcFJKU1IxUnVjT01LQ2tSQlBxUWZIakhkQTJCbk1ub29KcUtCajBa?=
 =?utf-8?B?dFh1ZmE2UlVOWGd5bEZaVnVEc1VucHEyZ1lHSWlVVkNjRHhjVGxzRFdyakth?=
 =?utf-8?B?UWdHVmJNWFhPbnczeDhYUjlkMGZEQ3orUzNMYUo3MC9qQVdVNVlkVXpYOFZI?=
 =?utf-8?B?cDJodGVxWUs5ck5nU05xVUJSN0NrOUl6djduejJCYVFMTHZhR1dKZTJKUElm?=
 =?utf-8?B?amdkRnU1VnI5NmI2ZzJvY25ZeWxuYzU5TzhSQTRycGpTWmZRdDNhajZSS3oz?=
 =?utf-8?B?VnVrSk8yNlJuVlhYcXVFRGg2M0VnbmZyV1RZM2tUanZOUVNLZEJOYXhvd1lo?=
 =?utf-8?B?c0E3bUlkdnFYWWxMRnpxQXBETXJmK25Za1BRNkpUQXZJRGVMQUVYT0Z3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTkxV3pseFB5Nk1wT3Fuak1tQUZxR2tIMklYNGwrdTM3dmNsZjlFSnUxVkky?=
 =?utf-8?B?SklHYi9OZnB1a0NjZjNmc1MzV0xSMDdGVzVhVnRUK2pEeFdLOWJGdnFtbURG?=
 =?utf-8?B?ODV1TmE0ckZLK3lBYkRXak9neklrbFdkQWY0VDZaUlNSSFJiRktPVGt4UWFT?=
 =?utf-8?B?bndtT2NPWS94OGxKbmc2ZFNpUVNrVzFEMklyWUVSZDFvRE5iOHB1VENyOHFW?=
 =?utf-8?B?U1VHUlNpbjcwcS82S3pPWnp4U3ZPeWhVTlhmWTVDV0x1SFFOQkI2TWRxVXlt?=
 =?utf-8?B?dWRLVHpla3lvWWVzTzMrem1yWFgyc3ZIMjlTa2sya2tKYzMxOGNTUHE0b3RR?=
 =?utf-8?B?Y05JbEVTanZGSVpETnNXSStndjEvU0JBR2FtK09naWRlNjlOd2N1YUpzRG5J?=
 =?utf-8?B?OG15UGFyTnBrSmFSOCtQVmMyWFBZVFREaHdibmlNNlNXek1Kd2ZSUWl6MDNT?=
 =?utf-8?B?dnBRbEk5dnhZWUdXbzZCdVRSZ1J6T1puNFcxNnJXWXE1aVhvUlBNdjF3SU5v?=
 =?utf-8?B?eUNHditzK2dFakVmazdvQU9iYjlhc1czMFVKUENpc1F4NXE2S0dPRkxJVzdt?=
 =?utf-8?B?Z2lmOXhUT2E5S2xFVy9OamxRenpLODNRWEJ5c2ZnM3RVdTYzV2NPTmZ0aFhs?=
 =?utf-8?B?VlFRRkFYKzZPOWRLcmhMWkF6WGZIdzEyenZWRkJBazIwQXJVYU0zeUtBbkJJ?=
 =?utf-8?B?VVV6QXhBZmZtL1RMYTBXMTA5TEVyL2dvY3FHZkIwL091MUtIT3ZHMVdwZ21S?=
 =?utf-8?B?d3lDZmY3c0NwT3FRQUpEZE5iNDVzZHI5eDFKNU5iTmlhSGRWcDFtRVJ4Z2I2?=
 =?utf-8?B?aFk3cnRSWnVWSTdmL0cwZEdkSElNWjY3OERhOTZvM0h6eUgvOERQT2tsTTBp?=
 =?utf-8?B?djl4dWNXdzVQRFIxN2NPUEg4cnYxTnY4bGpEZFBGUU1kR1FOdkU1RjNGY0Rk?=
 =?utf-8?B?S2lwY1M1d3J5VlZDZW1vbDVqZ1RBdW5NVWtldFB4K0xFdGJleE42cGJhaDZZ?=
 =?utf-8?B?ZHlBTFBZWUl0SkZCVzZVUUI0N1M5Z1d1Y1U0OStvakI4THAzckZ6eXZvZTJy?=
 =?utf-8?B?dUJ2dUZaR0RyOUNCRkdNMzd0c2k2VFN3UXl4UHV4Q0VrbXVWWlRUdFNKeTJl?=
 =?utf-8?B?WHJDV01nclhOdGFXb0ZvL25YSGlhZ0ZEbHpJQjlqdEQwenpad1kwOFRlc0RS?=
 =?utf-8?B?MnkyMzdCRzlYUm1GSXFjTGMrb0hHWk8yOGp1QURNUDIrL0RnSjNlTnY0ajF5?=
 =?utf-8?B?K0VQZUZVSnh6NWxVSlNPa3JNNkV0ajF1UVk1MXpCTzM1U29KVG5JVU16UDF4?=
 =?utf-8?B?dnBzL0V0UDkvQnBIQXE4QUswK0kxSkRaUzVyb0xyS3dYTVRXWWxmOFBldGha?=
 =?utf-8?B?dHV0R3ZoR0o0VUtwUHFRTFhWWWFhTlU5UFZDaVRwYm4vdGNNTDZYZHNKYXNw?=
 =?utf-8?B?UlJJd1BIU2dnb0UxYjFLR0pmbkZRaHcrcnNUUjBuR2FpMUVSZFI1aWEzdWRk?=
 =?utf-8?B?UzFRYUtlazRYR2p3VlhzN0UzdDBZK2RRZWRaZUVETEd0S1hBYjJoeUN6RSsr?=
 =?utf-8?B?Ukc4SWo3T1N3OFgxc1BLU0JUVEtjNFJoZEFBWlNBamZSQ3ZScHJxOHFOUnJD?=
 =?utf-8?B?dGJXT010WGlsdk1qeTlPdEhrT3Q4aEd5T21xYmk0U05RcjhpRjluSk1naWFy?=
 =?utf-8?B?M01mN0xIZnYvdWdFOTUwaUdVdStXTTBYc1V1VHNOMUNuS2FHeGJ1Qkhodms1?=
 =?utf-8?B?MjhINnJkVmM0WWk1N3R0NGZRaFZJaGlQWmpQYzM3aVp5by9QOXJnUzJqSHJP?=
 =?utf-8?B?MUdxUXEvU2FTSTc0RVE5ZXZobk5idkVxQ214MkdDWGdRUUFhQ2ZUOGl5MlV1?=
 =?utf-8?B?RmY0dzZqblNmcmsxWkxieEVqSlhhZ2k1cGxPZTQvVDZnWFZWbEFhZmVEUzdJ?=
 =?utf-8?B?cWNJL1dScVR2M0ZwSVdQME9WZlc5RzZEV1VLRlNIcHJBR1o3ZXJFSnhzUE9t?=
 =?utf-8?B?RWJkbVdneGhicnZBcnYzdFZDYmVIVTY3ZUw2clBFcnppb3ZINU5PSHlvK1E0?=
 =?utf-8?B?L3VDczlsQkhLTlYzTm9GeUNzRUZ2RTBrZVdaL1FCa0NZcUQ4blYvWldseHRv?=
 =?utf-8?B?V1pIM05wSGJKNm1YMjl0L0JWREJGbGZYSWNycGZKMkUrT1JIYk5lSC8ydDFu?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b5d419-60e2-47d9-c63e-08dc63971986
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 13:13:00.0483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fE4e58Gyk+92jcz/fc97/gLRLzjueUsWrElC/c65iZdDzHIg3g7qSQu+Ai9wic/iIYzHX2yi/6IuTmu2tWly+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4919
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

Quoting Shekhar Chauhan (2024-04-23 04:10:39-03:00)
>Add Wa_14021490052 for Xe2HPG 20.01.
>
>Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>---
> drivers/gpu/drm/xe/xe_wa.c | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index dcf7ed51757c..078d23dad817 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -687,7 +687,15 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D {
>           XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
>           XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
>         },
>-
>+        { XE_RTP_NAME("14021490052"),
>+          XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
>+          XE_RTP_ACTIONS(SET(FF_MODE,
>+                             DIS_MESH_PARTIAL_AUTOSTRIP |
>+                             DIS_MESH_AUTOSTRIP),
>+                         SET(VFLSKPD,
>+                             DIS_PARTIAL_AUTOSTRIP |
>+                             DIS_AUTOSTRIP))
>+        },

The style for this file has been to keep a blank line before the
sentinel entry (i.e. {}).

With that minor fix,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>         {}
> };
>=20
>--=20
>2.34.1
>
