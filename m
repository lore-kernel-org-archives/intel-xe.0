Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5992DC77B73
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 18:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AE610E399;
	Wed, 24 May 2023 18:31:18 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F0F10E399
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 18:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684953074; x=1716489074;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Xq2grkXGG4emetWfVGwjqMN1FvGunaiAbDOhBbLfQaY=;
 b=Pj0pgkqalLz3FauA3QOlbRdKDIdMF0iQxXJ6JqyNjQEhXEuetpmpWbdB
 sHd67enOjcFmmolMBv8fYXOJUoS17qog2uNzqcnEt7MXXxCs75d0mCIR0
 +i6aifb7OppoiWZ9BredR0HnwNidlJgJ4L7pedqayg+dG9iomkIgt9Ck/
 ApLm4Nf2BwhD01LoDVT2uKiuGQLgrBAfvR8LhC9vwea9mRn7ApUcmcIuv
 nyzmub6fmchGVqjSfALKRYYz3NZglZKmClEJyRrvONI41nVO0AeRUsxu7
 ytfJ0oAuMGHLC5PHnCpRuCiq8zevO3xb+cFaiVURSMi8ppZzbsMfZ/Qzd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="356883208"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="356883208"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 11:31:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="769571800"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="769571800"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 24 May 2023 11:31:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 11:31:02 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 11:31:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 11:31:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 24 May 2023 11:31:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5Ll8kXcSIlhO3dqFTjWk3N9OL/a3egDjcG9mpRLIskUlRu7QPZzuEAUet/qmhBPiBcKB+SOgYmqm6K/K5g65nO7I7pUnLwAOWRmiZu+wYtVEw+Lc7yHaQQn2gSi0GWUUrANzUcX1s+mNHfNcFQ9GEwegXK+7iOcIUX9usUljdDrR57hQqAmWdU5mvHhcyGKRgknkk5RfMoqHVnUBXQA58En6FnkXgncvNOZfAvMZBogzBM13k+Hm+lAZg9ODueSQbVgrVyS1jmT2uTpJBMNUc5kpgemMddlwYp/xnUO2GDBVEnx/KtYsN9odnxOmhbp+wHCyN5lWY/e1YbiFAuNew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTNwJoLPU1+MKfAOCSYO6F6l6ONgnbgkThV3wNYr3iA=;
 b=RJ1z7LAEyHofRO08m47D+CgDxiozImFFE7MoRprQ9owmyd+HlQBXxnLfrfvA/EqF1geYioUsrqJx1VVvCUXelVRjtRyQuTKSreNJis7d1atqsiT3GZO4VtI2F4/NwaPdpGGLwThNh8lgIh6MJo0OULgvafrb6tSYpSTAzW2EL0zr6ohXacHkPWPjzWspb4glqbwRLHO9RlQjL5w+DtuC51NjvnP4emnQEkJA9TmQiM8lC4ZxDA5wksNm0PvGP6ceIp/HK3P84EfK5kN3EWkQrBtQUbn2s2Q4UKC3WMiS7xsb+FiihUZVFvvktxEfPCQ95PdjXym3rE1QD6rBosSKhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Wed, 24 May
 2023 18:31:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 18:31:00 +0000
