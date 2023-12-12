Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDD0C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 21:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E3010E6AC;
	Tue, 12 Dec 2023 21:05:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919EF10E6AC
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 21:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702415098; x=1733951098;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=L1OCggUbh0T+Pc7Xt9vFSWsUj1K3jyx+InCEAobQWKk=;
 b=iChWlSm3ow9K7oLu/4sbURfgaN7b7Ccs0kyUFF/GvqhRE64bGeWJOZMf
 79wvhAy+nRsyuyLdb154bWJ3irj7eGV6HzIztIwzohk/ykv862jOqQtzO
 ImTI8uYxcTn0K3JhSwUmo3AEGN2EznS7EjeO8nBPzn2VLRHZheqKW+POc
 WRrZDIBBfd/QHyq5rCm+fEXYBmweUtAnQWEUjKhDsNrvKxDUkq7Zqs6RQ
 oS6ZzkrZ/e4fZkHwxy2cMBK7isjCWF28EHDhJ9aueds40K4WYQtISPzN0
 SRVmsTTqbgQBAkM5UAbAwytRQTmeWYdvoGCC5LQqmMCoDSFhpZWxwSi8e w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="481067634"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="481067634"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:04:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="802618555"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="802618555"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 13:04:57 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 13:04:57 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 13:04:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 13:04:56 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 13:04:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIop1jpVTNU8cpfkpQQbzFDkRWEGmfFCfDkJ3fVJE1it5r8oPjF8VWwYRSGAzwfl6V+3CAxq5s/Z75SkxDJhL78WD52ZI8OX/zNtKknSZtAsNLYUSCLNj9vIHF6go2D0WCRz+46yhetHOiv7FmCKntZqfRJ12MGCYkapyEko7DAZSgfGWQjy+dYdwxF6lcRh+LD3myulsMs+dJG7c7NfiW1+tQWg8gxvoeIBv+EayVH+JFADbhZpEkjZNcGGptoMzPS3sF6LyRpgjt1dyTvFXyMyVKPUpRkhcAbUdqljn+pODPLblwn0kf74UN4KnXHu4shM/wALXCazcSeeH/IFWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyzHs6ETLcAjICJe8/ZydG9jgChVrgigYyHaQtoi34s=;
 b=IXRIHyMqNpPymwo+n/ZgG0Y2tNjM+Uvy/VlMIOE2RbhsetxU2X6JN7l4dgDrGoeS/tjewL7c9vkPpoPB79QKp3dECj+lvYIJV7z/kJ86XlNQvZKetBTzhtqCBvu/tKmemJFLlX6yN7LVkooV6PPBkX2QlK2ky2w78A68NQg41IsDsYA3uqZiXBomWoh/vsDQ/pZ0mGEhmo/w4Ex+bDFJt3I5iP91KRIV3TGJt2IUE5gFlVWbtMuo6C3YoOy0X4f6k1oQLGaCzw4amXmek9xdnKcSS6BoaDjwQ8eXuZ+36XCHeSeqHzBxFKQjY7P9LlbTBzLDF0PQLHDRhpHpOKD7WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW3PR11MB4539.namprd11.prod.outlook.com (2603:10b6:303:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 21:04:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 21:04:46 +0000
Date: Tue, 12 Dec 2023 13:04:44 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v8 01/10] drm/xe/xe2: Determine bios enablement for flat
 ccs on igfx
Message-ID: <20231212210441.GG1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231212182533.1722705-1-himal.prasad.ghimiray@intel.com>
 <20231212182533.1722705-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212182533.1722705-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY5PR17CA0065.namprd17.prod.outlook.com
 (2603:10b6:a03:167::42) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW3PR11MB4539:EE_
