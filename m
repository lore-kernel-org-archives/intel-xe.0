Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426EAEEC2AA
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 22:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02BB10E324;
	Mon, 23 Feb 2026 22:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IKS5WDhS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A31710E45E
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 22:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771887071; x=1803423071;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a9I0P/6Jb4Hn9YyXguYa4OvRqgD2aXj7XpDKdxbHmWo=;
 b=IKS5WDhSq6gQdir+COXCQ1GZJ+AkZJS+ja6Z1MOs6Fi8SEpp9vxPnwtm
 Do698GajYBtTWSKvxQizBYlLhnH+U6G2D4W0ts6DT0nB353RZ2zEa9eRl
 bpsgC537MDDFeyoe2tPTxPf7+b0iE9/S+LlDP2WukpuBHgLS+WULcqQfs
 zoKwdi4heiDNQArlliimUleXcVkM0IM3GiphULg0Y56tR0NjUMwPj20mK
 6Z4DxkONAoLIMpDxHmHDbZwgtdDJnFuco841y1KdCpA9o7iEvpowfVWW0
 Fnjgfz6wcilvd+YwTEsghnvAlKtp2acqmfuI5Zhjh4qpwSvX+uKZpdS89 A==;
X-CSE-ConnectionGUID: UsYhE7GASOGgrHsXqaWUTg==
X-CSE-MsgGUID: x6yeLTd3SimfbCkRhb9N0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72869575"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72869575"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:51:11 -0800
X-CSE-ConnectionGUID: ZVjZ4YN9RVeF1PQf3Zxtjw==
X-CSE-MsgGUID: qx+Za26fRlmAMbmS7VwCHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214087460"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:51:11 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:51:10 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 14:51:10 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:51:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5TsV/LCLOMWPLO3zlusm+ZcPlac/t7ZAQ81THRqP71Jn9RaWliC1Ebt8VIeHVElC1q0aRmuu03xIOWIA7LkQhrid+x55FhGq58ZP/hfMz1ak07WsCmoCstukkNAj8KojOx+y2QwBJVMWuJ4m9Ovc5H3y49+yodwPnh89lOz5lg7zmSZjQGG8DLr/6JhnNZ/XL21zebwUNUV/HKJ0Gv9CUU9JMgBGy783VgDRIeT6foi0XviiT12u8Oh31GcBAQesL7Zpd6mU+axT5jJ0IVr8+C2fYnp2kK1u2qaxGjaStbll9Z6EahPCjipuF1rU1MO7Uywa9Ghi8/Cq+vnv9PHWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jpc0zPHVzkSGCisjW2je7Q2u70gDgTWDIok6sD3RVlw=;
 b=xdJd3pUgZilALrPlPxog1wgQgwUoHeGLUOWspyLToAekqJxtZDXJIfq7cI0SIZynVryjRuEjldoENXT2+Q8I7IPAfLxsRVh0X36C0dLyJ43H4YkLpaKV9JLRUxQWaMYfbZXLqiGNJ+s1v43MGzv0zg6m+2/gCA35JPwu+FxGTntER589gYwucAppij4niMfg7lbeDxR20kI1os0Gxr3h3dmCG/glHx07RQcovYjkeh3Sw/OLJ0SPEiNKT+DFW1MBk0H1a0YcOBylUcTdoY5u4lHr8SfyFcSDRR1k5fJVHkqHmgWlY31eqFOMa8jXIEjho1xVj+WjI9G43bcbTaLQhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8431.namprd11.prod.outlook.com (2603:10b6:930:c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:51:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 22:51:07 +0000
Date: Mon, 23 Feb 2026 14:51:05 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Move page reclaim done_handler to own func
Message-ID: <aZzZ2fqgUEi2wUUj@lstrano-desk.jf.intel.com>
References: <20260129082756.1096935-3-brian3.nguyen@intel.com>
 <20260129082756.1096935-4-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260129082756.1096935-4-brian3.nguyen@intel.com>
X-ClientProxiedBy: MW4PR04CA0360.namprd04.prod.outlook.com
 (2603:10b6:303:8a::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ab0b79-33a6-4a52-18d2-08de732e0803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fi2FowOOTfsjY5MZ2Gd2gs2IN2B91RgNHepGsoH8u0hYSJoXhaLtjZvhwxhX?=
 =?us-ascii?Q?uawAjBFO7FwBWRebWKLi/CmJc3EjNvxrPx8yC+q/WI/WWhU6MSRKwtTP2H9l?=
 =?us-ascii?Q?nSyTZzeXo5AhXcBv+M5WBkKvpsgyK7zC/j78tfPUB4Hq1LdkGBxPvyocxXzA?=
 =?us-ascii?Q?CCHLhzjEbhaKyXle7mQRt6InNUjY/lBkc1Id3YAjgamm7MptlG+Iih2mqEjo?=
 =?us-ascii?Q?5QTKfmUERi1ydVBaN6eP/SHKxa/pZas04MVVrzn/xObIoSFS14i+cLMaBhlG?=
 =?us-ascii?Q?pD05ZsW9ufH6CTKluv25f4zuP/LV8rV3dGjdB0o3jnuzbTKbIYL5V8hCMCnw?=
 =?us-ascii?Q?NQlY9L0WR8tD13FVXp7/wup9H3piQY3DlaJTGU6AcRz6nVPmCMKWKlCqtTHi?=
 =?us-ascii?Q?Vv1wDGCrpOcBod9EEyOmQruixWusgAVDK2YZgBXZBTvT3PsxFzd7Cv1vBcv0?=
 =?us-ascii?Q?eQmmK1CsFCZCv9UR4CErIooo6IVpzU0D/lJi24V76UsZZbEpS5ngl8SBOICv?=
 =?us-ascii?Q?dAWpNL1SSSwfwwyjFhkr/ADpLjzYAkjQpG0r8MDs7bta5w2LWKZ74GD22CNV?=
 =?us-ascii?Q?24URJ8QWYNmyieYS83U0nUTSfgoTuWT3wiydJLyG7NDr1dpGa/zP3VVLcIuB?=
 =?us-ascii?Q?vRsFGVzHZlXbcRJ5DeH+4x/biHV/W8b7b112trz+RxCLxMOUmoGMXoDQH312?=
 =?us-ascii?Q?0lcD8ZlBcVMwX3osnJ7hvfohUO+Ny5UrjXrq6c1gQ7L5/KVafPMpu7bk54zJ?=
 =?us-ascii?Q?/JTGwC2Ul1D1Tz0YTpQX2QmS3LlEiFLcsgcaomD0626gmBwJw/Auuw5bpyQV?=
 =?us-ascii?Q?3dI69HHylQXG4V9nLn9VGexle5u26IQ7tjzf284aYH7JdvheBRLZC4LEhlCT?=
 =?us-ascii?Q?Rvgwgii/YSxFKgzg5EZ9yuz9OP0ORDQ9l8fwbEmT5A2KfUET6mGCI9CVNdOy?=
 =?us-ascii?Q?ETQ+D3LBlr+rFQSik3lzsy+WdhUuOI8zT9IMoH/IIljcE/wGT3uzQw0NWhHN?=
 =?us-ascii?Q?dG20lryIO2Oa1HLJtPgqwZplWocdzUTYlXfWQrUn956EJ0x2J2bF1WkPUi9A?=
 =?us-ascii?Q?6u7BiLzxt5pRjaJr/3C4j6e2+CqcslqEBgsSbqcpyPw+9lsqUBpxLH8FoLhr?=
 =?us-ascii?Q?0xYfKjhLkFCheh8hM/4+rVjqTEH+rD4srqioKTXofFBsOybG8BGX04cQzHUc?=
 =?us-ascii?Q?gXOjXJbcaUTfHRL9+kKpTs3p4KRp2rKSHiaJFkXNOA4y/FJvooQaCmCu0Di4?=
 =?us-ascii?Q?T/k1SorDb1KwodenPvgerGvR6wCu7EghrF0iheLiSnNu5sk2sStZ5yTvh07/?=
 =?us-ascii?Q?Px4PA5+HAcA2wv4dwslQame/RL0kO1WuMMXeFB7GGjGCMwEMPGxfjmjoyIDF?=
 =?us-ascii?Q?rznT7hdZ0Jkp5vGFRGdDwOsmau6YgStHPL0UpUwfiuvlJiv4tXFuK0Xyep97?=
 =?us-ascii?Q?8CAa7A4mQ/jPgWKPXQHFw81IyuunAK7vyBMaEAbfuu5AvytIS8uQ4P4gTws+?=
 =?us-ascii?Q?ABd80Ygr9RKvAosIM36yyisf+FIGBmOAmcH14gDq4OI0jE73YGskol3pYVdq?=
 =?us-ascii?Q?BbZO3cYN3QHteglILuI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AQ5F3zydFNpYrixxw1PJ+XrG1uU5jShiWF6/hQmTEvXIUyKakQy3FiKb77g4?=
 =?us-ascii?Q?ZNc+iBWd39rUXUCmWyfjQjHAuj6xoTXzYidh0h36SeZsy3CvvPdyUKWZbafV?=
 =?us-ascii?Q?MduBEyVrQwkan0otQUBQF4S4PJuodY4O6Y6U0o3uhg8qa6daUTYRjMFprK8q?=
 =?us-ascii?Q?H4sC5F9Mh651tYw4NZJtm2pSjinJsQRJjgNd3egFXPFW6uYcIp6s7n9znbTh?=
 =?us-ascii?Q?OH3yzGy0Fg4vfxe93PyVasWLWB29ZtGON8gsE8p5ja/i+nflJ/v8l7ytHeer?=
 =?us-ascii?Q?puhq/xq/XajJc+nDqUsgNRAdu41gzX8deF0QCYrKFKNXp5dpg5QE6ZePwOhS?=
 =?us-ascii?Q?qYYujKyAarlNBN8Etm3LoMjAOo+d5uGprftceI3LIt++EDct+mbbVgiXvJoD?=
 =?us-ascii?Q?Xulllg02eQKGjvkVHh15oCa87GP7g/f2xR5aCJSF58CHfk92B5kQy+89/zx6?=
 =?us-ascii?Q?wckCc3x9Cpd829RQ9eigIJKVcOGhdLrgsHviDFScVNUnnjOz4acXOWx9FF0F?=
 =?us-ascii?Q?FrK1hQtRripP9mvzEqakzyOZCKhFqeas1v239lfVFIPPxaksCOuMBxRHB7j2?=
 =?us-ascii?Q?TgMCj0zcnlzfIWNls5ApgGjV0aViWv7gb4EMtwNRDViDEhtDY4H1DBUkAZvL?=
 =?us-ascii?Q?RymF8MQztx8AftlDv5sohhYaXUS9h7/SA6rteWF7oS9jjDFGBkgAW3zPOKRI?=
 =?us-ascii?Q?ctT0MUTLcdgta4X5iAs7M6yw+psH6hr9v2+aWVNFL6kdlyElsHXJt/aBrhaL?=
 =?us-ascii?Q?jszOJNsBc9AkV6WyM9UP0hLB5OOeSrqpA030lMJ239k9KfkviQZzL3vRaqHa?=
 =?us-ascii?Q?2ms4L+oWmSO8QPZPlFvYt3XQvYhWuDegvT00txVSCpktwfi6iZdCAoZmU9jf?=
 =?us-ascii?Q?JejhgwodN1EZB1KWWf39K96X5nOR3WmJ1tRNzwVAwB1kjoovHoimD7f9556Y?=
 =?us-ascii?Q?eN5PAzDeElAuDSn/PUowSB3fNLZhTaExf9d7gFeqOGB8ZVZOejxg287ZGi0M?=
 =?us-ascii?Q?zl+dH5l7upEVeWHxFWUN70/tA5wwhAhFgVWReH0LUvaxLDy9YKaFepHsB1ZF?=
 =?us-ascii?Q?YrX9OJLehtu3EcNKr23VOMQthpzOlDUFjR+NA/2HA/rhxhjepWaxkxRXb5sK?=
 =?us-ascii?Q?4p6B4iy83FamUMJzHdbN4vM+ujZh223keDZQeoo7iUIB9HKwp1r55W/sSLIZ?=
 =?us-ascii?Q?QbloUoBtLtMEhF+sOCWURueNZqM653kzlZSAR6mHaRWIIWoIeHHVIZhTHk/p?=
 =?us-ascii?Q?Q2f23vrwIRzUYVzynN/nUpLGERR3H/ujCnE3/G5+YsqEOzqNarsRJyhwOQ5W?=
 =?us-ascii?Q?5ObwdUmb0u5w9f7SHUkOmq4ThfE8jScu6mbY4fuFWMMd88nJ2O6P0Pk/XdR8?=
 =?us-ascii?Q?KBQictnn1fYqa0p3P0yLVxFZV7xlSIOSpB+7hewPRrmMjYd3GSl9gptsMtlA?=
 =?us-ascii?Q?5Vi0VTKhptT0ij0y6LskICECInBu5cfJXCcVxEUFTxfeLWgNjhwQzFYVsuBH?=
 =?us-ascii?Q?hw7/tEs+BtS30Y99zlPy3+N8QcdjVxM3dSAnTBcM7fFA/b18PAUHyg5euJ/V?=
 =?us-ascii?Q?HG4dJi0rmlvEO/dCgShfc9cs9dZZ5vwj8/DfPEXH1E4zur4gczFKe16kQYZ2?=
 =?us-ascii?Q?+8kUAlOrzgzeSUc3dVZtfORa2Qy7NrVPog9wXD20KAB5lp813AykDrfWqodU?=
 =?us-ascii?Q?IcQhPW6VH1iBCtiSbNi8X2xIAekmzBSJNl7Hb0YA3Ud94e7uw7txFSyKS0LR?=
 =?us-ascii?Q?6/GPHh6i33sczcOvBJxfBFwP9LNRU1c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ab0b79-33a6-4a52-18d2-08de732e0803
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:51:07.4714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82bg19lzpBg8XM4PrjqcAIPfwzfKemF8MeeCVDcWX5owCs95PBdKGR/SuRU8QWEKIwwTdRDRR866n7RMGxrueQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8431
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

On Thu, Jan 29, 2026 at 08:27:58AM +0000, Brian Nguyen wrote:
> Originally, page reclamation is handled by the same fence as tlb
> invalidation and uses its seqno, so there was no reason to separate out
> the handlers. However in hindsight, for readability, and possible
> future changes, it seems more beneficial to move this all out to its own
> function.
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c       | 23 ++++++++---------------
>  drivers/gpu/drm/xe/xe_page_reclaim.c | 20 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_page_reclaim.h |  3 +++
>  3 files changed, 31 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index dfbf76037b04..3d69314170f8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -31,6 +31,7 @@
>  #include "xe_guc_submit.h"
>  #include "xe_guc_tlb_inval.h"
>  #include "xe_map.h"
> +#include "xe_page_reclaim.h"
>  #include "xe_pm.h"
>  #include "xe_sriov_vf.h"
>  #include "xe_trace_guc.h"
> @@ -1604,17 +1605,11 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
>  		break;
>  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> -	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> -		/*
> -		 * Page reclamation is an extension of TLB invalidation. Both
> -		 * operations share the same seqno and fence. When either
> -		 * action completes, we need to signal the corresponding
> -		 * fence. Since the handling logic (lookup fence by seqno,
> -		 * fence signalling) is identical, we use the same handler
> -		 * for both G2H events.
> -		 */
>  		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
>  		break;
> +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> +		ret = xe_guc_page_reclaim_done_handler(guc, payload, adj_len);
> +		break;
>  	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
>  		ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg, hxg_len);
>  		break;
> @@ -1822,15 +1817,13 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
>  		break;
>  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> -	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> -		/*
> -		 * Seqno and fence handling of page reclamation and TLB
> -		 * invalidation is identical, so we can use the same handler
> -		 * for both actions.
> -		 */
>  		__g2h_release_space(ct, len);
>  		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
>  		break;
> +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> +		__g2h_release_space(ct, len);
> +		ret = xe_guc_page_reclaim_done_handler(guc, payload, adj_len);
> +		break;
>  	default:
>  		xe_gt_warn(gt, "NOT_POSSIBLE");
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
> index e13c71a89da2..60b0fda59ce3 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.c
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> @@ -11,6 +11,7 @@
>  #include "xe_page_reclaim.h"
>  
>  #include "xe_gt_stats.h"
> +#include "xe_guc_tlb_inval.h"
>  #include "xe_macros.h"
>  #include "xe_pat.h"
>  #include "xe_sa.h"
> @@ -130,3 +131,22 @@ int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list *prl)
>  
>  	return page ? 0 : -ENOMEM;
>  }
> +
> +/**
> + * xe_guc_page_reclaim_done_handler() - Page reclaim done handler
> + * @guc: guc
> + * @msg: message indicating page reclamation done
> + * @len: length of message
> + *
> + * Page reclamation is an extension of TLB invalidation. Both
> + * operations share the same seqno and fence. When either
> + * action completes, we need to signal the corresponding
> + * fence. Since the handling logic is currently identical, this
> + * function delegates to the TLB invalidation handler.
> + *
> + * Return: 0 on success, -EPROTO for malformed messages.
> + */
> +int xe_guc_page_reclaim_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> +{
> +	return xe_guc_tlb_inval_done_handler(guc, msg, len);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
> index 3dd103e37beb..0412611f3af7 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.h
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> @@ -20,6 +20,7 @@ struct xe_tlb_inval;
>  struct xe_tlb_inval_fence;
>  struct xe_tile;
>  struct xe_gt;
> +struct xe_guc;
>  struct xe_vma;
>  
>  struct xe_guc_page_reclaim_entry {
> @@ -122,4 +123,6 @@ static inline void xe_page_reclaim_entries_put(struct xe_guc_page_reclaim_entry
>  		put_page(virt_to_page(entries));
>  }
>  
> +int xe_guc_page_reclaim_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
> +
>  #endif	/* _XE_PAGE_RECLAIM_H_ */
> -- 
> 2.43.0
> 
