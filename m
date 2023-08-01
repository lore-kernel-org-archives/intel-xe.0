Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1696AC0015E
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 10:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E3E10E3D8;
	Tue,  1 Aug 2023 10:39:13 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446F910E3B8
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 10:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690886351; x=1722422351;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7FSDPkwJOGntHVxAuWED04ceqAzc9RzgpEsRVc7b7Fk=;
 b=IX9OaZrRe0JUYIwqhHxHX9MzbOtlfa5iDT9/rfEV5gIBsUCy87bZEZGn
 Y8t3+rr8XyHc+Oc/qFHc2x9EDqCQA7QysYgZpcGUZrzSa1L3aFe0i3qgf
 LTrkAvG7Miuwe3vJff0FZofzsaZchqP8OzALfo8TlNXsqr4CZNfG8R0Oz
 OS2x98MOksorAbFAeKfK41+rEeccEGzYW0CseXkwJmEchN0XKWtnek84e
 fbHl/oj15hKLUQlzK3PJ8cs3t3BwFZtk4QzPhp2yznNIym90o9lXE4iHv
 /coYy64e4K+vhpSn0VnOX9lWB9ocw0C1vw4O/K29nLD4z7czyEmiAIZFc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="400214040"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="400214040"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 03:39:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="722442914"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="722442914"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 01 Aug 2023 03:39:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 03:39:09 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 03:39:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 03:39:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 1 Aug 2023 03:39:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrLKcm4YBilhsnveD4C4v93CPW6FPVVCtgzBFTFh5Sd1HRkV0WyXYcPeAsDbAwC9MtPAk8q7eQlwDS2FGr7Xca+3wJ+724IyGENqNU3Fn77kSvR9619SUF2R+AR9n5oYEMwHA7r7YvnrKjanleTwIYUly4HqI1DWgHc0QyNjZJux19hJHLm5T/bRAhzMeHQSfPszKcD+ggI/UeK5aqMBFkaRKzywuF5t8CD6YjcU5cUJY6OFKzZ6P6+MLHGmbYrGNxFOe2LH8gLEXE3nnGhOnewWMOCRA9dJ31N0Nqq4B4B7mcTaajV7DVFekWDFflCNLDBcARJmVo2d/SBSZwdvUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5v1QLZff1/oETijU3LoVAvDuo8LXIaGOW3GPGflmJhw=;
 b=IDkKItOVV8iknPJZ/HjTlfufq+LROOJCrHFWjEYClUxGjSHrGkOfnT0mBSjcZTMiNWsLc91sLTWMq1K1SoOwVE10Q3fgwHha3RDCQc0PiL94EZbdrZtM7Jteok1+qX+Uba2kiEbZPSV2/tCn8QPMY7AUfHpw2FepR46HORk32w4MEemeesR+hqhBpE1UujBVoYvafEFFxU0rJ2sNhxPdlBaz89oBeu1KXuxvhlnsUqVidVhgQpHBh7N3gTsikHpjTwtO231ujVIU5WD8dCJoh4oX3U+XY64y56/TYBobaZW10XNFbYieg0neWsm8XwmyzUGiQpZRpBtzwzeBENgGMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB7952.namprd11.prod.outlook.com (2603:10b6:8:eb::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.43; Tue, 1 Aug 2023 10:39:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 10:39:01 +0000
Date: Tue, 1 Aug 2023 06:38:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZMjgwXVYEDPxPA7a@intel.com>
References: <20230729040211.36143-1-matthew.brost@intel.com>
 <ZMf4hvT3K8GJmNbf@intel.com>
 <ZMh+B6GqZ/8T5gdG@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZMh+B6GqZ/8T5gdG@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR21CA0026.namprd21.prod.outlook.com
 (2603:10b6:a03:114::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS7PR11MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e383622-a698-4974-6828-08db927b84c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wH+OXNi+wwK/zkWyNrUR6VTYqG1/m2JbPTUY8Q5Y4+OGGLmycpbdUoEbxdDk3OzxvfxsQhXjlJah01Zv03Czw8gL5CC13hlaMxr6CAESeavNkgOFDWyB1yu5eCF8dHrrhk4Wd2LzFHCDv9n/6zUTJC+J++jFtF+ojJgRXlV7VERPCx/xXABr+ChwYCq/ugSAu5KIqXWO8zd35BmNQebNVDO0mDzXEU1Bnn4ymjMggRROOGK/VNmP7wGE/A6Dt9Tq+BDGe+MHGAHMq1ZOHgFzhCKHoL0gEar6I6Hm4y0VZQ1tuubUKXsc+BvAQHixylmFjexawC1+MYNyuwzD9zjoMx5WnfsBb0MQUCoen6rJqzA5mP2DfEyIx+/zMHveKHT2BHjELubBjnV+OE8aDvcOtpcV+LtNY3P8E3xvc0MqncNJJk9wFW8J3Xtj6XdQeGmg0hQdLkxngHusYKh9I2ExZ4LWaivZQd9TSnudhgHDKoS5k+DELOruqMafwqtkPiLUmX4clUi9uwO2QqU+xZDRSaDTb+vUpDUnDsbpnSbpyzvsYyTe8OACj+URi6Zndsd1Yc4xCT8mtegXyYuImrdWr4a4Z2d/w0eMaNQ8wTyZwmaG2SL/aiPsHseeZvfEBttJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199021)(38100700002)(82960400001)(36756003)(86362001)(6512007)(6666004)(6486002)(186003)(26005)(6506007)(8676002)(8936002)(6862004)(2616005)(44832011)(5660300002)(4326008)(66556008)(66476007)(6636002)(66946007)(2906002)(37006003)(41300700001)(316002)(478600001)(83380400001)(70780200001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HBTOalpwoyUoq1NuxxSKK1KwbXrKZG8hnfZE+TB5yaAD9y1hr87U0GGRRlNe?=
 =?us-ascii?Q?KMzx3dCymSTd/Q+vGk/xfNziZRCmXZNOOeiLZe4/h7qOQ6+n3a0dGzJjvml8?=
 =?us-ascii?Q?twzMlaI4aZPp72IHy9DMRG3E7rx9resqNbqob0s9qahpQtsLwQgfHx1uB3o6?=
 =?us-ascii?Q?yZtw2PPWeJzxYa805N0CH0k9B7lq8sq5P8Mje7mFcL8MUhrKBSMeif4DDoes?=
 =?us-ascii?Q?gpCSmfqx80C1+Sv1dg7A3+NaD/prxg91p9DkoXlYDWxraSYpN9af9i1N8T0t?=
 =?us-ascii?Q?6IG4hhrMz4BXlSRgHxGpflqs3cGTCmBbZmDFWmprF3ufuk4duEgzgQQfkYPV?=
 =?us-ascii?Q?dNjIEyEcXIVvBpxsgPqBAyStGplvUgtH7nI8kwVHizr/5qxteG5Kl2TfqNWr?=
 =?us-ascii?Q?CVjLkxjOzvAcMiYvR0GYbzXEzIvdUHjyVKL5UlHST9WC8nR/VVbt2NmpOHnG?=
 =?us-ascii?Q?AVD5Y/8EdOv8ydDRAEYk2R2QusBm3biGBzgBPjz7Nf86pcULJpH2+TRGYdqM?=
 =?us-ascii?Q?45mTwzDqguBJQJgTiXMSqC5eaKda9V7xk2fN2jzy5Ne72v4WNM08Eo6tbpuS?=
 =?us-ascii?Q?YBbZyMr5sYypKyv9DzLO3IQbfkBuhyiAZd/iGvkzCxuWtPLhpZfMTigE6eTP?=
 =?us-ascii?Q?gYQoAYbhHMymB/shzibGQLPjMmYHZQFl4cx+U2muuyT6PVzzcaeBLvIbnSOV?=
 =?us-ascii?Q?IMDU0ZzYOA7qG/WpOGqinmuVEMKGttct3E825zVZKorNQ2UgRIqyrpWmrMbG?=
 =?us-ascii?Q?EpeXiVjh9qI68Nl4l4zUafV7etRjA0MzaLBDvfd5WZr02aKAGRGnBDPSnn7U?=
 =?us-ascii?Q?BU84DWtP+ASRDbHGLXHX6lU/9SYRTu+brqHo60ve5DYeRCOkwzRlxok8WUwI?=
 =?us-ascii?Q?V5zLO+kOO2z0LZG6i5yt1la2LjN8RakQbGFo8IpO0QEwZpkSPioyr/OG3KjQ?=
 =?us-ascii?Q?8pI71tSN/cPPq28f1UYF+/G74HYw4bPAtyEgQcFBaS5AZyviHe3YFxmxAYaj?=
 =?us-ascii?Q?QEUAWFyt5PP3oFEvAe9jYpULHJNNmAER9KUmUvVrdFKZNqoZD+O6rSVM1Vn3?=
 =?us-ascii?Q?EA/pJIhYWHpQJZvqeXXJPfi0W8PTQGBFHGbzH9EDAXRFs/xpqNX/aY2HMhIy?=
 =?us-ascii?Q?DN9+2I2pEjKa9wzLOaOGb2JufKWdn24nbzovhWnF81oF9L2Xg2GoRJeiw+Wa?=
 =?us-ascii?Q?leIl6GlERACcWzqDuWh75vrZr3zQ23tQBz2sxH3xg3ywYrCmKrqtwigxSKC5?=
 =?us-ascii?Q?CVTjJ8kS+eb+GMc28p/E/ItEIhYB/xCzehXxe/hWQAOSMBx0qZzdIqQrOADK?=
 =?us-ascii?Q?IneE6Nv8ArnRdiLOIKIQ97Sf+0896JEvYCMDYwbPiGQFsQHilAH5EF0SOXfq?=
 =?us-ascii?Q?6aEhtMnfUSwmKJpm11vpLGTTqZ9/8D3xcqWI/rkiOg1Xz1aGp7dsXR3fZJAg?=
 =?us-ascii?Q?yOyOoVKzFqT7hORUSHw7lykfFqgf3DJCxVNRlPmd/hA7HvvpheXuhjJiTLkJ?=
 =?us-ascii?Q?27P8Z+1hx1O3wSNDrX6z4Nds3vV/Z9i0M7dvBu8UQJY4aovovcyBM0HlZG8Q?=
 =?us-ascii?Q?wFyJOnW4tMAbB1n382d5G4/THyvnze6TEQ+p6yOS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e383622-a698-4974-6828-08db927b84c0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 10:39:01.7213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1BtnlVgTniwJ8sVs2UiIPYo7LVzE+hTv21AYRDiW20jTdrz+ts/izQCq912HYMFA91NC4IY/QmGvldOzuO4+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7952
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: remove header variable from
 parse_g2h_msg
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

On Tue, Aug 01, 2023 at 03:37:43AM +0000, Matthew Brost wrote:
> On Mon, Jul 31, 2023 at 02:08:06PM -0400, Rodrigo Vivi wrote:
> > On Fri, Jul 28, 2023 at 09:02:11PM -0700, Matthew Brost wrote:
> > > The header variable is unused, remove it.
> > > 
> > > Suggested-by: Oded Gabbay <ogabbay@kernel.org>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc_ct.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index d322eadbe75a..6c757efa88b8 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -829,12 +829,11 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
> > >  static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
> > >  {
> > >  	struct xe_device *xe = ct_to_xe(ct);
> > > -	u32 header, hxg, origin, type;
> > > +	u32 hxg, origin, type;
> > >  	int ret;
> > >  
> > >  	lockdep_assert_held(&ct->lock);
> > >  
> > > -	header = msg[0];
> > 
> > Shouldn't we be parsing the header and checking for the len?
> > against corrupted messages?
> > 
> 
> Yep and we do. From g2h_read:
> 
>  955         /* Read header */
>  956         xe_map_memcpy_from(xe, msg, &g2h->cmds, sizeof(u32) * g2h->info.head,
>  957                            sizeof(u32));
>  958         len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>  959         if (len > avail) {
>  960                 drm_err(&xe->drm,
>  961                         "G2H channel broken on read, avail=%d, len=%d, reset required\n",
>  962                         avail, len);
>  963                 g2h->info.broken = true;
>  964
>  965                 return -EPROTO;
>  966         }

oh, indeed! and that comes before.
So, let's kill this useless header.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Matt
> 
> > something like on i915's intel_guc_ct.c:
> > 
> >   /* message len with header */
> >         len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, header) + GUC_CTB_MSG_MIN_LEN;
> >  	if (unlikely(len > (u32)available)) {
> >                 CT_ERROR(ct, "Incomplete message %*ph %*ph %*ph\n",
> > 	                 4, &header,
> >                          4 * (head + available - 1 > size ?
> >                               size - head : available - 1), &cmds[head],
> > 	                 4 * (head + available - 1 > size ?
> >                               available - 1 - size + head : 0), &cmds[0]);
> >                 desc->status |= GUC_CTB_STATUS_UNDERFLOW;
> > 	        goto corrupted;
> >         }
> > 
> > 
> > >  	hxg = msg[1];
> > >  
> > >  	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg);
> > > -- 
> > > 2.34.1
> > > 
