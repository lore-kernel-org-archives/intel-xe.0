Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5C9C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 16:27:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0251210E19F;
	Fri, 12 May 2023 16:27:16 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB7010E19F
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683908833; x=1715444833;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sJfSGO6XTr1bd4IgY/TFnZtASQD7qvgTFSfIozZi8Yg=;
 b=klbqOqDeoxxBQrSro0vRyEpb6rrd+Nsc05rRy82E+nSTZ9jjcZPaezhe
 /uIG7oXs0dQ0HzhsyOtyAOjI2GMA0gust9uPDb5EsuEjGQBgLt8rc/zYs
 qLfk/E53UO+lkSqRKHBvcqOWHnsUrmj3eUjsmGGHgXjL2ctHuupwtrVM9
 6Hj7AzuLyUbKhe65gphMBpz5AjwrlSC4TolwCp95xPB1UMXdvKHA0vslE
 Sil/old1arxQmMrCeawrVQQmjxkcz1UlI/ZbM/L8J/14J5EX0KrAjtp99
 U/FPJgPoCmclALLkPSSXVrbKHrm6xCk8ykkQfbfIir5ovFGus6VTE1OLG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="348319059"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="348319059"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 09:27:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="874446999"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="874446999"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 12 May 2023 09:27:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 09:27:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 09:27:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 09:27:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgDi1k4C1hO+U4RpEmqEX3yg79PZhztj8DVFsgglbqDZWUIQKESE0lOMx4IGXxavel/k1mxGh3ZA9XDYJAS/jIHEM0hjAAYp+sma44jdvNnyt6svaAvrEjwcjzeZHj4nVJNAB0W0erZoRI2WxfHHAAR3vMIymUSNiqgX3Nq1d7jOo8JxuVpipgjzY62o5QhMaep17ZE/1l9+jBPdc2h7Dsoag7DiYyX+qTEmwTTFLKMkey4RUIpXMhbUP3oHqQGGqPmvuxoVWFKXqby2kY2OrbeDEnWl8F5eZgo2PRzuF0+cu+ZJvq/TaCpfmfd6nG8IIhmYJmtRnWGdYrRAMcHaPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRaRup35JGTg5a2Io5LvuGbO7niPiXWBLNOcFjhlUuw=;
 b=E8U1yxma4zj54PONXkaoX9ewJmmfS+2it8RB0si9m0G8yGcp5kz7FYwzHQMv38bZOUjzFClrrFjA9dT3FuGT63KqSZM3gcsqeS2l1SVPiHI6S+iYUOFz2NPq1S7qSMU5qtD3TUq4y8QXOzAU9TncfG5IL6IW1vubnQImWYFBbhxVhnFSzyDkEz/fvOvX8d63fy/mheK1Wn2KT89pmAs8TvBD71c+dyxosb4AL+xsNGlYITlF8wYkeYXUdC0Gnb/3CqmAFM+4gryY2xwkuubYiQ6gp1PQHlGARn0rM996I8ZYH7/gQobvRizR3KmRrN0rl4w6lT0rNuJ8eyuVuZBB9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CO1PR11MB5187.namprd11.prod.outlook.com (2603:10b6:303:94::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.20; Fri, 12 May 2023 16:27:07 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6387.020; Fri, 12 May 2023
 16:27:06 +0000
Date: Fri, 12 May 2023 09:27:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Message-ID: <20230512162703.GC10045@mdroper-desk1.amr.corp.intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-3-matthew.d.roper@intel.com>
 <5ae567e0-62c8-5fa2-9787-0e4292ef5771@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5ae567e0-62c8-5fa2-9787-0e4292ef5771@intel.com>
X-ClientProxiedBy: SJ0PR03CA0067.namprd03.prod.outlook.com
 (2603:10b6:a03:331::12) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CO1PR11MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: 9940a274-37fa-4bf4-d2f7-08db5305b9da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oB5Z7f9ODNfVD14ducSGagAvij/F/MQ1ZRpba5KJDcEWUKwTHk16XDQvT5G6hBA/+8hfKKKZZw4mB2S+Sz0RqRwKHX/KssQ9gysp/RNiZz2bmG+MGdI/eu2dB55EGb4GoVrADgDp2k8AdBgqSoL2PGP9sT4hYY5zB8SaKlDBCFBHhNhf5Fwq0omzVoj4rir+ZgbmOXTAKEhh4y4z8Jxkmwcy1/WxuCQcAlgVmvGnDDoLqzpNWBbG40N0oVgp+NUSeIzz9myWhd8cpcCK+JfCmwecZQQmmhORsUsvjRM/4sKSXD4/BPQ9FLuKgqbFi/qVIjxsNMWJIm+hy83Ba1MS9+fzXrXkLchFeTPlnBSN5X+tLZivudokbtLMSgw1Ia2eJgj2jPSFNxZPUJ5StCO7Mp8Xouyr9+CxZclpy3OA6DkJrjJJhF8YT3m8iw06VCqd4B2KBTYzvrVxdBztHG09FaW3CREbDW3V83t5fvUVaiy0C0CIpzOnjaY5Ds1wHiE2J2Ve9G5J4gCpJ/IbEgpr7wlUBx1wK3MmNkBuEhrKIuo/nSCawTMPhdgdM/5XToDE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199021)(316002)(478600001)(86362001)(6486002)(6666004)(6636002)(66556008)(4326008)(66946007)(66476007)(83380400001)(8676002)(41300700001)(33656002)(8936002)(38100700002)(6862004)(82960400001)(26005)(2906002)(186003)(1076003)(6512007)(5660300002)(6506007)(53546011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mQWo1W2D4o4x0eeADNzh4It3qQWnuHlseSTvOb+O85NrenkRMZxP7xRTZurP?=
 =?us-ascii?Q?xLdOTJESvObb0CNnkMIcNEth6gl2AI8ZLI4s7QVO74OcV46gfrwXrrFB3VAW?=
 =?us-ascii?Q?Nttpvb6wJ7edI5+8cHuG2bdwXafG6MEOPRZvli1MY90KCaGv4503Ize93rmB?=
 =?us-ascii?Q?lAWEo2onsa2HDiBj1zYOvzEGpmvfI92V6ZoyHk759rDGWSV1vei6P4Ue3HY4?=
 =?us-ascii?Q?UHmKvTHu8fr+EZxw4sxP8y3os3DGTc7/S2pcmRYwa7OvEtaRdBZIJM2RQWQu?=
 =?us-ascii?Q?uYGPyC1CzexxFKE7lV35Nw3LswRC9CiE/fAyWjqChKkDUujQOktFd23omD+1?=
 =?us-ascii?Q?ThORdxHej3EgL3LMN0gQMbwN+B/kmxv2ePjyHKKfn0QVVm3XWduM6SGcsbhJ?=
 =?us-ascii?Q?zeMzuZw7xfjscBoWKmnxnA1UWdEbksUuPiWwxjb0fK8vnZ7MxhZSoyx7wB99?=
 =?us-ascii?Q?hJ6be0mk0YXyQmvAEgKBsE3Hm/VVFXy+I/Ra9XYl7cRpMIiGJm6YyecfXtH0?=
 =?us-ascii?Q?ENw558ZEb6ih6Brz7N+3ayVWd11ER6dSPN4xqZtZMpstiR094MCPSsajHwDT?=
 =?us-ascii?Q?gT27OUeWr6iktCiTtDsONJUCOtLtCWPuNTVHfMATkhvMhaX27dBy6LPxXgQD?=
 =?us-ascii?Q?6l3Q20rr1lzTKtZ20V1ZE71+38NyGimfR6rOfA7w08/WQcIu9GhrCB/MKZWF?=
 =?us-ascii?Q?B1hIrzD/jfaWmSJ0Vwfd19U2DPB+rJbUnSX1N0kv+pgLY6Emo1NpHqPIoT/s?=
 =?us-ascii?Q?JZg4ljfC1OTFCTJ/5yM915dmi9P+LN3BxgdqcWUXnYyI1NWjHBPSTUB9oWHY?=
 =?us-ascii?Q?SFhErCHueO3cLamun1sZ2DLUmARd8JHGkYrAuoBC0KNsTmnIJxd7cMjirjg9?=
 =?us-ascii?Q?hZYrdJRG876h8aYtQLFBX96EwVScn4y8Xip+P6aDJFeYPaCZCkEwe10Xo9Q6?=
 =?us-ascii?Q?rFtiotRpd6BOQemsr8li/+fBHhb/KHsXklHr++OXSxrAF1slsC8QnxxgaQ7+?=
 =?us-ascii?Q?ZJ7bCXt/rWxD+E3F6y6e/HpC5RmdBov/fb3v4tiQtYRuIy/bgO5feoyOWR5L?=
 =?us-ascii?Q?+mY0JyEDzfMU4+8uyFyoxIxCxDEg5Q5HgvE1ch9Yy57zQ6hQIp7RYxIHCVQ/?=
 =?us-ascii?Q?ljcMrr70EF/dzZ7edWzmTl3eCxYwJO0JGsruezGOh4AemCTLiKt9Js6CrE4A?=
 =?us-ascii?Q?fpHOnkk7Rm9BvVK9onJ5qSVmmXq4jndlH72aa3nJKROlHJzoad/MgYQT10o1?=
 =?us-ascii?Q?UeteG5s8o179FeBTClZVoO5hdunSAwIXv+iadQw2ivJVI2vRQusdQPpJ1nFD?=
 =?us-ascii?Q?jyGhhpWrrJHniuY89x3lsz1B/S7xYUe4/9XMF7ED4Zvv/4rF7f3eThDP0Asz?=
 =?us-ascii?Q?UfOBQc2tF7lpe/GMfH4vu0ZZOecd1HI4T8k2Oyzkv69kaKDjZoZvNIqBxwUE?=
 =?us-ascii?Q?5/aiVg8g3uJfSn9NP7CHhBQXyAW/FhZBKo6TsT8F8qG223RVyG21totqOTPG?=
 =?us-ascii?Q?m119hIB42GnPrRNQ3xblIyekk8OT029QBCTGbgeMBI3YlwCjtg90wuUt+6cC?=
 =?us-ascii?Q?XdR08Bmlg5zdll7Pq6W6xe7+nosg0slNjORGqsUPKhQrKuoK5QhP1l2AOazj?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9940a274-37fa-4bf4-d2f7-08db5305b9da
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 16:27:06.3778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dI5Gq7ZmiNIgyOpddOF2DEyKYipD+U48hdRKPQpTbv9TqvadYI4MTuWhMvwMshZ4wn78t1iBC6QGI2NxTkWf4CsQaMEXDhsE68X3BRx/WBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5187
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/26] drm/xe: Introduce xe_tile
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

