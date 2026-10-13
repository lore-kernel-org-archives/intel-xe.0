Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31048CC6B1C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 18:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DE310E8DC;
	Tue, 13 Oct 2026 18:57:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB87810E8DC
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 18:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791917818; x=1823453818;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xU+n+c3eoeTbo95d4SlIczzb8rr+h4ulBGzZIaEFZFI=;
 b=mAAr6viJd09YPHTDhr+7fGtGJ5Gqi4ylF0A0qcblGO6a836doSfagS9K
 6y565aFiQlZ6HN+J9MiRzYJEySyfP7s4p76NXhCTsUgsWp51XrUdW9DOK
 ech3xnokCJJOeIEivJr6Ql+A/W2OJxpuZZ4RZXmj8tCGwdVN5Drn9Knwh
 Lc0AMAeYnpiKamLO+U4XKkR5qaRsbtU3kvdt2fXfoqxiXmdTrBnVZnKqF
 uhY308qRkKbVk4qWLjRmBiOqk6FRNYBvXv2Uqv2XMiRd/FCf5Uu8rNqyJ
 Sgu/xlMksoZcNfuRvwk0J4pOJu99ciegP2GxnS/qPVYNZDMZydjws1nIs g==;
X-CSE-ConnectionGUID: HaVFFhBQQQO8ssvbG15agA==
X-CSE-MsgGUID: N+3nRzmqSPC28szOTzNPxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="758566"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="758566"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:56:58 -0700
X-CSE-ConnectionGUID: GumAWMURTxW/YJMZwmqfmQ==
X-CSE-MsgGUID: 4Cmm9y2JSTqibrT56KzKrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1338734"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:56:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:56:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 11:56:57 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:56:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnJkDNl8NlwaQ6FZrLiifJSUN90s6cnxFzI3qT+MvNfMzMODWildwFuCZsufuny5g/mD+KLY3FSHceqmBWm6+19YyUt7j8IloVWvOyCPJzYnMfCb6ILtmm0/oxKxM8r9nNivPdXB2CUnn8SuGXTA3QJHzzHH9isb3WQnrDeP3YLlgXXpzfSNK3adpYKnTC7auLwAwz/BmGTg1tNFm4zKpDdIfMSZzvG+KwCAme+D/1t8zPze/wwQVQVkkl8aW1CH3Cyro+gEOzo2k2iGVJXBiD7jvQElNKeW7ng3GCu8ZJmNAlrKRty77y1JoZAHDSuPgVnaM7dBJ8/dh5Hvqd/rQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WN5ILgv+++UkF0YKAUYnKHQu/OAjdohSQTVkZi/8IA=;
 b=zSn7YR155Y+W2Y/fbccsJBSn8pKIUeQ9Je2YiJY27VdhvAV4koDi89JhWaTJjuik0jFzaLHzDSSMDp34Y+hTgIJ+1BU8NuHzT2UHDadRhl/6lQiqBxW1CNEG9l5nTFSN0VZz5tHXOAW6PShcrk1yQZo+UCdQOP78znE9JuLhrTcQr0bvNxzVghw4Bt8CtBf83yiURif2ZlGLVImK542r2Ap5t6sGcPDnN1JWottTmEfVFZUfivIezjInn61tsxTB53smjgk6+z1NCKPJSdzEeYaWnXFOQ8g57pjOaWeq4Rvtddf+qs/PNq2NdxxMurdFwuF64a0rkjy2JxFMGIGdWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22)
 by PH7PR11MB7964.namprd11.prod.outlook.com (2603:10b6:510:247::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Tue, 13 Oct
 2026 18:56:53 +0000
Received: from DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb]) by DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 18:56:51 +0000
Date: Tue, 13 Oct 2026 14:56:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Soham Purkait <soham.purkait@intel.com>, "Michael J. Ruhl"
 <michael.j.ruhl@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <matthew.d.roper@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH] drm/xe/survivability: Do not call xe_vsec_init() in boot
 survivability path
