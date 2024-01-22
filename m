Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58EDC47422
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 03:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B1910E391;
	Mon, 22 Jan 2024 03:17:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2665910E391
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 03:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705893432; x=1737429432;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0Pxi+qRTKf9f7z5orrB9pOjINiC0jwvl5aHEUqbnjBM=;
 b=Dg+oHMACa5N1xkY+Vtq+Xvx9BSxTGFDPDgEnsozVZYaMBn8js1ty6dWf
 6jcT7vQv4L0mfayMCz7yUiUZLgmRsbP1uFO5qEvG5wDa5i9py+OHMJF3a
 pUxa71foVCCl5OORk9zWLYbXIAb6TPAGeHf3PgLiOmmpXkHO0ALyqIzt8
 rG5DfY2UOJ7S0HC0fs+9FEET28snRmndKXDAQ408JY8jZEHCAunXx4auE
 FmKBNcMeByJDCo/TxuAaD4oOAAEuh1VMWfmvfp9NzrydiUPHRWNTq5ja3
 EblHWXgE5V49x/u1Ykvj+ikRWWGejL3v0JQWOHT7ZZOdtwH9VCddu2vPh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="487234996"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="487234996"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 19:17:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="735031714"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="735031714"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2024 19:17:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 21 Jan 2024 19:17:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 21 Jan 2024 19:17:06 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 21 Jan 2024 19:17:06 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 21 Jan 2024 19:17:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHDRJb5aPJwhxPiN/tOd9MJc4JB39d91XLMLjOBffDEF2S96r1pp+7oW6/ZNkET/3ZRLekoaW/TvmceelMKBgUVuNInOqDhwpWJM/CphAiMX3qHUfMXD8ACEu/XA4kZXWsgWsFU4n7leFAtPmBdIU8l0YXfROU4jBUajOhIZMNFaMJDwJxb2EnDh/MJCQpev1ztc+lbfSFUAQe4nAeE9yjcqtzqOHlhHW9vCRcRp7mE2OEme4m6/9GCzOgRpHYEhvJGzvOlAX/ahrE7lRYiMWD8xEhK2GUszauIXBSOlya3e2sqIMQu/TJ/3/i+CzC5iFqTOb83N5+eg2eV8FCQEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mX/qM6gHFRMDcdysrhr/O/IN1j3USF2Xu0tG1LN+e1o=;
 b=FuHtwS22t6xs7438eFqAJM8sg6nwhVdg8cstbzb40VjXFd8psIlpw/kJAPgXfD4U5SWT2xj01I4BcPOg0JXkuNes9HcEOzasFulZ8WXqx98djuW+4y0rgaZgFo8kfhsHO4C+xQgqYm8PfeHAvIIntGE1R9wAujJ11SPm5G4ldE1el7cT3wOCNWim2rOeSJMp7kBBFOvgkvwHmq80WaEelbYCkU3AblVOTNnUYph0xHeZHxf9n0QUbYFDNTeYa9g9xuE8jQizts8/FKxnkGfrscnjCC/gyDvQyK/q/aBOo3HUIUt36/ZOWtxh+hUr8Uw5r0PtokgUroVfuiQE0OcczQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7263.namprd11.prod.outlook.com (2603:10b6:8:13f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 03:16:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 03:16:52 +0000
Date: Mon, 22 Jan 2024 03:15:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/4] drm/xe/guc: Move GUC_ID_MAX definition to GuC ABI
 header
