Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C5AC77B6F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 23:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BC510E102;
	Tue, 11 Apr 2023 23:09:36 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7DF510E102
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 23:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681254573; x=1712790573;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vrT2kuwbzdOZz41oYuunLdF3pRjFUdpasKBpTfxh3ns=;
 b=cpdXZbaZF1A6LqEFQGcQQH92kafx6pkOWdG0CVPHHYAylnM+SfJzRrNJ
 YUCKpNZ/yUQF3IyTMN+LuSLlUjV0ZPJs7Cb8PghG2arcvbcbn8rLeOvfU
 SFV2SXslte/qE6t0r/aFccdwna6hBvjiPsLEEQjy2dv85SF+CP47v724G
 EyNAUfRlUmQ4eu+DOhTqmpS1vIZGD+eOYQHNUPhH3an2C9Wtf3hPsYxAB
 MG8fqAiesxblpfPwcAHVPBElN1WHEK6lbTTRURvJecWfgCvrl4c8cr+sx
 wRO8QAaRmfY0tPo9OcHRoHy6uY9S7sEum1KhHwCiJPtBIVJVVS3qF3rIJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="332449263"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="332449263"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 16:09:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="812760185"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="812760185"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 11 Apr 2023 16:09:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 16:09:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 16:09:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 16:09:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 11 Apr 2023 16:09:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lX7AUzz+EVWimcTu0dzWQ6tMIPi4eVwBR0bxPXWIOb7EtDl9FzF0jULx/MAL58+1v4g4gV+0DAbpO1nXXtCCtXA+XGkb3oIYOnWCXjD9MpAClEWUCPFEPodgQ6oYgcgBETxjAQgaEAr3ECvV7qT6+Ao0haQIWmv5y/kDb5ugT5BoHbg94tZao9tTiDLQH/HNyWJ+mZyjx2xW7JfL7JoUxow5dxccFmAosSMe/SmrQj8mg52A3d0SUtPx4+FZVEG9JsSjY4MJuwdwXoWnwSqOaW/mMOaNyjljzLD7lH2x7wr9s0tO6vWXxFvgu23lCAaFOUdybSyxgmq7ejt0rLifeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cle+zNTVmwI3qSNo8cpmdWE7nfFNYqRZCQhnKUrnKR4=;
 b=b9KRx32QYZxtGkD6rIIFWj917Urb5Ns/DNCmQVUqKXCuuQJaP205q7hum4FhIQylZ7RK/X+/jCZkDEXQYf11ahgASSD266ezm4w3YaAyqeJTRkgrtUknCiMlB1uJK1lJsxtMJNSzK++n+EEyGQeJIsqidyRBijCsPkk5dq4VoFhTVvnQKlr+VoaaBnVyhLWH5SuxxuRlymyl2zWsKsx8c7xK4KdrMDTMlj4tqQw+IP9589SgtxJ1RArQLR0LSPynf+Lxy40UpOy3vJw1ainOQpTW268tBrxv44JSQ2RjxB88QbuHPiDRFXZu7q3EHoKQ5CcBidv3OYuo5oRNYXWXjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB6916.namprd11.prod.outlook.com (2603:10b6:930:58::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.28; Tue, 11 Apr 2023 23:09:30 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6277.036; Tue, 11 Apr 2023
 23:09:30 +0000
Date: Tue, 11 Apr 2023 16:09:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20230411230927.GA4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230411225351.2880126-1-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230411225351.2880126-1-anusha.srivatsa@intel.com>
X-ClientProxiedBy: BYAPR01CA0032.prod.exchangelabs.com (2603:10b6:a02:80::45)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: e80d8b56-344a-442f-0044-08db3ae1cdfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dVbnf13p2RupGGp5c361iJJi06xQVCDeSKP7q6dCtQPtQ54ALBQbakZ4CtL6rqQvHI7js65DtxQ7HYeGRnD/5NYerY28AVVfgmZTwN0gy0Io1IOSdcmuPg8oj/AdwIfBH8T12VvkbPKjqGyRQVTn482clFoUnXAJMD0nviUk5u05hWN6Ih/Itl3cBvzGAoztLksbCmFuxqfGrXFYLHLaY7SglhQP+qjzRuWC/ImfZ8r4nUuI82LVK8J1GqLKFkYQopKyQHjlZZX71sVwiiln3maM2163nV884+H1fCMaI1ew3vOPvMquEi3mqzEJA6Gn7Iw+iq0nNwKz+ppBYgvc5bJHOnxdBT+ComXBFUaxhnVdbKwuPjKxPhD4WRV/kyy752DE1RO/48BX0L9ReHiYvYkI61h7d/kPAiGzX5sH1DsAj1lWlVQPRpSeApxX6TXv4i2IiapTsW/FS5ybVAgvxu8c91Tw+y4zY7tAA9dbIR+eQ/5F0aH64idI55r25LYp6sXPP9luwD9/rNpsU9332lET4yk5m1NhYLQDfOkNLksiU4Qlwso2CIB61cwCfZCQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(5660300002)(8936002)(6862004)(38100700002)(66476007)(66946007)(4326008)(8676002)(82960400001)(66556008)(86362001)(41300700001)(2906002)(6486002)(6506007)(33656002)(26005)(6512007)(6666004)(107886003)(1076003)(186003)(83380400001)(316002)(478600001)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HoqdDVJIXVnSKy64paQLUuqwc9z6jt8nzI2AIdy5Py+Fou2DVxz4AI7t4d03?=
 =?us-ascii?Q?SCVjFYG7Ie6VWK1e9PK+ZwS01RvNQEg2cmLquKDWnKmnZh43rEOyVUdIjabj?=
 =?us-ascii?Q?XUY33VGp8cptetr2MHedoL/dR9aQF07t1AMuqf1EKIitdlhH5PgLsSPAM+2s?=
 =?us-ascii?Q?ura4kp8dLpJzAt8fR3WzmHQFy8Y5jHBxv4WifHxlQyZ1UBoQQlP5KDga2uPg?=
 =?us-ascii?Q?CXNb9x1o5Cy9Fwh4WC9cARcmnRxFHSkGAfC5wYDrRKXd94NvgE7hqXLoN8jS?=
 =?us-ascii?Q?pXjlle54nK01vGjfdc4SCfolVZcxSdCnPeaul8zxALbS9oqIfZVIUUJfDwv+?=
 =?us-ascii?Q?rwxIAxtNlvD4YO5z3Yo3XLW36C7YCStQWdCNcJcS6O52rg/eFBN9BzR9fXV5?=
 =?us-ascii?Q?XVBwzMxf8yIS1S9lb8XWA9K4ulbISEABZhmDSsgjwv/I2TMdOnWmcxTuTHIN?=
 =?us-ascii?Q?2nKGxdi7tBtwQ6y+q1Z1h2O0oHkQJaHVb8pqO5Zlj6IZdNJAnAChOpRPpAzU?=
 =?us-ascii?Q?F4HQoyUPDmqvfo4KkNxanG9ctMt4P/crxJuFIX845q4qpQhrcA1mEvxWNAxn?=
 =?us-ascii?Q?sM8STuNTCHULceMnxkx5jEXHciC/kuJpfTEcE/pRI0ufR78JKSNVD7uvNRzq?=
 =?us-ascii?Q?O299WUT0IiyZWQf/mDL1CpCzRUMdDytgCxvR150idiKlfJsl1bGzunW44egZ?=
 =?us-ascii?Q?TeFfZEEg5mGuSTtYz+i0NYJgijgN/3Sl6am96sp1bjOgQTt+AB9XfviUbH9N?=
 =?us-ascii?Q?MactlXVoOrkTgPliLJKSZeLS4e1irsAAbtRDQ2d0HUrzzhG0yQnzFoUZ9TC7?=
 =?us-ascii?Q?RGzXhJVsbOzSutC3aq0N5+B7W33UxDSyLlJCKs8oMHM1sqWurnWXScOTzYSM?=
 =?us-ascii?Q?z2jnFt8cyYS6SryqUtQzF3qILE9XjoY+laf09l1n9jqLszDNcShIGZAsfuYA?=
 =?us-ascii?Q?gTfmOD9rcf0GWzI++ofboGBWmJSqiGtll957uGJwih3wFJb6LJMtiu2k6PRn?=
 =?us-ascii?Q?PiadDCyXm44P5LHy9pwOXvygbeVv5c7wWqlyMjX6J4Z+lLCOaI0ovfvd0a2I?=
 =?us-ascii?Q?4oCv3i3PblUgm8YEh8rAivQtvh66lT8kCyTSN1FKvmsLlVkUUTrV1oHmHPWC?=
 =?us-ascii?Q?DguZ9RLMX/LBDp7j6WC+mvYkf1brL3fqOXIz3fz70NcvtKKpbo8gddeK9r/Y?=
 =?us-ascii?Q?jPTN5glb/IEBt82weBhArenpSnJ6OlyGcqHbRUJiL00UbmGqjbzi6Cv5A4P/?=
 =?us-ascii?Q?Z6PYFFV1JjXGHMbtKUDm2mI9dsX6FVXzeuFu48iHlQLm5GEIiyI7pGXrpluh?=
 =?us-ascii?Q?KQgyVqUT5aRwdFCiDqMMV1eTKgnz/2CLBGsSI5+Qde8CeuHG134JRcICAhbs?=
 =?us-ascii?Q?NHwg7wKJUbEFUrU43ktKEvFRmZDlDR9Oz5DjyjuRsGflXwhE3G94SJM64U0v?=
 =?us-ascii?Q?nkeyucVeJGatR3SqmfHxwSoo0friJvVDh1ZfYfLC8eEJaw3YBniNF1Pn7e/t?=
 =?us-ascii?Q?BxMFHq8uv1aSn0wU3XPQgi5s3jO9cikXcdqE1eOO9L+WMaZy6QJd4DVTvhKw?=
 =?us-ascii?Q?aF2lOGiAT3D0o4IDQNHm3QQ92yV8IuQUvbwpoYMN1QAHPtg63yckyhvCOHEz?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e80d8b56-344a-442f-0044-08db3ae1cdfd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 23:09:30.3798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mM7HY+ltyc/brNU6lf9AJn0csJDqdTz3DAwT6bFrC5QyEV/WMaX0dgzFC8LRdn2heV/cfz+AMxmtwsiSpl+CfTtfHnaBfe6dpekXhvfxW8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6916
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

On Tue, Apr 11, 2023 at 03:53:51PM -0700, Anusha Srivatsa wrote:
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

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h |  2 +-
>  drivers/gpu/drm/xe/xe_display.c                   | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_pci.c                       |  8 ++++++++
>  3 files changed, 22 insertions(+), 1 deletion(-)
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
> index 5fab5b9fbde0..7af4ca588527 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -488,6 +488,19 @@ void xe_display_info_init(struct xe_device *xe)
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
> +			.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) |                        \
> +				BIT(PIPE_C),
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
