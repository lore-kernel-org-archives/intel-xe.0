Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8710C369BD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 02:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604EB10EA09;
	Thu, 17 Apr 2025 02:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JASjeBYs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41C210EA09
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 02:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744858327; x=1776394327;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xQUyXzMmcJVOmw5OcAX6+kvG/h86qaOe2vZL7KHazOQ=;
 b=JASjeBYsyzzcWj/0r5yOG1zS6Fqk1RfBK8+ZnalcrNFf24WyRvLGYWaQ
 mDzBLgFho5Q1u0uQjgSbI96MOx9bkrR/nH2u66ENxxBorEqgzzb01dYaO
 zgU6L6B1xs9Sx9zqmYqIebg+x+qnxHo/p3s+UBr5srI4de/LYAsEAnPtj
 8PYHuphvJoo4jPBsk4Hg25QtwWU5ZKlzyujCcPGZRVFPjj1iCGg6cc49E
 LpsT/FxRiiIphiKkID1HAaxOollu0h/bqwSPHFua65WJ8d6HPRcFN+B0d
 J3PAbYfGgJqZQXB+jwYMiDE58eY00f3bq0N0+BgZ4WM7TLKB8op9GA9K6 g==;
X-CSE-ConnectionGUID: ntvTVTfmRNK39W2PWQFX0g==
X-CSE-MsgGUID: 7q6dzbarQzuW4IMvKsroHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="49126357"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="49126357"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 19:52:07 -0700
X-CSE-ConnectionGUID: OHpYQ0eQSbykgdnKh2EDAA==
X-CSE-MsgGUID: jAXnHx/RT16Kcu5SuvOkPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="134763035"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 19:52:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 19:52:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 19:52:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 19:52:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyJ/yt7tE2xMEM5INkh8+RKe2QmhOvIgET/JSvuTkjNBOIPkgpoHQl/V8780sZ2ZTeIJhBUpFNWJmM1bupiW+W58IHMly7WNMcuTSef8/l+EfV3Tp2HprZJHlwDGbABaVAzzTZoLiQ0Mye/PFgcCHV9MTtMZPky1aZuRwhD3sAG+2Ow9WZI43TEuBy+s7BE0tZa1Keu5aEZg9hWUHWluwM0ynXFlAEgFuXw97Q1FIQM7gGfueTlbeMpew34zZG/dl88mIYDYgwFs4Rg2vU1aTTaDG3K2eFS0ll6+Jzm4YolwOBV99vyN4+8i05R8oNSUzVHcjDSsYrsLrQKuRa0EKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5EL12O/l9T7IcSPrOgWRrnxlAnrdD5FcJlQNUdEZeE=;
 b=fnq7SfGxP7MTGeBDr/z3Jd2janv0lCmRkILld6Nqjv5UXjSIXye1lzg0TgUtPJsss1x7G5gn23GT5bUzZlIYZ81INF/sy8Z443a3bMm+3JnTlOGe30KYkSk+FbKgLukmcNDwt1hTOo5r0mxGUbXO3M6qGGShAv//JsPikf3Zo0ioFbpOhOUFzz94+rljO57H+PB6tm85Je8g3UVTJRHJS/XV8WiuDghElgNbCi6IMu0JpQ6epoDNOBpo9ps5UbrLqvqtuuob4cRgKniOI3Z964x/J1n+KDT3VEg+949ld1AZNweJxL9/AxDDyxeGQQy1zZXgQGylCf0WYMnqzLYyMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5304.namprd11.prod.outlook.com (2603:10b6:208:316::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 02:51:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Thu, 17 Apr 2025
 02:51:47 +0000
Date: Wed, 16 Apr 2025 19:53:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 07/32] drm/xe/vm: Add an identifier in xe_vma_ops for
 svm prefetch
