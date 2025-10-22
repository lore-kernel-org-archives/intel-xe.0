Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB6ACCF9E2
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 23:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4706210E1C4;
	Wed, 22 Oct 2025 23:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GmV+thO/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4B210E1C3
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 23:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761174817; x=1792710817;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7rFm44bXtqQ2YirzjKoMLbf0/fBDxuvmaJRkUoEGzRU=;
 b=GmV+thO/YqDCfyELHkjDhCKI4aEndi3cuAK0hus0XZLWxgzXCaon/qPu
 jtXw2pL7apvLAyuJDgjPFAdWw5yz78NvQojib6jXUII+U9MO8/9eu3yVp
 xXK9Pbx5OkzE4SwPGDixsNcxa+SX7pckt2RXkJOd2wTuXWWBqElgpSW5v
 7R5KSn7ttne5zkWEDYZN2Pm4Pw7zaqwBBJ3BTUNhVww2kqfbBR/eJ6Zrn
 xjJrJzJeLBM25Qf/R4//xUq5Xy4+SH9i3np7VMLRRB1GAIEWv2cPsRxuv
 5Wnp0JIoRNdFtBq02PMaHQlSNNnkdBl8VJIADs9uSTSh5V6mbcabziTCa g==;
X-CSE-ConnectionGUID: 2usDwghmSOS9/uOuG7VM6A==
X-CSE-MsgGUID: NeqEARgsQDmpu4JN/oS23A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74774612"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="74774612"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 16:13:37 -0700
X-CSE-ConnectionGUID: D67JSBEIRR654Ki8eBcljg==
X-CSE-MsgGUID: H4ymSPg6RWmZV5LKvRadyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="183935252"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 16:13:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 16:13:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 16:13:35 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 16:13:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfDTn1XxozVdoTKpze5REth90/Z2klm964dNOlAe7FkMTiDU7BAUlrsTDCtNlZTTjQpVtCqtdwnKGw+vh3HHee2kJVa1Xi4pjkYVNiWTJp12aYd/fc42rZgR5cbPYbif5X9Qtb9yCmNtqTyTD4lBBzVuXsHgrK3W1H+UOLeB1BfSqWZD/+f4eJSeNSuH7irIV87EFBhXkSy9KN765HDcjoztGC3tK+pQ7Lp6+srW8jeFDI2hBW8PZ9dvSU/0uIOT3mse8LIU56CxD1SzoUkzQVMfzjA4G3AUyKfxgrv8a2c3Tl3puC8Dzr4hEhmPXuAfHsVsMsfp1eU9gt0Cohq6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KM7rx09b6TR7fvMLajfymYBI/rZ4RY6xlx5LNUQoo+A=;
 b=poDPypkx+BuiSpAbAhm2rS0fXOwbF9BQLY6pvqD7Z1K+T1BvftQ95zi+OF0260kQO9I695VExkHgL0VL/JAoDBCsq43z6BH1LFy9M6jK667+qFBtQKgT0Ve9NrNj6IIDFBX39qZuWfVTItRK+CsTejnnQ4LNAsEZerJGnVvS5LjjCt+2za7haM+NPdm8xLvMqoDpElBGw0iIzkVWZXXQYXvZtcrx47OYLIzBFwiethfCm4PovSjv86sVmS08kRO2oBWMeqlSkkS032gwsk6sQHZdsMNitp3fM9aegiwNOAgCtOI2UuKx1qZ3Wxnr0NvRdzHVb3lGo77DweLo611GAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6367.namprd11.prod.outlook.com (2603:10b6:930:39::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 23:13:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 23:13:33 +0000
Date: Wed, 22 Oct 2025 16:13:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v13 05/12] drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs
 platforms
