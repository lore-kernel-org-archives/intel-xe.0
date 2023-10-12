Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71178CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 09:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C7610E47F;
	Thu, 12 Oct 2023 09:45:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01EB10E47F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 09:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697103917; x=1728639917;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=w+czeXXejv9N9E4wgGD6d4OvQwU1oZP36BlVjRmWnpc=;
 b=UXc8JswclQInikqi7RTiG4pifpR8b1fWFJbKh3WJkKXgODIF8wlZF3mq
 uIW/z5mJd+kxN7/9AaG6dBr3l0sj+WTuZpiAJ5+acmPr4tdY9mjajWsvw
 OGy1lVE2u+DioItLASiUFCxhEcB3T4iMRuNWZq7ImDse02vP2a7VUqFFQ
 seDjjNDhdcKlw3XWpbivc9250vYSUQ2iozcQ58UHJiTx1FQhJRprtL17c
 OUsyDjc/2ALOSvtfRwpBNx/VC3n9pJ/pMI2nw7dFaVuNCqVtzaZWV2LUS
 yUQXFaiSWZBFZgmM4t5lydNFSzzsfPt7YfOppLV584SFZoVkde6pb7sL2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="388740998"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="388740998"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 02:45:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="704093353"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="704093353"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga003.jf.intel.com with ESMTP; 12 Oct 2023 02:45:15 -0700
Received: from [10.249.135.71] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.135.71])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B0B8D332B6;
 Thu, 12 Oct 2023 10:45:14 +0100 (IST)
Message-ID: <c8a4468f-91f4-efa1-fdff-f61b09b5ba4d@intel.com>
Date: Thu, 12 Oct 2023 11:45:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
References: <20230823050955.1226024-1-riana.tauro@intel.com>
 <20230823050955.1226024-2-riana.tauro@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230823050955.1226024-2-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 1/2] RFC drm/xe: Disable ctb communication
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



On 23.08.2023 07:09, Riana Tauro wrote:
> During Runtime suspend, GuC is reset for both D0->D3hot/D3Cold
> transistions. It is not necessary for GuC to reset for D0 -> D3hot,

typo

> only enable/disable ctb communication.
> 
> Modify the existing ct disable function to send a request
> to disable ct communication if firmware is running.
> Add a function to disable guc communication.

s/ctb/CTB
s/ct/CT
s/guc/GuC

> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c    | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_guc.h    |  1 +
>  drivers/gpu/drm/xe/xe_guc_ct.c | 11 ++++++++++-
>  drivers/gpu/drm/xe/xe_guc_ct.h |  2 +-
>  4 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 2493c5859948..3e4c00bee6bf 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -557,6 +557,21 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>  	return 0;
>  }
>  
> +int xe_guc_disable_communication(struct xe_guc *guc)
> +{
> +	int err;
> +	struct xe_guc_ct *ct = &guc->ct;
> +
> +	err = xe_guc_ct_disable(ct);
> +	if (err)
> +		return err;


> +
> +	/* Check for messages received during/after the CT disable */
> +	guc_handle_mmio_msg(guc);

are you sure that we need this ?

> +
> +	return 0;
> +}
> +
>  int xe_guc_suspend(struct xe_guc *guc)
>  {
>  	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 3addd8fc674a..18cf5d02eea7 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -18,6 +18,7 @@ int xe_guc_post_load_init(struct xe_guc *guc);
>  int xe_guc_reset(struct xe_guc *guc);
>  int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> +int xe_guc_disable_communication(struct xe_guc *guc);
>  int xe_guc_enable_communication(struct xe_guc *guc);
>  int xe_guc_suspend(struct xe_guc *guc);
>  void xe_guc_notify(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 59136b6a7c6f..64c2029b2752 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -21,6 +21,7 @@
>  #include "xe_map.h"
>  #include "xe_pm.h"
>  #include "xe_trace.h"
> +#include "xe_uc_fw.h"
>  
>  /* Used when a CT send wants to block and / or receive data */
>  struct g2h_fence {
> @@ -319,15 +320,23 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	return err;
>  }
>  
> -void xe_guc_ct_disable(struct xe_guc_ct *ct)
> +int xe_guc_ct_disable(struct xe_guc_ct *ct)
>  {
> +	struct xe_guc *guc = ct_to_guc(ct);
> +	int ret = 0;
> +
>  	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
>  	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
>  	ct->enabled = false; /* Finally disable CT communication */
>  	spin_unlock_irq(&ct->fast_lock);
>  	mutex_unlock(&ct->lock);
>  
> +	if (xe_uc_fw_is_running(&guc->fw))

nit: maybe there should be a wrapper for this like:

	bool xe_guc_is_running(xe_guc *guc) { ... }

> +		ret = guc_ct_control_toggle(ct, false);

do we have a plan what to do when this CTB toggle fails?
and what it really means for the caller if it receives an error?

> +
>  	xa_destroy(&ct->fence_lookup);
> +
> +	return ret;
>  }
>  
>  static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index f15f8a4857e0..1ad150c19ae3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -12,7 +12,7 @@ struct drm_printer;
>  
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
> -void xe_guc_ct_disable(struct xe_guc_ct *ct);
> +int xe_guc_ct_disable(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
>  struct xe_guc_ct_snapshot *
