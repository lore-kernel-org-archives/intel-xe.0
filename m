Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4A5CCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 16:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE6410E529;
	Mon, 27 Oct 2025 16:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nnkA+FCC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F8110E529
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761582792; x=1793118792;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5zKwnKkezRn1s5Gpxi9r2ZxoDYI9wrWqP8ixqcx1q28=;
 b=nnkA+FCCiKLiwoKzbRppM9Fbtl0CXU7/TvEqnzZJmrU9fnNeKmRfvyAi
 Vo8Pc0dLPEwr6Lz/NqLd2xlTO0oySAUyyIbiQt1DSu56Mkf2LRHswVWyl
 x8vpUbH6f7XAs+9Yg+Ix8eRpF4PugkYarIXdeLRXGYPLknSybstnDIHzM
 1ULkJ6bU2/RFn47UbOe94MNSWZ/zFhtGJqeD/hnHN3aViZ+uT9GktgcqF
 xxefrP+bK681EtXwg98yOwfJMzjQ/RUZPAIUX5CfpV4dXEWFfA0F2pE3H
 X/eqpa7XlQvLCQB0raVVV5sSxvey2LHcq+iNTogQ0ve0wKpRWQ2731l5+ A==;
X-CSE-ConnectionGUID: Jf9tfyM8TWSyjtSO/30atg==
X-CSE-MsgGUID: l7gUb2PbRXaq9aa5TRRvtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63592619"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63592619"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:33:12 -0700
X-CSE-ConnectionGUID: F+rAVkq7TIONNHaqsDtNDw==
X-CSE-MsgGUID: i1vf4a/2QSuE/BfmvQiQlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185171677"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:33:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:33:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 09:33:11 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:33:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zC/S9dHfb7Y1WuuiVX6fKaIfNV78GGgbbZnbnGiysu2gJfDhJXWE71oN5FV6oKHaLfQsI+w9iSeTew1V/T/aeTaqvW7nv12i6J1nWa0GJ2FUhJHEtwgLIguNvXX+Qs+PLazmRbjp+QiJqcAaW6VRAk2nf7vGjF72CSZ1aPuwHcx4zYl9RUhRu85NvBkZqdmDyGhDTqKIAgPf4gE3wdNTAWCbkbn6r7QNNrqKL7nvT9nlqFJbJ6qXu9HQW6KxlniZIZPba8lFJwtUwwcMn/tWRx9RY4NVF2A0m3/o6DHuHazIdLqAVnk4+LkDq//fiX0Oh/bXlH1nPiGcDCI9Q9cH8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDVJx+scj9iaQy9AQKoSSeQEO1/VwGSimIYKNbXbdO4=;
 b=QzQ/WEadQAbk0N9uESXq8Volkrcbnmil+jhLmGLj/omOEBNFyUvB3hY2AsagdPpqaurMOJYAW9xlVNyCuwEb1v49IHP/8kV1k6SwQRo989d2i6DA15CDQN1UjtUecdKSWSFnWTx4eS6l7YqA+V2AsKgT3NzF9JH663DMsiz08JXQDydM5LpXmQKmfjr6QFsJRkCecV6y1GNBB0FzkZHWHnp3vUm9HRKpawzuh1Ie7hq1MKA3miO62m3YYI8PRbFtmyBbu+BYl+9gjnw1WIpjpXBSy3ksxEEsocNG4CWOT+WAOgdX0OIDq4fPgwfj8p5eJPyqvLxQjdw0UpZ+pgn1fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7697.namprd11.prod.outlook.com (2603:10b6:806:33a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 16:33:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:33:06 +0000
Date: Mon, 27 Oct 2025 09:33:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Limit number of jobs per exec queue
Message-ID: <aP+evyn9qN1iVJDK@lstrano-desk.jf.intel.com>
References: <20251022181036.2868787-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251022181036.2868787-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4P223CA0028.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ab03b2-d71e-46c7-f068-08de157681bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/qUZFt4vC6mN/Vz4AZblmNJK770ZcARVf7bNyM1gQUFH9Roi4Xl0EUOrxLwU?=
 =?us-ascii?Q?QOCYHGPu9yEuxjdbN6V9hBvGvoQm+CfPid65W8+dzkPWzD5NNPTAAH/I+J5h?=
 =?us-ascii?Q?JxCBdbK5FlAFB2K3Eq4mZpGlVUobjg5cNYRmHX0OloagbLPnCK3suwNbR9Ji?=
 =?us-ascii?Q?/J0mW8GyL9/jHoCN8JAa0SxQyV0ovEr4zD1vlqwadwRqiNsPZ6irD1SAbE+/?=
 =?us-ascii?Q?SEFSdH2ibPrfB6xTM5fq16dfVuaFADscKcy+zgfL8uOi+EvMuzaqIVK1qS/d?=
 =?us-ascii?Q?Dh3/EDmVca55U/H9biDqInwrQKwjSnM13u0tXrs3asK78o+7QVTmK7mY5X2b?=
 =?us-ascii?Q?ssLXyqnQvDqF3y4WE5xg8rANnwwhzMigU34tWiXZT0RYsdK9WXgrd6rta1Ev?=
 =?us-ascii?Q?iBC2Jz8O1rJGzQX1am5VPaTthfmm+9DscVDwGUqx5L8W388s4F8ZB0n6ltx/?=
 =?us-ascii?Q?d8o14AVOZUriAedeJptGDZyhsVwld0oecS9sDd6mqM1+TYCM/J1faDA5wGUW?=
 =?us-ascii?Q?71C204q6U7L7Xk8/XRQs+/1TEzBnlZ6AhVuXD1omz+2RTJeXKJvN5zGMkPWe?=
 =?us-ascii?Q?Yzot/qBnyfT6/Pm2Q29CKZJru60ceZ+Ny7igTMz9NjfBM2UelgBTpAjd1GfY?=
 =?us-ascii?Q?VjLdnfF+tX2aJ5C2hgRxgPsYDAO3Sig1at6a1WXkC6qBYGZVKta9ZitkPRXa?=
 =?us-ascii?Q?YKgNstTfcOPQRok8DJVmGV8tqv/Fzj2l1xvaV+QkXJ9Gnr8SxUSi5NdLRI6y?=
 =?us-ascii?Q?4zaGUVWMvOh1xJl5+uxiKWxygH9rQhpiNVSJPF73arnhqGLp1dLsAWXw9wct?=
 =?us-ascii?Q?Lj4dMncrHnxVHU8R2RVsvLyY3sWEMSRAcNmwYrx+ddfe/U/xNJBkE5yBizFH?=
 =?us-ascii?Q?gyOM7VFZDZM4dXw5s4qItnF7wQlQdWzAxmJas/+a2oE4rL+3bnMd9Br70c4/?=
 =?us-ascii?Q?vEfIj3qcylXXH+gSFIdcYkNEGkcSuGs3sQkvk+wi9Fi4F4whk56Yqh10kwQi?=
 =?us-ascii?Q?pbGl7XqJTnE5sBwNfVE63CJzTYrllFm5qU7iXPwCFMjca/CdvNEW79O/GEVw?=
 =?us-ascii?Q?e/Ms9RJ4gh5oo2eYzufMHjsBbTSrDuIIz8SPrGev9gp7riwWttcBRtd8Adi0?=
 =?us-ascii?Q?0QlViGTj0Vsy5pv9F5+6yzX6wZl14jfk8ZzXGJ3i9iAovV0WzvptpiQ6R2t2?=
 =?us-ascii?Q?ORHz2VxbBFNwafvEkEERr4T6mJeJrBX0uN+JK+D9CJJc4Q96y5D89AbQEbyv?=
 =?us-ascii?Q?mnove2+ZLDFM+zBgW0PBnAzwQvXH/ii7iPp18Xn/VNO910xZ3P6EahdGLzqq?=
 =?us-ascii?Q?cogCru5IwKQ1nLovhug9vCWrByS7ARAZYGwt4K8Py9YVZuEgqWZXdTInJcww?=
 =?us-ascii?Q?9IrQ+SXFXPg78LILR+xTJvFnmesIJ9PcVVBnp3xUO9mj81YiecID7k7WO9II?=
 =?us-ascii?Q?WgpkspDgzMXUxxWJOEJIOipHDrCoxbyk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E3XPvEe2tjzri24bKz0zcQdQRWitiFofDkD/BZToEnkdYMyR1LW6eyQsICt2?=
 =?us-ascii?Q?KpQF5IQqo19n5C/bjVqSTphCgh7tkeCImtDWd/BVGXxvmCPFqZf0ewO3q8zz?=
 =?us-ascii?Q?ARVh+kvjIEb0QpweNa0jItFGVz8XMNGKQzBpzsQ6RRwqsfpLEy2hy92h7ANj?=
 =?us-ascii?Q?rLp7MN6s51Oe/5xJOHGF+BshRkD5ya8L6E5MVBRnoR0thH6WZ8x6tTMtYDgq?=
 =?us-ascii?Q?UKvHXHkgHQJnt/zsgnmBNB6Sf/bnTiikWKI5FSquEQbOGQ4eonD0pazktxR3?=
 =?us-ascii?Q?uMm67kGjb7YaUiOxrDDFHxT7JmywzXL0NI/yuZIcnlKQGOIW1zsrOTcnk5Zl?=
 =?us-ascii?Q?gvk7LcV/GnaGY/cn/BjWBgG3bK99Dhvd85QApehOXlxgT/mpBwhULOv1FRl8?=
 =?us-ascii?Q?1rE/WQWy/Yf3YTEiZjCEsNVNjXj+nXg2E1k9J0c6Dq1UwuwGGdYbNEqA2CyH?=
 =?us-ascii?Q?MqTTVmApbb/jLFXiun5u+nYTu+3BQCxLNWpN5ihNlS9WlazcCEpnihu403co?=
 =?us-ascii?Q?zP2ZtwDGc1hikTfFlpfUcQsjKcUrV93ugZUxfXLVcPIRfz5uQury1lx+Y5Oo?=
 =?us-ascii?Q?GwPdEA0oMvNBVp8V9IAjPKqDPH5naYua1qwAk0np/7CrRf/JIyoA1OTiiILn?=
 =?us-ascii?Q?gAeCEp4F/AhUS2jdwRi7EoaV65zPLn36m5maKO0DuiiwDKNQ73YmT6MuT81X?=
 =?us-ascii?Q?/2imNd2Cfh11FQrGpjiwXRF5BC/5TIF9b4wdl1LmNz1wkoScWuNJiJLM6epf?=
 =?us-ascii?Q?h1oCAq0x+3vN9oPs8TGZNZbxDFnkSvq9qaIoUtg3aGXXPUmPc5zKfaiNNNOv?=
 =?us-ascii?Q?19CJRiDDiFtUH65oz8wdk06Wt/RciVVG7WY0iDO8RjWY58Sbfb0bmBmXiEte?=
 =?us-ascii?Q?SZC5D1ovyG7pqYxiZvzosxO8sKD8SkEDtpCWZQcFmqN39IlOI3Rp9WKUsasu?=
 =?us-ascii?Q?ZDvqEg0fXktmvOEMttjBJX7lEci5uTJpZhK50YVjRjMgY5Xo2UoUUmPhnDA2?=
 =?us-ascii?Q?GEjiCCWuBZch4/a12KtA5hNS1DT3oneLDo87an9dPDTTUobLgjhor0GvyB0G?=
 =?us-ascii?Q?KKnBeySTnsNnRmCqKIrBRUXIbDmvc9eiC0zhr7nFCGrFEXy+J66XGeDugDrB?=
 =?us-ascii?Q?1Cb84ZEIqlBWzxcrIVuxc8K/sLKfcufdIiRTqBq59qcUs0j7HMhwPvB74X74?=
 =?us-ascii?Q?c2lAP5yfF9geR8YfBOH+3kCJJ/DUh3mdPlkIldWy0ICfJeKGyMrzZQv2F5ST?=
 =?us-ascii?Q?l0vIDyCeP7FrvCFRIZE4joACBNifV1sJTwYaFWypkdNnkI+j1MGEosNX1bKG?=
 =?us-ascii?Q?SeLg+51Ia9ERoyXOlWf7nxJaQKjGT1KMMGHrvZnNMAQCcp1k7l5SK1U/EwCP?=
 =?us-ascii?Q?3XQcqbdksz9Mtx1hautfSWZ5dGGTCzeIskapWszoyaAc0IqD1Rh7Vo6ePro9?=
 =?us-ascii?Q?ySPTsDtDcCEB8Dw9X/f3Wh677Misa78PnzqRrOKOTS2rwtKkO01NbcNnl0tW?=
 =?us-ascii?Q?IDhnSiZxauif0nwnAPIjSvkG14xM3YCwhj+A8wPpx+ZcblxE1D0/KoF8mpcO?=
 =?us-ascii?Q?259Gkz+amTT/4FYht799PPbHEiv0oP1nrvWmURYij+OybcHIavo0VHd9euwF?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ab03b2-d71e-46c7-f068-08de157681bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:33:06.1860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYJrYAUwby5kVzm6pPSkeWJ5o5V6iexZyJ6AZbuOaeTmNCsds94i1cgjEz0TqHOKx38lFpfl28zeSX/U370+YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7697
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

On Wed, Oct 22, 2025 at 06:10:37PM +0000, Shuicheng Lin wrote:
> Add a limit to the number of jobs that can be queued in a single
> exec queue to avoid potential resource exhaustion.
> 
> A new field `job_cnt` is introduced in `struct xe_exec_queue` to
> track the number of active DRM jobs, along with a maximum limit
> `XE_MAX_JOB_COUNT_PER_EXEC_QUEUE` set to 0x1000.
> 
> If the job count exceeds this threshold, `xe_exec_ioctl()` now
> returns `-EAGAIN` to signal that the caller should retry later.
> 

This patch looks correct. One extra suggestion - can we get an assert in
xe_exec_queue_destroy that q->job_cnt is zero?

> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c             | 5 +++++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 5 +++++
>  drivers/gpu/drm/xe/xe_sched_job.c        | 2 ++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 0dc27476832b..722a5ac0200a 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -154,6 +154,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		goto err_exec_queue;
>  	}
>  
> +	if (q->job_cnt >= XE_MAX_JOB_COUNT_PER_EXEC_QUEUE) {
> +		err = -EAGAIN;
> +		goto err_exec_queue;
> +	}
> +
>  	if (args->num_syncs) {
>  		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
>  		if (!syncs) {
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 282505fa1377..5f3219acec3c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -162,6 +162,11 @@ struct xe_exec_queue {
>  	const struct xe_ring_ops *ring_ops;
>  	/** @entity: DRM sched entity for this exec queue (1 to 1 relationship) */
>  	struct drm_sched_entity *entity;
> +
> +#define XE_MAX_JOB_COUNT_PER_EXEC_QUEUE	0x1000
> +

I'd lose newline here

> +	/** @job_cnt: number of drm jobs in this exec queue */
> +	u32 job_cnt;

And add one here.

Matt

>  	/**
>  	 * @tlb_flush_seqno: The seqno of the last rebind tlb flush performed
>  	 * Protected by @vm's resv. Unused if @vm == NULL.
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index d21bf8f26964..37f58be7cbcc 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -146,6 +146,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  	for (i = 0; i < width; ++i)
>  		job->ptrs[i].batch_addr = batch_addr[i];
>  
> +	q->job_cnt++;
>  	xe_pm_runtime_get_noresume(job_to_xe(job));
>  	trace_xe_sched_job_create(job);
>  	return job;
> @@ -177,6 +178,7 @@ void xe_sched_job_destroy(struct kref *ref)
>  	dma_fence_put(job->fence);
>  	drm_sched_job_cleanup(&job->drm);
>  	job_free(job);
> +	q->job_cnt--;
>  	xe_exec_queue_put(q);
>  	xe_pm_runtime_put(xe);
>  }
> -- 
> 2.49.0
> 
