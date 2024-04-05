Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC62CD1292
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 01:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F1E11374E;
	Fri,  5 Apr 2024 01:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NcwOQYB5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4807113744
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 01:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712279262; x=1743815262;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3TrMzSTWwcpTn4V4wur+7cDq0rvaLYXScGjb0gDwJPE=;
 b=NcwOQYB5jbQ5yxlgFdexbfV/+IDiUDWnGikRPZdpvaCTo46OQBj09IQa
 TDqC9R8mxE8JiYUDogxTAlhOaCjkaCpvBHIe4rTIeYgB6zSWuIeaz6BRd
 1pS8JsjPJVFugFqRx/GySphkuQM1LrBwjqHCDq+zNI4WRXLstLuoWmrnP
 mmVkD8R7o+1M1VOnRtZQi6hLcHAWCtmXyGH2irdA3N+nSM0hWv8nwChHs
 U0BzNBW5j51xhHnjQtPsOEfEsBr6xKVH6RBhzGJXHq+8rDabgjL6v4Tmw
 AYc2flS7fu4I99vC6ZXNWVH4D3Zif7Y9kwdKXXOSsZQvmH0iUmqfZvloq A==;
X-CSE-ConnectionGUID: DZfCI9l4RDSzi7qOaT0CTA==
X-CSE-MsgGUID: wjbYAA6UQxC47hRTT0pukQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7440440"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7440440"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 18:07:40 -0700
X-CSE-ConnectionGUID: Oy/SXFK/SbeTMOQa1EVtPw==
X-CSE-MsgGUID: 0lJqw0eNRYibU32wSAZ4cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="18870777"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 18:07:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 18:07:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 18:07:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 18:07:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 18:07:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3GNAx7z+xnm2AmtKprlhizioSRgK02qWTHs+aE2FA257UaD1igeCJh/XN5JoFWfvmD7LkYBMYLG81LSQqNjA3fnUVD24ErihUx0Xhi47/B032wk1ISajCv3gHx0YSfGM1/61OWhHSabK71dujRBdPFGTdK3FmRkJ4oOsUp40C8exbW6v1eaziChKsO7nDwkMXKkpqYL8mXEVHDjrIvQ+rYRE7K+/k++10rWuxV4DwTJXZbg/JAaE4LUxNV0Oohkg4/OCwHoukL4AdWfNhOzNL4gvXWU7oF/S4h1sWOXkEtOACeX3D9Pr1V033HC+KOt0tDNYxY2tzUTIsSarm7alA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tjr0KcsRSTzt+IdRvqDGVENLp72uFqy90B5l3MJ322Q=;
 b=Btp86qzkxV4mgArxswWMO2dBYTSFIQW017/xYnaykl6UiYfMKqn1gTyu7h/uzj/16YpbCHXUS82Vf+ILFYpwVHqZgu1BLEkNhSXvWLSKIJa/e/aYirX7JyD/QDI3okwW8jm5yAxcB2OSL+B6LiRq+O9tq86ELjm4vq/Mc0TY52vgLeVND7NUilDww808aZW0/donHYJcU+Gp8alrpIK+OlFOq7VnU3XyqVRm7nj6DCdi4Soh84/6DRoLW6mnCrScLM0Pf8u9TPd9kwaBVih7AwEQ8mYEXDm6NKuL4w3QBnGdKO0RJ/nGcSPh7wVl8Zm10osgJKHEq912we53LhusbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.21; Fri, 5 Apr
 2024 01:07:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 01:07:12 +0000
Date: Fri, 5 Apr 2024 01:07:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Oak Zeng <oak.zeng@intel.com>, Niranjana
 Vishwanathapura <niranjana.vishwanathapura@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>, Brian Welty
 <brian.welty@intel.com>
