Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBD5D30019
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 16:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4C410E1E6;
	Fri, 18 Oct 2024 16:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AoYI2dGw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018C510E35E
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 16:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729268233; x=1760804233;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=b15rUPmMAbWNPdecQH+qJmSPAkPPeYuOQBSmvzIZ5yQ=;
 b=AoYI2dGw7zdQBhyFljPkUzSnmhWV/u9dOSNAZ/OUOQssZoepALjDzxgD
 TNEQ4jB+qqXkP9R8RezfylsYOKnWjux48SvOfbDjWfy7O9HOdNMPu91YB
 fm/YfB9GFR6MDXEBlTdjtGCKFiXOPN1jpfGZcmJYJf8+0thVIE1obFjWx
 mMz+B77+kw2mrRAl1LpTTQyXhrR1Gmg2JCPDo/YtrF4/tYi5q5P/v9inN
 APXiPoFU0XfwITN6VWh7zCfpj9101ZH4N56ZpYBZUu8TZ6kpaKCBii0G+
 gmj0cw3M10BR9kN6rlVdFONu2LD6jEfdtTNF6GOFW3RG4/nRYtQ+wG/KA A==;
X-CSE-ConnectionGUID: vcQazrlKT0STJa0iwu8OSA==
X-CSE-MsgGUID: it4iRbd2QSeaRA8ZxcNQfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28685091"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28685091"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 09:17:12 -0700
X-CSE-ConnectionGUID: c2ed5jSnQiC8r0/ZVUGr/A==
X-CSE-MsgGUID: iQqGzttrTBq2iItMCQ9sMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="78571696"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 09:17:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 09:17:11 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 09:17:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 09:17:11 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 09:17:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRCEnN09GZwGaQe8vrIoxKt3iOTpROlTTZ+RpEDxK5UWZr6CmwhiY6mAgb7IyPh8b8+vV9R7ec+MrRIY0m+9XEJf+kskLCDyM473d9dFhc80/HFUalmJ/PJ/ZKdF4OLtLBhXWKyuAwHAPH/m8sWQMPFcluZPsZ67iDCaTONEwsb3wstBi3IySTf1a1SIJXWNtqK7OsrCJWT02S8z+JVzW6uN4Jux/TXm3wdog3agGbKPiVDpfWMk92etx9aS1np6lulUEg2UFVWQTROa4Cp0TzFrSTPCfB536loJoYUZ9mAMZ6f/tTiSLYDinHSsaUNH9sc43mttagpqVrxLXDPk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miq1B9VbU/8qFrdhfeI8CvHnpyaeavFZ+oJZL/SLNBU=;
 b=k/TYTnum6pdkTgTkGmtGKBgziGB8heU5FZOnLiDRCy8efE2GN1BuNStBYLGLghpk7zOJo2dBDc2twjgvFmH68zx237lQp15Fh/i+KiFFxXXvxLQPDij9t8r2+GmZkMZhwLdUTOBqscB3L4nG+5+BHp0tm5HzkPGxz1164y6mozgAfmz1D66gF3zYYl3KNO03dWtKtG8CevR3b1TRc7ZCR9hsMb5s6CzNCcYWTfn0xsOM/e9ThxKQDabiIKjKBJDDP1zLbZ2vOAxHjk4JlB7z0fIFGpAwPqbUwB80HraETJY+OYHppO2DtMAZTbhBp//+Wq93zoIzOQrFFCRopL7W4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8727.namprd11.prod.outlook.com (2603:10b6:408:20d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 16:17:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 16:17:07 +0000
Date: Fri, 18 Oct 2024 16:16:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/xe/ufence: Signal ufence immediately when possible
Message-ID: <ZxKJ0FRINGiHDblY@DUT025-TGLU.fm.intel.com>
References: <20241018124710.1536948-1-nirmoy.das@intel.com>
 <2ef62119-1b98-4e5f-8218-0c99b4dbce36@intel.com>
 <52c18f08-0d8a-4419-ab36-9f072c54f9cf@intel.com>
 <9fb1e3a2-c4ab-4520-996f-b5d20f634093@intel.com>
 <cdddde09-428b-45b5-a058-3a7a8b80bf77@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cdddde09-428b-45b5-a058-3a7a8b80bf77@intel.com>
