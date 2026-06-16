Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEE3CD98D2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 22:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD59E10E248;
	Tue, 16 Jun 2026 22:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hhiNLwnG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145E010ED54
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 22:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781647780; x=1813183780;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+1jCNXzV+noqt+u8C4f0xdjm+nO5WpA/ioRkcc01Oak=;
 b=hhiNLwnGC7ytdKyUOdtMdOvggAF6DpDaY28VzW9eibH72I6RIbGDQQ2P
 neYvB46EycTOz2Pa4jMI0QvRDEHYzeHr2oN/osZjsaWIooPo7V8x/gmPs
 edrvGZ/f/3Tj+KWpTvI0XKjoc1u4yWu8l7ZDgY3jfX5KPWyUnKDLh+gSl
 /ZcS1pvOzKXtWCg+IOzFw6nSrE66AQqHvJr+oMwn1JW3BxeAHwucv6KZG
 21GK8yLW127TcpXVWCYUZ6cz1DU/HCDVSBHhCj62uTDYOmF3AH4B/gn6z
 QxQVBHmXuFVKNifbPn8WVsTpOndIgy7EgG8QDbL+i2OLDcf4znAk04DAw Q==;
X-CSE-ConnectionGUID: OsshAWiiRLaB4elJRSbSAQ==
X-CSE-MsgGUID: x/YIVGdFRvyYB+WX4p2qqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82629028"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82629028"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 15:09:39 -0700
X-CSE-ConnectionGUID: feUVIQFQQfuSBOihRi/xsw==
X-CSE-MsgGUID: BWn9cw4mSM+lHZF5VR1+vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247007216"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 15:09:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 15:09:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 15:09:38 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 15:09:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdLW81gimX3ByThIt2KCZa9mkqphPuDDQtgW1ffQHXVQcZM/HkybVA07QyQPAesTvvYkuJtTOTzkWIYAsf5qpWeNo6/lfk1OJ4tZeKTbr59UwLE3dmcJHAoskD1TU+inWnChK26ehxucLpvdFOMjlXCnhsddgn2LZql1I3QOBZHmUFe+MrLxx8JzG1R5pkP1WLR2UXUSrPH181+ot7pD1b7Jc6iaGRBNQBlJtRJc2vskg9iS1DtVXoAtTVVH8RrmmGVkBf20wUtbKC3Ce2xzfak95AEqex/vC89SOR8GSK8L9Fmn3KHQIMzHY1H5xesLGh4hV9haWsdpIozKKyPrhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLmfRJY88jUL+HSGPYDHADsIX8WiwJ6lG7d72FGNNCg=;
 b=qSR1bcJ1Ave94wwN+P1Hzg2js7uGtXCYsy76Z3johif8Qwcze58SWEQMSCBGB5/SlbmRLrjrRM6H7gJ4QG/P2Fr/wn2gaS/4ZE4vuam5RnpUaXjEhJ+639v08Oka163m1u2Yxi6O2g4o5n3xkph6QfYYbemwHRmsv776spNNKPE9tkikcsY1pMtG2IajHyG7VCWO5DiQ9UH7+k9LUzogKCoynUQkmGsa3ZB0hbWT/EpHUG/D0jqY0th3gQdLxu9v67SLDJEf8rC50jr5wviSQmJu0Nmk0f7OZsEegU4oIjakYSTvxQVdSWxNAjD0GFm5/eyakF3GGuImJtv5L+xcyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB6055.namprd11.prod.outlook.com (2603:10b6:510:1d3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 22:09:35 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 22:09:35 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Violet Monti <violet.monti@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Reformat xe_rtp_types.h
In-Reply-To: <20260616-rtp_with_dynamic_vals-v1-1-f2b47bea9dd3@intel.com>
References: <20260616-rtp_with_dynamic_vals-v1-0-f2b47bea9dd3@intel.com>
 <20260616-rtp_with_dynamic_vals-v1-1-f2b47bea9dd3@intel.com>
Date: Tue, 16 Jun 2026 19:09:30 -0300
Message-ID: <874ij2uoh1.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::9) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 0044b83d-3616-439f-1db5-08decbf3f32f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: WYiqG0JEuYRf7KQdSnkE2KGoddCB8fwhoTrfmK8Na/tAitB/owsgxDhPs1mM7StHcnf8GVE/FQTl9aYipUfryld/UU/wqqLADDUW1+9+vGbraSJcLhRgXKFt8MYg6UNtRhbGTc/HJ1XtZ522JlNwrK1PLTJ/t8Bpf1uTvyXX60VP8hj0v+HBU/mRS70C/ejk5iDDR4ZOaAmp/2pdyKR47gHSriJnKckDh04fI/sKfq19vxXJ5YnyKxxrlekarQAjd/95BvqbEVJZWkFrsuR+S99s0UUqXy4Z+a+aIjaMma5RaIWmArJzHe3KgbKOR6zJzn8px+ACKYa1eYhJ4IV0xV2SAXJGCBYOrn56/fwpopPBohcFFwK2Bvb4dRfydBFhnUMHRmlR7xMmNCFOdbisfoXBdebKuDOfxFYpjwFiNNIc5MnFitcg+ZmTB8wfXYi7LJeodf4T9r8o/kpIjc4pJFfmg1VPmXaOURcznfcXOXVmdN3ro95bzHVWVTdSE0zJwKiRj6BwPWNgJhZTf/GRW9DY6xS63Rt/XN42efceAvek8pvxoZUlkLjJyM2RhgxVNKDaqygivCOiMun8slBt5Vp9VGAm2CeyhrVvZRW4chYfiaB9eNRwlti5dg3ekBJpjXRH3BIt0y+2vl2jTE3A69UOC0Uqrkik7QFKgXfrAeIpp7mu7qM6Ynp1ZxRqQ1PX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mf5EyBkToyi98nvuX5BifgNbmDHtH3kUVaioKj6cFaJb4xXhl/Aruqh2qUfw?=
 =?us-ascii?Q?5Omqpa2fT0vxhF0MPz3+rxgLXcYBblrALWmpWYL4RxGpYdOAbzmM0T5goZ5o?=
 =?us-ascii?Q?Wik8nmQ0ZZxwmu5mh4dTzY2eMdHcULjmlFHCqYVPp4d5EKSsk6Dc4QcgDPHd?=
 =?us-ascii?Q?vb6hJeJiw9F2eY09oYvkpaxoSJ2FRiJLGbhfu5fSew+LB0ZgulItCN8F55E9?=
 =?us-ascii?Q?DuuBlR9mOrs4rZDen9Vs3Ig15F+zUnuXrMqX4ZeinROFfEjhwEqMMqxBXO3G?=
 =?us-ascii?Q?OKshZ4K7yyS4/6L0ugY966GPG6e2N1Yeqrd7dG/BjoNWAF3Q9iwMZz65CKdr?=
 =?us-ascii?Q?2L3Hj+svmMtttlQgnRpBXQOiAkCsjCv91hzK4NBK7ibRB9hN6aZh5qypbwNY?=
 =?us-ascii?Q?NG+IfIijVzcgRJUoD4DXZ3RnlPrycYnVaKWZLWfqJlDSdxhuNLRxJE3XW4xx?=
 =?us-ascii?Q?U90y6TjF4TuwwYxTS7eiCB+XL9fPvJ/6kSTnHBo2+thRj9e0KGED1aOJGlu5?=
 =?us-ascii?Q?aaFSvDhsRe/x9Ysj7cSoF5MvIA3QzQyBJDaSYW8RfpsThnXxO29aET0Khe24?=
 =?us-ascii?Q?1C12dxEEpPw3QpYc9SQzc1D4iqTyNrVIwt132Co2WEGRhwF8Xdo2JRa0bjlN?=
 =?us-ascii?Q?QGJr+GzAJZEqqXVVVubRz8QKhFAlZqQhmoqq38bfmy2WcR+XPk2zLyv4zJA5?=
 =?us-ascii?Q?NuhR0c+sulNeW1sX1fgIg93jmHIZqgaYFJhjgFzkzhpjLTA3E8SVASvOalDM?=
 =?us-ascii?Q?9ju70NNVBQKXdU97Wf4Q5h4tnHzg9hK8mQ6EpG4B0rg1Snfwd2p+UZE4WQZK?=
 =?us-ascii?Q?tBA1919gtB+DIbH2EjBUEv6X1WPlIlvVI5Cj5wXE4lX6RSrNALZSfErjV2vJ?=
 =?us-ascii?Q?Pq8G1/6TKWGy3escPOSWOtwn/YZG5jf+SLoxN3he29GvHs5Nd+0CUpo/kPfQ?=
 =?us-ascii?Q?wXkL0+Ccq9pebesZ/u0kuf6knIgfEJaH8ztLl0lt04CDBZstUz1PBlkOdqc+?=
 =?us-ascii?Q?1Sh4Hus7yMAjjwZGFZEmC0mXMildRXS79JfwXDuLgagiGX+FTAAtx+K4o/oQ?=
 =?us-ascii?Q?b/Enstactq51nCxlZXGoRbdny0N3yUGFOd/hHik/HbTU/VQa+MDU+ZhyfE78?=
 =?us-ascii?Q?JZQF9uH1iOava3AYT8lGHW0NjATbtnUBg9MxaO5p8gQfiqlk5qfLzZdambn/?=
 =?us-ascii?Q?Tw88l040QWlFfJpgjWXb0szmY61Algrg4+7pnguJHXm/ZdP9X4pQKVCy8Cnb?=
 =?us-ascii?Q?A3j/j4kUOnaKHAng0b50b58FTeCmSjqC8d+A9nKRYbZuLGAG70MDHWiIfwvN?=
 =?us-ascii?Q?VKJc/nCWcSUEooZL5lGZIUX9ummXWcn0yVjbQa/zHLY9xCXx2D0Vcky21eMJ?=
 =?us-ascii?Q?WJffZWnKDyHgy+brW5eX4RUwZmLNj5FMCZqR35CkTByq0jW4D/B9abcQaDS+?=
 =?us-ascii?Q?9f6tF8QpDYYss1O7m8zihxkCrT42XMhiNMNDTssdnQX9lpY3pI14WjiZ9+j/?=
 =?us-ascii?Q?aJdotk8ZvM++M7ZdOzwvTe9CHNU+zbI9o+3BogXvhM1B7V/057P3P/uwB7Wi?=
 =?us-ascii?Q?7qRL/lalez813dxoHBSem1DKqw3XuH6M+ZJRyorv79BK3MghXYKaH6rk9/il?=
 =?us-ascii?Q?7ZHzOjwadl0baJfVncLqTk5f453nEm/5AICzzrZliR4/UNIoB9RMoIrqY83V?=
 =?us-ascii?Q?PcT8JxBShfh6r+Bov/64BH0NJbXU/pkF1lC6tIQygehvnARzoa+EiFOB6gEf?=
 =?us-ascii?Q?YKr7DjiH+w=3D=3D?=
