Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AD8E7C4DA
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 16:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB1410E155;
	Wed,  4 Oct 2023 16:14:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786C810E11F
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 16:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696436061; x=1727972061;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e5lA6LbUsy2EAHzqmhZH98D4uu3cKYXYOlDHp21zXRo=;
 b=Rb3vu4fXuZkrdTHg7OD42XuwTYN/JDfw1P5EzVtw8nRYOg9K6fONWSlP
 OjRcxdYxNPEPXoGeSdTOjU8LWK/wSSPsWLnW10ufZfGA2sAzPSwVQVDBo
 1HEEy9mSELlhne+juX6yLcGmzJIXDB/leakh7hl+VthWbCJMT3aMSM6Tv
 ybM92vsaZUhE6CjbIF08+RObu2sZ/62Op3VqKaToqezEU0ctp9IT1zhm3
 f5Ib8W96rBNHeWX9iq5bTZ4kya19wE9avY8YMK/mmJmkKCnK8onMPLxxg
 DAEOcAMg/NJHw0BcoEUJqGd5eqK7xGtnrVMv7bZM7RHwS3vZRlU85g1TT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="469488366"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="469488366"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:14:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="821724904"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="821724904"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 09:13:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:13:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 09:13:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 09:13:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dty7gcw17+/p2uByGEtFA0U8dNTnTwmhT4Tcxewv87gud62Rj6pwanb6DKpUZ5RZCQbjtfjnfcL1fadX7zX5o3/1aPIuyIlwawtyuB1wsTsp1jvC2lHe2zB7pBLK3wFootxd4lD7gjR5vHEHLbEGuBrQjuV1tgPvt22qHETQpG1APah8drigYBOBl3LnUzN4zuQy4NPM6t/S4FWz2A+1f8TNdJt3qH5jo9KKAFtxQvmAccWb7u7EWRfAzObloAXLvCu/KKWCrf7mtoXXd+Cw4XUcN+7jW9eT/rYXH+CdtxgkY0wGIlRH9EAdo5SD1pt1+WpXMSegC7dYNzevUuQgjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nS9GrCpSl5ffrFg+JfhCQ5V5H2TGu1WEpRplXVfDS5s=;
 b=JaGcioXmcjGczwfL3rE9dm74yIGurRxiye39VT0aYk1JdhP1LaqksXEASvxwkQg1OkUlIf+ux0Ii1qozpT0zhFrJmfQLNs3oyucHC952iAILNmVtsXC+9sx9Aq+Ed8qEywIGttvND1ZHjnId+YZPTKPYQ+6el7ycn8bqvOp93KA6NEJvbXhawQpeUce+kXFPHey7y49Ww/PrldCp/cFKmKi+7jGU2F+PC6kq8CYTML2NpM0cK3GGCIkyI6Y3LNcAEHJwsyH+k0TkVf2xGR+xTu+tfUmHE0zDbGovsaHOpVAlQXvzIkQtMLSo+qp20iPcUclusF0K6W9xY8bUtSeflw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB5989.namprd11.prod.outlook.com (2603:10b6:8:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Wed, 4 Oct
 2023 16:13:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 16:13:40 +0000
Date: Wed, 4 Oct 2023 12:13:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZR2PL6rEhlOvqwB9@intel.com>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-15-ashutosh.dixit@intel.com>
 <ZRzNSRPlZ7mJRCTB@unerlige-ril>
 <87v8bm1jeu.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87v8bm1jeu.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS7PR11MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: 152477b0-3848-42c1-1a4a-08dbc4f4df17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1OJMLoSOB1QjLofZEeHFvV9lOAY/y12toN3vCGg4P1Tq8cRwBZPOj3Xe8u2nLH6OxJKJUQiLaTDS1xS9u/XvnB3GYJSBuoK7DNo9rajKr7TiVT78v5MfUBceaH+AHZHXoqL5+bLQkUS071XT9V28pQLRZ+iDME1zXLlXEJBFPiilH44kAh2errm54pC1uctRGrXLJZGsgsqsAKCDB3Xk9PqyN9jXTK0g0Cx6lAZHsxooCdsIYfRpYeYsqyofsY8rKeLnLHmDR1e4zEeUEEsZof6PdnaBsoSOvpTMzWMFXsKEqzsiI0C1PUBA8JYwLEAMGoevMhziH18MvhxD0dUZMn/QVaJWnYez0Fl/qX6H9tP7ysBqh7vkeqO0i/j4Mbi4m1M40n0s3+K4d6HQWXF1M4Ux5nn5l/RfZi0KktoWcgq9VL+tXtbitrKIkpJODWGA03Fa3dptkfxQcB8Gxeu5rFnbBVaMMoh7kWa9bkPxDipXkfODjTKK8JyoSLfSg0MOS2f7K6mhK+Hw8eHj/9nJiN0EZIMdjM/RG1vqK4ZjtltjchLEFkU9+GtuchdFvqrz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(2616005)(37006003)(66556008)(66476007)(66946007)(6636002)(316002)(41300700001)(6512007)(26005)(6666004)(36756003)(6506007)(478600001)(6486002)(38100700002)(82960400001)(86362001)(83380400001)(44832011)(2906002)(6862004)(4326008)(8676002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?epj2HshUtK00iaKfcG2PtrDo1Xbmy+H57p2xr5n7ZKUvOT7r5w2235BA5/tL?=
 =?us-ascii?Q?l/jcIowA4dQ0AwvvE+rlolvUfWq45jlm7til9GdiA3M7NMsGaQLVgPoUItEB?=
 =?us-ascii?Q?ge/WQLGthsj0mtCR6EqL+tnM5oMQNAjrRAgJD3L/fUQ3l3Kx+exn81sjrAVP?=
 =?us-ascii?Q?mchfu7pLs7GA2CN3o4cy1nnAtR3T4vpkcch4t59L6Ph6tEkkZGBg/ect2EL/?=
 =?us-ascii?Q?2WoV+s4uTqq4fa6AxgDiapTNo8G+2JZut+AGIyCwQtOFjghiw33ZONoLnRWe?=
 =?us-ascii?Q?ROnmnr/u7LuJGML53hws5u/RNUP552pzJiqbnkSdSpCx0FvemIBWZ8J9f8j7?=
 =?us-ascii?Q?ShXS5W53jXj/5G/VZQrq77X8F9+gVd1GwJNDPe58wglBw5CS5MmRi4RV9cMo?=
 =?us-ascii?Q?bL2vmnXpTAk9MOqRba5AHzeIgR3bLx3WIw54ef3UvEzmds5x+UEV8ML7WK3o?=
 =?us-ascii?Q?P/t6W8vQrlN7X+bHO654ykAAOHt2HEv8SPbDSDj6tb6I6NHm88pqAvtE5tAa?=
 =?us-ascii?Q?Ej3HwuFgcuYnkPu01LODhClhsHU7TArmxNAd18oIeQPCl5FjbzDz6Ansrb/a?=
 =?us-ascii?Q?tj+Sg8wpBvm6xhnpK/tzlEzvYc4I4uvCKeyZfygv2Q5DIrUcKiE2OBjuFXB7?=
 =?us-ascii?Q?BNYBvmGqqTHg2aJDuzZfthTYa5zsR4Sgjc9PFFZfhLT1eJLCPSryYeUfzrRz?=
 =?us-ascii?Q?qCngfU9qOl0Ch86E8+jZhwthQtKOw65k9Dj+h1QE6iqsGmMtmnLc4MloWVTk?=
 =?us-ascii?Q?8dP7h8T2Uykl3eGvTLg0veY1jVlkrtrGUmWJ/3CDFf2iPZgAfHXeIZDF/E4m?=
 =?us-ascii?Q?RhFNoZNQNNE1gjGr8UlOGf/IKZvq9AWGqXr8LI+m9jw5nd02LyA01aQRSpoL?=
 =?us-ascii?Q?Kg4fVkvFVoLi+uhCFFVygQkVipHGD7nmyC2FXGO6jXfRt/aXM3Am6DTPj44P?=
 =?us-ascii?Q?7BKsJl3wfT+sOgCZCEjMHrwnF/5rupLp8qb9jrrpx4yYUFCsoOwH7c5Fl27w?=
 =?us-ascii?Q?OhaHeQd3eecKhUK5IzYpSophSJHffwZkj2cdNFvkpES40U6zrumfV9THJejE?=
 =?us-ascii?Q?yCRlC5ugd9O6v1yNKxd0acXDFUNZVsvyPzqKjXF53fLmCo0mWbOrHgNNGFbq?=
 =?us-ascii?Q?9BctUF/OFdyAh1gw7EGBHyYgVc8ExcZR9BPw5RqiUzXyUmijJcUYHbp5tT0A?=
 =?us-ascii?Q?MjbaU7XPOolEu9RjpaAWTDPLEPPf9k9CFnR/FflEpUo9OnUhqJ91wFihFbXd?=
 =?us-ascii?Q?VCHSbSdXWbqkRlCwfC1yFRKyCiEdV+oUtL2ymWJJI60DqFQCWp9fJHIWA5MM?=
 =?us-ascii?Q?6XZNI6RivXj1nbTu7c7GK8FqcbPrzKlqlCAbmguInvK/s7gl0yxmX6wAotcL?=
 =?us-ascii?Q?o8XE6jTlvid/2mofVBdVnI0Zq1YP4CevAuIQg/EVlHKrU2nq6GnOiGce1lQj?=
 =?us-ascii?Q?9IRwZlm1/NxGUix693TewZeYNJUWsAcdP3SUu63JReS6zfsYcEQfnwVt6tX7?=
 =?us-ascii?Q?3HATZnEpXvUzNfAG+BiskLpnkYngCwUEYr8DogHZBU9xb+FxXqyhty550t4G?=
 =?us-ascii?Q?BRPUPpU2XnwBCXfFtom+hsTL1fwtewVllwZiP2e6rzkTG+j+4dQT5m+A7Zgu?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 152477b0-3848-42c1-1a4a-08dbc4f4df17
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 16:13:40.6766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 568p8za0lX+mA7RDuYnXW4mHa7SkQj63mUHxV9pnfPPQJQb7of9k345OzT9s8PE8U9CVvriuTdGFypzU/c17Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5989
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 14/21] drm/xe/uapi: Simplify OA configs in
 uapi
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

On Wed, Oct 04, 2023 at 08:44:57AM -0700, Dixit, Ashutosh wrote:
> On Tue, 03 Oct 2023 19:26:17 -0700, Umesh Nerlige Ramappa wrote:
> >
> 
> Hi Umesh,
> 
> > On Tue, Sep 19, 2023 at 09:10:42AM -0700, Ashutosh Dixit wrote:
> > > In OA uapi, there is no reason to have separate mux/boolean/flex registers
> > > in 'struct drm_xe_oa_config'. The kernel knows ranges of these registers
> > > and can determine which are which when needed without these being provided
> > > through the uapi. Therefore combine the three register arrays into a single
> > > one in the uapi.
> > >
> > > Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> >
> > lgtm
> > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Please do not merge this before syncing with Francois as this might conflict
hard with the big series that is getting ready in sync with UMDs as well.

> 
> Thanks, though just wondering if internally in the driver we should still
> maintain the distinction between flex/mux/b_counter registers? Or can we
> remove this distinction even internally in the driver and just maintain a
> single valid register range per platform? At least at present there seems
> to be no reason to maintain 3 different register ranges. So it will
> simplify the code a little bit if we just have a single range per
> platform (3 ranges can just be maintained in comments). Thoughts?
> 
> Thanks.
> --
> Ashutosh
> 
> > > ---
> > > drivers/gpu/drm/xe/xe_oa.c       | 60 +++++++++-----------------------
> > > drivers/gpu/drm/xe/xe_oa_types.h |  8 ++---
> > > include/uapi/drm/xe_drm.h        | 48 +++++--------------------
> > > 3 files changed, 27 insertions(+), 89 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> > > index 63db0969a86b2..19ad23b90e6ad 100644
> > > --- a/drivers/gpu/drm/xe/xe_oa.c
> > > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > > @@ -88,9 +88,7 @@ static void xe_oa_config_release(struct kref *ref)
> > >	struct xe_oa_config *oa_config =
> > >		container_of(ref, typeof(*oa_config), ref);
> > >
> > > -	kfree(oa_config->flex_regs);
> > > -	kfree(oa_config->b_counter_regs);
> > > -	kfree(oa_config->mux_regs);
> > > +	kfree(oa_config->regs);
> > >
> > >	kfree_rcu(oa_config, rcu);
> > > }
> > > @@ -970,16 +968,14 @@ static struct xe_oa_config_bo *
> > > __xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_config)
> > > {
> > >	struct xe_oa_config_bo *oa_bo;
> > > -	size_t config_length = 0;
> > > +	size_t config_length;
> > >	struct xe_bb *bb;
> > >
> > >	oa_bo = kzalloc(sizeof(*oa_bo), GFP_KERNEL);
> > >	if (!oa_bo)
> > >		return ERR_PTR(-ENOMEM);
> > >
> > > -	config_length += num_lri_dwords(oa_config->mux_regs_len);
> > > -	config_length += num_lri_dwords(oa_config->b_counter_regs_len);
> > > -	config_length += num_lri_dwords(oa_config->flex_regs_len);
> > > +	config_length = num_lri_dwords(oa_config->regs_len);
> > >	config_length++; /* MI_BATCH_BUFFER_END */
> > >	config_length = ALIGN(sizeof(u32) * config_length, XE_PAGE_SIZE) / sizeof(u32);
> > >
> > > @@ -987,9 +983,7 @@ __xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa
> > >	if (IS_ERR(bb))
> > >		goto err_free;
> > >
> > > -	write_cs_mi_lri(bb, oa_config->mux_regs, oa_config->mux_regs_len);
> > > -	write_cs_mi_lri(bb, oa_config->b_counter_regs, oa_config->b_counter_regs_len);
> > > -	write_cs_mi_lri(bb, oa_config->flex_regs, oa_config->flex_regs_len);
> > > +	write_cs_mi_lri(bb, oa_config->regs, oa_config->regs_len);
> > >
> > >	oa_bo->bb = bb;
> > >	oa_bo->oa_config = xe_oa_config_get(oa_config);
> > > @@ -1825,6 +1819,13 @@ static bool xe_oa_is_valid_mux_addr(struct xe_oa *oa, u32 addr)
> > >		return xe_oa_reg_in_range_table(addr, gen12_oa_mux_regs);
> > > }
> > >
> > > +static bool xe_oa_is_valid_config_reg_addr(struct xe_oa *oa, u32 addr)
> > > +{
> > > +	return xe_oa_is_valid_flex_addr(oa, addr) ||
> > > +		xe_oa_is_valid_b_counter_addr(oa, addr) ||
> > > +		xe_oa_is_valid_mux_addr(oa, addr);
> > > +}
> > > +
> > > static u32 mask_reg_value(u32 reg, u32 val)
> > > {
> > >	/*
> > > @@ -1852,9 +1853,6 @@ xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
> > >	int err;
> > >	u32 i;
> > >
> > > -	if (!n_regs || WARN_ON(!is_valid))
> > > -		return NULL;
> > > -
> > >	oa_regs = kmalloc_array(n_regs, sizeof(*oa_regs), GFP_KERNEL);
> > >	if (!oa_regs)
> > >		return ERR_PTR(-ENOMEM);
> > > @@ -1941,9 +1939,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
> > >	if (XE_IOCTL_DBG(oa->xe, err))
> > >		return -EFAULT;
> > >
> > > -	if ((!arg->mux_regs_ptr || !arg->n_mux_regs) &&
> > > -	    (!arg->boolean_regs_ptr || !arg->n_boolean_regs) &&
> > > -	    (!arg->flex_regs_ptr || !arg->n_flex_regs)) {
> > > +	if (!arg->regs_ptr || !arg->n_regs) {
> > >		drm_dbg(&oa->xe->drm, "No OA registers given\n");
> > >		return -EINVAL;
> > >	}
> > > @@ -1964,38 +1960,16 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
> > >	/* Last character in oa_config->uuid will be 0 because oa_config is kzalloc */
> > >	memcpy(oa_config->uuid, arg->uuid, sizeof(arg->uuid));
> > >
> > > -	oa_config->mux_regs_len = arg->n_mux_regs;
> > > -	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_mux_addr,
> > > -				u64_to_user_ptr(arg->mux_regs_ptr),
> > > -				arg->n_mux_regs);
> > > +	oa_config->regs_len = arg->n_regs;
> > > +	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_config_reg_addr,
> > > +				u64_to_user_ptr(arg->regs_ptr),
> > > +				arg->n_regs);
> > >	if (IS_ERR(regs)) {
> > >		drm_dbg(&oa->xe->drm, "Failed to create OA config for mux_regs\n");
> > >		err = PTR_ERR(regs);
> > >		goto reg_err;
> > >	}
> > > -	oa_config->mux_regs = regs;
> > > -
> > > -	oa_config->b_counter_regs_len = arg->n_boolean_regs;
> > > -	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_b_counter_addr,
> > > -				u64_to_user_ptr(arg->boolean_regs_ptr),
> > > -				arg->n_boolean_regs);
> > > -	if (IS_ERR(regs)) {
> > > -		drm_dbg(&oa->xe->drm, "Failed to create OA config for b_counter_regs\n");
> > > -		err = PTR_ERR(regs);
> > > -		goto reg_err;
> > > -	}
> > > -	oa_config->b_counter_regs = regs;
> > > -
> > > -	oa_config->flex_regs_len = arg->n_flex_regs;
> > > -	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_flex_addr,
> > > -				u64_to_user_ptr(arg->flex_regs_ptr),
> > > -				arg->n_flex_regs);
> > > -	if (IS_ERR(regs)) {
> > > -		drm_dbg(&oa->xe->drm, "Failed to create OA config for flex_regs\n");
> > > -		err = PTR_ERR(regs);
> > > -		goto reg_err;
> > > -	}
> > > -	oa_config->flex_regs = regs;
> > > +	oa_config->regs = regs;
> > >
> > >	err = mutex_lock_interruptible(&oa->metrics_lock);
> > >	if (err)
> > > diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> > > index 126692718c888..ac8b23695cc6e 100644
> > > --- a/drivers/gpu/drm/xe/xe_oa_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> > > @@ -52,12 +52,8 @@ struct xe_oa_config {
> > >	char uuid[UUID_STRING_LEN + 1];
> > >	int id;
> > >
> > > -	const struct xe_oa_reg *mux_regs;
> > > -	u32 mux_regs_len;
> > > -	const struct xe_oa_reg *b_counter_regs;
> > > -	u32 b_counter_regs_len;
> > > -	const struct xe_oa_reg *flex_regs;
> > > -	u32 flex_regs_len;
> > > +	const struct xe_oa_reg *regs;
> > > +	u32 regs_len;
> > >
> > >	struct attribute_group sysfs_metric;
> > >	struct attribute *attrs[2];
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index bf0af9474e7ee..fe873dc63fc5a 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -1292,52 +1292,20 @@ struct drm_xe_oa_config {
> > >	char uuid[36];
> > >
> > >	/**
> > > -	 * @n_mux_regs:
> > > +	 * @n_regs:
> > >	 *
> > > -	 * Number of mux regs in &mux_regs_ptr.
> > > +	 * Number of regs in @regs_ptr.
> > >	 */
> > > -	__u32 n_mux_regs;
> > > +	__u32 n_regs;
> > >
> > >	/**
> > > -	 * @n_boolean_regs:
> > > +	 * @regs_ptr:
> > >	 *
> > > -	 * Number of boolean regs in &boolean_regs_ptr.
> > > +	 * Pointer to tuples of u32 values (register address, value) for OA
> > > +	 * config registers. Expected length of buffer is (2 * sizeof(u32) *
> > > +	 * @n_regs).
> > >	 */
> > > -	__u32 n_boolean_regs;
> > > -
> > > -	/**
> > > -	 * @n_flex_regs:
> > > -	 *
> > > -	 * Number of flex regs in &flex_regs_ptr.
> > > -	 */
> > > -	__u32 n_flex_regs;
> > > -
> > > -	/**
> > > -	 * @mux_regs_ptr:
> > > -	 *
> > > -	 * Pointer to tuples of u32 values (register address, value) for mux
> > > -	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
> > > -	 * &n_mux_regs).
> > > -	 */
> > > -	__u64 mux_regs_ptr;
> > > -
> > > -	/**
> > > -	 * @boolean_regs_ptr:
> > > -	 *
> > > -	 * Pointer to tuples of u32 values (register address, value) for mux
> > > -	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
> > > -	 * &n_boolean_regs).
> > > -	 */
> > > -	__u64 boolean_regs_ptr;
> > > -
> > > -	/**
> > > -	 * @flex_regs_ptr:
> > > -	 *
> > > -	 * Pointer to tuples of u32 values (register address, value) for mux
> > > -	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
> > > -	 * &n_flex_regs).
> > > -	 */
> > > -	__u64 flex_regs_ptr;
> > > +	__u64 regs_ptr;
> > > };
> > >
> > > /*
> > > --
> > > 2.41.0
> > >
