Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644FFC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 17:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52B810EA48;
	Fri,  3 Nov 2023 17:41:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9750B10EA46
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 17:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699033239; x=1730569239;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PLa/RtxUXKBA5Qbz3moqjuPyw9MT3IqfOhnG+FWlwds=;
 b=gd5zw1dRzSUXKQoaiDEJdmic/JBz33Z5wxe2Hrpp0eitedErA9NaVyt1
 qsk9bpHUgF9V1qq54QYUMhI7BA8M2QluGDtNze3GLtyHBEi/S/gqX29IJ
 nKlaC9aX+KBPkVyZBDkFi0tt+P17CqfuYVHV0ixGH1Nc1JG6uzpQHfKnU
 oR1I4bv6JVIJ4SHNYTymqEoqfLQPkXIoDnqCIDg/zuGUVoc3QK6QQaqCt
 fq4CgnqOz2Hz9cpuaGp6N/XY7TO5qS5AQIjsz/RYdum8dnJ4Y3FRxvgcs
 mxuJxLSfxXnihyIehwYZ5vEPmDRmYl8irvaLAo0m9Sa/Ia/tw5sSdQFCc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1871129"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="1871129"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 10:39:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="827557013"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="827557013"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 10:39:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 10:39:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 10:39:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 10:39:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 10:39:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/X+fpUy7XdMNVL9YFjzgkg74ST1uFlbpi/0ozQomYyHtI2GvI2wAITMVnlqvEWaNH95L++T0/gKw25r6vqJMhKW5/6+bqU6qaNoG7EvCCA6EiMLrCCPooQSWXX6cPEYCAbTpUgvckIk8yANExzGdZ21/leCyFCkLPR6OiJ6zcyp4y782jjh3vS4s/CXvnoZF2qN1Nb52g/G+IqjMAI1Jaave0+op8vATGsASaYG80tu4TczSaCfxmjtbdCEDqWHf/X+vtPXsl30DwqiHQobHPjGjG6oUuUMO3vx+Q661mHA5IT7Fn7jLeBCvbeuzWBThGw0MzcEatOm1TPVUbqSMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHd4XgJ0LpIxeZz7ONGN4uE8J4/KC4tA85+2fDcwgCw=;
 b=aGTTY3FMQP1T3wgDvaClYTzeUNnbClB0/8xafsT11VxtUrbYyEL+6JukYQOnfK+oiZV/rbNRCfkfmctf6SLyyMRmBaNhurhmqGo60jwj2CdSN1kMuW0HnG6Tsf35I7WpnQMVZ6asYduzNOv58i5irxKVDO4kogZ3WOQcqBA4SMbn3S+zUTftlAjzHeUrKff/IP+k9P7b5hoPmUCSJ3Dqb4fTPDYqwmRRwqBqPSbQR5fUh25Yqx91Zx6tS+DKHcuL4dQ2Y8MMd0yvduSZGx9BkmUD9KH2HP5/EX7SDAQVnh2TfIy5Oyqc2zL+8b/p36aye4kMU7yTLp1bIKMmL60EWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB8499.namprd11.prod.outlook.com (2603:10b6:a03:578::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 17:39:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e%6]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 17:39:24 +0000
