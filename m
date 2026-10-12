Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D45CA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 13:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EE210E587;
	Mon, 12 Oct 2026 13:45:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D5910E587
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 13:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791812714; x=1823348714;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oI02+O/hHFCbCOUcj0AZGgIT3XVwY+8CtYJ0w4akAug=;
 b=LpQYXHZnRhODeWHKNB25UDfFZXYh3AY0arscS51USg9l5G7Uu9RzFqaV
 FOcP6ioPRIacPyISryf0+KQOLv9eZCFGst3aZMsajqFLDUow0gV2N64Es
 xkxfCuD4lqcKu41rXtn0nRsszIu1SP8Q9DWTXT+71QZ5cBBGYCv2yAxQY
 buCNFcg07/BD5jNUMkHLt9MpB3FJtPhVmkcwW87AFFWsmAm3IfsWouyID
 TImcWU9LQzhxy3ynHjyVCv4328WL1cmmLdfpknJXAWSkLG6RtCVAfUCFX
 hGhIj8wENPHzt5DePn291vxUDd9Sr6apkwhMtypMIDsq79PvI2cj9UwoA g==;
X-CSE-ConnectionGUID: QX1I8d/dT8+N3s7nYAWrhw==
X-CSE-MsgGUID: gEuH5LloR06iHgfXQhANCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="525508"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="525508"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 06:45:13 -0700
X-CSE-ConnectionGUID: 0KOg3NNAQjyU80V9Je5rOg==
X-CSE-MsgGUID: gi9M3dJUSJerBg84cFFs3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="828294"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 06:45:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 06:45:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 06:45:12 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 06:45:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDrrUYYaJsAGsVdJHcDISUht4bIQhH2W+z2gKXY1tjUU+VGiSml51BMdIgGsdIipP5ebaLyDZOY+TLJxUyQbT1pdedjf3bMo+Zup/uuplHqvLxNNWlt0pcVU27QqI4xwNVDt4LdQJiUDxel/3kGicHw4wJOrgEDNinDfTDc+RqpFbsxSncs8jnt9ZakvLAQ82WLXU0EpIr2pw00PLVmsXisBYlz81zqJgVI2/n7SuWk8UoCuLe1fYCc24LGqorqYY9tVcbQZ9fskbqraNQJXCAfVB2JXVXplPF0AMOqdmLxD98vt5Nc5ydNfYsl1aQcmufIS+cPFkpvui3cOGi6zJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzw/AgrekdBQQXquauLDSWF/yYKcy26GMakyiIDEIhA=;
 b=J7uPpJQp5+ZzngzWZgeE22FRGN1Yek/yZA85pAKYlNVBa87QC2S3JsLOb7MtAUygCB7Bg6+u7YaKZpOvA85pB+/EZff9kPjCgftAqUSUS5HFUR2xHPn9inla0qLLoziKkUj3TIRrvI5XfuQ3bWp/NlLdECHjvon9mkZZahGZoWeNJNXTRf7taPc68qyNzXcw31IB6Kq4HTP3AbW0nhlDC+NI20CPLq+Dh1wMH6eX+XNuqwgKlGrAJX8WLktycSxKtROI1OrNbun4bTSJMQsNCODVr+XnxsTrxqD5/eZSdJ96VTU2fG4K91VoBIBmZ1UQeUhS7HDpLUznYdcvK95n4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11)
 by PH9PR11MB985771.namprd11.prod.outlook.com (2603:10b6:510:427::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 13:45:10 +0000
Received: from PH0PR11MB4792.namprd11.prod.outlook.com
 ([fe80::fec9:8db4:c768:8289]) by PH0PR11MB4792.namprd11.prod.outlook.com
 ([fe80::fec9:8db4:c768:8289%6]) with mapi id 15.21.0472.016; Mon, 12 Oct 2026
 13:45:10 +0000
Date: Mon, 12 Oct 2026 06:45:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Bump LRU for external objects on exec and rebind
Message-ID: <aszkZLFG57cmurw3@gsse-cloud1.jf.intel.com>
References: <20261012132607.21387-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261012132607.21387-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ2PR07CA0004.namprd07.prod.outlook.com
 (2603:10b6:a03:505::10) To PH0PR11MB4792.namprd11.prod.outlook.com
 (2603:10b6:510:32::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4792:EE_|PH9PR11MB985771:EE_
X-MS-Office365-Filtering-Correlation-Id: f60b463c-f695-4dad-7959-08df286708b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kFx4vXpYRrcCjs78gUvxAWFnFxJau9392Nn6bO1QM0Op8qD40GeN2Eq231WGioCxUSKuYGESZH886v0AkZeqtRb9fwu/GXRllOPbCBgktCZJ966v5I5EQYuwSa50sfuDsqBFb6uuVI+5IL3RoJoxQzoYQ9BSlR5911xkylBgDnj+rDdNL85KwMHHI00ybJa44q5IVxA3X635/287ckJE0x396ECR9B4Y7v421YuMHC8k4io7lXCWDXLtOnYMHnWt/r8Q+ruqXFOPQhH8Wbr5diz3erFkyiUc8qTt0aske0tlwyUvzEdJD+cn0pBFedEL7ReALDu3rj4ZvF+g2MphHIcQ9IlydoTacZ2cJiixSh6dwLZ1u92CSZN8eaRPiZDspkEBfl6hlRNyEZEjKXHDy6cOrKIHBrKs6K1nTH193VXsogPpahfj3wmkVjmfuYEp/XdelR5Dml8Y+u6QAxtbl4BdBIruZCTBs1uW8UmaVY5cvXXt3E4a0ZqNkdcGYFvFQ1fwuRJpkDBBZ+mVVTjybuYUufNVyoYCF/E/qjjUd1iQKUFlBiAS0IoN4sGYHY0uBeDJA/FYcMvpbT2zsfpvJ0MfF/F3VdvgiKk6sJ6MiJph6eY6tqwtUdzYeCxlj6kpvb5h6QTyHsEHdbK7kUnodhKO3QNfdwC4hjAk+WHi0E8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FHe6CPG46/AEL+gHWEerl7XsUNDWIKJnPawTvV9zpE8IjouSdncHaZEmkg?=
 =?iso-8859-1?Q?xSAtwTyhDxGdQnfUEmdMoldO0MmCJ32LWCDoiWG4WQ0hBb7BJPp0Y9bfkM?=
 =?iso-8859-1?Q?4f6UJc3bNTGMjAvrQtoZvF0BaVcpPlgavueRcKvJnb+QkEZs5cWrgBPZ6M?=
 =?iso-8859-1?Q?KPYYm+5KVaMoofzW9qfas1M8qOoR3vDxBm8yi+tZufBgif7OBU0XZ1SYTh?=
 =?iso-8859-1?Q?dq1G77d+uL8CDMyCwchpGSsy+zCxiteJDfZNe7SmMpxdZQ/Xq+rQR9U81S?=
 =?iso-8859-1?Q?j1OmdTDK6Aj70hDs+hseax1dZuM+N6/BM9GZw8HQoNOMkruYGtTS//vzVK?=
 =?iso-8859-1?Q?TUEH1PJuh32Lc60YQUnQRdJ9OFcww1GQvrTGf8AczlMX8vGCXdnAYxzR/j?=
 =?iso-8859-1?Q?dy4EBLPT10ClT/lUK7vQNulGhfiNm12gM/0gmwP+Xy3qixBizWcGHYc79f?=
 =?iso-8859-1?Q?zeJ0FxAWdHVviC1QZIxE39OkdcY5OKmL9CN9QfUFe4I9gChrv0TrGkpNoe?=
 =?iso-8859-1?Q?sbE9UJxCVLJTkKNlmA/KqvXPh5bx7Tzw7CYQNFznYjSExGQtMmkGUjv/q7?=
 =?iso-8859-1?Q?iUY986xQe4+l9/PzA7JKjvtIMLL+fUa5FciA8ByDzsnC87sRbOcVwHcZ1G?=
 =?iso-8859-1?Q?1PFc5FGc9D3cllmGdcwNRi7jf/gmhWS4YhbGQSF0UjtBBzDCdSxJ9omxIp?=
 =?iso-8859-1?Q?qFeiUfyaQP4aT0/4kFqbodwgJOEd7eaNMVDoklpS34aANVKgIBjvuQU7tl?=
 =?iso-8859-1?Q?8sZ+MYkaYZzmLZe6ougKhIE/Z1d5TmSxnmd2RoIv/OCuozm5u6R2GnrsGC?=
 =?iso-8859-1?Q?t9Q3bXjznXGrdPbxcrOVxDYKcu5MT6NqEgPVWbv3PiOg30M0GLn8W3wzIV?=
 =?iso-8859-1?Q?LniUnuXW3ZF1FT8qEoW85HYJY+F/Tc5SAgZRU0ZZyKDMnY6RUWs6g/fxcq?=
 =?iso-8859-1?Q?/O2wAf4znKuhJ2NVX3tt4ZKZ8gMZeWDNN6Ow/6RMdwGzarmX68aHvS+5G+?=
 =?iso-8859-1?Q?nJKnW30pbKwHOvfGfBW6mwvaznCR/96mkoptEoC3Kec60/c6H3YkMZCaaQ?=
 =?iso-8859-1?Q?4ZsZsaEXfAfYwILXd3fiA5w8atGU34bX/YJfDhvqmNbpN9uXOejXac2yXv?=
 =?iso-8859-1?Q?XEACFbu89WfJ9VYQmF0gS0G42uYMX+d2S4LgsjQJUNTMOIOopkXlyK6z4G?=
 =?iso-8859-1?Q?qLiuiveC4RAeNxLvyw33WuyGsZB327a8MHDhrjXJVglGyrygUJGJZo4F6C?=
 =?iso-8859-1?Q?DPjZVvYMOhPYcrSb8UM9t6G0rvWf6+O+LsQuPyUnldjvXI87goTd5duBkF?=
 =?iso-8859-1?Q?c6Ws0U97kkGzfDkS3OzDEsWrmlbN01BS5VKWkVs9Eho3MFcci3HP7Hlv6A?=
 =?iso-8859-1?Q?+PqPVYI6uvqF4jgeDoXDczIwQsdR7oLpB7s+VLq8voyN9Nqt3Su/AHxdZa?=
 =?iso-8859-1?Q?ErqxBTs7rea51H1vtCO3xNRIHwHa0X9jd3wn9oNggh5a5enmpmoY7dJ0IH?=
 =?iso-8859-1?Q?CpTT+QQKVcPmFxzfYhcck12aqYOnLiUfU7pl9l4vcQgW00WhIfS2L3ib23?=
 =?iso-8859-1?Q?xvx/bhFVPZhF0pcxrFr2ajHppv3wOBY+K6Xx/MKTH37MXDepDQvT15PzGO?=
 =?iso-8859-1?Q?0YTDVg4YNVvX9DZAnaEZQC7ApPGY2gL8vEh+jQbMp5I12nQbjONNkoBCL/?=
 =?iso-8859-1?Q?rP+f/Z6cyNOgmuTaAIB4P6rEvMDA/PF2WL91THYSHpbhDWGR0WsYEv6o6/?=
 =?iso-8859-1?Q?1nxrZU+1dgTpB3esyVyRH3tIi/E2AeQdjDSaWPuwZEib/27p2lRtEBzmCd?=
 =?iso-8859-1?Q?6KQOocwlBg=3D=3D?=
X-Exchange-RoutingPolicyChecked: lK64Ed029GPpo2gkEY1FWU9ZFFyAM3IkWOw0XXYbT2yD+i0ZmH2+/5sReKJUGbl5i4G15XQRFgY+E194yddl1W/FYZr1I3sg7I5QuMAOdHoKwJCPPL2URHGGYWxh4CACvTIhyma/2SSkUpaAYBhbVKRQB3hBmcnb1zMSSzVy5lwMQUfMO7osMGlIgZm5+lfQRgtq3Z8f1HD511r1LHUgaUuAblzt8lRQB5s1TXtQuMWBgtbCpysvZYJY6FAzVplm9fnGFetFFq26nkgNI9Ez/mHrLCcPf4B2REEdkbVFiVo1kdC9Qakn5fpZzE53VXvE80rxqJOwI8d5N1LJE4QoPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f60b463c-f695-4dad-7959-08df286708b2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:45:10.3953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1g2C1sVGIu8ZUN7VTKplKWkrG+kjLj13y+3djeMzaMQfQ3Y5eImmOVy7AhAhPbF/3ePcGavsXw5xCwuL54SNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB985771
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

On Mon, Oct 12, 2026 at 03:26:07PM +0200, Thomas Hellström wrote:

Yikes, not sure how we missed this one and this is certainly not the
intent and will be large issue for compositor buffers.

I'd honestly lean towards this being a fixes.  

> The VM's private BOs get their LRU position refreshed in bulk via
> ttm_lru_bulk_move_tail() on vm->lru_bulk_move, both after a successful
> non-LR exec and after the LR preempt-fence rebind worker runs. External
> objects (BOs potentially shared across VMs) are never added to that
> per-VM bulk move list, so their LRU position is never refreshed by
> either path. This makes external objects in active use look more
> evictable than they are.
> 
> Add xe_vm_bump_lru(), which, under a single lru_lock critical section,
> performs the bulk move of the VM's private BOs and bumps each external
> object locked by the drm_exec transaction. Use it from both the non-LR
> exec path and the LR rebind worker, replacing the open-coded bulk move.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Consider the above:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Assisted-by: LLM
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c |  7 ++-----
>  drivers/gpu/drm/xe/xe_vm.c   | 31 ++++++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_vm.h   |  2 ++
>  3 files changed, 32 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index d5293bc33a67..7dc9a0a1f569 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -346,11 +346,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	xe_sched_job_push(job);
>  	xe_vm_reactivate_rebind(vm);
>  
> -	if (!err && !xe_vm_in_lr_mode(vm)) {
> -		spin_lock(&xe->ttm.lru_lock);
> -		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> -		spin_unlock(&xe->ttm.lru_lock);
> -	}
> +	if (!err && !xe_vm_in_lr_mode(vm))
> +		xe_vm_bump_lru(vm, exec);
>  
>  	if (mode == EXEC_MODE_LR)
>  		xe_hw_engine_group_resume_faulting_lr_jobs(group);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ef369df4aa26..095f762bbb6f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -413,6 +413,33 @@ int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
>  	return 0;
>  }
>  
> +/**
> + * xe_vm_bump_lru() - Bump the LRU position of BOs used by a submission
> + * @vm: The vm for which we are bumping LRUs.
> + * @exec: The struct drm_exec with the locked GEM objects.
> + *
> + * Move the VM's private BOs, and all external objects locked by @exec,
> + * to the LRU tail. Private BOs are moved in bulk using @vm's
> + * &xe_vm.lru_bulk_move. External objects, which may be shared with other
> + * VMs, are not part of that bulk move and are bumped individually.
> + */
> +void xe_vm_bump_lru(struct xe_vm *vm, struct drm_exec *exec)
> +{
> +	spinlock_t *lru_lock = &vm->xe->ttm.lru_lock;
> +	struct drm_gem_object *obj;
> +
> +	spin_lock(lru_lock);
> +	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> +	drm_exec_for_each_locked_object(exec, obj) {
> +		if (!drm_gpuvm_is_extobj(&vm->gpuvm, obj))
> +			continue;
> +
> +		ttm_bo_move_to_lru_tail(&gem_to_xe_bo(obj)->ttm);
> +		cond_resched_lock(lru_lock);
> +	}
> +	spin_unlock(lru_lock);
> +}
> +
>  static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
>  				 bool *done)
>  {
> @@ -563,9 +590,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  
>  #undef retry_required
>  
> -	spin_lock(&vm->xe->ttm.lru_lock);
> -	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> -	spin_unlock(&vm->xe->ttm.lru_lock);
> +	xe_vm_bump_lru(vm, &exec);
>  
>  	/* Point of no return. */
>  	arm_preempt_fences(vm, &preempt_fences);
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 89c4f95984a2..06138c3c4315 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -284,6 +284,8 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
>  int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
>  			  unsigned int num_fences);
>  
> +void xe_vm_bump_lru(struct xe_vm *vm, struct drm_exec *exec);
> +
>  struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
>  				       struct xe_exec_queue *q, u64 addr,
>  				       enum xe_cache_level cache_lvl);
> -- 
> 2.56.0
> 
