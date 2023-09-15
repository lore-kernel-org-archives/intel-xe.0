Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE96BCD37AD
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 22:19:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676F910E6A3;
	Fri, 15 Sep 2023 22:19:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9224810E6A3
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 22:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694816369; x=1726352369;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3jN5vKsh7QR4ObFcX42hJ9zU7Un7wWnmYGP2oE4KW2c=;
 b=WhiIODnN/mZk2kmrze3BFl+HUgcWO2m0tA83UnsDPi6E1W9Et7EsxTeS
 Cc8qelnsqD5afotv7gD1hADbCPulL5OAWC0BhMW8dH312kHqEJKhz3XO5
 EgT7Zf7Iage9IIRT1GhC/xcwh1/ZsR5bof4f3VdFJdR/dP+k0t2QklAjO
 6/z+s2mOfZ/dR5fsfinkU5rk6W/b94j8vSsgMN1e/f2jsWtKOo0/wLob1
 BXWvz+aNsB3/GXC5Q5rYD5B0waFNYRyzuqHvgsJSboOQ3/DIClRafKRXg
 Gxj1yg0uas7x+mXQmXiB0UX4Fk8OiRT5EJXAsEmVfWvjibmmvgLEbKpY9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="376684752"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="376684752"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 15:19:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="992017115"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="992017115"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Sep 2023 15:19:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 15:19:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 15 Sep 2023 15:19:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 15 Sep 2023 15:19:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnleLTEQUc93YWOl0OdC/xVnTNfLuzFYFHV9xqMPG7uS/rPm1ko0ThvuFeyAbWYHTvmb3TCq7+EHaIiTApVnxo1nOr0iVgJR8YqdzYAu0u5Tm6tL8kLDw+JtHPYDHXvuuYgIaevJRjTqnKfXMWzUFtNNMFoc3el9JD7ywuJYBC3WZEx7bXrn62uROW8P/HKsCgASAHQQt6ONOGIC7vHq5lRJAnnd49Xfwno7C26gW1NIL9eIJp9tjG/RffQDdNMhYWgHHfJ3TVritUuEbfD+7Dbq2l718yiiplViI8tCOJeJ5CJ3VN+yMu6HnG3leygDACUhYJcuKk3/jlOxsJi7rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1WeLKj6KfUhaA8Uwh7dzsJD7VGtPJ8a2UbYjJPDGmk=;
 b=jKUeMHjI/wVDwBeSttDhrC31Z6I4JskZV2kqyNeW7SqBlLREx//FSfsbvl7ZnRRl4qPTIh8tCKka9qNEYWde3hMZisyJxNifeCfaFlhTP3n1hFesc/sl2G8kz9ef0xvIJw4hwUW3zJEdC4RB0vCV+95BaGDeYoxO83aKz2GlcA6KHL6gppO0Vg0C4r0R/5ragZFJGekv0cEbCayjPvxu+qVR4tRp+EYZGvlmSfFyoUxZEEVResC1wDbsA2QFH3nV2Ka63N1DKfff1opwy+9JbzdVy8YRZ2h8ADidAb/qWmxeKl3K371By377V2RNkirezEnRKpTCxXC5NzvZ185zPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB8253.namprd11.prod.outlook.com (2603:10b6:806:250::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Fri, 15 Sep
 2023 22:19:25 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Fri, 15 Sep 2023
 22:19:25 +0000
