Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A1ACCF9F8
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 16:35:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89E510E295;
	Thu, 30 Oct 2025 16:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBPj5YXo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3E910E296
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 16:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761842146; x=1793378146;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I7A3L6SDzfrqOmFejQgax9XFIrLEr3kRL31o5Wl2Hho=;
 b=WBPj5YXo8AsU4yAu7iY3yU3qL06twB7LnShwtricS5vDrKhZpWp2iopY
 tmsCt66tEKDOE2K5CQUPjsVa3XuKICvm2GyhsYesZpQORZ5g0QzXozOGv
 IGuICkMCH8R5/CGcNk6whoWiEcqqva99VcanivCtVmMq40jvn4DeFa1IA
 vnfwXNu/FVw4YD9+zwAWd3pSuRpgicCnC9eWDkDIfqzQ1MqdljAEl5qsx
 jBT+s2CjgdSFuAcFiR63he2QabXnU7uiQ1cuIetPrc0r6lh/MlUXtzyy/
 2HKrNgmPhuPUtLBpO70cDMCfbFV8OQOOSEYHFWH1hwS9CQhmqs3xv+K5s A==;
X-CSE-ConnectionGUID: F4Vx+FF7TNKmHy7hqQAdxA==
X-CSE-MsgGUID: G8xFvBizSFSUeoXUsGHxPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63894932"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63894932"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 09:35:46 -0700
X-CSE-ConnectionGUID: C/2hn89JSCepf1Vedc8rdQ==
X-CSE-MsgGUID: SNMEn+HARregwYHvYdTU6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185661611"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 09:35:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 09:35:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 09:35:45 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 09:35:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bty+ylQkC8SGsYcTu9HYTAThcpfBUQOW29bDXXbNXWOg83n23zJxUvmV/+c6gVbtNSS+LvXY53FrUJrTn5dBRT4MlXNJyr+MKq+0R2uLICugDrOt0C1R2nenD5flgAPJkR8UrzYbTYdzd3EaZayJAnJYqxmz02E5qnJZM3PUH44xeKeBso+aorygVzbu0Hd3TOgyx8uM/LWQTvpduAeFnecFFWlOZqp1gygDOVXP+WbmNXQQLX42T7mXHSbFgbgFz0o2XMlN0a5Hx4bi/f7H6SAqRjbGjDx9/rK9rleZ/IRy5syXJv6zU4ShiOiU9WiCEATYUEpJeLsYwwEjhO8TvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyaMu2jIpahE69ffAcFS2DfHOM1S5ZhjOt56sk3PyEc=;
 b=QcVP0bJJd+yyypRl4BHKRHYPk3faPNkWms/7zwv+52niczruCqYvSq+Tpq9Nef9ZtfBH7uMB/gxdGG6Epp8J0JH9JQ4R2Zk5Wl6H0Ow1auE8WCAcyRMlu9302IT+9o/bhvAMoew2aJuvnLisMQIdpDw9vDhEf71cS9gAKyTp+K5qqhk0LSQ6jhD88eP8YfD4s25gJdroBxTb2uFpVB6lRgzasGct9Y2IxXn7t9M1ZDFj7PwOUYjVpIJxd6VIzdxj+36+0C3SZseuhUgVVGERl71pREeiMAaqMqNe8XRrJCbJasQOYUKlbpGI1n5uL0cfgdM/H2UV/GNcotrHc8ODUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Thu, 30 Oct
 2025 16:35:41 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 16:35:41 +0000
