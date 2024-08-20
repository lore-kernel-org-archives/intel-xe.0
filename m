Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD1AC3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 07:57:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C5010E4E1;
	Tue, 20 Aug 2024 07:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLHM2FcJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676A710E4E1
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 07:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724140625; x=1755676625;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1MrybrGAZAfPeFpxqlD4Ul+C7rAow1TpuXh1XvaXrYA=;
 b=JLHM2FcJZ1nMMkw9+3AjvOHJMUQxTjLbsOLAcAN9HOTHzRW/9t94sAeg
 v9AJZd9V1WhuO1MCUUEfBvBZ+LlFmK3r3TW2GDOp/qt0WPQe177C0CLii
 Kf2Z2Gg1j2Un2Xlq2NN27408vMeZxJfdAlUryvKC64dw19MXExvehcQSj
 xx2xDZ9NPKk+h3s9GwvsWS9hKCOEKeUbfw+57It6cdXcSX0B14FHUBmR4
 KRO0wJtD68r7wVZ6DWz23NbALduvtFquxLz1hrhYJ8FZW0Sbqhx5dzII5
 AdI/w+QbaiOLl2kZlPw/SXrFF12KmvbEWfAMbqA67FkR+gs3l0LBsqEuL Q==;
X-CSE-ConnectionGUID: q0LWR9tmRfyBcGcKlkXG2w==
X-CSE-MsgGUID: NlKShEzlQ02WIzn0gvtCzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22392450"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="22392450"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 00:57:03 -0700
X-CSE-ConnectionGUID: RXdQwgBuQKyGIqVB6aC5fA==
X-CSE-MsgGUID: fHiSbsOlTS6LrGzjEkw/XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="64825822"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 00:57:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 00:57:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 00:57:00 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 00:57:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6tAEKRZK2LQPCPzy2hHGF8OEo/NZ2UW8u7Zt/NidSESEU/2hbFET8okz7eCq703VsAf1T31HouMuLQpO7R4HlLReSL/zh0Ru6+BFV/lRL2llx21oTn2SH+UJDYuzNjWhgi1TLE+RMDed/QUaOSLZLTkliPDPFu6/AFhmuTyXoi2IfUM+i3Br/rq/IHSTYk3VKzjp6LbWMI2jfK171w5oRTPCkROCXNKT5oMNxeEpe0HlNV0OZAqTDuaqtDMCYTvlxCCLQzbcJCsA0Q00R3GZXhp5jw3+Ezm6KshYyuq+KQ1P8zN7er0GyqKTN1eg0WvYDkBmuV5JeyI2HphaI6lmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mo7A14yKpC/DDkHEdCvIYAJURlEnCxhxaG+cmcUTXa4=;
 b=yQF8Ei+O7CthceNbeIh5k5PtSUzgYk3g0CZe6pnG+nxML+acojIfU88t/PAjZrog/DA3/r0C2HyFbkn/3ciEKRbA2jhbrWrhNUeWQ33FkDXNDHeerXEfJojZ+g3VsAESEM08pAzC0ujzjW0Lg+V86C6ganE6dA/FS4G2/Eb/jRY20C/iXYN0+1KcwCO0X0jNYQzhzg3r/CqK00JK941XXsDCyU0ddstKzt4RLpxBHA0quQg1tER1cUxv9ZH66xD+qcPh/PXan3xiSrJMs9Mz+2DbqsVpHefhAD2q4baG1hHn6pVUnNRWC+fgKcsEo+Zhx+3DEin6c/2Z7TyDFIVE7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB7793.namprd11.prod.outlook.com (2603:10b6:610:129::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 07:56:56 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%3]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 07:56:56 +0000
