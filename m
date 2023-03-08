Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3A5C64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 22:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7937810E0B5;
	Wed,  8 Mar 2023 22:48:54 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD4510E0B5
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 22:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678315733; x=1709851733;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aLJEAYk1TZxvyn4HtcpiD7e0O+x5dgjceE/WKlkboq4=;
 b=GitUIspFsiLTdvmE9R3zw9PojxhyQ4ucOQ6jHoVLRNNwuPuH7KUB+mua
 Cz5x43NFaqy0z6JAxwfvj58SYLsRjQHZmUoj5cXMkutGnk9Rz7lGMyOFg
 3VEtbcDtZ/VwTje+PqvQdCAtiSSyA1+6f3cCtOCeGZTHnHPKlFA9EW1Tu
 XjwGqZLNmcBpWNGZXIPlUFMJnhMss+J8txS1Q//vd5XHucjAQ9pWJtngY
 CsKmP/ItO2VHuHfE1iLhB2czQkidI+sZRzP+WczkUwViO9WRsVKOoKdxv
 +4hYN4RsylTsxOMZrp3k9tKeMyMHYE8Ife5b9MvlfdVUMjXmhumIaheKr Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="336309174"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="336309174"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 14:48:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="679509624"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="679509624"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 08 Mar 2023 14:48:41 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:48:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 14:48:41 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 14:48:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H27NNxz8xSYltKl8DrbPGTCZzacN2sB4QbfQ7tluVngsOsG1szBljDgGyZkfkBevsmC5eAhNb6pW6Ez+ZFcx7hkW6yW3MmIEq9kVodkqVnDwL738hrsbje2vWejtUg4WVV2B4wO3LFnUGyBiUaINc57mVLOIgZBF8FnL01KDw0Lkzt02oX1TY1Xrx1lut6OBhX8GNngsEnPy7AoUEMnJOahpoMRhLwowkDcriMEPr6OfsVQLSYFMICb94TRxuJ68wgPWmXEbgiO33V41/mspSf/xtMODKd7mOTVCAnk5k2C0IKSk1MjQ3kLdXfPBZXadQRNbbikm026JmUzWgDpAIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgE47CqAb2/RNTGjyCYz586Hk7IBrE+4pbOCvZbbfCY=;
 b=b2NK4dyqI9kW5gSx0voFmUSa61z/7CHVaYFIFoWtaQttiTfz7c1JVzkfN32QEUq5qpA411rgA8bI2Gf/sFx+ytnOaTcqYBAjZHBa9FOWtqzNuKdXDPZK/PSLj7gtSWzJr3QK8YAtEY4J53PAdZX4sxzUqAT29m7opPm1eksgAyOKb1fWPyu45toYTkfgQjbmGUQt+OrE02GT5YU80BrB8IpixsC1BYqn/mTfmr86jIqX9QHWN3zs0fprKualmrR5iKsQRfNKk3v8UMTp5V4b1rcTjjuV2ywkJobQ1Hd8w7Ed8znRJSkq5qbPgKb3NNGKBGVk2cmRtDFS4jUqO6DUXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.17; Wed, 8 Mar 2023 22:48:39 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 22:48:39 +0000
Date: Wed, 8 Mar 2023 14:48:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308224836.GI1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-8-lucas.demarchi@intel.com>
 <20230308220707.GB1543793@mdroper-desk1.amr.corp.intel.com>
 <20230308222914.ctdmrgyu26xvmaed@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230308222914.ctdmrgyu26xvmaed@ldmartin-desk2.lan>
