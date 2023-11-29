Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC43C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A764210E69A;
	Wed, 29 Nov 2023 22:59:33 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 22:59:32 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC1710E69A
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701298773; x=1732834773;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GZkwSfveXzWxTFTVG9kWCrXDq1xU0qnA8wjV/F/nhcw=;
 b=VH1vsdtXgH8CaTHeXRJJK1qylEi3STJ2d6/CN3uzQ53iqKUfe7yOJEmn
 3tUhbwdgxqoXdV87S5xoirrQjBkLkxdMEJnskerMFdQ2+x85A8LemgYD8
 5c8Wyaf39p6jk8yLY9hrlmSL+US1xOj2LY8veWH113sqAE38KwCUdiCJs
 WSZewDpkwK1xf3hT/2XDGlx0pT6AaNtVBAyj1cRWb2jwnuKQ+LqM+QOuk
 S7KHEUNVXnwYbGofSZLNOPLp9bRHmN8i5tLKQ1NXJpUMhaWnCC+1W1nAA
 rDIZ7fcm/Q5KNVP2ZqQewXYgHTVw4YoEbD1vn71UetNZ6JXZcdE4y7GjT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="221330"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="221330"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:52:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745422319"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="745422319"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:52:25 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:52:25 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:52:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:52:24 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:52:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NsjT6ppYP7N8ZnRpaLSyBeFahFwYcx1r9rrgj1XqIffnzPe2e33vIBngaRKbugWA7MfDSWFtnKBmcgG+6aQJhsnDixqaoh/1GBfmDVp/ss0Wsep8ZMf6T6/VqV8aFPJT4OuOgMJe+tsgXhmSnyMfysn8uQ/xYakt7juy3D+LR3PxVuZyw6eoREAZEdibhQAIpaMWzUmiwQ5gpMH4mrXX0X3/0R+NILTinb+871VcsV7Zq/+n1EYfm3ilaerZTLiJovp646uIWv68idOtbkTV+ZrHX0EvHztlvNQ+faAxP4yoOTiJsPUt4jg5azMOJ4yZxNMB+o3elFQPjHxQU1yhpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQJx74qT3u5X0g+BBNh+O/h4brqh7RZ+YzmktgXz+68=;
 b=Wzdvzx7pwR0yTl4FdVEXLoPUGBMebxYsFvbOeKvwimSNc1WGH+bF1Rcd/1FaEPHT3OHWzDYC4cTcaMLsDZ7UBkn8Etldu5FIgG6tp/z2nZBxHNAttLiRZWeXaYjmPCGJPQZYRTcYeVqN2eqWc8T4YSRIQBCN84mhw5DMw5kvOyW2+5hwYPcYeb2xnXZDyKFK/kHoIZ/rS6nIQzbw6El/qK29aOTjbSalUP07QaLxFo9u/m4webOs4EQJ7DZ3f2o/3ACjHM3jLFeOQ/C4MB9T2PMEJAF12n0mqKWZc4dP6biZfLTAPN3O0+NiGaTON1YavGGbNyGqpAQSCgR3jPblHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5816.namprd11.prod.outlook.com (2603:10b6:a03:427::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 22:52:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 22:52:21 +0000
Date: Wed, 29 Nov 2023 17:52:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZWfAoSCTWCabmUS4@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-4-francois.dugast@intel.com>
 <ZWZY/zQQzVeWV1PG@DUT025-TGLU.fm.intel.com>
 <ZWds2xD8bXkBy-t0@intel.com>
 <ZWcwLhlAGj/o5xaJ@DUT025-TGLU.fm.intel.com>
 <7b38be287ab91b8efc73544f2448520214b8c604.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b38be287ab91b8efc73544f2448520214b8c604.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0139.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5816:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e7d31c-5781-49f9-9abf-08dbf12dd876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JSqi1WWZZAaLyavXL66DS/s0/7NUMR8cs+H5knh2HkulK60/IS+uflW6tbe5IikPylBgXw18MJ48p7/oLExAymwuXeG39WGONrZcSslW7wWeKf7sTDZyIUvV2236FxktFHVaxG0IhIADWRl72TuyGIO8i+WXSszJ1VsFLLjqTHX6JSftYJgdkr75TK4sizPIT3tQzBRMeyadQSWdm1HocRSDx0tXpUlSVA4NI2Ro7xd5F/5coXrcYJ3Z4C/sEZjExokeF1AY7b5/6Nok6k3z0LI1lH018IN28hkSf7fpifzv1Kf8/rvJBF/YbPgAIxgxmFgKLvEQJy6UxKI7SAqevHVMqu/sztXshbi8VmdCzCC3T4CuDZzc+Tr2nBDWGVtrsLWAUcTpKSqXks2XY1czHkMzbaRPSqbf9dfhgrWy18tyTjXtnqLRzGMSUmYtUhz3fYCU9K8x5hDtVyBPipqis5x1cw9mGM1Kba4OmJ7avwlvaqJyRv+HFRWT+8Uqg0nAJW3KpzjY67JNNNWFq4tDVYwylswf4U/7Rnh5Jea657SbWNksfkgqpmwgKQQ+3wv+8xjBHfC01glQjErUHol9daheddHmKr/1ndSTqQa9SXw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(396003)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(44832011)(8676002)(8936002)(6666004)(6862004)(4326008)(6512007)(6506007)(316002)(66556008)(54906003)(66946007)(37006003)(966005)(6486002)(478600001)(6636002)(202311291699003)(36756003)(38100700002)(41300700001)(4001150100001)(86362001)(107886003)(26005)(66476007)(2906002)(2616005)(5660300002)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uri0AOMEEXTY7D3YbtvVjrON2s3/cv3cG2s/dclDguV6tdXdhAusBUNvGV?=
 =?iso-8859-1?Q?+O6z4akFv6uxSt/QEZNnQhH0L34zJBVKE5SOAPiQ2wdjuL+XHI72s5bySO?=
 =?iso-8859-1?Q?YbErkux3a3jg1l5SD0iZ4DJF4eclaJo9tXMjmdEYK+cYh+sJdzWqFiHvVk?=
 =?iso-8859-1?Q?EGZubawvhEeCRROMQxEvXqEc2blUilNzBP9/M7VZSL1CYIFjG/HRVspzKc?=
 =?iso-8859-1?Q?EtvE95gl6xcONbvFEZU5IF6tDNGfz0oYf58brZdsWR+istEzbNoJAl+kM7?=
 =?iso-8859-1?Q?3tydooGXUtYzOOCvZdRVdSnto4IRRHmpa9I0ypcI45HopiSj+ixKBG2PWc?=
 =?iso-8859-1?Q?mf+IrWvkHmpEH3dev+qpQgsfKGbCi99S7ndbPvwi6IOymMv1z+YFjVIGPQ?=
 =?iso-8859-1?Q?2SADwytyofNiHh+gJVL/urRYEFFrN2EhiipTa1dZ4TAk1rKbWOjeqhy4Yd?=
 =?iso-8859-1?Q?5mXjoQKh5V0JvA83+HJn+bHEkVPyXPmC5leU8e/1yLBZWDlQ+5kUf73iUK?=
 =?iso-8859-1?Q?FG2/IADEI/b+v3U5i2ysJgy5ihxNoT5WfN1tV5IXta7vgnu9HzRTymK/fx?=
 =?iso-8859-1?Q?EfuO+16ktxoXAnkyICnkIxal56Oj6yId7SNyUZ8s7H/tEbTtl7o2e4Vv1X?=
 =?iso-8859-1?Q?CBhLWHlrGaRXUChyiLeYVg2us/MYxFcrLjp+WsXYfgUiZc3IGNJSnjqXYi?=
 =?iso-8859-1?Q?gGOwneLC3M86ltkpKPh5sAgDrPcIfPoSvRC59Nt59mT8cHu6y1T3505+yN?=
 =?iso-8859-1?Q?SnP78uDBf3ldFhorUQiuKnxPsfjy/Sh2NKNeZbD1gC7Q/dmBAJrhCVa09/?=
 =?iso-8859-1?Q?W9EoZtYluaDgTmNL0TzpjBFydbp8tMNk+kzaaopWHiANXnGJp8rNalPYWP?=
 =?iso-8859-1?Q?ApJdvMybOveNLA3byGPtNIkZNa05yO8OZG558m3iUh3VcL+wyv0hCdceq7?=
 =?iso-8859-1?Q?chCHrkPBuE/91xyEZQx8kHZh1A/Z86Ta9amXYZwEWMDIJKHofYMfK4uSNk?=
 =?iso-8859-1?Q?DqPlTd2l0FWOPPy8wh68ITwb47z/57R3hACJEr3h9BRBOyrqizFWULXaKG?=
 =?iso-8859-1?Q?rqxbumUNtAncfiaIr9QS1qGBKDgm30IRUCLQ0kGlWU9JdQeyij6+dNatBF?=
 =?iso-8859-1?Q?uMWvKPzi56n33A+ycDLw3NPfzrYK5N3Lr3Cb5vV3mdW2z2LeQyWcRE9Ju/?=
 =?iso-8859-1?Q?AiqugMA3pcYJ7INM0wvyDczLG7infN33IiZRPd7/QukBw7xpZ/IC4HvU7s?=
 =?iso-8859-1?Q?I1zCngyRPVzt5IZkfX7EQSGPSiuxZ56BTb1Z7K5VSOhHIffQDwI/2qKr+H?=
 =?iso-8859-1?Q?CEMYl/H2IXoCY/28OcBcBQdnpJfH8Tdp+pRcMRneRAJoEQJQQygKffFoff?=
 =?iso-8859-1?Q?bjK7FYg0LW67gbIZXzgMSNhLVSJ4h+d7KDFfFknpxESvkOUmZQEYwJJs4E?=
 =?iso-8859-1?Q?OVyy6Zom7drNhmknWITkkMEdwXS7t28gEkAxHQ++6PUp47tfgucM8zKG48?=
 =?iso-8859-1?Q?trdJVenFCZDvL7oxWCktPRMWXZLdICNALpACzpKDKF+wkKxG2ue2L3/QtG?=
 =?iso-8859-1?Q?WNUA9TQwQf8Q5pM6LnlxG2lZHciAQG/IhLylx/ndS/j0ulyAKef6jhrUJu?=
 =?iso-8859-1?Q?YbuwhGAbFNRrCSwy2qjImNaehnoYDhwdF0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e7d31c-5781-49f9-9abf-08dbf12dd876
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:52:21.3595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbntT3Wanmm4FzzNj3u2maDtkZfzvk8wVA3C2qhAxUuQvd+h/SdPf45ZA86lemI/3aUR+9mQ0tp3Hs4y8KSEGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5816
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/14] drm/xe: Make
 DRM_XE_DEVICE_QUERY_ENGINES future proof
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 03:04:37PM -0500, Souza, Jose wrote:
> On Wed, 2023-11-29 at 12:35 +0000, Matthew Brost wrote:
> > On Wed, Nov 29, 2023 at 11:54:51AM -0500, Rodrigo Vivi wrote:
> > > On Tue, Nov 28, 2023 at 09:17:51PM +0000, Matthew Brost wrote:
> > > > On Wed, Nov 22, 2023 at 02:38:22PM +0000, Francois Dugast wrote:
> > > > > From: José Roberto de Souza <jose.souza@intel.com>
> > > > > 
> > > > > We have at least 2 future features(OA and future media engines
> > > > > capabilities) that will require Xe to provide more information about
> > > > > engines to UMDs.
> > > > > 
> > > > > But this information should not just be added to
> > > > > drm_xe_engine_class_instance for a couple of reasons:
> > > > > - drm_xe_engine_class_instance is used as input to other structs/uAPIs
> > > > > and those uAPIs don't care about any of these future new engine fields
> > > > > - those new fields are useless information after initialization for
> > > > > some UMDs, so it should not need to carry that around
> > > > > 
> > > > > So here my proposal is to make DRM_XE_DEVICE_QUERY_ENGINES return an
> > > > > array of drm_xe_query_engine_info that contain
> > > > > drm_xe_engine_class_instance and 3 u64s to be used for future features.
> > > > 
> > > > There is 5 u64 in this patch.
> > > 
> > > my bad, sorry. just trying to prepare for the many capabilities and other
> > > stuff we will likely need. But likely 3 would be enough.
> > > 
> > > > 
> > > > Anyways agree this better but what if we improve this a bit more making
> > > > each __drm_xe_query_engine_info a dynamic size.
> > > 
> > > hmmm... I think I like this idea. pahole seems to have a good output
> > > with our other existent dynamic array.
> > > 
> > 
> > Cool, looking forward to what we come up with.
> 
> v2 of drm_xe_query_engine_info would be something like this?
> 
> struct drm_xe_query_engine_info {
>     struct drm_xe_engine_class_instance instance;
>     __u64 foo;
>     __u64 reserved[0];
> }

