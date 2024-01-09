Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB983C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 18:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4609A10E4CA;
	Tue,  9 Jan 2024 18:42:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED3810E4CA
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 18:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704825722; x=1736361722;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TKY2mv6O8wr2mLVUQPQJymGsCFqPRGXpkvkdCpU/vRE=;
 b=hngYpn/ga33HAwaOL47pCzfeIsdm7j4X5cWeMBlSkDQ1QLx3IjUaUzTi
 aIR8cZhAxghEi5gqJBNXjirQLAQCrYfN+tUlPqfcIh9SkxSXD0yNJyFJ7
 1XQVzw4zAp+VIEdJ/7u17DbZZ9tHk3n/KdVH6tyfRsIYAhhKHRtDrXgr2
 ojVxGqg6jDbgey48aX03NL6+y9yoQjPgPQL4WFvxquOeL3K8xWfLValv9
 /sPHvUYGtLrouWkf9HVdTLwkMJbPqlfKoKJiO+rGV5pw1qzCdnM4dv9fK
 Qlbr+c46t4CHFSxdDnQKV4qREbPqllmie8RELxMWz9UyReL5fthhg96S0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5040811"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="5040811"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 10:42:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="852285500"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="852285500"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 10:42:01 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 10:42:00 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 10:42:00 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 10:42:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8cE/lHNu8vaQeGpdc4PNG395gMtaiRnp/t/0EBCQLipvSUt0E0qKoxP6H7VYJXGAcaoLi2jJvz5v+7tHtASqKmSbLNqhlkZB9JbA6hETMxaf4o4qhnHi1aXO5R6IY/4axRgos4XnpuZfP/7rAcyLqCX8wl3AmFV5rKlnDuIZjEOED7K2K2NCcatrbXofDwmagqodm/nFmdG1h81rJ72bP2V0ATi+jnyhhk8vA5tvwAPGwEdnGsuAWea1F/hmszn1naPvguiCWd0ZA3Kp+AM0+55SHJmyW3o2AApNIHbB8Az1WxvpKNKvZfVmXSme8qcG/UeOvp86m6Cecu/1ArlTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7dQqqEaTkdsDWZWFq92l//YbR79KUxezpBCWA5XwJc=;
 b=ZnGt7QHNxsbx5gRTuhf/eHTibeBxFIuHyzQwSMhf+7GludSUVPQAh+/9oumcYiYiZ13Z/JtnDXQVdVMNiLbQdeeFcj+ZGyCkZrDnqSweke/159c4K9YneBY+jxpT9xGqDGNtCgwUWLZc2Ks6bH5be24zfPJPXKgygDPmYGlGHLZ7P+wmK56xsuYnJ393UDw5+vgg5O7gPVgsHam8N79wwe+Wqowmo0fYFEgz/ntETzDjiYNTF6SCRE0uozl9Tz8eULSw2G3r6Opk8fCLEhuMiRxSr9ZPZKhysyTBILy58HzCoKyS1GA39OP2m71K9oeTd3OdgQEo1YuI3k4+l+4cUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 18:41:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 18:41:58 +0000
