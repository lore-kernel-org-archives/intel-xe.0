Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6D0EB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 14:11:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29EC10E07A;
	Fri, 14 Jul 2023 14:11:28 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BCB10E07A
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 14:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689343887; x=1720879887;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WQiHLUCBSk0CFCs5l19FHlora3MObtzY0qJLTpKpIQs=;
 b=PNDevAS9v79jILkg4PLwHVS9Xzl8rxgtfZYtiK1j1VXuMIi7+SzdRtSC
 KQswP3HtNldRqOTMC6GXdLDpINtyWB2bFhVH6ILiMwRNotzS+Rga1td2/
 tKEoA6wmok5a+SzVq6otjMoWmzRVIsx9jtJqpQdApuNJU5BJEHeZqJcCm
 aq4bT1HndCYzqF2I1w2wOAXHRGhKBroe4UHLUL8EiLUwWm/Rhy2WJvZlw
 28CvMMFSWYZbKP+0q5w5DpT6M35jmm0NdskwqPCPAUbHnxW6XnRpP8e5q
 fFhPTG7/CfQ1XeLTCDVfVoYT4x2deX88AtIr/XVYe5SA7E18MxnqplkMJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="364355005"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="364355005"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 07:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="752049634"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="752049634"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2023 07:11:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 07:11:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 07:11:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 07:11:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9UOQuec1KNY+1Mkb/kSDrzH6RRawtiFwJ0QVrgFkSMuUJNm9lzIM26/jYqybsX63wvjii54sBwvqp8duve2ScKUKU/X8gL0d2sVj8WWeWUne0Vn+bdQU5fmgqW1xlPXvlbwngEL5yiHoarwTXrqK1nT+m4CbSkp8/i1mO6SLWvSJf+6aIbFYzC1rEGAyTgw4yNB1KVhNY1NmoacbzJfrrJw68U4y49F8PLAFWvfae+MsuC6h0LPmH5HkRhHN5FbMR+4mFMajgPZeDd0WCdxcKLysejml3O/kEoo0MISQJaXui3VEODPfrdQNPeHlprlhYxlhJovG5yMoxCGx1IbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1i15ybjIbGHcCd6fc5hdmV9RRNUNOKy7JH9tMoZ2mE=;
 b=my6vlRadhp3P8tyJ5Fr8TfUwo6Rtx5FYEKTC6fQf8ti8g67Mz87ceM2aF/mn3RHKAnbK2pKYmss43zhh/EYhVkNuO2z9m9RGiiXbt4hC+vvzcR4PKd3hVYedKzhiPO7/TLkSzXGJQAO6MMIQelcdL7QUU3txx7MalTmj3naF760XwgVwsL1wq3oSaX2ly/z8M0dSthXPFmD4kzqlZV+KkPv9wGOk21zOhWVs5CbZhVBNPVIX4tIEYg0r1DEnGnlMO3afDCbStawWvZLKE+ZUjJgteNecbHhzZPsb9Hh3yiyBMXXUiDFB05WzN8mwJzGsJTLI6NtIEkzny77PLUoy7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 14 Jul
 2023 14:11:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 14:11:23 +0000
