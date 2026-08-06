Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDE4C56208
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 19:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AE310E37C;
	Thu,  6 Aug 2026 19:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fik2CsWh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC5710E37C;
 Thu,  6 Aug 2026 19:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786045970; x=1817581970;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XFz3wvpS+0hoYb0YDU3bQrEGO+ynvI7sQpSyw5NRCM8=;
 b=fik2CsWhzHJgJD1d1qSowRx6xRt0LaH4OLb+EqIQ+jPCmC1QFxFPb8Lt
 u4UMJ9Bnxq96z+cbae0q8+/XMFPjcDgIjv8zcLGDnDL1MWFoGgY+MvrfK
 PratqNgzsELN84yxSC5GdimGGTiWI4MrwaFqMC4pNv5OJKymevUPfJs22
 BmMTZ9YZ53OmoaVN85xKhU1D5nWp/+b149BrwSqRYh8bvM2mxpK2sA5al
 SFlPNM77ZRqsCUGUwpdbQduEWBxzr1dndKVYqKfMKsEkyNFfGekjPh99d
 VEctk/mhBB9p9WxME1PISxSuHv4Ym1FKRHuSdsX9cif81V3XLFS8VTXgg w==;
X-CSE-ConnectionGUID: mz2UxMTyQfmCs25JNIJWwQ==
X-CSE-MsgGUID: ufwpmdEkQribu5kSj/P3lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="104184252"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="104184252"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 12:52:50 -0700
X-CSE-ConnectionGUID: IP0tjuBfReyTmWwnWU+RfA==
X-CSE-MsgGUID: 1vJ+Pb3bT4y/wUUhX8X5aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="258332786"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 12:52:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 12:52:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 12:52:49 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 12:52:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nb825/z7oKcbNE88hs79jOr3q1pLVnjPkaCD8N4spK7wekiNjvruua95PSQ1Sazg0AGdw0hW/Iwpabo2QWikwZwX2TguezNrRmKip+GSVgKiLuAw3vOu4CLq8RW4+/E6hkcO7Xg8tfZljcQu5c1hxuGK+5aw3iNbym/ui1mgsF32SUuaErsM4OMD1UFnaUJG/4y8djiNn7MtiBxA9bfbAust8PlproCH1MJyjWTXSiDYS64pAyqViVBCafz+EFoZT29pUVpY+BASm5SdllGvnR0W+nGCxziiHuN9YvlT7I0c2DTrnthNS/BhAPS0TpwkbVEO/+GP65LuDvnyaM7Jkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gShQgOsweZHi4Moe9caIgWAXB/mgkYNTkf4sCAjRVcI=;
 b=oXH36hre98zhtUTZ9WyzCbz5clIGgrpOhrHTl6UVoO6c3j6CQ0sU2/XDFZK07yHKulqGz59FTdy7c97lc3T8Ceb56j+j0tlWjMk+DFZgLF19fXhRyq6hLDcHsmodEbZau3m1FmqXmY0Tybf69+6j7bNQMCXddIXctr1HFpBp+9HJOEzMxguKLpriZBfvhnJead6s7uBd2btqw5ZxhDuXj60rLtj5PaLhViPe9rdnd55NJlABKAioeY2CKfVvnSaP8ieuZgxTiFsiGFbm80yYxlbL/GVbcPr7Qs/ZrumzBWwLul8fBZ4OTqRBgMmtiWml0b3mO0p9GzNUnzfIEzl5tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DS4PPF69AE895C5.namprd11.prod.outlook.com (2603:10b6:f:fc02::2b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 19:52:38 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 19:52:38 +0000
Date: Thu, 6 Aug 2026 15:52:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>
CC: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Nemesa Garg
 <nemesa.garg@intel.com>
Subject: Re: [PATCH] drm/i915/dp_mst: Remove duplicate
 intel_pfit_compute_config() call
Message-ID: <anTmAUupVyP6fiA4@intel.com>
References: <20260806074819.2631970-1-chaitanya.kumar.borah@intel.com>
 <aeb1e53100b0b28c557061a706fe2ffb04a662d5@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeb1e53100b0b28c557061a706fe2ffb04a662d5@intel.com>
X-ClientProxiedBy: BY3PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::10) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DS4PPF69AE895C5:EE_
X-MS-Office365-Filtering-Correlation-Id: 72400577-97ca-46a5-e023-08def3f44474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|4143699003|10067099003|11063799006|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4417N3LxUhgVE+WjhaOoLiPgdkB+YO9ckKC66qXqKlFlxXTd/9ZP/pN0kxXlYQG5mj3WGJoTmWYiWisGh/THk99P6p1xIBerEk8pItlLoDj0kAQV3xnA95ksU9qZ2Fi/IHp89nstP+3WoLqo9l+x5/xj1JSjZnX4TGIZogd/Y10wi0nV4SBGP73zFZ1miEakMCIGJi+vtMRNhdOb6NUwNXiimQ55ucB2MyiDiTWI8JeG98I9NsfEgRW3DawfJLeYFbMKJjVYLtRnh9qzBUeetEFTf7G281ZnAAXs2wQe2nylx9+yiDS+MZoGmQcrcNq/5Bf7MErjOzTy0y7YtdtqkaLb6eo9NLUdi8lDhIH+C2DBFI6K6d1cB+7Tq8xo1VgH8zeOuLTR2YiflMb875/IXOX3hQFwkCiOOHC9yOGp9DPUB/XwaJFr8OmYt9lZco3cFo5EF3UQzs1fzXoprPYFOojWTcdCXeABSrKPd01CUtCDh0KfFdlBUi8IvTTT9uj1eF6wF4Lm0TbpGGhnCmBKI0G30pUgv/uxTSiOPRaBlqr4ElqiNlcgtOzAHnp+3jzwYkZ3bt34lv42BtttetSksMupKP+UlXNgZmMcyEZYvnPR1RdcwvkqckH7wIv/7um/tn8bRdaR1e3TpvT1u98ll+UX9ipbxCVYDYP9krAoQb4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(4143699003)(10067099003)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DLlm4BnnlbicElX9SmSyuCuKzFUiNm9n3IsCrC6r8gmyLhEpEX4Wv6ybWl?=
 =?iso-8859-1?Q?+HUee/8LSli/WB/PbA5FkXeZgY9Z3SupLq/9TRJK0O04uo2Q7Wl7enks7b?=
 =?iso-8859-1?Q?N8wHyqgxtG59FnWojPkA/P31HjFtLF1XSQlBRWl7IZVVQc0kneLeodL7kQ?=
 =?iso-8859-1?Q?64lYh/Vr8qRJRxMl9Cp7uECMxI/BIeEuGPHE2v3nY6EZpvtgNxEEjCK3OR?=
 =?iso-8859-1?Q?u4UBn0PpmBQI8UGZ7UOY8sCzKG5fHOEBAek0Vv6sPbg4C+Wk+498ziPEfT?=
 =?iso-8859-1?Q?LyBpUpDZWXUiA8ge9b4TI/18QrVl5+gUm46iHo6MJieFH7Uijh5gHB100S?=
 =?iso-8859-1?Q?Qw0Tqq0dcAgFUBC8wnRyFkQ9fF2wDpB8XlYsDKOQY0EJZJIWTcbEys+Imi?=
 =?iso-8859-1?Q?ae+6pUBxAtmEk4ailCw5u86vQPHzvpCX/iPTn98J90y/ZnZ0Tzo5yeH5xP?=
 =?iso-8859-1?Q?wB3jiDer/q7eVQGBZfPYum4lAJIMNdR11Wy6D/Omtv5kLTsLPwa0WB9Rca?=
 =?iso-8859-1?Q?JVCPFGi33KYVi6wh88rA5bk20l8OiXa3cYuNl4U0VLiDkUkUJytEBhAj8M?=
 =?iso-8859-1?Q?bVdpWjjfU+sOxxXrkWCrmszGJUaOaKUSPmeOCiTTRkNbpcs9pyiTvSX0VK?=
 =?iso-8859-1?Q?RaHKSX6a3dTsJOpIscQ7xkkGW2VsVSal5+mbKfyxHDw4zYEJWRRu/DNW3X?=
 =?iso-8859-1?Q?oD6bbrIzsxjkTYsbBC9t5LcyiSg9x/ZYv3ZVAige2AF2agtqJUS45EMJw1?=
 =?iso-8859-1?Q?rh15EkMz59iXWaPceO1hsW551nDXTMDdN5ps5tyTP4Hkp5l5KPY63WGgnb?=
 =?iso-8859-1?Q?sD1kDz8At1GTjFj0FpMzgeVrVBtGT1CThROvW3YChQc+ErchTA9QXSdYJj?=
 =?iso-8859-1?Q?XQEvrEoI02HavozQdDOGjNGUmGkNFjFviKnIs3eutDrt1EOBcaEWzkFduS?=
 =?iso-8859-1?Q?euiL+Qmas3Dsc0EfyPGWDWnZSZSISzp2i39NQC7m4Ug5Y3bSQ5j68rmlJm?=
 =?iso-8859-1?Q?TSk9Unk3HEO9I5oHUkpde9+IVivi4DOYn3uzE8mA8D0oj7vlhR3u0xG3T1?=
 =?iso-8859-1?Q?CNHkZN1RphY1GwOZ3n8p8PRnTGZAti6VeNSd3KjTkHjjTrwjVK6jz5b0m2?=
 =?iso-8859-1?Q?WhVxMdKrMsMqtqM7X0k3ATkMeLCvzws2Qqr/kkxd30NEU6b+ZZTWrGLPPO?=
 =?iso-8859-1?Q?d26/8TFB5JQDgUjWOA5Lpqpn0naA16B6sTcmpoXstaQrZp9U/QBgP70DF2?=
 =?iso-8859-1?Q?B0L8+FHzVjvBcusZHq8VhJZhEwJPbZ1+ZUBe+ergVTEl8nIWD8E7M9Pjbw?=
 =?iso-8859-1?Q?jGfJSuIjiKsdXr37DvLETOaSpN8ddjxAehGXIAb3fat95Y8dOo17CFtJL0?=
 =?iso-8859-1?Q?RSl8cYJk6wGklWd8WnfKN1HLxS3ohSwJmG90jXM1XTUYp7QG4vkgnfIRte?=
 =?iso-8859-1?Q?3LFiHGvU4fm393Q+iwbgXRGYqWov6L25L+EFDSaj/yiLjlqkI2bA96RNQG?=
 =?iso-8859-1?Q?YmZXzvnUbl/1QeC7HyKhtCkeHtQvv65I69JqyjT7U09LIq37CGqmjtqHnq?=
 =?iso-8859-1?Q?KegseNtKiaK0+onf3gwHkj/pCaaCUOmx+kgs42lnFKcVLJkevbzxNQzG2/?=
 =?iso-8859-1?Q?PiYRw494e10vSLwWXxCZAwvvCQJC0t/+Z2dw2Wgtxjh4xrMz/qIMGzEz6y?=
 =?iso-8859-1?Q?tUXXbgEU+7mcEz9UwmmA0nKQNrtO1CWHKHGse33S8565pw1lr6VO2doqM4?=
 =?iso-8859-1?Q?1jTSxQ3TCiTryr5Aj+UbBOoZlcZ4pvPeGc6sTygTZaXArbB/Mwic94GTnB?=
 =?iso-8859-1?Q?NTOnEdHMNA=3D=3D?=
