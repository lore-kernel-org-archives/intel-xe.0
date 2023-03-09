Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359DBC61DA4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 16:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C5610E180;
	Thu,  9 Mar 2023 16:06:59 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4352510E182
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 16:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678378017; x=1709914017;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vEBk1KflBUw80Zz49S8nuxGxTBuouN6HKdq3wZuZ9MY=;
 b=ZwTvAqrfy8ChuZdrR8wVTxYCMDqottyXrjvTTWqvU4u6wJZS6Nn8O4E/
 C9CqNjuaDrWepPt7S1pGzXkeugERItKnOftFe2K37tM3zVEajXFpMuzL2
 mC+PER5E/uZz5a57km331jXhQh0sr/gdBSzX3vmG6jqBKiL7V56ZX9SQo
 B9QsgmR+Gy3pab4YJni0Tl8bftV4UGRlNC/c19bbrztnrQJQmE7TTVPPj
 Rh7iGEGJNUhn8Wzpu2JjdnSrCA26xNwuJK4PpPufSG5D1yP9uh/yhOnOj
 iz+ReU/qs+RvY28SUzZOiO+d8i7jxlzKh01wL4yzBqNVz0IoXf+NDdyLk w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="338843449"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="338843449"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 08:06:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="851551363"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="851551363"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 09 Mar 2023 08:06:13 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 08:06:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 08:06:12 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 08:06:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtkJPRQkyyWKAKwAUpysWEnLNLVlpZDbL7PfPqUNZr6LCJ3vGq9cJFuEfcYf219h9f7IiiFdY1DJCZTn/bRT++h3NZU9irMhFVYERzNKxZ70GumDPwqVYx2VstP7LLWMQClcA4282KHSSu8OwcgEp8AgAuFFeL75UHQijASSPAmAbyF/ilDgMVCFozZg7K4gVWQ8XyI2zlcKEN7C9LWc8dCCpbvMJHCuFeUOhX7IwAcfmmRIgZ2BlwMZUCBQGG9MHdtJwNhdbaeDwO8my1wEC/k6R1j2D01bZhy/aUFJLftD40bmPsVdocfcufCte4m2hoIcflvZVfj9GfYrOsqiog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUEeg1gdTJ0lHiGA+EYCzp6hSe0XBOJ1XejRfvyM6Zk=;
 b=JC2hSjP493x4aXd7gMh85u9qxX2TTKxAfVWqAAT2S2VXszrEfzZnKg9gVlOzUKVp5jka1w76mW3rtkMm2vmIzd3CcbB0VHHrqLXqL/OtgwiuxOJFyGD5xBscNzTzps2oYcLDEQ+deBKyH0hsHOr24L3xL8G87iK2n/o6xvYfDxIKIQpiuLuh6lZDahFVcXItXokAvhZmRo+8ZyXr3v+JYL7IPbrWEWegYivR+cYdP26NWuLh2vZUTppVz5pqqtNS26T+PCGTcKhIzvSh1rbYxli9hA5srWOHAc+V76UuqTWhu01gzKnsDMrL6i/D5ljiT+o9+S5tplXk/noutusg+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 16:06:10 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 16:06:10 +0000
Date: Thu, 9 Mar 2023 08:06:06 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230309160606.GR1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-5-lucas.demarchi@intel.com>
 <20230308215338.GY1543793@mdroper-desk1.amr.corp.intel.com>
 <20230308221648.ylc5hxuqe2ymuvke@ldmartin-desk2.lan>
 <20230308222017.z547bjozgzniypjo@ldmartin-desk2.lan>
 <20230308224355.GH1543793@mdroper-desk1.amr.corp.intel.com>
 <20230309045107.kayv63tfzq6i4o2b@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230309045107.kayv63tfzq6i4o2b@ldmartin-desk2.lan>
