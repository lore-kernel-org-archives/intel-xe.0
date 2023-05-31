Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F24C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 23:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF73410E1F1;
	Wed, 31 May 2023 23:57:15 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4431F10E0F9
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 23:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685577434; x=1717113434;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qkVCGqlynUA9R7acGeoZb8hFe8dV+jh+2h/Tz5LSjO4=;
 b=lAGmwzs5VUBB+KwInypYlPILR0qoQ3bQnsE+qRVjRYT2hpXN9pq+wnxi
 PeNIFPtQXUeiuP8Gg4Lda542EvGrPTYNWp1IMX76ccCJ8Q7Bn9vcHxpBC
 ELYJlR1fO+DHPO+0HQbF8ZoiaqeLXDwRLQf1X6sOVfnsdhrL7ZfywkPW3
 NpWikSIoOxCS5PWYnvVj98L4C1SJ2faagk95WZK5sPvgOsWe+8t/RPx5G
 wdHU1kN+1svcbpFJMC5eC4PWs4TrFwFTm9e0CLOWzvomLUkonpouW47R+
 PFkBDq+hznpqn6oVemtNXKyUMeupdsDlvYsbq0PfGdTWwkfRDVUpLXdmu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="335747555"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="335747555"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 16:57:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="707111299"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="707111299"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 31 May 2023 16:57:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 16:57:12 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 16:57:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 16:57:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 16:57:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+mCCLgR7xjocCL6DammhdwOIsQXtsVcHxBGIMVPI51I/tdnATNAgCmnfoazmwwFe5C10P9o6aOGxmZY8VcDif4BuyihA8c9MrrKJM4al6nwNWop4VIQUNDf+OxtjKpzh1U04/Lctp55APqGKdYDN3FZ9ix+JzehRu17DWyvWDtR622UVqeR9IS+8JkZUgk9r4k0m/KwPx0cM/CWioQPjVPZF2O66KfIeKgoshdMLVZ33JODbM5ixi6FyVNJp9njV0XeKxY0eutEA2lhevha8jHracfZBxmdW+2AjLPC+B1s3f8/mn3b6uuks5rcrrx4MS9C0VbbDYI+HO2q+70TMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ABSIwmSmnMzZu95f6JdVuRbymWE7FtJxsGttcHwPJ8=;
 b=HXwQBKaGvvv/8lh1Q1bmPJ9TwYxyRRBptdOF2IfMhkXKlQQNqMepyRC8cOJfLK6BgZXRH3ajUctrXHWq4AuePVyYdBAqkWftpm6UdEjbhjUjW9c/QRTkgHfJYdlAmOQkknCW+bi7eUR/JQr4C2syMdIBoinn0W5EuPpL6oCUkM8zZvPlPXLsfDYEoAaRXOwSRVql3wpmJh0Myh5+0M4+7Zmdpy9rpNuR0ygaeMa7DCMm6/NrXun1+cNsid/e8qPNDgcFbdx3XM8VZNr+LM3tjJ2xIQyfAdSOcWIKlK5UugTj0GgMgKm2ZrjS1Xm263HmkMC6kuG4zT7HrkqmjaF4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.24; Wed, 31 May 2023 23:57:09 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 23:57:09 +0000
Date: Wed, 31 May 2023 16:57:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <20230531235706.GD6953@mdroper-desk1.amr.corp.intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
 <20230530211549.2632538-22-matthew.d.roper@intel.com>
 <168557010517.1068887.8795252471989963135@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <168557010517.1068887.8795252471989963135@gjsousa-mobl2>
