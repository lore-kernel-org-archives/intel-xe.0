Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC855C02190
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 13:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6997E10E95A;
	Thu, 30 Jan 2025 13:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/16XctJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E38F10E960
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738243252; x=1769779252;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=82foz6EOvSrxy+ennJz0c5IvfKyZYiXgaN6Ozjl0/4o=;
 b=M/16XctJRQLfqhELv4MxQAXy68EsaqgGDGWuN7knS/UYa0D1w/nf33ib
 atERRbc8OBf26hULFWPqkI7duXHBG2fmzViVMFtXw2hk8zbczrDiRVIqK
 AtcCWaZrgKCjsBUInLs5QZOiSO34dKQq8UNXVH648mN7q14vuLOmqQctj
 bQw9sxYcLlLKkEOwiAS93a63o5CRdL2xjxpCCErdaABFQxHr9Oq2VXZmL
 UvHU1yXsDfPgckxAI9zyYUjufcrtCyhB0LeOqxUoRqVeCMVFhyzkevgbd
 OhQoStNRrEcoUPsWJr7hK0iUMW4IJ4W4WoSJ1Tbn3NAV1SN/xNio4T/W3 g==;
X-CSE-ConnectionGUID: r3PTPqbLReaSpc2sHK4TZw==
X-CSE-MsgGUID: cuXO0jCgSLGkda3yTkVhEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="26389301"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="26389301"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 05:20:51 -0800
X-CSE-ConnectionGUID: a5dzFXseR0Oje655kIgDGw==
X-CSE-MsgGUID: 8cR6FlheQqisw4woIcJp8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109890388"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 05:20:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 05:20:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 05:20:50 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 05:20:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDhQxoYa6hY7pjQmGs6lWHeXPX7zZ4k/chUqJD3q0FL+/kaLuncQB/5T2RvAdcsISBUh+4+GzAFZ4UBBbYwA1wrHlAw1lo4ATtFM8ibObS9nP0SXHYeFKXuHFV1/raUi11DBBuznETwUtudn/XM3+MOk4kTHKyVLMlk3WKOb0+AQ9gJVCBp8mR2Z2HgQficEAPy+uIUQQbuFc5IK7/elL50Bb9gKHa9rt/LUuZ1zmFrF7aKgTVqf8Oz6BSO7L2n+BkFFUzp8ZMyE6V37YjuhHeaN/L2hkpkb4uoXy/J3F/6akiy+LKCmG25n/F1+paR1olkCL2McFS5SV0aAYJSCQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXIK9kn6t1ngHtNKePnGkj1kGuIT/Ri9zYcX4ODwFnI=;
 b=F4g8s3fHgIx1DngKGIUSV9jxF50jdT3fadpWsL0H837m1RmBJu1GoFB43S+YQkDltg7pQ2N47i6KRNlbjJArzfYO/CQi5p8++nL2cud6nz7RjykdMl4bdwSbEt5kKXrPzSJhL406ijTncSnY/jRWl4A3mZ484L8otCozxEHKSuHwKX4YYjvrHjmMN6uxpiUSGhizOztHXNY+mvo0Y/khyve9kKTtsXf6irJPZTo9O/YlrHkevRtR699a8MbXVssV84CXGwqRFM6/9waFCcS5Kvf2pFTlStI+ZWQiaum/DvpgKxERRFBjlWtK/CYh88Moc0m6zaRjGcfnjHqgEDp7Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB6543.namprd11.prod.outlook.com (2603:10b6:8:d1::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.20; Thu, 30 Jan 2025 13:20:38 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8398.020; Thu, 30 Jan 2025
 13:20:38 +0000
Date: Thu, 30 Jan 2025 14:20:35 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/pf: Don't send BEGIN_ID if VF has no
 context/doorbells
Message-ID: <y56meghucijzvbanuh6h5y6n4peu3ydeiv5wz2jp4trtzfiyqw@f6q2p7fkvekd>
References: <20250129195947.764-1-michal.wajdeczko@intel.com>
 <20250129195947.764-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129195947.764-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR10CA0093.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::22) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: ffeec0af-73f8-4db1-9b64-08dd4130e307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkdGY3ZFalZGei9vQ3hPOWJ6S1g5TGdSY1JEREwxWXN0UVNlNnJ3RzVmSURa?=
 =?utf-8?B?ejhBVjRMSEZhU2xXQW5jYkxlMFRGMWxyQWJvclB5MzloQVI3anVoZ1p4RU84?=
 =?utf-8?B?Qk5NL3VNS0VGdjRJRDFleEdPdHpxaVJ6MHc5R0YrSXNtaTlOeWxQMWc0citm?=
 =?utf-8?B?OFBOV0RkMmpLYjQrRi9YY0RwVmV3dzhVeDJOeG9SbjlPbDYzSzN5dUtTUk5Z?=
 =?utf-8?B?cmNiTlh5STByOTdzcDUrd3g0QW55OFBlbkVrZnRTNFFRMWhMUlpsYm5GcGI5?=
 =?utf-8?B?SUtvNXFGckhGcTZMbTN4NDNRcEZWeDVFTnlRbDNRREJaZDRHdUZwK05jdU5G?=
 =?utf-8?B?bDNKM3hrZHNtekRBUVUzaWZXanQvYjdueWduLzhKVGNHeHB2alJtMStPQ1Nj?=
 =?utf-8?B?clI4enF5N0xxRjRLRUg1NDR0UVphMGxUWTJPNVZmQko5dXc5Smk1enVkYjVt?=
 =?utf-8?B?RWprWUtkRURkWGFod000MjBlZlpicytGWGVCZ3BRTWlRRktnK0hmNWJPbkJM?=
 =?utf-8?B?dkdoN1lUaUlLZUVqd21hTmFkcy8yRFJvR3Z0RS9CdjFsdW9jT3RQS1JXODU0?=
 =?utf-8?B?MDdVdE5nbFNPaklwMGhwYUVHbUdBd0dleHRPMXlmeXIxN0h6Y0xMNkIvTGJz?=
 =?utf-8?B?U3dOdnhFaWVEbGV3bjBycFArYUdHZDJCRzBJWHUwWm5lVUlDZ1ZaU2JLVllK?=
 =?utf-8?B?RG9EV01zZEREREsxRm9xRnVXSEEyc0JUQjNtNzZ4Zk9kMUhMM3I3Q2JKYnNr?=
 =?utf-8?B?eWYvUDdmczByN0lNWlJyZlBQeWQ1ZlFPbG9aL2I1VlJqOVBKS250cCtlbDZx?=
 =?utf-8?B?RGQ4S1pGSUZpWG5jVm9iYUFKYkxkNXlMT3pxU0lUdGQ2WllPcEhlVnNUY0VG?=
 =?utf-8?B?dlVVWkRjTVJjZFRsaFFLcXl5L0phWkViYkRXWS9hSnJkUWZ2SWt6OUhPSEl4?=
 =?utf-8?B?eXMxbzJUcVVYTy9nUDBtOWZNaWVIR2ZVaFdmaXFFaTFIcW1yU09IaDUvdlJk?=
 =?utf-8?B?VDRiRzlHdnNVS3JBNGlNNW9KOHRhVEttM0hDbkZ6Y1VURkFkSHF3VlIvS3BP?=
 =?utf-8?B?YUY0RnVzenVCeFNOeHJCcll1R1VmbEpUYmFlRXdEYVdwZEZnRmFMTjhKbXVv?=
 =?utf-8?B?NzNIT1RjWUlzRW84b1BzamVUa21aRE9QSHFCR1U2VWhGL2FQWC9LTW1RNzI5?=
 =?utf-8?B?UW50cjl1WnY5a1laeFVxWDVPekJBeDZEY2w0d0Z1NVozQVpvTjU2eTRsV2pm?=
 =?utf-8?B?V1Q2NStSb0FJSHN6aTQ3dkxkdGk4U1pKeVp5OVhrd3hwZmxuOVYvbVlpZHJL?=
 =?utf-8?B?OUpEUmYvWGZSd2lqVUh3NjF2M2FlZ3dCRHpxTEY3YXdWUmErOWxQRkNIM1k1?=
 =?utf-8?B?eDl2Q2oxK2plZ29KbTB4b2J2UG94ZW9kRXJyUXQrTDExdXFvMlIyWXROaWZN?=
 =?utf-8?B?NkoxNHg4eGdOT1hKcFphbTJwdHE4OU1oVVVLVE5yeXFRd01lL0xFYktVMnpy?=
 =?utf-8?B?TFdUbjQvUnlsTXcweTNLNTVOUTY0L012bE81YkxHdGFGSWFBTHFXL2FYRkY3?=
 =?utf-8?B?OWw3S3NWMTN5ZTQ3T3ZLSE9EVkZPcUNxU2dhc3dYdkxwdnVOSEZJZkEzUGNW?=
 =?utf-8?B?NXdTMGdlRU9hMEVyOG1CZUVQUUdVamQvVzRNODJXeFJ3OVRuZkZ3ZktHYkRX?=
 =?utf-8?B?OVFCWU9Ia2o1UkJlNndHMldMdU84bHBzU1cvcXdYNW5FVU4yR3Y0RDNTUDZv?=
 =?utf-8?B?NjJ5MjZIbWZMUHdTd2lYbmZ5dVVpZVB6d0cyRklHMldjckZhL2Y3NlpiZ2Vo?=
 =?utf-8?B?MU1yZmN6RnhrYm1oMVJodz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFRjZjA3cXBvQjRnWGg5aVVhZkJ6T29TdFRLek9yOXUxQXpndW1hMS9wZHFv?=
 =?utf-8?B?dWg4KzJBVCtYWUpodmZYUmVxMEJEYlNIU0hLSFlVUzFzdHRDSkJIN04wZ0RC?=
 =?utf-8?B?RXVBR3V1Zm5ibk9zOGJjbnNwcmZ3d1k0WFpDRHlVcHdlcG1kdVZEa0tKMVRB?=
 =?utf-8?B?amVaSUFPVXFSODQrM1N6Ni9yZEpoL3Z6OEpSMC92bjYyVS9HT2Z0bWJESEVQ?=
 =?utf-8?B?d0RtdEx6VUVZUGhjR0ovc0w3UVBNOHFRWllwYnpJSHI5MGdDUm9RZEE2UWdT?=
 =?utf-8?B?dTBHZlpUdjJzRnN5bm9MMHVaaWdTSVZFNENSU01FcXpMRDZYVmNVcnBXM1Ux?=
 =?utf-8?B?RWFSOFFMSUtQK0g4MTFSQTFvUGozZnZ0SUkwWUk4enpPRUxnMnVsQ1NScHNH?=
 =?utf-8?B?bWY2Wkx1MTZKL1BNSko3ZzRvYWtQbi9tSERITzNjRUt1Z0xqUWtJRU1EWlU4?=
 =?utf-8?B?MmtHOWlETEROVkRENXdhLy9wZWgwRlZUc0MzSUd4b2gwT3M1b29SMUZVQ3hU?=
 =?utf-8?B?SmY1RFdVcW9WRWFQOTdmT3ZoTzZqa3oyQXBqR2crWkZpUC9KcVE3bmxXTEpQ?=
 =?utf-8?B?RDVxbitlbm45ZEZEYUw4L3Eyd3BkS2hyU3ljTkFvZllyZE5QcGllR1QzbDV5?=
 =?utf-8?B?Q3F1U1RpNXU2WXJnZHpHY21TNkZEd3JiYUxOSnJkK1I4VnJNRHZreTB3MWIv?=
 =?utf-8?B?TWprN1U4RDFHZ2pHWDhEZ0NqbXEyQ2F2YmhKTlNqVXh2NTNWMDBobmx5T1dY?=
 =?utf-8?B?c2Z3UU9tN1hzdmI1UVE1bTJZRGxkd21iK2Y5YkJtZjJRUnh5b0hCWGZxdms3?=
 =?utf-8?B?WVU5ZlFNK0ZrdmZpdWkxZ0FQZmt0c2NqSWRXb2dMWmJabjFNZmhIUVg3aVVR?=
 =?utf-8?B?b0I4dnVvT04yVFlGWkFOaUw3ODR4bmFjRkg1Y0ZYSW5IeElnOUxTNVpJTnFh?=
 =?utf-8?B?WWtUSkxyUUFTeXNXd01vZU92V1hPbUtHakMzcjVYbVBBVGhOalZqc3c3NU1i?=
 =?utf-8?B?eVFoYndSZmlrK2lueFh5aW4xT0pheXd0V2NWd2NqUkxGR1dVSHg5bjNDdDRu?=
 =?utf-8?B?U2VaOVVXTk5NQldrOXpLemVWQy9vTWFsRkNOQ3NHZWppTmpydnZPOWprOGdD?=
 =?utf-8?B?c290LzYvMTNBbHZPZmdiVnhpQUwwM0UwU2Z6cFFaM1ZycHV5MTNTNXpESEdU?=
 =?utf-8?B?ZnBKRUREWTZQT3IwWFFkREQrdW1uaHZtS0tRdGtidWQrazhreXMxYk4xUVN5?=
 =?utf-8?B?SE9nbG9Mckt3SkVLRHlXMVEwNml4QmhwbDNQeWNVWkpvcVd0MENiakNiWWdF?=
 =?utf-8?B?N2pIQ0wyZ2Z0cGN0RkY0VktqbEY4WW5ib0xkMXVlL3R5WEl4eGFmMXNHbjFE?=
 =?utf-8?B?TVB5eGNXT2F0akloZ0RURk5PL2Z0NVA3aFFvYkxqYW0zL1BlNnBJTGM1V3Mx?=
 =?utf-8?B?TGFaWXFTZXBWS3VDUlhOd0VyVTlNSFYrbUtyL2tPVnptZGlkMTEvSUJkZkRv?=
 =?utf-8?B?Yjg3bk8vTDk1ajZSUENGZlJkM0tlVEtnaHNDM2s5Z1FmN1E0Z1BIRVI1MUZW?=
 =?utf-8?B?OVkxUUFGZno5VWRXdjRrL2k1TUdXYlFSczZxT1FzZVZUNHduOGJWd1ZiMUlu?=
 =?utf-8?B?YTFxOFNpemdPb3VkSzBjZ3NKYlNLZ3NDV3lta3ZKRjk0RWZXTW8remgwbnFD?=
 =?utf-8?B?MitjcDBPYkVXSFc3d0xyRlJwRkRPdVJqYjZYbTl2RkVNazVLMFRvWXpxdFdi?=
 =?utf-8?B?TmZSRk1UWitGYlB2WExnS0J0ZVFockxZZ1dhbHovWjd6RzJNRUFndVFwYTM0?=
 =?utf-8?B?UXhvaWJxMlE4WUZUNmgyS1JQVkRubkIrMFJIdXoveUdJSU1YbEZVZDF4NVVt?=
 =?utf-8?B?ZWZlYTVPUUV5SFVUYWlReHE5TkhVZHFuN1Fwbnl5dDMyS3FyVmExdmpEamJJ?=
 =?utf-8?B?aXlTWDZWNUZONDZSa25hbjYvS3pTZVpCYW9EaXlHRGZBeFMwb3Zmb1BraXRT?=
 =?utf-8?B?MUo2QllzZGtjS21nb2UzOHY2ZjlWUTlYdnQvcFZ6SEh3Q3R3ZXlLZjhXRkNR?=
 =?utf-8?B?dUtUYjdDK3VDQy9TVFArbWRuV0lybmRENngzeFdLRml5UGNMSXVlYXZLNnlX?=
 =?utf-8?B?Tzg5MWtEeUU1VldYSzRMN3JpamhCbVdRNTkxSGUwT3FnVW5HUXV2djM2MnlY?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffeec0af-73f8-4db1-9b64-08dd4130e307
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 13:20:38.1762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeloNVUTvO7aygWdLG+tI2mOO+qtL0SG9wVVb5L0eSQQ4YkJfVdVT/+Z0Fx1z0BGa1uXHwSL33/APxQioEqXHhgIUAOeXfEyQe4iaEV3XI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6543
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