Date: Fri, 3 Nov 2023 13:39:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Message-ID: <ZUUwR1ZZOz/U8tF8@intel.com>
References: <20231027-xe-ups-driver_flr-v4-1-5a169a54624c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231027-xe-ups-driver_flr-v4-1-5a169a54624c@intel.com>
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: 6990d9ca-8391-4cd2-b0fe-08dbdc93d207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s9oiifHyut+BY6N821yes314y1FpZrtoK5WHV5t+okJzP7XsK+oYqF17W6fqv+RDr6Zvwe0NQEhaGPrGN3FeOVzdjld7n1uNkaJR+TOdsydmG2dTgrgEtakdaMnglO+ZUGVmbZsDEsRbIInBzD1E0XP6f50/Rjuin6kp30bdobDejz/gTLLE+LvAj+1CrdwxMYgmbZTSGMGicmIdtYXmoWlFyj2/5h9u4BMQbMfCEODtV7R9ESqZKWwpLe7FGXeC9P3uD2OP91B7J4pnuvJd+DMIHUFMEyK1MIJ0Zne9AuU9g52HKDPIKJIOy26IG9PDrKcQ4Z0hVPYruS6AoVP9WaFVx31H/S2c/aCBeDO2ELY9sdgZ8hi8O0sTHyhzgQ1VkngDMzypXkWT36KD1UavRSq+ZeOF52K++SiACND6l0yBkR3buQ2CEKZ++Z5GPi1gzGB1iDnknGz9uTjCQBbYDMVYL7+KQODnziSeIlG7tMeXA6XGnalA9k4bWpwq38rXFAISH4IEJF/Tib3yL4Re5diNBoky3mir89rFSQk4Nkw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(376002)(346002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2906002)(8936002)(4326008)(6862004)(8676002)(44832011)(5660300002)(82960400001)(41300700001)(36756003)(86362001)(478600001)(26005)(6486002)(966005)(2616005)(37006003)(6512007)(6666004)(6506007)(6636002)(83380400001)(66946007)(66476007)(66556008)(316002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0MRtDL/BDf+8bG5gyuCTmelVRqeOgmpqw6VrbWEI2x+6sJ6tzBaJyk5TUPCd?=
 =?us-ascii?Q?uVLB5VXjnkPVNb2JtIVdCSC2tqlGnFrmlZBOp0hiZiFyYnvOlVzbhHM5Vs7T?=
 =?us-ascii?Q?xTbAOEbET7CrNnWty1AJQCtRC3RWI4Xl31mHVx7HaZZWaCN41eJ01ks3oXiX?=
 =?us-ascii?Q?IcY+rXHZj5Ga+aI9b5DIGAs/MYdAWkPCnNe66LNyzZQBhLm+O2j5BLOUk95t?=
 =?us-ascii?Q?6tyCdJo76VzzyAouN45I+jS4kSd8eyQbRy36VlHouVDUNSbvdtHX7bCCDi6+?=
 =?us-ascii?Q?llG8vWrLPXTcncxsSusAcwajVb4KFtl/gJdAGlmB/ti7O+y569yY4cT6mqyN?=
 =?us-ascii?Q?BlLlK57+ScKPcr/S5RBICLVyrKUMgbPrIczPMkD5MTC0x9eCQI7kwXEDiMiM?=
 =?us-ascii?Q?qV0oor1W1lXHC1cE/AEazRDth2Le70dmOGclKZv5omcdI9fbBZzfYJgmxEwD?=
 =?us-ascii?Q?Itgf/KGHzqw0PMvTTa0oxU/Qi92TlauN4pVzuk+FrPa6lsEXcIftyw0U2B6l?=
 =?us-ascii?Q?NrdpcHkpAJq37Fj+4sWyvR0DogO/HzwPQ10838rkQro21z0sNw6Q+vfVK7RA?=
 =?us-ascii?Q?vfEX9KZFt67B1Fj/yoAhn7aGO2DHUMY0PwHj5pdlpmUhoSwNge6h8zPFC567?=
 =?us-ascii?Q?s/BRpcP0tjyT0Zv9NQrutoffjNmArA5K7Y+Wb0h911Z4KynQEKcB2/nE2BKi?=
 =?us-ascii?Q?MkI8lIqo1YpuoZVfWv/4CDmhOcrVkVr7g+Ak6L4xGfrf/Xxu2PH/C/PRx7tA?=
 =?us-ascii?Q?CpfQUDxm1Zyc84GZ2s4avjRfNQB9xDDF8wfsxU9vQ37I5wlOtQOg6o5poJ+6?=
 =?us-ascii?Q?5dzqoCDd8sVue/bRCAJfWWEBi7uyQwKk24w6IzILAVALLCe0d+dxX52ClIf4?=
 =?us-ascii?Q?s7kNx7dbFRo2mO540BZ8WpBzw0f70PtNncwThbdIvB8qE0GR2BkryGGLSVtP?=
 =?us-ascii?Q?j7NCBGryWz1Zm5Iuk1NoLKfHGFV2MO8WAPVLbik459hvrd9grykrKgFTTRQP?=
 =?us-ascii?Q?DITyXF7vsGs1QotGk370kBhrltsvvGBcSYFu/yktKDENBvN+iODipzJOVYjc?=
 =?us-ascii?Q?8ju50nNtUR/8a4RC/ukE477ZSkamKLOWSGccXUfDT6eDiIzjMAMFzWNrupXK?=
 =?us-ascii?Q?mIC8RzStxzQxoEZn923s75nFKx8OseZC8FPN708plmNtpdjDiqqQwV+EPpJV?=
 =?us-ascii?Q?XWzGOLVLQgaRqvfoDZlN+d1pMCXg6rfqZkBwQQz1nMYyblK5N5DtNwhdmtaY?=
 =?us-ascii?Q?BHn96/hviEvzx4Hb/wSb5oJZV8Dq1V9P6s8ddOQ35pLdmq3Q8NFL2cD6njEM?=
 =?us-ascii?Q?YfX9lhihkYHkSE2UbQG9yNnQtHQRUNgONmT2uxjxG894qzIquRqNEGwFjD5D?=
 =?us-ascii?Q?UaTOxzwP5vyy11/nXeWLte086K4ftNQBd66IpHLjw25N8QM9jcco7yB0jXQf?=
 =?us-ascii?Q?hIQCDAWLZskZrg+HrwZHg0YoY1b7fJ1QXaoGmDDhXYkMz7xmF55ucmOL5gpi?=
 =?us-ascii?Q?W5zKRJarBr7m7Tgmyzh1vr0HlmA7inOWnK7hAeC480avlYi0G22laVcykVMz?=
 =?us-ascii?Q?N01a89y9GziNYIVvKq2tYr4j+h5vu/6bhOUoxk0g6S+2QrLn8bWJVBhZSnrS?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6990d9ca-8391-4cd2-b0fe-08dbdc93d207
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 17:39:24.7416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vg2BfWC9Ui4oJep6uPOY3M5xWnuCZk3Rmb2PaPMObGyZ2DWjunjBqVBJloC9KFfswcwyLx3GAiEZK9BexPgdyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8499
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4] drm/xe: implement driver initiated
 function-reset
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

