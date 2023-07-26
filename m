Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CEFC0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 14:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E61410E480;
	Wed, 26 Jul 2023 14:10:44 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A57910E480
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 14:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690380643; x=1721916643;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uUTDlU/EFkc2q6IgMPZai8fxiBUdG+hKY4/F5N8krd4=;
 b=BKq56EjHGYcDSABD7FS/4bTE/Mn7a43Sanj4vxRDfajgApf3NomIlWoM
 C9g/GBwTLDaCIww9Vi5GbujQl4rzaIBNTUKO51AuufdIJEvy2JHOkwA4q
 zABlOUcQsYErziVr+5Xb8LELN56SBee75bOGGG78ik+6dbtnYzpvd8N4y
 U3haoEuRfcasD9KLSo481VW3RTb7WF95j0v/ggFQwdOzGzqkaBO/Yk0jD
 eznPlh1ypKRKT30RAetBPIjbRuCWEiODGiHDdu/d1WCHVS9CxOUOkzJ0b
 skuZ028ehM44R74suqEucXTaK2Gy3ybcEKyzvduD7DKY8aQKZ3+Yrs9Zj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="431827571"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="431827571"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 07:10:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="840261928"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="840261928"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2023 07:10:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 07:10:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 07:10:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 07:10:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 07:10:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbOtid/MRE7lAWmAbDaJllrTto8qqOQ+gN6NnzoTxxVBzkQTXLOXHfyjZAt1oHV8BNiBkvIJNrFdWBgEDLovKKDaTb7vcbNAbwlyblwfRn8EPH4RKOcoTP9pdQEhlzjIK3YQ+W9Kb45+GNNxx3tcp04yjp+K6p93Ox7blQn5WVu28J7pXicomgabiehvdN0SOKIXwNXcFMVEwkvA3oABx6sLZ/gejPXnBnOUTe1KXflEd2dXfgMs4LTP6bffrhVpW8DW0bzdB7JnfWhDwSXSpaLx/frWcz98LSc6CnWNnVCtPxkGYaTdzk2eHIXV8bUaui1kNxemtPy07aePkTwsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akpn4k9U+ZROaFQmcWrSBdBm6FuEd/zO1EyruzG66mE=;
 b=IzkxfNU5vkH5n1a8TyLq1hDvfrZMji+N4OiVUZovuZSdSCBZN/7/zwgpcHJcmyn5gJ/tKr2EEnIbchXKS5cJpV1wT+SyY8vx3OrYunqqhsNFYQB29EBRyafnzSRcnfCjUmbR+Fs+duyFBtART3xZvs+dn7HBaTmzLP1ESV4WZsuo4HkhDO0UXUveUV8uDsQMtuKWG1WBlv183Kv2oQsHMoLwrcIG8RYCgOmfZLICTCWcWtVvp1S+BEt+MIaGhYyk7kGAmGVyllrmP3QjMnSPAQ0TxBZJGoHC0SLx9fTjaytej0xvUs0cMJvnj7zF5nz0fcOOvBn0YFNfeqoFFVLxDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6113.namprd11.prod.outlook.com (2603:10b6:930:2e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 14:10:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 14:10:36 +0000
Date: Wed, 26 Jul 2023 14:09:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMEpGYJD4R8HUHL3@DUT025-TGLU.fm.intel.com>
References: <20230726132550.846300-1-tejas.upadhyay@intel.com>
 <20230726132550.846300-3-tejas.upadhyay@intel.com>
 <ZMEoEns0yJSTPHFn@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZMEoEns0yJSTPHFn@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 51caa468-98fa-47fa-95df-08db8de21574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4s2khCJ2vyFss2IkOaCEu9/0SWCFxHJDCu99iI01fk0qq52Er59IRBmqHhJc9D5fGKkEh9Igcb9Ui3SYcQ7xNahWIItkw5mkioFi1qf8y8sOIJosGCUSRQJ4GCYq34VLNRve//1X/H1N2wKsbI4iujSg10CrSA60XbYWu3hRyo5CRw0U3Dzs7QrYPCPaE3gvifa6IkIp8apjvpR9A3lZLDS7npa5yKD2jQxjJWE2SBzMZgCrcRc72cjBDMiciITS2xqzJYZUxIW88soDBrIGoYqtH7svfIpKgGcOw9x06ANsG1qyK5bfoeRNlhPYuJfKttzYhuVIujsQrcPklQSWbT+F9Q3LeOhd3MU9b3tft9yraetse2KugA7vnin7w7GlFyfNExA9+7KynHIcjoxmwgMP70D5/fdtpwqh1nr7dFCo6QGV03rdsQiedYZWZWxXJMApcB5t5NvJP2jAk8UeIiDt94eovZ2HheWW2WMygRwyp7GW9e6PZn6RMUFQ1jXNubm388lALMKepaIorifozZOFPLkglcSucn/43ZH1Uka5DNueAjpFevoDGctT0rvm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199021)(30864003)(6666004)(66899021)(6486002)(2906002)(478600001)(82960400001)(316002)(6862004)(8676002)(8936002)(5660300002)(41300700001)(38100700002)(66946007)(6636002)(66476007)(4326008)(26005)(66556008)(86362001)(6506007)(83380400001)(186003)(44832011)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fiXu/kQYWijouzQSEggMI7yKLoqmqd2eKSHL8PGBLC7X1BeXKyLjRGU6eYcH?=
 =?us-ascii?Q?aOsVQCChk0SpjFbRszUg9X6N9qgc9TP3d1Sc0QCui7OIKO83YMo57fe7DO/T?=
 =?us-ascii?Q?Zzc8oE64qJTUCoY4LeyH8IqROYi80ThHqP8AU2D39decffqWja23ElnO6URM?=
 =?us-ascii?Q?iMPHMnmXs/89nhZBv4+WOy2GU9Vfx6NwfKztU0oQGf1iN5Ptm33aatKq6gRg?=
 =?us-ascii?Q?b87qTLcdJfbi33Z6SBIVu4Q/m0Uf8Q7m96mUPxYPtAmXGUYwtRgtAN2hfHmJ?=
 =?us-ascii?Q?2bqprprbEph6LQll0WS6UtB0C1/VHzfqiuk3qT0Y3Yc6Ovd/OtImOlLvTZzh?=
 =?us-ascii?Q?cFKwN3z/7yGQac+dyPBJHRveKDHPsSNswLwSNXyKB7+ievZHcgFS/c2FxTWH?=
 =?us-ascii?Q?fyqCa9+hC/rsnSqEEmvK2Ui0EFSLxBLqV27HUB/IdcQs8JKNd9VHZKsz8ARw?=
 =?us-ascii?Q?qybPaO+vDZVlWSHxf7EjM39/O8nYPbq5519P7PjXDC+BTFqMRFkPdVB0yPxi?=
 =?us-ascii?Q?6gvAZHAZhIAKCqZsFj8bwP4uoLlcqvMDv6MhgT3Dun66TwFGdddw/ofkfWTW?=
 =?us-ascii?Q?iL1WA33hDi2i2f60qkuPWZUXJtG4C868taHwmFgpJMtWBPnQ/UctfMHNSpMw?=
 =?us-ascii?Q?T8j0U2HNOVsMtMf0LEsQYVebcbVrMMvl+8XvNCaXdKHuIjzzCfWHXYdqd4Da?=
 =?us-ascii?Q?8GQqMXkJ0wNTNw8WE2YylJ0/80IVn/daza4eG9rDUxzsFjtSKBmHycSNlQxs?=
 =?us-ascii?Q?g2JwtWjhM3byVnNr67r7Ln/yUdwX0pg5bwEChp7ZLOd6QoH/5U2vrzrDOKRD?=
 =?us-ascii?Q?LqncbcUi3Nz7cuCbCPoOaK2dXiUCot7ClvXXSWCGqcfHNwOrd/J6KOk+1WSW?=
 =?us-ascii?Q?flYzXBbxX7uixtNf9inY9C7jLyYURCFXIFkmQ7uW2Z16gAqeonQwYi+o3WHQ?=
 =?us-ascii?Q?/pPV8pMNfx5B7chsXZgIeunrgLQ3rOPWq+sctL475bY0RkeZXHkHdtB1oouo?=
 =?us-ascii?Q?nrUd2SW5QciHeujMLWLHEqLqzT02EVa6Nu65CnAAQ5UZ6gjoarXP64zo2IM6?=
 =?us-ascii?Q?PZKnTCEljOx6oChqgdUkmnVnaD6f1xiQDMEJkEQTp7wGZbIx/SawqHlig7X0?=
 =?us-ascii?Q?puKSBPpegLyYsP0PhcGExyPU+G+vbsCtP/NrFhbQS512ydhPnckNa88rduPd?=
 =?us-ascii?Q?gdc5s/CctSeoVrLSuX/SOgExWupXNf21S39QJWSib6DXBNH9b4KIqh1yBy1X?=
 =?us-ascii?Q?fknjZJl2r4KLb+BdZREEixKYwSgWvOwBdSO6ntKrch2o5r6saI+WEmzhSyle?=
 =?us-ascii?Q?j5X25BiHUy+qCeTb2RYKuocQwhWfcoEWU+3Yg/OndU68CI0rbCEZpTeyqkZf?=
 =?us-ascii?Q?yLSlkxsYcfppnvSnE3XQBQ1G5uqb9+NTK6pw7ynrBdiLISOSUokGVFhA1Vsv?=
 =?us-ascii?Q?4ZpoD3QLiTNsMuWeKblvc1mXPQEq6xjhQjZmmIhGoCtHvvqXCdLSqoeBwcI1?=
 =?us-ascii?Q?u0lvKhDguBA7kFxAqLN0d+tbkNIO1BjyRCJg1NyC7+ZDStv7MXluBdL7j9av?=
 =?us-ascii?Q?AD602XdXFEZ51Y+nARUueAEMVkIC/MhBWC5u3aZkIEi89RJr2tRMEDn01dOV?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51caa468-98fa-47fa-95df-08db8de21574
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 14:10:36.6512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhUKZAuJgMQWIYIskCtx3baB8kx1a7GadNYNW2R/namCj+TTjKpPnGQIKewNgIg86GT4LPAWiaDwzSv5b+zilQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6113
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V8 2/6] drm/xe: Add sysfs for default engine
 scheduler properties
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

