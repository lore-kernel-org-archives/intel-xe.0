Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B09E7717D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 03:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8032210E059;
	Thu, 12 Dec 2024 03:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lleXQAXN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA6610E059
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 03:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733973191; x=1765509191;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CBBa9q2WUKiZFEiVCr0lrNfqg7HAg+3d2NgeotQnicw=;
 b=lleXQAXNOh4niolbU0iewn/Bbt4BrVhmDjCUs5ndbLVxxtJ/ENFLP2oD
 NwKInuRPY9XdawqSZ8nFVcpiB5Mh6C7lzmv1unAFPI92us48HH+Li/eQz
 0mjl5GRDRn57iuLeXAxlZJQFiIfwwddbSUACd1XArGS6WelOYiJ609G/o
 SPqolWEYMtKhVYx1QXa/fIoSkq/b/Er7FcenUjQ/GV6YWUG0t/YRae80O
 9fv9tGAkvoEB2+jEXD3OwofgNDoeiBNfDF8MmzmDOD9GFYOYKQ2YZGvWZ
 tye0zZQmjGsQvmYIEYWrbUYvCG/TJG12LNcfcfspH8RHkjUvYuiGYfQju w==;
X-CSE-ConnectionGUID: 5KMVdNEyT8GBFWUwX1VILg==
X-CSE-MsgGUID: b4m3zIs5R4mOYprlF8i2Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="45052507"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="45052507"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 19:13:08 -0800
X-CSE-ConnectionGUID: Kycnzgv+SweMYB+Op3FNvA==
X-CSE-MsgGUID: 2IST4A0xT32AQuk/tSxDnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="96288503"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 19:12:07 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 19:12:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 19:12:06 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 19:12:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIDeO7qbyPRAdcTQ7LEeIjZr2Itu2JeTP1f9043DDbdo46uUFaVA/s5YqSYM/TTmuNH9z5iujJXgf6Z/0S/3YizzZUf8L+xbMH27cgDqxr7hzaEFNC+r4dgWA0WmSn5RXQkLQaME9GpS4F0qAdo7lt/4dnEpE7CwQWaH8JDnIRQDnZ2WYqYc2f8DNHHzUjdCUxXJ9DQ/z9C+dMY61NYPzaXglIELspKLhRX217i5ZUvDgsQhkVcz1eLKQ28ewQ31eGiYQLy5vS9KKt0avLUEuuT38SaIeJpvWDJR6PJZndP/jrxL23HD8fBCfJkLMn6Tn/CGWckmjEmXhR8sxY8U/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sET/fLZNz0RjGkDkI37x90tbxmxveW8x6kLFUTyArGE=;
 b=jBnduQ1GWI0St/vg8LMYULYMBaDnPw2mN8HwhNtJf4++L+iFDHUH0GP/JPzZGN5H0QnpUGkJsQ7xq7QDGO0byawn4MUZqqbgJnsa+NnFj6HYCi9ADmg3e5UwTUFmr404FQcxg3dsi19GWbMmLezMwPOzCF45tRq0nQR4nFKd+d9shEtHeTy8Gt6I/HacpsywKyJ6qQB5aKOT9IS+7RkTbmhVQUXwT97a8niEualJlyisieYTd6fXqeOeX+HikWvUmRViStIXhmV1HUXh0fWlE3xbfi7ql5wdORzl6akt0/+gfE7vhmGlvaUgt7TlFek3sK1xsA/FDeCEkQuhpR/i8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH8PR11MB6660.namprd11.prod.outlook.com (2603:10b6:510:1c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Thu, 12 Dec
 2024 03:12:03 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 03:12:03 +0000
Date: Wed, 11 Dec 2024 19:12:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 07/13] drm/xe/sa: Allow making suballocations using
 custom gfp flags
