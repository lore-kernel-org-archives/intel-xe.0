Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF27C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 19:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35BE112DE9;
	Tue, 16 Apr 2024 19:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MF8gdkqC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D1B112DE1
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 19:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713294123; x=1744830123;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=l0zHjyHLr3UUJ3hbVqMaJrheZJQ0deCyU7HDWrIZLck=;
 b=MF8gdkqCJSLibjwrZRpp2cIZhYBINSQjaaiJTxPEGDjOq3ZsR/d3KDB/
 Ta0PVFip5W4kxmNGYdR1OL7hBuU7kQvT2aqL/ojRBUPynYMPbbtQEfcH+
 uIhOUmTPf22YE38FkU3y/gJZh5LCzb69IYRT6C4qFQHrLF2V2+SCL/Dzr
 YUartYSSAwrTkdg8osWLAQOfswKWfFnYAae30f0Nr2aTgMbS9jm1p033o
 RSlyjPS5DZRS+aZiSYZG8fXb7Zi383uiqDjL4ISPJvF/gWKH6JyhLxzpX
 I1DQYli2mojAwWsiNyGq9/FHtmL4Z7z337xd5mnUDk4Gz98qlmUmN6LUF w==;
X-CSE-ConnectionGUID: JkQkb45mTUCQnzB0lhO1Jg==
X-CSE-MsgGUID: YCaHRzoeRUCmwd6zvVFBoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="34143873"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="34143873"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 12:02:03 -0700
X-CSE-ConnectionGUID: iAQwBYJTRbe2njdOkvHJFA==
X-CSE-MsgGUID: y2KofxgaQv6xNGndcpmIXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="27149123"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 12:02:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 12:02:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 12:02:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 12:02:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 12:02:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0Y+F9eCWw5+ze+sx5hZUfFlqggdewIQ+bt0Dvj9YH7ZC9vwKsSMsXoAlL/5kumqS4cvFNkUnvtlxMrXyD88Z6bDYEjWdl/epNj7hNx4c5QOBszztSQ1RGCkcfiw8PlIGAIdjP4ZY2Z9U3y/2wK2GnA8NXsLA/4lLd8TyBbNd/gUaJLbFo3rpoSLuasHZrq+K4Ds8cyL4f+vmCEWeGQHHXMXq19d7rfeHvnIo8+dqiwCupxVtBUD6OFMRm2o+8Qb4vv4ZYahrzdMUjMpbqxEqGPVw/PRfAQ0euoc+Ni0C+xsoqDwKtVxp59rzvh9sa+oaAX0+G8ktf94ypLKy6vClw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMlq38FoYnnBKMEnOXvsaUGBQG7IRBhplTm+cioODTg=;
 b=f95Bq2mJNGgVg0UvJfB7IAapCzZrS26gcf5qLWD6IkXMj4eV4KzsowMHNOO37tuPxeGKPQkNy8iXK0uNU79JARS4YV3tMLYZWTTwOrotAzLKVBsc+D2DT0D309Ckai101JmW8oKFkyBVq70DNHL4Ia434ph2PjXP9taZOLaEuTgPwuCXCTzgCk0Vz4TDUjCKn5rvuPxXb+SD5RAXETMHczdy6ONrAq9Bx4ctNtnRj0ldiQwREBiXcjwOcCOB5k3ysUU49xcLQA5JoLktmpNtE7vfcermZ1Q2vrAsHNzORcl8TTJp1NE3etqhUyro6/S73yywfKzhD2XX3eg1iEBTTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4824.namprd11.prod.outlook.com (2603:10b6:510:38::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.10; Tue, 16 Apr
 2024 19:01:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Tue, 16 Apr 2024
 19:01:58 +0000
Date: Tue, 16 Apr 2024 19:01:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <krishnaiah.bommu@intel.com>, <Thomas.Hellstrom@linux.intel.com>,
 <brian.welty@intel.com>
Subject: Re: [v2 12/31] drm/xe/svm: Remap and provide memmap backing for GPU
 vram
Message-ID: <Zh7LIm/GFt0F/3xX@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-13-oak.zeng@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409201742.3042626-13-oak.zeng@intel.com>
X-ClientProxiedBy: BY5PR17CA0029.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::42) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4824:EE_
X-MS-Office365-Filtering-Correlation-Id: e75baa65-cba4-4e3a-ff34-08dc5e47b0e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MB+QhSuNWKdqTjEcb6M3Xxmy51F/UIk8Er7+6H+SlWPpWwgWgnVuZyXCYnVy1fEJZUZ2P60QswkE20eLbdr67BXcSiH4OD9Tq/xA06d9BtngYb1JYazIsc3mxksQ0H/uPWxBF5EJkcEN8HlK77r9bfmGh9tZm1r0eVGi08fzYIYNWTqIVZbHbesVxzD3UgIqbBLbGFb9vPV3Yv7kCPrvZ+h9/3HulugAE8iQKiiBve0kXck1ZMKWI5FfcYKGgJTDaogHBfijz2iN9/2dM7KQVKewL0KYxs99gzz3AEo5n45opCCUr6DWjhxeMbhjO0fssGwYJ/tUCKHRxmwDD1zkJLXmPMUVqMUT/Y6uz3KhWdOjBsGj7TjSIHvh6qzpHDer/jhNlzTRILz2Sa5uFtD2vl2NbMsDKFMRDVG+BjjhW0fThiWEQmToPMRcatnkx7VE+JdLTgcMkxlrqNCyJDqtklsX+XUTHFTQjKw6qwTAWvsOFp+XjDpLo/aiqpoCYeHWAXILgURQpfH2fdbk1AzuNC0wF6SrVnwxMlCe/P4jkaI2lkFHLH8BqmVWbh62hWINBU2Vk3jdohgaIDPZswIawtAkEw338jEZikF+t0Cdel73RdnZZehJ3bBdTiP3pvDt6bzGw4fSyynxwwE8ZO/Rjxdfrd96OITo89DcY/PKIjU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?D6HSTgcmQi5VvFtNkUphOUmFgD4Nr/bNzWYsaFLR2EkAk018r05EdLhcQ+?=
 =?iso-8859-1?Q?G9B5Du98yLwmjWSoHMVjmuPC0dcpKxFtiQbC9vjXwl33sGJ769pn35iAkB?=
 =?iso-8859-1?Q?nOwkdJYS4cofuPClCj8czLrIabHQkPuMa1reWFeGxqjzWWOjQLS+0cj11Y?=
 =?iso-8859-1?Q?Vak/cSuwbVE+JNnXnfD363a+nlAonaTRuk6lUGz+ILOgP7EWe0gpvm+Zjd?=
 =?iso-8859-1?Q?BZwzMenOBuTqGTSJUgtmd1tc/C4NfFE2Wp5uRkFkRuOaJdS/ZBsuc5M55q?=
 =?iso-8859-1?Q?AWq02BIsAlnaHtDPXWlu+QONwFW3ulKEh7qjPMYuEWjmyv3I5wnuGfUycE?=
 =?iso-8859-1?Q?wQT9tyMmTfbxvRuScdUB9WFvEWwQK64n6sfNIitOiqPlH63UoTxrUzLF9w?=
 =?iso-8859-1?Q?pSfSuzMQtQJ2xdtBjs0dKUD93HmjDqkL2lUj3cov+W4ZOAQZZDGC9KE5jc?=
 =?iso-8859-1?Q?g2OS0Ojkk0fb/rbPo77FMGGgwfjNI/PZ72rhuj9ZZ73V0qa+683u6f9l0f?=
 =?iso-8859-1?Q?Gz+Dd2MBz4c1ePHJsrMSN89DTNBdpszhIlpCcid4XFadCpj4MFxHy6lOvI?=
 =?iso-8859-1?Q?lT4Hg7KXCQENZhRkbqStkqp3fhxeFuQ1VhZlO4BwjNe5YF+sbWUJsBhaYO?=
 =?iso-8859-1?Q?litiignfrxd6XJ0JLdE1GBSHLM1sh/sWTrWthrnKePPPxItoS8UpFne2p/?=
 =?iso-8859-1?Q?qu6jCjZ2zWOy3d9nP5XxvO2OGbBwIOMu4StrgaQUnEVr2W/r1b6jDwaF2g?=
 =?iso-8859-1?Q?Ob9bzxpdxqp5VeA1r/0+Q81FLxqMm+uwh+ow58X04EcmWx9D4HTXoZpZdf?=
 =?iso-8859-1?Q?PsGnU0azZDJ4rrhWHpLvCO7kKUir+BWXKrp0Jo1rIYewDTD3UZF5tpEViC?=
 =?iso-8859-1?Q?8cT/P8/R6FCIhTalU6BQxrnFg/ekHiBxed+eAcKaIF/CQlrT0d3SRqDKf6?=
 =?iso-8859-1?Q?HQJYq+1CqRmXfv/Iv6Lmd8q1IeQM/pbZ1VXk7Rcd8yekA0BsprdXZB0WgQ?=
 =?iso-8859-1?Q?LE8Y/zMq6PGRv9j7LnAnyGWqQNKZHcc/IDawI5rVlFqTvOqM7l/g8kgrki?=
 =?iso-8859-1?Q?so4R+lm1+s13246+STr9NTCkzRu0b9N2etEoVza7NuCL9SQyZRxwKM/hZI?=
 =?iso-8859-1?Q?iNugkX5K45JrG651Ylnpj+ZTAzdnazJ6Ug3exaZBGjGHA031PDiyYJv1Tm?=
 =?iso-8859-1?Q?zOxWW0REaFUoprvX5bSraxZLGdGBddb+b4uEJB8r0tB79Xw+Kdj2imX4vk?=
 =?iso-8859-1?Q?E4bBk4f3fEXaT3PrCPSP3yqw9m69DV0SXJUnOiTrqo295xHTA66p2X8BEB?=
 =?iso-8859-1?Q?VEknCGen1vHTLBwQM6BKG0KyMpiJpofcbi8JO2xKnGoBTii6kxZw1xXEH9?=
 =?iso-8859-1?Q?TXwbWdhDMuaqE7kTvmQm7WBmo/muBnqWxGxX4+G5QqxSCXH3Od5dY5jSFW?=
 =?iso-8859-1?Q?6JNQeI+jkL9lJnJWUwy9Q52Kj08hLwF2cag4dUEGsuiy7/IkZvzyERUllU?=
 =?iso-8859-1?Q?942tZCBpYy8lU77KjCHGvfaZ8IG5bTCFNwhaBo4cVxBHE1yfejvz4xbud9?=
 =?iso-8859-1?Q?dINlR3lo4IhOyYWk4ZjaHuf0BGrXQ3QgXYw4LiaVCLgyBiYXeEQ9tbDsXf?=
 =?iso-8859-1?Q?tea7YY1LlLvxFU7kLPXMgDTfq674ddwES3pKNIyApxUtUlK8jU8j9ujA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e75baa65-cba4-4e3a-ff34-08dc5e47b0e4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 19:01:58.4975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QFDx5GVkOXUKEcOEpT5EFU4/Eq7kIccRYlkl/GLeC73KGVp52rkx0pvgRowv+IwvgyxqmMdXQC3wEvXAPdrEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4824
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

