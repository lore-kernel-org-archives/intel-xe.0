Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AA7E6FE2B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 15:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66B610EAA1;
	Fri,  6 Sep 2024 15:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CoNFWscw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAB110EAA1
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 15:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725636800; x=1757172800;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9nwNdUpbzARiPd1KHehZPnisU4tPeew6OS7GPHjwhq0=;
 b=CoNFWscwP2NNf8U58ksOf9i5ZZgOElOlH9b+AnuWixqLFDeUocTXpn+4
 xpyhhraONYAQT9pEGwWQP+BRcAD+ZxQ86Bw9z+CMP/tKlBzM/dhf8OirD
 CTAKkhTBSRlsgMLJmK0nuow+fOByT3ChE+nBoJFhoQBxUfGjYoOvM1Wx9
 YXFhjB2PPDPEjuBBk57Tv5knC4Z2cXGVhsgpZ/+V3/4iWMDvei7wvw3nS
 hlSLqZN9kHkRFyPcbr6UqLr3QrPNHZH3JeVpeo4bYpALCwwdhhkJMGGfa
 16SzUihnBKGJ0CMTZCZegbBMOGrtA+QI/xUsVhaCq7VPF2jBxnNQDmwxr A==;
X-CSE-ConnectionGUID: xKs5JGiOTjSocx+CkW2/zQ==
X-CSE-MsgGUID: 1bwNlzF+SI+xl9jE8SQk/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="23959057"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="23959057"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 08:33:20 -0700
X-CSE-ConnectionGUID: f+RAZveMSTuGW1JZ8c7EWw==
X-CSE-MsgGUID: z41IOYCtQtWgrtyd0a7KhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="65674025"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 08:33:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 08:33:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 08:33:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 08:33:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 08:33:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHwkTU1TtFGUWvzGcj/Gqog/yuMYSbB0Q6t7Z6l9zy7FxpcYqzNB4tkft8t/vfZ0jp50kXea9XBMadIJEDkbWgSY1K4EAYoCITVXR5DNboz0sdjy3TdU6Ha5IUj9vpM8/IztVISgVRb8kRAVI9ylJpWpQNMPiPpo6WmvhKI80Gt6MM5vp0NSbE+p2D05iQJA+mYG5Wdu/EVACzn4SOfPUCbY3tzCNge8zexdimlj2AzE+quOxb+ytsNf2plFEL1HAdaAMoXd6LOewJBE34Zfv+4hmDNO+MlteOrpPfdr11oju4iCVi6015KoChwmEcO7brtzX9sAH9f/i32gSbLOgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKKDcqycjYfB2v4BitG0LGMEa1R4V4+EFAzsHtbELMA=;
 b=r7D8EY8czTdQ/v5tQZ2zs/WmXWGdft+BqT5Pp6nFQJ3/Tj9DZYXFm3axuUBX5LIXTw9EW2QI6HnexL4DwbWVgmrCNhplXNlDAZnrv9A6kKOjKttwiLDS1aOLxLxNdBVGb3huMabTjn/E+c9Q7JtZzDaIwvEqDL+AVaNWDS6woRc1sMxRF4ul63GcTGcLnuP+6TpkUNl1/d7pnAagN0WpMz+oS6YbMwBYT4y8C4aeDizmUU3MEOcVZX0IYnMkMGRGFvdfQkOYUwnuy2z7oXRPkyl8t32GyCGxg2xUyZ3gUcca2hYTzlcVQ2YzsmaJ//vQ915bl2iGi/zTQHpI46RR8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA1PR11MB7110.namprd11.prod.outlook.com (2603:10b6:806:2b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 15:33:16 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 15:33:16 +0000
Date: Fri, 6 Sep 2024 11:33:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Nemesa Garg
 <nemesa.garg@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
Message-ID: <ZtsgupqnywP0icEk@intel.com>
References: <20240906070133.3843174-1-nemesa.garg@intel.com>
 <87frqdnp09.fsf@intel.com>
 <ybknt6v4oc6fyn35kvgpb6rtr7tamw5jn6gae5oxluo63x7rfw@und53xxy5n4y>
 <87plpgn9vy.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87plpgn9vy.fsf@intel.com>
