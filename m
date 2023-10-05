Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA493E92705
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 14:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D89810E414;
	Thu,  5 Oct 2023 14:53:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BB110E3F5
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 14:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696517599; x=1728053599;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b0qHLGkUvHxN6gozJeHgMhjaYtKlyuUOARVbITJq8uI=;
 b=OnvyC1mIUAisVURF+pLg7UGe3jx10ikeNux2K5wPnbDFpaWlp1tigdZl
 lBszC84Sm70iyi4SRD/w2n9eKcps6frWvXgSvX1XSoz+xRGUDIwarJs7t
 +kN7kg8gvBcemMjirkCD5iZ1ViDCaLJd8gm4DVZgXJlAk1mGmqtr02qwD
 8t8waiECjNznYuKts9iaiY/ID84bnuRqXd0fRGrMlP28wwm14ilP27NgI
 Dzodhgye8RCkmamHi6LoW8ubBZW31C1zUA96Q57Mw/epBrZUqn5oex2bi
 RRwpPY4qOx+4Tq/96MJBpJ7LeAzSenvR67rUbGi4XMSA0HDzpAxmcGEZH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363799709"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363799709"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 07:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745473861"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="745473861"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 07:53:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 07:53:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 07:53:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 07:53:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXxoy2Cf9H4kMVyrEtwA+NZneqSXBxo2wtahF7WR/met8BNOWpVEkh8zwsLG4y2H9K2Bw3Ys/Fn2anprg3Y71BBPp5QwTvMuwbj+6sDkxM21zer0Z57CGv+Dg0JinneYUGFtN76f5v/dR3iOMHdhYM86ztlsYGq3MJJqjfx79U4OGeGJMo8LKhLpBzkl9Nq/1KPK4FWMcm6NzGszF92ocAUn5C13XPctAcX4th6v9TwuKLdaf5gBNxueO8nlA6GMtO/aBPkHCQ8v+AtkGD+1jZeTZfVJX97IUiF53eZ2iZCECNBt/Bg1RkQsg3l7+9pr1EToFR9whrQpN+c35sBIJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJI70BS97oHyhXHZgqPF2MdrmbaJpbMb6E+6jugDbeU=;
 b=og0BL1ugHBgLSfGM5QOY2Oky5IdMumQtcCq4BVEolQOYBZoEiR/cDoOial1zDEZ779dOQjMgeJRZdP1WEUsAPQ/xfOj18uvCvc3q2oeZdt5NgdG/Yztj1Z1/yz4Ji3Suh9fgDIMSQXZ4zPSU8ygkK5++mfIs6x3klWP0AoG/6DQS7ZHUi7kASu9+G1eUHM2dJo+OjZm80ubMWdxWpETI+DYuv6aVpe44GrWDocLBFTEvwrz9avquyungKzvECL6fkH+sU1KBadQ5WeRP92YHtJHf7eMjf3W9ZyaupZzAU3qEXrJuN8zrs/20epJAZV3KI7XaFnsWY8CyCQbNlaqa0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6235.namprd11.prod.outlook.com (2603:10b6:930:24::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Thu, 5 Oct
 2023 14:53:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 14:53:14 +0000
Date: Thu, 5 Oct 2023 10:53:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZR7N15hfKDSAn/m+@intel.com>
References: <20231005095729.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231005095729.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:303:8c::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: 2025c006-3432-4564-94a3-08dbc5b2cd78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V/2OLF87DrkxpYTLjiM5RTUzpzBNsorKk83IpuCqyRkzyvWyKs7ntyMk2gXIgryEwB0cAbZgDV71PfJas6a4ZD5Tqz3hpZdPFl8EIkr4gOloxbujyvmySMocNv18tdEwEX7pzG1aOkRKWGkmM1ezH9HP5rjon/ErkfCYrYKqBSOQ37w615NTATUhyRDIXK2dJDbXSkEhezNVtsFj95WEbiGMKw0SboHAFFJdh/LgheoBjtu+YaK4i1eZaIjx/lvb8RhSeFzQCw/bn0XsUOLiL0jz16ArvfWHHEXTWi8y6r9QkzLa6FuD5Mqz1byZ+hd0YyE/eDActBvZLiGvDNow/yBQtczLEPLH39q4q+MXXMCmmMDi0YbKqoJIjTjhCQ6qcaLoyjZi0+T+yi2ZrzBl7QjfiaDmtbhKQ1MHPzNf8QQht7e4yX05QYYxE+Dq6goqFrNF13PsOWZlYCg5EUEMjD61CBwLK2L4yllikJV6kbo4TgC2PyGiXhTM2xG/j9wY3p0nn3OE07NhyoHjspUsizjtB2RfYY6a3XXKT+2oMJOShAIflSiMJljHW2OVYsWx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6486002)(478600001)(6506007)(6666004)(38100700002)(82960400001)(86362001)(26005)(66476007)(83380400001)(66946007)(107886003)(2616005)(6636002)(316002)(4326008)(6512007)(2906002)(6862004)(37006003)(66556008)(5660300002)(44832011)(41300700001)(8676002)(8936002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GqCf5F1cGOp05oDJf/Y0rDrbMN3KBdOnkKkpGrnVhU32jcmXUI5z0RvwU8x2?=
 =?us-ascii?Q?kXrgOfn2lCLfhmolUgsLzRYwbYuKBrYMzSdTZh2ZM6/wsQIV6DO++w13HzIA?=
 =?us-ascii?Q?qHDHyqs2yCnJw1pOyqkZWhmfTxOHOBLG2NgKzFAlhuujlNDHmsiootQzzmpt?=
 =?us-ascii?Q?3CezWCv75105bMmCby4Fo4HJH6t7MB1IX8IfL5ZTogU8qJI/SilRHHW6lCbM?=
 =?us-ascii?Q?n1Ry/oum32sAuZ3bjzhlD6a8goMFDAz7rZvj7wdH4guQbwMnzMPPz9R1Q612?=
 =?us-ascii?Q?y6/O8+WnlAzlyig+rbbIVw7H0mlTb7XSiMCuj0yfmK9b6c6E9yEj6HhP1ZHn?=
 =?us-ascii?Q?7KpdxU1rUuzPi+0BpxmmdkdP4T9xfKj1mo5PnngTXh27gilfchfe43gRip51?=
 =?us-ascii?Q?Bo8VSuUAgsgB2Y9I1weIFa/04f74+XOY0uesipEdx4snx4GwiY8PRqy01MvK?=
 =?us-ascii?Q?dS8VZwerv1w4oIhyoMp0ekDVobGeEkqCVJu+v7h17Jtb+vHhioOfekEG8sys?=
 =?us-ascii?Q?PWsj77NXVJU9KHKhY7c7DrA1U9zkbe16cmS64axzXfGkVlkxnaH5YW/7oaqU?=
 =?us-ascii?Q?/gJHP7GWbmr++YN8ZtnHiBrFrA72IdobcIEySFji6KMCSDLb1wOIFRd1ueMK?=
 =?us-ascii?Q?DrbWwDSs54MZV/YAEMozcXaYYWNg/1TPdyBp8A3sW5TZHMPPA314hW2qk/Xi?=
 =?us-ascii?Q?DRFoGxLWxBhQE2JVBqK5rUvC9PdCWZ77FFMURQMD1LrdXhon/QcJWxM7D7Sq?=
 =?us-ascii?Q?S6Ig4rF7HjkXn/whPFVWaogb3xxyzG0mQi62eN9X5DFtU8a1sDSirkgB5Flt?=
 =?us-ascii?Q?W53qedjIqRLrtRzg3qNmGMbAWtgUI8RgggwpXBxo9ni28fHJs4H382aokPtN?=
 =?us-ascii?Q?zoq5StQsYJrkRHcmk2iB1y4OtxvT11F/Xf/62B4xJEa9OBPIQ9HztLCUaN2Y?=
 =?us-ascii?Q?c+E7YxXsrlU6oS3Qj9JoRQRjn8tJQU/Q5ptm5YP7KG2gqetUtcXseg+gXLYL?=
 =?us-ascii?Q?ztTQUavIvXQspW4FrupG4+bDO2yhXrh9jmjbShXTtuJBcjRjtxTyyzO7/ThM?=
 =?us-ascii?Q?eUHmeKD+S/1YWdQKTOwh+uJ+ykiqbbu/LQpUs+yweXT+3kiABA2O1DrfkJrZ?=
 =?us-ascii?Q?x/eASjPBkYltK1UL7l2j1olLT2/99cepaGwNyuDF63LeBhZtRYLWj1SpLAbh?=
 =?us-ascii?Q?deZQbrFIsjfs3ffXhld0byv+7Z8RiRrmIBk7dB/vyiUjWq6jy8qCFtdrrHze?=
 =?us-ascii?Q?e26lgYLVLI4dZku88v3L8i/D7wRhvv5cLZNbIZF4tUKfW4Zskqc00hYKDyqw?=
 =?us-ascii?Q?ZaJ1F0VDzrtwFvNOtm3OHutdphzOYcv672RCjK4BIX3XoXrEsTjuIlfl9yPD?=
 =?us-ascii?Q?pG0impspp2GDN+vqSQfi2+lD5GLo/HHVaRTgGxBi74+DVX5F/XvfxjjJVWaf?=
 =?us-ascii?Q?KqMqyz7eD5W8P6MTJq8Xiio6iGkoaETlWQtTpMHZBd9/imaqeXCDPL+tLe20?=
 =?us-ascii?Q?YruyOB2j+5LB3IoWCwzRdWT0xGtbjH6zij3Q0UJLuNWHWUf0x3xxKWaJreZc?=
 =?us-ascii?Q?/4fL5qx2yRJLBQh5NSmrrAuIXJVxgi8tyuDuDaYN0nHzZm/d8tNd40XWDVZb?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2025c006-3432-4564-94a3-08dbc5b2cd78
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 14:53:14.7626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2f6YiHEo12SAZpagNcij+Ni4dZtVl79caYjsPQ/WLsFfqVMQTA2iB4FHJex+cbdpzLDP1TAu3t6ftfVeMbn6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6235
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/hw_engine: Document difference
 between instance and logical instance
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 05, 2023 at 09:57:29AM +0000, Francois Dugast wrote:
> Add explanation provided by Matt next to the definition, so that
> it can easily found later.

First of all, thank you so much for adding this here. Just for the record
yesterday I was confused when I noticed that the logical_engines are actually
per gt and not a global number, and though that it was identical to the
@instance itself. My bad, but then Matt reminded us about the gaps in TGL.

> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine_types.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 5d4ee2904240..aa8b5a2165c5 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -114,7 +114,13 @@ struct xe_hw_engine {
>  	enum xe_engine_class class;
>  	/** @instance: physical instance of this hw engine */
>  	u16 instance;
> -	/** @logical_instance: logical instance of this hw engine */
> +	/**
> +	 * @logical_instance: logical instance of this hw engine. This is
> +	 * different from @instance because there can be gaps in physical
> +	 * engines. For example on TGL VCS0 and CVS2 map to logical

here I believe we could avoid the specific platform codename and have
something more generic. but if we need the platform we should to with
the full platform name.

Then there's the typo in VCS2.

> +	 * instances 0 and 1. Only logical instances should be exposed to
> +	 * user space.

Maybe also worth mentioning that the construct is a sequence from 0..n
per engine-class, per-gt. And then remove that FIXME comment around the
assignment?

maybe something like:

"Logical identification of this hardware engine. A 0..n sequencing number
assigned at driver initialization for each engine of a giving class of
a specific GT. Although it is per-class and per-GT, it might be different
from the @engine on platforms where we can have gaps on the hardware
assigned number such as platforms where we have VCS0 and VCS2, but no
VCS1. Only logical instance numbers should be exposed to user space."


(Although I confess I keep asking myself why don't we align with the
hardware assigned number. User space drivers also use the same spec
as kernel)

> +	 */
>  	u16 logical_instance;
>  	/** @mmio_base: MMIO base address of this hw engine*/
>  	u32 mmio_base;
> -- 
> 2.34.1
> 
