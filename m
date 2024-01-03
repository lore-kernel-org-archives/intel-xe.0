Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC56DC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 18:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE4710E1A2;
	Wed,  3 Jan 2024 18:30:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2533D10E1A2
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 18:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704306654; x=1735842654;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yUN2EHCeVxCxxhZHeZNo6ZRFolej8bghs0j5t9Q4UEc=;
 b=iSmJtysgPP1rzyFkTwIWC2aVpo0e6C5MBxzb3iO/j6E+oJXx0yvtoluD
 5jDToUbaEbdMGquWpLIURte5LAxKEN02F+rrjKhb/QSzg4S8SxLaQOEZa
 Vpauy7KVoM/wlh5rYdYgkgbQSVkVoMFDfkW50YtQKwK294UiM2Qyf/zWB
 ExkfjBud4kGrj5JRekylH+pVxDU8h2paKJag8OgbkkR0tASiJUIpqWxkm
 dPREcd1dEF0vddVJy7aCD4TQyUad1GXajRSJN+Fpuo/auMt9+mUcCqjYF
 /JSKpUKHraX68gn8KeTzj8NKKnPCNzkU6iu+qPJ4q4zaR69QgehjnauwZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="3813862"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="3813862"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 10:30:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="729855130"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; d="scan'208";a="729855130"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2024 10:30:53 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 10:30:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 10:30:53 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jan 2024 10:30:53 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Jan 2024 10:30:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YeJ3mdoQdBv6LhkqIpnS0DGmGXK2Xf447MV4JiEjF+baqbibfrKknzFqMC2sOZ77gKVHPBKa71XPooTCxbp3MIjjw3Stw/2s77br/1mer2XEBo2+9lGnOTw4YIJABCl6JFh0xrD4bR15UT1JWMuqUXijksVDCO4Mn3/dxCzmSSG8eW1XIwD0o82c/Qstnc23ioyBE3qtZZ4u7xN6Xj2NDERI0GxaR8eAbuVZq7U13NEhqJUu74MG5aHxckI4qzIE/bWBgf4MAUBXJmNrJSGHhewJCgg5IbCxXxEO9zrTHpKcqn7bMkRQnOBM80Ff0y3Q557s97YJu9WJouWC+/BOfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsehNRzy85DaaxJWu1urokDUp4C3gBx85sgipEyhIG4=;
 b=IafJ/w5rfhcm4WcUz9HF8xGPjYmIkXSYQJDXY0i+SFQdxd0KrRmd/rxLceOMlZhNixHiUptGhq4KpKLI3Go98Gu4++vaJOL3gUo07Wv/qrrZBSa9DgnnLC6ERdeyXV9M6qygncKDZZjqestrD1jWOKYu2AA4xTJ2XEnPeEYmKVllHOjbOUEjcHWQ7JF1xrcbce+KmbAb/1wsFgSNBsG0gflE+pmBYFQ8g1Wjz6hgKlx3CMEt6n79ZYzsYxxyH7S5LOAjKLiApnyd5d38WlG8JQ5C+0NLuI7cLF+AcACbKxExdB4ciNamJGZI/aT6Pe0gCamVcPxK5TPfybNozZ8bxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5149.namprd11.prod.outlook.com (2603:10b6:a03:2d1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 18:30:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 18:30:48 +0000
Date: Wed, 3 Jan 2024 18:29:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [PATCH 3/4] drm/xe: Add exec_queue.sched_props.priority
Message-ID: <ZZWnmkPgJKed8Cc3@DUT025-TGLU.fm.intel.com>
References: <20240102211731.6720-1-brian.welty@intel.com>
 <20240102211731.6720-4-brian.welty@intel.com>
 <ZZUWuCOF5TedDHV2@DUT025-TGLU.fm.intel.com>
 <0b6616d8-7ffc-4ab9-bcba-eb13bd29cb7e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0b6616d8-7ffc-4ab9-bcba-eb13bd29cb7e@intel.com>
X-ClientProxiedBy: SJ0PR13CA0144.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5149:EE_
X-MS-Office365-Filtering-Correlation-Id: 5194d744-99b4-4dad-e0f8-08dc0c8a1b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rc8wYdxV2SVVs54uDV/HLLxXPzONwUBjdY9G9yjC//3vwoX9PWsiKiQmzZci7mnP8z1zE5XUIb7sSNHebGHZmDp2IkSErnhdwX9O3Gcnib7xexmEAX7DEz4PNeeRlZuWsfSOA8iXlJKJOmU88FnmV8Xx2OQYgbWTfZZLNnDYEyQjJR3xzgfVzpgpo7OK68w9/cmT4pylpmlh2lnUwezN9aAenfOu+XDP3EDLC9YLBUhNPCcUHDkqdZWEL3s9gmwHLx9XUp6P6ZxuGe1in+VLkVEVFJ4a/CJm/SOGvkpKvgUm9pvEe/ftc3KxiMLKEIeyaoyF28wz1VldHKhKf8aWtRUgSpex2mvzgHyBsJxPyqnuwgQRZlt+ydKMg5mQLXZvliOpUq6YeTASIGtNzRWWyfH/cqQo6kYioqKHMmynD5J2N/kSRU6XJPtNSpaELXTWeUh6OOdANSjkuLmQrNHtNeMxq6iWR2+aPf5JB/IH5agbZsoaaCURpxc8USWHVF7/A/rRjkxv0LoqzWKQknsfw9u65/eVEYsx94/nyGvLDYyT/u2qeXbEbUqEQOTVEL4r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(136003)(39860400002)(396003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(82960400001)(5660300002)(2906002)(38100700002)(86362001)(41300700001)(6486002)(26005)(83380400001)(6506007)(6512007)(53546011)(478600001)(44832011)(4326008)(6862004)(8936002)(8676002)(66946007)(66556008)(66476007)(6636002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NF0L8LC7e2U2YWUO4LAA8ROFWMIg65oDwH/tr4CkTiHdkFgdBB8VyMI7eKGm?=
 =?us-ascii?Q?cp+VvI2A386yGrJYHFwg6WSwQholyJ03f0HmpebzuadEINxyV/n2sxKBu3Ms?=
 =?us-ascii?Q?UAzoS11mn/NANk9zQYcN165O+vd3B+UrikY63xG6RLGwAYJFs6kCDBX/2ABb?=
 =?us-ascii?Q?SpciRQQ4atXjgEM3wQv3cl+Nb4eXYSlnpVmOvKXnSkHnRLNJO9BH5WwYQhy6?=
 =?us-ascii?Q?rBtKcL5Gtl/lv5j7BdAlUxYQdKghzytvN9dCmzYtrceaxZzFJXZU8WsigP7n?=
 =?us-ascii?Q?alTS4zhrxDD8xaELAuIVm2VWQRaZjnJQKoMtB5tbaCB/ySCXZuU3Kz0eX7hH?=
 =?us-ascii?Q?toHZgMEXRJ6ZnKe0SrRtXVQDu9MCytFikgK+oUDvJ2TReaFahHdkepGeF9IP?=
 =?us-ascii?Q?y2KXLhPoKjIrDhVR3g0F5CRjw3d1cVsrIlkmqPy+UsDqdY75ISLfc0j5RwDL?=
 =?us-ascii?Q?+Wwjql/rH1SVsTfYbo2q4cK/rwxZwqtOhUTw/m18tfyyOu6OPXlPNRqw+ldE?=
 =?us-ascii?Q?NmZ/kpqtByOv5JvDVMDLoBpZX34T7UUcQgGXvrLcN3Rz/MJPI0xDGYE5WKt4?=
 =?us-ascii?Q?DG/Ng0RY8nVwfDeK8mXkxG8F6DkKUAWAWVUQjHiRSuYE9Imz5vNPL+/9ApAr?=
 =?us-ascii?Q?gHQxbjJtVZKP3vKmp4AeYz7aoLGxMn8dVYpzH3iAv0/6pgGrolJiocPfzr0/?=
 =?us-ascii?Q?jIZUtHXIjZSPQvjvbtOurqboZewL7cjpH2RWcW2CTj5RggATVEc4iFCwNiKa?=
 =?us-ascii?Q?t1UAQ+yDZDP+8VbNGTBYzl5YAlObiCWib1CKt/95fkGP8N8jG3IHqFZc3aeW?=
 =?us-ascii?Q?gBndlcg/EACi4nB4OAWZ5Bj4BIIRL6eVRZQ8HDNJdMsrYFzzq9GaTYutZill?=
 =?us-ascii?Q?Wkvt3QdI8F1GcLzJY5k+2xt9onKwc932yRpdfZ8t4tgXFnev82OCNvSQTKkg?=
 =?us-ascii?Q?QDQPp8C676xScGwEtdtMTBRXyw4c/KIcHmEvYgh6YFikYHsLW19Y3tnUkc47?=
 =?us-ascii?Q?wKapxTo7P7/Xa84wCshjL/TEsm+0QBxKWnittDfsCSc6K+pd5ni/NVQh+ug2?=
 =?us-ascii?Q?C/fvtnIQhLpRkhOPGKdzdTBpXLVEoDxsXqes/bZProaMlbnXhTAifdgI2A2M?=
 =?us-ascii?Q?aj6JEc5yHag10UWXonrY1GVz1I7V7zGKrUe3ysjBLvK5F0d/oSMV9Aimw+mc?=
 =?us-ascii?Q?h8Ghy5sU3LZ8MBVzok8g7U8ztVTSx5Zk5IEcRF2AOIAb7aifr2eDj1Iar5kO?=
 =?us-ascii?Q?t6hVBEdcnSeOI7AxtR7zcm7XkuplAN2HpCzn6k691U/yYG97MgS3u1DulK/5?=
 =?us-ascii?Q?hV5mmqJ6MsNfZdUD9YVNLDhBh6znTBSkGfQUb3gaJ/sUl3lt0MkL4LuaWDFO?=
 =?us-ascii?Q?VgYKgArByvIpSDrEjOz2N4LK9SmxS+7lPW7p8OB1smQWehRgURCW8j0kk/vM?=
 =?us-ascii?Q?3hLbEj6SNgQa/saN4eZncBgDQURkGrAbrb75z/aPcltFqbVnOs3PwqQ9ddrw?=
 =?us-ascii?Q?MeMv7KuL80XwvV1W7n7YJziHDd2qUUYjVHhmh/esgg+sJuyglaAGs1K0RwIg?=
 =?us-ascii?Q?rvTc0+uoxQ3AZjaIl/ZamSnQ7vOyOklacXFhiu6l1FqBAG+xvZ+WuXOTqPJb?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5194d744-99b4-4dad-e0f8-08dc0c8a1b30
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 18:30:48.2587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cr9grUL7tvw34MeNP/VCDfFee8+ZcyNJRa/C2B+ZHIo1x95GCQJvjUu603xmu0sM6vw05zzZnWlt++YP7bD39Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5149
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

On Wed, Jan 03, 2024 at 10:15:43AM -0800, Welty, Brian wrote:
> 
> 
> On 1/3/2024 12:11 AM, Matthew Brost wrote:
> > On Tue, Jan 02, 2024 at 01:17:30PM -0800, Brian Welty wrote:
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
> > > index 6cbf41ad9c8c..0bd79089b633 100644
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
> > > @@ -1301,7 +1300,7 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
> > >   {
> > >   	struct xe_sched_msg *msg;
> > > -	if (q->priority == priority || exec_queue_killed_or_banned(q))
> > > +	if (q->sched_props.priority == priority || exec_queue_killed_or_banned(q))
> > >   		return 0;
> > >   	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> > > @@ -1309,7 +1308,7 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
> > >   		return -ENOMEM;
> > >   	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
> > > -	q->priority = priority;
> > > +	q->sched_props.priority = priority;
> > 
> > Patch LGTM but noticed this is an existing bug - priority should be
> > changed before calling guc_exec_queue_add_msg. Can you fix that in this
> > series too?
> > 
> 
> I see that now.  Will include fixing that.
> 
> Please see question below...
> 
> > Will give an RB on this patch in next rev.
> > 
> > Matt
> > 
> > >   	return 0;
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > index adf1dab5eba2..6567abcb3c6d 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -356,7 +356,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> > >   		return ERR_CAST(m->q);
> > >   	}
> > >   	if (xe->info.has_usm)
> > > -		m->q->priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;
> > > +		m->q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;
> 
> I wondered. Is above correct way to adjust priority?
> 
> should it instead do:
>    m->q->ops->set_priority(m->q, XE_EXEC_QUEUE_PRIORITY_KERNEL);
> so that GuC is aware?
> 

Good catch. Yes, we should use the vfunc.

Matt

> 
> > >   	mutex_init(&m->job_mutex);
> > > -- 
> > > 2.43.0
> > > 
