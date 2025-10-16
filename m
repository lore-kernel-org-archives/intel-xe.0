Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D603CCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 15:26:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6340710EA23;
	Thu, 16 Oct 2025 15:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mI6KukUJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50A410EA24
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 15:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760628402; x=1792164402;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XwcJ8+0ds79x6jkDeYtMbbsSLcvT7WIci2N93M75pl8=;
 b=mI6KukUJ+GbeeRUkRW87GPFgHiM7r97RtRlgSYqXjsCAmU30RDVowVp2
 yNkHmT+A5Dj/1UEBY2sthWOib+mdDP25lQ9xcyRZWpj8BvjEiORaV3jBl
 AzWK0wAKV54Xf8UWO5jUNOSEeV291e9O2CToyKBPGXow8qcg+pK7bC7dR
 7QBy+2AherWOr2mGaxn4E7GTq03GHh2YvS2r8D6QMCJ/yTZCzxJ2jhwj4
 0Do3TGRPrMcYaZuYRfAmqqbRrzOTFQoVWa9IdDK9Ls18PbibJk9cLG8iz
 +CI+O8Tc4NNWLKksBpylkGlODcu1jMeRFiYcF/Kq3Urp14c9O8/1W+1U9 g==;
X-CSE-ConnectionGUID: REd0AwnNTduKmXZY1y2ljg==
X-CSE-MsgGUID: MX895gIaQ06S34v5c4c89g==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="50391397"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="50391397"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 08:26:42 -0700
X-CSE-ConnectionGUID: KWHdeh9yR0Op2t9aPdAirQ==
X-CSE-MsgGUID: TRgQ5YdnS/eKmbrmas8AbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182042528"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 08:26:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 08:26:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 08:26:41 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 08:26:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ed58VqDPCYG/dTCgxdzrikwBRZe1MrD7H4TOmhg34tEJo1ReyrB0UIpgvhHobFIo/XrQBEpR1UaWrcn5uQ7xyT9REMj1OeFLnkuXx69T3S0EmMndrkVhUbJ16djzQyHNbhg4mRiohC5kf7ixUa33RA207y9vmUP0srIEhubAX0QcqZfD2A06nofIRRtwde7Kaup+PAuTkEDqU35AXr+I/4Fcm5ji8hs9PdyVOZliKKtl84YWS1YLQ+KkveJuM8jw8UaPZnJIJ1xt7kGviQ++YLYVE594Wi+rS1dxtP9vg/VRPKmT0ocuBN+EIkI2y6PNhKamWh4/S3Zc2AbGQUQd3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vAU9CBBOR6By8TvRsIhaGoXt5WRuzddvNJibJ+Jphc=;
 b=eod7CegvjvBdXfoWuUVrdhfk+tCMj7FnSgYpHRSMfp10pgt6QfwesAmISGwrvmWVRaReugsJegJuXSKqPKLvOZWPzG+ucEpx2UvSLwNhs8V3LiAy6U5yDCZf8+x+7ZoJVaROt+PO5B0/HuUs14/D27yfLvyO2Rqj3ddfwreMJbsWBT4JfZ6QBJn6yoEHb4rR3RvfbHXSUsRzbvJIDBUjdmc0Qq+FiIlu1K8VVlhKMK+XP1Yz/Ry94jV3p0qJkmuCsmJWCHjCGb/LsY88vPZmerL2HqE9n5pRzH8ozYhiTR5cqPoWb2yTmnLuuViEPbQtClPmoV7tFvie/UdInhUaPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB7638.namprd11.prod.outlook.com (2603:10b6:806:34b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 15:26:38 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 15:26:38 +0000
Date: Thu, 16 Oct 2025 17:26:35 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe/pf: Disable auto-provisioning if changed
 using debugfs
Message-ID: <20251016152635.x3lroijqi3ay6wum@intel.com>
References: <20251015091211.592-1-michal.wajdeczko@intel.com>
 <20251015091211.592-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251015091211.592-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU6P191CA0056.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: f51d2691-960c-4ceb-18ae-08de0cc86649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTBoWUhkUkxyVDNOZVNsa0VKcmFST3pOYnZxMS9ybVZUN0lLaHEvcFM5VE5T?=
 =?utf-8?B?bnl6T3QvTnpUaUMySXhSWkdpWHJUaVF5dUNqSE5tUVQvZ1hMc3ZjRS9iNm9J?=
 =?utf-8?B?ZHRVVlZZY1dBbE92STZPUzVUU3BlMm9wOWRUOU5ML0drR1FSUlBFbE9PdGNE?=
 =?utf-8?B?OGZ0ZEhuaE9udjZjQ1ZmbkZ1MFhlM3NuYTVHdnFFZ3hqN2l4MEEzcklFUGth?=
 =?utf-8?B?S0cxeXEvS0xyajdQWm9GY1dRdUl2Ky83eTNRN05mekJndDZyUUtwc0IvWHkz?=
 =?utf-8?B?ZUJPMFVoelhhQUNFNFlncE9YcmNkVm5makZMb0FVUkhhVkZVSVRRZ09aNXYy?=
 =?utf-8?B?QkM1aFYvb1ZpRVkzL1NGZGF4WFJwYmlpZy9Fb2ZNOC91SzA0cjhNOU1lWERF?=
 =?utf-8?B?a2JHbHBNQlgyMml1MVlrMDUyMUNBSEgyclczNFpabFc3a1hIMVRia0RIdWRW?=
 =?utf-8?B?Ym5IV0pCUGpRS0hkTWU1TzN1eTQxU0RiMmlEN2xBRVN6NzVtRlFaWm5CZUNY?=
 =?utf-8?B?UzA1cm44MHVPc2xYYlEzaHBBcnoxbWEzcUlhVjl2R3pwVm1yZXFSMGtiakk1?=
 =?utf-8?B?bHJyOWllRWFqQlE1RTV6dERJWDdHN2thMUtSS3g2VWF6U3BEZ01JdjVIZk1p?=
 =?utf-8?B?RS9rdldnNDFVTmkvdGwva0JWdGFubUdUYnQyWDVHVERPdnYxb1BKUit3T2pL?=
 =?utf-8?B?cDQ1VVVKc0JxYWFVM3JIRlMyV1lWbEgrbldCWlF5U3NXQ1Nkc0NjT3hJclJW?=
 =?utf-8?B?TS90a3ZKMXc2a3VWNUdoV0RJVmE1bEVzTDVKTXI3YUhZNFpyVWFQZ3liOWdi?=
 =?utf-8?B?TGNYN3RLTElhZWRpTUdjMEcxU3RkejRYTm5PSmpjMjhhQWZ1QVVuenBubDYw?=
 =?utf-8?B?aG5xVVlJd09aZmhoNnBJcjY1UDZPWXpRdjF1Nkhmd3RBeUE5YTB1c2o2bWpq?=
 =?utf-8?B?ZDdKSGdqaTBSUmtYSTBpemNuYzBReTRYSXU4QUZMWVpqTU4xUnVvNWp4Qkc2?=
 =?utf-8?B?RmpEMHV2UlBONXp5UmpYSWFDY3cvSlgrQnJha2ViRXlZeHdQWFIvL2tzVklv?=
 =?utf-8?B?MUpiNEVVZjFmNVVLUC83K2t1YzVSa1p3UnhQeXBld3M2dDIwb0ltcmhKQnJO?=
 =?utf-8?B?TDZBRTV4T2VtV2ZzRVdhcVV5Y3hac2lEWVhQTUF1SWtkWTRJWUwxUGdKL3Fo?=
 =?utf-8?B?T2J0ZnpUZk5jTVVGMHZTNndUREFDdnRodytSVE5DckFHNTIxenFEZ1FJOHhz?=
 =?utf-8?B?VTl1SDhrZGlkMTNxcG9yT2VqR2hUNllORHc2VFN4TFh3VGJxdjVCaU16STVB?=
 =?utf-8?B?V29vWmVsVWt1WWVZYUhzR0o2Q0ZRcW5aRkJHZlhMUUdScUF3UkdoMm9GakhD?=
 =?utf-8?B?OS9UbjVqVXNjb3p3aG1lOEFnNmszbUIwWHVUOEEwVU5EdVRwMFdFT2t6bWty?=
 =?utf-8?B?TEQ2MXl6cmZ0b3dYZlU5dlV2R2FSTjRldm9vSldlUlAyRmswRUpOY0NqQWZz?=
 =?utf-8?B?L1ZLZjBuU0JpNnliNjV5WFZHM3dYa1FTeG1RdEdxKzR1YWtZRUowQ3NnSkRn?=
 =?utf-8?B?T2FIaGkrYmwvTFU2ejFFWHZRanRtcWdibVJld2hxUm95MEdkbFNmOG1oOHBy?=
 =?utf-8?B?MXRBblVOM04rbjVmU3pMOUxnVnNrSjNaUVlNR0RmelV3RkN5TVFSTitaczJN?=
 =?utf-8?B?OUdrcVViMzJBcitoOSs3M0VuTFIrNjBuaXFzbHpFNDA0Um9Jb1Zhem43WnBz?=
 =?utf-8?B?YzNyblk2ZDExUEIzUkIwV2FpR2tjV0lmYWVoNTdNRU43ZzZNa3JrazNZVHFP?=
 =?utf-8?B?c0VpNUx2N1NYSWRaZlcrMVpDZ1l4ZGJXTGh5VndXNHVFdjBPSFpnNTh5ck8v?=
 =?utf-8?B?Q2Z2QnNVbXJUR3IxT0l3S2xhYml3Vk9nRTFUZko2eXE1dFo4MW81RHUzd2dK?=
 =?utf-8?Q?2W20P6TMkz+nlx3W+vbznkL7k2f1Okgn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDk3VHhLL3VQenB4dlUyNU53RlQ3TzFTTnplbzZtMzh3MzdiODdwT2l1UUFL?=
 =?utf-8?B?K3pwWjFFOWpXYkhRQjUwOXkrZGlZNHE4a2VpTVQyOTl1ci81WHA2TEJNd00x?=
 =?utf-8?B?ZC9JWE5MLytWTVhuV2ExYUhLNS84bzlvNy9XQ2IxSzdNNXpTYzNFdVFnd2Iv?=
 =?utf-8?B?S2JkYVV5TnZGNzNXd2JweENiaXJHVDBsU3pZai9YekdyZXZKdlA1OHpQZ3hy?=
 =?utf-8?B?N2x2OGNiblBySHNOaDVWbWgxcWdBZFlFNFdQN1JFb3hORkNpTHp2RHFrdGhr?=
 =?utf-8?B?YkViT1RVK0RReTVrRldyVm5OczJTTjJjb1JJc2lzYW1vd2lJOHAyaEhSWFRp?=
 =?utf-8?B?bHRVZVdMdkw1bE1uMHpJM09IT3kyWks4bGh3R0JmTGZKOUZtK01XbmJzMTZU?=
 =?utf-8?B?S0tEbVJKd0x6cDFjZTlEWUx3czBvZ1VNZUpWSXpLS2lIUlRsdmJDbVU3VTIy?=
 =?utf-8?B?a3o1WUNUdy9LK1BYYU9TSjcvcXpkMHA2ZVkzTzk1cDJzcWFJWjFQSHVtYXli?=
 =?utf-8?B?Mi83ZUlYT3lkanVHeUxXVldzSVlmK3JzMG16c21zdjV2ZjVwK3U0SFoxZ3Y1?=
 =?utf-8?B?cnlValpKN2ZiNUV5M2pLa2pVRGx3QU01dnJBbkxjZlUweVZqRmNHVDlEanhD?=
 =?utf-8?B?UXJnY2l6aEdKbWhubmFRMlhOOU5DcGZETHNYelRJYjhVS2Vwdjk4TWNyNHcz?=
 =?utf-8?B?ZFVNMmF4L2w2ZFB4V1dVMVZZWjd0bUxrcFRJeHhOWFNoNUdGUjNQQlFSZEtv?=
 =?utf-8?B?ZDdaVEoxMW1zNlpNUHYwd21nbTIzSlJKNWd1ZDlNRzdORVlzRDVJeFRRTXI4?=
 =?utf-8?B?R2l3MUFmbUNpeGZ6MDJRb3g2bG5oNDBBcDYwem9XV2xDN2IxNlJ3RWNwSHBL?=
 =?utf-8?B?a3lmUk1RYkljcnFIYUlvRXNyajIzeGVzSUZISWJUbE04Um8wbnRmbDlnYkkw?=
 =?utf-8?B?a2VrQk8rTW1tSVBYZ1hFTHNhRm1SOFpJUmdOOFhrcXpMdnJ4WVhCTGJHMWZz?=
 =?utf-8?B?aTJwTk5DUkMwSHhFcjRSOCsyOWJmUEJuZ2NCbWx6TUZKL0JtRTlodUU1bURJ?=
 =?utf-8?B?TzJpSkU5cys0YnpNWkZjUEpnRVVucHNsc0djTkswQXlZRFltVEEzUk14NlB3?=
 =?utf-8?B?dDllaXlDVVVrczlTWE9iNTNwK2FXcTlnbE1GeHdOZGZjZVZxcDIrS2E2VFBs?=
 =?utf-8?B?UktxRG1IT2hnZlpHKzZmUUt2cTZldGtqdUNJQlIrQ1Bjcm9DOWxtQkRzbGxk?=
 =?utf-8?B?aXFLc0xhckpDTFhBUWZBeWc5L1c3SSsrSjBTeHRrVEFneTFacHkvTHRBbEcy?=
 =?utf-8?B?SXVJZkVraU51STlyeGRZVHV5T2oyTFM3R3JMQUoralhSRCtNWTJEZ3UzVmcy?=
 =?utf-8?B?VUhmbU9SYm1zUGtQako0cHh6d0tIVVVJUC91bGZaMXUzcGVVbEY0K051MEZU?=
 =?utf-8?B?MWRVTll2SnUvQWRYYXBlNU03VnpRdUh1WXo1WHdUTXdXVkM5WUkvc2tua2lK?=
 =?utf-8?B?MDJmVDIzMDQyRWRYSUZJTU0zTG15bFhqcjdaUGdWdzVqWGMyRHhKcVdXODRM?=
 =?utf-8?B?L3ptcm9iOGRIMmphaDF4R2cwZFh5RVZ1QUJqcjZiVnVZcXlnWmx1UzUyQSs0?=
 =?utf-8?B?MkxVZ2IrcHROb3RQU2lpaEYwcm1DVVc5UmdXNHJOTGhNOE0xZ0xBZklodWdV?=
 =?utf-8?B?bW5LYXFBM1I5TjEyZCtzdFNwb2F6WFV1L3gvWXhsMk9LRnhwQlhkaGtFNHkv?=
 =?utf-8?B?TWcwWVE4c2o0cXMzc0NPS0NwdVFnU211RjVzNGNvall5bE5qU0hOTmlEaFVp?=
 =?utf-8?B?MU9xQ2RzUFJDdzVjL1hFS2hadmVXSzczekxBVmxjNnBrakEzLzg5V0RWU1lH?=
 =?utf-8?B?K29yQ25DZVdUMVJmcjNwSlBNVHM1dXpsZUlHWDh3ZjJ6bHcwbm80ZHJzYi90?=
 =?utf-8?B?bmxDS2JJb1NTUElHclc0ZkVnM0ZXZ0xTRWd0MzdFZmtlYUEzalViWVlXOHFG?=
 =?utf-8?B?QlZQc0U0bnpNejA5SnFqRXh3MXp1ZDA3bWVxdE44TE5ySzJ6K0hWZTBUVFVk?=
 =?utf-8?B?ZjJCOGo2QVU0MW43SFVWR3FpblhvZG9rOU9BRzRhSFNjRDh4ZFJCWmFHOStC?=
 =?utf-8?B?ZG96cU1Xb1NRcGVJWmwva1dNQjA5VjVVRENWSXQ5bENKQU40OXdFRnd1K3hv?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f51d2691-960c-4ceb-18ae-08de0cc86649
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:26:38.4403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +uM3Ga2WrO/8Kep6t+J3DPTPN29eWmws416CEkQbv61YNrCk5IL1koaE/m2wjqa9p3MKM2w38n45e8RmE2NBGKhbALL+JvIDQC0RgaEO4oA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7638
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2025-paź-15 11:12:08 +0200]:
> When we attempt to tweak VFs configurations using debugfs, stop
> assuming that VFs need auto-(un)provisioning.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  7 ++++
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.c    | 39 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.h    | 17 ++++++++
>  .../gpu/drm/xe/xe_sriov_pf_provision_types.h  |  4 ++
>  drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c |  3 ++
>  5 files changed, 70 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index c026a3910e7e..838beb7f6327 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -23,6 +23,7 @@
>  #include "xe_gt_sriov_pf_service.h"
>  #include "xe_pm.h"
>  #include "xe_sriov_pf.h"
> +#include "xe_sriov_pf_provision.h"
>  
>  /*
>   *      /sys/kernel/debug/dri/BDF/
> @@ -124,6 +125,8 @@ static int POLICY##_set(void *data, u64 val)					\
>  										\
>  	xe_pm_runtime_get(xe);							\
>  	err = xe_gt_sriov_pf_policy_set_##POLICY(gt, val);			\
> +	if (!err)								\
> +		xe_sriov_pf_provision_set_custom_mode(xe);			\
>  	xe_pm_runtime_put(xe);							\
>  										\
>  	return err;								\
> @@ -189,6 +192,8 @@ static int CONFIG##_set(void *data, u64 val)					\
>  	xe_pm_runtime_get(xe);							\
>  	err = xe_sriov_pf_wait_ready(xe) ?:					\
>  	      xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
> +	if (!err)								\
> +		xe_sriov_pf_provision_set_custom_mode(xe);			\
>  	xe_pm_runtime_put(xe);							\
>  										\
>  	return err;								\
> @@ -246,6 +251,8 @@ static int set_threshold(void *data, u64 val, enum xe_guc_klv_threshold_index in
>  
>  	xe_pm_runtime_get(xe);
>  	err = xe_gt_sriov_pf_config_set_threshold(gt, vfid, index, val);
> +	if (!err)
> +		xe_sriov_pf_provision_set_custom_mode(xe);
>  	xe_pm_runtime_put(xe);
>  
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> index de7d925a110d..7e74175db972 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -10,6 +10,19 @@
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_provision.h"
>  #include "xe_sriov_pf_provision_types.h"
> +#include "xe_sriov_printk.h"
> +
> +static const char *mode_to_string(enum xe_sriov_provisioning_mode mode)
> +{
> +	switch (mode) {
> +	case XE_SRIOV_PROVISIONING_MODE_AUTO:
> +		return "auto";
> +	case XE_SRIOV_PROVISIONING_MODE_CUSTOM:
> +		return "custom";
> +	default:
> +		return "<invalid>";
> +	}
> +}
>  
>  static bool pf_auto_provisioning_mode(struct xe_device *xe)
>  {
> @@ -95,3 +108,29 @@ int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
>  	pf_unprovision_vfs(xe, num_vfs);
>  	return 0;
>  }
> +
> +/**
> + * xe_sriov_pf_provision_set_mode() - Change VFs provision mode.
> + * @xe: the PF &xe_device
> + * @mode: the new VFs provisioning mode
> + *
> + * When changing from AUTO to CUSTOM mode, any already allocated VFs resources
> + * will remain allocated and will not be released upon VFs disabling.
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provisioning_mode mode)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	if (mode == xe->sriov.pf.provision.mode)
> +		return 0;
> +
> +	xe_sriov_dbg(xe, "mode %s changed to %s by %ps\n",
> +		     mode_to_string(xe->sriov.pf.provision.mode),
> +		     mode_to_string(mode), __builtin_return_address(0));
> +	xe->sriov.pf.provision.mode = mode;
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> index f6a902190ad7..cf3657a32e90 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> @@ -6,9 +6,26 @@
>  #ifndef _XE_SRIOV_PF_PROVISION_H_
>  #define _XE_SRIOV_PF_PROVISION_H_
>  
> +#include "xe_sriov_pf_provision_types.h"
> +
>  struct xe_device;
>  
>  int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs);
>  int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs);
>  
> +int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provisioning_mode mode);
> +
> +/**
> + * xe_sriov_pf_provision_set_custom_mode() - Change VFs provision mode to custom.
> + * @xe: the PF &xe_device
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +static inline int xe_sriov_pf_provision_set_custom_mode(struct xe_device *xe)
> +{
> +	return xe_sriov_pf_provision_set_mode(xe, XE_SRIOV_PROVISIONING_MODE_CUSTOM);
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h
> index f72bc5db3a60..a847b8a4c4da 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h
> @@ -15,9 +15,13 @@
>   *                                   Any allocated resources to the VFs will be
>   *                                   automatically released when disabling VFs.
>   *                                   This is a default mode.
> + * @XE_SRIOV_PROVISIONING_MODE_CUSTOM: Explicit VFs provisioning using uABI interfaces.
> + *                                     VFs resources remains allocated regardless if
> + *                                     VFs are enabled or not.
>   */
>  enum xe_sriov_provisioning_mode {
>  	XE_SRIOV_PROVISIONING_MODE_AUTO,
> +	XE_SRIOV_PROVISIONING_MODE_CUSTOM,
>  };
>  static_assert(XE_SRIOV_PROVISIONING_MODE_AUTO == 0);
>  
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
> index c8df18af4d00..931df8a6eaf4 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
> @@ -15,6 +15,7 @@
>  #include "xe_tile_sriov_pf_debugfs.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
> +#include "xe_sriov_pf_provision.h"
>  
>  /*
>   *      /sys/kernel/debug/dri/BDF/
> @@ -143,6 +144,8 @@ static int NAME##_set(void *data, u64 val)					\
>  	xe_pm_runtime_get(xe);							\
>  	err = xe_sriov_pf_wait_ready(xe) ?:					\
>  	      xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
> +	if (!err)								\
> +		xe_sriov_pf_provision_set_custom_mode(xe);			\
>  	xe_pm_runtime_put(xe);							\
>  										\
>  	return err;								\
LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> -- 
> 2.47.1
> 

-- 
