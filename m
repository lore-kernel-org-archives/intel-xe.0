Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C398CC0015E
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 22:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF2310E1C5;
	Tue, 25 Jul 2023 22:55:23 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A6F10E1C5
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 22:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690325721; x=1721861721;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zqOmZ5iXEB7iTTviSw+U/Io7YXGNGBRImb4DB0QRlKU=;
 b=c2JpFcAKq0rRP1gnu6wAU1jp/yGEbTacvyWqup4NK8D8x9D45AEOUOWQ
 qVfC/dwMos8yhbiW4OYRdQPH0WoIB8EfjZgyYk+FBdszoSiv78+bNad6l
 Z8xT1SnxbXFOYyT2V4k7FY0iOu8FGDvbpEb0jiOxR3lIIzkCRRGo9umg0
 xYspdv66dPw+VDhbWRZ5WR1MHOcAjMPYqNp+NSAdLWBFJLGhIQFwaeiLX
 uXdybnPEUHDSHAJNLM3t1cjXLmxos3q8QSo+uUZBHkKBtiJx9FxV5AzmU
 HCshDPheG7+Dhh2rxY56gp+95drliU0KNX8ftR5SrC2cw9ZW3XwcdVtOj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="370536723"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="370536723"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 15:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="720214499"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="720214499"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 25 Jul 2023 15:55:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 15:55:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 15:55:20 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 15:55:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZOKiLKXGuhnlo9HD2a6qGmVWEzeo6M//EMk8I6RUD8ycuTh/NU0R6s9gVkBAI1DZVtszPahJBtOL0plO5tnotlWw5rfwovgIPsK/ly+dyPQbd1Q+QqAR7r3oHttTLviwnz2A72MBoSK9k7byBYPSOADjRnuRdV9HhUfTSvk61PSfGOlSUvp5v7q2jMzX24A87bGAhru3aM3pxjrQawFlQddsK3TZvv+YRVtHUDyb0PPGh5lDqB80Z31EyufD3jRanKqTLhD3zOQsow7JH2lT6Mu5/Oov6Eh8et+X/goYFe3K7JURJNgPM5SJ+BVjoOUHcRDUeodMPn8B4Wpd6pbLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7Br8A0NSkL5lUpkE0qSPteXoWLBHiHg42UXuvxSClY=;
 b=mPGcv8O/Nk6muhQf/IcWQEE/AoB1BcfgWd31y/1TmALQQ5pavLzF/+TTJYsyelOBqyW9wQp4A9kBzUwWC5DbFowpCkAKmg8ZG2i1YNZA6tv7cm5g7fIi8jKvPPt5v93zSEex+8mnOWPw7Vqye7mbMhEwZN8kKZuBcu+8nwy5XnMM2QMmwHb6IG4ztvfWObXRchGNp1nZVoXSezcr27IyYEQXyqBfBOzqGRy1UJdQAUQlS8VAdfNBctq50LG/hZ5iwJDAmtZ+qwfduZkxbYJp+ITZIJ9xmGA3Ql0G3XeJEww9Qln9wpBoKuFRSwUeWX1U7TDZB2wP519jeDJVG4H0DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB6142.namprd11.prod.outlook.com (2603:10b6:8:b2::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.32; Tue, 25 Jul 2023 22:55:18 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 22:55:18 +0000
Date: Tue, 25 Jul 2023 15:55:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230725225515.GZ209733@mdroper-desk1.amr.corp.intel.com>
References: <20230725202836.3854908-1-lucas.demarchi@intel.com>
 <20230725202836.3854908-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230725202836.3854908-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0114.namprd03.prod.outlook.com
 (2603:10b6:a03:333::29) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB6142:EE_
X-MS-Office365-Filtering-Correlation-Id: 14268cf0-5334-45f8-b339-08db8d62378a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +SpKnyDEfr0fOyIOnS5JB7/9dXf+f/YAbSd5PPlbbbeEI0cpQ0IkfJfFo2WjHKKOdMNALG3XaSeeAqQlQ6UqcJZkv28OfBg45NQA15fBS2FRPRMys8ktzZpXjhQe0FSnZ6PXptl7uEdtwc+xrzSCOaVtQiS9hIfxb2hIAyEJ/q668S6yL/uUSZ4tFA/dOCHfXLaUsTmKkO1LhKsQSEMiBX0pn4e2TvOkf7BZPfOlY3/5q8XrAYXcCKoH7fIdHEBuiijwYs/R3c8LThdfFHr0J5reCTpVjJl1Eul1TEqWpY0h+6P0b0qGxw+VmqgeESTzA/Ee0mYeR65o64jBpKefyqhV1hYdZZR6yMkGkxxHT1Hr1Yvn32rgEpLFKhIZKFuIRV77u6L9Asxu3rdvAf/jm+upQdIZyfevrTanYnssZBDVxqLLYtxtFJ2zZ41BuEKoXgjQFzLEAhBTdWyrG7Yxvqr5cAl8IjpxySHvOOG3gBwgwwrnxeQlN7ob1DNm38u3rvd58X1ZluBrwnnWv85Hd1UTt2HTzxMo480402qHr2nJeXI2NuFmYnv9mo092haD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199021)(6486002)(6512007)(6666004)(478600001)(186003)(6506007)(1076003)(107886003)(26005)(2906002)(66556008)(41300700001)(8936002)(66946007)(6636002)(6862004)(5660300002)(8676002)(4326008)(66476007)(38100700002)(82960400001)(316002)(33656002)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gSyNmBlkA30rMASeqyc28zblD/SwasauoSYBF4ilwrtl91GltwTlUiUf4m0Y?=
 =?us-ascii?Q?xIONyL71rXmwOO37iGCDCboWUq2tHilg33v7T2S2EPGallCYkO+mc+vO5wuW?=
 =?us-ascii?Q?8sxTT971ofIaRWUh4cUiTnOaE36ArM3QheDpronkFBCljWObXpt8n4MNajiJ?=
 =?us-ascii?Q?QLobXEyVqfCO8v3PJMUnAqZR0SzI43CLrIlb3Ymw1SnbM/bHpViyKRDds9F0?=
 =?us-ascii?Q?Asoua5IsE1SzM3U5/GvDfVCW9jUOSEZMmddbs45NvEK4t8a4tBM1+/WpsQV1?=
 =?us-ascii?Q?liOUxR26gDw+WjPAr2HSd71Q6l5j0a60FHbxpy+/38nw1rU7o3VDzVylD60E?=
 =?us-ascii?Q?/0Ez13ZWP2K9lXs6X/l91a8xZ5qf8uXgfQaHvvHXfdLLEFNkgC3REUSXqC0I?=
 =?us-ascii?Q?cwu+h5c2YXtljrI5wJIbs10+rCXeGl9lxfbEuqe9j4RINGGxoqiB5pJMV531?=
 =?us-ascii?Q?ex5VRYR7Cvb2ce5ycrLL7b9FTuOSttRpSpX38ihX1EwgsdUtZ0d6pVrumekN?=
 =?us-ascii?Q?DeWMT0O3N6ZptN4hbxM2kPZMXTsEPJ9izaW+mGL5fVR5op/9gZrqP3kq6BFM?=
 =?us-ascii?Q?PNY/W5k9ohoiCnGXJJYUxGw935zYrC0z/OWdl8giqNDWt4pSCTu01newkMuH?=
 =?us-ascii?Q?3L3AA+8JlqdTouEdkBSsqUG8lTvRjYap++lZ8lwwe9WdNK1U8uVociO/w7aZ?=
 =?us-ascii?Q?sQXJKyRl9dNKyWIV4dvfahx6fyA2yBP68bBL5SSQ+hz1avT3YKoxBmXEP5nn?=
 =?us-ascii?Q?nqcgIR/xeLfqwCVMN6f7TvzFCJ36Ezh49rrFevNJXHyHnuOUdrjGPhrISbbY?=
 =?us-ascii?Q?Mfe3r9DxsYolEExkNZuhHNU+ymU69mV7sv0bXFpDT1h30dnqAHRJgvQbhjid?=
 =?us-ascii?Q?47X8uPs1eWJ8o2IJK1G4OToqzGCjA8zwYejjbBD0vI2yZ+VTJzGKcXHGo7LT?=
 =?us-ascii?Q?68Jm9Kb066CPen1p6zU2KVP0fVI7wE9aThT0EMF1t9bgGP6qX+F6sOUlsoiR?=
 =?us-ascii?Q?QrweRUCFCldI5Z3go3TNj9Fy6vrlGDdnm+l5jQjj3KIlok20jDfGujgowCjp?=
 =?us-ascii?Q?mdn2DWnJ8CzqBj201vLYpXvodMpOWm2napnWg4w8+9hAWbYo3mV3X7z9OjhS?=
 =?us-ascii?Q?kBowQc1MJunyjuw9n+w6x8D0guQ13+hfOfnFjR3JIuALcmTMNXoebIiKlkEi?=
 =?us-ascii?Q?R4ECdUQaeJvcaNcaC/CJ+2ffMn07/+ZeRrMxKwV6/5lisdWoIiL9bGgfjTTL?=
 =?us-ascii?Q?ss38bu7jg1E4lBVpfIzL6ilVrfpNzGEm6z0XtwMKqcagNu5SZCUkokOWzmN6?=
 =?us-ascii?Q?EDlk8K0qCzT/iLvJHq7BeEEz99mhoFnyXD2HKSdN0YfNr9xuoY55EEWszvei?=
 =?us-ascii?Q?jwjphoA7EbSt00rm+OgN69qDzhRodyJ/A+ps9SiIsCDDaCxsVb9THQo3Wx75?=
 =?us-ascii?Q?bzvqKLCtm3hOkc3n4rc2oDohIAuzbw5d39kb9sLS9+trMm+pYI+Xbc3PYZoY?=
 =?us-ascii?Q?edu+xrcgV+FjYCGCnrCNlSBn39hBmkbwcRiOffaOAjt9t+QDYy3KZNvJlxel?=
 =?us-ascii?Q?1b7TeZnII2g1245tXyBcI0qokli9C3rlSw2hgV4Ifu3TMrzZMWO+MnZChGEs?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14268cf0-5334-45f8-b339-08db8d62378a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 22:55:18.2556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEqvbv1qVErLRSXa8x91hrdcigWoTU2Wlv2mMdp2L2WHepawMeT56HHOsF3urxHncRqaiqxMLmFR6c1T7uoUMDPC2ib82syJ1lX4A0tytoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6142
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe: Sort xe_regs.h
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

