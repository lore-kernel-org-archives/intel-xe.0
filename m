Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025DBCD5BB8
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 20:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3FA10E94A;
	Thu,  5 Sep 2024 20:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gb8pUddO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AF710E94A
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 20:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725566909; x=1757102909;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7jXNOElTI2/ptwjMybHY6lz6SMILMWstiKBz9XB2qfY=;
 b=Gb8pUddOvo78SE62uLZiEsjhaiE6ssGvDKo6m6ZQZHSlzu+VlrVHy8Qe
 tw0jeMacws+jnhjIK6GWnloeTCYYPW2b5q6Ayhrbtq9U+bckSxBH2aSpW
 7N9P4S+/bw3sEJeNzKTRw1T6xtQU/FWQyaaLjXWrmLeyuZyDmizs/8F0c
 WSw2F5ocQsyKgZY3FjjTcFkB6fuz9+V7YAhgU86YzzEZx5ki6/io6FKrI
 avq56748KmzeawUT4mDABO6oG4nzp5fcP12u+ZyQ6jUEX8RxDJSFdPiKb
 Ibh6FOa8WyeP2wQAChjSSLT+41+AeBHzAInBILBpDJDk+Jxs/MKH/bm8a Q==;
X-CSE-ConnectionGUID: csXOiBbkTVa46pJR8amq3A==
X-CSE-MsgGUID: U3tKBT+BRSOPm3W4bbg+Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35664993"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="35664993"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 13:08:29 -0700
X-CSE-ConnectionGUID: zF/LirfmR6Whauf/6BZr4Q==
X-CSE-MsgGUID: LxSdZtuUTMeOanpZzI+BGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="70528271"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 13:08:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 13:08:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 13:08:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 13:08:26 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 13:08:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqHzIhXsClsBeD37hGccbqLnkeclKw2neA9y0ymcJOjBVIsJv4nU87+cwhktqBuYfxGRyjJMGPsBPGcvu1PL8pkQ+SQiWdWy8jGCn6VRvT2OJOV8f3iT9CXjrMGh3KnuMewQUfdpvmVHWAzhcK8pAT8rC5hM1tF2CLrEMp83v6CYWGcagYje0qJnTV8iSCKrmiPZk6Xk4IMrChTllTNKVyXONDPOvyZ++cVl6ihmq/CB3erNnfPTdR927Pk7Xf/xweYE/WhRPBPuu1AKCcfSVtwGPfx9dMNzBnZU6IqzwcH1p9gg7STzcp+DypPsMHi4zIMILcX+ua4GIPQpV5lMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfEasAkImoqqP8LeEO6x/WjpgUJsgcnNZBvRQNLJn5k=;
 b=WzYKcxr8Mn7//lg+b10rMdphuRAXBfzEDKbU9GEN92us94zJdWCB4l3LZ12XpXjGnyFqQBNGuAWTVf54drdpJM2FEoDAy8Xh0Ff70DRx4pRpNbwQRIFEpc2CCdBfyhEyK3Sa2peyETYsTSIX7TgDjyh386oQDHO2TeYZxHaEpPa7KVjW0uI6m8gO81DGffgLdqDD0WNhaXeeeZAKl0sXGqSv6g8umZe5DlI+UgP5OYU2mCOJM6RlXVM52FJoz5HNYAjAdXtSkKO2y/ktC6nLRdG4vBEd6MH54x6Hoj7fpY6ifkU6dMieA17cJCJEC/KkujxBkV3ElP+S88s+LfAxlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6177.namprd11.prod.outlook.com (2603:10b6:a03:45c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 20:08:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 20:08:22 +0000
