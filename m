Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CFCC7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4491110E0A9;
	Wed,  5 Apr 2023 15:19:04 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278D110E0A9
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680707942; x=1712243942;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7B5Ll8xnFiMXXEFijgZOO/fnG6FYLBnNN+HOMqR+1H8=;
 b=MXvvJWxhQQgR+7uJhVMnVMjKfGxEHO42JTWAcfd7qdHD+ls/e3tsDZ2a
 qkfRFNTdHpqAeajQkf5vHIM7yd8J+RaXqOhhAfpUI6aCQBmKEhIWQZ+Q9
 FIz8NeR7Z/CZPHCK5b0SRh52+zlg/XxffbS1KCzv7ESIrGQL023E8hhDP
 r7u39lj+YSL7hlWj3U13R2n3tW1mj/PHwnHtYTu412xSPiaQhNeBUU9VR
 mHR8xEEuo2M/AWFBW0kvd717T159z0UKtmGm6KPeEkFMlJ8t+YxTu60dA
 L01jAttrmywd2NcAvuj9Zh2DGskzPhMubuBwAFgywHPyo8/FrpIcWhYQM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="428767674"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="428767674"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:19:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="689322032"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="689322032"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 05 Apr 2023 08:19:00 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 08:19:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 08:19:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 08:19:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScO8wB3NPcfo63iyhFZfQapMLQeYVK5o15KUpTc8m3ACueASzPNZVfdjXjY7J4rqu/Bf6JRzkn1S70fnLxP3dHWkO2pJjoTC5T9btOj9Ha4ubXbBYr9wloKmQU7CzrP8kWgT7AEBgkJqeHs3cqL3qNRu5fc1QYvRXfLdnJTrRxKiKLAc06ZAV4LrGrnoPPMfdr630lfeyWRVZbGoPK7e9LV7Bl6daoDkaMIrm5Bv4cwqn78KF6kRFv8t75lIap0mFgdDBAdlwp4aR5dqsdi5n8j/hrP9zF86QaGhtQqZl1Hi4OR8tt8Yxqf0dC2CjHM+6bQh1D64ukonUheWWAvVxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URG8zdreLNk2tquMWZs7TBn2jCSXbBe0mLdECdIh5Hg=;
 b=fJO8XP1xtRwic3ypguCnKjC5qLiDrwxx7kLUMjrVDlLFdsGjpwClp2dI4eJ6gnKn7C9FHjvwGwhExICbYTr+4c9t6BD89LmnPkPdlTLZIC+lE5Jh5whV8zl13YLYVGzDsFdfRim5fq+j5CMlizNJWsfSl3aZd6b70g1w+KLqurjl9KHSHCBwVZujpL7J8A3bo9x060Yjc4bIBPZ85k0iF/kf+hRCmrN8UewQZcJeIF3GlV2RLJ7ctGJjcRfmyt7LOu6F1+7cp4cceMqOLP3TNAAndETrC2lkkFd0rk/9jhH0OxUekjH8B3tP40f6P6HuJjakkp5r5m3PQZkHDRLDZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.24; Wed, 5 Apr
 2023 15:18:58 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 15:18:58 +0000
Date: Wed, 5 Apr 2023 08:18:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <20230405151855.GI4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
 <20230403201702.996400-7-matthew.d.roper@intel.com>
 <ZC14WOfAY61r9PbI@bvivekan-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZC14WOfAY61r9PbI@bvivekan-mobl>
