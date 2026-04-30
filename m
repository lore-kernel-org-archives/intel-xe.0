Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EB7FF886F
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 04:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1709210E0A0;
	Thu, 30 Apr 2026 04:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHNTYXcs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E409410E0A0
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 04:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777523372; x=1809059372;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xQMvtsta3S91g6YfIM/y9jsTGLvRD51Gd/6iqgNZPL4=;
 b=GHNTYXcsx4JhkcxFGuZCC6/4xs6IKO/6Q7ZlwdCscL5iVHRhcTjkdyw/
 mavSSAn+2bI+FI9JJ44dkyXq+LMbAAAK+qu6YP0D7Csmi+0sU5i6W/E91
 2UWuLNmWHZpijnXx29DxAaAT+jCt2Sj4KApIfNG0oLgwbn5/2pI/VNT1U
 OwbElji2KGAL7ZYvOY4OuX9KhPkYGsuHlIP0JecFURzGbpFEvOg93nNcn
 tYYvPze2Y9KpnW+ooXnYMCO1O+nkgm/zSu5v8uFsjQ3DqiBtRCThD+u6Y
 f0wwMXyXn5uwleBUDPkoNIEdD3bCFwUH1u6yDtsA6t+deYMcrfIty5mcO g==;
X-CSE-ConnectionGUID: QwDctjpdRzK5neU5Q6/VLw==
X-CSE-MsgGUID: tkn1vM9RStSmYv3tmrl/+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="81038867"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="81038867"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:29:31 -0700
X-CSE-ConnectionGUID: 4l95hAtERK+gyCVqPmZ0GQ==
X-CSE-MsgGUID: Lg5pKoNSTaiSJoSRITo61A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="239491162"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:29:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 21:29:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 21:29:31 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.11) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 21:29:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkAmAU8o7qKMFQ9okOS95REGVqKumIKdYBTWSCbqKoAeEBq+sfLYdk57Nu0Yu3U8lkvIN6VUIL3y7/CiPkYL3lBD6wERhu4wc2yY8YdQHa8PFOI1Zg8Q09uH3wA1nHBAjoyCUl77gtBUicxnt5HU/Y7trdFIyKS0fS/ogScWBQUWgPhTrcFLYum2LZ9rd2JPNCPz0h2l57CSEzQxaxvgCVTikXospkx7cQZiK11vmLcCzq4YHeoU1nm4MLbQEYnGmMDuPIwzIR6ja/9LzUI+VMyFk8hKag6ZoBF/so6rPBa4Ti3XtBuprF5kqNg7rj6x0DF3d16Tvntur/VKemvX0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0cOqrmxxZuxre0zEdcJgwVuKfmDb1pJOL+/YJ6Sf5k=;
 b=cVbaLFr55Z5Asoqr1mqp1szymgB9T/+WtysabXKzuBSYqZOQZQtIaeKE386aJXj9TcDrViuTY6vOkZN0aesWYvEeBUAhQKf24VGZ0NDl23SNj805e9HzHythDaxDmo8+Vwa9zCssAUAfSyoSdv+iQkhTlxLSe6MeqN+SyxYEXyp07o/rFnUImg4C41fMQgM3DbfGIdILov9NFR7NZ1iw4u9D0oiOexjddYJ+tOanGh6Yfh+DGup9JABGpZO2MAxLAplgaK0nagL1+/1d7jlxrYS00eo5r3rsh69YiZ03bJc+Ex2Y8hbKteT4FiYRzE//JeW/lKUJ/bALbedpcAUfAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DSVPR11MB9889.namprd11.prod.outlook.com (2603:10b6:8:45d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 04:29:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 04:29:24 +0000
Date: Wed, 29 Apr 2026 21:29:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v2 2/7] drm/xe/vm: Preserve cpu_autoreset_active across
 GPUVA operations
