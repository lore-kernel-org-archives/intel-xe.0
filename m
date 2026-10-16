Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E2DCCF2C3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 18:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA89810E06C;
	Fri, 16 Oct 2026 18:56:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD8E10E06C
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 18:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792177002; x=1823713002;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DI8NcmjkZcmmBwHoQnuXw/jMIrwES7U6kuFfmyXlzPE=;
 b=SP/AnLsWjjzU+uej2bTZpfisU5QHcFe1t1huM9AmBRDZUTD2hKfyy3xR
 9Gl8TDBd8IgkTq7ZW69sEPEgnfbmKZGbLNU0h1zWIlmH1tm4rir2LbStq
 N+DH0v6yHp45DDw7OB0WzYB4O3HuGcT0Aa/kMwXROeq65G+CC7q1VeEsF
 nhs7YhfI7nPC0UIj2+SAnJR3s5lSF6FnGzoRexknm4zCBVGwso7I4QCSC
 TMxy9Nl4uQqMH6+NaMlHld+J56f/CbEtppvwPkHpvptMEZ6Ad8kfBG4PF
 oW+OIm/s65XhisqvDZUhVNXU97QNylGiuHaX0iphDinQFjfwyGOOCLzGZ w==;
X-CSE-ConnectionGUID: 4gXJP+jNRNKC6mDZH9ikcA==
X-CSE-MsgGUID: VFK6AdeqTDOYzS+IEXwLkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="870151"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="870151"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:56:42 -0700
X-CSE-ConnectionGUID: St9GztioQlqKmtUnyywXVA==
X-CSE-MsgGUID: oH8DR4WfRFyYe9bDj2/gXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="1994557"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:56:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:56:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 11:56:41 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:56:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yu67RWg2ihTMl65qXr7VIXrUanVLPiErcNWa/6IVH9bcV4RvrontOhcII/e+88pe6h5S7zcxGbfDDbKtd9iaStIFChLCh8H9xf/YIEf9AHbRplMyWyT3AyPgUWJBAuzcdmJoMtXdDi063N4n65kIrDt0D2kZ4Ffpu4FyIo6lDU/9CPKpo5V8C1rVh1WYET5/JClDjnqAnOvnelDS5+II+tt6SpYcraupy14SYwUMn2h85XPvjrO+UZI8CahLk5tejJ7lM0P5kj7vylLkMRAaiK4QpqW5cPOWEivYAdpN25nnwhp4dqcwShkDoB8KtyeSpMYAAZHqKYk/F4DIJNXk7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ahNAavU3tVwZfTRkaXK2mQbeQpkUDMoMdCYHOwlDEc=;
 b=OCETD2wLiGHsnluXp+DAiVC5YWtX4QjMRXtKXkia+HvgMg/HjOqpuw+g74WuUFSHfll7OGa2WsLU4A90UBndF9JjzDUNd1SA/tQdG1BXnUpbTt1xQvqw9Fgf6l7dMeFdA1eiwlWQ01ldMfcibHaAwu2/4Ud+8crLVMfO7XAeAcSZwAPkxZ+Fhlx3hrkwfj21LZT0XcixWLQ1+dSXcFZpgH+JgmUL449ldje4g9umNdOxgJi3Un4YDAbalacS+Cb6lFi91KTYHWFqn/s6NkkbCHrYAyozeXm7/xdWKjb2YHYmMeuvW5WqjmivyjcO4xj7N7FvgcgXArmBQpjneAVXHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SJ0PR11MB5120.namprd11.prod.outlook.com (2603:10b6:a03:2d1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Fri, 16 Oct
 2026 18:56:36 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 18:56:36 +0000
Date: Fri, 16 Oct 2026 11:56:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Memset g2g buffer on resume
Message-ID: <atJzYVAGiy6sYsJq@gsse-cloud1.jf.intel.com>
References: <20261015165451.154495-5-vinay.belgaumkar@intel.com>
 <20261015165451.154495-8-vinay.belgaumkar@intel.com>
 <atJxs5BOjChYDEaX@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <atJxs5BOjChYDEaX@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: MW4PR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:303:16d::26) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SJ0PR11MB5120:EE_
