Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78755C48BF6
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 21:36:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C4110E604;
	Mon, 26 Feb 2024 21:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJgwu5qz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAE510E604
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 21:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708983414; x=1740519414;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7pnhzlAVhav/dBd354kyztQxGa9RTiwG3RTBatTZC0k=;
 b=kJgwu5qzJ+QSyj4D6VRc9kg8NAIekC06DyxUMXcV2n48mkDQqdwd+lww
 5yyrWLBws5/xt2PMdFPZBd80SlKK27LAlmcC9NIiCJKoeS6UtsRePM4Pu
 gw3qZMipkroyfQMd3uOk/m/S7WI1gvWCcNiEbIQCAXl21Uyw2iM0LCyVG
 Djx6McDXnh1R4FGa3KSvdVGJMVsDv3hKRONWaXLXqocidPra3NIL0nPKk
 mAMj9bZ9voGhvzXTfbVZJAAFugqszm6VAm59qqYp1agf7UdfLlbL0cYfE
 Vg/TifNu8TZMbO8l70t+y7dYKbNY0HkV2of2CNwrN8CcvgTRKJHhZlw0B g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="13939201"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; d="scan'208";a="13939201"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 13:36:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; d="scan'208";a="44293853"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 13:36:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 13:36:52 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 13:36:52 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 13:36:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRTZPG5dUE3cKYQkp6PjJJEZiCb3rjjGojkp0QCAfYSMsS8ik2MekZ5nxi0vZEZGEfhWS8yWEYLUKwI0E9NXkuRMXJfzoJwKNkii5Ris+KAXsWdTGTf2KPaciKjiANWmVxllt0dXULAo4zRO+oIPfzrPtaG6YpBiw9eMrQ+McHcLPOKjwwYsyFsxOyZb/BaGBCvrI1ulyvKLvJdwuDXUkXfCkPueHHtZytyExzFbvLPMqoRMGLe88VA2n4JFkQM1lM805JDLNSTQmu7HZlbmIEGfKUIsJsvChny4cyZLHMmsQVzxtRQNo44XOSniOgfHzD1C+gkGMGO4TMhuZg+ERQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70r7NK5RLyRXaA4Rl2TD99J/E4eyPNjVBfvHGcwJR7s=;
 b=Vpf3YkarU6+oHV0OGPhrM4R3Jhc4fU6pjTOs0pVGE9oE0MOKi00Ahb3bjXMGnaxGlmglIp+zwwDn3bjp5qadDOpZc39jyPobFJrbqwE/i6w2ReZXDcYYxBkG3qtd2sksOwiGMKRym5/kfg2l3gCKh0y62pzl+LNxJIn0XMp2dPYyDpJQkBKlc18WOq2IVN1n8a06zdgAv3p0k8pibGQVpOtBFRoPjcPauHmmJz8YLBjrogXFvHJnM2IS+kQd7nPFYIAXz+krapP7NcOmy1EO7QSQcvgb8jVaxAMFqOZ3yPoDcxuUliE3L0Z7eI3N0MsNjtrdRrlRtmYPK7vcIh4GeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB8192.namprd11.prod.outlook.com (2603:10b6:610:191::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Mon, 26 Feb
 2024 21:36:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7339.022; Mon, 26 Feb 2024
 21:36:49 +0000
Date: Mon, 26 Feb 2024 21:36:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 1/3] drm/xe/bo: Forward the decision to evict local
 objects during validation
