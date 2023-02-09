Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA2CC05027
	for <intel-xe@archiver.kernel.org>; Thu,  9 Feb 2023 04:59:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB10710E906;
	Thu,  9 Feb 2023 04:59:52 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BD710E906
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Feb 2023 04:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675918791; x=1707454791;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Bp5UfSVTtfRu0zkNJUCmOf3FlLY8r1Y/3tVQ+wsNpww=;
 b=M+IAFfPEDKcjRFhEN6qOo6gk+plNt72UmhWVq5zUGD2k4+Foz2CwL4Lz
 IRJd8CSEe1Fr+/XO/XDmk7ERN+XjIf3EU9l/l7zoaGMFfbKLrcGmT91jT
 rhJKvqX31qT+DswpijqEgsVtQxhWXg4ZcnudI0/jR1lOoEQmEuf7CU9xe
 P4GOP/BAo3AXGmSvWgP9QDCVdaqwFAyxumXtVZjuvJNGY3nVAWhFW4C0l
 5WkUdWobrQtOFqIQtX5k26dCDk15bruRSTLp7Vx1hQ84RKWLK/yAPjpbA
 FLjXdGrMh29E4e//tP0fhjosERtvK2bI6jJsyqmf1WM25j+/IkyQAxvQo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="309663093"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="309663093"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 20:59:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="697899965"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="697899965"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 08 Feb 2023 20:59:50 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 8 Feb 2023 20:59:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 8 Feb 2023 20:59:50 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 8 Feb 2023 20:59:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRcvKRiYvy5TSttKyOKWW9NL0rhjYvzL/3B40ny+MxGOULdvN10FYzCbITa7EJmGAL3bHiXrdI+cpkzjS9rOBJh1DXlwzbv1naWtCzyv/EZ7JVgjmdvZNuy8IQPe9DYFmaOpzsNYceX1LXH4Jyv+4wlWGjBs7AFNDyqKT3epIWaFZHCJO/NcOgGXNuIBNO3D7l5aAfRfCkUSXjnohc6QntBVKquCY8WvH1p+mys+ziAZG+SCAUyus/HBb9inwGfICaE0+9KddERdSNicagthmrugxP3NTUjh0ouhyFXQn2SDajLy0L+4Lxlle5C9cCKNHLWbR6p4zDYgqHmYUUg47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEwQx02xiORu+6JITto41pdJR7EhWooR8KcoOwGsPao=;
 b=fDzky5w5uMa/P+vkKoRNZyvM2Vn5gxyRRT2kMXSVTn12+CsOY7hTHtAFMRM96bG1wdqZADOzTmCN/MOl6q5rcpIA9El4uQ9LSj3jCs/TaVcSykKBGL6kL7ouA0mNYVb6EgDKpqoyE25jMcxy70+oWYfY2ngkf2qmvZkSADAztEoI1qhut+kqhdAbdJAKBffs3PSDa4wUVokGInp40bTJDIg8Gk3GAfz/NT5Fb030a/mPs+q66PbMECNqkSW6yW3jbtW1B+oEEgzmP4ho3+1VM6Vrh1jhkG/8jRtyix7iX9U/3etbrwe6Zupe30xT1/6i45GSr54CtAHDZ7Lgyni+Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH0PR11MB5807.namprd11.prod.outlook.com (2603:10b6:510:140::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Thu, 9 Feb
 2023 04:59:47 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e59c:fb1f:1b37:3412]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e59c:fb1f:1b37:3412%3]) with mapi id 15.20.6064.029; Thu, 9 Feb 2023
 04:59:47 +0000
Date: Wed, 8 Feb 2023 20:59:43 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <Y+R9v7Yko32X5vDR@nvishwa1-DESK>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
 <Y+GBpdMmLUNZ52Ss@nvishwa1-DESK> <Y+PbZbxvrCV0I0hv@intel.com>
 <Y+R8bMDsLhmYY0jw@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y+R8bMDsLhmYY0jw@nvishwa1-DESK>