Date: Tue, 9 Jan 2024 10:41:56 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 drm/xe/xe2_lpg: Add Wa_16018610683
Message-ID: <20240109184156.GJ1327160@mdroper-desk1.amr.corp.intel.com>
References: <20240109055550.679289-1-shekhar.chauhan@intel.com>
 <170478261491.196237.3722957046565899409@5338d5abeb45>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <170478261491.196237.3722957046565899409@5338d5abeb45>
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c144d75-a47f-43c0-761d-08dc1142a932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rancyxZMkA+R0nsj8QZkU9neJasX/MUjxIIPjUrE7P7sqyA0FEdaSA6QiBoBsk8RLzudsGMyDW4Mk86EH8BfYYYxxL9JjaflOVOfy4rxASsqY19LC/ynwoP+Rb9TTLg3/rO6cWcmnuABtgtAped0JATv6kjG8agaj2HU/rg2CTRYqjMXTR413wlUv2dQbmkAOaNwsWOqpi6WBgsT3QVb0enDCja3RjK2wu8xFapBtd3emYOLLFP7En7y3QBGJ9q33Sv9dBvFTULnsdF+v2iVjee45ErUluR7QFpYxPFKyp6qZKlUXk8bG+JY+C8KCyT1DYZL3KZxFHHemBBiU+r3EXyvAlIOoZPVV+0wyOWKssJTh9Z1JDA3OORVhgHIOZBbviIoUEJ4tDV7nAXKnbdmX0awpEK0ZRvdULbbmWwQmqi4qTGjxNXurjnDDCoL871y9+BluACYnHV1F9qgD0gHWsy9Tu+bRALumo9GP3FfjntY7lvGv2EynyZQbl3DB619LEBQhVUTxZvGaECQF4GpOZpZOYH8shY3PBM7v3DB1w0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(26005)(6512007)(6506007)(1076003)(107886003)(38100700002)(4326008)(8936002)(5660300002)(2906002)(6486002)(966005)(478600001)(6916009)(66476007)(66556008)(316002)(41300700001)(66946007)(86362001)(82960400001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kCGrwWLdBFXT6YUtWzrARUHcOfq1rI3Qjl3GLA3xKPH0QCzvKcnsFq3gVD5q?=
 =?us-ascii?Q?8v/wCPdOZBzJKobJnu2AREEXXeYUsT02bceo9Df9eCLjlUSXMnftHPFGPhE1?=
 =?us-ascii?Q?soYX4kf6ZVeo3mHDXxUnbrDubacaTUF3wn0kTdtsedDBTVX/YF/wh/8qEOyk?=
 =?us-ascii?Q?2gC7D1BZAmehpmZq9epX6MFEDu+GSgZi7uH73FMy15vQtu43H2ibbs+2DDWt?=
 =?us-ascii?Q?vRdy0soAt839uirEuq9uWDc/cgNoQ1XuPP4rpGyy+Sgj31UIzm9yCoE3U3aW?=
 =?us-ascii?Q?mFhHUidxXYYvtygkBUrFFDGqFms9SYDzk+/7Gdd9gl6OAd3xwF21aD9T8Gvc?=
 =?us-ascii?Q?RQtkIy+mqLYsw2oWT4xplMsk3Ilin5QbVyShjp9fxCkjWlJyaB7Ye9HlFTSz?=
 =?us-ascii?Q?QfFOrn1+gs2x1UXmvpB+tueZNrwPj8v8kOR8HWKum022sHY1+nZ97pMpXLe7?=
 =?us-ascii?Q?dZ2CWpaVI4frJUEzEOJuj854DO29K4L/+IQXPNaxaKp94/s3lsowhFxj2mTP?=
 =?us-ascii?Q?7X6S4ImNATKDuJcgmRl1svhZeIFBPoX2erz+VqScmd8SlYu89bfI8BY5pJUq?=
 =?us-ascii?Q?b9ThXzoTGL6epbXhlae/08iqqOJQlZEHgp6vZa63y5GIzGPizvumLCgZ5QC7?=
 =?us-ascii?Q?mi+uKrik5CsIvPNXqGAPhE3LVllMCy4A6vSwq3ISz9Jgf+aClurQKDSbdE87?=
 =?us-ascii?Q?J+MZfdHiPBNltP0JViESrVekQFe3qaPq0hYBaDg7X++d4UQyxTedkyNWA47B?=
 =?us-ascii?Q?n6m+Ua8ifKhMJkyrOH6gmucpbg6tKw73xKFt8nygsBtCvfBJHzDW+CpkBpMO?=
 =?us-ascii?Q?b/8GaYDS13Fj4ezeqMW/c3Xpyn3v/tnw8jeLGr2q7B9UpQjjp/vRm7n0ACV8?=
 =?us-ascii?Q?lBKlRhPUxJL9h54t6LdvcvBLOyLJyE4PPQ0hBa8ULrxfdVEbv4cIsrxzLocY?=
 =?us-ascii?Q?HrLw5AWZQ0S6RUibfJY35XsMl7SCZaPD/FeNXxKSdzTPJma/cCzy3Ftc3ox8?=
 =?us-ascii?Q?oQzAaGrlICWToGHJZCG2l9gNwqpHVj54oMWlwfQ+CdbavjspxT4kPhXgqP/A?=
 =?us-ascii?Q?EiMJveDMnieNSj2Hxbvt2yxoCysAorR3yKM3/5jTEZhJnImsZFuziCzd2SPr?=
 =?us-ascii?Q?stJllCDBdVixpVcnz/1LXeu0wtu34K6oOOtR+QI11AFhS2JQ0v3vv1s3RQhh?=
 =?us-ascii?Q?s1KTCdRQR4HDn+YC9BWHKbn5hZJH8WG6o6G8YlCIjpL1Eai23KSM1c+//I6g?=
 =?us-ascii?Q?bxpsM7W/YOkqg8bL1DI4eRRJPr+a+pcgDB3csaVO/wXTbaSyD3ebdHPGK1fI?=
 =?us-ascii?Q?/RMa6JFfhdPzPMgo+tVETxyYCp6pT2AnqR76scOQ5XM5qZi7g+6b9jLL27bP?=
 =?us-ascii?Q?13jxImvQezJfQri3qFOZmhR3b0bJTB9fAI7GqGZJF34yFAgMY0FPDTTPjs3i?=
 =?us-ascii?Q?erQbR6x0PwqjK1TUDEKJJyH4EUW7Vu4MUywj7UKVxdM0Ujw8n9NAuCGPQy4r?=
 =?us-ascii?Q?sM3CudpBxppqfwo1lWZko+M7na81jpdkHvmAh+6CjIGiDMzaOFYWZXmdmSsY?=
 =?us-ascii?Q?fENR/YfAU5YyLe/eU9KOWIXC+KY2ObQVLLOlY26d8UPlP8f1QRXg1fbrkX+c?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c144d75-a47f-43c0-761d-08dc1142a932
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 18:41:58.5210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thdC51oF2GOFvnI1GZ+myYDjGi2zqEhmEOdIM+xEjWXO/hK5ryMvHGH6JA6JnDLXw05oj/e/rDer/Gg2i2B2O4QdvrJhBUvSRy/8ykPIX7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
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

On Tue, Jan 09, 2024 at 06:43:34AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2_lpg: Add Wa_16018610683
> URL   : https://patchwork.freedesktop.org/series/128348/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-607-eacbcdb537a2774959d012206aba22848fdade26_BAT -> xe-pw-128348v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-128348v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-128348v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-128348v1_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
>     - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-607-eacbcdb537a2774959d012206aba22848fdade26/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128348v1/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

Same issue as https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/975
although on PVC instead of DG2 this time.  In general we've been having
occasional use-after-free type failures in preempt_rebind_work_func for
quite a while.

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-128348v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
>     - bat-adlp-7:         [PASS][3] -> [FAIL][4] ([Intel XE#692] / [Intel XE#773])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-607-eacbcdb537a2774959d012206aba22848fdade26/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128348v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
> 
>   
>   [Intel XE#692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/692
>   [Intel XE#773]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/773
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-607-eacbcdb537a2774959d012206aba22848fdade26 -> xe-pw-128348v1
> 
>   IGT_7663: b5eca7b97430309e320874594feaeaa8e770e25e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-607-eacbcdb537a2774959d012206aba22848fdade26: eacbcdb537a2774959d012206aba22848fdade26
>   xe-pw-128348v1: 128348v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128348v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
