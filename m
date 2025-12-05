Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777D6D37497
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 20:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3048A10E27E;
	Fri,  5 Dec 2025 20:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgwM4ked";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E691610E27E
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 20:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764967018; x=1796503018;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wMBa+PFjxxnGB73r7e/zoXzlbgMWCfe7ZN4FefHnO3E=;
 b=fgwM4kedYrmLDC+KGIZD2R4BXEtUd+FlAvMiXtrXDk5WkXABwp68PcrE
 evgfbcj8/oPIkNTAI5LCu5LOV0avKIrsFsKw114I3d94jw5F6j8/kVZDj
 M0Nfz/qI5onbQK9BLZ9usMsJx7NbkwxbzA3anZJOh8TWZ5uVF831YKTsD
 69/770FAjPQZQbwPilvo8SFMGGm10for55j4Z/9fGzk5VlhHtBKG9ALCM
 bfh7dIcnCQW0DSF8FEog5qORFUjegn0WnT6lc+YeLWFuZ76AqkKMI32TR
 Tn0oZyrLD0lvWaQ7H04lSRGcQdkN/cCzQH2LgjgJytlYmk1r5nm92D/Rb Q==;
X-CSE-ConnectionGUID: +Zg9IjLFTLqt4wVSmhGQmQ==
X-CSE-MsgGUID: FPnTsS31T6qZPqrxnS46nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="77329265"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="77329265"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 12:36:58 -0800
X-CSE-ConnectionGUID: 5C4cFqmYQLiGCSZl7qIzmQ==
X-CSE-MsgGUID: heLbCXPGS3CxwZzPR5zxXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195301508"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 12:36:57 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 12:36:56 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 12:36:56 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 12:36:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5keK1Ggbj3byywBmFd2oeFNm96Mxz8YVcU6MZoJjPkaj/q9Ao0i38VXrCV4Ta4ClsvULTM0mv++B3D/ljW9E9gATuOe69Catijp8sl1jzrCkEOMhvbkW2XaqfuiChTR+AAJXieC2N+d5VgqUJUS33DwjC8dbvGHi0eFQ8LhetROE3J1P0fN5dPFdWQAqEiWW+gjoanMKQuOwQh6+nWjoIWaF01GXCjkSWNFz6OSGvVt3aGzRNzlEDk1xi2iY0d9GydHx2HQdqDqb2fOlCrjq+7f0HH4lFvxWZ+X0iQWLM02zg/FJrGCYMfZ/SpJbouMk6dEYAePh86Bb6WlllxGUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XU9CabGWJhhrJR8/D1vcCvS5e/TkLr0/km4kmofgfYA=;
 b=HuruMJzmgBZtEZR/ettQIDqaV6ikfNxLGuwIFCYuZZVqUfFA1+nx8+frD8D8qAzR8WP2BARqZB6TrNGOCQ4yZvqmPNGBjjKqpXTiCi2keWxTaIo5zRIHygTi/PXAvlrKjB7+6gs0SOwXkCGxPqdBtQsqV4Ls+WAaEgcTEsFhCZOhX/O8djmwBx2SabTIgqJXn1MIE2Y4HI4Zuu7M/WCs8/2NRkRmG/zmiCP26e+sD1KxrBp/AqVf9i0EGiAnQCsyw1N4Crw3C+Vn5PeV1/Gknk5vAjqg839LQdL2f8eIMJt+sbuQa1h7o1Kqwk2pvcxqqzlx35zi/h3nNEqS1UnFNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8476.namprd11.prod.outlook.com (2603:10b6:806:3af::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 20:36:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 20:36:54 +0000
Date: Fri, 5 Dec 2025 12:36:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jan Maslak <jan.maslak@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <maciej.patelczyk@intel.com>,
 <joonas.lahtinen@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Restore engine registers before restarting
 schedulers after GT reset
Message-ID: <aTNCY3LFsqgy9My5@lstrano-desk.jf.intel.com>
References: <20251205045529.3801762-1-jan.maslak@intel.com>
 <20251205045529.3801762-2-jan.maslak@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251205045529.3801762-2-jan.maslak@intel.com>
X-ClientProxiedBy: MW4PR04CA0078.namprd04.prod.outlook.com
 (2603:10b6:303:6b::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e2c2c0f-5dc0-45f3-4a49-08de343e06bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lUXDNFoRJnB8dbmIT8MoT9ZLIQakD+r66+oPFYHDKSktQpjU43SdaOp3ZzW9?=
 =?us-ascii?Q?X9zza0WvGCRVgyJXlJBewe31DEmDw8R4C7rPu0hz8CCejtZm765A8ofe82Zd?=
 =?us-ascii?Q?9B4h5C8FtilabqeVPjXr5mAB2q4aMAS8eUWaONFpTRZ5StJzdDcyWJduxHbH?=
 =?us-ascii?Q?ACsjCR+L5qykUxXe/FZLOQTuwcsRPODZO9MBIanaARIXU14SROsP4fYL2Z5D?=
 =?us-ascii?Q?NkVVviUXU6Xt67m9TRVPp3fIKDtirD3AktqouYP3DCLasUYrUm4fXkkSBSFT?=
 =?us-ascii?Q?RrbEF94C+pqiZNtx7sKfWOtyAOPWhGQ7tQ7sO4MtzvS6Did34YOllJpRVeRx?=
 =?us-ascii?Q?XRYEfhJac6Nta280xhpPAiYLqSuhF1SjndSYdYVb5eHj+yzro9quFjqLszyd?=
 =?us-ascii?Q?PKInT+Hzak6cFGgihH5e7DOc3I4XpUO5u/BrizzLa3LQFxpFnyJtrm1PS/3P?=
 =?us-ascii?Q?ALdFK7pdmlV4ttqC2xvepZumwIx+PdX6JOXd9sg0PhK8i5oqjjSeqd+GAnC0?=
 =?us-ascii?Q?aKimc57HMZCae+7rNeZYwGAM7twZQJGk8yZ0L6WhmE0wLPv5wP3XlIbezD9h?=
 =?us-ascii?Q?ZTp3orkCnJ4niIQMhwxt0qjlblPYfM+Cf2clWgAIilXcAArHOG0V39ptmQPf?=
 =?us-ascii?Q?y4UGKlfqKKfprxVA2NxTtJVygFTZAqRR9r212hokrZkgsoZ2t80clHUaea5A?=
 =?us-ascii?Q?fTkQbIH97ee2uZ5/e0FRVoWS0TpxNCW1JuV+mzXTMyaa2RN/H4DEr/VJ8hFt?=
 =?us-ascii?Q?t2+mcpPxzDbGg4sMwnkQuP4jRZViWD0yaFbsUw+m9GJYsdo9Ay/D0wVRxCkL?=
 =?us-ascii?Q?Cf3y13gRP08s+liHMo6iGW+OQjTIt+OV6KRNdQ3wgEdGbT9ydjMZ+C24j6ex?=
 =?us-ascii?Q?TOlnF1MuixRamMw463tdeN2yxCuEAcpd7hbOu6l3cy/FFpp4lPSYFvEJYQzz?=
 =?us-ascii?Q?rlbxkl64qScdifm/qJZ7Np0ot7pPPBi3yfQ+0UsxC9dLNS7wNMXCYDhp6kPw?=
 =?us-ascii?Q?8DAIlFQsM2Wz9r8+Y3gTIgOSuO54QG0loziXWY6CNevR8Yc2f8pdXJtDgBba?=
 =?us-ascii?Q?3lTRY+Ia6Vtaq8mOROecsjPC/P0V1M+QdCJiIhvoVR8BjR5OcXrv/zdJ2DRu?=
 =?us-ascii?Q?kFt7rm/Uy2hfTqjvU5i5sYD8+7zboWvGNVTuiMPRxzR0WFZN/TmdWpERBUjY?=
 =?us-ascii?Q?b7BNLbmpkM92qcRVCn2TogkIBShDs5TgaYUxNLljFK3IL++3xT2ED/mDK7l/?=
 =?us-ascii?Q?EyPXveY2ZyYuK88fVeVS+hiUroE6OfbpF4Kpx+FgSwjoVsFYkjrlDji3IYq7?=
 =?us-ascii?Q?5jMa1oMpiUo2TLTGirok/Nn2ZAzG5/VisfDph10w31S12us8knWIn2HKeqNB?=
 =?us-ascii?Q?bC1wzZUvTd1zyjLcwh3foPdhheJKWco78jzted1b9pHQYiOZJ9avl4Vhf4Hq?=
 =?us-ascii?Q?S9yUGGSH4E+GV+1D3F+HpSE6qfzkKeRJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e3+ZqXnBTlxxrV2Sf02yXGjHXdPvCT3VFAF9Omscs42kooTq5naWnE6xMy5f?=
 =?us-ascii?Q?n+qRLfu69cVBSqTYW2tlu2RhmFElramXwRuOmBEBU2nxAqk7vRH+8Wwv1jiW?=
 =?us-ascii?Q?oRUic4i0j0ECp5SuDZHiBSzcW7f/x9D03zgLAwGXGajfbslo9UhScPc0E14V?=
 =?us-ascii?Q?jmQD3Wma9RZRgT3BDb3RGsIOAQrQCjTK5YDkJROjgGGtt9D/YpMiyjj8beVY?=
 =?us-ascii?Q?DHXD7ABOUvXOFSMKt7pI8jXh/KvRz1oNunxd9CM3Xl2PzZ19fS5vf5obpXUj?=
 =?us-ascii?Q?yPqJoIJTmI0l68TYkAf/YnUSR0cNTX1IdAqbZmcY4C/zbrAq2ey4zD0fZlsl?=
 =?us-ascii?Q?9duFt3CtGIszv1TeND/ku/jgpnNOM01f4Ps/oqbhT4quD22vKHzfb7dAW6Bp?=
 =?us-ascii?Q?tRq/Peiy9vjeDq5dQRbv0GNcpUO1oskhrpOxkgXmV7zrMQqXGKdmUjIMOxAW?=
 =?us-ascii?Q?69l7mxuPqoh4tLf1uEliNloLY/IW9w1iN0Athm4LUP8OGZZyjU+KBROChPmW?=
 =?us-ascii?Q?VqiEDi4/EPyn+Lj65otz00YUmdEh88bjs+BVnHv3JaSQ29I3SWIcDm6X0q5f?=
 =?us-ascii?Q?YbRczBZTE0ujl/Z1sEvy+LRxWjhUDuUDJ9ve33lvZu+/1aiOe4DwoLYr9XxZ?=
 =?us-ascii?Q?0BKiKZ56dnZR0cliJnI4IBcnrmXNlUSCMxWwZ9Mb2wBWfKsbi4L7BYT7Etlu?=
 =?us-ascii?Q?brrC2hXTL6Lmu5a0C+uwbCHTzvNrBvzFAf89wvlD0E68qn61gxfBCB+s/Qe+?=
 =?us-ascii?Q?n6Y1tEG+zLvyBOPn/IhfglNldtMRmDd8wv6sN/pF4x4qs1GYDcXqxatURfyq?=
 =?us-ascii?Q?Z9JLekkdg2GXkIncUniQvwr5Oio2kgVwKQ7aYRSSsttzeHTi+on5H56oK1Ju?=
 =?us-ascii?Q?i9kQwisOY53MAYb2cMHGN7WYbZIfB7UGM7XIUXh+4tDVamcCz5SaHjyomhMz?=
 =?us-ascii?Q?Dx3SEObeZMC/4Ed3kFhNbAQPgkGE/LojdXSuzwl8Qc0bio0vEL6YgXtnTvM7?=
 =?us-ascii?Q?W+AHwnS/XUzKYnAr2PYiW51YvzRqRsSH5/BnsGO4ASRJ54fgOhs+hhddX3Pc?=
 =?us-ascii?Q?hIwTV8VucHAh8SKWpYz4U/kfBg5ewEwJbVtbAxla+o4xmRV3yfooqAFjFDOl?=
 =?us-ascii?Q?0WNIMLVmG5/AL8bzjixVQD50pqKW6jnYn0QKytUzKAIMFxlKRhrKFDW6teGT?=
 =?us-ascii?Q?bep09kAQu9j89NnjcAZDMNMRBTj/IAj6yeUH9GsS/xaCjwgkrfSCHpEK1AL1?=
 =?us-ascii?Q?Ks1fza5oEM8Bid7Zpag+gTgpb4WKwZE7NIfClY8Af5qQsqEXoQPQy4hFZV4h?=
 =?us-ascii?Q?MGfaeYRyZK6ebnGZaDrZmAOTWdu/8v8bQBK4KSjNkF761W9+T4dXs4BC7LmQ?=
 =?us-ascii?Q?U/y7x1GRvHp52Dc9s4uhthz/JTFro+ef3nO8VWkr1G/YXcped9PHy9iBRVCQ?=
 =?us-ascii?Q?uBA0bLyDCC+V0a+V6LTFWtPwEB7uxtsas5/NhzqPN2opQ/MsShWbiOEKVD6z?=
 =?us-ascii?Q?0RyRyl4WlYuWtyXjMexI6UiwKaViJlxhCes6VAoiqzrO8OvGcdn/ST3/Ul1v?=
 =?us-ascii?Q?2jo3cPqL/kdg1coGQymYhrho8Xjg8gzlfjfX6ITcu2r21jdY3WYt+cg7Xq9z?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2c2c0f-5dc0-45f3-4a49-08de343e06bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 20:36:54.0684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJXDl1e6fAUl/frytkYMsBCB1/P6HwkT9rnrvSBr5GPW4N9qN/QDNf7Jm/Iq5gg1o5sqt/h14sJEpckNhjlSpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8476
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

On Fri, Dec 05, 2025 at 05:55:29AM +0100, Jan Maslak wrote:
> During GT reset recovery in do_gt_restart(), xe_uc_start() was called
> before xe_reg_sr_apply_mmio() restored engine-specific registers. This
> created a race window where the scheduler could run jobs before hardware
> state was fully restored.
> 
> This caused failures in eudebug tests (xe_exec_sip_eudebug@breakpoint-
> waitsip-*) where TD_CTL register (containing TD_CTL_GLOBAL_DEBUG_ENABLE)
> wasn't restored before jobs started executing. Breakpoints would fail to
> trigger SIP entry because the debug enable bit wasn't set yet.
> 
> Fix by moving engine register restoration before xe_uc_start(), ensuring
> all hardware state is fully restored before any jobs can be scheduled.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 7caf781ba9e8..17642d71f98f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -771,13 +771,14 @@ static int do_gt_restart(struct xe_gt *gt)
>  		xe_gt_sriov_pf_init_hw(gt);
>  
>  	xe_mocs_init(gt);
> -	err = xe_uc_start(&gt->uc);
> -	if (err)
> -		return err;
>  
>  	for_each_hw_engine(hwe, gt, id)
>  		xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
>  
> +	err = xe_uc_start(&gt->uc);
> +	if (err)
> +		return err;
> +
>  	/* Get CCS mode in sync between sw/hw */
>  	xe_gt_apply_ccs_mode(gt);
>  

I think you need to move this xe_gt_apply_ccs_mode as that is also
writing MMIO registers that should be configured before bring the chip
back to a live state.

Also I think you need a fixes tag here as this is pretty clearly a
bug.

Matt

> -- 
> 2.34.1
> 
