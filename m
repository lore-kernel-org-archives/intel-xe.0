Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C43CCD1BF
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 01:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416D589117;
	Wed, 29 Oct 2025 01:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gxoSjmXA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01F589117
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 01:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761702528; x=1793238528;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ay4Pu8+gkK/9JfchdFwpleZwUT6EjISjw4qMGnjG/W0=;
 b=gxoSjmXAYgS0g0TPRo/sDhElzQRcEGunTBuevMeU+3puD3WDJjKSdDay
 otjQHqVA4ZX4Wfui8IpEQzoU7mSiPjjYM1ECzdbxRCjRx9uqenZKyRGgS
 QZk76qx/Yj+O7utrNTK8qXID1XRyvd2Gl/xTfeyTUDyKNeKqxg0YZiBdW
 8jzwmuVIeMpHGgiS2eyysgn3faeDAmtMvMmr0Dx71iv1yvPK7FqVj+tC/
 /QUZpdhP5lfWhyxfSvnl3EiHPuO2fk5WwGSECQJPfiuVqh1+duepbeLq1
 AAeMASoBDxtc3JSDHet6HND7tMsvDCJXQShLzi6GJejfF3l+CwvFFC0vB w==;
X-CSE-ConnectionGUID: T7LnW8fbQaeg0d+Bqeg1+g==
X-CSE-MsgGUID: VXUkRFn5QaClXhq3hldvEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63963542"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="63963542"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 18:48:47 -0700
X-CSE-ConnectionGUID: vRHLwHKRSDOcmvZ0mhWwSA==
X-CSE-MsgGUID: tnIhGzXITLqCHrGz2P08Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="185434895"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 18:48:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 18:48:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 18:48:47 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 18:48:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iu2Wb8hpLXVGgbtY3bO57J/kAGtunjfMtJhFPKBRWs7Fg2adUVEJH5kbAjnZGR6b1wpuZENLDzeJuuivtBlCcJV25bvpPr7xG2TAUdBVa8DSqEQ3OSr3QqQ/Zp+1BBsqP1nO9NfH5ep8BDR7tI1TS9xM7vIJfIpGjuP7qOZPAiXCmdD95I4IxaXDYOa35YkOIpURST+6xsFGSQqHxt7DsJYUEaLuDNyZVWTpcJPuE+hOTV/3InXlo26tCrAnYCsNV47UtYa7E0/H2qIxsxTfzLzxt581kqREzP3Cteej8YwJg19QlXxiAvGMnKojOEdjOCYblUrvE87TVQQ4KV6Ajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IalcBHU9KYhmihudbiYGGvX+WsuAeqMq0EO836Dwrg=;
 b=dUl/UqFpxIN6O52PlHVgvtDz+126EF+2lB2HapKk1JWpJBGuJRpcz0EKfTt5eINZ8WHgfiC0glxbV/qKoXb+C0qjm5k9QJiBjN4NJCiOXiAor874gXnOTdmRX45URUNPny788l9+60rZbWplm9eC2l83xEdOXJAAM+uRww20vUQZawUyB/BPhDVtPxFaJdryMd3wLq2TxruZSXlHqYhy7/eYidgqWobwz0M3sHQqu/B1EE2r8zw+120CsVO3CPqmIVTl11wkedx+92rNhJ9q6wt+L9luZpOkIJ4Vqk66sY1FlTcCMRXnHmYqsUwxuWnMOe95uNx01mi9JI5SO4clVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPFA4B6D88E3.namprd11.prod.outlook.com (2603:10b6:f:fc00::f41)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Wed, 29 Oct
 2025 01:48:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 01:48:40 +0000