On Tue, Apr 09, 2024 at 04:17:23PM -0400, Oak Zeng wrote:
> Memory remap GPU vram using devm_memremap_pages, so each GPU vram
> page is backed by a struct page.
> 
> Those struct pages are created to allow hmm migrate buffer b/t
> GPU vram and CPU system memory using existing Linux migration
> mechanism (i.e., migrating b/t CPU system memory and hard disk).
> 
> This is prepare work to enable svm (shared virtual memory) through
> Linux kernel hmm framework. The memory remap's page map type is set
> to MEMORY_DEVICE_PRIVATE for now. This means even though each GPU
> vram page get a struct page and can be mapped in CPU page table,
> but such pages are treated as GPU's private resource, so CPU can't
> access them. If CPU access such page, a page fault is triggered
> and page will be migrate to system memory.
> 
> For GPU device which supports coherent memory protocol b/t CPU and
> GPU (such as CXL and CAPI protocol), we can remap device memory as
> MEMORY_DEVICE_COHERENT. This is TBD.
> 
> v1:
> Changes per code review feedback from Matt:
>     change .o order in Makefile
>     fix indentation
>     change code order in mmio_fini
>     remove unnecessary header file
>     uniform xe_svm_devm_add/_remove parameter
>     use tile (vs dev) as pagemap.owner during memremap
>     only remap vram for platform that support usm
> Changes per review feedback from Brian:
>     s/xe_svm_devm_add/xe_devm_add
>     s/xe_svm_devm_remove/xe_devm_remove
>     move calling of xe_devm_add to xe_tile.c
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h |  8 +++
>  drivers/gpu/drm/xe/xe_mmio.c         |  6 ++
>  drivers/gpu/drm/xe/xe_svm.h          | 15 +++++
>  drivers/gpu/drm/xe/xe_svm_devmem.c   | 89 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile.c         |  4 ++
>  6 files changed, 123 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_svm.h
>  create mode 100644 drivers/gpu/drm/xe/xe_svm_devmem.c
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index fff70fc9a09e..cd5213ba182b 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -129,6 +129,7 @@ xe-y += xe_bb.o \
>  	xe_sa.o \
>  	xe_sched_job.o \
>  	xe_step.o \
> +	xe_svm_devmem.o \
>  	xe_sync.o \
>  	xe_tile.o \
>  	xe_tile_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index e73b9a086718..d6a14327986b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -103,6 +103,14 @@ struct xe_mem_region {
>  	resource_size_t actual_physical_size;
>  	/** @mapping: pointer to VRAM mappable space */
>  	void __iomem *mapping;
> +	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> +	struct dev_pagemap pagemap;
> +	/**
> +	 * @hpa_base: base host physical address
> +	 *
> +	 * This is generated when remap device memory as ZONE_DEVICE
> +	 */
> +	resource_size_t hpa_base;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7ba2477452d7..12923fe6abae 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -22,6 +22,7 @@
>  #include "xe_module.h"
>  #include "xe_sriov.h"
>  #include "xe_tile.h"
> +#include "xe_svm.h"
>  
>  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
>  #define TILE_COUNT		REG_GENMASK(15, 8)
> @@ -354,6 +355,11 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
>  static void mmio_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_device *xe = arg;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	for_each_tile(tile, xe, id)
> +		xe_devm_remove(tile, &tile->mem.vram);
>  
>  	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
>  	if (xe->mem.vram.mapping)
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> new file mode 100644
> index 000000000000..e944971cfc6d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __XE_SVM_H
> +#define __XE_SVM_H
> +
> +struct xe_tile;
> +struct xe_mem_region;
> +
> +int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
> +void xe_devm_remove(struct xe_tile *tile, struct xe_mem_region *mr);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c b/drivers/gpu/drm/xe/xe_svm_devmem.c
> new file mode 100644
> index 000000000000..31af56e8285a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/mm_types.h>
> +#include <linux/sched/mm.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_svm.h"
> +
> +
> +static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> +{
> +	return 0;
> +}
> +
> +static void xe_devm_page_free(struct page *page)
> +{
> +}
> +
> +static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
> +	.page_free = xe_devm_page_free,
> +	.migrate_to_ram = xe_devm_migrate_to_ram,
> +};
> +
> +/**
> + * xe_devm_add: Remap and provide memmap backing for device memory
> + * @tile: tile that the memory region blongs to
> + * @mr: memory region to remap
> + *
> + * This remap device memory to host physical address space and create
> + * struct page to back device memory
> + *
> + * Return: 0 on success standard error code otherwise
> + */
> +int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
> +	struct resource *res;
> +	void *addr;
> +	int ret;
> +
> +	res = devm_request_free_mem_region(dev, &iomem_resource,
> +					   mr->usable_size);
> +	if (IS_ERR(res)) {
> +		ret = PTR_ERR(res);
> +		return ret;
> +	}
> +
> +	mr->pagemap.type = MEMORY_DEVICE_PRIVATE;
> +	mr->pagemap.range.start = res->start;
> +	mr->pagemap.range.end = res->end;
> +	mr->pagemap.nr_range = 1;
> +	mr->pagemap.ops = &xe_devm_pagemap_ops;
> +	mr->pagemap.owner = xe;
> +	addr = devm_memremap_pages(dev, &mr->pagemap);
> +	if (IS_ERR(addr)) {
> +		devm_release_mem_region(dev, res->start, resource_size(res));
> +		ret = PTR_ERR(addr);
> +		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %d\n",
> +				tile->id, ret);
> +		return ret;
> +	}
> +	mr->hpa_base = res->start;
> +
> +	drm_info(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
> +			tile->id, mr->io_start, mr->io_start + mr->usable_size, res);
> +	return 0;
> +}
> +
> +/**
> + * xe_devm_remove: Unmap device memory and free resources
> + * @tile: xe tile
> + * @mr: memory region to remove
> + */
> +void xe_devm_remove(struct xe_tile *tile, struct xe_mem_region *mr)

