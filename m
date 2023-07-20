Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40172EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 21:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1114F10E19F;
	Thu, 20 Jul 2023 21:10:10 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A6610E19F
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 21:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689887408; x=1721423408;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lJX6ISSRXqCGGDiUPsa/WjT1ifHCOq6FW7DbPWyA4WE=;
 b=aeF3zY46BmCCavDCyFn3K2MAGiRnRBBPGMqGa76H7rRuvHptiVutjWQr
 kfXrQmpjCsiZ0MEYmSH93hjfYvEBKSmRXH6ezqoEJAkatdy9PXiXo1z28
 mbJeTmHV4xk/aBPzJqcrzixQTqI0HGOw2f0nKwMTScekklIciqs8aLvmB
 U0thIIcBkFBf011bj/mw9A/axvwdz1Qd0C8tOrVTdJFWcQFoHV7/OUGbv
 +fDHVWfpaeFE6AfUHan1yPrfKxFHW0FAR/KKBW1Q0bAqVKhaqoUZI4CDa
 pcvaHRxKmKZai2OoIcH++JAvmVGOXdmSB+FNpHXbGfjk3HLzQI+CrrSMw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433087037"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="433087037"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:10:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="701801327"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="701801327"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 20 Jul 2023 14:10:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 14:10:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 14:10:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 14:10:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 14:10:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSIACefRihwSE/S3IDIIuGKpnwL6mEBLoN28L9oST09dl9USDBzf/RJZQm9RH1B+Z/G3z5Qow7Fb/Q81T4Xs5Mlw4Hoq7VXl/EWSkYv4z9uGGeFZKEhmxNulhjpEcTZMq6Qemqv+jW6PgCRTBmbUvcxliCdMNIfdG7Y/pkQ+P76ekD0F3+xVEyPVZO5GgtqzJhHWcKPl35R2O7+FaywI90eFIG5jvXCkYBXMpBqmB1dmmHX5wvcvZiepvABv/skdn5/1BPtKQ5d9sxG7cJd7skNaTJs2KQRGcE3Dr7qVSNfNxOkLt13FHsTG8XWvkzTc1YKK1LCn4KGIz/XlVQ9msw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlE0DD8D6YuIRIPaoQ+buuDat+wYcrc4sHLZrtq3WM4=;
 b=CbrIBnI9vXyX6DMQX8kQBd3lvxJvOp/qG0GOOlKNLUk2cPjI27iH1/nY2FvJEu5W/ATmYuw45jYe0sU3I1p0YnPQdB0HZt51CEm+9Bg5R3b9pgIRLRkRX5miTtyfrV2fO4OvOP44GQh7ybLuaLI+w7PZR09mHgiZWBG3zJlQQAgeZxHiaAgviv7xE2iKbuD8HBeVFTPfZRjJGutPw+U5FdXEW3i3KQHaTOixXVL+RW/ohp26zbj8bF+o0nRu28OHujbcoCcdV+0POEUSE1zmQcAz/DtxH0KcrU1VbvWvqSgdjDXPSWxTed3GM4x7l5ztuoZTY6LoGgHoc8YRddh5yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB7698.namprd11.prod.outlook.com (2603:10b6:806:332::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 21:09:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 21:09:59 +0000
Date: Thu, 20 Jul 2023 17:09:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZLmio8CGxE27hUst@intel.com>
References: <20230720155546.199766-1-matthew.brost@intel.com>
 <20230720155546.199766-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230720155546.199766-2-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR01CA0045.prod.exchangelabs.com (2603:10b6:a03:94::22)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: ca63b6d9-5ac9-4d20-5af2-08db8965acc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RGAs7m7u0q/vqvdyfu1xQXfZJ3JGK+sZ6E9Ltu0IwASOxQfespJF+zZpF133WbYTwhWhOb+9DFjycZlDIa6MLA08TnosbJG1eAcV0JK8qSCXN1B4b3qGo+vHlumtcp4lYQZEU0ofz8PbjXAAqX6i7Ye+3Qdj8eBN9jVR6L90ujKozkS/WLclxB9+WTuUoQvzzRvvQ4jaw7DmrjckaTRVwYUtAPR0HQ9Bf4LINVbo0YjiianMCAFU4HzYhj6PpVG+hRd/T1N/NLMQVZ3y9ppY6C0TrsxnmftGL+3dqLHlFn4qEG76PxAhv1AT9EraGeZTT54JvZftF802MMRVyBiP4n5zMETHxsBlz+Z1nCfRjb4GFZIoDE7lzXl/BGa8OHqPlIlnQkPd994EA4OFU3CTmUOgV1YsWMveOy6sGjTneavt4xiEXbBYDnzD7mKzQat2OgWAuxNJasA25Xe2faGG/wtbT99CcrixuGLjMtYa5P09ydXfynC//9ura3Ur3nQRez6W1x1/Wt6xbK0UbgbDssouQTrx9pxBz7rzGJHLSpW+paJoNutNFReFY9uSRDUy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199021)(37006003)(86362001)(186003)(66556008)(66946007)(6636002)(4326008)(44832011)(41300700001)(478600001)(316002)(6512007)(6486002)(66476007)(6666004)(6862004)(38100700002)(8676002)(8936002)(6506007)(5660300002)(83380400001)(2906002)(2616005)(82960400001)(36756003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hxnaLGMFjEGZ75ZBZfvP4dzOL6Uytw+8QfsgJdGfolM7TuyClaSTosQSeOcY?=
 =?us-ascii?Q?wsEzB84R640r7cf7gPpHPhUb2JHXm1DTPpXqCAWoEyOyBeRPhfL7zkTZNr0v?=
 =?us-ascii?Q?8OE1F+vaUAHYyGeD77onpDt4uQUIHx84fQ2Zqim6zFBqKU7C+LHLmiRGwf72?=
 =?us-ascii?Q?Wj65vM8EtjPebNKIJgP33G2SNgGrnOrGFIQrSbRJbSDnzbJ5BP3wph1T6wpI?=
 =?us-ascii?Q?C/As/oVfHHKOkQPEIwqwEC1xHVljSWfJUaGxdWd1Y8+xvBIIhVc1J8GJgapN?=
 =?us-ascii?Q?bpvNqQS54znIIXo4eFsLSmM29VwZzYK2lU1Uh2vnZGJzTirAw7ivZ/W8z/UH?=
 =?us-ascii?Q?08AndOqPbqGrWZAvm6u4qpXBCxY7r4Kv0AxbzIIJvbW8GuocrLZxSAfvIukg?=
 =?us-ascii?Q?/GCjkPjr4fpbKBdWTqEdaEr9GD9xJwNH9HAlXZK6A7FmxGNWBb2qsOEOtMv3?=
 =?us-ascii?Q?5vaAWzwR1gVP23EDVw0uksJLnJq0GT/YByu7RwrWfkt6ljkUrK3ABOtEhAyl?=
 =?us-ascii?Q?5j69mxRfudXb5znoaGAPZifZXov3IiCcuekgkPgIqqBHOOwRjnhwe93qkfVl?=
 =?us-ascii?Q?5vSCKpLw41GvaqV9fBfOuRBEersBwzHN9xnAkcaKLW5wrOwOwo09aSWnH1MC?=
 =?us-ascii?Q?nixB6uBSsLWsB3yx73OQXprG3a9LgyZ4f0E079G3Agf5s9YrOiQ3Jgc0hBkl?=
 =?us-ascii?Q?0fnX0Hre2JJZOJHmf0ooJ84enIXXHsZDoOrZgByuNjUHtBUEWoK6jQgTD8MH?=
 =?us-ascii?Q?7q3a5CqaFmigqf2hnh+x59b0OWn9oBJ3ilJk+YbUKNUOI0JOHh1ZEvvHk0fp?=
 =?us-ascii?Q?iEaaKjUljgCUYE2zNDuSnfoAAoULFKUUiquc8dxo8DYgCOOe55jomX0CWN0x?=
 =?us-ascii?Q?58iipBaPuwTghhhl4pzjL+E8W9PYYCQAF/XK+KKBCpfdBx7MLz47owjYPbIB?=
 =?us-ascii?Q?rp72JDhUyN23q6yJDs+Iv5gLZXegQhLEYw0H6JXe3nKYxcSyRHvpJzH1KQjo?=
 =?us-ascii?Q?fY53/Go6UYhrD3PBnPBdObLj4CILUiBtB7z/EL/Us5ZXT/Aht+/0+g1a0fxi?=
 =?us-ascii?Q?roZYlUMeTD/SDNZngfNnq5cytM0vx1lFIelJ0HmdllCHb/aVMyKfstf1gzMa?=
 =?us-ascii?Q?a4jnHfMkklkEbDjkoV8x+8sBWezy3FzccllC9csNkLGIzW5ip9wrM3koejm6?=
 =?us-ascii?Q?yXt15zykQZmEMcRsbWgy8ccpQ7m9S7tJPrQlo54UOdighuUF/mVFI8sKwlui?=
 =?us-ascii?Q?L52I8ReXmsIovpv8tlhxtPPeEvOroI0gfqcb2jDxJRoHrkAMCZx03CiE9lP1?=
 =?us-ascii?Q?YhGaQL7pNZFwvj8V7w+HIW1bw7tFhU7vDRXcd9TUv8MWUrwvJ4SOsEjK3R53?=
 =?us-ascii?Q?QVCSKsxvK4Zd5WAEY38TO0wytxT0GSUgrcVmJjnjeaJg8n1dLfPf17SLoo/a?=
 =?us-ascii?Q?dkgPTrz++PpLOLrIRhldz+v8Yytdy5rmbePepIM/DJruACtDA7msODA4OKc4?=
 =?us-ascii?Q?JRQ/CGhAQoDMwD33gsO2jt7KxE82V16rwV0a5wWxJP7UFQC1qKhvZavlyb1f?=
 =?us-ascii?Q?XNfanuFJng6GunRs+l8NHd7iOg3SyEZS+KHJQD16xH9QFHrfiYH2ZybqeNd3?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca63b6d9-5ac9-4d20-5af2-08db8965acc5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 21:09:58.9566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pw5PYUpFvaFlB+ytq4jtB7SuY2ard2Eh04SAytmXh0aIYgasc/B8FpmBhO/ElhtU6e67WYE+wffScBrOk6MEXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7698
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 1/7] drm/xe: Remove xe_vma_op_unmap
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 20, 2023 at 08:55:40AM -0700, Matthew Brost wrote:
> xe_vma_op_unmap isn't used, remove it.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c       |  5 -----
>  drivers/gpu/drm/xe/xe_vm_types.h | 10 ----------
>  2 files changed, 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f8e6f1fda1fe..63c9e1c94515 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2516,11 +2516,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
>  					xe_vma_size(gpuva_to_vma(op->base.remap.unmap->va));
>  				break;
>  			case DRM_GPUVA_OP_UNMAP:
> -				op->unmap.start =
> -					xe_vma_start(gpuva_to_vma(op->base.unmap.va));
> -				op->unmap.range =
> -					xe_vma_size(gpuva_to_vma(op->base.unmap.va));
> -				break;
>  			case DRM_GPUVA_OP_PREFETCH:
>  				/* Nothing to do */
>  				break;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index bcbcad1929d6..ce26298d7a5f 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -333,14 +333,6 @@ struct xe_vma_op_map {
>  	bool is_null;
>  };
>  
> -/** struct xe_vma_op_unmap - VMA unmap operation */
> -struct xe_vma_op_unmap {
> -	/** @start: start of the VMA unmap */
> -	u64 start;
> -	/** @range: range of the VMA unmap */
> -	u64 range;
> -};
> -
>  /** struct xe_vma_op_remap - VMA remap operation */
>  struct xe_vma_op_remap {
>  	/** @prev: VMA preceding part of a split mapping */
> @@ -408,8 +400,6 @@ struct xe_vma_op {
>  	union {
>  		/** @map: VMA map operation specific data */
>  		struct xe_vma_op_map map;
> -		/** @unmap: VMA unmap operation specific data */
> -		struct xe_vma_op_unmap unmap;
>  		/** @remap: VMA remap operation specific data */
>  		struct xe_vma_op_remap remap;
>  		/** @prefetch: VMA prefetch operation specific data */
> -- 
> 2.34.1
> 
