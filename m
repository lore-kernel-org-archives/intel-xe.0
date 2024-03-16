Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D3EC54E67
	for <intel-xe@archiver.kernel.org>; Sat, 16 Mar 2024 01:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70342112876;
	Sat, 16 Mar 2024 01:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBXKO+/r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE13C112876
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Mar 2024 01:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710552700; x=1742088700;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2iy6o0c3Jj+FtssNXt/HjpeXX9nSX/NBHcKQpWCQTyA=;
 b=mBXKO+/rez2+/+KhF+4us07tUcOtZwelDUGZYMIXh3Prg5l1rItRbWzg
 VLaDscUh3dGKDhNceWkqDfQZuD9XeuG9xRjsZWNJUBaji43aPTTfO5xJg
 a34hi5F+pcX/+kPyRCTgDsc7gfTQVO9x1NhvChgDd4fFdlbeo9yuv2MAO
 5bIxkXzRJXlGCGrZFJiwYdZZA/M2lDszUumfLGq59dgOaJg84gTruVX6h
 eufhe9yT2qcVP9RA8PGeId6P/nzn+YXW7sIam8xhGgtrk2Ju3hpOM2YRG
 P+FjO8myVqSv7NzQ+i/1o1qQ9Z6sTwdrHiG0axWSAV1NpemsSv8wV7f+j Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="9273208"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="9273208"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 18:31:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="12900020"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 18:31:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 18:31:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 18:31:39 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 18:31:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeVQb/3Xl/PRuIvDOzYce8oK6PbskFCNmIR0NnL/seRElccEwDRRsbAbPClRFP64lCnUVL0WWbqC4bpX73B8Sv0z6JqxklmXpK+wANJCYVfYsz7zarF4Mi7PnphnI7c5bqcxin4jbRgcbHusvwJHmWIxiWVJwcyQNdJVZHb42wcfUBpvWhOg1ZP7DuLdgxW+z/Cazfxt2CFTIrEznvK/XOM9abwBGijMsBqL+ymQPMfNCLDL68iyMG1ZnBeD7b6xgkwu6hHnUE7/OQLiyVsK6ti1OGhbPsYqnFknoYTn77W3x2C+RcLd0Wjqkjp+o7mFdTMv1oGzOqJAuDXv08n/Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QobR3KL3f3A46l58/z60pKdfK1wUiuqFBHaX+Nk2Fgw=;
 b=k/P5sM/OsHlhjSvO1jaNPuQlFLJITxMHXdGz4KUv4GrTzS7sERxaQv3njWu/tyGc9BjvmpG+Xqzt0q+Sf2E2HWEhf7FfjQOSlUnOC8haWvr7O1qRfvq5eSEC874AY++MYj1EINUvm0pGEBh/Gl+cBSb9r8aoHL+lfS/M7p6DrZb59UCB6C/jJMx2Ljpxwiq/k3/X/cp4cuh/k4C38PARgCU8X35t1ECG7UCkoysavmIR2fQmUGKHfdtmb3pZ3aMYj6D4V7tr8MsJcuPOyLUSvUyBdkS+ck/7R0QL/+0v4enN16kizHe8WRFXBGGJQuJ7R1Yy4ABA0NjDNvKEO40rWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Sat, 16 Mar
 2024 01:31:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Sat, 16 Mar 2024
 01:31:37 +0000
Date: Sat, 16 Mar 2024 01:29:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe: Fix out-of-bounds warning in
 vm_bind_ioctl_check_args
Message-ID: <ZfT2FLYL2Gs3uq94@DUT025-TGLU.fm.intel.com>
References: <20240314095442.32153-1-nirmoy.das@intel.com>
 <41ec2264-95e0-4832-963a-2d47f0b3669a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <41ec2264-95e0-4832-963a-2d47f0b3669a@intel.com>
