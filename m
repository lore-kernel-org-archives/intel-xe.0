Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF50C43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 20:20:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D5910E256;
	Thu,  9 Jul 2026 20:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iG28juhp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C39910E256
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 20:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783628425; x=1815164425;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XT8JHx70kQDnEl/EN3I5KKXu3+GPNmcyV23HnTZGeC0=;
 b=iG28juhptV/XRbZ1X7JyvZ4WZF8JTTkw/IQQfLqFNWcRlPkcH6EUbDW5
 VxQGleuDba3h8LzwLn5JwhtyLl8xIv+4vUUWxCHAPmLxB+blPfJsJe/Pt
 QEDtWLILHgUQhZwk47ecPE6Rud+ug2aprg+kbj8sqe0a5Z0cL2FgRevZ1
 eVUHySj4ghUXejx5LSBXaiTP6AX418n9CY0YIQjvgyHsAfqfmfIPBN+Aa
 Aim5E+xdnBlj/OR4K6pqyM1vjOrDRiqxMU+7fY7J6g+ae7PQ7+Tb5eZPJ
 ai+6WYxHWMChDfFoaqqVd/AeSzHVYMVLJ+DE4hln3TdrfAtp/CjknJk4G A==;
X-CSE-ConnectionGUID: OzCzHfw+TO2ayFk5HojEBA==
X-CSE-MsgGUID: KRVXISqmTImlV/AkXsKxuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88009776"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88009776"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 13:20:24 -0700
X-CSE-ConnectionGUID: IYcfaatURWegiTtp+wqjAA==
X-CSE-MsgGUID: F8eaHsEoR2y0JR3CRJiRFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="277924515"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 13:20:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 13:20:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 13:20:24 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 13:20:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qeCJSClh9hSvo6tARn5Y+nkNM0OMRTDv9WJhZOjNHl0R+mZ/W0TByey1VUsTXt5I6VX2K6dao+CNia1Bok5qEKhD7eM96d5MUALUV89R+7qenJOrSG+P82yWqVIPxby2/a2AT1Tba6h4/W9cWSZgm3rGFntR4uaPZHbTvHxOMW3kALcSBkb9jCich4ritSUMn6ArQQa3rRHT2vK7PerwAU5ITnj28VmQ9BWEZYpH3gpeDp5PsApYCHi9s7BiiJqe9poToEhvnpHs67EAPLpdQX9Hd/W6rbch0ZTJyvPcTWr8hVueQ9lMSXrgRslHfeQYBUbP4QOi+T90tFz2Ec8+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTQxTQSg2XZXD5nm3l5KNuF6NsX4IzL2+224SEmp6Z0=;
 b=WSxPclebL+NCUbxz5Y4e1wg7O3gCk7O2qLdBr+dDw9wUrrxjXgCuVSiOTCBfRaH/gWpYJg/N5lKIulcz4lz2sIRjRaht0kgnoxbMeitaXxxFdgj+sB9dtkILfJa1KWiDQynBzwb8xYsXFz1AfqfU6j22PLGN8XrasUt33ES9AnhMHiaaiOZF2xFp19iHiMgdoOsu8DYSi3WowpoKU+w11Zy0426HvsbmN0fuT+03B7Eq0obtDTHjwMz2+z5LKaZxzV7PmYNaSvPz+ex1vPnskAmTEv+r6jcI/dM214q/KqkhbHuwtsM+9CjlCVPaRlJjXIMpYQ87VoAXcmjklvyq5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS0PR11MB7632.namprd11.prod.outlook.com (2603:10b6:8:14f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 20:20:19 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 20:20:16 +0000
Date: Thu, 9 Jul 2026 13:20:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 2/5] drm/xe/hw_engine_group: propagate suspend
 failures during mode switch
