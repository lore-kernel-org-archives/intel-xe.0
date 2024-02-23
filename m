Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389B7C5478C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Feb 2024 18:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E051710EC74;
	Fri, 23 Feb 2024 18:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FunMGpGV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF9D10EC74
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Feb 2024 18:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708713305; x=1740249305;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fzIaG3IZljAJvJ1rcJp5obhmjUDCC3EuyHEa6y9eBJs=;
 b=FunMGpGVXw+uD5Naj/XC8s+qWqxsl9LdZ4hwxpAJUEZV/HGzjDJgwsDx
 deU6EvQ3m+UT13bcn1iZAhA3HeG/bYdNSzn0ALsehKSdChREWLaymYVfs
 2Njsk/AAe9Kkid67LI6Ohmmt+cQ0jBbowI734vsC06DUU2QXRlxUL4AXh
 9WZs6vvXCONAhDM2tqRgckbp89qsVedcrxkfWslmQW95AaoB9Tu5WcZG8
 gCqh/fRtgnzlGk5dF+Z8laLqH051GRtc2Z9mvKCfl91Am1GwehFfTMVCO
 OsOrfIdzczGXHXL4bs8H5IidbaSkcBncUETJ3Vn9ANcoFeyNiHbH+2aIB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6828784"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6828784"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 10:35:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="10691467"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 10:35:00 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 10:34:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 10:34:58 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 10:34:58 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 10:34:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwKGkb5ebSrRjXo9GElHJ2jmDUsASoRjmaUJJqvBLCpreU5T/QtVAEvDvOt26HDwUbjS3VY5iSLYTSGIkPD67lFxaoRJ7VW4CoBrrUmO9Idz/ahcqVRrCw4QNA1zggcREFV1kZQ4dzzdjwD3lHkHX2nJtCAuwB2swWI92AKcqr3XIJWvol2HuGQqmai6SQOc2eDhL5ZnZDbcNPmuIP033G4RjlMDQ/m8bJx2G+EPquf3BEs85WC/u4iklUnTrcoivF0u15ANzHQa737yJ0LZ/7MboQEjYbjjpqv9FhFovBI8OahEXelywc2P2GSh3ATfKZ+1hUgOzTsM0TUzkQjjuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6PUygLYKFtoU/fENqi3luqhv0Q32IaqLuBSZOh2eIA=;
 b=jB9GTLSdiHu+ia0rmkj8BAF4ziTqpnGLw2U7Dvb/AfOXz2HEc//w8fgM6m/IHZhQc8BXrv8hNTvovOuxNiNNtxOWykZZOGFnvOl/NfC6zAFr67W+aQVH9Zk8MzmI/RFs09Cr+Gq4SIFLcd2H6Mj4AHvqUAyZa/kh0zy0Hs6GU/BhYpulcQQKwScBKT9nJ382A74U0tJAx0x7C7oADGPNAw0w9bzZbiytsXrkwz8xUWwdgXRPfB+oRgCAeRSAKt5uVHN3f2GZXjnk4wlmtVDgUp4KB+v4uQ67YI9UY8uwyPfWHlMGQWfQ+CpnW2eMrizHB9T0xemcqFVR4txbjQj+rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6836.namprd11.prod.outlook.com (2603:10b6:510:1ef::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Fri, 23 Feb
 2024 18:34:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144%7]) with mapi id 15.20.7292.036; Fri, 23 Feb 2024
 18:34:56 +0000
