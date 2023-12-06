Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5466EC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 22:14:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B99E10E788;
	Wed,  6 Dec 2023 22:14:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DD210E788
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 22:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701900897; x=1733436897;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3RQQ63Hkri3k4mjMI/iwDmTJ7eTJyh+T+V72KjIBQxg=;
 b=I2Z9F1cx0AwSrbh2p2eJWJV6ZCJPxHTENwDKEkA8w0G6vEig6xg2veK0
 mwPHFoEZnEnoLlMBuyH6hRrmpu/wFY4BOGMkrT25MxDB2NFmTGnBIJL2k
 +nXiTOmhmtxZ1xVSxjn8L+FadhrsHskzZXt7lEXdEDqIrJU4tCsTYBv18
 +hftD7hLyM/ZNU8QpeNrT4SbmmMzCcGpPSCY4FmhFqCj2L1DUtgrm14o7
 ZBAJbipDjGoXLlJftCyzeOT62BbKDK017vpVOkcOjtwBdXeSjqsdzgVjq
 8VAA775NttD3FRuU5y0CJNoXYYq1WLK4SR390+bxZOM8KX1A2QD2XduKB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7489616"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="7489616"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 14:14:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="747748108"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="747748108"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 14:14:55 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 14:14:55 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 14:14:54 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 14:14:54 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 14:14:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdU1yxKlWUzEJpp71nhMeDzkdRPokR3qwzECTvchH0G2n8yROtcpiLmd0JL6dlUbQThzN0dSBUJ4V7ASo5uTzTKeaAvEvL2yBQ3h4aY59GRyBsqgWcV0oyxS1TnoYQOWyj4UuDeXKrSimmn3WlEZFxucOjK02THmxiO7RnjYnS2//PkuoVNsPtjdCm1vbz3mGau3L+5OhUb3KKckk+UAsCEk8xp2zydDticdpQbABz5DBAmEdbisZoxfhDXvlolW7TMKVeRiDI/66PPqct/QzuOrUwffH1Hv3h2nGwU1eDwgNaFeSSvShgZPRXP96uLii4DCyFJwTtljv/a8UEeOEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maB0aMLhhmpX3jPmdo6nm1ZI3bi0nNvzJSmZsNOresA=;
 b=OiSxnVxhmDL6mEF/dsZ1mUXky50nufNqbnH4FXGcxC4K0CICT1UWRTh2TGMcpr2q8nrKH/yfjtV9/rPD6gVAO/V/tTkl3DP5jTrEHSGxI3u0bRcvEZ3aStSTlT9kSYR9Oi+8uIzxe7VNEX9qTVsKpsjKyWej3TXIfg3xY9ADt03+gE/dtoEjoswbnw9scu/FYwkcJ8S8Rx4qJ6x4xXczrPczMu2XgiHTNk+ODcBys9k/GHfPqiDP2009Q/7uhAUGy3dkc5cNkjVWeR1I50fBW5tfAfRl1V9fNsK3kRndphXR3a7siP9RxuuJgYr8IkSFDzPtGzcChXrMAxLyLTGRBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7707.namprd11.prod.outlook.com (2603:10b6:806:322::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 22:14:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 22:14:53 +0000
Date: Wed, 6 Dec 2023 14:14:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <20231206221450.GP1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
 <20231206043126.984049-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231206043126.984049-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: d9f64abe-c010-4a94-79e5-08dbf6a8c54e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EHnK/juBzBMUxY19wZT/8bb00sUf6W2x/GVMOZz+ecz8XKe4gR84prcmvVB39dxi/4ZsLSos1Qc5r29S2CA8tzjyRrS3letYgpvtrn7Lcrxil/QVsGvwXGTLS/bVUfUUAIhRmHIVk8GPd9U2uSxnCm4Bd0By/08+u/BB0zhrjXeGJPdTQmNGqE16EdGvQWIKq+4r3pSSqfvN1JQavhgf/HHAovVwmhjHs1KucqHG9B2rQn+AZEdQGE2g17281Ja0zzxvrojtQQjsJU2qzhrRUFux/gdPjG6SKkpiA3CRuegOcIhIRcc4YrE27SZF5kHwwbeTLIMNuJhnrmt6Y6V/aMzogb0v+ZW0rF1t+2EpXUmw/YjfLDx3MsKEjMw0KZNAJhYtl9TAdbKktFQXWkkPcDovr3lyEPSE8FC6M7rpE1powKPe5C93lccuGOBTkEWezu34J6xX+F83rTV0NMTrtGXeCYI8YHpDVdpUQmSyn5fOsuZCt5N91gZHqKb3wNSKp5ppgw2TjsOUPHFJON3fWm0lqRoJ+tKUuuXpaQiDQr8EXF/muYEhKbU6sT9U5ywJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(396003)(136003)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(6512007)(6506007)(6486002)(478600001)(66556008)(66946007)(6636002)(66476007)(316002)(26005)(66574015)(1076003)(83380400001)(4326008)(6862004)(8676002)(8936002)(82960400001)(5660300002)(2906002)(33656002)(41300700001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?x1Ce0dUy1eoPXDk/nEj4WWphXb2d1Z28IzXriVFubJCcZvpESxXHeEDY+o?=
 =?iso-8859-1?Q?dTTkabiO1gZuJ7VN0OtsI+dgmK1chvlbEsT0cz+IYADeHXwUurdz7my8Lp?=
 =?iso-8859-1?Q?lvhSgVj6FQQ2qrfFIHFjSg/lCL6mx5OPmiAaJEtp4YeWwEWmpoYGXL2vwh?=
 =?iso-8859-1?Q?2CRXPWC6JGJyCWePZNAEFXv5ICh9oMzkH5Mvp0XELSig1k6IiUfZRHJjOr?=
 =?iso-8859-1?Q?1/ym5Vj682WPiVfU9HgJXkGTW4N+z6zGjVJXZCgNGfduLR6kqkRMo6lhbt?=
 =?iso-8859-1?Q?VzjsNRRYZWMS936B8/6plPHlWd43Xus3DFJSeg4bIC8g7fG6uaQma/eX/8?=
 =?iso-8859-1?Q?jD8UuIjZ6ziKYLHTJaDr+E9hXz6SGRhF9CLJ2DefP5Z8pyJmfyP+CmSVHM?=
 =?iso-8859-1?Q?LVaUSZfqJgJXqPkOZcMX8uBH/YXsd3PALVanFgW4c1LocVyOHLG38EPJHG?=
 =?iso-8859-1?Q?XNK0UmzwKnz7H16qrE1JHzeGMCz4nGsXKVJbsau1BGaNkbO6UYnMKBuPHF?=
 =?iso-8859-1?Q?IvaRI5d+1cEdlECOtyKKvo4Z3ykS84s0W1q9DBeDCKMOIcnwh5HwVfyzEs?=
 =?iso-8859-1?Q?XZkJ0eY1eV5uUyHKI6aP8LPigTawVAkRqR0SbQ0O7+5Ru/vIaaFWWWW61Q?=
 =?iso-8859-1?Q?Fass6EudXD7wSetxTk7zg3IKWafek0WwRIR+hAn3HBoWR6B+QqUFPfEkbn?=
 =?iso-8859-1?Q?xBuXFsWLVodr2CaMbK8c4rVNTBUg+q0CAB+pMYJ8uN3nsBlEmtps/rkMVE?=
 =?iso-8859-1?Q?eB19R2XQc6g28XHGUArkcSWhRxmoT1YVDAkqFQ2r+o+QYheUgp9WTVb+zs?=
 =?iso-8859-1?Q?UcoUkKM+Cb77ORMas7V6BC0ktELR+lWcagb8qJuyrqxR2r9N+8gAD6+Qzy?=
 =?iso-8859-1?Q?G2oMICY4xpMsLsigv2uR03h5k0IFDS/+irujaeeOE/JdOAtIHL+0tEmUXF?=
 =?iso-8859-1?Q?hGHy42fD9LpwZNKhAW/2xEsMuAoMeHMPtVpginaaA9oxIi/9U8l9MoesHb?=
 =?iso-8859-1?Q?BLm9zlBGOCboNw7bLKW3xo0vrPmsyDdVxaK2hSBaWztiFdfOfgxwEGBbZQ?=
 =?iso-8859-1?Q?HmN9Bgh3Wz8QFii0p3nZeZysHgg1CJz8xKbd1Jq1SLY+kyECjBw9ogt4vS?=
 =?iso-8859-1?Q?JKrGXKsKGBgooFF+yo50Mj9w/lxD8hYoIXGDbZydrlt0KNkftdsexT3QzH?=
 =?iso-8859-1?Q?gQf4pIfJH2hlHqQ8q/ADxykjgHRLpUCCgKle9tnfHhR9qHuyEGavPFQ3Ho?=
 =?iso-8859-1?Q?Q0DHi4bqeqhmil4BeRWBr5hKL+IY5cCFDI8RAKk24uzHKhOwx3i1QVPCfZ?=
 =?iso-8859-1?Q?LnlW8pBnTYh2HbcBxJrQ51z5DmMDt9uXqodWhmmx2Q7o6+x54NRmshzaHb?=
 =?iso-8859-1?Q?rvwWLk2Db4EFvSbxIDCV2qhxrgOTqh7U4bk+XNvwJfokYqJofH1XriA3U3?=
 =?iso-8859-1?Q?IMCxwAlclT27JklsdBPO1WC0xJ9pt8oP3ksHuTCaVQa4tlVn/K9q61QXco?=
 =?iso-8859-1?Q?SP/R1vrtv5IrIl8YVnDVRmZzEmvbLa+6PTPw1eAm9uCLSnY+CZdA9Qcc2Z?=
 =?iso-8859-1?Q?WycXBtvDYQjCnoUfy5jlvmJwPQRauYiaCRahxVfosDRGkuSYTffz2F8jzf?=
 =?iso-8859-1?Q?xHjTR/55hVqEjWzTs8CYns5riWD5CcvC/DoiU8X5+2uDby7Q8IHRsC/g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f64abe-c010-4a94-79e5-08dbf6a8c54e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 22:14:52.9644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1uzJpFmONryQehQGyKnkoU0OxwJFQBdoRGkmHrXlSBqa5mtDO1h3f4O6r1tNy7ABno2EZnc5UMJkSep99/k+dGGAPtZf7Vzb/3MTDyM41Fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7707
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 1/9] drm/xe/xe2: Determine bios enablement
 for flat ccs on igfx
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

On Wed, Dec 06, 2023 at 10:01:18AM +0530, Himal Prasad Ghimiray wrote:
> If bios disables flat ccs on igfx make has_flat_ccs as 0 and notify
> via drm_info.
> 
> Bspec:59255

This bspec reference is just the register detail page for
FLAT_CCS_BASE_ADDR.  Is there a better overview page you can provide as
reference instead or as well?  I can't find anything that indicates the
'enable' bit is only relevant to integrated graphics platforms.  In fact
other overview pages like 58797 or 67090 seem to imply that it would
apply to all Xe2 platforms.

Also, how does this enable bit relate to the one in register 0x4910?
Are they always set the same way (enabled or disabled) by the BIOS?


> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
>  drivers/gpu/drm/xe/xe_device.c       | 29 ++++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index d318ec0efd7d..5979ec82ea31 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -145,6 +145,9 @@
>  #define XEHP_SLICE_COMMON_ECO_CHICKEN1		XE_REG_MCR(0x731c, XE_REG_OPTION_MASKED)
>  #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
>  
> +#define XE2_FLAT_CCS_BASE_RANGE_LOWER		XE_REG_MCR(0x8800)

This register definition seems to be mis-sorted; it shouldn't be before
0x83a4.

> +#define   XE2_FLAT_CCS_ENABLE			REG_BIT(0)
> +
>  #define VF_PREEMPTION				XE_REG(0x83a4, XE_REG_OPTION_MASKED)
>  #define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8423c817111b..400fa1ac6168 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -16,6 +16,7 @@
>  #include <drm/xe_drm.h>
>  
>  #include "regs/xe_regs.h"
> +#include "regs/xe_gt_regs.h"
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
> @@ -392,6 +394,29 @@ int xe_device_probe_early(struct xe_device *xe)
>  	return 0;
>  }
>  
> +static int xe_device_set_has_flat_ccs(struct  xe_device *xe)
> +{
> +	u32 reg;
> +	int err;
> +
> +	if (IS_DGFX(xe) || GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
> +		return 0;

As noted above, I don't see anything that says this needs to be igpu
specific; it seems this should be the general programming for all future
platforms, igpu or dgpu.  If nothing else, we should probably drop this
condition now and only add it back in in the future when we actually add
support for an Xe2 dgpu and know it's the right thing to do.

> +
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);

This forcewake never gets released.

> +	if (err)
> +		return err;
> +
> +	reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
> +	xe->info.has_flat_ccs = (reg & XE2_FLAT_CCS_ENABLE);
> +
> +	if (!xe->info.has_flat_ccs)
> +		drm_info(&xe->drm,
> +			 "Flat CCS has been disabled in bios, May lead to performance impact");

I don't think this needs to be a drm_info; a drm_dbg would probably be
fine.  Otherwise end users may be alarmed when they see this showing up
in the dmesg and don't know what it means or even what kind of
"performance" we're talking about.


Matt

> +	return 0;
> +}
> +
>  int xe_device_probe(struct xe_device *xe)
>  {
>  	struct xe_tile *tile;
> @@ -447,6 +472,10 @@ int xe_device_probe(struct xe_device *xe)
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