Date: Wed, 24 May 2023 18:30:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Message-ID: <ZG5Xx1R2xh/tf0f8@DUT025-TGLU.fm.intel.com>
References: <20230524123648.29955-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230524123648.29955-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR08CA0007.namprd08.prod.outlook.com
 (2603:10b6:a03:100::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5433:EE_
X-MS-Office365-Filtering-Correlation-Id: fb012c4a-2624-4251-836e-08db5c850575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vc7rm4oKsYxZI8pgw/2149XF9KeyJ15yP6Z+bIQI5RTuqIC3UGVEDWiGPWnfLqb1egMAsUBl+8rSoSsImqU/UhZjGa+M+qbnJY95s00MAxc90JMYgHSmnUv53uxUKygXV/WXHBl2qSx/3jMt3bRc6/Ehtp+XpYBVhp7zyBrJ0hW/DxJ+yvTDSy8gy3NHm6ryDrQvrhq5B7fuSVMPeEi+QUCSr+/KrhgHHz9YewZY1ea3MfBxpXRL9oBooPUzvfTB7RKoskIyvWZS4LY30mdYPJjEq7+p/ReyYtgSNJeDrey9GuAXg/kkcQZoOy/XzT8WzKgPlwYO4bZrZ3LMab0ZWD/UCqN/kZn56ndbp9+gNLq4ArjHDf9cWAOUiREKviEvLNFT9MF9wOzkrEuKlKQu7kewRIXY2f4MN2A2G1wbRGXJDoSuzuveD024OI6VdfH/qj2PEIkA+WOAkS5d+NKUAWDv++K22fWt5CuZ8xqMROe2o9V5+fioVBYyVmmkB+yqP0Z/MWHT+Qkrb3LXZk56k2f/crzIdQicGB49GvulHhD2WM+QAYvs6nwvFtJV0Xrs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199021)(6666004)(41300700001)(6486002)(83380400001)(6506007)(2906002)(186003)(6512007)(26005)(86362001)(82960400001)(38100700002)(6862004)(44832011)(5660300002)(8676002)(8936002)(66946007)(66556008)(66476007)(4326008)(6636002)(54906003)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RdJRTkJF0IzI2HZNVg6bKFRkxdPE08aEQ0mHvzcTrBh0nkTwFQNqglh0jr?=
 =?iso-8859-1?Q?XKrRsbnh83O9ETKJvlS5Qxj2vS4tbaDCa6I+98JzNhOfrYkPoZEQ2FPl+K?=
 =?iso-8859-1?Q?MVgIw/7cL1RVMn6AX9x5gho1ll2+nUpdCMCnaUzmBBaV5tPraGAfL01dUV?=
 =?iso-8859-1?Q?Ayqi3lcattop73zDjsqbnzTe82ledOtF6VwAyOVfR+0knPlTEgD/QucZgM?=
 =?iso-8859-1?Q?0PcXsNRXgUa1FgZUihTrJwhjamxGDC7/CjWo3fQqN3s89oFULzAjzJ2y6G?=
 =?iso-8859-1?Q?KEAlF+CZh66pMl18RINczg97RjxiFVFFZ/HGI213fvS44vT+xZrmVBkXXi?=
 =?iso-8859-1?Q?XTZQBpRpPy1UVK1nDjgm37z2xT6e6p25zXmZ6TtqTgdQKSSe43P7zePYIR?=
 =?iso-8859-1?Q?STal2xQeAoYJVdsCXBgwm2gpq6pvueOQd7YYs5w0tEmPCAWbT9B1vi9gV/?=
 =?iso-8859-1?Q?DUXj5yb3yPxfYa0i1hFn9RLy2HAXMonoSnUGgwOSlmFZ0iYwBJ5E0NK7Lx?=
 =?iso-8859-1?Q?uWO/zOO4CLfdtextcf6NGhylrfRyLuOVcLtxgjMhb8r5Vep6fFktX40CHr?=
 =?iso-8859-1?Q?GxWEmCzaV/AYeyu9JBg5Vs8NMxazZGVY9ERVbjzB1Tbi4WD0k94B9WgPfl?=
 =?iso-8859-1?Q?XajApg6TggKI/KOAf0Q3JBqaXNagCHt+ThNbLdVpshnxp05aqYNqCOfchP?=
 =?iso-8859-1?Q?my9mjjMs1rYsg1uTt1BMW+80l23Qw8At53eB6q/doexN0Jp39zbGUmlXQ+?=
 =?iso-8859-1?Q?JD2OeLfAh7wybm5o257fgLQ5FEYCdeln2LCIb9XHURF261fsHvQhHaKAqD?=
 =?iso-8859-1?Q?QqRx+GFcq3JNn+yE/JmXkQ+tkS9CBYuIfkYKhHSbLsD3HLv82tMNKLWy24?=
 =?iso-8859-1?Q?36deZRt5BmU54jBFKuhldEEqSrSmNw4+KgplfjTCIKZ12DwWbkVNPLXCvT?=
 =?iso-8859-1?Q?uu4FZMV1k9RRpKMWo7oNxUJqVPXOLi8XCeSb8I36K13iDblIe/D5X3Bu4l?=
 =?iso-8859-1?Q?GRYWFACMx3kFK04ascwQHGCRRNtR+d+JuUiQCCsx3f21u55K6GvCygxGpm?=
 =?iso-8859-1?Q?1uKBNPZiQxZy+lt4xv2379VTGxKGslR/6Cg/lUwf84KouS7ZKCtBUcUSdT?=
 =?iso-8859-1?Q?Hs9vKbbSlIH6+1MJEQe1ODSds+0kW9Tjhofo62N9NQzKiFZxIZUmkebFmD?=
 =?iso-8859-1?Q?zVNF3eZTsWe0ZLwipiZudWKAaXs7rzHzCFtKmokZAiAhZWoRjK/7W0M8nq?=
 =?iso-8859-1?Q?33j6+Xggb9YC4QONtTRQD+zEfL15qKfExCf09rdrTwNU6L/Jqy2GGClfR9?=
 =?iso-8859-1?Q?U7wPp5tyZNCCMMWNMKJpBOxBi2NwyuOyCCThTW2v4zWQicFl+Z4YUbVup2?=
 =?iso-8859-1?Q?d5YfggQwZaVYzfK+5LaljX4ppOMcW2qhqA932HNxr7vZ/NZaaQ+HbXvqTR?=
 =?iso-8859-1?Q?Qi9T8zlK5qH6j20jFE7QnGw3h/LQHIEVB9FUu8Vt6/tWIu9zeAbo4708Yu?=
 =?iso-8859-1?Q?F6AY6j6rGUzKecv0FGeK30Pkja+qm12Kp6X2vGhEgkQ8SDbro3538Byx3z?=
 =?iso-8859-1?Q?h3zDFqdyPZSpHYn8OnNQ3mcLTSaommtqgKnmPkjykoTBUft13s+37krRLY?=
 =?iso-8859-1?Q?BjAHJ/Cpag/QlIW7/A8LEgYIi3KUsxlBHq0dXcU0UUun9WPjUzvQdqwg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb012c4a-2624-4251-836e-08db5c850575
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 18:31:00.0566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cb6ztqHipy4vXb8NmuOlAZzeZRtnUyYzrI3YvGjslwgwUvZCJE1BTccgYT2VpbipJzzpcx3luXD8tS8SeUVtnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5433
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 0/2] Implement vma madvise ioctl
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 02:36:46PM +0200, Nirmoy Das wrote:
> Sending this initial RFC patch series for vma madvise ioctl
> to gether feedback if this the correct way to do that.
> 
> I am adding two expected options for userspace to pass
> 
> DRM_XE_VMA_MADVISE_WILLNEED: 
> 	* Set ttm priority to normal/high(if cap permits)
> 	* Make sure VMAs are in allowed placement and bound.
> 
> DRM_XE_VMA_MADVISE_DONTNEED: 
> 	* Set ttm priority to low so the BO belong to the vma
> 	become early target for eviction.
> 	* Make sure VMAs are not bound.
> 
> Questions: 
> Should this be part of DRM_IOCTL_XE_VM_MADVISE rather than creating new ioctl?
> 

Def not a new IOCTL. Let's take a step back, what are you trying to
implement that the current DRM_IOCTL_XE_VM_MADVISE IOCTL / VM bind IOCTL
does not support?

Matt

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com> 
> 
> Nirmoy Das (2):
>   drm/xe: Expose vma bind-unbind functions
>   drm/xe: Implement madvise ioctl for vma
> 
>  drivers/gpu/drm/xe/Makefile         |   1 +
>  drivers/gpu/drm/xe/xe_device.c      |   2 +
>  drivers/gpu/drm/xe/xe_vm.c          |  52 +++----
>  drivers/gpu/drm/xe/xe_vm.h          |   3 +
>  drivers/gpu/drm/xe/xe_vma_madvise.c | 223 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vma_madvise.h |  15 ++
>  include/uapi/drm/xe_drm.h           |  28 ++++
>  7 files changed, 296 insertions(+), 28 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_vma_madvise.c
>  create mode 100644 drivers/gpu/drm/xe/xe_vma_madvise.h
> 
> -- 
> 2.39.0
> 