X-ClientProxiedBy: BYAPR21CA0003.namprd21.prod.outlook.com
 (2603:10b6:a03:114::13) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a7bd57e-7a45-4dff-8848-08db20b832cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iC4ETkufKzhUaRHnzFzXKjKUNFZBkfefDTQrc2tOqynlem3gB5W1FHmQvCg6GQaTVLuEuFqk/dkBKnxaf3buWcpQkiR5UJWj4EwuqVdm4Th2y5aS38hgH+1DRxsdyGweE9lJaZS+knklm8KwULpShZ6XeZ1JmOjK+HnFWE8ytINgkcveVNBUIjNvemzzEDZjpfY7pMQ8AzMhyvbux9dVJoi7/VQn9S1rfGTwNQnqlo5xuYx4874r8y1vmBx1FnU9XhvUCu8gF+F6yhuwWANVjMorcuB+ZHi2+XA6u/qf35udJ25gl09X5hYU34frdyiI8ozKv+KoVO/TVvK4Ejpw8TkYiA7TMBhEGkpnD8VNWqZMnI8AquwJn6L1mFnLnkVcT6flyrO3O9QBVOptQ+xjr6zLg81zZHBC8ts1sEYAROreSQqZiT8+hluiK2Nca0dUw6QDL9/rYxziPUnT5vmanCz5rZgl6Hu3oYCggN+myNidqnvfGmAK/PscYNIlw7I0PuflasUXsWDx7zsVn5eMsWKzKkAjkAgaZ8o5pvnx1HlizQY1JwCN2ajkbputfecA2K5eyeK44a26W0zZbcoaFSbvgG+wrznl2yzLv7wF0aSj2dxnN590yNdUcQ47q3iLZDulfOOatxf9T6k1yz5LhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199018)(66899018)(6636002)(33656002)(38100700002)(86362001)(82960400001)(6512007)(6506007)(1076003)(26005)(83380400001)(186003)(6666004)(316002)(5660300002)(478600001)(6486002)(4326008)(41300700001)(6862004)(2906002)(66476007)(8936002)(66946007)(66556008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pFxQ8Nfk9sp1WQRbhGZLTSWXMWpzk/l2CaACiJkEguCcJYQ/tghnT6lJDYGD?=
 =?us-ascii?Q?qLwwtjIkGkMh20GqdSOZlfo15UlzW9SxX6UOJNJkK6tJFEVxxOVNMVmL+fIW?=
 =?us-ascii?Q?4oqLZaCN9R8ui28e2f1MA/zqycMJQxhZwlY/w9Z5X7/hEY5/CvqBvPgdlEXY?=
 =?us-ascii?Q?HYdhNS6ma5AKTsQSgbgk6KBzT+B6JWdda+bB9gxVkXFSdzB2Y2jUYqWsVxMH?=
 =?us-ascii?Q?HbgopkAQDzGgn9GOcBxVNWnI47mFNmrn563rO3nww3S+gaVEcrNSLAhDFk42?=
 =?us-ascii?Q?hM83bdV4eRiy/JRcu10ws9gwIm7szgw/IvHFL7Er/2/jiTVl6erzFFcLcIMI?=
 =?us-ascii?Q?5N1Wc40TYCHSxOPLNUAwT3b0g9kPprvAP8O5z/U14ttYnvBt5XBrd8k9JGOQ?=
 =?us-ascii?Q?Mgc3MDFftrq5rGRSeVdf2GM+0Rlkjspb13ag4yJSA4DRt8KxMxI9cT+WzIzf?=
 =?us-ascii?Q?qgU08b3AonEksodPLQ+ffFd3hUqZXI0hTRWGpddyIgjrdVz4PdSxdrOAoqgN?=
 =?us-ascii?Q?4LqLpWcXtztu2ga/atyM93v7UK8EL4HCXgOyLrZN9/Yer8gQJwNvGQm6IO/K?=
 =?us-ascii?Q?/xU8mSNkL1rtmNm9eSXCRtnZ704X6W6xT16IQBRkiYvjDaG38qcOldcQsYqo?=
 =?us-ascii?Q?Z/i2or9cHXRJoMYPZtohD3xS1nLZeKSKnSPuikTN1GHRWE+nx3PWYeTBeJxX?=
 =?us-ascii?Q?cpBV7AcD/SsDCXb7t7VR1EmudBt/oSfqc+9dfKc7s+G8NVvw1byaXdTmJYfA?=
 =?us-ascii?Q?E/efvKAtHKAeZvXHOFJqQedQtirQxX9RQY3IUpcXcerqHM0lx4oqJ39WTL9n?=
 =?us-ascii?Q?rVOTZVOG9tb7UsIWMmYnr8aq8FS9GmrpajmBx9dZz7zGNidTW/VKQv/VjXbF?=
 =?us-ascii?Q?wae7MaoKhpeiz4WndQbVjgKukZABivUUWPDLH0itqNSJBBf7Z2ZiV5ziwqL9?=
 =?us-ascii?Q?AR/Eg9r9Iedrgqh5XNvQ4804ScTJD0ZCQBR9xFbFEu8FCEghX+n6NfkARQQu?=
 =?us-ascii?Q?vm6tWJzwDxTE0CyWMwgqhVCmx61LiyPYyaaMFUkiI4ukr1S9p2H7LbpRQ3hI?=
 =?us-ascii?Q?FzuRkJO6J3CjKG2PGVz1+0l7UTUyzU7u2rLAmXqr2WIAwOi4fU18bPCxkNnl?=
 =?us-ascii?Q?WDWKzwxDwHqijnr49NyZ25sUPR4wmjPXmJeJILjmKYI/qkFUDKJV2QjkKT8a?=
 =?us-ascii?Q?PlZ2Xs3Tr64D487pSAEA708PQlhNbDEd0x99/WDqYpY4mExMz14DKuoAS7wp?=
 =?us-ascii?Q?kg66Gb5I9ZYY7gzZcqYxXuN7KJWhBD1NgpzN+8Gp6gRhTkrzTJXzu61PGfLE?=
 =?us-ascii?Q?FDF62wxvz0cYUtHtojXCQAn7cypwnfNqD0FMkJ3q9aS3j227MI9gGACoaujT?=
 =?us-ascii?Q?kPuOuRh1TQmvY4kNAffA4KjMkCE5i1/cRmj6O1vi+itNKT3jtR/ajDZtXJ0M?=
 =?us-ascii?Q?iEnAQJhKeCLXineyjxzguECpNxRRWIMgIMgLZGuFnBXi4xuAFN1okqsB+M9m?=
 =?us-ascii?Q?aK87tuslI2gP3FXBUoKOe3K9Srj5ytqfH9K1SFY55HyX/shN/bXah4rfkJY+?=
 =?us-ascii?Q?cpdmi2iAoI5caAy01gNMYJQUCfcRqIxIMlR7H4hBaag6qkMgPLlZz8fwRg0V?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7bd57e-7a45-4dff-8848-08db20b832cc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 16:06:10.3112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ze9BqJkSt+xIXfJeh4x/BzulCqufhwC3peRxzLpmSRUDnB9wrvQibHn5/E2wY1+vkNjNa+otvcoPgdSfH48036LfSteZ51GMJg5JNhWGsq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/19] drm/xe: Add helper to get dss per group
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

