Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434BBC7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 23:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F7710E558;
	Tue, 23 May 2023 23:51:21 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB9B10E558
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 23:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684885878; x=1716421878;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=25yzewbQ1GXFDfkKmtpl3jexgk+yv4N15AUvEF32UEY=;
 b=NSsSmxWwt6K7fILlEe1K0TRd+Y188TKMdotte84hVu38H6fIGdE1+lZa
 yRL9SLH5l/34gY16bVorvQptvweD7LTzciwcA8PKLCqlmegQbGCzPMidP
 4YWSEwQFv5wo7FMPEXeui7aR8l36IJXOKHuL7RMA5WEr5AS13tvUCVa83
 FjF7R63J90S/vXqPz8VY/jmih8PVAdghYfhLGlHbdDxPa0T7usDumEaEt
 /GwWMg0jWeLfMRSG9ilElC/tsOHMifP+SRXB/aTieVW+ASpLLEIxnHEFn
 kyfKn9HinM4Lx7+yWmXbOw+oUQjyLOErjvaDrz7Mw96sSo4RIRZT+TRII w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="356621793"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; d="scan'208";a="356621793"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 16:51:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="793908166"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; d="scan'208";a="793908166"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 23 May 2023 16:51:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 16:51:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 23 May 2023 16:51:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 23 May 2023 16:51:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcsly0V+3vfsbn0jblksDi33HL1FejQq5ANjRTDUoYQ3mtZz5PVbrhZNDmBTHN6WSpFPQJTZkpqAuwij/GCJ2Dy2gj322IryVrH5zAXDeSGBlbpMSa5gKuw/kX0pvUmxoaSQlgjBMosQSy0bBFRvixriL9eczf9TV4P6k2DQD+bcGxODHX0ixuEPjR6IBWe2zwYa7y9Vq4GYMS3e0q6Zta6jQKca26zK4ylEgfHeaM5NADukepaBWDUnmLzBgp2zM2bv4fI5ZVfS+mwX0jTL0JoRmfEC5BQYFKD/nYo20lhJlvgyr95psyqgsi956i/lO6HKQdMjbT028GwK2+kwbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yzA1gfmk3+p4Osa50+llHefmiJQztV+3vlfxbfHKlo=;
 b=arojnGpbXzmIu+kQVY8jvtjlbI4AKQ9WVDFf+XeM1ZRbh2tYKUJxPq5i9hi0aQ7octLTfIctfYTyPmK49xlDp/HTqejAx5SmNoXwHi2H7fPFJmnsRJkTm7WTKjYZEt8yUJWtJpqI8Ntz5fWazw6rzPfAIzZFZgOV3/suDn7Mir+5JjeeslWhfS86E7dsvbJheiLFsF3u0HKllnBiHfayV8KnN3hPH8M1lQFzvZBNefSLBqtrixjU5bofB5iGTwbfoKSYrnjZt7THBlOLcEvMmTDuJ2vLOqqVtOp4LTLEheneLyHc6XVFhsyYSwoQQCMyX5o3g8buS9jUYzsrGPNYxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6426.namprd11.prod.outlook.com (2603:10b6:510:1f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 23:51:14 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 23:51:14 +0000
Date: Tue, 23 May 2023 16:51:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20230523235109.GL10045@mdroper-desk1.amr.corp.intel.com>
References: <20230522193541.2537418-1-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230522193541.2537418-1-anusha.srivatsa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0196.namprd05.prod.outlook.com
 (2603:10b6:a03:330::21) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: f2976511-bf52-4ee6-6d35-08db5be8972b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8GzrzjVl+OgiP2efFkIzKCrZNvGgpxoeQrtLP/HDO0csnSE0YmmIlWXKpTtbtEe0Yj2MLxPw7CYZIqDobC0dLbnzfF8xO9w7LXo9Bdgcf7H6Tcg5d5URyQ4ILZQ+ZbiwFIrmQnUlNAoLdPBN8QBXdvXGYyAg8QNFVMBmRz0eu/KivTCzCzXvYmg6A+mu1Z9KqGpumeKVhQepZQc5KoGukGDLfZXdrzK/PdiqOl5ahTN3xUEWeRdbHB9ZPfcjoCmeRD7Lgv+BzFsoPjt1bv1SDYtjEQEqQArjBIC16fl8EGm4A3zH2R0nnSRVLGCEAVFTUU2d6rsNNXFMbj0P693ckkNnLhT194PkcT6y0MBHQI84EbujGuOetaj3WzEoH1K40n9ZinDJgLE23WvxIzmNEhc+ozBHZy9t3ERDOghzr6z2g4SsqnMz5INOT3/ESake8ehYHtR3JEPOpwXU3XRhtutb1IGJIykZigOQTiB5sfRGFA9XGpVOBfqvUu0N0zWUHvEZH/J/JyN8Dy20wTzJspviaAO4qSbrcYyU3nPH9YNQx4ZoQqIwWqb7YwtCEgCk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199021)(38100700002)(478600001)(82960400001)(6636002)(4326008)(66946007)(66476007)(6666004)(66556008)(6486002)(316002)(41300700001)(86362001)(6862004)(8936002)(8676002)(5660300002)(33656002)(186003)(26005)(6506007)(6512007)(2906002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4KIJ0k/Ay7FQ/K2I0Op88pyZta8/wc8AFQE9kDJXpvRK61CGQycrROz831QI?=
 =?us-ascii?Q?Ql4E9CbImzPapCd5bVyoNAZZIGWXVMrIbwIhPAXHMjPGexZClZ1gVg74EDaE?=
 =?us-ascii?Q?UOaqnpRQlqubdb9he8PfUqCHxGwOkA4dfu5A/9ngYU2i3Bf2/vFgDSwY7EGx?=
 =?us-ascii?Q?i1Tgo3EPVGSSoo29x3KHOkgYyO52VcNNQfH7cUm96NlY3g0Ll68IBtPlrGX2?=
 =?us-ascii?Q?FfWb8nRnPcf+/kqVBjDdFr1s3/5/CvbYbM++i56TjVofi1XKWAnepCpUro0/?=
 =?us-ascii?Q?3j6dE036Ww+dhNKn3DaluG95lv8/LuWi7jPmFtEj+5fA6pwIBUPYF/ZfAr70?=
 =?us-ascii?Q?QHRlzn4RVkWbTB5MFoPJaOsEimKd6sFaNKyYXy5fHKjuYV5Quh/2vBOjL7Gj?=
 =?us-ascii?Q?A6JfBJLFtUMwiYWLy55FiJuKOHltluaum9PgyXbV+3n0qUeiJ/6qydIzMVVy?=
 =?us-ascii?Q?HHg/7rYn/DfJkkLgExVlvDxl4ppx7PMtqaOtnlGXBII0MwE7PtCGSpwGte42?=
 =?us-ascii?Q?x4gad5RQn8OSCPgTQMv8szAd3C0vDUL/2kJTl6mOzJyRaw029iaFqwh8OExl?=
 =?us-ascii?Q?PdPCBJXjPO8kkpi1Mq1UxUEQEnke730gwL8BcAzoZd0zk/znw6U6xEzELdy1?=
 =?us-ascii?Q?K14kJ4ZEufuMHSONS7ARfIxljEL+A9TTU/fY5MPxm+9BHg19Lga5raanXCPD?=
 =?us-ascii?Q?79DjjcZLl5antKAMaZlvQpUnbJf0IQ74/HiwWsb/c5IlQg2lkhiZuYWvlYUi?=
 =?us-ascii?Q?ZLzmnHUS3CNDouwiD2xt+YsjgQvlnaz2ZeLzZBGWPS2IFRz5SUR96WM7swm+?=
 =?us-ascii?Q?ABblE+2hooNoyPmIq7SQJ/nOnOUmOVeUG3ZhEE42VCcGiBLayyA2ynM/5rLk?=
 =?us-ascii?Q?HxpIOf6nVn/+/ORGpu8XrAtcgFWSEEu2CUej/KE8NKtKdnwpgV1RfhySHbVh?=
 =?us-ascii?Q?Wehn6bMJKrDQ5tz65QqeuOcEofVIFUPvwjS6vOKtT14puJ42YGKs86mgsIVs?=
 =?us-ascii?Q?kHaZ+1ptW+E/tLsHMFrJh1ZYX1uHgHVZAm8MWdwzcrKCYLsAFr5bAzDsCq4Q?=
 =?us-ascii?Q?BdDgba8GBJ8Sdlb61LQRVR6BZvXRpsl/EvbARJNJTTGDiviuvFD/pmrCGfoS?=
 =?us-ascii?Q?8DDfx5Qol/cTYlJDM31EKQmgW7eg7JSzjJ1+768y7FLhHHBB5h6+RE72sTLQ?=
 =?us-ascii?Q?rU41QjaXopul1dxZZvlMysNzclhCMDkMPNKDdqXGOPOM2cmJtC21371eIsSC?=
 =?us-ascii?Q?SwycBL01+68UXE7rjpzNINZVt3CwJKuhSnS2JCZcWzA50e/Z7rKyiJaFryu2?=
 =?us-ascii?Q?A+Bm7/snKEJ5l/mMHoPdnhoTV9REVT+BILNS+5q8kQXbMVqxYpUUXowLQWKE?=
 =?us-ascii?Q?mhk++BklnWzmOmjqP9Pnb4e/NnzKSKOycKyvLkUC9HSqb8CQQn9sw47qSyty?=
 =?us-ascii?Q?KXFGCiD/q18LmKv5G2m6PkRf44Bc7yW2NndeCklj/MylB1Be/1zBch1HYX0l?=
 =?us-ascii?Q?kz/JKhZCleJlolc/d4ZrZRFujJmw2+uVYocDy+O03o/AYI+bcKhkAy4hJe4Y?=
 =?us-ascii?Q?ncIh5Zbdb8X7P3ltph/ns9JIsrfBbTPTZTQzHHj916A4r1q+izm6wKNqdsQo?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2976511-bf52-4ee6-6d35-08db5be8972b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 23:51:13.2623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDs4VJx2UVYtTWXbYjNnmSq5cJ4zm1ed2lGX797U8EpjkUOHriupeU5x5edruAyWdSGjMMz0P+nz4U1Aq7tRFrTP9qNDX74Ba+SeGgiyqgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6426
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] xe/rpls: Add RPLS Support
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

