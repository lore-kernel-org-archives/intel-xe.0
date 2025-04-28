Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA791C369DC
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 21:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA0510EA62;
	Mon, 28 Apr 2025 21:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ElqVvcIG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0328410EA62
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 21:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745874715; x=1777410715;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o0ycHuO490pkHTNNWkxd6q/Zvv24TVHl5v+jGM9qgJA=;
 b=ElqVvcIGOBu4rXm03k6NxvYs13G5E52R1RbiVDLNWZ54PBVu/RS8J9na
 QQ7DoprG38GsGGvFU1ZM1pLW4S1dv4u5ysBz9Jn0a1tz7a9WDpjPrDJeY
 f+K7yLVi8+E7poByiPPv5qyTIDaMkmkGIcUqbvyv9YW9I38B/NnMtZOo9
 NeEQyVNUpkyOvQKQUxs+TqrisOrnsDjxKymFhogA/7USmXGqbw65+u6+l
 RntoIbVHYOrSCf2hXxQG0+qJN8hU53BCu6Cu6IiTfL/ZMWPvHpULLyuXM
 nJTXHfpzLl8TlqMMd8O0VtIGLKPs+yb2gj70vq4iQPjJR7J61X8OE0j8R A==;
X-CSE-ConnectionGUID: M1c38ySPSy6TKeRQlZoWcQ==
X-CSE-MsgGUID: B+UqRgIDQiy1RjermA5gHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="50138449"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="50138449"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 14:11:54 -0700
X-CSE-ConnectionGUID: qEN/k+UbQ/u98JXL6ozqjg==
X-CSE-MsgGUID: 3xL+IGuKTn24cXU/c10VNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="134141554"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 14:11:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 14:11:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 14:11:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 14:11:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y88qTqCVqrONr7zT0qvaleEvd39QVAR7Sd34E3MQLIQmTN4+lgSMARUuZmkG76N4OwckAkl6LvN15/M/Pvt657Vgs2tmEZbahE/XUqmUgWUXF9O5Oam88unFlD1Rua2OQIzg3FCcJ7ormbeuTHqEG6yCTzbEYG0LJqs2AgwQv7Jzueamm0pdyx2k7rg9jtZTtZqxzaQYbeItz7a0qBU4uBNusjyH+Fmfp+GduAaQliOJwwLD0BSxG/CqSQx3QHo+kMc2qOpqR+UW3AOIWTk4byjYEC1j6mCVw+ZEuIVtOkUD50OPo4heAx9mEScEg1nlKD3jjfsFptNUZX1NVLoX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56iT10VI+PRX8mk/10TQsh+iKfOa1MirfvM4kPHI/Ks=;
 b=KnEKEWbAmPyPBpah7Yq7IGZOboo+UGjAhZWcQSJVjuvfEgwlgFZSmEumWypHWYApAdIbkV8P9l0gDgKtKwGElU35z/iVLHUPYQb74nxzNN/B9aFLO4NsTzEZGm6IUOd/HsgO6TL+oCI46xHD9WPcpS2G3fIgodsS1ZPYhjabepjfz3ghOIgjUp2UhDponAYGM3Eg/KwxYuRTO3mevG6L9YcWG9bbsSmgm1JoKOm/4d6Z0jvogdxfpGp2pAP1kRPtuUcUjHziD/9HNxR8dtXIAqqhe3AqXXrd+aXR+dMcaFLaevyDZMu3+DnT1xyGnXFY8n3jlAq+6wsbRvcju7esRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5904.namprd11.prod.outlook.com (2603:10b6:510:14e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 21:11:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 21:11:50 +0000
Date: Mon, 28 Apr 2025 14:13:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 15/18] drm/xe/svm: Make
 xe_svm_range_needs_migrate_to_vram() public
Message-ID: <aA/vabdTEO7sD6O7@lstrano-desk.jf.intel.com>
References: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
 <20250428103224.69534-16-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250428103224.69534-16-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5904:EE_