X-Exchange-RoutingPolicyChecked: Cozjy6XUeYXLaDk7GMOvPe39y+JhrmWtNlZ5bzft/GVaHVFt0FZIx3gXV72u2bidhQynkUmIhUnYM9LpWdLMx3/zUyLO6sXZtNOnliRYfHXpN9v/gfDuxdG9HnXfq/tZf5YSwyN646oar4W6RahVqXnaQJMgiGtNoRrOy5yV0WmDDkf2aJfCrbvC8939v4ZpozBt3y9C6JNV4IZhGMI4r8HI3PxZ4uWzlGKMmyyKvZSN+hJ6XOrxqP5EBtQXMUVtfQTc4w9CUsNe4Ml+/Bnnc1Uism5OtDf/cBYaiW18ATq5U2NktsOrfmLLNDutLbYdmuFLWu8ZIlpULFK0iyaQUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0044b83d-3616-439f-1db5-08decbf3f32f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 22:09:35.2138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azHWfOM/dbBWRZlVib08tPEVK4E1ClQjq77NMlkOC0eQa59EhIai6N6p36Nh7gqpari8hvp/gcV9z+C6jVVHzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6055
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

Matt Roper <matthew.d.roper@intel.com> writes:

> Adjust whitespace / newlines in xe_rtp_types.h to make it easier to read
> and more consistent with other files.  No functional change.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp_types.h | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index 58018ae4f8cc..1d7c63d0ae94 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -22,20 +22,24 @@ struct xe_gt;
>   */
>  struct xe_rtp_action {
>  	/** @reg: Register */
> -	struct xe_reg		reg;
> +	struct xe_reg reg;
> +
>  	/**
>  	 * @clr_bits: bits to clear when updating register. It's always a
>  	 * superset of bits being modified
>  	 */
> -	u32			clr_bits;
> +	u32 clr_bits;
> +
>  	/** @set_bits: bits to set when updating register */
> -	u32			set_bits;
> +	u32 set_bits;
> +
>  #define XE_RTP_NOCHECK		.read_mask = 0
>  	/** @read_mask: mask for bits to consider when reading value back */
> -	u32			read_mask;
> +	u32 read_mask;
> +
>  #define XE_RTP_ACTION_FLAG_ENGINE_BASE		BIT(0)
>  	/** @flags: flags to apply on rule evaluation or action */
> -	u8			flags;
> +	u8 flags;
>  };
>  
>  enum {
> @@ -69,6 +73,7 @@ struct xe_rtp_rule {
>  			u8 platform;
>  			u8 subplatform;
>  		};
> +
>  		/*
>  		 * MATCH_GRAPHICS_VERSION / XE_RTP_MATCH_GRAPHICS_VERSION_RANGE /
>  		 * MATCH_MEDIA_VERSION  / XE_RTP_MATCH_MEDIA_VERSION_RANGE
> @@ -78,15 +83,18 @@ struct xe_rtp_rule {
>  #define XE_RTP_END_VERSION_UNDEFINED	U32_MAX
>  			u32 ver_end;
>  		};
> +
>  		/* MATCH_STEP */
>  		struct {
>  			u8 step_start;
>  			u8 step_end;
>  		};
> +
>  		/* MATCH_ENGINE_CLASS / MATCH_NOT_ENGINE_CLASS */
>  		struct {
>  			u8 engine_class;
>  		};
> +
>  		/* MATCH_FUNC */
>  		bool (*match_func)(const struct xe_device *xe,
>  				   const struct xe_gt *gt,
>
> -- 
> 2.54.0
