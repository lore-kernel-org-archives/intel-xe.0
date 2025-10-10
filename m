Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1D1CCA476
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 16:28:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A35510EC55;
	Fri, 10 Oct 2025 16:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAFvVRdC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AA910EC55
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760113702; x=1791649702;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cv6fnbY7Bl7VtCrHmIafKI5dKetLd2lvjaVBuCOB6B4=;
 b=hAFvVRdCMWTpSF5mMC+Xwv6JlOGqsnte2JD/Sya3jQFjzW1nfsetH/Xl
 fHMMki74CkUyxwb6aLDrBfviur3Ik6v0jl/HMX9579oQHrvFWcBzu3jsz
 PjJDFzSLFyLYcHpSgYcG+53rY6e782C2zO6BJQ2inN56OLlVJDZlMKFC4
 HZ+vCZHQ2FZf/4Sgwy3c7th8OaOlqDMpVVGu5fZKHRyjeEsHwLUaD1LKD
 I0qjxJg+ge1vjKzLKba9d+9ucKeGG2ASsyucIpFRY4OOE/oSsR6Er/5E0
 Tzj284u3Yxv2zPN5ZHLbWkwcw66BHb7ediW+hGVd+5BNaeJMOIJpvVJyh g==;
X-CSE-ConnectionGUID: oF2HpACMRburLoDtaJ3h0g==
X-CSE-MsgGUID: e0olaaGKSmKwmD21/GuJ/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62254520"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62254520"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 09:28:21 -0700
X-CSE-ConnectionGUID: mUwNodK5QAyNzSdthvlDZQ==
X-CSE-MsgGUID: 5AQgV5EhQECESOWVpXIvJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="181443200"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 09:28:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 09:28:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 09:28:20 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 09:28:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXscNUp8v/VVvb/bXB6Y71lDOkaq/Q/vqDee8C/cTFIOK5gUjQjLUFn8HrIsgVbTpOyL38Sp+2gMMQqYRA4EUjTnnAAVnz+HYMFYWzXrOqIShelWXnAmutALGVRPIjmgYn8NYkGaOcn7wYs/One+qc1rRXCsFarul4R7SLSrC80724NClHMSdnX30kv/eDe6QGr8DrYAQncCimq+JUZ9felzfUQWNiuwI7+kGaGphUN81zuRFZswoo+bJVFQ9a8qrAGCiuZ/oQiSkaRoeS/eMJ8ZZaeu/gUzeQeD/SAcwW0FYYuhdIz53n9NRB+jRUzAY1a33wnMSgta/YN72Y4sNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1+O+zB04ORqqGqaOMRWsM3miioUXoTRTdnzf5D0oV0=;
 b=QG9YvKdQlUml9RwzS5hDOM6ld0gdUOvImAGk/Hs4YK5PPvYbNPx3BODt10pfy0ZIRm/LPBXGWP4Bgi9XlzPc7LF7ptNTGBvQZkFDIp0Qe/ki03ms4L3px3VJWfQQ6Vq/RVWJFhN0M6EGCeNLhTV/uPQXIe9jFsNjxvCX2JafeF/GfLvW59/VSo+0Qjd8RTI67Aml3FlVms4LljLtG6hYWYV6of+frdqciHMwS1WaeWrUbwJ3REPShuWk1MxkMy9MO2xOilpUajhxuHZPoJ7VH3FFaanH7P3+Q5mC2mHDtI1YJRPi1DqD9wnu3DdA8GCCZ6BjJiW1ln5HIPvE4jlJjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6665.namprd11.prod.outlook.com (2603:10b6:303:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 16:28:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Fri, 10 Oct 2025
 16:28:17 +0000
Date: Fri, 10 Oct 2025 09:28:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/migrate: don't misalign current bytes
Message-ID: <aOk0Hn18a1aVsnj1@lstrano-desk.jf.intel.com>
References: <20251010162020.190962-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251010162020.190962-2-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0282.namprd04.prod.outlook.com
 (2603:10b6:303:89::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d648ca5-3852-42bf-df8f-08de081a0455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qWiiMLkeXAjsM2d6wSdve0HKZ2/RMJUBg/Rzh75iHJZ4jQ1jUrtd2i97L9Kp?=
 =?us-ascii?Q?T3ITqwxb5MlnI/5ZvsSg3vyLBbm5rIQPnMkMh9uBGJxLqkBHbweNDBq2Uver?=
 =?us-ascii?Q?ttYnyDerz2aQCmlddcjMki4ugofhkoI4b9uJJbHtKkPNxj0q8+19rnjuEhvG?=
 =?us-ascii?Q?8lRE+YzScCKDYNcf6LiCD8xmuH4XLli+02msv276EEiuF/9eOBo2R0SsMIFi?=
 =?us-ascii?Q?h+fYp/QzmuuxbmO0mXP0/hgWzGgqpYsUQa9p1eTDKrWAQMZR2+VE4OtYqP0A?=
 =?us-ascii?Q?be7jNc3ekpUUrckcdYr6+cR73YrNjIO7ws8qfMfcprfXtAwr4fTPg+Hu3vL1?=
 =?us-ascii?Q?R99i2GbLNFD4F1YmrYircwSxsoxLstltPHNU7UaZzV6izsyjW1LrgLfc98PO?=
 =?us-ascii?Q?IeWDoPxf9zxf0OT/ccijYO9xd8ZMITmOoWqQ8CcbiUrTn105PIOe+evh+xwN?=
 =?us-ascii?Q?N/1WEX/ypr0KrObmNUUFtSN6XHMWf11WydHsxMtP7/HxZpvRNsx1atFuQh+D?=
 =?us-ascii?Q?vsJyicOVfljACXZPOQ499upveYSB7ibc5C9CSKgXDcBXCrEvkzQ3mXeGt85B?=
 =?us-ascii?Q?T8hNv1ssElgRcto95V9n+0FTEylAXViCgc1U89oiKwa0yBD1MC9agWiClxN3?=
 =?us-ascii?Q?B34QRL8jYN9L4G335WOc4NXc4t/BkSQGTvk7v9zr86MXkQsqI+whU87AhUq4?=
 =?us-ascii?Q?HN4TnGq5oVtpCGkYgaf6TAS9PDW9lum8LsYCeCBI9Qi222qyBHLJ7pIlTBS5?=
 =?us-ascii?Q?ucnYUoontuGUCIYA7YtRHB/VIkEB0plynkAsB/AtfQ25N/DPZCit7KobvsXL?=
 =?us-ascii?Q?I/Yw8AXmAhD5DHCUjS/iKB6y34XOrSF6yflbPldVdNmPfTNoWsT1PR3jl1hu?=
 =?us-ascii?Q?TSq6DkJlWPVs9ATk/jNgP02Jp4+GFhDgI1XPXJh+D1lZqNgH9j8Oz2ry2Jpp?=
 =?us-ascii?Q?GTUjiLeoUAFznvTK4s49DpPd51sFNti8fb1rf8CK5++pupoUZgBxRaXvGeC1?=
 =?us-ascii?Q?n2EeMgHwscGPYHVtWjZjF4KGQ7KlIT6JH411jFVmJwnsAONd9dLxC5wZJ1kj?=
 =?us-ascii?Q?7Ma92CZm5y3f+vbNlnDLVtX4i71yf4KFa9/tEOuQKkH6DagX2BrbPGOSIGmH?=
 =?us-ascii?Q?i0IbNsHQrDntYtKfRHQsZ+CJVxD8U95SIgrGuZU4OFAk/9TgCEKv5vHLyEHu?=
 =?us-ascii?Q?Wsy7uMBxTYE5/pVr4TwOr6NtClSA+34Zv8BR6XA5X79l4yF2Y/ZSY1Ptt/MT?=
 =?us-ascii?Q?lODmUnpOxhRIov71U2nzYhqHrjeSezYphQtQlMBQQ+qFmVC9MDuBld50Qcn5?=
 =?us-ascii?Q?YVebYCz+SdoseybS0VEVRkvMdI0SA5w8DQ/RZd89QGduZ6GTdXijH43hvDgH?=
 =?us-ascii?Q?9ms12X1z1kg+wn7NllvHXEp/539jjKoWl6vW/GQBOA0yDSKZGg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KBdfAWUhQ/IZKfsdMV1zEcGPDCqiy470hLeDo5ovAPSCdoy42pq96duQ73v7?=
 =?us-ascii?Q?hC1DaTHiskyBSSRz6WEQRK2x3LNlYOHRqVYmyTmwivBMsoT47YT0KwqEvmiv?=
 =?us-ascii?Q?yePxrOd4/QxdFpkMKb2nDNRprBEPCyvxVI3c3wwuw+WKANz6vm8zbolu7P/2?=
 =?us-ascii?Q?YitdJqleuZHofEJJQgLSuwL51huM7cfpzze0e6VgCFDvJsiFD3NNcyspssCM?=
 =?us-ascii?Q?eGWPUriBds5Asnb0sgU38igmhr9FTxTpgtstujcppfvWzvjk8hCSNhr9kRgi?=
 =?us-ascii?Q?pHPc+k1MkUHJM76k6Wnhu9FLgMYKcRlJBhDvVDyxpSJtXcg5NGroTtPjfwW6?=
 =?us-ascii?Q?XZdgHk6zpo3muI3E8mytmWYVKxA5YUcjk5AcpT8xtxKxdbcd9n14hM6sYR9N?=
 =?us-ascii?Q?tI1yYKG4n4HlatK0BZGQpBFKfGlqWv7voT34Is91S1ZEwSf4COEEjXgQhfWd?=
 =?us-ascii?Q?0ZUzYRvHDHsjnwxYKj8ni4VAosHmhZ+9iL/ZOYNMkwTZoHT34R69IG4NcM3i?=
 =?us-ascii?Q?H1fsbLmWUoW+YJlOJc6Bbr4zNpeMXvp4guF/HNUlLvThAprIxVv61TaZzdcr?=
 =?us-ascii?Q?4z5EF3TaSG1sMZbw3QY8rhXuUOm12wwEMPPcq+yg1SN8UAfHfha2qcrF+k+b?=
 =?us-ascii?Q?LoUeEBExLWGhKwTnBphUkhhkNXM5UQ2Vfq55aHcwjln3tGPr3gVEOXuqXpHy?=
 =?us-ascii?Q?7567NPchF2nsb2JnI65NAaPtVYC18AaH0IgpI/pNjbJ4XNCeZgLyx3IBrLTJ?=
 =?us-ascii?Q?aXMeDU+hbRx/gs6JNtDovqzcz9NCajD2oFs7EEkgsUdAfY+sEh10Oi9V1rPQ?=
 =?us-ascii?Q?R7MNXOpwdM5r62f16mVBOC52WcVJs1W3kPUaNs2U24m+zX79/8PZOb1BmSNG?=
 =?us-ascii?Q?uyrJBz3GiOzSR/PsXVNSmoFv+gl/Ni3TQHRh6b3eW0cwYaUp/L/kcOISVOpH?=
 =?us-ascii?Q?frwiU1J6cQT4xKUTirW3ox7XvgXhBFT5LOYeQjcS7wbkRDtv82Nk4v1Btgip?=
 =?us-ascii?Q?fDQD4w/Qr3+GL3pIlGGME9d92wlkPXCuwzt69Ljw889A8D7I/Z9OfOWG6v86?=
 =?us-ascii?Q?fCj715YfP6z9PNIt5pHcFE5iHkpM800243cPHhHZJoxrMJF/7McHY+XCFCD0?=
 =?us-ascii?Q?D8E0MslD38Mf1SXZAtw1gkW4zTveASn5JAjfNHVNcYJt/TSfwD7iIHNDYrTl?=
 =?us-ascii?Q?yrn/yfJd6yN3M7oLZ6ObjXMyWbT5U7OBjHD+UNoxGyKSXjBdkzH6h2Ite5ge?=
 =?us-ascii?Q?m5IfEg2uxNDUviwqo+ohLMXdnpYDHeG/eVbz6k1d3yPXwuk4B4f1zWdtmiPd?=
 =?us-ascii?Q?3+w4c9jG3MxlvFqzeju6YLxeKFboWonrBit2Oj4rLRmFsFtku5lEZkyKGamE?=
 =?us-ascii?Q?vBnAvgzScFwLqMVv7XVd2qiGNWY+8NvMcBqD9P6COmgpwxjtpCYGw3tjq1aN?=
 =?us-ascii?Q?T50ApnRP99xHXcFa4fjzB659sgz2A4MNPnoqcs0NxWNR7N85CflnxowtKvmg?=
 =?us-ascii?Q?7Nl+1V0EMEudZJ5Py4om7+T5LovnWGFSKQ/a2lK7EyuEN2Stx+QjRHgUNMs0?=
 =?us-ascii?Q?sPU0BiQBmWXo+DJNOQ850Y9LOYVPHvscBL46XQE5TY+VgvU/UOny/ur6EQNz?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d648ca5-3852-42bf-df8f-08de081a0455
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 16:28:17.0418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zg79SOFItPxgluIQ7/AWO+pz2W7VgDQeI2FtngH7DQ9svLfIyV48jhIZ6760Y0lakNAZ+JVdhwucxxqd7ay5OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6665
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

On Fri, Oct 10, 2025 at 05:20:21PM +0100, Matthew Auld wrote:
> If current bytes exceeds the max copy size, ensure the clamped size
> still accounts for the XE_CACHELINE_BYTES alignment, otherwise we
> trigger the assert in xe_migrate_vram with the size now being out of
> alignment.
> 
> Fixes: 8c2d61e0e916 ("drm/xe/migrate: don't overflow max copy size")
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6212
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 7345a5b65169..7fbd346d8310 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -2125,7 +2125,9 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  		if (current_bytes & ~PAGE_MASK) {
>  			int pitch = 4;
>  
> -			current_bytes = min_t(int, current_bytes, S16_MAX * pitch);
> +			current_bytes = min_t(int, current_bytes,
> +					      round_down(S16_MAX * pitch,
> +							 XE_CACHELINE_BYTES));
>  		}
>  
>  		__fence = xe_migrate_vram(m, current_bytes,
> -- 
> 2.51.0
> 
