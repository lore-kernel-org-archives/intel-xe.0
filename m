Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE11C87FCE
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 23:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5088A10E054;
	Fri, 25 Jul 2025 23:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wx0Ya/JM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C380C10E054
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 23:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753484602; x=1785020602;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HXDtQHBmse8WuxyB59GKUSPMOJVEHz7veT7mMyOkOEc=;
 b=Wx0Ya/JM6bL7RzV/ZoAAA9ns+8DVTjNy49sWsbx7bbv3CZB8QdlG6rPG
 Fl7JNZYKRDueySraDyEQLG55VPaPhYpvdlTjaOdGj3SA1MKqPJaIoNnQ0
 Ulu/yQvyfPWu8y/efqIhAuyI0fyRXNk9C2gHpz0chG0qPwg4fLCTG3imj
 MoJvk4XrR9oIcyo3y57Z/DzrL5hF9s6uKW4EIlXgzuxxZkt98SdzQTu5o
 8cWtAroALCgj3GG/ilRiatR5uXZYKqgZdMUx2LKxjgHlACuuCtNauD8yc
 tWKGhuaFdi5W/Z0EqZlaK0gW1+bssn1ZbPWm/uVCLvaAvqzCWpaPUq8Jl A==;
X-CSE-ConnectionGUID: 2JHDXfinRc2b+d8IoszQ4Q==
X-CSE-MsgGUID: hA/xuVHRR2O06fL6YOQMfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55037756"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55037756"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 16:03:22 -0700
X-CSE-ConnectionGUID: c2zTNbg2Qhayr58agr1Kcw==
X-CSE-MsgGUID: EThXNWqORZmOxPAikQpNCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="192146683"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 16:03:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 16:03:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 16:03:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 16:03:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFWtCfWGBHrx0qV541z6Zr3kDUsGLT88IRNWCPWGM6fRFxSkM5RWMkdIoDjQGMTq9pYp7I8/s7MZHrov6ZVtT3V4vSuHkqFGTkWVFI2YjZgUETArT1R/emUe+Jn2PWgRAO7GvxWE6byvb7kii5r8xM/vqT0IyPSnDarC4HrQHw4nfC6e3uvPCJz5fkRawafgS6gUE/SUQUXBdp39wvp7HoMCPYcnnGnRMsd1WhQA6nAh1AX9GAOz9AvMqAe/C9Uo5HUAeFJJkbFH6SlBbkNzDyHWFYCs0Dh96H64J9rb5tX426AcaZnaq9SNalVAy3Wwe05mve78467qoo1txfQmgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NTGoTFZF7+rrjnntSc4LmkxN/N8tcGsxWKhrXpZoik=;
 b=IdjpjusvWfPl3ovFBGOJbt7nPXAVMk8Ykx2RewglHS1tI2oCyhphAG2E0/GSMu36oZxp4qLAx5bOWqz2fQ/8PiHGk1+Pyux8aQsULyU3b7FlU7rfmYg+u8AzVRxOUl1KdKj6URGkY2EKMRkA0MCC/Md/+mr1dg37+27VrGC8xNc0b7Nh8ybFHAVwhPPU9m7vYSUJGrIiwZrI+UdoGB+SUGpW3UeXWZODqUsGkM8zH5TmQsuOwN+bSp5fNYSXnYhQ+H8MQ6Gq1M65yZ493WGxTQDU61vtSn4tqh9UHJ5FiJmd6nB8BfOfGPrc1gOHqVjg1SpWOuqejsCJ6GEk1rQAfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7562.namprd11.prod.outlook.com (2603:10b6:510:287::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Fri, 25 Jul
 2025 23:02:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Fri, 25 Jul 2025
 23:02:37 +0000
Date: Fri, 25 Jul 2025 16:04:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/6] drm/xe/migrate: Populate struct drm_pagemap_addr
 array
