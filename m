Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C9ACD3442
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 17:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E6410F450;
	Thu,  7 May 2026 17:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMiGrXXe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F8810F450
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 17:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778175923; x=1809711923;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fdPbnJL7lFf4LLBW750Q0jMhGhAmk9RAIoWYJPkEOGA=;
 b=dMiGrXXe+lMRnZMJg8EDwYZZSplpQfzNWEJuLDiOZ+RTmMfT1vTuC03z
 ZnZh/RgcMeiaTVguSmcCbyDimVKWws6WJqI2V/B2ouwgXB2CY938uSVwR
 E5ErzI6JwLRu5qu++OIDWCzsPGjtR9kbNjB8baXhYGEAWZPzLehP306sc
 i9Ne7Gy9SwW/xOFCZe0qdsfd+MpGFQZMmgZhMeIm3UjoN1G/Ce6Z8SU5y
 QhO85vWEMbTsH6z+xoOYbL9rBj9QR+t8LjLWnSNsmlE810YJntu9hxGKd
 l7gj3URx+RPzsN26sMsb0RoasQTvcnU8maaJ/wQvwitktNDC+IeiXprV2 g==;
X-CSE-ConnectionGUID: XwUwFiP8RMqg7uif2PCW1g==
X-CSE-MsgGUID: hlYzDZ6OT52bAguPPHAAag==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79073592"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79073592"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 10:45:23 -0700
X-CSE-ConnectionGUID: XeSIIFr+R92zvz8vE9fqlA==
X-CSE-MsgGUID: Inh5Ka1dQT6bpnEC+YTgvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="241525523"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 10:45:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 10:45:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 10:45:22 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 10:45:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmrmZUYhkeT9C6IaNeVAAL+crQoKX4BRND+NwJbla/YBsBXu0qKcpIaUPaYI/oYPxCQ80/8im+Qxu621RC1/l4udp98+69OeA7WZRSw2vn7ZRTXS4QpVS7G2kbrxCb7P7pA5aSJMT+w9e3cmFBR1nI3t9B432Zv1s2/PrJ2omIXGsfGWPzNCqPhR9xrp5TzOIS7GZrV8ouO+0elr9qfVWxDWPpUC/29DvM5HrexGCSa91EbLd6h+XxienB7nGHe6Egfe9N4NOkgAHF62pnf1baMN/YBG4H4Cjx3FMGk8pbxfsFxA5Z5ZtPLFWXaoCUpinIVhcz11yFhp1pY+yYeM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xo43fal26krmzZB+BcuRaqL9mxNGtX+AQeBBt5VlKb4=;
 b=TJDA6kB5qKCLYaD+Vm8KATzDyQfiQgeJlOoFizOIzoht+Ywr0TFKYBU2EbtU3gc0xoHkhEqj1B77YS/z5DRoQOl3xWfZCg9c5/jNeuM/2KwOLP1LbV1yys7Pzf/cI+JHbWdeCDnHCHE1rAYL+urMXuukqduXiQrxdGyjz1/taMHddHbos+QJfk1qPYlwYLt41ZWchQ/+e7v3fDgwhogUC4sCUxx0fOMiG8pzBWyl//WTrHjPTI6Q6i8KoAJPGi5nXUc8J/6g0H1M5aKV88juK/Fv/4Vs1VMJQqNXylsEsHQNBkkQoss/lKm21fNmsH5vKR+EXTwwjrrGiAhjwdhOXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB4887.namprd11.prod.outlook.com (2603:10b6:510:30::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Thu, 7 May
 2026 17:45:20 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 17:45:19 +0000
Date: Thu, 7 May 2026 10:45:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe: Refactor emit_clear_main_copy
Message-ID: <20260507174517.GO2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260507064229.397673-5-balasubramani.vivekanandan@intel.com>
 <20260507064229.397673-6-balasubramani.vivekanandan@intel.com>
 <20260507171643.GM2131374@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260507171643.GM2131374@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR17CA0066.namprd17.prod.outlook.com
 (2603:10b6:a03:167::43) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB4887:EE_
