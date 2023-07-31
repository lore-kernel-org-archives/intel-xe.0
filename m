Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8DFC001DE
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 08:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779F910E16F;
	Mon, 31 Jul 2023 08:41:26 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FCA10E16F
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 08:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690792884; x=1722328884;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=LqRRPureh5WMTPfXXtetqZQ+ntQNssHlROKmbGlUjL4=;
 b=lchjp6Sfr0qqC9sbKy5iaATWmne3bHxTO5HDi/rEGO0+ZmkP9LP9C+NS
 a8JTFkbHaq6MRZVEK05UDiaYEdZB0aGnferWYgIWQMk5dm1xRwRlqKASS
 +j7nGxgPMukQIo2qshMSCtG4PRC0wtkRGzphSieXXefJbCLr559svLokF
 aU0abNOaeBTApNDxO1f0RXEgp9Oj3ZPHXwwaC4Xh1QH3gMUw2A3nMZFlM
 9xR8rUvRUSvJ3M+GvOahyd0pBs5xOYFvb3VKRNwZVTr0ww8p0ftw9RBji
 aSls0Kt6o8CLqEHnMlsK2sAfu/p0Ow5STFoKhxILBxzW1bMIBvxKqBl6Z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="358994394"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="358994394"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 01:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="705324774"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="705324774"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 31 Jul 2023 01:40:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 01:40:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 01:40:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 01:40:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 01:40:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ok2nmFhJ6kZ7In8Kq6BcFBDsudGU/L8O5WWZANhSu1Y+knHAd6eNqYf4bVIsV+Mc6pKhXMHntYkmCSgGHFz2I8HTReYHtqsKve2wnSYWXv5M/V1Why8X/QYMxRSIT9dV4RrUYhr3diq0Ie5Snlqm2M6WKYuEAtI/I56LbMza1F41V4aY1lWumtTUcGmYQAjD+Gv0PoS9aEqAxHsHnYjDa7zH4owhTJ2UVRMnS3PQbWZU/ew/ljhkluUlPq9YM/k9doss3b4VUuHkNTbeAx2T/MF3cC2JiH0Pnlr0l0uxKCkLNofJOD5JybsNgQMC0DapT45HuylELmy3WtebY4NZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pafzu4Ni7lnqeD3s5CX2DNvaGTEsnfbCpuG8s+MdLw0=;
 b=oK6WrqgjZrbE1pNcza8GOA3AiEdNxsg4jAJl99cY+D9bjduTiIRoH91vTIDKVGsSKJnFCTLBH/MS07QKwCSID/n/VelWQ6ylBq/3Kabhu17YmfGp0lz4CbgJXIBeR0jQsfq9mfSg2hhxiQtMOFwSMwoOgsJL1usDYo86IBbqIUgx1ANyYbHTH6DsamJEpqfM7qNXx7Hli79wEdWpvbPIrcpdDP8rVa8d674V2xzO9PzBXYlTKhH893I2kk4iXxHkZY+PWhk6XutXQRbnpW11bFNV+UKtNQuWTlgl9B7TcYGpxhhBb0q1kCIZum3cE92sF/+6FY1qVG88kz5OgsVDeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by PH7PR11MB7429.namprd11.prod.outlook.com (2603:10b6:510:270::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 08:40:26 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 08:40:25 +0000
Date: Mon, 31 Jul 2023 14:10:15 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZMdzb7bVMQdN6Ywx@bvivekan-mobl>
References: <20230726124916.2291245-1-ravi.kumar.vodapalli@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230726124916.2291245-1-ravi.kumar.vodapalli@intel.com>
X-ClientProxiedBy: MA0PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::13) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|PH7PR11MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c18eefb-a9df-49f2-55c3-08db91a1c91c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nq0XG8ftmiY1joNWVh6pPxzEjh7a2sp5LWSnU9wdNPFPwmv6m0NoYBq5lie1jdP+hu6bUIpZi1/DJ2mrfTMHbzPP8shQGloPHrwg3IEI8BwLv2Ujp0Q65iePJuAvZeyROdJfqmP/bmt8Dg8RoQ7gHdCnYWK1etDVSWMNtXXygbf3fvRXoOB+3kWfF+3HUuC96S2/bSK4m8aRma7P21nNCJMSrZDqlNLq5x6bSVztVc2pOHtyJnNJLaY2F5DfOlxBCdPUCOgS6ULCBQENVN+yVlNwX+KVOW5UUKyj533vFvR5La+hvexJp7UjiDZk6RDdJwLrs1ApzruyUbZEYosnxaenRUvGxmnCyudB8q5JejK6bcuT/BJYJRGkLSC9vFaC4XIBpqutQ2EVW4Vi7BlZV/A7+1Ku8ENt6d4+sl0qzz3muvFKT8Ga9SiGPTUYXrJY8IoQweDvtikY0/3ZOhpyVjLJMMsXvHeGVf4f1Yywk/YVZhiBCee64Abh/LGWkIEbOH9xpI8g+xnFitGzJQ9R37nbs+wmw1owgyyKc2WhQnI1T/O/+sYdxgM8m/W1cJFN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199021)(66476007)(86362001)(41300700001)(8936002)(8676002)(316002)(5660300002)(33716001)(66946007)(66556008)(82960400001)(478600001)(2906002)(38100700002)(6666004)(44832011)(6512007)(9686003)(6486002)(6506007)(83380400001)(186003)(53546011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG50aXMrL2IyMkgydXRnVkJicnVIbUlQTGwzbDltTHZGTUt0TXF5NEkzNzZk?=
 =?utf-8?B?THlqeWdCWGZtT2cxU0ExaGhRUUpKdEN4Zkh2Z0JVTHpGRWhOdytuUjZXVzVz?=
 =?utf-8?B?ZFVDN3RTRUtrUk9ZQTNlNXRzQWxaVXpqckFiYndwME1OYXVRcURqTnpTSUI2?=
 =?utf-8?B?d3d4YTIzMHZGRlNJZWZwanNqdUpzcFhodkF3RGROeE53U0FEcXpQTGgwR2RD?=
 =?utf-8?B?VTFvWHVkQTVHQjRlV3V0ZVFaNi9MMlZDRDF3cGJHM0hrM3hyMEJUZlJ6WlJM?=
 =?utf-8?B?V2pKTzFXNCtibjZCbDdKTDNRbHpwTE5sVElmaXJVd0IwN3QwekJDKzNwU0tY?=
 =?utf-8?B?VnltbEc2M1UweFljUWJyekE4eWxwY1VCNEYySXRYQ1NYV2crRlFJenJmcms5?=
 =?utf-8?B?ZGdZTXl5ckZyN25jOUczcmRIY1FqcFBuUFdnZnE1ajZLTVhHbGdGMXFBSEsx?=
 =?utf-8?B?cUVMUm84b0hWTHg0NUYvcXp4UkJJOUxoOWFSVi9WcDZqREdZWnMrRkFHOS9O?=
 =?utf-8?B?ems4aCs5VkxrM0JUc1ozVmJVRlVMeTlGMDlLSmxVUXcxaHhLbU9EbXRuelM4?=
 =?utf-8?B?WmorSWU4Zi9SR1o3MktzWGh6RzJhK05EWHhPdWQ3dytBYXVrS2I4M1p1ZEtn?=
 =?utf-8?B?b05CKzhuTmJSWjZoeFpmSWhiUU1tZno2eGNGQjZIVUJCRFhoTjNFMGZwS3Bz?=
 =?utf-8?B?bnVaOTcwd0pSL0QzNVMyb08rdXQvcDFMdVBFaTZvZnlDSlh1VjVjS01PWWRm?=
 =?utf-8?B?UjZHcXBpOVVsNzZNUERvakFHa1NhNTcvb0JRUDhkQUwvaE1mYzlxeWkyallF?=
 =?utf-8?B?RkI2VkhkallrdWV5Mi9LZHpFUjJWeXJ1cFJzLy9ZalVXbzRLR1llcWh4WCtW?=
 =?utf-8?B?ZzZqd21TZFFES0p4bjFXQ1RDRDlqNFBCOWx1ZGMxaUJ1VC9jbjdwSU1LaUMr?=
 =?utf-8?B?Y3l5RHJKdnRBM0hDb2h1NzFwT0UzOVM3eEx2MDRNdEs4SXNUNnM3N1dFYlVN?=
 =?utf-8?B?MlR3d1ViMXBXdWtyeENOeCtZQTBtYTFqUklWTmduM3JTeFdwemx2amg4MW85?=
 =?utf-8?B?V1R1VDkzVC9TbnFhSEs5WWtzM0xkdTF1SDhmZndQWll2cDk3VERyenZrVCs3?=
 =?utf-8?B?bmtoNnR0WkV6SkxsbWQzdmVFT2ppcE5FcFM0OGVqUFBjVnVTdjVVR0I2NThX?=
 =?utf-8?B?SUlRenZmYmVHK3ZkS3g1Rkw0LzNPOU44NnRXRU0rTGczNjFTamlqQmo5M3l2?=
 =?utf-8?B?bDJ5VlloNjJTQjRBOWxZTmdRN2lTMTJNaWdoWVJtOCtibFhKeENpdGxRaVU1?=
 =?utf-8?B?YitMZ3pjMXV3UEVGWXE5NFYvbGtnTkllbGxLalJvZkdCcnNkQm9yY0FnNGlM?=
 =?utf-8?B?N2Z5eXdrZmhCWVJqUTNPRXR3VENxVzBuQ2dNUnpxSWVMaHBpMno1cGNGcnRT?=
 =?utf-8?B?QzFQQXoyNVJDMnJKcWdRRmhPaFVUSVZYWGRTSnRjOE84U3dUbHh2UzNTQlNa?=
 =?utf-8?B?OGczdXVIUGsyeXBVUEhob0FQdmlwYUREbEdOdzAxRDQ3NnpLcm1TblkzQ21D?=
 =?utf-8?B?enV3TXR3dzBDNUpDclpUWVM0SnlWWk03S1pnNTloSldtVjY2WFJvdWFxWWFm?=
 =?utf-8?B?ejdaSDFFSkd2VnhKZGZrUUEwWHp2UUp5NGRyYTdueEdRUFZVeVVackZWRzRR?=
 =?utf-8?B?R2hVbU96TlhESUE5V2c0UGFqV0JiZ0FxWi9XMklLSVNYUzlZTXl2ME5pQ2RB?=
 =?utf-8?B?NEpZUklYTzFGZUVySDkyWTZxSldLN1Bwd09tTXRTMlJuQjIybG45M0hmUkRO?=
 =?utf-8?B?dWhyQkpUcGsyMi9XWVBKUzRLdXNYYXBGRTU3SDhmMWk2VXVYOVB3S0tmOFlD?=
 =?utf-8?B?dStaYXdnWldnRmpFR2lQYmgyeEtXdVZxRENaRjEyRjFMNUlwVS9QcWRKSERP?=
 =?utf-8?B?S1BIRDgydnVpNG5pWVZzNmxaZ01lQjV3QTNSZ0VWckszbmRTRk5oNGJQblJl?=
 =?utf-8?B?eTlPRlhlQjJTb1RiaG5pTkRlU3FTd0pKaGQzWTZrVHlzNkVBMTBpRE10bC9t?=
 =?utf-8?B?RG1KYytwTW9zOG8zdGNHQ0hib1pvaGtBY0F5dkRGTUxvazdydGhUdWZqcXhp?=
 =?utf-8?B?Nkxmek1nSUFsbWlMcmhrcnlFQXNXd1gxZWlQVXlIQktlYUJUclFmWGlXRlZN?=
 =?utf-8?B?NVZLSCtDaUgyQ04xR0RPUGVlVFpqMEhzT1c4NXdlNklqTlNCbDNPeXBOWHVQ?=
 =?utf-8?Q?seWIWeV8GW/Ijg5zpjwzKDSWEn/QXF4TwaArj8wpH8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c18eefb-a9df-49f2-55c3-08db91a1c91c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 08:40:25.4466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGcwl+Co9j9W9cYXGXtq8xbE8yZk9mhauMwEaNYaOuuBieKEa0sbXul2nASq+oD7h4EjsyPGMn5XHcyrFMigzCxn4SQeDOL1jrhNl7Dihvzqv6MomUv7CKa38+ptQeqj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7429
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/ppgtt: Add support for correct PAT
 encoding in PTE and PDE
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

On 26.07.2023 18:19, Ravi Kumar Vodapalli wrote:
> Different platforms has different PAT encoding in PTE and PDE format, add
> correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
> 
> Bspec: 45101, 71582
> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c       | 119 ++++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_pt.h       |   2 +
>  drivers/gpu/drm/xe/xe_vm_types.h |   2 +
>  3 files changed, 106 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index d4660520ac2c..09dafb0e47ea 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -16,6 +16,7 @@
>  #include "xe_trace.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_vm.h"
> +#include "xe_pt.h"
>  
>  struct xe_pt_dir {
>  	struct xe_pt pt;
> @@ -62,6 +63,8 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>  {
>  	u64 pde;
>  	bool is_vram;
> +	u8 pat_index = 0;
> +	struct xe_vm *vm = bo->vm;
>  
>  	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE, &is_vram);
>  	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
> @@ -70,10 +73,9 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>  
>  	/* FIXME: I don't think the PPAT handling is correct for MTL */
>  
> -	if (level != XE_CACHE_NONE)
> -		pde |= PPAT_CACHED_PDE;
> -	else
> -		pde |= PPAT_UNCACHED;
> +
> +	pat_index = xe_pat_get_index(xe_bo_device(bo), level);

Not really related to the patch. Can you please rename the variable from
*level* to *cache* to avoid getting confused it as page table level.

Regards,
Bala

> +	pde = vm->ppgtt_pde_encode(pde, pat_index);
>  
>  	return pde;
>  }
> @@ -103,6 +105,9 @@ static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
>  static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>  			struct xe_vma *vma, u32 pt_level)
>  {
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	u8 pat_index = 0;
> +
>  	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>  
>  	if (unlikely(vma && xe_vma_read_only(vma)))
> @@ -111,19 +116,8 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>  	if (unlikely(vma && xe_vma_is_null(vma)))
>  		pte |= XE_PTE_NULL;
>  
> -	/* FIXME: I don't think the PPAT handling is correct for MTL */
> -
> -	switch (cache) {
> -	case XE_CACHE_NONE:
> -		pte |= PPAT_UNCACHED;
> -		break;
> -	case XE_CACHE_WT:
> -		pte |= PPAT_DISPLAY_ELLC;
> -		break;
> -	default:
> -		pte |= PPAT_CACHED;
> -		break;
> -	}
> +	pat_index = xe_pat_get_index(vm->xe, cache);
> +	pte = vm->ppgtt_pte_encode(pte, pat_index);
>  
>  	if (pt_level == 1)
>  		pte |= XE_PDE_PS_2M;
> @@ -187,6 +181,91 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>  	}
>  }
>  
> +static u64 __xelp_ppgtt_pde_encode_pat(u64 pte_pat, u8 pat_index)
> +{
> +
> +	pte_pat &= ~(BIT(12) | BIT(4) | BIT(3));
> +
> +	if (pat_index & BIT(0))
> +		pte_pat |= BIT(3);
> +
> +	if (pat_index & BIT(1))
> +		pte_pat |= BIT(4);
> +
> +	if (pat_index & BIT(2))
> +		pte_pat |= BIT(12);
> +
> +	return pte_pat;
> +}
> +
> +static u64 __xelp_ppgtt_pte_encode_pat(u64 pte_pat, u8 pat_index)
> +{
> +
> +	pte_pat &= ~(BIT(7) | BIT(4) | BIT(3));
> +
> +	if (pat_index & BIT(0))
> +		pte_pat |= BIT(3);
> +
> +	if (pat_index & BIT(1))
> +		pte_pat |= BIT(4);
> +
> +	if (pat_index & BIT(2))
> +		pte_pat |= BIT(7);
> +
> +	return pte_pat;
> +}
> +
> +u8 xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache)
> +{
> +	u8 pat_index;
> +
> +	if (GRAPHICS_VERx100(xe) >= 1270) {
> +		switch (cache) {
> +		case XE_CACHE_NONE:
> +			pat_index = 2;
> +		break;
> +		case XE_CACHE_WT:
> +			pat_index = 1;
> +		break;
> +		case XE_CACHE_WB:
> +		default:
> +			pat_index = 0;
> +		break;
> +		}
> +	}
> +	else if (GRAPHICS_VERx100(xe) >= 1260) {
> +		switch (cache) {
> +		case XE_CACHE_NONE:
> +			pat_index = 0;
> +		break;
> +		case XE_CACHE_WT:
> +			pat_index = 2;
> +		break;
> +		case XE_CACHE_WB:
> +		default:
> +			pat_index = 3;
> +		break;
> +		}
> +	}
> +	else
> +	{
> +		switch (cache) {
> +		case XE_CACHE_NONE:
> +			pat_index = 3;
> +		break;
> +		case XE_CACHE_WT:
> +			pat_index = 2;
> +		break;
> +		case XE_CACHE_WB:
> +		default:
> +			pat_index = 0;
> +		break;
> +		}
> +	}
> +
> +	return pat_index;
> +}
> +
>  /**
>   * xe_pt_create() - Create a page-table.
>   * @vm: The vm to create for.
> @@ -216,6 +295,12 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>  	if (!pt)
>  		return ERR_PTR(-ENOMEM);
>  
> +	/* __xelp_pte_encode applies to xelp, xehpc and xelpg platform*/
> +	vm->ppgtt_pte_encode = __xelp_ppgtt_pte_encode_pat;
> +
> +	/* __xelp_pde_encode applies to xelp, xehpc and xelpg platform*/
> +	vm->ppgtt_pde_encode = __xelp_ppgtt_pde_encode_pat;
> +
>  	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
>  				  ttm_bo_type_kernel,
>  				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index aaf4b7b851e2..0ed69abf8202 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -51,4 +51,6 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>  u64 xe_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
>  		  u64 offset, enum xe_cache_level cache,
>  		  u32 pt_level);
> +
> +u8 xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 261a4b0e8570..fc976e207462 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -336,6 +336,8 @@ struct xe_vm {
>  
>  	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
>  	bool batch_invalidate_tlb;
> +	u64 (*ppgtt_pte_encode)(u64 pte_pat, u8 pat_index);
> +	u64 (*ppgtt_pde_encode)(u64 pte_pat, u8 pat_index);
>  };
>  
>  /** struct xe_vma_op_map - VMA map operation */
> -- 
> 2.25.1
> 
