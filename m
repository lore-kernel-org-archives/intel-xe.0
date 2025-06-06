Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5C2C61CE7
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 15:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE29610EAE4;
	Fri,  6 Jun 2025 15:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpA30Cur";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EE010EAE6
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 15:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749224767; x=1780760767;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9I3vXn6IxeqKTvhqa9aYo4WBnfNdOpExoSHvoKQRk6k=;
 b=hpA30CureAl36WmCEqtwKj2onElquVtXzcMZ3Y4kTWsEeHXui0vjrfOt
 Ov+AdDLQ0xLlx8OqS3tv8BpysjSIoZ5n+caCvoNEER1+7x/LqUYVnFri4
 bq4NO+y/c0QOrbRJDdPMiHoMDTAE+dW3kcOFemR9NzNLFC4go2A1KvD4x
 SBTW/r/boSewE7tR6HRHcsfIMvcRdxbTv2c9zX7BRiVcvozvo4Za9YjEJ
 xpYXmKBpNLtAwFUS91UlGuIbONJRw9AdlPafJ5PironZhRPKdCaF28TEQ
 CY+Ugns7MfnA4eYp3KM7T6vqmR5iN8c4zQGAAJRqAdC/OOldl71efhLPF A==;
X-CSE-ConnectionGUID: w1wP+eIMRL6aky7dFLTjLg==
X-CSE-MsgGUID: puFlRlU+SkaCUS6NeYAh8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="73907945"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="73907945"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:46:07 -0700
X-CSE-ConnectionGUID: m6M5fBAfSeqeAcGB2cVpgw==
X-CSE-MsgGUID: udWC4tiFRWKsIv72eOzFaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="150732584"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:46:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 08:46:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 08:46:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.85)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 08:46:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdq/UWGgxoiFwWj68eMr8onsrCKjnIBxjy5q8r+hPbeDYu8+STLyCPVOAgKBHOgJN44Et13ZoaBLRMzbpenx1kUglKO1xliOeRiBZnQ/u2ZV3uUvilNUpi42qv+kejHP2XXzM99JrnO9XoHxwI1JZlx162EutAfDhcrtHmxeZTpeHUPeZgXT8EVFdOqiteDknmQULWmgJ1TDF0Fys/+BA9LjqFGTvRUloEsJpId5OcdHsIunertIfBtaRNiXn7CDxCub0l+BiHU1VVCnwpjxysjW0DRXN5U9edoBH6iJf++LfFeGOiJvphNLmT+PtuBFv9OwDnDCDCtZrLWGTtQ+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMJpwdv1upUaiEyPu4QF28j875ZaO6Gf5A73Q+2UuK0=;
 b=WSLdqmH9E/EOOCTyA+Xx5wVap5LP0ufbk9WK/wQ20XrIt/LgievOe1wdtQ0skNPQTSZBmQT7qYGNGfeYnbA3XTLb33dKgCdDh5TPiZ4x06wU1bkdV224v1tsldvZ/dd02OfWvkRk6W0ppviZltSK/YOCVVlPoJaS/7oTyxnpiBIoH5cxRy18B6EBKHJsJXxA0/s2K4N50fOiLG8kzZ8NMJ2mA1lO44vXqEPFrV+U1sZIwhX7L7gsjHb24hyNXWg2aMttJDnCwVcZ1F3GumLu7c0GL1bAU0RqfkUpf3iQy6XIXXzcNu57PxrEiBYmEjhUNLuSY4iQbdB4QkaTLabTcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Fri, 6 Jun
 2025 15:46:03 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 15:46:03 +0000
Date: Fri, 6 Jun 2025 08:46:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/topology: Stop trying to fix programming
 mistakes