X-ClientProxiedBy: BYAPR01CA0017.prod.exchangelabs.com (2603:10b6:a02:80::30)
 To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH0PR11MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: 715092de-06b4-4827-9cf0-08db0a5a7760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IHuAuloCtYK4Ulh3wXP9jXGLScxsG5HO9xDrb6H1RGIX2x7+DVpwlQymskITEZK47K8NSePASFcMflfgFvivfPGugeb46Dt6xgxKAeP+rrVhYLhyO/IeL0IKHNy9yr+9Zt/wu4mEzG5hiEMVxomPdfNk8RPQ0IlaWXKaZDEAPudjnUdgFOrxpPkh1xaz2IexqNZVpamc6bwZvPITqpsyBGFYvnkeROwi2FTknmDworuGpIxrTztI01XdFsppTEmKDXgjdH0rPXVn978M6Xe3/GHTErFdAbTMp1g2ib3ATCGNLOFGfAu0bkM2I4z/EaUI5HXUrC7W8igdF5mnvfkUPV7kYa7yptgEo28rtana4VjnyEKvUuui90NvK1esyAX7m2broVJQhahwI3MlaXpxJQVAlALDScwW0Ibsu4ZvJCXxdZw6Z1Ho5hcRFRFH9/D9P+b7Z8JWjPudH24cuK2EaZDrP3KlniSLMrMreHap3p2yHzdqDtT8E50oE/oLMXPQTW8X6+srpL3snlc+SsAxVc2sv1sLe2jVqE5n+0PhLvVLzArKfHDEPAE6+N1KvwDz8ehEQ7r0G+ENK+t8HT7gaWVXqBk+QJImBV1FVly6FOkt2SOGBRgLbvepJ+vF5rv6oFyKHcRnsrfmUf/H4O5ySzGT+qcmQVkmP7daZTs0nByZPrzQhpOdiuv4cf2py5Cu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199018)(26005)(5660300002)(86362001)(8936002)(6862004)(186003)(41300700001)(83380400001)(9686003)(4326008)(38100700002)(6512007)(66946007)(8676002)(316002)(6636002)(66476007)(66556008)(33716001)(82960400001)(6666004)(478600001)(6506007)(6486002)(44832011)(2906002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UuNe1LCFhBjXDQzAkveQFE6fGz1OsSrqgZ21Cbsp3bLc8zUjXqpnzhdp8ZkT?=
 =?us-ascii?Q?NqLv71nbFWvQCj62RE/2cgkydRdF7byf8mb68j1lwATJO4798/V9XLOQshZy?=
 =?us-ascii?Q?pks4K3a+V84wn+/6PGFBftoZqqWtmgUurHqQxEJDJMYuV+Ca3qlwUHhy7/JE?=
 =?us-ascii?Q?RaaVMfo5c6RN8msEvYRHpyd/vDFOVUOjYDiz+FdSq+iPbbu8toHNCuP4owNr?=
 =?us-ascii?Q?wBPrPZYNeVisCkuK6w6FEsjS+n59PLXzODuZ4VsIaSz7gU+3icZtqLcA31w9?=
 =?us-ascii?Q?ga/Eub9X0lhFpvHX/BVV86xmg0exFHIY/yQnZP3Cyl5yreXJD2tb/5hyW3ls?=
 =?us-ascii?Q?UdTLHroItrykr3SZZSFeDcLdYV6HtGiqWzrepxqVhHyRxFj3Igl3ci2wUxeb?=
 =?us-ascii?Q?sabYFWNudqwGasRsob8QDAUl/NbNjBNyPsNyh5lFk1E4fzJylZ0TGAT/I6+C?=
 =?us-ascii?Q?qffElnJgf3LPhZaG19SccdB86jsMconMhIWm+QXeqt2Wyun+/A0uJxT8DZYu?=
 =?us-ascii?Q?eURIxjKSpUx6JQi4jiHlIi6M/doQenmmf6D9maAgBesrmgZFL+pgHtm2JDBB?=
 =?us-ascii?Q?0JS+PUuqRah3prs1HCXmvrEX275So8dxSgRU5BDkPaqnteu1AepKCgu5qFbX?=
 =?us-ascii?Q?G0H7A468oENema+fPbiFb0vABmKqzb/d6Q3tULeyJtOUH9ONgl+dJvFIiQpL?=
 =?us-ascii?Q?OnzUcMTWpUJsJKZzh2VLRF+t9JbZ4Gd+mFOL6hKmqvLBtP48z5DGP6JPgnoI?=
 =?us-ascii?Q?ofMeewYBRMwr/YWKnbwMwGX5LiQP3GkBSilKulfl9qvIUPg721n1ssqwrvLW?=
 =?us-ascii?Q?Gy6aXYdYtXWNTlvlJiHo8HZIejJn1z214MhQWrBOTPm13GYc/Sbu5PnkMoC3?=
 =?us-ascii?Q?3BWhdLvTd8ETG4SlBtErU9PGQZobgk+DNLCR8BBwOpniR8t5XrQpgHfy0AR5?=
 =?us-ascii?Q?rdsjN3a/+ZYxdQ+DJnpH3EFKjNz57zz1tDRow3fo4V1+sRKi33rWnyLCF+Fk?=
 =?us-ascii?Q?O5my3+S0aTKbcW4k8QwBBb1q00eykKRkpAB1teMHtSq9ri2TS2n2EEfEjg6F?=
 =?us-ascii?Q?h1LHtnX7JIazz043zbWqdLAxnZCET1W0vThZgy1FjmVCw5214GazQ2mwsfTv?=
 =?us-ascii?Q?LhDwA3j4HPbujd8fVPvgfmMhHcWqR5tILQSK+6n6Yue8Xv18SKm2ixdtoj3t?=
 =?us-ascii?Q?xJs+27DRE5HtxslCarWu8lTE9+H6gTBW0H0J2WxBjhhtRVz5OYf9kqbH7zNy?=
 =?us-ascii?Q?kE0zgQVibWx+gpMAgMV4H2nfgYEQWFikhrphJnqO+J+gpnxjX7SEbiQlKRgz?=
 =?us-ascii?Q?F9snP4P6o5O06H8ijNwYPaZAZ8eCFLNNGKO34EqdNkIlzsiIqzYHQfUg6cNI?=
 =?us-ascii?Q?WjS5Iu3tq3uC/d7jg/SiUFigDJSBUdwLeml+zxtriS+XlHSl0mqG2KfjiH7N?=
 =?us-ascii?Q?1iDCGSxgLucnsg1yf+PUpEO8VbgSY6+tUHUJ4iP7y2t06atf+cbaA0PafeN7?=
 =?us-ascii?Q?yAr+OKDcfbD1adZCss8Ka8iMFTx6eTgpHbSDKqr6gamSXv/JeFj2gy491SHe?=
 =?us-ascii?Q?OkOpjHgwJcvq/lzYNs5XYjOEjxEb1nIKAp0gyVZns0KPiwqqXFtyXwJ4Xhgk?=
 =?us-ascii?Q?b+2E8VaJVYn4ilQzPmNS4DA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 715092de-06b4-4827-9cf0-08db0a5a7760
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 04:59:47.1867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hq+6zDQcx4ZiVdlctYfLHrDjRaAtoN3PbnkCRKsjrz10TpBDUUu6QgTVfxdhv/8bhY7l7zWxFee+71/6CnwgrHqYu/YWdH3qNpK/VAwMq4cTS1EXpuPGC3AYmOjRA5jh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5807
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/22] TLB Invalidation
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

