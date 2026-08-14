Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2776DC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 18:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CE210E588;
	Fri, 14 Aug 2026 18:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZWkro0t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6ABE10E588
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 18:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786732797; x=1818268797;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V15RVSP+ms4xLJVqteh3E9eKb3UJrQhESeb137gUEp4=;
 b=QZWkro0tZ69aghdOZVS5lCYDDSALJU8Ir3VHv1Drknm3ztVqwqV/cTO3
 VbfGXMnRbd0GdS7C/8cbGI3rz20gM8V6VLSd1ErBYh06Aur/3sOhRZsw1
 Y9ucmBq0moIaIki7ZNwNLylhgbxZA0hEskFJVw74+Rb1WEHw79Y9y9UhN
 60VFdJfwjV5BYDWtCbhvH3s8vRmWbfOlGPdeqKWgj1E2iq9pTIV93+6Oi
 PO1IBjJ3a+AZWypputgjqx6iBkWMdpVvd1RupVwD9nPZT6IsAPcYt5MtN
 4uFt8c+q4C6NI+GUj0lFN/19eT1u7YV1FYYg1Uv2/Cj+4OTi1Q41OG1ic Q==;
X-CSE-ConnectionGUID: YvPbIAcdRdOFaFoVjgfGNA==
X-CSE-MsgGUID: sl0KSRv3QA6xRlbjOGbk4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="89834210"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="89834210"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 11:39:57 -0700
X-CSE-ConnectionGUID: pn0QdVqeRNKxlK0q8ibtpw==
X-CSE-MsgGUID: Ly1ktY6pT6ytdPTGR/6hTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="258074120"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 11:39:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 11:39:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 11:39:57 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 11:39:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p57+HFOs9scqEmpMh4UzAeH63b16uuafmTgr5APv25FuzKnjCFvLBahQQZMkuE8UuooJDd0wGQvboCU2Hxm9v3SzF9YoFUT06UC+XioQrUqQ+VtDMWvya08Pb6A8HlxpcIYu4p1mlXJH9E/xu3rg2daQQopu1KKK+HNETtd4POhJ9Rk2G2OKhdyw8gRlqUKC2QtOOeSdQKGQL7PVvCh6yR+ufometzS/VFPLBMtwuEfMefk+nOh9LK43x5B3IJbZYIRW/fOUg+jl6DPtL6GYK7MC/APPJ6uf+RJUHhTIkYBRA83Tm8ANjqVVmsJsSKk6P9sihslwKYuj3DTFNoUIMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owvhoN/IUIH8Ekg++a9pz8af2LsJzbmj+d3mcgsCj/w=;
 b=xtxJF71NYm+fgUM3kYr8HqaV2acTYkPwLyLRb6da5MeU1jyQMrPmI0orT/uY18CGz/R+MwmKytrdeKERnsAQraY1RvI/BcwgHyaxSVYpm5k9P8jI3wUGOe11XhxbG2OTUQIog0ja099S9jdVCl+T2pdx15p3SCN7D+lstsY97EQpxWy6rbHVu101LADRNvYUaIU8GI+DWviy2S7k6x+BXpS1TVD8rbsQL0akw0FaaSfDcg0ZfNpB+9s2RH7NZq88BQ7k38i901ohIf1mJZUS3rPlte9FNI0Ibs7RxdIlwi2ZgqjryxkZVs//ZOjb9vgc7YEIPwLOQNcIaKhS49ciug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by CO1PR11MB4772.namprd11.prod.outlook.com (2603:10b6:303:97::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 18:39:54 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 18:39:54 +0000
Date: Fri, 14 Aug 2026 14:39:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v5 13/33] drm/xe/log: Extend components list with
 hardware items
Message-ID: <an9g9HGJk6-pVUzM@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
 <20260814171801.13347-14-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260814171801.13347-14-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::6) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|CO1PR11MB4772:EE_
