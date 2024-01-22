Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADE9C47DAF
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 20:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF44110E3BB;
	Mon, 22 Jan 2024 20:13:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904C110E3BB
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 20:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705954424; x=1737490424;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=j0ry3GrX96joZvkVDcrU0VqBY/0UVu8H1i8/d3Zbi8U=;
 b=T0+R4z6UiP4E/vT7iXxixUkOPNGWSjoAqdnnxKy0xwBe7y7BG0lzn4Sg
 caKqJxasd2dOg0F2bS7iRORvwDSzFC9SX66uhkRiaX6zWZN5euZpgD+n8
 I6QSFDAnPANdyvTsMNz9aXuBzhNXlPmhx1oQgfvEHNLMKXwlPqUNDGSKM
 tt2hOsG07QHqwcljLgMhdWIKOUBKJA3Jo+aLAkW6sOw4bRfxc347OoTMb
 jALF/PyFnRAOSFMvLwJ8Ph+RsQjr3n/5yfBIWiA5Qwdzp5TjVfxt1w9jw
 Y/Vk/ykv72TgakZAIR7m+YbBx7avS2U5T+MBT0gWr1jwxGxu8Y1qj/kLS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="7969120"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="7969120"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 12:13:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1283542"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 12:13:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 12:13:42 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 12:13:41 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 12:13:41 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 12:13:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRNz0M8tEQ6ujGUTFA5wk+QtOUQRWwOM+zHeyp2ki23TGU58D19xvWaCL/or0TNez1Rov0eFyI4FSHN3tzH7WGdjSiBTTf5Y1QeQInKXnqfbTeBkob0GtFiNOZfnVnkewmLm2jZIgPyKjG2oXZ0qAjTH9jL3/iITa8LOCkQvNCcXIlxI/R/N9bbsqpuffWAJJuez+oRvBt0riWdIEyxBRV6NxzuZUCzIWQCNMwIJXlHHgTYgPVM73hZnST1/ZHRl3wuKRAuJTRdNP7PozyKiNVk08eDhCOw8JuEAn1AOvE3dVAf6EhWQpoVVABtJa2hWoTrqW0jG7WWLf2cqUxCr/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgHnYYsrU3WzpGxU4rvE6X7J1TBsoUNJVlgCTz3tsgc=;
 b=F06QL0IoWiEkvAFNy7S9bMDUugF1fQ4iQAD+8NXF0jSk5lsYaue0/RZw3eBJdP3Z/2PTnIu+mv3a4eMKfmXkIMs2p35eRISebgikhAeghvcboijUf6i6Cy9MnSPPF7JFdhmVv6i6s+h+6hQ8zoEjouSGrD89UbTWwGx52pE7Swh6jspBBA0XODud9kc/4bDr7qzGYVHJefs36OI7cr/4Ggpz/msmOm2Psb9+te+PY0xVDsqMRivmiM9n+FOa1d/ts9/XnqsYXFUrxHLwXnWdqIGX20G/z4zxhbgvKjjrOOpyh/dwRcHU78yeSIn/gmuE2lKlAfEFt2Px3TcYbeTcqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB7375.namprd11.prod.outlook.com (2603:10b6:8:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 20:13:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 20:13:37 +0000
Date: Mon, 22 Jan 2024 15:13:34 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH 4/9] drm/xe: Add batch buffer addresses to devcoredump
Message-ID: <Za7MbjVITw3itEJE@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
 <20240122170445.108856-4-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122170445.108856-4-jose.souza@intel.com>
