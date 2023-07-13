Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C985C00528
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 15:34:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C221410E709;
	Thu, 13 Jul 2023 15:34:47 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8152810E707
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 15:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689262486; x=1720798486;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=VqqNMNt95wu+kcL7tXcu+Ffkqla7P+lqss0hZBpMMAM=;
 b=Pou+nIgqMIxjiFhNB3N+vVwmKzWnPBxsxxZE5E041iUPRW1Rtmp1Ff7j
 cBIz+dbt6gxk+HBifNCaj0w6UWWAS2QSnHgfyEAClsQNFuCEVow4Ic0f4
 ywjqNCl1scOvykjpctEQSYXCgcuO2TaYP09EWyoRhCfuXxzk7xSWkeIxS
 pT2VKFJKOqsot+jBrIRCNLchuH+XytkAZfEDiz2qmv3iZRa5DudjZyobL
 pvs5IDUd/ZVay5rh8yVC9f2rV8XcSYFZWcgduMQOMysU1outfchkUA7eQ
 FMtAXI/nKHg9ep05ZdUAX8QGzp8XNoaUyUNztMq8y+k5MLH+9rGY3vqlj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="364092758"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="364092758"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:34:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="725337913"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="725337913"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.53.19])
 ([10.252.53.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:34:44 -0700
Message-ID: <5f1dfbce-f528-1497-54e6-2e42541134b4@linux.intel.com>
Date: Thu, 13 Jul 2023 17:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230713094125.326709-5-matthew.auld@intel.com>
 <20230713094125.326709-7-matthew.auld@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230713094125.326709-7-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/selftests: restart GT after
 xe_bo_restore_kernel()
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


On 7/13/2023 11:41 AM, Matthew Auld wrote:
> Test seems to be failing badly after calling xe_bo_restore_kernel().
> Taking a snapshot of the CTB and copying back a potentially old version
> seems risky, depending on what might have been inflight. Also it seems
> snapshotting the ADS object and copying back results in serious
> breakage. Normally when calling xe_bo_restore_kernel() we always fully
> restart the GT, which re-intializes such things.  We could potentially
> skip saving and restoring such objects in xe_bo_evict_all() however
> seems quite fragile not to also restart the GT. Try to do that here by
> triggering a GT reset.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_bo.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 6aad1443b00e..21c6dfef8dc7 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -220,7 +220,21 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>   			goto cleanup_all;
>   		}
>   
> +		xe_gt_sanitize(gt);
>   		err = xe_bo_restore_kernel(xe);
> +		/*
> +		 * Snapshotting the CTB and copying back a potentially old
> +		 * version seems risky, depending on what might have been
> +		 * inflight. Also it seems snapshotting the ADS object and
> +		 * copying back results in serious breakage. Normally when
> +		 * calling xe_bo_restore_kernel() we always fully restart the
> +		 * GT, which re-intializes such things.  We could potentially
> +		 * skip saving and restoring such objects in xe_bo_evict_all()
> +		 * however seems quite fragile not to also restart the GT. Try
> +		 * to do that here by triggering a GT reset.
> +		 */
> +		xe_gt_reset_async(gt);
> +		flush_work(&gt->reset.worker);
>   		if (err) {
>   			KUNIT_FAIL(test, "restore kernel err=%pe\n",
>   				   ERR_PTR(err));