X-MS-Office365-Filtering-Correlation-Id: 710cbd24-1509-4746-d14b-08dbfb55f868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8wdshd7wQ4XVGLsuU9e0VeL9xF3enzUp7Qpb50vhUdeHp4GOHwCkFb05R9IWNcR8s2s0XL07fO5yGYSqy5gYiw3oDpFgojdBZ+aC+/CUF8Z+WJrcdE++W9bDSkeObkxMeNvpeujRoxNDDa7l6qM92Oujq3Zt/hUDCgmpy2WuxuM0PeGh58rN2d+gwKgIopnSZEMjNosb4PYynytCK6oFKgIImnyhHj+8qI0+OXh9J4pJR70ssLNmJgfqK65ULv38I05+AWXuujVdCxO/V6IxQJVmegE/0wf9E636lqysKtKJvHGxq2t/tUKGRmlqz5l4bwC0l8b8pff20Dwm15ReOiW/2wxqg8Wdn96vtaW0bue5CKq1oYGEDnj9lPsaIb4C+y+8fJwrDw1eZnBZx0vuAQDLI2kCvau6l9YNya3jlSkf/bmzMsZLRegJl4E6zvwb31txNz923RDwvUpMT0Uiq7pcO3YJ7weSjUvCLNRZ6t0ggTruOz+9+haB6JojYyO8wX+UdTrOUAKEMivj0NEaN3e5BVpvQPs+H5fOMu3D5qD4M0/09YXS2oijAg6+a+QF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(66946007)(6636002)(66556008)(66476007)(82960400001)(33656002)(86362001)(38100700002)(83380400001)(26005)(66574015)(1076003)(6512007)(6506007)(6486002)(2906002)(316002)(478600001)(6862004)(5660300002)(4326008)(8676002)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?m/0wfbhcNb+cDySDfd7Cvv4js7F3rUamZmySHjuh5KHpRLISu4gKURezq7?=
 =?iso-8859-1?Q?1EF+KjSugjeJx1ipI574Y4D/EuJEq27+TpdwRmmqK1IfVQnhZgTndU55eH?=
 =?iso-8859-1?Q?zOBMKt9L6LQQ3of5TC3S6W2YzBg68Q1PGN6gXzqgZ2PUqkRip8SsIdwbgV?=
 =?iso-8859-1?Q?UA9MUJ4oL/pJAnLz8QpgdXRjbZWg6cXLKDnPdCpyAUG96Owa/OYfKUBv3a?=
 =?iso-8859-1?Q?x3OR0caNft1BLkULVpnBXCN++MfryCmoEQNaPCh1e38txAWNlXgXa7n1mr?=
 =?iso-8859-1?Q?Z8IEUE2xwCF1VPUnhVdXv4rNp0Bq+qmWLF8T7s+pVPzqVncZDNOI02+w9F?=
 =?iso-8859-1?Q?25tqON3A+uOLBN6ucCM2Yi4sha5FcpWIN4Q83y0QjzgpH+0MYaN3RaflJ/?=
 =?iso-8859-1?Q?/DdYitRUC1Swf8F6+9ydtLSjxC+XaWj2Szk39JG1zw6E7Ka+iGa913hDZG?=
 =?iso-8859-1?Q?76/rEUvakwU4LCOm+G0lUY07i2862PgVE2yzLDMUATT3R4E/w+1pEyGkfx?=
 =?iso-8859-1?Q?6yC0tDbkfiHAtMMbp8IIy9Ms4URcZ1dq+6u/H5JU9IETYQR73x4b08qiN8?=
 =?iso-8859-1?Q?/5SUmC46dsUbBs9oUKCxruKo2HKhzHgMkWv651v6ymn2naAxxFZbluTWLZ?=
 =?iso-8859-1?Q?JaWiQub5t8XxD62AXmR3uZR3RfwqDUHaKAzKFKoVGapB47GIatAzpkhKKy?=
 =?iso-8859-1?Q?cc7vGz9ICMcOlJOGCztBBHZfUWfK3V/W3ZSjs/PuwNNOQ0/FC7lbLT17t7?=
 =?iso-8859-1?Q?/zHtKIgMhNiYZ3Q5f93AzZIq8H1JyflLOI00PE8fR2mA6m9auB/EyjZSfz?=
 =?iso-8859-1?Q?lvZ5tVgu22HUeM2raNFvssmdoe7PPrOZH8BAGxeFOtaFpxCpUmkzCUZOiK?=
 =?iso-8859-1?Q?vK0aCfTqIc+3FzD3FYU/26rlbw/NA2gMTFeifBbWcBV18ykqG3ejQiIPvM?=
 =?iso-8859-1?Q?5aoG9mBwhVqIwnI77zLsakR/SXNkOkbkw8Sr301vbW1Ht4lg9uy9Prx/7y?=
 =?iso-8859-1?Q?qwhnnAhBdXlyc8ziRbrGelLJGTRXwf4et10VNa9x7x8GoG3Jk/EuQy8G9X?=
 =?iso-8859-1?Q?dg/zUM8yZDMZSawNzBuQqvKZelFcpiNpMb06z9xTPjqs2iD/15gqbhc6rR?=
 =?iso-8859-1?Q?YBdEi5rKmfT95pvGNAC+M2Ldvit67Llt4lCoKgclsSfZwlPnr91s09gbqj?=
 =?iso-8859-1?Q?WvZrjN+dp0UzAlmZgB7kHT9tzltGSOtZ3QZ7bb6dSuuCJ00kRYR/wGAx2s?=
 =?iso-8859-1?Q?hLwyRnJ8DYvVl7s5RgYbxSwQnHvVgszvIx3ELWiU4NdaMN6p64P43dz4sV?=
 =?iso-8859-1?Q?kOt+hJCzxweGMp9HYzXHCCDJ0lXk9YwDwDo1PMF8jDkm4yW0vOGP4sen8M?=
 =?iso-8859-1?Q?YEbQtKGGG648nuZNjOdNDp86cHbfjEctSdW7Q+TujQ12G1h9oLcZfUN45z?=
 =?iso-8859-1?Q?+FhvACg7jmgw+X9kqP1VUa2LC81hvbQdQRx4xKdpNf0v8vOrdpf9NKAAVJ?=
 =?iso-8859-1?Q?PFnah+OT5k8jN/mFHbcgPOfY/LMW7YR9+GocRjyuFtsHl+9/r1etxZ3bUJ?=
 =?iso-8859-1?Q?/poAtkcxqekbYsOCJ4c2ULHOqmn+z9afTjQQrL7mJIUIEo15Rye8DjZtwE?=
 =?iso-8859-1?Q?MRf2c1Li66RJcrZG1rqywPlMn1EATPUD/EtsGdG/t1FEKIgXOTmltUDQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 710cbd24-1509-4746-d14b-08dbfb55f868
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 21:04:46.3054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvFgGeyf4z5xs38c3CFqoSet8LJyazrfr9j6CYwnle253tkKgU2A62SSSOg3EIIAAWiexVVJZ5YY6d7/eOyT4X2GIRzRDfHYiMhZ/uu7R1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 11:55:24PM +0530, Himal Prasad Ghimiray wrote:
> If bios disables flat ccs on igfx make has_flat_ccs as 0 and notify
> via drm_dbg.
> 
> Bspec:59255
> 
> v2:
>  - Release forcewake.
>  - Add registers in order.
>  - drop dgfx condition and only add it back in the future
> when the support for an Xe2 dgpu will be added.
> - Use drm_dbg instead of drm_info. (Matt)
> 
> v3:
>  - Address nit(Matt)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
>  drivers/gpu/drm/xe/xe_device.c       | 30 ++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 5f5a72e9d0d8..f5bf4c6d1761 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -162,6 +162,9 @@
>  #define XEHP_SQCM				XE_REG_MCR(0x8724)
>  #define   EN_32B_ACCESS				REG_BIT(30)
>  
> +#define XE2_FLAT_CCS_BASE_RANGE_LOWER		XE_REG_MCR(0x8800)
> +#define   XE2_FLAT_CCS_ENABLE			REG_BIT(0)
> +
>  #define GSCPSMI_BASE				XE_REG(0x880c)
>  
>  #define	MIRROR_FUSE3				XE_REG(0x9118)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 2e0b2e40d8f3..c819e22f827f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -16,6 +16,7 @@
>  #include <drm/xe_drm.h>
>  
>  #include "regs/xe_regs.h"
> +#include "regs/xe_gt_regs.h"

