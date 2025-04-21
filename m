Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8B9C369D5
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 22:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4330010E4B4;
	Mon, 21 Apr 2025 22:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3rbqfPm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D6010E4B4
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 22:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745274508; x=1776810508;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1rIyqFauXJ7PmV/f/CX2jpVA44Pv4TCgCHm5mDFEE74=;
 b=l3rbqfPmvQmhx5K3JMt4CpM0ZVf6diWzSTVivGLMpG97J4R4d9rEJB4Y
 dBw91lAe2SxjwrUAl4Rkd26In1Hv3KCmtUmonhEvhgrejFge45I+acw4N
 vOjvsEcREFulvO+raTArhO5fEs1xGN9F54faJNRxSZCQuNVHV513tCKic
 i2+cbI0lnrl9qEhCOMiTsCpraWGqB+tyqJdnDRvNc8nWS5dxOBoKRvtjl
 WLmGvMsWLiLoYRJDexQErGGhZPeIgdTJ6f0wWi1nfjEU5MvGly0bKBQBP
 Kr+DU9WsTPkhAFWuhWPh7/K/AWXHmaSBEYsmlF3AISfSmjtK5KC2cL6TV w==;
X-CSE-ConnectionGUID: gd1SSKfQQHO9nGOCIYCZtQ==
X-CSE-MsgGUID: Id4E3jvsQbWGdIo+ZHgp4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="50646733"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; d="scan'208";a="50646733"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 15:28:24 -0700
X-CSE-ConnectionGUID: jLFpHawOS5u4xSU7teILKA==
X-CSE-MsgGUID: 9j24iS3ETUCAecxXRcUOHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; d="scan'208";a="136700613"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 15:28:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 15:28:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 15:28:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 15:28:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIjm79EhIzgruS9vy5TScRJW23RysqbX+J7/EqsyBNzNcRziDwXS4X9Qu+a9BGbHtUsUt3xsPnIDXsUQNSTSwRF34YJmRHpR2B7wvj0xqE0QW1EYNxsOha0It3NxHd8aDEJKprScTws7d/mz5HtI3I5ug8eTJ2Nsswf2Vkki9vlPxNmd4W3rIz+/lZRpyF9wrN8GwuiwyrPJFjx5Vm5GRZVrYOE0mamgojP7fukoF/eFaXdEqih4H0w0js685yG4vG4+eAz0/l/8xKHn+c5gk3fF7DmkFhgcwrnUR3OgIDY5ULGJXCPbVgtzjgPjPrcib6o0vK4FJT6Atu59ufu5gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqEONSHaDz+9QS95pdXOgw9Kr36SyRbZYLc+YMG5txo=;
 b=xl6z0IwP9WSCMVdbzTrKgtbhT01rdIwz4owUQxONQh4E0a8Prpv+7/vvZl0PiPcTUXL8mNwd+1JIyzOe4eG52UkSR65fs+j0r/o3hEO8KGUEWcPeuEKtTGFj16ETc2qZuCoHJyX/8W147jGitnrSZNFNMWKtyvYaD4vFZj81wmERNSOWa3LcZd8N+ZVJ0DLM+mO2Y6eqdjDLG4sA2lAnJeuX5ze5ZI5wt4GugajHUpkInl9zFWn20d6m9n+ZoJcG9e6rut6BQokc2l45JAVIjn60zpIN9EA3HBF3kdmypOamHkdwA1pI7KKQ/sSBFh7pvFELecJkmilzOno43hlglA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 22:28:20 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 22:28:20 +0000