X-ClientProxiedBy: MW3PR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:303:2a::19) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA1PR11MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: df58a933-646a-4c87-9f64-08dcce893a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mkPJOLkjaxPzk4ch2b1Ki9E43tCA+3wPMyNOT1yX2LlCqYSeCLIo8QEGKpZ9?=
 =?us-ascii?Q?jQlatABE7nRIlhLhiJpQIUmLxVvDyZxa+1kw5tXuDeVczsrVrOnPkqCyzEzV?=
 =?us-ascii?Q?jIkBfrjDO42rbPtdTcmuDx5N4J+8wXgG6T3cGcf6IFwfSw3jQC1xncakc6b4?=
 =?us-ascii?Q?OeQ8Y9PfMMYLv9GsSBTe9nqlqkyW87AHuhQSZP9Rl7qxPco0RhXncdmQq3kF?=
 =?us-ascii?Q?qcGlEs4x2ixX9f8DIlR5cAH5vlhydGRezbpbbAICPtQjpYBx0XOq8W3WgmvI?=
 =?us-ascii?Q?VzKq6fEl5hbMwoncNnlz4dSFZrdx1jwsVyAeeNY/sVhdQuHtg92DQl+JpaGw?=
 =?us-ascii?Q?plTdBrbm4198VbdjKze7iujmCXDGRy2bLFRpN/o525YQ8RxPa89aAuWkPsu4?=
 =?us-ascii?Q?H+yEqCyw32hl62OI1dNncPJK4Qc3OmNHdU05uw33+QXpksiHLly7lZ6Kp4Yi?=
 =?us-ascii?Q?FXbal7rnicL2jxECgK27dC2aa8RIaMQ3RfBe+PNluv/1MGOuOccHxsMko6gz?=
 =?us-ascii?Q?/NcN3NNFBKxez7dxmAG/uuVit53w/Vh6/+FleF5bgPGiOd7ANTcTb0NgxN1o?=
 =?us-ascii?Q?sL9dnZQuCdIpFaRBe2IQM3+RiL9jf7PtqZew7V3bN7ZJz1B1E7ug5g1oe2R6?=
 =?us-ascii?Q?yKFAv4WLkezQ1/sZPc9Ol5/C/bJKmdrI4ZTH44G8bwuudLwWrjdcpIfQ1fkM?=
 =?us-ascii?Q?OxAAxRlcRf4Q4mbsw+Q+GO3h6NF+Z+0r4OT6fYQorglBrXm+3Pa4hwIBeXn7?=
 =?us-ascii?Q?LxUplcGhHRoRflF2pp8FGcjmD1lGbtAVA6QX10ssJDa+tO5utsm5p1R6P9dx?=
 =?us-ascii?Q?rM4a5AYUF54QHd+J1museb5Gt6Ip/qtpkhAe0wPKE3XNvKRD6Ism5+XuJgr2?=
 =?us-ascii?Q?m36Z7T8T7P2NBPRUuScdiZ304m3Rv6sc6+eFDV2tZdBIWbov3wK/iFqSxRgt?=
 =?us-ascii?Q?qgu++8YKWKN4fqCYgMSF/ZOjsIfsg4CkWoqWblkI8gV0DJS15q9CzJmYtoyc?=
 =?us-ascii?Q?wt7lnnlitlT3nBKzahp4gmRMOGCVjKevsI9gcS1kbzyy2y3Cy0g9i7iheC60?=
 =?us-ascii?Q?HDgd/TPmfEbQS0WobiqxjAP2aG6EHvvyRNTTOhYs7YSQQwNg3dKqhCVGzaso?=
 =?us-ascii?Q?fEqiLmVjilkFMwGB/tOsjKGlqfmZaW/Td/D28lkMTYQhgiVcLNK95aTQMia/?=
 =?us-ascii?Q?/UrosDSLU0L3AkjrrG9hoRRkF59GNCrWS6bmSgbfXay9lMUXqmzGGiSq+fpO?=
 =?us-ascii?Q?8xFF9aX1vz08hikzVOVjJ3L60FVx7duT3DYhKiFowcNa1f5MxMTffwY1kOqQ?=
 =?us-ascii?Q?Fuq59iYpOaaTl7W7HkNzCawWi6rKFFhf3lv9/hj2Sp+o8A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BprIllJule7CMW7hEiS+5gXSk2h9JpMKeeJMeJYyKGQyVtIvuckLfGjR0XJd?=
 =?us-ascii?Q?iDWb5ojwcHKofw6MSbdyJr0jU5vMqWzHyo5k4F6RluofSEiwmUX8VlqeU3SK?=
 =?us-ascii?Q?Y6pqqUv2BWUKdeRotXU61xqOE6PefV8rB2LduwRftDv5Qk55zv/d8Ws+yAdy?=
 =?us-ascii?Q?TKwiPT1kiXuJWjg5zxgiX80aod2zJQQ3PUnzbOHLwWifmZWDPZFnzebZWOmm?=
 =?us-ascii?Q?QnE6A+istb9k2JHGlJ1YoHUy4KDVFoNE13VgEkVbjxjTc7oyXtTWLrFfiu8e?=
 =?us-ascii?Q?hC+7feVeDDjWFQlidYeBqFr/KoOSRf+HM5VscIFEFRV0Z937AHS9FDw2lrEz?=
 =?us-ascii?Q?NWEoXFot2fGyZ2BdB5G4usXmmEC51qusMvPK4n+aaR+XoTffuOkJ5GHr+G0t?=
 =?us-ascii?Q?AawNDOztBrphtyYJQATdvlCShMlwK2WxJWefMqwO3reygZEyvtQsnSKHgdXv?=
 =?us-ascii?Q?MNhhcI55ENe+YS0L9gbiqpBLPDdC4qQ8xHcGY+LHvtnPm91I5NMaLRsswwq7?=
 =?us-ascii?Q?M42+pHDGV/dAyKna8SYZM/5FMKnQGqKoW6sHabaZxIZuq/rAYEkvR1DdI0bJ?=
 =?us-ascii?Q?pYwgv3jpYM9bTCVn0ewr3BHMTvmtU/YZGbBgMdkTQ2vtYgfLNnRGqlxQg0/o?=
 =?us-ascii?Q?6g2jQVnO3GL/FHqtw43VEEgJECWFmwHw4dk5lDIX95IkLc6hXAZcEfEDl6h9?=
 =?us-ascii?Q?8a/p9fqB0+KGj6laK8/PVEntiN19L9zT9tYwBGn4gAFscbD/4AhLJXyQwEBu?=
 =?us-ascii?Q?Z+Stw5GZZaI95dreVcpiGZczKaovP1cYqUhG6zHIpjwgimAYeoBRVSdxQZyn?=
 =?us-ascii?Q?kt7hCfMt7x6PUEadEGPT0HDlNEnPnbuRhlC83maBJXn9SbscAr3pom9E/p34?=
 =?us-ascii?Q?j20ErVDpvvIVnhZQvI70gE+3Yz9MN5GKFjjdttEI2y+aakoqZb+ODlxUfM1x?=
 =?us-ascii?Q?3b6zrwT4oaIVmeTKR4KihT7IeSSknEN5OqmQQAHAqv3f3gahJtOdx2lz59vD?=
 =?us-ascii?Q?cOG0ni6KlFYCQHgj+8Hfmeo/k5FckU8S2kaO2Cm4wzagrzY3uXY/E+vTYdRM?=
 =?us-ascii?Q?NU8PWXmomhP4YqyqAPkDIHqz1nOfrXhGNpiktgByYZIidXHvBlKnpXDscERe?=
 =?us-ascii?Q?0TeGxqfL/H7QjCxmKkodwLMS9lgqlpAai5HPW0n00YMBX5asbFkl0rMZ1stn?=
 =?us-ascii?Q?BO5vngXuPgdUpBLUtyEIW+dRrXIkUPI7OA+BvDusGquArWCIOeUfrU3nLy6P?=
 =?us-ascii?Q?4oSza3L6PZU8O6DGlc93gJUGjwa1/61z0gL8MeXVq8KMCDKCTBbFDbzfrwoE?=
 =?us-ascii?Q?QlPcp3tYatCuEPGRlTfIn0/t+T5a5MVvDiglP6LZT2ZfmzC0iCxIqhugl2K+?=
 =?us-ascii?Q?ZaV/HDEdsGlu85Ah0NHUXtx+xq5D82DjPo5UEEwaTGfLaApQc164xjxcCdnt?=
 =?us-ascii?Q?snc4JBKwO6mACX+DNiC72/RDoH1p09h9zm+2/vyNN/TY+oOQEPGfiWCeGQpo?=
 =?us-ascii?Q?A2d3eW3NdF+15ZZQW2DfVrAVMiSMkOOO/ohXQCEIZuLnKenMhGvBs2Mq3zKl?=
 =?us-ascii?Q?hdWO+QG2XCttNmtFIcRVkzw3yF7y8vtyOmvDA6EeZdy7eH7mL64EJTkl52oe?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df58a933-646a-4c87-9f64-08dcce893a6d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:33:16.7860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzQAYfa8v9tXafeBrBQnEm1tzk7JaFse9wHyWtTuFWvaNus4E6Vk5SA90VvDgkjwtIEeeWASY/ck+COimfN/yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7110
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

