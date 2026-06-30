Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4C0C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 15:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678F310EA76;
	Tue, 30 Jun 2026 15:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qkaoz3o8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C1910E9B4
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 15:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782832598; x=1814368598;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=y5lPN2s/Orxl7IKku0newIrcBHauxaQtmUE/bAx1c8o=;
 b=Qkaoz3o8rQKcR4DA4NNzmoMW8k1GlO9Jv+h9rbLIXioeLowAF47HudT2
 X7Hn1aZzd1CQre0y9j2e5CexQnQ8kAvy3jfMODGAU5YNEp3PQfGeqf4d6
 Zh5PFvB6KkBFUV+G6mKM6IXA03pvFedStHY0sDlgDmh/S1Yjq+BZhgSQt
 HY9z6p7rFZZI/IgSRTb3Ra4PHBXZzte2J2waKRybZOMoeEGM3tIgVFj4L
 jfeV3qmmeuOEw11IePxuR+5PSFRbWBm1XtDc36XUStkvZaNyfm99UNiVC
 2gU+kQqvDcp86aEx7oJi1HXqRJtKmIs/ZBZrNWtWibsPkcrrIMkbQ+RMb A==;
X-CSE-ConnectionGUID: bElrcSwCRjyFL40YuP2BBw==
X-CSE-MsgGUID: tn7WX5q9Rfi0UZhRBJFhDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83685357"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="83685357"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 08:16:38 -0700
X-CSE-ConnectionGUID: f9CQXVhPRg241joIiYFodw==
X-CSE-MsgGUID: oJYJERN2RuqrkvQT54VC5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="276577723"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 08:16:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 08:16:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 30 Jun 2026 08:16:37 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.8) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 08:16:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0PMOELBJKRkQ6TFGdebOIrwgBmhVO0iiFEOHwyK/rclEDsnPAkKHFQn96SVrRkf4wZymE3KYVtYbhVYAQazV3lw7DM1TvlUqTEX7GSsnP0Vs0V5NA9c1hVtbToxw4BluQTbArU+KMzl7eqff1HrbUw/Je7xccvdl9lhM8DEUYSVvKomWmtIOmvQVbMwzD097h91ZU1hSR2CnB6fKeEDZAQIBsRu7v/BjMnd9SClLsjTaJCFYX3S6I8MnoKF9EKhGlJpvMRUYHQ4QL+hlqfMcDf3IvdmpPgUPoxm56TvHM1GVpFVLESh/la8qfk4UbY7h6bMoIElBju2PWhksGxsUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=im57PnvWqreDcr5ivGvzXBmt53RzytKCBDPZmzsUl2A=;
 b=FgguB/KtLCnx6MPm5nJxwp53wPwh/5kTixY/WSq0X5VfDRfP20Whg1J9QadmpjvTNWhuT++77t8yyzVGAXX71eSiuLUBWdMMDZgjF+m/CDDaqjmPfutPYww1DPsq6fSYaiPzdn5xjqN5EA2FyN9PynByMcKCd6kgYBf1zknx9E4GHLaqt6VaFKn6h5yEiw+nuF81YD9qsiv8/0wfl7YMd5stV7AhuWCsoI4JweXBrrWHMXqkC40RHO2F0tyLjWKF33pu6SYvQzIvjXjuqU/0H18XELbzwlm9lNQZRXXgYSYs4vhKfJdnMEUvP0n0ArqRL8Rh5nNyNl1OZn5ZE01d2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Tue, 30 Jun
 2026 15:16:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 15:16:27 +0000
Date: Tue, 30 Jun 2026 08:16:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe: Drop 'force_execlist' module parameter
Message-ID: <20260630151625.GT6214@mdroper-desk1.amr.corp.intel.com>
References: <20260626-remove_execlists-v1-1-2584d8c4a6f2@intel.com>
 <178277307180.130398.16566581013031957192@6beec6c84f66>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178277307180.130398.16566581013031957192@6beec6c84f66>
