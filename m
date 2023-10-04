Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F90E7B61E
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 14:04:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5304410E384;
	Wed,  4 Oct 2023 14:04:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B22E10E384
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 14:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696428296; x=1727964296;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EqDRehx/SMLxF+kzD2PWFZY55BphZqeciWY3tXXlW4k=;
 b=iE5lx+Ep9WyVj8wGU0tzHoyMhtlRXoq+Ih7Naz0T593SV5HfMjWJHKn2
 lSjqP+n2XXE+KOLyYpJsIp2WZjm5TTdBr6TgvYlr4i5cRN0zQkcE3gpZE
 c+JfwZZXOPydJ825Sbq6jidh9aNr+lBLglVAEoPdFmDnI1nt5CZn+q9Ob
 OfQlkGkCQusb2azKNXpSDhtOdy9/91KjPuRtiXGEjkfKjB5zSBILvWznf
 aXROI2/8F+IWmHU9+D8dL66NrcfTHPwaDcphXt3d84DpPvWHpdkG1ZQe9
 SW+9+B9EV1UimD1/N1RlZkj6CgmspWIF6Fhacyyqe+hkOz6U0RPML4mrF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="382041994"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="382041994"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 07:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="744986538"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="744986538"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 07:04:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 07:04:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 07:04:54 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 07:04:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+FLDiLpP1OeHQLY5agqPmaDoG6KxLsibKUMW9nN3NAqMZKla28i1+mwvF3X3wCnGFkLX3BcV6tsfaMs6HT0ESYVnPf87SutQV0CK0J38pglHudObHizPAFCV79jvo/Sj5so50kBBCkJt70W9m466UPw5rCUSaCK5qJKMN/rrWCTymqC0piVCfDaELER9ugopGC+AeizZZ17OiCT1e8btd1XcKzowpBPXRQq7WpxRZy9T0L4cSGQk5rFcb09E1eqabqYx8ufIKs5SFtLWFw7TUAkexkkxIRcuV0FtcFJj2mo97q+Jzf1yYhs6TS+vpmf7KOPf1Qok0UxJRfTUl1OOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQmfPiXf7xTDc5Uwf9LKxULcP+YUj+msfDrZk7v8fVY=;
 b=GjXSiY7YlHJ1aciOeMQH1K9y/NmmrllLkTPqJHz/v8rxa1DpOHeJKrP46PCqJcaSmSdb412wV+jzueAp4EGfYuFUp2g3KReUAKj1jAmJ6+ikrGWJRJx4od47Eh+WkzRJh5LSSHaldTYPnUbV73sZICQNQ5QmOxFQLlGGh4gYSMuFFtK1qc0hFGF7K9a4N9YJ/4IG2pwYbJxhByPsR79t34MYUCgMMPOo9EouYYcevWjwJ1vmgPJKMQQFaZ1FkQq8mMK13oRBx78H2ioSo3OZm87nenFvp0+zHuCcNpNeSUtha9iDxgZGlWbm9g66uOTv6ZoK10gE67a2XsGnLQbf+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 4 Oct
 2023 14:04:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 14:04:53 +0000
Date: Wed, 4 Oct 2023 10:04:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZR1xAHOgg/XquzVf@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
 <7a98810ab931ec5245705b41f2038c53abb63fae.1696343521.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7a98810ab931ec5245705b41f2038c53abb63fae.1696343521.git.jani.nikula@intel.com>