Message-ID: <afLaoQqACZaoECxb@gsse-cloud1.jf.intel.com>
References: <20260406085830.1118431-1-arvind.yadav@intel.com>
 <20260406085830.1118431-3-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260406085830.1118431-3-arvind.yadav@intel.com>
X-ClientProxiedBy: SJ0PR13CA0197.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DSVPR11MB9889:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d18875-4e34-46cd-b0a6-08dea6710eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: gIkXbLHps8uw12S6ESuDvS3Q7XA4maeZ60+IrerufpBW4jQHsI3u0nAp+aOpqj8JtJeyYmcUMGuxMiZC7fSKKDbkrM12L2k1mfKloZFh5NFShNemU/N/WFEhF8xkNF1dnwMTsJMuvIwT6BH77/8u4X0oz2fIfBTPaYf2wiEzA5WtUUZzXuLRO8Z9mEms18kdFB+QSPO5j9rDGd2jxnx1rq2bxInQGw2MvaDs++ogEJGPehRXrx9FPqVherWF3Bc7AX0j/wKekZEh4Hzlse/p5JoDkk26+SqH3CF/jDsX0dtELeBYCc2A4Riec8n8dzpjXP+sXyKgP0UwBxkkYJuxvZhJ4Qi5NH/q+43xCSa3DZ8JL6hibjd85hHR6iD+dGxM/+yHPbmy2X9J7mjs7b/TxlF2RCcSfnO3Ao1DIGnU4S6m3mS1I53n+fpouC8gxCRj2d1tdtvgHuwlgff0mHgSGzZavsXno/+O/dGl5rlQCkGNBidspDIq9SmG1iTGD0nvMwPKMaPjnKRSprMO1oaIASXBp/tprBF2sqiKb4TbHJ80WFOsqhNnbCO1Ah5tvC6rV0eXtm3NY9jGxKVHBWz90dqSnXewcvLX9S31Qbzzv6m2Qtln7zhGhXYDyADx9T/O0Gp+kLz8vmVg5vctPAUqGIyhkQFdNLwrUkKjeGkxI/DDuZYOhBVzR4Y/GdIbqHB8lNXqmGU4E08mWM2kxsD8F4JL2EOpT5eRlqpnD4afocM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JxLxZUk8foShVlJKcN8g0oMK/PdiL8eNJ+T3z5n5qg4jZCQbruTvomPdTK?=
 =?iso-8859-1?Q?w1WAMEELTPKQvyQ+kQ0SCEsMJWk8xa4KtOYFmr9nVoXYAxeCd56VXAUBZC?=
 =?iso-8859-1?Q?vTokasqe+vFnBX+3iWTkIXQUspfJisgEPfjN1ifI29VTiBLkQS2/EzdSmm?=
 =?iso-8859-1?Q?/j2NZmq91sX4lUU61cpe0YfFDGSeHd9CxyZaOwQyKZDrjKS2+sxvTN9teX?=
 =?iso-8859-1?Q?pfMwiKO/PZ/dSiTxj/+Dkk9O1ngYp6B1h2jP/fXKvFCWsvA3ApeKtaWz+X?=
 =?iso-8859-1?Q?Yfxw4gF52MDqTqSBCi34l3rXLprjtid/EGtCrOB070K4uBatrSbF65LIKa?=
 =?iso-8859-1?Q?oYDbhPpOeulNN/APL87Ka4K+jRhqcmmq1IcQi9a2PNdgV235iqJzgaVPUz?=
 =?iso-8859-1?Q?SlGvD0rb3NUX2Q/nohOwJp0CoeyFQQiraXHJ7Upn0JOq5mmipSqmtqDYV9?=
 =?iso-8859-1?Q?m4YoXeWzY3pPiIbs0UH0Q8PG73HgsItytt1LgCtsGGxbsaB4SmosYziLuQ?=
 =?iso-8859-1?Q?SMdoczDOTgSNePL8je99dfUavcmlABb308X6Cc0EbKGVGznym+qFd83udL?=
 =?iso-8859-1?Q?j0uDxms8sWHEKvwavrtqzU5VOp5+GFRqiWhqnMqLpl/r+VX6qTpiw989Sb?=
 =?iso-8859-1?Q?gLHiY1ZA/PNEB4wd/DRKVLq7Uqb6u8BSLEfgUV36AmdPIKc7PBB09scBzy?=
 =?iso-8859-1?Q?0KeIy1ORVF7a/2GVonDvJ9mY9gRnCiMUgUsXzEYESz4HAdG4cOxE+1P5OA?=
 =?iso-8859-1?Q?EQQ3Z93Y6TocXPRk0Y5KECumd31GqxJCUucDF6iSgQ7ubOOlm72FM4Pd58?=
 =?iso-8859-1?Q?ZopOH8Pfw6WPtgJZEbWHA0J29Auiy8EwjuJlY8ZlLwCPLoTQwwRG6iragU?=
 =?iso-8859-1?Q?RBfNmrshCxsjqL0q/ImZDmfpWh7wWKNYVo+/POABTnWHwojj4h79YgEpCb?=
 =?iso-8859-1?Q?g22hF0JxfSqouI5Pd4rI71Zlx1+IqQH7btlDhFpxGRHXuqxj8fk24033L2?=
 =?iso-8859-1?Q?QHI+Wo+LnLmuugOlw3mWi81DWgSGMA8Ylo+iX8h1E62kkP/+RkgwGIrwpB?=
 =?iso-8859-1?Q?ReHRzIpOSutk59DZ2NsvIib/9YvRTTdNZOCk2Rcn83/rIptdOwZb3Pfv9t?=
 =?iso-8859-1?Q?FarsOmpeFs+8fWwWCSbHft4pXEdrSJHJI384BDA1rdm96RnVnGTBgAf4Gw?=
 =?iso-8859-1?Q?ratyebU59pz1yEZxfc+zzwJ+rLH4JXMoBErGt9dhNvf/wtFkJKI719SRwI?=
 =?iso-8859-1?Q?MHiY2sG7W8nuTn8//qmn4xE9sfLbycYxFHMg3E0kmHvAyJw8IyKDx8iNkA?=
 =?iso-8859-1?Q?05NJdmEkfq5fy25SKGzSdcJlXvIuU+qwDqrWAkJfagdTnXGo8eYrdlcTMI?=
 =?iso-8859-1?Q?giFXAJXcKedu3s0Z7AzMlj6YTmHP6ydym8eSyE26MMBL7JO90UOeddBs9M?=
 =?iso-8859-1?Q?oAL1WyvgV6g7WRHSBp4hMFAEJ0qx5oH9KTThdfHRNBSq80E1BaRGJI6L8J?=
 =?iso-8859-1?Q?jo6c5L0uZGWwIFAhx6/ApNFjyAW17cv/LaxCDcbyAUTPikQHk3eOyG0XLz?=
 =?iso-8859-1?Q?UbN2iIdZ8fSQEaMwiQ1vz1e7BAqRD/CXuWs7eX7UHEto27mcdhm98Y388m?=
 =?iso-8859-1?Q?NU+TdBVt395iMQF9zPfC9oJrM9l/rIYqabXKQlbEMOqlDW/VUTIRYONn4d?=
 =?iso-8859-1?Q?+BXNuE5kRQwwBfRRfSu99q4viHRWOZiP7erz2Ay78AMU7o7FxURf85ICDl?=
 =?iso-8859-1?Q?mS6w9DU3pLajcjuDjzOffEkT5GSYIBm4AI0ruGAUYvodHl8o5YOPOoy1/u?=
 =?iso-8859-1?Q?ZoFW9eU0tQEACCOR/Wa0x4FSSt4Sa6M=3D?=
