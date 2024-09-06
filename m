Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BD4E6FE4B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 23:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B456810E944;
	Fri,  6 Sep 2024 23:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FyfVy+1E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD5B10E944
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 23:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725664630; x=1757200630;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eLkIdX/ByLh5deNxZjAfqz+9CqYrGq+XCoAsV6A5iCk=;
 b=FyfVy+1EFJrjqh1+8S4BXn+nd2o0DS0/lhETbhuhtAVpxOgvDVZrzWN+
 1xWlGLOKQFqa9Rm4Cb8HKRxHurUT8do5D0RAHS8qV0QXYlAfnaKQhNo6o
 7GRJPpxAmBrj4+DD4lGD1AWSOfHeGLCbh/vYUjxFzWgMft/wirGKHddWu
 nJrtt2UqIe2hfz7jpGL38o6vvhblm32G6SIxgLAw4DScPNN3V8FiLbeZL
 lapaQXwurRfSVds8F3Juqw8U86AUxdp7UC+OPMWUaDYGbRLEU1tzfSBht
 2Ud0FVc2loFKc0nhnWgNnN1HzaQxnrzI2zuhgHd4n/Zr2q9r7Rolg6u2H w==;
X-CSE-ConnectionGUID: d6leR+IkTJCsAnzcUdC6Cw==
X-CSE-MsgGUID: Eh1U88wcRGqnV0T60CSCaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28223408"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="28223408"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 16:17:10 -0700
X-CSE-ConnectionGUID: WtoGkXJpSXu0CNFgJjs2AA==
X-CSE-MsgGUID: 1HnuNICmRJm/drX6/iMJcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65885362"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 16:17:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 16:17:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 16:17:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 16:17:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJ6cN1HV4bf2oyK/6+6bn0ecR931f4z+X9AprjHzLXw0Sy3jEmsfJJqpWCE6eK6Id584Vn2tZ/tlnGu8l3v2CNEcya1phHdFdFOFY//IPOP5c/9ODLuAXfK22xCHYP5nAVnrgmI91QUdClcW0yLagvco2HWXsKdL0dYC/JIh4rmby0BEatK2LozcEGcZw/PQnQc7F3DN1DSNNb0y8NcLfesxm78JefIJpP9cdE3jZyuZYE7IDQBFKHB2J1gYoWgSWjRGrKlMGepZ50N82ByYSRqYXao9UQAWkhqZ+I51agMKKJRQ2dAPRtiUtR7AzXfjlqsxoADZFZVV86ACedtpRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GV+rGmQYsbtScfoTCyCYqc+X6ChFXuVBJAu67MNnGFc=;
 b=C8BMbnFt+ikMPFjN4DpZEsBdIfGjZZQZOOmexqAgevTv5jDtAEVnU0TxRWOiXsIWiggsHr0eeUmDyFg9cCyto6tju1XQtLOPBE4yeXLY9zFWkDW4+Gcwx5ufSTLAwjkbQlUw9TWV+5gf4Es3lycK2lCa64jPyhMkYSaRnclsNFiriKHxbV9LA9noVpGrmB6j9q2vL2gUgV+YU4h4jHkV+87OWSiqr7U1pGyS8FeSALRc4NXzWJ60h44irmFIIDlf+srBLrrLI/hN9A0Fr5yBtVqTgILK5v/reeK4KjFUrs8UiXjn75VUBguxkaBG9i9AzArvQJJUfCXINzg0MKu3eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7790.namprd11.prod.outlook.com (2603:10b6:208:403::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.18; Fri, 6 Sep
 2024 23:17:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 23:17:06 +0000
Date: Fri, 6 Sep 2024 16:17:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 14/43] drm/xe/compat-i915: Convert register access to use
 xe_mmio
