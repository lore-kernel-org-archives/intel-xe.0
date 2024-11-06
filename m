Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272E9D59F56
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 17:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC74310E15D;
	Wed,  6 Nov 2024 17:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XV4oAvQJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A676A10E15D;
 Wed,  6 Nov 2024 17:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730914559; x=1762450559;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c6vhMwrYwGBl0Z/jpG0HQdaUusrH8q6i1XwPi973HqI=;
 b=XV4oAvQJ59r2C7j4p9zjKtsaE2I7EZ0nkOJOfcttZZV10wze7jm6+aeV
 /5LCnIYC2t1lN9DX8YGqBdDvKiUmjgkISURG0TyABI+dssI6HCJtg/zFK
 O2gkFIEItu4hXOlrlDiT9eu4NIN7XBPfh66P+1McPd2HLNxRGJbn3iTUn
 kg6nH+IggEJWMf0GNn8EvVO4Kx4R3/H4N2V5NCJ5nf0+GO3eRPx4kDArd
 dHIlnfwfgN/s4A8+Xm5fkjjPhL3x95XqN81Gde1M+vz+11HEk35VbgAOZ
 vAI40BZLe6H9zNMsQZpsHdsxWuLNvS71tHlLW0jUxJFdLQgg6iAaDcuGN w==;
X-CSE-ConnectionGUID: iu/KafgAQF+S5nlEZTk3Dg==
X-CSE-MsgGUID: SEU6fXC0RW+hGA6/upo5zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30610173"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="30610173"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 09:35:59 -0800
X-CSE-ConnectionGUID: FX86LkJeQ3SN2ForzaSxDQ==
X-CSE-MsgGUID: dT2E2NZhRZ6aP6ZY18Vudw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="122187891"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 09:35:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 09:35:58 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 09:35:58 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 09:35:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wv7ix4KlPf1BY9PvIHfQv+IlO3SIrObpKtPbxEzn5SOeLHT8nU3g7/KA8doL6+a5ajmvxgMdqbWmqgOgQ9nu7RpXYbYg+fFRTTryGvJKDQr2/ppVYD0nULWs6vm0Wa2voYuhzmaY+MLGYQoa5lthA+Hl1U2lhss06VVyIivmxypbzQM5SswLwGJgGir0doiiAvqQ9ozEABzPKA1qDcZ88R9/l/4libGbuTxLzWaI3qC6UwWgC7U5h4ykmq1MXnovgF2Di/Y3RnXuDhXRtj0EIke3N0Z3yVsWBZQPU5TLdbbaGSd/58VLpjWHuGAfABn5EJ3KB3mPFsd94P/3JWs+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scZT6BJ5ACjobE2KRSU/L7k2WgLPOMEroGmGOUmvaDY=;
 b=KuX7MFfIudeNCAUHCP8V/H7A6jvVydXxkCunrHPCQLHTo0fR04EEfDub1JcOO4Ba0qsRgRwSu823nM5s6ypuRKrYR+26Mla2JRMP/ljD8CJIDF+zSBudpUfGc2LK5E9R4G63XxWm4Jx+c3NJjzkHj4oD3h8NXbTOlQsHm9A2HMSeMwiHCuHejWqaXRiyu5EicO+ab4qtMw1lIyQS+O6EoUA973QN8+1rKje+ZrIjtifkU49nJQLaXkTk56gRptroxk+z6B0Ju78I1XpLxxuqnaUQ4RD7kqc1zpgG6nUxxpzJz5WOqUiVhwGk3nLZkmjxiRjcrpAspFeLBq4HjqgegA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 17:35:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8137.019; Wed, 6 Nov 2024
 17:35:54 +0000
Date: Wed, 6 Nov 2024 09:35:49 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t V2 1/2] drm-uapi/xe: Add new flag in mmap offset
 ioctl
