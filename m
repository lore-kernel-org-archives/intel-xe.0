Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42E8C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 22:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52D5898A7;
	Mon, 23 Jun 2025 22:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzpC0BSC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D003898A7
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 22:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750717595; x=1782253595;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fPpzIU9XFiDRkiGypmWlwVJzurL0GppI8R7TqbhsTc4=;
 b=nzpC0BSC9PdupR4lcPA77u7Xj5U8uA2qj0MgKS6hrCez5flujs9qn/Xe
 v/KXhR7TYKPeycZKA1RvJK5dGcDYKRsgXIFhdzw+dJqDhjNwYscSH+LZ2
 8sdVqfdyz/qMHDKyxDstlBShWtXubP9oDla4MjIjNXqEarFxlwgvBh37w
 02BsDGopS9ePtRVqmZbuSigKPpNO5NqiAh1l5z8tMiGY9zhNslpJpE2gu
 vy6wTyNUSH/9qXxQVMo1l/bUDRbrzc+RGxtfWd796kVhQ81fWOwYu8iuB
 KUTgAZqhEwwy3WMYZtx2pmK4cm/wCS9pNXrrbLdEKYp2AuI8nceypMknz g==;
X-CSE-ConnectionGUID: 68xPteqVR5mwXzLFaXCYcQ==
X-CSE-MsgGUID: IgCixWvCTP6TL7dcI4m/iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63210514"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="63210514"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 15:26:35 -0700
X-CSE-ConnectionGUID: 0+YseApiSf+72xSubIw3BQ==
X-CSE-MsgGUID: 27bL0UlERP6Hflx5wpUeuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="156020032"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 15:26:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 15:26:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 15:26:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.59)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 15:26:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXql5oClfYP5jeAGD39HvUszrLnQV2UnfFmHY/PySJQpZGa8D/se/Dn0wdYJWDpEZsvs/K73L0Oc5Kl5Al+ix2aBnfjcAqH9EFkiD9wbWPx0GteQDz2T0tqVJVHN7GXCDmhtKYSDfx6+tMHulNehtVAvJjTcF99zB+OJqkUD1Bd/z4zUl+gIhorTfrqI3mqUgl77xyKc/tNNMPgbx3qHQ74wrPllk9HfIfsjFRUGJIdnt3Nn3fjDwZ6kLQQyYl01ju+xdLLApiR2sLg8OrF4p7yuCwYGNRkvMiXFWwfXNil5RqiNr76PnlghcJ8TxkOOvaa4SIGDF9pBsbG2pcHq7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vu9h4Y+mG5RJ7S4tOD/2zDlg/lGEduRR+ds/oFo360Y=;
 b=xafbJJOaMOn0GDUPzUPGv1LilW+e/orXjj9Lnm6SFtYbI/oQ544siqiGo7eP16bhTIvaFtkh01YTjUXcMrMzd1Ye0otKZmZ9iYdd6rNmTn7qLKmBJ/EaUvEFvQPoFprlvALAaNeayxlTrhvOpQLb4t1svuVH/8ng2hS63NoXerR6AO6lMFy1p6a550LjdV9C3WGds5M5TS4bsi5chrtHOwWMYrY+mEgciwzc6gRwDz5MflJFMiaxYoycphQWbx+E8/axc2/C/BimHqugcItDYJJf1jle/2yFpL5gS41eEUB4ts9Xim2zUTN2EFueiDic5ocIqonumD2uqwNkNuPzkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4739.namprd11.prod.outlook.com (2603:10b6:5:2a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 22:26:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 22:26:31 +0000
Date: Mon, 23 Jun 2025 15:28:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 20/20] drm/xe/madvise: Skip vma invalidation if mem
 attr are unchanged