Message-ID: <aIQNeix7J/OxahVU@lstrano-desk.jf.intel.com>
References: <20250725154011.2807655-1-francois.dugast@intel.com>
 <20250725154011.2807655-6-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250725154011.2807655-6-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: e1351431-d80c-4253-8282-08ddcbcf5943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fpY+8yTkQQkgqvh0LpDI6fhbuvvLodbvKCKD3+layBoc7ao0MPzk7ggc4ffY?=
 =?us-ascii?Q?XWjMAv6iwTK2jb11UsaZ0i0LTn5g1EndG0dx9bXL45PPwguQxdpS3o1r+NQt?=
 =?us-ascii?Q?36l9p1ID/tvbdg29drstFOcUW/UHkvX1sw8whN+MTuVtnCo5MVBsSRhiXMcn?=
 =?us-ascii?Q?w0bGq9tW3VwvTRnKpQaBLRiGCOU6L9019pkVt2JBdfud6yay1JPDtFZich4H?=
 =?us-ascii?Q?ZvO6eOJ+DAtg2Gz2jScGfzr1B3LRLDF3vghlxpS/ZE9hMVt7scWF7q2pEI32?=
 =?us-ascii?Q?ig2dIoG8wBUBFgDRzTX7Ua93Z1g7uvM1FvTashRVPps75mO3tWAGp3eiluyh?=
 =?us-ascii?Q?WEj/NmNmuaXWoj6i+EJ4GxRkR5r3M4IPseK5lFoMnWe8Nu0W8nMLGeT5M1Bz?=
 =?us-ascii?Q?bmJTfFzBunxcpYiZnMRAoSoteXaK1gUaCcW4sxig1jDdCiajsvq2LuJdnaOu?=
 =?us-ascii?Q?0fTd1tI/wSwwekE9Z9Up+/uxAZ81eVZFXFESxoLmx+Vuf5OAJmwxJ5pBS7Ke?=
 =?us-ascii?Q?XouuJ5OF+hHb6HbLY7DXh1G3ZwJJ/LmUnZxafIhojKdHbXjKmGLSM5S9LjE6?=
 =?us-ascii?Q?n148MZ4TOZWhWHEMTntYAOgu4kNGpQsov6FQdOwc7OzPJ3OYqOFbIr3hhq6w?=
 =?us-ascii?Q?EcwC4Bu5x5mzfvOY4xL0zcXt+gApto6qxn3dATSrXcCHXVZv2sF2YNMoLfmP?=
 =?us-ascii?Q?C3dC2eWZ1CH06XASF5tg0BgVSKP70e+xvXs2RFMAjiEvh+71OJoyzZQEgDj7?=
 =?us-ascii?Q?aZLsKwiEYcS3ETf3so4npeovgEIPRZZr0jo9H0WkO8+1+7XKq629JSzO4qdI?=
 =?us-ascii?Q?GCUM5pwrIhUDojyDUo2KV1NvJAjCMPDe0l4GA1FaWzQ6EMiJUgSYlV+/lYlh?=
 =?us-ascii?Q?iyax/WOoBcBnfS2/Avzbd3keMHZbmDwrVBaYA/Dt2CDVioV5QAzfbU5KX2G9?=
 =?us-ascii?Q?3V4lmoyCo1UNT0sW5XvWLFf8iOXEqSza9VDgjI0hQPYV1UEbVq1Ck9kIAX7E?=
 =?us-ascii?Q?+30q5oNdViy9gtJnp/bRMGKmxCsZs2jSjew/YcXspVq+tiNlaQ+Gb4CxdkTu?=
 =?us-ascii?Q?QoIN7Dt3+c6mUVEtJOIZ/Vago5XiQvfSkLZEdq2t3LJUoK1R/AWaSsfXfSR2?=
 =?us-ascii?Q?7PTD4GsWgIH7sb/iyiKRrSSU6a48dJjY1mHLexFCx/3IFU/WQ0REOrqmIvtm?=
 =?us-ascii?Q?EwarheA5/nnsE9zXLgJkSCkoBCwsuuSmc131dbFzAzOkAW/lq6EHk22xFb4K?=
 =?us-ascii?Q?Ji82fEKF3VG2p+6CHQx6cIe1TE7O9RkDOxKN3qdS/x4Mc0FZjWo0e2YK5lp0?=
 =?us-ascii?Q?WGCu2vF29PC0ySPhOpWwwAnIFKtFoDqjdog++U9REGMAxgWgpDewVXdAb6RS?=
 =?us-ascii?Q?FDc4QhXrCcTCmoRp5TUyyhksx7nzZ8w19oFLVh+I06z79wOIKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DpYnQ+aKCvZuKVuCH5dLvs+q7omz0Lv22TVynBxI27wS/YL4A69N7yBnjRjD?=
 =?us-ascii?Q?qGmtXMjbFkggGKyKzpouci/xJUnlOCrQViV//3fO1NBJS30he0feIzRh0w/6?=
 =?us-ascii?Q?ahjC522TsdyQX7FxzAQghSpFfkRtnPrgvfA/zIldu9bG40Tp/Ui1E2IOYS4b?=
 =?us-ascii?Q?6LwiGMS4Y9+VzqIHWa4mNTmSHoa93Lsn0wMB3e0Fg87VHJA+LWCYcVFRxtHH?=
 =?us-ascii?Q?TFjMpIh2qMa6z4ZwuDolR5M29RdHxqpqQse1rPLGGOZHG4FCCl0Xl18WVX6p?=
 =?us-ascii?Q?dPf8JW2lOUlsA3fbpS6YgtAaoWG+9fSJacP6D+2dJA79hnYxHD/xmNd6GrAJ?=
 =?us-ascii?Q?gTvnSIZdwOPcLiwBfQ4K43KGZGDE/X78lPnCQeIKZJD3ChZAKOdG7SS7iMrp?=
 =?us-ascii?Q?i4uUbZP9aPhgcStid5kRlmBkY+V3egLwJNVT3DDflG+9HkIcx8efqnkl9eJz?=
 =?us-ascii?Q?+UvczblFDmgSxZpokUn8EGoAFfIRw4cjUjkLJuh2RDUY/cfza8kHZStdwqSL?=
 =?us-ascii?Q?FBY9QhTVwZIQ76nE7CvRkB9VJc81lDOP9JTW8cjbTnh6lAfEejRQhuEh4ixU?=
 =?us-ascii?Q?41BD0sEGxaKbQ5HkW7JmOYJpJJsFrgEeADuISZ5TiFPwT0dMUH6ceX920F5M?=
 =?us-ascii?Q?45a2Gy7xt2M3Sh23xDNWgpyCjHuyb3top3TKZzClrllWbLL4x/1eVJI9k12N?=
 =?us-ascii?Q?GQ6bFVNIBCJi43YaV/WaL0EHLz5j2hWHjFUiUvQeMf1RgB7xmr43l+KrAf83?=
 =?us-ascii?Q?PfbDSvjOj/ixQFRcSopVFf20nACakm6GXZw99vcWHoV2N/9TqHcqy+K+1v85?=
 =?us-ascii?Q?P2DtAJ5Q/Dho3vgsI0FAZTOdN5YfWVWv/vZkjV/UAtTLo+V98pJFG692gxYc?=
 =?us-ascii?Q?2byX/VRuQhpm6TIDkAxq3O6HqnBzzS9htUjUzlnteI1NZIH9daXm3Q+iEIjK?=
 =?us-ascii?Q?kP9mzFOxyKFC5EwWdhN2sEdimIAi4aE9+wORoa2XUv/5Tm0piSjA1hzvARtD?=
 =?us-ascii?Q?S2g+hFjYDt3/ZTm56AZ3+v8mV+72qtaScGPtx2UjxBg+AcSaXdMkbQ+g1ps8?=
 =?us-ascii?Q?l3vfNAcjiSzQXe5sKCSfFBxfI4fFv5CHCAG1+7D6QJfUMo7gnl45ecLyhKep?=
 =?us-ascii?Q?DrRQ4kr2+G8xs8UK6bqurUFZXDQtEmWfrXT7dgGmERRO+UyRNqBL8WqQv3A4?=
 =?us-ascii?Q?J2H/2Wi5LFAOOG28+l8yhE4On/AWt6X0G20otqAjW+JKcfMZgeOdWynTF3n5?=
 =?us-ascii?Q?YQxQGzxBeDVyR4A3v6Z5ZQ4YK49f5UdI/xZ94MUbhGIj/UoH9vy9WJW/r4uG?=
 =?us-ascii?Q?/+jP9nZxy28vdqTnj96MeZZ0SJuO41Bw1TnPtGfJsSx5QtcU2aG1xj9UkEP+?=
 =?us-ascii?Q?YPg1fWdjJBesiVOEpXuhfum6eB8+sv7PQi63Mrx29Bmv1ku7uAO6umtYDpmY?=
 =?us-ascii?Q?bffEJbCo4ID27VrqJz8IOs0im6aQU2Cc1kFexOwDspKaaU2XUc28A5ubCPl8?=
 =?us-ascii?Q?ZZeOL9+hcni62be49cNy33kB8aqVFxyKaC1P/WrZmCQGZr6MbViG3xdg4AXO?=
 =?us-ascii?Q?H0ZzDY2ziOglHi/KQhi1ni3/wZOUQ7CWIMVBkLxEOVJPy1vpEApid3LuOSYb?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1351431-d80c-4253-8282-08ddcbcf5943
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 23:02:37.4931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfFM8g3BAfJz15M7t4x/rOFv7iITK+S7ELy4K91Lz53O0/LVofSFSodkUoey+Nv0F6vAIZ8QGmfPDHPmQJ5aiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7562
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

