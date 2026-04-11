Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E53AF45A15
	for <intel-xe@archiver.kernel.org>; Sat, 11 Apr 2026 01:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0CE10E13E;
	Sat, 11 Apr 2026 01:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AiH69t6R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5906110E03D
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Apr 2026 01:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775871926; x=1807407926;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=neb0LhF4Hje2HaeMaAopjM3Sc//PAsjtp5Vj2rcrgOk=;
 b=AiH69t6RUjJ1/X76OomMNwBgfS47WI83FmwgHEkS21lA3HwqbGmXRRIh
 Ls/QUMbELxnKw7V/LXNDZViDaQZ/8hQO72XCy+pJKJoztG9LyPUkarFIq
 aLpN/EMnVwRvLG5whwLW0C1Ja/lWcCXwRmeWn+QByQLxLmKiXLaUPnxj2
 2I5KS9S3kp9YIC2q+50veRbYWm0bIiQ/Y90uMQcUWuInsXmAFEdlYiYrP
 8KJdSwuyaGOBYNLUHS6nZUhKRwtcSfl+SfqCaG27bOeHlZjAnlDMS+7gp
 eoeNwNFpRnplrM7Xen8Pt8QAp70XCq1hGNLsvRB/EK5GmiXkhTRt6DbHd w==;
X-CSE-ConnectionGUID: YhduTSgERAenGYdy7SCtng==
X-CSE-MsgGUID: 262gyffZT8K/NAG8vCfxHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76610776"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="76610776"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 18:45:25 -0700
X-CSE-ConnectionGUID: n2Waek4jRymcM1E5UC2Grg==
X-CSE-MsgGUID: zJ7fs7y7QIW+gPGVINLdaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="229165393"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 18:45:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 18:45:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 18:45:24 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 18:45:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7N/feBI/Z5QjLschx+B+Y7+N/DGCxUFi8iOkvjoLqZ7DWulo+7zoCi6U3V8uwPBIPOaHVsDvL9SHeFNr+cLgeLhfFD+wH5UMc/uFC8IPAu+DFZ0V4skwrpEILrzn9KGTO4wv8SI42LJSAjHiv1JIjlwUi3PvcLICo5XOzAzmZVzCneuQFxEbHuSWlqCiidQsmevqJrazrRrIgEVwtLUjl42t6fnxJLWSUQR8htmFp+iN+LDcE4qwhGpdUANQLDiKE8CzaYqrfjEw70101MvHAKvE9sUVT34Ik1X6C62MC0VPKr0udgCG4dlluXfGkA2Az1HmUMFndcWr6cXTtppfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FurbDX4sBnD0Heef2xY3KoWRfnIQTcVAy0x2odD4ek0=;
 b=SvDY5K8tolj7G2m4smIJBdB4SRxX2FzgJtbN6q6XLfM2MbO2E3vwrRVxEPLELh4thHSFIqfODeeHfzTFZlDhIGePXka4WsnPzRERm5YucQfsxz9++XdOq4DmL9ScSbuB5Bjz3DpX7Svkz330gztq15o68mfv9axbPGJ0j87993wubzVtgMOpnHeTuwlGf2IfP6kEz90ZxO9kY+Vno8DP12SCzIBqg08jhi3AuxJn0yOVSquInVPRDQBHJpU6BiNbo8D//rwreu7g8FOsREv2+86ILuBntYDyjUU3y3OfqObnUN7FDaBbHlGoy/x9B4oC1ne9GNU7SO6fDwkxH6wlZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY8PR11MB6867.namprd11.prod.outlook.com (2603:10b6:930:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.17; Sat, 11 Apr
 2026 01:45:19 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Sat, 11 Apr 2026
 01:45:19 +0000
Date: Fri, 10 Apr 2026 18:45:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xe/vf: Use drm mm instead of drm sa for CCS
 read/write