Subject: Re: [PATCH v3 1/2] drm/xe: Introduce helper to populate userptr
Message-ID: <Zg9O6zO/7R2edQ+I@DUT025-TGLU.fm.intel.com>
References: <20240404061631.4150858-1-himal.prasad.ghimiray@intel.com>
 <20240404061631.4150858-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240404061631.4150858-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7802:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VqKDjC/si/ZTk12h7Dh+K13fSi9GRED2/uWvQRYUNlyK7Lci4WRvx/x1omXq4juCmIIdt9VwUueGXvoqSyiaFULGAz1FxmUjk2YVIAmuoOg6TPBOW9ctiHsFe8HKXdnASQyoslMJoGKDA19macGlPYiWvlkuA7CzKR964L+cF8ee6QIrkP4cMbmTDrxsu2AaeypODmOii302rnmBUGRCtGI2GKC4NCBsviT+UOTXLk2kBIiKxS+exBsD+pV40T3l2tb6C1gk7Qg6e0E7XB4xCTCBy9DQ0aMKzs7nMqj0IH9hkTcZDFlEWMOA7QpWVRcx4VF9Vi6L68oJHCRIGKPGnTAxR8XOXlnLpf0wat4BHm4zwt0ib8j23R3hIwlJwATf/pp2v00YUHP6P4u2oNOYRgYtSMffMj3go9Uf4oXkMnl9nHBZydLn6Gy5n+/+h++jnJaWQ/Ygf9DRSn5RW+1onzEFjBi37Mk0AB6+w9DskdwVY7ntYyJMuG8bLJmpCI5igxwC9FWS1OZ3qnIs2ANVwXcaPvva1npum29ljJumWi48/edbRS24OoKKT9cBwVErUyyPyo3fXMBeGxQnNtHZrkfUoKyglq5AyPVSgsO8jNWZ3eU3RapzSu1IK66Fdfn11e4tpGSOQSZeu4v2reqY/uhZ/SumRU/GmvNWRcZak2U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?G5nfNTSzdgdPBlYsOlMf9iexv3YqBf0hcD3mmNmn5cMfRg51kqesKHUa24?=
 =?iso-8859-1?Q?xq5DpujHK4zi/TMO7rg3tWd5Oll3Z0AXaGVLMunKJVQ4ZqIhxMrobb2Xf+?=
 =?iso-8859-1?Q?v3bOV981q9VPZ0gF/Bsy+0tc68dVESGinb+pZYLiOpWID7lwSUmdF/6qL9?=
 =?iso-8859-1?Q?d/ag4niZmN3Yif7NF13n+Hr8qf+9+I7sfNJ4Nm+0QGNR1wwrDEhgP2c8s0?=
 =?iso-8859-1?Q?niswI4nnU5auGsPQNuOraNOo5eFe5Im/SoCm3HCTh6kvdr68FNmqj1a7Fe?=
 =?iso-8859-1?Q?d0nAshiC2AszHQJqF0Gkj3rVDFlxyX5kFKaK5FveLulDYt3pMlUjvKDGyV?=
 =?iso-8859-1?Q?Ey6Tl3Oxm9OrXtP+GFKe+5npdhq/I1eWcDEioKBaM5pG747KCiLppIpKpj?=
 =?iso-8859-1?Q?2RWoAQlpOf3UWEc7ioISk3q3rOdlgVjN7QHkPBEptFovGSHoJk6iMrvsCA?=
 =?iso-8859-1?Q?e9IKc5TKEBzOllUrUwlAzhNqwaw184zlOugq0MtkIIYRR7o4YX2VYYtS53?=
 =?iso-8859-1?Q?/ZGBIZBjXjhomeYp5js6/QXvHcLoTXMqtITBdD9VMfyhNtMokU9Y7PqJGH?=
 =?iso-8859-1?Q?EP17MPG1QMTVCmle54mp8vigEZCjAwJ3UKHIMclJfWT4JOqNOulnLbflI/?=
 =?iso-8859-1?Q?jJT41KA7xZfL5YmNg6SbyLHIpTNh1MVN0+uA4uxQPpWZTHu6jt4PVNGP+G?=
 =?iso-8859-1?Q?T578vhU3jHrZKcTtOTn7czQQsZsxlUVgoWAMdQD2wLMJ/tGwU9Ugt3pOEu?=
 =?iso-8859-1?Q?OhIkY/qkYeUCYXKvAKdv83VRXqqLTCdobQJwZ5aAM5Su4Y/v5QMLfag+Qr?=
 =?iso-8859-1?Q?qIqhdKWDJkrFZQ1gZOWUfxL59ZqpysyW07sStgY7GIwwRYCIUt2mSDhuhy?=
 =?iso-8859-1?Q?yE5w+nowDD6sSDR2dp+RMZ/qcV5SnsV3uM8oBLZ0HOReeQbj/BKnH+t8u4?=
 =?iso-8859-1?Q?IU6NgNdg4RRNCPLsAvuU3T3Mv3w0DRypfOCrYVbhDanjhCwE2p8TiGHkbx?=
 =?iso-8859-1?Q?X99hEUtD41zkdCMmvCzKtPdGCCFTFz8M7fgd6CvHybgE2+F05jL2mOJ8Dq?=
 =?iso-8859-1?Q?GWbrju0HhDU3r8PPeIQI6vQLDYAMWt40fAptwWn5kOhV25Pn1Wqb2tthxL?=
 =?iso-8859-1?Q?fZS2cbmc97RCAMXXhh/S4eC+OAQxiCuPDlVTZuRBT/HwF3XSjEDxRgS2eq?=
 =?iso-8859-1?Q?D4HZIv+nAf4gkUkiDR7zwdMvQL1O23eURqOlkeajSxeYPAs4DN1Dq4Fpoy?=
 =?iso-8859-1?Q?3wynalzvLgidEyoTY00M5lgV/RXjwPyjVEGuU3qXk44ucyFNDTZINavVk5?=
 =?iso-8859-1?Q?LdVvkkdOzmHkoPVIaSSb4ebFklvR/usuuiRb6XeMx8P6X36oJaLg9/xfJa?=
 =?iso-8859-1?Q?DhftIcNicagBKQvJlvlF44rETUZFhdY+Zcw/5J1jYlc5o1uMGvJ6qJpGHx?=
 =?iso-8859-1?Q?gLXRKwIOFFsWYy7CtXKFUAmm11PZTbLEoT8IH9OlfZcxkQEQuYmR4vldHV?=
 =?iso-8859-1?Q?EXh0NY1RK8dmG4Z1QU5gRcNP+Au/0IH/onmqKKU0hZGwnkYr4JRW4JFaXx?=
 =?iso-8859-1?Q?3GENRP8cqHrZGpdmg2YyI5gPj1FrPfg5nAwtgZMJEKCIk3KEUnNw+xuBAu?=
 =?iso-8859-1?Q?q0XowRFS09s6zBASFC10BJhYWe/um4QAgGZ9urx7Ke1U29RGcBkGDvLg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ccf9520-fbd4-4cde-4a05-08dc550cb9cf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 01:07:12.7245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0HT1r2bx0fabFWZtKV++7L3ixVrBluAzWC0L2bJ18INDjgVkCsAwluPZ3d1w2EgIRGOF+Nf0HhNbMPw9w9YDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
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