X-MS-Office365-Filtering-Correlation-Id: 5595f02c-bd94-47bc-58fa-08df2bb73413
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|261009223027099003|11063799006|56012099006|4143699003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: GICyGIk2ckD2H5wcHPjxgbTKQLmIl6bof9+zou8GAJ+RPJ6DuqB1O8qYnni9CzpTDo47fO6fDQOPcW24BPwrCv5LQJMLmnkJgloAV6nmWSWy9PQCIk/pyT5qFOH9pwPwSrTsNbQCeMWO1JgJsk3bAbavGDz7Tn/0dXc5VSh/k1SkM2L7PMgzVm8mnWox/y7COqFMWW8+huxRZ7cU6Og4mc8B3o9WMySNgIBilYbYW+P4rHx09ThYxi/WiLMJq8i+aleKy2DV1EqldCaJi/gi0jSXmyhOeyAQl0TmdEL97wEd+Bjs9thFq0mDcHH4YmOT+z0nsERpbTy0XRfCHmtg0snbbZNSqCMx4KEqAQ2il14rlYxjJMpdIZqfYRNSyIa1Dk7njzvejU/gUXEkCSl0WaEpR+KFiq4oYY4/KyWqMJGJc1W16rybiHZwhg6BMCx6JAIzwXqwExIP/Is8eFva7tdEXnRPTIO8G0VeROFvinJRUa7+Lai/ZPKEz7Xr/l3lHTq3LYdii2ygNx2ys0A+fnHI6woU7OoE57dulvd8O68tI2eP/evpH2S8RD+w+8IL9sXM+qr5tb+H2PDDdbmVdvuwDp0bA9Lcq7wL/tXE3AsiBJ13Gof+AmSJO1BZCGYZ+0ZjFC0FhB7VeHd3rcAjYyrNVHiYcUh0FiuoWsu1gmQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261009223027099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MtrxUw2N0fRdnInr3mNEVuPpBwSzyNWrwoyHTsXTJuOnrWOxN87TgnxWiRLl?=
 =?us-ascii?Q?ndioiRE6o/TZmDuOMJwsCuI9uaBsRWcTR0I+jPZ52YpMR/3k8Q9uBgW03ZT0?=
 =?us-ascii?Q?C6YwxzRibUs4VS0C0BYUlfybL15pu7/AZxne8sPugpOBDlVVZtl6SOpOKpaL?=
 =?us-ascii?Q?hKbixWjBWoPkIqnvpGCeMc6Tyo1sSATnIb4h+CzgnL7kVW5TIrNZ6Qg8c7YN?=
 =?us-ascii?Q?0fZ6KE5ymjwoyBuIq/QDJqjODNMBnqyLwhnPqIMSyAz4V+LsHCfeXDzffTVj?=
 =?us-ascii?Q?445fXi4pgHeUeDZwjDU8j1PPK2WBUN7E30tyASYLVIbt2hlCGzx7r4n0AfgQ?=
 =?us-ascii?Q?uWCue+tkzoVTG6f6GTjpe8QFbaJDVtF5MH3edJLs/UmpeEhg9Rzx57TGYiuN?=
 =?us-ascii?Q?w/x2ITXi1Y+ZLdAcGqVTFV37cnuFUw4gAR7YUHaM0BOWaQVshBZIfAul35zj?=
 =?us-ascii?Q?+7Z0YCwpfXzQvzOjuoFojtNif4N2wshlvtQ2t22p+0lh/aePvyL3Lt4yooen?=
 =?us-ascii?Q?kK/nS0Omp1Scuui9z9g4gGyR1kPRn1TYFO7jaMTTE4GUB3fqfL0bTuYl9kSQ?=
 =?us-ascii?Q?DOtZz7LZrniy2jAjY0lCJo9F44Nd3wk5s9AhGR5s0gk5ix97l5TIGj+LkmBB?=
 =?us-ascii?Q?8tFjJd91V7rfk7ymkNrNy3HQLiZO4nKu+pGmG4W2jvdqGllfL/emzuQa3r/K?=
 =?us-ascii?Q?hLfxeNJ+MO/ky4zanNn9hV02TREiQPjU6np29NeHy2n8B7NxPNA4GgcAhL5y?=
 =?us-ascii?Q?Lrd2Ho1wTOp1KV0aMFRND2dgg7RxCKBJcQbnabsAH3X4hqzI/+ZiChPVA8ou?=
 =?us-ascii?Q?7KLjohFFtRhCaw3Ps6sNCAGUDVpM4VXQYAnwVtApzm/FX+scxaURDFMQJaT/?=
 =?us-ascii?Q?Lg/g3URS0bbzbcoOshomtXqGuu16xa5azdbZPuzzSSWa3OcUiv/oCWKv8pEF?=
 =?us-ascii?Q?NyuCWIaQmfW/u8DGn52UZlo4z0y4Hm6uJIFV4m3LT6pSO3bsKrWgLeZ3fjKI?=
 =?us-ascii?Q?5DskR1rOmdfoL+VwfLNQnKf9w0gknb2ixP+ykEANq5ccdhs2ZWRfv8oWo/BB?=
 =?us-ascii?Q?T+615wC09x52TRrlg9zS/6aSSguK4ZFbztRWGIY0IpvSYFrbic44/bOm+zkQ?=
 =?us-ascii?Q?ECLkZStWQ0yUhMKmtfRHK+8DGwG1siy/Pyc5galRYFF6RTNUCtEsBwHRqS6T?=
 =?us-ascii?Q?7+FxXovjVovVIReqbsECXuli+TLS6A9CG04CtTudH0TTNyWCTBmPoPa4/Pgo?=
 =?us-ascii?Q?EOUzFiqODLGnl41ogy8WI4vs0jI0x1YuJC6oohu556xIb9PQ74I4n/WfcJ0a?=
 =?us-ascii?Q?NrJYBvMUiH7PNphszgaNdm/PpSr9jpfyYuIpE7pDkvgh9HfoMhJjM3vElmRv?=
 =?us-ascii?Q?Vgfg5frKtq5Qcr0pq5pCD3IGUrCexiQnMuj1a4uQTNDVq1Im3n+JtvGIyCoe?=
 =?us-ascii?Q?ETpNWhAh2sLUdJp9qB7vFphzn4tHjHh/jTAJOASG4YXNDHn47Hy0fp1tZxpi?=
 =?us-ascii?Q?iHJgUasNptEX5nZVH0RRIpRaOQSOI+Z8AkgE4FBIP3JVKpIEpnBfmp7FaShb?=
 =?us-ascii?Q?CbVm5+QN0mBCNTsTQGNOc1PydY/WulytNqXSkwChbnWcMWouOuhojksr0NkP?=
 =?us-ascii?Q?rAq7sgEwt/ov7ZutQuv1ei+C3XwgNFRC2ZVJNUT/Xjr4WlDOH+2CYUQd23h0?=
 =?us-ascii?Q?BWk2JdN4FzV6HCkdNk5PCCIUNvIPlTWFRfaLEmmbxtkshSRlHazWMkqhsmYM?=
 =?us-ascii?Q?dfS41DYW0iFj9uoyuumnp9cGYIpnegk=3D?=
