Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA3CCA9EBB
	for <intel-xe@archiver.kernel.org>; Sat, 10 Oct 2026 01:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8CF10E0DB;
	Sat, 10 Oct 2026 01:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eedj2IUA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F18110E0DB
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Oct 2026 01:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791595003; x=1823131003;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+CrBFAtaWfLGc+9x5LzWpGI3sHTMLDuyYyoh6KzWJXU=;
 b=Eedj2IUAABM3yNUdbt/v4rkTJt56FUXxqv6caifM7fmSgVr99XUcx3o5
 c1JLWmPEcKcRtv+G+/TptGHM3cB5HpufDt6Rk8PGQwp1DgMAw0s+UJXdl
 5DrtuxjV8TvWSqe/w3OP8iBwBs8n6BXQ232k7vjQxydsyoz6lfT9BHpu6
 cgec5G4n5DdbVTmGC7mirb1rb/offal+16yqEifGkwyLX3OcXQvii0cXd
 +Cr8mMh6va+g6OVme87UT9wfJ59HDfJoWCXwWzkxYZFfxIhYZ3fN0CBld
 nhClYcqUmlkmU95AdQ8+fYBV2CM9wUQUYoDszlep2DHEqbqY7n1LYbp18 w==;
X-CSE-ConnectionGUID: GtwcSOLqTJGzqj1h8Urz3g==
X-CSE-MsgGUID: TnfTJHfGRbmIMEz7b/7Biw==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="402912"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="402912"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 18:16:42 -0700
X-CSE-ConnectionGUID: VCPUbISYS/6tt5iTm+AWFQ==
X-CSE-MsgGUID: BWtLjjMXRyW4oPr98qWy4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="898409"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 18:16:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 18:16:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 18:16:41 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 18:16:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9sIN4DRdiJrCnAnV8nvoZwAnG97F2yQF9eJzaxrG2kCHopaUnBNDOamAGoMSe1h6IiRrXejrSo7IjnZPORoYYuynYUcHsdUE4ubAsNgaiBtT/AifeClpgKlsx0QUeZE2NYHOP+fup1pesETxyKzY1XMXAznx2PDPYqzC610/jcyESuH8dMjgCs001FDeTwsS+lzPhlI0uzjh7VCsTPi35p/fzLnSNT1CvGZb4TbM+WnvjSV9yWehKuYt9iuKv5LYBTAjklbG9RFMIwj6FzJOe5hha+iVF/k0gpuLdTrYciPKo/Q/F2hqG33kMMLHOuhewDm89hJe2MpZy60lzhINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0e/I+fxtCfT69s/LbFXgYJYs3by7BjICz0Q26Zqmuk=;
 b=rEgcUjOq8+wYy2NcPmcQ1iqou1q6lfCqxqln6mXtrLGIlIVeib1lSRo2NQnv6LwGiaYAiJwgAuj1lxI+adpU2smj1cgTHHHuJtrWHZvbqzYWs3P82sp3Sn8SoiTxY83aTIJajC4gNiPH+ENlhGpRh7p1//Xl+EGRr0yYmaupC+g4smeZgDhk0N5UemqqyCNkAAp0HQqLrPvXF3gir+t447eWeFRc6zoEG4b+5m0KMDzZBwvXAHIV1MVXFcl37vXgrT/5CkKPujmaW36zdk4t6P8xDmNqcS+eSMi0iqdsNiWSLfOzyj+PDpkBi3KrYnTAMrI6McjRQPIgZD30ckZt3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Sat, 10 Oct
 2026 01:16:38 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.015; Sat, 10 Oct 2026
 01:16:38 +0000
