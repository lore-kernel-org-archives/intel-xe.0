Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FECC27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 13:53:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369B010ED4A;
	Fri, 14 Jun 2024 13:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="focGmdku";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079F610ED3E;
 Fri, 14 Jun 2024 13:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718373229; x=1749909229;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WMbD4+Bn5FJ5jWhO3e2uRYfzLr8g1h4danx9NWiJM7I=;
 b=focGmdkuGW9d6z98ojve+B4/CvUYr2+AzckOfEFg2+/2e2+huzlEdVww
 8iOZCaoCRLdyVJoGpdUxseoS5n81CVitt/dg9YC1o0ZPpBnli3W+fRb0q
 1B9kOw2LyNYa+qHM6TuU6Nw6KNWNngXIStJEWCYolrb50uSY62C7mpU9q
 yLsXkaKwh+ewwuSVqfOms1ZRlp+7PmTdHiIwrbHxGB5OszXpJ9W9vwqNT
 WmnNXA3qAFkY22DRXU+StX/iC2p86EdWqfEsWxbdgrBTzL9YMuU/mq8t1
 K1J2S5hYXnP6fHK3AWs2GHPJzFiPJaJCIBnFLg0eugodi7dGTuzX0mXdL g==;
X-CSE-ConnectionGUID: gpkcZt25S56BNAEMJ+vQnw==
X-CSE-MsgGUID: a159XNwWQt6aCqfALbVH/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="12076192"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="12076192"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 06:53:48 -0700
X-CSE-ConnectionGUID: K6eZrFBbRvC9l/Is8HwQIA==
X-CSE-MsgGUID: ctfbKfoNTDe1r/iWumHOmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="40593884"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 06:53:48 -0700
Date: Fri, 14 Jun 2024 15:53:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] xe_exec_reset: Add timeslice preempt test
Message-ID: <20240614135344.offna76wcrb3bn3u@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240608001211.2365347-1-matthew.brost@intel.com>
 <20240608001211.2365347-3-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240608001211.2365347-3-matthew.brost@intel.com>
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

Hi Matthew,
On 2024-06-07 at 17:12:11 -0700, Matthew Brost wrote:

you did Cc to intel-xe list, in that case please add i-g-t
after PATCH:

[PATCH i-g-t v2 2/2] xe_exec_reset: Add timeslice preempt test

> Add tests in which submit multiple preemptable spinners to same hardware
> engine ensuring a cumulative longer timeout and validating the restart
> paths in the TDR.

Please explain what TDR means, like: in the TDR (T... D... R...).

Regards,
Kamil

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 5e9e48adda..144e3b3884 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -100,6 +100,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
>  #define PARALLEL			(0x1 << 4)
>  #define CAT_ERROR			(0x1 << 5)
>  #define PREEMPT				(0x1 << 6)
> +#define CANCEL				(0x1 << 7)
>  
>  /**
>   * SUBTEST: %s-cat-error
> @@ -287,6 +288,12 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   * SUBTEST: cancel-preempt
>   * Description: Test job cancel with a preemptable job
>   *
> + * SUBTEST: cancel-timeslice-preempt
> + * Description: Test job cancel with 2 preemptable jobs
> + *
> + * SUBTEST: cancel-timeslice-many-preempt
> + * Description: Test job cancel with many preemptable jobs
> + *
>   * SUBTEST: gt-reset
>   * Description: Test GT reset
>   *
> @@ -361,7 +368,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  		uint64_t exec_addr;
>  		int e = i % n_exec_queues;
>  
> -		if (!i) {
> +		if (!i || flags & CANCEL) {
>  			spin_opts.addr = base_addr + spin_offset;
>  			xe_spin_init(&data[i].spin, &spin_opts);
>  			exec_addr = spin_opts.addr;
> @@ -411,7 +418,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>  	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>  
> -	if (!(flags & GT_RESET)) {
> +	if (!(flags & (GT_RESET | CANCEL))) {
>  		for (i = 1; i < n_execs; i++)
>  			igt_assert_eq(data[i].data, 0xc0ffee);
>  	}
> @@ -746,6 +753,18 @@ igt_main
>  			break;
>  		}
>  
> +	igt_subtest("cancel-timeslice-preempt")
> +		xe_for_each_engine(fd, hwe) {
> +			test_legacy_mode(fd, hwe, 2, 2, CANCEL | PREEMPT);
> +			break;
> +		}
> +
> +	igt_subtest("cancel-timeslice-many-preempt")
> +		xe_for_each_engine(fd, hwe) {
> +			test_legacy_mode(fd, hwe, 4, 4, CANCEL | PREEMPT);
> +			break;
> +		}
> +
>  	igt_subtest("gt-reset")
>  		xe_for_each_engine(fd, hwe)
>  			test_legacy_mode(fd, hwe, 2, 2, GT_RESET);
> -- 
> 2.34.1
> 
