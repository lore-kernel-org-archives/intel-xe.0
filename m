Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82264C7EE2E
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 16:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5519710E3DE;
	Tue, 30 May 2023 16:41:43 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DCE10E3DE
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 16:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685464901; x=1717000901;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4GUskmMyoIgqDnnKUhm8HIPnMMpLTehuELx5lNTg3r8=;
 b=Hexu9B0rXmbxG6ebhZIJ2pAv2N32NEtF9mkJXHOnLw1q9OkLLiaNJ+zI
 wZlZsLyXLnkfXJGY4Ap6B9WsZySA1n4/nBGGbWuxV0LlaDW8ZZ1jz7qdJ
 2Tm8nVlfBzKny08nAIKY5kqBkbtbOgB1aNj1zhTmGK+M17+vRLLBRX5gt
 XmU6xWp2GugLv16Bc75l0TrL10RYFJszMT7TWgM+qAzhc9PflFVhdft5J
 hY+a8lOXSBj1b7OpXjn52d1Pa4oGYevtZ34wNBXacArQAX8sadTVECba6
 uY1W7Vg8xypk2MQ+92ZS8YZmypARtEYGVTYN9cZDD2MGQREFtb0KSOZn1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="344483498"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="344483498"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 09:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684047052"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="684047052"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 30 May 2023 09:41:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 09:41:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 09:41:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 09:41:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTp+sp6qkyAm/3ScN64UtDHsidCtpKRPmOLMc+S3EzJfzf4ds1IRM4mEdK/6Wrue7fCEUocsnmdEsNU70PHokqnAPcNdPcMaMmvBrWQm9KRpmemsbeFIwT5ewIyncJehNj/sdY9FfjbdBwAN4uNuLDz6dH27Ef0nTxyf98AeogzIuJ9qxPH2VwgkAXotu0ICUuB1Sl5CB8PaBHiA6nuTpSkxpX7v9WKIawvXyL8xRhoX0qEqs7xEa5daDDn4ghV8t/fq0qgmsDhFXY7TeMKw+n1I5xEY4TOALzVdIBNiLfCFG+glGGv69ID71+bz8O4q35dlbhi1NLxlPGDtX67NPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdWnJgfTkje4Yf7kyroHA5TELgEf+FOjiT4mZA76SFs=;
 b=cGWhk1h00hSW1/tt939ZCjnMaakLdV7mFqeTPmJhVN1Sc9ZSGTwHMNlPMo+yUMErOfyFfStDqviEoQYtgabM5lmQrCaZ6wZ6otunvuRY+Wgfi3gWseN8CDwO8giRexcF/uoFivwOBfDsCe4G+kGNGaocW8kL4wFrOhFjQ/ZRQjscl3mgKLj6E3XXOaWoT5AGAMbTpx3IsKli90vr9B4AmuZH6v1MlDIjWoptk24ygXO3U6FG01C4EZh0ZEGefD8JfPz92fqyG1V39vch4FUSmgjeNRcUw7J/WpGo+kaFhxNiUCJ7gmbL8YWf/tupDY6mJiL9876fznDBp6Rh2VbD8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 16:41:31 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6455.020; Tue, 30 May 2023
 16:41:31 +0000
Date: Tue, 30 May 2023 09:41:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230530164128.GR10045@mdroper-desk1.amr.corp.intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
 <20230519231827.3572452-28-matthew.d.roper@intel.com>
 <reveed2jnv7va6gqe32yflgcvg2qkd6vea3xfy6cgwspswottb@qq7crr5htie5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <reveed2jnv7va6gqe32yflgcvg2qkd6vea3xfy6cgwspswottb@qq7crr5htie5>
