Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24D7C54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 22:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25B310FE5F;
	Thu, 14 Mar 2024 22:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zk9meMRI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D29B10FE5F
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 22:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710456593; x=1741992593;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=xMGoSTaIboUhcJpI+lkM8JRmFZg150NqC/1/aY+IDoU=;
 b=Zk9meMRIv0K6Y0lW9x+mex/7D0RSzKOa0301AeHNWVVJtGa9Hog1fwxN
 5YbkgdsB9oFuTmsXzICVSWut0KkYdPH/7oTkADQyGt375+5+P1xOxfiVE
 ruukdd2C+1IbDVlMQx2jW6N0WjnONC0Ft0nL6jJzaqEy2uEfF7XQ2LU9T
 OXndXVTagBfPNeloYMacZsOZ6Syd1OOYRWLh3wHlbg7n2w77QRMMObKJQ
 v+FrnPugohVPfvv+e6lQRShQX5sYkGLS6R9JL4QFXmyoVq5qcbWSihKku
 Ec8YkAFxSwm8xrx1D1L5t+UC2kRay4Cn2GtbDaf1RN1iNYP5MkK2QEz2g A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22766465"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="22766465"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 15:49:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12864721"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 15:49:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 15:49:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 15:49:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 15:49:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKUdKtjjIDBWE72yKkQj8UoR916K2lHOC29TnLhSzScWikt/cq/g7RTjsjxBq/Mz9Ls+W6IgbhF1TCO1vhTXyiyehOLydlMoJ78bf8W+olzae2ST1yh2x6hDf9vD+vuNFKGg3YsUUJZjTJ2oIH3XnzoKwBK8r8NYaxuC1O8wYaszGB8BSP6r/RfQYqj//aSzTqv6kpHZmP3CjITz5Uh6SY1UGJ4JLkAe54c+xqqSM7sZFwMfRvsAE0i5cRBlkzjj70sY48urBTqbhAw/Df4mwflZFuEWxwEGbg3B7DX6DdgV0wX9um5OYsIdqFj+e/HJco6J29THpQpJ7l9gIxl6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sZTBZdPePXYYtr6R8WNKGxUjSTcCvnhVqDrT8l5CPw=;
 b=NC2uGiahxoktGYHRSTvox259fi7t/pLXXON4GL73HbQX2BuvM7lbU4Ky45DnFK4B7XTKu27+/3FQ0cifWCstx0xeuc4cg84JUh16ynI9/qQlX9v8hZjYTpIZUhdGCawnx0Id3UNYmpm6Yuhd7SoUN/DTtvdkbA0D+k+lqrut8C/39aS2cCbrF6B4eKezU+OL5R1Ho8X2UGddecVJiOOgo7+b4i1GqdI+9LnZmv7ldw8vRvRnwVDnYQr4cv18FUh02n1+HtaBrwnJPqKTGTIK3Cmep24vIxAwTpXwoAekFxmgGWA2YQpQ+1bVKjniBN309zZ+QWXqtxOtvupdCMvQtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB4973.namprd11.prod.outlook.com (2603:10b6:a03:2de::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Thu, 14 Mar
 2024 22:49:47 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 22:49:47 +0000
Date: Thu, 14 Mar 2024 15:49:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkJBVDogZmFpbHVyZSBm?=
 =?utf-8?Q?or_series_starting_with_=5B1=2F2=5D_drm=2Fxe=2Fmocs?=
 =?utf-8?Q?=3A?= Determine MCR separately for primary/media GT in kunit test
Message-ID: <20240314224945.GH2837363@mdroper-desk1.amr.corp.intel.com>
References: <20240314195825.3226856-3-matthew.d.roper@intel.com>
 <171045597375.794418.6376924200066817585@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171045597375.794418.6376924200066817585@8e613ede5ea5>
X-ClientProxiedBy: BYAPR08CA0012.namprd08.prod.outlook.com
 (2603:10b6:a03:100::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB4973:EE_
X-MS-Office365-Filtering-Correlation-Id: 83eae4ca-c38d-40dc-cd37-08dc44790cb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tp2Sq0HrL9jaSOnyrhJY3oKK73Qt0pgIqXAzVrcphzaNmvwp9bOtndbOhwVCchaOCWIx8qJFNOIxuBuR7ibXc6oVUOg+d+UvhJcxBjZCyQh6YQMkaFoo2/VwNSgncUYBog1jtbf2P5C8Mf+V7u5leyL5/o6BLwv4/EeRGBDPUjXHBtVSHFY256tM5onZm9+MnwgxE7dTnaStq6oDm1uv+6NcOEvDuzq0EaGm2F6KZdXI5CXEOcgAB4769SbeQnG3ZHR61FPzouCvAj6tP8uyOmxMY41XWP8o7oRdJbJ7oIzo0Ktmy7kH4IZQwvdhGZdZaMz372o3DLYQV1pmCLZajJhUIlRgyXWCBaUStHIQRU+99fjLkk3mimR/jZN6QOrw0+Gt6ptmPhqsWYi/8gmxliSFPYFOlsCPsq3UlrO0gGg1S7IpVIgnmDWPIg61MIbxdRzbRPwOm8zNowT15EVYziUJDqnjHwV0Qlru8FA6JFPKCYKgYlpgB/6V8hVMtuRK26s8ZZF8X2rvq1k0qPEZ8TsQ6pzKNe0Em3EBgZKmAGySssxfaR+7sEbtzhpXTNTyO+wxVDm7UrT8/AZGDVrVnCM5SD7ZrghoBETr5wFrbrzhvFZwXQXp009+sxAHI70U
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bLsLKLjpv/vnqaORUewPw8EPcAX9rDTIPmSN/uZO8HOs5DrVQEKhVAUw3wuQ?=
 =?us-ascii?Q?jk1L52MYWLTttWdv/JbhiMcgrlShseREb3MfWO7YN0S4kG8dBIqh+IP2rhid?=
 =?us-ascii?Q?iGUBrh0mz9JIgsTiiVj5tMFZnMbxKlbTDTvlrm3kbTiKkPgsjQM/BgvHyD5h?=
 =?us-ascii?Q?zuOUOhD2QpF3xPAiVQtgmVRt+AVQ3fFid7+SRicTMp3VwVe0tuRWLkTbqIZq?=
 =?us-ascii?Q?FYvdEal6N+m1zpksQpdbxgVgLRhxQt/mtINSpwOST8FqS/hQchSv9iUONYTt?=
 =?us-ascii?Q?WfcKrwVbz3akJ2wVSHGDXpwC7bZw+N8T/6bUOjtHL2VQRFmq0y2viTA+VQQN?=
 =?us-ascii?Q?/GgcOGogzTX39udY01DQiYwwdqCAVe2m1lM8QnUkzlhchg3BjZzsPAJlx22S?=
 =?us-ascii?Q?dsS2hTuunuKsiuhZbiLNSdcw7Pnam8nQXoTTp03sGfZFH4HZvuix4Ax8wvR/?=
 =?us-ascii?Q?gzX53kcsT96VR6hDznKw05GKMwJpoHeJ8iSWLtV3ApQPUI2qZN2J5++7E/MF?=
 =?us-ascii?Q?uWH6xSgSxcqVbROCrm6vqKWYxMwrCD5Kq2ZJwpln6znAbUJjiPKPr23kUFfi?=
 =?us-ascii?Q?JSwkCzXvA6wZh+DTF4R42K0QNA4ynsZ1/Kn6BLWaF24Y6ZMVx5apYvIY0f9P?=
 =?us-ascii?Q?OilP15/83omtEvZvjcLcRIPCu3i3rVEUlSa8N9VB9dYFilfpdnVncXhC4dOJ?=
 =?us-ascii?Q?ZTJLDZg0gFvEJhnyN3DzXzxR/ZuIhwUoAPZwu6/kGDORDyG3NjzCwVDHyLKK?=
 =?us-ascii?Q?FZEs5c00nOGPH0joMif25y0fofyYCN7S0qjwGnyydbI0MtIEcXmWXQD1xydb?=
 =?us-ascii?Q?Ur0hj2UoD8H38Iay/EXyPnonKCaCtWtxCVaadWYY9oLskbeENA0O5oIiouWP?=
 =?us-ascii?Q?xX+LXfXeBU/X8ZA2ZgBi1W0oA6xVSIAMvfZT/H378QqybfybD/uqIfsaNdl3?=
 =?us-ascii?Q?+vpVe+j83/ueZZXiWChaTAm68hU8LcOa54KCtt0tGSFmYV2YfBFtcklJJqDS?=
 =?us-ascii?Q?vGVI9CLuSCEaEYhaZlGg6duYrXNqjXcJH0yJULQprUWUiPxFwJmuDeVtA4VC?=
 =?us-ascii?Q?9n9CKuwetpPcBOPfA0G77VS7noTamOwHW82FtXTOuP4td5+wqPflnh7FT+AI?=
 =?us-ascii?Q?sDHg5rtzSdF8cyfE3rzebP6ZAX0TMZRQVR5O+6PkXWYMKkrCsk2uaDvMRz6N?=
 =?us-ascii?Q?DETHLnTIoyvSiVvXt9SEWvh9Ctt+gZC9tVATxC5F84bT0wSgAuK9pKud/Oib?=
 =?us-ascii?Q?ZumWxMOYnN+NN7+oEch5jI/cDxXTz9082aQUbI7NtCQdsJNPdW7XYPcq4SqW?=
 =?us-ascii?Q?pnlSuhCtCXuvqNyw9EPOZHC5WYIIdbyKqfnutSMDBOt0qUYyAOcdds+83mF5?=
 =?us-ascii?Q?0zkt7koTO2h6YAZflwlB1OpW0WLm3d0ItEe6ZLmriILHwnqIbXqNaJ2olS+5?=
 =?us-ascii?Q?2irOSqBC4ENrtBDrLYQn+c6DX7+2P6pVTx2MVX68CHGErsZ8zEOSb/j+wc8i?=
 =?us-ascii?Q?6CX531rnY+VDkI7eUFfO63c0uWjiRxok5ZQjKPl4YOULr2N+pxoEp8NAJLST?=
 =?us-ascii?Q?CFaVvwccQDRhp82VpmfL3IgY/TzW1QC8KwZmooyv2a+AP76LDXOrQDBiWskW?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83eae4ca-c38d-40dc-cd37-08dc44790cb7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 22:49:47.6426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0bgkQAKSPKf1WPUWJe7LpFqwwukXZLwxknsJ4SaS0ML05COjjZ46EDmNAvvYdOQnJCFXVASsG1FuSYeN+2+ag4qohHq3ouPzITb/l5LbwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4973
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

On Thu, Mar 14, 2024 at 10:39:33PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/2] drm/xe/mocs: Determine MCR separately for primary/media GT in kunit test
> URL   : https://patchwork.freedesktop.org/series/131151/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-943-c44e29a7b62293355744fd857aad93cbf43e5126_BAT -> xe-pw-131151v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with xe-pw-131151v1_BAT need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-131151v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-131151v1_BAT:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@xe_evict@evict-threads-small:
>     - bat-dg2-oem2:       [SKIP][1] ([Intel XE#1130]) -> [TIMEOUT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-943-c44e29a7b62293355744fd857aad93cbf43e5126/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131151v1/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html

This appears to be some kind of timeout/deadlock, not related to these
patches.

Applied to drm-xe-next.  Thanks Lucas for the reviews.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-131151v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-dg2-oem2:       [SKIP][3] ([Intel XE#1136]) -> [PASS][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-943-c44e29a7b62293355744fd857aad93cbf43e5126/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131151v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@kms_addfb_basic@bad-pitch-128:
>     - bat-dg2-oem2:       [SKIP][5] ([i915#2575]) -> [PASS][6] +50 other tests pass
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-943-c44e29a7b62293355744fd857aad93cbf43e5126/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131151v1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-dg2-oem2:       [SKIP][7] ([Intel XE#1134]) -> [PASS][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-943-c44e29a7b62293355744fd857aad93cbf43e5126/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131151v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@xe_intel_bb@create-in-region:
>     - bat-dg2-oem2:       [SKIP][9] ([Intel XE#1130]) -> [PASS][10] +154 other tests pass
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-943-c44e29a7b62293355744fd857aad93cbf43e5126/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131151v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
> 
>   * igt@xe_module_load@load:
>     - bat-dg2-oem2:       [FAIL][11] ([Intel XE#1132]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-943-c44e29a7b62293355744fd857aad93cbf43e5126/bat-dg2-oem2/igt@xe_module_load@load.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131151v1/bat-dg2-oem2/igt@xe_module_load@load.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-dg2-oem2:       [SKIP][13] ([i915#2575]) -> [SKIP][14] ([Intel XE#623])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-943-c44e29a7b62293355744fd857aad93cbf43e5126/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131151v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-dg2-oem2:       [SKIP][15] ([Intel XE#1134]) -> [SKIP][16] ([Intel XE#455])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-943-c44e29a7b62293355744fd857aad93cbf43e5126/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131151v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-dg2-oem2:       [SKIP][17] ([i915#2575]) -> [SKIP][18] ([i915#5274])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-943-c44e29a7b62293355744fd857aad93cbf43e5126/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131151v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_psr@psr-cursor-plane-move:
>     - bat-dg2-oem2:       [SKIP][19] ([Intel XE#1134]) -> [SKIP][20] ([Intel XE#929]) +2 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-943-c44e29a7b62293355744fd857aad93cbf43e5126/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131151v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
>     - bat-dg2-oem2:       [SKIP][21] ([Intel XE#1130]) -> [SKIP][22] ([Intel XE#288]) +22 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-943-c44e29a7b62293355744fd857aad93cbf43e5126/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131151v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - bat-dg2-oem2:       [SKIP][23] ([Intel XE#1130]) -> [SKIP][24] ([Intel XE#255])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-943-c44e29a7b62293355744fd857aad93cbf43e5126/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131151v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - bat-dg2-oem2:       [SKIP][25] ([Intel XE#1130]) -> [SKIP][26] ([Intel XE#977])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-943-c44e29a7b62293355744fd857aad93cbf43e5126/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131151v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - bat-dg2-oem2:       [SKIP][27] ([Intel XE#1130]) -> [SKIP][28] ([Intel XE#979]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-943-c44e29a7b62293355744fd857aad93cbf43e5126/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131151v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
> 
>   
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1132
>   [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
>   [Intel XE#1136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1136
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7765 -> IGT_7766
>   * Linux: xe-943-c44e29a7b62293355744fd857aad93cbf43e5126 -> xe-pw-131151v1
> 
>   IGT_7765: 67615901aedcc79d8d1523c6484c67c11ba0e316 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7766: 08cf1b2fa6b2f422f417ea74f41b12b93e91156f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-943-c44e29a7b62293355744fd857aad93cbf43e5126: c44e29a7b62293355744fd857aad93cbf43e5126
>   xe-pw-131151v1: 131151v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131151v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
