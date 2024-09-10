Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175FDEDE9AC
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:40:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBD510E840;
	Tue, 10 Sep 2024 18:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4p+P1eZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CF910E840
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725993613; x=1757529613;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nCOVcgG0Qh/tsqDrYfD1lzE25KPWl/FOJT3gnjfdbT0=;
 b=Q4p+P1eZyZf20v7WSecSjwKAL9+vSVUtMp975w+pykkqVh2uEzo/VZ1A
 wdepZiiieCCGZh/3b2L7gPJTmqjHxPwWlN/6OZBWYwBHco7bHyS9aGWH/
 A/3ZRAmkJLLEylxZmjIpHjrHouZ8Q/x5NjC/De1RvdJ5IuRxV72ef2EyV
 qyWvuE4gVKiShDnxodzj43cQI7zNYKjfezJ2AZLL6ea+9axSzcPQLBjoL
 Ccl6mXHLq0Qni4+UeE+b4UqtWURureectut4hblQZNE3DF9Sl4W6IaP5z
 FwQiEMJonqYtngbS/L8xAdzLKczvSn98YN8jpQOEXzLDyAJ8wlZ9a0Odf Q==;
X-CSE-ConnectionGUID: WnwmBFhTQaCTX0dVnoLDjw==
X-CSE-MsgGUID: YpWnxZzwROmqDGYwzecU+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35904427"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="35904427"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:40:12 -0700
X-CSE-ConnectionGUID: YF8phigCStK6Okoqa8Xt7Q==
X-CSE-MsgGUID: tyqziALPSoq44+bHy4jZIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71883943"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:40:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:40:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:40:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:40:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OesiiDfGuhOHmqRthS5Cc2aV3fzyoLPbNKbWZTtZrwfIbUjNX8K1Odv8cRREBQzSmHaecFFi52zrFPjXo5LuxE430CyLIpeRp0qnuc7c8VqBv/Ul+aWQAMWvun4nVqNxJJRekWWLeciUkp90IZddtVbTGbJmVA4HS7znfpU9uTv66/BVkv0YzyvX56M8XiYcKYMxTjmmfa3Wu/k9a9cLakPNcUgP07xm/DL3xBLMN6n7qU9FQbGW261yQkT7fQLjs5kLC2mYmnoWRazMvAhbjy+rMVqsx+A2VhSWhSxTwr+Hy2gG/htfXrtekPDQG2crgLOXoZDDzCukyxPKvNBANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIR3GRYZ3TRWDDQkrcIaLHF6M4lOrEn9NI5146PQS3k=;
 b=HmKv75LGwm5g0MdLiyqi0HdUar5TQ5r0AlgdW1jF8Kr7c+QUJuxMcGOueqKXQTnhcSQg5FNrzf73DExve2IqngfEhwUqVYRffUUK7NEDeuj8KGREGjw7BomPr9DIE48QSMTfUqBuGMU5UrolqPlPzW7ejdQLKAFmR801D0U1rRwBkQmSf2Y1chaR0V3OWyWTpHe5XhznUMInzd85jbJ0VpKRymEsECJjKS9LR8tWYsmFW5gYfQGo0X8WqThbOg/xftlzBYItnsWPmvY4CZzeAGOkT7cBol2VcLrDpOYCn729gncdERg35bE782WIbG9irWQOQymOLGzI9DdBsb2Iog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 18:40:07 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:40:07 +0000
Date: Tue, 10 Sep 2024 14:40:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 18/43] drm/xe/pci: Convert register access to use
 xe_mmio
