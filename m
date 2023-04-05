Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20D5C7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 23:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A060810E57F;
	Wed,  5 Apr 2023 23:30:56 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDA710E57F
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 23:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680737454; x=1712273454;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=muiuSitqpTR7i6eNKs+3LO/YidkbYZ4IpHQDIqwHBkg=;
 b=IXgOqhaMmnOF4+e1PqFY2D4oQJWQ0iGKgtCpDa6MCDdvlCIAWaupdkOb
 9PRPGhgOUcwfW332bktt29hLRMvSjNqTtKD28Q+ZiljVRQEKLM2xfB7js
 975K9iTE0SXRJcndkOYeM/1wbSQYjFBUC8F8jmkb/Xv+LRSBtBufeQvif
 5KaH/FKw5le7imM49ACqQ1sLXfXq1DJzkJgSF767NWwQfzPy2euuLsYXc
 z8zNHADpjZa1Q0y0en9Zfr/ot7BYUeEn010xhuOP2BmJ6oDyEVOdQmGim
 3LE71+MpaMqdipsj3bz7tkHLtXFkp82aF4MkG4KJHg+h/jrdMNdVkSYdA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="407685571"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="407685571"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 16:30:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="933008463"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="933008463"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 05 Apr 2023 16:30:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 16:30:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 16:30:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 16:30:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtiJZHB1LeNDdsUlDwyZCLKf5Pmp1o7yeAbPgzSn0x8XgnLL28WRjk1Q9j+3KjxZn41WN1mriC/UJdJolIQWMVM10cyFuLFaNefI6hKjpYMoI/an+XMm0QHGxYmkWSDiTDNGsUgvLnjDUDnXV0v13tmq5qeMiGhkFPG5+/4oxXzDp6FHLYCtY/6uaIv16oi+pWaCGIsyxG0C+895cGf+vaFHws+6W3eR4ZTKhPJT/czdyt/DJz22ovl6SpgwCIwwQ7u2/LluHohfAnsN3TyN3YFHYQPbbBHUpfgqahSsF7N0nZMQWdM1P7l7angU986pU+xE8Dz4qtQK4uyzdfAuBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2Q5SLVTWAq47J9+1v8PUk+uKAQ5en9K+z2gq2XX3Ss=;
 b=jaOAt0FwnwCqUd4oDmvREftNrm41/y7TQpowPqdClLO+lCk5JZvuiePweudUT+3rFoEB+Wcb3FvrL4ttFY5bIe/Cxy7s2MytNBrM8zP8fmjW05kmPQvs/7k4wNT8Rfiug3ObQTY3eaurXikB9Cg42cMy3xn04yk8TL5OefYquL1txHNL6B5Oa1POcupdCFJhf/LYdoZBK/u6DBSdFU2e0oijPg2nlZimgaEgt3RUjJ59GMJMjYTMTZabWK2pRuy2jGX2tyjJjoaBvA3iXBxfsSwHjpY+zLfWir+XgsEHxSDSXj5jSYpMpk5lSN2t4uZeOWkssj9jqmGVjc4vwx2JIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH8PR11MB7143.namprd11.prod.outlook.com (2603:10b6:510:22d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Wed, 5 Apr
 2023 23:30:50 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 23:30:50 +0000
Date: Wed, 5 Apr 2023 16:30:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230405233047.GJ4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
 <20230403201702.996400-7-matthew.d.roper@intel.com>
 <20230405223602.kxmiilzaabjlmodk@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230405223602.kxmiilzaabjlmodk@ldmartin-desk2.lan>
X-ClientProxiedBy: BYAPR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:40::41) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH8PR11MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: 832f8d6b-59fb-4c6d-eb6d-08db362dcaa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tERure2dbtQG6wihgx/ITegS5vd2BC0vfoYrU6bT4KOYndK/XTXNPTVQoOSW/8NmbUdNo0/xoqk09xBXxTDqhQh/G1akfbTCfvojP2qayWD8gsXay1sCEtVmy0pMwmRzzhxtB9UvxCE6+26ujBVkzA9uhSDy7ZX7r1Wwb63MevEhyIaK82QXAXRbSCGTB/ubhPw3cBxyUPT9XthhYHPf32wxebbS+kyZFOYgYYV2TH4wYQfElsUkzWfkDo7SWjeCJi2aHr4Ef0xsq4KFwLCrJ8AMveefaFZsIx7Fxm0fG6pjSMZmLBWTtmSfYvOi5ZIu15/BUbtzDS+WOqS9PPYu+cBapluUa+3MxeoXZROoFyvrILn+IXBjLpsLuFcvPm3h0KDMCXw6+bbk0Fwr9zMp65yPzycnvjdCTKCDSXp45xgScsi0R4VwwbNqxeil4p6Q0nloO68lTkCiYtAGNFgjo9AGmfL67KXr+SYEE9QumEtJAw7vZY0NJMvQtaYFDOqWmDTXANT5+D0uK/97FnHim0ykdP9lGV77xwDVHesHrOH1hB47drfebZYnM6jU/Ek/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(33656002)(186003)(6512007)(86362001)(6666004)(6506007)(1076003)(26005)(5660300002)(6636002)(8936002)(6862004)(316002)(478600001)(82960400001)(8676002)(66476007)(4326008)(66946007)(66556008)(38100700002)(2906002)(83380400001)(41300700001)(30864003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nVUoCRj6TJHjUKIHpGnvbhegTDPk21r3hgI6ZcGSrbRuDK1ClPX3xntd25xi?=
 =?us-ascii?Q?BKS6oFypSG0Axgw6UQ8/9uTn/Gy7QjbY7uYdH07LDgb2OKpXzaoWqtNvuMFD?=
 =?us-ascii?Q?OEY59Y9xLqfksqnXIpFOwyIprtZIQ8jP6UjClsIAGnp4KfLlcRSeN2R0vR0v?=
 =?us-ascii?Q?oWuyDLUfeRUMOCf1ZAQniE9yuGdHU3QzqVE9EiJPQKRH7AcpJjxZW/0W40xD?=
 =?us-ascii?Q?BgPSl97eIi/8dsLHnCwlyr1pZ3vk8ARg8MhMdc21nwku2wDhX3knkmbvIk0A?=
 =?us-ascii?Q?XURZz9eRYEZ3+SIm6sYyFeUs6703Wdv7Lcof+QhIZdd1+Iaw9YZQNovqXf5X?=
 =?us-ascii?Q?NUUe6xWQSZ6vGi9hAallxOJd1CLsYMjzvUj+x7kjlN0z9peij8wuWQYZzEFs?=
 =?us-ascii?Q?B57CiEOJjndpCkeMVAiejCURGYXD0XTUuaW2Kh4B9PzeBueYh2ejq3FkS2Eb?=
 =?us-ascii?Q?BMFlrF/SKmdGJjeayfLxKyhPZkovxqrWhUEajdjKwEmVfNfWNfdhBE/Wl+tr?=
 =?us-ascii?Q?z6ikC48z3E8xDjutlEPIpdZGW4hG8foh8uBCr1y9MRUjvcCa+2NqKbgb2cR7?=
 =?us-ascii?Q?Od4w8VuIhQe21ZGEU8is5skzaYQhPqsuqKPjwCHDUtfagLSeZN1g90kPpFQu?=
 =?us-ascii?Q?ue2ZQr8ZnDjnwvrvgxM2wuo6PmsrT1O8Ge8Y6uo+NR0cWvDmcFwOYgnTzMch?=
 =?us-ascii?Q?6r25tLhqSTGRtahgP9DDe5deynvF4545PwDGoSojdn+2scqRRfRLxClrS7qP?=
 =?us-ascii?Q?MsS5eBhx7Ngb3hzzcLyxUv2iuIxOhPGhpNQO5Vrp/8dJwUSxikEMnD4n6nIG?=
 =?us-ascii?Q?ZZqq7Py0hdGMMrd3x6cXyhMwQ5qLg+CPPZ1jFANM+lTKoLGDG3rKhb/r9jdP?=
 =?us-ascii?Q?y0z9m81e2a8UB4VDuvWy2pwgqN7mZcIInsI34iJ2ELt/jVcWOUBkthLlsUmL?=
 =?us-ascii?Q?Jh+1nltsWGBgUyzJ1wotf4j2R65ZM/bcTk/Nc66JsCqGbNrjYcri+UMc///P?=
 =?us-ascii?Q?75eGpC4WY3R7B8nSf/Lu8+bKUOiUxSc0SRveCh5pBAdkSl3jUaq8BzoluXyi?=
 =?us-ascii?Q?LNem4ZHeoZALDiCNUAheaQaDGG1DDHOwhE7XI4PxghYN7zSUbpn1Qr7vSzfl?=
 =?us-ascii?Q?G1UFrGYRakQ8ecWLXKyYLa/g3tzeIaSFLQQJQr7FkG/wnD8TsikN2h6Q9gBu?=
 =?us-ascii?Q?KqVA0jX3AVmsjcj+IjzACLdnK7A4RC0sZeYke91JnYQo0B+3qnsBCM3VsEDb?=
 =?us-ascii?Q?Xrx30lg8pgC7dGHYpisorVLTCavvshMNZMG1F0/jGvyTlaVtW310+cK3fnWU?=
 =?us-ascii?Q?6UGk4DvgcJD7ZuirgDulo05A1mOCvobdMCcventbm6x+OoMPNtiOfgrMe2VB?=
 =?us-ascii?Q?QaXWMylg1y0k+qMuMDCA+Em15oavIWCQzmMJX79UU4aQtivZvQp/lPAzUbVv?=
 =?us-ascii?Q?7igz5jqQuOSmA8REZuVhVutySq71/J+pVHhU0Wxarxnap6aLlW9PNEk6VFjU?=
 =?us-ascii?Q?kaxy4HxA7dFIl00p6s2zDg7WjE2Jpyvyv4g4noy+DkIUAb0ZijJsAPsYQtwc?=
 =?us-ascii?Q?I+V+7lQimfW1kWpxbX0WzLF0pRX8HmVwpPIYrrdjzOsGWcc33SsrHDw5e0N/?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 832f8d6b-59fb-4c6d-eb6d-08db362dcaa1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 23:30:50.5699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tnn3N0P7KQHqnV+tWSBB7y2Ok54MDBWnUGCynYNmcBH/LrJqgUcNB2Qpfe0gN6EnJLLgUM2gOTfzt9Hypa4zV5B8ihzlUBIj24AzD0jnRfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7143
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe: Select graphics/media
 descriptors from GMD_ID
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

On Wed, Apr 05, 2023 at 03:36:02PM -0700, Lucas De Marchi wrote:
> On Mon, Apr 03, 2023 at 01:17:02PM -0700, Matt Roper wrote:
> > Hook up dummy graphics_desc and media_desc structures on platforms that
> > use GMD_ID.  When such a platform is probed, the IP version will be read
> > from the hardware's GMD_ID registers and that version number will be
> > used to select a graphics/media descriptor with the appropriate settings
> > for the detected IP.
> > 
> > If a GMD_ID platform reports a graphics version the driver does not
> > recognize and support, device probe will be aborted.  If an unrecognized
> > media version is reported the device probe will leave media
> > uninitialized and continue.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/regs/xe_gt_regs.h |   6 +
> > drivers/gpu/drm/xe/xe_pci.c          | 161 +++++++++++++++++++++------
> > 2 files changed, 136 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index f45251df5715..2d265dbb7651 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -22,6 +22,12 @@
> > #define FORCEWAKE_ACK_MEDIA_VDBOX_GEN11(n)	_MMIO(0xd50 + (n) * 4)
> > #define FORCEWAKE_ACK_MEDIA_VEBOX_GEN11(n)	_MMIO(0xd70 + (n) * 4)
> > #define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
> > +
> > +#define GMD_ID					_MMIO(0xd8c)
> > +#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
> > +#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
> > +#define   GMD_ID_STEP				REG_GENMASK(5, 0)
> > +
> > #define FORCEWAKE_ACK_GT_MTL			_MMIO(0xdfc)
> > 
> > #define GEN9_LNCFCMOCS(i)			_MMIO(0xb020 + (i) * 4)	/* L3 Cache Control */
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index d634e781858a..62685b14257b 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -15,6 +15,7 @@
> > #include <drm/xe_pciids.h>
> > 
> > #include "regs/xe_regs.h"
> > +#include "regs/xe_gt_regs.h"
> > #include "xe_device.h"
> > #include "xe_display.h"
> > #include "xe_drv.h"
> > @@ -99,6 +100,14 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> > 
> > #define NOP(x)	x
> > 
> > +static const struct xe_graphics_desc graphics_gmdid = {
> > +	/*
> > +	 * Unset graphics version implies GMD_ID support; driver will read
> > +	 * the IP version from hardware and then select a more appropriate
> > +	 * graphics descriptor.
> > +	 */
> > +};
> > +
> > static const struct xe_graphics_desc graphics_xelp = {
> > 	.ver = 12,
> > 	.rel = 0,
> > @@ -164,9 +173,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
> > };
> > 
> > static const struct xe_graphics_desc graphics_xelpg = {
> > -	.ver = 12,
> > -	.rel = 70,
> > -
> 
> can we change the logic so we leave the version here?  While reading the
> rest of the driver it will be horrible not to have in the source code
> the reference about the IP version.

The 'switch' in handle_gmdid() provides the number(s) that we consider
to be a match for any of these structures going forward; is that not
enough?  Note that putting something like 12.70 here gives an incomplete
picture since 12.71 is is also a match (and there could be more numbers
we associate with it in the future too).

If handle_gmdid()'s numbers aren't clear enough, I could just put a
comment here listing what numbers we expect to match to this structure?


Matt

> 
> 
> > 	.hw_engine_mask =
> > 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
> > 		BIT(XE_HW_ENGINE_CCS0),
> > @@ -175,6 +181,14 @@ static const struct xe_graphics_desc graphics_xelpg = {
> > 	.has_flat_ccs = 0,
> > };
> > 
> > +static const struct xe_media_desc media_gmdid = {
> > +	/*
> > +	 * Unset graphics version implies GMD_ID support; driver will read
> > +	 * the IP version from hardware and then select a more appropriate
> > +	 * media descriptor.
> > +	 */
> > +};
> > +
> > static const struct xe_media_desc media_xelp = {
> > 	.ver = 12,
> > 	.rel = 0,
> > @@ -194,9 +208,6 @@ static const struct xe_media_desc media_xehpm = {
> > };
> > 
> > static const struct xe_media_desc media_xelpmp = {
> > -	.ver = 13,
> > -	.rel = 0,
> > -
> > 	.hw_engine_mask =
> > 		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
> > 		BIT(XE_HW_ENGINE_VECS0),	/* TODO: add GSC0 */
> > @@ -298,12 +309,8 @@ static const struct xe_gt_desc xelpmp_gts[] = {
> > };
> > 
> > static const struct xe_device_desc mtl_desc = {
> > -	/*
> > -	 * FIXME:  Real graphics/media IP will be mapped from hardware
> > -	 * GMD_ID register.  Hardcoded assignments here will go away soon.
> > -	 */
> > -	.graphics = &graphics_xelpg,
> > -	.media = &media_xelpmp,
> > +	.graphics = &graphics_gmdid,
> > +	.media = &media_gmdid,
> > 	.require_force_probe = true,
> > 	PLATFORM(XE_METEORLAKE),
> > 	.extra_gts = xelpmp_gts,
> > @@ -414,9 +421,91 @@ static void xe_pci_remove(struct pci_dev *pdev)
> > 	pci_set_drvdata(pdev, NULL);
> > }
> > 
> > +static u32 peek_gmdid(struct xe_device *xe, u32 gmdid_offset)
> > +{
> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > +	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
> > +	u32 ver;
> > +
> > +	if (!map) {
> > +		drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI BAR.\n",
> > +			gmdid_offset);
> > +		return 0;
> > +	}
> > +
> > +	ver = ioread32(map);
> > +	pci_iounmap(pdev, map);
> > +
> > +	return REG_FIELD_GET(GMD_ID_ARCH_MASK, ver) * 100 +
> > +		REG_FIELD_GET(GMD_ID_RELEASE_MASK, ver);
> > +}
> > +
> > +static void handle_gmdid(struct xe_device *xe,
> > +			 const struct xe_device_desc *desc,
> > +			 const struct xe_graphics_desc **graphics,
> > +			 const struct xe_media_desc **media)
> > +{
> > +	u32 ver;
> > +
> > +	if (desc->graphics->ver) {
> > +		/*
> > +		 * Pre-GMD_ID platform; device descriptor already points to
> > +		 * the appropriate graphics descriptor.
> > +		 */
> > +		*graphics = desc->graphics;
> > +		xe->info.graphics_verx100 = (*graphics)->ver * 100 + (*graphics)->rel;
> > +	} else {
> > +		/*
> > +		 * GMD_ID platform; read IP version from hardware and select
> > +		 * graphics descriptor based on the result.
> > +		 */
> > +		ver = peek_gmdid(xe, GMD_ID.reg);
> > +		switch (ver) {
> > +		case 1270:
> > +		case 1271:
> 
> `case 1270 ... 1271` seems slightly better as then we can easily extend
> the range.
> 
> > +			*graphics = &graphics_xelpg;
> > +			xe->info.graphics_verx100 = ver;
> > +			break;
> > +		default:
> > +			drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
> > +				ver / 100, ver % 100);
> > +		}
> > +	}
> > +
> > +	if (!desc->media)
> > +		/* No media support at all */
> > +		return;
> > +
> > +	if (desc->media && desc->media->ver) {
> 
> no need to check desc->media as the condition above just returned.
> 
> 
> ... some nits above, otherwise
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> This series needs a rebase as it doesn't apply anymore.
> 
> Lucas De Marchi
> 
> 
> > +		/*
> > +		 * Pre-GMD_ID platform; device descriptor already points to
> > +		 * the appropriate media descriptor.
> > +		 */
> > +		*media = desc->media;
> > +		xe->info.media_verx100 = (*media)->ver * 100 + (*media)->rel;
> > +	} else {
> > +		/*
> > +		 * GMD_ID platform; read IP version from hardware and select
> > +		 * media descriptor based on the result.
> > +		 */
> > +		ver = peek_gmdid(xe, GMD_ID.reg + 0x380000);
> > +		switch (ver) {
> > +		case 1300:
> > +			*media = &media_xelpmp;
> > +			xe->info.media_verx100 = ver;
> > +			break;
> > +		default:
> > +			drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
> > +				ver / 100, ver % 100);
> > +		}
> > +	}
> > +}
> > +
> > static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > {
> > 	const struct xe_device_desc *desc = (void *)ent->driver_data;
> > +	const struct xe_graphics_desc *graphics_desc = NULL;
> > +	const struct xe_media_desc *media_desc = NULL;
> > 	const struct xe_subplatform_desc *spd;
> > 	struct xe_device *xe;
> > 	struct xe_gt *gt;
> > @@ -445,22 +534,32 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > 	if (IS_ERR(xe))
> > 		return PTR_ERR(xe);
> > 
> > -	xe->info.graphics_verx100 = desc->graphics->ver * 100 +
> > -				    desc->graphics->rel;
> > -	if (desc->media)
> > -		xe->info.media_verx100 = desc->media->ver * 100 +
> > -					 desc->media->rel;
> > +	/*
> > +	 * If this platform supports GMD_ID, we'll detect the proper IP
> > +	 * descriptor to use from hardware registers.
> > +	 */
> > +	handle_gmdid(xe, desc, &graphics_desc, &media_desc);
> > +
> > +	/*
> > +	 * If we couldn't detect the graphics IP, that's considered a fatal
> > +	 * error and we should abort driver load.  Failing to detect media
> > +	 * IP is non-fatal; we'll just proceed without enabling media support.
> > +	 */
> > +	if (!graphics_desc)
> > +		return -ENODEV;
> > +
> > 	xe->info.is_dgfx = desc->is_dgfx;
> > 	xe->info.platform = desc->platform;
> > -	xe->info.dma_mask_size = desc->graphics->dma_mask_size;
> > -	xe->info.vram_flags = desc->graphics->vram_flags;
> > -	xe->info.vm_max_level = desc->graphics->vm_max_level;
> > -	xe->info.supports_usm = desc->graphics->supports_usm;
> > -	xe->info.has_asid = desc->graphics->has_asid;
> > -	xe->info.has_flat_ccs = desc->graphics->has_flat_ccs;
> > 	xe->info.has_4tile = desc->has_4tile;
> > -	xe->info.has_range_tlb_invalidation = desc->graphics->has_range_tlb_invalidation;
> > -	xe->info.has_link_copy_engine = desc->graphics->has_link_copy_engine;
> > +
> > +	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
> > +	xe->info.vram_flags = graphics_desc->vram_flags;
> > +	xe->info.vm_max_level = graphics_desc->vm_max_level;
> > +	xe->info.supports_usm = graphics_desc->supports_usm;
> > +	xe->info.has_asid = graphics_desc->has_asid;
> > +	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
> > +	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
> > +	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
> > 
> > 	/*
> > 	 * All platforms have at least one primary GT.  Any platform with media
> > @@ -471,7 +570,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > 	 * FIXME: 'tile_count' here is misnamed since the rest of the driver
> > 	 * treats it as the number of GTs rather than just the number of tiles.
> > 	 */
> > -	xe->info.tile_count = 1 + desc->graphics->max_remote_tiles;
> > +	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
> > 	if (MEDIA_VER(xe) >= 13)
> > 		xe->info.tile_count++;
> > 
> > @@ -488,9 +587,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > 			gt->info.type = XE_GT_TYPE_MAIN;
> > 			gt->info.vram_id = id;
> > 
> > -			gt->info.__engine_mask = desc->graphics->hw_engine_mask;
> > -			if (MEDIA_VER(xe) < 13 && desc->media)
> > -				gt->info.__engine_mask |= desc->media->hw_engine_mask;
> > +			gt->info.__engine_mask = graphics_desc->hw_engine_mask;
> > +			if (MEDIA_VER(xe) < 13 && media_desc)
> > +				gt->info.__engine_mask |= media_desc->hw_engine_mask;
> > 
> > 			gt->mmio.adj_limit = 0;
> > 			gt->mmio.adj_offset = 0;
> > @@ -498,8 +597,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > 			gt->info.type = desc->extra_gts[id - 1].type;
> > 			gt->info.vram_id = desc->extra_gts[id - 1].vram_id;
> > 			gt->info.__engine_mask = (gt->info.type == XE_GT_TYPE_MEDIA) ?
> > -				desc->media->hw_engine_mask :
> > -				desc->graphics->hw_engine_mask;
> > +				media_desc->hw_engine_mask :
> > +				graphics_desc->hw_engine_mask;
> > 			gt->mmio.adj_limit =
> > 				desc->extra_gts[id - 1].mmio_adj_limit;
> > 			gt->mmio.adj_offset =
> > -- 
> > 2.39.2
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
