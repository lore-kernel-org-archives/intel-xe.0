Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA93E73146
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 08:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF31510E3BA;
	Mon,  2 Feb 2026 08:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ICadl288";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6CB10E3BA
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 08:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770021989; x=1801557989;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kY0yqIayfdFO9X89m0GhG+gXsiHLU2DOAjsy9szVuMM=;
 b=ICadl288fvWUR02CslqALZJ6d9JHvAgrgoAgbqv/+6HR7fWhnxcFklsj
 v5lLH393XCM1OxwmBeZkOYU/afpimAcuMOV11wxNYiIxUvKU7JMVmpWf7
 b+9QElP0qyiBIg+m5n399hM9SRX3Wvuy+ckhjtwNuIn1libEBYm6W5aBy
 8q9lvAHBsyhP45xekLSabvFxgZPyFpgLuXSBn+FmvUHix5GB+xB8X+s//
 5Gx9eQK7wjI4EVhWdYoKZvpw+k+nWVUzU6bfyAHrggjiXD3iEVuchWnTb
 j0wNlP946VkeBp116NTGj5eTNF3sKXPywJTsjg4DHfeWnkQ0ELseOPUHF w==;
X-CSE-ConnectionGUID: Txy6jXt7RyC5pvUEc5dTyA==
X-CSE-MsgGUID: DcRITJlxS4SjA6/5iT/JYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="74798811"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="74798811"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:46:29 -0800
X-CSE-ConnectionGUID: utJ1becpSBuc8rX4Idekbw==
X-CSE-MsgGUID: ymC3MPcwTD2lH7hlKY1NqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="213563282"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:46:28 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 00:46:27 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 00:46:27 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 00:46:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hc447/gcJeTJmgQlLRxnzcKbzGxlqw2m1nG4bGbe8jvwB6oPysRzNVcbBWv2EVNzxZA7/G1j88KiaFBTLev6qGAbzl8irOxm5Cd7vi3+oxLMBJlX4uJao3VatxB1pVkyUlhbMPK28/FugfXLKFacZaLWfUI1CzvMDznoFr1M99wDo7lSoN5ZcAeK4muxh+XuBSPOoid68b0aW3EbO046Wn7gaStBsdwPzAtcfzb6SVZGcIs0AEHqFqYt7pA6dPnhv1c730Vq4jDuHMf+6azZJlhsIUWM3bEKjqmCEKF4Wd9ozta2ZwKKmk+za+xnn/jQyo/OkLd7bvkKsp2WXQ8vFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLoiWXwOIHQ3IXNPG8pzLlNsBPXLvEU0U7Eoul8icoA=;
 b=LeAUD/lQG+eUBYIXM7Y8UvG+VdjrxQ/FaqtGExfyuHMC7E9M0900iDTtkcab2hEXP0cQetSsHELSt2+ITn4LihcDnUZMrWZCgMqQFEKVJD1a4Vi/c3grbg+6MLkqArlJweamlkd2oUpipIoxAq2DzcTfQpGxyMFmdIh1tSyP2O6Ysm3KBQ0jmwaScN2uvKE/5uCTwgENn0xpjIvqEV2eSGQj3IiG7WSl9ox46IdJEbG0HeYamMyD3F0rZKi0z8YVKM88gEGwLD+MuGBUm0Da/e+8cBhP2FuvrTX16cial/bEVcnBxO1CewNUVaZKLCcj1Z0fRX16cUH/lhkhu4WZpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB6947.namprd11.prod.outlook.com (2603:10b6:806:2aa::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.15; Mon, 2 Feb 2026 08:46:24 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 08:46:24 +0000
Message-ID: <7683cc07-7159-41b8-aa08-a91b2de5d8d5@intel.com>
Date: Mon, 2 Feb 2026 14:16:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/xe/xe_pci_error: Group all devres to release them
 on PCIe slot reset
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-13-riana.tauro@intel.com>
 <fa728edb-2929-43f6-bd4d-9009e6539079@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <fa728edb-2929-43f6-bd4d-9009e6539079@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0278.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a78e5a-4f62-45dc-889a-08de62378bbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0VsT3dRdTJCTER4TE9MNEFxbFUyZVdYWjdJMVE0c0pMWlFFUFJtT2JSMjJV?=
 =?utf-8?B?Wk9DVThucEFmdCtjYStTZ1FQVm1SY2g5ZFJPS2ZCeUhQdStSSGxHTkVYazJw?=
 =?utf-8?B?TEFhRFBiSzlsZkxVRkR6a0l0RDE0UHhEanNDWmMxR0p0YzFVdGhqeE5FWklZ?=
 =?utf-8?B?dHZjMTVXMUxUOGw5TlAzem96RmJVLzFYaFdwV2kvTWxZNFlyaHZLK2hYSHM2?=
 =?utf-8?B?SzVsNURodkp5T3crejVDRDBZblNwUUpvUm05QXNTL3ZxY0x1ZTZCUEs1Nnhs?=
 =?utf-8?B?MTAyazV4YzRPU2pJeXBzSXZRQ3ZpamN0SXVQc2ZkRUFMdU1kcDQ3dUxXVTMv?=
 =?utf-8?B?bnRrVnViQXNsWlpkOGtmbmNXVFE0M0ZpSFA1UWh6dlYxQ1FGdnV4RE9uZ1Zh?=
 =?utf-8?B?ZXB4cGduc2ZPeGZWQnpML2tQc1pMcjJXdlNqczAvMDhFQXdjVjdYQmIrVW9T?=
 =?utf-8?B?R0FWbnJ0QmhDd3lNUGNuTHNjSFA1UExtbGlOTGJKdEx4TkJCWC9oOEh3RHhD?=
 =?utf-8?B?aDNmVU5UdENZaHdYK0s3VlJxeWtKSHZnK3ZCSEN5amE0Q2xqKzdqaFFPNjR0?=
 =?utf-8?B?b0FmS0dHUU5kbWpiS0FteElIT0F6N2NyZjVYUGduTHhqQnE3SGZOMmRldy8r?=
 =?utf-8?B?Wm1tNWphUCtoSTkvZ01SRU5GcnZkVnc3YTQycEczTGVwTVFISHQ2engzWGNW?=
 =?utf-8?B?bFVsZHZQNDRITklmZXB6blRkbmtWMmpsc1k0QUFEbHFuWUlrVVNmYkljNzdC?=
 =?utf-8?B?d2doWmxQNnVVVEp5ZTBKTUJsQlpvS3NGVUc5UlVJRCt2blJkWmMxckZsOWxH?=
 =?utf-8?B?OFF4NndrWjRLQ0JNM0U5Tm5mZldpN1hCV2VoVXZGZTNTbjJaOEZpV3d5ODNQ?=
 =?utf-8?B?RmI2akltay9iLzBNNmF3Nm5IeWRXQXdLTHM0d1B0UnEvZXRKK0tyUzZkbmpy?=
 =?utf-8?B?eEt1QWdGZERUMWk3Q2xyN2RHQzZmYklSdllkQzdGMnpjSzh2WUNHTXN1bmdq?=
 =?utf-8?B?RHYxbVZNQlpLLzRmM3h5Q3JiVlV3VG8zQmN0c05uM2tSNHMyMXQyUU04QjBE?=
 =?utf-8?B?ZnNwU0dzUFRzcFBXOG5zRmNxdUpyVGJlMlI1TUY3WFplcUp6VHk3MEtEOWhn?=
 =?utf-8?B?czRuVm9Tb0VUMUMzZlg3d3lNN3RQcjRLVDFLT2MvRlYzbVlIM3h1VkhVUUsx?=
 =?utf-8?B?QVpyVFNFS3Y4Slo0clZkbFl3ZUtDZHVZdDBqRWpxUk5jbEVpT2g4TWJUTllr?=
 =?utf-8?B?emlSRjdVVCs3WXNBbHJCRWhFUHZNSm5ZQ2xhWERFSE9ScEpyb0dSWEpGQS9l?=
 =?utf-8?B?VjM5UFB1UmMxbWR6eUhtU2FFVmFMV2lTVnl4c0VjSnFPNllxM0VTVmF2UUhs?=
 =?utf-8?B?UEkzNk1oZ2EreFRQQTlERTBzdGVhOWdOYktnVkNVT1lkMHV4Z2wvQ1hacFY4?=
 =?utf-8?B?aUV4ODh0SFdqbUxKUXprRkN1c0p0dnpnb3pRaVFuM05mRDJrNnhXNW1Vcnlo?=
 =?utf-8?B?eWs0R2Z2RFFCNXlZdzhmUkJPYWFFRVJ4T2s1OWFJSlhWV2xuaE9NSFVicEZ6?=
 =?utf-8?B?ZmdnckpRMUZheTgrNzVBWU9HYkZJNUhlT202L09QUnZjd0ZSaHFtajRiaVVh?=
 =?utf-8?B?OXI4WG5MQnRxMzhqTU05b1V6cHVYWWUwbjVqYVFJWStHaEcwcklvSmYvWFdl?=
 =?utf-8?B?Zkp2TlZHTjRTbUcxM3BqeCtpZ0x3Y01pVXBmQzk2cDhRRGZ3YzgrZHNwQ2Qz?=
 =?utf-8?B?VUhsTmRkSkMwQ1diZVZ2aDkwQW5QdXQrN0d0SnFRZ2g5YVJFeW5XMHlxeVF4?=
 =?utf-8?B?SVpBMkQ1NVBtTlMyVGk4N3hNSEpYTnpnOTVqaHp0NjUrcFhZTk4ySFFvZFgx?=
 =?utf-8?B?aFp1dHpqbWUzUjFxSGVPNFNKczJJMHQ5OGNlNUpYVkI3ckJ3NFl2Nzl4MTF3?=
 =?utf-8?B?R2s0ZGljTU0zYkRvVnR2cmc0QlBKcVA1QlI2bm1CSlFmTGdEaFdHK0pTazNK?=
 =?utf-8?B?eUtKR0d3WkhQTlJVbXNRb3JwQ3BFbXMvRElaT2FTMHFwQ1pwOHZnbHUyZ0JO?=
 =?utf-8?Q?zm3jpK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnRkRUlzRDRWSytUL21uTEdGNG1RS3NwMmw5Y0xRMFBlSmc5M0NNVStDSCs0?=
 =?utf-8?B?c2s1MFB3ekhNWTdwZ0xOL1ZPaE9xampDc2NyQ0NGMGJ4UDJ0V3FXbElpV1p5?=
 =?utf-8?B?MWtFU3Vja1Y3eVJxRkJ2Y28xV1A2TjFOMWRpalpLY2ZScWZ3SER0clYrTC9X?=
 =?utf-8?B?aGVNN1dwZlBhNU1DUXhLWHIreS9TQkJJZG9mNXBDZS84S1RmUXlhcEFobU0v?=
 =?utf-8?B?aURDYi9lMnpSeU5zYVpRSFhHUHA1bkc0QjNjU3pzZzRqa2wraFc5VVlCemw2?=
 =?utf-8?B?ZW1qUDBKYmt0RUY3M3NBTEZMSERMZTE0MXBpWGpXTlBqejVQTzdlL21Fb0gv?=
 =?utf-8?B?d3NFamJxMmVoZ0xSclZOSTBnMXh2MENDcUFwRzVYamRRcnBnUmU1VDJJaWQ3?=
 =?utf-8?B?a0pGWTMxVmk5MllHdUt5cGFCdUtLSUtYck9nampWc1djdjBXZkhaMDRsdEV6?=
 =?utf-8?B?OG1mVjlzNitERnVmOEY5Vzg2ZyswVzlkdFZDWDVUWHVPUjlnUzBDQkpXamlO?=
 =?utf-8?B?RTcyMmpIK1JDNTZ0ZytjREtxQ0NiZWtncFB5M1RMU2Q4blRVMG1SNFZsRXhY?=
 =?utf-8?B?WDVtYVBPK3VkUkdUZkJKSGlaaHZaRXNzWUNxV1NRN3NGSkZWWHVWdCtLUE4x?=
 =?utf-8?B?d2hRbUg2c2t6K3pvQmJuQnVhaWNVdm85Y1lxTnVqQUFDQXJOc0tleFhXWHNY?=
 =?utf-8?B?R25jaGxTblZ0ZDhHSmtwcmZRUTltOFlqOEpBZHExOXR4eU9GMDNVY2tzSjFm?=
 =?utf-8?B?UEp6S0I4L0M2ZStJNGMvUEk3d3FnbFlvc1Z1c05wRytxVFd3VXBxZDFoUGVm?=
 =?utf-8?B?Qk83YzFZTUF1cDlGNWh0VC9NRFpCWEtsUmovQVBrVkNZWEtRd1JoKy9IMkhN?=
 =?utf-8?B?RmZEZC9RQzl3TkV1MTFqV2VqQzBCbWp2WmI5RjNYR21xK090YkROcXdMNStG?=
 =?utf-8?B?SEdOalBQRnlJc09OTkxMUUZLR01JUE9ZbDIxQ0tGY1BHNHZqMjFiakgxZ25G?=
 =?utf-8?B?U2lvUTRUR0FHYjYyTEhDbWZnWkRDb1d1WFdNbXpZYVVNdks4Q0dkYTZCL1hF?=
 =?utf-8?B?ckZSYTdIcWtDZlFKT09BcjdGN0ZaMFVJRGZxR1l3a3lCL0d4VXJvTXZTNkhQ?=
 =?utf-8?B?d21DMldVeUNhRi96bEFpajJudEU4RGJzWFBpeFhtdWxteGQzWnAxdGlPS0wv?=
 =?utf-8?B?VkhSUlU4R2hmUjhXZW1WeU9YUURzLzExK0ZmK2Zsd0dYek5kaXJLQlN3S2xU?=
 =?utf-8?B?bFBoVFo4a0p1NEYrbjNDdTFpZ3hjcmFLTXozSmc4eGVOenFJbWxwTVdHMUJP?=
 =?utf-8?B?Y21heXQ1YzZMa0RyZC9OOHlwNmNKKzlDQWo1ZTZpYjl6TzJQQUZEY2pnK2xQ?=
 =?utf-8?B?RHRleFlKbGtaNGU2bTRsUUFzVW5SdDB4TUh3eC9XeDBxallnUVlPTzdnS25m?=
 =?utf-8?B?dWdmcC9OR0Z0cFJtRG93QStvNjB6MVBEajdmbWVxamNVa0ZFN2hOTjZ0RWZv?=
 =?utf-8?B?S256OVZibkJ6L1JjSGpValNGQi9ycWcxSWs2eWN3NkN1MkR1akY4dXlZdStQ?=
 =?utf-8?B?d0o4VFMwL0VnQThzYXRCQ29IRVM5ZkUyY1lPMkFDeUQxaVdaRE1ldWtJK3Qx?=
 =?utf-8?B?UXY0ZUVQZ2tzY1dkeVRCOGM0RFE2UytoZUlIODY5UWhBeHByU1pyZk8veGZ2?=
 =?utf-8?B?NzNxZVA5M1hCbW5UR2ZUZUlBdGxicE53VW44YUJvb1lDeGo5b3hBSTFWdWx6?=
 =?utf-8?B?bUpYT0ZBYm4ycmw5S1lDOHJPRkZFN2JhejVBSUFWVzdaMkJCalZtUXh2eW1D?=
 =?utf-8?B?YXhJcTZqZWd4N1pnaVVlbExtWm1aWXBjZkhqb2FwUUlWMEZrc2d3dVhDbWFI?=
 =?utf-8?B?bnJZMmZWdXlxeTBrYmF6N055VUplSHNvRmtNbWFrU2h6RTg0TklseUxYSWJh?=
 =?utf-8?B?Uk0zdkQrdUdSZkhPbkpHS2t1WlVlbk13b01MQldpQ3JNQytoWU95bllPNnB1?=
 =?utf-8?B?U0hpQjNlQ2J0TzQ5ZzgrUzljSzFSeWo2TFRXalpnRlVnTysveHAvMStjaXZK?=
 =?utf-8?B?WVNmM3RUczRMVmxqdWlKc0JEQXlhZXRBZitkaU01R2RNZGk0OWZPZFRXMHhS?=
 =?utf-8?B?d05YOW5yZG5WWE9EQU5aMVRqNzdaUGRKMENzT2lueUgvMUV3emdCQ3VIUjFI?=
 =?utf-8?B?aENQMXVDRXpYLy95ajd0aTVrT0ltVGo1TmZ1NUxxdjlLREx0V2Nkc1hrbjUx?=
 =?utf-8?B?bVdmeFBjRDhxOXFaejlqbEcrWC9PVWdkcEZJd2toTENSSk9CY1Jvc2R2dUwx?=
 =?utf-8?B?NHdQWFJFZmhDU21aK3l4UFRjK2g2c2NNZnp0ZUpmbGpJQ0dIdXZ2UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a78e5a-4f62-45dc-889a-08de62378bbc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 08:46:24.3766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNUjnqiIHxtkChVA1fslotaFzPfmzxh4RihAoF05greBRykU379VsPZ6tEGBe8a/PRsG35cif79Sb3nTsvf4rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6947
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



On 1/27/2026 4:53 PM, Mallesh, Koujalagi wrote:
> Hi Riana,
> 
> On 22-01-2026 03:36 pm, Riana Tauro wrote:
>> Add devres grouping to handle device resource cleanup during
>> PCI error recovery.
>>
>> Secondary Bus Reset (SBR) is triggered by PCI core when the
>> error_detected/mmio_enabled callbacks return PCI_ERS_RESULT_NEED_RESET.
>>
>> Once SBR is complete, the slot_reset callback is triggered. SBR wipes
>> out all device memory requiring XE KMD to perform a device removal and
>> reprobe.
>> Calling xe_pci_remove() alone does not free the devres allocated.
>> Since there are no exported functions to release all devres, group the
>> devres allocations and release the entire group during slot reset to
>> ensure proper cleanup.
>>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c       | 7 +++++++
>>   drivers/gpu/drm/xe/xe_device_types.h | 3 +++
>>   drivers/gpu/drm/xe/xe_pci_error.c    | 1 +
>>   3 files changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/ 
>> xe_device.c
>> index 16fc6da01357..0cf6480b8aad 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -440,6 +440,7 @@ struct xe_device *xe_device_create(struct pci_dev 
>> *pdev,
>>                      const struct pci_device_id *ent)
>>   {
>>       struct xe_device *xe;
>> +    void *devres_id;
>>       int err;
>>       xe_display_driver_set_hooks(&driver);
>> @@ -448,10 +449,16 @@ struct xe_device *xe_device_create(struct 
>> pci_dev *pdev,
>>       if (err)
>>           return ERR_PTR(err);
>> +    devres_id = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
>> +    if (!devres_id)
>> +        return ERR_PTR(-ENOMEM);
>> +
>>       xe = devm_drm_dev_alloc(&pdev->dev, &driver, struct xe_device, 
>> drm);
>>       if (IS_ERR(xe))
>>           return xe;
>> +    xe->devres_group_id = devres_id;
>> +
>>       err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
>>                     xe->drm.anon_inode->i_mapping,
>>                     xe->drm.vma_offset_manager, 0);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/ 
>> xe/xe_device_types.h
>> index 2d140463dc5e..3a19e9b5dfae 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -672,6 +672,9 @@ struct xe_device {
>>       /** @in_recovery: Indicates if device is in recovery */
>>       atomic_t in_recovery;
>> +    /** @devres_group_id: id for devres group */
>> +    void *devres_group_id;
>> +
>>       /** @bo_device: Struct to control async free of BOs */
>>       struct xe_bo_dev {
>>           /** @bo_device.async_free: Free worker */
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/ 
>> xe_pci_error.c
>> index a3cc01afa179..0960aa5861bc 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -65,6 +65,7 @@ static pci_ers_result_t 
>> xe_pci_error_slot_reset(struct pci_dev *pdev)
>>        */
>>       pdev->driver->remove(pdev);
>>       xe_device_clear_in_recovery(xe);
>> +    devres_release_group(&pdev->dev, xe->devres_group_id);
> 
> We see use after free issue. In pdev->driver->remove(pdev); call xe 
> structure is removed. We can handle devres_group_id by assigning locally 
> and release it.


No xe is not removed in xe_remove.  xe is also a dev_res.
If you see here in device_release. Remove is first and then the device 
resources are cleared

https://elixir.bootlin.com/linux/v6.18.6/source/drivers/base/dd.c#L1243

Ideally using devres_release_all(dev); would be better but this is not 
exported.

Grouping is the only way i could think of. Any other suggestions are 
welcome.

Thanks
Riana


> 
> Thanks,
> 
> -/Mallesh
> 
> 
>>       if (!pdev->driver->probe(pdev, ent))
>>           return PCI_ERS_RESULT_RECOVERED;