Message-ID: <alACfMCbLyNwiq4m@gsse-cloud1.jf.intel.com>
References: <20260701050730.1776476-7-niranjana.vishwanathapura@intel.com>
 <20260701050730.1776476-9-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260701050730.1776476-9-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR13CA0063.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::8) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS0PR11MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: 26cfcf84-160e-4723-715f-08deddf77d25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|5023799004|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: AkhLrbvmmBn53A5GTdA9D67wFcQ/vOxPUqxo52fgE8JZO+21nSRPdD3KSEdNmEd6soY3ETaxzuK5qKzxSErAxWa6BiduLqik9rGX85yX+TGXA9mr81QCO6LUWmAZuBq12udB5/6qvn093/CyZBd8ZdvKK+xEZ9RN5VwUzqwKHOUOthhkbxdsRigjqiMYLcIzJif2uVlpGwp0rXPAxUCYogb2kte69Y4YoFxlX0fL6BzgNJmmyz2KwirHHKR0axCYUjjKtAj43iTE2xBsR+YIY5XZSY2Btzw2CWIVdWY5Nbso2/wpoLifuYc/E9H4osccvElu8PpRsKg3HX8EhlQwek8IIGJl9+ieg9dtMtxF/e5UOeHiil5khyQ+S8Diw25zhO/FtWuJ/rDQOhKwywpG05jbYU+dawg9GKYsHDUwh9AMpqDVnobwC0T27Ch+Gehi+qcjl9NsVIqOswDxtq8GY1jbDxjM90qNH1qZoznvxxSn+ZQWoPC55TcJpFgteRci8g5ZP7tqdHrzsMC8DAyaX+BnFQk7nQqt+V4hjpP89ttTISvZMI+oDPQfn7EOPX++MzAiEaEnzBFu2MZ4zNJ8muiKfwxOEJm161Pynv4OxxE/g4GH+q01IejQscYx3tV/RDVYMrWa9cCeqW9wlJJwPvAWUt7lpIoirrA8uRivk04=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(5023799004)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0jdcsJK9WZQprFtuoM+DBZj2JRgvPXoX4DaPXA2UIdKhUiwgccun/l/Xym57?=
 =?us-ascii?Q?AvJNlErQ6LTgMGbZ7iNe2MRhv6kbjbypY4mA0ocuLmgWD3f4akiJQ2ZOpqoo?=
 =?us-ascii?Q?poV16WGhRxMLmGX78OXhAStEEqEMNkleQwTB65dfzRW+kABZwz4xNr1Bn7sM?=
 =?us-ascii?Q?RV/C+DyLhAmb/t7CxQxFxrOJBhH2cSEXlX3/+5XFMIKUcbe9KrLZrqipcRVu?=
 =?us-ascii?Q?ALo0ZkVYPVN/z/LN+qkF7xm5nKxVUthVNIfw0gyUTKiVIQMMjhCwaaP2dex6?=
 =?us-ascii?Q?uCleTW/nJDIoZS57Dzv+AoUDvB/jU4XFkBcprAY+dxLMqcMjjyVXkBQ4ZPj0?=
 =?us-ascii?Q?AnDc9RKHN3H0SP02RRo23IQr7UUsacK4NuWvtkMVo76AxshG1QpkEQQuNZqn?=
 =?us-ascii?Q?Q5GjeCnRNNqdBSy+ZdMGVsNrClaqnJMIWOd6jb9eJwLB8kpnEgFUCFdq6NR4?=
 =?us-ascii?Q?QSc1Ku/uRs1mYTcSPyWwTmKtiY2yuGpl5N8mqmDY8c4ZnA2GIVm6KAT+KsbP?=
 =?us-ascii?Q?YI8FnfcTgloJHbPYN6u/qW7R8RLoLI+MSoU+7gCPHFP/iddR6Mt5wyokM6fG?=
 =?us-ascii?Q?NRzRUGu0FO+bGflNTKL6RYPQbexD6Jw4AJHVnKclJ6BulMR50hyVWNxl7wmo?=
 =?us-ascii?Q?WzdyAuY99Ggu0D3evt6USG/RCWZhZH2jsF8T0GnqCGP6nxHT+MmlS9br6kmZ?=
 =?us-ascii?Q?G557WyWrjPOyOsjumVYB5Uq1OjagG5QY4nOAZP7bg6Iji+faZYa+VbMwpT4a?=
 =?us-ascii?Q?/CoHeBphXuePHfhsYmOkU+rO9YUrHyAU0Ji92HemPqciNDZOsoSFz36GZzju?=
 =?us-ascii?Q?XJ6f2vwhYzte29/675bciarB6R0f3aeCptX8xeF+LtCUj9IVLgDszFv2Ycv/?=
 =?us-ascii?Q?Boq43BdKxN11IUooN56bBQYlY9NdG+GGBRHypSRBVCxFZ70Fn+VCOETNdsGE?=
 =?us-ascii?Q?BsSCt58Cx543eKK8i/vaYD/gvfDZm6YjYKxicBfYHxBHU1/phUrXbTvAv3Qj?=
 =?us-ascii?Q?QlDJ+GyFUUqbGKBYKBouBbvr/JCa4yv/gcAx9r5D+fAZsaYgY+7bKq4MjQuh?=
 =?us-ascii?Q?LU30u19VvoDm6vm1za/HNZ+Yw40IQuHCyfZbPTMSSh9G/gVs2zpizsxKXHpo?=
 =?us-ascii?Q?J053CDad7erX5+jqztDVgzttySr+/JxPc7TOIqoj9VHoe3qtiLn0QrZyXYs7?=
 =?us-ascii?Q?UcUrg/b9uqwklKBMQUxiCHL7iOz2MqQ9CqlptLrirChwLDgVeRpZXs96Qov+?=
 =?us-ascii?Q?RspZ1WApvX5pu7ihr/o8EsYTb3VC/GrK9mEy0X91m0Ix47kBkBXzYgU72b7U?=
 =?us-ascii?Q?Mvb2mUTZCbpP0/PhG++dATSIazMyf6XuUrYLk1rzK2KiJ9US3M8ItMsQZzMf?=
 =?us-ascii?Q?+Pd/f7fHpQdL6/qFY43YeG1TwF12KJnBLCuAe5N2Oxw6DGmfqwMyt5tUCW5K?=
 =?us-ascii?Q?LV1lLDuQ7BQlUet7N+Nh4StD3igOnjVLqPTLlzS92Zp9mbsIpi0DwtajuTKu?=
 =?us-ascii?Q?fDB4x3drVfMc34sgFm25zRjq9JG9g6vgrCIG2aJl0puoMJisuVKriIXTluKX?=
 =?us-ascii?Q?vBoqpan3WpZc5iXfys3nP1EhdLErd5vSU+L0f1PwxcpAKkMQvz1I5DG7zaXm?=
 =?us-ascii?Q?Zrh58K7kNbZIiub3zRGgjwPrWedWxOP3r3M7UnrtFt24A6M3N2H4iLd21qbh?=
 =?us-ascii?Q?MeCxAa+lfNM0mlKYVJQMWebtyFa6n+BwyU9oyJpCEBcXB1dreaVSjHlVdpHu?=
 =?us-ascii?Q?hzKOtdqPnwmD/rkI/rgn6St+FZgVWd4=3D?=
