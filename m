Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B061CC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 19:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D0210E474;
	Mon, 29 Jul 2024 19:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JS18WH23";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7734E10E47E
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 19:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722279625; x=1753815625;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C96ll1TTpUlPk+oY9oWdKGnIb1uvvge7wW8wVKlCI6k=;
 b=JS18WH23fuSgN5PXT4CAH7lk+LdIkhs4ToMbfF+qc2r2NjcXfmmE/R44
 laAZS1qYr0Wn72bkIeGcUs3e9rsxsE5IYBqV/cYpsmyjjDoXYVOH8xzBT
 ZAJXceF7cSqGdgJIV3uirftbkzgxxf0dAxGoaLR68QTOvsbGwyP5e4DYp
 aSTH/yOfB6p1EBS8qB9aiDkNQlITCI4trVRrknKE0M0vLnAkRKwShuQeT
 p5dm0USVFL7f/OP3yUOyjgfbHpLcdsbs0TDdFcPYcUvel8QE5sUJKnRYV
 oRRGviyugXjC+rvy6yx2tBbdrPrqqK4LBE2EFx+wp18xT97q1ZsECALy9 g==;
X-CSE-ConnectionGUID: wqwQ/9yCQvaQktbz+XBU0A==
X-CSE-MsgGUID: AnTr5ZeYTdeZZf6EZo93pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20240181"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="20240181"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 12:00:25 -0700
X-CSE-ConnectionGUID: C4t4cnP1SkSVof+inJRQ3g==
X-CSE-MsgGUID: 7TgL/tyjSJ+kFC/RYvcPdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="54047876"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 12:00:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 12:00:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 12:00:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 12:00:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIFG+lVhBszS8/+JPg1+i9UEFI4e9EYdNgq7fhnDUG7/RFzhe3fRQSb8g2lyCcfmYbMD7L+W3k0heAqN8vWQpmpUOe92Sm6AHnIAV0pGjK++aEaW3hjPWRjNHCWpvlSaYHzFDemyNW/j+686jtU3i4mcHppstA5+UZYCk/g7weR/qeRQCC8sMArDEqWTFOAPPK49DMJVFtvz0EqkgOno9UxDmXfR4hJ2svzkFFjvAnHLacIpWocy0pg7StSUK+zHO134WoPsXfK6tCeJgN1o0FsyeppTb/pv+FlUw+wnZCOamOTRQJWujz91S7lQFTXmU4xOTIJwOZ7jcrSUyBZTxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kx2+ecsEFqvpYClff0ouFq6+zRYfbDffdfT9eFhCxUU=;
 b=iPfwQDspxMrjLTBlYkT1cpZeZ4uuS7NLhoH8I08WyWynJfa1mgJhNP0zry1ypYojrx6gAID6V1zX4U4xr8eNhpmEb6SrBdZ6xSav9B/35txffqjhptYMgO/eHWYBvEOjCuLhRU+C0RVjPLQIIKQL1lO0M4ySMiy8h3SFu9l3104y+GiYQ44xRX0dqFbwH+q+exz8s0DzTpPFyXqIlB7YCJq26ODj858x825wF+eHsMznDVd+vfrBm7VAKmjKmOVqOx8JI5wOLIt28H8t/KfEd/T2eAKvhzdnal7U4dcRiM+TCPTy6WkxyKyO/YY3FRdGrFiV3YTdzKRVcL4ogv0dSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6621.namprd11.prod.outlook.com (2603:10b6:a03:477::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.23; Mon, 29 Jul
 2024 19:00:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 19:00:13 +0000
Date: Mon, 29 Jul 2024 14:00:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 05/21] drm/xe/eudebug: Use ptrace_may_access for
 xe_eudebug_attach
