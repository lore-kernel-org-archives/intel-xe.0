Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35E1C47077
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 19:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D30210E524;
	Thu,  4 Jan 2024 19:15:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976B710E524
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 19:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704395707; x=1735931707;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kFlJyHspHvOQRLb2T8VdU8pDwIJCeznInXOiJWZzj1A=;
 b=VxVlLq3A+KRP9PNHCA4IgdNm5UckDY/dkbJ3493xDdP2gYIaQBMOObrN
 wodIOMMUsQDRQWklxeq2+XixMg+x6nf2xWQvfJ5cNeWzDO+L5TMveZaf0
 6uyKqU7ISdBCJ1nMdE09Egqbje0wknCQMyiuxCi9OADfvgx90CVmAK+TV
 zz4Whpe2kVfN+l3Skk4lG7SGS49gHPWzG3obaYtMCDLsfLbsXPhPd3S0O
 tPmeVpdemyp3MURuyHj7LbdEpWmiZFDh3eUsodtbLyVoezdvpdDmkVqI+
 3G/WqTEqOI5h9uoL/qkLwJdn8altscfocQIywX3Gj1xWfz6Ox78n7+DSU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4711024"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="4711024"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 11:15:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="22602910"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jan 2024 11:15:06 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 11:15:05 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 11:15:05 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jan 2024 11:15:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgnwQEFciIAYnDgqKujPrkqy/UWuTzHQJVF8GJv5XPYh/07F14qjfkAxUvoR2kf2MVvI7EZYfj3RfFLC2MmmnigusYkT3WVE6aJD6n9y1++HaalAECDOcWVs/mLbikF3X9gooBDtxyFAMf1Ip3Bx0qakNqoje6r2iGUD8hxHFyDqjXJlxlA1bQp9LFu4M/BHAiaLG3FlcLprvZ5EizjuqtRUTqkpGCOvdBVegajJFrB7c8j6YvczN9OYR7CiBrTEYUhbRSgZjQqO0RaJsz8htoO9erbUNk1qAKj+H0IPCrUZ1LCAxfmSImk+OiDs6lbzJ//2bVJX20lEiW3WAWCO+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpE4qrEtZSbudbDMWy3PN6BZYwkiArQjVBOEJHQZT0Y=;
 b=hjNF7QnDo4VjWzHvu4AECO44N5nzJYP1kMz6O7mydnRQ4iwqiJxA4tvXdAR7qRAOzZVB85uKOXNT83AOW2QokvJdHQ8RJH8CwePgvRNcMkVaZVwx6MmnrqMdveMhIUEJGbQp8WLymqv8W4SyhGX3+WjzVkZeV5NgrTWA+Zrjge1xsIiSHvH9dysbi/5KJ9zZXVW70D2R14mCj7Aps+lD3PUlK6UZNuISUKYJBjq3AIlc4o7cjiR/ZtJsmFMxBrgKrZ1PawB8Yh3m143xd14pRmxiHaMwGP9ssEXKfCn08NObL+SL3kdVuP3Cl7Eb/M4Vt5pIDvSjhdfeojlTNl+Nrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6431.namprd11.prod.outlook.com (2603:10b6:8:b8::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7135.25; Thu, 4 Jan 2024 19:15:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.015; Thu, 4 Jan 2024
 19:15:02 +0000
Date: Thu, 4 Jan 2024 19:14:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [PATCH v2 3/5] drm/xe: Add exec_queue.sched_props.priority
Message-ID: <ZZcDhBc72rWVB2pm@DUT025-TGLU.fm.intel.com>
References: <20240103184408.17844-1-brian.welty@intel.com>
 <20240103184408.17844-4-brian.welty@intel.com>
 <ZZbg+5FsDPhvGzn+@DUT025-TGLU.fm.intel.com>
 <0cf6e9d0-a3fa-44f0-98e7-5cedb882ebe8@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0cf6e9d0-a3fa-44f0-98e7-5cedb882ebe8@intel.com>
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d034435-5095-41bf-7a47-08dc0d5973ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KpaKUrI8ZkeVnfgMP2/QALm4LI5Szw6I/dDwsUSL2mI+Y/kUzia0xF35iwKAQIoj06RVq8VKzyvUYq4gjJlI2SXPbLywdqrQ1yD8uOZQeaTEpI9+x/bd4voEX+HGRCgm3kA7v+h8XQgAPx5bwcembefqOpS79RNe/hz9Tn9pfrvaqXfrpOFcPvtPXZ2QMiYQRf/CbqmE0ml086+HidUuMv3bwcjyTK+dhLcOxH7D9MLcLCAUQXSxN0v/hwaO0b75gFn6HiQQ74fTN3qqdk3Me7WYo176u6ExTA1wqECqHBpgyNjVmf30619E00uRX2qqsSknQLg4lst+6F4z52HudwbHBvdDakJrqCf6ekbRp2HZkrkQrwJ/at1r6thXWjjFEdQ5qZTx5TgNGNMRubrmyzgb3vsnwXNJuGKy40gh+rNIkuGeB6CQhTucRdOth580hKZtEXVVmLCJAIEFs55KS3KAB69JLUPPB2LvZbON2DWPU7TdHl2cdm4zb0du0ScC7o1SbStv5OIkYtaGwFFJ3er9r1xmnEGJWnF7yM3f2DCLB6Oj+6tQBhLpl0ES6szj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(66946007)(6506007)(66476007)(66556008)(478600001)(82960400001)(6636002)(6486002)(6666004)(6512007)(38100700002)(26005)(316002)(53546011)(83380400001)(44832011)(8676002)(8936002)(4326008)(6862004)(2906002)(66899024)(5660300002)(86362001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kzT8UFBZ2U8hR9cMKOp6P717d+Ho5rvMg3yyTgVJ0Ywgc6iM/xwfWetL4Sbb?=
 =?us-ascii?Q?24hiS/oIsdePon+Pt08yyUWyfNs29jS6keMaYvMGvmZhg4TY0/1ZO5pfCuOG?=
 =?us-ascii?Q?SZuIiB+pPLWGM09EBDsw3iqUpuqkNWz7b5O210Arq1aWI2EQIqUpS1R6eccM?=
 =?us-ascii?Q?h9qxjnWxDMHZXn94LbWkZMPebqfpkAMnr7xNHyXfNih82XK+Z2Dl+nq5h+WR?=
 =?us-ascii?Q?12fvWemen2/T3ryq2kBmAHq6RjNG85R8+xi5LzfYOSLmOodAT8KD0Mnsmdnh?=
 =?us-ascii?Q?CyGBd1xwMXLUmkzWX3TMExLoqbCZXckxihNrF5sGAuUOUgTTIR7ukFV8IYMA?=
 =?us-ascii?Q?sjmwWjithFYaE2eQ4SvcqOfdVaoDdf8khkWMOmVZ2VMiPz14eSSCWVtbL5U4?=
 =?us-ascii?Q?dNdU+UmXJPpEOxsTROpUu0LZ56RTSpw+2pB43tolLTPhuPZTfdJWmD1CflJy?=
 =?us-ascii?Q?RslPH2Gnc6CoAuF+yicxBtFzLSYVDyCW+NDeGwOuiFjuEMAhS9+e4iCjw1AR?=
 =?us-ascii?Q?1ebGiBHa1mykQK8nxI47OW+ELZp6NuGRy6MpsU5j1z7FA3/OVQkqQG24fmLY?=
 =?us-ascii?Q?KB2+ZDJ2if56hx6Bl/0jerOh5+BQessw4zLxsT6U3uOHyMzmDJAKSUWZ6rfc?=
 =?us-ascii?Q?ukFquvuU5uAHBbJOXKCPToDfaQ9+z9DTeMKFeeqzh6FNAmfT2Y59hZdJi49g?=
 =?us-ascii?Q?LntxlfIJJF2w79QgoaEKqFJGXfeAo/Zi69iQtwuI2lDHYthH5Pw3JdYxGFqT?=
 =?us-ascii?Q?y1j4TZK45GV3BANY9RqcPcWju+zfptUAtqLkBMK636UJyzHrGG06h/5kspio?=
 =?us-ascii?Q?pDy5YjspAwDwStIQNFAhGDMZG5OgxhOn1FJXpQJzmrLFHNH/oXqzomKT9WGO?=
 =?us-ascii?Q?MuOQ9lDCL3VKwQqZy3JEdC9JnoGOmDcW0JOeos22Mv/P+CiZtGSZAKn0qYur?=
 =?us-ascii?Q?kFc1GjbfTuD1ZJyCexWIj08U/XlmX8qIXah1botsvQRLN0NI0Jt2LdsvuWy/?=
 =?us-ascii?Q?DaOTZOW+epWUBuVaycoZMZNQ2S/maeTyk8M7xJMTO55fbX6GJRkaWyGNFyd2?=
 =?us-ascii?Q?i6og9NuicMJ3TcoqiO5O1UcyEanFe0+LuKcauB/jpbqeMwCxAuZqFn/lqvcs?=
 =?us-ascii?Q?f4GEt1S6s7rOuK/XxUd9+FR5zKYj4o+3lE5EpN6T46OQV21YiEJ+njoCEULn?=
 =?us-ascii?Q?8Ga/QHLIZXm97n5H5oVoRWh7rpP8shkUaEbOl5Ne4E9n2WXOvQCilB+PBAZg?=
 =?us-ascii?Q?jAfx8FalbpOKRjZo7u19mwb3m4rSz2oZBwdf6T7uHg0YaWPZ7+X/kfdjXU6H?=
 =?us-ascii?Q?R52gn9KrhteuNKI16u3zFfyLVYrZuKUqC3UKfw7zeaXBDmnNy4+6UfI3kLb3?=
 =?us-ascii?Q?DPITzwiLBoXxa0o9iqziE3kKzLYjUDbJ3X3hs+bnKZa0hAYYTPuYnm3ASxmP?=
 =?us-ascii?Q?wHIjHbnUG9K/vUQ2RaKCUr+D5fdQDyMQNE+xu8vMheQtT6v/vSntc1JJU+8x?=
 =?us-ascii?Q?pPPX94SpDMMPq428HDudLYuMxeUVYdfknOrNQBOndO2ML1JF/ZsDYcITKxB2?=
 =?us-ascii?Q?JiErbSKDOyyIZdmLPl+suziDBJLtirfIYMjUDTN1M3qiBb1WGFjeMgMzFz0d?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d034435-5095-41bf-7a47-08dc0d5973ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 19:15:02.5822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZ4CW6vELox/bLEy0Cz0nMas2qP/65YFWJVDvPwj7/aXAkubmeHq5xBsRoRbZBpdbxnFUZmUq0sZI2h7tbcmkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6431
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 04, 2024 at 11:03:44AM -0800, Welty, Brian wrote:
> 
> 
> On 1/4/2024 8:46 AM, Matthew Brost wrote:
> > On Wed, Jan 03, 2024 at 10:44:06AM -0800, Brian Welty wrote:
> > > The purpose here is to allow to optimize exec_queue_set_priority()
> > > in follow-on patch.  Currently it does q->ops->set_priority(...).
> > > But we'd like to apply exec_queue_user_extensions much earlier and
> > > q->ops cannot be called before __xe_exec_queue_init().
> > > 
> > > It will be much more efficient to instead only have to set
> > > q->sched_props.priority when applying user extensions. That value will
> > > then already be set to the user requested value. So the setting of
> > > default value is moved from q->ops->init() to __xe_exec_queue_alloc.
> > > 
> > > v2: fix existing bug such that q->sched_props.priority is now set
> > >      before guc_exec_queue_add_msg() (Matt)
> > >      fix existing bug in that xe_migrate_init() should use exec_queue's
> > >      vfunc for updating priority.
> > > 
> > > Signed-off-by: Brian Welty <brian.welty@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_exec_queue.c       | 1 +
> > >   drivers/gpu/drm/xe/xe_exec_queue_types.h | 4 ++--
> > >   drivers/gpu/drm/xe/xe_guc_submit.c       | 7 +++----
> > >   drivers/gpu/drm/xe/xe_migrate.c          | 2 +-
> > >   4 files changed, 7 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index e78b13845417..9891cddba71c 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -67,6 +67,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
> > >   				hwe->eclass->sched_props.preempt_timeout_us;
> > >   	q->sched_props.job_timeout_ms =
> > >   				hwe->eclass->sched_props.job_timeout_ms;
> > > +	q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
> > >   	if (xe_exec_queue_is_parallel(q)) {
> > >   		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > index 882eb5373980..6ae4f4e2ddca 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > @@ -52,8 +52,6 @@ struct xe_exec_queue {
> > >   	struct xe_vm *vm;
> > >   	/** @class: class of this exec queue */
> > >   	enum xe_engine_class class;
> > > -	/** @priority: priority of this exec queue */
> > > -	enum xe_exec_queue_priority priority;
> > >   	/**
> > >   	 * @logical_mask: logical mask of where job submitted to exec queue can run
> > >   	 */
> > > @@ -144,6 +142,8 @@ struct xe_exec_queue {
> > >   		u32 preempt_timeout_us;
> > >   		/** @job_timeout_ms: job timeout in milliseconds */
> > >   		u32 job_timeout_ms;
> > > +		/** @priority: priority of this exec queue */
> > > +		enum xe_exec_queue_priority priority;
> > >   	} sched_props;
> > >   	/** @compute: compute exec queue state */
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 56c0a7bf554f..392cbde62957 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -421,7 +421,7 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
> > >   {
> > >   	struct exec_queue_policy policy;
> > >   	struct xe_device *xe = guc_to_xe(guc);
> > > -	enum xe_exec_queue_priority prio = q->priority;
> > > +	enum xe_exec_queue_priority prio = q->sched_props.priority;
> > >   	u32 timeslice_us = q->sched_props.timeslice_us;
> > >   	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
> > > @@ -1231,7 +1231,6 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> > >   	err = xe_sched_entity_init(&ge->entity, sched);
> > >   	if (err)
> > >   		goto err_sched;
> > > -	q->priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
> > >   	if (xe_exec_queue_is_lr(q))
> > >   		INIT_WORK(&q->guc->lr_tdr, xe_guc_exec_queue_lr_cleanup);
> > > @@ -1301,15 +1300,15 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
> > >   {
> > >   	struct xe_sched_msg *msg;
> > > -	if (q->priority == priority || exec_queue_killed_or_banned(q))
> > > +	if (q->sched_props.priority == priority || exec_queue_killed_or_banned(q))
> > >   		return 0;
> > >   	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> > >   	if (!msg)
> > >   		return -ENOMEM;
> > > +	q->sched_props.priority = priority;
> > >   	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
> > > -	q->priority = priority;
> > 
> > This probably should be its own patch and maybe with a Fixes tag too.
> > 
> > >   	return 0;
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > index adf1dab5eba2..f967fa69769e 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -356,7 +356,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> > >   		return ERR_CAST(m->q);
> > >   	}
> > >   	if (xe->info.has_usm)
> > > -		m->q->priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;
> > > +		m->q->ops->set_priority(m->q, XE_EXEC_QUEUE_PRIORITY_KERNEL);
> > 
> > Same here.
> 
> Okay, will pursue....   but then I guess I'd rather pass a new flag into
> xe_exec_queue_create() and just set the priority upfront rather than use
> the vfunc to modify it here later.  Will code it up and see how it looks.
> Then don't have to deal with the vfunc possibly failing.
> 

This vfunc shouldn't fail in practice and if it does it actually does
not matter. We might want to audit the xe_exec_queue_ops return values
and change some of these to void.

> Would it be wrong to simply always use XE_EXEC_QUEUE_PRIORITY_KERNEL
> for exec_queues created with flags:
> 	EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_PERMANENT
> ??
> 

It seems like this works for now but need to careful going forward to
make sure assumption is correct.

Fine with it either way.

Matt

> 
> > 
> > Otherwise LGTM.
> > 
> > Matt
> > 
> > >   	mutex_init(&m->job_mutex);
> > > -- 
> > > 2.43.0
> > > 
