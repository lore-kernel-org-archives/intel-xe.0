Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCE9C369DC
	for <intel-xe@archiver.kernel.org>; Thu,  1 May 2025 20:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEA210E119;
	Thu,  1 May 2025 20:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BFHi7fXT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF16110E0AD
 for <intel-xe@lists.freedesktop.org>; Thu,  1 May 2025 20:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746131995; x=1777667995;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U7kZlh79Ipzr/AgltlkNcMtC83EGKAONVURA4wtLQwo=;
 b=BFHi7fXT8dJ76PhH7PWrmpPP7qqHfg2hDSsdhGNYd2GDg/a25VnjgS95
 MyERWzM9UNI7fDMt2vZll1UWikeMbR+Aq4RDNqIm0riuhNT7fHGiRbmn3
 +PblobYbNXtoKGc879H0qNjFRladKlJMlxDAT0T06igUkNiUTXgqmpc7k
 qNa53DsXg8/UUkNgG9pUwV2GarQEuP4skRDoIKw4E2yvqMC76Q3IpjrFO
 M32ydTCL2T6MHU0+mJNQY7tHbp8tbp31bUr6/e4hwry7/M0qFSrVSGKVI
 TU70ninQfzAkFgIfyHxQyWtGoam80aMLbe52NMQ8epS6s5SziXgW0HGKU w==;
