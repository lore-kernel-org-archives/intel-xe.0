Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B37BD0BB41
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 22:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E51D10E240;
	Wed, 23 Oct 2024 22:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SsJAiEh1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDCD10E240
 for <Intel-Xe@lists.freedesktop.org>; Wed, 23 Oct 2024 22:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729721968; x=1761257968;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7TjpN+lsqsimMK013Ulbah01l6twtkIhGCBeecTDRr4=;
 b=SsJAiEh1nbdHf7ublIVM4z4YxSMIGKDnLo2x1heplQAARq8YV/h6YqJL
 JO1V3QQB/43+YPHi7lgBG50TBgpXP1U/UP04qiOp5wBb9f3LqyX1X28P1
 HZ2IUPzV8IdM+LL2jxnkSTx55KmjuGFBte1sbnN5pCgrDZENdALNMSnKH
 +GNqG3mWw/faCz5VAlGlk/GtPwfmhiabcZc0z9RhCYVV747QwdlNMko1E
 Rvkl3EbR34nVvy5EIT2pK6e1BhcjSwmXCaJFhOfj6P6G7msd20jypl+Tj
 vrPHnnD+2m+eRKlc+mZFBYlroCn1BFslbzNSpGsHPOY0z55ys0NaRVPsx A==;
X-CSE-ConnectionGUID: Be4pkNFJQ6q6pSezsEKhbA==
X-CSE-MsgGUID: oxmSfHmXSAeuTIuG9bsbVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="16960519"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="16960519"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 15:19:27 -0700
X-CSE-ConnectionGUID: KBal3JeRRLKsROyMknMYQg==
X-CSE-MsgGUID: 1FxN31ySSKKtlBHBVQTOww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="84963123"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 15:19:27 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 15:19:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 15:19:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 15:19:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sscMcXG6MgTqAduYQI8oM9bbiblt3IKuuTG+542mly2eEjxdZgSkUF4u+RBNnGby4L0wvz/zvGWpd0gNW8/UPBDypErvf73BLy1TO7Zu1ASZ/gWuFd7lEUo2sAXpOHyAyA8juj9mRSwi3WUnBWT+ppzcpcKziafQ9ZLXF2+/VwjNReNZqwWMefxhjr+uy2lN0uksK42+d18crQXLFrVSBsK6dP73e+weo0cQYJJtW6lzufEsvrWjEbWNXKYCq7AuEXhzXDWfZqWFPpiquwRAgZ5gztyOOegt39TwcOVCGjS9QdHXW/2yfJxGqm47IPXQKVLG3TrXe5yqhEMRUXXwVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjbooREKIUCo6ytd0Hi9YWlymTrE52ygs3nj9Or05+I=;
 b=EVKNy2hCzhblLHw6qt5r9AuSJ5LRZ2M4msNioCG456bMYLOxbs+xkksbu1WEC7ak76s0KW80I9OnPZvquUuE8kC7J30sqOigzFSreOFePpzpNhv8tW6SUtrK86kVHM/pSltOuwPR9p19kIz/YRhy7dNhJQBcFvDG1XxE+VV8Hr8KTJDaJqko10ikXCWNokI+3dQ/uCTkfocoe0x4G+bV70Q2WhToa5L1kQcr1vCpsX8RmU3a9qVWFS8066ryDg9U4zUdGvWSAAIom2JeUXP9aJWhMBiTEFj7XglZsl1Zu2vxRWor4LGEHhKHO31LeINaXHmBiZK+hb75nm8N4eh/SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB6547.namprd11.prod.outlook.com (2603:10b6:510:211::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 22:19:18 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 22:19:18 +0000
Date: Wed, 23 Oct 2024 22:18:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/guc: Capture all available bits of GuC
 timestamp
Message-ID: <Zxl2UTYB54JB1A2i@DUT025-TGLU.fm.intel.com>
References: <20241023001736.1766523-1-John.C.Harrison@Intel.com>
 <20241023001736.1766523-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241023001736.1766523-2-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BYAPR06CA0069.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::46) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: baee8eef-4d80-4c78-9870-08dcf3b0bc8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1jZlU9CWjGSHGM0ANTfYMRL2s/d/ckw50z9+doAQHp7iGshq1HQztPRpkOIG?=
 =?us-ascii?Q?avhbBpsNCev9Rkl8ubaWQcaxDeSWvwlizzZAKo6wS3IW3/5ALstT93epy+Iq?=
 =?us-ascii?Q?aSwIvXSwk2+mZhXppJbiFbcCg1sOQAeQ6tS4v8wMmy7ZWfeUz0V/kSOZppvq?=
 =?us-ascii?Q?9FFUZCwcBoyF94iuPvDRPeWoobm0sPhOnee0CePUfIOMH/3RB6sk09SiEOSj?=
 =?us-ascii?Q?/xuHr8xjvYd7Z0rZoy1HTN4T9VKIO/4sZXmQAHGAv/fSiv6A9I3ki6E7/SVh?=
 =?us-ascii?Q?I0+upSY1NAj4ZaokSlXz0ZoTnNQrU1lvnl5BrWZpsIyesSdHk+kUcR+z+L+o?=
 =?us-ascii?Q?YyYhruTINkFl2tWj2zeo9TzyGhV1CbC25aXGJPUjrZ/yUHcHLYlAuTxv+2U5?=
 =?us-ascii?Q?UhDW0FIqmt9OX6yKlMtrpDvHkzGMwNTOJilOsw2jHsbhQCkTGDVixACMo1Wy?=
 =?us-ascii?Q?FGhnn/z4ERaPW0+3+TUURW2AEor1LSvLtW+UO6kcrX+XIrIfLn+X6KTMTSsn?=
 =?us-ascii?Q?FJoiPTl9mxlr+SeM8kkOLBzW7MMdYruZzVBYmxcHJkRYIyp8pqqbgXVDo8ss?=
 =?us-ascii?Q?yf8ANKY1feluLsPKOeL81tUvxuyZQKeLr4XHM/2VDZe1iMcZ4eBKKDiaH2FZ?=
 =?us-ascii?Q?Ul7oB2ftZgWOJrT/7pcSSxoCrCJ3Tg+/Z1XdfXaWwTEk1hrM4rxV/vzAsT7A?=
 =?us-ascii?Q?bSZL2aEaRrue7cgMU1KQajP11ZVp2QwisdvA2us9ZtB0auQh0k1YYphbjWFP?=
 =?us-ascii?Q?z+LajSC2aXbn+ZaT/fPoveIhWVGW2NPqIW9g/g1Tw7RUbqAt1R6ldbFrRNlV?=
 =?us-ascii?Q?FO10ll/7NKqNCxzXwm2cyfYJB1owmL/Rr8shjiUD49BFxneAA/VmTlUeNYNf?=
 =?us-ascii?Q?+xdBx5fG+PMWkwoncOQOwhwqKejeeg5NN2PgmoTxA7UEqyTdhlDuwMXvRJJd?=
 =?us-ascii?Q?wVEyMCdUTu8TyNLtF+/WpFGFcTqR/Tg7Ldvj/Ube9tDxlpLsy30OFVMGGVOP?=
 =?us-ascii?Q?4ozvzvlNCPoYXGl/shWpsn+QXPuj5oKk3ob15I5E5N10oGYvK7XzUU70IAct?=
 =?us-ascii?Q?LBtMyMOwQHcILBzGk1p7tJAbphrrqVDrXymE3pnGLQrKZr1xftpHpUv/Vq+8?=
 =?us-ascii?Q?GhDki7TxisQty/o7fySl2i0EejTaHzaW10+wR7vTWQyPHrcw1tV5/PAG0eZe?=
 =?us-ascii?Q?1tcLq8hWymTZtIRNiRIez+LpyGSS2l3tP0zdhI7bPUUxlx3MSlTSY2q81/vI?=
 =?us-ascii?Q?FoObv1xfb2Y7jyLkrD1SngdEyyUZm8qbjdPcfCKXtYWZQBcG31oFX2mlMx6e?=
 =?us-ascii?Q?vFCTY/DwdM7PbwZTlvX/KeA/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QEGcA1jatRrVQmdLo9XCaCkBP12w7JzQeEYBEmsmUT0vVWgYK6nL/Eajt6Bl?=
 =?us-ascii?Q?ucuSvqP+HsWDWlmApdsyLr2b6jNZeotqRRUdWKNqcO9ss0ctITsG3AQXYfab?=
 =?us-ascii?Q?BVPdBCfeCKCY6lzZ2Im++wXC8jzG4Lm/t7nOyUs9KzxBtNCZbRWDOGhr5aPi?=
 =?us-ascii?Q?UetgzXRM/O20X9aZ6VqbSaw0s7g3joog4GUknzY+rLWvTxE8ZfBu5vsEB/ds?=
 =?us-ascii?Q?OBoSE7dMaqQKyjp+oy0xtiubp8wtk2uQnIAyk/L9ageANpuCHC4GDlanmwax?=
 =?us-ascii?Q?vCKUot8V01TegeYHP4ZIuTaTYXle5F0kAzPgq+IibG0pL+nBgCNHzG97Vshx?=
 =?us-ascii?Q?eSuRPY1JH1BvQzJwKhk0Ugrh0IH79UYIumgrnO5w0E/UuRhEPGOZQXH9P9aU?=
 =?us-ascii?Q?MFYXp34AV20YqdoBnJ8ko3IdhuEnj6Vt0Xrp09kiF5qFtxMpCYrb0kbtLdR8?=
 =?us-ascii?Q?OXDdBBlJ7/ccuhCEanXERxjwn892bEFKG06ip/a5X98JqZSGQ4OwS7o+d5Sg?=
 =?us-ascii?Q?3Ny6av6td02bJ0cFMlpFZ8C6WW0HfHJ6kiSvTRLtehONmg7c6KrRiRRXDKdZ?=
 =?us-ascii?Q?wwMIJWy1JoRebtH3hzuTlyaboQugq2dQHAMAvIeMnC5TtfqzZblvKwWx8udW?=
 =?us-ascii?Q?e/21wIyriT1H3t/2IkQloJGLiadyWYtRuokoBCe+UjlJurM6z3badZuGFBS9?=
 =?us-ascii?Q?j7uJhLczl92LiEBVJeHLxraeJ9NRNw7QjQIEV2GgaGIbGMnRwfPo7X/8jMys?=
 =?us-ascii?Q?totZqfPabEIo89cNQEqHPjS5H2GQbA+KFoyVu7xZsMJ2JiKL8OQBHyYIU4IR?=
 =?us-ascii?Q?Nx04ceOn4JopgZL5OroD+V+II0qrheSeMPiaW+20imZoV6fj2wBZkrmDy67x?=
 =?us-ascii?Q?Twl/CRcFu66fCQBNvC8flVR40IjbMO+fXQovVZ8sTckhLEP0Txtdk6iXAZYN?=
 =?us-ascii?Q?IxLEnKH9OYtJ/KyXSd0WFDTqvCRljb4nF77l1qVEGeXQo6N9RFP1fRa8kWzH?=
 =?us-ascii?Q?d9UT6YGODid1sOnHnaxHD6a3HYFzGTHCBzBsFBF1JAztVRsDWilp78f/onA/?=
 =?us-ascii?Q?B4RRyQrwfRmAW4zRT05o4pYDlDbAXkhXRQul7bmrL7/tqlzWM6pcHDymKixj?=
 =?us-ascii?Q?7EZ+I5fndpSAIwPvxlnJ5fO3HPQZYdxQB+Ul4j3mkhrp2YpyJLCtshUE+OG2?=
 =?us-ascii?Q?CO58yRO6/RDhB2p4rOO/wfvcFJ9ky/GLZY14TskwXT4W44rmSrokuc9jGqgd?=
 =?us-ascii?Q?s8Ow9MYPf7n+9bEeT4RYXSo661AykzNXq5nloY7zXd+qISniqAu8HUzxTdbc?=
 =?us-ascii?Q?aoznTBHhpM95nOAVmGY4dVADMapED6Vgrhv6dKL0Kn1XAgSv7/KArTbb7ciJ?=
 =?us-ascii?Q?gow5Gej2ITRBfkLzlakCjoIy22gFxS1itskCSE5VvO9P/wR7YPcxvNEKQO1f?=
 =?us-ascii?Q?VhDHbu8mPR2mAHI+UvxsMUwViMV5BMdlKFbCN2JTSkj5GRcXf9hKTLQIklvP?=
 =?us-ascii?Q?XOxHSggzBBG6wMwvz77etSg4Z8JKqnVhrfg+SMcsoJPTLrFLqIoR6gW4tL51?=
 =?us-ascii?Q?J9UXG8FOgzQrGnDT4jOgfkQK7rkcG+cglJDvZwsGWWinbVYLmuDhultpvy9V?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: baee8eef-4d80-4c78-9870-08dcf3b0bc8f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 22:19:18.6796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qosvyGZf0yuR5XYmbHCfjM+PtLJdlglKFeRiwuGyFMSFtlsyg2YTv9aC4v12jaHO6k7XpcocarnouLfYOvSJqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6547
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

