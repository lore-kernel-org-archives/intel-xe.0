Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAB6E7F129
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 21:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F1D10E436;
	Tue, 26 Sep 2023 21:04:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7A710E436
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 21:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695762295; x=1727298295;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=75Jp7h2P6lMFq0aqOjo6YAlVJz9DcKSUI8G/2jC6E0A=;
 b=MP/s9Y+E72r3RF6q29acAMQbfMJgzHtdStOxSaB9l+r+hzPKX+S1NQwn
 dVIJau6q1Hr8FiIPKHgXPNOdt/abGrcG8rJmbAZIP/+LQwmUwL2Z3vsco
 Tz4xfKd+QKhWdEVAFEr8WVVgGFacA0LsVACMYWpu7RquFPbImT0t/Q1uk
 WK70Dehy+lkCEnJZXF/w/hOer2eZT2+SujvMgiblANZ/EeVHTj2mDDc8d
 tkZ62VLOEinlqqUrnieXiuqrIh4tk3Rbjm935wme0XdoZnKDyGHXR91RD
 UsCe0MiUNynC5d1sHfgxryJ3C4TNHatgjqJ7FMYJAJPlZpqZCevjI+yYl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361048896"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="361048896"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 14:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="995924815"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="995924815"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 14:04:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 14:04:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 14:04:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 14:04:53 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 14:04:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSYOQw26bdiXDVv/uRp8b5C+XH4PTNRypCjCsbO38JYPzrE4BQ2Snz39/M+I2I0+XWTH2LXRSspPwUROLg5n8y5taYfdcWMKEEmzvN52lwPRtd6/BN6dyna9ripbbCwWbXujpYyUePu0sNvP2Qn39zUGL++3ZsFgTrxP822XA6QxUjnJ+CcW4mbAr83ceXE3lCxtVadUQ9wVHXcoEAPrqkyZ3VXqrkFzO/cPwqZ/JczOtAe2a2fnmLaqTPshpv+nd5LP4zbN2bYo/ocm9k0/zgMcVQvTWU5g1hQ5ZjYRWTdExel5O76huw6vFV0FYSJkmlcp6Y1Gs1xeW4RilB6OSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZ5ZJFPyylpJp0Ok5NfAuVXmfkDU+pWI7RxolQir4l0=;
 b=PPTINT8HZsBA9W321qUAWOgRB+GxiBKc8F72fc2cxXpspQ2DXOWVcWCFuBPob/yKCKoHMCOZgAyJCCSPqxDqcdBGmxu4UAtuBDQoZ6pAT7Qkf+2tBcHBxXZRzp3Dpt6ZkFhsDpv1yuk5ZsFN3UfHRbEuF/BAwZI/f/yiCeJYp1tc/ukBzf0Zd1ds7aO56TF3OAd53aqbgmh1trucrbkrohL/v49P1TJ+AQE1aAq7yfh5LIAQyCQ0+R5eK12kdZZPx8+fHtcY/3NWMWqHlyuCCBSj0S3I26uU4zlrKisGTP5r/sojGdiGSB9rU/tB71htAQBopihBpjBNi4Scc4EBNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Tue, 26 Sep
 2023 21:04:51 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 21:04:51 +0000
Date: Tue, 26 Sep 2023 14:04:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926210448.GW233750@mdroper-desk1.amr.corp.intel.com>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
 <20230925221049.2681491-10-lucas.demarchi@intel.com>
 <20230925234201.GF2706891@mdroper-desk1.amr.corp.intel.com>
 <qcu3mi36jezi3b4q6ytpti5voubzu6hvp2ejimcb56fszimmfz@2q7rm5ngxj54>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <qcu3mi36jezi3b4q6ytpti5voubzu6hvp2ejimcb56fszimmfz@2q7rm5ngxj54>
