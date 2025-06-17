Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE856C7115A
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 11:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8716A10E5FA;
	Tue, 17 Jun 2025 11:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZp1Cyqk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFBC10E5FA
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 11:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750160033; x=1781696033;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eZerZtqO+G5L2KGc9CeeYkcJh81FzmyWH8Cs/snO8XE=;
 b=fZp1Cyqk/jWP9I4vHcGID0NvVFMsqVTcuxl+Mi145oP4vKs28CzOvllO
 9dXvDbgMkO21hvm59NLmxnX9tR6qb8pbwRWp4myK6oXneBfE5Nuo/4PZp
 y9+Z8GvsghZIwfUtu2/aX7Amk1hcuql8oEi3xcvuHhHQoXLHX5fEcqbtl
 nZbGZLZ0Gyoy58oEI+gl+Injrt/nqfTP32pdVJRjFmSJ3CKaa428Q8mX2
 o9NwAbyvaASjdmHJ5ls7LHdnR0Qb0CQLbTXQCL6yUDDkdK+0Rez0q4jlz
 vAAjNgvINAB/6eQ6SPIaPRzEboc92eyipELOQVe3i37bXAEhXLCldKDIn w==;
X-CSE-ConnectionGUID: f6Hl2LS5Qv2aqmzAyZMqBQ==
X-CSE-MsgGUID: 9+JgRTKQQCaiTHuVAh3+/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51443254"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="51443254"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 04:33:52 -0700
X-CSE-ConnectionGUID: nAymGBTTQVOnmt/filQ3Cg==
X-CSE-MsgGUID: ZTMwlB6tS/a9IEHHn9E8IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="148666612"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 04:33:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 04:33:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 04:33:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.57)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 04:33:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KSXeBF907NCjGVyGeUFIfd7iR2Q3U9K3yDkMSxRXV5EkOkxAWUqnvwJzJkopKPEiCZc4dQ64vJgnkpftB6zBkJM1b+pFAYkqc66OuCOVqPW6uXQ1Z8JOLHgY7gbc6SwtFmt7rqKisJ/eizAVbifOxdUU9yRHolE7AUZ0+BlY4HmC5x+786ENuiZjq/HWSEs/HLiZfHjBmDvYqkgNFydU/o8S/7sow3YIRNfMupqSejrRYR/wnH+txlQe5e4s65UGU8633LHLN6anFFPYqkHW4NaxwoPClTbVRn49mKSt9x9I3CV2L3RslfvRDs+3ohqTeBRXy+mrV6G/hcI1o53v1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XtVPLkRlbFuFBH55YX+/CMox45nBDRJ2eHmZJgq1QY=;
 b=pjmPcT7uqZI19FyMaNfOa0TsFoIrxXbmryxRrPWvihNxN9P7xsm3w1zSGlDPDPWPRZl5zIaSWiZtBHBFSah4D2MFf2UlXhGcLB0sGA0mIF4LVoWdsqLTe940WNuqKlYfJ999QRakt1l1SuxPhEBmI+FeWzWuzXn77JDEkTaRJyYy0qaRw4jWSPvqW++MrJela60LmadmzXd+xiQetMR1w78m8TroD9fRkGQbT1AXY9QXx787j0VaKlHkH0PERmPjvdMuimw5qcJ7K9VHEJBoV0JQDfd6lIZZQ8T6WoExB5XKMTtIjcq2lfYeuGxyb/FF5w9OGWw0BH97iFm1Il9+PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ5PPF4990C6B9D.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::826)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 17 Jun
 2025 11:33:36 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 11:33:35 +0000
Message-ID: <386f4aea-e7a1-4d4d-bbac-461fb7546626@intel.com>
Date: Tue, 17 Jun 2025 17:03:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/hwmon: Fix xe_hwmon_power_max_write
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
References: <20250616071133.458363-1-karthik.poosa@intel.com>
 <2298dfdc-f17d-43e5-9fe0-bffda4f50690@intel.com>
 <787db959-383c-4e9d-abbb-58d56a7d57d3@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <787db959-383c-4e9d-abbb-58d56a7d57d3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0157.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ5PPF4990C6B9D:EE_
