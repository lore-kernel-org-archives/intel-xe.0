Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF53CCD193
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 00:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B5C10E90C;
	Thu, 16 Oct 2025 00:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nNtPYgT6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A5D10E90C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 00:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760574975; x=1792110975;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jZwCjP4nvVwz5PIPYXJWLAGef3oPaNioW6GE0CjbYdQ=;
 b=nNtPYgT6ZRd46R6sUIVJpeQmxGFFDwYaiG1FyrvLbC8UaY4d1Uc1x5sF
 8tuvno7aA0MyEeTKLyi3XrhYorM93w52FpmCm9eYOycf7CbDiT+2OsEHa
 k1GMZjAoByS9M8RKH6eojq1sHHOZVcFJUVDBsR8B+ihFUkcwwt5BwfOyH
 PCOcAy/MsK/tIbzE5gyOuwAVz8VgOJnEn7U0Cgg9QIv4LQVgs6ueEsTP5
 LGW2HMULEMr4cJabTmNqTrkkE1FjGiV9nnd5TEtz7hrpruiuJlW5nlzol
 2hEx9NlZzu4P0/WiH0jfZHYN43yW1uCBv5/HLD2oUCRgzeIRDy6iCmaf7 w==;
X-CSE-ConnectionGUID: B1xNn/OyQ1Wxt+tftoCrcQ==
X-CSE-MsgGUID: u2AcL8t3QjuII9J8rzulVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73360138"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="73360138"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 17:36:15 -0700
X-CSE-ConnectionGUID: ZejWzaViRC+8tJEckK+itQ==
X-CSE-MsgGUID: jLXTEUdeRbWR1p57yTk9Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186323969"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 17:36:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 17:36:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 17:36:14 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 17:36:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Onag+aqtfD5KmlVJ1aFMh2gHwUKPwM3d+nQEI2MQN0OOntxJ2P43J4Iq4oflpwrYBxt3zpyV8TIzjThBl9MF/xAEAweEzYEQIUS9dBSm4h+dhTWSkLgtqEVMRaJ+YZ3OXKEa6AWboiles1wzMzgJqC40l6vaFUbNHBRIY9g16OMzQZU0J4YIhCYSx0EEL6IVhVWJ6wdWddfj98Zcz6mIQJKWnDE0vuLndiwNU+cnxi2a1zdNIYmh6fhvQzO3Sx76jUowE4xyXIOBHRsSdFiyWAzdH3mPj/YDCceu49JbiKlTFy8m0LuxON85uVsRHBWfLb8F6HvX/ie6e2Oxubc6KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlMCVvlxep2v4geRGupF4lv2nMEDUKZ+/cJ2d3spxO4=;
 b=vWANaeFVuVaPAqyUeoEQZDl2k80/ZNZRdbEj3KSqgx6cLVLKMBJvNoDL7ivs03bZRd9qqWtP5jZwxbBYM1y2tIngIt3Zp6ou2zkUnz2jdW+NOxRXLiaHxAxyRchtIjwvCR9x5AQmzg82kYXhDylZAGWR3dowSG+KvYohZ/txc3X/TrnzJXfGnbFO+lDlwpTZbkFVM5OyhWAI5qIfOA1XUT/xHdHmIz4Kh5my8dBkHrf1FXWe2tZpdYLHyGLTlEOHxS2awWa744qBUjgsum7P5cF4LObETt359VzFBejlwmeHxTYMRcjluJhArGKcB8QmU+mjMNetVJp7yGG2PCtlWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6524.namprd11.prod.outlook.com (2603:10b6:510:210::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Thu, 16 Oct
 2025 00:36:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 00:36:12 +0000
Date: Wed, 15 Oct 2025 17:36:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/6] drm/xe/migrate: rework size restrictions for sram
 pte emit
