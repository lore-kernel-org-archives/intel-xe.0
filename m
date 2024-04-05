Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0ECDC67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 20:21:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52939112A51;
	Fri,  5 Apr 2024 20:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCszdC2v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EF8113CB4
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 20:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712348498; x=1743884498;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h2qLf5n6O2dyX39fFV7QRbhSwpArEOOTE68z5aTpRww=;
 b=bCszdC2v6T0A8Ze0I/ArYWz8LwcgvpKrKkf8tiLMeTER+qjPAMqFyG+b
 vfTLNvzjIRUXNYJ9Ncs1VqE78lLdSE/SxcEWvHcQXROhhwue1l91/H3Em
 oL5eypEO+JwYI/S/0QSanU2s4178ig/jsDp6WiC6tQgPna2y7qYoabh7D
 QyKa0HcnWsTzo66G8GVmZY/c/KHbFD1S/yKyZdG1NCvk4HXuuAhCaRR5S
 /zwX+A0XbAnbr67SwsITbULiVVTuLkTZ1iIw/NwdP8A4BBbsiZDYfRkJK
 Pr7sYvqEpXZwaXE/j47CeEr7FqmcS2szuBYN0hd+1WiHeTPPujfdhTsOB g==;
X-CSE-ConnectionGUID: OQoKr+nLSlSDfDF8QSJwtA==
X-CSE-MsgGUID: xew0X9vMR+2yZA5vk4Eruw==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="18835124"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="18835124"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 13:21:38 -0700
X-CSE-ConnectionGUID: TLoSM+7eQFiRKZ9rKdEOEg==
X-CSE-MsgGUID: 14F8YLRUQjaX7e0A9EO+xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="23995455"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 13:21:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 13:21:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 13:21:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 13:21:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNQRQkSzTvV75HyWBcSPQZGORFiDCi95eiPElM7yHIJcgz/rbSYwe9uhqsHMDQlqn9AQ2zCsjw7NFCVBLzQnl8Y1C6Tm3rGHxzUgx3F/rxhChXzhljlBeIpEu/7bvvq6vjfY6RsMnFyHmAxPjmsyTfJ/qlMp0ZSCMzxwaN3FbzeN78Bj5CMHkLy71zCisG60t+spq9Cbp3QR0uQPRSfcoYHb4oykkCByu7fLiWBH3sFkEKMQdxyCxzXGYPDTchP59oFTuFUAI43XpSHdEgGA/mHh3cPmrqmv8yUes6i4vsz5m7yjgK56VLLRnJqJ/yCQWjDlki6v4uceu+4VGxL7Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYU788M2fkNzEry75gTnAEm4ZxYpCcpjqhl4FzgnGi8=;
 b=DXsFu6Tu5xIpV6CKlQOfFPEGhV5GG8ADHapSpS+HeL8rscScaaMDJyqn3frL3meIPxlEV+6efsY58a47YhyrBXzUhQwwIDaaQFo02sc7IQZUv3o9+iNFUPzddW/Sy6g/dN1G7UNMQ/Yntrftb2vXbV2OmT/9yCeeBQLsKKyoz2fmw5NBn3uaEnaRxK17c/vBX9Ip55ISeI+0OXvRIO0U3NVs6QPdOMWpUDfs2WUc4MwzRXptijV2VBUx/61pJGNqUsUvGRXD5hyR83vImcvwy6urWFbMuIwc4MLuddbt9NYbF+NTGx5cpM7D48GEOXwas0QuRmhfhYw6xmG6ES0lLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 20:21:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 20:21:34 +0000
Date: Fri, 5 Apr 2024 20:21:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [RFC PATCH] drm/xe: Wedged state PoC
Message-ID: <ZhBdOj32bqs0BJNE@DUT025-TGLU>
References: <20240405195358.210783-1-matthew.brost@intel.com>
 <yl2jtllbhav644f5bosst4zfjuk55isf4yt7csmgnm54xibqux@baym2l2smhx6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <yl2jtllbhav644f5bosst4zfjuk55isf4yt7csmgnm54xibqux@baym2l2smhx6>
