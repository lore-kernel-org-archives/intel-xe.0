Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9498C369BD
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 22:09:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C96410E395;
	Tue, 15 Apr 2025 22:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DRikQ7Tw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAA610E395
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 22:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744754966; x=1776290966;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HKejUX5LpxVhWAUdhQc5tsDIl5JSU7s4qAFcFNXRE6k=;
 b=DRikQ7TwZcKkCvnpMgF4IfXUkfDELJPvTZq7sQfspnAcBMD/9r5kuLSL
 0wXRoGEEDBysbvCsJn9DY/yjuDAVqskXY4RZ2OUZ9qnSZrwqO8tGPsFaV
 QMwFUb+TDO3jJcN/P+a+fKqcHjCnVkG8Op7ouZMjO4PXVFQr3p6r3xtDr
 n8OWtt7cPfrBcs2h5bqBkvsv6iBE1DzOKHm2GJAr8aAy5NRF3hfp/m9Yn
 gcQ4t9gm/BDBQ8WwOr+z107gjZhGLAzM2r1QiV9QfK+k8vO5s/QPaGOft
 1nibwHYeK9LNMZE79i8Pob6skf5/4YDatnFHcgGerw1BupHI56NFsyKlE A==;
X-CSE-ConnectionGUID: f6Q+WrLSSpqllxOwugRJgA==
X-CSE-MsgGUID: XE/aZOUPTLiL2wbunA4qkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="68777652"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="68777652"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 15:09:23 -0700
X-CSE-ConnectionGUID: F9+Hi71NTEuFjd61maZ6yw==
X-CSE-MsgGUID: Z2Z7bM1JR/GnQJEEKgU4iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="131152796"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 15:09:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 15:09:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 15:09:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 15:09:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RiouDffmckpnsXoJUCzBV8iGYAJNdl2Y8kseUQkGEno2dhh0bNPpSi9qejq90TZdRHuNPzsF5d5qoM0OGUpIoHUIF7TExYCVFNaLBNBe64G0gZNryrqD9lFyXvdd5F5aJ4QTX9ZpsUI3p2Fnm7p0lT1RzjvM4UhRHS11/whovAVzyKhKDby9mqxmpek/1z6DMBFiG6lyguc/WLq3HNOfvlRcL3b88Rnd2L7avibb7pWMxtuPGHkIG0tCtt7XmAHQEW/iWyUGXOoAQl5QZWrbqYtmafDludLfDZL12+JpxXg3OaFZnBPZU44HddRQssHX/rifdB7y1k6epsgRqwwuRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bwXsnmmNvQBB/P6mXaM7G9ynWKmr4BfD5447GzViUE=;
 b=u6WR96NrVZB2xNzGKl/iA5BCqwPUkd8MRMWIHJLNdWGCS7r6PEZO0LUfnHbmiEuBW1CQZYjyPxuskjlDGccAeNo0xOunLldJ0+AgtgA+4ZxxrK1Jt96dTWnoG7zsT+KC7elQGxu34m2S3qgsNGMvhJg8T/xN7j76xqS6C3vKNGMHna9vhKgUrcK10DUG5mWe+4Qb59cHXzqC/9O/tvrpQHt5P7IMCdcjta4/6B3gDJiFspXT73dt0w4G3ksc7iIZH8FUrnvzRniS0gtgayJ3Zk0mAKnYclEUH2KegGnYz3ZTfVuK+eZKn/5AshL/S85QaCFKXwfxzGW0MVX4a/gEQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by DS7PR11MB7906.namprd11.prod.outlook.com (2603:10b6:8:ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 22:08:45 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%4]) with mapi id 15.20.8606.033; Tue, 15 Apr 2025
 22:08:45 +0000
Message-ID: <ba46fae2-8b67-4c49-ad50-90a3728df547@intel.com>
Date: Wed, 16 Apr 2025 00:08:40 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v9 4/4] drm/xe/vf: Fixup CTB send buffer messages after
 migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250411203626.3272415-1-tomasz.lis@intel.com>
 <20250411203626.3272415-5-tomasz.lis@intel.com>
 <9a86588a-3c2d-4748-9a71-3ae7791b9d95@intel.com>
