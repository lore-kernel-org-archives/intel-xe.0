Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8756FC87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 11:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343B510E04D;
	Tue, 29 Jul 2025 11:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="me9WfMa/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096BD10E04D
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 11:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753788934; x=1785324934;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=71fRnned71pxwUc/d84Y2/BKqjmuEJzKQ6AaQ51EJtE=;
 b=me9WfMa/dpB2Z63DvaQiPTgjZS2slwqFn09R00/MX0VIOR7rmXT0dYYk
 uk4xuJ44zlKjLiALHtUmaJpskDI3doLxGwOyk0RaHOTPAyvAVU0gqC5Vj
 K4CBoPGF1hXOgiRrfVadcCpU3U/W+XlP8rl5mcKKEVYy4nlmbAVOIGxML
 XUEbnEyKfCQPnqQn56uVOTzzyQ4e6xfkAGX6npRjvIjn/JJ8GSAeeH4fH
 7zkeajPYimmd8Qjk16gIRk7pVUGIrJYWRnuYXHb95G5reWWNDfLoj0Q9u
 YqjTmyPdIwnGALWMnoiJfFwxlikf0mKXY2umwRKZ1+iGl9OI3lwNk+MOJ w==;
X-CSE-ConnectionGUID: TfAH2gbFQR6OQryH8LODxg==
X-CSE-MsgGUID: TRbkA1iIQCGy80AevEhvXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="58678989"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="58678989"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:35:33 -0700
X-CSE-ConnectionGUID: iRMc77b2RyS6tXotrbaTsg==
X-CSE-MsgGUID: 6JigS+XWSaabsC2IlVCNwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="186330700"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:35:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 04:35:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 04:35:32 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 04:35:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePxScWBN+EsbQc+TTOx5GRZPnL/ERzSstG9Mco8fWEbZaW8tmO8L/F5heWnTWsxZ8tLDwpSDAxK21PU/plcBezOQrhPzMyYezGv2mHIzbul7LAgHNxis8kWFECf7qhiF8Nb3kG8WHhwpzBq20aWHn8rURY+xje14K+lXhIoDYcUEJEJKH+jYFcW+2blxpxrhT8yFhVvnUV19XTIbA7YHYHcNEUdRqFbgzGuxiAS9M6TX1m5OkRMEgMEEvZD53nERLcTMSV+R7lFibhP7HB0VIFt1DaPL9KbAShTSWNzpwlVhE79QXkwX/I4kPodUeMrFwwYqbMGi9mAlr19snmztow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcTwoqOpPOq2fjUqYEK+Tt4CTAPhVFBki7QiXBZp92U=;
 b=X5MxEo5Q9p3kfmS3fioscsKcvMJcdIgPJLeigmTAP5jLPrGNMlXDvV1h051bTHWiv0E4SHMvf64LBsPR/wDAUWeXBciC6I+jwNI5nkUO7fKhMbRtH3P0DWqX4QlSlq4EW1/m8ybgvKBA75x//mEuhPUSiJx0apKMyBICy4ur7+zP76vMCrQfh6gyL2ijnnJGlXuH7jLgEJV8CFBQQE+QatCT7azT1TkalqDtYxydCX4LBtsiWW5JnJogRU+fmm/bmb2BEM/M+UeiocdnBXDYvRfQrsE6dPixbzA0kCgoutVR8XfDEt12+/+SR6OijACNerSIbR11rSGdFjg84Ypr1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MN2PR11MB4743.namprd11.prod.outlook.com (2603:10b6:208:260::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Tue, 29 Jul
 2025 11:35:03 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8989.010; Tue, 29 Jul 2025
 11:35:03 +0000
