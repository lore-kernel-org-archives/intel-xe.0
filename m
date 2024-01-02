Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFD4C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 16:06:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE80610E1D4;
	Tue,  2 Jan 2024 16:06:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671F910E1D4
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 16:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704211565; x=1735747565;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KLFzrEI/Qol00W31IVp/CMdX6/DWW52Q1+XJISPNxQA=;
 b=kg1oz0I16ORGx6ULy0tXEEkWL1fAwcyH+5jO3qq0INrzmQCJJJIQmpU0
 auHKbx2sGpj1VTnKPOE/7xjQeYnEqYYabICEvZH8tBbak4KQj0bQUKdSN
 4vVliUCvJUraXj+iMV+h3FJnrNHFmTcZgxaGiIeIMwhLFf2d6V8shN7ZG
 1UQpfTrIWqGxSSjD2fbqopYxQ7XTGX1W/AQAOGLifXKV+br3u5o9q9h2D
 U50ARk3UsneP33pkPTw5Q9jH+SA8ZxEJzLgj6Bs3ywTQYR1PwrHBtJW64
 ozk1SdUoB9iY1hsqQE7DgOK1x1WJzz9rNUTL8hSTUX+k+l4YRkiumEg+V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="400695947"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="400695947"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 08:06:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="870296075"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="870296075"
Received: from dmaryin-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.224])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 08:06:01 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/debugfs: Add support for gt synchronous force reset
In-Reply-To: <878r574uzb.fsf@mkuoppal-desk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231231144733.568481-1-karthik.poosa@intel.com>
 <CY5PR11MB62114F7D75F8A7DBF6066A6A9562A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <5f11046a-81c1-4984-bc60-ce904ff605ca@intel.com>
 <878r574uzb.fsf@mkuoppal-desk>
