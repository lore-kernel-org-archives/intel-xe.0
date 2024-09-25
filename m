Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C479CCF9E8
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 16:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB8510E839;
	Wed, 25 Sep 2024 16:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOi0ebqE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625FB10E839
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 16:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727282787; x=1758818787;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Oij11wVAs/Yo3yY2OKO6ecox77V06DfoNI5fIGoHr38=;
 b=QOi0ebqEEuLZllp5M/kSO6U8sPfT0ldo3XPkVqrZYdf/dDMWyQ4WXBiO
 V+pOQiMVKhSi6Wp0DxOb/2AmBI6HwMAtDiN6kwUWVK436wlr/SJcYjvc7
 HBRyQtUhXvGV567AF7MT6RxzlJd1y25JcKnrGAcFE9MpTGk9dkxMfJ7CP
 ljSHXY2nNUgx2NNvGiHYZGPUUg84hgu13RviSmkPdfDdlpfgY6HdabfwQ
 45A/+LT2mwjOLsrIAsyijGPC7HztW6RJ6A8eA3gjYwU5wmKtdHdFLEVkA
 UT7xXJU0Ps5VvJOaTzOXIQ9FtlyG6kIJD2l2Hc58fWpNHbaQutAfs6fUD Q==;
X-CSE-ConnectionGUID: +s5L85mCSlGaF6xY5WeTKA==
X-CSE-MsgGUID: hpiI3bouQ3eD/AVLQ960PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="29231836"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="29231836"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 09:46:27 -0700
X-CSE-ConnectionGUID: yQWEAEtQRgmlVFIa+0pMQQ==
X-CSE-MsgGUID: zpeQmywjSaK4rSpcHwNpvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="95162370"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2024 09:46:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 09:46:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 09:46:26 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 09:46:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcD5Anvf/I+caWMQurawKveO4r8pA6BAE6BSycIYgH75fiQTCISxBBQpf4BbzFZ0aKRgEN/dbbUwjEaX6cvUYWlZKNEt3y1J0rI3vsd6Twz8HhVrSZQqGfEvPARQ8LbKmln/nk4cLpo4omzQwjNEowOP7m+b16rH7LeEVR5DaGJPia47D0T3hrg9NMLvvB5byoQr/mjqWR9A8n1Drlo+NvyYKwkUtc4r79ztHIX44UUhJatFZNXjq2wiGn8ZKMggZ2NWSdHAjqkO/b4kBO+TAfygepOnig7yZgzi8QD/jPqpkNRuK2JRoOBDKwyC7NRSwSXQWCoSsBhdwSc2rObzaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMxxG4Y6YeQ6RPsVpTGoODnHgC7x1wu/lUwlUR0ovrU=;
 b=a+eH8t1s/c+/SbjDCz8w4yIjvtzARI+lJrF3jiEi6/pSrtq3YFH3P62RX6+TXh16w/MBxnIsywa7mfAEacVBTg4z31WIPJ3eEr7wnv2ohAU0/12HfcZ/cYD7XJz8F65cYuyQU361iCo4r98POcS4Dhq+VN67zxfNkhySs7pCwfguC3j75iGItDQQbbNxwa0sgnk2Jlm9JFST+xQPk9Y1lM0TttHd0xefTWORMUD2y7QIztbnrEoLhmblJ0OAzmM4HzfHncCaZmXrGfgKK8ueDhgF28T8p/ZM4D7W+3HOYcUM/gaWaWF1fpabi8uFdAFRHW0MKaPDui6kkZVgbPOMfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB7002.namprd11.prod.outlook.com (2603:10b6:510:209::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 16:46:24 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 16:46:23 +0000
Message-ID: <4449e498-d298-44a7-b6b3-db3a450f5351@intel.com>
Date: Wed, 25 Sep 2024 22:16:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/23] drm/xe: Change return type to void for
 xe_force_wake_put
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
 <20240924121641.1045763-24-himal.prasad.ghimiray@intel.com>
 <c63e6af4-1e71-43dc-b0c3-9179da40a657@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <c63e6af4-1e71-43dc-b0c3-9179da40a657@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d3ff8c-2e9e-4078-86d6-08dcdd819706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3pEQ284dXdxM25xamkrMGw5dkk4OWgyOVQ2Y3g3U0tGcFFteFVYKzdBTFM1?=
 =?utf-8?B?alFQT05Bckl4akJSd0FDZGRrSGFkbFFBSVV1S2tXQzdRY0NlL1EyVzBnZWNl?=
 =?utf-8?B?RVBrOFBpL056M3dITGM2c0Z6U1A4a1pYTU1kcDBCQmc5NVByb3l3YklidkNT?=
 =?utf-8?B?T09aUUNuTmJyVmRwbXZYVG9uWkF2Y1pUMDB5VU5hSHdXSDI0Mk9LdENyTmJV?=
 =?utf-8?B?SDd2dHNjUVZpREU3enlyQllYUlVVWTFLWWd6ZC96bEVyK2Y2MW10Wkg0dEpy?=
 =?utf-8?B?Tks0SWVmZzJRelQwS1BOMFc2Z0FzT2Jqcm81QU5aNmU5MHdtam9EaENreWx2?=
 =?utf-8?B?NlVPYi9JUC9UbFZvbC9NaVVFZTN0Uy9ObjFhN2QxVVplaGFyZ3p3RjJEbzJG?=
 =?utf-8?B?aU9yamRqS3pBaXppRC9uaTlpK2RBY1dZa2V1bjZhQkJuSDRWbXUwQzZGKzFp?=
 =?utf-8?B?VldhN1lFc1RIWmVRL1FRVzZ6NVJuQWFBcVJSa0VGV0NHS3Z4QXJYREdyNEU0?=
 =?utf-8?B?a0M3RlRqV0Y0K1BKbDBOYXE2Tnd6RWRBSyt0VnZ3S0pPOWpYRVFFMGJPSURH?=
 =?utf-8?B?NHhkdy8xRVV5SmZkcEFjSEpubkd6SDJDbytDMGpiUHBkYmcvSW53YzdqWnFU?=
 =?utf-8?B?ZkRtUUhZQ0tKYW5ycDV0eUNjUmc5d3lnandHK05VOUJNcFB1bXNLUFNrZzRi?=
 =?utf-8?B?MFp3dTlBRHB5Ukd2Si9jV1hhNmpFZ1MzZ1c4VTJNWEFQaE1IZ1M3NzVZKzNZ?=
 =?utf-8?B?QVRWOE40dnRJWEowc01Ea3N4Q09wYzJmSElKd3diNCtoeWRGcGp2TTNXZklO?=
 =?utf-8?B?Nk1LVXJRWDdyMWx0ak5Tb1hCK081OHMxNzF3UmFrOWpxWHljNXN1WG5ycC93?=
 =?utf-8?B?OFhVeHZkcjlrZUhENnJnQXpMemFqNlFJWXIvRmFMYjRiWk84dEVtTEFaeE9W?=
 =?utf-8?B?VDdkaXR1b0hzMyt4NnNnRnd6OFdrSnh3UDRGVlRyZ29BdGtKYlBYOG55S1R4?=
 =?utf-8?B?L3ROWU9hV1QwMjFoVzFEbjhSV0RHM2F3ZGVoNlFNejBUWXczdDdvRTN4MFRN?=
 =?utf-8?B?ekZCNmNZcVBZc0FsOC9yRytCRERNSjY2UUVYQnhiYzlHUk9ydWVOQllCRk5B?=
 =?utf-8?B?RGNmdndpTTdyZ1RPNVcwcHJPVUJsQVhLdXRWSFVqVlFYRHRVUzFSbEdLODh3?=
 =?utf-8?B?eFYyc2dJa0dBUWR0R0Z6aFgrL3A5T01EOCtiMzRRYmhFMVovL2VweVpVY3Bj?=
 =?utf-8?B?NHVqd2wvZFBWOFVaYkI5c3lyd0pXazQvYUlqNmoyUTRDNm5sM2RsUWJ5NzY4?=
 =?utf-8?B?NUNxdEFFSEJCWjVRaEJlQTZwMmp0Q0hzZ09zVXR1cWVXWjh3YWV5VHhJZjNU?=
 =?utf-8?B?U3lnSm1ySzQ4ZUl4aHlQOHFVT3pXa2RCdHdxZWY0ZDhqbjhKMEFFbkkxRUVo?=
 =?utf-8?B?bFA2UDZjSUhmT1RvUWZ5bnd0cktGS1ptWUsxNTArZUY3SytiQ2NRd1V0SGtU?=
 =?utf-8?B?QWxxUksxL0lyTCs4QlZwanhpTjBhdFp1VmN0aDY5SUtROVFTamJ2ZlJMRy9V?=
 =?utf-8?B?V1RCUVJtRkgwVmdPdndHUTFPejBWbkxOUVB3aEswb0tRUVRQMEF1RXhKclpp?=
 =?utf-8?B?bjVKVUhqWHdmc3QzbCtuZnVyV3BNcks3THBCNkIzVStxc0tiUXVPRkRWZTBF?=
 =?utf-8?B?MHc2elNzcHBnZVBwdjZVQ0VSMCtEMVY4Q1FsQXJCSlgxQllYWWNTcG9vZ3pJ?=
 =?utf-8?B?amRPTDM4NjRYNDNOZjBxRUZCa3VXSUkvT2JQb1NnN0Z2RTNaZXVrZGlSNXRU?=
 =?utf-8?B?L253a25VdXN5S0tlc0NrZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmdOZHBWQWRTTjhHZTRzeTRsN0NBK0xGTkxObGlzdXpyM0ZmVDRFSWg5dWdy?=
 =?utf-8?B?NnhTczJmSS9JSkxrNWFhcjZkdDZjUTk1cE5KOVFIS3FIakdzdVRVK0grZEs2?=
 =?utf-8?B?elVtY0dmR3d3M2Zobi96ZjkrZDFqTk9JZjZYNHRVaVh5b1p4TXlYa3RUWG9U?=
 =?utf-8?B?V3l6NlFWenQ0a3JyWFloa3hNa1I0MGJoandYWGpQeHFuZTlmWS9ZeHZyVm9N?=
 =?utf-8?B?bm0zN2pzQ2wrd1A3c0ZiVUlxMFErZG1QeTBaclh1QlhHaHpYdE5PZGVhZDcw?=
 =?utf-8?B?ZTVoMSt0K2xFamIzV1dtWkJkU3B1M3l2UHI3MnJjdUQreWRPYlBLMEs1N3FH?=
 =?utf-8?B?T0x2ekZSeHVhUE1qbG1nOTcyTlNTYytnd0xBd0trc0tYMlVESjdwS1hXbFJL?=
 =?utf-8?B?MUNBS2ZpL2U1bGZYRHJjVTlnUkpqTUc2ZXl5aEFJQXlWOGw4TUgzQzkwbCtQ?=
 =?utf-8?B?VXA1QTRCRjQvbG1QOHAxc1FxK0NXb2JnN0kzdy96akdLR1pxL3RSbFluaXF0?=
 =?utf-8?B?RVVMMXhMZEphVGFhUzFheXBoOHk5ZytRZ0k5alBBazBIOS96R0dySmRoQ0Ur?=
 =?utf-8?B?Tm14SlpkK2NJQitKeXZzRUNrOW5VQ0dOOC9vdVMySG1LSTdzRmEzMHE2UGxP?=
 =?utf-8?B?djhBSmhNN3Y5NGhHMWVvalpRV21PUTYrTHJyV2VFa0t4VG5jVG11dEVGWlRF?=
 =?utf-8?B?NjhWQnRSbW1MdFRjK0pxOVR5U3Z5YlhQTy9QYzNxZGRXYlZMN3EvNE1uVnVX?=
 =?utf-8?B?TXI4aDBuUU03VmJYSXUvWWpkeDhHcEVnZFAxOE55UXNySWZQVlptTWs1bmdj?=
 =?utf-8?B?c2JZMUpNckZjeC9jTGUwd0FOS2p1RG9jeU9wSVhHMkRHbGFCdWZoeUNqUDJ6?=
 =?utf-8?B?YWdZMjZaZlVmeGxTNzNZb05mNlY5Z2F6SVlvRVlwTjdPNEllQ3NSV1ptMmNv?=
 =?utf-8?B?b1ZWU1dlQktMVVVzdnpMMUtQZXZwUmVCZzRzK3dySHRlY0xMTFM4YW9mWmhu?=
 =?utf-8?B?TU5rZDZKY2lNYndMMW16VGhZRE5NN2xRS0tLQi8vU3czdHlsK0JMWnpiVzJ5?=
 =?utf-8?B?dHlPaVRUZXN5STZ6cUREbG0yQlZjODVKY0hBUHhOUE0vTmJ1TDRKR0NrZVIz?=
 =?utf-8?B?RGlBOHYzZnpsRDJ3dXJxY3J3NTEyd0ZOTE01alFFOVIrd0pRNXl5RHRaQVRr?=
 =?utf-8?B?T0tMcG1jUk9tdllhZ1pmZmtXaUxhTndDVmlRQlYyYm9xblRPeFZxUTAzWVNz?=
 =?utf-8?B?R2x6czVoRXMxRHFJeXpVNG8zRG5OcHIvOGoyMDl1YkFRZkFjRjRNKzRpc3lV?=
 =?utf-8?B?c0VuRlAxUzgvQUNkMTlzcEgvNE5PK3NZZWtjRWRHVXF6WW1HKzAvbFA1TVlq?=
 =?utf-8?B?Y25rbmVHZUUwdWdOQjN0RG1VbEt2bjBDRWFMUUJoRE1WaXgwR3ZNK1Q1ZVNZ?=
 =?utf-8?B?Sm1RMTg2enR4OXlOL0tnQUlCZCs1VVdSbm9Yd0JQdzFqUGQ3VEJ1OUMvSW0r?=
 =?utf-8?B?VjZ2MmJMYkVQS2xpMHZNekdMYU1mVTBCOTQ0TnIxcjZtYml0NUp1cFlPeTNq?=
 =?utf-8?B?MWZmSVoxWk1WVjg5cTdiSjBoWDBoWlZHYnBUYnIwWFBmdmV5Wk1XeG0rZ2VP?=
 =?utf-8?B?L1pIWkZ3VjE2bFpOcHE0VzhQMS9QM0w3cmNqVjRldUtTRE0xZ1p4RE5BOGFI?=
 =?utf-8?B?TkQxTFZFMHdlb3NTaDZrUFBpYy9WVVdRQ3NHa3RXM1Bxdm1nZ24wK0pxQ2d2?=
 =?utf-8?B?dWlhUFFKWDVPL2tuZjF4N2NtZVd3NmtFK0ZJYXNHenMrcUxEQmp5LzFNK1hV?=
 =?utf-8?B?dWZwZllLeURoZS9telhnWmZSdEJmczY4VTRSb0lYN3E4cUdTOTQ0QVZWdTBr?=
 =?utf-8?B?T2k0ZEVvWlNiL2pkVko3RlVXaEpvUVl0RDhHang2MWJGWDd3ZW9HQklIZUpO?=
 =?utf-8?B?bjRQVWdicE9TUjFvQTl4SmQ2OWhLOGhObEJzdVhKQmduREpuV00xbktSSnNG?=
 =?utf-8?B?dGdLaExqUC9IelBTTXlCTFpOV0lWUFlFbURCK3drZ0JKTCtyMWlvVGtzdDls?=
 =?utf-8?B?aVBrVVFmL0xmYjFFdkNoOVpnZm1kaVNRbnp1aEg1NU9mY08wODdpQ3dqUURi?=
 =?utf-8?B?SXdMVGhNWmlxa01XRVlBNmoybU9HcWZEd2l3VmxidzJ1a3huUXBBNmlsVSs3?=
 =?utf-8?Q?U9AUspTrJvtTMKE3e5vOoSY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d3ff8c-2e9e-4078-86d6-08dcdd819706
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 16:46:23.6866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dArJvweqfUlf3a8/MeDjU3i8r6rFgeoliEvD7Xp9gVTF1sdwGyTQ3EdSctIztCiR3ff3s6B8Q5dOfztNJ3fQ6+e8TkUsIN3krMS82MQTD4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7002
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



