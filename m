Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF33D767DD
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 15:49:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A43210E17B;
	Thu, 31 Oct 2024 15:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C2R0HSGU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E82410E17B
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 15:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730389762; x=1761925762;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SlTOfg+Qx6+T7KF75J+DkpWvPC+9gU20EcLpfZXtLro=;
 b=C2R0HSGUPa4RHxIz4FoLrJSw2PqFMMjQPlpMQdoGrnvBmgajtgYy+qUF
 MrSYjvOxn07XDmogTO3qQbncapsEGfwTfbUbvVqAwHxLmtmgpKQxPgCZy
 0QLxbDOPI9/kFcbd5PSTrqinoKdl+Zotz7fe2hd7n5hdygSyiQX9c08z+
 TzZtBoWay4QhRCEI1AiA/VZGYHodaMmqaW0XXIkn3ii4kxcg/v43nyZb0
 +2bTKouZhlBkmKg+Qo41MtSfJJS73FN+c5CC4sms5gxAsZhqvAicZ6ARq
 hrjmEBwC1vj0VzTswcibbZpOKL52UGsSzLGsYG9OIuh9VuDpSAbkgIJtN w==;
X-CSE-ConnectionGUID: L92KkwopQLOxHDCPK5KaLw==
X-CSE-MsgGUID: wMjNtkE2RuKvvlkM/8nTAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29995888"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29995888"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:49:22 -0700
X-CSE-ConnectionGUID: CGpR0dweS2K/a0Pefhh66g==
X-CSE-MsgGUID: ITM6iUX4Taes9yfxjbIT7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="105995939"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2024 08:49:21 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 31 Oct 2024 08:49:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 31 Oct 2024 08:49:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 08:49:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EID7Qi/qr3qWA+dT5AQCVJ33tIhMlDcByRPEG6Xe0igOwwCtArBnwKKs99QQ5cH1FJizC5CekoOUvXTTYfMVRfDsaugTrN9K9gxcKpwo92A41XO60uyoqcNHJaD8wYCdgjbt03+GlMQEPhwRu8cIwlD/H7w5X0DttXYXHOtv2zwZxROJH4Q326HUMFhJBh89HzzxHJTaJqVzEpCTxjkOXGwSZA/sjp8qxXqEINlF+dC1tLkl7rjXRlBkkuhk7lrsWIc9S+4bnCeKg6xnCt9CPwzriJBPG6bCLLbLkwfVS24rs2ccLAxBCDFviivBR3bjFCMkUgutmPfsGU5p+MydZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMEj6mrawWpYPbrh2GqGKfGsCRX6ERYANXCaXBpMuLM=;
 b=rsxaXpGntLKp9OPGKMGR8iZmt4xYEqYkfOQoxE8BuBnnT+hT4O1a4WU8lrzepvhI0SUe2FfX94Vis+VDKphI7+CYCsBpPzpJtMUPw0hKjOyfzkuOIqxPC9vyTCfsz1xBJAk291vnt89tXwyF/2jXTkmG7TNCOfaI1o4wAkDCWrdpVPKO+dVGFil1cPMMkaYh8l6N8ui30TEVfd3rD1uxjg9zKX/PvmokjLgv3tEp+yQmf5qdJdIzaevvCoZEQpKhUh8tvPvnD3101TijDKz4ZMRxNSRIykj65eCIBkCxEYooiY/1U9M6q2Y+2uhNc4RgAVF/nPMM+0YQmkQjEELi6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV1PR11MB8790.namprd11.prod.outlook.com (2603:10b6:408:2b1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 15:49:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.025; Thu, 31 Oct 2024
 15:49:17 +0000
Date: Thu, 31 Oct 2024 08:49:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.winiarski@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 3/4] drm/xe/pf: Add functions to save and restore VF
 LMEM and CCS data
Message-ID: <ZyOnG4quAkgxWsJ9@lstrano-desk.jf.intel.com>
References: <20241031151725.28315-1-lukasz.laguna@intel.com>
 <20241031151725.28315-4-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241031151725.28315-4-lukasz.laguna@intel.com>
