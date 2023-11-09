Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9D5C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 18:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1825010E22A;
	Thu,  9 Nov 2023 18:58:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DC410E22A
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 18:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699556336; x=1731092336;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6HGt68z9Wc8U5vxwgwU2FuEWwC1lxDUSBU+Hbuu34Xo=;
 b=mbXjkXBN3uDfYaKk00WQ6WZ/emy42x9wPMB3hL35YvNANmca+uzdU8BM
 jeHfs3SwRbID90/JU0ke+IjXGnHvJgdRKemnbs24MVRoQ7jzWRizw2N4u
 nh8OzmQh1y3OhSlFat8+z/7ExRGR9Cbl1kb+TWRxYrQ//LcwUblO3GIGK
 SDoXe/7DENbr9aw8Ez1z9uxsi2XI7EOBlODapBE80nFI74kO/a3c+2WrR
 y+Qq0d0TMgbDhuXvSu36wJ7GiC4P+COTlIT+oYP1DEFTdwXcOg7yPJmO2
 yihW7gKm8HDZHoLiH8KFFMsbuwSUnra9pY3eLpxoZf3c3o/dldl4JFmjg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3035907"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="3035907"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 10:58:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="4810633"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 10:58:55 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 10:58:55 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 10:58:55 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 10:58:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9MsdM/K36AwyKYf84KYcnLYbigWHrKFG45YxDwj66ATBNyDrfXMURKPQxS62xbgaNXQdzaayV2tdUa/up7AtscEltnTQtubV+4W4Fbr2P0BDadoXM+eLpQ0JV95ox2XxBre6KiL8eHjia6IzZ6c776P6QuiI+hY/ivZkKltR1OzlI+HVsov0lX1x52q3rk9f+6zOH6nyVM5p5TCXzkJxT0xwEcQ5H4LpkUBYP8WOHVq0kOulTgGd6Iz4K4jl/8LEPo7quKsgw6pysAbogHhtjOOyzSqhbG1nkX0zjI8WoBzvJTAMDMXD/uD1wMzyLi5MPCd+YgIAZ9KxhQMhWFcIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yYzqy/Tu1bE4mG6aXvevglNIz8jOPpuVfFVL2+KJLs=;
 b=FyJcbI6Chpa8JAVHZ1TePBE2sk++g8WaB1WY3VTBgu9KYFdVGRCYlR4rg8meN35YTVU+gN2OMRtndFzG0WRzZpcHL3IjzcUyh3UHdfMgvL/aJt6pmrlto3aFUTpmhgLNWIByttcwj3JKsidboXpZRSc8gZArspMmExpJAnNeN0Hyiw3+60TBFao5OxJWp43zUtvmD7HtzgUW3+j4Qjo2DvJG02VotWhua5t+mXYG7wuAU8zBWWIXd+1qqHDYn3s+8MvPWdWwcSj5rHVSwK42eY2jsNIK6paMR52XaAb6KKhnxBDsbdgv7cF6zsaQC7axdPuqrP8j9gfofCszpXgupQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV3PR11MB8459.namprd11.prod.outlook.com (2603:10b6:408:1b0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 18:58:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 18:58:53 +0000
Date: Thu, 9 Nov 2023 13:58:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZU0r6dkf8vyFAlUo@intel.com>
References: <20231109175132.3084142-1-lucas.demarchi@intel.com>
 <20231109175132.3084142-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231109175132.3084142-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0334.namprd03.prod.outlook.com
 (2603:10b6:303:dc::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV3PR11MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dfe7961-45e2-44e6-3327-08dbe155eae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HHkn+6v4Nn2fQnc9GpZ1OCFpaQNXpi2jKbS7JTC3G0y+dh7oTIV/S02X2SMYMguNodNQkRGUzPipxCKrl+Rk2SkfrLAf3zHRLEnYQ3H0Svu+tCFSkiWhXP26c7Rt1Slcd2bhq1RF7pz+poz95PnZEIZMvsdl16zG1xSvY6ZaLmcamlG5mrd4C+rIz/B+B/UqwQRbglT/hVzudPF88Oqd95qm34AelfH/st5VvfBOijZV1r0FwT+XPwyUIiO0KNcoEVOSloyBDgpV209xdxAIyJmyJLbZBKD/YJohEaS9q4LaTyb3h9P9lzu3Jigqlz/Ca/CN6g9R2MlXO5J5Kd1V+EGxDj3lBPcxLW+0eJ2t+cWHsXXR4Ida6IVYbUH+XwrA822zoFOH4NbfIa6z/s5TeqLXg9h0IRkKgg0Gwx8j1FOd9VTcMVsqTYh0qAOBaSQOQqdqjAojIkn7VTZWHgFjfU4eGF9fYZJof1sQHvPIvZDN4aJJmBHvgrWBYzbA4fcTs3+KN1iE6YWmmkRJqxkbMZPAj6rOwsItx83HX4sVyDQknFOFtmnwPwrYRLZQa+vc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(316002)(8936002)(4326008)(8676002)(6862004)(86362001)(66476007)(66556008)(37006003)(41300700001)(2616005)(6506007)(6636002)(66946007)(6512007)(38100700002)(82960400001)(2906002)(44832011)(6666004)(83380400001)(26005)(5660300002)(6486002)(36756003)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sv2XDDfGTqXkOtDy4o/GWJXbFWb+LRghEWQ2LzRo73/6EQ42uYAKTUuNPk/a?=
 =?us-ascii?Q?F40jTB2gNY30dnv0srRDF+3Hs4eREFsdgGBTqHcb73qssXOcAWzmgkCG1eEq?=
 =?us-ascii?Q?7Reh8uWV0wD9fo6rEeTUNnB5Yl7FZmvRbFrMJl7VECC4TpoDVdvLQ92T7MgL?=
 =?us-ascii?Q?CgO2bgUH8QeGb4a3e3gq+43JTczUaRMronSSxFFFpQG/pXHyNpIGvdODr2SX?=
 =?us-ascii?Q?EdMGPNCk8Wz0kg3VpeFdWHENuuymSdd0LeDj6lPI7pRHL1CkXhTeLJjYaPpp?=
 =?us-ascii?Q?tAnuBYaByrjnvya+OBV2hLkpGbBwPvrH1VjTBaNmBL8o2b6l8ypnxtOAFbEE?=
 =?us-ascii?Q?O5bzeO3KSv5eAmJkgpaK9NRvgDxb80nE6SbjBL6BU2UMqfdYSCTux9OPBQ6L?=
 =?us-ascii?Q?IDfjb8U7gP2CjaFxnGhj5bCXKaLRf+0ZCPGQnRycVxrmQOJEg9EBBMm/nZpB?=
 =?us-ascii?Q?yXpnXlucwLhTN2FjBsX7Q0UmE0Ps68AMIDb3Q6vdKwGgctoL95c89tXnBrVI?=
 =?us-ascii?Q?d6M5TUqp16Cs541O5QgEOchviBxhppu15ychCe6CnrpVcYLU9o73tauZ7048?=
 =?us-ascii?Q?QGjsZd/uQD278XZh7da3MtqH4l/G4KFUGHEX+2nTQeCay66yjbzLIsNQlWcf?=
 =?us-ascii?Q?2Lo0z5WvCuxLW6No3cTXWOVW9nslAvUaVStinhVqo2cgzgrZlWj6qhDGmBZX?=
 =?us-ascii?Q?eCrLEwNynKLj46M3IX/SeNY/zf9vS15Lx5TF3YCT5PUM/RCrqkmlOU8ST4Y/?=
 =?us-ascii?Q?2lTyZdfnPViQfVut/7DiGaFgZPzCFQr6Xn4T3QfOF8QDMGqS3rgsX1yN/tA7?=
 =?us-ascii?Q?6Bkd0uObltxTO+TDbBSQt+o+QPwQUjcSWwftJf38CZQSZgsA3TG/N3zX9vVo?=
 =?us-ascii?Q?THmZN7kMCMTbdWBcpo8Mr/V5Ov46UWfT+oIrR/t4PHe35icQ7SZcSfxkrOvI?=
 =?us-ascii?Q?HG9jB5DbTHSRpykE295cy1aquf+b/lVhWn0H9mb0q7kk7sMB8gv4QwCsG7TL?=
 =?us-ascii?Q?vst6glgMztfGZtkV7rPhze3KqzcYKmFDCWABusLp/3BqzEWqoGq6EPCpLKFF?=
 =?us-ascii?Q?DsPuNQHw0UuF5UPwHuRfsznG6sXL53DEK/Kc3IdRKJ0EKNeU9aUGyKakUVYe?=
 =?us-ascii?Q?3/bIhb/BYl5qAFFRPDAFEZvdVz/rs6LTO/qn5zRCeJbxlo8bCuw31YfcWlMT?=
 =?us-ascii?Q?PwTeMglo6UhFVw9a89fYlBLzXjI8nvgGur5nc2McN5HQMNyBVvJaDT18GO/+?=
 =?us-ascii?Q?5LyTt8/Q23kkX3xVXuWKyLWcsfy2M4iAhkdAzj2oDa1zb14+zPeBCCNwjb3k?=
 =?us-ascii?Q?sxNxqFdAUVqFzxOSmJvRBrT5zSEvdueP4ZTHxtkEfpDzq5/p/f8P6WnrKVIP?=
 =?us-ascii?Q?LhNbCypUzWgK/D1AIVLrYmgqlBo7OA/zpPkXQlAa5CRyJ4a70hgKO5DPCfIf?=
 =?us-ascii?Q?aIPtR2vnn72L/BV3ZQv6PDayObsvr7W4RNNhMOv374leT6o9F6Y1SrrGarVC?=
 =?us-ascii?Q?rjvfkJQGeMg0NfakmUhmwVgjGhTa1ZOnt/Fglg1fzb5M8EWLVRQo05NC01Po?=
 =?us-ascii?Q?bTXHyzGTHSfa+3sCeNVjx8eYg31K+usSzHf6pL9RPFrob7kBv0r2ctILxAVG?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dfe7961-45e2-44e6-3327-08dbe155eae2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 18:58:53.5069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojmFUF7jiPlBhyWCAIQJNlg7Ug50bSDGZkF4IZxkY+d806Dgs1i3iqZXp9SkXAJkM/nBUsLMtF6RWzNpGaoLQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8459
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Fix build with KUNIT=m
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 09, 2023 at 09:51:32AM -0800, Lucas De Marchi wrote:
> Due to the current integration between "live" xe kunit tests and kunit,
> it's not possible to have a build with the following combination:
> 
> 	CONFIG_DRM_XE=y
> 	CONFIG_KUNIT=m
> 
> ... even if kconfig doesn't block it. The reason for the failure is that
> some compilation units are pulled in xe.ko:
> 
> 	drivers/gpu/drm/xe/xe_bo.c:#include "tests/xe_bo.c"
> 	drivers/gpu/drm/xe/xe_dma_buf.c:#include "tests/xe_dma_buf.c"
> 	drivers/gpu/drm/xe/xe_migrate.c:#include "tests/xe_migrate.c"
> 	drivers/gpu/drm/xe/xe_pci.c:#include "tests/xe_pci.c"
> 
> Those files shouldn't use symbols from kunit, which should be reserved
> to the tests/*_test.c files. Detangling this dependency doesn't seem
> very straightforward, so fix the immediate issue instructing kconfig to
> block the problematic configuration.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 2fa2d6dacb96..5b3da06e7ba3 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_XE
>  	tristate "Intel Xe Graphics"
> -	depends on DRM && PCI && MMU
> +	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
>  	select INTERVAL_TREE
>  	# we need shmfs for the swappable backing store, and in particular
>  	# the shmem_readpage() which depends upon tmpfs
> -- 
> 2.40.1
> 
