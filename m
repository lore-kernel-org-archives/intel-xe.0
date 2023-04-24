Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64780C7618E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 23:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CD610E1FC;
	Mon, 24 Apr 2023 23:51:58 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED2610E1FC
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 23:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682380315; x=1713916315;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2BymWc2QLbFpQ/e6CWYujmpeXJfweUjl0OcOJOjX4Lo=;
 b=hGBh9vAtPHHbNcq3FvkxRAxhYHL5FS3eQy4VD35fx4VppfB/oS0ULr6p
 LK7FQ6M7wEKGVbtJ0/x1xzDBtx4FQ0IDCjJ2h8Md3sTTiLetHWu/Xn5CW
 0NyCpbBwNqQPAQZ2tbbWPSfVEo1f6IhzTMgD/ie9PWXf49yf8WpOs3ECh
 EoRydPsHvRxLELdJVLU+NTle9ZTEoCSNlIXlNwa67NiDANxia9DZ9Rd+V
 903Q1JRReDDl+Kt3Hp9aHhBJ4uX2ylo/sCRPhDD89ZokKUiDRs8iBHzHU
 1Wz+ZNs1J7JPHy07f05cTLOae8mDaGi7Pml6jxUMXHvX78sPVUD/2Wrsn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="411889396"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="411889396"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 16:51:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="757896631"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="757896631"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 24 Apr 2023 16:51:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 16:51:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 16:51:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 16:51:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 16:51:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LD6wAedvCDvvxfFN/gg7IzMbmJDwJrYrDFfL6YxHkQTUeVF/WQJCciuooXsUH9AHLUAaWEwtxD9vL7ie/2AeslE7PJvUuRYU4AalKe7RbznrhxitgTbEgf4IOR3zkMmn/GI6uMYpTzGKpOb8zkclDlEhv3SgHcgxx2gbTLuVCzAqQqMPI4CHcJl0UBSlXXea5Gjupz5d8wEeXhuT3GOmLzVUs4HvGaSydBHggm6Dk/Q4Pe6qsJDRfGeiNHB85hlNNt2N9X3RTOYgXyTUIIJuIEBIQX5uImRf1AZRwaZ0o/XLrQ7zwQXNdllGUjOwihtCP9PgfMkrwoB2qAcPiC4wKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDuYnSQBj0hjN0AVVHoEQvBmHCRBMXfhLJVjA/uhv3M=;
 b=dIm5hPWhs1ueREd1CXcETTv3MODoFVq1HBZHA8OMtr6O6/6MQLXWsfio4BP+s8uvIOJlkbk9omEOmlD0zbKpmt8ACDYS+CDbNXOemOIqSzZp1Nx2AEaSz9kbilnQw/8gBubNEh6ovA8/kabqmY8QkXUXvSHC3IzIPkVai3s9rVHIi4lWghGtVtMddph6YDLVFVw/ywBOpuNbBbxFGkolwKJYrcDkmeipZyC3l7lm3nWJhYB3wSlEXYAJxEUcxaJ/xWlDhs+Ini57a/RTdUwBdo8xpR09Eh36F7R+JZthtySK8iybCbIHfPfHG3MiU47T6HHuw5DxKGVfsK1ofidh+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BY1PR11MB8080.namprd11.prod.outlook.com (2603:10b6:a03:528::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Mon, 24 Apr
 2023 23:51:51 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 23:51:51 +0000
Date: Mon, 24 Apr 2023 16:51:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <20230424235148.GJ10045@mdroper-desk1.amr.corp.intel.com>
References: <20230406092631.2820028-1-himal.prasad.ghimiray@intel.com>
 <20230406092631.2820028-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230406092631.2820028-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR01CA0017.prod.exchangelabs.com (2603:10b6:a02:80::30)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BY1PR11MB8080:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc92855-6dab-4adb-a2e4-08db451ee007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iiZSy0cSZVkMI0cE5Te7KmgRMH1JxxjU2pf1Uars5SSRdtlM0b0ZBUeEbyFMsZLGiO+QCjYXFZs8zHfgXEFus7pOKyGh2C7+n8VCo5L5vS/Q9RUAXsYjFbm5NS6YmNEUGipADL0Q9UA/x1SzMMbfDCo9nWFGdr4nnW1tLBS9b8dKM4zg3UFmoeecTOcsFqcDtVZPMVxTtOKZ6RpNl1iU8q+8KiByxCyUuymgdXv5I/DrPj0D0UvITFn9VqnXmSFoREWsCzgD3+aJfg5RdS5J6eBK1XWFUFvCKxYg3DqsndwgUHb5C3WPLWhaFj2dfaZaIWKr6IBUPyzOF2hh9fVdoahadjuCa+u9ulObhA7dW6UK1WK8BabOspiEIKDA8env5i2w7sH2LMWj6FUeUI3A5EYyfI9C3WZHqodaTIqXuY8tFCwLu2BvH3lawdxCaxGA/zTIqF5guD3G2mqyQdStq9EudQ2EMflcCLZwRdsMdsrmQgOL0u2L4qlGjvBy9U28op3N9JYJI64d+nEbM9IcTgjFvOVQdKfDoABYj5EOGYMSKyo8vKGKV38skpcQ+qn/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(33656002)(478600001)(6636002)(6486002)(38100700002)(6666004)(66476007)(6862004)(8936002)(41300700001)(8676002)(82960400001)(316002)(4326008)(83380400001)(66556008)(66946007)(186003)(6506007)(6512007)(1076003)(26005)(86362001)(107886003)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fEsLaAewCQV3EzKjcanovUbQexo4L9ifE9MY0XHaJD00LyaI/G+1Ctf855EA?=
 =?us-ascii?Q?/KPwvP7uA1Mj08lU1gKEro0j8oKmIamLsomspUgkfzLJNhD1hFr8MhIKxTf7?=
 =?us-ascii?Q?P61SkYarmYfc6X6a7Ca5WUaOG7UzvOH6NrfM/vos597+5gmPeFSOTETdni05?=
 =?us-ascii?Q?fMhp6q72tn4LHkcDN335qh903rgX8iJfXjgYCuahFBBxE7oJkef1GpFv+rXS?=
 =?us-ascii?Q?gEmzFAYMIMryKYWTby8NfasdOCNYAy0SUgHl9yf7LmmPowM5g3vSGFamGkAx?=
 =?us-ascii?Q?Q2UwZIORwEe5FFDCaR3Eru3JyXS2bWqyHAMEKz+kaHPFh7+jB2c/4OtMcdvv?=
 =?us-ascii?Q?v+gR20qYQSe1rvpaSKCul+gsYlR6dZxWC2yYgQ28IpATv0wo5/VYg3ZflD9S?=
 =?us-ascii?Q?+dGn/dNQ34uHaPucM7xxrPIhEWW9SfYsVamYC1WorCKiKRbezGALuAMAGahs?=
 =?us-ascii?Q?lv0UoWdtjAWVLyfUUBecpTKkNbSkWOI8B66+EeKoGhoSkAouDdB2/0OwaB5v?=
 =?us-ascii?Q?Jp36F+prUV/v01GAFV+ymm8OjVrNRE6P1Uczjk3u+Qzqr2WeVbExXB/Y/xt9?=
 =?us-ascii?Q?RAhEtO84XMbdM6JKDr1Fuktw4qkMPc+bBXaeTGSJbrBy7M06snSI1pb53X0T?=
 =?us-ascii?Q?3jt6bSIi/YtXxbjzpXBXvQz+BqflhB7lTyh4WQgwD6o2fLqs+1qmee0khuIN?=
 =?us-ascii?Q?ZLoyGuy2Jb2XVIk9p6PUtrG3zP/FraQzl1xout3SKDYSU4GVZtvOczmoi70P?=
 =?us-ascii?Q?pDklU8H6FsZ+o/HuNNVswc4bbjwaWF8jCP6zrVsqH1e7XVn9kHQPZGwPVFn4?=
 =?us-ascii?Q?NiFbFez49gdvzRTjMSxbDXx754ZQIsTwMo3q2b8Dk7rc3xNZxxfyqx+8k2S1?=
 =?us-ascii?Q?VzSsN1MhjHu/ue0pMcfywLOtwir7yUs4zYbIEUhtE5d3H3xtyfjaGlwZSq7I?=
 =?us-ascii?Q?RVyIOOXodHptLiXARMyIuUvkoEDQj1xLeHVmkbmCdO7pPFWa94WT3GawDnqv?=
 =?us-ascii?Q?oZH48vyspjwOMkjd1cBe6Oy1jy6gO0pGMDs8ezl3jxvJl2PCTwyGSUvI35gu?=
 =?us-ascii?Q?2vGWbGhw4tC/ihKoWns1bgLaDhmJtk/MqUWEAej89DhD9h3fMneqmRXBgTJw?=
 =?us-ascii?Q?Q1AKQZWK2jiMfxTpNzrskoXgegtDuoUbnwVHOf/AO9M+Rbmwevna3jXKw5zO?=
 =?us-ascii?Q?tKpXyKgrF+WCi+QmWFiL9PId2J9PLoRAaW5cU0yQ/yJ6/gVyyjp52BQh9vxa?=
 =?us-ascii?Q?0d/boTYB1GZSQt09gfFpDmN67Gs+JMiN0JeOWn3JT8PnDWTbobvwDgLBjFdt?=
 =?us-ascii?Q?5tn2dS6JnR69Wx0LrcW4hChdPXS0b2uFiZxYnRYvCJLi+63ND8HkxbXb3O9m?=
 =?us-ascii?Q?2/67I5TvqOp4aaF7uCgs1qH4C5A/Z98Aykr4x3bwJsc0WC4AKMpuUfMw8BRN?=
 =?us-ascii?Q?l0SU3HcG2VZgnvCTflo2d6LXL5aFK48Y/FWwauBmUIl5ecqwae9PPrMit9Bq?=
 =?us-ascii?Q?s5kdDU1Zu7aspFt/u3ocg4BFSI70yxpLFe3Y2nnEe2r8qJbelS6sEoSFIZc7?=
 =?us-ascii?Q?OoDgKkxp4XXxo+rZK72mHZrknykIZLzsyiUfkZ6MwQSC3ildgMmYrhUiNvVe?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc92855-6dab-4adb-a2e4-08db451ee007
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 23:51:51.5618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYY8HdG5Bc1jIPgCXBWUIt5mcIS+eW9MvMdiCIUVbGMXXUsoFLpBikbvwyJJgXMBnHYiSCcDQJRh42iEVWfzdExiKYC8oZW/8BFuKABfUic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8080
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Handle GRF/IC ECC error irq
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
Cc: intel-xe@lists.freedesktop.org,
 Fernando Pacheco <fernando.pacheco@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 02:56:28PM +0530, Himal Prasad Ghimiray wrote:
> The error detection and correction capability
> for GRF and instruction cache (IC) will utilize
> the new interrupt and error handling infrastructure
> for dgfx products. The GFX device can generate
> a number of classes of error under the new
> infrastructure: correctable, non-fatal, and
> fatal errors.

Nitpick:  Your commit message wrapping is too aggressive.  Generally
commit message bodies are wrapped somewhere from 72-75 characters per
line.

> 
> The non-fatal and fatal error classes distinguish
> between levels of severity for uncorrectable errors.
> All ECC uncorrectable errors will be reported as
> fatal to produce the desired system response. Fatal
> errors are expected to route as PCIe error messages
> which should result in OS issuing a GFX device FLR.
> But the option exists to route fatal errors as
> interrupts.
> 
> Driver will only handle logging of errors. Anything
> more will be handled at system level.
> 
> For errors that will route as interrupts, three
> bits in the Master Interrupt Register will be used
> to convey the class of error.
> 
> For each class of error:
> 1. Determine source of error (IP block) by reading
>    the Device Error Source Register (RW1C) that
>    corresponds to the class of error being serviced.
> 2. If the generating IP block is GT, read and log the
>    GT Error Register (RW1C) that corresponds to the
>    class of error being serviced. Non-GT errors will
>    be logged in aggregate for now.
> 
> Bspec: 50875
> 
> Signed-off-by: Fernando Pacheco <fernando.pacheco@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Original-author: Fernando Pacheco

Is this true?  This may be inspired by preliminary i915 work Fernando
did 4-5 years ago, but I don't think anything in this patch is actually
his code at this point (especially since the Xe driver didn't exist back
then, and even the i915 driver looked completely different at the time).
We shouldn't really forge s-o-b lines when it isn't actually true.

> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h |  29 ++++++++
>  drivers/gpu/drm/xe/xe_irq.c       | 108 ++++++++++++++++++++++++++++++
>  2 files changed, 137 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index c1c829c23df1..dff74b093d4e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -92,6 +92,10 @@
>  #define   GEN11_GU_MISC_IRQ			(1 << 29)
>  #define   GEN11_DISPLAY_IRQ			(1 << 16)
>  #define   GEN11_GT_DW_IRQ(x)			(1 << (x))
> +#define   XE_FATAL_ERROR_IRQ                 REG_BIT(28)
> +#define   XE_NON_FATAL_ERROR_IRQ             REG_BIT(27)
> +#define   XE_CORRECTABLE_ERROR_IRQ           REG_BIT(26)

You only use the parameterized marcro below; the three here never get
used.

> +#define   XE_ERROR_IRQ(x)                    REG_BIT(26 + (x))
>  
>  #define DG1_MSTR_TILE_INTR			_MMIO(0x190008)
>  #define   DG1_MSTR_IRQ				REG_BIT(31)
> @@ -111,4 +115,29 @@
>  #define GEN12_DSMBASE				_MMIO(0x1080C0)
>  #define   GEN12_BDSM_MASK			REG_GENMASK64(63, 20)
>  
> +enum hardware_error {
> +	HARDWARE_ERROR_CORRECTABLE = 0,
> +	HARDWARE_ERROR_NONFATAL = 1,
> +	HARDWARE_ERROR_FATAL = 2,
> +	HARDWARE_ERROR_MAX,
> +};
> +
> +#define _DEV_ERR_STAT_FATAL             0x100174
> +#define _DEV_ERR_STAT_NONFATAL          0x100178
> +#define _DEV_ERR_STAT_CORRECTABLE       0x10017c
> +#define DEV_ERR_STAT_REG(x)             _MMIO(_PICK_EVEN((x), \
> +						_DEV_ERR_STAT_CORRECTABLE, \
> +						_DEV_ERR_STAT_NONFATAL))
> +#define  DEV_ERR_STAT_GT_ERROR          REG_BIT(0)
> +
> +#define _ERR_STAT_GT_COR                0x100160
> +#define _ERR_STAT_GT_NONFATAL           0x100164
> +#define _ERR_STAT_GT_FATAL              0x100168
> +#define ERR_STAT_GT_REG(x)              _MMIO(_PICK_EVEN((x), \
> +						_ERR_STAT_GT_COR, \
> +						_ERR_STAT_GT_NONFATAL))
> +
> +#define  EU_GRF_ERROR                   REG_BIT(15)
> +#define  EU_IC_ERROR                    REG_BIT(14)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 529b42d9c9af..6b922332bff1 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -344,6 +344,113 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>  		dg1_intr_enable(xe, true);
>  }
>  
> +static const char *
> +hardware_error_type_to_str(const enum hardware_error hw_err)
> +{
> +	switch (hw_err) {
> +	case HARDWARE_ERROR_CORRECTABLE:
> +		return "CORRECTABLE";
> +	case HARDWARE_ERROR_NONFATAL:
> +		return "NONFATAL";
> +	case HARDWARE_ERROR_FATAL:
> +		return "FATAL";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +static void
> +xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
> +{
> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
> +	u32 other_errors = ~(EU_GRF_ERROR | EU_IC_ERROR);
> +	u32 errstat;
> +
> +	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
> +
> +	errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
> +
> +	if (unlikely(!errstat)) {
> +		DRM_ERROR("ERR_STAT_GT_REG_%s blank!\n", hw_err_str);

We should be using the per-device error macros (e.g., drm_err) rather
than the legacy macros.  In fact maybe we should be using the
_ratelimited variants so that if something does go wrong (and keeps
going wrong), we're not spamming so much output into the log from an
interrupt handler that we crash the system.

> +		return;
> +	}
> +
> +	/*
> +	 * TODO: The GT Non Fatal Error Status Register
> +	 * only has reserved bitfields defined.
> +	 * Remove once there is something to service.
> +	 */
> +	if (hw_err == HARDWARE_ERROR_NONFATAL) {
> +		DRM_ERROR("detected Non-Fatal error\n");
> +		xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat);
> +		return;
> +	}
> +
> +	/*
> +	 * TODO: The remaining GT errors don't have a
> +	 * need for targeted logging at the moment. We
> +	 * still want to log detection of these errors, but
> +	 * let's aggregate them until someone has a need for them.
> +	 */
> +	if (errstat & other_errors)

So is the goal here to just silently ignore GRF and IC errors (unless
they're non-fatal, which is impossible), but print a message about
everything else?  That seems to be what the code is doing right now.

> +		DRM_ERROR("detected hardware error(s) in ERR_STAT_GT_REG_%s: 0x%08x\n",
> +			  hw_err_str, errstat & other_errors);

For correctable errors should we even be printing an error?  I thought
correctable errors were basically something the hardware could clean up
by itself and there's no impact to the user.  It seems like if we raise
DRM errors on correctable errors we're spamming the user about something
they aren't supposed to need to worry about?

> +
> +	xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat);
> +}
> +
> +static void
> +xe_hw_error_source_handler(struct xe_gt *gt, const enum hardware_error hw_err)
> +{
> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
> +	unsigned long flags;
> +	u32 errsrc;
> +
> +	spin_lock_irqsave(&gt_to_xe(gt)->irq.lock, flags);
> +	errsrc = xe_mmio_read32(gt, DEV_ERR_STAT_REG(hw_err).reg);
> +	if (unlikely(!errsrc)) {
> +		DRM_ERROR("DEV_ERR_STAT_REG_%s blank!\n", hw_err_str);

Is this actually an error?  You've wrapped this function in a spinlock,
so if there are two concurrent entries to this function, the one that
winds up waiting is likely to see a register value of zero once the
first one clears the interrupts and releases the lock...


Matt

> +		goto out_unlock;
> +	}
> +
> +	if (errsrc & DEV_ERR_STAT_GT_ERROR)
> +		xe_gt_hw_error_handler(gt, hw_err);
> +
> +	if (errsrc & ~DEV_ERR_STAT_GT_ERROR)
> +		DRM_ERROR("non-GT hardware error(s) in DEV_ERR_STAT_REG_%s: 0x%08x\n",
> +			  hw_err_str, errsrc & ~DEV_ERR_STAT_GT_ERROR);
> +
> +	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err).reg, errsrc);
> +
> +out_unlock:
> +	spin_unlock_irqrestore(&gt_to_xe(gt)->irq.lock, flags);
> +}
> +
> +/*
> + * XE Platforms adds three Error bits to the Master Interrupt
> + * Register to support dgfx card error handling.
> + * These three bits are used to convey the class of error:
> + * FATAL, NONFATAL, or CORRECTABLE.
> + *
> + * To process an interrupt:
> + *      1. Determine source of error (IP block) by reading
> + *	 the Device Error Source Register (RW1C) that
> + *	 corresponds to the class of error being serviced.
> + *      2. For GT as the generating IP block, read and log
> + *	 the GT Error Register (RW1C) that corresponds to
> + *	 the class of error being serviced.
> + */
> +static void
> +xe_hw_error_irq_handler(struct xe_gt *gt, const u32 master_ctl)
> +{
> +	enum hardware_error hw_err;
> +
> +	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
> +		if (master_ctl & XE_ERROR_IRQ(hw_err))
> +			xe_hw_error_source_handler(gt, hw_err);
> +	}
> +}
> +
>  static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  {
>  	struct xe_device *xe = arg;
> @@ -382,6 +489,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  		if (!xe_gt_is_media_type(gt))
>  			xe_mmio_write32(gt, GEN11_GFX_MSTR_IRQ.reg, master_ctl);
>  		gen11_gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
> +		xe_hw_error_irq_handler(gt, master_ctl);
>  	}
>  
>  	xe_display_irq_handler(xe, master_ctl);
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