Message-ID: <admnqyMMtvifsPiK@gsse-cloud1.jf.intel.com>
References: <20260408110145.1639937-4-satyanarayana.k.v.p@intel.com>
 <20260408110145.1639937-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260408110145.1639937-6-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:303:8d::21) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY8PR11MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: e28e27cc-f935-44ad-fcae-08de976bfcd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: wkX9PhLEAoOquXz5qjob6L9xcxMtEcXgABKktTqjR66rl7hGLiDBpEfADZil6cXmWSkXGaygIviuwarXVdrNMps1kO4UnBZURAU6/uilQfpk7lpQta5s199LwhUH99sj3bi1lzU6rw2ve2KtPXShBmDJugoeHEwNFbS7UVOS/rX14WjdmvK0czraYSQvT7R6W8u77R+CSIjuh9PENrqkJCxLxA+lg5MjT6H4/4/tl26YZMvEBOYL36p1YaN71XT37+Pfunmbb7Jpps52Y1XuYSc5vu5DbfXLn+iXGYcT6UNy6by/+if8CDmeklaCOkkh6wgq+VFHQ9sWAiv1j9jE8DI679Rc+GA6G6dDkX2HwTLn3vMHKCo7s1QiW4ejhbZm1jMcMFr8qZOM0KlvSg7991duW9SdKhm76V3qjkv6qheuse3/xxpIH1pEn+OM4qZR4WNcYpVHGR2b3lNBjPaUAMYSq1L06TrZQs8R6SVrdm7pwFeVfqIoC4uYu+r8cP5DOW3Q9kCelLQjH3/ybZq7gJ5i3Z0D6s93MEe1SnvEq7ilqxRbH6Ocp5xzIfiupcngae6m8YBsgPyD9yySX3IZ4tydeCOk8K5f5y9/4bgVlf3vAsBT3KeOINYUHowYZj1VQRyDsREJW2Y957Ho/SCd4bef6+/z5I4pTcLLnuPt8frrdvS77Gcw3kXhVTGvJQUTu01Us3+zBOKNwbdXCAMZx/p5vlD3X0PM3IiZLEcWars=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HgNVO5lxckdb0vqnSvHeTN4HpauVa6Tn6y3Ouz5qY1g6qZHnD8M6FC9h4a?=
 =?iso-8859-1?Q?Li5wloloLG4o2qyvjU1BU6a1mch/wIISF1p1Y0IFnxgQsI3zTuufgMKy+R?=
 =?iso-8859-1?Q?+dMIfRJ8mGe8ObVJXhov9zcMYb/ghIDzwkxV/Vh7ns8mDcDVF+n7WSyxhX?=
 =?iso-8859-1?Q?D1T2nYuDUBO1P7AS+H7Bn3Ci4tiEzwvBx8Wd+kBdROxWoidCNpRXREgeWm?=
 =?iso-8859-1?Q?0KcxTwxWuTKxlc6c8U4e70OzA2HSfIGMYsYLlyKWHjI9CyvNsPRrnJFDdN?=
 =?iso-8859-1?Q?HWifEEEyJDWZdPcEQ9t2sAm1oPHBm0qyvjSKf2jLAOrDttPOv16PCQ3AFt?=
 =?iso-8859-1?Q?MZuDYWoez84iUQhWNvdEUDNnfhXm9G5u+10obeemLnvirE27rVpuP+mFZu?=
 =?iso-8859-1?Q?G25UYwpSt5FBMGH6+bSwvzvnZIqU7w8N8L2QIR/CjfdfFm8Ocjjd6rokUm?=
 =?iso-8859-1?Q?dpTnkn+EVpFIjdm338HVBtT4MpCjHe2oSE0W1bqJvKk7omwfu5iWlJPkE5?=
 =?iso-8859-1?Q?W7Z7TbB8QgPdG4chAGScJ7Yf+1cZ43S0wjKlprxUApaMqfdJaIT8+yOdVC?=
 =?iso-8859-1?Q?mtOBvnMS3/70qJxXFJbNi5L/vcDHe53OZpfaJ2JYZg3KczmsOO1+rwqKC4?=
 =?iso-8859-1?Q?dr9cepubEiyctNw+sGEfp8GZt1YZKF/gb+5bfZszgNrtksWQPwqrs/rUvB?=
 =?iso-8859-1?Q?K4jl7CDMSH693IX83JGoFA7tFmAgVTu/0ccBZm2tsBf5gmO2AibtIHCaqs?=
 =?iso-8859-1?Q?Tn6IuprQmHmEkK9kUi+Enf6E7r9kAD5kndzZmuhXBbuKh+G08kKR7twDPh?=
 =?iso-8859-1?Q?A1FpluKrhQw8LXfzW0dv/60Hh48caKFbve2BG8bXiZuZSd0XDCHPU4B7Cf?=
 =?iso-8859-1?Q?T8WF8gIRoNSp9MatquTEkjLtv9RFwZFhpmk528A9wNjJK65v2ht5un2Kwq?=
 =?iso-8859-1?Q?iWWGXZFac1oJ9vIMJwAaoYkC9e/F1C85fT7UlV2A7VIB6IUGOFqUiNhYMc?=
 =?iso-8859-1?Q?JsBVw/C7uhXzCJy/r5urKNHmkPEFXO8nxwW+8AZUYa1d4Hm49vZAkwKfKt?=
 =?iso-8859-1?Q?LxL6BruRVVKVTA1WUOqBAccfL9wooGvBQrtE7Zj9Xbl1amqnnYz8Okzl0i?=
 =?iso-8859-1?Q?vVqgsp7UN92w1/HBy9jTyxaf2fItiWIcpoFV8R0Z/yKqFPAr+3rScC5Tsc?=
 =?iso-8859-1?Q?VBmLaV17INQrPVCmOBPQ7/Cvp1YnsgvSa7nKjcEhBsplLho4n3m9BvUAXB?=
 =?iso-8859-1?Q?8Kd4cJxMLc2adYtDdFtPqGiG+hZOISbP/HOCdGSc09+rdttJMitWWolVAd?=
 =?iso-8859-1?Q?wqZWrQLmvHLLskn4XeZRX9uxZe7KF7jU0O8OgiIWqVhZxOKOm0/wd8UX8A?=
 =?iso-8859-1?Q?wMg5rS/VhUKi83T7zHpAhQvmtMMKLPXP9EyOkBQxAGMg1zmVApaN/KnN6t?=
 =?iso-8859-1?Q?TkOXWDSpoU8uUduZRFYxpi9AKibdXhUFNvu4qhVHPaP4ZSPhQrTaXrh6t9?=
 =?iso-8859-1?Q?tKd0OMwxV2cYzaSxJ5oiHeLl1xEJWegUapZuSPa7s24LuGPow1QDVhL1eZ?=
 =?iso-8859-1?Q?tjMEIj+gvvsNbvDoyIv0LiORiArEq2nhdVKBzwmO4+fQrd7AK5w/MOvJol?=
 =?iso-8859-1?Q?52rZzfLYTUSWmu29EVFBFXIlfHvcvCuTIbEBok7c3P4VHq+K762oTM0zBI?=
 =?iso-8859-1?Q?C7TOQTAQOAgl5kDFTeccksGEB1/wTZaYzJU5iXpSY5HMpbK2KJWw7WCguM?=
 =?iso-8859-1?Q?uoh000WPjE7XeNCvIgje+jILZ1Tzo5ZYMey2Oeda8t8PYbulEYYWSOl2g/?=
 =?iso-8859-1?Q?gjyYWaOf7WeTBzkx6YoyAjGh1177UxU=3D?=