On Tue, Oct 22, 2024 at 05:17:34PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The extra bits are not hugely useful because the GuC log only uses
> 32bit time stamps. But they exist so might as well provide them.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h | 3 ++-
>  drivers/gpu/drm/xe/xe_guc_log.c       | 6 +++---
>  drivers/gpu/drm/xe/xe_guc_log_types.h | 2 +-
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index b27b73680c12..2118f7dec287 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -84,7 +84,8 @@
>  #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
>  #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
>  #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
> -#define GUC_PMTIMESTAMP				XE_REG(0xc3e8)
> +#define GUC_PMTIMESTAMP_LO			XE_REG(0xc3e8)
> +#define GUC_PMTIMESTAMP_HI			XE_REG(0xc3ec)
>  
>  #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
>  #define   GUC_SEND_TRIGGER			REG_BIT(0)
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index fead96216243..df4cfb698cdb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -171,9 +171,9 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
>  
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	if (!fw_ref) {
> -		snapshot->stamp = ~0;
> +		snapshot->stamp = ~0ULL;
>  	} else {
> -		snapshot->stamp = xe_mmio_read32(&gt->mmio, GUC_PMTIMESTAMP);
> +		snapshot->stamp = xe_mmio_read64_2x32(&gt->mmio, GUC_PMTIMESTAMP_LO);
>  		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	}
>  	snapshot->ktime = ktime_get_boottime_ns();
> @@ -205,7 +205,7 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>  		   snapshot->ver_found.major, snapshot->ver_found.minor, snapshot->ver_found.patch,
>  		   snapshot->ver_want.major, snapshot->ver_want.minor, snapshot->ver_want.patch);
>  	drm_printf(p, "Kernel timestamp: 0x%08llX [%llu]\n", snapshot->ktime, snapshot->ktime);
> -	drm_printf(p, "GuC timestamp: 0x%08X [%u]\n", snapshot->stamp, snapshot->stamp);
> +	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
>  	drm_printf(p, "Log level: %u\n", snapshot->level);
>  
>  	remain = snapshot->size;
> diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
> index 4d57f8322efc..b3d5c72ac752 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
> @@ -27,7 +27,7 @@ struct xe_guc_log_snapshot {
>  	/** @ktime: Kernel time the snapshot was taken */
>  	u64 ktime;
>  	/** @stamp: GuC timestamp at which the snapshot was taken */
> -	u32 stamp;
> +	u64 stamp;
>  	/** @level: GuC log verbosity level */
>  	u32 level;
>  	/** @ver_found: GuC firmware version */
> -- 
> 2.47.0
> 
