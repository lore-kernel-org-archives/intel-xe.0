Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A94C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 19:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F5610EA8F;
	Wed, 19 Apr 2023 19:35:34 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617FC10EA8F
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 19:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681932933; x=1713468933;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4i/1o7ruvnbPfxEr+RqvAqmAQLMiCSHCwTB/d1G8rqk=;
 b=byJNHsTYpE2x2fRjqp/FtFvT2xLy9crVLaGMXVE6ybfUE6JQdnDhNAC5
 25jKOioGZak/HyPGQ46bwFeQttGO8PKdTfVrnmdf5l5ESXUM+tJAehmHp
 cBZSEhrtl74Y/Ckv4erKGiaHd8xnlztYT6tX9WPaldOt5ODhi4MCswyIX
 /5aHUJtiBdPCO5nhQmlKAvxVNL1ICU1/ffjC6WClMcKM2DlBKeKghgmFX
 YYsxoLUrSMDWgUlD39FIhr0bA9hz4XWzdI6qZGgXX2v5mC7asEhQlBmy5
 Sn00wpb3POJ1HUtMImuhD8XdxJ7hbWAyujjGGYtOYfDjib5LrJlK2X4HB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325154542"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="325154542"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:35:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="865955471"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="865955471"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 19 Apr 2023 12:35:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 12:35:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 12:35:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 12:35:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fX1jecSZVLqI9PiKLJ8kKSAxhlyeyGzlERW2yV179FOZF3O3Mqs+mY3VAkFk8AJbFwbVtDWPLfIqwLTmzGAifQmi7xFfXWFThHKEMTUOYZN+3bqzyGD0kaCvFMDE6/XCfpNg1emaXAoWdXQkGDZiwwHaH1OCu0/WVmWxJlrEMl8qXI0LSjzYVBmIL5ochA4QsPLr75ka8ZxcPzqOvwB5OOOlIZ3zbsnPxAdyuD8BlL2MXRDAlL8pBDXcv8G11ZahQTcyRmWV/V9AtUE4NqRLvCHjFKWwsmOuFvZcn9Ae+3Sg6LyzMHy9arTFa9RO/vlNF1YWJrqtWXGkvxHeoUwZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgSqZWd7C9YEvSJPaTRwHZomdqkrAkiSzGsTtQE4b5w=;
 b=WrFltMdnfrR/BwMsgo+6H+lKdKuitDisxPkaYxVbP7+bxD9cs/TnHsFJKN5+o4cH3jI4V07Gw8bXmCIEq1BeF5PiHNLb6DOfJY82nrTWhc0Ao8CWVZvS4OkrpYtp1Lo3JdQw33rpF1tcZlVZ0qxdSbc3+3vyyyvIMYQtwA0AwNWx7Ex0ctvBKX60aPNf7e5YFnHo1pJyjFsBdZhDAzNJNPt5A+TEQKDTVrDybCWRAoVCGIueBLuNN0oJBV0pn4pSZ4ZDgP+CPdbDREPi6ZrHVbLNSUrO1hKAykMb4LE/YLyHxP7YXAQM26ApLHuFHCVKbTplwdz/xhAu3k6l3BOr3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4685.namprd11.prod.outlook.com (2603:10b6:806:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 19:35:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%5]) with mapi id 15.20.6298.030; Wed, 19 Apr 2023
 19:35:30 +0000
