Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678E7CCD193
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 00:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C0610E90B;
	Thu, 16 Oct 2025 00:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BeJLCfg/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8228010E90B
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 00:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760574883; x=1792110883;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fO5Gz6X/NCd209pnF7gNDrU1vRAQUUOt+R97BoqbZwc=;
 b=BeJLCfg/83lyuklqCVCAQgUMJvUBj1IMaJXj6WS6Ygzfbs2Tw9ay687w
 82LHvBXsN2Cfx1cPVQonnI43w+EPhtD1n04DlH1gkHxOTDAAnLJXkJmEN
 Gkw7N4kLwn4cGB42BpVgAzqOkxbxEpNvzHyWXZOWw7NyUWjVsidcOrYzk
 UZ+BZgK/Us+Zbsw4I5xlqhebP4VVpVnqF3yiqwYMjZpXTVUgBbX/ij4X4
 PMbhKOsNq1KHumKwszMuahP1TJrL8bT3xWZjoyF+U1teN6Y1cfxtNucnZ
 0Nbmg5LXAYjZ8B/U8kqoqNHyd9WwWzJQjupy9F9mKt6b/1zzcVrIyXMMZ Q==;
X-CSE-ConnectionGUID: DE8gHW4WQTSabZaKoVSUwA==
X-CSE-MsgGUID: KzHC9Ob1Sg6YRgb1UB4//g==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62467881"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62467881"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 17:34:43 -0700
X-CSE-ConnectionGUID: 1skI0e1eSQy7U/TQ864vBA==
X-CSE-MsgGUID: BwvmEGMPS5WR8q6g+H6jfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="183105076"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 17:34:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 17:34:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 17:34:42 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 17:34:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+4lIXlrjevbOdDNrlKCDBr+JkbaF+nlY0Edeym8CubT3/08Y5qYBKX1FWJQ1CLo7W/uIsdTzQf1wOvQOgW6dxpV+ZOc2YPLSx60g83osO6YvoEJIJ5Uxfvag6rsD12JBxtmvO+suAbm7UuDMNJe6Ztvr+igVCNs3XxFTX2w+j+tehvybgBjfcF5KeqVqDyZlqAM8omIYqPt+MTLSuU1390r6zqKW+DoqUqyxcfra2NhmbjNwcblG3h0/z4NpPTwxVmyNMaZuWzUrYzoQVqSqSgd5FhTzp4C3+zV77Rhi7q8QLkb3wJF60P4hlqtXD1BT/JwwOmZqIiOGblEFBpr+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tcoHmWZ4zLdgfe3gznNLrzZu+o+F/mAyiUCqoaYzFE=;
 b=KWviuM2aLZQosSq7lhXgcXZB3gWQy+9tEXqUEUO2Dx/OTwaa2wgLvM8nZwmLJyDrd5wPJRPpchqJll3lS8+yWYLST17iY9DRGEcUxRPlmoLXd0fBlS+il9G4FKpnMieFSrYxLpZ007GlLuE3MkRpWnx6auCpoZoX9xi11DRm8lcrBLUR6uUR68PXNh3o+Q2Dbe6kTLm6eDxBjBZK262qLavhd0fLPUjUZ+O+KohKMnhmcHtB9d4hzAHTFE9YQRv8AmCTk3FDJRtMVeftGUFDRthaMjSILiJ91TT+0uKLfERWoNBCuLJv3UABGYsE1gzo4Ks20cElb3dg5pEngsvdLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6524.namprd11.prod.outlook.com (2603:10b6:510:210::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Thu, 16 Oct
 2025 00:34:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 00:34:35 +0000
Date: Wed, 15 Oct 2025 17:34:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/6] drm/xe/migrate: fix chunk handling for 2M page emit
Message-ID: <aPA9mNTupgX3Ks/b@lstrano-desk.jf.intel.com>
References: <20251015141929.123637-8-matthew.auld@intel.com>
 <20251015141929.123637-10-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015141929.123637-10-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0214.namprd04.prod.outlook.com
 (2603:10b6:303:87::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b12b585-bf4f-4ab3-142b-08de0c4bc7ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DcMtO6il/6RErJdj0cpBz95OJeNLIvF1sGidGlnr6RPYUDl6wMaFucGGcXZS?=
 =?us-ascii?Q?yvy/uUu7jg6xamSsaalPtk435K8+mVofuowOV6BEWii1eW5gA/sLiN5hiiUY?=
 =?us-ascii?Q?eci7jBKXMGCxxXWTa3OmOkICSRhgsJudA1yo9vEzgjYM57xkJLYvHJyaINGM?=
 =?us-ascii?Q?MatoquHY6W7b8IWwi3RqK7GyYkUM6C/Xws+JNMZ8q/SmKGn6BY9s7AwkwVwi?=
 =?us-ascii?Q?PJxobn7g96aFDO3/z+gKLH3xFcOm0/t0kryD4+lkfCkvavP9rPHWu0pWG8HW?=
 =?us-ascii?Q?+2fBdlqwlgl6/gex0y7p5kwZWYb4sK+Hze61hdwbQvcuLblN0vu5Avk6x9GM?=
 =?us-ascii?Q?NyDJD1gLLKBOU4YbmlPevti739JSSSAM94YynSLYQue9cWZzHy1J0YqlAyE4?=
 =?us-ascii?Q?iT7UfxXT/pWKI5J0fS8+Ga6AQ9/qa1TZh/gNV2PLt5hbMzG0lCHUdeHhei9E?=
 =?us-ascii?Q?7+XbB16hDx9P3Nm9TuOtBV+MXzBwblzkhivz45FZo6m6pxmWnuqKiAfxXpsN?=
 =?us-ascii?Q?IufrcoqzdNfFmAVgR5w/t0qR6i87mm+4N42oWSMFBA5qNC7q+XAlg5jSuo0Y?=
 =?us-ascii?Q?BA4VuTBMDSGW0zWGhU56iC+Qu/SPCoOqXvsxwy2DEYToFcPUGFIbtylU6v0R?=
 =?us-ascii?Q?oOkh20huR8dcqlsIRyNOVNnD7FGBjNkakV2NRCTu53UbIEKa2W3BuaG8Vs+d?=
 =?us-ascii?Q?4mL+q9rJT+qmtPzZ2LasCQIBRRmxM+QugymTGVQ2ZGDAdXBvLor/JbEFNT94?=
 =?us-ascii?Q?Xb9gfoxiGxjVu+xb71q7HH7F7/+5wayizaP6NrbQXBt2Y/9l6b4+EmTGhUoo?=
 =?us-ascii?Q?i/YIuekqxkRPVuZqEz5m+NFBYgR5EzUgK3utNCUBl6KzZKccFTUu7MYd7FEi?=
 =?us-ascii?Q?J/8zFHO9Ev3Kxgkli7vlEEsPGN9LzFfbBuy88eVIbMhxRQpzwwvBUN/TAFUB?=
 =?us-ascii?Q?nkzThaeITi0qwaWsoHayDkkRz5k14LrfGHF/f/H2HK1pqjeHYOrbWAZ3mnFp?=
 =?us-ascii?Q?0GTMXXoieX1BB4QISC7XOLc0c8d2G7O/5+foPUcgxYWLEPA4Kl2ixUPBaFx4?=
 =?us-ascii?Q?KoTXHxhIOBk7r0zpzgvh1z9IIATBGh9M/DE3ncDB9cUizNq1AHurWxemuB35?=
 =?us-ascii?Q?pYSABHPLRWjuNwsz+o+cN0jeRlKyMYZ3I2yEaXRRHCRSVlh3fBuRFUcxt4Iq?=
 =?us-ascii?Q?qp9abUBTeaQIaAyMunLMPHNG7Uq2X6DtBQLDsbJhkCe1zEfpFnwGgCHz6l1O?=
 =?us-ascii?Q?FZgcRlGR/6u2MJi+04FeG7elBi9fxm8jo2xdK0c25YmEDtWRipeZe2LnnDX7?=
 =?us-ascii?Q?V7+26RJyEeFRn8X+4LLr77PutVNcgeMZHH8XSuzVoEw30fNG1p43BJ05iNwI?=
 =?us-ascii?Q?aaeNZ9SW22hece4FY+H4/zWEqg7FloGQwpZxgUh9p5tWlMxco8sfwICAS8zJ?=
 =?us-ascii?Q?jlr0F4SSg5bpDizqnmz3AYpkFJWjcMFL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rJL6wGNokjbxRZIKLz+fBYBSUVSulM4b0O6IDE/pEcgl8MlgXv994xN1Ja34?=
 =?us-ascii?Q?jseA2lxl4CBE3C8SzBL+11GH/06xb7rQwjB1L/jSCS2JoRhzS4n8yrEkm2lX?=
 =?us-ascii?Q?hsxbF7xm4in9XMo0DTwMkFH6zd9bIIKEoS602JYOGPR/oZFYAZMRids6F+9S?=
 =?us-ascii?Q?v6UdB6yw3nq9JBlsh6KopHPJzRScKY2Ojn9pjCAeRZ4sPzaLJV/N+E1ulpyD?=
 =?us-ascii?Q?+sAEBGhXd1PLAYZWh0TVG0wo/tjt45GrBWT05cOlUvngN5yfClyWJHPkGsLf?=
 =?us-ascii?Q?oyynA76RqhOX1dAGHm0CMsTObI57G/PCAgGhhqIKG8Xk8asx+UTVkBdOAVQa?=
 =?us-ascii?Q?Ob8X6GMysbs/Wp8kUTZ69P8HpbEKDxcdfi4ArDouIl62OjQCmj4iB5Rrpkie?=
 =?us-ascii?Q?OJEacUclmUosD1wgQN4l8NCIGEOc072gJIKcWW2FQ/WipQy63g4Oy9W3HYi0?=
 =?us-ascii?Q?ZWYB3ejjP4SN9+BLsZlI46WWgwYmG+BClmO7Rpois1kQyo+L5RNa95M7VPHJ?=
 =?us-ascii?Q?5mOxu++v5TpRhnHqPsNgdNXoKwDCPc6gY8nYwDC0QhpshNk44xqKBF1ybmoI?=
 =?us-ascii?Q?I/HgoX1o+TKZnFs9ZnRPkg3ZAaRvsCzj5rZiJcgZ+HCqzppMesH1/sFQMsRG?=
 =?us-ascii?Q?oum6/j1T/7DanYeirMRS8ssHwiOJEyYqjJaUCQJTbVTPYIXgh8ylsWtX2C8C?=
 =?us-ascii?Q?FvKEv+aDjiI9qjmJd2SmcPwzTzfcPRtKVCXbC+RNSOWzkcpkkERJadpND462?=
 =?us-ascii?Q?nqo2tIplVihB/IlwtNKGzCK0V/Y/saCd3U8ErwaEI2SC/nkqkpGUGaULn7gq?=
 =?us-ascii?Q?WlfiJFgsmqmPlWqrv6aohkvGoXBXH74G1d5+sB43Qm/ILvEQd+6ui/TJ1qIb?=
 =?us-ascii?Q?+Loq6TzdSKzYwZl6vN18zuIU8D3xY5DM0XWxx5/+xDiHeJ+zWFZN50lWeKIU?=
 =?us-ascii?Q?xgpGzuD11K+jccI876OwWUm203Ti67gzNAHUk+OueDOgNEBNT2NOOyMv60TX?=
 =?us-ascii?Q?EikxDn0HfdFV8A8TwcMr7YSAk+OImgykHY9IOVns4ZSdUZriqW9I/KsEubWI?=
 =?us-ascii?Q?0EFAp6xedgHHZtfFQLGK61DntSGKXOqXcn94Vc8ojVGpSjPrkKMzX+/v/X5b?=
 =?us-ascii?Q?tzwOwu+6f4GJ3CpSHjU7ERw1AczJ9/2FUMS8DZqmkL3KGrmBy3CCOPrRUnX/?=
 =?us-ascii?Q?eGONngLE/VAcW7/IFEAdu9YbqbOCSNwj3WzYs/Yg5ut7HhOTe7pcXCIXbG4D?=
 =?us-ascii?Q?O444cnSo8rmoLAkC+Sg/HGpLhAFrJVyvrWK7hk48NR4dFJxHlcQRAyHNPlMH?=
 =?us-ascii?Q?t5t97raEK79yq33U1B7C4wAHwFdWlqqfY7gd6brZox9ljZuCaDLxncyF6RP5?=
 =?us-ascii?Q?8qDjbSf9Fui5AeQDwxnd6IafHkG+LY3YXL+L4eln/OhHbQ3Tr3nL8lIyPvxF?=
 =?us-ascii?Q?XNAKG1gn+RV/o31On3QKBtwcwI65BQplBo8JQQTNvSkm5NUb41yDFIzZKtak?=
 =?us-ascii?Q?3F2YO+VafkBtV33wwl/QLDQ1zC1H6F6M1jGpbJWAnyuYW3cRaFfm03KSAduP?=
 =?us-ascii?Q?BsxTcmck+CrgPWdM+lzikPVfsi8nO02Pt+olgaEgq/l0mZGS7V+GUnRmurlt?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b12b585-bf4f-4ab3-142b-08de0c4bc7ee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 00:34:35.1186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o46gQfWwkKpG8VJj8aPVaj8Cs0xbt0PnjYAgwcY7ourNSB6H3sNySlcW+GJfoX4q/fU5sf+47EVptGiw6X+qGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6524
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

On Wed, Oct 15, 2025 at 03:19:32PM +0100, Matthew Auld wrote:
> On systems with PAGE_SIZE > 4K the chunk will likely be rounded down to
> zero, if say we have single 2M page, so one huge pte, since we also try
> to align the chunk to PAGE_SIZE / XE_PAGE_SIZE, which will be 16 on 64K
> systems. Make the ALIGN_DOWN conditional for 4K PTEs where we can
> encounter gpu_page_size < PAGE_SIZE.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Good catch.
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index ff8e442bf519..a4861ede6cef 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1804,7 +1804,9 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
>  	while (ptes) {
>  		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
>  
> -		chunk = ALIGN_DOWN(chunk, PAGE_SIZE / XE_PAGE_SIZE);
> +		if (!level)
> +			chunk = ALIGN_DOWN(chunk, PAGE_SIZE / XE_PAGE_SIZE);
> +
>  		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
>  		bb->cs[bb->len++] = pt_offset;
>  		bb->cs[bb->len++] = 0;
> -- 
> 2.51.0
> 