On Wed, Mar 08, 2023 at 08:51:07PM -0800, Lucas De Marchi wrote:
> On Wed, Mar 08, 2023 at 02:43:55PM -0800, Matt Roper wrote:
> > On Wed, Mar 08, 2023 at 02:20:17PM -0800, Lucas De Marchi wrote:
> > > On Wed, Mar 08, 2023 at 02:16:48PM -0800, Lucas De Marchi wrote:
> > > > On Wed, Mar 08, 2023 at 01:53:38PM -0800, Matt Roper wrote:
> > > > > On Tue, Mar 07, 2023 at 01:24:31AM -0800, Lucas De Marchi wrote:
> > > > > > This is already used in intel_gt_mcr and will be used in workarounds.
> > > > > > Add helpers so the platform-dependency is in a single place.
> > > > > >
> > > > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > ---
> > > > > > drivers/gpu/drm/xe/xe_gt_mcr.c      | 2 +-
> > > > > > drivers/gpu/drm/xe/xe_gt_topology.c | 6 ++++++
> > > > > > drivers/gpu/drm/xe/xe_gt_topology.h | 3 +++
> > > > > > 3 files changed, 10 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > > > > index a42061c4b9d2..694a79b40ec0 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > > > > @@ -223,7 +223,7 @@ static void init_steering_dss(struct xe_gt *gt)
> > > > > > {
> > > > > > 	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
> > > > > > 			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
> > > > > > -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> > > > > > +	unsigned int dss_per_grp = xe_gt_topology_get_dss_per_group(gt);
> > > > > >
> > > > > > 	gt->steering[DSS].group_target = dss / dss_per_grp;
> > > > > > 	gt->steering[DSS].instance_target = dss % dss_per_grp;
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> > > > > > index 967f2349c67a..9fe06a46a400 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> > > > > > @@ -103,6 +103,12 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
> > > > > >
> > > > > > }
> > > > > >
> > > > > > +unsigned int
> > > > > > +xe_gt_topology_get_dss_per_group(struct xe_gt *gt)
> > > > >
> > > > > When this shows up as a general interface, it leaves me wondering what a
> > > > > "group" is.  The rules for DSS steering happen to use gslices on Xe_HP
> > > > > platforms and cslices on Xe_HPC platforms, but that's just the
> > > > > platform-specific rules of steering and doesn't automatically translate
> > > > > into which type of slice would be appropriate to use as a grouping
> > > > > elsewhere in the driver.
> > > >
> > > > humn... maybe I myself didn't understand the group meaning here.
> > > > is group a generic term for cslice/gslice?
> > > 
> > > btw the term "group" is already used in e.g. xe_dss_mask_group_ffs()
> > > exported in drivers/gpu/drm/xe/xe_gt_topology.h
> > 
> > Right, but that's just working on an arbitrary grouping of bits (of any
> > size).  The definition of "group" in that case is explicitly provided by
> > the caller via parameters; the function itself doesn't decide what a
> > group is.
> 
> 
> so.. do you think documentation for what this is should be provided and
> be sufficient? Otherwise, if you prefer not to expose this, how should
> we implement xe_rtp_match_first_gslice_fused_off()? Just hardcode it as
> 4?  I was trying to avoid the word "slice" so I used the word group as

