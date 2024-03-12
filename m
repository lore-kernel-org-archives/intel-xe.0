Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E722EC54E58
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 21:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9AA10ED2B;
	Tue, 12 Mar 2024 21:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ddo+6YsW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B148210ED58
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 21:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710280618; x=1741816618;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cwngTrhLDOSEBMf0gc+8/T/1PS6GY1y9PnAkCB0jew8=;
 b=ddo+6YsWLOhTSUUB1Nx2QWzyXUmbOVV8ptJyThX+5Wf9Q9UiM9084fWN
 gH0l8FwFXJbyqJShtkLk7YjBbhYIioUCJT0uMX1mYV3rlCV4IRW+qpI/I
 kiSoHrgem5oB6PNwzXv6vLKf5jCJFiZmFXiEotmuQKGV6PQgcAa4o8UTk
 vwzUPI7OZ9MJR/4NChVkNhIrv0yob+E/me9dpisy02gLzHi2FFJY3wzye
 NpY01Rg6dOY8ZI/0orENqHWwoF1tU6hEDHJEhD0+X25lsbCTBWrEGP13j
 Ycwld7JdO99pAh62ALYQdnNOUj4iXTdhNww5SiSLjg2Rf0wmDousjyQCW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22535725"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="22535725"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 14:56:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="42685198"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 14:56:56 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 14:56:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 14:56:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 14:56:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BoEVUd7vDUZ4YkJRO1pk5XxJD3fdNU1XAnGrWOE9PpKyHgaXg8pv0jSMaOMcROFbMwtgJZxKlGucBauiD5KQes6lB/c48CjIZvCZD72DKHFsM54zsbaI1QTcMqFDikQyi3bVDciKFN+xAqwFLpMBLmCT/mylvlM0JJO6gxG1bTikGHWdyho1fv922pvt52z4AHV533GQMK60gf8C0pIL6/enY0/xryopcTXOOyydzeJxX2IVj9u66rYoIQHlZmlqq6zDtnM4pGyWDhozDwXNRj3I9/RufvWHZYL0rLJ4jByiJquvIqXbL7mmZAddgvvG5cuGqeKIiWBzcWe+ozUnOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ydp1TUbQQwtbiZRTIclRiz/FWZEAYx45jFEaMbczsWc=;
 b=jVp/hX4hZOx3Oppd/Yv/ndH9noPqrDbV8F0PfekAMU3pM2qaUpR/M4XzJ258o+Y18EVkmfjTfREUWB/nBgNQ3pAPouPAacxzNoHDfEBynsfOhxg2QegoJX2+FA+navFnyFxp1s1v7F4fQ6MjD8CrnYjwanF7wFOk9NWjILFkMEp2a3V3yuH9yidvE7Z5Y4sHi4QX045rlKog/P6cW0+8DB4gN0exHQt2fEYzZFwo/Tv/OfsOnpKBx49bANAcqg2EiSv63q6WFOKwwmeoDhneV+J0D3YmZ8/aTcPcozI6UzGOE9foZzPobJhz3qQLM3TGnL4h7q5X1QdlJQf9Z4NhIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7459.namprd11.prod.outlook.com (2603:10b6:8:144::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.15; Tue, 12 Mar
 2024 21:56:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7386.016; Tue, 12 Mar 2024
 21:56:53 +0000
Date: Tue, 12 Mar 2024 14:56:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVA==?= =?utf-8?Q?=3A?= success for xe: Add
 IP versions to GT query
Message-ID: <20240312215650.GA2837363@mdroper-desk1.amr.corp.intel.com>
References: <20240312211229.2871288-3-matthew.d.roper@intel.com>
 <171028033174.714564.4117168724636150254@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171028033174.714564.4117168724636150254@8e613ede5ea5>
X-ClientProxiedBy: BYAPR11CA0066.namprd11.prod.outlook.com
 (2603:10b6:a03:80::43) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 87eeec97-97ff-472c-909f-08dc42df53c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ikKQfXF97lL0fL0M1kLOKtm2o9s8AgJeelKU0OJcU0teYsE7TBGCYw0pEdsvmYrKa0Y5MYbSmm5sKDtlTHlvf3KS+ojXDfxaqTSVAMRv61G2Vi5VsG0swBIzeizEt18wUvQYXBGUOnStYMXXLhsYB54JLb/k9WUGl6cYfa2GAedR47FpjZLMgKT6FinclkMY07dVp8De7E8+y/yFlmIU704LsayyeC91tzLtSAmMcw1//xF9XMqCjX0HXveZhXdKZYp4vUyNcAug2oubBjw9nGX3/VniOIejM27s5wasMGRUCYfbkybIqjg9FLfxndH2ukazyCGdVrCcg3QJ+kmSkriP+EDEAcK/nM1DJI2t9DXHqdq3KuK55ppqGpSEUSVfo0ROF5aO0MNBVqzq6mQ/tq7xlFMH9osCVpu7lsnivchQFZjQw+qqVY6FxVdnBRXK+LAdc7LyMF39y9+iLMEFUaWOH655N/tuHbKh2PT6P8+6VCALjSte+ZtCvfGhcdi3gx3OjIAaJurvoSUDxTb9mKncJa9qav4+gGxvCdaD8eIncbItuVMsGd+hUXx18lpMQEQFckl7lgXdkcL4F3vjYCMzsrkqjsZnw0O6KDkdtiE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9pzU2RxXLM++4qVQ0SzPTWKcM2jSNKJz6dEwsVRpRPxY/XxGqF82uE0Oe/Z5?=
 =?us-ascii?Q?smrPDQBsiCzzyslZ8XxtUH67m/Dfqn7U99DNjVWN3v4DlPI7e5b6xaKSQfwZ?=
 =?us-ascii?Q?gd4hIyRKCZg+MafLoZ/1Vy5iE76VZYpASs0cpvZP0Pefka3ZgeqGe2KiImqm?=
 =?us-ascii?Q?0jutANHZ500Ze+26pBKEEobxIUFdYBPzO2QnNEkKSuQG5pn+IAX4voUQ3Pfd?=
 =?us-ascii?Q?n/xjWFsg4zx4RMVdSWPWYfdUqRonND9Bd4swGj/ZaZk//tS7/LvyINmiQomK?=
 =?us-ascii?Q?rPggU32WCtvnPzeDyJZ78eDdTCnznjPUMjuepf0CsekPaUUg/loo0LZVurqS?=
 =?us-ascii?Q?8sNHC8kFwvwwHzgb7ccdR5kq7ugA7qpchjv9tJ/VP4nfeiTh1Wpom6YBN9Kp?=
 =?us-ascii?Q?YFnty4FRaad8brlI73ZX5FN3BEm/W1H04GS3rxXxEmCtQHAwv3tCnL2EdyyH?=
 =?us-ascii?Q?nF8vCza6eA4uYdV0WXVO95HZAE3bXexFhbGq/HjuH/NQxPJ57Dp5YdG63YID?=
 =?us-ascii?Q?stoaxtVtP8+V6DZgRXCiqpkDs/8btru4SUpIFSxIPQHf1DY9MIu/BKgpEXbG?=
 =?us-ascii?Q?Q74XnfybhXDJXbPFhEz5kcKKwnlCfUNxSJ454d2WVG+ScJGt+dEo5XuiE/o2?=
 =?us-ascii?Q?ig1CivoeSfryekPRr0l2C+G7ECleqQcps9z6LqhTJ+PfyyG1KkLN90Bf6e4u?=
 =?us-ascii?Q?Ow72+1lHsZWGvcK7cQ7Qug0o4ZMyYnpMcvObwRkvOXLG3En/gQf8NLvk7EwA?=
 =?us-ascii?Q?xwXRwFzbWmqcpwjVW6FMz27fa3HneB8BQr8EiqJmIyci+mKFLZnB8kyCFVwz?=
 =?us-ascii?Q?yxnueulMhyRzUZAuW8Rz0Ea3o2/4qBsuVdgUXWvHLIN8B6bg7GjQICsjOOrE?=
 =?us-ascii?Q?EknqFZY/Yra10421vRhT34J4uNJKoBTE421anRaBAcs5MJqotYWx2o3nJeqG?=
 =?us-ascii?Q?Qb9vyatxhgeU01hvNIAH0ZhfeoLwabJPPxMTc5vub6LTJuAOk4y//vev/9/x?=
 =?us-ascii?Q?Fdk0jk2trBssoV68o0FKJK7lxvAvrBf+HgvJ+/hmKPSn1cFylM0IBVnmOfoE?=
 =?us-ascii?Q?X0LkbiwQMWy6Fc60aL27qQw97wS6PD9RMcv2CI3Fyv1WvKng39eg+aUQSdOf?=
 =?us-ascii?Q?GOf2Nuy5uxxTFTdM0gjHg8NKYPZfi+lkZx+5LN2uQ1zEHNgi4WzNJJ7HLscC?=
 =?us-ascii?Q?MfL0dtCRMPqnw0Q78ENzK8b9DSFlfmHeIyRHzxab2+CrH0yPiVbFiMvCnegf?=
 =?us-ascii?Q?uE6BbfGQx/bxOAVtiJBarhz7MWqKLLLs3WmoN0741GehqDwBX6+XGbA7z5LA?=
 =?us-ascii?Q?AcNPY4dtt4XHQKnXc0pOPeK1Fq+dTmpiu1ZXM0emAW+nh0d5zQImlEsOiFoW?=
 =?us-ascii?Q?nR8Uxr9jgWQnrpuIeeFQzqd3uYjhDCrhcjS9U3dpBSL7huy75rq9ErNcwJEA?=
 =?us-ascii?Q?eH0WVZOmN3Wo5p89YHfWjOy3x6OE4wpIzq4pUPHnraCzYh2WmwG9vYvvKnQX?=
 =?us-ascii?Q?46pcTNN/Kt8CWxUGnz7RTdPqRRa/p3kTq4xfOBELS7GDYHoEehfk5GmmYZ8e?=
 =?us-ascii?Q?Vdt1eauxJzOZsw+03v1jsAXc18e+CV80ue7kFd2niLl/WGI04x5PFnUsQTao?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87eeec97-97ff-472c-909f-08dc42df53c6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 21:56:53.1794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSI/K6k1fxs20uu5zjD3GNdHsKmf+XWMgRjUXDNH9BmZ2KMRVFlo15V+8IUgaamY6e/QrVTad2z5C8ErGbPnVUmrlda3rmwe3VOCJysNuyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7459
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

On Tue, Mar 12, 2024 at 09:52:11PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: xe: Add IP versions to GT query
> URL   : https://patchwork.freedesktop.org/series/131047/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d_BAT -> xe-pw-131047v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Lucas for the review and Jose for
writing the Mesa code.


Matt

> 
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
>   Here are the changes found in xe-pw-131047v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-dg2-oem2:       [SKIP][1] ([Intel XE#1136]) -> [PASS][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131047v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@kms_addfb_basic@bad-pitch-128:
>     - bat-dg2-oem2:       [SKIP][3] ([i915#2575]) -> [PASS][4] +49 other tests pass
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131047v1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-dg2-oem2:       [SKIP][5] ([Intel XE#1134]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131047v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@xe_intel_bb@create-in-region:
>     - bat-dg2-oem2:       [SKIP][7] ([Intel XE#1130]) -> [PASS][8] +155 other tests pass
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131047v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
> 
>   * igt@xe_module_load@load:
>     - bat-dg2-oem2:       [FAIL][9] ([Intel XE#1132]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@xe_module_load@load.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131047v1/bat-dg2-oem2/igt@xe_module_load@load.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-dg2-oem2:       [SKIP][11] ([i915#2575]) -> [SKIP][12] ([Intel XE#623])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131047v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-dg2-oem2:       [SKIP][13] ([Intel XE#1134]) -> [SKIP][14] ([Intel XE#455])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131047v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-dg2-oem2:       [SKIP][15] ([i915#2575]) -> [SKIP][16] ([i915#5274])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131047v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - bat-dg2-oem2:       [SKIP][17] ([i915#2575]) -> [SKIP][18] ([Intel XE#417])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_hdmi_inject@inject-audio.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131047v1/bat-dg2-oem2/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_psr@psr-cursor-plane-move:
>     - bat-dg2-oem2:       [SKIP][19] ([Intel XE#1134]) -> [SKIP][20] ([Intel XE#929]) +2 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131047v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
>     - bat-dg2-oem2:       [SKIP][21] ([Intel XE#1130]) -> [SKIP][22] ([Intel XE#288]) +22 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131047v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - bat-dg2-oem2:       [SKIP][23] ([Intel XE#1130]) -> [SKIP][24] ([Intel XE#255])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131047v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - bat-dg2-oem2:       [SKIP][25] ([Intel XE#1130]) -> [SKIP][26] ([Intel XE#977])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131047v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - bat-dg2-oem2:       [SKIP][27] ([Intel XE#1130]) -> [SKIP][28] ([Intel XE#979]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131047v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
> 
>   
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1132
>   [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
>   [Intel XE#1136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1136
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
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
>   * Linux: xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d -> xe-pw-131047v1
> 
>   IGT_7756: 7756
>   xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d: 1dfbf3ced62236dd318c701e3f21f5a33c226d0d
>   xe-pw-131047v1: 131047v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131047v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
