Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB86C83F2C
	for <intel-xe@archiver.kernel.org>; Mon,  4 Sep 2023 08:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AC210E2EF;
	Mon,  4 Sep 2023 08:22:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE3A10E2FA
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Sep 2023 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693815774; x=1725351774;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oESYhtxOOgEFo4vpmSn6iE5QuEAPE9uMZ+2j322UOME=;
 b=QudPwLxH+b58xWXJ0T2eG3vdo5GzF9Vyqpp8VibFzJX2eFnhaU2c9f1Y
 2xyIqVb03Nb9nC/98y8rCadcKATL0LBK3oJpJCYxyHLI6WLc6pDLRFkTo
 S7U3PACosP9tUivmHQuywpAKUF/nXdZPqT0WC7IylRuox5h9aM/b2IHPk
 oSkFddwSMTRbCiBLJAdp9c2KmXGU768vsNiPSi8YEOKa0PxMwfbzSDt73
 MT6OkhZhEcI9jPbnvUt+l1X2A2hg1CgbdgAMHCju4tjFh0R7V8r/AIWiG
 LAsPwwJ+tRpT2yWr9U5CLMpFtGQ/nLD6ELbtPIGxPCRfPUxO7BFiQi3hr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="376477838"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; d="scan'208";a="376477838"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 01:22:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="914431118"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; d="scan'208";a="914431118"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.32.53])
 ([10.252.32.53])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 01:22:27 -0700
Message-ID: <8edd023e-4718-60ab-881d-c2f2c6771eca@linux.intel.com>
Date: Mon, 4 Sep 2023 10:22:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230901142824.316711-3-matthew.auld@intel.com>
 <20230901142824.316711-4-matthew.auld@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230901142824.316711-4-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/selftests: make eviction test
 tile centric
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
> The concern here is that we may have platforms with dedicated media GT,
> and we anyway allocate the object on the tile, which just means running
> the same test twice (i.e primary vs media GT).
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_bo.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 0e4ec22c5667..c448b00a569c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -174,18 +174,18 @@ void xe_ccs_migrate_kunit(struct kunit *test)
>   }
>   EXPORT_SYMBOL_IF_KUNIT(xe_ccs_migrate_kunit);
>   
> -static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kunit *test)
> +static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struct kunit *test)
>   {
>   	struct xe_bo *bo, *external;
>   	unsigned int bo_flags = XE_BO_CREATE_USER_BIT |
> -		XE_BO_CREATE_VRAM_IF_DGFX(gt_to_tile(gt));
> +		XE_BO_CREATE_VRAM_IF_DGFX(tile);
>   	struct xe_vm *vm = xe_migrate_get_vm(xe_device_get_root_tile(xe)->migrate);
>   	struct ww_acquire_ctx ww;
>   	struct xe_gt *__gt;
>   	int err, i, id;
>   
> -	kunit_info(test, "Testing device %s gt id %u vram id %u\n",
> -		   dev_name(xe->drm.dev), gt->info.id, gt_to_tile(gt)->id);
> +	kunit_info(test, "Testing device %s vram id %u\n",
> +		   dev_name(xe->drm.dev), tile->id);
>   
>   	for (i = 0; i < 2; ++i) {
>   		xe_vm_lock(vm, &ww, 0, false);
> @@ -316,7 +316,7 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>   static int evict_test_run_device(struct xe_device *xe)
>   {
>   	struct kunit *test = xe_cur_kunit();
> -	struct xe_gt *gt;
> +	struct xe_tile *tile;
>   	int id;
>   
>   	if (!IS_DGFX(xe)) {
> @@ -327,8 +327,8 @@ static int evict_test_run_device(struct xe_device *xe)
>   
>   	xe_device_mem_access_get(xe);
>   
> -	for_each_gt(gt, xe, id)
> -		evict_test_run_gt(xe, gt, test);
> +	for_each_tile(tile, xe, id)
> +		evict_test_run_tile(xe, tile, test);
>   
>   	xe_device_mem_access_put(xe);
>   
