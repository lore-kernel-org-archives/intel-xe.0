Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE481CA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 05:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AB710E435;
	Fri, 12 Sep 2025 05:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVSfpRPI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106B910E435
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 05:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757655236; x=1789191236;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5aAVVAxeq31XLipEJiEn1HjSdtNEVRmMmuktAZQcX24=;
 b=FVSfpRPIzS6voSNYvIHe3W8jah01gqo6EzJRuWhr8/j9xR5qftoMwylT
 ySJTGBK8r86//iOvtfiqEA587yXmRgPp88sxhQ8spd17ZXO2tdLNWO4VL
 Q62hb8RIiZp3i7Rh0tZWprpWyqZxZ4zW353fQgPMH/15m5SfCAclp3Npq
 NqTCpr/4SPi24QenOJw+2p18PpQbRh6eUfob/1rqe9uFfUNvZSybwpW90
 E6fxbtqNdekijKHuAFtjFv2D9aJmPAd7T0+v5JF0zb5CIcZJA04v2P4hW
 jUoOHmwkhk/iNmf3XBD3k7JT10pNt7oOTUMAZzuXh0ae+PabzkxE6WCdG A==;
X-CSE-ConnectionGUID: Kp30L3UpT06XR7mtMb39Vw==
X-CSE-MsgGUID: 3ALKqxQpRBS49i0iKLnfEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63820789"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63820789"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 22:33:55 -0700
X-CSE-ConnectionGUID: Q9dkATNQSVyMTjQkddlVSg==
X-CSE-MsgGUID: ODGW0V8USZCRIn+AC12xJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="173424148"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 22:33:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 22:33:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 22:33:55 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 22:33:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGteOB89j8oZhjAgYt5b9be3vB9vlKPkleExpUpHx5Ze74A+h/gBoYJkmkgm83f1FAEvZNCxUyz4tydsW+I/W+4ttARlfcOnfnzZtgJQuqJ/3Kx8w3o7Nu3i/Wb4zuKNfGsG1HfIBfq799pua3KcYe1E/z3dTafo6vsBjXdzfnq9TzTKWjaK7wGDkKOXh2greUj7xoR5YHDGgGDo5NmIHrcnr8tF1Fd6kP7Q9oRVY7HYzVvYKEEzuiSMmJfBrwtR5eQhl9NQfzV0i8Qy76mBDv+dKehyJAfJpmDVEOMLhuGZwt9a+NA9bheYQimStdrM6GPwghZou4VuQe/sgc/zDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGbS1JXqjmzfqbwzttTnsGr8j9TiV2rC+Jbntm4eJfQ=;
 b=yh24cPlJ8d/Q/cLfCSMR0R0A7ry6BcMDRrgD8lwo7CanhjZ2VvB18yWpoRF5Qrt37FYVYEm+wzRZlC3Y7d/8pmLa8G221bm2CC3askHsfdkexrvccE+6Eso5PufK9tTRZG7a0Ax/1JFrs1B1ZEdkL06k73GmO3D/bXUHG97vStCFd2GhUPZ6pmdUr7rFNThENelCR3LkGVl2nIPqKqFXGGfjrodvgeK1qxjZDEljgJUfYqydMqZEJqRFe3BgTiZsdlNVJxozWQHi5pGOm0qVflZtiB/ye4Lbr+CEzvibgueDMmgJWjvztl2SiJtPlsPWQrV2UtWmEY5BxhKA8mfx8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW6PR11MB8368.namprd11.prod.outlook.com (2603:10b6:303:246::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 05:33:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9115.017; Fri, 12 Sep 2025
 05:33:50 +0000
Date: Fri, 12 Sep 2025 00:33:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/xe: Fix circular locking dependency
Message-ID: <pcok7wpcby7muwekdt3eqczmarct4g2wrg2qmtupmvphmolhjp@ggqxwiz7pjib>
References: <20250911212024.966757-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250911212024.966757-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0379.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW6PR11MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: e5772b81-5ec7-4640-761d-08ddf1bdf3d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+ZaqAD8OfIqBuCzxxhpyGuErdxzsXOFkKwTvsLenJHRjVcpv5x6VI0EpG2Su?=
 =?us-ascii?Q?OtrGui/0GDPOUAYpuiejbzuxcNzKjiGs29Qd3asM+jn8BWj5ehcUia6qsd+9?=
 =?us-ascii?Q?SVPJmu0OEAORXyezE56BEHDohVZOPUswtZCQ5C/d/MnQESYOhfhzaY4ngygv?=
 =?us-ascii?Q?mMneCXhsdh5fPv+GvrFdD7ujJowkL6rMu9ZbWlhTXBMeBav6LDSHxsNnLddp?=
 =?us-ascii?Q?fGPX1LHNEG1hwaZJ196g6+GhX0xEgcIF3qQVpZJbzxwvyfugeTtrjI4SGG65?=
 =?us-ascii?Q?L5PqCD00cBufLRueryCGBoFnDDrcYJPq97PoSuEpWSCJCkw+7BLUa4JNnX06?=
 =?us-ascii?Q?jJ4uN4ouqxB3rlfZzFefQiwHSM2mm+F+r/stnD5fkx0LC/Vy3Xaj6ltTG4ez?=
 =?us-ascii?Q?Ly8aIpBYTyB3sy2vSwont7y097nSx23oeVfWSambG9qb/n9p7pP0redhO7qs?=
 =?us-ascii?Q?W8IxZPdHdHECEygM5G3WYm6jRcFuhnFBKzddyVKXTpruU+nABwycZeO4zWOB?=
 =?us-ascii?Q?u8HTzPwUNMBtMSvn9dkkOdBEF2OE3OcAqBqPZpj0K3WiG3JYUMvLp0GpkII9?=
 =?us-ascii?Q?si01PdtBxH2G3rPPQ7pZ6+yTUdLeywotNSA6AsczJ3By6a9u0OqjXM6POSHu?=
 =?us-ascii?Q?DqDzcn2UF919ZUPzu5AF4jLOQDONIO5+WdnAyQjaneFgS0x1c16V533v+mKU?=
 =?us-ascii?Q?ZV4+uDAyPU/W6J9XKVg/ebuGFTYwQxHd7y3EL5EcfbpO1i29YFmSDzuKnLCK?=
 =?us-ascii?Q?qDBTSnjH90iLGRG6B+9Xq1HH5U1y8hxkHPqbIeTpwvJLsWYYhwsbClmLOi7r?=
 =?us-ascii?Q?2bR3e9rhUkjvRIDEhkabc39TAHRLky70dOdn0+b4ryvHNlOcIsmUR9st8Lty?=
 =?us-ascii?Q?R3CBsWh6+DcdA9A7Y+6zwtLxR+EVG0ZYisb1yq5MsddlXD+nCl/4Ywv6uB0d?=
 =?us-ascii?Q?DHq1B98Ic1MMfV6/RHLWZPxTxq2Sbw6HgXM3fX5h4ZcskagB/gil6ken4jZf?=
 =?us-ascii?Q?FEPWnRtQXVv0ROfn/00yhI1OTeQmVf8LM4KeuTEe7M6OyzKqRPcEJn/Ifmia?=
 =?us-ascii?Q?L2HEbS4xe8bSnY9U9h3Iv1jLxXRnF+50KDmBc0VfU6blbueu+cvQCx9NucPH?=
 =?us-ascii?Q?qSjx1UD7qeCfr7p1DznJLm400nvS5cBeqaN3MEoHZq6YLAVMJzB0dtpQIRaP?=
 =?us-ascii?Q?ds5maAFEwucuIINLi5ChN9zOrSBaV5Dexeil9WuBhaQem5L5GS+5q5Y7NRK2?=
 =?us-ascii?Q?gLK2ap2VDUNHBfs0HkkK1pgxgmI7IgdsluD2pHGX56YT6JOYv44RLe9Y/TlV?=
 =?us-ascii?Q?rD6cMyu5q4funlE417NPxn/cVHzvhq2DeuafSYxxrK2GvtrVUfi7jrqftQNX?=
 =?us-ascii?Q?TIXGzKc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZnfpU1WZKirzNUWijUQomdqNv8bthn+yFyJd9M9W8//KhjbiN6ngwp00tVbz?=
 =?us-ascii?Q?ZZmuYXl0I0jzTvUQNRz9X8mF1f1+pQxYU+B/mFq7JPFSrwa7u/LoDco6pPnI?=
 =?us-ascii?Q?0V4Ki9bawLaWNqFsiFZ2le4rnC5JacpRkaAOCv0cHV4pgiGO4p2QMVhI0M+S?=
 =?us-ascii?Q?jfm51uvo1Gd9BLSxWwNtcdWzkXJRcd89MwCkxGA85mrfodfqcWl6WZ0FxSa7?=
 =?us-ascii?Q?oxRRMrOm67pZAkHL82Fe9Th4YHSwz1EQfHqXV8RQM2+jgJburnj7rTp+Fbs9?=
 =?us-ascii?Q?N744FT1rhyWdmJojArZMOGymb7I0v3x5o2rhI6q5/YGAZBOiHU4CJuxBGZ/D?=
 =?us-ascii?Q?6mqboS92YIcF6ZmfmZ/S7II9YiNv8JpukDSO/mHsRaWa0iV9zLnkJc/za7Ym?=
 =?us-ascii?Q?ZxtnM3aidyvuOFIHRPDXPWeBiVn+SEstlDFr55RWAo9fbKJOA5aHp/DOUHa8?=
 =?us-ascii?Q?vPf/YvCBzwWJnaLbyc0vhKMnEf0x/u9yg5uHHp9EAPRczxhVRYtyq4f7deDR?=
 =?us-ascii?Q?AL5co5N47shz9KBYOu1ojWoMtwy0Chl1rF5hvs6UQGpt24sOJ4ejzg3/Ureb?=
 =?us-ascii?Q?FdzSY+pklCE+rBdiHWDc/AwKpKLktxqhn2uokauafGpm4qv2IF001QZ4vOvf?=
 =?us-ascii?Q?NX9LiSQ+GBLlqbjg6IHr4tssz0bjTCFQjIjhadnXzp0jjxH6TKyyVnkJ75l6?=
 =?us-ascii?Q?pi4cquGBs/SPgsqJ1NuIziWT/uayt74rjzbXJpb/GBHHPhdqnNQxdP/6JJJ2?=
 =?us-ascii?Q?yyj6Vsgyr6QAntSyz05vOpPOFNSmb4KDnwoMphmZfSeH4cVXsKfoTviNn24E?=
 =?us-ascii?Q?hP4bb2CuvWdqSJKzp/o2KCWs7smbWHI20t+iypyY5xICrH+Z+CK+Q3kk8vU2?=
 =?us-ascii?Q?j88WtMvd36J3aOwiCbIdIVj0ZoEVTMrdEGz3pLayAtJGnIfjIyCVQPUie08s?=
 =?us-ascii?Q?5qJuOHvwslG+rtmGt3KxK7VIu/HF14HwbhKuDFNWVpE3W+9btaAdHYWgV8xk?=
 =?us-ascii?Q?T1BzkSMoNSCmcyY1niuGI3P1Q/R6wbkpXPYtE+Vjw/skdaWUHgJfNG/iRUbP?=
 =?us-ascii?Q?59j+K2leJCfkTMNsbLBq2tvoPpHNIgYGOB+dMXmc/gCwO3Bx7XyHciTkHTSY?=
 =?us-ascii?Q?gwKXA1DSB9BRTcklBueZHBCfq3NocvgR6sHEkDOtwQWBRhltg5gKPQF/9gYu?=
 =?us-ascii?Q?48X6Sj9ndN5gWZdcUFVs00YDJmjs0GgnPxYECyCT4+JPynR4N3ioFZpB86qo?=
 =?us-ascii?Q?AL3KieMWCgFNu3uBugQ2utSsV/Vr6Uge/+rQg3coQGTh43JvbZMoFnE6gadS?=
 =?us-ascii?Q?YDpjNHOlkCU2U1/Dv1uimH3ZRefeKMKXU2UENXNX/y0UnUkLohmekMImdSmo?=
 =?us-ascii?Q?Gpmr1cB7A5XDLa7VBxzepzw1QVC2CzKbseCD/1Sc+gdRNljO7XXTipamhkD7?=
 =?us-ascii?Q?kK9rldPjTKxRKLhaSUpPIPbO94EEaVCXhXbPfixw6PgKmJbo782Z4Vfm/HZ2?=
 =?us-ascii?Q?ZWFtYGS4Ord0FBWAJrPblvQJi2PXHDYVnL9FkrVTaJS1ePpr7Js7H0RVPVFo?=
 =?us-ascii?Q?ow0MDZhcXz/85AF4qLxtDA7/wVcv6oUyFLGwjHbD4HivyBIwiaSHV+JKAQXy?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5772b81-5ec7-4640-761d-08ddf1bdf3d9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 05:33:50.7359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ky7wWgMtQpAs+k3X8W3heHINgT4fa9NUruCDCE0Z4Kawi5hPGDdevTkKf5PuNkmzs0/FzhshJdP9O5y2oUZ5e5hxe8sK1pe6CIqRz8OKYvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8368
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

On Thu, Sep 11, 2025 at 05:20:25PM -0400, Rodrigo Vivi wrote:
>Fix this:
>
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.17.0-rc4-lgci-xe-xe-pw-153723v2+ #1 Tainted: G S   U
> ------------------------------------------------------
> xe_pm/11324 is trying to acquire lock:
> ffff8881085f22a0 (&pc->freq_lock){+.+.}-{3:3}, at:
> 		  xe_guc_pc_start+0x39f/0xf70 [xe]
>
>but task is already holding lock:
>
> ffffffffa1020420 (xe_rpm_nod3cold_map){+.+.}-{0:0}, at:
> 		  xe_rpm_lockmap_acquire+0x1a/0x70 [xe]
>
>which lock already depends on the new lock.
>
>Possible unsafe locking scenario:
>      CPU0                    CPU1
>      ----                    ----
> lock(xe_rpm_nod3cold_map);
>                              lock(&pc->freq_lock);
>                              lock(xe_rpm_nod3cold_map);
> lock(&pc->freq_lock);
>
>Reported-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Closes: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-8/igt@xe_pm@s2idle-d3hot-basic-exec.html#dmesg-warnings335

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6122

?

thanks
Lucas De Marchi

>Fixes: 60d2b7899142 ("drm/xe/guc: Add SLPC power profile interface")
>Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_freq.c | 2 ++
> drivers/gpu/drm/xe/xe_guc_pc.c  | 2 +-
> 2 files changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>index 781e4890fb26..4ff1b6b58d6b 100644
>--- a/drivers/gpu/drm/xe/xe_gt_freq.c
>+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>@@ -246,7 +246,9 @@ static ssize_t power_profile_store(struct kobject *kobj,
> 	struct xe_guc_pc *pc = dev_to_pc(dev);
> 	int err;
>
>+	xe_pm_runtime_get(dev_to_xe(dev));
> 	err = xe_guc_pc_set_power_profile(pc, buff);
>+	xe_pm_runtime_put(dev_to_xe(dev));
>
> 	return err ?: count;
> }
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>index 68a5bf8e3946..53fdf59524c4 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.c
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>@@ -1215,7 +1215,7 @@ int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf)
> 		return -EINVAL;
>
> 	guard(mutex)(&pc->freq_lock);
>-	xe_pm_runtime_get(pc_to_xe(pc));
>+	xe_pm_runtime_get_noresume(pc_to_xe(pc));
>
> 	ret = pc_action_set_param(pc,
> 				  SLPC_PARAM_POWER_PROFILE,
>-- 
>2.51.0
>
