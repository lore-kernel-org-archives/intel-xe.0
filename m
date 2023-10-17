Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E943CCDB482
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 08:53:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D18D10E009;
	Tue, 17 Oct 2023 08:53:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FFA10E213
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 08:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697532794; x=1729068794;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=ItampCD9aJM+7X0JbGauPW47mDpVvC6l/8rPXxuFIx8=;
 b=LO+776p2haUaiS5UQKrHWo4/7iH4OXgK+dQV4kZAkEMJwIzEwhQhrJ6X
 X+kPcYqYJBgmEwWrwJoTqR35iOSQB9XFS0AUkB+W3dNDJXNzH6G3M6Ds5
 NCO2JozBd0iD7QrL5GTYEh1DBqK18qkxdQ4+ZYQrceham3toNR+fDs2Ru
 bCyk3VsLMApmAs2RHnPoqp/jc6z/dftF3F1lGKjeIa+pEMR6BlBUcSWTd
 lqaR+PB0Ofq4qOdNrg2Sv9PtxY2iIvxuvxmF+PikjGDcXVGgHCmivghd4
 KCui3D0GiQwdZLEUFDBmwRTxErwWv9PR97PlJqbL9Otwv3kAtDCBnEMaP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="382955001"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="382955001"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 01:53:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1087421185"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="1087421185"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2023 01:53:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 01:53:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 01:53:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 17 Oct 2023 01:53:02 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 17 Oct 2023 01:53:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XORR094rNPdAMPrG22vc4HWUGN9Fi9DewUBs8+fUrMO0fIFL+k17a0MO5DUozq3adTYRyb7rvjg01exH9KlE/mS/JYBwjLj+rWB5cz4pSeCaQCsCppZZEd3OEwRt7QcO+wXsY5DavH5SYvmpbFcbBNaqlwBeXBmh+9HIuj0Glk0iOJq+M/Xx3YcSS3wQSz1ydCOjg5rAJp/ETbxq8VJ+3nMt/wzRWXcA0qnG24TsLrpRt1QDuE99CqChs2otWAxy3A6V4UV/TgHH+1NevnK6e3ks5nj/oMe75LgwDhn8tBnF6MZRQRgNiDrRYgpClRR+/sJADsmBMs4Uc2dGta7APQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7klonuVm3H6whFOL6ITOgewbnqQCHLUXsFKPrz/rVSA=;
 b=oO8aBLQ6ywpQLtNnlDKIgAIO2nCQm6V/USxt7FzNOMc+0CtE/NnLBP0EDobeDVExE5mF2g5qfWT0sHhdAbqcQGT8NZeJo6NiAbHFDJtFFcbvZ+tt3UAFBqmRrvqdgiiYX8SYxiw6Vrmr/CKM9yOI53X4JQUAxL6Ex3v/wwdJ3yZlxljNlTrnf8tmZ1eujtS6rTLK1qJayYwP/HudrhjX4rUc05duArdpoDOt8bqRpgUB9C8CaCOOgms4b/PjQt6rypes+XnWBgyPBKfhJHijiIN0ftxWoXQZ3jlaSz2sFm5H6hoR+ddIeghE3/I9L4o3Nn/RMevPlhyBRnjfGk0IpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH0PR11MB4904.namprd11.prod.outlook.com (2603:10b6:510:40::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Tue, 17 Oct
 2023 08:53:00 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 08:53:00 +0000
Date: Tue, 17 Oct 2023 10:52:55 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <ZS5LZ3Y1m73AjNr-@fdugast-desk.home>
References: <20231006095943.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231006095943.7-1-francois.dugast@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0013.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::18) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH0PR11MB4904:EE_
X-MS-Office365-Filtering-Correlation-Id: bc31285d-c91b-4663-ad79-08dbceee7734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kcc6KNuHjk2Cgms18A6MlEF9NBXwitMZF7Nbws+8SNmiRaq1xidScGoJLvkEyam8cFlv9mfLNz5W21U1QXmvXAopTxVPrfPSLJfjoK3ZdMBwutPMbNhD0Ixr8Y+Y+tMYiWHGmPjK3XwjxV6ZZXRiGVr7sRWfJGLpNx0YnhBCPU2aeECWOfAvQ8NVaor7MyRxiXuThPw4X8Y7AFfukOsAvTvSaxmc4Y50XdyUoq0ftlVXJExzmpO924zYIfsvsI8lwZWEsZZqDBDoTPndvK19pyxr+6nhsFfFWOz7rzn8C/XTj+iPfv5vjhTu1ZfqL8Zwbt8ciCE2dlFF8j+UTOO9i4InEKwEAIIbiYgUbV3cVWvHqgTzoUC/S2MPdn6aSyJX2tmp/o77BEPj3wGmnEEcZwGCyqapXw9UD0kIhUOJb/V+zmg7sEuarOxKRMd7rsdXJj/l9v9I01L7PcM3zaiK8IuH6VY1NLhn1w9QPaaZjurdAK87MsIRU4nz3PrHbQpSDEuB/Qxd1DdwgPgb3YXT9t/RxzHDDpp387q3mQ2tH8eYtC5yfSTXL7McuO55PIGy3wEYNCGnZQT43/5ziCH51g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(86362001)(82960400001)(36756003)(6486002)(478600001)(966005)(6916009)(316002)(5660300002)(66476007)(66946007)(66556008)(38100700002)(6666004)(6512007)(6506007)(9686003)(36916002)(26005)(44832011)(83380400001)(2906002)(41300700001)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SQMyxP5NLWlVSDsROsZCYakfpNUyN1ziAdlktFZpDi6zchHO/2Ac813Dgiqz?=
 =?us-ascii?Q?wIa8qmNba/tZuxn3RhHmtCj4xvcxPdaNlDE+qNQ8pAV7juhUj2O8tAPyLZmJ?=
 =?us-ascii?Q?X/pAJw2IPiK+l5vurHw7mcWYQ/wrhnkYbcQXm1bh7FWmUEGfEm3WrEIJSokV?=
 =?us-ascii?Q?WzEG+l7vCzUVGCOrjVcSg6MiJGB2LC5MY+K5/3N7zy3LwH7+a1H4sPvKUVoN?=
 =?us-ascii?Q?WGC+7GQSuq/QLKHCuCaNqT5VHKdElLe/hX9WmQHEDbZkHV6SRMlCLxY+CmFZ?=
 =?us-ascii?Q?IR/wArv1IgcrvTasdZoE3/Ly1pOXK75fVJhvd+svd4yWa+nXZmoYJiIFp42a?=
 =?us-ascii?Q?CuwbgQA9PSqHLc354yWIyHOKn7ZgQ7Ldu85AGNU2gYMO8o0wX559SFd0YBRw?=
 =?us-ascii?Q?d10iXvIxvj1CFq5t2a1meEOmwV3e72IZ09WHtxgdAJN4fpN5E090AlL6X8bj?=
 =?us-ascii?Q?xIrNDzdyLqVLDhBDcuC0zzqsY7mkNaG8QxjsPKjCc3jNdSToAHKuvZf6qTNb?=
 =?us-ascii?Q?V0tphGjGkf6usNeVGVHOPJdOpqZ0QHBE3oTm0rZ1pOAaAOZhYRKddc7dQQDu?=
 =?us-ascii?Q?7Vr8x/9ahCSyYVnvElD8kdxf3tKfZbqdFoNnj5nOZdLTiv3pr0jkLVgATTB5?=
 =?us-ascii?Q?S8Ju2lZaR5iZ6T9fBB1nUnl4YYrxPqwlBj1Zt5XmL1LWA4E4KI9xCpTqFfEm?=
 =?us-ascii?Q?YFuIGUKXUWMaEKxXzVfb8FNXex9OyUT8D2VkKKgwgiWbUST7JJzO+9obn8C6?=
 =?us-ascii?Q?6wzl2UHcBs57c+O3QnFOK/WmDm1hk1KRPcQeuGE/JDEGxyvGQ2XsklqBnaST?=
 =?us-ascii?Q?3Q+tmahNMieyZfTCd0T99IjU3B5x7jBvJP5wiRis7VDPRHHW5mth4cC7jqR2?=
 =?us-ascii?Q?46dXC+ylQCjn+w3RUsGLtAyyR2rhlTE8DArYkzP1Cx0zwyx7rf5rDegRJCZt?=
 =?us-ascii?Q?S/76pEotziZrZePRbJl/YwKSukMxSo2+BQU7I4ryFkrELXQPb3R78IHh2bBf?=
 =?us-ascii?Q?POdbdinDINt0n+dJed18nz/AE7iA/F9KZ5xeo0Ha8YynuFCIKia+mJFfpdDL?=
 =?us-ascii?Q?f21gQeHBvEgpe1yJyRoNdo2SfE7dllEsNtnytYdIDZlqjaUcpMKkiQg/Ij6U?=
 =?us-ascii?Q?b+3STRHFjI8kPww7vP0kB5Abf5hfaIOTcxj2yb+Vt8Ofg332EORZnc0XoxyR?=
 =?us-ascii?Q?61BavNQ6M4gRh4cSx3+6U1+f+1VdR/elImdVD6gR2M6Vtax5FnBqEjAe4UZk?=
 =?us-ascii?Q?cPRXlreY8PD2FMxuE5bcm7Srw6CMkNMX3/+d9D0+nQTPWB+sxo8wCvOBoFAC?=
 =?us-ascii?Q?pPPtoM1sPD1iCIOaR79F3trKbCwKFtoYSuqJnZ8++gI7ZIxFrteyIaDBMPNl?=
 =?us-ascii?Q?qBLEj5wlT/U80CifnISjzLfX6ISgB/E4Auni5feb6FXY1kBypl/iSv7DEP2J?=
 =?us-ascii?Q?HDOtS8L0+pPjJkcqBPaP42oHrKI5+Wl6pJ/kE+Ud+KsOFgWrG02FpbNJz3rS?=
 =?us-ascii?Q?5qvv+08PSwRG72IXO1qv9L3LYOhKTgO5u/Y2DARoP+uf4E1hK0l9uxaChWVe?=
 =?us-ascii?Q?CvVPv6t1dy4XXyI2E1Zc6dVCdZJOLfLLyIxMnqxzezvixGOihrlk2bsPXIOj?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc31285d-c91b-4663-ad79-08dbceee7734
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 08:53:00.1609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnZezANGeWULTg1V3Zrdl04qoiyNF2SynCVKjTqwfhlv/xFaPO7y9I2IgCLIGwxeJ8ZnfjA7E/MCVJOVgwCW2GAU+q8yInYsQ0UpX2HHe0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4904
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 00/20] uAPI Alignment - take 1 v5
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

