Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F55C83F09
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 19:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46ED10E1BD;
	Tue,  8 Jul 2025 19:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOjnkpOZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BDF10E1BD
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 19:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752003848; x=1783539848;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iY3UeoNYq/zC4Eps022Xr+y93LJ2K+ved5dXbRdm+WE=;
 b=gOjnkpOZHjrYW7an7XRBg478iJSpgUczdLqSAPYbSLhcc2SV0kYNyZWb
 uTkqWyYfKxRIjrgyoMxC3yhFaLjm2U2dyt+JLec9U9x+CR7qG+OAZA/wi
 Wv3ZBFXZCJSIczIUyy5oJVRE2LMH4NerlnfZ4tDSmmFcLtZme7U6yTYJR
 gfnGqSNFbSsebquOC2L9IP1FI/8KzcR7/BXO1maIbeiXX6GXnDuUDlixH
 gHo8Nh2u6QPuqFUZOq+RkS6TYQhf3aMcCIiTaosTT7/QzwhG+eZq+Zhob
 YAUpHDuYVwdjYyMkLgivv22A5GaETjhWGcJxHn5FXU9D0FMzxvwu2uImV Q==;
X-CSE-ConnectionGUID: QK6gToF4RQacx1Nf/MjTLA==
X-CSE-MsgGUID: EnXQKipfRpSzDHyRugzYFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65315693"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="65315693"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 12:44:07 -0700
X-CSE-ConnectionGUID: hOLboUWDSs+3XkB0qG/phA==
X-CSE-MsgGUID: 6bNCYlbYRZyb121dSgVTvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="156314531"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 12:44:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 12:44:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 12:44:06 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 12:44:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0gFpUbPJerQTwZrZiEU7i1VTDU+vp4U1ddCozZ9QLkmwlETtljZsPsRGzL+zG9vWkKcYOFi2THDQI3Msaw7zaao2FmZJW+csiNogjuNiDHQeihE9x5SI7GmuaTKjY4VLjklNwC/9hEnaIXSEq4XJqohGbbEjhxidOOawkgTdyCoHM6OGh3E3xwD39fRabN4hdouFBFa8FQPfX6tZ+LZqixElXS/YUnASIWB50zmPqHOEata78+AeJvn8AuEpqG33F9AX82fTV1tyXt9RpvT/mBZTNlFMC3xzniT7mGqxHJv9MLRxLnmCWU6H72+2D3zRyyDJNEK/MutVMwVmK5/ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NGjOHHJ3/8QI0wUtdh+7XO4MU6Wc2XeqGJlCB/zp9c=;
 b=lYUS+BwIHXMYFkiKrajBIXdIs1apdUAPPkDauFWUIN6Zgvpr1i+SF9Obn9nxVbg29VxvoO0jbZbioQ/xvTq9ryhCnHct8auu4+L7YASb3ma+V1taWl5DK9ESSGvp1kRjdPAVmnwRsWvl0Qf4ZtDeitqwIdh4bdIbzhYLxIHE0f+UOA2C+GlHFo7xFu6QCyDJlQe7fSD4mglW160WozIqf1aBSMXawU67+sRxp+DlcMs5629r1oWxk+ofwdXYyv8DLZpaGNe7sjDxqAymu7eSO8B7BHKmtNggRsJJIifgfN95wQD37j8i91C6MyCam5PJsHdfOpd/oTQVTCtW/VStFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7839.namprd11.prod.outlook.com (2603:10b6:208:408::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Tue, 8 Jul
 2025 19:44:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Tue, 8 Jul 2025
 19:44:03 +0000
Date: Tue, 8 Jul 2025 12:45:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Ilia Levi <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <koby.elbaz@intel.com>,
 <konstantin.sinyuk@intel.com>, <yaron.avizrat@intel.com>,
 <moti.haimovski@intel.com>, <didi.freiman@intel.com>,
 <tejas.upadhyay@intel.com>, <matthew.auld@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3] drm/xe: Support for mmap-ing mmio regions
