Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63891C76188
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 22:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D274890CE;
	Mon,  3 Apr 2023 22:33:16 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11E010E5A3
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 22:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680561195; x=1712097195;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YdVI9YbUzwoPYvwz4VRAv9h7QJA2ivzDaQ0T1FhcV0E=;
 b=Gaz0c1l9ochZ+Hk34Rwa6aSFQQk+UXccC8kdqZupLwNLJsJI9YuPwycK
 qGXEnoGCtjmN+syOcBjqbaX9hTTdt46dwiCeMBQs9i4JrAcBaR3oVQf0+
 Va8mZCPqA7MMOUASEIbMo0JUk3OMZZAfELwlkMKvCjPKTBk15NV7iKaKY
 vxLo90G8dv1+NqQ1wcLiXL66/uwYKjFSh7XdtU2cG35zmS3hWfn+7MbAZ
 W8T82foRgLs5wgKbeVGOwrW4NEBEN8b2VInhnSLF8HyNNgUUVRZtlLP6L
 xC7XipPo9sgciZ7LGuq5hZyoGKdVrcAExvKplHylZ7jZQ5pU60d8SsB5p w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339521568"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="339521568"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 15:33:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="716441768"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="716441768"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 03 Apr 2023 15:33:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 15:33:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 15:33:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 15:33:14 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 15:33:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBbjXbCEeRk4kiqhQkOSCQqgi8PXP1g5UyZ5l7LonJYZlYuCBfzHP+oNuZWD46zCp/rVzh7wNY8y53m1vXaQi9LfLY6TkyotrlYNWUQw5bL2Xsftsff6w73sImsX8dgkD0xjDY+ATMX3EOmr1KbSnt5unv8kH3Vhdo7zXkm1eEqze+nvDxqlGKLXTxCLlfC075twEzglIhhE5wQQ5L/Dr5ig5IxgxIIhqURn3Z2F3ADs5iA09BmdSY6sUULN2fIX9csbcueJyYzlcU2vxq0ulORCn3z2pFLWes86PwxAArXmdKBWxRnAwgLBNJueeyTHESXwI1sOK1XzyXfHjuGIRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3SOzCcNZqmNfJrJkLQygi8xC4fHfhcc0AKgFyEA344=;
 b=Y0N65MayqEX2mAliucJlJNZePyF41Cf7a1VldnWTAb43zPVFr8/uHz5kUMcYC2QP7x4mHj8pO5LBAWgdr6pQAbL28VYcmOTnxVExusCsUMRcv8EJIlnzFQs7STeFORhRxU8AK1BVIeDb7YWV5yyRGjNREthR/M8A/IoJ+2X6dtxxfkF0cbIlwL3nnB3XgGTj/Tz7pwFfl5uGEWIW0ST9t+yX5gkgXgFQd/USMGYbYvAWq2hhY4YsBL+8bfNK3xhOQvIoS8IZRqZudsrWO48Clu4a83p5Ydr3QFHezkuT3vICuAFLM5si3XvAfbSfJEeCWKy+m2H+mr18NXVvdU8/cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BL3PR11MB6314.namprd11.prod.outlook.com (2603:10b6:208:3b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.34; Mon, 3 Apr
 2023 22:33:06 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 22:33:06 +0000
Date: Mon, 3 Apr 2023 15:33:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230403223302.GZ4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230401085151.1786204-1-lucas.demarchi@intel.com>
 <20230401085151.1786204-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230401085151.1786204-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::15) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BL3PR11MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c24d22c-2214-4ef2-1669-08db349364dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XPeN6PauU/xdLl7icttVVgGEcPhS8HWVO1jnPBTEggtlTvmOceZCRqtfdXrpCLgWy7thVjlVyZSWBu4nHGXzZSM1SYjHe/2YE93MEd8dxdl9ioo1QzsIEVpKc+KajEeq3VwfYIFsUO1dNUHRObspMecLXXS0bE3R2Glm+Oscz5vnIb8GOu82JsEa+W/Pcw5NMNy/nmeXpE0L6SaTuMbdIHioJkTzURozpa3XqidQyHyhij+Sg3FMF5Wfcuc8ZE2znMMNiW3mqUEEE6MXS/OJw9VqVlbaTQl56uJ4mHli831OkoIEKy9Uyzpzx9Yf6vv/WeiTzSLcyfJVmAwDhDoZYnvf0Nhvl/GJz5lj+EEefpCFWHtkXGf1WSOvMCy/LG0U3du94dIHzP8GOqBf6F9Ew682HMCPm51uB2/aSJPyYaCnn6UCM2vq2X4JrvdaNVtBbbDlDd4p3PfVj1vAdikHYIrHkHx0N5nblfY1kfQm9F0pK3qMQfGxHkH0+moWr72TYzqeL31S/7DKhhBs0g2SbejWRXJx+e9Xt/7mSJ2MGeoW65XyKW5d5XCLNc3V+69n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199021)(83380400001)(186003)(6486002)(66556008)(6666004)(66946007)(316002)(82960400001)(66476007)(6636002)(4326008)(41300700001)(2906002)(5660300002)(38100700002)(8936002)(8676002)(6862004)(86362001)(6512007)(26005)(1076003)(6506007)(33656002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eWsvBZH7r9HEbIc8NeriI3ZlbAEQi8qoh6G0APxZSvW6CscVXbaj4zgsOSvA?=
 =?us-ascii?Q?7cmQt2NXaIk/MuywDvdkgCnmtWGn+A4RQcs9HDhGm8kU9oNJd+qUhs4euGZM?=
 =?us-ascii?Q?25gI74yv7NehzlyhnB6V2kudK5wWzY99GV7x1PGWU/1HZJkKA9bZYy5OSurf?=
 =?us-ascii?Q?EaNDLNffo/uyQCly1zTzT4NUCSgWWfg3UM7KmU5w1gSof3SFkrNHWCw+eXCM?=
 =?us-ascii?Q?t7IctR19zuwG0164sPEPLJWGzoJIdeRPcYm0zbsqWKrcUTDxMpnCS9bQ4A5W?=
 =?us-ascii?Q?0OqkPGrlnVFkq4SQoM+0T0Ioc7arKOrwTdLWZniWYUqfY4l8QXDm1j6klUOi?=
 =?us-ascii?Q?Yfx7pPtoUgnTjacPcxC7UkEpjtGx9rizEuFoQSFJzp6/izjBl4EqPmAVthbT?=
 =?us-ascii?Q?Zr7AzGK5x0f2BWdVlgMXgwp5LvUptQtcO71ZLBAPZuHDbgatcHe1Ok3mLa8P?=
 =?us-ascii?Q?nen7oObLPe5VrHjCtP/kwl6eUptf6WMXiUWlxO0s/Pg55j+QuG+0Vlgb7B1y?=
 =?us-ascii?Q?Q7aCjC3MPghuhyN6A8V5k2+l/1q1V6QjHRL/vkpY/Tj66YUKlxqgxxrKNJt3?=
 =?us-ascii?Q?suaJbkrZB+MLcqWOpHzT4KLx62RbIjsi/0/CqBQFakCLQbGB7mDq0izBNJIB?=
 =?us-ascii?Q?hvsIdz5U9VYzTkY5EyIjWbpALumMwE/hCS7L3kV8X/qjvyQ5MCvz3V1Xpqu1?=
 =?us-ascii?Q?8aQLQ+G9+edF6/51gzYD/Y9qwAY7h8vfv0+ry5RFG/ZduHg+OBNUI0LuQ7Nd?=
 =?us-ascii?Q?CbE+0skYRpk604GAauMMez0rFuj4IvaRzPHNTPgdU7ZW9IZW8kmE2HbgwgyB?=
 =?us-ascii?Q?aXb3FhGpWCDvtZ/cJZGDIeJIFmBoVIwZZ437WN18ShpT7BIR41yxgEbvYAEG?=
 =?us-ascii?Q?LHtHuDJlBYLXY27P3psXubpTRqZVvqteVQAXOtpQdVNEmP2YGdm3cWNaTrw+?=
 =?us-ascii?Q?oG9J3b9Gmpr0k1VuHFpzSIw72DcGoVBW62ZcutuFlRWmd3ycIQryqlG2xuFj?=
 =?us-ascii?Q?jwF1w7KxxPED7sB8qrc/HFCVMQd6dHHcAGoa+IdFcJZbK0r06zb2/dFJx4vG?=
 =?us-ascii?Q?NQgQnr0g1fWmWgOxBc4QOtZnNqiKlQz0ozh8Wh1+nYgX3cXNlnT8eUWmcF6/?=
 =?us-ascii?Q?p2tDM0VJQMF3wG+xVEefi6K7CHhXTX9AddGI597lzidjrXyDyZkknHMJkh3I?=
 =?us-ascii?Q?69KaRnCFIFLtHebfLxfo84LkrmA4hm6TvLJKzweVV6B/XWoGTFBteuuN3kRB?=
 =?us-ascii?Q?KKpVtv79qtBS2rZJzyNdqT3hQEmh5tNZaPbH+S5hL9iOY83Tf0plO5aCAjQr?=
 =?us-ascii?Q?+r5KHUyBqKpcLI4AG7LihzfnVTegPh7nP2V1U20gnlvfnzE7SOZBswTxixMP?=
 =?us-ascii?Q?B/wsPZtv8kn2VhLgT1NgxidIlaSDeX5SHLHzsas48gOg48cdHSMkWYCjoNkt?=
 =?us-ascii?Q?lVoHzo4VDCCpFFF+G2rmt4pAXOdrMUSFE+498354EsdmvGqLQxYm23aAW2Jt?=
 =?us-ascii?Q?DyUjPopa5ZL8FBvBxOmiLyq8Efvn6Hia1Ix2lHm2IUbCrYImhNqGoQLfu/D8?=
 =?us-ascii?Q?//n43MpRNnQMpdvOeIPGWEj0JYY/7DSFd7PLtrtFPZJYK+eFdGvm5Xks42aN?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c24d22c-2214-4ef2-1669-08db349364dc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 22:33:06.1885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnwoYB8hw0h3FFMWyAtTNl/zAU3kbvk1OGPx668tt89FkUiMiOywfXWgPxyguZhanQcWzUkxkv3gIq3eLZ46og/0yx++LyoGiIrfQvN1s2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6314
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/7] drm/xe: Extract function to
 initialize xe->info
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Apr 01, 2023 at 01:51:45AM -0700, Lucas De Marchi wrote:
> Extract the part setting up from xe->info from xe_pci_probe() into its
> own function. This pairs nicely with the display counterpart, avoids
> info initialization to be placed elsewhere and helps future
> improvements to build fake devices for tests.
> 
> While at it, normalize the names a little bit: the _get() suffix may be
> mistaken by lock-related operation, so rename the function to
> "find_subplatform()". Also rename the variable to subplatform_desc to
> make it easier to understand, even if longer.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