Date: Fri, 14 Jul 2023 14:10:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZLFXWdDsM6vpPg8D@DUT025-TGLU>
References: <20230713150611.7-1-francois.dugast@intel.com>
 <20230713150611.7-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230713150611.7-3-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:a03:100::39) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: d7302c29-a779-42ad-2aa0-08db84743415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DH5an5SsQqUHnUk+Tj2KiDOzCBudWhuzuy8fwP0p6I5NNW3849ioeFWgOgtAM7zbz+Lbc1Cwt+/7EuIEKDtKwUMQbdPh0FbbhbVhRjaMC3ZecYpbvxpiWzC8/4algK1mLwQJ5SMZVlsZSSuUXViEfBmRQkzWWrAwZ888SOpzACnPkeeIRHUNTYRRam3HoMjT6bQJ0j8t4o3xL7BiDq8fB73s7aZRTnmveUv+bmdIKFviLsUgEi8fUmYL3wgv+kzDYc0f0ZiOfUllYy/lB4Uo/pMYW8OYcwbcuI3RQ4mCw3Zlqz8PUCjssiaiWgIzZv484jp5x/Pl0mc3olQh+DzI/wQwxnJaNECAihqeDhLLy0v4woWLomUjmSusbWSIu+zt5ip4PCgVA543c2R1sz2HDum282oxlsaP7zwyHud2jZAnaqoc9i80wS7SNJYq8n5vx62nKTVYv+CDZAsD8NZr1UZ8cUvrwRiq97VtpRmImGOf3u/CH8ks4PKRxk239oj27BDyoAiJ7QqgcHWTNK1/CTuGAt59XBds1/yMDwoccJpRcQN018guVXx3m1IU8t3H
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(366004)(346002)(376002)(396003)(136003)(451199021)(478600001)(6666004)(6486002)(86362001)(83380400001)(33716001)(2906002)(66946007)(66556008)(66476007)(9686003)(6506007)(26005)(6512007)(186003)(316002)(4326008)(82960400001)(38100700002)(5660300002)(44832011)(6636002)(41300700001)(8676002)(6862004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?llFvL9EDtmUGUJHDCTmtVKp1Pm0P/UWAbrh2JeegRutsStEtedJwfONrGYGO?=
 =?us-ascii?Q?Vo7iVCJJSor2ZYnTi5V+HDrixVcMNiV+yA1dhcujva4u8RpI+rFzWDbnez8+?=
 =?us-ascii?Q?k9/JKQJAncz8Mo8d8ESXfDlzRZZrXMQ212hWIZ8HZGeaQ6dZ+jO+PeLG36kk?=
 =?us-ascii?Q?cS/FiEB1c0inRxjKGX6Z31OTN8TI6xN+tbAY6+7HUVD9Bp29TQP3OoRotfLP?=
 =?us-ascii?Q?CKfQzhYX22SokRKDsmf7TbjP1JiXPCszuhAcUr9lY8utwC19aKxFw0DOKmC3?=
 =?us-ascii?Q?U7iGtZDjcWEOln3vZ0QK30OYE32zIRl57K5GxVxVpjyQZkZWg+rMfT3dnJtG?=
 =?us-ascii?Q?eFbDBN+eW+hQMwnMzk3mT50cEu6YOOcorV6bvlIfF7QKDV1ek5yKBboDc3tV?=
 =?us-ascii?Q?FNvJoU05ZjG1Zf3a4TY8w2HqgDDqNi6LOOxgbA2Pj9uBoP1QwGRJv7wcxzkE?=
 =?us-ascii?Q?rK1vGQjKYA87hm8fu9JvS0R7wwrnDzB6aRt+2edP1aDiJPzLrqMKCVaLWkby?=
 =?us-ascii?Q?bWsFClmDx0JD9bq+g7j2R4utfeyhL921S71FunF+ESnMqWcYC6YRSugjk7Fd?=
 =?us-ascii?Q?T1tvnD7LL7Xx9E2x4DHK4bD0sXDbH08BggVz1Y3oSvKFrJyFIoUUia6umtLv?=
 =?us-ascii?Q?+JtKLWsTzrY6KcpAFeIQg4YtCVv7TP2k/ImA0rgOu8MYwBBlYWrSVAA89daj?=
 =?us-ascii?Q?o+mbAw2uR3vEyCD6KMvOx49RnimkMKFk1FAX4GDm2PApjaXagXa+f6qY4cO+?=
 =?us-ascii?Q?jTyBSBimhUgZ+/qjLqu+hDxf7vS7hfp8paPEIMAWte2L/xahgNXHN3p7zkws?=
 =?us-ascii?Q?sMYwHTfpV6w6NfXv/4gN9y1DS+YOqqPVdwyHZYsbyECURDNKHUHjJG30zMC+?=
 =?us-ascii?Q?esmUEoCe6gC3G1YygehJw5IkwlNrZPzZUY/WdwbkLimltqIoyTjn+gUeV61+?=
 =?us-ascii?Q?Zecd0ya+CZr8eyMdoqYAOVCBe+f2q+VgLgK+tjlwic+xo9Hn1vIogcZ+uyNk?=
 =?us-ascii?Q?y6EWcrgUIhrGPg07+HC0p/8sBvTRaXoP+HA6yDdoF8pqXXDnfbcjKlCsDirX?=
 =?us-ascii?Q?1aYMngEnDTJigBJf4l2/R4gcKPP7Z2Hn8qWHJcv8BWBfIEWknsmgHMcoFhJ4?=
 =?us-ascii?Q?bE1EioZnLhANBgS1SRGYTETAoqO5wknEYJ4XwdUWhnCh6EWZe5fPglkgwmO0?=
 =?us-ascii?Q?kEYGqnSE02e7EzLlSVVj4FeNOuHbMwClZT2W+Y6/jQWMa8XbXMAXXHJIpzeX?=
 =?us-ascii?Q?9VuOoI+zqAqhoY22V5nx8g3K4PRd/qhqump74+098N2B6j1tzqjN15WX++M5?=
 =?us-ascii?Q?2gYQO6prWcyjzfW4MtA5+JzSA0GLXih3t7fO8l/GHrmoaTZuchZzpzB3XC1q?=
 =?us-ascii?Q?+LeVsYioixiilrltXau4+lr/WwUmQXx+gbqdrrXIymcUC4mxyijuOhkmh/9P?=
 =?us-ascii?Q?Y+BcAw6/v4R0PWHxFOakLUT7axLMrekLW4ec3mxceU9mKjC4PWJe+Ehs1p5a?=
 =?us-ascii?Q?V90o/WHbCsgXy82pHpKDccq9r3xU7gnd34BMVThE3rvqlIMxMIoIOZEe4i/J?=
 =?us-ascii?Q?XPn95ZzAzjOZI5xWkn/T9t6xkw5zdH6TCYf0tjhKsfREK0dw+606jkHOlxxK?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7302c29-a779-42ad-2aa0-08db84743415
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:11:22.9542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onZUQrMhcqvs6P58o8x2+iGlrdRhCXKLkeSo978ms8pr8ZjhMTWJ4uRpWCFP4hFGGMgEr79Xf9rmB8Eod0D9Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8039
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/7] drm/xe: Cleanup OPEN_BRACE style issues
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

