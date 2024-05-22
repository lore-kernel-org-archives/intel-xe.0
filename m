Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA1CC25B78
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 17:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEACC10E16E;
	Wed, 22 May 2024 17:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YC/jw3P7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F91E10E1C7
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 17:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716397287; x=1747933287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JBCvGhO8+EXN6RQnnCO7/ivZSJV4X2lwRRUqo+TeA5Q=;
 b=YC/jw3P7p6Wk0JsZHjx+wCM4YbtakBnUntd0s4p1ThthIkjeELd5mj9I
 uKgj33XMAKDoJ0GQWvXBFchiuh+fUx8OK0949fP2MH/fOV2xaSID3XbJv
 yZvYzkXnV5qYYRKxvaRekMEtuexU1KO+kO61Q8yMMW6R2GeqsoVzm1Tn/
 QPAssT2U7wVpb3UpgaD+lsfROmXbxUnCxdOP89YQDH8dXRRKC2B+jvFKs
 XttIeRGjWH0/M8ixCLFSRpSGc0vBTJmBlNOU1zJjja0QY8WIQcsOCtmk/
 1bQSYHr6F1HzAnCTpJLJuylIzwUfjg6hC9pGaFp9RK8ZM3XZMSi3Y0+yx w==;
X-CSE-ConnectionGUID: EFnoPx4jReGmCfqj/WiQKA==
X-CSE-MsgGUID: JrktcaTcQJacWvYHVmYzDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="24071013"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="24071013"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 10:01:27 -0700
X-CSE-ConnectionGUID: /6EJ9eBSTbq8jzs8vdGnVQ==
X-CSE-MsgGUID: CXSXRW7ZTvyX8HiNrHCv2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="38203564"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 10:01:27 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 10:01:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 10:01:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 10:01:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 10:01:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3V9SnyDQHGzw9PM4NH7LjR0S+0gKU806S/AcChXS4uxwmproqRPrSW8Z2Nl7NYKpbpOaDBZrs7ZWR6wZwuNJ//aVU27PhhcehmfqcYzrvOr44th8Czkg5U3zzpDinLrLxCHwYwoKeeuLI6FJ+PQB8CYRnSFokueojGXfywc6LTg/TXH7DF2NcIBYt+KJmiZznQSQIhZ1qhO1a5TpGmh2TgFsRL5yCZ2xlo71kxlFH8AnUH/9skyraCI/jQIXwRm+1v2ekma3LRUa+YCxUyM0tPOyIVADrLH8+Im+G+rrYRpXp0DE4EmL3ih2v1POUPi0kSloUzxJCmpaF45xVpsuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvhdRxonxhRZM3dD5maft1opgEqWRwkOpHf3hc4pKeI=;
 b=StJkAwDHXBr+ijnokFysP2tC3MpBsjpPTirUNj+CHMrQnJOEqMVr1eaofYUrHzV85byM1wLbBRRAglVxVB0wphoGseA9HcotylUF4iSZnKuSrAOFnXoQHvO6ZUAWXwklX4WqQUP6tOVZftPhWnZXcR1TPBGKOm6G/YvM1pHbXDQ76dDT2Hz11lqF8gXinAacZDFflYR/3l7m8Wo0tzfyq61Jqbdfm0dQPHZmP4xblu58RaMznYzhx/NGSQB9Qd6Dcji8dnrgGoKh2QpzyDc6pyBKv3Kn7uClmfUX862BjGa/eJ3zBnkaUdhEkjJ94bb5e5uWjH/b9RgPi8ncPRNTkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB7253.namprd11.prod.outlook.com (2603:10b6:8:10f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 17:01:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 17:01:23 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Uma Shankar <uma.shankar@intel.com>, "Francois
 Dugast" <francois.dugast@intel.com>
Subject: [CI 5/7] drm/xe: Prepare display for D3Cold
Date: Wed, 22 May 2024 13:01:03 -0400
Message-ID: <20240522170105.327472-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240522170105.327472-1-rodrigo.vivi@intel.com>
References: <20240522170105.327472-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: d376e589-ecfa-4b7f-bfae-08dc7a80cf36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aDKrS5Ulw9H4ONpHyEsNZ8J4h+hMzetKDCtQIS7SBa7EPJ73vE0MJAni50aD?=
 =?us-ascii?Q?gVVjY48FObgc9pF/9Exky2r0/Z+XnOTynthxb/p33/y8+Oz1c+zG3qdE+9iY?=
 =?us-ascii?Q?sAEmXutUgX82C6fli9EZY3w725Y3MWYk2KUwWmle34oyI5PvzKQplh/+aTRT?=
 =?us-ascii?Q?Mw9xiJ8/qBYORdvU3+2PAvsysmMayu1s3voGtpa9zyGI1408SRTqW6gpczL3?=
 =?us-ascii?Q?WitYjXe0lqVGzgavMuuYTur3eQT0jEGlm5WiRnitrDd4oSqH3PQ0fZMGpU9f?=
 =?us-ascii?Q?kBJfoUi0UOSxiPRMgPECU52s0P4CbRQl3Ydr1utwm/kUhx3KlISOPVYzOkq9?=
 =?us-ascii?Q?CpyIZFzxVlnKvIMji8Q/3iB0zcyDgeg2RAj4U82ObuEfhs/AowOCSbf18oEj?=
 =?us-ascii?Q?HfwMHf4hvc7nmUYiA3pnTcPBkq5aSnbfWHWe67Q+SFRMpkfby0QPFRryjvg9?=
 =?us-ascii?Q?6/feth2YPt5C4/YWZWUbZKiRa/m3paTEg0RccJTgMyzu8C1vwjj9cT6TcyfG?=
 =?us-ascii?Q?SJU6jaB9XsSb+zXiVDv41ZqeK4/VKHW8cFcoIUvZde8Y/XpsiDBr64xzyBh9?=
 =?us-ascii?Q?sCRNoBrh96avvUZ8oZ3G8WOP02fiCJTWtDnMb9ntngEpJXmfIZJQjafuvoWl?=
 =?us-ascii?Q?g9XRAXC2/MRRjRgLmPxoIkg1XNIWMArwDBFJME2MYDz6bN2ZIjnHBrL0oNmF?=
 =?us-ascii?Q?e4Zqv2CTggps3BXlM5SxGryuSRVstArdjRaTgD8koZXH/9At14dpFGsdeeXz?=
 =?us-ascii?Q?71rTHnWd6XgbW7nuhKFjCIHopR999XHPjxAKrxo/AdGxW4pBkP7R42hphEaQ?=
 =?us-ascii?Q?StBqLMW+nJcuP6ZEKHqq2K6L+DTMNdVK7hJQe3w2il7sDxYxRsrq89abshgU?=
 =?us-ascii?Q?aIGBcfJbGKqVXtZ90WAr0HT8BRmFJDsQKQ8zx/9pLffkxAsHrNwOtgFhCj05?=
 =?us-ascii?Q?9VFHb8GYXJaayqCsakfWN9AnaIMfS7UOV7KmEiQDMKMBz6vWPMUI3/4QtFn9?=
 =?us-ascii?Q?HoQfKSdDi2EIUYJB/p54SkpZqlSs96W/WOgmkyVDhd7pa2Ro8WWx2GNLx0v/?=
 =?us-ascii?Q?8Z8UQfWFff7N8QE61EQES9VE0yC1JaXkCHjXl41+/NbPvVnKClG6Q/wrBvmW?=
 =?us-ascii?Q?Pck6y0bJft6vrsycF9eChJFD/r5dmh2SUin/4LubMyq9VaBosJHZ5Ez6BuzX?=
 =?us-ascii?Q?e0R1KyyRz6/CfPUBl+WDKLtRbvbfumNNC957oy0U3yq7ijQg0Slz9VDBwTA1?=
 =?us-ascii?Q?Dg0Qh5BfjbgDymGScZ+LPiAAaGv6tQ2u6IjN0K4V8Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?koDf05yQzZi/kqK5JZJL6CZcSbjpj50eHj89pevgYnb6H2L54NpssIwuJGep?=
 =?us-ascii?Q?VgdqT4ZyLHBzglnuK330Osv+kQryumlrBBfLZgDu3Pp2GHOIICc7fOHIiAoW?=
 =?us-ascii?Q?8Ea1Kgx8Jqn6M6TwDwMKsSh0C0EFO0x+aWvfl20sMZVyNIbhRf1no/RQCYKS?=
 =?us-ascii?Q?FW4ejhN2NGkRahrq5dDkNfLa4ojABkabyCBnW56KUg6lR6BaP9r2ITChI+2M?=
 =?us-ascii?Q?nSngPixOZoRQCsHpvJVkIXv7YaBI8OtWUS86YVWllkzp0cYXHGTPMGuFglYs?=
 =?us-ascii?Q?7DPPs1bN+dbpyt0+AXmfrkqTcuMzSveU7arfoeR2nfuBsOYYou0Ar9M/Gv5l?=
 =?us-ascii?Q?vLr/d1rj6Xp9A/3ITbp+SbnusG+4XdVhTh6GFz1dq3ZZBwYu/9qfHRzWw41v?=
 =?us-ascii?Q?xiKAwVRBomR00h25T5kgiA22+xGHc0IH2ZrcHghacmcSae7MnA/RzgJCuAuY?=
 =?us-ascii?Q?hcSfY6D4iFk3uL2ETNR7KzlZEhu15tQ2gPvy2ZcMHeiiHoWayUeeeQ3ihoCC?=
 =?us-ascii?Q?0cJWWqx7Y874PAKdRabBYtSjeMYMiVjr162frjHxNe8DToaQ//3V4AgclPOy?=
 =?us-ascii?Q?fGFaaHsEgrhqoJwROvMm8gwFeEixF0Eua8aJaE2mxZh8bC/rLD6OX165rEkd?=
 =?us-ascii?Q?Uoe8ZyvsfEelmUzu675ItW/OBDGNP8WLWPIaqN0BOhCtcZrGqSvTilYJEU61?=
 =?us-ascii?Q?ceJbr5GH+Jx1Bq+Le9IAird3LOhE7PUad95TogY9dVFFIqppoSRmp/otA8bl?=
 =?us-ascii?Q?O1Ua+25NCLHQE7UB3ir0fbMzyT7FpnAgO3M+bXmBHhXqMuZPi9K8PMeYRStP?=
 =?us-ascii?Q?hVtVShnbtRUUcpvzULAjC8/W1z5BJjMci/lg4Vj00BHkiT0DSvonOwnSnUF6?=
 =?us-ascii?Q?S5E1CCCzXf07r1n3NEbbndrrmEcgbcbhoeOTRjpmUd1VlmEpl1eR3XScDoqK?=
 =?us-ascii?Q?Pv25bDNOdw2F+ijf55IziHqpH96xed4LK+MVik0qz4ktXMNLHgQNzuFGHEgx?=
 =?us-ascii?Q?35LQ8TbfdkaWEw+QwzFKcBQ+070H7FVaRTW1PLAPCGJkQ2jYOcg41BfnuzY7?=
 =?us-ascii?Q?udXchW5SnnSYBqeWoouZnXzfIg5z5lz2Ua4Y8tDYug4YZXQ6WP6XJOqzBgaT?=
 =?us-ascii?Q?R02inc/VTevNW/r0G+80/M2SYuBNabCaJSceaYza1Quu3hyvPgClhYcM8tSB?=
 =?us-ascii?Q?JlKEndq9YcjziJlMKbCHgQrTmZMyFQhEUPCsPpL7Rre2SxxrP1DFxY6W6NcI?=
 =?us-ascii?Q?4kEikNrwBaRD+mTparkBxezCroThrHxxfK4kp/UwVYUewPGBBvYUEKf0aZRG?=
 =?us-ascii?Q?n82t8s1k9A6ehtD1+otiIEilyMJHRelR8DFGZA4hab3hDonGcBvk16pn5lfM?=
 =?us-ascii?Q?Tw4QAmS/NPQdzBC18+U8HuL7FIVCFkhejlJpggtn9fD8uR/Wh9d+ZARCr9z1?=
 =?us-ascii?Q?T0tmVPr0aYKcokxKTOKW/uDpnIvw0oMtFouAil67NIO/AlIBKRKFRQ8yPz4P?=
 =?us-ascii?Q?Q39YATF2QAzp0mifVE6LjIVKHz+ZjSiOEt7MteGKT34Zy+pDScHyOcwFLoAt?=
 =?us-ascii?Q?uTNdllC2mcdFJlyUN2Z5C5sN6LCdvYIzZWma5AGfFpJEpYagz+baa68fvOC0?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d376e589-ecfa-4b7f-bfae-08dc7a80cf36
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 17:01:23.4523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVMyRwWioR9QB3xVu23av+uEdwWGfn6I3tXFSG7fs8UXnZGawPZo/YJs3qpuayBgoRyVkTmGmLGcroXTWjxx1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7253
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

Prepare power-well and DC handling for a full power
lost during D3Cold, then sanitize it upon D3->D0.
Otherwise we get a bunch of state mismatch.

Ideally we could leave DC9 enabled and wouldn't need
to move DC9->DC0 on every runtime resume, however,
the disable_DC is part of the power-well checks and
intrinsic to the dc_off power well. In the future that
can be detangled so we can have even bigger power savings.
But for now, let's focus on getting a D3Cold, which saves
much more power by itself.

v2: create new functions to avoid full-suspend-resume path,
which would result in a deadlock between xe_gem_fault and the
modeset-ioctl.

v3: Only avoid the full modeset to avoid the race, for a more
robust suspend-resume.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Tested-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 10 ++++++----
 drivers/gpu/drm/xe/display/xe_display.h |  8 ++++----
 drivers/gpu/drm/xe/xe_pm.c              | 15 ++++++++++++---
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 386c356967b4..78cccbe28947 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -294,7 +294,7 @@ static bool suspend_to_idle(void)
 	return false;
 }
 