Date: Tue, 20 Aug 2024 09:56:51 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 04/12] drm/xe/pf: Improve VF control
Message-ID: <20240820075651.lpp67i3m2uponipo@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240809165159.662-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI0P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: 0096f1dd-878f-401e-0f26-08dcc0eda952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHZQWUpOZk1VeHV0dzFHMFBQUmxWWnY5UFNRVXdTSW55byt4dGpGbVpmWjlK?=
 =?utf-8?B?NWw1YVdER2JRY0F1OFdYemd0d3M3bmRmUzZpQ1RMa00vNmFKVVZzSFlhcGNs?=
 =?utf-8?B?YTFIK1d4QVNaMXNGRjBQZFB5SjQwQnBCM1VjbzhSN3hNRS9pNzJhOUxGM1p3?=
 =?utf-8?B?bGY1N1RKSi85Q1huNk41NlRQbW5FdnBjbThuLzZoLzM3b3ZiT0RHSXRreXpY?=
 =?utf-8?B?TXh6bFRqeWNzMkllaU5YM1RmMysxM1UvUU94U00ybTJZcDlWTmhmZXpmaXVm?=
 =?utf-8?B?cHhDaitpc2NwT3ZRaUFmRVpmWjNTazRqNHpwampaRzQ5MDIrM1Q5eXN2QVZR?=
 =?utf-8?B?TWlkZUwvdUZadXV0Q253YnMwbzdIc2dJcmxPc0Y4SVYvZVFrekxNYlp5TUtK?=
 =?utf-8?B?S0xWN21xNUdaaTRXUVFrQWpSVnkraUJlQ0pHWUR3YTdIVW92dDNnRkI3Tjd1?=
 =?utf-8?B?ak9PVEhiTlYvWm0yMXNGa29EdldGMGxzWXF6a013VXNQT0RxWE9lK3g2UTJn?=
 =?utf-8?B?d3haeEFhNUFxdnJ4ZWh3VlZVTXk4OW5YUjVSbWwxbHZYajdSU3NLeVNJeXdm?=
 =?utf-8?B?RlZrcXJoQkpmR2tLSTh3QVVJL2YzeTcxSFluU2RxR1lwNjNIS3VneE1VY0p1?=
 =?utf-8?B?TzhoUDlFay91bkN2S2NpS0VWSW5RdklzR0NKSTE4dWQ2Wm1FVHdaSVNyYWFs?=
 =?utf-8?B?QUpTMHNabTN1QjV4SHJkeDN1VmlDa2l1ZllYdGNBaXpMM0U4U0tMbkJrWlVK?=
 =?utf-8?B?aENhdWNVQ2gwSEduOHUrMDNySjhETDB6QXlQajFmNEdQb3J1WTNpRkN2NGUr?=
 =?utf-8?B?Y3haV1dFY25JWWFlYnZuNWhxMFhOWHJIdnFEUE41dmpaejliUjIyZjNpVlor?=
 =?utf-8?B?bFVIQnh5TWpDWktZb0RjbVhwNzBSNjNPR1pWb21aeVNwRVJCdGQ5M0Z2cHpl?=
 =?utf-8?B?d1VzK0VIR29BdHlBY1h6YUpSNmljeUY2SXhTaDF0aEVXS0pYZVd0bzZMSUdF?=
 =?utf-8?B?d3FjM04xbVZza3RIU1BFK0NkaGxpNjRvMGpzY2VKM2RiaXhpU1ZXOHF2c2pD?=
 =?utf-8?B?OGUrenZVTUN0aENMSzYzUHkwcDQ1S1RndzJheGo5cnNDRmw0NHVrR2FmMGJa?=
 =?utf-8?B?SllvWXJyY3kyS1kvRTUxczlpcUF0aXNId2h2VU1tT2JNaHMxVjZzV3ZYWElZ?=
 =?utf-8?B?YUFDZDBYRUY2UnFWaVJDb0l1ZEVOcE1Ib2Z5ZHE5M2Z6QkU2dmZWVlZuMEFF?=
 =?utf-8?B?VlpJN04vdnRFWnYyUVlhMHVYNkI2eUp5VnIwUkZFUDRDQjgzQXZFMFB4TkFT?=
 =?utf-8?B?ZHZiMHgydy9DOVV0MCs1dnlZemNqMHFGNXN0RWlIblR3OU1tdGh0aVh2M1hr?=
 =?utf-8?B?bWRsam1SUFpvOUtiWk9LQ0hJS1I5QmhCYU9udTVwVk5RMDZGTnp2dHR4Y0VH?=
 =?utf-8?B?T0lFYUVMMUVhdEJBWVZqaExteTZoVmNyVXBFSTEwYjloc0JuSlJXdU9iM2g4?=
 =?utf-8?B?TUtvUjlCV0VBbTR0M1g4NnZ2SFR0ZkxvSHJtbDN4TzJXL0s2QjVRcitybUQ5?=
 =?utf-8?B?LyttWnI0SSsyM2ZLcEJ6cFRuU0l5ZzFMMkN1YTN5M2tvc0t5RU92d24zRy9n?=
 =?utf-8?B?RVowMzFuWEpGY3QxWDZ0YS95cCtSMU1MOVBySGQ2TzVuZTVhcU1wWFA2YTlQ?=
 =?utf-8?B?cFBFcmcyV1lYUWEzZTUzLzFnMW1QTEdDQyt6aWc5QTRsVXBWVlU1QzNpTjl2?=
 =?utf-8?B?QzRNUHdmSVFqbHh5b0g1bStKeS94azZYa1VoaUJvRzNYUUZGMEYrOUxmUS9p?=
 =?utf-8?B?UEFkckdkcXVyUUY5b3NYQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anFHN2gwVWVBRzBYWmRaK1ljaExOZ3RqWHJPclFQSHFIZ05XK0UxS2l1MHZs?=
 =?utf-8?B?RDcvTmo0ZGFxU2RPS0loOE1FREI3V21aVHNyNkRoNytpcjJMeFNzMWpoZjIy?=
 =?utf-8?B?Yk5pclRMa1BNemhRN1VwejVwekVNM05jcDRidjJjOG1McFNPTG0zVW01VmlS?=
 =?utf-8?B?d0xRQ2hhY3kwcEwzSW5lWEdSaHVmWncrRDlMYTUra1FHdTRoMldtZ21XNDRj?=
 =?utf-8?B?RzI5QnpDVjZMNzVFUldHMUNsSGpkbXBxS25WamE5Y3ZSS3daU2JWTDMwRGhT?=
 =?utf-8?B?TTQ4S3RWZTFIQksrQWUzYklTeTFrb0pJUzRXOHRTY1B0V1FTOE9qWWJGTkww?=
 =?utf-8?B?cUlKNy9nbFJLYVhQQlJ3bm1ZbU9QanR6V1d0aUJNdkFrUzllV2IvMWs4Zmll?=
 =?utf-8?B?cnBzVXFjZWk2cXdaVWhwT3V2ZXVUZkRtRmlUYzFobU5oY2dldXdwUjZjeFAx?=
 =?utf-8?B?eDR1L1JLbjJVWDlwSWpSUm1CcGRCb2h4S09nZlV2VDFicGZFVDJNc0x3YjVS?=
 =?utf-8?B?TGNPaUxKbmNmMmJSK1NMNTYxMVBvc2hqRHgyTVNwZE5BNjVDcGk1c2tHb1dU?=
 =?utf-8?B?L1pxUzB6SmxWblBaRWt6U2xpWjV1UEpFTmg1ZjlGb3c5UmNCZzBWQUhBRy92?=
 =?utf-8?B?TUNDYkZxYWdMb05WVjl4ZGZFcHhBVFRVbS9Dd2F1MWZDSXVkMm80Yk52b1J4?=
 =?utf-8?B?K2NIdGFIWWIyZ2RTRmtZZjdxcWFQaFNrV0xpQnpwUWdvN2tsdkt0MGlIaUlj?=
 =?utf-8?B?UndiU3RvYmFrNzJmenZycmpIR1BoOTdUTzBlTnpsSUM2NEkzWWZnNWtWOXdY?=
 =?utf-8?B?YlphVzFKbjRzaHFGUzJMRDdrZDJXMm5ZVy8vNVMvWTl1NEMyT2hjeU1pY21N?=
 =?utf-8?B?ejFmSjI2TGJ3azNyeE9Ec29taTBjTGZlWG81U0VrbXJ2NDBLWnpDUGl1Zm9L?=
 =?utf-8?B?Qi9lc2ZBTGdzNzdXWHdxVlhjdGJUcmRuS3hJVlZxbVhuMmZ0dUN1VllYeDVS?=
 =?utf-8?B?bzVUaTFndGd6UkhWdnlKelE4d1ZLQ2hpdFJBYkRPOWxzVkRIanZxbUxFd2JZ?=
 =?utf-8?B?dlVtblBqWU9RL0NhdlBFTFdCSjBMRXVGcTJneGc1VHhJQmVHNFV3QzU4NXQv?=
 =?utf-8?B?YytzKzBZSXBiRG5wZE41NERUYUhUSVVsVllxUU5OSjVzb0RCRHd0MHFTVlBY?=
 =?utf-8?B?dEJQeTB4Q1cxK05wMk5CR2RrQ0xWR1ViYTJmK0ptSEZOejdhaW9TaVlla1F1?=
 =?utf-8?B?ODZ1NEh2VlVwbC9UbXVxTUszRERMQS9pRGY0Ly9uZW50QVl3aUNRODBwWGM1?=
 =?utf-8?B?TTFOWnJNKzh2SFhJTnZiWXV2cWJCazVlbWVyWHp6b3ZkUWxwM01RNzU3cmVP?=
 =?utf-8?B?VDdRYUFWUkJNRjhPbXlvVjNYd3VlZkxmendsdUsybVBvckxjb3VJbkY5WGlp?=
 =?utf-8?B?Z1dLZ3RBSDJTLy83dWRtYksrRlNPYnYrNzdSNWpraHFET2QweGVSb0M5TENt?=
 =?utf-8?B?Nk1FT24rdkNvZXY5NFhWclJZSGlsbVdacTB3TUplT2NQNjVHN0JabHlzS1RU?=
 =?utf-8?B?MXlxSWZmOXJCVFZxNGdKNzZmRUhRcjJXeVUvZUpNeWhtbllISVpjakpHOXFE?=
 =?utf-8?B?OC9TY3Y2TjRJZ1YzL3phVHJkSys2UlNuOGdWNU9WYlVmYytMQmJZL3N1c0xX?=
 =?utf-8?B?YVp5QnVTbzJLWFlZRUNOT1ZRWHZEcU14ZUc0Vk9hVW5vRHJZZlUvd0U3ZFRF?=
 =?utf-8?B?S3JQdTZ1cURHMlpIa0pJZ0grZ1QrZFlJVW11RzBTVGtrN2JObUFoN0pacDM0?=
 =?utf-8?B?Sm80RmlWWkhURzdIeWd2anh6aWVqRG15SVRtb0tWME9IWWtzUmZBeEZDdEQw?=
 =?utf-8?B?d0tudXBUcmVaZEptQXR2cm03TGJUcm0zaHdmNUp3OHVDOVAva1JoM2R2d2ds?=
 =?utf-8?B?Ym9pQitVV05Vb3FzV2ZuYjFsUURVQm9tSVovdlhseUwzNWpjU1h3MnVkM1V5?=
 =?utf-8?B?UExweFYzTk9WWTczWDM0QWVnb2RrVUoyazV6NHQ5NmpBMWhSVmR3VGJlVGpO?=
 =?utf-8?B?dXBpeE96a095YTZ4Y011ek0ydld0T1F4clh1M0Q5QWl6ZW5NTldpMkJVa3JO?=
 =?utf-8?B?TnhqeTlNcFR3RUd5MTd5NmdtOXoxTWFjNThoTFliTnRJVnpJbDdiZVcrb01q?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0096f1dd-878f-401e-0f26-08dcc0eda952
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 07:56:56.2227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTM0GGFzq+NhwTho4tKI9VEYLleXZgTl51fF0nzgQctEXWp4hL3YO5xzlm4Q627pt1h9FLBlSEfHoqIMTV98xO498twBnbPbCCEqLc45Ibo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7793
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-sie-09 18:51:51 +0200]:
> Our initial VF control implementation was focused on providing
> a very minimal support for the VF_STATE_NOTIFY events just to
> meet GuC requirements, without tracking a VF state or doing any
> expected actions (like cleanup in case of the FLR notification).
> 
> Try to improve this by defining set of VF state machines, each
> responsible for processing one activity (PAUSE, RESUME, STOP or
> FLR). All required steps defined by the VF state machine are then
> executed by the PF worker from the dedicated workqueue.
> 
> Any external requests or notifications simply try to transition
> between the states to trigger a work and then wait for that work
> to finish. Some predefined default timeouts are used to avoid
> changing existing API calls, but it should be easy to extend the
> control API to also accept specific timeout values.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |    6 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 1203 ++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |    3 +
>  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  107 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |    6 +
>  5 files changed, 1310 insertions(+), 15 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index ef239440963c..905f409db74b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -9,6 +9,7 @@
>  
>  #include "xe_gt_sriov_pf.h"
>  #include "xe_gt_sriov_pf_config.h"
> +#include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_service.h"
>  #include "xe_mmio.h"
> @@ -57,6 +58,10 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	err = xe_gt_sriov_pf_control_init(gt);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
> @@ -93,4 +98,5 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
>  void xe_gt_sriov_pf_restart(struct xe_gt *gt)
>  {
>  	xe_gt_sriov_pf_config_restart(gt);
> +	xe_gt_sriov_pf_control_restart(gt);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index ad447d867e51..1ed7d49bef8c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -3,12 +3,17 @@
>   * Copyright © 2023-2024 Intel Corporation
>   */
>  
> +#include <drm/drm_managed.h>
> +
>  #include "abi/guc_actions_sriov_abi.h"
>  
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_gt_sriov_pf_config.h"
>  #include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_helpers.h"
> +#include "xe_gt_sriov_pf_monitor.h"
> +#include "xe_gt_sriov_pf_service.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
> @@ -42,10 +47,6 @@ static int guc_action_vf_control_cmd(struct xe_guc *guc, u32 vfid, u32 cmd)
>  	};
>  	int ret;
>  
> -	/* XXX those two commands are now sent from the G2H handler */
> -	if (cmd == GUC_PF_TRIGGER_VF_FLR_START || cmd == GUC_PF_TRIGGER_VF_FLR_FINISH)
> -		return xe_guc_ct_send_g2h_handler(&guc->ct, request, ARRAY_SIZE(request));
> -
>  	ret = xe_guc_ct_send_block(&guc->ct, request, ARRAY_SIZE(request));
>  	return ret > 0 ? -EPROTO : ret;
>  }
> @@ -55,6 +56,8 @@ static int pf_send_vf_control_cmd(struct xe_gt *gt, unsigned int vfid, u32 cmd)
>  	int err;
>  
>  	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_sriov_dbg_verbose(gt, "sending VF%u control command %s\n",
> +				vfid, control_cmd_to_string(cmd));
>  
>  	err = guc_action_vf_control_cmd(&gt->uc.guc, vfid, cmd);
>  	if (unlikely(err))
> @@ -88,6 +91,457 @@ static int pf_send_vf_flr_finish(struct xe_gt *gt, unsigned int vfid)
>  	return pf_send_vf_control_cmd(gt, vfid, GUC_PF_TRIGGER_VF_FLR_FINISH);
>  }
>  
> +/**
> + * DOC: The VF state machine
> + *
> + * The simplified VF state machine could be presented as::
> + *
> + *	               pause--------------------------o
> + *	              /                               |
> + *	             /                                v
> + *	      (READY)<------------------resume-----(PAUSED)
> + *	         ^   \                             /    /
> + *	         |    \                           /    /
> + *	         |     stop---->(STOPPED)<----stop    /
> + *	         |                  /                /
> + *	         |                 /                /
> + *	         o--------<-----flr                /
> + *	          \                               /
> + *	           o------<--------------------flr
> + *
> + * Where:
> + *
> + * * READY - represents a state in which VF is fully operable
> + * * PAUSED - represents a state in which VF activity is temporarily suspended
> + * * STOPPED - represents a state in which VF activity is definitely halted
> + * * pause - represents a request to temporarily suspend VF activity
> + * * resume - represents a request to resume VF activity
> + * * stop - represents a request to definitely halt VF activity
> + * * flr - represents a request to perform VF FLR to restore VF activity
> + *
> + * However, each state transition requires additional steps that involves
> + * communication with GuC that might fail or be interrupted by other requests::
> + *
> + *	                   .................................WIP....
> + *	                   :                                      :
> + *	          pause--------------------->PAUSE_WIP----------------------------o
> + *	         /         :                /         \           :               |
> + *	        /          :    o----<---stop          flr--o     :               |
> + *	       /           :    |           \         /     |     :               V
> + *	 (READY)<---------------+------------RESUME_WIP<----+--<-----resume--(PAUSED)
> + *	  ^ \  \           :    |                           |     :          /   /
> + *	  |  \  \          :    |                           |     :         /   /
> + *	  |   \  \         :    |                           |     :        /   /
> + *	  |    \  \        :    o----<----------------------+--<-------stop   /
> + *	  |     \  \       :    |                           |     :          /
> + *	  |      \  \      :    V                           |     :         /
> + *	  |       \  stop----->STOP_WIP---------flr--->-----o     :        /
> + *	  |        \       :    |                           |     :       /
> + *	  |         \      :    |                           V     :      /
> + *	  |          flr--------+----->----------------->FLR_WIP<-----flr
> + *	  |                :    |                        /  ^     :
> + *	  |                :    |                       /   |     :
> + *	  o--------<-------:----+-----<----------------o    |     :
> + *	                   :    |                           |     :
> + *	                   :....|...........................|.....:
> + *	                        |                           |
> + *	                        V                           |
> + *	                     (STOPPED)--------------------flr
> + *
> + * For details about each internal WIP state machine see:
> + *
> + * * `The VF PAUSE state machine`_
> + * * `The VF RESUME state machine`_
> + * * `The VF STOP state machine`_
> + * * `The VF FLR state machine`_


Later in the code there is one state that is not obvious when you look at the first
two drawings of the state machine - it is the resumed state. It appears in subsequent
drawings but in my opinion it is not obvious. I have already talked to Michal about it
and he explained to me why he introduced it in the code, but it seems to me that it
should be included at least in this drawing.

> + */
> +
> +#ifdef CONFIG_DRM_XE_DEBUG_SRIOV
> +static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
> +{
> +	switch (bit) {
> +#define CASE2STR(_X) \
> +	case XE_GT_SRIOV_STATE_##_X: return #_X
> +	CASE2STR(WIP);
> +	CASE2STR(FLR_WIP);
> +	CASE2STR(FLR_SEND_START);
> +	CASE2STR(FLR_WAIT_GUC);
> +	CASE2STR(FLR_GUC_DONE);
> +	CASE2STR(FLR_RESET_CONFIG);
> +	CASE2STR(FLR_RESET_DATA);
> +	CASE2STR(FLR_RESET_MMIO);
> +	CASE2STR(FLR_SEND_FINISH);
> +	CASE2STR(FLR_FAILED);
> +	CASE2STR(PAUSE_WIP);
> +	CASE2STR(PAUSE_SEND_PAUSE);
> +	CASE2STR(PAUSE_WAIT_GUC);
> +	CASE2STR(PAUSE_GUC_DONE);
> +	CASE2STR(PAUSE_FAILED);
> +	CASE2STR(PAUSED);
> +	CASE2STR(RESUME_WIP);
> +	CASE2STR(RESUME_SEND_RESUME);
> +	CASE2STR(RESUME_FAILED);
> +	CASE2STR(RESUMED);
> +	CASE2STR(STOP_WIP);
> +	CASE2STR(STOP_SEND_STOP);
> +	CASE2STR(STOP_FAILED);
> +	CASE2STR(STOPPED);
> +	CASE2STR(MISMATCH);
> +#undef  CASE2STR
> +	default: return "?";
> +	}
> +}
> +#endif
> +
> +static unsigned long pf_get_default_timeout(enum xe_gt_sriov_control_bits bit)
> +{
> +	switch (bit) {
> +	case XE_GT_SRIOV_STATE_FLR_WAIT_GUC:
> +	case XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC:
> +		return HZ / 2;
> +	case XE_GT_SRIOV_STATE_FLR_WIP:
> +	case XE_GT_SRIOV_STATE_FLR_RESET_CONFIG:
> +		return 5 * HZ;
> +	default:
> +		return HZ;
> +	}
> +}
> +
> +static unsigned long *pf_peek_vf_state(struct xe_gt *gt, unsigned int vfid)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid <= xe_gt_sriov_pf_get_totalvfs(gt));
> +
> +	return &gt->sriov.pf.vfs[vfid].control.state;
> +}

