Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3A5C54E58
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 20:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A47E10E997;
	Wed, 20 Mar 2024 20:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5kh/p6A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DE210FDC2
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 20:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710968280; x=1742504280;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NlcmyCOYRPe6ajh39IobJLMukXTU8k3dz2Gh4zBwrr8=;
 b=H5kh/p6AfOJME44MYKoZrxIOxCT6mYTHo+ZcuLbeh3Yhj9fGK2JljvrG
 0sluqVC6vbLDSSLs3ENtxrvNy9rR2o6BwT3nyT/qoPrUJjks+qQcbtwpU
 hAAQz1x/4eaIdmcKh2iqf2opchtdpPS2jqHQrxMGRxzmbEQDuAaTPVArB
 A1aKipmNHZ5GwRyAKjXmlrMjmUb8EzsAvamCIO0O4amiTqF9atv900mFi
 5irX3M00wP2Zb9fAN21fVb7WAGA8UMmY/y3mY5TWE1WBsPAVQ2IsvDMX1
 i4LY4d65D3gQEeWiavW2hkNxwc7uBDrH/WJiWEKxaRnNAzm1SxsbJ3nCm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="16564139"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="16564139"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:57:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="18966017"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 13:58:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 13:57:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 13:57:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 13:57:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lo/0Ontlas7/OSVZUdm8W24wNki3IozNtp7Lbb/6HTfvYVn4EVGF5SPaTBNtMSV29TBr0nLw1P2wviks6ezh9qbsd8r5YirWHxG/MgS7wXN03Ose4Mq9p99MG3yqApSoJfxN4FHneDeqCdWhZH+EisJXKSwcJPYeUt7jCtbe1x5n/5ic4XP+wdnjq7nxraad3jjmwVIHIGlsuZBmaytsiuT7o4WJn0WSeapt5shO1dPALa9IEEnHEYkqwYWGxL/vYWGjaZWQWVUCS5OSeippnPjg13b4rXVh6PejiaLFHzA+fPNwCLGXZGUa+XlSjxh2bqWwpJg1SvDS4GCS7BsNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Gv3cSg33qPodFK9blHiyGzHr63CUNhUbmrIMDFOCuU=;
 b=j2+JORGUn2QVU1floIh91yw8v8K/PCerFuByCdngYKHxTNWuVCOsr15M6SAkXjbMdrinhuORrca85gWNyTpxCKqxKEmdLLsz8jHLYH/wdMM5NVi3TPPHE+J6P/nJhpBSJZWNx5ZYtyaMiyMe7LmqOWxYMdJPP8vi9lNfNlDi2mUem4dP2tWsAV+InjxoM1w+wssiM69W4SbfnrKl04E1qxjuA0t/81gjQOXLJ+gjYZXLY3K0KP8rLZfJhSVlJ3S5N43sB3yxUFr596Wk6JyERUw0JUi+lOVU12gP9TZ0mF4UX9vWxXjKTahWn9wMJTNQ3FnHmdz3BgdrI92Jdh62WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Wed, 20 Mar
 2024 20:57:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 20:57:56 +0000