X-MS-Office365-Filtering-Correlation-Id: 3100c2d5-be5f-4758-67aa-08ddad92cbe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFI4eHBWdFRkYTIrSllMajA2M2tyRFBRV1d5b0t3VmVCVThPb2kwR2FmRzBx?=
 =?utf-8?B?NzQyU2M0VUxxV1FuMUxKRXd6MjFMZU5vaFI1QllqTUU3WjNTK2o4eXBaaVNL?=
 =?utf-8?B?Qm1LYzJFREJUZnB3U2x3K1YrRG5VRHJJYmF6ZGpSUGVMR0t2Mm1BZHJkN25U?=
 =?utf-8?B?UDJYY0tjM3VQWVB5cXcvZThlK0lyenoybFNoWXluSWY2QVBMWEU4VHc5eXJy?=
 =?utf-8?B?QnIyc05jR3d4THkrbGpybmw5aWtjV0VBNU1GaWtnTnN5ejU4RCs1TFFEbVZk?=
 =?utf-8?B?eWwxVi9wWWk0Tmg4VlZPaVo0T0hkaFpSY01ldDVQNEhrcUxTR3I5NWJNVEwz?=
 =?utf-8?B?ZEM4R0ErVlFQNEpFVFduSk1zZmYvU1R6N0w0blR1YTRsL1Y5alNMeWlxZDBy?=
 =?utf-8?B?YVFBeng1VUFGK2lwZFFsd24rSFFlb0NzRXFub1drZy90TXYxNjdhU09LQ1Fu?=
 =?utf-8?B?RXdYdjhlV096RU9SREJKdjhldWNXaUVTNFQ4QXhLV1F3L3QxVGJkcDZLOVBk?=
 =?utf-8?B?dHJ3V01KWDM1T1ZSalBTSElkRFlGQTkvdTVjZTVEQVhxVCtadTFWRVNFMWt5?=
 =?utf-8?B?L1BQSU5WdjRlbS8zVXZGeDlpN0RVNWdabVA5dTVhVk1RMFBZeFhidmkxUnNC?=
 =?utf-8?B?MzczN2hTU0RTMTQrQ1ZQNlZKQUsxSS80UHhHeWhjQWZ6emFoVTBEVWdPYUIr?=
 =?utf-8?B?ZU9EakxjRmxBQWNDbmVCcE5DNDllVjBTMHpqMnhGWXBIcDhseFMySzlaS3I2?=
 =?utf-8?B?RGw3RkhtYWNvVXlXVXJKUUlkVlJYOHZUUEE3eTFVaWpqRW9kQ0V6WWhIQmJZ?=
 =?utf-8?B?REJXSFFBaFNwNjZsbjZkRVhDWkVWcHZGQ2FoVHZpVHpIRjBLZWgrcW9nVm9D?=
 =?utf-8?B?bHp6UG1hcS9Ocjh2ek1VNmRhdm9oZ3dZTG5YaTFoQnptVFYySGt3bkZ1bng5?=
 =?utf-8?B?d1g3b2ZZem9KS1dGczVWbUNzQVNvTHh6Vmp2NDRISS9TbHlEU1J4SXB1MzBF?=
 =?utf-8?B?Tjd3ZlVtWWo3RFJoM0xudmVrVmxzN0gvYjR6TzBZUElYNkhvcDF4ZFNVSEF2?=
 =?utf-8?B?YmhZNjRlT1FCZlFWYkx5eFdCakx3bWNaTG9CNXNjTm05dC9kYWpUL3pLSzhQ?=
 =?utf-8?B?ZWIxNXIvMlBFNTMzTHRCazVxWmpqRWpCYUFOTG96Y3BhQWV0UmY0NUlqWVdF?=
 =?utf-8?B?anlnUDlxSnhhb3VEYWRtRk1HSmVKRDR0R1N0OVJHVFBjMWc5WVpINjVZQkho?=
 =?utf-8?B?Rjc1eGpOWmhOOHZVS3hZd1huTDRzdlduUS9MZHpFd3Bkc28vMWlMamRsaVg0?=
 =?utf-8?B?QnArUGJUa2VsVm5RRXBMNXJxeGFWcXVucWpsSjMzeXkzRFFLaC9FTTRpMTdh?=
 =?utf-8?B?bGlwa0wyTlJlb0JEckUwMjVabG1Sa3JuWjgycVMxMXFlRTU1YzQrcXZUdFpj?=
 =?utf-8?B?bG5ZTGtTZzdpcmpQWGJ4VGl0WDQ3TE1lNnVmTG9SbDhBemdzMURhcUpaRjcv?=
 =?utf-8?B?RDRnWTVrbG41aHhUKzdnTDdKTVRhdEZXR01wbU1UdVJHQ1BPenBmTERoa3FO?=
 =?utf-8?B?QzBiSkRpMjVFT3llbTFTY2lqUGphbFFvNi9FdFNVTE1aNzRiWVg3cE00WVFq?=
 =?utf-8?B?SVZNWkpacDlHQWp1TnBsZVhWRVBvZVBkaDQzWExkdVVlTmFWdkgySFdpYy9Y?=
 =?utf-8?B?eWR4UTU3aUxaTFh1ckQ1ODF6UTV0N1NKRG0vcGpiaUczUUJKbWU0bXUvV3B4?=
 =?utf-8?B?aE1DZXN1ajhCNFAxeW9NeE5ReFJKWCtQYjQ1SU1qcTV6bkdPajYzaTEzeDVG?=
 =?utf-8?B?emlBWkcrcUFsd2ozMm5ZdmZuUi96b3EreS9yM3B0QUN3dk8vQ2lnajJxOXVG?=
 =?utf-8?B?eS9YbmpQVWdVY1lhblBXN1Z0R2wyMk5RZTNHSGxZeXVxUDBxK3ZzdjBFZkIr?=
 =?utf-8?Q?rcO1ztWxoP8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFpOTnNyVC81Uy8zbExFYkNQdzMxWkE1UVRjYng0dXNtbldKK3ljUkpuaDdN?=
 =?utf-8?B?OTZCMWJZUHZnQlhncy94Uk9sWmZ4eko4bjJ3Sno5ZGRpczBoeklPNEF6ZjJT?=
 =?utf-8?B?bFU0SG9KaGZJYU1GTHpzL0JmcEs3NGRwWGhXZjRaU3BiVGh2eVFXdFZueEhF?=
 =?utf-8?B?TVR6cFJjZDFHZ1dWbzR6SktaOFB6OWhSSlh5eU14ZTFlNXF6WWdSRGdsNUo2?=
 =?utf-8?B?dDBkZkhSYnZEU2pkSDFhOEVhbXQxcFBCV0tLRCtDTTBLOHJJbHFGSk5Td2NQ?=
 =?utf-8?B?ekRXWlhlc2VKdHZ6aFo2SHJGekUrbVNUcGZUUFRxY1lwYmZ1RFZyYndKRUVV?=
 =?utf-8?B?VTB2NDBYaCtxRHlqRzZNZ3hzZUxEUDFlRlNJbWJhM0ZCQVNoY05GajhKT01W?=
 =?utf-8?B?bVQrZmVCL3QvSFZ4K3N1akowSWRuRjYzcDBpVHRWMmlFUFU3Mzk2ZVduS2Jx?=
 =?utf-8?B?RGxRK3FiVHBFeGx0bktHZ3lPT0hBYksyNGRjaXJ1YUFyZlpPTnFRSFdqNDBx?=
 =?utf-8?B?UzhQeTJFdDlqNkthK3lRMFpxV3hyd1g1NUpEUnQvTS9KYVZZUDVRNXpmeTJY?=
 =?utf-8?B?dVZIbnBpQ1BsbnRadU1CSW5tbXlkdVMwdEU3VXJGb0J1RTA4eDJtZFVsL1RM?=
 =?utf-8?B?aUpPNzgrTzE5dUp3QzU2ZzcyK1pJYVp1QlV1Vm91cHBWTTc5V1RGYzdTbkJy?=
 =?utf-8?B?QkUxY05EL0dZWHhHeDFHVDE1cVByQW9ScktXb0N6Z0VualJobkFQYXZvVnlr?=
 =?utf-8?B?Y2xPK0U1MW5WVnl4M3JIYU53QmZlbXdXMDVxN3NBbDdBNCtZaW5QbG1kZXNN?=
 =?utf-8?B?WXRqaGErNGNyQ0ZybkVJdVdXSHJ0bHdRa3BIWk9Gc0toSUdNNVhQTWxyYUlM?=
 =?utf-8?B?TmFDUzVzV1ZTQ0RzbWVWRHNqY0kzczlOZUR5eXZUbGU5L2lSSk9SOGhYZE1y?=
 =?utf-8?B?azdVYU5hZDBKV2FwSjVCNDFCRXlVdDB2NGY5VnRxSkh0ZDJ0d0RLMi9FNGV2?=
 =?utf-8?B?bDlXbVIzRjBSelBqcVVycmFZZERZWnJPZERQUHhGWkU3T0lkVnRGWU5sbEdZ?=
 =?utf-8?B?ZFVlTjBNd1JlZVl1SzJpMDRUWUJld1NWSWJwdnVGZEl1VVc0ekcwcTN4Q1lD?=
 =?utf-8?B?RXNqSnI0OGd5RFVwS2xBSjRXY3NkUHpsZXRaSktlUjV3alRWTkVLVkxzaVlR?=
 =?utf-8?B?bGtnczl0KzJwS0JUTzQvSnZhZHRPSnZxY3VoQXpLRUV4ZDJNaEc2TGgzUlRZ?=
 =?utf-8?B?OXNDT1orZk1xK28vUmZZUzhGeHdIMXd6cytCTm9zNldXYkZ0eCtKV1dKcWdM?=
 =?utf-8?B?b2NVb3ozKzZJTGo4ZXRsbjdOZy9OYzd2RlIvWm9Sd3NiYmx2S0pOeXlvd2R5?=
 =?utf-8?B?VmFobUhlbGZ2NFl1cERQQVVqSXFRNHNZNHhxM01qSjNpbFZxallhZDlYcG1L?=
 =?utf-8?B?VTljVUorVDI5MGR4bWdzYnArSHhSMzluQ2VuTTZBNmthOXdXV2pIZjBQd0t5?=
 =?utf-8?B?UUVnckZKRWtrSWtZZHVSQWxBQ2VKblV4S0QwZ1dWcWZudnF1cVNjS0ZIajJE?=
 =?utf-8?B?ZjZpZ1VPSFhka3FHSUNXeVk0SUsrT1lrbW5EN3FTVVFqWXowc2VTcjQ1T094?=
 =?utf-8?B?VUo4bHdDS1BCOEpDSkRoWHBkSnBWMjdodGNIaE9zTFlqQTZSb1BkL0hiZmIx?=
 =?utf-8?B?L0R3YzZTa1BsQ2JOcmd1b0VXa3d5bi9Ha0ovdzBRV0dKRmZnVE9LSURud1ly?=
 =?utf-8?B?Wjl3TmFMWjBOeFcxNEFRT1pOSmQyNVlaemRJS0E3bktoVnNuRGc0aVFmVUtC?=
 =?utf-8?B?TWFDUGJiM2Z1eWpPMUpScURCZ25qaHY3em0rTmNCYTBVenlJUVpoUHMrTmhB?=
 =?utf-8?B?VHZQMGc2cWwzaDZBZ3JEeTE2dGkvRXZ6YUFYM0xzbFVFVnNtRDNwWHcvUUsw?=
 =?utf-8?B?aE8yV3BRa0ExS0cxOHRUbnQ1UzJSdE9lVk4vMXZGZzJBR2c0Mnh3SHNwL1V2?=
 =?utf-8?B?d0JUQ05sVW1uOUZrV0ZWRW9aemJ6eW5mRklucjU3dEE5TXZEY0Y4SURGT2Vm?=
 =?utf-8?B?bU5DNklJaXY1UzJuaGpoZzZtNHFGQzBhQlZ1RGdwbmRobjhaWUw1UGRvWk90?=
 =?utf-8?Q?RC9cErE21FsQeVxGEazfp79DE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3100c2d5-be5f-4758-67aa-08ddad92cbe0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 11:33:35.7689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDG/JzVhNVZu8DaY3Gt0ig0X0A9360hYR9W4TaL7Ou85RxO18kRmuuuaNxzdRgHMrxrXOCoxG0JlQ0If/zTQDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4990C6B9D
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



