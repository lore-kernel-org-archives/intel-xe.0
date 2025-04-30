Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C06C369DC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 12:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A26210E75D;
	Wed, 30 Apr 2025 12:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DlAfJ+g5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E6D10E75D
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 12:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746014522; x=1777550522;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QdTMOizthwpqLG3SEuZQuI8nvXeqpKcaoyMEx1V5deQ=;
 b=DlAfJ+g5vWXEQSN09OZJ9HkYoiYXSwFRcdB1f2eVBNsjh9jasB8huKAw
 d014r9C+ge8ySOwbD4+4LuCT9EjlSv+00niG4mDdm4hEJ9gNKpjWeU12E
 Rx3x8jCDJEaiRIfz416ARaeyfSrqhOyqFVH7j75GsKhn+8XOyfmI8Lkdd
 20uuhunlc1slXVqR82Gi3U24GhnXIUBmquPaHT1oqRDPrDSIEtOXFOfXb
 fJOlWlIpC/vpu+it0HIcO/rauckpU6UsYx4vCX5AulIbo+/8zF9xIBr2p
 bZNEynfAo/5Cu8ZVSX7cW/AtUNg+IR2YFyjmmzmtV3OXZovUW0FwyBSZX g==;
X-CSE-ConnectionGUID: RPZHAkKZTUelZOCgroVT6Q==
X-CSE-MsgGUID: MRZCVnl7SKyUg6vWtXaRfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51485069"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="51485069"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 05:02:02 -0700
X-CSE-ConnectionGUID: x3rkRlv6QkG0so4W5uNe3w==
X-CSE-MsgGUID: sZUYSYr+Rf20NcZZCZt+cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="138121950"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 05:02:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>, John Harrison
 <John.C.Harrison@Intel.com>, Aditya Chauhan <aditya.chauhan@intel.com>
Subject: Re: [PATCH] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
In-Reply-To: <20250429134649.4747-1-satyanarayana.k.v.p@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250429134649.4747-1-satyanarayana.k.v.p@intel.com>
Date: Wed, 30 Apr 2025 15:01:58 +0300
Message-ID: <87h625vow9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 29 Apr 2025, Satyanarayana K V P <satyanarayana.k.v.p@intel.com> wrote:
> When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
> functions, the CI test systems are going out of space and crashing. To
> avoid this issue, a new helper function is created and when fault is injected
> into this xe_should_fail_ct_dead_capture() helper function, ct dead capture is
> avoided which suppresses ct dumps in the log.
>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
> Tested-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 2447de0ebedf..3a49e432f74a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1770,6 +1770,12 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>  }
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +static noinline int xe_should_fail_ct_dead_capture(void)

IMO noinline needs an explanation. I can guess, but let's not make
everyone guess.

BR,
Jani.

> +{
> +	return 0;
> +}
> +ALLOW_ERROR_INJECTION(xe_should_fail_ct_dead_capture, ERRNO);
> +
>  static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
>  {
>  	struct xe_guc_log_snapshot *snapshot_log;
> @@ -1778,6 +1784,13 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
>  	unsigned long flags;
>  	bool have_capture;
>  
> +	/*
> +	 * Huge dump is getting generated when injecting error for guc CT/MMIO
> +	 * functions. So, let us suppress the dump when fault is injected.
> +	 */
> +	if (xe_should_fail_ct_dead_capture())
> +		return;
> +
>  	if (ctb)
>  		ctb->info.broken = true;

-- 
Jani Nikula, Intel
