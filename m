Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FD2E6ADDD
	for <intel-xe@archiver.kernel.org>; Sat, 23 Nov 2024 02:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CA910E463;
	Sat, 23 Nov 2024 02:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPRy472g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826DA10E463
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Nov 2024 02:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732329509; x=1763865509;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xguk+QxuZkL7AmKrAydHftEIcxJVkw9YGZshGWKYs8Y=;
 b=OPRy472g3AoZr6PLfvJzRojKCynPM3mkkWt233CCxsbpwPY/PErKMuu8
 LmlbmRJwjqZloazrgH+ErFw9ICLvqme70e7i0MFJv3Tj0lJDs72vvleWP
 /x7rNbEPsjfQceiYIbvIYFRT8jlYVtFxTOxuXisbY7AQi3iqr6ZACY7jO
 cM+2fPfZY07p+aMXpIpt507LRrHIyVpPKCcAdySgZeTYw8p5zo8yCG1JA
 RTTJ6xq05mPUXwLlekEfra/t9Hu2Terz1WRJYE3tKUA61WW0ztMWf30fI
 qdQGiCNr0NjTtrtOZfbX7OHOxRcfAr9qTJUoZbXFSvJUlW/kGmUFxsfzf Q==;
X-CSE-ConnectionGUID: r+GHHBxLS2qAl8i5Cd+oZw==
X-CSE-MsgGUID: B7E+OV58T+C+g7RPp6rUbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="49915154"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; d="scan'208";a="49915154"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 18:38:29 -0800
X-CSE-ConnectionGUID: ow8f4YT0Qa6RjxW7M+S0og==
X-CSE-MsgGUID: 6YiLZ9rqTbiSktdjCOXgFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; d="scan'208";a="90737075"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 18:38:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 18:38:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 18:38:26 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 18:38:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuHO7NMZ1VZrFMq93TOaZP6IeCUzzqAHZk7LCl9aPKjiTY1e13C2by00MOmwxVUxgM+Roob6ZxEkZYwYpXCD7O4m4ph+5T8wMqnNj8AuKb4smRNmlmPsPCPZS5yh4pqt65EB4BOmd8BtpgPEPRdnyJ9Q/yjwJtV5ZxaVK5YJ0yOrkzCHVLdogUpVUGRJ9yc2xhNWFjI8/v0/3q9AE1xEFiHLe7HBGuwP7qixuM8hQa90I/R3z6hxsj06jKQTkED6mQCEi1jql+2kY/lXI+TZzwHh8sIKUxMxUuZX83Bp6FyHc8WQwyhFvkjSZxYoyLRzgroCpgJHwJbH67O5+FX8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yg96t9CpdBVhCDHly0c5agsjE/4Ksvb/o16S5eH5Kng=;
 b=E/0DKmn59q3m5SeMhxR7uninbbCmlWddCvCVtLQ3ZsIwXIvEitRZt/gZjzQcy9mDPfBLKXCnJXzfFN6VVe69lfH3Ju1cUS5bQf6yQC9E7ldhIETx/C0lSvtYz+yhHXqeFIyFbpunf16xpQLUaPX5lwO6wOm3lBfYTSCG02iDmD+mbBwpsr5zZ8XIat7dhnkwoeXuyh0ZaXJr6zqB4y+pQx1RuPDsBw+sMAie8Dzf6MiAY9Scmns3Mj0XMnaEJcPGtLR3eAuZfVaPzBcLhNs6bQhe8zgqA+7qZKeGf4xTBB/Et+p9aXgkcgkQv9Dyh0/chbuQuXepowpetHiq6/kXFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by SA1PR11MB7111.namprd11.prod.outlook.com (2603:10b6:806:2b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Sat, 23 Nov
 2024 02:38:24 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8158.021; Sat, 23 Nov 2024
 02:38:23 +0000
Message-ID: <4f8bbb1f-0334-4973-8d86-a09199f192c7@intel.com>
Date: Sat, 23 Nov 2024 03:38:18 +0100
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe/sriov: Shifting GGTT area post migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20241116021238.2486287-1-tomasz.lis@intel.com>
 <20241116021238.2486287-3-tomasz.lis@intel.com>
 <8130fc0f-2978-4ad7-b0b7-8e2fbaa3e2db@intel.com>
Content-Language: en-US
In-Reply-To: <8130fc0f-2978-4ad7-b0b7-8e2fbaa3e2db@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::20) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|SA1PR11MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: cb499d93-2ad3-44d1-ab09-08dd0b67e67d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2dQbTlzQXQzYUVZNUYrRXMrZUtwNjYwbFJRQWhpVVVSMzFCcnVucmwxc2Fi?=
 =?utf-8?B?NzAxSHV0dFN1bkI5L0dMMWkrR3ZCeDdaUUdlNmhEYnJnVTZMM2lpNGVWa0N3?=
 =?utf-8?B?OEU1RzdmdUNzQ0JqNFQxVUI2OStlYkt3SVhoWHlQMkh1b1FkOUdNMzJTbVhG?=
 =?utf-8?B?R0ZIVDdXT3hLZTRXdVpIVXdnb3hCZEF2c3ZRZGJIVkFyZU1GVVNsQzVpMFVh?=
 =?utf-8?B?Skp2K2ZOY21JMzN1QVg2WUlmbzYycVN2b3R5K1Q3OXdLZ2hmcUZFakpZZ2Qy?=
 =?utf-8?B?R0pPcTQ2RE1nU3RBYUxhcVFhQUprbnNXcmVkRUt5U2pFMklkWGorQTFNVWpr?=
 =?utf-8?B?elhjVUJjZU1JWHZ5T1NmakZKTGdCeGU5ekxkNTNYaklnZWNUK3djbzhqRHNE?=
 =?utf-8?B?bG5zaS9rN0I5eWZ0Mmdaa0ZlQXBmckpXUVlXeXdscmwzampodVlwVmk0VmVq?=
 =?utf-8?B?ODNEZ0J2OTZacHFpUEFOajBkZ3ZVU2sxUTVmT0MvTkJ4UTRLWkhndldHV3dQ?=
 =?utf-8?B?c3Jra0NuYlV6TzRXSmQ1TXZma1doSmxFN1JKUTRDRU1NRXhSdzZNT2hVMmZN?=
 =?utf-8?B?NDFJNFI0NThLYmFZYVB2eG1wRzZjclNIMnZjN2ZoU1dDcGRKU3BRaitCQ0tW?=
 =?utf-8?B?ZnhicHZWaFBiZUpvTjE4eDZramJhN0k3MGxQOXdzR1pTUzJMV3NnUWw1VHll?=
 =?utf-8?B?RU4yVUVjUVFza2dKWElYUCs2enhNVlFqa1JmL1pRb0oxVUxFN3pnTjhTUTZo?=
 =?utf-8?B?K0ZKSnNCc0d2TmFMMVNjYkVYdSswYkR4TkRKVzN5R2piNUEwRm4xcWpxK1Fq?=
 =?utf-8?B?eW5wOTZtYjlwOHF0YTNKV2ZycHg4YlVWc1crdEhRclYvdkNhTzhZYnJOQTBL?=
 =?utf-8?B?bmJLbDE4cGF0V1JpamtzNjNTaUdZcEY3U25sQ3FXMmVuWkRxNTFwNTBXTEc2?=
 =?utf-8?B?TUJHbklRVW8zZkI4bk9OSXVneDJyNGN0cUtkNkNLWm1aZ05RM1pJSXRndG15?=
 =?utf-8?B?bzg4YmsyMS9SUExTeHpJa0tzVmdNbisrRXpsdDhsU1kvZmhnaDFiOHQ3bGJp?=
 =?utf-8?B?Y2FsYU5aRDl1d3Z0NWswT0JjeUVTemZLSTVHTFlZTmJrYmZuSUNqNmZyZmdP?=
 =?utf-8?B?TktiWVltbVZvbWgvY1ZUbmdrSnlleEdwNFE1NVRYajFkdmVvMDMybVlXQ2Y3?=
 =?utf-8?B?OGo3VFVkNXdGMTVYUDI2YUlHdnVka2J2cXVQQmpXb2kyRVRrVERmUTRaTjY5?=
 =?utf-8?B?SEdIMXNqUE8zMEQyQ2lzbUt5V1o5SjJ1bHY1dzFhNnMyV2V4S2Z0cGtWR0xn?=
 =?utf-8?B?WEIwYTBMZjJXbzlETXVCenNrbFI3SUtadnhrSWFrNUFMUHhjeVNrRkpWQTR2?=
 =?utf-8?B?dWF6d1NFeXFQZUllRHpmSGFvMko0SzNFY2g4QkNWVE51dVM0RkhWZWt5ZGJl?=
 =?utf-8?B?bUUwZGpUbWJJK2ZkcFZUQVlobEx6ZW9Qd1VEWFNOeTlyWnZvY0lrdzdlcGI1?=
 =?utf-8?B?UnBiTEpkT0RrU1REM3hSTHFJdWo3b1JhRk5XandsQzAvT3pycWFxM0JaYnFB?=
 =?utf-8?B?UEtBa3d3dWd5RWptZ00yQmRMNUN0SGdWMFhvdjV1QkJTY3IwQTdDajlrWTJo?=
 =?utf-8?B?V21TQ2JueGczRS94bDlraGF6UzZPakVYN2NDVWhRU29hM0xJN3krSldsYXVY?=
 =?utf-8?B?RXdNNkdNcnpuSHZNdW1nc0x1UEF5UzFTQUtkVFRSMEdtZCtkUDJ2VGI2bUlS?=
 =?utf-8?B?NEc3Z2JsVlNyN1pjOUoyaDlZQ1Z2ajd2Q3QwZDVqcHBvKzB5djB1anZMSS8x?=
 =?utf-8?B?TVIySjRraVFDYTdEQVhBQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXROWUEzUjlUZ3RjdWVMby9zU3IzSE0zajRIR1NSMVZNUEx1WGtnOEhjbzVU?=
 =?utf-8?B?V1BMYWk2Q0Rmd2FzcHVnS1U0WkdCUUxVeHh2bVM0dkcwOXJSNnl4VndKbjk0?=
 =?utf-8?B?Y242QzRnL1EyZ2hCQjEzWkpDRm5pcUdub2I4TkptTlpBWXRneXJFeHEyVHFj?=
 =?utf-8?B?V2RoY2xMY1RteU1TZTF6L0pqSmJUZXFYSDBZRXVOZjR3YnR4VG5IVjdHbVY5?=
 =?utf-8?B?MjF2am8vc1NIZHVteXpSck5sYlpKUWhONlZDQzFLM3hkaWIwUUZxbFl1eFlV?=
 =?utf-8?B?U2NLbFlIZ0h2SG9Yc0hHSnZ4eU5ucXE3QnpQN3F4b2dnVVdpQmhucjIzUnlh?=
 =?utf-8?B?c3M2TnNmTko0LzJ6dEJwVERFM09kWHhvbXpsWDNEUHYza0gzV2JucUE0Rjc0?=
 =?utf-8?B?UmhVVDNFeDZJd3dBajY0WHBaTWZORWxHSXJXNjkxQjFZSUVCM2JEbG1QUENB?=
 =?utf-8?B?WE45RThWd0JRWStxSHlTS2dRT25jR1kyTjRIVk85UUVDU3F5S0NuVUlzN1oz?=
 =?utf-8?B?dE1QRVduSHNlSnhwTEhCN2pzM2NGbWw0bWVqZ3N4WnlkRU8rZ3RPUW5RNzk4?=
 =?utf-8?B?amdsOCtpbnIxSnRGaW9JbHFpb1I5R2RIdHhGVGV0VUxyWGwxMnFMNjVxWkhy?=
 =?utf-8?B?VGY3Z1BCRFNFR0NFVjdMS0JDS0hGajVXZkJuMThVc2p2czd6OFdRQkxNRGI5?=
 =?utf-8?B?U0k0NG5nMy9vbTRBQXJ1TG9DTVJHTDdwT2dOSVRWWmtydk9Xb0N4UVNWM3Nm?=
 =?utf-8?B?YTJWQUh0L3VwdDJxUE9rQmxXSm5lZmFIbGRCeC9ubVNjb3k2OXdhSGV3SDFL?=
 =?utf-8?B?djVzdFYwOUJ1TVdhOVl0TWJGVVZBc0JEQTZqcXVJaGRUVllvU3c5dHJ4M2d2?=
 =?utf-8?B?bzNwQ3M3SjBLVHdpVXBrK2RwQ0VRUmdodkkxZGNudUxUbDlIVW1UVWV3b3F4?=
 =?utf-8?B?cjFNa0ZMSXBCZUtWQzRYUlJUcGI3dC8xeWRwUnpJanNJQW0zZnVRTlZIbUF4?=
 =?utf-8?B?VitveHhOT3RtRldtNFFKRGUrdHVJRCtkOTBLUmNwdzlXUVJJaGhRNlBURHNM?=
 =?utf-8?B?MWdza1VNNkc0dGRIVDhGZElzUVJSQzNrdjFTMGxBN3ZtbjlsTHBuMGppQ2FO?=
 =?utf-8?B?RkZXTUd3QjJ4S0lsZGorQTB3SnloSTNkY2h2SHBoRmR5aTF0dUp5cVF0OGRl?=
 =?utf-8?B?V3VucHhnZlBoYnJia1lTNm1oVjFWSE9BTGM2aGx5WS9BazFpdlFYWVdmVVhm?=
 =?utf-8?B?QVMySUhaclB4S1laMDRzRlZ4dXRhU0ZmVnFoSzdkam0rREU4WTRHaUVGZ2l4?=
 =?utf-8?B?NSsvcm9JYmo5TU1rUEg2cW9JZ0JFbWtBbUc3UkxiU3pJS1hGR21DN290N0ZR?=
 =?utf-8?B?NzlaME5pUHlzT1MxcFI1L0UrcHBPZFRBNFRqUS9SeERMZnk4U1d0NXV0M25T?=
 =?utf-8?B?MU44aVk1Sjg0VHE5NXRwYVZGTVRxRDRXZGtTdDBOeVZjWXUwTGdxcVNOM256?=
 =?utf-8?B?c2t0UXJ0VHZpS204Q3ZXYURCZFdick1GWDUwWWxBUmt4WVBDbjhFejRoSVlK?=
 =?utf-8?B?ZzVwK0JTQmhVOEViN21oQlJBUmdhS2YxM0NpUmI1ZjgvMDV6bkkwYUtZUXJZ?=
 =?utf-8?B?cmtRbnhMWFRaRHFPOEkzeElRaXY0NVg2U1hyUDFmWHhqVnBrTHo1T2l5ajZv?=
 =?utf-8?B?cElRSDJLeFk2RkwwVng3K1ZBQTZFdDRqd0ZuM01pa2lGWlkvZ0hVcjBFOHhL?=
 =?utf-8?B?RDBLS0huK2ZKa2NFL0xmYk5SMVppRncxZllraWxnclBiY0JYMlBpY2xEWktX?=
 =?utf-8?B?S2dlTHFKTjM5WXBXSHVxSVpETE44OU5jZDN0S2YyalZCUXBUdmZEUnYxU3kw?=
 =?utf-8?B?dGlGQTJ6Y254ZjBRRFNVYXBvOHNLUmxCK1QxREVqY2prTHkwSHRreDl6VWV1?=
 =?utf-8?B?VUR2TVNZRWJpVFBNajV3OXRQR0l1VzJSTjhmWnFUcUsxNmt5ZnNGK25YREE2?=
 =?utf-8?B?L1ZuUitFSW1ERjhmc2RJeldDQ0s2R1VMUWpOS0ZPUFExcnVZRGhLVTFSdXdW?=
 =?utf-8?B?QldOS0FjQU9Bdk1qL3d0d2VSNm5KUm5mQ2s0RjdqWlMxa1hQeENkdXlPTHRu?=
 =?utf-8?Q?AdZw/WrrWOCHa/IA837rIlTJy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb499d93-2ad3-44d1-ab09-08dd0b67e67d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2024 02:38:23.6491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dyh4nvUVIWi8QqI6S14XEHcxSeiIdyfXHPDKIZwCyMZqrX4SdnS9KNJzvXtI0nY3S0MJZTdkZzQnsIsVdIGafQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7111
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