On 6/17/2025 3:43 PM, Poosa, Karthik wrote:
> 
> On 16-06-2025 13:10, Riana Tauro wrote:
>> Hi Karthik
>>
>> On 6/16/2025 12:41 PM, Karthik Poosa wrote:
>>> Prevent other bits of mailbox power limit from being overwritten with 0.
>>> This issue was due to a missing read and modify of current power limit,
>>> before setting a requested mailbox power limit, which is added in this
>>> patch.
>>>
>>
>> Since you are making changes to power interval also .Split the patches 
>> into two. One to add rmw and make changes to existing code. The other 
>> as the new fix. 
> 
> We can't split xe_hwmon_power_max_interval_store changes in separate 
> patch, as it would cause compilation issue.

Okay.

Use either one across file PWR_LIM or PWR_LIM_EN | PWR_LIM_VAL as its 
same bits

You can retain my RB.

Thanks
Riana

> 
>>
>> Thanks
>> Riana
>>
>>> v2:
>>>   - Improve commit message. (Anshuman)
>>>
>>> v3:
>>>   - Rebase.
>>>   - Rephrase commit message. (Riana)
>>>   - Add read-modify-write variant of xe_hwmon_pcode_write_power_limit()
>>>     i.e. xe_hwmon_pcode_rmw_power_limit(). (Badal)
>>>   - Use xe_hwmon_pcode_rmw_power_limit() to set mailbox power limits.
>>>   - Remove xe_hwmon_pcode_write_power_limit() as all mailbox power 
>>> limits
>>>     writes use xe_hwmon_pcode_rmw_power_limit() only.
>>>
>>> Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power 
>>> limits though mailbox")
>>> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h |  1 +
>>>   drivers/gpu/drm/xe/xe_hwmon.c            | 48 ++++++++++++------------
>>>   2 files changed, 24 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/ 
>>> drm/xe/regs/xe_mchbar_regs.h
>>> index 5394a1373a6b..ef2bf984723f 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>> @@ -40,6 +40,7 @@
>>>   #define PCU_CR_PACKAGE_RAPL_LIMIT XE_REG(MCHBAR_MIRROR_BASE_SNB + 
>>> 0x59a0)
>>>   #define   PWR_LIM_VAL                REG_GENMASK(14, 0)
>>>   #define   PWR_LIM_EN                REG_BIT(15)
>>> +#define   PWR_LIM                REG_GENMASK(15, 0)
>>>   #define   PWR_LIM_TIME                REG_GENMASK(23, 17)
>>>   #define   PWR_LIM_TIME_X            REG_GENMASK(23, 22)
>>>   #define   PWR_LIM_TIME_Y            REG_GENMASK(21, 17)
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/ 
>>> xe_hwmon.c
>>> index 0d32e977537c..fa841311bdcf 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -175,8 +175,8 @@ static int xe_hwmon_pcode_read_power_limit(const 
>>> struct xe_hwmon *hwmon, u32 att
>>>       return ret;
>>>   }
>>>   -static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon 
>>> *hwmon, u32 attr, u8 channel,
>>> -                        u32 uval)
>>> +static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon 
>>> *hwmon, u32 attr, u8 channel,
>>> +                      u32 clr, u32 set)
>>>   {
>>>       struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>>>       u32 val0, val1;
>>> @@ -195,9 +195,9 @@ static int xe_hwmon_pcode_write_power_limit(const 
>>> struct xe_hwmon *hwmon, u32 at
>>>               channel, val0, val1, ret);
>>>         if (attr == PL1_HWMON_ATTR)
>>> -        val0 = uval;
>>> +        val0 = (val0 & ~clr) | set;
>>>       else if (attr == PL2_HWMON_ATTR)
>>> -        val1 = uval;
>>> +        val1 = (val1 & ~clr) | set;
>>>       else
>>>           return -EIO;
>>>   @@ -342,7 +342,7 @@ static int xe_hwmon_power_max_write(struct 
>>> xe_hwmon *hwmon, u32 attr, int channe
>>>           if (hwmon->xe->info.has_mbx_power_limits) {
>>>               drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
>>>                   PWR_ATTR_TO_STR(attr), channel);
>>> -            xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, 0);
>>> +            xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, 
>>> PWR_LIM_EN, 0);
>>>               xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, 
>>> &reg_val);
>>>           } else {
>>>               reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 0);
>>> @@ -378,7 +378,8 @@ static int xe_hwmon_power_max_write(struct 
>>> xe_hwmon *hwmon, u32 attr, int channe
>>>       reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
>>>         if (hwmon->xe->info.has_mbx_power_limits)
>>> -        ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, 
>>> reg_val);
>>> +        ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, 
>>> PWR_LIM_EN | PWR_LIM_VAL,
>>> +                             reg_val);
>>>       else
>>>           reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN | 
>>> PWR_LIM_VAL,
>>>                       reg_val);
>>> @@ -591,14 +592,11 @@ xe_hwmon_power_max_interval_store(struct device 
>>> *dev, struct device_attribute *a
>>>         mutex_lock(&hwmon->hwmon_lock);
>>>   -    if (hwmon->xe->info.has_mbx_power_limits) {
>>> -        ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, 
>>> channel, (u32 *)&r);
>>> -        r = (r & ~PWR_LIM_TIME) | rxy;
>>> -        xe_hwmon_pcode_write_power_limit(hwmon, power_attr, channel, 
>>> r);
>>> -    } else {
>>> +    if (hwmon->xe->info.has_mbx_power_limits)
>>> +        xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, 
>>> PWR_LIM_TIME, rxy);
>>> +    else
>>>           r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, 
>>> REG_PKG_RAPL_LIMIT, channel),
>>>                     PWR_LIM_TIME, rxy);
>>> -    }
>>>         mutex_unlock(&hwmon->hwmon_lock);
>>>   @@ -1217,25 +1215,25 @@ xe_hwmon_get_preregistration_info(struct 
>>> xe_hwmon *hwmon)
>>> &hwmon->pl1_on_boot[CHANNEL_PKG]) |
>>>               xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, 
>>> CHANNEL_CARD,
>>> &hwmon->pl2_on_boot[CHANNEL_CARD]) |
>>> -            xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, 
>>> CHANNEL_PKG,
>>> +            xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, 
>>> CHANNEL_PKG,
>>> &hwmon->pl2_on_boot[CHANNEL_PKG])) {
>>>               drm_warn(&hwmon->xe->drm,
>>>                    "Failed to read power limits, check GPU firmware ! 
>>> \n");
>>>           } else {
>>>               drm_info(&hwmon->xe->drm, "Using mailbox commands for 
>>> power limits\n");
>>>               /* Write default limits to read from pcode from now on. */
>>> -            xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
>>> -                             CHANNEL_CARD,
>>> - hwmon->pl1_on_boot[CHANNEL_CARD]);
>>> -            xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
>>> -                             CHANNEL_PKG,
>>> - hwmon->pl1_on_boot[CHANNEL_PKG]);
>>> -            xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
>>> -                             CHANNEL_CARD,
>>> - hwmon->pl2_on_boot[CHANNEL_CARD]);
>>> -            xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
>>> -                             CHANNEL_PKG,
>>> - hwmon->pl2_on_boot[CHANNEL_PKG]);
>>> +            xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
>>> +                               CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
>>> + hwmon->pl1_on_boot[CHANNEL_CARD]);
>>> +            xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
>>> +                               CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
>>> + hwmon->pl1_on_boot[CHANNEL_PKG]);
>>> +            xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
>>> +                               CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
>>> + hwmon->pl2_on_boot[CHANNEL_CARD]);
>>> +            xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
>>> +                               CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
>>> + hwmon->pl2_on_boot[CHANNEL_PKG]);
>>>               hwmon->scl_shift_power = PWR_UNIT;
>>>               hwmon->scl_shift_energy = ENERGY_UNIT;
>>>               hwmon->scl_shift_time = TIME_UNIT;
>>