On Wed, Jan 29, 2025 at 08:59:46PM +0100, Michal Wajdeczko wrote:
> It turned out that GuC validates VF configuration immediately
> after receiving "some" set of configuration KLVs and complains
> if one of the critical, from GuC understanding, resource is left
> unprovisioned, even if PF should be still allowed to make late VF
> config adjustments, since VF was not yet started.
> 
> This issue was discovered after we decided to asynchronously
> re-send configuration KLVs after GT reset/resume, as then fair
> VF auto-provisioning could already allocate some of the resources,
> which was a prerequiste for sending those config KLVs:
> 
>  # fair GGTT provisioning
>  [] xe 0000:00:02.0: [drm] GT0: PF: pushed VF1 config with 2 KLVs:
>  [] xe 0000:00:02.0: [drm] GT0: { key 0x0001 : 64b value 0x176a000 } # ggtt_start
>  [] xe 0000:00:02.0: [drm] GT0: { key 0x0002 : 64b value 0xfd696000 } # ggtt_size
>  [] xe 0000:00:02.0: [drm] GT0: PF: VF1 provisioned with 4251541504 (3.96 GiB) GGTT
>  # re-provisioning worker
>  [] xe 0000:00:02.0: [drm] *ERROR* GT0: H2G request 0x5503 failed: error 0x60 hint 0x0
>  [] xe 0000:00:02.0: [drm] GT0: PF: Failed to push VF1 14 config KLVs (-EIO)
>  [] xe 0000:00:02.0: [drm] GT0: { key 0x0001 : 64b value 0x176a000 } # ggtt_start
>  [] xe 0000:00:02.0: [drm] GT0: { key 0x0002 : 64b value 0xfd696000 } # ggtt_size
>  [] xe 0000:00:02.0: [drm] GT0: { key 0x8a0b : 32b value 0 } # begin_ctx_id
>  [] xe 0000:00:02.0: [drm] GT0: { key 0x0004 : 32b value 0 } # num_contexts
>  [] xe 0000:00:02.0: [drm] GT0: { key 0x8a0a : 32b value 0 } # begin_db_id
>  [] xe 0000:00:02.0: [drm] GT0: { key 0x0006 : 32b value 0 } # num_doorbells
>  [] xe 0000:00:02.0: [drm] GT0: { key 0x8a01 : 32b value 0 } # exec_quantum
>  [] xe 0000:00:02.0: [drm] GT0: { key 0x8a02 : 32b value 0 } # preempt_timeout
>  [] xe 0000:00:02.0: [drm] GT0: { key 0x8a03 : 32b value 0 } # cat_error_count
>  [] xe 0000:00:02.0: [drm] GT0: { key 0x8a04 : 32b value 0 } # engine_reset_count
>  [] xe 0000:00:02.0: [drm] GT0: { key 0x8a05 : 32b value 0 } # page_fault_count
>  [] xe 0000:00:02.0: [drm] GT0: { key 0x8a06 : 32b value 0 } # guc_time_us
>  [] xe 0000:00:02.0: [drm] GT0: { key 0x8a07 : 32b value 0 } # irq_time_us
>  [] xe 0000:00:02.0: [drm] GT0: { key 0x8a08 : 32b value 0 } # doorbell_time_us
>  [] xe 0000:00:02.0: [drm] GT0: PF: Failed to push VF1 configuration (-EIO)
> 
> To avoid such errors stop sending BEGIN_CONTEXT/DOORBELL_ID KLVs
> if no GuC context/doorbell IDs were provisioned to VF.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4176
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał
