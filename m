Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB60CD11DF
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 21:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D1310EAE4;
	Thu, 28 Mar 2024 21:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYC73Vj+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F56710EAE4
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 21:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711661866; x=1743197866;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HS5/19MBFn93FGxcBUY0lmzXgVFbJtuuqh7s9vEitGk=;
 b=KYC73Vj+16QtswZLK3tHRBlOB7/JxL/CRPLu9wBhfF2+36MR8K+Jfsly
 bV/x5qpZ0f42tri8Xo8ulnIt4HfNXAddRVQSPLnIIVub6oUVg/NA07tHI
 yJB35vkQUadSpRxW9+ED36fEjFK4/viLM3pSIb9nCS/NYZxpeaON47Sr3
 iO14lTdMQ793anu7xb6FTDRcGpJerPxcIJtilY1NbOvzbj1WeepO6d/F1
 pSnmKNnthOeKJ85IwW2RQQ5jXDvRSXbsMrgJgJuhlkpClJsnsuOHzzIKe
 XqpJvaF1JrpSVXWg5AopGhkPaIfrZIck0HfRSpvh6/RRQwpjn9PlYvYtV A==;
X-CSE-ConnectionGUID: 4GwhDdUFRSai+f2Iz0ETAQ==
X-CSE-MsgGUID: oOXS6sByT3u3T09NUwXBPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="29326947"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="29326947"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 14:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16603702"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 14:37:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 14:37:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 14:37:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 14:37:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 14:37:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7KGjF4VP3z8DhQYsdRrPxjis13vwIGmX8hbI5Fj2PQrYUmBjjAZa7TaIwCmKLyOniCwAg0FcxIuHNeZwIlzk79j+uUGjUPsj71cGH2wbvU7+5jV2D5az4qOXQe8fbkjIeG64ICST8Gh0hi1CQ8wtgv90u9vXTh1UmXk/LjzUnjxGZwAZ8FMgCcW146PZJ7TaAwFB5rtXqiZO5pFZibc4/JXBRGUG9kKzkzSaNEpDP5ss2kKkf4d04PiSMAaoNcwTVbSrN6vPt4rCYHrieMOoc1tnFp3ddxe9aSR6mh6Rcdoc2r+AFLPP08lwh5UUdkZ8Kuj3VuHfygJIfFObOXuHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6Hc8n///dm0yOzfihh7nAaKaYrLoPXO4pnpmFivyyk=;
 b=YLOop2DBzPr2CeLC/p2dHGLFjI9RqjQMjoDC9x6b5axWx7/t1ZUgACZ0tGwq5/aPZU/HvO5CX+oSQUoQb4b6z/WA/q6w0l/752eKic7xzfhCfbZ+zAc1ZMd34ZPIE2ErXBgGEZEHRhAGwZHD7bnHBDUjBahHEpwfhz9bAB1s+RZU4A/mqi+LK7FqmdV8yVzYrBribjFwK9avXf6agB/cBvrDKT09OgNd0lA2TtXt/zMy8q3nBn/r5uwKdN+X76wRypIFMtbyKqnuRqPNTGYVd2njdJqkXpv8n3dPA49nNbNE/lyGJw0SxyC4RbffBbkBDU6WfbP8L+gjsGGtWKUuaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6525.namprd11.prod.outlook.com (2603:10b6:8:8c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 21:37:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 21:37:42 +0000
Date: Thu, 28 Mar 2024 16:37:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Mateusz Jablonski
 <mateusz.jablonski@intel.com>, Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Restore flags VM_BIND_FLAG_READONLY and
 VM_BIND_FLAG_IMMEDIATE
Message-ID: <hdwzhu2mz2cmxslcjhcqzwqbalwnm6pl62yo62obihqap3mryz@mmbt5e6g56sx>
References: <20240328200332.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240328200332.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR11CA0067.namprd11.prod.outlook.com
 (2603:10b6:a03:80::44) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6525:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7I8mK4wqQB4BPyT4q8OWTDzc9ypu/Ok3ZKDKM0R5PB9FIv0cvYf5KfR19TP3twjSmTXTiLRVICtWg4vmPzROIBDVIyo5q1yccewu5Eza+VERbNpMHGURlTEHMI3a3FquveVqXUDOfF0+DjQW21MYkA5uUwLRdP4F905f1YSHGFlo1REKcculc3CE6i7CMVTMTJI9r+/957l38BytgtSmyGGr0dsi0j/SqBnIKU4FZaEtbHPy4Gqd48MtQEoZ4fqRhjFp6WbisB4wBxDhXeFqP+ZvQgvGmS94mJtlq+0NxK1e3Qw8/AaOwzBzIHIetpzryJkAwjW/wuNPkZToUr8HZFaiP9JwGRR4h98oxDvQyA1i9ZfGGWJzXr8OjTyCzyh+/rvoWaGAPZe6nFs4c070aZQ6+lPsD2g9kTF3ouhBN3MNTS2MFlR5P6ict1cOW97pr03K0cYI5WmobWpaSQGS31L9t3KVqWZDA4CKm6mtFAyDEAe7jIgvexD/+Zk5s+5Rb7FRvqgRf5TcPO31IhtbGBp1ANuRkrrR3dUdMO09919/2Kqmng5JJDk6H7VnxcAEKu4GkWjY+FKueV0wRrSUbq25G1b8O3xH4sG+FU4dODo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qUODV54VnYJdDTvHRFdNpUyFFVF6xyS6J3OYLUKlM5iLrypV8HmKVAyBjeTt?=
 =?us-ascii?Q?rR/38PeISQJjU6beIJWKkAG2YfJ7FaxmZKSZkIQV7ysW0z7zM9BayPr3HF0w?=
 =?us-ascii?Q?FjweOxX/e5ZyVStzz735SyosAKNUJz1B9Vb9agL7Ey0UFPipGlYxzjLVgczC?=
 =?us-ascii?Q?ILPpntp8BR/YwDqSba8pRSnlgZowU5QqV5uS68NlVQwhKDdJoBL0MF+sTxtF?=
 =?us-ascii?Q?T7qw9M+G9jft1Ef7RaIAnkgdKFOsIiWfU/Gqgg46XcCnYxFuFJ2w9AZuzBKX?=
 =?us-ascii?Q?1XZMJn35IGTa1b3s19DfHOyczSwDeO9Q/nT1LoFFo2HzGJGVmQsZx8Eb298S?=
 =?us-ascii?Q?ON07XOMXKjEtwM+tFNX6HvCc/KqsQDlsVBdbBGALdZFNbNv6ep8l0w4aYFAJ?=
 =?us-ascii?Q?prTQIvTgl6gmuFIFhx3IUUUIMuu38zSOSmKOs3oINoVKh0hQFgu/4EBPr4F0?=
 =?us-ascii?Q?NVpLO5PqDVjGkQBCGHXqKOCTICaDwJs/rdWv8AWasxxy8a0rvWi5TVO9gYZI?=
 =?us-ascii?Q?W5vYp6VFb3gSVhk4uz3ssapnepJ6tMB55H9HSdUGsBWzL350sAtUL4Hwn31n?=
 =?us-ascii?Q?aZe5rLw4D82Fb77IlbcqvifVLHeXahg4enhMpMF9r/GYxeudu7hrcHHoNOAp?=
 =?us-ascii?Q?hFbuoCoSarrQm4y/47s/97FJf0/nI/6+U4FgR87TPY847MEb3FosPd49f3u+?=
 =?us-ascii?Q?nQdP0aOz1O9INVtw7nARg/eEWXdLjATMhbnnVJ9HPXJ6YQXkGf/0w4WutLPd?=
 =?us-ascii?Q?fDLQ5STkqYy5r94gN34esUgcP3fjqg9DO+HHawehXUShOxmv9FZVgx0bPHQY?=
 =?us-ascii?Q?QvxPa17hPviPQb87EISJnHFBSSY+MLBwtmCfwjhEcBRsXGlo7u03LreeeApK?=
 =?us-ascii?Q?ExHkeY2cO1zJ0/Y+68OiiiEV0DYaa8b9rHaAHUWmDqrpaMn6QGx5S7vtBlo2?=
 =?us-ascii?Q?VTwMVQ0HFwgH917Awu9Xtz4Z+k/HDGrhANvCP5HpcshHcfFldikL4h0RLhlx?=
 =?us-ascii?Q?yEZX4xqR/7sg7QyvXftwuUg+QAjOF+O8VIr9b1+oAKkQJHk2zotdGj0P00pi?=
 =?us-ascii?Q?AYQt3LsAV0oJXLe6QFkLDrgNYPU/hEGt8uv0MaP8lF+mTgMigERfyyA6vvkr?=
 =?us-ascii?Q?y+ep96cuZw8JHoQjsIMaeuGCq/f7Hn/leX8OZTqzyI3uOSvTZ77vLfU9Fx+Z?=
 =?us-ascii?Q?1sXwzE/wfue89h+hyBC1Nxp09n7a7m8cee3UW7qdyAVrOk3DewsWuT57u38z?=
 =?us-ascii?Q?sAbhbMIxFQk3/gHwEzDmJjtMMi4nbZbbl9nf0y1N3lqRLdKVu155mwkIHUPs?=
 =?us-ascii?Q?JiutCVt34MsBuHU5UhmE47mKqdheRURONP0MkvRO6cxdqU4xHGzG0y3QtrQa?=
 =?us-ascii?Q?NAAKoKjbZ5CGVUIGH337M6c7gsw3lmcwo4LHSI/lLD8/sMkBCAPFYpaU3JHN?=
 =?us-ascii?Q?nGjqxlcakw39xvZG7sk4XOqZvLdhoLItT79165T3h9jMwNZRNlNhDNq2l+e3?=
 =?us-ascii?Q?A6kDEYdzG3zxSK3fekerfPrvQHMW+f/QMsRBWMvDdgpqg30DSpIw0oe0JNDo?=
 =?us-ascii?Q?Mj6RIuiLJfGrRZnMGhj9VolG2mRQnmARfajPe/gLf9cbZePLF/Z2dWI6oEaB?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cef2ec-176e-439c-a8fe-08dc4f6f4c5d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 21:37:42.3842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lmLHI+kD2U0CxCXkixNX8OhgmaXbPV0YJRyTlr8Ce7rkydECi+cMx8VtQUxSO9YlB35LHoEOggsHTcYLvKjisXyItAwBH+lOnKqGBnHcJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6525
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

On Thu, Mar 28, 2024 at 08:03:32PM +0000, Francois Dugast wrote:
>The commit 84a1ed5e6756 ("drm/xe/uapi: Remove unused flags") is partially
>reverted. At the time, flags not used by user space were removed during
>some cleanup. There is now a need for flags DRM_XE_VM_BIND_FLAG_READONLY
>and DRM_XE_VM_BIND_FLAG_IMMEDIATE by the compute runtime, so they are
>brought back.

Michal/Mateusz, do you want to expand a little more here on the intended
use for the flags?  Let us know when the userspace side is
reviewed/ready so we can proceed with the kernel side.

>
>v2: Include a link to the PR in the commit message (Matthew Brost)
>
>Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
>Cc: Michal Mrozek <michal.mrozek@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Link: https://github.com/intel/compute-runtime/pull/717

from a quick scan on the code it seems there were already users, but the
ioctl wrapper was not setting the flag appropriately so it was flagged by the earlier
cleanup as "nobody is using it". Right? It seems that it was
even already the expected behavior judging from

	bool IoctlHelperXe::isImmediateVmBindRequired() const {
	    return true;
	}

Similar reasoning for the read-only... apparently it was already being
used, but the interface was incomplete.

>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_vm.c       | 13 +++++++++++--
> drivers/gpu/drm/xe/xe_vm_types.h |  4 ++++
> include/uapi/drm/xe_drm.h        |  6 ++++++
> 3 files changed, 21 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 8b32aa5003df..6e56b9a3985b 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -2212,6 +2212,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>
> 		if (__op->op == DRM_GPUVA_OP_MAP) {
>+			op->map.immediate =
>+				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
>+			op->map.read_only =
>+				flags & DRM_XE_VM_BIND_FLAG_READONLY;
> 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
> 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> 			op->map.pat_index = pat_index;
>@@ -2406,6 +2410,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> 		switch (op->base.op) {
> 		case DRM_GPUVA_OP_MAP:
> 		{
>+			flags |= op->map.read_only ?
>+				VMA_CREATE_FLAG_READ_ONLY : 0;
> 			flags |= op->map.is_null ?
> 				VMA_CREATE_FLAG_IS_NULL : 0;
> 			flags |= op->map.dumpable ?
>@@ -2550,7 +2556,7 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> 	case DRM_GPUVA_OP_MAP:
> 		err = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> 				 op->syncs, op->num_syncs,
>-				 !xe_vm_in_fault_mode(vm),
>+				 op->map.immediate || !xe_vm_in_fault_mode(vm),

this doesn't match the doc below, but I *think* it's just a doc issue?

> 				 op->flags & XE_VMA_OP_FIRST,
> 				 op->flags & XE_VMA_OP_LAST);
> 		break;
>@@ -2825,7 +2831,10 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> 	return 0;
> }
>
>-#define SUPPORTED_FLAGS	(DRM_XE_VM_BIND_FLAG_NULL | \
>+#define SUPPORTED_FLAGS	\
>+	(DRM_XE_VM_BIND_FLAG_READONLY | \
>+	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>+	 DRM_XE_VM_BIND_FLAG_NULL | \
> 	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
> #define XE_64K_PAGE_MASK 0xffffull
> #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>index badf3945083d..0447c79c40a2 100644
>--- a/drivers/gpu/drm/xe/xe_vm_types.h
>+++ b/drivers/gpu/drm/xe/xe_vm_types.h
>@@ -276,6 +276,10 @@ struct xe_vm {
> struct xe_vma_op_map {
> 	/** @vma: VMA to map */
> 	struct xe_vma *vma;
>+	/** @immediate: Immediate bind */
>+	bool immediate;
>+	/** @read_only: Read only */
>+	bool read_only;
> 	/** @is_null: is NULL binding */
> 	bool is_null;
> 	/** @dumpable: whether BO is dumped on GPU hang */
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 808ad1c308ec..94e1f3cfe705 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -871,6 +871,10 @@ struct drm_xe_vm_destroy {
>  *  - %DRM_XE_VM_BIND_OP_PREFETCH
>  *
>  * and the @flags can be:
>+ *  - %DRM_XE_VM_BIND_FLAG_READONLY
>+ *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the

so we pass immediate == true to xe_vm_bind() if it's either
op->map.immediate (set by this flag) or if !xe_vm_in_fault_mode(vm).
Which means the flag is actually implied if it's not in fault mode, not
that it's invalid. If it was invalid, I'd actually see us blocking the
ioctl. I'd reword it as:

  *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - On a faulting VM, do the
  *    MAP operation immediately rather than deferring the MAP to the page
  *    fault handler. This is implied on a non-faulting VM as there is no
  *    fault handler to defer to.

also, even if DRM_XE_VM_BIND_FLAG_READONLY may be kind of obvious, let's
add a sentence with documentation.

thanks
Lucas De Marchi

>+ *    MAP operation immediately rather than deferring the MAP to the page
>+ *    fault handler.
>  *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
>  *    tables are setup with a special bit which indicates writes are
>  *    dropped and all reads return zero. In the future, the NULL flags
>@@ -963,6 +967,8 @@ struct drm_xe_vm_bind_op {
> 	/** @op: Bind operation to perform */
> 	__u32 op;
>
>+#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
>+#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
> #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
> #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> 	/** @flags: Bind flags */
>-- 
>2.34.1
>
