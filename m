Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D47C44524
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 07:06:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11E310EFB5;
	Thu, 23 Jul 2026 07:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TrpSYyF2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C4410EFB5
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 07:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784790378; x=1816326378;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WJ1uCgGh/58lWid/E/sXBFuoYKFq8422MIbK4eIisBo=;
 b=TrpSYyF2R01MujcNlZEqaSzGux2xRyRwAAC+RJiJkumQqW0PKPOI5GpQ
 Sofg0KnWHzsIrdJXB7nL3DbJpPHx5VHFCosX4g2YD9Jhdj6tw9Nfr6UKn
 QSPukNHtzeFe8PtXbdaeydvLeLKCfZ/hkp9plBWnxD1Uz0MbO9xnhkgJj
 94OwVsXgRJPKyvJDbuBgw8SSDQz3DulqyEks8H7/DZu0a+lNKCqizhgeT
 Hm21SRHsGeyU5cISALYpjzifZ7jCndNAmmM6xLkyjqsCkvckq/FkLdLz3
 VlsCPdhLwSGha9s1gXpKIarrmdwRyGZJI4xEABOx/8uzrttrtBkTj8XFM Q==;
X-CSE-ConnectionGUID: uwpuvdrWRRObHuobkTuHog==
X-CSE-MsgGUID: W4yn88oCSzmmjxdn4PgFnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96578625"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="96578625"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 00:06:18 -0700
X-CSE-ConnectionGUID: V6LFUgzuQQSplQpSZEin2Q==
X-CSE-MsgGUID: U19z6zY2SfmcOv5r1vCnRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="255674399"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 00:06:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 00:06:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 00:06:16 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 00:06:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOwhKcF98XcyUGtyMxdhMzXfPEHdHXv/mzS1RX1jYTI5ACVNFfs8xgd7VRsKZob9WqCuLAA2oh0XfUJH9zqc7HYnrJlhpwhucaG+qpWTQNGjumlKGRnFPAdWb00rrhrXiDF0PDRhBJuzoI1gDOVQm7/19tUVdsExYRH3lkULc/cgUO1AS7NJ/5EQrEhp/XYH9YVJ5c4dEG/zZKYJTffTsGDJD43RSA7/kvhWcyt4HnLKn5wEdSEDx+6XEZ2/E530eGXKhMmOWvKlNNec0eIKMNjaOKMSmqKdBHGL2J0ZwjnHlGyJxwr3uGauV+twpmaEyXY1rQ62Xo7WYIkSR56F1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPg9cMx5nF1ukuDuD3agYvyeHl3LsmmY1vhW/WZmBp8=;
 b=v71sFT3VAkEVOO92xWNrf4FtAkLTw0+S1kkIblubGfYSJNUVpX1qAzMp/OgL+D7RZS+Ar3IKw8ckjwcGfXq2oJ1IVKzdwGcdcvVRkrfztysdO9C6a+TMD6XLJFd/CKLKiKQNaeoyk6hraLwC277tQtARNpt/d2zTUMTTBvoH+4jlAXWJfHo4Hy4FQNhGTzuxpBfsP8vRg7cCsshAAxBy1Ci3MDtVV2fvaC773s/UYj7oWcO+34+juCHNEKSgVIhwwePB6XNTEQvUotXId+wZJqQluIRiB3UxfTw8j8aEoc/npqqU2kZUeR2bBQ5LYj9ukLDTfR1/PYUOCIM/pPIc4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by PH3PPFAB4263235.namprd11.prod.outlook.com (2603:10b6:518:1::d41)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 07:06:14 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 07:06:13 +0000
Message-ID: <6d6c04dc-4d01-4fac-b447-93f299149da0@intel.com>
Date: Thu, 23 Jul 2026 09:06:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/xe: Add dbg_ratelimited printk wrappers
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260721093116.4011940-1-piotr.piorkowski@intel.com>
 <20260721093116.4011940-2-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260721093116.4011940-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0P190CA0008.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::18) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|PH3PPFAB4263235:EE_