On 16.11.2024 20:29, Michal Wajdeczko wrote:
> On 16.11.2024 03:12, Tomasz Lis wrote:
>> We have only one GGTT for all IOV functions, with each VF having assigned
>> a range of addresses for its use. After migration, a VF can receive a
>> different range of addresses than it had initially.
>>
>> This implements shifting GGTT addresses within drm_mm nodes, so that
>> VMAs stay valid after migration. This will make the driver use new
>> addresses when accessing GGTT from the moment the shifting ends.
>>
>> By taking the ggtt->lock for the period of VMA fixups, this change
>> also adds constaint on that mutex. Any locks used during the recovery
>> cannot ever wait for hardware response - because after migration,
>> the hardware will not do anything until fixups are finished.
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 175 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h |   1 +
>>   drivers/gpu/drm/xe/xe_sriov_vf.c    |  15 +++
>>   3 files changed, 191 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index cca5d5732802..ae24c47ed8f8 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -912,6 +912,181 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt)
>>   	return err;
>>   }
>>   
>> +static u64 drm_mm_node_end(struct drm_mm_node *node)
>> +{
>> +	return node->start + node->size;
>> +}
>> +
>> +static s64 vf_get_post_migration_ggtt_shift(struct xe_gt *gt)
>> +{
>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> I'm wondering whether it would be possible to set/remember any GGTT
> shift when VF was querying it's new config?

The querying happens within post-migration recovery worker, after the 
upcoming lock is taken.

So subtracting old from new just after the GuC config query would be doable.

Yeah, will do that.

>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	u64 old_base;
>> +	s64 ggtt_shift;
>> +
>> +	old_base = drm_mm_node_end(&tile->sriov.vf.ggtt_balloon[0]->base);
>> +	ggtt_shift = config->ggtt_base - (s64)old_base;
>> +
>> +	xe_gt_sriov_info(gt, "GGTT base shifted from %#llx to %#llx\n",
>> +		  old_base, old_base + ggtt_shift);
>> +
>> +	return ggtt_shift;
>> +}
>> +
>> +static void xe_ggtt_mm_shift_nodes(struct xe_ggtt *ggtt, struct drm_mm_node *balloon_beg,
>> +				struct drm_mm_node *balloon_fin, s64 shift)
> there is way too much internals that should be just known to the xe_ggtt
> maybe better to move most of this function to xe_ggtt.c ?
Sure, I can move them. Will do.
>> +{
>> +	struct drm_mm_node *node, *tmpn;
>> +	int err;
>> +	LIST_HEAD(temp_list_head);
> nit: I think our Xe maintainers prefer declarations in Reverse Christmas
> Tree Format
I though the rule is - uninitialized, then initialized. But I see all 
possible conventions within the existing sources, so there just seem to 
be no rule.
>> +
>> +	lockdep_assert_held(&ggtt->lock);
>> +
>> +	/*
>> +	 * Move nodes, from range previously assigned to this VF, into temp list.
>> +	 *
>> +	 * The balloon_beg and balloon_fin nodes are there to eliminate unavailable
>> +	 * ranges from use: first reserves the GGTT area below the range for current VF,
>> +	 * and second reserves area above. There may also exist extra nodes at the bottom
>> +	 * or top of GGTT range, as long as there are no free spaces inbetween. Such
>> +	 * extra nodes will be left unchanged.
>> +	 *
>> +	 * Below is a GGTT layout of example VF, with a certain address range assigned to
>> +	 * said VF, and inaccessible areas above and below:
>> +	 *
>> +	 *  0                                                                  ggtt->size
>> +	 *  |<--------------------------- Total GGTT size ----------------------------->|
>> +	 *
>> +	 *  +-----------+-------------------------+----------+--------------+-----------+
>> +	 *  |\\\\\\\\\\\|/////////////////////////|  VF mem  |//////////////|\\\\\\\\\\\|
>> +	 *  +-----------+-------------------------+----------+--------------+-----------+
>> +	 *
>> +	 * Hardware enforced access rules before migration:
>> +	 *
>> +	 *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
>> +	 *
>> +	 * drm_mm nodes used for tracking allocations:
>> +	 *
>> +	 *  |<- extra ->|<------- balloon ------->|<- nodes->|<-- balloon ->|<- extra ->|
> in Xe we don't have 'extra' regions since xe_ggtt already covers only
> GuC accessible GGTT region, so it's like:
>
> 0                                                        4GiB
> |<----------------- Total GGTT size ------------------------>|
>
>      WOPCM                                      GUC_TOP
> +-------+-------------------+-----------+------------+-------+
> |\\\\\\\|///////////////////|  VF mem   |////////////|\\\\\\\|
> +-------+-------------------+-----------+------------+-------+
>
>          0                                  ggtt->size
>          |<--balloon-------->|<--nodes-->|<-balloon->|
will update.
>> +	 *
>> +	 * After the migration, GGTT area assigned to the VF might have shifted, either
>> +	 * to lower or to higher address. But we expect the total size and extra areas to
>> +	 * be identical, as migration can only happen between matching platforms.
>> +	 * Below is an example of GGTT layout of the VF after migration. Content of the
>> +	 * GGTT for VF has been moved to a new area, and we receive its address from GuC:
>> +	 *
>> +	 *  +-----------+--------------+----------+-------------------------+-----------+
>> +	 *  |\\\\\\\\\\\|//////////////|  VF mem  |/////////////////////////|\\\\\\\\\\\|
>> +	 *  +-----------+--------------+----------+-------------------------+-----------+
>> +	 *
>> +	 * Hardware enforced access rules after migration:
>> +	 *
>> +	 *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for VF ------->|
>> +	 *
>> +	 * So the VF has a new slice of GGTT assigned, and during migration process, the
>> +	 * memory content was copied to that new area. But the drm_mm nodes within i915
> i915 ?
ack
>> +	 * are still tracking allocations using the old addresses. The nodes within VF
>> +	 * owned area have to be shifted, and balloon nodes need to be resized to
>> +	 * properly mask out areas not owned by the VF.
>> +	 *
>> +	 * Fixed drm_mm nodes used for tracking allocations:
> drm_mm nodes are implementation details of the xe_ggtt_nodes

You could equally say xe_ggtt_nodes are wrappers for drm_mm nodes. 
Neither of these is going anywhere

for the lifetime of the driver within the kernel. And even calling these 
approaches equal is a stretch.

It is easier to explain how something works using generic terms, and I'm 
sure you agree drm_mm nodes are

more generic than the xe-specific wrappers.

The function is not fixing anything beyond the drm_mm - there are no 
modifications to the xe decorator.

And note, vast majority of people reading the code will see the xe nodes 
as just that - drm_mm node decorators.

>> +	 *
>> +	 *  |<- extra  ->|<- balloon ->|<-- VF -->|<-------- balloon ------>|<- extra ->|
>> +	 *
>> +	 * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
>> +	 * overlap; but our node shifting will fix addresses properly regardless.
>> +	 *
>> +	 */
>> +	drm_mm_for_each_node_in_range_safe(node, tmpn, &ggtt->mm,
>> +					   drm_mm_node_end(balloon_beg),
>> +					   balloon_fin->start) {
>> +		drm_mm_remove_node(node);
>> +		list_add(&node->node_list, &temp_list_head);
>> +	}
>> +
>> +	/* shift and re-add ballooning nodes */
>> +	if (drm_mm_node_allocated(balloon_beg))
>> +		drm_mm_remove_node(balloon_beg);
>> +	if (drm_mm_node_allocated(balloon_fin))
>> +		drm_mm_remove_node(balloon_fin);
>> +	balloon_beg->size += shift;
>> +	balloon_fin->start += shift;
>> +	balloon_fin->size -= shift;
>> +	if (balloon_beg->size != 0) {
>> +		err = drm_mm_reserve_node(&ggtt->mm, balloon_beg);
>> +		XE_WARN_ON(err);
>> +	}
>> +	if (balloon_fin->size != 0) {
>> +		err = drm_mm_reserve_node(&ggtt->mm, balloon_fin);
>> +		XE_WARN_ON(err);
> maybe xe_tile_assert() will work here?
sound good.
>> +	}
>> +
>> +	/*
>> +	 * Now the GGTT VM contains only nodes outside of area assigned to this VF.
>> +	 * We can re-add all VF nodes with shifted offsets.
>> +	 */
>> +	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
>> +		list_del(&node->node_list);
>> +		node->start += shift;
>> +		err = drm_mm_reserve_node(&ggtt->mm, node);
>> +		XE_WARN_ON(err);
> ditto
>
>> +	}
>> +}
>> +
>> +static void xe_ggtt_node_shift_nodes(struct xe_ggtt *ggtt, struct xe_ggtt_node *balloon_beg,
>> +				struct xe_ggtt_node *balloon_fin, s64 shift)
>> +{
>> +	struct drm_mm_node *balloon_mm_beg, *balloon_mm_end;
>> +	struct drm_mm_node loc_beg, loc_end;
>> +
>> +	if (balloon_beg && balloon_beg->ggtt)
>> +		balloon_mm_beg = &balloon_beg->base;
>> +	else {
>> +		loc_beg.color = 0;
>> +		loc_beg.flags = 0;
>> +		loc_beg.start = xe_wopcm_size(ggtt->tile->xe);
>> +		loc_beg.size = 0;
>> +		balloon_mm_beg = &loc_beg;
>> +	}
>> +
>> +	if (balloon_fin && balloon_fin->ggtt)
>> +		balloon_mm_end = &balloon_fin->base;
>> +	else {
>> +		loc_end.color = 0;
>> +		loc_end.flags = 0;
>> +		loc_end.start = GUC_GGTT_TOP;
>> +		loc_end.size = 0;
>> +		balloon_mm_end = &loc_end;
>> +	}
>> +
>> +	drm_dbg(&ggtt->tile->xe->drm, "tli: node shift start beg %llx %llx end %llx %llx\n",
>> +		balloon_mm_beg->start, balloon_mm_beg->size,
>> +		balloon_mm_end->start, balloon_mm_end->size);
>> +	xe_ggtt_mm_shift_nodes(ggtt, balloon_mm_beg, balloon_mm_end, shift);
>> +	drm_dbg(&ggtt->tile->xe->drm, "tli: node shift end\n");
> tli ? looks like your private debug logs
yeah, forgot about these.
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
>> + * @gt: the &xe_gt struct instance
>> + *
>> + * Since Global GTT is not virtualized, each VF has an assigned range
>> + * within the global space. This range might have changed during migration,
>> + * which requires all memory addresses pointing to GGTT to be shifted.
>> + */
>> +void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt)
>> +{
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
>> +	s64 ggtt_shift;
>> +
>> +	mutex_lock(&ggtt->lock);
>> +	ggtt_shift = vf_get_post_migration_ggtt_shift(gt);
> do we still need to do anything if shift is 0?
Decreasing recovery time when possible does make sense. Will add a 
condition.
>> +	xe_ggtt_node_shift_nodes(ggtt, tile->sriov.vf.ggtt_balloon[0],
>> +				 tile->sriov.vf.ggtt_balloon[1], ggtt_shift);
>> +	mutex_unlock(&ggtt->lock);
>> +}
>> +
>>   static int vf_runtime_reg_cmp(const void *a, const void *b)
>>   {
>>   	const struct vf_runtime_reg *ra = a;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index 912d20814261..a8745ec23380 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -17,6 +17,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>> +void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index c1275e64aa9c..5bcd55999e0e 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -7,6 +7,7 @@
>>   
>>   #include "xe_assert.h"
>>   #include "xe_device.h"
>> +#include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_pm.h"
>> @@ -170,6 +171,19 @@ static bool vf_post_migration_imminent(struct xe_device *xe)
>>   	work_pending(&xe->sriov.vf.migration.worker);
>>   }
>>   
>> +static void vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	for_each_gt(gt, xe, id) {
> maybe for_each_tile() would be a better fit here?

Since current platforms have ggtt per-tile rather than per-gt, it does 
makes sense. Will change.

-Tomasz

>> +		/* media doesn't have its own ggtt */
>> +		if (xe_gt_is_media_type(gt))
>> +			continue;
>> +		xe_gt_sriov_vf_fixup_ggtt_nodes(gt);
>> +	}
>> +}
>> +
>>   /*
>>    * Notify all GuCs about resource fixups apply finished.
>>    */
>> @@ -201,6 +215,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   	if (unlikely(err))
>>   		goto fail;
>>   
>> +	vf_post_migration_fixup_ggtt_nodes(xe);
>>   	/* FIXME: add the recovery steps */
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