X-ClientProxiedBy: BYAPR01CA0066.prod.exchangelabs.com (2603:10b6:a03:94::43)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH0PR11MB5444:EE_
X-MS-Office365-Filtering-Correlation-Id: 421adb2a-31bd-4608-4c5f-08db2027420f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qplH2HRUrOI3KNFkSrt6FrfswOMBfbFtUb2FINu/DgAsdmBfX6HSo2oH0bC4pO73y6LL4Yz/L+gVvei9jK27V2mZr1h3L2g2pA4zvRj0KP8wvyKCIkgLNgHAoAnyc2fb8+NtzysuV1JtcncQcgJxuIyF9y/fYwfqWHrdpNVHKbXE663UcyxNvGpuED5xbCP3EffUkQt73BdmmkDwIH1BJ6AhBixhozG+A3qEF8qUC9HgQk+iTCohpWClsTCxtIPkixFXWl2v6DYTuocCwkOONmbQpfqZXherurD+QNRvUGjLLZqmErpHb6sutCG9XOtYz9z7VCtz0IHngbFf/58YNCFJiFjRMkwLab4MaTnDxXqHp3x446l0MyNO8UwfS5T3CUyJ/WsL78wqz9oWRvNYA+YYX2SNQ0YT/UksJcH5kx96jNZi36il+8ztMXzLfHLKJdJy98VIx+pH7l72h1LSatBFQ8YKZ9ud0SWgzST3IGJxOimyEN06ToH6/kaM0Bwerj87IMeauYGLCw5ZBok5qP4uzstSPdyRXE36W28KlHsG7ImwKJn2I3EC7uWTXqKiG8aPv6UuIh8A7+vcm12hsbrgia8dxUjjc2qaooSIKjT3KTyyzfs070kYzTxwyWwL7KJVDredFNbjQJiv6u4Yzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199018)(186003)(2906002)(38100700002)(82960400001)(1076003)(6506007)(26005)(6512007)(5660300002)(6666004)(6862004)(8936002)(6486002)(33656002)(41300700001)(86362001)(66476007)(66946007)(66556008)(4326008)(8676002)(83380400001)(478600001)(316002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lg3bJMHXW5TdLZF26KlFRxg4OhxsW3NmLupdIsiqQWjv24IkEjnXb6wukI5X?=
 =?us-ascii?Q?n6aztsZ2RWJNMpMEiDb+YicVGCDtmSgIBD5eXtC/d35YHKEodGndmPw70WJl?=
 =?us-ascii?Q?5JUVBrSMZejbgeERYUdMGE8Faqwb6dJ/3wH0QD4TQhBv2tmzOdajPoC23ux2?=
 =?us-ascii?Q?/Bofjfz/3N9C4AT6CgH1p6hFF5cr3MRtBTdtmmY1bguu37L6RTrEN4mmiRZ+?=
 =?us-ascii?Q?CyhWYj6YIvboHwslbbRmqiE6APqdWWA6/qQ7AzJ4F7BQQYRnQXPpHaIh7XDG?=
 =?us-ascii?Q?kN486OJi+C7G3SGi5kIKCSUQVdhrFmX9ZCzbBn8zHQwWBXPG7SCKYDEhmNyX?=
 =?us-ascii?Q?6bp7af0V7Wg0iqfzf2nAV9U2F9UR1GqQvaxZF3M8fB+QTJ1SlhD+AReEdyXY?=
 =?us-ascii?Q?wKVBqbL5Yf+5JRMgyMob0LXFhIK7y0vFmKzywRlYF7++6yo4QaB9HqbJ3aGy?=
 =?us-ascii?Q?EynSRM2w5qHEJPVbUA139ez+wjRddAHn8YKJGpLgMeoEn2JexiUPLio0XnBC?=
 =?us-ascii?Q?bHeYbU5iuWqb0rMZsTTAG+jD5zs4iqlvwClG+FMwOyrRNkr24gYH7NGqkl+0?=
 =?us-ascii?Q?/o1r58e3ZK4yjakdFncah9LW3aINVJaHszl3Dg6qTJVv6kEvqMrjoKfZrxT5?=
 =?us-ascii?Q?AafpKqfAyLjK8SVpV8UhIz2IIstOtShU7LSdM8KnSXQ6JwiGoxtGuCTPzrHP?=
 =?us-ascii?Q?2yee4Wxb4hnLoydA4edPDUHL6dr4TFkRaesSTJsjthszg2YvHx771N9FP6Hu?=
 =?us-ascii?Q?KViH0RoQ+0w8DxNNn67iAqoU7eiV7hWll5R30gHmHTYjmnpMr4WDwwQj5gYN?=
 =?us-ascii?Q?uXQ4V9Dxo646LcasTe3kQxDMNvtIRhmcdchpubvpzE7DW/JweFuY2so6jx8m?=
 =?us-ascii?Q?AIwYgeNppnDvEjG57hwJ2sye2sYFcUkrsNz/8QwpiEP04y+ubRXAWv9VPiDz?=
 =?us-ascii?Q?3aTGI7kK93lS7OAoD5F/YwzvjjlbslxArgOXJYCxHzczPcjSkWW3S73bOtsL?=
 =?us-ascii?Q?6e85paf/aTcktvbfRJQPN5SBOUYHd5oASfbPCULX0bjMS2lPj0q/YqryejJq?=
 =?us-ascii?Q?mgQXXzK9kcD2xnUZJxS8vMea+Mg7d3PEmarHpB3HRUSRV/A1vLTnaBRrECXl?=
 =?us-ascii?Q?eKQONaCH4xFBojBqwubDLxZKiI909At4nukW0/Z9ubMI3UF6NoowNshnOOLo?=
 =?us-ascii?Q?A9Toqhzwk9bGvdaHtJ9ZmNUDmAyHuCwaG37GOhEViGTPnRl//IxjR5WxNkIH?=
 =?us-ascii?Q?HsuTSBpXnGlthhis89xuCDnKxhAPMpyerzy7iPMxfzHyeGEDaTFZSkF0eejz?=
 =?us-ascii?Q?/UZA6vKJ6APPISX0BqeOUZzu2MC400ojEWFsT1lRZC2am2U5+42Lqen4GZui?=
 =?us-ascii?Q?e3zB9qi6i7NOq891kRj19u3Ehyk3EdkbrUXSGBnW9y7IdmXJMLv/TFPqonCo?=
 =?us-ascii?Q?G0lI6rRLSz7SK6JrQnk+Id5YvsutfNnQ/p8Qu/LuRryjjfWW8qvYe4nROUYS?=
 =?us-ascii?Q?0IMWHCZD9rwa6B/dBda6lHTv3DnFL95xThQsye6l5SvFVQir1SGTrRm2IpxA?=
 =?us-ascii?Q?WaVwEvoXFqzU7fJujtZgP6SMfIZ9r+ipSX1jeJeU3F9Th+mfVF8R/R1lLLPw?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 421adb2a-31bd-4608-4c5f-08db2027420f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 22:48:38.8732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CuNmqx3fPwtaDpLsnwJKAuVDStIRYNVCVpnhfR7JV2KR/oV5Inj/tedUB7BKqWE0U7G2JcQoy2bMCmMhQRfI8jjzvZsNTTcjkUCPZRquaBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5444
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 07/19] drm/xe/rtp: Add match helper for
 gslice fused off
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

