Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FDEC369BD
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 10:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979B610E8C4;
	Wed, 16 Apr 2025 10:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZG3D2MeJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D518310E8CD
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 10:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744797909; x=1776333909;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mykRbHXtkzLL9T0TW/CpuKw0AjVoGJUBxnlNIM+2Q54=;
 b=ZG3D2MeJESBTrU329GKboUDLdg7xJPJ6D2thIqxcH0EHFZG7xawe4lQN
 ep7Ouc8cddFHezuUAnasHEqMFa4LcuPc/nqjUHIFyG66yLXwt3DxoGFy+
 nzhUENzYUW5JY5rQnwJcCM0tVTt5+uwlt+gAjXQCTxl4fw1Pc5NGLn4fQ
 TgoSP+SjmstkcDcp7XOHfah8+jvfxwIUON6QFDyppAgWARUEox7Ep0Sor
 EmmlA6TB26WvvDg4ixa+xnylY3QCP+e78giGup0MUIGP4c7GnaYQNlrdS
 b2/voJvRxHO0np8aTqhylfh7ld8PT5MmyN2WKFxKcQvLd8iQtR1VrkssD Q==;
X-CSE-ConnectionGUID: 01SC8svCQaqvfjrNBonXEw==
X-CSE-MsgGUID: tAuBFw4+RM6I3AT7+fyEWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="50145555"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="50145555"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:05:08 -0700
X-CSE-ConnectionGUID: 0AGuIKAZTpmF7kjwAPAGvA==
X-CSE-MsgGUID: NtXt+NzlRnSMea3P5BgNog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="135262998"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:05:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 03:05:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 03:05:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 03:05:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJqV4tBeJY5/kVUE5bRnRbvZFBQ0EkvyI6ZANJ4tsuAN0so3CHNZZOC0ofsrfppcEQY5/3fFymrj8pYPJQINbCDVS6pbjvA0It4Pc7/zqq5YtChqQt7Wcr1RfkUpZ42/2DQfbsNFO7eQ5UTDxD4JqYGmshePk66HcjKNXUBzbTTnmlNAyKNo2ynK0bBqQUIqi4wE7zTF+aGY+d0ctaJSXJaX7iUgUTBymK18RKETal5JfkwWhs8i3xlRsMh6IJFpxLuogz1PoWr7bFvsBQ1Jx2FAOk/+qHk2VOjvXNX5UjO/CfxwMAa/TooKUoDwT5Hb2MyHwk9qF8u9xWAMGDq79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6LGARWVjiMv51xgDNpngNg0r8WAJ7m5JI+IQZOaGVI=;
 b=ur0WRGHB9csfwAVbZ+4gFt/fs5AbxTT3s3OEiy46KhpHG/VcWwoLwpOpBmdLFM46zCyHEbwPE/JC/qG/AW4FjEhTSgCjX1rcyRjJ3lt/deKuAYzb5XOtRMMhm23tsiw9baN2V62j4JcUfDHXVq+TjWfT6ssoIW8zTmjt/+s2ZP/t0SqGI2GHQbeo4XaC+EGQhBNRS9ld+hqwDZcDCqDD1xNeNeEb7SvfncKGY5zdczHGauOENrlFA39Q70OouuJp5CKUS29cB0JBzcLYRh4lK+rIiFRPBPxQtT9mxM1xzYoAvCSVIU+H65m1ZhxA4vfcFb8DNfuYi2qjBYckTJ0Zmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA4PR11MB9201.namprd11.prod.outlook.com (2603:10b6:208:561::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 10:04:51 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 10:04:50 +0000
Message-ID: <7fb3fcf0-3dc1-4d98-af23-58c9e77a47d9@intel.com>
Date: Wed, 16 Apr 2025 15:34:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Move xe_device_sysfs_init() to
 xe_pci_probe()
From: Riana Tauro <riana.tauro@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20250403174742.1294227-1-raag.jadav@intel.com>
 <20250403174742.1294227-2-raag.jadav@intel.com>
 <6a2068b5-d86e-4e8d-9c41-f47cc322e394@intel.com>
Content-Language: en-US
In-Reply-To: <6a2068b5-d86e-4e8d-9c41-f47cc322e394@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA4PR11MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: c5796654-e8f7-4323-d8c5-08dd7cce2054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajBLemtnZ1ZLZ1hVMHc1N3JMeHkzZE5xODZ5c016ZGN4dWpJOTN0WUxvcUJI?=
 =?utf-8?B?UnM2dU5hRXdicW41bGJRd1BXeXhHdnhkNXIrSHd1UGZvVjU5bm82VytGL3l0?=
 =?utf-8?B?VVVLZUZLaDE4bVVxUXlVdForcHo2bkp5L2t3TFVYOFVrajhRMU9mcVRveUdH?=
 =?utf-8?B?SzhHT3pGSXkzYkxvVFFpR045U3Z1SmxocTdua29Tb0Z5ZmtMc1lySkUvbjgv?=
 =?utf-8?B?ZjJpaXRNMnZqL1ZZUE1TSlpETEtwblU3MkcwZmJlLzZhQUJsK0J4dWpvZmts?=
 =?utf-8?B?SFNCclVTK3FuRzFlejVjbmZ6c0F4aDRrK2F2N2NXL2kxME9mclhERXNVakFz?=
 =?utf-8?B?cHNmZTZmSWNGNlhSUnNJdDgrdEsyUklIdDI0b2wwcXoveUR6UVVwaEtTb0pr?=
 =?utf-8?B?eFBIcXVzNzh3NDV4R1hwTzhlY0Q5dVRVc1E4ODdxNWx4UjhOWXFYSHkvVlVX?=
 =?utf-8?B?QVB0L01xelk0WjZpSUFnOUxYUVlwN091dFZwVzk0MnVwSWhnR2MzRnRQTFd1?=
 =?utf-8?B?M2xCdndpMDdvbGMzV2ZGemZZc0ZXeVRaRFlPZzR6MmtmbkhsK1lQWk0zR3Ex?=
 =?utf-8?B?VkJ4alNoV0RCZlpuT09weVpRMURYbmRXbkNLKzBtdVhuUDA0cW9yc2ZGTjgr?=
 =?utf-8?B?bkZhK2Vvak5qcm5UczZ4dTAvV054WDVtVzAyajdwRFE5ZUl2S0ZOTS9Nb2Rx?=
 =?utf-8?B?SVA4MW11Vmt6MXBKMW5pbDJGdkQ0U0xiRnc3L1dSNVdFc3FuUFNvRG15bGlu?=
 =?utf-8?B?TXhmMXVGbjVwdkFwelBHNmJ6Q3cyL1B6MVF5bVphekpQS29PUnJrSTExM2g3?=
 =?utf-8?B?NWRKMGdwUnZwbTZhYlJOYmpOTDhjdXRCekJveDkxS29qNlQyT1VTeThyaEZp?=
 =?utf-8?B?aVliRVMyRUt6R2QyMFA0VGtYUVI3UkhpYU96WldqOURKbUhyZFZkdXVzcERF?=
 =?utf-8?B?aUVYWDcrTWMwK1RIMkVYRitNV0RYVnE2dzZaTk5nNzZCOWxsS2t2UjNqaFFa?=
 =?utf-8?B?VWI0MVdnYlU3aEY2UGZad1JSZmNlM2hKK1hFV2NhemRLZjBuOHNNSTNrZzFB?=
 =?utf-8?B?VTFqR0FHNTJJSVFMbGoveEJ3R3dybmw2djdvMFBkT3BnMHR6S1cyUjNlQ3pn?=
 =?utf-8?B?NHdZbmZZWXNxbm9JclluQmlQNENHbW9oTGRCRHkvK2tIRGMwSUtIUnVDcFlC?=
 =?utf-8?B?eTJNeEM5SmZSMnFxRVBXUzE0enRheVlnOE1Rdmx5ZmZMN2VkaitMcUxKdU9I?=
 =?utf-8?B?RmE5RTdNQmVIQUVQRWpydHR6TVZWdTJzSmlyN1AwTktNVGNOT255c2kwM05Q?=
 =?utf-8?B?RkNlLzhnbTVTczVmNVM3dWpsem9paXZjNVFqZDByYnQ1WTNndHFSV0RCS25O?=
 =?utf-8?B?WitZbGdhNmh5TEdTWUVlRTBMYkRhU3VBSWxkWGtMbnBmRkpQU3VxVk93YlNq?=
 =?utf-8?B?OVJKU3pMbDk2R2ZRaUNLcTdQL2pVSXQ5aXVOYWFnMjhEczlkZzZMaVh5NDFw?=
 =?utf-8?B?cUhEdnhKM0gzV1RqUUw5TXlhYTRRUnd2aVBNTUFFZXVRdlcwVURSdDFvYW5I?=
 =?utf-8?B?cUs4UTQyOHhGcU45WFBGaDVrMmJCU0R4UTB1bHU2K29WNHhOUVUzZ0xGOHdN?=
 =?utf-8?B?ZEFuQk5FRlB3aFJOcVg1VHZ4cHdWYUp2a3BGMXlBQXZTVnEwdWtyOXV2UWVJ?=
 =?utf-8?B?d3RHQ2dyVllsQkl0a0hxT2FSdGFsRS9uWDJPc2VSM05rMHUwV2Q5UEZYb0lu?=
 =?utf-8?B?RjhueE55WTVPZktRY0Jkb2tMQ3ZFYkhhZFNaOE5jQlJKUjV0c2t6Y2tRcFVk?=
 =?utf-8?B?V0pqQWdJVWVZUXRWeWY4SnVwT2tsYXpmd1BmbkFLSUgvV3hWbkVCRFNkSWww?=
 =?utf-8?B?VU5wWnBpM0J3ZUJjZzl2SzNNcjRkQUVMTmVXU0VZNXdRM3EvRWlGT21IUXJx?=
 =?utf-8?Q?Mr9F9ufibpA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alV1L1VqajlOVmd2c2tsbFMvTzZueE93Zk9iaW9maGg3ZTgrWEhQcTNJdmN4?=
 =?utf-8?B?TTdRUmN6dTJMUytZMGwvTUQrNjhSNFIwaEVvUDJoY0JpOUxVWm1kTFhpLytz?=
 =?utf-8?B?RkU0bzhYM2dPOGg5RG9SZ1hvZTN1ZWZaUlJsME9mU3BNdDFndm4yN0x3YmMx?=
 =?utf-8?B?QjNMSkVJNXBxV2NwYmIzS05MSFgwVHJSUVpRSEdPQmNldmV5S2NXY3VhM3Fv?=
 =?utf-8?B?aGYvMTZmYUhYSXdOMy9BVitlRW1mOW5sMExQa0luckpnMzV0SEYrbUkrOHY4?=
 =?utf-8?B?UWNhK0JvNnQrRzh3Y3ZyYk9EdHQwbFVlUytkdmlEdDFuOEpkN2VXNHkybDBP?=
 =?utf-8?B?UUFzMGtRdmN3WG9vZ1FuK3BqYWVJMklWbU1Ta2xnVUwweXNmMGU2Q1ozbEc4?=
 =?utf-8?B?MEZxcDE4ckZtc3dLVy9QU1lYbThQbVFxelVzMGlSTktSdHZKZFptWFRDRElE?=
 =?utf-8?B?T0RTdWNyRzZIalhVTDB1Wm1qM2tUcHZFeW5mV3FzMEVHWmJ3ekExWjJTQzFB?=
 =?utf-8?B?TkJvWXpQYVhtd1A0bjZqU1c4M3hTdm5YU2ZxN1h6eXo5RytxL21Rd2Rjbllk?=
 =?utf-8?B?R2Mzd1MwRFNLYUxuc29XWUJzRnQrRGVWQUtzZUdSdHUxNFZ4b29nWklwbzhF?=
 =?utf-8?B?bUVaQWlPdXhoY1Z6Nld5a1hKbnd1T1ZuSjlKMGtZazdlQXV0U2V2UzJ4MFFX?=
 =?utf-8?B?cUQ1SklIWGUvdHZkRXRzeEsrZGJWWVNnL2x2cXBsaUVvM3o4Um8zQ3hwZFg4?=
 =?utf-8?B?T0tzbmxxSDdMZ0pRVkw0L3ZTcEJSS3JjbjQ0UmhENUtTdGQxalN6Y0dvM2J5?=
 =?utf-8?B?R2NCZXdMYUtiM3J2NWZxNzhnaTJyN3ZzNXMrNUlkdklveko1a2dlZWVBNUxZ?=
 =?utf-8?B?SERZZ2hSdHBPNXlVQUREOTY4SnFxeklHY0pGVGFRR3U5cG5NRTYxcFRSN1BD?=
 =?utf-8?B?NitUVEhzWkllOGVvRHN0S1A2cDh1UkR0VnoxTEN6dnY1cmdyUXVFOWtQY3FR?=
 =?utf-8?B?NmE1aUhnWlBHQy9pRmpqUXFRN0JKOTlOSWlaTGJWb2lMazdDRzlNVEJidmEw?=
 =?utf-8?B?QWpBMUJKdXhQRGZBcnYvTk16c3FSdTNKbjY0NVJONU02d25VbzY1RlRhRXNX?=
 =?utf-8?B?NHgvMFhDQkQrVkFEM0kzbFN6ekRqZDdHOFJIN3pDOXpSSTVpYTEwa1R5TWZa?=
 =?utf-8?B?NmxTa0VFRGdtV3dqdWZJSGJkNkEwU3dCU041MkZEWnJIUHpMbzZGUFdRYVJx?=
 =?utf-8?B?M3RUdWRMTWNPRkhoVmtYY1F3REJ1MnhHTFhlVk13RGFSOHpSNlpZV05kWnhZ?=
 =?utf-8?B?eGxPbjM2MzBNZjZvN0NvZldIWjZWdTE4RWx0YWMxdnozY0Y3M3JqMjBaUEQ1?=
 =?utf-8?B?VDZXRG1vQnBsTEVWNnloWXkxZWJXZjVSVzZlQ1ZVYzhscWl5ZTlYcCtKUVFY?=
 =?utf-8?B?S25Eemx3RHdxOFZVMDhYQUNmaFFWd3dtREJRcmpnaXRSMmw2aXpTY2JyREVI?=
 =?utf-8?B?dTlNZUJkZ1dneElsQjVDVnVLeFhTWFhjUWttdGJlL2hHcGZVaDl3Q0FLTnYv?=
 =?utf-8?B?NG1UMkV5OFdobkRRVlZhNGd6OHZNNk5pb3lzYkpTcytER1VUWXg0VS84U1pt?=
 =?utf-8?B?OG1XYnBHT25mS05nNTVvSzNrejZLMDYyM0V3UUxibXo4blJBTFJtZHp0Vlho?=
 =?utf-8?B?a2czMnUxYXlmempFd0FwYUFwTFhITDV6QkQxWjJmQWhabXhERGNVanhHWXF6?=
 =?utf-8?B?MTc5RytBSk4rOUs1ZjJ3RVlFNUl3a1BENFBEd3NGR3IxYTZ3aUtEUTVtQUNm?=
 =?utf-8?B?VHRvd3dhaG1MUUhidURwL0k4WmV2UEI2alNFbER1R0NEU3ZEZ0FRVGFzaDU2?=
 =?utf-8?B?ZCtBTTM1UHpYRFd2bHBzQjN4b3JYU3ZHQ3VVZERpV0E5UFUwaDhwVnZTZHlW?=
 =?utf-8?B?bS8zQ2FqZkpvWjc0L3IyOUxxK0h3WmxBdStMZ3M2NzdSWm1CMlZoYkErNFRX?=
 =?utf-8?B?Uk1KRVRvRkpSbHQ3N3kzMkNWdUpFanRrdHZqT3ZyM3duNGpMZDR5c3RTNmhB?=
 =?utf-8?B?eHZEaC9kTDJ6ZmRIa0V2UDB3ZUlNWE5tVTBFNzEyS3NPc2hxNDNYaCtac09R?=
 =?utf-8?Q?uPson26OR0lwDJQSX7kqGAO0D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5796654-e8f7-4323-d8c5-08dd7cce2054
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 10:04:50.8394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0CcVfPF6fdy4VFZ73dwGGYMhqzQWtwInn/LzDZoZDTJPbDbz8GW5V6O7YvUYcTiFKmzdwt/t5VTukSPCKYScQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9201
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



On 4/16/2025 1:25 PM, Riana Tauro wrote:
> Hi Raag
> 
> On 4/3/2025 11:17 PM, Raag Jadav wrote:
>> Move xe_device_sysfs_init() to xe_pci_probe() so that we can expose
>> non-PM attributes as well.
>>
>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device_sysfs.c | 11 +++++++----
>>   drivers/gpu/drm/xe/xe_pci.c          |  6 ++++++
>>   drivers/gpu/drm/xe/xe_pm.c           |  5 -----
>>   3 files changed, 13 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/ 
>> xe/xe_device_sysfs.c
>> index 7efbd4c52791..d4c73acea1cf 100644
>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> @@ -67,7 +67,8 @@ static void xe_device_sysfs_fini(void *arg)
>>   {
>>       struct xe_device *xe = arg;
>> -    sysfs_remove_file(&xe->drm.dev->kobj, 
>> &dev_attr_vram_d3cold_threshold.attr);
>> +    if (xe->d3cold.capable)
>> +        sysfs_remove_file(&xe->drm.dev->kobj, 
>> &dev_attr_vram_d3cold_threshold.attr);
>>   }
>>   int xe_device_sysfs_init(struct xe_device *xe)
>> @@ -75,9 +76,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
>>       struct device *dev = xe->drm.dev;
>>       int ret;
>> -    ret = sysfs_create_file(&dev->kobj, 
>> &dev_attr_vram_d3cold_threshold.attr);
>> -    if (ret)
>> -        return ret;
>> +    if (xe->d3cold.capable) {
>> +        ret = sysfs_create_file(&dev->kobj, 
>> &dev_attr_vram_d3cold_threshold.attr);
>> +        if (ret)
>> +            return ret;
>> +    }
>>       return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 58347fa91841..246682b2a2be 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -18,6 +18,7 @@
>>   #include "display/xe_display.h"
>>   #include "regs/xe_gt_regs.h"
>>   #include "xe_device.h"
>> +#include "xe_device_sysfs.h"
>>   #include "xe_drv.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_sriov_vf.h"
>> @@ -864,6 +865,11 @@ static int xe_pci_probe(struct pci_dev *pdev, 
>> const struct pci_device_id *ent)
>>       if (err)
>>           goto err_driver_cleanup;
>> +    /* We have PM related attributes, so do it after xe_pm_init(). */
>> +    err = xe_device_sysfs_init(xe);
> Layering doesn't seem right. This should in xe_device_probe.
> d3cold capable can be moved to pm_init_early and this to device_probe
> 
> Thanks
> Riana > +    if (err)

Also this should be a goto

if (err)
  	goto err_driver_cleanup;>> +        return err;
>> +
>>       drm_dbg(&xe->drm, "d3cold: capable=%s\n",
>>           str_yes_no(xe->d3cold.capable));
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 7b6b754ad6eb..6af1de78dae8 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -16,7 +16,6 @@
>>   #include "xe_bo.h"
>>   #include "xe_bo_evict.h"
>>   #include "xe_device.h"
>> -#include "xe_device_sysfs.h"
>>   #include "xe_ggtt.h"
>>   #include "xe_gt.h"
>>   #include "xe_guc.h"
>> @@ -306,10 +305,6 @@ int xe_pm_init(struct xe_device *xe)
>>       xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
>>       if (xe->d3cold.capable) {
>> -        err = xe_device_sysfs_init(xe);
>> -        if (err)
>> -            return err;
>> -
>>           vram_threshold = vram_threshold_value(xe);
>>           err = xe_pm_set_vram_threshold(xe, vram_threshold);
>>           if (err)
> 

