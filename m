Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB8FE7716E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 20:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB6B10E5CA;
	Thu,  5 Dec 2024 20:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EguIxOuI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078F510E5CA
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 20:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733431331; x=1764967331;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gGx3v13ylOdRjgkYZPrRc/rwkcmg/Gd03/Pe9VFWtk8=;
 b=EguIxOuInAY0xqVj2zzH51+ZtRZH/sLKeeMKMRYwXZHTAo+UlLYY8G3J
 NVBSwmlawQXKWXVyJwq0y1fv8BMEcx24tSHWGtrM2ebjZQn4coJIB2v7C
 f77/WE3thT200/cLYIr7IVZ1cIhdTsvK66HnAZbAt2SViX7YzdXHJQLyQ
 sN7AfXYV3V9JOxXH6GRBgqgA10OzGwKZhKNpCBSwtXQ0yHvM9uCM13Ggm
 Yg8xT1a4HvD/OqBsGFo6iNiYkROha272l2DNXepljqI0CMZUKRG6Iy1N7
 AMNLCdgzrqkIXSO4SVOhwo3Z5s66Z/r6U6YmyWEmYxiwsp8aO++SuDJvW g==;
X-CSE-ConnectionGUID: 7cAmQNciRMGLrOF1fNBk6g==
X-CSE-MsgGUID: 0/SNMxncShil6Oqt/Sg20g==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="44794797"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="44794797"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 12:42:10 -0800
X-CSE-ConnectionGUID: mIQs1isMRWmEtXK1PY0mOg==
X-CSE-MsgGUID: WTocAXEcSCGltZLGB7X1AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="94651006"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 12:42:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 12:42:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 12:42:09 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 12:42:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsGTDBA6pLZUTxwJM/P0xOT3siJ7SXjXDTps+ZZCynBgu55ixw5NxdPUytxlBAqtZHaXPg0O42ZY3rh8TjgIkby6Nb07/Lk5D46XlRZf2M5mOzRVNMD0aO5WKMCP8nQfoT2pc1lLS9hvcMRiJHk8zvLhwpHf7De4n5X8FNLuCMBZDKFVpFezM+0HRJLhhDcuslfgo5sYhIpeP5UcvrJEs9M5SG+QcPS3ygFl37dtS2vKXG8BN1AfvsAa1r7fFcYZPXUvqrOL9nwyGwmETI25zykPq+J3C/f4X5uh5xKhZ7YQA0slJUp7jLH6OVqFwSP2pDL8o2B/RNdlz0eQobfu8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sm6y/NkjzkKgBpOXGFQDgvMIg6BgXPwN/ZQZUB6hQps=;
 b=vL2Xw/WThJaQ/5P3B3qvle1xNhlapSX1Hoy5imePuHYIJHzLuNU87F3idyTdMyo1gwKYJCQkHes61treQ5QYDLbPRqsTUPIVdHlJTPhCtMnkotb/+XrJErorJfPCV1kGH+8Rj7O6LmNAGYKBmXgSBbL9YuwZ3Qf/kyoeqis1T6wVL0LEz2s72N11HVFbr8ebUUphEfe/TkSO0O1WXDCq3CwMPKvQHXdWi008EY0XccQKbwhldQEVWAuWBvkjofLvLj9EewZukNw3pba5fsR96JM7Nt3HUBHdZA3KnRX1YEdIPYUDBpA8AkjKDhJC3whoXFzkgghnsl+k2SGvuH8JhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB6576.namprd11.prod.outlook.com (2603:10b6:a03:478::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Thu, 5 Dec
 2024 20:42:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 20:42:06 +0000
Date: Thu, 5 Dec 2024 12:42:03 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 5/5] drm/xe: Apply whitelist to engine save-restore
Message-ID: <20241205204203.GF3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241205182240.3463027-1-lucas.demarchi@intel.com>
 <20241205182240.3463027-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241205182240.3463027-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR01CA0062.prod.exchangelabs.com (2603:10b6:a03:94::39)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: 21511d44-ff53-46f2-f6f1-08dd156d47d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J9WKSpaJjSR3RuKQfJTiASfRTokOAArlo9Zn/6LY4WIlXuocu8fjysTtYWlB?=
 =?us-ascii?Q?h97NQ9k5rx3z6YIJ1Rp9t96bw7vEHBOMdz75eGFx+DjQIYxKVD59y5FxsDC0?=
 =?us-ascii?Q?Q3ThnSSsEPN5I6aocS2fof/8J+ZX6xBOBBdMxi2hcKB138priQAcbmDgE0TE?=
 =?us-ascii?Q?p/+TwBAfcUYrU/N9tYuopkasT0mLqqDe3fETj/OU40smRmBUX99VzOEw7YWe?=
 =?us-ascii?Q?3z8NFnioP6Oppk/+34fWxKxoG0Ytke8p7vn3DMdCLMGTYGa0dZbvwxTs+84k?=
 =?us-ascii?Q?wcCZJjPXh7Y9jzW6VgQ4NnnD9tvaieUskK5autca1GXrhaSPdjZ7istbqMqd?=
 =?us-ascii?Q?1wLB/gn46v4C9ZWUctHnZMqU2XDxUNKQ7ZZw5IHdajIJQ73JiDpmN4TO5J/2?=
 =?us-ascii?Q?PYjc96aEEkxx6ugBzwGJ3nkgppA+9d11bGJMk1/b3r931OedN8HlE8ZVNYT/?=
 =?us-ascii?Q?6QhIITB5v6PqKBe/mPps3QAxvZlJLWiZODcDzpL3iHDihdx1eFzF/JfbL1QF?=
 =?us-ascii?Q?nZutRutVRgibOdWMw3YbnLbe4aHc0Dpmr3u5haZgJkmkmMaAct8j3iI3FSI+?=
 =?us-ascii?Q?IjTC3jlsC1sLIVIUe5a21s+wk36yGEATWddP8NONlmTmreqdexbELGARXkYq?=
 =?us-ascii?Q?jEnpHtnS/UT4dUbRLq4Y0YYLJizVmfAdr4p/vF96Kz7HWJM7gA0HxCL7333h?=
 =?us-ascii?Q?AeNWzAMrBR1MnTzoAgCBiBvZ/l7PCS/y6G2xPQu8uDUvhW6AA6GKymPDPS/C?=
 =?us-ascii?Q?8gV0U4D7j8/iHmsRY7HaAYIvT8yEI/KtRQ99TPVdrZZIAmAMZt/DvPuhKVtc?=
 =?us-ascii?Q?XbhsXUV4Z/XIqs86Tc/ky5e7S8J39vHJOVek0iQv7R+uq6biX5FZSzF4pzTR?=
 =?us-ascii?Q?MZ8x3JmLI31EVagzz7vXMO0OZYpyJVq3vFkRr7xsS+JMcT0riCk1jcwqJ/JU?=
 =?us-ascii?Q?yVskXjQYIjknJpW2jstlz682XjDhLcEYVhIQsqMgnfDqHakRnEkZgqN63iQ6?=
 =?us-ascii?Q?IPdHrsZXY3p54H0hNhN7Vs09beG192v2A012kS8RJWhBtpDTzduG511uinBa?=
 =?us-ascii?Q?YjWgIxzJt8TCzO4u4GXDYEZwc+zUdBpoRFHb94VxQ0uAeFIYxSzI5lStwlHe?=
 =?us-ascii?Q?ZiXESx4O/sZYXM7uf6NVGuTSXTgbKRTBRaKlNMd8pVNC4cDAOAqqa96g5quM?=
 =?us-ascii?Q?LHKZK0IveAcQ67jEJFOgJp+oCalizcJ9wfx/gce0ZoGffjpnWKZ7RVyTDrTe?=
 =?us-ascii?Q?awrJCxylU9OQcTZDY6tPwVibDbtJkNiuzoFWeCsQYo3vkAGjbj7FyeHfnyEN?=
 =?us-ascii?Q?rMkNNPhGzKq1h99vTYWT/+DkuYe6S9OBKwsQXQsu03umjA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fSa+dwISyeW86U0zaHXiUR4fz+3/sSZK0lu6ptI9eRLEKZFltg1qOWuJPt20?=
 =?us-ascii?Q?ko1wBfu/vUkZ3DKrOLI/Y00CKGaVvT2kv9WZryHlVK01mV9IBjDEB5oBQweW?=
 =?us-ascii?Q?vPMRrcCimrdG4GwQzMVdyYFhCgdxGZW8KSEZFKB9zIlxv375jVS/iKSQPAzW?=
 =?us-ascii?Q?vcXXVGDz5+4gEjWJAIm445COIzdBgjbchT3ZhYst8ENp/p1zIrve5YKwjljl?=
 =?us-ascii?Q?er0oBPQC3Q6yxNjIosaT2BTSb6kHGW5DPTeGjoUcRqrRq1XEVVPZobBmJNOO?=
 =?us-ascii?Q?IjNtovJQSxRLZvjsQ1EJ/3CeZ6KQq2zo5b2/xTTGHYQoFPpS+rt2O8AfoxCZ?=
 =?us-ascii?Q?y7g5GUDWA9fHgUyocUS2pbxslQiRvpkkA6vmgwMh8D0M2wkun9MmneCt3Mml?=
 =?us-ascii?Q?G0gDQmD3BdKyBsFzx8oiW89ebFsNvRqiiboXIGgueOs+tiUesk4OIoYg621L?=
 =?us-ascii?Q?HiGSLULEkOv7sQp7RyBWacFxdEHEZweimUuGiljXPxKwazOeeQlMwURd54mg?=
 =?us-ascii?Q?BhfcC14B7Hg2ktw5hnk9s2MfCbbwHjuXTc6SAAs1bn0IPw1ELH7hGbEYHxqf?=
 =?us-ascii?Q?51jBTGjQ2z3pnNQgeTPDC0z2p5oS6KKMTpDbHgLzqtEkUwyYOiFvIsfJYeeV?=
 =?us-ascii?Q?veYOtBLq1cHb+RpFy+A8b182fmCJ2mZ3teTmPQN2o28+IfBHYlNoXjudlxxh?=
 =?us-ascii?Q?uRNFCU0vykc/wkvmEM0sL+YPgXBuEWkItrjsI2IEbiqrV2lES7g9EwXhGETY?=
 =?us-ascii?Q?xKp01Ok8yDQUhjDinszZlMNAith5DteKaiIht8tFVNhwtbdT1wYZ/KqdKEOC?=
 =?us-ascii?Q?sfdn1aMzTGHkk0UXp937A/kKfpiYjGOgvOuF3y7XopWIkDPrnsDy8TgvIzUe?=
 =?us-ascii?Q?r56ACxIl4Z77LCwUXhd+BOvj7QAAC6fMxiUbl3KqJAzQbSlOrDdJQgORsZ39?=
 =?us-ascii?Q?enzjyJRns8Z7kO8cdmxgTpDuyg/PdKC/3EulnqsDzeb9yCHQ5oHou6GQUZCA?=
 =?us-ascii?Q?QViPq3qu+dI64sY3ZlRCir2Kem9UramBaQz+CoRydcLlL0C7IXg1y7bwGeDt?=
 =?us-ascii?Q?8gg+Pf7SGbrK8rB2Gt48WYmb0BuOZkP8jbQSgz9wVc/lWq8A7VMk295RXnTT?=
 =?us-ascii?Q?6WTh4iySE1jOZrmyGKig/iQS3jAjj6KLPR/c31awa66spv1Iiv2v5qg2OTnm?=
 =?us-ascii?Q?hL0mt9gCah13tRgDEjrmmuKwem7KZRU5mDUFGFCkI4kMpyCAG+J7JHv9qzw3?=
 =?us-ascii?Q?FTcJmic7DHY7MApIEamaGRT0qoff1VVXOEt1NkjZ38XJX2paASJxlvpl4Esx?=
 =?us-ascii?Q?vQM/BrthDpADl1m+XOAKurb4Ge0y3T/mp0XuU7nd6JOS3N1QYQ4Ubfwoz+wh?=
 =?us-ascii?Q?X9Xv/pHmKRMdVAWKh3n1LU+kbcMYE1dREjQjW7KVkVFdUjp7VBpYYNteVVxY?=
 =?us-ascii?Q?cYSoIvzxncH78VtfjZAEKnrJPCAMieZKJlvSx1M6swEJ896RTqRt5gbX1y4x?=
 =?us-ascii?Q?tT7BA5tMjHKiFRjEtAocFbmvVrakIQo10mz2kKJa8/qC0rYPZQkpm9PSWiKm?=
 =?us-ascii?Q?PuqXWbfLhSPSN6CTzCVrxIJH8biXWqDU0c9ZBA69DFAqFTQtlz3/xE84zjGW?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21511d44-ff53-46f2-f6f1-08dd156d47d4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 20:42:05.9160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nf5JJ6EbcU7a1vrXZ9pnkZqT/QTYDKsPufgJb2dtcpQTf7c/A6UhZ1ooybiN4z27qPaOHLGupSeuFib7hGv2J5G3TO2U/OVZ+GCmWdTOBwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6576
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

