Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B9CCCD193
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 17:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2BE10E66C;
	Tue, 14 Oct 2025 17:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eh8aH6kK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D15410E66C
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 17:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760464004; x=1792000004;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mUD3LinqJJx2Cqf5+eyxQIAcmJmVfUOxiBEZs3nPbDw=;
 b=eh8aH6kKj6pC+xt1AiSFA01EH+RzlA7+Bc7/1zxbt/6vPsbKNofX6ns2
 IEiF5DcYXPOYND8PDlv+yHGGckPVdWN3SfTfkjXz3hV6kzmJSP5WS8sLc
 bwwG0KAq5ttOZ6tq9s2JZ2ScxKLrj8SwxPOM/Sj01JoYzPno+b7ozF19j
 1m8cTlpQ1U40YY9xo78+zB24Z8S07FQ6B8G9oCKqK+x3zknEDqwnTHqxH
 DdjWv/1rQ3gmYrZ8GCQLiqxoMIz5cbaunUBSZLFFnFy02qm4Abnf6WHxo
 CUY84s4+XwdbFQJSgUeCt1672an7/Lw0cdfvfMWTwil9wCKpgGU0VYDzM Q==;
X-CSE-ConnectionGUID: HcYHD68iRfaajWBRMdsujQ==
X-CSE-MsgGUID: otm3mum8T5efs3m6npY/pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="50193766"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="50193766"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:46:43 -0700
X-CSE-ConnectionGUID: 2F79SUNiQ52NfXL2x7jPTw==
X-CSE-MsgGUID: GrQVBEErSJqBZD0CtjDN7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181754740"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:46:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:46:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 10:46:42 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:46:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CT4h9QwwXCYc7JBzk0p60jUWW6k0caeSNugSOBGAZgKEZBw0Y7uMivowe4YmNcyGXjsluf81X1ONXQMlRREQFt4o6nrvd8P29QsIVViXKEGYKPxU5QsiYI6o0z46mKTC5g1kRywQKRj76bXwa4pW7abipSxaK8TeO/WdvAyDRZIXBcCVOoiJIRjJWp6vCQw/Z4uFC9+GqMgkXSyw0PlVsGAQG6NRjvWbZLvmqw9P3R7oSrrF6hoOyqys6bVaAMV/P9G3PHoIxkkA/KMN08qY7lH2j25j/OK399JwZ1nYGJfQox5m3JgjQA5q0N42jmzWfVEWrGZshy+6XNT9EAIQOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqiJmxzZ430dQHT/nSWfBx5br3uLBaGSg/mEMIJQS00=;
 b=VAjeyKlk4WP7BjmPmtQuLkKxVTDwO4BJbwGpp7MiQxKWc9SrneHtgzH59DQFYnKA/uPBEhJDDDQPq0hGx3QKQOTdndicuaIKTlVgUN//8fr5EKTt9nB/2AldbTaLnP6KfdSHbkuGO4u75BF6ODpObfRUyVm1mvv802qW6H/G+nPGP3W/TR2PXm71i43YGLbuDNp6IcfZU12J5T5rgXwZeajsUkUARY9ewrE2ILs+wHBiT3ydRqRecYPz3cY8+y93O5IOF0Uf1URsa+C3OlHIs0qt+v4hHwU1T7a5+U8aJuBikyA2Mokaqjj7+ZqpD/aWXKoo7ydlqrWSjTXdHLojxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB5889.namprd11.prod.outlook.com (2603:10b6:303:168::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 17:46:34 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 17:46:34 +0000
