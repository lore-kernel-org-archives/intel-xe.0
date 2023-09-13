Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26600EE0211
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 21:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE0F10E0FB;
	Wed, 13 Sep 2023 21:56:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CF710E0FB
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 21:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694642172; x=1726178172;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QIEjvDsaVe6Xm6z6XKkPHSKoAFr6oSyWIQ18leaU1U4=;
 b=KJivOSScETlBpExw31mBhM2EZqlzYiXO4cnDPs5eRwQZb82UsL1P94DI
 q5p1mH3ldvLcRtuiGFYpJUwJ4NnLPeKN+zemsM2DGpf0fxd6FFAY3DhCG
 7NR8Vmzyy3kq4hFEqm7gP7JNX04VSMPneF3bpI34JyGULWhpgdFqIhtIw
 nwWzKUck5Km4SRzckZHH/w1pIuM8/Gre5CdzbpSOIRhQiUku55UXbA3H1
 sS9DaUAvSUJS3YPSptVwUXS6+xRBJB+IcS2uAcNwUNSHS5FUcScgEpPtW
 Lj+wfk0u4bqgo7iyPbNrFLNg9frqepKxY9P2hjV3aETQx9XPi7HV3TTnF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="465166225"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="465166225"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 14:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="744302455"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="744302455"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 14:56:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 14:56:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 14:56:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 14:56:10 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 14:56:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cv2ZQLQ2bQZpDb/liYIub2Yae5dhtqxx5h1/OfugtcuMBRvYj8Ej3IAwjl1kuhVPyuM2rqdeRxIKpl8GXhtmZSDv7dGf6WkC6FZE0iaNO5K0z7lp4zS5e7NgR5SGUzUtaX1uIunmPvArikr/WrGfhpZvOm55ZsIEqLIJUqtNXmJAkO1FcbgHzaooHiD7RJh2mNahLTXxsIBi3eaTm/i1ykN1hWA5KyUYdNkWD3o5chR40FKmps32sTj+5gbfVs8nBR8LsptBKLzhSmvjSAxM97bjJ9Fdtamk87DxHoehzhrV43laX90x8Ca85k3X8kRS3MVtUkC6ZpgwoUUh6jy7qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8mcYnhwm51h935Wd0lxTTkm6K+23czicgGMJLX/vD8=;
 b=dAjh5k+MHzUYTfbzNKi9v66UdSZD9bqILzI7295BDZ398Xg2DwCku56OBM+Rb9D3XORI62L3eJq7hsHtQPpdH4BXkw96aOLYA6R5CmFcJf8ZcTeJh2ac4BNYBJY10p6Iu/vJvI1rACRZidJH49Hh7LtIUUK2Pe5JDubA75xglDanf8vYTSmqlggOfM4WxLBBVD5p0zwsVA50WkBkMNSZWdI3rkY9b7908/tirVhjTUPX8ew9vn8jqSi77KcLAXQCdbyXds5ofrQ98i8HEkqK8OnkYofCAjaNlAOr/R7+KoKYnjG8cyZrZ4w0apFFYA4o9C9f9ap2tnMOb7csITB07A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Wed, 13 Sep
 2023 21:56:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Wed, 13 Sep 2023
 21:56:07 +0000