X-MS-Office365-Filtering-Correlation-Id: c08cd500-45b7-4bdd-c06e-08deac6067f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: K67u8dgYGrEay+skMg5jE3w0gOeczn4sW3F58d0qbNZ2mYqGR8hEjeORrzNaRTLw8B6EmG7drOeTdG3F5K/5cGb9cEcdI9ckqM7aupSdoWgta8HRPEsD/GaMGOxa04nz0ycxdQh03a11P831O2kMGSyKskrLepnynyJF6Epesx6jGbPkEqUlZXlbgf084M7wwWYKQRs1II9CQefDa/+rYuLypK2plnUCyiBoHEQ4xItOAWqQlVp0qeZdynj5BMasSVvJiBpBs6NCojZ82u3uq2mkJfaXgeEQNBKPOuYeBP0zRCpE2sLk62xymSIJvex/5oek/jhdtERVEOD3foeoUNq5V7EsEPokffjwMpNYMQA3NvXIRK91Bf5M1YizBjOcbsSPzDLI4qEp3vvWrzSWc2IORxwHZJeE/HRzITnA4FUUCxHzjaa2oZ5jFMmtl4RUQakowH6I0pzzYZkIae6uUGq76+H76Oxr+ZaGWD6THplXkkIGSpapTCBbjMRLeIKJr8w3nCn3C2nSlDUiIPBtM2mP6dQMa2X1wUYtOvf6wKrXtUlspB9+Y1nUQ7wfxiIHpSz+Gt0jjWyIcwhbADTdlmStj8s8gDXX4EguM3vNm/IoKzeTLvtACUI2NvTvsfXpTqBTyRyCfa2zlZe2pPgpkMth+/afQal8xXl51c2LUWJn8FXF4PmDZLA/9AZwiXPh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nBavdBf9WYN8Ve2wKBw1Z4pquU1m9wHq7iX9h2urQnxy1ptIY5yAtoM9CpDf?=
 =?us-ascii?Q?IugC8lhkmQkN9ACQfrWYXFn6GGtUsyiE/LA3k4gy1g6BpIJMgO8YPaGHCYpS?=
 =?us-ascii?Q?RFy6eRbj9VKVD+U06eaBTmH4Np6fSsURk/4uJxCbfzyjApZ3Wc463HI9ybIJ?=
 =?us-ascii?Q?KtvxTnnVldPl9bzCYLgQ1lOuH44KEvKUw+fqDsWCqJ78O9dctBbJV9ZnD9DL?=
 =?us-ascii?Q?e0J0YG1SQhrA3yFgx9PRs0FT1cMYjtcnjedtOtZmO/h6WLUSoaxN9F9KyUS7?=
 =?us-ascii?Q?nkZTLstlYOdd0a+EYpfA4Yi4WRbI1HVBUAeRuxt7O2ZKN/8wccKwuZDGn8w6?=
 =?us-ascii?Q?+zchPn9ZEXNE1QPd62ihhyysyutUMGRf3e3DKLQEBgNTuC7p0i31W5zMSa6a?=
 =?us-ascii?Q?asQer5Kvmd9fwXZYU7fjIl5a8j1cbwOyGBSYQUTrmkN3wzsWfM2odHxpIoWa?=
 =?us-ascii?Q?bgQoSMPl4U6y4WKzH+47GjCOA7L8LxJraJqBCibU2geeF8zsH3+k0/hnfSlJ?=
 =?us-ascii?Q?M55c+UL9G+JOad6/QZPwo3VFxybNLZaIWcm28y0k1y+yW2B22WUwhqtDNgAo?=
 =?us-ascii?Q?hbEAfikiM/MGViRk4C1QEp7pejnDQX2c6x3j0B+RLkk5oiTOc3mpbzdI9lvq?=
 =?us-ascii?Q?k+HSBq5l0onkdamJ8Xp9cPJCJ8MIbtoUq6IoQL0qIC60ZOhyg3xeeJ89BtOm?=
 =?us-ascii?Q?w3KmoIwrbhUshIA8wtb4ec5sX+K1eWad/HlwbGUR5MUE3YVrrXsQmKcHrflr?=
 =?us-ascii?Q?hAu6nzH4Hw+NE0/+nkNYi/sDnfBclFchFw8MDiU1dUhCjSp6I9X3WKQj63Uu?=
 =?us-ascii?Q?IZ9B043Qb696gx39hJKZlbgW0xA7OXxIaviwKAUfcJzqOmnOkKrzPiPiNeeV?=
 =?us-ascii?Q?XU02xE8aQvbQePUtYKA8KEY3KNIWc4S2DN8BA3iX8pGfriy5l0vEG/yzUJE3?=
 =?us-ascii?Q?ge+ly0CZABme68oTI+eqnoUf0NEzp8ZMIjM3ywUluKBY0hdDt6Iyrh7p58x4?=
 =?us-ascii?Q?AJIwTjMDqEGEHShbm3p5iPj61cBbkhmrbaeVj5iPBVonllzjtrOK3H+wi8X4?=
 =?us-ascii?Q?CqNjuCpT/GswfRT+uMW3xsB0EtAyh5G2dcD7DIRnMoKj2CmGaH0YdKajs3AY?=
 =?us-ascii?Q?+erIrG5ozbVbDw7a9ggpNNAXfgZktkx+T7Qmic0grRj41UmoiC7qiSrzSH0h?=
 =?us-ascii?Q?VxIInSCbXl0d9Y/6PmowIRvwgh7DiOStPDnCNRcIuXtE6MgwAOO0aemUsvTj?=
 =?us-ascii?Q?dLoz82QJk2JRtNSiMrS+jS15sJFRBeMdLHE1XuehRUMGI/iGakkhSLk6agp0?=
 =?us-ascii?Q?BZefcazbvyhRk6rTRDFTkShhMk6C8qs0StbU1V97FeTwFLhO5pTyq/XXLKj2?=
 =?us-ascii?Q?uS210otak0tABjQqxN01O2AxplV4R3FHN0eFeCVzOIb0jP2/pvLxJZymvb3p?=
 =?us-ascii?Q?LAyomlJArc8WV8dmQcl70M2RjTXsXpYLfbSUnpbb1B4UEfEyfc0WJpGkEzjQ?=
 =?us-ascii?Q?GP7MV7REw/2lmUesEQti7fqorBos+FRkmSsSdOmE7xXMc01Croq/6S/aWEG/?=
 =?us-ascii?Q?zXkmMLmi0/TX2oRKdouUf7rkt9Tc07WWvCTqWhzDtqQRXxLNVRFrbteGiUVE?=
 =?us-ascii?Q?IHCIPxU7TxHFV4DHXeh3AfkTE+nTfn8TxqHlAPo52J9rQS8IRPbSnjP8RtIt?=
 =?us-ascii?Q?wWSYXhWlxjgrAAr1tnxkghOcZVO6l2vDMdbPUDRyySOzvCi/UiaMiOMpQtI4?=
 =?us-ascii?Q?UPkG5P4gZ/A7mRhRTgiO53m27JNuDjY=3D?=