Date: Tue, 14 Oct 2025 10:46:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Fei Yang <fei.yang@intel.com>
Subject: Re: [PATCH 18/23] drm/xe/xe3p_xpc: Add L3 bank mask
Message-ID: <20251014174631.GX5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-18-bfb74f038215@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013-xe3p-v1-18-bfb74f038215@intel.com>
X-ClientProxiedBy: BY3PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: db11e75f-b676-4a33-b70b-08de0b499dd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Tu/Oh0V2nbwtLEoWrGSWfWsIfc7gUhOrS83szBx4rMwz0gZLMgZ7p4KXFrEx?=
 =?us-ascii?Q?TpifE2MmTvYjjsE+BNn959OtExplotllI3+c3NVC6jjvrwr/imWBJ7G1xbRM?=
 =?us-ascii?Q?95Gmcg1PUiSfywJGUUKTUB3vJsqQwYjHCks9ddtgv6juZEAWoiK8YGq7CV7b?=
 =?us-ascii?Q?IzrZ0YThWcJvVeWlO0DfEADkNefWcWWpvKcn6P8187acKEtXmCQDtpfmUF4W?=
 =?us-ascii?Q?kf0nMx7Eup2I8l4XKZpuI9iiGH7NErz6eSyVTj1GzbCP13fUss3cQnap6PYw?=
 =?us-ascii?Q?2uwyA/qM8WeUJCYPLTAV51xHLAZh94lZYMPp2VJOX4d1j/ZZesNSHTrzLaI0?=
 =?us-ascii?Q?nIP1E6/27iiuCp6lxHKNnjM0mvmBBDIHaPR9u8fu8FsUY3LuWcxFfUTCefTf?=
 =?us-ascii?Q?3IJxBeDo5yBoNFDV72XVazVS4h59pGyuc9Rg5cmv4jmKKwPatR2ADx2FwjEH?=
 =?us-ascii?Q?hv1Hg1hKNxA6AIccq1VR6jE5Em+r/XjEZGT+GPcnRW1SPbIk+Fq6Nw5PYjhZ?=
 =?us-ascii?Q?gAkswjUljsFhEU6a4YY+bIDBht5knIuXu8flCkyHhh2zPCw7IJyJlr7QwEiJ?=
 =?us-ascii?Q?XRWdB7fosmL9CAJ6FuOSQg5PRgy5bL6jDcJs/qokFRDgId3VS1GkFc3Qqf3c?=
 =?us-ascii?Q?rIF234OBBtjFe7YsjAMG3pc0g82U08au62IkBVciAFcTIYjkipYCDO2I87Cb?=
 =?us-ascii?Q?Rw0ul9arE4OyJZ28Q9fszUBmWJeDIN0Gfmb9p7whDUBdbtbNZwWtfvr4OWpQ?=
 =?us-ascii?Q?DJFsfj6qFP3mzKwFsnmmA10Zr+von4T+D/KMF2LWdYzchIE1LzRJwhe0s/u0?=
 =?us-ascii?Q?igJtb5v7GfYxxaaJ/6k7oqyffSuEXcrEIEr/FELvp2lonNPcwrwT/EL3lOJ8?=
 =?us-ascii?Q?0eRhXBl9IxropKVYrRvRReGi4QQEE6lqcdwdIVs/X5uskscCX9Ot5jq7cl05?=
 =?us-ascii?Q?iHAZdZqBuTUbFXikYI4/q3OMrOBrbRPIRg9hFCwHgo096nzuvwEnKKbS0I8U?=
 =?us-ascii?Q?iHpvT9eNe2RAR9VqIeCXgGclvjjfuluedE6jYi0hvv6s5vR7LHd4EElDYdZ0?=
 =?us-ascii?Q?RbPzqRAv0wmgz+zEX1ixkjPrh8juu85h5Fc7kbOGtEQXEOIJMZzwHxusy8Eo?=
 =?us-ascii?Q?W3lvOzbngx/y+gy0EO/DECD8KLZnH8iqnuul4iiBj+R2JhwgCWMOn4JMGOAe?=
 =?us-ascii?Q?mj/4GwRC9/Lk4xcMEBdZf/RgLX5tmEDxPUTucluVECOz4d8BUeevVuY1HTzn?=
 =?us-ascii?Q?TV3QYL/8PuhIbbcIR6Ii0m/LF3WQAUDQ+NOxYvWFjBu/7VnoISYigg2mfV4R?=
 =?us-ascii?Q?mPh/kQjrXw8VXSSliNzGfoYQNU3fsdmiNNY4uT8IF6VKP1ikhKsZG5p325fs?=
 =?us-ascii?Q?GZQzC52SZLdU846Yt8rgsGKPP5LLjjBS+aXXVAmTm1kb6php86wdS76EUszZ?=
 =?us-ascii?Q?M8E4dnDYRV/JgJXEeTRkJKIgh2ev2ie+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EdGMpM74k+dDTT/8f2MbGmQ44EURtyxpFrF7k8sjsCZf6f5EFYxybRhZrYxE?=
 =?us-ascii?Q?BK1mB8uib1eMqdDtsCY678tTtPV0aXoL6pEJ3+EvmQ1bpcmvWZhdHXFEYfog?=
 =?us-ascii?Q?OdqnYbL3DN4pCsWISKjhjRb3RMebiMFn4xf3PkIe6XcCuhfd1HsRzwp0//L2?=
 =?us-ascii?Q?H+vYz0C7PIFTgabQeu1T2x9qoh6frP787ajKzTAnrM1FGNFExFRgtzUfjsag?=
 =?us-ascii?Q?JJPQnrw54gelYc1Tomo5yZwf+n3SEaJodHR1j5FfTLY9lVv+V+hWgjJ5o0bQ?=
 =?us-ascii?Q?a0yD3bg7XuoFF3Sr2rDc7XCoGwJGo0dKn46bR0PqLHZE3+SrqS4Yw9xygmqX?=
 =?us-ascii?Q?30NdatOcxdKHkBaai97VKBSHPV+7XLQAZZ/uhfgiRtAB3jKVhpq5TNyrFlp3?=
 =?us-ascii?Q?Biq28jUaagava2QfbM+RjLj1/9Svgm8VRhCMCY9ncx5KXFeq37lfCRfjHEJx?=
 =?us-ascii?Q?kAJa/QNl+KBTwoQfCAOyUx7qqppKegtjhXcmZc4R0r6Nvc2cOYaOyPxdG+G6?=
 =?us-ascii?Q?tL7I+wuPLZ46xbgFtnRQ5iCJqrX70DEbhvXvWlPaDbEH3Xfb9BBHtKdpRv2M?=
 =?us-ascii?Q?XZZ25neg+gSpZBDuz/WdMkoauQjsvz4wWDm3+9XNDy9PnsWfRnhs9Hdy/vn6?=
 =?us-ascii?Q?sUyWuDffukEzh7g35wFKYyFuPDBeGDxx5H7Vvwy9GCwjavgnOnuxGJXkIn2N?=
 =?us-ascii?Q?nHi0pdqHYi0irz/oNNI0G+QaIKP+hrDJ+GvG7o5fkqnDQxhrSg2Be74KjjNl?=
 =?us-ascii?Q?8n9FVh97rfARDNpiafg73Hf3i8HLosDkomwCqEZIliP45r2wliqFklaGRzJw?=
 =?us-ascii?Q?UHtcvg6EXPPnjlXF1SbaVM9hJ/LwXAXMu8eLtqAAqQaxVZKoVsdkl1UhokqZ?=
 =?us-ascii?Q?uY06mjkCfyJJOT4MOJai4TNyDbY6hu6Vxw7N7C5Hoyklu/R9lwAbWhA2k+os?=
 =?us-ascii?Q?6e+YhqXOqsuV15yE/F7ufnxyNwwIhXeHkaNlfii/P3RbEMwzM3fYoHAZoBHA?=
 =?us-ascii?Q?XAwVgH+uRyFMICCiimZQCdsKHZk6QzFQyaYky1tzuF8n6QG3jB+TIxw/lm8h?=
 =?us-ascii?Q?/tN+JT+pFafrhXU6ehjiWIfFAZ8Q+E6yyplh6/tJRDGsfjcZ3nEhVDqNH15/?=
 =?us-ascii?Q?AHHazPdg6cSaJLV27xhjt8J0ACKLH2iywEMYh1a3Ql8sRTbSojbHmS0PpncW?=
 =?us-ascii?Q?f2OS7oLBjnmajZipVmIO2SmXfSuCv9XOuh23vjAk9nikqYyh59fI/lTKQNX4?=
 =?us-ascii?Q?MFQv6lTUmX62YDeDB0bvYpbCD2Wkdo7ZLWcVwsxgymtIuvFFQ5QrIaQ4eeUn?=
 =?us-ascii?Q?ZOEoUIC1863/OYcnw6r1Ij2VPvPlWSbvduYIR9zrXigNPZa6eK3C1bO+xX6C?=
 =?us-ascii?Q?ydKK4xL7qDwoRNtopu0W7NEmlCavd4y4M+ImgRp6DjYOCNK9zusMkCcQ2vTy?=
 =?us-ascii?Q?bMp17fFQPlAk0tUDHSge8wTTWiJk/JGSYmR3UQZ9YWtKqXkwuMaZBvOgJyo2?=
 =?us-ascii?Q?DsxqTJL53JTBPstqffUTkhBb+OalBOvPI3KwBmEaNQB2WJ2xTHJCeunCAhhs?=
 =?us-ascii?Q?Uu1OVUjCeq3hS26hiVZHsSqQSN4UgVymHFgBUc0vJwS45mrWkdw6d2rac6ZE?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db11e75f-b676-4a33-b70b-08de0b499dd4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 17:46:34.3154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjaNxz2nFPx9JgfSGymqlo6RByGJ+qwmmX1KbcY6vIh4T75ytdE2RhelpOZ1cllfLj/3rfuRfk2rkaUCIro/QSmgnG6AVa5P2SCMPk+PSwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5889
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

On Mon, Oct 13, 2025 at 08:24:50PM -0700, Lucas De Marchi wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Expose L3 bank mask through topology query interface.
> 
> Bspec: 74110

This is the wrong reference; 73439 is probably the one we want to use.

We should also expand the commit message a bit.  On this IP,
MIRROR_L3BANK_ENABLE represents the full L3 bank mask (not just a
per-node mask), and each bit represents a single bank.  That's why we
don't need the extra complexity that we had on other recent platforms.


Matt

> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 80ef3a6e0a3b5..14af073783ad3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -148,7 +148,11 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
>  	if (!xe_gt_topology_report_l3(gt))
>  		return;
>  
> -	if (GRAPHICS_VER(xe) >= 30) {
> +	if (GRAPHICS_VERx100(xe) == 3511) {
> +		u32 fuse_val = xe_mmio_read32(mmio, MIRROR_L3BANK_ENABLE);
> +
> +		bitmap_from_arr32(l3_bank_mask, &fuse_val, 32);
> +	} else if (GRAPHICS_VER(xe) >= 30) {
>  		xe_l3_bank_mask_t per_node = {};
>  		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
>  		u32 mirror_l3bank_enable = xe_mmio_read32(mmio, MIRROR_L3BANK_ENABLE);
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