On Wed, Feb 08, 2023 at 08:54:04PM -0800, Niranjana Vishwanathapura wrote:
>On Wed, Feb 08, 2023 at 12:27:01PM -0500, Rodrigo Vivi wrote:
>>On Mon, Feb 06, 2023 at 02:39:33PM -0800, Niranjana Vishwanathapura wrote:
>>>On Fri, Feb 03, 2023 at 03:23:47PM -0500, Rodrigo Vivi wrote:
>>>> Let's just confirm the reviews on this patch and get them
>>>> merged to drm-xe-next.
>>>>
>>>> Matthew Brost (22):
>>>>  drm/xe: Don't process TLB invalidation done in CT fast-path
>>>>  drm/xe: Break of TLB invalidation into its own file
>>>>  drm/xe: Move TLB invalidation variable to own sub-structure in GT
>>>>  drm/xe: Add TLB invalidation fence
>>>>  drm/xe: Invalidate TLB after unbind is complete
>>>>  drm/xe: Kernel doc GT TLB invalidations
>>>>  drm/xe: Add TLB invalidation fence ftrace
>>>>  drm/xe: Fix build for CONFIG_DRM_XE_DEBUG
>>>>  drm/xe: Add TDR for invalidation fence timeout cleanup
>>>>  drm/xe: Only set VM->asid for platforms that support a ASID
>>>>  drm/xe: Delete debugfs entry to issue TLB invalidation
>>>>  drm/xe: Add has_range_tlb_invalidation device attribute
>>>>  drm/xe: Add range based TLB invalidations
>>>>  drm/xe: Propagate error from bind operations to async fence
>>>>  drm/xe: Use GuC to do GGTT invalidations for the GuC firmware
>>>>  drm/xe: Coalesce GGTT invalidations
>>>>  drm/xe: Lock GGTT on when restoring kernel BOs
>>>>  drm/xe: Propagate VM unbind error to invalidation fence
>>>>  drm/xe: Signal invalidation fence immediately if CT send fails
>>>>  drm/xe: Add has_asid to device info
>>>>  drm/xe: Add TLB invalidation fence after rebinds issued from execs
>>>>  drm/xe: Drop TLB invalidation from ring operations
>>>>
>>>
>>>Looks good to me.
>>>Some minor comments on patch ordering.
>>>Patch #8 can be merged with #10
>>
>>did you mean squashed together?
>>but why 8 and 10? 8 is a build fix, so I'd assume the issue
>>happened in a previous patch, not in patch 10.
>>
>>08 - drm/xe: Fix build for CONFIG_DRM_XE_DEBUG
>>10 - drm/xe: Only set VM->asid for platforms that support a ASID
>>
>
>Sorry, I meant #8 and #11. Most of the change in #8 is removed by
>patch #11. So, #8 can be squashed with #11.
>
>>>Patch #10 can be simplified if we move #20 before patch #10
>>
>>indeed, but at this point I prefer to not touch them...
>>
>>>Patch #17 should probably put ahead of #16
>>
>>maybe a squash? but I will probably just leave it as is...
>>