Message-ID: <aG11aTOnZuNLG+Bs@lstrano-desk.jf.intel.com>
References: <20250624155221.208338-1-ilia.levi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250624155221.208338-1-ilia.levi@intel.com>
X-ClientProxiedBy: MW4P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: ab311670-6a89-4548-d403-08ddbe57cac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yHlB5HDgPbSN/8P42WlB+wFDX5r6htMpyBN54+/I023kluwxgNUmBlbn0Anl?=
 =?us-ascii?Q?iz+uJZiSb3F/P33FRneMAQt+RORoy8+XVtvtl0H98mo5r7BksswNyaGHzS0L?=
 =?us-ascii?Q?hh8vRennEk8X5jKPdmqnLCTn5IEovSHKB1WOiyofFjumA0kJXtsF4gk8GhSN?=
 =?us-ascii?Q?yTYnu/FeRMDyDGMXRYAWAdBuSkxad7YcWr9Wh+FWghPksVBOWw/eXRjVq/QW?=
 =?us-ascii?Q?Wc0dcqtVqVnGv5uAsh69yRmmdf964w+KopEgKcIUKhTUJQrKrFyVqDzbledh?=
 =?us-ascii?Q?MkHPJMRsDkAsMedWlOr6+KuYhJgV1tvXY3xTxqtf0IM4ZwpGkwg5t7SS3+Ol?=
 =?us-ascii?Q?fPQSRnHzm7EIZeKe+nH4yXe1z9+nkOnVPRSj7U9QZZtUV7MSe0EqjX8YXflu?=
 =?us-ascii?Q?1G4cVhDfZ3tDEb83K3a5rijTZ9XdXYgEJgBlw93I1QZ/JoXBa9tk/zGhVlYt?=
 =?us-ascii?Q?nRykM4i6oQTKOGNEYj6oCX4rEP8F5TmwdgYigUj4MEoSTkzaeGO+3e0Ud6EY?=
 =?us-ascii?Q?YFt/rzCdaRCjbMbSZkhMr5WDhUeEuCDa21M5wQAMdmhTMc3o9AxwJmdYm0wZ?=
 =?us-ascii?Q?hKrckQoqdd2DuNntxdIILViMd+Sa+3dXRJJe/vzghW5l2nWn4xdwGU/0WQNk?=
 =?us-ascii?Q?IvHUOI+qs1CzDtbw+nDuIEwezzLIrT5NpyW71f3V1QKYSDhqrhlJo65cZk71?=
 =?us-ascii?Q?6kZPau/XHifEghT9igZYVTx1143HhQX15Zbw+QQTCWQ3Wnj0LgOfrkPfzGJ1?=
 =?us-ascii?Q?MxLvhYV3ZllJ1c6ovgjPd9CrOkk+e6azeD5Wwjtcqv73Dt5XHqO0HdY8nRMl?=
 =?us-ascii?Q?STcnDbjx2vqzMszpnBs6C8DL91uV5XR8rcmfEtaKv4EfH09r60r6v6lpmORa?=
 =?us-ascii?Q?or+EOzD1mBwBUs86U13WHXpC84Lsli2/i/rH9mVdrxXvfLvOUxr9jn3g3pui?=
 =?us-ascii?Q?H+w9+6k/b6dRKnIoUempnCLbldvYcn1nNfdo/M/amuLld2CJtSsxly4yGrn0?=
 =?us-ascii?Q?y/I/+45d4EDRvI5ALiTelaLiWLehahL6kbHzC2CB/LdaU5zSChHKa3QXZoVY?=
 =?us-ascii?Q?nGldR81euQWRvDFBf/UDaNzgwOCQSC0l0HPfgxcjv9yGCIAD1SA488srPRGm?=
 =?us-ascii?Q?dyH6QYoJyJnwwfIOJZXjeeEZPuAqthqOFA/QBtuL1dNSWovI+RbTloEXCG39?=
 =?us-ascii?Q?jHdnbKgTQ1bEw95Sr5FQE0OWRthQtf8PORO1BTZfnCkxRytdnC3BYIwigiqN?=
 =?us-ascii?Q?PMIBXTyqf9UQQjYXUHf/Jv71KfTVJU6dYrvGTmQGwjkGIKd2rKi90Qpxa16p?=
 =?us-ascii?Q?GNnsg8/tRnOKjw6FUQ+ORp8dx+EF9xLeKdGK56pdA5WrkrG5Zr2H1yRZie6j?=
 =?us-ascii?Q?B4KuxUI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jugW0xQVpmKaMo/7sKPPrMd6AtZxZd2pE/+GV26cHX0TVuPjltAPWRdPtaUb?=
 =?us-ascii?Q?nS1Ty23qS+2Hpzfi/7jkhjJPmkZmTqf2vCxpcN/+mX1b5Evh6YNjaEOmm6NW?=
 =?us-ascii?Q?1TING14aGcazXOWhOpp8byIFFTBgscS80XvS70U22SMYRgKKz3C/SNqcIZ8b?=
 =?us-ascii?Q?QhuhsFxZE0FOVvAToGGhxjCKWOh+L39O9EM63YhEStb4jzbm5L0U7AbCuevU?=
 =?us-ascii?Q?V9bsFEqCth3ozc5yo19VmZgNo0gfFmF4rloJo3OV4jktrlW48oj8eTwnPcT8?=
 =?us-ascii?Q?rN+s4CBIQy/bIU/+Xs1GQrU+0q6yQcEwq1lwomFjetNQ8iITxYSVfQb2ICCS?=
 =?us-ascii?Q?jHGkvBrOJHLfvTelifsIio5gG3aPqMruF0Dl6rfhDAN1hpJedkMjmi4Xqfh/?=
 =?us-ascii?Q?fC7oFxJd0iFJ1K/t3bO7g+2WA+sRp9r+ianj1MhnB2/eCT9uhsmMM/gZ8XRk?=
 =?us-ascii?Q?MDm0fUKKXVQl75jW/h95R3/YV3L687bNwRuj6uDmjEafHRxWSuhW8QnjzHvD?=
 =?us-ascii?Q?WmXzO9we3wVArs44eE1/fFsJ5T2vcDnn8CpTVPCNzm2dTsAYo0Mituk4OYsR?=
 =?us-ascii?Q?y0/unZgHsBmaHDTMPYOjXYRa0Wp8zGmKlgKGuCjDaEThY/Ihap/jJZrX8jdM?=
 =?us-ascii?Q?DEQL/xjf7IU070MF66f+7PxM5arimnvl+qSK5oBvesYpsOuzsPckLnuHKs44?=
 =?us-ascii?Q?+TiA1I/SmlEedHGgHb7/po7XAv6Ppy00XBt9nEcC9Hs4Qgu/mnCKC03+fmyz?=
 =?us-ascii?Q?WALUaPxXpoKEZbVGEcdRWW8Jrgod9FffecraCNtBoovguUe/xWJdJcGSjoJA?=
 =?us-ascii?Q?rHweYzQp6A2dHMLma3UCN2Wm7OWPSnbEumzq8XhepBdRBZMUECZh9la6CVJz?=
 =?us-ascii?Q?KGIpHnjBQbTFNbEzqCtIp/oVHMkrj71d0Px+lLq4PPNjHorXBQJcvWTTtVvm?=
 =?us-ascii?Q?NBwnOxKfrACYt8shAa13N5OBiYZ06+9b9zDD6S//+oWteLlSg+JSB8d5dBTY?=
 =?us-ascii?Q?eH6ax1OdpeThbWjdY6EMiFHgHMbvsz6dW2004whHsEXEDKc5SD38ZqltHvAB?=
 =?us-ascii?Q?HE8Q9PUqSRpOaQmKdx0hu3IPkChqQ98aMU4sAAhM1JP5wWw9U0rsywZpFt5Y?=
 =?us-ascii?Q?G6LPhNUsFaWkeKTG6+zRtP3DV6fWGLS2/hDhtNmYXjS7qsC39ZPOG5oy/iLE?=
 =?us-ascii?Q?8p4QdKDMvElHqQkePmzymmnqD4tMYOLAnvPUqlwFbQcGhxUEIMUPEFUCzWJG?=
 =?us-ascii?Q?Is3gqTU+qmmZkuRPw3k/ZwM9vMLu6s1BNTLhxz8HfH7ohrgMB9Ra4hjvWv/x?=
 =?us-ascii?Q?8W9YdvAwlt9E/9WeeQBVWPMf5IVGttBK0Hb4haLXdNocIQOtnMDhmdYhmssr?=
 =?us-ascii?Q?r5CbNY6MYIgIeK9AtoiAIfrcWkDetNc1x76vYNwjL0xQKzyhZLbL9JotCKGT?=
 =?us-ascii?Q?kKMWnlaaaZLjGnH/DNVcW5F1tRKIf6Qvf0cfI8ktOSADaQ/z1f9yYKhe1C+P?=
 =?us-ascii?Q?PueGHvtdJ81bQNyvTqp6Q/bX9Z3Bho0MMM3+HWxeCsCDsg9OCbYv2E5boSoD?=
 =?us-ascii?Q?3CPWZfwQGrWaInW7OAspA1OA/rYK/EDHjyB1eZk2FuNKk4N+aRiA9fcwY4Ng?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab311670-6a89-4548-d403-08ddbe57cac8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 19:44:03.2039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAEub21t9bFKQvvEHaAki+VY7+rM8fRMeuA300CxZCohChMPDuMVFeCNp/qbAE11Dp3MZzagee2S4F/dl2nXVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7839
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

