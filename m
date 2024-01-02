Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16DAC46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 16:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C62E10E0CE;
	Tue,  2 Jan 2024 16:27:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FB510E0CE
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 16:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704212858; x=1735748858;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1ezJ+uzGW9YCGi7fXtbEyfpQvzMR6Egojg2hylzdkh4=;
 b=E/Ye/ryI0DzyqMC7YBpMYPkLIJLqAx6RQlBf+Ms1RZ+4t2Eq2GQ2yKSy
 ynyOshGnIb8JEmC+vL/LDCI3smpx+wrTNU4MJgoE7gGAeaUt6Bxv2oj3v
 8z/9e/VEfhMFJdhBsb6OmLcNszdtCLV6qHUPi7GNazX53HbRsbesYZMYT
 y1b8H51uycNu/CbpeqgdRCJ0Eh3TADh3Id0aIpwMBxP9ranfXVCsn6ZPm
 3dRZnS+yxG45k3OhqapicZ61+osIWOxXzpVv4kd0Glws78Mtdo8PAf/SX
 7fjj1p6GCeddSBj4N1x9nbGBNChq0eGUcjDJ0RKBaJyjOT9VqgXK8ITwS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="483078716"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="483078716"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 08:27:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="779731233"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="779731233"
Received: from dmaryin-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.224])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 08:27:33 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/debugfs: Add support for gt synchronous force reset
In-Reply-To: <20231231144733.568481-1-karthik.poosa@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231231144733.568481-1-karthik.poosa@intel.com>
Date: Tue, 02 Jan 2024 18:27:21 +0200
Message-ID: <87mstn1z12.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Karthik Poosa <karthik.poosa@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sun, 31 Dec 2023, Karthik Poosa <karthik.poosa@intel.com> wrote:
> This support added as igt test freq_reset_multiple fails sporadically
> in case xe_guc_pc is not started.
> A completion is added in force_reset for this.
> Writing non-zero to force_reset debugfs entry does synchronous reset.
>
> v2:
> - Changed wait for completion to interruptible (Anshuman).
> - Moved timeout to xe_gt.h (Anshuman).
> - Created a debugfs for updating timeout (Rodrigo).
>
> v3:
> - Update force_reset debugfs with write support.
>   value 0 -> async reset, non-zero -> sync reset (Matthew Brost).
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c         |  2 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 72 ++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_debugfs.h |  3 ++
>  drivers/gpu/drm/xe/xe_gt_types.h   |  8 ++++
>  4 files changed, 82 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3af2adec1295..c8d2c18b0c62 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -65,6 +65,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>  
>  	gt->tile = tile;
>  	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
> +	init_completion(&gt->reset.done);
>  
>  	return gt;
>  }
> @@ -633,6 +634,7 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	XE_WARN_ON(err);
>  
> +	complete(&gt->reset.done);
>  	xe_gt_info(gt, "reset done\n");
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c4b67cf09f8f..3518ab89ccfc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -55,15 +55,71 @@ static int hw_engines(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> -static int force_reset(struct seq_file *m, void *data)
> +static int force_reset(struct xe_gt *gt, bool is_sync)
>  {
> -	struct xe_gt *gt = node_to_gt(m->private);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	long ret;
>  
>  	xe_gt_reset_async(gt);
>  
> +	if (is_sync) {
> +		drm_info(&xe->drm, "waiting for gt reset completion");

Isn't that a bit excessive? dbg?

Most of your logging does not have the trailing \n. Please add them.

> +		ret = wait_for_completion_interruptible_timeout(&gt->reset.done,
> +							msecs_to_jiffies(gt->reset.timeout_ms));

Indent. Please use checkpatch.

> +		if (ret <= 0) {
> +			drm_err(&xe->drm, "gt reset timed out/interrputed, ret %ld\n", ret);

Typo.

> +			return -ETIMEDOUT;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +ssize_t force_reset_write(struct file *f, const char __user *buf, size_t len, loff_t *offset)
> +{
> +	struct xe_gt *gt = file_inode(f)->i_private;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	char arg_str[5];
> +	size_t size;
> +	unsigned long arg;
> +	int ret;
> +
> +	size = min(sizeof(arg_str)-1, len);
> +	arg = copy_from_user((void *)arg_str, buf, size);

You don't need to cast to void * when the argument is void *.

> +	if (arg < 0) {
> +		drm_err(&xe->drm, "reading force_reset arg failed, ret %ld", arg);
> +		return arg;
> +	}
> +	arg_str[size] = '\0';
> +
> +	ret = kstrtoul(arg_str, 0, &arg);

Ugh. There are kstrto*_from_user() alternatives that handle all that
copy_from_user() stuff for you.

But why is it a u32 when you only use it as a bool? It could be bool. Or
you could make the value act directly as the timeout, for each reset,
instead of having a separate debugfs file for that.

> +	if (ret) {
> +		drm_err(&xe->drm, "force_reset arg parse failed, ret %d", ret);
> +		return ret;
> +	}
> +
> +	ret = force_reset(gt, (arg && 1));
> +	if (ret != 0)  {
> +		drm_err(&xe->drm, "force_reset failed, ret %d\n", ret);
> +		return ret;
> +	}
> +	return len;
> +}
> +
> +ssize_t force_reset_read(struct file *f, char __user *buf, size_t len, loff_t *offset)
> +{
> +	struct xe_gt *gt = file_inode(f)->i_private;
> +
> +	force_reset(gt, 0);

Wait what? Reading forces reset???

The argument is bool, so the above should be false not 0.

>  	return 0;
>  }
>  
> +static const struct file_operations force_reset_fops = {
> +	.owner = THIS_MODULE,
> +	.write = force_reset_write,
> +	.read = force_reset_read,

Usually you'd have .open instead.

> +};
> +
>  static int sa_info(struct seq_file *m, void *data)
>  {
>  	struct xe_tile *tile = gt_to_tile(node_to_gt(m->private));
> @@ -192,7 +248,6 @@ static int vecs_default_lrc(struct seq_file *m, void *data)
>  
>  static const struct drm_info_list debugfs_list[] = {
>  	{"hw_engines", hw_engines, 0},
> -	{"force_reset", force_reset, 0},
>  	{"sa_info", sa_info, 0},
>  	{"topology", topology, 0},
>  	{"steering", steering, 0},
> @@ -245,5 +300,16 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  				 ARRAY_SIZE(debugfs_list),
>  				 root, minor);
>  
> +	gt->reset.fr_dentry = debugfs_create_file("force_reset", 0600, root, xe,
> +			    &force_reset_fops);

Why not 0644? Oh, because reading forces reset. Ugh.

> +	if (!gt->reset.fr_dentry)
> +		drm_warn(&xe->drm, "force_reset debugfs file creation failed");

It's debugfs. Please no result checks, and no warnings.

> +	d_inode(gt->reset.fr_dentry)->i_private = gt;

Please don't mess with this. Just pass the pointer you need to
debugfs_create_file().

> +
> +	debugfs_create_u32("gt_reset_timeout_ms", 0600, root,
> +					&gt->reset.timeout_ms);

Indent. Please use checkpatch.

Why not 0644?

> +	/* set a default timeout value */
> +	gt->reset.timeout_ms = 1000;
> +

A bit suspect to specify this inline as a magic number.

>  	xe_uc_debugfs_register(&gt->uc, root);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.h b/drivers/gpu/drm/xe/xe_gt_debugfs.h
> index 5a329f118a57..40adcf1822c6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.h
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.h
> @@ -6,8 +6,11 @@
>  #ifndef _XE_GT_DEBUGFS_H_
>  #define _XE_GT_DEBUGFS_H_
>  
> +#include <linux/fs.h>
>  struct xe_gt;
>  
>  void xe_gt_debugfs_register(struct xe_gt *gt);
> +ssize_t force_reset_write(struct file *f, const char __user *buf, size_t len, loff_t *offset);
> +ssize_t force_reset_read(struct file *f, char __user *buf, size_t len, loff_t *offset);

None of these are needed outside of the .c file. And if they were
needed, this would hardly be the interface you'd want to expose.

>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index f74684660475..d6134215094b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -148,6 +148,14 @@ struct xe_gt {
>  		 * code to safely flush all code paths
>  		 */
>  		struct work_struct worker;
> +		/** @done : completion for GT reset */
> +		struct completion done;
> +		/** @timeout_ms : gt synchronous reset timeout in ms */
> +		u32 timeout_ms;
> +		/** @dentry: dentry for force_reset */
> +		struct dentry *fr_dentry;

You don't actually need that for anything.

> +		/** @is_sync_reset : gt reset is synchronous */
> +		//bool is_sync_reset;

Please remove.

Superfluous spaces before : in documentation comments.

>  	} reset;
>  
>  	/** @tlb_invalidation: TLB invalidation state */

-- 
Jani Nikula, Intel
