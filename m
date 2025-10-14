Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BE3CCD193
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 17:37:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B18B10E159;
	Tue, 14 Oct 2025 17:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVAI26EW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F77510E159
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 17:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760463424; x=1791999424;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UJV/uNVCpRnwoKsoQTxHQkuXwrGVAWjEsqXjCCOrQkI=;
 b=HVAI26EW/YKNCloM5YyCGYqEnj1n7nc8/fhLs6P/ZR1UKbHK1pNkNLq5
 BCOyXB59pmq5x5sXNyYDREDPUYgPVZeTbLzQMxLiLxMXlr6z6iCZiY5Pe
 zHZD4BYv3QaZqq8CvFzgc72ImqE2Jo4v3ayxAepoa9C3yiBF5XgLSedQT
 IgJ4DiXHNC5+5RNmgFkhbESPRqm35Vch6xIkhfI+WPAgCQNrZ9BypWWI0
 1WZa7nyHjIAA79yXSOcaichoc2A83kF956ajoO6QfQ69F6/jAX/vrFvG4
 W0uPd/xQJr8aLeMS0idc2b/GFFQJ8+loLT36SUJqZ1uuuo1OBFjoZHNcl g==;
X-CSE-ConnectionGUID: CxpEYU/GRWe0Wi6ksuaSBQ==
X-CSE-MsgGUID: 1yWglmctSCOnekTliYUgig==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="72901031"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="72901031"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:37:03 -0700
X-CSE-ConnectionGUID: iNKL2X7nQxeNr8RlTMQ2Gg==
X-CSE-MsgGUID: qGlV0ldRRg6PYEEi3s5neg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="182420414"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:37:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:37:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 10:37:03 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:37:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocLv7h/DL/XmyW6oZ4IFVwZl99DwCwQILIKZOfWEwnZnXZKyhDoRbHcf2Jdf3K7mv2y0R1YdIX+qU5apXZNT3D+wC6MQ86jWCSR5ko4dhJxUfPCZCe8E1VNkqq4m6ohUqLFO9ALlgs/iMLw1eKrjiHj3OdzekdSJRFboXG0rXVNCnPGOKXE/c8XCs8S58pT5e1pBotLdzeGKRiwy3Vi1WCG8Az79gWlzlmBnwuJOthGrl+GYfxUQtjLzbPP4ubTwrzXuStHBpOA/pEEyyh+v16sJ3IQ6p7od4MtDTpJpg1WXR4HcIUVT40r6bOQvmInJgK8ca1H6R1VYb78cO3Idrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MrAt0PL8TDbO9uSfy2IE/mdx+9szhGf2/1iDbbNmME=;
 b=wanVOSa504BZIyRytyDD9kUxOkNnKbh2akac6AXCB7UDiA/k+0n1TIgM23N2/gDcwcT9Bunfmz2c41jbSaRXxQXwD4taLxjL8AnYl0ctvxz9V9P81uVkNooE3AbAKeuIsRYp+1K4DOp6Nr7k9h9TuCVLPSpGOvqZ44q37Y7C3XmNmDmzruKfGhCdZIzCJu8xiI54+8258PYXOq8eUHkjREdxDGzIcM1dpebyPLrNirfV5WZj/ZjULYx1+3oKRQiqpB7owYRRGJOxw9cm0xHphdLc8mdwju/5ewsnBFTvI0A1mYOe3PUrj+T7t0dPwALGnSnw1XUCjmJqk2rwBCy6Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 17:36:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 17:36:57 +0000