Message-ID: <ZuCShHJy_rJpGfCH@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-63-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-63-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:303:dc::25) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 126352a5-96d4-441b-de79-08dcd1c7fe4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fYMo1xlWIeIJ0BNRrHADr0R5/d1C3ngtFsBdS1MHtGR8eZcK7HzRw3YUG52z?=
 =?us-ascii?Q?ACNJruzxMX0ncHHwFJnXRVhuHQFG4mzOKlMuaPVWqWfMzqIcVSWFRb4D4MBq?=
 =?us-ascii?Q?gj7g/vq+ZJe3KFKBrmtQO7SMXQP0UVOSUGAqzfW2dbnAMjHFhkOB0PnVE8pi?=
 =?us-ascii?Q?syYmDgP1KSJFzWQcZtdM35b2Es5sKcsjaSuiCmx2JN3QkznsOqalXdLFA2Xg?=
 =?us-ascii?Q?w0kVvnGQd3sgWnNjRSSA1Q3iITCweYqkfIOXXWp0NUX70Y365Ifyuaelhj3t?=
 =?us-ascii?Q?Z60psNTmY922S/YWF1cOxN9s5LajHxAvDYj2xCCIdcm8JVfhOGz4BwCWXn0e?=
 =?us-ascii?Q?U1e1SFch+im82uLyvmKES/6+v8VQqlPLqDYsU304pi44et7SxuGm6hzCpODc?=
 =?us-ascii?Q?I9n9syPMA3uKlJAYER9F3kiYSMnlnRjYkt4THv6O04+/vaJeeDvGUoEO/6s3?=
 =?us-ascii?Q?AeJuHP0AqXKQbOvMmMAqBLmpx1Wc1qim9Nf0AihekMoOkBWW9L40e8TXvTOe?=
 =?us-ascii?Q?Rv7MfCa4gZYI9l/SJScz0K3jZ1qAq/FCYtJD1P9eIvd1moiawX4DIjYSw5Hx?=
 =?us-ascii?Q?AVDxiX9lkEMFLU1jjdON6o2vK7NoEvE5Ewnj6oiTmTVefqgAbibZRdjVOjgi?=
 =?us-ascii?Q?MYQIBBDjvbawwyeSYlQ9shzbN7Lz9BL2ZSVbfoR4Gn1dp609VOd0CAssGC56?=
 =?us-ascii?Q?reoBtoAatTMPapzzCbQnXWV4uY5KojcgxfuNRtwCR3bjIm3Llw+ftqqQKBwE?=
 =?us-ascii?Q?EajcI5URrVLU0XD9Q2+Z/eXI7RxnaJKOv2qVHYMINN7jaM68btMoCTn/8lJ2?=
 =?us-ascii?Q?ccfDHj/rPw0uA90IcfnTk5ptyZTJr11X7/mcugAayN1bG0omdpQbhUJcN3Tr?=
 =?us-ascii?Q?vkN3J1GYDxpSD2EXPqH+Tk1o4CDQMEiS1bMrJ2t6YFpkMA5UvifPqgjGzo+m?=
 =?us-ascii?Q?PiBhd3TKRw4nbtemRn9IogkQTCIea5e+6XDl57E1RyQn6J7WIbVDVVglv4fh?=
 =?us-ascii?Q?NRH1TdN15qzn5OZkPH9cY9guUXLxk63kzs+sPNJ4v6FVBSDaKVqKr48gcNx4?=
 =?us-ascii?Q?wP0gCbhRMGPpNLhJAAqQA1uN4tOUYwCn+Vpcb7Nr27SGwDR+3Dlv8QF9TwQj?=
 =?us-ascii?Q?Z2vu4F6bIuAwfVsvcsG7nrRO1RGrZwEfdrp3JIV1XFRMERMy3bK4a3Y68aKW?=
 =?us-ascii?Q?jDG7kmqEpuAcAWfrTgkw7x9LptW8AcjihNO50XT2jPzz3vP+yA/7DMstF4e3?=
 =?us-ascii?Q?eAULx6c9u4sa+6LgaaOuQFlNxami1k3w+WOUAhwZEv2rHUEeEbXDBPIaWAmK?=
 =?us-ascii?Q?Z3yQCkDwsiEjRpdRVYPTTa6fniS/zPrYlKxx0ynjq/z9yA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h6LmvkeLehhom/ePYjHQskmZWwKhgHoZBKHvh7UNgEi9IxcjOg+Wy6LNBFEw?=
 =?us-ascii?Q?oMPfj3meZv6azVvtWU9Q2S4HVn1bPYjlP08lLYZU6PtOmjnIvacdsGI1fDUg?=
 =?us-ascii?Q?ea5VeYFY9nYWng5B2SH/fXhkHxcd5Y6t7doyK4adr16L+PHY7J8zS+sMjKht?=
 =?us-ascii?Q?v49y+EAtC55io6McaJNNil5j9oibuHvMPZpu9qRH+tGkqgncasTPLZfeu41f?=
 =?us-ascii?Q?k4MeRhjoKni0aU22MxoPJZWPSAqP++Jx07ARcTrb5ZiVEKMIqP7SoVy6gTyf?=
 =?us-ascii?Q?D9J2DQWrfnBSuE/3Jy8pr0kJKW8nf17o/0PdUJFJ8F6m4ISJz5fXXW/7VNK/?=
 =?us-ascii?Q?MygQNSd9sntk8OH+FY60i1RCUV5DtmyIUJXPE7sm1NHWL+TCgN/1eKcnOEmu?=
 =?us-ascii?Q?e3QVOY30GcsENli2Y00FOlowNyFrPCMhvGtBp+fBRAkvfGEE7QNlH5SM14oi?=
 =?us-ascii?Q?OHzEOMtEGlVv3txoeiE9jSMezioAhPrOn1++BbWxQAvNQHxbHl/HMhQmnXuV?=
 =?us-ascii?Q?xUVplUBZRq1gXKIlHeXHRP+UYAVOwviRDpONMIKCB3HE7sPZv3M3TKTxfFQ6?=
 =?us-ascii?Q?jyl8JaGoOYGHP2IGhb/Qydkbkw1AGMNwRbJVu0CxuDIi6EqB6zcVzW0adrFA?=
 =?us-ascii?Q?pGXq2XSZfL1QmrOHf+ZA6bqO3EGXqQWuwTy7ABcPA7kg3dQeiigSqbzfV7zD?=
 =?us-ascii?Q?xmk/ReeolF05B+GbdMx6JugXvbJn4PC7iL8O9IiCWQ9DjOT87Zo8Kr7lyria?=
 =?us-ascii?Q?69ue2IzHsPoYJlniaNK5/v5LHh6cbfkHVTAXs/FExMOXOZYme0SHia4nQupx?=
 =?us-ascii?Q?YUw1ktRAgo5zW1TEKnxIgYaxGiBCoXfOdjfB3oTTHWY9ifvqYDFuJakpSQp0?=
 =?us-ascii?Q?uFgSJFMd583RTgGww+7eqSVOeTYJSX3cS/Nr/RQajCe+//emt86UFM0hI1nZ?=
 =?us-ascii?Q?pW1FpYUZzomggKJN1XB+pHt921PigE9UvOxg1sMz3J3pB1LQFJeM3P1r4Lp4?=
 =?us-ascii?Q?iMhWhOHFOdwlKjrqnsMZAoYvF1cC9HIziEq2EnmPlgtcLu5NLG7odTsrugcb?=
 =?us-ascii?Q?TeXqI+huDe4PUGSZPUuuByghBqrpDpteqMXVS2arh36pCPNy8Rmx8Tg2+qEq?=
 =?us-ascii?Q?ksMVB/hrJJXIFcerw3QA8cTWWDXZ4etD834GgTHfvi3TMvvWYPmzeBdrdnbS?=
 =?us-ascii?Q?T2DnCIE3toSngvgNpk98emfA8FCnVUqTSuvnlgIY6lbJNW56zvWqmXMO9XWi?=
 =?us-ascii?Q?IV9TOaaBX9Y+pNQ7qDZDqjoYns5qLwXpxxK0LWN9d6OEvpE/gv0qvbg0hRM+?=
 =?us-ascii?Q?eef7zzP1R5PhXIusyCBspXTPgJBQ/GiQs3D8UfRMYzHmbpvnnQ3+jReP4xKq?=
 =?us-ascii?Q?kN1h6pWKCI6zpOSvFKRcx/yYsNf1TDIU6fq7SC8D/wRYOMNxHR1k+XErE9fO?=
 =?us-ascii?Q?fzFVQ0MEhDha0tVgiN25Pj4tDyOxyqtzj06E/bmURgViEyuJfMUdtjTMxjl2?=
 =?us-ascii?Q?gYlNaEXIXf+65fVAczXhKT5asywafIgkD8znVMNPZJUykN2q8NYM3oZoKTON?=
 =?us-ascii?Q?DC29CyhxTFQjjJ9ycLhLrrz3ibB2Afzfu8DpZ0W0Hhk44k33/1A64rsOKwM9?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 126352a5-96d4-441b-de79-08dcd1c7fe4c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:40:07.8591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZ0L35T11pQKbPC+sQsFpdAtrlhRAPZvh1ZYhK5b3VUrbJgEyZF7QRitHvxGlCa0xIjckioUA8i4m+Gdn5z6wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
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