Date: Fri, 9 Oct 2026 21:16:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <lukasz.laguna@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH v3 3/5] drm/xe: Make xe_device_declare_wedged() IRQ safe
Message-ID: <asmR6PW_tiwAoDXu@intel.com>
References: <20260907083541.2194747-1-raag.jadav@intel.com>
 <20260907083541.2194747-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260907083541.2194747-4-raag.jadav@intel.com>
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|PH7PR11MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fddaeb7-edb3-43f5-7d90-08df266c21f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|260925022911599003|261009223027099003|11063799006|260925021911599003|4143699003|260925021311599003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: mqi/FRGNGXJwCiBCFEABWTZFdYl2HgszX6MfdSdfh9nA48GQASyuvDeOGBxild6F3z0CQAZ75TNZQ6rEx3+/JhvrajQYvCWvmb/TDvXWwqrONdEG/RjQE1kmGalpe/LyzkVRsykFJdQvs0CYhCs4QUnVAhyiozuRK4uKFug50OrVI6iH7sbsx7qoB5BLBsFkIr7qIFUhzYRoz6JJHK6HK6EV1S4RYfCIUn7jc1/veLkP8BU7ISeYyq0W8TRRgEBGG9o7xU01XOBaIXeR+sO+fcJqp6W3Uk3AOEvllOgoqK0mS38E1pUaMEGpe671b0ejjyDz8B+iT4rhiVeXIg6i0YmhnxNNxlvEwflVaS0bADuwET5wiG9rLXU/Ceto75j48PZxMM4UENcknCd9oYfp5LuK3ZrZ82UFXShYTCCO9nYjJ2nToVVQLmm4hjW2SkEUVElSZXc9SIbxgAo2gSbwSjh3ZWzUm7JOfMIWoj1s/32VMI2iHSoFmDN51oCeVBpRFKh/IX1sQ77xbl9DrIrrKx11bgSxSiFezTDd27Q4xSyTT7HxrMdoEnCyn50tX6qZThh7UO7iG+SqEDk+RXZUQA0vImkfGzueLINES68yHDGDG8gtGz/uy8sgp+BTQ5uA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(260925022911599003)(261009223027099003)(11063799006)(260925021911599003)(4143699003)(260925021311599003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kz/b4aRI8Xjdf8SZDHTcbrAMhevMLh9fxmm68YWp2ugU76rRyyRjNdOZETRW?=
 =?us-ascii?Q?JyygfNY5CycrSbKHRfhQYhpVQ6X+Er5lnERijAADq7oBj066mBqC5rWA6KgW?=
 =?us-ascii?Q?4+gCn2U3ayYLIDOn2hkum28YkPuxLBHk9IPkpIwFk9R6mUnPcvL69VExEH/s?=
 =?us-ascii?Q?1RftVtLax40LkWf3rRnI+lqWRAAM2OxEnkHKRS2GeTOOcnBotIRpKsWT5sxl?=
 =?us-ascii?Q?20RnriomqSN8l6VdlEmb2x89/EB80TCfW1bdGmBxqe/fFyEJYKPleBS4u2mx?=
 =?us-ascii?Q?FeYtRr/jQNzF570iJGEnh6kQ1abtWi6AV/eu6qL/AI2bN41+BkqCseEeSZED?=
 =?us-ascii?Q?jsQ/WUTp87Dsl1PiuviqlkBTaqfm0en8OKQuKIDaNRKtWaoeRq8XrjWjrdSG?=
 =?us-ascii?Q?0stm73Thns0nEDfv9+3tEm43OFosunfcewFxAKcVNSyjr3ZYGaMVvLVFbzHH?=
 =?us-ascii?Q?sfZAir2FCF1mtSURGUDgKXupDr612Km+SomY8ZyGYQtRfjqQT+0NHBOG3jcL?=
 =?us-ascii?Q?ZcoYNFQJCe2qIe627mdvX3moq1DCOv7Pp6duUspAROctrfTlMw3Rjzz2bYBV?=
 =?us-ascii?Q?ulJRE/ql+QwWpl24kLlW621sEApQkaOQAHJKD/mMTQAgfiPryg1aPFmAlYG9?=
 =?us-ascii?Q?8gifPtMCcwMM2+kztsnqLxXAFdVp9ypRU0PDSfNuEWqhFm0jPFFBOUfSI7uV?=
 =?us-ascii?Q?obaoT1hqUan4jirSxYSLjJFDqs7/zrFvt/rAMGpIz1mhQAaFaPzRFUt3LSrx?=
 =?us-ascii?Q?vtWXm5X7421VvApsKvdhq8rq9anlKFVvzG3MWYrib8Hfdo8cMesHkamPjdjg?=
 =?us-ascii?Q?gnAPfZIxbjSmjuhOifu+txcH7iG8Tf+ZCchTYYyyNCJkEgGT9fWYJA5FQ1+q?=
 =?us-ascii?Q?0gj023qWOIP8nLS+wQWuZoV/ONzoAANtEhJxth6VPB3kvFKkqY4XObnn0w/G?=
 =?us-ascii?Q?wC0OiosbbN5D8a9wVys0AQgCorw32PEiGm+SzFUieiw8wfAjpRGjRji92Xzk?=
 =?us-ascii?Q?VxM3A7At8fYbqOZr8n8HSi1x7zuWeKeXLNgc8hTanO3SjPRdCPgXIxsnps60?=
 =?us-ascii?Q?UWfdD6MSWFeBKutWvx6qL/5oWEFlgLWBhq/RMmXQ9xbyqF4rxYmj8mXWk0Df?=
 =?us-ascii?Q?iOSLrGv5bWOFZ+NeexM8R3m0RFtz0aDSbJ7lHEeEdmGXv3m1moR8cWBWTPSu?=
 =?us-ascii?Q?7H0gz9T+sAFIknBf6Xn4u8NnqYrQsFmyBLwOgXHl2GVZqbbysUAB8PnHKfoC?=
 =?us-ascii?Q?eaahcxDzUJAYzvbXVs3gODbA4776oBuWVoc0R3yJ5FO9vAm5ZfoUgYrOrlhL?=
 =?us-ascii?Q?Ksr8aaqzB09bbJZC2WHQpngKZxEQncXJLaoMHb0xRcoN5PR5nGTtzV/RJz8k?=
 =?us-ascii?Q?DCEfp1HTvAkQa86ZTS26hfAzn5+ZAkul8CDaAOOG0bNEWHzkltbpJZkFPi1a?=
 =?us-ascii?Q?ZwT8HdNLqP16MTfCpnReddVXQdfQCbH/EyODJjr42QQmoHikmmUrrxdpgaec?=
 =?us-ascii?Q?Eg5g8x8P1CUhTgciqSnMImA8V4gWt9c3LpD8DsCXomimsEctLw4ieFEkZHON?=
 =?us-ascii?Q?3N0IPsw6rxayJ27ZCMKhTqAJzEa3dj/6wpbDz3V22s9A7m9LfBP/NTDKR/tB?=
 =?us-ascii?Q?y9fFSAWaYK5mq/CH61557oggUvjA5f7M8JQ+Kg/gaALjuDCP1lrhBS28kPCi?=
 =?us-ascii?Q?8EZo7tAtfGHvAsS+6NszA9/+UOGxSOSVmTqaH2MbpgXDhOymNVppTFlmFj0D?=
 =?us-ascii?Q?/cQHNbwNr+b3uCEaFT/ibJvVt+h8SWI=3D?=
X-Exchange-RoutingPolicyChecked: rxb6HLT8wcEdrgeg7/Mbf3ngFa0C63trAAlFyOj5QH/Pwp1eSU/5esNN0kQMnrZ3MS6lDRKEyhSP7azxEPORnLF1fHL/bqSXCt5NolH0qkTXyIO9+9rkq2wMxQ/bklBvbno0phB/RtcV3bhls+Qu+fPrLTexrjFjQY5yF2S7Y8Y/ETjl7ojBycLabwXq8Do8ZqPXYAedivmr+sPXnuCw2ahNG8pjh2ka+NgRce8/FtI5+Yv470hV6V5l9i1dC8IwvB+joUvvBZg3t6TpBqKLBPONQZgIz4arqwbwBzqzPvPk3+mb0Sw1XhNAaT+TlNqjv5Mo7lruoQseKFzURLE8ZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fddaeb7-edb3-43f5-7d90-08df266c21f1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 01:16:38.3927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NzE1j3Zc0MsFg+Tyx7hNUlMGcicZ1YnjYlOXH6I0P246ngW/DdeYWD9PFPAjpVSHL4Hgbj1jzS7OnqlXwq8m5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
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

On Mon, Sep 07, 2026 at 02:04:38PM +0530, Raag Jadav wrote:
> Currently, xe_device_declare_wedged() implementation wedges the GTs and
> sends wedged uevent to userspace. This is problematic for usecases which
> require declaring the device as wedged in IRQ context, as it allocates
> memory for event buffer and acquires mutexes deep into it's call path.
> 
> Fix this by deferring wedge handling into its dedicated worker, so that
> xe_device_declare_wedged() can be called in IRQ context.
> 
> First user of this requirement is introduced in commit def675cf3f10
> ("drm/xe/mert: Improve handling of MERT CAT errors"), which declares the
> device as wedged on catastrophic errors received in form of an IRQ.
> 
> Fixes: def675cf3f10 ("drm/xe/mert: Improve handling of MERT CAT errors")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> ---
> v2: Split fixes into separate patches (Rodrigo, Michal)
> ---
>  drivers/gpu/drm/xe/xe_device.c       | 51 +++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  2 files changed, 34 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c4194507118b..1daa02d39f3a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -770,8 +770,16 @@ static int xe_device_vram_alloc(struct xe_device *xe)
>  	return 0;
>  }
>  
> +static void wedged_work(struct work_struct *work);
>  static void xe_device_wedged_fini(struct drm_device *drm, void *arg);
>  
> +static int xe_device_wedged_init(struct xe_device *xe)
> +{
> +	INIT_WORK(&xe->wedged.work, wedged_work);
> +
> +	return drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> +}
> +
>  /**
>   * xe_device_probe_early: Device early probe
>   * @xe: xe device instance
> @@ -840,7 +848,7 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> +	err = xe_device_wedged_init(xe);
>  	if (err)
>  		return err;
>  
> @@ -1453,6 +1461,26 @@ void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
>  	xe->wedged.method = method;
>  }
>  
> +static void wedged_work(struct work_struct *work)
> +{
> +	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
> +
> +	/*
> +	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> +	 * hangs, so wedge the device with 'none' recovery method and have
> +	 * it available to the user for debugging.
> +	 */
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> +	/* If no wedge recovery method is set, use default */
> +	else if (!xe->wedged.method)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> +					    DRM_WEDGE_RECOVERY_BUS_RESET);
> +
> +	/* Notify userspace of wedged device */
> +	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> +}
> +
>  #define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
>  #define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
>  
> @@ -1493,26 +1521,11 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  			    "For recovery procedure, refer to %s\n"
>  			    "Please file a _new_ bug report at %s\n",
>  			    WEDGED_URL, XE_BUG_URL);
> -	}
>  
> -	for_each_gt(gt, xe, id)
> -		xe_gt_declare_wedged(gt);
> +		for_each_gt(gt, xe, id)
> +			xe_gt_declare_wedged(gt);
>  
> -	if (xe_device_wedged(xe)) {
> -		/*
> -		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> -		 * hangs, so wedge the device with 'none' recovery method and have
> -		 * it available to the user for debugging.
> -		 */
> -		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> -		/* If no wedge recovery method is set, use default */
> -		else if (!xe->wedged.method)
> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> -						    DRM_WEDGE_RECOVERY_BUS_RESET);
> -
> -		/* Notify userspace of wedged device */
> -		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> +		schedule_work(&xe->wedged.work);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 180d450a6deb..7d83f79f27f4 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -534,6 +534,8 @@ struct xe_device {
>  		unsigned long method;
>  		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
>  		bool inconsistent_reset;
> +		/** @wedged.work: Worker for wedge handling */
> +		struct work_struct work;
>  	} wedged;
>  
>  	/** @devres_group: devres group */
> -- 
> 2.43.0
> 
