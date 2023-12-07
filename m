Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D232C10F05
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524D110E03D;
	Thu,  7 Dec 2023 13:00:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4775610E03D
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701954005; x=1733490005;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=thdfnq33TR5gTw4ltYZSOEEPYQrefNkdTzBrd75POR4=;
 b=T+y8TJgX4aBkVA0X52O/HcK3ZoTsFYcI40oMCf/8ChtMhA/sqW4vAC9V
 +Lfr8lHrZlnYKIsPy7Hm1ZUjkzznXWnKEQIvam2K+wTQ6Snru9GVSEFcY
 F2HM+ZRTRnDSYOhfIdltgDLGemENcd+6M/CTplt79Ua0ULOY01D6uZgma
 TqbPaYtC9fmkrzoI5I4HhrC5D4Dj9zYo55MfLMWdwS18k/6xvu2CuFqM7
 fz3LQO88OF+IoPsjU4Hpp5coEhSNoOmorLJvEvDa/JDKVx13NaM08OMJ3
 +X3ahOzPfOs3NNcXs9/gsOVi7Hbqm2T491ddXuRMo2Zh36dUjLJFsZoXX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1093000"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1093000"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:00:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="915570038"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="915570038"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO [10.249.254.234])
 ([10.249.254.234])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:00:02 -0800
Message-ID: <2c593b2e-27cf-33c7-7c64-6faef13672b8@linux.intel.com>
Date: Thu, 7 Dec 2023 14:00:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 8/9] drm/xe/xe2: Modify xe_bo_test for system memory
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
 <20231207091922.1224800-9-himal.prasad.ghimiray@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231207091922.1224800-9-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 12/7/23 10:19, Himal Prasad Ghimiray wrote:
> Modify test to valid ccs clear and copy during evict/restore on
> igfx.
>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/tests/xe_bo.c | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 549ab343de80..5e4e19a246dc 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -112,16 +112,21 @@ static void ccs_test_run_gt(struct xe_device *xe, struct xe_gt *gt,
>   			    struct kunit *test)
>   {
>   	struct xe_bo *bo;
> -	u32 vram_bit;
> +	u32 mem_bit;
>   	int ret;
>   
>   	/* TODO: Sanity check */
> -	vram_bit = XE_BO_CREATE_VRAM0_BIT << gt_to_tile(gt)->id;
> -	kunit_info(test, "Testing gt id %u vram id %u\n", gt->info.id,
> -		   gt_to_tile(gt)->id);
>   
> -	bo = xe_bo_create_locked(xe, NULL, NULL, SZ_1M, ttm_bo_type_device,
> -				 vram_bit);
> +	mem_bit = IS_DGFX(xe) ? XE_BO_CREATE_VRAM0_BIT << gt_to_tile(gt)->id :
> +				XE_BO_CREATE_SYSTEM_BIT;
> +
> +	if (IS_DGFX(xe))
> +		kunit_info(test, "Testing gt id %u vram id %u\n", gt->info.id, gt_to_tile(gt)->id);
> +	else
> +		kunit_info(test, "Testing system memory\n");
> +
> +	bo = xe_bo_create_user(xe, NULL, NULL, SZ_1M, DRM_XE_GEM_CPU_CACHING_WC,
> +			       ttm_bo_type_device, mem_bit);
>   	if (IS_ERR(bo)) {
>   		KUNIT_FAIL(test, "Failed to create bo.\n");
>   		return;
> @@ -160,8 +165,12 @@ static int ccs_test_run_device(struct xe_device *xe)
>   
>   	xe_device_mem_access_get(xe);
>   
> -	for_each_gt(gt, xe, id)
> +	for_each_gt(gt, xe, id) {
> +		/* For igfx run only for primary gt */
> +		if (!IS_DGFX(xe) && id > 0)
> +			continue;
>   		ccs_test_run_gt(xe, gt, test);
> +	}
>   
>   	xe_device_mem_access_put(xe);
>   
