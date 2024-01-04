Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F756C47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 19:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11A510E50C;
	Thu,  4 Jan 2024 19:25:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7D910E50C
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 19:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704396328; x=1735932328;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=P9lECFY20u2emnK0kxR0J91SfuiwjW2mjIWFdE3woqE=;
 b=Jq6VT6Uufte408DiJGFCuQSBx1uVksqeOWF5o/A9YR+8yzOhTzuCpckt
 8IPKzDAZB+J5NUlC2GbjwNcmagkLzcyZf4KyaAgOqRlBt2a8mYqhgmGZf
 oCnPXqy3U02YopdiAEUr+egz78mBvScWcTL9DnR7/AzrhVh7flqnyyv5+
 3YKihrhHoUfNieSFg1XSJKkEqN8UvgJjGESgwXAxOMydJn+SL4rErxMkC
 BJBzWTqaZJlDb1kiYcEKegPThGL3grTRGOzyM0bd5Q1o9XACAt9acoBvC
 ioFg6eiEyqUmowBISujXBB0OA6pmpCMKyZp1UcgIenQjNtZdZOqcGWoAt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="394519208"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="394519208"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 11:25:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="924014069"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="924014069"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jan 2024 11:25:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 11:25:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 11:25:27 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jan 2024 11:25:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjcYI8Aa+EAHyYjhCHcJb/4wN0uz6jFpMme7pvRXIOjTnRN4VI1UkSG6dEVVg1dkr1dXCJRqzJAGKz4MqLIjnLmqB6BT3bRKqrtpQYfXsUAx+IGL0xFQIElsYohZPC33AIYKEZR5aVuIUywkpd8uyRmmygPhzvU0riCMsXRmzI4ANPG8wIe7fsCE3JUnXGAuGMnIl33twx/Ze71FOjMOyU86yPcujcH1bhYN0IsXonjva+YZNoqYBiJH6vlsAW5MNVf71vdlSahVsqRgFB2KLwzpgbuWVU/yecJ4CHWOt5XJEvZSS4YB8pPp300j4WTzVAbq7IpkEa5iACtyXZn+VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6EDXIQvlzDO8j8EvhV7rO1JwWKFoTacesmr+HH6Ihc=;
 b=LbKiEQDfjlpwFrxazHIr0bZT0YKbWORrxgXfqW0WrUG6s1/gsdHi4vNwZtD3hT3p/wagc/57+foWY1Wi36YlV/DrGuffpiDmsFpXzwhA2ZWJENYSq/qIcUvBBDVFfOJ1yTZ/K6noZyn8zaf1ukci5t/c2nMR8dOmMcOKJ5TYjnl783P7me/nUhPhrk36sd807EOkWAO2XSmvZGLjcIsKWMeqUET9MZK511SjCSJmZtlwjfB0p/yWEy0lZdoeV4eigJsZ25uZ1VR6pICo+h3Y92j/CvWILEGI+TCIDoQBpESbS4i8cuLl5GV1IaEWPQ+eDKz0wh2ylkof9JPj5vow7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8572.namprd11.prod.outlook.com (2603:10b6:510:30a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Thu, 4 Jan
 2024 19:25:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.015; Thu, 4 Jan 2024
 19:25:25 +0000
Date: Thu, 4 Jan 2024 19:24:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Subject: Re: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
Message-ID: <ZZcF8yl2ZNH9gxEC@DUT025-TGLU.fm.intel.com>
References: <20240103123826.2386219-1-priyanka.dandamudi@intel.com>
 <6eaf8e85e9a99ab33de51def3fde72505da75433.camel@linux.intel.com>
 <CH3PR11MB8434FFE4D37A01C7FE5B3A4A8D60A@CH3PR11MB8434.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH3PR11MB8434FFE4D37A01C7FE5B3A4A8D60A@CH3PR11MB8434.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR17CA0008.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8572:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc1090a-7319-4c26-51e9-08dc0d5ae6f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q6kbylQZcXJugo5DYUJIXsREOO541mr52uie9bbz2GzJLGgx3nlVFAd6N3suVr8fW+T1BsCd8sKANQa8Whwswuy9GINnxDXq11u97nYGt/CwFpTea7BjF0A91XHLY/JCfNV+qL9qZkeCZIA0LyBgP70p1kB2frJPKrv0WurXlS9r+7591O1rUDfZUGB5ujN7SeaHZfb5aFXmLpFE3EFCE+AXl+uhSmh8pzAXJoyYIJapvWgXeYDhthMOWQDcIUKAHzIxIrdAK/8wJsMVCPG4cwuc1qnYCoj//QFcnAqsXf//IeyD4T4YZ9OeDuK4BPHTGqSlTS00A433tWKIGieh6CvkL55sbhQn5iPZKq8cvqKdBtHo+6/x4pwZr5PmpG7G/uc93xn+ALcakGGbSXHtXCtRQUTC1lfjCFVP3slkVX5SAL5Ff5rhlAHT82XWMdqf05V49ZLs7pnMTUcEVltzM69M5vLS0Lkshp69QzBJQGRMk9o1KwzKiyN1saI9GIl8YDUPJ6O1PT8JEpwPxMn95wPCyArySmQSi5yK9mcTvY+EVfWqQfCPsV0sM+qik3Pq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(346002)(136003)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(26005)(82960400001)(66574015)(66946007)(38100700002)(83380400001)(54906003)(66556008)(86362001)(6636002)(66476007)(6486002)(316002)(478600001)(6862004)(5660300002)(2906002)(44832011)(4326008)(8676002)(8936002)(6666004)(6506007)(6512007)(53546011)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Cu9MMYYcOPTxrYZAwZoYlyGTwburokC5SMPQ9ldJYbSD8WpFTIst49liFL?=
 =?iso-8859-1?Q?gptfjYICGa2AoekvQ6jY3BwLQmHaIZCWDl9wta4Lrynid03aOP8dpfsDt4?=
 =?iso-8859-1?Q?1mNsBNO5dgZr/X/RF6V2yT6kZrO3maiQR9UYGEHe+/kDTYG/orF0A6MjA/?=
 =?iso-8859-1?Q?bhpRCxnIkyC0yMCyG/b9RQZ2ZVDwSbVqDw5eUwQ9bU/ujjzn7NUi2pHqMf?=
 =?iso-8859-1?Q?2KFv0Wu1r0e21n3j2CGrCOKJxGBlZqf7v3QiQehADoc//RrhIjHJk19LKj?=
 =?iso-8859-1?Q?R59JyShJ36jRYGbaeO8ydGr/9YKe2+SSVdgA5+Lv6N+o3TTlwF8yy3WFox?=
 =?iso-8859-1?Q?ZchLcT0muaAWOfJYhChQjiX98oHEL8mDqwxhE6+sHyR6hmGze7AKIpqwAE?=
 =?iso-8859-1?Q?AxyC1EH1Fke4JsROUBl04kmeqnhZHhhJB1hYgCIcyHMmcOfqOyFS3g0xOv?=
 =?iso-8859-1?Q?CO8h9X7ZE64szYQd6axIuOIb0j43Itd2+baE1lLPxzDAth6hc0h3mqFHzt?=
 =?iso-8859-1?Q?S1mRAOUL8w3kJ+x8ksmEuIhBlFfxK4oQSVXFq5AtQxRnN+GEw+U5OEmoUK?=
 =?iso-8859-1?Q?wBFZ5pcSfITCptOTHVsUKiBuKF8pkPNhA9iE6FEZ8/nmJ5eSQwZRyoVqFs?=
 =?iso-8859-1?Q?LabX5DRyAr9rz7gBRy4ibJBSE+hYrXZGp72x6kaUZ2jIBPg3pY4sMzIkiI?=
 =?iso-8859-1?Q?Y5RoLtfJOFPwHoKiEBAlv9uq1IvyVzPYpAjr9F9NxZ1homeLBOfFVwJvtx?=
 =?iso-8859-1?Q?EAI8YNx9VMCHMVAhwo+M6SVnrKUIhdFcJyavBpeCEBrJwEjtGmsh7rgneK?=
 =?iso-8859-1?Q?LfPRl3GdoqILvSGwot3g5JjmKwdA5CLfxisc9zOX6QMt60gKF7po2DDd5H?=
 =?iso-8859-1?Q?oChkAUU1wpowxtpQqpCYBSAq3TjhOSj/ORm9IcDl8AlA7rOVOPg+pYwzVH?=
 =?iso-8859-1?Q?c9oYXUqXpcFC4W3Ze9paOw53I+BzXyAz+zaPJGTUmvjT+j+9vWl2ow1BJ4?=
 =?iso-8859-1?Q?OclyQnSiKQpEG14CY0OwTHDmC+AQffEUxqtmOb/13R6zI67hLPuJ9/3a0j?=
 =?iso-8859-1?Q?gEP8uwWi4ad/hlIRsFWR0rLk65bGDfwH8ThIaCf6qrEhnD2+eNL5tXhQbN?=
 =?iso-8859-1?Q?iUo3PFYCEVJ8llXR5IwdupODgGyv8A03s4k86iVEC6XgVrDgWVpkqjvU0j?=
 =?iso-8859-1?Q?Rwj2E7XmbNPg5HGLUdXf8hpKlV7qFYWehbhH8vIq6Q0elQZyxxLe56CeQS?=
 =?iso-8859-1?Q?CtyYvuWIv2QDxBsqoBZDZLikKTU3z8ojtaD5Du00JEU6YLPrzKmwQifFBt?=
 =?iso-8859-1?Q?G1X6j1yjhA0ceGtxXSq27C+2cXxDpdmZgoQZ7QfD3giiT1EhXJMgbvAtiA?=
 =?iso-8859-1?Q?T1zk6nv4FzmzVZne2dGgzzcKBrelhEBZhAJpXsuJhE9r3RvZpDpmjYQo1t?=
 =?iso-8859-1?Q?0fq/MO0w1YX8gL6twBwE7Dz464FnK5B9JAtfxIRdrbBmZeNtyTJGuic3lE?=
 =?iso-8859-1?Q?pU292tNezkdcBhejtBYIKauvsVRdSOfPIS0Ek0TlADDOJmaQihQ5lYvC0f?=
 =?iso-8859-1?Q?zwMsAD62iUbEkFVVe73X3q9ySbCNxc4ed9ST7HSsMrrWXXD4zjvOUpni6N?=
 =?iso-8859-1?Q?xAEq83TLw4qxnU7DVjKb2I6BFh5RDuc5rnT2KyyYKFkdhxtHvSNeq95w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc1090a-7319-4c26-51e9-08dc0d5ae6f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 19:25:25.4193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xuyiFouBnu/rJcKBWcrQW8bqD1U+hkG5awnoiEgcjZF+riFUdfRrnovhYpHOARE8VDcEO6QDJfEvXTBkfBafBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8572
X-OriginatorOrg: intel.com
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 03, 2024 at 02:19:52PM +0000, Dandamudi, Priyanka wrote:
> 
> 
> > -----Original Message-----
> > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Sent: Wednesday, January 3, 2024 6:52 PM
> > To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; intel-
> > xe@lists.freedesktop.org; Kempczynski, Zbigniew
> > <zbigniew.kempczynski@intel.com>; Zeng, Oak <oak.zeng@intel.com>; Welty,
> > Brian <brian.welty@intel.com>
> > Subject: Re: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
> > 
> > Hi, Priyanka,
> > 
> > On Wed, 2024-01-03 at 18:08 +0530, priyanka.dandamudi@intel.com wrote:
> > > From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > >
> > > Enhanced xe_bo_move trace to be more readable.
> > > It will help to show the migration details.
> > > Src and dst details.
> > >
> > > v2: Modify trace_xe_bo_move(), it takes the integer mem_type rather
> > > than a string.
> > > Make mem_type_to_name() extern, it will be used by trace.(Thomas)
> > >
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Oak Zeng <oak.zeng@intel.com>
> > > Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Brian Welty <brian.welty@intel.com>
> > > Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c         |  3 +--
> > >  drivers/gpu/drm/xe/xe_drm_client.c | 16 ++++++++--------
> > >  drivers/gpu/drm/xe/xe_drm_client.h |  2 ++
> > >  drivers/gpu/drm/xe/xe_trace.h      | 24 +++++++++++++++++++++---
> > >  4 files changed, 32 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 8e4a3b1f6b93..f7075fd86547 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -713,8 +713,7 @@ static int xe_bo_move(struct ttm_buffer_object
> > > *ttm_bo, bool evict,
> > >  		migrate = xe->tiles[0].migrate;
> > >
> > >  	xe_assert(xe, migrate);
> > > -
> > > -	trace_xe_bo_move(bo);
> > > +	trace_xe_bo_move(bo, new_mem->mem_type, old_mem_type);
> > >  	xe_device_mem_access_get(xe);
> > >
> > >  	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) { diff --git
> > > a/drivers/gpu/drm/xe/xe_drm_client.c
> > > b/drivers/gpu/drm/xe/xe_drm_client.c
> > > index 82d1305e831f..e845b7f22e38 100644
> > > --- a/drivers/gpu/drm/xe/xe_drm_client.c
> > > +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> > > @@ -15,6 +15,14 @@
> > >  #include "xe_drm_client.h"
> > >  #include "xe_trace.h"
> > >
> > > +const char *const mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
> > > +	[XE_PL_SYSTEM] = "system",
> > > +	[XE_PL_TT] = "gtt",
> > > +	[XE_PL_VRAM0] = "vram0",
> > > +	[XE_PL_VRAM1] = "vram1",
> > > +	[XE_PL_STOLEN] = "stolen"
> > > +};
> > > +
> > 
> > Please use xe_bo.[ch] for this, since it is related to the buffer object
> > placements, and the Xe placements are defined in xe_bo.h
> > 
> > /Thomas
> > 
> The above is already declared in this program in show_meminfo(). I just moved of it to make it global.
> Is it required again to define it in xe_bo.[ch]?
> --Priyanka

The change to trace looks good to me. I think Thomas is saying move
mem_type_to_name to xe_bo.c and extern to xe_bo.h.

Matt

> > 
> > >  /**
> > >   * xe_drm_client_alloc() - Allocate drm client
> > >   * @void: No arg
> > > @@ -131,14 +139,6 @@ static void bo_meminfo(struct xe_bo *bo,
> > >
> > >  static void show_meminfo(struct drm_printer *p, struct drm_file
> > > *file)
> > >  {
> > > -	static const char *const
> > > mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
> > > -		[XE_PL_SYSTEM] = "system",
> > > -		[XE_PL_TT] = "gtt",
> > > -		[XE_PL_VRAM0] = "vram0",
> > > -		[XE_PL_VRAM1] = "vram1",
> > > -		[4 ... 6] = NULL,
> > > -		[XE_PL_STOLEN] = "stolen"
> > > -	};
> > >  	struct drm_memory_stats stats[TTM_NUM_MEM_TYPES] = {};
> > >  	struct xe_file *xef = file->driver_priv;
> > >  	struct ttm_device *bdev = &xef->xe->ttm; diff --git
> > > a/drivers/gpu/drm/xe/xe_drm_client.h
> > > b/drivers/gpu/drm/xe/xe_drm_client.h
> > > index a9649aa36011..4e33d0981b6a 100644
> > > --- a/drivers/gpu/drm/xe/xe_drm_client.h
> > > +++ b/drivers/gpu/drm/xe/xe_drm_client.h
> > > @@ -13,6 +13,8 @@
> > >  #include <linux/sched.h>
> > >  #include <linux/spinlock.h>
> > >
> > > +extern const char *const mem_type_to_name[];
> > > +
> > >  struct drm_file;
> > >  struct drm_printer;
> > >  struct xe_bo;
> > > diff --git a/drivers/gpu/drm/xe/xe_trace.h
> > > b/drivers/gpu/drm/xe/xe_trace.h index 95163c303f3e..196d277795a0
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_trace.h
> > > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > > @@ -13,6 +13,7 @@
> > >  #include <linux/types.h>
> > >
> > >  #include "xe_bo_types.h"
> > > +#include "xe_drm_client.h"
> > >  #include "xe_exec_queue_types.h"
> > >  #include "xe_gpu_scheduler_types.h"
> > >  #include "xe_gt_tlb_invalidation_types.h"
> > > @@ -100,9 +101,26 @@ DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
> > >  	     TP_ARGS(bo)
> > >  );
> > >
> > > -DEFINE_EVENT(xe_bo, xe_bo_move,
> > > -	     TP_PROTO(struct xe_bo *bo),
> > > -	     TP_ARGS(bo)
> > > +TRACE_EVENT(xe_bo_move,
> > > +	    TP_PROTO(struct xe_bo *bo, uint32_t new_placement,
> > > uint32_t old_placement),
> > > +	    TP_ARGS(bo, new_placement, old_placement),
> > > +	    TP_STRUCT__entry(
> > > +		     __field(struct xe_bo *, bo)
> > > +		     __field(size_t, size)
> > > +		     __field(u32, new_placement)
> > > +		     __field(u32, old_placement)
> > > +			),
> > > +
> > > +	    TP_fast_assign(
> > > +		   __entry->bo      = bo;
> > > +		   __entry->size = bo->size;
> > > +		   __entry->new_placement = new_placement;
> > > +		   __entry->old_placement = old_placement;
> > > +
> > > +		   ),
> > > +	    TP_printk("migrate object %p [size %zu] from %s to %s",
> > > +		      __entry->bo, __entry->size,
> > > mem_type_to_name[__entry->old_placement],
> > > +		      mem_type_to_name[__entry->new_placement])
> > >  );
> > >
> > >  DECLARE_EVENT_CLASS(xe_exec_queue,
> 