X-ClientProxiedBy: BYAPR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 66a3fdf8-789b-4d83-6a5f-08dc4558d267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z31qcsvjnHPytY2Bgz+8559xDNttcrhVNeV08PvMIfYFkq8ozeKGjMlTGuaT2mlpOLV6DSddBC0iLcXC11EEUnQWt/8RWpUSyI/OAbqFWFgCUcsj7vUCykaKuA+qG19wnmBudjYgg6NQBGcpXmq4G70Cpx17DpZR60+g9ZvSl7Utc2AZze7dO4R7DyEW6NtCFA2DDAATIM46x+w8SRH8XOT1DboLjKJH5Od7z36Po6a8GnrwTQ7NZ3n2yzuWqJgW4Q+Y83vLCwKGvgSWnCsGAOqclqjaYzKJxwQD3rU5gGGZcSXQMOl3Y7yLIzdPPAPGUtldCpoXyT386ITjeiS+wMPFHoToVTeLxc6JzhrcPbKMfCWNZW3JfRzCPfS7tmJQ1XYpnFdDNe1feUGY14q3GNaHddmrfk9ggQys/uS1z4E5LktMICStmiJCzoMSa4Fro3tEMEUofFFm58sT4FykyzPtOogpFCdJL6AUsFcyY7zCkmwXFk+dW9au7IBghdZ/BcS30B/YfVGsNPTdw3tjNmzS+WRdCm9byyuPNEC7Ej3sIR7oCjJamV9NNWz6QRsYK/66QX3pW5r0L4ejpbqCWrMAmDauVAUEQoioOdjGaxyWSE8fk9jcoZwCg9uWuPpJdfZozOlO27QJr1rXh27PJEtRmjb6Z56Fu/Q3ArLW3j0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pBR30HrK2ExG2Ig9+i8nHetwN1Ys0ORIqKotbDZ3gAybSRcsygMV00QJpRfy?=
 =?us-ascii?Q?29mzG5RTwpRtXQRvZ1kv8AycVOfmcxY6+5XGpkIV2Xsqy6iTEh9Ko8Awt59Q?=
 =?us-ascii?Q?crudWZl5wRthJt6dIxVqlyY2j44yRE98aJkFpwsHI1MzmwpXS+maURnzHqBG?=
 =?us-ascii?Q?SVnWgJN/esbUVbf77XTHkzEKB7obuO4MkgCUhH7Hjs4CE9kaiemCZHPNpOhj?=
 =?us-ascii?Q?QbWzU7N7ar0kQt739q5i+xm8dypulR07NdlaIkWEM11j7/kNlL6UYI+EmimX?=
 =?us-ascii?Q?0ye03UjhZbScqQ82lH/jn0OeArWxVUqpP8BJsiNyt/4fz9d6OtorRvZuC77g?=
 =?us-ascii?Q?PeHaXsaWcvQnvHNF30z/1ek4w14HyNKJNV2gSXqt1cG46iUGnVRcrv4ww+5P?=
 =?us-ascii?Q?UGQQRB8UyUKy0joz5ZqDMK4SIDFnLpl0D9K5sKD7ZBRqiEqvML2MWm7ncBw5?=
 =?us-ascii?Q?2S69+cMpK6ZXog0K7ON3rzvhYbk+Qs0U/SPvn9M0iXspkof7kqRFuC24eIkj?=
 =?us-ascii?Q?ag3hhEaVvstae8ceZHO+1PPd5LSrjzXdU0jKT3oBW2nW/xjhVWY+NDWsGN1p?=
 =?us-ascii?Q?dDAo6ay422ugiMR6rnU7SmoITSxWrccb0vLcdGsJC16hZduUbpNWeOnhLAx9?=
 =?us-ascii?Q?lfhCyHhashJqm8G0djHaVKoS418AgNjZvbAQK7vvBbQmYRUu+kaqQMYFJG3T?=
 =?us-ascii?Q?GTGcLP3CVTFcOBvdOzi+oCfFX9VlFnmHcyb+qfA+L6V9LzRU6+TR5q92ea9r?=
 =?us-ascii?Q?XAmqgXVS4DRq2qtxEbhWytwBYOxMpJ/lTdYLg8eMSp8o+cb+L/q42biSD5Ra?=
 =?us-ascii?Q?hrNH1RuMrjD+CSC9/als+KN3UBJW9dQKK/SWB4Zpo/T7GHyH6pXc89m6ZS9C?=
 =?us-ascii?Q?JOp4qjsjHLgU7xWuuOGF+Sq/4UbGGpwHRy95riVJLWNcjndqhRFIwdA4c9n0?=
 =?us-ascii?Q?4VTg8VGAsOyuJ9rlrnifh83y5v14dArQCqF1RTyMlJu5gzkTL421vfY5pL2+?=
 =?us-ascii?Q?gQ3pA7f+gumE5GcakjJBiEU2LiTp8UHeJN78Uw5swqEaed6guIbCqiBrhg4Q?=
 =?us-ascii?Q?LAnIikq2eYR9lpwqPmsa6rVkrmLYczdhgbD2WCvXl4TPaVT0/sF4ZR9trGDG?=
 =?us-ascii?Q?5W5C6y478nq20jf+kPIsyAi1DbCXiHcr83XDDpLrdMbOfnOgr2l+xEGKwNZO?=
 =?us-ascii?Q?7WpjIQaoLzDOjLu0cDZOGI4WQc7O3myjjpX7OL6IWtCgZueDFbgpp67IjTpL?=
 =?us-ascii?Q?wCISdlbtggT74oX8oBP1XA7Ll7S+MTjwFf960LFGXCj5EFeZ1zBjy/VoDBA9?=
 =?us-ascii?Q?19c0OWEXsm8NlJB4AOWak4dMJHeSg0Ig+Nxy2FwbnZbRKtKwo20h4EOHZ0zX?=
 =?us-ascii?Q?pe6yaCuQAERyf7sY/3U2EqkqGQ60g56rPJ0YimMuzTNKgM6jg55lFFUH0/6T?=
 =?us-ascii?Q?/73qfZ33SuDaXKyy88UQb35h966J3XcOnt2vqfYJrMyqqPxjiCKwMrrrWGfj?=
 =?us-ascii?Q?bxMDYSHrrnuL1SBWdrcOPhFedsFr72sx+Pl07DnZuQHkLXYjgCrteGUygWN0?=
 =?us-ascii?Q?Jf+UkZAmEJkQEFuI5FsNjOFq7p1OhjQ1ZVMu5SWEOGAo8djkrQYp4EQ5hQrp?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a3fdf8-789b-4d83-6a5f-08dc4558d267
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2024 01:31:37.0308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHqHCPr4vf723d0NDQguovFLLXDursbMAXO+H1OYMEhLQug00DDETmw5VNDWQX7wKMNxNfhSNkZ6nCKbUC1bEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
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