X-ClientProxiedBy: BY5PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 37ea12ff-d2b9-4743-3df7-08dc1b869e45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tLKC7Wk4ij+JHBB7nYCKNQd66vdllNgFnkbIEkMb7fwJ3JLfsbAE4rAwagYqqHf/d42Bl3OnPd/MgK2naZQ2p05jVpRfPEm8ktU6RnnObpjZBD4vyPU9vIexgTVCl2zq3eEOd3dtdDS60qg6QAnxpnPhZ9oZJ45YIdHbD8CwpBnfzpk+yCfy/R/cpi8VU2W/gxlXOB+gDycKKnMZYTFl1B/cAfRClYamsJwcqyOjG8Lx1m0mTaQfqLToC7QZ/4ID/0VMoQql2h3Cd3mN8ixPIoGalkxQBGK1rsyUIDhw1K1okHgVmzUdsv91yKVer13WO6xO3eL8Wgq/Hovwcp2ShR80lQgoh9C443oHDHsgF58F5EeLhfYGkixPBYzRsmmz+iXbJVS/Nl7EwgY67KSj1D0bT86l6gjXviuiA2pXJwQf39LPbXRDwbyFKFO3PYVpy4P69Fu7oYeFk/JlxU7d8mnPJ0tyjA75nqzkqjassu8f7WObeYKknNTT2OMc/l6+DiPuwYGQWy45kQEshzC0cUV/HQ9/4h2Una7eXv+ctmF0nIE76ECbnPNk1pq/aLh/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6666004)(6512007)(2616005)(26005)(6506007)(86362001)(36756003)(82960400001)(44832011)(83380400001)(5660300002)(2906002)(66556008)(38100700002)(8676002)(41300700001)(8936002)(66476007)(6862004)(66946007)(6636002)(4326008)(6486002)(37006003)(316002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+N2kMcaQGJ0m9Tkn6XgqqcBH+GqesgJ3qPMHKnsri+P1WQdNRoHX4iW2HI?=
 =?iso-8859-1?Q?FULFt3rrm/ezEK0xs8vfcHF+f9YOVRph/wiZGAd4UuMBzUdTAXpZKNOx4u?=
 =?iso-8859-1?Q?2P4k2myigtA9bSbRiM+6Ux7pBBh46H116pp9JJ6S/DA1PUeOSYmGoDwE1O?=
 =?iso-8859-1?Q?P/zuI5UOU2b+Vpu8kZNiOywkFzEKifvP4wi61n+psuTfUaXl6U1zEvayTv?=
 =?iso-8859-1?Q?RZzhqPobkwMRMF3bkgOzrtbpANtWcQ6tHsG5ygGnZ/5JtPsT1HCecZAfFC?=
 =?iso-8859-1?Q?jGfeIf+hA7XqJXFHSv+4TCZh/q8dcIxJTyaiNP+rufA1hupfc+jnhlB35j?=
 =?iso-8859-1?Q?zDhTpa0kvUEokzIrNNw1LRTSwN0FjlK4z3kY6CsSmlJJv4PwyRuxud5D2C?=
 =?iso-8859-1?Q?Lyu4n6MBIz158bdR+8iGzxKZGU4wIuOAKuBBto1KsgAsf3qlbP3yiOiumd?=
 =?iso-8859-1?Q?qIscFt7h1s0wbsQtjs08uUHWhk2Bck82m/KeTVMaJWslE80FZ738iH6Fxn?=
 =?iso-8859-1?Q?Hc8uZt8qUYCMNxmVf4mTB7J3QV8Bhb2O99pQMZIwbCK9Lq19MR6vWfN7+r?=
 =?iso-8859-1?Q?BfUn9weSYfV+RaNaqUT0wN3U0p1IB7SaIwXSDXW50JOWIbxaJ2psIEsTH5?=
 =?iso-8859-1?Q?lm9kIj7hRTp1/eOmxg3rGpE6IBCI3HrmaaQ1B2f6qocft2yKH1WF6Y86hx?=
 =?iso-8859-1?Q?EHCQb+562+alymWiDyP6VF+Ao34CmmaSjO+SxhVEmu04bM8g/xeVBzlv3Y?=
 =?iso-8859-1?Q?39fuHM67Oa9KmJq7xYw90a7RFoN5yuoExXEXs45BuT0ItsvU0m0VBOqfva?=
 =?iso-8859-1?Q?Wk6qTgdw50wETsy454gJe3yTjMGpVACSdAwSB4rcxWQWTfzzsJFW1+6c6n?=
 =?iso-8859-1?Q?T9uPbklPSYzUKkv2tOAGjqFjP1sUR2QENlQ2u6tRfoFs7TdAkQuYPfi3DY?=
 =?iso-8859-1?Q?bJld6uHGx6XoAD9Qu+G0ZXvkMd2Iv7vB5c2pIZFeqyHgPTMLLd8mufE5uF?=
 =?iso-8859-1?Q?E6OtaMPLqHXc1j0WgX+hGnQUbfHP0GahDsNS7hQjrSPucteMdLIuhwOTbM?=
 =?iso-8859-1?Q?NTvKXlkhUoGBHxo4qIDNLeo3sKEdkQBunKTnHxQEglSeykqnKyYWJ8bghl?=
 =?iso-8859-1?Q?pPw1gcMWgLuszw/V5rmf8XhhWQ06pr2YIGMzdspbBKq/w4M9lw4HPXrXgE?=
 =?iso-8859-1?Q?SXe+CCB8gLADm6FKN1dbWPjoeEEVFT3mrWHRBZYIK+FA3/aez76keEpnbM?=
 =?iso-8859-1?Q?fA66MWZrstbldTiTKb6Xv+WZJZZeP9VsvHAyXrlWIlUvMUPHIbGk44MGHI?=
 =?iso-8859-1?Q?fWgGzhRD1BA/r9uhKhsx2lHROC0U9Sbz4QmhF0DsmgYly/AsJT/Ruv6cP2?=
 =?iso-8859-1?Q?wnniQqLzeFnPeokFiv11dDAoiZZTB++LmrEc8XWq6qKLuibg4R7EcKhC6J?=
 =?iso-8859-1?Q?pucf69HCrPUKjU2WFi8SiFH9nsoPfLet4CAyLi6HTvx2vvpBbIqHWuWTvM?=
 =?iso-8859-1?Q?P9zDlKb8sAkdwMPs4GocxzZBOR5ucD4kX85abnuij/2N3T2RUDJO7nI6Ud?=
 =?iso-8859-1?Q?JoqLCQ0z63+YjacF8m/MBznneLtG576rLJ3wE1/WO0OaDSgQS2FuoKUVHM?=
 =?iso-8859-1?Q?w4HqV0P4HyILr7Agb2BB0ZmtiEGd5aNg0w?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ea12ff-d2b9-4743-3df7-08dc1b869e45
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 20:13:37.7756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ztBzaBa0Sop4KqtQb8ORQrPFQEP5DFyT+rqFUApBMRbZAGrSKfhbgPaJJds35Pc2QHfQDktKl9b63FFcP9OBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7375
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 09:04:40AM -0800, José Roberto de Souza wrote:
> Those addresses are necessary to Mesa tools knows where in VM are the
> batch buffers to parse and print instructions that are human readable.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c       |  5 +++
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  3 ++
>  drivers/gpu/drm/xe/xe_sched_job.c         | 38 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sched_job.h         |  5 +++
>  drivers/gpu/drm/xe/xe_sched_job_types.h   |  5 +++
>  5 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 0f23ecc74b162..a0e3732440ab5 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -94,6 +94,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
>  	xe_guc_exec_queue_snapshot_print(coredump->snapshot.ge, &p);
>  
> +	drm_printf(&p, "\n**** Job ****\n");
> +	xe_sched_job_snapshot_print(coredump->snapshot.job, &p);
> +
>  	drm_printf(&p, "\n**** HW Engines ****\n");
>  	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
>  		if (coredump->snapshot.hwe[i])
> @@ -114,6 +117,7 @@ static void xe_devcoredump_free(void *data)
>  
>  	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
>  	xe_guc_exec_queue_snapshot_free(coredump->snapshot.ge);
> +	xe_sched_job_snapshot_free(coredump->snapshot.job);
>  	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
>  		if (coredump->snapshot.hwe[i])
>  			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
> @@ -153,6 +157,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  
>  	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
>  	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(job);
> +	coredump->snapshot.job = xe_sched_job_snapshot_capture(job);
>  
>  	for_each_hw_engine(hwe, q->gt, id) {
>  		if (hwe->class != q->hwe->class ||
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 7fdad9c3d3dde..9a12959ed6b14 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -31,8 +31,11 @@ struct xe_devcoredump_snapshot {
>  	struct xe_guc_ct_snapshot *ct;
>  	/** @ge: Guc Engine snapshot */
>  	struct xe_guc_submit_exec_queue_snapshot *ge;
> +
>  	/** @hwe: HW Engine snapshot array */
>  	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
> +	/** @job: Snapshot of job state */
> +	struct xe_sched_job_snapshot *job;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 01106a1156ad8..cde1407867db6 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -278,3 +278,41 @@ int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm)
>  
>  	return drm_sched_job_add_dependency(&job->drm, fence);
>  }
> +
> +struct xe_sched_job_snapshot *
> +xe_sched_job_snapshot_capture(struct xe_sched_job *job)
> +{
> +	struct xe_exec_queue *q = job->q;
> +	struct xe_device *xe = q->gt->tile->xe;
> +	struct xe_sched_job_snapshot *snapshot;
> +	size_t len = sizeof(*snapshot) + (sizeof(u64) * q->width);
> +	u16 i;
> +
> +	snapshot = kzalloc(len, GFP_ATOMIC);
> +	if (!snapshot)
> +		return NULL;
> +
> +	snapshot->batch_addr_len = q->width;
> +	for (i = 0; i < q->width; i++)
> +		snapshot->batch_addr[i] = xe_device_uncanonicalize_addr(xe, job->batch_addr[i]);
> +
> +	return snapshot;
> +}
> +
> +void xe_sched_job_snapshot_free(struct xe_sched_job_snapshot *snapshot)
> +{
> +	kfree(snapshot);
> +}
> +
> +void
> +xe_sched_job_snapshot_print(struct xe_sched_job_snapshot *snapshot,
> +			    struct drm_printer *p)
> +{
> +	u16 i;
> +
> +	if (!snapshot)
> +		return;
> +
> +	for (i = 0; i < snapshot->batch_addr_len; i++)
> +		drm_printf(p, "batch_addr[%u]: 0x%016llx\n", i, snapshot->batch_addr[i]);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
> index 34f475ba7f502..f1a660648cf00 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> @@ -8,6 +8,7 @@
>  
>  #include "xe_sched_job_types.h"
>  
> +struct drm_printer;
>  struct xe_vm;
>  
>  #define XE_SCHED_HANG_LIMIT 1
> @@ -77,4 +78,8 @@ xe_sched_job_add_migrate_flush(struct xe_sched_job *job, u32 flags)
>  
>  bool xe_sched_job_is_migration(struct xe_exec_queue *q);
>  
> +struct xe_sched_job_snapshot *xe_sched_job_snapshot_capture(struct xe_sched_job *job);
> +void xe_sched_job_snapshot_free(struct xe_sched_job_snapshot *snapshot);
> +void xe_sched_job_snapshot_print(struct xe_sched_job_snapshot *snapshot, struct drm_printer *p);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index 71213ba9735bc..377dc6b806eb8 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -43,4 +43,9 @@ struct xe_sched_job {
>  	u64 batch_addr[];
>  };
>  
> +struct xe_sched_job_snapshot {
> +	u16 batch_addr_len;
> +	u64 batch_addr[];
> +};
> +
>  #endif
> -- 
> 2.43.0
> 