Message-ID: <aPA9+XZLfGIYyZ+v@lstrano-desk.jf.intel.com>
References: <20251015141929.123637-8-matthew.auld@intel.com>
 <20251015141929.123637-9-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015141929.123637-9-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0112.namprd04.prod.outlook.com
 (2603:10b6:303:83::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: 3469e611-85d8-47cb-8c8a-08de0c4c01fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kw+L2Bw/DGaD0TTk03olzVGKFj7HHMI7p77+QXiSRij5cr/0AD7FjOP1uZtM?=
 =?us-ascii?Q?eJYITwndh+Fwawu8y4EYL/D6NTxZR9d7nuYsTi8TlyY3ftJ8GXFlwkjKP00t?=
 =?us-ascii?Q?autp2zI/94GA+GJK5A7klA5Jrrwu8Qhe4y0Kch6Ls/AipbzfkmF7vXLBh6TG?=
 =?us-ascii?Q?/xu+VX4rK1fYceVP5V/EBbKHa7dnHcBoZCqqZ5O6ceOBhLBmDpgN/YFio4RT?=
 =?us-ascii?Q?eJn5zpoG5LZV//ddsl5Z9UQr3Z+XK3wJkmJByLR7w3edEcnxwH23itiK6ieZ?=
 =?us-ascii?Q?n3bOq0XhFcwyHqCyp4r/BG3IRTISo8rKgbRNqj2N/bJnEcBBQCA12WwZ8Rb0?=
 =?us-ascii?Q?Cw3PRKQqM+xMUGngrIv3lntxT0DeJT2UJCQnlfniP7hxUO70oXo4NtiNVkXw?=
 =?us-ascii?Q?zBOHsv0aI2eFZH7bkoGLQne3yT7C5ybhIVs9G4ye5rkAcm2F5YPkx9iUOP5h?=
 =?us-ascii?Q?nEHT3uKdRkwrtm7gghJLdoTjedp5FIYuDhsJiz9UymN8jovT9IOzSvrx9Yf2?=
 =?us-ascii?Q?Z4DobSX4/OfX59ciWGorJWMVHlfSBjLKukp6gjYeRgGFepIP5aMbuVBvl3qd?=
 =?us-ascii?Q?KVJSKGacxI4BKh5xxlOx33oItDkFvKxVSOKk2p7E1PolvugHd5C8UVkKQ4HU?=
 =?us-ascii?Q?x/2fTx5M0/rkKOuz2KlO/AyWhppaKijNhre2gjVcx6ZOh0CHEw8ttg9OgY+E?=
 =?us-ascii?Q?SgBUkE7L1ifGJNVPZioQ/UA8nRiUt8bz81QbFQXrfdi9O/ciFt7fOZim8S3W?=
 =?us-ascii?Q?MBuAUmQ5XJ6KVGcpf+m6k64Qovx4WQEwcd7eTho7wYSvNYcOyf3f0tOkROmc?=
 =?us-ascii?Q?4Ogi1o2IpcSkVHC6Uwwq3WT8Be0Xc42ZVakPBRiDt/8t3rmE/qyE8WXc/jtT?=
 =?us-ascii?Q?eWNWOdrfv4VcawSMcsV7noajrpzmOoGU3qdIKmWGMU7oc4jSLXDzzGbRTHmv?=
 =?us-ascii?Q?52uK1Q+TnZgy/MtCuz2Z886er8Y7f7jEK+q3oYDtf4K/1I4bdmWd/CDVmzhA?=
 =?us-ascii?Q?XeDxvwmsJl1docDMpBYVZUrZoN3OkAh4jc3FYfnEv/Qx+Q3yEYasvoLP43w0?=
 =?us-ascii?Q?60RozvKFhRSqyRR6Y82TIUMInOLLBPOVHDriJKnSusJ8hbKtWfqYJmMoTRmL?=
 =?us-ascii?Q?AKqoCC68cJMA5AFx/tGYqnZv3acVTg2ySngj3BSAEE9CgHHnnf9MR4oNy1so?=
 =?us-ascii?Q?7y5WcPKItGSxWFIXYTK4AJb5/qsLVjlp8xkOUX0FFs8T7Dwt1ldpgKVj0tgw?=
 =?us-ascii?Q?T809S4whPAXO3Lgicbm0KHEdrT6V4DgOuHnAC0BwywzXZZht8NRPr3C1p/7x?=
 =?us-ascii?Q?AmBfwrK+03gKCORheAN8rENjGQuKCyxNRBD73aQJwKivs0c1kb6m1QgHBkwp?=
 =?us-ascii?Q?7xS35CJew0db4loTJI4u5Ehib/i5aAhDWU7rUSOkRg7AY7cFpX0a+6WKC3ST?=
 =?us-ascii?Q?FHLkRrzJvykzy8TDnddo1pplsDwaAdp2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aXrkTOIkIt5GGfeaLEKlh+MyoiJzW2pcCfq5OMHzvjGXAW6GlVwinnVyIdfg?=
 =?us-ascii?Q?OaQlxF2gAQ9KT6d3+31MrpZxGExqLjBRek9zg1uUQb+dTW92wCLYDwVqdJl9?=
 =?us-ascii?Q?oyWLr6KYnzHXHaBPzlSIy3JLDSDW+grhE51X5mtDUsS2RZmkHz62b2tq4/Du?=
 =?us-ascii?Q?uG5oxOpYXeygwWBlDmKCSCyH0Ct/WawJNyyRq3o0vrET6scmIzDaMNMyvBNb?=
 =?us-ascii?Q?tcBQ11r9+09SIF1fNhBDP0ev2fDqi+S7QXdxCdP32l9GNPboihZBAGb2qnIU?=
 =?us-ascii?Q?1mZGXYO73W7IbPoBtlXk7t1/HbuYYVnH6ee5rccQm9GcCkRzhBx20+Ex9Njp?=
 =?us-ascii?Q?A7tK/oA6Ar5SucY+GoRd03Atl5uN9VfCPxH7KmfTn5zR4C/ulCVsAyjFOOGv?=
 =?us-ascii?Q?LBEzm2pvqMT+h6pdEqp1DIKSMAsYGQ5DzT8Xf/St2qocP+W6JxujYiaVlu9G?=
 =?us-ascii?Q?scbkq8Tv0I3pdKrH75yMyK9p7YrO225Ydw+yVrm7bJ/KM6u5yIGkSpMEih/O?=
 =?us-ascii?Q?xaES9hmmqzQLhztFoyz1ZzmhNww1OqoM4OkR3HY9qqNi4AeF2u+NVsKnK/Xb?=
 =?us-ascii?Q?T4rQOXSjKr/458q7k7LTtiWE96qYKs4RuAGxide6KK+Sy8I+Nebqe/9ik6Yg?=
 =?us-ascii?Q?3ohqkm8a12RAl8jQxwrmE/P7BKcoBa1FwnvGuAzvN/pG6OJQJOzfPYUemhA8?=
 =?us-ascii?Q?k9RaNmt13Fwx3SIXEfdoDcxlMtRe5v47qY19Y44pnpI5ZPRDssVCag60+85c?=
 =?us-ascii?Q?OLRRq4wQcj11POXtIed4lhTJl8jmHCiujw3mCwK9TQw98eCFgXqs2W+PgYVY?=
 =?us-ascii?Q?/fVOsDN9/itqkYpYgdJfdbw4iQdoKUiSSnVfwSR5e1EWEXHdLmtDudvhjnlC?=
 =?us-ascii?Q?gxkpurFp/daCeSU+sQaDFJjwTdNKRFyF+foPi5isqCx/cpny/UbUaIISinRy?=
 =?us-ascii?Q?Z0DgcXDL0k/xm0RdrEV8Ar5jR/addJlNE2dG2ZCIhGfIRXhXhEuWgnOSwxZY?=
 =?us-ascii?Q?Ihocs5+78RlPIQYGYcXVelBu7BrEtksW9pTFSbgvh0iF2PioeXkDd0pL0RmK?=
 =?us-ascii?Q?XY8H1XqQC7Li2khxi5rR5pqFFP7L9DrASV3J+5HEb4lQgFsyyO1lCVtgzMX6?=
 =?us-ascii?Q?FLbCK0n/Qv+aOuEqPBBG3xUika9G/cm0/FgkI6i1mpUWeZLeJ0FTBn021cUl?=
 =?us-ascii?Q?LEOOMEzY3fKCZ9BvTBh1aZRSGN0vZpbB5s/yW41KexBVQCHOmQ+q0NotYJqw?=
 =?us-ascii?Q?+LXHxUYOAUKJR27hZ5sLhkZX+A8x8M+leQC9f5cBzAl9AI1gc9EXJcDg9nBA?=
 =?us-ascii?Q?1elCgcPVWW69NWz06OQ1Oe2H+cG+XUQws8ppaw/K9t7vHoHB3nsHPror07l1?=
 =?us-ascii?Q?4sjc8vmj1VwfwXt5YMHbPE7O1lE7RdFJoM7XkhAIJPyWdWlRHu3fPeZl/VJj?=
 =?us-ascii?Q?ZMcpn2hzz6WNctD4HcnrQYJl4rcHu00lP8n8x5zSiSlgeVGSFKoTuTGQ1UzT?=
 =?us-ascii?Q?Kx8L20MQhnDj9YktKqg4DDGTjRLZo7iBscrpe7JtTVaNFCjD7jRQX2ojGQmu?=
 =?us-ascii?Q?rE58dro0kv4Ves6yncYGMN/TgqeSC2TCWR/hYAJMoNCmerrKz3iZZRw6/kvG?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3469e611-85d8-47cb-8c8a-08de0c4c01fe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 00:36:12.5238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okpSkUpEhe2jXzOBlymmVtnlrFs2oQqq5BIQ2kvT9chCtsAmezPMSZ4M3rlMMQ7ZIqBgakxAGBVRBsQOZpL21Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6524
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

On Wed, Oct 15, 2025 at 03:19:31PM +0100, Matthew Auld wrote:
> We allow the input size to not be aligned to PAGE_SIZE, which leads to
> various bugs in build_pt_update_batch_sram() for PAGE_SIZE > 4K systems.
> For example if ptes is exactly one gpu_page_size then the chunk size is
> rounded down to zero.  The simplest fix looks to be forcing PAGE_SIZE
> aligned inputs.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 4ca48dd1cfd8..ff8e442bf519 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1798,6 +1798,8 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
>  	u32 ptes;
>  	int i = 0;
>  
> +	xe_tile_assert(m->tile, PAGE_ALIGNED(size));
> +
>  	ptes = DIV_ROUND_UP(size, gpu_page_size);
>  	while (ptes) {
>  		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
> @@ -1811,12 +1813,13 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
>  		ptes -= chunk;
>  
>  		while (chunk--) {
> -			u64 addr = sram_addr[i].addr & ~(gpu_page_size - 1);
> -			u64 pte, orig_addr = addr;
> +			u64 addr = sram_addr[i].addr;
> +			u64 pte;
>  
>  			xe_tile_assert(m->tile, sram_addr[i].proto ==
>  				       DRM_INTERCONNECT_SYSTEM);
>  			xe_tile_assert(m->tile, addr);
> +			xe_tile_assert(m->tile, PAGE_ALIGNED(addr));
>  
>  again:
>  			pte = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
> @@ -1827,7 +1830,7 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
>  
>  			if (gpu_page_size < PAGE_SIZE) {
>  				addr += XE_PAGE_SIZE;
> -				if (orig_addr + PAGE_SIZE != addr) {
> +				if (!PAGE_ALIGNED(addr)) {
>  					chunk--;
>  					goto again;
>  				}
> @@ -1918,10 +1921,10 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  
>  	if (use_pde)
>  		build_pt_update_batch_sram(m, bb, m->large_page_copy_pdes,
> -					   sram_addr, len + sram_offset, 1);
> +					   sram_addr, npages << PAGE_SHIFT, 1);
>  	else
>  		build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
> -					   sram_addr, len + sram_offset, 0);
> +					   sram_addr, npages << PAGE_SHIFT, 0);
>  
>  	if (dir == XE_MIGRATE_COPY_TO_VRAM) {
>  		if (use_pde)
> -- 
> 2.51.0
> 
