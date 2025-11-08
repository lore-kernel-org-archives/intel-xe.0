Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC5BCCF9F8
	for <intel-xe@archiver.kernel.org>; Sat,  8 Nov 2025 00:06:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9B910EBB8;
	Sat,  8 Nov 2025 00:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H89gHSxK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074A910EBBB
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Nov 2025 00:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762560411; x=1794096411;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nd5NgzGqy7MZZWlf4JpXZjLTchGCYsbN2XtzAXg9qfQ=;
 b=H89gHSxKqWd/O0uVLA3wadOAjbcvfl9sLSFN/FpHF1dXtp/vr2h/rop3
 Ye/zH8h4qxq9uGmz68uavVW2Sl0GJnrdkddGBZ6lnOxgch0fTOdMg7q4N
 1mJdCfr1MRyuNP94sKcaA8x3ZTqGv9J4VD0iXpsIiGkZoJyeacjb1vWYs
 Ze2mgmFWIJE3d7pHSKXy9C0kdoeQRMo9HAZWabXWtKnGHbQUxfinc8jAb
 Me7C6FZ3fSMg4o/NNS5iuhfshrJLmH1wg7QE+uTwq9xPRBHGSsuideLN1
 lz4wW4okEHJ2AfDlsDdzZjlGcwtnQmtkelO7Pf+/41sw8Lm6W8cVKfZdS w==;