On Fri, May 12, 2023 at 11:03:22AM +0530, Iddamsetty, Aravind wrote:
> 
> 
> On 11-05-2023 09:16, Matt Roper wrote:
> > Create a new xe_tile structure to begin separating the concept of "tile"
> > from "GT."  A tile is effectively a complete GPU, and a GT is just one
> > part of that.  On platforms like MTL, there's only a single full GPU
> > (tile) which has its IP blocks provided by two GTs.  In contrast, a
> > "multi-tile" platform like PVC is basically multiple complete GPUs
> > packed behind a single PCI device.
> > 
> > For now, just create xe_tile as a simple wrapper around xe_gt.  The
> > items in xe_gt that are truly tied to the tile rather than the GT will
> > be moved in future patches.  Support for multiple GTs per tile (i.e.,
> > the MTL standalone media case) will also be re-introduced in a future
> > patch.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.h       | 11 +++++---
> >  drivers/gpu/drm/xe/xe_device_types.h | 40 +++++++++++++++++++++++++---
> >  drivers/gpu/drm/xe/xe_gt_types.h     | 15 +++++++----
> >  drivers/gpu/drm/xe/xe_mmio.c         | 13 ++++-----
> >  drivers/gpu/drm/xe/xe_pci.c          |  5 +++-
> >  drivers/gpu/drm/xe/xe_vm.c           |  2 +-
> >  drivers/gpu/drm/xe/xe_vm_types.h     |  8 +++---
> >  7 files changed, 71 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index cbae480a2092..f7acaf51a1fc 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -48,12 +48,17 @@ static inline struct xe_file *to_xe_file(const struct drm_file *file)
> >  	return file->driver_priv;
> >  }
> >  
> > +static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
> > +{
> > +	return &xe->tiles[0];
> > +}
> > +
> >  static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
> >  {
> >  	struct xe_gt *gt;
> >  
> > -	XE_BUG_ON(gt_id > XE_MAX_GT);
> > -	gt = xe->gt + gt_id;
> > +	XE_BUG_ON(gt_id > XE_MAX_TILES_PER_DEVICE);
> 
> why do we expect the number of GTs to be less than tiles

Patch #1 of the series completely disabled media GT support for MTL
since it didn't work at all.  Easier to clear out the rubble, do a bunch
of fundamental refactoring, and then re-add the media GT support at the
end of the series once all of the prerequisite design is in place.

> > +	gt = &xe->tiles[gt_id].primary_gt;
> 
> some how this doesn't look correct to me, if GT is per tile, using GT_ID
> to reference tile might not be right.
> 
> also through this routine we always return primary_gt but the GT ID can
> correspond to other GTs as well.

So at this point in the series, there's only a single primary GT per
tile.  This code will change later as other refactors land and we
eventually re-add media GT support.

> 
> please check below.
> 
...
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index bf2c234c4f6e..e79b16d8bf7f 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -525,7 +525,10 @@ static int xe_info_init(struct xe_device *xe,
> >  	xe->info.step = xe_step_get(xe);
> >  
> >  	for (id = 0; id < xe->info.tile_count; ++id) {
> > -		gt = xe->gt + id;
> > +		xe->tiles[id].xe = xe;
> > +		xe->tiles[id].id = id;
> > +
> > +		gt = &xe->tiles[id].primary_gt;
> >  		gt->info.id = id;
> 
> since GT is per tile, shouldn't it's numbering also start from 0
> 
> Thanks,
> Aravind.

At the moment GTs are still exposed at the UAPI level, so each GT still
needs a unique ID.  At the end of this series you'd have:

 * PVC:  0 = root tile primary, 1 = remote tile primary
 * MTL:  0 = root tile primary, 1 = root tile media
 * everything else:  only has GT0

We might have platforms in the future that are both multi-tile and have
separate graphics/media GTs, so it's undecided how we'll number those
cases.  We could go primary-media-primary-media or
primary-primary-media-media.  Although there's a larger discussion here
too --- do we actually still want to expose GTs through the uapi or
should the UAPI be updated to only expose tiles (and keep the graphics
vs media separation an internal kernel driver detail that userspace
doesn't need to worry about)?  If userspace stops seeing the individual
GTs and only sees the tiles, we may be able to eliminate GT IDs
entirely.


Matt

> >  		gt->xe = xe;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 0a4becdf4675..fe6abb6ed6ca 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3347,7 +3347,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >  	struct xe_device *xe = vma->vm->xe;
> >  	struct xe_gt *gt;
> >  	u32 gt_needs_invalidate = 0;
> > -	int seqno[XE_MAX_GT];
> > +	int seqno[XE_MAX_TILES_PER_DEVICE];
> >  	u8 id;
> >  	int ret;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index fada7896867f..203ba9d946b8 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -159,7 +159,7 @@ struct xe_vm {
> >  	struct kref refcount;
> >  
> >  	/* engine used for (un)binding vma's */
> > -	struct xe_engine *eng[XE_MAX_GT];
> > +	struct xe_engine *eng[XE_MAX_TILES_PER_DEVICE];
> >  
> >  	/** Protects @rebind_list and the page-table structures */
> >  	struct dma_resv resv;
> > @@ -167,9 +167,9 @@ struct xe_vm {
> >  	u64 size;
> >  	struct rb_root vmas;
> >  
> > -	struct xe_pt *pt_root[XE_MAX_GT];
> > -	struct xe_bo *scratch_bo[XE_MAX_GT];
> > -	struct xe_pt *scratch_pt[XE_MAX_GT][XE_VM_MAX_LEVEL];
> > +	struct xe_pt *pt_root[XE_MAX_TILES_PER_DEVICE];
> > +	struct xe_bo *scratch_bo[XE_MAX_TILES_PER_DEVICE];
> > +	struct xe_pt *scratch_pt[XE_MAX_TILES_PER_DEVICE][XE_VM_MAX_LEVEL];
> >  
> >  	/** @flags: flags for this VM, statically setup a creation time */
> >  #define XE_VM_FLAGS_64K			BIT(0)

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