X-Exchange-RoutingPolicyChecked: K6BWzYeFyLaF+lvvi9A87jJCkmIVdjZXp19FqHvbWfKo30fP0U1IMaJcWWblEO52BdDSPbvpiy8pSwyRm4XyZyZenCRPGaMs4wQzvx2Ff4eQrWvz9bdeRiPmCKRIxHJKVdVWjzIDTUYah6A0kPQ/MDD9YX3GmFatdai+EKnZ3yYEBf5gNppXhFW8xt5rsD1OK7XAVo7jdArAPYs4iNO2CQ0nBceUmE651oBadrJmEM6Ix4mrlphsKn+X04LDoLq7OVhdD1cCaQCMk58QtCJ9mmn7rxWcYiQdvlkIyd3HcYs+BubhaGSvObNvFgGvXl09hC+Wbv2PSqeQrypyXHKKOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5595f02c-bd94-47bc-58fa-08df2bb73413
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 18:56:36.4241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jSelxOhojI2iWyZMLdzwdND4dVfjiMGImNFj2m4DgVIozeKGjadhbT54ovtDM1Wl/ZzyzdFy8JRAG9ZzwGVU7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5120
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

On Fri, Oct 16, 2026 at 11:49:23AM -0700, Matthew Brost wrote:
> On Thu, Oct 15, 2026 at 09:54:55AM -0700, Vinay Belgaumkar wrote:
> > KMD creates this buffer for use by GuC, it is also responsible for zeroing
> > it during resume. The buffer is marked as XE_BO_FLAG_PINNED_NORESTORE,
> > so we cannot trust its contents after a suspend cycle. This commit adds
> > xe_gt_resume_early() function for handling this and the C6 disable
> > during resume.
> > 
> 
> Fixes?
> 
> Also I have question here: Does this mean after d3cold memory does not
> init to zero? This was an open question I had which merging
> clear-of-free as I didn't know upon d3cold exit if buddy blocks in
> cleared list would still be cleared? Any insight here would be helpful
> as I think Tejas is picking up the clear-on-free work and this would be
> good input to give him.
> 
> Matt 
> 
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c | 18 ++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt.h |  1 +
> >  drivers/gpu/drm/xe/xe_pm.c |  4 ++--
> >  3 files changed, 21 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 775c826b68b4..02f5d48b1a65 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -1069,6 +1069,24 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
> >  	return ret;
> >  }
> >  
> > +/**
> > + * xe_gt_resume_early() - Early init for GT resume
> > + * @gt: the GT object
> > + *
> > + * Handles GT related init before GT restart after a suspend cycle.
> > + */
> > +void xe_gt_resume_early(struct xe_gt *gt)
> > +{
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	struct xe_guc *guc = &gt->uc.guc;
> > +
> > +	xe_gt_idle_disable_c6(gt);
> > +
> > +	/* clear the g2g buffer which is marked as NORESTORE during alloc */
> > +	if (guc->g2g.bo && guc->g2g.owned)
> > +		xe_map_memset(xe, &guc->g2g.bo->vmap, 0, 0, xe_bo_size(guc->g2g.bo));
> > +}