-void xe_display_pm_suspend(struct xe_device *xe)
+void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 {
 	bool s2idle = suspend_to_idle();
 	if (!xe->info.enable_display)
@@ -308,7 +308,8 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	if (has_display(xe))
 		drm_kms_helper_poll_disable(&xe->drm);
 
-	intel_display_driver_suspend(xe);
+	if (!runtime)
+		intel_display_driver_suspend(xe);
 
 	intel_dp_mst_suspend(xe);
 
@@ -344,7 +345,7 @@ void xe_display_pm_resume_early(struct xe_device *xe)
 	intel_power_domains_resume(xe);
 }
 
-void xe_display_pm_resume(struct xe_device *xe)
+void xe_display_pm_resume(struct xe_device *xe, bool runtime)
 {
 	if (!xe->info.enable_display)
 		return;
@@ -359,7 +360,8 @@ void xe_display_pm_resume(struct xe_device *xe)
 
 	/* MST sideband requires HPD interrupts enabled */
 	intel_dp_mst_resume(xe);
-	intel_display_driver_resume(xe);
+	if (!runtime)
+		intel_display_driver_resume(xe);
 
 	intel_hpd_poll_disable(xe);
 	if (has_display(xe))
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index e4085f841aa7..000fb5799df5 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -34,10 +34,10 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
 void xe_display_irq_reset(struct xe_device *xe);
 void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
 
-void xe_display_pm_suspend(struct xe_device *xe);
+void xe_display_pm_suspend(struct xe_device *xe, bool runtime);
 void xe_display_pm_suspend_late(struct xe_device *xe);
 void xe_display_pm_resume_early(struct xe_device *xe);
-void xe_display_pm_resume(struct xe_device *xe);
+void xe_display_pm_resume(struct xe_device *xe, bool runtime);
 
 #else
 
@@ -63,10 +63,10 @@ static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
 static inline void xe_display_irq_reset(struct xe_device *xe) {}
 static inline void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt) {}
 