X-ClientProxiedBy: SJ0PR13CA0156.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::11) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b614db3-4daa-4933-6cbb-08db6232bebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cakB6G2ZHOpo0ACsrmhKn5C50P+3A4vcuEoWN9Lo3Uas3fOTgnaCEO+y8T0390uWTnq912kLyFjVnsBQn60FwR5CqKgcGjIwtcqs9d4pRA7ZymtvN7sZZLVJLSewn9Sf+RrGLCq1lDbU5UXtVKQ53UhYagVLHyFnETTIYizQ3c7ENcAfLb8wIJ5yhyJSQHhLq4uwdVnjzYCAQ/HopBk6uRw54K0rycmG6Tze4vsS8pRO6+AEVBE0joNWv7ntEKhY0Ffu/zqtRLcpf8/EE+JNaIdxMXBkE9o3npUrSabIhV3hrdq58IFIXfUxm5B2J1j9HzLVpIdJR7rfIQCkUCQB7hBv6ZdfCGmq0Q854im4CvSt0sspTyLnY9cpugMrJelwl9sj0J1Nr3eyrRxGTawEzrCbs+UsHPxgx9HOAquiOJXPZehI+SKKA3zuiTIXuxwFVxR2+OJE+z44R6LgXsgZmgKN9PSxJLC4gwIBvQa0SWZksAJ6O1stU0RR2DCnvnGA+xdE7J6f3uqrLs8apO64Bkt+2xoF93OvSQc5Mu/3ezVt7YhSNbGK/Pqs60tNDPWu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199021)(107886003)(6486002)(6666004)(83380400001)(38100700002)(82960400001)(86362001)(33656002)(1076003)(6512007)(6506007)(186003)(26005)(2906002)(30864003)(6636002)(66946007)(4326008)(66476007)(66556008)(5660300002)(6862004)(8676002)(8936002)(41300700001)(316002)(478600001)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EMlSbDgq5Zzgd1PYWOtwQxdpMGhYp7EQOCZyQULZH1O16kmYiBDjKLimr71M?=
 =?us-ascii?Q?mRoXDbx0ZWvIM8wW97FFJgutYuxb7clYo3mwa3zTgU6ZL5MdpCTCoOEoJcCJ?=
 =?us-ascii?Q?352brfdnbP7MEpARJ7Oxus9ZQHobxkO/9F6kLCshvPuQyJRq6W4/giVi1BP9?=
 =?us-ascii?Q?y8Cw7PbJzkU+V8pW0I0ScW2NdGeIa6/gDQuro/3E2yWMKHqHyaEuXsErjuFK?=
 =?us-ascii?Q?QGrJ8DMGkyQ1yGQZ4gg8O5yj2ZMnHq7Eg/fG2PsyDk63u3Tp/Z7Ql15cnx0d?=
 =?us-ascii?Q?0PFO2FSrAXjk5Qdo6qfeVL53mqkffBQAYs/jn+2nfb3/Yn1leJfHIS5CAbya?=
 =?us-ascii?Q?OQ0UVX6ES8oe49nMuZId5lhb4iHMBmlzzoFv7L2sIGa5d8HgiGkXdyfOXSpr?=
 =?us-ascii?Q?B3Bbv4+AUVi/hfKgjDtR3Cy9RcphzssqYbF/NgTznRIOYIasxBtORoTgtit3?=
 =?us-ascii?Q?ns5k5KwSeZL3E0/0gSpl+v3A+pkm+W/cQSc6Q0iomjcm4AdTUTkyAWkAHV7V?=
 =?us-ascii?Q?tGjqVgkrhNx82SY6mWpf6X5ZUSt7Ozjv8Uuxc1lSRrT6SqUP9KibpfGnbPzI?=
 =?us-ascii?Q?Hpy1SM9KKeQNbtrSJ3eKxUUy+vLXUj7DC8xQer6294TVppOLo2KE3p2SCt/O?=
 =?us-ascii?Q?93hD/Cto3QknyFvRLBM4dvd3uLG/OOe3zOyuyCi1DwWlreiASsskrih4fZGH?=
 =?us-ascii?Q?jI2F7T00+/s7HWg5hV5lQ/YLPqfSEFzROSQrnszjnN63+XdUKuJ92qwIJiyL?=
 =?us-ascii?Q?UogYi3bhJbHP6kHOJwU3DIO99Kejh8Ia6/e6T5WAGkRmpRWbqowI1HamXN1o?=
 =?us-ascii?Q?KIWCXaSLumd5qUjux0BiM3uNcyqUGjIqGidDj/PGkrJ1HDB2btsk8OkdY17S?=
 =?us-ascii?Q?94Dx1Hmh8FUaJDxLyyZfB7hmtELDHVRUg5rZfs9XNVH5tQnVF1ioLXOn8LGG?=
 =?us-ascii?Q?r8bGRoiPH8IcQEefkXKl/laaJcfRbFiYtYTuCZy7yeKdzOG/O9pjsKKVYlQG?=
 =?us-ascii?Q?1pJ03ThJSRmkPbY1VJMVBSvQLEOYEiqin27D1Gbs9XUEu7DN2lLftyaeZDQP?=
 =?us-ascii?Q?qkhvXZuf8Sxic9B0/H9LytQ9YyN/ZsdhVsXtj680g9HBdKhOvU5bV9c367QI?=
 =?us-ascii?Q?by4foRX1+vMYTCSiFmTDig5/gYKRipEguNW82xZu03LfgjQneeR7KX+qlcbh?=
 =?us-ascii?Q?sPx19jMbnlXtSeDPNRPlZ8wKhSmthvOBbZG5FTznXfSTocO07VQJ4oVQGCQQ?=
 =?us-ascii?Q?uQ5M3ng4uy9oFHdwx6BPIN4poc9s0Z0YaNa5Jq7CL8vk07ud3dwb4pP2ffMV?=
 =?us-ascii?Q?UJ5tdyf5dgPFyar6mCHXu1Mmjv8XU2hKhNFNpjn2e7L+7mnnHX8HCw0g+JRp?=
 =?us-ascii?Q?ZFjVL93qtcNhh2vXdEU3GJITclItVR/okKcO6zH5M+moDSoEg7jJqkD/2c7O?=
 =?us-ascii?Q?f7Q+qtNOD7lVpKa4NaMvHV9WEf5EpShqsqW0cAJ+XRyokQVVDsvoRNXq1aBb?=
 =?us-ascii?Q?qdTYLq9F8mvrqTBPaBgEn4p90aGjFIIdxslISj8GCeRXjNVqV84aUh3zVVof?=
 =?us-ascii?Q?PYtBEgISBHpwZumB1X+x25IB0ACBz0KJ9Vwm6pFmd52wafJ7ZJSdr2aFk5na?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b614db3-4daa-4933-6cbb-08db6232bebd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 23:57:09.4642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9UIpFgX217ptgy6vhyzesroyuoGGvosBptmeT5DS0rM8N619cPn8LJVRur5SOH0+1GVv2HI8ep8e7pC5+Ax7dVsMuac0+SPKXyqbT4vPHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7177
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 21/31] drm/xe: Interrupts are delivered
 per-tile, not per-GT
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 31, 2023 at 06:55:05PM -0300, Gustavo Sousa wrote:
> Quoting Matt Roper (2023-05-30 18:15:39-03:00)
> >IRQ delivery and handling needs to be handled on a per-tile basis.  Note
> >that this is true even for the "GT interrupts" relating to engines and
> >GuCs --- the interrupts relating to both GTs get raised through a single
> >set of registers in the tile's sgunit range.
> >
> >On true multi-tile platforms, interrupts on remote tiles are internally
> >forwarded to the root tile; the first thing the top-level interrupt
> >handler should do is consult the root tile's instance of
> >DG1_MSTR_TILE_INTR to determine which tile(s) had interrupts.  This
> >register is also responsible for enabling/disabling top-level reporting
> >of any interrupts to the OS.  Although this register technically exists
> >on all tiles, it should only be used on the root tile.
> >
> >The (mis)use of struct xe_gt as a target for MMIO operations in the
> >driver makes the code somewhat confusing since we wind up needing a GT
> >pointer to handle programming that's unrelated to the GT.  To mitigate
> >this confusion, all of the xe_gt structures used solely as an MMIO
> >target in interrupt code are renamed to 'mmio' so that it's clear that
> >the structure being passed does not necessarily relate to any specific
> >GT (primary or media) that we might be dealing with interrupts for.
> >Reworking the driver's MMIO handling to not be dependent on xe_gt is
> >planned as a future patch series.
> >
> >Note that GT initialization code currently calls xe_gt_irq_postinstall()
> >in an attempt to enable the HWE interrupts for the GT being initialized.
> >Unfortunately xe_gt_irq_postinstall() doesn't really match its name and
> >does a bunch of other stuff unrelated to the GT interrupts (such as
> >enabling the top-level device interrupts).  That will be addressed in
> >future patches.
> >
> >v2:
> > - Clarify commit message with explanation of why DG1_MSTR_TILE_INTR is
> >   only used on the root tile, even though it's an sgunit register that
> >   is technically present in each tile's MMIO space.  (Aravind)
> > - Also clarify that the xe_gt used as a target for MMIO operations may
> >   or may not relate to the GT we're dealing with for interrupts.
> >   (Lucas)
> >
> >Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> >Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_gt.c  |   2 +-
> > drivers/gpu/drm/xe/xe_irq.c | 334 ++++++++++++++++++++----------------
> > drivers/gpu/drm/xe/xe_irq.h |   4 +-
> > 3 files changed, 187 insertions(+), 153 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> >index f00b82e90106..071d4fbd3efc 100644
> >--- a/drivers/gpu/drm/xe/xe_gt.c
> >+++ b/drivers/gpu/drm/xe/xe_gt.c
> >@@ -310,7 +310,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> >         gt->info.engine_mask = gt->info.__engine_mask;
> > 
> >         /* Enables per hw engine IRQs */
> >-        xe_gt_irq_postinstall(gt);
> >+        xe_gt_irq_postinstall(gt_to_tile(gt));
> 
> Like noted in a previous patch for a similar situation, couldn't we potentially
> be repeating this call for the same tile in the future for tiles with multiple
> gts?

