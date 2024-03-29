Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B11C6FD1F
	for <intel-xe@archiver.kernel.org>; Fri, 29 Mar 2024 11:20:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1EC10E14B;
	Fri, 29 Mar 2024 11:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RpccWOhE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC2210E14B
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Mar 2024 11:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711711198; x=1743247198;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o8KmvLcXzPkRqUTfju7Dttk7cbM24le4LR+6Zw5BenI=;
 b=RpccWOhE3LdCfsKfge6a0rkW36rvYf5dhNep/XIGfv6oaC9Q6hcGg1PO
 PDobBbHzlaQ5D0jR7FKKZUVpFHlu7RY59FwpvMXIWEd181gvYC1U6NsZL
 YKoobTxPd9wHjXrTxSDQjoW3aFSE9Rb69MUdtjIg2Oq3YKpuVn61KcMmn
 nxhzD9pd7fDcGabBk3FP4g8Xpou/R7ed6FPfG28jsGvYVIclhOvM1zSNv
 3JlXKYFE+QqaG3NkIcPkrJxVuUngR+My+b+ZqZSfHofxbR5JGZg258bTC
 u7l9B74FgZgMM93uSduCf4v31BmLm23bAro+MzWGqebxNLsd5nEwYAHnD w==;
X-CSE-ConnectionGUID: 5FnrinS/Ru64nbMjS3U/qg==
X-CSE-MsgGUID: uiCLTRJoShenqvrR3vS8YA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="29378939"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208";a="29378939"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 04:19:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208";a="17008002"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Mar 2024 04:19:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 04:19:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 04:19:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Mar 2024 04:19:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Mar 2024 04:19:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzkFTGvsikkt7s7ctCtUEZEH55q9FbmBVpw0AHy/pwp7hCKPfRSwNN9sVwCsX1UyJx1uQ+SnHKeksg2gtA7RWiDtYC5BL77kgFIOPX4oCuLYHIA/GUq6gQEZIH2KMLUx6FhMcaRg0nTYNgsIPnP9LWYYGLHxrjxH7emzmSO7TEJ/RXQQ6PDX+zsj6X6zTuacPuwQo2+AB0FgcKfR5dEwuAA6Hm6v7aZ9dwY82jdZs1cTiSFBV1cJysSAMTxDTzQuFk33evg+lzLMj+PSfZ5+TD0hBTl8NLtiBKSx4RREy6sYzSwFqkKTtyCJZeH+IffbmFw4cUgCSA0jKedgvda0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wh2lGgqF7A7Lsch1+qoXz/B1E7nxPWpAr9L7pu0jdVU=;
 b=GinSHHEV2TakvNMKZrh0EPHnJTkn1SMBvzX9INPqYvEoGuWBFrwSSzobbNxNopWcgk7o02e0e6LAOqgzuyptyLAU7iHPmZ3rown41xNegLunX9yUu2yYacV9ralGWtWC5lYXa9uCvin0IuKUJ95ZBOnRbuWWsvWpvBr5uWDzn2zBB6ZyJ/kv7R0gaLKM/iZo61+LR9nxG6m63ntuu65vmjxvJpHJ9iCZIE4Jl7fAlvw3N+hh34QtpoqjzvO8gSiTCpqZPd1kghZMzyZF37W2iql3X4yozwc8ar1X8A+aGCUejaM3KnyQazkzmoAeRBUOxmN8HbNBnek5vItN8AARWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA1PR11MB7774.namprd11.prod.outlook.com (2603:10b6:208:3f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Fri, 29 Mar
 2024 11:19:53 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a%3]) with mapi id 15.20.7409.039; Fri, 29 Mar 2024
 11:19:53 +0000
Date: Fri, 29 Mar 2024 12:19:45 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Mateusz Jablonski
 <mateusz.jablonski@intel.com>, Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Restore flags VM_BIND_FLAG_READONLY and
 VM_BIND_FLAG_IMMEDIATE
Message-ID: <Zgaj0TNiv69qkt3v@fdugast-desk.home>
References: <20240328200332.7-1-francois.dugast@intel.com>
 <hdwzhu2mz2cmxslcjhcqzwqbalwnm6pl62yo62obihqap3mryz@mmbt5e6g56sx>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <hdwzhu2mz2cmxslcjhcqzwqbalwnm6pl62yo62obihqap3mryz@mmbt5e6g56sx>
