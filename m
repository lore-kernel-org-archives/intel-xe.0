Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2552AC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 15:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C8710E886;
	Thu, 25 Jul 2024 15:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hj3RN43R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A04410E886
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 15:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721922552; x=1753458552;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tW+4VT+6gBPQty3GRCtNv+PpyUCmvCI4U+lIrcUpkas=;
 b=Hj3RN43RbRYP8jZcbOmOJ0t/uwfzxBnbyyWFSr0UweLzQASO8A8MtMSQ
 lHJLCDJZJ9Rj64aTKRLoJXcoW5U+FSRI8nsaCmEtftn37vNLEfYWUufE/
 oct1daHqV4mGib79M/4BnGMkMyusOK/w20GX48VT1ioJoK66ndh1FhGnn
 0HjeLaZ2PvDzWFf4sQtWgh9NAJSfMsLlUmwj46F3GIsOQvGAzAqmqy/Gy
 a/12m7Z0nMRBmyptPJGMsWWKRfvFavSHAfJp/Hn6JxgIf1pzOAeDXdRxz
 4DkHnEC+xWSUbvUcMhQf0XgcHjsJZH0Gaq6xmqeOLzGg/daHP95/x/l+t g==;
X-CSE-ConnectionGUID: fN1yLJQzR7aJfD8WKQVUkg==
X-CSE-MsgGUID: IeYCBCPbSuO+zvMmyXJdNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19807556"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="19807556"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 08:48:39 -0700
X-CSE-ConnectionGUID: FiggR2TBRkGYhrLcqxn9yg==
X-CSE-MsgGUID: 2OKyMIubTgW/srl+kszppw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="58111385"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 25 Jul 2024 08:48:36 -0700
Received: from [10.245.82.99] (mwajdecz-MOBL.ger.corp.intel.com [10.245.82.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7CDCB28785;
 Thu, 25 Jul 2024 16:48:35 +0100 (IST)
Message-ID: <ce58c4bb-ab8b-4b29-b291-3b46a24c27d2@intel.com>
Date: Thu, 25 Jul 2024 17:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] drm/xe: Implement APIs for measuring various
 events
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20240725150550.13085-1-nirmoy.das@intel.com>
 <20240725150550.13085-2-nirmoy.das@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240725150550.13085-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 25.07.2024 17:05, Nirmoy Das wrote:
> Introduces a set of APIs for tracking and managing events.
> This currently only supports counters.
> 
> This can be conditionally enabled with the CONFIG_DRM_XE_STATS
> config option.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig.debug |  11 +++
>  drivers/gpu/drm/xe/Makefile      |   1 +
>  drivers/gpu/drm/xe/xe_stats.c    | 145 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_stats.h    |  66 ++++++++++++++
>  4 files changed, 223 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_stats.c
>  create mode 100644 drivers/gpu/drm/xe/xe_stats.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index bc177368af6c..4db6d707c1af 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -94,3 +94,14 @@ config DRM_XE_USERPTR_INVAL_INJECT
>  
>  	 Recomended for driver developers only.
>  	 If in doubt, say "N".
> +
> +config DRM_XE_STATS
> +	bool "Enable XE statistics"
> +	default n
> +	help
> +	  Choose this option to enable support for collecting and
> +	  displaying XE statistics as debugfs.
> +
> +	  Recommended for driver developers only.
> +
> +	  If in doubt, say "N".
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1ff9602a52f6..c5d9ec22c6bf 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>  	xe_wopcm.o
>  
>  xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
> +xe-$(CONFIG_DRM_XE_STATS) += xe_stats.o
>  
>  # graphics hardware monitoring (HWMON) support
>  xe-$(CONFIG_HWMON) += xe_hwmon.o
> diff --git a/drivers/gpu/drm/xe/xe_stats.c b/drivers/gpu/drm/xe/xe_stats.c
> new file mode 100644
> index 000000000000..1b8910900fd3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_stats.c
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +#include <linux/slab.h>
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +
> +#include "xe_stats.h"
> +
> +#ifdef CONFIG_DRM_XE_STATS
> +static struct xe_stats_entry *find_stats_entry(struct xe_stats *stats, const char *name)
> +{
> +	struct xe_stats_entry *stats_entry;
> +
> +	list_for_each_entry(stats_entry, &stats->entries, list) {
> +		if (strcmp(stats_entry->name, name) == 0)
> +			return stats_entry;

hmm, this seems to be very costly and likely will not scale well once we
would like to add more counters

can't we just use CONFIG_DRM_XE_STATS to hide different stats structures
provide nop variants of the helpers that would update them ?

> +	}
> +
> +	return NULL;
> +}
> +
> +static int stats_show(struct seq_file *m, void *v)
> +{
> +	struct xe_stats_entry *entry = m->private;
> +
> +	if (entry && !entry->enabled)
> +		return 0;
> +
> +	switch (entry->type) {
> +	case XE_STATS_TYPE_COUNTER:
> +		seq_printf(m, "%s: Counter value: %llu\n", entry->name,
> +			   atomic64_read(&entry->data.counter.value));
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int stats_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, stats_show, inode->i_private);
> +}
> +
> +static const struct file_operations stats_fops = {
> +	.owner   = THIS_MODULE,
> +	.open    = stats_open,
> +	.read    = seq_read,
> +	.release = single_release,
> +};
> +
> +struct xe_stats *xe_stats_init(struct drm_device *drm, struct dentry *parent)
> +{
> +	struct xe_stats *stats;
> +
> +	stats = drmm_kzalloc(drm, sizeof(*stats), GFP_KERNEL);
> +	if (!stats) {
> +		drm_err(drm, "Failed to allocate memory for xe_stats\n");
> +		return NULL;
> +	}
> +
> +	stats->drm = drm;
> +	INIT_LIST_HEAD(&stats->entries);
> +
> +	stats->debugfs_entry = debugfs_create_dir("stats", parent);
> +	if (!stats->debugfs_entry) {
> +		drm_err(drm, "Failed to create stats debugfs directory\n");
> +		return NULL;
> +	}
> +
> +	return stats;
> +}
> +
> +void xe_stats_add_entry(struct xe_stats *stats, const char *name, enum xe_stats_type type)
> +{
> +	struct xe_stats_entry *entry;
> +	struct dentry *debugfs_entry;
> +
> +	if (!stats || !name)
> +		return;
> +
> +	entry = drmm_kzalloc(stats->drm, sizeof(*entry), GFP_KERNEL);
> +	if (!entry)
> +		return;
> +
> +	entry->name = drmm_kstrdup(stats->drm, name, GFP_KERNEL);
> +	if (!entry->name)
> +		return;
> +
> +	entry->type = type;
> +	entry->enabled = true;
> +
> +	switch (type) {
> +	case XE_STATS_TYPE_COUNTER:
> +		atomic64_set(&entry->data.counter.value, 0);
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	list_add(&entry->list, &stats->entries);
> +
> +	debugfs_entry = debugfs_create_file(name, 0444, stats->debugfs_entry, entry, &stats_fops);
> +	if (!debugfs_entry) {
> +		drm_err(stats->drm, "Failed to create stats debugfs file for %s\n", name);
> +		list_del(&entry->list);
> +		return;
> +	}
> +
> +	entry->dentry = debugfs_entry;
> +}
> +
> +void xe_stats_increment_counter(struct xe_stats *stats, const char *name)
> +{
> +	struct xe_stats_entry *entry;
> +
> +	if (!stats || !name)
> +		return;
> +
> +	entry = find_stats_entry(stats, name);
> +	if (entry && entry->type == XE_STATS_TYPE_COUNTER && entry->enabled)
> +		atomic64_inc(&entry->data.counter.value);
> +}
> +
> +void xe_stats_decrement_counter(struct xe_stats *stats, const char *name)
> +{
> +	struct xe_stats_entry *entry;
> +
> +	if (!stats || !name)
> +		return;
> +
> +	entry = find_stats_entry(stats, name);
> +	if (entry && entry->type == XE_STATS_TYPE_COUNTER && entry->enabled)
> +		atomic64_dec(&entry->data.counter.value);
> +}
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_stats.h b/drivers/gpu/drm/xe/xe_stats.h
> new file mode 100644
> index 000000000000..dba79ae28714
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_stats.h
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +#ifndef _XE_STATS_H_
> +#define _XE_STATS_H_
> +
> +#include <linux/atomic.h>
> +#include <linux/debugfs.h>
> +#include <linux/list.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +
> +#include <drm/drm_print.h>
> +
> +struct drm_device;
> +
> +enum xe_stats_type {
> +	XE_STATS_TYPE_COUNTER,
> +};
> +
> +#ifdef CONFIG_DRM_XE_STATS
> +struct xe_stats_entry {
> +	const char *name;
> +	enum xe_stats_type type;
> +	bool enabled;
> +	union {
> +		struct {
> +			atomic64_t value;
> +		} counter;
> +	} data;
> +	struct list_head list;
> +	struct dentry *dentry;
> +};
> +
> +struct xe_stats {
> +	struct dentry *debugfs_entry;
> +	struct list_head entries;
> +	struct drm_device *drm;
> +};
> +
> +struct xe_stats *xe_stats_init(struct drm_device *drm, struct dentry *parent);
> +void xe_stats_add_entry(struct xe_stats *stats, const char *name, enum xe_stats_type type);
> +void xe_stats_increment_counter(struct xe_stats *c, const char *name);
> +void xe_stats_decrement_counter(struct xe_stats *stats, const char *name);
> +
> +#else /* CONFIG_DRM_XE_STATS not defined */
> +struct xe_stats;
> +
> +static inline struct xe_stats *
> +xe_stats_init(struct drm_device *drm, struct dentry *parent)
> +{
> +	return NULL;
> +}
> +
> +static inline void
> +xe_stats_add_entry(struct xe_stats *stats, const char *name, enum xe_stats_type type) { }
> +static inline void
> +xe_stats_increment_counter(struct xe_stats *stats, const char *name) { }
> +static inline void
> +xe_stats_decrement_counter(struct xe_stats *stats, const char *name) { }
> +
> +#endif /* CONFIG_DRM_XE_STATS */
> +
> +#endif /* _XE_STATS_H_ */
> +