On Tue, Jun 24, 2025 at 06:52:21PM +0300, Ilia Levi wrote:
> Allow the driver to expose hardware register spaces to userspace
> through GEM objects with fake mmap offsets. This can be useful
> for userspace-firmware communication, debugging, etc.
> 
> v2: Minor doc fix (CI)
> v3: Enforce MAP_SHARED (Tejas)
>     Add fault handler with dummy page (Tejas, Matt Auld)
>     Store physical address instead of xe_mmio in the GEM object (MattB)
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  14 ++
>  drivers/gpu/drm/xe/xe_mmio.c         | 210 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_mmio.h         |   4 +
>  3 files changed, 228 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 6aca4b1a2824..22a567c5f0de 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -10,6 +10,7 @@
>  
>  #include <drm/drm_device.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
>  #include <drm/drm_pagemap.h>
>  #include <drm/ttm/ttm_device.h>
>  
> @@ -162,6 +163,19 @@ struct xe_mmio {
>  	u32 adj_offset;
>  };
>  
> +/**
> + * struct xe_mmio_gem - GEM wrapper for xe_mmio
> + *
> + * A GEM object for exposing xe_mmio instance to userspace via mmap.
> + */
> +struct xe_mmio_gem {
> +	/** @base: GEM object base */
> +	struct drm_gem_object base;
> +
> +	/** @phys_addr: The physical address of the exposed MMIO region */
> +	phys_addr_t phys_addr;
> +};