On Fri, Oct 27, 2023 at 11:42:55AM +0200, Andrzej Hajda wrote:
> Driver initiated function-reset (FLR) is the highest level of reset
> that we can trigger from within the driver. In contrast to PCI FLR it
> doesn't require re-enumeration of PCI BAR. It can be useful in case
> GT fails to reset. It is also the only way to trigger GSC reset from
> the driver and can be used in future addition of GSC support.
> 
> v2:
>   - use regs from xe_regs.h
>   - move the flag to xe.mmio
>   - call flr only on root gt
>   - use BIOS protection check
>   - copy/paste comments from i915
> v3:
>   - flr code moved to xe_device.c
> v4:
>   - needs_flr_on_fini moved to xe_device
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

pushed do drm-xe-next. Thanks for the patches and review.

> ---
> - Link to v3: https://lore.kernel.org/r/20231024-xe-ups-driver_flr-v3-1-5b7d63b92fde@intel.com
> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h    |  7 ++++
>  drivers/gpu/drm/xe/xe_device.c       | 78 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device_types.h |  3 ++
>  drivers/gpu/drm/xe/xe_gt.c           |  2 +
>  4 files changed, 90 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 2240cd157603fc..a646d13af03ac7 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -57,8 +57,15 @@
>  
>  #define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
>  
> +#define GU_CNTL_PROTECTED			XE_REG(0x10100C)
> +#define   DRIVERINT_FLR_DIS			REG_BIT(31)
> +
>  #define GU_CNTL					XE_REG(0x101010)
>  #define   LMEM_INIT				REG_BIT(7)
> +#define   DRIVERFLR				REG_BIT(31)
> +
> +#define GU_DEBUG				XE_REG(0x101018)
> +#define   DRIVERFLR_STATUS			REG_BIT(31)
>  
>  #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
>  #define   SGSI_SIDECLK_DIS			REG_BIT(17)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8341acf66e5f92..515cdf599fab31 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -5,6 +5,8 @@
>  
>  #include "xe_device.h"
>  
> +#include <linux/units.h>
> +
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_gem_ttm_helper.h>
> @@ -260,6 +262,78 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	return ERR_PTR(err);
>  }
>  
> +/*
> + * The driver-initiated FLR is the highest level of reset that we can trigger
> + * from within the driver. It is different from the PCI FLR in that it doesn't
> + * fully reset the SGUnit and doesn't modify the PCI config space and therefore
> + * it doesn't require a re-enumeration of the PCI BARs. However, the
> + * driver-initiated FLR does still cause a reset of both GT and display and a
> + * memory wipe of local and stolen memory, so recovery would require a full HW
> + * re-init and saving/restoring (or re-populating) the wiped memory. Since we
> + * perform the FLR as the very last action before releasing access to the HW
> + * during the driver release flow, we don't attempt recovery at all, because
> + * if/when a new instance of i915 is bound to the device it will do a full
> + * re-init anyway.
> + */
> +static void xe_driver_flr(struct xe_device *xe)
> +{
> +	const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	int ret;
> +
> +	if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
> +		drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
> +		return;
> +	}
> +
> +	drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
> +
> +	/*
> +	 * Make sure any pending FLR requests have cleared by waiting for the
> +	 * FLR trigger bit to go to zero. Also clear GU_DEBUG's DRIVERFLR_STATUS
> +	 * to make sure it's not still set from a prior attempt (it's a write to
> +	 * clear bit).
> +	 * Note that we should never be in a situation where a previous attempt
> +	 * is still pending (unless the HW is totally dead), but better to be
> +	 * safe in case something unexpected happens
> +	 */
> +	ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
> +	if (ret) {
> +		drm_err(&xe->drm, "Driver-FLR-prepare wait for ready failed! %d\n", ret);
> +		return;
> +	}
> +	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
> +
> +	/* Trigger the actual Driver-FLR */
> +	xe_mmio_rmw32(gt, GU_CNTL, 0, DRIVERFLR);
> +
> +	/* Wait for hardware teardown to complete */
> +	ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
> +	if (ret) {
> +		drm_err(&xe->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
> +		return;
> +	}
> +
> +	/* Wait for hardware/firmware re-init to complete */
> +	ret = xe_mmio_wait32(gt, GU_DEBUG, DRIVERFLR_STATUS, DRIVERFLR_STATUS,
> +			     flr_timeout, NULL, false);
> +	if (ret) {
> +		drm_err(&xe->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
> +		return;
> +	}
> +
> +	/* Clear sticky completion status */
> +	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
> +}
> +
> +static void xe_driver_flr_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	if (xe->needs_flr_on_fini)
> +		xe_driver_flr(xe);
> +}
> +
>  static void xe_device_sanitize(struct drm_device *drm, void *arg)
>  {
>  	struct xe_device *xe = arg;
> @@ -294,6 +368,10 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> +	if (err)
> +		return err;
> +
>  	for_each_gt(gt, xe, id) {
>  		err = xe_pcode_probe(gt);
>  		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 44d622d4cc3a17..9a0b0ccc10183a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -405,6 +405,9 @@ struct xe_device {
>  	/** @heci_gsc: graphics security controller */
>  	struct xe_heci_gsc heci_gsc;
>  
> +	/** @needs_flr_on_fini: requests function-reset on fini */
> +	bool needs_flr_on_fini;
> +
>  	/* private: */
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d380f67b336598..73c090762771b8 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -626,6 +626,8 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
>  				   gt_to_tile(gt)->id, gt->info.id);
>  
> +	gt_to_xe(gt)->needs_flr_on_fini = true;
> +
>  	return err;
>  }
>  
> 
> ---
> base-commit: 76d7314ce7ceb58ee595a0ae1ba45bc99b9e277d
> change-id: 20231024-xe-ups-driver_flr-2bd8d10c16e8
> 
> Best regards,
> -- 
> Andrzej Hajda <andrzej.hajda@intel.com>
> 