Message-ID: <jepcsqz6wsvo2tjazdeaylifuqpfrhy7ovi266nanqlmbbumdl@ics2qyffy5sf>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-6-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240726140818.54304-6-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:303:8d::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d32ee5-0ee3-4cbd-18dc-08dcb000ad77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8Les3fNJlYHa00DNrAOF4Y8E8+73fl7GoWVownBkDFDEPv3XPYYamhM64K77?=
 =?us-ascii?Q?dxzRR1KfVoDOyxvoDrH7YflgK88BdJfhucoyKaPqoNPA4HWgRiTJKM3wrdbb?=
 =?us-ascii?Q?O5M7EtD4HRZ0JExUOl/6ynXBqYjha82zOLaooiYKqBdXeuJ01F2Aro1t4NU9?=
 =?us-ascii?Q?I9sr+sAQSsaghY4hCcGNzSW0W5T0AMVCpueGs797OltX5lA9PVphnc8R80fP?=
 =?us-ascii?Q?KV1ncKX2YzKU4mNxGfK/hEtNRajOfFscZ1vo3HVV3EHljFJLStSrqkfF1Rpf?=
 =?us-ascii?Q?pUmUDdFHre0ZkRaSPLCetspUAORT5uL9iHZfQP3ON5PE+FZnjS+q2LdAIe1j?=
 =?us-ascii?Q?7I7wQe+bzD3huV8Jy6VGqwjXtbdqWzKfRSYNEU1pamUWLi9x6j8ppjYQk79U?=
 =?us-ascii?Q?SS3zBGxVxKdHPFuAhw/kzn0RptrZh1k7MBKOAlSfUo1t9eINHksY8dykO7Fs?=
 =?us-ascii?Q?sRJs3HJz5MrWZoyB5s/qCUrY6PdVzxiFTe1UfrzuMinM75AGzgzLCZUaoy8K?=
 =?us-ascii?Q?WKhqo7XHrdGyFv4BUUSTzDFvULNGzWgiAy+SsehI4zJ4QxeLWtIz0CfVD429?=
 =?us-ascii?Q?OBUXFeWBNmSnCyyQ8u02xdkQJ60A06ncNYYcXRr1t8Y/y3jPP0A7RfXBDaMD?=
 =?us-ascii?Q?ypQXJ9HuE7XCy5ebSLGzfV09MaZebCvBYxlTDqQutSZ4qvQkFfIa+IQ+wTxQ?=
 =?us-ascii?Q?fyficH6FPnLVrHy4loJrsNWPVsAM3ADN0dGSNEdMbBDx/z7kVKomBoO9pKhw?=
 =?us-ascii?Q?+9gx2ZqhhCgVa8zUuBpjs/zjgjD194BkUS7SCRAwB+h1ARBcU89bzWQkMTqE?=
 =?us-ascii?Q?XrJ/AuWrYRdQx/nH5tMFPaLQxo6+rXhZEAIFdInICPCOtemIyzvXcMWn8saB?=
 =?us-ascii?Q?DtOn468gkNEjzz4xhv+VUt1oBWLUQGPhC/LIG/2rIELad0yhPqPi+AdPF9wO?=
 =?us-ascii?Q?hYtHh4C70j2RxcCBzVUntSoHtrcEaZfyg8VjNShoTVXSWeZ/igAioXpyPoL2?=
 =?us-ascii?Q?Heck/KhuYJaG0+Gk9OKkLACLkjYCtZ6DHKdUpCzHFOLyG1UnIEF596ORo8mP?=
 =?us-ascii?Q?MQKkAtVXZMCSiY7pABtc/EIC4ziHgboJvqbO53okWdiAKl0t2Ltys0FYYrEN?=
 =?us-ascii?Q?sb5NQZONBV995PGTgZmXIvHupfAz2far4mOxnoRYZQ8r0znakgJ0oo79wl6T?=
 =?us-ascii?Q?eFAJvdnHYfyOxe83cH6cW73bhgb8ZEzJEkUsyD1epXrRBvY1lBS+gMaDBGEh?=
 =?us-ascii?Q?0ErjasU4TWSsD77e0yJfmljTS8Ro0+uEGucf0c3wTkELYReGAfj/UsNH3e0B?=
 =?us-ascii?Q?Kwcxwy7JVSx4S0MsgaMCm3gIV156R83IGxqA9H7aINHOuA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EbZNaTLK6+VlMRbW+n8oUIL5QueJURqi3UscHxtJM407d8ThmlKbFZk5VZ2p?=
 =?us-ascii?Q?UpKwwznIEvER1SSx5napP+3UNLNMYNl0AVx94fAFm85GEyy0nvvhpKGqcS6b?=
 =?us-ascii?Q?QewJSx8yN7tUdoA3OWLuXnSvtxczePm4DamfE3StkKV01HvHy5Hgj+fDWWLn?=
 =?us-ascii?Q?TasbCGjeo/rRrZvtQ+UIoT0J/tsddWCKwb/B1OrD7mYVikejvbpT8u0jxPqM?=
 =?us-ascii?Q?hN2ZO7jQik03e3stfzk0OxTOwMbWIQ2Of/Vajm79iyQm0eTTy/VI5sLQVRly?=
 =?us-ascii?Q?YIVHdhLHKyhJ9tiNbpilamKqH1NEEHm4wFcWShNIj9hhwTTO3LNe4DyNlbEa?=
 =?us-ascii?Q?qoLbBS/WL/fAM37rbXFuQC7J0ACorqw+uRoftB+SX85H1jiWvWman1KKwoL+?=
 =?us-ascii?Q?9Y6KsZ+7ED8Qi1rByqWC5l2309IakBPSo85ifoPa6M9uopgvEeuHc7B1kWRT?=
 =?us-ascii?Q?tZT0QlvE0KZTxdcFqT3FjF00kVz+Fk1fInujwwjC+NfWRUIw95ZubP5fsNiE?=
 =?us-ascii?Q?ja5U0zdyYBpmd88vHiGqky6xkIB6c9HhhKZrzmaS7ZmKMoH3+3RDSnpBuHei?=
 =?us-ascii?Q?PhOYCIF+b6VjB/x/QFNDgJ/VSjsPxPAdUs/dKuvvo4W9NAPGCDXHePBSyBB4?=
 =?us-ascii?Q?PmB+52alCcMe/rideuAPScqcBivo+g2OwGTSOozw/vYY8K4VB7G5PXX4b3/J?=
 =?us-ascii?Q?u5r6aCpdrhbUt3sI3FzZSYj9bfOStl4KPvXH4DMfUuqNWbZBVPZE/UGV3OWU?=
 =?us-ascii?Q?nQcMkWrD3ygCrxQL1kQFEZaBCky8MHZiQ+MKOo9nxTM3UIuIDcFEGROl0Ort?=
 =?us-ascii?Q?XuiAw2ZwLdF/Uk7DsTvfi5p90RyGSFwX+JAsFkyKo0RA2UFlLBfkyaotGod0?=
 =?us-ascii?Q?5frXvDDRiuP7ECFWuKnFY8nw1tQD25uCPLX1fLKlYaTaSETUkTtlynd7PkgB?=
 =?us-ascii?Q?ENlrAKoYdsJKQsEltL4F/rag3UzePfjG9eKNZs8eTOHu5kSciNKbR09Wrk7Z?=
 =?us-ascii?Q?DAIw8tXK00tIRl2ACLufYV+1V7eOKtg86g+x10ZePHL/ysXdAtxiOjGGGqBK?=
 =?us-ascii?Q?Tc31Tc2AYoR3MXD33/XcOPQIyhkXkDnAu3a/ULy0NqchNyitxShULb11d4qJ?=
 =?us-ascii?Q?Yq0T+rZFrS715nwpJ0pGbEKgWtmBmpWPxZRBRGBmCBi8JVvQgYNc0Rdi2xo9?=
 =?us-ascii?Q?joEnYMXj0B9sCccwBI4N5J6yVQ8IPDcSFnWZCpA1ivTJ6l0C2tMexsazxAmy?=
 =?us-ascii?Q?kHzGj3wyzDPk71dUKUr2lMIivhvXcKvUOgmWc4/dI+ekYd6Cqstb1kQixh1I?=
 =?us-ascii?Q?/PFYW5vipHvWDWf0uJlRvNCA2XuU+om8s7opBfPAVaKXPyYXcns+vaGxCuNJ?=
 =?us-ascii?Q?tvDT1dQY2hMT5dC+MiGQGloh4fnT/+QUToov2JZKPYM5hesC3zuvZcYtBbMf?=
 =?us-ascii?Q?Kt5VJ55DJn1CNOqhnca/2EGLZcPQjrngigCtw4WHnBqhQwuHvjM+SVZWc84d?=
 =?us-ascii?Q?TOw5e1CdBZni1wp7Ps7rxwGZ3rxA/vvD23EWBPMJsKzNkvXCPIrqHXAWeYco?=
 =?us-ascii?Q?9XFFNDEXmSIjjGBUmMDHhv+Q5nLnLGSba+/D49LqSO7u7sTWVxIWZkl3e4sT?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d32ee5-0ee3-4cbd-18dc-08dcb000ad77
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 19:00:13.8347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zC8/WzYM6VJYSlPp7roljG0CQFPoM2ELApGKGAGOhSfoLCxNTq2P3ZsWffk1zpsiLQxF10eF3eAvq38ZzNb4stloeEOaeAduPKYoLxs4FMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6621
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