Date: Thu, 30 Oct 2025 09:35:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <shuicheng.lin@intel.com>
Subject: Re: [PATCH v2] drm/xe: highlight reserved PAT entries in dump output
Message-ID: <20251030163538.GT1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251022215504.5559-1-x.wang@intel.com>
 <20251029233959.778689-1-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251029233959.778689-1-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 2acc6494-ebc3-413d-e985-08de17d25d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zc3uXRxGebKhBK4gky1YbZPTSHHzV3qxjJyJkQvJEa0EOlc2H109x/kRYRSs?=
 =?us-ascii?Q?p7Jcgpz+R9zssYGitryDUUj0w+fAxhiUDREoHdVbP93yRKNJp/vnjzN5RSw3?=
 =?us-ascii?Q?9VrBTjUfLygjAPN6R0kULBCrmiaiTycgA9iYjekM3Jz15TxX5z/W42BMPdVv?=
 =?us-ascii?Q?xsOIhLceP23vNsgLiCM5sDMJN1lRmYKcNg3Q1IxhZIz2PtGvuCXq8y4405kf?=
 =?us-ascii?Q?OoLKyBBUt+wr0f/M01g7nscktt0QLyQnHburiJQTtOnLEZ+EGguVS/2vD3zp?=
 =?us-ascii?Q?zmhsXfCPaDedvSrW9+CIQJ/FNmNwrXavUpi/UMJ9VLjjv+ZBc8vbu7yTxvsI?=
 =?us-ascii?Q?BQM7G4w3QKAGUIzk/kLqhCz+0E6sirzWmFebr4jPnSIhqEw96Va6/HsqHz+C?=
 =?us-ascii?Q?P6AtXCVnYD+/5e9SeguBLeUJmG77hOZvT+fmNJ0yCehTGv5DYITMHw+RZiwc?=
 =?us-ascii?Q?+UkVuVWC9TyCQd2zHo8047oXMlry5ecnMTI3m3L1/fsov8oQgZEl169Nju/V?=
 =?us-ascii?Q?bo2FB2znaNeKWv7qe/LyC8whQ5TYP5brullk+7yrQlzt50yruyVMf5v21jhi?=
 =?us-ascii?Q?+G3F4QlqkfgsOlGg1xFBLFML6EkYzAtk3GGdsuQjyjn5JkkrZV7HsQT/m53c?=
 =?us-ascii?Q?OLo1WKOMibq9f1HvYStL8KnbTz9g3h2NI4zgelnMgB33ICMcnjh2KJGsmOYD?=
 =?us-ascii?Q?45zhY+UNeQO+oCb51YpI4xzql/ByfP0eroyISF0u0I0Y+I9jOHIeILsiPjeR?=
 =?us-ascii?Q?uI4oWfEqg9iPjBpslBo3vCu7fCebUNP2P3keSnEhPenHq+JmssndyOF6d/6s?=
 =?us-ascii?Q?icXSUNWPgZZ+RzVmnaWlp35M8ROmPeO1qgHSFlceNujL0WqsfmhiuY7kcuBM?=
 =?us-ascii?Q?8ezWCDnyXuzQ/W3+nJF14BpnZ1RLp/m0U8xl+53Hg+fSQ11KkpHu/9tLqrJB?=
 =?us-ascii?Q?cvidvnoaAyeFA/zKUNsXutYGvhPYT4yoJnqUPLVLYPkv1S2flJjWKgeCD2AE?=
 =?us-ascii?Q?UV/hfxXgQioFcdre6jujrM7WH9htV0aRKxB8ENBNf7ANxHKLL3SC0njupHrU?=
 =?us-ascii?Q?tjfqgI1kPUNPU+SPU6HjzqoBF9kyddtYTIAAQRzMyrV++BMwGLY+CG0kkzel?=
 =?us-ascii?Q?xEhbaTnllwtIQneST7I5MFhXj8PdPUC84FplM9GseMjwdHz8Cq8zkJJIUchO?=
 =?us-ascii?Q?gXsn/07pY6FZhtJrFHeV2B89EZweROSOw0U0yZMGduQKcnH4G79BVHakjTQQ?=
 =?us-ascii?Q?Iqo2nlhXqJd7yguCKjC319BR2nmKrBHn8jIM4zoDc2J/CmGU+5VPbJdwBl/f?=
 =?us-ascii?Q?Tv9Bq1cxZhyfO9IX2h35elp0M/lNJrO13Zq/Q6UjrYdtNW46+czWe5bCFZXY?=
 =?us-ascii?Q?JOH3ntggYJj/gSN9ZwM8ARwe9fnr6Vi+CtR3tEEPXR6Grxdoidh+p109VNoT?=
 =?us-ascii?Q?IPF3AJY205Ski0sJjUeIYazhAnRU8kWr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8fN6fbLJJ8xlafdqXPMuNDQDRrLFQxdLrNVwwnIhXhqaKx58nHlom+RH4rnX?=
 =?us-ascii?Q?3d5Gg/mC253cwEehK6XZs9xp1a3BnLafWk2KJ23skMt8Sewe9eK6kcGM3ElQ?=
 =?us-ascii?Q?l4SazIRBljHBw+6fnfPKidD2oN7a70zlVXe7/dQY3VfzDawnGBFk2WtyF2x8?=
 =?us-ascii?Q?mUKhhtkRFFbSTGkH0HyWtVL5pJPSrg2xzTa/Frv5dodWr37rfUJegYpjtWmQ?=
 =?us-ascii?Q?O2e34YrTy0Q7Xa2/5jkhlUdyTGOCmKS2jXvgze3fVa01dQIYUg3IbRAE4FYM?=
 =?us-ascii?Q?oiTahFqALXz3osU2xR+ujBN013HTBpKTZlVLbZaUzI6f5Rx1aCzjfta1fUr9?=
 =?us-ascii?Q?KSxXbtumxIDiYgq3u6+CafroqBdAo6wXsdwTiwuidYwOGx4i7wDvzZPmSK5B?=
 =?us-ascii?Q?gMBzpQT0RLGNI6gfH7oF7hGt7P5whQ4fbL2SUCWEgyLi6Je0g4jFwXOA4wEn?=
 =?us-ascii?Q?rpmGqyUwHwEH2ymD8/B7fspIewIOzq6LpdVC0R0INasEd6DL2kkmh0QqudBW?=
 =?us-ascii?Q?D6dFJ4TXvq4ofQ/Slze8frKaA5iBFoVQ7HxgIw5o56h/yzuPq1hcX/4lNA7R?=
 =?us-ascii?Q?b5VbZDqKjiyo3v+M/+/ZwXuxF9pQVr6qFASVM6Y7jeIXC04p6xr8v4adAyng?=
 =?us-ascii?Q?ah7BY8COfDE4HNYZSUDnkMK6ZvHjEybeLgdm+kNR9TAUcQJp7macL8uv8F+y?=
 =?us-ascii?Q?vsa3lwk3bw4NZK9XWRjAQp09e4r/rCm2HS+kHzJo/drjqKxEDIlKioFQEAJ7?=
 =?us-ascii?Q?HuyDrwda6CeyYyFehqB4mCl7xuwrGwRN1UnuUPqUdJ5jXQ8bkzB4t72obn27?=
 =?us-ascii?Q?9XyOQKelLhah2pf5JdbLAP3epOxGeWisi0Y2ayT3o4wi/P+CpQOMIMjBZOmj?=
 =?us-ascii?Q?HO+IqJ9NxisHO0n6lRe5Is98VU37IYivUW9dhk74CKMb0QGPSSr/Avq6ZZVB?=
 =?us-ascii?Q?YU1W1Dsv/A06nfutKwsuczD0Nzqy7So7PMVpPEgayXRntCcDXekf3InoctkU?=
 =?us-ascii?Q?OFabH1vc8/svzsu5B6Pq+UoX2Sg7biTpkYmeMYnFA1sMQBog+MJqdK18+jYm?=
 =?us-ascii?Q?eTOTc3azXRddOEPbVUjWqpHNrJ0Q3kkqdA02OEQvAneZEHR1TKCPZeFpSJcV?=
 =?us-ascii?Q?+ephV/amzG+3zA8IhhD1ukRThAu6V7LWOu1iMCZ7eELbubyyyZ3PdXWZEGyR?=
 =?us-ascii?Q?ELG+3QLL6XuGpzkner5aRBzS4oe1S7Y+aoPlW2wcv7FDidM46bSD6GH5NhfD?=
 =?us-ascii?Q?nr/uJ99MsngGVJ8UPUN56ZZh7ZTuxnPOJc39PxRhIsn+2FHSsSve7gGh9938?=
 =?us-ascii?Q?bw6P7fF+dYZCCD1vTA/BxsquThCBZeWTFedvdSa6Lj2iCE+BhdldVZ+V3PVp?=
 =?us-ascii?Q?m6j7eIN+yIVCIlTcKcpE4Bx54nOQ0T3IhHhl8MYJdXGVkenM/bb4ed+Cebua?=
 =?us-ascii?Q?jl3ft5YtMaKOtjbsKrNYm2I8CB48HS0pKIi0np8YSBRvUssixSbppElmD1lf?=
 =?us-ascii?Q?s7axH1no+/EyM/a5h7UMEhhIcvomUOItyxRQbuY7LXWCJQC/4LHI4IwzrFLV?=
 =?us-ascii?Q?xFfeNYgNnGzpFdMRYGFp4FzONsfV9UlztYcP4X70xJZ2SJIqAZGoVkAmLqfO?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2acc6494-ebc3-413d-e985-08de17d25d93
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 16:35:41.5905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78qUMIuiJ1R7rI9hw97PGYaGCMOhTri3Q3dupFo01UP5rxbdbeR0OQy0Agkb2dWAdms2MCUTC348UMM/sEoOkhWlIPHbQF3ipxmoSHUdoiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7453
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

