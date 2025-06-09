Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599AFC61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 15:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D95E10E128;
	Mon,  9 Jun 2025 15:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SB901rA9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09A310E09E
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 15:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749483891; x=1781019891;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jiDvYcDNNo+3WosTY/Q4GbROOUZm24nvmhN82yY+eis=;
 b=SB901rA958Oj5ZHMnZZ63SQTP7/EDVn3ZDKWEntpFb7bAXaP4zBtlxD0
 20bPBy4eGUjvq3W8AONh1d01nnnEA4spWoaIGsiD4UqdaqG4xMaT2+xiz
 fUbKgm9NehzviWMlKTD2Tk67QnjPLZFQHGPLzv1sDhugFM2lw+U5DQsw9
 16NBGerFe9aaEAFPjY6BNu7r6bfU3bQRfkyl0V4pRDW6IjChVcFN/N9rA
 Sg2nqCG0zF4PsS43pPRON5UmFsiqgjcN3S68rq8i8UDKgdqeYLp7zTRA5
 v/B0ehux27W2IXTE/MNYcNYqQhzBHj9LdRSF3Qy0YrWVE/vzXSelOMJ8K A==;
X-CSE-ConnectionGUID: nyukPpUZQyO+e3iiZ4TGrg==
X-CSE-MsgGUID: 6C5xaJFKQtWe6QGYPQV6PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51710532"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="51710532"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 08:44:49 -0700
X-CSE-ConnectionGUID: nRrX+5tSTPuLZBZwIjCfKw==
X-CSE-MsgGUID: DhXZNuUJTy2vnDco4ZcbRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="147486253"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 08:44:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 08:44:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 08:44:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.85)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 08:44:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aq+ZbaRbtFJUeCxcdNPzo+Hkr4EtOLHYH/9F9Rfzfu1jbMDcnCi2SiWPX+3SugdXTXrPacAy99yfuab2YQV0pTUmnNrToZLyVISmrsrmaVTuBQt7DaSz0Wx8Su8VfIlJifVqEntnZEoDXBYNLviyNx9l4+r+nS0GNk9zkTgK/XUsjwTD+G7dPznqQ4HCyuSSFIR7An8rdUs3IJSOlyFk3Td0IlFgRJZl16ST5A563H1sqBQgPq2QdCK4W4MQErrJaUcXZFil4qV+awfB8D8PqEUJ9fZG+P+l/k4JQtwvVPvZRdlkFW/vuZkKr9Pf3qN01Q+MLq/DnVr+HPUZBRT55Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgeTq91mB6e/wkRmIzqqAca8DySJnUE06LDQQkjSTzQ=;
 b=BQs8agfzNHUxCqzo4hq7q1RpY4Sd12kfUlxa91Y1QLITv5zgmzwK49eK2/Mchy4pmXqGxNYzC1Ie376IRWIejhd9wmfiNb7bagiBsQewCKmwxc6b6a8oCDw1gPFz2eHcXyDh0uD+QHEtSVHQrSx6xO9Vu53zuzLBWnzRompmgfOMFPxKK8uL9jq1Cq1LU0yz9ldoVhxDA1j1USPd3QuZfQR/xEcpTH82AumdEmwUtU9ix+0fozQlFDw6a5acZcdG+9E7WCrO8G5GoKohAf7W1vj7gMIC/Qx8HXMvVM3Q5A5PKC0SCPoTVNHGYogTKqaweZDVZTgNr47Rb4huL7BBXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7917.namprd11.prod.outlook.com (2603:10b6:208:3fe::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Mon, 9 Jun
 2025 15:44:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8813.020; Mon, 9 Jun 2025
 15:44:44 +0000
Date: Mon, 9 Jun 2025 08:46:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Ilia Levi <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <koby.elbaz@intel.com>,
 <konstantin.sinyuk@intel.com>, <yaron.avizrat@intel.com>,
 <moti.haimovski@intel.com>, <didi.freiman@intel.com>
Subject: Re: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
Message-ID: <aEcByyaKe82P91RT@lstrano-desk.jf.intel.com>
References: <20250609095938.16782-1-ilia.levi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250609095938.16782-1-ilia.levi@intel.com>
X-ClientProxiedBy: MW4PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:303:dc::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 145fdee4-cbf2-48e8-c56a-08dda76c8e63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cJU+aWGa+QxumQW6DQM0ms3YwLK6y43FeGCeY//f0hB/qdL+J1Z1gJ6hnRCt?=
 =?us-ascii?Q?xjMU+e/mdKxho9HzBe3/Ocae6QlvGEb0WGq8S1pptulPKjLalDWeBq+z7bZM?=
 =?us-ascii?Q?xZle4bNoLjk1eWrRJ/8vIseip+eO2eaIVtNJ92DS6Y2vyEyc9Vn48mL84Iye?=
 =?us-ascii?Q?/sRh4ZejMX+OzTmGsDoE/GY+d5VQQHWUfQ49z4MjIQnBnOejI8f3bSYyzBKG?=
 =?us-ascii?Q?Z9tCCFs1jj/OilWP6lXOrESMZemHRqDiVODgkU0zxqweiuenb0WcAeNYL5/p?=
 =?us-ascii?Q?haHPK6opm6lAjgxsKpkh3YIpOdWH9vAw5zpSXeJT81FPTbNIJ5Np9hhmmSc1?=
 =?us-ascii?Q?OrN13W1qE8WEYG743Hf0934m6phVpEShDYjEf+gOgBiqwDbYElA71yXKUcL2?=
 =?us-ascii?Q?A7iZECNKKWoMhTxSasY5/C30TwiKS6bMTxo2QLFjkMPgqA83HyL70WIzP1Lo?=
 =?us-ascii?Q?p1UiCT0WRI8n6Udqysis3Ch1OFjV+z/+2vlXEwIog8Mpxi92ydRKQoMKmNWw?=
 =?us-ascii?Q?/huzy+aDx7AWvqZdyRnnxRJR2q/A2TMn716rf7t+rdP9Zu6tS7VAMAeTAmSQ?=
 =?us-ascii?Q?QpSoUFeFZgNH6bKG/vlmPbEnsfRhsWa9md4oBHkhNjrfvNJUqmuQH9V64wdM?=
 =?us-ascii?Q?VXYD5beYJVi6pIYI2SG5ZSwL0nxj9bN+9Q5UYY34hvhG3jP6F8eveE2q7Tj/?=
 =?us-ascii?Q?as0QnaHBKknsy6J9DdZqwNhoK9Ujto8ctpskigMQFdnN6n4SyoCCeKfYHsyj?=
 =?us-ascii?Q?IPKe6Z57g1k2xM1iJ/SynNoOvTUbCnwuUc+I90gy7JJXOMMae6VwOqw6UED+?=
 =?us-ascii?Q?q1e3H1KDSNTN6sMm0tSYlxFoveOMw/ejQM6ZmAu+sBjbPkEvyRjs7nslDIQs?=
 =?us-ascii?Q?1RTg/EFbXDbntG1RJokq1tutp8mBuFoxzF3bZpKOhlxnxOG6TkDOXn68S/8h?=
 =?us-ascii?Q?Omm0VaYuUNDBct+xxb8S7HsQd9ELoE2ReKP+sFyhodAIZ5C6ylBzymvotHwg?=
 =?us-ascii?Q?FlQWMX3ckCTAQjOnG3BRWxNNZTy20SVm3i62IAYCD4zLJRiEF+qNheof/qFa?=
 =?us-ascii?Q?//lzPrRLlQ+FH80sDu/KF3zkJuDH0aH69gIoStoj8SdzOnYbTqsWR/AMZdrX?=
 =?us-ascii?Q?s5uQEvaR2RsTWR3N8UkShiYlMwxT2IlchOZrUpkjZyHUxRBaoy8iPmMagXXR?=
 =?us-ascii?Q?hGRZLHIi0F7Pme/9eT9bkShfZKOTSL7HVtOkg2ydNy8txOOUhKOSnx2p+0GD?=
 =?us-ascii?Q?0kxgBd6FX1P9iCEY+2Ai0r1nJB1CJ/Z/g8pQgl9tbCGuvqdFsSDNsOW+64dJ?=
 =?us-ascii?Q?QSJxcNnK2VnVomG5bZYG5Z701VunpvZqlBBqoyb4hpvefljx5hvlj7FYfIMV?=
 =?us-ascii?Q?dgM8zmRwzCnO6lIWqemWN/fn1BKMxIF36Hx6mKwVmSczxhVD2IM+CdeZxYIx?=
 =?us-ascii?Q?Y2/baNgAOPY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?487rT7TIAWK52w9O3r6VEQT9HjNrcVXmSDbtL86+uu7Sy9wjS4nS1qyROcfK?=
 =?us-ascii?Q?eOkOi5mFnSoqoFKKbwALCNP2DQbCteb1vYL2qLYmEK/4hOTLlXf3205b+VXD?=
 =?us-ascii?Q?KHWuRU7sbxF9S+/dclE4m9nRMYpSoZU+gLYQfI8LTQVAQRwSiuFyU5x0ygUb?=
 =?us-ascii?Q?J+Ng79ib8KnOv9tIx9Agg5dhQJp9k5mVRUexNJ2ACBm9BxjMQFZdL5OhQ8+A?=
 =?us-ascii?Q?Ty8rPd56GaLD/E5XL0N4toQEXMlGqAYiydvlIoRKHRCM5fY7UPVRRKzUp3og?=
 =?us-ascii?Q?QpnUtQXfDVSJAR+JuUG4kOnPbS5KWVAiftzQFRxYiF+czCzd/qsKaX3jzZ10?=
 =?us-ascii?Q?1c/xC6xr+yXjHKQiDSX8Cx001zK3MeGQ4bsjewsOCioOsHfgTfeJPN75loa9?=
 =?us-ascii?Q?yTZROaKushfGK8chOHoR1q2rXqRRMjx/SuVO3wsJ08i7zJOKxSofImXlDr4H?=
 =?us-ascii?Q?hVe9YofNnYWP/xcLVV0U3WqNsvzFMAugsr1zAIIT9n5WQYllR6KVvplsAyvZ?=
 =?us-ascii?Q?lXXTUfsQQudULmKsLPL+6D80I1YZLtMvH+pUeau3NK6njdAB2sOO2CjNs7oD?=
 =?us-ascii?Q?4yIeS2rtRIc6nmUaX7/q48d81Gp27oDnJj2P39YUX2LSlGPyE7hexFzXinw6?=
 =?us-ascii?Q?QzDFqVVpT4irXc4qByFRvbenhbT7HZ0q2FkzpBtmPyH5Mn7kcO/vk91fWzRk?=
 =?us-ascii?Q?y4wWeT9XRbhCzSffZOSdnLGYyQoOvIeGxUbS1nMhezL8j418y+I3MU6OKL9A?=
 =?us-ascii?Q?aHCQyYXhbeGCI/g6oKe7kJQD3WcFdi8dmS7H287F8gneapr89CIbQq8/QWDi?=
 =?us-ascii?Q?3EyGMQKpeyyqgnr4amEiqDiZ0HqD3hZ2La14VqrvAzVqPMToCBw9VhWIog0e?=
 =?us-ascii?Q?4JtA7F9inaLzr+Exjkh9cEgsMA+mdNpQ8kzG8rA7HNY6sV2V7E3EM1hdD/Ar?=
 =?us-ascii?Q?fzEC2hczgQLCLkboKwJkb/A/UO0B0hcr7RKjrIJEPM7Q8h3v9WrE4PjWB3kS?=
 =?us-ascii?Q?woDHPyzaDEm6Nzl813KISI+Z/Gl0dfXdv289dSzPYZQ/EAaAaJ44/harLUW0?=
 =?us-ascii?Q?W76y3x3nBCk0d4b3R3Zb8ho2dS0UoH/MkfcMrfw4uThya3nfITTKlSQl9cLD?=
 =?us-ascii?Q?KdR+kn2fj2w1otz/QLTNAimtHIit0mvtMUXv8OFMLZEIbShUimrtVv9ymuOg?=
 =?us-ascii?Q?qUGQNFLZVDgMMCIJujexor+kMepHursMURZw7tfK/YQZz8G1J5h1dv74XOYU?=
 =?us-ascii?Q?/IGckrY2/1tZp9BvG2HbGTT71Q/rmt1zufuYjo+qRHnNxa7w9y0TMz9M3APo?=
 =?us-ascii?Q?ntcoQo3NH2PLmqHrse5s9TRvjIocYcSgK/s8nwApduRYAw82X+OArzeUgfjd?=
 =?us-ascii?Q?NaAJHDCxViBhKSwSf8EY5cSIVQ+mefEZs1Eo3sN8JnON25OjXfAVdsJz9qdl?=
 =?us-ascii?Q?Ia8QA6OM0xU8Y35LzGoffcIPh67Qk/fTRakIimd2WpxBDEsZTKhRLlNLDR+O?=
 =?us-ascii?Q?DT/8Jnep0YuWpPVLyCXA5z9pd9SGTokSirw4Mbuyz4i4nNwMo8PVWXNaPfeQ?=
 =?us-ascii?Q?ipZz77RdBeD5QKqeA0VCwCy3MQclsI8k2vMVFwwQ8JdyAQHVNJ2U1RXBcvM5?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 145fdee4-cbf2-48e8-c56a-08dda76c8e63
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:44:44.4934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PaE4+ml4VjddrgC2Wf2PxjrqLTx3IMVmyG8JXhqB7nhe4NZ8mHFuWow7J1cLoeXGCREf6GPmBhAvwh3qPiozww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7917
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

On Mon, Jun 09, 2025 at 12:59:38PM +0300, Ilia Levi wrote:
> Allow the driver to expose hardware register spaces to userspace
> through GEM objects with fake mmap offsets. This can be useful
> for userspace-firmware communication, debugging, etc.
> 
> v2: Minor doc fix (CI)
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  14 +++
>  drivers/gpu/drm/xe/xe_mmio.c         | 142 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_mmio.h         |   4 +
>  3 files changed, 160 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index ac27389ccb8b..78542de0d48d 100644
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
> @@ -161,6 +162,19 @@ struct xe_mmio {
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
> +	/** @mmio: The MMIO region to expose */
> +	struct xe_mmio mmio;

Any reason not this is not a pointer to xe_mmio?

> +};
> +
>  /**
>   * struct xe_tile - hardware tile structure
>   *
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7357458bc0d2..6bfa915a9602 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -408,3 +408,145 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
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

This is no secondary issue, it is a primary one. There is no way we can
expose entire PCIe MMIO register space to a non-root user (a root user
itself can just mmap the PCIe MMIO bar bypassing the XeKMD if it wants
btw).

What is the requirement for this patch? I know on other PCIe devices
I've worked on we had similar issues where we needed to expose a subset
of the PCIe MMIO register space to user space for kernel bypass
submission - everything we needed to expose in that case was 4k aligned
+ tied to a single process via a KMD config before mapping to user
space. I suspect to do anything safely here, somethine similar needs to
be done.

Matt

> + */
> +
> +static void xe_mmio_gem_free(struct drm_gem_object *);
> +static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
> +
> +static const struct vm_operations_struct vm_ops = {
> +	.open = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
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
> +	int err;
> +
> +	if ((xe_mmio_phys_addr(mmio) % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
> +		return ERR_PTR(-EINVAL);
> +
> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
> +	if (!obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	base = &obj->base;
> +	base->funcs = &xe_mmio_gem_funcs;
> +	obj->mmio = *mmio;
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
> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
> +	struct xe_mmio *mmio = &obj->mmio;
> +
> +	if (vma->vm_end - vma->vm_start != base->size)
> +		return -EINVAL;
> +
> +	/*
> +	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
> +	 * whole buffer from the start.
> +	 */
> +	vma->vm_pgoff = 0;
> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> +
> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
> +		     VM_DONTCOPY | VM_NORESERVE);
> +
> +	return remap_pfn_range(vma, vma->vm_start, xe_mmio_phys_addr(mmio) >> PAGE_SHIFT,
> +			       base->size, vma->vm_page_prot);
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
