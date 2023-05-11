Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD4EC77B7C
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 22:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB63010E5FB;
	Thu, 11 May 2023 22:02:10 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E175410E5FB
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 22:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683842528; x=1715378528;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GdVb2eugMTkLpMatoklRRDFzGhIBasgzrXMo+ADXE0A=;
 b=Yassp8GP+pSd9hcauu9iLl+BXNWp2Fbpu209/Kf9Fc2mrjGYQM87F/GT
 4I7zUDfKS7zhyLhRtyC/RgPO6hxhfUgjKkWEaGtGxy9tcO/f1Vjy+vjQn
 ubuuYSbBzK0tAmDlFYkPb7yMmSoXZWMl3Lc9Rv6o6LQQ/VwCca/fr2vvV
 cBS/oP2EImZ4ke8PpMNlF0mQLVr878bMGbMd5iqLmBQhOyR04pptBBLH1
 vZLxZr1tVrkcU50DfB7oOaJwJgMwRWz2m+bSQDrLkDGHYZHWjcIcZikQ/
 JvqvdG584wteowN8UxiOA7/dAZxdeiU9wYIo7iDsyjyrJAYy0b8OGb/22 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="331007687"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="331007687"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 15:02:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="732776316"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="732776316"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 11 May 2023 15:02:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 15:02:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 15:01:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 15:01:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 15:01:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQHcs4PvrfzR8dOQ9LtwKgg8jyLf29CfLNooQK7AlgCJmCuD+PO1NiDlA1sGODFH71UX0ic/FbCQXBe78a+nKg3a93956f5vsMhq67xFn9ytbTLGS6NfVYTYWq4XUutcJTzPsCMSC2uwIkPGooQGN6U6NgVWHTMI3d85WwcG2rFNgnqKPX/eLJ0o0VyszOdqO5hKGBhKHQ0ELEvoli7Qoddn2CaqKiRTrrtzYtHtosWzgiCq30ULPjWt+DxndyVyE9VcqtmAVBNR45rbzbJ3LW1Hz3nnYFJdgtBP9aa4cPjO28OKaSkCl3iTC149QiJqsQYPLo0aN8LH3UMKk7PW+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgnxLa68wGADiaIOJiMopnuKmz/6vOxB5BsY6uJCXmI=;
 b=hBsfq41aUwfjDu12lrOv/iGmoHE4tHmtFFmgLMoZqG73i++0bPmD8zeU4Ap52RuvV0gXzNfOlRdqFkGJuyDw1m2JQwkgWDYd/JTy0qmDz/LNMgBvAaMH9115R/85qVe1hdBFxMUapImtYlS1WYfPkuYx7gvoRLm1dmV3BUO9jXARRAK77h/kHbWGY8+0/D3kZzIW6BjE41pfKX6+1NeEt2wv22B0XRgb686FgS9+HVmUswLnxGznu6uZjNET4E7BwByInOoWcev/0N5/xW558PRk9gDDoWJb7VIliKxBAlHdfuLP9q+8Z7ZPlHbAQxmQrMUMVPaiI+ANp6bi5CjHcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB8267.namprd11.prod.outlook.com (2603:10b6:303:1e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 22:01:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 22:01:58 +0000
Date: Thu, 11 May 2023 15:01:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <eagppx64lrr4ch6exujm4pd4uifaewihnzbo67g5zrqsxy7acx@cgawtttgksp3>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-6-matthew.d.roper@intel.com>
 <87v8gzkqjw.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87v8gzkqjw.fsf@intel.com>
X-ClientProxiedBy: BYAPR08CA0045.namprd08.prod.outlook.com
 (2603:10b6:a03:117::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c8906a1-f90e-493c-9fdb-08db526b570b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OFDqMYPzkQ3nAva6mPx5A4ulbb5IzTI3QppMTYWXUMfHAZ+WN084LnPTpTdU1EiEXZvzUGnSYR+IllgjZfK835fU+ug8WDMRuwCd1OHUplk29LKOH8i/5+Fu8u5pdJ3pJ1A7UaIDHe4+jvnCO4Rcr0F7KoCsKwqaZMTIfVFUhIfht62RfVJC+Bc+CNSXtVsne84QCAZNx2vrPwWt5bKKdpoa/RsMRlr84aWnf/xjr8SWppTK3IX7uMQ3mtGL8o0lHLn+f2mDRJoqszS89ZtwkeRvSaCgRwKmOkWVaIvmAo/3/KyrFX5zjS5BMa2S2P2arterMQhn9HMBbqMjxp2bWig2t9ykVrZY8D9txOoKEZt0H1LGnBqffZMTQKemYfzFt0hpH6HZRl5OFvjAk27IB8SD1dR0ueOm+0RPqoxv7xlvav/WyldIABqohBYiejpE2XOcoflZAHPR5bD3332kQRd8a1oVGtCSIH2WazRnTxhFqH2pN1uNJPHcOEzJkPa4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199021)(2906002)(478600001)(5660300002)(6916009)(8936002)(66476007)(41300700001)(8676002)(316002)(4326008)(6666004)(66946007)(66556008)(9686003)(6486002)(6512007)(26005)(6506007)(82960400001)(186003)(33716001)(966005)(38100700002)(83380400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?id9Bio57J5bLRCKqWeXIxPJinS1nbXQ7xI93vvkcbSkFkTrGpn3pj2Yba7dp?=
 =?us-ascii?Q?e85aWnjWXW1PKvEfhh2ySlYCktqgNsaMh8XLw85C3YmHVDrZ+kIOBZtWVFTG?=
 =?us-ascii?Q?oEurIC6h+0yzR06ra2BmaKm5gMaGjUTC6w9bhRcS9rm558sY9cM9ltteFam9?=
 =?us-ascii?Q?b8LxpoMuyMWuOqAmdYorYBR0qoVX2sRFroyE+XbyyMLbQ6/DeQLwkLEx6ke9?=
 =?us-ascii?Q?hgYFizrIF7Qfkh54hsDWuxA4FKZqHfkqhaMNiE/cI9bWW8zS92nldf86BaRo?=
 =?us-ascii?Q?o+LfEZmTb6aqoIpMbDRc5ZkemokVYyyR0Kn5XfqpBAtYT80kE/ZjnMEFwTGK?=
 =?us-ascii?Q?ZwwHSUGFVwWk5KDZ9oJr92vsgzuAbJrxrur85+BcN5fpOM74ICY/wxmDjjj4?=
 =?us-ascii?Q?y36mx/6/AFWRyHdUO4sKr/nle/RxlWsLroNh/YeAqWfrEqmoAVSIx2B6+mpn?=
 =?us-ascii?Q?rGdWclSXDgqBBKHrqGWHk3TxfWSr9srZG4A8e+1ElM13816vxWmBk4cxyrWR?=
 =?us-ascii?Q?ygqon0o5YAxLaRMT9+UgXBZ581sUvLkE1JHp9/hRMqENo06kCA1YatQ4wJ73?=
 =?us-ascii?Q?vM0u5C3r4P/xdUkgSP+a4nDyuJcXFb6Xqn3iOPiieczsPZIulXaL4nzPNbr5?=
 =?us-ascii?Q?tqyUd/o3A94w4yYxX/KWddDcLrvXap1PrWlZnO6xtxN+mpQ6TOTnmfsBo1Nj?=
 =?us-ascii?Q?IYH2wIYH3nRKJ4ahsUGusETch0e8h4WKWodFev2Qo9ZGvU/b4b9X/Ggy4IBi?=
 =?us-ascii?Q?/yplbvGkzaKE5IbY2kEfu/GS58MVDC1mjUd4l9XUfSiMa620hC3sntZwZnhR?=
 =?us-ascii?Q?hnXb9b9orBnVEZOzJ4VeIn95Ly6KwwWs/AEsvtQqpzWW6aKJiC0oS65ScHE3?=
 =?us-ascii?Q?gjpuFXFGtkr/FogV/INeSPivMRqIuyU1IIlmGiqSqhQOa19yMP3pFD8Sw/nW?=
 =?us-ascii?Q?eZhYn9XzuNZm7e9Ek9oDgKAmH8Gcsgkn/1jR1YZGminrx+9WGvvK4UUJ6vQq?=
 =?us-ascii?Q?2Pkplu32ZJzW+qxbR7JfXa0esdqdX1m15uR6Fi+haIn5ENYEgV6iPLXGFDqb?=
 =?us-ascii?Q?ohvTMTEUcmI/QtkdYIb0hd92YPuWesC9DRFX8MsB6uCeVNlfdvmUQlt9YCdo?=
 =?us-ascii?Q?utjD414/XJTbqX6/kOq2Er2OtJw9+PdYlYjzn2Xscl/dFXoW2YaxAHfPjlVp?=
 =?us-ascii?Q?pn5rXHn77LsenBLdKkCmpSftVH1hyOMdfB0hA9UKWEvC/CcNUUEmNP+CvnmV?=
 =?us-ascii?Q?DomtGuiffHwpTLfr2h8Ukkqe1U+1Eibs40apyiuIqz/W2y87OuVep/avG/H4?=
 =?us-ascii?Q?P/iFN71Augzgf6e0nvZkZnKUyS0QDa9EWDQcY1m5r5zkoa+opaxIsJQPABb6?=
 =?us-ascii?Q?Y/P5LZzvPwixjkxidK4u5UQ0PuLkVeDxk2OrQEe3DFSeylEG9YJvglvDL5DZ?=
 =?us-ascii?Q?eAn2oeFds3V/EEwCv2pldYyz7Mhz4Zk0xeONnM2XBUDS55xHXVphHDRW2RHv?=
 =?us-ascii?Q?WLquSRTeHJ/82e/sf+VF8CeUxfu0AxEgoKb+ufLCgxDuCFEdJanXjQfxpG9V?=
 =?us-ascii?Q?Oc53gPr3gPTnmcttscme/4ZJuY29GQJreAabdYIUhnXkVdbYgrG2+qlsnBZm?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8906a1-f90e-493c-9fdb-08db526b570b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 22:01:58.0380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2RmnIrjYs5CkGUXUu1YBTNEN35J2+Akd2tPslZZo4PKf/4YOaninKX1Di8Q/o/6/2nv1nPkRTME1vxuB1L7lsTVpixyNgawB/azVYkj39k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8267
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 05/26] drm/xe: Move register MMIO into xe_tile
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 11, 2023 at 03:20:35PM +0300, Jani Nikula wrote:
>On Wed, 10 May 2023, Matt Roper <matthew.d.roper@intel.com> wrote:
>> Each tile has its own register region in the BAR, containing instances
>> of all registers for the platform.  In contrast, the multiple GTs within
>> a tile share the same MMIO space; there's just a small subset of
>> registers (the GSI registers) which have multiple copies at different
>> offsets (0x0 for primary GT, 0x380000 for media GT).  Move the register
>> MMIO region size/pointers to the tile structure, leaving just the GSI
>> offset information in the GT structure.
>>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>  drivers/gpu/drm/xe/display/ext/i915_irq.c |  2 +-
>>  drivers/gpu/drm/xe/xe_device_types.h      | 16 ++++++++++++++
>>  drivers/gpu/drm/xe/xe_ggtt.c              |  3 ++-
>>  drivers/gpu/drm/xe/xe_gt_types.h          |  9 +++-----
>>  drivers/gpu/drm/xe/xe_mmio.c              | 26 ++++++++++++-----------
>>  drivers/gpu/drm/xe/xe_mmio.h              | 21 +++++++++++++-----
>>  6 files changed, 52 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
>> index afde97b6faa6..a9cbd7b59360 100644
>> --- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
>> +++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
>> @@ -920,7 +920,7 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
>>
>>  void gen11_display_irq_handler(struct drm_i915_private *i915)
>>  {
>> -	void __iomem * const regs = to_gt(i915)->mmio.regs;
>> +	void __iomem * const regs = xe_device_get_root_tile(i915)->mmio.regs;
>
>Side note, I'm hoping to merge [1] into i915, backport (or rebase) that
>into xe, nuking ext/i915_irq.c completely.
>
>IDK if that means adding new ifdefs in the display irq file, or how we
>could abstract this in a way that doesn't require changes in i915
>display code.
>
>BR,
>Jani.
>
>
>[1] https://patchwork.freedesktop.org/series/117344/

looking at drivers/gpu/drm/i915/display/intel_display_irq.h, it seems
that would be the interface to xe, so we'd go:

xe_irq.c -> xe_display.c -> i915-display,

with xe_display.c probably having an ops style. On init:

	display_irq->enable = ...
	display_irq->disable = ...
	display_irq->reset = ...
	display_irq->handler = ...


so on xe_display.c we'd have:


void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
{
         if (!xe->info.enable_display)
                 return;

         if (master_ctl & DISPLAY_IRQ)
                 xe->display_irq
}

... and so on


Or even keeping the same xe_display.c we have today, but pointing the
functions to the right place.

Lucas De Marchi

>
>
>
>>  	const u32 disp_ctl = raw_reg_read(regs, GEN11_DISPLAY_INT_CTL);
>>
>>  	/*
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 5dcf1695925f..2481b2045284 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -80,6 +80,22 @@ struct xe_tile {
>>  	struct xe_gt primary_gt;
>>
>>  	/* TODO: Add media GT here */
>> +
>> +	/**
>> +	 * @mmio: MMIO info for a tile.
>> +	 *
>> +	 * Each tile has its own 16MB space in BAR0, laid out as:
>> +	 * * 0-4MB: registers
>> +	 * * 4MB-8MB: reserved
>> +	 * * 8MB-16MB: global GTT
>> +	 */
>> +	struct {
>> +		/** @size: size of tile's MMIO space */
>> +		size_t size;
>> +
>> +		/** @regs: pointer to tile's MMIO space (starting with registers) */
>> +		void *regs;
>> +	} mmio;
>>  };
>>
>>  /**
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 546240261e0a..200976da3dc1 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -93,6 +93,7 @@ static void ggtt_fini_noalloc(struct drm_device *drm, void *arg)
>>  int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
>>  {
>>  	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_tile *tile = gt_to_tile(gt);
>>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>  	unsigned int gsm_size;
>>
>> @@ -106,7 +107,7 @@ int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
>>  		return -ENOMEM;
>>  	}
>>
>> -	ggtt->gsm = gt->mmio.regs + SZ_8M;
>> +	ggtt->gsm = tile->mmio.regs + SZ_8M;
>>  	ggtt->size = (gsm_size / 8) * (u64) XE_PAGE_SIZE;
>>
>>  	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index c4376d50786b..03dd625b2781 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -124,14 +124,11 @@ struct xe_gt {
>>  	} info;
>>
>>  	/**
>> -	 * @mmio: mmio info for GT, can be subset of the global device mmio
>> -	 * space
>> +	 * @mmio: mmio info for GT.  All GTs within a tile share the same
>> +	 * register space, but have their own copy of GSI registers at a
>> +	 * specific offset, as well as their own forcewake handling.
>>  	 */
>>  	struct {
>> -		/** @size: size of MMIO space on GT */
>> -		size_t size;
>> -		/** @regs: pointer to MMIO space on GT */
>> -		void *regs;
>>  		/** @fw: force wake for GT */
>>  		struct xe_force_wake fw;
>>  		/**
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 254b4a63d901..54fa1212fcd9 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -307,6 +307,7 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
>>
>>  	if (xe->info.tile_count > 1) {
>>  		const int mmio_bar = 0;
>> +		struct xe_tile *tile;
>>  		size_t size;
>>  		void *regs;
>>
>> @@ -320,11 +321,11 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
>>  		size = xe->mmio.size / adj_tile_count;
>>  		regs = xe->mmio.regs;
>>
>> -		for_each_gt(gt, xe, id) {
>> -			if (id && !xe_gt_is_media_type(gt))
>> -				regs += size;
>> -			gt->mmio.size = size;
>> -			gt->mmio.regs = regs;
>> +		for_each_tile(tile, xe, id) {
>> +			tile->mmio.size = size;
>> +			tile->mmio.regs = regs;
>> +
>> +			regs += size;
>>  		}
>>  	}
>>  }
>> @@ -340,15 +341,16 @@ static void mmio_fini(struct drm_device *drm, void *arg)
>>
>>  int xe_mmio_init(struct xe_device *xe)
>>  {
>> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>>  	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>>  	const int mmio_bar = 0;
>>  	int err;
>>
>>  	/*
>> -	 * Map the entire BAR, which includes registers (0-4MB), reserved space
>> -	 * (4MB-8MB), and GGTT (8MB-16MB). Other parts of the driver (GTs,
>> -	 * GGTTs) will derive the pointers they need from the mapping in the
>> -	 * device structure.
>> +	 * Map the first 16MB of th BAR, which includes the registers (0-4MB),
>> +	 * reserved space (4MB-8MB), and GGTT (8MB-16MB) for a single tile.
>> +	 * This will get remapped later if we determine that we're running
>> +	 * on a multi-tile system.
>>  	 */
>>  	xe->mmio.size = SZ_16M;
>>  	xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar,
>> @@ -362,9 +364,9 @@ int xe_mmio_init(struct xe_device *xe)
>>  	if (err)
>>  		return err;
>>
>> -	/* 1 GT for now, 1 to 1 mapping, may change on multi-GT devices */
>> -	gt->mmio.size = xe->mmio.size;
>> -	gt->mmio.regs = xe->mmio.regs;
>> +	/* Setup first tile; other tiles (if present) will be setup later. */
>> +	root_tile->mmio.size = xe->mmio.size;
>> +	root_tile->mmio.regs = xe->mmio.regs;
>>
>>  	/*
>>  	 * The boot firmware initializes local memory and assesses its health.
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>> index 1407f1189b0d..acf0b18f3111 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>> @@ -10,6 +10,7 @@
>>  #include <linux/io-64-nonatomic-lo-hi.h>
>>
>>  #include "regs/xe_reg_defs.h"
>> +#include "xe_device_types.h"
>>  #include "xe_gt_types.h"
>>
>>  struct drm_device;
>> @@ -20,27 +21,33 @@ int xe_mmio_init(struct xe_device *xe);
>>
>>  static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>>  {
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +
>>  	if (reg.addr < gt->mmio.adj_limit)
>>  		reg.addr += gt->mmio.adj_offset;
>>
>> -	return readb(gt->mmio.regs + reg.addr);
>> +	return readb(tile->mmio.regs + reg.addr);
>>  }
>>
>>  static inline void xe_mmio_write32(struct xe_gt *gt,
>>  				   struct xe_reg reg, u32 val)
>>  {
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +
>>  	if (reg.addr < gt->mmio.adj_limit)
>>  		reg.addr += gt->mmio.adj_offset;
>>
>> -	writel(val, gt->mmio.regs + reg.addr);
>> +	writel(val, tile->mmio.regs + reg.addr);
>>  }
>>
>>  static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>>  {
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +
>>  	if (reg.addr < gt->mmio.adj_limit)
>>  		reg.addr += gt->mmio.adj_offset;
>>
>> -	return readl(gt->mmio.regs + reg.addr);
>> +	return readl(tile->mmio.regs + reg.addr);
>>  }
>>
>>  static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
>> @@ -58,18 +65,22 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
>>  static inline void xe_mmio_write64(struct xe_gt *gt,
>>  				   struct xe_reg reg, u64 val)
>>  {
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +
>>  	if (reg.addr < gt->mmio.adj_limit)
>>  		reg.addr += gt->mmio.adj_offset;
>>
>> -	writeq(val, gt->mmio.regs + reg.addr);
>> +	writeq(val, tile->mmio.regs + reg.addr);
>>  }
>>
>>  static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
>>  {
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +
>>  	if (reg.addr < gt->mmio.adj_limit)
>>  		reg.addr += gt->mmio.adj_offset;
>>
>> -	return readq(gt->mmio.regs + reg.addr);
>> +	return readq(tile->mmio.regs + reg.addr);
>>  }
>>
>>  static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
