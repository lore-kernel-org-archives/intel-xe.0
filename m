Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E91EC02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 05:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5100810E7AD;
	Wed, 12 Feb 2025 05:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oA5KEdsL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D751D10E7AD
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 05:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739339936; x=1770875936;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aFekuzvRmUk4QooUlho9u+g0FPCAIWEzYCHJ69eUQao=;
 b=oA5KEdsLYW/DDMJeuDRtjIILUJjlH1KvEY1fkjhwFd5sb6dbu+W9VSM8
 BwX2n0gutBQgW3xOtYPkwpJAigNyh7ioFLIwfnFuCbbqOwlAiTuMKxDIs
 pDqX97ODXHWp+Q5iii1qHfAbrg/Dm/GBBI8FjAyrjT/rTeswvWVd3W/69
 Nr1UATfK65OQXjGntOPF2zM/ss1/VwVO1AajBQHt32PcXSWopY+Kq5pFJ
 c8ijtyhzX6ySq1FlwwrVhNm1wY56VleDvC8zj0PDMLpEWUemJ7xU+vf8D
 moVxOVFSWTsCxs+FEpE96bvx7pRPS+rtfYXxPSL8AXb2TcRN9CUE4zEU0 A==;
X-CSE-ConnectionGUID: GB//7Mb3TQSUehPvLlxb1A==
X-CSE-MsgGUID: s/vA6snXRVqq+jUI/yNCIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="62448697"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="62448697"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 21:58:55 -0800
X-CSE-ConnectionGUID: COAYFjaUQUuUnltPBniESA==
X-CSE-MsgGUID: SxdUMCZGTZ2P2KUoDpDfBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112581668"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 21:58:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 21:58:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 21:58:53 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 21:57:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l02YusXovOODfg/KKh0LqsbXJcrbN4/v0EG8bjZYZoeoMifHH1PPfOv8VEQL1ez9CtaX5sJBzEC0k1YfqNjrtWMgj/6118H9dSHmiXiFfhaX1Ct+WNptG1T5zHPZhjm3uoCbsFQb8BsmhwQaXsgj1xFwWlwXygIaVfRY5ryDeWPXfTx4XGi4FdzqO2TxQJtEMRN/XklViDWq3iLn9l4wLGrKDc9rjJxT9HP9nO0GN5VuI55hNUw/ceocF11qsoV8pYSTiU9W24amKqun6j/101ppouIYaliBhwL8nOGoLOekeSGFRqLvHnFwZigJP5bxK9fyH81HETXwI5dqsNb3Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J62T8iIo/VUbLDM3N4Ay5BoeBhPH7F7SEnBz7WuzvWU=;
 b=iaL5GyBcnBWGMS3hHPolREUaz2FoxjwUK6FYeoEcvS3eWLuFk5S9o6tweomRJJX9kATtWbF07G5U+Kc8rzPdGKF6oa7FP4lZe75Rw8V/QRTdcUaGN3x6MKNnr8RG+h27ks31uAFqwpYUkVP0qG3bQaAA3RBIZkjpbxf6XKZ2qNlUB7FIEBJHtlaEXtbPgGulrEZR9AM2a9SR8pIpikQE22QC5O2U36BVChh2wEZmkrLBjz+koX+wv8mrIxVSHxWVuPQgqUOwjEFnM1yQqjfuo2wK8MvrpjcToeSDmQeV5mJGzWZpF/wC5tCRD90NfOvp9WKvY26Mz4tpPuxapJnPcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB8213.namprd11.prod.outlook.com (2603:10b6:610:18b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 05:55:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 05:55:02 +0000
Date: Tue, 11 Feb 2025 21:56:02 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, <intel-xe@lists.freedesktop.org>,
 <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <niranjana.vishwanathapura@intel.com>, <ayaz.siddiqui@intel.com>,
 <tomasz.mistat@intel.com>
Subject: Re: [PATCH] drm/xe: Add per-engine pagefault and reset counts
Message-ID: <Z6w38scZQPsLIfCs@lstrano-desk.jf.intel.com>
References: <20250210193657.96030-1-jonathan.cavitt@intel.com>
 <Z6u2uH9hkHyJ5kP4@intel.com>
 <ywxrqrblg4fmyhpxluq46fdgyd6c3pol5ic5u5emehybvypmho@fs5jajwfogtp>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ywxrqrblg4fmyhpxluq46fdgyd6c3pol5ic5u5emehybvypmho@fs5jajwfogtp>
X-ClientProxiedBy: SJ0PR13CA0114.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB8213:EE_
X-MS-Office365-Filtering-Correlation-Id: b04c3348-9cb4-4a9e-c14d-08dd4b29ca70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6ddaIIBKbPdhFbNjSB0SyQP/Zkyz9nPny3OFyriGAGTub7cmRqYImBVp/CMg?=
 =?us-ascii?Q?uRGke66NP8Guj6NBOCgrr76D29b8TlwuRbr8mnE3sPuZV5EY/0bc8RfF28zm?=
 =?us-ascii?Q?9mjLkqmTuqD2aGe3V6AC0GlsCBrtvIR2V6onjZ/kdRWbpNojSm8RRm/yn6Wx?=
 =?us-ascii?Q?yoS/DzrD5Fv32+85fSYMPWhWo2mCCz8czjXRtdQ8QN4XO6EkHHboV854UgO9?=
 =?us-ascii?Q?fyoIwaNgwbZrdStP01EOLia/l98OL7VFgM+80tLy/7+Bh346XqvJp8Yb6sZ9?=
 =?us-ascii?Q?lRiFhWsCLk1q8SmJr3zBzHyic9Bs4OjNdhJ367JZ54TvRlvpnSihVL1o/b8m?=
 =?us-ascii?Q?Wh3bIXFmk6deYxoC1w2pbV6qjabQ7FJuv/hELOKpQHOi+wtQNkaHDi2+Gjuh?=
 =?us-ascii?Q?TtG9TpcOLj/jUwaa4tzJVx8gk6DEMMFQarlbKiz5DSbHyfcVgoDrNGQfGC6A?=
 =?us-ascii?Q?PovxewaCHOsEPTNdnxgGpzUXWjbxUKKP2+D2V5FjnhdR9LMWNBBa9zSMtV0g?=
 =?us-ascii?Q?XeLC13NMyYiyJ+X2NWOdTHxo9cTEFqyXXUJ81p61JcYkglAQphkh9F6TxqfM?=
 =?us-ascii?Q?iXsFpGVfIujJ6f1lwdU4ngzhm9ACMtdr1aztZpk/+nk1/dHMMaLYjK2h/IlS?=
 =?us-ascii?Q?U+oZ1cs9lGMJYX1W2xAZxdzKwvOhEiAQZrfFRAs0cg2M6TXZKP3J0m7Z1PJF?=
 =?us-ascii?Q?aejQhIBuE9+fgXOpEzgtpjhHHrawQhlBDGtSJEhqovf2w9kFOv6bpMqRl4Ie?=
 =?us-ascii?Q?9mnqsn4Rur8OaKe4PFMs5GVGKddINENnGHEX3j1gOLLreBG0B1GuDJshfJFH?=
 =?us-ascii?Q?ni8k1u28RNbIV9cVYxGhZr+5xXNNib1KueAVeM3laCJLIieiqdRQAhYaAN0G?=
 =?us-ascii?Q?/b/9LARhuimL6PBj/Cu9Ez4KusJ6Xoc3BZD0g7arzTQEb/GsW+GQmYB/W//6?=
 =?us-ascii?Q?ajZd6sMNBTNx6rrJ35uwDRUyfPDaKbmuA82X1D92bNkccHC6uIOHvemzd/Rk?=
 =?us-ascii?Q?fV7xTdXIIDmpiOPgemQPMvM+IRL6QHS4CGw00TM2cz7gz/IV1BO218FpksaO?=
 =?us-ascii?Q?o6pYstFjdjLRswen7u4jyHblNApJ7zEl/dw2ZUTvs8gWWdO95cGiDMUPKrHB?=
 =?us-ascii?Q?XMUbZVPuBV2G5J47mzO1cqUAX7zt6zjGj4WAaUhCDIzuTXTDzjdVH1sDe0ov?=
 =?us-ascii?Q?L6H4GSprQFKSfeiF70Ie0c1EXNU22zGqvu7QYyvy+Z5Uoh9Mb50Y9YFFG4Z7?=
 =?us-ascii?Q?qxrz9eQv5XqWIvk2vUz0ZbuDbrEY+0Q38Hh6sqwzNLX0cD+Y+TJnkE1TpRhR?=
 =?us-ascii?Q?ygh4tBVI3VgeANAyk1WHrforzlFaB+P0Ndlhf6998eCqOw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OzTbJSRYrdRlXyqWxy/DwNNWLGdBCY7wPaw5AE83+CuMT5nQN0IJAa7tTStw?=
 =?us-ascii?Q?iPMu/6c79YGSOP5Nkvv2+bSIAmIPwN+oU8xQUmYqd4LuUCzfT/0sG6O4Alvq?=
 =?us-ascii?Q?iUEdSmuDPLGYrX9xaJlwaFddGK1+6uKsz2/YWtanuKXMznBwYJV9FcG95ub1?=
 =?us-ascii?Q?sewWzDSPU+7Yg4uxOUcaKKk9u2gxUJehQxK843VoxMEttuPSmIUuwbsjLeAV?=
 =?us-ascii?Q?UpJkP0jFP1U3orFuFSC4cS7q3bsXktWEiN2YDxw3BAvMvKhGs9pJ2uOA2wLH?=
 =?us-ascii?Q?fzRQCQO2mopKzn9E7SpRXWP8fuwLzHSiWZwoHrfge8Z3vR7GBEZUDk8PD1St?=
 =?us-ascii?Q?z2s+bccsla4glQ5oKTlz2Q7S/mp4PASHxadCxxkpaWVxA/RcrcBKrEyyk6Ws?=
 =?us-ascii?Q?ttg5GKTN7f0CM3D1C3q+WD+zL3dAfqwEQ7EaTWC6yq0euTXhznhssFaa82TA?=
 =?us-ascii?Q?Hie+xgHnMNxHJHmnAqYpctT6y3juKsPn7sklgwzFShLBibFKzt+4jeH5UyZ0?=
 =?us-ascii?Q?cbekNxCWIjZmWEDOzoVf6eS8jeVBz/5zZcgqRxcFGtGyp88vB0gxtYMYcN1m?=
 =?us-ascii?Q?U9jf7pnI3sO/iKQ7sCnWVWtCGLzHz7HM4ASf6x0zzzEmy5pnStqznSu0TMTc?=
 =?us-ascii?Q?pYxbx3A6diyTbZVsG8uhHLqmotifIoA4C18GwDAhq474DvvYx0+gULC/LsNf?=
 =?us-ascii?Q?fgskZWVEqAf1bPONZTcS4OdTbiHudBALpsb/1MId7j+Cvo4rXxk8K9XpQ+Vw?=
 =?us-ascii?Q?TTSFHeDA/X/uBFSlQ09nI1Wu2kZ846fgfdit+JrJdtUe7zLn1Yk8T9txvRCw?=
 =?us-ascii?Q?GplgvH4DbEEnTitLwCFI6Nzcj0hZAapJWrMHaDmVhE1YvlH6Nhv8f+yo5aUe?=
 =?us-ascii?Q?ruoZhkOVjIUwr9loDPhbrSS20TrNVZ0xeqNuCgt+PIXiuBbAk0uZlvCui0t5?=
 =?us-ascii?Q?4U/UK1kOEA+KwO/ZCTC1F3gQRGrwoxFaZCpkwmHOM5JPkbRNwxw844MTqqP5?=
 =?us-ascii?Q?s7tAWU2QhAXlU4f3PlRFmZ/D+FxCxPspnm70bsRsJ+5ZmLeulEUapKoqxB9o?=
 =?us-ascii?Q?frNXrwMH3HqxA8h4/2joE5weoBUmxDNoia4ItTeK5ZPeDuNOonfwmBOcCHs8?=
 =?us-ascii?Q?i9booRp7yTqWVolhJKTbCIZmu0bdSF/7hm82kxEv6U1UELFIs3NuARJRJNsR?=
 =?us-ascii?Q?IDNRo7C4LpH6g9rWINiVvdLUTpeJUxS904MBAzshTjkD3PgahDoKh5sA0ElC?=
 =?us-ascii?Q?vw99Tm+O5ffdmHeWDOl1YiVCGRygVnNXUlAKovGfvzNVlcfWByWz3GRP0HkE?=
 =?us-ascii?Q?LIvmz+4ZK9r6l1akgG0uRTb5CeL5wC1luO43jplIVDFdyds1D5gHR2Cz9t3T?=
 =?us-ascii?Q?yigQMQ7x4NHjzdMbIyMAqK2LkXkdlU5YRIzOdyGEYGPKKfY8rdWkq5sFIDK9?=
 =?us-ascii?Q?6lfIWE1n4KevH+nQo0rONQTyShg4U1xqOF2mrpSOvWwOv7bd/TvXGKtCinEL?=
 =?us-ascii?Q?d2bH6ycjeL0Wm3tCKwPNl3Vy3HcP/fPkz4+3/L5d0es7kpl4raaWNKQFwvCe?=
 =?us-ascii?Q?lf1zttukLXKhryTi4eXd4+ZJR7Dr1Jl6Ub0YFZ0ydm7eSwjURrXrhemKYKTM?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b04c3348-9cb4-4a9e-c14d-08dd4b29ca70
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 05:55:02.0578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62Trkp8GL42yy1sptzI2IaH8qV3E1yMFTCoAgR3hjq72S1f7tx2jYMkdAQA7njYvBhbJXWfSprSIpCGjZilsCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8213
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

On Tue, Feb 11, 2025 at 11:37:12PM -0600, Lucas De Marchi wrote:
> On Tue, Feb 11, 2025 at 03:44:40PM -0500, Rodrigo Vivi wrote:
> > On Mon, Feb 10, 2025 at 07:36:57PM +0000, Jonathan Cavitt wrote:
> > > Add counters to all engines that count the number of pagefaults and
> > > engine resets that have been triggered on them.  Report these values
> > > during an engine reset.
> > 
> > My fear is that later someone start using this as some form of metric.
> > 
> > Could we keep this behind a debug config?
> > 
> > > 
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > CC: Tomasz Mistat <tomasz.mistat@intel.com>
> > > CC: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> > > CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_pagefault.c    | 6 ++++++
> > >  drivers/gpu/drm/xe/xe_guc_submit.c      | 9 +++++++--
> > >  drivers/gpu/drm/xe/xe_hw_engine.c       | 3 +++
> > >  drivers/gpu/drm/xe/xe_hw_engine_types.h | 4 ++++
> > >  4 files changed, 20 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > index 46701ca11ce0..04e973b20019 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > @@ -130,6 +130,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
> > >  {
> > >  	struct xe_vm *vm = xe_vma_vm(vma);
> > >  	struct xe_tile *tile = gt_to_tile(gt);
> > > +	struct xe_hw_engine *hwe = NULL;
> > >  	struct drm_exec exec;
> > >  	struct dma_fence *fence;
> > >  	ktime_t end = 0;
> > > @@ -140,6 +141,11 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
> > >  	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES, xe_vma_size(vma));
> > > 
> > >  	trace_xe_vma_pagefault(vma);
> > > +
> > > +	hwe = xe_gt_hw_engine(gt, pf->engine_class, pf->engine_instance, false);
> > > +	if (hwe)
> > > +		atomic_inc(&hwe->pagefault_count);
> > > +
> > >  	atomic = access_is_atomic(pf->access_type);
> > > 
> > >  	/* Check if VMA is valid */
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 913c74d6e2ae..6f5d74340319 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -1972,6 +1972,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > >  {
> > >  	struct xe_gt *gt = guc_to_gt(guc);
> > >  	struct xe_exec_queue *q;
> > > +	struct xe_hw_engine *hwe;
> > >  	u32 guc_id;
> > > 
> > >  	if (unlikely(len < 1))
> > > @@ -1983,8 +1984,12 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > >  	if (unlikely(!q))
> > >  		return -EPROTO;
> > > 
> > > -	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> > > -		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> > > +	hwe = q->hwe;
> > > +	atomic_inc(&hwe->reset_count);
> > > +
> > > +	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, pagefault_count=%u, reset_count=%u",
> 
> I don't think the message was accurate here about being an engine reset
> and this is probably making it worse. +Matthew Brost
> 

A bit confused by why we need this information in dmesg, but also not
opposed to more information.

> In any case, instead of polluting this, what about printing the counter
> under the "stats" file in debugfs?

Agree. I already suggested this [1] but accidentally replied to the
wrong list / post.

The current stats interface for a GT but IMO is light weight enough we
can more or less copy / paste for other scopes (e.g. device, tile,
engines) hooking into debugfs. The idea for this 'stats' interface was
for IGTs or quick profiling of workloads in a generic way. This seems to
fit with this use case.

[1] https://patchwork.freedesktop.org/patch/636270/?series=144622&rev=1#comment_1162350

Matt

> 
> Lucas De Marchi
> 
> 
> > > +		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
> > > +		   atomic_read(&hwe->pagefault_count), atomic_read(&hwe->reset_count));
> > > 
> > >  	trace_xe_exec_queue_reset(q);
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > index fc447751fe78..0be6c38fe2a4 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > @@ -516,6 +516,9 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> > >  	hwe->fence_irq = &gt->fence_irq[info->class];
> > >  	hwe->engine_id = id;
> > > 
> > > +	atomic_set(&hwe->pagefault_count, 0);
> > > +	atomic_set(&hwe->reset_count, 0);
> > > +
> > >  	hwe->eclass = &gt->eclass[hwe->class];
> > >  	if (!hwe->eclass->sched_props.job_timeout_ms) {
> > >  		hwe->eclass->sched_props.job_timeout_ms = 5 * 1000;
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > index e4191a7a2c31..635dc3da6523 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > @@ -150,6 +150,10 @@ struct xe_hw_engine {
> > >  	struct xe_oa_unit *oa_unit;
> > >  	/** @hw_engine_group: the group of hw engines this one belongs to */
> > >  	struct xe_hw_engine_group *hw_engine_group;
> > > +	/** @pagefault_count: number of pagefaults associated with this engine */
> > > +	atomic_t pagefault_count;
> > > +	/** @reset_count: number of engine resets associated with this engine */
> > > +	atomic_t reset_count;
> > >  };
> > > 
> > >  enum xe_hw_engine_snapshot_source_id {
> > > --
> > > 2.43.0
> > > 
