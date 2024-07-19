Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CD3C3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 21:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA8610E073;
	Fri, 19 Jul 2024 21:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAACLY1p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA6810E073
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 21:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721424763; x=1752960763;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+vcX6yrCAA4xOCqYpsQg8bxPj8rJQgnmiKttv9VlmlI=;
 b=DAACLY1pQw7u8a87h0/avC1RfrZAYwMSVkOxNRZSHpRCGsF8ocdZ/9Gl
 +5jEMvmntcc/YSn2Fwcmw4yoQT5/ypTUUuBr+qDP2nfDl9ymq5lXom1zK
 exTkaIbD44buv6Gn28l6qwEF+smEAHMlO+fh23JS39JPuBBIqk82rNyoH
 hv3Oh4h3uNX8mV82ygr/D2I01UIgkTtfgRpnAL/uucPzt/R5y04l3eLIL
 GeZH+TdNTFuUbK3VeCM8F+Ozt7l0tfK0JshFcwUL66Xa0JqigBhDXcKHe
 sF8Ltg+V0f1VwAh5GZ7hlmSln7Z8QtTcz9jyV6N6vmEI1m8ZZoIlMchKM w==;
X-CSE-ConnectionGUID: aNrSaZ9oTva/0vrkoNn1xQ==
X-CSE-MsgGUID: ybGyjT5VSl2mf+2bm8b4gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="36498791"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="36498791"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 14:32:42 -0700
X-CSE-ConnectionGUID: fqhTZ4TpQJ+SEE5V5OpdGg==
X-CSE-MsgGUID: Lxyt3qE3SdGlKraAOccl9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="55529324"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 14:32:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 14:32:40 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 14:32:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 14:32:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 14:32:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c46kOR2sA/CwQco1KWvj990YQJ29DQrnVCw7jv2PZteMH6rUN7Cq2643ynbloTyuYp1HpS3YxbVRurciJPHuiqcMLxgwHEIVYpP/L6n7LMRIr2CXPz2Vc7VoTkZfAdwxO+iwgdRui8sSkcOSbCxn6ETq+51F/mdVVHxOK1UJW0qa1GCLhlwl3tHuLNkwIathrApccKenfQBptl39gVS+lcpEdS6ufHWAe6jBS0cuYib09mP2+0xKToxerCixgfQfqH14TXqYlZppg3dNjlK0eEkkIBHM9J6Il/TchqzEebk/JxWfsckj4c5WkcNmIVmDj20V+npxLr4Fa+Et4LZwPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tsw3tU4ngQ1SD5wrVefecHYonYgQCLun6Mv7efZzml8=;
 b=fEqstQaVo1XFC++Aj86CK1gDpAt8lwc7EHMFILNF//anL/UgEz/t2vMxwM6WTTtnObVHgviQLf9PLtV6dcAfgHK3RbDRyYkWZtZIlxdIr1tONQezyEP27N/fyqXMGrzQDpCxRE9dctnyjNrUDZa3Zsutkagl57T6GbPC/PEB5hu4tsvOBjlMPk/UrYNMSPnBMhAf6KAmrhM+Qi4k/N/ics7Hd2CNpYHh/rjkbErtHK4TQcItgr/FQXdEYHhlYZiCapx0pzIcNkO4GamBUx83Wmj/Av+elnoeaWRpF/VoexpcdOiRBaznmQjTH+NIj1fWkiAuJ0MA/ETyHPPj1aGwqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB5021.namprd11.prod.outlook.com (2603:10b6:a03:2dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Fri, 19 Jul
 2024 21:32:32 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 21:32:30 +0000
Date: Fri, 19 Jul 2024 14:32:28 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Harish Chegondi
 <harish.chegondi@intel.com>
Subject: Re: [PATCH v2 0/1] Add support for EU stall sampling
Message-ID: <ZprbY4TXmfXXBpgu@orsosgc001>
References: <20240707224141.2865472-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240707224141.2865472-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::31) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB5021:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b95d5b-bdc3-46c2-3916-08dca83a4b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N08velZuODhKaHgrdmppeXd5cjZmeVg4RHdpb0VqS0NSU3pBODJyQ013dUds?=
 =?utf-8?B?ZXdLY0tJUGk0QjNmUkg2VisrNC9FN24rZ25iaDlJYW5lendoMHZBU1FDQ2J3?=
 =?utf-8?B?alpBeE1FUWRTOTI2R3UrcEJzMnUvWnk5cms4T00xWHM3bTgwZ2Y0OUdpbXJF?=
 =?utf-8?B?NE56Szl0ZjdrcG1BRStlMWRCMmZIK2M2RFEwOGlNMlphUEpTL0lmRXEvMko4?=
 =?utf-8?B?TmRqd1NiNFg3UE9LYmNHYWVZb1dVTXlxekVLWXVsbnhVTTVlM3B5SHBNSHQ1?=
 =?utf-8?B?dGFOVTg3Y3pPU1A5WWtmY2tscmhVZkR0VDdNZEJnU3paTG1TMWNhbXN4QlVJ?=
 =?utf-8?B?d3NJbG5lS0JSb3R2YkpZYWtVWUNPQUtHSzJqWm94NEdUNlVSdTk3S283MHZ1?=
 =?utf-8?B?b1FtelZzZ25CbDZ2d2JZeTN0V1VBTVM0VGp6NTJ2OXRFTG95QWRPYUdtc3Vk?=
 =?utf-8?B?Mm5rN0MzUXhUUEJLKy9wUFpNN1NlaXBZS3FwamhaWWhjMkN5cW56QWk5QkZw?=
 =?utf-8?B?WVpHRDVkZlJSSnNLUlp6UnduTW0ramQxOTdMRGt5M1g5TW5JY0p5aXQzM1BB?=
 =?utf-8?B?TUJkS3E3R3dLeUZ2ZXByNS9tWFhhSVFoWE1PU1R0bXVqTDNTRFQ4b093YUt5?=
 =?utf-8?B?SXBPRGQxSDRtTXE5SzY5NWpia1l3UGJlZCtpcGdSZ1B1cld0bGdCQVY0WDIy?=
 =?utf-8?B?eXJaTXpVRjNOdFR4KzFycEMxeHhJSUs5UXNyZUc1cUdIVE1JR1NIWGR6TTlo?=
 =?utf-8?B?aHZxZmN4Zm5nUXRqbVF5NUlheGtRbVFhRmYwMGQ1YkRnZXNrTStyK0VIZ3ND?=
 =?utf-8?B?Q2hhRnljL2F3UGR6RGE4U0s4R3U1d1R2Sk1mSXJFazg0ZjNLWFNOZGRjekNl?=
 =?utf-8?B?TUx3bCtPSU9Mam1TZzNFbEJnVkNtTHN1SGpWaEJaMzNBQW1qdERaTWxQWERz?=
 =?utf-8?B?ZExEQldnN1BlU0ZqK1k4Y2JHT1FGU2NYcThyMXdOL1JOWUFnWHZYNTJrQ3Zi?=
 =?utf-8?B?TE5xNGRFV0QxMXRPQXE3Z1JuZlFiVm9rSllDeWppUXlGaXdaU28xanVTaGky?=
 =?utf-8?B?ckN1YThlZFp6YnE2ZDZKYzdqcFlOUzZqR0RCcVYzZ2dvZUduRURoZVhjallQ?=
 =?utf-8?B?RU1Dck5LZGNtNm1WWFRUVk9MV25RUU94anJyTHE5SE8wYXB2NkoycmIrYVNh?=
 =?utf-8?B?UXBGaTlqMHlMcmhlaEtCZ0FaSCtDREJjaVFiNEtZOXVoQi96dUZ6Q2JnYllI?=
 =?utf-8?B?aFNEV0RBcGcrZ050R05rbS9LdG9NdmVFbE1OQi9NelR6bXdRNHhWTW4xRnkr?=
 =?utf-8?B?c205UWgxcHhvTit1dUZNL1pZTTlQakZZeWlWZ0xCd0RVVUZxQnpZUm5HSlFp?=
 =?utf-8?B?MWRVUnRsYWZoY3YvelVoTkFHUkErWWkrVStTQjBkMVluNjJmalRxY29FMkUv?=
 =?utf-8?B?d0pBQ0VyTEpuVjV6TVBvd252bVEzeEJPSkUvcWJucVJpd0UvU2g1b0xHN3dJ?=
 =?utf-8?B?b2x2aWxnUmtYNzVaNG9vamIzZ2ZxdkRmcCtFaWMvSGsvaHRncnpVRUZRVWdy?=
 =?utf-8?B?aDVULytIY2lyKzBMLzhWS0lCaEFNclovaDdmN0RLdTEzTnBiY2NHTXZRUW1y?=
 =?utf-8?B?Wk93ZTNlKzYrQ0gxeWRvem5VbkpKVGtNOGRTMEhsVFQ3REpXbnpwVmJwRmNn?=
 =?utf-8?B?YzlYWXgvNWZZU204c2VuUldMbFlIWkZxOEkvaGpSQzBSQ1pHUHUrejRxRkxY?=
 =?utf-8?Q?8ZGb3QAVc9/HgDYsh8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE9OTWVPK2tmcXBPaXN3OU5mbC9iMVRuWEI0anR5Y29WOHoyUzZoSDYxM3hQ?=
 =?utf-8?B?TjdZdUVldGlzS1ZTUC9xd3d1QVJrVHczUEtudDBJZ004bWpCaEJrTjZNL2VE?=
 =?utf-8?B?R1hDWXFHcGFWb1YrUWFxVk1Db2RhM1JXR2JqZk5yUmE2QWRQZzNtVllYaUdT?=
 =?utf-8?B?YThOYWxEajBaR0RheFljMFdBbGdTekNTN1Y4U3NqR1JWUmJFM1l1NDVQS051?=
 =?utf-8?B?ZVg5WG12YWU2Qk5BUGtCVEZQQUJsSkdIWVRKYk5sVTBMNXR0b2FlcUd0NXlw?=
 =?utf-8?B?L1N2UTdkUVpYRkpMTkxVU1R4aXlxdnhjZE1wc2xra0tYejZwSTFYQmJBcnNq?=
 =?utf-8?B?TTJuQy9JOHRBeXo2MUNkZkloY1NmZ1pKNS9CKytvUkdCTyt3VDY2bUpRenBs?=
 =?utf-8?B?bnViaUNCQS9SQytrTXhOdVFHUThINkxyd2hLZm5vSDljcGJSdFJnSk5FS2xm?=
 =?utf-8?B?Q29KRnQ5Z1FkTnFKRkp5Y0VxdEZaU0xNd0l2M0dING03NDBmaEdheUNBcDk5?=
 =?utf-8?B?QXFVOFVYa2tFQXc2V05ieGcxSDlZZWJyUGJ2NmJjSnMzWG5KMk9ZWTE5Q3RE?=
 =?utf-8?B?Ly9kV2RpUE1tekt3QlExZUdmQWJyaWwyeWNuOUY5ck5SVklQOXRTcTluKzM5?=
 =?utf-8?B?TnJzSklzLzE1Y1JxREFUS3NtbitEelRSOGVtSzJyczRIZlJka2o2OXRwN1RH?=
 =?utf-8?B?M3NqUVdtWW0zQkZseTlUMXJRRUJFNzVPM0s2YWU5Y0FJUkNRcEprb2JpblNh?=
 =?utf-8?B?TDErdjhhaDYrTFpueWVNenNOcElJbWdHVy8wcXZHZG90Z2dRWnZVT0FuK0lP?=
 =?utf-8?B?N3dSdXR4ZmFKNkxma0gwZGdicGJKNjdxNWRRM3dMb0JTdStKSVZJZk05YjJz?=
 =?utf-8?B?VTY0YmpqUlV2NXBuODMyZ1l5eVBNMzZETXRqVWk0bkFpSzFaenBOTFNXdjR2?=
 =?utf-8?B?dmN0bFdzSGttVHF3YlAvRkxWZDZ4L0dYcXFLK2lqRFlIeE1IU1ZjMGVWYmt3?=
 =?utf-8?B?VXRSdXlmd0FSQ0JkRUxKV2hNR1p3S0FNekg5Q0xDZW1HRkRTQis3cUZqQlYv?=
 =?utf-8?B?NFA1SE5MNjdzNG5pRnVuMmx6dklIQlFoQkxYUjg1WkxBL09KOW0wTjJTQ0Z4?=
 =?utf-8?B?bktBZENwVFNPQmNKUE05bEJDZUZDYXA0RlZ6S1VqK2twaklDeUE4RkNaSFVB?=
 =?utf-8?B?RVh0UWs0dExZMW54V0RoZ3hzL1dhZHI2eTlCWmJJMTJnUWx5QXhNZjhXMEk1?=
 =?utf-8?B?WXpmZlV1NWF5MEl5UlE4YURDTGtEaUFQU1RuUUNHMW9yanlMcTEva2tJakty?=
 =?utf-8?B?bmNqWnNoUEpZNjhKNGk4K1lha1l5TG5wOWJTWGYvQUtsWG1nOExPR1RTR0tv?=
 =?utf-8?B?VWZscVB5WEo5dmx4V1lKV1JIK3RsU0t3VTJCTGtKTm44ejVxL2NXZ2FEOUJq?=
 =?utf-8?B?U0Z5L2dncU1tYlJqZ1BqWWhwVGhYSEs3UlhCQm0ycmNrN2hIMnFLbHVoL0dX?=
 =?utf-8?B?ZzhnWTlveWlWRmpEVVI3Tm9mc0pzam1LOFIwSk9yZ3NwUXEzbGUyc0ZoRU91?=
 =?utf-8?B?OVFVdm1QeXVDZ2xaUlowU0JFWXZQeU96UmJmdUhCRnpvRE9BUEZQRXRhSTJJ?=
 =?utf-8?B?UlVRWDdPVTBkRXNWT1Ryd1Rkc0ludVR0UVl0RHR5SDkyMCsyZXBFUUxHRHlu?=
 =?utf-8?B?ZjVaazdnVkRGVmFtenU4MXJzTjVuTEgydlBJM2QxRXBiS2VwQk5aS090Tklv?=
 =?utf-8?B?VUFUMmdvQ2lmS1NJYkZoQmtQYlJFcWRZclhQS3NtMkJ6YkZ1OENZOGlGRlNx?=
 =?utf-8?B?SG5QKzdIN0F4Zk9MbEw5ZkNzQVVGQzNidzRTdUZoTEpyeTEwMXRTSnkwMmRn?=
 =?utf-8?B?SWxZYWFwN0UrQkhGN2ZNeXIzQnZIYjNGWUtpUjBuL0srYXIwTkp4UGljdXM5?=
 =?utf-8?B?YTI2RzhXMGFXNFFGRUwxQkxLOGtlRThqMGhzQml1TTZGVDhCbngzclF0c1Vy?=
 =?utf-8?B?TEFSNWxENXVoSGxwbXNlM1NsRFB1MmI1YzJ4d3ZkdTBBVlVMR2VCcmZ6enNT?=
 =?utf-8?B?QXJ2d2NnOGhtZGR2MVBqbXdTbjdrS2ZRZEhFbHJ1UGd4ckVMUjdIV0x1UGEv?=
 =?utf-8?B?SWlqT0RGb1dYWEMxTjd2NW9oaFVOUWt3N3U1T0FpdnhWNnV4VjVLWFAyWUtw?=
 =?utf-8?Q?Nxc0fUfbSIDEjlF4+PAB1Oo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b95d5b-bdc3-46c2-3916-08dca83a4b2a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 21:32:30.3644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3l3qs0q4aNHHRH3ZpFuETu7X5BJFMUYKISgU07WpSNtx66d0xPh+RVlli1ROAEt/kd3vOsKrHBeVrddECTrvuhTOsdk0t2zBuJVWhO/kCHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5021
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

