Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28616C48BF6
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 20:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF52B10E5E0;
	Thu, 29 Feb 2024 20:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6Zjwv0C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A1310E5E6
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 20:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709239242; x=1740775242;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=X8HYsytNlNvBt9IWv7CGY97xeKxpFwMyiFdlaByslvU=;
 b=a6Zjwv0CE5gII61u1h5zl8QpY+rhRO5ICYQ45g/w0zbCBEgWlwJOGzID
 iHyjkk+qTUPUhC7AW9aaiGCC04oJaOkq9W9uFAMKSKnuu77F43Dn3DuVG
 fXAw3mZy8gbI+UwlV35ytRcMb3Q8wg/jw5vyFMEhEI7NDyqvmE8FyqeRu
 mDMjSexyqaDdIOCMrwbVhRHkbE5JMnekWrW9dKwrt5BjAXYnwCnsjxllh
 c2DrEJ277hYyo7V4r06Ii2a0kYL4DKKbR8W7FSiChzmThhY3R9adBseEv
 Temeb5ml6PjY6xJEybJR489uc69E09gYR1CyN1Y4TbLDNI4+Qc7Xcmctk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3611088"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3611088"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 12:40:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8326993"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 12:40:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 12:40:40 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 12:40:40 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 12:40:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxHQn0wv1+ASd81kwOsrGipGO3cj7fMGYYNWTTf2WLYDaS8FTz2dosGrcXNMdiM+3wNWsuU3lkS76YyXkTZMsufO6fVGz8JpYC82wwLKSeKq08nHItTqOawAHpBFDSayWj87sO/YipXNwlUPKga6vKBdQEu+LxAYM2ryIUu4kjqPLYFRKkQkr+CndGvVuc3ikFuSaualdfahWYOAPkZAyEMqt/fGsLTqUb4jQJuiYPrHODRBRzRBXQRtMn7zgfdYTYx1fg1IZbTezkk8+kcuxyDxDInPCVXgeVsJood5OzNP318yASFCB+t339H+A6jrxrfiOWqSHqPIOlH5LCWwFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gn/Ap64KTkkGUYjauT/SXBpB7zLWzjjztwYJEfJDjfs=;
 b=lQFwuHl59DGBMLTGozvF55qKcuk2xURLEw706PCk1nVAn+tjLYmpwzsyU9Gml34ZuFD4mNK7U9ZMFYcRkgLOh18oP/KyV/SlQJcRrMiwgfYGOgqcz5z2SQAZNGxgbFe8yT7eYv0Ge6qjL/bQaKaTO/Cbq1MXy/ATFJouaNceBWM237p3b+TMPPArhscrJEi0EDu4cdMn92l08t/hpUlPGRvxd84mvQsJiZzXckRqtc/3lkYQotnjxtTaIu+5UrO8aBUuUb/V2rDCGX3q5Jn5eWP13cx4MmPIT4ADNpmrrAvDJsz8hd3UHJgJ9rcsFlQCGlZjLSjDqUZe5UNuM/zvGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV2PR11MB5997.namprd11.prod.outlook.com (2603:10b6:408:17f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.24; Thu, 29 Feb
 2024 20:40:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%5]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 20:40:37 +0000
Date: Thu, 29 Feb 2024 12:40:35 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVDogc3VjY2Vz?= =?utf-8?Q?s?= for drm/xe:
 Add LRC parsing for more GPU instructions
Message-ID: <20240229204035.GT718896@mdroper-desk1.amr.corp.intel.com>
References: <20240222184009.6857-2-matthew.d.roper@intel.com>
 <170863198061.217031.7044808087597995476@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <170863198061.217031.7044808087597995476@8e613ede5ea5>
