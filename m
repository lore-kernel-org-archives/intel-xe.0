Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBDCC4706C
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 22:34:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB0710E537;
	Tue,  9 Jan 2024 22:34:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED06510E537
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 22:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704839664; x=1736375664;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mIrLMNMjEUJKENpcXzE0enKPewOvBKxhndDh0EUkAFs=;
 b=DYJgaeHIpNjXoJ0nqgkcIOsi46FH3TXordHlQ+Kt+STYiqiXSS+AjEqF
 6xo+KPK6oD01p6kDcnseMS0Lg2igaHnIv3JMDeN5zIrxz/dXkC33/eVmi
 NTAmhaNNhm4DnK2ue727cs1fGZKyQLHCQDeUL+0Jj1YSXALhp4wr3bxxA
 cfKUCPRN2cWkeIfaCD+iJ3SSuURfs2GrYnwKQG4KvGPs/wxds6o3NobQb
 RQ7kf6vRzxaxYSeJWsmpEZkw8nbtJSMpMJuqiGVbcdeOnX3qbFU3LdVaY
 +MuVJ2du+4qg+Ok1PfRUv+kILYCTFRq4++ZYL5G8BpqBv4Jhf2eKVm/QG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11828425"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="11828425"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 14:34:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="781950988"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="781950988"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 14:34:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 14:34:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 14:34:22 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 14:34:22 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 14:34:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6N3XVT2Iw1q1Af62OM1jKoug/MydBVQdK9XzMPv4eVG5ywGijMjPkMp6bKnfpmrmCB8YiiQPu2zdLlUG253C/HoB5Y5RhtwiQnHZdudlLlIHRpinL7fsPdMgcLMsTsGi6VVkbxkYIIKzTEOTVHJlYEgqGTujPTrfedKzEAkAhVII0UgxqHJPMAjzeLGvjVw6BCqPLBCfJkHuoW8uzn4MbqhaUI+i4hq5FuMhsDieP/Lm14OHJ5mYs3G4psc3HEUkKK64zS49zH9bULk5Hn4wtBNGWV6ijmL9pJI7MJmTjWxGSnq4X3Nd4bCq8SoG9FDmmTWyLZ8myoTWVy85jVBpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9y7j+DqJDBwPyXRFtk1KqUoYx9maTSKpj4DuQnv7Tvg=;
 b=VP1gMX+VNzbv8VfufNrxzKw6k3SJT7QRDnZamIwUwMb2c/5WAeeox7Gtm6LpKxNg/xildpph7NZLvwhzT7XyLUNiQhntWYfXZiwUXFXLcNKWEIehDjFS9lFszHtqp4ibYoS1XqtmzYfm8pj07GhiN7TRs448uCOdg/u/GJdzuFxCdSbL2so5MHm2iA1UWscuywnD1Il2LEoN0I/yDnkSp4lWoGM/mGxU1g57DURxuscCz28gQOHFA9lfVLESbDN11vbkC5Dm3/+jqpl0spXNim8XtOMI7dU8QZeH7IViihj0zFm2kNNhqr0h0tNxQt8vTS4n70CnYQAcGuNgOnVpgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7667.namprd11.prod.outlook.com (2603:10b6:806:32a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Tue, 9 Jan
 2024 22:34:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 22:34:15 +0000
Date: Tue, 9 Jan 2024 17:34:10 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [RFC 20/20] drm/xe: Mega Kill of mem_access
Message-ID: <ZZ3J4gIZNpOIEzH7@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
 <20231228021232.2366249-21-rodrigo.vivi@intel.com>
 <5b532ac1-65bf-4ef1-9a1a-f4f328b576d1@intel.com>
 <ZZ2EtGBVFCTH7rFW@intel.com>
 <c91759f7-5115-4172-bba0-72ea0263abfc@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c91759f7-5115-4172-bba0-72ea0263abfc@intel.com>
X-ClientProxiedBy: BYAPR11CA0061.namprd11.prod.outlook.com
 (2603:10b6:a03:80::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: b0827cdf-becf-4cb3-d14d-08dc11631bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QJ9tn4C3z1T1fVil52Un9hGFJRIPw5WKEHXW9zy2LKovS2MqokMk1BL+CU2YW1DaOJE1wTIqlj1rINTUMTQOKX5AwPksDtTKfUnViaWrodsb6UHETI9aDCDc4L3uyLxmX6c/ekNB6hJsS/Y3SUVMDwKqTUWemxxnacaaOtqb+9D6lnSSCBny2kq8FGAW4gY+6kGKwf9eaug2H6y+HSYE/gc/WzUD8z+Gm7m9Zt44sECtGEW0dMU9Qdk+oWdjgYclHVr4nqaqQobYytxZNRo9I4qthwKtumW1mFVv6M5KOrkwYVPSewPi/m4eA+D8/sWKHTsIEjaxh7dEfagE9CAzWoBopE8HrxO09oumh+3b6q/EVTJ1cfNWuOotpT3cb5bUMMhvTQgrinJmGWBBOxh9bPt/lptalXEassrEIxyrJ+fA6ehHlj3RK4dPYhd/KiDxTvwVTP+hid28FgxPsnlo1gH3WlDp/0Nw+evHxdmtk+cQaqzWrzEVkmmxkAXNxza5T8v67MhvaPQsFqakJZ39TGfTNYHmB1qhf1bCuCyVfqoeYfoQ0ZyAiEU5C7Rpfkoc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(26005)(6666004)(83380400001)(6512007)(53546011)(66556008)(66476007)(6636002)(5660300002)(6862004)(44832011)(4326008)(478600001)(41300700001)(6486002)(6506007)(2616005)(2906002)(316002)(66946007)(8936002)(8676002)(37006003)(36756003)(86362001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rRcGACrzk5dh41ubPONIFlL/Af1y5e2we+gCbAKTx8wdULl5gnuuvDJtIGsn?=
 =?us-ascii?Q?i2cnhCFGjPyPmCe3AW47gfFnuLUZDiprm6MapLYqWmTCRQidwTj5xXa1Ujjm?=
 =?us-ascii?Q?Kq0xFkY5MJu1jKxTu189dsIgfG888JTSmoJIHun1Fg4darjpvygMB0sfzi+g?=
 =?us-ascii?Q?F65VvdQXaJkgvc14m+UY41/eOVZ1/GVaAR4jJT8o6O9VRj4xSAuFlfuswya3?=
 =?us-ascii?Q?2ZMsuTBnI2OnnuY4N0K/4GeaXCCGSM+GpicZEE9QTgS/gW+PvDCrKjN0LZuT?=
 =?us-ascii?Q?Xg4Lhq+4iI506nYoUtqtWVqkDmhAhmUce9O+qbGyIQQRLFLTPEtWwJASUFJi?=
 =?us-ascii?Q?yumYe1hJGel0NBsrI1i+P8XOWMckGp2cJVr1k0ksCqipM31u0TggTXIRHAhM?=
 =?us-ascii?Q?bviWCROGLsk8D2a5L5G8TeM8mJuIk3iTpqsCUeT4BRllpk0btnTyjc1xSzK1?=
 =?us-ascii?Q?eT+xUcHPgjaYmpp5XwAVmEAa/wQHoFcUdels1rKfCXDOjVFRGeXnA6tJOEQb?=
 =?us-ascii?Q?F2p1qMRRAupnuvPbMbjiD7gn7DxljecJIQzBZYtXebbtDjf0KRfUuVYmWQ5g?=
 =?us-ascii?Q?Xrg65xpmEqka/zJy0RBV03Vf4z2k4ekFJBuKKYkikrmQzu4xY0Irsi0sQLSH?=
 =?us-ascii?Q?D8VrZgeAVV5ysxmSJYy90NJflNDx+vgf0fDnOdHl0q0WS4aqwL9i1IS1SlPa?=
 =?us-ascii?Q?vmfhzJk0mIUpb6Aeqll7CpsQFaE/HvRyyq4iy9yF4yOoCWw2RQXZLJE8uonN?=
 =?us-ascii?Q?6HP356sp6IutHDRsUOJ8OcSRtzkBoT1YbTn59kTVsvj5TeVvCVCHEYq1n1O3?=
 =?us-ascii?Q?JYOlbMrhUV816hkwdz4PwYhydOSwTOBmL3whdjuFlrDFHvg+tpsOEw/DDZuq?=
 =?us-ascii?Q?ByZF2JYqn2JeyeSVZq7SG11dsENYzSX9L5kEcR0V+30n2ldZGnz4SJA+3+sA?=
 =?us-ascii?Q?wqpFel9VOFYCfNdZ1DDjQ4TlpwA7l431QjGnSXtiwso7ulqmwGiiWblYpMRL?=
 =?us-ascii?Q?lKRZh+yAum/Rdt84KALJjNRimlj4X5wLviu65Jg6IAgiYMAABIAH2YZE/tpS?=
 =?us-ascii?Q?BdtqOQfO+JJB3MV18FVO2Htzfe3kxQeAmkS+crGcmER5NpB248J7HOal+Hj9?=
 =?us-ascii?Q?lrxDU95rlUPU6ISV0+G/fkWogttFuKQaEiztA7Lqz6G46tCkQwqWEHu90gSA?=
 =?us-ascii?Q?QAGvjqLC4YZa1SOb4NyCO3qgfCenkgB0IMiUb+vE6WefR4I/k7ZwK6d8c9RJ?=
 =?us-ascii?Q?2jH88F6+9doxQxfILYwphfsS0x4Nu/pQ+wLNFK0WFmOOwBdFj+rSPzoMPlbY?=
 =?us-ascii?Q?6ml/TFr8rREP76ycsH+B5qiKh1F+7trdVrhSujn12zPk4XQvdXRuQiueb7ln?=
 =?us-ascii?Q?Lmeb755NwE4qpET13IjKMAPd27U5ddCqYSrQDFCixfWJy7LDpuJZyP94jIwt?=
 =?us-ascii?Q?rH3zgVgjy04fOtA+cVHAV5SUUIoPw2rJtoQbKRkpzSvt0Bwywro7Bk6OV28I?=
 =?us-ascii?Q?6YtRiAEgzhtJzJFeR7pkccRnS6fu8NWTPoIuOvl/TY8GfsBuEqmfeFohVH+I?=
 =?us-ascii?Q?FA2iP7BCL7vlszjHKQCT7UTVa50hHxbOKoABiZ2NGQsGKcds9hg6gNaTKWTM?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0827cdf-becf-4cb3-d14d-08dc11631bf3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 22:34:15.1088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YmY/XmAJenHwUaAP1Odhj2vW2vXCEHOwP6DSgbX4w7acIs8MsyzZSMQqEewIqvLCv8V0DNHZrV2HvyB5udZrPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7667
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 06:27:13PM +0000, Matthew Auld wrote:
> On 09/01/2024 17:39, Rodrigo Vivi wrote:
> > On Tue, Jan 09, 2024 at 11:41:35AM +0000, Matthew Auld wrote:
> > > On 28/12/2023 02:12, Rodrigo Vivi wrote:
> > > > All of these remaining cases should already be protected
> > > > by the outer bound calls of runtime_pm
> > > > 
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/display/xe_fb_pin.c |  7 +--
> > > >    drivers/gpu/drm/xe/tests/xe_bo.c       |  8 ----
> > > >    drivers/gpu/drm/xe/tests/xe_mocs.c     |  4 --
> > > >    drivers/gpu/drm/xe/xe_bo.c             |  5 ---
> > > >    drivers/gpu/drm/xe/xe_device.c         | 59 --------------------------
> > > >    drivers/gpu/drm/xe/xe_device.h         |  7 ---
> > > >    drivers/gpu/drm/xe/xe_device_types.h   |  9 ----
> > > >    drivers/gpu/drm/xe/xe_ggtt.c           |  6 ---
> > > >    drivers/gpu/drm/xe/xe_gsc.c            |  3 --
> > > >    drivers/gpu/drm/xe/xe_gt.c             | 17 --------
> > > >    drivers/gpu/drm/xe/xe_huc_debugfs.c    |  2 -
> > > >    drivers/gpu/drm/xe/xe_pat.c            | 10 -----
> > > >    drivers/gpu/drm/xe/xe_pm.c             | 27 ------------
> > > >    drivers/gpu/drm/xe/xe_query.c          |  4 --
> > > >    drivers/gpu/drm/xe/xe_tile.c           | 10 ++---
> > > >    drivers/gpu/drm/xe/xe_vm.c             |  7 ---
> > > >    16 files changed, 5 insertions(+), 180 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > > index 722c84a566073..077294ec50ece 100644
> > > > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > > @@ -190,10 +190,9 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
> > > >    	/* TODO: Consider sharing framebuffer mapping?
> > > >    	 * embed i915_vma inside intel_framebuffer
> > > >    	 */
> > > > -	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
> > > >    	ret = mutex_lock_interruptible(&ggtt->lock);
> > > >    	if (ret)
> > > > -		goto out;
> > > > +		return ret;
> > > >    	align = XE_PAGE_SIZE;
> > > >    	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
> > > > @@ -241,8 +240,6 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
> > > >    	xe_ggtt_invalidate(ggtt);
> > > >    out_unlock:
> > > >    	mutex_unlock(&ggtt->lock);
> > > > -out:
> > > > -	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
> > > >    	return ret;
> > > >    }
> > > > @@ -381,4 +378,4 @@ struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
> > > >    void intel_dpt_destroy(struct i915_address_space *vm)
> > > >    {
> > > >    	return;
> > > > -}
> > > > \ No newline at end of file
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> > > > index 412b2e7ce40cb..97b10e597f0ad 100644
> > > > --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> > > > @@ -164,8 +164,6 @@ static int ccs_test_run_device(struct xe_device *xe)
> > > >    		return 0;
> > > >    	}
> > > > -	xe_device_mem_access_get(xe);
> > > > -
> > > >    	for_each_tile(tile, xe, id) {
> > > >    		/* For igfx run only for primary tile */
> > > >    		if (!IS_DGFX(xe) && id > 0)
> > > > @@ -173,8 +171,6 @@ static int ccs_test_run_device(struct xe_device *xe)
> > > >    		ccs_test_run_tile(xe, tile, test);
> > > >    	}
> > > > -	xe_device_mem_access_put(xe);
> > > > -
> > > >    	return 0;
> > > >    }
> > > > @@ -336,13 +332,9 @@ static int evict_test_run_device(struct xe_device *xe)
> > > >    		return 0;
> > > >    	}
> > > > -	xe_device_mem_access_get(xe);
> > > > -
> > > >    	for_each_tile(tile, xe, id)
> > > >    		evict_test_run_tile(xe, tile, test);
> > > > -	xe_device_mem_access_put(xe);
> > > > -
> > > >    	return 0;
> > > >    }
> > > > diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> > > > index 7dd34f94e8094..a12e7e2bb5861 100644
> > > > --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> > > > +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> > > > @@ -45,7 +45,6 @@ static void read_l3cc_table(struct xe_gt *gt,
> > > >    	struct kunit *test = xe_cur_kunit();
> > > > -	xe_device_mem_access_get(gt_to_xe(gt));
> > > >    	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > > >    	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
> > > >    	mocs_dbg(&gt_to_xe(gt)->drm, "L3CC entries:%d\n", info->n_entries);
> > > > @@ -65,7 +64,6 @@ static void read_l3cc_table(struct xe_gt *gt,
> > > >    				   XELP_LNCFCMOCS(i).addr);
> > > >    	}
> > > >    	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > > > -	xe_device_mem_access_put(gt_to_xe(gt));
> > > >    }
> > > >    static void read_mocs_table(struct xe_gt *gt,
> > > > @@ -80,7 +78,6 @@ static void read_mocs_table(struct xe_gt *gt,
> > > >    	struct kunit *test = xe_cur_kunit();
> > > > -	xe_device_mem_access_get(gt_to_xe(gt));
> > > >    	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > > >    	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
> > > >    	mocs_dbg(&gt_to_xe(gt)->drm, "Global MOCS entries:%d\n", info->n_entries);
> > > > @@ -100,7 +97,6 @@ static void read_mocs_table(struct xe_gt *gt,
> > > >    				   XELP_GLOBAL_MOCS(i).addr);
> > > >    	}
> > > >    	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > > > -	xe_device_mem_access_put(gt_to_xe(gt));
> > > >    }
> > > >    static int mocs_kernel_test_run_device(struct xe_device *xe)
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 8e4a3b1f6b938..056c65c2675d8 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -715,7 +715,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> > > >    	xe_assert(xe, migrate);
> > > >    	trace_xe_bo_move(bo);
> > > > -	xe_device_mem_access_get(xe);
> > > >    	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
> > > >    		/*
> > > > @@ -739,7 +738,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> > > >    				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
> > > >    					ret = -EINVAL;
> > > > -					xe_device_mem_access_put(xe);
> > > >    					goto out;
> > > >    				}
> > > > @@ -757,7 +755,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> > > >    						new_mem, handle_system_ccs);
> > > >    		if (IS_ERR(fence)) {
> > > >    			ret = PTR_ERR(fence);
> > > > -			xe_device_mem_access_put(xe);
> > > >    			goto out;
> > > >    		}
> > > >    		if (!move_lacks_source) {
> > > > @@ -782,8 +779,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> > > >    		dma_fence_put(fence);
> > > >    	}
> > > > -	xe_device_mem_access_put(xe);
> > > > -
> > > >    out:
> > > >    	return ret;
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > index c1c19264a58b4..cb08a4369bb9e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > @@ -44,12 +44,6 @@
> > > >    #include "xe_wait_user_fence.h"
> > > >    #include "xe_hwmon.h"
> > > > -#ifdef CONFIG_LOCKDEP
> > > > -struct lockdep_map xe_device_mem_access_lockdep_map = {
> > > > -	.name = "xe_device_mem_access_lockdep_map"
> > > > -};
> > > > -#endif
> > > 
> > > Did you mean to drop this? IMO we should for sure keep the lockdep
> > > annotations. Otherwise it is going to be really hard to validate the locking
> > > design and have reasonable confidence that we don't have deadlocks lurking,
> > > or as new users come along sprinkling rpm get in the wrong place.
> > 
> > Well, the whole goal of this series is to actually avoid sprinkling RPM calls at all.
> 
> I mean new users are bound to appear, and they might add such calls in the
> wrong place. Lockdep would hopefully catch such things for us.

we should actually catch that during reviews and push back ;)
But I do see your point.

> 
> > We should only protect the outer bounds. I'm afraid that if we put this to the outer
> > bounds we would start getting false positives on this, no?!
> 
> What kind of false positives? With this series the sync rpm get should be
> the outermost thing for the most part, and so the locking dependences should
> be minimal. If we drop the annotations we get no help from lockdep to tell
> us if the rpm resume and suspend callbacks are grabbing locks that are
> already held when calling the sync rpm get.

yeap, you are right. I honestly didn't think so deeply there and was just
afraid of some inversions.