On Wed, Mar 08, 2023 at 02:29:14PM -0800, Lucas De Marchi wrote:
> On Wed, Mar 08, 2023 at 02:07:07PM -0800, Matt Roper wrote:
> > On Tue, Mar 07, 2023 at 01:24:34AM -0800, Lucas De Marchi wrote:
> > > Add match helper to detect when the first gslice is fused off, as needed
> > > by future workarounds.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_rtp.c | 10 ++++++++++
> > >  drivers/gpu/drm/xe/xe_rtp.h | 11 +++++++++++
> > >  2 files changed, 21 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> > > index 0d2f51bb06e8..dc5a1c62d531 100644
> > > --- a/drivers/gpu/drm/xe/xe_rtp.c
> > > +++ b/drivers/gpu/drm/xe/xe_rtp.c
> > > @@ -8,6 +8,7 @@
> > >  #include <drm/xe_drm.h>
> > > 
> > >  #include "xe_gt.h"
> > > +#include "xe_gt_topology.h"
> > >  #include "xe_macros.h"
> > >  #include "xe_reg_sr.h"
> > > 
> > > @@ -170,3 +171,12 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
> > >  	return render_compute_mask &&
> > >  		hwe->engine_id == __ffs(render_compute_mask);
> > >  }
> > > +
> > > +bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
> > > +					 const struct xe_hw_engine *hwe)
> > > +{
> > > +	unsigned int dss = xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0);
> > > +	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> > 
> > As an Xe_HPC platform, PVC doesn't have a geometry pipeline, so there's
> > no such thing as a gslice here.  It looks like this would be trying to
> > check the first cslice for PVC, which is confusing.  Should we just have
> > an XE_WARN_ON() if something is trying to check gslices on a platform
> > without geometry?
> 
> humn.. I thought it would be fine to just return false like we are doing
> here, meaning it's not that the gslice is fused off, it's that this
> platform doesn't contain geometry at all. Note we are using
> gt->fuse_topo.g_dss_mask above.
> 
> This is for Wa_1308578152 on DG2.

Yeah, we're doing the right thing on DG2.  But if someone tries to use
this match function for a PVC workaround in the future, it means they've
definitely made a mistake, so we should probably warn them about that.
Silently returning cslice information when they asked for gslice may not
actually be the right thing (maybe they actually intended mslice or
bslice instead?).


Matt

> 
> Lucas De Marchi
> 
> > 
> > 
> > Matt
> > 
> > > +
> > > +	return dss >= dss_per_grp;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> > > index 433f0cbff57f..4140ef507fa0 100644
> > > --- a/drivers/gpu/drm/xe/xe_rtp.h
> > > +++ b/drivers/gpu/drm/xe/xe_rtp.h
> > > @@ -427,4 +427,15 @@ bool xe_rtp_match_even_instance(const struct xe_gt *gt,
> > >  bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
> > >  					  const struct xe_hw_engine *hwe);
> > > 
> > > +/*
> > > + * xe_rtp_match_first_gslice_fused_off - Match when first gslice is fused off
> > > + *
> > > + * @gt: GT structure
> > > + * @hwe: Engine instance
> > > + *
> > > + * Returns: true if first gslice is fused off, false otherwise.
> > > + */
> > > +bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
> > > +					 const struct xe_hw_engine *hwe);
> > > +
> > >  #endif
> > > --
> > > 2.39.0
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