You can make this structure private to xe_mmio.c. For example,
xe_migrate.c does this with struct xe_migrate. Maarten also has a series
[1] doing this for xe_ggtt. I have series doing this extensively for
struct xe_dep_scheduler [2] and xe_gt_tlb_inval_job [3].

We should apply this practice to several existing structures in the
driver as well, but going forward, let's practice making new structs
private where possible to maintain proper layering.

[1] https://patchwork.freedesktop.org/series/139778/
[2] https://patchwork.freedesktop.org/patch/662188/?series=150402&rev=2
[3] https://patchwork.freedesktop.org/patch/662190/?series=150402&rev=2

> +
>  /**
>   * struct xe_tile - hardware tile structure
>   *
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7357458bc0d2..3298ab0f1fb4 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -10,6 +10,7 @@
>  #include <linux/minmax.h>
>  #include <linux/pci.h>
>  
> +#include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
>  
> @@ -408,3 +409,212 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
>  {
>  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
>  }
> +
> +/**
> + * DOC: Exposing MMIO regions to userspace
> + *
> + * In certain cases, the driver may allow userspace to mmap a portion of the hardware registers.
> + *
> + * This can be done as follows:
> + * 1. Define an xe_mmio instance that represents this portion.
> + * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able fake offset.
> + * 3. Use drm_vma_node_offset_addr() on the created GEM object to retrieve the fake offset.
> + * 4. Provide the fake offset to userspace.
> + * 5. Userspace can call mmap with the fake offset. The length provided to mmap
> + *    must match the size of the xe_mmio instance.
> + * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to release the GEM object.
> + *
> + * Limitations: The exposed xe_mmio must be page-aligned with regards to its BAR offset and size.
> + *
> + * WARNING: Exposing MMIO regions to userspace can have security and stability implications.
> + * Make sure not to expose any sensitive registers.
> + */
> +
> +static void xe_mmio_gem_free(struct drm_gem_object *);
> +static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
> +static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);

