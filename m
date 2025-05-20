Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC30C3ABDD
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 09:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912EE10E2CC;
	Tue, 20 May 2025 09:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rk3AgczK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8D410E2CC
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 09:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747732330; x=1779268330;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4+K4WrW25kKizwoCTJCTn6zG8wLk6d63J38IRL8tw0A=;
 b=Rk3AgczKadgYKB04QDQAUqRV1PzPAD/79ksb6ua3+Rz65hPK9zYM1/CV
 og8lBX2DP485lXUmVczEZB0QEwuwEGsztGeDA9kbS9k8Et6dLS5b0QMyE
 UVFvTVFahpjnue1UGD2PF4+3Rd1mR8J5YY5Yj+Lkq+Hzg3rpZxSny1kXs
 s1BxmJtVeFQDK9G3GIIzNhE1b7MOWRkboCo0ypRaR8QoBWu/8K+Wa9ZQb
 XNinI+qBH0MQT4cm3nHfOKHGC7AEyB4DLeCrH1FvUC16XcPuPr/7l1qFl
 dgt6jiVQ+3n/QTGspu3P+FMoYaxSG/OcI2YEDFGCDu//hz8+Xr1b2Hqos g==;
X-CSE-ConnectionGUID: 9NxOFsOWTvinYZTL0Gae9w==
X-CSE-MsgGUID: mgsnsvl3RNe0eJ5UppgRXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49719865"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49719865"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 02:12:09 -0700
X-CSE-ConnectionGUID: gz3HtYNATeaBYwqgQ0CYsg==
X-CSE-MsgGUID: dlvCo0QITmamt1T8qF/wvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="144486860"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 20 May 2025 02:12:06 -0700
Received: from [10.245.84.121] (unknown [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4CF5712417;
 Tue, 20 May 2025 10:12:05 +0100 (IST)
Message-ID: <e222a156-bc07-45d0-bfd6-f24ff31696a4@intel.com>
Date: Tue, 20 May 2025 11:12:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Allow to trigger GT resets using debugfs writes
To: John Harrison <john.c.harrison@intel.com>, intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250519200914.216-1-michal.wajdeczko@intel.com>
 <eefda6f4-e81c-43a6-bebc-7d4fe0c3132a@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <eefda6f4-e81c-43a6-bebc-7d4fe0c3132a@intel.com>
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



On 20.05.2025 01:44, John Harrison wrote:
> On 5/19/2025 1:09 PM, Michal Wajdeczko wrote:
>> Today we allow to trigger GT resest by reading dedicated debugfs
>> files "force_reset" and "force_reset_sync" that we are exposing
>> using drm_info_list[] and drm_debugfs_create_files().
>>
>> To avoid triggering potentially disruptive actions during otherwise
>> "safe" read operations, expose those two attributes using debugfs
>> function where we can specify file permissions and provide custom
>> "write" handler to trigger the GT resets also from there.
> Would you like to extend this to the GuC log dump-via-dmesg trigger
> entry as well? Dumping that during the IGT read debugfs test also causes
> issues due to the huge amount of output it produces.

yes, that was my plan as I was expecting more discussion there so I
wanted to put that into a separate series

but since you already asked here, my question would be:

do you prefer keeping separate write-only "guc_log_dmesg" file, or keep
single read-write "guc_log" file that would print encoded log on read
and dump it to dmesg on write?

also do we want to keep 0444 mode for "guc_log" or change it to 0400
mode (or 0600 if it would be dual-purpose)

> 
>>
>> This step would allow us to drop triggering GT resets during read
>> operations, which we leave just to give users more time to switch.
> I'm not following this sentence. Give users more time to switch what?

switch to use "echo 1 > force_reset" instead of "cat force_reset"

> 
> Also, would it be more accurate to call the patch set something like
> 'require a write to trigger GT resets via debugfs'. Saying 'allow'
> implies you are just extending the existing interface rather than
> removing the trigger-via-read ability.

this patch extends the existing interface, the legacy way to trigger a
reset by read is still there (due to IGT) - see force_reset_show()

once the IGT will be updated, we would make those files write-only
I didn't want to introduce any CI regression right now, hence two steps

> 
> John.
> 
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c | 96 +++++++++++++++++++++++-------
>>   1 file changed, 76 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/
>> xe_gt_debugfs.c
>> index 119a55bb7580..848618acdca8 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -122,24 +122,6 @@ static int powergate_info(struct xe_gt *gt,
>> struct drm_printer *p)
>>       return ret;
>>   }
>>   -static int force_reset(struct xe_gt *gt, struct drm_printer *p)
>> -{
>> -    xe_pm_runtime_get(gt_to_xe(gt));
>> -    xe_gt_reset_async(gt);
>> -    xe_pm_runtime_put(gt_to_xe(gt));
>> -
>> -    return 0;
>> -}
>> -
>> -static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
>> -{
>> -    xe_pm_runtime_get(gt_to_xe(gt));
>> -    xe_gt_reset(gt);
>> -    xe_pm_runtime_put(gt_to_xe(gt));
>> -
>> -    return 0;
>> -}
>> -
>>   static int sa_info(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>       struct xe_tile *tile = gt_to_tile(gt);
>> @@ -306,8 +288,6 @@ static int hwconfig(struct xe_gt *gt, struct
>> drm_printer *p)
>>    * - without access to the PF specific data
>>    */
>>   static const struct drm_info_list vf_safe_debugfs_list[] = {
>> -    {"force_reset", .show = xe_gt_debugfs_simple_show, .data =
>> force_reset},
>> -    {"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data =
>> force_reset_sync},
>>       {"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
>>       {"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>>       {"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
>> @@ -332,6 +312,78 @@ static const struct drm_info_list
>> pf_only_debugfs_list[] = {
>>       {"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>>   };
>>   +static ssize_t write_to_gt_call(const char __user *userbuf, size_t
>> count, loff_t *ppos,
>> +                void (*call)(struct xe_gt *), struct xe_gt *gt)
>> +{
>> +    bool yes;
>> +    int ret;
>> +
>> +    if (*ppos)
>> +        return -EINVAL;
>> +    ret = kstrtobool_from_user(userbuf, count, &yes);
>> +    if (ret < 0)
>> +        return ret;
>> +    if (yes)
>> +        call(gt);
>> +    return count;
>> +}
>> +
>> +static void force_reset(struct xe_gt *gt)
>> +{
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +
>> +    xe_pm_runtime_get(xe);
>> +    xe_gt_reset_async(gt);
>> +    xe_pm_runtime_put(xe);
>> +}
>> +
>> +static ssize_t force_reset_write(struct file *file,
>> +                 const char __user *userbuf,
>> +                 size_t count, loff_t *ppos)
>> +{
>> +    struct seq_file *s = file->private_data;
>> +    struct xe_gt *gt = s->private;
>> +
>> +    return write_to_gt_call(userbuf, count, ppos, force_reset, gt);
>> +}
>> +
>> +static int force_reset_show(struct seq_file *s, void *unused)
>> +{
>> +    struct xe_gt *gt = s->private;
>> +
>> +    force_reset(gt); /* to be deprecated! */
>> +    return 0;
>> +}
>> +DEFINE_SHOW_STORE_ATTRIBUTE(force_reset);
>> +
>> +static void force_reset_sync(struct xe_gt *gt)
>> +{
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +
>> +    xe_pm_runtime_get(xe);
>> +    xe_gt_reset(gt);
>> +    xe_pm_runtime_put(xe);
>> +}
>> +
>> +static ssize_t force_reset_sync_write(struct file *file,
>> +                      const char __user *userbuf,
>> +                      size_t count, loff_t *ppos)
>> +{
>> +    struct seq_file *s = file->private_data;
>> +    struct xe_gt *gt = s->private;
>> +
>> +    return write_to_gt_call(userbuf, count, ppos, force_reset_sync, gt);
>> +}
>> +
>> +static int force_reset_sync_show(struct seq_file *s, void *unused)
>> +{
>> +    struct xe_gt *gt = s->private;
>> +
>> +    force_reset_sync(gt); /* to be deprecated! */
>> +    return 0;
>> +}
>> +DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
>> +
>>   void xe_gt_debugfs_register(struct xe_gt *gt)
>>   {
>>       struct xe_device *xe = gt_to_xe(gt);
>> @@ -355,6 +407,10 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>>        */
>>       root->d_inode->i_private = gt;
>>   +    /* VF safe */
>> +    debugfs_create_file("force_reset", 0600, root, gt,
>> &force_reset_fops);
>> +    debugfs_create_file("force_reset_sync", 0600, root, gt,
>> &force_reset_sync_fops);
>> +
>>       drm_debugfs_create_files(vf_safe_debugfs_list,
>>                    ARRAY_SIZE(vf_safe_debugfs_list),
>>                    root, minor);
> 

