Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99330C61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 00:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4039310F7F3;
	Fri,  4 Sep 2026 00:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9B+4Er8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B92810E031
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 00:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788483480; x=1820019480;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ri0KNrdeo1gSi1rXqus9+wJ74b6uTjOyfexkh8QT+2U=;
 b=m9B+4Er8FiiaWu26P1c3pSc/pNXyHCLX/8qhPIEpziK6L0Cwih+Qda+i
 w7Gcccvhns56y4DaE2aRyzMFBtdSPaz9gJOAdG4jiAy//j41dDedUbMpT
 3z6QX2uaxgLqLTRgDmeSmX+7LusbrEZpr7Vy0a0GklPHFY9R/JYOM3Y5D
 1WdiLVd6UBRno29t+KJy9Fg/NK0fF64GO+LeAkuXvA/QTPDtiaNzfEaV0
 B/VKA5wxXMFAOireJHfNwcZ6mOpGZCDL2EmUMlPlxHEeN8cAEx6tcXQEv
 RPLpW6VK1LQgDH4pma29g4VRKl/d0n6PgzDn2p/oYKYeoPp51ScgmANH+ A==;
X-CSE-ConnectionGUID: 2WKIq/rHQIGR5xegxgkI8Q==
X-CSE-MsgGUID: aOqvw/EPSl6GsPVePf/3MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99641184"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99641184"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 17:58:00 -0700
X-CSE-ConnectionGUID: ybyQ8z5lSqCEqEg4QIahmw==
X-CSE-MsgGUID: hGzMWhIrStaDQC2PSC+cBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="269358353"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 17:58:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 17:57:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 17:57:59 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 17:57:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJUZDHtlWc7STeEWDVjDv/zYXskWpKoV+sVSwdJPb23iA+gsSIEYJfTopr/rx5RrPvT/haglZb4N5FCCMooN4VCasaBIrYeshkOB0nHaXHWQbVumIe3wwxelb1YWNzVVOl8psmzyWUOQVpSwgLdoy8LpYblLv7+o8TPQCI50rl/nMrgwwfaofI8xHiQQtRi4BwDTlzuBYsJJ6IMK/6U1qztTGLwq6ua7AamNBJdA7B9iRoAT7ZSaP9kOYejripU2IctlHLzOXlEwW15ttZAHoVt3th2FoowfJWVN/t6dWQ5xLLlKCOraLaIAQB3pdtMd+M+vq0ePpPt+PrnhHvHGqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akzTK9A+spYfrgrVIwZnJCmNKPcIPthdEZcDQ/sezvw=;
 b=SNwFSjB6unmcHGIx2Jb8jc3AVuwbJRIDtxqinVc6MxDiIqQ0SRnyV7VXVYxh44KYNfnz/dGyKtFXOFiCphdOQCW3JJi6BKR7IiiyXz3y/7BC104Jy7tWGnblcGGUyiZu6zflBaWmThibVCHf9qZFt5r+rrOl2l+938qDEASwNeVGV6Y2rjsMScGNqmHgKpLc7C3SwzmHhhOadIiEqaz6mtx61cg3SKb9hSIysBm8qNb2CzxYHwVqerWVAGKnNJCy2y9KY+st+vUPXGU004/XED4X1g4VC85Ln5pMwXq+PhMAroDgnW3cQ7mtfmuCQrcZlR8mhEoDaDonCvFlE2DTuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA6PR11MB469167.namprd11.prod.outlook.com (2603:10b6:208:5e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 00:57:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 00:57:56 +0000
Date: Thu, 3 Sep 2026 17:57:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 10/25] drm/xe: Update GuC submission backend to run PT
 jobs
Message-ID: <apoXkWK7ybUlsKIx@gsse-cloud1.jf.intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-11-matthew.brost@intel.com>
 <20260904003650.4686B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904003650.4686B1F000E9@smtp.kernel.org>
