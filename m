Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBF3C87FD1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 04:07:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6317F10E721;
	Wed,  6 Aug 2025 04:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nv3Iz0Wp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CA110E721
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 04:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754453223; x=1785989223;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VRTfYL0ott5Aq/DEpKbDGsf2GozWCX4N9RIwdtksijw=;
 b=Nv3Iz0Wpeqpk4/evtf1RoUi4pqB+5ihToHImRihAcTmM4ytbzOe6Vb/i
 RoM3lAeP+ZCrxqHtI5CILiPs6muonWJIjLBrS0otvdNaa5AwtweakC95w
 ttmm6U93laNbAXofyoztsNgglqlAlGpKtVN0ZXp4Et2gfEDCOIgYTykSK
 tyMebNkmNk2TS5GTOzeuxCtPB0w4K6JkfDpI+MSCtW2a1wmM6vrX+WOD+
 qZQ4Wfmc46GrHefCtvkJJKocUUYzAcu/3UvAqQSyk+y+7dV4RGlSh4Z+3
 1WbDVNlse9XhRQtDQR2ta0uiAKDUAEOuC+jCmaNNo2P7qlke24pw2TRgR Q==;
X-CSE-ConnectionGUID: 9Xg1nvShQ5q9y1hwL1G7Lw==
X-CSE-MsgGUID: G3lO5hm9TGucJpeb/l5qHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="82210749"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="82210749"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 21:07:02 -0700
X-CSE-ConnectionGUID: Onq6s7+sQfuH7Ht+RjEQoQ==
X-CSE-MsgGUID: b5KLxNFYTk2CW/PU7XOINg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164571884"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 21:07:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 21:07:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 21:07:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.79)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 21:07:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWVHdXEujkU11jTNGyvYTiZBgaoNzYCefs1S3Y1jmZcxDI9EeQcuDidMKaHswoidcuDfbwEGhR5+r6fX9T77HEiyahKReLpZhU/XfdJUUSEp8gXsLkSQ1jCYJtqRRk8f03v2G9R6KvDOFxNRdMGaWWhhUrLSzbKAZCyLVZjvenMBhU7myLVqlM9W9+Ct8Wcpk01gfs6TnT8+QsJyQGcZA1j1o0oR27oa589Tpx/3Kuf7pDoNY4coEknu5yWXls45+ShAIp8HpnQK2pd0sQmHMaqfgzrINf4tFtV9qwMMkcyJPiYXSxWotO+8F1MV03gqOYDPpqbQGTv7fl6HKZOOvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+l3iws1Jo8LEnDm9ckkBRxPIJ5Yj9No5d9d4klUKI9M=;
 b=Zv7yMRQiHNfK9MjaxCC04HZHzjcozVuoy48oD+5NXRCPWUSuOSSfOjKZpayhfFMX3sAetDWb5T1Z4KwgwzW68mzkFMPeB8r9RiVuY9wyp+9EYmAWHcIQux/ktCbEtbmFSjGpSSop1upQL9V/IAd0uRbrDeQrInLLg5XSPpkBZjKVq1acAaypwZ3M1ntIbGsBNPZgTpriD4zKu9Y7pGwa9stx3r2LjqqQQhECBH6ZtwfzXnEMQG0lweTDyV2VizLEl2bs0xisRbAuRukR/8l2LFnaTyD+Lz1ZVu8p3LcehWdjZZrjQeWu5YcVgMf7OBmD+pgdCeG6leTFts4qPzwuQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8301.namprd11.prod.outlook.com (2603:10b6:208:48d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 04:06:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 04:06:58 +0000
Date: Tue, 5 Aug 2025 21:06:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 23/25] drm/xe: Reset VMA attributes to default in SVM
 garbage collector