Date: Wed, 20 Mar 2024 16:57:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe/xe_migrate: Fix potential overflows expression
Message-ID: <ZftN0eDAtRN1YnsG@intel.com>
References: <20240320101835.3266429-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240320101835.3266429-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: 2371602f-183f-4201-110c-08dc49206b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zXIDBh187BAZgeok3QrSMHCZNAqroEDZeUQStxNhtRGHy3FABVRTOPadHJAg5CH2Ef+KS8UgxkAv5mLp8WqGRsJiqUp/9lpIzYKDzhhs825W/0NINCC9QwjbIgY2kP0pH4HWmnI3xX02jimJbXBDoG3om5kh5ODuvI0bwpCdJotlFXxuywBB7q9NY81t5Gadew68FzlioxQo67VRodiAshqbLuDMDfNCabSflxrKTLUbZnsNxh8Rmb9fb1ozeSX9ofQW1Jfhh770mQnmU0mgtTms5O9QREqSkGhggQ5CCHR2sNkf01ATvqIeMHPDd/Z/2JIYJ33dHnJwRP/0rfdjk3511mdxJ3WQ3hdNjDRRmp0Wz4Ko9n8eRS6b/WBo6DJ+/OQ3ry+N405vydqi78S1UkytQuyPmipXPuc1gqEqtTpwR4K3WY78OiYhI3EG58hlYYyDZk9+I42XpCxGmNPWBVd1l8iqYyiPXYpeZLF0/OON8py3ioUmotTXfYgFqH6FUHV244W+Fgdn0IeHTs/nDcuv2dGePVtvxlFwyOabEW+wl1bBporH6HZbjX4YSF4rfI+toCOzyk2HKly9B+UNnG+XRL9YYR3TBxrdqte5V19tZEFpQaLorfAHOflUdTHxl8Y5bLCYr1Yl3Nh0gWHjULJdMWuvqPQaD1oEmLPOnwc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kEfjWypAhM0kOMmUpj4mCmg5NuPbFASOTIU8oGpiuZL+N2P4296UPODxuh8R?=
 =?us-ascii?Q?HjgoBx454bY25CkJ0KgZ0UKPqqKs1vGAKuq4+0exKIcS8T3ozYNWMeaVYDr1?=
 =?us-ascii?Q?91RTI41mq5yraOZtvDURmjt3zezEwmEJHMGBpENII9ZE1Cl9BWK5VagpXIW8?=
 =?us-ascii?Q?fOOgA/Tv1saNAaIvvO90xp/CVvoMOQEKi7vimt9D8ZD2RA38set3CppiNuX9?=
 =?us-ascii?Q?HgNVMR+Gk+MZGa5e/JsQ+K3+TPPC9bYYfS20yHPLP9zXBMehFDNEmvO5JXPZ?=
 =?us-ascii?Q?x1d09MO/QQ4BSOOTOhUNI3z6wSAg2o8lJgH7Is3NrswKjjPCmBcOabKldEO1?=
 =?us-ascii?Q?hMvxiRHhgV8JTpRHh4L5YJ4yMsJ5uLq8ZcQwCHGXoP/N6gslw/gcO47wjK4i?=
 =?us-ascii?Q?V5eEBfDT+ZaFTczpEE8mR50rB5VaEcdLmuIVpZqWgJV+zObg5mQ+zgErp4JW?=
 =?us-ascii?Q?SRs2Tt/TzitM2OPIfGxRIDQOxZ0LKvznDP0DumRuXa9lDwCQBAMKiX5xK49z?=
 =?us-ascii?Q?dK4tdp38KzIZuQ6HvmpE6eg8VsQ7Tp55lIoJESehmw2sCPPzMScZskWp9Yz7?=
 =?us-ascii?Q?LywwCj4FdZAN8kw8Pep5MDJhB8JGZLv9r5ZCxBjmK8j+VSwwszsElK1+k1dn?=
 =?us-ascii?Q?f1tMDohVIgM2tWR6liQ9N6DK7+e49VAPBAPYDzQvjswBzrLvj7uXLVREDSY3?=
 =?us-ascii?Q?qdzUs4h3M9o8/eQG6h+xzUHrYIiDtZIzumc4H92G/JijtHgmMHYSVoHLp7qp?=
 =?us-ascii?Q?WV395wJN7PupatRLH4QWSV+OZqWP/ReSWK2Xrq8SQXX20yTJhHl0soP78SvH?=
 =?us-ascii?Q?ArjQ90mzjuSlb8CXb3PNlIjQyew2geV4egTlFNcnwLPf2q65c6pW0+OWU51c?=
 =?us-ascii?Q?u/Hn89KTpyyzUpe/wkvlEzxxHOOzAa4OLFgkw+UsQyFOiXPmPXVU/ilC+SWy?=
 =?us-ascii?Q?TOvGQhFizTogfBEthmtGxGJgirQ3m10DLaeTSLTKfWmen1oC3u3OiIkR511W?=
 =?us-ascii?Q?krlDSWgE+3OTaZ2wLkqhogHqYeIPbbTvVp3RQkbSPviK44Ar6ixCe5XlTiN0?=
 =?us-ascii?Q?g/K2qrtQ9kHPJuTVGHmwEF3ylaD6xAc0/9g3Fh3JkzctRkvc+LDyUF1lXKng?=
 =?us-ascii?Q?pXbM6giUW9+HlV38REEeELGOl7XRq9ScyEJ7DBkhibIyFUlcu2rPNgZHAA7Z?=
 =?us-ascii?Q?DrBecqlkN6SBUobni47xP76piGNz9zJUxejy7fUwgGUjw0SEXnDFVmVRKkxA?=
 =?us-ascii?Q?lOrauH0wmV6+iuxD4HHmMuqqe8tUvz2caolQaKqyavquHEk2zXXN9MuWbWIC?=
 =?us-ascii?Q?1omLbP/Y56N1prK0qPxObM4Y0WD5Juk9Rof5Mge3aYhqSBHd6CxEbT+6pdkU?=
 =?us-ascii?Q?RjklxBvxzMwMHPBM9fHLtxq3SvdLCDV1b63e+U9VLt4EgnlUAmgDiGAy60SD?=
 =?us-ascii?Q?9oz3aH96gPF7UGCF6tVtxUBgNN1PrfGyOwXhendi0plVsHQATrnBKaVcqlLI?=
 =?us-ascii?Q?AH9OOGZNVFyQAvWM6nsOJ0UzpBChKkqjg/OlcQsuDpVWKkh1U9X/7HUJ7N4H?=
 =?us-ascii?Q?DIkOSjFfHGokMv7fl9Tgs+jRBXFhM30BFpOODKel?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2371602f-183f-4201-110c-08dc49206b28
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 20:57:56.8111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCxeeaRYv3n7puMMbVzDPvaQ1FnnHur1Hsxnb6WWZamKgJ/wOZngWS1diHWq0LC6HT20vf0wnxBGH6vq/1MfSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
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