On Thu, Mar 14, 2024 at 10:55:42AM +0000, Matthew Auld wrote:
> On 14/03/2024 09:54, Nirmoy Das wrote:
> > Modify how bind_ops is assigned and used within the for loop to
> > accommodate both array and single bind scenarios which should prevent
> > out-of-bounds access warning from static code analysis tool.
> > 
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> 
> As discussed offline, current thinking is to just ignore this one. Looks
> like false positive. Also we still end up doing &(*bind_ops)[i] so probably
> it still complains.
> 

Agree with Matt Auld here.

Matt

> > ---
> >   drivers/gpu/drm/xe/xe_vm.c | 19 ++++++++++---------
> >   1 file changed, 10 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index cbb9b8935c90..0b742d8d82a5 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2839,15 +2839,16 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> >   	}
> >   	for (i = 0; i < args->num_binds; ++i) {
> > -		u64 range = (*bind_ops)[i].range;
> > -		u64 addr = (*bind_ops)[i].addr;
> > -		u32 op = (*bind_ops)[i].op;
> > -		u32 flags = (*bind_ops)[i].flags;
> > -		u32 obj = (*bind_ops)[i].obj;
> > -		u64 obj_offset = (*bind_ops)[i].obj_offset;
> > -		u32 prefetch_region = (*bind_ops)[i].prefetch_mem_region_instance;
> > +		struct drm_xe_vm_bind_op *cur_ops = &(*bind_ops)[i];
> > +		u64 range = cur_ops->range;
> > +		u64 addr = cur_ops->addr;
> > +		u32 op = cur_ops->op;
> > +		u32 flags = cur_ops->flags;
> > +		u32 obj = cur_ops->obj;
> > +		u64 obj_offset = cur_ops->obj_offset;
> > +		u32 prefetch_region = cur_ops->prefetch_mem_region_instance;
> >   		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
> > -		u16 pat_index = (*bind_ops)[i].pat_index;
> > +		u16 pat_index = cur_ops->pat_index;
> >   		u16 coh_mode;
> >   		if (XE_IOCTL_DBG(xe, pat_index >= xe->pat.n_entries)) {
> > @@ -2856,7 +2857,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> >   		}
> >   		pat_index = array_index_nospec(pat_index, xe->pat.n_entries);
> > -		(*bind_ops)[i].pat_index = pat_index;
> > +		cur_ops->pat_index = pat_index;
> >   		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
> >   		if (XE_IOCTL_DBG(xe, !coh_mode)) { /* hw reserved */
> >   			err = -EINVAL;