On Thu, Apr 04, 2024 at 11:46:30AM +0530, Himal Prasad Ghimiray wrote:
> From: Oak Zeng <oak.zeng@intel.com>
> 
> Introduce a helper function xe_userptr_populate_range to populate
> a a userptr range. This functions calls hmm_range_fault to read
> CPU page tables and populate all pfns/pages of this virtual address
> range.
> 
> If the populated page is system memory page, dma-mapping is performed
> to get a dma-address which can be used later for GPU to access pages.
> 
> If the populated page is device private page, we calculate the dpa (
> device physical address) of the page. This will be handled in future
> patches.
> 
> The dma-address or dpa is then saved in userptr's sg table. This is
> prepare work to replace the get_user_pages_fast code in userptr code
> path.
> 
> v1: Address review comments:
>     separate a npage_in_range function (Matt)
>     reparameterize function xe_userptr_populate_range function (Matt)
>     move mmu_interval_read_begin() call into while loop (Thomas)
>     s/mark_range_accessed/xe_mark_range_accessed (Thomas)
>     use set_page_dirty_lock (vs set_page_dirty) (Thomas)
>     move a few checking in xe_vma_userptr_pin_pages to hmm.c (Matt)
> v2: Remove device private page support. Only support system
>     pages for now. use dma-map-sg rather than dma-map-page (Matt/Thomas)
> v3: Address review comments:
>     Squash patch "drm/xe: Introduce a helper to free sg table" to current
>     patch (Matt)
>     start and end addresses are already page aligned (Matt)
>     Do mmap_read_lock and mmap_read_unlock for hmm_range_fault incase of
>     non system allocator call. (Matt)
>     Drop kthread_use_mm and kthread_unuse_mm. (Matt)
>     No need of kernel-doc for static functions.(Matt)
>     Modify function names. (Matt)
>     Free sgtable incase of dma_map_sgtable failure.(Matt)
>     Modify loop for hmm_range_fault.(Matt)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig  |   1 +
>  drivers/gpu/drm/xe/Makefile |   2 +
>  drivers/gpu/drm/xe/xe_hmm.c | 253 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hmm.h |  18 +++
>  4 files changed, 274 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 1a556d087e63..449a1ecbc92a 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -41,6 +41,7 @@ config DRM_XE
>  	select MMU_NOTIFIER
>  	select WANT_DEV_COREDUMP
>  	select AUXILIARY_BUS
> +	select HMM_MIRROR
>  	help
>  	  Experimental driver for Intel Xe series GPUs
>  
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 21316ee47026..07031b5ba977 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -146,6 +146,8 @@ xe-y += xe_bb.o \
>  	xe_wa.o \
>  	xe_wopcm.o
>  
> +xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
> +
>  # graphics hardware monitoring (HWMON) support
>  xe-$(CONFIG_HWMON) += xe_hwmon.o
>  
> diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
> new file mode 100644
> index 000000000000..d7a11896ad72
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hmm.c
> @@ -0,0 +1,253 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/scatterlist.h>
> +#include <linux/mmu_notifier.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/memremap.h>
> +#include <linux/swap.h>
> +#include <linux/hmm.h>
> +#include <linux/mm.h>
> +#include "xe_hmm.h"
> +#include "xe_vm.h"
> +#include "xe_bo.h"
> +
> +static u64 xe_npages_in_range(unsigned long start, unsigned long end)
> +{
> +	return (end - start) >> PAGE_SHIFT;
> +}
> +
> +/*
> + * xe_mark_range_accessed() - mark a range is accessed, so core mm
> + * have such information for memory eviction or write back to
> + * hard disk
> + *
> + * @range: the range to mark
> + * @write: if write to this range, we mark pages in this range
> + * as dirty
> + */
> +static void xe_mark_range_accessed(struct hmm_range *range, bool write)
> +{
> +	struct page *page;
> +	u64 i, npages;
> +
> +	npages = xe_npages_in_range(range->start, range->end);
> +	for (i = 0; i < npages; i++) {
> +		page = hmm_pfn_to_page(range->hmm_pfns[i]);
> +		if (write)
> +			set_page_dirty_lock(page);
> +
> +		mark_page_accessed(page);
> +	}
> +}
> +
> +/*
> + * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
> + * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
> + * and will be used to program GPU page table later.
> + *
> + * @xe: the xe device who will access the dma-address in sg table
> + * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
> + * has the pfn numbers of pages that back up this hmm address range.
> + * @st: pointer to the sg table.
> + * @write: whether we write to this range. This decides dma map direction
> + * for system pages. If write we map it bi-diretional; otherwise
> + * DMA_TO_DEVICE
> + *
> + * All the contiguous pfns will be collapsed into one entry in
> + * the scatter gather table. This is for the purpose of efficiently
> + * programming GPU page table.
> + *
> + * The dma_address in the sg table will later be used by GPU to
> + * access memory. So if the memory is system memory, we need to
> + * do a dma-mapping so it can be accessed by GPU/DMA.
> + *
> + * FIXME: This function currently only support pages in system
> + * memory. If the memory is GPU local memory (of the GPU who
> + * is going to access memory), we need gpu dpa (device physical
> + * address), and there is no need of dma-mapping. This is TBD.
> + *
> + * FIXME: dma-mapping for peer gpu device to access remote gpu's
> + * memory. Add this when you support p2p
> + *
> + * This function allocates the storage of the sg table. It is
> + * caller's responsibility to free it calling sg_free_table.
> + *
> + * Returns 0 if successful; -ENOMEM if fails to allocate memory
> + */
> +static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
> +		       struct sg_table *st, bool write)
> +{
> +	struct device *dev = xe->drm.dev;
> +	struct page **pages;
> +	u64 i, npages;
> +	int ret;
> +
> +	npages = xe_npages_in_range(range->start, range->end);
> +	pages = kvmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
> +	if (!pages)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < npages; i++) {
> +		pages[i] = hmm_pfn_to_page(range->hmm_pfns[i]);
> +		xe_assert(xe, !is_device_private_page(pages[i]));
> +	}
> +
> +	ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0, npages << PAGE_SHIFT,
> +						xe_sg_segment_size(dev), GFP_KERNEL);
> +	if (ret)
> +		goto free_pages;
> +
> +	ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
> +			      DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
> +	if (ret) {
> +		sg_free_table(st);
> +		st = NULL;
> +	}
> +
> +free_pages:
> +	kvfree(pages);
> +	return ret;
> +}
> +
> +/*
> + * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
> + *
> + * @uvma: the userptr vma which hold the scatter gather table
> + *
> + * With function xe_userptr_populate_range, we allocate storage of
> + * the userptr sg table. This is a helper function to free this
> + * sg table, and dma unmap the address in the table.
> + */
> +void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
> +{
> +	struct xe_userptr *userptr = &uvma->userptr;
> +	struct xe_vma *vma = &uvma->vma;
> +	bool write = !xe_vma_read_only(vma);
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct xe_device *xe = vm->xe;
> +	struct device *dev = xe->drm.dev;
> +
> +	xe_assert(xe, userptr->sg);
> +	dma_unmap_sgtable(dev, userptr->sg,
> +			  write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
> +
> +	sg_free_table(userptr->sg);
> +	userptr->sg = NULL;
> +}
> +
> +/**
> + * xe_hmm_userptr_populate_range() - Populate physical pages of a virtual
> + * address range
> + *
> + * @uvma: userptr vma which has information of the range to populate.
> + * @is_mm_mmap_locked: True if mmap_read_lock is already acquired by caller.
> + *
> + * This function populate the physical pages of a virtual
> + * address range. The populated physical pages is saved in
> + * userptr's sg table. It is similar to get_user_pages but call
> + * hmm_range_fault.
> + *
> + * This function also read mmu notifier sequence # (
> + * mmu_interval_read_begin), for the purpose of later
> + * comparison (through mmu_interval_read_retry).
> + *
> + * This must be called with mmap read or write lock held.
> + *
> + * This function allocates the storage of the userptr sg table.
> + * It is caller's responsibility to free it calling sg_free_table.
> + *
> + * returns: 0 for succuss; negative error no on failure
> + */
> +int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
> +				  bool is_mm_mmap_locked)
> +{
> +	unsigned long timeout =
> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +	unsigned long *pfns, flags = HMM_PFN_REQ_FAULT;
> +	struct xe_userptr *userptr;
> +	struct xe_vma *vma = &uvma->vma;
> +	u64 start = xe_vma_userptr(vma);
> +	u64 end = start + xe_vma_size(vma);

Nit: xe_vma_end

> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct hmm_range hmm_range;
> +	bool write = !xe_vma_read_only(vma);
> +	unsigned long notifier_seq;
> +	u64 npages;
> +	int ret;
> +
> +	userptr = &uvma->userptr;
> +
> +	if (is_mm_mmap_locked)
> +		mmap_assert_locked(userptr->notifier.mm);
> +
> +	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> +		return 0;
> +
> +	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
> +	if (notifier_seq == userptr->notifier_seq)
> +		return 0;
> +
> +	if (userptr->sg)
> +		xe_hmm_userptr_free_sg(uvma);
> +
> +	npages = xe_npages_in_range(start, end);
> +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> +	if (unlikely(!pfns))
> +		return -ENOMEM;
> +
> +	if (write)
> +		flags |= HMM_PFN_REQ_WRITE;
> +
> +	if (!mmget_not_zero(userptr->notifier.mm)) {
> +		ret = -EFAULT;
> +		goto free_pfns;
> +	}
> +
> +	hmm_range.default_flags = flags;
> +	hmm_range.hmm_pfns = pfns;
> +	hmm_range.notifier = &userptr->notifier;
> +	hmm_range.start = start;
> +	hmm_range.end = end;
> +	hmm_range.dev_private_owner = vm->xe;
> +
> +	while (true) {
> +		hmm_range.notifier_seq = mmu_interval_read_begin(&userptr->notifier);

Nit: This could be set above in this code:

	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
	if (notifier_seq == userptr->notifier_seq)
		return 0;
 
i.e. drop local notifier_seq and set hmm_range.notifier_seq...

Then reset before continue in the if (ret == -EBUSY) function.

> +
> +		if (!is_mm_mmap_locked)
> +			mmap_read_lock(userptr->notifier.mm);
> +
> +		ret = hmm_range_fault(&hmm_range);
> +
> +		if (!is_mm_mmap_locked)
> +			mmap_read_unlock(userptr->notifier.mm);
> +
> +		if (ret == -EBUSY) {
> +			if (time_after(jiffies, timeout))
> +				break;
> +
> +			continue;
> +		}
> +		break;
> +	}
> +
> +	mmput(userptr->notifier.mm);
> +
> +	if (ret)
> +		goto free_pfns;
> +
> +	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
> +	if (ret)
> +		goto free_pfns;
> +
> +	xe_mark_range_accessed(&hmm_range, write);
> +	userptr->sg = &userptr->sgt;
> +	userptr->notifier_seq = hmm_range.notifier_seq;
> +
> +free_pfns:
> +	kvfree(pfns);
> +	return ret;
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
> new file mode 100644
> index 000000000000..40250e3f84d1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hmm.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT
> + *
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/types.h>
> +
> +struct xe_userptr_vma;
> +
> +#if IS_ENABLED(CONFIG_HMM_MIRROR)
> +int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked);
> +#else
> +static inline int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked)
> +{
> +	return -ENODEV;
> +}
> +#endif

Mentioned that I don't think is needed in last rev as our driver require
CONFIG_HMM_MIRROR to be built.

Matt

> +void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma);
> -- 
> 2.25.1
> 