Content-Language: en-US
In-Reply-To: <9a86588a-3c2d-4748-9a71-3ae7791b9d95@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0032.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::21) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|DS7PR11MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e1e26b9-6710-4abb-5895-08dd7c6a1702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXkwdVIvUDluNmZrcVduQWhMOE5DaUJXeGkrNmhnQzRlTHordmp5eGwraEtB?=
 =?utf-8?B?bC9hWUNqU0lWTWhXeWtaOU8wc0xKSGI2MFhhVVVyeHEybWt0cDIyN0k3OGhY?=
 =?utf-8?B?MHRXdVFJOW1URzVCTDhjUDRZUmpiR0ZQYlV6cnRTVFhaUXdkNjRQMUV6T1BI?=
 =?utf-8?B?dG94MXF3THVYcnFqdTBuQlpYYmJBQWI3aFhYa21LUzFmL05lWmd0RVM0Nnp4?=
 =?utf-8?B?ZVY0VVBtaXB1R0FzSEJEdWhKd3hvdFZuZTRwVGhPczNNMG5uNUFQV0Rvb3BG?=
 =?utf-8?B?clg5d1BRc0ZDY1pCK0pkeFRVbWlrMTdqandmZ2lCaDhSclluVCtYWkRjYXQ3?=
 =?utf-8?B?dkFSRXFNY2p0Vjc4dXV3VmJaWERWQ0gvOUpNSldLbEFFb2hneHNCcDZzelNv?=
 =?utf-8?B?MHFsbnI4clBleHFkUS83YVIwSmlZMHRNL0RBN243WXVnd0x4c0RNUloxbmtB?=
 =?utf-8?B?UmtLc3R4Z0dDN2V3aGpEZDZGbEhManJKY3FLLzlpelRiS0tQQWRPOFRpd0Mr?=
 =?utf-8?B?RlI2NnREYVUwQytWdS84VjkzclNUMnlXaHpBSGV3YjhuSVhKZkE3S2MwMEQ3?=
 =?utf-8?B?YXZraXRBUVgvK25LR2dlNUIyOE5SVFZvL3ZHVlkrcXdBVzRkNFZOREN2ZzI1?=
 =?utf-8?B?NFIyNjF3bWVZODVFUSt0d1FqMFQ5emFlTDR0Yit1VUhyeTF6MElUNW53OGZC?=
 =?utf-8?B?RWVrSmFjdHR5ZmlIZG5nNWdzc0hJbmR5bHZzRkxBRzlPSWZNMVJaZ0RyMHZH?=
 =?utf-8?B?Z0FSRXQvUllaUEkraE5pczh1dUhVa2N6a3pYWEZuYlV1K20xSGpJR2UyVjBk?=
 =?utf-8?B?aWpMTWtqR21iK2hUcXo2c3BtMmVQOTByd09oUjl3YUdWWVVnUGFoaXovOEZr?=
 =?utf-8?B?N0RBM1IzMmswUDArRjNBNWEwaTR4S2l3Y2x0S1NXNlhxMmcwdFRpUVBOajdo?=
 =?utf-8?B?QXNudDg3RVlZa0JtSVA2YU84TjZrbk1UR3VaLzlsa01pMm4yR0NQLzJQVWUy?=
 =?utf-8?B?Y0UwbXRRR0FObFdWcXJ5TDFNUzNzSVVnZWFZakdUNnR1KzMvVGYzcEpLRlUz?=
 =?utf-8?B?ZzEvanhLaVdkeDNMQTU1ZW9SdHhkZC9WSG5ZYTFWaVhoUjlzL2grZ2Voc1Ey?=
 =?utf-8?B?UmJlR3RUS2kxREE2K2xmUkhDeHh0dTVnaU5WenlZSkVyRmxBZDRZYjVmQUN0?=
 =?utf-8?B?QVpRTVZwUTdaV0lKUkZkdjhjMFNaSGdDdHdyWjM0RzVvU2VzdWVWZmRmdTFG?=
 =?utf-8?B?M0VQZWJybGxKQithY3dLb2g1UHQrVWlxUlRhZTFtQzZZMjRiL3J4YWpoL0Vp?=
 =?utf-8?B?aTBkMEJCWEtiSVJUOE9UNjVDZnNyaXVrdjMySEtycUowaTN6OTcxRnNERnNN?=
 =?utf-8?B?OVkxYmhrQ3diNXNpelZzQnN1L0RWcnZqcVFrOGo1QVZ4S3pCQ05UWmRXcHRh?=
 =?utf-8?B?QjNicm1oMGk5SzZSMDBYY2QzN0c0NE1oWTNPYXVTU2IyK3hVNHBsSFo3RExz?=
 =?utf-8?B?VXcyd0hDQUVCN3VEWThTdmhRc0txQ2twK1d0SnJxdU1VOHNXeDNQdlE1NHU1?=
 =?utf-8?B?aTRyZnRyV0w3RVoraHdxYjNVSmc5TzErVGhYMVNWOXFuWnhibDBTMGJpbmhH?=
 =?utf-8?B?QVdIL3U2Y3hTZnlWTUdWamR5MHg5MmIrQ0RGamJkVXpydTEwZjNUbmpac2pn?=
 =?utf-8?B?Znh3Qk1QbU5Zcjh2akhPNXV4M2dxOE9VQmcwMndyMmlLY25wN2xtSjVPQTRM?=
 =?utf-8?B?QzNsYTNqOFVjbi82VlllY3dDRUIvWnl6RFFlMGR5emJ6MERTYS8vY3UwZDJM?=
 =?utf-8?B?dEZXN2Z3cHdCL1ZzSEVoSFJZU1UwMUZLdkg5V3R3UEViL29ER29JZVdIamNs?=
 =?utf-8?B?bHBJSmJLSGpmT1lMMEVVZFRIZXNNaSt6OXYzQm4ramU2Smo1WVJSWkpuSzE4?=
 =?utf-8?Q?K2MdNpnJw3w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFBIV1JRWXRMNlk4SXd5d3J5UmprcWMvdHdDeEJ1ay9nZmNuQUlyWGc2MHdI?=
 =?utf-8?B?TkxNZTJDYkRBYUsrVEF0QU00dlcyN0xSd3ZDaWdnK1Nnd05FbzE0SU0wWE9J?=
 =?utf-8?B?VThZb0hmUTlzbTVIT0kveTBZMGo2QUVUOFIxR2RVSEo0dHZqeWZYbU51Ymtj?=
 =?utf-8?B?bjQ2UEdrdHBWQ1FuMU4xTUE3R1RJUkRNWVNOYUdtdGg0ZXozZ1F1K0pHSkRa?=
 =?utf-8?B?R0VlajJXeGZrVTRBWmJ3R2IvdysxYVRZR2tHTEJuWGFHekdXUW5oV2NHT1d0?=
 =?utf-8?B?Z01LanFCWXJzRlBIUEo4RHZNdWozNHFWMXRQWHFqTXR2YUlVZEhXUlFCcUw2?=
 =?utf-8?B?a1lxQllYdXNLY1pxY2FZVDRHbW1rdW5ycFh5K2huL0FpZGhWT2crR3lSaEps?=
 =?utf-8?B?VmdwK0ZOOXpSSmZZZXJZZlgvNGVtYklzOHIybEN6Y1kySEZZYXFyOVhtS2Vm?=
 =?utf-8?B?YWt1UXI1UWExNzIwVWlUTHpxZHYwcll4WWJBaEs2bzZnTExzRWdXTTVZSHVs?=
 =?utf-8?B?OGtkTCtVN0p5enhuM2VjK3lCMnYxVEtOSTZsNkNzSStNZ2JLRzlmVWVsRjRU?=
 =?utf-8?B?WHNiK0F5aksyekJnWUhxNDNBMEpWWTEyaEViMGE3Ni9tTENQamVCR3o4TVc0?=
 =?utf-8?B?QmI0MEdkaGsvakF5SEUyY1VZbFBsYmVWbEh0RHNaK1QvanlBZlpTRHpMRTR2?=
 =?utf-8?B?Nm9XRVhkRHRxRUdWMERRNUhJNS83U2dURlJKajNiZXMxSnBPSDBLVVJwa0JI?=
 =?utf-8?B?c1hlODZmNEkyRHphTURwUS9vV3IwSUhJU28yR3ZXK1BWcTdtbFR3NDdNdDBx?=
 =?utf-8?B?d0J2NWFXQmdieng2cm9jeTdyOW1MSmZPdllxRnRNZWFyYlN5dlZiMHZMU1kx?=
 =?utf-8?B?RDhjMGlaZ1NKS3g2SlJvMkZvWU9HQXFSRjRDSDJNUzlkT1FVUWFOY296QnFX?=
 =?utf-8?B?VGJJT0t4NHBvbENRTFFwUUZBMHhrcnVvZ3FlbkMvaUp2cEVzUGFUZ1N2VDMv?=
 =?utf-8?B?NkZFN2ppSXc0Tk9tU25DSzRXY0s3eDhIMDVsd2hzRkdsanZGU1hDMUhlQXlz?=
 =?utf-8?B?d3BaTG5rMGdiM0JOVVhlRkxRcmZ5L21Rb0VVQU5RQkdZSzRGUHU0UWhYWFl2?=
 =?utf-8?B?L3FORzZJd21rclF4WlltNWFEdGdrNFVVenN1WFZKemlxVnlBWmxKNEJ2dkNx?=
 =?utf-8?B?bTZWZmxBanMwVkkxem5lbm91dlBRKzJBRXFnMElNUytoa3ZwRnhHM0xmMWt2?=
 =?utf-8?B?MWJCVnk3bGN4N1hMQkRxT1E3MGxNcVhLRC9JZHJ6L3RIVWN1WEhtSVZrWkFr?=
 =?utf-8?B?RlVTUkNoUHlEZEFlYkU4cVA3SGc4eVg3TitzMm9JcUViVnBtcjhRQVhIYm1C?=
 =?utf-8?B?WStiZTM5ZkcvTTg3SHE1STJXNURGTEFmNmEyckFUTnR3VVZkTkVDZzZ4M3No?=
 =?utf-8?B?UWZyUTFBZE4zTWdhYlFzdk4wdzdPUnd4em5ROE1KUWhzTm5uR2tTUjdBZmtG?=
 =?utf-8?B?dms0UUVCcFdHU2RGL0VKODNUci91eHlpb0trQWNKblRJYlNmc3g1TXJpQ2JF?=
 =?utf-8?B?VjdtSDBqSzBlRGVhZDhBWkZPZEZQZFR5VkFIMXZyNnlEY0Zjc0c4M0MwNWU2?=
 =?utf-8?B?TFkvUm1VT2NZRU9SOHFZZnZJV1ZWVXZuWEtjOTRNTE5FN0hLL1Z2MjNhNWJN?=
 =?utf-8?B?ZENZUDBkekV3OUJPUnBaV1c3MGVqR243eG1Fa0tuQ29mYWd4VGlJaTFoYkhK?=
 =?utf-8?B?SHMrN2MweG9Pdk1UdnI0MCtRR0JzR2RkUEo4SG1MTStHbm91NUlGNkk3bEtr?=
 =?utf-8?B?WlZTTlEwaE9ndmwyKy9zcC9Ic1owN0NEV0pBTXJGTSt2aWpEdzc5bDNMV2hy?=
 =?utf-8?B?bmNKOTQvSENDeXVlVEZzd0tZaUpyQXYvYStQWVdQYW5aaUxKc0RQaERHVDhO?=
 =?utf-8?B?YkRmRDRCUGlNay9QNjFhZFc4ZWZya2F2RERrdUdhKzZlU3FyS3lwU21hNGhO?=
 =?utf-8?B?MXgrTk1XeDYxM25FSFZ6U05ZNjhlREZGRHZJZzJnWmdCZ0Rac3dvSjVxN1Q4?=
 =?utf-8?B?bysrTFFZM284RDFBNmR0MnRoUThjVyt6Uys0dUx3V0RGcVR5OU5pNkdoZ2Zv?=
 =?utf-8?Q?Rbska+T2y5Jf9J9RSDXcMJa5/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1e26b9-6710-4abb-5895-08dd7c6a1702
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 22:08:45.4127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0WmnXu8IeYgcgsKoVcx45q+aYHB+KsxROGTD0TSI0hPEbz5yULEtk8+bpN3zCMoxn7iyLbROCdhjtLW4HdTcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7906
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