Message-ID: <20240906231701.GK5091@mdroper-desk1.amr.corp.intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-59-matthew.d.roper@intel.com>
 <87cylhnoj2.fsf@intel.com>
 <glqsszabgf5tew74yruts5sb2z5kpps6pkzmbap3jn5ooufgma@7ursa2x7hriw>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <glqsszabgf5tew74yruts5sb2z5kpps6pkzmbap3jn5ooufgma@7ursa2x7hriw>
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: c84dff03-25c9-4fa1-6336-08dcceca05eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XiIewYQwuE0/DoaW6lubmkhTASXPpzgkRs/YxR5wyKAcyH5pNvinL9tPrvtu?=
 =?us-ascii?Q?CQvjOjUxZOCUv1bkmcpRAbE9LG3zaxeqs/Yn+Ersgy80AuxHivUv3jDauF7+?=
 =?us-ascii?Q?4YF40CiKnbY+2hIw7nZ03jnwe2KRwq5QYT+svewaolY9qlBzay3EAhH31Szd?=
 =?us-ascii?Q?44ATwtOK5N6g8mnLPQTNGADf6H7QZ/POxGONEQktvANKfnVntWFIn1vFnUXj?=
 =?us-ascii?Q?eZZUVSTlpBuvXahb8VdRccbZTH7taWdwWnqnp2djYJ2oqq3i8juN3xgBbnHh?=
 =?us-ascii?Q?7YE+fetnc3gcq4msz27sxcdFz5wxNtOqWkp7GGudFKQqW7lVA71x6yfU+u5M?=
 =?us-ascii?Q?5Y0PIrRFvhniPuuE6+amdrgl2wi2wetj4FEGLQ4EQb54AulI1FB3gcsnkjxZ?=
 =?us-ascii?Q?rL50AtGMRHUHj4uaHyrNq4dAMTPRHwILF/aKT4xXamkwqC9X5aYz52dz5TI0?=
 =?us-ascii?Q?SCMmxPE4a8D3AWPmoG26tTuvexu5m37eL+CT3pxJzim3S0giLBoqoo1maxya?=
 =?us-ascii?Q?puvtq5A/JRzILvKt3tg86L6OcocdIvS9A4DKdJNMIAi76T/FUJqHvThd+H03?=
 =?us-ascii?Q?jUduNQdGLq2+RSGjvroC5m+RE3NzCZQ34zpUDBpWdpAxx3dUdAvYrc5TOWHW?=
 =?us-ascii?Q?wDHjrPRApI17D1LwOv1Fh2Fy0NcyzJ5751DmTT33SJVBZ5mzC5rtfAnUnXAU?=
 =?us-ascii?Q?iBEuRC+qZZzGaNnvNmncTHsZcw68hkI2EtKkBlOdvD8VsqiQxxPeRtAAwCXT?=
 =?us-ascii?Q?znniaq7lZnyg7dBWIVad5y498BeceiSVhx2daZRMaAyZ9/prkVoxbnW25Ge7?=
 =?us-ascii?Q?wsOH18mtWnwZ0tuh2+4cQWTIio5PzGxF9rCcP1nyJFdn55LGTf7ZtR1FmKNq?=
 =?us-ascii?Q?q6RXOHZmc0UyAfg9UCAtUvY8auHjluiKWa1MI17UCA0dZwePcSlbikkMZ2jg?=
 =?us-ascii?Q?SRbqPt3d/ulJR55A4EuNPSMxlyz+VwTYTqeVk9cBZlpWmmKTZM0X/lW9U50C?=
 =?us-ascii?Q?AKST79Z2vmJ/6hMjuRdEnUjtsy0siJ5b7fisGN2KU4UiDDq3lVE55g+l+Hax?=
 =?us-ascii?Q?QxQiAkwW9iDDE5IoSUhg0wK/16SUewEXrtFZReP0W34vatzfIikNltbOTaAi?=
 =?us-ascii?Q?ZxC+VRA5r+EWfCz4hzUzd7fIVaImlMYe62TUkWgrd4K1sqqzgTIJsPvw/P0j?=
 =?us-ascii?Q?L435AlwxzhzQRiH56cFacCWMsabu4hAhGyA9tku3SSzPtbI0yY9iMonHhVKJ?=
 =?us-ascii?Q?zii6olKrmoSsERzaMGTU37gsYOJOf3Rl/ziaV8QIODw1SdLzz6sw6ZUL7Ob4?=
 =?us-ascii?Q?r0WjFBP2fz2+MIjFR6btPljpC0GoOZU7sWIP082n7aLanw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jrdP1ZsHbgDHXhRdmXA6yxHgDYOB57dj2TPcozn320AZl5pkKAP7ngbvuD0q?=
 =?us-ascii?Q?Yi1nDCuoyF8zyA6qg9GWDVBxZbDxkh1gicDKHUrQW6TA3z7j/m4Kk4L5GUaU?=
 =?us-ascii?Q?cVyUnFpD5s/4lqEPImYwrC/xa6RnujWb/vtVfkFYqQxBpxUZgwgvhHsaG9nX?=
 =?us-ascii?Q?ER2oQ+ZVMsSifg2/Ba0dihe3wQm9iCe9b4G9QS1nq3kmg+UgSs7g5g0OeJI+?=
 =?us-ascii?Q?Ek1DDm1J8lmR84EjZqmfCmLSyNL9Ei6vbE6f6x66g1G2Un0F+y/9DSzMoMBz?=
 =?us-ascii?Q?J2bXvez7WfjzSWlQoWFxMvT6XXSC7XvPfq+ZLs0hXFXi8x3U7kIQwzkWwlgE?=
 =?us-ascii?Q?BMtN6klIWoQeRlTRzLweZf64a59jj2/ozWmtEpcFG4zuRvFNZA+pF8PR5842?=
 =?us-ascii?Q?phWaRbNSf8dfgyXn3WleshqXbs/dHOXtAdWuZs5q0nDD1nlUeDHBFwFw9MjR?=
 =?us-ascii?Q?6sEM9Q1stNdDbDEVO5Vowrmzrx8xUvYOrXeY4RDzNxd5eu0gxuHuY/rrP4Ge?=
 =?us-ascii?Q?lvH3h4c2HVkK89/f5oSkcQKRKGmJIm9F2A2Tl0gjIg+lPutG1aSrcfRbCZUv?=
 =?us-ascii?Q?JdhrXSRzSOEBg7sFHzIfWPammPngUhankjNkuirmVLtdVyr1YDFcak3eODTn?=
 =?us-ascii?Q?dwZvzCeoqIpiRcjUOKJ314I76NhlPrWe5emZAooR+Wn3Q5fcNd2LRNwQMaDE?=
 =?us-ascii?Q?SXekMWEIB5JswOBbny8h2c/KCyDI/LdqBY13/yrXy8mwi/BIdQSlJw07pPaj?=
 =?us-ascii?Q?JeKM+5bLzqR5k147JkgarMg0ho9GpCWXmZ5Vh3K6iYuCZHIEs61Jt8copLpu?=
 =?us-ascii?Q?jmaMTzzM8qQUdQoz3Rg9k9Ep0pLGq1YpQYFl4PnD9suv18T5wxC1tbVA4F8c?=
 =?us-ascii?Q?JT/ExNPWUIgNKXL+UmrGouDYpYK3fF41km+sCwgO8jMj5/CflJ0A4ppZ5UwY?=
 =?us-ascii?Q?mzzDwryZ3GLNzRn00Q2Dewgyq1+waY3B1+YLv/9Jyx9qx61ej6Ght5FnCOL2?=
 =?us-ascii?Q?TUG1MLhZc7O33GnLzxvXamO3N4LWFsaeQc6jov6/eMZMnLNJmHSoVt/E/3KD?=
 =?us-ascii?Q?0TGMKX8Ru7n41bjV0+/boDBVMult7rNoh/Ssa2/hsDB81+JRIW2+Sb//Ando?=
 =?us-ascii?Q?6C/NrgnYLvg3kONedpkQ0vEUgGEvzxApScsioNblekUqdiEBbAFlHLeVDa8Q?=
 =?us-ascii?Q?eBfAYpMqMDOKimRyMP6kTEW0g2z+qq5bSXUFxu6hwXdbZ9tJaUgzxFXkgmfP?=
 =?us-ascii?Q?ny67EDgxeLTnkFWXTkO2jABLm0/JrcGGiuZJHhVBQo2ECJxoOFImLJIZhCqh?=
 =?us-ascii?Q?bA5Aqc/o7jPOEb0fnGy3PGTxuFeqEsbWyAEEzMgcjcVbxZaC4uOxVKnMss2U?=
 =?us-ascii?Q?f2Q2ePfC//8iFVpiaPvn7NIcLNOjSDkTEU6eYchQBo75b1n6JHNflrXJp8Qm?=
 =?us-ascii?Q?QYmZrtq3+HsVoNLb4B4DElxo8ieG9njS9FAcm4SEiG6Tv6H8sGquWK8FxG/1?=
 =?us-ascii?Q?YnQ7yxAYBXxEVslMnW11Yoiplfcg3wasr+OJJLkpdK7NKBjbz8PYVXVGKsAj?=
 =?us-ascii?Q?KFA05vsQsBpHFpouLSM5zP7hlJn78FTMNV7X/IU0OxJKkWsgCUBwUjtH2APe?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c84dff03-25c9-4fa1-6336-08dcceca05eb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 23:17:05.9429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZjc5CPyAPX3AkrQBotDmvuR4WKwZqVVnfdtg+nJMTzwXpdpCUASzH5wFocNHUIMTAnpSUY1t5XdO75oBX9DcT+9gtvf2T4H7BrAjvCA+To=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7790
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