X-ClientProxiedBy: MW4PR03CA0266.namprd03.prod.outlook.com
 (2603:10b6:303:b4::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV1PR11MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ff4955-b7a0-49b8-742e-08dcf9c393c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FDppE1XDfMFHauoOuCoVLkjW2crRdXygsQHPn0nR+oB6GL8edJnKAUGxNlen?=
 =?us-ascii?Q?MvQUQ2YgG3sDqL/9VrluJZgnr/NQbW2N3j/h4UEbPIgW25N79E0Z3HrwQp3L?=
 =?us-ascii?Q?Ww1DGoCTjpKKBwbDMGy/QFINITe8CQr4u7YaOuLAfP+8Uchre+Hq4LhdxMiZ?=
 =?us-ascii?Q?8weyBRPp07JbXCMgFvSd8fobAc6YAWneme+0naApzGo1NHTaMFD+8cwxKHMF?=
 =?us-ascii?Q?benR0vpM/+R0Bu25kpjfLiLR3vH3ik6nYeGQFJB4wLouDMixyImIWMaCxVN2?=
 =?us-ascii?Q?JJDgNBHzz/x/KYJnPHALkj+Ah9rzkN9DqSmvCNrJlbl+BrGn3ACMqZqc+lBs?=
 =?us-ascii?Q?RKWToNTQ14zErJC5pRq1MvrPCQ12bAdnGkIFjg8AVyEF2O+U+83eevlspxEW?=
 =?us-ascii?Q?ADHYvioGnVuS124gaJ9rCDY57N0Iy3XvY9XfXLr8NR66hb538tkh+b0N3edv?=
 =?us-ascii?Q?MTuAkSvMvX3SgOVkggqp8cKAtfyyCdjT181igDUm23M1YCp5vH4Nx7p1TjNF?=
 =?us-ascii?Q?oqila3R2aJQXfBwYPyG4vMTZ8ARb2B8ad+uF/WGD0wYEstDGpw8uOsPcX1D6?=
 =?us-ascii?Q?TkDCxcFV6pPvpAq+JL5LgVrMDFjyOtQXiR3BhnNKsD7c5dmRgbwcIQCMcOKi?=
 =?us-ascii?Q?EVDMdtgcVuE5qxsUvxJnFTzZvulrXyaULlJmCuFf+/77rQpD4iswe7LxiAl2?=
 =?us-ascii?Q?DeO8oAy6MUN9gw6uXnK/XcJ85OMajSFse72/hol1KLcK6bEKwLV/4XOrFlA1?=
 =?us-ascii?Q?3sh3yunKTV0X1dQ8++eARMhf9fmxZCbMyEaT7QE8rjEPWeufzwp/HtLqXhAK?=
 =?us-ascii?Q?0/pLW2+KJtExNKyu+lkzEIBJQ//Q0S5wcXgOiMJjo152Kg/LTw6WMzyvRLek?=
 =?us-ascii?Q?L+nPp8+rk35qlJe1a7XlE0YmcJDkwR9orLCjQYYrBW1f25nk7SM7ghJyIqPw?=
 =?us-ascii?Q?ny2bi2sQa9H6TA7yxEpNeJ+me2qYKEtl5vPPYJu5KiiXhk6r+Mt8OezhmVoo?=
 =?us-ascii?Q?jsVL+PbavPYGEwsGVm8BDN8vWzUTgCnTpVSd6/Nygyh7IBbdfncXkHYIFHVh?=
 =?us-ascii?Q?pTB3mgbFvJ38gsmiJCJNX2KHUkH2tj+a1tWxNgZ9fmMZ/M7iBVVUN5vjX6XR?=
 =?us-ascii?Q?hw/e7UTK/rsX6nu9/I3oslnjXlfs+yQMCdKsT0MHHKq3Vl6MG7Mi5ZI8O87H?=
 =?us-ascii?Q?99LPBMXRdpAlimPy/LIWjF2/6ilvSTp9wS83uRjUBOGHoR2Mh60YkJbShdHt?=
 =?us-ascii?Q?9khE6VeNWJbuCx4/eIKrZz0vzWIcQWChbL2yXexy/MeZBXqfJg/IXu48N4AN?=
 =?us-ascii?Q?k2inPNd2BuQCPbG3j0R96Xx7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oTGKwNFQyqHTBqcIDj2AcOGqauwK7SbFYrHU34VboMT4z81++bspfKjxhtz0?=
 =?us-ascii?Q?UingiGxGAqPKdqTpXbgYu8wKuTSEwWn5IeSmMK/RhoJRDnq7X++qyHP1AsJK?=
 =?us-ascii?Q?v3MBW2SO0cvLl7rs1/ju/TS2PMFLdrnX0grLG/ThV+WqIoL3Vp0nS5E43vGD?=
 =?us-ascii?Q?oXfL7oljhNLZ5xuKnc34ohdYCpBdt+mgdptX7c94rTNinJld+y7ZAd44O+RG?=
 =?us-ascii?Q?EB33cwF1hi8e4EKeTLW6+EA5LkODlBJQ/ZkKgdpo62rMNli0Dq8xUey41fot?=
 =?us-ascii?Q?rNr+nQ8t9n8ogTCYsIApwEiEMZta5gBiVeF2RsPSEy4EL89FPzT9GjbEyldP?=
 =?us-ascii?Q?R/tWctOJUI56sOEEzNBV2F/lOAndSp/69MEY/ZMgAytof7ADJrokRQPrI81m?=
 =?us-ascii?Q?NaZzTSuUu2gzLvhg+3JmHpl26tYV3jqjum3RhFsT7WXipLlKG+TvJDg9MMEy?=
 =?us-ascii?Q?8WRAm9uCWO+9TQSf8MKZwEcK82FoHQs1sI5XH5MpjlDUkkKnN1wtoOb21aV4?=
 =?us-ascii?Q?Vm1tDZ/SWAOEYT0OLSIzA3b5RrF7pN5UARaFjpJWa3nXF5NewyIWkGUERTsZ?=
 =?us-ascii?Q?tsI7CnCLEf4EtfxbpLlP7/VPUDqzeAB4WbBduz7QoAwlhyL8p475Ok9SVxc5?=
 =?us-ascii?Q?Ik59KluDN8GurijOJn50fqkZm5Z2UHkVR5YO78Qlm1zSDZKl5y1nOQAIqR9l?=
 =?us-ascii?Q?hvFaoBVqMdEeCom22rxfI3v4I2xX0IYzNh52G4zEenWA60IiRIwUOYgsRr4E?=
 =?us-ascii?Q?3ttSyWM0AXUEJf80cSaN6HH6/RQyJKH/V2BP5nh139oTgUyUjpIMuSp+Pc/E?=
 =?us-ascii?Q?8f2kOj2cOLyLp5rooDOYUSX6yFHUceAMLzFpzt4lR5gXG5PH0sYc2NNgbZDv?=
 =?us-ascii?Q?34Ftxua2nqZ30hm1A5UHp+Rt2ihruBcrwGh5Jc4f8i3IKmkcK6xWB26MFyOi?=
 =?us-ascii?Q?YK4Y5Q7SHgbziuZnFC+1qFF16o/C2HtbiNsWJuqBZgx4hHIBZsa8FR69drrE?=
 =?us-ascii?Q?z66PA04TGB4upc9Dy1+k32gPoZdJrrIvHmp/7KePQWyYpVr2U33pwDhZYK6L?=
 =?us-ascii?Q?4qgJL8cjCswiDcv2WTpJaP1NMxoF0TkMcQbATypeNt4y1KN2JW6tgOll9Sni?=
 =?us-ascii?Q?RJeGIGLl6admR/2C4odwcUOqU8Fezlr5b+xnEmnv3X91hlRBaGsvYzuBRBRM?=
 =?us-ascii?Q?bVyTmb8lPB22L0J4+NOgGABNgFNGARCh6+5hNW5rpTtx/Z2gm4+t1nzY0O1P?=
 =?us-ascii?Q?Vj3Fi4EcKttNNvFxz2dAJZBeZgeMip+3cSQUyBWBmk0Cz4wPW8ZKEQlMXq3Y?=
 =?us-ascii?Q?DpiYQVGU9RSXgkEjnkHSvA3+u9l5BPRAyZpyYEnayoIfIy9brK6jhD4JyQuj?=
 =?us-ascii?Q?P5R7b304/QA9wvB1tQUZTswgUKY1+VoHo8FML3b0lQSrfTZUwSmza/2/mbxm?=
 =?us-ascii?Q?iiQ2CcwJlTMQpg8xkFWFB/66nyc4ubftjhOJI4n+I0sSEodIUKXPmgzUuW8k?=
 =?us-ascii?Q?DFqkABOVkUHbTXhR+TUBvsokPN776+JGT9raYmrrUCmJkjcBlpAHk1K5W3Us?=
 =?us-ascii?Q?hK1VpLyIy07/nOofC8u1XPTY+Krsz7VcGAqT1fOxPfVoTXpyNEodbo9524OU?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ff4955-b7a0-49b8-742e-08dcf9c393c2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 15:49:17.4527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0MKucsekiYglR4nVpAbbSHdcmWToMfOT4sAtYD0Rzn4DGpB9TiXm9mnG6rfBQ+TJntk+P5IpgVHL/nyDmqRig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8790
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 31, 2024 at 04:17:24PM +0100, Lukasz Laguna wrote:
> State of VF LMEM and corresponding CCS metadata needs to be saved and
> restored during migration of VM with attached dGPU VF. Add helpers that
> allow it. We will start using them in upcoming patches.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 112 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   9 ++
>  2 files changed, 121 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index c712111aa30d..eca01c96a348 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -12,6 +12,7 @@
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
> +#include "xe_migrate.h"
>  #include "xe_sriov.h"
>  
>  /* Return: number of dwords saved/restored/required or a negative error code on failure */
> @@ -382,6 +383,117 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  }
>  #endif /* CONFIG_DEBUG_FS */
>  
> +static struct dma_fence *pf_save_restore_lmem(struct xe_gt *gt, unsigned int vfid,
> +					      struct xe_bo *smem, u64 smem_offset,
> +					      struct xe_bo *ccs, u64 ccs_offset,
> +					      u64 lmem_offset, size_t size, bool save)
> +{
> +	struct xe_bo *lmem;
> +	struct dma_fence *ret = NULL;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +	xe_gt_assert(gt, smem || ccs);
> +

For locking this, you and going explain and justify why you are open
coding the locking with nesting / trylocking rather than say using a
drm_exec loop to lock all the BOs.

> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	lmem = gt->sriov.pf.vfs[vfid].config.lmem_obj;
> +	if (!lmem) {
> +		mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +		return ERR_PTR(-ENXIO);
> +	}
> +
> +	if (!xe_bo_trylock(lmem)) {
> +		mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +		return ERR_PTR(-EBUSY);
> +	}

Gut reaction - this looks bad.

Here I'm assumng you use a trylock as xe_gt_sriov_pf_master_mutex is in
path of reclaim thus it cannot be nested with a dma-resv lock which is
reclaim safe...

e.g the locking order is:

fs_reclaim_acquire()
mutex_lock(xe_gt_sriov_pf_master_mutex())
mutex_unlock(xe_gt_sriov_pf_master_mutex())
fs_reclaim_release()

vs.
dma_resv_lock()
fs_reclaim_acquire()
fs_reclaim_release()
dma_resv_unlock()

Why do you need 'xe_bo_trylock(lmem)' under
'xe_gt_sriov_pf_master_mutex' but not 'xe_bo_trylock(smem)' or
'xe_bo_trylock(ccs)"?

All of this kinda screams to be the SRIOV locking might need a bit of
rework to either...

- Completely remove fs_reclaim_acquire from the outside of
  xe_gt_sriov_pf_master_mutex

- Or split that into 2 with a reclaim safe outer lock and a in path of
  reclaim inner lock

That being said I don't have a great understanding of the SRIOV locking,
so may be way off here. At a minimum I think it might be good to review
the SRIOV locking design with a few SRIOV people, Thomas, and myself
because on its surface this looks a bit scary when things like this need
to be done.

Matt

> +
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (smem) {
> +		if (!xe_bo_trylock(smem)) {
> +			ret = ERR_PTR(-EBUSY);
> +			goto err_lmem_unlock;
> +		}
> +	}
> +	if (ccs) {
> +		if (!xe_bo_trylock(ccs)) {
> +			ret = ERR_PTR(-EBUSY);
> +			goto err_smem_unlock;
> +		}
> +	}
> +
> +	ret = xe_migrate_raw_vram_copy(lmem, lmem_offset, smem, smem_offset, ccs, ccs_offset,
> +				       size, save);
> +
> +	if (ccs)
> +		xe_bo_unlock(ccs);
> +err_smem_unlock:
> +	if (smem)
> +		xe_bo_unlock(smem);
> +err_lmem_unlock:
> +	xe_bo_unlock(lmem);
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_save_lmem() - Save a VF LMEM and corresponding CCS.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @smem: the sysmem BO to save LMEM data to (NULL if not needed)
> + * @smem_offset: the offset of @smem BO
> + * @ccs: the sysmem BO to save CCS data to (NULL if not needed)
> + * @ccs_offset: the offset of @ccs BO
> + * @lmem_offset: the offset of VF LMEM chunk
> + * @size: the size of VF LMEM chunk
> + *
> + * This function is for PF only.
> + *
> + * This functions saves VF LMEM and corresponding CCS data into sysmem buffer
> + * objects.
> + *
> + * Return: Pointer to a dma_fence representing the last copy batch, or
> + * an error pointer on failure.
> + */
> +struct dma_fence *xe_gt_sriov_pf_migration_save_lmem(struct xe_gt *gt, unsigned int vfid,
> +						     struct xe_bo *smem, u64 smem_offset,
> +						     struct xe_bo *ccs, u64 ccs_offset,
> +						     u64 lmem_offset, size_t size)
> +{
> +	return pf_save_restore_lmem(gt, vfid, smem, smem_offset, ccs, ccs_offset,
> +				    lmem_offset, size, true);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_restore_lmem() - Restore a VF LMEM and corresponding CCS.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @smem: the sysmem BO to restore LMEM data from (NULL if not needed)
> + * @smem_offset: the offset of @smem BO
> + * @ccs: the sysmem BO to restore CCS data from (NULL if not needed)
> + * @ccs_offset: the offset of @ccs BO
> + * @lmem_offset: the offset of VF LMEM chunk
> + * @size: the size of VF LMEM chunk
> + *
> + * This function is for PF only.
> + *
> + * This functions restores VF LMEM and corresponding CCS data from sysmem
> + * buffer objects.
> + *
> + * Return: Pointer to a dma_fence representing the last copy batch, or
> + * an error pointer on failure.
> + */
> +struct dma_fence *xe_gt_sriov_pf_migration_restore_lmem(struct xe_gt *gt, unsigned int vfid,
> +							struct xe_bo *smem, u64 smem_offset,
> +							struct xe_bo *ccs, u64 ccs_offset,
> +							u64 lmem_offset, size_t size)
> +{
> +	return pf_save_restore_lmem(gt, vfid, smem, smem_offset, ccs, ccs_offset,
> +				    lmem_offset, size, false);
> +}
> +
>  static bool pf_check_migration_support(struct xe_gt *gt)
>  {
>  	/* GuC 70.25 with save/restore v2 is required */
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index 09faeae00ddb..a4301574d92c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -8,11 +8,20 @@
>  
>  #include <linux/types.h>
>  
> +struct xe_bo;
>  struct xe_gt;
>  
>  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
>  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
> +struct dma_fence *xe_gt_sriov_pf_migration_save_lmem(struct xe_gt *gt, unsigned int vfid,
> +						     struct xe_bo *smem, u64 smem_offset,
> +						     struct xe_bo *ccs, u64 ccs_offset,
> +						     u64 lmem_offset, size_t size);
> +struct dma_fence *xe_gt_sriov_pf_migration_restore_lmem(struct xe_gt *gt, unsigned int vfid,
> +							struct xe_bo *smem, u64 smem_offset,
> +							struct xe_bo *ccs, u64 ccs_offset,
> +							u64 lmem_offset, size_t size);
>  
>  #ifdef CONFIG_DEBUG_FS
>  ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
> -- 
> 2.40.0
> 