Organization: Intel Corporation
X-ClientProxiedBy: MI1P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::16) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA1PR11MB7774:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hl99UnmtEGWKkJdBareig4ucqSkpgYsWRdqEnD62PZBi2VYlQ4rFQxnF1YGAitchceYQ8RA/rUyrhTFWejU6dxGtxKGsA3WHXBSvf9RZaaU7UjYRVRiMiV0DXLDnuf62DrXe0gX5lweyyZoIYWFslcpqBmLIQNOSbB+F/do/L5Glj7xNQV045NlPPZCqYCD/yudd4LFbhbxZWKjN6niIVsF5yh+FgoH9kYuxzicdlKRRsPIRQJzIZ27uZG+4NPuPpG1N4aMppJCm/XueSqyoN4jpcYjy2PpibdWnM3yCNCCBKFi1ijTmGnbWrenLNFj5Axr59tBPkDaSjW0ZepEQs+uLLNBdWmMW5rrNOMu9dqz03SFiZQW4T7gu+rceHJY3hlvi6Y9zCVofMWSJo2KRZ9mCBJtCpFdETRRCc7yiAjeUA9Xg8/5k5Ozs/BlzMaT84oBsetWlFIEyP8T/iOBlhxGeOO3e1dZVJKa3NKLnn+sajGxsDZT7Utv/sTscn2NrmYS/G7n0D+2NZ4LYaQcxJYbuOk0hR/+py6MTlxnL1bGdZeVV5UtJ8OMTPXVvmgjF+lku9x/t3UjmaOaiEV+h2r3FmQd0LnVopF56EKobL0U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k/93/G2VkHyFShthVFNUMoAFHZQjnSZ1rEtAZjtsfa9/lMDSZY3F3bXtr47B?=
 =?us-ascii?Q?sW/3CC1U9lRBmljF4xCEPIY4RUS8kpEGnuW3lGr3q63jjTnSV7eFjUofks34?=
 =?us-ascii?Q?ozKwIQOpatnl9TN4+TxB88Q4y40ZV7yf8q4TDGbPNgzyLikdSoP43q0y0YVB?=
 =?us-ascii?Q?7TbdvM+08tUe0hRFSfuFXSu7vcrlqatY/RFJFk3nifjfA4iqQzHCJpCqRXf8?=
 =?us-ascii?Q?SqqjtlBaWHIfYX0q8rMFsUajtmt+r4UjNiRlyk5Q5ZLa+vvgJMKb3o7UZM5y?=
 =?us-ascii?Q?c9D6d66tfexP1kJcrdvuYrEYJqH8HtZFi1j8yR1x4uV5BEM8uTGk5l3lummJ?=
 =?us-ascii?Q?C4/tnr4TcBNMYiIKoyGZJ+M/D6YSkACnfSEUEmjtKj5Ygyv0iNwyd7GqHtTI?=
 =?us-ascii?Q?tEqeBk26M09+mlMJDGv8suOjCYiNQCNZM82lLCzZXVB6Csv5iM+SpSsdWBn3?=
 =?us-ascii?Q?tSg/Rn+yVup/Y36M+QLYNo+SajgEFGfrHh2sHGljm5C0v+EcAVxd2Cj0UcQU?=
 =?us-ascii?Q?9Oxdz5JEoofR9SvO8D7tP3KrOnNGcilbs6CDdG0DTCvfOkHGvND6q8l9y6mA?=
 =?us-ascii?Q?hGajguENEQbBr7RwPtpoKtKzVsubVfxRdbFhXovosvoHHoa1vlImWnYClfvO?=
 =?us-ascii?Q?vCs/OtD+V6z09M0S/IE/jP6V7oVnGIQ52uEln6rG0jzBa5VLrgCOC6HmVUhF?=
 =?us-ascii?Q?GR9iZZzD8niWIZUaV09oIkAqY3Ls/NuGSXApqG2iibXgQmOmcMhYdxJKWvEO?=
 =?us-ascii?Q?oMHwJtMIgq2zupRBtfaz9YQsmevSKSEglzFp6v6e7Mk2vF5CHWeUzE/82CI7?=
 =?us-ascii?Q?u+cudLDkFuj5uHNe47WCLujdZ8DoIo0+WSb4lQ8tf2Vl+EDBJioo+ybE7371?=
 =?us-ascii?Q?/yoLPgvQdsp6Y2aAE1ovJ8xZrBPP0gHn3gw83sZa9l9b+koemIoI/qAReB3G?=
 =?us-ascii?Q?0+ypAs+Fs5kB6Uu5CH3NIDhZbgCT0OUxwU4hj84VidgmJV0VO23ngp3eyFDb?=
 =?us-ascii?Q?1M6VqKPpN1PChJZjoCm1rwTKs9Ff95k3877GFjvDA4plpR/Oos91IhGqsQq5?=
 =?us-ascii?Q?HGPx3Lbb2kCaF8DjNo5ZYe55lGaHgcG7AfUW2SGoo7uTdvxEdnlp2wgRUSaj?=
 =?us-ascii?Q?iinYx2+eYV5AKUrvFbTN4OJaMha/zNgfO7QjJcnOkLv9UEM0Cw0UbbC1Nwx/?=
 =?us-ascii?Q?gUSvJZDJjsobakPrgQ9bnLLJIXwLzqtg/XK3JJ63KV7HG09F9J5TGDJoR+eg?=
 =?us-ascii?Q?rxgj3btk6Gy9bO0TQ5f/8Z+idMyceHWKi2FAobFGts66v9widbKboTfm5UCg?=
 =?us-ascii?Q?X+k5SZVtSPxXE3nq0pE98ZypZhjR/5EdNVeha2npouRTlvwIXfwmkIzGJf2D?=
 =?us-ascii?Q?0sj4pG4qVE0302Lr0wEb/1mQFFjQUHD/9S5NjqpE+16QcKZP5wMgpnlXlGFp?=
 =?us-ascii?Q?M86UjJFyuQ5TygHgAMp2nwSAetwzj6rGI6OTjJwt3+9DF46DuvIBJs07+rcu?=
 =?us-ascii?Q?XGGm0p8p7T4uITFudrbOqcryySIXwUYOPR3gmgTwMpfzLrdDTQTjnalFkJXC?=
 =?us-ascii?Q?vUHXxRM1Q9zbLD2u38Iv9p39pHmiep5MEb7Vn64yz0KBCNqxImEgPnu4lldN?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61797710-defc-4686-0954-08dc4fe227b8
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 11:19:52.9925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qbka5QYfGEPn3w8ldNDBv/FmzymP4cbKSh3/6dUu5Rd5pXL3Tv406tQl4QWwoc08wBFrB1VoLzT2cDSYuK7BKq2g5Z7TRbzRYTUzn5Bivb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7774
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

