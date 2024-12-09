Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40A4E7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 16:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB1510E4BF;
	Mon,  9 Dec 2024 16:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9YQ8KbO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C638110E4BF
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 16:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733761620; x=1765297620;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0uNBVmo/pVyoZg3lb18sBETFu9+SAy170y9WynmbZ/4=;
 b=D9YQ8KbOPMr9hvEOcWs6to/vDKtn1wWYkTyqP8y5gqiCv4GiAdKAYUNT
 6Sntz0bGPeHCnP0nGFpB4dwlGeGX2MnDWP/nKiDtFHJZUPo3ghxbB1LLp
 mJYb+rO4k68W+Dgg4qwFnxJmhx76PZdeulVFDuaMGHfDUkObWwOeXm8PA
 hlQILgSoOrcSjDe0yPzILTpYqmdebF8yeHKMW10IhAV4CSj3AHihWHKjP
 G2W5iqtcSTV8U9eLlv75BIgwEJ5vvwc+SpUCcLVx7NWxZM03YEMbEy1cz
 0i1sTxJo/+0jWAqYyTVqirU2MSMymLcZpBnXm9WHQN1G9H8rvAXG9aX8s Q==;
X-CSE-ConnectionGUID: 63Ro0dWNTAy5h9RGjgLLAw==
X-CSE-MsgGUID: xe3V86jdTyCE+dZX+SVvzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="21661350"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="21661350"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 08:27:00 -0800
X-CSE-ConnectionGUID: PF6npAE7Su+/9YiI+AMhcA==
X-CSE-MsgGUID: Am1fQitaQ3W0H0TDanKX4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99596943"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.77])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 08:26:59 -0800
Date: Mon, 9 Dec 2024 08:26:52 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: intel-xe@lists.freedesktop.org, niranjana.vishwanathapura@intel.com
Subject: Re: [PATCH 2/2] drm/xe: make change ccs_mode a synchronous action
Message-ID: <e53cytk6v57vw3xcuhwwc7nncseg33q73tmyox46r6zwhwvaev@guigup4rn5x5>
References: <20241209141210.1311374-1-maciej.patelczyk@intel.com>
 <20241209141210.1311374-3-maciej.patelczyk@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241209141210.1311374-3-maciej.patelczyk@intel.com>
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

On Mon, Dec 09, 2024 at 03:12:10PM +0100, Maciej Patelczyk wrote:
>If ccs_mode is being modified via
>   /sys/class/drm/cardX/device/tileY/gtY/ccs_mode
>the asynchronous reset is triggered and the write returns immediately.
>
>With that some test receive false information about number of CCS engines
>or even fail if they proceed without delay after changing the ccs_mode.
>
>Changing the ccs_mode change from async to sync to prevent failures in
>tests.
>
>Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>index b6adfb9f2030..8d02ec3f7d12 100644
>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>@@ -115,7 +115,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
> 	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
> 	struct xe_device *xe = gt_to_xe(gt);
> 	u32 num_engines, num_slices;
>-	int ret;
>+	int mode_changed = 0, ret;
>
> 	if (IS_SRIOV(xe)) {
> 		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
>@@ -151,10 +151,14 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
> 		gt->ccs_mode = num_engines;
> 		xe_gt_record_user_engines(gt);
> 		xe_gt_reset_async(gt);
>+		mode_changed = 1;

I think this can simply be the sync version. We don't want to allow new
clients being created while this reset is taking place, which is what
the mutex below is protecting against. 

Lucas De Marchi

> 	}
>
> 	mutex_unlock(&xe->drm.filelist_mutex);
>
>+	if (mode_changed)
>+		xe_gt_reset_wait(gt);
>+
> 	return count;
> }
>
>-- 
>2.43.0
>