X-MS-Office365-Filtering-Correlation-Id: 2708fb10-552d-480e-8b5e-08dd86994b32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SoKE5K8CE2fyiQSpwWq2f2ojINtLxzTmike0zhYg6ZV7eoSw83bFMgjUZqnA?=
 =?us-ascii?Q?uKAjwqIcOO+sSRBh08AIOJF812gg9Lq647DFHjARRhzvQJm5kQeKGIZlk4UI?=
 =?us-ascii?Q?DOYvaEZvSXoaWTeaWYebvXfH8eiQKAQwpvpL1nVAM6Oo8pJ/E0uVerAJqVGD?=
 =?us-ascii?Q?TZTPIs5akRc6zKfB/zq+hJ/EvEYtKY/GSaUtD+qZihTZEEBSn91mN2/8D/Ky?=
 =?us-ascii?Q?a3mv1eomdimDbD/qaODZ3xhscoNM7MI6sln0+96xbATa/A7+3TnDPji3IPU1?=
 =?us-ascii?Q?FboOlr3SBj8tI1N/gZoSSwg9kFe5IuvjUEX8EjUbT1kKCFbjY5eYoujbHGVo?=
 =?us-ascii?Q?o4bt07d0s1DRi2NChr+e+jNQMtkQuWhS/G3WNG34rmUeIWPc1vxdZNAqmz2S?=
 =?us-ascii?Q?CVHVPZmWyEgcWOBKcNcMuoeWwpgJawgcGk4n7b3ohHKCKgzwZbFVBjQRI48H?=
 =?us-ascii?Q?Vkbl1DXmvAprn54T0MG45BfJ+kISSs003tOIHQy631gD+FaHnDNAWwh4DSoA?=
 =?us-ascii?Q?nlyQJKua+9qlS2zmHwoKMUn0GePoO3+HcqW5kz6bhl3BGwA6u5Ll1ijw/CGT?=
 =?us-ascii?Q?skDT2wIyt6+QzJLVbrvxGOjBgxYe/kfE4Sv7jrU2KaglhY6xoCA+z5zOe8zd?=
 =?us-ascii?Q?2lqn6Mx+31MiYfK1902eJ3bFj5VnhvYvIgZx/kDCoS0F2UUWBLTETA4Ms/MQ?=
 =?us-ascii?Q?AmBhEg0gXthu29NyEZIoxdnIZwAwsj3B398Zyh8imOykMHOyXhrd4kZc5ac5?=
 =?us-ascii?Q?0Wta1BWEGEBlParFZ0WaWlGApeaM4HZt9YrGWBVhKgSd6mNhFe6MwtYbZ3wq?=
 =?us-ascii?Q?z3IpBeuwfoujEg5tsZjGuFSeHFOGbr2EO2+WrGJx4uiU3u07Hc5Lq+6BKPGF?=
 =?us-ascii?Q?jlvpQ6B/SRYDjTvFf8N0l/J19CnLgKwF7aR4HjB4PsShaqsxwuZsCXhDbj3K?=
 =?us-ascii?Q?y8rxUszCZG9XQW2+YqvoL0lfT9oYNAu4OW/d4VG5+Qz6t7RkuSKfZytOQ1GP?=
 =?us-ascii?Q?a615m6iaG8pEpU2I8pkLN8ubqLM1nK32T7AaN81CPIfAazdwOZD3eQilozcy?=
 =?us-ascii?Q?EgReUpRSb+oOySHH+cZ0O4mwmvjzZTwYy6vRc6E7o6v3YaHNUg4XEA8FUnDO?=
 =?us-ascii?Q?d6j1GXFHT+SDmxlCmljFJHYK7g3yt8o/rv0layQpLC4CB6Ju9ANCq2ua6LtF?=
 =?us-ascii?Q?Y3X2d7n5lcS848Nbdt7PiwDHVOxCeCyHYvkigfq9TgsRFIhBcrEgDSzAFwUM?=
 =?us-ascii?Q?aqnJ+MhE38QllDvZ1557Ot57l7ODGFfCuBMtEQqwqatYfWt6ARSeigFrII8+?=
 =?us-ascii?Q?31CwQ0zvryuuGhgCjHvlqXhklCEqnNi8RwnSr2mqIb9TWtS6mBdugzdZ8VeU?=
 =?us-ascii?Q?4M58/f4id9DWbkiuB3IOTsyc/cjI8MuIGYUIz9ojbgS4MGsWqtStRkAVmJ41?=
 =?us-ascii?Q?YuyFx5Lfx1w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rm9DXvqBzwQbUsIqBoCsgw9EM0We/nGo0+KNbpT6J8cBG2XY63Q1rPWadUQ/?=
 =?us-ascii?Q?hQ+e5IA3Uy3KXZ3olWl+cABi36LrVH7vadCpPDm0WyjXBy7QoF74/MqVqZLA?=
 =?us-ascii?Q?d5lsmoxM3uLbZyXTlsYC7iKLuA2Lv5OUatfIhBLae6x9/mjDz4BM/Y3MqtmA?=
 =?us-ascii?Q?E6hIbzAcdzgpAHiXosPbYKoKellQFhHaazEmzovoZWGeCsyM/Vx9A+cXD4jW?=
 =?us-ascii?Q?zwK9ta6vL0KsK0sbJnkdr498kgkfGzjSzH8UkzjZsvnqr/d94J3f3E1la8kI?=
 =?us-ascii?Q?b6MS5cXOabDIZH0Pv3Ng3GDRrVNDoKbYc9Fl/PCmv3V+k62O7EUnyf98T4Ge?=
 =?us-ascii?Q?TSeA2o49uSstvvQXuagu+NCicSXYZkWvDd/V7z4gw51mYe0nRCuB8rMYCNOn?=
 =?us-ascii?Q?THATuKoxqdv65LUbsFjk6opMt/iFHGIyQle5L6HGMMWYcTdS+kXUwSNn2rHK?=
 =?us-ascii?Q?+f1DDQv8hktf7GAqm/yolzwuslqwJdJuYpJsfkWTbAq4uFNyu9MVgUGXdn+r?=
 =?us-ascii?Q?XV0xOkO71yFQD/7hroaR9S+gejovC0iZ2FXMiIq40kUeRt4aBPHz1FXUdxDW?=
 =?us-ascii?Q?gsib4n/DkQMfZ3HUVwIZquZ8UwybnVIgSZOrkrEbSMmO8O0EBjMtfamByi/z?=
 =?us-ascii?Q?udkOplC+oya89LyhzvQDwxTMw/zgh7kGg/vww4y3hGb7uWPEmWuuf3RL9Zg4?=
 =?us-ascii?Q?M4iaINRs5lKnin+GuMn7IV4fyrC+sMEgOdeiTXLCuuVnBAuxUmUwITJUWOj8?=
 =?us-ascii?Q?nPAVjKysyFX3k0na9s3tCgGyD62D1Snv0NnLKWL4L9f5aTeoLV2kZHcwl45j?=
 =?us-ascii?Q?z4rPDan8OhWdBezFSybDCnigeeakm0TPnBO5oY0SpfkaWwNgLH02skBxRz8Z?=
 =?us-ascii?Q?g/G6wbV94YKA3IYlia1hOpmIsQjQ+F+5WbyPfALPnVWTckGYpDtLUYZkEd8J?=
 =?us-ascii?Q?vj7RI3A/mCM0NuAoVVI4l4NnETfFq4T0Uls9fTVtnB6GqAX6W9QatKSKy7ln?=
 =?us-ascii?Q?xyDGMEcmdJMdiluORCseWB9AN0HtJze/vHvzdyAu2tpGmIqGC20FfInUWF26?=
 =?us-ascii?Q?NpRaBVSTylqff2uICnFzqfj6AT9sd6WIysVSfH9QInLX67L24MLxeMZaDCjR?=
 =?us-ascii?Q?udASkEE/OXdluYJikIPWslQTKUyBhNGgaZ/ayCT3WBR0KQWUCoyDICJI3ZF6?=
 =?us-ascii?Q?/Hgs9fLF9RpruTRLTpFY63/N9TzKbNCV6nEnEYXdXFxoFuTsXT4Q1UtzNuzS?=
 =?us-ascii?Q?uqkZ4IQtz+GWWqfYYUT/X1EFMmq/asQCGhsTRMlZaZo9yerT20HFCIgNIphk?=
 =?us-ascii?Q?lDJ76x9xDJUaDw5DTL9SFNA6+qvBUi22QOyxipj+P6sEzWvFQ5wlxCKCMlpV?=
 =?us-ascii?Q?HkwPzAjgh47lvlDuPMMpJfw4iXV0BxaMPfvo/i6wg89xitAwZKH/3/UEL8ws?=
 =?us-ascii?Q?PjjhMSY+X/DpemfYEE9/StcbxcPd4yAr77b0vyfR4KrITwB7We0Y7Nxmclon?=
 =?us-ascii?Q?NUFD+dgssqtaENa5pjg/oNKlQHHfTJMQCWbVAJJjiVV59wDFGZtJxikJfc0r?=
 =?us-ascii?Q?gWwWowiXgPEHe19YgKX0zcRw9zgBRltxfEE1bfeTVP3nDyW+hkzDPF68Hzay?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2708fb10-552d-480e-8b5e-08dd86994b32
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 21:11:50.7468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOVFMp4u8IgD7B20gRZumGJLDBi6/gKVdembdWossI0FUrWOx+oVoXLqX2MZowyXw87BOwvPOp+Bv16rXOCTyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5904
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

