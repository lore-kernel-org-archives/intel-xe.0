Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8D9EEAA45
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 14:28:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CC110E298;
	Thu, 14 Sep 2023 14:28:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF27110E298
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 14:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694701691; x=1726237691;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bm4wUwzsEfZ7NGgltxdLhXAXDeIBy/Lv8+Kan7x2WAQ=;
 b=eS3Pq+D6gNSUMSScUaMjSHvVUJPzQZMyxUXxSzbqjsLc40r1w7LsTurZ
 yxsiWALlMgk49eZ9nlV+2vzyWKsWneKloqQE8cRxl2x3ab5H0pQXhmgs7
 kzc+nttH992FqVYZzSAzaObDRERCAApGZKbrfH0bd1oQJiKdURfLX761l
 PbhoSWxCBqi4AsJpwnUEBgbYaORLY6H9HZTGpU8lD7Xw5QbTlm3jdo0q8
 HI7VgJ4aKfv+cmJ3V3c5yYISTOsZOrGITwGjK5ib8ODYoXFGuHO0OXC9R
 LJUEmOtnG2naDN6xL5d6GF5HmkwOJqXLdmt0myVa0X0Yz9eGjpYuTzW0X g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="443008892"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="443008892"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 07:08:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="773895884"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="773895884"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 07:07:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 07:07:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 07:07:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 07:07:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVYkh4+HYW2sRKqbpxURlNI9goA6ls8vaqUnaOg1i4c8O1GOmJDX75ZbOg4jyvZd3CrE2Amhxtk+HtBH9Ae3R7eVpsnaMAEAYTmHrvQeKYY6vCz2ZZZ3yeFJROXalKJAcrJvRk57/MP1XJb1Qc3QA9JEBPkutUK48TyFbse8+W6mgG6iWuNsMWCX97J3UIp8yn7dAeX0H1/wYn8LdLEZZi/9NslS5r3IhuF5ChFUqlq0aGep4PpTDW/qjE5wb7TK4zoFMqlowxWfyxX49Y3/TCFxTN5UQNPBmPzmRqhCTDg/ZK3akLtMhH0jocRn3KuxqBJ/eWVZ92iqnLpRJlDNDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xo1pmbdAYm2oWdfapHZZBQARL084bUKubfRCJ8KN0+4=;
 b=FbJzMA1DhmFPnNsQBbDIERu3V9nvExcoEwTR5A4GxdAykrd05IO3R5XHuUch0hEm6MlZ5t3XfmXw6rjD13qCnCC9ZgupSGOgTCpt/eT2zNV3lsJJWNIElmBWGSi1U1MNsN8tBCN8NjYsETqQI/93Mik8f5Xeft2v9SZhG7pn8Gy5WP8Ky48hORNPwnJlnhj3DGhIi97hZnx1BmzykiRHh8T99t0PfSJhiqBBm29e7ufwrjr+kNf2AhxqaHGN4/ZRGWCIcQX3PaKGwGFp3rkgFMJ0RVEuJ3kf3ye67mVMoJMm0f+ZvDTDUq7ik69ARqGB+jlX8ut0pdkdU1BIkM9zdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8503.namprd11.prod.outlook.com (2603:10b6:510:30d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.40; Thu, 14 Sep
 2023 14:07:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Thu, 14 Sep 2023
 14:07:51 +0000
Date: Thu, 14 Sep 2023 10:07:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZQMTslYU9/5bYZF4@intel.com>
References: <20230908203302.449041-1-rodrigo.vivi@intel.com>
 <20230908203302.449041-3-rodrigo.vivi@intel.com>
 <20230913195506.GC233750@mdroper-desk1.amr.corp.intel.com>
 <ZQIl2bmrq0XgFD88@intel.com>
 <20230913214630.GR2706891@mdroper-desk1.amr.corp.intel.com>
 <ZQIvy2XeRnTZromd@intel.com>
 <cea2cd12a5a855955f7af5c5c926b4ce170d1ffb.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cea2cd12a5a855955f7af5c5c926b4ce170d1ffb.camel@intel.com>
X-ClientProxiedBy: BYAPR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::44) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8503:EE_
X-MS-Office365-Filtering-Correlation-Id: fd4a9af8-a78d-4efe-34a3-08dbb52bfb94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rudVvJVwP7r36mRRNB+HB9cvUKRh6s1qjNH3HRo/6gJe3bzB0DUFyAhX4Kctc2qBCrSDWOLQEe3N0esM9l0j+sKpBSFSrDJetk3Mm0Ml555KELYcRz6y6UzBB+1pqB9QwMA5nmI2sJgyBNHOAitsFld9T+iDJCh/XnNdTSiSEVSLCncOt+JHIAX44M/Zv+1EzIntiNg34NPmybCMpRtDx74El0n08oWLgpw95eZi/jFi1Savq+mq/IeTrVVXxutTXo8aS/syRARzYZ1nfwvRkZwboHhVN4yY0TsraXW9dOMnADb5dyfSXX2+cnh2H/AG+U9IJjYzCrvFH8ixF3MXQH9Pg16y73ZAmdev8Ozj5omhFnPbWQtr1m7eA9YsabXohdAxyDkVP17ju++Czxkf0j2MvTlYIpDpvP+nPDJvnEbX/EuWYJJAYJECweo5vlFxyPxKUMuGxhDQFSMcEmk/QXEdmsp92gMK+1xdjcWVPhYjIs4pW8SVmzcxvfesL0Y1/aHSq2BmpDfHNC10oUxz/qd+cMbbjn4imtEz8hH9vlf+RkcOn3HXbp58BIaeqQj6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(376002)(366004)(136003)(1800799009)(451199024)(186009)(82960400001)(36756003)(38100700002)(86362001)(6666004)(66899024)(6486002)(478600001)(66556008)(54906003)(6862004)(44832011)(2906002)(8676002)(37006003)(66476007)(5660300002)(8936002)(4326008)(6512007)(26005)(83380400001)(66946007)(6506007)(6636002)(41300700001)(316002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gbtgQmxQUSeHSQjJH89/E3uqVQo0CVOx7yaF+BrgzI+x4GgUGRMGDVHQ9fcK?=
 =?us-ascii?Q?8gy1NMfKbtNTyV+Zrn1ngcWFuFkzm4C5evHTThgLCYVX4GxYqZ3CMgWowNeW?=
 =?us-ascii?Q?FtZMoAKR/ubNPjd29OxchEPXvqmvqlRV/6EBPl/wcybVtQWtqYphN9uHjTQH?=
 =?us-ascii?Q?PoxfFinTWzP0zmmkIZqbGUfcatx1pDBqoB9oOuIdExcXpC02SX749d1qls+P?=
 =?us-ascii?Q?wHX2iRQ8ddBIo+OJSM3uY+QqUg4E3egyArE7pk5K7IZMWVx0Faqq8PIfpOY9?=
 =?us-ascii?Q?1IAXK+aRg1cOZ1OsY/r3YS/kWq4vVPGPrqI5j9hdhNSZx2mRVo8D12Kniryw?=
 =?us-ascii?Q?HbtVKEbCnsEEt+5KeTiM27+MJ8JN3jSwmyUTTL+gyJ17C6EMHn3rxqFVTxoX?=
 =?us-ascii?Q?kDD2YwfKCo63Rfm6kksXZNSQU8bKJhpO2bYVi019TrtrxYEjSRRfzFvmbMs+?=
 =?us-ascii?Q?rdSedYtC5AnZNWKSRGEaF9xOABDPgQacZ0ckbLp8f5vibdiVd/eVuB0WEmmS?=
 =?us-ascii?Q?W5fw3prxf8PZpt0bKZyNS3ulN9rYMAVVmQ3BFOq40MgBKJrCAYbwvmKC7bBw?=
 =?us-ascii?Q?e7Qd1ZgbH4qbWvVztNfmYOMrftvw9ARkvOYEkJawledt4cFIcysAm7K882Pq?=
 =?us-ascii?Q?TyQJXunVx0tM6swsBUUBSysOJ0py/qWZTTXU+3POWrD2nDFBh1eHYs9iIpMh?=
 =?us-ascii?Q?S+8z2h/vBjwpmlIKjOZNSmX06Wk+RTBWFFXeX1EsHXOUKAaIzUlKj2kvGLnY?=
 =?us-ascii?Q?oBG1FZDJSCmvY4rv9Vf6/o3XNGr5N7KPZQv8fz/81GIutgh0dUby3ZopoY6h?=
 =?us-ascii?Q?L+p7hksNpPEcy8/wbfuhnHs4qxlbgCxe97ygIiWQSlCaYwjvcGn2m8X3mLWZ?=
 =?us-ascii?Q?v6ottdrsxgDHs5hdYr7myKwjYLgwXATZDmW7xAwrvBhOSOnqjJkd2dLj+wfA?=
 =?us-ascii?Q?eWammIzaUZSTM1AlAEXUjzePCpeRJf8daVy7fL1CfLOfzn+7vBTCtm7nxnP2?=
 =?us-ascii?Q?jyT2Imiv42h+Pr5/9+l3mvBJVInFX7oRg3U8VoydJljTvfYGqXA3xkWyOpjN?=
 =?us-ascii?Q?hSfqvD0re4gA2cRVD5k7ZgrpBlzcjROlmDRvdDEmkQ5uXTiSgMVc7Mr81QMf?=
 =?us-ascii?Q?FeFFUyfwC3G1+RUAHrFwop4FS6e0JAUIXNPJWM9RHxuosIyo3/DhYHNX3eZk?=
 =?us-ascii?Q?DLlfUY1kU3Vf1TE4meg1DinAYTYKjSORajqlNG3l1LG7Ds08GYea259ynbCJ?=
 =?us-ascii?Q?bGoE9T5ufgZkjBQJCj5fZ6gqX9NPL8sn0n3Uo1+dkXKQpeDfDH1lu/qVeM7s?=
 =?us-ascii?Q?OWL70isEFPSBNWWLiKsbDYDGGe5tuf1G7F8iXKJjYD5tOrZAGqvS0W2LCP2b?=
 =?us-ascii?Q?5IiqnCzmzYHG06sjxycNXgoM3hkeCpciY+OGjPyV+CMHX4QnahpYrvmA1BaA?=
 =?us-ascii?Q?zYZVAvl5Suk4fmDF3iRN38nCuOCwMV5r75AB9NRGPqe0mlJdzDoVqjmbxsS4?=
 =?us-ascii?Q?uyzYUB81IB3QKe3WYo0CWY3CCGc84yGGooh4MwKgymjY5RidR97Hgtrbm5J2?=
 =?us-ascii?Q?nCdUwL1MJyzOqSj5TqehjycxVzsoof67CYSzut7j13jkIB7GMAu+uBGvSyjl?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4a9af8-a78d-4efe-34a3-08dbb52bfb94
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 14:07:51.5112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2n/l/dZq2Icmj9onozCuwK4GUvTjkwvOHZQuwB3zGv2KU2nZ3gum9LLvmdWn7ZZ6JGGwAinbiLgK5hwFx99Fpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8503
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 09:57:15AM -0400, Souza, Jose wrote:
> On Wed, 2023-09-13 at 17:55 -0400, Rodrigo Vivi wrote:
> > On Wed, Sep 13, 2023 at 02:46:30PM -0700, Matt Roper wrote:
> > > On Wed, Sep 13, 2023 at 05:12:57PM -0400, Rodrigo Vivi wrote:
> > > > On Wed, Sep 13, 2023 at 12:55:06PM -0700, Matt Roper wrote:
> > > > > On Fri, Sep 08, 2023 at 04:32:59PM -0400, Rodrigo Vivi wrote:
> > > > > > Split drm_xe_query_gt out of the gt list one in order to better
> > > > > > document it. No functional change at this point.
> > > > > > 
> > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > ---
> > > > > >  include/uapi/drm/xe_drm.h | 65 ++++++++++++++++++++++++++-------------
> > > > > >  1 file changed, 43 insertions(+), 22 deletions(-)
> > > > > > 
> > > > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > > > index 51c4ef5dee6d..4bcee709bef9 100644
> > > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > > @@ -262,6 +262,47 @@ struct drm_xe_query_config {
> > > > > >  	__u64 info[];
> > > > > >  };
> > > > > >  
> > > > > > +/**
> > > > > > + * struct drm_xe_query_gt - describe an individual GT.
> > > > > > + *
> > > > > > + * To be used with drm_xe_query_gts, which will return a list with all the
> > > > > > + * existing GT individual descriptions.
> > > > > > + * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
> > > > > > + * implementing graphics and/or media operations.
> > > > > > + */
> > > > > > +struct drm_xe_query_gt {
> > > > > > +#define XE_QUERY_GT_TYPE_MAIN		0
> > > > > > +#define XE_QUERY_GT_TYPE_REMOTE		1
> > > > > 
> > > > > I know the goal of this patch is just to add kerneldoc, but while we're
> > > > > looking at this, one other thing we'll need to decide before finalizing
> > > > > the uapi is whether there's any value in keeping these two separate.
> > > > > I.e., does any userspace actually care about the difference between
> > > > > "render GT on first tile" vs "render GT on other tiles?"  Given that GT
> > > > > at the uapi level is pretty much only concerned with power management, I
> > > > > can't really think of anywhere that the distinction would matter (but we
> > > > > should still check with the userspace teams).
> > > > 
> > > > Cc: Jose.
> > > > Mesa is using this, but I believe a XE_QUERY_GT_TYPE_RENDER could be
> > > > enough. And in case we have multiple GTs then they just get the data
> > > > from whatever RENDER if finds first and stop?
> 
> What about PVC? XE_QUERY_GT_TYPE_RENDER may confuse compute folks, maybe a better name to include both render and compute...
> 
> Also could we have a guarantee that the main tile will always be instance = 0 for XE_QUERY_GT_TYPE_RENDER(or whatever name)?
> Just in case we need to do some special handling based on a main tile parameter.

yeap, I was also wondering the same.
Let's keep as main, secondary and media then.

> 
> > > > 
> > > > > 
> > > > > > +#define XE_QUERY_GT_TYPE_MEDIA		2
> > > > > > +	/** @type: GT type: Main, Remote, or Media */
> > > > > > +	__u16 type;
> > > > > > +	/** @instance: Instance of this GT in the GT list */
> > > > > > +	__u16 instance;
> > > > > > +	/** @clock_freq: A clock frequency for timestamp */
> > > > > > +	__u32 clock_freq;
> > > > > 
> > > > > We may want to be more clear about what frequency this is.  I.e., is it
> > > > > the current frequency when the query is issued?  Is it the maximum
> > > > > frequency the GT supports?  Does this always give a meaningful value or
> > > > > does it report 0 when nothing is executing (and we're in RC6)?
> > > > > 
> > > > > BTW, is this redundant with what we're exposing through sysfs?  Does
> > > > > userspace get any benefit from grabbing frequency here rather than
> > > > > through the sysfs interface?
> > > > 
> > > > oh my! When I was adding this documentation here I hated this API
> > > > exactly because I knew it would cause confusion with the GT operating
> > > > frequencies. This has nothing to do with those frequencies. It is a
> > > > timestamp thing.
> > > > 
> > > > Check get_crystal_clock_freq() at xe_gt_clock.c.
> > > > 
> > > > Do you have more suggestions on how to make this documentation
> > > > better and people not confusing this with the GT frequencies?
> > > > 
> > > > maybe remove the freq term and use crystal_clock? :/
> > > 
> > > Ah, okay.  Yeah, I'm not really sure how that winds up getting used, so
> > > probably another place for Jose to weigh in on what kind of description
> > > makes sense.
> > > 
> > > I know there's other uapi work for CPU/GPU timestamp correlation going
> > > on, although I haven't really followed what's happening there.  Does
> > > this relate to that in any way?  And if it does, should this information
> > > be moving over to that query rather than staying in the general GT
> > > query?
> > 
> > Good questions...
> > Cc: Jose, since I forgot to do so on the previous email.
> 
> I believe we should keep it in GTS query as DRM_XE_QUERY_CS_CYCLES uAPI will fail when running in SRIOV modes but Mesa would still query timestamp
> from engine in some cases...

okay, let's keep it there.

> 
> About the name, what about timestamp_frequency?

well, this at least align with mesa variable name... although
the 'frequency' word is what will always cause confusion... :/

> 
> > 
> > > 
> > > 
> > > Matt
> > > 
> > > > 
> > > > > 
> > > > > > +	/** @features: Reserved for future information about GT features */
> > > > > > +	__u64 features;
> > > > > > +	/**
> > > > > > +	 * @native_mem_regions: Bit maks of instances from
> > > > > > +	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
> > > > > > +	 * direct access.
> > > > > > +	 */
> > > > > > +	__u64 native_mem_regions;
> > > > > 
> > > > > Was the plan to eventually move these memory region masks to a
> > > > > tile-based uapi?  Leaving them in a GT query seems awkward since the GT
> > > > > isn't directly related to memory regions.  It seems like what userspace
> > > > > cares about would either be tile<->mem_region location or
> > > > > hwe<->mem_region distance.  How is userspace utilizing this information
> > > > > today (and are they needing to jump through extra hoops due to the
> > > > > current placement?)?
> > > > 
> > > > That's a good question. They get this information, but it doesn't
> > > > look they are making a good real usage of this anyway...
> > > > 
> > > > Maybe we should just replace this entirely per a tile_id?
> > > > 
> > > > The vm_bind operation has a tile_mask there. So on the query gt here
> > > > we maybe only inform what tile that belongs to, so the userspace
> > > > can call the vm_bind to the right tile?
> > > > 
> > > > And later if they really need the distance we introduce something
> > > > like that i915 dii for query distance?
> > > > 
> > > > Another thing that confuses me here is that mem_region query
> > > > doesn't have any information about the tile-placement but
> > > > just the vram vs system types...
> > > > 
> > > > Should we add the tile_id there as well?
> > > > 
> > > > > 
> > > > > Also s/maks/mask/ in the kerneldoc you added here (and in the ones
> > > > > below).
> > > > 
> > > > Thanks,
> > > > Rodrigo.
> > > > 
> > > > > 
> > > > > 
> > > > > Matt
> > > > > 
> > > > > > +	/**
> > > > > > +	 * @slow_mem_regions: Bit maks of instances from
> > > > > > +	 * drm_xe_query_mem_usage that this GT can indirectly access, although
> > > > > > +	 * they live on a different GPU/Tile.
> > > > > > +	 */
> > > > > > +	__u64 slow_mem_regions;
> > > > > > +	/**
> > > > > > +	 * @inaccessible_mem_regions: Bit maks of instances from
> > > > > > +	 * drm_xe_query_mem_usage that is not accessible by this GT at all.
> > > > > > +	 */
> > > > > > +	__u64 inaccessible_mem_regions;
> > > > > > +	/** @reserved: Reserved */
> > > > > > +	__u64 reserved[8];
> > > > > > +};
> > > > > > +
> > > > > >  /**
> > > > > >   * struct drm_xe_query_gts - describe GTs
> > > > > >   *
> > > > > > @@ -272,30 +313,10 @@ struct drm_xe_query_config {
> > > > > >  struct drm_xe_query_gts {
> > > > > >  	/** @num_gt: number of GTs returned in gts */
> > > > > >  	__u32 num_gt;
> > > > > > -
> > > > > >  	/** @pad: MBZ */
> > > > > >  	__u32 pad;
> > > > > > -
> > > > > > -	/**
> > > > > > -	 * @gts: The GTs returned for this device
> > > > > > -	 *
> > > > > > -	 * TODO: convert drm_xe_query_gt to proper kernel-doc.
> > > > > > -	 * TODO: Perhaps info about every mem region relative to this GT? e.g.
> > > > > > -	 * bandwidth between this GT and remote region?
> > > > > > -	 */
> > > > > > -	struct drm_xe_query_gt {
> > > > > > -#define XE_QUERY_GT_TYPE_MAIN		0
> > > > > > -#define XE_QUERY_GT_TYPE_REMOTE		1
> > > > > > -#define XE_QUERY_GT_TYPE_MEDIA		2
> > > > > > -		__u16 type;
> > > > > > -		__u16 instance;
> > > > > > -		__u32 clock_freq;
> > > > > > -		__u64 features;
> > > > > > -		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> > > > > > -		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
> > > > > > -		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> > > > > > -		__u64 reserved[8];
> > > > > > -	} gts[];
> > > > > > +	/** @gts: The GT list returned for this device */
> > > > > > +	struct drm_xe_query_gt gts[];
> > > > > >  };
> > > > > >  
> > > > > >  /**
> > > > > > -- 
> > > > > > 2.41.0
> > > > > > 
> > > > > 
> > > > > -- 
> > > > > Matt Roper
> > > > > Graphics Software Engineer
> > > > > Linux GPU Platform Enablement
> > > > > Intel Corporation
> > > 
> > > -- 
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation
> 