On 14.04.2025 11:39, Michal Wajdeczko wrote:
> On 11.04.2025 22:36, Tomasz Lis wrote:
>> During post-migration recovery of a VF, it is necessary to update
>> GGTT references included in messages which are going to be sent
>> to GuC. GuC will start consuming messages after VF KMD will inform
>> it about fixups being done; before that, the VF KMD is expected
>> to update any H2G messages which are already in send buffer but
>> were not consumed by GuC.
>>
>> Only a small subset of messages allowed for VFs have GGTT references
>> in them. This patch adds the functionality to parse the CTB send
>> ring buffer and shift addresses contained within.
>>
>> While fixing the CTB content, ct->lock is not taken. This means
>> the only barrier taken remains GGTT address lock - which is ok,
>> because only requests with GGTT addresses matter, but it also means
>> tail changes can happen during the CTB fixups execution (which may
>> be ignored as any new messages will not have anything to fix).
>>
>> The GGTT address locking will be introduced in a future series.
>>
>> v2: removed storing shift as that's now done in VMA nodes patch;
>>    macros to inlines; warns to asserts; log messages fixes (Michal)
>> v3: removed inline keywords, enums for offsets in CTB messages,
>>    less error messages, if return unused then made functs void (Michal)
>> v4: update the cached head before starting fixups
>> v5: removed/updated comments, wrapped lines, converted assert into
>>    error, enums for offsets to separate patch, reused xe_map_rd
>> v6: define xe_map_*_array() macros, support CTB wrap which divides
>>    a message, updated comments, moved one function to an earlier patch
>> v7: renamed few functions, wider use on previously introduced helper,
>>    separate cases in parsing messges, documented a static funct
>> v8: Introduced more helpers, fixed coding style mistakes
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c   | 174 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_ct.h   |   2 +
>>   drivers/gpu/drm/xe/xe_map.h      |  12 +++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c |  18 ++++
>>   4 files changed, 206 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 0a4fef7d7225..cff524d21d46 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -84,6 +84,8 @@ struct g2h_fence {
>>   	bool done;
>>   };
>>   
>> +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>> +
>>   static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>>   {
>>   	g2h_fence->response_buffer = response_buffer;
>> @@ -1623,6 +1625,178 @@ static void g2h_worker_func(struct work_struct *w)
>>   	receive_g2h(ct);
>>   }
>>   
>> +static u32 xe_map_rd_ring_u32(struct xe_device *xe, struct iosys_map *map,
>> +			      u32 idx, u32 size)
>> +{
>> +	return xe_map_rd_array_u32(xe, map, idx % size);
>> +}
>> +
>> +static void xe_map_wr_ring_u32(struct xe_device *xe, struct iosys_map *map,
>> +			       u32 idx, u32 size, u32 val)
>> +{
>> +	xe_map_wr_array_u32(xe, map, idx % size, val);
>> +}
> another two candidates to be promoted to xe_map.h
ok
>> +
>> +static void xe_fixup_u64_in_cmds(struct xe_device *xe, struct iosys_map *cmds,
>> +				 u32 size, u32 idx, s64 shift)
>> +{
>> +	u32 hi, lo;
>> +	u64 offset;
>> +
>> +	lo = xe_map_rd_ring_u32(xe, cmds, idx, size);
>> +	hi = xe_map_rd_ring_u32(xe, cmds, idx + 1, size);
>> +	offset = make_u64(hi, lo);
>> +	offset += shift;
>> +	lo = lower_32_bits(offset);
>> +	hi = upper_32_bits(offset);
>> +	xe_map_wr_ring_u32(xe, cmds, idx, size, lo);
>> +	xe_map_wr_ring_u32(xe, cmds, idx + 1, size, hi);
>> +}
>> +
>> +/*
>> + * Shift any GGTT addresses within a single message left within CTB from
>> + * before post-migration recovery.
>> + * @ct: pointer to CT struct of the target GuC
>> + * @cmds: iomap buffer containing CT messages
>> + * @head: start of the target message within the buffer
>> + * @len: length of the target message
>> + * @size: size of the commands buffer
>> + * @shift: the address shift to be added to each GGTT reference
>> + */
>> +static void ct_fixup_ggtt_in_message(struct xe_guc_ct *ct,
>> +				     struct iosys_map *cmds, u32 head,
>> +				     u32 len, u32 size, s64 shift)
>> +{
>> +	struct xe_device *xe = ct_to_xe(ct);
>> +	u32 msg[GUC_HXG_MSG_MIN_LEN];
>> +	u32 action, i, n;
>> +
> before reading msg[0] you should
>
> 	xe_gt_assert(gt, len >= GUC_HXG_MSG_MIN_LEN);
ok, will add. Not as a precedence to verify whole RAM/local memory 
though, but as CTB send validation for debug.
>> +	msg[0] = xe_map_rd_ring_u32(xe, cmds, head, size);
>> +	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
> nit: what about adding some debug messages about what we do?
>
> 	xe_gt_sriov_dbg_verbose(gt, "fixing H2G %#x\n", action);
ok
>> +	switch (action) {
>> +	case XE_GUC_ACTION_REGISTER_CONTEXT:
> missing check for len < XE_GUC_REGISTER_CONTEXT_MSG_LEN
sure, can assert as CTB validation.
>> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
>> +				     XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER,
>> +				     shift);
>> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
>> +				     XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER,
>> +				     shift);
>> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
>> +				     XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR, shift);
>> +		break;
>> +	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
> missing check for len < XE_GUC_REGISTER_CONTEXT_MULIT_LRC_MSG_MIN_LEN
ditto
>> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +ebug
>> +				     XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
>> +				     shift);
>> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
>> +				     XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER,
>> +				     shift);
>> +		n = xe_map_rd_ring_u32(xe, cmds, head +
>> +				       XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS, size);
> missing check for
>
> 	len < XE_GUC_REGISTER_CONTEXT_MULIT_LRC_MSG_MIN_LEN + 2 * n