Message-ID: <aABtEn1zbdSI7IVR@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-8-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-8-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4P221CA0020.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: cb4cab2c-4fae-447e-8e31-08dd7d5acbd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y/K4pAt/cQBSVxv1gs7i+qdU9Vf0TLQl4xtGNcfiHbTr1NBxB6VZFlyDo8Qd?=
 =?us-ascii?Q?5mK3guCRQYI6IEOG1oMIDCBYfLyb9kY/s2J5HyPdKEN7/nAgXDJpP48PafZA?=
 =?us-ascii?Q?Fi+kmya9lBQCtNctKMZnd+YNKN3LJ/qL6hX9DgnC1ar60acgOeLJ43bMxQsW?=
 =?us-ascii?Q?KQgI9bh+gclNPuZMtdzdNCrh8I/xWr5dXb9eI9CZ/jEc+bXII843NySuHUxH?=
 =?us-ascii?Q?by8XSVEX6gVslsLSQONYk6nBGiMCA0ncuHVzPkqCq5SbpQAMiIghk4wj7zOM?=
 =?us-ascii?Q?Kk68v2q5wEwVrHZ8W6gh7EF+141s2G2sRnNZn/lgXCLWS2vvTf/qS3t7hbtE?=
 =?us-ascii?Q?ESPWtksIBMOBjFZbqB/rEbsEzS51IK8rDuc0JO/idbCc/lU6z1AHQSZkZXgk?=
 =?us-ascii?Q?hwJw3ioQ8IkjbSK2x7HSd6s/ssXg+NAyFbFQqdglRYrUwGpqybB2HW4LHztA?=
 =?us-ascii?Q?t+kaQyzrPmTvyWGtC/GQKJfyepgZzaUR6WqeI364iak2atItq0v6u+yOgFBc?=
 =?us-ascii?Q?WXRNDuy3iIqXD5jZxwIwne8qGI6h9564z6NfipWrM3+A8X7v0R+SbNKZA26E?=
 =?us-ascii?Q?sjg583XI/tPj2KCxWgKFdXzTBsBMt0R2PbufNNZLmmMH4CfVYgjYBwFb+iKg?=
 =?us-ascii?Q?7GolbXarmM85dcYbBxhPJ549t0BJmCNZT+RkYJ+2B5FcunMgJuQ1WARCIBXg?=
 =?us-ascii?Q?TxzBm1rL/ZIu33XzlyT+s+dLU6GeUwRdgiaEznPXmiEAcsC3bYMxwzrZ4bwc?=
 =?us-ascii?Q?lxBpBBx+L8E8BC5+lvLep3HQc1Mp2kE+e0/h3A+85X2HXpUD81nfMxz+5Air?=
 =?us-ascii?Q?i450QekyBQqRvd/c7/S5DIBjKYImsKgWkeZX1AF9Qz2Z+BxN4LNQCxXimeAV?=
 =?us-ascii?Q?1NOSN2X0jvSVQxatSPZLIHUlaq+TbuYHVmvLdCKpamnc4BA4uzXxK9fV+pOV?=
 =?us-ascii?Q?ACx+0uo4EMDljkOz/IW3OOBxglfp/G19TUzOhD0b4RRmuB/FHiAPIzhoBnE6?=
 =?us-ascii?Q?nuEZWP6Jsb45puyv70r/iKJY+9vyaW56BKqwfsxDK7SI5ztci1r4+YtSz6u2?=
 =?us-ascii?Q?XBew+cWSK2bMV3sNWBF+NtF8jLhNxKPvsZjRh9EeDHVCM1x0fe2+5hkN81Bi?=
 =?us-ascii?Q?3gQn/7QdgQphJXJ48pew7OJeG3seONxRdl+eHVveHYlLk+r2zYS5Q/QPlj5v?=
 =?us-ascii?Q?wfXFhiHTw1HEaWoe6Rylew2KG0J36Ab8YMJTONtaCIiO+Zzkatfsqw4qb57B?=
 =?us-ascii?Q?/NwBxxejT3KObUQm/ILgREwzjH0FLiFDZNz4VBYtwJs9ox+UguQUEYGlRg0s?=
 =?us-ascii?Q?rCls8Lk1HDeMHxJkta8z+HWUay5P4LBRToKZRRUG1KwrakhH1a4/WIJV76iJ?=
 =?us-ascii?Q?mkYxO3CqvY92dfZcMuMoCjKPNvGHF6dVDs5Kj/je4KnTJmcVqGw2ESh9T9Im?=
 =?us-ascii?Q?/OitEBhSR1w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XPha2sE/Ge/wRGlX8+7+NmQvCISBO+VwgLqKauRauDWaMfCtj7nV1pFDKtVU?=
 =?us-ascii?Q?TPsKgVJElbyBVuudro3pyn2P7uflft/ayUVwLpB0ztHY67cANkmldWUz1CH6?=
 =?us-ascii?Q?swfe+gz7krbKuk9AGDEBxBXTCFElK/yLIqmvHKymiQn1SrWqC0VP/QTBvnQT?=
 =?us-ascii?Q?enT23kufAZknd3Tv6RpsXMyLeBS1vk5DfjKNNg9vzuvDywr7aK7KWoNQ4FVr?=
 =?us-ascii?Q?LeTF8V6UJdHQPv/cFlK0F6vBY+js00u31fLLzhZ4KCMl+YYqg3DqcjY8ndwq?=
 =?us-ascii?Q?YOS1LQy4QOkJZ6XDKmbCeiIh3j+W7a3fZ2Y/L2yTS+EUJlR6uZ7DQvDfAr0Q?=
 =?us-ascii?Q?WPUutFsGhXum2e87wJkeZrsJRqw+CHMU/aHwhqO+bqSAqvlf4JhClMl3AMau?=
 =?us-ascii?Q?/JFIzDx7rn4gUfzc4BLplxO3FpoIG2GHGki1YRsQcfRHi3ocNcIQUntXppHy?=
 =?us-ascii?Q?fbarCu01NIYmwMHXpQQzous8p5tPATOwEa2VupABgooBof8yVayL3NhdCx8S?=
 =?us-ascii?Q?0rKv6CHN1uHYvs1cnh0iv3BkkoP9iS3uoY1cWKJ51AMTqSPG1H2o3VF2WI2g?=
 =?us-ascii?Q?NnOIaXRH+rm/ppxo5p5YuDrPeZjIvJvZDYVLAKqiKy7osXWdkhWBni4j92q+?=
 =?us-ascii?Q?C5UHeWDLn8DFOV4vtU+CD66Onyg1O+9pOEtLXqAKBtcIEFUBU0fTCuOQP4Kc?=
 =?us-ascii?Q?VUc7AALBnSWt0m+wOTzQnYt4NwsptZkcV6ZmPstcEnNRR+2CGyFJY1Q52sht?=
 =?us-ascii?Q?AC+jhNsQzxqtT69VUfzK1Yn8OsaghlT7v/17P4qLmssNFWVAkWx3soGIwGqd?=
 =?us-ascii?Q?ADkiKvQXJ7BIS7CQYT9PahkbDGLijEuu4broQTMtDll1A2x+sklUvAQRNXZo?=
 =?us-ascii?Q?EM/WRSLAD4QxvFaTAvs/ljdnGgVEmR/YCtb8XAuOCuyYGQwgrRJqWYS0KV+g?=
 =?us-ascii?Q?fofV81vlIydtyYzUNwEjKo8Lj9Z1E/F/jZPw/lJ1uTpeYlLtMeSTj2QCxCcM?=
 =?us-ascii?Q?GkD/c903FYokgEAAeueYiVEi/4Vc6meaU7xfKI7xqMgRdV5nlagXJJzAquMQ?=
 =?us-ascii?Q?ZgqfOA9sHZqdR7IM+pAwjDxjs3O9Lste13SMxx7UMXDkoSeYGj84wnXg4p7b?=
 =?us-ascii?Q?KQurvqu+Z7Gmg6GAO5qwH9aekNJN1xbGGXYp1U+A5ogf2cJXe/EiW/hdL67u?=
 =?us-ascii?Q?0rQR64Nc48JgvwtUftD92q7/fd2Zssd980hcVCUNYTb1AaxNsYfWDpron6J7?=
 =?us-ascii?Q?KrKihMBc/MWCSjsclDv+7WjAs2Fnl55RWTmHunIa27PncWTe5GhielLLR8fi?=
 =?us-ascii?Q?cEqf99PjUtHUzsy/Mxy540cGg30ma3u9BfZgPF8ed36FwwEq5Hqb+YbfoB9A?=
 =?us-ascii?Q?JhAo1kHhxWT89D1FX4ERVXO+vzAd9ekzrGpCSGXVyx+R7hOFZ8+vuKV7qax+?=
 =?us-ascii?Q?IcssjwV0k52WkPkYB8fmCVc6ZtxvJvU87w8FWz9/RaKaiPnfytttZgnkRbnj?=
 =?us-ascii?Q?fOVI+RNvOViHDKaxaI5eATfQ63zLiNnl48ONFKfYoHp0pa0zuOcB3eyZf4UX?=
 =?us-ascii?Q?gZAPe9mmoXpLkrf1ewR1O86YyKZJf+PJZzXXua0MKmKwhKQNHVg9L10tBINM?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4cab2c-4fae-447e-8e31-08dd7d5acbd0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 02:51:47.8878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Te+kweuw8x3mSwIcFBc0vzxBcu9ZsyEt7zdzCZ1QiZqN68MreTI5p1kvgKnc1Ri1+kobfUPD0x28ob7p/dH/sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5304
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

