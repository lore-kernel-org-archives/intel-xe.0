Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57A6E6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 21:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5030810EAF7;
	Fri,  6 Sep 2024 21:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+cnviGo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34DA10EAF7
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 21:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725659214; x=1757195214;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XBwgyVjackIHJ8dASJiHT69Ag+g4btu3BYGjv1CfFT0=;
 b=U+cnviGoT5L4+e1yxfZKfGqUD8OH5fVTK/umgzx4iLsKfXTzrNUEtjpM
 FLP0+X8zHXzYLrTzrno7k7UXVWfhGZrbMb7GOdqM1ypi5qz9EvbvcvXVP
 tRXlbTD5T8iKnluax0JS8Z2F8RzNGhqyap6EUqvpxQ+ccEpfh7J3yNFzw
 sBqWtTfNREJ2n8rgxbFvzFd69A7TKIlWLVy1buSuhpSLx4T86I2u+uJwq
 Q8RRHgbBa2c4BCgdX/bBFo0CJRCmOucH54O6yBWQYw0l5uzzm+cvXVEgh
 Y5/YPzryOVoR7fMwtJ9GNX9hAhGpfIk1r7ahoB8ikH2QcgDcAsWugGkfG Q==;
X-CSE-ConnectionGUID: jU9PfUTNQhGl4PpkiVsZ6w==
X-CSE-MsgGUID: iUa7mLT6TwqWVBUdWkzJxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24381468"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24381468"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:46:53 -0700
X-CSE-ConnectionGUID: ZqOm0HUoR+S/I3tQvSWAXg==
X-CSE-MsgGUID: Z7PzGP3mRB6u3hSwdXwcEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="103542940"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 14:46:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 14:46:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 14:46:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 14:46:52 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 14:46:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiMNWcrspfLZPSWt7IZ687wJVllulZVMcEg0NACtUfax+8pxaU1emj1VIoPJ19MiHl3JN0JP3fYVItmEJNfnlTJ8dO40FVx/HonbeTG/J1YFjcyQkBSXXKhBmB9KivWJYki2C6dAaoMrgHgZtxwE8m9KWErepm0NkC7xAYMIHSg4cDgh8c0xlMvggGX4hZN46tCqXwbgqio32yorbjgb/o6WqisKmqhSwVSzcjQazY+qYKy0ewg1BhX9HJOIh1q7Oqmc6ZpuEdUqDuQZ0ZVkqkK3ojmiyj8nab7j8bKplBvhn0r0DNo4hUTBW51s21lh33Q6kpvuVJW7UADVW8Lvfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngXtFZkNYz5HdzP6gcBiScDRA45T2IObNy6D7UvM1DM=;
 b=v8/oTJjjBIzI3EczTLv9HvtIZV6pgi/fWg3YNLfjD3zQxpUlyuOoqDbkw/jEGZBQRLKf8upVivFdfOE4TVtRi4xhNKRtqmPp/uquld94EkvJRNmI+mYAjgt15rwbz/RjREqDfl3mmgvRs5iLhuTlzXLIgwKyGjGwKZuBmoDmzaNl9yJPqk9exRhvkBM6shG/cSzI32QsAF8Ucf28gNfUKj7HKxMOoxSLh383FtbbgpVgTBWKQIr6HBtetajodIR3Y8j6MiXSZXFfk6UEifUq+jgxHY9gDCb0f6BOFwfu+HOK83dzkmbnITUomeuK0wRRUjcPjLflsuOSPcbvJgXXwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5903.namprd11.prod.outlook.com (2603:10b6:510:144::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Fri, 6 Sep
 2024 21:46:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 21:46:50 +0000
Date: Fri, 6 Sep 2024 16:46:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 13/43] drm/xe/vram: Convert register access to use xe_mmio
Message-ID: <i4shsk2vz7r35jjzta73gw6vh64xb45sm6ktgxujqyled7chnk@g6656jvnhtdx>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-58-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240904002100.2023834-58-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0045.namprd03.prod.outlook.com
 (2603:10b6:303:8e::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c702e7-c976-4ab0-d5ea-08dccebd69fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YLJMb1YFzTionpJo7BgtnLttxCkFik+75h06eJJqK1s4pW3CCQFQd0PC+N2o?=
 =?us-ascii?Q?uahZerKFyaSoGK9y/4q6g6+T1GDWEJj9vBm7S7AgnxWSlXBq/XwgOu63t+cF?=
 =?us-ascii?Q?SClVHjK86BYv0XsGWtWXzHckcg+6kjbLEVTXek57XHtfsv8wbZabQuADq9on?=
 =?us-ascii?Q?bxF4YEMEJQn41SgmlbcCzNMR4sK0r3hywbPxpiEm2Rh8n90UOl3F6OSEFHbl?=
 =?us-ascii?Q?nXgNX3k6PIzZYGznP7wrf970SLVjs0PlsiePtdYPR23P2yuADMq/7hcwHSd7?=
 =?us-ascii?Q?mjNxpzQ2ufLGqvdieQ8GeL5a/YStQ+yNvqczePeY+jBhkAWRxQFqxcpCzlG4?=
 =?us-ascii?Q?W2epQx78f7Rk797J4BL4MUfgKhIIaudBENiYTYIwpd/HRyJ8cBbXBnwRNagB?=
 =?us-ascii?Q?fUPxNcUGvhERHMZ9Z5g5jY2QjWApCcM3pHWVlLMdymKnK4nWIXXWoc2YFXDm?=
 =?us-ascii?Q?6Zz9/+L7w8Gp7FCoEdUGFdXE6KzQBbYlN92UFh8LMv5eTd2Zj3qqWipPaMxv?=
 =?us-ascii?Q?jprrHYALwo+gHEKY1M9IzXrlTSQq88lhZ7zDtpJdGrbZxhCKxF/xpVuaED0I?=
 =?us-ascii?Q?slT5HCXVLQbO/qVRSSTKnLfewGg9bX6nKoiPaDpjHuTVhuxe2CN7nlNK95FD?=
 =?us-ascii?Q?HzB4ABF78eonAIznTLz4IyBsDMs/8BTdLXNE/XUR8yD8CQu+cuAq4UMvKmPy?=
 =?us-ascii?Q?ATYD87Ts8yyyyB/VZkAZBYbAYIyTd+qSxkmjwTAuajEQ+OnLrKqlFg3m7DKd?=
 =?us-ascii?Q?eXoKnCQmFxVSztqsU0ncqX/EB0Xp7KAwndsvNgR6TP5Dbg5sJC8seP7YBDxV?=
 =?us-ascii?Q?h1C9opV6/+6JjIHubxFpgW7B0Z58n/vj+NDe/F3zA9fIk6cvbfOTcT2A4VMc?=
 =?us-ascii?Q?bq0gu9X6Z6QEhk5Q6NfRo0FD8f8u8dHmZo8Ik2LYcc9v3yMVSlI9cyD5wbYy?=
 =?us-ascii?Q?5QBfKtCH1fFzInccNrzbsO8w+cFrvrnq3A0T0jqvI4nh1Xrnq6+O4QXJD2jV?=
 =?us-ascii?Q?Z9yuIjmoST1phTOzUedTVnv8fRTUwRMC5HYsTyZP/ET4tpXWRunPnIrl4J33?=
 =?us-ascii?Q?nk3dWnjtxfGGBJBkVXfgelfaRMU3Fe5mh8lkXOEvO9G8yU5dFffPXuz21qgJ?=
 =?us-ascii?Q?SZtz2P8iyGoC2goGZGZWPd3VK/MieoLFSK434uM8fZnD6Moeg5ewMPATMBvZ?=
 =?us-ascii?Q?5KIoNCskrsHhIogSfL3ASbWpV9aBdXyKKCRbA4pSHsoKHEwkO+sYaBIjnPN0?=
 =?us-ascii?Q?opkm1IhiedQrPYU+qN6OhAQnTg434ybrUfPOVpnr3KXCgsA59tmObx9NMchV?=
 =?us-ascii?Q?gcfdW2XYHWna4qeuI+frxMxiH/FHMDHkjEtRP/Jh2RpbuQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vMOG2UjjvrVx2wtuDWT7+OzDZyuyA/Djzbt7KmbBedOswYKpgLEpbEqkj3A3?=
 =?us-ascii?Q?e9i4bF6rBtUMPL6eDwhe0MeD0DWLSm+coMWtVs12i/n0fXWyEpsyLBoYe/7+?=
 =?us-ascii?Q?1n7chKKLw69w4p/IHVbMecMcgRUJzN9AtXPJpn5HgR7Fs6R2NxP/KQuFrFCh?=
 =?us-ascii?Q?z3K7ORvOCbWJdEhnf/6yDqWEJnMjDsmcGcFwjopoq5e2zrict2/EAVOgIElh?=
 =?us-ascii?Q?i0rVPmim3scC5PBWqW89DOFkEQ9+p418quKhqpzyZ3hv+yJlKI+rw+GOsJEL?=
 =?us-ascii?Q?MBJCipy2X+czxxK6NyYfiQY9bZhm0taai3s/eizTK4IRuD9dU29cRI8ZDK2y?=
 =?us-ascii?Q?ff++Z3+23IJydAk6anHvsnhhxbTeYuQmGbZw++EufDajk+oi/ChZdpvvVEon?=
 =?us-ascii?Q?ZC4RFmJBewvaCyVsirTQJjofWiX+Gb9wovm4novXXw3TtP4F/8s6oDkxutLS?=
 =?us-ascii?Q?Jd1aiq4drGtDpp9feYzk5WFZ2zee+n77jIOuSMteW7AhWzyqi4drVvuLuVsr?=
 =?us-ascii?Q?miXq5HW9N18V1bvQ+msxES0nJ7ZqO02tXMTK1B+IpzDI0lWBjYbxd1I0DT5i?=
 =?us-ascii?Q?nEaFgWi3eL/yjXK+0vcMN7nm48/mP38m2osNzF8J5xeoJFpK9KZ7quE5C/g1?=
 =?us-ascii?Q?wgAZZmxuGhjAg4I0Hgh01lXz76SpELcwSIcSO80qFKyudKiXNNduHFnaz3No?=
 =?us-ascii?Q?lEOZeITFvdHHCiTAYVTzzZWWrehjVMNe9qdOilp1Mn8UakRzh/ArY6rxLwL6?=
 =?us-ascii?Q?Y5enF9teg2I3PX7vMZt+lm10IhB8gqnA0L13OHdd0pHkBJ1UWnQjkzT3bIiS?=
 =?us-ascii?Q?xmEuIkhvLE3tV2uD5B174cumRvknw1FqEAaVTFoNkynsdCq418nF41Kcy86w?=
 =?us-ascii?Q?p9/lj5f4JJTcp3YJz/xcn94xgoK83vB9Su/nABAVGPfEJADkjRFYSGj6L811?=
 =?us-ascii?Q?BYZnwpvCX1HW7cE4rqwRh/vXAwfBratEDl4a0QNeZt2bzRCaGL/eKqDOtyjT?=
 =?us-ascii?Q?r0qOHGAgX+uadWsx5JBbn1MDkUwFAcJCaK4zxsHE1cZcN57mSAGNAOqtWDpG?=
 =?us-ascii?Q?6Mmrtqb5A/J+0R8JstHyzaO3lgDW2/CqqsGQRiJ46iYgAUvZkfmMXT1Lasok?=
 =?us-ascii?Q?KiNXk1nbnFyBTRus+PUPChS1FALZfa0b3NBqFMX4X4wUci8thHxSjaFUp+SC?=
 =?us-ascii?Q?GvHQSjvEU0RlxciOMttElYDp2Y82y0oY+MUxG5nbYS32DnBub8iH4BVwDt9K?=
 =?us-ascii?Q?UIFx9EZ8ZTqD4eS+ZeH+r1G3Pj0rBI+GYI4sN4uvbnw1REZjKD27Ei0GsQvd?=
 =?us-ascii?Q?LOg+bmX7GwmBHkr/x/eOnx4jR40LQIelvgEVcc2dQriN4Iyf8iQpWgOSw2h8?=
 =?us-ascii?Q?Ot4h8WWY0JAzUjoDUWiNmRPJVcQVxOXDo1ipfkwq/JpUvogSsWOT2AdvmwAG?=
 =?us-ascii?Q?sUxaYcgNCH6vwjNEIVKIXsgFsKb6Py8gbxxSmJy+6BLaO0ZihdsjGnJq/ieN?=
 =?us-ascii?Q?7UefTalSoX4EsQXbJPLobE/wYSXB7ezjTvz2cjDcbnkI86ig5eznTd1lX/M0?=
 =?us-ascii?Q?x8+mGkRhGhyrORNEyyiWYRYDeaoZifvsQCDuhBRdIFR4GFkid6qRRXUO2C5C?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c702e7-c976-4ab0-d5ea-08dccebd69fa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 21:46:50.3176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNsV7G/YyQSRAqP4IC9OiY1iT4vb3rz/hFlQxbeqpU1jamnTY99p8uzPaRtZwlBciEsH4g8jH54v7k0J7pAEAThqLItc4BcOUTV/9ShcnKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5903
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

On Tue, Sep 03, 2024 at 05:21:14PM GMT, Matt Roper wrote:
>Stop using GT pointers for register access.

could be more verbose in the commit message about the difference in
accessing MIRROR_FUSE3 (gt->mmio) vs GSMBASE (tile->mmio) since the
we are changing the behavior for the latter.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_vram.c | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>index 5bcd59190353..7e765b1499b1 100644
>--- a/drivers/gpu/drm/xe/xe_vram.c
>+++ b/drivers/gpu/drm/xe/xe_vram.c
>@@ -169,7 +169,7 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
> 		u64 offset_hi, offset_lo;
> 		u32 nodes, num_enabled;
>
>-		reg = xe_mmio_read32(gt, MIRROR_FUSE3);
>+		reg = xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
> 		nodes = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, reg);
> 		num_enabled = hweight32(nodes); /* Number of enabled l3 nodes */
>
>@@ -184,7 +184,8 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
> 		offset *= num_enabled; /* convert to SW view */
>
> 		/* We don't expect any holes */
>-		xe_assert_msg(xe, offset == (xe_mmio_read64_2x32(gt, GSMBASE) - ccs_size),
>+		xe_assert_msg(xe, offset == (xe_mmio_read64_2x32(&gt_to_tile(gt)->mmio, GSMBASE) -
>+					     ccs_size),
> 			      "Hole between CCS and GSM.\n");
> 	} else {
> 		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
>@@ -256,7 +257,7 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
> 	if (xe->info.has_flat_ccs) {
> 		offset = get_flat_ccs_offset(gt, *tile_size);
> 	} else {
>-		offset = xe_mmio_read64_2x32(gt, GSMBASE);
>+		offset = xe_mmio_read64_2x32(&tile->mmio, GSMBASE);
> 	}
>
> 	/* remove the tile offset so we have just the available size */
>-- 
>2.45.2
>
