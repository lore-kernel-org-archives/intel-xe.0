Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3E91112244
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 23:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F9010EEF0;
	Wed,  1 Apr 2026 23:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPGigRe4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC72A10EEF0
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 23:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775087616; x=1806623616;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rmvsvRoL1V6GkQcTioruSgkunCH7relpl17Nc824MCk=;
 b=LPGigRe4iClzrjNrNHsJtLF0OjSSZzxxhDqS15FKM/hWZWEZQ9Btvbq9
 WcDC/Qe2IR1Cmw3LmuM8qNHDtDjxpN4e2AgROo0rENXwmF/KNvu7H4npc
 obs+80toglLY4DysqWFJPImrIn1BrtjRBTjaOi9nC/3BEphEdgntmPY1Y
 2h6ccCLrttUIcjtYvgFAqX0hUlVIIbULmZTFqOggvOIjuMZj04vz08whx
 SKoNFSGI6SeGfSkeZKFbCXOlUUqJqxOE/wv8Pkfw0jZ9WR+rlKZwetvr5
 9kbWB6jI46eXHlDuMSALUWxvqDP/MINHzJzuYgxjKyvXhqmm6JAT2vfEc w==;
X-CSE-ConnectionGUID: fFj0V0HiQh6ELTFtzR17DQ==
X-CSE-MsgGUID: ItMd8rkQTPeO6YX501KkTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87600318"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="87600318"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 16:53:35 -0700
X-CSE-ConnectionGUID: 6TAPLNNkTsexjgP40+5/OQ==
X-CSE-MsgGUID: ammqSVZmQVODzrpkjsQwPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="223944330"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 16:53:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 16:53:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 16:53:34 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 16:53:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNoSLaOtohkjwb14FxABsIq5zbsz20BlJNlY+0I7yJvZr5F1CiuwySnoppV7TFYkoaSRkEW6da9i0b/CzFioywkUdsVjCjERpFU9cqBKNz/JtY+8aOf/XWU3AMpMn1VcPKwKmv3KfJ5pFPFvDVfrwpWSN2I9vWDxm/GEJSmNsCv2M+4nHVLhbonj2CgDc/A30VNALWhKJ2zHodBSw4Y9zEUuYWCCt0aEWwWdgQyJc1zLMuNhFveqJPh4JNpIt2To9tllF+pQODV8slA//cEOL9MrykAUrGZRFzGSxFvgBSN5KGfnF4jcM7Y6VkEG2E9+YXrSIQviI77hjHdk7Udk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNcoKsdbqx3kvygtsqiKdwXf4ekK1qDNnlyzL+jgd6M=;
 b=gOBFeSAGcJkvenwv4qfhc9Cf/+Mrb1GQy1t3ZkdWnjboo+Oq0Lt+nOiUnREAikAga/BMKqYDiELkucPRELlhdCjZJ1/ixRCes+4QDp89Fs3i+jUbxntMGaF2e5QWynV3aKc6eJy6iNFYdR6jN3JosFJbcGyv+6RBHWvynp4wSwr8ZLAnpOEWIWGSeMSn1GnsrudDvNhjnbMV0Osqllf37KFMr8uD6Vs2oLqxv2NWsW9TZ4dQi8LHDAF+E/cuYZ/NqqbTlbH0/AEYDLTuJCZ1ohDI8MliE8UTnzKSl1mEpdv9MAlfb9G3MbGnXrt1j6mIUKMMCQ7VwEMn+3B/c8O1iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MN2PR11MB4709.namprd11.prod.outlook.com (2603:10b6:208:267::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 1 Apr
 2026 23:53:30 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 23:53:30 +0000
Date: Wed, 1 Apr 2026 16:53:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH V6 3/7] drm/xe: Handle physical memory address error
Message-ID: <ac2v9snU8dxopOBz@gsse-cloud1.jf.intel.com>
References: <20260327114829.2678240-9-tejas.upadhyay@intel.com>
 <20260327114829.2678240-12-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260327114829.2678240-12-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:303:b6::34) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MN2PR11MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: 08e17aec-4dae-4e20-cce4-08de9049dfe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: o74jibp6r2XcHibpznJZKb8BY5fvGx/SefS0hhLRJ9UByQ36L3Du5SPi9WuYUYV9RR5LAa9G8s6UCvBksv4jhz8txKVYMCoPVHtDQutJ954AFx/p91EjvcE7MncF0BI53LZsUoX9HIfsQP+8RPHAyELD3gTm5yzSdgy2adWw6F8vRf2yP4v5G4bW1lf3EcQ3GEtubBZfst5alBf3FIXSiaiBh7Yko0dCcBpBdz8fa/zF34+dV2Ix/xIkULPiOK8TWUjIVrWwIIjUU40LvsovODPZlp/AQW3QlrRQOZl6RsUZ8F/DZLSjvo6Hz+/gQBlioW+uKlRyCJ5oqJAGimlsqXjzMt2/aOy++bieQNPWeITAU8+7WDTSL4VColZsmaCBrROSPcvY0k/QwwNeG/Iwzlj0rdbl42cQfPQKF/Orsg0iHNLR4GQhN5D26p8x2ceTw1jCPlSFQm+ovRm4zu+/eNlMIdJXuMTEiZBrC2TDzy4xPBu10yyOWCr8PbYQz7e8rQ7Lw9q9PrQkimLOVYaoxTzO1OR8aZ71H7tswnkWNqD/siaP89JbyVqs8k145Vkw36MBRMuPG2NXtH3g1VbMKjHMtDt/0xnGWF0nCEtu26xT0vMPn8RmtDkNNgHpdOx1AwnrpC+JV1oDBDnAP2qdPD3yCRN6XA01Cqg4pc/70NKdB/oeEI6f4WoPoQiaYVKn7Ef75yswpDcNqvzV7sdWcIgTP4y7OvlsrkBABpMdjnM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tqjWtzxarunJWOMA0dGLf+ybh6/UzsBrvbwPo+DC4Peq03S+01s3Ps8/2xx1?=
 =?us-ascii?Q?ETVFFqVrLmVxom5ZTiGbhdVbhwl/U1VAmrZaoW0x1J5sR/MkzPbaHmMA7Z15?=
 =?us-ascii?Q?SpXC9NwuGBwB9mmBKCLa+8j6/Jb2gBFg4H/bz1Y5lFJtjwP1+sDu4biBEFlL?=
 =?us-ascii?Q?ormlr7w3wqK1+RKSaifwhfLBxtKdndy9XHYARlcfpBQZ+0QBLBNA0aQkR440?=
 =?us-ascii?Q?EqrztZgvGLioYxgw4qPtda/Cis08JrH56KgOWNOUmTYIqFm8EctBFe7jNAx3?=
 =?us-ascii?Q?wdzQgVAGGLVNKrDSsSIeJSAjOhSiEZ0GBpvTJ52DJbA4IClOOKidf6xdODte?=
 =?us-ascii?Q?DT6ow6eUOcRB+BOBbgtvBOGMOFFWdCH5OzucOEoiLKeTMmWyICYqIhAQL/5E?=
 =?us-ascii?Q?IfjqEIXFDVjvE3GlKsU9eESWV1Ac49TZ3gOePlIhsytv/aoOYVgU/OgW4IEe?=
 =?us-ascii?Q?e6QkvvNWjB3v+KxPxir1/jRPiMLkyQt39eE+oclp2OH9XLUGHKtLpHweBjmM?=
 =?us-ascii?Q?REUHd58KM3urI1dkg+y09Frz2vJkoG9SE7m37t7JtjLSM99hh76qPRSNVmuK?=
 =?us-ascii?Q?FDB0V460c496cd3QcVyAYHRBBzTXQhVLLeFWu40/ZLQCMQ+KBHVaEM+VsH9v?=
 =?us-ascii?Q?0jHLa5t4MYKpneqwVq8b7TEtQ3PUQg2Xh3goSyPyJchq7wub7V+IPt1d7S4m?=
 =?us-ascii?Q?XWe5/K8Qp+z2P5IFIesizYBY/BT2l6NpM4AfpAeTbXDq9Edy3xJXk0Oj3que?=
 =?us-ascii?Q?7mXFkR601Cx66DNXos71fDJC+4Kdi2MKfKpEfNTCGbqk/LarBd1U2ACTXpYP?=
 =?us-ascii?Q?tYjZKtLEhjNZdie2CEM1ddl4Ox+Ng/9qAIoNyBpQ//XjH6NHTTo1g6eT8UUw?=
 =?us-ascii?Q?GQplARa0pBOyeUz6q3+AbGM0dVBOe8gBVUOtXIXln44NDg+Rj11TObUlpTvH?=
 =?us-ascii?Q?hNhw9I6ULw5ejVbvVvlcDLgXoIkibsAfABvfBGypIK4emrh4yLatPYdxLJBa?=
 =?us-ascii?Q?5HAFdRrDCGATm04G7njovTMefdpovSv6QLlaSEmETboWMJXYbsYMSYXzRxSb?=
 =?us-ascii?Q?Hq6CJuQGPVmTQKE23krGM3fbgbAQAc/eNjbaK7ifDYyfY3Ti+ser6csQziAi?=
 =?us-ascii?Q?9MutoiSxVJnBc5oSOgdtCc331qk3zfmDNFrm7HPyOSKvBsjPMLKWUilF2/dW?=
 =?us-ascii?Q?Iq6nLLbsCI67vsz/ltRquebClsmQHN0a3NPTVsAdsmnVmeh67sythzDLDNVW?=
 =?us-ascii?Q?jq2xHjn7LnOB+thEacyCpk8kDAEKqFvMg2r+QR7uLHYaHG5GQnIvT6Wld+Bc?=
 =?us-ascii?Q?fSTyGPMefV4bQ+GUFq3zuQC+bf3hHKcGgthz4wRphmcfCUxd/FvkLqwKzhMO?=
 =?us-ascii?Q?m9ZzukUJJ6Hbi57WsaOI4Hpvx6tdyH30xCFa0/X8+YLUT/zOvpjoi3mYyAL0?=
 =?us-ascii?Q?2EU44+2O4JO27dEvABDzBikICaJMi5SpzZCF//vbiE5Hal1iraF5vZpEKtnY?=
 =?us-ascii?Q?URAD/PIGSHZCT3tySGeWkcR4pe84/YzThTeCz2scTdMNplwP+nKaZtr0QLtd?=
 =?us-ascii?Q?m9nxmx54/IGi6O3HWfkrbJYmurusAmFNCV/z7Aa0Qvp0L70SYxUmeTIOPubB?=
 =?us-ascii?Q?NX/Qo9jRe+ccDq7oqghsBj8NIIV3Gg3gZ8En1MynA+HV1c/AjXFsJH+mi5r8?=
 =?us-ascii?Q?GKMxRqZsPGTHbbPzqAwRrQhS+GedQbiQVd/lUJqX1Vmsv57Y4zzqKWW7oO8X?=
 =?us-ascii?Q?GatQqHmjqi6/SIEDRCFc+HKQ9NRHKBU=3D?=
