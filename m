Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434DCC54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1208110FC2B;
	Thu, 14 Mar 2024 17:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iL/05z6H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C061910FC2B
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 17:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710436740; x=1741972740;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=glyz3y+E1hbUpQUYw6q3OB1TAyJhCyLQkvpggzfiY5A=;
 b=iL/05z6HRLPLQecm9scNyxJfGTHp77je7HfSGAvGkhukFI7GIaZWm2yC
 ucgoZ2gPSRJAF7hqkSL/R/E6ewxz0mTIb0PHE/iup8ohnvBakhKR1Ic72
 jaYQCd+xkQuaYkvn5ZSQsmWSTrPQyl22YInXvNKqzjIwumXie/KsEaJb/
 5p2LFfkWdmjPF0T07YMQ6jDJB1fsxmqrkecjWZgmok6kBUpRWRFVK3yxp
 x0RtrpRgo5NBPAiiG4zUNs9RqhuJKBsiODB74HA3LL2YY+Bi137sqk4Xd
 azaUMAnxiFRl1T+qvYqUNIrPkIXPTC2mxoT4LF9LhMy98JwdW0tzsJwFP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="15917439"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="15917439"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:18:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="49801678"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 10:18:58 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 10:18:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 10:18:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 10:18:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0GhZXVrFp7orPkCUxhHNN4aG4GaE5a2/UMwp0Xxjvz4hGOk9/VFTHqNPPCjxwkYfTWVUueC9FVIOPsEiJoCt8tOUXMxc9xHsDzscME+U1oYYPsPYIKG6Qynqi6fElMsZ8Ukb+DLL1szBDS3Aasaj1FWCG9vzU3QqOYp1t3rLK9GT3DnVytKWSlhgbp0V6hqf4u9dfDAxLyMR2tDamQE5MWm0Kfolh6Tf2heuZF7IUVeZxIBcpv/y/w0ykwn67KoSimv6OETYHwH3fC/t+Xb+p3TxnaIwweiyPh/yz9jUwupuJYbuZQIz4YKsiZ5qKQaa3NxUP+bJtDtt85BzXsj4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXIT+pZUf/tB56BAvZ4dF5zxrStUGFxHmtb5kJSm+yA=;
 b=PLtNBTeEtFubNjJPafQsl5zRyiN0UAU4j+i9lBKGaGgAED1L6WOFZJyHTUnmGQxFUz4g4rhOXwcmtYwPdSBx4OwxH3dmDI+GPE1CJYnirKOxcLxJb9jH4p6dzRtw/+ljXJRbl5dtNrD4IeXlE5HlSsPlxGGduGRPXC9uZrHuAZ41yFJ+tuCx4//KnT/ys5joEn1TX78qEN831ZIo7MDfQX1sONpSEr4P006fsS1/ICBpd7FdP65FFfoinEogwF/z003XYaCPn4h8B5tzSDyYWoCmkOZGy1tlWR4iwRepZlnEuYZWmfJAostHKAPXzMSGYjbH0JocNTV7HNRn64BM8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7167.namprd11.prod.outlook.com (2603:10b6:510:1e9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Thu, 14 Mar
 2024 17:18:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 17:18:54 +0000
Date: Thu, 14 Mar 2024 17:17:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@intel.com>,
 <airlied@gmail.com>, <brian.welty@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing for GPU
 vram
