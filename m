Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB9EE784B9
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 14:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A25310E2CA;
	Mon,  2 Oct 2023 14:41:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C432310E2CA
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 14:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696257686; x=1727793686;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CC0MfMqQQm4oiuQeXvxZy3Ikn+wlsxSzl5hAnucpXVI=;
 b=XCNfdKDX06qLNZ0GPaEwkDwqv43nfFjbI8sFQnmpDpClybbQ4WUsJy6p
 JythKxabVdgFx4hWq5lhh+8NO/DkojoTARuwTa4/KvBNxwWf7ABVYiT4Y
 6/Ef62w8WkXu36Bg63DbEDW0+jablhpGJQPN3yAcc5ScwnKPpE8nKXEmI
 kD0ONj8cZgR7qa9KJc+sWf8BHGPWSwfFnVHhsmU8aHOabGMVKO04chE1T
 WRy+HT1Ahnm6UhSEtr1S2M2oCAvnJ6AHe+V3Z3V/mKWP6q/6arx/MeudM
 alocK94GhlpPGNPBAb+Er9LmvxQ29d+S4X0posbbw8PI8y+4Ylh8UEggE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="446810404"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="446810404"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 07:41:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="1536243"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2023 07:40:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 07:41:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 07:41:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 2 Oct 2023 07:41:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 2 Oct 2023 07:41:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzp8Vy8tG6GqQ0nLrXPR0IW6a+nGKeM5bVB0H/66oszC4N4ipI3nD8fQqVVGhdMBy2vHmpSeulxdSgKvRdOspnrvAsjdzx5VcTSI4QZ3FV8ScDaRg+B7+MhPvWbe+jNBejoynn1XbEIqptxT4DYjePlh2UqZD++Dwx/dWZdbfjmZmWguA8hRxm0PMkL7N6X3DE8VQjyxeKYpQ/B0N3EV6UKzVHMJ/pRtSpqvAk1t5XWFRVEYwEqQLaWL8/B7f7pvLLY4IfZmVuimlAtGnn3YJlupWUtmrMRtVUlfWdzR0DzHTCA+HqNb4QgM7fXFwlqSp6V27gybpHjCoCia8nfP2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RY5YJs3iFtu3GfE1zhTLDTt7YCOFLrZWl3wneumsy2o=;
 b=JvYTHawg+BEETWCI+g6zfyrW/iEDs2NtBqhxXZlBKFdltHOGH23Kt/g6+mGV6s9EigEgYk7YdsD+lh1cr9p2txxQpeRE9667as/owt+2R2gaL1cNNt+flbEVieFtdK+2y+/Wn2GC2g4U2f8eC7eCyaQs2f3Fak3747ki9oEMO7wQG38WgjFaRmcfqMUW5F2W2Lgg4fYc4HaxldGVyUkOXYaMdl7/lOrX6EVzGx/yE69pMIRXhz9Hrpzp+0PKNfZbUG1LC388SGqHwjxdpJfwy6Xy68gBpMajmA+hwR9w5TxUspMCZjF0ZcI/D16fK77ZnfC2NvxYyOgT3gC47hlfkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8020.namprd11.prod.outlook.com (2603:10b6:8:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Mon, 2 Oct
 2023 14:41:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Mon, 2 Oct 2023
 14:41:24 +0000
Date: Mon, 2 Oct 2023 10:41:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZRrWj8NXTI9q0Ibc@intel.com>
References: <20231002092402.1826859-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231002092402.1826859-1-jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 911bb8de-fbd1-4a28-16b8-08dbc355a60a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WQkXJTJJ/9/LK8sGoaNJsFPc/UtiEiPjhA4liNtF5UgwpCcDfBpadVUD8OX6bWtWTJkLnyM8EUxu+jXlcH917wC/1KlBtgVLJ/oI9TszYcfPT+uGY5lJOTgmue+HwihXvxkR76QSs1fxjlcUSziQedPP6iu4NZH1o4HY5h2GIgDmFSQr9AYKZSZkyiZu9UHOr24kIRbbs02zFU6mzPXtEAEfMDskk5z6UyTuVTl+s5HWM6zyf4+XHr/y2TxptOP96/j2J+Fn8o9EuVZpTVIfDZjPhEwXESs2xImD9Q6CupOR30T1o1c8leiKV+dtrKmXq+zhXcPOCVm+1qtnprir1c3NPV8Ea8LkL3UlpNvVSTCS7ye3kAKBVFy7OxaVIa8kUJCdbUSnlLFyFd5ZqfYN5/fjZUot40XNdKZSR5O9qqvVc1Uy2QP2MRGGoBd+ktFqRdZLYADakJY+q1peZ0vzG/6U4AaBU63RaJM0pOdz62LgIkBareAsMm8LJ6Femokvo55AsvcHtIlz4mBrKBh78WWArFOYI8Q2VywYgO8W7FbxlNdUVEFqXYC1iV+kYtzu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(396003)(346002)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(36756003)(26005)(2906002)(478600001)(8936002)(4326008)(8676002)(6512007)(6506007)(6486002)(6666004)(83380400001)(2616005)(6862004)(6636002)(316002)(37006003)(66946007)(44832011)(66476007)(66556008)(5660300002)(38100700002)(86362001)(82960400001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TWJrSW/zbCfzQRyovXz1N6RBZ62ICn3sly0QTKdTvIUmS0kDIUDaOGTgEM4+?=
 =?us-ascii?Q?b/LaaRdrZc8LgoZ8fCjV9AEbrTsjPVHJTH/4i8ECHAkIExYa9gR/SD/PL4D7?=
 =?us-ascii?Q?tIAs5uBi9xGCQs4N3xNPelfekXyGUDWTFgkJsOtk/LFb4FpyW80EeYkh1UhE?=
 =?us-ascii?Q?jnHiBYjJAPIxtFwifnY3J/gJ85+XJjt6tK8NNcHeFS9Y6pgWuv5LAXyFQ9sH?=
 =?us-ascii?Q?vlFDDNFAjIqXD2Dlj7NrKq1bh+84uamZvxQNy30Zy5wPTJpfUyeHPSgMjUhs?=
 =?us-ascii?Q?BOssPXDtCb+vvtVTUnC3Aw4IQDc0z9szhGFtV27ofCMf8mMgoNS0iWo4VlJe?=
 =?us-ascii?Q?Qmyv8eOZr2Otdii7B6AvOGGlFdiX+nbWj4kJdG9LNwB8vS6IZjeFYyY2crtB?=
 =?us-ascii?Q?WEg3U3rtzqvCE0CqWxmG13VhDmfRlfxYNoh/j24CY0iFHphJXYGSJ+St0ehH?=
 =?us-ascii?Q?BrXB+6wAxHnpXlHWXOwafpwwoH+m49QqVgh2ubBgtleDzg6o1rVLQkePrefg?=
 =?us-ascii?Q?QppPqMiVDt3RiGSt1uDGCSO6oz7A1c6oy2uTT4H0CiNwNdMAQLysW+hKKGxe?=
 =?us-ascii?Q?ef2szPjjWgh5yMNoRv1PIUqffBwVVAGDnSDtRpbq3GVG9jHA0JzcEjtDwySo?=
 =?us-ascii?Q?xjb/AkH2zgtMigQpFsdT+rJC7sNIEcNRBAZwHhjuUETXam8k6dNo4ifpjTqm?=
 =?us-ascii?Q?J7sAor629loIAbsO7V00bb/eU7zWqpYxrbUGiuhES/fY29hjyGew/YTDkShH?=
 =?us-ascii?Q?KdFJmI7r20Ap5CPHVwqHPJCZ9OAU0uwLhOr3tUsFZKo84OAgh0aWHM9QyXs4?=
 =?us-ascii?Q?aC1na203Ww0hR502hMrcZ/sxZAseGBtP6CHtsG7Z2Fyn2CnRCjUgkTQ4TqJu?=
 =?us-ascii?Q?QWNYAh7SpQ5hqtbE8GvhgHUwCaDabJ16Z17jqS4zrfgDHZXZUwV/E/wgqzv2?=
 =?us-ascii?Q?+P2RdG2dI6u1a1VeEOm1ms6I3jjzCpDKO0w+kghTgQRm21AfkQGGinWpZLgh?=
 =?us-ascii?Q?cgPkr73UFYuXY43vc3B369Ng9TWTJ130FiGWtM5Xxp5XcxaWLudQJjNT9uPd?=
 =?us-ascii?Q?YD54kHSUnPCx5p5lnxBjI24OLwNKi4/Jltfe7akDND/qAl3RT17YRIc6GkRp?=
 =?us-ascii?Q?eKKSTt0UXsGsndaz2oRMuNIQ+kin57BLKrLq18zTPQF2bi4MvfXqWUJUXnsi?=
 =?us-ascii?Q?+V1CPft7otQR+pecu3zuWzMxanVDziOc950NwJNTzzau994lTuY9Nijh/bHe?=
 =?us-ascii?Q?vBDGzGME6NUKkkfDOE8IEgOpz6eF1fVAWz3yZ1JNut1DMACM/EhD1ak0qfmb?=
 =?us-ascii?Q?UAptPwXzKbOrKJmDk/PXRQ+Kf7zUKLYsOPad1ExxPUholL3rDYHksMjefa+4?=
 =?us-ascii?Q?8bu6akaHCZVrAIN1N7fsyDNVOnA9I0hV227VRdjjvWBCX0TXgzLnqRT3K21M?=
 =?us-ascii?Q?2pB6+e/g58J0ADdZ80OuggbrfhWNDTAzKg5o2Hqdq+O0YIaM8Lq4mcKG5i37?=
 =?us-ascii?Q?rq5RqIRyIu6jCqBrMBggx5ebO4ZZEbldyUQDSBFs5lYz9g7qOl301WoPV12U?=
 =?us-ascii?Q?OVrEGMZ5wNvX3+RUOSmq3o7Q9v0nswSenMw2xhG4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 911bb8de-fbd1-4a28-16b8-08dbc355a60a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 14:41:24.4558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JE1xjWApFyEJQkjP4tyAALqNzpHsryBa+LfDNeLGDw3fuCFRr06/05bsZxi+AOtFkd5ZYMeQ3VzNMCA/TnJxyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8020
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] Revert "drm/i915: define I915 during i915
 driver build"
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

On Mon, Oct 02, 2023 at 12:24:02PM +0300, Jani Nikula wrote:
> This reverts commit 12b98dd1eb4f2ec852dce19a01a76bf43a39bbee.
> 
> We already have commit a4ba1ea69f6b ("drm/i915: define I915 during i915
> driver build") in the baseline. It defines I915 at a slightly different
> place from this, so there was no conflict. This can be dropped.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

good catch. I pushed the revert here and in a next force-push I will
remove the original and this revert.

> ---
>  drivers/gpu/drm/i915/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 911dfb92a8c1..dec78efa452a 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -12,7 +12,7 @@
>  # Note the danger in using -Wall -Wextra is that when CI updates gcc we
>  # will most likely get a sudden build breakage... Hopefully we will fix
>  # new warnings before CI updates!
> -subdir-ccflags-y := -Wall -Wextra -DI915
> +subdir-ccflags-y := -Wall -Wextra
>  subdir-ccflags-y += -Wno-format-security
>  subdir-ccflags-y += -Wno-unused-parameter
>  subdir-ccflags-y += -Wno-type-limits
> -- 
> 2.39.2
> 
