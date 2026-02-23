Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E10EA4FC2
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 13:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171CC10E2EF;
	Mon, 23 Feb 2026 13:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQET8/zo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA0B10E2EF
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771854802; x=1803390802;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Jfp14Fhh1Rs1zhUER11u8t5QnNWZyK7Eef64uGikRfE=;
 b=AQET8/zoq1ZarquufaOv9tpNsljS9wWb8deev9lr0WntyHfXAzpy/TMs
 m+H2Yad2OcWLIjU/Eo4q/xrqS7U32GBHj19J8mX7tTLhlJqxReO1Ys6Ag
 EDr1WX0mzluGJ84b3VEm+Pejt88YSyL9esfY+af3Jun2SNur2U9SzSl+L
 VKLNSfSp5zCKoe17KtQkSFwzT8G9l8yJQVN5MzL6QSRF33orwePaihMnE
 cEJWQ65/teDFEmA3GcyQb7pjwNOvm8yt43oPeaPXiNB4sL9i6Wov5zyNw
 wh5wpEHFXX7WBeza0aE2Z7783ghCTDk+JCaB7lrW/YnAM+pC9RJa11jpd g==;
X-CSE-ConnectionGUID: iwH70GZGQ/G63dA6221ZwQ==
X-CSE-MsgGUID: AVmsb7CQS+mktFIqf4vC7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="90433381"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="90433381"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 05:53:21 -0800
X-CSE-ConnectionGUID: gpMPd4zMTwSz8z3p9UgJTw==
X-CSE-MsgGUID: 0NUOusGET2eNb96aIEyqYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="219112550"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 05:53:21 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 05:53:21 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 05:53:21 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 05:53:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFs5ABTet+zsHPXU1sFncIGHO+I0/Atye6CBfV/Igylnm+EAqjO/61zD7rhabDX53eBuQL75/M4aKSFvwU60rLV3NsGlBvxPORxgNh9nYpzQrYab+9WpTzS4kQ7GZbSzV++u6HgfWthaPG91n+SfPNcXyVqDcohaH6yU+r17OpvXrc+8mSo3x60riUarpTgnarnjLCkLbJ86+J/1cDIzpkF4CYGczGV4D8XuER+OCO6QD/jDmVWZG4K1NOrd2MLeCg2PFShmgBolgXd6nSRCIlHcSwtfPwlZ/3ohe3T3ofkBn2bD5b32/i4qN9CC6lPc8lQs2XYc3tKuyszwNQf1Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5n841qaf7WyWp9wQImE7Al1HTiuFbZrbCWSAh9qkYo=;
 b=TNE8vsObcoq2ONhpRt8S/ZD6w+Bq8ddXnYd3WJEgLcNg0WSWBHo9ok0YSGKNCCyxb3PdM2Us9a9jnd6X7uieKQSthdnueWdYeebJaSAQz0LkAfyU9t7k2qKdBtTY+LS4tik8m6P8Z5r1uvKXQGtlo7/C2b8yY7v7+vkQSJbFTkK4559cK4ceBxYqwueUJCnSyg+DFIMwcb0kIYTpF6oZLvmov1P+oAXPCHgM+73URSL9T2sPr4ljURGTQBz7F/q9MMxIXEO2YdJwgZpF9wyVL6l1hHG8JvJXWWqyKswiDlYxSqsPgMRoIb8Z/3xLeZr4nRvucHdR3CT970Ms189fpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV2PR11MB5997.namprd11.prod.outlook.com (2603:10b6:408:17f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 13:53:14 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 13:53:13 +0000
Date: Mon, 23 Feb 2026 08:53:09 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Don't expose display modparam if no display
 support
Message-ID: <aZxbxdG50DlbWW6N@intel.com>
References: <20260216183240.1308-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260216183240.1308-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0045.namprd05.prod.outlook.com
 (2603:10b6:a03:74::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV2PR11MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: 304991f4-e391-4103-694b-08de72e2e31b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9QUgZu10oIF3S4IKaz2HxFORVbI/c2nvXJ/bastEhYCdA4QJRSOnoyNiaJNK?=
 =?us-ascii?Q?ukgy/qjV27iZ0gTXWbfiesh38qrBOGaVcA0J1TuFYbdtQV3g835SQfYzBjrO?=
 =?us-ascii?Q?B3YLGf9ynR4W+KX2qVk8YpCB+y9xajvb+4bdBzBvK8cPe0cf0NQEZFTwZjZp?=
 =?us-ascii?Q?fbKYC1HKa5UoxkLEGQvq3pGoA8mYCgqKgyGT/HuEFy46fsIOBxL/7NOro9r4?=
 =?us-ascii?Q?YfxcClCw3/TzrPbF0u4XDTpf71r8eDbTd5ZwzWkc188n4FCfsQBwLxZZRRZx?=
 =?us-ascii?Q?fHrS4I0NI1rkzgjcdSsGo7zIfNHrP/cQ1nf0seMSHWlHGWo+UAvnwQeykI+b?=
 =?us-ascii?Q?abW4Gg/nrMfV4irUd9lvNVjg9BdPjjb4YIYzopE2haeCYeS0TW8C0hXqJ6hc?=
 =?us-ascii?Q?pKCO0sw3EST8hCq8f2s4U1hRzQGAKFHox0UWXYNe1OsyNoT/3d6eLAsoCNrs?=
 =?us-ascii?Q?rnbv+V3kj+d2u9SrEnX8cXNx6davGTYw80Y/sDVDKbKeXsj7fw1w/vrNm1k5?=
 =?us-ascii?Q?40zTTT5Nrzuen3+oWbFxuCW6Q0y9zGhI90Z0PW8pMpTJ5Q9kW3oEqXrDBGCE?=
 =?us-ascii?Q?nvsITimsJNngBsFTZuhZrx1fULAX2jupB4Kr5jI7OxSZ3/apfX/clnZtErwO?=
 =?us-ascii?Q?JLC1gVQ3Q7saOUr+j2h71/KXl6TGQy1Win9Qw077AHYAIYZhQA52ZOSINkSN?=
 =?us-ascii?Q?/44BJPiYBLT+ySVlj1R5Ag5Fh3iBKuMj8xvhBStTHjA6/g9nA77XzJzkvu+Z?=
 =?us-ascii?Q?tSFwtKO3FIiRlHJKZojxGeD3BShw/D7x/abyAh0eaGLPaoam0tavvGhVH3Yk?=
 =?us-ascii?Q?eEMdsb0Ltf74iDLKqY1LNKIw3MrbTbSKLcLRPIyIXwkWCXMLn+OTf2kxOYMC?=
 =?us-ascii?Q?Iv+jCl1fM6bUgPQFxBSFnqhXAGdYZu3RdzAkY9uoMO9JYYWt8nTA0noH2u9T?=
 =?us-ascii?Q?MbksGUFS5ayBMrMuj7iEljr4SXR3ubYMQY2bADbeo2OTNCFLvLijQTs3JInZ?=
 =?us-ascii?Q?C1UlMGv7zqt+HgeKAW90m7q/NlV6WOOJCVrqZDOuZKZcRJQFXoLQwyJIEVoJ?=
 =?us-ascii?Q?cQ9nwB7mbaAPfkENXbJp1nFg7KILa/rEe77bW2/Oy1cy8VztEzHOfhwtvctF?=
 =?us-ascii?Q?BYUQ6H9MurV4TdcSHgH/Lvk89NTc6Yn7n1gheTcy9MP5rGUrzwSO9HfJUbfB?=
 =?us-ascii?Q?Ohnn761CIcUyR8AHnouNOYXUPlt2df9uOfcNYDezGvxm+eoNAEfEXgx/uwnn?=
 =?us-ascii?Q?BTGbxFruYykwLGbyfX60YZWX7lA4WFMhiqLhcZCdMrtqSyS6tkFsnqlWXgf+?=
 =?us-ascii?Q?E72f9VB167He/jJBl+Z9fTM4dlEjzjWcMZbX0PP373gEGH2RvDbZuLrSojrI?=
 =?us-ascii?Q?Dz516TXYcHG5rejb/ayTTS9gEszYqj5VuYLPS3rnN+CFg7/MfqKS00tRBAk3?=
 =?us-ascii?Q?wkDRQrE9h0+5IA036w8b5gF63h4rn6CGbqcyOCMiuSNMNcG7s5K7WMOsdFLM?=
 =?us-ascii?Q?1uaNhTnn10ZT7Z5M2FYlywo8kAECV26mWoo3kwNMZrXXqKXwgusSUMp5V29o?=
 =?us-ascii?Q?PN88HOAD/sW7tE5N4eI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z0rT5vpMR3Fsh54QQNg+MWdnXowWAs+XdxBJpfZou578Fy9DmZamj+26jKrr?=
 =?us-ascii?Q?+Kcz72Zfn7UHJa86DNGd4kHMBJeAJ8RpYSpWQxGynIl6eMAxeN2m7JFMpldB?=
 =?us-ascii?Q?WpLFYX6YNSiHSK3b9V/65KzzrxksRt6fc9FkEgR9zxuZ+cvAd8HdVz+CtTrn?=
 =?us-ascii?Q?liGsMG9bZzZS0R3eyhkJpXv/FVhKFq/0+c9SxjyBi7kfDjci36fTodIyXeGa?=
 =?us-ascii?Q?N8nSPwIul9jiq9ggU28IinycogGUSGPhf31RD6yFVrJFT1wAbsvavo/5n8lL?=
 =?us-ascii?Q?PdpJiNA84rDf7RsPZKI4MdWNnn5CImWprwhlhq3BK926+BM7Q6Z8ZUEIzWMk?=
 =?us-ascii?Q?fX8qlhL3a7UF7Rphee4GK/C65URv6gHASWsp3Zi5Rslm/HNjBowO0uX1ibL3?=
 =?us-ascii?Q?swhTtbSgXkJpSjz7DXl76QiKwuNvPDbCKjBXgQEgNhdOFtywnS6bq/6a2POo?=
 =?us-ascii?Q?WY4kmmSWZipPx3qHLH0fe/cewEk6ncZ4+XMojuJYyeebjhGOO+6iToxcPnV5?=
 =?us-ascii?Q?HPdNNAz9fbBGhmHkT/I3C8ep9N75+Ftnu4k5uCPE6XmsL78dLqkAJPGw6N/a?=
 =?us-ascii?Q?FtRlmzb/h4VmwwQSDvqphC8dRhRSu4miIpcBInOysSPXGTxDQ2wjyPrpVSwW?=
 =?us-ascii?Q?FOuwHbPT152D9JltaIazouLv/7DHjpzdM7RJxEhr/SVWbfsXonOreO5rF/oG?=
 =?us-ascii?Q?YRH2W+SsZpr5sQgAx75ckiv0dagwhIO7B3slMDoMI0qfVRI0J5v55pzheUEs?=
 =?us-ascii?Q?g1WSihCxMT7DdokfK0JXhI7klMPsAY4vU3DA2plOzkjixXd5sNALIC3gAGlB?=
 =?us-ascii?Q?H9PcHE/6JT6jeSTijRFkbAPovYXZes4ap53jNhRZeGy6hMtxOQRGfpOD5M5U?=
 =?us-ascii?Q?316oBiMVJ3VLY/jkbiNVsHVGQwRHLdWsZcy43YE17/C58LFpHa7ur6MQ/X0T?=
 =?us-ascii?Q?bJGAPZQsAxc3gs8RJ/ukRzMZCe5gWmM7e3JkECvodNlFsjbEYZdLoaLq+tJp?=
 =?us-ascii?Q?1g7ahj8d40fmOIkj0zUn8pXyXGeL5G9vxRRWcxAtOP1BiDusI/ElRtNfWHar?=
 =?us-ascii?Q?mzThh/c3cWXrPar8e0OkcSfGasyhmevUx+YS/LtBRfkN8drmeF/0z3n87zEP?=
 =?us-ascii?Q?XcGpf2avz1nQXmeuSutznhZIGpLj0KVL551NG0vValdNOFycSBv3SnRKJ6ct?=
 =?us-ascii?Q?RmLtwU3aMU7VMYSlOzwMuEqJ7iLBa2fer3p+P9Axq19LAFIiFycCGljImV+Y?=
 =?us-ascii?Q?vLFYFmm3J8ToLK27yr8j8gV4qh7qKFoQT9mtDcr8yehnWNJe/ZX8Xzt+TE5F?=
 =?us-ascii?Q?DKYsRgbRMQ2tRI0j73iLgSx/VzDGPx2bur2QIt8oIBrqkXehPB8Jw00BIt33?=
 =?us-ascii?Q?bMiSPEAAY0rwb2gRGdAtI/VTwiXVVYjkmiIYeHnIiB8xUhUPmCdhT6Gljm04?=
 =?us-ascii?Q?lPhjo9JFP4YwbVwqlIUyatADL8JxRDZFefoTOhqj3AnapwiiptmFqZjUHpjt?=
 =?us-ascii?Q?Gq3BpCmeezrw7lGKH8QGrgCJvZxVPfdtYiMHtlgl8NYWH3I17udAaOLS+qzz?=
 =?us-ascii?Q?k8/D7Hray/a470eBQyQZQbH1ASpKZA+OWQsyFj1sx1kfQw2phTLwn2g2PJ55?=
 =?us-ascii?Q?eMpI22C2TGhRKLgWDg/aLlrmMo8fZjuzuFf9MXwXvbxJtXzH9GGmn9gMcaU6?=
 =?us-ascii?Q?gPuWI8RCjiuE0nflUC6Q8lPAKdQlKL4sJ/qza5Lz62yk1S9Imvo8fCnH6ikk?=
 =?us-ascii?Q?JBM+7Eao+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 304991f4-e391-4103-694b-08de72e2e31b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 13:53:13.4796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pK1VUeWfTiuJcHOhweAxlC7mJ8f708pxNE1R3LirufDArZ3B99etqxyMQGOBP2Yr1uHcA1OfABK8JEYUPAhW6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5997
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

On Mon, Feb 16, 2026 at 07:32:40PM +0100, Michal Wajdeczko wrote:
> With CONFIG_DRM_XE_DISPLAY=n the display support will be compiled
> out, so exposing probe_display modparam is pointless.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

thanks for confirming the command is ignored when not declared.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_defaults.h | 2 +-
>  drivers/gpu/drm/xe/xe_module.c   | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
> index 5d5d41d067c5..c8ae1d5f3d60 100644
> --- a/drivers/gpu/drm/xe/xe_defaults.h
> +++ b/drivers/gpu/drm/xe/xe_defaults.h
> @@ -13,7 +13,7 @@
>  #define XE_DEFAULT_GUC_LOG_LEVEL		1
>  #endif
>  
> -#define XE_DEFAULT_PROBE_DISPLAY		true
> +#define XE_DEFAULT_PROBE_DISPLAY		IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  #define XE_DEFAULT_VRAM_BAR_SIZE		0
>  #define XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
>  #define XE_DEFAULT_MAX_VFS			~0
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 903d3b433421..4cb578182912 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -39,9 +39,11 @@ MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in MiB, must be p
>  module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
>  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
>  MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
>  		 "[default=" __stringify(XE_DEFAULT_PROBE_DISPLAY) "])");
> +#endif
>  
>  module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
>  MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB (<0=disable-resize, 0=max-needed-size, >0=force-size "
> -- 
> 2.47.1
> 