X-ClientProxiedBy: SJ0PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::34) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 84050fc3-88fe-4c18-89bc-08db35e913e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N7pjp4UVj46hjBNuRZqaIvW1x3zm9PDATRC5CMJ3Rpspu6b73xSnj77UNJsZguEIkXbdRyyRDGARBKt3C5ZZ3QhCzTy7fGw8sAk/oRSBZ2SKPmnNNOmivMRatrFHNb1TcAXnVNbjkqFiLWaiAsNMNIFhxNG6G5iPKRXmcRtrjJmnEIlDee+iBq2RJrd9a1yv1g7zcy0di7aoyhwYRPCXru5sBjZzy1J9V7RquCb4hRNXi3QkxhZFmM+ESZrBvi4aPkz6JY+iyuh4T8GPWCEdfy0YnFe9vJnOBZlDiztBYylVC0OaG0rT96XUlSQXjNHRAL/Hfjf2K0XqVWQ24V5torFekYgcvzd+/tbTK9cOoXK3XRo2Z7jAZpn81L8HSc6CUtrH3jTIfRwU0rbBVXFUFsQBccieMZ0pZmPILGiBK5G/iPDdZrK28Kwz5BGuURB3GYiQn9gHBHDtqRbZJA2y/RVXYssWGB2hNYaVlBt14mAVOCd4GP+2j8EJX5p30Ax5v8jrQKNTZlipVMl2U2Cl/Hz4ZswVzcxoQw9FgTy5EnXOX36Tyrt9WgiBriFZX1kj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199021)(82960400001)(38100700002)(30864003)(66556008)(6486002)(4326008)(86362001)(8676002)(5660300002)(66946007)(66476007)(2906002)(8936002)(316002)(6862004)(6636002)(83380400001)(6666004)(41300700001)(6506007)(26005)(186003)(53546011)(1076003)(6512007)(478600001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fAFMu063zXaU57v/UTQgdm3aMriWegwtTInoiEdEaBuA31EATxQoBz9ThivV?=
 =?us-ascii?Q?MnJpvSNCteK2qxK1/3YovmwkkZf+bZoDkiD+E93T1LD7QgWkvIllMxYf7tiE?=
 =?us-ascii?Q?yy9BZMnyu9xjvi2hGXmkGdSgNfDB2fDNar+jgvSZ6sfXHjlwPNiy/WRWGXwU?=
 =?us-ascii?Q?2Fogqr6gKTU59WypJet7/k6NZI4ksgGdnhmD9c8DWEnuvHBCKoDyfTktNIGl?=
 =?us-ascii?Q?Bhwt381SH0HbGRIVPEJmxtINSvrtKrtSzs61MXjl/fCjKYN78igMsFPZSJHs?=
 =?us-ascii?Q?sLCnfJ/jDC2NaBrVY/XCSS48Wr4pNQorBgLPTido2NbKyCsXQw+tA1u2hJTR?=
 =?us-ascii?Q?CrqyRMBz7V4h1Kx808VvCA8V9S/13KqsNFICYHBXb3fI8vLJbmcslgT3sVQG?=
 =?us-ascii?Q?DpO3lO78tQcY9f44SS4RffOmuM4K3um84QIWFNBVt2Vu3VNjP4oNA//2O8tU?=
 =?us-ascii?Q?1G9hA7jGo7n0NOV8wCL7SHKGltj9Jf+YjO+I0EmfuvY2vGVvttYZpmpkIekH?=
 =?us-ascii?Q?eXfBbGAxOjvgRPi8VpI78WzckUk5JIQ3/jN2gsiHPMc5/m5+dqav6KKDg13Z?=
 =?us-ascii?Q?92T4at/bgXvu2C1HLOdWr7s8dvoNetJAPtQmEfkchDFvYOJ0/hLk/p+uEz8d?=
 =?us-ascii?Q?6p5uKUjSiaFCT9sp9VDDQ6zvWi47whF4BrxbcVCPhQD2SneojFTQUdAO0Wmc?=
 =?us-ascii?Q?DyXieF9Sq/IEBqFQIElrp0ZiccsR4noqS6JAqwcLAb3W1B++eJ49yVC6TCcr?=
 =?us-ascii?Q?z9VW6Bb2+ewWFA9jCn7Fb4HBgr+kIr6pbOyE8xUb+hnH1iWLQFRNM6djIIcJ?=
 =?us-ascii?Q?qJsg5VZCM6UceAAN5O5haFX87i8Ls83Ko2l0Or6rZJkW/yUlTAk5owfwEiXs?=
 =?us-ascii?Q?/h26XUzH0UjMK52G73kz87tWlRUkDPm3iEgYYhZaCVLtc5iJ5eaFb+8+MDzL?=
 =?us-ascii?Q?24wvyDfVybpvSyBAZ5rS+h163IVkW7eNsQj2OVzUcIvDYiRR46GfrdHezQAQ?=
 =?us-ascii?Q?OVibv3hFGXJk5eGvS5y6HB5mbF9rcn2hSt5u1/givOg7NfBdzk6EcRmmL9XV?=
 =?us-ascii?Q?SnWFDJkd6yHoWMAn4KOZs19lWAPyjSPwpHrzDWqA702ovl2dx6DcTmu6ABnu?=
 =?us-ascii?Q?5Ekv5pyhtdqXPnjxbcyZJN/iYNfEUQxIL0oNVQf4SSmA3+e1spnqQAbmkMNT?=
 =?us-ascii?Q?triQ5SO44DaDLMk5yPjqB5vtokj6x1g2gaQFU36bMcWFi3yEouM1O7fZFBtT?=
 =?us-ascii?Q?FQtX4Ic4GN+wHrrWE8jaAa7IibtOZy26QPl/0hCzt7IV6DAEjtoWalwp+QON?=
 =?us-ascii?Q?4VKtWoLk5EDy5ebOUxgCdBAaMLrsxS1zWCyH3ziSdjLb9PEPO1vVxfYELLXY?=
 =?us-ascii?Q?ltX2wP9mzEL8BlF6r2ty2kyLBhz3Yw5izpZf3G9cF4X6Gx2gmPWgjZG0e5QH?=
 =?us-ascii?Q?p/Mp24HOWZ2wNHZd09V61FZns1VQ+7lVxvh0KzSEbMLBdx0LdJDrGR1XTQq8?=
 =?us-ascii?Q?MhEgX0z++nKlLT/Kv7zaMuQQe1+4OSRcU3wlIt3jNJweD1ybkXd62yhMqZtX?=
 =?us-ascii?Q?iDlxdy63oRO21qJoiL7j+mY5Tm7jcmfwJVL4v9dXW7nXBYWbWe+wist7nUjG?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84050fc3-88fe-4c18-89bc-08db35e913e8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 15:18:58.3847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgqaOk0ScTvosARzQP3lY/HcAQB9tzqh2pOR8dQvAzSHN3q30E5zK1W4xIP2/o2fGKOe+P5ST9+HHxVaQYJs1lQ84ZervKqiJyQjqkx4ANE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe: Select graphics/media
 descriptors from GMD_ID
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

On Wed, Apr 05, 2023 at 07:02:08PM +0530, Balasubramani Vivekanandan wrote:
> On 03.04.2023 13:17, Matt Roper wrote:
> > Hook up dummy graphics_desc and media_desc structures on platforms that
> > use GMD_ID.  When such a platform is probed, the IP version will be read
> > from the hardware's GMD_ID registers and that version number will be
> > used to select a graphics/media descriptor with the appropriate settings
> > for the detected IP.
> > 
> > If a GMD_ID platform reports a graphics version the driver does not
> > recognize and support, device probe will be aborted.  If an unrecognized
> > media version is reported the device probe will leave media
> > uninitialized and continue.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |   6 +
> >  drivers/gpu/drm/xe/xe_pci.c          | 161 +++++++++++++++++++++------
> >  2 files changed, 136 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index f45251df5715..2d265dbb7651 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -22,6 +22,12 @@
> >  #define FORCEWAKE_ACK_MEDIA_VDBOX_GEN11(n)	_MMIO(0xd50 + (n) * 4)
> >  #define FORCEWAKE_ACK_MEDIA_VEBOX_GEN11(n)	_MMIO(0xd70 + (n) * 4)
> >  #define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
> > +
> > +#define GMD_ID					_MMIO(0xd8c)
> > +#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
> > +#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
> > +#define   GMD_ID_STEP				REG_GENMASK(5, 0)
> > +
> >  #define FORCEWAKE_ACK_GT_MTL			_MMIO(0xdfc)
> >  
> >  #define GEN9_LNCFCMOCS(i)			_MMIO(0xb020 + (i) * 4)	/* L3 Cache Control */
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index d634e781858a..62685b14257b 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -15,6 +15,7 @@
> >  #include <drm/xe_pciids.h>
> >  
> >  #include "regs/xe_regs.h"
> > +#include "regs/xe_gt_regs.h"
> >  #include "xe_device.h"
> >  #include "xe_display.h"
> >  #include "xe_drv.h"
> > @@ -99,6 +100,14 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> >  
> >  #define NOP(x)	x
> >  
> > +static const struct xe_graphics_desc graphics_gmdid = {
> > +	/*
> > +	 * Unset graphics version implies GMD_ID support; driver will read
> > +	 * the IP version from hardware and then select a more appropriate
> > +	 * graphics descriptor.
> > +	 */
> > +};
> > +
> >  static const struct xe_graphics_desc graphics_xelp = {
> >  	.ver = 12,
> >  	.rel = 0,
> > @@ -164,9 +173,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
> >  };
> >  
> >  static const struct xe_graphics_desc graphics_xelpg = {
> > -	.ver = 12,
> > -	.rel = 70,
> > -
> >  	.hw_engine_mask =
> >  		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
> >  		BIT(XE_HW_ENGINE_CCS0),
> > @@ -175,6 +181,14 @@ static const struct xe_graphics_desc graphics_xelpg = {
> >  	.has_flat_ccs = 0,
> >  };
> >  
> > +static const struct xe_media_desc media_gmdid = {
> > +	/*
> > +	 * Unset graphics version implies GMD_ID support; driver will read
> > +	 * the IP version from hardware and then select a more appropriate
> > +	 * media descriptor.
> > +	 */
> > +};
> > +
> >  static const struct xe_media_desc media_xelp = {
> >  	.ver = 12,
> >  	.rel = 0,
> > @@ -194,9 +208,6 @@ static const struct xe_media_desc media_xehpm = {
> >  };
> >  
> >  static const struct xe_media_desc media_xelpmp = {
> > -	.ver = 13,
> > -	.rel = 0,
> > -
> >  	.hw_engine_mask =
> >  		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
> >  		BIT(XE_HW_ENGINE_VECS0),	/* TODO: add GSC0 */
> > @@ -298,12 +309,8 @@ static const struct xe_gt_desc xelpmp_gts[] = {
> >  };
> >  
> >  static const struct xe_device_desc mtl_desc = {
> > -	/*
> > -	 * FIXME:  Real graphics/media IP will be mapped from hardware
> > -	 * GMD_ID register.  Hardcoded assignments here will go away soon.
> > -	 */
> > -	.graphics = &graphics_xelpg,
> > -	.media = &media_xelpmp,
> > +	.graphics = &graphics_gmdid,
> > +	.media = &media_gmdid,
> 
> What's the need to assign a dummy structure instead or assigning a NULL?

My original thought was to have NULL indicate that there shouldn't be
any media on the platform (e.g., PVC where it was all fused off in
production), whereas the dummy structures would indicate that the
presence/absence is derived from GMD_ID.  But now that I think about it,
using NULL would probably work in both cases --- on a platform like PVC,
there's no register at the GMD_ID offset, so an attempted GMD_ID read
will just come back as 0 and lead us to consider media disabled.

I'll drop the dummy structures and just leave .graphics and .media as
NULL for GMD_ID platforms in the next version of the series.


Matt

> 
> Regards,
> Bala
> 
> >  	.require_force_probe = true,
> >  	PLATFORM(XE_METEORLAKE),
> >  	.extra_gts = xelpmp_gts,
> > @@ -414,9 +421,91 @@ static void xe_pci_remove(struct pci_dev *pdev)
> >  	pci_set_drvdata(pdev, NULL);
> >  }
> >  
> > +static u32 peek_gmdid(struct xe_device *xe, u32 gmdid_offset)
> > +{
> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > +	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
> > +	u32 ver;
> > +
> > +	if (!map) {
> > +		drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI BAR.\n",
> > +			gmdid_offset);
> > +		return 0;
> > +	}
> > +
> > +	ver = ioread32(map);
> > +	pci_iounmap(pdev, map);
> > +
> > +	return REG_FIELD_GET(GMD_ID_ARCH_MASK, ver) * 100 +
> > +		REG_FIELD_GET(GMD_ID_RELEASE_MASK, ver);
> > +}
> > +
> > +static void handle_gmdid(struct xe_device *xe,
> > +			 const struct xe_device_desc *desc,
> > +			 const struct xe_graphics_desc **graphics,
> > +			 const struct xe_media_desc **media)
> > +{
> > +	u32 ver;
> > +
> > +	if (desc->graphics->ver) {
> > +		/*
> > +		 * Pre-GMD_ID platform; device descriptor already points to
> > +		 * the appropriate graphics descriptor.
> > +		 */
> > +		*graphics = desc->graphics;
> > +		xe->info.graphics_verx100 = (*graphics)->ver * 100 + (*graphics)->rel;
> > +	} else {
> > +		/*
> > +		 * GMD_ID platform; read IP version from hardware and select
> > +		 * graphics descriptor based on the result.
> > +		 */
> > +		ver = peek_gmdid(xe, GMD_ID.reg);
> > +		switch (ver) {
> > +		case 1270:
> > +		case 1271:
> > +			*graphics = &graphics_xelpg;
> > +			xe->info.graphics_verx100 = ver;
> > +			break;
> > +		default:
> > +			drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
> > +				ver / 100, ver % 100);
> > +		}
> > +	}
> > +
> > +	if (!desc->media)
> > +		/* No media support at all */
> > +		return;
> > +
> > +	if (desc->media && desc->media->ver) {
> > +		/*
> > +		 * Pre-GMD_ID platform; device descriptor already points to
> > +		 * the appropriate media descriptor.
> > +		 */
> > +		*media = desc->media;
> > +		xe->info.media_verx100 = (*media)->ver * 100 + (*media)->rel;
> > +	} else {
> > +		/*
> > +		 * GMD_ID platform; read IP version from hardware and select
> > +		 * media descriptor based on the result.
> > +		 */
> > +		ver = peek_gmdid(xe, GMD_ID.reg + 0x380000);
> > +		switch (ver) {
> > +		case 1300:
> > +			*media = &media_xelpmp;
> > +			xe->info.media_verx100 = ver;
> > +			break;
> > +		default:
> > +			drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
> > +				ver / 100, ver % 100);
> > +		}
> > +	}
> > +}
> > +
> >  static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  {
> >  	const struct xe_device_desc *desc = (void *)ent->driver_data;
> > +	const struct xe_graphics_desc *graphics_desc = NULL;
> > +	const struct xe_media_desc *media_desc = NULL;
> >  	const struct xe_subplatform_desc *spd;
> >  	struct xe_device *xe;
> >  	struct xe_gt *gt;
> > @@ -445,22 +534,32 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  	if (IS_ERR(xe))
> >  		return PTR_ERR(xe);
> >  
> > -	xe->info.graphics_verx100 = desc->graphics->ver * 100 +
> > -				    desc->graphics->rel;
> > -	if (desc->media)
> > -		xe->info.media_verx100 = desc->media->ver * 100 +
> > -					 desc->media->rel;
> > +	/*
> > +	 * If this platform supports GMD_ID, we'll detect the proper IP
> > +	 * descriptor to use from hardware registers.
> > +	 */
> > +	handle_gmdid(xe, desc, &graphics_desc, &media_desc);
> > +
> > +	/*
> > +	 * If we couldn't detect the graphics IP, that's considered a fatal
> > +	 * error and we should abort driver load.  Failing to detect media
> > +	 * IP is non-fatal; we'll just proceed without enabling media support.
> > +	 */
> > +	if (!graphics_desc)
> > +		return -ENODEV;
> > +
> >  	xe->info.is_dgfx = desc->is_dgfx;
> >  	xe->info.platform = desc->platform;
> > -	xe->info.dma_mask_size = desc->graphics->dma_mask_size;
> > -	xe->info.vram_flags = desc->graphics->vram_flags;
> > -	xe->info.vm_max_level = desc->graphics->vm_max_level;
> > -	xe->info.supports_usm = desc->graphics->supports_usm;
> > -	xe->info.has_asid = desc->graphics->has_asid;
> > -	xe->info.has_flat_ccs = desc->graphics->has_flat_ccs;
> >  	xe->info.has_4tile = desc->has_4tile;
> > -	xe->info.has_range_tlb_invalidation = desc->graphics->has_range_tlb_invalidation;
> > -	xe->info.has_link_copy_engine = desc->graphics->has_link_copy_engine;
> > +
> > +	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
> > +	xe->info.vram_flags = graphics_desc->vram_flags;
> > +	xe->info.vm_max_level = graphics_desc->vm_max_level;
> > +	xe->info.supports_usm = graphics_desc->supports_usm;
> > +	xe->info.has_asid = graphics_desc->has_asid;
> > +	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
> > +	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
> > +	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
> >  
> >  	/*
> >  	 * All platforms have at least one primary GT.  Any platform with media
> > @@ -471,7 +570,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  	 * FIXME: 'tile_count' here is misnamed since the rest of the driver
> >  	 * treats it as the number of GTs rather than just the number of tiles.
> >  	 */
> > -	xe->info.tile_count = 1 + desc->graphics->max_remote_tiles;
> > +	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
> >  	if (MEDIA_VER(xe) >= 13)
> >  		xe->info.tile_count++;
> >  
> > @@ -488,9 +587,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  			gt->info.type = XE_GT_TYPE_MAIN;
> >  			gt->info.vram_id = id;
> >  
> > -			gt->info.__engine_mask = desc->graphics->hw_engine_mask;
> > -			if (MEDIA_VER(xe) < 13 && desc->media)
> > -				gt->info.__engine_mask |= desc->media->hw_engine_mask;
> > +			gt->info.__engine_mask = graphics_desc->hw_engine_mask;
> > +			if (MEDIA_VER(xe) < 13 && media_desc)
> > +				gt->info.__engine_mask |= media_desc->hw_engine_mask;
> >  
> >  			gt->mmio.adj_limit = 0;
> >  			gt->mmio.adj_offset = 0;
> > @@ -498,8 +597,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  			gt->info.type = desc->extra_gts[id - 1].type;
> >  			gt->info.vram_id = desc->extra_gts[id - 1].vram_id;
> >  			gt->info.__engine_mask = (gt->info.type == XE_GT_TYPE_MEDIA) ?
> > -				desc->media->hw_engine_mask :
> > -				desc->graphics->hw_engine_mask;
> > +				media_desc->hw_engine_mask :
> > +				graphics_desc->hw_engine_mask;
> >  			gt->mmio.adj_limit =
> >  				desc->extra_gts[id - 1].mmio_adj_limit;
> >  			gt->mmio.adj_offset =
> > -- 
> > 2.39.2
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
