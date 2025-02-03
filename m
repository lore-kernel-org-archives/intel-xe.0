Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12992C02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 14:11:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB53C10E0D1;
	Mon,  3 Feb 2025 14:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QiA1Bq9F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E8510E0D1
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 14:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738591868; x=1770127868;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Iu2VpKxmOdd8BlS/GQjVqKQlEOn9Kl4z8R03CY29jl4=;
 b=QiA1Bq9F0yyd7xDDaCgF1DBVbJ/c4T1/SpihJ3CGY4vmeNcxJ+OJ0top
 /03QEkBR2yFwA4U3VQU8hni1IIc74W5iXwpshDJqgMs1lmjd5+iRpS5ag
 EZmOgPLyVKqZWU5kAi0ycRzkFxJ6npLW6tU4WxkZhF6GYG2vNY/+vf8mx
 KUM7B0+LNCx+vxX+OTcGQEUS60/XeQUJ8pIr9JH5Q7wOqJvmupa5XHjpd
 RS+X1ighWytaDQ8lvsPB26PCfwP9iacLsEFkhOhb+xFyK+XpTqGJrBwJ7
 a+P2FQXXSFoBAVek+gbOUJKkdmQdiR/BvZUEgSX2mcNirm4IESfh8PUXm A==;
X-CSE-ConnectionGUID: iIWNLxWcTX+wp/7FC/fIbg==
X-CSE-MsgGUID: Ixn2EWX9Rn+I6Jw7lTgMTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42833721"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="42833721"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 06:11:06 -0800
X-CSE-ConnectionGUID: pk3Rg4kaTiqAmcb38+46fw==
X-CSE-MsgGUID: VGW2rshJQomo4Oq4kX91yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114917644"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 06:11:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 06:11:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 06:11:04 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 06:11:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKy5OCn5OIeNf5nMSXwVJoEXM0H2gm+lQJCt2TMhtes8x4OKH1i9t6mCoQ42etzl99ewVUIrm4UjIUsF6DyroxzocDOwigv8URj/CPmHU0QXDusWl+ZACoW0lsNgfPvmAou79iSfPKm2t9WUCDhKAX30RM++jIqe3WjR7GJuaBzuRiW6uPih6gvZk2nf/w3YxCmrU7hPKPQ72VPPOh3ftrpA1nL+7klZmnZNvym957vmjdFS+T9bpQAGPMx+M0AiqhAr1+HZ8v5bkWLmR8GVYtYOCLFt+Vcer0IBZ3Ag5aQvacxW3blnJv6RmvklrsWZ/w1FFfI64dBQnauLawUExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJ7hzYruNOLfsOFYgTLtJo/YBFlPjSgaPsAwBh9jdEQ=;
 b=w5yGGKpy9MdTn4ra2jv3nfoVrDpFUb9KIpFeSIj+aBDmFkC1xqp2g9d3BxNwpJXLUgDkULDL8r47ulFSpmUYaTm3TK/0RG/9ylejmXc4L9D5IsfeYBEzTq8mPTnjrFfQyZWxGDZROJsMo48aIlTvf+NIV+36PJA5MMd3SQI0yYglBjInGb1Ng+tIpJrWLcyzZELQ6M1h2smWt+KtEDrLAQS8GdXUBTLDSCgJgcpctrjAM2vrg5mM1WNgPy2Jfy0MMXmnkt1HgSDBZO5doD+Yj0Hgw6+kc6DX4bszsuGdlMKFxbmYt2krH212XfTu3Egow/Rt5CnJkxp0VLwFc2wEag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA1PR11MB6490.namprd11.prod.outlook.com (2603:10b6:208:3a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 14:10:21 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 14:10:21 +0000
Date: Mon, 3 Feb 2025 15:10:03 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH 4/7] drm/xe: Stop ignoring errors from
 xe_ttm_stolen_mgr_init()