X-CSE-ConnectionGUID: b2xVbBC/TXO55V5RQyMM2Q==
X-CSE-MsgGUID: O6qgCz6FRc6D49mv7mD9jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="87344731"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; d="scan'208";a="87344731"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 16:06:50 -0800
X-CSE-ConnectionGUID: SxhCB19FSeGWpalBfIA/iQ==
X-CSE-MsgGUID: 8zKIjh1LReCPZjMLpxNtxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; d="scan'208";a="193339996"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 16:06:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 16:06:50 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 16:06:50 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 16:06:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bskiTymIkVbfeURpusRgECioy0cYgQuoCWNpYnGE+h4qN2xkRJuMY1cVXQ3oUAzx19FBJ4CcC5r8q9/Vmn2Qj8XjBscIO8xhRd306md/G3AZKsLpBwhB4YFhUor58YRq13ivgmE6aKXtLVfY2bq6VQDvoHbslbDJmXx6TMToj2W1yGUTv4QAibpjrRsfwDBEU/ffsmN4w1dZ0hs5wkcezZ38dtiBQMVuHZQpC4gh5NnNXk9D93dtLJP/qZa79pjvrzyNILK/7V22bIBlWe0/ofisIqU9A4D/ZCGZYqqAXwwgjQel8cIo48L5F8Ydni0CHkA6CEsJpx6uacs3DwyKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtBh8rsI7xafAOFZHFXyv4zK5JxlgxhM9zQWGqwCyfc=;
 b=TsGILNDo+KTx6PsJDP24nDbCxr3uizUMKKNbfnrlt9C58cubQKi2ksv1FlVWrHrGUzMcRZ04SkOgy/568Gzy77Tt3x4MZ5ln4FQ9u/IWBBr2EwQGpqEEJwRqKiGen6KpgCaVl7jtRU7aLvDfJTbiGUQ+FftZFFwNTTwgY6ySy10zSMD4gKkp+QTsUe9g5Dcd1ApNO43e2u8KvRvgzbOU/+D/dVouG24UUTLTqJ/1e+X0+YwrOnfeRWhxxiLc3iyh4c0Ep6W6qql4mO4ekBpL/kmCu8YHQ8Nh61ZJTefys4r+hJ+2IDp0TMuJ8bWyrJNvcW3IZ11lpnk94fkhMtVcpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB7031.namprd11.prod.outlook.com (2603:10b6:303:22c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 00:06:47 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 00:06:47 +0000
Date: Fri, 7 Nov 2025 16:06:44 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <fei.yang@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/vram: Move forcewake down to
 get_flat_ccs_offset()
Message-ID: <20251108000644.GC4063759@mdroper-desk1.amr.corp.intel.com>
References: <20251107-tile-addr-v1-0-a3014aadc2e7@intel.com>
 <20251107-tile-addr-v1-2-a3014aadc2e7@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251107-tile-addr-v1-2-a3014aadc2e7@intel.com>
X-ClientProxiedBy: BY5PR16CA0009.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: c5f0ca83-7e13-4c11-e36c-08de1e5ab553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IE7O4Ey4Akn2VtwWdApwFZWYt97nwsUnPE5Kti6QDj9CrAtuef1b2J9Ee13c?=
 =?us-ascii?Q?gs1eecpfhXdg8bCEZk2d5zIOxcikz32sj+FmYoyZaCkReeo9jUAg01HTjba+?=
 =?us-ascii?Q?phd4dPb2RtkhlzM1bsO1538JRC81XihONosBSquFeOROKcqjP8SauanVtDD2?=
 =?us-ascii?Q?GxfwTEblu5bHJsa5YECG8t/TlBWQB3XQGTyd3ZTQYim/GnZL//Za3r2BGJf6?=
 =?us-ascii?Q?gM/wr+nGVl2qydpBqYqxS74hvaBPx/ZSO0tsCMWMtPHJ+k0nSgSguFHVCqfH?=
 =?us-ascii?Q?2CPX9SLXzUiIjCPVGH589h5ppuiQx+vMa9ymM0UiB/z1kuXvjn8Ly8u/G36p?=
 =?us-ascii?Q?cXNygzaa6NuKvQM44C7mRgow5bLrqaNJ1HTAKnpJz/M+ElqIQnEb2dKIogh6?=
 =?us-ascii?Q?B8f3/rq+d9SWvL1jyqKTKYFmJ6qH0xUoOQGPg8fnqvRl0pF70W3vGHIJx8Uc?=
 =?us-ascii?Q?Olep+4taDzuGwg7A4tlLHGAvmlp0fXyzqUkti52jljLNSjzh/Mrc7Cug/6h+?=
 =?us-ascii?Q?roETHEqkZ3sF/o1YSONQ8aXoID2c5vo6S7R9XBmGieJYQYw14dRRqowlbA8X?=
 =?us-ascii?Q?mWU78+GYpEalrf+MfiAH3H95a7wexCc3tp3ZOFjiNGAXCbXaNP3x5vEGoBPm?=
 =?us-ascii?Q?uS4wKN86zXx21u5OIpM+Ks/Sk5bCCiftC7hthL7Y3tgSv04ZPOmVC0kPjKvh?=
 =?us-ascii?Q?p+OG0BD0GTjbcFhrZE9ZgVk+FGQRlpM87kmsmtXXG9yMq/8dYLCd0mkrkBwL?=
 =?us-ascii?Q?XzqHHY4NsLj37hitBC04KugEUS4OLft4Yy/GVDvIj/q9csP9mVVySnoVLvt0?=
 =?us-ascii?Q?8On1tmO608en92W0zKSVOizVKprJ+MsDu3YswtM5D9KYciElG3iEvFKZnRP1?=
 =?us-ascii?Q?4TiVIvnJY5lggevDnxU8zs2tTCzv82jd1CNxUseUSmlXtxx9SqG3/XY726zv?=
 =?us-ascii?Q?nO3SOtVuPcnddk3u7Jgm8cpqCQDBbHWqyy5ktKN2jwFl3U+oTx0ryDpUVYM8?=
 =?us-ascii?Q?M8qoiyJTPIQvulMVlL6IUEfy5kA/xzvwBPLAX6r5R3GBQdzu0xsaCaoTD0te?=
 =?us-ascii?Q?DU83E41tGYM/KxtawKEPlfc5lKGY6YHIjefd/ndSl798oOmF9ggEc7R2IeqP?=
 =?us-ascii?Q?FWP/u02ITTIjV9/Eun0E9wDzjMXup3aY/NsNCHgo9hZmQQJnev4zi/q3X1OO?=
 =?us-ascii?Q?NKsxTBQrUKuZ/Nq96YEkL6QzhUl4cXSNeMDJ/o9EMmZ7ItNjUvpJmKJ2qm2P?=
 =?us-ascii?Q?tHvi0NCUrnYzeny2WH317tQAbmkI1kWLWNgXjHKG9Ihhmke1D+5djA0M5G6T?=
 =?us-ascii?Q?qlU9lcIDQDkq1RDbsdbjTJmZkEZevaAfSCKRV6iPEoKOiGk0/BVdRbPYyVXG?=
 =?us-ascii?Q?5XlLqPg7uc/yyWKtxpCPqhWMCPZNEToAhKoc0ErmYYAhXkrJb9wNvkPtW914?=
 =?us-ascii?Q?zKONViAqvdey4RP4WF+y66ITQdanGf08?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TuhAtq71bz6jKsfwbBPsBcIhR5LXb7Q1a70sabDhW8YPShg3zkblntko5P/k?=
 =?us-ascii?Q?bO1azE4t8CxAAMCMl8DEVZz5FMGrvUdklKQDz8nL7cOZmS2vA2iAJ2Cfxg+p?=
 =?us-ascii?Q?5MSXPdeQkvmA+fvsA0ztp7zJub/xf9oisCx/emkxmT9U1MJCQgpSD0fjsHYt?=
 =?us-ascii?Q?GDRePXu+8dSNPP8m7qos2DkAl1e52JoXWmeyShNOcwbX+/EraBphVKrsRmZ7?=
 =?us-ascii?Q?x+w658IhFjR+Goruz0jM/bfc5o+4m5qhcxa8aw/rzwuW+aD+nrFRyjpL3Zwq?=
 =?us-ascii?Q?ZixatxNdGeqlnr6hM83Ecdz8ZqGSkYQVhXtnSSaJS5wqBDvj4pDVxV6c5qZr?=
 =?us-ascii?Q?IbCMcZKpPx1dIJfEw0k/e0M9dJ2Saf1yS8E9qmoiMrz5mDo9iu2vpbgZV15k?=
 =?us-ascii?Q?t1Evyqltvk8MRbmuvmRvFFjUL+3f6P5WqnA1iFFbGmRwm4FDRpQW5B881H5v?=
 =?us-ascii?Q?sbSKpxe8mkix17YAWdm/ZQn6VYUxQAdQzs8qagY9hK3Km3blY8pbFLYtAc15?=
 =?us-ascii?Q?Nl6VuHIVPLC9KA2evct4ialuPnoBw1jnRuxdg1HIUfj+oZrYDkcaTSuVLdru?=
 =?us-ascii?Q?gzeloJWrZoj5Uv8WeK0Gh5HneriY4eEwngh3VIUY+zO6wxzlUcOQ7rZnaOaA?=
 =?us-ascii?Q?WqWI+5IxInRJ+bSUN+mGoo+V4HM3hGuuPZZC9Im6GSGxhg4eTAFWS3fDwPJk?=
 =?us-ascii?Q?G7M2iR0K16gocg36dbGaY2fk5SNkq3RoRcST+35EmeRWwbWtR/N35kPwaAPZ?=
 =?us-ascii?Q?rkBxfA7+6pPMEY9AnYQJmOjJdlwVROhtEU2FGn24RihOk/7k9Adgj5aSZ0J6?=
 =?us-ascii?Q?xhY9Kl4z9a+QHJiJ4ZrYlM8Xk5R4IRJ5MdGhNvTr0IvBLrrbE9TzZDB4ApIC?=
 =?us-ascii?Q?GlheDDr7VaWO61VQyer1/rB9LmjqSnor2ld3pM1EiMBxH9UWWrCbNTjwd6wu?=
 =?us-ascii?Q?xYMSvxkHWS3YJHpp08n3kVFyfQIdgKG89V4rlaw67i/NKFAsFlE9S51qopjh?=
 =?us-ascii?Q?NUPY/Xx20fdLl2JOr8mV2ZcJV+Mg4rVmr1Rp5DAS77yisOHJfQJGqFGgBoRl?=
 =?us-ascii?Q?xXgO664yP2DJ79YtAO1t0fJAPDCPzZg/76UZqT/nDX4bBqhEYcWMCQyxYMgR?=
 =?us-ascii?Q?3NPnj5Rffxuxep4nFyv4B7DH+83VJU6uD5wLZUlHOlvW6vy0JRxNUr7RyATR?=
 =?us-ascii?Q?VnQ/aViRWaE6RJjxHK8lpZBIsmEoz3UBjgLEDm0b5QX3V17f24QNlxcw/JUV?=
 =?us-ascii?Q?2Um1ONS/ISAvEAPgd1H2XWq84TVP7JZfyyHw0e95yQGWErtnNNDqwm8m4Z2a?=
 =?us-ascii?Q?QY92oy9tUDPMJOXjZKkab9zdnfEJCbmvGZsTMW8MOfWGtRwuwNeJpu9WIqLA?=
 =?us-ascii?Q?10KZe+7l2eDdAAV23rz0hMNhm+as1n6zcpr7/3Pn1Bc5jw2q/+sldyXkxW5n?=
 =?us-ascii?Q?oMlGHBiyG8r3Zqv1PtwTNz2WYxHRFBeEc/F7FDqaQtMsbGdLq31EhN4TJ9ZU?=
 =?us-ascii?Q?Fd/AdraZpWwkZUrSmGgKOMWbI3UNROdNw+x5fc0cxIuXWlLaAKHaIk1A39rq?=
 =?us-ascii?Q?z3YLg6lpT2v/5gSfiPgpnZaD/YRzRsJKXxMnhX/DXgNDEazguhWdraPFv24T?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f0ca83-7e13-4c11-e36c-08de1e5ab553
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 00:06:47.3512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXaLAiu8m9ba8htCzc37Rc5pKwrLmpCXnSntp4FixWAKaFEnoCQcTbNcQcC/jrpM2DW6FyXKCd859c3j9c13+/BjU6qVlh/rdKo9VQ+KkUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7031
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

On Fri, Nov 07, 2025 at 10:23:45AM -0800, Lucas De Marchi wrote:
> With SG_TILE_ADDR_RANGE use, the only thing requiring GT forcewake while
> probing for vram size is the get_flat_ccs_offset(). Move the forcewake
> down where it's needed.
> 
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

While reviewing this, I noticed that the xe_assert_msg() we have in
get_flat_ccs_offset probably should be a regular warning/error rather
than an assert since asserts are only checked in debug builds and should
be used for "we know this should be absolutely impossible based on
software logic" rather than "we hope the hardware/firmware is giving us
sensible values."  But we can change that later.


Matt

> ---
>  drivers/gpu/drm/xe/xe_vram.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 56924f6a44ff2..0e10da790cc5d 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -183,12 +183,17 @@ static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *
>  	return 0;
>  }
>  
> -static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
> +static int get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size, u64 *poffset)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int fw_ref;
>  	u64 offset;
>  	u32 reg;
>  
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return -ETIMEDOUT;
> +
>  	if (GRAPHICS_VER(xe) >= 20) {
>  		u64 ccs_size = tile_size / 512;
>  		u64 offset_hi, offset_lo;
> @@ -218,7 +223,10 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
>  		offset = (u64)REG_FIELD_GET(XEHP_FLAT_CCS_PTR, reg) * SZ_64K;
>  	}
>  
> -	return offset;
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	*poffset = offset;
> +
> +	return 0;
>  }
>  
>  /*
> @@ -245,7 +253,6 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_gt *gt = tile->primary_gt;
> -	unsigned int fw_ref;
>  	u64 offset;
>  	u32 reg;
>  
> @@ -265,10 +272,6 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>  		return 0;
>  	}
>  
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (!fw_ref)
> -		return -ETIMEDOUT;
> -
>  	/* actual size */
>  	if (unlikely(xe->info.platform == XE_DG1)) {
>  		*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), LMEM_BAR);
> @@ -281,7 +284,10 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>  
>  	/* minus device usage */
>  	if (xe->info.has_flat_ccs) {
> -		offset = get_flat_ccs_offset(gt, *tile_size);
> +		int ret = get_flat_ccs_offset(gt, *tile_size, &offset);
> +
> +		if (ret)
> +			return ret;
>  	} else {
>  		offset = xe_mmio_read64_2x32(&tile->mmio, GSMBASE);
>  	}
> @@ -289,8 +295,6 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>  	/* remove the tile offset so we have just the available size */
>  	*vram_size = offset - *tile_offset;
>  
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -
>  	return 0;
>  }
>  
> 
> -- 
> 2.51.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
