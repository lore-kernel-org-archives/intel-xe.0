Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E59CD4F24
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 12:49:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DCC10EE42;
	Wed, 13 May 2026 12:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bp9557aq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A563910E287
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 12:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778676579; x=1810212579;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NSGAcJ0mgem9eEbF1BHgCduj9eo5MXeMLR4f9qiumLA=;
 b=bp9557aqcyIXn8wf6MOkM/VddjwGn1qTKEnoA6D4VOrQv2nfe7x+FTG/
 CO1tj77r+Y9j6/VdVpzh3P65j2tz9dm9GhGwWmrR7wOo4w0r8Uc3/HzgA
 DmcvrKF3oEMRf9cfU4SAwbfaDPA3QzZrYN5zBKIE7rxcjujx4iX1tpB86
 RuXlC60yz/Qp7j95pquHI1g7YeyRyz3ItKk1WASEeh1ajYBYTSPnKzUb/
 IZTvz8q6MA4epbxF50CNlmAqYFI61ak9d+4fGqogJeSJrPINNjdVe3vFz
 i8Qudpb9wwGHzUojrDGOt2Ncv5454jQ1uZE1G8dZpzbNoqfPdjxissABK g==;
X-CSE-ConnectionGUID: D875Eqz9SgWhvrpvapSWNw==
X-CSE-MsgGUID: eK977VS+QZGGaDV1PTc82g==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79632577"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79632577"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 05:49:39 -0700
X-CSE-ConnectionGUID: 3igeeHkpRrav7P6vaKxhmw==
X-CSE-MsgGUID: Y9eCsMN3S+aHrD6Rvsi1XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="231687956"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 05:49:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 05:49:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 05:49:37 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 05:49:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBw7qUGFHraiMskVS3Dy+CskgLR3tA3N2FrktYVKmJj7SGPzUgEkSr6NW3/AB1ddbi1DCgTROTjZ+IoOA5gKZ2Xtat+QQ6WD8iwYNFNuMuKYhSBdbGChStl+j0yCe8XGls6qb93ElYf49mRt3SvU6OzxZOnoAGD+2VkWGZ0nspkOdse8jE4kUFSc47m42bFazHFFmsq/l8aBb2fYdAohkJA2L6FBPpIYDZs4z5pQd913ja19bgthmle2M2ddkHeG+AkVSDzva32ecOfpSG3zKAWzEzaHXXnyDIpT9ABLcCVCgURe3RYcE53MtslYgANJhD1lXjEVOAwx0jZgjmWQqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBQDnXWpB1Uwbanxdy7Saa+ZzTMU6hDTlqetYJB9Q7w=;
 b=PRBKd2Kwpw1cwLJsxJmbp/mzQGTEMIm9Z810hLk4BRTCDaZY3sFt3qps+2cz04+JXltqwms0FF35GAH8sJfuiF8cTeTXfivqZeE1h6ZXn+rhupNE/mLCWNKrUbZ4jwsksLoDANoGdZL527Yn5PLMV9wo0oiHiRHnmDuHZsXXIFsG55utowAbIdahfT8e2fYE6Hn3cTSrohSYlQlj5OSDw6zK0Yal4cDrW9lUC2wytjlXOzZtEqCD/KkLwEU1M+zfTkXVUXBBYDkSnny5UV1vlTNqoCTFU9MfwM9evtLpVbkgFN3O7840MgiO6iBhXHBNUGCiqaumwmntI4VsM3axJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 12:49:31 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 12:49:31 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Add helper to detect real vs kunit xe_device