On Mon, Apr 28, 2025 at 04:02:21PM +0530, Himal Prasad Ghimiray wrote:
> xe_svm_range_needs_migrate_to_vram() determines whether range needs
> migration to vram or not, modify it to accept region preference parameter
> too, so we can use it in prefetch too.
> 
> v2
> - add assert instead of warn (Matthew Brost)
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 26 ++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_svm.h | 10 ++++++++++
>  2 files changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 72263df1d69d..90fae13b77ae 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -719,22 +719,32 @@ static bool supports_4K_migration(struct xe_device *xe)
>  	return true;
>  }
>  
> -static bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range,
> -					       struct xe_vma *vma)
> +/**
> + * xe_svm_range_needs_migrate_to_vram() - SVM range needs migrate to VRAM or not
> + * @range: SVM range for which migration needs to be decided
> + * @vma: vma which has range
> + * @preferred_region_is_vram: preferred region for range is vram
> + *
> + * Return: True for range needing migration and migration is supported else false
> + */

I think this will need to refactored for multi-GPU but looks good for now.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
> +					bool preferred_region_is_vram)
>  {
>  	struct xe_vm *vm = range_to_vm(&range->base);
>  	u64 range_size = xe_svm_range_size(range);
>  
> -	if (!range->base.flags.migrate_devmem)
> +	if (!range->base.flags.migrate_devmem || !preferred_region_is_vram)
>  		return false;
>  
> -	if (xe_svm_range_in_vram(range)) {
> -		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
> +	xe_assert(vm->xe, IS_DGFX(vm->xe));
> +
> +	if (preferred_region_is_vram && xe_svm_range_in_vram(range)) {
> +		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
>  		return false;
>  	}
>  
> -	if (range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
> -		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
> +	if (preferred_region_is_vram && range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
> +		drm_warn(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
>  		return false;
>  	}
>  
> @@ -800,7 +810,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	range_debug(range, "PAGE FAULT");
>  
>  	if (--migrate_try_count >= 0 &&
> -	    xe_svm_range_needs_migrate_to_vram(range, vma)) {
> +	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
>  		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
>  		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
>  		if (err) {
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index cafca625bba9..9be7bb25725c 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -80,6 +80,9 @@ struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
>  int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  			   struct drm_gpusvm_ctx *ctx);
>  
> +bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
> +					bool preferred_region_is_vram);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -266,6 +269,13 @@ static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
>  	return 0;
>  }
>  
> +static inline
> +bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
> +					u32 region)
> +{
> +	return false;
> +}
> +
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> -- 
> 2.34.1
> 
