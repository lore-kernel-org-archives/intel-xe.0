Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AC6C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 22:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEAA410E754;
	Wed, 14 May 2025 22:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mW9425ql";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A1710E047
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 22:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747261830; x=1778797830;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a6eIcSrjWK62FYNLwkiuu3uOP91l/Bm++JnF6ymdwGU=;
 b=mW9425ql7y59wjGO4wZbuEpADfbgrW4iD88oUjxbQ8Do56aEoK+mffz8
 c/l+oWBTqSMrKm/BIdm0Hu50jeG0Pj+DBmuJiMCSeAEmmfNNVFB8CjMDx
 L/J/cqsgRYSq+DJgZnEJNHKfpymAJD+xk/2SV7xlbElRAaOvB5TAFfz9t
 fU8/N5WWiMeuWD69J5iaz7bOHr/KmGujQdc0A7+khpD7SJtJLFPTWM+ye
 XV5f0owCq6NRSFCGFW9uN2WbR0+DSuDNsIiI89joABf+klcIxC5Xqb73f
 Mq5vr4YHwnEhxt+hH9D+z7sDCJq4NhZTE7hi6C3ZKLc/6W59m+FTprdw2 g==;
X-CSE-ConnectionGUID: vnUioJ0GQju4o8w/8qbhuQ==
X-CSE-MsgGUID: QmhExnpURyazZU8H7GgDSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48294097"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="48294097"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:30:27 -0700
X-CSE-ConnectionGUID: uPFqyxqHR9C8hMHNgVhNIw==
X-CSE-MsgGUID: 5i5uLHJgR4W76vtln1zk2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138592458"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:30:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 15:30:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 15:30:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 15:30:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKntrcjfgWl1xfxaA7PrGZ4CtJ38r5cnNchLjPz8NJVXwMhJGVrWzDB7oeoNEKoJsDXY3ozk7w3KYuxdQ40gf+Nn1nfbdVYzDguQ7xu/kySUQMqrvz3mcf8fdY6IrO9ZNxgovmJoT87SPqW0jGqSOroMCQgmcmoGxzwUIDh5GdfHRrLJrOV4Kz5HaLJRmizA4CoMB5HA8EZ3BDJulnwifrh85RDVLEa85wpfJyVKzZfNYrXprIzcIDJpeCf/5kE0wQAl/x07R/EpEm0aK4HX6ScsBbr+x6byNu90Ncfg9ZZKRx74VJ41j7lPMGkjQi6ybL+4mZz1Jen6x14zR7o/UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMSwpZPnGd7l5rp6avxl67GGUrrAgpZLywvB3Scfodg=;
 b=AXoUVMpzz1Iz1XC5u7OF/RR7Eq+axfj668xOcerTLvbPjXrTsEyEYy602yV1hOjWNVu43MLVM9cxNmNFHN79qkJmDoztRTNwaQrxaC7qeMZxnSJkyot0kWf7IQ9oJ2SYGe1g2pT64Mzj5VdTwScHpXe+vCgjVF2vM0eoCpnm2zMu/KDZU/ywaStGqthhhwGX0C8ab6dWMZTho6Mz8YUo+qi90Vqd4C5pJRuKTbd/8/dF1gW8bH/gDVfCApJekfIssI7eqrE+x68fqWNXpqkjVMp/6fhZB6sttGIyVx+T3LbMcUNo33EZD3/yxw1u3aR/Aovun9joXTUPDNecBoc/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6842.namprd11.prod.outlook.com (2603:10b6:930:61::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 14 May
 2025 22:29:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 22:29:39 +0000
Date: Wed, 14 May 2025 15:31:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 32/32] drm/xe/bo: Update atomic_access attribute on
 madvise
