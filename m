Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7728C4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 22:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6690710E249;
	Tue, 13 Feb 2024 22:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fM6DM5Gp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEC610E249
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 22:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707863052; x=1739399052;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z4yNvvmNbkBNmccp9kSH99tCm88sbv33UV68gfFfnrE=;
 b=fM6DM5GpKl3WQXHzHu/rUsc31Prbr90g2bv9teQoVNP/U/50S5uktRDJ
 DSVSpnYztM860e88qDQyqRdGctHdKb0C1mxk2SkxgD+W47Jzt5kZdp3cK
 NjMl+S9GgsqROekZmY/ETFaccZNEXIZ7TXjapvixVIbFnEmXal+jx+O8R
 6AlZqGGmTIKnoKzT2qzhhATK6rm4cyFShh5P0dGiRjAW3DMtazes3d9YO
 +V20noybfuLEU4Wv/phOYNW7fn+eGTx2RehGRx84PGolQngkG3tmdh4Ha
 i+3rV6DXpZN+T5kvLOBHO6ogc1PPFsRPAYXMhlurw0AZmGBXdeVkzDohK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5715590"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="5715590"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 14:24:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="2987495"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 14:24:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 14:24:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 14:24:07 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 14:24:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bzs4yyM6p8mJyz3PqMaYvD3znKF105fmpsVwAdgHZVzdSlyGUCkSv59xxnrPKLfZ6zTATRQvXMtnhkujn5YPS4Sy3BkxXXoal1Zi1s/xORzOgz8UXxBXlb2sCAvHsGOasyMKgjx4Eef7QljrqFo1CIxS3pxZYU2ySnHFdnLw2xzO6KUrvBg3z6cTeS6MECVKG/RfvG0WKoEQv2105wJJAQ90lKgGOU9GJnpDnzGhgzX/ghPCdCbIdVsvTcPn50iTrEA+iMC5Hvus7Ea/wj4bhdVoHWX7/KouPvt+59LamzgBkBbkyKXTBLmfEYB4oB0Tq689orRtCFmG+1gOu+VwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CG+Qpenee8Hm9S2BWFzP6tZi7YOxK3nbhm3z4ZaxMgM=;
 b=TNgAyfOfMN6ZHZsAJqUYnqgEyCkYXkpBEAKP9GEZ/47ivg2KbczmCQMUFK0UcJX57oCoy/tBDkmd6a5kxqT06tLeL6Fm5sU3r5eak1Cx1zLv+m2Vaxaid/ReiOCQWYK9nz+9XXn9MvoLyrIGXTMlf26O2naW8ms9tNTOQKBlOmdiXhIQr+Lv+Twao4IDQqxFB9NKXpvh4n6LzZ9/2wMLhTSMPilf33J5BmKO0B24vw8BkbWdhjSw70HHtuBSMHNbJKToEqnZ/qvKaCenM5Qhhx9F30miOp2XCrfaN5Ng162ucdlxwQcD5UZTSG1sjLZ26XAJeCHzmOdNC9E7+pJOog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 22:24:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 22:24:06 +0000
Date: Tue, 13 Feb 2024 17:24:03 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Promote GUC_GGTT_TOP definition to
 regs/xe_guc_regs.h