On 25-09-2024 19:37, Michal Wajdeczko wrote:
> 
> 
> On 24.09.2024 14:16, Himal Prasad Ghimiray wrote:
>> There is no need to return an error from xe_force_wake_put(), as a
>> failure implicitly indicates that the domain failed to sleep.
>>
>> v3
>> - Move kernel-doc to this patch (Badal)
>>
>> v5
>> - change parameter to unsigned int in xe_force_wake_put()
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.c | 20 ++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
>>   2 files changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index d2eb367da7c1..c2c55d3de36f 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -11,6 +11,7 @@
>>   #include "regs/xe_reg_defs.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_printk.h"
>> +#include "xe_macros.h"
> 
> this include is likely not needed

will recheck. Probably a leftover from XE_WARN_ON. Thanks for pointing 
this out.

> 
>>   #include "xe_mmio.h"
>>   #include "xe_sriov.h"
>>   
>> @@ -196,8 +197,20 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>   	return ret;
>>   }
>>   
>> -int xe_force_wake_put(struct xe_force_wake *fw,
>> -		      unsigned int domains_mask)
>> +/**
>> + * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
>> + * @fw: Pointer to the force wake structure
>> + * @domains_mask: forcewake domain mask to put reference
>> + *
>> + * This function reduces the reference counts for specified domain mask. If
>> + * refcount for any of the specified domain reaches 0, it puts the domain to sleep
>> + * and waits for acknowledgment for domain to sleep within specified timeout.
> 
> nit: if this timeout is hardcoded maybe mention or refer it?

Sure.

> 
>> + * Ensure this function is always called with return of xe_force_wake_get() as
>> + * @domains_mask.
>> + * Warns in case of timeout of ack from domain.
>> + */
>> +void xe_force_wake_put(struct xe_force_wake *fw,
>> +		       unsigned int domains_mask)
> 
> nit: no need to wrap, your kernel-doc is much wider