X-Exchange-RoutingPolicyChecked: mFlEqtP5ZtfJItxuCKWPeykcftFk6h/i49ui7Y2NsSlRd7ovmBLzJTey/1TT0gZ9quc0svJ20vItM3em+HLlPUTYWpDFbyfJaBxN6xFstegjFJTJq2BhTLsfRg1NEfC0HD/6m/FzhCMhDNihvFnUcdbct1S5OKclu0LX8TLUD0s1+Ruc8lBMscM5C4bx8xjjpbCA+5NFnwuwBQcJyXWpACoC99XU+0JcWjHO9YBjxGrli03omJMaELaXVa1yQ2KsK1+GjwbIYaSdYz7eaV43KVfKIZQHtwJorOPNIEWtGw3vZdtUZLulWOnXg1AOBbZkjXO/YthX6459NchU9f8M2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 72400577-97ca-46a5-e023-08def3f44474
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 19:52:38.1081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPXMUavNkt05QfGOJ++GamLyYxHVqMPsoCjq/1NEsr+WRt0vRJ+KAkBeVwdEvPVLaAtrIfbuYrObMHvBswTO6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF69AE895C5
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

On Thu, Aug 06, 2026 at 12:30:16PM +0300, Jani Nikula wrote:
> On Thu, 06 Aug 2026, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com> wrote:
> > mst_stream_compute_config() called intel_pfit_compute_config() twice
> > in a row. Probably because of a bad merge. Drop the redundant duplicate
> > call.
> >
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Nemesa Garg <nemesa.garg@intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Fixes: 5ce9ac1531b8 ("drm/i915/mst: Call intel_pfit_compute_config() for sharpness filter")
> 
> Rodrigo, by the looks of it, this was an unnecessary cherry-pick for
> fixes. The context for 5ce9ac1531b8 shows the existing call, so I don't
> think this is a merge failure. But why it happened, no idea!

Indeed weird, I should had caught that on the fixes, I'm sorry.

but it is weird anyway, looking to
d4686f34bbeb ("drm/i915/pfit: Call intel_pfit_compute_config() unconditionally on (e)DP/HDMI")

which is the mentioned fixed patch, it actually introduces this chunck.
Then the fix patch introduces this again.

So, it looks like this also occurred on the drm-intel-next first anyway?

Ville, thoughts?

> 
> BR,
> Jani.
> 
> 
> > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > index 3be1643f8d03..57daed0b0b36 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -761,10 +761,6 @@ static int mst_stream_compute_config(struct intel_atomic_state *state,
> >  	pipe_config->sink_format = INTEL_OUTPUT_FORMAT_RGB;
> >  	pipe_config->output_format = INTEL_OUTPUT_FORMAT_RGB;
> >  
> > -	ret = intel_pfit_compute_config(pipe_config, conn_state);
> > -	if (ret)
> > -		return ret;
> > -
> >  	ret = intel_pfit_compute_config(pipe_config, conn_state);
> >  	if (ret)
> >  		return ret;
> 
> -- 
> Jani Nikula, Intel