Hardcoding as 4 sounds fine to me since that's true for all current
platforms and at least the next few upcoming platforms as well.

> it is used around this code. Maybe I shouldn't.
> 
> What about the following?
> 
>  /**
>   * xe_gt_topology_get_dss_per_slice - Get number of dss per slice

"Slice" is also ambiguous since we have gslices, cslices, mslices, and
bslices these days that are all related to different subsets of the DSS
pool and that can all potentially be used in different areas of the
driver.  If we're making a function specifically for gslices, then it
should state that; if we're making a general function that can be used
with anything, then it needs to take parameters that describe what type
of DSS grouping we want to use.

Unfortunately the bspec still uses the term "slice" in a couple places
without specifying which of the types of slices it's dealing with, so
you have to read between the lines a bit.  I remember that leading to a
lot of confusion during early xehpsdv bringup where different sets of
hardware architects were arguing about "slices" and didn't realize that
some of them were talking about gslices while others were talking about
cslices.


Matt

>   * @gt: ...
>   *
>   * Each slice in the GT contains up to a fixed number of DSS. This
>   * can be used when the ``g_dss_mask`` / ``c_dss_mask`` saved needs
>   * to be interpreted on a per-slice basis.
>   *
>   * Returns: Number of DSS per slice to use with [gc]_dss_mask
>   */
> 
> 
> thanks
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