On Fri, Sep 06, 2024 at 04:51:45PM -0500, Lucas De Marchi wrote:
> On Fri, Sep 06, 2024 at 12:02:09PM GMT, Jani Nikula wrote:
> > On Tue, 03 Sep 2024, Matt Roper <matthew.d.roper@intel.com> wrote:
> > > Stop using GT pointers for register access.
> > > 
> > > Since display (via compat-i915) was the only part of the driver doing
> > > 8-bit and 16-bit register reads, this also allows us to drop the
> > > _Generic wrapper macro on these two functions.
> > > 
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > >  .../drm/xe/compat-i915-headers/intel_uncore.h | 36 +++++++++----------
> > >  drivers/gpu/drm/xe/xe_mmio.c                  |  4 +--
> > >  drivers/gpu/drm/xe/xe_mmio.h                  |  7 ++--
> > >  3 files changed, 22 insertions(+), 25 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> > > index eb5b5f0e4bd9..ee3469d4ae73 100644
> > > --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> > > +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> > > @@ -10,11 +10,11 @@
> > >  #include "xe_device_types.h"
> > >  #include "xe_mmio.h"
> > > 
> > > -static inline struct xe_gt *__compat_uncore_to_gt(struct intel_uncore *uncore)
> > > +static inline struct xe_mmio *__compat_uncore_to_mmio(struct intel_uncore *uncore)
> > >  {
> > >  	struct xe_device *xe = container_of(uncore, struct xe_device, uncore);
> > > 
> > > -	return xe_root_mmio_gt(xe);
> > > +	return xe_root_tile_mmio(xe);
> > >  }
> > 
> > Side note, I'd be really interested in ideas getting from the intel_de.h
> > struct intel_display based interfaces to both i915 struct intel_uncore
> > and xe struct xe_mmio based interfaces.
> 
> shouldn't we have an equivalent of xe_mmio for the display engine?
> intel_de is kind of that already, but without the protection about the
> range it's writting/reading to/from.

