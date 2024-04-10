Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57518CD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 21:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029B510E600;
	Wed, 10 Apr 2024 21:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W44nKDBQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1821F10E600
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 21:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712783663; x=1744319663;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6sVw2nyglQZLs9vxl/3SzleWOiE99n642lND3ZNAogo=;
 b=W44nKDBQrXhV6q6Hv6Np97ep05wPSgoOn8SShMVtNemaDaD+H4KT8jf5
 NIRufl1LJiv2VrwoU1BJz94eLQjhT5LSWhkwVa10wj+/MsilE+HYTr0/u
 5DEqswD5tWVqnfBvCr3jOq5RYlZXhEpPIqClyJ18onfhASIGbGRGhShvk
 6eSwGI7NFZC22ekJbS2HH0wRb8YEDRMUZdOHARY+23ZvVNGPSNpvy/dRy
 n4MPRXMe6lJqtWHvmXNvPlDPnm966sSkxK8y9lJGLBTk897jxm0FJJDOG
 Viy/5TdJFNMYCGx+zCZ8rtp0ivVv8EXxCM94SrGTQpi1ScZ5OkT3aV3N9 Q==;
X-CSE-ConnectionGUID: LRVC/lWfR16InDl/1RLKlg==
X-CSE-MsgGUID: 9RM72TsfSYisbYkWol2rkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19324068"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="19324068"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 14:14:22 -0700
X-CSE-ConnectionGUID: RE3uRovHTAye/nkOnZkIeg==
X-CSE-MsgGUID: Tlp6M/KSRnKq81mzro+shA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="43973387"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 14:14:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 14:14:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 14:14:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 14:14:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIENF5SnryTHHQrSPOE01Ty7OrmPTzN7zBiLWqd/yUKa3OuhVsf4Cm+CFndukwO4eSkUcXeWrT7QrYUujk16Q0sev7GdadbnGinefASe0Wb+e8XM7Hk9qBYsIpX/bxhUITB51iAXi8tGtp41ndB+W9c9d7b0apNqBLl60gW8NRdbuQYmvPQQgQsVaiTG4PhHKNNCu+7QaTPFW3Lh85/y4gzlv15pWmoJI2A2wOdBrHn7vE9UAZcamlahQkoq2K3BsLk+Yu9OeIJGp2IO3eKy28uWxvQ+e2xHpRiXbh+SoneCEh+dsn1spGOpdmmdUxUzQx2YgXazOVLlf0BrGnKnFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlDMsMi8Pnwnx/8t4d6pmxHX5RsRVB3WcuIN8yn4voo=;
 b=G7JXS+OmjGNSsz/9OU6016IdUE5ioPlpiqDf4T10ZZpcsIqnn04Yc6hNhE8Txjtq0BfYKBWQ1XubjjF/JmdQj3NFJSWfo7b0FeZ+6MTOiirP8guOwdk+BLGPNoUE557EBxFbO3Lp1/VXSPbAW3Q0Nw23EY1EWPwG100kdnDwAiqz9BeEtJ7YQ0g/O4pgozt4kyFXbHwENPs5k4QJg8fo1hTGWEykqvXLoV7EnSCXrcG1MsULL04zJvxeHi1xVUfSKSlDldkDmlGWTRWVTMaxPEOzSMlE5bdhpnu9K9sBhAlj9r/X87as4l8Nu98jHhEPuCk7rJV+J1MRpQjdeVcrHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7339.namprd11.prod.outlook.com (2603:10b6:930:9f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.10; Wed, 10 Apr
 2024 21:14:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 21:14:18 +0000
Date: Wed, 10 Apr 2024 21:13:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <krishnaiah.bommu@intel.com>, <Thomas.Hellstrom@linux.intel.com>,
 <brian.welty@intel.com>
Subject: Re: [v2 13/31] drm/xe/svm: Introduce DRM_XE_SVM kernel config
Message-ID: <ZhcA569I7IajGMHH@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-14-oak.zeng@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409201742.3042626-14-oak.zeng@intel.com>
X-ClientProxiedBy: BY3PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7339:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +SRN6IPdbUO6RpycX3aF3IO1dQs/FTwbNlAgPuvZiLiKYmfELQWmK8MJhRo8WCGDpRX3LjBbKyGy0frzFIyhqbWNh0qGeMSQ98zwYxKyoHUT63OxY8KcNMTjtzIV9EfbDZVqVn1R38bUMhm1339CS9tAwPolMfqcEvSxDGi/k9BH6tIPtmvhip0QdXbaWh27GRExuoMH9B3uE5MnSAe0NrGDU0q0tdMEeo8zoitfNMPjLRraNFXCOc1FrqYKxGlFjBBYBOy0KDkqG1BakmPn4UR6lmoIv/DD1wg+eANNzbQVJyPHUgnzW1YnZnV/GMcwouUHoY7c7Ln+X4+fxe8KOTlodByiFwHS9ykXpWZRvR1k3p6opnDpNDfKtqO9wrUnfAAmwN3vk9X1F9mdAJEPiHU5IK7e8Tzowd/gn6Vo3kgMfnYyTmhAm7sxAAkxRZZpBwLb4L9lqX2PKaCbJsC0NqsrAVYjdwp5n7Fdz4lhYfxAXlyUgcnkAmzuT3uqIsfzYZsUKoHF4SlO/O54QFlCgXsOohajafaKBuRxTgzx09A63sSqv+E9oTJte27Otlzw3a2RiV1KZfsLixdYV61Irh+aiu4H1vYD21wUj8XEBAvvGooyw6U7TsjeWf7+hLNkMhd+cLgSr0TNd5uPY/1dlWQMzdBd7luHqt3s+qboGao=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6JceQGQZ7XsqoDYBgCyqnCgBCoKPSljS0JTJ/nPXf2YTkwAb8rZrm3fLVu?=
 =?iso-8859-1?Q?rr/Q9i77d1ceDnWfNVFbfdU8G5zY9rEMReg/3Vd5stNXCBMnBzYvM69x6C?=
 =?iso-8859-1?Q?6Oxg8KzVz4sfdYhsAHHAgX01Z4m0Kc7uEPSjuBUc4B0G8ibeRg6UJyyCCg?=
 =?iso-8859-1?Q?nmMdetvEc6jbCjHd0eglsNURHsbbK85KtIKhx8QsWPFHvzEHFb6zVXGzO7?=
 =?iso-8859-1?Q?FkbCIexyZHmphKpoTja+GcJ2ufyBBea6yH9fkoojcRplYkjudCUYlzYJ1Y?=
 =?iso-8859-1?Q?lKieISO8UczfN3UwCd2OIxRGh+0EN5Kq0cvdyVufMA1Pv+usN5H0OoO71e?=
 =?iso-8859-1?Q?x/Qf7U7Ay+A7nbbay/p04thkYKMTY1Xw7awnnJnxYMsA4Fg5d7KKRZ9hIC?=
 =?iso-8859-1?Q?9IHR/Cdp+Gab3gSiq+IpsL126TuAIkzwfNrhtEV5U/vsIeuSC7+oPxp/0z?=
 =?iso-8859-1?Q?oKELS2dZQcghncokZ9tyndedah0eXPNbgh88JOX46j5oz0+HQ5eez/nnu+?=
 =?iso-8859-1?Q?jefW22j8uKnuencsRFRnJQJF8ZiFtBQ/GdT0zL7u7c+UhHlsqZRRX38zzF?=
 =?iso-8859-1?Q?2VvKKe/RIVebns+MhuKcJtt6ydVPek//qoup/7gH68232nV8QqBm5mcuuZ?=
 =?iso-8859-1?Q?wrvbLKseoJiRcKUFyiTvuXp0LzqDIQJ70vgWiVoLRM/oarn3xFYKTrIDjh?=
 =?iso-8859-1?Q?b4akeh2MszroyTDP8EcsThc9vn3raJkfNgP7Pk1hmA/3GyLNRV4BeYyBUg?=
 =?iso-8859-1?Q?iXDzAWnhdQL7CPsjuxIfY/tA6/GhtV5dweCtU6DpXTh4mfTq1u1DFZCGYC?=
 =?iso-8859-1?Q?stQPok1ddEZyVYL8PZMQnXEkMqsODHlSQW/RYZ/XTqVrP6w2xM5HgjFLW5?=
 =?iso-8859-1?Q?R4ecmb3DMF4ddPhXQ6SBkETt56u3hkk7tTqKo5PArKwg+cwLWEm1KGLuyx?=
 =?iso-8859-1?Q?uluDwCoLyQ+yCI3LUqBAhGgyrwH4LdkTOk/iKvCoLehAXvOmyh+fGHRFab?=
 =?iso-8859-1?Q?YVRB2AF+2jlGRxPS4a8vRZNslQ0cUnFLBUDpVFNtS43RHOTNgGQFXBct/i?=
 =?iso-8859-1?Q?RtXdPb1y5r5Vp/6h5yEDoIhL72l8n9DBJe55eyL3ycW94f3aAz+2+YdCk3?=
 =?iso-8859-1?Q?ffE9MvlOnZJGHE52zeIIO5fLnygUK4jWxkc8LnyO6fjUjh2mMAxRU5BlvD?=
 =?iso-8859-1?Q?LZB80yaMviUOclibWxA54Uv2Wmoal+Ye/Ne5Y7z1ES1drza07GR1IlFbQd?=
 =?iso-8859-1?Q?aAwPVSUF+bOd/kwyLdhP6m0xLRimOjVK7IbGPt4KZ3W5IQ7QGKYnPOLuuR?=
 =?iso-8859-1?Q?V0c9ZCksjytd/ztZ5XnzHfCyge4v6/swD2xJXngF/2U9LJFoHOJQBSN0IG?=
 =?iso-8859-1?Q?QTca/kEILWIdIhiuM1fmwHqe5sk50F0d93tkZLeqFtJ5Po7hWF7QjfEYHn?=
 =?iso-8859-1?Q?UCKscDF6DhYCFyID2GpCBCbnPTmUjWaWUp1SnQoGsnWHKQ9dcZKNeEe7NB?=
 =?iso-8859-1?Q?arLOqzeoXOcWZmFnxBM1nGa2hkepC+zNK5ikFrqLXAPpmlxl+sMrd+ZJCO?=
 =?iso-8859-1?Q?5Dw0knRiBQsGLWB7YQd9B1wa4JD5ROkj0/0a3v74OE5Umuxso3jer3aJnD?=
 =?iso-8859-1?Q?r3UUhkqoBEQItkKdy78t1QkWS12Urs0dpkpl6lPI3F/aWbvE1r1vR1qg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ee8482-1a9f-4e31-5790-08dc59a32edb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 21:14:18.1768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8o3EZprKAmvwwsqwJh8MDWdNFpl1J+MWmzn8kDjCeLF9BqxPgG0gs44nM+kNo6y4WS7wpu899sn2uqd3cONxCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7339
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

On Tue, Apr 09, 2024 at 04:17:24PM -0400, Oak Zeng wrote:
> Introduce a DRM_XE_SVM kernel config entry for

Maybe consider another name for this? I could see use cases for non-SVM
where we still want private pages mapped (e.g. VRAM userptrs on
non-faulting devices). Don't really have suggestion but worth
considering.

> xe svm feature. xe svm feature allows share
> virtual address space between CPU and GPU program.
> 
> v1: Improve commit message (Thomas)
>     Avoid using #if directive (Thomas)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig   | 21 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile.c |  7 +++++--
>  2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 449a1ecbc92a..0accb2cb81d6 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -84,6 +84,27 @@ config DRM_XE_FORCE_PROBE
>  	  4571.
>  
>  	  Use "!*" to block the probe of the driver for all known devices.
> +config DRM_XE_SVM
> +	bool "Enable Shared Virtual Memory support in xe"
> +	depends on DRM_XE
> +	depends on ARCH_ENABLE_MEMORY_HOTPLUG
> +	depends on ARCH_ENABLE_MEMORY_HOTREMOVE
> +	depends on MEMORY_HOTPLUG
> +	depends on MEMORY_HOTREMOVE
> +	depends on ARCH_HAS_PTE_DEVMAP
> +	depends on SPARSEMEM_VMEMMAP
> +	depends on ZONE_DEVICE
> +	depends on DEVICE_PRIVATE
> +	depends on MMU
> +	select HMM_MIRROR
> +	select MMU_NOTIFIER
> +	default y
> +	help
> +	  Choose this option if you want Shared Virtual Memory (SVM)
> +	  support in xe. With SVM, virtual address space is shared
> +	  between CPU and GPU. This means any virtual address such
> +	  as malloc or mmap returns, variables on stack, or global
> +	  memory pointers, can be used for GPU transparently.
>  
>  menu "drm/Xe Debugging"
>  depends on DRM_XE
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index f1c4f9de51df..a1a436912fe3 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -159,9 +159,12 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
>   */
>  int xe_tile_init_noalloc(struct xe_tile *tile)
>  {
> -	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_device __maybe_unused *xe;

Just assign this here blindly? The __maybe_unused should suppress the
warning CONFIG_DRM_XE_SVM is false and should just compile out if it is.

Matt 

>  	int err;
>  
> +	if (IS_ENABLED(CONFIG_DRM_XE_SVM))
> +		xe = tile_to_xe(tile);
> +
>  	xe_device_mem_access_get(tile_to_xe(tile));
>  
>  	err = tile_ttm_mgr_init(tile);
> @@ -177,7 +180,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>  
>  	xe_tile_sysfs_init(tile);
>  
> -	if (xe->info.has_usm)
> +	if (IS_ENABLED(CONFIG_DRM_XE_SVM) && xe->info.has_usm)
>  		xe_devm_add(tile, &tile->mem.vram);
>  err_mem_access:
>  	xe_device_mem_access_put(tile_to_xe(tile));
> -- 
> 2.26.3
> 
