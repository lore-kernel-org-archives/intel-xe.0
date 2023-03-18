Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCC8C74A5B
	for <intel-xe@archiver.kernel.org>; Sat, 18 Mar 2023 00:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21B510E28D;
	Sat, 18 Mar 2023 00:38:45 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57D010E28D
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Mar 2023 00:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679099923; x=1710635923;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u0maCGPTBhSqn5F6V+QX513sLcHaPd6yDyt6z3f7Oqs=;
 b=Tpj6ZOWkC3U5DnEnDjcoosb6XGwjNV8WARUWUC/DecAm5IjudoHKWYH+
 x59xxrg82yUUwN7kgsD0yzVjHqw/5H/dwyPVcZ1aka2Za+5y/gmHxrG70
 7u+WYZm0kBsaqAi4YvSakKXetQn4CLg3mWD//Knfak5/UO55q6BSLCSh9
 xwLTG17asXTHUTmAAI4AWjHUCAQrj7DTGzG0mmhUyZ2Woupp4KQvx/SoM
 YZhQ6H8heA92+E2+cT9tKbs5Ndn4olExCzI1QF52q8gcubq1Ys3CRfcFA
 nE4Z3HSeSVgtlMcYYw9/ae19Df7MIB3gB2NCyolwnuZ0zRFDI9EjNjnbT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="322239858"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; d="scan'208";a="322239858"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 17:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630467952"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; d="scan'208";a="630467952"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 17:38:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 17:38:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 17:38:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 17 Mar 2023 17:38:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 17 Mar 2023 17:38:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6g8MIwIC9xT/13/t8sQrB4IKQ8vbOFMpRUXZOk2xy4/Ae6MXb1Bhh5I2e8mIDF/RncpkqCBzJ2vA61zqoXWb/Ph9CtOjuw9cRk8rlmCbQlzT7b+8lsz8RuOt4ntPgmfIn+PpZfNW1CIRXekHgwf+QjgZnHFR3xFpKII7WJ3PeEJvxGWB2cC2/T4kF4sFzkIBfo7iT9ls9lVFog6dxyA4D9wIEN1ciVM6MDK6ddU6AkaJHjzrDSSa2kzGsUrsLOO6rzqRDUS2ssIuYU5szs5qXezHo5h/pVxv75d0toMz3E+sDnQD2SWa+QYUxM50h0mFCyBXgjXpNHe4OL8PfVWvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDrXa8hVCl4nqWYDHOwmLpMcMAPg46OvPHnuDH4KNlk=;
 b=bibmYdXoew7sqxTG+hT+mkx3PR9eX7RaMzcyu0tzmGNhM8GXRtX+xSGN2ffodUYTFHOp0p1Yxn06IGpfhRqgt3c0PQDQfg6KfkHiIXM4cbaATdF+ViTbpwZhdYh2KrRSXrDBysVyMC/APNgQa81rbGYzHxrI1qkNWI7LoxEBVXOB2ImAIJin2MlT2D/KAXFOb1ovEOdotlXx7NijYdgq1kdpZ8vMU6ypI2hLuVoD4CSsZB+EivkX3wjZBT/coK/2SIFu1PmL0DLZihJTRA8ahyUy46IeEZnimWZNLkXt/owP9cZTpdKKyS/cpAmKCHr89/ECbwGBwkW2tYtBgPhAfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB7246.namprd11.prod.outlook.com (2603:10b6:208:42e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Sat, 18 Mar
 2023 00:38:39 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6178.024; Sat, 18 Mar 2023
 00:38:39 +0000
Date: Fri, 17 Mar 2023 17:38:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <20230318003835.GE1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230315091740.1580755-1-himal.prasad.ghimiray@intel.com>
 <20230315091740.1580755-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230315091740.1580755-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR05CA0177.namprd05.prod.outlook.com
 (2603:10b6:a03:339::32) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b64e6b1-6cf6-4a26-790c-08db27491dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JQrh9kYZfqBeIX8q58UqG8Vfvd3HMOM8PeJ69R5DFd4fzCq5ZZkh0AULMy65gOV2l25RT/9aRjP3CiUcZAR3mcVd/dkfRpB2/1boMX0ir8CGt7IJ/QzNqIjfoMyy+wk8wBNupxvaJBmxcfZO8TIfop0GiherAkgiUtFRk/k2Es2gqy/TUqz0hD2xkY62qPYLECtB3LPUhC2AnqsYD1Sqg+AfFpGE9ho1/7lJQLQqcS9vFWpv95uN4mjJsEgxtBnNlxzGQWakYAW705ERW0dlJiBv9wKDmK8kA8A2NaAuxmeZA6Rcyly3bjiXRkHAUTSkE3rvPYRpfXFuZga8ro5kz5TW9I8h51Dr843rH8yIFQx5EVX6aWir3dyS756Z4BiHBoyE4crJelvWTji3baNVFmAldS65ZUlI/gSpAF6rxPRKDy7Jaj1aYi1gJR3dqT9f/I+AvQMO9Rjm8u3GsBMi7PxM79YuGhp3bbciUVS1+Brt7AUy9T0SCxp5jhqKT85myPDa+8aFcDeKxy9Vbdk4Q+AyOgMt4GjRSRgNwKhkvAynUfsOX21wFFU9f9l5PJo92Lg+ELDVfvpkinL21b9ILUwzY97IRIDHERwaPAltq21wRErYFvH5T10iJ4LxpjiNCYhyJc1ZskSaWhjVz8alOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199018)(66899018)(4326008)(2906002)(66946007)(6862004)(5660300002)(30864003)(66556008)(66476007)(8676002)(82960400001)(86362001)(33656002)(38100700002)(8936002)(6666004)(6486002)(1076003)(41300700001)(316002)(6512007)(6636002)(6506007)(478600001)(26005)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A4kmBbF8slTv1BRob9RlP8PiJnF9wZy9Gekaye7Nc7GXmr608WpMvnOIB+iN?=
 =?us-ascii?Q?lmr3htknotf+WsC2lABoEBwLKkGwEsNdoUF5zyrC6Wyjxs5Bp3uMLb0V0J2f?=
 =?us-ascii?Q?knaFiKfynZvWvsn/F9MG4eB66rQVGcYYrIuApMAVqBFtyaSY/Uk/UJM/B0Nf?=
 =?us-ascii?Q?VHzVAO5roCJP4A6C2G0n/Yewwp40EzIYkrPjukqLWnaMLetjFpzSiu9KeCfr?=
 =?us-ascii?Q?r4XgnrY+fp25H1U+NUGOhETGHlTsMegWgzcP1peW+uKoi5PeR2ehPiIUyjAG?=
 =?us-ascii?Q?qukbRz0sY2Yod8fBDE10f9/2VxTXNXCNqmKtKqFasF2n9Amu0uZKecJpg6oj?=
 =?us-ascii?Q?vtOHn0eLHmVJ+rRGK/1vw8kimxotVZFHBYaJ+UKfdoTZhVvgfRPHMo5dbewH?=
 =?us-ascii?Q?thngiNFph7l7+JU/2l41Xet8h8CE86J1359zUyPtqUYESahAP5MYf6k5kM+C?=
 =?us-ascii?Q?wxetPdi1dVQMEBTkLtc1F47YrfRnbOuyWSBos+D5xIDYRplt3ZjqwCi4jpqO?=
 =?us-ascii?Q?DKaJk83ynnB8Ok2f0rCfy7yJbdsJmXnNNvUXwYeYEEQ3saT9Yys3GGg35V1N?=
 =?us-ascii?Q?bS2LS+UcHYlN0YdstVeO6QsN8BT2VIIsOHFa5H9c0ccjb8aVwBu84CIRtDcu?=
 =?us-ascii?Q?UIAo/z/qKmgWRIEJjcw3CNZtcY4RqsV+9dTVqxbeYgucBdcIUUGaJH05qZT5?=
 =?us-ascii?Q?JLX/mTuoRdsGwF9H0vdeyVXTJ+9dDCFro/cNLdBWYvW//E3Z2fXJgPx+jh1R?=
 =?us-ascii?Q?1C5jFniT6TPxw74hfsN6i0O12HwoV1UahcNX9dvFmdVgyG7Rjr00/dcQSh5g?=
 =?us-ascii?Q?JUwe52H35lSU6lkqpsf+KQwl7Q1EdxQLEvixmjhiLjyZd32qwOfwGxoGMg1O?=
 =?us-ascii?Q?Vg67EIUGgE9ThCLfXFkFHIGut21C/wZmBdwo/QpofTQv0pDGkN9/sNDNQME9?=
 =?us-ascii?Q?7iHkD64m/OfKxhVRQ36lYYv32sh29WDvsa3CDuMs+AQKV8MNLxgvax7zs4yJ?=
 =?us-ascii?Q?RMiI8jQrVn9EjfUPmobhIx86VXyfYjvjRADZHgrp/nV2RZm6/dGadg94vM7C?=
 =?us-ascii?Q?Rqh7bnZUu0an5ylhvw7RsFhI2Fs2EB/kVuKkSuydk9xJSiBYi5RF7Md82xbN?=
 =?us-ascii?Q?p5Wqy5m8tPEO89qRY1vhbRPEQGGRvpPCiBGmsANyBHXE3XvYPM6o7NaFpcw9?=
 =?us-ascii?Q?2h//c5m+8hKoZ+ogGw1a0LQ7yzY19jLSptmz3xRdEaE94Zr/kbV+q8L1M/wy?=
 =?us-ascii?Q?duMyezEUP07rQxZO66xFyh+y/+WHPteSK3rjmsPvVVbYWCzW3xktIaU1ghU4?=
 =?us-ascii?Q?a/E3eyYfCjk9o3rR0zTqxu+agZqG+zjtNKzrNILsqLfW9C1mdPVeZLF3FzIf?=
 =?us-ascii?Q?rt798Ah/guwwtEzPeyl2zgNG5qqroqiEeWp6af5jthy3iVeBx8nQeSgrju85?=
 =?us-ascii?Q?KAAoP7HJVA9s5A61B/8IqH1v32c/38KOyZZpb/Y6wJ2SBr1SGEMqt0+pNIgq?=
 =?us-ascii?Q?l4VHG/1kkcDrktTMvP9KgLN0Wt+jN2zNBWLucliGx0eVlDBPqWmOnceF/mFl?=
 =?us-ascii?Q?LMnIKTOPuwi3JhvhopUE+u9sl71f8ntSnaxpgrW7llu7VesGYVd+P0kUk9pI?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b64e6b1-6cf6-4a26-790c-08db27491dcf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2023 00:38:39.2101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DImLpfwK7undhMS0sUIOHm+SdBoxe/XNXrcMz75TFXg+JXsxYIkgpLmNBgV55LgTVTUFu1ajRMYI6ldBd0n0bIT+ZkovFmutcOdewQ54Auw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7246
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe/ras: Log the GT hw errors.
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