Message-ID: <Z1pUrNxm0BDJ5jNS@lstrano-desk.jf.intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241212010141.389-8-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::18) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH8PR11MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f838ed-cc06-4228-64ca-08dd1a5ac020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T5VglPnWpwwxcVEMLsXu+4CDBx9A75i8ZUJGWt8TOsG07HbfQwGEhEHy1QFJ?=
 =?us-ascii?Q?WvYvlInBTvCm3YfK19e4hYY/ddYnwaTvRm6cV245bmjnUpC1N299JtqV6gPR?=
 =?us-ascii?Q?15HZAah8R0u3hiX1kf15N9zWXodVjJFkjYzLZXb7FJvFcuW1eHNgWNNbuhNp?=
 =?us-ascii?Q?tNIZamXqdZVTxhbatYP4s4BfDDWbSkLbVs0M62fyYw4JsyAwSHV4WIjHnBDG?=
 =?us-ascii?Q?OTi8N4mwsh1U+OBtwEx3QoC7K12XBCxEoBVIRVrSZCtSmWtrIO99u4WYaiC0?=
 =?us-ascii?Q?+pe+poNgAKLil6R1YZ3bfhbZYLyuTMtNTex3IclzHyD4CJFbegJuI53fa1tZ?=
 =?us-ascii?Q?6cLktHAPcXBxzQftyLWSvSiUGcXqx13WmtrMDySPhnWFlt5GF88UVLOdjVFk?=
 =?us-ascii?Q?JzjflpAPA9BITMjjpWuVRFv6ALtayVzptCbAvLPnLUg25D76gX1aavyCFZYn?=
 =?us-ascii?Q?yWoBzIjiRWIyE+fdb8llsqUkVsKwV/2p6zL9CYnpi6qON83lA/t2HcLPKXon?=
 =?us-ascii?Q?NJMRG1T4FM4y2aHCuFbXNc14A3PJkmbEst3WV0TIw6kcVzorKa38juBilxTp?=
 =?us-ascii?Q?SksRDQAqm2hYT88ZZHcAWWGTyWKULT2skSb8bdUm+JszkBjKxaXUV1M9kInB?=
 =?us-ascii?Q?NbGSg/7xX3kdIuGeoJJXrclfi7RLuRpaazfngwx4rtf56hCwROcvfNDAnej8?=
 =?us-ascii?Q?q5Yi9kaTfaMtHiTL+Iz5kDEprdAj955lj7q58IGsTo7h5RGU7PWPbK4jsybE?=
 =?us-ascii?Q?TKcpOQKVISHntkUjbmiFd6NTtr1SVElJbrAkd4nJg/HGI+w13abe+53sokYm?=
 =?us-ascii?Q?7tiOvB9t/EkhyBPRAJDZfqKPkd5jGR+q9FHGRSPlgxyKz4EtxeUJm8IjzUAS?=
 =?us-ascii?Q?hXs/YRbSeEFCd0HSVI9ZtmILavEkJd6ucgO3qnkDkpZeHXU67PrA3Vgfusy8?=
 =?us-ascii?Q?fRnFbQNtURN0b+geN/hXzDSP5IDr06heMYqWenuPTwA7xFl6rZCJismpCDrl?=
 =?us-ascii?Q?0KKr7VwQMBILFBG30A6dIK9jwkS4ewBn82Gvx8Pc7sAD5sqtYXRqGkXaLx8Q?=
 =?us-ascii?Q?0rxJWmxRVgHL3nsj+9KMdyrBQfaEa0ISeCp+w2lIEt0/kcQsEqWDGJbKzkwU?=
 =?us-ascii?Q?1NC/chXYrsx+G9/q3EdSlj29+9EvdUa1G/RWkHcxApc649DRHDBVK6cGstge?=
 =?us-ascii?Q?atD8xbBRRhfbHViSGJKPrTIXh/nL3QwHuoPfixQw2ANFOlY2Fx8Pr98dvFbH?=
 =?us-ascii?Q?/B9UmQvc8hF6OYIDaN6C055/IoRzQuTWD4fRX7FMeXby++N+YXGv7GPUjLL5?=
 =?us-ascii?Q?e2z0cUE4V+0eIrtm0EH379tVKK6NnQiSw17g8xELrGb1nQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w9Y8lMsQrAAAFucqKmAIuGOJMJbV+0oKecwhFI58CKfFI/MXL9+DcEXWWKqs?=
 =?us-ascii?Q?3v6myMH+CdLXjY67TR93csaZhelPqN5eJbyLsVgo+L/8OZb/hyKlaaesyLTU?=
 =?us-ascii?Q?sbtCcKTMZNsQEaeVcpFWiOhnKIPd17T3tBwgf1yhdAY5ALReLVpkeNHrmhGQ?=
 =?us-ascii?Q?kVbP8prMYSBm+WLOcHAV3GZ61xWHQnRw+Bvz3ht2MXQNnvGqF621VEJZE9Np?=
 =?us-ascii?Q?c9wEQe1vZP1m/Vdvfqx/CGXg2FP/+QAIKEgBjfjshIzHr8o0mWio5xUUQTtM?=
 =?us-ascii?Q?WDo4frvbsR1HCAN/hJ6Jzu8pze/aJOlbOjpdugB4m+2cNlvftIDgjhrW0cb+?=
 =?us-ascii?Q?pGA5a5PjqnFcATl1mJklJFUNo6GpHHqHraUPJh288g5VIzLVmf5uprLvfa+/?=
 =?us-ascii?Q?fzYU3ZeOgX4Q8EyVHFRV1ntbvlNFqMTQjqaxxrcmqilKy8Q+PbPs8gMr1194?=
 =?us-ascii?Q?qn3HXJd+r1/c5FA5Ku1oU4eGrFVgwEVh8RE2u8skwanHNqtlHxUg6nZPDV7p?=
 =?us-ascii?Q?oO/nmthby1JEpMdev7+6VgmeljJAAsdmbwv/o41w02iIX6E71KOMLtN1tbWX?=
 =?us-ascii?Q?3Himu+BzIVXEspBb7ySLBi1VXDvG7YaQ6a+ETzGBA+8rUPEsnpPhIB6gRLzb?=
 =?us-ascii?Q?REKM8W/HV8mIlGrlpPZeRyPSNdrxa56OMPvy4yFHW/qs9vcAzcwGzUk3UgII?=
 =?us-ascii?Q?hV5sfswTM4uj+riYA5LblSewcz63qjsYGpLL5x6OF/IpAgJ0xnWh2Ep0qDvM?=
 =?us-ascii?Q?uNy3/ZiCrTgznQLdSBh700UMBzZkNQLbrXZJ+6lcg2wDLyNVbhxRxGz7y5Lx?=
 =?us-ascii?Q?UvyioogHAjkVrGYuZ97q1fdWjQqPmDRKv5NGLKjvuK58cWKMeAxJussbd1gk?=
 =?us-ascii?Q?zR9mceESY3rugZ6oCKh3FODWcemWru+UZbbxWnKk+TSr10GplwxRk3Knj0No?=
 =?us-ascii?Q?uGjtEb26fP6PYpKCUp17+6VL3hv8oaKJibitxmiJTYmXhl8VZa4NMDgByA5a?=
 =?us-ascii?Q?z2BTtKyXu8NzItP5MltyiYA4wYbt+XPaKhjC0vposSVEO9nZyWbe8WWLvf65?=
 =?us-ascii?Q?4x7TOWBSiCcRk4Y38dHu8D3H/L+v2+csvv6vYXBNgDjy84usxXFIdNxs5IYU?=
 =?us-ascii?Q?guOdQLtXjlMCYB2kbZaF604P1fIesTg58C1znRC5fgyhZTxDEu1ePQF7yfNV?=
 =?us-ascii?Q?FQsad+o19yjRg25H6S65a1Dj0rey3/uCNOoo08zhbFZzGgfEhPkl5fXcw2f+?=
 =?us-ascii?Q?uCDHTHjOobKVToh7c54Zv3ccizj0AKHGj7Sq/LJHn2PcZ6Yr9+xXL4dB+LcZ?=
 =?us-ascii?Q?FOp+V3WKvHY9tJlIya0aJanZLduTmHLDe3OwD9UysmqiAwN4icaHLIZN0u5h?=
 =?us-ascii?Q?+zxhM1CHzN/qhqX3MMU3xov5X62ad6xvKEe1dUeyV10m1gFL0PJ/vyAbgTGD?=
 =?us-ascii?Q?MfcOkV8HHHVgz7OFwHs6j3MdK3ExhM3uB2GYlP2VNla36gcsXZ4U8YPfK1Hi?=
 =?us-ascii?Q?jKDkTrJo353Oi88v4nAbN5g4V94hkhRSKRFso19gjC4r8QL3JWEs1bXgDbEr?=
 =?us-ascii?Q?3bnCezrvtR/1jL1TkhwBi2jpNKbQSXI8w1XrNsNRDybeUNzoOyt4wvtt4JuX?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f838ed-cc06-4228-64ca-08dd1a5ac020
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 03:12:03.0828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q26i41NMzh3k98f0IdtUvxPeAI83bSsX+lABc9NpnBpVYj5z8XYS3bXsvQaZXFR/AmRbEFPMAzyVWGTvyVoTDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6660
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