X-Exchange-RoutingPolicyChecked: XcdwJcFA6snCttHNZGNNEyzxgUeFeBKPQwvRXOqR5CB2Bb3z4/tiCOnawnH1rSj2adZUM8W6nlah1xuHxp5cxl8XvMrlP9LjzBzqCEggHRp1mUs2+KaEL4jt1OukzwP2z0laisJBZSzfMxXbI3t2AnTCM0MXZyUmPmUMtAIoZVuXInDLJ3O3OvVI3+YZKbLlWO9Cw6EAcsT8YpzStNMjjP499TY98+cJJtr+lR2mLvD1hgOo637J0EzBPdvUWjH4CYZ/9E8jLvEHQMpiuRkHFMhBLsOgkrcu0lEzOMXJqDr2a5uWRP1ThmlBDBiAuFSXvP/pPUXmL2psI6E1jOp+zA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c08cd500-45b7-4bdd-c06e-08deac6067f3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 17:45:19.5792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NG9w13NxRAPSXQ1I/Nt5AYyOiNxT3VTjURTKph++8aEJGiN1BoD+SgFgvrnvH770DlRD5AuvNvDJE4ZqxUR71WA4M2z9j+q5zn37JXDdWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4887
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

On Thu, May 07, 2026 at 10:16:43AM -0700, Matt Roper wrote:
> On Thu, May 07, 2026 at 12:12:31PM +0530, Balasubramani Vivekanandan wrote:
> > Implement a function which returns the length of XY_FAST_COLOR_BLT
> > instruction instead of hardcoding it inside the emit_clear_main_copy.
> > In future platforms, the length of this instruction is expected to
> > change and this patch helps in preparing for it.