On Wed, Mar 15, 2023 at 02:47:40PM +0530, Himal Prasad Ghimiray wrote:
> Count the CORRECTABLE and FATAL GT hardware errors as
> signaled by relevant interrupt and respective registers.
> 
> For non relevant interrupts count them as driver interrupt error.
> 
> For platform supporting error vector registers count and report
> the respective vector errors.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

If you're just sending a single patch, there's no point in adding a
cover letter.  But in this case it seems you sent multiple related
patches as independent 1-patch series.  You should combine this and the
SoC/sgunit one into a single series with some explanation.  There's also
more going on in this patch than there really should be...this should
really be split into multiple parts for handling the new interrupt bits,
adding the counting infrastructure stuff, etc.

You've also introduced a new acronym ("ras") with no explanation of what
it means.  And it's not clear from this patch what the point of counting
errors is if you don't do anything with the count yet.  There needs to
be some explanation of what the end goal is (e.g., ideally including
this as part of a series where the counts actually get used by later
patches so that reviewers can see the big picture).  E.g., why are we
logging "driver errors" (basically assertion failures)?  If we screwed
up and didn't have a handler for some bit the hardware is raising in an
interrupt handler, that seems like something we should just fix
directly.

It seems like if you're counting and recording these errors, then that
would also be an opportunity to not be doing log prints from within an
interrupt handler.  I know printing from interrupt handlers has become
less problematic with recent kernel versions, but it still seems like
something that might be better deferred?

> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h    | 105 ++++++++
>  drivers/gpu/drm/xe/xe_device_types.h |   2 +
>  drivers/gpu/drm/xe/xe_gt.c           |  30 +++
>  drivers/gpu/drm/xe/xe_gt.h           |   2 +
>  drivers/gpu/drm/xe/xe_gt_types.h     |  43 ++++
>  drivers/gpu/drm/xe/xe_irq.c          | 346 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci.c          |   3 +
>  7 files changed, 531 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index c1c829c23df1..fb772c8b12f5 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -92,6 +92,10 @@
>  #define   GEN11_GU_MISC_IRQ			(1 << 29)
>  #define   GEN11_DISPLAY_IRQ			(1 << 16)
>  #define   GEN11_GT_DW_IRQ(x)			(1 << (x))
> +#define   GEN12_FATAL_ERROR_IRQ                 REG_BIT(28)
> +#define   GEN12_NON_FATAL_ERROR_IRQ             REG_BIT(27)
> +#define   GEN12_CORRECTABLE_ERROR_IRQ           REG_BIT(26)

It doesn't look like these definitions are ever used.

> +#define   GEN12_ERROR_IRQ(x)                    REG_BIT(26 + (x))
>  
>  #define DG1_MSTR_TILE_INTR			_MMIO(0x190008)
>  #define   DG1_MSTR_IRQ				REG_BIT(31)
> @@ -111,4 +115,105 @@
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
> +#define DEV_PCIEERR_STATUS              _MMIO(0x100180)
> +#define DEV_PCIEERR_TILE_STATUS_MASK    REG_GENMASK(2, 0)
> +#define DEV_PCIEERR_TILE_STATUS(x)      (DEV_PCIEERR_TILE_STATUS_MASK << (x * 4))
> +#define DEV_PCIEERR_IS_FATAL(x)         (REG_BIT(2) << (x * 4))
> +#define _DEV_ERR_STAT_FATAL             0x100174

Several more unused definitions.  Also, none of these registers are in
the right place or format either.  Make sure you're following the
placement and coding style of the rest of these files; we don't want
them turning into the mess we had with i915.

> +#define _DEV_ERR_STAT_NONFATAL          0x100178
> +#define _DEV_ERR_STAT_CORRECTABLE       0x10017c
> +#define DEV_ERR_STAT_REG(x)             _MMIO(_PICK_EVEN((x), \
> +						_DEV_ERR_STAT_CORRECTABLE, \
> +						_DEV_ERR_STAT_NONFATAL))
> +#define  DEV_ERR_STAT_SOC_ERROR         REG_BIT(16)
> +#define  DEV_ERR_STAT_SGUNIT_ERROR      REG_BIT(12)
> +#define  DEV_ERR_STAT_GSC_ERROR         REG_BIT(8)