X-ClientProxiedBy: SJ0PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::19) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA0PR11MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c928a6-8585-4624-bb16-08db612cb8cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YUmGkisxBXgGURbpt3tlSROIG6qMvIMrHOF9Ax5do/V52Zr9S9P9WGHVrX16TlNuJ+tuw1aulh+sPIdFTiHFzziF4OO/LUsyp4FJDOqHpXcdiUTYahd+qIWJqttBJFYOUtMg2cpeQ770dezFM2bMpeMLA9zg33XE3H7DTAPl6HB8a59bOiNPodQVFdgXI+9j/RhHYyJOn3BzAHoUwB2RSPTUGJ16enMxA1YcZl8RcuePPuDFDw7DuRliqwpO5LtD7SOVzQfCygsI6n/nbbgRew4HalzfhL2kHgQndA4q8ewCdt55y6n8lmPi9GHqosmijaGHo3RC1LL5DUOke/qGZ9bvFE7V54dSGEhUDmeyRClgfrdo9YmQvl4zOj0u3lJpsIKCAlpKxMfo59PLiJbjR5bRrzjMpUEdHEnlbo1ibH2MleJy52UZ1h1mr7umLmB7OOI4/bTvy1P4SfCywW8eGtjJL8lBZWBR52Eji21lT9o9bmfpGINle5x4bgFZXlM3F12qhW3TI69NgL2ATtvoAaCkQfjjV+dR3O+MW1OP0k/xsvTYLT7urUstPn09/Vru
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199021)(6506007)(6512007)(186003)(2906002)(478600001)(1076003)(26005)(83380400001)(86362001)(41300700001)(8676002)(82960400001)(38100700002)(6486002)(6862004)(8936002)(66556008)(66476007)(5660300002)(316002)(66946007)(6666004)(33656002)(4326008)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Zz1kX65mpyM2vZRjGPFhNAeWO7nDgaAtQ/z8Q7E7BOS5SLg/SlhjEsEgdkb?=
 =?us-ascii?Q?hlNsym7zqPSfz/MvcXth7FRd16yGISW7BxFTd1yDju75+sQ4XNa9GOmyZiGd?=
 =?us-ascii?Q?jvgjbwNyFUy6j2FZEpMN4Xp/GyUWZHA4Pu106vU1EYkoweac++uzKpJzNbwQ?=
 =?us-ascii?Q?U5tbQSlXKQ3qGcpGa6Te2sE6rOBLsqLqSG185/RR6rSZPmJjSSeJggKP+2dF?=
 =?us-ascii?Q?vHx+I1EeIasXV1IGOKJU4fdgPrXSxgJeXhYxAmEQdXHqQLMwxCKvl+It5sGJ?=
 =?us-ascii?Q?Yw/n/TMtE1HCM2/XZWo3as7e6VSiuBLTzaPUci5gYf9q4zx+stasnWBsLWjk?=
 =?us-ascii?Q?kVwQftOhsW4xi5fiOAR0FMu7XZQHGjQt9nTS6fWwPd6S6sYyyENYSaeNpd7Y?=
 =?us-ascii?Q?FrL/cpMO4Mc/s4O0PlpJecW10slsm1inPQGI7QrMxHYfVO8MrTHTwMUHS174?=
 =?us-ascii?Q?0jYFDVDfUYZYcOi+Y4ZrJnuKwNkuGrRHaAySBm9mRTrjRqj1wLXgqwguLYjz?=
 =?us-ascii?Q?3NM0jVKUenJa4v1X9hJ5qqWyaCrFf8+ZjSqLJ11Uf3bJFX1chVq0Q/W/q7Vx?=
 =?us-ascii?Q?DYbdLcZg7fuYZB7bn9sfpg9qkUA4+4FCRRi+8F97WOqW6YPSCkvCa7Weff41?=
 =?us-ascii?Q?Aj+CkjjaW822zw+g/uRA8mZkhOo2HIYyeFZu+be8tVuwjV5H6nyy6ewiMiP9?=
 =?us-ascii?Q?aJrJchvWNqrDXKw/NmJfKVzMV7ueoh88dBVLW+tB8AjkldpsmoYsljDatnIk?=
 =?us-ascii?Q?S9XPf003uLF+6JOA69fCnaCO7iLyPGBJjTxRrWu6m5ATd8IELfrCN1zIjd1H?=
 =?us-ascii?Q?IXnpC2XTNCCyN5xBl48PFhyJVEIGMIODF9tGTRlkDJILapVgJowcDfDLjs7H?=
 =?us-ascii?Q?CNg61anN4dRTiqDJGNKjF57bbfGw18NG/8eCA/Orb1WcHBdBsYUP8Ds2dSmI?=
 =?us-ascii?Q?VPcGA3Q6qbFYBp3lATAF5uHMoHxpUJeq1EcGusCqLfqdTXA90T8U4SNtU8qi?=
 =?us-ascii?Q?V0DEi/2vDHdS86+7TXR7Tt3eLThn0shSbHenAiKh6zvKojNu3/WPSBQTnPec?=
 =?us-ascii?Q?PKu7/QE9rQEcj0M/BMi8FrJ+vSnoV/+DtfGr+ptY0uciUlIca8BdSdBLC0Q3?=
 =?us-ascii?Q?zSjfJYzeKXVZ/caUdetWz2TmnjNLuMWMOJKjzVawUCJzfbZWvjNSJ7O9YwGh?=
 =?us-ascii?Q?OniwZDejtpJfogEfQ7XNgO2KkX6fVOm0xiaOXB7oecTyhBIiH8igNnJ93644?=
 =?us-ascii?Q?q7S8+Iety2tN6JD41KhLUCEZQflxO8gL2AxfQHx85nj3ng+l8CykO/pe4jYc?=
 =?us-ascii?Q?WP3FWD+gMKSqABnjQh/pFix95Q1iDkGLwi3kDNyJck6L9Gk+M3fHD1aIurcA?=
 =?us-ascii?Q?kemOElz971Ho2IFBcL5Vii4WU6xuDvE8h7S7QQxI7ORoUfvuo8quWqnf1Lyj?=
 =?us-ascii?Q?eCOnU+NrHWh2FV4ZQWGvDlOhVYaABkCf9iMhpEq51OlKSzNI2P8h4adVrXra?=
 =?us-ascii?Q?WfZ5VLN1OGIkwRNngN4rZkVylSosv4+uBoZ8aQ2QPsxoCIJKPgYqRNoEhq9K?=
 =?us-ascii?Q?1ElzMfMiskHj5bfyWfGcol9xaqFZJGe8RSemJEQ9MPEkxjHaVm0054oGl7zi?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c928a6-8585-4624-bb16-08db612cb8cb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 16:41:31.2842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BA74uwBm18dizWe1SJZtOGvd9hWDtx2fYV1mj7gwPW8TxL8owIAMHJ4OKhBbtfiT1dxpJsYMR83ineHGl3FWtj89yVP/HBBJH4yvXKhOtak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 27/30] drm/xe: Allow GT looping and lookup
 on standalone media
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