In-Reply-To: <20260512194514.3414-1-michal.wajdeczko@intel.com>
References: <20260512194514.3414-1-michal.wajdeczko@intel.com>
Date: Wed, 13 May 2026 09:49:27 -0300
Message-ID: <87ecjfcw4o.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0063.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::8) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SN7PR11MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c7f492-f01c-4887-86f1-08deb0ee13c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: +kKSWn5AgJv2TvsDZhkFic643schhybSNPcoCxiSxvZ8dXUftmNH9SUTiKuBu6xqpfcbrI0yrGKhHnglBQaYm3QDPfK47YCZuo7haikaUOi4xopwpxUM4x+s/WMwZAvLB8VaiWqHXzBhv9uPb9P0aE+ke7CCmEjib77oTsLcKcxcxO1ZdPRBC3akDwc/Fpdt0CcE7nZ1aQoCkw1nQxzanKcsnIMYtC3a/urkQ5tWZlTYkUiQle11WH2kamxaRtvaqHnIKUWknI1mYCvSzLjXre6Vqq06hRJ1O1Ceuw/bKPRpXiLpymUtD5JlQDIK5ExxQ9LGD32Pwm6De26N5883SsRJGAaY/3cZjlQh/u9YqSYeoM3T/B+KMtuNWe+YJbTUt75/AqLaHkQ9RtX/X5f8WgJXTnglQk83Jrj6wdSDwSLVVVwTGjNQHA4nyhhvtzLgKc67/6vGma4fVdsUcXWq1gaWHqoBL7h2E3aImkCp5JAcNBtHqUVsbUtMFpp1pbqI1Q/qQGl5mj+nvP/GR3s03y+zppiXZfMc/vOKODU3pB+CGey92DJl6sbcVppEplH1KWr4xtJ/79P6kVKVUbAVqVeKdw86abkNLvCVmbbTyMS/mgfB3eFZGphHKu3giEG+5kRrkYkE5KlyCRJ6ForiYtiLqgeejP1/tmPqcXW++O3G+9orkKz3cGZJTG6d9Pvj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(11063799003)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rXIr0QIktyqiE7AyXbudb0NiuJSS0CewaBmwYc/K+NEfXKyTMt3Q83yWklel?=
 =?us-ascii?Q?7crqqBLKsThoMwPRpTjwI/EZHMiPIOkIOkNuIXzndG4pVZdsh9/2qjM1GdEX?=
 =?us-ascii?Q?npvLh+KNOROFKeVWtP+JVtYp4K/ehT6qgi6gl860Fjt+GjW/WJpgGwkEwlhj?=
 =?us-ascii?Q?HHMZ+jRnGBU8obM/17uPi4eM8rrSJvv2iGz/gUAPv1YhQm5/pfq+k5Jc2YlO?=
 =?us-ascii?Q?mqptki2Befo+UrD2FpT+hwmdsf0P7xcp5+xHQseWxNzjl5SKIBWHkEBnP77l?=
 =?us-ascii?Q?yWVRUlnpazqZBbR3IsRJ5N40S45Z0VJz3K+AYbgH4irkCc6gI3ZX+Z9gEG3j?=
 =?us-ascii?Q?joVtHaeBGTchN7J57vwjpE6sUvPv5wLGhzHT1vDpmH+YtrQ7E6Eow2zcb7Cc?=
 =?us-ascii?Q?0iQKXsdpzn0iETTnP3nkh75vqRqmLJv7Z+9g4TjdsllDdTy8g+yObuxJbRnu?=
 =?us-ascii?Q?et/pPoLXDsZGZ/+ERYIj61iev9p2EbZ1XRwZOpZh8pU70RCEggg8NLnD99gB?=
 =?us-ascii?Q?xOeSfn8xMFccgmf1R8S1LfmN/OdsDkytIUYhUTm7otWLgtphHOnq98HmQ2Bm?=
 =?us-ascii?Q?hZ8PJwzmh7YYWucCtkCrleAsQ7q7Sey64M/gjPT82+/qzOXRDk34aDwfRU4w?=
 =?us-ascii?Q?/8mvzMonQHpSKQjLNcbukgKQ9ptX9NT7H8DO4QJyUkwAfxv9cN+hZ27Hf55n?=
 =?us-ascii?Q?7jepQNJ0ho93ArNK0vC/P7MCX1ZCiUsxi54AnxgiUg/xVr+6F1SrCF8jTV+z?=
 =?us-ascii?Q?nGBu7J8k5vIKWYIC6IkAQg31zNbR1EoyXH5/DsfNfetyBY0S5G0ibZO8/wd5?=
 =?us-ascii?Q?1cw2fM4nxbH0dmekhZ3eaRoPPLf5T7nmkdty8ldFoct98x1ab/bcN0H71yRm?=
 =?us-ascii?Q?jUX/n5cCGMRCnAyrZWdngWhHzjEfuWej+Ic5dB8zNO9HAo8c3Bmyvr5TpW6Y?=
 =?us-ascii?Q?dfevRQ5JTWnTlqFmdt3LyIlBgdpEgB/3dfvJ5N0vxH6vdxPxPJgr6AJhvtLM?=
 =?us-ascii?Q?snvZcFqeDnp7j93fG6BgyYGoCO4O7S7BOezFD2JTZHUs/tthgWul4CfVxgMw?=
 =?us-ascii?Q?Sza3R1gksTP96cVAJH+lGqyPWkPz+odwCWipIYt4V2oI1WEiKESaQTLfQnGy?=
 =?us-ascii?Q?VcDp1+pi018vwmrj22UyqagAAG12yarl+Ed3a21FK0oiLbKMNypCrLFRPOxg?=
 =?us-ascii?Q?vqIl8T2Ht9ic+lJXTB0+7dy/Ea9y3hHIWLnBL6HzWVrhSnGZ1q/46ADNpKkb?=
 =?us-ascii?Q?f6sQQ58sOcaLLDCnz8CCLRgkllNCIex20aHuQ21qncEIrSFUGcnunvfyRsw3?=
 =?us-ascii?Q?DwD6zj1gGwKUSHJ4w40KXhd5W/1jq1+HGv9hVJL8JF7tHrcBi88KUczUjtjD?=
 =?us-ascii?Q?9HPUSxncAHzcyZK14TKAjGXUuof8jexk4vaj9hhA7LwvjWUNZHEEOuUXFBJN?=
 =?us-ascii?Q?a8LVlAyp8IiLmCamzDwxZ101l+G0XyOoHw6Q3GLJmEZi4pwLM2wW8RDbvX1L?=
 =?us-ascii?Q?8Xm9AwrI2++88WH0tzDF78VHsRQwAefb2AdzCCGK7rl+r1fXcA3xIo4k6DVI?=
 =?us-ascii?Q?vHrUXSy6rVyvN6TB+D4FXBLPLwGSfdjKZvgHFCX3QYJPHhnUpFZEjFdz39No?=
 =?us-ascii?Q?cuh1nAzW31IcI5Apf/pW6zF7dQVgBO+yBk8AleAN6lefGoN3ZO3MdK0Stx6l?=
 =?us-ascii?Q?06dl8qaZhLnkGQSzsCk6blI3M/lwShtK9ycSV+4G7YVV+l+S3QWuSEg6SG8g?=
 =?us-ascii?Q?BIweSBB1oQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: YZ47L40oXBu9QyYsF7lIkFTEEIjXd2McTsvK5HmeE+MNhkg1GNAaiOjZf/fr9jzu+LEqMLy5Nqy60yxR4sy8iO3XksQPInwcNAtQomANQNW+BSlNDeDhfeXuAWOF7Y9TAQ5Fj0VmbGViz/52qUnjBQv5xwjLhK4IVnbBVJXsA51qFnnuSt2z6IYZuH3oqj1qG6J1WhYvaC29/xC+PboMu+MovG/J02qj7lUfWd7DZhs/yaEKZiwe3R8G/R6HTw6V2POeYLVbXEHa0xef6B8ued031O/70++Ugi11bC84ixbCRSy9d+DQALIRh9RlVlkoQ/WDyeJXL0L2m+ySVfsl8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c7f492-f01c-4887-86f1-08deb0ee13c7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 12:49:31.4843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83It9xJjDSQTqMwCgSAwrq85BmAcFyktMPmKrHpeWKaqEB5km+s66ZjCrjBFRY/KeC/4yQHojvsYoByWtxRzXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8264
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

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> In some cases we might want to know if we are running our test
> code on real vs kunit xe device; also use of static kunit stub
> might be not possible as test code might be use other threads.
>
> As only real xe_device instances will be on the true PCI bus,
> and all kunit fake devices are attached to the kunit_bus_type,
> add helper that checks underlying bus to determine xe status.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 2 ++
>  drivers/gpu/drm/xe/xe_device.h              | 5 +++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> index bc5156966ce9..28d7d1618638 100644
> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> @@ -39,6 +39,7 @@ struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
>  					       struct xe_device,
>  					       drm, DRIVER_GEM);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
> +	KUNIT_ASSERT_FALSE(test, xe_device_is_real(xe));
>  	return xe;
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_alloc_xe_device);
> @@ -118,6 +119,7 @@ int xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
>  
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
>  	kunit_info(test, "running on %s device\n", xe->info.platform_name);
> +	KUNIT_ASSERT_TRUE(test, xe_device_is_real(xe));
>  
>  	KUNIT_ASSERT_FALSE(test, xe_device_wedged(xe));
>  	xe_pm_runtime_get(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 355d69dc8f54..c14624a19808 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -220,6 +220,11 @@ static inline bool xe_device_is_admin_only(const struct xe_device *xe)
>  }
>  #endif
>  
> +static inline bool xe_device_is_real(const struct xe_device *xe)
> +{
> +	return xe->drm.dev->bus == &pci_bus_type;
> +}
> +

Are we going to have any use of this function outside of testing code?
I wonder if we should keep it part of xe_kunit_helpers.

In any case, the asserts are useful, so, with the patch as-is:

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>  /*
>   * Occasionally it is seen that the G2H worker starts running after a delay of more than
>   * a second even after being queued and activated by the Linux workqueue subsystem. This
> -- 
> 2.47.1