On Fri, Sep 06, 2024 at 05:18:25PM +0300, Jani Nikula wrote:
> On Fri, 06 Sep 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > On Fri, Sep 06, 2024 at 11:51:50AM GMT, Jani Nikula wrote:
> >>
> >>Cc: Rodrigo and Lucas, note for you at the end.
> >>
> >>On Fri, 06 Sep 2024, Nemesa Garg <nemesa.garg@intel.com> wrote:
> >>> Disable the support for odd x pan for NV12 format as underrun
> >>> issue is seen.
> >>>
> >>> WA: 16024459452
> >>>
> >>> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> >>> ---
> >>>  .../gpu/drm/i915/display/intel_atomic_plane.c    | 16 ++++++++++++++--
> >>>  drivers/gpu/drm/i915/display/intel_display_wa.h  |  2 ++
> >>>  drivers/gpu/drm/xe/display/xe_display_wa.c       |  5 +++++
> >>>  3 files changed, 21 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> >>> index e979786aa5cf..9b17321f3477 100644
> >>> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> >>> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> >>> @@ -47,11 +47,13 @@
> >>>  #include "intel_display_rps.h"
> >>>  #include "intel_display_trace.h"
> >>>  #include "intel_display_types.h"
> >>> +#include "intel_display_wa.h"
> >>>  #include "intel_fb.h"
> >>>  #include "intel_fb_pin.h"
> >>>  #include "skl_scaler.h"
> >>>  #include "skl_watermark.h"
> >>>
> >>> +
> >>
> >>Superfluous newline.
> >>
> >>>  static void intel_plane_state_reset(struct intel_plane_state *plane_state,
> >>>  				    struct intel_plane *plane)
> >>>  {
> >>> @@ -1029,8 +1031,18 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
> >>>  		 * This allows NV12 and P0xx formats to have odd size and/or odd
> >>>  		 * source coordinates on DISPLAY_VER(i915) >= 20
> >>>  		 */
> >>> -		hsub = 1;
> >>> -		vsub = 1;
> >>> +
> >>> +		/*
> >>> +		 * Wa_16023981245 for display version 20.
> >>> +		 * Do not support odd x-panning for NV12.
> >>> +		 */
> >>> +		if (intel_display_needs_wa_16023981245(i915) &&
> >>> +		    fb->format->format == DRM_FORMAT_NV12) {
> >>> +			vsub = 1;
> >>> +		} else {
> >>> +			hsub = 1;
> >>> +			vsub = 1;
> >>> +		}
> >>
> >>Nitpick, the whole thing could be simplified to only touch hsub since
> >>the w/a is about x-panning and vsub is the same in both branches.
> >>
> >>>  	} else {
> >>>  		hsub = fb->format->hsub;
> >>>  		vsub = fb->format->vsub;
> >>> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
> >>> index be644ab6ae00..9be35a751503 100644
> >>> --- a/drivers/gpu/drm/i915/display/intel_display_wa.h
> >>> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
> >>> @@ -14,8 +14,10 @@ void intel_display_wa_apply(struct drm_i915_private *i915);
> >>>
> >>>  #ifdef I915
> >>>  static inline bool intel_display_needs_wa_16023588340(struct drm_i915_private *i915) { return false; }
> >>> +static inline bool intel_display_needs_wa_16023981245(struct drm_i915_private *i915) { return false; }
> >>>  #else
> >>>  bool intel_display_needs_wa_16023588340(struct drm_i915_private *i915);
> >>> +bool intel_display_needs_wa_16023981245(struct drm_i915_private *i915);
> >>>  #endif
> >>>
> >>>  #endif
> >>> diff --git a/drivers/gpu/drm/xe/display/xe_display_wa.c b/drivers/gpu/drm/xe/display/xe_display_wa.c
> >>> index 68e3d1959ad6..fde4e09589a3 100644
> >>> --- a/drivers/gpu/drm/xe/display/xe_display_wa.c
> >>> +++ b/drivers/gpu/drm/xe/display/xe_display_wa.c
> >>> @@ -14,3 +14,8 @@ bool intel_display_needs_wa_16023588340(struct drm_i915_private *i915)
> >>>  {
> >>>  	return XE_WA(xe_root_mmio_gt(i915), 16023588340);
> >>>  }
> >>> +
> >>> +bool intel_display_needs_wa_16023981245(struct drm_i915_private *i915)
> >>> +{
> >>> +	return XE_WA(xe_root_mmio_gt(i915), 22019338487_display);
> >>
> >>16023981245 vs 22019338487 and not explained in the commit message?!?
> >>
> >>Rodrigo, Lucas, I think we're going to need to handle display
> >>workarounds separately in i915 display. I'm fine with merging this now,
> >>it's not a big deal, but this interface is not future compatible.
> >>
> >>The first step could be simply converting these two to the old style
> >>workarounds in i915 display, i.e. just checking for display version or
> >>platform directly, and later adding wa infrastructure similar to what xe
> >>has, but for display only.
> >
> > Do you expect any WA like this to be enabled for both xe and i915? There
> > are no platform with i915 and display_ver == 20.  I think for past
> > platforms, just following the display version and platform check is fine.
> > For newer ones, where there's only support in xe, we use the xe way.
> 
> Consider having an independent intel-display.ko that caters for display
> IP support, regardless of whether it's being used by i915 or xe.
> 
> >From that perspective, any interfaces like this become increasingly
> weird. Display code should depend on its own platform, display version
> and stepping identification, also for workarounds.
> 
> The xe_wa_oob.rules file doesn't have a single display version or
> stepping check. There's a single display w/a that looks at
> PLATFORM(LUNARLAKE). And that's all it can do. Nowadays xe core doesn't
> have the information on display version or stepping. It has no business
> looking at the guts of struct intel_display to figure it out.

Yeap, I agree with Jani here. Regardless of which platform is calling the
display side, intel_display should be in full control of its IP block
including the W/As.

Perhaps we could add a display wa infra similar to this nice xe one
there as well.

> 
> BR,
> Jani.
> 
> 
> >
> > Lucas De Marchi
> >
> >>
> >>BR,
> >>Jani.
> >>
> >>
> >>
> >>> +}
> >>
> >>
> >>
> >>
> >>
> >>-- 
> >>Jani Nikula, Intel
> 
> -- 
> Jani Nikula, Intel