Actually, in patch #16, we are adding a lockdep assert in xe_ggtt_map_bo(),
but lock is taken in patch #17. Hence the comment. But it should be fine
as it is a functional dependency and not a compile dependency.

>
>Ok,
>Niranjana
>
>>>
>>>In any case,
>>>Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>
>>Thanks you so much
>>
>>>
>>>
>>>> drivers/gpu/drm/xe/Makefile                   |   1 +
>>>> drivers/gpu/drm/xe/xe_bo_evict.c              |   5 +-
>>>> drivers/gpu/drm/xe/xe_device.c                |  14 +
>>>> drivers/gpu/drm/xe/xe_device_types.h          |   4 +
>>>> drivers/gpu/drm/xe/xe_ggtt.c                  |  23 +-
>>>> drivers/gpu/drm/xe/xe_ggtt_types.h            |   2 +
>>>> drivers/gpu/drm/xe/xe_gt.c                    |  19 +
>>>> drivers/gpu/drm/xe/xe_gt.h                    |   1 +
>>>> drivers/gpu/drm/xe/xe_gt_debugfs.c            |  21 --
>>>> drivers/gpu/drm/xe/xe_gt_pagefault.c          | 104 +-----
>>>> drivers/gpu/drm/xe/xe_gt_pagefault.h          |   3 -
>>>> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 342 ++++++++++++++++++
>>>> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  26 ++
>>>> .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  28 ++
>>>> drivers/gpu/drm/xe/xe_gt_types.h              |  41 ++-
>>>> drivers/gpu/drm/xe/xe_guc.c                   |   2 +
>>>> drivers/gpu/drm/xe/xe_guc_ct.c                |  10 +-
>>>> drivers/gpu/drm/xe/xe_guc_types.h             |   2 +
>>>> drivers/gpu/drm/xe/xe_lrc.c                   |   4 +-
>>>> drivers/gpu/drm/xe/xe_pci.c                   |   7 +
>>>> drivers/gpu/drm/xe/xe_pt.c                    | 130 +++++++
>>>> drivers/gpu/drm/xe/xe_ring_ops.c              |  40 +-
>>>> drivers/gpu/drm/xe/xe_trace.h                 |  55 +++
>>>> drivers/gpu/drm/xe/xe_uc.c                    |   9 +-
>>>> drivers/gpu/drm/xe/xe_uc.h                    |   1 +
>>>> drivers/gpu/drm/xe/xe_vm.c                    |  42 ++-
>>>> 26 files changed, 736 insertions(+), 200 deletions(-)
>>>> create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
>>>> create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
>>>>
>>>> --
>>>> 2.39.1
>>>>