Message-ID: <ZfMxR/YHY/LP88KZ@DUT025-TGLU.fm.intel.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-2-oak.zeng@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240314033553.1379444-2-oak.zeng@intel.com>
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c7b2d5-c419-4a94-e480-08dc444ad30a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pBd9VPJ8MT8ERLTYKVEMUaKWlMmifJ1piBHeMj+FWOdgPL0F5PnydpBQxU4B8vYANcBpAE//KOU4YKUcYmfTderrBhNJOtcnJdqTDqP7Bp38Z6NMcdO9Bi2Gk95o87MFio1M6DKKmBLdR8JV0USyPSBQUAj/wPVFBH/qfMEyuc/0NoO5pOLzZxAw39EmjTLmVolWfdpFbkvvo1uhUrE/SZfpUaapiJHO/S2BM/A1usm8tPmghsYukSTT2KFtl+sPsVGMuepki3wD+YgEXKhEMoBK2kLIiVWcssHwt042u51VUaqbGErwLtJHsNc2xR6JiZcrKBITW3NO9sK59ywYHoJgoxxAnwg4shH+e3110G3Wy31zKUn+i6qM9qWVXxGMMW+MT4H38DyflXmjaLnkIPDhijoAhsaATuqM2LD9AZ0XV2ubqRIvqRcueS4YegKPBJZo3nWF981UUW+4fkg+IOJQrQGDLhEhlevmub+a7xcPRy43n3u+0ga9qPiFlWgVNUH2esS5CBefQ+T8Pz7WZ/4xw1pTRzck+l5PeRkxOfvpHMqiwKXCh3eBH5ffUlnTIhZIDwNNEfeX13DaTSGTbshopEiZQZP8qrW6u1HpJzvmFLgDQZ10KsGZM6aKuw9FlvJoGo/AyGW9Y76ewMV4lwS5GZzS7wiv1YcIZttTYhQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WPSpfHuMVFSYCc9npDYPV9fIFbk7CIDTcHcp4lOrfgv91EnDlGhylAhJha?=
 =?iso-8859-1?Q?pkgcrTBTS4yoO9UpQyNRNhHwbcI5k9snINznfmyTIRj1EETrXJ1aRofB+k?=
 =?iso-8859-1?Q?umTgBgntZccLSkVK+v7KYRc0NsQH6m9e2RDiX312mF1u3RgFg8j8EkM6WN?=
 =?iso-8859-1?Q?e4TYIu5sYONM7HRGXMuclYoqTJ0RxCmiMaNoPNoZETM+8OvEFDukRpk5lk?=
 =?iso-8859-1?Q?9yzM2g+ATd/j2ivsfRiFsouOdczr8U+aSuDfWdSsOSHkNzcuIlNmDm5elu?=
 =?iso-8859-1?Q?UEpqEpeqLTYyt2zQgdIizyaIA1ZMoEdcGRk4rqDew2/kygXPLk1Xo0FCs5?=
 =?iso-8859-1?Q?hGzLDFsV5yDZ/K3WG1w7hwZCWtBz/6RitEd9poq0TUD7XSGB1/ewPnbDWF?=
 =?iso-8859-1?Q?8IQ8W1hLHoTibmUGaO0Ycz/HhIGoQhcSp+qJiGKC5H7a09MiP1jXNjxFy+?=
 =?iso-8859-1?Q?z6n6i6t+bJC7nvlE3pz1I65lfBYfxIbfGa0jjOa4dY3iQeWnt+2SuHUFH0?=
 =?iso-8859-1?Q?oshonqK2ARBgKlDVhopEKgQP9z2UtXotFTvQlBgfsexjdfNJuljZa0+OFZ?=
 =?iso-8859-1?Q?W8ys6NveaoXMW0JzP1D6zihNGHiI8H+Ex4dLkjaX3kp7fEWCEjA3ZNETJM?=
 =?iso-8859-1?Q?KSekAtMa3Radt8ZfIhEZShBQ8MOcIKaaIs9Qz4OmClc02GXVOb2tmJfrQ+?=
 =?iso-8859-1?Q?wbJ+4IuQ569cTenvdHPhCMK05NIFwUTKv/i6bq8xV1MFO82fGDz5HsawLU?=
 =?iso-8859-1?Q?8VGbeHPfH2NW6E4fKcjCtOl6Vam/5zzecj9D+89SrG/ODFX9RgcrRCi69A?=
 =?iso-8859-1?Q?dW6EGN3wKRbAtUmThM3hqcjhkUPDB9KSl4mdfF3FYcQqWuO04yS8JQLoQp?=
 =?iso-8859-1?Q?xZ4Q7QoeA0ZMDNRA/3wLDWZEls0oQoRbEaZ7Gg5CIIe89JnWcXq/rhjs1p?=
 =?iso-8859-1?Q?Up97sxxPGlcvRNP340z3zx5c1Phk8arlMkiAXhnAwo6bXGunhkANsj1XWA?=
 =?iso-8859-1?Q?9AqtfZLK2fe2Qo8o/YJ27m33kRo0O5FMZWGTpjnC9lOCTLDJU86sv1l2Wf?=
 =?iso-8859-1?Q?HNJsMcQAENZ0DfJjvZsM7SR9uZKa92H2BJQqA13XG56bAzcGXTyjXN7tpz?=
 =?iso-8859-1?Q?D4bCbhugck6oKb4DNLhR9rR76BBLRaVlOmbBkcTTffalsOtm8Mr77qkQL7?=
 =?iso-8859-1?Q?QtAKSLiTsG+t3DbXbvhtl6tPASbtPyFCPXPsNa7ckR/pljKpxUQK98lF3v?=
 =?iso-8859-1?Q?OVYq8d58LQMGk/0mDp8RwH+i493+KHcj8+4IYzLu5shft/F5z4movIhP0F?=
 =?iso-8859-1?Q?dzzkuEhl0qVPuOWgaiCLQRgaGWCkqmnbuhVcuYOsetJHsSLwcWyQvXDTBC?=
 =?iso-8859-1?Q?Wjz27+cTMTw9+VAOvhKUWA0/qUuRaCCuyoqL5Op1r4HUpvtLUYmXpyQjnd?=
 =?iso-8859-1?Q?t3fM+TXMrG+PVzx4LNlqx7ATYcpdMDpgIC8bHJqPTeCYpbYgNxt2ABM9nv?=
 =?iso-8859-1?Q?DBDN/Npk5I0i/MZWHzb/Ny2g/XzT7+M9UpZsW+pZLHBg8c60v+Zxkpu9Dt?=
 =?iso-8859-1?Q?TrGK/6IDFdgdUrRAhiAd2Uta8y3NrnEeocykU96HRPcSWKRrhD4d4vXnAV?=
 =?iso-8859-1?Q?aJAXGeF0hVfN41STWVwBlAsO4N7GoYp6ac2Sf6O5k083+yrQFtC8IMDg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c7b2d5-c419-4a94-e480-08dc444ad30a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 17:18:54.0358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lhD71I6ZrNUkd0RVvy3B9/vUT2QXWTSme7mPZyhzbCFDCctXPmu1bonJ3mdrPDmtVIrW4LUG1nd7Oa1S1Xa2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7167
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

