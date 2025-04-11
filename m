Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68407C36010
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 15:34:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B90410E098;
	Fri, 11 Apr 2025 15:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DgV27di1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5D410E098
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 15:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744385655; x=1775921655;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=MCQRHYBABYEaNrsJEGF/A7VVwa0tjVDgt8Hxp90cPek=;
 b=DgV27di1hW9s61UAOtCl4nt6bwh8PKdOgzxCSiaykQy5XagTCrvXoZ4k
 C5x5AZSrKDrWgaJQ23LX31hgPtlo0slzjx5EaB5YaTW9QbiOPtbdoGJZ9
 IAWxLxGvdAMp+DKpSoDJzbsYOOBV29MQ5jhi0Sc4aikGaMBLVo6NXE083
 Wlxezi3vlA5+2aB4i2Dytbe4MzGfqJsgIlzD6I1I95F1vVNqS8eksWHJh
 5TZ2DB/HejPrxhX87ryEF8Ijwfl0OfORXaIQRRMrD5qr3wCbrDpvf45uF
 /Jcu8WiJ+e9flJ79tkru4jNWph73ddyD9A1qwd6339eZtHTqehR4IgEnI Q==;
X-CSE-ConnectionGUID: f0uq1Wk6S3agM3QiUbyVgg==
X-CSE-MsgGUID: ogutibkCSP26JbgG7moKkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="46069861"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="46069861"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 08:34:14 -0700
X-CSE-ConnectionGUID: RUELmKryTV2j/la60CRSWw==
X-CSE-MsgGUID: 40isWiavR0ejPgwZSYVy2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="134381961"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 11 Apr 2025 08:34:13 -0700
Received: from [10.245.96.73] (mwajdecz-MOBL.ger.corp.intel.com [10.245.96.73])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3FE3B3493D;
 Fri, 11 Apr 2025 16:34:12 +0100 (IST)
Message-ID: <95d22c4d-73b5-47d8-b619-ed466ee0741b@intel.com>
Date: Fri, 11 Apr 2025 17:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/xe/guc: Add new debugfs entry for lfd format
 output
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
References: <20250410155853.574830-1-zhanjun.dong@intel.com>
 <20250410155853.574830-3-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250410155853.574830-3-zhanjun.dong@intel.com>
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



On 10.04.2025 17:58, Zhanjun Dong wrote:
> Add new debugfs entry "guc_log_lfd", prepared for output guc log
> in LFD(Log Format Descriptors) format.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_debugfs.c | 14 ++++++++++++
>  drivers/gpu/drm/xe/xe_guc_log.c     | 34 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_log.h     |  1 +
>  3 files changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> index c569ff456e74..6449c9a69b8a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> @@ -48,6 +48,19 @@ static int guc_log(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int guc_log_lfd(struct seq_file *m, void *data)

this needs to be rebased due to commit e15826bb3c2c ("drm/xe/guc:
Refactor GuC debugfs initialization")

and placed in the pf_only[]

> +{
> +	struct xe_guc *guc = node_to_guc(m->private);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	xe_pm_runtime_get(xe);
> +	xe_guc_log_print_lfd(&guc->log, &p);
> +	xe_pm_runtime_put(xe);
> +
> +	return 0;
> +}
> +
>  static int guc_log_dmesg(struct seq_file *m, void *data)
>  {
>  	struct xe_guc *guc = node_to_guc(m->private);
> @@ -89,6 +102,7 @@ static int guc_pc(struct seq_file *m, void *data)
>  static const struct drm_info_list debugfs_list[] = {
>  	{"guc_info", guc_info, 0},
>  	{"guc_log", guc_log, 0},
> +	{"guc_log_lfd", guc_log_lfd, 0},
>  	{"guc_log_dmesg", guc_log_dmesg, 0},
>  	{"guc_ctb", guc_ctb, 0},
>  	{"guc_pc", guc_pc, 0},
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 38039c411387..df849a0ee7e5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -216,6 +216,26 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>  	}
>  }
>  
> +static void
> +xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
> +			      struct xe_guc_log *log)
> +{
> +	size_t remain;
> +	int i;
> +
> +	if (!snapshot)
> +		return;
> +
> +	remain = snapshot->size;
> +	for (i = 0; i < snapshot->num_chunks; i++) {
> +		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
> +
> +		/* To be add: Output snapshot in LFD format */

what's the point in adding debugfs entry without implementation?

add required function(s) and only *then* extend debugfs

> +
> +		remain -= size;
> +	}
> +}
> +
>  /**
>   * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
>   * @log: GuC log structure
> @@ -251,6 +271,20 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>  	xe_guc_log_snapshot_free(snapshot);
>  }
>  
> +/**
> + * xe_guc_log_print_lfd - dump a copy of the GuC log to some useful location

s/to some useful location/to the drm_printer

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