On Wed, Jul 26, 2023 at 02:05:06PM +0000, Matthew Brost wrote:
> On Wed, Jul 26, 2023 at 06:55:46PM +0530, Tejas Upadhyay wrote:
> > For each HW engine under GT we are adding defaults sysfs
> > entry to list all engine scheduler properties and its
> > default values. So that it will be easier for user to
> > fetch default values of these properties anytime to go
> > back to default.
> > 
> > For example,
> > DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/bcs/.defaults/
> > job_timeout_ms         preempt_timeout_us     timeslice_duration_us
> > 
> > where,
> > @job_timeout_ms: The time after which a job is removed from the scheduler.
> > @preempt_timeout_us: How long to wait (in microseconds) for a preemption
> >                      event to occur when submitting a new context.
> > @timeslice_duration_us: Each context is scheduled for execution for the
> >                         timeslice duration, before switching to the next
> >                         context.
> > 
> > V7 :
> >    - Push all errors to one error path at every places - Niranjana
> >    - Describe struct member to resolve kernel doc err - CI hooks
> > V6 :
> >    - Use engine class interface instead of hw engine
> >      in sysfs for better interfacing readability - Niranjana
> > V5 :
> >    - Scheduling props should apply per class engine not per hardware engine - Matt
> >    - Do not record value of job_timeout_ms if changed based on dma_fence - Matt
> > V4 :
> >    - Resolve merge conflicts - CI
> > V3 :
> >    - Rearrange code in its own file
> >    - Rebase
> >    - Update commit message to reflect tile addition
> > V2 :
> >    - Use sysfs_create_files in this patch - Niranjana
> >    - Handle prototype error for xe_add_engine_defaults - CI hooks
> >    - Remove unused member sysfs_hwe - Niranjana
> > 
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_engine.c             |   6 +-
> >  drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 116 +++++++++++++++++----
> >  drivers/gpu/drm/xe/xe_engine_class_sysfs.h |  20 ++++
> >  drivers/gpu/drm/xe/xe_gt_types.h           |   3 +
> >  drivers/gpu/drm/xe/xe_guc_submit.c         |   3 +-
> >  drivers/gpu/drm/xe/xe_hw_engine.c          |  10 ++
> >  drivers/gpu/drm/xe/xe_hw_engine_types.h    |  40 +++++++
> >  7 files changed, 176 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> > index 0102dad16e29..9e167b113963 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > @@ -53,9 +53,9 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
> >  	INIT_LIST_HEAD(&e->compute.link);
> >  	INIT_LIST_HEAD(&e->multi_gt_link);
> >  
> > -	/* FIXME: Wire up to configurable default value */
> > -	e->sched_props.timeslice_us = 1 * 1000;
> > -	e->sched_props.preempt_timeout_us = 640 * 1000;
> > +	e->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
> > +	e->sched_props.preempt_timeout_us =
> > +				hwe->eclass->sched_props.preempt_timeout_us;
> >  
> >  	if (xe_engine_is_parallel(e)) {
> >  		e->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
> > diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> > index 9959b0362d71..cec8428d87a7 100644
> > --- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> 
> s/xe_engine_class_sysfs/xe_hwe_engine_class_sysfs/
> 

Opps, typos in my first reply.

s/xe_engine_class_sysfs/xe_hw_engine_class_sysfs/

So basically s/hwe/hw/ for my first reply. Very for the confusion.

Matt

> > +++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> > @@ -9,6 +9,8 @@
> >  
> >  #include "xe_engine_class_sysfs.h"
> >  
> > +static int xe_add_engine_class_defaults(struct kobject *parent);
> 
> s/engine_class/hwe_engine_class/
> 
> > +
> >  static void kobj_xe_engine_release(struct kobject *kobj)
> 
> s/xe_engine/xe_hwe_engine/
> 
> >  {
> >  	kfree(kobj);
> > @@ -19,22 +21,88 @@ static const struct kobj_type kobj_xe_engine_type = {
> >  	.sysfs_ops = &kobj_sysfs_ops
> >  };
> >  
> > -static struct kobject *
> > +static struct kobj_eclass *
> >  kobj_xe_engine(struct kobject *parent, char *name)
> 
> s/kobj_xe_engine/kobj_xe_hwe_engine_class/
> 
> > +{
> > +	struct kobj_eclass *keclass;
> > +
> > +	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
> > +	if (!keclass)
> > +		return NULL;
> > +
> > +	kobject_init(&keclass->base, &kobj_xe_engine_type);
> > +	if (kobject_add(&keclass->base, parent, "%s", name)) {
> > +		kobject_put(&keclass->base);
> > +		return NULL;
> > +	}
> > +
> > +	return keclass;
> > +}
> > +
> > +static ssize_t job_timeout_default(struct kobject *kobj,
> > +				   struct kobj_attribute *attr, char *buf)
> > +{
> > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> 
> s/struct xe_engine_class_intf/struct xe_hwe_engine_class_intf/
> 
> > +
> > +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_ms);
> > +}
> > +
> > +static struct kobj_attribute job_timeout_def =
> > +__ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
> > +
> > +static ssize_t timeslice_default(struct kobject *kobj,
> > +				 struct kobj_attribute *attr, char *buf)
> > +{
> > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> > +
> > +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_us);
> > +}
> > +
> > +static struct kobj_attribute timeslice_duration_def =
> > +__ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
> > +
> > +static ssize_t preempt_timeout_default(struct kobject *kobj,
> > +				       struct kobj_attribute *attr,
> > +				       char *buf)
> > +{
> > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> > +
> > +	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_us);
> > +}
> > +
> > +static struct kobj_attribute preempt_timeout_def =
> > +__ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
> > +
> > +static const struct attribute *defaults[] = {
> > +	&job_timeout_def.attr,
> > +	&timeslice_duration_def.attr,
> > +	&preempt_timeout_def.attr,
> > +	NULL
> > +};
> > +
> > +static int xe_add_engine_class_defaults(struct kobject *parent)
> >  {
> >  	struct kobject *kobj;
> > +	int err = 0;
> >  
> >  	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
> >  	if (!kobj)
> > -		return NULL;
> > +		return -ENOMEM;
> >  
> >  	kobject_init(kobj, &kobj_xe_engine_type);
> > -	if (kobject_add(kobj, parent, "%s", name)) {
> > -		kobject_put(kobj);
> > -		return NULL;
> > -	}
> >  
> > -	return kobj;
> > +	err = kobject_add(kobj, parent, "%s", ".defaults");
> > +	if (err)
> > +		goto err_object;
> > +
> > +	err = sysfs_create_files(kobj, defaults);
> > +	if (err)
> > +		goto err_object;
> > +
> > +	return err;
> > +err_object:
> > +	kobject_put(kobj);
> > +	return err;
> >  }
> >  
> >  static void xe_engine_sysfs_kobj_release(struct kobject *kobj)
> > @@ -62,14 +130,12 @@ int xe_engine_class_sysfs_init(struct xe_gt *gt)
> >  	kobject_init(kobj, &xe_engine_sysfs_kobj_type);
> >  
> >  	err = kobject_add(kobj, gt->sysfs, "engines");
> > -	if (err) {
> > -		kobject_put(kobj);
> > -		return err;
> > -	}
> > +	if (err)
> > +		goto err_object;
> >  
> >  	for_each_hw_engine(hwe, gt, id) {
> >  		char name[MAX_ENGINE_CLASS_NAME_LEN];
> > -		struct kobject *khwe;
> > +		struct kobj_eclass *keclass;
> >  
> >  		if (hwe->class == XE_ENGINE_CLASS_OTHER ||
> >  		    hwe->class == XE_ENGINE_CLASS_MAX)
> > @@ -97,15 +163,29 @@ int xe_engine_class_sysfs_init(struct xe_gt *gt)
> >  			strcpy(name, "ccs");
> >  			break;
> >  		default:
> > -			kobject_put(kobj);
> > -			return -EINVAL;
> > +			err = -EINVAL;
> > +			goto err_object;
> >  		}
> >  
> > -		khwe = kobj_xe_engine(kobj, name);
> > -		if (!khwe) {
> > -			kobject_put(kobj);
> > -			return -EINVAL;
> > +		keclass = kobj_xe_engine(kobj, name);
> > +		if (!keclass) {
> > +			err = -EINVAL;
> > +			goto err_object;
> >  		}
> > +
> > +		keclass->eclass = hwe->eclass;
> > +		err = xe_add_engine_class_defaults(&keclass->base);
> > +		if (err) {
> > +			drm_warn(&gt_to_xe(gt)->drm,
> > +				 "Warning: adding .defaults to engines failed!, err: %d\n",
> > +				 err);
> > +			goto err_object;
> > +		}
> > +
> >  	}
> > +
> > +	return err;
> > +err_object:
> > +	kobject_put(kobj);
> >  	return err;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> > index f195dacc1ec6..683726563059 100644
> > --- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> > +++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> > @@ -10,4 +10,24 @@
> >  
> >  #define MAX_ENGINE_CLASS_NAME_LEN    16
> >  int xe_engine_class_sysfs_init(struct xe_gt *gt);
> > +
> > +/**
> > + * struct kobj_eclass - A eclass's kobject struct that connects the kobject and the
> > + * eclass.
> > + *
> > + * When dealing with multiple eclass, this struct helps to understand which eclass
> > + * needs to be addressed on a given sysfs call.
> > + */
> > +struct kobj_eclass {
> > +	/** @base: The actual kobject */
> > +	struct kobject base;
> > +	/** @eclass: A pointer to the engine class interface */
> > +	struct xe_engine_class_intf *eclass;
> > +};
> > +
> > +static inline struct xe_engine_class_intf *kobj_to_eclass(struct kobject *kobj)
> > +{
> > +	return container_of(kobj, struct kobj_eclass, base)->eclass;
> > +}
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 78a9fe9f0bd3..d8d9151cca62 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -286,6 +286,9 @@ struct xe_gt {
> >  	/** @hw_engines: hardware engines on the GT */
> >  	struct xe_hw_engine hw_engines[XE_NUM_HW_ENGINES];
> >  
> > +	/** @eclass: per class engine interface on the GT */
> 
> s/per class engine/per hardware engine class/
> 
> > +	struct xe_engine_class_intf  eclass[XE_ENGINE_CLASS_MAX];
> > +
> >  	/** @pcode: GT's PCODE */
> >  	struct {
> >  		/** @lock: protecting GT's PCODE mailbox data */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 911d4965c27c..7978f7efd702 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1128,7 +1128,8 @@ static int guc_engine_init(struct xe_engine *e)
> >  	ge->engine = e;
> >  	init_waitqueue_head(&ge->suspend_wait);
> >  
> > -	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
> > +	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT :
> > +		  e->hwe->eclass->sched_props.job_timeout_ms;
> >  	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
> >  			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> >  			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index 1af5cccd1142..96c32a815c90 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -362,6 +362,16 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> >  	hwe->fence_irq = &gt->fence_irq[info->class];
> >  	hwe->engine_id = id;
> >  
> > +	if (!gt->eclass[hwe->class].init_done) {
> > +		gt->eclass[hwe->class].sched_props.job_timeout_ms = HZ * 5;
> > +		gt->eclass[hwe->class].sched_props.timeslice_us = 1 * 1000;
> > +		gt->eclass[hwe->class].sched_props.preempt_timeout_us = 640 * 1000;
> > +		/* Record default props */
> > +		gt->eclass[hwe->class].defaults = gt->eclass[hwe->class].sched_props;
> > +		gt->eclass[hwe->class].init_done = true;
> 
> Probably can just check defaults.job_timeout_ms to init is done rather
> than having init_done variable.
> 
> Matt
> 
> > +	}
> > +	hwe->eclass = &gt->eclass[hwe->class];
> > +
> >  	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
> >  	xe_wa_process_engine(hwe);
> >  	hw_engine_setup_default_state(hwe);
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > index 803d557cf5aa..c257c1f8cd45 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > @@ -63,6 +63,44 @@ struct xe_bo;
> >  struct xe_execlist_port;
> >  struct xe_gt;
> >  
> > +/**
> > + * struct xe_engine_class_intf - per engine class struct interface
> 
> s/struct xe_engine_class_intf/struct xe_hwe_engine_class_intf
> 
> s/per engine class/per hardware engine class/
> 
> > + *
> > + * Contains all the engine properties per class engine.
> 
> s/per class engine/per hardware engine class/
> 
> > + *
> > + * @init_done: Mark init status for this engine class struct
> > + * @sched_props: scheduling properties
> > + * @defaults: default scheduling properties
> > + */
> > +struct xe_engine_class_intf {
> > +	/** @init_done: Mark init status for this engine class struct */
> > +	bool init_done;
> > +	/**
> > +	 * @sched_props: scheduling properties
> > +	 * @defaults: default scheduling properties
> > +	 */
> > +	struct {
> > +		/** @set_job_timeout: Set job timeout in ms for engine */
> > +		u32 job_timeout_ms;
> > +		/** @job_timeout_min: Min job timeout in ms for engine */
> > +		u32 job_timeout_min;
> > +		/** @job_timeout_max: Max job timeout in ms for engine */
> > +		u32 job_timeout_max;
> > +		/** @timeslice_us: timeslice period in micro-seconds */
> > +		u32 timeslice_us;
> > +		/** @timeslice_min: min timeslice period in micro-seconds */
> > +		u32 timeslice_min;
> > +		/** @timeslice_max: max timeslice period in micro-seconds */
> > +		u32 timeslice_max;
> > +		/** @preempt_timeout_us: preemption timeout in micro-seconds */
> > +		u32 preempt_timeout_us;
> > +		/** @preempt_timeout_min: min preemption timeout in micro-seconds */
> > +		u32 preempt_timeout_min;
> > +		/** @preempt_timeout_max: max preemption timeout in micro-seconds */
> > +		u32 preempt_timeout_max;
> > +	} sched_props, defaults;
> > +};
> > +
> >  /**
> >   * struct xe_hw_engine - Hardware engine
> >   *
> > @@ -107,6 +145,8 @@ struct xe_hw_engine {
> >  	void (*irq_handler)(struct xe_hw_engine *hwe, u16 intr_vec);
> >  	/** @engine_id: id  for this hw engine */
> >  	enum xe_hw_engine_id engine_id;
> > +	/** @eclass: pointer to per engine class interface */
> 
> s/per engine class/per hardware engine class/
> 
> Matt
> 
> > +	struct xe_engine_class_intf *eclass;
> >  };
> >  
> >  /**
> > -- 
> > 2.25.1
> > 