On Fri, May 26, 2023 at 03:37:07PM -0700, Lucas De Marchi wrote:
> On Fri, May 19, 2023 at 04:18:24PM -0700, Matt Roper wrote:
> > Allow xe_device_get_gt() and for_each_gt() to operate as expected on
> > platforms with standalone media.
> > 
> > FIXME: We need to figure out a consistent ID scheme for GTs.  At the
> > moment our platforms either have multi-tile (i.e., PVC) or standalone
> > media (MTL) but not both.  If a future platform supports both of these
> > capabilities at the same time, how will we number the GTs of the
> > platform?   primary-primary-media-media?  primary-media-primary-media?
> > For that matter should we even still be exposing the concept of 'GT' to
> > userspace or should that switch to tile instead (and keep the hardware's
> > separation of render and media an internal implementation detail like it
> > is on i915)?  If we only expose tiles to userspace and not GTs, then we
> > may not even need per-GT ID numbers anymore.
> 
> is this something to leave on the commit or something to solve now?
> I think userspace may care about what tile the GT is located, but not
> much about the order... I think just making it a depth-first on each
> tile would be ok and we can have a tile as a gt attribute.
> 
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_device.h | 27 +++++++++++++++++++++------
> > 1 file changed, 21 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index 156c62ac0381..e0085fcd3f47 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -55,16 +55,27 @@ static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
> > 
> > static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
> > {
> > +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > 	struct xe_gt *gt;
> > 
> > -	XE_BUG_ON(gt_id > XE_MAX_TILES_PER_DEVICE);
> > +	if (drm_WARN_ON(&xe->drm, gt_id > XE_MAX_TILES_PER_DEVICE))
> 
> this condition is odd.
> 
> > +		return root_tile->primary_gt;
> > 
> > -	gt = xe->tiles[gt_id].primary_gt;
> > -	if (drm_WARN_ON(&xe->drm, !gt))
> > +	/*
> > +	 * FIXME: This only works for now because multi-tile and standalone
> > +	 * media are mutually exclusive on the platforms we have today.
> > +	 */
> > +	if (MEDIA_VER(xe) >= 13) {
> > +		gt = gt_id ? root_tile->media_gt : root_tile->primary_gt;
> > +	} else {
> > +		gt = xe->tiles[gt_id].primary_gt;
> > +	}
> 
> I would expect something like:
> 
> 	for_each_tile(...)
> 		for_each_gt(...)
> 			if (gt->id == gt_id)
> 				return gt_id
> 
> which could be optimized by reserving the gt numbers
> with XE_MAX_TILES_PER_DEVICE
> 
> #define XE_MAX_GTS_PER_TILE 2
> 
> 	tile = gt_id / XE_MAX_GTS_PER_TILE;
> 	gt = gt_id % XE_MAX_GTS_PER_TILE;
> 	return !gt ? xe->tiles[tile].primary_gt : xe->tiles[tile].media_gt;

That seems more natural, but it does cause an immediate uapi change that
I'm not sure userspace can cope with without changes on their side
(i.e., the GT IDs for PVC would become 0 and 2 instead of 0 and 1).
With this initial series I was hoping to keep things working as-is for
now while we figure out the bigger question of what we want our UAPI to
look like.  From an IOCTL point of view, it seems like userspace only
ever cares about tiles rather than GTs, although from a sysfs/debugfs
point of view there are some places where exposing both concepts is
important (e.g., GT-level power management).  Maybe GTs don't even
really need user-visible IDs as long as we come up with sensible
sysfs/debugfs interfaces?

Whatever we decide, I think there's definitely a bunch of places in the
uapi that will need to be cleaned up to work with GTs and/or tiles
appropriately.  But that might be best left to a follow-up series
specifically focused on whatever UAPI changes we settle on?

> 
> but hey... why are we not keeping a gt[] to make things simpler instead
> of calling them explicitly primary_gt/media_gt?

I used gt[] in an early version, but switched to explicit primary /
media pointers because it made GTs and tiles more distinct and made it
harder to accidentally use GT indices where tile indices should have
been used or vice-versa.


Matt

> 
> Lucas De Marchi
> 
> > +
> > +	if (!gt)
> > 		return NULL;
> > 
> > -	XE_BUG_ON(gt->info.id != gt_id);
> > -	XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
> > +	drm_WARN_ON(&xe->drm, gt->info.id != gt_id);
> > +	drm_WARN_ON(&xe->drm, gt->info.type == XE_GT_TYPE_UNINITIALIZED);
> > 
> > 	return gt;
> > }
> > @@ -98,8 +109,12 @@ static inline void xe_device_guc_submission_disable(struct xe_device *xe)
> > 	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__++)) \
> > 		for_each_if ((tile__) = &(xe__)->tiles[(id__)])
> > 
> > +/*
> > + * FIXME: This only works for now since multi-tile and standalone media
> > + * happen to be mutually exclusive.  Future platforms may change this...
> > + */
> > #define for_each_gt(gt__, xe__, id__) \
> > -	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__++)) \
> > +	for ((id__) = 0; (id__) < (xe__)->info.tile_count + (MEDIA_VER(xe__) >= 13 ? 1 : 0); (id__++)) \
> > 		for_each_if ((gt__) = xe_device_get_gt((xe__), (id__)))
> > 
> > static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
> > -- 
> > 2.40.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