Date: Fri, 15 Sep 2023 15:19:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230915221921.GJ2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230914153112.455547-8-matthew.auld@intel.com>
 <20230914153112.455547-13-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230914153112.455547-13-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR13CA0194.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::19) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: 455ce79d-9f36-42ca-c528-08dbb639d19e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N4Bf4EoR8PGCoshpSOLVohSMbZWtRsrU3/+k1ITHwVAGioZ7I2rfkMBP1jBpnAjRhYbxzqtSUh1qO2OInpe5J4Ug54QAdc4UUKBzCyfQay+oleLw6qR7INW0u7wdthjfnJ/ET1Z9MQhlUVyScY9gWo/sQBE5i8iRy6RDraFOXlucCo9tAaS4H3m/rJVE8tKZ7fmdqR44A4gkKULKymKWwBEYKF1/LJ1N6tn47hxRlEZPdA77JnL1DvhdNuyZ0dKo1odkFKTHSnB/3JEXq1zyO+4AKhRc+tcrhvRhpju76SCjwgAzxArD/CrZXtft+73oiF5Ao1l9XuE13LVpmEjugIFyNm6JpXCZpkV1RpqL/spdZcWMyv1wxRWGhl58m8wQaYGWE4wefbS0SYVDbL5DXwrZakSwShePvPJw3wYYVez/yIKp2360DUMaVH5RgC5M1ZjNWtseN6inBoD2028lUt5lkZiWiZ99EvKp7Et4IKXdGiohD+yhOxRBln72uQds1kEMzvOV8tf7UHQ2gPG51UPGefXw7WaA3eJwZ1M9czJDi9r7CJ3b45IKUkTri/Y4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199024)(1800799009)(186009)(38100700002)(2906002)(26005)(107886003)(6506007)(1076003)(6486002)(478600001)(6666004)(86362001)(33656002)(83380400001)(6512007)(82960400001)(41300700001)(5660300002)(316002)(8676002)(4326008)(6862004)(8936002)(66476007)(6636002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZQ2/PhfiUikomB7iptRKLze0VG2jFR00aE5mA4PTZ/Y+Jf05a0svyUzLhSow?=
 =?us-ascii?Q?IUsPYSNS9S6gzMWap7HIu/q5ap6R9MAgRG5WB0AlBaS3agpwAxCuTOZX20Ri?=
 =?us-ascii?Q?czSRZRwW80DDy3OjvMdZgFssEJZADo1nLX98wbcRARzCp14MOFK9rEiqrnSI?=
 =?us-ascii?Q?gOQyiCAJylkP3fWCW3+h5LMBYOSOlEUcLRNvewNo5Xnak4jOgDJl02RsmOpt?=
 =?us-ascii?Q?qTp0/53geNPzrmesHj8kV6ZLc8yKOr76cg39/9WgvtUbpxSNu3XTTKf078LI?=
 =?us-ascii?Q?ZF0kZ3cnijJuZyy0+RtWZfPS7dk3OOGKZisLeOFC3quRCPE4gB9suQ/tKFQO?=
 =?us-ascii?Q?dLxGgR/wzO1onocDoWKlCJMlfB4yJRpAqZF6mKQ85cF8U5MbwoG5Vj9mkFNt?=
 =?us-ascii?Q?K6LvuFQBvU90LGl67Ux4bvKsIr/b9nxAKINO8Re3VLn3Kg+n8fYT8tCNXpm7?=
 =?us-ascii?Q?OQlpMbnFSRFGuKsReu5faqSmaHqThq0yJdRKB4R0wqSoYPWT9mgWUcxUHqHO?=
 =?us-ascii?Q?GsMhZ4mjmxCk06N2JEB9XREO+jT7esJCqv80N7vK0R3QrpY3FzDTMXoatvni?=
 =?us-ascii?Q?poA1XNu/rolUu0LBbUhdtBD+2Ifd0z6bchq4e+XzQ1RaUDEjfk8INkogS31S?=
 =?us-ascii?Q?D5zZT5LJtLiFRU4YteKqkmYo92NK5ldkskRa9o1Uc3L23n8VWzrYJ32Kll50?=
 =?us-ascii?Q?mtVuCJdYMDXnXJRGMd5Rz2RdMRKhWnTPCyPdC4sVw+Pi6FYAbHHY7ZtZxdX8?=
 =?us-ascii?Q?OYlDNyY3whWFUIFPxvsqfFjtUm8boQD9Tgfa3xPG/R4NAoJ0jWgFW25tvjgj?=
 =?us-ascii?Q?rE7bcc74OKNaBxXiME+tVRbbTd2co6F/QjFqbvrV7zhdIA9UcsrIzuTOp6Ws?=
 =?us-ascii?Q?gPyzU6ZuUPgEYUM6PRkNsBP5EcF90JsZDxhXzy8zJE3kyt2/cMsmosYwAil7?=
 =?us-ascii?Q?ZbzUG46GRHZtdkUdOJtnfhzMkNHhH+McQwKGrdX74mR5MQ6LeYpnaGeFXUq/?=
 =?us-ascii?Q?MRUKQ3OD5ctVtqA8UVf/9/wa2gpFWYhksUCXVOR8JHzLZqxzhevA9tV0MZVc?=
 =?us-ascii?Q?WjQDAdBJwM0A6UscTCXN/qko9jNDe8eBvNdMEC2abqc+t6K9A0vYpUlgS5o9?=
 =?us-ascii?Q?GPT0EHJ7xT4LDJMGXTcMFWfSFWv+WEpFXS7Algw/XzXOytykBSRRYm6Fv+8H?=
 =?us-ascii?Q?Q4QU0YWt7kjGSfM8I1YIvVTvu9E4vvaLRcdhuiQVfxPFVYRTchkWNPqdMYHz?=
 =?us-ascii?Q?osnn6QZEXlQmImRuNlEKgoFix+xW4AJ/E/WAtc/McfbxvvdPWazPmkTlvxN0?=
 =?us-ascii?Q?/8C5bIh5EzcCgHY0MikHmZk2E+57N/z+txuJ5NpfGNLbQJtAesSxKaP6tJFE?=
 =?us-ascii?Q?xlOrzyLgGR4S0pLKf5wd29DlfyKOzpoCdX5GRC7RO9UdGzOUw+JOm4QSylO/?=
 =?us-ascii?Q?35o6DE1UUm0j/nmlxtTxHA0DI3J0VcY4cakpA7KYpu2jyYvKdMyw5Hsf2gvl?=
 =?us-ascii?Q?ciGgncLz1WG4rqIPBxO+FGzcKHEIFecsS7Cab0pCX/25IHAf9kM4qN5IbCWA?=
 =?us-ascii?Q?sGMX2Yz7hwWJCCua183tS2k9gTpIaUW6Z4ltq/Xp8fwQhGfc4HtY2/qqnvGj?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 455ce79d-9f36-42ca-c528-08dbb639d19e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 22:19:25.0872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BMxtsSQdilPh3miGoylYERuggIEmiq9AJhaNh2V/WfSfElk9KyuDa/pKUnyAs3QV6lxmwj2WcMgljfPZaO7ugEl3diksjwHStA7J6/F4wdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8253
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 5/6] drm/xe/migrate: rather use pte_encode
 helpers
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 04:31:18PM +0100, Matthew Auld wrote:
> We need to avoid using stuff like PPAT_CACHED directly, which is no
> longer going to work on newer platforms. At some point we can just
> directly use the pat_index, but for now just use XE_CACHE_WB.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c |  7 ++++---
>  drivers/gpu/drm/xe/xe_pt.c      | 12 ++++++------
>  drivers/gpu/drm/xe/xe_pt.h      |  2 ++
>  3 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 46f88f3a8c58..26cbc9107501 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -257,8 +257,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  
>  		level = 2;
>  		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
> -		flags = XE_PAGE_RW | XE_PAGE_PRESENT | PPAT_CACHED |
> -			XE_PPGTT_PTE_DM | XE_PDPE_PS_1G;
> +
> +		flags = XE_PPGTT_PTE_DM;
> +		flags = __xe_pte_encode(flags, XE_CACHE_WB, vm, NULL, 2);

