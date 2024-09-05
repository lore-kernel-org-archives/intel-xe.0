Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A821CD5BDF
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 16:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D89810E90D;
	Thu,  5 Sep 2024 16:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kK+nkD29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7991810E90D
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 16:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725555126; x=1757091126;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e69bV5g3BXcFHiySTYQw7favw+ImFbYEwm5ZNLp0c7I=;
 b=kK+nkD29e1BSNoTbWrae/faJBnQu4goR8rIBsiNfLBnrsIIBTmSS0YMW
 mt00kPuHP9IRWCKianQNYUFggvFE3arDCttRPIIMYIhqznhTkIlQBZpR5
 YbHGyYfaPK+GmKFT4MwSqbMw6ET0aGkm9QSkjh7ijArgX2BdToDvEMirj
 /J2YMbUx0Xk2gGYnWfkiDk1DhrPFufvzKGCIRqPqmbmj9Multx6KnrUUQ
 /STzkCqmywlgU1L/tU9pAUayZ/mqa2MI3/0+gAQgwEVI+zE74+5gQF8F/
 RIh+nURGUHNvgaL5LBDhmJiwfDE4KpBW8Mcs/pP59V67n4I+A0yKg/j9V w==;
X-CSE-ConnectionGUID: fC+FAkIzR5WdGc2+SM67dQ==
X-CSE-MsgGUID: zyi91LObTZ+8y++PUSScHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="46816628"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="46816628"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 09:52:06 -0700
X-CSE-ConnectionGUID: hcw1gxwOQXWvfdKzYWIXpw==
X-CSE-MsgGUID: TzGiKhnaRPWUKmN7vu8ReQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="70607754"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 09:52:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 09:52:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 09:52:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 09:52:05 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 09:52:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4ue6BYfAVn2KjwjdKCLMNVNRPUK1OY6DY76SYpt7WBV1cosYkUUqk+E0uzhAsT2F3eQ+/jPvlM1mppnzctLpevzUB3vGRHef+bwGSstrT0lIDWXOXYTHpu3btNO2zAZm1sck8cgcHbWQJTX4xZjP02QJbPaXPotHKhu8D87Pr5zy3JDb7up3nehHqpbPn6h00Yo+5lnReKFE7WFrdGvUjGEY6MRLJpCtIL5V+p2DADBuwDbMfWH5zploh5ZzrMl99Uhqki+e5KQMsyI76AQYGlLH8xOUbMM6cgjJQ64dPRuzQSOF0QDV6Ac8b68DXjFwU1OITRdkJzCLEM9kinE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zh43HRm/yqpwJQGms3KUm1CdVrQGhGkjnAkE+CuWsPg=;
 b=jCaIqElnmBFVJ6um1NaVCorIuhmxT294VsKn/6yRIFsfzUCOEN7tg0kgTgwmJTpr4tuf2lq6ivHbtHgFUp1Ppf6io26GCazIb0GtmVLdlnWN1VfRNfbnBXx0E6K8GySX7L4I72SWGBTNdebSaDCceIP68Gdqmc+M42hSlK0YVXYdOe9j/AOQfloMyW9aUGhlFQVeNJ/tUeerh9aKrL7ghvyVTtBFvK1+XCvWgItkIC0AeKZp05l2NYbTC+HctUnk3n/eWRbPsdK2WPHxRo15cUW6Dh/8G1GKee1cwMbQStkJH/jnupMxNbo2FTMuiBL1BFj+bUYrBeLZaGk/tub4eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6573.namprd11.prod.outlook.com (2603:10b6:a03:44d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 5 Sep
 2024 16:52:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 16:52:03 +0000
Date: Thu, 5 Sep 2024 11:52:01 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe: Wire up device shutdown handler
Message-ID: <bqqgufbcacxf7ix5nsveuvb3lr3equnm7otlkr5opw73f3are3@hu3b7zr2dko2>
References: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
 <20240905150052.174895-4-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240905150052.174895-4-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: MW4P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cd4ca23-e1f1-4432-1988-08dccdcb112e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Lr3DpJAq3gpYM8Cc8pFcT5E7eLS9pDT+h61jjFHGTrPasTSyWKv7C/Ygzs1k?=
 =?us-ascii?Q?bSNjb+nH6VAXy32rTl3ppJcc2DJZUnSRetTYuU2QfOazqybk44/f4bTWl6f5?=
 =?us-ascii?Q?S9hhQN6TIleJKgoiHlgnTeB4q3WRWZG7eMGYYeljI7SdLKNDCZnEMZgAy7v7?=
 =?us-ascii?Q?TpaiFoXLML8l/LIqcZ4BhMICeGyVtY6EvZcyEfKd2l3ofPXRLaIcN3smChyi?=
 =?us-ascii?Q?MrklCLXgyyDLFlizVPpsEL8or042wTxhZ5lqSm21J4RYtROnH1bWmTeIXnkt?=
 =?us-ascii?Q?Z8pzSsQHSemtuLdjqtQlufxvTbopZdqAfdxBhyrozr8RPvLCosvJOEHIhI8L?=
 =?us-ascii?Q?TSN3L+TybozWikFdZw1aMSRu0tnz/KBeVSmhn9/SMuRC+9gyGW2X0e403P+C?=
 =?us-ascii?Q?9Z2eY3gulJ+oYYIzIp8LbYVNqoaCY9d4UDyBD9rAZGJ99EbAeCkrixx1De36?=
 =?us-ascii?Q?hm2H6gkZNy1xoDMUtB3+5s3ONmfvSv4yj3/pCxspM1bMJn/hiF/2DpfEvEM7?=
 =?us-ascii?Q?tu0mqfZ/rxEVjz+xLVXu+oWWAhwzrVS00JMJwjjBSSj0z3KJf1luORwmD7ao?=
 =?us-ascii?Q?xi96J6m1R0Cz1dOTdF9YzHh/k4xSTexb7nwzyQSWhyjL3EBlPFT/SXSizRxX?=
 =?us-ascii?Q?S8S7YZ24gqiwXIjRdyFjTxAUgfjhEBz/elptOyOw6XCb9CIPXv/OP5pfAWk3?=
 =?us-ascii?Q?jXfgrC4diNB+tOizSHqGj+kWmkY2YowE+nxypEFbI+YsH/FnpJJp1x0p0lBx?=
 =?us-ascii?Q?XO8XwVa9Q1E6KAOIF4FclDnbiaj+O0jGoDDRBcJVZWoRtFW7IZyP08Ddw16b?=
 =?us-ascii?Q?DdioBwgE3cyYCY7TXkLbsSXqpyhDvR3q9JcDaZxITtXd1wGs2IbCRsvApz/D?=
 =?us-ascii?Q?TuDkHDo3HLHAlZiwvoIEXaxgq3Vl5he1zuPh6+c5otHeQt2DFdPFwiUFi2Z5?=
 =?us-ascii?Q?Zoq4avK5RhEJ5Zmh02/Mvkzjunt9B3O3DS9SN4x1hE+OnT2J65L42BJs8pIn?=
 =?us-ascii?Q?e9zdNHsy4VUIiMftBwE8KG8uskUpJTPuOKM4bITOIeUXdXa25liYGG73yUdK?=
 =?us-ascii?Q?9t7v8iZywvCNmiiNXY4MLFyoGIOTrsfNkCH3zYdyX1g0cVRTcPXxiPdLJbxn?=
 =?us-ascii?Q?qR65TcAza6LfcKFRO1/NaOZC+QLEw1xpzBPQU0ltsLyDdomtt+CrUPWpNsvF?=
 =?us-ascii?Q?ykLs44VR64ItrEym+LTwIO05XoD+EWzIdYNL/VHydhtkHaOSzNty0pjOZIWd?=
 =?us-ascii?Q?+AuWJCixuKfNuIhgH46S94BtT4eVXjUgGRfZ7wEGvJ4lK2kJ04gkmjEQnAE9?=
 =?us-ascii?Q?PuE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Btlo6WfkCk6p2Na8IhRAZvF69VgAFCT5emosOZMIvP6apGK+PQnj6pgTo6qL?=
 =?us-ascii?Q?c2JinSCSgXXIMN/kR3IuQoDxftYj9LcRcPf0NS8Gu6AtjJKFc4r+moKcPDd7?=
 =?us-ascii?Q?eoZdceKAGT4hEL0XiG5SNuhU0hZxt6uueh+sX/kjhuZTTge8xkBCjabtZi+R?=
 =?us-ascii?Q?orFTNnASxbmhhzLhZgFnZy/a29cs9vq+tjXAXgxG0i84TzTCkcZdm0F1/GWK?=
 =?us-ascii?Q?M4yYYQjHdAzv9C2Ac7ztVS+hYDlfhh6q30XfrTiTW1WebhKpP3dfzw3S3F4e?=
 =?us-ascii?Q?Nt2uHZXg+ySdX/l9K+uS2AQjXrIk6/FNFVcgqCoAy+xCtZtMbg3dUOASbbpZ?=
 =?us-ascii?Q?8il7TYgzh498m6XuqTR0YbP6KlwhF/eDYscodHaiTL/xYDJDkPOqXU5QcKU0?=
 =?us-ascii?Q?kxWvZz6y04/7jmT5R/pa3mSW3ZfDKpz0qGL/MGQ/xXk/LLfnoK1k0HcZ49K4?=
 =?us-ascii?Q?FwmkCtencn0xmewOX8UsqpwlR75uxPMQthVKueHGsRxqM4Gh/bI5X2PX6bM6?=
 =?us-ascii?Q?9bnwRW441k8DsNMBXmRWtNZKAHqhUxU/TK4wtQGO9JkUjfbr4NSE2hV0OYZC?=
 =?us-ascii?Q?9fM3G7vngNJ7WUVM7tYVlXi6kpxXEuQnHTiQNfaW32hw3AR++YwH0DcSudrE?=
 =?us-ascii?Q?cA4RZ79Ix8obMYCPy6z7JK++70eFhklVK1M85x3YLNHDm4oCNI92T6hxci3l?=
 =?us-ascii?Q?Qwx4NJ62OfGNsSPPMFqrw3JJi5/GTVH0UxqtfPJcpjvRrbxDA9igWXrcgZSK?=
 =?us-ascii?Q?6PDTFm7OKXD7ZrXLUMt8LyJLwPR53pPZ6wM6KS6GWF9C3wQV0UgArxh3bYZq?=
 =?us-ascii?Q?2AIA9/Dtj9F6sioKkCDjLzxxstBR9+gecdGnIwtI8SM2XNPxFXH3xIe+c4w6?=
 =?us-ascii?Q?M0tcPKat+SL65MyztfYMhYbyzecPny1qK5dNZ62wXPOsfF3VvY5yBVRIOtwi?=
 =?us-ascii?Q?TL+ot/AbvSKXNaGW7Se7xBI4mPWieub1W6wCkvcCEDpm8RienUvQX8gztjVD?=
 =?us-ascii?Q?vhKX/nnb2gpZ9/rh6OKZNMrpoAEmoGrP4N9XjIlgEj2ntCRPLRfvKmDT3UFn?=
 =?us-ascii?Q?PKOi2nWtBjq4VO3V8buVpzmw4eT311Jcgqys/VpE5hB3pvCnwG+ia7mPYS75?=
 =?us-ascii?Q?XvUrvuQ+mI9sEhqhGcrI652/j3HkWX9FEUh+PKA0Oy+yhR7coBoR4eXIes9Q?=
 =?us-ascii?Q?Xw+zzQJ/3ZfI41W9Hx8s2Z1wGq7hIMbesa3NsfLB3sTH8h5p/tqFllxQjtQs?=
 =?us-ascii?Q?sUGDoUS9lxOg49GlU+tS/7agkg6141BImLPT96NugHyYJt4l7r6P4sGS1Dmh?=
 =?us-ascii?Q?zUOcBpHgQRi7+w4UuAl7+QOfVIb8VMABHUqCiAiESU1G8m777GoxgJN6xvPN?=
 =?us-ascii?Q?CsjMDEtxLKiXRcaRWy73JiYUXXblepA6lI73O35mTqXnqUPGGUN1XIm1Suh/?=
 =?us-ascii?Q?e54NBPcGzuwt74rRfm0sR0utblfphvba3ksHHijQGORWlLcrCH9NM4D6oQ1X?=
 =?us-ascii?Q?0ZEl09EK+SOy5IwBZ6get2ue0DGGYj2IODnLbgP5E12pp6KkEVqfApwoA9aS?=
 =?us-ascii?Q?aIaVoQLai2hLjDzSQvDPWQBaeXdaOc0mY1vuEnfqBsFoiAQVflvPiDGv4TVx?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd4ca23-e1f1-4432-1988-08dccdcb112e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 16:52:03.2058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OHrfzxXq+WmG7JvkqNa2hansgx6Q4vcS5UEx1F7U5+4rqqA+l/iuOuKiqCFJ4gtuNTqUYVrbMMffTt49CClkqE4M433H8hjJQhV1l7FI7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6573
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

On Thu, Sep 05, 2024 at 05:00:51PM GMT, Maarten Lankhorst wrote:
>The system is turning off, and we should probably put the device
>in a safe power state. We don't need to evict VRAM or suspend running
>jobs to a safe state, as the device is rebooted anyway.
>
>This does not imply the system is necessarily reset, as we can
>kexec into a new kernel. Without shutting down, things like
>USB Type-C may mysteriously start failing.
>
>References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3500
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>---
> drivers/gpu/drm/xe/display/xe_display.c | 43 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/display/xe_display.h |  4 +++
> drivers/gpu/drm/xe/xe_device.c          | 40 +++++++++++++++++++----
> drivers/gpu/drm/xe/xe_gt.c              |  7 ++++
> drivers/gpu/drm/xe/xe_gt.h              |  1 +
> 5 files changed, 89 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
>index 33071ac3bc12d..0cb8eef1b095c 100644
>--- a/drivers/gpu/drm/xe/display/xe_display.c
>+++ b/drivers/gpu/drm/xe/display/xe_display.c
>@@ -350,6 +350,36 @@ void xe_display_pm_suspend(struct xe_device *xe)
> 	__xe_display_pm_suspend(xe, false);
> }
>
>+void xe_display_pm_shutdown(struct xe_device *xe)
>+{
>+	struct intel_display *display = &xe->display;
>+
>+	if (!xe->info.probe_display)
>+		return;
>+
>+	intel_power_domains_disable(xe);
>+	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
>+	if (has_display(xe)) {
>+		drm_kms_helper_poll_disable(&xe->drm);
>+		intel_display_driver_disable_user_access(xe);
>+		intel_display_driver_suspend(xe);
>+	}
>+
>+	xe_display_flush_cleanup_work(xe);
>+	intel_dp_mst_suspend(xe);
>+	intel_hpd_cancel_work(xe);
>+
>+	if (has_display(xe))
>+		intel_display_driver_suspend_access(xe);
>+
>+	intel_encoder_suspend_all(display);
>+	intel_encoder_shutdown_all(display);
>+
>+	intel_opregion_suspend(display, PCI_D3cold);
>+
>+	intel_dmc_suspend(xe);
>+}
>+
> void xe_display_pm_runtime_suspend(struct xe_device *xe)
> {
> 	if (!xe->info.probe_display)
>@@ -372,6 +402,19 @@ void xe_display_pm_suspend_late(struct xe_device *xe)
> 	intel_display_power_suspend_late(xe);
> }
>
>+void xe_display_pm_shutdown_late(struct xe_device *xe)
>+{
>+	if (!xe->info.probe_display)
>+		return;
>+
>+	/*
>+	 * The only requirement is to reboot with display DC states disabled,
>+	 * for now leaving all display power wells in the INIT power domain
>+	 * enabled.
>+	 */
>+	intel_power_domains_driver_remove(xe);
>+}
>+
> void xe_display_pm_resume_early(struct xe_device *xe)
> {
> 	if (!xe->info.probe_display)
>diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
>index bed55fd26f304..17afa537aee50 100644
>--- a/drivers/gpu/drm/xe/display/xe_display.h
>+++ b/drivers/gpu/drm/xe/display/xe_display.h
>@@ -35,7 +35,9 @@ void xe_display_irq_reset(struct xe_device *xe);
> void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
>
> void xe_display_pm_suspend(struct xe_device *xe);
>+void xe_display_pm_shutdown(struct xe_device *xe);
> void xe_display_pm_suspend_late(struct xe_device *xe);
>+void xe_display_pm_shutdown_late(struct xe_device *xe);
> void xe_display_pm_resume_early(struct xe_device *xe);
> void xe_display_pm_resume(struct xe_device *xe);
> void xe_display_pm_runtime_suspend(struct xe_device *xe);
>@@ -66,7 +68,9 @@ static inline void xe_display_irq_reset(struct xe_device *xe) {}
> static inline void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt) {}
>
> static inline void xe_display_pm_suspend(struct xe_device *xe) {}
>+static inline void xe_display_pm_shutdown(struct xe_device *xe) {}
> static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
>+static inline void xe_display_pm_shutdown_late(struct xe_device *xe) {}
> static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
> static inline void xe_display_pm_resume(struct xe_device *xe) {}
> static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 1a0d7fdd094b5..a2ce7454794f6 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -383,6 +383,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> 	return ERR_PTR(err);
> }
>
>+static bool xe_driver_flr_disabled(struct xe_device *xe)
>+{
>+	return xe_mmio_read32(xe_root_mmio_gt(xe), GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS;
>+}
>+
> /*
>  * The driver-initiated FLR is the highest level of reset that we can trigger
>  * from within the driver. It is different from the PCI FLR in that it doesn't
>@@ -396,17 +401,12 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  * if/when a new instance of i915 is bound to the device it will do a full
>  * re-init anyway.
>  */
>-static void xe_driver_flr(struct xe_device *xe)
>+static void __xe_driver_flr(struct xe_device *xe)
> {
> 	const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
> 	struct xe_gt *gt = xe_root_mmio_gt(xe);
> 	int ret;
>
>-	if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
>-		drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
>-		return;
>-	}
>-
> 	drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
>
> 	/*
>@@ -447,6 +447,16 @@ static void xe_driver_flr(struct xe_device *xe)
> 	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
> }
>
>+static void xe_driver_flr(struct xe_device *xe)
>+{
>+	if (xe_driver_flr_disabled(xe)) {
>+		drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
>+		return;
>+	}
>+
>+	__xe_driver_flr(xe);
>+}
>+
> static void xe_driver_flr_fini(void *arg)
> {
> 	struct xe_device *xe = arg;
>@@ -798,6 +808,24 @@ void xe_device_remove(struct xe_device *xe)
>
> void xe_device_shutdown(struct xe_device *xe)
> {
>+	struct xe_gt *gt;
>+	u8 id;
>+
>+	drm_dbg(&xe->drm, "Shutting down device\n");
>+
>+	if (xe_driver_flr_disabled(xe)) {
>+		xe_display_pm_shutdown(xe);
>+
>+		xe_irq_suspend(xe);
>+
>+		for_each_gt(gt, xe, id)
>+			xe_gt_shutdown(gt);
>+
>+		xe_display_pm_shutdown_late(xe);
>+	} else {
>+		/* BOOM! */
>+		__xe_driver_flr(xe);

is this just so we don't read the register twice? Not really necessary,
is it? Otherwise let's please add an xe_assert() so we catch in CI cases
that this is eventually called in other paths that shouldn't.


Lucas De Marchi