Message-ID: <20241106173549.GQ4891@mdroper-desk1.amr.corp.intel.com>
References: <20241023094327.965050-1-tejas.upadhyay@intel.com>
 <20241023094327.965050-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241023094327.965050-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: fc8e5cf2-e092-4d43-fa3b-08dcfe89772f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CwMfvxZk5KOlrez4TLkbEKj0z+ugulJEMsFb1dOZkmxf5+yJzFtSTf1eI6Ed?=
 =?us-ascii?Q?y397rz9ew5EEWbDJQC03E2ELDsNX5piDcZsHGHO5vuKdMnPAtdoBtoog1eZE?=
 =?us-ascii?Q?GLxP/1Eh1TWH3brSYzt+enGiW/mUmXE8NJKyuom6PPOMUN/cGhHGvtCICXSa?=
 =?us-ascii?Q?WEooTZmKucYK0NSGAIsgFSReHH2VUGeforj5iGFc8gqCnaG6p4VX1yqsEWWg?=
 =?us-ascii?Q?gqper49I+1Ta29NpvU+7MYeSi7eiRc69/FnMP5fzgtlVP29eIoDIJEXvc2bc?=
 =?us-ascii?Q?BQO3Hc9Mhw20QrxupidOf8c+5cD/nYsks5VYo+DF+1ZEq/fHqoUMe4jU/qQX?=
 =?us-ascii?Q?0zynxvcZo0Jli8J2b/gsSgIygEAsYIKdSo+aADjE5ns07hBU5LufqUeuXahI?=
 =?us-ascii?Q?qaU6UBiyjFNME6ikEnTxc/ECD6TNv/JpYrUIfJJUcJPG7q2bhJ4YVEzdVRwT?=
 =?us-ascii?Q?gyJQlAx5DdhlgeisJGykAe0WQHSWPrKqfW6TvATtdNBMotzcEnSmAZsjiBWG?=
 =?us-ascii?Q?FT10Ia4Qw6lxL1CSYEH41EsFZ7T/0GhTNNy9QNVdIFhw059QCtFE3TxWAyDA?=
 =?us-ascii?Q?hvIqYSoKieYHnD0UWEtoppwUu4WgePsiQNKsI3Iy6QtmFYaOYOyxbhHz2LB3?=
 =?us-ascii?Q?IzzoOsUsNQwSPhQGzkfwu9CSe17z+LfHtqrCZVe/sy1x1vaZNKXpRoFTKvSl?=
 =?us-ascii?Q?J3ZCJSOVoItbruqHfAPYcPAUW6xbc14qy71OWQlnVO4PkXxGoCzqo5IUpo4f?=
 =?us-ascii?Q?evv+A6sYyBDQi/GCRp37FKR9fiTiB8/j8trQyjHjfoPbH10Ci4guQah6WA0N?=
 =?us-ascii?Q?U6ulLYJdjKxSoqaCVKJy6SHnCSu3mlUp0ib3EpWbbsLPqPD21zsvjywbkQOs?=
 =?us-ascii?Q?76AkFcY62CjAfWehINAAkkxn8QjUbatQRa6GC5B+VPqq4vve32V0XsYc1eV2?=
 =?us-ascii?Q?bUnn1xTei9/wd6myHXCx0WDdkR19A9g/bYu8H8rEUKMD7NWriiujpu9f7eyz?=
 =?us-ascii?Q?8o7yAAsgTPLQ6OVDgwj+pkxP009GQSd9pEVz+JjnTzmTLfJVg+/+Jes9nlvS?=
 =?us-ascii?Q?usjKbf1QrlszCYrW2l7Q4egVgbAvGvOpnbA4Y5+e4JJvjg8DJruZ3o5R6tI9?=
 =?us-ascii?Q?pECIjtjxEUEsz+9Hzj4BoaWfHm6G9G9ioENy905kxrkZ4g0Jl+SztvcQBl91?=
 =?us-ascii?Q?vDzZXXptUstqTcGpJIFunW4d+PbFVMlk1sguYAbZV13tcX8f4lve/dkBFucQ?=
 =?us-ascii?Q?cBJIGPCvWiz1/HCi0gqa8D2BN+nhVFDjkSLpMwkiD3NQKdp8SMhJaZhG/kbT?=
 =?us-ascii?Q?sXwLgiWjAGXYChtwPBs951Sm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QhFQ0ek0Xl9oR6uZ0j3X6yaEIMet5Kb0TxC8/VZRQxoObvcLkuqzbRRniJH1?=
 =?us-ascii?Q?BR9FhyJkslCZ5nUk5mZi5DHQBWW+ZGuQX9h0qYegHdC8T5dsRJZydicEO4gx?=
 =?us-ascii?Q?kiLRY3GtrcnUVE7wEVniTNExwJExaXVfJMrxjN4dWOuLSlMcQXynNZjhxdtC?=
 =?us-ascii?Q?FzqV6NGefOurtIwVM/yrKsDWxiXpRMgsBslq7Rtc3c5WcRfnYj6PqBM2JAe5?=
 =?us-ascii?Q?G1wV/PEauD1QeUY97M9yPXd9a0jRkr/+JalBOd01Jx/Et9cpM4Bi/ZFVRsXS?=
 =?us-ascii?Q?YaN0k6YyDemHjpbiYup3koEgSKXlSvC4+B26DTzreQ6z4a1wLSS0E16cbIBx?=
 =?us-ascii?Q?D0faYhMrW8rzuLC6rlVyWsoZ0QseLAKA3j+e5/TvKOEzXqDCpP20Iic9Tuaf?=
 =?us-ascii?Q?zgFWMkgpoz9i7FveUi4y4lOQcMkQ5bZBKve5lyu1ZUcuY/+OTSK+I3ja5hXW?=
 =?us-ascii?Q?e4l+vlZN5k/0EPgDZmq4OmrJpjfaIKUGoSJ3yt8FzEaly4xGuccI30A7AdLS?=
 =?us-ascii?Q?aMuSILga8FC2F+73sFrBw1qyagvbsPitC4ed20cTn5WxBnlz1w1XBFgKLqSc?=
 =?us-ascii?Q?ZrsOZZLE+YXsoRO/t+mxwyip/Hqb8HyHfN3Vr2W3MpHeodSTN7S9XCAlibqP?=
 =?us-ascii?Q?uG/ukNVujSmsqoh6X7tWXjulN1FGrIBj6MNFFSGdcqx3KIk1rHFMFVy9MCb+?=
 =?us-ascii?Q?u0UEtHcTRjeBdFgDBlFLbO/IMypkDGygR0kpvZHWKoCDsSWrElvmHvErEZtL?=
 =?us-ascii?Q?7TIuJqTe/YAuKAfRrbX8/+aHbdzoPkVE/UaSYkbclLPYp9/CJ528ugE+LiCZ?=
 =?us-ascii?Q?m24vdhgew5dXzp9Tpg4W2zXpHycz3p3fIlSZveXBpkH06warkskeHz/FjKwj?=
 =?us-ascii?Q?UjQHlQyiTG6rHkjzNt31Mm+hSvnGvlyBE0P+EhYZKHaZsr3INjcVDFEq4VM6?=
 =?us-ascii?Q?M4qnNB87vCIYinxPtLeFOtCMt8Cu+4CwdzSp4Gys1uo/CawAyxt2kXx611Ip?=
 =?us-ascii?Q?f9LpvalMbHKMzieDLdOghPjTVOWxnJ2Gf4arhn/jXKUoG2p03dw6L1hsD3sh?=
 =?us-ascii?Q?jbqQF9f6xr3eTgmQnoxtGfsrkzk6TFEPLqCAB8y5uG1yIS+VtrPCdGsNUAYi?=
 =?us-ascii?Q?h0HxYsx8GL2C60E/lXozsFW+GGLDUIJtkJTiBd8Buh2fBvZJWZHddveBIkHZ?=
 =?us-ascii?Q?WZybHyNKOKTPc8IVUJ+Hdnk0R2BWzDmdqufbUPTu86s8jAvqvviiAMujZECp?=
 =?us-ascii?Q?RnH3YU+1Na5g3Z20plyAvPzb8u27I/0d7mKVt3pdky0t7MnVNqAc5JKgKb6W?=
 =?us-ascii?Q?V/qXlm7ZXUDfR3mIFqJy4pKQNApNjn0whCusEwK4kg7Qr0bkiDMZZ9SctTL9?=
 =?us-ascii?Q?Fwa+7UA4pKtZSXtBmxzJPPVVg1XCH1RLKG9+wjpzqEwwTsh2juh3Sg9a+itq?=
 =?us-ascii?Q?G7GSHNFpWVieULWRVzj6yznpTtU2/bTdI3Zt7D7QKcCYxV49cvPw5fjYX0bH?=
 =?us-ascii?Q?fNmTuQVgSCTxAntLH3scTadgn6+oilevEtiuLSAc6HUDyaxVfweJrEH52ikC?=
 =?us-ascii?Q?WcZpc8ymRPDJbImST6jGVls/xRDJ7qIzwCJzHa72+VzGkiSlbvnHv5jk+BQF?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8e5cf2-e092-4d43-fa3b-08dcfe89772f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 17:35:54.6473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SDYF9oOzox8qh5sxIdRftTB0cji8O5Tqo8FUL+FPrIFVH/NZGs4+Uf52h6hcGoaSvsF2LKEdOCG7gL69cvX168Ld793KAOBxmnW06Z9oLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6097
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