Date: Wed, 13 Sep 2023 17:55:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>
Message-ID: <ZQIvy2XeRnTZromd@intel.com>
References: <20230908203302.449041-1-rodrigo.vivi@intel.com>
 <20230908203302.449041-3-rodrigo.vivi@intel.com>
 <20230913195506.GC233750@mdroper-desk1.amr.corp.intel.com>
 <ZQIl2bmrq0XgFD88@intel.com>
 <20230913214630.GR2706891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230913214630.GR2706891@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0206.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 94a1a2d8-aa5b-41f0-150d-08dbb4a43b3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6uYRxtSXvSOvXzGBVvmMZiijZn1ZM0kbWZWkNDl51+XS3taMH/f78hjIKqtjhsPTipitZ1XCew/d4vl4vXln6l3XEtxljBGpMdLXAmzQS6BaWbIInmr/oLcaxgoVyLbyewvFFh5BNi1XYtZGYc/mHMl8vzO+c+Ig1gH0W3GeudSOLf81lNIrWDQJfoQv/s3V3nn3orYh74Smm0eRLl1GHhzfpbnp2M6O86mwCzrdmVjxrXUMYr635aeTH99LUDhrJTdYAzUE47jkA32GEliOBeba8F++EcbspyeiRH1Tegah0KGmhceXBezEtzef7k6fWRJBVSbdS1094YT9M8rP/lbTDjcEmUGqAWG13UoJ573dJOl4WMLJEGVFPh087WfhYsOSaqdNwge0YHHr/+PEGY4jxZvoHyr0RIABwFzWHs/NRhuaWuh21a4PIazD2SACg3Vjy0aASVO73frpwmPKQwzeuDA1uBnEsugGYUO4CZtdPMwzQvB6+7usz1NQRJVb+02yo4zIEXCoxt9fNCFvi2B+UCX+hci1y3VC4nhjHcvYPP7FwFwW9Wk4xt0p8hSO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(41300700001)(66899024)(6666004)(6506007)(6486002)(110136005)(36756003)(86362001)(38100700002)(82960400001)(6636002)(478600001)(4326008)(2616005)(44832011)(83380400001)(6512007)(8936002)(8676002)(66476007)(2906002)(5660300002)(26005)(66556008)(316002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZFWka3mqNBkEB19yGF5f78LK2azvT+23X6fqiF2qjrft+2xiOWrvxI5zbhh5?=
 =?us-ascii?Q?phMoMUyZtZHp8FbXgzAfMkyDYLWNI9Ny90zE+/J8vedWtJv6iWIzUGql0Ftg?=
 =?us-ascii?Q?sCSCkq6p3/V+bFVmtLn4TtisEtt7dwjgH9tjG5XgYy1YQz0tV9y+JRBsx436?=
 =?us-ascii?Q?SFU4weA+iGpPBfIY8DCXYyaBH92uiDx19NHNmYBpxO7yrGtZ5GdzihaDSv7F?=
 =?us-ascii?Q?Bt7a4Af9QvXB022/T95i9YJlhLKT8JkuBXbjDFb3LeIO88/rVXSqlOb2GHgX?=
 =?us-ascii?Q?xHlGgXyPM9jc3Jze3tZSzLqSnkEmI+/8avBDbhHcDvte1B0Byl8oQoLzeSfP?=
 =?us-ascii?Q?WTgyRDy18BwUo7WCSck1OCXMYarPaWMy1bSCadoX31vsqSktLePRjXkAy4eJ?=
 =?us-ascii?Q?mQC33p432kN5XVAgfDaUDWg3Xoolnl61zvqZkns7r0/Q2BC8Jq8UwhDJbp66?=
 =?us-ascii?Q?pF3q7o5CqWJj1MU/spePtSqx9XLN0z0iVFUYIgkuxkyj63qe3dJLiRBR5bnz?=
 =?us-ascii?Q?3HIdyOWBNlkkN6cQ8JAS2M30culhieJXXxl0cB5akPd9bXaHB4nJQYbJwvu+?=
 =?us-ascii?Q?vUykeoAhcfIiYkmpX64Z5KtxufTsLA49YM1R1KshLUsTnY0ZRXy9tv/iakcQ?=
 =?us-ascii?Q?okLdoVlCKfFFV1nxVq6CD6avSp1toT57JTGV9NvRplq7nJN8rdEahYBnYL2Y?=
 =?us-ascii?Q?vUsH9q+nKqjPfRXEhRJl/wedOeWbfx/LiAm//42BpEALPsFe/CyPU9E0UX+M?=
 =?us-ascii?Q?LBkRMw5VVWiJHbW6e3O4woZ3h86RldlgoFVj+6XTLegIr8E8x6vXMe5FTRtn?=
 =?us-ascii?Q?Y3YYzs1Zxx6fmg1OR37Uu+apaNAbnl5tXzpV1xoMjix4U0YeVBrMkKZccFvL?=
 =?us-ascii?Q?jc21LMPGb8AErszlhVBGNUxpG4P77tucA03uezzg/PFgtVjzu021OFUygVzS?=
 =?us-ascii?Q?QzMPGHN1XEGYM/SNykDYHAEQcn6AthIE3V68ObLNw4kb70NiJs66/ZwNO7pA?=
 =?us-ascii?Q?5GbEJJhF5IooYJGnvvkms08NVei/e+ds4C/IOiUtgTJfVJkG+Ec5gOSjyK+M?=
 =?us-ascii?Q?GWco3Od3I823EhB1B3UrsIqfiWjZ3xcGrIwHuuuhBeyyVDii8mW3RUckS9FB?=
 =?us-ascii?Q?tlmiljwTqTgmqqmZACXrV4c1pUuiAFS7LuEGFk5KU8bPnyQ0s93KxRX8zB54?=
 =?us-ascii?Q?SLrOQerMlBxIYGGH/3r0T8pn214LEq5303vh/BZFzGznrml+1lfMNK4sr7yj?=
 =?us-ascii?Q?Vhiyhes3FXHx4ijiA36lpdj/eRg5cj/6f7PnPjLknIqmZOZH4DaDH/xZpOm9?=
 =?us-ascii?Q?y+8t5OOEltJN9jDTStcDGF5QMscALTrzujb7F7nagu1Demw5rZ1+vAGBHn7a?=
 =?us-ascii?Q?dCNLKGG14LzlJhx70xNmBzZ/Hd4kbhFgZM2qwZN04W4cYnGQOQ9FQ7OYxQuO?=
 =?us-ascii?Q?lyeYqCoAUtPAAStYS41+0h+w+9maHJVAqkV4+aTRJ+9XLMjXMuN51TxfLhv+?=
 =?us-ascii?Q?1Q3yciAnMwwsSdTomlKkUXuAPxhVn6DWlMHhq6t8M3cep8KToJfERmloAdne?=
 =?us-ascii?Q?tIudgJ9hm9dZLlxRktTz9aPLg9J3rf6W0Qin5o6w?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a1a2d8-aa5b-41f0-150d-08dbb4a43b3d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 21:56:07.4251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZidmqpPOpMr5KJxUaEHX+r7/3cWj4G++68JIHZv1GShglfay/6BbI78uUoG+LbSherCfgrxQV3dsEqIn61onrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8562
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

On Wed, Sep 13, 2023 at 02:46:30PM -0700, Matt Roper wrote:
> On Wed, Sep 13, 2023 at 05:12:57PM -0400, Rodrigo Vivi wrote:
> > On Wed, Sep 13, 2023 at 12:55:06PM -0700, Matt Roper wrote:
> > > On Fri, Sep 08, 2023 at 04:32:59PM -0400, Rodrigo Vivi wrote:
> > > > Split drm_xe_query_gt out of the gt list one in order to better
> > > > document it. No functional change at this point.
> > > > 
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > >  include/uapi/drm/xe_drm.h | 65 ++++++++++++++++++++++++++-------------
> > > >  1 file changed, 43 insertions(+), 22 deletions(-)
> > > > 
> > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > index 51c4ef5dee6d..4bcee709bef9 100644
> > > > --- a/include/uapi/drm/xe_drm.h
> > > > +++ b/include/uapi/drm/xe_drm.h
> > > > @@ -262,6 +262,47 @@ struct drm_xe_query_config {
> > > >  	__u64 info[];
> > > >  };
> > > >  
> > > > +/**
> > > > + * struct drm_xe_query_gt - describe an individual GT.
> > > > + *
> > > > + * To be used with drm_xe_query_gts, which will return a list with all the
> > > > + * existing GT individual descriptions.
> > > > + * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
> > > > + * implementing graphics and/or media operations.
> > > > + */
> > > > +struct drm_xe_query_gt {
> > > > +#define XE_QUERY_GT_TYPE_MAIN		0
> > > > +#define XE_QUERY_GT_TYPE_REMOTE		1
> > > 
> > > I know the goal of this patch is just to add kerneldoc, but while we're
> > > looking at this, one other thing we'll need to decide before finalizing
> > > the uapi is whether there's any value in keeping these two separate.
> > > I.e., does any userspace actually care about the difference between
> > > "render GT on first tile" vs "render GT on other tiles?"  Given that GT
> > > at the uapi level is pretty much only concerned with power management, I
> > > can't really think of anywhere that the distinction would matter (but we
> > > should still check with the userspace teams).
> > 
> > Cc: Jose.
> > Mesa is using this, but I believe a XE_QUERY_GT_TYPE_RENDER could be
> > enough. And in case we have multiple GTs then they just get the data
> > from whatever RENDER if finds first and stop?
> > 
> > > 
> > > > +#define XE_QUERY_GT_TYPE_MEDIA		2
> > > > +	/** @type: GT type: Main, Remote, or Media */
> > > > +	__u16 type;
> > > > +	/** @instance: Instance of this GT in the GT list */
> > > > +	__u16 instance;
> > > > +	/** @clock_freq: A clock frequency for timestamp */
> > > > +	__u32 clock_freq;
> > > 
> > > We may want to be more clear about what frequency this is.  I.e., is it
> > > the current frequency when the query is issued?  Is it the maximum
> > > frequency the GT supports?  Does this always give a meaningful value or
> > > does it report 0 when nothing is executing (and we're in RC6)?
> > > 
> > > BTW, is this redundant with what we're exposing through sysfs?  Does
> > > userspace get any benefit from grabbing frequency here rather than
> > > through the sysfs interface?
> > 
> > oh my! When I was adding this documentation here I hated this API
> > exactly because I knew it would cause confusion with the GT operating
> > frequencies. This has nothing to do with those frequencies. It is a
> > timestamp thing.
> > 
> > Check get_crystal_clock_freq() at xe_gt_clock.c.
> > 
> > Do you have more suggestions on how to make this documentation
> > better and people not confusing this with the GT frequencies?
> > 
> > maybe remove the freq term and use crystal_clock? :/
> 
> Ah, okay.  Yeah, I'm not really sure how that winds up getting used, so
> probably another place for Jose to weigh in on what kind of description
> makes sense.
> 
> I know there's other uapi work for CPU/GPU timestamp correlation going
> on, although I haven't really followed what's happening there.  Does
> this relate to that in any way?  And if it does, should this information
> be moving over to that query rather than staying in the general GT
> query?

Good questions...
Cc: Jose, since I forgot to do so on the previous email.

> 
> 
> Matt
> 
> > 
> > > 
> > > > +	/** @features: Reserved for future information about GT features */
> > > > +	__u64 features;
> > > > +	/**
> > > > +	 * @native_mem_regions: Bit maks of instances from
> > > > +	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
> > > > +	 * direct access.
> > > > +	 */
> > > > +	__u64 native_mem_regions;
> > > 
> > > Was the plan to eventually move these memory region masks to a
> > > tile-based uapi?  Leaving them in a GT query seems awkward since the GT
> > > isn't directly related to memory regions.  It seems like what userspace
> > > cares about would either be tile<->mem_region location or
> > > hwe<->mem_region distance.  How is userspace utilizing this information
> > > today (and are they needing to jump through extra hoops due to the
> > > current placement?)?
> > 
> > That's a good question. They get this information, but it doesn't
> > look they are making a good real usage of this anyway...
> > 
> > Maybe we should just replace this entirely per a tile_id?
> > 
> > The vm_bind operation has a tile_mask there. So on the query gt here
> > we maybe only inform what tile that belongs to, so the userspace
> > can call the vm_bind to the right tile?
> > 
> > And later if they really need the distance we introduce something
> > like that i915 dii for query distance?
> > 
> > Another thing that confuses me here is that mem_region query
> > doesn't have any information about the tile-placement but
> > just the vram vs system types...
> > 
> > Should we add the tile_id there as well?
> > 
> > > 
> > > Also s/maks/mask/ in the kerneldoc you added here (and in the ones
> > > below).
> > 
> > Thanks,
> > Rodrigo.
> > 
> > > 
> > > 
> > > Matt
> > > 
> > > > +	/**
> > > > +	 * @slow_mem_regions: Bit maks of instances from
> > > > +	 * drm_xe_query_mem_usage that this GT can indirectly access, although
> > > > +	 * they live on a different GPU/Tile.
> > > > +	 */
> > > > +	__u64 slow_mem_regions;
> > > > +	/**
> > > > +	 * @inaccessible_mem_regions: Bit maks of instances from
> > > > +	 * drm_xe_query_mem_usage that is not accessible by this GT at all.
> > > > +	 */
> > > > +	__u64 inaccessible_mem_regions;
> > > > +	/** @reserved: Reserved */
> > > > +	__u64 reserved[8];
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct drm_xe_query_gts - describe GTs
> > > >   *
> > > > @@ -272,30 +313,10 @@ struct drm_xe_query_config {
> > > >  struct drm_xe_query_gts {
> > > >  	/** @num_gt: number of GTs returned in gts */
> > > >  	__u32 num_gt;
> > > > -
> > > >  	/** @pad: MBZ */
> > > >  	__u32 pad;
> > > > -
> > > > -	/**
> > > > -	 * @gts: The GTs returned for this device
> > > > -	 *
> > > > -	 * TODO: convert drm_xe_query_gt to proper kernel-doc.
> > > > -	 * TODO: Perhaps info about every mem region relative to this GT? e.g.
> > > > -	 * bandwidth between this GT and remote region?
> > > > -	 */
> > > > -	struct drm_xe_query_gt {
> > > > -#define XE_QUERY_GT_TYPE_MAIN		0
> > > > -#define XE_QUERY_GT_TYPE_REMOTE		1
> > > > -#define XE_QUERY_GT_TYPE_MEDIA		2
> > > > -		__u16 type;
> > > > -		__u16 instance;
> > > > -		__u32 clock_freq;
> > > > -		__u64 features;
> > > > -		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> > > > -		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
> > > > -		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> > > > -		__u64 reserved[8];
> > > > -	} gts[];
> > > > +	/** @gts: The GT list returned for this device */
> > > > +	struct drm_xe_query_gt gts[];
> > > >  };
> > > >  
> > > >  /**
> > > > -- 
> > > > 2.41.0
> > > > 
> > > 
> > > -- 
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