Message-ID: <aCUZqoiJ/5o8b3bN@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-33-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-33-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4P223CA0028.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d96b5a0-8872-4e67-42ae-08dd9336d057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nPtCoHOqy8ozj0XlPPhGFSP28DaFui2nZuyxO+a4Ah1t5kzaQy6wDCSCLBLr?=
 =?us-ascii?Q?iYAWCkR6FULsDS4z5vpAA2yiRAsN+I7i004/6sX54PuXVfxVPEm9ck1s9GO6?=
 =?us-ascii?Q?zBQbohapINDIGfDvyd0XTG2Vr8oPnofdrE1JsnN/bgRJJ3Qm2ZM5OMNQ4TEb?=
 =?us-ascii?Q?hQol6YVK1cz4BlbCyqpjYEZEwPCSsDEt13Wkoi44G90JmacHT1FPGTc5z3hm?=
 =?us-ascii?Q?ToSHDXhLURvsghzwGNpC3ee1WMIGsPB3HGuVQKnST2iGQ5yJWnGkr/d6G9NU?=
 =?us-ascii?Q?FHFQh9RLk/i5l9c39pbCV55dNAbUSTbA6Tg0vphiPpNAhzUKBnQJIZEf4+dX?=
 =?us-ascii?Q?4ioxbJOGTj5sT+iaYrkieHc+yItvO4+4i/bd6tjP+c54UQPY3QpBK++WnyFB?=
 =?us-ascii?Q?5y8UwHA+OzUv4juf9o1K1kUTu7qAJzGUlf1AsKAUUvg+JOlOf2ioVIcGlN5R?=
 =?us-ascii?Q?j1ygsjuCRGsVynv1TH0CqXlkgpOdF9Tq0QL1Y12KplDom5eUcYXNcwsi7/OW?=
 =?us-ascii?Q?lLGFqRaOsTtngBCu831CTDZhwMZxSLneCzZe1Z5NqYgqFpVSKHjFzbtZOhQ6?=
 =?us-ascii?Q?QvLK6+qyt7V87NdoXtjwO9QSje9rpfPXpKiV1UqOvlS1Ey5K0RK2oYIB+o9/?=
 =?us-ascii?Q?11oEguJvOdnWi3JtozKXKoL7jtW6DyOQJOyM27hiOjlza7GSUa74C2zuonWl?=
 =?us-ascii?Q?Q9ZuIG03pLWyw3EhmnHe0WjAB43pcCmAKAhvvGBG5abhK0THa7+zFxVxaFwu?=
 =?us-ascii?Q?XdLEIpyOHEWOjMJEkUm8UUN2ohjg0L1kKejkbz1W+8BVMlSWsaGt6C3QKpRm?=
 =?us-ascii?Q?ffErWlAs0VQmMyI32GV9VjxruHrdOE/I/Gqny1lFdxVxA/zBNhFYZRGG2KtV?=
 =?us-ascii?Q?380DbzqnT9UUaz1B+7ok950WoX/GpDdX6xdC7CRc1UHgSHYDcHe0O3ml8VdQ?=
 =?us-ascii?Q?grVwKhKggLFaRH2hQD4liRVGzbL2rkSeVAydkg5JdH+wQymG/CvKqM4qChkL?=
 =?us-ascii?Q?VaC1voDz89BXIwlt6AtgCm4EdjDr9fK3X7oFjQRsSTU8uDeN1j+UleK4E5YH?=
 =?us-ascii?Q?FsOq6Jfns1GhSaMqKEkHlcY5E0BAihEpVF92lmDj+eKorXEr3luK5N2xe9Lb?=
 =?us-ascii?Q?PGkJWzVavR+2hLKSrR/CrrWruP4WmzCuWg9ZUbzSwLgXodgbHaeEbQipYGSF?=
 =?us-ascii?Q?Ir6RIyIb/8Lu7v8z8fAkvke2VSWWTvsdFJlfT3ZFoNi1vZTOdE3n8DRapvWM?=
 =?us-ascii?Q?usiMmZkAE2k20EvqKONexe2wVC/2QK2F/dM3jnTgiCmXFXYe0JGY0eGBIKLq?=
 =?us-ascii?Q?CYyBsounTlWmRDb4pUoDl3t0jENnpe9jeqBDIIiwkE+PZFYG28NiUYE14bX7?=
 =?us-ascii?Q?cTD16rw/vHO3LXUfuhjc50gzUGEdJUykhZGBovdx1NVCEq4Jn3FOMEeT/G0u?=
 =?us-ascii?Q?qiUbzjn9LEo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ctRpBgMShxI12PCup8hFu7ZnZMbp/9UnowC7bsz8YfYw+HLAcXprj+3RRd2U?=
 =?us-ascii?Q?TF4J7o3AAXwFtUYtIrFtIuLCrQzWtXpWzR9bTPAMGaTxn/sErp4cb0IW5QZ4?=
 =?us-ascii?Q?e6IS6teYBbMoYCBCdPbyQR6C/wE6RjcsBB1DhVg8gqB1y8nDbGl0cp8XY9EF?=
 =?us-ascii?Q?OOEw+VzBNZhyHXBMrgfhvStfNWDRXEnCKrBL/3j3faGo7eB224MkpCeECqsG?=
 =?us-ascii?Q?jbnfbKkw4qNFbjzPAq9DK7tE7VMoba+AbmIUO2V+vLsdjPaFXiMvCar/8f4C?=
 =?us-ascii?Q?0zsIQSlq5HcU+szwXJYX4K8FH097OfA5y3Phsa94dBPn1vwiZyS4oZJ7Urwx?=
 =?us-ascii?Q?eQSndGbGVnjppqPqeDL8J61il96oAHJP2q83ttjkvSy18/o9xd/PO7C//WCD?=
 =?us-ascii?Q?Gbi1kEoGuCWGSX6DMrkhl8AN5YcZ/IsGFCo3bn2SNu9xGaRyx1BtIXW3WOrw?=
 =?us-ascii?Q?oaPCq1SjCnKbHYnCWL9e3axeFVqOxt57gOtoSZUud4o52mRCQ4nPP5SbjXth?=
 =?us-ascii?Q?vLCBCLuzdvLHae33dJ6K/ObcvHjthNOgup1BaIbnSyFfpv/JCvxpJgTCSIk1?=
 =?us-ascii?Q?oF9ouBNxBsWszZOET6C/QIymmgXoiA2eYuvpewsGZvuZzfcHzoJRB2LUYkwT?=
 =?us-ascii?Q?0UjUC6SyC2zVcZXX6YgOv04BE/kpi4nDmHytCEC7K7MwgqPAw7+NmP7Yvur4?=
 =?us-ascii?Q?cZVG+JohRvn51zJZCHT6fksOSQwIvkwZowBMFbsxO4ohm4nVLvl8CdPTmXwh?=
 =?us-ascii?Q?NK0iZuWQxQri6+MnTFqgrMj6MwLkwn4XtqzeUmpVbtPYriebmt6x26KlQSYI?=
 =?us-ascii?Q?+lMFkVggZAYXzRZAnjjtachz+YdzeO7UMVXGF/v8TtXRTUimFH9lGzz14Qb9?=
 =?us-ascii?Q?3316op5HTWdKnk98OcyKf7BePNNdFYkuqtH8NPuk609h3wHTkeBV16AkZqb8?=
 =?us-ascii?Q?lD62WoqwojSgT1Btqw5iiujdpaP/CCEFr9P/Mt3GKY9E6bTVZ6j13wVbz2un?=
 =?us-ascii?Q?wdwkW1AGqgHLB2B5v0/yPOyuwoxYyp/0G9RCK7Zak3T9urrOh3P/SzG6bSod?=
 =?us-ascii?Q?8t3ale+G9MrXB4LsPziW004RBa69pm4O1PKxiQq/q130VooNXCzcZTq+1mGV?=
 =?us-ascii?Q?OcBmMD7fRDma973kTx83BCSBV8mjAKEvMWXWOhygepNqQTAKNb7hj5VQ4DCp?=
 =?us-ascii?Q?20WXck9C1faMPO1x+5Iwuoialii0cTjpi7WpR9dXIOr6mJ9zCqMBGm4E3M2J?=
 =?us-ascii?Q?O0ISnZby6qmGeDBmK/nj0BgHQ5/MkkWPI2BYhF3McDEMW53JHKlUPrvj0MjD?=
 =?us-ascii?Q?E1+KwurmxvufJ73AclMrYzWi/Z7JN6yrZZVJC4TcZeY9PAU/WXuPrT5zH8hl?=
 =?us-ascii?Q?9nCfxXOWkAWTnVapYPg6qCpN38t3vGQ6lakKsjGMhHnQTvWXyezHlvQwQw1e?=
 =?us-ascii?Q?eVsn5q1QyWvVuDRutLMPDEVL7ju/0501zuSvgrRi18rcsE8dt04eKBFc87F0?=
 =?us-ascii?Q?fQQwUuqsSim03IHL1nSEJfVIMw15tnv4lR/kvkH6KdHxTaTvrg/fFjiduUpH?=
 =?us-ascii?Q?SOoPzGJE2jf1WVge6R0bPWrO5QvM9sDVz1Nx7H+aYahHtsAmFlaFoU5pM73I?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d96b5a0-8872-4e67-42ae-08dd9336d057
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 22:29:39.2092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PL4YZHcUfXX39zBi0PCCUv5WiSoZ1ezGsAjm8jWqKwmxgOYLqmFpSboBIh1v9LbCdTmYnBXtYA5u19EYdJRunA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6842
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