something like that. But when I was coding it here I was not comfortable with
having an open ended reserved field.

> 
> maybe already add a pad enough for the OA counter and media engine capabilities usages and leave reserved[0] at the end for future.

Maybe just reduce that to 2 or 3 u64?

> 
> 
> > 
> > > > 
> > > > e.g.
> > > > struct __drm_xe_query_engine_info {	/* Bad name, just for example */
> > > >      /** @instance: The @drm_xe_engine_class_instance */
> > > >      struct drm_xe_engine_class_instance instance;
> > > > 
> > > >      /** @reserved: Reserved, dynamic size */
> > > >      __u64 reserved[0];
> > > 
> > > I believe [] instead of [0] is the preferred way nowadays.
> > > 
> > 
> > Yep.
> > 
> > Matt
> > 
> > > > };
> > > > 
> > > > struct drm_xe_query_engine_info {
> > > >      /** @num_engines: Number engines */
> > > >      __u64 num_engines;
> > > >      /** @engine_info: Array of engine info */
> > > >      struct __drm_xe_query_engine_info engine_info[0];
> > > > };
> > > > 
> > > > The size of __drm_xe_query_engine_info then change and can be calculated
> > > > to be:
> > > > 
> > > > (returned size of query - sizoeof(__u64)) / drm_xe_query_engine_info.num_engines
> > > > 
> > > > We then should be able to add additional fields to
> > > > __drm_xe_query_engine_info indefinitely.
> > > > 
> > > > What does everyone think? We likely can apply this idea to other
> > > > queries too as it makes sense.
> > > > 
> > > > Matt
> > > > 
> > > > > 
> > > > > Reference OA:
> > > > > https://patchwork.freedesktop.org/patch/558362/?series=121084&rev=6
> > > > > 
> > > > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > [Rodrigo Rebased]
> > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_query.c | 15 ++++++++-------
> > > > >  include/uapi/drm/xe_drm.h     | 24 +++++++++++++++++++++++-
> > > > >  2 files changed, 31 insertions(+), 8 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > > > > index 61a7d92b7e88..0cbfeaeb1330 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > > > @@ -53,7 +53,7 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
> > > > >  			i++;
> > > > >  		}
> > > > >  
> > > > > -	return i * sizeof(struct drm_xe_engine_class_instance);
> > > > > +	return i * sizeof(struct drm_xe_query_engine_info);
> > > > >  }
> > > > >  
> > > > >  typedef u64 (*__ktime_func_t)(void);
> > > > > @@ -186,9 +186,9 @@ static int query_engines(struct xe_device *xe,
> > > > >  			 struct drm_xe_device_query *query)
> > > > >  {
> > > > >  	size_t size = calc_hw_engine_info_size(xe);
> > > > > -	struct drm_xe_engine_class_instance __user *query_ptr =
> > > > > +	struct drm_xe_query_engine_info __user *query_ptr =
> > > > >  		u64_to_user_ptr(query->data);
> > > > > -	struct drm_xe_engine_class_instance *hw_engine_info;
> > > > > +	struct drm_xe_query_engine_info *hw_engine_info;
> > > > >  	struct xe_hw_engine *hwe;
> > > > >  	enum xe_hw_engine_id id;
> > > > >  	struct xe_gt *gt;
> > > > > @@ -211,12 +211,13 @@ static int query_engines(struct xe_device *xe,
> > > > >  			if (xe_hw_engine_is_reserved(hwe))
> > > > >  				continue;
> > > > >  
> > > > > -			hw_engine_info[i].engine_class =
> > > > > +			hw_engine_info[i].instance.engine_class =
> > > > >  				xe_to_user_engine_class[hwe->class];
> > > > > -			hw_engine_info[i].engine_instance =
> > > > > +			hw_engine_info[i].instance.engine_instance =
> > > > >  				hwe->logical_instance;
> > > > > -			hw_engine_info[i].gt_id = gt->info.id;
> > > > > -			hw_engine_info[i].pad = 0;
> > > > > +			hw_engine_info[i].instance.gt_id = gt->info.id;
> > > > > +			hw_engine_info[i].instance.pad = 0;
> > > > > +			memset(hw_engine_info->reserved, 0, sizeof(hw_engine_info->reserved));
> > > > >  
> > > > >  			i++;
> > > > >  		}
> > > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > > index 1bdd20d3c4a8..c80e03b61489 100644
> > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > @@ -124,7 +124,14 @@ struct xe_user_extension {
> > > > >  #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
> > > > >  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> > > > >  
> > > > > -/** struct drm_xe_engine_class_instance - instance of an engine class */
> > > > > +/**
> > > > > + * struct drm_xe_engine_class_instance - instance of an engine class
> > > > > + *
> > > > > + * It is returned as part of the @drm_xe_query_engine_info, but it also is
> > > > > + * used as the input of engine selection for both @drm_xe_exec_queue_create
> > > > > + * and @drm_xe_query_engine_cycles
> > > > > + *
> > > > > + */
> > > > >  struct drm_xe_engine_class_instance {
> > > > >  #define DRM_XE_ENGINE_CLASS_RENDER		0
> > > > >  #define DRM_XE_ENGINE_CLASS_COPY		1
> > > > > @@ -145,6 +152,21 @@ struct drm_xe_engine_class_instance {
> > > > >  	__u16 pad;
> > > > >  };
> > > > >  
> > > > > +/**
> > > > > + * struct drm_xe_query_engine_info - describe hardware engine
> > > > > + *
> > > > > + * If a query is made with a struct @drm_xe_device_query where .query
> > > > > + * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
> > > > > + * struct @drm_xe_query_engine_info in .data.
> > > > > + */
> > > > > +struct drm_xe_query_engine_info {
> > > > > +	/** @instance: The @drm_xe_engine_class_instance */
> > > > > +	struct drm_xe_engine_class_instance instance;
> > > 
> > > > > +
> > > > > +	/** @reserved: Reserved */
> > > > > +	__u64 reserved[5];
> > > > > +};
> > > > > +
> > > > >  /**
> > > > >   * enum drm_xe_memory_class - Supported memory classes.
> > > > >   */
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> 
