Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C74C36017
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 19:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087FC10E0F4;
	Tue,  1 Apr 2025 19:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRXhx+SJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42CC10E0F4
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 19:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743535397; x=1775071397;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eylNaghqm8ltgoGFR+jcYtkvUbGrMm1hweUyHiJ707A=;
 b=mRXhx+SJeQuFJb7cE60vQabqNg3O39COgmbPeCA4hQDpxkpcuFPHfjpg
 jo2SDDG0ifDtI2xhKZXCDPgBfNXD+5ZvWz5UeDuPA5x/8A5a0HJ7SZldO
 fWriNxOSfxSFB3WqtRLl4eU2h87mUGGaYHccEYbeOPJUWmdeGq2LEdEaK
 VUL27iIeHN+TU2OwwFxRcs2pcGEjCdMAQCnABL6g39OvA3KPKYSnJpzrr
 AxRH8pDvtyIFnoQDN20kwHkeA+3Z2IicD7usBYb9maI/cJpzGfhwAqL9J
 HGjh8B8Pgp227Mhx7nxOerOWmFXZJPTuTYfhJ+tzjGde5DeUgxaNtX92Y w==;
X-CSE-ConnectionGUID: ES/oiTQVQZ+96GIqfdgsUw==
X-CSE-MsgGUID: OBYEP/tTSwmfAEYDjNeyVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="62277663"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="62277663"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:23:17 -0700
X-CSE-ConnectionGUID: +n/SKL3UR7GTuugHGx7uXA==
X-CSE-MsgGUID: wYHcZxRaSS2yPPfhoZ9ipw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="126375380"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:23:17 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 1 Apr 2025 12:23:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 1 Apr 2025 12:23:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 12:23:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWM1TkgahpTqlDzSliylIPwhd7UAgxxhI6HdkIQ7WuQw12d77OkAJ4qK5R5iTtVmCCFjMUQIopRXWYeWCV3Zf3NHPuNSnBzZ/KL/WdtQZD84psT+96i9tE9QI2BQ/Qvpq0R3YEXIKB5il/mP3lY5l+X0DyDKLRJpL8fw2ZheMohNXFiMWTyYmNaIqO+/zRD9xcVLsrjnrpEm7OLFlqfFIagzmSW2P2XBFqNUFK4LTIXp7yWnclxD9zQ5Rc/c2H/syfNatqaaIfFvUn3zncKvsVKQ8Oc1Kv/kSPf+4GsjX70DqTv795508+qCRzaPgkJFSjYCJqTqJ+6WQaeJiOapdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmzIyEQLpzpjn53G9E5hVEqDK6/FWBgvOzR+5HW6e1E=;
 b=h8NIxkZlgc1CzkXjVAbHnvUNaWPFhPDg6VUnVBnJM7JUNeJmjl0/9D9vVDhj/2omlUO4oJUZXsY7l8gLAZa6uRk30xZukiMGXuex5zULQuZ0tLms30JFY+Lrjdnoby5JdQGL3WsQpl6Xh25FATnOs2GHyRSjixSUZHD/5vVWNLsr53r8JWMhWIKos5x5RkyHNFdQZ4N8Nq8miyT+zrxgtfRgOmYSHXC6rTkmxM8oQHxGpvZSJpKoOIlauoAHP4sY7Y58aGdJ8FwS90dNW5Gz999xyIgQRNDsv7nTt/QFJJlleuc/Qn+kSRvJGkEnWK+Xlq5Mb71FwpCM9TbeM6L46w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6038.namprd11.prod.outlook.com (2603:10b6:8:75::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Tue, 1 Apr 2025 19:23:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 19:23:13 +0000
Date: Tue, 1 Apr 2025 14:23:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 8/8] drm/xe: Split init of xe_gt_init_hwconfig to
 xe_gt_init and *_early