At one point I was thinking maybe intel_display's register functions
should just do their own readq's and such, either with its own iomap, or
with an iomap that the core driver hands it.  But recently I've seen a
couple workarounds come by of the form "do XXX after every YYY accesses
to the GTTMMADR" which do require some per-PCI device tracking so I
backed off the idea of trying to do anything like that right now.  Also
the device-wide "uncore lock" is probably still important for some of
the older platforms i915 supports (although nobody seems to know the
specific platform(s) that needed that synchronization).


Matt

> 
> Lucas De Marchi
> 
> > 
> > Is the easiest common denominator actually a struct drm_device based
> > interface? At the calling side, we shouldn't use or have any idea about
> > i915 or xe specifics, like struct drm_i915_private, struct xe_device,
> > struct intel_uncore, struct xe_mmio, struct intel_gt or struct xe_gt,
> > etc.
> > 
> > BR,
> > Jani.
> > 
> > 
> > > 
> > >  static inline struct xe_tile *__compat_uncore_to_tile(struct intel_uncore *uncore)
> > > @@ -29,7 +29,7 @@ static inline u32 intel_uncore_read(struct intel_uncore *uncore,
> > >  {
> > >  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > 
> > > -	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
> > > +	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
> > >  }
> > > 
> > >  static inline u8 intel_uncore_read8(struct intel_uncore *uncore,
> > > @@ -37,7 +37,7 @@ static inline u8 intel_uncore_read8(struct intel_uncore *uncore,
> > >  {
> > >  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > 
> > > -	return xe_mmio_read8(__compat_uncore_to_gt(uncore), reg);
> > > +	return xe_mmio_read8(__compat_uncore_to_mmio(uncore), reg);
> > >  }
> > > 
> > >  static inline u16 intel_uncore_read16(struct intel_uncore *uncore,
> > > @@ -45,7 +45,7 @@ static inline u16 intel_uncore_read16(struct intel_uncore *uncore,
> > >  {
> > >  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > 
> > > -	return xe_mmio_read16(__compat_uncore_to_gt(uncore), reg);
> > > +	return xe_mmio_read16(__compat_uncore_to_mmio(uncore), reg);
> > >  }
> > > 
> > >  static inline u64
> > > @@ -57,11 +57,11 @@ intel_uncore_read64_2x32(struct intel_uncore *uncore,
> > >  	u32 upper, lower, old_upper;
> > >  	int loop = 0;
> > > 
> > > -	upper = xe_mmio_read32(__compat_uncore_to_gt(uncore), upper_reg);
> > > +	upper = xe_mmio_read32(__compat_uncore_to_mmio(uncore), upper_reg);
> > >  	do {
> > >  		old_upper = upper;
> > > -		lower = xe_mmio_read32(__compat_uncore_to_gt(uncore), lower_reg);
> > > -		upper = xe_mmio_read32(__compat_uncore_to_gt(uncore), upper_reg);
> > > +		lower = xe_mmio_read32(__compat_uncore_to_mmio(uncore), lower_reg);
> > > +		upper = xe_mmio_read32(__compat_uncore_to_mmio(uncore), upper_reg);
> > >  	} while (upper != old_upper && loop++ < 2);
> > > 
> > >  	return (u64)upper << 32 | lower;
> > > @@ -72,7 +72,7 @@ static inline void intel_uncore_posting_read(struct intel_uncore *uncore,
> > >  {
> > >  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > 
> > > -	xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
> > > +	xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
> > >  }
> > > 
> > >  static inline void intel_uncore_write(struct intel_uncore *uncore,
> > > @@ -80,7 +80,7 @@ static inline void intel_uncore_write(struct intel_uncore *uncore,
> > >  {
> > >  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > 
> > > -	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
> > > +	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
> > >  }
> > > 
> > >  static inline u32 intel_uncore_rmw(struct intel_uncore *uncore,
> > > @@ -88,7 +88,7 @@ static inline u32 intel_uncore_rmw(struct intel_uncore *uncore,
> > >  {
> > >  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > 
> > > -	return xe_mmio_rmw32(__compat_uncore_to_gt(uncore), reg, clear, set);
> > > +	return xe_mmio_rmw32(__compat_uncore_to_mmio(uncore), reg, clear, set);
> > >  }
> > > 
> > >  static inline int intel_wait_for_register(struct intel_uncore *uncore,
> > > @@ -97,7 +97,7 @@ static inline int intel_wait_for_register(struct intel_uncore *uncore,
> > >  {
> > >  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > 
> > > -	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
> > > +	return xe_mmio_wait32(__compat_uncore_to_mmio(uncore), reg, mask, value,
> > >  			      timeout * USEC_PER_MSEC, NULL, false);
> > >  }
> > > 
> > > @@ -107,7 +107,7 @@ static inline int intel_wait_for_register_fw(struct intel_uncore *uncore,
> > >  {
> > >  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > 
> > > -	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
> > > +	return xe_mmio_wait32(__compat_uncore_to_mmio(uncore), reg, mask, value,
> > >  			      timeout * USEC_PER_MSEC, NULL, false);
> > >  }
> > > 
> > > @@ -118,7 +118,7 @@ __intel_wait_for_register(struct intel_uncore *uncore, i915_reg_t i915_reg,
> > >  {
> > >  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > 
> > > -	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
> > > +	return xe_mmio_wait32(__compat_uncore_to_mmio(uncore), reg, mask, value,
> > >  			      fast_timeout_us + 1000 * slow_timeout_ms,
> > >  			      out_value, false);
> > >  }
> > > @@ -128,7 +128,7 @@ static inline u32 intel_uncore_read_fw(struct intel_uncore *uncore,
> > >  {
> > >  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > 
> > > -	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
> > > +	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
> > >  }
> > > 
> > >  static inline void intel_uncore_write_fw(struct intel_uncore *uncore,
> > > @@ -136,7 +136,7 @@ static inline void intel_uncore_write_fw(struct intel_uncore *uncore,
> > >  {
> > >  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > 
> > > -	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
> > > +	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
> > >  }
> > > 
> > >  static inline u32 intel_uncore_read_notrace(struct intel_uncore *uncore,
> > > @@ -144,7 +144,7 @@ static inline u32 intel_uncore_read_notrace(struct intel_uncore *uncore,
> > >  {
> > >  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > 
> > > -	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
> > > +	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
> > >  }
> > > 
> > >  static inline void intel_uncore_write_notrace(struct intel_uncore *uncore,
> > > @@ -152,7 +152,7 @@ static inline void intel_uncore_write_notrace(struct intel_uncore *uncore,
> > >  {
> > >  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
> > > 
> > > -	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
> > > +	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
> > >  }
> > > 
> > >  static inline void __iomem *intel_uncore_regs(struct intel_uncore *uncore)
> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > > index 92f0bda0ae30..dbede6056bee 100644
> > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > @@ -200,7 +200,7 @@ static void mmio_flush_pending_writes(struct xe_mmio *mmio)
> > >  		writel(0, mmio->regs + DUMMY_REG_OFFSET);
> > >  }
> > > 
> > > -u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
> > > +u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
> > >  {
> > >  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
> > >  	u8 val;
> > > @@ -214,7 +214,7 @@ u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
> > >  	return val;
> > >  }
> > > 
> > > -u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
> > > +u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
> > >  {
> > >  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
> > >  	u16 val;
> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> > > index ac6846447c52..99e3b58c9bb2 100644
> > > --- a/drivers/gpu/drm/xe/xe_mmio.h
> > > +++ b/drivers/gpu/drm/xe/xe_mmio.h
> > > @@ -27,11 +27,8 @@ int xe_mmio_probe_tiles(struct xe_device *xe);
> > >  		 const struct xe_mmio *: (ptr), \
> > >  		 struct xe_mmio *: (ptr))
> > > 
> > > -u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
> > > -#define xe_mmio_read8(p, reg) __xe_mmio_read8(__to_xe_mmio(p), reg)
> > > -
> > > -u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
> > > -#define xe_mmio_read16(p, reg) __xe_mmio_read16(__to_xe_mmio(p), reg)
> > > +u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
> > > +u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
> > > 
> > >  void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);
> > >  #define xe_mmio_write32(p, reg, val) __xe_mmio_write32(__to_xe_mmio(p), reg, val)
> > 
> > -- 
> > Jani Nikula, Intel

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