ditto

-Tomasz

>> +		for (i = 0; i < n; i++)
>> +			xe_fixup_u64_in_cmds(xe, cmds, size, head +
>> +					     XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR
>> +					     + 2 * i, shift);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
>> +
>> +/*
>> + * Apply fixups to the next outgoing CT message within given CTB
>> + * @ct: the &xe_guc_ct struct instance representing the target GuC
>> + * @h2g: the &guc_ctb struct instance of the target buffer
>> + * @shift: shift to be added to all GGTT addresses within the CTB
>> + * @mhead: pointer to an integer storing message start position; the
>> + *   position is changed to next message before this function return
>> + * @avail: size of the area available for parsing, that is length
>> + *   of all remaining messages stored within the CTB
>> + * Return: size of the area available for parsing after one message
>> + *   has been parsed, that is length remaining from the updated mhead
>> + */
>> +static int ct_fixup_ggtt_in_buffer(struct xe_guc_ct *ct, struct guc_ctb *h2g,
>> +				   s64 shift, u32 *mhead, s32 avail)
>> +{
>> +	struct xe_device *xe = ct_to_xe(ct);
>> +	u32 msg[GUC_HXG_MSG_MIN_LEN];
>> +	u32 size = h2g->info.size;
>> +	u32 head = *mhead;
>> +	u32 len;
>> +
>> +	xe_gt_assert(ct_to_gt(ct), avail >= (s32)GUC_CTB_MSG_MIN_LEN);
>> +
>> +	/* Read header */
>> +	msg[0] = xe_map_rd_ring_u32(xe, &h2g->cmds, head, size);
>> +	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>> +
>> +	if (unlikely(len > (u32)avail)) {
>> +		xe_gt_err(ct_to_gt(ct), "H2G channel broken on read, avail=%d, len=%d, fixups skipped\n",
>> +			  avail, len);
>> +		return 0;
>> +	}
>> +
>> +	head = (head + GUC_CTB_MSG_MIN_LEN) % size;
>> +	ct_fixup_ggtt_in_message(ct, &h2g->cmds, head, msg_len_to_hxg_len(len), size, shift);
>> +	*mhead = (head + msg_len_to_hxg_len(len)) % size;
>> +
>> +	return avail - len;
>> +}
>> +
>> +/**
>> + * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB messages
>> + * @ct: pointer to CT struct of the target GuC
>> + * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
>> + *
>> + * Messages in GuC to Host CTB are owned by GuC and any fixups in them
>> + * are made by GuC. But content of the Host to GuC CTB is owned by the
>> + * KMD, so fixups to GGTT references in any pending messages need to be
>> + * applied here.
>> + * This function updates GGTT offsets in payloads of pending H2G CTB
>> + * messages (messages which were not consumed by GuC before the VF got
>> + * paused).
>> + */
>> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift)
>> +{
>> +	struct guc_ctb *h2g = &ct->ctbs.h2g;
>> +	struct xe_guc *guc = ct_to_guc(ct);
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	u32 head, tail, size;
>> +	s32 avail;
>> +
>> +	if (unlikely(h2g->info.broken))
>> +		return;
>> +
>> +	h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
>> +	head = h2g->info.head;
>> +	tail = READ_ONCE(h2g->info.tail);
>> +	size = h2g->info.size;
>> +
>> +	if (unlikely(head > size))
>> +		goto corrupted;
>> +
>> +	if (unlikely(tail >= size))
>> +		goto corrupted;
>> +
>> +	avail = tail - head;
>> +
>> +	/* beware of buffer wrap case */
>> +	if (unlikely(avail < 0))
>> +		avail += size;
>> +	xe_gt_dbg(gt, "available %d (%u:%u:%u)\n", avail, head, tail, size);
>> +	xe_gt_assert(gt, avail >= 0);
>> +
>> +	while (avail > 0)
>> +		avail = ct_fixup_ggtt_in_buffer(ct, h2g, ggtt_shift, &head, avail);
>> +
>> +	return;
>> +
>> +corrupted:
>> +	xe_gt_err(gt, "Corrupted H2G descriptor head=%u tail=%u size=%u, fixups not applied\n",
>> +		  head, tail, size);
>> +	h2g->info.broken = true;
>> +}
>> +
>>   static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
>>   							bool want_ctb)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 82c4ae458dda..5649bda82823 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
>>   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>>   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>>   
>> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
>> +
>>   static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>>   {
>>   	return ct->state == XE_GUC_CT_STATE_ENABLED;
>> diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
>> index f62e0c8b67ab..db98c8fb121f 100644
>> --- a/drivers/gpu/drm/xe/xe_map.h
>> +++ b/drivers/gpu/drm/xe/xe_map.h
>> @@ -78,6 +78,18 @@ static inline void xe_map_write32(struct xe_device *xe, struct iosys_map *map,
>>   	iosys_map_wr(map__, offset__, type__, val__);			\
>>   })
>>   
>> +#define xe_map_rd_array(xe__, map__, index__, type__)			\
>> +	xe_map_rd(xe__, map__, (index__) * sizeof(type__), type__)
>> +
>> +#define xe_map_wr_array(xe__, map__, index__, type__, val__)		\
>> +	xe_map_wr(xe__, map__, (index__) * sizeof(type__), type__, val__)
>> +
>> +#define xe_map_rd_array_u32(xe__, map__, index__)			\
>> +	xe_map_rd_array(xe__, map__, index__, u32)
>> +
>> +#define xe_map_wr_array_u32(xe__, map__, index__, val__)		\
>> +	xe_map_wr_array(xe__, map__, index__, u32, val__)
>> +
>>   #define xe_map_rd_field(xe__, map__, struct_offset__, struct_type__, field__) ({	\
>>   	struct xe_device *__xe = xe__;					\
>>   	xe_device_assert_mem_access(__xe);				\
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index e70f1ceabbb3..2674fa948fda 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -10,6 +10,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>> +#include "xe_guc_ct.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>> @@ -158,6 +159,20 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>>   	return ret;
>>   }
>>   
>> +static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	xe_assert(xe, IS_SRIOV_VF(xe));
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		s32 shift = xe_gt_sriov_vf_ggtt_shift(gt);
>> +
>> +		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
>> +	}
>> +}
>> +
>>   /*
>>    * vf_post_migration_imminent - Check if post-restore recovery is coming.
>>    * @xe: the &xe_device struct instance
>> @@ -224,6 +239,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   
>>   	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>>   	/* FIXME: add the recovery steps */
>> +	if (need_fixups)
>> +		vf_post_migration_fixup_ctb(xe);
>> +
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
>>   	drm_notice(&xe->drm, "migration recovery ended\n");