Message-ID: <ZcvsAxWzSAy_TEFs@intel.com>
References: <20240213213634.1437-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240213213634.1437-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0290.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV3PR11MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: 930915ae-1c19-4c7e-6709-08dc2ce27d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iegbL74a66ZuWNSbXtqPjxR+w5oMmAdtbejndXlp9S9PvfGcLFruIzBFNEId4B359UaznFRP3FdOIIKA6h5vfh2r9IHeZah7pBsK+gthIQDje41iobi8FsTG7A9tLNuRVXxdWLch7jZyOxiLQpr+EOZTH7bOaaktPQduZcFdm2wu6WF8Ia85RprVw2vIiVv6Uuafhxj4YgfNG0NFp9cH1zZM0kS5UVOaElMfZGgRE5TLvXhIhICliftOOi/shC9iCRZ7/iOpYDZJ6e9iRFbkQ+vOACAXkeZ2/cdNFMyXJ50zkCRpelrNu7vRWkBLacK1yzqRzBvCY177gmm9/zKORRH3z7FBRJi7trEdBpx6og01FOj82rK7iRh0qEZ6LuKaA8vniyvJj5j2rby/PyrIll6uwjvmB8Yl4cdRbdnhaAJehI7PuuHN8p1Lp5fiTTUoZPvLnwp780rcUFGp3ljrj/Ztl8ONHqWNbHsHZrCq700mRrVh6tkxWoPQQ5W7ostvLPLsRGugAdPsn3G0NgMBkEnioQRqqx4Lk2bPpe8upwFmxeqmh6JhfzRiO2Hb/IBr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(376002)(366004)(396003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(44832011)(36756003)(66476007)(66946007)(6862004)(8936002)(8676002)(66556008)(38100700002)(4326008)(5660300002)(82960400001)(41300700001)(86362001)(37006003)(83380400001)(6506007)(6486002)(6666004)(316002)(26005)(2616005)(6512007)(478600001)(2906002)(6636002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6zPbXH4fztyGwy6nAyW6o7uWsIW2qOwmtXwGSgOzaGb57u0Jiwst7JFei3rj?=
 =?us-ascii?Q?HKlObZx/R5luvymzP7Ujk7umYuJ1PUsxXgcqxS2KAIctM55v04SpdnL563nU?=
 =?us-ascii?Q?4bxNCbydKuqVWrQOSqo6f/78nU+yo3+HVjz/d7bFpHGnynzPfJ4vmUVGGP56?=
 =?us-ascii?Q?uwbAYUJxR6JKo8sQfjA6mVa9OXuNS7/2hzpMfmycd3x3TJQSqlhfaNDIkD4P?=
 =?us-ascii?Q?PyodbvcfpTElOAMGy1zQxW9h/D3n7amBapShQ/tA4DuBS/OpOowokM/bWQKV?=
 =?us-ascii?Q?12nooJJCO85k+6QGHG8acLn+ASj8af9o0Fri5Xw+u7jZSzA0MJ3wOvm6xSYE?=
 =?us-ascii?Q?fEsYHKA7MVcTYoqDWIrQg0YRKtWriGuEeD94aHcniR3fO80g3i9TBp1RdBiJ?=
 =?us-ascii?Q?hV+FrV2x+h6iwmKFvmWWisWmZua0PY+qnZGeuU3dVhDs6i4VfWzPo7Wy+3k+?=
 =?us-ascii?Q?suD2vmCP9wUqlMM5iIpJlPyW71g61DuuYiHNYc8hA7nNwCq40TdyHO2MHHXL?=
 =?us-ascii?Q?bK6TTHVt1aEwqvq0YT2NArzXDBtxQ5cEM2pbRNyJB3yNXFFK6Ra7WzTLO2Rm?=
 =?us-ascii?Q?AlrbNH2cdoXDw8C75vWUr+DZzPcK2Ghqa+WGJ0LttQ+Da+3uBvuEZC09O1rH?=
 =?us-ascii?Q?wlmONKwbzrn/f6CC/783Wbt67Gr3nXK/V7eRWcp2f8WNrWjbKir+4SkqCcnV?=
 =?us-ascii?Q?L4I3Q+EFKYs20+S61opRZJ9pB5llwEMcrd5d8H3shQAEBo0aNDCDe+PINuim?=
 =?us-ascii?Q?WcLKc5SJHSgBa9o6Z8CKHuU266iXOe6QFHTGl8WtWu2zEjYKuAse9laTTJ0J?=
 =?us-ascii?Q?/KxIIdfzHgpTP8s/719Gps1Ygsh2Pah0j4pnGTGtGL4NEE/NnTWKC2HLiZTR?=
 =?us-ascii?Q?VTdmxO2xFqvN9kakwiCF2j1cd5WHifCO1vzDjWPxkFE6nrD5YotpfIEhtoo5?=
 =?us-ascii?Q?HrmNaft2nGi/fWjBFxSumjqZdq6UlXyYdvKw1BH3WZW6Fm3pka17LYJMb6AT?=
 =?us-ascii?Q?f3h8/6H5XijwPxe8VoME4lg0lbqCFF9zAgT9sW3v12x49iWrqo3ot++2IogT?=
 =?us-ascii?Q?aeWdY4tR7/ITnfwBOPYZIYbbz518ucTlpOIVJLqu37Is0HFkgMXbm7qPt65P?=
 =?us-ascii?Q?fkmEtdlIJ5Nxg7I46qXD9Qyggop+RnqAPGGCnT47dWji2onLDCWoOU+9F/DD?=
 =?us-ascii?Q?OsQ9myI6S4WiiaYDQDw0SFDyDaF9WsJBN4eHuoH1URMk8xb1KuYNXlGwz6vX?=
 =?us-ascii?Q?XD66lBLizXSFMcHX64NJaJ5fKE98HnZHfPgwwLAeZn1cgUmYdcdJhtAo1haX?=
 =?us-ascii?Q?oLOOwgWCNI51XdfNp2mEaxoz0Iqp4qBQTqIJSdpbyxFH0u1jWl7QVwlSLriD?=
 =?us-ascii?Q?4t5a1hGyDUnysT73B+Cqj2dwjvgiKHxGZxuRmaM75kZzBPs0JiPnpcTAAW4C?=
 =?us-ascii?Q?lQcjGqwJ2pqQlO/IM/oA9IyRw/M0+EKYStaGeCZNX4L7nXcr2++ehJYX/9dE?=
 =?us-ascii?Q?IpJaz9SKNYG4Ca2a2hpk8XCXKBA4hx9uJuJke8VZKx+cHkCrOq7A9zEConrp?=
 =?us-ascii?Q?spPjpCEIQjKMQijgHiEuVNFBwzROv6hDNzxeTHGqxYoKzShffKoj169d7FT7?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 930915ae-1c19-4c7e-6709-08dc2ce27d74
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 22:24:06.1925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gg01kCuqXzWwk9dDFny34TSpyRPz4TdZ7gTPHiObMsMsD4nBWS2r/Xq10s98b0Y+Ci2qHJoMAeeVzLA4cVVL8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8695
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

On Tue, Feb 13, 2024 at 10:36:34PM +0100, Michal Wajdeczko wrote:
> This is a hardware based definition and instead of multiple local
> definitions it would be better to have just one common definition.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_ggtt.c          | 4 +---
>  drivers/gpu/drm/xe/xe_guc.c           | 2 --
>  3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 92320bbc9d3d..087eaa3b4d63 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -140,4 +140,7 @@ struct guc_doorbell_info {
>  	u32 reserved[14];
>  } __packed;
>  
> +/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
> +#define GUC_GGTT_TOP				0xFEE00000
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index ab96edb058d6..df5c58c63b74 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -11,6 +11,7 @@
>  #include <drm/i915_drm.h>
>  
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_guc_regs.h"

xe_ggtt component having to access xe_guc_regs doesn't the right movement to me.

what about moving that to xe_gt_regs?

>  #include "regs/xe_regs.h"
>  #include "xe_assert.h"
>  #include "xe_bo.h"
> @@ -26,9 +27,6 @@
>  #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
>  #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
>  
> -/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
> -#define GUC_GGTT_TOP	0xFEE00000
> -
>  static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  				   u16 pat_index)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 868208a39829..53a72769d3b4 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -32,8 +32,6 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> -/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
> -#define GUC_GGTT_TOP    0xFEE00000
>  static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>  			    struct xe_bo *bo)
>  {
> -- 
> 2.43.0
> 
