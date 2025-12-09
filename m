Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03054D3B7F3
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 20:20:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34BA10E1F2;
	Tue,  9 Dec 2025 20:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SpqmRT5h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D3610E1F2
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 20:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765311628; x=1796847628;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U2GzsVAtQUTzm1S4E5pKH1h/O0OUYbl9bi4bNdokICk=;
 b=SpqmRT5hfCjHtUW16nVIqbF4tiQZeDg5zirDsOYCt6WF1LACW22tlgEc
 2WSQuaN4kqQ0bMuukuoTczb0/rvsG+L2LCP6+ApMJLO0nmWcGREGFvmYx
 Fut5WBEPJufgSmv4LRtes/PBY4QEep1lGs29LE3WaRqLuX78THLu/z9a/
 19jJi2zeHyDsIa8FCzkr1g67T06V6nJMkVKvNcsxOesXb63JR7Ers8bJD
 gHoN1VI/eMrTH1BWmv+r0/xfvlJfKIksQRpXLZQjhmHTNnsIeXWeg4hvb
 GAW2gTbyY3A95ifG6nHqAKQDNco9FFAnr0DSnldqKJNUteCKZcONwGHmW g==;
X-CSE-ConnectionGUID: ZaFnPTpNRV2NuKJ2SVS9fQ==
X-CSE-MsgGUID: RRhrXqlXQKWF0tlD/QqWiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77895102"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="77895102"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:20:28 -0800
X-CSE-ConnectionGUID: kMlJHzIwQoyDT5jYOMPB7Q==
X-CSE-MsgGUID: qnHIEdZMQKe2U60U1Y1RBw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:20:28 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 12:20:27 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 12:20:27 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 12:20:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNLyZkRbdsL5fLV+xhpx6fWhTi7QFqI5hi1jG+65cgiDCdTEz2o/0RyjcSGFwqSKKeDlSZqi797KTNDtCwqJjSVjmJ4HIajKSZhd2lb74xRF4nWhFcds9mAr/5Ky3/CSn2T9ugoHZReU0p/7zPVK6uVrOFjNY/hFv2UD3kJ9m0tw9Y3NwKfgpp8aapTt2hYCMTMmHtIvO+ekj80h5pYtZtx3VqYrXK5lCEOTiy8ETPD80hKl1YOrAegqrFb62O+XNwjwBXgdIUVAQ1Nn3TWIx7TvN1jyXU1YVEIkXlgBqIoIfE4tffUDMLDHh/nmYLisb9zGFeSLhGSFxHq/OnVoTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGeL2+St7bElN5tr+KPrwNy5krEK3I/xpza/RG3vxO0=;
 b=OvduLGey33jCx9HJuaY+CJcssROEhylefUGmAP9t6q5yL6nAhykSk9+X4o7K8T5023P6OfuxOHZyZAN2XN4Ffj0vKodsI/MCUd9mlP2JIcDwXlpfFZPcQEyRROKXyC55fRg5rlmTLdMLKSZo5k03UKq+psCeY+MF6c0Lpxl9CdY8JEt+xNmifAzR7zXIW6dlngcVDx22HBAeKpigxj63+xuNmCo8KAepjmOOvTD/w19sKwHYE3KRBncr5PTsFgYGTgQE4BqibX/3KXxGIK4Cyb7P8AU1eO8hjsPlu8fpxODgTd9wXJiEztmksuTxZtX7+Cg8rZBEQBKRMiT3qwv6xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF7D18F34A1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 20:20:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 20:20:23 +0000
Date: Tue, 9 Dec 2025 12:20:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH v2] drm/xe: Use DRM_BUDDY_CONTIGUOUS_ALLOCATION for
 contiguous allocations