X-ClientProxiedBy: SJ0PR13CA0067.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV2PR11MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: 29a73729-3d01-4db2-13f5-08dc3966af78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h+v3IEEOlHRm7aR0c3gGYUjHAZ9a1RwTjxldYld65wnn3FDh72BYELGQg9YtJ2jvUyeFiIItY/txpuRFtCR/nADDEka+ANtloP1izZ49sEj4aVpPD5STibPzWirmlbxBvm3u+VlWoqoJlnQ4O7mwWd5jJl30l8Wkqj+oTHorg66eflQIyG5u1ayKXeXmtkAgLr4we44m2VRR/7uLeST3pO5JXdzvjdp6wuBO8zuyHPh9FnHLe7KHQc9TQMWmgdQd3hGkEGm0kUU1u0alI6JMBOm+bcERUYOHNFUkYbYRenafcwR0w9C/7RHO5AJc02xibY9fwVPnURGWyiHkSVtcjsiHuU8rvvDyOXXJ123lOBqBdZyKuixYdwcFEPyQtRKGrHqhjrDXbH8Gbg8FsxCtCNvoNQjOm0q7WCYcoTSPqg/p1K/38eoZjdk+g+9PRN3CSDxk6yDrXQmemR0MdDQCx/qEhOg7SY6NUOdwJvb63RO7ttTC7j8wrJt8fspPSUDojTt7AvFcZoW6blTrxU0kfiJBmrWoBvhFQ/O9kdGYxJmnu4Ovp4kXgTcxLo8ZnEmqMt+sQctdoMZNhHuwXMusNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Hp/+Te94T7FZBHK5TtFPBXs0qySp99brU0+zILgs/k0sTHawF4KExkQSeQf?=
 =?us-ascii?Q?BrCpPCIBTLU0TSexamSx5Jg+o9S+YJlVBSef21agbuYso2UYyX/wW60jwV4f?=
 =?us-ascii?Q?TK459GgefnQCVH0VtIRvvXMJFn6zmiwNI2q7RetkXW9K7M7xYnoDxz/2b+uK?=
 =?us-ascii?Q?bCf9FtzITxqUqUwIRUntQALr+ob6VOw3A0w2SNjWW3KNHEqJRYZm7NZqKrXg?=
 =?us-ascii?Q?/eWkPJ7HjwheuFLm3yADmIQ/wBINCgWFDqZGOT6LNztrMXCv9XcTDmbE+3FK?=
 =?us-ascii?Q?iTkwZVcpFc72QQvQ2s3tPMzWpBmc4svVPLv0/0cDuQf4bcLFTUT8jejCrMyl?=
 =?us-ascii?Q?KgWsmvJTMH0F8N/+XkkuEhCGoGY++CaaCueEnltNBUIZgbvXapCd6ep8sw6X?=
 =?us-ascii?Q?qGvIskiNs6Q3QLwpH+WZYT/2RYoXblzf1M8VNcldSE/SGF3erhQX7hA0BM3a?=
 =?us-ascii?Q?Y5vspQo9c6SH6v/Xrv+MN7h3+iH2RjRANrGRXpprPV3ChVHc13Qmj0OgCufv?=
 =?us-ascii?Q?c6B074xu2KPOPvsAmtMCr6dWqctknSCegOHZJig97U1KcKRfHkptiNMsLIhv?=
 =?us-ascii?Q?7EwTv8wsJJQP54U733Ya/BY4Cw9cdkftgcqFzBuvf0Cwi0voSves0j3DNT2o?=
 =?us-ascii?Q?VoPArVEjmRouXi0YkKoUhwWkuf7sIAe9woFnrIYc3bCuP8s+L/YwAy5pokj2?=
 =?us-ascii?Q?0HvqUA3BGyHKoz6skTQxWwZunDKmcE2uTrqHTmvG/qjllvkO0JZzcr9yme7L?=
 =?us-ascii?Q?l8j5T0Ipmi4uwLFyp/HO/6HwPhrsN4oGt9ueqE+AJoIjGi/aibpQdeaaNvnl?=
 =?us-ascii?Q?QEe2Ecr3quvp2ZeQ9RvsYgwUIC6VrE78K+MnFubG/z306w6XhZMEDj9tzDjo?=
 =?us-ascii?Q?EXl4iHeuR1gEkvZ9JLTcgwoCyk20uiXCdjD9aiKj0b9VgRlS0uZ2ZQPjLgEo?=
 =?us-ascii?Q?78oSYZLlIk381A/MAbsjtWKnL8x4yGd2EgPQtAfWl7RiOwikRUInuSFBMIJT?=
 =?us-ascii?Q?vQqr2pghgxfbuhKTsQ0jjkLhBhF3N9IFn80gM9s/o/PY3yJ4427S4aNV3W+T?=
 =?us-ascii?Q?kc+IGMx2vkPy1QtaL94QLRNiXdmKistQaZI098+lTvGd3MdASJxIrK4DWmOz?=
 =?us-ascii?Q?tbWXK7+G89njVtSfAQ0SmnzikRMCzbMyQh/dyytTMsBI8dj3wlRXvRtobEYw?=
 =?us-ascii?Q?ScOx4X9hb8yIQiRbI3z1ufyYgAWhuV3+xtctEVISybAAFgFDkF88cZYt1Bxn?=
 =?us-ascii?Q?8eKAAqFkSdSCwaZpCj2W29zyDSHQ0K0POSB/rNDNw8ZXKqkWUCY3VlOcLOfR?=
 =?us-ascii?Q?gLaoYdSsjF0JZ5NdghYgeQov7tLCBS+5NQUy7cPBZ7PYMjPQl7hAuKPhwWtv?=
 =?us-ascii?Q?k0c09hW90px74xRvCFeUE8I+Nq0n+5DolU+LhTd1h7crdKM8c625H5jVHZyI?=
 =?us-ascii?Q?MOFtvr/h3B7QoFxv6lyg95hODqjy4pSVOuMja1HadDoYllEEVZjD+MY5zX91?=
 =?us-ascii?Q?UBET6bEKtQGYN5iuyE+nVT7qD81Dm8/dAV9SLaeLW28IuKxsKiICxJDRBesU?=
 =?us-ascii?Q?/eC+xscaXk9Sru5jAOf+ggK+kS2mynadRw7eccSm9v2+IQxSuqddiuJ4xfSZ?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a73729-3d01-4db2-13f5-08dc3966af78
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 20:40:37.4932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JU0l194+slelgMyDLcgMCjuTlJ7KSbLtGHKfa5Bm8IkFBe/8gDo3/MVg8usZUQ4VTOlju0MdIp9i1pVYFBphp+cpPWYGkfprpSbwe5znVMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5997
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

On Thu, Feb 22, 2024 at 07:59:40PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Add LRC parsing for more GPU instructions
> URL   : https://patchwork.freedesktop.org/series/130280/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-829-5dfa3c2da4803652582408bfb3c529970735f594_BAT -> xe-pw-130280v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

Applied to drm-xe-next.  Thanks Ravi for the review.


Matt

>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-130280v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@xe_evict@evict-mixed-threads-small-multi-vm:
>     - bat-pvc-2:          [DMESG-WARN][1] ([Intel XE#1009]) -> [PASS][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-829-5dfa3c2da4803652582408bfb3c529970735f594/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130280v1/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
> 
>   
>   [Intel XE#1009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-829-5dfa3c2da4803652582408bfb3c529970735f594 -> xe-pw-130280v1
> 
>   IGT_7724: a7c03f7521f88f74fdf17c744fd847a775f9951f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-829-5dfa3c2da4803652582408bfb3c529970735f594: 5dfa3c2da4803652582408bfb3c529970735f594
>   xe-pw-130280v1: 130280v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130280v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
