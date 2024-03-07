Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13823C54798
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 17:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FA310FA88;
	Thu,  7 Mar 2024 17:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fcrkfgiL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99B110F506
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 17:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709833695; x=1741369695;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6ahVnIIDex7ci8n6OVAI7KlJ+GkzNZp1BSZ6bHnNZi8=;
 b=fcrkfgiLP+VywZZtn0VhL/d9SaVIdIoH/lkyyIVV/BVEPamXQwMemM0K
 BwVvqUnkstwhYvbRdJEhcmMSZn03IFXGm4PT981F/3oAJpDvcLXN90Y7D
 bnwqwQwUw5xg5Yp4FWAJcrUwX3Yt88YrWg7bdItP6LDHydlqFSSyoqcQ7
 PCYrlr3PTAip+oZioshQYrbFwaNrXBSaHb9aL310+ykxT/YuONw0xK97p
 PwhcYX30UDNT2fYHQBbmz6FJvzCBom0z6IhhUm+pQeOdYY+vIQIAWwr65
 vw13VLWnfJDkMS9QyidynuFB6ujTqm0JDtasmKbL14j7wQOZ0Ga16OwGJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="26990223"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="26990223"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 09:48:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10169035"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 09:48:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 09:48:13 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 09:48:13 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 09:48:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCyQQ/9yzw5kgLmixk3rrbCxz+Pl9pv+01TBZoGaoS6jlpGnHQ3mg8aT2aiqD7uE3ExlqT3Ca/uD2ZPQZu/7QbmBJNEoCkct0N0fZInRJkP69y40ruCVDLfGJsGHB21euEvHqTCL9n4GM1hTaaktKfb4H6/nGcLY+Q5V6UjyrRCuzID5+OXwsnpEPY9azUTM8YKOkMZq8IbBYwzawErzD35BIttHBuQDZ1nL9Tk2X6Z1S+EtNTPwcyONTkZS/cw4tUzWjKvV1h5n6Xb8GG4+8bnw91MkSNJXU04LWwSpSHJ1xHvAugVnWTJ9eTPE2+wk+mH7BX6LCs+kuVeVwoPeZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIbqrbumrWHLga6iNmHHBUSG28WOe/wLxDlRh98o+Q0=;
 b=XoiCChBMQCT/4Q8iiOPFrxM/uFT8bLGOV0ZcBztO3o+UpFJ84roFMLBP18c9Vh9y5EXx0dNPgtKTGwheG7+PNpCMMlkhpD4cxIfN3Rgjy1PxEd+y55SfTPsGh2LV+6RCC9ruyRbVaKfcIN8tljUIlvkfux93uRXB7TuHKBlDnPGXP/LxnVytvLoaEKof8lPy5vMYcTW/DBIP7qL5Lm3whB6Flm3pdjKo9R8fhqZEFU6jggAPZ0Pb8/8c1owO58ETXovz8eHcw/T1ztzigFI1fJk9T2bQMJ34AOGHQIPPwpcMe6t8cZNlq4Nlbc0oUzQUPHDSyb8B/5Ovr2hl6KK6HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6084.namprd11.prod.outlook.com (2603:10b6:a03:489::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 17:48:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 17:48:10 +0000
Date: Thu, 7 Mar 2024 17:47:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/vm : Remove duplicate assignment of
 XE_VM_FLAG_LR_MODE flag.
Message-ID: <Zen9lbZ/C5WXCY5d@DUT025-TGLU.fm.intel.com>
References: <20240307065213.1968688-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240307065213.1968688-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR11CA0038.namprd11.prod.outlook.com
 (2603:10b6:a03:80::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: 261f5b29-1f35-41dc-d758-08dc3ecec129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JTP9CDQ8CIYbQZ+rjo6UJj42TgFmFhvreyhsFbRy7EYlsWMGaK7YCCXKJMNwOYp8dvoCpGmDbXB/EE3x2JQIZrpsJrGexLMqkgHX2bWUYErGqWai9SYWcHLKrUuYamuWzIWwpq/QJt6WkP1JQ4m7zpZEBrrAUsLvHXGg+dtAUZDE5AqAiFCM3MSQpb4/DBLHNZqARLKmPPAj2Nb0Xgei6KPJNNTP3hzUmvlLHvB7eaSwyooHfnlPibpWAXbrrfjsgU9/f1lrQePDYzTDnovFqJEp3KNF/eYstIxT5KEqwvHu0U4DPon7HehM0YaRg6ALUVUH8fd4mK/eYl6HH2s61JEPRvKCMJ6qsNKd0GtsNN/s3hk7ISaPh2GtWiz2nyLolYqWrC9B1pn9KbN8eomjHXWuGPD6LzuCXYEzer8tJGmSehtK3d3w5Gg4FGAnIhf9zHGL6F/12XTMXTxzAksDttLBQlzHoBrjyFm4a02noxYxlfpa/iOk4dvgodd3yAYNxQoCNxFT0M96bBPgr+/9a9JOauhq+0GHYHPYUqCucC5T2xFIJooqEvkv08XIRasngvftJT5CSZVPgx3XhTiWHiHwZw3xcQdyCKA1KQ6hOzrQRQryrkcWCm8glJJ5C5P9Gvv1rRoZvlnVb28DGL9sYgJSUecZWCfoQ+QzvvqGgI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3aukFvPvo1+crCkfVOz8UkYotK2eTKZ5jHkcMqtFNPDEYe6xHoAxdEHyC0Zy?=
 =?us-ascii?Q?6S50FjhV+hLdsIzzu008jexd02i8LnmwLOqUuiUQkoKmVC9qTRBGfCV3NHwG?=
 =?us-ascii?Q?hajllzFcXqhr66dDs7scv+4ewNWGjY2M/d5k86rK3MlLqEvdBK+HZWHpLrUQ?=
 =?us-ascii?Q?bbyRBx4AxkiVZKBuglqBEcOb7/K+KW5ie6L2gRpvx/A086785fY8rwKJYci7?=
 =?us-ascii?Q?7MVcbGsxwJEcPH9g796OE0aPjBOj6rlheG0LLn8sGugcJPr/EzqqCADpJ7RT?=
 =?us-ascii?Q?9uUWbEkGbtJWQzw2t5faGDs8aJKuAADoMMbMTUmM3IX3tlA9/KAhJlI1Sjh4?=
 =?us-ascii?Q?6jPMhnvnsjD8im9+cv1/iYrVk2DrIbLDUUXJlrPg+ut26b4YHK8uCGu/RyyT?=
 =?us-ascii?Q?tSawX11RM6FMDDsrVl2mEYRddLrxDO+qyyxFQqlg8MSDHoZtWva+cE5wnI6R?=
 =?us-ascii?Q?ewIWl2Zb9FQu4PIDJklUAZWpP708MmAHIl3zR5gTtKd66w/BeMO47sYNf+OC?=
 =?us-ascii?Q?5r308U3Y6wsf1UcfcOyycODngmuIcIQ2pDhcrjsLxVwTMjjHdV6/DIuUw4PD?=
 =?us-ascii?Q?3QR8mhIRbfu7CmBnRt2AHOxRD8ybJKW+UGkobJnBzxs9bCYf2S/2IXhSKyCP?=
 =?us-ascii?Q?P5qZe9kDMw3CR2rHL4SObh6FwApgKMutbZ4fr/ztypB6ZtRANMOZ3VlZiArq?=
 =?us-ascii?Q?7bgYA9K6b+jadLj7WFBQ0g4ZHAibFC+mqhC1UgnLqGG9uew86x7hU8VnAxFc?=
 =?us-ascii?Q?4ikFFZi3lCG27PrCjDOj0q9PEMRrDdWk2smS2L6xw1tju80oZrl3DVLjf2As?=
 =?us-ascii?Q?PZQAvVbq9uxYFH/8Y27Q6sSjuWPgvPei3V/kS1Sjog3QOF8cNePPy0c3j7Wq?=
 =?us-ascii?Q?O7YBS36bkrMJ/aQYhVNK86+fUD2V2MCGozBiydPivrwz8/8wre6Y68nsc2Qm?=
 =?us-ascii?Q?IFjig7IvGIEeBBtg5D9L3+c5qEd3QOZDsjr2iaHnooCLpTdnRYetRcjD1VZw?=
 =?us-ascii?Q?qh+lG7WZ8doLAVvlGQFinLvw9uNXdeLwbN+8EFk6WT1/8jKlNUpop9XbonIM?=
 =?us-ascii?Q?Ak1gliiFp8Qcnt/BG1DjyjMzt1TPYw7Lz6w6YjABHPldZ94qsIv8q4PfAbmW?=
 =?us-ascii?Q?LdfC9msuur0EPg2Eo0hYLh/758vwLapRd0/dF7PLjtO1tzS2NLDblxjU2nm7?=
 =?us-ascii?Q?j7ARAW8l8mGIg5qsenNxOLYdFaGMfXbbW4J3nlYkIJkiLjt7YGkQEl4dYQ2j?=
 =?us-ascii?Q?pV9A0FoeX1MfEZZOx2wXQ9qJ7ojaZlYaRaASRmMEPoAg2oFGu8U79DYSyCZ1?=
 =?us-ascii?Q?RGKZbtA83ckOoFv9lAVgwVcvo3Oth8Vkh2/i1u4f2OXz5KOplMH1grMph+yb?=
 =?us-ascii?Q?/5dxXJw1WiGKHMC/1PQXAu0GxQFKH4g+azgq6NG1givWtTFD9exj6I8ZagJg?=
 =?us-ascii?Q?Z/LfS9X+aqw0NODBbGeMoXZX4alNrOvsWFHIISYlGQaFp4/8QZIakRiEKQjz?=
 =?us-ascii?Q?psEOe6rtiyrU/PKz+6aWoyy3M1z5Njg4UgLhIK0gy9ipPlQhtdXJByl8fUmh?=
 =?us-ascii?Q?GBzm2HeVVjMy/ePfg7fPe5ZpXJo34q8i0ccK8aqNuJry7jeQ/xEr+d7asAoE?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 261f5b29-1f35-41dc-d758-08dc3ecec129
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 17:48:10.5918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5pqq40T8rkJkR7xb+U2wlutt+7hV2iqGfat6D0mhiHrXIb46Zqi8fkEflS//85If+goR5nRbwPT11A2K6VA+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6084
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

On Thu, Mar 07, 2024 at 12:22:13PM +0530, Himal Prasad Ghimiray wrote:
> vm->flags are already assigned with passed flags. Remove the redundant
> assignment.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 643b3701a738..b2d2852341c0 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1369,9 +1369,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  		vm->batch_invalidate_tlb = true;
>  	}
>  
> -	if (flags & XE_VM_FLAG_LR_MODE) {
> +	if (vm->flags & XE_VM_FLAG_LR_MODE) {

I'd probably drop this change but it doesn't really matter.

With that:
Reviewed: Matthew Brost <matthew.brost@intel.com>

>  		INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
> -		vm->flags |= XE_VM_FLAG_LR_MODE;
>  		vm->batch_invalidate_tlb = false;
>  	}
>  
> -- 
> 2.25.1
> 