On Wed, Mar 20, 2024 at 03:48:35PM +0530, Himal Prasad Ghimiray wrote:
> Cast to proper datatypes to avoid overflows.

I'm afraid that the cast wont prevent the overflow, but mask it.
probably safer to move the multiplication to some of the helpers
in linux/math64.h ?!

> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
> These errors were highlighted by Coverity. I'm uncertain whether they
> require attention or if it would be more appropriate to label them as
> false positives within the tool.
> 
> I've submitted this patch in case addressing the issues is necessary.
> However, if reviewers determine that these issues should be marked as
> false positives or ignored within the tool, that option is also
> available
> 
>  drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index ee1bb938c493..2ba4fb9511f6 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -227,7 +227,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		if (vm->flags & XE_VM_FLAG_64K && level == 1)
>  			flags = XE_PDE_64K;
>  
> -		entry = vm->pt_ops->pde_encode_bo(bo, map_ofs + (level - 1) *
> +		entry = vm->pt_ops->pde_encode_bo(bo, map_ofs + (u64)(level - 1) *
>  						  XE_PAGE_SIZE, pat_index);
>  		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level, u64,
>  			  entry | flags);
> @@ -235,7 +235,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  
>  	/* Write PDE's that point to our BO. */
>  	for (i = 0; i < num_entries - num_level; i++) {
> -		entry = vm->pt_ops->pde_encode_bo(bo, i * XE_PAGE_SIZE,
> +		entry = vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_PAGE_SIZE,
>  						  pat_index);
>  
>  		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
> @@ -291,7 +291,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  #define VM_SA_UPDATE_UNIT_SIZE		(XE_PAGE_SIZE / NUM_VMUSA_UNIT_PER_PAGE)
>  #define NUM_VMUSA_WRITES_PER_UNIT	(VM_SA_UPDATE_UNIT_SIZE / sizeof(u64))
>  	drm_suballoc_manager_init(&m->vm_update_sa,
> -				  (map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
> +				  (size_t)(map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
>  				  NUM_VMUSA_UNIT_PER_PAGE, 0);
>  
>  	m->pt_bo = bo;
> @@ -490,7 +490,7 @@ static void emit_pte(struct xe_migrate *m,
>  	struct xe_vm *vm = m->q->vm;
>  	u16 pat_index;
>  	u32 ptes;
> -	u64 ofs = at_pt * XE_PAGE_SIZE;
> +	u64 ofs = (u64)at_pt * XE_PAGE_SIZE;
>  	u64 cur_ofs;
>  
>  	/* Indirect access needs compression enabled uncached PAT index */
> -- 
> 2.25.1
> 
