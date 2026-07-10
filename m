Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613E6C43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 18:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2137410E218;
	Fri, 10 Jul 2026 18:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E+/ez70v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C4D10E210
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 18:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783707804; x=1815243804;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zYNUWYH7VI+0MbVTOub4n4MZkzsTau/HTkFZPBniK2c=;
 b=E+/ez70vrnoWVemLW4k5MmPFxVmO8VWDJJEYgBTSBip5SXAIUo74cLJm
 1gADu8C09WDYwtrDnT7SieQ5kwdPHO+mqGCTqAd02sByuj9iGDL8miCRU
 Qz/dtQIzFUjE9barQW4MwHquLpyu1hFqxsauxP1DhD9vPYSvVRpnauMpZ
 Guurzhj29T1HNvdRjwI50e4MP8czQ7fffn6yUG/XsRMBBKhxWdf/ymfzR
 lIqB5G0saRsyF305BDSaVeMJ+Qd+OM8A+WqEiYruFDHDd7Q7iMsOUg2Vs
 7sdFxZbCXSu8hoj0tJOv+8i3ab5/tSjpW05XGbTKQhs5b/pgQTGUpByxP w==;
X-CSE-ConnectionGUID: WgT0Xo2xRriJZl/hTecimQ==
X-CSE-MsgGUID: 8jf7ZU50Re+PHXaqpQBkVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="86954746"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="86954746"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 11:23:23 -0700
X-CSE-ConnectionGUID: gQMqnKFHQCe87/Ux79bBLg==
X-CSE-MsgGUID: nVmNIkjPRoWMgvrgI3HoKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="250966784"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 11:23:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 11:23:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 10 Jul 2026 11:23:23 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.30)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 11:23:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRovg7Pcn9A707BwZkkQdFBIdZ7R2oYkTBTobpe1LU5WAzGVR5Kb+o8mgfhS1y1XoUOY3kbfOHuFp+bQSnak3Th476HCprrqnfQYGSymD4rDZu1CvbncAV/cLFBcsPWfhPngrfiVq9Gf64EP6K1MB1ehhIVh3BuF5ORbKVPeaiMf8LA2fVLF3CNPOj5glVafl58cFnvL+pjOl13MnL8zWDQg+IYLZNvh4mKvgbHpDWevCStdVb1lSa4W1jnr6ZgxU29ZvPQVsqxTrk9HOgfKuhb54oisfExhdTkSlEyCiUloB+eftfkCpGvFO5/3OeYxZWaRwVPQCP+CI1/eTqesmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzPoAHpnOXJ/eRXnzCBq8Fr8smPqGIFmSajY9PFGv0A=;
 b=ik9LF+y98xzIkWpMKMjSpGD1EGpEiP1VAPKPAM1m78MU8GdEKPJyVDfr+QCq5OyCcg0DApXSuiPoxLCMhTOC70MGO0MdJCV/LVImFo6Im23Om8ndetUyL5KJdRXhcOEe0+L7asN9luhLNYy9ILUJ3BhDLmLHzzw2Hz9tzDjYZRA5XRxufZyKJPFepN6JEpeTdZR+/j/01lKdzjV4FO15DyGHDkTKSZLJ0Pi4jNadyBW6/r57WPL7zcz+YVa/K+9amrdZOlrCJ1PXMeOaPnWsPHIAT2iu1jgGGFKtHEu4KUACuaPwKJopqzFCaqD0QnY83vr+wFxK5DS3KfPtc5iuaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7655.namprd11.prod.outlook.com (2603:10b6:806:307::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 18:23:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 18:23:18 +0000
Date: Fri, 10 Jul 2026 11:23:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 2/5] drm/xe/hw_engine_group: propagate suspend
 failures during mode switch
Message-ID: <alE4k3IwG9Qh8/Wn@gsse-cloud1.jf.intel.com>
References: <20260701050730.1776476-7-niranjana.vishwanathapura@intel.com>
 <20260701050730.1776476-9-niranjana.vishwanathapura@intel.com>
 <alACfMCbLyNwiq4m@gsse-cloud1.jf.intel.com>
 <alBxh-pgi1XDTPwW@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alBxh-pgi1XDTPwW@nvishwa1-desk>