Message-ID: <20251022231331.GY5409@mdroper-desk1.amr.corp.intel.com>
References: <20251020075831.32818-1-tvrtko.ursulin@igalia.com>
 <20251020075831.32818-6-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251020075831.32818-6-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BYAPR08CA0057.namprd08.prod.outlook.com
 (2603:10b6:a03:117::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: 452cf530-e593-493b-1a41-08de11c09f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zkm7hqlEcmK4HCDlCgEjfEgAmraXt78T50U//idK1qP69+wOSUhJvZwJvtTQ?=
 =?us-ascii?Q?R2qMK4MHiKaNh76gHDcVYG/Au9SZht2EB/jX22iDQFzojKCgVS96tODzxaHa?=
 =?us-ascii?Q?B37t65QjqIAvBIHDxeoyC7CNR5lBaJdyOypNlJBzWbLXvP8Jq7wkjHDzBo9t?=
 =?us-ascii?Q?eu/1I1YwyqYq2OCX5LV7NoOPsPvjWn4Kvu5TQmZ28GzNUlwKRJjWIah5mzkT?=
 =?us-ascii?Q?FIdudwbZjhWMEBk+ynwXyKaa3ARjp7wZByDvyqxo2QVUv1pnBGIfFORSpKOJ?=
 =?us-ascii?Q?QI2HaKtbaMxh4VtBjAk7YnsW7c6T53lJl5x3vq8w/sqNwbhjif+l3yzjZMuR?=
 =?us-ascii?Q?vs0YvSlNVGQO/jWFPmtCefJy57U7KQa29y/+yB5Xr8vrcT0okRSHcX/LX1+q?=
 =?us-ascii?Q?nqMalAYz5oSFcYn+OaJaABCezgB0ZjEQGlueZp1ACGdNyGkrQJhfK2g9XfsI?=
 =?us-ascii?Q?IQZHQkwmUzW3t/OuGuJCgH/JNn+2nmvrzLMNXGk2Ht3XtnVlpVjTIf067bub?=
 =?us-ascii?Q?Zbd0pdetUJgazKGnamN3lSowph2bqJ+pEQlwCnxoWI4h55yvqDMq2vP5P5rN?=
 =?us-ascii?Q?lIUtuA7LdzZZ7/YrmnCaJeKKwcYe7622znWX7IDA1PSpTg1erkZIJSu1cuJg?=
 =?us-ascii?Q?/L1Xt8WHPrOFHxRlHX3OAOlLBDJxsKxccaofigIazAKA2/adjdwygMu1NcIr?=
 =?us-ascii?Q?emLlJRbml5KJCypl1vYYWnlF62zuWYNIEFlGrUWSGt/GSkPjxEam8TLRmnlY?=
 =?us-ascii?Q?WixAH955NRXw0TVhM1gzbMkHF/u7Avb84fkO/YBBH9zaZTR05vpZ2iLWGGb7?=
 =?us-ascii?Q?wN1BbSV1CGUPUffGW8GYJBnSK1M2kDDZjw0xHV8bFxDfSZ44PEqsuWmWFgqn?=
 =?us-ascii?Q?hafBygrzYUEXtsxNg0sL5lIxP5vU1C3jEjXLWSua5WJgdTSCJtOv0H7JefVp?=
 =?us-ascii?Q?LuC/oJpdclvniEJRnHJdFvQgiN2duuLzVn8OF+pJB8rk5iY6JBNO/q93SUSZ?=
 =?us-ascii?Q?iQkR5Wc+MG5vtNUaBJzuZx8DNvH1cwTpOm6R4jGNg2UHUDVcWnFpuZO6drd7?=
 =?us-ascii?Q?KYy7WcpXyfS4y/13JbkGSBKhaap2XMJCyX5AGaVQ3fx2x+wCOXPTJNnu2I2r?=
 =?us-ascii?Q?w35YDDUNf9kOs9X5WbeAlDbPqwJgCY8vhmkkYA/FSPt0Uy0+/ZQ+zfz/JfZf?=
 =?us-ascii?Q?v7dAvS8JZds6PJQVvkbLQiphvrtBgLbTCHhsBmukX5x2HXTL0LyPoIt2KW6s?=
 =?us-ascii?Q?HAp0CNp+BMbUSvdP6p0xnmjS3A50Vg+J3m80O2squOSysLuMncWpIX63Bb41?=
 =?us-ascii?Q?z0C42PiKduXatHQPb5OagvJRyFU3br8b9Ni+/IIqLe8ed/mtBakLlIOwDc7u?=
 =?us-ascii?Q?KKl9JdKfdboxdtZuxE461q+9Qi0JK0uPfXWACSCzWrGgVPCrpI5B5DPJpwFO?=
 =?us-ascii?Q?hlLh0mv2izLZvFZP335jLMzt6ROXs+bg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ur0OatxtSstl91H8VW1Zvxm3tOr6znlou4e6ZlI+mNVAJgHovwx5uGEziQiL?=
 =?us-ascii?Q?gWeGwsxvXwAi6X3xooXQQUIWpQ7C4KS0yfa6GV9jOEiqAPryRtPJNTnoL80Q?=
 =?us-ascii?Q?EInVsN2Jx7wWAAIFDWpt7O6fe1iKFVkgJiWzZ5OKCrlKdcFdPqZOiLj/Tyxj?=
 =?us-ascii?Q?QKGNF/mMOHBf8mUsZKR9nSQpGyRSshdVQp8k8ebtTjZU1cRy6ek8f5YUMpbn?=
 =?us-ascii?Q?N5m+MQHDFzPC6nF1yDzsIclLz8rXzEsx+AoZlBbEf/WCAonixuqvSmj/X51N?=
 =?us-ascii?Q?lAMtc48A2t+w6wcMYbe9QdH9rzylu2o/30arVYD3VasImub0aDvpbWNpwVP4?=
 =?us-ascii?Q?KdvGeqka4rXfTeoZdVS9Ul6txvEKryDOW0qKOueY1/c5YU5JXZ5Ov2NHHKHF?=
 =?us-ascii?Q?1HtmQUN4tpC/yL/XmcyOywlp29GLjfphcElmnr5qQvdxwy5kwb8mSwUocmIb?=
 =?us-ascii?Q?upgYJNqUVRLrsNLR2eZn/O4hu0lSJm0CZtQNQ5AKyapkTeSOw98GPdVmREB2?=
 =?us-ascii?Q?Snv/FwPX69hva3yeM53JFJek52K8V8GMa2d6qibr85wvnX4M692IwYJYdeVV?=
 =?us-ascii?Q?L7k6BWcBhZXVbxf2j3eODk7csU2RVcKY5cFYG/fSPIMMAW+7cLeLws8XhYrQ?=
 =?us-ascii?Q?Xez1XsTaQQV5AsN+wg+Fq8lvZTdqtHnb0QgZc6vLCqTGYmuvsU9eSiU1ys83?=
 =?us-ascii?Q?QR0BeZntJig0v6StsoNBx5/TrwLqMtBQVjmNJOtGFUzGt+UjvKPOr3cSmfMS?=
 =?us-ascii?Q?VQX0IEoXHe8cKTUj0nqWGddwQ95vMre+YgOSkHl1QD7/iaaCgdwWCtYAAHha?=
 =?us-ascii?Q?LMyIOZeavJgyqS68PJmdE5knLLY9DBkADFjiNicYdLV1MzVq42yIyRsvriNd?=
 =?us-ascii?Q?VmIrOksxHgT0tw1f1UMVpwJ/bd5mDNO3txj4OovjUpNoOCNFVJEAMC3FirQ5?=
 =?us-ascii?Q?FhUUzNgBArpMcZFFnxPJ0k92C7CV4YBkQDrPxnmG8SR7bAoKNrZqtT0EwyZx?=
 =?us-ascii?Q?m+X0CyUfDOe09oq7yZkFf1nlIqtNlCl+AUYt1Cuus/lQp7d1PP558P6tkI3t?=
 =?us-ascii?Q?aR7c8sdEmTXx8j3p5fUw7v5wpCOP8Y4a7ROTZQX0pmqtqrMAonjIEtWIdJ3u?=
 =?us-ascii?Q?d08vI55C2MUnki93J2kDRiK8maPO2G5NT56g4k+Yd7k9yjGO6vFmJFbsJofp?=
 =?us-ascii?Q?xdKKIo2/O85dBKyDRdpuBJKYYSOuJQG+iaTQTdLyxzdsNd8dB7mrtv3uO4x8?=
 =?us-ascii?Q?mJ8ieOAWJbxjtz1tb0aUNH3vTtL0jCYgAVrDz/IjpIv1upD0Tf/bmb0Tn/SA?=
 =?us-ascii?Q?UlpjUiODIbH8n8DOzFBH5FcCPRdxoA3y2HjIztYFkpnsiaQOpGRfk1F/sl9n?=
 =?us-ascii?Q?xNIqAUDxgW3cteE+ZZz7YbSH+U0iydm7xcksVj++W5NMJxCHYgsEizxwm9aV?=
 =?us-ascii?Q?Ro8NMWWAp2EO1+ViOLM34VURnF7MUs634cAurf4cwQPinaFn5rh0IyGO6qAb?=
 =?us-ascii?Q?jG0aqDNpzPoOtl/3EKpQyOgsmTMTy9WJWDyh0OI9KKy87GSl0eXlrLyCaSSk?=
 =?us-ascii?Q?h7JCEhcxE2slcItR2XviH7OzzaxqoEiOt5yeaiuNeJe7e5Smj3XzA6dej7AK?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 452cf530-e593-493b-1a41-08de11c09f1f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 23:13:33.5699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIMr2d8j5cmDK1Wx5zINguZHZEH8hMZot7rHMK9kCMjwiw9hTLTvcQ3uO345sp61C9MePvO675g9B62sQl0IfrfyT4R8uAP4qbS9M407kPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6367
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

On Mon, Oct 20, 2025 at 08:58:23AM +0100, Tvrtko Ursulin wrote:
> Emit MI_FLUSH_DW_CCS when invalidating on auxccs platforms.

This is another one that doesn't apply to all platforms.  The
MI_FLUSH_DW_CCS flag only exists from DG2 onward (and does not exist on
PVC either).  So MTL/ARL are again the only platforms that this should
actually apply to.

The bspec doesn't document any other meaning for this bit on the older
gen12 platforms, so maybe it's safe to just set it anyway?


Matt

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 87e467972070..d226d3228199 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -272,6 +272,8 @@ static void __emit_job_gen12_xcs(struct xe_sched_job *job, struct xe_lrc *lrc,
>  			      class == XE_ENGINE_CLASS_VIDEO_DECODE ||
>  			      class == XE_ENGINE_CLASS_VIDEO_ENHANCE);
>  	const bool invalidate_tlb = aux_ccs || job->ring_ops_flush_tlb;
> +	const u32 flags = aux_ccs && class == XE_ENGINE_CLASS_COPY ?
> +			  MI_FLUSH_DW_CCS : 0;
>  	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>  
>  	*head = lrc->ring.tail;
> @@ -281,9 +283,8 @@ static void __emit_job_gen12_xcs(struct xe_sched_job *job, struct xe_lrc *lrc,
>  	if (invalidate_tlb) {
>  		dw[i++] = preparser_disable(true);
>  		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> -					seqno,
> -					MI_INVALIDATE_TLB,
> -					dw, i);
> +					seqno, MI_INVALIDATE_TLB | flags, dw,
> +					i);
>  		/* hsdes: 1809175790 */
>  		if (aux_ccs) {
>  			struct xe_reg reg;
> -- 
> 2.48.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