Date: Tue, 29 Jul 2025 13:35:00 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3] drm/xe/vf: Fix VM crash during VF driver release
Message-ID: <20250729113500.lzfnng25lijnz2qi@intel.com>
References: <20250729064317.28366-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250729064317.28366-1-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: WA1P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MN2PR11MB4743:EE_
X-MS-Office365-Filtering-Correlation-Id: 095f7887-5b40-41f6-7bee-08ddce93f5ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGdZclp1b2JoTmRNVXpWNEtqZHZpbUlQaU8yVzB0bXFZMUJvYVhtMjdaWjhX?=
 =?utf-8?B?VjU4aWl2c2M2RHpKK2lJSmdWRFJraWtlaUUzQjJRZzRJTlVLSlZ3eS9vL09v?=
 =?utf-8?B?TDVCNDZvMlVXTFJYYkd0cENHTmRUaGptYk5xd2pGOFI2SUxTbXl3UVcvbXhF?=
 =?utf-8?B?cWRGT3lyVTdJYTd2WGVCS2xTaWc0VWZjOUJQZysvTkZ3SVEwejNDelRQRVdL?=
 =?utf-8?B?UXloYjRmWVlBWDRhUFZmbmF2ajhweHUzU2tkOXZOM3N6bHo2NVNGanJRVEpC?=
 =?utf-8?B?RGl3RVJjTXl5M0tWN1BYSzNWZ2xXd1ZFR3FMU1lJZG1sSkdlRjNIYURwMjNT?=
 =?utf-8?B?QUxOYXViTmxSVTQ2TTFVYTBReUI2eDZzaWpBYmlUUGFLaGhzUDBySFhyc2lo?=
 =?utf-8?B?SFhWTUhLaXpCNjVJdjZjNU40MHNRbmYwTVdLVGtLNnVEZXFXMnpsOWNpMTh5?=
 =?utf-8?B?OWY4QU40bG1lbEY1YzRPbWx1M2lxVS9ZTi93dkJGYjlHbU1EMEdWRWFSV29H?=
 =?utf-8?B?dVUrWGg1WmhSdXJQQUxwcWlHSGFzNU9CU3BFRG84WDNhc1MveTl2QXNiRlVx?=
 =?utf-8?B?NDlwSFl3cndWem9YYnZ0NWJGb3JRY3ZkWmhkbTZuQnBBUFVESmo4MkZGLzN4?=
 =?utf-8?B?UjlveE1BK29rdmk1TmJzK3I5eHZBeTN5dWtnNVhSQUlMbjBKZy9tVUNKb1k1?=
 =?utf-8?B?MC9iT05CcGtrOGtQTExpcmlaZFhoZktpYUxSZDk2OE9XbWV3S3BkZkdpOTNF?=
 =?utf-8?B?MndOVytTYVduekxBQTlUd2ZscTFVZDdkc005bThrRnJnYkFoUU1YSWgrbndv?=
 =?utf-8?B?SW1DNFBwYUZZRDNuTnhQbG5jcnRzajBJVVY1RDNwNEthNU5sWkpBVC9aMGNH?=
 =?utf-8?B?dDVFOUl2TkFuMGliamdIdnFHUGRQVmJjK0hKcXNDblB4anlyazdmbkh1Zk5s?=
 =?utf-8?B?RHFjaDYxOVlOTmhRNGloK0NBZ3VHZVFEUTIwZU9Lby82TUV5UkJEaENackQ0?=
 =?utf-8?B?Mis5clNYRjVQWVJLdmllL2l5YUdYaEtuQVRicjl1Um1CMW5EZmRCNWxpZThD?=
 =?utf-8?B?T0pOcnlXeEZOVTdzeS9Mbk1QRWZNVXJIV0RDYWRQNllrcjhuTVBQYWg2UHB6?=
 =?utf-8?B?allxVkFscEloaWExSG5rbm4zUjZndTYzS0VJWlVUWWZZSGhqN0lkVjZYWWpP?=
 =?utf-8?B?SFRQbzNQYUYydlVLYms0Nmhya1dTRW9CNnpqQTZ5K0p4VHZLSE5KeVo3YStY?=
 =?utf-8?B?QXNoRDRFRitOeEdobWhQNzczSlg1dWxMREJjdEFMd243aUhURkNTMGdFZXE4?=
 =?utf-8?B?enAwVmNydE9UOTNEMjBJVHl1Vy9MZUJmeTRwVXlJVXQ3ak1NbDFtbC9LQlUv?=
 =?utf-8?B?Y1RqY2d5S1pTYUlyWW1RemQ5S0NSamhFcGRyU3NFZGk4R016eDV0dFp3OS83?=
 =?utf-8?B?ZDZ3VkQxdk00L3JLbDFyOXFSNjFrWm5kdnAzWG4zUU0wc1Ziak1uRXRwN0F6?=
 =?utf-8?B?czZWcnhWMk5TSmVaSDFjb0UvZDVvWkdremNySG5BNk5qWVJCQzhhUW55Yit5?=
 =?utf-8?B?Q0xLZkZzNzlacyt2cWxYeVhCTzAzTnlUNThGNE84OHFEYWZERjJCWWVxb3FC?=
 =?utf-8?B?bnRENks2R3hrTG9iNzhvbEkxakwxekNxeUdQT052KzRaSXBxeUNlZ3hxYy9t?=
 =?utf-8?B?b2hpOHhGM0pLakYxVVZiYlA1Wk1YNmZnaEhlblptTEtiL0xUL2FpZVdTZDFT?=
 =?utf-8?B?MDg0WGRCMVB6NXRoRFRPeVpOQ3JUZmtDTWJVMytFYURsbEt5a3grM1JVV3cz?=
 =?utf-8?B?b2NMbE1TcHVDRW1UNHg3cis4Z0lyRmEyNk1sVXBQanNZNHUwenRYRUhyT0lt?=
 =?utf-8?B?bGVEc2syTGp3LzVKZlRCeVVtbnl6aFNySFZhelludmxHcis4Tnk3Q3BjMUY5?=
 =?utf-8?Q?Q+UchFfUUh0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFQ5N0tjSk9HdWlFTm1KaHpMSjVLS0ROUlBBaHIxUjZBZVhWTkcweTRBcUJ0?=
 =?utf-8?B?emNDUVdpbkFWNlVrNzNTOHkyY2QrY09NbjBRQSt6UGJrS0ZyWjRFWktiYTNI?=
 =?utf-8?B?TUZmM0tSTGVyeUJ3NFhmNWNNRFJjelYvRmdTOXkxd1I5MUwxN3Y5VTZ0QWRC?=
 =?utf-8?B?NkljM2diL1RMNVlUU0FtSjNJUVhMYVZUTnlxNU9XRWRpbXQyM1NETTh3Uk9Y?=
 =?utf-8?B?dkJXQTZWeTR4RC83a000eUZPMW1hRXlhMHozSnhxekxYV1Z0NWRFaVhYeE1m?=
 =?utf-8?B?QklrZEpsNjA5TWM4bThMS2VEekloQ0JwdXFYaDRNYk1nNXU4djcwRlIxZEU5?=
 =?utf-8?B?akVYMEVqTnZNZ3pRWjFrWExoUHV1K200SXdTTkY4d2V0NzMvSUczcEZVTGsx?=
 =?utf-8?B?ZUp1Z2M1WSt0TEdEUVlxOG95b2txZFJGNUVzSWU4Wm5iRmhjZy8yTnc4REFC?=
 =?utf-8?B?Skd1aVNmeE0zbkpoRFVBZHRBOG9lWURKMzdwRzZyZTRickhFelFIMHArc3pC?=
 =?utf-8?B?bjJYSjhMVHBCdkRkSkhMdnBuenlCK043M1RtdTlZYlRmeEpCdlZNOFFQa3dX?=
 =?utf-8?B?WDNHY0pPdXJlTnFkK2lxN0E3ekRFNzZPVFhMKzhva0RQWHA1eFhiTnhDV1ow?=
 =?utf-8?B?U0dPUmphdnRUOHlQbDVTR1lCeWJPem9yOWNtRjhCZWVLcWphaTg2RGVhMlZD?=
 =?utf-8?B?ZFFDVjIrMG1JZURLS0IzSVptRkdLWGNVTng4QmF1U3RxSGN3R0UwWnBEcm1m?=
 =?utf-8?B?aVgzbzk4OHRVQnU3K1RjazluQ2NabzhpQUVYRVA3ZDlKczhjWjZGYmxtMW1Q?=
 =?utf-8?B?em1US20wMHQvZzZWRHA5bXBkY0JNaVFyUzN0cHF6M2RBMnZwVVJKcHZ5RGR2?=
 =?utf-8?B?R24rVk9YUThUZWNBWElUK2M3OGdTTHVXSUExT25TNTI0RHFOQ2NWaHdkOE1O?=
 =?utf-8?B?QmM2VkxwaUsvOVBzUU5KaThuVDVWSDJreVBsUTJYQVRucGVsNlFqWUl5SmNw?=
 =?utf-8?B?S3dNRXBwVlpUTmhaU25YWENVMmd1R0xJRjBkRmdXNkd5eEljYXM5ZXdxOHZO?=
 =?utf-8?B?Sm5tMkFrQ2JiODA2ZWVseUFFdEhNS1pGaHFpTmhNTmlqaWdhdTRWVHQwU3l4?=
 =?utf-8?B?dFl5eUdUOWhMa2J3VEhZb21ZZHIrMWhmc29LV2ZKZTVLOW9WbUllemZIdHRE?=
 =?utf-8?B?ODlPcXg4WEluK0lqRHNzeHJzZzF2OE12REhheVhzcjVnTnl6U0svNWdoZTA1?=
 =?utf-8?B?K2RGT0xDTHB4Tld5aGcxeml5QWRWUndMOVNFL08xNHNlQ2FITUJqKzhjZjl1?=
 =?utf-8?B?WWxOeExXWnZxV3M4WnJVTmc3ZlVZNTM3bUcwQkFDUFU1NHk0RjhubVVTa0NY?=
 =?utf-8?B?MUdpaTE0UUNQTEQ3OHRWVnhFR1dDWWF0WmVNTGR2WHNnT3dRVG5jNDVzc2Jo?=
 =?utf-8?B?RWVHVUl2aUtRSSsrVllzM1FLS3E5SGptckxsL2JXL2Yxck9QdWxLSlIwS0RE?=
 =?utf-8?B?T2xHdHExa01IYmUydFVoUUNicUVkdUxZbDJSaWNKbU5oRXluZVJDOGwxMTI0?=
 =?utf-8?B?RGxxdFRTS3RWdk42enRsbWZXcW8wcGthZXYweVBycURqK1EzUFFETlMySWph?=
 =?utf-8?B?RmhNVlNGMkRsVmZTcVI3TXhXRUNaL01iUnRFU2h1TURTRVpOVjNud3lTYUow?=
 =?utf-8?B?N2xBTXV5WXlxOFpsRXNrbmhhbGM3UVNuSktZdDQ2VngrbTVha2tsREhId3pw?=
 =?utf-8?B?UVAwWW5xekJSaTdxNHFHWmdVd25xc0FWZFJ3SURabFlzdFRrMG5HRjM3ZnQy?=
 =?utf-8?B?SlZ2M0dkOGZQdVRwL1AyVU4zMFg3MDZ0Zk1WdWRTUzZDZm43RkhWL2JqSmdK?=
 =?utf-8?B?cW95VlpVS3VXWUZVUG1NR25nZXgzUnRrYkYzbmdRMjI5dk5wRE5KR3NEQTZm?=
 =?utf-8?B?NjRsVWNOUE9PZ2ZPSHlycWNRZG4zeTlwZ25WRURsTGp0Mm4vcEdMeU1sL3Zw?=
 =?utf-8?B?TWN1TGJ4dHl4RnJCOUFTVTFVY1BDVlg4eW1OOTdCb0ovL2NKSHh2Y0M0ak1G?=
 =?utf-8?B?QVZscGNPZ2c2cDRBZzRoUmNVMnBmSGdvSTdFc3V2UzlqK3hxQmZzaUMvTDBa?=
 =?utf-8?B?dENBcjJZeXJkYzJDWS8zSlpKNUEzUEIzdGVMdFlGbTlraUdlMG5oMjRTQ29N?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 095f7887-5b40-41f6-7bee-08ddce93f5ab
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 11:35:03.5307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j9rXK5TZrJ2Lhb2WL8g6Xc2+xODN0jWxH4Bhyk8sLAt0Aer/IPh4IeOkhfY8Fb6p6DdzKvmWbwi0Z3ZeAHcUWkVya1sBkjzlBx6hzlGOrHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4743
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

