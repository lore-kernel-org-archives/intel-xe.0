Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A450C04FFA
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 20:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3433710E021;
	Wed, 20 Sep 2023 20:09:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE5010E021
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 20:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695240556; x=1726776556;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KzODvbim4HGxbQh503hOCIWoQvaKgtNvnZjJMGd6T9A=;
 b=ML7nrs+wzUJDIrAkB+gPyI++SAy2AD+LP4SpdZyVrjZgTWCOgId16hWh
 Qqil1zHoBbsjz9dy+RKUPAVQNwGVRMTWXuLSXNS2yAwAfNzpH0j1s3ji7
 aUP7zCUEnjmoj/hcj2EPtvS0h0lVoKczlCv0SMMUOuZ5cqUamZiq0g78V
 1b1drkWhYOhKuRzjSQ6WMY2KuG6nzIrUhKTOyB/CORL+34eb1jcChK6VS
 v6vE9HvoLCkYyI8Uzc8yLZdvuoUWamhpXqcODC5okE4gRDHq4Nc7vih86
 8vbpAPPUi1MNVaF7ufGcHhfAfW5DydTv7c8qJbKokogfmmwMqqhkX64hD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360580232"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="360580232"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 13:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="740351052"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="740351052"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 13:09:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 13:09:15 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 13:09:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 13:09:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 13:09:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHJcygNkY5S98n4ahdfX8OQucqfy8RG3jNWJofq+YZBV4Ub3vt5xMEXFgn0S6tjhc5dCZlPVw0X7A4c1P2EjroL7qMUj9VKKkwWFTc0aPYnPiyJ5XekC4fA7O129iSGsVZ+okXLTjQFFN4WIkgjHyu3XMePnQ1lUuH+tveOtb+OqB9YDggdUhtutRPkNGC9P9fiqyptkfyy5Yjoh7SM9KtWlZ33FzspFa5GJDte4Pm0bw7twqSpu1jo/vZT7Ig8sL8v7Xd0uAydkLJs6uXPhBbXYXB+VOH98sci6lS1nCuH9hsbGBRRr3QVIuCEENpdZG5J7wRm1RLtOeKpa1wgkLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eYfFqrvcMsunD9SNBe7TK3Cy8WlYXuzCOIYkrsegI4=;
 b=Yn9wFmKtwl9YRhxAO2mhjbkffJJi4lnzVjD1IXGmkXakLFLy+lA0HK2nyBALH87QM+D6G0jAtk5JQ2k3zNWs8lqUrueXUIE4rJLafHDPvDUAbmeIMSGVe76nT8pMk9WGyDeVYDcwcAvEkhYOAgCExg8MwUqObpmNB1qVVtZYy8avbrSRHhxb9VYSvMDCjG4H5NI2wl/B9iAI2c3peTM9leJA4EwQJSyH5HfH4S4jWudjSpvQNDSfl28BoGHUekYb7pRQxmT4mh8a0D/r1gp/voDXEdnFRzIV6F0XssySHbSrOcwCimnH7cgnBGvzRXBOpQlZXpAv7proGDKl0vXq1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6877.namprd11.prod.outlook.com (2603:10b6:510:22b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 20 Sep
 2023 20:09:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 20:09:12 +0000
Date: Wed, 20 Sep 2023 16:09:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZQtRYyH3XsVEUiH8@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
 <20230920192940.135004-20-rodrigo.vivi@intel.com>
 <0a7476b25f2c183acfe4af5da8381f46cac42169.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0a7476b25f2c183acfe4af5da8381f46cac42169.camel@intel.com>
X-ClientProxiedBy: BY3PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:217::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: f02170ef-54e9-4fd9-1093-08dbba1574af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3/LMwx3BjCv2yRfLAtdEb1erlsq/VXjPfNcbpfLnytGakWeMSUWJfKrSXVnD4bStoDmmkkdoxbN4huI+EIoOAtG1ssK78wn55OiLvd5BILd1SyiH9OihfD0erY2PIbhAC4UVMywQSwYPgIjq/LrvyKvVrk0ZWoSJ7nGYweSSohJaRRV+yXNILmsV+bT9pEW6FgUhlKBsa4+csJuOxh4J2ZyPXxx+TBkICBH+z0D5lz6yeq3gZEH7j35lOU9vKRNzvMOzHARfg2us/faFB3Ak5bjruh5BVIjZLHLU3/XdRh0COB7YP0/My25ZoPSY0vk85kKrIqLIWDJRpKS0QoEiIlkoMmYNA7TMZbmnh7sjLxqCGtC6tjgRdb7YwAfdINbo/s1Rmheusv6zDqcujmLjk5aHHRLLSHpHIKAyf/xPUUtxmIF4ze1C2flNeVhAhFrXIjS0iJUp5ez+zbWB0tJPYwbRlSkdtbC/wjkUnDMjogq4+r6aB896YFoectjL8rN4qID8clo8SN4YlQRO1doY8m234GBDH6ZK/AexombfHcHvq7hT+KWkkU2qs7kCN27U
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199024)(186009)(1800799009)(6666004)(6486002)(6506007)(36756003)(82960400001)(38100700002)(86362001)(2616005)(2906002)(26005)(6512007)(478600001)(83380400001)(6862004)(5660300002)(8936002)(4326008)(41300700001)(8676002)(44832011)(54906003)(6636002)(316002)(66556008)(66476007)(37006003)(107886003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nvsZJHZs2uydC3bfnyDzGTd04wsOPlJMpe53vYrJDBsuSjXwA8C382y6itpo?=
 =?us-ascii?Q?CvHSMJSynnLh1jqhTZxiVUY/RnBatyGDLnbGEZ6YPD3XDBokuBP4M0SDAz0I?=
 =?us-ascii?Q?LfuYLnKvD5DVKJUC8stHDSIjFA7MVk2mdfUB8e2Z460a7tvl44oIxw+isgJ9?=
 =?us-ascii?Q?YyycuUIIUf8DgN6gayyCXALrPwEsGLuGG1tjTlADxYzZq/LwGRx07wnZOtO8?=
 =?us-ascii?Q?pHS+BnWOH6/kpP2fJ8eXv7czyZjj0knsR/1mq3zb7nIk2T3pSY5RVIJcueID?=
 =?us-ascii?Q?6E1gf00In2ZZCQX+qGMsVXlRFJMTPCCiudNwqA9D2y/UH3Jtu5Hlf3y5h0I1?=
 =?us-ascii?Q?uRCTBth9i5mBWNy1qB/4VwvKogydsczzv3+c+OOZF7sXsIRh1Y6njsMoCbHB?=
 =?us-ascii?Q?GXpjB1dHvb3RIcc2rtp3ayhw/4rtF1Lk4NVDJM2MJLi+4oEOR9YJ60FyLdVg?=
 =?us-ascii?Q?GAt+KTpgghUJ9yxbl8limc5fso2PPJ2ideP/51Jvu3TobXBdBEE4M1JvCTdq?=
 =?us-ascii?Q?WIC/LiQUx2BVanvgBXbnZNXJZBfeb3Cg5iig1epQBYoZ1CKzU0TBYonDGn0P?=
 =?us-ascii?Q?1OjUUSQvrNobPpp+7CpHtq4yqbFCrrLchHLU/vfinnmGO9w3niZ5TT97iIwD?=
 =?us-ascii?Q?h+rJlo53CybrRanghMUlGOwi5topIjwawcuNlF6xB3kvTt+YOEanr81aq45j?=
 =?us-ascii?Q?PgdrKTLJTtVfyPg4VCRPRCo+DHKjdIoVtf4YQaBZ0Y5PlUrCV4w2FAwFVml8?=
 =?us-ascii?Q?pjqtAMgfeLeVsWL5SSQfK5MvbIpbPotFYRaSIlbS08NlXcdqLhWfKt8mSk0o?=
 =?us-ascii?Q?652sD7Oy2ySoBPlZmB7PNAyXQuYmLGa/cq+GmOVd6Jt1InY2pd+m+6R6zyaF?=
 =?us-ascii?Q?susoJiGmqQP+pT9ZaaOoG5Xviuf/xrgEbo8LViYocVwMqdnXzXnGAnH0t+6z?=
 =?us-ascii?Q?N4kZkJTGYo7kcL7+7rsyJW31HPkpNPfHLgQDzLb9/Hks5Pww9LWgncghcFgr?=
 =?us-ascii?Q?zKk9xZOZqclyEWXQyT6SM2nqeTkQ4oMG3G6TbwwV7GnCDxQAa5WcEOv8zsgQ?=
 =?us-ascii?Q?8IqFxuoygF3nm2STAj+DZFqul2c3RELFjRxfBLQeTzvHN9h8qW4su7OzcQL6?=
 =?us-ascii?Q?sYTi1shCIpABamowPCv020ajBRLP0voAoYjBl2UtDynSvbzP9K6/m0oZ3Az+?=
 =?us-ascii?Q?5sYN9ApWAyAmA0bNbgTP7mpNAO9jL/0O9swAR8EeYDSxG32negY1ukDAL5zM?=
 =?us-ascii?Q?SEQm2qntM+2bQyeCzujrn/vbIGBKFwH3xHOyQrzcSiGt7y2z2g0Uvro5wITy?=
 =?us-ascii?Q?VZXk2Xvmbhk4EyU+d6TLVh9J7WbHrC7BIjGHke6m4ngbZ+Zu37pTyChoM0Nn?=
 =?us-ascii?Q?4KbKwkg/IksfvqNEnF0gBKllihgw7R9Ig4p/8c0B7IpmL8Labow98CoJOJsd?=
 =?us-ascii?Q?5WbWDec1AIF6czbRqjHOJVc6pM1SyUpc2bNPUR8seCqDx/+WiZw0353PsZTf?=
 =?us-ascii?Q?ZkuspxHV/3UP41bVEQHFXp7g6MRlEwHtY7CgS3fivsNr/ooJR7Zp/uOTiYN5?=
 =?us-ascii?Q?JeB0YbJUyXu6LxqmWULu9WwUwNMUWl+BUxPxUveYbfeJxORkIemACFu9qgRa?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f02170ef-54e9-4fd9-1093-08dbba1574af
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 20:09:11.9963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Th9HbtDOehZkYIhUMUHe29zUUmtPKRlfH8tz++3S8++U3KAobMUze1qg0/nrSxlsOIlOFBSoxZhZT2q84Q+dLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6877
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 19/20] drm/xe/uapi: Crystal Reference
 Clock updates
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 20, 2023 at 07:56:16PM +0000, Souza, Jose wrote:
> On Wed, 2023-09-20 at 15:29 -0400, Rodrigo Vivi wrote:
> > First of all, let's remove the duplication.
> > But also, let's rename it to remove the word 'frequency'
> > out of it. In general, the first thing people think of frequency
> > is the frequency in which the GTs are operating to execute the
> > GPU instructions.
> > 
> > While this frequency here is a crystal reference clock frequency
> > which is the base of everything else, and in this case of this
> > uAPI it is used to calculate a better and precise timestamp.
> > 
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_query.c |  5 ++---
> >  include/uapi/drm/xe_drm.h     | 10 ++++------
> >  2 files changed, 6 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index a27b10583f5a..8184df4abde1 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -149,7 +149,7 @@ query_cs_cycles(struct xe_device *xe,
> >  	if (!hwe)
> >  		return -EINVAL;
> >  
> > -	resp.cs_frequency = gt->info.clock_freq;
> > +	resp.cs_reference_clock = gt->info.clock_freq;
> >  
> >  	xe_device_mem_access_get(xe);
> >  	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > @@ -167,7 +167,7 @@ query_cs_cycles(struct xe_device *xe,
> >  	resp.width = 36;
> >  
> >  	/* Only write to the output fields of user query */
> > -	if (put_user(resp.cs_frequency, &query_ptr->cs_frequency))
> > +	if (put_user(resp.cs_reference_clock, &query_ptr->cs_reference_clock))
> >  		return -EFAULT;
> 
> In my opinion the renames around drm_xe_query_cs_cycles should be done in the patch that implements it.

I honestly agree with it. But I didn't want to disturb the force there
and since we are doing a big modification and that we need to remove the
duplication anyway, I decided to propose it separately.

> 
> >  
> >  	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
> > @@ -380,7 +380,6 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
> >  		else
> >  			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_MAIN;
> >  		gt_list->gt_list[id].gt_id = gt->info.id;
> > -		gt_list->gt_list[id].clock_freq = gt->info.clock_freq;
> >  		if (!IS_DGFX(xe))
> >  			gt_list->gt_list[id].native_mem_regions = 0x1;
> >  		else
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 45ec20c2765d..5156bac84f20 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -248,8 +248,8 @@ struct drm_xe_query_mem_region {
> >   * relevant GPU timestamp. clockid is used to return the specific CPU
> >   * timestamp.
> >   *
> > - * The query returns the command streamer cycles and the frequency that can
> > - * be used to calculate the command streamer timestamp. In addition the
> > + * The query returns the command streamer cycles and the reference clock that
> > + * can be used to calculate the command streamer timestamp. In addition the
> >   * query returns a set of cpu timestamps that indicate when the command
> >   * streamer cycle count was captured.
> >   */
> > @@ -266,8 +266,8 @@ struct drm_xe_query_cs_cycles {
> >  	 */
> >  	__u64 cs_cycles;
> >  
> > -	/** Frequency of the cs cycles in Hz. */
> > -	__u64 cs_frequency;
> > +	/** Reference Clock of the cs cycles in Hz. */
> > +	__u64 cs_reference_clock;
> >  
> >  	/**
> >  	 * CPU timestamp in ns. The timestamp is captured before reading the
> > @@ -381,8 +381,6 @@ struct drm_xe_query_gt {
> >  	__u16 type;
> >  	/** @gt_id: Unique ID of this GT within the PCI Device */
> >  	__u16 gt_id;
> > -	/** @clock_freq: A clock frequency for timestamp */
> > -	__u32 clock_freq;
> >  	/**
> >  	 * @native_mem_regions: Bit mask of instances from
> >  	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
> 