Message-ID: <ux6jwr2zycscpe7265gfyg3yp5r5uxfruhym3qi7zj5nh5f3ih@c3uascv77b6m>
References: <20250310200653.89731-1-dev@lankhorst.se>
 <20250310200653.89731-9-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250310200653.89731-9-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR04CA0208.namprd04.prod.outlook.com
 (2603:10b6:303:86::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6038:EE_
X-MS-Office365-Filtering-Correlation-Id: 6792c089-9663-44f6-aa90-08dd7152a59b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zj69gHt+M6mxBoyzVcH6X3EVZJ1m5P9Aq4x6ygzVzkJHpx8vXcAn/yMSwemU?=
 =?us-ascii?Q?E3hqfrRtRQvx1yLLokq66r08kzTM5sYK+ywLwrFV/PfQVdZoEgGYp1TlGFBF?=
 =?us-ascii?Q?c5nXU3QQDdM9wSQgeCYMrgFjPITc486tWGEOzMo1XeQ6F2y59KTnQyIA0yuK?=
 =?us-ascii?Q?2JJS8/F0jEqcKUsNJhpN/1XrUnDai0mz4pJpVRe4IoP1Uhs7Dl/Dzp/QQZk8?=
 =?us-ascii?Q?V1XwxpT/pWVmImAW8Hi3b/TVcInIwlVQ3NIFUr87N8vSLsI5hXePFw+1czG2?=
 =?us-ascii?Q?M5cBemIxwG6l8rTfD7EvZ8HlbatS4UpAaDdfSmmg7XIyRMqOqhsjA6dMyWiN?=
 =?us-ascii?Q?OC26VmfBWKmsz5hWSFFBMnZCsbFVLQs6Y4rUxblOLgFG3E2+G4QnpZ7UFVZh?=
 =?us-ascii?Q?dXenac4Ca5AWcqdTeu2OIEoNoItk80rhZIpR/haHs3DVJoGEYcdgC2DDnPmG?=
 =?us-ascii?Q?zipsJQKQJrDq0R9ecSu3Y7NKNyvRXEPC+8SZBa9rk+2pUatkPPq2POD8jTaC?=
 =?us-ascii?Q?4wzfRnSEFw6GwIzMR/XKciACkSaIJb/68ARORIQ4pYSZrEMORXHLTg2LDr9q?=
 =?us-ascii?Q?Yw1cOErNBJM1j5l9M88y9G2vSj5/FfwL3CruOFzZ/U+ThfX1AbPFfGOhu1Za?=
 =?us-ascii?Q?HhRfB1XFn8gEaCb1JeOkaOnBl3ehXkF1/4WGhHekbtVbHjXWiBc0RL1zUJh8?=
 =?us-ascii?Q?doDk+AzktvGftbWchnhW95m04uMtrIMr02wTS2kdk4fDP/14JNifRGDlQ7Pu?=
 =?us-ascii?Q?SimUsosiZuUHaEdnJyoHIIe62btCj83k6QSPjzFv97Jwrn4dfFE79TlIkWU6?=
 =?us-ascii?Q?Ux/9OSiBw5PAxeCwQGQ0rOtDp/hqhnvcl66KDqSmB9hX4slRSd3D1WbMK1zr?=
 =?us-ascii?Q?tWZBNb92408248nLPmr/BFLtqDd36/0uoIOe9+ryiZYKIw5QwlEtzBE+BBtb?=
 =?us-ascii?Q?+jigz+BsqV15yqjKxb/T0YiMRf90NpTFZzUSNf6pQqCXvP0j/fAzZrGWLEA/?=
 =?us-ascii?Q?skmaCQwW77a9LW8QyjGNfGiUUJ8DF9Wk3hvVA7ZE7MDu7NdwGv4cXT6kV40L?=
 =?us-ascii?Q?6gCWGG6IoK/052Uh3KlkaUZduhyghVceGuvt9Zw1F8vo/bxdCIDWI+Yz/bkc?=
 =?us-ascii?Q?IKCk67fliwqyKUlUHuz3GhaQRGqUfKveGp1Bo0kiL1lsZVIYRuQq+pimXz9i?=
 =?us-ascii?Q?0OFcvLn7J89t2B8KeHGdibmRQVzHwkrgKowq7hZ6dPkzEFb+TElopxo6AdKY?=
 =?us-ascii?Q?xyWrxFcVvHh8QuSLqjOmVyfAg0jDi4Xym0Nk8dtN08XS1sg8enRSKnQ93ihm?=
 =?us-ascii?Q?hOpIKHsFfrDjbD37VKIslvnuCFYdLUF4AY90VKL4Kt6rG1gfWl5vZ0/rzcJQ?=
 =?us-ascii?Q?8ylQ/T4INv56F8yS86oncRXArMih?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YxOcJ2eiQo+B/otJDjdgx3uz6KFVbhbUbkMd9s/FIPxK6Ip+3Rp9QkPWvoML?=
 =?us-ascii?Q?DQCD0ZLMmRx5fLoG+UaY6F4a4/lwMSicUUyqZZz1XgHiWCOSuiQFYwOgnvaZ?=
 =?us-ascii?Q?MSpkF/ze8cF2k+01jYDNJ8jYlZtG7lzi7JuHUJuX6CKY5iNVjetbtScSAeVg?=
 =?us-ascii?Q?UIFUL7mMArNHnJ62nB8ca7kmRk1BZP5DfkOrWt2E54odarqjcbvrv1uF3S1d?=
 =?us-ascii?Q?h4EXz95d7Hn6/NyLn6nkBdy3SnNHgX6gsTeNctwqs2GZ0BTpfYc5jBC9Ys9b?=
 =?us-ascii?Q?qc2aDp4m5lP/OQcHg5M0B2QvtBuvKEMsgjBH5BhyHkTExYeFofBwUejVcUFB?=
 =?us-ascii?Q?fZVAtKDfuk/NsowI7r85ijU+y+v5M2H2QMdSTFDZG/Vc8rH91EOa7jJYDNAk?=
 =?us-ascii?Q?W/XosvOeKaSWqzG8pl70JjEu2vZh7e1DfL+GTyS2KTviLxd9xS4TFh1cgv6K?=
 =?us-ascii?Q?EeU8/3eDXx27ySINNh5Gh/Twt1Sh/VR91o3rg8bCw0SkgtbD7HoQLEoVL4mE?=
 =?us-ascii?Q?Q3vYXLIFz2kEHEgfwYi10i15lQZpfNNgcXhURCZh6NnIg3HJp6czUkrlhkeR?=
 =?us-ascii?Q?uwYO73aOArOuRqUE9BQUhm5amNB2bFVwfho5yWeVtSkxB2NM6DF4TzcjK1Gz?=
 =?us-ascii?Q?ERaHTT6x/aH89LMWAxKwzZfjJQSPZPeIyi/1nGhG5MMJ8upEesT5c7K0T5BC?=
 =?us-ascii?Q?1e3HITyzEbXKlHphmbBBuZ3VfSu0BMjUTzzy5dV/GfZ89qdoo0AakBpMqNaD?=
 =?us-ascii?Q?qL2AA3QiQOFhDZC6HQ79Fh33FHsCdr8zxtUC4EX0UIPdebWiFhXSg8lRkO7E?=
 =?us-ascii?Q?Bt+MRXn1NTdybDKYui3mT2IlSiFIZOa5GrAeCnHKFiShud2JmzN4QieVBvpD?=
 =?us-ascii?Q?phahFHksGywwhTpZgG6Zm8IPiOVx5IsFjs70D0FlKgkIHeJyzt5kwgxIsnGK?=
 =?us-ascii?Q?kKZdQ/pf2u7+HPiz0L4KzTyLPGMMDY9IrGCnYJfj6yeMDwuL7y1ALU4WoaOD?=
 =?us-ascii?Q?XvnDEUNnSPlpR1unoeyo/WsmWreiJp0iJqua63wg85y1vT4QcsKB2ysIbq0p?=
 =?us-ascii?Q?Y2uduo4PPPslH7Q2p6IjjyW9pNvGFEmBNcMZql/HG8kZf/zbLBTfD57JReZp?=
 =?us-ascii?Q?ye4FUT/PTqqzJKl6XILdIOcAw05SJ5fQKN9BBzNXfWbOlYlfK+aPQCSWm8Nu?=
 =?us-ascii?Q?VnuiBcC1zidQrZqjjVrtipNAyyriVrhQSHq2AkBqGXUOGJNg8kR156nllVdV?=
 =?us-ascii?Q?li5I3ugE4w+GLQor0fP7Futa4OnUje0tUvJBzU+QxgXqLFtmHckUNwFcVY5l?=
 =?us-ascii?Q?VgmG2fYjNaFr+hweFkCQauPqrXT/fvwmwtQ+mRsd/Awl9v+DUnIflY2I9hrS?=
 =?us-ascii?Q?PgJN12nbCluF8fPr4J2xVQcH3asm0TsvH+58B1DhGrdJHtodSvrBIGwZ7buS?=
 =?us-ascii?Q?C4HQJ9/28Yy2a1nugQ8x0wz7IXhBDINrcBdlieIEbpF5Rl95CREgjRTXjwuY?=
 =?us-ascii?Q?BuNlFke8YeassY9vDDEctMggOiCtdTLi8ZffnTKi/h1axhTQhazUmLTygVtz?=
 =?us-ascii?Q?VQjPZsq6rWJQ/7pF7lz3eT+W3eug0LW+pmaI0qJVtoZ/84BwyOcs99LV190p?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6792c089-9663-44f6-aa90-08dd7152a59b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 19:23:13.8207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ADhHid6xhdw3sM3DxNXD2SVXqCll0Twu+u5oWCo0/KEGmHzDJjCXDI0ATP3o23qHdUOValDNzncNMkPulkbHRs6/jKNss3hYwFZSYfbVeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6038
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

On Mon, Mar 10, 2025 at 09:06:53PM +0100, Maarten Lankhorst wrote:
>Now that we added the separate step of initialising GUC in
>xe_gt_init_early, it should be ok to initialise the minimum during early
>init, and the rest after allocations are allowed.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>---
> drivers/gpu/drm/xe/xe_device.c |  6 ----
> drivers/gpu/drm/xe/xe_gt.c     | 60 +++++++++++++++-------------------
> drivers/gpu/drm/xe/xe_gt.h     |  1 -
> 3 files changed, 26 insertions(+), 41 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 343f7ac67eaee..0eb6eae65a52e 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -780,12 +780,6 @@ int xe_device_probe(struct xe_device *xe)
> 			return err;
> 	}
>
>-	for_each_gt(gt, xe, id) {
>-		err = xe_gt_init_hwconfig(gt);
>-		if (err)
>-			return err;
>-	}
>-
> 	err = xe_devcoredump_init(xe);
> 	if (err)
> 		return err;
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 31aee3301a76c..8a8882c909bea 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -348,6 +348,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>
> int xe_gt_init_early(struct xe_gt *gt)
> {
>+	unsigned int fw_ref;
> 	int err;
>
> 	if (IS_SRIOV_PF(gt_to_xe(gt))) {
>@@ -382,28 +383,9 @@ int xe_gt_init_early(struct xe_gt *gt)
> 	 */
> 	xe_gt_mmio_init(gt);
>
>-	return xe_uc_init_noalloc(&gt->uc);
>-}
>-
>-static void dump_pat_on_error(struct xe_gt *gt)
>-{
>-	struct drm_printer p;
>-	char prefix[32];
>-
>-	snprintf(prefix, sizeof(prefix), "[GT%u Error]", gt->info.id);
>-	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, prefix);
>-
>-	xe_pat_dump(gt, &p);
>-}
>-
>-/*
>- * Initialize enough GT to be able to load GuC in order to obtain hwconfig and
>- * enable CTB communication.
>- */
>-int xe_gt_init_hwconfig(struct xe_gt *gt)
>-{
>-	unsigned int fw_ref;
>-	int err;
>+	err = xe_uc_init_noalloc(&gt->uc);
>+	if (err)
>+		return err;
>
> 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> 	if (!fw_ref)
>@@ -411,22 +393,20 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>
> 	xe_gt_mcr_init_early(gt);
> 	xe_pat_init(gt);
>+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>
>-	err = xe_uc_init(&gt->uc);
>-	if (err)
>-		goto out_fw;
>+	return 0;
>+}
>
>-	err = xe_uc_init_hwconfig(&gt->uc);
>-	if (err)
>-		goto out_fw;
>+static void dump_pat_on_error(struct xe_gt *gt)
>+{
>+	struct drm_printer p;
>+	char prefix[32];
>
>-	xe_gt_topology_init(gt);
>-	xe_gt_mcr_init(gt);
>-	xe_gt_enable_host_l2_vram(gt);
>+	snprintf(prefix, sizeof(prefix), "[GT%u Error]", gt->info.id);
>+	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, prefix);
>
>-out_fw:
>-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-	return err;
>+	xe_pat_dump(gt, &p);
> }
>
> static void xe_gt_fini(void *arg)
>@@ -471,6 +451,18 @@ int xe_gt_init(struct xe_gt *gt)
> 	if (!fw_ref)
> 		return -ETIMEDOUT;
>
>+	err = xe_uc_init(&gt->uc);
>+	if (err)
>+		goto err_force_wake;
>+
>+	err = xe_uc_init_hwconfig(&gt->uc);
>+	if (err)
>+		goto err_force_wake;

with the merge of these done later on top,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