On Wed, Oct 23, 2024 at 03:13:26PM +0530, Tejas Upadhyay wrote:
> Add flag in mmap offset for querying special defined
> mmap offset for specific purpose like pci membarrier
> which requires to write 4K doorbell page mapped at
> defined offset.
> 
> For user to query special offset, special flag can be
> passed in mmap_offset ioctl and used in mmap as follows,
> struct drm_xe_gem_mmap_offset mmo = {
> 	.handle = 0, (this must be set to 0)
> 	.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> };
> igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index f0a450db9..a04d6f1de 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h

This header is supposed to be a direct copy of the kernel header; we
shouldn't be making manual changes to it since those will just get
delted the next time somebody resyncs with the kernel.

Definitions for uapi that isn't upstream yet can be put in a local
header.  E.g., see lib/i915/i915_drm_local.h for the i915 equivalent.


Matt

> @@ -817,7 +817,18 @@ struct drm_xe_gem_mmap_offset {
>  	/** @handle: Handle for the object being mapped. */
>  	__u32 handle;
>  
> -	/** @flags: Must be zero */
> +/**
> + * For user to query special offset we are adding special flag in
> + * mmap_offset ioctl which needs to be passed as follows,
> + * struct drm_xe_gem_mmap_offset mmo = {
> + *      .handle = 0, (this must be set to 0)
> + *      .flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> + * };
> + * igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> + * map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
> +*/
> +#define DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER     (1 << 0)
> +	/** @flags: Flag to indicate if any special offset, zero otherwise */
>  	__u32 flags;
>  
>  	/** @offset: The fake offset to use for subsequent mmap call */
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
