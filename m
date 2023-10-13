Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7037ACDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 20:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2276D10E03B;
	Fri, 13 Oct 2023 20:31:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D7A10E034
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 20:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697229101; x=1728765101;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=45LkiuSGyK23ad30PcpyiB9VPtIP/aakAQQ5TUrJCPo=;
 b=k93OfE3Wb3Y6YBU1xsmrKWh3rZTPb6D2fJ/oNknGviskLK05NxW1IIGw
 ktYpsBRRufZVnLf8f7yGIVSiOwb0xf9E9XLclVkYeRokrKHSPvRdgevXZ
 7vfEj/7HNnULbseuATvxhZ5/mmSG96eJmNpg8EkIcathMdOKYTsn5V3F2
 c0FOHKrd6Qrlnzwobky87NnK8DMcn9DbmMT4EsAJlboFNEaSZEbNryJNn
 eqY0v93h0jIEGeF3jBT2SLG1+Eb0fgq+3BJYbceOqZRz3ypysEp6vIITM
 1+MgH8RYRrCc7/h5ROrTOiA8GhRzU5nNq0RNdHQXMcoB51udh1gYITkBa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="6822766"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="6822766"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 13:31:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="784292506"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="784292506"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 13:31:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 13:31:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 13:31:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 13:31:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 13:31:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrxdFaifDAWLgxay7dKypyoWkaO10E7KLZUDp6XCHksnWpnzOy1H82lhc40uEF2SG0DI5ZycEH8GY1GzAH7c7681R7ybK28hKMb+NkDyqoaKZOaq50ZKJxWx59mXgJdOMrr9lKcP8uJMakJKLpyi+FgWxKK/RP6/yxVGGFyk4i3iI+rB1IiFwO6SV40e00IsObkvTNWGI+i3av3r6s47OygFR6mi6tTIhIh/e75k80IK/jDa7R4TpzIaqyN5nImevh3hvD7lBhkLxuhWQJ09bVxmsW2XyeCMWC6fbmZ3Gc5fIKv1lRYA90EMqKWjQssiHButYMYeZVgVS9RE9JyvsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8j7Mjiz7kZATquzbl6u6UfcVutRIQRqM333drk3V8E=;
 b=WDaYEIzdLz2+yhjvXwxzQxmFcJDFtXxQN7CoPeYm45wy+vEfxUj57h0EluHn1Gr63BypMEwTZPjhCWAsEtpaxuxzsj9jIkrE17EE+ADPVSvNXTSdjBIE0Sk4dIL7PlzA6zvyKrgpVo35LLLHvheWd0YRQk2uIUBxBpGLscu+bBCMAjNHybwo1mrdQFuhPvoB1Gxeq4MhlsjdSmdzgccP2X/X7Bx4AgvDndHFCr4cdgi+Q3I1Q2vMSDy8lye6dutDAxSYiMxLXIuqLofEzShh+PoZDjt/6ZxKIXChuJ1oopKr3OD2bpJWgUj8qiRUwYFSTHrKJwjkWqUFdfLbEnsPVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4687.namprd11.prod.outlook.com (2603:10b6:806:96::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 20:31:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.040; Fri, 13 Oct 2023
 20:31:30 +0000
Date: Fri, 13 Oct 2023 16:31:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Message-ID: <ZSmpHmchuLe2YVIw@intel.com>
References: <20231011133119.1257132-1-andrzej.hajda@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231011133119.1257132-1-andrzej.hajda@intel.com>
X-ClientProxiedBy: BYAPR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::48) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4687:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d2c9702-fefd-4aff-6702-08dbcc2b61ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HbI5/rNNPckpNxByWt6sAN1zqEkPntBai18AN4fq6gNUTiaQ3j5+oPic3bGLRbU/C2Vj45zCj7t3DApGukm0WMnS07vBIqQwkkgg1mkd20WR3skBmJoxpCVNiU1JWijnhixC5z+dSJvVqbpqH+dNIe7BUlGYACRgaTRmniRyoKfPUtfwc3tekOzfnTc5izH9wSXPD6erFtdRXzRyEFFErFF7CcMs/OCjCCXASl9q0Qj3pIVNHrAv/6gxEJN804KjUlrpCwK2f/klEWYgmjCboe1HWqsrrVXVP7bhyrukJy5+WFNG4Wd9PTeECKZ+gg9TkMSdfFWwsxASEPXVUOAqR3nXSZ8POAm64F9FWO+5wiwMlPkiwlAQ6agcyNAMtB4Sq2pbdXhHFtz16FkJmhoN2C2jZqZrDy8b9bP/dUhJggjEWnMXf+2S9KMmgAhvUzmUmemaa4QHi4qw+Dfo3Lr6Q4sC6fsXH8MC9HP+W4PkKi9vC8e+Hhtravoc3OGhrcUHz8zXVmzxUDqgZSJA24/EnsYQ7i82dJRRpr4BjTmTwapOQGkytcRs4k/Qn5H8aA4h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(2906002)(5660300002)(8676002)(6862004)(8936002)(83380400001)(66556008)(316002)(6636002)(66946007)(41300700001)(66476007)(37006003)(54906003)(478600001)(4326008)(44832011)(6486002)(6666004)(6506007)(6512007)(2616005)(26005)(38100700002)(36756003)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?81olPpWYpBwpTSLTDzdp7QtfPXr8zqEIIi0HTvR4urxFICQTwKAVF6kgPNXx?=
 =?us-ascii?Q?+zKWbiy4ozDh8dIR4ZlkW65Xx825OcSV2SOsvC06eFpobb0fP07n/CJvTB5l?=
 =?us-ascii?Q?TLgXQLGNrpzAIvn7JKxQpkrWBn+mAZGuU7wQ1BQJV1u0sGnPfT/J/Y3iXn37?=
 =?us-ascii?Q?R4bGHX6pwoFQ95ccdrC8I00I9V1L5m1vVlJ0zaHp1EUc+lN42Fk2VFC6I3Fq?=
 =?us-ascii?Q?rmNN4SA35prGupERJxWS0bvLDRjS8uicF9YzejKTHE+VrzJQwXyaLkH/pKwr?=
 =?us-ascii?Q?dwJ+9Z9Z+PgaAlzm93FF3082OtouBdup1UHvzB1SxWJbq0VudgngcnlY2CDK?=
 =?us-ascii?Q?pjiEE06z6EclXxqj1O96tOVckibGKVqKpHieisqOTgqHB19mFllwhj+XpyLB?=
 =?us-ascii?Q?6LR64MfIeyTmyCFRFXMAG0lGXIy1vQ6UfDIhTA2dsWPWpfhXbmxlI+xarE2b?=
 =?us-ascii?Q?3TDEYqv7vDQ5XdLzLJF+3V5yfJ29F2M8T1cqTDmSpX3a+DiJnpEDeYhxii0Z?=
 =?us-ascii?Q?hziZa07ar/vhzKHNNta0ykXVZbMoy+C/se3/2Gl2Hsn8p7rIl08uuHUDn0OZ?=
 =?us-ascii?Q?oxkqd7DycIYAtbxkiiBTAGn68Fb67KQ8MDETdxgriClXy9xqjoWtouU7/h06?=
 =?us-ascii?Q?hrICt+nUN4vEotJ3C5zazS2s4YcrWi0xjDraIqvkaXawvKMlp4Hyl604/Vg8?=
 =?us-ascii?Q?NpGwjPk25UytPGg96NKwI1WklVsUBJV9laY63zSfkCTRzg+NUt2clWAum+6S?=
 =?us-ascii?Q?4b7piPYtXoLXZEM05ILahFnB4vxuIAjvU5RrbR8XKAxCNByqoZhaLdVaFzVr?=
 =?us-ascii?Q?MpKPFq576rqSt0RUAPfvdiFN7MuVyWDclrpdTyhQjkDqJ/MDcEoTJRpT1Kqp?=
 =?us-ascii?Q?Kzb+COfAqr+N9LlSh0xgbQEybuhigT5KVEQLCmJR9QNdAY20OM8RL7wCYcG8?=
 =?us-ascii?Q?Y80ZvAHnFICmzhGXj5geKPr8O048++xOo9VJZQf1HGcK+hYnQNurBdLXOHts?=
 =?us-ascii?Q?vSSwP5y3lq0c1PHm8DPHkXsmc6IgX1OC6JkPSECKU0op/oIkOlmCZ/lRxnce?=
 =?us-ascii?Q?ZjsEzxisXWZIX3+zzo3CDpFvx93DJycAFxnJUHADRBCrLpQA0sVlkcwMjB+s?=
 =?us-ascii?Q?OKdC0BC6xUSvhzZmdRNGQLlv82mRMlRHvPXrJ7Q3jVhTbJbTzX563LQJwdab?=
 =?us-ascii?Q?4c4Rr8fNYeh/Xngzq6ELyXkvaeuEaX0W4dLBB+ancOvFdKUTTBXNsuznIyeJ?=
 =?us-ascii?Q?PBayggZJ6Q484JJw9h+NQAuN1sxWQb9CtlL1gnuqvAKx9FT3S1nKDP8su5xU?=
 =?us-ascii?Q?WveHTeuoEkQSeaOc+E2c1ep28fQmnZv1E8R4qpUEWHnxiR324IK/aH1rxYCd?=
 =?us-ascii?Q?bu4kGMBcAYHpiollXTwpbV5dsELbOUUsd73onLiHySFi3pC7inD7n21YGaGQ?=
 =?us-ascii?Q?bxPQuCy8mg5Q20P5bxFEHRvK9ZpDCa5KLB8Dlpy2zk8IbJJf8nlfwcFXH7fQ?=
 =?us-ascii?Q?cpCD9GKBZqMCHdsoZOhKggGJgRqbZTi6yzkhtVu9R/ubKCLN+rCgFonjrbzb?=
 =?us-ascii?Q?oc6vxHsb2TeygTeEEKItwklijBwtKUL8JZk9HScJLw4bdt7G/OuDak3hIx1d?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d2c9702-fefd-4aff-6702-08dbcc2b61ea
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 20:31:30.3272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fE95gbWvGidNeWD3TTjBSZZlVm8cFw/P7EwVuAWMSKAIDN8JSGbDNuEG/7/HdRxNA0VtiFTLsFdmdllrlkc4TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4687
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: implement driver initiated
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

