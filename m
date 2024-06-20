Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C040C2BA1A
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 17:30:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C691210EB93;
	Thu, 20 Jun 2024 17:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AAJyKqq1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613FC10EB93
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 17:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718904649; x=1750440649;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U+7gWP9ebAgIA6hSqE5xx3eUvG825FwpX6ZPjhRNLFA=;
 b=AAJyKqq10JJKAT1WJnEgRmkyZB1mXxLKoR2N3tBB0IwH1OYSRkwzqUwe
 w2QEDvvHxivhfLuxxjhDAUqiBTgG8uKLvPOoYKH9FaxvnPzQW+vwNUozk
 nU9HGdIYsCXb4q8iRuxoZxYh4AR4LJVUVGCJN9q4w2hxtxdFh32nw1F5s
 Vy7AbsgWwomEThLKaPBEIDMOHpiafF0weAxdy/MK60EDkRZv9zppYvCH9
 WgCB7/GCfHTgndSZYD0NAlzn8gds7skMP4haFiVWRksdCSdqbOve4/RJH
 4OPkkADBJWz4XQT2ogO6mjFzP0C5eU0DWE7h5Vw/XnAS9RHTsHsjLH1jP w==;
X-CSE-ConnectionGUID: gQ6pxdyMSmugpZFEm09B3Q==
X-CSE-MsgGUID: XzR6S+p4S22rIlnUlK3nzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15738692"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="15738692"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 10:30:35 -0700
X-CSE-ConnectionGUID: EbAz5p7JSYquminruzSaKQ==
X-CSE-MsgGUID: eyZAKKzAS8+8HwePgFovkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="65564712"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 10:30:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 10:30:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 10:30:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 10:30:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1l7EcgsPUbOGgn7Ex3xQ8pQWDl861cIjyN90fCLbfg9NODLqigIFPLzNVubUTfCbwruCCXjVfZ/EQBxvy0W94GjpTqPhdA5HrYl1J/OLqIcV5kFnFwQaLdpK9y78kILj83ahtuwN+eYpjBEANpOyUlT8cmdZKQ7uYx+7ZcOjnVhT6SNkUWLkhPNRsGZK/bQsAVwiIOmmTspal0OW70QmZ+EKKkQpnfQVXQ80OFVlDcoav/wfG9seiyeiym8voDF6u/126vS2YTiPnVjS+ayluRFUHcZm2J/8bmrmD21PhdUob4rf2u2OhCrlVrKEPRJo5ValSeABGMI7z2N1gpYiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyaPObh3unoTbzQfwqVW4flAmDPV+/1+ILGU2F4ZJBM=;
 b=QQWoS6IKWDiZDoK2l47AzXISKAZxvYW2xKdrr5XqF53mh34OfFuzO7MVvkfDDIpKOGCurbBdWP1pHnzzRdZ/db8RP+YWO9wu9nqjoThSXhI6Cic2VE9hzxuMEOLora26iklsFmDZdsWDblIDe0ySJIgybxI5zEIVdnywEMa8sNTh6+cOTFMvadoSRTbfkxhbaWiKIYevaJXfkjtXmyVzTARNUkHK6Unexonik+1GrfHJS6eNhlUVz+5hNL0BzncZ/7AVtMe0fUnuvG33mhx8fmpL8WK/aDH2jkYABGzBP1fTKVACrs8lO72UF2g+zLcvx/adaXXPwz5ORK1A6uy40w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BY1PR11MB8032.namprd11.prod.outlook.com (2603:10b6:a03:524::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 17:30:32 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.030; Thu, 20 Jun 2024
 17:30:32 +0000
Date: Thu, 20 Jun 2024 10:30:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/9] drm/xe/vf: Don't run any save-restore RTP actions if
 VF
