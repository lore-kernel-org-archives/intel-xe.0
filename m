Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B306EE020D
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 21:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3097510E0FB;
	Wed, 13 Sep 2023 21:46:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE73010E0FB
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 21:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694641609; x=1726177609;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j7T9/v67UAuRvQu4AT69Vj7053An6ovWk2EoLQZVv2s=;
 b=iAbNEmg1aTKF2LIdmSpv4PDOjiegRqShrieYi4ABQ6nadsmOg+GyQqSK
 LRGhqb8Z/9OL3sBEM9dh7wY5/prPO8oR5/ajbBvHTji4SPsZr1ytd0UY1
 xiHVzEk4JW+axfCHnKkHaiUrzHiIWl94dTAzIlGz8TiRySXxsT5vDB0Ep
 lMgVc9qxv6mtVUEDkyHssw5VinjqVRnXGwv1p+1jvWK4+ID6KPfGQDRDg
 53gVpcgV6/FOiDsUGkJ0yeTj5ge7qMj4rviBgMUbLrzYKggwP0UYN8/f7
 Ww8l9cZT8yEidvSszEBuEpsWwKty6tJoZRwvAkTCctg/NZU1lH+s0hvSp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="465164253"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="465164253"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 14:46:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779375687"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="779375687"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 14:46:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 14:46:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 14:46:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 14:46:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 14:46:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PtUwNEmy27oIDXLIy0L8nJ1hPYAlxpuZGBqvSem/xs/pZfYeSWstQAY7XC5Z1OuKDCCJMxkx8aNW2dyMp/GNyiRySNQT1OsY2saesK2Rdg/1KezK6E/wbFR9hnUe39b0ePu2inumWbYDpavPESDaJJxwa7Oa+wPhACwlEfYdCU2LolXh794a72WICrcAqUbOenAYRYWgF4ejMVsaN7JKQAUHV1JLccffMjJZysOlfFr/kS9owVgL3L4NqG9JjaTeTRO//pwLUSXKXvBf9Wj9+R941C4R0x/9IRax6e3unti/p2aofi4jMAwD2xrST6w6AWYRfqEsgrwlV9VEqOlBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szEwEcK7UIjz71h3fVM9fYhOA7PguSUzWyptSo5hEMw=;
 b=fKeW9HlpcWFCWg8tKJSyxxFJOTWUAj9BImyjgvE9rnfGMVEdYjyZES+hyH3p4U1GtEJSWyboazgOmJSoyPq6pS3JQnDxokMEHdVuTVoqO6e6VQe+/vXNsTJFpk5Wrfhc7IM2GDAITteipuYmzF6ecPbTLMkLgPOxGZ3RHC2wXZDGoBHtuZyit9lhvwobfF7jLwgHsOhqTpObgnZ5YuYHbvoZLt5LjIMK7aal2z4h5BTjD0LYP79F+AkdX4vLlUOA4aYiUJBpPHI9zPxmfEDC5Od++8MxYhSELCIFFRXHnUd0Hrv/PxWbbuXyVQuaEr2wFTdALcbwHSgqIjdSl6cCuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BL3PR11MB6411.namprd11.prod.outlook.com (2603:10b6:208:3ba::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.31; Wed, 13 Sep 2023 21:46:33 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 21:46:33 +0000
Date: Wed, 13 Sep 2023 14:46:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230913214630.GR2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230908203302.449041-1-rodrigo.vivi@intel.com>
 <20230908203302.449041-3-rodrigo.vivi@intel.com>
 <20230913195506.GC233750@mdroper-desk1.amr.corp.intel.com>
 <ZQIl2bmrq0XgFD88@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZQIl2bmrq0XgFD88@intel.com>
X-ClientProxiedBy: BYAPR06CA0002.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::15) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BL3PR11MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: 23ffb958-ed66-48f8-a9c8-08dbb4a2e554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C8DDkUrbvOXFd7FYeVhzic0u4DDEYfg5Fiul0qU91s02rQpB49cOmVHcdttcjVNwV5SqqtCmojANPI9TB9EC0NR/NzMiCSvWyumLHQ3I+XvTLEP47Y1banWS4aJ41K+FYy5OLPerr62oLs3BrvV/Nb8baq/iKsi3cvuvTfg81PhY54embhvmbqh8xjlI6roo9ITW0+lNY6wS0S8IHvLtt9kr+qn89hFw6V5OnZ7HAPbiDORQjJEZaZFNv6dd2IDNQU8OIeTZ/gNFGGsx8ozDiKUsIJ/UkkXsofR3FoX95OJD7MtolFSPJUUHjWD0PdInvMU2KQVNJkOCTJkmlbhPA7EuZOaohY4y+hfclmSdinBM2aSY2CNweD0jyiDA88c0mZ8CWIUj86GIUp4rD87j1awNlZc1IlggCceFksKh/E+0T1Je3OzzQ+OxuPn0WF8pl76KACnQje/8CUVE14kXINVhM69Dx7u1YnIwjJ0uN7VQN8POMqfpfF7aJRY9xKjrnUUJTunN59G6B486CCs02wWdKZnB9Ne32LT1c21/IsiMeNvrBb7yrPiPH4/f/yPD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(376002)(366004)(396003)(186009)(1800799009)(451199024)(82960400001)(66556008)(1076003)(6486002)(83380400001)(38100700002)(6506007)(66946007)(66476007)(6636002)(316002)(478600001)(6512007)(26005)(41300700001)(5660300002)(66899024)(6862004)(4326008)(8676002)(8936002)(86362001)(2906002)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RBmXalYXijRkX/q7Vdmehtj8q7pV5ynXzML6cWbanHEauP3TIlaNHOBHbMja?=
 =?us-ascii?Q?9Y3Dmbew5OAa61C5v00qu5YXAtXocYzOPVZsWL4+K8GQkb44pBIsiwJA/4G0?=
 =?us-ascii?Q?+T7QB3hCx4HNARLfhgDyZ3cRhIDz72dNtoazbpz4jMgMjC0EJI6P4bN3AW2K?=
 =?us-ascii?Q?C1j6vdUEiT1nrSg0Z1EpuqZ+OSIeiuV+YyAabP7M2vubBJJZZlaHdvMWpjHj?=
 =?us-ascii?Q?Z8Frmw1sibGjUhW7uEXnjpDvW75Y1883fvn+w59f8N1QjAEQzkF50ERAacDJ?=
 =?us-ascii?Q?cq9JU5nqehEhudpGg6fYDEZB3ubULgy+vJTuyTZo4wcfJXvakK6gw0JBdtsa?=
 =?us-ascii?Q?KL+5gMeY0VL048zUN62T6SEbXjI9QL+TO4q8s3peS6oDArC5GEyBI1+xfXKT?=
 =?us-ascii?Q?LawZcTh7BCWoKsacVqiesQHiwSG1WhTwq8szAu9UNeFV4jbZVdeVGQc/gNDm?=
 =?us-ascii?Q?/mnxC8jVRr1SE4lw15iw+ENsM93H7CV31qi/JTOcq+/4sXHmQaSlW9JR7L2/?=
 =?us-ascii?Q?eFIQ1J19Lh/ybXwJWPWTXCAsNVGBCVDkEfEeEcmVTp0PmzcO/ZQIVasbRKtc?=
 =?us-ascii?Q?OS9Nw8XzEqVXdD7eHoiG2nj9aNwWN/2Fe98gTjoS8ZVJY/tHtmLp77sAqdUb?=
 =?us-ascii?Q?BL7pXPoiDFypznClKKJ7SEfzcvxyxS/ZPbi1On3te6aKAWQ4Pngh0+7ijE7/?=
 =?us-ascii?Q?LOeAzti+RLRqZ6lEAfGCwlApu8d4u4zhpxPGaJ4QrH8wr1i2VxTzeBd/pZFC?=
 =?us-ascii?Q?rWgxGakwOoSQgh3jv1rKpwfQAb9RRodmOtXvnYQYz00ZjM7tZ0IZq6m3pXi4?=
 =?us-ascii?Q?tuurDwGR7IWwtCTMM/Zst1gUvZqMjroLxII8i301G/4BkWAkho+EfWRWk9I2?=
 =?us-ascii?Q?gLQ/RM3g0LiXk4w1e15UvbxrXEYsvHVyH+Q4P14a4W3r3gubgpOgrBeQfzAZ?=
 =?us-ascii?Q?UT/W9L/nPhSIcYrB4q24EHtlnDleUBUcaXOYzXJRVRgCfEaoPgzXcgZxlax1?=
 =?us-ascii?Q?ydTr/lqzIJj8bUtYMaaZ67IyYH+R3URcL348YLw8GaSaYBk1hlpreuUldTwx?=
 =?us-ascii?Q?FXvE4sBy5Q6YmyLjP+tN6Rz/0HAU7MLGlnyTxk+VWUILae90cpF4QNjmKXPz?=
 =?us-ascii?Q?IKO1MNOXEdnTlqVpYMsm5apYFnSs60ErIz3m4q8CW/fD+xKwJrFcF0gIMSi6?=
 =?us-ascii?Q?JMJwe6Okdx8+bkNKx9OhVpJQ3JPisJhMfdTP3c9zPHFTwVp0lHg3wUBDFO/E?=
 =?us-ascii?Q?IUGz7Hve/8+SeYgRY+AG8SlP6de/oKNfk4qa0PaOzH9LogQ09kU4D9b0kiLF?=
 =?us-ascii?Q?+JtJO9bWZDdZlfGXEoeIbksl78LEBo0dn3prSADORSMngoWMnnCnKprcAOtK?=
 =?us-ascii?Q?q6k6ZErphRLDvLWIppyUBO+ddds9Tg2d2iAA6OxTKwbVGocvdDCMOPP868oC?=
 =?us-ascii?Q?otNcdBuV9Sm+5RSyqXBNKYwxmC495hIWlMS60RdBiTrz62qMa/Jyf5CuhZk8?=
 =?us-ascii?Q?LoGwmLYc3GBsoOL6u4pJ2pCo6FC245raB0L3LoUpWv9qlnqt5FCcuUMdJJOk?=
 =?us-ascii?Q?s2vrhvKv1JqN70jTOdS410CZ6xK+4L7sH/i/S7oKyVnTgeXLY7TRaGorD0L0?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ffb958-ed66-48f8-a9c8-08dbb4a2e554
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 21:46:33.0909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4Viy41+UI+hxcwVH4eIkz0RbD74l/GK447uSMy1YeaR1hsiJZ9mytT0V6Qf6363DEs8ywM4Ck6o12e6DfQ6/dKy3q4JCFjgMOh8eJaEhjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6411
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 2/5] drm/xe/uapi: Document drm_xe_query_gt.
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

