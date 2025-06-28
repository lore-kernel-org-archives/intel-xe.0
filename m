Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87913C54ED1
	for <intel-xe@archiver.kernel.org>; Sat, 28 Jun 2025 13:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4886610E19A;
	Sat, 28 Jun 2025 13:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffQg0VQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8357D10E19A
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Jun 2025 13:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751116007; x=1782652007;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=yWNsdCSyGYMYFROl2wwRFKpf8srZjBDBAlNsPJ886Qg=;
 b=ffQg0VQNaLwMJAbyCIqE0AgUUmEskTTWNDRX9hqhm7arkAp1VkMvGAtD
 rfytbE8qu24L0tf6qz7N01kyYc1ykwuikNcrB88BfbyQADgN4l+FwT4Ra
 je93bZEp2vVM/Wlh3yNOZwahAAB662RbqR9byoT3WYy4Mfv8A4L5uHFAB
 jZ6PopY5MQh5k83B843wkvXkgKPoX/46o3jV7hHDfDH28Vbo9+lX7ozCx
 qTVe49y6P/CdYvNvBnGWkg9w1+JJ5UFLya5yN4xIa5MGLSlELZCv8T5I7
 dv6v5v/yj+X5cs1zyERct4H4UjUgjHeqA8UJJxFotR4t+RYv21gJv9RA6 Q==;
X-CSE-ConnectionGUID: NtDiCD6GQAerp/XlVe2W7w==
X-CSE-MsgGUID: 7xJ94WT+RUGLqP8bKgu/YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53269219"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; d="scan'208";a="53269219"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2025 06:06:47 -0700
X-CSE-ConnectionGUID: KicIH4fqRmybXlp5AdDkoA==
X-CSE-MsgGUID: W2c3J21QS9am4i5D6bW4tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; d="scan'208";a="152765177"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 28 Jun 2025 06:06:46 -0700
Received: from [10.245.96.176] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.176])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7A43A1258A;
 Sat, 28 Jun 2025 14:06:44 +0100 (IST)
Message-ID: <64c95a41-a6e0-4a9a-b266-bbb44a632581@intel.com>
Date: Sat, 28 Jun 2025 15:06:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] drm/xe/guc: Add new debugfs entry for lfd format
 output
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
References: <20250423215821.3078428-1-zhanjun.dong@intel.com>
 <20250423215821.3078428-4-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250423215821.3078428-4-zhanjun.dong@intel.com>
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



On 23.04.2025 23:58, Zhanjun Dong wrote:
> Add new debugfs entry "guc_log_lfd", prepared for output guc log
> in LFD(Log Format Descriptors) format.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_debugfs.c |  7 ++++
>  drivers/gpu/drm/xe/xe_guc_log.c     | 52 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_log.h     |  1 +
>  3 files changed, 60 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> index f33013f8a0f3..a441c5775ca3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> @@ -85,6 +85,12 @@ static int guc_log(struct xe_guc *guc, struct drm_printer *p)
>  	return 0;
>  }
>  
> +static int guc_log_lfd(struct xe_guc *guc, struct drm_printer *p)
> +{
> +	xe_guc_log_print_lfd(&guc->log, p);
> +	return 0;
> +}
> +
>  static int guc_log_dmesg(struct xe_guc *guc, struct drm_printer *p)
>  {
>  	xe_guc_log_print_dmesg(&guc->log);
> @@ -116,6 +122,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>  /* everything else should be added here */
>  static const struct drm_info_list pf_only_debugfs_list[] = {
>  	{ "guc_log", .show = guc_debugfs_show, .data = guc_log },
> +	{ "guc_log_lfd", .show = guc_debugfs_show, .data = guc_log_lfd },
>  	{ "guc_log_dmesg", .show = guc_debugfs_show, .data = guc_log_dmesg },
>  	{ "guc_pc", .show = guc_debugfs_show, .data = guc_pc },
>  };
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 38039c411387..e362e407f6d5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -9,6 +9,7 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "abi/guc_log_lfd_abi.h"
>  #include "regs/xe_guc_regs.h"
>  #include "xe_bo.h"
>  #include "xe_devcoredump.h"
> @@ -19,6 +20,14 @@
>  #include "xe_mmio.h"
>  #include "xe_module.h"
>  
> +static const struct guc_logfile_header default_guc_logfile_header = {
> +	.magic = LFD_DRIVER_KEY_STREAMING,
> +	.version.dw0 = FIELD_PREP_CONST(GUC_LOGFILE_FMT_VER_MINOR_VERSION,
> +					GUC_LOG_FILE_FORMAT_VERSION_MINOR) |
> +		       FIELD_PREP_CONST(GUC_LOGFILE_FMT_VER_MAJOR_VERSION,
> +					GUC_LOG_FILE_FORMAT_VERSION_MAJOR)
> +};
> +
>  static struct xe_guc *
>  log_to_guc(struct xe_guc_log *log)
>  {
> @@ -216,6 +225,35 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>  	}
>  }
>  
> +static void
> +xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
> +			      struct xe_guc_log *log)

'log' - unused ?

> +{
> +	char *lfd_buf;
> +	int index;

size_t or drop it completely

> +
> +	if (!snapshot || !snapshot->size)
> +		return;
> +
> +	/* Alloc lfd buffer in fixed size */

s/lfd/LFD to be consistent with your comment below

> +	lfd_buf = kzalloc(GUC_LOG_CHUNK_SIZE, GFP_KERNEL);
> +	if (!lfd_buf) {
> +		index = -ENOMEM;
> +		goto lfd_out;

just exit here?

> +	}
> +
> +	/* Fill LFD file header */
> +	memcpy(lfd_buf, &default_guc_logfile_header, sizeof(default_guc_logfile_header));

hmm, why exactly we need to copy this ?
can't we just print directly from default_guc_logfile_header ?

and what's the goal of printing just empty lfd buffer?
add some explanation in the commit message

> +	index = offsetof(struct guc_logfile_header, lfd_stream);
> +	xe_print_blob_ascii85(p, "[LOG].data", 0, lfd_buf, 0, (size_t)index);
> +
> +lfd_out:
> +	drm_printf(p, "\n");
> +	if (index < 0)
> +		drm_printf(p, "ERROR: Out of memory\n");

shouldn't this be in some common format, like:

	"[LOG].error = %pe", ERR_PTR(-ENOMEM)

> +	kfree(lfd_buf);
> +}
> +
>  /**
>   * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
>   * @log: GuC log structure
> @@ -251,6 +289,20 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>  	xe_guc_log_snapshot_free(snapshot);
>  }
>  
> +/**
> + * xe_guc_log_print_lfd - dump a copy of the GuC log to some useful location
> + * @log: GuC log structure
> + * @p: the printer object to output to
> + */
> +void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p)
> +{
> +	struct xe_guc_log_snapshot *snapshot;
> +
> +	snapshot = xe_guc_log_snapshot_capture(log, false);
> +	xe_guc_log_snapshot_print_lfd(snapshot, p, log);
> +	xe_guc_log_snapshot_free(snapshot);
> +}
> +
>  int xe_guc_log_init(struct xe_guc_log *log)
>  {
>  	struct xe_device *xe = log_to_xe(log);
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index 5b896f5fafaf..37ff4d11e6cf 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -40,6 +40,7 @@ struct xe_device;
>  
>  int xe_guc_log_init(struct xe_guc_log *log);
>  void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
> +void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
>  void xe_guc_log_print_dmesg(struct xe_guc_log *log);
>  struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
>  void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);