On Thu, Mar 28, 2024 at 04:37:40PM -0500, Lucas De Marchi wrote:
> On Thu, Mar 28, 2024 at 08:03:32PM +0000, Francois Dugast wrote:
> > The commit 84a1ed5e6756 ("drm/xe/uapi: Remove unused flags") is partially
> > reverted. At the time, flags not used by user space were removed during
> > some cleanup. There is now a need for flags DRM_XE_VM_BIND_FLAG_READONLY
> > and DRM_XE_VM_BIND_FLAG_IMMEDIATE by the compute runtime, so they are
> > brought back.
> 
> Michal/Mateusz, do you want to expand a little more here on the intended
> use for the flags?  Let us know when the userspace side is
> reviewed/ready so we can proceed with the kernel side.
> 
> > 
> > v2: Include a link to the PR in the commit message (Matthew Brost)
> > 
> > Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
> > Cc: Michal Mrozek <michal.mrozek@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Link: https://github.com/intel/compute-runtime/pull/717
> 
> from a quick scan on the code it seems there were already users, but the
> ioctl wrapper was not setting the flag appropriately so it was flagged by the earlier
> cleanup as "nobody is using it". Right? It seems that it was
> even already the expected behavior judging from
> 
> 	bool IoctlHelperXe::isImmediateVmBindRequired() const {
> 	    return true;
> 	}
> 
> Similar reasoning for the read-only... apparently it was already being
> used, but the interface was incomplete.

Correct, the method above was not plugged to XeKMD uAPI.

