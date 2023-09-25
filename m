Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBA2CE79A4
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 22:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E924810E335;
	Mon, 25 Sep 2023 22:30:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29ED010E335
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 22:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695681020; x=1727217020;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ClasljKg+Y9SUzAsRKVilzl0OiKYNpHmCUqnoUvc65g=;
 b=YNf3qMWH8cvmh9/qQV356YAQOBkpdvndvwI4IrtXzqmF14cxTHpgifdF
 LNpCByPKJz47rODbPWvtwLiB2SQcvAdSFcSxDs7p57t7kk9e25Yhp40jt
 lKVHyJh0TYpHGuhHwsBdCMuHNjK3cXae2px3aljSdDRvOewT3YO2X/L4f
 RZ7rfO4D+CYrvcCN4ZMCUMC3T4nAguR4yAdStQSXc5rMv/Rimm1MHMZ2j
 9KXOtu9xjAcC0tJOBCxmUqt84tlX3Mu0ay31LyPjPHajlCT47nnRJHnhQ
 2Goq/ozsQj6O61/9luV0EdHNg5nE+aT6n1ri1WRtJCbsgO6rBqc72p23D w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378703448"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="378703448"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 15:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="742100448"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="742100448"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 15:30:12 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 15:30:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 15:30:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 15:30:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7o2AZiorD+Z6jQT6KMpyCyNomP7QJ/LQLk/hFMX4wzFD2Pql393BqhJd4CSAqcnirYBR9tIzP1FL4IQqn/cNwSvmw+LiJYHgCBprnDqoPgB2yjmivq5nZ/1EVWts35DRrtdTdK151ujM4MwTnKKtO56UDRCIQxqrcNBaU/hVbFNKUZzRGnotrxoJ3JBxTWoVQEWeAmHp4iA9mrj3My+OExn/3yYXjIJrvHCgy13HLkPNADUP9udF1Q/DJJotkm/LeSK2oq2PLq4URSq0iiw+au4lKc6MlNjVfnpelisDzUI/OICeP+HuMuCshpwhyO2z+VeQElafxlR1DPqYHer3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0f1sYhdYfC1TwG1++XZ9RV8yji8oO1c7af2iC/R5ELo=;
 b=eOPF/bsFWBcRJKGuettta1bNEqjjHoP9NHyAxmlXM6b9syKlA7CrxYiDwkvxwJJwAV9ZX5W8d/RpB70PjH46VLM5zys9PrNL5NI3zg6K917Ok6ufoPU8gLAekcLjPPdLHnqccXjzM86+dvdtrbleYaF7NbvfT+f8dKTNxM/ca4lJLizhMp04JiwUWeukq631R//j4nahAGaIeIEHt/YM0v7TuVLbH9Dq6+JQu3PfG7rQAT4jtMsG9jIMbfKFAe+Wym4jbuVl77l6M/PjQeKGEbVruXd34+/cI5wUGm7hFUpgrIQc4jFSB9JwgFeJU0l369lBFB3VdZ8y2kwpV1RG9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BL1PR11MB5270.namprd11.prod.outlook.com (2603:10b6:208:313::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.23; Mon, 25 Sep 2023 22:30:09 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Mon, 25 Sep 2023
 22:30:09 +0000
Date: Mon, 25 Sep 2023 15:30:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230925223006.GX2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
 <20230925221049.2681491-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230925221049.2681491-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0076.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::21) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BL1PR11MB5270:EE_
