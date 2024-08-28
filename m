Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6296C5474A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 04:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831FB10E499;
	Wed, 28 Aug 2024 04:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3K9b0cB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A669410E493
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 04:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724818241; x=1756354241;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pEJdzc+kfeRr7AZVcFoEHl32xfDvRkKAJ2zg7E5iltw=;
 b=V3K9b0cB/4iFj8isgI6RcxuUKgIo7IIj5p/qOojY4Auoj+M6eLSqc21x
 jGokb6ZRtMVSCooqW9tqj7bk+I4dahUxfLQo2He1iUnmUaOYjJKX4EuOP
 jVE3Jcxm6V6xsVyIxYOMNLN+M5jcKD+J4M8N4FvehWxg8tLHk7ZA5tTUI
 IL/3bZJXiWzvB0sMh64Tpgz689JaTLZvQMhdAEq+rClY8Vh0QdpcNt4Fs
 /zZy4yIb4ohXPTLPnMrTVMgImq0eNlAXdkwwNo8YDgujCsXvq02R0kDI6
 vhemYTEcr2BpRDw2kiFq74lv6r+4GYc1GFJ10jRTa5mZnlt2tmpRcWcCU w==;
X-CSE-ConnectionGUID: S2ToAjaJTfKZME1TTzSw1g==
X-CSE-MsgGUID: vtCUeMRqTAWKDGAT5KOXbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="27207806"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="27207806"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 21:10:41 -0700
X-CSE-ConnectionGUID: skIJXw8GSWS4oaJbhRHZQA==
X-CSE-MsgGUID: eE79R2rRTq2pvVVXxjOblA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="62929473"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 21:10:41 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 21:10:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 21:10:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 21:10:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6u9iZIm4f4jg05ell9Z5ywTiLgeMOTnjvGe25EMeNsf66Dei0/CUQ2ci6U+rPUvDate9xxh5pRzmCcJ4lRL2oP6e4llSM9fS7Zfj5VYz+2/dXAt/hjlrJYy/uINGINABils3FUNRIq4sNyibXNVK87jxz56z0Hz9InaN+nelXkuTSi1Ou5+MoV0Qgm6s4LMv8C2JHcguKU2cuBI3LhJ4ONPEctMqxNr6ZZSm/tS0DTdVqph3vOefoX7dZkvnVR3mkFC0LvZzf/Fbl+eJjtjg622XF9yjMIX/yzP3q25SpSuWH+BqW2tnGs96F0XtfU3b4dDjXBA0vVDvvC6IQyV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaY7T1lYSmtYZCDnxF2q15NIYFdII4jXvIbw0BcR+i0=;
 b=il4FVajzlM+nMjWLGxznoq8Ei4qcaFabL1qO41tqX38EEN0SVhke3UAXx8ZEpaz7npkfX2wd83nN0C3t4bBG/Pm5hI02NBxFY9LS0m2xOOpbJ3tQmlzW0T519wM0jaQEU6RVYrrjj8hfBZm2ws1kqrW3X7zvZDmiHFvvWdcGDEYrqaA6bcWiawJWX/nkcZ9mcDZ7GQUCaBmkjIITWpdrQBK4Q+b8fV6CbY0drk+xi9MnjvZulLuEYCpkoHKUApbYlW0NAFUkMEIHKi+CSbTpeuxergfDLZy80ZtdVlky/YEtKa5Xkt4I4pYT9VnwC4EM0x/flkRyIcsGw2uaa/mw4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA1PR11MB8395.namprd11.prod.outlook.com (2603:10b6:806:38c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Wed, 28 Aug
 2024 04:10:38 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 04:10:37 +0000
Message-ID: <7628f952-5009-426a-9cfc-677311d308ed@intel.com>
Date: Wed, 28 Aug 2024 09:40:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/hwmon: Fix WRITE_I1 param from u32 to u16
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <ashutosh.dixit@intel.com>, <rodrigo.vivi@intel.com>
References: <20240827155301.183383-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240827155301.183383-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::35) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA1PR11MB8395:EE_
X-MS-Office365-Filtering-Correlation-Id: a7e751b2-33a6-4a9d-c5f9-08dcc7175f34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Njloc0NVQVlOOXhwKzBZWVptU2RpR0s5anoyam9VM1QvRklIMTVmb2p5WmUz?=
 =?utf-8?B?MGpDZzZ6SEdkWThoSnN4djA4ZGdmYmpjdTNqN09IbFI2cVFobzFBRVZLS2FJ?=
 =?utf-8?B?Tk5MMWQxYk14TUVlNG0ySVg0ek15Kzk2cStNZ2haNDdGcDROdjhpc0NvWnhn?=
 =?utf-8?B?RTdUQVg5SFVXU2NxOTJJRXU5OEhGUmp0aDNIczBzTm9PKzlyWU1uRzNBN01L?=
 =?utf-8?B?OUlqOEZzRmVQVWdvbXh1ZU5PRFdmWFRqUnB0UVBrZUR6YU9TSlFEcmRmSXFv?=
 =?utf-8?B?eVNGQjRFMnVnb05MTHVscDJwNEVOR0pUZmVKL0dGQnI1emUybElwdUhJNlhk?=
 =?utf-8?B?QWFVMUEyQVNZVzRuYXJ5amd0SUhrREthSDIvT2lYaDd1OHRRNllGWkx0allu?=
 =?utf-8?B?VGhOV0Rrall5Y1ZvWUpWYVhpbWV2RU8zZlpHNGZPd0N2YzRlZURDYmZGS1Za?=
 =?utf-8?B?RTFKMlNxNkFkUzdTYmlXdkViL09OV2tmZTBQZWdHVjliRElmQTJ1Vy9Qcnhx?=
 =?utf-8?B?TE9DYjZtT1ZPRHVObHJ1WUFRc1BURnBDRGRRbGR5RkpGeFV4VzJBd3dBUU93?=
 =?utf-8?B?SlZQOEVxSFZYRmY2SmE2SjRqL2JxU2FOUnZwbmMraURlT0VzWHlXbjU2QS92?=
 =?utf-8?B?L3A0QjNvUGtneU96d1RLWG5vZjNKSjYzdG9zNDg1UHlMMVZPSElWbVV4SE5i?=
 =?utf-8?B?MGZPdlRkM1pBY0RRcTlKU3lHa1Q2YW0yR0F3ZDhEQy9QQmUyQzdKbGltaHI3?=
 =?utf-8?B?cERhWTF4MGVsWS9KMzJhV2ExR1FLdTM4Q2RwME9QSCsraU1jSWVpODhwQ3Jy?=
 =?utf-8?B?Y29FWlcyOTVqeCtRdDRRNFNidG56bEhRQzhCRFAxS1F2Qm1OR3dndzNyQUlv?=
 =?utf-8?B?UVhXSUlzeUJtMHk1Ri8yTTFpa0hjSU5SZXZ6SHhqZmNCR0laWEJNZzRlUUtX?=
 =?utf-8?B?QjdKUHhyZW80Q3c4aHlCMDYyZVdQRzhhMFcvVE9xZW5QczlTdWlkcVRkUEll?=
 =?utf-8?B?aFlkZUpielg3c3l0QjN3SE84ekJVYlMrQ3hzSmN3Tk1lbXdlcUp6ZGJPamUz?=
 =?utf-8?B?c0tkM215WGF4a3JYWmp3bGNIOE5KQ25RR1FPUFFkOGcxS01vS3M4ODlITHdv?=
 =?utf-8?B?NElyTEgvVXNkWE4zZTVMaUMwbEtqTkM1NjFtcWdHbzRVanB2TW5HbVkzR0hp?=
 =?utf-8?B?My9lK3Jtd0xWblU4dXIwdThXYm5xSUZnVlJucU14MkN0YVBubzlWQlUvNnJm?=
 =?utf-8?B?R2NEcDNVRFZoWExJakQ5aXAzL1BtN0VjTmRIZkp5UytIZjRUSkhvVVpHNlFN?=
 =?utf-8?B?ZmhqYTVKdzlUM1NFTUFwTHNKZUhMaEg3c2FJQjFGaEtIMGJJTm5neXhJQW5x?=
 =?utf-8?B?NFUreVdSK2hxYkgwTFpsOTV5dWN3b1lOcEF0VmV6MFpaMnpUQUdkdWRCN1Zl?=
 =?utf-8?B?UkIxSzdSd05xTW1FbGlFMi9tcTdOdW9kSlgzbStZdmpWd0wyVUFRZTV4akdz?=
 =?utf-8?B?L25HalV2b2NtQmZhd2ZlVjRlKzhPbHAyRFAzUGtaTUNBSHU1SFBaQU03azU1?=
 =?utf-8?B?MnYxYy94ODlJUDF6eE9CWmplbFRtQzhOeThvdzdqZmpUbXhZWGIwbXMrb251?=
 =?utf-8?B?OUVuVjE4Q2tqRHFuMHZ0eFUrY01aUU83MUIrM1A0Qk5OdldXWEdNS05URy9H?=
 =?utf-8?B?azlBV2s4S05JRDQvcVRnM2lyTU5IU3FWZlExZEZxRlg1UmpZdHQrV0h6Zld1?=
 =?utf-8?B?L3VUQTNpdmxJeVdFN3hFMEFnc1RmOU5Cayt2VTAvd3pnRWE4VCtvQzZ4MkFW?=
 =?utf-8?B?elJlakpoZU5PazZkN1Fwdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnFHWnBZdWFaeWZzYVhMNFdFS09jYXRzdks1M0NzcnROSWFmcnozZDVMdDlO?=
 =?utf-8?B?VWYzektrV0RaaThCREFuQUlEWTBZelViYW5pQ1ozVjdJQkRBVlMwa2lsMjNq?=
 =?utf-8?B?MUNRQmtWc2NFc0tPZk5FTW54b21mZVEydXE3SnpaRGU3M1FVaW5rMkFvY3l5?=
 =?utf-8?B?S0JUSWxkZHVOd3JVSVE5RjJjcGRzUG5zU21ETkdNRkp1MjVRaWJzWFQySm5r?=
 =?utf-8?B?cGNOaXBLNGo3L1hhYUl4SWpwUzBiTTRUOEMzR3Rwait4RXI4dnVBNW5zc1Qv?=
 =?utf-8?B?dWZranNYWUFleHJGbWdCbDhsdFd6enJXRWVFc1pBaTRBQm1DUytmNG51cW1o?=
 =?utf-8?B?dHEvb0FYRXJJZDVsZDZ2YWtrZ1VGZzlwbFJtelFOdTk5Vk9pQVVjRHJSTU1O?=
 =?utf-8?B?SnN2eDlQa3EreTc2dm94WDhDVm8zMSthMVJ1UXhTbG5PcGtiMXN5L2VhSkVi?=
 =?utf-8?B?NW1sNDhRdW9FajBBUFlRdUFoam5Wd0xzcVJVNlJXQ1pWKzZtOTVQUytmd0tJ?=
 =?utf-8?B?MFJESXJyeG1HdjN5bGNOZXBBczdRdUdUNlQ3OSsxVFpmZSt1ZG0zNURFaE5Y?=
 =?utf-8?B?bTBYeVVTQzUwaVNCUjJxcGtCakh5U0VYdFlTZzNFK1pGRlYvQWxxMlBHdUxw?=
 =?utf-8?B?UnpVNDBuMFdweWtUOEt4MTczaVV4WWJpVEpNUGwrZ2ZzSE1LUFZNN3J4SFlH?=
 =?utf-8?B?ZytlaGNESWhwSmpMTmVRTWFFZHpETTJLSDR1eFl1dklwNmFNemY0Vm04ZlFP?=
 =?utf-8?B?NDNyNk1WRDlvT2RuSTdVSE4zRWdCdkJZRTIydWQ4MFZBc3FKOTdWZU9adkcy?=
 =?utf-8?B?cHBMMkJlU09BWEtPTEpSdXAyNjdWaFpiMG9xZXllQ3lNelAvQ0krNmg4YXYr?=
 =?utf-8?B?YzNEYU80VHlKc1RrMi9xb1B3OU9vbXBmbmFQTjY4OE52NWxqM2FuRTlrNi9J?=
 =?utf-8?B?ZjJBZ3hycm14UWlrNVlDTndHd2p1d2EyVENBMzVueDdrMXVwWGZ3Vjl0RFlV?=
 =?utf-8?B?Q3ZTWTlLZ3I4L20wenVIQVkranN5aVlubHN2b1pXT3R5ciswNmtlckx4bjI4?=
 =?utf-8?B?N2J2Q3lyTWpmSzJaT3hPcVcvVC83OGxtejE0YkU5cTMxN0pxenVPLyszOE1B?=
 =?utf-8?B?K2g0Rkl1ZmUrWUEraFdZUEZGeDFlbDZMY0t3djQvQVorakM1SHlDWStFU25Z?=
 =?utf-8?B?SE9iZU9Fb2R4aEVUV20xTHhvaS90Nk50endUMjU1aXdYODllWTBwODhCeDNJ?=
 =?utf-8?B?N1FiRDdZdHFManY3dzUyQjF3T2FLNzJ0RE9mVDZlWXVBQlQvVlhqOUxKVGFw?=
 =?utf-8?B?Z3FxZzU4K1lwQzVKd1VUa1BSbGkzeVFQNndzY25TNTRJZHVqMzBIS3BqYzZC?=
 =?utf-8?B?S3M2WFRhM0dsVTc0R0o2ZStOQU1TSkhwb2lKb212SHRESk5qRld3V25YczB4?=
 =?utf-8?B?blUxZ1MwK0xkR1N5V0ovNDVhb1VqN2hvdWhaQy9ncUlGMWRMMWpUSEtwNDJs?=
 =?utf-8?B?UCttbzJQbFNmSDYxRFhzK3ZEWnlWRU40YTlpMGdvU3JSRTJwT0lldlNBY2FS?=
 =?utf-8?B?bEFETzBWZWMvVjA2WHdMdHVkNVlBdHF1MDBjN0k2WllIL3JqVk9TSXBKelhK?=
 =?utf-8?B?b2NZUVA1N25URFc1YmhVK3E5U2g3c1I3L1IxeEFubmRzTmxQY3Z6NUVGYjdU?=
 =?utf-8?B?SkkvM0xOYnZkcGxBcVpncml2ak1TbWFMNjUzdC9uYnA0ZXBNU3dFVFdtNVFW?=
 =?utf-8?B?WGhhUnFTMUtoZjVhVUJjR3RsZ1FIRXZaOE9HR0pBaVlwSHRkRkJqM3VISEVW?=
 =?utf-8?B?TlZlV1RYdmxyb3lmaFVSb1hSWGdaY1hHVWppTlBTdmk1ZkJaWDMzUFVmSGFz?=
 =?utf-8?B?b2w1RmNIREtKaUZ6T2pRTmtBR2FBMFo5NnZ5bHJzWkRtNXZjNmFiZ1VNR2tw?=
 =?utf-8?B?WW90NnlGYnFJMnhUVU1YZDV1bEhWUkRqT1VEdllxSUFJYTBvRnphaGNoZTV5?=
 =?utf-8?B?dDdSQWx6a3JobzMzUldtc1ljV1YzdjUxRElCRENjVHJNdVVRd2hVN1pYVjc3?=
 =?utf-8?B?dlIyZzJYeC9xOXpkNU9vejIrTE1kQVJtbmlUZ0dDb1JYd2c2ZGk5SUV1bE9m?=
 =?utf-8?B?QWhQUlJRSXBIb1VwSWY4N0NRR2FQNmNGSWhBcHpzMzBab29Od2d5Yi9MSG9z?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e751b2-33a6-4a9d-c5f9-08dcc7175f34
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 04:10:37.9110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bd3SliZ55cTlJo7t+1yLcwg+ncSyJtqEn0KDyPA4feE8R3HcguTuU8srnorcDoQ7IIETuxFd2+VWqAtP0eizeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8395
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



On 27-08-2024 21:23, Karthik Poosa wrote:
> WRITE_I1 sub-command of the POWER_SETUP pcode command accepts a u16
> parameter instead of u32. This change prevents potential illegal
> sub-command errors.
> 
> v2: Mask uval instead of changing the prototype. (Badal)
> 
> v3: Rephrase commit message. (Badal)
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 832ea81faeee..1faeca70900e 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -450,7 +450,7 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
>   {
>   	return xe_pcode_write(gt, PCODE_MBOX(PCODE_POWER_SETUP,
>   			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
> -			      uval);
> +			      (uval & POWER_SETUP_I1_DATA_MASK));
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>   }
>   
>   static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