On Sun, Jul 07, 2024 at 03:41:40PM -0700, Ashutosh Dixit wrote:
> The following patch adds support for EU stall sampling, a new hardware
>feature first added in PVC and is being supported in XE2 and later
>architecture GPUs. This feature would enable capturing of EU stall
>data which include the IP address of the instruction stalled and
>various stall reason counts. More details are explained in the patch
>commit message.
>
>I am posting this patch as an RFC to get early feedback in the uAPI

maybe not an RFC anymore?

>while support for this feature is being added into Mesa. A new test
>in the IGT repo: https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>is also under development to test this feature in the driver. This
>patch has undergone basic testing with the new IGT test that is under
>development.
>
>The EU stall data from the driver include a header with additional
>information about the data that follows the header. The header
>includes flags one of which indicate if data has been dropped has

s/has been dropped//

>been dropped by the hardware due to buffer being full. While read
>returns the total bytes read, any data dropped by the hardware will
>be indicated in the flags.

>One feedback received so far is to make
>read return an error when data has been dropped by the hardware
>instead of setting a flag in the header.

if dropped data can be mapped to an intuitive error in the return of 
read, we should definitely do that. If multiple headers are returned in 
a read call and only some header blobs are affected, then, IMO, we 
should also set the flag for the relevant headers.

