Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67012CAC5A5
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 17:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C1E10E078;
	Tue, 23 Sep 2025 17:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X24zZ7od";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6139610E078
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 17:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758647032; x=1790183032;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bGAb/haC54NyrBbXcS4p+RYfWL/AAqg6EHsl3HOB6aY=;
 b=X24zZ7odO3SHJCzUtGN8T/wamAfBZkYvi6tBDG3hAh81QBtCHNU/Ufo8
 XPnsuTFwOd1/BObCS02wiCfyU/WDMSrAA+bgzvfgyo1SYaMOe39I1q6sS
 lAdZ8RC/DgEKTiSjxvc5EyHMR273gsvQSPw9zq1nwqaW4+yScs32dCE1t
 p+J33F6M+6RG93BUtpmsI0wb7T9R5dYs90FMXjGPNvnplvxVxtkncqNxi
 QOiWdUOBb4IgsgKkgit3NFzraZ1HrxS0z5CE1yOEUwhSXf0v8VA1VKWS3
 lSsUyDOOLGVG2+7/Un7zQNHiEbhGxatc1UdmGl44V+sTmHW/T1jDHiURa g==;
X-CSE-ConnectionGUID: k6TgmDaAT3K5rdBvFLRbFg==
X-CSE-MsgGUID: gseqddeuSseHwOktSC4UuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78373560"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="78373560"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 10:03:52 -0700
X-CSE-ConnectionGUID: e5ht1s4USFSwidMqawNGQw==
X-CSE-MsgGUID: I/nCD2ShQ5enGaI0uJSMng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="176634086"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 10:03:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 10:03:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 10:03:51 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 10:03:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gt/o6jovVo5bIDeb788VODDg586eBcfynv2HCPCUvIJir+/ZZd2Ows0N/u2FqVsuiRbS+PKX03ab+ptclMlmPTbSY3o6SsuGKmgygNovleDP3qkD/sKEC9cRb7XVEroC+i8jLlM4qC/2Zijqvn7YmlJAn77lRND2KbQ9BieXkVq5hCPn7O7I+eXjd3PJiklX3CrEz6ez2f9wMuD+FcJF5eqQ8nx2RW6iA7cytMCU5dcotxWC3gRnHOUc6+uEJV9lM+b3hnuwpNWutujpQuxER07kiZcfEosP+tX7SO7o/3/QxVNnR/2N/28AbHa4DFWU8/MVHW0ldaAmBEIKfss4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wkptRlcjHgDJ7AWRXrEJn17hrfzM7qMP/Hpt2cVipo=;
 b=u/F/ddUawvCR02DbmEHEXrQSw3WbVyexokWjivDhKY0hDWgQlxesnv1FTRUuCxBV00EcP1wH2+eb+PQS9WJvgFqGVfUoD/LkQazs8XmvlFO1s6YBYFIc28XLFuSKe57sM6q/RIgSAZ2gXIaFwOeoqkyWjL0FJ0tXbB0nu5V6ngbXGPJAcUdp2X17xJ1wKFo2R3BpYtZa8IaMZhpIid+Bl5cQe+l4/qSfX6M3M4aCzx+HsMM5NWgFoZJd7v27n8KXur/ahAnQcuu+/4/6wszX3El2dUpM++8LIyQl1FqvLJQ+KCmK/QuwsMPzmJKwQY8Pp21SGCJAgfbZGWYx4VKxSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6922.namprd11.prod.outlook.com (2603:10b6:806:2a9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 17:03:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 17:03:49 +0000
Date: Tue, 23 Sep 2025 10:03:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>
Subject: Re: [PATCH] drm/xe/xe_vm: Remove unused DRM_GPUVA_OP_MAP case
Message-ID: <aNLS8t4kP7+Fkt5P@lstrano-desk.jf.intel.com>
References: <20250923165602.71755-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250923165602.71755-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR04CA0329.namprd04.prod.outlook.com
 (2603:10b6:303:82::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: b3ca21a9-7125-40d6-5222-08ddfac32a6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J5Q5SCXpeGPjkx429LlinjgUC7w/Sw3+4ofMUSLy7fHjAE5RKMH7715jpDEB?=
 =?us-ascii?Q?iOh2XG4B2O/ZqIqkxuDOOH57fCI22h/2adCeJXSu0maa5apK4ti3Ar09QyZh?=
 =?us-ascii?Q?csEr/kWMsxlWU+56W+ykFC/qc++78p0gXCvOZvJXku/2cWwL24+vrzP5sDRz?=
 =?us-ascii?Q?Z1HQ8JdtE4kHJZT2EPrRSRlj/5MZqWKOQ6P8cpiL6osa94wHXTLWAU3pAUcq?=
 =?us-ascii?Q?vrkVhm/CYb2+CnyMH8CndOsr7ErUs0e87wAIW4E4PSAJLF/XsQ18u/wXSs7U?=
 =?us-ascii?Q?YdPRJ34fJC39h/Z/HRpyrQuHwcR0pkHED9tiRkFc1jvCpZm+4+j3IX+PlX4M?=
 =?us-ascii?Q?0/4Gv+wr+X5mezBa07lYYEkUYxBw5i3xaxcqcoyr/zjsESG5huzuZ5TuU7+a?=
 =?us-ascii?Q?XKcqmGBphvOWy6q34OyVhzsLTsOKcSKwgCZ8oyWplMOAYTjyftwHXCXFhGUn?=
 =?us-ascii?Q?53soE7l87NCuHw701ajv6YypZVMRUHOAKRlixNrywpdIHb03URogg5R3OiEy?=
 =?us-ascii?Q?pYKezpipawymaCv1O5Dk8LBp+bUwZuGOM6jB5E1uqa5ZGz2qJOv3NQs+4Wqi?=
 =?us-ascii?Q?JJY0d7G+XZqTTrp7RJNxclsQctw2NEjK1y5CVr/jBMJIWtphhBHmca+o4Yhs?=
 =?us-ascii?Q?eemXPThQB31X+fREgdG/Hk47QkDs80StsWSPTEqWFch+V7gkxzwzo8+BXfwH?=
 =?us-ascii?Q?+28t3TE8XGQ31hi547asg6m4NvrMfKBn9Oa3pXHGXz2/zxSt1K4N0A/9SBKT?=
 =?us-ascii?Q?W0KKzIHqartzK84zIQMQHbrTDdQKUoxt7ALKMovz6Ca7kyAjOyAoclt+I7z9?=
 =?us-ascii?Q?DeuvzSCX03ccEaXx8L7HQD+xVlmBWgaSuFokRYrb48ip4JGnoJPyqhcdkZdi?=
 =?us-ascii?Q?7ansxAbqmIXHnza4XXbtKf98syl4mKIlziXLHL29HNRlmvFQXuwuzHun/Xgr?=
 =?us-ascii?Q?BCOv39D3Ut7Ec9OvwBOeKwqcHDxCdIOosqyRMPR67V7PiLKBULUOCtIvmM97?=
 =?us-ascii?Q?p2zdg7kT7w3ub1PPwkAQcDyDpB5RGq5mgzFcJl51VTYHxc/DtV2ZjCIZoNt/?=
 =?us-ascii?Q?eJ2Rka5CCzDnLX95AoA1GA9S5LfENJdmVnJHuBK7U677W3Zyd+wU3XoB8Gvg?=
 =?us-ascii?Q?YApNbKL4XXmz/S4jCnoLJ6pONJA3N1uYOu9B5BaNzcSj7mbQG9vJbC/sEHMJ?=
 =?us-ascii?Q?ec5ygdu3hpUlj5KOxrjl7O2uYjfl0QAYzwHJZzgj7aDmSXEuY/7hEjU03Ufd?=
 =?us-ascii?Q?AR68Pnb7W6XjOkoJ/JErtjQyfsLaLQHdkpMDBYLXutQO12ktwDcqREb7wV5z?=
 =?us-ascii?Q?1vbe7mgRGJsxBy9ESz4aFamXnKZXqMe8pAc5iiIGzSIQk7WBEOtPgM6CZiDy?=
 =?us-ascii?Q?tYoxi8aqnBZ7CXjipS062pSd9f69FhJapZgtj4pFR1vxVRHG0kBq1VPr8RjB?=
 =?us-ascii?Q?WcaJudIQPXI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zIGNa5rwDJc9MV3AEQKKIak7PNFuXg5EutEL4XiRIAfo0QDcadEGlJMcGviT?=
 =?us-ascii?Q?Gm3vC69SBCBiG9Pm6l+eCgWLDOsc921PZiJVCUljqJOrREaBqHb3qCUF7v94?=
 =?us-ascii?Q?eWtDL3wts1r8wrj2z4M0VOAb0jmAWoesx/GwEPxd2bLveorum28YiqeTnVYW?=
 =?us-ascii?Q?+2z5XGG5G3VJ1VisJAGnjluZNicDCdW7ogcvMOh9AuEyHgKi9LAZ0rmt7dHJ?=
 =?us-ascii?Q?GqiDeLaqd06HOw29+iiONpPW6DPHbbHqKwLa3Kaprb35MJqszKe0JGliS1Jb?=
 =?us-ascii?Q?CJTFZHrW4mHSFPcTeNuHrAqBKat0BLJZJjITFbSP0xHP2EaNyDd5Gvj22CPp?=
 =?us-ascii?Q?Qk+4PKyk7xMcXMllIWzv9NbnFx0KLbjQj/6jW7oCpHZJVnowoG8wir7JAS38?=
 =?us-ascii?Q?RbTkeAbTkdQBt9CZjef1A/nOZnrfk/L9qe+WYQj9TvwiHhRukwtSVXQFLiHD?=
 =?us-ascii?Q?2RCvlmwnSHXsrrSVOHP1Zr/C1xxI/RQHroJDf9MTY9/A5DFpmXeWQz0Dk+ye?=
 =?us-ascii?Q?AOrjrG1Zk0JErC7RrZM7u8n+kO6w3OCJt2Ts5L0MH6AsJr8j4haG/wt8TM9y?=
 =?us-ascii?Q?idX49HNnN1IsIjau1WRlBlaGNAcxZca2dafa3C4GL7OhyZB2p3bsW+saoMnc?=
 =?us-ascii?Q?bJ/sL6+NPXGF5yB6Kgi+/fbKpLh1u7nfHTKbJXKw29VZADo+pZEH0nZPsKvM?=
 =?us-ascii?Q?5cmreXJRKzCTkwUj9YfehZstUwJHuPCsPIJ5KIOWfm6til5+CsrMdx1JjKpZ?=
 =?us-ascii?Q?XawN1HSKDOu2pmKiqev0nTSXoN/VEVAvmXQfI5GPC1V5wTaAxWX2PFVmAUUt?=
 =?us-ascii?Q?Mna65p+ZZ8KaOe8lvUgFgeCHuXItRaXtSCChjal5XPrWDQMFfqEE8qdRMamE?=
 =?us-ascii?Q?RRrvxzqhqRGvgakn6YqSno3S2jnSfeM/EC+XrL/IJ6IAIKfslLYi32ZSKV0t?=
 =?us-ascii?Q?z0972B7K5erjnYGlBGgtk+Vcp5TEP8S3GCz5VCVVa+yzXnQl4TdAAElfAX00?=
 =?us-ascii?Q?L6kPICkJ1idSJbrSJ1hwqFoJXWinE2/nn4AMPVaeixbyuSMiBhyPJWyBiNC3?=
 =?us-ascii?Q?+W5HJKo2HTtFtuaqUXDkENzVbMa9+9iwYN9UzRWh2HQ8Sm2EmuwRylTIreLR?=
 =?us-ascii?Q?97Vc+XM1FZJKcKHRIIxYdLjoWzasktoiRzEKvNJp4wOIwC/iSmVQFT8hS9bb?=
 =?us-ascii?Q?fHtz3AkNxKDuvNFjd76bnzVPu39lNbJ+Md5Of0Vzho3tnjNvCc3Wsv6mCA77?=
 =?us-ascii?Q?7e9nhoqdKk0GrAKpZA46K77+7wIcQxI7u5joIiQNsZrJlvjZrg2CjuJMGig4?=
 =?us-ascii?Q?2WJRW7AOnf/IofTMTuf0LMwwwwXnD/Lc0/Ko9TCgDBiE08PQxOvObJMqHPWi?=
 =?us-ascii?Q?QYCUdyKIX/qgQ8pe8T5hNJ8QkL9C5IwaIo00wxklhjlVncFSRcj1FYELK9eX?=
 =?us-ascii?Q?Ql23o8ObaQl0x0BYzDlAxJ/BB7K+yAIair48BjiXvBVsywQXJCUOyZwh6CeB?=
 =?us-ascii?Q?eIjUlmFSPVfCwvBXAk7gsDjtLcnRKLmSgN4R6hOtplhMXlrLJ/IznIb5tid5?=
 =?us-ascii?Q?e/Q70UIM44Dw9tMIKc6KNaSCJE80byw53RoXehrw0g4odRZ9ONmkFVPmo7p1?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ca21a9-7125-40d6-5222-08ddfac32a6a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 17:03:49.5005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSaOZiWA0Rbl6esybrnMMCvkcfAM5bV4aA/jEt1HeurBmo4X/y6IvmH4IzzGYiBPunuVF0V2fIsHP3Zw/4G9lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6922
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

On Tue, Sep 23, 2025 at 04:56:03PM +0000, Jonathan Cavitt wrote:
> The function xe_vm_alloc_vma uses drm_gpuvm_sm_map_ops_create to
> generate an operations list when is_madvise is false.  This function is
> unable to generate DRM_GPUVA_OP_MAP operations (at least with the

No. drm_gpuvm_sm_map_ops_create in this will always output either
DRM_GPUVA_OP_UNMAP or DRM_GPUVA_OP_REMAP followed by a DRM_GPUVA_OP_MAP
in this call chain. static checkers do not understand this flow, which
is triggering a false positive. The code is correct as is.

Matt

> settings it's provided in this execution path), so the check in
> drm_gpuva_for_each_op when !is_madvise cannot ever be true.  Remove it.
> 
> Since this is the only location where the variable default_pat is used,
> we can also remove that unused variable.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 80b7f13ecd80..7fea3eab7062 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4202,7 +4202,6 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  	bool is_cpu_addr_mirror = false;
>  	bool remap_op = false;
>  	struct xe_vma_mem_attr tmp_attr;
> -	u16 default_pat;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
> @@ -4228,17 +4227,10 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  			if (__op->op == DRM_GPUVA_OP_UNMAP) {
>  				vma = gpuva_to_vma(op->base.unmap.va);
>  				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
> -				default_pat = vma->attr.default_pat_index;
>  			}
>  
>  			if (__op->op == DRM_GPUVA_OP_REMAP) {
>  				vma = gpuva_to_vma(op->base.remap.unmap->va);
> -				default_pat = vma->attr.default_pat_index;
> -			}
> -
> -			if (__op->op == DRM_GPUVA_OP_MAP) {
> -				op->map.is_cpu_addr_mirror = true;
> -				op->map.pat_index = default_pat;
>  			}
>  		} else {
>  			if (__op->op == DRM_GPUVA_OP_REMAP) {
> -- 
> 2.43.0
> 