X-ClientProxiedBy: MW4PR04CA0065.namprd04.prod.outlook.com
 (2603:10b6:303:6b::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA6PR11MB469167:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d60f08-882c-45af-9bbd-08df0a1f8e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|4143699003|10067099003|6133799003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 6GCfBzQqBG0pxO1PGyUhYtjljHLTeuym9zW7t79Cg6yIb8Q0zQ6M2hozsL86Lys5WoKdDCqIGiVG+vhT1rAPdf9Gz+FArWkib1/BnkPKeVJ6otgL7o6KOO1S3gXScxWT9OMAxkQkov1mmq/r20m78opXPILKoyaMYA/BLZkeWDydqY+sknp6L721ytVAR/82Y+/7qgj60VDj2SFUx0pFAjmCjmEEjeuxEAMD52t/znENvhYoWHYiK4+K2dxf/kBSiY13wjQ1TNFw5Gav/oa1rkh1pCGcdm5dIqmPIRRlBtpXLo5Bhhfo+plp0SsX5A9k/QO5z5kXC/7nGVQ2HH7U7KGkhUdAlKEpb/q+nrzSglbsTMEb8+3mJ2wriOs14BKcUU8mtRtmImcU++amtaWjqc+XNYKnuJsq3uO41ZLttOHwAs36NMOFX+HS3YoBP7Kpazkt2HlFvRSe4BPKEVTDz7nkae78CXykgfvXeL0rkfDPGL5aXDQJ/2zfjZtocD8LA4ooeCNRz+eX53OFdczVLaqltOr2HVDpKVl1oP16r/ZE89S3Kwff5jmaqNYVYTshOnAPZRgrmAxs2ifLPq3vmILqMWfht1u+kiFJ0DQmuWs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(4143699003)(10067099003)(6133799003)(11063799006)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VoOPoJx+MiRwWV2FLwNlaLit/LhcpA7rgrqSiXrkcMBuU/LIy67dfI8rW7?=
 =?iso-8859-1?Q?C7rxNzCXkgALRWGCkD1vVrYlMdzNYIzmQjBeuHLHxYEG0UlMISz3iUg069?=
 =?iso-8859-1?Q?OCrEfFf0Prh6OGMYwDNG+OvG5DV4WSLpp2RAx41HvvyThPTZ3vw6Wu1QdZ?=
 =?iso-8859-1?Q?N9+H/idvjUdvEyopXW85FnFBXZK4DhIZBq4GvHj9w66A5PYGWyIh/79lDu?=
 =?iso-8859-1?Q?hBZxm1BMHPDhoVOrMRGjgZ1GW5H8H0x3EOXOrkT0TkEE8aojt0X6p8zq0E?=
 =?iso-8859-1?Q?CMfZ7elY69aggDRazKiB2Kcq7SZGurL0wdMgm9kpNCkOtlUfChhnST10Yq?=
 =?iso-8859-1?Q?JAY3YiIPSI2mu2396HckgwfJyPgqY7qqVwZOIyg/YoTufIjZ8B0k+7tVGv?=
 =?iso-8859-1?Q?SvKjwidS+7MsAHk/NMtF2UdicLPPk4tp6pEepT11ywTjOBSXkmgh2Evl0a?=
 =?iso-8859-1?Q?wKP3QUXab9etI2Sp3c7ngFiLuDh69BU9abYUDLMUrGqz5wvZyfLRL051Q4?=
 =?iso-8859-1?Q?KYryy2ZhzJzguY7fFmrwzL1K8LkAuxFKUgsGar5h2q6OxOSGxY9JrGBUWa?=
 =?iso-8859-1?Q?umns0/LcJDUs3wJPIyg7MMvpY4G9Z3s47RaJ3bqm53zFiBvhNGhrqpPdgd?=
 =?iso-8859-1?Q?ZOpCoa/d7Jimn5R+M2N0asjZj/EJZ+X/bLj1K/++am6MbFohW1hEc84xKU?=
 =?iso-8859-1?Q?j0JbuqaELPW7zN1ndbaWw9QCif02gv31L6Y7g2h97qjqG7L5o8GQGNzubk?=
 =?iso-8859-1?Q?EGysqrujjYTxXvMGxKdHQFZXqhfqcziScyFttLoo1UJIo+6lcEQ3ndQPpR?=
 =?iso-8859-1?Q?kY1c/YeL9qx9vgjCSK9flhv8yQkHQ3o5OVcVCaM3mjvCXDPfGXfDJiz9BT?=
 =?iso-8859-1?Q?HYQQ97mQllZBh1VMCa2yJs4Mlbs1GfBC3yvxa31fyglQF8r3+7pBrDaYrr?=
 =?iso-8859-1?Q?D2AjmUVrt61rwYXnyAbmP+fVW7X79xaZhf9GDpmp99SFuVW6aq3tsMfglQ?=
 =?iso-8859-1?Q?1kcwR7tvX/lP6uecFXKzinFU+sGR/VQW0K9W9IR0NWjWcGtiFFYnkAsqDY?=
 =?iso-8859-1?Q?xF/kTgM77lHU3+ek7AnRrVmHEbTtndLwvx+uK/6RdOCfWdxyMkCw5NFDJK?=
 =?iso-8859-1?Q?FmEzge5cQazVbT6aEAFvc3tg9zOII+le97lD5Ts/5oSK7zaH1i5g1XwzMN?=
 =?iso-8859-1?Q?mEbPhKrNyiladMDyVfB26aLcep9JNx/Z0OYbNmWmZmVVaxO8UIZGxy1PWt?=
 =?iso-8859-1?Q?Pq8C16x543x2FKaS6umelbHD5UzKnX6DnBQxLPGfOwqmOXNWCXF2fHK7E8?=
 =?iso-8859-1?Q?HMWkvDWLPBXPoAInIpErs0TBLhvyb4Mza5QK5XJp9x6sKqc7EAeYnO8zIU?=
 =?iso-8859-1?Q?RzlapHcmR9JUoI4kgLP+BFHyJGZdbK4u6+iIWq3WcOWSxbm1Du8bSv+bky?=
 =?iso-8859-1?Q?aQwOREhJqLxd0b2kII95EfIu85fpdyTMcu7GHGrEqK8CvywxMx3qxWDh+p?=
 =?iso-8859-1?Q?gdTRrGFBa0rU6YwXYxVwt9xvm8E0/rEIZgUWOYQ+EhvdJM2RcP15ZSAo9i?=
 =?iso-8859-1?Q?V9u++Eqwd94CrKqIA/vO2a9bCrqJbnCnVyTb656WrfStfnPUMBaTadL+CL?=
 =?iso-8859-1?Q?w2OlfGyzMPfxhrhwprKAKQwrDsQ/cqnT+e5pnxKc0lOZ2HmfGeG+C/i4Oy?=
 =?iso-8859-1?Q?eY66QnAHu+xdBpauN2LwlatrykDxIdKTfdlD5lYFY9VxyZVVGcTw0USKiT?=
 =?iso-8859-1?Q?MHl7kiD+jAAkS6jfiD4kQdxcM7hBGi7aiDOCWWXsCtXvU+nHP+WMk1EN2b?=
 =?iso-8859-1?Q?WPw+Zexvvke50zZfqaaVNna8qcQslSU=3D?=
X-Exchange-RoutingPolicyChecked: O+9H48WMV8DY5gv9myTMIQzpGZKVyYe2oVKfThcr/QiRr+JfSUhj8BxFdzmAhbL/xvLI+aR2L+zcpVZbBS20xnJ61eHs/xuMTJhdexuOj/7g6slofdMvdsBQcpgNBJY5IsSmm3u3BFimS8xfowR0oR1VIWpO0J51YWTl9wr+Et1Njcgw26ys4xwxXwC/q/G0OoRYP6CYT0nGVbmlf7ci79uN2mOdfcwQnaFoIAF1GitjR95Eg3Ugaq4DKiD3RhFTZYX4u+/SY54TA8nnTqrylG83j0dtp6gvUgX+IlG5nNVTH5ARj11QH0pL/CH0RByDytnHYYy0Q5T8VHU9FQ2pZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d60f08-882c-45af-9bbd-08df0a1f8e6d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 00:57:56.1057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWdjhUO8kHRZVcV6NcYoMETwPLXYPXM2TEpvVhYne/dMoyL83MX+0jbD8ebyJcWs9e6p0cL2K9fXav78Vxr4mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR11MB469167
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 04, 2026 at 12:36:49AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] PT jobs on wedged, killed, or banned queues silently report success to the DRM scheduler, masking failures.
> - [High] Memory leak of xe_pt_job_ops and dma_fence references if a PT job is aborted before execution.
> --
> 
> commit 86f7996687fb641831b3ca6cb60d0fed641a6978
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Update GuC submission backend to run PT jobs
> 
> This commit teaches the GuC submission backend to execute PT (Page Table) jobs.
> PT jobs bypass GPU execution for the final step of a bind job, instead using
> the CPU to program the required page tables.
> 
> Link: https://patch.msgid.link/20260228013501.106680-11-matthew.brost@intel.com
> 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1261,14 +1277,25 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> 
> [ ... ]
> 
> >  	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
> 
> [ ... ]
> 
> > +		if (is_pt_job(job)) {
> > +			xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
> > +			run_pt_job(job);
> > +		} else {
> > +			if (!exec_queue_registered(q))
> > +				register_exec_queue(q, GUC_CONTEXT_NORMAL);
> > +			if (!job->restore_replay)
> > +				q->ring_ops->emit_job(job);
> > +			submit_exec_queue(q, job);
> > +		}
> >  		job->restore_replay = false;
> >  	}
> >  
> > +	if (is_pt_job(job)) {
> > +		xe_pt_job_ops_put(job->pt_update[0].pt_job_ops);
> > +		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
> > +		return NULL;
> > +	}
> 
> [Severity: High]
> If the queue is wedged, killed, or banned, the execution block above is
> skipped, but this block unconditionally returns NULL for PT jobs. Can this
> cause PT jobs on failed queues to silently report success to the DRM
> scheduler and mask failures?
> 

The intent to is drop the job on sliently in this case, so code is correct.

> [Severity: High]
> This handles dropping the extra dma_fence and xe_pt_job_ops references during
> normal execution, but what happens if the DRM scheduler aborts the job before
> it executes (for example, if the queue is destroyed)?
> 
> Looking at xe_sched_job_destroy() in drivers/gpu/drm/xe/xe_sched_job.c:
> 
> > void xe_sched_job_destroy(struct kref *ref)
> > {
> >         struct xe_sched_job *job =
> >                 container_of(ref, struct xe_sched_job, refcount);
> > ...
> >         xe_sched_job_free_fences(job);
> >         dma_fence_put(job->fence);
> >         drm_sched_job_cleanup(&job->drm);
> >         job_free(job);
> > ...
> > }
> 
> It seems the destructor fails to call xe_pt_job_ops_put() for PT jobs and
> only drops the primary fence reference. Does this code leak the xe_pt_job_ops
> structure and the extra dma_fence reference taken during job arming if
> execution is aborted?

Every job put into the scheduler reaches run_job, so a non-issue.

Matt

> 
> >  run_job_out:
> >  
> >  	return job->fence;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260903235842.3401722-1-matthew.brost@intel.com?part=10