Also I don't think function is not needed...

devm_memremap_pages registers devm_memremap_pages_release via
evm_add_action_or_reset...

And if it was we'd want to register a devm_fini function rather than
exporting a function and call it from the mmio layer.

Matt

> +{
> +	struct device *dev = &to_pci_dev(tile->xe->drm.dev)->dev;
> +
> +	/*FIXME: Does below cause a kernel hange during moduel remove?*/
> +	if (mr->hpa_base) {
> +		devm_memunmap_pages(dev, &mr->pagemap);
> +		devm_release_mem_region(dev, mr->pagemap.range.start,
> +			mr->pagemap.range.end - mr->pagemap.range.start + 1);
> +	}
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 0650b2fa75ef..f1c4f9de51df 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -14,6 +14,7 @@
>  #include "xe_tile_sysfs.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_wa.h"
> +#include "xe_svm.h"
>  
>  /**
>   * DOC: Multi-tile Design
> @@ -158,6 +159,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
>   */
>  int xe_tile_init_noalloc(struct xe_tile *tile)
>  {
> +	struct xe_device *xe = tile_to_xe(tile);
>  	int err;
>  
>  	xe_device_mem_access_get(tile_to_xe(tile));
> @@ -175,6 +177,8 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>  
>  	xe_tile_sysfs_init(tile);
>  
> +	if (xe->info.has_usm)
> +		xe_devm_add(tile, &tile->mem.vram);
>  err_mem_access:
>  	xe_device_mem_access_put(tile_to_xe(tile));
>  	return err;
> -- 
> 2.26.3
> 