Nitpick:  this should come before xe_regs to maintain alphabetic order.

Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  #include "xe_bo.h"
>  #include "xe_debugfs.h"
>  #include "xe_display.h"
> @@ -26,6 +27,7 @@
>  #include "xe_exec.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> +#include "xe_gt_mcr.h"
>  #include "xe_irq.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> @@ -401,6 +403,30 @@ int xe_device_probe_early(struct xe_device *xe)
>  	return 0;
>  }
>  
> +static int xe_device_set_has_flat_ccs(struct  xe_device *xe)
> +{
> +	u32 reg;
> +	int err;
> +
> +	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
> +		return 0;
> +
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		return err;
> +
> +	reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
> +	xe->info.has_flat_ccs = (reg & XE2_FLAT_CCS_ENABLE);
> +
> +	if (!xe->info.has_flat_ccs)
> +		drm_dbg(&xe->drm,
> +			"Flat CCS has been disabled in bios, May lead to performance impact");
> +
> +	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +}
> +
>  int xe_device_probe(struct xe_device *xe)
>  {
>  	struct xe_tile *tile;
> @@ -456,6 +482,10 @@ int xe_device_probe(struct xe_device *xe)
>  			goto err_irq_shutdown;
>  	}
>  
> +	err = xe_device_set_has_flat_ccs(xe);
> +	if (err)
> +		return err;
> +
>  	err = xe_mmio_probe_vram(xe);
>  	if (err)
>  		goto err_irq_shutdown;
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