Also this is layered wrong.

This should be xe_uc_resume_early -> xe_guc_ct_resume_early -> xe_map_memset.

Matt

> > +
> >  int xe_gt_resume(struct xe_gt *gt)
> >  {
> >  	int err;
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index 92d934d50244..9b69f36ebc7a 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -58,6 +58,7 @@ void xe_gt_record_user_engines(struct xe_gt *gt);
> >  void xe_gt_suspend_prepare(struct xe_gt *gt);
> >  int xe_gt_suspend(struct xe_gt *gt);
> >  void xe_gt_shutdown(struct xe_gt *gt);
> > +void xe_gt_resume_early(struct xe_gt *gt);
> >  int xe_gt_resume(struct xe_gt *gt);
> >  void xe_gt_reset_async(struct xe_gt *gt);
> >  int xe_gt_runtime_resume(struct xe_gt *gt);
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 1f5097875bcd..89d64aa6577d 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -249,7 +249,7 @@ int xe_pm_resume(struct xe_device *xe)
> >  		return err;
> >  
> >  	for_each_gt(gt, xe, id)
> > -		xe_gt_idle_disable_c6(gt);
> > +		xe_gt_resume_early(gt);
> >  
> >  	xe_display_pm_resume_early(xe);
> >  
> > @@ -703,7 +703,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >  			goto out;
> >  
> >  		for_each_gt(gt, xe, id)
> > -			xe_gt_idle_disable_c6(gt);
> > +			xe_gt_resume_early(gt);
> >  
> >  		xe_display_pm_resume_early(xe);
> >  
> > -- 
> > 2.53.0
> > 