Message-ID: <20240620173029.GT2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <20240619214557.905-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240619214557.905-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0211.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BY1PR11MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: e58e9f6b-d29b-48c1-3b3c-08dc914eafbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?csV6DwdonDNBWCIMeW+6K9LxZy9vLYu+4G5Plu9dNzwAEuW4xJXE18BIuCOp?=
 =?us-ascii?Q?Ow1PHCXPRZh/YuH/Tu+64LCO5eLKS43kgWGnBv//YQCqhElPja/cxEhsBxwj?=
 =?us-ascii?Q?M5sg0POy5Ld6FlIgj5o/RS82VClN6iVsHk8turuRMveyK/ZFBA8M91P8XmeQ?=
 =?us-ascii?Q?z42Xi7RZR8CciaTQNKRCuNPhKmFXc8kXyodYd6kAgNZxR81GSXYcJAyItNXv?=
 =?us-ascii?Q?vRJwyJyC+AvStZ1LzZhPNINxc6GSWZHeAMPEQ+59gCHLzs/pkkESPbLfv8Hx?=
 =?us-ascii?Q?3DHl/ngCulEc/rzC5TxApqJ0dSa3fKyzGSJEvzZ+5iSTiIefnK8N4qjhwDEb?=
 =?us-ascii?Q?N607qP/fKE05o5xncGxBRyB4DCgzsLn5EfSAMVCNyjSLT5+ZWFbVHMLfudeg?=
 =?us-ascii?Q?nHBZHFgw8RCgzL7OBaOxNy3Z6Dy9r1j04O9vPximYRHcYn2FdFbHBq8/1BdN?=
 =?us-ascii?Q?fUsKtga2lRl9bTrPHXVsi4NC7A7elGXsid9KXqZHu+YCZwYY2oxuURc+oj+v?=
 =?us-ascii?Q?0+M+i1heO2VjpdUK1pPopQAsZdVM8nOtHCLLibKxhoHN2xvoKgcap4YEygDW?=
 =?us-ascii?Q?XJLKUzN2PgKl7tIy7ZzDIdxGGeteWASs4C3gpSgi+nHIoDYmlUIR0TenirqW?=
 =?us-ascii?Q?GKb63x65aBg/3TNgYdnSDQQJUXdtAABY5dUiQC3TcWrD00gIsD+fe7OjjEUq?=
 =?us-ascii?Q?YGQRb1mWNBHLpg6AmgN/CwQhANIt1SdlcqmVBPcDxr0+Zk0CQlXAUPNcz9t1?=
 =?us-ascii?Q?aB8EJwGPOfFd8++70N5AmNhnCMWBiFXpKkUei+7gUbCNzmA3+dhIVWxwYOZW?=
 =?us-ascii?Q?E3VxWSys3eCiJdzcWO+QDzV2SU2HaEudMUCDy8xPu9TZnKk+GssNN0sWxIV7?=
 =?us-ascii?Q?pBIEE/wd4yFSJVlaIgmJWXtxcSlEc42fj2fxgh0ePbqntgIPKwJVcSWwUyMT?=
 =?us-ascii?Q?p1QWMJEPutJ4hDhl4RIF34EHVFj187X64y8Dh68WlM9q2TFwAhQvaYVoyP7m?=
 =?us-ascii?Q?A4zCmYDHwOmKQ31VeUlhqkMuauqez8Dwva6uZHXiTsLHvGiJP841cxXPtqvU?=
 =?us-ascii?Q?ZlOI3WrKqzfPW71/4hO7SPij3V/+CLkANbtqTo1XqEkIZnP/1fR6dSRW3oQa?=
 =?us-ascii?Q?tWPxaEX+QMOkdB2bY6bmm9pgP3jkrRZLMn1jP30UZXMFctx2JY9lcS4Q+ud7?=
 =?us-ascii?Q?9QqZjMGanqqbsUjZ8GWiwm2jJ3nOL2IOayrmfzS1vIrJPHVC1ikJHFyxRxf2?=
 =?us-ascii?Q?Zo06zI9At+e45EO5kPBF2WJKZrYdnl/hh/DMy7cQ0pG5kCF/UeAL0YKb5/5K?=
 =?us-ascii?Q?JPTEORjP9qb3bU9QaMB1i0z+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ieAIDme47wzFLYkJsdSJDdy61VPouul/iHea/qDEf4J6tr6jzbmvrZCawDJk?=
 =?us-ascii?Q?KkgtlrqaIzQFEYFHckW3avQccbS+3PdLumcuHCh75eGdmhQYzIRDUqYjboN7?=
 =?us-ascii?Q?AwizqhQMG1X5UV7UjNCuapMeicpiRfT8N3TFcKXHE8+zmceeT25YEm5yhqes?=
 =?us-ascii?Q?beRMGijoZuVAU69cvhFsqHetIcyUnd2yhtInYpaFNIdWwrVWi3lnvmzpQI5z?=
 =?us-ascii?Q?4+sQsXJ4Gk6gph2MVYypQNI0tjWTKxk59WTJ1zAv2phcKVBhmY5WxTrPFUdt?=
 =?us-ascii?Q?iowWIjImyvuLQ0Jvjrfz3hv75DH/IHRraP5yGEIAO49qiQ7p65iQYGzeOGMr?=
 =?us-ascii?Q?0x+kyDjLXsFTUsUaQG83x+fOSFH+LpECmgieTFUGY7NhIfqs95xKn/sp3+vJ?=
 =?us-ascii?Q?O6+w55cncAta1YbQmqNWFJIM0y8a9kfRdbEMbQWA47nTXlQHnrtfMvCDMsFq?=
 =?us-ascii?Q?FWzEyxaVHU8DtHRu33Hn6FPTNSoSjC139cBTiEv5fmC69w66JIJOV2v2JHDS?=
 =?us-ascii?Q?Ue0gLcB0NsF69bMKRv7PdnLrO+/YYfWJnC1rpKbVt8e5cnekpx0vvfZJ5hZx?=
 =?us-ascii?Q?d5SujpQSRne5RnCo9n7LtkMhNSuITHJ51NtrwHGJbFyx7McNglrABnAlLhlP?=
 =?us-ascii?Q?9Xmi13qLeBJDb+xWsDlf/2cK8rvEbdvqFh/3T82ZhcuN0LHSHNGD5pQH5SrY?=
 =?us-ascii?Q?PQ2HBjl6fo8cmh8ScIFKK6WCEXdgWmsDwQ6VtlhaotMl0qGFHh8AGDAvarrH?=
 =?us-ascii?Q?2vExWw1ua7WNVzxah50s+GGAYRcNr3MaEtgBjMQWQOSozAxlvuZCYM3eur6T?=
 =?us-ascii?Q?wUUfAppKjWHcezR8rDB4JODhqafxWR0pAVEkpflMQE6VslK47uuAUS7X3QgJ?=
 =?us-ascii?Q?AjkHSYKqPzl35y5Mr3g81ANAeYTRndKoaKMLC6PkudfG8LjIJu4LBebOFmME?=
 =?us-ascii?Q?x26JNybRb6SveGnjAD7b6igWox5GwdzdoQ+/HA9pNZGzq+E+H5SkEhTeHrQv?=
 =?us-ascii?Q?2qY6HXqPgGk/UoWbsSWwlP0zPBmHsrgYCFG5wY4VK4ApaPrsH8cNfoPAmZ9q?=
 =?us-ascii?Q?uFhdLPCk1hQIC27D6dBn0nLUdIgkXJiluRjbiPZEHI+zs4cW6H86Lfmu04K+?=
 =?us-ascii?Q?fX8S+wGb5Ey7CwdHs178YaRlKRSBtv8iNrzjTDwYuvxDFwF7ADj85FQtcHst?=
 =?us-ascii?Q?r3ZQe4FpySDLAyOtjuZk+Xz4E7TAsUsGDqDULAKtWihXQ+DtJAvsCiz72NCb?=
 =?us-ascii?Q?AiRHvTDZLICoMiwSihGQYWHqovqzMuoO/eDSsWTeBEVS+AmocNV6OrDGOpjc?=
 =?us-ascii?Q?yFOxsDRorYZG1mFnZ8yTOs0hQCmYzCZ4fgfCj86vblslBFAXm9O9ThvVeBNR?=
 =?us-ascii?Q?WvdVWfO8UfK6tAwbA2RpfEJrhfpInO4qI2ZxP8cKGVaVImeVS/DGAJ60OB5s?=
 =?us-ascii?Q?P0zAciwjCup6Ywp6gYJShrTmTiD1VmAsnhehdMz5Q6S8GawQ/FT83s9InUeY?=
 =?us-ascii?Q?WqRFj4ddPVWpggK0MOLTZRiwp8ieLtlKKwn6BeIA6Q9aeeq4HaksCOlhJglA?=
 =?us-ascii?Q?5QUHaI7IWuq3eal8QzjTkR6ThShyfq74k4Ps0+oeJUhT1iADoKjtsawwgiDr?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e58e9f6b-d29b-48c1-3b3c-08dc914eafbb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 17:30:32.2639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYKSbI89teA8drnIil9CyDAvH2ZSZHzBOoGM5y7JGkRiAAtqySuxg7Rnr2BuRg9Rm/1ft6SmdeQ/lL3ZDGz1nm3XrvC9nYLqWvBAzi1AsCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8032
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

On Wed, Jun 19, 2024 at 11:45:50PM +0200, Michal Wajdeczko wrote:
> There are no RTP save-restore actions applicable for VFs on
> current platforms. If any future platform will require some,
> we will need to update the RTP framework to support VF_READY
> or VF_ONLY actions. In the meantime, just skip all actions if
> we are running as VF driver.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index ac31cba1dbea..5b27f7c45ea3 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_topology.h"
>  #include "xe_macros.h"
>  #include "xe_reg_sr.h"
> +#include "xe_sriov.h"
>  
>  /**
>   * DOC: Register Table Processing
> @@ -257,6 +258,9 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>  
>  	rtp_get_context(ctx, &hwe, &gt, &xe);
>  
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
>  	for (entry = entries; entry && entry->name; entry++) {
>  		bool match = false;
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