Message-ID: <Za3d3B6/1FZop0as@DUT025-TGLU.fm.intel.com>
References: <20240110174622.409-1-michal.wajdeczko@intel.com>
 <20240110174622.409-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240110174622.409-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: d9f6c468-e453-47cf-a7e4-08dc1af89491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qWmSmIdmGPMSLZZQeZAsT51BWPTJ8+cYGcFJwi4DBZM+99GTg6DoxaW9DWxFKDtlETPWLX1paDN/aR1wt1GQKQIwawRk8vOAEkyJLif0lhlVTGror/zzu0kleOvqZ30TymhUO5SO4Cc7zeKUGYrACLJgIBSIDD8lNNUfX749ZGQ2Ain4JYNu1fdLjcWjOvSFOFtZD/oCpeiDgTiPvXeFJwM8Iu/mIUA4zsru7HnJbannud0n4iBFMe4Lqf8jZQaskpCzzOyJgJPY1vREg+q/Z7tM9r4nklL0veGeuEdvnNU5ymk0/GV44Flpxp7qpob8JlEATBhItskLQbYcB0ukTRWOvzrzzH17F+v8Ly31KadXXwH5Yldfni7TB/ecIVoUhkR08GputiKiiHYo6LB6HKKe3wRc14WiD2VtvpPv13s2DrCNAIcMkCWlpRapo4y7fDM85WHgv7siRSTlDSXcyC1DP5wMNf2Vv+VCGusBwQMZGR/G5GfpbCMiajtIvmBsqoApLl0r7zXzBcq93bbeAFrnVn2J/uyYFULz6JTRDdEzFyckF1IgXWsiAFVfdGm9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(346002)(366004)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6506007)(26005)(6666004)(6512007)(5660300002)(2906002)(83380400001)(44832011)(41300700001)(478600001)(6486002)(66476007)(6862004)(66556008)(4326008)(8936002)(8676002)(6636002)(316002)(66946007)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?quuXJVdw/iWo5RYoYJR2xJoJtz5SNmvTxHHS1L+50CEvEfCU+UdJdWlcXQsF?=
 =?us-ascii?Q?vKEHITg1FS8T3TixBJHaXwJ1HQ0j40fIIVv51366nMx9rnelHH2ft7IAa44C?=
 =?us-ascii?Q?0E3emOJOtnmq2z+XKUDM1HQws1f3IzOYCNowsqW6MRkdKsYSTj/db7i2q/Wz?=
 =?us-ascii?Q?vFtWtaE6B27PrlkSdwCd50dpIuQCyj8Hgesx46+H97FPrdFV5PCAAsizxo2n?=
 =?us-ascii?Q?Fl9DJZCeBcg2M0SoR8h02Gcvw+LEuFwd1khL0Oe3k0mC76p/yndGU8QSFcQB?=
 =?us-ascii?Q?Jt+QmoMw9VJk25c92Nfu3GMrtveUqJLo4Uye0QRCo0NT55CdybBFJoDN+4vh?=
 =?us-ascii?Q?OPN0F5WbDPTNtvGINHBtWJgZpUZATm6tjnAnQCe0kBOfuiZCAYajb5RfXkEu?=
 =?us-ascii?Q?QQ2tyIl481N2C0AmJkDgfnynm5c3C426XpY+JxbuET/Fubx8MqFZw+4286dh?=
 =?us-ascii?Q?ZujsOiLkI6ukCNIoVWzPNSmNs1eez+1sje83kMgqvw5LGgO32O1949p8sP1q?=
 =?us-ascii?Q?op8ZXvC2anXdzl+5H+onBB3c0E9F5tQsIFK3+edQn3UcxQoiC4jNlbndvzTZ?=
 =?us-ascii?Q?6YWww1gpyukxRPmUfJhoPMt/iFiVCkoVypm5oVqegN3DKsj1G4lC90j3/oHh?=
 =?us-ascii?Q?V6ygAxKx68fCPrRQ91wlTu8El/6KsgIbDNKV1CeMPLthyiyictGyuPF+qLv4?=
 =?us-ascii?Q?oy+o53v5rvv6eDmt9l8OYFDG5rRtUjn9RCwm0UDA739WqlvmVBfUoWXThGpl?=
 =?us-ascii?Q?scWRB3WBPglWeIbyQK3ThAUK5YdBBiB0jT6dHoyoh76ldGC89rtXrQ3yIvYM?=
 =?us-ascii?Q?JMhzNDT06iEon0TLX+6HE3qgUQWXNgQBLR0RxFqG8SNwUfv34355+TnTPLxN?=
 =?us-ascii?Q?Djlni5XpD/gVNo2DCYPwKTkuu9zub2R3kzWW2f/RhuiklTyAQSgquGvjIT6D?=
 =?us-ascii?Q?CSyviUulmrypt6MXgACKSlvbdHxBG4o7VUlmJ0DP642M1uWDfcy/eFX6wkZU?=
 =?us-ascii?Q?ffyvdy8KbYje5aORHEd1bVxoZ1KubU8zlBbqEGIHsK0WabKu3bYEPmhfFSH+?=
 =?us-ascii?Q?aFHEbuwpvQfbKDKlcpY6ihWZw+krn3JG/G2ZsdSS8syrThWm9dzzVcMPiLLf?=
 =?us-ascii?Q?h+2aP0oQz63g5m3k+Dz90U0Eh0kM8/TryV63ew+bwgmvlYmY3Z1jBIzR94k3?=
 =?us-ascii?Q?vqnAUjMYzpkQ1SX9QVUFIfJ4F5sXpmvffn3nYh3oFlT+v5qkg7+ujUnPf65M?=
 =?us-ascii?Q?3D3YgQqikZeJvc7jrPfc4gmcPJEUHQvPJ80HNj3hkRuboo8uywp2RTYHbtBe?=
 =?us-ascii?Q?UzNWSL0t7c8whdH6Bvd1ctuRjlewwhcMDprHh/eAzGhLSx89V8uZwq+SG7Zx?=
 =?us-ascii?Q?8yQOYQX1GUkRmhQ/mMngqhPZ/ZwztIh+lMV+Mm97P0hwb7GiEenRtw+WAeq2?=
 =?us-ascii?Q?lVcuIIhRM8gztqRlOoAtpZf1wamdGspUtsKhgkD2MRFZ/PlWrNp3lX3LY3Tc?=
 =?us-ascii?Q?W+tiKpUae7q+MwXUG1BjFjGjosgHlEmthV9zztXMo/zC/UaGFuRmkEapJe4L?=
 =?us-ascii?Q?lLCM7pffdKl/XUYaFJGM4GT017IxbbymI6MWifGP81pBk/Av7X5Ohhudui7/?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f6c468-e453-47cf-a7e4-08dc1af89491
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 03:16:52.8116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehH0MQzC0eGhuoSr9H30Z146HEDjtmIxcENlwQPSkvGXAcD+i+UFsaQ0DgFh/qTrtdYWFQt7NncpD1M8F/15sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7263
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 06:46:19PM +0100, Michal Wajdeczko wrote:
> This macro represents GuC firmware capability and shall be defined
> in the firmware ABI header. Move it to xe_guc_fwif.h file.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_fwif.h   | 2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 4dd5a88a7826..949aaf04be42 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -14,6 +14,8 @@
>  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
>  #define G2H_LEN_DW_TLB_INVALIDATE		3
>  
> +#define GUC_ID_MAX			65535
> +
>  #define GUC_CONTEXT_DISABLE		0
>  #define GUC_CONTEXT_ENABLE		1
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 54ffcfcdd41f..022e93796bf8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -241,7 +241,6 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
>  	mutex_destroy(&guc->submission_state.lock);
>  }
>  
> -#define GUC_ID_MAX		65535
>  #define GUC_ID_NUMBER_MLRC	4096
>  #define GUC_ID_NUMBER_SLRC	(GUC_ID_MAX - GUC_ID_NUMBER_MLRC)
>  #define GUC_ID_START_MLRC	GUC_ID_NUMBER_SLRC
> -- 
> 2.25.1
> 
