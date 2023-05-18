Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA3FC77B7D
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 18:30:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97DA10E53E;
	Thu, 18 May 2023 18:30:17 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4912310E546
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 18:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684434616; x=1715970616;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cbqpDifi8gX7EP7WIsceJLbtLa8z6qeFdpEG8yLuyfM=;
 b=UWN/qUk+DFQ1AE8ysXillFRUlxdMN1SXIwWsPQE7F0OIc3H+JfwjcwDX
 QjVcJWhRbRjrn+KWd3dUvgUgd5A7hw9p24FA4XNYt5WBnW6AiA8vJdGQP
 +riT2f42YzTZ3BfU/wX1mBkl8qHmHYf51MToUy+Te2LYJeLmw5nE9VRyl
 NH5yLBz1IKoZkFLOthmnJibdN4PGjrY/YlNhlaELEl69bYvptJAvk2zHy
 M2w5YHll5uRyvl+F/nw018OQbI5aWhm2gYKxnT0GMZ+uF8+BcQuC/8Yiu
 wQPlRY11rqx9gYicuUrqojmR/uLmQpaB6YUp5jc3lTyaFm2ByjXR0oL4g g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="349668825"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; d="scan'208";a="349668825"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 11:30:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="767328453"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; d="scan'208";a="767328453"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 18 May 2023 11:30:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 11:30:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 11:30:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 11:30:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgWFjjmroPn4B6lMz3Xr3dTtZJXc4orSYux2yvzD84o8EQUQhvI4/yLtlybJ2HzMnXAlZ5HHLSziEn6ycRBXwN+sACKrho1nrkyIq5jN1NM4w/dymONW80lj7tiimzyXSBugQJefC0i6AlrfdEuyWC0Ye/VzN3Jo1th2XVzqL7OjpFb6Z+5CE+JbAstnT65bxKVk8PNlj5mL5Z+qnCxkbq8zFXivIvzZTt/4uvQZw07L3L/WyA1b2MEFvhJ4Y78ltxaK0Hx4t0DTOt1Q4LFCOqf+KFUKoCV06lSZ5949RgwPgyNgLy7iHFwbeHSDa/UqlVBZaXsbWpqQwNQ4hI3AAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTqoXLabKYS8kmQLGMhcPMZ7wjL6nyPi2wtVJ4yt0lI=;
 b=KxyaSAYSLbZ/Nn8YkuBLtMhRQce78Yn4BecNO8NvMh6pQJaD+Cu6Qixeo94ffo48bLMv1LO1PXE1WEJUFXHtuODQ7bQ1MKRoXlsrTM+/OvK5Pys9wciYcbDCdXtVKYiFL1sjcFOQcIbwXzNGwTY/HL+ycTrYFG5SkD4VMyYhTjCd8xNXuL8jSyx/HK10LP5SFUPqkC8/GezqSV3M63qHQ82VMStRGZiIWEpwXaefYC/GWp3q9Cfi6Z8FF1F+CylyejNv6tfkHl2DV1vrlw2AGRJi+qR9mZI9I8Rnhd4PWT1KSt60kPY9HxaFlpQVJZOexIb1ezVunS7sryuuGq7Eqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6710.namprd11.prod.outlook.com (2603:10b6:806:25a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 18:30:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.033; Thu, 18 May 2023
 18:30:03 +0000
Date: Thu, 18 May 2023 11:30:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <bhrpkjy52emhkcatg5bpstmxnoko2aleezi44k67xzkpnnvcdx@qybvq4ghxlhi>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-16-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-16-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0122.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a64d821-e056-4741-c410-08db57cde51a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jIYaAJwEy39MPbKXxpsJMcrBsOGkDez/DYUTwVZhABClc9X7HhtdhMvcK2Uhu1M6g2uH7FkJWNbwKAtSWwSAy+YxR0NWDi3GCzRGPWDXuDszKE6asFisGUuVLgQodEqMYSWSB/iqy8q9yPq5CsYPcwqC1SXagH4ByC+Tts0eGfnozeHQLZMKCEFS6ry6JV/JNeNkYIs7aoBRI+1b56Vc3aEkxX4PArT7TsxuY6leXAHcXHchVP7mj6yfZLLzyCbzVjIrWF/YFNWTXuC9iNEXTXtNXhTD9Y36HY5SrmMsrGD2CkMz7Q94J0/PVRkr/096hOF/zQBIHWkUuiSca5xQeW6Fd4Sm/jv4y2GoLw8Rmzj1eP7ZFJEisDLNPj18grng1XipQ+qldrIMcNvKcLE6QXJj1YDwpaJOJgiSj9QKoB5s6wsmf60jBLQdD1LBiy6XnWVOr7VHjuER4GCiRgTCzEau/xC4IM85Nc5/zlZsJYr9FQszvNv+UsonctLUyEso/V1EltbWBt9M2KPtGs9ScSydM6pPmuatZ1CMrAwzXgkHzotEzLuG0coy66PvDQck
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199021)(6862004)(6506007)(478600001)(9686003)(6486002)(6512007)(86362001)(2906002)(83380400001)(6636002)(26005)(186003)(316002)(4326008)(66556008)(66946007)(82960400001)(8936002)(41300700001)(38100700002)(33716001)(66476007)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LH8Iz839ZMn5HOiqixMbVt5K9YHmCDVwxdd/8I4j/5eEBCklHI24K304Mmv8?=
 =?us-ascii?Q?/ryquq6V5tbE6IiGnJyHeFKQnfbp8ypTVDbD3VmOxlcTHdu8ybs7m0VqkiT2?=
 =?us-ascii?Q?lbCFoaNZzyTx8XvABvtMhgrfz4TWH2bVhktaPMUm1zPwZXtFd28GZ6oJADns?=
 =?us-ascii?Q?Doi9PVyKCJC7eQglLFmjReehugucL6FXx6WECUwF4eJAC3CanJX9fm2F52eB?=
 =?us-ascii?Q?jRCOzBI5LrvmEM/A4EhQ86jLMoXU1H6SMfCWiCflUI+8d9pYCbYl2HRSoDqS?=
 =?us-ascii?Q?kCxXB5DXsX0SR12xMM5dC/3qq1achF8MbElB79Iub+IueAM4hp5XxrqK5soO?=
 =?us-ascii?Q?uUBR+/mwWD+PsIvOVKOGGHa6xg88T3qLAqvWb0BLgZLoe6ksVA7XDBdX0wKn?=
 =?us-ascii?Q?8+a+doVt9GpcyI6l5xXiyls4nxHfriVddOSNtdukA9t/4o0ktNvuc4yn3nAn?=
 =?us-ascii?Q?hOU+L9HF56deVb1j85CaUEoAraiHqfeAxMvqqaIT05tq0uAYGHLZiGl1vYTf?=
 =?us-ascii?Q?NKpywl6zozS8SVyvs2D4hgDmLGOaujKMPHFvNQxaS+vlqiTEH8x6TXVjtGQB?=
 =?us-ascii?Q?JQ/LQj40Ak5m+1KPJQVljA8haS/xj8kwlTbsUtw8nW91TUUOHBRM12S4T0U8?=
 =?us-ascii?Q?qepXtgJ7fASKnW2BZThFjNjV29GioR9tx2wGAz8ol5LvOkZPpW9oIk5GnYE7?=
 =?us-ascii?Q?npOmsAVI6uOTV+YjK2oVejQNKRFt8Lb/NPnEZ7Qv0zLi0T16SetlqXWS2ug9?=
 =?us-ascii?Q?HFqR/0EFAf8ujOkt+U/2y9fK2vp4nMv1D1x2BIM9MiFJTTbmvO58gOkMdIXZ?=
 =?us-ascii?Q?UsRxcUYsOyz1sqrRDmlt60nbVWMZYk4j5RBH5RuVF+m6chTM+C6Sq6EtlaEr?=
 =?us-ascii?Q?OsazYm8F6t1uioBbNBGGS3cMf/F2fFiBpscN6uone+Z5PXcSZCnFpIKMeU7a?=
 =?us-ascii?Q?UPCZ+Nqi7S3CBCJNouukOBPLsrWq7uWTS2XQ6XzZkk2/fbBLEbNL0WO62y+g?=
 =?us-ascii?Q?/xtMKfjgTtZxLbDl8+i2dYSaHk5QcLclYT3WJDXPqHMvxVqZwdls82FZS+rc?=
 =?us-ascii?Q?EfpLndCGFcMp0eGA8yzqqVIPNJrRCxvN+JqR2GcveZoHULZT3os618dIvuJH?=
 =?us-ascii?Q?LUy48y3ttCPbDmOuEmQTWSn8zkq7DNPh1neDl0K1rG1mAhpb6zSGIgraLgDo?=
 =?us-ascii?Q?UEkftE5zIypO/zucwQhzZs8DeOB6CBBLgM4i6xfjTkcszZeqVRuKZQMuobDQ?=
 =?us-ascii?Q?FZdgX/Fs+NU2vYyguxpTqugjnND7367RZwvm8jgvBwaVtcPEO5QEKH11bOHn?=
 =?us-ascii?Q?UliKl6aOjJoEyRfK3QxRc2Evqm0l9b3smv2bIjXYoV5OS+bvNADuNIvJpQ3V?=
 =?us-ascii?Q?gyFJnQtcKvWQ8iJ8k2C1zvZUyH7XTMOky0qbSPeM3cY4w4ru5ANsdM8FWRKs?=
 =?us-ascii?Q?jFLwPHs1isxueAhEHHyrc4mZoztFm47CSd1ybBj/Glowrx4vT8ILrsB+vhth?=
 =?us-ascii?Q?2j66SoEQy+GdK3hSnKVBSUONF9TTareY+SlR474OTZM7XCYTLrBfeDvU3tY2?=
 =?us-ascii?Q?JX5IMBSYKvIr+ES4hEZ/tbxrdsWG2EJbKvn+0NLdVuNZ8lxVtNOnMoPAvWT+?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a64d821-e056-4741-c410-08db57cde51a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 18:30:02.8892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Df8JChugcclu527/DBkF8SM4N9loYPZ0Uk85bMSWLFmL9cT3VHn5IkDvcmFGkAVEjcUfCstDfP0nWpWaD01B/OX601Z2c9JuN/r2CgoO84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6710
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 15/26] drm/xe: Interrupts are delivered
 per-tile, not per-GT
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