X-ClientProxiedBy: SJ0PR03CA0344.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8132:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RVpTogTy4bHP8QywA3AxSYcWNA0zUx+/q33nG3VYjg5lhfbVLJKbdFLguP8LeBCrOmDj4rjj/bWVOMKRzKfGIlXQxlcsGtEiXys5Hze/rr/VQZR6pQVGIHXCLeFM+tFowruk44ibQ5MGWBJRic5L1kicVcGzgW5YNCSfI5xIflvK7QH9ZQ9h5TvWfkaJCdMlk5pFTWGABbFstm2Gee5SR1tkybEdmjF655+08/+gNIAH9/SGSAh5A3gUOboFifvTEriDlezTYNZ//V5gqewgSB06b7IuIzepxG0nfLaQilgi2BhM7pWcrYMR8IpxCCrq/53kYVjrBQtRSfdoBDNsfOpLO1fJuxqVRUNf8SWTRuKLcGYOosu9jXUZ2OaiFnGTGyKruqaXafQWpHxCyPdyVVJDp14DfFxQIUA5f9xy+LlUBESki891C8T0yTYCi/a+JojZJw1FzLRWeFoV/6Lwv7nbsl0mOSjReX/xtWsMvuZdQLmUtB5ipReB0HEMdr3rxi6jpVTwkrgixJJb5BtWKIOBZ3kmlzlvmQech1YgwzZGUKJ1uGqIZ0QZiUU7ePvxQTKlSWMCo+x2t3e5RonXVHoSMaqV9vlQA0FuOof/TC5ljNvoUR7F1xSLCqjnP/mN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eIXSfNbyLJd4tpmUaMK4nwaktPUcYAEeRg6WAIgKDWFINVRmEHcDPZrDCkH7?=
 =?us-ascii?Q?9Sgvxa1q7U4Oq1bTl0O7Hor765Ik5xcNr659AxT0WOTrjSDNcBZXRENyB5DP?=
 =?us-ascii?Q?iI6ZiALlVfHcUSff5oCsk6N8fdzB5K+FiJpSd2jU57z0PJ5Kb9k2gGJIe+cE?=
 =?us-ascii?Q?xOm4QmRZ6jHHndSeRBJ7/yFCBoB6wyo1ZVyVm3dCuW32fRC+mbyC88bCPTCj?=
 =?us-ascii?Q?kHDpElLGDZ6wRjhP+GOZfL41Uj+zzpCpw40keZGdqKd5BUc12Sqp1EXCpndo?=
 =?us-ascii?Q?aF59uBfw8PJhnKlNmy4gtKHP/XHMWSoOdEFBtVX6Tafcqitsplso1BRMGeBf?=
 =?us-ascii?Q?AkwGzk1AIrIi0PgaP21v57wA7bhbYTrpx+gLWaBQaIJpb5UDgomUW2wyj+Ir?=
 =?us-ascii?Q?/ntxz6g32nIMi75kogeFERgoBzGY+GWRfxQBmz6NTrHNZgLmDL8dZcPbaEiq?=
 =?us-ascii?Q?B5rZoUeg9q4mKyOcB/k+h2KtXq6biPtXXbtqbl8rXmDDm5sROf6VHwLiHyu7?=
 =?us-ascii?Q?q7T/oGgGajaORdaFPBiXkHOUZ3uGkkaGZLF83jg4bv2S9d6dR8r6g/PdnbEq?=
 =?us-ascii?Q?GUe109UUPe/cKDVlpJc4XvgpHwRdlh54Zsf0ABwzAuO+bvGJqOS/9hIVx1Ar?=
 =?us-ascii?Q?+jPBYdWREE9DfGp6EUXeiVbIXOCax1vdib5YeDe9MVm7vxmS19woqTKzq3XG?=
 =?us-ascii?Q?t6XJZN/TreGWeZ59LOft+tCysoMoJFrqC2RKB0XCXzZlqs9LoLRJ4xRhNLq+?=
 =?us-ascii?Q?Li0quzoj8BJ73+WrLD5tmdjaYeY3zRMstaVr1lxfo05ZwLem18Qu/q3lFYeF?=
 =?us-ascii?Q?4RznUDDb4cVmuWa9PQbg82V0EDUNnXWVGLzapAaU6FcU5lo1AR+wVPI1Z9+t?=
 =?us-ascii?Q?Yy9NbwTP6HiI3u0OCIiwtTBd6gMeqmJWKgYQCnIwgswP+t5oofr0qNXFcvE6?=
 =?us-ascii?Q?mWU4CPc4rOmOC353dS/QDjhVY4icD+p7uOGwVS29AiCzyOzTD0iBKXcyfAm9?=
 =?us-ascii?Q?cz/KYCCkvQIF2b6Z8OQlwIjl8RXg+qRbUUxl88MTjt5Zt2IPmXNnFeHlN5du?=
 =?us-ascii?Q?f5pZMQIfMdRRNty6YkdQ8iRI2M0GVtImQhOq8bazno/CNHCQ2d0nEIDNrT/c?=
 =?us-ascii?Q?cBxahtn4HB3djLyWJZt6+ZIgyc5KV88lxbO7fBIk1FiaD/PdAb2Se8XSN6r1?=
 =?us-ascii?Q?C4FYuxVrw2BlGbX0QJ5EqIXFVwxoiiz/N0PDyGrw+JYEqNyKEIZ0yo2W03du?=
 =?us-ascii?Q?cUQCMttOydGqZbxITFeZLb4LT5onGoIqwJCdEDmhq8J2ZXDwb29kP5OKV7VS?=
 =?us-ascii?Q?tP+9gGAMMOkM8w6lOEl/mqe9wdlMzSEL2CXLCA3wUp/LnUogVrEXVvyhyug/?=
 =?us-ascii?Q?7wAuAoFFcruWun303/vVsjpFSOghYAcNo5I1f4NXEHLAWTpHmJ8UtndI700T?=
 =?us-ascii?Q?V7fOVTfi7+vtoS+csT20fZI/7GN05dGDX7ho2iXbKcL6kvyOp3EJtDkafDFK?=
 =?us-ascii?Q?z+uB7K7bI86LMVGBTUOQsNeYUObzq+iWY4ahCclV5+cAQLqN3+0mvw+ZSd08?=
 =?us-ascii?Q?edSXAoDbgCJvMQRHjfHfuU7dciO0PELr8YmksttXMIvFBolr5BY41rpAgP90?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eeba4a1-9572-4649-6740-08dc55adfce9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 20:21:34.2103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27qf5zeuG2GsfacduLXxYdudEcZXrIVf180B/laDDgEI12GnJ+AWWDD6fuwUvNAXYkXkSywCl5GIg8I9cNiZMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8132
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