X-ClientProxiedBy: BYAPR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:a03:40::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: bd145673-68d0-4eb6-fc41-08dcef90500b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Vn4TlPTLdHbIRNixoD3H6ey64j+CbsmKLskM0YWNfx3A9SFrB79vItpu2h?=
 =?iso-8859-1?Q?uGl4Q/Wh0NUcw97eQHAocpRIDczfPBo11WXnE3OFdulHdI/Yg3iVFqLd5R?=
 =?iso-8859-1?Q?l8eo9HLdeeCBSD1saqjFQuTEiWekrkLuxPnpX/9XM+njGAGGXgYD+0Dihl?=
 =?iso-8859-1?Q?bm3h4dFPePTsnxCWaj8zl4DVV05UUKV1FC/hWv4NLxw5C2OSUOmLAlmejW?=
 =?iso-8859-1?Q?L9sGX/6bhFEFCznAFSTUVdWAWq06VUq1HGDWBkzqw/E8eQD4n1ePstVH/5?=
 =?iso-8859-1?Q?Dztg3dCYdsQuGd71AXS0l4JP2WPxwxldnivarVEFC6QrawpYj4qYf4HpAL?=
 =?iso-8859-1?Q?M/qVOjItn7jFCYwXNbYCYgrrIIuFWwC2Jxw0i6XJrDh362PQmR5f6fcDTs?=
 =?iso-8859-1?Q?gH2Rq2L21Xl6pnu2dIUsx+JntJ3ouMlVFjjrxBbuRct3wnZiTs0kdRIA6B?=
 =?iso-8859-1?Q?SDhN1WHSGFb2J+HYvGCtEHG63TU3HdpXqYbHWZniDZIT/KgKM6htp0N9Qr?=
 =?iso-8859-1?Q?kN8bwXuYsdSGLxlXsSdaOlBESZO54yo+JceTeIx4EDOM0ki8DA1QxND05b?=
 =?iso-8859-1?Q?U2wJ6ksxGjgAfq4zVFHM6XnLF1Q6LzFZ/hh5Bk4by+w6FcFqTsrg7o3MJs?=
 =?iso-8859-1?Q?DKX4l/URkZbDdgb39U0+Yd4c+txBi6rkNibBHIjsB68jnFXRKm/WsWQUpr?=
 =?iso-8859-1?Q?cJ7lieOSqboRyUKsxwpVlwzLW/O0k9jSscYIlW9eJshlV7bRY/rH+jxKc3?=
 =?iso-8859-1?Q?I8tBJBA34y4Gb3WWcM8rtWnKESp8B3BhmUbQ9hUDoDJq/au3BihhR+5/wa?=
 =?iso-8859-1?Q?mNkGDZ91KFxuBW3ONaOYlF66XOFEffpRUiB6XuqxaXeS/YMqKtGqr73UWg?=
 =?iso-8859-1?Q?rf3pHo1DljpkAGz1TfywrMnUon9jfdtJJh9sswdBLh6zloEU/9H4c2H2ZB?=
 =?iso-8859-1?Q?3wWYBEpReU3OIvtu6fIJM3msmlwZvOhJCQNVUBo5BGYICeYth68ApxmAHz?=
 =?iso-8859-1?Q?JQ9SiCGgTzdNZIHNCLlLvylJqxYfUp2BXvyw+Ar9P/UbY8gHsqSRNTJih4?=
 =?iso-8859-1?Q?s+9ri2w0DJ7uoWSXGSBXcsQe+TdHv/o7E0k/j3Ya1N0XbcscANHAXu8joT?=
 =?iso-8859-1?Q?V77yK5T/f3hftMY7syjxJgfXc+KmiBvhryZslO1O46Ifz37xhGJWfTWzoo?=
 =?iso-8859-1?Q?6Z/b7UZqwi4XoeLdH4r5jy8kmgnpVdlW9UG+/dQgzH6RtiIb4IVBpms6n6?=
 =?iso-8859-1?Q?JrDIBWs4MAm69ttAYhBbmDZk+1QEyJyUXGFfqhnV0HWINJ5bzCtCqe5L7k?=
 =?iso-8859-1?Q?WN2jfIqKFJpcxpn9ciGFYJRhMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?beEkhvMPx9WM2vVaq+04i7N95Mif/mSpOUw0S0tEfUfPVxATeRRpYVNKpB?=
 =?iso-8859-1?Q?EF2gzft0dLMkuGQMiQDJ07AvPH0h6/nkNFO+/WCbZFEK7lzFXjpPKJ2BM1?=
 =?iso-8859-1?Q?zG9J1+M5SOoWw4zkS0Kk78bj0vraL+UNieIV6A7ahgFnDPp2f9KtF3KKRG?=
 =?iso-8859-1?Q?OlQ7j9dzKQRmRA1RnSnK2zkHk9y9WV1SDGRwTjalp+VvBzWkNHMhABFUL/?=
 =?iso-8859-1?Q?9DXmRQpMcQ7OUTHQsC+1/JvVQGRJ2KQKhf6dQvcUd9DC6zmoWIF+lNJvaL?=
 =?iso-8859-1?Q?otzsS5mp3SyPr1gBK0WawBgwSyZZ4Bx8u+DxR/zmuHkKqPl0O5geJPc7qY?=
 =?iso-8859-1?Q?2ra3R+L122YYbb8hzc5BM9MpenrsukkTNdB0uOP4zCR/3XYV2Lg3yl/zzw?=
 =?iso-8859-1?Q?xyACnOKOhv++c58hveWm0g1OQMgyK7d4/dxlCG9DbNnuNfqWT58yf7PIWE?=
 =?iso-8859-1?Q?88HeDhALa1ZR3jnkhiVv+jB0oKq3AGUcZbNZjyX4T0JYt0Zg0jArITTueG?=
 =?iso-8859-1?Q?SqPi/hcPpWJTjVxaLruabT+989lYg9u9HWkKcDS9lnI8WAJ4ZcLYwp+7LQ?=
 =?iso-8859-1?Q?fFncwU08P7xuJU5R5CmMtQRy9TM652e+MNeQseCRu4xzViZK0bHXV4C6on?=
 =?iso-8859-1?Q?7YPBqaffiaySdq0dCrpZDutEr5pRRPFr/PXohI+OjoJ/H6I5jxXFgS2WxY?=
 =?iso-8859-1?Q?1xgxYnQHsdygG32G6JEi6cocvob/S19+TPg9k0qWAVy7NPU3FTJlv89J+E?=
 =?iso-8859-1?Q?Rby3tlEmUIOOOoNSQZZAQzSYFGmuH0BpW+8NDAwrZirwJx7Ttp9Yu++yta?=
 =?iso-8859-1?Q?EFVSlQ1BoeU/8x1aq3IVjGXRTRWJLEZJj27ig+dJjscQA38ofIUb5exg/o?=
 =?iso-8859-1?Q?XRl2DoPkkxGw1r3SmAol+Z3WsTKB2/DlROgKeu2cGi0F4vpMFoJJorr43A?=
 =?iso-8859-1?Q?7vngJctWZnTxfR1CRBt9BoG4p4ToueZGNkugejUSrmC891c1q2dkw0TQrM?=
 =?iso-8859-1?Q?Dm6R0isf1LSok17zLEJeVXmmgqIfrb807DbpujtGgD7aL53qf7gOkudEqD?=
 =?iso-8859-1?Q?XhglIX+4rTGrKfiUjHsL9PS3mPfFVPNTFLh61AZ8+2efAE/cBM5rjJO7Wu?=
 =?iso-8859-1?Q?LDtXe8XKwEeWziteqjCa7C4sXeiinXfzDu/GRsU8CaOS5Q76ejgnRn36PX?=
 =?iso-8859-1?Q?a+T3EpK/fL4kYRrP0C8psNXljoBGJJ4Cu8oUQ/l6+K11QGrKUNsXjqGPrS?=
 =?iso-8859-1?Q?rwWXhDwKsL8pxT4CDfpF97lpj7FnRt6Txz2fZ8v79z8SREjpt8JGYVrN2a?=
 =?iso-8859-1?Q?Dg7+U3nAUDR8WZePSYVXdRYNrbke2ni9VEn9f4c5nVuVmL+jgJfh/Aezrr?=
 =?iso-8859-1?Q?2dcS/sHKP0HuZbOBl8khj4CV/+iAZ4sEOFpjX+dxnsCqmh79kooyWe3gaf?=
 =?iso-8859-1?Q?R+YgrynXNNrganeWtTpV2wPyjbd+RAewk/JZTeKmExg/zooMoGHeon82V+?=
 =?iso-8859-1?Q?VE23Lf0Jg2D5CMgKiWxH6tvpRM2AZi3jpazXrcEYdL6/GTU5soQt15rE/e?=
 =?iso-8859-1?Q?7Spd2urR/JcpAjMlIM4ddVt5geC5w4jOBT2/hqfE1Eg0hLYSNYZtN16sHC?=
 =?iso-8859-1?Q?oJhVaR6ZQspLyNoFOfZBZr6MJ0c0tpbas96UIpFbErw5qzseJk/JpqeA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd145673-68d0-4eb6-fc41-08dcef90500b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 16:17:07.8865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjcZhgoD2JceGyNmBxeFeBMqNeKRVWQuKF+Kc3r5Ud1WDNxmCzuj7PPDHNcVz1bgR48DxtedkyQtENba9/FFCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8727
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