On Thu, Dec 12, 2024 at 02:01:35AM +0100, Michal Wajdeczko wrote:
> Actual xe_sa_manager implementation uses hardcoded GFP_KERNEL flag
> during creation of suballocations but in upcoming patch we want to
> reuse the xe_sa_manager in places where GFP_KERNEL is not allowed.
> Add another variant of the xe_sa_bo_new() function that accepts
> arbitrary gfp flags.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sa.c | 15 ++++++++++++---
>  drivers/gpu/drm/xe/xe_sa.h | 10 ++++++++--
>  2 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index 704332ef795f..d92d9836fa91 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -78,8 +78,17 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
>  	return sa_manager;
>  }
>  
> -struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
> -				  unsigned int size)
> +/**
> + * __xe_sa_bo_new() - Make a suballocation but use custom gfp flags.
> + * @sa_manager: the &xe_sa_manager
> + * @size: number of bytes we want to suballocate
> + * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL.
> + *
> + * Try to make a suballocation of size @size.
> + *
> + * Return: a &drm_suballoc, or an ERR_PTR.
> + */
> +struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp)
>  {
>  	/*
>  	 * BB to large, return -ENOBUFS indicating user should split
> @@ -88,7 +97,7 @@ struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
>  	if (size > sa_manager->base.size)
>  		return ERR_PTR(-ENOBUFS);
>  
> -	return drm_suballoc_new(&sa_manager->base, size, GFP_KERNEL, true, 0);
> +	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
>  }
>  
>  void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index 4e96483057d7..bf55d8c3b5eb 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -5,6 +5,7 @@
>  #ifndef _XE_SA_H_
>  #define _XE_SA_H_
>  
> +#include <linux/types.h>
>  #include "xe_sa_types.h"
>  
>  struct dma_fence;
> @@ -13,8 +14,13 @@ struct xe_tile;
>  
>  struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align);
>  
> -struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
> -				  u32 size);
> +struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp);
> +
> +static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size)

Nit: Kernel doc here.

With kernel doc:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +{
> +	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
> +}
> +
>  void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
>  void xe_sa_bo_free(struct drm_suballoc *sa_bo,
>  		   struct dma_fence *fence);
> -- 
> 2.47.1
> 