Date: Fri, 23 Feb 2024 18:34:18 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Paulo Zanoni <paulo.r.zanoni@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: get rid of MAX_BINDS
Message-ID: <ZdjlKkv1Y+hFkV3S@DUT025-TGLU.fm.intel.com>
References: <20240215005353.1295420-1-paulo.r.zanoni@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240215005353.1295420-1-paulo.r.zanoni@intel.com>
X-ClientProxiedBy: SJ0PR05CA0124.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e55ea3-857c-4e5d-ac08-08dc349e225e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KcapX/ioqTFoMlK+UccQ+Qkr5VABsA+s8Dg5zBxnaA4npcdlXsJ37wOkZp9FiIxoGn7CeVfUhtbkULZLoplRAgd6YDs0jPmKMYeG1XyKo+szXeDJRvrZCEwCHtfWoZAJSVocSi3g80Do5myb/jEAbHPjDUQfv565GjKiohigBZ2EOkhjXl4OmbSW43GU7rnyixbHQ889xzIfwcZl5u045nwu576WT+n+jtissqhiLxtY+32VvSKgAImE3Vyntso2+UIRbq+c1ICzxQsmrMJpboqYwJlpElCV98tARwrXKqVg1FPggZ1zUq1+rvXEvEL+HXl91gHu1YEVw9ZIik91wNIbdXh19SCMNNzQnVd74EDMwtNnMLZyngvhcJvA4QE9cY+pOcNGr6yfM5SQbhbdrt2sE7d0iWwLXxqwOE6W/ZsGajvPH9dzzJAnUrrBgnHSw0MhbP0Xi1My4WUKPqcPKGhXzFDtA+2ju8kvKZOK6wJ3NZXMUAoOR11INmKJDb2ATFc5z3/zyNuA+FmB5yBICA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?owZ3in/gL1H4gPBloELzY0uf17BmUrJssBsZoauwejy+bdfQ/sPH4hdl76A4?=
 =?us-ascii?Q?DO037HnYotxVlD6jvheurlCwrI42fQPGx9hNCJbHeGI6b6YeRtDAg+kMeS1c?=
 =?us-ascii?Q?r58w0ygmw3T+fzAoOnrtDV1Dod4I3ABoSX3bDnrRpb4sH3oR8r9oKysHsE7E?=
 =?us-ascii?Q?DrnT87WdAHk7AsU56l4XfQTWlYxmm8zKDbF7+kK0im22gbeSitWUgG4Zbgi4?=
 =?us-ascii?Q?o2lbht0Tx74FB5w5f8E1eC2XC+moaosCmNT+EckRTa/I3q9pNhXYid7hWgX3?=
 =?us-ascii?Q?JI/wMZgLe/ZqigTk8AyMGdzcTFuU/OfOxBzIGYLa9Rordr1Fh/Ij7dAJWU4g?=
 =?us-ascii?Q?pfGYGNtFD0HRAyHuXyk6/DcD1ZHIcuiZnh1ggIsb9yoE/yPlxfga+hFPufmb?=
 =?us-ascii?Q?5f3FgtVutwlDxUQ2P3AotzKjx9LcRBQ6K0Sm4mzNm8Ix+koSeS/ynq6qeBQQ?=
 =?us-ascii?Q?kU4gU90IMkyWZE92JC5akJrlSkJP8ZaIWfrGH++VWt1d3CyVxr5sQPPKWeB/?=
 =?us-ascii?Q?qaCICdiXAZQTiwfonf4brKfRFjfsFWcqu36/SUpo3Fd4Axv/Vm110O9t6iUN?=
 =?us-ascii?Q?OKWhTzuPmOoY5gAkNC4cD1WBNQGJCTcjDzYb3oQVeQkU2DJRtIq35ubuNVKA?=
 =?us-ascii?Q?cZWcw0Nc+e6EM9nO5W6X1RIwndaIz2R9thd3NUrwingi8KXEOkgmh2VQswbO?=
 =?us-ascii?Q?ihEEfJthjRjWGkarPALKCU2dzqLi96zaYNX3HwXGpCO2leEOmRXFRjlXtFbF?=
 =?us-ascii?Q?A5h1dpTHYoyTFWami3nFZUriByaD+PCOg5b+0nF2b3vTaHk3RLry5anoKKqP?=
 =?us-ascii?Q?N3oeFKrbmHEZYaFC7I8ewPs5UFKZmlHEfp9CkN+ApcQ90/QdnvkqEBO7ocLL?=
 =?us-ascii?Q?HjgWmK4wubvIun1EjrGD7y9Ze3Xtt6HysthKK45c/sGHvtKcdsMWPdiNZC8q?=
 =?us-ascii?Q?0wgsEBfMLhaf0EaYlEIMA4bp2D26b2U+DJcDe+iFXuqefFzfUH+QNmMsiU+z?=
 =?us-ascii?Q?ZdAll8xU3U2JBCVzV7IIuOlV9ZIaELtazkV3blBK6MwJHjhdX671pY6E/q7V?=
 =?us-ascii?Q?ypjDnMRYlKVffPWGFnCqdDyeGeRyHUB88IeLl9RzXqq5PQv+Qf+5fqK/94ih?=
 =?us-ascii?Q?2AmGauqXv8eoIS+MI0pPYaHvY09XHEY0nDq9RBizO3iXRr3sEb9PTBrNCbnv?=
 =?us-ascii?Q?zEFwYEMd4bA6EBowGKqKvu+i5eHk43ShvZe9bls7090xSb8NFlbGCyDfqM3F?=
 =?us-ascii?Q?kj7K8JiH9NGu6W6/PFbGmLjrqlq5pWAlVDf7WWCDz1bdDXoVRzHc46eCVX0A?=
 =?us-ascii?Q?JzCltsrpjWQ7FwSkBZSDOOSe6W0ic8a/Cq9DK+ie3eiuK7gOV1HQQxLDaD3M?=
 =?us-ascii?Q?1Og5dNs+hSDICwHzpcIWbLY+A0Sn67IQ8gE3kwbUir0CZTca0h7aUUqPHKRd?=
 =?us-ascii?Q?ygLg7QhyK67OOaktd4aMr0ObNfyIrokL3g0y6QLXpeyiY330ML5MBonhgL8b?=
 =?us-ascii?Q?oTiykIcTKzRUPMBvGgIq98DK8WO7Rxs4xNML1H4iGDu7hJkJrJZPCSj7bUEF?=
 =?us-ascii?Q?rNfFZ2NJqrqV4UvkGGUNBE0LVtnHW/Vw9pCeUEtECv01VBMeY8eXjPMjRSin?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e55ea3-857c-4e5d-ac08-08dc349e225e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 18:34:56.7237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekMiOo8lyQCdKBvSKGbbAME1e5Xs1e85/W/HNoTEoCs5zbskv5lXSfZ1cW2ipvjx6As0Rb6u7d+XWt8vueKtUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6836
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