Date: Mon, 21 Apr 2025 15:28:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/ptl: Extend GuC Wa_13011645652
Message-ID: <20250421222817.GH6239@mdroper-desk1.amr.corp.intel.com>
References: <20250421221031.1781629-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250421221031.1781629-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0208.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: d64503de-739e-4ccd-033e-08dd8123d1ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ycmRhkecHCZtPVea9Ty2PQZ1ToDoiYTi8ANaakRukqajMZHLKWE93t3RzPmA?=
 =?us-ascii?Q?J5XmuHAyNl8186GCmRHG9eFvzd8znfVEVb9OXPNoEk7TCqEYy9rjt49GClJa?=
 =?us-ascii?Q?QnUKVdRVGdZEWROp7h6dKRvvu6UiiAGCFT17UgLDN4ZE52LjkeQeS9u9eAtX?=
 =?us-ascii?Q?4Z+cGb8lAv+opuUjHterSODd20KdMKBJjYhnk8rHpvaOzRhntBXMEp3MU0Cb?=
 =?us-ascii?Q?oe5c3HY1on1d6FatQqc/xx/+PUWnb+h70zJ6mtPZXN00QLF8r/tmlqQnkdFl?=
 =?us-ascii?Q?M/jijiOsnq31U5oyx/BNfEQFjURcU70tjFFe5e8AvTLWDOUUX/w/oxdyAwrl?=
 =?us-ascii?Q?Zy9fQJFNszOv/4cj8RJB6cmID+2gWPNHDccXP1S+F6AyNwsABdIUASpJruNb?=
 =?us-ascii?Q?QH7rcstfAV+J1hqT+mQbFv2zYnkCVw6BEoraSBhbjCPMoABlcKNLr3iSp9nG?=
 =?us-ascii?Q?dXSwLP5sgxdypBpdamJgFWLnt5CuISOaUn21kLoYqZeMvvzMz0PIseR7K7jp?=
 =?us-ascii?Q?H82FkkGz1OWlODkBfZ6A5T0pIIKrCzbhP5t8vqu7rINdLoQlhtEGH2UO8+zi?=
 =?us-ascii?Q?bYSQN0gCRsPiwjPar5MoEZWtjxt+DpWhea+UkIcmbqtbbaTr0kBU2XKbQIL6?=
 =?us-ascii?Q?iFUmr0nnOuSL9JeWcMQ6JB2h13hDn3463FjLpn348vBwuy9QxiTUYUc8JIlC?=
 =?us-ascii?Q?1qsJQZ3ZDJXY0Hjruzb7SK096pz6kh55rJ1Rh5s9pjgzpLhZ1vY/mjX3iuI9?=
 =?us-ascii?Q?36XDLknRXyVlvL6teKiY+uCvj4w8WWwGyXSqddUbJKihJmkPHCBt9gyMjJ5j?=
 =?us-ascii?Q?BlfelgKLtYpfKjLtvYBzN4Nz8dRm5MWR9wVJor7EjOpptWQriP+VDd1/SLDo?=
 =?us-ascii?Q?bviJTV2z2KTcTfwVtgQa4M8qQSn4M4whdAb1bzxwm6VMJW9jszvRfPyPtkay?=
 =?us-ascii?Q?6t5SvcJD80rRaYK6N4bUO0M5QRxH5ynxa1+DNn+6VSwHrHbLXD7Ffl87ICtE?=
 =?us-ascii?Q?3/SJePK9Av/sa6YvMN/VswzKzYFn5TY4fRTw8xukoFWDUAejwVK1hj4Nwjsl?=
 =?us-ascii?Q?Wma4kYApuCXNuH/gk2QdQwWgOr71l83lLwwp4W/T9DzGuETwqCzF7Wosnu36?=
 =?us-ascii?Q?TYFEMxmnJcaeTdRiLCfwnGE4mtO7R6oysgudZ/2eSxJxXx9P5t8/3qqpNXcd?=
 =?us-ascii?Q?paYlkgab82TH/yB15QxHzMFDSfc3OxxSRti4+nyHYpqAONoJFXWNYj3hwa3F?=
 =?us-ascii?Q?qZ4o0Y0bed9P30GjcSEDB3gESyrgookngdySZLwYmgPdyL41t30zGE2nPWSV?=
 =?us-ascii?Q?O+8nje0rdbe5VCM+dOzfrk95ZpCuUFUaMex72QuBnROiCgJYwZnXme7dTgl/?=
 =?us-ascii?Q?lI8opdnlXmGFWcgr/fzhQ+YJX9yxT0cbYOwjybL/l8NAaLtEB3m9tkOQ/axh?=
 =?us-ascii?Q?Y6GG25omYAw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CvfYBNiMJW23/9mYxdp43rRNgijQgQjSJv2jSavwqpE7ZqVRVeCrHUtktxXK?=
 =?us-ascii?Q?pfSRl+dyI6sLVcN1f4V+cmMWVWz/LlJMpeAAHFGAeAGLBt6W8Pwrx74kQsCE?=
 =?us-ascii?Q?NBsRy/RHgMEj1eraQs3YwkoGd4ibI98uEgPv6XXJIbUa1R3aDOC3nTYKOsrS?=
 =?us-ascii?Q?f16yFd3tbBjHdQji22vMtQ1sM1Pied8qAWolJv8rTmQVwwI7XE2DS1Emfu7J?=
 =?us-ascii?Q?68HN/yKMzaOZQ48j6f7XtE49iSP1MUi4yoXJMQs7ecQbFRs+D1J4v/9qNeoU?=
 =?us-ascii?Q?g9161UY9nWzj0YMnLl+eGyn6wkHnXUD2HpbH1w2A+zbDU5tjA326dKux7jql?=
 =?us-ascii?Q?diYf4JL8Dcy9ZMyMNnTTjDxoBc8UpgkZLhKhGmBl3kHwHt+JVMZB0WNbxki5?=
 =?us-ascii?Q?F9JlxSKxEkGu5YxypMJoFOIJJEQK7roo/bai99vjH68iMGNk0b6N+XsrbJqF?=
 =?us-ascii?Q?DgBErUyWbi1qMqubu8gft8fXByS25ewBkdJXufDIlofrGUzo77mja6uJL3ki?=
 =?us-ascii?Q?4u5xUHqETThD9J5gGx9K2+BLkirhXDGRnH2zJEVcXhEBFeZ0rRWzbD7i1JzN?=
 =?us-ascii?Q?PTFgOiLULZEFdoJ17z5Ryy9p4U1CD94AGqIaPRup9j3ZVEDuIZ9cQGCP3Il3?=
 =?us-ascii?Q?Xp7D1Jsr5T7FdNbpFPaNRbZ/Bx6cUN48m1MFf1c2CEuNVAu/AeBZ7Bt7KLJX?=
 =?us-ascii?Q?t9qZbvbUIZwUA5Ti/YOPr5/vdd3KVDdkya93OzZz1Ckkg8fsruBsC+NqcSdY?=
 =?us-ascii?Q?o3l+Md7NP6ZuKTljZ9iJumnPjlpiejwXEmgvCA59/MW/Zs00hlTfNS4mqbOb?=
 =?us-ascii?Q?faSmQGCVG5By0Riav0Zukznu64Xunch8UY4oZnzGlNuou5IAXBqrLKH9sqsy?=
 =?us-ascii?Q?RRVKKI17RsvgJ3LvY10LmbTNH+TnjKQcOC08/RpAxKsPkIYqutgoCpNNoxNq?=
 =?us-ascii?Q?6SDsWConQNGd4LoQ3cs1r11npuvrQkDLsMAYZGYmRtU03OIgWuXytya+cxOy?=
 =?us-ascii?Q?vzgnXXeOdO2UNua4zrWsUbXTDAOSsam3FSz4+QzatNvlYJuRyKRrb4wVV7K0?=
 =?us-ascii?Q?Ygfqp3KvhxGZcBOgTrsmRaLpPny9Tsxy5d3I9ENpwFzkcuJ8f120hCxk7E7K?=
 =?us-ascii?Q?2/C+Hz5LFXxZnO8hkNnFg8TPGY9uHJT3AwozEuf5CC7rnkAs8cXjI7WdL5ri?=
 =?us-ascii?Q?r3WDXINkqNN7ZAXWnYL11ozjL/hWlp/EeIoo5oVVRtyaKMFW/vlBSwQRc0bZ?=
 =?us-ascii?Q?yCWODPMTEj/0BRAav4ofrIajH7ZTgOzE4RfTitnZuzT7FgBeSizkJfDDVNXH?=
 =?us-ascii?Q?HLLylaCALgl/uOR0Lvaq9X1/uOpYCEWmdIn8WCEADJn3tbOhCZYHZqpxJocE?=
 =?us-ascii?Q?bHO5yvz4qmuveYsryHPsBaGerV+FeoRQVnqBB1wRi51IcrHl45qn/R5zHWKO?=
 =?us-ascii?Q?viLt+bmgrpwtvM4GFZbJAj1l4Q1UFVEnBQfK7JkEFunArPh28TX/PTioksh6?=
 =?us-ascii?Q?oD8egR3FwNxV1N+Qc8eV1ruWzYUhBeLOhF3lfcEDc51FGzgSFkvuAqiUNi6t?=
 =?us-ascii?Q?pnh5Ig/36o0U2i8CjQb8e9sCaifmrIKrHJNzpyU6wcmBc38Qyp3ALpeJ8CwI?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d64503de-739e-4ccd-033e-08dd8123d1ac
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 22:28:19.9416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QH09IG1ZFaCaYOV//lpwAcA5bMBdFcDuYUR7AeJeWrLp1gMBH5nGZo/JJ8EZO3KmiriPrPerfB+SCxQkaZz+cVIOsRf7uywLIl/Z+yFM6Mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
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

On Mon, Apr 21, 2025 at 03:10:31PM -0700, Vinay Belgaumkar wrote:
> Apply Wa_13011645652 to all PTL GT steppings.
> 
> Fixes: dddc53806dd2 ("drm/xe/ptl: Apply Wa_13011645652")
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Matches the update to the workaround database that just happened.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 9efc5accd43d..de8958a46ff8 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -29,7 +29,7 @@
>  16022287689	GRAPHICS_VERSION(2001)
>  		GRAPHICS_VERSION(2004)
>  13011645652	GRAPHICS_VERSION(2004)
> -		GRAPHICS_VERSION(3001)
> +		GRAPHICS_VERSION_RANGE(3000, 3001)
>  14022293748	GRAPHICS_VERSION(2001)
>  		GRAPHICS_VERSION(2004)
>  		GRAPHICS_VERSION_RANGE(3000, 3001)
> -- 
> 2.38.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
