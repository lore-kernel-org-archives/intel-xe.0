Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7613C54E66
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 17:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778A210F4DD;
	Wed, 13 Mar 2024 17:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="drxEMJ4e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C47C10F4FD
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710351340; x=1741887340;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xw2xNy1Y7FxjQenuEIpkHcKoSw06P2xCj7gBK7537nk=;
 b=drxEMJ4epTmP+PxU23/iyyN6poVu+SYyFmSTxtFU1wDvTW3bnhteEEDi
 /UkAKH9GumONerfS//VYcQtjEj2DwZBUQlEpfaBf9Zx3b0IVq3oaJZ29w
 ssO+5gUyD0qn9AGNdbCiAz7jOxqSmfyDayB37cQ/+70cFELIiGQSsIdaf
 fdrhSpLy8ohiBMsVULbFD97vZi782lOEb0Wxptdos+i+cAbyi1jf6RDYf
 MmdsRSroJqKiEhsiC/2MyqBBCqRTZlp/a1zqArb5vgUwJ8jnqZWvBv8z+
 jUgA304hAN/NBifN8blmKi2sT2w7VGEMsARtG1TdTWVwy7kn/zp0RmWwC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15772984"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="15772984"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 10:35:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="43014691"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 10:35:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 10:35:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 10:35:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 10:35:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 10:35:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAybFMNkzttdj1T+LebWiJrkBDdXC4p1aH0+2Ldqpfy/A2dMeFHOXztxCniipL6V7KWVAK3Zd3e7VAFSZdGXG/g0Tx1Lmu4vZzslzbih9f+BmWDH+Tc52QxjOO/gLqpXjrqJQxDfjNREfsLeXhpyu04/VZI01lXAQaF9wCDAvjPZgchBMkUjlu65p9P+4Sl6hCKpVI2xeLLOIq8d/nLryBrEtRk31dJ+nYoiFrDA8ADbOZ9ke04Pp3nku6s3qFwvqE2sPK0nvUB+S9L0HV5VJrp/0KiADgEhbUW1bPpCg/m2YFhnI71ezSpaeQAfBSPM7f1FPjiQwluyWsnJWwrjWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QWJZHSbgDNgbCPYutVlsSGLIyWjBMhARjieC6351D4=;
 b=incRR3XTmeYOPyEsOgdJgho6BDyHie+FwCcZWMeaea+Qd55pWQHW8Ccmr2ZgUYhNHR77aF2/6oNHvNWRCZbEbjli3Pj6QDPk32QlyPZmkqC2jhVUwhIyrsfcA13LKQtktjW2+N9K+PsEfRl2K4V6+WfhM0sZ8r25/amoN4jJ1SUSMEF1adeXxGZpgZQJrTd1NeCXeWk7wSszHf9vJV/+na71+3f9WjWF3bl5NRtK1bWqEJlFHAP1a0UU5r0UI/wqx5oVsZyhoFDeK0JXXKKPLzMeeWGmFuPkidj9z/OyAmX+ZTjR++h9WGoPk9EEqXYRzyFiyhaxVU2epiElkMOmow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Wed, 13 Mar
 2024 17:35:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 17:35:36 +0000
Date: Wed, 13 Mar 2024 17:34:45 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Skip VMAs pin when requesting signal to the last
 XE_EXEC