Date: Thu, 5 Sep 2024 15:08:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 02/43] drm/xe: Create dedicated xe_mmio structure
Message-ID: <jlfxzmjudryy73i6m4pdjtpzw4nj7brelr6p44gsejydoo63rh@zrh6smbobto3>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-47-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240904002100.2023834-47-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0356.namprd04.prod.outlook.com
 (2603:10b6:303:8a::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6177:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc519e8-0e79-4d79-cbf6-08dccde67e32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?URCQ7DPQGRfnDw0WYa2SRRQOArI0S2z5e2kTrUKC4wJig5UKKp/aoWa252EC?=
 =?us-ascii?Q?2Ig6C8YS8kedkAUqkmribbgpIl8vT8gaJuqxoIyYqXYLKIPoNgWw2HVZ5btq?=
 =?us-ascii?Q?ylLVDJMjwt2t/4r9AWijNnHDO8gIVtjB9kby7x1u4eIUDMSDrvnjydZMStuM?=
 =?us-ascii?Q?ufQZOCEYP98CVUSYDQcV+vKb7eH92BDfpHQfTySpdEa+gockVov2nam1kO9h?=
 =?us-ascii?Q?xkS9CX+IcD0e95PpKwya116LsNPAu1uqc0tVjk2Dc7jELzklTuZ/cXIgN63C?=
 =?us-ascii?Q?eJ0C++6wg2yUq7GSQbdK7SA0VTUmr5FxDmKRx9XAPltUaCCWM1CaqCsg9xAd?=
 =?us-ascii?Q?QVsc6DPe5tFsoPk0D+RpDjFjjSEXyvXQFgbeB8HPon1o143/PbZxPsilx6l+?=
 =?us-ascii?Q?whKlNxMMw1utkwq/mwwR1HW2RF7W7jOnZPUaR/fJFi8uPEj9ydAaMvq+E0yM?=
 =?us-ascii?Q?49tMsGfweLmwsnAgyhQ0irv5DwNTyZ9NMvfx14IKT8JOoiKDrzZfWfggP+o1?=
 =?us-ascii?Q?/Z8//e+EReesfzVQF76RupaabnYHyr21gxJfQsSLeGnpRzIRc9qGqf6uue0u?=
 =?us-ascii?Q?hCRKi6fHRD6UCsxa2TEM5eJmDJ4JjLh8FcntaMjU21E99SmbGi2ySyBgvljI?=
 =?us-ascii?Q?z7wiXr6gLqyAfDJVyQ1CAmeDjaXopR/yduubpcQOCuH+UPSevsBkgoJTz43G?=
 =?us-ascii?Q?Vmv7UVj7zivoZ8tQpmljBWC3LcdOwj3xdETq/uOswNoq47DBy4CWfc3d/szl?=
 =?us-ascii?Q?C2uuuZzCZjWtegPQj1kVYqK0mXryYk7He4Bktu0XNdRdI8lejgnZyyu2Rts0?=
 =?us-ascii?Q?ZZBlbWgw/JJvJhxrwbe6ndRFAfrB8MeaVKMxFsJdzy8VqBTrTCLDZ28NMZgr?=
 =?us-ascii?Q?bhH14eouTUA6iIqHQB96t3yh6udnP6DhNNuUjBXCHXgyix4PGbU709CjsXXE?=
 =?us-ascii?Q?hcozbC8QZ2c5OYq3nhofBONOC35ExLi3LNWuYH4+llgkBBkQ6rqG5eyAm99P?=
 =?us-ascii?Q?z22ZLzx2vyeLLTjlQiCdTNJwSjl2k0v+Hd/tQ+0bgdQ4RLEt/kxyIgC7R4F0?=
 =?us-ascii?Q?RLpcNBpGHwT/yoZpcsjkUO36B8JDTcDD7gEVVimmDLKLtQtCgkWUWwA0kI3j?=
 =?us-ascii?Q?sKbbM2fpQz1FPG/0g0HewPQ3HEz+PWHBMAltBgzJZ/C74Lzm03hs1j9aPP/3?=
 =?us-ascii?Q?4uIxFxhjz8IuCkOwT7uZXIrURZvJArYfHzw+7XaZq04CLVDPSdQsnAOlYzTx?=
 =?us-ascii?Q?GOgCnlWIejHgc/bRp8E1sIm4+Lf2Qcwcxg93tzRpbmxLd3vcioSKRE0iIInK?=
 =?us-ascii?Q?wtnDJNKo3C7l7kfTSawn6luUHszsUCIvdetX1+3a23xk6g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o65fc87g9DzmuTyKl1IuQQoHicyqXy3GgE2e/6V834VJ6cmW/zC+3a8Vbcrw?=
 =?us-ascii?Q?sd0JVU+jNxVHS4wlccQf6T34r/8bI516Mly5nifMCBQSrZygyNbXtQANCPBN?=
 =?us-ascii?Q?XoBdxn6d5siq7IsfGWVJKR8eYhBqrVYgbvJQLM7MMHN9zUtbGQ90tG4W1M9M?=
 =?us-ascii?Q?u6h17GVdv56Md8LJj59RY1LMfuOtSJCgpYbdO6AjUp6zVpyqfYYrIGpwxNe/?=
 =?us-ascii?Q?/l/RpVT71m5IXutpBZD6/WLFqWsR/ZeYfyie2gOsNCtMwfo8YN2bvK/DWf/m?=
 =?us-ascii?Q?tP3osmkjVYsa8nU2PPcIjlPVNQquV/9zK2hH3eiypPPPPl4VW3nV0+NoU8A5?=
 =?us-ascii?Q?qwda50SxsNpPpzFJZ0MILoPZ1crzcer0PNJw3vb7aw64GNLBvVayAtoA22hr?=
 =?us-ascii?Q?3GmlH3QJqMAvTByKyA+yaH7zqk9j3Ai4XQJEysXcj0F3eTkEjPLUgiPiHpX0?=
 =?us-ascii?Q?ZAaco2MnF3D0cKfHxEn0a8Q3YB07oMTPCTZCgRMwXU+4nhhv1mgTTddXvJm9?=
 =?us-ascii?Q?GME5svXEiQ9niunnrEt9igXuThS9ymlSLJMoesMUdMZ99j5hXNjuOTDHwyAw?=
 =?us-ascii?Q?gU1vd9IOCRdHutOMASwJl1GzQ1mz1uOIesnU10ZKa6ufXo4wpg5Q7/OE2GwT?=
 =?us-ascii?Q?4wYg0RIBJ9tKEvDMCPWEDYjJrZweOWzVN91lyqGsoWT97CKnCVJiN6ffY6Ny?=
 =?us-ascii?Q?iY76wyog2D5upx0i7c1YPKJiFD1TQjyz9xAHOA9BAVn4HlImA7/73LKQkoQ7?=
 =?us-ascii?Q?JjSf8XauaulO1R/WSgATXWOOLGzcW2O+m6H5QntVCbSv3F9gIwFPYnRnOrZ/?=
 =?us-ascii?Q?LLeX/ugAcafmYC+KsdhRDQOHesSbxpULU/XXEdQyTbPNoHYgI28Um2OjcCf8?=
 =?us-ascii?Q?OjJqavht21OuVIV2qbH3Uz+JdcHDI4m3khS3K3N/21kZqGskPaNeGcFJr/tl?=
 =?us-ascii?Q?aM90TAJoU5eIZBkRcvBCVQQUPV9YSK7uc5TFm9JrU7ioZj52r8nYVkMq6sz7?=
 =?us-ascii?Q?raxnIc0fXQzbFaMwuK2lZXlMoL5HsT+6IGf29GzdJ1VOw9yAwA/sT1k5BPwX?=
 =?us-ascii?Q?qme42MFsMMx3YlN2RUc3SBuzkJs5YNq4I2A2dcg8yhoBFknSbC9pHcl8J+Ck?=
 =?us-ascii?Q?pSgR3NmYU6SAQwHt27ipAI5eu1caSbSenjiuX1hhJz7zoam15EP0WTu4ES5K?=
 =?us-ascii?Q?wQJdj8rf6OXE3qIdXOiiGxTbbNXi7qZ8f9n4yVKikPVgTv7BNiLy9fjyZABV?=
 =?us-ascii?Q?CEQtEC52E/364u/BBPoYEJY3xaKVnor2hJJmFAUPlFskchSnXRjNbv5x4ool?=
 =?us-ascii?Q?PPNEcVl2fYSsqoxLn0aWPT2aNlcN2rx2gV08+Kow+u0tHwfIygwaN6KEfcM8?=
 =?us-ascii?Q?9J5eV85+KKlpawNu6QF1ZrDPIlBTD36LIzL4n+Far8r254ASOSvWkOOZcdYy?=
 =?us-ascii?Q?9im3e8KtSua4Np4dWzvmy71nk48NrUTNyDqCapAGuQl8DfWpV3XQkV6IBfN1?=
 =?us-ascii?Q?MXpY0GFeiQDIYBh8YYOOppmeboSzGYsd8T1d2JGp165ZUPTdHdu/1ZerEZpU?=
 =?us-ascii?Q?uLRr5MCSQUAiWCwSa+ugHPATmcMa8T5AHaNVADIcJz/7b5fwQBdlsRRUSGkl?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc519e8-0e79-4d79-cbf6-08dccde67e32
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 20:08:22.5081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHMk+j45Y/8ItGJt8xAxVFyoUBEJXDXkPhyYkLGK/24vRFWnr3KV8zzXP9eNi3nnXf4vi81enhhbXjNHldMtDfdCv/8hHmlbdJT+gfvS554=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6177
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

On Tue, Sep 03, 2024 at 05:21:03PM GMT, Matt Roper wrote:
>Pull the 'mmio' substructure from xe_device out into a dedicated type.
>Future patches will expand this structure and then eventually move MMIO
>read/write operations over to using this type.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h | 24 +++++++++++++++++-------
> 1 file changed, 17 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index ec7eb7811126..a02e5dfcc6a7 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -107,6 +107,22 @@ struct xe_mem_region {
> 	void __iomem *mapping;
> };
>
>+/**
>+ * struct xe_mmio - register mmio structure
>+ *
>+ * Represents an MMIO region that the CPU may use to access registers.  A
>+ * region may share its IO map with other regions (e.g., all GTs within a
>+ * tile share the same map with their parent tile, but represent different
>+ * subregions of the overall IO space).
>+ */
>+struct xe_mmio {
>+	/** @regs: Map used to access registers. */
>+	void __iomem *regs;
>+
>+	/** @map_size: Size of the map. */

did you mean to rename and then gave up?

>+	size_t size;

 From a quick grep it seems we were not relying on the order of the mmio
members, so this looks ok.

With the fix above,

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+};
>+
> /**
>  * struct xe_tile - hardware tile structure
>  *
>@@ -148,13 +164,7 @@ struct xe_tile {
> 	 * * 4MB-8MB: reserved
> 	 * * 8MB-16MB: global GTT
> 	 */
>-	struct {
>-		/** @mmio.size: size of tile's MMIO space */
>-		size_t size;
>-
>-		/** @mmio.regs: pointer to tile's MMIO space (starting with registers) */
>-		void __iomem *regs;
>-	} mmio;
>+	struct xe_mmio mmio;
>
> 	/**
> 	 * @mmio_ext: MMIO-extension info for a tile.
>-- 
>2.45.2
>