On Fri, Oct 18, 2024 at 05:29:09PM +0200, Nirmoy Das wrote:
> 
> On 10/18/2024 4:53 PM, Matthew Auld wrote:
> > On 18/10/2024 15:40, Nirmoy Das wrote:
> >>
> >> On 10/18/2024 4:23 PM, Matthew Auld wrote:
> >>> On 18/10/2024 13:47, Nirmoy Das wrote:
> >>>> If the backing fence is signaled then signal ufence immediately.
> >>>> This should reduce load from the xe ordered_wq and also won't block
> >>>> signaling a ufence which doesn't require any serialization.
> >>>>
> >>>> v2: fix system_wq typo
> >>>> v3: signal immediately instead of queuing in system_wq (Matt B)
> >>>>
> >>>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> >>>> Cc: Matthew Auld <matthew.auld@intel.com>
> >>>> gc: Matthew Brost <matthew.brost@intel.com>
> >>>
> >>> s/gc/Cc
> >>>
> >>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> >>>> ---
> >>>>    drivers/gpu/drm/xe/xe_sync.c | 15 +++++++++++----
> >>>>    1 file changed, 11 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> >>>> index c6cf227ead40..069c1e4ebea5 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_sync.c
> >>>> +++ b/drivers/gpu/drm/xe/xe_sync.c
> >>>> @@ -72,10 +72,8 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
> >>>>        return ufence;
> >>>>    }
> >>>>    -static void user_fence_worker(struct work_struct *w)
> >>>> +static void signal_user_fence(struct xe_user_fence *ufence)
> >>>>    {
> >>>> -    struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
> >>>> -
> >>>>        if (mmget_not_zero(ufence->mm)) {
> >>>>            kthread_use_mm(ufence->mm);
> >>>>            if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
> >>>
> >>> This can end up in a CPU fault handler? There might be some locking issues if caller is say holding dma-resv. For example the caller in xe_exec which is holding dma-resv. If it can indeed hit this path, then we might get some splats/deadlocks, I think.
> >>
> >>
> >> What is the connection between writting into ufence addr  and dma-resv  ? Trying to understand this locking problem.
> >
> > Basically the user can have the ufence be an mmap address from a BO, so it can basically hit xe_gem_fault() here. The mmap lock should already be tainted with dma-resv, so might_fault() should complain.
> 
> 
> I see what you mean, haven't thought about it.
> 

Thanks for catching this, forgot this was one of points of worker - to
avoid this locking inversion.

Nirmoy while you are here, can you add a comment indicating this so we
don't forget again?

> >
> >>
> >>
> >> it looks like I have to use a worker anyway to do kthread_use_mm(), https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-atsm-2/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html
> >
> > Yes, exactly that just with might_fault() in copy_to_user. Good to see that CI caught this. From the logs we can also see the exact dma-resv splat as per above:
> 
> Back to the previous rev but with the bool as suggested by Matt B.
>

Fine with that. Sorry for the noise.

Matt

> 
> Thanks,
> 
> Nirmoy
> 
> 
> >
> > 4> [233.110447] xe_exec_balance/3613 is trying to acquire lock:
> > <4> [233.110457] ff11000100085998 (&mm->mmap_lock){++++}-{3:3}, at: __might_fault+0x43/0x90
> > <4> [233.110481]
> > but task is already holding lock:
> > <4> [233.110491] ff110001231a1da0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_exec_lock_obj+0x88/0x2b0 [drm_exec]
> > <4> [233.110517]
> > which lock already depends on the new lock.
> > <4> [233.110530]
> > the existing dependency chain (in reverse order) is:
> > <4> [233.110540]
> > -> #2 (reservation_ww_class_mutex){+.+.}-{3:3}:
> > <4> [233.110558]        __ww_mutex_lock.constprop.0+0xe1/0x14d0
> > <4> [233.110574]        ww_mutex_lock+0x3c/0xa0
> > <4> [233.110586]        dma_resv_lockdep+0x1a4/0x340
> > <4> [233.110599]        do_one_initcall+0x76/0x3e0
> > <4> [233.110615]        kernel_init_freeable+0x3dc/0x690
> > <4> [233.110632]        kernel_init+0x1b/0x200
> > <4> [233.110645]        ret_from_fork+0x3a/0x60
> > <4> [233.110658]        ret_from_fork_asm+0x1a/0x30
> > <4> [233.110671]
> > -> #1 (reservation_ww_class_acquire){+.+.}-{0:0}:
> > <4> [233.110689]        dma_resv_lockdep+0x180/0x340
> > <4> [233.110699]        do_one_initcall+0x76/0x3e0
> > <4> [233.110713]        kernel_init_freeable+0x3dc/0x690
> > <4> [233.110728]        kernel_init+0x1b/0x200
> > <4> [233.110740]        ret_from_fork+0x3a/0x60
> > <4> [233.110752]        ret_from_fork_asm+0x1a/0x30
> > <4> [233.110764]
> > -> #0 (&mm->mmap_lock){++++}-{3:3}:
> > <4> [233.110780]        __lock_acquire+0x1623/0x2800
> > <4> [233.110794]        lock_acquire+0xc5/0x2f0
> > <4> [233.110807]        __might_fault+0x63/0x90
> > <4> [233.110818]        _copy_to_user+0x23/0x70
> > <4> [233.110830]        signal_user_fence+0x46/0xd0 [xe]
> > <4> [233.111108]        xe_sync_entry_signal+0x14e/0x1b0 [xe]
> > <4> [233.111366]        vm_bind_ioctl_ops_execute+0x3f8/0x910 [xe]
> > <4> [233.111665]        xe_vm_bind_ioctl+0x1623/0x22a0 [xe]
> > <4> [233.111951]        drm_ioctl_kernel+0xb1/0x120 [drm]
> > <4> [233.112052]        drm_ioctl+0x2e8/0x5a0 [drm]
> > <4> [233.112140]        xe_drm_ioctl+0x53/0x80 [xe]
> > <4> [233.112331]        __x64_sys_ioctl+0x95/0xd0
> > <4> [233.112342]        x64_sys_call+0x1089/0x2060
> > <4> [233.112355]        do_syscall_64+0x87/0x140
> > <4> [233.112365]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > <4> [233.112380]
> >
> >>
> >>
> >> Regards,
> >>
> >> Nirmoy
> >>
> >>>
> >>>> @@ -89,6 +87,14 @@ static void user_fence_worker(struct work_struct *w)
> >>>>        user_fence_put(ufence);
> >>>>    }
> >>>>    +static void user_fence_worker(struct work_struct *w)
> >>>> +{
> >>>> +    struct xe_user_fence *ufence = container_of(w, struct xe_user_fence,
> >>>> +                            worker);
> >>>> +
> >>>> +    signal_user_fence(ufence);
> >>>> +}
> >>>> +
> >>>>    static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
> >>>>    {
> >>>>        INIT_WORK(&ufence->worker, user_fence_worker);
> >>>> @@ -236,7 +242,8 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
> >>>>            err = dma_fence_add_callback(fence, &sync->ufence->cb,
> >>>>                             user_fence_cb);
> >>>>            if (err == -ENOENT) {
> >>>> -            kick_ufence(sync->ufence, fence);
> >>>> +            /* signal the ufence immediately if fence is already signalled */
> >>>> +            signal_user_fence(sync->ufence);
> >>>>            } else if (err) {
> >>>>                XE_WARN_ON("failed to add user fence");
> >>>>                user_fence_put(sync->ufence);