On Fri, Sep 06, 2024 at 05:08:07PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index aa0c29450b4a..e0188ef9995e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -473,13 +473,15 @@ enum xe_gmdid_type {
>  
>  static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
>  {
> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>  	struct xe_reg gmdid_reg = GMD_ID;
>  	u32 val;
>  
>  	KUNIT_STATIC_STUB_REDIRECT(read_gmdid, xe, type, ver, revid);
>  
>  	if (IS_SRIOV_VF(xe)) {
> +		struct xe_gt *gt = xe_root_mmio_gt(xe);
> +
>  		/*
>  		 * To get the value of the GMDID register, VFs must obtain it
>  		 * from the GuC using MMIO communication.
> @@ -515,14 +517,15 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
>  		gt->info.type = XE_GT_TYPE_UNINITIALIZED;
>  	} else {
>  		/*
> -		 * We need to apply the GSI offset explicitly here as at this
> -		 * point the xe_gt is not fully uninitialized and only basic
> -		 * access to MMIO registers is possible.
> +		 * We need to apply the GSI offset explicitly here since we're
> +		 * reading through the tile-level MMIO accessor (at this
> +		 * point the GT is not fully uninitialized and only basic
> +		 * access to MMIO registers is possible).

it is kind of strange to mention GT initialization now that gt struct is
not visible and that we are trying to detach mmio from gt.

But well, perhaps the strange part is this entire manual offset thing and
this change in the comment is needed now that xe_gt struct is not used
and this keep the meaning, so


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  		 */
>  		if (type == GMDID_MEDIA)
>  			gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
>  
> -		val = xe_mmio_read32(gt, gmdid_reg);
> +		val = xe_mmio_read32(mmio, gmdid_reg);
>  	}
>  
>  	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
> -- 
> 2.45.2
> 
