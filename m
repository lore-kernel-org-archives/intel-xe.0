Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD4FC369DC
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 16:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2415A10E60D;
	Mon, 28 Apr 2025 16:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhsg1JEu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FC910E60D
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 16:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745859387; x=1777395387;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VWhBg8KX5bNnMiftMeYR204DQPqr6cL5fykwHOnqgKY=;
 b=bhsg1JEu+gZ4R9yT5o8aBB/jNkdtdgB/EWpreCCmiJjpfmKK/ZKu7Fs7
 LoRTFqvJbOyVRoP9RMRvEEKgaxV7815M0OzShY5/vU3Scaq47xJBeRd/T
 t4VWAsW6oIkLI+lppQWF2tyV0zu/LFjwkJgyLo5Pu/N17QSTYvpRoJKp7
 imzj6SRNF8zMXJXgxo7e9ELGRg65LBR8/c3Gj6oCQqWVRjmnx8BU8zvRg
 Uolt/RzB8ngLF+smQeizB1FJYt7nA790Cw9IzmpVa0vk2n9y8KJ9JE8Wy
 /iT/UfKkKGMzlHogalSw7IAV/x6QDSaK1PA2QNppf3KNci/ld4kczl9UE w==;
X-CSE-ConnectionGUID: xgRhiWQNRPOZaZ7t+Rfkag==
X-CSE-MsgGUID: JnBDshYaQu+bu3gYlTi51g==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47372588"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="47372588"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 09:56:26 -0700
X-CSE-ConnectionGUID: Dg1mhSTpQsu3taxD9i0NPQ==
X-CSE-MsgGUID: nqVrs/QCQ0mWfLjw2U0Egw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="137617065"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 09:56:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 09:56:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 09:56:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 09:56:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q098tQgUqeoQ04ALOMI2bxCfFUgAsvS9lSiJXKgfzfr73M1ZHf5tJtgKktyC/ouTVbseuMbRpde1jhJrS/Lk16W4duhGEJfSxyFAserVosIonL+5ZQA1crWflShZb4o3/16Et2azCxm8Q5dTJ/poCEcMSUAg6Lfms1m7aL2Rs929Igf5wgqtMiTaoBlBu11aHXbzKFFtB1nF+OuBD1AM7lbzhL0pI4kq0Qb/WeRI9B/Vt7hm3QWjw9NgqfIj9jhvKzP42R59q9F7IGno6BxCDlLlu2brf4pbCMfpmPUg14O5+SfL7olX2i5nJLZP3pMOU4QyXMcAUk2vukRHzW5e6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qD45I6jg9NNI91MqltWpMgYPixFiLgMZ5i5AfxRUs7Q=;
 b=d1LgKY2UB1qHQ7pVrYqzU6GUGE0K7UNceAmktsjb91sTaZnsJ9PPzAeyI4YJSXGpEqtW3tKl32Yh7DMIt1iiAPv4phHZZLmGahC658KPHik146+vimteZfRuL8nJLYCsmtXkAUEcl618hkxw14WWgT7+SQTUmjRtB5TQG6PGkpbGCjJWOHUmRoaF1LMinV3OLIA89fJtg0gYPqMy9Egx3uwfI7lGYrJbn0+QarnX+cPeBNEXK2XlvZ7onW+5bN5XREiUV35X5RXvppibBKvUy7rErPAh8+xKUWIFOPsHHN3eFB9ErT6ZaUIO1CO2Fc8DRU9jtZEZ4VB3iHVzV3zoIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7652.namprd11.prod.outlook.com (2603:10b6:8:14e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 16:56:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 16:56:22 +0000
Date: Mon, 28 Apr 2025 09:57:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe: Fix xe_bo_evict build error
Message-ID: <aA+ziJyX7RqddKhE@lstrano-desk.jf.intel.com>
References: <20250428063956.1729460-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250428063956.1729460-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR04CA0342.namprd04.prod.outlook.com
 (2603:10b6:303:8a::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b6a0cd0-0c6e-4295-84bd-08dd86759a95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i4fJLY5zJ8GFYwtdsrq07q1cS/QtNenZcg3kTZlNNu5uSRytnVSNvz7brws8?=
 =?us-ascii?Q?gzmyhcHitSgnffqH4l3OG6JNPEciyvD/vBFfjf3WPly0kPoazwjInPhk2A+3?=
 =?us-ascii?Q?NMqOiAl1Cdnvt9/Qu46QPBrjI28Prf2UStOZB7ESKYeTgoTsc1t4JQ8zoTIx?=
 =?us-ascii?Q?FAoLgcWQk4N1Mz3nn93oQ7dfHp51pbjI8X/rmszSLenBFhBI0hBE9RL90DM0?=
 =?us-ascii?Q?16SP0JMtEtCME1oPhm1Vfqvz1asqUEwbavodAbpC2faQ2yxVOApNjMY9oLVs?=
 =?us-ascii?Q?/beDhyebqupxv71sMTHvPPJfe3XBQXHAlPumdWm7fRHQTPc4gTfiXem4wIxH?=
 =?us-ascii?Q?iODO1oU308vI4s7BmSM6EFrs493G5jhBszwp467ZxjHXM6vYgejNG7hQeeGn?=
 =?us-ascii?Q?kAqgy4PcubLK47y32mudhIbCpvwJyhB4P/dJYOTIkk859arrYJLnf7qPiRVD?=
 =?us-ascii?Q?ppOTPGQ+HdoK4bB67ZYfbMI9pD5y2OmuHjdmqOEWqFrT9vwqRVh7hl2HfKhv?=
 =?us-ascii?Q?qvoJFAnGGAiSm16QAxUQgQpXj4688avzeGsrjtT4fXe0biYJtQUBfIBh/wZd?=
 =?us-ascii?Q?B/9uRvE5PZGuLAgppjE21PBAGk04douUjsHzpMiFeh+ib9xEaSFSQLpOkAsQ?=
 =?us-ascii?Q?MRjt59bi8wGVk0s+yu2inHDFyp7CSKFuQ9F17eKZqVJ/CS5Y5R/IinjLQBbw?=
 =?us-ascii?Q?e2YDXPkXJEX3Ky4pPHg8Iw2ZbbNOsVYUlvnXFZ/AULsEPFtIW/sFvOl4N/Qq?=
 =?us-ascii?Q?7jUZyvhtX9q9NJixcDjI3/bN0CTYBGbukUPVNoF37GzivCak8/60ou3g0+6d?=
 =?us-ascii?Q?+n+R5IYKKJVTAHjTi2EVYRCMBxaMgciD7CL0+HZOJHfMUDjlH9SRmwHkwZZX?=
 =?us-ascii?Q?J1plj1Wl4aqMHV+VZZcbSu3QYcbF2Bn1X5B7AkLHFI1e4sWb5+qtwKmc83c7?=
 =?us-ascii?Q?8VrZfnR5BGnij7GyyarYtRtiRmCX0+su++kHS8Xc8+qV9KyVXJbU8Wkn+KWf?=
 =?us-ascii?Q?w6xP5QzIZrBAg8401Q4M01C0dXGaLLbzxGZyPpA8a0iF6W3MNLq70zH30xvu?=
 =?us-ascii?Q?mr8zpR/QyoVMA93g4mEV9aRwf9iEv7BVP1PjGZMV3gaUy7ttzZIOXSNosbR2?=
 =?us-ascii?Q?k3L5ogl08DHUK+G2QA7SPfTVRzlGQqolNnSgixTfNPgXeuJqCyNs7CiV0oWD?=
 =?us-ascii?Q?1yXd7HJ1noYC3arEkRD+pYef4A+WY7R7ViM2CpwsCAT+HrYBXmyJvRd/ku4l?=
 =?us-ascii?Q?xYfM2HDn9M3fEQTT8DNqd1mFPP42XCQnZ5YbdUkvc++tCUKx6dv3J871TSfa?=
 =?us-ascii?Q?un/iOA67IAf+u+xAyXrrLQaVukmMgdbceohek0RB/4uIQKk6b5MPBQB/RfIt?=
 =?us-ascii?Q?cSeOFkLeFKNs9XL4+wdIvENCXjoBb+DLCbBku5LOABts4EGPFu8wzcN/o+ep?=
 =?us-ascii?Q?5DYC7mlcyT8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P8ehUClECEpNKPoEJ3zUA74SIbVwIopJt7pE4Sa/MP/A/+DJ21dWzgMufMdO?=
 =?us-ascii?Q?xlt/2XdUYPc8lzzhIhhtnzKSSJyl+ATbWVNlRhIDmvUZXfIX05aODZO9ZdL1?=
 =?us-ascii?Q?Pp/OKiBcMyj7Y92z4G5BfWVcK9anYa7jnjEnRglJ3hz25OCFqct9oCgKCyBg?=
 =?us-ascii?Q?Sfs0c690fuj1y/oLKm8mpmR4RyyMoR6EEW/wrIQa6L/bDRpBlznIDDWoEAGz?=
 =?us-ascii?Q?E6cYJGaHXrF6qUV5rNv4xPB5OLES/KPM6A9icFvLJhKUcuY8vhKZWdrtwFDf?=
 =?us-ascii?Q?TynQ5Koc5vKv/0ysp9d68BPsKGmYrK4/NXa4V7fMzottOM/15hxiHFPm8kGe?=
 =?us-ascii?Q?gb3D1f07Bm7zpHU5dMbE6eQnKFrcMg4EKsLyEeewY54P+6VVNb6ad3ZlaDQk?=
 =?us-ascii?Q?PweAgySebJtk6QM381coe75w3cZb2EW1NE2YX0QxYYXXsFv1MZL+tipozq50?=
 =?us-ascii?Q?AwTplkCu/z4OmNWjUt9h2FYNzmukXJeBD0rQYeSdXhmyjfKpBCxTOF/15OFN?=
 =?us-ascii?Q?HhivZcYwt7E6DRv1lCk01mzwqQ1Zd+V9/Ynmd0ntj+yCN120N2dJtZ3zuO95?=
 =?us-ascii?Q?1V8gA2CAFou8oxwVvDazqbn4JxBwbN2xg7PmSBs+FYhkBkJ3ThnT5W07c5B9?=
 =?us-ascii?Q?BBe8wXq9OcCk53ctsoSsrpT8g/HMKOcWl2LL3MzuQHN8SlmOUxSQcfkfdpuh?=
 =?us-ascii?Q?UnFVzQAXjd6OYMPyPl0qyc45uM3of9tRlHGogX44S1zGKVAMCWwsH46QgBbt?=
 =?us-ascii?Q?0hlEmOVCVjABspotNfWupjkCLxplF5gCy0TeqkjZQ4IaAF389xkwCKpBBv+h?=
 =?us-ascii?Q?sAFekt9QN3Swb/tOHkybzKrOBvCJ2a8pgeV7ZaevuqPoZu3IBtmIJ+JtZ/23?=
 =?us-ascii?Q?QK3CIq59HVZ0rOPUIQw036rt8slu1oWQLPwJJZu6jM8KjhgXIso8IUqw4Kjt?=
 =?us-ascii?Q?Zaeq7O/xmjUV21XpR1iOiGURQp4xSID7xFHuJX3uRbPWa3VdG2jF6eOxZhZK?=
 =?us-ascii?Q?ru6ph535ggoCuFGUL/7bcN/LI0RmMPpmnZ/B/2iogFEPJvVg+xZbdyjzOw2P?=
 =?us-ascii?Q?0sSf8DH34zlgTkDqYzMbPtqSCvFkHgfZr2ELE1bDHAduMJbEzovK79MJUF6O?=
 =?us-ascii?Q?6r0qW+wwYXVLmtlJbtwJ47DuXgjZzU8kiaZRxtuALamF8xrfKAMJUMJM+BVr?=
 =?us-ascii?Q?jKSfDkSOWJHjM+1mrzbAm3nDiKPHwsOVao8FI3GCrSwLS45CHWBvykJiuvWn?=
 =?us-ascii?Q?lSytpDkzsZRHKsUD01LPLkyJCCkMy6WKt3F2lYgwLzHMGaPvmgq8u0r//2Cq?=
 =?us-ascii?Q?blw9TuPQbAeY/v664Q+hujXZu7n1fgfNDs2LDgUGlUfKundXoLL4ioL+lyQH?=
 =?us-ascii?Q?kplljoJHDzFhIBFst/QWWZC534ojMFrmDhz81bU7s9MC9U91JjIL3B5KDbsJ?=
 =?us-ascii?Q?xLJQRyHRlTvlZB7sCNJOl0tDKv6XAkMu0F+4628x5SA3HzXxCW3DPSMMLfmb?=
 =?us-ascii?Q?U2VwxM5fSV9cPMJREAruWpnW5sgwpn+x17rfJja0iXN58YoeLQg+VtabGCMF?=
 =?us-ascii?Q?C5RvVMUw7/hkzWBSE5z6aRH5br6xFUbafovyrwGrILiKpoMOosJw6fgQ1+HW?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6a0cd0-0c6e-4295-84bd-08dd86759a95
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 16:56:22.0593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKXx6lkEfyNfM93fqf7HJb82hsflf8j/uhfaV9k1zfw4JTBgmdjT4igY/h342KXnPAgVs34rhidUHdhNLgb7Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7652
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

On Mon, Apr 28, 2025 at 12:09:56PM +0530, Tejas Upadhyay wrote:
> Fix declarations and usage of xe_bo_evict with force_alloc
> to avoid build error.
> 

drm-tip appears to have this. What branch are you builing on? I could
drm-xe-next perhaps being broken and needing a backport from whatever
branch the original patch by Dave was merged through.

Matt 

> Fixes: 84a11c519234 ("drm/xe: Drop force_alloc from xe_bo_evict in selftests")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c      | 4 +---
>  drivers/gpu/drm/xe/xe_bo.h      | 2 +-
>  drivers/gpu/drm/xe/xe_dma_buf.c | 2 +-
>  3 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 897caa145663..3a84a9d92c48 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2930,19 +2930,17 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
>  /**
>   * xe_bo_evict - Evict an object to evict placement
>   * @bo: The buffer object to migrate.
> - * @force_alloc: Set force_alloc in ttm_operation_ctx
>   *
>   * On successful completion, the object memory will be moved to evict
>   * placement. This function blocks until the object has been fully moved.
>   *
>   * Return: 0 on success. Negative error code on failure.
>   */
> -int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
> +int xe_bo_evict(struct xe_bo *bo)
>  {
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = false,
>  		.no_wait_gpu = false,
> -		.force_alloc = force_alloc,
>  		.gfp_retry_mayfail = true,
>  	};
>  	struct ttm_placement placement;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 8bc449c78cc7..02ada1fb8a23 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -274,7 +274,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res);
>  bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
>  
>  int xe_bo_migrate(struct xe_bo *bo, u32 mem_type);
> -int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
> +int xe_bo_evict(struct xe_bo *bo);
>  
>  int xe_bo_evict_pinned(struct xe_bo *bo);
>  int xe_bo_notifier_prepare_pinned(struct xe_bo *bo);
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index f7a20264ea33..346f857f3837 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -233,7 +233,7 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
>  	struct drm_gem_object *obj = attach->importer_priv;
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
>  
> -	XE_WARN_ON(xe_bo_evict(bo, false));
> +	XE_WARN_ON(xe_bo_evict(bo));
>  }
>  
>  static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
> -- 
> 2.34.1
> 