X-CSE-ConnectionGUID: otwnhl6mSlegpNXaO/OQKQ==
X-CSE-MsgGUID: yDifR9K2SoqciPRqm2lTBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="70317506"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="70317506"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 13:39:54 -0700
X-CSE-ConnectionGUID: rEu6/SmqTRikzPJnZJFvHg==
X-CSE-MsgGUID: X/iwPcSJSG2/jQz9/NoLPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="134781366"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 13:39:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 13:39:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 13:39:53 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 13:39:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtOFUecHZlVlVE9biB/qt2HArTnMqCeni1yXqzDf4lXctv08jkeONvkvUbFLLMRODaQdy7vW2h68XHzSrJwKqjygV8wqspMnG7NB95TCAMJNLQzQGOAN7zYBMAkR6XZW57bwbrzk2svFWXpiREjNqIqLAaU+LS7etPV7612z2owN1pTNwbXvATTxyqIcrLz2GBw9hYpyRGR/OQMbbqFBR+P9bbJ0HtoU62JfkpY2G1QqNxNC+n8qkYgMn+p8DtFPYYuIOXtrUvWZERBTW0lExQ+uGgXHFg6ICubzzZXhX3qjTyq9kZ3q8SwV2XgMBizbzYtgQIxjFq4grMV2CE20fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMModYx1gWSxtyAOZqcFKxhoLBgjWzeOUs3X5JP8MC0=;
 b=i+KngwpkSRLUyOjKxKGwUCo9+kJn9Js7YLqZYdBRZkSF5SKOsUAz45lUNA0E/usfFmpXoj7sHFuF4HJuizyuWI+ooLH6jNLjGsQ0100u459ldJlYZ+5P7wcwAHwUDQcP3rJUIX1AAjBSP+hLODXv8FesOVITYmaSo5B23mioL9NLALj2FI8PEyLfimzdphAEiwQdDHvqdkp98QMlquvmcz1aD49JVcmxzWqcvmOSblwarHx6CueGCEgOBe6a2n/ICf7nCpST4vLvqw4C98M7hdZL54zBcOF+O/Yxd2FL/tiiod7PnFyuJaSp/d21pKWNGLnMp1daDZTIZALrIZqZvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5202.namprd11.prod.outlook.com (2603:10b6:303:97::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 1 May
 2025 20:39:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 20:39:22 +0000
Date: Thu, 1 May 2025 13:40:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <niranjana.vishwanathapura@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add ASID to range invalidation feature flag
Message-ID: <aBPcTbopzpPCd6Ly@lstrano-desk.jf.intel.com>
References: <20250501173626.64481-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250501173626.64481-1-stuart.summers@intel.com>
X-ClientProxiedBy: BY3PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:a03:255::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5202:EE_
X-MS-Office365-Filtering-Correlation-Id: 65650c16-b375-4754-c43f-08dd88f040ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nIi2Wzgl7UW5mnuUGZGONjnD2ATznqmNaHDabICzXxkRWF659Pgz9HLNTeO/?=
 =?us-ascii?Q?1zfYABJLREGvZCFrlPz81zC/eAxOnjn4oZSsvd+Guklvv36PYzlXVm5m2YC/?=
 =?us-ascii?Q?+PlD09yVUH8+FnTVt02eaDCZVYOeKxuKQ1dBnEaRDXoVnuf/t9LZCAzw1h3q?=
 =?us-ascii?Q?dMHXfhQzdm4x41aKJKCHhezeCdrCps3pj68gaQ2tJyCle1PJOouP9eh36yN8?=
 =?us-ascii?Q?PzhDOFz5UhDFOS/D4ExAq85OyNCVY4vWOcFsq93GKFm8qL887ZksDyTZJsj1?=
 =?us-ascii?Q?y4l3p9u9NjnTbG0ltlqhhSNvmCoOmLwjn/ckDcU+WQaE0j81ABEIouv2zCOz?=
 =?us-ascii?Q?NCMlplNnzvHWChMhlTp79umGX7GQTG88NoaR7w1qPveLCeORsSeTel4m5wYx?=
 =?us-ascii?Q?HKYXYNEw3Xx3PuLunn8iFm1IymcaAEqTJri99iLRGWCKsraNnRdC+++4AzPS?=
 =?us-ascii?Q?2jieqWxX6eyBi4OjXq/otQAuUqtqqr1xfFrX/K+AnS8hRLH2EN3ytdewuLu/?=
 =?us-ascii?Q?k7gcoEeRmqx2b4/owVDikEuUrSX8QLXUZXIOJWa07287pvn9U6vJy1GNyRhf?=
 =?us-ascii?Q?lUSBkQCBw850KsfBQuTABE2f0rSjjhri7G4vL1a+LM1/lyMu/LEyF8tAZ9/n?=
 =?us-ascii?Q?bKZqXROmXvUNNfUXRfyAkGTAZaydWGa8Yjj5A87H2jfKsmqC7lhesypRjOBa?=
 =?us-ascii?Q?RwcaCAhF6sAIkGq3rbBa08vG5tPr6mTqYPdzs+eSiRYFuDHaiQYiIWOwYgS1?=
 =?us-ascii?Q?KORkgNNhWsj88td43//Emaz1zjVb18PFCYLd8nVkqlsouHL83WzbXOZqLURf?=
 =?us-ascii?Q?VZz+NwvDZec12iaYyzK45669YcI9VwvoA7eXVHKWXVDFKQhiX1qbP+yslLPf?=
 =?us-ascii?Q?7PUf1n66nIfDHsMPV39U2gZmv44tXdkUAyxsknwKmszW+ULiF7dqEGTPInSY?=
 =?us-ascii?Q?UlJK3DU2epHV5JZDvWYI0FHdIz9B2G5OEZOfFamXIgpbA4RXz4nobPi0q280?=
 =?us-ascii?Q?GxPnJzPCcl+DJkiikwtoDYnYm8g2yhoO/HFBRGlwRFVrGsRh5oJFt+n31j7H?=
 =?us-ascii?Q?7hmhUu5e4x5PM3S96dvXd00JT4N2qL+9zYm0nOqu66q0W9SckgRKJJtUxHJd?=
 =?us-ascii?Q?r8afIsyEnQHbOUkgrb4zIEtBVQBWbUN3Huv2SEzPhNtXW/rLuZOuSjydo/F7?=
 =?us-ascii?Q?3+ZnGMHQYCNFE2tDgkInITpKB2W6Av5N3zm76W/Qxc37xSpWS/1IpgS/p1+i?=
 =?us-ascii?Q?GXu+Ry9pLvJsNlZRrRtTPoHNMQ4Eh06Kb/sdag7aTpo9It0yKz8s4jjhcErS?=
 =?us-ascii?Q?Te73w6/9vpnr7iSDqvObwHuTxEl/VFRVc2WWbtd/+T+BP0ZPYoHNVZqq8dCa?=
 =?us-ascii?Q?lALfa39G8p4EG7OYBYEA4+j0wM78fhRqZIwRoQpjpFNxOh89USkzFgwbuKAt?=
 =?us-ascii?Q?vdU/GMk564o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oB/0hci/JRfIa3fJjUrzDymzve7qK+hirGNSxT6v/tn5/j1dKhOs7rsb8YeX?=
 =?us-ascii?Q?ZGar0W4dVq1ihNTAmbdN1o0moiSyG4agxfXQGLTA7j3pnH0I56BjQJwt+wdg?=
 =?us-ascii?Q?XVfwT4ijrmE3iQSr1F+PgBMZk6yW3ohUpIQNnh9Mv0F2/HKWWYs9zNvKXmgq?=
 =?us-ascii?Q?W6QmqbzweuzGVu1r7vJM/AewiCL6jj3yLUP1/xN5CLfK6z+axHMVc3tVAsh/?=
 =?us-ascii?Q?G1R8j+WVW1ZCsrFd5M1EGHL4j92Fhbi/9GdTeI42YGh9UVSmzeJNbDKJMerN?=
 =?us-ascii?Q?iMQyFvxYX7IEAc9Upl1IKEAsjxu77FF+uIT7I3Krsuq1ndyWPdh6a3kubixa?=
 =?us-ascii?Q?QSbnmyklkF6H+QJafqR10FWNO+aGpeyktwMkQndwcH45IdFwifKkzieXWcU0?=
 =?us-ascii?Q?2JjT6omfVacDDidTQMlcm1hFm74kbb7o9TMLsz00UA1sC1SdA8wlE9WcX7TT?=
 =?us-ascii?Q?BNtI/6Y5hpN4CR2frWsEOwQwqomL8HrRt9bwbAU8m7roMCQ1NjzLfP3VZOXr?=
 =?us-ascii?Q?HwbY3IKU997Cm1YqyXLAT96YpIRwmQfZm8MELD9UH2Ws3Zpf/MV1NzhQ5Z9/?=
 =?us-ascii?Q?SbWrf+vuK0hewQMoKm17kmfg0DMNkDlwcI3hFYmz1w8sPyUT3DF4PKr32NNA?=
 =?us-ascii?Q?rZ1zS4vSSVQh09n8/JJQeXG+MFWJjJzL887MUtCjQ/gIerMw0wFhDXDjmst7?=
 =?us-ascii?Q?ApSf69Qe7bVPI/ihm/x2Hsuv2Mj0n3RGCpsH/YU8IHPPXOpJXvxeqWM+Usw2?=
 =?us-ascii?Q?B/Sqyh15xHe0LoDfpMyaAqJh+e/wYHHeVsaj02AMtz6a7irvVySC4p426sZt?=
 =?us-ascii?Q?io8mZlesnvWg3Dz3PTuIyc0ACcbolEVv9sPo2yiWXoneX2giGH0oNIVoxQ03?=
 =?us-ascii?Q?tBoomT0MVI4CB3jyeurCRcide4Ezeu+/+q9pgRg5nT31CK6XxFcxP470UQrz?=
 =?us-ascii?Q?M87JFncvdDTt1SMwHnrAGGNuGhhtEGMaCZtyr/m3sFU5jkgnKCSI/4+sqTBG?=
 =?us-ascii?Q?j7mgH9nWgWg+y0JAj8JAHiBGk94xuGzE1GQmKccfxqIgE/s8fECXZAdGZFoC?=
 =?us-ascii?Q?GR/3dNkOtUW3ZUYvBylvSp0A5D15jC7S+0L/wkqaPhEKrJ5Nx0DNtagYxK7x?=
 =?us-ascii?Q?Qw1XOBgYf23Qx9VTKhfI+LwHxDgAOEQKa7yWEthU0hwm0vNFKA873DLjdSn2?=
 =?us-ascii?Q?Z8nz4gaWxbWT5TW2V9s+f/Ue+6V/DcJ0Ofy76a+8EcX2WSQhOCfD0UjF6Z5+?=
 =?us-ascii?Q?0C+J0YASjfQAIopztbJ5m9BjYEAC8q9fYGXP7tIkjBIHKdbj0PgtWZxFo3Lb?=
 =?us-ascii?Q?DoYNm5bhPQ5TuR9H8SOMQ97EKs8Jgndkk8W77ulEseyCNMptfwkyxneJ8Fkx?=
 =?us-ascii?Q?0FdNgyIs/Z6YHjceYFBORGjINZJSFKY5N3+CTxJYI23q6rIpQp4Xu0TeA2S7?=
 =?us-ascii?Q?iKanL+F7De08PWgtFNR+dMR6laCik1GxVyBhfaOktHweNdZ2V9k86wxloo6M?=
 =?us-ascii?Q?07YKGAzQ0FBgggDgKGWCfdoWYFXUEUBsEkHCkLfh4+zFzDmbzgKT1H8/nrNe?=
 =?us-ascii?Q?BxrQbtXTcnmh+QUbzigpblieaMKzTm5beTCxWCyc/k/LG/XwDQ1EyG4mhsxb?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65650c16-b375-4754-c43f-08dd88f040ee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 20:39:22.0921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9y18ZReP93Uvc3mnplGTu4PLuZ1Gzs86ETkz38GhgQlDYEQcsKnJabR/AK+UHlxYpQbomsZLRvVLTehU+lzf/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5202
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

On Thu, May 01, 2025 at 05:36:26PM +0000, Stuart Summers wrote:
> Make it explicit that the ASID is used to identify a VM
> when issuing a ranged-based TLB invalidation.
> 
> /s/has_range_tlb_invalidation/has_range_tlb_invalidation_asid/
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h        | 4 ++--
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 +-
>  drivers/gpu/drm/xe/xe_pci.c                 | 6 +++---
>  drivers/gpu/drm/xe/xe_pci_types.h           | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 06c65dace026..3e49b88a8a62 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -327,8 +327,8 @@ struct xe_device {
>  		u8 has_llc:1;
>  		/** @info.has_pxp: Device has PXP support */
>  		u8 has_pxp:1;
> -		/** @info.has_range_tlb_invalidation: Has range based TLB invalidations */
> -		u8 has_range_tlb_invalidation:1;
> +		/** @info.has_range_tlb_invalidation_asid: Has range based TLB invalidations */
> +		u8 has_range_tlb_invalidation_asid:1;
>  		/** @info.has_sriov: Supports SR-IOV */
>  		u8 has_sriov:1;
>  		/** @info.has_usm: Device has unified shared memory support */
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 084cbdeba8ea..c68f7cc8e175 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -366,7 +366,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>  
>  	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
>  	action[len++] = 0; /* seqno, replaced in send_tlb_invalidation */
> -	if (!xe->info.has_range_tlb_invalidation ||
> +	if (!xe->info.has_range_tlb_invalidation_asid ||
>  	    length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
>  		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
>  	} else {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a4caa6222b6f..cfafcfcbbbc6 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -91,7 +91,7 @@ static const struct xe_graphics_desc graphics_xelp = {
>  };
>  
>  #define XE_HP_FEATURES \
> -	.has_range_tlb_invalidation = true, \
> +	.has_range_tlb_invalidation_asid = true, \
>  	.va_bits = 48, \
>  	.vm_max_level = 3
>  
> @@ -140,7 +140,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
>  	.has_atomic_enable_pte_bit = 1, \
>  	.has_flat_ccs = 1, \
>  	.has_indirect_ring_state = 1, \
> -	.has_range_tlb_invalidation = 1, \
> +	.has_range_tlb_invalidation_asid = 1, \
>  	.has_usm = 1, \
>  	.va_bits = 48, \
>  	.vm_max_level = 4, \
> @@ -680,7 +680,7 @@ static int xe_info_init(struct xe_device *xe,
>  	/* Runtime detection may change this later */
>  	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
>  
> -	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
> +	xe->info.has_range_tlb_invalidation_asid = graphics_desc->has_range_tlb_invalidation_asid;
>  	xe->info.has_usm = graphics_desc->has_usm;
>  
>  	for_each_remote_tile(tile, xe, id) {
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index e9b9bbc138d3..3d1c745de2ac 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -19,7 +19,7 @@ struct xe_graphics_desc {
>  	u8 has_atomic_enable_pte_bit:1;
>  	u8 has_flat_ccs:1;
>  	u8 has_indirect_ring_state:1;
> -	u8 has_range_tlb_invalidation:1;
> +	u8 has_range_tlb_invalidation_asid:1;
>  	u8 has_usm:1;
>  };
>  
> -- 
> 2.34.1
> 