Date: Tue, 28 Oct 2025 18:48:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH v3] drm/xe: Limit number of jobs per exec queue
Message-ID: <aQFydjpLuLfOa992@lstrano-desk.jf.intel.com>
References: <20251022181036.2868787-2-shuicheng.lin@intel.com>
 <20251027202118.3339905-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251027202118.3339905-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: SJ0PR05CA0208.namprd05.prod.outlook.com
 (2603:10b6:a03:330::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPFA4B6D88E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 10db2fd7-9a20-4ca3-d3b1-08de168d48af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NCDgEQqT17F1ocMmx3Xy8g67hlCvYCbPa1sntu6J6RiiE2Gvx9dHvbxkRFED?=
 =?us-ascii?Q?a+NGZc1Chz50ZKjYqv7awtJeACsvHQouYtnCEv5jprDi7eE5VI8CzdsXCFzT?=
 =?us-ascii?Q?hs/IvSQeTXyFdv8sOSOrB3K7zQR5SIzFvWvKVHBcY8W5LzLM0adS1nLGtFiD?=
 =?us-ascii?Q?EFvtyA6SFyI3sjbTvibD8LCcIYGqfL5cbnOVSA67uCtpgDK2SnlOBh32gSLN?=
 =?us-ascii?Q?Avt0+PuBbH/SMlqUKbdJKGdtObByyMw6EqIPLF5RlS8YasuFKggARhGQ8wT6?=
 =?us-ascii?Q?BMs5/WKkXkdk/WdDsIZ6av3pcK9SHlTjBvdVEb1wJ7jO15bWY6/hRgUjEkFZ?=
 =?us-ascii?Q?fHaXcVIp+zg4sQ08AeR/gsAb8K548Kr5uAqzWgBw6peoUO1ULFjBtb4sAvN2?=
 =?us-ascii?Q?sm0v9nx4nxGoZcOQFWqXGL/76hpIg4+nLL053HRObALyicxTcD8+UYpMXwNN?=
 =?us-ascii?Q?2YOtqs61QLiKKV5wIMLHGHO8ORK51kQnyo8G1bnFNVSrDoB8sR9hIORSR7E3?=
 =?us-ascii?Q?4uSd/Fm4hIg/52WYUesDD1BiXbThPyE0rn5xgJ/jW5nN+Oh3mkSgsM28FwN4?=
 =?us-ascii?Q?oiXBhmh9EiCJjDDyHcWpg9uAKouw+8G7OO6KDj7nqR6poYL4uFv7PEUCDIaR?=
 =?us-ascii?Q?O0mMxL5Ti9WgCcqFH8AkRPP0lfCWtRHNyujhluX54/LDJUce8r/ZxSrJSJWf?=
 =?us-ascii?Q?eFoD72k4iCcWYXAVo+vufiK5aqcvW3j39yfw/Hw7oqAhsjrZ2Qgfb1iB0YPD?=
 =?us-ascii?Q?NXrjcJVOK92XceOfKvkX3hO9N+AAN8L+htrnYbF1X/7d8jzmMIAkxhlcuFB3?=
 =?us-ascii?Q?EGVweOjo1W4cpyeVVqDgFE7QNFfj+7qyYToXmiN3bYzn88edXtWOHkI6kI5Z?=
 =?us-ascii?Q?osDyVO87npouR/LZH4FQbD69OsjxKqbFq23uSzXc4LguJLITUEST3o6BvzVy?=
 =?us-ascii?Q?5TbcuVoR34TCuS0KgK/GjuctimCTlnKlo9yjqWZ4LFU5Oh+SCSMVa089vO1u?=
 =?us-ascii?Q?AJN1S9Tb160hVRccTJ6gzC77LsEiblIqrgeLNU0sHCmIj/E2iDEZExlKLzrA?=
 =?us-ascii?Q?ymismN6IBNf71GIzYhb7VACC3FjcZzBzrqqMdqoicBmRoKX7PfJFq0PZIuit?=
 =?us-ascii?Q?O5QRiEXNdQPQi+1W7mJF+KEeQ13qAMy5Y85BdVA8EI2KXtYxQriPaiLQG5Oj?=
 =?us-ascii?Q?lNpftwCaHhVKKZwbij4SOwMF6RwNBGx0NFU9H5OCjdUJuCL8M4t9TnKm2GJU?=
 =?us-ascii?Q?sq/0ByFRqv26QzWFhcnH+MxDH0j2fThHKEZp6AQxhmVlIwjSS8lcC2alIv17?=
 =?us-ascii?Q?OR7VdR6eiW1p7fVpf9b6voTL3fB4TP0aYBGcPH1vLnByNZ1F7YvmS7dxPKhw?=
 =?us-ascii?Q?yfussvWHL1Ks7Ox/kZJDCCAIDXqcWU32ObFFGen+tdOdjm8qv2vjD+4xlLx7?=
 =?us-ascii?Q?X+kycH9m+N2aGr2nFov5fMV39h6QRJN3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?74pQAmqTnPtqhVSffp9IQ9t1zwc3HrqFjHP3BRQ2Ur5Rs1lKgTH1oUJL6Mlh?=
 =?us-ascii?Q?Ad0a9gLJBtwxB4dXYMEWRRr5HUlfV2tKawe1dHqESGxg8rz6pg/G7VHriytg?=
 =?us-ascii?Q?i1erFotyKl9fCdSeT4dbR+1vIbXaRlCkgbg8FG7jA3Cxbu1SXZ5a1a4DlcaB?=
 =?us-ascii?Q?rfnrp6nCcnvmi1ay/wWileJYBtJRSh4Wp6KHtmL0nAkhzhVPxtj8igZjWvyL?=
 =?us-ascii?Q?0xQbFlUGpcrEjZOc70XQo2p/ZL26iprBosyKZ+BCdF0aW0yPQfY4Cno8u+KU?=
 =?us-ascii?Q?1BvRpL2Hfp+rPk8aYQ/7K+PPK7xZdwWnRCmWOCcRhUddW80u/2Sei5+ilipO?=
 =?us-ascii?Q?nyQdegfJj3VuwWXcodJ3yOBbh84gmlfwU+SkFP+pCkfI1j79wAYOiDMmIC7f?=
 =?us-ascii?Q?MgQmOdS3X7pwTWnwK9WfdvgrNwhlczaYi8e7E42yv7x6auElLS3Q3R6x5uB8?=
 =?us-ascii?Q?510OEo20GQB5X95f5bTa0nfiDYPTEh1Cn0Ex4HeKzkObTCAGV+HuobFiscgI?=
 =?us-ascii?Q?skpNCwLzU4xS9cv3M56vSwMmbJj1mZgwnNUtIFijetp3JA7zA7oRxvhCWlpg?=
 =?us-ascii?Q?ICWl7qm9pfKZOZseGx5ANHKroAtBpiCE1h5CBYlmfIofX3p+rz68Wi5gboD9?=
 =?us-ascii?Q?bQxdjrxeP+zgIqCXxNDAMvDn7SKEs1Avdbftyco1leK4+zVwKZgaS0J6JUIt?=
 =?us-ascii?Q?3b0nTvWF0E3q92M/Uq9U1XYEeNW3B6I78g+4zVSR82E3d8D5XoNRjttIR6KS?=
 =?us-ascii?Q?Fit4Z73lsJ/GguHK6LiX4cWmty68PtIMYmfDIoax/L36zpCovR4sOTuIGGYK?=
 =?us-ascii?Q?Nz51Qu3t14uLgsWjUQaP7sdYU5H3cp7sJd31tXpV3AhrUvzZNaRIf9z1ze61?=
 =?us-ascii?Q?kgGK96C9iTP8AXpivo96+T5vcHzSEaMY9z3M1yGuiIixeLdTs+ZMl2/e02AP?=
 =?us-ascii?Q?ZLFevXYgANNYTDaSJE/2kd/o+0Y52EeOITfm849VhF+VcFLdP+eY3Rntr+zs?=
 =?us-ascii?Q?qA8HBD9eTUkod+Yxfngi0FAdIb7RVu3uTOSFLuI2fmOAF4Lv+ewo0xFX6fil?=
 =?us-ascii?Q?m3JNFhY7MxbtjXXk4BXmmecy3yDkqCTtyxVO3UW4rJlBAbsvrTdHzcwW8b29?=
 =?us-ascii?Q?oN8EJCOayX0OuWeArQA9y0+oMH/bBVbI9n+pTGseTpkdyegEp4NmJmSsrh0W?=
 =?us-ascii?Q?l0SSTuV3IjW0ROp+tBEjRutyYMqkZlgmhTK3wON5CESZzx7/TQ49SuMUnn7S?=
 =?us-ascii?Q?M0Tx/3XCbPGdiFBQbvnEVTiIuvvuO2CIWGOv2fLHmprSCZ3Qc4+DBSSWEGgj?=
 =?us-ascii?Q?/PlsBRvaFtMwGvT9G2UAK0YoxjimwhtLrDSN1FX5HTZEnuF+FHG7goX5lAS6?=
 =?us-ascii?Q?ZDq+UXmomoPMthAzs5adyF7+H2H0rZpzhKGAKsWQDy8746J0QRzriJsEWIr/?=
 =?us-ascii?Q?zvRITsAyJeIy0f50s7MptW3ZNv+t2MtZYmnHU63L0GR88OcwU+yS3I9Zibgb?=
 =?us-ascii?Q?/B/1Ssx6JWmwLYvMb6YMYZfXb8hRYKVYZm7CDlXiTXAQeLDGDPwKLtZy1OZX?=
 =?us-ascii?Q?4bHy2mVTBA3hFBd2/WwuwogptP2z9LMK9utV2vkYzQavOVGxFieQz3g0QJCj?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10db2fd7-9a20-4ca3-d3b1-08de168d48af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 01:48:40.1039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcM2tdyaZ/gsNBaBvoyqVS3wGdGTHJsJi6mf4wH6czMi0XrIaz9yJTzIiqxC4gGbTIE9PH7aRyani8eEPcgPyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA4B6D88E3
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

On Mon, Oct 27, 2025 at 08:21:19PM +0000, Shuicheng Lin wrote:
> Add a limit to the number of jobs that can be queued in a single
> exec queue to avoid potential resource exhaustion.
> 
> A new field `job_cnt` is introduced in `struct xe_exec_queue` to
> track the number of active DRM jobs, along with a maximum limit
> `XE_MAX_JOB_COUNT_PER_EXEC_QUEUE` set to 1000.
> 
> If the job count exceeds this threshold, `xe_exec_ioctl()` now
> returns `-EAGAIN` to signal that the caller should retry later.
> 
> A trace event is added to track when the limit is reached:
> "xe_exec_queue_reach_max_job_count: dev=0000:03:00.0, job count
> exceeded the maximum limit (1000) per exec queue. engine_class=0x3,
> logical_mask=0x1, guc_id=2"
> 
> v3: add assert in xe_exec_queue_destroy that q->job_cnt is zero. (Matt)
> v2 (Matt):
>  - add log to trace the limit is hit.
>  - Change max count from 0x1000 to 1000.
>  - Use atomic_t for job_cnt.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Pushed to drm-xe-next.

Matt

> ---
>  drivers/gpu/drm/xe/xe_exec.c             |  7 +++++++
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  2 ++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  5 +++++
>  drivers/gpu/drm/xe/xe_sched_job.c        |  2 ++
>  drivers/gpu/drm/xe/xe_trace.h            | 23 +++++++++++++++++++++++
>  5 files changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 521467d976f7..f4d79b4b9396 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -21,6 +21,7 @@
>  #include "xe_sched_job.h"
>  #include "xe_sync.h"
>  #include "xe_svm.h"
> +#include "xe_trace.h"
>  #include "xe_vm.h"
>  
>  /**
> @@ -154,6 +155,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		goto err_exec_queue;
>  	}
>  
> +	if (atomic_read(&q->job_cnt) >= XE_MAX_JOB_COUNT_PER_EXEC_QUEUE) {
> +		trace_xe_exec_queue_reach_max_job_count(q, XE_MAX_JOB_COUNT_PER_EXEC_QUEUE);
> +		err = -EAGAIN;
> +		goto err_exec_queue;
> +	}
> +
>  	if (args->num_syncs) {
>  		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
>  		if (!syncs) {
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 90cbc95f8e2e..1b57d7c2cc94 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -377,6 +377,8 @@ void xe_exec_queue_destroy(struct kref *ref)
>  	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
>  	struct xe_exec_queue *eq, *next;
>  
> +	xe_assert(gt_to_xe(q->gt), atomic_read(&q->job_cnt) == 0);
> +
>  	if (xe_exec_queue_uses_pxp(q))
>  		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 282505fa1377..c8807268ec6c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -162,6 +162,11 @@ struct xe_exec_queue {
>  	const struct xe_ring_ops *ring_ops;
>  	/** @entity: DRM sched entity for this exec queue (1 to 1 relationship) */
>  	struct drm_sched_entity *entity;
> +
> +#define XE_MAX_JOB_COUNT_PER_EXEC_QUEUE	1000
> +	/** @job_cnt: number of drm jobs in this exec queue */
> +	atomic_t job_cnt;
> +
>  	/**
>  	 * @tlb_flush_seqno: The seqno of the last rebind tlb flush performed
>  	 * Protected by @vm's resv. Unused if @vm == NULL.
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 6ae4cc6a3802..f1ba9c19e218 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -146,6 +146,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  	for (i = 0; i < width; ++i)
>  		job->ptrs[i].batch_addr = batch_addr[i];
>  
> +	atomic_inc(&q->job_cnt);
>  	xe_pm_runtime_get_noresume(job_to_xe(job));
>  	trace_xe_sched_job_create(job);
>  	return job;
> @@ -177,6 +178,7 @@ void xe_sched_job_destroy(struct kref *ref)
>  	dma_fence_put(job->fence);
>  	drm_sched_job_cleanup(&job->drm);
>  	job_free(job);
> +	atomic_dec(&q->job_cnt);
>  	xe_exec_queue_put(q);
>  	xe_pm_runtime_put(xe);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 314f42fcbcbd..79a97b086cb2 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -441,6 +441,29 @@ TRACE_EVENT(xe_eu_stall_data_read,
>  		      __entry->read_size, __entry->total_size)
>  );
>  
> +TRACE_EVENT(xe_exec_queue_reach_max_job_count,
> +	    TP_PROTO(struct xe_exec_queue *q, int max_cnt),
> +	    TP_ARGS(q, max_cnt),
> +
> +	    TP_STRUCT__entry(__string(dev, __dev_name_eq(q))
> +			     __field(enum xe_engine_class, class)
> +			     __field(u32, logical_mask)
> +			     __field(u16, guc_id)
> +			     __field(int, max_cnt)
> +			     ),
> +
> +	    TP_fast_assign(__assign_str(dev);
> +			   __entry->class = q->class;
> +			   __entry->logical_mask = q->logical_mask;
> +			   __entry->guc_id = q->guc->id;
> +			   __entry->max_cnt = max_cnt;
> +			   ),
> +
> +	    TP_printk("dev=%s, job count exceeded the maximum limit (%d) per exec queue. engine_class=0x%x, logical_mask=0x%x, guc_id=%d",
> +		      __get_str(dev), __entry->max_cnt,
> +		      __entry->class, __entry->logical_mask, __entry->guc_id)
> +);
> +
>  #endif
>  
>  /* This part must be outside protection */
> -- 
> 2.49.0
> 
