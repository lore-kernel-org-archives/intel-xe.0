Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFAAC3ABC9
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 23:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D80E10E218;
	Tue, 13 May 2025 23:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UkYTHDmP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDD110E218
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 23:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747178173; x=1778714173;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sPQ0Jfl4pMkXYPZsFf/Y4q1tUGZU7FqZM28HBxPVIjs=;
 b=UkYTHDmPTuj28RBcokDPby6wi4zG7d+r8F4+BiiM0f+uu8R5bUe5N5AK
 20aInuVDBRIbZZTLY4wHp5PCefEOkv6D0qmbq7VBJI2L5b8n8+AABVSiU
 YZn+6VOl4w1K9Fr5lzOGHHG8Zpxu42PfETNwUzxb0fweud5NFQsdXdFH2
 v3GIzr3AP7WRorphwz7C0YHxEEcIhZ0AMHKcvJHXzxcpubzCAY70q6Gzv
 JU5o+o7Wvu/Z80jtbDj4lOdWNsr9cauVQ/Mj0MYZpVEJXCnRcOy9hx498
 tL5+v+x3a52XfEUUBds7BTvYlZV/cfZNZ62lNnEEyikhWv+pdtiih/50e w==;
X-CSE-ConnectionGUID: 7xB5sMy7RhelBDsHaRMz/w==
X-CSE-MsgGUID: flnX9YfzS/egmwLhJ1Z56w==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49198365"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="49198365"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 16:16:12 -0700
X-CSE-ConnectionGUID: Kth1I5h8TZe9Ah+IU3M+sA==
X-CSE-MsgGUID: 6nLqJlpnQG6Ev5DbC2SXUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="174974516"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 16:16:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 16:16:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 16:16:11 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 16:16:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMR3QNuq59YpE89/mDf9dJKk+0+IzSXt4/pRG2IlKLAiKcbDEJfHxBwSJBaFYovUDfDdqufFT8Ti046UDyE84s+fxuBqhsCXiL5IkzNe6iDGMzYLBwupC/M16xPnR+XdbSO4MQi9wP4da6lszfWE0iVWQ9cTrLn66StYzecdwdiebj1p3ZPXyXuTkZC27m82oH08WenZ/c7P+7v1DS7WxHtzqA7PXCQTTsplj+3FhrAmMseof9NcgWCbfyLqpEkm+/NNmO4+kd7uCzHqMz4O62Z3uI9IeqntsB0j6BH4+BZOnizBumuLMzQR9TkM+ScsUhHfo24aRGvizV95Wry8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hC5Dcf2qZTSbNTyEiJqXoA7ee4OBSA8jcRFqx5652pM=;
 b=p7Hgi4WCFX4LRaLalZRUufEBF4E4aLnQ5nSGMxR5XtXhotfBbTCKKU/U9UZs1JFNQRt8yeDVrcqM6BsFAVjDkHgbDJdMuFGkzxNNAh2mmE4POZ2h6XhUryGB2x6FBZJH48Z/uE1t9LyUUV8ny6GAmI3ON4tpIMqjhDUDp1UA064KPffE7ANyjyCGG0ooMinxqx4ZEpVtUM1BnyU3ZnumXj2BrixWya1ibYLHtD6qbJpdUESjmD2QX1D4OLrE47i0UOG1JIugRFbRBFfqGPKgQ2ni7Wp8VNLYmJsYIO8GGFVkJB8jvGcQRQFFowd9+shQ41kWXR6qs3Z6aTJXMFmZ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by DM6PR11MB4516.namprd11.prod.outlook.com (2603:10b6:5:2a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 23:16:09 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 23:16:08 +0000
Message-ID: <de2c653a-5153-4432-a177-960bcd731d83@intel.com>
Date: Wed, 14 May 2025 01:16:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/vf: Fail migration recovery if fixups needed
 but platform not supported
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
References: <20250512230614.571026-1-tomasz.lis@intel.com>
 <454bf5c7-1d8e-42ba-9443-e7d7f61cc421@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <454bf5c7-1d8e-42ba-9443-e7d7f61cc421@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR03CA0043.eurprd03.prod.outlook.com
 (2603:10a6:803:50::14) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|DM6PR11MB4516:EE_
X-MS-Office365-Filtering-Correlation-Id: 1726c080-ca19-49ee-4085-08dd9274245a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHhWam40Sk4xTWwyQUlJN0RjbnVkb084R25aVmNqOFhhdThZU2FkME5MVXBS?=
 =?utf-8?B?Vy9sY3BpS3B4UjVYMHVBbFJ2M2xiSjBQRlExRE5hK2QwV2FKSk15cmNjR3Jk?=
 =?utf-8?B?MGEwVVM4ZGl5aTd1TnI5UzUrVytGNjVZNVl3Mm9vMzdxN0M5ZUNwTW4yMWVN?=
 =?utf-8?B?V0EvYmlnVVBXTWVFN2lneU5zN3NDMU9ZVGVyRllSaFdrT3p5aDNvaXBnNjBI?=
 =?utf-8?B?ZldJR0FEbXBGZkNTRmtZOWpGUFd3aVBOVWd1Rkx1QVcrc1FCcGdjaytONXVa?=
 =?utf-8?B?Q3ZRRWFoS1lHNWJiazhtZ0dKYUhJSERzemtqY052dXFZbWIzZ0ZQeWlPYVkw?=
 =?utf-8?B?aUU5TlhBMGF5SXEyd09RQzdiRjZrU1g4cUY2WXJxRjUxd1o0YzRLUmhXanZH?=
 =?utf-8?B?U245MVNtYVVWYTdrbnBmK2ljYnRTV2FhNER4UllBclNEemNuQmhtMUw0a3NY?=
 =?utf-8?B?MWxXNW44L1A3YUcvZkFCTTBseWNlVVpBVGVYVkRUU3hyaUxLVUtGWHQ3UVdI?=
 =?utf-8?B?SFJTbWNvZUpUTWhnc1VtMkVGSW1wMFFZR1RiQTBuQ08wTXNBNElIQnAzdlhB?=
 =?utf-8?B?ZlFZdSt4c256WUlDZ1dyaXIzNW5GZXlYSVg5NEFRazNnSjFuRmFhRDduSUl2?=
 =?utf-8?B?cG5rMFBJNlk1YndkNUg1L2NkdjEvN2ZVcnpVUXMzMjViVDMvZUQ5YTN6Kzk5?=
 =?utf-8?B?OWdvL1ZPMC9PQjdKOXNkZXdlcGhLcnVaeEFsNjdubkJ5ZlBLRk1JNlV6UCtZ?=
 =?utf-8?B?UjFTVnJRTWtsbHlOVjZFZTl5TlorT0xUeXYwV1ZJd1ByMnIyMkc0ckRyZ3pQ?=
 =?utf-8?B?VHA1TEM1UnVKbGFEUW5oVFV1Qk5rYkJuWWprVUpRT0E3am5WNSsrSlM1REQx?=
 =?utf-8?B?TGJyR3BwK2RHeVA3WVk1YXFDRzJxMnpHd2dZcDlPNDV0bnRiY1NNU1lZbmNs?=
 =?utf-8?B?blNpeW9BdE9kcnlVMXF3d0pCeFU5a1I5WVBPTVdIWEY1TFZVN08xTThqUm12?=
 =?utf-8?B?U001ZHNiYkxlZWw3UVVVOEQyVEtRTVpvQmZFOGx4OHBRbXN0bHBrZVRFV1BQ?=
 =?utf-8?B?c0pWZmg0YTUrOXg1bS9tOFlOaE9FdFdzeXozVGhtRUZUSVFZUitnTVBhRDZS?=
 =?utf-8?B?eUFhSnk1aDl2T2E1K0I1NnZKTzl5enZibVpza1o5UGdUZWNsTGlUQjdVdkdp?=
 =?utf-8?B?VVA1UEVZeXVsUENZWHBZeWt4SlIrSFNKcDkyZXI1RFFvdlg4RjIzd0NIU0Q2?=
 =?utf-8?B?M0ZRbG1pMXZuZzNZQlNwZVc1UUpuVFJHbHF1ZUo5bVQvREtCWjJjWTJNM29t?=
 =?utf-8?B?bjRpSXpQbWJnc0U1Y2Z4M3Jnb3U1MDYrRENkbi83WlhWSVduNWgxTE5qZ3Zh?=
 =?utf-8?B?NWcyVnhDd2FUVjN2alI2NFBjRGR6M2paNnZvZFJBa0JmY3U5ckpHbnBMOFVy?=
 =?utf-8?B?ZVVNaE1rMTJIMGwzcGNkdVlWRmJnTFlibU90a2czbDNpSytlSU40a0dtRTNo?=
 =?utf-8?B?RGswSWxaUU82UnBXOEJUSStIY2ZlN0FUQU5TNndvYTdoY0luYXVuWnllT1lm?=
 =?utf-8?B?NXFFd29ieGc0L040bkZUenQvTFlxNmtoUVdVeFFLclczanNTd1U1MnZRdS9D?=
 =?utf-8?B?Q0o5TGJubDByTllPcVliblQ3ZlNJcUxsdk5YMlE0dW16a0ZucnVWV1BWVEx6?=
 =?utf-8?B?Y0s0OXA5NkhXUDNCMWFwVWNnckxGSmE1QUdJVUZnTm5iTndMWVo4bWRjUS8w?=
 =?utf-8?B?SnhFdnZheDBsWWYzMXErNkhJTFNBR1RtWVRBdFhHM210VHFSOVQwMjR5ZTR1?=
 =?utf-8?B?b3hsS2VlL3F4V041Q0JpRldoeXFmcWEzVzJ2RTRkVGd0R1lzalNIVk9VUFQ1?=
 =?utf-8?B?ZS9XcUoxaGxrTERYSURaZVYzTmRRWHVmd3pwVW1UTzdGbHFXOVoxT1prRjk0?=
 =?utf-8?Q?0h6HP6wgZoo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTNHR28wSHhxQ2FKTFh1cVhMeWU3bWdna2krT2p3em9GZnRFYnI3YUh2UXZu?=
 =?utf-8?B?RHAyUGYvVDFzRUtSWEdIczFUK2hjSEFQVkhvL3pGWW94YnRqY0F2YzUwTDNx?=
 =?utf-8?B?alZEVk1sU0lDL0NWYktlK0xUYlZnMWZwaGptZFpYdVpIVXMyOHV1NW0xMlJq?=
 =?utf-8?B?dkpsQ2Y2NnZpVmtyM2lSUDRuTFZOc2JEdDh1OWR6dHdoZ2VuQm9RWnVBMnZt?=
 =?utf-8?B?VGk0bGZmcE8vUXdNRGVqZnZCa3dJNkxlVy8yRXBDRzJyU0tzWFhHK2ZMMU1h?=
 =?utf-8?B?bVh4MkhCZXJhWk9ycE9TVU96VWt2bWJDQldXclFBQ2dVcmRCejFVcGtJQTdX?=
 =?utf-8?B?bTBydkdwaGdZamlqOWZTVjM5YnlVSWVkRHNDWjJ1Z0VmVFM3OEZuQnRIWG1p?=
 =?utf-8?B?bjdVUERtSXB2OVBDSE55NXVza21WdkUrWG1yeGl0WXlJZTVwKzFvcTBndkJs?=
 =?utf-8?B?TWlRSDZHREJEbVlvRVY0Wmpkb3ExWEpqdGRyTE9KRUVIdktnNktla0RZcVFW?=
 =?utf-8?B?Y2lzRHhZL2drOGI2NUR1NnNEeUd4YkpScXVrTXRRa3NBZjIwTzdoakNQRlg2?=
 =?utf-8?B?aGlva2dYS2NSOGJqQWpydnpFbkk2VDBMcDlVcFJoZ3pnTzBWVHJ1MFlVTzk0?=
 =?utf-8?B?V0VzcldSekplWWpnbTI0emtqTDl2VGd2Q0RHSFJuQ1FPWmkrSDB3NTB5UXlt?=
 =?utf-8?B?UUJGKzVvbXljK3gvVzlRc1J0OGFXdzBkMytIeDZac0tiVnVnWVRFM2czdTlP?=
 =?utf-8?B?aXdRd2hUUVVmVit2Q1RRa2hncmZTMEI4SHRSRTJzNDlodU5XWDg3MUF4ZGJz?=
 =?utf-8?B?dnRjR3BvSUxZUzhtblNCZWcyUDZhQ2pBcndrNWQ0MTZHNnRUa09FMHFLWVF2?=
 =?utf-8?B?WGR0VlREOS8rRDV1Z3RxWmE3VCtTb05TeHE3c3FZcDVoNDN5YkRLV05NY20w?=
 =?utf-8?B?bjdVcVh2elpzem1yNUQ0ZEtrckUrWU5kVmYrMm03elBOTVRscGlQRTZMVlNp?=
 =?utf-8?B?cVZlMFY5OWVrOUd3cG9kanFNbi8vNW5BbjVWMzhDYm5rN0V2TlFkL1daZktX?=
 =?utf-8?B?TWptQThLbmdYYng5MURsNGZFazVIK1JFdGVQQXNXTFJuQVZVSXdpL3RVUEt2?=
 =?utf-8?B?RnBONVl3VlRPVmk1bENwdFlrNksvYUk1UHJSTkYyc3g0UnpFTytQVFVWYjRW?=
 =?utf-8?B?TGNQK3J5OVcrYTJlSXM4aW9lZDJmajFDSDM5L2h3RStHYk9RVkY5a0Y0aDhk?=
 =?utf-8?B?TVFjcmoxMnFIUk1JeXZTOE81Wng4aGVLcUgvNjZnWWc2OUNaWDAreE02K1VL?=
 =?utf-8?B?a1BwSDBKQWVmVDV1RzlmdGZndFNSUCt6WVNYMGZCYUZSeXZEQjlGQ2NPYXJw?=
 =?utf-8?B?TWxsZ2tRcFkzNEduVUt6dktac3pDYWU2QitkVkhWaFRJTzhJNS9aKzlXUU9r?=
 =?utf-8?B?cXJoczhtRDF3RHdVY29KTU1ReUJXWjh2eWJUQlZNN0pTZVhRV2MvbmFVZk0w?=
 =?utf-8?B?SmhrRVlhT1RTKzVvZjNCMi9MK3dreXRtU0RCWEw1WGtMbE9uMU51ZEk1U3hG?=
 =?utf-8?B?YnVHeGg5Wkt6ODEweCtZQkhBMDJEeFhMYStLWFlmUlFUM21ZdStYdkZ5YUhF?=
 =?utf-8?B?NlB3ZTloT3kweDJpekR2ejBJS0loWWlnSEUramZFa0gzUllralo5OElzbFgx?=
 =?utf-8?B?ckhEaTZXZXJsMTFyeEw2VUJWdkxZVmFvSm5yemV3WEd5R3dJczA5clppNUtu?=
 =?utf-8?B?Vml2ZFJjNjBzdG1CbSsrdTM5Mzd0eTQ0Y1FHYU53OEhkaW1ScUg5c0pMRVg2?=
 =?utf-8?B?RHVPd1J0YmlWWEhYZS9zc2JSRzBWYkY4bkdQQTd5YlIzYzVSQy9oekVybkJE?=
 =?utf-8?B?VldPS1hCVzNmcURoZ2FPMElFcFZObjlTZE9KNFNHemdQVnV6ZG9scVpUdGx2?=
 =?utf-8?B?OGM0TzJSa2xEZHZKd3c4UWJ3cUw3dkQ1NHArT1pHcHFFNFBZYWJkNk9vQTUr?=
 =?utf-8?B?eWVXcHVHdE94Q0s2N3dUZk1GQ0NiYmpVdkVjZ1JOeDFwQmRyQlB5Z2VjTzhn?=
 =?utf-8?B?UjV3Q0l0djJabVl2UmFOMUZzaW5xZmtUcjRaQ213ejVmWkZTaHlqRmFTcHph?=
 =?utf-8?Q?bIqKUrKxfbbIoGYPRTTCEx2vq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1726c080-ca19-49ee-4085-08dd9274245a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 23:16:08.3484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s2is/j/eDnX0pE+AMShDQbt9lsrnhUcSpnrLEXygRcABN2ItIJ7Z+Jro0h+r8MMR7GohKOa8l9EA7vPCrwnbZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4516
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


On 13.05.2025 13:21, Michal Wajdeczko wrote:
>
> On 13.05.2025 01:06, Tomasz Lis wrote:
>> The post-migration recovery needs to be fully implemented for a
>> specific platform in order to make continuation of workloads
>> possible.
>>
>> New platforms introduce changes which affect the recovery procedure,
>> and without a clear verification of support this leads to errors
>> with no straight forward error message explaining the cause.
>>
>> This patch fixes that issue - it introduces a message to be logged
>> when the current driver is known to not support the current platform.
>>
>> Wedging the driver immediately also decreases the amount of
>> additional errors which would come afterwards if the driver continued
>> operation.
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sriov_vf.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 2674fa948fda..f21f98f5d25f 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -224,6 +224,11 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
>>   	drm_dbg(&xe->drm, "another recovery imminent, skipping notifications\n");
>>   }
>>   
>> +static bool fixups_supported(struct xe_device *xe)
>> +{
> can we have some TODO comment here explaining what conditions we expect
> to be added here? or maybe we can start with CONFIG_XE_DEBUG to indicate
> early development phase?
do you mean `return IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV);`?
>> +	return false;
>> +}
>> +
>>   static void vf_post_migration_recovery(struct xe_device *xe)
>>   {
>>   	bool need_fixups;
>> @@ -243,6 +248,11 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   		vf_post_migration_fixup_ctb(xe);
>>   
>>   	vf_post_migration_notify_resfix_done(xe);
>> +	if (need_fixups && !fixups_supported(xe)) {
>> +		drm_err(&xe->drm, "migration recovery not supported by this module version\n");
> we already have drm_err in the fail: section, do we need this extra one?
The idea behind introducing this error is to inform the user 
specifically that the module version used has no support of VF 
migration. We do need it, it's the point.
> if yes, can we make the message more specific
What specific information do you think should be conveyed there?
>   (and maybe the reason
> should be printed in fixups_supported() as for now it's all magic)

I was planning that function as a conditions check function, not 
decision function. Such functions typically just do the checks and 
return the result.

What's the concept you have?

> also, since support likely will not change between one migration and the
> other, maybe it should be just a single drm_info() message printed
> during a VF boot that any later migration will fail, without waiting
> until the first migration happen to surprise the user

The idea is to make sure user sees the message after fail - and he will 
first search for error message.

We've settled on providing the information when the issue happened; we 
can re-evaluate that if you think it's not the right call.

>> +		err = -ENOTRECOVERABLE;
>> +		goto fail;
>> +	}
> hmm, and this whole chunk seems to be placed in a wrong place - if
> fixups are not supported, why did we attempt to fixup CTB few lines
> above

My idea was to allow testing the existing recovery even if it's incomplete.

But it doesn't matter to me - can change if no fixups at all is better 
for whatever reason.

>   and claim that fixups are done? can you please explain

we never claim that to the user. We only take GuC out of RESFIX state.

As stated above, I have no problem with shifting the verification to 
earlier, it does not matter.

-Tomasz

>>   	xe_pm_runtime_put(xe);
>>   	drm_notice(&xe->drm, "migration recovery ended\n");
>>   	return;