>One suggestion received
>is to consider two FDs per EU stall data stream with one fd to read
>data and other fd to pass any errors. please comment on this idea
>that's not represented in the code

If it is just one stream of data, then I would avoid an additional FD 
for passing errors. Read should be able to handle returning errors. Is 
there a limitation in the generic file ops (like read()) that EU stall 
supports? Are errors very common when consuming EU stall data?

Regards,
Umesh
>
>Thank You.
>
>v2: Rename xe perf layer as xe observation layer
>
>Harish Chegondi (1):
>  drm/xe/eustall: Add support for EU stall sampling
>
> drivers/gpu/drm/xe/Makefile                |    1 +
> drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |   33 +
> drivers/gpu/drm/xe/xe_eustall_cntr.c       | 1005 ++++++++++++++++++++
> drivers/gpu/drm/xe/xe_eustall_cntr.h       |   62 ++
> drivers/gpu/drm/xe/xe_gt.c                 |    3 +
> drivers/gpu/drm/xe/xe_gt_topology.c        |    9 +
> drivers/gpu/drm/xe/xe_gt_topology.h        |    3 +
> drivers/gpu/drm/xe/xe_gt_types.h           |    4 +
> drivers/gpu/drm/xe/xe_observation.c        |   14 +
> drivers/gpu/drm/xe/xe_trace.h              |   35 +
> include/uapi/drm/xe_drm.h                  |   77 ++
> 11 files changed, 1246 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
> create mode 100644 drivers/gpu/drm/xe/xe_eustall_cntr.c
> create mode 100644 drivers/gpu/drm/xe/xe_eustall_cntr.h
>
>-- 
>2.41.0
>