NIT: Later in the code you define such a function as pf_peek_vf_control.
Maybe you define it earlier and use it in pf_peek_vf_state ? The code will reduce by two asserts
> +
> +static bool pf_check_vf_state(struct xe_gt *gt, unsigned int vfid,
> +			      enum xe_gt_sriov_control_bits bit)
> +{
> +	return test_bit(bit, pf_peek_vf_state(gt, vfid));
> +}
> +
> +static void pf_dump_vf_state(struct xe_gt *gt, unsigned int vfid)
> +{
> +	unsigned long state = *pf_peek_vf_state(gt, vfid);
> +	enum xe_gt_sriov_control_bits bit;
> +
> +	if (state) {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u state %#lx%s%*pbl\n",
> +					vfid, state, state ? " bits " : "",
> +					(int)BITS_PER_LONG, &state);
> +		for_each_set_bit(bit, &state, BITS_PER_LONG)
> +			xe_gt_sriov_dbg_verbose(gt, "VF%u state %s(%d)\n",
> +						vfid, control_bit_to_string(bit), bit);
> +	} else {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u state READY\n", vfid);
> +	}
> +}
> +
> +static bool pf_expect_vf_state(struct xe_gt *gt, unsigned int vfid,
> +			       enum xe_gt_sriov_control_bits bit)
> +{
> +	bool result = pf_check_vf_state(gt, vfid, bit);
> +
> +	if (unlikely(!result))
> +		pf_dump_vf_state(gt, vfid);
> +
> +	return result;
> +}
> +
> +static bool pf_expect_vf_not_state(struct xe_gt *gt, unsigned int vfid,
> +				   enum xe_gt_sriov_control_bits bit)
> +{
> +	bool result = !pf_check_vf_state(gt, vfid, bit);
> +
> +	if (unlikely(!result))
> +		pf_dump_vf_state(gt, vfid);
> +
> +	return result;
> +}
> +
> +static bool pf_enter_vf_state(struct xe_gt *gt, unsigned int vfid,
> +			      enum xe_gt_sriov_control_bits bit)
> +{
> +	if (!test_and_set_bit(bit, pf_peek_vf_state(gt, vfid))) {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u state %s(%d) enter\n",
> +					vfid, control_bit_to_string(bit), bit);
> +		return true;
> +	}
> +	return false;
> +}
> +
> +static bool pf_exit_vf_state(struct xe_gt *gt, unsigned int vfid,
> +			     enum xe_gt_sriov_control_bits bit)
> +{
> +	if (test_and_clear_bit(bit, pf_peek_vf_state(gt, vfid))) {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u state %s(%d) exit\n",
> +					vfid, control_bit_to_string(bit), bit);
> +		return true;
> +	}
> +	return false;
> +}
> +
> +static void pf_escape_vf_state(struct xe_gt *gt, unsigned int vfid,
> +			       enum xe_gt_sriov_control_bits bit)
> +{
> +	if (pf_exit_vf_state(gt, vfid, bit))
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u state %s(%d) escaped by %ps\n",
> +					vfid, control_bit_to_string(bit), bit,
> +					__builtin_return_address(0));
> +}
> +
> +static void pf_enter_vf_mismatch(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MISMATCH)) {
> +		xe_gt_sriov_dbg(gt, "VF%u state mismatch detected by %ps\n",
> +				vfid, __builtin_return_address(0));
> +		pf_dump_vf_state(gt, vfid);
> +	}
> +}
> +
> +static void pf_exit_vf_mismatch(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MISMATCH))
> +		xe_gt_sriov_dbg(gt, "VF%u state mismatch cleared by %ps\n",
> +				vfid, __builtin_return_address(0));
> +
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_FAILED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_FAILED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_FAILED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED);
> +}
> +
> +#define pf_enter_vf_state_machine_bug(gt, vfid) ({	\
> +	pf_enter_vf_mismatch((gt), (vfid));		\
> +})
> +
> +static struct xe_gt_sriov_control_state *pf_pick_vf_control(struct xe_gt *gt, unsigned int vfid)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid <= xe_gt_sriov_pf_get_totalvfs(gt));
> +
> +	return &gt->sriov.pf.vfs[vfid].control;
> +}
> +
> +static void pf_queue_control_worker(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> +
> +	queue_work(xe->sriov.wq, &gt->sriov.pf.control.worker);
> +}
> +
> +static void pf_queue_vf(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_pf_control *pfc = &gt->sriov.pf.control;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	spin_lock(&pfc->lock);
> +	list_move_tail(&gt->sriov.pf.vfs[vfid].control.link, &pfc->list);
> +	spin_unlock(&pfc->lock);
> +
> +	pf_queue_control_worker(gt);
> +}
> +
> +static void pf_exit_vf_flr_wip(struct xe_gt *gt, unsigned int vfid);
> +static void pf_exit_vf_stop_wip(struct xe_gt *gt, unsigned int vfid);
> +static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid);
> +static void pf_exit_vf_resume_wip(struct xe_gt *gt, unsigned int vfid);
> +
> +static bool pf_enter_vf_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_WIP)) {
> +		struct xe_gt_sriov_control_state *cs = pf_pick_vf_control(gt, vfid);
> +
> +		reinit_completion(&cs->done);
> +		return true;
> +	}
> +	return false;
> +}
> +
> +static void pf_exit_vf_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_WIP)) {
> +		struct xe_gt_sriov_control_state *cs = pf_pick_vf_control(gt, vfid);
> +
> +		pf_exit_vf_flr_wip(gt, vfid);
> +		pf_exit_vf_stop_wip(gt, vfid);
> +		pf_exit_vf_pause_wip(gt, vfid);
> +		pf_exit_vf_resume_wip(gt, vfid);
> +
> +		complete_all(&cs->done);
> +	}
> +}
> +
> +static int pf_wait_vf_wip_done(struct xe_gt *gt, unsigned int vfid, unsigned long timeout)
> +{
> +	struct xe_gt_sriov_control_state *cs = pf_pick_vf_control(gt, vfid);
> +
> +	return wait_for_completion_timeout(&cs->done, timeout) ? 0 : -ETIMEDOUT;
> +}
> +
> +static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
> +	pf_exit_vf_mismatch(gt, vfid);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +/**
> + * DOC: The VF PAUSE state machine
> + *
> + * The VF PAUSE state machine looks like::
> + *
> + *	 (READY,RESUMED)<-------------<---------------------o---------o
> + *	    |                                                \         \
> + *	   pause                                              \         \
> + *	    |                                                  \         \
> + *	....V...........................PAUSE_WIP........       \         \
> + *	:    \                                          :        o         \
> + *	:     \   o------<-----busy                     :        |          \
> + *	:      \ /              /                       :        |           |
> + *	:       PAUSE_SEND_PAUSE ---failed--->----------o--->(PAUSE_FAILED)  |
> + *	:        |              \                       :        |           |
> + *	:      acked             rejected---->----------o--->(MISMATCH)     /
> + *	:        |                                      :                  /
> + *	:        v                                      :                 /
> + *	:       PAUSE_WAIT_GUC                          :                /
> + *	:        |                                      :               /
> + *	:       done                                    :              /
> + *	:        |                                      :             /
> + *	:        v                                      :            /
> + *	:       PAUSE_GUC_DONE                          o-----restart
> + *	:      /                                        :
> + *	:     /                                         :
> + *	:....o..............o...............o...........:
> + *	     |              |               |
> + *	  completed        flr             stop
> + *	     |              |               |
> + *	     V         .....V.....    ......V.....
> + *	 (PAUSED)      : FLR_WIP :    : STOP_WIP :
> + *	               :.........:    :..........:
> + *
> + * For the full state machine view, see `The VF state machine`_.
> + */
> +
> +static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WIP)) {
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE);
> +	}
> +}
> +
> +static void pf_enter_vf_paused(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
> +	pf_exit_vf_mismatch(gt, vfid);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static void pf_enter_vf_pause_completed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_paused(gt, vfid);
> +}
> +
> +static void pf_enter_vf_pause_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_FAILED);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static void pf_enter_vf_pause_rejected(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_mismatch(gt, vfid);
> +	pf_enter_vf_pause_failed(gt, vfid);
> +}
> +
> +static bool pf_exit_vf_pause_guc_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE))
> +		return false;
> +
> +	pf_enter_vf_pause_completed(gt, vfid);
> +	return true;
> +}
> +
> +static void pf_enter_vf_pause_guc_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE))
> +		pf_queue_vf(gt, vfid);
> +}
> +
> +static void pf_enter_pause_wait_guc(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +}
> +
> +static bool pf_exit_pause_wait_guc(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC);
> +}
> +
> +static void pf_enter_vf_pause_send_pause(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_queue_vf(gt, vfid);
> +}
> +
> +static bool pf_exit_vf_pause_send_pause(struct xe_gt *gt, unsigned int vfid)
> +{
> +	int err;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE))
> +		return false;
> +
> +	/* GuC may actually send a PAUSE_DONE before we get a RESPONSE */
> +	pf_enter_pause_wait_guc(gt, vfid);
> +
> +	err = pf_send_vf_pause(gt, vfid);
> +	if (err) {
> +		/* send failed, so we shouldn't expect PAUSE_DONE from GuC */
> +		pf_exit_pause_wait_guc(gt, vfid);
> +
> +		if (err == -EBUSY)
> +			pf_enter_vf_pause_send_pause(gt, vfid);
> +		else if (err == -EIO)
> +			pf_enter_vf_pause_rejected(gt, vfid);
> +		else
> +			pf_enter_vf_pause_failed(gt, vfid);
> +	} else {
> +		/*
> +		 * we have already moved to WAIT_GUC, maybe even to GUC_DONE
> +		 * but since GuC didn't complain, we may clear MISMATCH
> +		 */
> +		pf_exit_vf_mismatch(gt, vfid);
> +	}
> +
> +	return true;
> +}
> +
> +static bool pf_enter_vf_pause_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WIP)) {
> +		pf_enter_vf_wip(gt, vfid);
> +		pf_enter_vf_pause_send_pause(gt, vfid);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_control_pause_vf - Pause a VF.
>   * @gt: the &xe_gt
> @@ -99,7 +553,140 @@ static int pf_send_vf_flr_finish(struct xe_gt *gt, unsigned int vfid)
>   */
>  int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid)
>  {
> -	return pf_send_vf_pause(gt, vfid);
> +	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_PAUSE_WIP);
> +	int err;
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
> +		return -EPERM;
> +	}
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u was already paused!\n", vfid);
> +		return -ESTALE;
> +	}
> +
> +	if (!pf_enter_vf_pause_wip(gt, vfid)) {
> +		xe_gt_sriov_dbg(gt, "VF%u pause already in progress!\n", vfid);
> +		return -EALREADY;
> +	}
> +
> +	err = pf_wait_vf_wip_done(gt, vfid, timeout);
> +	if (err) {
> +		xe_gt_sriov_dbg(gt, "VF%u pause didn't finish in %u ms (%pe)\n",
> +				vfid, jiffies_to_msecs(timeout), ERR_PTR(err));
> +		return err;
> +	}
> +
> +	if (pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
> +		xe_gt_sriov_info(gt, "VF%u paused!\n", vfid);
> +		return 0;
> +	}
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_FAILED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u pause failed!\n", vfid);
> +		return -EIO;
> +	}
> +
> +	xe_gt_sriov_dbg(gt, "VF%u pause was canceled!\n", vfid);
> +	return -ECANCELED;
> +}
> +
> +/**
> + * DOC: The VF RESUME state machine
> + *
> + * The VF RESUME state machine looks like::
> + *
> + *	 (PAUSED)<-----------------<------------------------o
> + *	    |                                                \
> + *	   resume                                             \
> + *	    |                                                  \
> + *	....V............................RESUME_WIP......       \
> + *	:    \                                          :        o
> + *	:     \   o-------<-----busy                    :        |
> + *	:      \ /                /                     :        |
> + *	:       RESUME_SEND_RESUME ---failed--->--------o--->(RESUME_FAILED)
> + *	:       /                \                      :        |
> + *	:    acked                rejected---->---------o--->(MISMATCH)
> + *	:     /                                         :
> + *	:....o..............o...............o.....o.....:
> + *	     |              |               |      \
> + *	  completed        flr            stop      restart-->(READY)
> + *	     |              |               |
> + *	     V         .....V.....    ......V.....
> + *	 (RESUMED)     : FLR_WIP :    : STOP_WIP :
> + *	               :.........:    :..........:
> + *
> + * For the full state machine view, see `The VF state machine`_.
> + */
> +
> +static void pf_exit_vf_resume_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_WIP))
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_SEND_RESUME);
> +}
> +
> +static void pf_enter_vf_resumed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> +	pf_exit_vf_mismatch(gt, vfid);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static void pf_enter_vf_resume_completed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_resumed(gt, vfid);
> +}
> +
> +static void pf_enter_vf_resume_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_FAILED);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static void pf_enter_vf_resume_rejected(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_mismatch(gt, vfid);
> +	pf_enter_vf_resume_failed(gt, vfid);
> +}
> +
> +static void pf_enter_vf_resume_send_resume(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_SEND_RESUME))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_queue_vf(gt, vfid);
> +}
> +
> +static bool pf_exit_vf_resume_send_resume(struct xe_gt *gt, unsigned int vfid)
> +{
> +	int err;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_SEND_RESUME))
> +		return false;
> +
> +	err = pf_send_vf_resume(gt, vfid);
> +	if (err == -EBUSY)
> +		pf_enter_vf_resume_send_resume(gt, vfid);
> +	else if (err == -EIO)
> +		pf_enter_vf_resume_rejected(gt, vfid);
> +	else if (err)
> +		pf_enter_vf_resume_failed(gt, vfid);
> +	else
> +		pf_enter_vf_resume_completed(gt, vfid);
> +	return true;
> +}
> +
> +static bool pf_enter_vf_resume_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_WIP)) {
> +		pf_enter_vf_wip(gt, vfid);
> +		pf_enter_vf_resume_send_resume(gt, vfid);
> +		return true;
> +	}
> +
> +	return false;
>  }
>  
>  /**
> @@ -113,7 +700,133 @@ int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid)
>   */
>  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
>  {
> -	return pf_send_vf_resume(gt, vfid);
> +	int err;
> +
> +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
> +		return -EPERM;
> +	}
> +
> +	if (!pf_enter_vf_resume_wip(gt, vfid)) {
> +		xe_gt_sriov_dbg(gt, "VF%u resume already in progress!\n", vfid);
> +		return -EALREADY;
> +	}
> +
> +	err = pf_wait_vf_wip_done(gt, vfid, 2 * HZ);

