Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AC2D1AD35
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 09:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3BE10E6DD;
	Wed, 16 Oct 2024 09:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C53jUAh0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C287410E6DD
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 09:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729070713; x=1760606713;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=w6xazLI3TMU2lB+QpfBy+RAJY6mEQrFtckIFPooEVZE=;
 b=C53jUAh0ddFBc2uU6ghi1C3sV2gWtGrPbDNzKhyFwaJ4oJP3b3JAq2ie
 zB3zUM795P/kDLahQU/dIFOtY4xGqGCDJe4RnaWs2nHUnKE8Q8lgk51nv
 Qj++BqkXaAoGReph0FjDosX8PMKHMA6lHgTb0Zw6Koxizwj9odk+iglCd
 anlif58Tjp+XnIYzkZlLsgse+g8q7wAIwHtCZ/pRqO4OzavgqtBntwYmD
 yDuHOxgonZYc+SJYKQi/2gexLpPD8AXifkyESBK1TsjhrTIQhi3iK6Qbi
 VJCuXW0yMIqJuOUIjXZk0rODxZpO0C51SuNHBRAS+BL60sfzfqgFb8vLW A==;
X-CSE-ConnectionGUID: kjA2eKyUT96w+iwgvTinZg==
X-CSE-MsgGUID: fVaeqF8TQ4e7p7UoyGmxKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39087656"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="39087656"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 02:25:13 -0700
X-CSE-ConnectionGUID: xR+f/htSSzCAv/FwGLrGZA==
X-CSE-MsgGUID: NvEW7w9XSTmGx3jD/ni72Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="82946587"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.166.105])
 ([10.245.166.105])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 02:25:10 -0700
Message-ID: <9efef283-9a60-48b4-ac64-0bc997ebdd26@linux.intel.com>
Date: Wed, 16 Oct 2024 11:25:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe: Enlarge the invalidation timeout from 150 to
 500
To: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Zongyao Bai <zongyao.bai@intel.com>
References: <20241015161207.1373401-1-shuicheng.lin@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241015161207.1373401-1-shuicheng.lin@intel.com>
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


On 10/15/2024 6:12 PM, Shuicheng Lin wrote:
> There are error messages like below that are occurring during stress testing:
> "[   31.004009] xe 0000:03:00.0: [drm] ERROR GT0: Global invalidation timeout"
> Previously it was hitting this 3 with 1000 executions of warm reboot.
> After raising it to 500, 1000 warm reboot executions passed and it didn't
> fail.
>
> Due to the way xe_mmio_wait32() is implemented, the timeout is able to expire
> early when the register matches the expected value due to the wait increments
> starting small. So, the larger timeout value should have no effect during
> normal use cases.
>
> v2 (Jonathan):
>   - rework the commit message
> v3 (Lucas):
>   - add conclusive message for the fail rate and test case
> v4:
>   - add suggested-by
>
> Suggested-by: Jia Yao <jia.yao@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Tested-by: Zongyao Bai <zongyao.bai@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 962751c966d1..22b572f0612c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -925,7 +925,7 @@ void xe_device_l2_flush(struct xe_device *xe)
>  	spin_lock(&gt->global_invl_lock);
>  	xe_mmio_write32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1);
>  
> -	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 150, NULL, true))
> +	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 500, NULL, true))
>  		xe_gt_err_once(gt, "Global invalidation timeout\n");
>  	spin_unlock(&gt->global_invl_lock);
>  