Message-ID: <aJLU39dKLNb48T7A@lstrano-desk.jf.intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-24-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250730130050.1001648-24-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR03CA0181.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8301:EE_
X-MS-Office365-Filtering-Correlation-Id: 205b8779-06b4-4ce7-1d91-08ddd49eb049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BHCMInUw20ERilPOpraEPQ0B9TJHRX0PSfYwIGfleJoCo5g8JNtep7tpbwkF?=
 =?us-ascii?Q?krDNp3U7XfqpGkPHriOQBJOp1DL6qjm3g/zIrRLHblpyaDNwqbPzpYHakdIB?=
 =?us-ascii?Q?GksloMSQ3u1rPhV6rGOYiI4ZgCaxW8TYY44XHWFZ6mrOIO8HEV/wHhTS46NX?=
 =?us-ascii?Q?ngogzcw2F30n1iUXWlsZLltkLmsKg3Hlxlt40XJjripAsCBCCSf5UzaIFIyS?=
 =?us-ascii?Q?BGhOXMj3SwO7bFH/+GEoCQY3xgwGp3x0z3MqyxtX5lGY8pZxPJv0VCna5Udy?=
 =?us-ascii?Q?rQ43u5Utxo2qaID+Yy0B93wma6vxbstdQEuQLejAMucvjf8I4zUkMaFkB6cE?=
 =?us-ascii?Q?0EzJUmGEyp7wQrclJOFeAyE6hW9cMAj5vn9eFtIdafIqw5ftTht2rK+XExE1?=
 =?us-ascii?Q?FsHZYfrfTsOCSMYsjhmw0+pNp0QGdY29CtehW8i52GzrhlKhiaaL/vN9uVz0?=
 =?us-ascii?Q?OJ3SRpYpFNOEzQVkmjJuh+0fE8piYcFUd0X5uKEN+fdmLxczGzq4/v85WHQi?=
 =?us-ascii?Q?bIOYzAAs6nSYRW+P+959Cml5pYya6cHxpjyDytqo8CNxav/vR8FvitLhJNyX?=
 =?us-ascii?Q?5U74hWdzijAK1u8fgRUK/PBCKUtdyriNeLYHpmROkeJA7eXKL8Pb9aNnhcBl?=
 =?us-ascii?Q?KgqCR8CJV4NqTqqHKA5bt/sDgUhzwwIBXJ9qG3o8YsVlwTl5ovZRZp5xq9Um?=
 =?us-ascii?Q?xIycTsqXCrDxmeA/Wx5hRH08P4kgx6Oj24Nbvi3lIG0h1/ZFOq0TApyV+wND?=
 =?us-ascii?Q?p28MLxXnf6vFWjcGOPnJasxUj8ULqCRPPfvjuZ0OwW+bfbp9eEnyLtMO6+Bp?=
 =?us-ascii?Q?E/WiKvDxJHLgq7QzS8v3BS4tgxKpX4c4vgXrTeJ8QrPL2B24akCAJf6LCESB?=
 =?us-ascii?Q?pTr0OVtYbIXqfBkc1fyDeY/Vtn1Nndtoc2XAvovnkwjUBObcC/KlsL+LSsy+?=
 =?us-ascii?Q?NXK6HwyquVnYDvRqolK/hMmxtmUMyPuS8GQTzdnokkrWpkmQiQ9bjEzaf5xS?=
 =?us-ascii?Q?prjfI7gJPNyAUlwQfYAOrOqyGRzTsWsXTRtX5kKTAHLApMQqDzC1tE3bHwYD?=
 =?us-ascii?Q?eB3SzwMxRbbIXE1NDgHebKkuVt/KlIEImGbCTTln3wflSDST2VYvkZk9SFiU?=
 =?us-ascii?Q?5QVuqxTKdT1YQALoS4Q+dfy4rSjpmBc26NfLTLZs/fuePUmNup4q25C16F2j?=
 =?us-ascii?Q?w742jS7XrhD2iRzUeIn9LCW6ykaK4l79OlHzsMoOUfTfjkDTGCgjqHCzB+5d?=
 =?us-ascii?Q?Z7sRsEkfUoeCSH5cv5qjwUUf5iWRo7vJbQB+8A/D3Kp1THItDWQkqPmLUmkl?=
 =?us-ascii?Q?3X49Ko7NLgUk3MAjyQAwhkgSLYD+9zBG4hroHd27JNBY4aKJajwVbBx04aM7?=
 =?us-ascii?Q?crRFNJk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jcgtSa1IJ+WDTLIl/yv0enn1N1iWJN5PV0vf82aK0TRWL4qJv7VCpMS1zRHp?=
 =?us-ascii?Q?gU+fDSVjpLXyq3frT0Afbdqft2MbP0Z2VfBfKc2BWwIhLfPg/FnVoTiGL4DA?=
 =?us-ascii?Q?tdVmuSqNa8rgt8hnConE6vWoUPmwRCuI0bpJgFtVbTkIuPcoxgHjR43YSMSm?=
 =?us-ascii?Q?JtO1e0y4IukFjK/yuslkAQLGKo2hnQbQ1wLGaylEgL4UowqoJuZINxzZLpTZ?=
 =?us-ascii?Q?mRgV9n0MiEX+EFMWPRKNAFiZ4hUwY5M6r0PeK8M3iq82/+VFR0nGqm/bz5D8?=
 =?us-ascii?Q?fku4eewFT886dFSRx3uJ+Lj0vhQoXMPQEyoJCWYN8pDVxdhB9JtFXFTrTH3o?=
 =?us-ascii?Q?MhHgj3HH/Tve7dfBEtiIZnBCnU/PuUiWTu9GF9gCr5+WsZvKBg7CsseO+O8p?=
 =?us-ascii?Q?lt7NuBih4QgbjDi/+AV1X3FOuGNJ84yY/wKs4qsere6jxvSaImmSMUEjAV9L?=
 =?us-ascii?Q?NJILd5Rsoil7smebORlPGccst0Nherk5OSIONML3rJBVAJ0fM2qcCk2XLKS5?=
 =?us-ascii?Q?TA5UFAducxDfjK1p9KMnP++LjDp0LckikP1OyaYezx5ZQ1gmg5StTgrVm8U4?=
 =?us-ascii?Q?ixemY9XPKgI+xcfCWE+jqKIAJEa3AnfEYUY+WeJL8Ow8oycCCfBEbnzzu+oI?=
 =?us-ascii?Q?WsiPJdvczTRFSdl6xXbqYVV+A0zzke8kTUvAXsU5v4KQr3n6nlnEaB1sZ1SU?=
 =?us-ascii?Q?kq/HFLNGTRD1enJJrH1tdHRugwmbjy+saet4PV4xrw9BbwV2JZY506AVIv1q?=
 =?us-ascii?Q?nUQZsG5zTsAzJU+iykyRwI6oAx/svm20bjHAebhooSGJHbj8K5Bg98qnJbtZ?=
 =?us-ascii?Q?uoqhY5aueHBsodx0VLvhSRao3L5YXmkZjeWS2En0etOx8iJNnS7OwPZyeRGp?=
 =?us-ascii?Q?Ipee905XdUevtXeiAq/lCqRmVILPGw+srZMgoFMrIPM4a2DE52eB0vfSyF8q?=
 =?us-ascii?Q?XlyxOg6P2qW2V/+Cq2LnI7Xn+/wpt9axVI6ZTOBxoD9gbrE/TIapzl0NirwJ?=
 =?us-ascii?Q?BvlkhhVK4nfSK3lPR+++eWmog6tv+9xJfI5Q5L/tYB4MEt/c9XCVwYkt5z0U?=
 =?us-ascii?Q?ruCvscNJpknexmDx9mHkKTR7wAmUMJHfzkJUwKH9ONUnbw9t1u0zeu08kqxI?=
 =?us-ascii?Q?iCFEvSsvfDqJdyug6w+258wOI2w84qiwukoMzSUt2qNqrbUYWzsim1AEF3FE?=
 =?us-ascii?Q?yJiRWrtg2hcmaspqQtTlanNrMt87z09G3DkmgSr4XqU8nQd/h+0K7FTDyQjE?=
 =?us-ascii?Q?gm0f88D0CZ6amAnnv6WHDdeWq7vHwBYkTIgdqLF8NhOau3vHAjIoT5eCf0OJ?=
 =?us-ascii?Q?SzgDso7zMtUWO4FPko3olKHmhMiUp0Bmq8kg2L4JDhldfXlRmSblsABsLNXZ?=
 =?us-ascii?Q?zMoe98wESGoZX2u3jZCotDeybI29wuKZPVal93wxaVcNa+PAcJbfMWTmO+Cz?=
 =?us-ascii?Q?1E5t4P0ul012jPvcY4SXpoWr5mReput8Bz+Ijr0x6llw2dRsUqkgVVjlp1KR?=
 =?us-ascii?Q?Y4ZiI82E3QsKhKiodb76xDt5k75YvMLbeAvd+QttPD3oYAsow7DWNlc4mXv3?=
 =?us-ascii?Q?GoA+O0rla94tHeSLI0Qo91YMAtX4b2YVCfsdR0dWeJHDm5LsBevjYVJ4rsUy?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 205b8779-06b4-4ce7-1d91-08ddd49eb049
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 04:06:58.6213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wY7/TsKAhAnvee4Bsl1apO1ojSlUTOl0FvS/FTbsRbCh+/ZIqDbSjav5wr+Zri4v6f/AYIFn6Qyfd4AhMy+hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8301
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