On Fri, Jul 25, 2025 at 05:39:29PM +0200, Francois Dugast wrote:
> Ensure all addresses are populated in the array as this is expected
> when creating the copy batch.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Nice, this looks like the correct place to W/A the migrate layer not yet
support 2M GPU pages.

I have something for this locally and will post after this series
merges. Maybe meantion in commit message a follow up properly fix this
one.

This patch LGTM, with that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index c33bd1b139c9..998b37852ac7 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1797,6 +1797,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  	unsigned int pitch = len >= PAGE_SIZE && !(len & ~PAGE_MASK) ?
>  		PAGE_SIZE : 4;
>  	int err;
> +	unsigned long i, j;
>  
>  	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
>  			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
> @@ -1813,6 +1814,24 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  		return ERR_PTR(err);
>  	}
>  
> +	/*
> +	 * If the order of a struct drm_pagemap_addr entry is greater than 0,
> +	 * the entry is populated by GPU pagemap but subsequent entries within
> +	 * the range of that order are not populated.
> +	 * build_pt_update_batch_sram() expects a fully populated array of
> +	 * struct drm_pagemap_addr. Ensure this is the case even with higher
> +	 * orders.
> +	 */
> +	for (i = 0; i < npages;) {
> +		unsigned int order = sram_addr[i].order;
> +
> +		for (j = 1; j < NR_PAGES(order) && i + j < npages; j++)
> +			if (!sram_addr[i + j].addr)
> +				sram_addr[i + j].addr = sram_addr[i].addr + j * PAGE_SIZE;
> +
> +		i += NR_PAGES(order);
> +	}
> +
>  	build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
>  				   sram_addr, len + sram_offset);
>  
> -- 
> 2.43.0
> 