X-Exchange-RoutingPolicyChecked: RDy4zbzfrBlPK6uFAndNQPd/w4QpIXRwNe1Vjg49hiASJ5tpmg4AoR4ra4dmGTdGULZhniOBH+pLH5idFKRhci9zzmGeEpUxyTC0x53FYrQRBfFumWqgPBjHSnm0z9Efe9PdMHkBa4GHlJgTiCsA4x8Ah0sksWeGcLpYzOgMfi55HzdX6eAEb12gOBMhpbEgtUHDCDI977LGM1uzLdldMiLeU9B0C9CU1vIZK8MVTdT0jR69hDq3nCbZntpHMOBWah2MU9wz6YI4yhLrP9soMe2nKsEWP+aVQMZN9ki8bPiUiuC6ahqpWf79gf78WrLemDm12KX3XgyPk9gqd38t2A==
X-MS-Exchange-CrossTenant-Network-Message-Id: e28e27cc-f935-44ad-fcae-08de976bfcd0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 01:45:19.3512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0px4Vl3HTDr3SsjK3h3sH0IY03ILnvN2y2tHzqsh+mPuU/LtXm1yLZw1H2SwnVY4Q1hIaBO84mx6aVo4GqPQiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6867
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

On Wed, Apr 08, 2026 at 11:01:48AM +0000, Satyanarayana K V P wrote:
> The suballocator algorithm tracks a hole cursor at the last allocation
> and tries to allocate after it. This is optimized for fence-ordered
> progress, where older allocations are expected to become reusable first.
> 
> In fence-enabled mode, that ordering assumption holds. In fence-disabled
> mode, allocations may be freed in arbitrary order, so limiting allocation
> to the current hole window can miss valid free space and fail allocations
> despite sufficient total space.
> 
> Use DRM memory manager instead of sub-allocator to get rid of this issue
> as CCS read/write operations do not use fences.
> 
> Fixes: 864690cf4dd6 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> ---
> V3 -> V4:
> - Updated changes as per xe_mem_pool.
> - Updated Fixes: field (Thomas)
> 
> V2 -> V3:
> - Used xe_mem_pool_init() and xe_mem_pool_shadow_init() to allocate BB
> pools.
> 
> V1 -> V2:
> - Renamed xe_drm_mm to xe_mm_suballoc (Thomas)
> ---
>  drivers/gpu/drm/xe/xe_bo_types.h           |  3 +-
>  drivers/gpu/drm/xe/xe_migrate.c            | 56 ++++++++++++----------
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 54 +++++++++++----------
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  5 +-
>  4 files changed, 63 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index ff8317bfc1ae..9d19940b8fc0 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -18,6 +18,7 @@
>  #include "xe_ggtt_types.h"
>  
>  struct xe_device;
> +struct xe_mem_pool_node;
>  struct xe_vm;
>  
>  #define XE_BO_MAX_PLACEMENTS	3
> @@ -88,7 +89,7 @@ struct xe_bo {
>  	bool ccs_cleared;
>  
>  	/** @bb_ccs: BB instructions of CCS read/write. Valid only for VF */
> -	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
> +	struct xe_mem_pool_node *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
>  
>  	/**
>  	 * @cpu_caching: CPU caching mode. Currently only used for userspace
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index fc918b4fba54..5fdc89ed5256 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -29,6 +29,7 @@
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
>  #include "xe_map.h"
> +#include "xe_mem_pool.h"
>  #include "xe_mocs.h"
>  #include "xe_printk.h"
>  #include "xe_pt.h"
> @@ -1166,11 +1167,12 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	u32 batch_size, batch_size_allocated;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_res_cursor src_it, ccs_it;
> +	struct xe_mem_pool *bb_pool;
>  	struct xe_sriov_vf_ccs_ctx *ctx;
> -	struct xe_sa_manager *bb_pool;
>  	u64 size = xe_bo_size(src_bo);
> -	struct xe_bb *bb = NULL;
> +	struct xe_mem_pool_node *bb;
>  	u64 src_L0, src_L0_ofs;
> +	struct xe_bb xe_bb_tmp;
>  	u32 src_L0_pt;
>  	int err;
>  
> @@ -1208,18 +1210,18 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  		size -= src_L0;
>  	}
>  
> -	bb = xe_bb_alloc(gt);
> +	bb = xe_mem_pool_alloc_node();
>  	if (IS_ERR(bb))
>  		return PTR_ERR(bb);
>  
>  	bb_pool = ctx->mem.ccs_bb_pool;
> -	scoped_guard(mutex, xe_sa_bo_swap_guard(bb_pool)) {
> -		xe_sa_bo_swap_shadow(bb_pool);
> +	scoped_guard(mutex, xe_mem_pool_bo_swap_guard(bb_pool)) {
> +		xe_mem_pool_swap_shadow_locked(bb_pool);
>  
> -		err = xe_bb_init(bb, bb_pool, batch_size);
> +		err = xe_mem_pool_insert_node(bb_pool, bb, batch_size * sizeof(u32));
>  		if (err) {
>  			xe_gt_err(gt, "BB allocation failed.\n");
> -			xe_bb_free(bb, NULL);
> +			kfree(bb);
>  			return err;
>  		}
>  
> @@ -1227,6 +1229,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  		size = xe_bo_size(src_bo);
>  		batch_size = 0;
>  
> +		xe_bb_tmp = (struct xe_bb){ .cs = xe_mem_pool_node_cpu_addr(bb), .len = 0 };
>  		/*
>  		 * Emit PTE and copy commands here.
>  		 * The CCS copy command can only support limited size. If the size to be
> @@ -1255,24 +1258,27 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
>  			batch_size += EMIT_COPY_CCS_DW;
>  
> -			emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
> +			emit_pte(m, &xe_bb_tmp, src_L0_pt, false, true, &src_it, src_L0, src);
>  
> -			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> +			emit_pte(m, &xe_bb_tmp, ccs_pt, false, false, &ccs_it, ccs_size, src);
>  
> -			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> -			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> +			xe_bb_tmp.len = emit_flush_invalidate(xe_bb_tmp.cs, xe_bb_tmp.len,
> +							      flush_flags);
> +			flush_flags = xe_migrate_ccs_copy(m, &xe_bb_tmp, src_L0_ofs, src_is_pltt,
>  							  src_L0_ofs, dst_is_pltt,
>  							  src_L0, ccs_ofs, true);
> -			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +			xe_bb_tmp.len = emit_flush_invalidate(xe_bb_tmp.cs, xe_bb_tmp.len,
> +							      flush_flags);
>  
>  			size -= src_L0;
>  		}
>  
> -		xe_assert(xe, (batch_size_allocated == bb->len));
> +		xe_assert(xe, (batch_size_allocated == xe_bb_tmp.len));
> +		xe_assert(xe, bb->sa_node.size == xe_bb_tmp.len * sizeof(u32));
>  		src_bo->bb_ccs[read_write] = bb;
>  
>  		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> -		xe_sa_bo_sync_shadow(bb->bo);
> +		xe_mem_pool_sync_shadow_locked(bb);
>  	}
>  
>  	return 0;
> @@ -1297,10 +1303,10 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
>  				  enum xe_sriov_vf_ccs_rw_ctxs read_write)
>  {
> -	struct xe_bb *bb = src_bo->bb_ccs[read_write];
> +	struct xe_mem_pool_node *bb = src_bo->bb_ccs[read_write];
>  	struct xe_device *xe = xe_bo_device(src_bo);
> +	struct xe_mem_pool *bb_pool;
>  	struct xe_sriov_vf_ccs_ctx *ctx;
> -	struct xe_sa_manager *bb_pool;
>  	u32 *cs;
>  
>  	xe_assert(xe, IS_SRIOV_VF(xe));
> @@ -1308,17 +1314,17 @@ void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
>  	ctx = &xe->sriov.vf.ccs.contexts[read_write];
>  	bb_pool = ctx->mem.ccs_bb_pool;
>  
> -	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
> -	xe_sa_bo_swap_shadow(bb_pool);
> -
> -	cs = xe_sa_bo_cpu_addr(bb->bo);
> -	memset(cs, MI_NOOP, bb->len * sizeof(u32));
> -	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> +	scoped_guard(mutex, xe_mem_pool_bo_swap_guard(bb_pool)) {
> +		xe_mem_pool_swap_shadow_locked(bb_pool);
>  
> -	xe_sa_bo_sync_shadow(bb->bo);
> +		cs = xe_mem_pool_node_cpu_addr(bb);
> +		memset(cs, MI_NOOP, bb->sa_node.size);
> +		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
>  
> -	xe_bb_free(bb, NULL);
> -	src_bo->bb_ccs[read_write] = NULL;
> +		xe_mem_pool_sync_shadow_locked(bb);
> +		xe_mem_pool_free_node(bb);
> +		src_bo->bb_ccs[read_write] = NULL;
> +	}
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index db023fb66a27..09b99fb2608b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -14,9 +14,9 @@
>  #include "xe_guc.h"
>  #include "xe_guc_submit.h"
>  #include "xe_lrc.h"
> +#include "xe_mem_pool.h"
>  #include "xe_migrate.h"
>  #include "xe_pm.h"
> -#include "xe_sa.h"
>  #include "xe_sriov_printk.h"
>  #include "xe_sriov_vf.h"
>  #include "xe_sriov_vf_ccs.h"
> @@ -141,43 +141,47 @@ static u64 get_ccs_bb_pool_size(struct xe_device *xe)
>  
>  static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>  {
> +	struct xe_mem_pool *pool;
>  	struct xe_device *xe = tile_to_xe(tile);
> -	struct xe_sa_manager *sa_manager;
> +	u32 *pool_cpu_addr, *last_dw_addr;
>  	u64 bb_pool_size;
> -	int offset, err;
> +	int err;
>  
>  	bb_pool_size = get_ccs_bb_pool_size(xe);
>  	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
>  		      ctx->ctx_id ? "Restore" : "Save", bb_pool_size / SZ_1M);
>  
> -	sa_manager = __xe_sa_bo_manager_init(tile, bb_pool_size, SZ_4K, SZ_16,
> -					     XE_SA_BO_MANAGER_FLAG_SHADOW);
> -
> -	if (IS_ERR(sa_manager)) {
> -		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
> -			     sa_manager);
> -		err = PTR_ERR(sa_manager);
> +	pool = xe_mem_pool_init(tile, bb_pool_size, sizeof(u32),
> +				XE_MEM_POOL_BO_FLAG_INIT_SHADOW_COPY);
> +	if (IS_ERR(pool)) {
> +		xe_sriov_err(xe, "xe_mem_pool_init failed with error: %pe\n",
> +			     pool);
> +		err = PTR_ERR(pool);
>  		return err;
>  	}
>  
> -	offset = 0;
> -	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
> -		      bb_pool_size);
> -	xe_map_memset(xe, &sa_manager->shadow->vmap, offset, MI_NOOP,
> -		      bb_pool_size);
> +	pool_cpu_addr = xe_mem_pool_cpu_addr(pool);
> +	memset(pool_cpu_addr, 0, bb_pool_size);
>  
> -	offset = bb_pool_size - sizeof(u32);
> -	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> -	xe_map_wr(xe, &sa_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);
> +	last_dw_addr = pool_cpu_addr + (bb_pool_size / sizeof(u32)) - 1;
> +	*last_dw_addr = MI_BATCH_BUFFER_END;
>  
> -	ctx->mem.ccs_bb_pool = sa_manager;
> +	/**
> +	 * Sync the main copy and shadow copy so that the shadow copy is
> +	 * replica of main copy. We sync only BBs after init part. So, we
> +	 * need to make sure the main pool and shadow copy are in sync after
> +	 * this point. This is needed as GuC may read the BB commands from
> +	 * shadow copy.
> +	 */
> +	xe_mem_pool_sync(pool);
>  
> +	ctx->mem.ccs_bb_pool = pool;
>  	return 0;
>  }
>  
>  static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
>  {
> -	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
> +	u64 addr = xe_mem_pool_gpu_addr(ctx->mem.ccs_bb_pool);
>  	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
>  	u32 dw[10], i = 0;
>  
> @@ -388,7 +392,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  #define XE_SRIOV_VF_CCS_RW_BB_ADDR_OFFSET	(2 * sizeof(u32))
>  void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
>  {
> -	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
> +	u64 addr = xe_mem_pool_gpu_addr(ctx->mem.ccs_bb_pool);
>  	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
>  	struct xe_device *xe = gt_to_xe(ctx->mig_q->gt);
>  
> @@ -412,8 +416,8 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
>  	struct xe_device *xe = xe_bo_device(bo);
>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>  	struct xe_sriov_vf_ccs_ctx *ctx;
> +	struct xe_mem_pool_node *bb;
>  	struct xe_tile *tile;
> -	struct xe_bb *bb;
>  	int err = 0;
>  
>  	xe_assert(xe, IS_VF_CCS_READY(xe));
> @@ -445,7 +449,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> -	struct xe_bb *bb;
> +	struct xe_mem_pool_node *bb;
>  
>  	xe_assert(xe, IS_VF_CCS_READY(xe));
>  
> @@ -471,8 +475,8 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>   */
>  void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
>  {
> -	struct xe_sa_manager *bb_pool;
>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +	struct xe_mem_pool *bb_pool;
>  
>  	if (!IS_VF_CCS_READY(xe))
>  		return;
> @@ -485,7 +489,7 @@ void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
>  
>  		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
>  		drm_printf(p, "-------------------------\n");
> -		drm_suballoc_dump_debug_info(&bb_pool->base, p, xe_sa_manager_gpu_addr(bb_pool));
> +		xe_mem_pool_dump(bb_pool, p);
>  		drm_puts(p, "\n");
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> index 22c499943d2a..6fc8f97ef3f4 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -17,9 +17,6 @@ enum xe_sriov_vf_ccs_rw_ctxs {
>  	XE_SRIOV_VF_CCS_CTX_COUNT
>  };
>  
> -struct xe_migrate;
> -struct xe_sa_manager;
> -
>  /**
>   * struct xe_sriov_vf_ccs_ctx - VF CCS migration context data.
>   */
> @@ -33,7 +30,7 @@ struct xe_sriov_vf_ccs_ctx {
>  	/** @mem: memory data */
>  	struct {
>  		/** @mem.ccs_bb_pool: Pool from which batch buffers are allocated. */
> -		struct xe_sa_manager *ccs_bb_pool;
> +		struct xe_mem_pool *ccs_bb_pool;
>  	} mem;
>  };
>  
> -- 
> 2.43.0
> 