Date: Tue, 14 Oct 2025 10:36:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 17/23] drm/xe/xe3p_xpc: Add Xe3p_XPC IP definition
Message-ID: <20251014173655.GW5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-17-bfb74f038215@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013-xe3p-v1-17-bfb74f038215@intel.com>
X-ClientProxiedBy: SJ0PR13CA0069.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 097367cf-0054-444c-2c87-08de0b484628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FHpkv1y33S7FIcGku/VpNTnN9x9GvzuzOHTSHKZGddkZKhUxU2qB+GCqV4Kg?=
 =?us-ascii?Q?1E0ClBHuOqHoRfAL0SuH73F8gYtuYWeZUgmyKSWsHsnCHmBrz7UJQhCIDl7k?=
 =?us-ascii?Q?612AU3rRe4zdrnvzc0oOpgMhjC8rmvmgvc4Sq+xOZ7I2/weO6h6NjUakCdtV?=
 =?us-ascii?Q?9yh/x7aD3ZV+EUrQN+bNk0cCqcZGuuSEQWjFbleX7+Ka4RDSdSJn6KSYBN1V?=
 =?us-ascii?Q?31pKPfzK9QKMH8YXDufi8Row9vUOKAUtA36lb3EQWydF423TxD8kaiAhJ94z?=
 =?us-ascii?Q?uxAF1cElVWDU3U4nzs6gPTRsOIlu2dSHFnslqCEABRJjAZOhTXhZROxkCNNe?=
 =?us-ascii?Q?X8fToiXS8NdTDSWc64R+a1eFf735D66AuBW0LM0F2reVqgO0Sqob2U4N/YtO?=
 =?us-ascii?Q?ZrvQvSJXTfbVHUrk5zwaQUbWOJoofyv/b62rN3UMApe5xQgQ4Y3sBXpeqW8w?=
 =?us-ascii?Q?Vi1G0DkedjBFdi3gvlW+bRdl6koydDhZH6OCm2fXwt/SOmxNoZpgbMrBkwgj?=
 =?us-ascii?Q?8/wMcq6+1Gz5JgYVfIw3Fa2gGXLyZeLD0XSYwMXjaC8apG4nRW5wJWyxIMZ7?=
 =?us-ascii?Q?Z0pKbeu+VV8PLltNHDGp1yeed3Lbkvoc49mqTs8iQPUXJN3EPmy1Zi5FG367?=
 =?us-ascii?Q?mBJ32BdgrJCm3tU8LBfFfg+BepOvLpB87aVOz7xdN3oHb0MMS7iYkMoN8rRd?=
 =?us-ascii?Q?6AgTnB+qRf4qktPFNNMbCx/hgHLRL4a5ctJTqHkrNGszk8Hx3wJN5k7mm5NJ?=
 =?us-ascii?Q?5fIooPEdA5fgiHubIgj2wJXtAxBsYivqGTcW0LM3HTQOpgUHNQ1Bxneu3oN1?=
 =?us-ascii?Q?GlK0vttPfuzHoFPWbRf67pcTKVzPH/a5igqr4ASWZIWWtP+FohZVJCv5515p?=
 =?us-ascii?Q?tbBT4spP182FHO/K9StfGS4mB6s4ShN9SUHh3ghsTyKXykR18H+U+7aQ+oZR?=
 =?us-ascii?Q?xJYpLhdrDNatbeUskJv9HX7vurRGA87BrU8eXbnpIq1CdVRbJZKHntHUOn3O?=
 =?us-ascii?Q?vQV7kxpCMc/qzThFuRceglYKX94Md76YvY0hjM7udOKhT7CCDJaX8jBEsn7t?=
 =?us-ascii?Q?Ro1qTPHPtlAEho62d7cZtMPZpK9uHUCJrSX02UFofhpARvPhhGnsbtoR80OG?=
 =?us-ascii?Q?nE5Zly9BU30ZtzIhKOpsqvSL704vb4FSjHEejw1Ci7X9EH7WJuqtHbrRflcb?=
 =?us-ascii?Q?2USyM8IkxbvD49EXGk+KkU7k9ZCjR7bv4AdQs8V4lmoaQtVqVuXtWgkfEdA1?=
 =?us-ascii?Q?c+UkWDYRpbYNg4pIT0JXUaE8HOiZ019sY7sdGH3L2cxpV49LQTa6oWtZA0Eq?=
 =?us-ascii?Q?NXvBijCTBx741Imu6XLJWl1rvNouo9CF0gpTy9LnT86FpVX3/ErNDzk4en6a?=
 =?us-ascii?Q?BU2pbdTanrxinSTr0+Bp94C6p+wlNF5maa5wQ72XO7OSQjl+P7ifn14E6/+d?=
 =?us-ascii?Q?rRfTDK4OdzcdfXDSCi7HWcik6/3IbKH0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GWESnZZjyOt6ajNg6kh7qk/UWm3G03z8lsIQDWEPOph+XaLTSD+P2kAVEzqt?=
 =?us-ascii?Q?T8kxZyK+LuM/dnbqbmHB8EuJvNwnjctwQzhB7FCxDJ06IO1gBjZSH/zjuQEi?=
 =?us-ascii?Q?laR3HN0md8zU2L+QgFuyMTXi+hA7ZJKjIwEceK/558xsuovP54P5EW9y07KK?=
 =?us-ascii?Q?zm+pRhJM/uGpHdVt0vsVoGwyvwsQDo9C1NNgEt+XMuQuNFd+XHG4c/I3lMF6?=
 =?us-ascii?Q?sr9pY95chRS5X1dNpdJHTy0mujEp9rcUhID/91z4Gj0dhPcLsPlinvYrMhfc?=
 =?us-ascii?Q?k/K4D5G+gbRCmJMnNqg+5/B97cCZ0K5hhdzsLXzf2RP1tLtIjYCXAQ8xla54?=
 =?us-ascii?Q?CBF4Z2KHLmT63PMYljJKOXOWjuIv1qJLUYzYHaK8VIAr8y9AE4UokBdK6p1b?=
 =?us-ascii?Q?/OnEI0wGZ/wy2vYvjZ9pGkRktWG85HNEjXxIq1G703Hl0r2YeBKsG9kCKZqu?=
 =?us-ascii?Q?5XQsQC5ZNXymOG3pxqrV/G2mEECyf3FyD8ON9qwuIgr5y35piLyaKtKMEa6b?=
 =?us-ascii?Q?NzqmNM+oi5p7SF89/WImNhTgpBGdOiXG4xrRLbEaG1J9uQ2mbITwiRB872Pf?=
 =?us-ascii?Q?fbsiX/NjTSRACBmgsJQaVqyWzaCa2BALldO6IyMB+Dvy3XjjeNFIuGJ64s+A?=
 =?us-ascii?Q?h4mlgn55JAWOZZ65E9Nu9uwhpEGouVlUyTwYVK2Fv7nTMS/pZSKBNfjfe6IP?=
 =?us-ascii?Q?u1OD3ei5y7fiG/YLnyANRxFtxDuARvWYqKY9eZ7ov2WheXuzttbEj+spiXfo?=
 =?us-ascii?Q?WfvGVqHp1TpdYdE3K+OfonDHHzyxMe87ZBxa1AtDXFX4+tIEIG4hGDcq22hP?=
 =?us-ascii?Q?Prb2hIbr4SjwXXMJpPv7Bt6W00BYldF1OSVehIl4wm9mnIXjii/ubXLCGL07?=
 =?us-ascii?Q?XoR3El37YjogppoMVe0uRi/hM9QfRYXRJ6cbJsa+9BSZ4YxUO1pLjdrjBgqq?=
 =?us-ascii?Q?I2WQDJoFh9nAVbh/K61fXx0UUTzGBDkEaUBBrMoXoDO5Jnlg/wk4RerOQefv?=
 =?us-ascii?Q?0C0jD62InVEYPPhswNNhJwMFjqo5JNxhCYmZ9aOD2Df8nSISLytFJrGqfL3u?=
 =?us-ascii?Q?jHFykqfGtAQ+4or84lf9ipY1Y+rsKIcqaBed96YX9o5op2stfxj23JSCK+yp?=
 =?us-ascii?Q?BDvrYnaW4Hjjb7OYkPYbcW/WcsTBjDCfnULle+LDazyZgc6ITL7YfLOVlMYu?=
 =?us-ascii?Q?uGTNJKKSrbKFvp7lNP81bMyxUPkesuDjV5EzX5Z0F6yCAKjTQ1gYYGwzG5LK?=
 =?us-ascii?Q?WXrYIQOfo6zshpHiAcEce3QjTuRL8eP3KipOv+KJKJEJTYUPsQn9OvdAMlal?=
 =?us-ascii?Q?MUsrakHLmh36fyLaSZi8WSJDOZz+8b7S/F269BnaBBxWrFRXuPUtTuJVYV1q?=
 =?us-ascii?Q?OZLeEMhDKyufbilIzX4g+qimhZFFijGSswJgh6C3dus8OiA8jTM+ahl6+5vW?=
 =?us-ascii?Q?zQFpnR/CvbtltwIPx3d80dqC7IksCcN14lmhzx/ApHBd3xLPPdLa+W6+I6tb?=
 =?us-ascii?Q?g81PkimkMZ5oQ75XYMrJfYav6BRAOZC5ZJXx9VUUnsv/vZ6fVQk3cLGBF+mY?=
 =?us-ascii?Q?dY4NSjAwoKMfOZ27SDar2UoP98WKK7MHzhndsW3xHIKaN5t7uv7TuOOtGYp4?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 097367cf-0054-444c-2c87-08de0b484628
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 17:36:57.9033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLNsN3KkDZxCltuEketF8h98M4XMUmu145PHJZlMJjyeEgs7zIj/ylBTuGZB3mzEzMP+4vNgRbBFp0TPC2MOk3VsIXQ1YV9DWN9mGhGZ2+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7864
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