X-Exchange-RoutingPolicyChecked: oD9AE2c2WgLDiq47D4JSzfiKQOUsP5nVtW14W1HDjMq/Z2oTJvSGju2zJ7G6nCc6fLtXfA4oOYnMw/HbNCIPO6PlRC6dv8FLFCVRXhfcnEDVxjm+r3IOQ5zkkh/VZH5PyKBc8bufmidFDXNRBT8Udkfz+EnMA9697GGo7GxMJjFY5PzhBLB+3Sg9pRvoyd+t+ualmrh2FQbVqX0FsW1mnbHilINoTek+ljlL4YenHsEEkumqVbV1Jfe/pzt+iOkl4HvxjqSScKHtfPa4CGq915pWxfREOhRdUozNtNahJB8b2ekEKM/Jz/sZjWoS954XRpcRE4g+jNl6YjU60EyXrg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cfcf84-160e-4723-715f-08deddf77d25
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 20:20:16.7327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVzSrqwtzMNS9b3W6k4SD3BgGblvqi93cwep0h8usmvHTh+sZWNMPUOez8452TFywAzADuNkjENfbv15Sg+1FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7632
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

On Tue, Jun 30, 2026 at 10:07:30PM -0700, Niranjana Vishwanathapura wrote:
> The hw engine group fault-mode switch suspends all faulting LR queues
> but ignored the suspend()/suspend_wait() return value. A suspend() can
> fail (e.g. the queue is killed/banned/wedged), leaving the queue
> un-suspended, so silently continuing could later resume a queue that was
> never suspended.
> 
> Propagate the failure instead: in xe_hw_engine_group_add_exec_queue()
> bail out if suspend() fails, and in
> xe_hw_engine_group_suspend_faulting_lr_jobs() undo the partial suspend
> via a new err_resume path that resumes the sibling queues already
> suspended in this call. Record per-queue success with lr.suspended so
> only queues that were actually suspended are waited on and resumed, and
> skip the cleanup resume() when suspend_wait() failed or the queue was
> reset/killed/banned/wedged (its suspend may not have completed, so
> resuming would trip the !suspend_pending assert in the resume path;
> teardown resolves its state instead).
> 
> Gate the group resume worker (hw_engine_group_resume_lr_jobs_func()) on
> lr.suspended for the same reason, so it only resumes queues that were
> actually suspended.
> 
> Assisted-by: Github-Copilot:Claude-opus-4.8
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 76 ++++++++++++++++++++++++-
>  1 file changed, 73 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 02cf32ae5aa9..84851929c16f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -34,6 +34,15 @@ hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
>  		if (!xe_vm_in_fault_mode(q->vm))
>  			continue;
>  
> +		/*
> +		 * Only resume queues that were actually suspended. A queue whose
> +		 * suspend() failed (e.g. killed/banned/wedged) was never
> +		 * suspended, so it must not be resumed.
> +		 */
> +		if (!READ_ONCE(q->lr.suspended))
> +			continue;
> +
> +		WRITE_ONCE(q->lr.suspended, false);
>  		q->ops->resume(q);
>  	}
>  
> @@ -140,7 +149,18 @@ int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct x
>  		return err;
>  
>  	if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
> -		q->ops->suspend(q);
> +		/*
> +		 * suspend() can fail (e.g. killed/banned/wedged), leaving the
> +		 * queue un-suspended. Propagate the failure so the queue is not
> +		 * added; on failure nothing was suspended, so there is nothing to
> +		 * undo. Only record the queue as suspended (and later resume it)
> +		 * once suspend() has succeeded.
> +		 */
> +		err = q->ops->suspend(q);
> +		if (err)
> +			goto err_suspend;
> +
> +		WRITE_ONCE(q->lr.suspended, true);
>  		err = q->ops->suspend_wait(q);
>  		if (err)
>  			goto err_suspend;
> @@ -216,8 +236,20 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  			return -EAGAIN;
>  
>  		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
> +		/*
> +		 * suspend() can fail (e.g. killed/banned/wedged), leaving the
> +		 * queue un-suspended. Propagate the failure, but first undo the
> +		 * partial suspend by resuming the sibling queues already
> +		 * suspended in this call (see err_resume). Record per-queue that
> +		 * the suspend succeeded so only those queues are later waited on
> +		 * and resumed.
> +		 */
> +		err = q->ops->suspend(q);
> +		if (err)
> +			goto err_resume;