Message-ID: <aTiEhFk/+Tzlwmq/@lstrano-desk.jf.intel.com>
References: <20251209172919.2304341-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251209172919.2304341-2-sanjay.kumar.yadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:303:b5::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF7D18F34A1:EE_
X-MS-Office365-Filtering-Correlation-Id: f6546b8c-ff15-4195-28b9-08de376061d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ck4vNAFx/AI2Pf1j3Wi+20T9yN87cEObiT9IWFKVLYTfI5hAzUthN+AwtSBj?=
 =?us-ascii?Q?LJ2uuk61HGcm5LHQFpdCank4VH8CcGUwh+tS0CPhlmHVQ60cD0kJq744JtlZ?=
 =?us-ascii?Q?Rnp46fgoPOnFq/EL+w9ye1aFo6LIxnJPwAK2japcStcibc7oaF0i0Fdzwdew?=
 =?us-ascii?Q?lOR7fwI0Ul9IAmVqqcninWE51nP5lHbjXUMYJFl9+R1b/+8tHNBzQHxxGfvs?=
 =?us-ascii?Q?D0YxCu3/FJLbtmjthdjugaiXACrnSKpUJoCSTcDxXfequc26nh1jstE/rc2N?=
 =?us-ascii?Q?nLuf8VM/troU80AiN9pkZz17pY0a5973zH8DCb4AYbDI4buQZv1XVAKK54IL?=
 =?us-ascii?Q?dbydBoYfumGC0CRQAkW+dTnZ+kq6mu5sXoZlt8DWzGkh3eENk1MDQfxQ58w6?=
 =?us-ascii?Q?//VDJoxnmuqGgI/U8NSxocT1TJrP6dgZayqrC6hvxtODcA4yiD8wUfojBYSq?=
 =?us-ascii?Q?4p5E/ObqP6Yp5ON/Q+nCcBhXuaL9IQOblO8Bvb26mHXzmDahhA2ElPC3Um5M?=
 =?us-ascii?Q?IycsBeD51Pu+7DVvxlTRnn7FpZFrxBLVsI452RGQ5uDwpiI2hGILQVM/wUSi?=
 =?us-ascii?Q?wkfzrOaLE4PkAu/JOx30ix3vwnRcKKxV4zeETWPwHIkLYnXXiZwqCM6BuX8+?=
 =?us-ascii?Q?rxpgNujSPEpkaHg3K4MWaUdWIi6dixOPgwcb3A5DZSfQsuuQnASQYM+Ja1f1?=
 =?us-ascii?Q?9ut8aFp4OupI16zidnV67RFXoc7Nd72LwW5mKSnBgenJPED/OZR7Vsb8z9AS?=
 =?us-ascii?Q?v+CKA4aQlbCtu3TRZXGuZX1LvBMCYy/R8JC0TRvX2CwJ8G5kKsqLX561CN93?=
 =?us-ascii?Q?eBr33Y0pEXfxGd6z2ORqza0d/J4245mDDfH61kgcoJNZODK2ZSprKgj+bI2P?=
 =?us-ascii?Q?2m7/pKtLq9z7psW3NCWuWEb5NFb2JnX7T12dohw17iJA8mYek3n8qKznLQF8?=
 =?us-ascii?Q?mpyTQexmwhLr5QPYlYt5BaNm+xIDs7wkQV8YNkr0dBUAdvq9gkP2I7gIz61l?=
 =?us-ascii?Q?gwpmBfu3kRYD98Dxi+4HAFENx0FROQzt92LWaQ1NP87S7G0JxdW7uG8NAbwQ?=
 =?us-ascii?Q?zueNzvs0OW85LyVoX3a5HKG8PS5pNs35/DBjhNUtr0W2OFb5DZxlJrN9B4yW?=
 =?us-ascii?Q?HWlvFdrXYMcBp7XBNSNmPqGJmCVDOu68+CrGH7ek1/nqMV8JWO4HBjC1WRMD?=
 =?us-ascii?Q?Z44wwcqrqeK8KBXUF13Kv0ZogAz22+L7eIDNNmGmtyxkCUA7IgEtjaRVin1q?=
 =?us-ascii?Q?zYsjwdTnp/T/8xLk7yst7iYN44eP/koSIB3TxXBIvWeZlASkc7eupw+zw/nT?=
 =?us-ascii?Q?/p0czMahWCjFX2nbkYpaWS884MQLIZJM7EJrLqi4baeQlCMZ0BfQQBTpQSuY?=
 =?us-ascii?Q?Q+3js+2Xb77ym7WIgDq1Yf+0dEMaDIEytpUOR1j1X4K90uTT9xk0fwJs8NlR?=
 =?us-ascii?Q?ubN4bjj9CJLoekLS6GHZHPWx0Z1kYYS8IJF2vbpFFpq559BfQ9esDQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QHAQldoM6VWaKiSSEVpNmQB7MN5IteaPyxzI1UviSyKe3kOe/MjYGAssdNQk?=
 =?us-ascii?Q?Hd05KTezDGk+RIobmuTeMlxcXo9v0mjyJlDo38OIzhIsaSaJpUECndavmys5?=
 =?us-ascii?Q?pcNyEjD6QRO0tOb315x5nl+V2CuRvrIrz98UwaHLlvOwS8XWEzfSBQAKKa0Y?=
 =?us-ascii?Q?+cbB8QCrrkPvdRnHkO2PacIvN44iF9IgvXAz+DNE0CeO7PSoz9795NGIyRc+?=
 =?us-ascii?Q?sVoLW78Z0PJ11uKLWnTvbSZuB5D0TY/o0WYUmR8Ue1CBV6sL45orRJrHE8FF?=
 =?us-ascii?Q?Iu+t7rZIN8MLx9Rk0VHg1+NIVQIifbcokMNAO93gG5HnDAXxtJkAT0fLLkO/?=
 =?us-ascii?Q?73c7D+dI+uDK2CrL1Ae38VBtG6uW5nokEmEb+c5pIOx/bNvdFqrjLQ2WPOWN?=
 =?us-ascii?Q?7pbd112vFtFRW0MoUsgicyp/PktoVRJaK/6HR1lVEnuS5yEI5n9CWTKaHxaK?=
 =?us-ascii?Q?Gl7kb+LpGxx+KNBh5IDgoQVYmG2M9/6PIiZEoW1c8MKkHcTf2iU5u4lAhe/u?=
 =?us-ascii?Q?vBNBWwKGhGhWnCxNBM7UFUBA3uzTVSx6Fkvf/z8DN8wXJqxcWn3YZcqsrPKH?=
 =?us-ascii?Q?JjlMhk4JKfEE8Kdy3lpLP7/r4B62l10i1I2Av0xyAC8XyxbdVh8hoZtvD2um?=
 =?us-ascii?Q?8jict4vJ2xZ3GIxVbmOHWxWr2FnSI2zu8uzJ7Ul2XH5pjjm0WoUQLTpKObQd?=
 =?us-ascii?Q?AEkpgJ66NEqw6zKPo+1e2xiu4XC3dnALrJoZouwHwylntlRxOMX//IjcIbAY?=
 =?us-ascii?Q?uOxZlWP0ZlPfr2WsecWxhi0JEmfY0inC85UvMy+DT224Ovqo1lwq3GpyMkAa?=
 =?us-ascii?Q?dHAmOdrM4aS2bqPiAHiYkFLWi6rMjR2mi5/A/Ea++5/GVqP3zRcbhCu2dp1n?=
 =?us-ascii?Q?SxokRMaHNNQKHxjPCc5B/dFbz51HbYgjl33l4PKpgGm/2sQ/XokV5hddi5S3?=
 =?us-ascii?Q?HOZl6elOAooE09Oq9hb8WykA22MNqa6IZ6T9zCmUMcp2cAywRwxKR7F88aER?=
 =?us-ascii?Q?6Z+RAX8pn2jqnVglzlwzfhUTAvkagf7bzuEF4kZNo7wxipKfYafxwkgw1Gb5?=
 =?us-ascii?Q?423F1pkTYsSyxctuwfdOv2VpIXI8kXa9sSSU2Urv44GBIlJMiEsbBrFvxCDw?=
 =?us-ascii?Q?fKJx9uqujfcKjAfn/0q7uEZOTVh6ZxFCa5ztK4Naitlfb/aDszuBZpmxMFEh?=
 =?us-ascii?Q?wV8B5g7pzFpjxt51v9rVipX3WX+IMK3kqDng8Dp8Bjr4QVD7lg6iZkAXOOlV?=
 =?us-ascii?Q?AorZzi2dGF1TkTTWnchAYSaUL0hRLjsren4xDdWD6xi7R+4hKWJyWSE50Rx9?=
 =?us-ascii?Q?rRdeL1a1ifa4G14RbY2GFmnY4L3Tuqmb1fNvDXP6VlpvGJP9thARp3LoskxH?=
 =?us-ascii?Q?Phdpfp8Hl5tGcKAhZ+kLDSTa6TvvpP/7+UqE6NBAI3NSj7EhZHwU6taODI9P?=
 =?us-ascii?Q?XHUH9DuTQwX8bEduqwQ0HD5q8c8srtcDN4yUPN8/rHiP7TR6n3acdyztx6DW?=
 =?us-ascii?Q?o8XbXY4isDX4qTWdywN3ZJ9XvtM4F4h0puL6J0mWUr5L8Fn4FvtqyAWPuMlG?=
 =?us-ascii?Q?/pMZbe5l4qDlejjR7GgSfvtB3lDtEqTtXTgMkQBYocCfrl6jXmrcVMUI/YHf?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6546b8c-ff15-4195-28b9-08de376061d8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 20:20:23.2883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83hQF/enwmor7DTos17i9ZTEGkaPUHFeF+pvgfdFQ1Y1P5dkBTPUw5NktVNapNunvuAylID2MZKj4jOEV5FKzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7D18F34A1
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

