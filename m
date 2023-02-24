Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B0DC7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 24 Feb 2023 18:34:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE47510ECE2;
	Fri, 24 Feb 2023 18:34:40 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E760410ECE2
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Feb 2023 18:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677263678; x=1708799678;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PPCfNYutMD2P4bDbpOcKFssB8hATAGRq5RHP8wMqU0M=;
 b=aIU/sAZb+/uak7wciUAGPM4OsEV1/RunRZPQo8DwSXeE8ZPE7AtEKKJE
 5964CooIEJ85TC3ibl/ue+zL1NIWGEkvHVAt+0U1jXtcpG3jNJZ8DJ/ag
 npYmBsaLoMuO+9NFYe+8G6wUXH6ulwXj4SEK58mcxir3GuZjMunH7gq5P
 Mat10Yx0f30QeI0lEet8aTizL2lA23W3TkUSppKiSyKS7+uCZ0hg0A5WJ
 b+ScDlIYyuvJTyg61KPy1rr2vHmkuKttDNY+7Z3cYCP7fl+phg8tfIHB2
 kBphcdqtCGjkA6tamyasE+9VZjf0oIOfalXDlFDeBVI/rqZp8qxkUEQWi Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="361054909"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="361054909"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 10:34:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="703266675"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="703266675"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 24 Feb 2023 10:34:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 10:34:15 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 10:34:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 10:34:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5WOJ5Lu/ReCgtPbzoEnM76bCk6l9AG9i2U+5dPBanK6FuyHaLtaKbhJ0Z4vGB4/GWGCffRk6fvawm5gUrxN6q+670GWeV0Dpf+bdTmFOB5fO2Y70NPylFdBNUiLvDsKZnfDrmej0tUeUCRY9s66zPbE/hQ+beVQFnJf/K6kiBvmsddva+Yd/1zvF5ixQt6dSDmlMeiYgtFRTibzWMCwKFc3oJIaRhxHDePWOSYtXwrIuMtIuu6MJ8fRNuNCSeNh6VMSPuDLkbdJW5clSxb8U92fiW/cOiDiFuqGdICxOgLXEezSjDhhj5z3oGTUEuk2w7pkSxLVVvfSD9V/fJ1dzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9W2e1f8CfNvSWCyIjUG5dGLs1+560aT2GK3I0clT8u8=;
 b=P9bJE30ukXzQq5lsbyr9X1YpS5/SlW2eqgwoCu9I7AVALunKWidoOjs1KUX0ycfoIUUGUY2x36aRfaeTf9LIIbtqaC8noUTb9evkXHcYWc8yKYrCA7TDbL+Jk1aHbqBlQvRozW2FZXJcg7xmWxlnyvL5Ygd0CHO6NolJ50+KQOX7aJ12cm5L/2QtTPkxv/lPTzDefwcbmOb1jholsVPbjP7y3KDTvb/Jzepvy+aZPrSJWIRTskwRbKFw3AvpcRzINnIWcv0/aQJDf/hfGgU4Al2nxETLpQBzZF/5hyws2sn9cYDY6nodEfHhwAdq/0zuTLiuZxJLQdJ4DMVe4jhiMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ2PR11MB7425.namprd11.prod.outlook.com (2603:10b6:a03:4c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Fri, 24 Feb
 2023 18:34:08 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 18:34:08 +0000
Date: Fri, 24 Feb 2023 10:34:04 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y/kDHFFeDZY6blAt@mdroper-desk1.amr.corp.intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-6-lucas.demarchi@intel.com>
 <Y/j8lmaf2b49It/M@mdroper-desk1.amr.corp.intel.com>
 <20230224182914.ytykgqzkp4o4ibcg@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230224182914.ytykgqzkp4o4ibcg@ldmartin-desk2.lan>
X-ClientProxiedBy: SJ0PR13CA0072.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::17) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ2PR11MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: 505801e6-6c0a-4197-414f-08db1695b6d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z61UgOvkQ1agW2AaD6xYQeWThjfFou2+80YO353NTn8ybnhupt3SQ7GRoiJt8trE9UOzUJ5Ni1AENmpjqUDfhhPzik2PFUyhHTbb2C7IIzcEPWFWxsfQCsiLdpmX5HlxQJFj1+0zlfY1iRmCcT2G7YnfOXR/ugqXU5GNOysgGSa9dPqKDDEw/RY4iT7Rf1muZBjdiaOgp39kdLD1IKB7qd1axOo8s4hIoJ8e9tYcAWqx3j9aCDanvVg9mnbpqOWt0VN+j8oRQHrPHZAskEpRYlxsDkqDVm66jEmHeZeTYlFTz4Vgel5r8Na20/bChvfVs/7msXm73j6soOKaH4wEYajnFjutQo7u0RUCjsnPj+Yi4rhlrqFF2ffpkDBcnDs6lfe6niUMT9Us+AkBWVSdBtrffW9Exoy8qI7AX0u/ey0S89eT6xw/Q9fhH1cfgsuO89eH0Y8s3IJHjdP6SU/KkYeykUFfxEkNR2r4DFMrbqG7EjjZFDKZWyWtxTjERnKg8KVsXvSeDG+hh/qU/ZRGzAoYTLFE0gBpS6rRRDY4AqR8NgEVXuoqRxJodn09riTO5luTm0zgfVQ8g9mtDRojyeNBpZwZmrXCVw299Ay2wOVDtckmzxj2nz323nmud7s1qrKw8eXkFtzsNLPhbNqL4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199018)(26005)(54906003)(316002)(41300700001)(5660300002)(6636002)(6486002)(86362001)(8936002)(4326008)(6862004)(478600001)(66476007)(66946007)(8676002)(66556008)(2906002)(82960400001)(38100700002)(6512007)(107886003)(6506007)(6666004)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3DuVJoQGIj7hLHLymtmob9SIA0SRZ70mReczB7PB+N4JTjZSGtBEm9P7cpFw?=
 =?us-ascii?Q?ZVdB2tB/QY1f0JBVhrnxVACAispDP22KJZNzKTJpk+OSTthYLx7akeqS3tOo?=
 =?us-ascii?Q?4ZEKmT8IO5Po2izah8N4CMyoAdRBuP8WumtloRZPrD5jFjMJ1fRH4j91cblM?=
 =?us-ascii?Q?+ysIpd5qpdmItBEZi2+hCNck94tcrqn3hyeVHxTuV6qElNb/OMXi3U/U6E9m?=
 =?us-ascii?Q?1tTQ3DHnO755ljTvJkHEMi2l0JLN84sX7myRzZYA/Br2+3s8mcBcoHIhRlSa?=
 =?us-ascii?Q?M0Au7AFcy6K4/aqTeWxfw2t773OBl4Du+Pi/ktsnU6LeImgIfKNQ3aU0pHgF?=
 =?us-ascii?Q?3dwHvDETmJkj7hX3jE02vcQT99uejSwQizH2+QkiAXKvpyKNKCFc6kijoATK?=
 =?us-ascii?Q?hZG3lqBpl355aWf1pahz/m2Zpzzdrkb5usSejsRx4nO6Q7GIWAsVCWs5Lu7r?=
 =?us-ascii?Q?WKpby8B6PXqEKv6zLqr1cCt1kWz3kVhlfecL8koASilWJ+Or4admyU9QNius?=
 =?us-ascii?Q?K65WDlx9XRCQ4Z7z6cSSf+k+IXhBZdWtMsVRyTGDQjywYbb0oxcROflTTxIV?=
 =?us-ascii?Q?XrsglG67NbEYSgbYiOdfSg0WDktWRLrjUEFjromY4vB79DtmbgVr66dD1F9d?=
 =?us-ascii?Q?QC7MPvBrnuv1XK1IJ3WVZy33FzmDemeB/nvxBBektEzX32lIQmRbfBTZRKrP?=
 =?us-ascii?Q?nPWXBFeBHNMLlHzbbd28PO+AjBDKQ6XmcMRaK5RaH936SYbA66b+r1xEfSpt?=
 =?us-ascii?Q?K3dzPKvQnwb0cEy64IgRL+DKxSt9dYckZXdNR/b6klgEgNp568By9R2ukN3S?=
 =?us-ascii?Q?C4EBucYwvycYtG/NIHP24lSlZbN7FGtqS/TCtYF8yDrq/P9ecUeytbMeJXD6?=
 =?us-ascii?Q?pGUaQsH0nFvydsa17/F2vANSXMX05+16mM1KANlrHumnlyKx11j40Jl/euSt?=
 =?us-ascii?Q?Ah+XPSa/P7RK4dLrFsAuZqYhMI73jMTabVeubiVGDj8/ySnJXPUA2Ga58kzx?=
 =?us-ascii?Q?jr8PUWhhD2ty6pL8/RjGhpFn67troA4IeCA6HR/esJP93S+Xef2l2DFQQLVt?=
 =?us-ascii?Q?Wxv5vay6iN0TDWHbIfLLSEecP2D7AYa3zuVatHrYq85Qwl+tZhD6adDd4eeZ?=
 =?us-ascii?Q?nU7l3pluhFmZFhTRo8HFdEN4Km/9odleTgNuIba/IwVfesU9athI8Q66x68u?=
 =?us-ascii?Q?1CxkpsZUkMWSxTCQfckYK1yls6MHBS7X9jAWckXPxvw0qmyOreMMFwKZ/Kve?=
 =?us-ascii?Q?dz9baQmgaB5jRcEcEveJI41cZJ8yamL8SrBvF5q3QDT4ty0/JFP3EkOUIQCL?=
 =?us-ascii?Q?23s/vzejZ8fo/azcIXqL8kCB0C7aUufB0aAZzWKyVp9IP/zmVrfheVGZHBsU?=
 =?us-ascii?Q?s+ZxQW2djg8P9hFopYLXcEF4HOata8CrvFkGmoGRBNSVfRqtCw7fvDjBn5TN?=
 =?us-ascii?Q?G+E0XcWC0jwwcdHVqI9vObbGUCAS0wMPqLy6aVo2R6zUD5UlLi/XgFpQcZs2?=
 =?us-ascii?Q?/ELN6ylWIg9SNXD3kGvaV0viTqKbzWrDxw/EAjmGsAt7vyiz6T0UDLnNdhOK?=
 =?us-ascii?Q?nrm76Cf0fNAZZ6Juk0VLI+Ylu81c2JPKX1dcIC8IyWNn/wj2PWmF9q2FXqNF?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 505801e6-6c0a-4197-414f-08db1695b6d3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 18:34:07.8492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLRv8ucjoGTH39+BE79wJGeyub9VJdG712zWb+kWcGqG8Dx8R6MTESacrHqXSnS7xtiWLNnjM/jjxVNnThFuF/3/jao6lTTsUnGo5aPMR2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7425
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/11] drm/xe: Remove dependency on
 intel_gt_regs.h
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 10:29:14AM -0800, Lucas De Marchi wrote:
> On Fri, Feb 24, 2023 at 10:06:14AM -0800, Matt Roper wrote:
> > On Thu, Feb 16, 2023 at 04:52:20PM -0800, Lucas De Marchi wrote:
> > > Create regs/xe_gt_regs.h file with all the registers and bit
> > > definitions used by the xe driver. Eventually the registers may be
> > > defined in a different way and since xe doesn't supported below gen12,
> > > the number of registers touched is much smaller, so create a new header.
> > > 
> > > The definitions themselves are direct copy from the
> > > gt/intel_gt_regs.h file, just sorting the registers by address.
> > > Cleaning those up and adhering to a common coding style is left for
> > > later.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/i915_reg_defs.h  |   2 +
> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h  | 287 ++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_execlist.c      |   2 +-
> > >  drivers/gpu/drm/xe/xe_force_wake.c    |   3 +-
> > >  drivers/gpu/drm/xe/xe_ggtt.c          |   2 +-
> > >  drivers/gpu/drm/xe/xe_gt.c            |   3 +-
> > >  drivers/gpu/drm/xe/xe_gt_clock.c      |   2 +-
> > >  drivers/gpu/drm/xe/xe_gt_mcr.c        |   3 +-
> > >  drivers/gpu/drm/xe/xe_guc.c           |   2 +-
> > >  drivers/gpu/drm/xe/xe_guc_ads.c       |   4 +-
> > >  drivers/gpu/drm/xe/xe_guc_pc.c        |   2 +-
> > >  drivers/gpu/drm/xe/xe_hw_engine.c     |   2 +-
> > >  drivers/gpu/drm/xe/xe_irq.c           |   2 +-
> > >  drivers/gpu/drm/xe/xe_lrc.c           |   2 +-
> > >  drivers/gpu/drm/xe/xe_mmio.c          |   2 +-
> > >  drivers/gpu/drm/xe/xe_mocs.c          |   3 +-
> > >  drivers/gpu/drm/xe/xe_reg_sr.c        |   3 +-
> > >  drivers/gpu/drm/xe/xe_reg_whitelist.c |   3 +-
> > >  drivers/gpu/drm/xe/xe_ring_ops.c      |   2 +-
> > >  drivers/gpu/drm/xe/xe_tuning.c        |   3 +-
> > >  drivers/gpu/drm/xe/xe_wa.c            |   2 +-
> > >  21 files changed, 308 insertions(+), 28 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > 
> > > diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
> > > index b5e06b6a9478..a6080c983a77 100644
> > > --- a/drivers/gpu/drm/i915/i915_reg_defs.h
> > > +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
> > > @@ -136,6 +136,8 @@ typedef struct {
> > >  	u32 reg;
> > >  } i915_mcr_reg_t;
> > > 
> > > +#define MCR_REG(offset)	((const i915_mcr_reg_t){ .reg = (offset) })
> > 
> > Should there be a corresponding removal of this definition from
> > drivers/gpu/drm/i915/gt/intel_gt_regs.h ?
> > 
> > Aside from that,
> > 
> > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> 
> good catch. I was trying not to change the i915 headers, but this
> one went unoticed while fixing the build.
> 
> I wonder if this should be a separate patch to merge in
> drm-intel-next by itself. It's harmless though and we could keep it
> in the xe branch, as long as also removing from drivers/gpu/drm/i915/gt/intel_gt_regs.h
> 
> Rodrigo / Matt, are you ok with this approach?

Either way sounds fine to me.


Matt

> 
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