On Fri, Apr 05, 2024 at 03:15:47PM -0500, Lucas De Marchi wrote:
> On Fri, Apr 05, 2024 at 12:53:58PM -0700, Matthew Brost wrote:
> > Simple PoC for wedged state based on [1].
> > 
> > Expands on [2] by taking a ref to all exec queues when a jobs times out
> > and stopping all interaction with the GuC. Ref to exec queues dropped on
> > module unload. The idea being if we have ref to the exec queue the state
> 
>  ^^^^^^^^^^^^^
> 
> AFAICS you added the unref in guc_submit_fini(), so I guess here you
> meant module unbind?
> 

Yes, wrong wording. Sorry also sent a quick v2, literally as sent this
Rodrigo shared a script which allowed me to test this out and found a
bug. v2 seems to work (i.e. not blow up on module unbind).

Matt

> Lucas De Marchi
> 
> > associated exec queue / GuC state can be examined via debugfs, memory
> > debug tools, etc... Jobs are currently canceled and cleanup natrually as
> > they do not hold much state aside from batch address and seqno. This can
> > be revisited if needed.
> > 
> > [1] https://patchwork.freedesktop.org/series/131998/
> > [2] https://patchwork.freedesktop.org/patch/586968/?series=131998&rev=1
> > 
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_devcoredump.c  |  2 +-
> > drivers/gpu/drm/xe/xe_device.c       | 38 +++++++++++
> > drivers/gpu/drm/xe/xe_device.h       |  7 ++
> > drivers/gpu/drm/xe/xe_device_types.h |  3 +
> > drivers/gpu/drm/xe/xe_exec_queue.h   |  9 +++
> > drivers/gpu/drm/xe/xe_gt.c           |  5 +-
> > drivers/gpu/drm/xe/xe_guc.c          | 41 +++++-------
> > drivers/gpu/drm/xe/xe_guc_ads.c      |  9 ++-
> > drivers/gpu/drm/xe/xe_guc_ct.c       |  2 +-
> > drivers/gpu/drm/xe/xe_guc_pc.c       |  3 +
> > drivers/gpu/drm/xe/xe_guc_submit.c   | 99 ++++++++++++++++++----------
> > drivers/gpu/drm/xe/xe_guc_submit.h   |  4 +-
> > drivers/gpu/drm/xe/xe_module.c       |  5 ++
> > drivers/gpu/drm/xe/xe_module.h       |  1 +
> > 14 files changed, 164 insertions(+), 64 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > index a951043b2943..283ca7518aff 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > @@ -188,7 +188,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> > 		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
> > 
> > 	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
> > -	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(job);
> > +	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(q);
> > 	coredump->snapshot.job = xe_sched_job_snapshot_capture(job);
> > 	coredump->snapshot.vm = xe_vm_snapshot_capture(q->vm);
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 9083f5e02dd9..7928a5470cee 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -142,6 +142,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> > 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
> > 	long ret;
> > 
> > +	if (xe_device_wedged(xe))
> > +		return -ECANCELED;
> > +
> > 	ret = xe_pm_runtime_get_ioctl(xe);
> > 	if (ret >= 0)
> > 		ret = drm_ioctl(file, cmd, arg);
> > @@ -157,6 +160,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
> > 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
> > 	long ret;
> > 
> > +	if (xe_device_wedged(xe))
> > +		return -ECANCELED;
> > +
> > 	ret = xe_pm_runtime_get_ioctl(xe);
> > 	if (ret >= 0)
> > 		ret = drm_compat_ioctl(file, cmd, arg);
> > @@ -779,3 +785,35 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> > {
> > 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
> > }
> > +
> > +/**
> > + * xe_device_declare_wedged - Declare device wedged
> > + * @xe: xe device instance
> > + *
> > + * This is a final state that can only be cleared with a module
> > + * re-probe (unbind + bind).
> > + * In this state every IOCTL will be blocked so the GT cannot be used.
> > + * In general it will be called upon any critical error such as gt reset
> > + * failure or guc loading failure.
> > + * If xe.wedged module parameter is set to 2, this function will be called
> > + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> > + * snapshot capture. In this mode, GT reset won't be attempted so the state of
> > + * the issue is preserved for further debugging.
> > + */
> > +void xe_device_declare_wedged(struct xe_device *xe)
> > +{
> > +	if (xe_modparam.wedged_mode == 0)
> > +		return;
> > +
> > +	if (!atomic_xchg(&xe->wedged, 1)) {
> > +		xe->needs_flr_on_fini = true;
> > +		drm_err(&xe->drm,
> > +			"CRITICAL: Xe has declared device %s as wedged.\n"
> > +			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> > +			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
> > +			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"
> > +			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> > +			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> > +			dev_name(xe->drm.dev));
> > +	}
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index d413bc2c6be5..0fea5c18f76d 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -176,4 +176,11 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
> > u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
> > u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
> > 
> > +static inline bool xe_device_wedged(struct xe_device *xe)
> > +{
> > +	return atomic_read(&xe->wedged);
> > +}
> > +
> > +void xe_device_declare_wedged(struct xe_device *xe);
> > +
> > #endif
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index c710cec835a7..290fdebaffe1 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -458,6 +458,9 @@ struct xe_device {
> > 	/** @needs_flr_on_fini: requests function-reset on fini */
> > 	bool needs_flr_on_fini;
> > 
> > +	/** @wedged: Xe device faced a critical error and is now blocked. */
> > +	atomic_t wedged;
> > +
> > 	/* private: */
> > 
> > #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> > index 02ce8d204622..c6e7f0b9037b 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > @@ -28,6 +28,15 @@ void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
> > 
> > struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id);
> > 
> > +static inline struct xe_exec_queue *
> > +xe_exec_queue_get_unless_zero(struct xe_exec_queue *q)
> > +{
> > +	if (kref_get_unless_zero(&q->refcount))
> > +		return q;
> > +
> > +	return NULL;
> > +}
> > +
> > static inline struct xe_exec_queue *xe_exec_queue_get(struct xe_exec_queue *q)
> > {
> > 	kref_get(&q->refcount);
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index cfa5da900461..0844081b88ef 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
> > {
> > 	int err;
> > 
> > +	if (xe_device_wedged(gt_to_xe(gt)))
> > +		return -ECANCELED;
> > +
> > 	/* We only support GT resets with GuC submission */
> > 	if (!xe_device_uc_enabled(gt_to_xe(gt)))
> > 		return -ENODEV;
> > @@ -685,7 +688,7 @@ static int gt_reset(struct xe_gt *gt)
> > err_fail:
> > 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> > 
> > -	gt_to_xe(gt)->needs_flr_on_fini = true;
> > +	xe_device_declare_wedged(gt_to_xe(gt));
> > 
> > 	return err;
> > }
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 77be3bc2d7c0..a7cd65a9cf32 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -452,7 +452,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
> > 	return 0;
> > }
> > 
> > -static int guc_wait_ucode(struct xe_guc *guc)
> > +static void guc_wait_ucode(struct xe_guc *guc)
> > {
> > 	struct xe_device *xe = guc_to_xe(guc);
> > 	u32 status;
> > @@ -482,31 +482,28 @@ static int guc_wait_ucode(struct xe_guc *guc)
> > 	if (ret) {
> > 		struct drm_device *drm = &xe->drm;
> > 
> > -		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
> > -		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
> > -			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
> > -			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
> > -			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
> > -			 REG_FIELD_GET(GS_MIA_MASK, status),
> > -			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> > -
> > -		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
> > -			drm_info(drm, "GuC firmware signature verification failed\n");
> > -			ret = -ENOEXEC;
> > -		}
> > +		drm_err(drm, "GuC load failed: status = 0x%08X\n", status);
> > +		drm_err(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
> > +			REG_FIELD_GET(GS_MIA_IN_RESET, status),
> > +			REG_FIELD_GET(GS_BOOTROM_MASK, status),
> > +			REG_FIELD_GET(GS_UKERNEL_MASK, status),
> > +			REG_FIELD_GET(GS_MIA_MASK, status),
> > +			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> > +
> > +		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED)
> > +			drm_err(drm, "GuC firmware signature verification failed\n");
> > 
> > 		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
> > 		    XE_GUC_LOAD_STATUS_EXCEPTION) {
> > -			drm_info(drm, "GuC firmware exception. EIP: %#x\n",
> > -				 xe_mmio_read32(guc_to_gt(guc),
> > -						SOFT_SCRATCH(13)));
> > -			ret = -ENXIO;
> > +			drm_err(drm, "GuC firmware exception. EIP: %#x\n",
> > +				xe_mmio_read32(guc_to_gt(guc),
> > +					       SOFT_SCRATCH(13)));
> > 		}
> > +
> > +		xe_device_declare_wedged(xe);
> > 	} else {
> > 		drm_dbg(&xe->drm, "GuC successfully loaded");
> > 	}
> > -
> > -	return ret;
> > }
> > 
> > static int __xe_guc_upload(struct xe_guc *guc)
> > @@ -536,16 +533,14 @@ static int __xe_guc_upload(struct xe_guc *guc)
> > 		goto out;
> > 
> > 	/* Wait for authentication */
> > -	ret = guc_wait_ucode(guc);
> > -	if (ret)
> > -		goto out;
> > +	guc_wait_ucode(guc);
> > 
> > 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
> > 	return 0;
> > 
> > out:
> > 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
> > -	return 0	/* FIXME: ret, don't want to stop load currently */;
> > +	return ret;
> > }
> > 
> > /**
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index e025f3e10c9b..37f30c333c93 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -18,6 +18,7 @@
> > #include "xe_lrc.h"
> > #include "xe_map.h"
> > #include "xe_mmio.h"
> > +#include "xe_module.h"
> > #include "xe_platform_types.h"
> > 
> > /* Slack of a few additional entries per engine */
> > @@ -313,11 +314,17 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
> > 
> > static void guc_policies_init(struct xe_guc_ads *ads)
> > {
> > +	u32 global_flags = 0;
> > +
> > 	ads_blob_write(ads, policies.dpc_promote_time,
> > 		       GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US);
> > 	ads_blob_write(ads, policies.max_num_work_items,
> > 		       GLOBAL_POLICY_MAX_NUM_WI);
> > -	ads_blob_write(ads, policies.global_flags, 0);
> > +
> > +	if (xe_modparam.wedged_mode == 2)
> > +		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> > +
> > +	ads_blob_write(ads, policies.global_flags, global_flags);
> > 	ads_blob_write(ads, policies.is_valid, 1);
> > }
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 6c37f4f9bddd..0aa3abaca66d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -1403,7 +1403,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> > 		return NULL;
> > 	}
> > 
> > -	if (xe_guc_ct_enabled(ct)) {
> > +	if (xe_guc_ct_enabled(ct) || ct->state == XE_GUC_CT_STATE_STOPPED) {
> > 		snapshot->ct_enabled = true;
> > 		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
> > 		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index 521ae24f2314..f4663f1b0a80 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -902,6 +902,9 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
> > 		return;
> > 	}
> > 
> > +	if (xe_device_wedged(xe))
> > +		return;
> > +
> > 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
> > 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
> > 	XE_WARN_ON(xe_guc_pc_stop(pc));
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 9c30bd9ac8c0..0970e5674954 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -34,6 +34,7 @@
> > #include "xe_lrc.h"
> > #include "xe_macros.h"
> > #include "xe_map.h"
> > +#include "xe_module.h"
> > #include "xe_mocs.h"
> > #include "xe_ring_ops_types.h"
> > #include "xe_sched_job.h"
> > @@ -59,6 +60,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> > #define ENGINE_STATE_SUSPENDED		(1 << 5)
> > #define EXEC_QUEUE_STATE_RESET		(1 << 6)
> > #define ENGINE_STATE_KILLED		(1 << 7)
> > +#define EXEC_QUEUE_STATE_WEDGED		(1 << 8)
> > 
> > static bool exec_queue_registered(struct xe_exec_queue *q)
> > {
> > @@ -175,9 +177,20 @@ static void set_exec_queue_killed(struct xe_exec_queue *q)
> > 	atomic_or(ENGINE_STATE_KILLED, &q->guc->state);
> > }
> > 
> > -static bool exec_queue_killed_or_banned(struct xe_exec_queue *q)
> > +static bool exec_queue_wedged(struct xe_exec_queue *q)
> > {
> > -	return exec_queue_killed(q) || exec_queue_banned(q);
> > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_WEDGED;
> > +}
> > +
> > +static void set_exec_queue_wedged(struct xe_exec_queue *q)
> > +{
> > +	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
> > +}
> > +
> > +static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> > +{
> > +	return exec_queue_banned(q) || (atomic_read(&q->guc->state) &
> > +		(EXEC_QUEUE_STATE_WEDGED | ENGINE_STATE_KILLED));
> > }
> > 
> > #ifdef CONFIG_PROVE_LOCKING
> > @@ -235,6 +248,12 @@ static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
> > static void guc_submit_fini(struct drm_device *drm, void *arg)
> > {
> > 	struct xe_guc *guc = arg;
> > +	struct xe_exec_queue *q;
> > +	unsigned long index;
> > +
> > +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> > +		if (exec_queue_wedged(q))
> > +			xe_exec_queue_put(q);
> > 
> > 	xa_destroy(&guc->submission_state.exec_queue_lookup);
> > 	free_submit_wq(guc);
> > @@ -710,7 +729,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> > 
> > 	trace_xe_sched_job_run(job);
> > 
> > -	if (!exec_queue_killed_or_banned(q) && !xe_sched_job_is_error(job)) {
> > +	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
> > 		if (!exec_queue_registered(q))
> > 			register_engine(q);
> > 		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
> > @@ -846,6 +865,22 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> > 		xe_sched_tdr_queue_imm(&q->guc->sched);
> > }
> > 
> > +static void guc_submit_wedge(struct xe_guc *guc)
> > +{
> > +	struct xe_exec_queue *q;
> > +	unsigned long index;
> > +
> > +	xe_device_declare_wedged(guc_to_xe(guc));
> > +	xe_guc_submit_reset_prepare(guc);
> > +	xe_guc_ct_stop(&guc->ct);
> > +
> > +	mutex_lock(&guc->submission_state.lock);
> > +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> > +		if (xe_exec_queue_get_unless_zero(q))
> > +			set_exec_queue_wedged(q);
> > +	mutex_unlock(&guc->submission_state.lock);
> > +}
> > +
> > static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> > {
> > 	struct xe_guc_exec_queue *ge =
> > @@ -854,10 +889,16 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> > 	struct xe_guc *guc = exec_queue_to_guc(q);
> > 	struct xe_device *xe = guc_to_xe(guc);
> > 	struct xe_gpu_scheduler *sched = &ge->sched;
> > +	bool wedged = xe_device_wedged(xe);
> > 
> > 	xe_assert(xe, xe_exec_queue_is_lr(q));
> > 	trace_xe_exec_queue_lr_cleanup(q);
> > 
> > +	if (!wedged && xe_modparam.wedged_mode == 2) {
> > +		guc_submit_wedge(guc);
> > +		wedged = true;
> > +	}
> > +
> > 	/* Kill the run_job / process_msg entry points */
> > 	xe_sched_submission_stop(sched);
> > 
> > @@ -872,7 +913,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> > 	 * xe_guc_deregister_done_handler() which treats it as an unexpected
> > 	 * state.
> > 	 */
> > -	if (exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> > +	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> > 		struct xe_guc *guc = exec_queue_to_guc(q);
> > 		int ret;
> > 
> > @@ -907,6 +948,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
> > 	int err = -ETIME;
> > 	int i = 0;
> > +	bool wedged = xe_device_wedged(xe);
> > 
> > 	/*
> > 	 * TDR has fired before free job worker. Common if exec queue
> > @@ -930,6 +972,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 
> > 	trace_xe_sched_job_timedout(job);
> > 
> > +	if (!wedged && xe_modparam.wedged_mode == 2) {
> > +		guc_submit_wedge(exec_queue_to_guc(q));
> > +		wedged = true;
> > +	}
> > +
> > 	/* Kill the run_job entry point */
> > 	xe_sched_submission_stop(sched);
> > 
> > @@ -937,8 +984,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 	 * Kernel jobs should never fail, nor should VM jobs if they do
> > 	 * somethings has gone wrong and the GT needs a reset
> > 	 */
> > -	if (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > -	    (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q))) {
> > +	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > +	    (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > 		if (!xe_sched_invalidate_job(job, 2)) {
> > 			xe_sched_add_pending_job(sched, job);
> > 			xe_sched_submission_start(sched);
> > @@ -948,7 +995,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 	}
> > 
> > 	/* Engine state now stable, disable scheduling if needed */
> > -	if (exec_queue_registered(q)) {
> > +	if (!wedged && exec_queue_registered(q)) {
> > 		struct xe_guc *guc = exec_queue_to_guc(q);
> > 		int ret;
> > 
> > @@ -1065,7 +1112,7 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
> > 
> > static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
> > {
> > -	return !exec_queue_killed_or_banned(q) && exec_queue_registered(q);
> > +	return !exec_queue_killed_or_banned_or_wedged(q) && exec_queue_registered(q);
> > }
> > 
> > static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *msg)
> > @@ -1276,7 +1323,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
> > {
> > 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
> > 
> > -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT))
> > +	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
> > 		guc_exec_queue_add_msg(q, msg, CLEANUP);
> > 	else
> > 		__guc_exec_queue_fini(exec_queue_to_guc(q), q);
> > @@ -1287,7 +1334,8 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
> > {
> > 	struct xe_sched_msg *msg;
> > 
> > -	if (q->sched_props.priority == priority || exec_queue_killed_or_banned(q))
> > +	if (q->sched_props.priority == priority ||
> > +	    exec_queue_killed_or_banned_or_wedged(q))
> > 		return 0;
> > 
> > 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> > @@ -1305,7 +1353,7 @@ static int guc_exec_queue_set_timeslice(struct xe_exec_queue *q, u32 timeslice_u
> > 	struct xe_sched_msg *msg;
> > 
> > 	if (q->sched_props.timeslice_us == timeslice_us ||
> > -	    exec_queue_killed_or_banned(q))
> > +	    exec_queue_killed_or_banned_or_wedged(q))
> > 		return 0;
> > 
> > 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> > @@ -1324,7 +1372,7 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
> > 	struct xe_sched_msg *msg;
> > 
> > 	if (q->sched_props.preempt_timeout_us == preempt_timeout_us ||
> > -	    exec_queue_killed_or_banned(q))
> > +	    exec_queue_killed_or_banned_or_wedged(q))
> > 		return 0;
> > 
> > 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> > @@ -1341,7 +1389,7 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> > {
> > 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
> > 
> > -	if (exec_queue_killed_or_banned(q) || q->guc->suspend_pending)
> > +	if (exec_queue_killed_or_banned_or_wedged(q) || q->guc->suspend_pending)
> > 		return -EINVAL;
> > 
> > 	q->guc->suspend_pending = true;
> > @@ -1487,7 +1535,7 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
> > {
> > 	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > 
> > -	if (!exec_queue_killed_or_banned(q)) {
> > +	if (!exec_queue_killed_or_banned_or_wedged(q)) {
> > 		int i;
> > 
> > 		trace_xe_exec_queue_resubmit(q);
> > @@ -1786,9 +1834,8 @@ guc_exec_queue_wq_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
> >  * caller, using `xe_guc_exec_queue_snapshot_free`.
> >  */
> > struct xe_guc_submit_exec_queue_snapshot *
> > -xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job)
> > +xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
> > {
> > -	struct xe_exec_queue *q = job->q;
> > 	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > 	struct xe_guc_submit_exec_queue_snapshot *snapshot;
> > 	int i;
> > @@ -1944,28 +1991,10 @@ void xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *s
> > static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p)
> > {
> > 	struct xe_guc_submit_exec_queue_snapshot *snapshot;
> > -	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > -	struct xe_sched_job *job;
> > -	bool found = false;
> > 
> > -	spin_lock(&sched->base.job_list_lock);
> > -	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
> > -		if (job->q == q) {
> > -			xe_sched_job_get(job);
> > -			found = true;
> > -			break;
> > -		}
> > -	}
> > -	spin_unlock(&sched->base.job_list_lock);
> > -
> > -	if (!found)
> > -		return;
> > -
> > -	snapshot = xe_guc_exec_queue_snapshot_capture(job);
> > +	snapshot = xe_guc_exec_queue_snapshot_capture(q);
> > 	xe_guc_exec_queue_snapshot_print(snapshot, p);
> > 	xe_guc_exec_queue_snapshot_free(snapshot);
> > -
> > -	xe_sched_job_put(job);
> > }
> > 
> > /**
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> > index 2f14dfd04722..fad0421ead36 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> > @@ -9,8 +9,8 @@
> > #include <linux/types.h>
> > 
> > struct drm_printer;
> > +struct xe_exec_queue;
> > struct xe_guc;
> > -struct xe_sched_job;
> > 
> > int xe_guc_submit_init(struct xe_guc *guc);
> > 
> > @@ -27,7 +27,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> > int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > 
> > struct xe_guc_submit_exec_queue_snapshot *
> > -xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job);
> > +xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
> > void
> > xe_guc_exec_queue_snapshot_capture_delayed(struct xe_guc_submit_exec_queue_snapshot *snapshot);
> > void
> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > index 110b69864656..5e023df0bea9 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
> > 	.enable_display = true,
> > 	.guc_log_level = 5,
> > 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
> > +	.wedged_mode = 1,
> > 	/* the rest are 0 by default */
> > };
> > 
> > @@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> > MODULE_PARM_DESC(force_probe,
> > 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
> > 
> > +module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
> > +MODULE_PARM_DESC(wedged_mode,
> > +		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
> > +
> > struct init_funcs {
> > 	int (*init)(void);
> > 	void (*exit)(void);
> > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > index 88ef0e8b2bfd..bc6f370c9a8e 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -18,6 +18,7 @@ struct xe_modparam {
> > 	char *huc_firmware_path;
> > 	char *gsc_firmware_path;
> > 	char *force_probe;
> > +	int wedged_mode;
> > };
> > 
> > extern struct xe_modparam xe_modparam;
> > -- 
> > 2.34.1
> > 