X-MS-Office365-Filtering-Correlation-Id: 6890b936-584f-4139-e9a8-08dbbe16f9be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JEU9ZPs3gTUmdN3dArQE3kOYi/UcM2tFb2gquli2D771wACSP7G/kEA/tvGJNI13Q6/SAT/9i0rG3pQFV0KfTJMXqvbASHvdCDKgzanP5387Pc13SOtHOmJuznYa2yZZd57db2PYbt1etK5s/CnyXoX/KjXda+xtAQx+TlvcwH4SXcGSsLvYItHEBVJWlSOQWrzgVmJUv6TaVhxzNHrcxkqZhwFUnqDaFOrb3M0f9chBQYtm2dXhdKqEk5vIqBNhj0tCWQXSSrQUwjWNJqeI67XeK+t5KhI5IYiEJ4C+F2EY/FzBFX+PZXzOcdgFUiTh8k7Juz/YgfiCiPRqJW0Wc9HaW03HOKU1otJvgJ7bK48VWZhvlUaJkbfKkwm9hh7Uzmt4khjnWSLXr0bwtQqNPW82zKjb1MMFoBpRU4/eo7qGhyMSHI5MOd7urfjt+jiDh8NeIv4nexLOY+yq+vSiWfXlTP6Cf4k5ayJyWhxjD2oCce1s2sYGYtswu4uMPyQs0HPykKPYx8B34+5JzQuPEzF+AkZvVd9rwIXdyGylClSPWLVo1UJ7y0i4afUZtURL5ItVfvY5Iff8MDFjRe7ZN8c0hqjC63qRdhDf6fahIc4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(39860400002)(366004)(376002)(230922051799003)(451199024)(1800799009)(186009)(83380400001)(66899024)(6486002)(6506007)(38100700002)(86362001)(82960400001)(6666004)(33656002)(1076003)(2906002)(26005)(107886003)(66476007)(4326008)(5660300002)(8676002)(6512007)(6862004)(478600001)(8936002)(41300700001)(66946007)(66556008)(6636002)(316002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w0uA2C3bKp2VN+IE11w0A1DHswWOGv5g8s0yJqc3fXlEEa/QYI3+WQmpb6yz?=
 =?us-ascii?Q?ZmtGATymA8bbfKS0zxc/ygckoX8dc1z02l54lSxu3qK8fhrpq+RsNtMTYaVd?=
 =?us-ascii?Q?iGET9pbGGTUja6CJ5H+gPAzCeXc2owwhV0oYZjW2IvDDSkOtLHwXyI95WAl7?=
 =?us-ascii?Q?OlJKuId981iQ7I9lnjXOF0wwR9pH90CdVK38tlbCPLF3ShpFCTt65hBnCzY0?=
 =?us-ascii?Q?SAIiT9J+nEwqHbCGTqpd2kSw5GHqVvP51FHpqWPj27UCSz8vgKQio6jusJiS?=
 =?us-ascii?Q?3Pzs6Q01Dbq8cNKfB4eQlvO/zxs93DlKY+Ke9jLGqul/1kEd9FCDiT3kgkSh?=
 =?us-ascii?Q?+4T9IHGzkkS70VjSyKUEmhryx5dzReWm4UJUAHV5iicnkhSPPJ0hB6yrugBY?=
 =?us-ascii?Q?x2H0CuawvfEWfKdj1O6h0/DDNQ8BsDHMo5nEmmbPlnfCCZsAxH5KcNfUCibS?=
 =?us-ascii?Q?x/V+13BlTOlY/Tesw4v2JVGtfiSoZrB4cGLk+UJNh/shi1OkdaFVsDY4EsRe?=
 =?us-ascii?Q?1TE1I4VrB0oNAzSyNcFo5MHF9xGJc7UUxoWBePRSqwOGpwCjODWkisNaUJeu?=
 =?us-ascii?Q?VuZgLfklnbaLA/OlPpwKE823p8urGfBwfesYiW6KNqOTp110DMDewOGK0gE2?=
 =?us-ascii?Q?CMo+9vsP3vMc0knWYlR0g3Mq386n8z3x2DRGyLuzXAf45sEe+G5W2SIeP7Om?=
 =?us-ascii?Q?N8KmsU0NEzGrs/vAB+t7rhTtj+dpOcpRcbqP0gC1w4eLd1e+B2RlP3fR9kx3?=
 =?us-ascii?Q?qVyXVOIGqEEpv502vAPm452SiD/dSZppcGAjwtYPuskT0xelixf0ruQQSme5?=
 =?us-ascii?Q?m56Z+bFj001Uu+X+yfmEa7I/DHvYsVAyxBNNvsDVdoCneLr+XZAoc2H8TUNk?=
 =?us-ascii?Q?QyXdfIWIifug1+D7qXmW9cyV10hJWWTNxmA5mgUylrM+8jWA/4igg/9hAbtU?=
 =?us-ascii?Q?8zf5mqEsPMJjRZ+P2jjsZxuLTyh4nAF1NtKD9OQYNHjYJKLuoCj23yfSBbSE?=
 =?us-ascii?Q?xVGehDhrbXp6t91YH4UIVsczzIufk5sq7r3nnrcVfego4rlzenpqnSDCViJx?=
 =?us-ascii?Q?prw4K2Ot9Jh5saDXaq4WTdxQSrNSrASJnPVcag5DGD+vPOx3Q6S7VfwVE4m1?=
 =?us-ascii?Q?u5IOH+ZIaG8yZaxxY4wNgtrCenFGy4EuaP33oO7NhZpTj+WthjiqiJR0kF9U?=
 =?us-ascii?Q?eJ4Dz/BQQLi9gydYAspmP3970r43xuqPzjGu6q5iCOHGEX4E7I7eX+2hm3sh?=
 =?us-ascii?Q?DEW/un95kM08TqkP+mAQcsAcedOFMGjMF0yh/gMY86ZNiIJtL2cjo0/pL4mF?=
 =?us-ascii?Q?ZaXf8wU9WDDHhSqHbvhcTaNLRmprPH4P6FKJnk+wYEWnvTVbC8sdpoGN/hDr?=
 =?us-ascii?Q?cpf9DNNjhDMGXzzrACNHJi89Q6V2YC1JQKsPCYHi9HuxmnJRgXoEQGerTNPo?=
 =?us-ascii?Q?cmFPGgzSaLQ5o21zN8y2xp9MPUXsV9hUsbVcIZphiRmyZOm/G6R0JFjsbbHe?=
 =?us-ascii?Q?L1fJLqSulnn2n3J0ku/VlB6b5Qra7jkiWWJOZFfQSysxKdYX/D/ttjx1diqB?=
 =?us-ascii?Q?xbKS97zbAFMScJOl0viLZtlx6fbfxCLGX+HIGMA97qAldoKUo+JaJ07xUSNT?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6890b936-584f-4139-e9a8-08dbbe16f9be
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 22:30:09.3335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpDD/KwjtRvhCZZKxPKNcP4Op0KU+/yyQJTH65/ZdxpQgrh5yf94/7egYnFL5vfN5PvaMx6psIXzC0PI+5X8ObYFG5X/1h01A0uJXSrMCEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5270
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/9] drm/xe: Normalize pte/pde encoding
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 03:10:41PM -0700, Lucas De Marchi wrote:
> Split functions that do only part of the pde/pte encoding and that can
> be called by the different places. This normalizes how pde/pte are
> encoded so they can be moved elsewhere in a subsequent change.
> 
> xe_pte_encode() was calling __pte_encode() with a NULL vma, which is the
> opposite of what xe_pt_stage_bind_entry() does. Stop passing a NULL vma
> and just split another function that deals with a vma rather than a bo.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 119 +++++++++++++++++++++----------------
>  1 file changed, 67 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index aec469842471..afadd399684c 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -47,91 +47,106 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
>  	return container_of(pt_dir->dir.entries[index], struct xe_pt, base);
>  }
>  
> -/**
> - * xe_pde_encode() - Encode a page-table directory entry pointing to
> - * another page-table.
> - * @bo: The page-table bo of the page-table to point to.
> - * @bo_offset: Offset in the page-table bo to point to.
> - * @level: The cache level indicating the caching of @bo.
> - *
> - * TODO: Rename.
> - *
> - * Return: An encoded page directory entry. No errors.
> - */
> -u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> -		  const enum xe_cache_level level)
> +static u64 pde_encode_cache(enum xe_cache_level cache)
>  {
> -	u64 pde;
> -
> -	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> -	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
> -
>  	/* FIXME: I don't think the PPAT handling is correct for MTL */
>  
> -	if (level != XE_CACHE_NONE)
> -		pde |= PPAT_CACHED_PDE;
> -	else
> -		pde |= PPAT_UNCACHED;
> +	if (cache != XE_CACHE_NONE)
> +		return PPAT_CACHED_PDE;
>  
> -	return pde;
> +	return PPAT_UNCACHED;
>  }
>  
> -static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
> -			struct xe_vma *vma, u32 pt_level)
> +static u64 pte_encode_cache(enum xe_cache_level cache)
>  {
> -	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> -
> -	if (unlikely(vma && xe_vma_read_only(vma)))
> -		pte &= ~XE_PAGE_RW;
> -
> -	if (unlikely(vma && xe_vma_is_null(vma)))
> -		pte |= XE_PTE_NULL;
> -
>  	/* FIXME: I don't think the PPAT handling is correct for MTL */
> -
>  	switch (cache) {
>  	case XE_CACHE_NONE:
> -		pte |= PPAT_UNCACHED;
> -		break;
> +		return PPAT_UNCACHED;
>  	case XE_CACHE_WT:
> -		pte |= PPAT_DISPLAY_ELLC;
> -		break;
> +		return PPAT_DISPLAY_ELLC;
>  	default:
> -		pte |= PPAT_CACHED;
> -		break;
> +		return PPAT_CACHED;
>  	}
> +}
> +
> +static u64 pte_encode_ps(u32 pt_level)
> +{
> +	/* XXX: Does hw support 1 GiB pages? */
> +	XE_WARN_ON(pt_level > 2);
>  
>  	if (pt_level == 1)
> -		pte |= XE_PDE_PS_2M;
> +		return XE_PDE_PS_2M;
>  	else if (pt_level == 2)
> -		pte |= XE_PDPE_PS_1G;
> +		return XE_PDPE_PS_1G;
>  
> -	/* XXX: Does hw support 1 GiB pages? */
> -	XE_WARN_ON(pt_level > 2);
> +	return 0;
> +}
>  
> -	return pte;
> +/**
> + * xe_pde_encode() - Encode a page-table directory entry pointing to
> + * another page-table.
> + * @bo: The page-table bo of the page-table to point to.
> + * @bo_offset: Offset in the page-table bo to point to.
> + * @cache: The cache level indicating the caching of @bo.
> + *
> + * TODO: Rename.
> + *
> + * Return: An encoded page directory entry. No errors.
> + */
> +u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> +		  const enum xe_cache_level cache)
> +{
> +	u64 pde;
> +
> +	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> +	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
> +	pde |= pde_encode_cache(cache);
> +
> +	return pde;
>  }
>  
>  /**
>   * xe_pte_encode() - Encode a page-table entry pointing to memory.
>   * @bo: The BO representing the memory to point to.
> - * @offset: The offset into @bo.
> + * @bo_offset: The offset into @bo.
>   * @cache: The cache level indicating
>   * @pt_level: The page-table level of the page-table into which the entry
>   * is to be inserted.
>   *
>   * Return: An encoded page-table entry. No errors.
>   */
> -u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
> +u64 xe_pte_encode(struct xe_bo *bo, u64 bo_offset, enum xe_cache_level cache,
>  		  u32 pt_level)
>  {
>  	u64 pte;
>  
> -	pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
> +	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> +	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> +	pte |= pte_encode_cache(cache);
> +	pte |= pte_encode_ps(pt_level);
> +
>  	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>  		pte |= XE_PPGTT_PTE_DM;
>  
> -	return __pte_encode(pte, cache, NULL, pt_level);
> +	return pte;
> +}
> +
> +/* Like xe_pte_encode(), but with a vma and a partially-encoded pte */
> +static u64 __vma_pte_encode(u64 pte, struct xe_vma *vma,
> +			    enum xe_cache_level cache, u32 pt_level)
> +{
> +	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> +	pte |= pte_encode_cache(cache);
> +	pte |= pte_encode_ps(pt_level);
> +
> +	if (unlikely(vma && xe_vma_read_only(vma)))

Do we need the non-NULL check part of this condition (ditto for the one
below)?  With your refactoring, the vma parameter passed to this
function should already be non-NULL, right?  In fact we've already
dereferenced it before the only callsite of this function...

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +		pte &= ~XE_PAGE_RW;
> +
> +	if (unlikely(vma && xe_vma_is_null(vma)))
> +		pte |= XE_PTE_NULL;
> +
> +	return pte;
>  }
>  
>  static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
> @@ -614,9 +629,9 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  
>  		XE_WARN_ON(xe_walk->va_curs_start != addr);
>  
> -		pte = __pte_encode(is_null ? 0 :
> -				   xe_res_dma(curs) + xe_walk->dma_offset,
> -				   xe_walk->cache, xe_walk->vma, level);
> +		pte = __vma_pte_encode(is_null ? 0 :
> +				       xe_res_dma(curs) + xe_walk->dma_offset,
> +				       xe_walk->vma, xe_walk->cache, level);
>  		pte |= xe_walk->default_pte;
>  
>  		/*
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