Message-ID: <Z6DOO2EkvhZkHh7N@fdugast-desk>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
 <20250131223140.4144292-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250131223140.4144292-5-lucas.demarchi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VE1PR03CA0046.eurprd03.prod.outlook.com
 (2603:10a6:803:118::35) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA1PR11MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: 50caf990-09ac-4888-87be-08dd445c7ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kLJSUv1brAedjOsrXxUp73vJ/oLPci9RAjt0wwO7ZEZzyHj6xMPxU4jhiJY9?=
 =?us-ascii?Q?x2bBQAUJ632N3mS5eQZBE3jKMQ9Uo1yW51ux89kQ9lWfwJ8TNF4RJrfy+MMl?=
 =?us-ascii?Q?IJOscveaD99px3pRjoSEepsH50st1oKziJanfNntYTMZf/r7lWmzdom2Q2k3?=
 =?us-ascii?Q?cr9k1gYNqdAIYIHlcyI9k+lgeMH1JRlt6o52I2shbq++/ewSf3v7mOVbQHrW?=
 =?us-ascii?Q?PQBJ//IUCNtHldkTSzFSNQeZ0j8ugk0fBWuA3vTlrx3HbbyVizU4dujosOuo?=
 =?us-ascii?Q?kExV0sl9pVNCXYe4v9tOX3cT1GDeawlznCTzth0aYXZEu1GXnx5jAG+6ay0W?=
 =?us-ascii?Q?lSxhLA/vZEF31rfEsvRlZrZ0NDcVnRNNfi3NPmErGiSBhmQGneRbJ1FTDAON?=
 =?us-ascii?Q?KkZ/+zyOWuHRtxGqknAa227n/FUpLqJmXeGt+CxZ3CGbtwRGqrzoGDuHLcqg?=
 =?us-ascii?Q?Ujx/K20KP4HUBjscenIKP/jpyWZfeZRgZ07mSb41EvQWlx7tVhddC2pzXnGV?=
 =?us-ascii?Q?rgnRjWjhAnpioYPGp6kQBKIiyLt8KrAql8t4JMCRtcn7VA8MXu/bbeR+sqTA?=
 =?us-ascii?Q?PUrrGx9xPX0HIbZF5CW2eX512eFgVp1152KnRhAza99ZkyVhJobhiep7TcMl?=
 =?us-ascii?Q?J56KB4bYp8LNfPXPt1EnaGjWeyyYPNUkDgM2aSO3qlCU77x9xsRolONp/ij2?=
 =?us-ascii?Q?bMJ28nHH3tuwyGgroOjssTeJvpfGOpxDFlwYcFm/cIMug85sJVtmiwo1S2Kc?=
 =?us-ascii?Q?vpvvuYIvOJ8eeW/xj6pEyjQZMmPOLx4Vgzkzid13Dg2ATORchHDoGHzcZDtj?=
 =?us-ascii?Q?vJj6tpGnoXFE1RFC8ZfHBMPKrROXek/+rOBGfVAcagiEd+uTLMmS7hg+2CCc?=
 =?us-ascii?Q?YykAmbjK8XCAdIPBnkLMZwizRUkPwFWRB6IC7ikBQH7z9RVT/xV93o1RsUgO?=
 =?us-ascii?Q?bKOv21Mxu+ro23Pe+jHOem3h4aN1qBVLOPcTbOFAxrniLohsmJEtL3V66g5Z?=
 =?us-ascii?Q?70jKT8iscnMjrmFh1ebBGAiqDfyKwZf5ieAo4qmON/zJO0vAuxyPhacKONqP?=
 =?us-ascii?Q?JcHVv6/OxLbB9uoVtgPKLwpHmLmtvjQfRGzC6vjoec3iE5mZjiSL4cHnFOHg?=
 =?us-ascii?Q?RCTgTqLuARJjRStDjEXHEWe4iauhvqj633ZRAlRoxYeceI6W1SBuwpeT8hjS?=
 =?us-ascii?Q?uJMphkoQxXgF9kq9gRlLWzOkC3hBuqUj4IThmEWOcozF+GnsHqflySYmGsn9?=
 =?us-ascii?Q?Sd314zKcbLCDivKIWysmnxri8uw+HTjO5D33m86aJ1zfS+TVpEDvvSOshWUu?=
 =?us-ascii?Q?jd4uuaXmWHiOzx/XEYi5O0T1KBMnp0eBsK8EHxaQ1ShB6Ohfs9RWs7vedLKa?=
 =?us-ascii?Q?GUpgvi4umE3tBkPl4GKI53tsndla?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XZDRxCzv4u7swI5ZEcDjdyIvOUq0Q+GiuBNE1A02qqQK8WjxykftLBJAuhxX?=
 =?us-ascii?Q?BhwIJXwvist4Hwv+9mduTTMpSeDqOXxyUARsxMlydtDbho2G+AO/eb3fdwdn?=
 =?us-ascii?Q?QM6Bd/Q2Sz5zbdxFAat7Sxq88nyNvT0bof1nXCZHLU2oPcGMkzejcbeCpuB8?=
 =?us-ascii?Q?+5VsSnWdKWhuvFqkOJ2Xr6CEzSHU7XuIrR8keGL9N1uo7Cf5bRalMJ7aAFdx?=
 =?us-ascii?Q?41Xc5KkJXb4F84nem+iNTMc/YBfALl0ssw2AnTCH+2/Ypj++Uz6A4lLWqt7J?=
 =?us-ascii?Q?hphi/rK5wshfp2BcAKgHX0tc6FaOTOj5U+dNa56c8hR0RVt3qPPtaWyT+QGj?=
 =?us-ascii?Q?YghxMphUr0+7NQrRR3vBInROMGO0OnPwbZ8lyDG7IdpYFp2gxAS5OSSgixPs?=
 =?us-ascii?Q?cIm+tbd6BqFHQ6qeer+wV6sI0s8U9tgM6jTVVkjEGm4pQSfO8NgUCRGOCp91?=
 =?us-ascii?Q?Ghmx5Run0bDh+UITt9PwNyLWCTRI+VZMIzirHh9FIycyF44jC9oV0fcLLjtc?=
 =?us-ascii?Q?ravBCVPwj+FfryicHfr8kAAM6urnSby+3JTDZWEoJKbXekvQx2Xcvir9d6vF?=
 =?us-ascii?Q?LBXWk2H2m+hhVAwy9E3KCuAbJG25rqfPmd6xq9pgv9wO4Eq4VE63EahMqb2O?=
 =?us-ascii?Q?6mJyHmKmRPe8bgLcbsNGJxro2lc5dcLzYH2zG3uhvWmOHnDuiWSLlnpNMS5G?=
 =?us-ascii?Q?I8pYknh30bd6BOLo5+2dQkMt02xSXxuOr9+DmIQFBU/RB1mhXxK8j7Fk2atm?=
 =?us-ascii?Q?3EU4TO6OgHTN6blVAGC9TgPnWgjN173Ei+IQiBYhd1bP7A28UJK5K5VG+h9h?=
 =?us-ascii?Q?fn/ZFHvRzZ+YlmA+52BBAWnU/jT2srJrAiSzmPGF/2Ex/FGciyQmJ1zqqBzb?=
 =?us-ascii?Q?HLj4hJ3VZG0KBEiQt9hhj8LuBraMCX2/GqHL+Yd/TtCMzNosmjxRviJaIGk5?=
 =?us-ascii?Q?UIGgFZG/0J+/rFkHVrzlolF99kRnpbb/2kzpsg7ZWLjVwtGIB2O+3ntfzu2l?=
 =?us-ascii?Q?8OS1E1KFfguCkP/bEQ0sc4pizJlvNlIaHMVvxsoCiGfCDZq9Ro7HnpOvTRt+?=
 =?us-ascii?Q?rB5/M18pAiqDXtdVIxq4YDmDF3TcOtcgXi00JijMcz0uONYA8o7mcmLxHXaA?=
 =?us-ascii?Q?Rnnye/lZR/g5jTScemiCN8KGTMN2jI0Dnl3IfJ4IbuoDtshwZ3fxcpVfspcE?=
 =?us-ascii?Q?66gR3bQE1yY8j4DDdnNGGFa4UEGVzOCfbU4qIcetGifB1+d2QaDkRfggW4bn?=
 =?us-ascii?Q?+epW5PBv8ZzMLCQUSQiLLvQ9GBifI0ozGKlirM3DS+ilXmuzQAsrNrvgC4js?=
 =?us-ascii?Q?Nev+TiqoPAfF7r+8G8GaJ51L61H4fiuNPkPOyF+CDNNr0ZfxzeFUEdF6EiCX?=
 =?us-ascii?Q?03vVWZgepMPVzceQiO1PnV2lp+sA85Z57BIsEWqbIREGcU5CXm60ydA5C2B3?=
 =?us-ascii?Q?srienlom7ax18zh8Mi9H7vtYW3nyG94KFHRk4d1PHs/iIl4wz/SNGjwYZz9d?=
 =?us-ascii?Q?v7PGh12WqPZCSqcem63tntRJCqh74sL/IalkUfFam/cvmA0xjC0a20iqr5v7?=
 =?us-ascii?Q?7g6JBKPeZC9zpyy/6xIRiOpYLbldQ4K+sOp4ckpXT8f+hrlORLpmcwow7vdR?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50caf990-09ac-4888-87be-08dd445c7ee1
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 14:10:21.4217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLSiFMVCDlMBctKSbllKJiAZYo7g0LPMP5FgJo04YuFBPpEszrZktdMdSCQ46ChlYg2ejXZ8o3p+VmYsBeuL38yIUejQeDKdxvtf5K6PMdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6490
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

