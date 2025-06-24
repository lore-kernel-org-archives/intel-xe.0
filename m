Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333FDC77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 20:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A3D10E12F;
	Tue, 24 Jun 2025 20:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EgC8SjMA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A384610E12F
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 20:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750798287; x=1782334287;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ShPU7gky9fWqdVe3YD1RFgebM3zfmzHLLbIQ9QkiYZs=;
 b=EgC8SjMA0x9ORUpWvQvfAdZ7d2w0Vk2R8hs0F7faajNEbNCcegawk2zC
 tH6vrihpshN7DYY209HUAnDb8PKSO3H+41/kzSvTGfV4HqIS3dX4gNHaQ
 ZfqmFtvgfD3YhzWXdxsoLj6QZ3gWye8rXe5Jk1LgPhGtaxjGQxThnY6aP
 o+kPtYCuX1BHnplQgloJflEMxKmABv02QbDjYhU12WPc6iCzrcoGmCkao
 U0BWWoQ0vCgaKtgcQLpeL7Hlbx0uClua6yyoDp89tUOM19LVYDvpwBzkI
 MzTTm9tQ2e1OVJWx2fAHB2EQ/hJGefMzwM8cS/HY37BQBGgABPOhBRebI g==;
X-CSE-ConnectionGUID: aHx376HgRV2r01H3LeqI+w==
X-CSE-MsgGUID: qg6Etv3UR5uZf6NBLGjWyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52285600"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="52285600"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 13:51:27 -0700
X-CSE-ConnectionGUID: KxWAdHIVQW234oEayCXHIA==
X-CSE-MsgGUID: 7LkyK9uqSl+hErazwhPBkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="157788396"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 24 Jun 2025 13:51:26 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id D32B634956;
 Tue, 24 Jun 2025 21:51:24 +0100 (IST)
Message-ID: <5d5ca287-3c72-4dc8-82bd-d7ebfd78e50b@intel.com>
Date: Tue, 24 Jun 2025 22:51:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Make debugfs guc_log_dmesg attribute
 write-only
To: John Harrison <john.c.harrison@intel.com>, intel-xe@lists.freedesktop.org
References: <20250603175302.593-1-michal.wajdeczko@intel.com>
 <6f4f4aff-7e83-4b40-920a-2edafa60b06a@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <6f4f4aff-7e83-4b40-920a-2edafa60b06a@intel.com>
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



On 10.06.2025 00:11, John Harrison wrote:
> On 6/3/2025 10:53 AM, Michal Wajdeczko wrote:
>> Ocassionally we want to dump a GuC log into the dmesg, but current
> I would describe this interface as purely a test for the dump-via-dmesg
> code itself. It is not really useful for triggering a dump for actual
> bug investigation purposes. If a system is alive enough to use this
> debugfs interface then it is alive enough to use the official
> devcoredump or GuC-log-via-debugfs interfaces.
> 
> Having said that, this change probably needs an IGT test to go with it.
> One that explicitly does the write and triggers the dump to make sure it
> works. Potentially it could actually check the dmesg output for a valid
> dump but as a first pass, just calling the interface and ensuring the
> kernel doesn't die is a good step!

there is some ongoing refactoring of IGT debugfs tests [1]
likely we must wait until it's finished to avoid clashes

[1] https://patchwork.freedesktop.org/series/150310/

> 
> The problem at the moment is that there are multiple IGTs which do a
> blanket read of everything in debugfs. Thus, they get the dump-via-dmesg
> even if they aren't interested in it. And those multiple dumps fill up
> dmesg to the point where CI complains about too much log output. So
> making this change will make those tests more reliable. However, it
> means that we would get no testing of the dump-via-dmesg mechanism
> itself. So unless a new IGT is added to explicitly test the interface,
> we might as well just remove it completely.

your call, for me it's fine to drop this attribute

> 
>> implementation is based on the drm debugfs API and was triggering
>> dump on the read operation.  Expose guc_log_dmesg attribute as
>> write-only using pure debugfs API to make dump requests explicit.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_debugfs.c | 43 ++++++++++++++++++++++++-----
>>   1 file changed, 36 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/
>> xe_guc_debugfs.c
>> index 0b102ab46c4d..eb6124d02d53 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> @@ -5,6 +5,8 @@
>>     #include "xe_guc_debugfs.h"
>>   +#include <linux/debugfs.h>
>> +
>>   #include <drm/drm_debugfs.h>
>>   #include <drm/drm_managed.h>
>>   @@ -85,12 +87,6 @@ static int guc_log(struct xe_guc *guc, struct
>> drm_printer *p)
>>       return 0;
>>   }
>>   -static int guc_log_dmesg(struct xe_guc *guc, struct drm_printer *p)
>> -{
>> -    xe_guc_log_print_dmesg(&guc->log);
>> -    return 0;
>> -}
>> -
>>   static int guc_ctb(struct xe_guc *guc, struct drm_printer *p)
>>   {
>>       xe_guc_ct_print(&guc->ct, p, true);
>> @@ -121,9 +117,39 @@ static const struct drm_info_list
>> slpc_debugfs_list[] = {
>>   /* everything else should be added here */
>>   static const struct drm_info_list pf_only_debugfs_list[] = {
>>       { "guc_log", .show = guc_debugfs_show, .data = guc_log },
>> -    { "guc_log_dmesg", .show = guc_debugfs_show, .data =
>> guc_log_dmesg },
>>   };
>>   +/*
>> + *      /sys/kernel/debug/dri/0/
>> + *      ├── gt0
>> + *      │   ├── uc
>> + *      │   │   ├── guc_log_dmesg
>> + */
>> +static ssize_t guc_log_dmesg_write(struct file *file,
>> +                   const char __user *userbuf,
>> +                   size_t count, loff_t *ppos)
>> +{
>> +    struct seq_file *s = file->private_data;
>> +    struct xe_guc *guc = s->private;
>> +    bool yes;
>> +    int ret;
>> +
>> +    if (*ppos)
>> +        return -EINVAL;
>> +    ret = kstrtobool_from_user(userbuf, count, &yes);
>> +    if (ret < 0)
>> +        return ret;
>> +    if (yes)
>> +        xe_guc_log_print_dmesg(&guc->log);
>> +    return count;
>> +}
>> +
>> +static int guc_log_dmesg_show(struct seq_file *s, void *unused)
>> +{
>> +    return 0;
>> +}
>> +DEFINE_SHOW_STORE_ATTRIBUTE(guc_log_dmesg);
> Is a 'show' entry needed if the file is write only?

AFAIK there is no DEFINE_STORE_ATTRIBUTE() helper macro (yet)

> 
> John.
> 
>> +
>>   void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
>>   {
>>       struct xe_device *xe =  guc_to_xe(guc);
>> @@ -142,5 +168,8 @@ void xe_guc_debugfs_register(struct xe_guc *guc,
>> struct dentry *parent)
>>               drm_debugfs_create_files(slpc_debugfs_list,
>>                            ARRAY_SIZE(slpc_debugfs_list),
>>                            parent, minor);
>> +
>> +        debugfs_create_file("guc_log_dmesg", 0200, parent,
>> +                    guc, &guc_log_dmesg_fops);
>>       }
>>   }
> 

