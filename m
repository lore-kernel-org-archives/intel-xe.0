Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC86D31767
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 16:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C63310E5EF;
	Tue,  5 Nov 2024 16:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AAFZNO/7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6614A10E5EF
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 16:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730824906; x=1762360906;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zCCdi0OtmH/EO8zpsuBP6/nj8JahJ6NxDXgE/b7tE/w=;
 b=AAFZNO/7V2rp/jHYWSsoQRhVc5lbtGBeq+rV961HBWMs+fu8NbWFm2e4
 Ha1a0VkT6jV3ONexgSVI3iS15p+HqrhbT/zKgnMpZ4iWt1elpmnkw03n3
 kM9h8qHR43f1mOF/al9KUcxRyC85pfoZCrV03aePftkywgk2S5ryQIAdB
 LZZN7q/HamacwRViF1Xioj6tBUh5m/6hkpvVXR5hzE6vzDbzNiXnXSLJK
 5HGYzi8M+Z8xd6kPWuNOvQnIZvzvJRkK+7TPMVx4PpP8w93gknZtHXQoj
 odrm0behFpYKXvcLTxhx/EmMtJnY89PnmIfDBt+T5EXMMM8GbHz5NSwzX Q==;
X-CSE-ConnectionGUID: gfvYo2/rQaiF3cH6HRVV6w==
X-CSE-MsgGUID: uR5YdcioROugteY+tTs07A==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41983185"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="41983185"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 08:41:46 -0800
X-CSE-ConnectionGUID: QKahAZVyTDKwBr5brvm5EA==
X-CSE-MsgGUID: BMTZiK/nShqHJhwjpby/lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="84029569"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 05 Nov 2024 08:41:43 -0800
Received: from [10.245.120.199] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.120.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CE1592FC65;
 Tue,  5 Nov 2024 16:41:41 +0000 (GMT)
Message-ID: <9928fbe6-c874-404c-82f0-3c0db4d6eea6@intel.com>
Date: Tue, 5 Nov 2024 17:41:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/pf: Expose access to the VF GGTT PTEs over
 debugfs
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com
References: <20241103201633.1859-1-michal.wajdeczko@intel.com>
 <20241103201633.1859-3-michal.wajdeczko@intel.com>
 <ZylxciEFAXP749BX@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZylxciEFAXP749BX@lstrano-desk.jf.intel.com>
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



On 05.11.2024 02:14, Matthew Brost wrote:
> On Sun, Nov 03, 2024 at 09:16:33PM +0100, Michal Wajdeczko wrote:
>> For feature enabling and testing purposes, allow to capture and
>> replace VF's GGTT PTEs data using debugfs blob file.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 62 +++++++++++++++++++++
>>  1 file changed, 62 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> index 05df4ab3514b..69ba830d9e8d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> @@ -11,6 +11,7 @@
>>  #include "xe_bo.h"
>>  #include "xe_debugfs.h"
>>  #include "xe_device.h"
>> +#include "xe_ggtt.h"
>>  #include "xe_gt.h"
>>  #include "xe_gt_debugfs.h"
>>  #include "xe_gt_sriov_pf_config.h"
>> @@ -497,6 +498,64 @@ static const struct file_operations config_blob_ops = {
>>  	.llseek		= default_llseek,
>>  };
>>  
>> +/*
>> + *      /sys/kernel/debug/dri/0/
>> + *      ├── gt0
>> + *      │   ├── vf1
>> + *      │   │   ├── ggtt_raw
>> + */
>> +
>> +static ssize_t ggtt_raw_read(struct file *file, char __user *buf,
>> +			     size_t count, loff_t *pos)
>> +{
>> +	struct dentry *dent = file_dentry(file);
>> +	struct dentry *parent = dent->d_parent;
>> +	unsigned int vfid = extract_vfid(parent);
>> +	struct xe_gt *gt = extract_gt(parent);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	ssize_t ret;
>> +
>> +	xe_pm_runtime_get(xe);
>> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> 
> + Thomas to confirm I'm making sense here.
> 
> So this relates to this patch [1] / Thomas comment [2].
> 
> You are adding memory allocations here under the
> xe_gt_sriov_pf_master_mutex which renders [1] incomplete.

I was assuming that using GFP_NOWAIT and then on fail having a fallback
to fixed 64B local chunk is fine, no?

> 
> So you need to one of two things:
> 
> 1. Never do any memory allocations under xe_gt_sriov_pf_master_mutex. If
> you choose this option taint this mutex with reclaim when loading the
> PF. It is then safe to xe_gt_sriov_pf_master_mutex in suspend / resume /
> reset flows.

well, due to lack of [1] there are still some allocations done during
sending a VF config to the GuC, but hopefully we can mitigate that soon

but what I found recently is that due to recent GGTT refactoring, the
xe_ggtt_node is now allocated (with GFP_NOFS) flag under that mutex,
which may require another round of fixes

> 
> 2. Remove xe_gt_sriov_pf_master_mutex from suspend / resume / reset
> flows.

reprovisioning (sending VFs configs to GuC) is only done as one of the
final reset steps, and as long it's there it will require that mutex

alternate option would be to decouple reprovisioning to an async worker
triggered from the reset, will take a look at this

> 
> In addition to above, also never allocate memory in suspend / resume /
> reset flows.
> 
> Not blocker here but just using this as an example to explain the
> current SRIOV locking problems. Hope this helps.
> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/619024/?series=139801&rev=1
> [2] https://lore.kernel.org/intel-xe/3e13401972fd49240f486fd7d47580e576794c78.camel@intel.com/
> 
>> +
>> +	ret = xe_ggtt_node_read(gt->sriov.pf.vfs[vfid].config.ggtt_region,
>> +				buf, count, pos);
>> +
>> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>> +	xe_pm_runtime_put(xe);
>> +
>> +	return ret;
>> +}
>> +
>> +static ssize_t ggtt_raw_write(struct file *file, const char __user *buf,
>> +			      size_t count, loff_t *pos)
>> +{
>> +	struct dentry *dent = file_dentry(file);
>> +	struct dentry *parent = dent->d_parent;
>> +	unsigned int vfid = extract_vfid(parent);
>> +	struct xe_gt *gt = extract_gt(parent);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	ssize_t ret;
>> +
>> +	xe_pm_runtime_get(xe);
>> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	ret = xe_ggtt_node_write(gt->sriov.pf.vfs[vfid].config.ggtt_region,
>> +				 buf, count, pos);
>> +
>> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>> +	xe_pm_runtime_put(xe);
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct file_operations ggtt_raw_ops = {
>> +	.owner		= THIS_MODULE,
>> +	.read		= ggtt_raw_read,
>> +	.write		= ggtt_raw_write,
>> +	.llseek		= default_llseek,
>> +};
>> +
>>  /**
>>   * xe_gt_sriov_pf_debugfs_register - Register SR-IOV PF specific entries in GT debugfs.
>>   * @gt: the &xe_gt to register
>> @@ -554,6 +613,9 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>>  			debugfs_create_file("config_blob",
>>  					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
>>  					    vfdentry, NULL, &config_blob_ops);
>> +			debugfs_create_file("ggtt_raw",
>> +					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
>> +					    vfdentry, NULL, &ggtt_raw_ops);
>>  		}
>>  	}
>>  }
>> -- 
>> 2.43.0
>>