Date: Wed, 19 Apr 2023 15:35:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZEBCfmSMrHVHNdW0@intel.com>
References: <20230419123947.543175-1-jani.nikula@intel.com>
 <20230419123947.543175-4-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230419123947.543175-4-jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::39) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4685:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c61cc9-369c-4e61-4863-08db410d3c5d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ca7yaYOLX73ykTyNSTnHpkIyOEhMfZR5kgKP1AYHc0yuggI37OiZ8vMOgad2I2BM0Lucxdznbt9mTkp9FhMAYhGCEADbh6hxpziIAs+Z4WKQiswaI1CoqLufybQS3HSFpLHP49eZz4KPEFANSIWIOA00RKfa022yxvNhqdTConzMCQqQ/OkZhU2HTMzJgjsf4ul5rZgKu3JbpupsniFraIM22jPwOdbASYj/rR8BckGrgwTkIsDwyADwB9gpGpWJmEmMjSFLGmIRZTazGaEK1xsQN9CtpodabKjXx2YOHuhOMKRrb9bBrdSNNqP4/H+rl6487aybEuusvuaRWTEyXZiW+E2sxxacmVnBigeXQtaKJ7QHMXVcW1kBi+YqxNq9VSdhfeVBxXwL+tNvxbBeU0SHYnMNbxjt+B1d8Tzm9xj+bFU2081rTJYwsZJ7SbksTEEjRgjWS314BXl7g+9R0djmGbJnqj/V5hnp1W0oydCrM0xoZVpaXpvd2UR4nztSp/f4wXf0AXOivK4yuFb6aVWMXGED9Xtrc/uKHy2Ye7xH1SyVB84KmoHxA07KlYu/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199021)(316002)(41300700001)(4326008)(66946007)(66476007)(66556008)(478600001)(82960400001)(44832011)(37006003)(8936002)(6862004)(8676002)(5660300002)(6636002)(38100700002)(6486002)(186003)(2616005)(6666004)(6512007)(26005)(6506007)(86362001)(36756003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yGJp2kLKSUdz4hLLwDavGi9njEEGDFh4t5CXizuMUxZZNTdYFe3Fpih2HeVb?=
 =?us-ascii?Q?jf10VWRkq81z2tRmgXTw9yjEEIIlzUeyNyYOvY9/Nmo7mMDt3qKTyErC8Lq9?=
 =?us-ascii?Q?pF44E3QqBWUJDW5TBSVIAc54yzJn27zM4aL6gb8HQSQEqABdE70A7g3UXQEI?=
 =?us-ascii?Q?aFwhgLjwTOkaVhdNkmvckwjoZTnQTbffszMJ0ie5tTG3tfP1yfpsRxMpoCt3?=
 =?us-ascii?Q?KnpU4cnl5iOFXeLf6o+bSYYqBvERUveIUZLrwr/AGbulH9NmpnzlTVXVQzZJ?=
 =?us-ascii?Q?T9v14rbvT3nSA8g8tTyYwYDSzASFn1WeQfL9ZDs7KLK7nzyolowaxeA2G/MV?=
 =?us-ascii?Q?DnOeJOw87QuKzdMrrCowbAMo+rQGjFkCt9/2aFEm9C76FPncWMeVbpHTrbAs?=
 =?us-ascii?Q?qZOJvLiRrHSGcwyadGLpiVf13ilKWxbgsc9prM5+1xnA/spfLYL29cncIgWv?=
 =?us-ascii?Q?lvUkgZ/vxpyJtuZLTEBvCgFwtUAkj28FxEI2ditV3MHVXHOWgZ9U9N/1LGyK?=
 =?us-ascii?Q?w3Bk8w1TiSmpcs8SOYS1/L/xfqAn5PGilauJVOXVQ7CUMbp86HUrgeT11FcH?=
 =?us-ascii?Q?xoW2JeBUxzXapCu93Xio4X97DIWDoZHKYV35UAFWV6YtG0nmS5i+lJPrPgNc?=
 =?us-ascii?Q?iuc6i6FcYSAzTNwmRUmGzpwXPBIqwK0DAS8cKtKIFKAkXiC5bN6+oUW9qeH+?=
 =?us-ascii?Q?yh8bFW/tLTarywVf8yA40yC47A8x15GN1oR5nEKCjU2FcIXhTUupanK5I1tk?=
 =?us-ascii?Q?ERkeZ1ScAstLAppNZZelt5ukw+JeTXUd3EhlloXPmBx1lFHiLcM1hgoSUS7N?=
 =?us-ascii?Q?0UgxZ5J4zIhK0euSwcIu5SSAu5rr5b9ttAu7NJ3ztAEhSr8jFbSb1C7shK23?=
 =?us-ascii?Q?LZ0LqTlD4H4wkdZsazU9UnXO8GpyWk03pp5/sWAN3Ql9P8ZiB91Ba+HpkT66?=
 =?us-ascii?Q?sxVHPkCCYQre4ca9xP7M5BPMes9O+4XKG7cUkeUIVO3QdZv8ifMGsWv+RvQz?=
 =?us-ascii?Q?J9MsbdXiKT/hWJabs/SdWmTaqRRPMbz4XqfGs1UUfHXporp2KgeuqGRB6rpg?=
 =?us-ascii?Q?HxwP3sjQFLDCmoBgtpj/vp+7Ewg1+hR8pejaNhq2YyhSvd7o0jLUslUgWHXE?=
 =?us-ascii?Q?yyU7Gm2RV5kcVCmPSINCwuCWGIJPWq5nbQDkRN9Af4p9EdZOPHvHLyLfF9oX?=
 =?us-ascii?Q?7clzOD9By30Q+5tvsOteb9Hh1nrY2FgaaFQLFiErvjqIxHKV/Xw4qQ8KvVLa?=
 =?us-ascii?Q?jmdISUL/OOZRezE13sI2l6eOjUfo8OzgLaxXeFLP5RNO+wtLCsxGdsStKjFu?=
 =?us-ascii?Q?wDeVB7h9Vcw0lCNxQoAAWvJkOPOXMrzvFp4QFykU59BgryT5j4rCtUFSDGdo?=
 =?us-ascii?Q?S/lyL1hrInBuceTbskmyG7lu5RC6FmGR05bxfgalE5BhOQ12cnh0adn+s/H9?=
 =?us-ascii?Q?52ZbO41YHWxF0+Vo1dKVoTO5FWp+P5gLe0Dut+e23U5RP/873Iia1wtl7l0s?=
 =?us-ascii?Q?ZI/nhkyOMvPcTuEdYJxz+CvIMiwqhtDEefJjo4DuI95pTZzjnLFEImFu1MC3?=
 =?us-ascii?Q?rDDswe2Q0BpokmMksznXLTTCgFcYJGDzH+zcgQj6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c61cc9-369c-4e61-4863-08db410d3c5d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 19:35:30.8940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuKRrQ+mY6nmHZ/oCspB8+BDw5cx9dlzqeOytOKG0kbHNJUVN+I1ccVxtKe+1ThMiNb4wL4rK460aAr2ZsIO/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4685
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/9] drm/i915/display: add I915 conditional
 build to i9xx_wm.h
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 03:39:41PM +0300, Jani Nikula wrote:
> Add stubs for !I915.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/display/i9xx_wm.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.h b/drivers/gpu/drm/i915/display/i9xx_wm.h
> index b87ae369685a..de0920730ab2 100644
> --- a/drivers/gpu/drm/i915/display/i9xx_wm.h
> +++ b/drivers/gpu/drm/i915/display/i9xx_wm.h
> @@ -12,9 +12,26 @@ struct drm_i915_private;
>  struct intel_crtc_state;
>  struct intel_plane_state;
>  
> +#ifdef I915
>  bool ilk_disable_lp_wm(struct drm_i915_private *i915);
>  void ilk_wm_sanitize(struct drm_i915_private *i915);
>  bool intel_set_memory_cxsr(struct drm_i915_private *i915, bool enable);
>  void i9xx_wm_init(struct drm_i915_private *i915);
> +#else
> +static inline bool ilk_disable_lp_wm(struct drm_i915_private *i915)
> +{
> +	return false;
> +}
> +static inline void ilk_wm_sanitize(struct drm_i915_private *i915)
> +{
> +}
> +static inline bool intel_set_memory_cxsr(struct drm_i915_private *i915, bool enable)
> +{
> +	return false;
> +}
> +static inline void i9xx_wm_init(struct drm_i915_private *i915)
> +{
> +}
> +#endif
>  
>  #endif /* __I9XX_WM_H__ */
> -- 
> 2.39.2
> 