On Tue, Dec 09, 2025 at 10:59:20PM +0530, Sanjay Yadav wrote:
> The VRAM/stolen memory managers do not currently set
> DRM_BUDDY_CONTIGUOUS_ALLOCATION for contiguous allocations. Enabling
> this flag activates the buddy allocator's try_harder path, which helps
> handle fragmented memory scenarios.
> 
> This enables the __alloc_contig_try_harder fallback in the buddy
> allocator, allowing contiguous allocation requests to succeed even when
> memory is fragmented by combining allocations from both(RHS and LHS)
> sides of a large free block.
> 
> v2: (Matt B)
> - Remove redundant logic for rounding allocation size and trimming when
>   TTM_PL_FLAG_CONTIGUOUS is set, since drm_buddy now handles this when
>   DRM_BUDDY_CONTIGUOUS_ALLOCATION is enabled
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6713
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

But also please double check with Auld that this looks good to him.

Matt

> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 9f70802fce92..1a819b627afe 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -82,6 +82,9 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>  	if (place->flags & TTM_PL_FLAG_TOPDOWN)
>  		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>  
> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
> +		vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
> +
>  	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
>  		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>  
> @@ -111,25 +114,12 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>  		goto error_unlock;
>  	}
>  
> -	if (place->fpfn + (size >> PAGE_SHIFT) != lpfn &&
> -	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -		size = roundup_pow_of_two(size);
> -		min_page_size = size;
> -
> -		lpfn = max_t(unsigned long, place->fpfn + (size >> PAGE_SHIFT), lpfn);
> -	}
> -
>  	err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
>  				     (u64)lpfn << PAGE_SHIFT, size,
>  				     min_page_size, &vres->blocks, vres->flags);
>  	if (err)
>  		goto error_unlock;
>  
> -	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -		if (!drm_buddy_block_trim(mm, NULL, vres->base.size, &vres->blocks))
> -			size = vres->base.size;
> -	}
> -
>  	if (lpfn <= mgr->visible_size >> PAGE_SHIFT) {
>  		vres->used_visible_size = size;
>  	} else {
> -- 
> 2.52.0
> 