On Thu, Jul 13, 2023 at 03:06:06PM +0000, Francois Dugast wrote:
> Remove almost all existing style issues of type OPEN_BRACE reported
> by checkpatch.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/display/ext/intel_device_info.c | 11 ++++++++---
>  drivers/gpu/drm/xe/xe_gt_mcr.c                     |  3 ++-
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
> index 29f3909e018a..9e9ccdef81f1 100644
> --- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
> +++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
> @@ -49,9 +49,14 @@ void intel_dvo_init(struct drm_i915_private *i915) {}
>  int intel_tv_init(struct drm_i915_private *i915) { return 0; }
>  int assert_dsi_pll_enabled(struct drm_i915_private *i915) { return 0; }
>  bool intel_sdvo_init(struct drm_i915_private *dev_priv,
> -		     i915_reg_t sdvo_reg, enum port port) { return false; }
> +		     i915_reg_t sdvo_reg, enum port port)
> +
> +{
> +	return false;
> +}
>  void g4x_hdmi_init(struct drm_i915_private *dev_priv,
> -		   i915_reg_t hdmi_reg, enum port port) {}
> +		   i915_reg_t hdmi_reg, enum port port)
> +{}
>  int g4x_hdmi_connector_atomic_check(struct drm_connector *connector,
> -                                    struct drm_atomic_state *state)
> +				    struct drm_atomic_state *state)
>  { return -ENODEV; }
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 3db550c85e32..ff4075387564 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -429,7 +429,8 @@ static void mcr_lock(struct xe_gt *gt)
>  	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
>  }
>  
> -static void mcr_unlock(struct xe_gt *gt) {
> +static void mcr_unlock(struct xe_gt *gt)
> +{
>  	/* Release hardware semaphore */
>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
>  		xe_mmio_write32(gt, STEER_SEMAPHORE, 0x1);
> -- 
> 2.34.1
> 
