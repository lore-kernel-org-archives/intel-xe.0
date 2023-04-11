Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581E4C76196
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 19:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3499610E05C;
	Tue, 11 Apr 2023 19:33:57 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B1C10E05C
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 19:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681241635; x=1712777635;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WciafazKsrZcpVFsfqV2Pf+mYlFYqs9sIbEBS+Lm2dI=;
 b=MSqyW8YnEIlgMv9SMbwq/TTcS241CzCLwowJiqNOOep6YSUlk+Ye2jGB
 B7Lw/56On7BN2XaOSnhE+ICFh+GcUe0/JbgVxSR7ishXRqRv48uAjrMop
 6BtHEPHj3ENTw5ImXY0jz3WDQI+nMhJfJAouO9x/6Z1dDSomltqE1ZNl8
 e6Mgj35477xI8MZYRMt6pjDwdkUoQ6h1Y1Rtjs1vkTG6rnAUEZZJ1VPDi
 sAWf4sma+GQ1FaDO8WDW36znvd6mrxD3BB861ZSZzSaE4EV7Ogrri1/o8
 pVNgB0YmBdPJ/GOqiZPHMSXaxNxiwk3W2MI+PKY7yudvtc2Dtr37Egbew Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="408856321"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="408856321"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 12:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="757974856"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="757974856"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 11 Apr 2023 12:33:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 12:33:32 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 12:33:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 12:33:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 11 Apr 2023 12:33:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f556SEJYLrTjQTHt/4dpsnR+EG2t1ytwBBn1uGpc1+sBid5TGdGNhbRjDk/ytJ7+LJu3QJFI4Tncj5TOKIBgcz3nw1GX8Ru35sfdghWtVZnHhUePqcsLErgXai2hDp/n5aEC4e6OCCI0NgFgSOKscuJhaDtfz7g+0zCPx4y8WtulRJx8Fz7PRcr+rdg9iMX5SKQfuPQnS7v2Wemzs+lqW+LaMbcNo4hcRoq2WniKwxafSfvzvEWqA9JBfJqVHh+8QQmT2v2SgUS/az6tJpnyfsBZiLlSpioRq+GoV4ZMVQQ5hxe9xWCJHhEFY2BSu5ggzJRbB3hRdKyATLocwh9jWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VfePvf64kVgljeuJH8l+6/hWP6N0nNVWHfhYCH08d0=;
 b=LS8ySesUS4WCkADgOQIJg5302qaDyiq8p0EXBL7kBGQZ+KvFRsU8TX8xc4BNDb08gVXcY/tOyO37QdSPZVbotl0R/MTvVjHcknR9/QOlepR/jUY798HYfhIkjwdVQumX/R98N5qfCqF4A3XIvH92yC4SmXqyJu2IGFwP6Y+2x4m9ETZI9SAsX3Zpg3dDExl6DCKQy97rAxulAa0JM/7LCCn+woHAURa0T4qC3EIHMZ4wcnzj2lCLzMKJ3faFOkwy69gIjtHph/PBuA+a9FmurL+JSgw1PhMVw+KZfCINvtnXaIO675hcSVFwXEPLgZMflNB95QUgYI/UPGKZGY4Jeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH8PR11MB7023.namprd11.prod.outlook.com (2603:10b6:510:221::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Tue, 11 Apr
 2023 19:33:29 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6277.036; Tue, 11 Apr 2023
 19:33:29 +0000
Date: Tue, 11 Apr 2023 12:33:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20230411193326.GZ4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230411192403.2864507-1-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230411192403.2864507-1-anusha.srivatsa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::22) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH8PR11MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: 8032e0bf-9691-45c6-1756-08db3ac3a08f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3b0OGeu1ySdPC0PFm64H9cx+BPCBwk1GVZXDbsNC8Kmv9NF80ZXnjlz2+Bc+XCfMamyCktNQlbhwvk+561pujxC99pNFSmccF4d0iNrp2GnUybBQISu1F7/C3AtF/ticwdVbtEnbmf4iD7Dr5eAJU5JOFvwQz2buapWmGO57fnvQVreVaLhh4F9eXFOHZtXKruxTOQJ9lb4E8jBCm9C2b0AEAa3gfJEuYMar5MxYj0NHwT6ZLQUjmnZe8qPSeQh7rVCk7soJZ32MVHcL3sZLt/RInan7r0WCy0+0NFI3Muci6Vv0a1RBiuwKFBEn3CVzDEtDhW9CjV84IQ+yDbEQjCcta4eFppTggp3WFtCRfLLKvW+8+v9I8uDAoRVVsMlf7298w43QNHbx366btBRee4LEVUdk1d+EqMEpGzvAqv0klJXOpmYf7unnslakwIa/8KMqnICxiAOczSdkVCFyLsn70bch1GLAZOdLMlOrF8Gbip2fi7abAH4DUiC1ZxYeHZ8zLIzmJLcJadZH2j5xLNliBO0+tIcdefJ+MAhTpII0t9HzGBe59ZrWWz8uSBh/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199021)(6486002)(6636002)(4326008)(478600001)(66556008)(66946007)(66476007)(8676002)(41300700001)(316002)(83380400001)(33656002)(86362001)(26005)(6512007)(1076003)(107886003)(6666004)(6506007)(8936002)(5660300002)(6862004)(82960400001)(2906002)(186003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CcptjH68zAHvXlvucujr+ZJane0Bzt9lskoKY4+jyn/RSAbHbVGaKNu8+4kp?=
 =?us-ascii?Q?/qiHgV047X80Pyqa/qnje4se+GKYAKOOhCcfJaRCBf3EeUKKEgEi04QcaHdR?=
 =?us-ascii?Q?M7jZT/p3hHzqrr8CkH9z+PkmU/1jHn93XaYwLjPqYjyQQRLg1GhMnhvM4lfI?=
 =?us-ascii?Q?BT4qDmPG8Dt+yN5ncSpBvNWVFDa7pPoraUH2VeBsQ+teIwzmtKpxDQTkZwh0?=
 =?us-ascii?Q?5ndJ0AW7zYDEMAubjbUOzx+AqnQJENe+tzr45HnrvF+lI8/t8aoSaBS/VZh/?=
 =?us-ascii?Q?EWUNvK1c3hvtOAOT89w2eOuFASGMJKqFhMcgBV/rQvoGDYcjtJPKV6HpGvTD?=
 =?us-ascii?Q?jVT3KmAr1BJfBstfSFRQz2H1KGz7Iz3thsXZuleK8gyBRC9hzI/FNDPgEM4X?=
 =?us-ascii?Q?OmohJiFvYR0Cfzg+Lj4VxkevIXoR48F5kWZJ7FH1AvB+l8OopL3fAShHzQoM?=
 =?us-ascii?Q?KGZkr4tPenKUiwKX23iNprYu5RPUCTF4f9zKHUM0ythnzvhZYglIF2uiiyy0?=
 =?us-ascii?Q?I+2CgH5pk1X55RDV9q+X1loZv/FOp+rRUt5+wjd031AHFtndEq+YBeXwJt2D?=
 =?us-ascii?Q?u9B3q4ENAheINcsONPZugxAOzWYzBMJLw3R7BCl90PWmsgtGGGzHi4sqmCx5?=
 =?us-ascii?Q?S53hto2LVcO420gtUyIpeVbhmAqR5rpzfxiEXGPfHr00ClelXMwx5fY8TdJj?=
 =?us-ascii?Q?N368dfZROb1dRJouiDy0zhJaGricOErnI7skuHW6tGPEDoJKL+eM4DR8Tk9I?=
 =?us-ascii?Q?ZredLfvlQNP6vGutGGkS6xBTTTDGj2OgCilKEQxzJ5RnV+vngxkYXQZdvzoI?=
 =?us-ascii?Q?/SjX3nCv96yIVxxi7MFqr/I6hSOW1sOi1zOyIxTJRO//68uJ6uM6OXV//2x4?=
 =?us-ascii?Q?lqd65j6j/hM+xjFsm8l5qSvl3Vy6QyuloRpscJv5QZM9HI/qcXaV+C0FHrZX?=
 =?us-ascii?Q?YjVX8+OiomTzIccZlnMCxscAjtB+Z/9OKaQ7RTnzF6WVNwJmwyIWVeICWkZw?=
 =?us-ascii?Q?8E3bJdKRNupWyRdkOqn8C6CLThQMnx5LoSXjgBXwVneHZU6JS3fTxcVO4y2p?=
 =?us-ascii?Q?9ifq8MrG49rK1O5GdrDHVh6MvAwW7GZrOJB02AOC90tdycG5tFt9XyN8/K1m?=
 =?us-ascii?Q?pM8G06+qTLKEOKhoNtuOLT9XpR7JQC5gysfuhhenkkD4aPRI2zAGhR6QFzKw?=
 =?us-ascii?Q?hGlWb/VZOj1LXFy0Fhlyqk5XXqjUEGVGonLq75c6hoj95yAo7DSTYPQx42Un?=
 =?us-ascii?Q?BTffMoLiNEG0899ShWEV43OHvpXo8YtSDRkVfVjkc0Vmi/ZY04eJPAGgs1xs?=
 =?us-ascii?Q?s6A+kF5Mgy2DZfmfCOtY74eqoH3GlNPlko0WXnnrRYCD/VVlI/++tZypsLPf?=
 =?us-ascii?Q?Vd/8LJYst6eceWKZnTcw0cODuL3OliThG8s029+jm2lkZ5vbb48gd1s+avVM?=
 =?us-ascii?Q?vY93SVn/eqtrZmkamVhoJtI6md3lvitSK1L7m3PM+dnhVnYjtommflSHaSMG?=
 =?us-ascii?Q?dTU2ZI1fMEqxqzMBydaYAqlpWkg1ZZW8ql1aoFy4AYLPiOTWietvspMd2IeT?=
 =?us-ascii?Q?2P9MgYe+t6xAitjDgS6UiDZ6x0JPQpe5lS3L1UX953KELlWARNplZxviwIJK?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8032e0bf-9691-45c6-1756-08db3ac3a08f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:33:29.1464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LHmWztqNTm85jlUTVK0ZEq+poabdvTMkjdf8s8iVX3coj+MOrf675LryT8+GuOBFhUuuwMsV6ynbRrhTGcHp95clGXzG4hR6xLJO0oqzEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7023
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add Rocketlake device info
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 12:24:03PM -0700, Anusha Srivatsa wrote:
> Add missing device info for Rocketlake.
> While at it, also set the value for IS_ROCKETLAKE
> macro which is right now set to 0.
> 
> v2: Also add abox_mask to the device info(Lucas)
> v3: rebase
> v4: Set IS_ROCKETLAKE (Anusha)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>(v2)
> Tested-by: Anushas Srivatsa <anusha.srivatsa@intel.com>
> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h |  2 +-
>  drivers/gpu/drm/xe/xe_display.c                   | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_pci.c                       |  8 ++++++++
>  3 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> index ae25bb02896a..3de1b0c8e23e 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> @@ -70,7 +70,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
>  #define IS_ICELAKE(dev_priv)	(dev_priv && 0)
>  #define IS_JSL_EHL(dev_priv)	(dev_priv && 0)
>  #define IS_TIGERLAKE(dev_priv)	IS_PLATFORM(dev_priv, XE_TIGERLAKE)
> -#define IS_ROCKETLAKE(dev_priv)	(dev_priv && 0)
> +#define IS_ROCKETLAKE(dev_priv)	IS_PLATFORM(dev_priv, XE_ROCKETLAKE)
>  #define IS_DG1(dev_priv)        IS_PLATFORM(dev_priv, XE_DG1)
>  #define IS_ALDERLAKE_S(dev_priv) IS_PLATFORM(dev_priv, XE_ALDERLAKE_S)
>  #define IS_ALDERLAKE_P(dev_priv) IS_PLATFORM(dev_priv, XE_ALDERLAKE_P)
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index 5fab5b9fbde0..44697c0f7fb5 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -488,6 +488,17 @@ void xe_display_info_init(struct xe_device *xe)
>  	case XE_DG1:
>  		xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
>  		break;
> +	case XE_ROCKETLAKE:
> +		xe->info.display = (struct xe_device_display_info) {
> +			GEN12_DISPLAY,
> +			.abox_mask = BIT(0),
> +			.has_hti = 1,
> +			.has_psr_hw_tracking = 0,
> +			.cpu_transcoder_mask =
> +				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
> +				BIT(TRANSCODER_C),

Do we need pipe_mask set here too?  RKL only has three pipes, so
inheriting the value from GEN12_DISPLAY -> __DISPLAY_DEFAULTS won't be
correct.


Matt

> +		};
> +		break;
>  	case XE_ALDERLAKE_S:
>  		xe->info.display = (struct xe_device_display_info) {
>  			GEN12_DISPLAY,
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 4b01d8c538ae..c92faffc838c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -181,6 +181,13 @@ static const struct xe_device_desc tgl_desc = {
>  	.require_force_probe = true,
>  };
>  
> +static const struct xe_device_desc rkl_desc = {
> +	.graphics = &graphics_xelp,
> +	.media = &media_xem,
> +	PLATFORM(XE_ROCKETLAKE),
> +	.require_force_probe = true,
> +};
> +
>  static const struct xe_device_desc adl_s_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
> @@ -305,6 +312,7 @@ static struct gmdid_map media_ip_map[] = {
>   */
>  static const struct pci_device_id pciidlist[] = {
>  	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
> +	XE_RKL_IDS(INTEL_VGA_DEVICE, &rkl_desc),
>  	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
>  	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
>  	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
