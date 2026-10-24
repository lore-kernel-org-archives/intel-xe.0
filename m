Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D59606A31A
	for <intel-xe@archiver.kernel.org>; Sat, 24 Oct 2026 11:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KbuXv7Bb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5020510E02D;
	Sat, 24 Oct 2026 11:50:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC64910E02D
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Oct 2026 11:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792842608; x=1824378608;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tPCKnPy+eF4WPc6JRGdKjS3Gg7mWUzDhYN9mO58Uihs=;
 b=KbuXv7BbsJzx/KKsKkXnkm4t3NVhNzV7WEcTEik5UxJy1TkuD+JY/GcO
 9UrcVXIbks97gZE487g3pwf9V0om8baRXC7Kq/rsNunmkw9PHD8/P4u/C
 tNNXbepMGWu5AMeqB+InC2z2QaB8egSKVNTZp/3AtaFnCe+XQ0ttWHQFG
 e6O2v2FhcBogj00MXgSyl/aP0g1HY+ewLcENxdz8cs6L4uryRMjTAIBHn
 LEJARGbD49GExvuOXzF/MIw4JYB08U3KUKrYsjqS+GhLZuqvkSJXTc4Cw
 BU9HWRH/wgrAvuJbDsLBp3cQ66PxrCB7EpETTmNqTusg3jSMfPtzr+iMl w==;
X-CSE-ConnectionGUID: fOCZeoAWR+KHfvuSUuLrQQ==
X-CSE-MsgGUID: EUFiomgIQR+LYXkiVbVqxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1589813"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1589813"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2026 04:50:08 -0700
X-CSE-ConnectionGUID: imGeifetTsmohz/uuUsN6A==
X-CSE-MsgGUID: iC+t5GLjQqq+6YPg2flDhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="3973174"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2026 04:50:06 -0700
Date: Sat, 24 Oct 2026 13:50:02 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: Re: [PATCH v5 02/13] drm/xe/cper: Retrieve the error counter record
 for CPER reporting
Message-ID: <atybarbbRa93Upzw@black.igk.intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
 <20261023043422.681260-17-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023043422.681260-17-badal.nilawar@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 10:04:24AM +0530, Badal Nilawar wrote:
> Retrieve error counter record required to build a CPER record.
> 
> Assisted-by: LLM
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v5:
>   - Retain get_counter() (Raag)
> v4:
>   - Drop redundant xe_ras_counter_is_valid() check (Raag)
>   - Add might_sleep() to assert that the caller is in a sleepable
>     context (sashiko)
>   - Add xe_device_assert_mem_access() to assert the outer runtime PM
>     wake reference requirement (sashiko)
> ---
>  drivers/gpu/drm/xe/xe_cper.c | 14 ++++++++++-
>  drivers/gpu/drm/xe/xe_ras.c  | 47 +++++++++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_ras.h  |  2 ++
>  3 files changed, 51 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index 8b52752c067f..a9044e708cac 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -4,10 +4,13 @@
>   */
>  
>  #include <linux/err.h>
> +#include <linux/kernel.h>
>  #include <linux/minmax.h>
>  
>  #include "xe_cper.h"
>  #include "xe_device.h"
> +#include "xe_printk.h"
> +#include "xe_ras.h"
>  #include "xe_ras_types.h"
>  
>  static bool is_hw_sigid(enum xe_sigid sigid)
> @@ -18,7 +21,16 @@ static bool is_hw_sigid(enum xe_sigid sigid)
>  static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>  			     const struct xe_ras_error_class *counter)
>  {
> -	/* TODO */
> +	struct xe_ras_get_counter_response response = {};
> +
> +	/* Fetching the counter sends a sysctrl command */
> +	might_sleep();
> +	xe_device_assert_mem_access(xe);
> +
> +	if (xe_ras_get_counter_response(xe, counter, &response)) {
> +		xe_err(xe, "CPER: failed to get counter, skipping record\n");
> +		return;
> +	}
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index db3cbc186a51..1da523c6e84c 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -528,8 +528,7 @@ static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component
>  {
>  	struct xe_ras_error_class counter = {0};
>  	u8 drm_severity, drm_component;
> -	u32 value;
> -	int ret;
> +	u32 value; int ret;

Redundant churn, shouldn't be in this patch.

>  	counter.common.severity = severity;
>  	counter.common.component = component;
> @@ -676,19 +675,46 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>  	}
>  }
>  
> -static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value)
> +static int get_counter(struct xe_device *xe,
> +		       struct xe_ras_error_class *counter,
> +		       u32 *value)

Why the wrapping? What changed?

> +{
> +	struct xe_ras_get_counter_response response = {};
> +	int ret;
> +
> +	ret = xe_ras_get_counter_response(xe, counter, &response);
> +	if (ret)
> +		return ret;
> +
> +	*value = response.value;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_ras_get_counter_response() - Get error counter record
> + * @xe: Xe device instance
> + * @counter: RAS error class
> + * @out: Counter record retrieved
> + *
> + * Retrieve the counter record of a specific error class from firmware.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
> +				struct xe_ras_get_counter_response *out)

'response'

>  {
> -	struct xe_ras_get_counter_response response = {0};
>  	struct xe_ras_get_counter_request request = {0};
>  	struct xe_sysctrl_mailbox_command command = {0};
>  	struct xe_ras_error_common *common;
>  	size_t rlen;
>  	int ret;
>  
> +	memset(out, 0, sizeof(*out));

I think I've already mentioned to drop this in the previous rev[1].

[1] https://lore.kernel.org/intel-xe/asyjSMUDo0XMX-U4@black.igk.intel.com/

Raag

>  	request.counter = *counter;
>  
>  	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_COUNTER,
> -				  &request, sizeof(request), &response, sizeof(response));
> +				  &request, sizeof(request), out, sizeof(*out));
>  
>  	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>  	if (ret) {
> @@ -696,19 +722,18 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
>  		return ret;
>  	}
>  
> -	if (rlen != sizeof(response)) {
> +	if (rlen != sizeof(*out)) {
>  		xe_err(xe, "sysctrl: unexpected get counter response length %zu (expected %zu)\n",
> -		       rlen, sizeof(response));
> +		       rlen, sizeof(*out));
>  		return -EIO;
>  	}
>  
> -	if (!ras_counter_is_valid(xe, &response.counter))
> +	if (!ras_counter_is_valid(xe, &out->counter))
>  		return -EBADMSG;
>  
> -	common = &response.counter.common;
> -	*value = response.value;
> +	common = &out->counter.common;
>  
> -	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", *value, comp_to_str(common->component),
> +	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", out->value, comp_to_str(common->component),
>  	       sev_to_str(common->severity));
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index 1b358c7d040f..c736d5a01c47 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -23,5 +23,7 @@ int xe_ras_init(struct xe_device *xe);
>  enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
>  bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
>  u32 xe_ras_get_max_pages(struct xe_device *xe);
> +int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
> +				struct xe_ras_get_counter_response *out);
>  
>  #endif
> -- 
> 2.54.0
> 
