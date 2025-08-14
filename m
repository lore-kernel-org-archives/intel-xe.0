Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88586CA0EDC
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 20:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F11F10E219;
	Thu, 14 Aug 2025 20:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ji2fkY3p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C0010E219
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 20:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755201677; x=1786737677;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=771ARSMeVhbiLnyVdRVrP7TXWOiCSSHz20GWGjjTg+Y=;
 b=Ji2fkY3p2F0urVQyc29zrZl8JFEIgAgKjjzG1cTtdkRMg2tPOIPVFKkN
 UK0FRBFrDcgXOt1yqFC7cWGd/BOqBT2ZGwKWaGOmFKBAOB8UNaTk+kvCZ
 GIixXTvbA513ZYdFGYr8vcSxizeuwbN70c6zc9e35FELIox+iCMVAo0Va
 QoJLsnLhHv/SCkYELd7aBkaJ+evGHqy2s1oezl0naT84iAXWLl0O+COZo
 YV66wFSiLUzzsgjV7kw8JRX2ZzwjH8vqoURVnF0B0I+qprdy9ohQALHL3
 ID51pRWQQuKvGTqUzoyawVmaxjxDslvck0pFjRNQ/NiOqvrOhq7UuhOgg Q==;
X-CSE-ConnectionGUID: 1tzWxckwTjWCAOPvOr6llg==
X-CSE-MsgGUID: ZGB0XOwCQ12TIBr+0bE69w==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57642072"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="57642072"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 13:01:17 -0700
X-CSE-ConnectionGUID: /tS+NDmaTYuM6iWyqY07IQ==
X-CSE-MsgGUID: tmAy2niLT7y13pgb/93cWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="204026430"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 13:01:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 13:01:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 13:01:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.68)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 13:01:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3Sb35xHo0k+8KNR3ocduU8drD0hW9D4Qnx3fU+me8AhY6kcg3qZGEfS2ES9UvRMbyE3vEFBqtV13O5XKZQrrQr1Jvjx6YU5od6Bud0daXZsjlHtxy0t77PZHMHvr32PqxJyxfUwhTkDSYlOyEG8m8NDnEdZqUrGfOe/Vmcq+eTmV1m8QdPcbrq/vR9cbVNw+rxqpxyL7McyPyBPdg/dnRCLtryVig3drSLq9Hg4yOWqL7KhfMnXnXsuIXNpxUiyxTM2sSCtCWoxPGyEZhYbqMOTr4RoRbCnwKT9RjC4gbSefxiXtDFPI1tcf8WIdtsKknx+L3hXIlo3kYA01gLUlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=minF8BODhky8knbCxTNRTlq/MXBeDyX7KfZng/LQeFw=;
 b=jUjYo6hpekREYz00sxvRwp6Mcue2dhwHShHk+TsAY8QZL6boKlLubpIVxEhe7J3cyXA4IefpEfNoZ9MLffSBw3257hQVbzJwLe30CXfFuxGaFLZ1sc3Yww1Yj8JgeHECSXGsOQ3OVUHiPL6pj93rTMLM+L7CofpaBZPcD2LIJk6DSFi/nj11jxQdIZPzPH95LpyTI60MYjOyWAmp9zZzRryw62OOZQIhEWR8gNawE9svkXuOvlDE/aOv7B3myQtk5Xs0x6zaBm517CzYx4D9RIOWic2jbxba6blCvLzeX+Dqwy/nbz+t/H+WqY0JVNqlimVePbl6M0xB4oYa2vYknw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CO1PR11MB4962.namprd11.prod.outlook.com (2603:10b6:303:99::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Thu, 14 Aug
 2025 20:01:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 20:01:09 +0000
Date: Thu, 14 Aug 2025 16:01:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Use for_each_gt to define gt_count
Message-ID: <aJ5AgVoVBitGGt3C@intel.com>
References: <20250728-gt_count-improvements-v2-0-78841ce8a81c@intel.com>
 <20250728-gt_count-improvements-v2-2-78841ce8a81c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250728-gt_count-improvements-v2-2-78841ce8a81c@intel.com>
X-ClientProxiedBy: BY5PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CO1PR11MB4962:EE_
X-MS-Office365-Filtering-Correlation-Id: 490e36e9-98ff-46cb-3258-08dddb6d4fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tMXmx5ofFu5UyH/ETyYCi+ABhiPKITwC/5Jq7K7xFRxtb6i5eOPT1MlV38gO?=
 =?us-ascii?Q?FyeFG7LYMzQDLZpOesyDgwg+jsfICV+d329FQlUGGwR7itgAZQyLyobP5/IL?=
 =?us-ascii?Q?R+RNNc+pucIuVDcO92jOKh6dhnBPVrJEymyXKokhJjo2hogUn0r1AYQjD8H5?=
 =?us-ascii?Q?LZe9uBIv4SeyGwAq98lGfB5Sb5Z9tvzvYq6+ZbqfwoxSj4PBOwi3LftyO2MH?=
 =?us-ascii?Q?mtj1Efp8uLykcHeQuTszdi97ssSPp8BhMA9bYXUOvBLkPc7GE2yvOyhgAGKw?=
 =?us-ascii?Q?wdXVPfd3EKA4t5jshBq/gbIqeeF4F8yiORkxmeVrUiFBPf3t9BUwsI4ppshz?=
 =?us-ascii?Q?YVNJC8zfIPfHuC6O4xRTE1ZoFO/9RZLXe5zCJ+5U7wm12cO/+VzKK59nZ7YF?=
 =?us-ascii?Q?MkgKsZ9HbUAt29JV32hXQezGNPlzAu5bBkTwWwZxIx6jZRtFNLIMDWeFpJO8?=
 =?us-ascii?Q?yJPs3qaOvAvo7JUtBPTvnYVOUmvPtldqhHzWaHcC9YtZC1YhAzqjIc1tt0sN?=
 =?us-ascii?Q?hkfQUS4Kj0UYMB5BjX1362vnL6r64SdbDou0Sfj4hrSLABHXuBCrEkDYyoaj?=
 =?us-ascii?Q?+k7njuP/0tVDzgt6xkE4VVVQiAQKyJIlKXFte/wah0P4YupUGjs3RxWa8ybH?=
 =?us-ascii?Q?YFV9r5CagofECnmRa/MsnqjYWaflbO/HLSvDr54yNfILCZyEBqRUPjgY+/WA?=
 =?us-ascii?Q?H7+GEjL6zx7LzMtZmhjCR2I/sucWRPmYnCU8ThoVwsiw2WG56/qPHgqNXm7z?=
 =?us-ascii?Q?DRx4JyzTqPM6VUYkAIuZjpkosC37q35R+ZfJ3DvwErq0jok/TYRv+BWXUYCB?=
 =?us-ascii?Q?zCswVbJ5BvK2ljTm1niFRYwyel49B0MErqtNps4RKZrAwWIiyNQZvDuUbKCZ?=
 =?us-ascii?Q?Yf6Hj8zeg1F+g2/djQL/FG8V3S0WgdFFKQgLC7Bx/puIGF1i/GRQ+wN4AqVe?=
 =?us-ascii?Q?2pDkuDIfYnlj5U6piy+sU9kOxf3tbgEMYda6UmeGW7bmWsWsqeANMWRbLv0L?=
 =?us-ascii?Q?MI7PXb8fk4sM23v/3tzUQ0mgHq1V+0hwv3dMhV0cfliK9kphCiqmoyz+JBay?=
 =?us-ascii?Q?q5O4IYZx4yUSiaNdJec6fIOpKoMPKJn47LxWlOBF7zsFuXlimh9d13LO+SY0?=
 =?us-ascii?Q?UX6WIo9qyH3RbaxWHAUFZPBv9tJjmOhxetGxA81np2sNi7c6oM63bKeMqBbk?=
 =?us-ascii?Q?12TiZePfZ1DBBCi2q2oAy4dGWHWxccm30lP5l7lRPOMaj0FJ0lmflw7XC/Mq?=
 =?us-ascii?Q?LBrZYJSRYNDDIAzSGnL2b5CT0SftM3zwcKs4hW5dP4e66u98RW5TXubdlU8D?=
 =?us-ascii?Q?ez0R1h5rpGZFykrC4+dGcFfXNtJ6OJxHH/35jHjzHpgkcHP6fIrjVI0IHBIy?=
 =?us-ascii?Q?eUrE5hfN1A+1pj+cTG7H3H9mVu0gduCjf+wkYqYBl8rbBLIsA1t8PN/3dmrY?=
 =?us-ascii?Q?WQk9zSXLB68=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bom0Xiyw2mM6uy8P3shtxymJXZ5hO0BwC4DhFlhBLsosPWmVQmRV/gsxjcKF?=
 =?us-ascii?Q?5ViSYHQJFu9+lzi0pPN6BxGFaGa/eepDmuhsCaICTiBkEeSzUXmRloirr7/Q?=
 =?us-ascii?Q?YkUo8aLh4/Zpnwu2BebQvRkKU8A8MInl1Cch7Tk3eX0EkWmcZXERANe0JQvg?=
 =?us-ascii?Q?crS/KdIaNUONT4KQIxe4z6SNAppn189lCOgvCnwTbuKayywUWWblr8eQHUb8?=
 =?us-ascii?Q?LyiY8HXJ4It1yQeQcLeguEMCf116b87+tPgVXnDUCEPIup/431RASriobtKp?=
 =?us-ascii?Q?vf+d5AFtzkoa+B7zD/l0J7qUAl9nH6KC34RCVFdJa4c1f7A+flqIPmPup9ps?=
 =?us-ascii?Q?0M2510a4mQOU32skoLI21GUkTSY2y13R8KwDC3ciRMugAC7XwFJMSRz2b6nW?=
 =?us-ascii?Q?+USA8LLBd6+swd1F34tg4zHX5h/0bOSCA79XavmFcn6VbFWTymbdRkaB+CVd?=
 =?us-ascii?Q?oBqan/mXKbS6Si/7dzk+7b6tdBkOGFIPKicaPlTiIq3H5pFiWLq9HYMbz8OI?=
 =?us-ascii?Q?dlbEjO9tFdH57A9rBEnnr88T0THgjzgdajBnlghWrw15muUgwLwN8ixWTGRs?=
 =?us-ascii?Q?AQ2DJ8VrxHlY3iRcmsLwutvQcsvRyLYwpjyLjQ2o4lfDOe5zqUvNLLw7oH+H?=
 =?us-ascii?Q?RlDDvTCVppYpCmDGj63RttZqpafPJHJNH0mtoscw9+20u4kUR+ENeextrKJD?=
 =?us-ascii?Q?rIpRGZrh5giGXac/vhmhx7qM9lMamjIXx5LwSckjz9LacaHDR838b6LSvHaJ?=
 =?us-ascii?Q?DNpzkYltGgtpwarPuCUKmYuLJGCHU4YkuL6ttmScetXT97YSpDVcKDomyfw0?=
 =?us-ascii?Q?X3YjMc52T5OTy3uuLwOdGjsvn9/vKKSvl4PgLy312Zbz1TJIsTx1sjE4eyQ0?=
 =?us-ascii?Q?d5gjWjASxUE8KrYe+6YYDzq6LXloSupBTkkZOq8InvXrhx7b2rrhROj33+pj?=
 =?us-ascii?Q?q6S3zKN4IUVHQdaaZe+lmJcByar1am18kixFBv1KKfDOc5/0U6wyW3rlJ/SN?=
 =?us-ascii?Q?mWA7Ke1OAtc5528b5XuE3W2WOMki43d0bqWd8V7aQ4C5rwaNpNAt6Hgvb9qV?=
 =?us-ascii?Q?YphMqGVNOWVSmcDyrXVwQMqeTeFVbOw2Bt8L2W1uCkST0f1MN5XAgDvcnT6C?=
 =?us-ascii?Q?0u5r45OkksvfNmPx0ZUdftv2XWRVmBhlmYRs/dFeOY9dHw6Moh3EnOGLmtl/?=
 =?us-ascii?Q?8kbmHZWCRHCT69oDkxniYwxSMlKgbl9Mtl7XE0NzAy8KtllRmqMUReva4mm5?=
 =?us-ascii?Q?Qhp1PeRK9egwXlU4408noaMsfB25jT5NxvtjoQuqfIvDxJfb7oMGS5rG+ZGR?=
 =?us-ascii?Q?+6v6Wqh9pkuA08bm9gVdrVEzAuRXhpGnRhJ9ykv47xTu1OAw5GgmWCO9gt0p?=
 =?us-ascii?Q?EpshMLIC363/lO9JwqoNnsrvn65/X5DrZTS1SnGvS4TFtiX0289XLOciJedb?=
 =?us-ascii?Q?2CltJd+ZvXYNSoUzYMgDMAHvSts0fDCMf6amoaTTMdNGDU166OtKkphpdwFf?=
 =?us-ascii?Q?FkB0/bRWkwN5Ya3+B5SavAxhOBPypvFzWq/h3YzHqV881Frz0fG6dYXXFHO1?=
 =?us-ascii?Q?4EYLU50eABHBan9sngoc+3qtybn6J3YVyU2wBg+7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 490e36e9-98ff-46cb-3258-08dddb6d4fe9
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 20:01:09.7485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BmdjmZYiB9WP/wnqqfwH60/GI+Po+cdiGmEnFSIm0ourNjsMHlZTXpxoVIbkQZ8ZKC8BZ7fSJqDKPuSDkxl44A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4962
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

On Mon, Jul 28, 2025 at 03:29:06PM -0300, Gustavo Sousa wrote:
> We are currently bumping gt_count as we define GTs for each tile. While
> that works with our current code, there are reasons to improve that:
> 
> * That section of the code is dedicated to define each tile's set of GTs
>   and their respective info. The gt_count can be seen as a device level
>   property. While it is fair to bump it as we define each GT, we can
>   also focus on the GT themselves and count after we are done with the
>   definitions.
> 
> * More *importantly*, gt_count should reflect the number of GTs that we
>   would get when looping over them with for_each_gt(). Bumping gt_count
>   the way we are currently doing makes that value not really connected
>   to for_each_gt(). This could bite us in the future if in the loop gets
>   extra checks that are not accounted for in each existing "gt_count++".
> 
> As such, let's use for_each_gt() and extract the calculation of gt_count
> into a separate block, just after we define the set of GTs for each
> tile.
> 
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>



Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



> ---
>  drivers/gpu/drm/xe/xe_pci.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 0d7073a04bb2..12de65756599 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -734,7 +734,6 @@ static int xe_info_init(struct xe_device *xe,
>  		gt->info.id = tile->id * xe->info.max_gt_per_tile;
>  		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
>  		gt->info.engine_mask = graphics_desc->hw_engine_mask;
> -		xe->info.gt_count++;
>  
>  		err = xe_tile_alloc_vram(tile);
>  		if (err)
> @@ -759,9 +758,15 @@ static int xe_info_init(struct xe_device *xe,
>  		gt->info.id = tile->id * xe->info.max_gt_per_tile + 1;
>  		gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
>  		gt->info.engine_mask = media_desc->hw_engine_mask;
> -		xe->info.gt_count++;
>  	}
>  
> +	/*
> +	 * Now that we have tiles and GTs defined, let's loop over valid GTs
> +	 * in order to define gt_count.
> +	 */
> +	for_each_gt(gt, xe, id)
> +		xe->info.gt_count++;
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.50.1
> 