On Wed, Mar 13, 2024 at 11:35:49PM -0400, Oak Zeng wrote:
> Memory remap GPU vram using devm_memremap_pages, so each GPU vram
> page is backed by a struct page.
> 
> Those struct pages are created to allow hmm migrate buffer b/t
> GPU vram and CPU system memory using existing Linux migration
> mechanism (i.e., migrating b/t CPU system memory and hard disk).
> 
> This is prepare work to enable svm (shared virtual memory) through
> Linux kernel hmm framework. The memory remap's page map type is set
> to MEMORY_DEVICE_PRIVATE for now. This means even though each GPU
> vram page get a struct page and can be mapped in CPU page table,
> but such pages are treated as GPU's private resource, so CPU can't
> access them. If CPU access such page, a page fault is triggered
> and page will be migrate to system memory.
> 

Is this really true? We can map VRAM BOs to the CPU without having
migarte back and forth. Admittedly I don't know the inner workings of
how this works but in IGTs we do this all the time.

  54         batch_bo = xe_bo_create(fd, vm, batch_size,
  55                                 vram_if_possible(fd, 0),
  56                                 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
  57         batch_map = xe_bo_map(fd, batch_bo, batch_size);

The BO is created in VRAM and then mapped to the CPU.

I don't think there is an expectation of coherence rather caching mode
and exclusive access of the memory based on synchronization.

e.g.
User write BB/data via CPU to GPU memory
User calls exec
GPU read / write memory
User wait on sync indicating exec done
User reads result

All of this works without migration. Are we not planing supporting flow
with SVM?  

Afaik this migration dance really only needs to be done if the CPU and
GPU are using atomics on a shared memory region and the GPU device
doesn't support a coherent memory protocol (e.g. PVC).

> For GPU device which supports coherent memory protocol b/t CPU and
> GPU (such as CXL and CAPI protocol), we can remap device memory as
> MEMORY_DEVICE_COHERENT. This is TBD.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  3 +-
>  drivers/gpu/drm/xe/xe_device_types.h |  9 +++
>  drivers/gpu/drm/xe/xe_mmio.c         |  8 +++
>  drivers/gpu/drm/xe/xe_svm.h          | 14 +++++
>  drivers/gpu/drm/xe/xe_svm_devmem.c   | 91 ++++++++++++++++++++++++++++
>  5 files changed, 124 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_svm.h
>  create mode 100644 drivers/gpu/drm/xe/xe_svm_devmem.c
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index c531210695db..840467080e59 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -142,7 +142,8 @@ xe-y += xe_bb.o \
>  	xe_vram_freq.o \
>  	xe_wait_user_fence.o \
>  	xe_wa.o \
> -	xe_wopcm.o
> +	xe_wopcm.o \
> +	xe_svm_devmem.o

These should be in alphabetical order.

>  
>  # graphics hardware monitoring (HWMON) support
>  xe-$(CONFIG_HWMON) += xe_hwmon.o
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 9785eef2e5a4..f27c3bee8ce7 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -99,6 +99,15 @@ struct xe_mem_region {
>  	resource_size_t actual_physical_size;
>  	/** @mapping: pointer to VRAM mappable space */
>  	void __iomem *mapping;
> +	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> +    struct dev_pagemap pagemap;
> +    /**
> +     * @hpa_base: base host physical address
> +     *
> +     * This is generated when remap device memory as ZONE_DEVICE
> +     */
> +    resource_size_t hpa_base;

Weird indentation. This goes for the entire series, look at checkpatch.

> +
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index e3db3a178760..0d795394bc4c 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -22,6 +22,7 @@
>  #include "xe_module.h"
>  #include "xe_sriov.h"
>  #include "xe_tile.h"
> +#include "xe_svm.h"
>  
>  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
>  #define TILE_COUNT		REG_GENMASK(15, 8)
> @@ -286,6 +287,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  		}
>  
>  		io_size -= min_t(u64, tile_size, io_size);
> +		xe_svm_devm_add(tile, &tile->mem.vram);

Do we want to do this probe for all devices with VRAM or only a subset?

>  	}
>  
>  	xe->mem.vram.actual_physical_size = total_size;
> @@ -354,10 +356,16 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
>  static void mmio_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_device *xe = arg;
> +    struct xe_tile *tile;
> +    u8 id;
>  
>  	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
>  	if (xe->mem.vram.mapping)
>  		iounmap(xe->mem.vram.mapping);
> +
> +	for_each_tile(tile, xe, id)
> +		xe_svm_devm_remove(xe, &tile->mem.vram);