X-MS-Office365-Filtering-Correlation-Id: adce3f8c-aa38-4da1-37a6-08dee888e1aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|4143699003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: lEijuBHnM9GQ342F29YpkpJjitTuwbwbye6+0uor3YpvN5AcLH6liX5twTf5DYC9uj268/40ahQxt4kGsEyBWU7L7hlRxHnIZnkudBR//KQl1Lvm81kYZBtcIWBzoxOEfDw8HLedt8zGkMN4Q0eWNi5BVCxXC/8w0AY35rTgEONpZVmOtjmbcv9JgQPy3JqDAkRxjjavNpr5jEnuuSRREVBjmW/rcxqWMzVizWgNo8E57EeAXWcBCC84nWwPwIXvF/QjF/jZc/yIMF3BeidpCS2Fj6vFukNrHJ19UVKR54gMiv2ozdcDaiLdXszpXNvUP36KncUrEoBsfiQ3Kwg2ZGeDSYajHu6v3c9W9LrSpoFeJWCZPs/BKv+cH008W3ibCVuzvWOkUBxFa+5vXfQeDme6WGOk18P06BKXodk646xTzf6IzWRvy+tWXlceFy3VOjboqlBPmy/hZHQsvmxCnD37QwGil2AQ9HaFv/xl4NKy5ssbuSiMI6Byb/Iw1g5lkG0Wf8O6wCBS/KlTioYbIxgDE+TlkRvSRswyqTzxVKX9nMHierAS5VolYRIX7FLvMAq3pvS1dvRJqrXDz5qTCbPk9vTEZ1T2XsIfMt/DODOc9wlF2ApqI86QSMWt65R+26PfFk+0rD4l70P+t5UZEzj+W8K8Kqc2P1HVRP01qD8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXo2enRxTW9ocHdVZmg1bFVJTU1NTjQwUHRMUGs1L2QzeWYrMU1yaGJRdkVP?=
 =?utf-8?B?aVhiZWtlaHJnRW9GQnRXUGtRcVJYSnRzVlR4S2puTU00U01BV2NoZUIwd0Er?=
 =?utf-8?B?QzRWc3g1WlNibmN4TVVId0pPck4wQmQ0WWJyaDBkaEl1eXF4QVo4VHdFclRO?=
 =?utf-8?B?MG5XWlAwelNHbzBwY0RkNWpMUjhCV2pObnE1R1JJMGt1c0JnQ0grNTZ1dmZ0?=
 =?utf-8?B?OWsrcTVMSm9aMW9keDFsMnhnSXRhcWtuV254eCtFK2FIVitmQy96UHdaMkJq?=
 =?utf-8?B?Tkd2M2NvYTBDWGxoRU9Zc1JZZXVzY0VjZFFvZFFqRkVQR3dpS3d4SXFWTWEx?=
 =?utf-8?B?OXBJS3pzVUxLRUdIbFV6RVlOOEUrdW5MZktpYkV5UEhnR3ladHl1b0xGUEFQ?=
 =?utf-8?B?OUZGUDJvQTlMN3IyYlE5STh3am1yVE1UTzJyVmZxbW01ZWZoNFNEbzlGS2Qy?=
 =?utf-8?B?cW1nNUVsaXZwZGIvVUJPRGRFdENPSU9JN2FMc1czelBRb2lJM2poVU9BQmdx?=
 =?utf-8?B?VmYxeU9lSUxuYk15LzZ0OThxQmN6ZDVYSHptcldTa3NLM3VtL0pOZHl2N1ov?=
 =?utf-8?B?WlBBVnF3SWIvMTZtaHlmWlUyWGJMZDR4SXMzWlIyVm40RHpXSnRRdStNUk1T?=
 =?utf-8?B?dHA1cFFCRy9rd25SUkhwWGZ3WTBDayttR3ZlYmlCM1R3YXlWaHRmOUtDUjRC?=
 =?utf-8?B?OFNTNmk5ejFLMGEvS3U5UXhyVEFDWmtOZ1pUTGZYVE5TS0NML1h6TFJhekpI?=
 =?utf-8?B?SGx5RVV2Z1BpcmNKYW91d3ZDR2lSeFJndHI0OFZUaUV1RkZMeEN3RStDRjd4?=
 =?utf-8?B?MlBjUVJOaEdyRFdJK3YwVUpwcWR5U0J2b0hQN2hzNlU5WFlteVZQdThLNmlo?=
 =?utf-8?B?OGZnRnZ2OTArYTdmUVM4VTRiRXFvdFd2MzRqSmFPYUJjQlNCcnFXbjRNVFVC?=
 =?utf-8?B?TEs1ZzBMODAwajBjNktHYUN0bE1iWGR1a2FJaDlZYkkzcWJPVE1UNmVWN2pI?=
 =?utf-8?B?S0NEMzNKYjFXOHZLOTc4YW1udGNaMnZKbnlMa0tKYnBXZCtNb3liekZlMm5E?=
 =?utf-8?B?Y2dwMVJBZXhuckNLR0g1Y3M3MTZmRjJyUUM4dkQwYlAzY3NiaXJybno2Nk1S?=
 =?utf-8?B?SkZlQzlieGVxVDZheWZrNGIvZXU3dTdLQThrNjRwWkhjWm5zMzI4bitrcDAv?=
 =?utf-8?B?VjFkUVJhRFVNSFYrNElPMHNlaEt2NmtkRjZSdUwrUkFaRVZlKzljTWRBS2J0?=
 =?utf-8?B?Nkl2eVkrUE5zVVFoVEc5YzBqY09LTjQrYkozTEpSNUhlM2d1RXUzOVBKUmc2?=
 =?utf-8?B?WkRiNjN0ZitiL3Y1R25kM0RVZXMrMEZLbFZtK0RoRnlVcnhWMzM3Q2ZRVGZO?=
 =?utf-8?B?TENNMWRIdXllMm1PNmZGMTg0cDU3c1FzZ3dOMk9DRDJ2alZ0RjUzczR5TUxX?=
 =?utf-8?B?NmNJODIzNDhQaW1VTS8rQjc2Q3M3NFFMcW8wK2VWSS9UeUZnaE5idlJwNnhX?=
 =?utf-8?B?Z1VXdFF5MjRHeXY3Y3pZWGlDeWtYMkRRMGhiK2xXMnVlYjdWMTJDaDZ5UERH?=
 =?utf-8?B?REhyU2dkSmU3K1QrclEzNmJNbkZST0hMSnJrQXFsREZ5d3U3VEJEdmU3R2Ry?=
 =?utf-8?B?aU4vTlhIeEVzY01hbzlhSlU0aHNkb2tmYXRzSjA0NlpQWnpySEpYVmxYaUNq?=
 =?utf-8?B?Nm51dW1OOXhwVHAwZTh2R2VvYm1lYTNZMVFscXdBd3g0WkdRcTYvdHYzWEVR?=
 =?utf-8?B?b1VEYW9UcXFBSEVZUkxkUnp5RythWE1xYUFnb2xQOWR2a2tCUUFNY01kZnpY?=
 =?utf-8?B?SDE5aWVRdzdaN0N5NWdkeEt5am1VblJ1dXBST3dwK21jNlVRSnkxM01XcUtq?=
 =?utf-8?B?RzIxRTdCTDZHTnpDbG1kTHc4SXk5d2w5TklodDY5STg3U0tLQVFPKzhNbno0?=
 =?utf-8?B?TzlFSVAzNTQ3cWJYeml3S1ZkR0pDY3RLcmxMOGtJRk9aU0g2VnJlZmhSV1FX?=
 =?utf-8?B?RlJNYTdzWHVxc2xDNnZkaHh1ZmtqTjhteVJ4T1Y1c29EbU1VbkxLTFRoVTFJ?=
 =?utf-8?B?TTlvTXFqeW5WbG8xVE9kaHpJTUFPcVROUE8yV3JtdlM0ajZWTGF5bFpvU1M5?=
 =?utf-8?B?R2cyQVRUcHVraEN1L210Y05jVm5TMjdxVENrV1dabzBEaXhZWUk5MHZGOTZn?=
 =?utf-8?B?bXhPWW9MeHhMeFNzOVJVcHozK3FHVE1EWXU2Y3BGOU1EbVVSRnRmamJuUnhC?=
 =?utf-8?B?U2hTNUR0UjJKSjJFVWVXYm5SbG9xUldYd2hPU2FtYTJBS0VSbVBXbHZCQUgz?=
 =?utf-8?B?R0lJMjZCc1pHRUhpd3k5bVh1NTN5SVNsZFlsRjBJdjh6ajFNcXpmZz09?=
