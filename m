Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83051C43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 18:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2128410E210;
	Fri, 10 Jul 2026 18:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ff/7nnMS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E326710E210
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 18:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783707720; x=1815243720;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/Bb5B0xKLGSmWspzXmtIxPkUOijziiiBk87WwXe/QiU=;
 b=Ff/7nnMSnSH6tuxzOFLe7TGabb7Xam4/ziX1QB8CkNWEi2/wdS5gNz8Y
 W2Wvlq35sNdELtyXxYec0T2xOpk4QeeMhAsC11zwctMJDozsqAwAPYE0K
 XdqIQCBwJPPYMfvLrngA/I/Dk3DZw/rRcUpCn9pII9kJEiAeBZbQXSVBY
 x+8RtBwZXI20kUYCT1V+PAVQ8YOA7ssfRCYrXuOCxyW+AC/pTh+/4oAhV
 J7YaoaKTpQ+vsPXuE9E0eGyN/Xx//mKyfJDAUTEZOVtBnQsTjC3GnOo3F
 WczL1jdNn4vx/dBHd0EjWKiOsdyP4i9U/vAN96Y4/nZcPt583zxBYgTCm g==;
X-CSE-ConnectionGUID: n/RJ869+TGOsMocWbQ/8SQ==
X-CSE-MsgGUID: 1Sp0PAjSQT+6OjkJwJZBcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95925043"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="95925043"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 11:21:59 -0700
X-CSE-ConnectionGUID: kI6SaQZeSL+V5wJ03Y5E/g==
X-CSE-MsgGUID: WyJ0BYweSsKIqEhvBeIf4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="258545270"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 11:22:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 11:21:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 10 Jul 2026 11:21:59 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 11:21:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xyR3Ni3SCy9yDDFh9gyFeB7cgWUcml1h+lqX7zh7mZ2nNUrzl4tqI+MiGpl3/8ptvmY/qlzCThEcuQuBLHw8mUfZZD+kyQVEnXAEkL2xCYrzGUyByvz8trlowvIEoeKuLncp+rnuHHsXnwPFjgmoqLPQvr+vIRI3UQbBL1ZrnqsqSyZ6ETYIvi93v1LIpMGA5FuQB7RZREXqjOe7D6rUePsmcv31ZDsHfJhqdpHdW4VFgUnbG/D24+ATponzHDGG6ibluL31xPvguE0ZSVP3V/MskHCvGljTSPNnyxtw2L9qYEBLPRjaWtxjPPq16om7N7UzRCLPV2YxzIUnE8SRVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40aQr5UeVBlWYPjNinwrKm/HRXN7/S3+x5jtOKQL2NM=;
 b=KCVXkmooDIxZYJV/Fdp0RPCSANFQpkP1xK2ZP8BhwaDRPT9pIssT3tpVJTOqizsoRBIR8DEWr7n3trfuJB7NfDcwF49Yh9PjaopO6QwHQrLu09kcFLm9hyITUFGGUZlHzDCD92VUGTf0V475EIKN30BhKyXmg3MI0N57tVGjUayNgRI5Ya7EA+rAkvYIw4nH5IU8wUkmDkn11fQqAyEPMDge7Z0WrQ2rjR0ZGvYULTp3J5wTsoDd1SGSA/ARE3aQc7U+3JGK6hNcl+AhNWimiYtvDQzH4/5XvrWVODuf8nqwbv8XDobNrKbq5WCOVK7eyVDeH/0LjIMmqPJM/lIVzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7655.namprd11.prod.outlook.com (2603:10b6:806:307::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 18:21:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 18:21:50 +0000
Date: Fri, 10 Jul 2026 11:21:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Martin Hodo <martin.hodo@intel.com>
Subject: Re: [PATCH v2] drm/xe/vm: Fix BO prefetch with
 CONSULT_MEM_ADVISE_PREF_LOC
Message-ID: <alE4PC3kEGEZBaX0@gsse-cloud1.jf.intel.com>
References: <20260624174943.2808767-2-himal.prasad.ghimiray@intel.com>
 <ajxHAYwu866e2i6m@gsse-cloud1.jf.intel.com>
 <ajxHTHe1UsIQYDUo@gsse-cloud1.jf.intel.com>
 <159443cc-5c59-4a2e-a8c6-fdf2c53b12a9@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <159443cc-5c59-4a2e-a8c6-fdf2c53b12a9@intel.com>
X-ClientProxiedBy: MW4P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f2a9741-fb72-405f-99aa-08dedeb01c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: iN+TnEhSXDjut6UDDelNj5AXZOn+xgGTw6NnZKLwJXYeWS8JDcl7cJuvmHoZ9W6Pu5aTL1Ty+rM3WwJj8WmuSzvKepVOtje8mWOw6Q34t80L72yfmy1WytoXHhpWU8/QufxDPeY73mjJkR1/fKC3huGHwCaMFzYh2Ws6v3fQy4oHsTZeND573uCYSBxzE4xSGPBCpBuqdjYmYlaTQBELmP7pMxUVN30Yy4yMbJu8P72zVEc7th1b7OVSPaUXoRZ9Ij4rxp4bnm+hIDmdvp0saPGIUuYhL46gl9JymWQZ1qjCYxlJDUiiDo55FGublsYunUK2y964MTO8sXjqPQwQ6dciJkJ2h2szGOn/46/kzp1I9PRomN6sQ03eC+094Klf5POmABF7SvW86hIYZhMOZdQPi1qVzqo2sPhmUhimb4I766CBT5WwdtxEyPOVvwU2MhfKOFOkKhFOKMOSu6dcIEu4PL7r0gELmQzpQJio8rdIa8MCBqZI2iuhHjzDlSrxr41eT2e5ETm7uGPLdLvpidUWtf6vs2sFLlULA6lmw+aDG7ne0BdGManvihJfmCxTSdYWlVgpkJJZarGXK9RcDg7eHPRgsxyJ+6fHxwuubweGPsxQPlXeeqPuTJpSQgJ5c08uS+dvXeP91d6CD3P9yXYfASBzlNaBesxKVmIylQs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rdm5TMfJ7tl3VS8HrlZ1QsSMGlV6udIkmcfYE7wEXk6OPL8oTuz1uQiFYuo0?=
 =?us-ascii?Q?T+jx8/7Ncmoslss4UYQsOeob/NY2Q7OnKVW/u3nvvauGCbTSxiVSajlcyZrF?=
 =?us-ascii?Q?5Fudjo5hg59YYGCToplp6YAmLgNbASlYnFP7m/2f7tOuXhg1aKjWUK2/SD1f?=
 =?us-ascii?Q?ZFJlsfhH08s3qvHudMkbPAOLwzjxAetxkF6xGMZ6mabHKNW2Qu+Fc6UPE1NP?=
 =?us-ascii?Q?0h0w9o63Zs+yIW4nNxkD3IpNXL8xe+qKSMP3n0gf5RkOoazVeW9P7SPOlXOl?=
 =?us-ascii?Q?KobXbXwMGqcsgQHIYu/3ph+/WvmQ+smEXi+q4svzgJl7cunNOQdrOQPLFOCY?=
 =?us-ascii?Q?ySpcLXT3ChKlh+cde6ShyLZMHNPSQLszR1I2X7VR2y/tOS4jUu7MIDy2a9qs?=
 =?us-ascii?Q?Yjc6/gVwxnIUOY4PAGWIImTFGTbWdTSlkch6i7g5J4//r3gmsbxzWqs57Y/t?=
 =?us-ascii?Q?ykIpkL944oziZiCKt/RJUNsw+rFkWnGr3IJbdtv5Kn04N9yuEPlXSPa9xVVM?=
 =?us-ascii?Q?pvs2v9MVu7zzllBLZdMiedkE8Vemj4LDLKntmzYnBsNsZ6qbD3QjvBF7Y6XU?=
 =?us-ascii?Q?9ZCvA0uwEbQIi9oGA0lhO9E1j9RSHW6Xu9AP9ZmRBzcbwNOltyWKOPcMw/Fy?=
 =?us-ascii?Q?HQQ8OTP+CUDM7HurxS0G4O7PKzW8SvJHtrZQLh+mxGndv8/dKEP37LZvksgk?=
 =?us-ascii?Q?D7UhIOQef0rqeU83EDYIAbpxir8a6ovFaBs+5rU0s5z+mgd76QwIymg318hf?=
 =?us-ascii?Q?Kob7go265dGBNoPaRAy3EMVy/iD1VdJKGxYdERPSsRkz8ZwKuUL1zI9gbst9?=
 =?us-ascii?Q?TS/3YqGzXNgSghy/tyJfgY93JG3HsjNVM+qqIIHbSwTeaSu5TNyJspaaHa5D?=
 =?us-ascii?Q?OrtxNwp3BdoD/ioz2XOAiKUiL4PeotS757d5NSIF6YwPzXP7jzkplPEvpPpI?=
 =?us-ascii?Q?k2ET63MYv8+gyZVjWA1mpM9MvIIDmLsPvivS280VnQJiJttGeFb2HviDtfxs?=
 =?us-ascii?Q?3nCi3qGcicvfM6aWbjzD7YxdGdcYiu4yJ8TjAYoLP4UkXeu5V+vdNmUfPZms?=
 =?us-ascii?Q?hVe/iGHgS8/IKcdLg+FRgtXSKPFcmyziU2mVxzNn0T98n6RMm7XtTxrkRhc+?=
 =?us-ascii?Q?wXJ9B6wA5Q95GmK7YXc4/vP/q/bNWGZ+ctjngQfUTXMkn6ypmgIjpyyJTplP?=
 =?us-ascii?Q?WroANgIXAC4eL9mdJOIeeVpVWx1mAp2U82qHqvOXMUfHezaJOVDffIF351rd?=
 =?us-ascii?Q?gt4juv2TE93T+pzVPjdb5RQcl0a9AX0p/BKwEEtd+Zn5aHgAQMvavwA0gaHW?=
 =?us-ascii?Q?OUk5H1eRXvFkAAhoZr+XDxN4SlIlJeluKBxtxpmj7VhHLKw+3FAMaNqtI80q?=
 =?us-ascii?Q?awDog9+BWfvSLo53BCG1MssGB0l5pkajGm1ALCM0dHbnJC5f7qewpSSQl0/m?=
 =?us-ascii?Q?hXfXJrd9V4kVbn94z7bdWrpk3aDsnEUXbMiSHLnAHxIArRXSssrvrC9yfTFE?=
 =?us-ascii?Q?ACUeBcrYKV89UlSO5VOiN25WnsmpF1EcgungdSf3GJU8b/Q6y7nZhzQVzTaN?=
 =?us-ascii?Q?XFd6pEFCPzqI+xIHIj1DkOvEwm1b4QzMNJVgCrdYiH4dXe7ywXlXTo87i4yX?=
 =?us-ascii?Q?L1wmGVDyICMHCHBTEHkinxYGQJLNolnDR8RQKIxBPexkM1sRByBjRzEvhrPD?=
 =?us-ascii?Q?J9JwZxZhsULF6X/5Nqk8fvPcFmXyMgyn6jTRjTHmlt13zqJZqe9O3+G5yVRe?=
 =?us-ascii?Q?11tWw5XXdQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: nSRGrFVbjnaaVFEispNxvtfR7aI/LPB75h/XwXo+/R5bH50fDvA5owlDlq63tvLZHBwTmZoRIdYeArOv8tTaNOxQ/N+Z4qXOIioBtBbfNXANksvGLaYT4+p2p1GIzPTZG0TpiOW9QQf01T9FANbhV6ZsvQEMzWayS/bY0ijCRjZ8JQ6GMQWBhm9sdhnPgt1YeWKGqWq8eEUe8S6dIY/2DWcsd0ztgf16S2ocA85Fs/3Uh7+XikwwXuNR0Q/at1js8ZUBldWWic1V2ZIU0hSndfoimUzxF/L9pTUx0SHlJsU1o8QD8nwTadXI3rN4ucK6mhLFH1M+VU5U0HXMYLqo7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2a9741-fb72-405f-99aa-08dedeb01c61
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 18:21:50.7091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ghEOt+nkttY8VJHx8WysrjukpsPXdF3NqKYcXHcwIS0OO4V+573HVCr710Nh5ULWjJqJFHVOH0dr1EkRMB9AeA==
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

On Wed, Jul 01, 2026 at 02:51:39PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 25-06-2026 02:38, Matthew Brost wrote:
> > On Wed, Jun 24, 2026 at 02:07:13PM -0700, Matthew Brost wrote:
> > > On Wed, Jun 24, 2026 at 11:19:44PM +0530, Himal Prasad Ghimiray wrote:
> > > > When prefetch region is DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC for a BO VMA,
> > > > the code used it as an index into region_to_mem_type[], causing an
> > > > out-of-bounds access since the value is -1.
> > > > 
> > > > Resolve the preferred location for BO VMAs directly: local VRAM on dGFX
> > > > (using the BO's tile placement) or system memory on iGPU.
> > > > 
> > > > Discovered using AI-assisted static analysis confirmed by Intel Product
> > > > Security.
> > > > 
> > > > v2:
> > > > -Fix null dereference
> > > > 
> > > > Reported-by: Martin Hodo <martin.hodo@intel.com>
> > > > Fixes: c1bb69a2e8e2 ("drm/xe/svm: Consult madvise preferred location in prefetch")
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_vm.c | 25 ++++++++++++++++++++-----
> > > >   1 file changed, 20 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 080c2fff0e95..32ded13491ca 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -3255,11 +3255,26 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> > > >   						    .request_decompress = false,
> > > >   						    .check_purged = true,
> > > >   					    });
> > > > -		if (!err && !xe_vma_has_no_bo(vma))
> > > > -			err = xe_bo_migrate(xe_vma_bo(vma),
> > > > -					    region_to_mem_type[region],
> > > > -					    NULL,
> > > > -					    exec);
> > > > +		if (!err && !xe_vma_has_no_bo(vma)) {
> > > > +			struct xe_bo *bo = xe_vma_bo(vma);
> > > > +			u32 mem_type;
> > > > +
> > > > +			if (region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
> > > 
> > > Shouldn't logic more or less look like xe_vma_resolve_pagemap which
> > > picks the region based on vma->attr.preferred_loc.devmem_fd?
> > > 
> > > So roughly:
> > > 
> > > mem_type = mem_type = bo->placements[i].mem_type;
> > > 
> > 
> > typo: s/bo->placements[i].mem_type/bo->placements[0].mem_type/;
> 
> 
> Thanks, Matt for the review. For a BO VMA the preferred location always
> stays DEFAULT_DEVICE (madvise skips BO VMAs), so devmem_fd is never
> DEFAULT_SYSTEM and both approaches pick the same
> placement. Extending madvise to BO VMAs would also need a design call
> first, since preferred_loc is per-VMA  and a BO can be mapped by multiple
> VMAs, so preferences could conflict. I'd
> prefer to keep this patch minimal, but happy to switch if you feel strongly.
> 

Ah, yes - I forgot madvise isn't implemented with BO VMAs.

So LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> > 
> > Matt
> > 
> > > for (i = 0; i < bo->placement.num_placement; i++) {
> > > 	if(mem_type_is_vram(bo->placements[i].mem_type) &&
> > > 	   vma->attr.preferred_loc.devmem_fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE) {
> > > 		mem_type = bo->placements[i].mem_type;
> > > 		break;
> > > 	} else if (!mem_type_is_vram(bo->placements[i].mem_type &&
> > > 		   vma->attr.preferred_loc.devmem_fd == DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM) {
> > > 		mem_type = bo->placements[i].mem_type;
> > > 		break;
> > > 	}
> > > }
> > > 
> > > Matt
> > > 
> > > > +				unsigned int i;
> > > > +
> > > > +				mem_type = XE_PL_TT;
> > > > +				for (i = 0; i < bo->placement.num_placement; i++) {
> > > > +					if (mem_type_is_vram(bo->placements[i].mem_type)) {
> > > > +						mem_type = bo->placements[i].mem_type;
> > > > +						break;
> > > > +					}
> > > > +				}
> > > > +			} else {
> > > > +				mem_type = region_to_mem_type[region];
> > > > +			}
> > > > +
> > > > +			err = xe_bo_migrate(bo, mem_type, NULL, exec);
> > > > +		}
> > > >   		break;
> > > >   	}
> > > >   	default:
> > > > -- 
> > > > 2.43.0
> > > > 
> 