This should probably be above existing code. Typical on fini to do
things in reverse order from init.

> +
>  }
>  
>  static int xe_verify_lmem_ready(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> new file mode 100644
> index 000000000000..09f9afb0e7d4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation

2024?

> + */
> +
> +#ifndef __XE_SVM_H
> +#define __XE_SVM_H
> +
> +#include "xe_device_types.h"

I don't think you need to include this. Rather just forward decl structs
used here.

e.g.

struct xe_device;
struct xe_mem_region;
struct xe_tile;

> +
> +int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mem);
> +void xe_svm_devm_remove(struct xe_device *xe, struct xe_mem_region *mem);

The arguments here are incongruent here. Typically we want these to
match.

> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c b/drivers/gpu/drm/xe/xe_svm_devmem.c

Incongruent between xe_svm.h and xe_svm_devmem.c. Again these two should
match.

> new file mode 100644
> index 000000000000..63b7a1961cc6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation

2024?

> + */
> +
> +#include <linux/mm_types.h>
> +#include <linux/sched/mm.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_trace.h"

xe_trace.h appears to be unused.

> +#include "xe_svm.h"
> +
> +
> +static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> +{
> +	return 0;
> +}
> +
> +static void xe_devm_page_free(struct page *page)
> +{
> +}
> +
> +static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
> +	.page_free = xe_devm_page_free,
> +	.migrate_to_ram = xe_devm_migrate_to_ram,
> +};
> +