On Tue, Jul 25, 2023 at 01:28:36PM -0700, Lucas De Marchi wrote:
> Sort it by register address, but  keeping a few exceptions when a
> register for a platform changed the address, but has the same
> functionality as an already existing register.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h | 56 +++++++++++++++----------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 3f7052fec6cc..0b3607e0ba1c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -7,9 +7,6 @@
>  
>  #include "regs/xe_reg_defs.h"
>  
> -#define GU_CNTL					XE_REG(0x101010)
> -#define   LMEM_INIT				REG_BIT(7)
> -
>  #define RENDER_RING_BASE			0x02000
>  #define BSD_RING_BASE				0x1c0000
>  #define BSD2_RING_BASE				0x1c4000
> @@ -45,36 +42,15 @@
>  #define FF_THREAD_MODE				XE_REG(0x20a0)

Looks like there are some registers that don't really belong in this
file.  We'll need to move at least this one to the engine register
header at some point.  Actually we should probably move the *_RING_BASE
registers as well.  But that can all happen in a future patch.

>  #define   FF_TESSELATION_DOP_GATE_DISABLE	BIT(19)
>  
> -#define PVC_RP_STATE_CAP			XE_REG(0x281014)
> -#define MTL_RP_STATE_CAP			XE_REG(0x138000)
> -
> -#define MTL_MEDIAP_STATE_CAP			XE_REG(0x138020)
> -#define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
> -#define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
> -
> -#define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
> -#define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
> -#define   MTL_RPE_MASK				REG_GENMASK(8, 0)
> -
> -#define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
> +#define TIMESTAMP_OVERRIDE					XE_REG(0x44074)
> +#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
> +#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
>  
>  #define PCU_IRQ_OFFSET				0x444e0
>  #define GU_MISC_IRQ_OFFSET			0x444f0
>  #define   GU_MISC_GSE				REG_BIT(27)
>  
> -#define GFX_MSTR_IRQ				XE_REG(0x190010)
> -#define   MASTER_IRQ				REG_BIT(31)
> -#define   GU_MISC_IRQ				REG_BIT(29)
> -#define   DISPLAY_IRQ				REG_BIT(16)
> -#define   GT_DW_IRQ(x)				REG_BIT(x)
> -
> -#define DG1_MSTR_TILE_INTR			XE_REG(0x190008)
> -#define   DG1_MSTR_IRQ				REG_BIT(31)
> -#define   DG1_MSTR_TILE(t)			REG_BIT(t)
> -
> -#define TIMESTAMP_OVERRIDE					XE_REG(0x44074)
> -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
> -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
> +#define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
>  
>  #define GGC					XE_REG(0x108040)
>  #define   GMS_MASK				REG_GENMASK(15, 8)
> @@ -87,4 +63,28 @@
>  #define STOLEN_RESERVED				XE_REG(0x1082C0)