X-Exchange-RoutingPolicyChecked: PnJNxLvJRuWijOiWd6i4o/wELbJl61Gpa+fCQchObJakev0gXLDmSQjH5LL8hkNN6/Mim5e3yBHq+gJfjYXdf+jHSWog0fAXBQbAYtdqlbVqy6d/C1NtUKDgpy11r4gmQUqhE87GlNlqQJJD7hqBdg/UAzZSQwEZqiDqFsoNsykMRxC6UVz++W2UvnCRrva+YoRnwp/9/JQ7RR0Guk2++c95l2gwnb8yvEJBwa7KHTRbcmUBfceOTery9AP+MSTNwATnVOIHX5Xq4uteozOtQyq5dbXWJ/2ZcQ7HY4j8BttXIjU9ekhXsfzV384kNsksCN7JjjJrGffd9ouKB9W1Ng==
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e17aec-4dae-4e20-cce4-08de9049dfe6
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 23:53:30.1003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbaCxAbdOlzJ7jas2ABcnjhvlAMmYJVHfM9vLNJB46E3Xa1LuaJVBgBtCSLmdM/6LNGc2D5V/HmAdSl/VSpAsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4709
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

On Fri, Mar 27, 2026 at 05:18:16PM +0530, Tejas Upadhyay wrote:
> This functionality represents a significant step in making
> the xe driver gracefully handle hardware memory degradation.
> By integrating with the DRM Buddy allocator, the driver
> can permanently "carve out" faulty memory so it isn't reused
> by subsequent allocations.
> 
> Buddy Block Reservation:
> ----------------------
> When a memory address is reported as faulty, the driver instructs
> the DRM Buddy allocator to reserve a block of the specific page
> size (typically 4KB). This marks the memory as "dirty/used"
> indefinitely.
> 
> Two-Stage Tracking:
> -----------------
> Offlined Pages:
> Pages that have been successfully isolated and removed from the
> available memory pool.
> 
> Queued Pages:
> Addresses that have been flagged as faulty but are currently in
> use by a process. These are tracked until the associated buffer
> object (BO) is released or migrated, at which point they move
> to the "offlined" state.
> 
> Sysfs Reporting:
> --------------
> The patch exposes these metrics through a standard interface,
> allowing administrators to monitor VRAM health:
> /sys/bus/pci/devices/<device_id>/vram_bad_bad_pages
> 
> V5:
> - Categorise and handle BOs accordingly
> - Fix crash found with new debugfs tests
> V4:
> - Set block->private NULL post bo purge
> - Filter out gsm address early on
> - Rebase
> V3:
> -rename api, remove tile dependency and add status of reservation
> V2:
> - Fix mm->avail counter issue
> - Remove unused code and handle clean up in case of error
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 336 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   1 +
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  26 ++
>  3 files changed, 363 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index c627dbf94552..0fec7b332501 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -13,7 +13,10 @@
>  
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_exec_queue.h"
> +#include "xe_lrc.h"
>  #include "xe_res_cursor.h"
> +#include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vram_types.h"
>  
> @@ -277,6 +280,26 @@ static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
>  	.debug	= xe_ttm_vram_mgr_debug
>  };
>  
> +static void xe_ttm_vram_free_bad_pages(struct drm_device *dev, struct xe_ttm_vram_mgr *mgr)
> +{
> +	struct xe_ttm_vram_offline_resource *pos, *n;
> +
> +	mutex_lock(&mgr->lock);
> +	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
> +		--mgr->n_offlined_pages;
> +		gpu_buddy_free_list(&mgr->mm, &pos->blocks, 0);
> +		mgr->visible_avail += pos->used_visible_size;
> +		list_del(&pos->offlined_link);
> +		kfree(pos);
> +	}
> +	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
> +		list_del(&pos->queued_link);
> +		mgr->n_queued_pages--;
> +		kfree(pos);
> +	}
> +	mutex_unlock(&mgr->lock);
> +}
> +
>  static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> @@ -288,6 +311,8 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>  	if (ttm_resource_manager_evict_all(&xe->ttm, man))
>  		return;
>  
> +	xe_ttm_vram_free_bad_pages(dev, mgr);
> +
>  	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
>  
>  	gpu_buddy_fini(&mgr->mm);
> @@ -316,6 +341,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>  	man->func = &xe_ttm_vram_mgr_func;
>  	mgr->mem_type = mem_type;
>  	mutex_init(&mgr->lock);
> +	INIT_LIST_HEAD(&mgr->offlined_pages);
> +	INIT_LIST_HEAD(&mgr->queued_pages);
>  	mgr->default_page_size = default_page_size;
>  	mgr->visible_size = io_size;
>  	mgr->visible_avail = io_size;
> @@ -471,3 +498,312 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
>  
>  	return avail;
>  }
> +
> +static bool is_ttm_vram_migrate_lrc(struct xe_device *xe, struct xe_bo *pbo)
> +{

The locking is def not correct in this function but I don't think you
need this function. More below.

> +	if (pbo->ttm.type == ttm_bo_type_kernel &&
> +	    pbo->flags & XE_BO_FLAG_FORCE_USER_VRAM &&
> +	    (pbo->flags & (XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE)) &&
> +	    !(pbo->flags & XE_BO_FLAG_PAGETABLE)) {
> +		unsigned long idx;
> +		struct xe_exec_queue *q;
> +		struct drm_device *dev = &xe->drm;
> +		struct drm_file *file;
> +		struct xe_lrc *lrc;
> +
> +		/* TODO : Need to extend to multitile in future if needed */
> +		mutex_lock(&dev->filelist_mutex);
> +		list_for_each_entry(file, &dev->filelist, lhead) {
> +			struct xe_file *xef = file->driver_priv;
> +
> +			mutex_lock(&xef->exec_queue.lock);
> +			xa_for_each(&xef->exec_queue.xa, idx, q) {
> +				xe_exec_queue_get(q);
> +				mutex_unlock(&xef->exec_queue.lock);
> +
> +				for (int i = 0; i < q->width; i++) {
> +					lrc = xe_exec_queue_get_lrc(q, i);
> +					if (lrc->bo == pbo) {
> +						xe_lrc_put(lrc);
> +						mutex_lock(&xef->exec_queue.lock);
> +						xe_exec_queue_put(q);
> +						mutex_unlock(&xef->exec_queue.lock);
> +						mutex_unlock(&dev->filelist_mutex);
> +						return false;
> +					}
> +					xe_lrc_put(lrc);
> +				}
> +				mutex_lock(&xef->exec_queue.lock);
> +				xe_exec_queue_put(q);
> +				mutex_unlock(&xef->exec_queue.lock);
> +			}
> +		}
> +		mutex_unlock(&dev->filelist_mutex);
> +		return true;
> +	}
> +	return false;
> +}
> +
> +static void xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *pbo)
> +{
> +	struct ttm_placement place = {};
> +	struct ttm_operation_ctx ctx = {
> +		.interruptible = false,
> +		.gfp_retry_mayfail = false,
> +	};
> +	bool locked;
> +	int ret = 0;
> +
> +	/*  Ban VM if BO is PPGTT */
> +	if (pbo->ttm.type == ttm_bo_type_kernel &&
> +	    pbo->flags & XE_BO_FLAG_FORCE_USER_VRAM &&
> +	    pbo->flags & XE_BO_FLAG_PAGETABLE) {
> +		down_write(&pbo->vm->lock);
> +		xe_vm_kill(pbo->vm, true);
> +		up_write(&pbo->vm->lock);
> +	}
> +
> +	/*  Ban exec queue if BO is lrc */
> +	if (pbo->ttm.type == ttm_bo_type_kernel &&
> +	    pbo->flags & XE_BO_FLAG_FORCE_USER_VRAM &&
> +	    (pbo->flags & (XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE)) &&
> +	    !(pbo->flags & XE_BO_FLAG_PAGETABLE)) {
> +		struct drm_device *dev = &xe->drm;
> +		struct xe_exec_queue *q;
> +		struct drm_file *file;
> +		struct xe_lrc *lrc;
> +		unsigned long idx;
> +
> +		/* TODO : Need to extend to multitile in future if needed */
> +		mutex_lock(&dev->filelist_mutex);
> +		list_for_each_entry(file, &dev->filelist, lhead) {
> +			struct xe_file *xef = file->driver_priv;
> +
> +			mutex_lock(&xef->exec_queue.lock);
> +			xa_for_each(&xef->exec_queue.xa, idx, q) {
> +				xe_exec_queue_get(q);
> +				mutex_unlock(&xef->exec_queue.lock);
> +
> +				for (int i = 0; i < q->width; i++) {
> +					lrc = xe_exec_queue_get_lrc(q, i);
> +					if (lrc->bo == pbo) {
> +						xe_lrc_put(lrc);
> +						xe_exec_queue_kill(q);
> +					} else {
> +						xe_lrc_put(lrc);
> +					}
> +				}
> +
> +				mutex_lock(&xef->exec_queue.lock);
> +				xe_exec_queue_put(q);
> +				mutex_unlock(&xef->exec_queue.lock);
> +			}
> +		}
> +		mutex_unlock(&dev->filelist_mutex);
> +	}
> +
> +	spin_lock(&pbo->ttm.bdev->lru_lock);
> +	locked = dma_resv_trylock(pbo->ttm.base.resv);
> +	spin_unlock(&pbo->ttm.bdev->lru_lock);
> +	WARN_ON(!locked);
> +	ret = ttm_bo_validate(&pbo->ttm, &place, &ctx);
> +	drm_WARN_ON(&xe->drm, ret);
> +	xe_bo_put(pbo);
> +	if (locked)
> +		dma_resv_unlock(pbo->ttm.base.resv);
> +}
> +
> +static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, unsigned long addr,
> +					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
> +{
> +	struct xe_ttm_vram_offline_resource *nentry;
> +	struct ttm_buffer_object *tbo = NULL;
> +	struct gpu_buddy_block *block;
> +	struct gpu_buddy_block *b, *m;
> +	enum reserve_status {
> +		pending = 0,
> +		fail
> +	};
> +	u64 size = SZ_4K;
> +	int ret = 0;
> +
> +	mutex_lock(&vram_mgr->lock);
> +	block = gpu_buddy_addr_to_block(mm, addr);
> +	if (PTR_ERR(block) == -ENXIO) {
> +		mutex_unlock(&vram_mgr->lock);
> +		return -ENXIO;
> +	}
> +
> +	nentry = kzalloc_obj(*nentry);
> +	if (!nentry)
> +		return -ENOMEM;
> +	INIT_LIST_HEAD(&nentry->blocks);
> +	nentry->status = pending;
> +
> +	if (block) {
> +		struct xe_ttm_vram_offline_resource *pos, *n;
> +		struct xe_bo *pbo;
> +
> +		WARN_ON(!block->private);
> +		tbo = block->private;
> +		pbo = ttm_to_xe_bo(tbo);
> +
> +		xe_bo_get(pbo);
> +		/* Critical kernel BO? */
> +		if (pbo->ttm.type == ttm_bo_type_kernel &&
> +		    (!(pbo->flags & XE_BO_FLAG_FORCE_USER_VRAM) ||

Wouldn't it be easier to just add flag XE_BO_FLAG_KERNEL_CRITICAL then
update all BOs we create at driver with this flag?

We then can drop is_ttm_vram_migrate_lrc.

Matt

> +		     is_ttm_vram_migrate_lrc(xe, pbo))) {
> +			mutex_unlock(&vram_mgr->lock);
> +			kfree(nentry);
> +			xe_ttm_vram_free_bad_pages(&xe->drm, vram_mgr);
> +			xe_bo_put(pbo);
> +			drm_err(&xe->drm,
> +				"%s: corrupt addr: 0x%lx in critical kernel bo, request reset\n",
> +				__func__, addr);
> +			/* Hint System controller driver for reset with -EIO  */
> +			return -EIO;
> +		}
> +		nentry->id = ++vram_mgr->n_queued_pages;
> +		list_add(&nentry->queued_link, &vram_mgr->queued_pages);
> +		mutex_unlock(&vram_mgr->lock);
> +
> +		/* Purge BO containing address */
> +		 xe_ttm_vram_purge_page(xe, pbo);
> +
> +		/* Reserve page at address addr*/
> +		mutex_lock(&vram_mgr->lock);
> +		ret = gpu_buddy_alloc_blocks(mm, addr, addr + size,
> +					     size, size, &nentry->blocks,
> +					     GPU_BUDDY_RANGE_ALLOCATION);
> +
> +		if (ret) {
> +			drm_warn(&xe->drm, "Could not reserve page at addr:0x%lx, ret:%d\n",
> +				 addr, ret);
> +			nentry->status = fail;
> +			mutex_unlock(&vram_mgr->lock);
> +			return ret;
> +		}
> +
> +		list_for_each_entry_safe(b, m, &nentry->blocks, link)
> +			b->private = NULL;
> +
> +		if ((addr + size) <= vram_mgr->visible_size) {
> +			nentry->used_visible_size = size;
> +		} else {
> +			list_for_each_entry(b, &nentry->blocks, link) {
> +				u64 start = gpu_buddy_block_offset(b);
> +
> +				if (start < vram_mgr->visible_size) {
> +					u64 end = start + gpu_buddy_block_size(mm, b);
> +
> +					nentry->used_visible_size +=
> +						min(end, vram_mgr->visible_size) - start;
> +				}
> +			}
> +		}
> +		vram_mgr->visible_avail -= nentry->used_visible_size;
> +		list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
> +			if (pos->id == nentry->id) {
> +				--vram_mgr->n_queued_pages;
> +				list_del(&pos->queued_link);
> +				break;
> +			}
> +		}
> +		list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
> +		/* TODO: FW Integration: Send command to FW for offlining page */
> +		++vram_mgr->n_offlined_pages;
> +		mutex_unlock(&vram_mgr->lock);
> +		return ret;
> +
> +	} else {
> +		ret = gpu_buddy_alloc_blocks(mm, addr, addr + size,
> +					     size, size, &nentry->blocks,
> +					     GPU_BUDDY_RANGE_ALLOCATION);
> +		if (ret) {
> +			drm_warn(&xe->drm, "Could not reserve page at addr:0x%lx, ret:%d\n",
> +				 addr, ret);
> +			nentry->status = fail;
> +			mutex_unlock(&vram_mgr->lock);
> +			return ret;
> +		}
> +
> +		list_for_each_entry_safe(b, m, &nentry->blocks, link)
> +			b->private = NULL;
> +
> +		if ((addr + size) <= vram_mgr->visible_size) {
> +			nentry->used_visible_size = size;
> +		} else {
> +			struct gpu_buddy_block *block;
> +
> +			list_for_each_entry(block, &nentry->blocks, link) {
> +				u64 start = gpu_buddy_block_offset(block);
> +
> +				if (start < vram_mgr->visible_size) {
> +					u64 end = start + gpu_buddy_block_size(mm, block);
> +
> +					nentry->used_visible_size +=
> +						min(end, vram_mgr->visible_size) - start;
> +				}
> +			}
> +		}
> +		vram_mgr->visible_avail -= nentry->used_visible_size;
> +		nentry->id = ++vram_mgr->n_offlined_pages;
> +		list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
> +		/* TODO: FW Integration: Send command to FW for offlining page */
> +		mutex_unlock(&vram_mgr->lock);
> +	}
> +	/* Success */
> +	return ret;
> +}
> +
> +static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_device *xe,
> +							 resource_size_t addr)
> +{
> +	unsigned long stolen_base = xe_ttm_stolen_gpu_offset(xe);
> +	struct xe_vram_region *vr;
> +	struct xe_tile *tile;
> +	int id;
> +
> +	/* Addr from stolen memory? */
> +	if (addr + SZ_4K >= stolen_base)
> +		return NULL;
> +
> +	for_each_tile(tile, xe, id) {
> +		vr = tile->mem.vram;
> +		if ((addr <= vr->dpa_base + vr->actual_physical_size) &&
> +		    (addr + SZ_4K >= vr->dpa_base))
> +			return vr;
> +	}
> +	return NULL;
> +}
> +
> +/**
> + * xe_ttm_vram_handle_addr_fault - Handle vram physical address error flaged
> + * @xe: pointer to parent device
> + * @addr: physical faulty address
> + *
> + * Handle the physcial faulty address error on specific tile.
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
> +int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr)
> +{
> +	struct xe_ttm_vram_mgr *vram_mgr;
> +	struct xe_vram_region *vr;
> +	struct gpu_buddy *mm;
> +	int ret;
> +
> +	vr = xe_ttm_vram_addr_to_region(xe, addr);
> +	if (!vr) {
> +		drm_err(&xe->drm, "%s:%d addr:%lx error requesting SBR\n",
> +			__func__, __LINE__, addr);
> +		/* Hint System controller driver for reset with -EIO  */
> +		return -EIO;
> +	}
> +	vram_mgr = &vr->ttm;
> +	mm = &vram_mgr->mm;
> +	/* Reserve page at address */
> +	ret = xe_ttm_vram_reserve_page_at_addr(xe, addr, vram_mgr, mm);
> +	return ret;
> +}
> +EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index 87b7fae5edba..8ef06d9d44f7 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -31,6 +31,7 @@ u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
>  void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>  			  u64 *used, u64 *used_visible);
>  
> +int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr);
>  static inline struct xe_ttm_vram_mgr_resource *
>  to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index 9106da056b49..94eaf9d875f1 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -19,6 +19,14 @@ struct xe_ttm_vram_mgr {
>  	struct ttm_resource_manager manager;
>  	/** @mm: DRM buddy allocator which manages the VRAM */
>  	struct gpu_buddy mm;
> +	/** @offlined_pages: List of offlined pages */
> +	struct list_head offlined_pages;
> +	/** @n_offlined_pages: Number of offlined pages */
> +	u16 n_offlined_pages;
> +	/** @queued_pages: List of queued pages */
> +	struct list_head queued_pages;
> +	/** @n_queued_pages: Number of queued pages */
> +	u16 n_queued_pages;
>  	/** @visible_size: Proped size of the CPU visible portion */
>  	u64 visible_size;
>  	/** @visible_avail: CPU visible portion still unallocated */
> @@ -45,4 +53,22 @@ struct xe_ttm_vram_mgr_resource {
>  	unsigned long flags;
>  };
>  
> +/**
> + * struct xe_ttm_vram_offline_resource - Xe TTM VRAM offline  resource
> + */
> +struct xe_ttm_vram_offline_resource {
> +	/** @offlined_link: Link to offlined pages */
> +	struct list_head offlined_link;
> +	/** @queued_link: Link to queued pages */
> +	struct list_head queued_link;
> +	/** @blocks: list of DRM buddy blocks */
> +	struct list_head blocks;
> +	/** @used_visible_size: How many CPU visible bytes this resource is using */
> +	u64 used_visible_size;
> +	/** @id: The id of an offline resource */
> +	u16 id;
> +	/** @status: reservation status of resource */
> +	bool status;
> +};
> +
>  #endif
> -- 
> 2.52.0
> 
