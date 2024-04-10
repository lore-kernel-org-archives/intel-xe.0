Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6080ECD1284
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 22:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E4B10E794;
	Wed, 10 Apr 2024 22:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KxLCzJnq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0121410E8C6
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 22:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712788070; x=1744324070;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1VZt25UW06NpQiOFX8tGmhkWLDzUu05bejCaIe1kkg0=;
 b=KxLCzJnq9YJ8Il1rAj9AyOCRj1g+mgNcaBa9q0s9f+drYqFXr3CqA672
 Rn3yWJRSbBthsmv6hW2ySlLH6EVi6oRXmFSSYVrm4uvYMyUi0jY0j3YZ1
 AYWrPJVEcUqQ4sViNibqtYonby41mr2p5pyP3GXhkYaCXWTkjvdDr0bnM
 FM60bilDxu2cTdku8KyTLt+kX8oV5+Z58hKy/qZpLJmfuHGZGw89xXy6O
 XN1ym+sFV139Ir9OG5h3StLxDrt6dgknLF4B9fBc3g/AveXrbB+nwpoDB
 AutrQ4AaUn2KjX2JJ7WMU6yqyk2ArYpYmiGcNL/tYq85WT0czWftzgyh/ w==;
X-CSE-ConnectionGUID: Jlsvq4tQTFKwqGpTnc8igA==
X-CSE-MsgGUID: qmWRmaBoQZ2GPESqjcA4/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19571165"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="19571165"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 15:27:49 -0700
X-CSE-ConnectionGUID: lyF1Y22wT3OVhWYo9HhRqA==
X-CSE-MsgGUID: mrxznkX1SqeoLQyLQN9kag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="20740740"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 15:27:49 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 15:27:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 15:27:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 15:27:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWMVLcz/KoQauNfQbsGXWDO2Hj/YHSQNvBxOLZNISlj4DiB9+zxgpbrGy+JapJVOJPoWtZTat6v4vNAsrwMYHoCz/hlCmjRN8i1md+9KosDYG1g8cgwSIeyI8Pn4KnRskrr0Op1BV4KVFqq7FTWFlGET4gKeCWKeNgy/vQl+YvoM0OPH4FjpsNKZDdDvyAv/2x9RBQJuCwDM+EfZ3jLQfVYAx6ToXlY+yz2AIiuqjr3t8dg9iJxtQ6CWDkcLY0kmuCXZheqIFIxSEjm6qVVdFKNnkBO2aF/y/dmTilc8bPxIoxTkggSlBO2qCGmpB2mPrEuT2z9/aCfMgiFjG8PPQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGyI9V8G3fRs6PjAAKkwWJ+xWqS/ItZuuGvJ6kPGKHk=;
 b=MC4VIy+Vf7P7S4F5iq/aos+Vkm31wU/2Ju26UerpeeFNkRCa5StlZu/PwMvDvqj4N3Tr8g52RlxsQ9fk+rSExHcecbLx7L5sYS17vZ50bNjN1HKrgHV3S3wpRflUku8zfVxZojjZnO9KS2kXckxoPH1DdKBpfMUVcXRJ/k/AKO5RL5XVT7OEuya/7uSDN3z+uWN0CrefmdINBRzkgFznALHLrxfRpbTg/RdfT0ldT2S9wAE7czWS31exueGr4uBtn099A3ThSA7g3e7VD4V+9PuqvedrkaemRkIydGtFPf76R2WgivN1QR0/qa7NR5W9lO7bAN7tFcCYQ59ZfiZw7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6374.namprd11.prod.outlook.com (2603:10b6:8:ca::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.26; Wed, 10 Apr 2024 22:27:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 22:27:42 +0000
Date: Wed, 10 Apr 2024 22:26:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <krishnaiah.bommu@intel.com>, <Thomas.Hellstrom@linux.intel.com>,
 <brian.welty@intel.com>
Subject: Re: [v2 26/31] drm/xe: Make function lookup_vma public
Message-ID: <ZhcSG/xZch1mzgkE@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-27-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240409201742.3042626-27-oak.zeng@intel.com>
X-ClientProxiedBy: BYAPR11CA0071.namprd11.prod.outlook.com
 (2603:10b6:a03:80::48) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6374:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QDapFL23Dn8crclN9v/2O5qElhaJ8ij94vm+qX3rKxOj8Ny3oevhS2uwCbNV/rTom+nKa3HD6eG6UqOuj03Vt+1Kdcmi+D0TG2nGAaBN7QXe/G18oxqYDP9IDQETPT2qvelTa6f+Qb2BdO+Shh+PYUuwZ08OEhWS6ONGnLSRL37rsxP3Q67uzEoshB3ixGorNdF6S7yeWyhnqemVqhUtSkwVs62Z/emF8PBjGp6Axt+LDFJhIrPOidbkPM3AOnKtGV0PGdfHgn765Nk2/nbvEkAtZOuv5nEQSGMNykcrFJCQfQCNqZxqazS6iGp2zxdaXYUmrCoqcnOGj2OM68nl6GLSXFirfoWMe6ppdcIkkKevWwhkft7MQUu86KEk/JUhtyGgPJ3hM60ToXljF1ak8EUb7zD/h8buNAqop5Z33ldcnPKFANW5yEhgH9SKcFR9F23gEgyy4NGshVPY387iIeUXnABKKYQSH+k+a1UJH/dH9lLo489i2rgLthSmrBcRTF4aDsGqRHLrjyhEvSYC+drwi4R05JIwdUPTDEWmS1IFanQGkZzz/Opmj2DCgKdMALMhccEaJV0cvN+VPiXay97gmWlW1HWCfRWwTYw9rMuBzFc196E+c5yC2O/LhaW+kABWOh+z1hVe+avxk61oYZaMk+m4o0J3ZUZk/6RWwlM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q6E/rNcRrUzbbeROaDh4KM+3rGjmqdio1/yln4eS33j5AOzzdkaewCZh++hc?=
 =?us-ascii?Q?dZ2WEz3v9eKxQ9oFKRpTau6OQFurdywi2uY85IBPMFKTJs7PNtv+f+ci/GOD?=
 =?us-ascii?Q?c0isE6ZByywWD6b6xstblBFi9UGbtcv2XQT0dM+n13Cm9/6AiU6qR2++bUQ1?=
 =?us-ascii?Q?6qWeE816skgGJIOECA8pC1jd2OsiZzr3KaAoMLo6Nv/ggbxKBX2oH/QwiqH1?=
 =?us-ascii?Q?M+i6mJyURuuj6c1f2vGYNkVD9zGvpxQdfugp1VP96z5+PzPIJP9AuvADLZgo?=
 =?us-ascii?Q?nxe+urxQHCtyKgQQKX+K1uedx4Xzu5WmGpDLVIxGSlc9EY4/rlRVfbSeilwR?=
 =?us-ascii?Q?btHkjZBACQT4mLsjVUics+dmn4E+uOOj85D4KMrDpxVfwPKfJ07QUz8UYOFa?=
 =?us-ascii?Q?qpiU9sKgB9WETGX6kNZmYOt1yzWXXLRfbq1MW/DDs9X9k3hM+pd8OgGtTM+m?=
 =?us-ascii?Q?ChpeBSLyQqT7owO8rxHuBZjFcLZiutEI6VSaLuoyqAAtYeBhG+4DZPaSlLO0?=
 =?us-ascii?Q?/Up905/+POvqEUWtMVimA1MU6MP9dx9LbaETxxJdCqCxQwY9nnZm/3O43Gzv?=
 =?us-ascii?Q?r7FjQRiAG4/OtkHPO1014gEGsTictuHTd+qK7BsNmp7+t2UfBKhiWzZSBI0M?=
 =?us-ascii?Q?E5oHgU3rdsglwjpMUXcTYJHISWp4bjWqi9+bniDSySVOE1+lQjODVe01En+G?=
 =?us-ascii?Q?4CrkHpggC5J5KCDAxlxFuOFi0Fs+y4DQ1bWPkMS3w/xTQNQANiTHm8PrLuN7?=
 =?us-ascii?Q?jN5v5sfSXvsbC+PB18GyscH3/TXI43QWyU8fs6uiX2+Il9cHoSWBOFKkwsFU?=
 =?us-ascii?Q?gJ9Tz8QEKPTtPXE60ykbm/cpR9JOkpaczaGN9zcB1Mje3AgaFFGJC+8tbT+B?=
 =?us-ascii?Q?sSNnfC5GeOV7ZTLTSEneesz8XNGGlZGHPFaSuszvZtKXV27z2DGb/OXc0ycT?=
 =?us-ascii?Q?EyQZICJgdZFejOCLYiG4/jz3+Cl/5EE0TQWo+XYC42ZD0mFJVWrF4h7mI9HR?=
 =?us-ascii?Q?gMNpScuN9/fzMKTzrSPJ8R7fvjmglQdlV5aiaW48nGnqNMoEgwwS8h1HV6tN?=
 =?us-ascii?Q?RNE1ZEFwzGWSi5eHnnihEViwdfh3gBaTrMramqCThcPnm+7ZcY+kEn2/+/hJ?=
 =?us-ascii?Q?jmWeC3qqzNaSpTHO1zwZxA5O9srNoNO6Z6/n998+iQ+EW6+bnqWZX0Qen8R9?=
 =?us-ascii?Q?0wuKXeIuqP/SmWxKcavX2E4GXAR62MBY8uYrpEfO0GO77wqVziP4EzEOCG1P?=
 =?us-ascii?Q?umsFDSg8LS76XeQwJOcLhOeIb8jT2lZqQC7JwRgJtw7QXxwoR8YYCF0XIkzA?=
 =?us-ascii?Q?niJ6iVFQWhl0p/LSwgGwVwyRnyfehtOQovAdmpvonVScT3+VahuvYQyypDi8?=
 =?us-ascii?Q?h3lb8ApDeK2U0h1cUss5m1q4rIx89/nDqdsLvVXLjxwlbEHv2hWfoFQg9Z8O?=
 =?us-ascii?Q?TNbr8dAWwRI3E6N+Fq/NI/Tr1ZdulGu5bihCW9rT4NyCkOO1QSAYM7bLukUy?=
 =?us-ascii?Q?4tVhbgiVt75rTAwl40eE2dY6QSmGMm9rA4PZwPupN/7/4j7DWum4oZtFUE81?=
 =?us-ascii?Q?klH0DPleZh5V7q+hawDxMatWg++LfcEQHIPurvydyPoQ6Xv6XH0/+eeAhql1?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cde31e4a-9fad-420d-601c-08dc59ad700e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 22:27:42.5231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BRQMmy4udwn8aGKp0HjL/kPw362tmYzbA6cINZU0c23pwMtyrkRo5YWzOSQelBbTfCKVRrUDDoArmUxUYupQUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6374
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

On Tue, Apr 09, 2024 at 04:17:37PM -0400, Oak Zeng wrote:
> Public this function as it will be used by later patches. Also
> rename it to xe_vm_lookup_vma
> 

Like the previous patch, pretty sure this can be dropped too. Again will
fully explain later.

Matt

> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 10 ++++++++--
>  drivers/gpu/drm/xe/xe_vm.h           |  1 +
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 707a3466f36b..668984f0769e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -80,7 +80,13 @@ static bool vma_matches(struct xe_vma *vma, u64 page_addr)
>  	return true;
>  }
>  
> -static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
> +/**
> + * xe_vm_lookup_vma() - look up a vma from address
> + *
> + * @vm: the xe_vm that the vma resides in
> + * @page_address: address to look up
> + */
> +struct xe_vma *xe_vm_lookup_vma(struct xe_vm *vm, u64 page_addr)
>  {
>  	struct xe_vma *vma = NULL;
>  
> @@ -166,7 +172,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  		ret = -ENOENT;
>  		goto unlock_vm;
>  	}
> -	vma = lookup_vma(vm, pf->page_addr);
> +	vma = xe_vm_lookup_vma(vm, pf->page_addr);
>  	if (!vma) {
>  		ret = -EINVAL;
>  		goto unlock_vm;
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 4860747592ad..d55330988e32 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -306,3 +306,4 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
>  void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
>  void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
>  void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> +struct xe_vma *xe_vm_lookup_vma(struct xe_vm *vm, u64 page_addr);
> -- 
> 2.26.3
> 