On Thu, Dec 05, 2024 at 10:22:40AM -0800, Lucas De Marchi wrote:
> Instead of handling the whitelist directly in the GuC ADS
> initialization, make it follow the same logic as other engine registers
> that are save-restored. Main benefit is that then the SW tracking then
> shows it in debugfs and there's no risk of an engine workaround to write
> to the same nopriv register that is being passed directly to GuC.
> 
> This means that xe_reg_whitelist_process_engine() then only process the
> RTP, converting it to sr entries and then add those entries to the
> engine sr. With that all the registers should be covered by
> xe_reg_sr_apply_mmio() to write to the HW and there's no special
> handling in GuC ADS to also add these registers.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c            |  4 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c       |  7 ----
>  drivers/gpu/drm/xe/xe_hw_engine.c     |  1 -
>  drivers/gpu/drm/xe/xe_reg_sr.c        | 49 ----------------------
>  drivers/gpu/drm/xe/xe_reg_whitelist.c | 59 +++++++++++++++++++++++++++
>  5 files changed, 60 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d6744be01a687..41ab7fbebc193 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -748,10 +748,8 @@ static int do_gt_restart(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> -	for_each_hw_engine(hwe, gt, id) {
> +	for_each_hw_engine(hwe, gt, id)
>  		xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
> -		xe_reg_sr_apply_whitelist(hwe);
> -	}
>  
>  	/* Get CCS mode in sync between sw/hw */
>  	xe_gt_apply_ccs_mode(gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index b0afb89d9d90c..943146e5b460d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -243,8 +243,6 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>  		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
>  			count++;
>  
> -	count += RING_MAX_NONPRIV_SLOTS * XE_NUM_HW_ENGINES;
> -
>  	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
>  
>  	if (XE_WA(gt, 1607983814))
> @@ -729,11 +727,6 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>  	xa_for_each(&hwe->reg_sr.xa, idx, entry)
>  		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
>  
> -	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++)
> -		guc_mmio_regset_write_one(ads, regset_map,
> -					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
> -					  count++);
> -
>  	for (e = extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
>  		if (e->skip)
>  			continue;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index c4b0dc3be39c3..b193667441488 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -574,7 +574,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	xe_gt_assert(gt, gt->info.engine_mask & BIT(id));
>  
>  	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
> -	xe_reg_sr_apply_whitelist(hwe);
>  
>  	hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
>  						 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index ea958400a15a1..9475e3f749580 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -24,7 +24,6 @@
>  #include "xe_hw_engine_types.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
> -#include "xe_reg_whitelist.h"
>  #include "xe_rtp_types.h"
>  
>  static void reg_sr_fini(struct drm_device *drm, void *arg)
> @@ -192,54 +191,6 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>  	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
>  }
>  
> -void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> -{
> -	struct xe_reg_sr *sr = &hwe->reg_whitelist;
> -	struct xe_gt *gt = hwe->gt;
> -	struct xe_reg_sr_entry *entry;
> -	struct drm_printer p;
> -	u32 mmio_base = hwe->mmio_base;
> -	unsigned long reg;
> -	unsigned int slot = 0;
> -	unsigned int fw_ref;
> -
> -	xe_gt_dbg(gt, "Whitelisting %s registers\n", sr->name);
> -
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> -		goto err_force_wake;
> -
> -	p = xe_gt_dbg_printer(gt);
> -	xa_for_each(&sr->xa, reg, entry) {
> -		if (slot == RING_MAX_NONPRIV_SLOTS) {
> -			xe_gt_err(gt,
> -				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
> -				  hwe->name, RING_MAX_NONPRIV_SLOTS);
> -			break;
> -		}
> -
> -		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
> -		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot),
> -				reg | entry->set_bits);
> -		slot++;
> -	}
> -
> -	/* And clear the rest just in case of garbage */
> -	for (; slot < RING_MAX_NONPRIV_SLOTS; slot++) {
> -		u32 addr = RING_NOPID(mmio_base).addr;
> -
> -		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
> -	}
> -
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -
> -	return;
> -
> -err_force_wake:
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
> -}
> -
>  /**
>   * xe_reg_sr_dump - print all save/restore entries
>   * @sr: Save/restore entries
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 3996934974fa0..0be105b305907 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -10,7 +10,9 @@
>  #include "regs/xe_oa_regs.h"
>  #include "regs/xe_regs.h"
>  #include "xe_gt_types.h"
> +#include "xe_gt_printk.h"
>  #include "xe_platform_types.h"
> +#include "xe_reg_sr.h"
>  #include "xe_rtp.h"
>  #include "xe_step.h"
>  
> @@ -89,6 +91,62 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>  	{}
>  };
>  
> +static int whitelist_add_to_hwe_sr(struct xe_reg_sr_entry *entry,
> +				   unsigned int slot,
> +				   struct xe_hw_engine *hwe)
> +{
> +	struct xe_reg_sr_entry hwe_entry = (struct xe_reg_sr_entry) {
> +		.reg = RING_FORCE_TO_NONPRIV(hwe->mmio_base, slot),
> +		.set_bits = entry->reg.addr | entry->set_bits,
> +		.clr_bits = entry->set_bits,

Should we just set clr_bits to ~0 since this entry is an exact setting
for the entire register and we don't want to leave any of the flags (or
currently unused bits) at their existing value?

> +		.read_mask = entry->read_mask,
> +	};
> +
> +	return xe_reg_sr_add(&hwe->reg_sr, &hwe_entry, hwe->gt);
> +}
> +
> +static int whitelist_add_nopid_to_hwe_sr(unsigned int slot,
> +					 struct xe_hw_engine *hwe)
> +{
> +	struct xe_reg_sr_entry hwe_entry = (struct xe_reg_sr_entry) {
> +		.reg = RING_FORCE_TO_NONPRIV(hwe->mmio_base, slot),
> +		.set_bits = RING_NOPID(hwe->mmio_base).addr,
> +		.clr_bits = ~0u,
> +	};
> +
> +	return xe_reg_sr_add(&hwe->reg_sr, &hwe_entry, hwe->gt);
> +}
> +
> +static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
> +{
> +	struct xe_reg_sr *sr = &hwe->reg_whitelist;
> +	struct xe_reg_sr_entry *entry;
> +	struct drm_printer p;
> +	unsigned long reg;
> +	unsigned int slot;
> +
> +	xe_gt_dbg(hwe->gt, "Whitelisting %s registers\n", sr->name);
> +	p = xe_gt_dbg_printer(hwe->gt);
> +
> +	slot = 0;
> +	xa_for_each(&sr->xa, reg, entry) {
> +		if (slot == RING_MAX_NONPRIV_SLOTS) {
> +			xe_gt_err(hwe->gt,
> +				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
> +				  hwe->name, RING_MAX_NONPRIV_SLOTS);
> +			break;
> +		}
> +
> +		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
> +		whitelist_add_to_hwe_sr(entry, slot, hwe);
> +		slot++;
> +	}
> +
> +	/* And clear the rest just in case of garbage */

If we still want to keep this (which I'm not sure is even really
important), I think we should change the comment.  We're not actually
"clearing" anything (these registers don't have any kind of
ignore/disable flag so they're always active).  We should elaborate that
we're just repeatedly adding a specific known register in all the
remaining entries just so that we know exactly what's in them and so
that when debugging we have a well-known value we can compare against.
Since that NOPID register is already userspace accessible without any
explicit whitelisting, these extra entries will wind up not having any
functional effect.


Matt

> +	for (; slot < RING_MAX_NONPRIV_SLOTS; slot++)
> +		whitelist_add_nopid_to_hwe_sr(slot, hwe);
> +}
> +
>  /**
>   * xe_reg_whitelist_process_engine - process table of registers to whitelist
>   * @hwe: engine instance to process whitelist for
> @@ -102,6 +160,7 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>  
>  	xe_rtp_process_to_sr(&ctx, register_whitelist, &hwe->reg_whitelist);
> +	whitelist_apply_to_hwe(hwe);
>  }
>  
>  /**
> -- 
> 2.47.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