X-MS-Office365-Filtering-Correlation-Id: 8485377a-2d77-422f-2218-08defa336edc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: nqDmvvpNeECGi4/oyj0IWC7P9UpWy8p2vdxl0RBsgi/74dEijpvOCLYGIzbtgR0IUikk36bcYZuJqCvlNeqWgbtevvtMa7yNjy7JB0E5DKhquj2+CfIL86gyqDy0KTqjf2XJDVqcYg2ftONfPXHW+/q83UR5TwKuG1s81kJoiv7ODn1ctvtSFQAorzuIzb2Vs/48ctiZ42inLTuj/V1NAda6Q0r8SJTM6lNqf3rTUppEjdOhBmyfobO+t4XHkUQaa4YSmZ5/za1qKDNC2vqedhItWfy3LOgiTQRT/sekZkIz7BDz4WPXPaRIZbp/3La8D0z2SAnj+FMiTmstK6fvzrsnBxkvigLyFU0aYdd6GBoXIs6jdLRodMIrOdJdbSUPaRHpyyDhUdQ+FSeTdxvqRiga8JvWRD5gTydVG4NgHGTSK4e1VB9PZK9l5RS6BD376hKNJWuhBGVaMxXRAnGhqR3OwejrCNaFkv2y1gg9tjzpbdV5LmRTZECqFzFr4bmgJr3Y8+qK+PX5ai25aM89Z5g0UGiwrhue9GYNQtwVoftxuDoqLXeIuhNW2npTSSJqM8v7LIiEKM4EHaoM9GFxoNNA/H8MbCOEdZc7MyV/XT5XGkol9msaxBhEpOBWynrj80uGZkCIAL8B0LsPfcxalGPTwFKqJcTaZp32ZeZ8h0E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(10067099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6mEvstD61SpI7BF6SlNCIDI2f8k/9EaPaJ8YAn7flFUeyR4iYvQFw+tq/HgQ?=
 =?us-ascii?Q?Re0MD620LKdeWfrMxTtNvFQdZ0bH4WvOLC+us5GdCP8HFuluQ6gyoVOlotrI?=
 =?us-ascii?Q?rm7y11NJyrUHExdBpkDFGRiLd+5zy4Ol2ZhEqF2RU0Pe9CUB/VWs97C0QYIq?=
 =?us-ascii?Q?AezyuypV+QRcGZLCQUNaVLJHlx46h4k1d79Ds932eYzOn77yYfoOGSesAtLw?=
 =?us-ascii?Q?1Fq/EYE4w7PgwyqDv5tVe+V/bBM4kQ6/KEk4osj73R3XCjpXwYSCx7+17RbA?=
 =?us-ascii?Q?ZJcVZnRm8TS9DMU8g7CA4B/2N+dcCs0t/+N+GOqWaURtryVN4xFqBFtTmTc/?=
 =?us-ascii?Q?Bp2K2J2qfzAAD1G6R7OrRgn1XHhPp9r3oHixgaqoUHlnJ85l21NWE1jKFkq/?=
 =?us-ascii?Q?rUWXf6iKZYuHy84EF0+T+VeW4G0nkGJNjOvE+jJCh8M/AYFzn2sFy456V/6P?=
 =?us-ascii?Q?bLYnjxxRUZq6G7jLqzmJjt+yNYL5REJCCP0ENjnXva0lYR67FIsLdrnjB6Kf?=
 =?us-ascii?Q?E40rP/AC8BiiWh7SDDTiKEHWDr/RFPzA2JAR37MClW0FgM/Hn+tQoklB6Ntr?=
 =?us-ascii?Q?NJRBEce66hKPSprc+C49Slo3RzOMAfNFbD6uM25HOfmLVGBKtvRIN9wt+aI/?=
 =?us-ascii?Q?uRlFOzdm1i6UMieJk73gIlaFZ6UyDgPMgHCZn/940LBtuycuBRxcYs/kEG6T?=
 =?us-ascii?Q?Y7L0AN5mbrWkyP7rBgRoK7rmlWuhT8HgC3fN62tVezqCteZRkfXughpejc1H?=
 =?us-ascii?Q?5tmNeohj2hSRNiywQQS2kQVXstEVjBoW8EFIpkBah7IzSnqUiWqgbix7SXyG?=
 =?us-ascii?Q?YcYLf1d2KH5OumOy/wmtdbjkZxrHDjLLHSQhJe46TUk01jfWVXPaR09BmUrN?=
 =?us-ascii?Q?+6uNK3qeis4xAAI5GCM4Vqy+JBrVqKTRhxsQKlzbLzfQXrDXIiCM4pSP0hZP?=
 =?us-ascii?Q?z+1s9TlAu032DckgkUtgejaPqdvP+kYLJdRTdH6kaeLvKqw78zZLIjMrpbOQ?=
 =?us-ascii?Q?sEpeS5H4VWYNeTazFlak1mqGKIx0n0IAuItAm6GlYKfxMIR1Tjrsp4xAOVT3?=
 =?us-ascii?Q?Tc0jb/HavZreE6Td8gKlJSmOpTG2uMSZnTrgKh+MbsFTJ5f3JtrL0jv6/wqQ?=
 =?us-ascii?Q?uT159ZwKkFr4+qQVtx8r8MicICkIguD5fIuc0JRwxXkgI4fmZPrdL/Z9BXao?=
 =?us-ascii?Q?Vfq6874IRgvtM+IdklnWpB7zfDMDx6ozB6kuDQ6p4slC5EKnz0kOaQhQKbK3?=
 =?us-ascii?Q?71/HKfkRtSKrSRBIVrIhiLNBZKAFUEnoM/GAMpXvZYH51WVE1QvOgLmILoVF?=
 =?us-ascii?Q?ceK9+fqnBCM2cZs7A4hVD4GCcp5v4ry4u4a6P3hMnAam38f/rZGjhvdBpXTs?=
 =?us-ascii?Q?K1KFDmvo5a9CHBa8q3CqWrbO9mPy8uZAQHMsu5PvQcsvHjS+v2RGIAk1Qkg1?=
 =?us-ascii?Q?BiE5wWj4cegdinQoP0VU1G1iBhHkhrWCWRfs3WvuYlBmF1XtqOrRL52wWDDm?=
 =?us-ascii?Q?MTDb+URcyf4VUFFwYocmLAB1I5D36OlsE3NQczZIj6CCVAkh1Aur2SnKCiVr?=
 =?us-ascii?Q?l8knc/VqLAcZo/U9cmRt8S7on/cRvRo51rnWMepB1YujYp4RkHGliK0CmKDB?=
 =?us-ascii?Q?/cc7xTyw/ZC7JPUFaIXXJp+lcEpBTcJRwDQpBdefXwYdnLPTvj/gUfnwEXQL?=
 =?us-ascii?Q?hmh7wJ8aKPI4eiMX7l/h3Rh3IRzvLn5cBvZR+lkuAKhaoxAUcsC/dtt5ERYu?=
 =?us-ascii?Q?JxUThU0d1g=3D=3D?=
X-Exchange-RoutingPolicyChecked: hDb72mELZB7KmiiRbRPruQKdF7wKB/SgnitMrlH7q2EZYdGE5QWklYtsW32xwim3eYteDyOodXx5dw70YT6Jbd+Pel++oRr+XiBx41Mg1Q745u7uiqagZq6EwHAX8B3NtNMpwVM85DcGfso88KJAyir8Z363cD3aIcOK6WlLKHBDbt9AReAKjY9f5n0YE6RZ5BNVokn9ew6GQw1GOTarql+VNUvokV02q5LfpBPYTheCa8po5tNL0FevCD7R5KfH+ggPXdawcDrBFe11JgIYrOzTzVPLwU+r2tcKGbOudyHwQ1UZh43PBsoKrvOofgHWpX3un6y+tsTWkw68F3RVlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8485377a-2d77-422f-2218-08defa336edc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 18:39:54.6391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSn/tLOrL58hQ3vQQWWM1qL86Ek8eTWGb9kayxwiOt2ELzShJbQegAK+2KQzOrJ3KQjwgT5mILzBCQk7Y694/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4772
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

On Fri, Aug 14, 2026 at 07:17:39PM +0200, Michal Wajdeczko wrote:
> Update our super macro with new top level hardware components.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com> #v2
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: follow enum xe_ras_component values (Aravind)
> v3: use same COMP tags as in SIGID (Riana)

indeed better,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/abi/xe_log_abi.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> index b38db5e9fcb5..d6105520173e 100644
> --- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> @@ -130,6 +130,10 @@ enum xe_log_location_bits {
>   *     @SIGID is the default xe_sigid for the component (without the XE_SIGID_ prefix)
>   */
>  #define DEFINE_XE_LOG_COMPONENTS(define) \
> +	DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
> +	DEFINE_XE_LOG_HARDWARE_COMPONENTS(define)
> +
> +#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
>  	/* */									\
>  	define(SYSTEM, 1, PCI, IO_BUS, "Linux PCI Subsystem")			\
>  	define(SYSTEM, 2, DRM, SW, "DRM")					\
> @@ -157,6 +161,14 @@ enum xe_log_location_bits {
>  	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
>  	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
>  	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
> +
> +#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
> +	define(HARDWARE, 1, DEVICE_MEMORY, DEVICE_MEMORY, "Device Memory")	\
> +	define(HARDWARE, 2, CORE_COMPUTE, CORE_COMPUTE, "Core Compute")		\
> +	/*     HARDWARE, 3, RESERVED */						\
> +	define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")			\
> +	define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")				\
> +	define(HARDWARE, 6, SOC_INTERNAL, SOC_INTERNAL, "SoC Internal")		\
>  	/* eod */
>  
>  /**
> -- 
> 2.47.1
> 