X-Exchange-RoutingPolicyChecked: sHFzK09tJ/7xf6yVCTQVXuZxzkcwLOLAR9gN/y8s9CvLlNMZqlcH3fyutWmh2oR0aYu9qDgggrGwmFtAH1bKiOO+uj7ns6oLmUSyyRKcsxcnHGPqh3i3vD/6q5EiS/JCrGWv621SPfRPtRNIS5uCC0UUg7+kBdJBX/1tvILVhUJvd3slDRgddGbnMw19WcWsF6U9xq+SrYw8jNLl6sSyzGmDSFrD9Pqdz4xXBxOROjZaeCkSQXdIrgAEYc0BVp7dfn8f/JV3Sw7Mp0OirBpQEnIKSMjl2srGrLZPSYZcTGmgu7THjD8NAhqjtg/Ptd1TagNGi5Llc+NNktuSfE67uA==
X-MS-Exchange-CrossTenant-Network-Message-Id: adce3f8c-aa38-4da1-37a6-08dee888e1aa
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 07:06:13.7544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8blOP4p0zKgjYEV7d+fyMEF6N7wM51TxneT/tYUXJmc/5pOBIGIDF7S+u4xxEPN8g6KNp0lgIBUF30VFnfbUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFAB4263235
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


On 7/21/2026 11:31, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Add dbg_ratelimited() wrappers for Xe logging helpers.
>
> These wrappers provide a debug logging equivalent of the existing
> rate-limited error messages and allow callers to limit repeated debug
> prints to reduce log spam and makes debugging easier.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_gt_printk.h         | 3 +++
>   drivers/gpu/drm/xe/xe_gt_sriov_printk.h   | 3 +++
>   drivers/gpu/drm/xe/xe_printk.h            | 3 +++
>   drivers/gpu/drm/xe/xe_sriov_printk.h      | 3 +++
>   drivers/gpu/drm/xe/xe_tile_printk.h       | 3 +++
>   drivers/gpu/drm/xe/xe_tile_sriov_printk.h | 3 +++
>   6 files changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
> index 1313d32862db..1598098d2987 100644
> --- a/drivers/gpu/drm/xe/xe_gt_printk.h
> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
> @@ -35,6 +35,9 @@
>   #define xe_gt_dbg(_gt, _fmt, ...) \
>   	xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
>   
> +#define xe_gt_dbg_ratelimited(_gt, _fmt, ...) \
> +	xe_gt_printk((_gt), dbg_ratelimited, _fmt, ##__VA_ARGS__)
> +
>   #define xe_gt_WARN_type(_gt, _type, _condition, _fmt, ...) \
>   	xe_tile_WARN##_type((_gt)->tile, _condition, _fmt, ## __VA_ARGS__)
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_printk.h b/drivers/gpu/drm/xe/xe_gt_sriov_printk.h
> index d3457d608db8..ada0ee9f45e5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_printk.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_printk.h
> @@ -27,6 +27,9 @@
>   #define xe_gt_sriov_dbg(_gt, _fmt, ...) \
>   	__xe_gt_sriov_printk(_gt, dbg, _fmt, ##__VA_ARGS__)
>   
> +#define xe_gt_sriov_dbg_ratelimited(_gt, _fmt, ...) \
> +	__xe_gt_sriov_printk(_gt, dbg_ratelimited, _fmt, ##__VA_ARGS__)
> +
>   /* for low level noisy debug messages */
>   #ifdef CONFIG_DRM_XE_DEBUG_SRIOV
>   #define xe_gt_sriov_dbg_verbose(_gt, _fmt, ...) xe_gt_sriov_dbg(_gt, _fmt, ##__VA_ARGS__)
> diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
> index c5be2385aa95..87f51d7edfa8 100644
> --- a/drivers/gpu/drm/xe/xe_printk.h
> +++ b/drivers/gpu/drm/xe/xe_printk.h
> @@ -36,6 +36,9 @@
>   #define xe_dbg(_xe, _fmt, ...) \
>   	xe_printk((_xe), dbg, _fmt, ##__VA_ARGS__)
>   
> +#define xe_dbg_ratelimited(_xe, _fmt, ...) \
> +	xe_printk((_xe), dbg_ratelimited, _fmt, ##__VA_ARGS__)
> +
>   #define xe_WARN_type(_xe, _type, _condition, _fmt, ...) \
>   	drm_WARN##_type(&(_xe)->drm, _condition, _fmt, ## __VA_ARGS__)
>   
> diff --git a/drivers/gpu/drm/xe/xe_sriov_printk.h b/drivers/gpu/drm/xe/xe_sriov_printk.h
> index 4c6b5c3d2190..5931c918655f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_printk.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_printk.h
> @@ -36,6 +36,9 @@
>   #define xe_sriov_dbg(xe, fmt, ...) \
>   	xe_sriov_printk((xe), dbg, fmt, ##__VA_ARGS__)
>   
> +#define xe_sriov_dbg_ratelimited(xe, fmt, ...) \
> +	xe_sriov_printk((xe), dbg_ratelimited, fmt, ##__VA_ARGS__)
> +
>   /* for low level noisy debug messages */
>   #ifdef CONFIG_DRM_XE_DEBUG_SRIOV
>   #define xe_sriov_dbg_verbose(xe, fmt, ...) xe_sriov_dbg(xe, fmt, ##__VA_ARGS__)
> diff --git a/drivers/gpu/drm/xe/xe_tile_printk.h b/drivers/gpu/drm/xe/xe_tile_printk.h
> index 738433a764bd..c87c07e14fd1 100644
> --- a/drivers/gpu/drm/xe/xe_tile_printk.h
> +++ b/drivers/gpu/drm/xe/xe_tile_printk.h
> @@ -34,6 +34,9 @@
>   #define xe_tile_dbg(_tile, _fmt, ...) \
>   	xe_tile_printk((_tile), dbg, _fmt, ##__VA_ARGS__)
>   
> +#define xe_tile_dbg_ratelimited(_tile, _fmt, ...) \
> +	xe_tile_printk((_tile), dbg_ratelimited, _fmt, ##__VA_ARGS__)
> +
>   #define xe_tile_WARN_type(_tile, _type, _condition, _fmt, ...) \
>   	xe_WARN##_type((_tile)->xe, _condition, _fmt, ## __VA_ARGS__)
>   
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_printk.h b/drivers/gpu/drm/xe/xe_tile_sriov_printk.h
> index 68323512872c..c23e698bc8db 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_printk.h
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_printk.h
> @@ -27,6 +27,9 @@
>   #define xe_tile_sriov_dbg(_tile, _fmt, ...) \
>   	xe_tile_sriov_printk(_tile, dbg, _fmt, ##__VA_ARGS__)
>   
> +#define xe_tile_sriov_dbg_ratelimited(_tile, _fmt, ...) \
> +	xe_tile_sriov_printk(_tile, dbg_ratelimited, _fmt, ##__VA_ARGS__)
> +
>   #define xe_tile_sriov_dbg_verbose(_tile, _fmt, ...) \
>   	xe_tile_sriov_printk(_tile, dbg_verbose, _fmt, ##__VA_ARGS__)
>   