Message-ID: <Zd0ET4wyT5MAOYWn@DUT025-TGLU.fm.intel.com>
References: <20240226164455.10179-1-thomas.hellstrom@linux.intel.com>
 <20240226164455.10179-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240226164455.10179-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b82d2e4-a5ab-4d28-ef4e-08dc37130a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ye1/UZjmRibViBJTS3biVOA6BUUCJ7KKFQSaA0sCYIltNpsNzjuN/pETuBnBCyB6shbmFbC90iRwb7Hn4u06K+MwQKE4W7RChhvvvojHnujRgY8py2RxE3dGOapKohdsipWCMycLfTP9gS6reSC5Ctnk4Or8ZDHd/8vwiLBRksA0MFQyqogU844TcKcLodtoKK25GGo4rmVv1Bw7xGt0H0pkdnA238HTHH/W/g3PN/W56QoqxkZ2iI2rcxij7sN/Cg+XUpCU3zeK2iTgyGetgSjZXidr5FvbEvwuh4AIISLhAzUf8qjh9yG+wEYFVyDV6U/YXTa0jKqKWGH+a0QlKMIh/n1pDe+NmlfDyObe+W+5xdAaLDQzuy4r5kIfbPwFF6YAAam8ndYOcQ/K1yd0nqGcze4ir+/+5MR2mNMnZu3+I/b/NIgqbtDgIFBWAkh1HDeLnxzLk2GzLAcD7xpPv2lVOus9DwzytGzTkBb+47sWVPKmPUfQKGNp9ORyqDuQpaAd1T6EkBmoFsNMTf5pXDXrTEbRqBfcdiv0/RqPucVbC8KZu7HhX6TH+FB7BZ+n+wR80F4aaImptyFNt8c4n3MDDe0kj7viDyI/OTmZzzNv4Z9swBPWYeGPp9Y+kN8WG6RYG+tEKdWYy4+egXBJ8pJQGGUTEHkwHN1i4h80nDg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jSqjcl/tYhe3EBrcVAjulSpXDNHNKYO8mWy7qfO1BYHwsevUvjna+JV+5u?=
 =?iso-8859-1?Q?6e05sihtZbbVvaR4u+LDvy9saIBcM9K85n88a45v6MV6HPkZw56Zx5EroE?=
 =?iso-8859-1?Q?w7sb9kW/bH80T7tYI0Lnn8OMw29mv5b9goIcXAWrAcC4hdJp46vgKNLXue?=
 =?iso-8859-1?Q?Wr6cfd4EGQcD3PTv0xwjVczZVemnCjfzgGGb3AktkzfSuTNYk6HuEYi4w6?=
 =?iso-8859-1?Q?ul+7cJvNVtE88sSV7c5lurQIUyi2fjVmbXIz+l6eYAM9TulP0RRnAqmdUF?=
 =?iso-8859-1?Q?klvX9EgxKTZXNwVOeN5HgN2035ijclQfL2yylvTu8PTjAIuzwcsHVou60m?=
 =?iso-8859-1?Q?byFtVb6MRIEtbMg9ogxLTnCiua6K3feWPGf2twAQqEDgCwswTn8olktJOm?=
 =?iso-8859-1?Q?9zEh5GE0+igiZ6oN8isH7MUAB81CjIQ9JRWwTkFVBmMaFTt11mI6evvoF/?=
 =?iso-8859-1?Q?Liu7s53tQVIbLJV+xHTVbgPvMuXfxwwLTWe8lWoAN8nJ9UHPxSW0Yjl4yy?=
 =?iso-8859-1?Q?FHaTXSZIvhbtvzBAJe0gY6JryTBVBJUGf/l5ulr36bpCWXjnhQcSJfUYp6?=
 =?iso-8859-1?Q?3Hm0BJxj8NVRNQ2l+E2uDNgG1sN3XslmEXweJKbGD6tyfNHxBYu/Niem4X?=
 =?iso-8859-1?Q?1CxdwYi+RmwGWOJk4gF+kKmWJLmTKLaKZW35197//L7beLrxa0OvN78xJ6?=
 =?iso-8859-1?Q?I4Gzle4tyfo+HARHYA834mNOgXNIYfojyU/VoOa5MWupWvAplXpibWZEGm?=
 =?iso-8859-1?Q?MQAXaIu4xV3kitUmLRsDgd9iMdvOdV1NFQEEpNpBZ/jVoXR2edNCR+ozkN?=
 =?iso-8859-1?Q?AsSgvlN4ih02otz0SmHqa1w4fIt1rbk5MlgrcrYILCXAMeoDvPISl9Ofg8?=
 =?iso-8859-1?Q?KOAA/L/yetypSabaILkgWAP3FNXLxDNtf0gsNERwhbPio3op4gy6dcqv9S?=
 =?iso-8859-1?Q?X4jY3l3/pU9C4FUuJo7uXde9mm8yRqD0i2EaRMBQc+YDIzjqWJ03dSChHF?=
 =?iso-8859-1?Q?DzBvqTzor75rEZdwfsDC7A7SV5FG51TAgBw/pTpaU6gVACYOYQWysZECMn?=
 =?iso-8859-1?Q?tKx3ByNFd3zCDM/ynLmZ8Ki3Gk12aWlr21IpeobXl0XmKVnAkKeNgq+H4i?=
 =?iso-8859-1?Q?yyUFM8n9FcEokz4QBs5s8kkORQzwu4wHMCxbp7ydnXEpNWzZ5Gr6Hg/3pg?=
 =?iso-8859-1?Q?UCbAw1UGdFtypV6bhd8PD3MIaECeCh7kqdzFIoYnGRcyfCdP88GlDMpJyD?=
 =?iso-8859-1?Q?EHs0YOOiedAZOLolUFKutKk93NaOQeRj+yrgW6iU2Sh0ka8z563zLIpe2D?=
 =?iso-8859-1?Q?yq7JlCbaL0XeNZZzZqTRN8bUXb2Ww7MFli56nlibr4VJLjYqrfvIOFd1t1?=
 =?iso-8859-1?Q?wcY37cZkkW4zJI1mVU02lhetM2KXqM6yZpjed+woByqem2Ix7wJZsSO+b9?=
 =?iso-8859-1?Q?Uh8NzrVVYJvNK/QgZshQtsoua4PFIuqiP2eYpx21ZQNd2C+EoJcZzawCZU?=
 =?iso-8859-1?Q?v+41voZ4Q67r7Rh58NBLmAG+sLPCHbgUtB3zSaA7mXDHuT0CChV5v7mY2A?=
 =?iso-8859-1?Q?XTjNTcONxKElcEp7huNnFCyHC1he/GpspCFNbsfdnDrxuQorh2KZ0uxryu?=
 =?iso-8859-1?Q?fWZvjiiZwlK+FWmXVeGxYZSLkDRQG53gGgOnk2HPImtVA53TjnAZhrvg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b82d2e4-a5ab-4d28-ef4e-08dc37130a34
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:36:49.6156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsWM0cYwceb1vJnoLcmv2cYFcaFJ6fLJzqQxu9hk7HGppHZNQ4sYBabtmMbn/oik7MfTj5GIeSB7RNb49h+NTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8192
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

