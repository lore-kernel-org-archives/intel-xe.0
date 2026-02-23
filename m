Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CF7EA4FC4
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC87810E00F;
	Mon, 23 Feb 2026 14:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KFp/2XFT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE05A10E00F
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771856361; x=1803392361;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qJMHWoR+vVSqLY8bpuEwXFzUgKMCXUJkO2fv6AOTjQk=;
 b=KFp/2XFTnVQTnwO3FaixmfOqjYSHesC8a9wOlY4WX6lWZDM5lcxdcMLS
 KMIcuY2uqiVEu0nDlF3wwRLshD1tmRE+oOjxxpTWUyZo2kWpMnToFZYhR
 2xvTDpr3dzkrGiAXBOhhjxwgciJ45dC4o/GeZOWwdWLJBrmo4RQhZkqph
 kcoxdEtpKWVeX98mUFzXBfUUV/SYgZ2YBR4T2crTQoq3RhOD+LDRFrIUR
 kVUVn8A4l3WoJS0MFYcN797O5ejy7Nwo0L62YJwjgFiuyNQ6gyiupYU6w
 c7YdKCSJ4w/j+fKh/iInAzMh5FTZ454a6ijR1CEv0xxI3G7wtOgboIFgb Q==;
X-CSE-ConnectionGUID: rG2Vb6nhRaisNnoNpFbfAg==
X-CSE-MsgGUID: tch2P3xiQDSF9ww8g+R4bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83476843"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="83476843"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:19:21 -0800
X-CSE-ConnectionGUID: FyxE7ioiQx2vii5ggnYFVw==
X-CSE-MsgGUID: h6GQVeU1RZ25fPLwnIM2hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="213932648"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:19:20 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:19:20 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 06:19:20 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:19:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhlGjMAXiHGG7PIX1519gYnyZJFXwj73JEyc5FZDUcMy4eIHzirs4JRMbIskKRd887yB2i5Ovcy8PfdHD6Uh9GZOOWZUgRtyuyRhXzugBVCGf36IZ/NlH1GfclWTVIQEMHH6Jmdqbm8P+qn/KfNB55+12FvBHH/1teNMbGedUtv5NbkYRjWBYZdN37B1KlgWSEkqHFqExIYG7W73F5XUx74WeOsXJKuPqwxxAbezGNk5pHiVvEclxaYheaAlMb+RjN+1IjIQhd3q6E4OKI0BQqj0tBd1M2NydSJ8LTdMYJ7a/pwXj8nX0cxAKI4PeWvH5jToaU3TiqhiB+eHJhhlNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iqw3Zwp0JFypXpmQuOF2x7YVw/ihafXSdqUJLEI6hq8=;
 b=kbcTWnhwiQAPpxNDs2n8I3TiqTy3LS8axJN/A998Hq5MHR7Bts5PbmWv9EbRJp6YTKuHquwMI68pa0c88GG1Z7GQlmlqLyCJbibAoyBpi+p+2EPfc5OcNzWN+5h9k/NBRkh37+agkcd3AEjujEQj0BlnIEMHzaJQAs5UOo0JijxjsukL53MITyY4k+IhanqPs1S4qpIWLzVsXoreU3MbkNr+xdqeMKVpvvEshnRf113OY95BbHJZYeIEZ9+/03lWRz3VlGPdaiuhyIzKpMUYl87BKwNGwlwftmNbg4azJ9yk4JCecVqiQ9ROWlZgtdAmW3cRwtypFpcOhVw/ZEEOkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CH3PR11MB8749.namprd11.prod.outlook.com (2603:10b6:610:1c9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Mon, 23 Feb
 2026 14:19:17 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 14:19:17 +0000
Message-ID: <cf766405-5ce2-421e-a91a-16ab6473a816@intel.com>
Date: Mon, 23 Feb 2026 19:49:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/xe/xe_ras: Add structures and commands for
 Uncorrectable Core Compute Errors
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-16-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260122100613.3631582-16-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0203.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::7) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CH3PR11MB8749:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5e6554-d1dc-4fe2-7686-08de72e6874a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmVMOVVhRHdYc1hqN2pSNm90Tld2OVBhdkVvS1ZSenFLSGJWNHlhREE1Rlhi?=
 =?utf-8?B?WlFTRUNBVE1CMk5ETUZVa0s2RTR5YitlYzRacTVvK1pCWUltUzZrZGtLaDV4?=
 =?utf-8?B?MkNwWXNvREVYN3VwSkZUaUZVTFRJWllRalhsV08rWW5EcWxGVU9YUW5zdXll?=
 =?utf-8?B?RDVrRWJIR1VISWJwVTZQYm1UK01SUDVpT1dVTlRHa2FDQkZ1SWtjZG1JTU10?=
 =?utf-8?B?dDJEVENWbExUb2NxRkhIY09FYTFqcS9jaHJGdU03TDhtd25xL2NUWURuenVw?=
 =?utf-8?B?cHIyNURFY01BNW1JS3RTL2M4NzRuZi9OV2NEclpLSTNmbCtueFRpZ0ZIZUcw?=
 =?utf-8?B?NlNmUGhpQm9Pa1lFUFFxY3Jsb21GWGhFNlpDWmdXUFFrVlc2L3BQMHduZmdp?=
 =?utf-8?B?amR3dDZTNldxVnI3YXc4T01LcWUrVzVRWDFpSXVxQkxGN2VGaVMwQmVQUGV0?=
 =?utf-8?B?NGVsdFl1dER4Z1VSaXE1Z1lsWFprRTBnQlpmSXdkaXZPUlhBaCtTTHBLNkhG?=
 =?utf-8?B?TGlKWUVXVUh2blBPM0JjZDdhU2JIM2hiUFhoM0g3RkJ2QTlZT3c3TGhIQ3Js?=
 =?utf-8?B?TUYyendRUFRydmhPendSbjVPeXhTVmZWdElpazlEWDI3c2ZPZ2R2VXcrZUd2?=
 =?utf-8?B?emhwc3pycXZraGptWVUwQ3BaTzJtSVZhSFEzME12L012VjFVQ1pXOTRXNDZV?=
 =?utf-8?B?cTY1WmpkYldwN2NmY3lqQkx1bnFSQ0p0bXpqcnVnK09HYWVoMkxGdVVnMUM5?=
 =?utf-8?B?cHhDM2wrOVpZUHQ1R0ZOVkYxa2JWTHpZWmZFdDEwdDFaMFdlb25sM0NUUHRa?=
 =?utf-8?B?akthTVI0RDUxdkZyN3JSMEJxSzFuNzJxeU1XN3FUbkJKYXFmT3owQ3IwT2dP?=
 =?utf-8?B?OWZBZTZJS040VnI4M2EzK1Q3Q01lQXgrQXJBTDdLZjhCb09LblFqbkhhZVY0?=
 =?utf-8?B?RG82blVVN09XTkozaDAxZzNuL0FtMEZJeklqc2R1ZlVNbVYvNmlkQWU3QTJJ?=
 =?utf-8?B?TG95NGc0WWlpSThtSWJCWDBERWdobVY2blNlNTBQKzl1UFNkK2VCRWoxSkVL?=
 =?utf-8?B?MG9ydUkxWUxLZGZ0b2NzVjI1TzVTcFpzYUJ1ZWMzUHlrSkJUTGVOU2w5d2Ft?=
 =?utf-8?B?NjJrRjgwWEs0S082czJOZTd0b3FKbEtQakg1OS9KMEtkK2hpK2w0blVTZ3JL?=
 =?utf-8?B?UzBMRUFEK3FKSHNsQUZ6aU4vSXJNQWVZM0FYMWU3MGJJbnNnbVBMZ1BXR3F6?=
 =?utf-8?B?UXlFbUlDc25nYUNZL1k1UWJjNFB4aFo4cXVVRHpqUFcwNytzTjc1dU4yVUZJ?=
 =?utf-8?B?NGRiaFkrdTFvUzY2c1pGdVI4M1lVY0ZTZlM2V295eVJTM0d3VVVJK3M5cXU4?=
 =?utf-8?B?WGFjMmlUZkhVUllTT0RHcjJ3cHRqU1I2Rk14ZlNBNjBCSmdORlBXcThJRHlr?=
 =?utf-8?B?WVhreXl3Z09RNXNHT3VTbDE2OW9oOEFFelVpMzB3Q21ib2JpT3BEMXZEYmNF?=
 =?utf-8?B?bGE0QVJMVzFQM2J4Q0VXSGJreUNBR3l5d2d5eW9nZFlOK1l1UHgxUUxHZDZv?=
 =?utf-8?B?UERSaUpDSlEyWFJ3T3RkUWsyZngwRjdsYlNQU2FndWs3di9rVlhHak1wZGsx?=
 =?utf-8?B?TDZyeXlsbDIyeUMyV2xKOVIvY3ZBT0F4NlprNkF2ZmZERnpCM2VGL2MycDdO?=
 =?utf-8?B?dEI1MXpIWmVrb1Bsc2RLank3d3hYZUtiamwvT1BjZDE1S0VVVFp6MzIvN1B4?=
 =?utf-8?B?SGJiSjhxQzMwOVdkY2V6Wk1yQnFkZ2Y0bVUyc2w3UGpJYU9wdE1HRmxLQUlE?=
 =?utf-8?B?WmcrSW9qV3QrNUdpOTBtb2tQdTd6MU5TWG9MeEltU3BmNWtmWVFCcVNXK25l?=
 =?utf-8?B?V1Mwd1Axdkp5VDdoRWhWVlpHZ1VabWRweUR3L0t5dGhQOFMwc0hDYXNEQXRW?=
 =?utf-8?B?Nk1qbXpKRU9pUzJUUCs1dUpIdUF2UFRsdHBMTWtvSUUxdVlHMkVwVWhGTGpi?=
 =?utf-8?B?NWRIbm1NT2hXQnNLZmM1MGdmcjRVRWdDTFozUk96Q1p1NEZoeFV3UlpCRmd6?=
 =?utf-8?B?eENmUzhseW96bE8xVnhjT2dpa3NKY0Roc2NqdWFoSkRrN3RuekJFQU5GUmsr?=
 =?utf-8?Q?mSto=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGdheFlDYXYrRldZSG9GbTZNaEpwd2F4VUVNVVFRQ2dxd3dSYjUzaGJIRUx0?=
 =?utf-8?B?MjhaUzN4QU1TRnpvclBKV1V1MlJ0L3BjdEZ5VUlEa1pCa0dMdTFRT0dWTXI4?=
 =?utf-8?B?ZVViakswY0RweCtLWk1McHpqQ0hvVzFZUDlnZVVkaHJ3c25wOW81VGNQZlpr?=
 =?utf-8?B?d2Z0R3dERkY2NVF6U2xEY2JHY0t6SVJZNWlOS2h1bllWRmJUbHVOQjVyVHRJ?=
 =?utf-8?B?SHp6c2lCVFQ4cmZCVStTV1JaM3IvYkc3U1pOK2twUmY2TjFBSUl2OHdlSGpU?=
 =?utf-8?B?alFFTHhYYUxHMktxWGNlWk83STlqZXFtYkR6K0YxTXh2UnhPSmJ4dEdUYVNW?=
 =?utf-8?B?Sk16NXg3WjVwNkJka3NlSVQrWVRSb2NQM2tJSzJYNTI0emFhaG9EWGFJL0hM?=
 =?utf-8?B?UExoa0ZhaDdyTFhBVnRLYUdjVjA3V29RWVQ3aU9WYk1XMEVQL0YvL0o0RDNW?=
 =?utf-8?B?YzFkLy9ZMGdBNkJacVBwSngvVlZranJRMmZhY0NJb3hqSmM2YU1ZOE1vWVpn?=
 =?utf-8?B?M0RIZ01ieE1sdnhLNFpJa0VCQ0pxY2IyZ1dONzRkaU1maGcyN1htNWlVekJ0?=
 =?utf-8?B?c2Vyd3dkMlhCcmZreVlXcnRSM1VOL1F6ZkhYbjZRSE5JTDFsVGx5RkJraVRR?=
 =?utf-8?B?MmI1Q1ZZM0Uyc2RmMEtON1ZaMGFKOVY2SURHK2orSkR3dmpKNlVRTFJyTGlr?=
 =?utf-8?B?OUxOK3hQdWQvSXR4NUtrNG5Fd1dsdFF1TFhTT1J4ZGpXaUJ6WGVybVpzUDlo?=
 =?utf-8?B?cTJ1YWVPVWVySS9LWHkwQWdVZGwyNXVSSUl2c3RNcDFxbS84YW5NMUpMUkVV?=
 =?utf-8?B?UlZCU0R0M1VzK0FrbjZyOUVpYlBWL3NOb1pSQWd3UHZZM0dYK0NwS1lmSkdq?=
 =?utf-8?B?NjVjTnllWndXaDVUNDRyZ0hUdkxvU1VTUlk5OURJdk9MT0VIOFlvcUN6b1Z5?=
 =?utf-8?B?bUZheVpYWndhbFQxZ2NhWUtiSWpyUXpBVWpXNHBTeWRYcHZHRXhsVkZGQUVO?=
 =?utf-8?B?aDFSeUZ3akk1dzUxMDJINGxsdFR6RkhrOUZiYVJ2Zkh0NXNqcm8zcll4Q3Rx?=
 =?utf-8?B?QVRnK1lia24wNy9PNExzaUI2VERZWUF4eDdJanR6QnBtUDVpZENYazY1eTkz?=
 =?utf-8?B?SGw0cDYrdXN1R0E3d3k0b2NnNWVkc1oybzUvL1loaEhwM0xwN2daa1I5UlB2?=
 =?utf-8?B?ZnRGREIvQ3dNN2d6OHl1Rkg2Q3V1NkxoU1hQZnJJK2dxYkNYNlloNkpoVlRj?=
 =?utf-8?B?dlYwUENka3o4eVJQazhBZkN3a1BxSFpVMWUzdnFkM1Z0VWtmVWZVeU9GUXN0?=
 =?utf-8?B?eVlKMGdjVWlHVjY2V0JTa0RhWVBPSnVMWVhMOXFwUndGMGxzTGNVeUlqOVNr?=
 =?utf-8?B?dVgxeWNyQm0xOGphZXZJeUI5dVRRZkRleXRhOWlaa1QramxMYjJSZ2VvQVpq?=
 =?utf-8?B?WFF4c3lOc3pVa0pKczUzbjJWNTMrL2N5WjI5Y3NjWmVaSUZpd3NlNWZYT2tT?=
 =?utf-8?B?OTJYSFlSblhXRGJDMUZBMVZsYjR4bitESUFGQUI1aXZWQXVBS3ZRZUJkTnNh?=
 =?utf-8?B?M1c4LzY0akRQbVZDWDl2emUyZEZTT0l5RGJ0eTh0TTlVVUxKTHNkNW5qNUVB?=
 =?utf-8?B?c2poNDc3NlNMYUVCYmV4TVZjejJpUW5tYnA3YURZY2tOMWo0bTBrU2hMSVFS?=
 =?utf-8?B?MUl3NEJXc21seWJKT3ZxWFhpeU9lUkYyeU1zaXVnbi9SQVdyS2EyZ3h6cVlJ?=
 =?utf-8?B?b3lXWVoyQnl0Qjg0cUdpUjltYWM2UVRuVUVLLzNhRlpxejZIb0NwSDZyQVlE?=
 =?utf-8?B?WVB4dU5xeHg1N3M4K0UzUSsyTlRBNjJ4VzRCdFRTS3hoUUI1MkljK293enBr?=
 =?utf-8?B?WWlEeVhEWTY4WGZxNVQ4REo3U042N2x5dkVDcVpVSUt1WjBia0xVZnc5QTRX?=
 =?utf-8?B?bnRoV1lRdVZHb1Q4TFpkYTBnQlJHZlBxemZuTWVyNDdxMWxPQ3Zud0gxcDZ2?=
 =?utf-8?B?dTBvaFlVcnl1ZWhEcENRcW5QUE9RWWljUDlyK0EvRm43VzhwSE9xMFZZNFE4?=
 =?utf-8?B?Z0xUVVRZcExmM2xuTk8vRS9SMUt5ODJMNGJiU3BraUNweE9pUkR2RS90QkNt?=
 =?utf-8?B?amVTSkZyV1I1R08vQktCWHVGOCtKTStHSUFiSDBVSm11cWRmbmovelJnWlJW?=
 =?utf-8?B?WXhpaTJkMXVndVBSVWJucm53ZVh1ZU9obktyQmN3bitJVE5JVVJ6MUlmS0t2?=
 =?utf-8?B?UG5HOCtocDBOU01OODMzbnU0QncyZTRrVXlHdzZWMjJBVXpvNXV6MUlXSXJQ?=
 =?utf-8?B?aWFpUVc3Y0Q4S3djV3REWjloUlBPTUhmNHNGS0pJUWlVd3B3MFh5VVJNK2I1?=
 =?utf-8?Q?P+HrgKVUZtJfm0fw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5e6554-d1dc-4fe2-7686-08de72e6874a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 14:19:17.4781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1R01eH9JClZ6zomwWjbXlXht4o4OeifbyfSg9+iT+c7b+Q+YWrWso98WF+mRbFz2tu4fhjdUto5jR8IrOEA0Itkaq6Kpxp9mRWhSpZxCN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8749
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