On Fri, Jan 31, 2025 at 02:31:37PM -0800, Lucas De Marchi wrote:
> Make sure to differentiate normal behavior, e.g. there's no stolen, from
> allocation errors or failure to initialize lower layers.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c         |  4 +++-
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 17 +++++++++--------
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h |  2 +-
>  3 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 2e874906d4f31..e519f435b1606 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -826,7 +826,9 @@ int xe_device_probe(struct xe_device *xe)
>  	}
>  
>  	/* Allocate and map stolen after potential VRAM resize */
> -	xe_ttm_stolen_mgr_init(xe);
> +	err = xe_ttm_stolen_mgr_init(xe);
> +	if (err)
> +		return err;
>  
>  	/*
>  	 * Now that GT is initialized (TTM in particular),
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 423856cc18d40..e1a1200fdf22d 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -201,17 +201,16 @@ static u64 detect_stolen(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>  #endif
>  }
>  
> -void xe_ttm_stolen_mgr_init(struct xe_device *xe)
> +int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>  {
> -	struct xe_ttm_stolen_mgr *mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct xe_ttm_stolen_mgr *mgr;
>  	u64 stolen_size, io_size;
>  	int err;
>  
> -	if (!mgr) {
> -		drm_dbg_kms(&xe->drm, "Stolen mgr init failed\n");
> -		return;
> -	}
> +	mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
> +	if (!mgr)
> +		return -ENOMEM;
>  
>  	if (IS_SRIOV_VF(xe))
>  		stolen_size = 0;
> @@ -224,7 +223,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>  
>  	if (!stolen_size) {
>  		drm_dbg_kms(&xe->drm, "No stolen memory support\n");
> -		return;
> +		return 0;
>  	}
>  
>  	/*
> @@ -240,7 +239,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>  				     io_size, PAGE_SIZE);
>  	if (err) {
>  		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
> -		return;
> +		return err;
>  	}
>  
>  	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
> @@ -248,6 +247,8 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>  
>  	if (io_size)
>  		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, io_size);
> +
> +	return 0;
>  }
>  
>  u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> index 1777245ff8101..8e877d1e839bd 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> @@ -12,7 +12,7 @@ struct ttm_resource;
>  struct xe_bo;
>  struct xe_device;
>  
> -void xe_ttm_stolen_mgr_init(struct xe_device *xe);
> +int xe_ttm_stolen_mgr_init(struct xe_device *xe);
>  int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem);
>  bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe);
>  u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset);
> -- 
> 2.48.0
> 