use define, or pf_get_default_timeout for this timeout


> +	if (err)
> +		return err;
> +
> +	if (pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED)) {
> +		xe_gt_sriov_info(gt, "VF%u resumed!\n", vfid);
> +		return 0;
> +	}
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_FAILED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u resume failed!\n", vfid);
> +		return -EIO;
> +	}
> +
> +	xe_gt_sriov_dbg(gt, "VF%u resume was canceled!\n", vfid);
> +	return -ECANCELED;
> +}
> +
> +/**
> + * DOC: The VF STOP state machine
> + *
> + * The VF STOP state machine looks like::
> + *
> + *	 (READY,PAUSED,RESUMED)<-------<--------------------o
> + *	    |                                                \
> + *	   stop                                               \
> + *	    |                                                  \
> + *	....V..............................STOP_WIP......       \
> + *	:    \                                          :        o
> + *	:     \   o----<----busy                        :        |
> + *	:      \ /            /                         :        |
> + *	:       STOP_SEND_STOP--------failed--->--------o--->(STOP_FAILED)
> + *	:       /             \                         :        |
> + *	:    acked             rejected-------->--------o--->(MISMATCH)
> + *	:     /                                         :
> + *	:....o..............o...............o...........:
> + *	     |              |               |
> + *	  completed        flr            restart
> + *	     |              |               |
> + *	     V         .....V.....          V
> + *	 (STOPPED)     : FLR_WIP :       (READY)
> + *	               :.........:
> + *
> + * For the full state machine view, see `The VF state machine`_.
> + */
> +
> +static void pf_exit_vf_stop_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_WIP))
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_SEND_STOP);
> +}
> +
> +static void pf_enter_vf_stopped(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> +	pf_exit_vf_mismatch(gt, vfid);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static void pf_enter_vf_stop_completed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_stopped(gt, vfid);
> +}
> +
> +static void pf_enter_vf_stop_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_FAILED);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static void pf_enter_vf_stop_rejected(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_mismatch(gt, vfid);
> +	pf_enter_vf_stop_failed(gt, vfid);
> +}
> +
> +static void pf_enter_vf_stop_send_stop(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_SEND_STOP))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_queue_vf(gt, vfid);
> +}
> +
> +static bool pf_exit_vf_stop_send_stop(struct xe_gt *gt, unsigned int vfid)
> +{
> +	int err;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_SEND_STOP))
> +		return false;
> +
> +	err = pf_send_vf_stop(gt, vfid);
> +	if (err == -EBUSY)
> +		pf_enter_vf_stop_send_stop(gt, vfid);
> +	else if (err == -EIO)
> +		pf_enter_vf_stop_rejected(gt, vfid);
> +	else if (err)
> +		pf_enter_vf_stop_failed(gt, vfid);
> +	else
> +		pf_enter_vf_stop_completed(gt, vfid);
> +	return true;
> +}
> +
> +static bool pf_enter_vf_stop_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_WIP)) {
> +		pf_enter_vf_wip(gt, vfid);
> +		pf_enter_vf_stop_send_stop(gt, vfid);
> +		return true;
> +	}
> +	return false;
>  }
>  
>  /**
> @@ -127,7 +840,279 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
>   */
>  int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid)
>  {
> -	return pf_send_vf_stop(gt, vfid);
> +	int err;
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u was already stopped!\n", vfid);
> +		return -ESTALE;
> +	}
> +
> +	if (!pf_enter_vf_stop_wip(gt, vfid)) {
> +		xe_gt_sriov_dbg(gt, "VF%u stop already in progress!\n", vfid);
> +		return -EALREADY;
> +	}
> +
> +	err = pf_wait_vf_wip_done(gt, vfid, 2 * HZ);