On Wed, Jul 30, 2025 at 06:30:48PM +0530, Himal Prasad Ghimiray wrote:
> Restore default memory attributes for VMAs during garbage collection
> if they were modified by madvise. Reuse existing VMA if fully overlapping;
> otherwise, allocate a new mirror VMA.
> 
> v2 (Matthew Brost)
> - Add helper for vma split
> - Add retry to get updated vma
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 114 +++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_vm.c  | 155 ++++++++++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_vm.h  |   2 +
>  3 files changed, 206 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index aef76e08b460..9b3a3f61758c 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -253,9 +253,55 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
>  	return 0;
>  }
>  
> +static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64 range_end)
> +{
> +	struct xe_vma *vma;
> +	struct xe_vma_mem_attr default_attr = {
> +		.preferred_loc = {
> +			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
> +			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
> +		},
> +		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
> +	};
> +	int err = 0;
> +
> +	vma = xe_vm_find_vma_by_addr(vm, range_start);
> +	if (!vma)
> +		return -EINVAL;
> +
> +	if (xe_vma_has_default_mem_attrs(vma))
> +		return 0;
> +
> +	vm_dbg(&vm->xe->drm, "Existing VMA start=0x%016llx, vma_end=0x%016llx",
> +	       xe_vma_start(vma), xe_vma_end(vma));
> +
> +	if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
> +		default_attr.pat_index = vma->attr.default_pat_index;
> +		default_attr.default_pat_index  = vma->attr.default_pat_index;
> +		vma->attr = default_attr;
> +	} else {
> +		vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
> +		       range_start, range_end);
> +		err = xe_vm_alloc_cpu_addr_mirror_vma(vm, range_start, range_end - range_start);
> +		if (err) {
> +			drm_warn(&vm->xe->drm, "VMA SPLIT failed: %pe\n", ERR_PTR(err));
> +			xe_vm_kill(vm, true);
> +			return err;
> +		}
> +	}
> +
> +	/*
> +	 * On call from xe_svm_handle_pagefault original VMA might be changed
> +	 * signal this to lookup for VMA again.
> +	 */
> +	return -EAGAIN;
> +}
> +
>  static int xe_svm_garbage_collector(struct xe_vm *vm)
>  {
>  	struct xe_svm_range *range;
> +	u64 range_start;
> +	u64 range_end;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
> @@ -271,6 +317,9 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>  		if (!range)
>  			break;
>  
> +		range_start = xe_svm_range_start(range);
> +		range_end = xe_svm_range_end(range);
> +
>  		list_del(&range->garbage_collector_link);
>  		spin_unlock(&vm->svm.garbage_collector.lock);
>  
> @@ -283,6 +332,10 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>  			return err;
>  		}
>  
> +		err = xe_svm_range_set_default_attr(vm, range_start, range_end);
> +		if (err)
> +			return err;

