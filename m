Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BC9C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 22:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3A110E51B;
	Thu,  2 Jul 2026 22:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OCoTSl0d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7737310E51B
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 22:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783032010; x=1814568010;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Pp2ZLmJJZN18t0Tl4c28TMX9LlbbDLPlOG1dfar3abg=;
 b=OCoTSl0dwRarpqAmsQ9hpvVQvKuvWs+0Vs76RexVCzX/jXBA9gk+UOaw
 C+jJ4KIuSBhU+nmhwm8GtjVm3/Q+vcuae29pRcDHSb4xWsC4JWmtmgkIv
 g/UVEk5GXvzYEkrEAoJ7ZsRWpuhOvnBp4QmKtrWydHwV6Vz8kEKwbe4GD
 cSijTMJvWhtszduGSgkfjr3t8xsH3rjEXhAfmpWzyvyIcwU2eoXCAVj+D
 YtxO5Vs/43DlhCZTnbR2GNb5mf2UXgGyTU+Mc+Hts4D4gUiG5IaTs4+ky
 6wNg2rs3+/O+bHdwozHJr6NlVD8yIMPnfoMHzKWLU3249V2bBSc+2gOc7 Q==;
X-CSE-ConnectionGUID: D58hJK/9Ra6JeCrO/AaLAg==
X-CSE-MsgGUID: PXwhn31OQ+ewhN8zgRS2Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="86333561"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="86333561"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 15:40:10 -0700
X-CSE-ConnectionGUID: uEwTyBuWQTy23XUSS8LZzQ==
X-CSE-MsgGUID: zgFYtmDwQYC9XKpDyy+1/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="251903777"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 15:40:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 15:40:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 2 Jul 2026 15:40:09 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 15:40:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LojphBBrtIwQDkVIlJlM2snk1qmNrIezHR4T0+r4Gz9ZI8EwnxXHDW3zDMeKD5GBK08/3Dg5MDiVV7JQ6oDRsA1bt8YVH7LqKs8fTZqh1fDikFJdBFMG3dVCTZH9+31DTUSRD/Zo4szgUWEGw9IVbD3UrHItenU6PLhi5TOa1hyknjZ9TIn++ALSAI6dI1Agc2GbmKvr6opNi1w0/ZrflUhXiStp7/g8ebpLufmpDRF7416hfL+p53kUzemjleDA5ZTRpzGYS6Lq7IL1jtNjN2yGqWRYPkOP6k6yZ30N0Z5lx6eqW/EvimfWAb1X3pFkWk9jUSYe0l2fDCb2ovNPBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HycE48a2aGXkzlESu7Oc5islAPnyvOaX1Y43rANml0A=;
 b=KWcPQIsxbHj1e0kQgE2t9ZBLwJzsB/voA3c+pkgBXAPx0S+s0C4ssgpj/TzREjmQSwEmXoX+bKoz9EoQVFlv4qLBt5oV8P1jewVnjnoiFQ/pdMAaNIGgQ1QViadk3NueV1HgyjZET0TN0vhOF8tD1EFFUv1WZFbEkWeIAn8mADjHDCs+W+D7vsihItH6SFovsfmMWADv2vl36JxdkU/EA3IjuNV9JxDiGIikeD/U7y0SViTE9EJIjTUFSpOMoLB+ES2BvjNEh2K/wDpUT9ofpg76RvkuUytMiPtlmMu3fdIp9GPkAdN72zCsdvwz7oQ9KVnlTCk0eXDpyyvsO+WbTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6547.namprd11.prod.outlook.com (2603:10b6:510:211::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 22:40:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0159.018; Thu, 2 Jul 2026
 22:40:05 +0000
Date: Thu, 2 Jul 2026 15:40:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/vm: Drop ASID after TLB invalidation
Message-ID: <akbowxjC+q9/Lx7l@gsse-cloud1.jf.intel.com>
References: <20260702013147.2446299-1-zongyao.bai@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260702013147.2446299-1-zongyao.bai@intel.com>
X-ClientProxiedBy: MW4PR04CA0311.namprd04.prod.outlook.com
 (2603:10b6:303:82::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 35bda911-5669-41b1-58bb-08ded88adc9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: ZMOwF/rPKes/ZX55T566bisaLy5cAtuUg+Q4sC1dooH7ZMJ4f0iczrhhp3wOgnpzsFN6o+4QDW/FWG263knvNRCZtH+o19iVHUOe//lSxm0VjEJ2MoNxrCy9C9NFDRRXqbo0zE6fSRgPoRhWd99gx9ycobOTHnpUQKakG0OdaUtCgy1/he0QGXtmjEbdfwVH+CZeuP5V9YOhMTdoaawvUl5uPpytLMO1WM+5ybxoNJwJ9zqiWzKDBDhAaibV81h1s/Zk4gUyN6oNyzcPh3DEHRKWqFdmRj1QihrzuviJnkrLs5B1ASAFdJimFLH815CrtPhjkBFWpnctIPnTtfIvZhdFtXKVgvm+g8DIhKM85KUHl00V1q7nKUpLIKoEaWFsgU7LSFgaz+1/opnG57ZvX8mR3AxP3d6sShIpRSBX9A4WhtNvSeQQOQmpJrhUfH62oZFhsVxnawvFue11q7G3PIDdBDMd5oP+kthIc4vU36kai7YPzfL8dryaZSfCdHLI231vM2FSGMFlqoeC4hVM7W1GwGpfjyiIHDuiKKIp0dwHnsEMhcz/R3WXOERM5bVbNDTDPa+GaLEKYI716tWOtghv4q9LX7tMr+Qd+2yEjp8myfdVXPYA4kzEdeZlPEESJDT+qeMtJXkVwNadn5fsiwEQXdgYrolTKPH/aIM9/jU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(11063799006)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YMsj0DJLm6wN8l6+mtHj6jTZ168H9QRobUtAqLIZWwq1RBqBXJHVR0g1IbHf?=
 =?us-ascii?Q?HaTfVPrxzx6URsosfzlPMAIYJbuYDc24HrK2ofDPPEcWHOcROKpzkr+0ibS2?=
 =?us-ascii?Q?rVY6wRf4opIuj8ROViXBtML7KObARwprBwhJEyhg7YglbL8Aytr+8//4S+/S?=
 =?us-ascii?Q?ffOkZM+QCG7bGxyULUXKbqOivdPsluOJ6dFHf4WbyCWugJGmxflHSSdEZY/U?=
 =?us-ascii?Q?chbv1dQsrIF5xl5MKeBHmLcwSPAoZrWsudbH9Fh1shZk8PxHPMpTrzenNQAU?=
 =?us-ascii?Q?0qHWe61NHHJsMptwm5bIOK7Ls3PbaqK5EGng1eA3nYZHUYWndwsZCsSs8Olt?=
 =?us-ascii?Q?f5UjQalQp7zgUZWOtieVw7b9Tu3LiTd/mKrtBj+K+P0+PLL8OhGUsHr6OInA?=
 =?us-ascii?Q?Idce+PXlibC+whENOXWSFolb89Jlx9TsYYULphX8CqDLECUqdF6T7STGZnmO?=
 =?us-ascii?Q?cYnHDsRt0BaUg+CIaQY9ybAnMoFJoCtZ3dX0wTUDDSDlA/i+ZAiLQunfNMNC?=
 =?us-ascii?Q?MRub+GQHhYaeBbbBjqalnefqU/k7BMk+q/q35iusFq+2O4El0So7o8VDbcL9?=
 =?us-ascii?Q?PIjBftj1KSlUpO4vPwDmRVTNWgJZgQmS+7z9OlPLP+x6Y1SY3YUCZGja3a7c?=
 =?us-ascii?Q?jZo4vNJZPQuxy1Q3AFoaxgJEdX30eCz/RRbuLG38MUoa7QwRIo99zUrPnq06?=
 =?us-ascii?Q?BrVwYsPt7lT2J0eIPlEah3DMPOKv7S7UbT2d8El1qIelALuTPaTHmgjmrvss?=
 =?us-ascii?Q?Zost/d//1YvY0iRfylHjvruS6I/5fkU3ekrzlvD84EWL83JDLUBaNenTwufR?=
 =?us-ascii?Q?8kfKtZP3D+THvHoZas3MRAMBE+4MAy9NTsdTjcuR++ZXV7mK4T51s6mlqkP1?=
 =?us-ascii?Q?yaiBQlLfjtUgJpG4ShcCLOgo61yhDA9xHmUg/7h1pEwNWyBt6pvtaHi7t8pz?=
 =?us-ascii?Q?hgV9k+wIgsKrMbRfS1Gp9G7eBaT2Rx/xDTgD7Em1BySN8T2Bgs8xiNgWUIde?=
 =?us-ascii?Q?AKazdE+r3841aiuLepH3jpvrxTRHo4t/92nS0GIf7yXzp6ByyQAgIN7P1VOI?=
 =?us-ascii?Q?WCvuwnHjDQbOHMrlz3j/wrgkPN5NHLOHeszK+W5Z5GYMJKJg8mshF/MNL0vt?=
 =?us-ascii?Q?w67S4DU469WDEn4A5sPYWQqwC3ARVcDf9INV8Nb4N0aEv6prfjvCzdpHJMj8?=
 =?us-ascii?Q?zPHLsYLymhNpm8V0dbDv/iKDxl3mS6Vcp8HMDxTVrIjZ2ZUqXuL6FoYnatnY?=
 =?us-ascii?Q?Cx2sCNCXfMueSzQXRzj+fZ6vmYJaWeFZ1Xhg6cQSkwNr5gJtIJ/b8CUX7tqb?=
 =?us-ascii?Q?13cHcgwhGpyjgD01IpbYD8bettWoclpNR7jqN5My6nBeDP/kCnEKAoAAmy4v?=
 =?us-ascii?Q?qvVakir02qgfPyPxvtbjuJ/O7liVh6yRgORexmprTd4Um99aEKJcdlLMJtlc?=
 =?us-ascii?Q?ndGpoxNsvQtS01xTs2V2vfHHSpcW9k5IUQpHwEdVmO75qJ2rZraCuIAHfzwH?=
 =?us-ascii?Q?SlClNrd1XK2/lxWo8RLhe+NybTEreE+hLL6Ka4RGN2hSdENwZXuQTKbNYRcV?=
 =?us-ascii?Q?j2Z4e2UusFpxNnME4jjaCz+kxdO3PCWrF/PZkKInbCtkN2/hWUi+V0RCpZN3?=
 =?us-ascii?Q?B2+Pos8o06bcNtOdEUu3zhEUE/I/FasumcHm5+Je8eXppKuTereLRLPwRGF7?=
 =?us-ascii?Q?fh6ziei3E39hBId4zAGfGWWdutLQhxF9frBvn+4pKm1vy6pjbFOSFgd8C3rx?=
 =?us-ascii?Q?QS152C0p9w=3D=3D?=
X-Exchange-RoutingPolicyChecked: YXzPn67GddmVi6RJUICxe58dxQxp97RiATAx0uuSVvE0rXr89s1ilGslBAYC/YfkoAu781JKsNYhhuYbzQztVfBPVkqhJfn5LRaWIQ9x6JE5lKIlUAxnymn8SEukYfEPHOQo8+O+U9skralg/XgkxA/JLeoquEZJTRCNToekUjO2A68PYxZ74hFhD7vtLW4UrvHJNA3Yyfan6+uH2tJj+PoPnKH3vBAh9LxEgnYmjdkm++ZcITwWbvrz+JVAhYVsxaDediBcEWg6MhhOTIyDyBvYLke0pAcMcVf0imo47EjRZDjS6RldOQmOXNIvpK55loOcwkT9SlpsVVvdJBBJVA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 35bda911-5669-41b1-58bb-08ded88adc9c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 22:40:05.2794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIhMQ/VvU4iMf08G+DdigkSfgAUUuC2q8bgkVX/v9nokUX/NFV7g364KqrJIxtB+o1vIU7qxrNQTfkp2X1j0bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6547
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

On Thu, Jul 02, 2026 at 01:31:47AM +0000, Zongyao Bai wrote:
> xe_vm_close() clears vm->size before flushing the VM TLBs, while the
> ASID remains in asid_to_vm until final teardown. A late GPU page fault
> can still resolve the closed VM, fail in handle_pagefault_start(), and
> send an unsuccessful response while invalidation is pending, which may
> trigger IOMMU CAT and engine reset.
> 
> Erase the ASID after xe_tlb_inval_vm() returns, so subsequent GPU
> faults for this ASID cannot resolve the closing VM. xe_tlb_inval_vm()
> waits for invalidation completion before returning.
> 

I don't think explaination makes sense. In xe_pagefault_service we
return -EINVAL if ASID lookup fails or -ENOENT if VM is closed. In
either case we ack the fault. 

> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 17 ++++++++++++++++-
>  drivers/gpu/drm/xe/xe_vm_types.h |  5 +++++
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 080c2fff0e95..42d5a9de2452 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1864,6 +1864,21 @@ static void xe_vm_close(struct xe_vm *vm)
>  		xe_svm_notifier_unlock(vm);
>  	up_write(&vm->lock);
>  
> +	/*
> +	 * Drop the ASID lookup after TLB invalidation, when no further GPU faults
> +	 * are expected for this ASID.
> +	 */
> +	if (bound && xe->info.has_asid && vm->usm.asid &&
> +	    !(vm->flags & XE_VM_FLAG_MIGRATION)) {
> +		void *lookup;
> +
> +		down_write(&xe->usm.lock);
> +		lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
> +		if (!drm_WARN_ON(&xe->drm, lookup != vm))
> +			vm->usm.asid_removed_from_lookup = true;
> +		up_write(&xe->usm.lock);
> +	}
> +
>  	if (bound)
>  		drm_dev_exit(idx);
>  }
> @@ -1960,7 +1975,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	up_write(&vm->lock);
>  
>  	down_write(&xe->usm.lock);
> -	if (vm->usm.asid) {
> +	if (vm->usm.asid && !vm->usm.asid_removed_from_lookup) {
>  		void *lookup;
>  
>  		xe_assert(xe, xe->info.has_asid);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 635ed29b9a69..0d451ac0e73b 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -355,6 +355,11 @@ struct xe_vm {
>  		 * get a flood of faults to the same VMA
>  		 */
>  		struct xe_vma *last_fault_vma;
> +		/**
> +		 * @asid_removed_from_lookup: Set once the ASID has already
> +		 * been removed from asid_to_vm early in xe_vm_close().
> +		 */
> +		bool asid_removed_from_lookup;

No state machine variables here - if this is need just rework the flow
in xe_vm_close_and_put to do everything in the right order.

Matt

>  	} usm;
>  
>  	/** @error_capture: allow to track errors */
> -- 
> 2.43.0
> 
