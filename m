Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F5EC5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 15:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3A810E806;
	Thu,  5 Jun 2025 15:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8NKeX0+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107DC10E300
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 15:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749136242; x=1780672242;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sgi6JS5CW0MCd8LDW8VgZ4k6e/q15h8srGIRucIJajw=;
 b=b8NKeX0+sUgiaWqZInuoX4NiQBVw72NdJQjjCGiiR3PRX0HS9m8pR8i7
 b4cFfTE83kGVrN9vIFvuIw1ZC0H0/f9lCiwLMUPqZJm8nioRnpVWP11gU
 1pHTqjSX+OKfomnkFgV3mqIQfZNw7vOig7T5VC3hpDugw3lQQjXHawaws
 b65j1NK3xl8MYpxjHVdvYcNDy7Mt5NfyRYvtootgUE7QXsYBcwigE7CZc
 w0pWO2b/jtguRfpe894W+xRiRIFFQYwO9c3PkfogxiNgrYdSPKdZT8ctv
 DzuQwHqGIhz0rxwZ4kglg9gHUR4NryqWy1q5EH5SOBSZBBB7U68Lpl5WJ g==;
X-CSE-ConnectionGUID: avX/3QBGRS+gAL2oPwYz+g==
X-CSE-MsgGUID: YxFS68U0SzSI6pdwWBllow==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61880819"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="61880819"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:10:42 -0700
X-CSE-ConnectionGUID: ktB0EIAgTPmYFLEzOp0F+w==
X-CSE-MsgGUID: TFPYyp/VSxid+ZHh9/uKDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="176404284"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:10:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 08:10:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 08:10:33 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.57)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 08:10:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSegY1BrFdRorM3KBCxV+VYcJrI6PRwH9pNh66KV8FGFEyvNuz3iv7bqSJ/wtPJ+P/CIczeeFEEKbWbdj76/mQiPbyzj/AHWOcU2MUoLgGo0hx9BAA9nwnV6PirOB/S8uJJxYz6yPnDophS5rKo/5t7LcebrJmlrvTjBpq6t8bAvy9CTz9mg7z2MRs1DRzYWlV8CRkg/cjX0GU/JpfWd3I7HlagRuAWbwkjezVLvAKQEJYz/+Ym3IJ9JNrnMs2j2rF2Iz5KDg1oidgsP2vhDWUjvcfQBaP3VfnWVgStm7dwfiXl/Et+U2ijiJc/E0ORus+nhN8v8HJGflw3H3U2ynQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmjdjDnEw6yT9R9YLMqTYiSeBxEIOHv03MqzuSoZV40=;
 b=rxmYrrD0VXijGX+dHJtGZFoJhlf4O5EMfbWSLkfsLcE3ZTFlmQ4iqpOaINc+E9xQwUcOYqgvKbvdVO3x9o3UncN8ktIJRLvnDMi55FOmfKB3EXk1lZs9OKNCzRBNqiaaeXg7loeM7aJv3vp+raLrtzy+xw+4L93Ah5Xpu9IprxY++Xl2Rejv0o5WXQglkqcyjV/i21xXLQX84dxX7gBO1deVp8V4Hfc3VAR4c6eXkvNdcoeUhdMRQ+s4i4T5zieryZ2eJks5NVYi6TcgAWWkxPeCnf1qn79722VD5P8nuWoq+a/D6cv5ArUKOUwdiLUlPUcVGvhixUl529aNnFz33Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS4PPF1B1B74C09.namprd11.prod.outlook.com (2603:10b6:f:fc02::e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 15:10:31 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 15:10:30 +0000
Date: Thu, 5 Jun 2025 08:12:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 10/10] drm/xe: Do not rely on GGTT internals in
 xe_guc_buf kunit tests
Message-ID: <aEGzw/Rl96CX9tLH@lstrano-desk.jf.intel.com>
References: <20250505121924.921544-1-dev@lankhorst.se>
 <20250505121924.921544-11-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250505121924.921544-11-dev@lankhorst.se>
X-ClientProxiedBy: BYAPR02CA0065.namprd02.prod.outlook.com
 (2603:10b6:a03:54::42) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS4PPF1B1B74C09:EE_
