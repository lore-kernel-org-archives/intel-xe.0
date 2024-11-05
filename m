Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7EFD3176B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 17:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460E210E075;
	Tue,  5 Nov 2024 17:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8Yzn0cY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433DF10E075
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 17:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730828379; x=1762364379;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P0NR3SCRVqoF230hVaa6bZwXXnnyRtBA3ti4weW37Ns=;
 b=K8Yzn0cYzsrvKAXKjCpTRj1pkdi7Hozl/Wy/88p6a6VykpSLIPFBcczO
 xqNBt8ZTO/ezpNMZJYunjaXyxQ2/Wg5y70O5EMSfpXqpuLqDH5wOpnENf
 fZLJ3ZW/bQMQQ8CWBCEJqrSTeA4RneHfT8mB3kvRKFmTw4M0RZZ6IO3km
 pMJP0sdaiPreZRGVfHdSGK0wy9ifbEmqjaKZep3WlmN1BhZCVbLamrwzM
 2HyBhqMeQZ/QXGwjQ2v8S+bDsaljN8LHX5jabZC8VCNMaNIrETTuWKmQ8
 rMz76wV7WNiRgB0hnBs7kAOpLQeSiZo+1U0pSR4c6aq+FOiZvS7W59qnX g==;
X-CSE-ConnectionGUID: u5uU/t9OSTqBx3G+FFzzTA==
X-CSE-MsgGUID: T0hOQkkmRfSxGONTM9qKRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="34520697"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="34520697"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 09:39:39 -0800
X-CSE-ConnectionGUID: ahMU0L1VR72gjqmV/SYZQw==
X-CSE-MsgGUID: d5y+4yTzQDu19stdzW8S6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="89242671"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 09:39:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 09:39:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 09:39:27 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 09:39:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FW6JWSitPf7yFexOL4qidri9jxts6RBN+MBt4JSH8/WJXOA3/lyaRl5YsZQOXN2g9OwUntpsvLHP+W3wHMSRYtFTkbxcBI0n+lLvQi7YuHwML8hbOzggckqTCzWh7ZPehteeDnVzHD4zmp+Q3AmDN0Mjnxif5Xliudc1ceB26TksaebLA/F9x6YyksSodugVTfJ/uo6VW/vhsy/GxxEdRKhK5mSarufP1/5hv2ksVQKhu59fg3JT3KU60LgednRLAEP94xf3Pn1T6bl6T8GBdwkq0uc9YS4kxQtpfJ37ojp1GprhFv+K96T5VPHdnys5v1joWX7RjehBMA/jQnexjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSqUZ/O7+bzxjQqNjBWyEgB/HbH4h8OTFr2cOzwAfWc=;
 b=o03cMKIRcbhMXmdtUyB3FF7LKt9NP96g8osdu1FGpDktR+yNCghZF7b96xUll9GWM4jl7VIGREXj1KDwIGI4ML9F344JYvcwt8/twzpu9aJozS+Q6YmccNHZp9VFTZtRFW5KCVG5pZDZIcL3EcftxrIqF9LeZX6lZK971kXwEE+tzG6lvcNWBl/NL9VJOFqzlGvra/OLeKY4+D9oyCcoFm5aV+Sf+zNuzN22p3I4UW/GzRZMv4utYnKtlXmxZjnGksDoBPzMVKzITffcPmyxL9gQNOQ1li/UFioriCTvjYzfUEPsBcZJup+cOxMFD0GkZl+VbhYyRiOYmYCK865WAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYXPR11MB8689.namprd11.prod.outlook.com (2603:10b6:930:d8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 17:39:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 17:39:23 +0000
Date: Tue, 5 Nov 2024 09:39:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Add read/write debugfs helpers for GGTT node
Message-ID: <ZypYapAzDwD+pzux@lstrano-desk.jf.intel.com>
References: <20241103201633.1859-1-michal.wajdeczko@intel.com>
 <20241103201633.1859-2-michal.wajdeczko@intel.com>
 <Zylrsw40oX0fGVU2@lstrano-desk.jf.intel.com>
 <e88b6d0e-c433-42f4-896b-cad5da2b061b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e88b6d0e-c433-42f4-896b-cad5da2b061b@intel.com>
X-ClientProxiedBy: MW4P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYXPR11MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: 96bb9dc9-e817-431d-073e-08dcfdc0c91c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?crqq2r1k91hDgeyIB6cxGTMjumLTdyFQ4g6+f/nveclUW/n4k/hHS74LlqUM?=
 =?us-ascii?Q?PpA6VzYdlSCEviaVcA94qUcn1zSkjJiUM/GCzY4xG2CVjYrOY/T2XhWjonUO?=
 =?us-ascii?Q?cOko6B6BAxxoNiGLKp9sY689Pb8u10tLHpxue3KA7lVMPj/sBgHBV8iOANTI?=
 =?us-ascii?Q?oOkWNb33ZaA4S8FvejxCf6NcQKDevAZlbfcii1CjnP9BCKUcZ6nNkAhiuRZb?=
 =?us-ascii?Q?rl9L2vqzTEBijom4+MlsaC5jQajMOnSqT75Ww24JNX8yY8UTd9AWIK69O2Co?=
 =?us-ascii?Q?Lxxou71aTaKlnWCHBXplxX6JG3l1TCHCs03OKrrzGixaktH+SuSeR0bSyu76?=
 =?us-ascii?Q?Rzda+tm/TZHER/aCpk+2ZQ9ibuZ/LG1x4t76NaxKZLDwVW/ZLhPPANQNrfZT?=
 =?us-ascii?Q?+ijIPdvR8VTW7wFOcLZaJFPvA2p4KNn2SQ45d75zwuCwToOP3jUi5cbEyVr8?=
 =?us-ascii?Q?etg8Z7odsmjUNuiiX/xa2Z2nGhrMYVftG1w+U7gVt5feJwf/Z9nVOSbRvnLf?=
 =?us-ascii?Q?GPs1lnM38QaFgut87Rne91L80S7bsghJPfEgn876TOtGdi7EsXiKM7hVE1wq?=
 =?us-ascii?Q?ywYj/ozV5RDZPOP+TMs48nn7kSg8hoQ2oiQg1wfOOmmKMnl5YMlpYgggAkCk?=
 =?us-ascii?Q?7ls4cwMrDvvf9h8wBRLt51ZOaNJqYpQc9GekkMio0JsYBSVB5ckIbLC61N4H?=
 =?us-ascii?Q?r4w7hzsLAmWxh2Qj8KTG3w2pXCy+049naoEXJbEnyGsFI9kBVXPk2WbUETV4?=
 =?us-ascii?Q?CtUpIiHfc69CFKQALqgyr7swY0I+OUn6wONg2N87xgQAOXjeV8yIjhWNjbtY?=
 =?us-ascii?Q?Nxek66p5dfrtm1ihtevaRoD4rkcPJatYSGQvkN3zsYPRfcvqrZTiR9k6ThcE?=
 =?us-ascii?Q?guiOk633mF145rlv5du/jqIDjDwwuuxpQLwbdm8CwYM3hZIY7/MIkU5GJSyU?=
 =?us-ascii?Q?DliDlHDx0p4NxuEj4b19pld35GIqYqITPEieErh2bZu+MpjzHAlxOBz0XHuk?=
 =?us-ascii?Q?j5Wl2fwm0WBGuATLSPMcUvg72Xu6sxHwdlGIqTAtDDoVRFXVan0LSM7QweOy?=
 =?us-ascii?Q?QU3WJVKSs4Niuso/GCD+flFdwtWlNOwEbNXFSeqWVTwVpX7dd4j2puIU0zgo?=
 =?us-ascii?Q?l7wgj4p0+9hKod8jah0oAfhmAIzILT8f5L/GZs2nok3HDisc4LB1e/sfmrIP?=
 =?us-ascii?Q?t6uBWwm4H6RzIyjMVG6bfYXQFvFTh59kHwYaxwtL8s9CAxthD9XqC+avkcUO?=
 =?us-ascii?Q?GgAmJJtBjeCw5HVy6fmPRQOycM8UwsZZYw/XCePd5A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NCsFFijnYb3uBxRHCgwotz63X3iAqd/OIsSMkY3+r/+dX47/gZgD4sRWyKcq?=
 =?us-ascii?Q?HGVO6SjPZ1DKKPytydl6DDInLspIRHQ4i5LmieOLRLWYLppFXa1EfCqCb2kH?=
 =?us-ascii?Q?WZhxZlRneuAmZJsz34H9WMA2fDAmoSqw/KpJMLSLD2skprKKy+JWyQM1IpCP?=
 =?us-ascii?Q?s5a2DOeq+gkBFq2B25M2Ws4MXSLs+agtvBUsU+pk9XsCEtdkKCPBnUVdkCK1?=
 =?us-ascii?Q?SC89m5QxwRjbDHeYcXr+ecS2AwqQ0ScjZKhYVSOn3KKvQ3v67pveGPpPXpOX?=
 =?us-ascii?Q?s0yo0UtuPo/4UHnUJt5ksK/SKikAoPPwcYpQBv1RxLOJvmh1tSvHa41u1i2x?=
 =?us-ascii?Q?TiKv53PUeUloN3bj1O4GkuThnk4Y3qS4NTBCZrH+oDza6yPEAPlNtTj0HJl7?=
 =?us-ascii?Q?o7ytmJcUfAgtBk5+k7Ts/w2yspQnbc1aJjOJ539bv+dBtzXy+XImuQk5+cyp?=
 =?us-ascii?Q?whV4IK1yfR4rUbgTaeFOdk0OD6Sl+8M5kCcrn7a2AQZs1JvXFj23dP6VyboP?=
 =?us-ascii?Q?rhUV9z/TXbFpFMgV57vRRPLph37hQL7vbhGXVCaaQFasy8V+55Ry5HmRINxE?=
 =?us-ascii?Q?oLF5fggURm0LNXH5ZUlIEoorTPTbXx2jHTjjgYj9DdEhnW8I47LjkETiNOWw?=
 =?us-ascii?Q?sX6Z1dY1mTOXmUhsIVK3QW8+ndDz1vFrMe2wqcvNyAgcAqOvmcpEjoA0z01S?=
 =?us-ascii?Q?v3ak6Vdb/dctKMwoaFtWkVJ9XqEGe8W2czAngh/AnwJ1+jR+md4RrRaREra4?=
 =?us-ascii?Q?9EkQDslJxbWG90XcvGfWc3tsCf86+g6A2WmyqC0S5gH18JXddQtdsgwoV579?=
 =?us-ascii?Q?iDHLtLBaIGH75Hm8+xcDiFN9w18VRgvybuRvPXlkbONYLLb/a73Gv1rm+kH0?=
 =?us-ascii?Q?4tm/Xtvv8enXAlmMvJT/p1uLVz26v/3G3MSYZfPsJwvybG5gkClRCvJiS0Ck?=
 =?us-ascii?Q?T/1h7S7MpktYscEtZrAuWMfVN6Nzgu1Jpv7TfkBvtoNJ6uf5Awb+a6HPCWTD?=
 =?us-ascii?Q?4FF/GMtqfLMaZdiKOK0Fz84GBerREzehhSgimsuvjRSwxTbUWNlTHCENrGEB?=
 =?us-ascii?Q?CT9Lu+C7JGuNqUCmhcc6qAQ6GchEJz61p3JgweRDV+f4FSKvuW0ta6tGmfzT?=
 =?us-ascii?Q?y6ctgxoxckJE95KTnqIVMA4LFm49QV3lz4LGQCCAjzmwCC706Uf1c8n4smm4?=
 =?us-ascii?Q?0g6Hi9h67ve6tnvfJsW1c4Q7efyhmlF7O7NLfMwkd3Sh/b50/REZcrwWnSNu?=
 =?us-ascii?Q?YfI4KgIDLWlGBPrHz4Rhf5zBQY2yXhUpRGRtqJaCqQJYTl3guayRrwt6NFae?=
 =?us-ascii?Q?1KdXbo9IOhSdxGxjFf1bw26NJxjejYHvsQL71hiHFrGf3nkV2Irvi3CO6P7P?=
 =?us-ascii?Q?/LsJgNUWdl8mMYYPHELMrSsfyG3vYplsdufRuvCoWUfo4tVkewWpDgL55hZN?=
 =?us-ascii?Q?cK6RNCaOaCKwMa8RHEhfU64eXiCSn9Ke+dYaSn1kKKaQs/DrDtTaCdWjaa6J?=
 =?us-ascii?Q?pdcWhFnj+h6HxnwyTOvTtSk4rZELCN1SbBNjHx8ywMWsuNuxe1QUTpsXX60l?=
 =?us-ascii?Q?/7+fcHhUFuXCkWBEVAr41+FAqwcdv8fue5nHa4cSgCvLYPGTt40jEJTuczUT?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bb9dc9-e817-431d-073e-08dcfdc0c91c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:39:23.0553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avCZJtM0WCWEjNLwxcFjSFsR82VqhGvKjLhg8xN8Af5eYpcAiYAtBgEXHQ1EWEebogf2fZyFk6FfPJVT90MDig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8689
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

On Tue, Nov 05, 2024 at 04:25:50PM +0100, Michal Wajdeczko wrote:
> Hi Matt,
> 
> On 05.11.2024 01:49, Matthew Brost wrote:
> > On Sun, Nov 03, 2024 at 09:16:32PM +0100, Michal Wajdeczko wrote:
> >> In upcoming patch we want to allow copying and updating PTEs of
> >> some GGTT nodes over debugfs. Add simple helpers for that.
> >>
> > 
> > On the surface it very much looks like are reinventing something that
> > almost certainly already exists or if it doesn't we should try to do
> > this in a common way. Have you looked for any similar code to this in
> > the kernel.
> 
> There are similar copy functions in sound subsystem [1] under CONFIG_SND
> 
> 	int copy_to_user_fromio();
> 	int copy_from_user_toio();
> 
> and some time ago [2] I was trying to define generic read function
> 
> 	ssize_t simple_read_from_iomem()
> 
> but that didn't get any traction at all, so this time decided to start
> with local functions, as otherwise we will not move forward.
> 

[2] is basically what I was thinking. I understand the challenge of not
gaining traction, so I think doing a series with local functions to
achieve functionality seems fine. In the long term, I believe [2] should
be revived, as it appears to be the correct solution, and I think we
want to avoid Xe maintaining code that could be shared.

Matt

> Note that some other attempt to make code common [3] also actually ended
> with local solution [4] that was merged to drm-xe-next.
> 
> I'm more than happy to define those new helper functions in fs/libfs.c
> but without wider usage this will be just another dead series like [5].
> 
> Michal
> 
> [1]
> https://elixir.bootlin.com/linux/v6.11.6/source/include/sound/core.h#L269
> 
> [2] https://patchwork.freedesktop.org/series/133507/
> 
> [3] https://patchwork.freedesktop.org/series/133123/#rev1
> [4] https://patchwork.freedesktop.org/series/133123/#rev3
> 
> [5]
> https://lore.kernel.org/lkml/20240214214654.1700-1-michal.wajdeczko@intel.com/T/#u
> 
> > 
> > Matt
> > 
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_ggtt.c | 178 +++++++++++++++++++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_ggtt.h |   7 ++
> >>  2 files changed, 185 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> >> index 558fac8bb6fb..e003f5f51ac6 100644
> >> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> >> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> >> @@ -838,3 +838,181 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
> >>  
> >>  	return total;
> >>  }
> >> +
> >> +#ifdef CONFIG_DEBUG_FS
> >> +
> >> +static size_t copy_iomem_to_user_by_chunk(void __user *to, const void __iomem *from,
> >> +					  size_t count, void *buf, size_t size)
> >> +{
> >> +	size_t chunk;
> >> +	size_t rem;
> >> +
> >> +	while (count) {
> >> +		chunk = umin(count, size);
> >> +		memcpy_fromio(buf, from, chunk);
> >> +		rem = copy_to_user(to, buf, chunk);
> >> +		count -= chunk - rem;
> >> +		if (rem)
> >> +			break;
> >> +		from += chunk;
> >> +		to += chunk;
> >> +	}
> >> +
> >> +	return count;
> >> +}
> >> +
> >> +static size_t copy_iomem_to_user(void __user *to, const void __iomem *from, size_t count)
> >> +{
> >> +	char chunk[64];
> >> +	size_t size;
> >> +	size_t rem;
> >> +	void *buf;
> >> +
> >> +	if (!count)
> >> +		return 0;
> >> +
> >> +	size = count > sizeof(chunk) ? umin(PAGE_SIZE, count) : 0;
> >> +	buf = size ? kmalloc(size, GFP_NOWAIT | __GFP_NORETRY) : NULL;
> >> +	if (buf) {
> >> +		rem = copy_iomem_to_user_by_chunk(to, from, count, buf, size);
> >> +		kfree(buf);
> >> +		return rem;
> >> +	}
> >> +
> >> +	return copy_iomem_to_user_by_chunk(to, from, count, chunk, sizeof(chunk));
> >> +}
> >> +
> >> +static ssize_t simple_read_from_iomem(void __user *to, size_t count, loff_t *ppos,
> >> +				      const void __iomem *from, size_t available)
> >> +{
> >> +	loff_t pos = *ppos;
> >> +	size_t rem;
> >> +
> >> +	if (pos < 0)
> >> +		return -EINVAL;
> >> +	if (pos >= available || !count)
> >> +		return 0;
> >> +	if (count > available - pos)
> >> +		count = available - pos;
> >> +
> >> +	rem = copy_iomem_to_user(to, from + pos, count);
> >> +	if (rem == count)
> >> +		return -EFAULT;
> >> +
> >> +	count -= rem;
> >> +	*ppos = pos + count;
> >> +	return count;
> >> +}
> >> +
> >> +/**
> >> + * xe_ggtt_node_read() - Copy PTEs from the GGTT node to the user space buffer
> >> + * @node: the GGTT node to read from
> >> + * @buf: the user space buffer to read to
> >> + * @count: the maximum number of bytes to read
> >> + * @ppos: the current position
> >> + *
> >> + * Return: On success, the number of bytes read is returned and the offset
> >> + * @ppos is advanced by this number, or negative value is returned on error.
> >> + */
> >> +ssize_t xe_ggtt_node_read(struct xe_ggtt_node *node, char __user *buf,
> >> +			  size_t count, loff_t *ppos)
> >> +{
> >> +	if (!xe_ggtt_node_allocated(node))
> >> +		return 0;
> >> +
> >> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.start, XE_PAGE_SIZE));
> >> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.size, XE_PAGE_SIZE));
> >> +
> >> +	return simple_read_from_iomem(buf, count, ppos,
> >> +				      &node->ggtt->gsm[node->base.start / XE_PAGE_SIZE],
> >> +				      size_mul(sizeof(u64), node->base.size / XE_PAGE_SIZE));
> >> +}
> >> +
> >> +static size_t copy_iomem_from_user_by_chunk(void __iomem *to, const void __user *from,
> >> +					    size_t count, void *buf, size_t size)
> >> +{
> >> +	size_t chunk;
> >> +	size_t rem;
> >> +
> >> +	while (count) {
> >> +		chunk = umin(count, size);
> >> +		rem = copy_from_user(buf, from, chunk);
> >> +		memcpy_toio(to, buf, chunk - rem);
> >> +		count -= chunk - rem;
> >> +		if (rem)
> >> +			break;
> >> +		from += chunk;
> >> +		to += chunk;
> >> +	}
> >> +
> >> +	return count;
> >> +}
> >> +
> >> +static size_t copy_iomem_from_user(void __iomem *to, const void __user *from, size_t count)
> >> +{
> >> +	char chunk[64];
> >> +	size_t size;
> >> +	size_t rem;
> >> +	void *buf;
> >> +
> >> +	if (!count)
> >> +		return 0;
> >> +
> >> +	size = count > sizeof(chunk) ? umin(PAGE_SIZE, count) : 0;
> >> +	buf = size ? kmalloc(size, GFP_NOWAIT | __GFP_NORETRY) : NULL;
> >> +	if (buf) {
> >> +		rem = copy_iomem_from_user_by_chunk(to, from, count, buf, size);
> >> +		kfree(buf);
> >> +		return rem;
> >> +	}
> >> +
> >> +	return copy_iomem_from_user_by_chunk(to, from, count, chunk, sizeof(chunk));
> >> +}
> >> +
> >> +static ssize_t simple_write_to_iomem(void __iomem *to, size_t available, loff_t *ppos,
> >> +				     const void __user *from, size_t count)
> >> +{
> >> +	loff_t pos = *ppos;
> >> +	size_t rem;
> >> +
> >> +	if (pos < 0)
> >> +		return -EINVAL;
> >> +	if (pos >= available || !count)
> >> +		return 0;
> >> +	if (count > available - pos)
> >> +		count = available - pos;
> >> +
> >> +	rem = copy_iomem_from_user(to + pos, from, count);
> >> +	if (rem == count)
> >> +		return -EFAULT;
> >> +
> >> +	count -= rem;
> >> +	*ppos = pos + count;
> >> +	return count;
> >> +}
> >> +
> >> +/**
> >> + * xe_ggtt_node_write() - Update PTEs of the GGTT node using data from the user space buffer
> >> + * @node: the GGTT node to write to
> >> + * @buf: the user space buffer to read from
> >> + * @count: the maximum number of bytes to read
> >> + * @ppos: the current position
> >> + *
> >> + * Return: On success, the number of bytes written is returned and the offset
> >> + * @ppos is advanced by this number, or negative value is returned on error.
> >> + */
> >> +ssize_t xe_ggtt_node_write(struct xe_ggtt_node *node, const char __user *buf,
> >> +			   size_t count, loff_t *ppos)
> >> +{
> >> +	if (!xe_ggtt_node_allocated(node))
> >> +		return -ENXIO;
> >> +
> >> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.start, XE_PAGE_SIZE));
> >> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.size, XE_PAGE_SIZE));
> >> +
> >> +	return simple_write_to_iomem(&node->ggtt->gsm[node->base.start / XE_PAGE_SIZE],
> >> +				     size_mul(sizeof(u64), node->base.size / XE_PAGE_SIZE),
> >> +				     ppos, buf, count);
> >> +}
> >> +
> >> +#endif
> >> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> >> index 27e7d67de004..64746e23053e 100644
> >> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> >> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> >> @@ -34,6 +34,13 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
> >>  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
> >>  u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
> >>  
> >> +#ifdef CONFIG_DEBUG_FS
> >> +ssize_t xe_ggtt_node_read(struct xe_ggtt_node *node, char __user *buf,
> >> +			  size_t count, loff_t *pos);
> >> +ssize_t xe_ggtt_node_write(struct xe_ggtt_node *node, const char __user *buf,
> >> +			   size_t count, loff_t *pos);
> >> +#endif
> >> +
> >>  #ifdef CONFIG_PCI_IOV
> >>  void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
> >>  #endif
> >> -- 
> >> 2.43.0
> >>
> 