Message-ID: <aFnU+sQWnsk63A9+@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-21-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613125558.2607665-21-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0207.namprd03.prod.outlook.com
 (2603:10b6:303:b8::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4739:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eda718a-197d-4714-094c-08ddb2a500dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Gb1jWUfNTJocfa8CESwbvEb+xMS3Ma4fvTtDR2ZUBGkcQhjCeaoLweSgpTR8?=
 =?us-ascii?Q?GM6NjLAw83RZHTNLctmoqGmtzmo0Ua5m/6fl1E6yI5oOryqogU2i8Wwfj9ue?=
 =?us-ascii?Q?YE/rPOMFbfdSahvrQMTjh7H5VZpXfPYClnO9CPTChUcKz9JFRkVAFH7mnNha?=
 =?us-ascii?Q?4ra77LfCozwK4UexKBI+5sc94uzEFshoBysX04bU00r/Yyi2sVCS6bLum8RS?=
 =?us-ascii?Q?YU3ljnXandbQQkPj4zaXA/fehB32GMhQW3I3sWv5MQ7l3dJFDTkhlMFfxJbr?=
 =?us-ascii?Q?xxaJqYmOfdlXdj15gXbpVhpwLNk4kK9JBUk0SxNcg1dQEJbXiq4cqSy0UMqm?=
 =?us-ascii?Q?xM1zMfz7dGMeLEHk+w+r7NYydFeK04RATIuXJE/6ZXQDeRNGwDb7ZPXA+cau?=
 =?us-ascii?Q?rBOtZw44JhtF1ctMIObUu03Yt4PNCtm5F5rchVE+15zF05jGTNSOGtrnq1/U?=
 =?us-ascii?Q?sYa9NJBjToqTKvYi0yuh0zvVt37pT76Q7B41vWGlbKWU4xAMG6NEmdba71PM?=
 =?us-ascii?Q?x13QxktzAQO+J14ESF8IYYYVp6giMhNOtWbrOCQh7T8Rl9R7nS35oSoMv/nu?=
 =?us-ascii?Q?sFJ2omVoaTZD6+XhjLdPndF2EwGujYSj7KUx1OKJdWBJJvm12o6s+rCCcGbs?=
 =?us-ascii?Q?sXpm4UR/J50T2ubijfw7HHf5wJPnGNUkweszl7vgRMB7fgiSmqWaXMROytsv?=
 =?us-ascii?Q?E5+BvY9Ms2hAWUdtSIbx+8IlfLWpouwsDSoG6YAFD699/VlZRjb/JIm2Jo4c?=
 =?us-ascii?Q?MdG2fjNpDNS4Ns7DFG/ZaCLY2lwiDruoLGsMIpA/zTtqstuPZT0rfcb0tEj6?=
 =?us-ascii?Q?D7bjE6WSh07q8VnlfADgEfAGrGMuFv7NqYMIicJrNskBqSWhVsSdU1bHDtXI?=
 =?us-ascii?Q?p2fXvLFBrclwyGr78Mz1hP+2RI5Sndq30HZpZ+oUIJzkCHwv+OUC6pz639zD?=
 =?us-ascii?Q?bpqSDk/XUy9UhDZtZEbXGHssqpcTJdG9n+ckbx+1r+xK/TJjcwv4Bd6S1jsL?=
 =?us-ascii?Q?AJI8sti0uK1WXSv6kjbBd5lpv/RSjH11G2xF4LVh8t3ftpitMQdHcI09+0cR?=
 =?us-ascii?Q?OKh5xUYM84qBoz+nCVxRhGE3tZf+1eZ+FDNQejoGW4X6sCqonpZ1AlUul+rG?=
 =?us-ascii?Q?NmdP1U6ddByE91SP0Tjb1AjUK5cmcOaZU5i07e5UTEhQEaejB1hKUwHuRYCw?=
 =?us-ascii?Q?Wksk1w+MjNPuufDmCWCfrHkv9S/LS3LXICi9uVU1e8icx/BAKYhmI9vhFVBM?=
 =?us-ascii?Q?8zovLAKmhYIgqv1wqVrNHRFgCXGGb+4u0iZzKzANJDQ2znRc+BPDhNF15cU9?=
 =?us-ascii?Q?mPsPH5/ebpeWRXMmag0pk6xFBFk5OIYHXIBS2WkGN71sUP/ZLJXiDdgOYKQF?=
 =?us-ascii?Q?WF7RRnCFFJjanZK76A+SZ592QdFMdLhauJirqSXyvJEfXVJmfA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z6fu5q7wT3UbCT0yxTJxAiONrTVGuF5qz7U9gMVtZNFwwHppCWxKxmlxOPns?=
 =?us-ascii?Q?cR2rUh5x4yXuSHcDwdPGR4B6fU98PkE79RVRiEuuqpYARF5Xs6VsUvFKQgOU?=
 =?us-ascii?Q?0v0ICfQFz1Pu/IuhOWvXpkOi18UEo8XsCoE0WiE0S5PAklXy6Ax7O/48TSEF?=
 =?us-ascii?Q?JkrqPMwfsPtBnCLKc8YDFCxFiXJLh9JtSnhwMfRiiF9uvhQkDb1+3BSJ37xy?=
 =?us-ascii?Q?LwVk+n62u8s5qx83y80sQ6JeLyBaaoaamC3si5ZG1QpwK/51Tb1WMy3CUIrS?=
 =?us-ascii?Q?CVAgm79kQQk4nK8zW5xhKZD71anR6ebCfjs6gvmy6uk35swqBHoj8ZjgFK4S?=
 =?us-ascii?Q?3I/OBmPcaJ3Ba9HT+tS3zUIl6N9LpfJeMhSiI2QvYA5nDId5HX+0VWW+ft8U?=
 =?us-ascii?Q?Bqj9Zkz9p+Fj34SRwgfzR5nJQlTU0wSkUBtT/+qEe9jESt1boYqsjyqLuYiQ?=
 =?us-ascii?Q?klADSrV8Q6VXsZJqfoz2zoiFcFz08CrPF/viMTalxHILKKMe9WtFWw9bt1Yx?=
 =?us-ascii?Q?uOfi7LyCi5/vF7nePBjJBFXMcinW03maLIGarGIMQuyB9qGh15EnpVPk3xM2?=
 =?us-ascii?Q?xrefH7b7sV7xHNLsRrrauB9X34XXO/rFSaJYPDzLwUvE6bO3bs3YP8SQiCUN?=
 =?us-ascii?Q?Mz9xOdrOuHyZCcOdOh2wjA9nOwj48V8XrCHLD3hCEqQ+9gz3q6S0EgkqAlRv?=
 =?us-ascii?Q?dk38Sbi/ihRLU3REo3CgKXR5qofw5Iy8P4OYtRwU2CDEzY+JkWUEqcM7AHQz?=
 =?us-ascii?Q?77pvj9jJHG7AKvWEwdbeKQ1hRII+CssG0nKRn2KpdZ/wHHCPeMu4Oa56+St7?=
 =?us-ascii?Q?3DOK3UW1Mf1oXkbed4cML0JBissBBEgeaKHuZ7uc4MWkK3GREBxsLjE8ybwF?=
 =?us-ascii?Q?ehRTsGE2dN1Umy2eByjLrUXvidH4BEhJfDZ+0aHcNCwHsrRYfmfBrwK7mcAI?=
 =?us-ascii?Q?Qq2Oc2PkG0FT7vpD4W95sgmjELwqZzWB31vh8fybamS+Z46+vJreHAaogNdj?=
 =?us-ascii?Q?FqEvW0y11HwXMH/JmY5fs6Uzo8BaI6yQOc54sc4+xdi7wNxpQe95dMc5/hM5?=
 =?us-ascii?Q?XAF4c08Nc5v/o4SDJFnsXqNTIpmEs9zC5tQfBPb2L85XhB6Ne4nU4YsBXx1T?=
 =?us-ascii?Q?JmVQV4lK/Slc5nS4fUxXF1ykvK8qXx8IQGez/uzKy4CrFkoPfgFqE0eWqjF5?=
 =?us-ascii?Q?um+1Vljxat14s0ddjMqI1iYyG++LmY9V74srfj8CLI206u3mRdel1IBq1jA2?=
 =?us-ascii?Q?Mdsh8ccz6bhvWRMlZIQc5ZiHgHONFO1NxQXbYybwrUVvZ2c/mIVg1sGoclmy?=
 =?us-ascii?Q?BrJaESHfQOrR3bSeu63olr8nD/ANkqEetcP3eKTcg6EfN//+lvwvIhWiEGGz?=
 =?us-ascii?Q?Zs++VGeS7J3ez8AQEu2Ma8TQsVMhgVX5n88VO0ewpJ9bEfnN/lf7AhCY4V9q?=
 =?us-ascii?Q?3KUEDF8JRYADUN9J73dkFjg4z2W8xGA90Zelpi40ymHBNen35Af6YpPASOyA?=
 =?us-ascii?Q?7Rj/3F2EWA+A4wQ4jbirKwNI8IBnhZgGU0lCrc5bImllb7dZ1xloWuZd1Dds?=
 =?us-ascii?Q?rlYqUNFYj6RvnIORag+yEnvaClqn2dRRaLZDN8d3lKjUUfzX6T/ULe1JQvzA?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eda718a-197d-4714-094c-08ddb2a500dc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 22:26:31.1837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8klBY228ErXadx+0ESHD0kvfAms2/rCKtm3TtaVIxZArRT9w+Ob3NP4GUwukbeHOR7XZEs9P13fSEmRYAYvz8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4739
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

On Fri, Jun 13, 2025 at 06:25:58PM +0530, Himal Prasad Ghimiray wrote:
> If a VMA within the madvise input range already has the same memory
> attribute as the one requested by the user, skip PTE zapping for that
> VMA to avoid unnecessary invalidation.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c         |  1 +
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 57 ++++++++++++++++++------------
>  drivers/gpu/drm/xe/xe_vm_types.h   |  6 ++++
>  3 files changed, 42 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d9ce25f3abf4..56d6c286e3d3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1226,6 +1226,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>  
>  	vma->attr = *attr;
> +	vma->skip_invalidation = 0;

This kzalloc'd so not needed.

>  
>  	if (bo) {
>  		struct drm_gpuvm_bo *vm_bo;
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 5b96c8fc73a5..06e40ab0970e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -88,13 +88,18 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
>  	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_PREFERRED_LOC);
>  
>  	for (i = 0; i < num_vmas; i++) {
> -		vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
> -
> -		/* Till multi-device support is not added migration_policy
> -		 * is of no use and can be ignored.
> -		 */
> -		vmas[i]->attr.preferred_loc.migration_policy =
> +		if (vmas[i]->attr.preferred_loc.devmem_fd == op->preferred_mem_loc.devmem_fd &&
> +		    vmas[i]->attr.preferred_loc.migration_policy ==
> +		    op->preferred_mem_loc.migration_policy) {
> +			vmas[i]->skip_invalidation = 1;

In the else statement, you need to clear this so subsequent madvise
which change properties do issue invalidations. 

> +		} else {
> +			vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
> +			/* Till multi-device support is not added migration_policy
> +			 * is of no use and can be ignored.
> +			 */
> +			vmas[i]->attr.preferred_loc.migration_policy =
>  						op->preferred_mem_loc.migration_policy;
> +		}
>  	}
>  }
>  
> @@ -109,7 +114,10 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  	xe_assert(vm->xe, op->atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
>  
>  	for (i = 0; i < num_vmas; i++) {
> -		vmas[i]->attr.atomic_access = op->atomic.val;
> +		if (vmas[i]->attr.atomic_access == op->atomic.val)
> +			vmas[i]->skip_invalidation = 1;
> +		else
> +			vmas[i]->attr.atomic_access = op->atomic.val;
>  
>  		bo = xe_vma_bo(vmas[i]);
>  		if (!bo)
> @@ -134,9 +142,12 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>  
>  	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_PAT);
>  
> -	for (i = 0; i < num_vmas; i++)
> -		vmas[i]->attr.pat_index = op->pat_index.val;
> -
> +	for (i = 0; i < num_vmas; i++) {
> +		if (vmas[i]->attr.pat_index == op->pat_index.val)
> +			vmas[i]->skip_invalidation = 1;
> +		else
> +			vmas[i]->attr.pat_index = op->pat_index.val;
> +	}
>  }
>  
>  typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
> @@ -161,23 +172,25 @@ static void xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end, u
>  				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
>  		XE_WARN_ON(1);
>  
> -	*tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
> -
>  	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
>  		struct xe_vma *vma = gpuva_to_vma(gpuva);
>  
> -		if (xe_vma_is_cpu_addr_mirror(vma))
> +		if (vma->skip_invalidation)
>  			continue;
>  
> -		if (xe_vma_is_userptr(vma)) {
> -			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
> -							     DMA_RESV_USAGE_BOOKKEEP));
> -		}
> -
> -		for_each_tile(tile, vm->xe, id) {
> -			if (xe_pt_zap_ptes(tile, vma)) {
> -				*tile_mask |= BIT(id);
> -				vma->tile_invalidated |= BIT(id);
> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
> +			*tile_mask |= xe_svm_ranges_zap_ptes_in_range(vm,
> +								      xe_vma_start(vma),
> +								      xe_vma_end(vma));
> +		} else {
> +			if (xe_vma_is_userptr(vma))
> +				WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
> +								     DMA_RESV_USAGE_BOOKKEEP));
> +			for_each_tile(tile, vm->xe, id) {
> +				if (xe_pt_zap_ptes(tile, vma)) {
> +					*tile_mask |= BIT(id);
> +					vma->tile_invalidated |= BIT(id);
> +				}
>  			}
>  		}
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index c7156f8e2ed2..3b3019ecbfab 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -151,6 +151,12 @@ struct xe_vma {
>  	/** @tile_staged: bind is staged for this VMA */
>  	u8 tile_staged;
>  
> +	/**
> +	 * @skip_invalidation: Used in madvise to avoid invalidation
> +	 * if mem attributes doesn't change
> +	 */
> +	u32 skip_invalidation;

bool or I think you can safely stuff this into gpuva flags (e.g.,
DRM_GPUVA_USERBITS) as this only set / cleared / viewed by a single
thread and all other flags are set at init time or bind time (i.e., no
races). If you choose the latter, or regardless, we should probably
document the gpuva usage.

Matt

> +
>  	/**
>  	 * @ufence: The user fence that was provided with MAP.
>  	 * Needs to be signalled before UNMAP can be processed.
> -- 
> 2.34.1
> 
