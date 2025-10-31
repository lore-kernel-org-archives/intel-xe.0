Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E89CCFA02
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 20:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB9310E0A8;
	Fri, 31 Oct 2025 20:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGt40Vcd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5CA10E0A8
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 20:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761941765; x=1793477765;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WNGR7nhJIHx0qdJ1IbF1NEGubPbFfekBgMUpJIuY7SY=;
 b=NGt40VcdEjUtbweZjezlk2QnZFjOQZbj591GWlNvcmIsK6PtDrxejodY
 8w9rxf5flk5xdQyJtnTiqCvLjdvvlEZnNNwQRFkTbLWbPjKGWO2h/ytXH
 tTGJdrV5e0FuSMmIPw1geDDMKzFg4on26cwMjRyNrv6zj9Y7/Z3lNDw/n
 sKjH0HzFUh+G651UgYm9RAZyyrG+LJ/B1jDNhaaDbj8v1oxvxTXIiLtjd
 FaNT+IjYrTC/8vTNHrDUaY3fg1B69okviFlr+aTL4Dn6iVQFM2imomhPO
 ojdgElENBMJHCNc81wfX0DhXwsxr2ZGklBdlfCvaXvwXNguu19r2fIpui Q==;
X-CSE-ConnectionGUID: UR07EwLxQ16IceVQqmCfuw==
X-CSE-MsgGUID: 7+s2jdLTQZicgaHq3w+atA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64029699"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="64029699"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 13:16:05 -0700
X-CSE-ConnectionGUID: ip0+/HhrQ1SGwV/fpWcpyQ==
X-CSE-MsgGUID: FsabRJUBTlehKP4CnigCjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="217159484"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 13:16:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 13:16:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 13:16:04 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 13:16:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjCIaeayV3Nh8D3bgDVx7cnLTIv7X9BPdt427b2qP0lEEPhgGyukI+sI7IL7U68mHqs0h4xeMJBu493+orj5INaKYjqQUDsdvb06NI8Tx324yvXCQpmCQcvJudzNGz9va+CoAfhedBhP6eD15tHy62uLbNO00VxcFIf+RmhzzNgqrK3lmRaCxFNZ+jmFkUu3bnuMLmDKpiG/MxDfCWSV3zhfrNv8daPuS/T98VVygGSDDg8uf4qkmul3Nud4KcwvRIE57SXhTqjin0uTMJhQxyVkaU6f4ymlwtLDy/il9046Heed9BgbrPNnDZyeZPFUe8jQVk+WykG2jKLLF/J9NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4SdjL8G8tdwO2ZmG6tLzNjQ2agNRKVovB3wyODv9lA=;
 b=baDtGv+TDrshSoeDuJtmXs2x15pnvqv6bA7Ya2rraLhs6vV7wKafTF9tr+ePWdmLtoVqV6OenowcXWgontj6BuSMrXche9ccrAL80ousArdr4fClAtuvUPsVfy1Tp3tQhhQ5W0n6y0b7oHRuIFhrJRoqv0N+XeqNZCZgzN1hMA6FEQNpAU4h+iSk6rJR028UkoPdarHmR9kdC8xHwYRHttSKRJlUemrkEL+nzCeoWl1UjRrAjKhcexXzKpx3AjQeUY0SdXgyaklhfPS+hIRAE40i3VrnGKL6D0nDwZgz6wIUNJeY4JzF4j+eGkSiSllN6bUBDCdNYn8OCC5ElQmGew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7731.namprd11.prod.outlook.com (2603:10b6:930:75::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 20:16:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Fri, 31 Oct 2025
 20:16:02 +0000
Date: Fri, 31 Oct 2025 13:15:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>, <tomasz.lis@intel.com>
Subject: Re: [PATCH] drm/xe/vf: Skip signaled jobs during VF migration
 re-emission
Message-ID: <aQUY/zzjEbxYrmR2@lstrano-desk.jf.intel.com>
References: <20251031195327.2997606-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031195327.2997606-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR21CA0001.namprd21.prod.outlook.com
 (2603:10b6:a03:114::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: d70d2eed-03ad-4cf1-7443-08de18ba5051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A/gW94qBxz6b7VSuOougfx02FBhAjblQM4ojWJpU1d/5NlGKFNV3WI3BOpsJ?=
 =?us-ascii?Q?4NeXnauSjyEALZ2KlMLXxMCDEGXMtLEC7ryrCkPXd7gJWn8OBjL0JQvpjFOy?=
 =?us-ascii?Q?c9MFd2PBHlsKDMAQir/tvtw+XTP/VrD98n6QwRKulsdSV8jwLY81F8Y0ydpi?=
 =?us-ascii?Q?YEsx9NgVEf+X45k8vel2WtaxXmzG+v8DvC+E/SUwv5mAi+qMBoO1WtJF+W1z?=
 =?us-ascii?Q?mNkSdgtM9cETcmecIcVtQK0b0Xmha/nsYNNSMlqAoCgT62Jnw1IA75q+st6O?=
 =?us-ascii?Q?fbTlad99PnNx5LOB4kBbUUCiYqhwQBOBYD6FSi9IpPc0v2EPs2F2tiZ5VLQj?=
 =?us-ascii?Q?/Ln3HnU3uITwp2aJaYMVwo0uGIlY3546/42Aj3JN/b75+y+ZbGBeleOPu/uD?=
 =?us-ascii?Q?AY/xTzNdoFC2iPBqkDr1BXhcC57tq9rucOyfgvw/EGgSXYqEBthCUhLKOmLB?=
 =?us-ascii?Q?fhp4tQHtO1pTDY3dEHM42LFIn8w9fOb2+9Heh0r8Zt/6pD9c2QCT4ns+5/gH?=
 =?us-ascii?Q?weFn0D9VbB1OLuQIMtMf5DbnMYpG1QTTbIrNYLvm+nsgEWK6aCkCp0iGTjCu?=
 =?us-ascii?Q?4aUHGJiPYiTyiSixDJjPN94s/yoO3gW66lImzwxyc2H1p/kAIrblb4dn3yew?=
 =?us-ascii?Q?3Q5YChyrR+b9Kq9bJeYQGuRC032/VCc8nriM38Z8p5qko+AhG7N9y/vmZaQM?=
 =?us-ascii?Q?MdvGnjrImncaKUn4yJRd7IPn9MTnsDg0CEgj+G73P/SFDlWDYb5FtXvYeoas?=
 =?us-ascii?Q?M7ZCeT4B2GLMjTg4Lmz8iv6MyWz10lnlVdRPnoY77SrFZe49peGxFQjQ61iC?=
 =?us-ascii?Q?c2zfGD1AYZpDupPrrFy2KGUsV+9seISJpq7Zp+s4IYE70y8mqm9vj7pTbFoe?=
 =?us-ascii?Q?oSeq2w9qXlgOzAQCKV7modhbTqQY2g0d8NUYUdeJHj/gMCC56PWA7s7yjCaw?=
 =?us-ascii?Q?q466NMmLVJKaPXzKmfJD37AtcvsjaKKTU70tzaBz1zAiwc4r0j4kRiUqNbY0?=
 =?us-ascii?Q?2gCA+doK55KFJCzA2VFpLj8oqtotDupAozCGQ1h8UDdlGZnKU4BNCR1oh//Q?=
 =?us-ascii?Q?FyFXBkQEpObeknTp87V5K82bAhfU2ElRBgKhrHIxpTy1KbINKMp+JNLbORmI?=
 =?us-ascii?Q?29kAEz9HREW4DOkAn+dQIMZ2ImYYOKivsOJFOjHN0kHOmgUWm7JniPPQgJ/H?=
 =?us-ascii?Q?LgUKrFZPuwob/E6C99Ms0TraWyEylEIlskhOPu3WWHXfv00GPbfKtVBsP7a0?=
 =?us-ascii?Q?Da7O+6P3TD4qxpSG7BQlU0oIMAkunF1Rjitv2tGq6QBeQT8fTLjGc6AJNv89?=
 =?us-ascii?Q?m0lqcyxJiW8aZ0fX/JvMTYNV10BLSQ9XopuoujR0w/FSx5QDwrqPBe1umT9K?=
 =?us-ascii?Q?5jcmNYNrMBNGVQsezH4Hb4SaXKbfbbZqEvMg7PwBMcEv7WLjdA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7yxyOutj1ssbLNQkyzShiCiNsfLz9uGDfCdBZH5AknhhOIwvF6wvBBsgYRwu?=
 =?us-ascii?Q?yX6hd7n9Nf1ye1vJ0a2CPoy2D/6MA8nTqn3z/Rs+7/J/bz4LsfRorO5VXGz+?=
 =?us-ascii?Q?q318nvcUgZS3SJrZxJPGQkckI1ZeGG0x9lCcV2q9lh28cPzM/ltmYIZ622iE?=
 =?us-ascii?Q?qOCPifiOmNp+j2xeziLnSCQiN3Zx+fNJGFP344smNzkoTWopNRZZRon/d2rN?=
 =?us-ascii?Q?miCAqaFO6fcdlkgcfaher7pK4cfgOR7rVwsnxONrYMonrSkEBXZPrwZFicZq?=
 =?us-ascii?Q?NVBcAv9EHyJYbn8J3Vm4A6RFd9lKuAUOyBx5zfeuMLznDMN6+qHlE2IIuSeb?=
 =?us-ascii?Q?9gfkomt8OuJYtM3BfemhQbT6t0jQIDAsqpS7FokKjrzrKFKxlkpEWO1SdsDg?=
 =?us-ascii?Q?E3ignvePQ3bHA9kzFIMIj1MkB6w5ijR3V57aelGP3gaBJKwIXQsNydUqtUun?=
 =?us-ascii?Q?0zElY2EHJ8CpO341khRzoTu19TXXv7eMWgFSKio3IqHXIDmF0efCDwVKZ9ke?=
 =?us-ascii?Q?JWMYymZDkpWa9FQtDdmWqIl/5mEEoG4QpGSXe33/k3I/HLbZNKejX5zcqHH0?=
 =?us-ascii?Q?khWpGEKARwPbAt5ivamYSABa54nJxrie95zySX4yyx5FupfqgsgwolZ2lqNK?=
 =?us-ascii?Q?uYjbmxe06OSlx1Lc2n6Sjh7n5c8pfEmWpNuejETUWRwBIu5mYuzNg55bo8ub?=
 =?us-ascii?Q?mHQXQzOlZQexGTlBnSbCkYBMOQktQbwOfn1SKuzaffi7Mo0/f3mHRuNctum2?=
 =?us-ascii?Q?QbH6oJblabAKJ1eTvx+1jVjy8AAnLflLEugswcbF2IV8dJQqnqEikfMMDkK2?=
 =?us-ascii?Q?0e1jBvQ6BW5L+FxeJdIdrneDeAtzYKfvYkYBJByghF6PECD3AkY/uXqXYBVj?=
 =?us-ascii?Q?d6X0FUq/qpnvH9hBLD6dhooU/4IEK0gijBKP1xDilnIOAGY3urDzE1iUOUSc?=
 =?us-ascii?Q?MTijH32Arc887vBAhML507+aVv5uPaboiO55YIqA5TYc5H37fXEfwEoiLUjp?=
 =?us-ascii?Q?Q+wCxE585qSK0DQOF58ZszqZv22pLteFTHp5+tJZsHFns94dV5203U1LsjqY?=
 =?us-ascii?Q?gC+hjknoWqdb5QVv6ESDEJFyFmEniD1RDV52NvZrm3FToX18e2iba3aw0NvI?=
 =?us-ascii?Q?ZErwKp1xlH7HSjC9pBZ2F/JnKVLhP6AxLO2ZXLVwmsMQmXc6GXOLK73pnbzT?=
 =?us-ascii?Q?N78Pdj6ix2iGCULNoBlnxmPsEcsZcetyXrzvSE7ibK4WSi34QxNJaXjRTcEK?=
 =?us-ascii?Q?T753Zj4Uqh3S2jDO4U6YGztg5nB9MDS5YJCAa+MUBZWU+nX95oTXCx76Mx6Y?=
 =?us-ascii?Q?gYEjuW7PspEKpysiP+nhqKTGnM8AtfQiekHdZ/MxLG0ILGjpGd+9DrQHdF6I?=
 =?us-ascii?Q?5Ur8itX0tG5vFe+f5I1pm8aloThqsF2czJff9dg93PNRdi3aXZh8XdM1wcfR?=
 =?us-ascii?Q?hoItRpBhtIlY3q++IXzzqR/eGtNxehiPqtaYE3XqPUWZotUhVL3fKz7JYSfB?=
 =?us-ascii?Q?HizI4+rwyt5rs6K62+Vebue1w6k+oW03h3YShZblkI6Jp5fI24/V7ZdYMuqS?=
 =?us-ascii?Q?deZ/EGkHOPt7KXzxfrjyVhfD/U2qbh46VrX2v3cgJ3xhz9UknzmtSefKR5Pp?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d70d2eed-03ad-4cf1-7443-08de18ba5051
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 20:16:02.5075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+HF9DdTIpa9arveE+8GyNg/Emf7PzKa97spkQ9+58f6pPRPGukllJrzvKv98knbfBOHAoTQWRg8Z8TLv/FkjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7731
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

On Fri, Oct 31, 2025 at 12:53:27PM -0700, Matthew Brost wrote:
> The LRC software ring tail is reser to the first unsignaled pending
> job's head. Fix the re-emission logic to skip signaled jobs, as it
> currently scans all pending jobs, potentially causing imbalance.
> 

Ignore this patch, I accidentally sent out the wrong code. Here is the
correct version [1].

Matt

[1] https://patchwork.freedesktop.org/series/156869/ 

> Fixes: c25c1010df88 ("drm/xe/vf: Replay GuC submission state on pause / unpause")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index d4ffdb71ef3d..bee76d1b0836 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2241,11 +2241,17 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
>  					   struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
> -	struct drm_sched_job *s_job;
>  	struct xe_sched_job *job = NULL;
>  
> -	list_for_each_entry(s_job, &sched->base.pending_list, list) {
> -		job = to_xe_sched_job(s_job);
> +	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
> +		struct drm_sched_fence *s_fence = job->drm.s_fence;
> +		struct dma_fence *hw_fence = s_fence->parent;
> +
> +		/*
> +		 * First pending job in guc_exec_queue_pause skips signaled jobs
> +		 */
> +		if (hw_fence && !dma_fence_is_signaled(hw_fence))
> +			continue;
>  
>  		xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
>  			  q->guc->id, xe_sched_job_seqno(job));
> -- 
> 2.34.1
> 
