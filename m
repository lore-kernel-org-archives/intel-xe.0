Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04293CD128A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 19:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E9710F48A;
	Wed,  3 Apr 2024 19:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i9ra4yf7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5423D10ED33
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 19:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712171002; x=1743707002;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aD+Yubr77qt1wKcLp+ayOlSABZynPV4rl+5QUliLgPc=;
 b=i9ra4yf72jiJtmDzlPhixq89bKfUsveFnilj41ld74p+bVSKK2eBrJBV
 PwJdIXdUDZoA7kRKbF+KQgJ2bpEugXLz8mFyAOBv0z1WfisgV5BEMc+b6
 pcUOvnYLtMSrhdfJR9MBx+FLtSHBGZa3RKf3Eo9oCeoWvJX1b4INsa1DP
 N+QUFn5SCIuHGUYpvyLuRjIjjuyUCW0sDNKvCRu3G8C9fMRhvAQ+3pvF9
 JWwliKqkg/Afb5l2x/LyFq0EYLClnYmcjeE0EAPkIHCMIG9+xKLLPL8DY
 jpsHxGhIdBua2jjriKIpq8yY4gNhV84+pN2olBDyxAVxNg/E96L3x8f4W A==;
X-CSE-ConnectionGUID: 0DWQ4lpwRAKJAJp5tyh+tQ==
X-CSE-MsgGUID: IHwRzEy/RqS76/JYvBPJdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11243985"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="11243985"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 12:03:22 -0700
X-CSE-ConnectionGUID: 7cOvAbKiSvyLUqfy+xaURQ==
X-CSE-MsgGUID: hBq0Gw24RSybnR2+xtFzhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="19136431"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 12:03:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 12:03:21 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 12:03:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 12:03:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 12:02:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEeozMOPuu6C23Wqf3q97zeGH2gzL5z3nifS4sxwK3aRXGtFhP8hDaK2s5rTfV1Og8YrN/UvWqWdvnUltVDn9wV6PZQqXOZ5sErvWIonbxYEBnUPM2Aaleq8MApi17FXOId8FSzCwK2UvZMk/S5Q5+t4OOzhehHV0Gudbe8vAZJ6zQApS5bO0hxJsBpdlOit7hw6A/evnGdDkCyxZk3rozGLE60z7nRIzzjO86/JYeJFjnzqfdYXS1VO0Cj4ce0KOUPA557/3HGOqcOhwRNK6XNwfIiCvDiTaJA4oU+ZwWF8sOjj+cN7oydcuB8auSo9r7AH64Xy+wZD5wA1Wc+5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtWfwNx/gJFSjndcM4QNb/hwaXV5T5z6vxl5KMJsOvM=;
 b=D6I9KcOdwAx+ojoazC4KCoOMzDIn85RzlHREpJ5xgCtUGDaoGQDYbG6bFw8N09ahJRMeUxfGbzTaXsHRVi/Wkla1AUb/S+3mWvEDDW3iv1UP9wZf35Xn/WcXXft1wwLdN7Jt3pTFiWQMoD6rSQWDRgOkHHoar25Lz5WNWrGjFnxU1VnrN2GK8thrrAPBzKffaWRGTOAfJWfXC6/n9jc2V9AqPVvC6jMAYqyeVNDxVjqyhaJ7vrU1DfDpl5etk7BTV7HxhgFgTqTw4q3NpoiZNqwA/7zXdcXCBk4SNUjwx9tEV7vOG+FiIzYQ/g6/xKYlgz7wHFrZzr0ziEdz/pELJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6839.namprd11.prod.outlook.com (2603:10b6:303:220::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 19:02:41 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 19:02:41 +0000
Date: Wed, 3 Apr 2024 15:02:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/xe_migrate: Cast to output precision before
 multiplying operands
Message-ID: <Zg2nzUDwHGXBECj3@intel.com>
References: <20240401175300.3823653-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240401175300.3823653-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR13CA0094.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6839:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w8wh2t911cWsXY4hd58buN2fsIq/DwVrcXjsQI2lQkrsmLjNSdq3ahtH1KtnqOi5qBneLfgRKTqxJc0ogJjXxKiRu/dk728NtQxRT6OGO5BkmaK4uee8B9AIiuWXCAy2pMV77NHsBXpUrvrGunOPcgm3XrXtvN3ycTpmCdooo9d5Nm8kv2UuCf1C+EOX+3SVklXUc/75fHEZZb41ZPs+n96UkF/m2mKmVhBra8ld/TFXfznWhre3InB7VM9D53Hfku6mjk5wtpZpB1O2BIk6mXmbN4QPWOSVR2SHtAVVUi74f0vzmzppCBwXI7cLJyHKrHhZSkQax7PDX8oDFGe4LC+PNUmERl7mUwQCEnphQF0YwSPpFotaRrBPMT+9tnCUNd2m2Mr+EY/QJn0Sthg1jBLuBF1SVaB4aBCm23iUSmTw1qai6uye4QkVaTqrpIBnW/2AJ3UXMjPrRGmogOPB+j5thOkXAkg28YAxvN/BYhGlKbGuNf8C6DKzSbDUB+z1BQ1jsaxJ1Yqb8J3nPx4gppt86hUhES1SGgXRKeLdcnnMy5O8pBNiYgfchAqgGiaQB11/377x7hpW/g81I3RITLfx6m0iGxNyAiUbIZqQb6rTd2Vd3fmOnVdHcCgcyP7rHpk9O1HE2MHKBbZG0AVFSzHva662ExFcNq7n4scLwCc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3pjh5DIMDsIRL35xVhYZw3eEsremsvX8i3sbcLjRtATho/in2tXYBDKBSa6s?=
 =?us-ascii?Q?IeRI1bcgOmf25v+p7Ls9eYyUW49Ognuqc6odlnxfKY+COeHQVMt9SbfmK6Lv?=
 =?us-ascii?Q?Bfce6Jtseof8XcPJAqdmjojjIqu050QtvGzoUFsfXlIEWegSH/iKcmolPZU3?=
 =?us-ascii?Q?Yg6wwuDYAXCOVgehpMcilk5BCiWleQQRvlMsFOvIjc9vGdZTBTNEzKKgJK2u?=
 =?us-ascii?Q?HgPMnPB9wAt2EpIEh8SPEwEA9JcaZKt3wyuOwtFkClogpOikaZehjWXZCz0k?=
 =?us-ascii?Q?cBfsphE6jssWq0jQBoCNIlG0li4dASW8tiUbS/TlhE1Bnp+Fkbd89hUBdEYl?=
 =?us-ascii?Q?2jJVkMn3QgRBoTowKi2P3DwhDc7DofTAHFzlzEKQSB575Yz511BoimG/irrd?=
 =?us-ascii?Q?DJcQB0qu0vEQzEdjtmApZVqG9DxlyF5pzodCsY5wJOUxpOkO7NSpAcWnE2w4?=
 =?us-ascii?Q?6iS55gaB0OThhHFiIaym6QJSjtBOInRicPRU/hRkag9VUuXDWv8neYZcNzsQ?=
 =?us-ascii?Q?98JYELukWzqeJumzcMT/EVQm0kRjMO/neo/Syi+aaa4HTPWkM9Zjoa7tBuFy?=
 =?us-ascii?Q?8H2r/TK5AN+2/LrRaIzuAd6LPxGEaoeuJEAmdbu7lYkF8zzYhS0xOpsb9sMi?=
 =?us-ascii?Q?G9I6mprIAzbJ1eaQbCPmVfCJO7UuiEglDhkE39otOgWoMWKSrzsGPcQkxmKP?=
 =?us-ascii?Q?nGNFvTIb0puHjb4MpteFHM90zmj/veMnperHf2KnxHZ8wfNKMgFTaEH5Fqit?=
 =?us-ascii?Q?GAMh95X5ABv9aJrkjC42M77TEpzWHEeBh+gaPlzYedPgJJxUUVY9rCYiBO/C?=
 =?us-ascii?Q?qxWUBa8aRED6vPnOcVmq9BTYEC5aNx+WjbcmV5yNNUJRp3N5otWpi3nzymjK?=
 =?us-ascii?Q?mANJ8/pXwvOiX0M5Chi8vmcp5+EllLrinQWkmDlHpwWyUQC00lWYYwrl4/nh?=
 =?us-ascii?Q?rnEFkRROSspSdFF2MugD9IsargurL69hCpGExHRXhXBdWkUKzppzGxwBPc62?=
 =?us-ascii?Q?qyIkpj5g8qhi/CXkRj69TV79tyzlKcYy4gqcogqdHk6A79DH5XuXJHGZN1Z7?=
 =?us-ascii?Q?3FfAgpWOCOMF12joU2idVhq7kR3Ah8JveJol/6Hvpt+iZWh15Xh7tcT8jn/v?=
 =?us-ascii?Q?aXw160Exk8WGJ6ElidKM1vYXw/s2CTmQPbHSNZNScG4us50APPqM8ZqOpk6k?=
 =?us-ascii?Q?RxTRTWG5DnbLd/U8LS4TGT2Bsi+x9A/pDBxu+6TyCGT0F8jGpJg9OMDiTvUN?=
 =?us-ascii?Q?OpeuF4Yy51/Ef+oOALw1ZNsO3RNDe6ivEXwVKHSkC2iRrgXvvVZ1i/1+MqDl?=
 =?us-ascii?Q?nouHyBTHovxdyKa+xaJMohdZrnEGureigGRwkwBGZ3e2w2PV/72PPIRRyXm+?=
 =?us-ascii?Q?7kaFe51pZL/4HzUtiF8cbu8MaL6aWH7jZE04buTrP6U5Dn0kqVY6eI6PpMFF?=
 =?us-ascii?Q?tDJ0awab0XNibj67oy47CSQ+WdXU13nJQWcR8xbMHqbB7PH2aNVYW0gUtQLg?=
 =?us-ascii?Q?/Djj0CJFTCl1MYJ0yARmICtjxhnWaCx2A3MDfoOOqZGPSzBR6GzZwtkYWAlp?=
 =?us-ascii?Q?3CQaW+igIoxooW0sbafTkQ0Se6MqIC4dGgmX4AN5X/ozl3evq5mgCQile4qs?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a06c74ee-4b55-4b17-de60-08dc5410a2f5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 19:02:41.2124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAXFBaj3p0FrZXud2kx6slsX7RwKZ7iPML0kE1IFV6wUc69AVhgIp5xH/5K03fPmgjNPs3wrArhXBciI2fOS5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6839
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

On Mon, Apr 01, 2024 at 11:23:00PM +0530, Himal Prasad Ghimiray wrote:
> Addressing potential overflow in result of  multiplication of two lower
> precision (u32) operands before widening it to higher precision
> (u64).
> 
> -v2
> Fix commit message and description. (Rodrigo)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushing soon...

> ---
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
