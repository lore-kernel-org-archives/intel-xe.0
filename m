Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EC5C6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 07:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B287210E502;
	Fri, 24 Mar 2023 07:00:04 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A3B10E502
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 07:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679641203; x=1711177203;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OyE0y1GS4vjIvx3B8x9//wOpwBOZfeLLz7DvnQlexXY=;
 b=KenDvxT12G5kGOhZG5b+Qxp0q3/1Cx7f/MPU10zGJtp0cE7vXbRnXkAb
 4l05H/jUEG9Zo9P3TfqqT3P3vqfmR1hDDbAJllTtlkGQuILr6q8lMUwsQ
 HmeSupuR0r/O68Zu+yeqilzqxQOIU94p84s7M0dlVOlV9KGKc5XMbYL65
 Oz1tafF4RRZdczwzCa86neH78nXAPxwGaL0V7K5xd3CodaZ/KE88tagtK
 JfKqDx3Orf0nxQWIa7IrK8Ep7GqMdMoJUK6UBdalser5jY44tOgs6ZssQ
 eZjETq+4+Cp+arXkuGk7uFr8KUx7LYF7SNVkrnv/bR/k5knzcONiggdva A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404629665"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="404629665"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 00:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="826136208"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="826136208"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 24 Mar 2023 00:00:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 00:00:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 00:00:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 00:00:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7j8YcR55rU1KuqusQd9s+bW3L8+IjQAaglc9vBJx8VpcXpZjqZTEvsm9iKwaPQ0AT7mTUG/RIIuPqT/Zlcv7ChlQ4OIN2VWzVj3gJulHSuHLKNLCCVarHP1a3koa/06swwSOt22QMxtXcQuBuVIdcXOZO7FKQnVQBRCaw7K5m+0Dis3mtLfA2Jt57gI7PEGNYmQjp3/UHu+zJHJB6vPYimhg+Klfo2UBmOnJBwEa84vfQwLTyPOCGkekPXj/ulKhn3j2BIDGhQx+zpqv5GmDZH1wwA1lRl5ZfKSs0Rce/cKk25fzDreWQeRV1oGNQEdiyVTb9ShgQzDxMXU4Eb/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IE6GlCYy1mByXcEsFLwWK2Wq6fAyIkcWh0DCog1FKC8=;
 b=Q0asZ+1LUHNum3SOpm1wMX2C0w64rZd+7MvcmC+nntfr0JB4bTesWgKS69qXcsTkUPp+256t2jUYixC1Z5A5KcIsDMvDCdM2gMwLzGcSFAUKfND3vnhnQeM14Lp8sy1qpqXXVOBJXB/I9o66xAi5tlk8Y99frM7nWnlSICE2Ebq7BMCMnQP1dT61ycukWzHkh60HjsS6Gv0OKwhQZKc5vG256xQoiPgcb+o/wscQpZ44nKXkXvuy7nAdCF8XNjG7HvGVlFzVRQ4W8KdCdlrlwNIIdZXsnW8XJsuVQaEdyOvSlho/auBI/vCMXRysemE1C8gPkLkk8HsIoXxx5BcFeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5945.namprd11.prod.outlook.com (2603:10b6:806:239::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 24 Mar
 2023 07:00:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 07:00:00 +0000
Date: Fri, 24 Mar 2023 06:59:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZB1KSkvCngrSs3bR@DUT025-TGLU.fm.intel.com>
References: <20230324012329.1195977-1-matthew.brost@intel.com>
 <20230324045311.h32fyw7mh6o6eyic@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230324045311.h32fyw7mh6o6eyic@ldmartin-desk2.lan>
X-ClientProxiedBy: BYAPR21CA0002.namprd21.prod.outlook.com
 (2603:10b6:a03:114::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 51d9a813-c247-4d4c-dade-08db2c35627a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xOXMT+VwEtbpgDt6/YWMG2YiYpYr8EJwo6PMDOS7mnGohxuxV5uRhSB5pWb8CdzUGAgIh1/lKnN/ihoSMStpkcbgiwY9dkEmvMbAbMM3J5JUnFq2UBPdNmXOUNAPaqYOhApxekJ5dqdcl8SAoAmCWDx40/J81LCU9KzfsNc/gQTbhXlz9MAK2kXfpjP805zn6TilHZKblXp8A57HNcUSO4PfPDghL8eQSHr+c/GMHk0xahtZ96EBI+Kecwr1rc8rWVQSapmOS4tTjc/9rJTNKiA0ZEg15Y4L1RZLwJi1LE2tzGzf7o2JvZDak3cJwNnwhYU/SCEK/Jkrv0TCg8555JxUrANEGSG0hl3WxhrcCbn63szWG7p+XNjeuG06nxpdrgkVidGe8pzkgP5xua+V1hy42Jq0r/J1fXKXr9xdPduXx47LitclANlDY4mImjKY1sljRXl9gmRf2NpbOmoqksZZ8VRVJcErmVBifHwwvzXiIg+LNVmk+OcMTQKYcNy4sMfZHLpxW9yIoM8t4BdnlHHU0GKkL7vcfgK31odGlHm0rlNEo8eb0wTeS5aN2i2gSEmhEg4+WjzXAUsXnVqRvfAI8uMBzqdRA/2koinbexcxBlVrJCr3silCRtp3pnJhhSBGq8XW06UBIoYbopcGNyMsY69TMfYfsm9doEoaFA1tzMBqC9S5FyU3ycOwzgX1hJg9A13oZ4z8Jw4lCBep9ZIincqOlkfhQaD9dDpjHL+t+o20D2QP2ck9PODACJTQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199018)(6862004)(5660300002)(86362001)(8936002)(41300700001)(82960400001)(44832011)(38100700002)(2906002)(6666004)(8676002)(107886003)(478600001)(83380400001)(6486002)(186003)(6512007)(6506007)(26005)(6636002)(316002)(66946007)(66556008)(4326008)(66476007)(66899018)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LhZs5fdxQZvJJP7scQZdObLEk5r1n0pmRr1NTu3mDQ+lxxrrmIZ6ZWUSESFy?=
 =?us-ascii?Q?urSJeMMTziqhwXWXQN2DZRvDf+Y6xOZcvQHZlDehrYe4c4I8whK0QjG+anmw?=
 =?us-ascii?Q?rU9k67QAQFYu8pH04EMk2KyyExDQzj8W4UNTwppVFCKChAiaPuTvG9rJI7+m?=
 =?us-ascii?Q?DS/7pcwvHNfR5R1bMnPebUF8KABcWUSfpj/t+D6eRRhxa7TVi9+aLg5AOrYU?=
 =?us-ascii?Q?Dv+dMyg8yIyVZKRTjMUfuYX9dn/zC1u+3LQLyCv2PqLjgQv1kImRl2CnylbT?=
 =?us-ascii?Q?LiAk4uS9nqUHg1jocpf3Q5lIPjyrY5Xb1EseEupBZ/f0or/fP3jhwus01PYb?=
 =?us-ascii?Q?cGl8HbcYiv9V4Xc7TsZBFUqbjJDvk5U/Opt84aY99wyl/Ljyu9mb/VkklPUS?=
 =?us-ascii?Q?yGpY4P2hUNkegBQlKHLhZIRTxYKCJz7GuuNxuvJiM1VP49aEMnBMUaI/WpWD?=
 =?us-ascii?Q?KwZKttS15I5sY3moQXs80K4LYoMq67c6SQ1UeRf0NaFx529opoarfFhvUTcy?=
 =?us-ascii?Q?6fR+6WeTDWR1fesCAk58h217IVAkL1geJvHsGtR0qlvNwdlbjZz8UXfhhzvV?=
 =?us-ascii?Q?V2xQUFzeDs0dPRLRq3pYEH+7NM9P/eoxdXQbJdvePvHeoHhJsylPrDBcInxH?=
 =?us-ascii?Q?goS8obLRFs/gA/viC9bK+r9FzHjFy5N9cn8NFyiHjp5i3t7v5uTlVjW7JS1M?=
 =?us-ascii?Q?jMrvGLph+kNP8pYR/uNlIXOl+VSqu52ZKB+kX+Td3n0qQuQIFNylnUT4iZQU?=
 =?us-ascii?Q?0BhxaX7w9HATXBN0xKrypzJbLPlLscdK0l4Mpp0T3jefKKe8PU7wsSL3RhGm?=
 =?us-ascii?Q?8ie0hYt+lHUVQeTJxXMyS0ghDjKwDVHbqe2WfCE0hrG4cMwdRa6pMRS2nmV8?=
 =?us-ascii?Q?bKpsSUh57DRBAlJSKCkb+7kA0VQJJ2HwIsyLQfW5eKrkmguLli9bZhqSD2AU?=
 =?us-ascii?Q?1cVrjUtkNN1jL8hdWHC04IfHImOVPhGvSMRTxcNJbSlVnl1x5p0UwljbRKaO?=
 =?us-ascii?Q?Js9vA8EN7SFt2rAtHBOJSC1culWDIIM7sacVD+D4jldZrTMR869Fm6re2V4s?=
 =?us-ascii?Q?s5EQSxBiaO4EV+cMUfU44wMqhbyIuoSWL6ei8JELIf5WOolzdwNg2mz4XCim?=
 =?us-ascii?Q?MiMQIsWCGG/d0EHGRTvpo7CXfJSnrA1RdCQtDZzomvdW+ohUaHHmV2QB55ya?=
 =?us-ascii?Q?cVf3bdZfKPTkA4//3Ly1VrrtOwnwgqPkz9H8O+v7HDSsanJREL2xyxeq/kLk?=
 =?us-ascii?Q?2a38FabA10lEmOY9g/mLm9nZKv48fV29DyE+YPjY6KlV2xkL76VeQdwZXyIm?=
 =?us-ascii?Q?YpIC9vIwKsdfW4bzD3tkOb+LC9uEsXiNkdtmUsCL6HtOqIRQzKBVyzk/0MpH?=
 =?us-ascii?Q?TCL0uRGds/AqZvN7C/WvJqqKsyQFKEHBiXYZ2/7DsM8gq9saL7cvqFAappu0?=
 =?us-ascii?Q?8ygmXxzBU2tbJnfVjy4UOcrTlKWwksAr636Z1pFmhG8vQW7x3IPCYH/33m+O?=
 =?us-ascii?Q?1BAPCjqsliP/XZStLRrhqgijxF+eQ5mSpb4ZYfHxuXFUKCJJp2m4xdDudT2G?=
 =?us-ascii?Q?SAM8gCZwZrki1L4BkNi4HFeNdeSptrwd0h3AKh5M0ukW+0mC04LunwaAzlJa?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d9a813-c247-4d4c-dade-08db2c35627a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 07:00:00.1101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSl6nUf2gImuHtLkCIO7vHwEVFQRQuJxIQLtIJdx4f1hVrarBewYuEyhSbVNLzpqoibzvEg3K2rXkmKehaVx2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5945
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Use fast virtual copy engine for
 migrate engine on PVC
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
Cc: intel-xe@lists.freedesktop.org, Bruce Chang <yu.bruce.chang@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 09:53:11PM -0700, Lucas De Marchi wrote:
> On Thu, Mar 23, 2023 at 06:23:29PM -0700, Matthew Brost wrote:
> > Some copy hardware engine instances are faster than others on PVC, use a
> > virtual engine of these plus the reserved instance for the migrate
> > engine on PVC. The idea being if a fast instance is available it will be
> > used and the throughput of kernel copies, clears, and pagefault
> > servicing will be higher.
> 
> how faster and/or why?  If it was related to being link copy engine vs
> main copy engine it was very understandable as the commands available
> are different and optimized for certain usages. However below you
> are setting to the odd link copy engines + the main copy engine
> + whatever was reserved for USM.
> 
> Without a proper reason here or numbers or spec, it's hard to judge
> where this is coming from and understand in future.
> 

Your right, probably need to get a spec reference or something to
justify this. I came up with this bit mask from IM conversation with
Bruce, maybe he can point me to the spec. Also I looked at the i915 code
for this and it is just BCS0 | reserved BCS so definitely need to dig
into what is the ideal mask.

> 
> > 
> > v2: Include local change of correct mask for fast instances
> > 
> > Cc: Bruce Chang <yu.bruce.chang@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_engine.h    |  2 ++
> > drivers/gpu/drm/xe/xe_hw_engine.c | 20 ++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_migrate.c   |  7 ++++---
> > 3 files changed, 26 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
> > index 1cf7f23c4afd..0a9c35ea3d34 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.h
> > +++ b/drivers/gpu/drm/xe/xe_engine.h
> > @@ -26,6 +26,8 @@ void xe_engine_destroy(struct kref *ref);
> > 
> > struct xe_engine *xe_engine_lookup(struct xe_file *xef, u32 id);
> > 
> > +u32 xe_hw_engine_fast_copy_logical_mask(struct xe_gt *gt);
> > +
> > static inline struct xe_engine *xe_engine_get(struct xe_engine *engine)
> > {
> > 	kref_get(&engine->refcount);
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index 63a4efd5edcc..d2b43b189b14 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -600,3 +600,23 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
> > 	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
> > 		hwe->instance == gt->usm.reserved_bcs_instance;
> > }
> > +
> > +u32 xe_hw_engine_fast_copy_logical_mask(struct xe_gt *gt)
> 
> this deserves its kernel-doc, probably with similar info asked for in
> the commit message.
> 

I thought I added kernel DoC but apartently forgot. Will fix in next
rev.

Matt

> Lucas De Marchi
> 
> > +{
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	struct xe_hw_engine *hwe;
> > +	const u32 fast_physical_mask = 0xab;	/* 0, 1, 3, 5, 7 */
> > +	u32 fast_logical_mask = 0;
> > +	enum xe_hw_engine_id id;
> > +
> > +	/* XXX: We only support this function on PVC for now */
> > +	XE_BUG_ON(!(xe->info.platform == XE_PVC));
> > +
> > +	for_each_hw_engine(hwe, gt, id) {
> > +		if ((fast_physical_mask | gt->usm.reserved_bcs_instance) &
> > +		    BIT(hwe->instance))
> > +			fast_logical_mask |= hwe->logical_instance;
> > +	}
> > +
> > +	return fast_logical_mask;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 11c8af9c6c92..4a7fec5d619d 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -345,11 +345,12 @@ struct xe_migrate *xe_migrate_init(struct xe_gt *gt)
> > 							   XE_ENGINE_CLASS_COPY,
> > 							   gt->usm.reserved_bcs_instance,
> > 							   false);
> > -		if (!hwe)
> > +		u32 logical_mask = xe_hw_engine_fast_copy_logical_mask(gt);
> > +
> > +		if (!hwe || !logical_mask)
> > 			return ERR_PTR(-EINVAL);
> > 
> > -		m->eng = xe_engine_create(xe, vm,
> > -					  BIT(hwe->logical_instance), 1,
> > +		m->eng = xe_engine_create(xe, vm, logical_mask, 1,
> > 					  hwe, ENGINE_FLAG_KERNEL);
> > 	} else {
> > 		m->eng = xe_engine_create_class(xe, gt, vm,
> > -- 
> > 2.34.1
> > 