We should also make sure we're writing hex in lowercase consistently
too.  Again, that can be done in a future patch.

>  #define   WOPCM_SIZE_MASK			REG_GENMASK64(8, 7)
>  
> +#define GU_CNTL					XE_REG(0x101010)
> +#define   LMEM_INIT				REG_BIT(7)
> +
> +#define MTL_RP_STATE_CAP			XE_REG(0x138000)
> +#define PVC_RP_STATE_CAP			XE_REG(0x281014)

I think it's better to keep consistent sorting rather than trying to
keep registers that moved between platforms in the same place.  Too many
exceptions like this ultimately leads to chaos when people aren't sure
how far they can stretch the exceptions.

> +
> +#define MTL_MEDIAP_STATE_CAP			XE_REG(0x138020)
> +#define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
> +#define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
> +
> +#define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)

It looks like this one should be slightly earlier (0x13800c < 0x138020).


Matt

> +#define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
> +#define   MTL_RPE_MASK				REG_GENMASK(8, 0)
> +
> +#define DG1_MSTR_TILE_INTR			XE_REG(0x190008)
> +#define   DG1_MSTR_IRQ				REG_BIT(31)
> +#define   DG1_MSTR_TILE(t)			REG_BIT(t)
> +
> +#define GFX_MSTR_IRQ				XE_REG(0x190010)
> +#define   MASTER_IRQ				REG_BIT(31)
> +#define   GU_MISC_IRQ				REG_BIT(29)
> +#define   DISPLAY_IRQ				REG_BIT(16)
> +#define   GT_DW_IRQ(x)				REG_BIT(x)
> +
>  #endif
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