X-MS-Office365-Filtering-Correlation-Id: 2982980c-e6f3-45c3-c2cc-08dda4431ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g1+u1xqqkmQXfGWog9Xf8l6rZE+MJHgN0XNzH7p67i7T4ubefNOritIWCutS?=
 =?us-ascii?Q?AAKfL5aAOKiTgYbsUuyfpK0c/hUKuKZArpAGab3+PSnb6ZzHBNxqnk/G+qFk?=
 =?us-ascii?Q?hNWRZbX7le7eYDmt9ICDSgIiZY8Zlz+pLe86c6b8KxQLYxRc7NCibqxwmoGD?=
 =?us-ascii?Q?CFlMw/HEMZO2jsqPJzd98cRS8QLwAdUC6LPCA/dtJOAp5HPAU1wI1smJx8ib?=
 =?us-ascii?Q?3vGujoQxtj+xrNpDlsf5oSFOy6WYIozKkAnq+0krUdpYc/wUNcNxjGIh6+8g?=
 =?us-ascii?Q?oZv+Ta3VJLHd4kJWxa3HNStvyRBrRYyQKAByyyVKfoquz8yT3CMS9dcvTtrn?=
 =?us-ascii?Q?lcnl/+l1Y4KguIj6tYOA/DJmIWN5jeLDm8mGt/iP1Y8WVfs7GK/KBLQFje+k?=
 =?us-ascii?Q?wdS6D/4rl87fGNL9DiJzfdVyfgi+VL0bsYjcylAheLc4y0R+A1K81QD4a5DP?=
 =?us-ascii?Q?+7prwHcP1MZppq2pqPMU6VHdqKvfJpOZUkMhpO6TY0Xts2ZOWrdBmTr0Tq0I?=
 =?us-ascii?Q?EHs4lsfGUUq8w7Wm/qm5Glj2BRWMY1r1k0XCVSgH6sW4B2AMqgDv2dK+KB5v?=
 =?us-ascii?Q?cYjPY1vkuwD3F1oPZziXiHfaooqk0XTebpIvzyiSSnicLjZKaARWDxb0052a?=
 =?us-ascii?Q?pJMi2uXR7fE76FUp1zUfbIkxRoir8+2SWz7aXrwtUTn1vV6BqmbThASIqTzk?=
 =?us-ascii?Q?aGFD/suHZakOqPRdXUTTd97Kua13Vzvll9UwZnpwrQIk1TUKjacL7SHRwRD+?=
 =?us-ascii?Q?x0gwwKTS5pij+1yP8QIwIaZne7HqTdtEXwBk4Ggpdv7toIJgdvVePbSu/rk7?=
 =?us-ascii?Q?ERa6kjgF1VTYF7t9TJDx5nPjjwPt8JJOBFKFSbu4vD1wTRIX97qZRATwvenR?=
 =?us-ascii?Q?Lrs2Ba5NkxRPq1ABZpCDm/Fk1A9Ivm5ck7k64M5ktruRBcY3lJs08gg5uCcO?=
 =?us-ascii?Q?xoIp/nfdU0d+6drdn3FGZv+wKe9TDywKoY2CwOjWXvsQ/V6rTc220ADZPeil?=
 =?us-ascii?Q?MH9ahshknY6EBwXUKeROlDoWy8QwMAVshuT6aCMrfEKO4HvYSkjX7hrsaTs/?=
 =?us-ascii?Q?55TX4LuuNPOYJ/XvOLTySAzARo3bcW6030T5YK5suo/tEnbg0Rk2vVo1LKzK?=
 =?us-ascii?Q?Y9xWDkTdnO/0pm5p1n7oj3xLwyrO5fNBNodgO3zyI1ocsj8YOdgGQiRe5jeA?=
 =?us-ascii?Q?WzkNP1xjogu0UpEPMFMzpnYs5VcX6/+L8k9txWXR5Zu7CdUBdENpNS8RfHQi?=
 =?us-ascii?Q?6sNTuxfBJM4bdwebWeLBPNxvMqM315jsVZkmvWHzc6h7s6HT3W607W8lEyL+?=
 =?us-ascii?Q?nUf29wPoUIHDwuxgVdNG3qqsfcxUQkZdRaZxzgqj11TA2aWXgfu80BaiidDJ?=
 =?us-ascii?Q?FmBJnWTL4AC0UkPgCYLH6t9HjZdLnH50T3C5mAXIverXYGUJDDSOVcTnT04N?=
 =?us-ascii?Q?rpUUFPtxHk8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lwm5ttsKLzFDDCGR1Oqxb/Ws1WkYt30M/DoFQ8FPTdbUrhjHQz7C8aqJKNw6?=
 =?us-ascii?Q?5MfTJc2Zd9Mvu+3Cs7zmGX1vm+dWaI9Qr2kgHTMqxxT2u2zNUiIN9r/qLSsC?=
 =?us-ascii?Q?7/3khNcVhSAH+2Zqx8lbvc+dL9dU3rDhBjFSIr5IpAVUiARfzjo1RYj457nN?=
 =?us-ascii?Q?lTjpUaAfWMjvB8TFTcUQLHMu3tcaBq4HSwtADpynNNSh+NerTPSwX4Rp4khy?=
 =?us-ascii?Q?VkwO0mftJdgMyUS6LCuAlqdYBtwcminRkbtKP478EJBCz61TA7jCT7tbOVuW?=
 =?us-ascii?Q?v6ICBSCPLdOr3O59OToxR7LZvo1OH4zhBYlLs1x+3JqhGhInCwnkT3TUzvMN?=
 =?us-ascii?Q?qy2npE3SsKXLMpr078TDeH5Opg+ITYNKnOSWJoyQ7HbMpv4Ss/mIArQLayAC?=
 =?us-ascii?Q?rXN2lObjqz2hR1XmYu58OsWcVGGn/9jTeQiMxTa0u7w9WVXi54qhDHss1vhy?=
 =?us-ascii?Q?hDKqvEsh5t5Y5oClqt4M0UvT5GmvSzu0vCXFD6TyPPu6Uan8gDWp+KJw1MqR?=
 =?us-ascii?Q?iwuTRm4W4Z/I5aGxR3jmnkK6gY2k/n0JleN1JbyLpND5SGfBuRsbY7KSAJQR?=
 =?us-ascii?Q?9SgHXH/xGWZknoREVd0d4S9RYz61JzUN+YFMpDJPzlSXBFOtXE78TZ4LEWyl?=
 =?us-ascii?Q?5znfiS0Df9YPOjZI6XlPEMVdIRkVIPJtSc5kgR15dtvJffzXj66NlzDi654v?=
 =?us-ascii?Q?lKHKMDc8Ff0zEKgl9wsEtNFDZhU2DUKZ+J5yzxO7F4abm57J59hFeNyxbhaH?=
 =?us-ascii?Q?homnefVOKYG+HUEFkqwcyV4J4xRaFnhWaK54nlVrl6zPUODO+jBYJmQyQBl3?=
 =?us-ascii?Q?Rg/7cujFEaNlL3JBYA6lZAPZpnhqxUsGkm/AGni+yiK2wGDN3Lhyc0vMOp8O?=
 =?us-ascii?Q?KWoirviYprx2PcjlkiGI1E7szyEV0/ejFcNMovyOcSA/01OHLE06DE4YuaLO?=
 =?us-ascii?Q?2aYe/rimSSOopAdcpYFPQSncML0/bSkolB6eZkB7nYMF+xYdr84hEh3yrqXP?=
 =?us-ascii?Q?C4CGCBAHeCJ6ykDKOYn+e7X95GgW7vAeWNU200xeNtVKJKtLKuPTWpvOdzgr?=
 =?us-ascii?Q?lNELsYpg48AcJwHcESPyCUIcCErA1toDWcuICIJp/fbF1pd0PZusoyPCeFzS?=
 =?us-ascii?Q?GchJI92A3uty8PcESCKiNVlytfyBufdscfnwZuGW3Tb0DI3tGfHm6pjuYC8p?=
 =?us-ascii?Q?QSjsjQ0e2OZN0v4FqpsEx9hcCpQUHIr0boyGIafPAmyZxsdtdMe0GiA2/7nz?=
 =?us-ascii?Q?0/jQ38SVHOig8TgRJFMw5st1I2m8oH/UdmjCGDOqys0CE40B46kbySbNO1Oe?=
 =?us-ascii?Q?RbeI4UtSnz6l6yS8kbVXt8M8O7FxKUtkHk8WwaHnikPLk5W1cKNGxYXBQtnI?=
 =?us-ascii?Q?t+0GLH6zBlmJ9KpbYx+aB36SNttBZDB168JhMHcveotLBI2zvcx71xYdtuyW?=
 =?us-ascii?Q?dQ6YguaNxWwwSygNQ6ZzGyiDqlutZ27fwLxngia8ADY0nJ+nqeXyABUAU6on?=
 =?us-ascii?Q?4y5+DOta8nKKrC+KQx43t/6p6C0NqwxmULa2TDh6JWcgfsptSSxYzOxHU/I3?=
 =?us-ascii?Q?A2MS4YuHJ6mYyfwm4XzNleWwPxfCCNdg5lW5F9aKL1EnTsS9WzQNnwndI3Zi?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2982980c-e6f3-45c3-c2cc-08dda4431ca0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 15:10:30.9176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRTUOEIs+r/J6+kk55X+JwE52iuSmW9jGffvrmUHL/M3r+x2Qog/3OlZ1roBY8Grvi5+WRtuPxeChcC0W7SqZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1B1B74C09
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