This is a bit different from the other patch.  In the other patch, the
code in question was in a !mediagt section, so it's guaranteed to only
run once per tile (i.e., on the primary GT).

You're right that if this code stayed as-is, it would be problematic for
a multi-GT platform.  However the postinstall stuff gets further
refactoring later in the series ("drm/xe: Replace xe_gt_irq_postinstall
with xe_irq_enable_hwe") and this call is replaced with
xe_irq_enable_hwe(gt) which is refocused on just enabling/unmasking the
subset of engine interrupts that relate to this specific GT.  So by the
time we actually reinstate multiple GT support again, this should all
work properly.


Matt

> 
> If my concern is valid, I wonder if there are other cases I didn't catch besides
> those two in the overall series.
> 
> --
> Gustavo Sousa
> 
> > 
> >         /* Rerun MCR init as we now have hw engine list */
> >         xe_gt_mcr_init(gt);
> >diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> >index 654c34a5b99a..ad2f73b2a031 100644
> >--- a/drivers/gpu/drm/xe/xe_irq.c
> >+++ b/drivers/gpu/drm/xe/xe_irq.c
> >@@ -27,60 +27,66 @@
> > #define IIR(offset)                                XE_REG(offset + 0x8)
> > #define IER(offset)                                XE_REG(offset + 0xc)
> > 
> >-static void assert_iir_is_zero(struct xe_gt *gt, struct xe_reg reg)
> >+static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
> > {
> >-        u32 val = xe_mmio_read32(gt, reg);
> >+        u32 val = xe_mmio_read32(mmio, reg);
> > 
> >         if (val == 0)
> >                 return;
> > 
> >-        drm_WARN(&gt_to_xe(gt)->drm, 1,
> >+        drm_WARN(&gt_to_xe(mmio)->drm, 1,
> >                  "Interrupt register 0x%x is not zero: 0x%08x\n",
> >                  reg.addr, val);
> >-        xe_mmio_write32(gt, reg, 0xffffffff);
> >-        xe_mmio_read32(gt, reg);
> >-        xe_mmio_write32(gt, reg, 0xffffffff);
> >-        xe_mmio_read32(gt, reg);
> >+        xe_mmio_write32(mmio, reg, 0xffffffff);
> >+        xe_mmio_read32(mmio, reg);
> >+        xe_mmio_write32(mmio, reg, 0xffffffff);
> >+        xe_mmio_read32(mmio, reg);
> > }
> > 
> > /*
> >  * Unmask and enable the specified interrupts.  Does not check current state,
> >  * so any bits not specified here will become masked and disabled.
> >  */
> >-static void unmask_and_enable(struct xe_gt *gt, u32 irqregs, u32 bits)
> >+static void unmask_and_enable(struct xe_tile *tile, u32 irqregs, u32 bits)
> > {
> >+        struct xe_gt *mmio = tile->primary_gt;
> >+
> >         /*
> >          * If we're just enabling an interrupt now, it shouldn't already
> >          * be raised in the IIR.
> >          */
> >-        assert_iir_is_zero(gt, IIR(irqregs));
> >+        assert_iir_is_zero(mmio, IIR(irqregs));
> > 
> >-        xe_mmio_write32(gt, IER(irqregs), bits);
> >-        xe_mmio_write32(gt, IMR(irqregs), ~bits);
> >+        xe_mmio_write32(mmio, IER(irqregs), bits);
> >+        xe_mmio_write32(mmio, IMR(irqregs), ~bits);
> > 
> >         /* Posting read */
> >-        xe_mmio_read32(gt, IMR(irqregs));
> >+        xe_mmio_read32(mmio, IMR(irqregs));
> > }
> > 
> > /* Mask and disable all interrupts. */
> >-static void mask_and_disable(struct xe_gt *gt, u32 irqregs)
> >+static void mask_and_disable(struct xe_tile *tile, u32 irqregs)
> > {
> >-        xe_mmio_write32(gt, IMR(irqregs), ~0);
> >+        struct xe_gt *mmio = tile->primary_gt;
> >+
> >+        xe_mmio_write32(mmio, IMR(irqregs), ~0);
> >         /* Posting read */
> >-        xe_mmio_read32(gt, IMR(irqregs));
> >+        xe_mmio_read32(mmio, IMR(irqregs));
> > 
> >-        xe_mmio_write32(gt, IER(irqregs), 0);
> >+        xe_mmio_write32(mmio, IER(irqregs), 0);
> > 
> >         /* IIR can theoretically queue up two events. Be paranoid. */
> >-        xe_mmio_write32(gt, IIR(irqregs), ~0);
> >-        xe_mmio_read32(gt, IIR(irqregs));
> >-        xe_mmio_write32(gt, IIR(irqregs), ~0);
> >-        xe_mmio_read32(gt, IIR(irqregs));
> >+        xe_mmio_write32(mmio, IIR(irqregs), ~0);
> >+        xe_mmio_read32(mmio, IIR(irqregs));
> >+        xe_mmio_write32(mmio, IIR(irqregs), ~0);
> >+        xe_mmio_read32(mmio, IIR(irqregs));
> > }
> > 
> >-static u32 xelp_intr_disable(struct xe_gt *gt)
> >+static u32 xelp_intr_disable(struct xe_device *xe)
> > {
> >-        xe_mmio_write32(gt, GFX_MSTR_IRQ, 0);
> >+        struct xe_gt *mmio = xe_root_mmio_gt(xe);
> >+
> >+        xe_mmio_write32(mmio, GFX_MSTR_IRQ, 0);
> > 
> >         /*
> >          * Now with master disabled, get a sample of level indications
> >@@ -88,36 +94,41 @@ static u32 xelp_intr_disable(struct xe_gt *gt)
> >          * New indications can and will light up during processing,
> >          * and will generate new interrupt after enabling master.
> >          */
> >-        return xe_mmio_read32(gt, GFX_MSTR_IRQ);
> >+        return xe_mmio_read32(mmio, GFX_MSTR_IRQ);
> > }
> > 
> > static u32
> >-gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
> >+gu_misc_irq_ack(struct xe_device *xe, const u32 master_ctl)
> > {
> >+        struct xe_gt *mmio = xe_root_mmio_gt(xe);
> >         u32 iir;
> > 
> >         if (!(master_ctl & GU_MISC_IRQ))
> >                 return 0;
> > 
> >-        iir = xe_mmio_read32(gt, IIR(GU_MISC_IRQ_OFFSET));
> >+        iir = xe_mmio_read32(mmio, IIR(GU_MISC_IRQ_OFFSET));
> >         if (likely(iir))
> >-                xe_mmio_write32(gt, IIR(GU_MISC_IRQ_OFFSET), iir);
> >+                xe_mmio_write32(mmio, IIR(GU_MISC_IRQ_OFFSET), iir);
> > 
> >         return iir;
> > }
> > 
> >-static inline void xelp_intr_enable(struct xe_gt *gt, bool stall)
> >+static inline void xelp_intr_enable(struct xe_device *xe, bool stall)
> > {
> >-        xe_mmio_write32(gt, GFX_MSTR_IRQ, MASTER_IRQ);
> >+        struct xe_gt *mmio = xe_root_mmio_gt(xe);
> >+
> >+        xe_mmio_write32(mmio, GFX_MSTR_IRQ, MASTER_IRQ);
> >         if (stall)
> >-                xe_mmio_read32(gt, GFX_MSTR_IRQ);
> >+                xe_mmio_read32(mmio, GFX_MSTR_IRQ);
> > }
> > 
> >-static void gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> >+static void gt_irq_postinstall(struct xe_tile *tile)
> > {
> >+        struct xe_device *xe = tile_to_xe(tile);
> >+        struct xe_gt *mmio = tile->primary_gt;
> >         u32 irqs, dmask, smask;
> >-        u32 ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
> >-        u32 bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
> >+        u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt, XE_ENGINE_CLASS_COMPUTE);
> >+        u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt, XE_ENGINE_CLASS_COPY);
> > 
> >         if (xe_device_guc_submission_enabled(xe)) {
> >                 irqs = GT_RENDER_USER_INTERRUPT |
> >@@ -133,57 +144,57 @@ static void gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> >         smask = irqs << 16;
> > 
> >         /* Enable RCS, BCS, VCS and VECS class interrupts. */
> >-        xe_mmio_write32(gt, RENDER_COPY_INTR_ENABLE, dmask);
> >-        xe_mmio_write32(gt, VCS_VECS_INTR_ENABLE, dmask);
> >+        xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, dmask);
> >+        xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, dmask);
> >         if (ccs_mask)
> >-                xe_mmio_write32(gt, CCS_RSVD_INTR_ENABLE, smask);
> >+                xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, smask);
> > 
> >         /* Unmask irqs on RCS, BCS, VCS and VECS engines. */
> >-        xe_mmio_write32(gt, RCS0_RSVD_INTR_MASK, ~smask);
> >-        xe_mmio_write32(gt, BCS_RSVD_INTR_MASK, ~smask);
> >+        xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, ~smask);
> >+        xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, ~smask);
> >         if (bcs_mask & (BIT(1)|BIT(2)))
> >-                xe_mmio_write32(gt, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
> >+                xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
> >         if (bcs_mask & (BIT(3)|BIT(4)))
> >-                xe_mmio_write32(gt, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
> >+                xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
> >         if (bcs_mask & (BIT(5)|BIT(6)))
> >-                xe_mmio_write32(gt, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
> >+                xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
> >         if (bcs_mask & (BIT(7)|BIT(8)))
> >-                xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
> >-        xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK, ~dmask);
> >-        xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK, ~dmask);
> >-        xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK, ~dmask);
> >+                xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
> >+        xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, ~dmask);
> >+        xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, ~dmask);
> >+        xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, ~dmask);
> >         if (ccs_mask & (BIT(0)|BIT(1)))
> >-                xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK, ~dmask);
> >+                xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~dmask);
> >         if (ccs_mask & (BIT(2)|BIT(3)))
> >-                xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK, ~dmask);
> >+                xe_mmio_write32(mmio,  CCS2_CCS3_INTR_MASK, ~dmask);
> > 
> >         /*
> >          * RPS interrupts will get enabled/disabled on demand when RPS itself
> >          * is enabled/disabled.
> >          */
> >         /* TODO: gt->pm_ier, gt->pm_imr */
> >-        xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_ENABLE, 0);
> >-        xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_MASK,  ~0);
> >+        xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
> >+        xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
> > 
> >         /* Same thing for GuC interrupts */
> >-        xe_mmio_write32(gt, GUC_SG_INTR_ENABLE, 0);
> >-        xe_mmio_write32(gt, GUC_SG_INTR_MASK,  ~0);
> >+        xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE, 0);
> >+        xe_mmio_write32(mmio, GUC_SG_INTR_MASK,  ~0);
> > }
> > 
> >-static void xelp_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> >+static void xelp_irq_postinstall(struct xe_device *xe, struct xe_tile *tile)
> > {
> >         /* TODO: PCH */
> > 
> >-        gt_irq_postinstall(xe, gt);
> >+        gt_irq_postinstall(tile);
> > 
> >-        unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
> >+        unmask_and_enable(tile, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
> > 
> >-        xelp_intr_enable(gt, true);
> >+        xelp_intr_enable(xe, true);
> > }
> > 
> > static u32
> > gt_engine_identity(struct xe_device *xe,
> >-                   struct xe_gt *gt,
> >+                   struct xe_gt *mmio,
> >                    const unsigned int bank,
> >                    const unsigned int bit)
> > {
> >@@ -192,7 +203,7 @@ gt_engine_identity(struct xe_device *xe,
> > 
> >         lockdep_assert_held(&xe->irq.lock);
> > 
> >-        xe_mmio_write32(gt, IIR_REG_SELECTOR(bank), BIT(bit));
> >+        xe_mmio_write32(mmio, IIR_REG_SELECTOR(bank), BIT(bit));
> > 
> >         /*
> >          * NB: Specs do not specify how long to spin wait,
> >@@ -200,7 +211,7 @@ gt_engine_identity(struct xe_device *xe,
> >          */
> >         timeout_ts = (local_clock() >> 10) + 100;
> >         do {
> >-                ident = xe_mmio_read32(gt, INTR_IDENTITY_REG(bank));
> >+                ident = xe_mmio_read32(mmio, INTR_IDENTITY_REG(bank));
> >         } while (!(ident & INTR_DATA_VALID) &&
> >                  !time_after32(local_clock() >> 10, timeout_ts));
> > 
> >@@ -210,7 +221,7 @@ gt_engine_identity(struct xe_device *xe,
> >                 return 0;
> >         }
> > 
> >-        xe_mmio_write32(gt, INTR_IDENTITY_REG(bank), INTR_DATA_VALID);
> >+        xe_mmio_write32(mmio, INTR_IDENTITY_REG(bank), INTR_DATA_VALID);
> > 
> >         return ident;
> > }
> >@@ -232,10 +243,32 @@ gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
> >         }
> > }
> > 
> >-static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
> >+static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
> >+                                    enum xe_engine_class class,
> >+                                    unsigned int instance)
> >+{
> >+        struct xe_device *xe = tile_to_xe(tile);
> >+
> >+        if (MEDIA_VER(xe) < 13)
> >+                return tile->primary_gt;
> >+
> >+        if (class == XE_ENGINE_CLASS_VIDEO_DECODE ||
> >+            class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
> >+                return tile->media_gt;
> >+
> >+        if (class == XE_ENGINE_CLASS_OTHER &&
> >+            instance == OTHER_MEDIA_GUC_INSTANCE)
> >+                return tile->media_gt;
> >+
> >+        return tile->primary_gt;
> >+}
> >+
> >+static void gt_irq_handler(struct xe_tile *tile,
> >                            u32 master_ctl, long unsigned int *intr_dw,
> >                            u32 *identity)
> > {
> >+        struct xe_device *xe = tile_to_xe(tile);
> >+        struct xe_gt *mmio = tile->primary_gt;
> >         unsigned int bank, bit;
> >         u16 instance, intr_vec;
> >         enum xe_engine_class class;
> >@@ -247,27 +280,26 @@ static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
> >                 if (!(master_ctl & GT_DW_IRQ(bank)))
> >                         continue;
> > 
> >-                if (!xe_gt_is_media_type(gt)) {
> >-                        intr_dw[bank] =
> >-                                xe_mmio_read32(gt, GT_INTR_DW(bank));
> >-                        for_each_set_bit(bit, intr_dw + bank, 32)
> >-                                identity[bit] = gt_engine_identity(xe, gt,
> >-                                                                   bank, bit);
> >-                        xe_mmio_write32(gt, GT_INTR_DW(bank),
> >-                                        intr_dw[bank]);
> >-                }
> >+                intr_dw[bank] = xe_mmio_read32(mmio, GT_INTR_DW(bank));
> >+                for_each_set_bit(bit, intr_dw + bank, 32)
> >+                        identity[bit] = gt_engine_identity(xe, mmio, bank, bit);
> >+                xe_mmio_write32(mmio, GT_INTR_DW(bank), intr_dw[bank]);
> > 
> >                 for_each_set_bit(bit, intr_dw + bank, 32) {
> >+                        struct xe_gt *engine_gt;
> >+
> >                         class = INTR_ENGINE_CLASS(identity[bit]);
> >                         instance = INTR_ENGINE_INSTANCE(identity[bit]);
> >                         intr_vec = INTR_ENGINE_INTR(identity[bit]);
> > 
> >+                        engine_gt = pick_engine_gt(tile, class, instance);
> >+
> >                         if (class == XE_ENGINE_CLASS_OTHER) {
> >-                                gt_other_irq_handler(gt, instance, intr_vec);
> >+                                gt_other_irq_handler(engine_gt, instance, intr_vec);
> >                                 continue;
> >                         }
> > 
> >-                        hwe = xe_gt_hw_engine(gt, class, instance, false);
> >+                        hwe = xe_gt_hw_engine(engine_gt, class, instance, false);
> >                         if (!hwe)
> >                                 continue;
> > 
> >@@ -285,24 +317,24 @@ static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
> > static irqreturn_t xelp_irq_handler(int irq, void *arg)
> > {
> >         struct xe_device *xe = arg;
> >-        struct xe_gt *gt = xe_root_mmio_gt(xe);
> >+        struct xe_tile *tile = xe_device_get_root_tile(xe);
> >         u32 master_ctl, gu_misc_iir;
> >         long unsigned int intr_dw[2];
> >         u32 identity[32];
> > 
> >-        master_ctl = xelp_intr_disable(gt);
> >+        master_ctl = xelp_intr_disable(xe);
> >         if (!master_ctl) {
> >-                xelp_intr_enable(gt, false);
> >+                xelp_intr_enable(xe, false);
> >                 return IRQ_NONE;
> >         }
> > 
> >-        gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
> >+        gt_irq_handler(tile, master_ctl, intr_dw, identity);
> > 
> >         xe_display_irq_handler(xe, master_ctl);
> > 
> >-        gu_misc_iir = gu_misc_irq_ack(gt, master_ctl);
> >+        gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
> > 
> >-        xelp_intr_enable(gt, false);
> >+        xelp_intr_enable(xe, false);
> > 
> >         xe_display_irq_enable(xe, gu_misc_iir);
> > 
> >@@ -311,38 +343,38 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
> > 
> > static u32 dg1_intr_disable(struct xe_device *xe)
> > {
> >-        struct xe_gt *gt = xe_root_mmio_gt(xe);
> >+        struct xe_gt *mmio = xe_root_mmio_gt(xe);
> >         u32 val;
> > 
> >         /* First disable interrupts */
> >-        xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, 0);
> >+        xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, 0);
> > 
> >         /* Get the indication levels and ack the master unit */
> >-        val = xe_mmio_read32(gt, DG1_MSTR_TILE_INTR);
> >+        val = xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
> >         if (unlikely(!val))
> >                 return 0;
> > 
> >-        xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, val);
> >+        xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, val);
> > 
> >         return val;
> > }
> > 
> > static void dg1_intr_enable(struct xe_device *xe, bool stall)
> > {
> >-        struct xe_gt *gt = xe_root_mmio_gt(xe);
> >+        struct xe_gt *mmio = xe_root_mmio_gt(xe);
> > 
> >-        xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
> >+        xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
> >         if (stall)
> >-                xe_mmio_read32(gt, DG1_MSTR_TILE_INTR);
> >+                xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
> > }
> > 
> >-static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> >+static void dg1_irq_postinstall(struct xe_device *xe, struct xe_tile *tile)
> > {
> >-        gt_irq_postinstall(xe, gt);
> >+        gt_irq_postinstall(tile);
> > 
> >-        unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
> >+        unmask_and_enable(tile, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
> > 
> >-        if (gt->info.id == XE_GT0)
> >+        if (tile->id == 0)
> >                 dg1_intr_enable(xe, true);
> > }
> > 
> >@@ -354,8 +386,8 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> > static irqreturn_t dg1_irq_handler(int irq, void *arg)
> > {
> >         struct xe_device *xe = arg;
> >-        struct xe_gt *gt;
> >-        u32 master_tile_ctl, master_ctl = 0, tile0_master_ctl = 0, gu_misc_iir;
> >+        struct xe_tile *tile;
> >+        u32 master_tile_ctl, master_ctl = 0, gu_misc_iir = 0;
> >         long unsigned int intr_dw[2];
> >         u32 identity[32];
> >         u8 id;
> >@@ -368,12 +400,13 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> >                 return IRQ_NONE;
> >         }
> > 
> >-        for_each_gt(gt, xe, id) {
> >-                if ((master_tile_ctl & DG1_MSTR_TILE(gt_to_tile(gt)->id)) == 0)
> >+        for_each_tile(tile, xe, id) {
> >+                struct xe_gt *mmio = tile->primary_gt;
> >+
> >+                if ((master_tile_ctl & DG1_MSTR_TILE(tile->id)) == 0)
> >                         continue;
> > 
> >-                if (!xe_gt_is_media_type(gt))
> >-                        master_ctl = xe_mmio_read32(gt, GFX_MSTR_IRQ);
> >+                master_ctl = xe_mmio_read32(mmio, GFX_MSTR_IRQ);
> > 
> >                 /*
> >                  * We might be in irq handler just when PCIe DPC is initiated
> >@@ -381,124 +414,125 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> >                  * irq as device is inaccessible.
> >                  */
> >                 if (master_ctl == REG_GENMASK(31, 0)) {
> >-                        dev_dbg(gt_to_xe(gt)->drm.dev,
> >+                        dev_dbg(tile_to_xe(tile)->drm.dev,
> >                                 "Ignore this IRQ as device might be in DPC containment.\n");
> >                         return IRQ_HANDLED;
> >                 }
> > 
> >-                if (!xe_gt_is_media_type(gt))
> >-                        xe_mmio_write32(gt, GFX_MSTR_IRQ, master_ctl);
> >-                gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
> >+                xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
> >+
> >+                gt_irq_handler(tile, master_ctl, intr_dw, identity);
> > 
> >                 /*
> >-                 * Save primary tile's master interrupt register for display
> >-                 * processing below.
> >+                 * Display interrupts (including display backlight operations
> >+                 * that get reported as Gunit GSE) would only be hooked up to
> >+                 * the primary tile.
> >                  */
> >-                if (id == 0)
> >-                        tile0_master_ctl = master_ctl;
> >+                if (id == 0) {
> >+                        xe_display_irq_handler(xe, master_ctl);
> >+                        gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
> >+                }
> >         }
> > 
> >-        xe_display_irq_handler(xe, tile0_master_ctl);
> >-
> >-        /* Gunit GSE interrupts can trigger display backlight operations */
> >-        gu_misc_iir = gu_misc_irq_ack(gt, tile0_master_ctl);
> >-
> >         dg1_intr_enable(xe, false);
> >-
> >         xe_display_irq_enable(xe, gu_misc_iir);
> > 
> >         return IRQ_HANDLED;
> > }
> > 
> >-static void gt_irq_reset(struct xe_gt *gt)
> >+static void gt_irq_reset(struct xe_tile *tile)
> > {
> >-        u32 ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
> >-        u32 bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
> >+        struct xe_gt *mmio = tile->primary_gt;
> >+
> >+        u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
> >+                                                   XE_ENGINE_CLASS_COMPUTE);
> >+        u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
> >+                                                   XE_ENGINE_CLASS_COPY);
> > 
> >         /* Disable RCS, BCS, VCS and VECS class engines. */
> >-        xe_mmio_write32(gt, RENDER_COPY_INTR_ENABLE,         0);
> >-        xe_mmio_write32(gt, VCS_VECS_INTR_ENABLE,         0);
> >+        xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, 0);
> >+        xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, 0);
> >         if (ccs_mask)
> >-                xe_mmio_write32(gt, CCS_RSVD_INTR_ENABLE, 0);
> >+                xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, 0);
> > 
> >         /* Restore masks irqs on RCS, BCS, VCS and VECS engines. */
> >-        xe_mmio_write32(gt, RCS0_RSVD_INTR_MASK,        ~0);
> >-        xe_mmio_write32(gt, BCS_RSVD_INTR_MASK,        ~0);
> >+        xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK,        ~0);
> >+        xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK,        ~0);
> >         if (bcs_mask & (BIT(1)|BIT(2)))
> >-                xe_mmio_write32(gt, XEHPC_BCS1_BCS2_INTR_MASK, ~0);
> >+                xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~0);
> >         if (bcs_mask & (BIT(3)|BIT(4)))
> >-                xe_mmio_write32(gt, XEHPC_BCS3_BCS4_INTR_MASK, ~0);
> >+                xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~0);
> >         if (bcs_mask & (BIT(5)|BIT(6)))
> >-                xe_mmio_write32(gt, XEHPC_BCS5_BCS6_INTR_MASK, ~0);
> >+                xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~0);
> >         if (bcs_mask & (BIT(7)|BIT(8)))
> >-                xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK, ~0);
> >-        xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK,        ~0);
> >-        xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK,        ~0);
> >-        xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK,        ~0);
> >+                xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~0);
> >+        xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK,        ~0);
> >+        xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK,        ~0);
> >+        xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK,        ~0);
> >         if (ccs_mask & (BIT(0)|BIT(1)))
> >-                xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK, ~0);
> >+                xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~0);
> >         if (ccs_mask & (BIT(2)|BIT(3)))
> >-                xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK, ~0);
> >+                xe_mmio_write32(mmio,  CCS2_CCS3_INTR_MASK, ~0);
> > 
> >-        xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_ENABLE, 0);
> >-        xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_MASK,  ~0);
> >-        xe_mmio_write32(gt, GUC_SG_INTR_ENABLE,         0);
> >-        xe_mmio_write32(gt, GUC_SG_INTR_MASK,                ~0);
> >+        xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
> >+        xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
> >+        xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE,         0);
> >+        xe_mmio_write32(mmio, GUC_SG_INTR_MASK,                ~0);
> > }
> > 
> >-static void xelp_irq_reset(struct xe_gt *gt)
> >+static void xelp_irq_reset(struct xe_tile *tile)
> > {
> >-        xelp_intr_disable(gt);
> >+        xelp_intr_disable(tile_to_xe(tile));
> > 
> >-        gt_irq_reset(gt);
> >+        gt_irq_reset(tile);
> > 
> >-        mask_and_disable(gt, GU_MISC_IRQ_OFFSET);
> >-        mask_and_disable(gt, PCU_IRQ_OFFSET);
> >+        mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
> >+        mask_and_disable(tile, PCU_IRQ_OFFSET);
> > }
> > 
> >-static void dg1_irq_reset(struct xe_gt *gt)
> >+static void dg1_irq_reset(struct xe_tile *tile)
> > {
> >-        if (gt->info.id == 0)
> >-                dg1_intr_disable(gt_to_xe(gt));
> >+        if (tile->id == 0)
> >+                dg1_intr_disable(tile_to_xe(tile));
> > 
> >-        gt_irq_reset(gt);
> >+        gt_irq_reset(tile);
> > 
> >-        mask_and_disable(gt, GU_MISC_IRQ_OFFSET);
> >-        mask_and_disable(gt, PCU_IRQ_OFFSET);
> >+        mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
> >+        mask_and_disable(tile, PCU_IRQ_OFFSET);
> > }
> > 
> > static void xe_irq_reset(struct xe_device *xe)
> > {
> >-        struct xe_gt *gt;
> >+        struct xe_tile *tile;
> >         u8 id;
> > 
> >-        for_each_gt(gt, xe, id) {
> >+        for_each_tile(tile, xe, id) {
> >                 if (GRAPHICS_VERx100(xe) >= 1210)
> >-                        dg1_irq_reset(gt);
> >+                        dg1_irq_reset(tile);
> >                 else
> >-                        xelp_irq_reset(gt);
> >+                        xelp_irq_reset(tile);
> >         }
> > 
> >         xe_display_irq_reset(xe);
> > }
> > 
> >-void xe_gt_irq_postinstall(struct xe_gt *gt)
> >+void xe_gt_irq_postinstall(struct xe_tile *tile)
> > {
> >-        struct xe_device *xe = gt_to_xe(gt);
> >+        struct xe_device *xe = tile_to_xe(tile);
> > 
> >         if (GRAPHICS_VERx100(xe) >= 1210)
> >-                dg1_irq_postinstall(xe, gt);
> >+                dg1_irq_postinstall(xe, tile);
> >         else
> >-                xelp_irq_postinstall(xe, gt);
> >+                xelp_irq_postinstall(xe, tile);
> > }
> > 
> > static void xe_irq_postinstall(struct xe_device *xe)
> > {
> >-        struct xe_gt *gt;
> >+        struct xe_tile *tile;
> >         u8 id;
> > 
> >-        for_each_gt(gt, xe, id)
> >-                xe_gt_irq_postinstall(gt);
> >+        for_each_tile(tile, xe, id)
> >+                xe_gt_irq_postinstall(tile);
> > 
> >         xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
> > }
> >diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
> >index 34ecf22b32d3..69113c21e1cd 100644
> >--- a/drivers/gpu/drm/xe/xe_irq.h
> >+++ b/drivers/gpu/drm/xe/xe_irq.h
> >@@ -7,10 +7,10 @@
> > #define _XE_IRQ_H_
> > 
> > struct xe_device;
> >-struct xe_gt;
> >+struct xe_tile;
> > 
> > int xe_irq_install(struct xe_device *xe);
> >-void xe_gt_irq_postinstall(struct xe_gt *gt);
> >+void xe_gt_irq_postinstall(struct xe_tile *tile);
> > void xe_irq_shutdown(struct xe_device *xe);
> > void xe_irq_suspend(struct xe_device *xe);
> > void xe_irq_resume(struct xe_device *xe);
> >-- 
> >2.40.1
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
