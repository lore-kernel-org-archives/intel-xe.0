Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D564C001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 14:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D0F10E481;
	Wed, 26 Jul 2023 14:06:32 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88CF10E47F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 14:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690380390; x=1721916390;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rsqKiwl8/Hk6Ly5JRBPFQi/o2ot/i4GA0IdUzGWAR5k=;
 b=P+ieG7aST1VkZttWXbbLrZeEtxyNAO7SbO2s61fRWnyBynKOLhMas4Fy
 XS9vrSTEC7QEYE2ksg4TRzZxrAvLAGfF/BGTn0UZsHYKtYTpnBQX+YvMJ
 Sr83t8cCm+SfXHHCAeYjAIPji3kkDdZU9Q8VuEgct+Kr4PKq5BMXkXIse
 TugoBW+cSqA5/8/F+5pgkEyTuR6AKrwXuO3TashKRFyzszdXemvrwHx+2
 O/Oxuz1093BrJkdS0T4yVY+KxYpA7vHncLBgmJFDpMM9KM6uhxIq/rpQh
 sclWYHpXlx3LtEiQdv8cHlgxtikT/pyNRnxjjXTQrypyn9/JGkrsQCEvP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="365481447"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="365481447"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 07:06:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="761667244"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="761667244"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 26 Jul 2023 07:06:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 07:06:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 07:06:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 07:06:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 07:06:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3BkG02oUwUkm68+i1auVsgOxlRNma3xRZ15MVUyIyhikavpbF7jIR2MsGsD5N2UqeioIzZowP+AEqqNtzaq2rZaBiZFjjTQooOe+tJh5IvmIawUDvln+oNVa9GBirIz/FwN6mVpEtC5sB/8Btf3NwAkiAlRCJgwGyrEuXMRqqvdIdC2PT05iqBMgaDCLxZ1QM+3dJ9nKFPuak9DRaTWwqwsTyBMCiQ947cCXCZ70yI3JmySxldoskrtiLIfJu3LzQNEkzYjJ913SxOqUL/e7nz/+cqHwTntKGwiCGw3SFcWNNAP9Rumi7j54O1PQ2kXGsipNmiLbV1EbUJpRvWBXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9/MEv1nStVmGUJ5X5u0YvQH9vEIc7U/GIYK1dlx4Q8=;
 b=M10LzL1BKkaqI/5btwS2yFti8YqD+xBTKP0HWAzBolBwrT4rEtqz3ZW0zbyNdAe6oDRcSFhYvLtqAmtOz/8pY5TcSYqj4MKws2flDR3isT61063Rcv1/mOVEJisEMARlBabNC4DmiOkLbhl6IHDxy6im8ASTwbhuPVmGb8VHh1NSAmEQ/vAzDlHhrpZUQnsvNdqoEeMj5D+b8TDXlJv4BoxEngk4OIv8j1eCYSrjkPz7BPI1rFjDevSOse2dJahAGD1bS6G/dH/hTbgrFRGETtXgbIEJ0Kcg1fnwMRUhO/yyQQaLMN/Fh9q2hSrClBbD3DKgMo0iTR/jVEZMLbjGfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7326.namprd11.prod.outlook.com (2603:10b6:8:106::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 14:06:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 14:06:14 +0000
Date: Wed, 26 Jul 2023 14:05:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMEoEns0yJSTPHFn@DUT025-TGLU.fm.intel.com>
References: <20230726132550.846300-1-tejas.upadhyay@intel.com>
 <20230726132550.846300-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726132550.846300-3-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR06CA0018.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 7271020d-fc67-4a78-07c8-08db8de17971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tPqfjd+DQs0zEqa0CyurhITG4E6Pg5I4KBSpS7hs5t2NOQWNoxGHe1ieP2BSAIE7kCQi4wKRlV+nyI3n/ww4eAePjcUurmQlPpzl1I/RFit5GFpFVxclxbKmmF+/GODg+OKtOUhq4GW8rjIfWfNcYvMuoQ8f+W09euT2fzreV7sg0KPdCXJoFi2ckE/NEntAFXDSN8xuO3+qJbu+0+sxg6OwvFBhomZf4kLXpE7G1Sg2OIt9XNNbX8Zl6zf4hpnpNV4/wO+PhRu9ro8FUQJjWvpYGPf01HyoDK+jNCyPPBBb920ROE4St6DLAnKl/G4Q9TCOllmq6o/QSzNIUUe+mcdvTmqQTisKEDwQCw+4U7ezfJG5/JCqMAjS6MOVx8OPMT88tChwopDha7j451+1s/Tjh2dzm5ptaaTNTgWie9if9HASj6soHdpVZJdOBvjGcyqcchaPnzDIAvzMMswcFO8pu+pc19EUxqbQdJz9Gj79KdgKIkzqN3b+sS0sn+jtEt9V7twtx2zIKKJdnGTYq2KtZv3JxgxQBKbH+7Pd2rgcS8XvmZSDuW3wd5bjoyWr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199021)(107886003)(186003)(6506007)(26005)(83380400001)(6636002)(66476007)(66556008)(4326008)(6666004)(66946007)(316002)(5660300002)(8676002)(41300700001)(44832011)(6486002)(6862004)(6512007)(8936002)(478600001)(2906002)(30864003)(38100700002)(86362001)(82960400001)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3d0OScw3MsYtrBt5pdCON5C/XfLtE3z+3PscndXGCxF9TSdoeQfW6ThW81sI?=
 =?us-ascii?Q?haTMXl6lcZ70Sf/dSCCNmtUikn+FJKhPdUl9a7//+UM+xGaASpIZrkTbohv4?=
 =?us-ascii?Q?do+ic9V9uMkwSzcMx6PvP6IRUp2Op0TM9n1S5Vqq8oijMPtGSUi2Vht9QS8K?=
 =?us-ascii?Q?bGDt6qJcaYGp6EBKbzh69Ho2dgvpX0NjV26Z5kzCOy/N7wH4T+TunCoTYYLF?=
 =?us-ascii?Q?SIFUQwunHAocQIIDG4XanNuRoyIKPTIwnM0V68RQKYFeV5nL+9eyWkQz1nJT?=
 =?us-ascii?Q?VU6srZuNvSyVPmCb9upl2coGq9AVWQjNRiZr09Bq1eW1qvM85UMXH6VmzDaN?=
 =?us-ascii?Q?mAKXXC1MWgjgLyvoLfqpHlhBshvLW/HU+CxB+KlIf1pTLcdRXHfDgmCh+3rG?=
 =?us-ascii?Q?i0Hz7efbxwj7IVOps8d3EgfHkF6+WOzxcjFmJJdAmV8MVkgu9zxONjlMHiUJ?=
 =?us-ascii?Q?9m4GeMYQalkt/XS/BCIVy95AJumhX34AXubI4NizhdechYFoPiSRgzmp6nH8?=
 =?us-ascii?Q?SNGZbunYB8lbyYf/yqV6RLnZyMjLym2wgwiuZ8z8WKf3WiUa6CmRSu8h3Ywo?=
 =?us-ascii?Q?aLl0ua2wzt3+PQ9QLRQn0dd9Vi4Ma0/3JX70JSWOH/6TWyKu3YdfP8Coa8EU?=
 =?us-ascii?Q?khAwgVbcK9PPT/OI8ml9EHixYMl40Xfwxu46d2DHr8ZQ+u0Xc1DQuMHnnPTY?=
 =?us-ascii?Q?OdhP2NIGcJjb/SVf0DjfWOIV+TbOOlUXyV8PulzdxT2px39XJtOorL0tco1o?=
 =?us-ascii?Q?qYT58GvqmIvtAd1nlWxD9Kv9VtyZNlDrwmMMk0PshRdVXlvYKfHxMnxvp3es?=
 =?us-ascii?Q?H/GJV2C8/WNZo3hcCtck3Yo0//asn9QoPTT3mmHUMOzTDuSVbDC35aMjfFCp?=
 =?us-ascii?Q?p9jlU0Nf+QJ4gBzA+ejR/xmfDQOCNA4KffMupasHyywQni3RTtHOshd7lUQ0?=
 =?us-ascii?Q?r7jP65wEzJyGT4+kBFR1hFHwPI1Q7bWxjyJHyBIEjqazXQds/5ixSLgSPh/j?=
 =?us-ascii?Q?LWkBap4l8XuFHJ71LnTMLY/B/y7Q1Pm/8v2cThXpxDCpfTMapZvlDEGEMy1Y?=
 =?us-ascii?Q?9KofM+resbQRuPhmU8A0hPKHYB1xouF0nPpfMXagEwyYlKUJ8nj/C99KH8bH?=
 =?us-ascii?Q?sNgfqBBCvTx2zCyWqJb8+12gc6ibOBpPFeXoDNTRZv4YImBWJYK9kNia2+QY?=
 =?us-ascii?Q?rn9lXUV5Nyp9nyeUw3a29UDJ+4PNliMdeBvDSIhttNLsRHHlGV6Jf86Cxb//?=
 =?us-ascii?Q?nkIDDDkdLXtLz4xUYwEPH09o4XqQxKfCuEQj16E5MAqsO7XkJieSkpLS4h+O?=
 =?us-ascii?Q?OfoUsTyniQh8CVrfHpvCeaUxESV7WEkse3tRmVpgmwluiTDGD07VW32ENF30?=
 =?us-ascii?Q?kkQDOLE/+uHakgLMJkihakDFYxqdka9/ZV/YOSAIPJnhhe9PIv8+BUI+btxu?=
 =?us-ascii?Q?uGWyDKwcExn4vHpxtdrdJkgRxzfW3hsqrRlRkRIPDlLHjCOk9APrpXD7gNxg?=
 =?us-ascii?Q?epnAinFnySSaHem3+omt2ccZFRLN2l6qZgHUVN9M8ts47aCsuEJV34Qjkf3v?=
 =?us-ascii?Q?QiJgn1qBkeL3VnbQa99SPNT4i7KDLYg+s6YQ0FpJl5oUwJQ3H6eiWQX8x77C?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7271020d-fc67-4a78-07c8-08db8de17971
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 14:06:14.9441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTWmpybC0RtdK9lumGfmceFysfFwoXDcxsgck+bCsMKxIdDRX/16lDefMMvCVrZhagTnA+kbmYuQ3mI9gvm/cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7326
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

