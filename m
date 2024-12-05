Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7158CE77171
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 08:36:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D9110EDE6;
	Thu,  5 Dec 2024 08:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/8kOGXM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C29310EDE2
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 08:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733387759; x=1764923759;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ghj8N/8UvfAbXiK8cN8oFCnlGSFKaT7i2+mNLpj0q4Q=;
 b=T/8kOGXMcGjQWvqK26d08MAg3tBM9GerAdwf9uUTApuRfXqMYxcSwVxc
 cL72e4xRXl8zx3Xc3ZQFphW2WOESl56wZ10OoAo3SR813x1B3f5+olgAh
 DZBLt+oXtHdkNszycWSY0+jKo923Ay40OWwqtdB/+mAfTnNI4D+vT2a6I
 bW3zob7syCwlSzsY0D8/Zifl/I7kFVGT8Y/wcCXdnH5DODozzz81YtffZ
 rcj+pHiAIiQICogF4anvMrmRwGxLb6pVbKiRqPTUmCwiY1OO6tjGoUw/3
 eF8f5uTAL1LBSU2EInuP11d1nc/rF59nYuZw3hUvTc8x5T0DZhul0Fnc/ w==;
X-CSE-ConnectionGUID: tji5+IKhQvCCiZCPaCZpjg==
X-CSE-MsgGUID: xdVRJrc1S0+cBZVaoOhihQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33817301"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="33817301"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 00:35:59 -0800
X-CSE-ConnectionGUID: k02grP2uQGK74txdHZG3Yw==
X-CSE-MsgGUID: y2PXSRgSRf+mNeTvN/vMhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="98096891"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 00:35:58 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 00:35:58 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 00:35:58 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 00:35:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMkO3PuX41/md0uJCPbMnMpAENpn3i8yMA6Z40te3cJc7t+SyG37xkl9sYZdWRI3evBuMetjwlpa5G8h8Pp3wOtcFJMi9ha/gbz9jBH6TTMOn8gauTiqBe2lP6H8i8lOP6Dyb1bNNe+6GYntTJPkAnkR4YMPb2IsGrH8buzR9xYtW6ASAPBBd/78h5kAiMFVIvX6ENuJ6qixZ3hAEHG4TuFGAtCuhRPqPvVrzfF0dhV3mq46JJejmyO2Dnvqpm6baco0l8V9oFAb+1SHtm7NlrXO8tr13UY4jxvSUQD2U4EpDwTI8OZEmZTgZulOKAA0qAwdr1GX1AUQyphe4xRYGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTZaiUriSHj0AN3dW2prTb41iAbAPavgelPmSYgB6dk=;
 b=SSnuiVUt1boZ7hJhKQVz7phnM1zYpCtI+XJIR4XI01l0mTu9Kq6XlnIbTgpjHGelztQ4ZFk/4dluuCzu8wy1AtSHxQR+7mj1n3mrlGEh5yAE90PybXdDRqfl8SCW3qQSYStme2XnbQo+iQjTgBadsRWrVbZ/Bl4dz9ny2BHolnWkHAsDgQhrf/5lb5Tn3xh1or8hYT84U5C9uqwRwkbhW7XwNTPLcHvCUTiHUhYcpRD9qmVMBgOKJWl6Yjhh86tckbyJQ0qp7QUkwKBo8tGXmPv7Glgkme/Y64m1Xv9twZAYWJIjLbfRctlb3nDcYkFP6yqr2576YLSRSrAwvhkpbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by BL3PR11MB6315.namprd11.prod.outlook.com (2603:10b6:208:3b2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 5 Dec
 2024 08:35:55 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 08:35:54 +0000
Date: Thu, 5 Dec 2024 09:35:51 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: "Levi, Ilia" <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>,
 <koby.elbaz@intel.com>, <yaron.avizrat@intel.com>
Subject: Re: [PATCH v5 2/5] drm/xe/irq: Separate MSI and MSI-X flows
Message-ID: <20241205083551.2fb5czqiyuug2zw6@intel.com>
References: <20241128125345.1115-1-ilia.levi@intel.com>
 <20241128125345.1115-3-ilia.levi@intel.com>
 <20241202185918.bdz2oz4y3u3voklg@intel.com>
 <42cd338d-2b71-4793-90c8-eafa2a4a96e8@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42cd338d-2b71-4793-90c8-eafa2a4a96e8@intel.com>
X-ClientProxiedBy: DUZPR01CA0042.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::9) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|BL3PR11MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a36e09-bc41-4cf9-ed83-08dd1507d524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0VWNUVTR3M5YW5UNmlwYkNXeFBKRDgwMitPNW9QTmQvVndUanBkT1BqNk9U?=
 =?utf-8?B?dW54UlpMZURBOGNJeElvR2wzTXZVQkFPdGU2UWd3eVB3QXA1Ukt2eTl0ZVBk?=
 =?utf-8?B?WjhubFJIVm8rTEUwTUpxYnVpNlgwUGxwT1dqc0tLaTBaR1ZTUnZMZU96bzV5?=
 =?utf-8?B?bUliQkVhOERIQUpQL3Z1K3FsdDQ4Vmd3eG9XZExVSkVyV2d3ckVCUXlaMVpS?=
 =?utf-8?B?R05PVFBFUjlWK3d3M0tGLzExMW5sa0p6anVFR3YwZlExeFVnQzU2SmJob1Va?=
 =?utf-8?B?WDRSbVU2bE1UQTh5ZHJ2TitoQXcxczFlTUJVWlJhaVZGb0R2SDExRW1teHNi?=
 =?utf-8?B?NlZ3ZHpnNHVwa0l0YTZHRmxjSTZrR3Q5Z0R3Uy9XREFDL0hCLzIwdEczL05I?=
 =?utf-8?B?RVFVckp3STQwVkplSUpVclpQdmlGRUdRakxsOVhZMVZlMThmb0wvU2ZvU09G?=
 =?utf-8?B?LzlobHVSOXJuZkFwZ2cxeGVUeEZldnpJcVhrN1p3S0RYRUFDUmd1eFVsZjA0?=
 =?utf-8?B?Z3V1N2liNTh5ZFpYVGxxNFpEQ1B4My93VHI3WXA0MjA5YUFLQmtQQmFZRjdk?=
 =?utf-8?B?b2l3N3VVYUFta0pNU2ZvZnBUOTdEeUg4UCtNdkxURTA2ZEwxcVBYMWdMZkZI?=
 =?utf-8?B?aENRdWRvbmthQW1sNUFhVGgyZ2QzSXhLN3NyeWNvUGdOVm9IMS94ZUR2ckdZ?=
 =?utf-8?B?b0FybEI4VWkzTFlleHlFTjR5aFU1ems1cDZpbk14SktaWUd6MHdWaEtnZ252?=
 =?utf-8?B?ZTBzOUh0NzJqSVVnbWN2YXFUZU1mWHVMMzQ2TWloOFNOWXJtUmRSYW12YWY3?=
 =?utf-8?B?TXBsbnZ5MGZVbVV4bTFGQXpIUUplTUtoRVpQQmx6QmVveFNYemVla1BJQ21T?=
 =?utf-8?B?aEJ4ZWdIK0g3N3RzYkIzWHVMdFhKSkg5MWRjdk5aWHlheGxXU2cybDl6Z3B3?=
 =?utf-8?B?UWd0VDhNWnhTOUMwMnB4NXhneGxHdWlhUjdTM3QvcStYaXdOY3Q3c1VmMGhS?=
 =?utf-8?B?N1RPa3A3aFpOWDYweDc5akhwbzhJK1JDalZlRi9GOTErN3hTU3hzMnp2dnIx?=
 =?utf-8?B?cmtKUmlFMzJEVW5DY1IyeTFtakVhTk9WcEVYOWZBczBCVGdyUVYzTHFFM2FZ?=
 =?utf-8?B?UHVGbnpmYWdpeDJ5WDVhcjJ1eWtDV2Q4NUQzMGo2VVdTOTNmS0hqWXQ4UEgz?=
 =?utf-8?B?clVLSG1rRnh2SUY0bjJiUXN5UnE4ckJSMlgrNjVoQTRmUktzQjZ1elZVUmRY?=
 =?utf-8?B?T0JjczV0b0o4R1RyckZJOFhNMzhEV3B1SmtjU2tSZHpwVnZDY0ozSFVRODcr?=
 =?utf-8?B?Z1QxNStWcUN0RjhNemZGSlJDbDN1enBPN3FFdUNIcDlpWUJHR3RrK21ic1lK?=
 =?utf-8?B?WEtNTDAwS3pHdk9QZHUvL0V6cGZnUlFWd05xN1prOWRzbmVlaWNIYkNYVGN5?=
 =?utf-8?B?VDB0Q1RnUmdkcXpNdnNod3d4c0pvVnVuRlhzZXVTTHgzT2pPOEZ0UklBTE1L?=
 =?utf-8?B?YVFrM0pwTksrbUVjUnViMWl5NUI4S2h2RlNUNjlQZll2LzNqU3FWUXJLM25V?=
 =?utf-8?B?WDhLVzRjT25OYXJlcUNNNUp6Y0dIYW1ubVRWblhDOHpWWFlWYzlMZkNvZ01H?=
 =?utf-8?B?ZVUzdnVtOHZ2MlMxZGltdlFSWEQyeVlrdC9TZDZVamhnOHh4cEdSMWlyNGFj?=
 =?utf-8?B?VTZmTDUzeFAvZnNMbzlPdXdLQXYyS085SVRURG5ITWhGWjdHNTlYSlpBZVpk?=
 =?utf-8?B?SXRMTTFtR3NoNGY2QkVBRXpsSTMveS9TdzNrT05UZzFCbUFoVHpvS2Y3MllO?=
 =?utf-8?B?Q1ZqVWZ5bmdoUWtKTTBWZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vmk1Z2w2SzJDMURKZ2JJcTlnT1NpYndpM0lsMnVEWUtCVmVaK0JJcHE0dG53?=
 =?utf-8?B?NWZpRGhwOG9ySXhQdUxaV3pxTEpJWnFDQ2luVGZoelRLR0ZmNFB3NDJQMGha?=
 =?utf-8?B?MVhDdlgrdHBLY3grMnl6dGRQZ0h6bUlrM1VlTDREWWIyN0ZFYXVmTUFzaEJZ?=
 =?utf-8?B?bC83TU05QWdiSDJreGJZall5ZDJVTUk0eUVibWNBT253ek1HaXRrS25kQWZo?=
 =?utf-8?B?cGprR0ZFd2hGUU1vbkhKMjU2MFRBRitXR01aeWVZa001azJFU1U3RkdxVzFh?=
 =?utf-8?B?cUF1c3NaYkM4L21IY1lKV2tYOTFvelRUWEh4cnMvM1FORXlOYVltRWtIVXhW?=
 =?utf-8?B?Tzg2ZDVFbnFsNE10dm9nZEk2T296amtOb1BBUUxxaEx0TDFLendoSVgyNTVZ?=
 =?utf-8?B?SkpuTHVvRWNUdFY2SVNKcy94YUNQSXNsdGVXQTBEb1pqd0l0Uzd2S0tja29D?=
 =?utf-8?B?ZlZYZ2xrZnI0aUM5SEt5Qktwc3Fpc3hzdWY5TERTTmNHWWxpZnMyR2pRTmRn?=
 =?utf-8?B?T3lDbGN1SXBmTmRLeWc3OXI5RWhuWDJGbUkzSWhRNTRHYWZXS2RIQVRLbUxw?=
 =?utf-8?B?U2N2SURQaVliWDMxOXBwSXZyaTdJR1YvdUxhb09jcno1TVpTeHE0WFhSYXkz?=
 =?utf-8?B?bk9UcFNLWjNBVXZoMW5PZnZOYmVzUkp2T1RCTnBWVDVYeFB4aXpZSm5CUkNP?=
 =?utf-8?B?MmoyMktGdDZ3U0pqZExoRXRITk5yVWVpbXV5N1F5Sy9MTFBnYlExZjkvWEJr?=
 =?utf-8?B?cWhHVklZRjUyL0lKM1lzWlFMNGY4OThCc25XbkN4ay9WSHRjMFlWMzJ4bzR5?=
 =?utf-8?B?a215MWdHOGZxMUZmRExiNEVJOUJxSFBpTXlyeHNhV1poYTdXMjdHSXRab0h3?=
 =?utf-8?B?Y1h3VDVHYk56emQ0TXdtOG9SaVBhTVRETld5WGNyWWJVUldxSkJmREpIUHR3?=
 =?utf-8?B?TXhkWTJsNVFQUW85QnppMEMyK2JENHhNbGZxMXh3MVhxNHlua1hlYk9TMjB2?=
 =?utf-8?B?b09WSHZ0aDQydndINE1RQXNQWUp5bE52UXRKRXFFdUU5VzdzOVJnTlp4N1ls?=
 =?utf-8?B?V1lCRmIvTVZBWkkyc0pTd2k4N0pNb3VkRHJwT2pqMG5ha1FpTk1MajM4OERI?=
 =?utf-8?B?K1NDUHFYSGwxV08veWJDOGJoTWJrbzQweFdYdkpzTGFyWHA5UnFrNzBJZDNm?=
 =?utf-8?B?KzlXRUhhVW5wQlpiV1hZYklRMGl2K0s2YkZuMEl0K2oyL0h4RTMzT1Zud3pX?=
 =?utf-8?B?VmFnc000YUsxK2F6ZVROQVVWd1d4SWZuZ0dvMDBQNXhqblJlNWp1eHpnUHIy?=
 =?utf-8?B?bG1kSDM4Y09sNnF4VVhWb0xUa3hiUDYxNVYzdC9wYkNzUGVma29NYmtwT0FC?=
 =?utf-8?B?SUk1blRxYkprcWVtK0lzQWxSZmRXU2tjT210ZlpRQTFUQklsL3F1cHdXN2o2?=
 =?utf-8?B?VDRjRi80Y201dDUyRnpmb1cyV1FudXFMOFBNelYydkhWSW1IN3NPREVOYXY4?=
 =?utf-8?B?dzdqSGNLVzF2V0NodUF1cVJCeElCSHFINHVKdkVEbnVtWkFJWDkybDlOTEsz?=
 =?utf-8?B?dUI5N215c3hraFRKL2FUS0gveW52YytQcVdOOTREYWtYTTR5TmJTSGpSQmFz?=
 =?utf-8?B?ajVFTHZHanAyc1I2NW9pbVZZRXFoSXpnaUhtSE1OcEUyYTR0UUV4eU45ZWZL?=
 =?utf-8?B?SDZhM0hDQ0lWODdlNDBLNWtPV0MxZTlwSDNQRGhJS20ycDluUEJxeGIrQmxt?=
 =?utf-8?B?ajg1REtyZnNXQXlveWo1TFd4RlZHeUpuUlJsYlVyRUg4bEM3ZldndmFGUXZD?=
 =?utf-8?B?ZWlsc1daVXlneVQ0U2EvanpaeFhjN1c2aW5NNDhuV0FuOHYzQWo3ZVZIMWhR?=
 =?utf-8?B?VTRyZ2svU1M1TUszTzZYbGoxVmZobjcyMG9qVzNwUU40aC9ESW9ZSW1kamwr?=
 =?utf-8?B?d2g4aklqOGRUdlpBdGpkdkpCUlAwdVlSMyt4bU82cnhucUhQRnhOWjc4bzJw?=
 =?utf-8?B?V2VQNWd4SjFkY2E0ZkdBNnQxbW5xNFBVTklNSHFvd1FNUHlGL3liUDNwbk51?=
 =?utf-8?B?am1XamNIY0R6em5tM0NDNHlSTUhaWFB2U05DNnJ4alZGamU2K0l6cEh0VkZJ?=
 =?utf-8?B?aVRGcHpCNFR4Y3dNMndwWTBpYnZyTnlJV2w4ejM3a3Z3T2w2ZlAwL2EzZVV4?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a36e09-bc41-4cf9-ed83-08dd1507d524
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 08:35:54.3273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KS8KP00SW9ccw0sfROryyFhOdRwFuqGuwJP/dsZ1yjRGEan7mJNVt6hN99xiRE71k19pD9lo1Cq9CcOsny8RvBrMJ34qXXYWsOlIerLQI28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6315
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