use define, or pf_get_default_timeout for this timeout

> +	if (err)
> +		return err;
> +
> +	if (pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
> +		xe_gt_sriov_info(gt, "VF%u stopped!\n", vfid);
> +		return 0;
> +	}
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_FAILED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u stop failed!\n", vfid);
> +		return -EIO;
> +	}
> +
> +	xe_gt_sriov_dbg(gt, "VF%u stop was canceled!\n", vfid);
> +	return -ECANCELED;
> +}
> +
> +/**
> + * DOC: The VF FLR state machine
> + *
> + * The VF FLR state machine looks like::
> + *
> + *	 (READY,PAUSED,STOPPED)<------------<--------------o
> + *	    |                                               \
> + *	   flr                                               \
> + *	    |                                                 \
> + *	....V..........................FLR_WIP...........      \
> + *	:    \                                          :       \
> + *	:     \   o----<----busy                        :        |
> + *	:      \ /            /                         :        |
> + *	:       FLR_SEND_START---failed----->-----------o--->(FLR_FAILED)<---o
> + *	:        |            \                         :        |           |
> + *	:      acked           rejected----->-----------o--->(MISMATCH)      |
> + *	:        |                                      :        ^           |
> + *	:        v                                      :        |           |
> + *	:       FLR_WAIT_GUC                            :        |           |
> + *	:        |                                      :        |           |
> + *	:       done                                    :        |           |
> + *	:        |                                      :        |           |
> + *	:        v                                      :        |           |
> + *	:       FLR_GUC_DONE                            :        |           |
> + *	:        |                                      :        |           |
> + *	:       FLR_RESET_CONFIG---failed--->-----------o--------+-----------o
> + *	:        |                                      :        |           |
> + *	:       FLR_RESET_DATA                          :        |           |
> + *	:        |                                      :        |           |
> + *	:       FLR_RESET_MMIO                          :        |           |
> + *	:        |                                      :        |           |
> + *	:        | o----<----busy                       :        |           |
> + *	:        |/            /                        :        |           |
> + *	:       FLR_SEND_FINISH----failed--->-----------o--------+-----------o
> + *	:       /             \                         :        |
> + *	:     acked            rejected----->-----------o--------o
> + *	:     /                                         :
> + *	:....o..............................o...........:
> + *	     |                              |
> + *	  completed                       restart
> + *	     |                             /
> + *	     V                            /
> + *	  (READY)<----------<------------o
> + *
> + * For the full state machine view, see `The VF state machine`_.
> + */
> +
> +static void pf_enter_vf_flr_send_start(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SEND_START))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_queue_vf(gt, vfid);
> +}
> +
> +static void pf_enter_vf_flr_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WIP)) {
> +		xe_gt_sriov_dbg(gt, "VF%u FLR is already in progress\n", vfid);
> +		return;
> +	}
> +
> +	pf_enter_vf_wip(gt, vfid);
> +	pf_enter_vf_flr_send_start(gt, vfid);
> +}
> +
> +static void pf_exit_vf_flr_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WIP)) {
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SEND_FINISH);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_MMIO);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_CONFIG);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_GUC_DONE);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WAIT_GUC);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SEND_START);
> +	}
> +}
> +
> +static void pf_enter_vf_flr_completed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_ready(gt, vfid);
> +}
> +
> +static void pf_enter_vf_flr_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED))
> +		xe_gt_sriov_notice(gt, "VF%u FLR failed!\n", vfid);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static void pf_enter_vf_flr_rejected(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_mismatch(gt, vfid);
> +	pf_enter_vf_flr_failed(gt, vfid);
> +}
> +
> +static void pf_enter_vf_flr_send_finish(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SEND_FINISH))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_queue_vf(gt, vfid);
> +}
> +
> +static bool pf_exit_vf_flr_send_finish(struct xe_gt *gt, unsigned int vfid)
> +{
> +	int err;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SEND_FINISH))
> +		return false;
> +
> +	err = pf_send_vf_flr_finish(gt, vfid);
> +	if (err == -EBUSY)
> +		pf_enter_vf_flr_send_finish(gt, vfid);
> +	else if (err == -EIO)
> +		pf_enter_vf_flr_rejected(gt, vfid);
> +	else if (err)
> +		pf_enter_vf_flr_failed(gt, vfid);
> +	else
> +		pf_enter_vf_flr_completed(gt, vfid);
> +	return true;
> +}
> +
> +static void pf_enter_vf_flr_reset_mmio(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_MMIO))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_queue_vf(gt, vfid);
> +}
> +
> +static bool pf_exit_vf_flr_reset_mmio(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_MMIO))
> +		return false;
> +
> +	/* XXX: placeholder */
> +
> +	pf_enter_vf_flr_send_finish(gt, vfid);
> +	return true;
> +}
> +
> +static void pf_enter_vf_flr_reset_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_DATA))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_queue_vf(gt, vfid);
> +}
> +
> +static bool pf_exit_vf_flr_reset_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_DATA))
> +		return false;
> +
> +	xe_gt_sriov_pf_service_reset(gt, vfid);
> +	xe_gt_sriov_pf_monitor_flr(gt, vfid);
> +
> +	pf_enter_vf_flr_reset_mmio(gt, vfid);
> +	return true;
> +}
> +
> +static void pf_enter_vf_flr_reset_config(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_CONFIG))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_queue_vf(gt, vfid);
> +}
> +
> +static bool pf_exit_vf_flr_reset_config(struct xe_gt *gt, unsigned int vfid)
> +{
> +	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_FLR_RESET_CONFIG);
> +	int err;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_CONFIG))
> +		return false;
> +
> +	err = xe_gt_sriov_pf_config_sanitize(gt, vfid, timeout);
> +	if (err)
> +		pf_enter_vf_flr_failed(gt, vfid);
> +	else
> +		pf_enter_vf_flr_reset_data(gt, vfid);
> +	return true;
> +}
> +
> +static void pf_enter_vf_flr_wait_guc(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WAIT_GUC))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +}
> +
> +static bool pf_exit_vf_flr_wait_guc(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WAIT_GUC);
> +}
> +
> +static bool pf_exit_vf_flr_send_start(struct xe_gt *gt, unsigned int vfid)
> +{
> +	int err;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SEND_START))
> +		return false;
> +
> +	/* GuC may actually send a FLR_DONE before we get a RESPONSE */
> +	pf_enter_vf_flr_wait_guc(gt, vfid);
> +
> +	err = pf_send_vf_flr_start(gt, vfid);
> +	if (err) {
> +		/* send failed, so we shouldn't expect FLR_DONE from GuC */
> +		pf_exit_vf_flr_wait_guc(gt, vfid);
> +
> +		if (err == -EBUSY)
> +			pf_enter_vf_flr_send_start(gt, vfid);
> +		else if (err == -EIO)
> +			pf_enter_vf_flr_rejected(gt, vfid);
> +		else
> +			pf_enter_vf_flr_failed(gt, vfid);
> +	} else {
> +		/*
> +		 * we have already moved to WAIT_GUC, maybe even to GUC_DONE
> +		 * but since GuC didn't complain, we may clear MISMATCH
> +		 */
> +		pf_exit_vf_mismatch(gt, vfid);
> +	}
> +
> +	return true;
> +}
> +
> +static bool pf_exit_vf_flr_guc_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_GUC_DONE))
> +		return false;
> +
> +	pf_enter_vf_flr_reset_config(gt, vfid);
> +	return true;
> +}
> +
> +static void pf_enter_vf_flr_guc_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_GUC_DONE))
> +		pf_queue_vf(gt, vfid);
>  }
>  
>  /**
> @@ -141,14 +1126,22 @@ int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid)
>   */
>  int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid)
>  {
> +	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_FLR_WIP);
>  	int err;
>  
> -	/* XXX pf_send_vf_flr_start() expects ct->lock */
> -	mutex_lock(&gt->uc.guc.ct.lock);
> -	err = pf_send_vf_flr_start(gt, vfid);
> -	mutex_unlock(&gt->uc.guc.ct.lock);
> +	pf_enter_vf_flr_wip(gt, vfid);
>  
> -	return err;
> +	err = pf_wait_vf_wip_done(gt, vfid, timeout);
> +	if (err) {
> +		xe_gt_sriov_dbg(gt, "VF%u FLR didn't finish in %u ms (%pe)\n",
> +				vfid, jiffies_to_msecs(timeout), ERR_PTR(err));

I would increase the level of this log, dbg IMO is not enough,

> +		return err;
> +	}
> +
> +	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED))
> +		return -EIO;
> +
> +	return 0;
>  }
>  
>  /**
> @@ -200,15 +1193,32 @@ static void pf_handle_vf_flr(struct xe_gt *gt, u32 vfid)
>  
>  	if (needs_dispatch_flr(xe)) {
>  		for_each_gt(gtit, xe, gtid)
> -			pf_send_vf_flr_start(gtit, vfid);
> +			pf_enter_vf_flr_wip(gtit, vfid);
>  	} else {
> -		pf_send_vf_flr_start(gt, vfid);
> +		pf_enter_vf_flr_wip(gt, vfid);
>  	}
>  }
>  
>  static void pf_handle_vf_flr_done(struct xe_gt *gt, u32 vfid)
>  {
> -	pf_send_vf_flr_finish(gt, vfid);
> +	if (!pf_exit_vf_flr_wait_guc(gt, vfid)) {
> +		xe_gt_sriov_dbg(gt, "Received out of order 'VF%u FLR done'\n", vfid);
> +		pf_enter_vf_mismatch(gt, vfid);
> +		return;
> +	}
> +
> +	pf_enter_vf_flr_guc_done(gt, vfid);
> +}
> +
> +static void pf_handle_vf_pause_done(struct xe_gt *gt, u32 vfid)
> +{
> +	if (!pf_exit_pause_wait_guc(gt, vfid)) {
> +		xe_gt_sriov_dbg(gt, "Received out of order 'VF%u PAUSE done'\n", vfid);
> +		pf_enter_vf_mismatch(gt, vfid);
> +		return;
> +	}
> +
> +	pf_enter_vf_pause_guc_done(gt, vfid);
>  }
>  
>  static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
> @@ -226,6 +1236,7 @@ static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
>  		pf_handle_vf_flr_done(gt, vfid);
>  		break;
>  	case GUC_PF_NOTIFY_VF_PAUSE_DONE:
> +		pf_handle_vf_pause_done(gt, vfid);
>  		break;
>  	case GUC_PF_NOTIFY_VF_FIXUP_DONE:
>  		break;
> @@ -284,3 +1295,165 @@ int xe_gt_sriov_pf_control_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32
>  
>  	return vfid ? pf_handle_vf_event(gt, vfid, eventid) : pf_handle_pf_event(gt, eventid);
>  }
> +
> +static bool pf_process_vf_machine(struct xe_gt *gt, unsigned int vfid)

NIT: rename to pf_process_vf_state_machine ?
> +{
> +	if (pf_exit_vf_flr_send_start(gt, vfid))
> +		return true;
> +
> +	if (pf_exit_vf_flr_send_start(gt, vfid))
> +		return true;

Mentioned in a previous email, but as a reminder:
function called twice

> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WAIT_GUC)) {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
> +					control_bit_to_string(XE_GT_SRIOV_STATE_FLR_WAIT_GUC));
> +		return false;
> +	}
> +
> +	if (pf_exit_vf_flr_guc_done(gt, vfid))
> +		return true;
> +
> +	if (pf_exit_vf_flr_reset_config(gt, vfid))
> +		return true;
> +
> +	if (pf_exit_vf_flr_reset_data(gt, vfid))
> +		return true;
> +
> +	if (pf_exit_vf_flr_reset_mmio(gt, vfid))
> +		return true;
> +
> +	if (pf_exit_vf_flr_reset_mmio(gt, vfid))
> +		return true;

function called twice
> +
> +	if (pf_exit_vf_flr_send_finish(gt, vfid))
> +		return true;
> +
> +	if (pf_exit_vf_stop_send_stop(gt, vfid))
> +		return true;
> +
> +	if (pf_exit_vf_pause_send_pause(gt, vfid))
> +		return true;
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC)) {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
> +					control_bit_to_string(XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC));
> +		return true;
> +	}
> +
> +	if (pf_exit_vf_pause_guc_done(gt, vfid))
> +		return true;
> +
> +	if (pf_exit_vf_resume_send_resume(gt, vfid))
> +		return true;
> +
> +	return false;
> +}
> +
> +static unsigned int pf_control_state_index(struct xe_gt *gt,
> +					   struct xe_gt_sriov_control_state *cs)
> +{
> +	return container_of(cs, struct xe_gt_sriov_metadata, control) - gt->sriov.pf.vfs;
> +}
> +
> +static void pf_worker_find_work(struct xe_gt *gt)
> +{
> +	struct xe_gt_sriov_pf_control *pfc = &gt->sriov.pf.control;
> +	struct xe_gt_sriov_control_state *cs;
> +	unsigned int vfid;
> +	bool empty;
> +	bool more;
> +
> +	spin_lock(&pfc->lock);
> +	cs = list_first_entry_or_null(&pfc->list, struct xe_gt_sriov_control_state, link);
> +	if (cs)
> +		list_del_init(&cs->link);
> +	empty = list_empty(&pfc->list);
> +	spin_unlock(&pfc->lock);
> +
> +	if (!cs)
> +		return;
> +
> +	/* VF metadata structures are indexed by the VFID */
> +	vfid = pf_control_state_index(gt, cs);
> +	xe_gt_assert(gt, vfid <= xe_gt_sriov_pf_get_totalvfs(gt));
> +
> +	more = pf_process_vf_machine(gt, vfid);
> +	if (more)
> +		pf_queue_vf(gt, vfid);
> +	else if (!empty)
> +		pf_queue_control_worker(gt);
> +}
> +
> +static void control_worker_func(struct work_struct *w)
> +{
> +	struct xe_gt *gt = container_of(w, struct xe_gt, sriov.pf.control.worker);
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	pf_worker_find_work(gt);
> +}
> +
> +static void pf_stop_worker(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	cancel_work_sync(&gt->sriov.pf.control.worker);
> +}
> +
> +static void control_fini_action(struct drm_device *dev, void *data)
> +{
> +	struct xe_gt *gt = data;
> +
> +	pf_stop_worker(gt);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_init() - Initialize PF's control data.
> + * @gt: the &xe_gt
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int n, totalvfs;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> +
> +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> +	for (n = 0; n <= totalvfs; n++) {
> +		struct xe_gt_sriov_control_state *cs = pf_pick_vf_control(gt, n);
> +
> +		init_completion(&cs->done);
> +		INIT_LIST_HEAD(&cs->link);
> +	}
> +
> +	spin_lock_init(&gt->sriov.pf.control.lock);
> +	INIT_LIST_HEAD(&gt->sriov.pf.control.list);
> +	INIT_WORK(&gt->sriov.pf.control.worker, control_worker_func);
> +
> +	return drmm_add_action_or_reset(&xe->drm, control_fini_action, gt);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_restart() - Restart SR-IOV control data after a GT reset.
> + * @gt: the &xe_gt
> + *
> + * Any per-VF status maintained by the PF or any ongoing VF control activity
> + * performed by the PF must be reset or cancelled when the GT is reset.
> + *
> + * This function is for PF only.
> + */
> +void xe_gt_sriov_pf_control_restart(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int n, totalvfs;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> +
> +	pf_stop_worker(gt);
> +
> +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> +	for (n = 1; n <= totalvfs; n++)
> +		pf_enter_vf_ready(gt, n);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> index 405d1586f991..c85e64f099cc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> @@ -11,6 +11,9 @@
>  
>  struct xe_gt;
>  
> +int xe_gt_sriov_pf_control_init(struct xe_gt *gt);
> +void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
> +
>  int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> new file mode 100644
> index 000000000000..11830aafea45
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> @@ -0,0 +1,107 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_PF_CONTROL_TYPES_H_
> +#define _XE_GT_SRIOV_PF_CONTROL_TYPES_H_
> +
> +#include <linux/completion.h>
> +#include <linux/spinlock.h>
> +#include <linux/workqueue_types.h>
> +
> +/**
> + * enum xe_gt_sriov_control_bits - Various bits used by the PF to represent a VF state
> + *
> + * @XE_GT_SRIOV_STATE_WIP: indicates that some operations are in progress.
> + * @XE_GT_SRIOV_STATE_FLR_WIP: indicates that a VF FLR is in progress.
> + * @XE_GT_SRIOV_STATE_FLR_SEND_START: indicates that the PF wants to send a FLR START command.
> + * @XE_GT_SRIOV_STATE_FLR_WAIT_GUC: indicates that the PF awaits for a response from the GuC.
> + * @XE_GT_SRIOV_STATE_FLR_GUC_DONE: indicates that the PF has received a response from the GuC.
> + * @XE_GT_SRIOV_STATE_FLR_RESET_CONFIG: indicates that the PF needs to clear VF's resources.
> + * @XE_GT_SRIOV_STATE_FLR_RESET_DATA: indicates that the PF needs to clear VF's data.
> + * @XE_GT_SRIOV_STATE_FLR_RESET_MMIO: indicates that the PF needs to reset VF's registers.
> + * @XE_GT_SRIOV_STATE_FLR_SEND_FINISH: indicates that the PF wants to send a FLR FINISH message.
> + * @XE_GT_SRIOV_STATE_FLR_FAILED: indicates that VF FLR sequence failed.
> + * @XE_GT_SRIOV_STATE_PAUSE_WIP: indicates that a VF pause operation is in progress.
> + * @XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE: indicates that the PF is about to send a PAUSE command.
> + * @XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC: indicates that the PF awaits for a response from the GuC.
> + * @XE_GT_SRIOV_STATE_PAUSE_GUC_DONE: indicates that the PF has received a response from the GuC.
> + * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
> + * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
> + * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
> + * @XE_GT_SRIOV_STATE_RESUME_SEND_RESUME: indicates that the PF is about to send RESUME command.
> + * @XE_GT_SRIOV_STATE_RESUME_FAILED: indicates that a VF resume operation has failed.
> + * @XE_GT_SRIOV_STATE_RESUMED: indicates that the VF was resumed.
> + * @XE_GT_SRIOV_STATE_STOP_WIP: indicates that a VF stop operation is in progress.
> + * @XE_GT_SRIOV_STATE_STOP_SEND_STOP: indicates that the PF wants to send a STOP command.
> + * @XE_GT_SRIOV_STATE_STOP_FAILED: indicates that the VF stop operation has failed
> + * @XE_GT_SRIOV_STATE_STOPPED: indicates that the VF was stopped.
> + * @XE_GT_SRIOV_STATE_MISMATCH: indicates that the PF has detected a VF state mismatch.
> + */
> +enum xe_gt_sriov_control_bits {
> +	XE_GT_SRIOV_STATE_WIP = 1,
> +
> +	XE_GT_SRIOV_STATE_FLR_WIP,
> +	XE_GT_SRIOV_STATE_FLR_SEND_START,
> +	XE_GT_SRIOV_STATE_FLR_WAIT_GUC,
> +	XE_GT_SRIOV_STATE_FLR_GUC_DONE,
> +	XE_GT_SRIOV_STATE_FLR_RESET_CONFIG,
> +	XE_GT_SRIOV_STATE_FLR_RESET_DATA,
> +	XE_GT_SRIOV_STATE_FLR_RESET_MMIO,
> +	XE_GT_SRIOV_STATE_FLR_SEND_FINISH,
> +	XE_GT_SRIOV_STATE_FLR_FAILED,
> +
> +	XE_GT_SRIOV_STATE_PAUSE_WIP,
> +	XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE,
> +	XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC,
> +	XE_GT_SRIOV_STATE_PAUSE_GUC_DONE,
> +	XE_GT_SRIOV_STATE_PAUSE_FAILED,
> +	XE_GT_SRIOV_STATE_PAUSED,
> +
> +	XE_GT_SRIOV_STATE_RESUME_WIP,
> +	XE_GT_SRIOV_STATE_RESUME_SEND_RESUME,
> +	XE_GT_SRIOV_STATE_RESUME_FAILED,
> +	XE_GT_SRIOV_STATE_RESUMED,
> +
> +	XE_GT_SRIOV_STATE_STOP_WIP,
> +	XE_GT_SRIOV_STATE_STOP_SEND_STOP,
> +	XE_GT_SRIOV_STATE_STOP_FAILED,
> +	XE_GT_SRIOV_STATE_STOPPED,
> +
> +	XE_GT_SRIOV_STATE_MISMATCH = BITS_PER_LONG - 1,
> +};
> +
> +/**
> + * struct xe_gt_sriov_control_state - GT-level per-VF control state.
> + *
> + * Used by the PF driver to maintain per-VF control data.
> + */
> +struct xe_gt_sriov_control_state {
> +	/** @state: VF state bits */
> +	unsigned long state;
> +
> +	/** @done: completion of async operations */
> +	struct completion done;
> +
> +	/** @link: link into worker list */
> +	struct list_head link;
> +};
> +
> +/**
> + * struct xe_gt_sriov_pf_control - GT-level control data.
> + *
> + * Used by the PF driver to maintain its data.
> + */
> +struct xe_gt_sriov_pf_control {
> +	/** @worker: worker that executes a VF operations */
> +	struct work_struct worker;
> +
> +	/** @list: list of VF entries that have a pending work */
> +	struct list_head list;
> +
> +	/** @lock: protects VF pending list */
> +	spinlock_t lock;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> index 40cbaea3ef44..28e1b130bf87 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>  
>  #include "xe_gt_sriov_pf_config_types.h"
> +#include "xe_gt_sriov_pf_control_types.h"
>  #include "xe_gt_sriov_pf_monitor_types.h"
>  #include "xe_gt_sriov_pf_policy_types.h"
>  #include "xe_gt_sriov_pf_service_types.h"
> @@ -23,6 +24,9 @@ struct xe_gt_sriov_metadata {
>  	/** @monitor: per-VF monitoring data. */
>  	struct xe_gt_sriov_monitor monitor;
>  
> +	/** @control: per-VF control data. */
> +	struct xe_gt_sriov_control_state control;
> +
>  	/** @version: negotiated VF/PF ABI version */
>  	struct xe_gt_sriov_pf_service_version version;
>  };
> @@ -30,12 +34,14 @@ struct xe_gt_sriov_metadata {
>  /**
>   * struct xe_gt_sriov_pf - GT level PF virtualization data.
>   * @service: service data.
> + * @control: control data.
>   * @policy: policy data.
>   * @spare: PF-only provisioning configuration.
>   * @vfs: metadata for all VFs.
>   */
>  struct xe_gt_sriov_pf {
>  	struct xe_gt_sriov_pf_service service;
> +	struct xe_gt_sriov_pf_control control;
>  	struct xe_gt_sriov_pf_policy policy;
>  	struct xe_gt_sriov_spare_config spare;
>  	struct xe_gt_sriov_metadata *vfs;

Functionally, it's a good idea to introduce a state machine here.
I believe that if this code is well tested, this code will be reliable and
will handle all assumed states, including errors.

However, I have a few general comments in addition to those I left above
in the code.
While the drawings indicate a certain hierarchy of states (we have main and intermediate states),
in the code this structure is flat.
The code itself is difficult to understand (thanks to drawings it is a bit easier) but
it takes some time to analyze and understand it sensibly. I am afraid that the code will
be difficult to debug and an inexperienced person will have a problem with extending
the functionality of the code.

Thanks,
Piotr


> -- 
> 2.43.0
> 

-- 