BTW, it's worth noting that even if this instruction changes length on
future platforms, I don't think we expect to use this instruction for
our current code flows.  Everything Xe2 and later (and also PVC)
supports service copy engines and the new MEM_SET/MEM_COPY instructions
that were added as part of that hardware change.  So
"emit_clear_main_copy" is really a function that's only intended for use
on non-PVC Xe1 platforms.

That said, there's always the possibility that we'll need to use the
legacy XY_FAST_COLOR / XY_FAST_COPY instructions for something specific
in the future (e.g., a hardware workaround that asks us to use those
instead of MEM_SET/MEM_COPY), so it's still good to capture the
instruction changes in the driver, even if we don't expect them to be
relevant for now.


Matt

> > 
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> >  .../gpu/drm/xe/instructions/xe_gpu_commands.h    |  2 +-
> >  drivers/gpu/drm/xe/xe_migrate.c                  | 16 ++++++++++++----
> >  2 files changed, 13 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> > index 885fcf211e6d..082f2926feab 100644
> > --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> > +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> > @@ -20,7 +20,7 @@
> >  
> >  #define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
> >  #define   XY_FAST_COLOR_BLT_DEPTH_32	(2 << 19)
> > -#define   XY_FAST_COLOR_BLT_DW		16
> > +#define   XY_FAST_COLOR_BLT_LEN_DW	16
> 
> It might be best to just drop the #define completely if it's only going
> to apply to a subset of our platforms.  Leaving the define here risks
> someone seeing it and trying to use it elsewhere in the driver where it
> isn't actually correct.  E.g., it looks like the existing usage in
> emit_clear_cmd_len() was probably incorrect since Xe_LP platforms
> actually needed a different value (11)?
> 
> 
> Matt
> 
> >  #define   XY_FAST_COLOR_BLT_MOCS_MASK	GENMASK(27, 22)
> >  #define   XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_MASK	GENMASK(27, 24)
> >  #define   XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT 31
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 078a9bc2821d..e4afe011f246 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1409,15 +1409,21 @@ static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs
> >  	bb->len += len;
> >  }
> >  
> > +static u32 blt_fast_color_cmd_len(struct xe_device *xe)
> > +{
> > +	if (GRAPHICS_VERx100(xe) >= 1250)
> > +		return XY_FAST_COLOR_BLT_LEN_DW;
> > +	else
> > +		return 11;
> > +}
> > +
> >  static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
> >  				 u64 src_ofs, u32 size, u32 pitch, bool is_vram)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  	u32 *cs = bb->cs + bb->len;
> > -	u32 len = XY_FAST_COLOR_BLT_DW;
> > +	u32 len = blt_fast_color_cmd_len(xe);
> >  
> > -	if (GRAPHICS_VERx100(xe) < 1250)
> > -		len = 11;
> >  
> >  	*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
> >  		(len - 2);
> > @@ -1466,10 +1472,12 @@ static bool has_service_copy_support(struct xe_gt *gt)
> >  
> >  static u32 emit_clear_cmd_len(struct xe_gt *gt)
> >  {
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +
> >  	if (has_service_copy_support(gt))
> >  		return PVC_MEM_SET_CMD_LEN_DW;
> >  	else
> > -		return XY_FAST_COLOR_BLT_DW;
> > +		return blt_fast_color_cmd_len(xe);
> >  }
> >  
> >  static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
