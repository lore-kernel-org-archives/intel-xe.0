Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7485CF2564
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 00:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C90A10E212;
	Wed, 19 Nov 2025 00:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpS6v5Vh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9159110E212
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 00:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763511892; x=1795047892;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bfO+3uBOiC/VI3F1drTViRuPv2Pi6nsMcvO0gpUsi3k=;
 b=cpS6v5VhvhnSmue+wxwd99mN3eaOHCRTWbbM8rQ7psgTAx6xM1Hw1QU7
 MB3bToBliM43Hy/uzw9rKYNc2nTqiGNl7zI0LSI7LOlGE9OniSGG7FD1/
 7kJUL3LXHwWBmrTM2T/liZSIYi19AQ7qw68BOX4K8Uj4D9RJ7irKo7GA0
 jjo/VTT/nIk0Z9Cn7iiqwuv/mQywMHzfj8UjDe7qCYLB0Ml9k+dYlzZrq
 8zjTJxyXkKswLGYpanzHpF3Q66ekEBTaJJjDc8kx3l9EdgKXwqAIz+ZXR
 dokqlG2a8NMhZQzhxagUP9qlzRKxIXV3i3HuJBgtP9+yILwwkshNSnFd0 g==;
X-CSE-ConnectionGUID: H+0pzO2nSzar3CXlMH2RtQ==
X-CSE-MsgGUID: RdD4k9uuRuOMPPOSuMz9qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="88199329"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="88199329"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 16:24:52 -0800
X-CSE-ConnectionGUID: vj4hok0NT4aJnzudBOJBLA==
X-CSE-MsgGUID: 7UPx/jcHSR2ljOeviLi6xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="195020753"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 16:24:51 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 16:24:50 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 16:24:50 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 16:24:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+6XISb5w7a8A4xC/4XC+B/vn0s77ExbAlQ2OlFjYkfAmv1PGz2gGwCBfVZ6w/4oNEGit+ygbabgOfolYIGi2KpKWLDZaiFiz6P3dZgOLihM/IGVVGSggqp6fEuKgYzARKm4yWI4sG0sfh+Qau9VAT43yN6TIlizECC4UfmcNajuGy2RrHwyGEsmkTH+gPCLKS7VEvBSvNyOkZwAGnogkT4IU0+3sdzhGAE9+lN4VC9CPZADjf6t4dGqhRleiW2Bb4qXHH4g0+chyWwVe5Kmu5lrtXXGCY7vb/yMCGctRTc46LyXRNNOvLq6a8oxc3fSV/on9igaabtcO5woEizsIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCbHu943NY5XP0J9m5t4mNa19JdlmIsSBe3vBOCKSBA=;
 b=nWMOUDCWeojli5wC8a1KXebIR8VKCr2d5igJYUDLRJgFE3M0WgJy7tgnDg2EKRrnPHsitVGfEB34i/i5ZA3q62AOgi1kWRDej6Cx52mKHBujH8Fy7vwJSyrZ591dtsA4aSAi/WLxj7UMYHxDCmzbfYVinP0kYiN8G0NZJDvIEDKi+2RUEwSf0OeOcTWi7X/+ZRB1XyA1zzacf7IyusGNZMHjmBk1C3rRTYsg3Qk8WizTaaNx7YhtX7Hnndpf/E3xg5yhJBfMqYXo8zahN5AcSV7f3QjsqRj5tDnEEhf253Gp+PdalLMnOoEfIlMw8/FhdH8tn57riRinjUrFZbmrsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7847.namprd11.prod.outlook.com (2603:10b6:930:7c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 00:24:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 00:24:49 +0000
Date: Tue, 18 Nov 2025 16:24:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/vm: Use for_each_tlb_inval() to calculate
 invalidation fences
Message-ID: <aR0OTtewOKdF6TQs@lstrano-desk.jf.intel.com>
References: <20251118201439.3688178-2-matthew.d.roper@intel.com>
 <20251118202604.3715782-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251118202604.3715782-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0087.namprd04.prod.outlook.com
 (2603:10b6:303:6b::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: b80e7be8-fcd2-4b1a-4897-08de27020c94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nFQENVUwpqRlY5LwyFHw5KGhoPni4qNqzlCAjV6RlWtvzNPmmfekWs6YeT8i?=
 =?us-ascii?Q?816989Hrr3zgoBXQ8qMokHNowEt+TFK48mXbKy0qoxMaSVdYqzv0sbeLOwvq?=
 =?us-ascii?Q?p56Wug8krYZD2tVddKOnMY5pY3hRwvsldUCKibfN8feyqvk46Ox4l1vvDIC6?=
 =?us-ascii?Q?C4WrqtlLMzDJRr3fWaznVC52CvNWkaMsPkAKrX89g262PdY51zl5/NfrT5ry?=
 =?us-ascii?Q?8/Hkn/PkEBeg5yrOpCLeH+Y6veQ85OLut+8sVtxLvQ/KmDfN+2QgAMGcpLvB?=
 =?us-ascii?Q?L1DHbdmHd0Pbf5r1JBbD1hvTl5ex/rmK5LWWlmiRMBwMZTMsLcVmlSL11cgn?=
 =?us-ascii?Q?NTqCo/PHgdnUdPMM3nBJ5f8tpRwkUsLz1d1ak/SyMtuPzxXeZIFagjteIwKu?=
 =?us-ascii?Q?eM1UxpzHy/Y2vloDlvB7h3F4YL4VLJo/P14I91DWg0rAWjmrRI1NsiEjUJof?=
 =?us-ascii?Q?i2H+tqhhNK6z5CXkpsETlpViSPCBEOpETRR4qxcm49X4u49uwjW8iWk+t12m?=
 =?us-ascii?Q?Mvc53VSkCRG+HC3jiP2pN/B9RBQnj6al1gxk9WVnJmVFyWaoVqGXdnB1bZPc?=
 =?us-ascii?Q?G4KzIOPzQ15gQ4Ooyy/Uiqh6+hGKRNZgy/C05HTg6pHGXHDjtOIwKZob5VJD?=
 =?us-ascii?Q?1ARuzOIfCneO+r0Kl42++bJtIe6oUcNtjN1P1cHE6TuNMCujgsCXKwglvhvw?=
 =?us-ascii?Q?RE/+1al6Q1jIJW3NYtOe2cLiSEXaputBvjr9d2rA1+CqsSRYIc84E3vQyIbr?=
 =?us-ascii?Q?EsXKCOCFmABcfVdTVHiNX+VmJilvrtHPXcsB8esY79AqovZcCNNMfChzOjgI?=
 =?us-ascii?Q?J9mrHbvgYWAj8J4Iqz7+phUZcK6MpqzdoZhp3BbEftECjjpnyBxRCzok2IpB?=
 =?us-ascii?Q?Sh2Fm0BBy/NDBeRPvuQvujLxljCBHpKyQQK8Iw/VQdRpcAYfqznHr8BphPfD?=
 =?us-ascii?Q?5DzZVvwxTAehVV+kKKJ8g/w2bSXxY8kDtUzj58L5P+flhrJG7FD5T5u0T/Gt?=
 =?us-ascii?Q?HAwRVWZnNy12sWQWx29RjacZjovYGqm5BfDBrnnN7hxvwi8WZK2UUspTbr0M?=
 =?us-ascii?Q?Blbm8oi112EiuLyrK9BOtWsvwBvFMnEzjuP3vN2gVoFMT6qp+IYaxD+MjwwA?=
 =?us-ascii?Q?jVIKjTpenJGi9ca3hEpUk5W9OT4r077FCTmlTvEwAZgoqZyjLNjhrbL6M21n?=
 =?us-ascii?Q?0Ddsu8TH3rD0wWk4mLusXUkRsCcpDMQzF7Xgdp3L5lGwm/xhs/Q1+LhmrYtI?=
 =?us-ascii?Q?bUkncXSA7ae1v+7obDwUDXb9IDvQoBx1ovTKO5vnQ+YS1mWookD1tYp/GqGc?=
 =?us-ascii?Q?6QKNZLBfrw7eTvLb7cEOopGJfAeetVyl2bohVekLumzpigLC5Jo76ktM+fk9?=
 =?us-ascii?Q?uxanEVVKoc3oXW+eOnJGRFeZVEmWKYQ+kRBcbXTWSTWsM1raGwF0umR/X2Yy?=
 =?us-ascii?Q?TAzEGAWj3BoMFzbQPa+x3/9zKMLI7n0X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cs7Mw9kchze4iRPhGadBlEbFG8/4fh6o/mHR8Oq12HTzW8T2zHSlEJM2txpE?=
 =?us-ascii?Q?B4AB47fE4gohhl3SpBtdNumuT0AlbkdTvOU+4P73XzgRobXwpm3vskQPaO3f?=
 =?us-ascii?Q?oUuLtnMpyVAyzbgCwlf+8xNHQpxmEfoG21jEnWsNDPPHMUPLUWCLOQx6WekP?=
 =?us-ascii?Q?2/4Sb0MaQWCV5VNtdGHx99OLSLQqxD8AZf1eQQLeBjMRIDkCnMchVgkpRZqP?=
 =?us-ascii?Q?MQCJhUA/OVXSxYmRyTLC5C3YRgg3shIUnd1rcL9Se4WAqRBB5CjVKo4c/731?=
 =?us-ascii?Q?MAKdZEHqR02pkJEEnr1GizZv/cA8oWYw+Ofq10n7dLHI6R37pI2ymq259zNQ?=
 =?us-ascii?Q?Q1BiLBSysFnmOfCJtq5MY4y+c2FEI70BZdQNLz5/t/8ax70dZNvYViZfdhfv?=
 =?us-ascii?Q?qBn2JpMkK0Jcbnwf9ZsxNLirNmZFigRyWxnK2cX9Qh6OyRdOwDGKxqIatZhd?=
 =?us-ascii?Q?3ILfb01FEMcrfKPZYyKYs+cCYofJNj4T8Z7AaQNv5Fb5DylKMFqnEHz4txxe?=
 =?us-ascii?Q?G1UFGQlXtua5G9JQ3vpNXEuMofLy23jq7GQdstFEVIsYRvcSQGAwWiJn3EHj?=
 =?us-ascii?Q?2mtlYQYS9DyLjcrbKLHynk85Lu889By7s0w0rW+UpKfHQH20H/QDjUHNHph7?=
 =?us-ascii?Q?vPHRNsaqKPlFMqoWuJ6XsE+h+IEHy5FxsyOt30Gej0qXengRvFmj8KT2+its?=
 =?us-ascii?Q?W1vsYDH7a5OGrcXOGXdE6ASj4DPuJA/oeVSPUiBFCgzLWqJe9BZd4bmRWSvT?=
 =?us-ascii?Q?mmiCy3Kq1tn8XoagaH0DxHYKa2efqBAajSseUD+0Ov4nr7nSZ9FDvcH4ZkL8?=
 =?us-ascii?Q?aDx7AvzO+IEsoatPozfjOl5PALdTZOPg/uFDn/0SA6l4WoIyVQAeykHf/UTR?=
 =?us-ascii?Q?vHSgJfQb/hDr/4FWQKE1n9tjsDEHtd7oKf6q7stIqAr8+icDbOWmB9qZ8OQX?=
 =?us-ascii?Q?epD2bf/0wyJtB3Snu2pG5PZi4E2SD82N259pcZhSy/N8rF3UDTydqJ+onGYw?=
 =?us-ascii?Q?nDzUl9pjYvd8Zbx56hZ2wPQZGybdfKSTiv8pVBmvSNvqFtn0B5IUdNs8bM51?=
 =?us-ascii?Q?H1h5vFK2T4x8ks4PNMiVFcr+YFP0ooUJYOoVVvmsnCuNhgljQqlKIl+P94uN?=
 =?us-ascii?Q?Wptbi7nPw6yu0+n5xr12Tcwex08CvmTIp7SwiqKkrZd8IyClt1l0HQVfrJlX?=
 =?us-ascii?Q?DS9VVwfO4TWaOfWgoIxU1tsECGSx9QW87fyVeXFJEPZegGbXqdJ35ikK62by?=
 =?us-ascii?Q?k1ldN48kWPzSpkO4iuh4pNhK3enzfT/UcYenA6zU0GVgRG/7XdOF22H9/U6l?=
 =?us-ascii?Q?AGtecIuukKUilfAMvcOC3bdMhEUQcHAjNc05HKZTNXfxa3kUsWnNex2Ijfre?=
 =?us-ascii?Q?hynSQ8Fn8sMMFC4zulVBS6Ryo9NMsVMOylOryzxyTr7GYU7HVHInBgJJOuvr?=
 =?us-ascii?Q?3/1Q3kYnh7L+XCMy9oYDRhLabGOPYk2kkeHeBnxdtig1yh73Ha1VUFESl6tH?=
 =?us-ascii?Q?42lOj3GqmAYZcU3YNOVwYA7oxzpnUK0+ohNm27kCHMdFhhLa+os6iwLTlSnn?=
 =?us-ascii?Q?NXo5UeLi25acCpJUqNmTbQMcppVFVY3Tf9Gx00tGktmGxVr8eeXljbLxekfY?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b80e7be8-fcd2-4b1a-4897-08de27020c94
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 00:24:48.9762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gQn5xrACgZscokButrylO+WSosOTXEUEf3H+fdbPaCwjTzEAYjp1qdiHkV75vh5KLpVjrljF3P1RMPkqPFXAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7847
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

On Tue, Nov 18, 2025 at 12:26:05PM -0800, Matt Roper wrote:
> ops_execute() calculates the size of a fence array based on
> XE_MAX_GT_PER_TILE, while the code that actually fills in the fence
> array uses a for_each_tlb_inval() iterator.  This works out okay today
> since both approaches come up with the same number of invalidation
> fences (2: primary GT invalidation + media GT invalidation), but could
> be problematic in the future if there isn't a 1:1 relationship between
> TLBs needing invalidation and potential GTs on the tile.
> 
> Adjust the allocation code to use the same for_each_tlb_inval()
> counting logic as the code that fills the array to future-proof the
> code.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Replied to wrong version:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> v2:
>  - Add missing local variable movement that I forgot to commit before
>    sending v1.
> 
>  drivers/gpu/drm/xe/xe_vm.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7cac646bdf1c..f9989a7a710c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3104,19 +3104,19 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
>  	struct dma_fence *fence = NULL;
>  	struct dma_fence **fences = NULL;
>  	struct dma_fence_array *cf = NULL;
> -	int number_tiles = 0, current_fence = 0, n_fence = 0, err;
> +	int number_tiles = 0, current_fence = 0, n_fence = 0, err, i;
>  	u8 id;
>  
>  	number_tiles = vm_ops_setup_tile_args(vm, vops);
>  	if (number_tiles == 0)
>  		return ERR_PTR(-ENODATA);
>  
> -	if (vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT) {
> -		for_each_tile(tile, vm->xe, id)
> -			++n_fence;
> -	} else {
> -		for_each_tile(tile, vm->xe, id)
> -			n_fence += (1 + XE_MAX_GT_PER_TILE);
> +	for_each_tile(tile, vm->xe, id) {
> +		++n_fence;
> +
> +		if (!(vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT))
> +			for_each_tlb_inval(i)
> +				++n_fence;
>  	}
>  
>  	fences = kmalloc_array(n_fence, sizeof(*fences), GFP_KERNEL);
> @@ -3146,7 +3146,6 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
>  
>  	for_each_tile(tile, vm->xe, id) {
>  		struct xe_exec_queue *q = vops->pt_update_ops[tile->id].q;
> -		int i;
>  
>  		fence = NULL;
>  		if (!vops->pt_update_ops[id].num_ops)
> -- 
> 2.51.1
> 