On Wed, Oct 11, 2023 at 03:31:18PM +0200, Andrzej Hajda wrote:
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
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
> Hi all,
> 
> This is initial attempt to implement Driver-FLR in xe. Implementation
> is copied from i915. I've skipped comments, but I can re-add them if
> requested.
> In i915 Driver-FLR is performed on driver unload if GSC was used.
> In xe GSC is not yet supported, but I have added trigger to perform FLR
> in case GT fails to reset, I guess this could be proper use-case and
> of course this is prerequisite to GSC support.
> 
> Regards
> Andrzej
> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h    |  7 +++
>  drivers/gpu/drm/xe/xe_device_types.h |  2 +
>  drivers/gpu/drm/xe/xe_gt.c           |  2 +
>  drivers/gpu/drm/xe/xe_mmio.c         | 82 ++++++++++++++++++++++++++++

The placement is still strange. Why mmio component should be responsible
or need this?

It is actually the other way around, this is an user of the xe_mmio to
trigger the FLR.

It should probably be in xe_device?

And then installed to drmm action reset or fini like recommended by Ofir.

>  4 files changed, 93 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index dbb0ea1a585eda..ac5fa25877766e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -53,8 +53,15 @@
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
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 0efa7a1d2188e9..886d1c769c27fd 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -285,6 +285,8 @@ struct xe_device {
>  		size_t size;
>  		/** @regs: pointer to MMIO space for device */
>  		void *regs;
> +		/** @needs_flr_on_fini: requests function-reset on fini */
> +		bool needs_flr_on_fini;
>  	} mmio;
>  
>  	/** @mem: memory info for device */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index c63e2e4750b1ea..37e9576b92b5da 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -616,6 +616,8 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
>  				   gt_to_tile(gt)->id, gt->info.id);
>  
> +	gt_to_xe(gt)->mmio.needs_flr_on_fini = true;
> +
>  	return err;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index e4cf9bfec422e6..27a0ebe2324daa 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/minmax.h>
> +#include <linux/units.h>
>  
>  #include "xe_mmio.h"
>  
> @@ -372,6 +373,83 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
>  	}
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
> +static void driver_flr(struct xe_device *xe)
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
> +static void driver_flr_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	if (xe->mmio.needs_flr_on_fini)
> +		driver_flr(xe);
> +}
> +
> +static int driver_flr_init(struct xe_device *xe)
> +{
> +	return drmm_add_action_or_reset(&xe->drm, driver_flr_fini, xe);
> +}
> +
>  static void mmio_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_device *xe = arg;
> @@ -405,6 +483,10 @@ int xe_mmio_init(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = driver_flr_init(xe);
> +	if (err)
> +		return err;
> +
>  	/* Setup first tile; other tiles (if present) will be setup later. */
>  	root_tile->mmio.size = xe->mmio.size;
>  	root_tile->mmio.regs = xe->mmio.regs;
> -- 
> 2.34.1
> 