Message-ID: <20250606154601.GK5080@mdroper-desk1.amr.corp.intel.com>
References: <20250604202908.769-1-michal.wajdeczko@intel.com>
 <20250604202908.769-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250604202908.769-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:334::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 830eecf9-9efc-45aa-dd18-08dda5113e32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Nu6hnVDPAbl+MB6Fd8qzcjQO67wReESAXYfwXD+6KIBoKOnNfLGFmZ+8EPMn?=
 =?us-ascii?Q?I+AFtwRiyNaKTJNBCFb0ijtBQRxWybSxXBJAfr2zt7XCvihs2LHele7m52bi?=
 =?us-ascii?Q?AHPvLGPMrjRhnnw8YQxIHE+Lu9WjHXNkdm/nj7lKGwLlf9AQj07Z95NR/phH?=
 =?us-ascii?Q?wCu9ovTO3qSQ718wzQtDZbkAHJJvMJ0dLJldD7qhhT4/uaupb8qxX4i5RP63?=
 =?us-ascii?Q?euJ8k6PYGrIr828SaMb9ztAbYi28x3qWC8hvCPGxYUr29j0jnlWfSX74RmxU?=
 =?us-ascii?Q?2/JHunikZC4ut/SuC+Swr70E8f1IIVcV6I9s2p1ipJBSlj8FKidoa1ZCZ4d9?=
 =?us-ascii?Q?RP6m/3QGi/aY9GjleuCLeXB0umX8qczkEumqnW5sWiqpN5abol5/tmg/sJUM?=
 =?us-ascii?Q?9qHUjorQlGbRdiIGdigPU3YY/RHdHCQdTCXDMg01WJkB2zI67ey7xe+GxbMm?=
 =?us-ascii?Q?Wr/VhFxIhIE/qoWpHBkUp5S4OdumfHUHo9wvx5bsPAYxleNgJzudOBbMMOCo?=
 =?us-ascii?Q?mR5On27il0nPa/rzDF+axpfrIwJ2Oz9OkHX7wv2Lox4/oxhi7QVM7hy9wwiV?=
 =?us-ascii?Q?OWtvM1drXbcWlwKyyWDJnc4cYC+g1M4dT4nYrTBN/Hykxl8uyq0fgr8K+58p?=
 =?us-ascii?Q?YPLksVrFFP7SbPJjy6D1/b+5yYBkOctMK3bfvENK7smQZ9mVDs0i5vkMy2Jv?=
 =?us-ascii?Q?xo5nj0nDVqYDztiWYM7Cvz0eu2GkSYKumFpkriRVNd5c7jbNYwGxL9Y6/HF4?=
 =?us-ascii?Q?xAjT/HQ08GzfMlIHEVWEb1bdhotKL89KCxd0r6450bvH2ZJXCI071NIxfB8Q?=
 =?us-ascii?Q?ro4gUI26aoOdiT+3ptlJ/+k70BNgi76NGvUNhH028lN47fP9bll/HDVVHikb?=
 =?us-ascii?Q?ZYxn9SEqak/kiAh1W11WnTQmi013WPpgKOuzX2uuFyr9Vi+fwDm5rtc1A4yZ?=
 =?us-ascii?Q?2lveVdopKrj+KMQ311ex3Mwlww8dY4lKQS1SR5boPhZsRjzmzIaft6v6fLZ4?=
 =?us-ascii?Q?HW9bNdD9yo6AGPNw/1CR+lFNUTxx841QSbw8y+2LjAHuVmRQ4HKRYPWlzr0L?=
 =?us-ascii?Q?9XpbywsMqnPIczrfXz7ac8zSPRJ53OPPV8O0fozCTi8xcBr29zCZRUH9NctC?=
 =?us-ascii?Q?Ak74MgSx5VQ6ts9tkBbIgf3tgIlMvr+TWQZSUxgJ5c23JSPZaZ6vpPA9n9vH?=
 =?us-ascii?Q?Xj3nLq/VIrb1W+p1LnHNvMBDKRPVC0xbGqjQ4oxzg98awHb4IeUn/PsZdWvU?=
 =?us-ascii?Q?Q51cHgeNMXVP6ThJkI+S++GGcboZMxESnUBZRYc6F3rGMtE2b7uKN3d5bakT?=
 =?us-ascii?Q?8G5j9Hyjj8GeYsX+f8FUj4v2aa58zKofQkb0GGfqeeDCxybEr4uxJ7vsWlPe?=
 =?us-ascii?Q?XNZ5gXaBzzgevhu0cIcZ7S01ZnTIwSS+WwrD11g7pmVC9vVH0f1YhkGzAQ8K?=
 =?us-ascii?Q?5PraNfgSqhY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1AFHvbKrxF3zVmjcKPTCant/F574ziRU8T8tJZmb30ntGfcE4/2z3x92f9hC?=
 =?us-ascii?Q?ecIH8+LBU3rVEiL4BRknsyyjPI3Ru646ZNpIARtT0RXKbIzsF3OW8RprhXKU?=
 =?us-ascii?Q?T1OQrtmQRU8Wl6f6ICnxgI3QV/nZ4JB/iHQNwnalzTe9goD8h6yQ07RNqFkJ?=
 =?us-ascii?Q?gHoRwc4tSU4vna6ZLQ5m5iXBfuXbgSju77yBBWqRvRLnGAB7Cu5NR+dhTjqi?=
 =?us-ascii?Q?UDxpgon99QBjqNBdyrvoeIQqjgmTNzHxSt55fgOLLMqNXobDHcS3kivkwq+y?=
 =?us-ascii?Q?gJZC2PBRGk/OIN6oCW09vJG2JSn2jfLazyQvYBD4Z9B+bY70tua+sqLPT893?=
 =?us-ascii?Q?IZqs88Ohsc8/UBjRhvs+M14RdRkth/S0eltTukY4KKl9gRbDO5XP1akNPnPl?=
 =?us-ascii?Q?RjDcc3Akkn+jdi6mH+jmSF6MXRTYllyDLpizmFt+JE9evNEgkyoTtKzuNje3?=
 =?us-ascii?Q?3Yf8+sotU023vY7fa2jZLFOKQN9cZBpnGppudgWx4IK5Gq/HArByXBfMMc8i?=
 =?us-ascii?Q?Z/jdsIEEjGwJqz8GJMufxWF22kqgbs6y5H5RF7ibDVOq0XTI7lPVcdamrXjJ?=
 =?us-ascii?Q?MSBLdvfxnZHpLscSSeLeJIalNFdUgUYpoFwApx/Y6EA17UhbCC3PMIMMPPPu?=
 =?us-ascii?Q?zNSrGdLfoT/8Mmm1hhAEat1YjLeqHnkeeeGToFdkiLPoMtQmqFBb14oXYgpg?=
 =?us-ascii?Q?kO6BTqMh3SXeLfKM3OWDBRrkqf8se/rXmKF7+VX29Qdl8MZ65iLlG3YUYlRJ?=
 =?us-ascii?Q?m2J7uN8knevP4yPU5GKCpXHCxJD0PQTULCCiDwLpxA5zER5aM6Pa7Dv7cXh8?=
 =?us-ascii?Q?mOv4p8yIFpSjpKnV4s/ouJimrNS6uLgHa4zzBWTsfgOyhbTrK/LCjiUBt5L+?=
 =?us-ascii?Q?px+WDvhgn2VzRqP8SjadQ5cVVhZTH6UMvM1HpF47Ulkhc4vYMcm/Rr1woYsr?=
 =?us-ascii?Q?hdHLt6X5nA8smuaGWGBV4i9EM9t6CqvNNW1BQGq+/J9zkYA74tUo6woVRq8a?=
 =?us-ascii?Q?f0NjLOGhee/ZJ406acv5HIYt45qo3BNDvhfX4mprSlqqFwTiwm4o/85tYI0+?=
 =?us-ascii?Q?fD2cws+0JOFXPMsIR9bewwidBtx5V+wbTcRSeXOqHV9+Qieeyp/toRV2aC/3?=
 =?us-ascii?Q?cVs8MYIGNmXnrd2Rgclq/yvQGL8VWc9LPv+DdLCneeA7wD4XlokvwZqWOWj7?=
 =?us-ascii?Q?lReGHAYymWG7IHYU49+dtfsN3k6VkRrsNWdOYMnf66MWCxtP1E5qWIEZkFOU?=
 =?us-ascii?Q?WQvxigdacx31uNUT4IAEL3vyoxX/ztYsS2DjBg/iSALewhxrjeqZDTADmsuF?=
 =?us-ascii?Q?xivtq38DDIUWs+XPx4jtAuoW9XNf2T1f0a383+94mNyO1MsMCYnUhcvEdaEz?=
 =?us-ascii?Q?8+7htWzCiqGrmpgxWGt1w6FoBIz020PabFeZTbZigPqq1WIEeNv07AmKHyXr?=
 =?us-ascii?Q?hITxH7irIGIIxOtTzNDGmurk/gqGnMMbria0XRBDn+fxYlykfxHm6FtHXUIY?=
 =?us-ascii?Q?PVVk5NlZFFIn+42naC6C4dONJ1DLEyj1QO7grniG3ZkyoMqvBjOqOoH1xhT2?=
 =?us-ascii?Q?/w2y8HnzUdB1llqfUhiJC3u/nHg9GaUbt0ZatETF4qWi6KWP5v8/XY7V66/l?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 830eecf9-9efc-45aa-dd18-08dda5113e32
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 15:46:03.4236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6aJVyw+rF7Vp6Kl2VPBtl9Jzi5WXfkx4PEEILcoq75HQDnT8edqrqDqHoj7lhX+XwM7XjlbzxFcczMsBeB4aL3GHz7RTQXK7J11VXaOXC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
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

On Wed, Jun 04, 2025 at 10:29:08PM +0200, Michal Wajdeczko wrote:
> We shouldn't ever pass more DSS registers than our hardcoded limit,
> it should be sufficient to just assert that instead of trying to
> fix it, as this will never happen in the production driver.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 048743913b36..305939c69747 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -22,8 +22,7 @@ static void load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs,
>  	u32 fuse_val[XE_MAX_DSS_FUSE_REGS] = {};
>  	int i;
>  
> -	if (drm_WARN_ON(&gt_to_xe(gt)->drm, numregs > XE_MAX_DSS_FUSE_REGS))
> -		numregs = XE_MAX_DSS_FUSE_REGS;
> +	xe_gt_assert(gt, numregs <= ARRAY_SIZE(fuse_val));
>  
>  	for (i = 0; i < numregs; i++)
>  		fuse_val[i] = xe_mmio_read32(&gt->mmio, regs[i]);
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