On Wed, Sep 13, 2023 at 05:12:57PM -0400, Rodrigo Vivi wrote:
> On Wed, Sep 13, 2023 at 12:55:06PM -0700, Matt Roper wrote:
> > On Fri, Sep 08, 2023 at 04:32:59PM -0400, Rodrigo Vivi wrote:
> > > Split drm_xe_query_gt out of the gt list one in order to better
> > > document it. No functional change at this point.
> > > 
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >  include/uapi/drm/xe_drm.h | 65 ++++++++++++++++++++++++++-------------
> > >  1 file changed, 43 insertions(+), 22 deletions(-)
> > > 
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 51c4ef5dee6d..4bcee709bef9 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -262,6 +262,47 @@ struct drm_xe_query_config {
> > >  	__u64 info[];
> > >  };
> > >  
> > > +/**
> > > + * struct drm_xe_query_gt - describe an individual GT.
> > > + *
> > > + * To be used with drm_xe_query_gts, which will return a list with all the
> > > + * existing GT individual descriptions.
> > > + * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
> > > + * implementing graphics and/or media operations.
> > > + */
> > > +struct drm_xe_query_gt {
> > > +#define XE_QUERY_GT_TYPE_MAIN		0
> > > +#define XE_QUERY_GT_TYPE_REMOTE		1
> > 
> > I know the goal of this patch is just to add kerneldoc, but while we're
> > looking at this, one other thing we'll need to decide before finalizing
> > the uapi is whether there's any value in keeping these two separate.
> > I.e., does any userspace actually care about the difference between
> > "render GT on first tile" vs "render GT on other tiles?"  Given that GT
> > at the uapi level is pretty much only concerned with power management, I
> > can't really think of anywhere that the distinction would matter (but we
> > should still check with the userspace teams).
> 
> Cc: Jose.
> Mesa is using this, but I believe a XE_QUERY_GT_TYPE_RENDER could be
> enough. And in case we have multiple GTs then they just get the data
> from whatever RENDER if finds first and stop?
> 
> > 
> > > +#define XE_QUERY_GT_TYPE_MEDIA		2
> > > +	/** @type: GT type: Main, Remote, or Media */
> > > +	__u16 type;
> > > +	/** @instance: Instance of this GT in the GT list */
> > > +	__u16 instance;
> > > +	/** @clock_freq: A clock frequency for timestamp */
> > > +	__u32 clock_freq;
> > 
> > We may want to be more clear about what frequency this is.  I.e., is it
> > the current frequency when the query is issued?  Is it the maximum
> > frequency the GT supports?  Does this always give a meaningful value or
> > does it report 0 when nothing is executing (and we're in RC6)?
> > 
> > BTW, is this redundant with what we're exposing through sysfs?  Does
> > userspace get any benefit from grabbing frequency here rather than
> > through the sysfs interface?
> 
> oh my! When I was adding this documentation here I hated this API
> exactly because I knew it would cause confusion with the GT operating
> frequencies. This has nothing to do with those frequencies. It is a
> timestamp thing.
> 
> Check get_crystal_clock_freq() at xe_gt_clock.c.
> 
> Do you have more suggestions on how to make this documentation
> better and people not confusing this with the GT frequencies?
> 
> maybe remove the freq term and use crystal_clock? :/

Ah, okay.  Yeah, I'm not really sure how that winds up getting used, so
probably another place for Jose to weigh in on what kind of description
makes sense.

I know there's other uapi work for CPU/GPU timestamp correlation going
on, although I haven't really followed what's happening there.  Does
this relate to that in any way?  And if it does, should this information
be moving over to that query rather than staying in the general GT
query?


Matt

> 
> > 
> > > +	/** @features: Reserved for future information about GT features */
> > > +	__u64 features;
> > > +	/**
> > > +	 * @native_mem_regions: Bit maks of instances from
> > > +	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
> > > +	 * direct access.
> > > +	 */
> > > +	__u64 native_mem_regions;
> > 
> > Was the plan to eventually move these memory region masks to a
> > tile-based uapi?  Leaving them in a GT query seems awkward since the GT
> > isn't directly related to memory regions.  It seems like what userspace
> > cares about would either be tile<->mem_region location or
> > hwe<->mem_region distance.  How is userspace utilizing this information
> > today (and are they needing to jump through extra hoops due to the
> > current placement?)?
> 
> That's a good question. They get this information, but it doesn't
> look they are making a good real usage of this anyway...
> 
> Maybe we should just replace this entirely per a tile_id?
> 
> The vm_bind operation has a tile_mask there. So on the query gt here
> we maybe only inform what tile that belongs to, so the userspace
> can call the vm_bind to the right tile?
> 
> And later if they really need the distance we introduce something
> like that i915 dii for query distance?
> 
> Another thing that confuses me here is that mem_region query
> doesn't have any information about the tile-placement but
> just the vram vs system types...
> 
> Should we add the tile_id there as well?
> 
> > 
> > Also s/maks/mask/ in the kerneldoc you added here (and in the ones
> > below).
> 
> Thanks,
> Rodrigo.
> 
> > 
> > 
> > Matt
> > 
> > > +	/**
> > > +	 * @slow_mem_regions: Bit maks of instances from
> > > +	 * drm_xe_query_mem_usage that this GT can indirectly access, although
> > > +	 * they live on a different GPU/Tile.
> > > +	 */
> > > +	__u64 slow_mem_regions;
> > > +	/**
> > > +	 * @inaccessible_mem_regions: Bit maks of instances from
> > > +	 * drm_xe_query_mem_usage that is not accessible by this GT at all.
> > > +	 */
> > > +	__u64 inaccessible_mem_regions;
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[8];
> > > +};
> > > +
> > >  /**
> > >   * struct drm_xe_query_gts - describe GTs
> > >   *
> > > @@ -272,30 +313,10 @@ struct drm_xe_query_config {
> > >  struct drm_xe_query_gts {
> > >  	/** @num_gt: number of GTs returned in gts */
> > >  	__u32 num_gt;
> > > -
> > >  	/** @pad: MBZ */
> > >  	__u32 pad;
> > > -
> > > -	/**
> > > -	 * @gts: The GTs returned for this device
> > > -	 *
> > > -	 * TODO: convert drm_xe_query_gt to proper kernel-doc.
> > > -	 * TODO: Perhaps info about every mem region relative to this GT? e.g.
> > > -	 * bandwidth between this GT and remote region?
> > > -	 */
> > > -	struct drm_xe_query_gt {
> > > -#define XE_QUERY_GT_TYPE_MAIN		0
> > > -#define XE_QUERY_GT_TYPE_REMOTE		1
> > > -#define XE_QUERY_GT_TYPE_MEDIA		2
> > > -		__u16 type;
> > > -		__u16 instance;
> > > -		__u32 clock_freq;
> > > -		__u64 features;
> > > -		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> > > -		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
> > > -		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> > > -		__u64 reserved[8];
> > > -	} gts[];
> > > +	/** @gts: The GT list returned for this device */
> > > +	struct drm_xe_query_gt gts[];
> > >  };
> > >  
> > >  /**
> > > -- 
> > > 2.41.0
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