X-ClientProxiedBy: BY3PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:a03:255::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB5095:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f371b4-54c4-453e-4aad-08ded6ba8e78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|56012099006|3023799007|4143699003|11063799006|6133799003|5023799004;
X-Microsoft-Antispam-Message-Info: Yaj2Mi2+UWpefNCOdrElJWmhu0nDZjJ+8MbwuR2O0Zy1DjwpKMCZ7FkzcPv7xsAeHY+F4mKelU3HBf37rt5a4nrNcB3ve1PivwCNecrnpEuLfM4lO1WGsaFyKSST6IsEh8wXNDTQRHMgopvTZD0zPbDgVfk590l3Z6GRdy5BQYN3a34CNA7scGn+cVkCTDFx4VlkM5at+GSFrnYMPCQuFMmHii48yQg8Ldtt2+8anwFY8fIZqKyW1nr9BWF4tjsdnFVpdPHlT3V6W9q+s/5Tv4LC3abIFFxgkWk5CXHEDdR8G/gRMSm8syyqS/7dfixQ3/V1dX4G9bFSyz1dWR1WMjNliPem0dPr6Vodc1F05Boflx523hy4Vafjl5llBTK0fqHLDQ0BvP1tMykxKqebNP53OiPUT0qeKqdCad0vBe6rqXpJXc1OjBWxymw2iznGjZOThopKZFWikR4vjQdFJEpj0+E/HZGiOjY8hN2aL9upv+2YbR7aKgVYefWxaenYtozpFWnG2/wsMk56cDnVhRiQnZhXyU4OAFBLqzFzMrFWcTKC2AYmwr1FkEpF63uc6pM8EVGpZromL/ODdLpGBsoCvAhVKPUYgSjYbQ5IKHU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(56012099006)(3023799007)(4143699003)(11063799006)(6133799003)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A4G311YvUUB04vW7PCC6vO5f7k5Ntpy1GUV9DZfrHw5iE1DjHgmoSyEkyuRl?=
 =?us-ascii?Q?l8ERhBHERg/YpUejAZUJgn0diFH7toxJfDbfIcIOv+Fu6RhbMXTiku935rby?=
 =?us-ascii?Q?FaG5bsQC9HZeHLqK/lAtvgodvLdyiiOK2dNhfFbnPvHWM2/eW8j9k404jfYX?=
 =?us-ascii?Q?znnVdjh4fW5pm+5XZkueFiiEPPnIa0cmUuo/pwLRSYd9vlIJPQXzxxCvQHm5?=
 =?us-ascii?Q?xqO2dZyGkwWaunAnsu6vuoqNxdnZTDfzNqRWZute+8RgFjuU9sh/yDsUnnmF?=
 =?us-ascii?Q?CZlbMOrfzpvLOkl11Onm2VATn/8Y7vW+PeEkNJPjRXlwffpQ9H1UIQpOIZgF?=
 =?us-ascii?Q?iUhCS+UNlNyLfPylYvYqlNjekJ7PlzbqnkJOOGIykuD3EsIal/VOcqNNamQu?=
 =?us-ascii?Q?QXIr7T/Z4QxmeRAgRZlQUwH2WEPDxqrLuN9JjGsJGmlfGUfPemtbUH9e8XJi?=
 =?us-ascii?Q?YH+b7Wh22N4YMyopTHqRyAEK3H4qmlo41aNDDqx0r+gFlERWkx3OmfVDnem7?=
 =?us-ascii?Q?QQnF3aoKoufqbB0rRNBomMfma8xUnFH/7dUQYoJ1hj7ahymDYtkED4eneCiR?=
 =?us-ascii?Q?tsNKHTNH8IvccAXfKuE0P3akzHGio2tbJanJJw9rxgRtiD2EPZIcgdEDA/8v?=
 =?us-ascii?Q?dp3RAB8FBBng1drbbMW7bSKJNk0dOfLS4D9p/HLgcTQxfAUjlPRe4mdtU+bO?=
 =?us-ascii?Q?uXuL3fex+7AfrYQ3DLGVOLBueZds4ZyL+6kTsxHDAPw775OT13/QN6vKjfMc?=
 =?us-ascii?Q?ttiRA8BTJJPVgVQF0YXTT65bC4zs+Alv3IcAzVt+hcEmPKwHdjTm9W+6gRZs?=
 =?us-ascii?Q?1JfNRMsTp6l+VzML3llKGh+XmmQ0SNLOmh2zzgi8VGCBSLwHhd7IVDdxzzG3?=
 =?us-ascii?Q?1e0AirDJpoeOhLTgdrypyMhTraexx6F1yzpFTwD2ctwkqtjdqprNctn1qF5H?=
 =?us-ascii?Q?uBmbWdXOUYpb/z60Tkj9DDUMGQRLPVKqKddKkL5w/0xrzKxTDbMqgHO8hOwK?=
 =?us-ascii?Q?wOVAl0XHn0yUNFl1eysVVPFMTnzL0pWXqWGjb+NUQ3IBUfwFeXAWbVHTezKv?=
 =?us-ascii?Q?FGpjqbKxmQI7g7FVy3qC3c2X/RZnPRTKQwXlKS/u+zUXjutCfqkb2chncYMW?=
 =?us-ascii?Q?56AxTQOpNVMi427sC4wzHR2IQkfZ7hQ9b36m51iH7T3K2DAkzFqUl2hhKbea?=
 =?us-ascii?Q?idvhVLvkbBsL1l00fC80adVBTp5K+MaWlTMs+OnfZWK8vPjNb9yW+WsLBBlG?=
 =?us-ascii?Q?JalNc0TVRJ3FfmruSk71N/6RexJVBk1Iq7hjMG3fLQagEdgZG7mkf1yiO3Yq?=
 =?us-ascii?Q?SgE3UZCnWERrSSYXvBKaOM29krBJW8TONoQlMRz9IlUr+hhzZIhNyLb57Oc0?=
 =?us-ascii?Q?hFo19pGr1735pWyB/C8rrKsMwnLYjramNcMyKLVyRGqDIS4nXukP/dcwulR/?=
 =?us-ascii?Q?u1gseIxVUtEQICwTyMakoXZDVNkPtS3B5pIi4bVeSvobxo15dJTho8ZurK25?=
 =?us-ascii?Q?jFlJWBEt0xn9LFLYri1m2VQXTHcrpAp2SaE1fgxkHL16AZm8zjRliXxAMPz6?=
 =?us-ascii?Q?qpSAKdKbgFMb34IF8/AZl30YJ9M6pxqpT2oWDq1ebwTUwf613gFjFk2bOJGX?=
 =?us-ascii?Q?6Bvf5bi6HHInVpw7TaCwTitlIPihIcxfv41iOxVf/f+mv1W8mXXuhx3vdugw?=
 =?us-ascii?Q?LgA3xnQCfJnpuaRB0wGKwcyw5WscvINE0orXWR7V9lCfEO4EoZw1mtC+J2Vc?=
 =?us-ascii?Q?MvCA9nv1CHM1zwTVuXDIcdWwp7+Ofs4=3D?=
X-Exchange-RoutingPolicyChecked: OlUU8ceN8ixY4MdL7lkRRIEj/phMGdXdQYJZm04yqbKAFgJ7dhaUxtgIVeDWIbB2mbhTTkbXX6czVlYcbnU/uCSTtIKcMSjVpvna1nxoV8kbsu90W2fGPOvJHJQJvj0RqUoAUdbkN+eFLDROKqSUNMO5ofw/Yqeosb8SuX6sTmtRX/rFcv5gOL8BTSGqPJCpPF14Gyl2LeQIuPs6QYUvoGmgWTO7lTr1ntwEB3kBk7CXYzHqcGzJakNmbC1APfky4gcvFBGLSl9V8BqmsDouUFHquTY/L0vqhBBi6rFGrK1XCt8RH9T2MbenrnX5wMWqcBz+23URqbE2GCod43ZkDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f371b4-54c4-453e-4aad-08ded6ba8e78
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 15:16:27.8556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcBi4VQ87Wuqu9enwbKbG6+LbXtcI4rdBkgcn0oNwtbMdJHwGfeb8CNAkjpC3Eyp+1vDViN5SEsqJGx512z34a0VhxU3yNlEJTXHZVins98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5095
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