X-ClientProxiedBy: CY5PR22CA0044.namprd22.prod.outlook.com
 (2603:10b6:930:1d::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c8c2c1-2747-45fe-48bb-08dbc4e2e17e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zagRZduLactJ77eEyH6xMWYNkLKIx4D2PVaXj/CAXz+pFyKLPH80aRwnGZrPkLcjOpsddwFk2Qpu/vBnGoWkGj7Fl8pR7ftfbT4xJZP0h9HUou7ic/fISBdsM1agkG7x+rEGkKPQxK0lP05DqTa/ozCe2QENXjn61p3TlU9/SyVAXcyBrQKcYJBVVANF+QPyJcHo/fhVV/EbhEZRKGu6DkDaQ+wfyu7CsMajyuszkWRilOGDEnOUk3uEG8oT0SGMuTfSQ+VsNGsYgOiMrdgkv02t6cCesx0dTlVd/CfLTZMtyHYaD7WFrAwWOiS4QF0oF+QsLVBh1LAgU2hIobhht7VZe1kPtZhRL8TISwN65hWfdDiJChYYzK1wH//JMF/xDlxSfmM0wsvWJ1U7BGVs3Vrzwbp6AUoAQ3aFl/cGyp825RXUlsAUeci4CQQnACjeg2QbrZg3N96TtyBf70X0r/g+EGyOtXQay3BoA8gX03rSXnZ3PfTT8Npqvkvbn/SQ5lS0UQs8AF6Gev0M7L9Ft5Kp8L0IFSthz+7uKgXSMOx0X/q+L/0sV/HTt0DAhFXM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(8936002)(26005)(2616005)(6506007)(6512007)(38100700002)(82960400001)(86362001)(316002)(83380400001)(36756003)(66476007)(37006003)(8676002)(66946007)(66556008)(6862004)(4326008)(5660300002)(41300700001)(2906002)(478600001)(44832011)(6666004)(6636002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IymX8IlQM07bdCHGUHep90Ql5MiwEtJVQeZwUNKZEh+6ZfH+P4ZPU/gPX19e?=
 =?us-ascii?Q?cfvO3v2yW4K/icJjHxTBpdoiLKnlGxguAbUwJu5bx7t39+9YF5xdp0dCvhaz?=
 =?us-ascii?Q?LfoAgwUOrE6G3AeiIufjGZmYuzo+nt/XVtkSkVx9x9JhnK02KOjdfFO5JGNO?=
 =?us-ascii?Q?wcL7EfPveBfzOXGHFo0NNGzVUVbyoXCf2lWH6/5ispC7UT4KC86Q4Qm2zo7x?=
 =?us-ascii?Q?RdaImlWRzi52+A/3kshGuhv6/XDm+3kQmIihHf/6Z/yXRpD39Te2Kl/pCkoX?=
 =?us-ascii?Q?ftfp1il3IMZWDsugCFbx87IlCZZWJkYrp4j64k1475Ee3RW4+Zp8zPJ4qQXq?=
 =?us-ascii?Q?Nk+SNi2XRKmIB8xmkZKLvuy9LaOHhsiZrljL4bs30JA5cqq9VhdWvvy+gvp6?=
 =?us-ascii?Q?KpyQytuGLiy+UpN56Gxj9ouIRFmDmiHR5RN6N0SZldwAMKBgDUTqAU9Cpe3s?=
 =?us-ascii?Q?oeZx350FtHGeK5JLTQ4ge4bvnh3y37x1Lpx8b5x6ipZKn6aGnpVx0KVjx8HQ?=
 =?us-ascii?Q?qag7Xddhyq+cLhmuv1vpyqneLiscDFuUyqirgDZki92HCO42JCL9k9OypYoy?=
 =?us-ascii?Q?I5WDS4wA7tusL4KBev3R38zBGQAQY64iiQrFFt3TDiHu7GmjmZEQsjnJ19X6?=
 =?us-ascii?Q?OKL4IYKaJ/WvGDQW1pXFBk5reMohW6suW0K9YmsbqqXgsvKNHM72wq0ezhtr?=
 =?us-ascii?Q?W7SRy56I74qSaZ2JgsyPonBE9WBCZgb2JA9dEqIsYmtKeYq6STK/Bs0SZL2F?=
 =?us-ascii?Q?dOOHw8exp41+wtXczZoE/MHxRp0gq41ibpMMhxCVoevqS0PxrgC89CvcS1Nz?=
 =?us-ascii?Q?gQnJZi2hQJ/N6nAzhAwpGtiVZopWKh5PdIow1yWkSZwJjlhGDvEUUlqAZRWT?=
 =?us-ascii?Q?vhr7Zb9v2+UuR778ENFUVJvO4NtKym8zT3T4L6Vv+lEUtcM9GxqIPaF+TEXj?=
 =?us-ascii?Q?vHjjr9oWuUt9d6UgGmyyRIXiPAUrSK9jxNNwrYxzxSa7Vs95X0+JhFiDIZoU?=
 =?us-ascii?Q?RNAewzFM5pO/S2lb9ovHmU5rHIa7Xyx045moJWxsPydW189sikqY9hvCrmYd?=
 =?us-ascii?Q?xPcLMcY6xxMrfxCrMgpYq54woqq9CDmj9xVtxWNLR3VRjjmnPP8hOweFPfBj?=
 =?us-ascii?Q?eqyzJnaQC00Y8vHt/Y/hvjUhDkXkA/NlOQ/lE9I0rdoiPVgW4Kl0yv9dAiK0?=
 =?us-ascii?Q?ezySQ4GC5i22Zie5XHy1iSBZZsPAunsrNODMwecO+bCMALG17QLoEXVF+p8Z?=
 =?us-ascii?Q?7QGVxAp/d+ghB8jE7dYjfxtS4/rYfDTCmCjZCACaRY2x5ng33Y2w0MKRIQmo?=
 =?us-ascii?Q?U5pXmLXU3/db54jkIUIdIsIuVGyArjEX0b5Hb3xBvw1f18Wj/Ol3Eq4QrX2H?=
 =?us-ascii?Q?evnt3svjWJPASFkzROvohvlJJb9D1r93VD+pEZGHdh5Brj7PPbs3/iPNyOWq?=
 =?us-ascii?Q?sVLT+0pIbpVJzxjhX+2DnEYS4rdVVhOhDGhUaN/TCYP8Dp4EbjZmnyIabU6B?=
 =?us-ascii?Q?mhEgA44CQqRO1Y3WXY/FjnASn5lE/qwxFEvvlWYlz7FP2WYTauUoidbxbAvY?=
 =?us-ascii?Q?ctO3Bu2pB40BWWMV0tVvp48TgR4dPDV1avzONA8j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c8c2c1-2747-45fe-48bb-08dbc4e2e17e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:04:53.1477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5Ih1tx4dD8waJgXxI7foQgnMI4Gf33UlSXqBLoaHabpciuUeqjvxrwo8pNQIo1L8uAjPgqbphnVNWMyMcqexw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 03/10] fixup! drm/xe/display: Implement
 display support
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