On Mon, May 05, 2025 at 02:19:23PM +0200, Maarten Lankhorst wrote:
> Add a function to init ggtt for kunit, and use the GGTT function for
> initialising the GGTT node without populating it. This
> prevents the test from ever knowing about struct xe_ggtt.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 11 +++++-----
>  drivers/gpu/drm/xe/xe_ggtt.c                | 23 ++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_ggtt.h                |  1 +
>  3 files changed, 24 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> index 6faffcd748694..537766cdd882e 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> @@ -42,10 +42,8 @@ static struct xe_bo *replacement_xe_managed_bo_create_pin_map(struct xe_device *
>  		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo->ggtt_node[tile->id]);
>  
>  		KUNIT_ASSERT_EQ(test, 0,
> -				drm_mm_insert_node_in_range(&ggtt->mm,
> -							    &bo->ggtt_node[tile->id]->base,
> -							    bo->size, SZ_4K,
> -							    0, 0, U64_MAX, 0));
> +				xe_ggtt_node_insert(bo->ggtt_node[tile->id],
> +						    bo->size, SZ_4K));
>  	}
>  
>  	return bo;
> @@ -67,8 +65,9 @@ static int guc_buf_test_init(struct kunit *test)
>  	ggtt = xe_device_get_root_tile(test->priv)->mem.ggtt;
>  	guc = &xe_device_get_gt(test->priv, 0)->uc.guc;
>  
> -	drm_mm_init(&ggtt->mm, DUT_GGTT_START, DUT_GGTT_SIZE);
> -	mutex_init(&ggtt->lock);
> +	KUNIT_ASSERT_EQ(test, 0,
> +			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
> +					   DUT_GGTT_START + DUT_GGTT_SIZE));
>  
>  	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
>  				   replacement_xe_managed_bo_create_pin_map);
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 2316f3a74d9c3..d019466649881 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_ggtt.h"
>  
> +#include <kunit/visibility.h>
>  #include <linux/fault-inject.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/sizes.h>
> @@ -221,6 +222,22 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
>  	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
>  };
>  
> +static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
> +{
> +	drm_mm_init(&ggtt->mm, reserved,
> +		    ggtt->size - reserved);
> +	mutex_init(&ggtt->lock);
> +	primelockdep(ggtt);
> +}
> +
> +int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size)
> +{
> +	ggtt->size = size;
> +	__xe_ggtt_init_early(ggtt, reserved);
> +	return 0;
> +}
> +EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
> +
>  /**
>   * xe_ggtt_init_early - Early GGTT initialization
>   * @ggtt: the &xe_ggtt to be initialized
> @@ -267,11 +284,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  		ggtt->pt_ops = &xelp_pt_ops;
>  
>  	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
> -
> -	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
> -		    ggtt->size - xe_wopcm_size(xe));
> -	mutex_init(&ggtt->lock);
> -	primelockdep(ggtt);
> +	__xe_ggtt_init_early(ggtt, xe_wopcm_size(xe));
>  
>  	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 600a76526cf34..9a11872e16d80 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -13,6 +13,7 @@ struct xe_tile;
>  
>  struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile);
>  int xe_ggtt_init_early(struct xe_ggtt *ggtt);
> +int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size);
>  int xe_ggtt_init(struct xe_ggtt *ggtt);
>  
>  struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
> -- 
> 2.45.2
> 