On Wed, Jul 26, 2023 at 06:55:46PM +0530, Tejas Upadhyay wrote:
> For each HW engine under GT we are adding defaults sysfs
> entry to list all engine scheduler properties and its
> default values. So that it will be easier for user to
> fetch default values of these properties anytime to go
> back to default.
> 
> For example,
> DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/bcs/.defaults/
> job_timeout_ms         preempt_timeout_us     timeslice_duration_us
> 
> where,
> @job_timeout_ms: The time after which a job is removed from the scheduler.
> @preempt_timeout_us: How long to wait (in microseconds) for a preemption
>                      event to occur when submitting a new context.
> @timeslice_duration_us: Each context is scheduled for execution for the
>                         timeslice duration, before switching to the next
>                         context.
> 
> V7 :
>    - Push all errors to one error path at every places - Niranjana
>    - Describe struct member to resolve kernel doc err - CI hooks
> V6 :
>    - Use engine class interface instead of hw engine
>      in sysfs for better interfacing readability - Niranjana
> V5 :
>    - Scheduling props should apply per class engine not per hardware engine - Matt
>    - Do not record value of job_timeout_ms if changed based on dma_fence - Matt
> V4 :
>    - Resolve merge conflicts - CI
> V3 :
>    - Rearrange code in its own file
>    - Rebase
>    - Update commit message to reflect tile addition
> V2 :
>    - Use sysfs_create_files in this patch - Niranjana
>    - Handle prototype error for xe_add_engine_defaults - CI hooks
>    - Remove unused member sysfs_hwe - Niranjana
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_engine.c             |   6 +-
>  drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 116 +++++++++++++++++----
>  drivers/gpu/drm/xe/xe_engine_class_sysfs.h |  20 ++++
>  drivers/gpu/drm/xe/xe_gt_types.h           |   3 +
>  drivers/gpu/drm/xe/xe_guc_submit.c         |   3 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c          |  10 ++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h    |  40 +++++++
>  7 files changed, 176 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index 0102dad16e29..9e167b113963 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -53,9 +53,9 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
>  	INIT_LIST_HEAD(&e->compute.link);
>  	INIT_LIST_HEAD(&e->multi_gt_link);
>  
> -	/* FIXME: Wire up to configurable default value */
> -	e->sched_props.timeslice_us = 1 * 1000;
> -	e->sched_props.preempt_timeout_us = 640 * 1000;
> +	e->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
> +	e->sched_props.preempt_timeout_us =
> +				hwe->eclass->sched_props.preempt_timeout_us;
>  
>  	if (xe_engine_is_parallel(e)) {
>  		e->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
> diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> index 9959b0362d71..cec8428d87a7 100644
> --- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c

s/xe_engine_class_sysfs/xe_hwe_engine_class_sysfs/

> +++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> @@ -9,6 +9,8 @@
>  
>  #include "xe_engine_class_sysfs.h"
>  
> +static int xe_add_engine_class_defaults(struct kobject *parent);

s/engine_class/hwe_engine_class/

> +
>  static void kobj_xe_engine_release(struct kobject *kobj)

s/xe_engine/xe_hwe_engine/

>  {
>  	kfree(kobj);
> @@ -19,22 +21,88 @@ static const struct kobj_type kobj_xe_engine_type = {
>  	.sysfs_ops = &kobj_sysfs_ops
>  };
>  
> -static struct kobject *
> +static struct kobj_eclass *
>  kobj_xe_engine(struct kobject *parent, char *name)

s/kobj_xe_engine/kobj_xe_hwe_engine_class/

> +{
> +	struct kobj_eclass *keclass;
> +
> +	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
> +	if (!keclass)
> +		return NULL;
> +
> +	kobject_init(&keclass->base, &kobj_xe_engine_type);
> +	if (kobject_add(&keclass->base, parent, "%s", name)) {
> +		kobject_put(&keclass->base);
> +		return NULL;
> +	}
> +
> +	return keclass;
> +}
> +
> +static ssize_t job_timeout_default(struct kobject *kobj,
> +				   struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);

s/struct xe_engine_class_intf/struct xe_hwe_engine_class_intf/

> +
> +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_ms);
> +}
> +
> +static struct kobj_attribute job_timeout_def =
> +__ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
> +
> +static ssize_t timeslice_default(struct kobject *kobj,
> +				 struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_us);
> +}
> +
> +static struct kobj_attribute timeslice_duration_def =
> +__ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
> +
> +static ssize_t preempt_timeout_default(struct kobject *kobj,
> +				       struct kobj_attribute *attr,
> +				       char *buf)
> +{
> +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_us);
> +}
> +
> +static struct kobj_attribute preempt_timeout_def =
> +__ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
> +
> +static const struct attribute *defaults[] = {
> +	&job_timeout_def.attr,
> +	&timeslice_duration_def.attr,
> +	&preempt_timeout_def.attr,
> +	NULL
> +};
> +
> +static int xe_add_engine_class_defaults(struct kobject *parent)
>  {
>  	struct kobject *kobj;
> +	int err = 0;
>  
>  	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
>  	if (!kobj)
> -		return NULL;
> +		return -ENOMEM;
>  
>  	kobject_init(kobj, &kobj_xe_engine_type);
> -	if (kobject_add(kobj, parent, "%s", name)) {
> -		kobject_put(kobj);
> -		return NULL;
> -	}
>  
> -	return kobj;
> +	err = kobject_add(kobj, parent, "%s", ".defaults");
> +	if (err)
> +		goto err_object;
> +
> +	err = sysfs_create_files(kobj, defaults);
> +	if (err)
> +		goto err_object;
> +
> +	return err;
> +err_object:
> +	kobject_put(kobj);
> +	return err;
>  }
>  
>  static void xe_engine_sysfs_kobj_release(struct kobject *kobj)
> @@ -62,14 +130,12 @@ int xe_engine_class_sysfs_init(struct xe_gt *gt)
>  	kobject_init(kobj, &xe_engine_sysfs_kobj_type);
>  
>  	err = kobject_add(kobj, gt->sysfs, "engines");
> -	if (err) {
> -		kobject_put(kobj);
> -		return err;
> -	}
> +	if (err)
> +		goto err_object;
>  
>  	for_each_hw_engine(hwe, gt, id) {
>  		char name[MAX_ENGINE_CLASS_NAME_LEN];
> -		struct kobject *khwe;
> +		struct kobj_eclass *keclass;
>  
>  		if (hwe->class == XE_ENGINE_CLASS_OTHER ||
>  		    hwe->class == XE_ENGINE_CLASS_MAX)
> @@ -97,15 +163,29 @@ int xe_engine_class_sysfs_init(struct xe_gt *gt)
>  			strcpy(name, "ccs");
>  			break;
>  		default:
> -			kobject_put(kobj);
> -			return -EINVAL;
> +			err = -EINVAL;
> +			goto err_object;
>  		}
>  
> -		khwe = kobj_xe_engine(kobj, name);
> -		if (!khwe) {
> -			kobject_put(kobj);
> -			return -EINVAL;
> +		keclass = kobj_xe_engine(kobj, name);
> +		if (!keclass) {
> +			err = -EINVAL;
> +			goto err_object;
>  		}
> +
> +		keclass->eclass = hwe->eclass;
> +		err = xe_add_engine_class_defaults(&keclass->base);
> +		if (err) {
> +			drm_warn(&gt_to_xe(gt)->drm,
> +				 "Warning: adding .defaults to engines failed!, err: %d\n",
> +				 err);
> +			goto err_object;
> +		}
> +
>  	}
> +
> +	return err;
> +err_object:
> +	kobject_put(kobj);
>  	return err;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> index f195dacc1ec6..683726563059 100644
> --- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> @@ -10,4 +10,24 @@
>  
>  #define MAX_ENGINE_CLASS_NAME_LEN    16
>  int xe_engine_class_sysfs_init(struct xe_gt *gt);
> +
> +/**
> + * struct kobj_eclass - A eclass's kobject struct that connects the kobject and the
> + * eclass.
> + *
> + * When dealing with multiple eclass, this struct helps to understand which eclass
> + * needs to be addressed on a given sysfs call.
> + */
> +struct kobj_eclass {
> +	/** @base: The actual kobject */
> +	struct kobject base;
> +	/** @eclass: A pointer to the engine class interface */
> +	struct xe_engine_class_intf *eclass;
> +};
> +
> +static inline struct xe_engine_class_intf *kobj_to_eclass(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct kobj_eclass, base)->eclass;
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 78a9fe9f0bd3..d8d9151cca62 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -286,6 +286,9 @@ struct xe_gt {
>  	/** @hw_engines: hardware engines on the GT */
>  	struct xe_hw_engine hw_engines[XE_NUM_HW_ENGINES];
>  
> +	/** @eclass: per class engine interface on the GT */

s/per class engine/per hardware engine class/

> +	struct xe_engine_class_intf  eclass[XE_ENGINE_CLASS_MAX];
> +
>  	/** @pcode: GT's PCODE */
>  	struct {
>  		/** @lock: protecting GT's PCODE mailbox data */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 911d4965c27c..7978f7efd702 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1128,7 +1128,8 @@ static int guc_engine_init(struct xe_engine *e)
>  	ge->engine = e;
>  	init_waitqueue_head(&ge->suspend_wait);
>  
> -	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
> +	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT :
> +		  e->hwe->eclass->sched_props.job_timeout_ms;
>  	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
>  			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
>  			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 1af5cccd1142..96c32a815c90 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -362,6 +362,16 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	hwe->fence_irq = &gt->fence_irq[info->class];
>  	hwe->engine_id = id;
>  
> +	if (!gt->eclass[hwe->class].init_done) {
> +		gt->eclass[hwe->class].sched_props.job_timeout_ms = HZ * 5;
> +		gt->eclass[hwe->class].sched_props.timeslice_us = 1 * 1000;
> +		gt->eclass[hwe->class].sched_props.preempt_timeout_us = 640 * 1000;
> +		/* Record default props */
> +		gt->eclass[hwe->class].defaults = gt->eclass[hwe->class].sched_props;
> +		gt->eclass[hwe->class].init_done = true;

Probably can just check defaults.job_timeout_ms to init is done rather
than having init_done variable.

Matt

> +	}
> +	hwe->eclass = &gt->eclass[hwe->class];
> +
>  	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
>  	xe_wa_process_engine(hwe);
>  	hw_engine_setup_default_state(hwe);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 803d557cf5aa..c257c1f8cd45 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -63,6 +63,44 @@ struct xe_bo;
>  struct xe_execlist_port;
>  struct xe_gt;
>  
> +/**
> + * struct xe_engine_class_intf - per engine class struct interface

s/struct xe_engine_class_intf/struct xe_hwe_engine_class_intf

s/per engine class/per hardware engine class/

> + *
> + * Contains all the engine properties per class engine.

s/per class engine/per hardware engine class/

> + *
> + * @init_done: Mark init status for this engine class struct
> + * @sched_props: scheduling properties
> + * @defaults: default scheduling properties
> + */
> +struct xe_engine_class_intf {
> +	/** @init_done: Mark init status for this engine class struct */
> +	bool init_done;
> +	/**
> +	 * @sched_props: scheduling properties
> +	 * @defaults: default scheduling properties
> +	 */
> +	struct {
> +		/** @set_job_timeout: Set job timeout in ms for engine */
> +		u32 job_timeout_ms;
> +		/** @job_timeout_min: Min job timeout in ms for engine */
> +		u32 job_timeout_min;
> +		/** @job_timeout_max: Max job timeout in ms for engine */
> +		u32 job_timeout_max;
> +		/** @timeslice_us: timeslice period in micro-seconds */
> +		u32 timeslice_us;
> +		/** @timeslice_min: min timeslice period in micro-seconds */
> +		u32 timeslice_min;
> +		/** @timeslice_max: max timeslice period in micro-seconds */
> +		u32 timeslice_max;
> +		/** @preempt_timeout_us: preemption timeout in micro-seconds */
> +		u32 preempt_timeout_us;
> +		/** @preempt_timeout_min: min preemption timeout in micro-seconds */
> +		u32 preempt_timeout_min;
> +		/** @preempt_timeout_max: max preemption timeout in micro-seconds */
> +		u32 preempt_timeout_max;
> +	} sched_props, defaults;
> +};
> +
>  /**
>   * struct xe_hw_engine - Hardware engine
>   *
> @@ -107,6 +145,8 @@ struct xe_hw_engine {
>  	void (*irq_handler)(struct xe_hw_engine *hwe, u16 intr_vec);
>  	/** @engine_id: id  for this hw engine */
>  	enum xe_hw_engine_id engine_id;
> +	/** @eclass: pointer to per engine class interface */

s/per engine class/per hardware engine class/

Matt

> +	struct xe_engine_class_intf *eclass;
>  };
>  
>  /**
> -- 
> 2.25.1
> 