On Wed, May 10, 2023 at 08:47:11PM -0700, Matt Roper wrote:
>IRQ delivery and handling needs to be handled on a per-tile basis.  Note
>that this is true even for the "GT interrupts" relating to engines and
>GuCs --- the interrupts relating to both GTs get raised through a single
>set of registers in the tile's sgunit range.
>
>The (mis)use of struct xe_gt as a target for MMIO operations in the
>driver makes the code somewhat confusing since we wind up needing a GT
>pointer to handle programming that's unrelated to the GT.  To mitigate
>this confusion, all of the xe_gt structures used solely as an MMIO
>target in interrupt code are renamed to 'mmio.'  Reworking the driver's
>MMIO handling to not be dependent on xe_gt is planned as a future
>update.
>
>Note that GT initialization code currently calls xe_gt_irq_postinstall()
>in an attempt to enable the HWE interrupts for the GT being initialized.
>Unfortunately xe_gt_irq_postinstall() doesn't really match its name and
>does a bunch of other stuff unrelated to the GT interrupts (such as
>enabling the top-level device interrupts).  That will be addressed in
>future patches.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c  |   2 +-
> drivers/gpu/drm/xe/xe_irq.c | 334 ++++++++++++++++++++----------------
> drivers/gpu/drm/xe/xe_irq.h |   4 +-
> 3 files changed, 187 insertions(+), 153 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 20663cd0ddaf..e00d260dff00 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -303,7 +303,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> 	gt->info.engine_mask = gt->info.__engine_mask;
>
> 	/* Enables per hw engine IRQs */
>-	xe_gt_irq_postinstall(gt);
>+	xe_gt_irq_postinstall(gt_to_tile(gt));
>
> 	/* Rerun MCR init as we now have hw engine list */
> 	xe_gt_mcr_init(gt);
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 494ec5567e50..fa7d04ba23c0 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -27,60 +27,66 @@
> #define IIR(offset)				XE_REG(offset + 0x8)
> #define IER(offset)				XE_REG(offset + 0xc)
>
>-static void assert_iir_is_zero(struct xe_gt *gt, struct xe_reg reg)
>+static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
> {
>-	u32 val = xe_mmio_read32(gt, reg);
>+	u32 val = xe_mmio_read32(mmio, reg);
>
> 	if (val == 0)
> 		return;
>
>-	drm_WARN(&gt_to_xe(gt)->drm, 1,
>+	drm_WARN(&gt_to_xe(mmio)->drm, 1,
> 		 "Interrupt register 0x%x is not zero: 0x%08x\n",
> 		 reg.addr, val);
>-	xe_mmio_write32(gt, reg, 0xffffffff);
>-	xe_mmio_read32(gt, reg);
>-	xe_mmio_write32(gt, reg, 0xffffffff);
>-	xe_mmio_read32(gt, reg);
>+	xe_mmio_write32(mmio, reg, 0xffffffff);
>+	xe_mmio_read32(mmio, reg);
>+	xe_mmio_write32(mmio, reg, 0xffffffff);
>+	xe_mmio_read32(mmio, reg);
> }
>
> /*
>  * Unmask and enable the specified interrupts.  Does not check current state,
>  * so any bits not specified here will become masked and disabled.
>  */
>-static void unmask_and_enable(struct xe_gt *gt, u32 irqregs, u32 bits)
>+static void unmask_and_enable(struct xe_tile *tile, u32 irqregs, u32 bits)
> {
>+	struct xe_gt *mmio = tile->primary_gt;


AFAICS mmio is always assigned to primary_gt. Why not call it primary_gt
and avoid the confusion and name mismatch with the type?

If I see a function assert_iir_is_zero(struct xe_gt *primary_gt, struct xe_reg reg)
there's a hint that function is only supposed to be called with the
primary_gt. If it can be any type of gt, then simply calling it gt
rather than mmio would be more straightforward.

Lucas De Marchi