X-Exchange-RoutingPolicyChecked: rbrD7pR/7MnTUvhtnHEmimOeNqtW4K6PGZs44p3JkwXGqN4GXEzp4vfH6STvv8KH3SsuRfwXLvnmBEsc8NZv98kqYu0izs/DzqyGqVXBhnJdjSXgywg+H/iqaDKO6Ogb+EZ4Ns3ASuwH3vgTaxJ3FztBtf8fEoLq8j5YgqKs4s7y17SSQW+pbaaKqyuUbNZ/n5AHRt8Tpz9m/ac46FoOX0s9AMG6ZkB/i3fHadXQlypHAFASWqwSU+KkQd3xWGLNLWAg51vmJbQxjNdiBmH2uUztBTV4HBB8ersnlMAfUpk7rDsfZpLmLzsJae9NIsWodjW5pUXKgyxlcuJWqiXB1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d18875-4e34-46cd-b0a6-08dea6710eb9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 04:29:24.3135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vB/GezI5I5ipawZcEYD4/4v98IRAnTo4Rdhxm8kBX9vjdO4kEpN4OcOJgpl0JbCQUl5Xp8fbJi5haRLTmL5Tkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9889
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

On Mon, Apr 06, 2026 at 02:28:25PM +0530, Arvind Yadav wrote:
> GPUVA split and remap rebuild VMAs using XE_VMA_CREATE_MASK, which does
> not carry runtime-only state. Forward XE_VMA_CPU_AUTORESET_ACTIVE through
> the pipeline so xe_vma_create() restores cpu_autoreset_active in the new
> VMA.
> 
> Also preserve the effective PAT index on REMAP so madvise-applied
> overrides survive splits.
> 
> Relax XE_WARN_ON in the UNMAP path to allow non-default attributes on
> cpu_autoreset_active VMAs.
> 
> Add xe_vma_effective_create_flags() to centralise flag propagation.
> 
> v2:
>   - Move runtime state to xe_vma bool and keep
>     XE_VMA_CPU_AUTORESET_ACTIVE as pipeline-only. (Matt)
>   - Add xe_vma_effective_create_flags() to centralise flag handling.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 52 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 45 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2408b547ca3d..65425f2f1bf1 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1106,7 +1106,9 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	vma->gpuva.vm = &vm->gpuvm;
>  	vma->gpuva.va.addr = start;
>  	vma->gpuva.va.range = end - start + 1;
> -	vma->gpuva.flags = flags;
> +	/* Pipeline-only; runtime state lives in vma->cpu_autoreset_active. */
> +	vma->gpuva.flags = flags & ~XE_VMA_CPU_AUTORESET_ACTIVE;
> +	vma->cpu_autoreset_active = !!(flags & XE_VMA_CPU_AUTORESET_ACTIVE);