This is not right. I think what you want here is:

err = q->ops->suspend(q);
if (err)
        continue;

A killed, banned, or wedged job should not abort the entire suspend
flow and propagate an error back through the user IOCTL. The "group" is
a cross-process concept (i.e., a global concept), so a queue tearing
down in one process should not affect submissions from another process.

I'm pretty sure you could trivially cause a compositor exec IOCTL to
fail by running applications that page-fault and hang, or by killing
them with Ctrl-C. Under the right conditions, the compositor could then
see an error from its exec IOCTL while trying to render a frame.

> +
> +		WRITE_ONCE(q->lr.suspended, true);
>  		need_resume = true;
> -		q->ops->suspend(q);
>  		gt = q->gt;
>  	}
>  
> @@ -225,9 +257,13 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  		if (!xe_vm_in_fault_mode(q->vm))
>  			continue;
>  
> +		/* Only wait on queues that were actually suspended above. */
> +		if (!READ_ONCE(q->lr.suspended))
> +			continue;
> +
>  		err = q->ops->suspend_wait(q);
>  		if (err)
> -			return err;
> +			goto err_resume;
>  	}
>  
>  	if (gt) {
> @@ -240,6 +276,40 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  		xe_hw_engine_group_resume_faulting_lr_jobs(group);
>  
>  	return 0;
> +
> +err_resume:
> +	/*
> +	 * A suspend()/suspend_wait() failed partway through the mode switch.
> +	 * Resume the sibling queues that were already suspended in this call so
> +	 * they are not left suspended forever.
> +	 *
> +	 * resume() requires the suspend to have completed (suspend_pending
> +	 * cleared) or it trips the !suspend_pending assert. So skip the resume
> +	 * when either:
> +	 *  - suspend_wait() fails: the suspend did not complete (timeout, VF

VF recovery is a non-issue given page faults are not enabled on VFs which
can migrate. Don't bring that up here as if that needs to be handled
this code would have to look different, or mentiond VF recovery doesn't
need to be considered.

> +	 *    recovery, interrupt), so suspend_pending may still be set; or

IRQs are a valid concern and this part doesn't look right.

> +	 *  - reset_status() is true: the queue was reset/killed/banned/wedged.
> +	 *    suspend_wait() can return success in this case via its killed/
> +	 *    stopped wait condition while suspend_pending is still set, and the
> +	 *    queue is being torn down anyway, so its state is resolved by
> +	 *    teardown rather than by a resume here.
> +	 * In either case leave the queue marked suspended.
> +	 */
> +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> +		if (!xe_vm_in_fault_mode(q->vm))
> +			continue;
> +
> +		if (!READ_ONCE(q->lr.suspended))
> +			continue;
> +
> +		if (q->ops->suspend_wait(q) || q->ops->reset_status(q))

-ERESTARTSYS on this process doesn't mean a different processes queues
are bad. I believe what we need to here is suspend_wait_no_irq(q) to
recover any suspended queues back to the resume state. Yes, ctrl-c /
process kill will have block but I don't see any other option to
maintain balance.

So I'd write this like:

if (q->ops->reset_status(q))
	continue;

q->ops->suspend_wait_no_irq(q);

Or feel free to a no_irq argument to suspend_wait.

Matt

> +			continue;
> +
> +		WRITE_ONCE(q->lr.suspended, false);
> +		q->ops->resume(q);
> +	}
> +
> +	return err;
>  }
>  
>  /**
> -- 
> 2.43.0
> 
