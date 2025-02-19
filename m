Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26A1C021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 17:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722F410E86E;
	Wed, 19 Feb 2025 17:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DJo/5Boc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60DC10E86E
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 17:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739987554; x=1771523554;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nl9BdKw2baKudBg9Y2FJgZGmmSr07ofP8TWFAl5qQgo=;
 b=DJo/5BocITrZudlixrFmRsTKvOHcLFLU7tLpkXMlLlY6sWZ20mNOSl7M
 yYNiboEYcaJr4se3m3s4XRH06Yhg8GJDAVcsEywKawwNkwLuad78JnIU+
 CL7U9Di7adq3jASI82/ycHBcXwG6Cru88CY+H0Y6wBFAdNiG2TFFeuz3K
 HJfXdWP4cNSsc9fXqnISKFTNNARG/okRtw57U/QKYjekOkbtPagIySYZS
 a4BZPymEc6DJpm+/00er1HzApQW7SX5e34fvagtoZ/rcYMtBVxmc7KsNs
 a16KHuw3PZK/U9fb+5WTBIGEEOLcOWobC9iazyHhj2UhTZP3NOKZCM2oR A==;
X-CSE-ConnectionGUID: Fg3WsiuYQmCiNbiig2UMGQ==
X-CSE-MsgGUID: lsPlLFD0QEWnjz1ikIoDzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40861848"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="40861848"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 09:52:28 -0800
X-CSE-ConnectionGUID: aSYwD0XTQla0tP8UGHtA3Q==
X-CSE-MsgGUID: 5MJ0/7iES4ejzu9XIY9bNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="119762223"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 09:46:09 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 19 Feb 2025 09:46:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Feb 2025 09:46:05 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 09:46:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnFdBUqHkaH8meRfFBT8+ux46r6RltH2WKzQlhCxtNL1XB6UT3q5QlBpLLYi3KhrU1DRbcs+z7v1GMJwDUFf2OhJZg6Bq3MaX84zv0hwHgee5Kmbvt9rTi6XjvCcaEUFvUAFL/FgjU2qN8PZNfkyWxQmSYL55WAowdlsM6kdhN3BhXu324h4mU5a4rinrFJ2n6pH2RgjHUZVK+KGN6BsARdUAVeBfKuF3q6mMfzcVQJt3lRL6xU5eJ566Cb0OCVyVJpDevUzLFIdR4ClwiRZGfkyF2QpN1YqZUGJKVig5cfJDRPiuN7bmU9RPHqqzEQbcpVVZTd1IdlQ8RADaU4eWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEX6X3f3/Hlb/V0nkCVUzsVQ11VEW0laZwVfEfWmFss=;
 b=koX53O5WEVTfvRJNYnM0erEA7PjpQst07QC+FUxOtmlRtIlQaHCgTeEULOSDHM7lISZ821hCiI1fhVekyt53AIdi3cLMJwDvIOEd64CmMyl+SuRoNl9xnpsUu/PjkCNPdHMi0giiL5c5tS0uMvaF6zG5LrZgzARE6F4wBXXc4dS62ScP5gBhE9/b2NCcek9Y4ZI62sV8d5C+a0Xeug7gtMRQvqrhORhaijrrZbaPL9KrVMWlGyv4cWaB+xJuiMIz822sQ1r0jw9XnO+wtoBv3ExgDj4lYv6lk24UhyaIFtOKoWoNi7PwVnuVNqqKwVLy9GD9TL/xB7mtxsCfzKRt5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7201.namprd11.prod.outlook.com (2603:10b6:610:143::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 17:46:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 17:46:02 +0000
Date: Wed, 19 Feb 2025 09:47:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <Thomas.Hellstrom@linux.intel.com>,
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page on vm_bind
Message-ID: <Z7YZGEgvzjY5mjN5@lstrano-desk.jf.intel.com>
References: <20250213022331.265424-1-oak.zeng@intel.com>
 <20250213022331.265424-2-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250213022331.265424-2-oak.zeng@intel.com>
X-ClientProxiedBy: MW4P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ccf75e-300f-45f2-f2f6-08dd510d4708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DXA4RW6M6dB8lOBRUhvNizh+6DgpuOoooqQXY2S76L6cEGwUmGYjdRnn+uNk?=
 =?us-ascii?Q?wlN7tkRNqXWvZfp5KdrrvLJJgMrD59LQH61fVCFbFzL+ZOctDmDW6ACt+UzX?=
 =?us-ascii?Q?vCUXyV3HDgZBwJcKHjMPvu9geHsvhSZ/MuPM7YZ9MomtRXqAnEVWckTeXorm?=
 =?us-ascii?Q?zkSL6E+DDGfCeLZ3B1GWIdh040FZ4DCxFE8suwUn/a44L4or9Rrdb4YGU7UC?=
 =?us-ascii?Q?3AKS9xUVzC9tjontOdRRF5r1gcWdm3zWZiKcUZb/IPRZCZY41l9oDX9gGVdS?=
 =?us-ascii?Q?QUyTjNtkcjp5eKDzxvP9zxFDF1Qrn95xuIYr3YQNl0fe3ouQZqObUJT15c2d?=
 =?us-ascii?Q?J7o8F5rSo8UdTW5PrkvqRSDN+uNv0HHC75KHpd29vAzllGyyJA9wYtektlGg?=
 =?us-ascii?Q?0mOYav+kC+K//iFsbU2CoWLzv4lldlHwac5S9uY6cyVwo3eB89QCMOAL/Fne?=
 =?us-ascii?Q?DcbyLr8mPV9NLk+v2AmyuvIjO3UOTFLRk5xOi/SNECYj1RrzlROYig/Dhzlf?=
 =?us-ascii?Q?jzUl4Hy2xK0XeMLBSh4BkhD3bXTfGn0Nb2u7DNiY2oXBof6TigG0ARyknqu5?=
 =?us-ascii?Q?/PYBybbRmRu2eNzkkZATLm1EwNvOoomu2WU9y77w9uo/z9AKkJPb527lPLgH?=
 =?us-ascii?Q?LPDlLJ2r/FJaNq/a398gVG0LK8B34X+0hyKFOmy64yVGk3JHKQQt2HxWyS7T?=
 =?us-ascii?Q?lB6HAJNq4xULGjy6tjTSxqBmifMnRQ1oAuTHGC5XV6A7ROeaN5lsEAO/6iuV?=
 =?us-ascii?Q?IbV95wlYWokeHpj9qvQYt8IQ7pgFEEpa3tZeOESFqm3mX2glC1bqjL65HIww?=
 =?us-ascii?Q?uEXylEqqFScGnhmYE5XO3n4+IwspTy/WXz1cdNOqtZjWwr//LvAb/aaq9zoa?=
 =?us-ascii?Q?LUzha93YvUSad/bHkAaNLmTLc+g+ZDuqk4IY8kb6e2gXfOpsPIPr79xe/OIC?=
 =?us-ascii?Q?t5bWWyRnuTay0ogmJt1eRs8fWiFjPoz4kwzZuJC2QenjAVThBQ722zJZku7b?=
 =?us-ascii?Q?LfGBQfvltcM1/FZSOSD+xCR6aJCYwfIuKqj+1qghwHLYwUxOdwKfqvWOXZ/T?=
 =?us-ascii?Q?6p8JLBXWMXbU3sCO6XawSgb4L4+OhXpfLec4NJlq+ommwA6iOOKdxZLz/TXL?=
 =?us-ascii?Q?9QB2jxoU6KgocWnqmwvvA12RQqlweyV1pOLbHaCxRH9M+sYNvmxMQ9ZVXeKa?=
 =?us-ascii?Q?P8tGC4OcVAtR0jNSwT+UT7MHA8rCSULhO7YTcMBhXZg+5Tax5aaoOLWiG8zO?=
 =?us-ascii?Q?rM2t1tTp/hAC9H0dCRoXdaitc0pKW41J5DZ08uBx63YQInTi97mpaZ35+gZI?=
 =?us-ascii?Q?Eo94kdbqTQF8YVdE1ncQqw8XUKUnpLxJITgsWyjnRtczv0+fEG6P8+ookq0i?=
 =?us-ascii?Q?SGxkoYP7IHjKdl5dF6IiI/SZ7Mca?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IwP/cK0CpLrTTkL+frQjRU3BkfSkshKfG5uOT7w4bUniyHvdoWvYCoTyRN79?=
 =?us-ascii?Q?qiMDGUHNwjNCg1MkhygP/ItUGYxo0AueytnPSICJkBczXAeCIVVCyvLd/iRu?=
 =?us-ascii?Q?YLfUd03sIJBIOEH+vXdsZpB7kCpEMTqP8kku8lyy2RhhuYKZvddDV6jpQXVB?=
 =?us-ascii?Q?alHerUa1a2bTusVW99D9pHmvenCd3680G1Zmd7juLWTPtCw38y9A94FVgDBn?=
 =?us-ascii?Q?Nh3bKVfohN/l4WWk6UTdlaUof+AWj589096FExrY60Xy7KkGM8ON3704T0Su?=
 =?us-ascii?Q?sPxN1VoIMjl0DirwI80BZ8E41sc2tuqWbpfB4BffHC+PZIHU71cAkNKFeB+g?=
 =?us-ascii?Q?m8MhTLNpA6Wd2vM3tTqOlwY9BDD2LgULLQ+8kjpWpytmjG+ETk/w76IaWwAZ?=
 =?us-ascii?Q?HHmIbkmfOImT3bOQbrLDCjwa2lWL9/rYsbWATKu1JIxCxvWuCJr+41O8cE1u?=
 =?us-ascii?Q?xcRPYtKOrLOjsKKgX2hNaqYvCYKV9SGWzyW82WvVacyneMbUB5uq5HkYDDlf?=
 =?us-ascii?Q?fo1eMp0dZVwVHubiwuvrmXzTbwA90ds5WF1NZu7IsopOOVSYRCYLca8R1lMX?=
 =?us-ascii?Q?0Te1zMi7xqJW+evzWlKNKFDyv5CkIs4yxABRsMSs6EYkRsQ3EhyzCJoKm7ki?=
 =?us-ascii?Q?KNiLjrodT8s21v3LDC3WS9mDQtcImMmtjkJibvu5SFSmDHr5vl9EeJ3ngLaD?=
 =?us-ascii?Q?9lxYfNueUUhFajq8LqIEXeYWLBux/WIKsP/Iy67y/zxXum3aM6OHeYDG9z26?=
 =?us-ascii?Q?eRKBoyO8ljhV7BSPkcAydhOoazxjENwIVlWXP9qR4QLlFzt9vG6fiJGDYiwk?=
 =?us-ascii?Q?BZ+yOyLyRjCiyNJb97ulrRMge4jvZHOb/AN8hITmMnmdjynnzncVRaifYsTY?=
 =?us-ascii?Q?EFeXK2+JW17Y4447i8T+7BzzMXz23pP5NK5omkcdxiNyejo4ikswWO9y3b3m?=
 =?us-ascii?Q?hdBnOOlEN2fsSea+YY9kGmBcmxGc9T39bcXSLYO3tabWDDF5KOWK/ekPCRUE?=
 =?us-ascii?Q?vuYHZ74YcTHR+CRd4P9u8gKwHfwM3TxG0/Xa6h2k9SndQq/HgSqGp/vnBrRZ?=
 =?us-ascii?Q?lJ1wkX0llhXecgIc1frLHvH+7t7VG0e0PjwfN0K4r/aW5JI2sizBn1R/nKVF?=
 =?us-ascii?Q?bFtGKhk49TIb37GeZIq3GTQXa4v31pLAUBRkqaWQXS0m2vTeTcdr49olU/hY?=
 =?us-ascii?Q?MrU3y9xR5uvebqXUJXWAPVbsYlXnrJJtAqX74645JZ00K/ySTjcaDllOlj5b?=
 =?us-ascii?Q?IkxowiIF1XSXk7+CZcV+pSUQhf8C50logdb81zjhOvdt4bxeHsrQ/kr5rQLZ?=
 =?us-ascii?Q?PMBmjeIP0+Eo0b1HA5N+iKD4P+S326jPVSRFGiIUawf4RUkODw1p9K6uapQU?=
 =?us-ascii?Q?A6lNv1j9HvgLpoTmTwgdTa7nUb/j8uPwLIht0i6+UO1DizKI/IgYTdJPW1Bw?=
 =?us-ascii?Q?2EUMBkPjLUMtXFQ2L2etqVU4rwz3vsFvoUH+27ON6X8wianoQ5zB9doh431K?=
 =?us-ascii?Q?z9ZH3jhd+zJcgjKOfTy5cxfhdK/7xyW4Y8JEfO7JQAWd2Vtq8iD71+/WLwHy?=
 =?us-ascii?Q?Q9XSjaobnEF2MdeAqhIiEco9BPf93q2PdutTNNmJfUlMDxVHpkffXAWJgG5x?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ccf75e-300f-45f2-f2f6-08dd510d4708
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 17:46:02.5819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rDIUK8WxYh+XizwdbmKivch54zhTJYbXEx2n2n15Mm18/ulhWYn/3zjylNKzbreRtuPY70rwwpo3icpjPvr7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7201
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

On Wed, Feb 12, 2025 at 09:23:30PM -0500, Oak Zeng wrote:
> When a vm runs under fault mode, if scratch page is enabled, we need
> to clear the scratch page mapping on vm_bind for the vm_bind address
> range. Under fault mode, we depend on recoverable page fault to
> establish mapping in page table. If scratch page is not cleared, GPU
> access of address won't cause page fault because it always hits the
> existing scratch page mapping.
> 
> When vm_bind with IMMEDIATE flag, there is no need of clearing as
> immediate bind can overwrite the scratch page mapping.
> 
> So far only is xe2 and xe3 products are allowed to enable scratch page
> under fault mode. On other platform we don't allow scratch page under
> fault mode, so no need of such clearing.
> 
> v2: Rework vm_bind pipeline to clear scratch page mapping. This is similar
> to a map operation, with the exception that PTEs are cleared instead of
> pointing to valid physical pages. (Matt, Thomas)
> 
> TLB invalidation is needed after clear scratch page mapping as larger
> scratch page mapping could be backed by physical page and cached in
> TLB. (Matt, Thomas)
> 
> v3: Fix the case of clearing huge pte (Thomas)
> 
> Improve commit message (Thomas)
> 
> v4: TLB invalidation on all LR cases, not only the clear on bind
> cases (Thomas)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c       | 53 ++++++++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_pt_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_vm.c       | 29 ++++++++++++++---
>  drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>  4 files changed, 70 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 1ddcc7e79a93..319769056893 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -268,6 +268,8 @@ struct xe_pt_stage_bind_walk {
>  	 * granularity.
>  	 */
>  	bool needs_64K;
> +	/* @clear_pt: clear page table entries during the bind walk */
> +	bool clear_pt;
>  	/**
>  	 * @vma: VMA being mapped
>  	 */
> @@ -415,6 +417,10 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
>  	if (xe_vma_is_null(xe_walk->vma))
>  		return true;
>  
> +	/* if we are clearing page table, no dma addresses*/
> +	if (xe_walk->clear_pt)
> +		return true;
> +
>  	/* Is the DMA address huge PTE size aligned? */
>  	size = next - addr;
>  	dma = addr - xe_walk->va_curs_start + xe_res_dma(xe_walk->curs);
> @@ -497,16 +503,19 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  
>  		XE_WARN_ON(xe_walk->va_curs_start != addr);
>  
> -		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> -						 xe_res_dma(curs) + xe_walk->dma_offset,
> -						 xe_walk->vma, pat_index, level);
> +		pte = vm->pt_ops->pte_encode_vma(is_null || xe_walk->clear_pt ?
> +				0 : xe_res_dma(curs) + xe_walk->dma_offset,
> +				xe_walk->vma, pat_index, level);
>  		pte |= xe_walk->default_pte;
>  
> +		if (xe_walk->clear_pt)
> +			pte = 0;

Is there a way to move this clear to later in the pipeline? e.g. At the
step which actually programs the page tables via a GPU job or the CPU? I
ask as I think our userptr code is broken for invalidations which could
hook into clearing to fix this. Also I think prefetch for SVM could also
make use of this too.

I believe for this use case this patch is correct though.

Matt

> +
>  		/*
>  		 * Set the XE_PTE_PS64 hint if possible, otherwise if
>  		 * this device *requires* 64K PTE size for VRAM, fail.
>  		 */
> -		if (level == 0 && !xe_parent->is_compact) {
> +		if (level == 0 && !xe_parent->is_compact && !xe_walk->clear_pt) {
>  			if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
>  				xe_walk->vma->gpuva.flags |= XE_VMA_PTE_64K;
>  				pte |= XE_PTE_PS64;
> @@ -519,7 +528,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  		if (unlikely(ret))
>  			return ret;
>  
> -		if (!is_null)
> +		if (!is_null && !xe_walk->clear_pt)
>  			xe_res_next(curs, next - addr);
>  		xe_walk->va_curs_start = next;
>  		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
> @@ -589,6 +598,7 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>   * @vma: The vma indicating the address range.
>   * @entries: Storage for the update entries used for connecting the tree to
>   * the main tree at commit time.
> + * @clear_pt: Clear the page table entries.
>   * @num_entries: On output contains the number of @entries used.
>   *
>   * This function builds a disconnected page-table tree for a given address
> @@ -602,7 +612,8 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>   */
>  static int
>  xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> -		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
> +		 struct xe_vm_pgtable_update *entries,
> +		 bool clear_pt, u32 *num_entries)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_bo *bo = xe_vma_bo(vma);
> @@ -622,10 +633,19 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		.vma = vma,
>  		.wupd.entries = entries,
>  		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem,
> +		.clear_pt = clear_pt,
>  	};
>  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>  	int ret;
>  
> +	if (clear_pt) {
> +		ret = xe_pt_walk_range(&pt->base, pt->level, xe_vma_start(vma),
> +				       xe_vma_end(vma), &xe_walk.base);
> +
> +		*num_entries = xe_walk.wupd.num_used_entries;
> +		return ret;
> +	}
> +
>  	/**
>  	 * Default atomic expectations for different allocation scenarios are as follows:
>  	 *
> @@ -981,12 +1001,14 @@ static void xe_pt_free_bind(struct xe_vm_pgtable_update *entries,
>  
>  static int
>  xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> -		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
> +		   struct xe_vm_pgtable_update *entries,
> +		   bool invalidate_on_bind, u32 *num_entries)
>  {
>  	int err;
>  
>  	*num_entries = 0;
> -	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
> +	err = xe_pt_stage_bind(tile, vma, entries, invalidate_on_bind,
> +			       num_entries);
>  	if (!err)
>  		xe_tile_assert(tile, *num_entries);
>  
> @@ -1661,6 +1683,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  		return err;
>  
>  	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
> +				 pt_update_ops->invalidate_on_bind,
>  				 &pt_op->num_entries);
>  	if (!err) {
>  		xe_tile_assert(tile, pt_op->num_entries <=
> @@ -1681,11 +1704,11 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  		 * If !rebind, and scratch enabled VMs, there is a chance the scratch
>  		 * PTE is already cached in the TLB so it needs to be invalidated.
>  		 * On !LR VMs this is done in the ring ops preceding a batch, but on
> -		 * non-faulting LR, in particular on user-space batch buffer chaining,
> -		 * it needs to be done here.
> +		 * LR, in particular on user-space batch buffer chaining, it needs to
> +		 * be done here.
>  		 */
>  		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> -		     xe_vm_in_preempt_fence_mode(vm)))
> +		     xe_vm_in_lr_mode(vm)))
>  			pt_update_ops->needs_invalidation = true;
>  		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
>  			/* We bump also if batch_invalidate_tlb is true */
> @@ -1759,9 +1782,13 @@ static int op_prepare(struct xe_vm *vm,
>  
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> -		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> +		if (!op->map.immediate && xe_vm_in_fault_mode(vm) &&
> +		    !op->map.invalidate_on_bind)
>  			break;
>  
> +		if (op->map.invalidate_on_bind)
> +			pt_update_ops->invalidate_on_bind = true;
> +
>  		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
>  		pt_update_ops->wait_vm_kernel = true;
>  		break;
> @@ -1871,6 +1898,8 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>  	}
>  	vma->tile_present |= BIT(tile->id);
>  	vma->tile_staged &= ~BIT(tile->id);
> +	if (pt_update_ops->invalidate_on_bind)
> +		vma->tile_invalidated |= BIT(tile->id);
>  	if (xe_vma_is_userptr(vma)) {
>  		lockdep_assert_held_read(&vm->userptr.notifier_lock);
>  		to_userptr_vma(vma)->userptr.initial_bind = true;
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> index 384cc04de719..3d0aa2a5102e 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -108,6 +108,8 @@ struct xe_vm_pgtable_update_ops {
>  	bool needs_userptr_lock;
>  	/** @needs_invalidation: Needs invalidation */
>  	bool needs_invalidation;
> +	/** @invalidate_on_bind: Invalidate the range before bind */
> +	bool invalidate_on_bind;
>  	/**
>  	 * @wait_vm_bookkeep: PT operations need to wait until VM is idle
>  	 * (bookkeep dma-resv slots are idle) and stage all future VM activity
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d664f2e418b2..813d893d9b63 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1921,6 +1921,23 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>  }
>  #endif
>  
> +static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
> +{
> +	if (!xe_vm_in_fault_mode(vm))
> +		return false;
> +
> +	if (!NEEDS_SCRATCH(vm->xe))
> +		return false;
> +
> +	if (!xe_vm_has_scratch(vm))
> +		return false;
> +
> +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> +		return false;
> +
> +	return true;
> +}
> +
>  /*
>   * Create operations list from IOCTL arguments, setup operations fields so parse
>   * and commit steps are decoupled from IOCTL arguments. This step can fail.
> @@ -1991,6 +2008,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>  			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
>  			op->map.pat_index = pat_index;
> +			op->map.invalidate_on_bind =
> +				__xe_vm_needs_clear_scratch_pages(vm, flags);
>  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>  			op->prefetch.region = prefetch_region;
>  		}
> @@ -2188,7 +2207,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  				return PTR_ERR(vma);
>  
>  			op->map.vma = vma;
> -			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
> +			if (op->map.immediate || !xe_vm_in_fault_mode(vm) ||
> +			    op->map.invalidate_on_bind)
>  				xe_vma_ops_incr_pt_update_ops(vops,
>  							      op->tile_mask);
>  			break;
> @@ -2416,9 +2436,10 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> -		err = vma_lock_and_validate(exec, op->map.vma,
> -					    !xe_vm_in_fault_mode(vm) ||
> -					    op->map.immediate);
> +		if (!op->map.invalidate_on_bind)
> +			err = vma_lock_and_validate(exec, op->map.vma,
> +						    !xe_vm_in_fault_mode(vm) ||
> +						    op->map.immediate);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 52467b9b5348..dace04f4ea5e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -297,6 +297,8 @@ struct xe_vma_op_map {
>  	bool is_null;
>  	/** @dumpable: whether BO is dumped on GPU hang */
>  	bool dumpable;
> +	/** @invalidate: invalidate the VMA before bind */
> +	bool invalidate_on_bind;
>  	/** @pat_index: The pat index to use for this operation. */
>  	u16 pat_index;
>  };
> -- 
> 2.26.3
> 