Message-ID: <as5-5v1r-oArbrZ2@intel.com>
References: <20261007100259.2661003-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261007100259.2661003-2-soham.purkait@intel.com>
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To DS0PR11MB7192.namprd11.prod.outlook.com
 (2603:10b6:8:13a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7192:EE_|PH7PR11MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a76d5b8-4afd-42ae-b147-08df295bbd55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|56012099006|22082099003|261009223027099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: oesJP2c+K8uBwOL3684vqW07R0gVp8bH0R9/vFXb+ahU9WBWNzJQML02zOApns5PV6So+mFoS6oeLZKFwvumJL/vBjg9tU1+qryeZrafSL5SsTx8pPqJNIwv1mTg/GSgXyHkiQJ63FgKNxY2aktal+Ee7hOLFMTGyvZIeodTf/fgBrO1kIGGPuucTDeYPCfMWDFLOUzptJAVNHtruuoPz/JPtkffs9/Ild8zzdWHYB+l4L4tIyifBWGic8MbB4wDlfXVz0fdk5F8Ps0qruWltvEXOgL3jl40ZLa9bKXT0qIavSTiFi6z6kDSUw7h3YGlso3B/2N7hO7GPxBJH+DCyfBWl+me17k8fpQ4QD4jWrMPq6IXGns1SVEgTlzEWeBCHYeRqJbcQrxXdBAyU6txG+V3gmw4NEJWrlaKJIH8Vq1kIK/kNelw0Yxw51JioeZHSrot0CTkM7VilN/TV/PfI4pbdpGTAUp8oSmlRmgNfP5/uWUdPQVIa3pe8AhTyvT2cpsGL+BF/0VYhWMN6saK0VgKt1cICq14R/EZhs19jgmVY/q/kLFYFPV6Bz0+1p2kUU8YuzyjsmiX39bVrvxpj3lNL+Q/6W5YPMfe3QtR2VwL7Ua63vNRI3ABc3Tr66kK6m78h+Kx5VCMh+Sqoj4W0X7garebfr6iJXkep2ZrD8s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7192.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(22082099003)(261009223027099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KdDT8zg3p1fi5nP8jnG4+d7lnQPjqQXshDdHm2WjD8cbxy2m9vKhqxCNZSVP?=
 =?us-ascii?Q?VIH+G6PCayOdd5mHBEQaM2n37/TPYxvoPw0UBNFMzJnsQQY3/1j6E/uw/Xo9?=
 =?us-ascii?Q?Kp81R/cfT3cTYNGw6xHNcg+MQtuWCRgS/HNuIgQ5IA95ulRZGDLU0auIE8qY?=
 =?us-ascii?Q?3oRpad37U9q3EIp6i1ROCYNNn5v4+d63MZtWnYaWRI7A/R4H5AYOFxspiOsy?=
 =?us-ascii?Q?ptwufMXEzFAjq+UmKPxpm7a6MQWlzET/daxYvqjMX2+Dx+0DDhcDV9yRGfnG?=
 =?us-ascii?Q?n8bVIN5AoKkk/8Zmc1QLiKJ/46XiQRL2g3NPVAbedk7y16MWjcFSYuSiYniD?=
 =?us-ascii?Q?7CZDGO8sktZcD5dJgRi/skSEMnemqWWh0IobM2EueSWBRMgsy1PRXF6oJr6x?=
 =?us-ascii?Q?NQK1rzXThf5gxS+Aq/Acjp1uRjdmIZ1RwjsbDHtYTa8LYZ7j2kLx9lsjtRqy?=
 =?us-ascii?Q?XQ9nNE+ioZnv9ZOWQnV8oPzn/3XUEFht76b9wu05OHl4a2qGJsbAwesTD+wt?=
 =?us-ascii?Q?inYR/H24fhJUOP+QPrvZa6Glb+beUJVn1+4y8ipIR/2W/OoMGSIXI490i58n?=
 =?us-ascii?Q?f4vzM0uRta0a6IrnKWdxuUxP05jLQD4oWKy6cBcC7oTAict4LyYqxxcCBWzt?=
 =?us-ascii?Q?Del95WZoTOsnWnZ7oCeHqy9U8ygyNR7zH75p+AVA7h2YTN2g0EmEz63l19QN?=
 =?us-ascii?Q?s8SCRj6W7wegNpLMQNELBuLo+ZdfbGDaVnJaGLVTO2XltybVphgv266rtWTy?=
 =?us-ascii?Q?BOTCxJZlcSiLcoabPBVOXjKdS2Bs5C5OWDfsmxID6m9x1t7HbIjznlwPbNON?=
 =?us-ascii?Q?1U1tXqRbY7u3n4xpsiS236jz5ox5AAZUVuYtiU5B7EotfrYBWKBt3/hm2lyA?=
 =?us-ascii?Q?aZLmSM1sHfMamhgyof/cQ2E8bzpTQQQdd0gZ2UX6muodprcHI9CUa3dPP27f?=
 =?us-ascii?Q?WQUGUdO1QA4iGCBO1WJDBeSkAmsCGpqtuG2+DGKejCZwgm/kehtFvljBy8qy?=
 =?us-ascii?Q?LyyfTrEUhbc9xJDl1hG/CY+ixxR+KCbmhfJdxWwmitz50bHA5NwXQy0+oa8Y?=
 =?us-ascii?Q?yRQgJjWdXxTBpvg8x/ig+r2kLyBS3weSzk/c+1PQEtd7Ly/IX2P6LYLhxYWO?=
 =?us-ascii?Q?zF95cSDW+FGbjhEGzra3KZpOI20Kz7OAbmmBZHH1k6cIyeBPJMXZZluARsJE?=
 =?us-ascii?Q?OkxPOjcGn3OwbjgmbjF49RpmNYSaz2Sr43ZrGADr1Ujxz4Ec6nm5KcUyiy/X?=
 =?us-ascii?Q?dHX8I/5OEqSCSQegd2vglnxLmjNwdApVrbMOFu3T4JTw34jwLn8i+hUO/weK?=
 =?us-ascii?Q?JeaWVNSwG5P9AGblQM3cbDCQontXeXKRYQ9wu3m3fvNhTsZTTjOfogd5r++I?=
 =?us-ascii?Q?svIGpyiHtdKrRUXy+ptflTB0ZI3oOhfEzQwTMOFn+USceT6QjIOKGON+4EoB?=
 =?us-ascii?Q?58DIlPLYztjt3J2BnoOs4yQTT4yrMfU66D64L+m4ipS2Tb8Nzay6Kq2+wWf1?=
 =?us-ascii?Q?IQsRLiyX1U9dGWYkj5IFaGjwY5HaO4peKmjYU2sKWHzS1WxmshjeFN2xy8LQ?=
 =?us-ascii?Q?F3mvoGX5CGuq7M9Jl0CgirqivoJ5QJHXMT+xuj2zunIhAAGLgsPrPpraE+mq?=
 =?us-ascii?Q?PsUMjiNjkv5LC6KcPdWE5lpz413uTy8wJfun42w3JCRX3gwm9BhxbJLruEE/?=
 =?us-ascii?Q?eLFllIDcj8GDZn7qQGEtZLubVwinzkT8QlOtrw+KF53B27uuX8BlaObvq/5D?=
 =?us-ascii?Q?kAHRSNZlaH8zJTBO0ftbMPjT8Z3u2oU=3D?=
X-Exchange-RoutingPolicyChecked: ezVx/hW/7Dvd3MG1EzzJZ2CALb2QOYjwfa/4eoXEEE8Xqqa4KkGc4CkJYtxXapnk67gBefeCnJbY4XY3mx7ZSpzxi0vMbXcEDT4CDC2NRoPchvI+n+25kKIJacsEnMWr0aPdJgdw67AtUhLtjUTyi0VlZ3vzj5TmqhoeVeDnyniKDPByAoxliblMgGnz71sGlBqSU92NtotvkMQv7izCaqc89ebrVg1YHXyRMtlPT8u7G51noX7mz4BP4RTO9i7nTZ69qqyjvHsATMqwBeCDKRBC7vYinR9vSKB1zXkD/dv5RgJQyu1BqB6BfhtrmWiqVv8N2MyiAPO1nVr241riBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a76d5b8-4afd-42ae-b147-08df295bbd55
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7192.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 18:56:50.9947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+LdgM/w+OxZgIujIjLjs2QgNlkD2zYINxJKlwaKv6rm4MY/43rSwQxR9IN5nujF42tqUG/oC+s/e8VMYu0NCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7964
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

On Wed, Oct 07, 2026 at 03:33:00PM +0530, Soham Purkait wrote:
> Boot survivability mode exists only for device recovery and firmware
> flashing. It does not need PMT/telemetry. Since xe_vsec_init() only
> sets up VSEC/PMT, there is no reason to call it on the boot survivability
> path.
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>

Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 45d44ebe288b..f5985938c60b 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -351,8 +351,6 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>  
>  	xe_heci_gsc_init(xe);
>  
> -	xe_vsec_init(xe);
> -
>  	if (survivability->fdo_mode) {
>  		ret = xe_nvm_init(xe);
>  		if (ret)
> -- 
> 2.43.0
> 