On Wed, Feb 14, 2024 at 04:53:53PM -0800, Paulo Zanoni wrote:
> Mesa has been issuing a single bind operation per ioctl since xe.ko
> changed to GPUVA due xe.ko bug #746. If I change Mesa to try again to
> issue every single bind operation it can in the same ioctl, it hits
> the MAX_BINDS assertion when running Vulkan conformance tests.
> 
> Test dEQP-VK.sparse_resources.transfer_queue.3d.rgba32i.1024_128_8
> issues 960 bind operations in a single ioctl, it's the most I could
> find in the conformance suite.
> 
> I don't see a reason to keep the MAX_BINDS restriction: it doesn't
> seem to be preventing any specific issue. If the number is too big for
> the memory allocations, then those will fail. Nothing related to
> num_binds seems to be using the stack. Let's just get rid of it.
> 
> Testcase: dEQP-VK.sparse_resources.transfer_queue.3d.rgba32i.1024_128_8
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/746
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>

After reviewing a few other DRM drivers there does not appear to be
similar limit in place.

I think we need a fixes tag for this so can be included in 6.8 too. We
can add this during merging.

Also I believe the kcalloc tied to user input should be replaced with
kvcalloc. I can post this in a follow up a bit later today once my dev
machine comes back online.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 836a6e849cda..63340cf4d587 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2720,8 +2720,6 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>  #define XE_64K_PAGE_MASK 0xffffull
>  #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>  
> -#define MAX_BINDS	512	/* FIXME: Picking random upper limit */
> -
>  static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  				    struct drm_xe_vm_bind *args,
>  				    struct drm_xe_vm_bind_op **bind_ops)
> @@ -2733,8 +2731,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, args->extensions) ||
> -	    XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))
> +	if (XE_IOCTL_DBG(xe, args->extensions))
>  		return -EINVAL;
>  
>  	if (args->num_binds > 1) {
> -- 
> 2.39.2
> 
