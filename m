Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DC6C369B1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 09:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79AB10E8AA;
	Wed, 16 Apr 2025 09:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FAWLuqgd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CA810E8AA
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 09:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744795613; x=1776331613;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hDDU6wjIdwesuub38lEeoI1lfL1tsSsL5B0fnbIu3c4=;
 b=FAWLuqgdVJ4Gs9iF6MNvR9d4UJtEKNAPt4yOvhkW67O/XDJVlQVRRjZw
 wH8JDKNVAGxjHi0F3/S7cFx1efI+RfWeQOFpPBNu4HPAcjQAV8TioJ71a
 W+sr0oIlfkG5gfOEVWFjqMsgUPIP7Ot708Ut4h3gbpvMd2veG6oR7Ifjv
 PkQFxkGEZIpOlyLgb/7/LPW/j3ZrHUkS4YdDjJ1X0sOq0iwJXG9aZwXvE
 FPBgnYetXx1IWxlZi1eb4jIUwqZSTy2w0m1HnmmkWko2gEoWXZoIByBcm
 8129Z9wtc3DDQSO7sDRwA6odOuF/MrqYfwfzssmzPNikDQdy3l9NOaW1+ A==;
X-CSE-ConnectionGUID: WPxy87NBSS+uwUiwnEsaWQ==
X-CSE-MsgGUID: eMfQgf7HTWqVvEED0Q+RTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46215804"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="46215804"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 02:26:53 -0700
X-CSE-ConnectionGUID: 5fa7tDBRRpK1PfJeoOERiA==
X-CSE-MsgGUID: Y5mlbiwSTVufax79Q/NCwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="161360979"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.248.61])
 ([10.247.248.61])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 02:26:50 -0700
Message-ID: <3b0d279d-2543-4b3f-9e6b-c572a934fdda@linux.intel.com>
Date: Wed, 16 Apr 2025 14:56:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_pmu: Add a null check for xe gt
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com
References: <20250416060531.2454332-1-riana.tauro@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20250416060531.2454332-1-riana.tauro@intel.com>
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


On 16-04-2025 11:35, Riana Tauro wrote:
> The PMU initialization function exits if gt is invalid,
> eliminating the need for additional checks. However, absence
> of these checks causes static analysis tool warnings
>
> Add a null check for gt to avoid static analysis tool warnings
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pmu.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index 69df0e3520a5..5550ed30018f 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -141,6 +141,8 @@ static bool event_gt_forcewake(struct perf_event *event)
>  		return true;
>  
>  	gt = xe_device_get_gt(xe, config_to_gt_id(config));
> +	if (!gt)
> +		return false;

this looks fine, but I doubt if we will reach to this stage if wrong GT
is passed, it shall fail at this
check event_supported(pmu, gt, id)

same should be the case for below as well, non supported even't would
fail the event init so it should not
reach to xe_pmu_event_destroy.

but having said that i doubt if xe_device_get_gt would ever return NULL,
as that would mean primary_gt or media_gt
failed intialization, if it happens the driver would fail in load,
wouldn't come to this stage.

Thanks,
Aravind.
>  
>  	fw_ref = kzalloc(sizeof(*fw_ref), GFP_KERNEL);
>  	if (!fw_ref)
> @@ -211,11 +213,10 @@ static bool event_param_valid(struct perf_event *event)
>  static void xe_pmu_event_destroy(struct perf_event *event)
>  {
>  	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> -	struct xe_gt *gt;
>  	unsigned int *fw_ref = event->pmu_private;
> +	struct xe_gt *gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
>  
> -	if (fw_ref) {
> -		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
> +	if (fw_ref && gt) {
>  		xe_force_wake_put(gt_to_fw(gt), *fw_ref);
>  		kfree(fw_ref);
>  		event->pmu_private = NULL;
