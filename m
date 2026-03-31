Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC3110F9303
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 22:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D4010EC3F;
	Tue, 31 Mar 2026 22:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jvey5ZbY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F3110EC3F
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 22:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774994876; x=1806530876;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=owzd5WnDPbhwb8Df56uRU0F5SBO6LgF7bM19XXG0cng=;
 b=Jvey5ZbYyqg2pu+1RN+nwhCLIvpRSQ5rgaFhL4K/wjfOIboviwYumygi
 pDJrPMV+cpmwG3ubl64x/XyTzacIZkXrWgg8pAQnd3r/Xef0hk9SssqFk
 TGMjvNT+Qhb313mZzUI8upatPxfPs1QsUtvXdSDVr0eEo6y7y1EGdnENm
 sojg+CvqBSboaDp9QbFAOa4jur5DXBe689qFX2kp9NpUtsCgCvgmVBUyp
 AgSNYUSiV+593cDxXVXtLtrndlpr9mNVNl4LyRv1CXN+BBHBKw1Fgt1qp
 l0n/gnHDJAi+7pn7DLnzSIN7vObdWbthjSYvHHda/yuf2fTJYhutCA61t Q==;
X-CSE-ConnectionGUID: aK2tij1ORaKFV9p6Q+ouqA==
X-CSE-MsgGUID: ZmbL4Jg8S4mcHxpLzxhIew==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75985982"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="75985982"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 15:07:55 -0700
X-CSE-ConnectionGUID: aIzmemUDQvmgSIm6dSVUtQ==
X-CSE-MsgGUID: asIMR30CTBuGuxWDXkXjeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="230559935"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 15:07:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 15:07:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 15:07:54 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 15:07:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epzXFT6v0f5QgkqkUrPusPVUyBj9L4ql9whJFNTKvM6t+GCR6AhgplmdqA5EOJKPf5qj5uQPTzB6t0WcEtMZwgFpXnEVIteYQxoJcro5i1aa+JaU/AqYAJsx4RinCROKJa332ccHLztqZaZIjj/PkAXL0nij4MTmQJL6+PgXJ7LSVPWYidrN+pwTpqgtJ5YU6yzqHQnQj9TO0cApVDBx6ZdP8UK0xDiKCRZUZw65mpcMRVx8EtXkP0kNickZrJWTPYsduTZpP4FxhBV4TM2mMDUWhuCS844PShvUN1w0fJqucbYzqQCqam2SxuIQ8DUBCzOe+q0OA23xxDVG7aJsrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aqo6whZtp3iqvaAR2becGbWPS4sQWLrL+ozvprszwLM=;
 b=OW5yLj1H6MKb7VIq2cimtpfyR1zQI9glGNixsqx3ebAkfsDnpu1+c/trYboop/MoJUDaSSS14oHEyfJ+4R/aVfu7I77VjZDbRIZdxiBK1NmqhbsyOKBN8RvSMCiwEu4QiQBB0QGkDp42FqCseGA9fD8p925sTcFELj6kzmP6yhFn4wO2xku6yZoHorY6pGZ27bBE7dG43h2yYyMKgO/O+ii1P7dGtp+tdgZ3O8R5iYQVKKus3t5U7H7nxCIovFihT75UPXar2eze+CKZl3v5tFF8b7vbOZVO1BcQANIArSQsklbGNWQGTf3Hvxv1uy6H0AdaWipYJsXHHdhS+pj3FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB7552.namprd11.prod.outlook.com (2603:10b6:510:26a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 31 Mar
 2026 22:07:47 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 22:07:47 +0000
Date: Tue, 31 Mar 2026 15:07:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>, Dnyaneshwar Bhadane
 <dnyaneshwar.bhadane@intel.com>
Subject: Re: [PATCH] drm/xe/sriov: Mark NVL as SR-IOV capable
Message-ID: <20260331220744.GD183713@mdroper-desk1.amr.corp.intel.com>
References: <20260331152259.58270-1-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260331152259.58270-1-jakub1.kolakowski@intel.com>
X-ClientProxiedBy: BYAPR06CA0051.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: e04dd70a-8e08-42a1-fa29-08de8f71f0fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: anifBZQLm7gnHIOBYMGK5iFHBkz7cPVHNJEK2wG+AtKNMxhybE8Z+PaxFG0emzKenke8pUrvziABb5j1NBvEQ8T4mJCD7BWqKX0J0R2L8wdrdwuQ+HwlBFKy5sF/l7ZCSxVXgk27Ya8UgBbYdLazG+9lmIdf4r2PiEKFJWzxzvtqWA+ZFmHqBC0xbvFlpGUIzm8/2/ojg/EcQAQYAAS3vXC9vKFPKJ7HPCbBSOwpkxzxDqL81ps/ixRVtnWVqrmUo8PYM3CFxVctkSWsPSwpZY75gEgoiyeO2lQC1T90z02j0C1HG9+0RxPnVsaHI5tUtbkzgXZ5GiwWNr0XMJ2zTpZW9h2uSrARdEtno47S9qiz7oVdHxto9vaZvpCtRF5UG0zlHwu4Zz+8ngeC3f8H9QrtMinUWCn5/7swOIuxC7qxLC+BVhqMw22R76bRAF9KvQwAtBEe6S9IMvBdVIGsO7bic9p4Pz+zLpV5X34oyXubj4a/1UywpyrraDgzqIcySWBA64XOWFNwseDlb3MPfh9xieE/nGwU428MIwnPHkztgR1h/Dw5sGrru3WKIuotlYe7hV066QntfxzhoueY63+wcMY5u+EoQsZFO/+j4WMVOog9DV3Bc1EjaSc7HJRQskQ6JbwDoR4tYXQR1kRYsBTt9oqJDBz5Acy18UyHPjrMkE6HT79Roo8XpQBAQtrvCkU4i9oZrIAuW32GOQJZTXu0lMSkbuF3NCEtNJb5w4k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GkXAVxi7aUu2xGlvnLmUjr4UR08a3PZ4HWwkJ1fTQzSQ/26xd4Xmp/d3J6?=
 =?iso-8859-1?Q?CBS2Xn803uUHktnrR7sMo0yDhMi3L0Uj8k7gY8q0IQdkwpYWBakQ6l11+L?=
 =?iso-8859-1?Q?GPq2GhOO/tE2nBcr/xFJngc+xYKDCcwQNGj2i6nh1FNMD4C03D8EKkMGdY?=
 =?iso-8859-1?Q?zf/XpkJvgkXpEBfVxIa9fuq3EE7OmOI/T0sNiH7kZ6iSk1T4yw76qTPGKj?=
 =?iso-8859-1?Q?jxv7Zg/1iM//x6MciG8I4PvvXKuTLzVBd4FcfCwTBEOZpSMXEG+7iaIYZX?=
 =?iso-8859-1?Q?jAl8NCaRojHWls6MCl74wcrrndvyeVtvniNCQ5HXElJsUcTN+gMAnKkah3?=
 =?iso-8859-1?Q?vqP4wNDDWhn7yirbS3P4sKw+2WSRi/03U5moUvrwLTG9RijyWXAu5dHC4J?=
 =?iso-8859-1?Q?urZ3CBkKz+NU4aAIFeJg3GwvT6zfhD3oJ1W5Tx1htJHJAi6xUYOcE6aTgk?=
 =?iso-8859-1?Q?0mw8W01/JcbrA0qrWmaF0HjMsflvVFVWQvnKPCbGLgp7ZFWav/FnhH5CRc?=
 =?iso-8859-1?Q?Ew5YxBLAa9fo7gdR4s/xHCqSCBA8vIzfArR4YP1GX0gE7Ns+DEzP9ZOQsd?=
 =?iso-8859-1?Q?NpFP2WBB8K/liPmO1xcPSKBBWs+vTzqf/llXe+LWbw1DnvK9+OgFt6pKhG?=
 =?iso-8859-1?Q?RCVhsm1Gl4mauSrxC9SxjMVug6nZkbIA5zeGYZRWVUhob2lyTGKlr9CEm5?=
 =?iso-8859-1?Q?2Q272SVwZD1btmjdSqCQtarnZKynt6BYZReEq2u9azWyFLhkgOJ6OwYknE?=
 =?iso-8859-1?Q?61f48Nw5Tnu6iVK29VrhHOFefctxMOq+TnSz8ZfdHd/KfoRl+6Jv/b+JEV?=
 =?iso-8859-1?Q?u1mgspK0FPXM3mN9XJFl8Ni/zPX+SeMB8dqfGSoJiZsgtWzEIVR1Zu85Yp?=
 =?iso-8859-1?Q?A3Eq1S+jcrfvS5OG/yZusz+qQtzfik6RYDamuIGGK5jAiixzEosGBOibsf?=
 =?iso-8859-1?Q?7IT1FJVa62XEpgeuHr4g3N4t13FCB8IxROcoTB8ed+rfwz0KyFc71t5xY3?=
 =?iso-8859-1?Q?v/qKAPGS6hk7f6gxVWR6LfElLJBG4Oz6wM21xr/Q9Z98tNwcX9kb9U16sz?=
 =?iso-8859-1?Q?FvK0XHxZTdSmm0B306k1gAVE4A1mDp5mR2csVGCIUMEom0GvweC54c35+v?=
 =?iso-8859-1?Q?QVoWBlxUdUzmoKqSj2Du8qlDbu9LqChf5Kw0oZynCvzqn+Wtbsdm15yrAW?=
 =?iso-8859-1?Q?5n49VEwBTmIbZ8Asc1ONndSCAc/dx3vQPFHR2jbWRtGebFeuKc+4AcCg+z?=
 =?iso-8859-1?Q?qfGcUAj/R/sfGl7NtpYY1+ktSGe+e69/avZaIft84Qr0sowrnKk9gj726u?=
 =?iso-8859-1?Q?vKBxMjppkS6ZxsC3lL6VyqaISWlgTyj8knx4SEoxm3oiM+L5+VdV8VxLWH?=
 =?iso-8859-1?Q?/EoA5NXK+Fzg4XiwSALEtp4vqF9V+o5F5R5NTmw9l1aXw4iWbNm0WCnMri?=
 =?iso-8859-1?Q?otgfStL8YUIKnSGiJmKH2/i5+y3hOLFq8un/MLLodSCsKKRlaT+zafXqVh?=
 =?iso-8859-1?Q?U9muxW1qIZFwshcGaJU1m0SOC3agLXBLLfPTcPp2RLoj42oiT5VDrKzS/s?=
 =?iso-8859-1?Q?YuAtw/G2tLn6E7wVkXhSaSWhRkb8ZJKw4MVJxTIDP3+iH+NCjQXZEXVHH8?=
 =?iso-8859-1?Q?MT8Jvt8fz4hmzQJAnyA5cdOMYGvEzATZVPBgARoUyouCDabvjF3jmxQKtM?=
 =?iso-8859-1?Q?JvF+3YIE+Pm/k9T+eZXu3ae7cbNOhPrp17H0rUICcbsykbCsJk+4zsHAp+?=
 =?iso-8859-1?Q?RosXFD8yHYSx9XKW3NZbtcS3y5ZKbdJPonTXP5lqV1ZKLwCZdroITt6V95?=
 =?iso-8859-1?Q?pFfzu39RkGPf4jCg8I0cieOL9rHTLP0=3D?=
X-Exchange-RoutingPolicyChecked: X02nhCD4WhBiHXZ9/ru6LLn+7lKKbSryvNmxXcu8fgNfYzRaRAAAm+VULDkwdldPg2aHOdGfFl+eO+1/hsOuEcRuTj4I42ImHIvb2aLm1twrL+xft7VXEHTFWwphhG0J6tKFnUg8Q+axm3CytRTr/E9Ku7Du7FtEtpad9Ri6r6ch+lX/NIWyEVeg+ePSUUxSd/EoQsEfG45aivSSt64Gr/QwPmHxmaES7PIJ2rxT3PVJrf2Zh7qda6g+cKXeVf1an5CkRpz4li2KT8ajGVMEuUMoHZR6SCCNH5FHBEyzHSkavpd5vU3pKF/DxZmm6RftJAe5ryryWvVKIiyn5MR3fQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e04dd70a-8e08-42a1-fa29-08de8f71f0fb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 22:07:47.1755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzt8MFOVfVJ+ESm/Tl5154YxNVV72tw7IDhJcnU9ftMjTLl0KeDsrP9RNzMQOXexGMOAXoz+myH//hLR9HCGBIFhNQU8KvzFE2Z0mIKBEFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7552
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

On Tue, Mar 31, 2026 at 03:22:59PM +0000, Jakub Kolakowski wrote:
> Enable SR-IOV support for NVL platforms.
> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1df3f08e2e1c..e7d7f0b6b998 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -443,6 +443,7 @@ static const struct xe_device_desc nvls_desc = {
>  	.has_display = true,
>  	.has_flat_ccs = 1,
>  	.has_pre_prod_wa = 1,
> +	.has_sriov = true,

Since the structure field is defined as

        u8 has_sriov:1;

it might be slightly more idiomatic to assign 1 rather than 'true.'
We're a bit inconsistent in the handling of the other flags in these
structures as well.  Anyway, it doesn't really matter that much, so up
to you whether you want to change it or not.  At some point we'll
probably do a general cleanup to handle all of the flags in a consistent
manner.

Since we don't have CI setup for this platform yet, I'll let someone
from the SR-IOV team give the formal r-b on this patch confirming that
we have everything in place necessary to flip the switch here and start
allowing SR-IOV use.


Matt

>  	.max_gt_per_tile = 2,
>  	MULTI_LRC_MASK,
>  	.require_force_probe = true,
> @@ -481,6 +482,7 @@ static const struct xe_device_desc nvlp_desc = {
>  	.has_flat_ccs = 1,
>  	.has_page_reclaim_hw_assist = true,
>  	.has_pre_prod_wa = true,
> +	.has_sriov = true,
>  	.max_gt_per_tile = 2,
>  	MULTI_LRC_MASK,
>  	.require_force_probe = true,
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
