Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266B5C02196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 10:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C728510E251;
	Thu,  6 Feb 2025 10:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TgSZQk20";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77CD10E251
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 10:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738838035; x=1770374035;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PCa332sjptvzndfSkJ+xdlN+fTfycFfN2uO2LOxshyQ=;
 b=TgSZQk20GzUTzf5FVS+WEzVFmReskSHfG3cP+wBm+a+dYNCNAYgo0cXc
 Bsix48GyS4c61U8VOQldU/NVkT3d6Omd23ZnFRhkOdfRa4uzneub4IsXz
 D6VTlZV+Rykv3W/wl4JCVgDtetDR6T4ioZjSqdAtGIeK8Mq1p6ZEruDkh
 KA9CmkbfmUPw0RXMyA8NEY76Y0W9zPnRxkOcxTOSasTh+JjsqxXog33l5
 oIlBiVjdVJK0B7uUxJC2KQcJ83xxVDaodpPkdUdcRk13O6EJRnNmcK946
 8QhwSfMUCUNK7RevPMzz8O9LhufTHTIq6HrZX1X42znXUjouhRCfx+ObJ w==;
X-CSE-ConnectionGUID: 2UWBC1oHSOSmAvN1OLCuPQ==
X-CSE-MsgGUID: GruxwJMoT1uVP8lOJwp8vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39308765"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="39308765"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 02:33:54 -0800
X-CSE-ConnectionGUID: erjbQX8iRPeeEmJ7lCwJTA==
X-CSE-MsgGUID: uJdL7uasQXWlpjU5kgA9VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115257803"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 02:33:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 02:33:53 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 02:33:53 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 02:33:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qi1zBHJ1TriKPOMkq5hS8xU5iveSKTEoCKUoGPAhAn81Kq/FOgCMEskQl6HzD3tdM4rvRZ/qlm52sZyT2iD4UuHN/2AOxTSGv2bIX4O7uNN6PJYw6jqgx3x+GMB5SxgX2uwhSDVDWoT7V8li/uhGBn5h4h7NGvQRU3FiMAT3xKkmitbpShMTw5MZTsPHaWhiH4G0VzzIoiJvcmt5gRpVUojnP/34Hy0f7hF/zORo/972/J52BU0eRypkYozAFd5ErTiL9R3PDg7ITApIK6CmNH6SlckHd8cB5auGY32yWjX+8d1vANJWBQKpZUXzlWs8k5JQTHvpzEfKdguUN8y85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kR7+a90XXXuKCa3T8PnL3iCTmTv4PQWVOpeySHM7QLU=;
 b=o6MYbn6AbLqmMPWfqOwXq67aICifj0WuhNboaTW+JBlP5ecf5cfMAm5M+H7ocMQv7kg32t80LixuXDQ49cbhLjQzfCton7AukoVKmJHma0cD+cX+Z5sVwXsk0lrMK6RgyeIJJ0tb155Ink5cVNxRWa9vbR664g14tlkT/iH5DXo2Gbay21EfciRwjCY1lXXP3ajngZk22v98uVHmXO26YNWS1lGdg0C3OcfsHo0ndC8/vXgDkgLgkYvHaVyFCF3+ldYXGFT/gVFJuUbytcr++WYHBSBQ6ekiHFkFhgzKOoq0QKtTDnK4kSeNlgKSvlXGphh9S0UV3eND+Dkc2dorgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7360.namprd11.prod.outlook.com (2603:10b6:8:136::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 10:33:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.011; Thu, 6 Feb 2025
 10:33:50 +0000
Date: Thu, 6 Feb 2025 02:34:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <Thomas.Hellstrom@linux.intel.com>,
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
Message-ID: <Z6SQSHJQL+M8FvA2@lstrano-desk.jf.intel.com>
References: <20250204184558.4181478-1-oak.zeng@intel.com>
 <20250204184558.4181478-2-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250204184558.4181478-2-oak.zeng@intel.com>
X-ClientProxiedBy: MW2PR2101CA0004.namprd21.prod.outlook.com
 (2603:10b6:302:1::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: 310f4a1d-5feb-4c37-bdca-08dd4699bec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iUu9KZ56jqA0NRcOsiGwQT3anMWCP9Sqr5FEPMh4/85T6v8OZWyyd3vkI/8f?=
 =?us-ascii?Q?HIg+T0iH7gNe/hQb9aedFMt6MPlpHMjgvB7LlFDCaokTS9+7F4aG/mx1XEfC?=
 =?us-ascii?Q?zCPvswUUZ4W9pwJQCGwQ1H/z7rOKoXR74KnlXLgHem8RGJAExdllll3lPWwx?=
 =?us-ascii?Q?SbHzWbG3n4gutk7DH909jN57zkzcmqfkSK8kZnRZyelJi36LRCZWUloVxAzC?=
 =?us-ascii?Q?x/fdS1qJWyfrNKZpALtCQzBEN2Snp+TvDei5d+CymezkJlcTnXkTHzsjLsza?=
 =?us-ascii?Q?pWg/cXy2CdKD4yuqZ52DAkzXRB3GdAB/DM1mJky91xHRTiK5bXjzVvcxk28y?=
 =?us-ascii?Q?QhJgMTPApHD05TEPJo+zUEQpZpQOBGvHzEpmb3S+3efIkSBxRk2K23NSF14W?=
 =?us-ascii?Q?QcFBxI4boYncjOia3C2dMay0+9y7AuiW0D3owmxEsHnLZ/uH37qiqqeHj47x?=
 =?us-ascii?Q?xxv89F+WVMWI1PBL9CkGDsUU1g8G4NzDJmgNpKqsXNKqR+aK1rUQUEsD0ZEa?=
 =?us-ascii?Q?gX3F1zB5H19ZMx8AkLvy4x5B9Gc3nLEMWvvR1aQWj4T5XUG2Ejiol/ABoqO6?=
 =?us-ascii?Q?+3rMWE7GmKm91T3JpuHfDe3c+ufslWARO380TJaXluxkd9VSDzPrf87VkyXQ?=
 =?us-ascii?Q?WBASnK16uv0tJlD5MeJ6xoD9Xm+TkgzBaBVP6sCI0zRvnzakA+eKiF56oCdm?=
 =?us-ascii?Q?h3SjBW+ngwL9WNn0TB9F4J6V/EO3b20ndp7cynHfwhpzbZ4ZhPhAq00ulwHG?=
 =?us-ascii?Q?tOx9nejyuWnYG8L2EC4/qdavO/1q3qGKRQPRmBEnrkPmcXmPODpW69BmeTio?=
 =?us-ascii?Q?a9+VbM7RtZvcwm8TbJczwlDaV4Ufhoo1/hbmMSZ6gdc1PRAnNdZPch9sJY5D?=
 =?us-ascii?Q?XtiLmiZrVjyO4g0JCR3LjuXIOTUSeJLujEX/dgT58qNSgeFnOmIDvkbKwNqQ?=
 =?us-ascii?Q?SglqQLyuAdNg8E0JqQqgJj8EBoDgHBZS8Et+5YuK2CTTVEtm2PMTBOPROnEw?=
 =?us-ascii?Q?RQXPQrrEh9WPBpodItlR6ZB7R4tPuNtsemynpQCbiDc2TzsfQ02Wc+OHO56l?=
 =?us-ascii?Q?EG6I488RxuSVynsMXOF1b2BSMetvjuyJ5468oojYKckQqDLm4PiMgr9nqVzt?=
 =?us-ascii?Q?V5oQbxuaCEbzdG6OQ+LrOzCKpUihp5zFuNofkBZ0/hUSpSL+KVOQkCRK9MYu?=
 =?us-ascii?Q?1dcG5jvGNp/1ikZEO1dnqha00/izc+O+BO3lmMQWc5cxySc/lgjGSr2FTvB3?=
 =?us-ascii?Q?w1Te1Lq5kBgkH06z8qsVAb+BeXxkThqXV081hyz9WOn9+fdnGH0mjJ4qMWOT?=
 =?us-ascii?Q?Y9G7G3E0UgAxXqU+0g0RBQiYAqiTQIX3l436V09j0os8LNt7gWGkoVbRJiW8?=
 =?us-ascii?Q?UUJrv3ce68mgiV5zXS5BmbpBZmQa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AR0tZTd8Ol3NbR7bGg4t7ys8MWP2tuYyZDu+QfbT5yhv2SHRbPklvV1IiKEW?=
 =?us-ascii?Q?5sP//yQG5+GfDQl3jbcebM1IYWQuapO/DbO3KAetIXCNLJugpvmTkZVxXnTG?=
 =?us-ascii?Q?UddV0C3hWoz1aq88Pe/McY3e4w1CFaWp9R1hthih2gEaW2anOIZh8890FDu6?=
 =?us-ascii?Q?NXp9//1Oma2Wz08ukTFyvsYzsnNaHSRbvfO8LDvZgGyT2bskBVkfgYRZlTm7?=
 =?us-ascii?Q?tOaKGxxQGYPNkuqBCpikd1Fwh5SV1DB7FbJM6mlQTNJn4RbFTB4Giucx9RBm?=
 =?us-ascii?Q?Mz2Yo0/SL2y2MokriOA5Fn96t22vsuWuWdNo6r5RqFTMjrXgDLuAPo6yOWAx?=
 =?us-ascii?Q?5cQ8BJZVNjtJnAnOPY6EaDrfNyNDXlNj2X1/BrSJhqZrj36nAuvn48w/Kvp1?=
 =?us-ascii?Q?MMMgbxbEHeO3F6Yczg7yaxk4tOXUrJGCGIHBWngKmR7u15QUeNYVkAq0m6mD?=
 =?us-ascii?Q?7IL6dbQVtFSNbBGbvdZiScC3NSnq65o8ABqliduqJ1MTM001JMcnhFwuYOEt?=
 =?us-ascii?Q?wLjKznPrPrse9TZt+X6i7I/KBa4MoGwFSlAWVzr1JNMjpqmb8zUU8j0Hnk+E?=
 =?us-ascii?Q?FLCc0s18L9z8WBjfOGXcpoMXNLLKx08JBuOpKwPwHveRtxqsRkMOs8xaccPz?=
 =?us-ascii?Q?JgNjmh07DMlwSXZaf7oOc/zFuMlni3+iKTfAbbYhErbgvc2uh8QX75hnnxft?=
 =?us-ascii?Q?2SVW3rgN4jZiHlG8f8ixbm2JiEwpWXeZDH5e1xJ8IQwkpsuFoRvYvWs3hZ4A?=
 =?us-ascii?Q?67YxM/Cs3k2pGNj0v3ge9CQkr5LRkuvMokt5LfoPCaBrgLFUFVTnTmbHyg3f?=
 =?us-ascii?Q?mokN7NEWmr17FZDxSeu2mObPxrilWrjmXxp7XiRyDT1WTXTZRkK6tIxhGPtg?=
 =?us-ascii?Q?rHeuTbytg7MxH2KmXsUu8PiwFb52NHb/xHph95Kt4XwmcWMWyY7sU4/j1X+U?=
 =?us-ascii?Q?VKy8s4KTCA15diqNHd0x+3fkDXE2TJMx5cCr5dtcdaVsMz+ilQBUURc2qt3G?=
 =?us-ascii?Q?bNObncS04zV9BfdATc+TKlZGDdqez4VlbNS1f4f4jbRwm4KN77R3YEWrbzUC?=
 =?us-ascii?Q?WVdnAoquiACPf0426+tc468mk8deJb3R2xyawKCI01balkftlCFumHSjDd0X?=
 =?us-ascii?Q?zLt36YKWuqy117c4EyQPfonCnqoOYk1gqgCiiI93bA1SRSzmthaPm0Ef/8gu?=
 =?us-ascii?Q?Gkpnw8//DHyPql1P9fVP12ej61JhewLhrMzh0TKcOtSOptUs8fJ+0QEBFWlL?=
 =?us-ascii?Q?bnUxxlDJxc9+rX5OvuIJ2/nrbLW6fhyPvVz3Vxzj3uoO0NqRZutas5V3Kl74?=
 =?us-ascii?Q?2vm37hDVJdGsrz0HL/dMPnngtA+b4e04J3BJvEzbhdk3NP8VgrGp4B//kLOr?=
 =?us-ascii?Q?NGWJiJxdu5oq4JWnK+NiDBosHahcevMFsvxRQQByjWr50WlKEw1+YBDOEg3b?=
 =?us-ascii?Q?BYh3gCTbMcJovCGkdX9UU4JEegKmbOcSy04M+BBkoBI9HPJNiD2EzLBHMyH9?=
 =?us-ascii?Q?4JS8bsSAtqpp6Ft63tlOEJyBCUTOj7f+uHxudCH5YBtNQDpnIHQ1lvzZBtj3?=
 =?us-ascii?Q?hBgV9sGuHU4SHpaIHOxtO9n8UdOgIDrP5MuYArwDcDPr8w70SQf449969mk3?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 310f4a1d-5feb-4c37-bdca-08dd4699bec4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 10:33:50.2925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /M3msG20L8ILwk3vEEb/owN/WwvnVEdSF9fFqPLAFJM9bvZP4cFKo2Gazrq6PNxwo/CwgM3X5SpE8MpwSlDJpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7360
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

On Tue, Feb 04, 2025 at 01:45:57PM -0500, Oak Zeng wrote:
> When a vm runs under fault mode, if scratch page is enabled, we need
> to clear the scratch page mapping before vm_bind for the vm_bind
> address range. Under fault mode, we depend on recoverable page fault
> to establish mapping in page table. If scratch page is not cleared,
> GPU access of address won't cause page fault because it always hits
> the existing scratch page mapping.
> 
> When vm_bind with IMMEDIATE flag, there is no need of clearing as
> immediate bind can overwrite the scratch page mapping.
> 
> So far only is xe2 and xe3 products are allowed to enable scratch page
> under fault mode. On other platform we don't allow scratch page under
> fault mode, so no need of such clearing.
> 
> v2: Rework vm_bind pipeline to clear scratch page mapping. This is similar
> to a map operation, with the exception that PTEs are cleared instead of
> pointing to valid physical pages. (Matt, Thomas)
> 
> TLB invalidation is needed after clear scratch page mapping as larger
> scratch page mapping could be backed by physical page and cached in
> TLB. (Matt, Thomas)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>

Given the complexity of the VM bind path, I think we need an IGT posted
with this series before merging as I suggested in v1. Without it, it
will be fairly difficult to ensure correctness by reviews only.

Matt

> ---
>  drivers/gpu/drm/xe/xe_pt.c       | 66 ++++++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_pt_types.h |  2 +
>  drivers/gpu/drm/xe/xe_vm.c       | 29 ++++++++++++--
>  drivers/gpu/drm/xe/xe_vm_types.h |  2 +
>  4 files changed, 75 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 1ddcc7e79a93..3fd0ae2dbe7d 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -268,6 +268,8 @@ struct xe_pt_stage_bind_walk {
>  	 * granularity.
>  	 */
>  	bool needs_64K;
> +	/* @clear_pt: clear page table entries during the bind walk */
> +	bool clear_pt;
>  	/**
>  	 * @vma: VMA being mapped
>  	 */
> @@ -497,21 +499,25 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  
>  		XE_WARN_ON(xe_walk->va_curs_start != addr);
>  
> -		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> -						 xe_res_dma(curs) + xe_walk->dma_offset,
> -						 xe_walk->vma, pat_index, level);
> -		pte |= xe_walk->default_pte;
> +		if (xe_walk->clear_pt) {
> +			pte = 0;
> +		} else {
> +			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> +					xe_res_dma(curs) + xe_walk->dma_offset,
> +					xe_walk->vma, pat_index, level);
> +			pte |= xe_walk->default_pte;
>  
> -		/*
> -		 * Set the XE_PTE_PS64 hint if possible, otherwise if
> -		 * this device *requires* 64K PTE size for VRAM, fail.
> -		 */
> -		if (level == 0 && !xe_parent->is_compact) {
> -			if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
> -				xe_walk->vma->gpuva.flags |= XE_VMA_PTE_64K;
> -				pte |= XE_PTE_PS64;
> -			} else if (XE_WARN_ON(xe_walk->needs_64K)) {
> -				return -EINVAL;
> +			/*
> +			 * Set the XE_PTE_PS64 hint if possible, otherwise if
> +			 * this device *requires* 64K PTE size for VRAM, fail.
> +			 */
> +			if (level == 0 && !xe_parent->is_compact) {
> +				if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
> +					xe_walk->vma->gpuva.flags |= XE_VMA_PTE_64K;
> +					pte |= XE_PTE_PS64;
> +				} else if (XE_WARN_ON(xe_walk->needs_64K)) {
> +					return -EINVAL;
> +				}
>  			}
>  		}
>  
> @@ -519,7 +525,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  		if (unlikely(ret))
>  			return ret;
>  
> -		if (!is_null)
> +		if (!is_null && !xe_walk->clear_pt)
>  			xe_res_next(curs, next - addr);
>  		xe_walk->va_curs_start = next;
>  		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
> @@ -589,6 +595,7 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>   * @vma: The vma indicating the address range.
>   * @entries: Storage for the update entries used for connecting the tree to
>   * the main tree at commit time.
> + * @clear_pt: Clear the page table entries.
>   * @num_entries: On output contains the number of @entries used.
>   *
>   * This function builds a disconnected page-table tree for a given address
> @@ -602,7 +609,8 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>   */
>  static int
>  xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> -		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
> +		 struct xe_vm_pgtable_update *entries,
> +		 bool clear_pt, u32 *num_entries)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_bo *bo = xe_vma_bo(vma);
> @@ -622,10 +630,19 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		.vma = vma,
>  		.wupd.entries = entries,
>  		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem,
> +		.clear_pt = clear_pt,
>  	};
>  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>  	int ret;
>  
> +	if (clear_pt) {
> +		ret = xe_pt_walk_range(&pt->base, pt->level, xe_vma_start(vma),
> +				       xe_vma_end(vma), &xe_walk.base);
> +
> +		*num_entries = xe_walk.wupd.num_used_entries;
> +		return ret;
> +	}
> +
>  	/**
>  	 * Default atomic expectations for different allocation scenarios are as follows:
>  	 *
> @@ -981,12 +998,14 @@ static void xe_pt_free_bind(struct xe_vm_pgtable_update *entries,
>  
>  static int
>  xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> -		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
> +		   struct xe_vm_pgtable_update *entries,
> +		   bool invalidate_on_bind, u32 *num_entries)
>  {
>  	int err;
>  
>  	*num_entries = 0;
> -	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
> +	err = xe_pt_stage_bind(tile, vma, entries, invalidate_on_bind,
> +			       num_entries);
>  	if (!err)
>  		xe_tile_assert(tile, *num_entries);
>  
> @@ -1661,6 +1680,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  		return err;
>  
>  	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
> +				 pt_update_ops->invalidate_on_bind,
>  				 &pt_op->num_entries);
>  	if (!err) {
>  		xe_tile_assert(tile, pt_op->num_entries <=
> @@ -1685,7 +1705,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  		 * it needs to be done here.
>  		 */
>  		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> -		     xe_vm_in_preempt_fence_mode(vm)))
> +		     xe_vm_in_preempt_fence_mode(vm)) || pt_update_ops->invalidate_on_bind)
>  			pt_update_ops->needs_invalidation = true;
>  		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
>  			/* We bump also if batch_invalidate_tlb is true */
> @@ -1759,9 +1779,13 @@ static int op_prepare(struct xe_vm *vm,
>  
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> -		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> +		if (!op->map.immediate && xe_vm_in_fault_mode(vm) &&
> +		    !op->map.invalidate_on_bind)
>  			break;
>  
> +		if (op->map.invalidate_on_bind)
> +			pt_update_ops->invalidate_on_bind = true;
> +
>  		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
>  		pt_update_ops->wait_vm_kernel = true;
>  		break;
> @@ -1871,6 +1895,8 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>  	}
>  	vma->tile_present |= BIT(tile->id);
>  	vma->tile_staged &= ~BIT(tile->id);
> +	if (pt_update_ops->invalidate_on_bind)
> +		vma->tile_invalidated |= BIT(tile->id);
>  	if (xe_vma_is_userptr(vma)) {
>  		lockdep_assert_held_read(&vm->userptr.notifier_lock);
>  		to_userptr_vma(vma)->userptr.initial_bind = true;
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> index 384cc04de719..3d0aa2a5102e 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -108,6 +108,8 @@ struct xe_vm_pgtable_update_ops {
>  	bool needs_userptr_lock;
>  	/** @needs_invalidation: Needs invalidation */
>  	bool needs_invalidation;
> +	/** @invalidate_on_bind: Invalidate the range before bind */
> +	bool invalidate_on_bind;
>  	/**
>  	 * @wait_vm_bookkeep: PT operations need to wait until VM is idle
>  	 * (bookkeep dma-resv slots are idle) and stage all future VM activity
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d664f2e418b2..813d893d9b63 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1921,6 +1921,23 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>  }
>  #endif
>  
> +static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
> +{
> +	if (!xe_vm_in_fault_mode(vm))
> +		return false;
> +
> +	if (!NEEDS_SCRATCH(vm->xe))
> +		return false;
> +
> +	if (!xe_vm_has_scratch(vm))
> +		return false;
> +
> +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> +		return false;
> +
> +	return true;
> +}
> +
>  /*
>   * Create operations list from IOCTL arguments, setup operations fields so parse
>   * and commit steps are decoupled from IOCTL arguments. This step can fail.
> @@ -1991,6 +2008,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>  			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
>  			op->map.pat_index = pat_index;
> +			op->map.invalidate_on_bind =
> +				__xe_vm_needs_clear_scratch_pages(vm, flags);
>  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>  			op->prefetch.region = prefetch_region;
>  		}
> @@ -2188,7 +2207,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  				return PTR_ERR(vma);
>  
>  			op->map.vma = vma;
> -			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
> +			if (op->map.immediate || !xe_vm_in_fault_mode(vm) ||
> +			    op->map.invalidate_on_bind)
>  				xe_vma_ops_incr_pt_update_ops(vops,
>  							      op->tile_mask);
>  			break;
> @@ -2416,9 +2436,10 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> -		err = vma_lock_and_validate(exec, op->map.vma,
> -					    !xe_vm_in_fault_mode(vm) ||
> -					    op->map.immediate);
> +		if (!op->map.invalidate_on_bind)
> +			err = vma_lock_and_validate(exec, op->map.vma,
> +						    !xe_vm_in_fault_mode(vm) ||
> +						    op->map.immediate);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 52467b9b5348..dace04f4ea5e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -297,6 +297,8 @@ struct xe_vma_op_map {
>  	bool is_null;
>  	/** @dumpable: whether BO is dumped on GPU hang */
>  	bool dumpable;
> +	/** @invalidate: invalidate the VMA before bind */
> +	bool invalidate_on_bind;
>  	/** @pat_index: The pat index to use for this operation. */
>  	u16 pat_index;
>  };
> -- 
> 2.26.3
> 
