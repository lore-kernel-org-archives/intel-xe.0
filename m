Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1F3C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 15:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B0110E6FB;
	Thu, 13 Jul 2023 15:25:02 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C8710E6FB
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 15:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689261900; x=1720797900;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=M/SLDIC1ZSxogJCqUkR9fpW2D2/ti27LogpUMrAxUGs=;
 b=DqYZnN77bRpQMjhM2qXugnWSSQlFD8FcghQbMKAOxvs4/iV/VLgQxxJG
 1BubyPlfVB4dOv3+IvknI/HbHZL6DOC2a++hicRQPz8FWtGVHTiZgYKMJ
 v0/hsZGDVWc7MS0PSKymkgz8gQOrjUvsDU2oz/0aMQd/XulzkL2i95715
 d7dmPXVbyPJwEWirVZFGK8sigBoDDKi9tGpKyBFUcwhnValRdIC6MMgAe
 WyJzDq9ZokOfie1D78qPmqo4YPeoCales7SoOUe3FH2K6R7P1Vzb3gOL+
 EH3R747xlpiaQ+fHUau965kRo0C+PmzU7RcFrQ5prA4gGPBk1Evwb8cOG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="345538455"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="345538455"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="968658294"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="968658294"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.53.19])
 ([10.252.53.19])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:24:59 -0700
Message-ID: <0ecbcc5f-ccb7-e39b-e0e8-40d844a95fed@linux.intel.com>
Date: Thu, 13 Jul 2023 17:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230713094125.326709-5-matthew.auld@intel.com>
 <20230713094125.326709-6-matthew.auld@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230713094125.326709-6-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe/selftests: hold rpm for
 ccs_test_migrate()
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
> The GPU job will keep the device awake, however assumption here is that
> caller of xe_migrate_clear() is also holding mem_access.ref otherwise we
> hit the asserts in xe_sa_bo_flush_write() prior to the job construction.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_bo.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index edee4116c59d..6aad1443b00e 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -158,9 +158,15 @@ static int ccs_test_run_device(struct xe_device *xe)
>   		return 0;
>   	}
>   
> +	xe_pm_runtime_get(xe); /* FIXME: remove once mem_access actually works */
> +	xe_device_mem_access_get(xe);
> +
>   	for_each_gt(gt, xe, id)
>   		ccs_test_run_gt(xe, gt, test);
>   
> +	xe_device_mem_access_put(xe);
> +	xe_pm_runtime_put(xe);
> +
>   	return 0;
>   }
>   