Levi, Ilia <ilia.levi@intel.com> wrote on wto [2024-gru-03 11:04:14 +0200]:
> On 02/12/2024 20:59, Piotr Piórkowski wrote:
> > Ilia Levi <ilia.levi@intel.com> wrote on czw [2024-lis-28 14:53:42 +0200]:
> >> A new flow is added for devices that support MSI-X:
> >> - MSI-X vector 0 is used for GuC-to-host interrupt
> >> - MSI-X vector 1 (aka default MSI-X) is used for HW engines
> >>
> >> The default MSI-X will be passed to the HW engines in a subsequent
> >> patch.
> >>
> >> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_device.c       |   4 +-
> >>  drivers/gpu/drm/xe/xe_device.h       |   3 +-
> >>  drivers/gpu/drm/xe/xe_device_types.h |   6 +
> >>  drivers/gpu/drm/xe/xe_irq.c          | 257 +++++++++++++++++++++++----
> >>  drivers/gpu/drm/xe/xe_irq.h          |   3 +
> >>  5 files changed, 237 insertions(+), 36 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> >> index 930bb2750e2e..f1246fa8b5cc 100644
> >> --- a/drivers/gpu/drm/xe/xe_device.c
> >> +++ b/drivers/gpu/drm/xe/xe_device.c
> >> @@ -325,7 +325,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> >>  	xe->info.revid = pdev->revision;
> >>  	xe->info.force_execlist = xe_modparam.force_execlist;
> >>  
> >> -	spin_lock_init(&xe->irq.lock);
> >> +	err = xe_irq_init(xe);
> >> +	if (err)
> >> +		goto err;
> >>  
> >>  	init_waitqueue_head(&xe->ufence_wq);
> >>  
> >> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> >> index f1fbfe916867..fc3c2af3fb7f 100644
> >> --- a/drivers/gpu/drm/xe/xe_device.h
> >> +++ b/drivers/gpu/drm/xe/xe_device.h
> >> @@ -157,8 +157,7 @@ static inline bool xe_device_has_sriov(struct xe_device *xe)
> >>  
> >>  static inline bool xe_device_has_msix(struct xe_device *xe)
> >>  {
> > I still think you should use the name xe_device_use_msix.
> >
> > We use xe_device_has_* in case, when the capability based on Platform
> > version (for example xe_device_has_memirq) based on intel_device_info
> > (for example xe_device_has_sriov or xe_device_has_flat_css).
> >
> > IMO in case you are basing it on a variable that you set yourself in init you should use
> > a different name (for example with “uses” instead of “has”)
> >
> > My motivation is that for me xe_device_has-* is used when it is the capability of a given device
> > and we base on the information that intel_device_info or infromation about the platform version
> > provides us with.
> 
> As we discussed, it is akin to xe_device_has_flat_ccs - where xe->info.has_flat_ccs is set by probe_has_flat_ccs.
> xe->irq.msix.nvec is set according to pci_msix_vec_count which reads MSI-X capability from the PCI.
> 
> >> -	/* TODO: change this when MSI-X support is fully integrated */
> >> -	return false;
> >> +	return xe->irq.msix.nvec > 0;
> >>  }
> >>  
> >>  static inline bool xe_device_has_memirq(struct xe_device *xe)
> >> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> >> index 7ee114c17552..ed638067aa26 100644
> >> --- a/drivers/gpu/drm/xe/xe_device_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> >> @@ -348,6 +348,12 @@ struct xe_device {
> >>  
> >>  		/** @irq.enabled: interrupts enabled on this device */
> >>  		atomic_t enabled;
> >> +
> >> +		/** @irq.msix: irq info for platforms that support MSI-X */
> >> +		struct {
> >> +			/** @irq.msix.nvec: number of MSI-X interrupts */
> >> +			u16 nvec;
> >> +		} msix;
> >>  	} irq;
> >>  
> >>  	/** @ttm: ttm device */
> >> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> >> index 1c509e66694d..b8a0b9bbf24c 100644
> >> --- a/drivers/gpu/drm/xe/xe_irq.c
> >> +++ b/drivers/gpu/drm/xe/xe_irq.c
> >> @@ -10,6 +10,7 @@
> >>  #include <drm/drm_managed.h>
> >>  
> >>  #include "display/xe_display.h"
> >> +#include "regs/xe_guc_regs.h"
> > I don't see why you are adding this header
> 
> GUC_INTR_GUC2HOST is defined there. It was not needed before as it was called by gt_other_irq_handler (the type of the interrupt was read from the registers).
> For MSI-X those registers are no longer set - and the only type of interrupt we expect on MSI-X vector 0 is guc-to-host.
> 
> >
> > Thanks,
> > Piotr

