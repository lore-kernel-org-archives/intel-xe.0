Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96852D1814B
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 14:47:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DFE10E093;
	Tue, 15 Oct 2024 14:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ro+Yym/G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A4010E093
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 14:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729003645; x=1760539645;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qfKfTuflQUfiuCmbgq2Nx0A1DR/nVVxz9H12N12rA9U=;
 b=Ro+Yym/GdmxZ/onvM5Kt5OldFE4aV88C1X9srynEWfwe1nMbY2b5f11P
 8RY4NOi8615Y9/Lh+KsIWfnAjLZh3JOGBlU2t/3mThz5v+Njsl4yoKJ8m
 yPpVVauQ6+dDVBB8JHobo0JV8a39JRVAEcvsXoyIC7hYilRScxukkR36j
 2/kCD/AxQ8I9OnrUoLTOfkcIaNNIvuMGm0uidxYRyRh9WXvs18cGPaiTM
 d7DspR/Y6U29tXz8Ka1ea5tUUEP7PzvqI7GU5aVK3+Du/cwFuTMQU8qVH
 X6Uwt+vmdm3cRK9TsPNjnAilZ1h9CK6ARORc75i6PFOaYMfbqAJsRacf6 w==;
X-CSE-ConnectionGUID: HDQhf79qRgaAvSuLwxbVkg==
X-CSE-MsgGUID: 14ANo/zaQFqqE97DHF0vJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="38980048"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="38980048"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 07:47:24 -0700
X-CSE-ConnectionGUID: 7XfqE+BuTD6KyjrG3U6PzA==
X-CSE-MsgGUID: gFdg5L/fRDapgfJipEp95A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77928018"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.177.104])
 ([10.245.177.104])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 07:47:23 -0700
Message-ID: <3f5faee4-a472-453f-96cc-004e6b1e603c@linux.intel.com>
Date: Tue, 15 Oct 2024 16:47:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/26] drm/xe/tests/mocs: Update xe_force_wake_get()
 return handling
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-13-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014075601.2324382-13-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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


On 10/14/2024 9:55 AM, Himal Prasad Ghimiray wrote:
> With xe_force_wake_get() now returning the refcount-incremented domain
> mask, a return value of 0 indicates failure for single domains.
> Change assert condition to incorporate this change in return and
> pass the return value to xe_force_wake_put()
>
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
>
> v5
> - return unsigned int for xe_force_wake_get()
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_mocs.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> index ea932c051cc7..6f9b7a266b41 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -43,12 +43,11 @@ static void read_l3cc_table(struct xe_gt *gt,
>  {
>  	struct kunit *test = kunit_get_current_test();
>  	u32 l3cc, l3cc_expected;
> -	unsigned int i;
> +	unsigned int fw_ref, i;
>  	u32 reg_val;
> -	u32 ret;
>  
> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	KUNIT_ASSERT_NE_MSG(test, fw_ref, 0, "Forcewake Failed.\n");
>  
>  	for (i = 0; i < info->num_mocs_regs; i++) {
>  		if (!(i & 1)) {
> @@ -72,7 +71,7 @@ static void read_l3cc_table(struct xe_gt *gt,
>  		KUNIT_EXPECT_EQ_MSG(test, l3cc_expected, l3cc,
>  				    "l3cc idx=%u has incorrect val.\n", i);
>  	}
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  }
>  
>  static void read_mocs_table(struct xe_gt *gt,
> @@ -80,15 +79,14 @@ static void read_mocs_table(struct xe_gt *gt,
>  {
>  	struct kunit *test = kunit_get_current_test();
>  	u32 mocs, mocs_expected;
> -	unsigned int i;
> +	unsigned int fw_ref, i;
>  	u32 reg_val;
> -	u32 ret;
>  
>  	KUNIT_EXPECT_TRUE_MSG(test, info->unused_entries_index,
>  			      "Unused entries index should have been defined\n");
>  
> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	KUNIT_ASSERT_NE_MSG(test, fw_ref, 0, "Forcewake Failed.\n");
>  
>  	for (i = 0; i < info->num_mocs_regs; i++) {
>  		if (regs_are_mcr(gt))
> @@ -106,7 +104,7 @@ static void read_mocs_table(struct xe_gt *gt,
>  				    "mocs reg 0x%x has incorrect val.\n", i);
>  	}
>  
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  }
>  
>  static int mocs_kernel_test_run_device(struct xe_device *xe)