On Fri, Jul 26, 2024 at 05:08:02PM GMT, Mika Kuoppala wrote:
>From: Jonathan Cavitt <jonathan.cavitt@intel.com>
>
>xe_eudebug_attach wants to use ptrace_may_access for determining when
>the user has the right to attach a debugger to a given process.  With
>ptrace_may_access now exported, this has become possible.
>
>Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>


this patch shouldn't exist. The patch exporting ptrace_may_access()
should be moved before xe_eudebug_attach() is added, so it's already
added with the right perm check.

If exporting that is not acceptable (which needs to be discussed with
proper maintainers / mainling-list) then this could remain as a
CAP_SYS_ADMIN.

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_eudebug.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
>index 8aab02824f8a..c4bc66660218 100644
>--- a/drivers/gpu/drm/xe/xe_eudebug.c
>+++ b/drivers/gpu/drm/xe/xe_eudebug.c
>@@ -246,14 +246,13 @@ xe_eudebug_attach(struct xe_device *xe, struct xe_eudebug *d,
> {
> 	struct task_struct *target;
> 	struct xe_eudebug *iter;
>-	kuid_t uid = current_uid();
> 	int ret = 0;
>
> 	target = find_get_target(pid_nr);
> 	if (!target)
> 		return -ENOENT;
>
>-	if (!uid_eq(uid, task_uid(target)) && !capable(CAP_SYS_ADMIN)) {
>+	if (!ptrace_may_access(target, PTRACE_MODE_READ_REALCREDS)) {
> 		put_task_struct(target);
> 		return -EACCES;
> 	}
>-- 
>2.34.1
>