-static inline void xe_display_pm_suspend(struct xe_device *xe) {}
+static inline void xe_display_pm_suspend(struct xe_device *xe, bool runtime) {}
 static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
 static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
-static inline void xe_display_pm_resume(struct xe_device *xe) {}
+static inline void xe_display_pm_resume(struct xe_device *xe, bool runtime) {}
 
 #endif /* CONFIG_DRM_XE_DISPLAY */
 #endif /* _XE_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c3ef2283770f..a2f5a1b11cbf 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -96,12 +96,12 @@ int xe_pm_suspend(struct xe_device *xe)
 	if (err)
 		goto err;
 
-	xe_display_pm_suspend(xe);
+	xe_display_pm_suspend(xe, false);
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_suspend(gt);
 		if (err) {
-			xe_display_pm_resume(xe);
+			xe_display_pm_resume(xe, false);
 			goto err;
 		}
 	}
@@ -151,7 +151,7 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_irq_resume(xe);
 
-	xe_display_pm_resume(xe);
+	xe_display_pm_resume(xe, false);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
@@ -366,6 +366,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 		err = xe_bo_evict_all(xe);
 		if (err)
 			goto out;
+		xe_display_pm_suspend(xe, true);
 	}
 
 	for_each_gt(gt, xe, id) {
@@ -375,7 +376,12 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	}
 
 	xe_irq_suspend(xe);
+
+	if (xe->d3cold.allowed)
+		xe_display_pm_suspend_late(xe);
 out:
+	if (err)
+		xe_display_pm_resume(xe, true);
 	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
@@ -411,6 +417,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		if (err)
 			goto out;
 
+		xe_display_pm_resume_early(xe);
+
 		/*
 		 * This only restores pinned memory which is the memory
 		 * required for the GT(s) to resume.
@@ -426,6 +434,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		xe_gt_resume(gt);
 
 	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
+		xe_display_pm_resume(xe, true);
 		err = xe_bo_restore_user(xe);
 		if (err)
 			goto out;
-- 
2.44.0