On Wed, Oct 29, 2025 at 11:39:59PM +0000, Xin Wang wrote:
> Enhance the PAT table dump by marking reserved entries with an
> asterisk (*) for improved readability and debugging.
> 
> V2:
>   Added a note in the "PAT table" header explaining the meaning of
> the asterisk(*) to improve clarity for readers. (Matt Roper)
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 7649b554942a..d9f9d5bb8e5d 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -368,7 +368,7 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  	if (!fw_ref)
>  		return -ETIMEDOUT;
>  
> -	drm_printf(p, "PAT table:\n");
> +	drm_printf(p, "PAT table: (* = reserved entry)\n");
>  
>  	for (i = 0; i < xe->pat.n_entries; i++) {
>  		if (xe_gt_is_media_type(gt))
> @@ -376,14 +376,14 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  		else
>  			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>  
> -		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n", i,
> +		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]  (%#8x)%s\n", i,
>  			   !!(pat & XE2_NO_PROMOTE),
>  			   !!(pat & XE2_COMP_EN),
>  			   REG_FIELD_GET(XE2_L3_CLOS, pat),
>  			   REG_FIELD_GET(XE2_L3_POLICY, pat),
>  			   REG_FIELD_GET(XE2_L4_POLICY, pat),
>  			   REG_FIELD_GET(XE2_COH_MODE, pat),
> -			   pat);
> +			   pat, xe->pat.table[i].coh_mode ? "" : " *");

I think you still need to add a 'valid' field to struct xe_pat_table
(and then set it as part of XE2_PAT()), right?  At the moment your patch
is still checking against coh_mode, which is going to mark a bunch of
legitimate entries as reserved.


Matt

>  	}
>  
>  	/*
> @@ -426,18 +426,18 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
>  	if (!fw_ref)
>  		return -ETIMEDOUT;
>  
> -	drm_printf(p, "PAT table:\n");
> +	drm_printf(p, "PAT table: (* = reserved entry)\n");
>  
>  	for (i = 0; i < xe->pat.n_entries; i++) {
>  		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>  
> -		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)\n", i,
> +		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)%s\n", i,
>  			   !!(pat & XE2_NO_PROMOTE),
>  			   REG_FIELD_GET(XE2_L3_CLOS, pat),
>  			   REG_FIELD_GET(XE2_L3_POLICY, pat),
>  			   REG_FIELD_GET(XE2_L4_POLICY, pat),
>  			   REG_FIELD_GET(XE2_COH_MODE, pat),
> -			   pat);
> +			   pat, xe->pat.table[i].coh_mode ? "" : " *");
>  	}
>  
>  	/*
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