X-ClientProxiedBy: BYAPR11CA0077.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::18) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB6733:EE_
X-MS-Office365-Filtering-Correlation-Id: b92fe1fb-8ef6-4758-adbd-08dbbed43999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ak7JLMhtM7WsmvSVuaKov6CIlS444oObh+0UmoNBqv04i6PLAlUkSbYS7Awcfxh6p3xV+rilepDXheDNRSbrw8OViWmzG677gL3BrruO/clZZ3aXMMJKNV8lDQVQhsuYBadA3PNr6aW2f4QD+jFGVrKcxLwKBlL6eRcpfP4KyYsQrxVKHMFZvynssJyea76S6QzTYSYe9bpAs6aebOp/Rq8ocBkMxESXD9rA7KjWloTTwqXCIf8VMrBEK7Xe4W2GzbUa3iQCxTIVAFPONTmCNqSN/WmSecVIv6NiD3Or8AVHcQo6agKq+GsW+QkOXynaVseGLUfuCS1D4KShuH4BOMnDxF/7WH/gKBiexyXUvPwauLBXfT+U10YBOln/nRBuE7ncNrr2BD17T0vDV7OtAe779aouoF80Y03s5K5m9fOFV3WSU7puP9L+/v2VbmpiLTadNvLmelthnqYi86k1LiYeYOpwZ3Q9g3zBWB4fQSq/UzIFdvguzSzCy8HOkImdx0CQ1CzRu6qBHEiOszFsHoBbwEvvGuAnmgEflDNZkcCOTGBjoOuVEVoTjijRQmnu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(8936002)(8676002)(86362001)(38100700002)(4326008)(5660300002)(66476007)(66556008)(41300700001)(316002)(6636002)(6862004)(2906002)(33656002)(66946007)(83380400001)(478600001)(6512007)(82960400001)(26005)(1076003)(107886003)(6506007)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3Qqd4sOvesp6Lt7GaAhV1JE9+enctcjvQAdXauU1Q4tzwOyWy6JUNGpCk4MF?=
 =?us-ascii?Q?2b/E//WjJtmFOqli5/EkHcxmKtGv880eWefyHYUpo1jAOvaItJlBr+8Z+N5l?=
 =?us-ascii?Q?jKcOMxp8LaZjW/8qVo2eenfcv34w7MUxOiS5iyrCeuDmvS8q1NjdId093xiW?=
 =?us-ascii?Q?kXaRFp3XlztcJNB/ydwuOcu9nEpSyrYcJZvXpLosWDfGgkdez6/aRftrEA4D?=
 =?us-ascii?Q?Ltx2W6pmzmUkuRccG6RqrY+pADXukvmPDzdsoE/wgz1PX5jTDiHIrMpOh4+p?=
 =?us-ascii?Q?5zJ1ufssADr/ti+DlTSGSqp9UMIYRh3tlnFrmQ1dWtvLkgJCv7kfYI4ls1up?=
 =?us-ascii?Q?CXciOIBANYJTRvNLQlKeypFE6CIyyhbOSfN+wKYXVSRhXg9hZvklni10zS7v?=
 =?us-ascii?Q?807pCzwGaY9j+qMe1uCXnEVGM6sy7VXr4dbDEfUm08XNzOWHRx+aO5+lNo22?=
 =?us-ascii?Q?The/QCmsb4mYcGteMrXfUd7XhZ5WS+XnZbr2rtjcNJZxsZPpybLp0tbK+1//?=
 =?us-ascii?Q?pcv1twF7oJzqn2MUkCPjNbMadHPf2apy//HggZWdfhfwvO2Kgr1RJ8W59kKo?=
 =?us-ascii?Q?pGv3Gr2Gn/hAVBui0iCGQ+Gj/SX2GcqWxWLKVU9dgtPBvrmg3SQY50mwOWH7?=
 =?us-ascii?Q?9qZaJxERJmsbDD8eO4V09UiwSRTZShTaIu4y6uhk5QgW9WzG/uX4Kmk65Y2u?=
 =?us-ascii?Q?tIonNPF8GTz0E19uGoGMvXQPxY0Qi/IDlhy4qsMtWFkaNX71VpUPqgcIiwcM?=
 =?us-ascii?Q?QAmhdC593Zs/CHMMovmiZcQoJjYHxV4Q4tXZN5/8lbTgKxbjDNtEBRFk+sYL?=
 =?us-ascii?Q?HGjQ+ZmJAsa7VM2F9rMjeTWHtmW+4CkZaYSATiSAExTUFVk06pePakWkR3qD?=
 =?us-ascii?Q?xegowO+OabEa+60vd89YEpRPnUpI1lXRmnVj2q1EpKZCDTZuuvsDxe5iunbZ?=
 =?us-ascii?Q?Ae0ucZFmixrxA5/HLFUtca5RhQq77OVmKFMJTGH1yAoxNGHAW132775Elr1j?=
 =?us-ascii?Q?PYvJQ0rFsz8DGi8L1BhE6B3OghN4t6e3QrNFroCytdcQjEMDm9J6KEwWrrUb?=
 =?us-ascii?Q?YARY/MrBCLZVYNAgkRb9fjGzTGEofuNbzmSn6f2P4wvOaeH1f6qliIEWw/5R?=
 =?us-ascii?Q?1AG8dlBNaqexmJETIKbGUWVTr972uZEonDMc/t59vctVOWt9Fq95ynhf5YZS?=
 =?us-ascii?Q?Np0SSuxEmToHlJ40WU/9AUXx7gLh6R68JAyLB1aHjnI1xJc0jmbjMf/efOc+?=
 =?us-ascii?Q?seGcJi+lEGXx6oLb9K5NAL+tEWhVcV/MguhG4bruhp88EYEn5r+wBPL6Qacb?=
 =?us-ascii?Q?+5Hel64ltZLBFG4pgH1raE2OqK7cYbfrsmY5Xf8N3km+KWrTJNfWecXueJIv?=
 =?us-ascii?Q?YZAwOSvY13eDns5ZEKSJZrjDSfGW+IKS+/GBEJSGcvJ3sm1i9BDkstAUHqcb?=
 =?us-ascii?Q?gVhJbFE/zxRJBYnwtL+raTWHGBopD+QDV7jLSxMty8D2sLb41sRm0/TKyflJ?=
 =?us-ascii?Q?VDoXStTPVcbcNUZYw94YlJmM1KVbCnao2VVhphn03yPVe3foB9MbAwySHBDz?=
 =?us-ascii?Q?ePMu4JuuzLxMafNkF5yoPJAuAvfnivHlLpETLmuPyOrNoNjRf8jlHswSuoSG?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b92fe1fb-8ef6-4758-adbd-08dbbed43999
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 21:04:51.3270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kj5a8uL8HGvla1YPiS3Ps7ZGe7pqOAx17K9bMjyM0jSCgLuNdEYKEh45lALqtjrK9LVi83Qr14Mdb0KybybMAsxVZNt+WZHnIbD+/KRNDu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6733
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 9/9] fixup! drm/xe/display: Implement display
 support
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 03:48:56PM -0500, Lucas De Marchi wrote:
> On Mon, Sep 25, 2023 at 04:42:04PM -0700, Matt Roper wrote:
> > On Mon, Sep 25, 2023 at 03:10:49PM -0700, Lucas De Marchi wrote:
> > > Fix build break due to previous commit. Squash on "Implement display
> > > support" to be moved above the previous commit.
> > 
> > I know Matt Auld's series is going to come through and replace all the
> > hardcoded cache settings with the proper PAT index for whatever object
> > we're operating on, but for the time being should we at least switch the
> > hardcoding in this patch to be CACHE_WT rather than CACHE_WB?  Since
> > display is never coherent (regardless of the platform's CPU<->GT
> > coherency behavior), WB would pretty much always be the wrong thing for
> > surfaces that we're mapping into a DPT.
> 
> makes sense, but this means we are changing the behavior for all the
> platforms with display. MTL was using a hack to use index 3 and all
> the others were (implicitly) using index 0, which means WB for all the
> platforms with display.

