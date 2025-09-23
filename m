Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AB6CAC5AC
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 17:29:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2835B10E15E;
	Tue, 23 Sep 2025 17:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kEhvjaC8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7074B10E15E
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 17:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758648590; x=1790184590;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4Hhz1UImapWf5TzngCabTooNCiR6u0mK4mo3u36lLwk=;
 b=kEhvjaC8uEZ0Sd8zrcAE/xgaAiuJiIQsPRb5zQlW5/GiI2vz6UeQiDLW
 invfc4gR6TNc2qFqYoNqKazf8QV8iJePILnQl29W/46fUFB8la68vOITz
 Nzfx946LQuDW0hxEz4zgRDSychaNtT5hWjgH8eRuDZcfPBO0w7i40NRue
 S0T12Ue5pPkPhUhYG2Ych/Md/VLNCg4zVmPyvIwqog6oVV/X6/wozmK3l
 oPKCuslEQXON7ejks26dAJtl5/k2JMnJNo0nzJWCSyGxQOtMxs+UIUD70
 fKCeGCOtlgFeief4W0yvgWMqX1HUr42CpshfAXdB262mU7SIyJhZa2MPI A==;
X-CSE-ConnectionGUID: bYWMeeatSMGaDqPT5tDqbg==
X-CSE-MsgGUID: L2aBmGo7TTOncDL9TWHooQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="83540711"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="83540711"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 10:29:49 -0700
X-CSE-ConnectionGUID: oGCPVSiRTQ6GPvUXRuhCLQ==
X-CSE-MsgGUID: 9Ou6Jd2TTtWye0z0xEXosg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="213962875"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 10:29:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 10:29:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 10:29:48 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 10:29:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fw3sAgeeRfVoM8DrIpVLxWXd+zu50DtnitIfj1EX8d0LFedJBGV8SfZCxF8lu+tAa8V59tVdJ3XXTkDBuUSoVdlCEJp5h9p54QM3MyG+DAD4xVFGVL+YmgE1PHTrsCFBfvWT2WaLX7BPVjjXWrxk8nLJljB9pxsP6RvuN0zZXJUrb/oTltphWY6xL8XKFt73ticdOr+Qa714QQFHG4ysROA6FnT1UFzH0Ia0oQQM7XfeaIzbn64YtRTj8ax2IZapjDlE0D7CD4WXtCzwptZNjbWrR9sgcIfSYDbdtYxP28gQj661w7UTXP4acPR/JnwVvr7Nw5uGTH1/x3mF/tphhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgue/KRG3hGDendYOrRNC0Zl3qTybu/zGbTYSXaRnfw=;
 b=J7XAyX6vBarT7Gy/e46srIRmIpUfYKLznDIO82XYiSMs22nu7EK09K3fBA9aGxJRzn1I+GY1OcPN1myQuFOm21iBj8RLkYRHUOAs3RIbTONOgqy6vqxK3ovEbsOzXyGY4ZNKcjvU6c98Y6YyNcu0rQ1EN6g6yrfytHCiGApCblLDuqvWPkXggj08mTJXGko38cGcP8Yc3nSJMpud1ZrqYekPja8FVM9/wEUlm5sKrCMPL9IRpr/lvbo8NpVCpOzIMgzItOZ6l/WL6h03e59lhf4NxMckKPAVJSNYLJ+XYfcVxaaI6TREBvtMNpU1XHFOVJuBPkU/liWnoPnHf80pvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5952.namprd11.prod.outlook.com (2603:10b6:510:147::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 17:29:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 17:29:44 +0000
Date: Tue, 23 Sep 2025 10:29:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@intel.com>
Subject: Re: [PATCH v1 5/5] drm/xe: perform on-demand decompression on VMA
 pagefaults
Message-ID: <aNLZBtZQbHdspk6b@lstrano-desk.jf.intel.com>
References: <20250918142529.608432-1-nitin.r.gote@intel.com>
 <20250918142529.608432-6-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250918142529.608432-6-nitin.r.gote@intel.com>
X-ClientProxiedBy: MW4PR03CA0138.namprd03.prod.outlook.com
 (2603:10b6:303:8c::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: 123888f0-63ee-435b-bab3-08ddfac6c960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pgeZLrgR0jjQ6spAaul2Xz+yQxanw/Qmdjxegln6GDm3JwYUjv/DS5P7DjIX?=
 =?us-ascii?Q?KxxoRnF7AZp7lyaP6ljZ2LJUPwBGPaRBCMcN7WZCjSSIahg4ErutJXcWfjVO?=
 =?us-ascii?Q?7GP3bOvJPyY9AHbC0zFQevK0UFC7bP81YYFs06G5TNPMXtiS9ReT44JL0UtQ?=
 =?us-ascii?Q?5oKs3yoye4Fz0bCIrD9HFqfcopGwoDaN097Tcr6RPeI1AGsA4p3N68G9WgNs?=
 =?us-ascii?Q?x7+QLYvYFJ6ohyRl/IkjhhA5rQ6S2F8FB5fDt56jfzVUEwgbjdu9dCZPEDt0?=
 =?us-ascii?Q?djuvjZqy3ZzwToa9JQ/uO70jimCieLaBZsqqLZI7u+i11bfXl/DRDesQ+U/M?=
 =?us-ascii?Q?ScAQ+rE2sp8fuEUUFBlCIcc6TjU5RYgsE02bacuEbvM3GckiXby12A6IZ4Fa?=
 =?us-ascii?Q?PxpB2Z1rWytQGfpUADWPGFYlAJwf5RMGpkBJlTxBnvNBbh0TVVeFKlvcpQ9P?=
 =?us-ascii?Q?gtsuXeci6ii2ARisqZoRzVwxS4g97ENhkHqKy09SrQNGCMWOMPzHkLpY2N6v?=
 =?us-ascii?Q?nfilE1scEJmojZU3kgIQl4n43C4owjR4fU73pvThjOk6YLeXFNDwBg/n2G9K?=
 =?us-ascii?Q?oKBQwQf07771OLZL2QDMx6yeEsgEM5wfsXx80QjnOq0OlN2r2ZQ9el3FgUvA?=
 =?us-ascii?Q?psBr+UsJ6zg8m7iuH8qDUI9OUwhjFw3K2yLPQEJsuI2+YQvz1A7EtPndtXZJ?=
 =?us-ascii?Q?00+/Iz25YDyF5m0pRNf0ROZBxh88LcZJPDjydtJiPPGLdmgUrvOQGwveMqmU?=
 =?us-ascii?Q?tG0KpWjh5ETRE+P8Zeu47GcP4nSCy5UImqCJ32CIqFg0ksvBhpG/Cw8JMHbk?=
 =?us-ascii?Q?b0ZTuDpuCHnSUwaBsmSSnrHO44uIgS8Noe7fLMBIU3lzeLU5+/agQscB2bYF?=
 =?us-ascii?Q?3SKC0iwz/Z8zCmoWxffXYJ04mrkwlvFcKEoPG6NLUcFCmU05bj/VUy/PS9D+?=
 =?us-ascii?Q?+i6IcQzJ83FhRovBB7Qb/ftJcpi6N7wAmKdunnF+/5fyhdHnudZBlCo+8y+B?=
 =?us-ascii?Q?VEXUj8nJa3i4r3KhtThV+Idto6q1O5wQ0ceI1smKub+iGt9hQHqVqj+cbkVL?=
 =?us-ascii?Q?6fRTc38ZmUmreDzWvh55CsgMJzD929MfZOzdkQIFYQvJAo+Pn2aGx5Bt4NlG?=
 =?us-ascii?Q?snrWVoGX8cYgEg5/1gedYtXyz+uRnVJHJ2eK3T1z2a4i5GvmkUUu5Oj5iBjG?=
 =?us-ascii?Q?w1wKXhlUkxTxb9WhcErvZ0Kln+XakVfF3OmaMMMtwaWAM7yPYSofRfdm0NZM?=
 =?us-ascii?Q?qMdsfh5ZjCmTz3t/tVieVpyS8jtahfZvoi8ieck4cygyoV9fSMYhYPYWWaEB?=
 =?us-ascii?Q?CsmApz8Z4xqUBgOWbI1gNy5pwfT/QtlQSZo/+jwxtDS8ifPl0mOkq0giWCu6?=
 =?us-ascii?Q?6l+1WUOCGFemyH051JNIH9GrRQNlFOi74eGKSgi60inCPgheL+4UeO2D4akq?=
 =?us-ascii?Q?NnoI0KuhP0E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hse+BQC9kKKkQH2509LgdBAC7LmL41ja2+MDrhY8MqMpekkyGQhTJCYrDJBE?=
 =?us-ascii?Q?t2mN7nznNzIDpiQlK2rISmbNEM0WUInt6d1ZnIWKdMiT0I6ZQ1vohR/xoZ7P?=
 =?us-ascii?Q?Ga/0urzwHFw/k8zbVQGtH1qtWnlIQ9XiXoHTG8EniMDOFZcQ63WLovx8774f?=
 =?us-ascii?Q?avdW6F6jXuqvmwxaMBDN7KQ7O/WzmOQItQJR5iHfRGgwc4Cy8u0BMToPYofa?=
 =?us-ascii?Q?mg2XPDrwEWrtI3bQJhMz8w3aEClA85yJ0jV4Xo5xG9IbGbxi2pYlPfkWjicV?=
 =?us-ascii?Q?XPwnmSKcwMxZb2AWyRW+UgRxhAA6p5rCJn2Up7/YbHTyHC+fHanegxjUn3YZ?=
 =?us-ascii?Q?/rBuF1tZadXyqo8O5rvIlZi9A0HyNTfkhWwJpl+Ybl5HM5ivFrUhphlxCvNL?=
 =?us-ascii?Q?H+RFvNZGILShs0wCIQBAtqdGouPINOuZ/Zf7Rha8tVDqxaMNFlMl7ouOOODc?=
 =?us-ascii?Q?eqEog8cZ1S9//Nb0n7NO4R9bAtG2FQ5MrObOVRoYfkOCyQ0a97cxK8l7PQEX?=
 =?us-ascii?Q?oEM+0q7N8AF7uaR7+bE6rIBB9FHMdpcF6UVPhsI98d4Opg8eWoi7UEereQqY?=
 =?us-ascii?Q?TEwXYNiDVbbgWjn0wQfQEIu2qU33GWVVWZkDSZCzrtGJ6o7MnMZikawI2MC/?=
 =?us-ascii?Q?DV0lDwiuKUKy1TxvczdwDke6yxjo5ToHNw5v3TY9ojT59oP0XgdgD2p49zs5?=
 =?us-ascii?Q?74fsA1Ex1Y4Tl6kO5dD1Aq260LjsjYSId2uT8supqyhELneVrvOab5rFK8Jt?=
 =?us-ascii?Q?roi2TVZkdDOtuve02/w+dlxab3EZP2xY+Mrsln5LNBItDMGeQ+VxGMxnhycB?=
 =?us-ascii?Q?M7HtCS/jIjUPuTWJlnG3aATlmqz3L1A5SOkggpArcZBmfXsooObGO1ZKNrbf?=
 =?us-ascii?Q?//qFtPtPY5fD4TwpeP4FgAa6cPZVT9mUTQ+2Iv4z9tJurGfY30BXdFfuzNnf?=
 =?us-ascii?Q?cpGXKocvlvBBX7x5DgMJ/hwxF+SgREx/d8SOwM756upE0WqTX+bix47/SaH9?=
 =?us-ascii?Q?BWu5lh4SEheyRIxvtGA4BY0ASPbuPLodJzwRp9BnT4lkF4aTZMSfhabzCrXm?=
 =?us-ascii?Q?JXOA2aZXcwh+RSD/CAqAaCX9eYd1zm+IP6Y8FcnVqhdhYQqpBOzqV8HoNSMZ?=
 =?us-ascii?Q?+ihnduWSTA57+9Xaqy9jbsxVaMb9GePQYp8CSnATSLTT2FOyRXhqtcd9wn67?=
 =?us-ascii?Q?X4gB/xFChlYAHQjjpNXy6fWLEwjCnQF4ntyK3ZIqKrlmjR+3lW6ZDksCwsAS?=
 =?us-ascii?Q?+JfLh+phtk38S0jvCqGXkMLTle2JkRssb9SecF4mWoz+/WrDPy1BaHfN1l3A?=
 =?us-ascii?Q?/Fy1GVLqu1uLxv/i8oqQWLKqSH9lTedcaRyCGWt2+TxE3XqqXBx3LPnSuMTy?=
 =?us-ascii?Q?U5Q6VpW0zfz5XsgK0yH1PrX1TAHZk6pZZPvTEGcWN/3daVW2ASzUfz2130om?=
 =?us-ascii?Q?d2VoMSvWmr31LQG/thXHRKMRap2aA33KIV5i+iYD8XH0/J/qCOYqYN8qlWGH?=
 =?us-ascii?Q?c1Xr7VRJ5GlmhopDIrp5RG8wZBm4Zt1gFSPQlUGiVLTU8uMlmK8MvgeapzBR?=
 =?us-ascii?Q?yyi6/NFHJ+eIVD+OwaAeaZBXQBWMFijLv8io/eT3BwYaoVHDLyVvh77tU672?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 123888f0-63ee-435b-bab3-08ddfac6c960
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 17:29:44.6800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7xGKmNr2x1IpuMN+cP54BBMoYf8miln9ZFBRaYvBARetJUh6xC8+hDSo9He3+lIDvi7GFyE6VMyisxF7DBGpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5952
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

On Thu, Sep 18, 2025 at 07:55:29PM +0530, Nitin Gote wrote:
> When a VMA pagefault occurs and the bound BO has the DECOMPRESS flag,
> schedule a resolve (xe_migrate_resolve) to perform per-page decompression
> before binding the VMA to the faulting GT.
> 
> Behavior:
>  - schedule xe_migrate_resolve() while holding appropriate reservations,
>  - wait on the returned fence, then clear the BO's DECOMPRESS flag
>    on success,
>  - proceed with the normal rebind path.
> 
> This ensures on-demand fault-time decompression works consistently with
> the VM_BIND path.
> 

Why special case decompress for page faults? I don't really understand
the reasoning. Beyond that, there are quite of few problematic issues
with the way this is implemented but I don't see the point in going over
until I understand why this special cased (i.e., why don't you just do
this in the bind IOCTL?).

Matt 

> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 41 ++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index a054d6010ae0..4a3f2682ed85 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -95,11 +95,14 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
>  				bool atomic)
>  {
>  	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct xe_bo *bo = xe_vma_bo(vma);
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_validation_ctx ctx;
>  	struct drm_exec exec;
>  	struct dma_fence *fence;
>  	int err, needs_vram;
> +	bool needs_decompression = false;
> +	struct dma_fence *decomp_fence = NULL;
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
> @@ -112,8 +115,14 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
>  
>  	trace_xe_vma_pagefault(vma);
>  
> +	/* Check if decompression is needed */
> +	if (bo && (bo->flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS)) {
> +		needs_decompression = true;
> +		drm_dbg(&vm->xe->drm, "Decompressing VMA during page fault handling\n");
> +	}
> +
>  	/* Check if VMA is valid, opportunistic check only */
> -	if (vma_is_valid(tile, vma) && !atomic)
> +	if (vma_is_valid(tile, vma) && !atomic && !needs_decompression)
>  		return 0;
>  
>  retry_userptr:
> @@ -135,6 +144,21 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
>  		if (err)
>  			goto unlock_dma_resv;
>  
> +		/* Perform decompression inside proper locking context */
> +		if (needs_decompression) {
> +			decomp_fence = xe_migrate_resolve(tile->migrate, xe_vma_bo(vma),
> +							  xe_vma_bo(vma),
> +							  xe_vma_bo(vma)->ttm.resource,
> +							  xe_vma_bo(vma)->ttm.resource,
> +							  false);
> +			if (IS_ERR(decomp_fence)) {
> +				drm_err(&vm->xe->drm,
> +					"Decompression failed during page fault handling\n");
> +				err = PTR_ERR(decomp_fence);
> +				goto unlock_dma_resv;
> +			}
> +		}
> +
>  		/* Bind VMA only to the GT that has faulted */
>  		trace_xe_vma_pf_bind(vma);
>  		xe_vm_set_validation_exec(vm, &exec);
> @@ -147,8 +171,19 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
>  		}
>  	}
>  
> -	dma_fence_wait(fence, false);
> -	dma_fence_put(fence);
> +	/* Wait for decompression first, then rebind */
> +	if (decomp_fence) {
> +		dma_fence_wait(decomp_fence, false);
> +		dma_fence_put(decomp_fence);
> +
> +		/* Clear the decompression flag after successful decompression */
> +		bo->flags &= ~DRM_XE_VM_BIND_FLAG_DECOMPRESS;
> +	}
> +
> +	if (fence) {
> +		dma_fence_wait(fence, false);
> +		dma_fence_put(fence);
> +	}
>  
>  unlock_dma_resv:
>  	xe_validation_ctx_fini(&ctx);
> -- 
> 2.25.1
> 