On Mon, Oct 13, 2025 at 08:24:49PM -0700, Lucas De Marchi wrote:
> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> Add support for graphics IP Xe3p_XPC having IP version 35.11.
> 
> Bspec: 77979, 77975
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index aa8359a4c5594..83e5e0c314a42 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -119,6 +119,15 @@ static const struct xe_graphics_desc graphics_xe2 = {
>  	XE2_GFX_FEATURES,
>  };
>  
> +static const struct xe_graphics_desc graphics_xe3p_xpc = {
> +	XE2_GFX_FEATURES,
> +	.hw_engine_mask =
> +		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
> +		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
> +	.va_bits = 57,
> +	.has_flat_ccs = false,
> +};
> +
>  static const struct xe_media_desc media_xem = {
>  	.hw_engine_mask =
>  		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
> @@ -151,6 +160,7 @@ static const struct xe_ip graphics_ips[] = {
>  	{ 3003, "Xe3_LPG", &graphics_xe2 },
>  	{ 3004, "Xe3_LPG", &graphics_xe2 },
>  	{ 3005, "Xe3_LPG", &graphics_xe2 },
> +	{ 3511, "Xe3p_XPC", &graphics_xe3p_xpc },
>  };
>  
>  /* Pre-GMDID Media IPs */
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