Date: Tue, 02 Jan 2024 18:05:49 +0200
Message-ID: <87plyj200y.fsf@intel.com>
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 02 Jan 2024, Mika Kuoppala <mika.kuoppala@linux.intel.com> wrote:
> "Poosa, Karthik" <karthik.poosa@intel.com> writes:
>
>> Hi Anshuman,
>>
>> Please find my comments inline below.
>>
>> Thanks,
>>
>> Karthik.
>>
>> On 01-01-2024 20:07, Gupta, Anshuman wrote:
>>>
>>>> -----Original Message-----
>>>> From: Poosa, Karthik <karthik.poosa@intel.com>
>>>> Sent: Sunday, December 31, 2023 8:18 PM
>>>> To: intel-xe@lists.freedesktop.org
>>>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
>>>> <badal.nilawar@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
>>>> Vivi, Rodrigo <rodrigo.vivi@intel.com>; Poosa, Karthik
>>>> <karthik.poosa@intel.com>
>>>> Subject: [PATCH] drm/xe/debugfs: Add support for gt synchronous force reset
>>>>
>>>> This support added as igt test freq_reset_multiple fails sporadically in case
>>>> xe_guc_pc is not started.
>>>> A completion is added in force_reset for this.
>>>> Writing non-zero to force_reset debugfs entry does synchronous reset.
>>> We need IGT patch as well for this patch.
>>>> v2:
>>>> - Changed wait for completion to interruptible (Anshuman).
>>>> - Moved timeout to xe_gt.h (Anshuman).
>>>> - Created a debugfs for updating timeout (Rodrigo).
>>>>
>>>> v3:
>>>> - Update force_reset debugfs with write support.
>>>>    value 0 -> async reset, non-zero -> sync reset (Matthew Brost).
>>>>
>>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_gt.c         |  2 +
>>>>   drivers/gpu/drm/xe/xe_gt_debugfs.c | 72
>>>> ++++++++++++++++++++++++++++--  drivers/gpu/drm/xe/xe_gt_debugfs.h
>>>> |  3 ++
>>>>   drivers/gpu/drm/xe/xe_gt_types.h   |  8 ++++
>>>>   4 files changed, 82 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c index
>>>> 3af2adec1295..c8d2c18b0c62 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>> @@ -65,6 +65,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>>>>
>>>>   	gt->tile = tile;
>>>>   	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
>>>> +	init_completion(&gt->reset.done);
>>>>
>>>>   	return gt;
>>>>   }
>>>> @@ -633,6 +634,7 @@ static int gt_reset(struct xe_gt *gt)
>>>>   	xe_device_mem_access_put(gt_to_xe(gt));
>>>>   	XE_WARN_ON(err);
>>>>
>>>> +	complete(&gt->reset.done);
>>>>   	xe_gt_info(gt, "reset done\n");
>>>>
>>>>   	return 0;
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>> index c4b67cf09f8f..3518ab89ccfc 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>> @@ -55,15 +55,71 @@ static int hw_engines(struct seq_file *m, void *data)
>>>>   	return 0;
>>>>   }
>>>>
>>>> -static int force_reset(struct seq_file *m, void *data)
>>>> +static int force_reset(struct xe_gt *gt, bool is_sync)
>>>>   {
>>>> -	struct xe_gt *gt = node_to_gt(m->private);
>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>> +	long ret;
>>>>
>>>>   	xe_gt_reset_async(gt);
>>>>
>>>> +	if (is_sync) {
>>>> +		drm_info(&xe->drm, "waiting for gt reset completion");
>>>> +		ret = wait_for_completion_interruptible_timeout(&gt-
>>>>> reset.done,
>>>> +							msecs_to_jiffies(gt-
>>>>> reset.timeout_ms));
>>>> +		if (ret <= 0) {
>>>> +			drm_err(&xe->drm, "gt reset timed out/interrputed,
>>>> ret %ld\n", ret);
>>>> +			return -ETIMEDOUT;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +ssize_t force_reset_write(struct file *f, const char __user *buf,
>>>> +size_t len, loff_t *offset) {
>>>> +	struct xe_gt *gt = file_inode(f)->i_private;
>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>> +	char arg_str[5];
>>>> +	size_t size;
>>>> +	unsigned long arg;
>>>> +	int ret;
>>>> +
>>>> +	size = min(sizeof(arg_str)-1, len);
>>>> +	arg = copy_from_user((void *)arg_str, buf, size);
>>>> +	if (arg < 0) {
>>>> +		drm_err(&xe->drm, "reading force_reset arg failed, ret %ld",
>>>> arg);
>>>> +		return arg;
>>>> +	}
>>>> +	arg_str[size] = '\0';
>>>> +
>>>> +	ret = kstrtoul(arg_str, 0, &arg);
>>>> +	if (ret) {
>>>> +		drm_err(&xe->drm, "force_reset arg parse failed, ret %d", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = force_reset(gt, (arg && 1));
>>> How about  !!arg
>> && will use a single instruction.
>>
>> but !! will happen with 2 instructions, so I think && would be better.
>
> This is not in a hotpath, more readable is better.

And most readable is just passing arg. The param is bool. Let the
compiler do its job.

> -Mika
>
>
>>
>>>   > +	if (ret != 0)  {
>>>> +		drm_err(&xe->drm, "force_reset failed, ret %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +	return len;
>>>> +}
>>>> +
>>>> +ssize_t force_reset_read(struct file *f, char __user *buf, size_t len,
>>>> +loff_t *offset) {
>>>> +	struct xe_gt *gt = file_inode(f)->i_private;
>>>> +
>>>> +	force_reset(gt, 0);
>>>>   	return 0;
>>>>   }
>>>>
>>>> +static const struct file_operations force_reset_fops = {
>>>> +	.owner = THIS_MODULE,
>>>> +	.write = force_reset_write,
>>>> +	.read = force_reset_read,
>>>> +};
>>>> +
>>>>   static int sa_info(struct seq_file *m, void *data)  {
>>>>   	struct xe_tile *tile = gt_to_tile(node_to_gt(m->private));
>>>> @@ -192,7 +248,6 @@ static int vecs_default_lrc(struct seq_file *m, void
>>>> *data)
>>>>
>>>>   static const struct drm_info_list debugfs_list[] = {
>>>>   	{"hw_engines", hw_engines, 0},
>>>> -	{"force_reset", force_reset, 0},
>>>>   	{"sa_info", sa_info, 0},
>>>>   	{"topology", topology, 0},
>>>>   	{"steering", steering, 0},
>>>> @@ -245,5 +300,16 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>>>>   				 ARRAY_SIZE(debugfs_list),
>>>>   				 root, minor);
>>>>
>>>> +	gt->reset.fr_dentry = debugfs_create_file("force_reset", 0600, root,
>>>> xe,
>>>> +			    &force_reset_fops);
>>> Please use DEFINE_SHOW_STORE_ATTRIBUTE here to create rw debugfs entry.
>>> Use force_reset_show and force_reset_restore function name.
>>>> +	if (!gt->reset.fr_dentry)
>>>> +		drm_warn(&xe->drm, "force_reset debugfs file creation
>>>> failed");
>>>> +	d_inode(gt->reset.fr_dentry)->i_private = gt;
>>>> +
>>>> +	debugfs_create_u32("gt_reset_timeout_ms", 0600, root,
>>>> +					&gt->reset.timeout_ms);
>>>> +	/* set a default timeout value */
>>>> +	gt->reset.timeout_ms = 1000;
>>> xe_gt_debugfs_register() should only do the job of debugfs registration.
>>> This is odd here.
>>
>> Shall I move this to xe_gt_alloc (xe_gt.c), where gt is allocated and 
>> initialized.
>>
>>>> +
>>>>   	xe_uc_debugfs_register(&gt->uc, root);  } diff --git
>>>> a/drivers/gpu/drm/xe/xe_gt_debugfs.h
>>>> b/drivers/gpu/drm/xe/xe_gt_debugfs.h
>>>> index 5a329f118a57..40adcf1822c6 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.h
>>>> @@ -6,8 +6,11 @@
>>>>   #ifndef _XE_GT_DEBUGFS_H_
>>>>   #define _XE_GT_DEBUGFS_H_
>>>>
>>>> +#include <linux/fs.h>
>>>>   struct xe_gt;
>>>>
>>>>   void xe_gt_debugfs_register(struct xe_gt *gt);
>>>> +ssize_t force_reset_write(struct file *f, const char __user *buf,
>>>> +size_t len, loff_t *offset); ssize_t force_reset_read(struct file *f,
>>>> +char __user *buf, size_t len, loff_t *offset);
>>>>
>>>>   #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>>>> b/drivers/gpu/drm/xe/xe_gt_types.h
>>>> index f74684660475..d6134215094b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>>> @@ -148,6 +148,14 @@ struct xe_gt {
>>>>   		 * code to safely flush all code paths
>>>>   		 */
>>>>   		struct work_struct worker;
>>>> +		/** @done : completion for GT reset */
>>>> +		struct completion done;
>>>> +		/** @timeout_ms : gt synchronous reset timeout in ms */
>>>> +		u32 timeout_ms;
>>>> +		/** @dentry: dentry for force_reset */
>>>> +		struct dentry *fr_dentry;
>>>> +		/** @is_sync_reset : gt reset is synchronous */
>>>> +		//bool is_sync_reset;
>>> Remove thus unused var.
>>>
>>> Thanks,
>>> Anshuman Gupta.
>>>>   	} reset;
>>>>
>>>>   	/** @tlb_invalidation: TLB invalidation state */
>>>> --
>>>> 2.25.1

-- 
Jani Nikula, Intel