Sure.

> 
>>   {
>>   	struct xe_gt *gt = fw->gt;
>>   	struct xe_force_wake_domain *domain;
>> @@ -210,7 +223,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>>   	 * in error path of individual domains.
>>   	 */
>>   	if (!domains_mask)
>> -		return 0;
>> +		return;
>>   
>>   	spin_lock_irqsave(&fw->lock, flags);
>>   	for_each_fw_domain_masked(domain, domains_mask, fw, tmp) {
>> @@ -229,5 +242,4 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>>   
>>   	xe_gt_WARN(gt, ret, "domain%s %#x failed to acknowledgment sleep\n",
>>   		   str_plural(hweight_long(ret)), ret);
>> -	return ret;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>> index 0b676462c97b..a79c98ed6d2f 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -17,8 +17,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>>   				struct xe_force_wake *fw);
>>   unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>   					    enum xe_force_wake_domains domains);
>> -int xe_force_wake_put(struct xe_force_wake *fw,
>> -		      unsigned int domains_mask);
>> +void xe_force_wake_put(struct xe_force_wake *fw,
>> +		       unsigned int domains_mask);
> 
> no need to wrap the line

Sure

> 
>>   
>>   static inline int
>>   xe_force_wake_ref(struct xe_force_wake *fw,
> 

