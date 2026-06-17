Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62806CD98E1
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 03:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0835610E043;
	Wed, 17 Jun 2026 03:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7Ox5j6V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D65710E043
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 03:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781666835; x=1813202835;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mP0umdSyK1xX+qkX8+5fUCe0BGWz3CBpQjqBEx2VeWE=;
 b=f7Ox5j6V1OnuWTCP0vck+QzGQgWKR2dzlcZpWKkObKnNCZy8Ws/GBb+2
 g/B1BYSf9zlrQsHf35dBUIb1PolaB10vhUPjH8i/Mp5TycdRjsUC3x6EH
 iowBb3ydXopONaR/QH0t9HTplCX2H8fxiXBYXEEVhGP6zbGVrf5tiHjQ0
 KAN9y8twGVFuVs+zMF0BSPENpAR/Ekfw4FwIrkNv6iKB8v836CvKPEnqL
 88lErTktyIvQNKv7HRr+SUB589XHqNSW6TM4m3YscbqqXnGxGDJyiOwhk
 +O8mUFZ3Sg4tPobl/tx9o7jXK/SedWXOjn5cwjIxmEzLPzFqq8ycN+4Bu w==;
X-CSE-ConnectionGUID: /1i2Nf/gTcC6HqHsiOGNeg==
X-CSE-MsgGUID: AJEof7vpTD2tKYnhqz0u3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93119187"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="93119187"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 20:27:15 -0700
X-CSE-ConnectionGUID: hYio2OjgT9yLRM0Ykw0lAg==
X-CSE-MsgGUID: VsQsRpjxQ4agN6dfBSC6JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="253057087"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 20:27:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 20:27:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 20:27:14 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 20:27:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4vnmfbAauLBAseMO7iXgBTnimHaCyAP5esq4hDLW7h8QQ0AWkyudg+hqOgJ+GVFG7ow8YPPTyJYSfwqyI5svKsj1e6WyHRsRuO1TPOTn/cUOpX6gAubw0Z4SHUihRNlAl0PIDkR4PAeEA1n2scOXJ7JLjJMRCUb744GvsNwAPDuZNUxj5tRm2R9PResd8RbtaXdkqu+YwvADQriJCUxC8oZmBnS5rbuJf48CTibTpgNp/fy+EAzuEl5HaRWb9b6npXYEM2LlYtNbR/R7knzStxXkOZcCuJ4ClwP18/LyTl2HmWgWc/YhXUn9zB9rFXfBGtvQyLNcE69qiL8JC85vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+7JaE7gHyRq8bHqm6iy+676IUxH797xL5Y4jtiTVAU=;
 b=d06Pdy7Vykm+hed3ouyAmKE/anjH4OjNQSuL2ubL0hTMlbbxl5vlvxl5dIE17rmaqStgYPUJ2D+csqUtaREUVTtKwEMBR7QIoIe0pLHhjZsMTO2mQqcgnr1f8HcDY+B7GsRy7mXDxoxmtqOI/hFIcSb6/CaSTul3QOiycKbpHw9yhfwOHEAXXeE7mAI/kbkK6C2ddY7zYDu93HjPcThjiEGqGqH5aC6tP/B3Vhw9NWk4qTSr7lDbLOdduHYNNzb8uFOO8BBMRLP16PVxsK1gb65oFZpbPcBz0Dr+fsROmJo25Otq3C7/PmNfXtqykX24YW3sQO1EmC2oLNP7zyu1Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5801.namprd11.prod.outlook.com (2603:10b6:806:23d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 03:27:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 03:27:05 +0000
Date: Tue, 16 Jun 2026 20:27:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/pt: Fix NULL pointer dereference in
 xe_pt_zap_ptes_entry()
Message-ID: <ajIUBtlE25A9U9X4@gsse-cloud1.jf.intel.com>
References: <20260616081756.286918-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260616081756.286918-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW3PR06CA0030.namprd06.prod.outlook.com
 (2603:10b6:303:2a::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: 8714c1b1-aee6-4132-b497-08decc204dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: mXApgAx7dFJLngXqb7Kl09UlI2taoVjLZXn6GHO/N/kOJ5kldB89JOItLS5cPb3gLTDeFmE6DTkGJmElIrT00z/5PFk24XSWu/kWzjZDZ9KbkGC/Y1GOXfPafEgTu3b1bhjNX2wTQTHgaQQOP8GNUhCh5JuipYusgGqmlRy868CbkTild1OautR/OW0aAqPDgDIJhiQHxuHbLNIhdqzDewrt2pB5fO3a7YfFLPsvoOkKXfpd15WOItCz6bk+VOVRkQ2JI+Fv2lzuhct9/cu2HhJT3DlUyUzMo5XOC+7mvnW9hOHZaAM2swM0nAVh+5IBVPtXqkQbHOwq71AMbOpu7gT2R4EF2cw+qqKSwG6Pf4aiScPajM03FYqxEemcH3Ct06zTe/wbkpEIDBVysKya/LbM9O8NViVfSg9dubcnCXbhCjb4Z3ANf2uizh47TSaJuW3rwvhulvyCDqet3ISm7oVe074H1NvNVxzdf2djkrVXYKr9Esv/oUF0fRW0hZMt1hi74cIPEMtz4OvdiEI+D+vD5LgiB+C52XfKVbttog9BBJr8addT/8yyOIWtQkKRF4/piD90Oznwgqu0Cp64OYrnNNIEkQs4buH8+87C1mN2KZd+hrabqdhtJN370kRqCEMhCVmrCwgGEhfG1ImzQ8ERBXWoVWQOhTu0xu2e2rbER0dkh+4/YDfcRdcyEmvT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2dUkrNp+HHH6DjX4UdU/U0iqZgAdYpJEOb4qupSCC8AKzUq4F3scljMl4j?=
 =?iso-8859-1?Q?LN5lgpadLGJ6kzQS3Za/GVeo/GaGQkt+S1H5Q1B3mKyqgFHB9FroL3s0gp?=
 =?iso-8859-1?Q?JDJh3m8vweDkR1I3V5vQjPbjEGOrm4UgHsiIrAhyWifVmMzk4ZXFDrLTR+?=
 =?iso-8859-1?Q?ToTD4qQnxc5FvoiE2fm3Ydu28r+VoaGZwv+MceDagyJZSkxQLsVE9qXJ3+?=
 =?iso-8859-1?Q?Agpo1uLzUP8Mbb8AwJodRYCgci9Q9OhIvrdkPom6rcqXnGoGOkWlIGuGRo?=
 =?iso-8859-1?Q?LH6UtvGIPMRponA2nzDBkTCHOjySXpC413bekhOxGA8yNadW49epRM9KLn?=
 =?iso-8859-1?Q?mlrkn2DLa5ljMfGMsJ+EZDd1V7Fn1/HeGxg6YvyKpZnTQCLhoyW2Rm6AYA?=
 =?iso-8859-1?Q?hS9WDvyt6/Z8YOcjLNb2bvVSXL4JfUmsjsVtdSdVw5L5QODciom/AhhDON?=
 =?iso-8859-1?Q?2Obgl3ZnWj9Pb/D/UT4Zjxd1RElLc95W5z/LmWs3wMSzLOANcJeTqCOl27?=
 =?iso-8859-1?Q?4DlO0lCXgwnZm0bFrwPrVeF3Ai1+boCQMHlIHYk84zn6/0TqB0bZ4FShLn?=
 =?iso-8859-1?Q?/s19Stw9QoUXwU0eM71DQR5nF0Z05h2PQmmQULX5asYkjbBfdW646jkU3D?=
 =?iso-8859-1?Q?iVHqJ/MuXanhQBI3pejLlNrHqfgyMaQRKCUdTiwZrySqGPMCSxjApLQRBS?=
 =?iso-8859-1?Q?A9QN1gD2HUiZi/KuOO59bj4dekEDWF99AADM63cTDs1aLR2RCQbcLRvJbN?=
 =?iso-8859-1?Q?Z1p7xyhtO7ouL6HLlIjnBRe4huAhwavxM+HFRblaip2Ue5nMsHW1bAiJaK?=
 =?iso-8859-1?Q?gBIcjDlkzPkj1Tcg6uC/xtExIb9Hc82jXaD1jzyR9nMig9Ez6FAFuFnivC?=
 =?iso-8859-1?Q?32+oGYL4+yNaQ8UI2lIWK3rZr014jXuY/GN223ibNh0gGwNmfChoEuj9uC?=
 =?iso-8859-1?Q?oKUCjlS0AjMYb7tVwgvG7Jw1P93yxs0U5Xy/parTi6FeaPmZ7lRYENmw5b?=
 =?iso-8859-1?Q?iNoTW89v8xxccd8Szdlc06bWC4ypB/GTi9rhWK1bnT9gzdJUnqtuCoGuDI?=
 =?iso-8859-1?Q?5PL7LXfyC+d3u1AuTGkRI8T9Gs3QuPP0IFEumMHm2fTSfDD9zP3tFZ0zMK?=
 =?iso-8859-1?Q?CYhl7ODTdmg5DQThFQBS0vOVuUOL4nR4e23wwTyh4dD7W99YvVB6qHQbBS?=
 =?iso-8859-1?Q?yywfbamIBtfmhEHV3rK2auNHsiLxo2aqAwxAJuDobBtt0x9B+v51X3YF+e?=
 =?iso-8859-1?Q?+16pdWhwP+Kmk+/dqddJxmwdiYG9RNIgAGhzTFp82xoK2ZXlQDFtHd/LtR?=
 =?iso-8859-1?Q?Bdcv2qmAKBzTroGcu19baR7xS9QhVvANsfNAd9VTmPfgWYViIJolGBDWH6?=
 =?iso-8859-1?Q?0zF/EzIJJFtoYuOx/rbd6PL9BH+byUPqjyQRCVe7niLoAZD/V/hKThNnFA?=
 =?iso-8859-1?Q?5CJJB3goqAgMByJ+P+GL8EHaXhJW4BEwe1SUeKSB42POU3NBMZNKc69IZK?=
 =?iso-8859-1?Q?R3CwrvaL4YLlIr3ouK14olrth7oscjvhXh3F8g7sg/Hm7J13G8/yJpB1pS?=
 =?iso-8859-1?Q?k4+i11maVVyluMOqCrnL00b231hX3rvF43zj1fI9q9910ClDUYqSDGezzF?=
 =?iso-8859-1?Q?y/+0FVX6h4hAwFvw0+FSB4K3oiVZLd+H8TLkWHgXYD0uwJazj3O9/7D5c6?=
 =?iso-8859-1?Q?bex56dqOtrKpHv23iCBA/VXix4bCGnlhTNZcQW8YmzXHe8L0XZyMCfcMMC?=
 =?iso-8859-1?Q?WL2QIJQjiaLw2pNGxap8tPCSFn0Pg8QyVxPnfeVBoBIQP/88IsdmLuPv4u?=
 =?iso-8859-1?Q?F/PLlbMq8plo7jl313kRE6Uf4FzVKpE=3D?=
X-Exchange-RoutingPolicyChecked: N2XD1aVRmKD++ATT06CDj9nUNPElZJG/N0ywbXVUWLj0fLlGkhKxWSKN8e50kCLMcIYTPBCi9lmU0CEfYC8ITBlI5sI3iIsPTCi4lRgjntQTekiYNa7KfM23xZQKrVr+crgbigsl9Jb6xT+FuabSjFFhlNgygJdhLOzTxdz+UgL2gs23X7XyVe8I7JU3hny7/neooJaudhoP0AOmh9MZBtFxt3DSwvG2Z4JAYQyua+5evoLVVV01YzXknDeaGPojkQ6XzzQv7YKvb4zneB7jGcOeHnWQ017gFpb4mHPCE8c1xcIthEAWk8/OzPtQnRVSZD5ktmWocaWlLhSeHS+jgg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8714c1b1-aee6-4132-b497-08decc204dff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 03:27:05.7250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+4kW5fHshqo8dKuoOnWXJCl83Ef9CA22m1m9nxbL/H38etIqU69B79VmByhq/PX1Yx0Q3X7f/Od136Mxey8sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5801
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

On Tue, Jun 16, 2026 at 10:17:56AM +0200, Francois Dugast wrote:
> The page-table walk framework may pass a NULL *child pointer for
> unpopulated entries. xe_pt_zap_ptes_entry() called container_of(*child)
> before checking for NULL, then dereferenced the result, causing a crash.
> 
> Move the container_of() call after a NULL guard, so the function returns
> early instead of proceeding with an invalid pointer. XE_WARN_ON is kept
> to help root cause the issue, but we now bail instead of crashing the
> driver.
> 
> v2: Comment that triggering XE_WARN_ON is unexpected behavior (Matt Brost)
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 15ce77ce7793..17db4bcc3fc0 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -885,12 +885,20 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
>  {
>  	struct xe_pt_zap_ptes_walk *xe_walk =
>  		container_of(walk, typeof(*xe_walk), base);
> -	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
> +	struct xe_pt *xe_child;
>  	pgoff_t end_offset;
>  
> -	XE_WARN_ON(!*child);
>  	XE_WARN_ON(!level);
>  
> +	/*
> +	 * Below would be unexpected behavior that needs to be root caused
> +	 * but better warn and bail than crash the driver.
> +	 */
> +	if (XE_WARN_ON(!*child))
> +		return 0;
> +
> +	xe_child = container_of(*child, typeof(*xe_child), base);
> +
>  	/*
>  	 * Note that we're called from an entry callback, and we're dealing
>  	 * with the child of that entry rather than the parent, so need to
> -- 
> 2.43.0
> 