I'm ok with that:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> >>  #include "regs/xe_irq_regs.h"
> >>  #include "xe_device.h"
> >>  #include "xe_drv.h"
> >> @@ -29,6 +30,11 @@
> >>  #define IIR(offset)				XE_REG(offset + 0x8)
> >>  #define IER(offset)				XE_REG(offset + 0xc)
> >>  
> >> +static int xe_irq_msix_init(struct xe_device *xe);
> >> +static void xe_irq_msix_free(struct xe_device *xe);
> >> +static int xe_irq_msix_request_irqs(struct xe_device *xe);
> >> +static void xe_irq_msix_synchronize_irq(struct xe_device *xe);
> >> +
> >>  static void assert_iir_is_zero(struct xe_mmio *mmio, struct xe_reg reg)
> >>  {
> >>  	u32 val = xe_mmio_read32(mmio, reg);
> >> @@ -572,6 +578,11 @@ static void xe_irq_reset(struct xe_device *xe)
> >>  	if (IS_SRIOV_VF(xe))
> >>  		return vf_irq_reset(xe);
> >>  
> >> +	if (xe_device_uses_memirq(xe)) {
> >> +		for_each_tile(tile, xe, id)
> >> +			xe_memirq_reset(&tile->memirq);
> >> +	}
> >> +
> >>  	for_each_tile(tile, xe, id) {
> >>  		if (GRAPHICS_VERx100(xe) >= 1210)
> >>  			dg1_irq_reset(tile);
> >> @@ -614,6 +625,14 @@ static void xe_irq_postinstall(struct xe_device *xe)
> >>  	if (IS_SRIOV_VF(xe))
> >>  		return vf_irq_postinstall(xe);
> >>  
> >> +	if (xe_device_uses_memirq(xe)) {
> >> +		struct xe_tile *tile;
> >> +		unsigned int id;
> >> +
> >> +		for_each_tile(tile, xe, id)
> >> +			xe_memirq_postinstall(&tile->memirq);
> >> +	}
> >> +
> >>  	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
> >>  
> >>  	/*
> >> @@ -656,60 +675,83 @@ static irq_handler_t xe_irq_handler(struct xe_device *xe)
> >>  		return xelp_irq_handler;
> >>  }
> >>  
> >> -static void irq_uninstall(void *arg)
> >> +static int xe_irq_msi_request_irqs(struct xe_device *xe)
> >> +{
> >> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >> +	irq_handler_t irq_handler;
> >> +	int irq, err;
> >> +
> >> +	irq_handler = xe_irq_handler(xe);
> >> +	if (!irq_handler) {
> >> +		drm_err(&xe->drm, "No supported interrupt handler");
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	irq = pci_irq_vector(pdev, 0);
> >> +	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
> >> +	if (err < 0) {
> >> +		drm_err(&xe->drm, "Failed to request MSI IRQ %d\n", err);
> >> +		return err;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void xe_irq_msi_free(struct xe_device *xe)
> >>  {
> >> -	struct xe_device *xe = arg;
> >>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >>  	int irq;
> >>  
> >> +	irq = pci_irq_vector(pdev, 0);
> >> +	free_irq(irq, xe);
> >> +}
> >> +
> >> +static void irq_uninstall(void *arg)
> >> +{
> >> +	struct xe_device *xe = arg;
> >> +
> >>  	if (!atomic_xchg(&xe->irq.enabled, 0))
> >>  		return;
> >>  
> >>  	xe_irq_reset(xe);
> >>  
> >> -	irq = pci_irq_vector(pdev, 0);
> >> -	free_irq(irq, xe);
> >> +	if (xe_device_has_msix(xe))
> >> +		xe_irq_msix_free(xe);
> >> +	else
> >> +		xe_irq_msi_free(xe);
> >> +}
> >> +
> >> +int xe_irq_init(struct xe_device *xe)
> >> +{
> >> +	spin_lock_init(&xe->irq.lock);
> >> +
> >> +	return xe_irq_msix_init(xe);
> >>  }
> >>  
> >>  int xe_irq_install(struct xe_device *xe)
> >>  {
> >>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >> -	unsigned int irq_flags = PCI_IRQ_MSIX;
> >> -	irq_handler_t irq_handler;
> >> -	int err, irq, nvec;
> >> -
> >> -	irq_handler = xe_irq_handler(xe);
> >> -	if (!irq_handler) {
> >> -		drm_err(&xe->drm, "No supported interrupt handler");
> >> -		return -EINVAL;
> >> -	}
> >> +	unsigned int irq_flags = PCI_IRQ_MSI;
> >> +	int nvec = 1;
> >> +	int err;
> >>  
> >>  	xe_irq_reset(xe);
> >>  
> >> -	nvec = pci_msix_vec_count(pdev);
> >> -	if (nvec <= 0) {
> >> -		if (nvec == -EINVAL) {
> >> -			/* MSIX capability is not supported in the device, using MSI */
> >> -			irq_flags = PCI_IRQ_MSI;
> >> -			nvec = 1;
> >> -		} else {
> >> -			drm_err(&xe->drm, "MSIX: Failed getting count\n");
> >> -			return nvec;
> >> -		}
> >> +	if (xe_device_has_msix(xe)) {
> >> +		nvec = xe->irq.msix.nvec;
> >> +		irq_flags = PCI_IRQ_MSIX;
> >>  	}
> >>  
> >>  	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
> >>  	if (err < 0) {
> >> -		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
> >> +		drm_err(&xe->drm, "Failed to allocate IRQ vectors: %d\n", err);
> >>  		return err;
> >>  	}
> >>  
> >> -	irq = pci_irq_vector(pdev, 0);
> >> -	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
> >> -	if (err < 0) {
> >> -		drm_err(&xe->drm, "Failed to request MSI/MSIX IRQ %d\n", err);
> >> +	err = xe_device_has_msix(xe) ? xe_irq_msix_request_irqs(xe) :
> >> +					xe_irq_msi_request_irqs(xe);
> >> +	if (err)
> >>  		return err;
> >> -	}
> >>  
> >>  	atomic_set(&xe->irq.enabled, 1);
> >>  
> >> @@ -722,18 +764,28 @@ int xe_irq_install(struct xe_device *xe)
> >>  	return 0;
> >>  
> >>  free_irq_handler:
> >> -	free_irq(irq, xe);
> >> +	if (xe_device_has_msix(xe))
> >> +		xe_irq_msix_free(xe);
> >> +	else
> >> +		xe_irq_msi_free(xe);
> >>  
> >>  	return err;
> >>  }
> >>  
> >> -void xe_irq_suspend(struct xe_device *xe)
> >> +static void xe_irq_msi_synchronize_irq(struct xe_device *xe)
> >>  {
> >> -	int irq = to_pci_dev(xe->drm.dev)->irq;
> >> +	synchronize_irq(to_pci_dev(xe->drm.dev)->irq);
> >> +}
> >>  
> >> +void xe_irq_suspend(struct xe_device *xe)
> >> +{
> >>  	atomic_set(&xe->irq.enabled, 0); /* no new irqs */
> >>  
> >> -	synchronize_irq(irq); /* flush irqs */
> >> +	/* flush irqs */
> >> +	if (xe_device_has_msix(xe))
> >> +		xe_irq_msix_synchronize_irq(xe);
> >> +	else
> >> +		xe_irq_msi_synchronize_irq(xe);
> >>  	xe_irq_reset(xe); /* turn irqs off */
> >>  }
> >>  
> >> @@ -754,3 +806,142 @@ void xe_irq_resume(struct xe_device *xe)
> >>  	for_each_gt(gt, xe, id)
> >>  		xe_irq_enable_hwe(gt);
> >>  }
> >> +
> >> +/* MSI-X related definitions and functions below. */
> >> +
> >> +enum xe_irq_msix_static {
> >> +	GUC2HOST_MSIX = 0,
> >> +	DEFAULT_MSIX = XE_IRQ_DEFAULT_MSIX,
> >> +	/* Must be last */
> >> +	NUM_OF_STATIC_MSIX,
> >> +};
> >> +
> >> +static int xe_irq_msix_init(struct xe_device *xe)
> >> +{
> >> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >> +	int nvec = pci_msix_vec_count(pdev);
> >> +
> >> +	if (nvec == -EINVAL)
> >> +		return 0;  /* MSI */
> >> +
> >> +	if (nvec < 0) {
> >> +		drm_err(&xe->drm, "Failed getting MSI-X vectors count: %d\n", nvec);
> >> +		return nvec;
> >> +	}
> >> +
> >> +	xe->irq.msix.nvec = nvec;
> >> +	return 0;
> >> +}
> >> +
> >> +static irqreturn_t guc2host_irq_handler(int irq, void *arg)
> >> +{
> >> +	struct xe_device *xe = arg;
> >> +	struct xe_tile *tile;
> >> +	u8 id;
> >> +
> >> +	if (!atomic_read(&xe->irq.enabled))
> >> +		return IRQ_NONE;
> >> +
> >> +	for_each_tile(tile, xe, id)
> >> +		xe_guc_irq_handler(&tile->primary_gt->uc.guc,
> >> +				   GUC_INTR_GUC2HOST);
> >> +
> >> +	return IRQ_HANDLED;
> >> +}
> >> +
> >> +static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
> >> +{
> >> +	unsigned int tile_id, gt_id;
> >> +	struct xe_device *xe = arg;
> >> +	struct xe_memirq *memirq;
> >> +	struct xe_hw_engine *hwe;
> >> +	enum xe_hw_engine_id id;
> >> +	struct xe_tile *tile;
> >> +	struct xe_gt *gt;
> >> +
> >> +	if (!atomic_read(&xe->irq.enabled))
> >> +		return IRQ_NONE;
> >> +
> >> +	for_each_tile(tile, xe, tile_id) {
> >> +		memirq = &tile->memirq;
> >> +		if (!memirq->bo)
> >> +			continue;
> >> +
> >> +		for_each_gt(gt, xe, gt_id) {
> >> +			if (gt->tile != tile)
> >> +				continue;
> >> +
> >> +			for_each_hw_engine(hwe, gt, id)
> >> +				xe_memirq_hwe_handler(memirq, hwe);
> >> +		}
> >> +	}
> >> +
> >> +	return IRQ_HANDLED;
> >> +}
> >> +
> >> +static int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler,
> >> +				   const char *name, u16 msix)
> >> +{
> >> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >> +	int ret, irq;
> >> +
> >> +	irq = pci_irq_vector(pdev, msix);
> >> +	if (irq < 0)
> >> +		return irq;
> >> +
> >> +	ret = request_irq(irq, handler, IRQF_SHARED, name, xe);
> >> +	if (ret < 0)
> >> +		return ret;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
> >> +{
> >> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >> +	int irq;
> >> +
> >> +	irq = pci_irq_vector(pdev, msix);
> >> +	if (irq < 0) {
> >> +		drm_err(&xe->drm, "MSI-X %u can't be released, there is no matching IRQ\n", msix);
> >> +		return;
> >> +	}
> >> +
> >> +	free_irq(irq, xe);
> >> +}
> >> +
> >> +static int xe_irq_msix_request_irqs(struct xe_device *xe)
> >> +{
> >> +	int err;
> >> +
> >> +	err = xe_irq_msix_request_irq(xe, guc2host_irq_handler,
> >> +				      DRIVER_NAME "-guc2host", GUC2HOST_MSIX);
> >> +	if (err) {
> >> +		drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", GUC2HOST_MSIX, err);
> >> +		return err;
> >> +	}
> >> +
> >> +	err = xe_irq_msix_request_irq(xe, xe_irq_msix_default_hwe_handler,
> >> +				      DRIVER_NAME "-default-msix", DEFAULT_MSIX);
> >> +	if (err) {
> >> +		drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", DEFAULT_MSIX, err);
> >> +		xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
> >> +		return err;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void xe_irq_msix_free(struct xe_device *xe)
> >> +{
> >> +	xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
> >> +	xe_irq_msix_free_irq(xe, DEFAULT_MSIX);
> >> +}
> >> +
> >> +static void xe_irq_msix_synchronize_irq(struct xe_device *xe)
> >> +{
> >> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >> +
> >> +	synchronize_irq(pci_irq_vector(pdev, GUC2HOST_MSIX));
> >> +	synchronize_irq(pci_irq_vector(pdev, DEFAULT_MSIX));
> >> +}
> >> diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
> >> index 067514e13675..24ff16111b96 100644
> >> --- a/drivers/gpu/drm/xe/xe_irq.h
> >> +++ b/drivers/gpu/drm/xe/xe_irq.h
> >> @@ -6,10 +6,13 @@
> >>  #ifndef _XE_IRQ_H_
> >>  #define _XE_IRQ_H_
> >>  
> >> +#define XE_IRQ_DEFAULT_MSIX 1
> >> +
> >>  struct xe_device;
> >>  struct xe_tile;
> >>  struct xe_gt;
> >>  
> >> +int xe_irq_init(struct xe_device *xe);
> >>  int xe_irq_install(struct xe_device *xe);
> >>  void xe_irq_suspend(struct xe_device *xe);
> >>  void xe_irq_resume(struct xe_device *xe);
> >> -- 
> >> 2.43.2
> >>

-- 