Should we only cpu_autoreset_active when the attributes are not the
default and is xe_vma_is_cpu_addr_mirror(), I believe that is the only
place where this relavent, right?

Matt

>  
>  	for_each_tile(tile, vm->xe, id)
>  		vma->tile_mask |= 0x1 << id;
> @@ -2454,8 +2456,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  				op->map.vma_flags |= XE_VMA_SYSTEM_ALLOCATOR;
>  			if (flags & DRM_XE_VM_BIND_FLAG_DUMPABLE)
>  				op->map.vma_flags |= XE_VMA_DUMPABLE;
> -			if (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
> +			if (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET) {
>  				op->map.vma_flags |= XE_VMA_MADV_AUTORESET;
> +				op->map.vma_flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
> +			}
>  			op->map.request_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
>  			op->map.pat_index = pat_index;
>  			op->map.invalidate_on_bind =
> @@ -2775,6 +2779,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  			};
>  
>  			flags |= op->map.vma_flags & XE_VMA_CREATE_MASK;
> +			/*
> +			 * Pipeline-only flag; forward explicitly so xe_vma_create()
> +			 * restores state.
> +			 */
> +			if (op->map.vma_flags & XE_VMA_CPU_AUTORESET_ACTIVE)
> +				flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
>  
>  			vma = new_vma(vm, &op->base.map, &default_attr,
>  				      flags);
> @@ -2817,6 +2827,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  			op->remap.old_range = op->remap.range;
>  
>  			flags |= op->base.remap.unmap->va->flags & XE_VMA_CREATE_MASK;
> +			/* Pipeline-only; forward explicitly. */
> +			if (xe_vma_has_cpu_autoreset_active(old))
> +				flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
> +
>  			if (op->base.remap.prev) {
>  				vma = new_vma(vm, op->base.remap.prev,
>  					      &old->attr, flags);
> @@ -4659,6 +4673,20 @@ int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool i
>  	}
>  }
>  
> +/*
> + * Returns vma->gpuva.flags with XE_VMA_CPU_AUTORESET_ACTIVE injected if
> + * the runtime state is set, for passing through MAP/REMAP pipelines.
> + */
> +static unsigned int xe_vma_effective_create_flags(struct xe_vma *vma)
> +{
> +	unsigned int flags = vma->gpuva.flags;
> +
> +	if (xe_vma_has_cpu_autoreset_active(vma))
> +		flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
> +
> +	return flags;
> +}
> +
>  static int xe_vm_alloc_vma(struct xe_vm *vm,
>  			   struct drm_gpuvm_map_req *map_req,
>  			   bool is_madvise)
> @@ -4694,19 +4722,25 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  		if (!is_madvise) {
>  			if (__op->op == DRM_GPUVA_OP_UNMAP) {
>  				vma = gpuva_to_vma(op->base.unmap.va);
> -				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
> +				/* Attributes must be default on UNMAP; CPU-only VMAs are exempt. */
> +				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma) &&
> +					   !xe_vma_has_cpu_autoreset_active(vma));
>  				default_pat = vma->attr.default_pat_index;
> -				vma_flags = vma->gpuva.flags;
> +				vma_flags = xe_vma_effective_create_flags(vma);
>  			}
>  
>  			if (__op->op == DRM_GPUVA_OP_REMAP) {
>  				vma = gpuva_to_vma(op->base.remap.unmap->va);
> -				default_pat = vma->attr.default_pat_index;
> -				vma_flags = vma->gpuva.flags;
> +				/* Preserve current PAT index, not default, for remap */
> +				default_pat = vma->attr.pat_index;
> +				vma_flags = xe_vma_effective_create_flags(vma);
>  			}
>  
>  			if (__op->op == DRM_GPUVA_OP_MAP) {
>  				op->map.vma_flags |= vma_flags & XE_VMA_CREATE_MASK;
> +				/* Pipeline-only; forward explicitly. */
> +				if (vma_flags & XE_VMA_CPU_AUTORESET_ACTIVE)
> +					op->map.vma_flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
>  				op->map.pat_index = default_pat;
>  			}
>  		} else {
> @@ -4715,10 +4749,11 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  				xe_assert(vm->xe, !remap_op);
>  				xe_assert(vm->xe, xe_vma_has_no_bo(vma));
>  				remap_op = true;
> -				vma_flags = vma->gpuva.flags;
> +				vma_flags = xe_vma_effective_create_flags(vma);
>  			}
>  
>  			if (__op->op == DRM_GPUVA_OP_MAP) {
> +				/* Madvise MAP follows REMAP (split/merge). */
>  				xe_assert(vm->xe, remap_op);
>  				remap_op = false;
>  				/*
> @@ -4728,6 +4763,9 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  				 * unmapping.
>  				 */
>  				op->map.vma_flags |= vma_flags & XE_VMA_CREATE_MASK;
> +				/* Pipeline-only; forward explicitly. */
> +				if (vma_flags & XE_VMA_CPU_AUTORESET_ACTIVE)
> +					op->map.vma_flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
>  			}
>  		}
>  		print_op(vm->xe, __op);
> -- 
> 2.43.0
> 
