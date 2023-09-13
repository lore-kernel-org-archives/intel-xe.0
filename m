Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3EEEE020D
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 21:13:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B419810E081;
	Wed, 13 Sep 2023 21:13:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1F510E081
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 21:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694639607; x=1726175607;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FQQSrbmKq7cdyfO5+GmqAw187A4qyYBT8rzojiWaSW4=;
 b=kkv14mfWAOcbG+ujpVG7UuLyJzw6eUkXxHyBAb3d7U5S2v8zn/IcEi09
 6NUgZ911wPt3R8kf9GJ2DogDUJG7u3UFE377p5vL20lYn0wghz4qAY+R2
 eOMe8Q7G7wR4Hzec91Lk+lgcQdX+uQXBG+AO0v14JN5csgQ8IzHiW6pxt
 QDfey1cX3dJBTAkx/aVe7GkPszoSBsmgsJStSZ4nauk6Q8bGfNtKhVnrk
 l6/Kc6gHfHoP8BFcuKDCgeN8F6F3ZUDEKpkIruD6v/+XHZqTY5xGA9X4V
 iuwp7S9SweePo+wuGfNp1H2aF3Bt89ewIQrhWI26h37Kq5KvrOVR43G3Y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377695519"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="377695519"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 14:13:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="693985539"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="693985539"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 14:13:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 14:13:03 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 14:13:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 14:13:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 14:13:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5XixmR1nMSygysXVnUCRswPdXIWuCzJYonGC2OQaO+c5DnUGQBC/ptJJyvBFsRKFl7j+BWIqXr3MfGE1VT8xVPTZczp19xQo5zqAEPQfrk9RbzbDo/26EKGzOkMyD3QRTlCgQ0Di3bpIpzExX1df+FGeoKAV34xkPovXUKR7PZlpJMG8eBiN6/bex9UMzx91C4D8eRue8Trse+LTkOCfu+ooLBnKxjzhU925hM8wDbVXtqhHxgs8fSN04bSyfVJrVmk2blq2onpKwq2US2Ha1edWprZC8adfvAX32hngTNZRtYCzbokRSqsgmxL6GqKlTY0H36BePHwchh6Q/M6bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiFnEAJ6AgqDQHSsUrMTkMylPb2pKgjVJPweij49ul0=;
 b=Ek/lJ+GDtGBMR5CHRB8vviu8E0DJGUow7+FstCKjFhg27PW+48XI1dt/7RvetS3gHjWsAuQdny4l4Q2LEwafMABBFO3L95ter54Smw2Ie1kgsFHDksc3TK0hx3iQXW3nOUSAVAnyubpJV2hloBZDKTSD3QrBk9FTeoliYiD7RGqLRNEFNCZr5ndPyWTxWD53No9+3XBTTmUPyhpHqiHPAEsH3yq87lT4oRUCDBWS48TZCnLsUkShJRCgZk45Xa/+RoOVTi9JZVrTlFv2zlqKURxss4M7Vaj/bRDzAtrTjwF8AlaD9tODo+2FHaNi4rxVLuowKjW+nZuiNjycThTL3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6736.namprd11.prod.outlook.com (2603:10b6:806:25f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Wed, 13 Sep
 2023 21:13:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Wed, 13 Sep 2023
 21:13:00 +0000
Date: Wed, 13 Sep 2023 17:12:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZQIl2bmrq0XgFD88@intel.com>
References: <20230908203302.449041-1-rodrigo.vivi@intel.com>
 <20230908203302.449041-3-rodrigo.vivi@intel.com>
 <20230913195506.GC233750@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230913195506.GC233750@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a7ce66f-1675-4f75-1093-08dbb49e35fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1x/1wtznaDq+XSto5uvH1f1j95UGiKZbs3v34mV19vDE4x51pIPP8EES9vgwLFiLMtYs8IXotMh2fD0M1siPCn2qoSWz5R0q9MKS/94RDSpPpQoorUFS6jB8uspMNIR160IodAJIX+kRMFOznRvPs7NnkPXUC/Lbfwsm83zMI0Fpq4fSkmNtHHJqh58N8ndU3SvNoWWljWsBm25Zfi51NZSHb3apjE8FnM9A6P9lclWoPlDTyzNLfwv1SBF81WBR9g5TC1d6ILfrpH0WHxrnTrcpO75mDvTYr94DXm2HWikShT7rU8npBnzc2wNT33Hq84VUU4W5ulich4hWbzsdKb6heJkiYs1D+LgkbQhIVcGDOXeGpMrDzLiGnm9ZgRbZgPyNrd5JFXWsQAy699vQHfBQq8Tpn1ryLeNkWYXQnNQOBFNWT6t7fu/xTpaGFg6CbrAiR1YgyY3x5WN2rid7mWDzy9GdrRneK88j3DOLC609RgjxeqaF3ZtumrWrmihS5L3WovaUK2duszDsVwfLC4XtrZBV2u22x2dLe0uHbOVNQoUFhA7B8fgw2rp+Vnaj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(376002)(396003)(136003)(1800799009)(186009)(451199024)(316002)(66899024)(6486002)(6666004)(6506007)(38100700002)(86362001)(82960400001)(36756003)(37006003)(2906002)(26005)(6512007)(478600001)(2616005)(4326008)(8936002)(6862004)(5660300002)(8676002)(83380400001)(41300700001)(66946007)(66556008)(44832011)(6636002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UmV8TkbTTfohHm4W5bEx3gZ9wGK+d/LRh98s0hv3moZueEnm18pinC+XkoZu?=
 =?us-ascii?Q?v2ekufpR/6Vx1kpwJV1JPzq1i42Uqas3anYD2P5+yzaNROSBIX+wXNHz4JKp?=
 =?us-ascii?Q?xLh9o/dewROATL9ehs+FYU74WGN6dAbb3XuAU7xA0//IAWuE5n9DfEVprUcr?=
 =?us-ascii?Q?RBJVUPfmpSqWKcTv6CbpbSHd6OdIRB2PegXwJeS6Euw0pmDTGWEkV8Py+T8u?=
 =?us-ascii?Q?RwBt4RCoD7VDUiWroS9CTLU/uivhPzQwd9ZDy6S3/tJ2g4F28KWBxWw7jfZ3?=
 =?us-ascii?Q?H1/QZa2T+anjaU2h4kKTkqX+F1XgS65RK9PV+5LrukN8qsI8whrKrD4+1nJb?=
 =?us-ascii?Q?aUuJX2XGvkfTiILSdqttEmU8JYIZ426ALGG90XgJg2A1cCYhhqA0GtE60LvN?=
 =?us-ascii?Q?osOtBUbxoMyrOFfwdSnrDGS45l4Zg/JDO4WF2Id8tHc4+8JS7FT124J79pNq?=
 =?us-ascii?Q?NAU1G2vUpUbxG3ccug3LLV16GQIP6iUDGZeFDShEJ5IjxHbG8x79RUYmkuva?=
 =?us-ascii?Q?XzAk4mjJ872xfw8zo76sP9Yj+vOhSSd1DzPxR9nheYLtM7TtIUdm3fvjtCrE?=
 =?us-ascii?Q?xOpIEy/uqIMA3ZclPBkKT1Fby4jnbxp7+bnJrq8JtmDSzG5hIJIIRIf1FMA0?=
 =?us-ascii?Q?zzmOwFkh0J9M04FsZotUZIDrWehUEyistVJSy7a+wtel7B9W8S3+qMSfUeju?=
 =?us-ascii?Q?atQ6Zb2+Y3OA8B/MytLXT9PQ55w44VR1+FdGByrJh4GHyTmeDf5UVdMOIhFc?=
 =?us-ascii?Q?AK1EPsHnCTdSAcS186w5laqMVonwQuI7ZVccjLyvEcXLrBdZRiK64LsLKHMi?=
 =?us-ascii?Q?4M+/N41i6QkmRm2k0ar9TOHkY1uZoaqCR0r4eir2j4EuEBD7CqT3KmSWQ807?=
 =?us-ascii?Q?eRk5r+5WcF741Y2GAp7rpm2ClB8cIbSZ8I/pawTu2acbTMllv97WpyCgd2Dn?=
 =?us-ascii?Q?1x+u6sf8YUew7qQsBzE8uHRmyWc6H1Eu/WrrAzdPpX7jCF63oDAtpcDCfCZY?=
 =?us-ascii?Q?vB7APUY8qtiOAxwDpQi2IF+C8u68/g2S21fhvkFeEzxW6TByKVE3nt+z0lTx?=
 =?us-ascii?Q?zEzbV+KDalo+Dli6LA5nsww+fttZzyNWYEmKSO9b1OwTqw6PtKPzShPQvqDz?=
 =?us-ascii?Q?Q3wwLRvnah+nP8GZXgsCfffknk+b8DASXwp+KBLpHzFjwDGiag8BTud/l5g3?=
 =?us-ascii?Q?t63VpVZiZZ+KBgSrbecUPCH1sPEKLlPiqXI3xQ8FIY/EiztyKXBkpq369iXi?=
 =?us-ascii?Q?Wk5coK8kMsSkYYyXdgvXG5v7CGK47pYWGcqw7nXpGRAtfM1OV/5TXVKn3bG7?=
 =?us-ascii?Q?Ne5sRMB7Qp7UfDKVP+z0fzHZWu7oe0fSNr8V+/PV6A2jnNEPAc4wafDCnTWM?=
 =?us-ascii?Q?ymariPVz6J5OUeGwuBM44Rlu66PPwkOWKQKGQLnZpotahJKUaa1gw7PgptEX?=
 =?us-ascii?Q?xftDDK1GQA7Iz+S4brssbH8lm0thliJ3ErgOfboECNNXnXKQSMQFAnnT74Zk?=
 =?us-ascii?Q?vibhOEiLjU1c4MxxTydNeUJU4iDRg1ns661F1EnDSzN3wykL8Qwk982YeNOG?=
 =?us-ascii?Q?4sgBKfBwEcHK2aQLeznSK1X73PsseQMx2Rd9U2TC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7ce66f-1675-4f75-1093-08dbb49e35fa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 21:13:00.8766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zs9XX0zAFoIScVfjQmW2v7Cm5W+QjsL4Euu6Fqs5Bnr/h66h1WVcpOVdU2b0GLAZkFr0uR1OOjCPFvSvL5MghA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6736
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

On Wed, Sep 13, 2023 at 12:55:06PM -0700, Matt Roper wrote:
> On Fri, Sep 08, 2023 at 04:32:59PM -0400, Rodrigo Vivi wrote:
> > Split drm_xe_query_gt out of the gt list one in order to better
> > document it. No functional change at this point.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  include/uapi/drm/xe_drm.h | 65 ++++++++++++++++++++++++++-------------
> >  1 file changed, 43 insertions(+), 22 deletions(-)
> > 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 51c4ef5dee6d..4bcee709bef9 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -262,6 +262,47 @@ struct drm_xe_query_config {
> >  	__u64 info[];
> >  };
> >  
> > +/**
> > + * struct drm_xe_query_gt - describe an individual GT.
> > + *
> > + * To be used with drm_xe_query_gts, which will return a list with all the
> > + * existing GT individual descriptions.
> > + * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
> > + * implementing graphics and/or media operations.
> > + */
> > +struct drm_xe_query_gt {
> > +#define XE_QUERY_GT_TYPE_MAIN		0
> > +#define XE_QUERY_GT_TYPE_REMOTE		1
> 
> I know the goal of this patch is just to add kerneldoc, but while we're
> looking at this, one other thing we'll need to decide before finalizing
> the uapi is whether there's any value in keeping these two separate.
> I.e., does any userspace actually care about the difference between
> "render GT on first tile" vs "render GT on other tiles?"  Given that GT
> at the uapi level is pretty much only concerned with power management, I
> can't really think of anywhere that the distinction would matter (but we
> should still check with the userspace teams).

Cc: Jose.
Mesa is using this, but I believe a XE_QUERY_GT_TYPE_RENDER could be
enough. And in case we have multiple GTs then they just get the data
from whatever RENDER if finds first and stop?

> 
> > +#define XE_QUERY_GT_TYPE_MEDIA		2
> > +	/** @type: GT type: Main, Remote, or Media */
> > +	__u16 type;
> > +	/** @instance: Instance of this GT in the GT list */
> > +	__u16 instance;
> > +	/** @clock_freq: A clock frequency for timestamp */
> > +	__u32 clock_freq;
> 
> We may want to be more clear about what frequency this is.  I.e., is it
> the current frequency when the query is issued?  Is it the maximum
> frequency the GT supports?  Does this always give a meaningful value or
> does it report 0 when nothing is executing (and we're in RC6)?
> 
> BTW, is this redundant with what we're exposing through sysfs?  Does
> userspace get any benefit from grabbing frequency here rather than
> through the sysfs interface?

oh my! When I was adding this documentation here I hated this API
exactly because I knew it would cause confusion with the GT operating
frequencies. This has nothing to do with those frequencies. It is a
timestamp thing.

Check get_crystal_clock_freq() at xe_gt_clock.c.

Do you have more suggestions on how to make this documentation
better and people not confusing this with the GT frequencies?

maybe remove the freq term and use crystal_clock? :/

> 
> > +	/** @features: Reserved for future information about GT features */
> > +	__u64 features;
> > +	/**
> > +	 * @native_mem_regions: Bit maks of instances from
> > +	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
> > +	 * direct access.
> > +	 */
> > +	__u64 native_mem_regions;
> 
> Was the plan to eventually move these memory region masks to a
> tile-based uapi?  Leaving them in a GT query seems awkward since the GT
> isn't directly related to memory regions.  It seems like what userspace
> cares about would either be tile<->mem_region location or
> hwe<->mem_region distance.  How is userspace utilizing this information
> today (and are they needing to jump through extra hoops due to the
> current placement?)?

That's a good question. They get this information, but it doesn't
look they are making a good real usage of this anyway...

Maybe we should just replace this entirely per a tile_id?

The vm_bind operation has a tile_mask there. So on the query gt here
we maybe only inform what tile that belongs to, so the userspace
can call the vm_bind to the right tile?

And later if they really need the distance we introduce something
like that i915 dii for query distance?

Another thing that confuses me here is that mem_region query
doesn't have any information about the tile-placement but
just the vram vs system types...

Should we add the tile_id there as well?

> 
> Also s/maks/mask/ in the kerneldoc you added here (and in the ones
> below).

Thanks,
Rodrigo.

> 
> 
> Matt
> 
> > +	/**
> > +	 * @slow_mem_regions: Bit maks of instances from
> > +	 * drm_xe_query_mem_usage that this GT can indirectly access, although
> > +	 * they live on a different GPU/Tile.
> > +	 */
> > +	__u64 slow_mem_regions;
> > +	/**
> > +	 * @inaccessible_mem_regions: Bit maks of instances from
> > +	 * drm_xe_query_mem_usage that is not accessible by this GT at all.
> > +	 */
> > +	__u64 inaccessible_mem_regions;
> > +	/** @reserved: Reserved */
> > +	__u64 reserved[8];
> > +};
> > +
> >  /**
> >   * struct drm_xe_query_gts - describe GTs
> >   *
> > @@ -272,30 +313,10 @@ struct drm_xe_query_config {
> >  struct drm_xe_query_gts {
> >  	/** @num_gt: number of GTs returned in gts */
> >  	__u32 num_gt;
> > -
> >  	/** @pad: MBZ */
> >  	__u32 pad;
> > -
> > -	/**
> > -	 * @gts: The GTs returned for this device
> > -	 *
> > -	 * TODO: convert drm_xe_query_gt to proper kernel-doc.
> > -	 * TODO: Perhaps info about every mem region relative to this GT? e.g.
> > -	 * bandwidth between this GT and remote region?
> > -	 */
> > -	struct drm_xe_query_gt {
> > -#define XE_QUERY_GT_TYPE_MAIN		0
> > -#define XE_QUERY_GT_TYPE_REMOTE		1
> > -#define XE_QUERY_GT_TYPE_MEDIA		2
> > -		__u16 type;
> > -		__u16 instance;
> > -		__u32 clock_freq;
> > -		__u64 features;
> > -		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> > -		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
> > -		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> > -		__u64 reserved[8];
> > -	} gts[];
> > +	/** @gts: The GT list returned for this device */
> > +	struct drm_xe_query_gt gts[];
> >  };
> >  
> >  /**
> > -- 
> > 2.41.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