On Mon, May 22, 2023 at 12:35:40PM -0700, Anusha Srivatsa wrote:
> Add RPLS support that was missing apart from the PCI IDs.
> 
> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>

The subject prefix is missing the "drm" part.  But aside from that,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c            | 7 +++++++
>  drivers/gpu/drm/xe/xe_platform_types.h | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e789a50a1310..cb748b062e54 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -194,6 +194,8 @@ static const struct xe_device_desc rkl_desc = {
>  	.require_force_probe = true,
>  };
>  
> +static const u16 adls_rpls_ids[] = { XE_RPLS_IDS(NOP), 0 };
> +
>  static const struct xe_device_desc adl_s_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
> @@ -201,6 +203,10 @@ static const struct xe_device_desc adl_s_desc = {
>  	.has_display = true,
>  	.has_llc = true,
>  	.require_force_probe = true,
> +	.subplatforms = (const struct xe_subplatform_desc[]) {
> +		{ XE_SUBPLATFORM_ADLS_RPLS, "RPLS", adls_rpls_ids },
> +		{},
> +	},
>  };
>  
>  static const u16 adlp_rplu_ids[] = { XE_RPLU_IDS(NOP), 0 };
> @@ -339,6 +345,7 @@ static const struct pci_device_id pciidlist[] = {
>  	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
>  	XE_ADLN_IDS(INTEL_VGA_DEVICE, &adl_n_desc),
>  	XE_RPLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
> +	XE_RPLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
>  	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
>  	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
>  	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
> diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
> index abbb8a1f29a8..394149838d06 100644
> --- a/drivers/gpu/drm/xe/xe_platform_types.h
> +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> @@ -26,6 +26,7 @@ enum xe_platform {
>  enum xe_subplatform {
>  	XE_SUBPLATFORM_UNINITIALIZED = 0,
>  	XE_SUBPLATFORM_NONE,
> +	XE_SUBPLATFORM_ADLS_RPLS,
>  	XE_SUBPLATFORM_ADLP_RPLU,
>  	XE_SUBPLATFORM_DG2_G10,
>  	XE_SUBPLATFORM_DG2_G11,
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