> 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_vm.c       | 13 +++++++++++--
> > drivers/gpu/drm/xe/xe_vm_types.h |  4 ++++
> > include/uapi/drm/xe_drm.h        |  6 ++++++
> > 3 files changed, 21 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 8b32aa5003df..6e56b9a3985b 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2212,6 +2212,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> > 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> > 
> > 		if (__op->op == DRM_GPUVA_OP_MAP) {
> > +			op->map.immediate =
> > +				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
> > +			op->map.read_only =
> > +				flags & DRM_XE_VM_BIND_FLAG_READONLY;
> > 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
> > 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> > 			op->map.pat_index = pat_index;
> > @@ -2406,6 +2410,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> > 		switch (op->base.op) {
> > 		case DRM_GPUVA_OP_MAP:
> > 		{
> > +			flags |= op->map.read_only ?
> > +				VMA_CREATE_FLAG_READ_ONLY : 0;
> > 			flags |= op->map.is_null ?
> > 				VMA_CREATE_FLAG_IS_NULL : 0;
> > 			flags |= op->map.dumpable ?
> > @@ -2550,7 +2556,7 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> > 	case DRM_GPUVA_OP_MAP:
> > 		err = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> > 				 op->syncs, op->num_syncs,
> > -				 !xe_vm_in_fault_mode(vm),
> > +				 op->map.immediate || !xe_vm_in_fault_mode(vm),
> 
> this doesn't match the doc below, but I *think* it's just a doc issue?
> 
> > 				 op->flags & XE_VMA_OP_FIRST,
> > 				 op->flags & XE_VMA_OP_LAST);
> > 		break;
> > @@ -2825,7 +2831,10 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > 	return 0;
> > }
> > 
> > -#define SUPPORTED_FLAGS	(DRM_XE_VM_BIND_FLAG_NULL | \
> > +#define SUPPORTED_FLAGS	\
> > +	(DRM_XE_VM_BIND_FLAG_READONLY | \
> > +	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
> > +	 DRM_XE_VM_BIND_FLAG_NULL | \
> > 	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
> > #define XE_64K_PAGE_MASK 0xffffull
> > #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index badf3945083d..0447c79c40a2 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -276,6 +276,10 @@ struct xe_vm {
> > struct xe_vma_op_map {
> > 	/** @vma: VMA to map */
> > 	struct xe_vma *vma;
> > +	/** @immediate: Immediate bind */
> > +	bool immediate;
> > +	/** @read_only: Read only */
> > +	bool read_only;
> > 	/** @is_null: is NULL binding */
> > 	bool is_null;
> > 	/** @dumpable: whether BO is dumped on GPU hang */
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 808ad1c308ec..94e1f3cfe705 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -871,6 +871,10 @@ struct drm_xe_vm_destroy {
> >  *  - %DRM_XE_VM_BIND_OP_PREFETCH
> >  *
> >  * and the @flags can be:
> > + *  - %DRM_XE_VM_BIND_FLAG_READONLY
> > + *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
> 
> so we pass immediate == true to xe_vm_bind() if it's either
> op->map.immediate (set by this flag) or if !xe_vm_in_fault_mode(vm).
> Which means the flag is actually implied if it's not in fault mode, not
> that it's invalid. If it was invalid, I'd actually see us blocking the
> ioctl. I'd reword it as:
> 
>  *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - On a faulting VM, do the
>  *    MAP operation immediately rather than deferring the MAP to the page
>  *    fault handler. This is implied on a non-faulting VM as there is no
>  *    fault handler to defer to.

The is the doc from before the removal but it was indeed incorrect, thank
you for catching this, I will update it.

> 
> also, even if DRM_XE_VM_BIND_FLAG_READONLY may be kind of obvious, let's
> add a sentence with documentation.

Will do.

Francois

> 
> thanks
> Lucas De Marchi
> 
> > + *    MAP operation immediately rather than deferring the MAP to the page
> > + *    fault handler.
> >  *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
> >  *    tables are setup with a special bit which indicates writes are
> >  *    dropped and all reads return zero. In the future, the NULL flags
> > @@ -963,6 +967,8 @@ struct drm_xe_vm_bind_op {
> > 	/** @op: Bind operation to perform */
> > 	__u32 op;
> > 
> > +#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
> > +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
> > #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
> > #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> > 	/** @flags: Bind flags */
> > -- 
> > 2.34.1
> > 