On 22-01-2026 03:36 pm, Riana Tauro wrote:
> Add the sysctrl commands and response structures for Uncorrectable
> Core Compute errors.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c                   |  53 +++++++
>   drivers/gpu/drm/xe/xe_ras_types.h             | 131 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  13 ++
>   3 files changed, 197 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index ba5ed37aed28..ace08d8d8d46 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -4,9 +4,62 @@
>    */
>   #include <linux/pci.h>
>   
> +#include "xe_assert.h"
>   #include "xe_device_types.h"
>   #include "xe_ras.h"
>   
> +/* Severity classification of detected errors */
> +enum xe_ras_severity {
> +	XE_RAS_SEVERITY_NOT_SUPPORTED = 0,
> +	XE_RAS_SEVERITY_CORRECTABLE,
> +	XE_RAS_SEVERITY_UNCORRECTABLE,
> +	XE_RAS_SEVERITY_INFORMATIONAL,
> +	XE_RAS_SEVERITY_MAX
> +};
> +
> +/* major IP blocks where errors can originate */
> +enum xe_ras_component {
> +	XE_RAS_COMPONENT_NOT_SUPPORTED = 0,
> +	XE_RAS_COMPONENT_DEVICE_MEMORY,
> +	XE_RAS_COMPONENT_CORE_COMPUTE,
> +	XE_RAS_COMPONENT_RESERVED,
> +	XE_RAS_COMPONENT_PCIE,
> +	XE_RAS_COMPONENT_FABRIC,
> +	XE_RAS_COMPONENT_SOC,
> +	XE_RAS_COMPONENT_MAX
> +};
> +
> +static const char * const xe_ras_severities[] = {
> +	[XE_RAS_SEVERITY_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_SEVERITY_CORRECTABLE]		= "Correctable",
> +	[XE_RAS_SEVERITY_UNCORRECTABLE]		= "Uncorrectable",
> +	[XE_RAS_SEVERITY_INFORMATIONAL]		= "Informational",
> +};
> +
> +static const char * const xe_ras_components[] = {
> +	[XE_RAS_COMPONENT_NOT_SUPPORTED]	= "Not Supported",
> +	[XE_RAS_COMPONENT_DEVICE_MEMORY]	= "Device Memory",
> +	[XE_RAS_COMPONENT_CORE_COMPUTE]		= "Core Compute",
> +	[XE_RAS_COMPONENT_RESERVED]		= "Reserved",
> +	[XE_RAS_COMPONENT_PCIE]			= "PCIe",
> +	[XE_RAS_COMPONENT_FABRIC]		= "Fabric",
> +	[XE_RAS_COMPONENT_SOC]			= "SoC",
> +};
> +
> +static inline const char *severity_to_str(struct xe_device *xe, u32 severity)
> +{
> +	xe_assert(xe, severity < XE_RAS_SEVERITY_MAX);
> +
> +	return xe_ras_severities[severity];
> +}
> +
> +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
> +{
> +	xe_assert(xe, comp < XE_RAS_COMPONENT_MAX);
> +
> +	return xe_ras_components[comp];
> +}
> +
>   #ifdef CONFIG_PCIEAER
>   static void unmask_and_downgrade_internal_error(struct xe_device *xe)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> new file mode 100644
> index 000000000000..c7a930c16f68
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -0,0 +1,131 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_TYPES_H_
> +#define _XE_RAS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#define XE_RAS_MAX_ERROR_DETAILS	16
> +
> +/**
> + * struct xe_ras_error_common - Common RAS error class
> + *
> + * This structure contains error severity and component information
> + * across all products
> + */
> +struct xe_ras_error_common {
> +	/** @severity: Error Severity */
> +	u8 severity;
> +	/** @component: IP where the error originated */
> +	u8 component;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_unit - Error unit information
> + */
> +struct xe_ras_error_unit {
> +	/** @tile: Tile identifier */
> +	u8 tile;
> +	/** @instance: Instance identifier within a component */
> +	u32 instance;
> +} __packed;
Performance penalty for accessing unaligned u32.
> +
> +/**
> + * struct xe_ras_error_cause - Error cause information
> + */
> +struct xe_ras_error_cause {
> +	/** @cause: Cause */
> +	u32 cause;
> +	/** @reserved: For future use */
> +	u8 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_product - Error fields that are specific to the product
> + */
> +struct xe_ras_error_product {
> +	/** @unit: Unit within IP block */
> +	struct xe_ras_error_unit unit;
> +	/** @error_cause: Cause/checker */
> +	struct xe_ras_error_cause error_cause;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_class - Complete RAS Error Class
> + *
> + * This structure provides the complete error classification by combining
> + * the common error class with the product-specific error class.
> + */
> +struct xe_ras_error_class {
> +	/** @common: Common error severity and component */
> +	struct xe_ras_error_common common;
> +	/** @product: Product-specific unit and cause */
> +	struct xe_ras_error_product product;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_array - Details of the error types
> + */
> +struct xe_ras_error_array {
> +	/** @error_class: Error class */
> +	struct xe_ras_error_class error_class;
> +	/** @timestamp: Timestamp */
> +	u64 timestamp;
> +	/** @error_details: Error details specific to the class */
> +	u32 error_details[XE_RAS_MAX_ERROR_DETAILS];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_error_response - Response for XE_SYSCTRL_GET_SOC_ERROR
> + */
> +struct xe_ras_get_error_response {
> +	/** @num_errors: No of errors reported in this response */
> +	u8 num_errors;
> +	/** @additional_errors: Indicates if the errors are pending */
> +	u8 additional_errors;
> +	/** @error_arr: Array of up to 3 errors */
> +	struct xe_ras_error_array error_arr[3];

Use a Macro for a magic number 3.

Thanks

-/Mallesh

> +} __packed;
> +
> +/**
> + * struct xe_ras_compute_error: Error details of Compute error
> + */
> +struct xe_ras_compute_error {
> +	/** @error_log_header: Error Source and type */
> +	u32 error_log_header;
> +	/** @internal_error_log: Internal Error log */
> +	u32 internal_error_log;
> +	/** @fabric_log: Fabric Error log */
> +	u32 fabric_log;
> +	/** @internal_error_addr_log0: Internal Error addr log */
> +	u32 internal_error_addr_log0;
> +	/** @internal_error_addr_log1: Internal Error addr log */
> +	u32 internal_error_addr_log1;
> +	/** @packet_log0: Packet log */
> +	u32 packet_log0;
> +	/** @packet_log1: Packet log */
> +	u32 packet_log1;
> +	/** @packet_log2: Packet log */
> +	u32 packet_log2;
> +	/** @packet_log3: Packet log */
> +	u32 packet_log3;
> +	/** @packet_log4: Packet log */
> +	u32 packet_log4;
> +	/** @misc_log0: Misc log */
> +	u32 misc_log0;
> +	/** @misc_log1: Misc log */
> +	u32 misc_log1;
> +	/** @spare_log0: Spare log */
> +	u32 spare_log0;
> +	/** @spare_log1: Spare log */
> +	u32 spare_log1;
> +	/** @spare_log2: Spare log */
> +	u32 spare_log2;
> +	/** @spare_log3: Spare log */
> +	u32 spare_log3;
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 1f315ad1b996..45ef10f5cfa2 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -8,6 +8,19 @@
>   
>   #include <linux/types.h>
>   
> +/**
> + * enum xe_sysctrl_mailbox_command_id - RAS Command ID's for GFSP group
> + *
> + * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Get basic error information
> + */
> +enum xe_sysctrl_mailbox_command_id {
> +	XE_SYSCTRL_CMD_GET_SOC_ERROR = 1
> +};
> +
> +enum xe_sysctrl_group {
> +	XE_SYSCTRL_GROUP_GFSP = 1
> +};
> +
>   struct xe_sysctrl_mailbox_mkhi_msg_hdr {
>   	__le32 data;
>   } __packed;
