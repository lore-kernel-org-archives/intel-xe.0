Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A5BFD45F9
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 23:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90ACC10E241;
	Wed, 25 Feb 2026 23:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LH7oDhBU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8D110E241
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 23:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772062505; x=1803598505;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3n8iPwuzdTYmyc6CVRdRZ8roqtbTuFV7VBXN1QSf08I=;
 b=LH7oDhBUD/LVaHPq1y8mOQjmL+GIPPOlZ0WYlbMzs+n4Calwq2nFxEHZ
 e031hhzE/+draRO4A1EmyTXVmrVLMXSCMIISSJg4tMvIEbgA1MglxePMi
 upL0OIrLesU2ldG8EXoB7drta2ILxBRc2gwsuGmV8SLEumKxyG6nCLJqe
 YOUezO1aMh60c96pcVhq/SJUJ5bcMG9LBLJ1FmoyBihLCNFqKBi5cxeoq
 cwYzTxB6yKXwsRAyqhY1chrTPCsGfOojl+/7NMmU/9cbuQsgCUz6Bocr0
 USMp+x6siLD2k8VPSWYzUjEmAUBytgqLpUIBYofsE1L3Y1lIuYwSea+Kw w==;
X-CSE-ConnectionGUID: 2c/aAujMTWmsp6Gq26d7tQ==
X-CSE-MsgGUID: nOLL1XGYRoCOYdj3+tjIqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73020293"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73020293"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 15:35:05 -0800
X-CSE-ConnectionGUID: e7tcAxDDQs28+WX1t+9aCQ==
X-CSE-MsgGUID: sjV6zUFSQlGfvaTUYdrkjQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 15:35:04 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 15:35:04 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 15:35:04 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 15:35:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1OdVpgFDVrJYn/cKSR7CZCVTUHkuG6uHiKxBflT2pPFOyVrRYU98VNqqxDR1F4N6LuXIzAWkQ9I4RxTDKq04hEqrWs6q8jlNlbSBIGVwDKX5nzQAz3Iw7PumEI4/KYMv3giwODOcqcHhfNvMImRW22RW+j9b4gSIH459lI7ZS42/Kbv2QYAkNV2AjsdLVtTPW1WMXLb5A8czZAajoBCuIWTY5e32+pwZYqd5fHmm+WEaZooljqhdHQpGXvX6f0rVbdChQQeBU2H0plyiUApMRuxZeWS//Y/btWqOw985pjhprg9ArmdB3XKoDPgLcwqQ3kJjUPTeMYEX7Y7m7rY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hyiu4sVkWCUtAbiiHRIGf9N1mtOYM93QrASDSJXlWmg=;
 b=nV/q2rZnn4C8y7Z9FF3qBWUOV1BHx0zNvpdDZm2vdkVjcFUZVYLbxW0u+mmO/3XYhtvbD0Owd1He86p0I8CFGPzJpQoUhxm3yM/KgIjNmhfgONSPuHRcUrFV7HUXqjeXEUxL4zDKk4ergeBe+FEjXZPDunFgZ0r3mZWMk1l5CiZbucC/zAX06nWSD20eNS4em0yqDGu/nNmM8+e136DzsRImVHWLf1zC/wvgxSY5bwM8jngYeywv9Wf3yEviNUmtcGDjMSeuHXVa82C3TWQjXAFmVO6QsekJd9vy+pHlLBRR/tYGBpEMLfSpfOd+RBSCfCHVPRvLTamL/rxSOP4nvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8482.namprd11.prod.outlook.com (2603:10b6:408:1bb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 23:34:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 23:34:55 +0000
Date: Wed, 25 Feb 2026 15:34:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC 4/7] drm/xe/vm: Add madvise autoreset interval notifier
 worker infrastructure