On Tue, Oct 03, 2023 at 05:34:50PM +0300, Jani Nikula wrote:
> The display device and runtime info have been moved as part of struct
> intel_display, and the ones in struct xe_device are stale.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 5 +++--
>  drivers/gpu/drm/xe/xe_device_types.h              | 2 --
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> index f739858d17e2..e7c9b4ea2153 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> @@ -206,9 +206,10 @@ static inline void intel_runtime_pm_put(struct xe_runtime_pm *pm, bool wakeref)
>  
>  #define intel_step_name xe_step_name
>  #define pdev_to_i915 pdev_to_xe_device
> -#define DISPLAY_INFO(xe)		((xe)->info.display)
>  #define RUNTIME_INFO(xe)		(&(xe)->info.i915_runtime)
> -#define DISPLAY_RUNTIME_INFO(xe)	(&(xe)->info.display_runtime)
> +
> +#define DISPLAY_INFO(xe)		((xe)->display.info.__device_info)
> +#define DISPLAY_RUNTIME_INFO(xe)	(&(xe)->display.info.__runtime_info)
>  
>  #define FORCEWAKE_ALL XE_FORCEWAKE_ALL
>  #define HPD_STORM_DEFAULT_THRESHOLD 50
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 0717839ae964..62e1a875980b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -240,8 +240,6 @@ struct xe_device {
>  		u8 enable_display:1;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> -		const struct intel_display_device_info *display;
> -		struct intel_display_runtime_info display_runtime;
>  		struct {
>  			u32 rawclk_freq;
>  		} i915_runtime;
> -- 
> 2.39.2
> 