On Mon, Jun 29, 2026 at 10:44:31PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Drop 'force_execlist' module parameter
> URL   : https://patchwork.freedesktop.org/series/169326/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34_FULL -> xe-pw-169326v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-169326v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-169326v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-169326v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt1-vcs0:
>     - shard-bmg:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt1-vcs0.html

Pre-existing issue https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8526

Patch applied to drm-xe-next.  Thanks Maarten for the review.


Matt


> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-169326v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2370])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1407]) +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327]) +5 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#7059] / [Intel XE#7085])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +2 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2328] / [Intel XE#7367])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +6 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#7679])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
>     - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#367])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#367]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#8365])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +3 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2669] / [Intel XE#7389]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2652]) +16 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#3432])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#3432]) +2 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +20 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2325] / [Intel XE#7358]) +2 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-5/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#7358])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-3/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7358]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
> 
>   * igt@kms_chamelium_frames@hdmi-frame-dump:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#373]) +2 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-5/igt@kms_chamelium_frames@hdmi-frame-dump.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252]) +8 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7642])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_content_protection@suspend-resume:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#7642])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-5/igt@kms_content_protection@suspend-resume.html
> 
>   * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +6 other tests fail
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x42:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1424]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2321] / [Intel XE#7355])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2320]) +3 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#309] / [Intel XE#7343])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#1340] / [Intel XE#7435])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#4331] / [Intel XE#7227])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_dsc@dsc-basic-bigjoiner:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#8265]) +7 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@kms_dsc@dsc-basic-bigjoiner.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#8265]) +2 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#6126] / [Intel XE#776])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-10/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2375])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2374] / [Intel XE#6127])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-bmg:          NOTRUN -> [FAIL][39] ([Intel XE#5408] / [Intel XE#6266])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate@ac-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [FAIL][40] ([Intel XE#6266])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_flip@2x-plain-flip-fb-recreate@ac-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check@bd-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][41] -> [FAIL][42] ([Intel XE#3098]) +1 other test fail
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check@bd-dp2-hdmi-a3.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7179])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#6312] / [Intel XE#651]) +3 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#4141]) +15 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2311]) +73 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7061]) +4 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#6312]) +4 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7061] / [Intel XE#7356]) +6 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7905]) +14 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#7061]) +2 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#7399])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#7865]) +8 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#656] / [Intel XE#7905]) +13 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2313]) +63 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1503])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-4/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#6911] / [Intel XE#7378])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#7591])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#7283])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#8303]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#8303]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#7283]) +6 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#599])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-2/igt@kms_plane_lowres@tiling-y.html
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2393])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2763] / [Intel XE#6886]) +8 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#7794])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          [PASS][71] -> [FAIL][72] ([Intel XE#8399])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2499])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_pm_rpm@package-g7:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#6814] / [Intel XE#7428])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@kms_pm_rpm@package-g7.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#4608])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#4608] / [Intel XE#7304]) +5 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#1489]) +9 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr2-primary-page-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1406] / [Intel XE#7345])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-page-flip.html
> 
>   * igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1406] / [Intel XE#4609])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html
> 
>   * igt@kms_psr@pr-cursor-plane-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1406])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-7/igt@kms_psr@pr-cursor-plane-onoff.html
> 
>   * igt@kms_psr@psr2-sprite-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2234] / [Intel XE#2850]) +16 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@kms_psr@psr2-sprite-blt.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +1 other test skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-270.html
>     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1127] / [Intel XE#5813])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2330] / [Intel XE#5813]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#6503]) +2 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2509] / [Intel XE#7437])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#1499]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_vrr@lobf-dc3co:
>     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#8397])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@kms_vrr@lobf-dc3co.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#6599])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many-vram@engine-drm_xe_engine_class_compute:
>     - shard-bmg:          NOTRUN -> [ABORT][93] ([Intel XE#7893] / [Intel XE#8300])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_create@create-big-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1062] / [Intel XE#7318] / [Intel XE#7457])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-4/igt@xe_create@create-big-vram.html
> 
>   * igt@xe_eudebug@basic-vm-bind-vm-destroy:
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#7636]) +17 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-vm-destroy.html
> 
>   * igt@xe_eudebug@discovery-empty-clients:
>     - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#7636]) +6 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-7/igt@xe_eudebug@discovery-empty-clients.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [PASS][97] -> [INCOMPLETE][98] ([Intel XE#6321] / [Intel XE#8355])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-small-multi-queue-priority:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#8370]) +1 other test skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@xe_evict@evict-small-multi-queue-priority.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
>     - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#6540] / [Intel XE#688]) +3 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
> 
>   * igt@xe_exec_balancer@many-execqueues-virtual-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#7482]) +8 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-4/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
>     - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2322] / [Intel XE#7372]) +10 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>     - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1392]) +2 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#8374]) +13 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#8374]) +2 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-5/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate.html
> 
>   * igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem:
>     - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#8364]) +12 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-6/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem.html
> 
>   * igt@xe_exec_multi_queue@two-queues-priority:
>     - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#8364]) +29 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html
> 
>   * igt@xe_exec_reset@cm-multi-queue-gt-reset:
>     - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#8369]) +3 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@xe_exec_reset@cm-multi-queue-gt-reset.html
> 
>   * igt@xe_exec_reset@multi-queue-cancel:
>     - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#8369])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-4/igt@xe_exec_reset@multi-queue-cancel.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#8378]) +2 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#8378]) +11 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html
> 
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#584] / [Intel XE#7369]) +1 other test skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-3/igt@xe_gt_freq@freq_suspend.html
> 
>   * igt@xe_intel_bb@blit-reloc:
>     - shard-bmg:          [PASS][113] -> [ABORT][114] ([Intel XE#8007]) +1 other test abort
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_intel_bb@blit-reloc.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@xe_intel_bb@blit-reloc.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2229])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#2833])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-2/igt@xe_live_ktest@xe_eudebug.html
>     - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2833])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html
> 
>   * igt@xe_multigpu_svm@mgpu-concurrent-access-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#6964]) +2 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html
> 
>   * igt@xe_page_reclaim@binds-full-pd:
>     - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#7793])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@xe_page_reclaim@binds-full-pd.html
> 
>   * igt@xe_page_reclaim@prl-max-entries:
>     - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#7793])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-7/igt@xe_page_reclaim@prl-max-entries.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#4733] / [Intel XE#7417]) +4 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#944]) +1 other test skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-10/igt@xe_query@multigpu-query-invalid-extension.html
>     - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#944])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-4/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   * igt@xe_sriov_scheduling@equal-throughput-normal-priority:
>     - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#8339])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-6/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html
>     - shard-bmg:          NOTRUN -> [FAIL][125] ([Intel XE#7992]) +1 other test fail
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-bmg:          [SKIP][126] ([Intel XE#8517]) -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@core_hotunplug@hotreplug-lateclose.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@core_hotunplug@hotreplug-lateclose.html
> 
>   * igt@fbdev@write:
>     - shard-bmg:          [SKIP][128] ([Intel XE#2134]) -> [PASS][129]
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@fbdev@write.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-10/igt@fbdev@write.html
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-bmg:          [SKIP][130] ([Intel XE#5177] / [Intel XE#8441] / [Intel XE#8480]) -> [PASS][131]
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@intel_hwmon@hwmon-read.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic:
>     - shard-bmg:          [TIMEOUT][132] ([Intel XE#8479] / [Intel XE#8500]) -> [PASS][133] +1 other test pass
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-bmg:          [INCOMPLETE][134] ([Intel XE#6819] / [Intel XE#7912] / [Intel XE#8174]) -> [PASS][135]
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2:
>     - shard-bmg:          [INCOMPLETE][136] ([Intel XE#6819] / [Intel XE#8174]) -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          [TIMEOUT][138] ([Intel XE#8479]) -> [PASS][139] +5 other tests pass
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-bmg:          [TIMEOUT][140] ([Intel XE#8446] / [Intel XE#8479]) -> [PASS][141] +5 other tests pass
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-lnl:          [INCOMPLETE][142] ([Intel XE#5643]) -> [PASS][143]
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>     - shard-bmg:          [INCOMPLETE][144] ([Intel XE#5643] / [Intel XE#8479]) -> [PASS][145]
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-lnl:          [INCOMPLETE][146] ([Intel XE#5643] / [Intel XE#8479]) -> [PASS][147] +6 other tests pass
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-lnl:          [TIMEOUT][148] ([Intel XE#8446] / [Intel XE#8479]) -> [PASS][149] +6 other tests pass
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p:
>     - shard-bmg:          [INCOMPLETE][150] ([Intel XE#8479] / [Intel XE#8506]) -> [PASS][151] +2 other tests pass
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-target-2160x1440p:
>     - shard-lnl:          [INCOMPLETE][152] ([Intel XE#8445] / [Intel XE#8479]) -> [PASS][153] +2 other tests pass
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-1/igt@kms_bw@connected-linear-tiling-1-displays-target-2160x1440p.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-1-displays-target-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:
>     - shard-lnl:          [INCOMPLETE][154] ([Intel XE#8445]) -> [PASS][155] +3 other tests pass
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-3/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html
> 
>   * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>     - shard-bmg:          [TIMEOUT][156] ([Intel XE#8451] / [Intel XE#8479]) -> [PASS][157]
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          [FAIL][158] ([Intel XE#7571]) -> [PASS][159]
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
>     - shard-bmg:          [INCOMPLETE][160] ([Intel XE#8151] / [Intel XE#8479]) -> [PASS][161] +1 other test pass
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-bmg:          [INCOMPLETE][162] ([Intel XE#8155] / [Intel XE#8479]) -> [PASS][163] +1 other test pass
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [FAIL][164] ([Intel XE#301]) -> [PASS][165] +3 other tests pass
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-lnl:          [INCOMPLETE][166] ([Intel XE#8479] / [Intel XE#8488]) -> [PASS][167] +4 other tests pass
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-4/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
>     - shard-bmg:          [CRASH][168] ([Intel XE#8461]) -> [PASS][169]
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
>     - shard-bmg:          [INCOMPLETE][170] ([Intel XE#8479] / [Intel XE#8504]) -> [PASS][171]
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>     - shard-bmg:          [CRASH][172] -> [PASS][173]
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          [INCOMPLETE][174] ([Intel XE#8504]) -> [PASS][175]
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
>     - shard-bmg:          [TIMEOUT][176] ([Intel XE#8467] / [Intel XE#8479]) -> [PASS][177] +1 other test pass
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][178] ([Intel XE#8441] / [Intel XE#8480]) -> [PASS][179] +7 other tests pass
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [TIMEOUT][180] ([Intel XE#8466] / [Intel XE#8479]) -> [PASS][181] +8 other tests pass
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [SKIP][182] ([Intel XE#1503]) -> [PASS][183]
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
>     - shard-lnl:          [INCOMPLETE][184] ([Intel XE#1035] / [Intel XE#8479]) -> [PASS][185] +3 other tests pass
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-7/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-1/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
>     - shard-bmg:          [INCOMPLETE][186] ([Intel XE#8459] / [Intel XE#8479]) -> [PASS][187] +6 other tests pass
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:
>     - shard-bmg:          [TIMEOUT][188] ([Intel XE#8510]) -> [PASS][189] +1 other test pass
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
>     - shard-bmg:          [CRASH][190] ([Intel XE#8458]) -> [PASS][191]
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:
>     - shard-bmg:          [INCOMPLETE][192] ([Intel XE#8459]) -> [PASS][193]
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html
> 
>   * igt@kms_pm_rpm@modeset-stress-extra-wait:
>     - shard-bmg:          [SKIP][194] ([Intel XE#8440]) -> [PASS][195]
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-bmg:          [SKIP][196] -> [PASS][197]
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_pm_rpm@system-suspend-modeset.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@kms_properties@connector-properties-legacy:
>     - shard-bmg:          [SKIP][198] ([Intel XE#8440] / [Intel XE#8480]) -> [PASS][199] +117 other tests pass
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_properties@connector-properties-legacy.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@kms_properties@connector-properties-legacy.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
>     - shard-lnl:          [CRASH][200] ([Intel XE#8455]) -> [PASS][201] +1 other test pass
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-lnl:          [SKIP][202] ([Intel XE#8361]) -> [PASS][203] +1 other test pass
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:
>     - shard-lnl:          [TIMEOUT][204] ([Intel XE#8468]) -> [PASS][205] +1 other test pass
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-7/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-a-edp-1-invalid-filter-with-scaling-mode-fulls:
>     - shard-lnl:          [TIMEOUT][206] ([Intel XE#8468] / [Intel XE#8479]) -> [PASS][207] +1 other test pass
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-a-edp-1-invalid-filter-with-scaling-mode-fulls.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-4/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-a-edp-1-invalid-filter-with-scaling-mode-fulls.html
> 
>   * igt@xe_ccs@block-copy-uncompressed-inc-dimension:
>     - shard-bmg:          [INCOMPLETE][208] ([Intel XE#8437] / [Intel XE#8479]) -> [PASS][209] +6 other tests pass
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_ccs@block-copy-uncompressed-inc-dimension.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@xe_ccs@block-copy-uncompressed-inc-dimension.html
> 
>   * igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:
>     - shard-lnl:          [ABORT][210] ([Intel XE#8007]) -> [PASS][211]
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-5/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch:
>     - shard-bmg:          [INCOMPLETE][212] ([Intel XE#8479]) -> [PASS][213] +4 other tests pass
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:
>     - shard-bmg:          [CRASH][214] ([Intel XE#8450]) -> [PASS][215]
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise:
>     - shard-bmg:          [SKIP][216] ([Intel XE#8480]) -> [PASS][217] +96 other tests pass
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-free-race-nomemset:
>     - shard-bmg:          [FAIL][218] ([Intel XE#8479]) -> [PASS][219] +13 other tests pass
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-free-race-nomemset.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-free-race-nomemset.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-fork-read-after:
>     - shard-lnl:          [INCOMPLETE][220] ([Intel XE#8437] / [Intel XE#8479]) -> [PASS][221] +66 other tests pass
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-fork-read-after.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-7/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-fork-read-after.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-multi-fault:
>     - shard-bmg:          [INCOMPLETE][222] ([Intel XE#8159] / [Intel XE#8479]) -> [PASS][223] +22 other tests pass
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-multi-fault.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-multi-fault.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-madvise:
>     - shard-bmg:          [FAIL][224] -> [PASS][225]
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-madvise.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-madvise.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap:
>     - shard-bmg:          [INCOMPLETE][226] ([Intel XE#7928] / [Intel XE#8159] / [Intel XE#8479]) -> [PASS][227]
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap.html
> 
>   * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise:
>     - shard-lnl:          [TIMEOUT][228] ([Intel XE#8479]) -> [PASS][229] +1 other test pass
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-4/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-6/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvise:
>     - shard-lnl:          [TIMEOUT][230] ([Intel XE#8447] / [Intel XE#8479]) -> [PASS][231] +3 other tests pass
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvise.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvise.html
> 
>   * igt@xe_exec_system_allocator@threads-many-malloc-mlock-nomemset:
>     - shard-bmg:          [DMESG-FAIL][232] -> [PASS][233]
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-malloc-mlock-nomemset.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-malloc-mlock-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset:
>     - shard-lnl:          [INCOMPLETE][234] ([Intel XE#7928] / [Intel XE#8479]) -> [PASS][235] +3 other tests pass
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-nomemset:
>     - shard-bmg:          [INCOMPLETE][236] ([Intel XE#8159] / [Intel XE#8437] / [Intel XE#8479]) -> [PASS][237]
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-nomemset.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:
>     - shard-bmg:          [TIMEOUT][238] ([Intel XE#8356] / [Intel XE#8447]) -> [PASS][239]
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap-eocheck:
>     - shard-lnl:          [INCOMPLETE][240] ([Intel XE#8479]) -> [PASS][241] +259 other tests pass
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap-eocheck.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap-eocheck.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
>     - shard-bmg:          [CRASH][242] ([Intel XE#8448]) -> [PASS][243] +3 other tests pass
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
>     - shard-bmg:          [INCOMPLETE][244] ([Intel XE#8479] / [Intel XE#8486]) -> [PASS][245] +2 other tests pass
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
>     - shard-bmg:          [ABORT][246] ([Intel XE#8007]) -> [PASS][247] +2 other tests pass
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
> 
>   * igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled:
>     - shard-bmg:          [INCOMPLETE][248] ([Intel XE#8477] / [Intel XE#8479]) -> [PASS][249]
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html
> 
>   * igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled:
>     - shard-bmg:          [INCOMPLETE][250] ([Intel XE#8477]) -> [PASS][251] +1 other test pass
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled.html
> 
>   * igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0:
>     - shard-bmg:          [ABORT][252] -> [PASS][253] +1 other test pass
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html
> 
>   * igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:
>     - shard-lnl:          [TIMEOUT][254] ([Intel XE#8462] / [Intel XE#8479]) -> [PASS][255] +2 other tests pass
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-6/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-2/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-lnl:          [TIMEOUT][256] ([Intel XE#8446] / [Intel XE#8479]) -> [SKIP][257] ([Intel XE#1407]) +2 other tests skip
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          [INCOMPLETE][258] ([Intel XE#5643] / [Intel XE#8479]) -> [SKIP][259] ([Intel XE#1407])
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-lnl:          [INCOMPLETE][260] ([Intel XE#5643] / [Intel XE#8479]) -> [SKIP][261] ([Intel XE#3658] / [Intel XE#7360]) +2 other tests skip
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>     - shard-bmg:          [SKIP][262] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][263] ([Intel XE#1124]) +1 other test skip
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-lnl:          [TIMEOUT][264] ([Intel XE#8446]) -> [SKIP][265] ([Intel XE#1124]) +1 other test skip
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-lnl:          [INCOMPLETE][266] ([Intel XE#5643] / [Intel XE#8479]) -> [SKIP][267] ([Intel XE#1124]) +8 other tests skip
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-bmg:          [SKIP][268] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][269] ([Intel XE#1124])
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
>     - shard-lnl:          [INCOMPLETE][270] ([Intel XE#8445] / [Intel XE#8479]) -> [SKIP][271] ([Intel XE#7679]) +6 other tests skip
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
>     - shard-bmg:          [INCOMPLETE][272] ([Intel XE#8479] / [Intel XE#8506]) -> [SKIP][273] ([Intel XE#7679]) +1 other test skip
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
>     - shard-lnl:          [INCOMPLETE][274] ([Intel XE#8445] / [Intel XE#8479]) -> [SKIP][275] ([Intel XE#8365]) +3 other tests skip
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
>     - shard-bmg:          [CRASH][276] ([Intel XE#8449]) -> [SKIP][277] ([Intel XE#7679])
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
>     - shard-bmg:          [SKIP][278] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][279] ([Intel XE#367])
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
>     - shard-lnl:          [INCOMPLETE][280] ([Intel XE#8445]) -> [SKIP][281] ([Intel XE#367]) +6 other tests skip
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
>     - shard-bmg:          [INCOMPLETE][282] ([Intel XE#8479] / [Intel XE#8506]) -> [SKIP][283] ([Intel XE#367]) +3 other tests skip
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:
>     - shard-bmg:          [TIMEOUT][284] ([Intel XE#8469] / [Intel XE#8479]) -> [SKIP][285] ([Intel XE#367])
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
>     - shard-lnl:          [INCOMPLETE][286] ([Intel XE#8445]) -> [SKIP][287] ([Intel XE#8365]) +2 other tests skip
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          [SKIP][288] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][289] ([Intel XE#2887]) +1 other test skip
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          [SKIP][290] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][291] ([Intel XE#2887])
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-lnl:          [INCOMPLETE][292] ([Intel XE#8479]) -> [SKIP][293] ([Intel XE#2669] / [Intel XE#7389])
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>     - shard-bmg:          [SKIP][294] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][295] ([Intel XE#2652])
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
>     - shard-lnl:          [INCOMPLETE][296] ([Intel XE#8437] / [Intel XE#8479]) -> [SKIP][297] ([Intel XE#2887]) +13 other tests skip
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>     - shard-lnl:          [INCOMPLETE][298] ([Intel XE#8479]) -> [SKIP][299] ([Intel XE#3432])
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
>     - shard-bmg:          [SKIP][300] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][301] ([Intel XE#3432])
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
>     - shard-lnl:          [INCOMPLETE][302] ([Intel XE#8437] / [Intel XE#8479]) -> [SKIP][303] ([Intel XE#3432]) +2 other tests skip
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>     - shard-lnl:          [TIMEOUT][304] ([Intel XE#8463]) -> [SKIP][305] ([Intel XE#2887]) +4 other tests skip
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
>     - shard-bmg:          [INCOMPLETE][306] ([Intel XE#8150] / [Intel XE#8479]) -> [SKIP][307] ([Intel XE#2887])
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
>     - shard-lnl:          [INCOMPLETE][308] ([Intel XE#8479]) -> [SKIP][309] ([Intel XE#2887]) +2 other tests skip
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d:
>     - shard-bmg:          [SKIP][310] ([Intel XE#8480]) -> [SKIP][311] ([Intel XE#7358])
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-lut1d.html
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>     - shard-bmg:          [SKIP][312] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][313] ([Intel XE#2252]) +1 other test skip
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-fast:
>     - shard-bmg:          [SKIP][314] ([Intel XE#8480]) -> [SKIP][315] ([Intel XE#2252])
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_chamelium_frames@hdmi-crc-fast.html
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc-fast.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          [SKIP][316] ([Intel XE#8440] / [Intel XE#8480]) -> [FAIL][317] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_content_protection@legacy.html
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-10/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-bmg:          [SKIP][318] ([Intel XE#8480]) -> [SKIP][319] ([Intel XE#2321] / [Intel XE#7355])
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x170.html
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-bmg:          [SKIP][320] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][321] ([Intel XE#2320])
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-32x10.html
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-lnl:          [SKIP][322] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][323] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-bmg:          [SKIP][324] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][325] ([Intel XE#4354] / [Intel XE#7386])
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_dp_link_training@uhbr-mst.html
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
>     - shard-lnl:          [INCOMPLETE][326] ([Intel XE#8456]) -> [SKIP][327] ([Intel XE#8265])
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
>     - shard-lnl:          [INCOMPLETE][328] ([Intel XE#8456] / [Intel XE#8479]) -> [SKIP][329] ([Intel XE#8265])
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-bmg:          [SKIP][330] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][331] ([Intel XE#4156] / [Intel XE#7425])
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-bmg:          [SKIP][332] ([Intel XE#8480]) -> [SKIP][333] ([Intel XE#2373] / [Intel XE#7448])
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_feature_discovery@display-3x.html
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-lnl:          [INCOMPLETE][334] ([Intel XE#2597] / [Intel XE#8479] / [Intel XE#8488]) -> [SKIP][335] ([Intel XE#1421])
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-lnl:          [INCOMPLETE][336] ([Intel XE#8479] / [Intel XE#8488]) -> [SKIP][337] ([Intel XE#1421]) +3 other tests skip
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          [INCOMPLETE][338] ([Intel XE#8479]) -> [SKIP][339] ([Intel XE#1397] / [Intel XE#7385]) +6 other tests skip
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>     - shard-bmg:          [SKIP][340] ([Intel XE#8480]) -> [SKIP][341] ([Intel XE#7178] / [Intel XE#7351])
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
>     - shard-lnl:          [INCOMPLETE][342] ([Intel XE#8479]) -> [SKIP][343] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385]) +6 other tests skip
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][344] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][345] ([Intel XE#2311]) +5 other tests skip
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
>     - shard-bmg:          [SKIP][346] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][347] ([Intel XE#7061] / [Intel XE#7356])
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][348] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][349] ([Intel XE#4141])
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][350] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][351] ([Intel XE#4141]) +1 other test skip
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          [INCOMPLETE][352] ([Intel XE#8368] / [Intel XE#8479]) -> [SKIP][353] ([Intel XE#2311])
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-bmg:          [SKIP][354] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][355] ([Intel XE#2352] / [Intel XE#7399])
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][356] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][357] ([Intel XE#2311]) +10 other tests skip
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][358] ([Intel XE#8480]) -> [SKIP][359] ([Intel XE#2311]) +2 other tests skip
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-blt.html
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [CRASH][360] ([Intel XE#8505]) -> [SKIP][361] ([Intel XE#2311])
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-blt.html
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:
>     - shard-bmg:          [SKIP][362] ([Intel XE#8480]) -> [SKIP][363] ([Intel XE#7061])
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
>     - shard-bmg:          [SKIP][364] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][365] ([Intel XE#2313]) +5 other tests skip
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>     - shard-bmg:          [SKIP][366] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][367] ([Intel XE#2313]) +10 other tests skip
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render:
>     - shard-bmg:          [CRASH][368] ([Intel XE#8505]) -> [SKIP][369] ([Intel XE#2313])
>    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html
>    [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          [INCOMPLETE][370] ([Intel XE#8368] / [Intel XE#8479]) -> [SKIP][371] ([Intel XE#2313]) +1 other test skip
>    [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-mmap-wc.html
>    [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
>     - shard-bmg:          [SKIP][372] ([Intel XE#8480]) -> [SKIP][373] ([Intel XE#2313])
>    [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
>    [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:
>     - shard-bmg:          [SKIP][374] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][375] ([Intel XE#7061]) +2 other tests skip
>    [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html
>    [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][376] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][377] ([Intel XE#3544])
>    [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
>    [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
>     - shard-lnl:          [INCOMPLETE][378] ([Intel XE#1035] / [Intel XE#8479]) -> [SKIP][379] ([Intel XE#7283]) +19 other tests skip
>    [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
>    [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
>     - shard-bmg:          [SKIP][380] ([Intel XE#8480]) -> [SKIP][381] ([Intel XE#7283]) +1 other test skip
>    [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
>    [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
>     - shard-lnl:          [INCOMPLETE][382] ([Intel XE#1035]) -> [SKIP][383] ([Intel XE#7283]) +1 other test skip
>    [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
>    [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
>     - shard-bmg:          [INCOMPLETE][384] ([Intel XE#1035] / [Intel XE#8479]) -> [SKIP][385] ([Intel XE#7283]) +4 other tests skip
>    [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
>    [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75:
>     - shard-bmg:          [SKIP][386] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][387] ([Intel XE#2763] / [Intel XE#6886])
>    [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
>    [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-bmg:          [SKIP][388] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][389] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
>    [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_pm_backlight@bad-brightness.html
>    [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-lnl:          [CRASH][390] ([Intel XE#8455]) -> [SKIP][391] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +1 other test skip
>    [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
>    [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
>     - shard-lnl:          [INCOMPLETE][392] ([Intel XE#8479]) -> [SKIP][393] ([Intel XE#4608]) +2 other tests skip
>    [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html
>    [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
>     - shard-lnl:          [CRASH][394] ([Intel XE#8455]) -> [SKIP][395] ([Intel XE#4608]) +1 other test skip
>    [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html
>    [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>     - shard-lnl:          [INCOMPLETE][396] ([Intel XE#8479]) -> [SKIP][397] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +2 other tests skip
>    [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
>    [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
>     - shard-bmg:          [SKIP][398] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][399] ([Intel XE#1489])
>    [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
>    [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          [SKIP][400] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][401] ([Intel XE#1489])
>    [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
>    [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@pr-primary-blt:
>     - shard-bmg:          [SKIP][402] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][403] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
>    [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_psr@pr-primary-blt.html
>    [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@kms_psr@pr-primary-blt.html
> 
>   * igt@kms_psr@psr-no-drrs:
>     - shard-bmg:          [SKIP][404] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][405] ([Intel XE#2234] / [Intel XE#2850])
>    [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_psr@psr-no-drrs.html
>    [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@kms_psr@psr-no-drrs.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-bmg:          [SKIP][406] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][407] ([Intel XE#7795])
>    [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-bmg:          [SKIP][408] ([Intel XE#8480]) -> [SKIP][409] ([Intel XE#1499])
>    [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_vrr@flipline.html
>    [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@kms_vrr@flipline.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many-vram:
>     - shard-bmg:          [SKIP][410] ([Intel XE#8440] / [Intel XE#8480]) -> [ABORT][411] ([Intel XE#7893] / [Intel XE#8300])
>    [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_compute_preempt@compute-preempt-many-vram.html
>    [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram.html
> 
>   * igt@xe_eudebug@basic-vm-bind-extended:
>     - shard-bmg:          [SKIP][412] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][413] ([Intel XE#7636]) +2 other tests skip
>    [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-extended.html
>    [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-extended.html
> 
>   * igt@xe_eudebug_online@pagefault-write:
>     - shard-bmg:          [SKIP][414] ([Intel XE#8480]) -> [SKIP][415] ([Intel XE#7636]) +1 other test skip
>    [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@xe_eudebug_online@pagefault-write.html
>    [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@xe_eudebug_online@pagefault-write.html
> 
>   * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race:
>     - shard-lnl:          [INCOMPLETE][416] ([Intel XE#8479]) -> [SKIP][417] ([Intel XE#7482]) +2 other tests skip
>    [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race.html
>    [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-6/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
>     - shard-bmg:          [CRASH][418] ([Intel XE#8438] / [Intel XE#8482]) -> [SKIP][419] ([Intel XE#2322] / [Intel XE#7372])
>    [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
>    [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          [CRASH][420] ([Intel XE#8482]) -> [SKIP][421] ([Intel XE#2322] / [Intel XE#7372])
>    [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
>    [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
>     - shard-bmg:          [SKIP][422] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][423] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
>    [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
>    [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
>     - shard-lnl:          [INCOMPLETE][424] ([Intel XE#8439] / [Intel XE#8479]) -> [SKIP][425] ([Intel XE#1392]) +13 other tests skip
>    [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
>    [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          [INCOMPLETE][426] ([Intel XE#8439] / [Intel XE#8479] / [Intel XE#8499]) -> [SKIP][427] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
>    [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
>    [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          [SKIP][428] ([Intel XE#8480]) -> [SKIP][429] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
>    [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
>    [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch:
>     - shard-lnl:          [INCOMPLETE][430] ([Intel XE#8479]) -> [SKIP][431] ([Intel XE#8374]) +8 other tests skip
>    [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch.html
>    [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
>     - shard-bmg:          [SKIP][432] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][433] ([Intel XE#8374]) +2 other tests skip
>    [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html
>    [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch:
>     - shard-bmg:          [INCOMPLETE][434] ([Intel XE#8479]) -> [SKIP][435] ([Intel XE#8374])
>    [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html
>    [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
>     - shard-bmg:          [SKIP][436] ([Intel XE#8480]) -> [SKIP][437] ([Intel XE#8374]) +3 other tests skip
>    [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html
>    [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
>     - shard-bmg:          [SKIP][438] ([Intel XE#8480]) -> [SKIP][439] ([Intel XE#8364]) +3 other tests skip
>    [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html
>    [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:
>     - shard-bmg:          [SKIP][440] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][441] ([Intel XE#8364]) +4 other tests skip
>    [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html
>    [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html
> 
>   * igt@xe_exec_reset@multi-queue-gt-reset:
>     - shard-bmg:          [SKIP][442] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][443] ([Intel XE#8369])
>    [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_reset@multi-queue-gt-reset.html
>    [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-10/igt@xe_exec_reset@multi-queue-gt-reset.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:
>     - shard-bmg:          [SKIP][444] ([Intel XE#8480]) -> [SKIP][445] ([Intel XE#8378]) +1 other test skip
>    [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html
>    [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:
>     - shard-bmg:          [INCOMPLETE][446] ([Intel XE#8366] / [Intel XE#8479]) -> [SKIP][447] ([Intel XE#8378])
>    [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html
>    [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:
>     - shard-lnl:          [INCOMPLETE][448] ([Intel XE#8479]) -> [SKIP][449] ([Intel XE#8378]) +8 other tests skip
>    [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html
>    [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-rebind:
>     - shard-bmg:          [SKIP][450] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][451] ([Intel XE#8378])
>    [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-rebind.html
>    [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-rebind.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-bmg:          [SKIP][452] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][453] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453])
>    [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_media_fill@media-fill.html
>    [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-7/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
>     - shard-bmg:          [SKIP][454] ([Intel XE#6964] / [Intel XE#8440]) -> [SKIP][455] ([Intel XE#6964])
>    [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html
>    [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-2/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html
> 
>   * igt@xe_page_reclaim@pde-vs-pd:
>     - shard-bmg:          [SKIP][456] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][457] ([Intel XE#7793])
>    [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_page_reclaim@pde-vs-pd.html
>    [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-4/igt@xe_page_reclaim@pde-vs-pd.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-bmg:          [SKIP][458] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353] / [Intel XE#8440]) -> [SKIP][459] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
>    [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_peer2peer@read.html
>    [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-8/igt@xe_peer2peer@read.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-bmg:          [SKIP][460] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][461] ([Intel XE#944])
>    [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_query@multigpu-query-hwconfig.html
>    [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/shard-bmg-9/igt@xe_query@multigpu-query-hwconfig.html
> 
>   
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
>   [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>   [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
>   [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
>   [Intel XE#5643]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
>   [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
>   [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
>   [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
>   [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
>   [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7318
>   [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
>   [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
>   [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
>   [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
>   [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
>   [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
>   [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
>   [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
>   [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
>   [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
>   [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
>   [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
>   [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
>   [Intel XE#7457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
>   [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
>   [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
>   [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#7893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893
>   [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
>   [Intel XE#7912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7912
>   [Intel XE#7928]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7928
>   [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
>   [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
>   [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
>   [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
>   [Intel XE#8151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151
>   [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
>   [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
>   [Intel XE#8174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300
>   [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
>   [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
>   [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
>   [Intel XE#8356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8356
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#8361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
>   [Intel XE#8366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8366
>   [Intel XE#8368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368
>   [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
>   [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
>   [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
>   [Intel XE#8437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437
>   [Intel XE#8438]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8438
>   [Intel XE#8439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439
>   [Intel XE#8440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440
>   [Intel XE#8441]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441
>   [Intel XE#8445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8445
>   [Intel XE#8446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446
>   [Intel XE#8447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447
>   [Intel XE#8448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8448
>   [Intel XE#8449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8449
>   [Intel XE#8450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8450
>   [Intel XE#8451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8451
>   [Intel XE#8455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8455
>   [Intel XE#8456]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8456
>   [Intel XE#8458]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8458
>   [Intel XE#8459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8459
>   [Intel XE#8461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8461
>   [Intel XE#8462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8462
>   [Intel XE#8463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8463
>   [Intel XE#8466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8466
>   [Intel XE#8467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8467
>   [Intel XE#8468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8468
>   [Intel XE#8469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8469
>   [Intel XE#8477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8477
>   [Intel XE#8479]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479
>   [Intel XE#8480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480
>   [Intel XE#8482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482
>   [Intel XE#8486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8486
>   [Intel XE#8488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8488
>   [Intel XE#8499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499
>   [Intel XE#8500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8500
>   [Intel XE#8504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8504
>   [Intel XE#8505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8505
>   [Intel XE#8506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8506
>   [Intel XE#8510]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8510
>   [Intel XE#8517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8517
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8987 -> IGT_8988
>   * Linux: xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34 -> xe-pw-169326v1
> 
>   IGT_8987: 8987
>   IGT_8988: 8988
>   xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34: b9aebfff5a3c5049500a7bd4573815090a425f34
>   xe-pw-169326v1: 169326v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169326v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