This has been merged, thanks everyone and see you soon for the next
series of uAPI changes.

On Fri, Oct 06, 2023 at 09:59:23AM +0000, Francois Dugast wrote:
> v5: Rebase
> 
> v4:
> Rebase and remove patches which have not been reviewed yet, so that we
> can go ahead with integrating this first take of uAPI changes.
> 
> v3:
> Rebase and add more fixes to uAPI as well as drm_xe_vm_bind_op extension,
> query for microcontroller version and documentation.
> 
> This is still not the final version as we are missing at least:
> - a fix for GEM create flags [1]
> - a uAPI update to go per tile rather than per GT [3]
> - PAT and cache coherency support [4]
> 
> v2:
> This v2 has 3 extra patches that was missing on yesterday's submission.
> But that aligns with the IGT series sent yesterday.
> 
> Also I'm glad that Mesa reacted super fast and we already have the MR
> ready that aligns with v1 sent yesterday:
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25300
> 
> Thank you Jose!
> 
> v1:
> As a result of the uAPI review efforts started by Thomas[1],
> we have identified many updates on our uAPI that would lead to
> breakage in the compatibility. What it is not acceptable after
> we are merged upstream. So, let's break it before it is too late,
> and start upstreaming a good, reliable and clean uapi.
> 
> Most of this work on putting these patches together for a single
> shot was led by Francois.
> 
> The IGT counter part of this series is available as well[2].
> 
> [1] - https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.camel@l\
> inux.intel.com/
> [2] - https://lore.kernel.org/all/20230919142000.91363-1-rodrigo.vivi@intel.com
> [3] - https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/633
> [4] - https://patchwork.freedesktop.org/series/123027/
> 
> Ashutosh Dixit (1):
>   drm/xe/uapi: Use common drm_xe_ext_set_property extension
> 
> Francois Dugast (4):
>   drm/xe/uapi: Separate VM_BIND's operation and flag
>   drm/xe/vm: Remove VM_BIND_OP macro
>   drm/xe/uapi: Remove MMIO ioctl
>   drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
> 
> Matthew Brost (7):
>   drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
>   drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
>     implementation
>   drm/xe: Rename exec_queue_kill_compute to
>     xe_vm_remove_compute_exec_queue
>   drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
>   drm/xe/uapi: Kill DRM_XE_UFENCE_WAIT_VM_ERROR
>   drm/xe: Remove async worker and rework sync binds
>   drm/xe: Fix VM bind out-sync signaling ordering
> 
> Rodrigo Vivi (5):
>   drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
>   drm/xe/uapi: Document drm_xe_query_gt
>   drm/xe/uapi: Replace useless 'instance' per unique gt_id
>   drm/xe/uapi: Remove unused field of drm_xe_query_gt
>   drm/xe/uapi: Rename gts to gt_list
> 
> Umesh Nerlige Ramappa (3):
>   drm/xe: Fix array bounds check for queries
>   drm/xe: Set the correct type for xe_to_user_engine_class
>   drm/xe: Correlate engine and cpu timestamps with better accuracy
> 
>  drivers/gpu/drm/xe/xe_device.c           |   1 -
>  drivers/gpu/drm/xe/xe_exec.c             |  43 --
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 181 +++---
>  drivers/gpu/drm/xe/xe_exec_queue.h       |   7 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  14 +-
>  drivers/gpu/drm/xe/xe_gt_types.h         |   2 +-
>  drivers/gpu/drm/xe/xe_mmio.c             | 102 ---
>  drivers/gpu/drm/xe/xe_pci.c              |   4 -
>  drivers/gpu/drm/xe/xe_query.c            | 184 +++++-
>  drivers/gpu/drm/xe/xe_sync.c             |  14 +-
>  drivers/gpu/drm/xe/xe_sync.h             |   2 +-
>  drivers/gpu/drm/xe/xe_vm.c               | 782 ++++++-----------------
>  drivers/gpu/drm/xe/xe_vm.h               |   3 +-
>  drivers/gpu/drm/xe/xe_vm_types.h         |  18 +-
>  drivers/gpu/drm/xe/xe_wait_user_fence.c  |  43 +-
>  include/uapi/drm/xe_drm.h                | 331 +++++-----
>  16 files changed, 648 insertions(+), 1083 deletions(-)
> 
> -- 
> 2.34.1
> 