Message-ID: <aZ+HHMnSK49omV2Y@lstrano-desk.jf.intel.com>
References: <20260219091312.796749-1-arvind.yadav@intel.com>
 <20260219091312.796749-5-arvind.yadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260219091312.796749-5-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0120.namprd04.prod.outlook.com
 (2603:10b6:303:83::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac23d5e-944f-4c70-c63c-08de74c67b57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 096MtauVVMIIcIyWeLHX9Tq/ZwXfLDafurB7MymnL10vEPu4AYj1qOTl+yWqIU6oc22DGhfHY+0beNmpMF3bGN6DqAGQAb5cLTrvkxv9AlW4s91BnNoSd8D+v5FUSQEnxUWwQPWdxZxAkLt52mljX9tpE8LqeWtN9dbQLlNoDzj3C3oWVb4KxeB22wudmszSkK4MABtKR46lPTmcyaUMnNcU4c3mTB/1z3IPtL1Zb5woucs+SD2wa3PzihZAh0+NqSxHOGw0XQT+P8Gp8affN0aJ5dj04j+Hfn07jXtzU2SdP904k/oj49BfNayb6HHAEvJnTVXzLX/bk0psIvp6RCbuTECRdSGKBqrYnObIjRqQ7/9H8cGbSQwk/XVyWZWBXO2H3pncQxqJmJJAJEMqW7aiCDtaTO6cgRDKRrFc2zBPOb+7kFypuDxzasv1gFjzCVy50XcPAAi3aFWb16O+p9MlGYyXfGTm6BFA5cgiebFV/mBdaFEfhSsPskGHRlPZ56fjDAEOicnfC1FuAjCi3uFvCLYOx+0akZ76k9KEVvDF5AHK9PAPGy0fNBxM7xktUXK6i8jzfossPpk7ipwmt+LLaYMS5g+wre28d7w1lC9lHYJK37wR43d+fCtYHbxVc9LBwqQgUgxRNGZ7jCJCqg7xWRuE1Tffht5MaNxIlpA01f+dnoRCSubZ2ekwZqe0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVdSOHhEeW9PbG16RTM4ZGUrN2ZkZzRXZ01GekJSeW5LSFNOU3ArNEtkZnlM?=
 =?utf-8?B?cXp0MHRlam85aC9YQlF4ZTFaYnVYRUMybkpCNlBLWDlyM1JDNkRvbnJrQUhW?=
 =?utf-8?B?Q0FXeTUvc0w2cjRzOU4yNERIbDFMc3BQcHV4U1BCSWt6MklTVWhLUk10WGhi?=
 =?utf-8?B?ZUxTTjJtcjNtUEcyRnR4SkVEY0dqd0FDMzVhRG5iRnpKWU5iYWRaVXRiMjUr?=
 =?utf-8?B?WlZReUpvZDNRR0RHZEhVbDFhRkhMMk5SVlVrSU1WL3FBbkhLOUtpTTc1TDJ1?=
 =?utf-8?B?VGNFMmJXRWFjNFdUWGpObi82eXFJbEVxOEYvdU9Bdk10QTJLdUErVWM5QXZ1?=
 =?utf-8?B?WVJvQkJVTTFoZzNmWHJxTWRBbVZQc0VGaUVMWmo3eS9SOG1wU2hwR2VmZUV3?=
 =?utf-8?B?aTgxdDczekZ6enA1S3BQMjlxQ013SlBHWGJ1Ty9XbGd4MzRvTnRyQmFlMFh0?=
 =?utf-8?B?VE1va3lJSTBGQyswVUFnUGcwZENKME1QOE9MTXFUN28zdFRHc0xJeEJiOGNv?=
 =?utf-8?B?V2FBNHhMU0hCc1pQWldQSGRHZi9vUDBjejJtclVjdWdDNlpieTFlZkJINnBX?=
 =?utf-8?B?QlZma0wwVHh1V3NiV0Z4VU9rZjZaOVk0L3Y0bTEzRHA3dzMzTXVFVFVodFU0?=
 =?utf-8?B?U0lNNDNVRXl1ODQxM2ZaUjZCcUF5OUVLc3lreVNEbWo2RmpQcXJ3Vm1Penpm?=
 =?utf-8?B?VjR0ODBoNkpnN1RoaUhrZlZsbGVIVm5wWE02RStZdmlqY3BNTVhzbGppMXlL?=
 =?utf-8?B?cTZtYjR4cUJTRFdJZXh2eVJGMXNEUm1jcEJlUnhJSWFGMmVwMmxqWWhRdjhQ?=
 =?utf-8?B?dkJ5RHBOUVBCZk9DQXZhN0N4TGw1aHVqenlPYzUyUmd1SmFFTmZNMzIvYjEw?=
 =?utf-8?B?blg3aXNEdk94bUhBOHVLTExmUEN5WWE5dHFwU3Y5SjNKY0VyVEVLN3VKRktH?=
 =?utf-8?B?YVFDUEsrdm1XaVJpRHRweWVzOE1JS1NPQWl1UGJpbWRNMU9zdGdveHljYnNv?=
 =?utf-8?B?TFE4NXY5N0dMenRjYjQ2ZTYrYzIwNGJXS0tNT2pwWlVzTHB2K2ZaYTZpSjk0?=
 =?utf-8?B?VEx2L21wdmlNditYQUprTVJlYytEdnBVZUNFYjZybDF0dWhaa3NONE1qd3Fq?=
 =?utf-8?B?V2RibTVLbDNFQ3h1Nnc5S1c4MkxDaXQ5QjV1K1Z0NDlYTFphOGgxU1dHMUQz?=
 =?utf-8?B?U2xxRFA2bkR1MkRYQVRCTGdRS3pKaEo1L0dEbUcwS0hXaXVZK1NHeTFZZXdT?=
 =?utf-8?B?WExQVU1tZVM3eEFMOHc0RmtKWjdkZ2UycUYyQkdFRVBydk44aXUrZkJmZGxv?=
 =?utf-8?B?MFlHVDZWb204SksxU0JoWGVheHZGWFJDZ3Y3c25OQWplOVRmd2Z1Q3ZlUmk0?=
 =?utf-8?B?QW0vazhzVE00alFpSkNiY01wa0wraGJPcnF1bkJ4WE9WNC9XYTVXNkIzcHBw?=
 =?utf-8?B?UXZ2L2hSSGx6cTIzSEI1ZmJQcFQreC8xRGdkayszNnAxSzdwQSt4bGM0ZXFD?=
 =?utf-8?B?L1d4d0FlYzJBeXF1OG96dGRBM1kyMUNFS01kVkJzZHhodDIwV2RvbmNWaEVH?=
 =?utf-8?B?ZTdBdCtsSWJZcWh4SmZxOFdrejZ0bVJOM1Q4aUQ3U1lta0N0UE5heS85enEx?=
 =?utf-8?B?dVR4TmRwS3cyT29tZ2JORVJwU2RDbStqRTFGZWpXcmR5djRNR0Nad3VhTllx?=
 =?utf-8?B?U0J6ejZHcE9rbUkwTXJraS9zVXViZXVjYXp1b1FXZ01yTlY5VFNzUGtTcW12?=
 =?utf-8?B?WjgrK2lRWkVEbDBxcGIzSGJ5VDNXaEZhU0V0R2xQdEhVbWJmZHJtOE56MGhu?=
 =?utf-8?B?TVRmQWV0REpZaXQ3YmxuS29NR1NrMlBzdUVIcC9rZ2xDT0paY2lWK0ZSUDNO?=
 =?utf-8?B?d3dJZU5tUVFON0lZZDljQ0tuRXlRakIxb21UWFBwTlJ5OVZOR1ZvMHFlS20y?=
 =?utf-8?B?bjlzTTBHV2J6SVBBUmF3OEQwNytaNi8rL2dHdCtsbmdLTzhCaXJsMzFLK1NP?=
 =?utf-8?B?ZnZsL2ZnVjlscFVQSi9XSXphOXlYUytSa0JTM2dlUFZuUUFKYW9hNEFTanl3?=
 =?utf-8?B?M0MrRW5pNkR5TjlVSnpkSUFJdFRWVFJaYVFjRHB6OUhuVDhFa2xnTGd6K0ll?=
 =?utf-8?B?QzRCd1lvZnkwZStDK2FpWmFqbjF4TVpXL3ZpRlQ4OWIrR3VsbVg2S3p3Nk1G?=
 =?utf-8?B?UkkrRHlmSy94eUowa08yeWJtVVl5ZE9YeG9UUGVSVWxPSUpLSmwwV1NvdEdo?=
 =?utf-8?B?QTducWt1NU1nMVhaczFTd0RtMXVqaFRKWE5uS2xFM1JVVzl3U0ZsWUsxQW04?=
 =?utf-8?B?ZGVaM1Jtb3dpaExVMWRJTzVYWS91VFJReFByTGlkTjEwQTM5Uk1rWWlFeHBB?=
 =?utf-8?Q?LLp/Rr2a2kWcdupI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac23d5e-944f-4c70-c63c-08de74c67b57
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 23:34:55.7599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5c10BdklZ4Wf48rCwb6sPx3fa6It3IQRWPRmOml8lWksdNJba0cU9ElZXYtfA+702bAdrNF44cLTOyIZj60Aqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8482
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

On Thu, Feb 19, 2026 at 02:43:09PM +0530, Arvind Yadav wrote:
> MADVISE_AUTORESET needs to reset VMA attributes when userspace unmaps
> CPU-only ranges, but the MMU invalidate callback cannot take vm->lock
> due to lock ordering (mmap_lock is already held).
> 
> Add mmu_interval_notifier that queues work items for MMU_NOTIFY_UNMAP
> events. The worker runs under vm->lock and resets attributes for VMAs
> still marked XE_VMA_CPU_AUTORESET_ACTIVE (i.e., not yet GPU-touched).
> 
> Work items are allocated from a mempool to handle atomic context in the
> callback. The notifier is deactivated when GPU touches the VMA.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 394 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm_madvise.h |   8 +
>  drivers/gpu/drm/xe/xe_vm_types.h   |  41 +++
>  3 files changed, 443 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 52147f5eaaa0..4c0ffb100bcc 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -6,9 +6,12 @@
>  #include "xe_vm_madvise.h"
>  
>  #include <linux/nospec.h>
> +#include <linux/mempool.h>
> +#include <linux/workqueue.h>
>  #include <drm/xe_drm.h>
>  
>  #include "xe_bo.h"
> +#include "xe_macros.h"
>  #include "xe_pat.h"
>  #include "xe_pt.h"
>  #include "xe_svm.h"
> @@ -500,3 +503,394 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  	xe_vm_put(vm);
>  	return err;
>  }
> +
> +/**
> + * struct xe_madvise_work_item - Work item for unmap processing
> + * @work: work_struct
> + * @vm: VM reference
> + * @pool: Mempool for recycling
> + * @start: Start address
> + * @end: End address
> + */
> +struct xe_madvise_work_item {
> +	struct work_struct work;
> +	struct xe_vm *vm;
> +	mempool_t *pool;

Why mempool? Seems like we could just do kmalloc with correct gfp flags.

> +	u64 start;
> +	u64 end;
> +};
> +
> +static void xe_vma_set_default_attributes(struct xe_vma *vma)
> +{
> +	vma->attr.preferred_loc.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
> +	vma->attr.preferred_loc.migration_policy = DRM_XE_MIGRATE_ALL_PAGES;
> +	vma->attr.pat_index = vma->attr.default_pat_index;
> +	vma->attr.atomic_access = DRM_XE_ATOMIC_UNDEFINED;
> +}
> +
> +/**
> + * xe_vm_madvise_process_unmap - Process munmap for all VMAs in range
> + * @vm: VM
> + * @start: Start of unmap range
> + * @end: End of unmap range
> + *
> + * Processes all VMAs overlapping the unmap range. An unmap can span multiple
> + * VMAs, so we need to loop and process each segment.
> + *
> + * Return: 0 on success, negative error otherwise
> + */
> +static int xe_vm_madvise_process_unmap(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	u64 addr = start;
> +	int err;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	if (xe_vm_is_closed_or_banned(vm))
> +		return 0;
> +
> +	while (addr < end) {
> +		struct xe_vma *vma;
> +		u64 seg_start, seg_end;
> +		bool has_default_attr;
> +
> +		vma = xe_vm_find_overlapping_vma(vm, addr, end);
> +		if (!vma)
> +			break;
> +
> +		/* Skip GPU-touched VMAs - SVM handles them */
> +		if (!xe_vma_has_cpu_autoreset_active(vma)) {
> +			addr = xe_vma_end(vma);
> +			continue;
> +		}
> +
> +		has_default_attr = xe_vma_has_default_mem_attrs(vma);
> +		seg_start = max(addr, xe_vma_start(vma));
> +		seg_end = min(end, xe_vma_end(vma));
> +
> +		/* Expand for merging if VMA already has default attrs */
> +		if (has_default_attr &&
> +		    xe_vma_start(vma) >= start &&
> +		    xe_vma_end(vma) <= end) {
> +			seg_start = xe_vma_start(vma);
> +			seg_end = xe_vma_end(vma);
> +			xe_vm_find_cpu_addr_mirror_vma_range(vm, &seg_start, &seg_end);
> +		} else if (xe_vma_start(vma) == seg_start && xe_vma_end(vma) == seg_end) {
> +			xe_vma_set_default_attributes(vma);
> +			addr = seg_end;
> +			continue;
> +		}
> +
> +		if (xe_vma_start(vma) == seg_start &&
> +		    xe_vma_end(vma) == seg_end &&
> +		    has_default_attr) {
> +			addr = seg_end;
> +			continue;
> +		}
> +
> +		err = xe_vm_alloc_cpu_addr_mirror_vma(vm, seg_start, seg_end - seg_start);
> +		if (err) {
> +			if (err == -ENOENT) {
> +				addr = seg_end;
> +				continue;
> +			}
> +			return err;
> +		}
> +
> +		addr = seg_end;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_madvise_work_func - Worker to process unmap
> + * @w: work_struct
> + *
> + * Processes a single unmap by taking vm->lock and calling the helper.
> + * Each unmap has its own work item, so no interval loss.
> + */
> +static void xe_madvise_work_func(struct work_struct *w)
> +{
> +	struct xe_madvise_work_item *item = container_of(w, struct xe_madvise_work_item, work);
> +	struct xe_vm *vm = item->vm;
> +	int err;
> +
> +	down_write(&vm->lock);
> +	err = xe_vm_madvise_process_unmap(vm, item->start, item->end);
> +	if (err)
> +		drm_warn(&vm->xe->drm,
> +			 "madvise autoreset failed [%#llx-%#llx]: %d\n",
> +			 item->start, item->end, err);
> +	/*
> +	 * Best-effort: Log failure and continue.
> +	 * Core correctness from CPU_AUTORESET_ACTIVE flag.
> +	 */
> +	up_write(&vm->lock);
> +	xe_vm_put(vm);
> +	mempool_free(item, item->pool);
> +}
> +
> +/**
> + * xe_madvise_notifier_callback - MMU notifier callback for CPU munmap
> + * @mni: mmu_interval_notifier
> + * @range: mmu_notifier_range
> + * @cur_seq: current sequence number
> + *
> + * Queues work to reset VMA attributes. Cannot take vm->lock (circular locking),
> + * so uses workqueue. GFP_ATOMIC allocation may fail; drops event if so.
> + *
> + * Return: true (never blocks)
> + */
> +static bool xe_madvise_notifier_callback(struct mmu_interval_notifier *mni,
> +					 const struct mmu_notifier_range *range,
> +					 unsigned long cur_seq)
> +{
> +	struct xe_madvise_notifier *notifier =
> +		container_of(mni, struct xe_madvise_notifier, mmu_notifier);
> +	struct xe_vm *vm = notifier->vm;
> +	struct xe_madvise_work_item *item;
> +	struct workqueue_struct *wq;
> +	mempool_t *pool;
> +	u64 start, end;
> +
> +	if (range->event != MMU_NOTIFY_UNMAP)
> +		return true;
> +
> +	/*
> +	 * Best-effort: skip in non-blockable contexts to avoid building up work.
> +	 * Correctness does not rely on this notifier - CPU_AUTORESET_ACTIVE flag
> +	 * prevents GPU PTE zaps on CPU-only VMAs in the zap path.
> +	 */
> +	if (!mmu_notifier_range_blockable(range))
> +		return true;
> +
> +	/* Consume seq (interval-notifier convention) */
> +	mmu_interval_set_seq(mni, cur_seq);
> +
> +	/* Best-effort: core correctness from CPU_AUTORESET_ACTIVE check in zap path */
> +
> +	start = max_t(u64, range->start, notifier->vma_start);
> +	end = min_t(u64, range->end, notifier->vma_end);
> +
> +	if (start >= end)
> +		return true;
> +
> +	pool = READ_ONCE(vm->svm.madvise_work.pool);
> +	wq = READ_ONCE(vm->svm.madvise_work.wq);
> +	if (!pool || !wq || atomic_read(&vm->svm.madvise_work.closing))

Can you explain the use of READ_ONCE, xchg, and atomics? At first glance
it seems unnecessary or overly complicated. Let’s start with the problem
this is trying to solve and see if we can find a simpler approach.

My initial thought is a VM-wide rwsem, marked as reclaim-safe. The
notifiers would take it in read mode to check whether the VM is tearing
down, and the fini path would take it in write mode to initiate
teardown...

> +		return true;
> +
> +	/* GFP_ATOMIC to avoid fs_reclaim lockdep in notifier context */
> +	item = mempool_alloc(pool, GFP_ATOMIC);

Again, probably just use kmalloc. Also s/GFP_ATOMIC/GFP_NOWAIT. We
really shouldn’t be using GFP_ATOMIC in Xe per the DRM docs unless a
failed memory allocation would take down the device. We likely abuse
GFP_ATOMIC in several places that we should clean up, but in this case
it’s pretty clear GFP_NOWAIT is what we want, as failure isn’t
fatal—just sub-optimal.

> +	if (!item)
> +		return true;
> +
> +	memset(item, 0, sizeof(*item));
> +	INIT_WORK(&item->work, xe_madvise_work_func);
> +	item->vm = xe_vm_get(vm);
> +	item->pool = pool;
> +	item->start = start;
> +	item->end = end;
> +
> +	if (unlikely(atomic_read(&vm->svm.madvise_work.closing))) {

Same as above the atomic usage...

> +		xe_vm_put(item->vm);
> +		mempool_free(item, pool);
> +		return true;
> +	}
> +
> +	queue_work(wq, &item->work);
> +
> +	return true;
> +}
> +
> +static const struct mmu_interval_notifier_ops xe_madvise_notifier_ops = {
> +	.invalidate = xe_madvise_notifier_callback,
> +};
> +
> +/**
> + * xe_vm_madvise_init - Initialize madvise notifier infrastructure
> + * @vm: VM
> + *
> + * Sets up workqueue and mempool for async munmap processing.
> + *
> + * Return: 0 on success, -ENOMEM on failure
> + */
> +int xe_vm_madvise_init(struct xe_vm *vm)
> +{
> +	struct workqueue_struct *wq;
> +	mempool_t *pool;
> +
> +	/* Always initialize list and mutex - fini may be called on partial init */
> +	INIT_LIST_HEAD(&vm->svm.madvise_notifiers.list);
> +	mutex_init(&vm->svm.madvise_notifiers.lock);
> +
> +	wq = READ_ONCE(vm->svm.madvise_work.wq);
> +	pool = READ_ONCE(vm->svm.madvise_work.pool);
> +
> +	/* Guard against double initialization and detect partial init */
> +	if (wq || pool) {
> +		XE_WARN_ON(!wq || !pool);
> +		return 0;
> +	}
> +
> +	WRITE_ONCE(vm->svm.madvise_work.wq, NULL);
> +	WRITE_ONCE(vm->svm.madvise_work.pool, NULL);
> +	atomic_set(&vm->svm.madvise_work.closing, 1);
> +
> +	/*
> +	 * WQ_UNBOUND: best-effort optimization, not critical path.
> +	 * No WQ_MEM_RECLAIM: worker allocates memory (VMA ops with GFP_KERNEL).
> +	 * Not on reclaim path - merely resets attributes after munmap.
> +	 */
> +	vm->svm.madvise_work.wq = alloc_workqueue("xe_madvise", WQ_UNBOUND, 0);
> +	if (!vm->svm.madvise_work.wq)
> +		return -ENOMEM;
> +
> +	/* Mempool for GFP_ATOMIC allocs in notifier callback */
> +	vm->svm.madvise_work.pool =
> +		mempool_create_kmalloc_pool(64,
> +					     sizeof(struct xe_madvise_work_item));
> +	if (!vm->svm.madvise_work.pool) {
> +		destroy_workqueue(vm->svm.madvise_work.wq);
> +		WRITE_ONCE(vm->svm.madvise_work.wq, NULL);
> +		return -ENOMEM;
> +	}
> +
> +	atomic_set(&vm->svm.madvise_work.closing, 0);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_vm_madvise_fini - Cleanup all madvise notifiers
> + * @vm: VM
> + *
> + * Tears down notifiers and drains workqueue. Safe if init partially failed.
> + * Order: closing flag → remove notifiers (SRCU sync) → drain wq → destroy.
> + */
> +void xe_vm_madvise_fini(struct xe_vm *vm)
> +{
> +	struct xe_madvise_notifier *notifier, *next;
> +	struct workqueue_struct *wq;
> +	mempool_t *pool;
> +	LIST_HEAD(tmp);
> +
> +	atomic_set(&vm->svm.madvise_work.closing, 1);
> +
> +	/*
> +	 * Detach notifiers under lock, then remove outside lock (SRCU sync can be slow).
> +	 * Splice avoids holding mutex across mmu_interval_notifier_remove() SRCU sync.
> +	 * Removing notifiers first (before drain) prevents new invalidate callbacks.
> +	 */
> +	mutex_lock(&vm->svm.madvise_notifiers.lock);
> +	list_splice_init(&vm->svm.madvise_notifiers.list, &tmp);
> +	mutex_unlock(&vm->svm.madvise_notifiers.lock);
> +
> +	/* Now remove notifiers without holding lock - mmu_interval_notifier_remove() SRCU-syncs */
> +	list_for_each_entry_safe(notifier, next, &tmp, list) {
> +		list_del(&notifier->list);
> +		mmu_interval_notifier_remove(&notifier->mmu_notifier);
> +		xe_vm_put(notifier->vm);
> +		kfree(notifier);
> +	}
> +
> +	/* Drain and destroy workqueue */
> +	wq = xchg(&vm->svm.madvise_work.wq, NULL);
> +	if (wq) {
> +		drain_workqueue(wq);

Work items in wq call xe_madvise_work_func, which takes vm->lock in
write mode. If we try to drain here after the work item executing
xe_madvise_work_func has started or is queued, I think we could
deadlock. Lockdep should complain about this if you run a test that
triggers xe_madvise_work_func at least once — or at least it should. If
it doesn’t, then workqueues likely have an issue in their lockdep
implementation as 'drain_workqueue' should touch its lockdep map which
has tainted vm->lock (i.e., is outside of it).

So perhaps call this function without vm->lock and take as need in the
this function, then drop it drain the work queue, etc...

> +		destroy_workqueue(wq);
> +	}
> +
> +	pool = xchg(&vm->svm.madvise_work.pool, NULL);
> +	if (pool)
> +		mempool_destroy(pool);
> +}
> +
> +/**
> + * xe_vm_madvise_register_notifier_range - Register MMU notifier for address range
> + * @vm: VM
> + * @start: Start address (page-aligned)
> + * @end: End address (page-aligned)
> + *
> + * Registers interval notifier for munmap tracking. Uses addresses (not VMA pointers)
> + * to avoid UAF after dropping vm->lock. Deduplicates by range.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	struct xe_madvise_notifier *notifier, *existing;
> +	int err;
> +

I see this isn’t called under the vm->lock write lock. Is there a reason
not to? I think taking it under the write lock would help with the
teardown sequence, since you wouldn’t be able to get here if
xe_vm_is_closed_or_banned were stable—and we wouldn’t enter this
function if that helper returned true.

> +	if (!IS_ALIGNED(start, PAGE_SIZE) || !IS_ALIGNED(end, PAGE_SIZE))
> +		return -EINVAL;
> +
> +	if (WARN_ON_ONCE(end <= start))
> +		return -EINVAL;
> +
> +	if (atomic_read(&vm->svm.madvise_work.closing))
> +		return -ENOENT;
> +
> +	if (!READ_ONCE(vm->svm.madvise_work.wq) ||
> +	    !READ_ONCE(vm->svm.madvise_work.pool))
> +		return -ENOMEM;
> +
> +	/* Check mm early to avoid allocation if it's missing */
> +	if (!vm->svm.gpusvm.mm)
> +		return -EINVAL;
> +
> +	/* Dedupe: check if notifier exists for this range */
> +	mutex_lock(&vm->svm.madvise_notifiers.lock);

If we had the vm->lock in write mode we could likely just drop
svm.madvise_notifiers.lock for now, but once we move to fine grained
locking in page faults [1] we'd in fact need a dedicated lock. So let's
keep this.

[1] https://patchwork.freedesktop.org/patch/707238/?series=162167&rev=2

> +	list_for_each_entry(existing, &vm->svm.madvise_notifiers.list, list) {
> +		if (existing->vma_start == start && existing->vma_end == end) {

This is O(N) which typically isn't ideal. Better structure here? mtree?
Does an mtree have its own locking so svm.madvise_notifiers.lock could
just be dropped? I'd look into this.

> +			mutex_unlock(&vm->svm.madvise_notifiers.lock);
> +			return 0;
> +		}
> +	}
> +	mutex_unlock(&vm->svm.madvise_notifiers.lock);
> +
> +	notifier = kzalloc(sizeof(*notifier), GFP_KERNEL);
> +	if (!notifier)
> +		return -ENOMEM;
> +
> +	notifier->vm = xe_vm_get(vm);
> +	notifier->vma_start = start;
> +	notifier->vma_end = end;
> +	INIT_LIST_HEAD(&notifier->list);
> +
> +	err = mmu_interval_notifier_insert(&notifier->mmu_notifier,
> +					   vm->svm.gpusvm.mm,
> +					   start,
> +					   end - start,
> +					   &xe_madvise_notifier_ops);
> +	if (err) {
> +		xe_vm_put(notifier->vm);
> +		kfree(notifier);
> +		return err;
> +	}
> +
> +	/* Re-check closing to avoid teardown race */
> +	if (unlikely(atomic_read(&vm->svm.madvise_work.closing))) {
> +		mmu_interval_notifier_remove(&notifier->mmu_notifier);
> +		xe_vm_put(notifier->vm);
> +		kfree(notifier);
> +		return -ENOENT;
> +	}
> +
> +	/* Add to list - check again for concurrent registration race */
> +	mutex_lock(&vm->svm.madvise_notifiers.lock);

If we had the vm->lock in write mode, we couldn't get concurrent
registrations.

I likely have more comments, but I have enough concerns with the locking
and structure in this patch that I’m going to pause reviewing the series
until most of my comments are addressed. It’s hard to focus on anything
else until we get these issues worked out.

Matt

> +	list_for_each_entry(existing, &vm->svm.madvise_notifiers.list, list) {
> +		if (existing->vma_start == start && existing->vma_end == end) {
> +			mutex_unlock(&vm->svm.madvise_notifiers.lock);
> +			mmu_interval_notifier_remove(&notifier->mmu_notifier);
> +			xe_vm_put(notifier->vm);
> +			kfree(notifier);
> +			return 0;
> +		}
> +	}
> +	list_add(&notifier->list, &vm->svm.madvise_notifiers.list);
> +	mutex_unlock(&vm->svm.madvise_notifiers.lock);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
> index b0e1fc445f23..ba9cd7912113 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> @@ -6,10 +6,18 @@
>  #ifndef _XE_VM_MADVISE_H_
>  #define _XE_VM_MADVISE_H_
>  
> +#include <linux/types.h>
> +
>  struct drm_device;
>  struct drm_file;
> +struct xe_vm;
> +struct xe_vma;
>  
>  int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  
> +int xe_vm_madvise_init(struct xe_vm *vm);
> +void xe_vm_madvise_fini(struct xe_vm *vm);
> +int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64 start, u64 end);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 29ff63503d4c..eb978995000c 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -12,6 +12,7 @@
>  
>  #include <linux/dma-resv.h>
>  #include <linux/kref.h>
> +#include <linux/mempool.h>
>  #include <linux/mmu_notifier.h>
>  #include <linux/scatterlist.h>
>  
> @@ -29,6 +30,26 @@ struct xe_user_fence;
>  struct xe_vm;
>  struct xe_vm_pgtable_update_op;
>  
> +/**
> + * struct xe_madvise_notifier - CPU madvise notifier for memory attribute reset
> + *
> + * Tracks CPU munmap operations on SVM CPU address mirror VMAs.
> + * When userspace unmaps CPU memory, this notifier processes attribute reset
> + * via work queue to avoid circular locking (can't take vm->lock in callback).
> + */
> +struct xe_madvise_notifier {
> +	/** @mmu_notifier: MMU interval notifier */
> +	struct mmu_interval_notifier mmu_notifier;
> +	/** @vm: VM this notifier belongs to (holds reference via xe_vm_get) */
> +	struct xe_vm *vm;
> +	/** @vma_start: Start address of VMA being tracked */
> +	u64 vma_start;
> +	/** @vma_end: End address of VMA being tracked */
> +	u64 vma_end;
> +	/** @list: Link in vm->svm.madvise_notifiers.list */
> +	struct list_head list;
> +};
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  #define TEST_VM_OPS_ERROR
>  #define FORCE_OP_ERROR	BIT(31)
> @@ -212,6 +233,26 @@ struct xe_vm {
>  		struct xe_pagemap *pagemaps[XE_MAX_TILES_PER_DEVICE];
>  		/** @svm.peer: Used for pagemap connectivity computations. */
>  		struct drm_pagemap_peer peer;
> +
> +		/**
> +		 * @svm.madvise_notifiers: Active CPU madvise notifiers
> +		 */
> +		struct {
> +			/** @svm.madvise_notifiers.list: List of active notifiers */
> +			struct list_head list;
> +			/** @svm.madvise_notifiers.lock: Protects notifiers list */
> +			struct mutex lock;
> +		} madvise_notifiers;
> +
> +		/** @svm.madvise_work: Workqueue for async munmap processing */
> +		struct {
> +			/** @svm.madvise_work.wq: Workqueue */
> +			struct workqueue_struct *wq;
> +			/** @svm.madvise_work.pool: Mempool for work items */
> +			mempool_t *pool;
> +			/** @svm.madvise_work.closing: Teardown flag */
> +			atomic_t closing;
> +		} madvise_work;
>  	} svm;
>  
>  	struct xe_device *xe;
> -- 
> 2.43.0
> 
