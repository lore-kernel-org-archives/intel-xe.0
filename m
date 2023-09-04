Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24DEC83F2C
	for <intel-xe@archiver.kernel.org>; Mon,  4 Sep 2023 08:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8E710E2E5;
	Mon,  4 Sep 2023 08:22:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97A710E2E5
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Sep 2023 08:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693815748; x=1725351748;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MAT8xLBPHCYJOU35/7+D/Yo2IEGLAlRMdxlrlAwN8GA=;
 b=FGuFLQ9jfCR76FGIS5yxsjCgqrcL3ojEZMIj2bk4i33WKux6kUSvv/OX
 7s5uMgaAAnvRjPGDRLJH01f3/A7YiuYsML+wlqk6KwA5ThZQoFrDxfgON
 1Qj/SWMQnnHVzMCOda5u6MalxTEqjO3TFveBnnv0CO+qyqR2mYJJfOJHC
 9z5pGer6VkpnmGU3i24ceK/ZwAv9xCC2HvXOCSYI0oO52M4xrPBDqaBwH
 jgLcznnnF/g9PZW3KparTwSA1o28ZZRvwj73le0/r9FqAZWjFTnUQ3o9w
 802yCY2lnPzBblK38nhBoHDjvFgV3xyI7nZq1RNKc+fe5Ndt3fMAsMveg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="376477623"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; d="scan'208";a="376477623"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 01:22:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="914431050"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; d="scan'208";a="914431050"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.32.53])
 ([10.252.32.53])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 01:22:15 -0700
Message-ID: <e2e04cba-e03a-569c-d852-df802792b7ea@linux.intel.com>
Date: Mon, 4 Sep 2023 10:22:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230901142824.316711-3-matthew.auld@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230901142824.316711-3-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/selftests: consider multi-GT for
 eviction test
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 9/1/2023 4:28 PM, Matthew Auld wrote:
> We need to sanitize and reset each GT, since xe_bo_evict_all() will
> evict everything regardless of GT, which can leave other GTs in a broken
> state.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_bo.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index b32a9068d76c..0e4ec22c5667 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -181,7 +181,8 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>   		XE_BO_CREATE_VRAM_IF_DGFX(gt_to_tile(gt));
>   	struct xe_vm *vm = xe_migrate_get_vm(xe_device_get_root_tile(xe)->migrate);
>   	struct ww_acquire_ctx ww;
> -	int err, i;
> +	struct xe_gt *__gt;
> +	int err, i, id;
>   
>   	kunit_info(test, "Testing device %s gt id %u vram id %u\n",
>   		   dev_name(xe->drm.dev), gt->info.id, gt_to_tile(gt)->id);
> @@ -218,7 +219,8 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>   			goto cleanup_all;
>   		}
>   
> -		xe_gt_sanitize(gt);
> +		for_each_gt(__gt, xe, id)
> +			xe_gt_sanitize(__gt);
>   		err = xe_bo_restore_kernel(xe);
>   		/*
>   		 * Snapshotting the CTB and copying back a potentially old
> @@ -231,8 +233,10 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>   		 * however seems quite fragile not to also restart the GT. Try
>   		 * to do that here by triggering a GT reset.
>   		 */
> -		xe_gt_reset_async(gt);
> -		flush_work(&gt->reset.worker);
> +		for_each_gt(__gt, xe, id) {
> +			xe_gt_reset_async(__gt);
> +			flush_work(&__gt->reset.worker);
> +		}
>   		if (err) {
>   			KUNIT_FAIL(test, "restore kernel err=%pe\n",
>   				   ERR_PTR(err));