On Mon, Apr 07, 2025 at 03:46:54PM +0530, Himal Prasad Ghimiray wrote:
> Add a flag in xe_vma_ops to determine whether it has svm prefetch ops or
> not.
> 
> v2:
>  - s/false/0 (Matthew Brost)
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 1 +
>  drivers/gpu/drm/xe/xe_vm_types.h | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 4d215c55a778..b1f1e85d26f7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3240,6 +3240,7 @@ static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
>  	vops->q = q;
>  	vops->syncs = syncs;
>  	vops->num_syncs = num_syncs;
> +	vops->flags = 0;
>  }
>  
>  static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index ae0bcefdbfcd..d3c1209348e9 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -445,6 +445,9 @@ struct xe_vma_ops {
>  	u32 num_syncs;
>  	/** @pt_update_ops: page table update operations */
>  	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
> +	/** @flag: signify the properties within xe_vma_ops*/
> +#define XE_VMA_OPS_HAS_SVM_PREFETCH BIT(0)

Maybe s/XE_VMA_OPS_HAS_SVM_PREFETCH/XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH ?

Either way:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +	u32 flags;
>  #ifdef TEST_VM_OPS_ERROR
>  	/** @inject_error: inject error to test error handling */
>  	bool inject_error;
> -- 
> 2.34.1
> 