X-ClientProxiedBy: MW4PR04CA0225.namprd04.prod.outlook.com
 (2603:10b6:303:87::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb362f7-2882-4f08-f088-08dedeb05060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|18002099003|22082099003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: zTmKliOUyl7VZRZIj6mMi5gEcp9jTKfg2xsu6OdRxtXgkEOQ1TTzIwpnvQysiXcAfVLtEeOZTmV78KKtsGwqF38NdaUVqg0KTtkNiusyYeDCoS3LziIIruAdFzLuLxAU2nnOSREfhzDWlBACZKIRun82uTxAPQ0veNCmGtNFAgT6L7zfDO4OhNIQGGS9UnhXxyj2rjf+r7GUnHrsgdykvoMeUouxU1a9+A7ksHjSovdRQ+t1+O3Iypq8WqgX5+nkBy2UGYkkkW4twbjXvaK1e91jMNGV2YGETV8r4JX8pgk8+2N3agiloTK8UKDjWS1Ph+SFcrLzI6Ys2aip2co07SM4yway2/Ovt+CazSjlrFFmtpaYXH6qL4DeyVvxnkUMP/ldSOqLMUjmtnUjQsHs6Ze5YUrkTUp0ppJxRuBiasFuWTLPCPojgZfg9Bzn4e/EH2vhpUVYzzF29fcMxDkRmrYift+mqnfy8GhPf3AyvbgZjnNj/GfshFZUi4w0lLvF4/lj72yD9fo67toxzmBQU1TmLwQ5eWiUGuCjpT2EF7bD1Y1ZWa2XSZK4NmcuQTBnHmwr0xcpbUVYHrPNasHBbhOfor/Rq2hWQq3oexSOZmbGfIzYxIShcfnBSA0wL/D6vBJrJhp+n42o9hecSTPxb81oosU+wyyDG1rcZvDd0VI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(18002099003)(22082099003)(11063799006)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GedFbdnjtVlNqqEyFE9dRr6/oXjYo4xewvjeRi4q6TQZYlgYxl6+QwiOih55?=
 =?us-ascii?Q?mJ/s4BFSsnau8ouqODEZ+kNTCmNKGiOEqPNsvTuSZyvuHLFA+0gmaElOCG0b?=
 =?us-ascii?Q?eBupr8OrC8xjGc5tQtQkTnY3gmg5dV4g5421H4FnIA0lR5UnSZXqqseULFhQ?=
 =?us-ascii?Q?9cydFShUdmvvQkIUToCnHQJVMOxRPrHIR0ISoSFc+Jf4GsMQwB+TyNoNCGef?=
 =?us-ascii?Q?9U3L/AMqYxMQxSa5kCJqCVgt3N+QPKsyEgKPMobUm4aMMCnvqo3Ssf/chBzN?=
 =?us-ascii?Q?7xbQcqSnE6GyF/rMITVs3QH4znaRlkC3gqsHdTRE6K3II1vivz8nJUdOc3Zn?=
 =?us-ascii?Q?d14HBYNCzWGKpEQO3AsV3/O1PMloO5fd/OoCqw2Ue7z19a9P0moYYAtj5bIX?=
 =?us-ascii?Q?JM6dXikbJeQre4HHtPJ7R7MMYSXMLMJ5RH6wR8bcGCL4vrH4+700Zf8EN+kY?=
 =?us-ascii?Q?eLfcMHdHCrefR+Y8FlpZ63F52N08faWsRSZh1P0ACERlWxUOK0W0l8/OQHZx?=
 =?us-ascii?Q?UQrSs/W7ZkF9VfuhHYehKPgRmNUSkfoGeIK56lqESBBpr4kAFri4iwBDRCGS?=
 =?us-ascii?Q?verZ7en0dRoL6QobsE9wqhQ2jpbXEicOmnayhyXfMq2GqKZXqN+/g++KPd1x?=
 =?us-ascii?Q?9NuIjHsvheYH5ebK+0Ioru9Cvsj9eZh7pBQEi1/ds9wNjsYSoqlkUdwQAwgw?=
 =?us-ascii?Q?6W/g5fltLa8aYc5ntN+/Fh10OVnIeXPcyTU100ZtnWkoULkp+botioTCMREO?=
 =?us-ascii?Q?nRNvZn3WdZ8Cii7tibxwuaUMj1hE58MCQIuwKEjyLU1eEZUkAFcxCqjY3NZX?=
 =?us-ascii?Q?pai8MobHtPpZqQDsc/xnQv606YrcZm4HACRzckxdBlf98bKMR7IInbpSJdJ/?=
 =?us-ascii?Q?vgFnFcjIF7oO1q6iHBLKlMEurXvS5H8LEVDeuRsEZjfYgeaOtERlZcX2q/O1?=
 =?us-ascii?Q?XaxeVy97PdTlUMP4aX340ReuUb5A3AEEapvbEnt7Yi7/xfYsO5tRZmr8Q1wo?=
 =?us-ascii?Q?yU438h6or7wZOaoJHN/TGPNAATcDB8IR0P6abriM4mKzZQoHpX7/rH+EhdNV?=
 =?us-ascii?Q?vYknsOqm5XUoKNzk7TTRLq3Uxhm5jmlwd6PpCm44BiBXJKA/f9FJgvQ26pKF?=
 =?us-ascii?Q?g0qarwuu25cczkOmNAoSnNyL+BwuCrA4IvGCIpAKwJ2A3M+P7fEA4T7+tFAU?=
 =?us-ascii?Q?gETHQftapUfEiZO0z7mtSLbciT+TxOHTlpDWbUyZ8A3bZvwTxnE12m8XVEhi?=
 =?us-ascii?Q?TlbG2Se8Bl4diMUxlP+hX2hXA6ibZZOJA3ImLfd0ixePGq51hwcUjHYLoPye?=
 =?us-ascii?Q?lS/3THNO/ORZRgaOMdwuWaU6947ndVs4jDaofac+e6qumXx3NuOqeJDYU8Jb?=
 =?us-ascii?Q?ZFmFPqFWtCR/oqeqUrZ72FSkuchLTQ1z03DPU73yV4lvJ5MGQAmAMvCpBSk2?=
 =?us-ascii?Q?n/EkWmbMgmKOL9KJMDcWh0TuWK4MxEkEoxAgabt/pk0tlEKK/XV+hANv4OeJ?=
 =?us-ascii?Q?PPNk+UrpnedYjX6PQXjOVTiwqTRNcKC7hw5B1tXyFhbSBfzqaqVIEwB9NGsm?=
 =?us-ascii?Q?W3lcvM6zwP9slJQZrSDKLJpIX2kGLMJ1vIvciif5jAQ0uxllj0teumg3CD5n?=
 =?us-ascii?Q?gzK8Y8wRZkFO4YHI/jHmGNAVD0p9VeG43ePbn3qldqZ9HCs7mAhmB3tpb599?=
 =?us-ascii?Q?VpoKuxHVjSeeCu3k/iu4Ndh/jbMzv8b3ZJGi9SV21xTQhyFPejYqV7vs9Bu6?=
 =?us-ascii?Q?vZ+J2TST757Mt0m5dSebasUmDtkarlI=3D?=
X-Exchange-RoutingPolicyChecked: m6hi3QBGIjamtoJfuXza9AY2H5hqItAHuxNUARvO2IpOO5wRGsbA7UFIBO7CjFcg+qDjSK4vZNRsRT9tEXCPExZDvKqj3ciieipvHf/qg20DBqVLMmRxBsgqCYF5FZ0aBm1PkqW6NupSHFRKxvFWXDgBQoezkkb+VTKUQn25GkeeyfBLSIs0yc3dkSQbasuYqJ8it3wdAo9dRIsNKta3QLfFnNl/eW4cc9Yz2r+Zwp7sh9HxcmO7Y1Y2aQZNcqbYRkUsCCUkajokvE3QCryDeDFUcJ8zDYxBn6EU3aVY1mXWmpA9skEvCUTbDjMrkc3jaIwbO7kIq+7zF6NSp0fn1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb362f7-2882-4f08-f088-08dedeb05060
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 18:23:17.9353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSlHTmEUoezK6c3cZMGqygCfU1L9segyjBWNnPNv1G0IvevLP+Amem6usmw0L1wH6tLX2gOJ/6xIK0Q/ehPvEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7655
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

On Thu, Jul 09, 2026 at 09:13:59PM -0700, Niranjana Vishwanathapura wrote:
> On Thu, Jul 09, 2026 at 01:20:12PM -0700, Matthew Brost wrote:
> > On Tue, Jun 30, 2026 at 10:07:30PM -0700, Niranjana Vishwanathapura wrote:
> > > The hw engine group fault-mode switch suspends all faulting LR queues
> > > but ignored the suspend()/suspend_wait() return value. A suspend() can
> > > fail (e.g. the queue is killed/banned/wedged), leaving the queue
> > > un-suspended, so silently continuing could later resume a queue that was
> > > never suspended.
> > > 
> > > Propagate the failure instead: in xe_hw_engine_group_add_exec_queue()
> > > bail out if suspend() fails, and in
> > > xe_hw_engine_group_suspend_faulting_lr_jobs() undo the partial suspend
> > > via a new err_resume path that resumes the sibling queues already
> > > suspended in this call. Record per-queue success with lr.suspended so
> > > only queues that were actually suspended are waited on and resumed, and
> > > skip the cleanup resume() when suspend_wait() failed or the queue was
> > > reset/killed/banned/wedged (its suspend may not have completed, so
> > > resuming would trip the !suspend_pending assert in the resume path;
> > > teardown resolves its state instead).
> > > 
> > > Gate the group resume worker (hw_engine_group_resume_lr_jobs_func()) on
> > > lr.suspended for the same reason, so it only resumes queues that were
> > > actually suspended.
> > > 
> > > Assisted-by: Github-Copilot:Claude-opus-4.8
> > > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_hw_engine_group.c | 76 ++++++++++++++++++++++++-
> > >  1 file changed, 73 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > index 02cf32ae5aa9..84851929c16f 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > @@ -34,6 +34,15 @@ hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
> > >  		if (!xe_vm_in_fault_mode(q->vm))
> > >  			continue;
> > > 
> > > +		/*
> > > +		 * Only resume queues that were actually suspended. A queue whose
> > > +		 * suspend() failed (e.g. killed/banned/wedged) was never
> > > +		 * suspended, so it must not be resumed.
> > > +		 */
> > > +		if (!READ_ONCE(q->lr.suspended))
> > > +			continue;
> > > +
> > > +		WRITE_ONCE(q->lr.suspended, false);
> > >  		q->ops->resume(q);
> > >  	}
> > > 
> > > @@ -140,7 +149,18 @@ int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct x
> > >  		return err;
> > > 
> > >  	if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
> > > -		q->ops->suspend(q);
> > > +		/*
> > > +		 * suspend() can fail (e.g. killed/banned/wedged), leaving the
> > > +		 * queue un-suspended. Propagate the failure so the queue is not
> > > +		 * added; on failure nothing was suspended, so there is nothing to
> > > +		 * undo. Only record the queue as suspended (and later resume it)
> > > +		 * once suspend() has succeeded.
> > > +		 */
> > > +		err = q->ops->suspend(q);
> > > +		if (err)
> > > +			goto err_suspend;
> > > +
> > > +		WRITE_ONCE(q->lr.suspended, true);
> > >  		err = q->ops->suspend_wait(q);
> > >  		if (err)
> > >  			goto err_suspend;
> > > @@ -216,8 +236,20 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
> > >  			return -EAGAIN;
> > > 
> > >  		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
> > > +		/*
> > > +		 * suspend() can fail (e.g. killed/banned/wedged), leaving the
> > > +		 * queue un-suspended. Propagate the failure, but first undo the
> > > +		 * partial suspend by resuming the sibling queues already
> > > +		 * suspended in this call (see err_resume). Record per-queue that
> > > +		 * the suspend succeeded so only those queues are later waited on
> > > +		 * and resumed.
> > > +		 */
> > > +		err = q->ops->suspend(q);
> > > +		if (err)
> > > +			goto err_resume;
> > 
> > 
> > This is not right. I think what you want here is:
> > 
> > err = q->ops->suspend(q);
> > if (err)
> >        continue;
> > 
> > A killed, banned, or wedged job should not abort the entire suspend
> > flow and propagate an error back through the user IOCTL. The "group" is
> > a cross-process concept (i.e., a global concept), so a queue tearing
> > down in one process should not affect submissions from another process.
> > 
> > I'm pretty sure you could trivially cause a compositor exec IOCTL to
> > fail by running applications that page-fault and hang, or by killing
> > them with Ctrl-C. Under the right conditions, the compositor could then
> > see an error from its exec IOCTL while trying to render a frame.
> > 
> 
> Ok got it, will 'continue' if suspend() returns error here.
> 
> > > +
> > > +		WRITE_ONCE(q->lr.suspended, true);
> > >  		need_resume = true;
> > > -		q->ops->suspend(q);
> > >  		gt = q->gt;
> > >  	}
> > > 
> > > @@ -225,9 +257,13 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
> > >  		if (!xe_vm_in_fault_mode(q->vm))
> > >  			continue;
> > > 
> > > +		/* Only wait on queues that were actually suspended above. */
> > > +		if (!READ_ONCE(q->lr.suspended))
> > > +			continue;
> > > +
> > >  		err = q->ops->suspend_wait(q);
> > >  		if (err)
> > > -			return err;
> > > +			goto err_resume;
> > >  	}
> > > 
> > >  	if (gt) {
> > > @@ -240,6 +276,40 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
> > >  		xe_hw_engine_group_resume_faulting_lr_jobs(group);
> > > 
> > >  	return 0;
> > > +
> > > +err_resume:
> > > +	/*
> > > +	 * A suspend()/suspend_wait() failed partway through the mode switch.
> > > +	 * Resume the sibling queues that were already suspended in this call so
> > > +	 * they are not left suspended forever.
> > > +	 *
> > > +	 * resume() requires the suspend to have completed (suspend_pending
> > > +	 * cleared) or it trips the !suspend_pending assert. So skip the resume
> > > +	 * when either:
> > > +	 *  - suspend_wait() fails: the suspend did not complete (timeout, VF
> > 
> > VF recovery is a non-issue given page faults are not enabled on VFs which
> > can migrate. Don't bring that up here as if that needs to be handled
> > this code would have to look different, or mentiond VF recovery doesn't
> > need to be considered.
> 
> Ok, will update comment here.
> 
> > 
> > > +	 *    recovery, interrupt), so suspend_pending may still be set; or
> > 
> > IRQs are a valid concern and this part doesn't look right.
> > 
> > > +	 *  - reset_status() is true: the queue was reset/killed/banned/wedged.
> > > +	 *    suspend_wait() can return success in this case via its killed/
> > > +	 *    stopped wait condition while suspend_pending is still set, and the
> > > +	 *    queue is being torn down anyway, so its state is resolved by
> > > +	 *    teardown rather than by a resume here.
> > > +	 * In either case leave the queue marked suspended.
> > > +	 */
> > > +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> > > +		if (!xe_vm_in_fault_mode(q->vm))
> > > +			continue;
> > > +
> > > +		if (!READ_ONCE(q->lr.suspended))
> > > +			continue;
> > > +
> > > +		if (q->ops->suspend_wait(q) || q->ops->reset_status(q))
> > 
> > -ERESTARTSYS on this process doesn't mean a different processes queues
> > are bad. I believe what we need to here is suspend_wait_no_irq(q) to
> > recover any suspended queues back to the resume state. Yes, ctrl-c /
> > process kill will have block but I don't see any other option to
> > maintain balance.
> > 
> > So I'd write this like:
> > 
> > if (q->ops->reset_status(q))
> > 	continue;
> > 
> > q->ops->suspend_wait_no_irq(q);
> > 
> > Or feel free to a no_irq argument to suspend_wait.
> > 
> 
> Ok, will add a q->ops->suspend_wait_blocking() to be called from
> the error path here which will just use wait_event() variant (the
> non-interruptible variant) and will not include vf_recovery()
> check also. So, it will be absolute wait in the error path.
> Is that fine?

Yes, that sounds right.

Matt

> 
> Niranjana
> 
> > Matt
> > 
> > > +			continue;
> > > +
> > > +		WRITE_ONCE(q->lr.suspended, false);
> > > +		q->ops->resume(q);
> > > +	}
> > > +
> > > +	return err;
> > >  }
> > > 
> > >  /**
> > > --
> > > 2.43.0
> > > 
