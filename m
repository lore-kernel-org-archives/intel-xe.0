Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEB7C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 22:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08ABE10E7FC;
	Tue, 25 Feb 2025 22:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkbvJG3n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9441C10E7FC
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 22:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740521393; x=1772057393;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CXRFlopF1Oht5gkTsqJXxPvkulHImftDJlhu/1VuOrM=;
 b=OkbvJG3nU5aH33Z+YiUS5GxfBCRCLMgGQDTwtQzai0NOjMBfHKAqaaXH
 HsmcPy9tkm4PxHsDq7ipVIRVjzkzqbWldLKXG3AN2+CXTqWEyyiZWil/w
 Evt4E6kGydJ742vyvGNmYukhn5eeUBZrqkl79NSb7rBTWkQTSauchAmgL
 PA15AE6sMkywh060IJbH2o4wBzyNjaPr0qidKD91eYNpxfoZ+Ro0cGA6M
 zcGXu8tsDia4UoR+OxHuPCPNDvVfwFvpibG13rGipeyCEA5ELJ0f3zoT9
 ozvKgjNGFvPTx6E+1yCh4+W4iLqY/aV/rl2hadhtyJeyqRDKzfBodaXOD A==;
X-CSE-ConnectionGUID: 1ib+3hd8TwyUwvAFWkvGJg==
X-CSE-MsgGUID: IhW2v0ruQLCgPnMG0AQvxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="66725983"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="66725983"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 14:09:52 -0800
X-CSE-ConnectionGUID: wzLzZjmZQWuKPNshvectjg==
X-CSE-MsgGUID: Lj/DvgfjS+Sk4ZWtLJ8zCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="116709593"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 14:09:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 14:09:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 14:09:51 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 14:09:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9kDVUpDSr6yiIku4OqcffFdsZgX+frdxBq7QDPX56eO+byghPHKZxc7XoLAOXTOyix/ZN3itTSWOG9Dg1o45fL/eIIr+TzVPxeQ9HzwJEIAwJq9qHTfSGtci1iYs9JRw+ZaeSxrqQTv70cQP+90LXitP9P6e74kLIL7zICMklhQax/Pk9CmzsVwYJYa8K7hzpSjaCrhs2q6cfwX3PBxkuB9cmj6MqLyfqSeZJhY4yjuZUJH6Co/eUn6fcoXEEymmNmAn+YQe6iQM15U/i+hAdEWraGrkv1bxT2ywiQGt596PMQmOYc5z6kosTXscxD10m0yEDKPbntjuQU1mrbwFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMjkMkrMESXTduCJAFl23kFFxEZ52fjGiuH3wuVYo4o=;
 b=rD2Bw+9IWfuiC2nw/b3tN+p2D8sOemo9LmtACpxsl2/Cpr9lIAEMBDnToehid7LPjX0ZLoNvlZ6s6QoFtdY91RMofqyRy+fsa/qiZso+HS55+E7YOKa4Gx7klvE5W+LhqaqRhXl2n37gZeKjyswA/3c5eEdkdC9WZLvVAaRB6peZ3WyzQtbYSk9tIiqTAqqF38en8JOFGmjGXxeORCzR0kqEd2EneS8+omFQx2TpMHd8TK/wrEKWj938iPOQtAZHvOOJFLIUAPsrr/ElXaM7c+md/Ip4xGqM5TXsBm3HcywQABPDdBpTRgi9/XJunNe4N1NKj4qNaWuHLynv+IchKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7963.namprd11.prod.outlook.com (2603:10b6:510:246::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Tue, 25 Feb
 2025 22:09:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 22:09:48 +0000
Date: Tue, 25 Feb 2025 14:10:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <Thomas.Hellstrom@linux.intel.com>,
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
Message-ID: <Z74/7JpxfZf5LIQN@lstrano-desk.jf.intel.com>
References: <20250213022331.265424-1-oak.zeng@intel.com>
 <20250213022331.265424-3-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250213022331.265424-3-oak.zeng@intel.com>
X-ClientProxiedBy: MW4PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:303:8d::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: f5cdc064-27fd-410f-8ae1-08dd55e91e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DM3ZFOSZrGbj8U1QX9wNbISRXv88bS0kPa9zZGx8DS3qd5MQ3PPDQKarAmlP?=
 =?us-ascii?Q?B6OPCayhulE18COWjAQUX8vnfXiHs/ZZ68RYyOYgyTwgWcW9lxvhH8bnaHFh?=
 =?us-ascii?Q?d/kizCBbr0MmdzWPrmqZDlr/rJocf7WetYsJ5okBxxKY4NiJj56WZaiG6oIe?=
 =?us-ascii?Q?pq3LvQ60nw+iwMANcMNY5SZIsIqs8ZGrqm0OasAFJwoueA0QCkiKGoTXRzMM?=
 =?us-ascii?Q?pzMSmTlH8FU89xf1lVAlLee/kL5BPhYGkQp7lCP23V0wbQc2n2SYgF3rBqyZ?=
 =?us-ascii?Q?mAg4B/WxnJrO1Eby2X8C7ANfK8hnGFBhwU/4bJlgEs5AdJdAZ/auQexU1mzw?=
 =?us-ascii?Q?AcAx6DQaegWfdFK2yV9flBUaZ1LBoOMXFpThYih8Z//JkMchtj4f9XJq+n/W?=
 =?us-ascii?Q?A2ZzS9Ae81xGLgKEyIAPASgcEr7Y21E0fA+zw11C73yByOo4jc7ygBe6boaj?=
 =?us-ascii?Q?lB8BKHd/z+KjXvyhZafHMxOk/5YNkhvnTNkddbdn8WUcXhh7+XHyBhZPXcwT?=
 =?us-ascii?Q?UJY4lMiC/ViOEdZph10IKlccqkaF35QgmodUD4dO4SezL0ZbxJ59InBr7Ob1?=
 =?us-ascii?Q?FJ1Yh1MBGeE6If/NmhVCvVBRGDiCNsev9Ct6zIhG+LwrNIo/qv/S6893Q2di?=
 =?us-ascii?Q?WUTlU9lL7xJ6pb+cvd8ENVs4XRHmBQGSDv/U4mpnnVTK3c8HkyzCwZhTrgFW?=
 =?us-ascii?Q?3Uq9LEO/B2lSnD5k90r+Cwa19h1hSf7udLG0d/uQ+dK5xUZ15wWaJwhvZ41u?=
 =?us-ascii?Q?2tRwPudToi12EHqcTaCumBJIU2usqhqwyrMoOxzQedqdAogpGkEPO0a4UMeh?=
 =?us-ascii?Q?Wsp3xJocHz/a7OCWaQWucVix85Zm6mtuLX9LD5dq4zv5RNxfDFiAiJscurOl?=
 =?us-ascii?Q?T+QAEo2GOn307QrPnoPEirDC6HWTYcOWnu5iKpindw1PUqjWrgyxlzWhiaBl?=
 =?us-ascii?Q?evTtvX7a+I9FmFs9arV5Jqn6pTXmfJfhN2Jnz5LiKsgBNfHcGEiRjw4V1Dsd?=
 =?us-ascii?Q?5fNMqWxrSCn2Px7A7HdHq9tXgYeUJHTb9v4dbvnDRw6am+e8ryXAd0H9iJ6N?=
 =?us-ascii?Q?yUpGVGM6YegbqkZrzVCPR6V88B0sKntQ2YJ/0Ga8F/srmB8ZB+1TyhrAG0Cm?=
 =?us-ascii?Q?AJnDiGWhTQztgOt5pcthU+rBQ7YGDUQikGHQz212tX4xwMbdjW/nMGJzY83e?=
 =?us-ascii?Q?zKPcvoq8om9BT0U5SUl7YJOm78EV0mZJeCfGDEaAovZRyYldjcqWuRnx9p0y?=
 =?us-ascii?Q?F8T/sZK9CzzB+C4Z0ME+s+CchZG1QD3DUC+0eExKQ8uO0hIU4SJXU5oQ8S0/?=
 =?us-ascii?Q?MkmYaGHUL6e9wdCbomCW0NJ4nKdS0L5nEkQYervL3gq7bA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M/hs0bF/UTOx5vOnSRzi9PKkLnTbLTergauZM5I9gSvYybbspKuf6GFIAQSp?=
 =?us-ascii?Q?RIknkoJc0iwDqxDr8f3dE/5jvNlbohMnQ/mY5RkuN67D6XbTyrE7fXsjVQEj?=
 =?us-ascii?Q?q3ZQLug/M6R+SIziSmLnS+bLuDiwNl3YJFwXNXGRhL77sRTxyRVWznSn6vxr?=
 =?us-ascii?Q?Qmx6f7U7oLaEo0x8Gv17uIdTpau4gyA6aJzaQa4GijfCLW3J+Vp6L+Wd6Ts8?=
 =?us-ascii?Q?wlQrhC5xZEtlgasKpi4XMY9/ZVMrfm1U2UVUbsqn83bDJ+Pcq+xD/XW7Spju?=
 =?us-ascii?Q?A2uzhuos+ta1vvcXwDCUWZiAsoSoEO6MY4FftC4p2CaCcIMmrWeQ7G+zgDZu?=
 =?us-ascii?Q?Gq9Y1uq05kLoCHxnh/uV2+IsEaqHoF+C+tPt0EyNL/YIVr8S37IOWh7fW/aG?=
 =?us-ascii?Q?0TqzOZGjFW1Y5KrpY2MJ/epwNEMjHQhzoYN40t71rWBVc4IstUwhJ5/XGTYa?=
 =?us-ascii?Q?P/KloRATQY/MAlhZVq9rVrfF7/CpPU+OF/yiO/cuBdD95EiccCrnjzNbjf1h?=
 =?us-ascii?Q?ERJ+2QZA32CUmUCv4wxefuf02Q29kUAgd6tugaPboXi6vJoaHbtHKhIHaMRB?=
 =?us-ascii?Q?yak8TfMtefccs8jhrCmb6fS9ICCsK782JXXb7KnyZthdw1d1w2UfpPJCTPym?=
 =?us-ascii?Q?0DCcudUGvwiX8koQmZTs0XGjNibByCkpWRAxLiDBKz7uIV4xnxfaGu5VEM9X?=
 =?us-ascii?Q?8lZ0NRMdsQdBQUWXEoVLIvuMJc+eVYpEUEb9Inea20rw2oZeD2KPnrnZIBzP?=
 =?us-ascii?Q?7ASsclloMSTuY1sboD4m2znt6U8a+5dV13ltCnT3R2xjVWp3oR4+6qmrVEL8?=
 =?us-ascii?Q?J0U0qI+SHvRC3LSS5yyfQ5Acs8CuTSPJI5/HAtM9p+1W/VZ4Gp/fXG5nQk7m?=
 =?us-ascii?Q?Bw1ZgFYis10AHJ5bQkeccORiMVRQx0dJDyJhAzHUkxUgIEZRLRWvGSCxk3de?=
 =?us-ascii?Q?dPAUUPTo1mORG3h+9xIlxQh0oE7H8CXhiqohhsYQLILALZpH7+Qmrg9gn05m?=
 =?us-ascii?Q?9WzJHatseWsr138BTec+GiJIqLtJeC8hzELE23s4j+ouUENCA/RLjDaFMD+F?=
 =?us-ascii?Q?xSxpyh8b6JWblzVfiF7dIVIFvx5Sv5zsh2kcuqawih3WqlY+YaUiuEJ2PfvS?=
 =?us-ascii?Q?mqx2nRoOuqeEI5OY7IIiF6eWEB+tx5HF/kOhuMKdcwfxNljwd1o7z1Oe1V4e?=
 =?us-ascii?Q?xtfrpNUD6DW0uPvSqCvLxX8GkLo+ibcQASqmZnauVHc+X1wrYZLDJS7YpEMx?=
 =?us-ascii?Q?c0CJ/BhekZ9juPCKDe9KAkf2wzl4KgwpJNlFuS4/D/TyI3QUV6DGWLVF47xm?=
 =?us-ascii?Q?XB8leVNQ80+CrDsvtnq27+ocMgHseUq6TjOKlYWlKszLbgoXk1g8JzjrKfpI?=
 =?us-ascii?Q?f+UdoZQ+sthdPZqscKAwPCoOA8Q4hl9oqsBm1maOAAZ348FE1HuYNsU2XvSL?=
 =?us-ascii?Q?Znsxjmzba9e3z92utc5n1vg1n+6da6PAsGIlzlQO4u/ehzf8C2bSnqEC74vF?=
 =?us-ascii?Q?GBDT6R1d/6d6gTu8GgBQtsM5bPThV8srWWeGIsLWtf4EoPQCmZeR5im62igK?=
 =?us-ascii?Q?foQ6pidb68192O+bUt3jcme5atJecX3c7xqjNd8xnYeIhGrEGrOQav9iVXW7?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cdc064-27fd-410f-8ae1-08dd55e91e54
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 22:09:48.4177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wj1xXDHII3IpYTDFwbktVt+doT/oOm/E1cgYVJKzTlVigMBTdnR/PSGad/54TEQXMjIZlRFe0yCbxKH3wCkvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7963
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

On Wed, Feb 12, 2025 at 09:23:31PM -0500, Oak Zeng wrote:

I replied to the wrong versions... Please generate the patches with:

git format-patch -v<n>

Where <n> is the version number. This will help avoiding replying to the
wrong patch.

Copy / pasting my reply here...

> Normally scratch page is not allowed when a vm is operate under page
> fault mode, i.e., in the existing codes, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
> and DRM_XE_VM_CREATE_FLAG_FAULT_MODE are mutual exclusive. The reason
> is fault mode relies on recoverable page to work, while scratch page
> can mute recoverable page fault.
> 
> On xe2 and xe3, out of bound prefetch can cause page fault and further
> system hang because xekmd can't resolve such page fault. SYCL and OCL
> language runtime requires out of bound prefetch to be silently dropped
> without causing any functional problem, thus the existing behavior
> doesn't meet language runtime requirement.
> 
> At the same time, HW prefetching can cause page fault interrupt. Due to
> page fault interrupt overhead (i.e., need Guc and KMD involved to fix
> the page fault), HW prefetching can be slowed by many orders of magnitude.
> 
> Fix those problems by allowing scratch page under fault mode for xe2 and
> xe3. With scratch page in place, HW prefetching could always hit scratch
> page instead of causing interrupt.
> 
> A side effect is, scratch page could hide application program error.
> Application out of bound accesses are hided by scratch page mapping,
> instead of get reported to user.
>

I'd include the IGT information in the cover letter, not the patch.
 
> igt test: https://patchwork.freedesktop.org/series/144334/. Test result on
> BMG:
> 
> root@DUT1130BMGFRD:/home/szeng/dii-tools/igt-public/build/tests# ./xe_exec_fault_mode --run-subtest scratch-fault
> IGT-Version: 1.30-gde1a3cb42 (x86_64) (Linux: 6.13.0-xe x86_64)
> Using IGT_SRANDOM=1738684805 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: scratch-fault
> Subtest scratch-fault: SUCCESS (0.080s)
> 
> Without this series, the test result is:
> 
> root@DUT1130BMGFRD:/home/szeng/dii-tools/igt-public/build/tests# ./xe_exec_fault_mode --run-subtest scratch-fault
> IGT-Version: 1.30-gde1a3cb42 (x86_64) (Linux: 6.13.0-xe x86_64)
> Using IGT_SRANDOM=1738686046 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: scratch-fault
> (xe_exec_fault_mode:5047) CRITICAL: Test assertion failure function test_exec, file ../tests/intel/xe_exec_fault_mode.c:349:
> (xe_exec_fault_mode:5047) CRITICAL: Failed assertion: __xe_wait_ufence(fd, &exec_sync[i], 0xdeadbeefdeadbeefull, exec_queues[i % n_exec_queues], &timeout) == 0
> (xe_exec_fault_mode:5047) CRITICAL: Last errno: 62, Timer expired
> (xe_exec_fault_mode:5047) CRITICAL: error: -62 != 0
> Stack trace:
>   #0 ../lib/igt_core.c:2266 __igt_fail_assert()
>   #1 ../tests/intel/xe_exec_fault_mode.c:346 test_exec()
>   #2 ../tests/intel/xe_exec_fault_mode.c:537 __igt_unique____real_main407()
>   #3 ../tests/intel/xe_exec_fault_mode.c:407 main()
>   #4 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>   #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>   #6 [_start+0x2e]
> Subtest scratch-fault failed.
> 
> v2: Refine commit message (Thomas)
> 
> v3: Move the scratch page flag check to after scratch page wa (Thomas)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 813d893d9b63..c2dfd0ade403 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1766,7 +1766,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  		return -EINVAL;
>  
>  	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
> -			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
> +			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
> +			 !(NEEDS_SCRATCH(xe))))

Same comment as patch #1, I'd drop this macro.

Do we need a query uAPI so the UMD can test upon process open if the VM
supports scratch page + faults? Or should we just not restrict VM
scratch page + faults ever and have it choose based on platform
recommnedation?

Matt

>  		return -EINVAL;
>  
>  	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
> -- 
> 2.26.3
> 