Should xe_mmio_gem implementation be its own files? I think that would
be better.

> +
> +static const struct vm_operations_struct vm_ops = {
> +	.open = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
> +	.fault = xe_mmio_gem_vm_fault,
> +};
> +
> +static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
> +	.free = xe_mmio_gem_free,
> +	.mmap = xe_mmio_gem_mmap,
> +	.vm_ops = &vm_ops,
> +};
> +
> +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object *obj)
> +{
> +	return container_of(obj, struct xe_mmio_gem, base);
> +}
> +
> +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio)
> +{
> +	struct xe_device *xe = tile_to_xe(mmio->tile);
> +
> +	/*
> +	 * All MMIO instances are currently on PCI BAR 0, so we can do the trick below.
> +	 * In the future we may want to store the physical address in struct xe_mmio.
> +	 */
> +	return pci_resource_start(to_pci_dev(xe->drm.dev), GTTMMADR_BAR) +
> +		(uintptr_t)(mmio->regs - xe->mmio.regs);
> +}
> +
> +/**
> + * xe_mmio_gem_create - Expose an MMIO region to userspace
> + * @mmio: xe_mmio instance
> + * @file: DRM file descriptor
> + *
> + * This function creates a GEM object with an mmap-able fake offset that wraps
> + * the provided xe_mmio instance.
> + *
> + * See: "Exposing MMIO regions to userspace"
> + */
> +struct xe_mmio_gem *
> +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file)
> +{
> +	struct xe_device *xe = tile_to_xe(mmio->tile);
> +	size_t size = mmio->regs_size;
> +	struct xe_mmio_gem *obj;
> +	struct drm_gem_object *base;
> +	phys_addr_t phys_addr = xe_mmio_phys_addr(mmio);

Can we just pass in struct xe_device *xe, size_t size, and phys_addr_t
phys_addr rather than xe_mmio? That would seem better than defining a
xe_mmio on the stack and passing this in.

> +	int err;
> +
> +	if ((phys_addr % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
> +		return ERR_PTR(-EINVAL);
> +
> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
> +	if (!obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	base = &obj->base;
> +	base->funcs = &xe_mmio_gem_funcs;
> +	obj->phys_addr = phys_addr;
> +
> +	drm_gem_private_object_init(&xe->drm, base, size);
> +
> +	err = drm_gem_create_mmap_offset(base);
> +	if (err)
> +		goto free_gem;
> +
> +	err = drm_vma_node_allow(&base->vma_node, file);
> +	if (err)
> +		goto free_gem;
> +
> +	return obj;
> +
> +free_gem:
> +	xe_mmio_gem_free(base);
> +	return ERR_PTR(err);
> +}
> +
> +static void xe_mmio_gem_free(struct drm_gem_object *base)
> +{
> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
> +
> +	drm_gem_object_release(base);
> +	kfree(obj);
> +}
> +
> +/**
> + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
> + * @gem: the GEM object to destroy
> + *
> + * This function releases resources associated with the GEM object created by
> + * xe_mmio_gem_create().
> + *
> + * See: "Exposing MMIO regions to userspace"
> + */
> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
> +{
> +	xe_mmio_gem_free(&gem->base);
> +}
> +
> +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
> +{
> +	if (vma->vm_end - vma->vm_start != base->size)
> +		return -EINVAL;
> +
> +	if ((vma->vm_flags & VM_SHARED) == 0)
> +		return -EINVAL;
> +
> +	/* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
> +	vma->vm_pgoff = 0;
> +	vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
> +		     VM_DONTCOPY | VM_NORESERVE);
> +
> +	/* Defer actual mapping to the fault handler. */
> +	return 0;
> +}
> +
> +static void xe_mmio_gem_release_dummy_page(struct drm_device *dev, void *res)
> +{
> +	__free_page((struct page *)res);
> +}
> +
> +static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
> +{
> +	struct drm_gem_object *base = vma->vm_private_data;
> +	struct drm_device *dev = base->dev;
> +	vm_fault_t ret = VM_FAULT_NOPAGE;
> +	struct page *page;
> +	unsigned long pfn;
> +	unsigned long i;
> +
> +	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +	if (!page)
> +		return VM_FAULT_OOM;
> +
> +	if (drmm_add_action_or_reset(dev, xe_mmio_gem_release_dummy_page, page))
> +		return VM_FAULT_OOM;
> +
> +	pfn = page_to_pfn(page);
> +
> +	/* Map the entire VMA to the same dummy page */
> +	for (i = 0; i < base->size; i += PAGE_SIZE) {
> +		unsigned long addr = vma->vm_start + i;
> +
> +		ret = vmf_insert_pfn(vma, addr, pfn);
> +		if (ret & VM_FAULT_ERROR)
> +			break;
> +	}
> +
> +	return ret;
> +}
> +
> +static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
> +{
> +	struct vm_area_struct *vma = vmf->vma;
> +	struct drm_gem_object *base = vma->vm_private_data;
> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
> +	struct drm_device *dev = base->dev;
> +	vm_fault_t ret = VM_FAULT_NOPAGE;
> +	unsigned long i;
> +	int idx;
> +
> +	if (!drm_dev_enter(dev, &idx)) {
> +		/*
> +		 * Provide a dummy page to avoid SIGBUS for events such as hot-unplug.
> +		 * This gives the userspace the option to recover instead of crashing.
> +		 * It is assumed the userspace will receive the notification via some
> +		 * other channel (e.g. drm uevent).
> +		 */
> +		return xe_mmio_gem_vm_fault_dummy_page(vma);
> +	}
> +
> +	for (i = 0; i < base->size; i += PAGE_SIZE) {
> +		unsigned long addr = vma->vm_start + i;
> +		unsigned long phys_addr = obj->phys_addr + i;
> +
> +		ret = vmf_insert_pfn(vma, addr, PHYS_PFN(phys_addr));
> +		if (ret & VM_FAULT_ERROR)
> +			break;
> +	}
> +
> +	drm_dev_exit(idx);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index c151ba569003..2990bbcef24d 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -8,6 +8,7 @@
>  
>  #include "xe_gt_types.h"
>  
> +struct drm_file;

With a private struct xe_mmio_gem, you'd need:

struct xe_mmio_gem;

Matt

>  struct xe_device;
>  struct xe_reg;
>  
> @@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
>  	return &xe->tiles[0].mmio;
>  }
>  
> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file);
> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
> +
>  #endif
> -- 
> 2.43.0
> 