Unused bit definitions.

> +#define  DEV_ERR_STAT_GT_ERROR          REG_BIT(0)
> +
> +enum gt_vctr_registers {
> +	ERR_STAT_GT_VCTR0 = 0,
> +	ERR_STAT_GT_VCTR1,
> +	ERR_STAT_GT_VCTR2,
> +	ERR_STAT_GT_VCTR3,
> +	ERR_STAT_GT_VCTR4,
> +	ERR_STAT_GT_VCTR5,
> +	ERR_STAT_GT_VCTR6,
> +	ERR_STAT_GT_VCTR7,

Wouldn't it be better to use names here that match what these registers
correspond to?  E.g., subslices, l3banks, etc.

> +};
> +
> +#define ERR_STAT_GT_COR_VCTR_LEN        (4)
> +#define _ERR_STAT_GT_COR_VCTR_0         0x1002a0
> +#define _ERR_STAT_GT_COR_VCTR_1         0x1002a4
> +#define _ERR_STAT_GT_COR_VCTR_2         0x1002a8
> +#define _ERR_STAT_GT_COR_VCTR_3         0x1002ac

#2 and #3 definitions aren't needed.

> +#define ERR_STAT_GT_COR_VCTR_REG(x)     _MMIO(_PICK_EVEN((x), \
> +						_ERR_STAT_GT_COR_VCTR_0, \
> +						_ERR_STAT_GT_COR_VCTR_1))
> +
> +#define ERR_STAT_GT_FATAL_VCTR_LEN      (8)
> +#define _ERR_STAT_GT_FATAL_VCTR_0       0x100260
> +#define _ERR_STAT_GT_FATAL_VCTR_1       0x100264
> +#define _ERR_STAT_GT_FATAL_VCTR_2       0x100268
> +#define _ERR_STAT_GT_FATAL_VCTR_3       0x10026c
> +#define _ERR_STAT_GT_FATAL_VCTR_4       0x100270
> +#define _ERR_STAT_GT_FATAL_VCTR_5       0x100274
> +#define _ERR_STAT_GT_FATAL_VCTR_6       0x100278
> +#define _ERR_STAT_GT_FATAL_VCTR_7       0x10027c
> +#define ERR_STAT_GT_FATAL_VCTR_REG(x)   _MMIO(_PICK_EVEN((x), \
> +					_ERR_STAT_GT_FATAL_VCTR_0, \
> +					_ERR_STAT_GT_FATAL_VCTR_1))
> +
> +#define _ERR_STAT_GT_COR                0x100160
> +#define _ERR_STAT_GT_NONFATAL           0x100164
> +#define _ERR_STAT_GT_FATAL              0x100168
> +#define ERR_STAT_GT_REG(x)              _MMIO(_PICK_EVEN((x), \
> +					_ERR_STAT_GT_COR, \
> +					_ERR_STAT_GT_NONFATAL))
> +
> +#define  EU_GRF_COR_ERR                 (15)
> +#define  EU_IC_COR_ERR                  (14)
> +#define  SLM_COR_ERR                    (13)
> +#define  SAMPLER_COR_ERR                (12)
> +#define  GUC_COR_ERR                    (1)
> +#define  L3_SNG_COR_ERR                 (0)
> +
> +#define PVC_COR_ERR_MASK \
> +		(REG_BIT(GUC_COR_ERR) | \
> +		 REG_BIT(SLM_COR_ERR) | \
> +		 REG_BIT(EU_IC_COR_ERR) | \
> +		 REG_BIT(EU_GRF_COR_ERR))
> +
> +#define EU_GRF_FAT_ERR                  (15)
> +#define EU_IC_FAT_ERR                   (14)
> +#define SLM_FAT_ERR                     (13)
> +#define SAMPLER_FAT_ERR                 (12)
> +#define SQIDI_FAT_ERR                   (9)
> +#define IDI_PAR_FAT_ERR                 (8)
> +#define GUC_FAT_ERR                     (6)
> +#define L3_ECC_CHK_FAT_ERR              (5)
> +#define L3_DOUBLE_FAT_ERR               (4)
> +#define FPU_UNCORR_FAT_ERR              (3)
> +#define ARRAY_BIST_FAT_ERR              (1)
> +
> +#define PVC_FAT_ERR_MASK \
> +		(REG_BIT(FPU_UNCORR_FAT_ERR) | \
> +		 REG_BIT(GUC_FAT_ERR)  | \
> +		 REG_BIT(SLM_FAT_ERR)  | \
> +		 REG_BIT(EU_GRF_FAT_ERR))
> +
> +#define GT_HW_ERROR_MAX_ERR_BITS        16
> +
> +#define _SLM_ECC_ERROR_CNT              0xe7f4
> +#define _SLM_UNCORR_ECC_ERROR_CNT       0xe7c0
> +#define SLM_ECC_ERROR_CNTR(x)           _MMIO((x) == HARDWARE_ERROR_CORRECTABLE ? \
> +						_SLM_ECC_ERROR_CNT : \
> +						_SLM_UNCORR_ECC_ERROR_CNT)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 199bd37fce9a..146bb6445c45 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -97,6 +97,8 @@ struct xe_device {
>  		bool has_range_tlb_invalidation;
>  		/** @enable_display: display enabled */
>  		bool enable_display;
> +		/** @has_gt_error_vectors: whether platform supports ERROR VECTORS */
> +		bool has_gt_error_vectors;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  		struct xe_device_display_info {
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 343370b44506..e943810eeb53 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -42,6 +42,35 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> +static const char *xe_gt_driver_errors_to_str[] = {
> +	[INTEL_GT_DRIVER_ERROR_INTERRUPT] = "INTERRUPT",
> +};
> +
> +void xe_gt_log_driver_error(struct xe_gt *gt,
> +			    const enum xe_gt_driver_errors error,
> +			    const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(xe_gt_driver_errors_to_str) !=
> +		     INTEL_GT_DRIVER_ERROR_COUNT);
> +
> +	BUG_ON(error >= INTEL_GT_DRIVER_ERROR_COUNT);
> +
> +	gt->errors.driver[error]++;
> +
> +	drm_err_ratelimited(&gt_to_xe(gt)->drm, "GT%u [%s] %pV",
> +			    gt->info.id,
> +			    xe_gt_driver_errors_to_str[error],
> +			    &vaf);
> +	va_end(args);
> +}
> +
>  struct xe_gt *xe_find_full_gt(struct xe_gt *gt)
>  {
>  	struct xe_gt *search;
> @@ -576,6 +605,7 @@ int xe_gt_init(struct xe_gt *gt)
>  	int err;
>  	int i;
>  
> +	spin_lock_init(&gt->irq_lock);

What exactly is this lock protecting?

>  	INIT_WORK(&gt->reset.worker, gt_reset_worker);
>  
>  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 5635f2803170..19b9c0e4e62c 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -11,6 +11,8 @@
>  #include "xe_device_types.h"
>  #include "xe_hw_engine.h"
>  
> +#define HAS_GT_ERROR_VECTORS(xe) ((xe)->info.has_gt_error_vectors)
> +
>  #define for_each_hw_engine(hwe__, gt__, id__) \
>  	for ((id__) = 0; (id__) < ARRAY_SIZE((gt__)->hw_engines); (id__)++) \
>  	     for_each_if (((hwe__) = (gt__)->hw_engines + (id__)) && \
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 74b4e6776bf1..d15724792082 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -33,6 +33,42 @@ enum xe_gt_type {
>  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
>  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
>  
> +/* Count of GT Correctable and FATAL HW ERRORS */
> +enum intel_gt_hw_errors {
> +	INTEL_GT_HW_ERROR_COR_SUBSLICE = 0,
> +	INTEL_GT_HW_ERROR_COR_L3BANK,
> +	INTEL_GT_HW_ERROR_COR_L3_SNG,
> +	INTEL_GT_HW_ERROR_COR_GUC,
> +	INTEL_GT_HW_ERROR_COR_SAMPLER,
> +	INTEL_GT_HW_ERROR_COR_SLM,
> +	INTEL_GT_HW_ERROR_COR_EU_IC,
> +	INTEL_GT_HW_ERROR_COR_EU_GRF,
> +	INTEL_GT_HW_ERROR_FAT_SUBSLICE,
> +	INTEL_GT_HW_ERROR_FAT_L3BANK,
> +	INTEL_GT_HW_ERROR_FAT_ARR_BIST,
> +	INTEL_GT_HW_ERROR_FAT_FPU,
> +	INTEL_GT_HW_ERROR_FAT_L3_DOUB,
> +	INTEL_GT_HW_ERROR_FAT_L3_ECC_CHK,
> +	INTEL_GT_HW_ERROR_FAT_GUC,
> +	INTEL_GT_HW_ERROR_FAT_IDI_PAR,
> +	INTEL_GT_HW_ERROR_FAT_SQIDI,
> +	INTEL_GT_HW_ERROR_FAT_SAMPLER,
> +	INTEL_GT_HW_ERROR_FAT_SLM,
> +	INTEL_GT_HW_ERROR_FAT_EU_IC,
> +	INTEL_GT_HW_ERROR_FAT_EU_GRF,
> +	INTEL_GT_HW_ERROR_FAT_TLB,
> +	INTEL_GT_HW_ERROR_FAT_L3_FABRIC,
> +	INTEL_GT_HW_ERROR_COUNT
> +};
> +
> +enum xe_gt_driver_errors {
> +	INTEL_GT_DRIVER_ERROR_INTERRUPT = 0,
> +	INTEL_GT_DRIVER_ERROR_COUNT
> +};
> +
> +void xe_gt_log_driver_error(struct xe_gt *gt,
> +				const enum xe_gt_driver_errors error,
> +				const char *fmt, ...);
>  struct xe_mmio_range {
>  	u32 start;
>  	u32 end;
> @@ -347,6 +383,13 @@ struct xe_gt {
>  	 *    of a steered operation
>  	 */
>  	spinlock_t mcr_lock;
> +	spinlock_t irq_lock;
> +
> +	struct intel_hw_errors {
> +		unsigned long hw[INTEL_GT_HW_ERROR_COUNT];
> +		unsigned long driver[INTEL_GT_DRIVER_ERROR_COUNT];
> +	} errors;
> +
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index ae2f65c00fa6..4a3b3ff99db1 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -344,6 +344,351 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
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
> +#define xe_gt_hw_err(gt, fmt, ...) \
> +	drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "GT%d detected " fmt, \
> +			(gt)->info.id, ##__VA_ARGS__)
> +
> +static void
> +gen12_gt_correctable_hw_error_stats_update(struct xe_gt  *gt,
> +					   unsigned long errstat)
> +{
> +	u32 errbit, cnt;
> +
> +	if (!errstat && HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
> +		return;
> +
> +	for_each_set_bit(errbit, &errstat, GT_HW_ERROR_MAX_ERR_BITS) {
> +		if (gt->xe->info.platform == XE_PVC && !(REG_BIT(errbit) & PVC_COR_ERR_MASK)) {

Why are we doing a platform test here?  If there are unknown bits set,
isn't that an issue on any platform?

> +			xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
> +					       "UNKNOWN CORRECTABLE error\n");
> +			continue;
> +		}
> +
> +	switch (errbit) {

Something is wrong with the indenting here...

> +	case L3_SNG_COR_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_L3_SNG]++;
> +		xe_gt_hw_err(gt, "L3 SINGLE CORRECTABLE error\n");
> +		break;
> +	case GUC_COR_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_GUC]++;
> +		xe_gt_hw_err(gt, "SINGLE BIT GUC SRAM CORRECTABLE error\n");
> +		break;
> +	case SAMPLER_COR_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_SAMPLER]++;
> +		xe_gt_hw_err(gt, "SINGLE BIT SAMPLER CORRECTABLE error\n");
> +		break;
> +	case SLM_COR_ERR:
> +		cnt = xe_mmio_read32(gt, SLM_ECC_ERROR_CNTR(HARDWARE_ERROR_CORRECTABLE).reg);
> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_SLM] = cnt;
> +		xe_gt_hw_err(gt, "%u SINGLE BIT SLM CORRECTABLE error\n", cnt);
> +		break;
> +	case EU_IC_COR_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_EU_IC]++;
> +		xe_gt_hw_err(gt, "SINGLE BIT EU IC CORRECTABLE error\n");
> +		break;
> +	case EU_GRF_COR_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_EU_GRF]++;
> +		xe_gt_hw_err(gt, "SINGLE BIT EU GRF CORRECTABLE error\n");
> +		break;
> +	default:
> +		xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT, "UNKNOWN CORRECTABLE error\n");
> +		break;
> +	}
> +	}
> +}
> +
> +static void gen12_gt_fatal_hw_error_stats_update(struct xe_gt *gt,
> +						 unsigned long errstat)
> +{
> +	u32 errbit, cnt;
> +
> +	if (!errstat && HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
> +		return;
> +
> +	for_each_set_bit(errbit, &errstat, GT_HW_ERROR_MAX_ERR_BITS) {
> +		if (gt->xe->info.platform == XE_PVC && !(REG_BIT(errbit) & PVC_FAT_ERR_MASK)) {
> +			xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
> +					       "UNKNOWN FATAL error\n");
> +			continue;
> +		}
> +
> +	switch (errbit) {
> +	case ARRAY_BIST_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_ARR_BIST]++;
> +		xe_gt_hw_err(gt, "Array BIST FATAL error\n");
> +		break;
> +	case FPU_UNCORR_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_FPU]++;
> +		xe_gt_hw_err(gt, "FPU FATAL error\n");
> +		break;
> +	case L3_DOUBLE_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_L3_DOUB]++;
> +		xe_gt_hw_err(gt, "L3 Double FATAL error\n");
> +		break;
> +	case L3_ECC_CHK_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_L3_ECC_CHK]++;
> +		xe_gt_hw_err(gt, "L3 ECC Checker FATAL error\n");
> +		break;
> +	case GUC_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_GUC]++;
> +		xe_gt_hw_err(gt, "GUC SRAM FATAL error\n");
> +		break;
> +	case IDI_PAR_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_IDI_PAR]++;
> +		xe_gt_hw_err(gt, "IDI PARITY FATAL error\n");
> +		break;
> +	case SQIDI_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SQIDI]++;
> +		xe_gt_hw_err(gt, "SQIDI FATAL error\n");
> +		break;
> +	case SAMPLER_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SAMPLER]++;
> +		xe_gt_hw_err(gt, "SAMPLER FATAL error\n");
> +		break;
> +	case SLM_FAT_ERR:
> +		cnt = xe_mmio_read32(gt, SLM_ECC_ERROR_CNTR(HARDWARE_ERROR_FATAL).reg);
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SLM] = cnt;
> +		xe_gt_hw_err(gt, "%u SLM FATAL error\n", cnt);
> +		break;
> +	case EU_IC_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_EU_IC]++;
> +		xe_gt_hw_err(gt, "EU IC FATAL error\n");
> +		break;
> +	case EU_GRF_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_EU_GRF]++;
> +		xe_gt_hw_err(gt, "EU GRF FATAL error\n");
> +		break;
> +	default:
> +		xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
> +				       "UNKNOWN FATAL error\n");
> +		break;
> +	}
> +	}
> +}
> +
> +static void
> +gen12_gt_hw_error_handler(struct xe_gt *gt,
> +			  const enum hardware_error hw_err)
> +{
> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
> +	unsigned long errstat;
> +
> +	lockdep_assert_held(&gt->irq_lock);
> +
> +	if (!HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
> +		errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
> +		if (unlikely(!errstat)) {
> +			xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
> +					       "ERR_STAT_GT_REG_%s blank!\n", hw_err_str);
> +			return;
> +		}
> +	}
> +
> +	switch (hw_err) {
> +	case HARDWARE_ERROR_CORRECTABLE:
> +		if (HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
> +			bool error = false;
> +			int i;
> +
> +			errstat = 0;
> +			for (i = 0; i < ERR_STAT_GT_COR_VCTR_LEN; i++) {
> +				u32 err_type = ERR_STAT_GT_COR_VCTR_LEN;
> +				unsigned long vctr;
> +				const char *name;
> +
> +				vctr = xe_mmio_read32(gt, ERR_STAT_GT_COR_VCTR_REG(i).reg);
> +				if (!vctr)
> +					continue;
> +
> +				switch (i) {
> +				case ERR_STAT_GT_VCTR0:
> +				case ERR_STAT_GT_VCTR1:
> +					err_type = INTEL_GT_HW_ERROR_COR_SUBSLICE;
> +					gt->errors.hw[err_type] += hweight32(vctr);
> +					name = "SUBSLICE";
> +
> +					/* Avoid second read/write to error status register*/
> +					if (errstat)
> +						break;
> +
> +					errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
> +					xe_gt_hw_err(gt, "ERR_STAT_GT_CORRECTABLE:0x%08lx\n",
> +						     errstat);
> +					gen12_gt_correctable_hw_error_stats_update(gt, errstat);
> +					if (errstat)
> +						xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg,
> +								errstat);
> +					break;
> +
> +				case ERR_STAT_GT_VCTR2:
> +				case ERR_STAT_GT_VCTR3:
> +					err_type = INTEL_GT_HW_ERROR_COR_L3BANK;
> +					gt->errors.hw[err_type] += hweight32(vctr);
> +					name = "L3 BANK";
> +					break;
> +				default:
> +					name = "UNKNOWN";
> +					break;
> +				}
> +				xe_mmio_write32(gt, ERR_STAT_GT_COR_VCTR_REG(i).reg, vctr);
> +				xe_gt_hw_err(gt, "%s CORRECTABLE error, ERR_VECT_GT_CORRECTABLE_%d:0x%08lx\n",
> +					     name, i, vctr);
> +				error = true;
> +			}
> +
> +			if (!error)
> +				xe_gt_hw_err(gt, "UNKNOWN CORRECTABLE error\n");
> +		} else {
> +			gen12_gt_correctable_hw_error_stats_update(gt, errstat);
> +			xe_gt_hw_err(gt, "ERR_STAT_GT_CORRECTABLE:0x%08lx\n", errstat);
> +		}
> +		break;
> +	case HARDWARE_ERROR_NONFATAL:
> +	      /*
> +	       * TODO: The GT Non Fatal Error Status Register
> +	       * only has reserved bitfields defined.
> +	       * Remove once there is something to service.
> +	       */
> +		drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "detected Non-Fatal error\n");
> +		break;
> +	case HARDWARE_ERROR_FATAL:
> +		if (HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
> +			bool error = false;
> +			int i;
> +
> +			errstat = 0;
> +			for (i = 0; i < ERR_STAT_GT_FATAL_VCTR_LEN; i++) {
> +				u32 err_type = ERR_STAT_GT_FATAL_VCTR_LEN;
> +				unsigned long vctr;
> +				const char *name;
> +
> +				vctr = xe_mmio_read32(gt, ERR_STAT_GT_FATAL_VCTR_REG(i).reg);
> +				if (!vctr)
> +					continue;
> +
> +				/* i represents the vector register index */
> +				switch (i) {
> +				case ERR_STAT_GT_VCTR0:
> +				case ERR_STAT_GT_VCTR1:
> +					err_type = INTEL_GT_HW_ERROR_FAT_SUBSLICE;
> +					gt->errors.hw[err_type] += hweight32(vctr);
> +					name = "SUBSLICE";
> +
> +					/*Avoid second read/write to error status register.*/
> +					if (errstat)
> +						break;
> +
> +					errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
> +					xe_gt_hw_err(gt, "ERR_STAT_GT_FATAL:0x%08lx\n", errstat);
> +					gen12_gt_fatal_hw_error_stats_update(gt, errstat);
> +					if (errstat)
> +						xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg,
> +								errstat);
> +					break;
> +
> +				case ERR_STAT_GT_VCTR2:
> +				case ERR_STAT_GT_VCTR3:
> +					err_type = INTEL_GT_HW_ERROR_FAT_L3BANK;
> +					gt->errors.hw[err_type] += hweight32(vctr);
> +					name = "L3 BANK";
> +					break;
> +				case ERR_STAT_GT_VCTR6:
> +					gt->errors.hw[INTEL_GT_HW_ERROR_FAT_TLB] += hweight16(vctr);
> +					name = "TLB";
> +					break;
> +				case ERR_STAT_GT_VCTR7:
> +					gt->errors.hw[INTEL_GT_HW_ERROR_FAT_L3_FABRIC] += hweight8(vctr);
> +					name = "L3 FABRIC";
> +					break;
> +				default:
> +					name = "UNKNOWN";
> +					break;
> +				}
> +				xe_mmio_write32(gt, ERR_STAT_GT_FATAL_VCTR_REG(i).reg, vctr);
> +				xe_gt_hw_err(gt, "%s FATAL error, ERR_VECT_GT_FATAL_%d:0x%08lx\n",
> +					     name, i, vctr);
> +				error = true;
> +			}
> +			if (!error)
> +				xe_gt_hw_err(gt, "UNKNOWN FATAL error\n");
> +		} else {
> +			gen12_gt_fatal_hw_error_stats_update(gt, errstat);
> +			xe_gt_hw_err(gt, "ERR_STAT_GT_FATAL:0x%08lx\n", errstat);
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (!HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
> +		xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat);
> +}
> +
> +static void
> +gen12_hw_error_source_handler(struct xe_gt *gt,
> +			      const enum hardware_error hw_err)
> +{
> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
> +	unsigned long flags;
> +	u32 errsrc;
> +
> +	spin_lock_irqsave(&gt->irq_lock, flags);
> +	errsrc = xe_mmio_read32(gt, DEV_ERR_STAT_REG(hw_err).reg);
> +	if (unlikely(!errsrc)) {
> +		xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
> +				       "DEV_ERR_STAT_REG_%s blank!\n", hw_err_str);
> +		goto out_unlock;
> +	}
> +
> +	if (errsrc & DEV_ERR_STAT_GT_ERROR)
> +		gen12_gt_hw_error_handler(gt, hw_err);
> +
> +	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err).reg, errsrc);
> +
> +out_unlock:
> +	spin_unlock_irqrestore(&gt->irq_lock, flags);
> +}
> +
> +/*
> + * GEN12+ adds three Error bits to the Master Interrupt

"Gen12+" was never a term (even on i915 where we used 'gen'
terminology), so I think you were trying to say "gen12 and beyond" here.
But that statement isn't true; these bits don't exist in TGL/RKL/ADL.
They were added in DG1 and then appear in consistently starting with
Xe_HP.

In general we don't want to be adding "gen" terminology in Xe at this
point.  There are some places where it's been copied over from i915, but
we'll be working on eliminating those; we don't want to add more.


Matt

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
> +gen12_hw_error_irq_handler(struct xe_gt *gt, const u32 master_ctl)
> +{
> +	enum hardware_error hw_err;
> +
> +	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
> +		if (master_ctl & GEN12_ERROR_IRQ(hw_err))
> +			gen12_hw_error_source_handler(gt, hw_err);
> +	}
> +}
> +
>  static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  {
>  	struct xe_device *xe = arg;
> @@ -382,6 +727,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  		if (!xe_gt_is_media_type(gt))
>  			xe_mmio_write32(gt, GEN11_GFX_MSTR_IRQ.reg, master_ctl);
>  		gen11_gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
> +		gen12_hw_error_irq_handler(gt, master_ctl);
>  	}
>  
>  	xe_display_irq_handler(xe, master_ctl);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c4d9fd2e7b2b..f3ff64d12da9 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -72,6 +72,7 @@ struct xe_device_desc {
>  	bool has_4tile;
>  	bool has_range_tlb_invalidation;
>  	bool has_asid;
> +	bool has_gt_error_vectors;
>  };
>  
>  __diag_push();
> @@ -224,6 +225,7 @@ static const struct xe_device_desc pvc_desc = {
>  	.vm_max_level = 4,
>  	.supports_usm = true,
>  	.has_asid = true,
> +	.has_gt_error_vectors = true,
>  };
>  
>  #define MTL_MEDIA_ENGINES \
> @@ -410,6 +412,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	xe->info.vm_max_level = desc->vm_max_level;
>  	xe->info.supports_usm = desc->supports_usm;
>  	xe->info.has_asid = desc->has_asid;
> +	xe->info.has_gt_error_vectors = desc->has_gt_error_vectors;
>  	xe->info.has_flat_ccs = desc->has_flat_ccs;
>  	xe->info.has_4tile = desc->has_4tile;
>  	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