Message-ID: <ZfHjtc+S0T2fk9Q6@DUT025-TGLU.fm.intel.com>
References: <20240313171318.121066-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240313171318.121066-1-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR11CA0049.namprd11.prod.outlook.com
 (2603:10b6:a03:80::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ff779a0-e465-4f74-ba3b-08dc4383fe31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NMIhBfw/h4h/zUTN3Fb8CTknHqppw+3VqXc6KFVPF0Kd0O5P0YiGiMkdFssWaBE4eWVPN9Q9MPr8t4YAlmsp4RzFID80o5tYp+Sa9hwHXCVbuHgryeuyRfnDdv8cwFcYAZG69ujrZnPlX7nKRy/oE2U3MIDQjdZYTaZtCGnNZ9vHJpJ8kGM/jmi/aFXerKKuZ1/iuW5C3m6lczPKy42sPSXHw9n9hU2cjLeBxaCn1WPOaVkZKD36kkJMONYa+XMWqn21L51h7dTNjsKYtPwb1dOxh2MGPV7CVeOqHO+IMmU93bAG6biqMfCVQpMg5nsJEe7B0pzVGMvPjL6BqMxurTcvomYmx4w3j6Ts258iJXJlpsXwcBMYQWmpRP1fuFqxtKybKLwdMF2cCZ9ykk2QmlFhs0MJLRUY1dmgnfDrh0dKmWpXr8vIZCrkx+54X375wuS6a6gtWBw3y8JOqZVNal3WSmVyBo8Lijcags3A+WAEpE4j21GJ1mKCPwUaeNkdCGX4VJ43ri3pBHQma2xVJWKDZWtGCwt8HfCOXsFvEVNO2tDAgyUgxag73Wn9yDBooBRGKQW4qsYxvV3RaxR4d9vzEYX2HS/iFUVBj7R/T1uulUE0UfQ67nl3QpYtt93Kv00/Md6AdREKHYFe4k0bhXjcfnM4iIpVJ86VoJantko=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OeA0DjZ9qb8g3ggpgz+eJxTLDg8pD9rvBoEqDm4R6V8VQlXeeWzV3sP5ff?=
 =?iso-8859-1?Q?lNJuGwry7+KlSCWg9wOrVxUmm2khofg2PJWu66l2aS7D0rqCaEe4/RKd0y?=
 =?iso-8859-1?Q?FbSYl4X5AcA+0QIFsLHsj/0Czflk61s5nr4Dw6B2sCrEWndlsNPVlV/6Hj?=
 =?iso-8859-1?Q?hFpNR8c/KQUWeehk5j0cjwQ1S+/d9g95FO0kauexruq9aK5PN1Iru1kOGZ?=
 =?iso-8859-1?Q?inCy8PXm8qyUFovLQz1RrMyzHPS/yVvLRAYZDH4YVbGInFrReEGNJ7hlY8?=
 =?iso-8859-1?Q?jAW99J/lSoqzpxKWd7sF7SDsUtqf5BwDWqlvddKu7z3EEW1I8fk6vMc54a?=
 =?iso-8859-1?Q?fChtMlbZMxlY8SOtLokkqSOZOiGEru65Hx56dAUTz7q66IcqOZMp5SgOB3?=
 =?iso-8859-1?Q?1jmzZdCaLEXjezwrH1cqtOGTQ13hFoOr68QvROsPPmP/U2/SMrDM6pgkCF?=
 =?iso-8859-1?Q?GYlVUosNUyh3rPRNhF8hgNSsVRnDUPQcHWRIeqQim7ll3eHU9vyMo24pH7?=
 =?iso-8859-1?Q?Rlvog8lZxwNo4BXaSReyS4vaKrWrTsk19Sae6fg38OxYPOkhVsqMSfB7cy?=
 =?iso-8859-1?Q?q6+7yh43mO7mcJnDOGhXkELi0SUrN0En4U0DrIQn20H5btIS3QVPrbsGYc?=
 =?iso-8859-1?Q?qLjIsD0g9EwgwFQDVUmn763kH0Ll5KNvndPYgoE+8tsl9hMQ29AHo9GkPG?=
 =?iso-8859-1?Q?Z2eCrb7V1wBfi67vYK4c3N7uoxlq96yZVyn4YtlFLt8DadLfgjIkfMTVQW?=
 =?iso-8859-1?Q?Sc7SoulIIUfT1hk6T835o5sAUD1JovMByaXw2d/hdpiHrgCia+1nistw4b?=
 =?iso-8859-1?Q?VMpYxzGfyr0obpB4k2KtR+nqPZ6VM5QiPkLsOSBduT6OQTjqZs/z4HLmtE?=
 =?iso-8859-1?Q?evAO/NthgZznFeCm67q5Dff683Y6QbRxduFuuVmZK9pmINsE56ArafUyTy?=
 =?iso-8859-1?Q?1kAF/WZ3Mc4BpMSR6HVWErFRGD5+rzkzuEvQzoA4FqGUypC0gLJlmiHOEQ?=
 =?iso-8859-1?Q?lOHxOzKP10pha6FXDPEh+YsfoqIUYpKE0tMUN4b1tcwwp47jCXYW0qSWxp?=
 =?iso-8859-1?Q?zuxF6FSF/tG3rNyFdwlrOxsKLvn8EbpWuOGNDWubGW+5BPFZalZ0pzufRR?=
 =?iso-8859-1?Q?kT8LJMl1DlbV4e8DL3Uu/Z1TNRqLql5+bdoVEBU+lNJsfrFwf+SGSkI4eA?=
 =?iso-8859-1?Q?l5X/o9SysjJzejRNuTKyNOV6kHq76jkVp6yeyA9xV4fXnku37LfoE7fANu?=
 =?iso-8859-1?Q?+DK9Zx2K3WhxN1tqmccxnKSujbK/D/If2pWL20agPGrWRB3VoTfGratkjr?=
 =?iso-8859-1?Q?xB5+suq86OJJNSI+SRci/dhU80uODxue/Xub/K/pq5HHEFkUO0aytNLrDD?=
 =?iso-8859-1?Q?By/xnPl/veJwgv6W5l4twY/bidO4vhGzObiu//HmVd48WgGYHzyKobjKD9?=
 =?iso-8859-1?Q?s/p4xTKgOh/bV1//JXm1zVGSInZnJcuo9wYg4UOWIX6DgSXViQcqUwomXb?=
 =?iso-8859-1?Q?Bp7NZlRq2idrN9ZaJ99BLiw0HufXYZhS60JvaNrhYbpW95vec+zR82PQ9w?=
 =?iso-8859-1?Q?LkAd8Nh1bz6bExy/WflLWkCHhvNf9QbZOIx8khW9FAKp89XIfDXLqWKqrw?=
 =?iso-8859-1?Q?kDCzth1XCP7RK1So3CWvnJ7nvfYpqgyZ1B6QrkzdQQVozhcn1UyHyH/w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff779a0-e465-4f74-ba3b-08dc4383fe31
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 17:35:36.5273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Tt78hw2XLi23XdF619m4XHUxZSZfZQv0BMqXPWdP1VdRXa4wac3TuqL34zUbIGRKd4/PvaUdzKdmnmUn9iswQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8441
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

On Wed, Mar 13, 2024 at 10:13:18AM -0700, José Roberto de Souza wrote:
> Doing a XE_EXEC with num_batch_buffer == 0 makes signals passed as
> argument to be signaled when the last real XE_EXEC is completed.
> But to do that it was first pinning all VMAs in drm_gpuvm_exec_lock(),
> this patch remove this pinning as it is not required.
> 
> This change also help Mesa implementing memory over-commiting recovery
> as it needs to unbind not needed VMAs when the whole VM can't fit
> in GPU memory but it can only do the unbiding when the last XE_EXEC
> is completed.
> So with this change Mesa can get the signal it want without getting
> out-of-memory errors.
> 
> Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> Co-developed-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec.c | 41 ++++++++++++++++++++----------------
>  1 file changed, 23 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 952496c6260df..826c8b3896725 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -235,6 +235,29 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  			goto err_unlock_list;
>  	}
>  
> +	if (!args->num_batch_buffer) {
> +		err = xe_vm_lock(vm, true);
> +		if (err)
> +			goto err_unlock_list;
> +
> +		if (!xe_vm_in_lr_mode(vm)) {
> +			struct dma_fence *fence;
> +
> +			fence = xe_sync_in_fence_get(syncs, num_syncs, q, vm);
> +			if (IS_ERR(fence)) {
> +				err = PTR_ERR(fence);
> +				goto err_unlock_list;
> +			}
> +			for (i = 0; i < num_syncs; i++)
> +				xe_sync_entry_signal(&syncs[i], NULL, fence);
> +			xe_exec_queue_last_fence_set(q, vm, fence);
> +			dma_fence_put(fence);
> +		}
> +
> +		xe_vm_unlock(vm);
> +		goto err_unlock_list;
> +	}
> +
>  	vm_exec.vm = &vm->gpuvm;
>  	vm_exec.flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
>  	if (xe_vm_in_lr_mode(vm)) {
> @@ -254,24 +277,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		goto err_exec;
>  	}
>  
> -	if (!args->num_batch_buffer) {
> -		if (!xe_vm_in_lr_mode(vm)) {
> -			struct dma_fence *fence;
> -
> -			fence = xe_sync_in_fence_get(syncs, num_syncs, q, vm);
> -			if (IS_ERR(fence)) {
> -				err = PTR_ERR(fence);
> -				goto err_exec;
> -			}
> -			for (i = 0; i < num_syncs; i++)
> -				xe_sync_entry_signal(&syncs[i], NULL, fence);
> -			xe_exec_queue_last_fence_set(q, vm, fence);
> -			dma_fence_put(fence);
> -		}
> -
> -		goto err_exec;
> -	}
> -
>  	if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
>  		err = -EWOULDBLOCK;	/* Aliased to -EAGAIN */
>  		skip_retry = true;
> -- 
> 2.44.0
> 