Yeah, good point.  And now that I look at this again with fresh eyes, I
see that I mixed up CPU:WT with GPU:WT.  It's the CPU-side mapping of
scanout buffers that needs to be WT (or WC/UC although those would give
lower performance), not the GPU-side mapping in the PTEs.  I think
GPU:WB should still be fine since we'll be issuing a PIPE_CONTROL /
MI_FLUSH_DW after generating the content, before it gets flipped to a
display plane.

So disregard my earlier comments.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

This isn't the first time there's been mixups about whether WB/WT/WC/UC
terms in the code refer to the CPU or GPU side.  I know Matt Auld's
series has added some "cpu" terminology to some of the fields/defines to
help make the code more obvious; maybe these XE_CACHE_* macros also need
to pick up a "_GPU_" in their name as well at some point.


Matt

> 
> Lucas De Marchi
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/display/xe_fb_pin.c | 32 ++++++++++++++++++--------
> > >  1 file changed, 23 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > index 3422942a9951..b7a04fba3585 100644
> > > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > @@ -17,7 +17,10 @@ static void
> > >  write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
> > >  		  u32 width, u32 height, u32 src_stride, u32 dst_stride)
> > >  {
> > > +	struct xe_device *xe = xe_bo_device(bo);
> > > +	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
> > >  	u32 column, row;
> > > +
> > >  	/* TODO: Maybe rewrite so we can traverse the bo addresses sequentially,
> > >  	 * by writing dpt/ggtt in a different order?
> > >  	 */
> > > @@ -26,8 +29,10 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
> > >  		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
> > > 
> > >  		for (row = 0; row < height; row++) {
> > > -			iosys_map_wr(map, *dpt_ofs, u64,
> > > -				     xe_ggtt_pte_encode(bo, src_idx * XE_PAGE_SIZE));
> > > +			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
> > > +							      XE_CACHE_WB);
> > > +
> > > +			iosys_map_wr(map, *dpt_ofs, u64, pte);
> > >  			*dpt_ofs += 8;
> > >  			src_idx -= src_stride;
> > >  		}
> > > @@ -46,6 +51,7 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
> > >  {
> > >  	struct xe_device *xe = to_xe_device(fb->base.dev);
> > >  	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
> > > +	struct xe_ggtt *ggtt = tile0->mem.ggtt;
> > >  	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt;
> > >  	u32 dpt_size, size = bo->ttm.base.size;
> > > 
> > > @@ -76,9 +82,12 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
> > >  	if (view->type == I915_GTT_VIEW_NORMAL) {
> > >  		u32 x;
> > > 
> > > -		for (x = 0; x < size / XE_PAGE_SIZE; x++)
> > > -			iosys_map_wr(&dpt->vmap, x * 8, u64,
> > > -				     xe_ggtt_pte_encode(bo, x * XE_PAGE_SIZE));
> > > +		for (x = 0; x < size / XE_PAGE_SIZE; x++) {
> > > +			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
> > > +							      XE_CACHE_WB);
> > > +
> > > +			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
> > > +		}
> > >  	} else {
> > >  		const struct intel_rotation_info *rot_info = &view->rotated;
> > >  		u32 i, dpt_ofs = 0;
> > > @@ -107,8 +116,10 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
> > >  		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
> > > 
> > >  		for (row = 0; row < height; row++) {
> > > -			xe_ggtt_set_pte(ggtt, *ggtt_ofs,
> > > -					xe_ggtt_pte_encode(bo, src_idx * XE_PAGE_SIZE));
> > > +			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
> > > +							      XE_CACHE_WB);
> > > +
> > > +			xe_ggtt_set_pte(ggtt, *ggtt_ofs, pte);
> > >  			*ggtt_ofs += XE_PAGE_SIZE;
> > >  			src_idx -= src_stride;
> > >  		}
> > > @@ -150,8 +161,11 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
> > >  		if (ret)
> > >  			goto out_unlock;
> > > 
> > > -		for (x = 0; x < size; x += XE_PAGE_SIZE)
> > > -			xe_ggtt_set_pte(ggtt, vma->node.start + x, xe_ggtt_pte_encode(bo, x));
> > > +		for (x = 0; x < size; x += XE_PAGE_SIZE) {
> > > +			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x, XE_CACHE_WB);
> > > +
> > > +			xe_ggtt_set_pte(ggtt, vma->node.start + x, pte);
> > > +		}
> > >  	} else {
> > >  		u32 i, ggtt_ofs;
> > >  		const struct intel_rotation_info *rot_info = &view->rotated;
> > > --
> > > 2.40.1
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