On Mon, Feb 26, 2024 at 05:44:53PM +0100, Thomas Hellström wrote:
> Currently we refuse evicting the VM's local objects. However that
> is necessary for some objects. Most notably completely unbound objects.
> Forward this decision to be per-object based in the TTM
> eviction_valuable() callback.
> 
> Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 17 ++++++++++++++++-
>  drivers/gpu/drm/xe/xe_exec.c     |  2 ++
>  drivers/gpu/drm/xe/xe_vm.c       |  8 ++++++--
>  drivers/gpu/drm/xe/xe_vm_types.h | 10 ++++++++++
>  4 files changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 76dfaf1cd200..143d93632253 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1049,6 +1049,21 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>  	}
>  }
>  
> +static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
> +				    const struct ttm_place *place)
> +{
> +	if (xe_bo_is_xe_bo(ttm_bo)) {
> +		struct xe_bo *xe_bo = ttm_to_xe_bo(ttm_bo);
> +		struct xe_vm *vm = xe_bo->vm;
> +
> +		if (vm && !drm_gpuvm_is_extobj(&vm->gpuvm, &ttm_bo->base) &&

Is this not redundant - if xe_bo->vm is set then it not an external BO?

> +		    vm->is_validating)
> +			return false;
> +	}
> +
> +	return ttm_bo_eviction_valuable(ttm_bo, place);
> +}
> +
>  const struct ttm_device_funcs xe_ttm_funcs = {
>  	.ttm_tt_create = xe_ttm_tt_create,
>  	.ttm_tt_populate = xe_ttm_tt_populate,
> @@ -1059,7 +1074,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
>  	.io_mem_reserve = xe_ttm_io_mem_reserve,
>  	.io_mem_pfn = xe_ttm_io_mem_pfn,
>  	.release_notify = xe_ttm_bo_release_notify,
> -	.eviction_valuable = ttm_bo_eviction_valuable,
> +	.eviction_valuable = xe_bo_eviction_valuable,
>  	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 952496c6260d..e8eb09993485 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -102,7 +102,9 @@ static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
>  	int num_fences;
>  	int ret;
>  
> +	vm->is_validating = true;
>  	ret = drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
> +	vm->is_validating = false;

Can't say I love this coding pattern but you address this in the kernel
doc for is_validating. Agree with updating TTM to avoid this.

Also this is kinda racey too - e.g. 2 VMs could set vm->is_validating at
the same time. We really want to check if BO being evicted VM's matches
the VM we are trying to validate in the current context, right?

With that - maybe we try to update TTM in this series too?

>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e3bde897f6e8..07b0cda12d52 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -474,7 +474,7 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
>  		list_move_tail(&gpuva_to_vma(gpuva)->combined_links.rebind,
>  			       &vm->rebind_list);
>  
> -	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false);
> +	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, true);

I think we likely can flip the last argument to true in a few other
places too. Or maybe even drop the argument and either always set to
true or true if not an ext obj?

Matt

>  	if (ret)
>  		return ret;
>  
> @@ -515,7 +515,11 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
>  	if (err)
>  		return err;
>  
> -	return drm_gpuvm_validate(&vm->gpuvm, exec);
> +	vm->is_validating = true;
> +	err = drm_gpuvm_validate(&vm->gpuvm, exec);
> +	vm->is_validating = false;
> +
> +	return err;
>  }
>  
>  static void preempt_rebind_work_func(struct work_struct *w)
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 7d4f810f9c04..76c49fba9cd3 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -286,6 +286,16 @@ struct xe_vm {
>  
>  	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
>  	bool batch_invalidate_tlb;
> +
> +	/**
> +	 * @is_validaing: Whether we are validating the vm's local objects.
> +	 * This field is protected by the vm's resv. Note that this
> +	 * is needed only since TTM doesn't forward the ttm_operation_ctx to the
> +	 * eviction_valuable() callback, so if / when that is in place, this
> +	 * should be removed.
> +	 */
> +	bool is_validating;
> +
>  	/** @xef: XE file handle for tracking this VM's drm client */
>  	struct xe_file *xef;
>  };
> -- 
> 2.43.0
> 