Assume these are placeholders that will be populated later?

> +/**
> + * xe_svm_devm_add: Remap and provide memmap backing for device memory
> + * @tile: tile that the memory region blongs to
> + * @mr: memory region to remap
> + *
> + * This remap device memory to host physical address space and create
> + * struct page to back device memory
> + *
> + * Return: 0 on success standard error code otherwise
> + */
> +int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)

Here I see the xe_mem_region is from tile->mem.vram, wondering rather
than using the tile->mem.vram we should use xe->mem.vram when enabling
svm? Isn't the idea behind svm the entire memory is 1 view?

I suppose if we do that we also only use 1 TTM VRAM manager / buddy
allocator too. I thought I saw some patches flying around for that too.

> +{
> +	struct device *dev = &to_pci_dev(tile->xe->drm.dev)->dev;
> +	struct resource *res;
> +	void *addr;
> +	int ret;
> +
> +	res = devm_request_free_mem_region(dev, &iomem_resource,
> +					   mr->usable_size);
> +	if (IS_ERR(res)) {
> +		ret = PTR_ERR(res);
> +		return ret;
> +	}
> +
> +	mr->pagemap.type = MEMORY_DEVICE_PRIVATE;
> +	mr->pagemap.range.start = res->start;
> +	mr->pagemap.range.end = res->end;
> +	mr->pagemap.nr_range = 1;
> +	mr->pagemap.ops = &xe_devm_pagemap_ops;
> +	mr->pagemap.owner = tile->xe->drm.dev;
> +	addr = devm_memremap_pages(dev, &mr->pagemap);
> +	if (IS_ERR(addr)) {
> +		devm_release_mem_region(dev, res->start, resource_size(res));
> +		ret = PTR_ERR(addr);
> +		drm_err(&tile->xe->drm, "Failed to remap tile %d memory, errno %d\n",
> +				tile->id, ret);
> +		return ret;
> +	}
> +	mr->hpa_base = res->start;
> +
> +	drm_info(&tile->xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
> +			tile->id, mr->io_start, mr->io_start + mr->usable_size, res);
> +	return 0;
> +}
> +
> +/**
> + * xe_svm_devm_remove: Unmap device memory and free resources
> + * @xe: xe device
> + * @mr: memory region to remove
> + */
> +void xe_svm_devm_remove(struct xe_device *xe, struct xe_mem_region *mr)
> +{
> +	/*FIXME: below cause a kernel hange during moduel remove*/
> +#if 0
> +	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
> +
> +	if (mr->hpa_base) {
> +		devm_memunmap_pages(dev, &mr->pagemap);
> +		devm_release_mem_region(dev, mr->pagemap.range.start,
> +			mr->pagemap.range.end - mr->pagemap.range.start +1);
> +	}
> +#endif

This would need to be fixed too.

Matt 

> +}
> +
> -- 
> 2.26.3
> 