You don't want to return on -EAGAIN here, rather collect it, continue
and return -EAGAIN once the garbage collector list is empty. No need to
contiously lookup the VMA in xe_svm_handle_pagefault (in next rev
__xe_svm_handle_pagefault), this only need be done once.

> +
>  		spin_lock(&vm->svm.garbage_collector.lock);
>  	}
>  	spin_unlock(&vm->svm.garbage_collector.lock);
> @@ -793,40 +846,59 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			    struct xe_gt *gt, u64 fault_addr,
>  			    bool atomic)
>  {
> -	int need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
> -
> -	if (need_vram < 0)
> -		return need_vram;
> -
> -	struct drm_gpusvm_ctx ctx = {
> -		.read_only = xe_vma_read_only(vma),
> -		.devmem_possible = IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> -		.check_pages_threshold = IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
> -		.devmem_only = need_vram && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> -		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
> -			vm->xe->atomic_svm_timeslice_ms : 0,
> -	};
> +	struct drm_gpusvm_ctx ctx = { };
> +	struct drm_pagemap *dpagemap;
>  	struct xe_svm_range *range;
>  	struct dma_fence *fence;
> -	struct drm_pagemap *dpagemap;
>  	struct xe_tile *tile = gt_to_tile(gt);
> -	int migrate_try_count = ctx.devmem_only ? 3 : 1;
> +	bool vma_updated = false;
> +	int need_vram;
> +	int migrate_try_count;
>  	ktime_t end = 0;
>  	int err;
>  
> -	lockdep_assert_held_write(&vm->lock);
> +find_vma:
> +	if (vma_updated) {
> +		vma = xe_vm_find_vma_by_addr(vm, fault_addr);
> +		if (!vma)
> +			return -EINVAL;
> +	}
> +
>  	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
> +	vma_updated = false;
> +
> +	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
> +	if (need_vram < 0)
> +		return need_vram;

This is a bit ugly. I think if you have __xe_svm_handle_pagefault and
xe_svm_handle_pagefault as here [1] this can be handled cleaner (i.e.
still a static setup of drm_gpusvm_ctx).

If xe_svm_garbage_collector returns an in __xe_svm_handle_pagefault kick
it up to xe_svm_handle_pagefault, you catch -EAGAIN there, relookup the
VMA and call __xe_svm_handle_pagefault again. I think that would look
quite a bit better.

Matt

[1] https://patchwork.freedesktop.org/patch/666222/?series=149550&rev=5#comment_1222471 

> +
> +	ctx.read_only = xe_vma_read_only(vma);
> +	ctx.devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> +	ctx.check_pages_threshold = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
> +				    SZ_64K : 0;
> +	ctx.devmem_only = need_vram && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> +	ctx.timeslice_ms = atomic && IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
> +			   vm->xe->atomic_svm_timeslice_ms : 0;
>  
> +	migrate_try_count = ctx.devmem_only ? 3 : 1;
> +
> +	lockdep_assert_held_write(&vm->lock);
>  	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
>  
>  retry:
>  	/* Always process UNMAPs first so view SVM ranges is current */
>  	err = xe_svm_garbage_collector(vm);
> -	if (err)
> -		return err;
> +	if (err) {
> +		if (err == -EAGAIN) {
> +			/*
> +			 * VMA might have changed due to garbage
> +			 * collection; retry lookup
> +			 */
> +			vma_updated = true;
> +			goto find_vma;
> +		} else {
> +			return err;
> +		}
> +	}
>  
>  	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5ee38e9cf6c6..e77c04f92d0b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4263,36 +4263,24 @@ int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool i
>  	}
>  }
>  
> -/**
> - * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
> - * @vm: Pointer to the xe_vm structure
> - * @start: Starting input address
> - * @range: Size of the input range
> - *
> - * This function splits existing vma to create new vma for user provided input range
> - *
> - *  Return: 0 if success
> - */
> -int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> +static int xe_vm_alloc_vma(struct xe_vm *vm, struct drm_gpuva_op_map *map_req)
>  {
> -	struct drm_gpuva_op_map map_req = {
> -		.va.addr = start,
> -		.va.range = range,
> -		.flags = DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE,
> -	};
> -
>  	struct xe_vma_ops vops;
>  	struct drm_gpuva_ops *ops = NULL;
>  	struct drm_gpuva_op *__op;
>  	bool is_cpu_addr_mirror = false;
>  	bool remap_op = false;
> +	bool is_madvise = (map_req->flags & DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE);
>  	struct xe_vma_mem_attr tmp_attr;
> +	u16 default_pat;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
> -	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
> -	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
> +	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
> +	       map_req->va.addr, map_req->va.range);
> +
> +	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, map_req);
>  	if (IS_ERR(ops))
>  		return PTR_ERR(ops);
>  
> @@ -4303,33 +4291,56 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  
>  	drm_gpuva_for_each_op(__op, ops) {
>  		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +		struct xe_vma *vma = NULL;
>  
> -		if (__op->op == DRM_GPUVA_OP_REMAP) {
> -			xe_assert(vm->xe, !remap_op);
> -			remap_op = true;
> +		if (!is_madvise) {
> +			if (__op->op == DRM_GPUVA_OP_UNMAP) {
> +				vma = gpuva_to_vma(op->base.unmap.va);
> +				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
> +				default_pat = vma->attr.default_pat_index;
> +			}
>  
> -			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
> -				is_cpu_addr_mirror = true;
> -			else
> -				is_cpu_addr_mirror = false;
> -		}
> +			if (__op->op == DRM_GPUVA_OP_REMAP) {
> +				vma = gpuva_to_vma(op->base.remap.unmap->va);
> +				default_pat = vma->attr.default_pat_index;
> +			}
>  
> -		if (__op->op == DRM_GPUVA_OP_MAP) {
> -			xe_assert(vm->xe, remap_op);
> -			remap_op = false;
> +			if (__op->op == DRM_GPUVA_OP_MAP) {
> +				op->map.is_cpu_addr_mirror = true;
> +				op->map.pat_index = default_pat;
> +			}
> +		} else {
> +			if (__op->op == DRM_GPUVA_OP_REMAP) {
> +				vma = gpuva_to_vma(op->base.remap.unmap->va);
> +				xe_assert(vm->xe, !remap_op);
> +				remap_op = true;
>  
> -			/* In case of madvise ops DRM_GPUVA_OP_MAP is always after
> -			 * DRM_GPUVA_OP_REMAP, so ensure we assign op->map.is_cpu_addr_mirror true
> -			 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
> -			 */
> -			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
> -		}
> +				if (xe_vma_is_cpu_addr_mirror(vma))
> +					is_cpu_addr_mirror = true;
> +				else
> +					is_cpu_addr_mirror = false;
> +			}
>  
> +			if (__op->op == DRM_GPUVA_OP_MAP) {
> +				xe_assert(vm->xe, remap_op);
> +				remap_op = false;
> +				/*
> +				 * In case of madvise ops DRM_GPUVA_OP_MAP is
> +				 * always after DRM_GPUVA_OP_REMAP, so ensure
> +				 * we assign op->map.is_cpu_addr_mirror true
> +				 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
> +				 */
> +				op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
> +			}
> +		}
>  		print_op(vm->xe, __op);
>  	}
>  
>  	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
> -	vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
> +
> +	if (is_madvise)
> +		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
> +
>  	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
>  	if (err)
>  		goto unwind_ops;
> @@ -4341,15 +4352,20 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  		struct xe_vma *vma;
>  
>  		if (__op->op == DRM_GPUVA_OP_UNMAP) {
> -			/* There should be no unmap */
> -			XE_WARN_ON("UNEXPECTED UNMAP");
> -			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
> +			vma = gpuva_to_vma(op->base.unmap.va);
> +			/* There should be no unmap for madvise */
> +			if (is_madvise)
> +				XE_WARN_ON("UNEXPECTED UNMAP");
> +
> +			xe_vma_destroy(vma, NULL);
>  		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
>  			vma = gpuva_to_vma(op->base.remap.unmap->va);
> -			/* Store attributes for REMAP UNMAPPED VMA, so they can be assigned
> -			 * to newly MAP created vma.
> +			/* In case of madvise ops Store attributes for REMAP UNMAPPED
> +			 * VMA, so they can be assigned to newly MAP created vma.
>  			 */
> -			tmp_attr = vma->attr;
> +			if (is_madvise)
> +				tmp_attr = vma->attr;
> +
>  			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
>  		} else if (__op->op == DRM_GPUVA_OP_MAP) {
>  			vma = op->map.vma;
> @@ -4357,7 +4373,8 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  			 * Therefore temp_attr will always have sane values, making it safe to
>  			 * copy them to new vma.
>  			 */
> -			vma->attr = tmp_attr;
> +			if (is_madvise)
> +				vma->attr = tmp_attr;
>  		}
>  	}
>  
> @@ -4371,3 +4388,53 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  	drm_gpuva_ops_free(&vm->gpuvm, ops);
>  	return err;
>  }
> +
> +/**
> + * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
> + * @vm: Pointer to the xe_vm structure
> + * @start: Starting input address
> + * @range: Size of the input range
> + *
> + * This function splits existing vma to create new vma for user provided input range
> + *
> + * Return: 0 if success
> + */
> +int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> +{
> +	struct drm_gpuva_op_map map_req = {
> +		.va.addr = start,
> +		.va.range = range,
> +		.flags = DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE,
> +	};
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
> +
> +	return xe_vm_alloc_vma(vm, &map_req);
> +}
> +
> +/**
> + * xe_vm_alloc_cpu_addr_mirror_vma - Allocate CPU addr mirror vma
> + * @vm: Pointer to the xe_vm structure
> + * @start: Starting input address
> + * @range: Size of the input range
> + *
> + * This function splits/merges existing vma to create new vma for user provided input range
> + *
> + * Return: 0 if success
> + */
> +int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> +{
> +	struct drm_gpuva_op_map map_req = {
> +		.va.addr = start,
> +		.va.range = range,
> +	};
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	vm_dbg(&vm->xe->drm, "CPU_ADDR_MIRROR_VMA_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
> +	       start, range);
> +
> +	return xe_vm_alloc_vma(vm, &map_req);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index f735d994806d..6538cddf158b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -177,6 +177,8 @@ int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool i
>  
>  int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>  
> +int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
> +
>  /**
>   * to_userptr_vma() - Return a pointer to an embedding userptr vma
>   * @vma: Pointer to the embedded struct xe_vma
> -- 
> 2.34.1
> 
