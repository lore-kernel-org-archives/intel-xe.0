Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21366C77B7D
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 13:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E867010E1D1;
	Mon, 15 May 2023 13:15:42 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF40710E1D1
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 13:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684156541; x=1715692541;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wyr2JIQuM4z2ZndlfbkeEH+UwEaIH55N7HV4aL3cgmg=;
 b=BlpNbOZS6noPnhuuPXfz4gqQ6PpZXZL05r58BGt5oEUhafBiq9CqciFa
 MaSTUZHROub4tc+Ho/Hxpu1P5Ddwtq0stqZ8yY/TxD00oAw8hNzWD90b9
 iMQ2lHx7l3tUdCbAAP4AutFKyBfMImgAIh+ZuDGsWrD+zVOIvbxvwGVOw
 yhbhnX/xN2WOCuGwGqxwSfb+zBsKaWljtODTNW5YpRrgi0fm8vym512bM
 22BqjrQk/WMPdwRBQ9zPVlnhZEdgBoFFD3vEH3O9Ogdj4v6mKvVILs74K
 4lsM4l8pCzIFxb9iImJNDMOKVxgew+JMZ0DNYv7PbdJB4FDmD6FV75EaE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="330816104"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="330816104"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 06:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731622882"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="731622882"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 15 May 2023 06:15:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 06:15:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 06:15:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 15 May 2023 06:15:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 15 May 2023 06:15:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/gBkchIv6HjYXQHfOiQh7xbQLXQ24x/9RbvLYKq8CkcK6jLecWYeZ9g4CU+EEE4YwaUZmgsmwCrQ4+bCPzhn49yNfD+DV+33EW3dVGUyT2GfT5zIY6XhcwUIHx7R8PZ1XVqHwxFgAQs3l0zxl3BV9THUGS8Wc7VcTGyaHlHC11g6+I8Ej/luTJ918qGi+4DbuoHlRYjBLBgqgBkkF/b4o4Q0DUMEo1r5P+ac8cfsIg1/KPjMy2MLlQdyHGwx12UtNMy9raYrWwBz6/qAaEpqNxztQnwgLpDjJAs9JZykTaZgx08XPu5fzN6gI2odrT9GNJmg1mg0sNzoSPVJVogIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZo6gaH2H8c4vAptrSzFptbQxxF7p5oS1psI9WDfzok=;
 b=B6cXyxOSmUJLjOJyyISS2fFyDIS1HjrggZkCwUjtWozXtye0IUfEvcmQFykNrs8vQPu8lWdFtcpkTT4AB2AfC5hROfW1EHA3THWIMtvZ0187FlCsahYz5VCQi7rNp1F58sOfNqmxw5RQQ7Qy/hHhL5USBjXjrgMAyJBjboDfWwvhCBnBA340ZCg2+/KhYg3PK2vMV1PBCZ6ush45hy6egAOB0xsxNCVN74RbAKZ6Xsphn+pLIX6kz6vsGhKXVlTBqcPYL1JdaQPTGQTcnz+9rrSvNLdrG+ZoVzWOKsSgqs9yzG5pE53rjN0ebfWbzTTIDG6l7Pz6MjK3nc1eEHDZ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYYPR11MB8406.namprd11.prod.outlook.com (2603:10b6:930:ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 13:15:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 13:15:29 +0000
Date: Mon, 15 May 2023 06:15:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <kogwn7anb5kflqjizp3ncaop7z3dcklcbfnyhina2ylqzcidb7@ccqvfvavu4rq>
X-Patchwork-Hint: comment
References: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
 <20230512180313.1765011-6-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230512180313.1765011-6-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:303:8e::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYYPR11MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: ac1b44d5-429e-44ea-f530-08db5546746b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SCXwVrz7r2vwh6HtlewkSOI8L5zZe2HWDzpj+dRcPbAXAN7h01wXMnAeExas+Z3qzvDQ8teoT7jHp76T5uIqzeP6O4thdwofOo6Am9jYXbPdnuiZ4Bc7BN55KGmWsA5D31FuVas+DrVwQosFdpWNAL03VwUJlld9WdQenVNlmH9BiiTRMP2fQBLEaPIX6GyxNyYqadwviJREAd6yN4sRK6kUTN+UyC5U/TNcD2LtiaK4ZlxoAEfwrWdZ+05G+QY9FItUNidVjoH8oEyTsOA1QyXuPdQvdEyKRJ6cKJj4COsurHWLSwZB/hmZvgQn5XHfQoqCaJLdPDJDvM7U6WpIFY5Xp4ZMw5T5twGqsQfHLq3oiVTdpT0DVitgK4f2k+NO0IIJjepsSUzg+23uOH8DBTZF4hwhr+EWeyxkPspfwGBOEZc5FXOaTDy7jvnAyqSiEFvKCvLzC410avHzB8eUjrXUpvVYtChu9Dni2M//Ly/gu5IMlx0nQ0eiM+SOJXLcLEhZdzz0ZuTxxAsPsuUV2JpZsbLiybv0jB/a5d+BSqmCxF/3Rn385lZN1Zj8L1aq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(366004)(346002)(39860400002)(376002)(451199021)(33716001)(83380400001)(66476007)(66556008)(9686003)(66946007)(6486002)(26005)(6506007)(6512007)(478600001)(186003)(5660300002)(86362001)(6862004)(8676002)(8936002)(2906002)(316002)(6636002)(4326008)(41300700001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vXFHvAC/lYO2RGW4agZylHKv7i4kcFEgJiv9sBuVZkaBnql5/53El+le6a2P?=
 =?us-ascii?Q?Jj0a3hCyc1UHcyQKMoRvR4qQO4KSbsaewol3Klmn263nS3EVYAWp/nCd0ZDG?=
 =?us-ascii?Q?k4Ly4UVlK7qoDv3R++s7T0k+nQqf1zhUF5/H9Tfg9lc9SM0WuhgFHxJNxz/E?=
 =?us-ascii?Q?rdqr5v3Kp1QavurE2cxWrfJCv1PFA0rrL8MHu4D2JnuGo/66N1r0hJ539Fs6?=
 =?us-ascii?Q?30JZG4iRWWOa9t8ckVQRuc3GFUanQE24Phpp//MVFHjt8oKFfCAcZV2jzm3S?=
 =?us-ascii?Q?KxOZ11G4qUJZU8X7Z1PHqqmltV2ElV4ucYahEBd2fH2BPUvVJYC+yLk3t2AS?=
 =?us-ascii?Q?4rk4RomvUiRMzvTjDT/JtCBXp8enAcFPgnKqzp2gEwhVNM1MEb1Zql/toOYs?=
 =?us-ascii?Q?UYhU2iTXembc136ESpwc/+5PwohxBHOa9X0yIkmddbKLagOSBuO0L6BbauYL?=
 =?us-ascii?Q?7TLLnzZN6UKX4C+h7Fe3esvz8+Uo4K9JjK9+3ei3lpBKiIO40rR0Y+I+vu+/?=
 =?us-ascii?Q?IxLtgEvAacTJ2zG7WW1GBdAL9qEmLNZsXdOKvoxXWSMhRIahQwAFP8hc0+T5?=
 =?us-ascii?Q?rSU4HK9IU0UPJ9BNsUbBMvvOWsJDmoAcUjX8BGXgspSQqjyMZs9a86K275vo?=
 =?us-ascii?Q?VOgXO3JL1oAe1pS2vAlCAa32LLufmFSnZhHD0XoSXTgvsu1Z/gGk/oVNQnVl?=
 =?us-ascii?Q?/6zbR/MthMvzMd6j5MXmP91sreDHgZ1FvPQ4AIQWjAud8I337YGLvyY6+ErU?=
 =?us-ascii?Q?xczye79X9ifxhV4Gp44gQo3rAIZrUdWWaRppEbxnkhMYCxiop1y+YPXQ5kVf?=
 =?us-ascii?Q?DFaiisEOePCufHhkYb6ecckTQcg1agi4HVhLI+UzM4EQMKrMI28HHA7Uj/iI?=
 =?us-ascii?Q?4UBTaMDfshbdq844W6g2Qr0E2W0cHxKq2rq7D/+RNuE8FEPQ+9qYrmPaJDlw?=
 =?us-ascii?Q?d7d+73OPrV1ILIP22YRPVRE7D5iDEHqXh/GCnJK7EAGYQNYzVl3iWIwb/luF?=
 =?us-ascii?Q?JD03bngAf9fNZFtznuEpC3XIB5j8CsqB7s34woOy3p4eGIxK7e4l8MmBmrkl?=
 =?us-ascii?Q?GvbPjVErcg2BhYFaYzZqZyZ+nrjMLGTamD1x+i1Fc414to5OlPWedujgr32c?=
 =?us-ascii?Q?KIMX36tOGptiGFBva5cdR1HtYbyqfwdXqNY+s1h8LY0Zt5jugaMih1Uu0tf7?=
 =?us-ascii?Q?nLepD0vKnYr+Vfxn1GAopELzCWipPSktCnBa2CJsfVzBP4uceRJ+QmTXNTGE?=
 =?us-ascii?Q?Jqr4BVclsSzzaGShK+5Kt46HUMXCSo3TtX+rz8wiNNcwPSFlB5w3ouHTiVhQ?=
 =?us-ascii?Q?rXw4q5JFiefBg/sqw0GWrfGm6fVJL7TAYvCl+ArFOknLGTPxo83uvK4LjiPm?=
 =?us-ascii?Q?Vk78zhDvJbphOlJHEBEc23IqkZPTX6s8vHc1mfbD9AwPrF1X1yJxxs1oirdE?=
 =?us-ascii?Q?s1gob9o1MNP0gc7vDM/giE/cdkiEp/chtLNBPN+2y3ul68CJ2WTFEJeWohGf?=
 =?us-ascii?Q?zx2HFD7cpkzOIYGhx2xLELdonOMXH0kTIaRd1lMt6gThASXryFr6ntqvXp+X?=
 =?us-ascii?Q?CR8VcFweWhitCkJSTIO53zXn57fLuGwTc2o815WdFStgn09Fil1OdCFt0/6u?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1b44d5-429e-44ea-f530-08db5546746b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 13:15:29.4312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmLSNLGjE7BnudmnTRg5x048e95zAjJ/2fvtYqqyrXYzoGdyV7pnm+TQrEOUVSnw+32JqZh94IcCrMNmm0vQsHydAYpDJw/inzFe64uXKZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8406
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/7] fixup! drm/xe: Cleanup page-related
 defines
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

On Fri, May 12, 2023 at 02:03:11PM -0400, Rodrigo Vivi wrote:
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/i915/display/intel_fbdev.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
>index d89edd98e5d7..6362c4ce15b6 100644
>--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>@@ -179,7 +179,7 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
> 				    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
> #else
> 	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
>-				    DIV_ROUND_UP(sizes->surface_bpp, 8), GEN8_PAGE_SIZE);
>+				    DIV_ROUND_UP(sizes->surface_bpp, 8), XE_PAGE_SIZE);

Same issue as in patch 3: it fixes it now, but it will be broken on
rebase. If display is above b3b102692dcd ("drm/xe: Cleanup page-related defines")m
this change here should not exist...

Lucas De Marchi

> #endif
> 	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
> 							  sizes->surface_depth);
>@@ -363,7 +363,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
> 		else
> 			info->fix.smem_start =
> 				pci_resource_start(pdev, 2) +
>-				xe_bo_addr(obj, 0, GEN8_PAGE_SIZE, &lmem);
>+				xe_bo_addr(obj, 0, XE_PAGE_SIZE, &lmem);
>
> 		info->fix.smem_len = obj->ttm.base.size;
> 	} else {
>-- 
>2.39.2
>
