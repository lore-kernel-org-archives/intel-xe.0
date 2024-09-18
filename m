Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F02CDD55F
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 23:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3274210E667;
	Wed, 18 Sep 2024 23:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsdHDDG3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621B610E273
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 23:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726703492; x=1758239492;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Wv4w0n1nKKcaIvI9NojcBBxbXMOV1kuve5E8xRi4uAo=;
 b=jsdHDDG33xcsseVolNCFTqcQnZ1m7WgEqj8pR5PqHt0wbiadAkvraCew
 LkVkOhdt+YqTGRee4FsUXJW98kgKOkJ3mZq6rgHE85z13Hlk04ggQo4gb
 nrWD7oiDxrDW5/GtglXBuBAXpyuyaK3rDj5PvDrLVniPFp3bCdz8HMLaG
 ZT5wSo6JZKxuTABey1kdq5wsq24+fLEdfntBLgG2mcP2uQLdiEyeeg0t3
 B2ekasT667uvc29iWjuL2GfCHOT15dx6nrjV8BzNHvh3qLtevBsP37iv8
 9mvTFlnfKHdN4Cgh5zk2WnMp6aobyhsWeRKsMaPvy66dUYWE6xxvCFDzo A==;
X-CSE-ConnectionGUID: ndDU0LU6Sx2wb8WTroYK4w==
X-CSE-MsgGUID: ZUduVMGGT6Ohff/qdfg41w==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25469994"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="25469994"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 16:51:27 -0700
X-CSE-ConnectionGUID: Juar+zBSTZ+DZf14vvdQMA==
X-CSE-MsgGUID: cFPboKopSkquLc4LQgee7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="69343743"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 16:51:26 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 16:51:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 16:51:25 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 16:51:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/Fn0pQw5KRs4+UwGBOtxCKwN9AfTQkUEOaDiLa+1N6mA0sTsRBkvi2zutCShTtd/5h+GTEuFyA0kKSDKpDTkZgT08NYEzjPJBfQ/ILfFYUS6QPIKNOE3cHJhRDd389utfaGQ7UW6GcuZgVf1W6lnO8l4wKmKt+qXUGxB/zRNSzoZOFbU6ReXwE4OPwU/Kx4tVmzi9EcpZmbOdCGoxlUcH7tgw1V+CIy7cb8qyV6KsZ3/Lg6Cz4sykLflL1m4l0EVRD2B8S1oZXFzp//WiTx6VpG0Fn+Ljct/GibWGTzohIKVGBxfWLG+j3WEApehmVWYpPlm3DGLRTXCJlnfTHVUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6i2DSsk+EKMUvZ0J3DANUtxMwqmw6B5Zv3mJrXgG7YM=;
 b=fepOh8ToBxU3vyY+aSJHk+LM+FNzN7WsBIjlulj4B5z9SdBAKgf+eobud/J7g4hA07P8LsSD6v59gxBQy1xl/QS02UFEHureJBgL2W3lUqkrEH5RcU7Z1Lbifm/BVk97DtJgxqaV+OWK9op4cBxbh1cSRFKoXq7xM3DzDhA222ONZcSgAHKgaKZbzoRrp70pYnv1NI5fasS8kNJuW81j7tCfSAeqgXoWsDJeQqcEOfMkhda2uKcUxwjStb6blHOC8G+qsPcYP0jaui7Y8HTnNSiWv83tifPQB2DZmnCGhJFmccS4waC7XJRn3h/FSwBZxiIz/3bLcJSTcE9pDs9wrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DS0PR11MB8231.namprd11.prod.outlook.com (2603:10b6:8:15c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 23:51:23 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.7982.012; Wed, 18 Sep 2024
 23:51:22 +0000
Message-ID: <a98a7164-7301-41b8-acbe-504341e8d6f7@intel.com>
Date: Wed, 18 Sep 2024 19:51:19 -0400
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/guc=3A_Add?=
 =?UTF-8?Q?_GuC_based_register_capture_for_error_capture_=28rev21=29?=
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
To: <intel-xe@lists.freedesktop.org>
References: <20240912230913.381482-1-zhanjun.dong@intel.com>
 <172625393816.997912.4939749842744161403@2413ebb6fbb6>
 <71cc5553-9232-4c4e-970a-8e0dd17fc828@intel.com>
Content-Language: en-US
In-Reply-To: <71cc5553-9232-4c4e-970a-8e0dd17fc828@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0165.namprd05.prod.outlook.com
 (2603:10b6:a03:339::20) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DS0PR11MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a6b22d7-2280-4adb-6c54-08dcd83ccce8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZERzbEk4bEpMZnBwS0p2bE5scFBUdThIdFdZZURHazRXeHdSV2dnWU5FNmZT?=
 =?utf-8?B?TFZMNWNkOVA1SVplcWdUMkxBczNZeDBmaGhTNVAydHJNVnAwS3hhdmI0aDV6?=
 =?utf-8?B?U0hXajdhQXRiNUxQM2d2VDEwWlYwSEFxbmlDcUJGRFYrb2x2OHZDUmF3eGVj?=
 =?utf-8?B?VzIrWGpCbW54bE9hRnNUU3hxc1kzYkZFVkl6Smx0WFViY2x6amluaFNIZWdU?=
 =?utf-8?B?aXpwYzdOYTBBOElRZ0NCRDYzUkt6OU1vMnN0UHl3b3oxN0dVVEU3S1hLS2xO?=
 =?utf-8?B?cnJBcTZmWEFMSVBvR0VLSWxodWdhenFONTdkMkZGaGtNSy9qQkloTWZmQVdJ?=
 =?utf-8?B?ZmVpMDB3dDlMVlQ3QVZEMm5NeDJhWjB0S2Vpcm83NDUyYll2V2FGQ2prTWNp?=
 =?utf-8?B?MS9NblY5czJDZlFQRXB2U2xCVjA1K0s2Z05Rd2I1K3czNDJtMWpjSWFtUVps?=
 =?utf-8?B?OGkyYjdxR1BuMUdIS3pKbFp2alQ2OFRHc3gzRkJwaWV5dndWdmpGWGtLeXU0?=
 =?utf-8?B?ZEpQMEhjeDNPTlZvMFhiMTJrRnl4djhNY1BjQndMcyt2NTZ4Y2NnalVOeEM5?=
 =?utf-8?B?cVpETXB0YWZOeFVnSWd1SE5wUmNVOGNISzdGQmluTFBNd0p5L3hkeWttQWVl?=
 =?utf-8?B?ZHVXbVdyUTBESm1NRkZSZUsweFV0QXBnNUFySy9IQjd5WVdGeUVWLzE2QU5I?=
 =?utf-8?B?L2dYcEN0cTAvL1BjRGluTDRJWWpTSEc3R3ZpMloyL2U0dWNFVnFraTBnUE9k?=
 =?utf-8?B?TTJxSUxvTE1UKzF0TCtiRkZxZ3pTSEg5YXFTNGY4dGJnWlRSS2FvWVh1cFly?=
 =?utf-8?B?WFBCUWhLREVGaFBxOENmY2pMTStCTmhTWTZTNW9nc1hhTU5Mb0krUFpCeU9K?=
 =?utf-8?B?bHQ2NFJ0ZENmSi9Ga0x5bU1MdkVuc1k1SStVZVFvTVVXNmpod20vRVBJb1h6?=
 =?utf-8?B?dytwK2djK2tsUERseUJ1aTFQNk1CSGEzZ3B6RmZwMldGRnZDRkZCZzdiSHRo?=
 =?utf-8?B?Z1I1cnB0MFlkVHVsalI2T2JQSWhGcy9UZXkxNzk4Rm1mNktkOFFSNlZBaTFR?=
 =?utf-8?B?VDB0SjZJdzc0YkhvRHQ2NVRpa1hQeml1UENpdjNobGFwblN2Y1dvYkxQeFB6?=
 =?utf-8?B?R0ZhUEx3NW1sWk11T0J2amhSRzljYkMvSU42bDBTa1ZpUFJoTzNCMU83MmIv?=
 =?utf-8?B?MzVtY052ZGtEYzNFZTJTcjhCRmtZMHQ3ZUVTN3B4UVgxTkpLUE1ESnc0SDBM?=
 =?utf-8?B?MSsvR1FWSGV5UEoxRXdLVmtCSDRDUHdXR1ZkTkl2dmRCaXltV1Bkak1DVWox?=
 =?utf-8?B?MW1TVkdJcjA3NWJUdUdjQnNkTTQ2UldHbU82bXNTdWVOTXBUc0NiaEZPQi80?=
 =?utf-8?B?NFNXN1l4LytvY3R4b3grYWJ4UjNRUzBkc0ROV1JQa3FvSFZ3UEwxL3BSQjdI?=
 =?utf-8?B?cTRFS1JIaWlYMkQ0SkVBTlJiMHJLMkhXZTdaaGozVHdRM2xMVkcxZVFLclBF?=
 =?utf-8?B?ektDenljZGJYK0trV3pSQzJ4MnQveHFINHNRZEFVbHRaNEs4c0xxRWQ4K0wy?=
 =?utf-8?B?cGNoQ0xML1JFSWQ3eVNNSWhXVVVveS9tL29DSjEyTWNwNGRmTk1OczdaNnQy?=
 =?utf-8?B?MDMxUEJOT0R4L1NhbzZqdTAyTXNVQk9Vb0tCUVpMUzN6MEcxVS9DM0luVmoy?=
 =?utf-8?B?b0JaWTFncFdsb0p4b1IvNy9kakJGSFNSUDBUZ0lsMTQ0dmM3N0kvSmUva2FW?=
 =?utf-8?Q?PHot/MBLrHHp6pLFyE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czdUUUwrZzhZR1JqOURYell1TWhWYkdUZUVlWlltWmJBZ2RoeUlXOXhrdzNV?=
 =?utf-8?B?M3BzejRGV1IwOXJuN3hDSkVXODR5U04xalhuRXpoNW1EbEk3eDVENEJpS2pM?=
 =?utf-8?B?UGFlZk1NY01vUS9PeWl3Y3lZSjY2Ty9OTUJiei9aZUNQQ0ZTU1JMUDdhZkts?=
 =?utf-8?B?Zmp2UlAyMFVRVm5nYVZHSGFPTU96czl3ak1TMlp6czZjQjFlY0pNMloyT0NZ?=
 =?utf-8?B?Q2RnUVprOHBFQXNkVHdoRXVjOVNqNkdBQThucW1MUHMvRzBXb3BUbFVhN0pu?=
 =?utf-8?B?YkdVMDZhVjhnYXRlbUZPOVBOTDUrWU9BTkJYWmIxNStrZ0V0K1l0elJWNk1i?=
 =?utf-8?B?VWpJdUJvTlVwZFdEajcySVlUQmdBbS9JSTdqWVo0T1ptVlBHSmNJRkczR0pu?=
 =?utf-8?B?K0lCTTQxTmdCZ1NKR0dtb3VDYUlwRDNNWXBpMjRoZGNKN1VaOEtIVjMrU0VT?=
 =?utf-8?B?VXhjaVJzcUdmT3FyLytuV0tjaVc1c1VnOFBEc3JsUmdHSHBFQU9OblQ2Q0xT?=
 =?utf-8?B?MWZvSE9VWHRMUDFJVVVYM01Qb0RKRjBzY1BqVzRydnErR0JkbEhaVE1vNU1a?=
 =?utf-8?B?dUlYVGI3UFNxTlVhWEFyR3RiTFNHVXVNdFYxZFZjWVBwejRhOGlPSXBrS2F1?=
 =?utf-8?B?NWhocWFNekQzZ1M1VXhFbEkrUndZeVpvem9PSHdkc3lldHVwOXFXd3FwanVk?=
 =?utf-8?B?S1gvNm1IZ3k2ekZKQStwaDJHRlhNU1pQOXp0eGM2NHF2cnNwNFhTaGd6NUFn?=
 =?utf-8?B?UXpQMitmY3U4VnpHbm5FN3pTOWc3NTBJL1Z0bmJKc3JLQnBINnBjY3U1aVZn?=
 =?utf-8?B?dkpTbWVOeGhVZ1FuVmxMaUd3ZlJGQjU3K28yY0w0cGJaRUpMTVhXWXJYS3BU?=
 =?utf-8?B?aVlSZVFUU1UwNVkwR3AxSUowYUJvUjFTdlZ5MXVlRTFWSktwR241aHVpWmZw?=
 =?utf-8?B?OWVhZStPa252Q1VaekVjbzlOUXFxWHNieHMrZjdtMzZLczg0Z2J0d3E3Mmwz?=
 =?utf-8?B?N3U4LzAvdk1UUTJyRTlpT3FMc05kbW5sNEdva2ZYUVQxblRWRGkvZFQ0bHJ1?=
 =?utf-8?B?M05mMC92TVBTWUNMNkVRLyttUnN4OXhEanZubFZGK1FjRm80UThqbHIvZkdz?=
 =?utf-8?B?Rm5kSTc3MTI2ZHUwN1lFZE1jR05CbGsvWVhmNUVMR1R5VHQxbUtwdzFyZUNq?=
 =?utf-8?B?TmkyYTNWcE9xUzVmcXNYSHY1V2NKNFNzQlE5Y3lseGtYQStDSDh2S1pzdXNq?=
 =?utf-8?B?bmxNS2tnSGwrZkxmS0xxb1VwdnYzSmt6VW1xUXlyb2NDQ1IrRzhvby91ZGp2?=
 =?utf-8?B?c0pTVU5SU0FoQ2pEemloUnlWOTgwa21TQm5PcXNIRkEwWUErYWlPUUVzVFFE?=
 =?utf-8?B?d1RwODJHR2s5S08xbjdML21pUnh4TUdpcktEYlNFUnk2d2NnSERiZ20zMHR3?=
 =?utf-8?B?RFZDMEJxbHExSExTVW0vc3JoVzcwdk5XNmhkdE1ZajFlUUFKNG8wRUdVQldl?=
 =?utf-8?B?YWJMK0Q3ekhZd0orVnRseFRKdm1NQjRTSWNOK2ZYV0NRMUg3VE5jUUYwV2NM?=
 =?utf-8?B?RHZ0UjlRVExJNk1udlJoMTlVS1VndE9mY2dpMHdjTnEyU0cvVjJPdGpNRzJs?=
 =?utf-8?B?V3dXTExucldRcVh5d3poVnJHNFVCSFFVdmJiaCs3WTVRa1kvV1dOb3lkN1Fp?=
 =?utf-8?B?SklvVXNNalNVdVMxa0NGRGFLbUgzVm4zeU41NjErZEZqb3J1SXI4L0J1cU9N?=
 =?utf-8?B?bHJLZ0VWOW1zTWxDaFB2bXQ2ZnBJWEVaSWc5bU5NV3g3bmlsMWVZNFI1UFVr?=
 =?utf-8?B?SER2ZWVQODBvWlZmOHFRNW9SQnpMWlEzcWZqS0svdFpDQ3lvMUhLRWZ0bVlJ?=
 =?utf-8?B?eHhKZFBacnhpNHJEWkl4YndDVXNhSUQwM25oOG0wQU45dlArVGYyV1A5M09v?=
 =?utf-8?B?RzZ1NEcvTTFpVm1qWWFwMEcxbnJsVUFGc0JzOFRVZVBSZFFWM2l3ckVRNjJL?=
 =?utf-8?B?ZkYzd3dRV3dhUEdEZEpBc05tcWpKVFFub1ltWFhCb0VOTXV5a0o4eDd0cG5V?=
 =?utf-8?B?S0hXRmZRQWcvVS9zbkRpVnlzRDh2UW84TFdJMG4zZU1yRE4zM0czOEtsTUhI?=
 =?utf-8?B?MWNxQ0l4YXo1NmlXTlZ6YUFCelBUWWc4aU9wY01LRXVqdVBYSWVrY1pDUnJv?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6b22d7-2280-4adb-6c54-08dcd83ccce8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 23:51:22.8693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBpHulhw4f8iWROtKT5ewKeqFjw64qk8G2W5vpvIAEFSVQkfOouemUfqfPYr3I7YR+WBNvBI/yBVuCcl6lO5uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8231
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

Patch for null pointer fix posted:
https://patchwork.freedesktop.org/series/138847/

Extra test triggered with an for-Ci series, with the above patch 
included, the failed BAT test get passed.

Link to for-ci series:
https://patchwork.freedesktop.org/series/138780/

Regards,
Zhanjun Dong

On 2024-09-17 11:52 a.m., Dong, Zhanjun wrote:
> The reason caused test failed is not related to this series.
> It is a pre-existing condition of missing NULL pointer check.
> I will post another patch for the fix.
> 
> Regards,
> Zhanjun Dong
> 
> On 2024-09-13 2:58 p.m., Patchwork wrote:
>> *Patch Details*
>> *Series:*    drm/xe/guc: Add GuC based register capture for error 
>> capture (rev21)
>> *URL:*    https://patchwork.freedesktop.org/series/128077/ 
>> <https://patchwork.freedesktop.org/series/128077/>
>> *State:*    failure
>> *Details:* 
>> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v21/index.html 
>> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v21/index.html>
>>
>>
>>   CI Bug Log - changes from
>>   xe-1948-df3eecb1fa97d6d35569c2fa39f0da78b9f13328_BAT ->
>>   xe-pw-128077v21_BAT
>>
>>
>>     Summary
>>
>> *FAILURE*
>>
>> Serious unknown changes coming with xe-pw-128077v21_BAT absolutely 
>> need to be
>> verified manually.
>>
>> If you think the reported changes have nothing to do with the changes
>> introduced in xe-pw-128077v21_BAT, please notify your bug team 
>> (I915-ci-infra@lists.freedesktop.org) to allow them
>> to document this new failure mode, which will reduce false positives 
>> in CI.
>>
>>
>>     Participating hosts (9 -> 9)
>>
>> No changes in participating hosts
>>
>>
>>     Possible new issues
>>
>> Here are the unknown changes that may have been introduced in 
>> xe-pw-128077v21_BAT:
>>
>>
>>       IGT changes
>>
>>
>>         Possible regressions
>>
>>   * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>>       o bat-lnl-2: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1948-df3eecb1fa97d6d35569c2fa39f0da78b9f13328/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v21/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> +1 other test abort
>>
>>
>>     Known issues
>>
>> Here are the changes found in xe-pw-128077v21_BAT that come from known 
>> issues:
>>
>>
>>       IGT changes
>>
>>
>>         Possible fixes
>>
>>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>>       o bat-lnl-1: FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1948-df3eecb1fa97d6d35569c2fa39f0da78b9f13328/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v21/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html> +1 other test pass
>>
>>
>>     Build changes
>>
>>   * IGT: IGT_8016 -> IGT_8017
>>   * Linux: xe-1948-df3eecb1fa97d6d35569c2fa39f0da78b9f13328 ->
>>     xe-pw-128077v21
>>
>> IGT_8016: 786f0469afc0665a02dd82bf17544868188fbdeb @ 
>> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>> IGT_8017: 8017
>> xe-1948-df3eecb1fa97d6d35569c2fa39f0da78b9f13328: 
>> df3eecb1fa97d6d35569c2fa39f0da78b9f13328
>> xe-pw-128077v21: 128077v21
>>