Might be best to pass 'level' as the final parameter since we already
have it sitting around as a local variable?

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  
>  		/*
>  		 * Use 1GB pages, it shouldn't matter the physical amount of
> @@ -493,7 +494,7 @@ static void emit_pte(struct xe_migrate *m,
>  				addr += vram_region_gpu_offset(bo->ttm.resource);
>  				addr |= XE_PPGTT_PTE_DM;
>  			}
> -			addr |= PPAT_CACHED | XE_PAGE_PRESENT | XE_PAGE_RW;
> +			addr = __xe_pte_encode(addr, XE_CACHE_WB, m->q->vm, NULL, 0);
>  			bb->cs[bb->len++] = lower_32_bits(addr);
>  			bb->cs[bb->len++] = upper_32_bits(addr);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index b0874052f5ce..a1b164cf8bce 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -67,8 +67,8 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset)
>  	return pde;
>  }
>  
> -static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
> -			struct xe_vm *vm, struct xe_vma *vma, u32 pt_level)
> +u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
> +		    struct xe_vm *vm, struct xe_vma *vma, u32 pt_level)
>  {
>  	struct xe_device *xe = vm->xe;
>  
> @@ -112,7 +112,7 @@ u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, enum xe_cache_
>  	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>  		pte |= XE_PPGTT_PTE_DM;
>  
> -	return __pte_encode(pte, cache, vm, NULL, pt_level);
> +	return __xe_pte_encode(pte, cache, vm, NULL, pt_level);
>  }
>  
>  static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
> @@ -592,9 +592,9 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  
>  		XE_WARN_ON(xe_walk->va_curs_start != addr);
>  
> -		pte = __pte_encode(is_null ? 0 :
> -				   xe_res_dma(curs) + xe_walk->dma_offset,
> -				   xe_walk->cache, xe_walk->vm, xe_walk->vma, level);
> +		pte = __xe_pte_encode(is_null ? 0 :
> +				      xe_res_dma(curs) + xe_walk->dma_offset,
> +				      xe_walk->cache, xe_walk->vm, xe_walk->vma, level);
>  		pte |= xe_walk->default_pte;
>  
>  		/*
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index 4a9143bc6628..0e66436d707d 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -49,5 +49,7 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset);
>  
>  u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
>  		  u32 pt_level);
> +u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
> +		    struct xe_vm *vm, struct xe_vma *vma, u32 pt_level);
>  
>  #endif
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