There's going to be some more updates to how subplatforms get handled
once we get farther along with proper GMD_ID handling, but everything
here looks good for now.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 98 ++++++++++++++++++++-----------------
>  1 file changed, 54 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 91fed9d3105e..b990985b5771 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -349,7 +349,7 @@ static bool id_blocked(u16 device_id)
>  }
>  
>  static const struct xe_subplatform_desc *
> -subplatform_get(const struct xe_device *xe, const struct xe_device_desc *desc)
> +find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
>  {
>  	const struct xe_subplatform_desc *sp;
>  	const u16 *id;
> @@ -362,49 +362,12 @@ subplatform_get(const struct xe_device *xe, const struct xe_device_desc *desc)
>  	return NULL;
>  }
>  
> -static void xe_pci_remove(struct pci_dev *pdev)
> +static void xe_info_init(struct xe_device *xe,
> +			 const struct xe_device_desc *desc,
> +			 const struct xe_subplatform_desc *subplatform_desc)
>  {
> -	struct xe_device *xe;
> -
> -	xe = pci_get_drvdata(pdev);
> -	if (!xe) /* driver load aborted, nothing to cleanup */
> -		return;
> -
> -	xe_device_remove(xe);
> -	xe_pm_runtime_fini(xe);
> -	pci_set_drvdata(pdev, NULL);
> -}
> -
> -static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> -{
> -	const struct xe_device_desc *desc = (void *)ent->driver_data;
> -	const struct xe_subplatform_desc *spd;
> -	struct xe_device *xe;
>  	struct xe_gt *gt;
>  	u8 id;
> -	int err;
> -
> -	if (desc->require_force_probe && !id_forced(pdev->device)) {
> -		dev_info(&pdev->dev,
> -			 "Your graphics device %04x is not officially supported\n"
> -			 "by xe driver in this kernel version. To force Xe probe,\n"
> -			 "use xe.force_probe='%04x' and i915.force_probe='!%04x'\n"
> -			 "module parameters or CONFIG_DRM_XE_FORCE_PROBE='%04x' and\n"
> -			 "CONFIG_DRM_I915_FORCE_PROBE='!%04x' configuration options.\n",
> -			 pdev->device, pdev->device, pdev->device,
> -			 pdev->device, pdev->device);
> -		return -ENODEV;
> -	}
> -
> -	if (id_blocked(pdev->device)) {
> -		dev_info(&pdev->dev, "Probe blocked for device [%04x:%04x].\n",
> -			 pdev->vendor, pdev->device);
> -		return -ENODEV;
> -	}
> -
> -	xe = xe_device_create(pdev, ent);
> -	if (IS_ERR(xe))
> -		return PTR_ERR(xe);
>  
>  	xe->info.graphics_verx100 = desc->graphics_ver * 100 +
>  				    desc->graphics_rel;
> @@ -423,8 +386,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
>  	xe->info.has_link_copy_engine = desc->has_link_copy_engine;
>  
> -	spd = subplatform_get(xe, desc);
> -	xe->info.subplatform = spd ? spd->subplatform : XE_SUBPLATFORM_NONE;
> +	xe->info.subplatform = subplatform_desc ?
> +		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>  	xe->info.step = xe_step_get(xe);
>  
>  	for (id = 0; id < xe->info.tile_count; ++id) {
> @@ -449,11 +412,58 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  				desc->extra_gts[id - 1].mmio_adj_offset;
>  		}
>  	}
> +}
> +
> +static void xe_pci_remove(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe;
> +
> +	xe = pci_get_drvdata(pdev);
> +	if (!xe) /* driver load aborted, nothing to cleanup */
> +		return;
> +
> +	xe_device_remove(xe);
> +	xe_pm_runtime_fini(xe);
> +	pci_set_drvdata(pdev, NULL);
> +}
> +
> +static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> +{
> +	const struct xe_device_desc *desc = (void *)ent->driver_data;
> +	const struct xe_subplatform_desc *subplatform_desc;
> +	struct xe_device *xe;
> +	int err;
> +
> +	if (desc->require_force_probe && !id_forced(pdev->device)) {
> +		dev_info(&pdev->dev,
> +			 "Your graphics device %04x is not officially supported\n"
> +			 "by xe driver in this kernel version. To force Xe probe,\n"
> +			 "use xe.force_probe='%04x' and i915.force_probe='!%04x'\n"
> +			 "module parameters or CONFIG_DRM_XE_FORCE_PROBE='%04x' and\n"
> +			 "CONFIG_DRM_I915_FORCE_PROBE='!%04x' configuration options.\n",
> +			 pdev->device, pdev->device, pdev->device,
> +			 pdev->device, pdev->device);
> +		return -ENODEV;
> +	}
> +
> +	if (id_blocked(pdev->device)) {
> +		dev_info(&pdev->dev, "Probe blocked for device [%04x:%04x].\n",
> +			 pdev->vendor, pdev->device);
> +		return -ENODEV;
> +	}
> +
> +	xe = xe_device_create(pdev, ent);
> +	if (IS_ERR(xe))
> +		return PTR_ERR(xe);
> +
> +	subplatform_desc = find_subplatform(xe, desc);
>  
> +	xe_info_init(xe, desc, subplatform_desc);
>  	xe_display_info_init(xe);
>  
>  	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx100:%d media100:%d dma_m_s:%d tc:%d",
> -		desc->platform_name, spd ? spd->name : "",
> +		desc->platform_name,
> +		subplatform_desc ? subplatform_desc->name : "",
>  		xe->info.devid, xe->info.revid,
>  		xe->info.is_dgfx, xe->info.graphics_verx100,
>  		xe->info.media_verx100,
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