Satyanarayana K V P <satyanarayana.k.v.p@intel.com> wrote on wto [2025-lip-29 12:13:17 +0530]:
> The VF CCS save/restore series (patchwork #149108) has a dependency
> on the migration framework. A recent migration update in commit
> d65ff1ec8535 ("drm/xe: Split xe_migrate allocation from initialization")
> caused a VM crash during XE driver release for iGPU devices.
> 
> Oops: general protection fault, probably for non-canonical address
> 0x6b6b6b6b6b6b6b83: 0000 [#1] SMP NOPTI
> RIP: 0010:xe_lrc_ring_head+0x12/0xb0 [xe]
> Call Trace:
>  xe_sriov_vf_ccs_fini+0x1e/0x40 [xe]
>  devm_action_release+0x12/0x30
>  release_nodes+0x3a/0x120
>  devres_release_all+0x96/0xd0
>  device_unbind_cleanup+0x12/0x80
>  device_release_driver_internal+0x23a/0x280
>  device_release_driver+0x12/0x20
>  pci_stop_bus_device+0x69/0x90
>  pci_stop_and_remove_bus_device+0x12/0x30
>  pci_iov_remove_virtfn+0xbd/0x130
>  sriov_disable+0x42/0x100
>  pci_disable_sriov+0x34/0x50
>  xe_pci_sriov_configure+0xf71/0x1020 [xe]
> 
> Update the VF CCS migration initialization sequence to align with the new
> migration framework changes, resolving the release-time crash.
> 
> Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
> V2 -> V3:
> - Fixed issue with error handling in xe_migrate_init() (Michal)
> 
> V1 -> V2:
> - Updated xe_migrate_init() input arguments and return type (Michal)
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/xe_gt.c           |  6 ++---
>  drivers/gpu/drm/xe/xe_migrate.c      | 40 +++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_migrate.h      |  2 +-
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  7 ++++-
>  4 files changed, 33 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index c8eda36546d3..5a79c6e3208b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -564,11 +564,9 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
>  	if (xe_gt_is_main_type(gt)) {
>  		struct xe_tile *tile = gt_to_tile(gt);
>  
> -		tile->migrate = xe_migrate_init(tile);
> -		if (IS_ERR(tile->migrate)) {
> -			err = PTR_ERR(tile->migrate);
> +		err = xe_migrate_init(tile->migrate);
> +		if (err)
>  			goto err_force_wake;
> -		}
>  	}
>  
>  	err = xe_uc_load_hw(&gt->uc);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 90065d7d29ff..a5b2fe6ecac2 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -396,15 +396,15 @@ struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile)
>  
>  /**
>   * xe_migrate_init() - Initialize a migrate context
> - * @tile: Back-pointer to the tile we're initializing for.
> + * @m: The migration context
>   *
> - * Return: Pointer to a migrate context on success. Error pointer on error.
> + * Return: 0 if successful, negative error code on failure
>   */
> -struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> +int xe_migrate_init(struct xe_migrate *m)
>  {
> -	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_tile *tile = m->tile;
>  	struct xe_gt *primary_gt = tile->primary_gt;
> -	struct xe_migrate *m = tile->migrate;
> +	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_vm *vm;
>  	int err;
>  
> @@ -412,15 +412,13 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
>  			  XE_VM_FLAG_SET_TILE_ID(tile));
>  	if (IS_ERR(vm))
> -		return ERR_CAST(vm);
> +		return PTR_ERR(vm);
>  
>  	xe_vm_lock(vm, false);
>  	err = xe_migrate_prepare_vm(tile, m, vm);
>  	xe_vm_unlock(vm);
> -	if (err) {
> -		xe_vm_close_and_put(vm);
> -		return ERR_PTR(err);
> -	}
> +	if (err)
> +		goto err_out;
>  
>  	if (xe->info.has_usm) {
>  		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
> @@ -429,8 +427,10 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  							   false);
>  		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
>  
> -		if (!hwe || !logical_mask)
> -			return ERR_PTR(-EINVAL);
> +		if (!hwe || !logical_mask) {
> +			err = -EINVAL;
> +			goto err_out;
> +		}
>  
>  		/*
>  		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
> @@ -449,8 +449,8 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  						  EXEC_QUEUE_FLAG_MIGRATE, 0);
>  	}
>  	if (IS_ERR(m->q)) {
> -		xe_vm_close_and_put(vm);
> -		return ERR_CAST(m->q);
> +		err = PTR_ERR(m->q);
> +		goto err_out;
>  	}
>  
>  	mutex_init(&m->job_mutex);
> @@ -460,7 +460,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  
>  	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
>  	if (err)
> -		return ERR_PTR(err);
> +		goto err_release_queue;

I was wrong when I previously suggested that we should also do some cleanup here.

static inline int __devm_add_action_or_reset(struct device *dev, void (*action)(void *),
					     void *data, const char *name)
{
	int ret;

	ret = __devm_add_action(dev, action, data, name);
	if (ret)
		action(data);

	return ret;
}

It seems that when the function responsible for cleanup cannot be registered, the cleanup is done
anyway in error path of this add action function.

Thanks,
Piotr
>  
>  	if (IS_DGFX(xe)) {
>  		if (xe_migrate_needs_ccs_emit(xe))
> @@ -475,7 +475,15 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  			(unsigned long long)m->min_chunk_size);
>  	}
>  
> -	return m;
> +	return err;
> +
> +err_release_queue:
> +	xe_exec_queue_put(m->q);
> +
> +err_out:
> +	xe_vm_close_and_put(vm);
> +	return err;
> +
>  }
>  
>  static u64 max_mem_transfer_per_pass(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 3758f9615484..e81ea6b27fb5 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -105,7 +105,7 @@ struct xe_migrate_pt_update {
>  };
>  
>  struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
> -struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
> +int xe_migrate_init(struct xe_migrate *m);
>  
>  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>  				     unsigned long npages,
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index af43e04179aa..bf9fa1238462 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -270,11 +270,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  		ctx = &tile->sriov.vf.ccs[ctx_id];
>  		ctx->ctx_id = ctx_id;
>  
> -		migrate = xe_migrate_init(tile);
> +		migrate = xe_migrate_alloc(tile);
>  		if (IS_ERR(migrate)) {
>  			err = PTR_ERR(migrate);
>  			goto err_ret;
>  		}
> +
> +		err = xe_migrate_init(migrate);
> +		if (err)
> +			goto err_ret;
> +
>  		ctx->migrate = migrate;
>  
>  		err = alloc_bb_pool(tile, ctx);
> -- 
> 2.43.0
> 

-- 