On Mon, Apr 07, 2025 at 03:47:19PM +0530, Himal Prasad Ghimiray wrote:
> Update the bo_atomic_access based on user-provided input and determine
> the migration to smem during a CPU fault
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c         | 21 ++++++++++++++---
>  drivers/gpu/drm/xe/xe_vm.c         | 11 +++++++--
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 38 +++++++++++++++++++++++++++---
>  3 files changed, 62 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c337790c81ae..fe78f6da7054 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1573,6 +1573,12 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
>  	}
>  }
>  
> +static bool should_migrate_to_smem(struct xe_bo *bo)
> +{
> +	return bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL ||
> +	       bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU;
> +}
> +
>  static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  {
>  	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
> @@ -1581,7 +1587,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	struct xe_bo *bo = ttm_to_xe_bo(tbo);
>  	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
>  	vm_fault_t ret;
> -	int idx;
> +	int idx, r = 0;
>  
>  	if (needs_rpm)
>  		xe_pm_runtime_get(xe);
> @@ -1593,8 +1599,17 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	if (drm_dev_enter(ddev, &idx)) {
>  		trace_xe_bo_cpu_fault(bo);
>  
> -		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> -					       TTM_BO_VM_NUM_PREFAULT);
> +		if (should_migrate_to_smem(bo)) {
> +			r = xe_bo_migrate(bo, XE_PL_TT);
> +			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
> +				ret = VM_FAULT_NOPAGE;
> +			else if (r)
> +				ret = VM_FAULT_SIGBUS;
> +		}
> +		if (!ret)
> +			ret = ttm_bo_vm_fault_reserved(vmf,
> +						       vmf->vma->vm_page_prot,
> +						       TTM_BO_VM_NUM_PREFAULT);
>  		drm_dev_exit(idx);
>  	} else {
>  		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f1d4daf90efe..189e97113dbe 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3104,9 +3104,16 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.prefetch.va),
>  					    false);
> -		if (!err && !xe_vma_has_no_bo(vma))
> -			err = xe_bo_migrate(xe_vma_bo(vma),
> +		if (!err && !xe_vma_has_no_bo(vma)) {
> +			struct xe_bo *bo = xe_vma_bo(vma);
> +
> +			if (region == 0 && !vm->xe->info.has_device_atomics_on_smem &&
> +			    bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE)
> +				region = 1;
> +

So here we disallowing migration to system if atomics don't work there?
Shouldn't we just let the GPU fault and fixup on fault?

> +			err = xe_bo_migrate(bo,
>  					    region_to_mem_type[region]);
> +		}
>  		break;
>  	}
>  	default:
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index f4e0545937b0..bbae2faee603 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -87,16 +87,48 @@ static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  			  struct xe_vma **vmas, int num_vmas,
>  			  struct drm_xe_madvise_ops ops)
>  {
> -	int i;
> +	struct xe_bo *bo;
> +	int err, i;
>  
>  	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_ATOMIC);
>  	xe_assert(vm->xe, ops.atomic.val > DRM_XE_VMA_ATOMIC_UNDEFINED &&
>  		  ops.atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
>  	vm_dbg(&xe->drm, "attr_value = %d", ops.atomic.val);
>  
> -	for (i = 0; i < num_vmas; i++)
> +	for (i = 0; i < num_vmas; i++) {
>  		vmas[i]->attr.atomic_access = ops.atomic.val;
> -	/*TODO: handle bo backed vmas */
> +
> +		bo = xe_vma_bo(vmas[i]);
> +		if (!bo)
> +			continue;
> +
> +		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_CPU &&
> +				 !(bo->flags & XE_BO_FLAG_SYSTEM)))
> +			return -EINVAL;
> +
> +		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_DEVICE &&
> +				 !(bo->flags & XE_BO_FLAG_VRAM0) &&
> +				     !(bo->flags & XE_BO_FLAG_VRAM1)))
> +			return -EINVAL;

Don't device atomics work if xe->info.has_device_atomics_on_smem is set? 

> +
> +		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_GLOBAL &&
> +				 (!(bo->flags & XE_BO_FLAG_SYSTEM) ||
> +				      (!(bo->flags & XE_BO_FLAG_VRAM0) &&
> +				      !(bo->flags & XE_BO_FLAG_VRAM1)))))
> +			return -EINVAL;

One concern is all of the above are platform specific checks - e.g. if
we had a device with CXL atomics just work everywhere. I'd at least add
a comment indicating these are platform specific checks.

> +
> +		err = xe_bo_lock(bo, true);
> +		if (err)
> +			return err;
> +		bo->attr.atomic_access = ops.atomic.val;
> +
> +		/* Invalidate cpu page table, so bo can migrate to smem in next access */
> +		if (bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU ||
> +		    bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL)
> +			ttm_bo_unmap_virtual(&bo->ttm);

If alreday in SMEM, you don't need to unmap do you?

Matt

> +
> +		xe_bo_unlock(bo);
> +	}
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
