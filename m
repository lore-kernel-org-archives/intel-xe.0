Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD693C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 20:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8631D10E12F;
	Tue, 24 Jun 2025 20:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gRGE362y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E870610E12F
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 20:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750797614; x=1782333614;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=VkaLIZCYBw4/2w28NaJ2YpI2wdVKSFBTpvQYSerwFDE=;
 b=gRGE362yz4a2SHUZ9Y0UklF4ojn9CBsNpPQr3ha5J7aVQH0sH/tPZpVj
 LaQxb5X59IKTqbndLTT0HsN55ZV3tRRCYnBaEbStJVyUUfzUzEu2jVKQu
 dCD2Lup9WMOF38+eUXhMOAhdUCEuyLP6IkegSPeMZT1V+n2UP3cXLw3YY
 E6/zzwva1XP0CezFdUR2vzW9Yyj4VmpH322AEIycU69wpvJ9WIffyQjqa
 gE7IUcAyH0KlF02iK25gc4mO6g4nORliUDs48f2IIaS/5JmzhXL1V9iQe
 Z+TrcuVi7xz5O6IOMfbVUN2TmnlZlodf2pnN22l3GAhX7q8RmnG9DtAJV w==;
X-CSE-ConnectionGUID: uKxK7cncSWCEwZ65ytvTmw==
X-CSE-MsgGUID: y6mp9dw7TnidKf0sQfiujA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52774451"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="52774451"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 13:40:14 -0700
X-CSE-ConnectionGUID: VHk9zIeIS/yE8dHh3pIjrQ==
X-CSE-MsgGUID: rAJzSNXMQvCfdqU7XFhb5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="156301712"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 24 Jun 2025 13:40:12 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 95D0E34951;
 Tue, 24 Jun 2025 21:40:11 +0100 (IST)
Message-ID: <c67c3092-6841-4023-8bd2-3947da1145cf@intel.com>
Date: Tue, 24 Jun 2025 22:40:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Make force_reset attributes write-only
To: John Harrison <john.c.harrison@intel.com>, intel-xe@lists.freedesktop.org
References: <20250603192218.637-1-michal.wajdeczko@intel.com>
 <c9ff6291-82a6-4412-80e1-1d9cdaf8a55e@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <c9ff6291-82a6-4412-80e1-1d9cdaf8a55e@intel.com>
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



On 10.06.2025 00:13, John Harrison wrote:
> On 6/3/2025 12:22 PM, Michal Wajdeczko wrote:
>> Stop supporting triggering GT resets from readoperations, as main
>> user of this feature (IGT) already switched to use write operation.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c | 10 ++--------
>>   1 file changed, 2 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/
>> xe_gt_debugfs.c
>> index 848618acdca8..3afd0d58fa6b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -349,9 +349,6 @@ static ssize_t force_reset_write(struct file *file,
>>     static int force_reset_show(struct seq_file *s, void *unused)
>>   {
>> -    struct xe_gt *gt = s->private;
>> -
>> -    force_reset(gt); /* to be deprecated! */
>>       return 0;
>>   }
>>   DEFINE_SHOW_STORE_ATTRIBUTE(force_reset);
>> @@ -377,9 +374,6 @@ static ssize_t force_reset_sync_write(struct file
>> *file,
>>     static int force_reset_sync_show(struct seq_file *s, void *unused)
>>   {
>> -    struct xe_gt *gt = s->private;
>> -
>> -    force_reset_sync(gt); /* to be deprecated! */
>>       return 0;
>>   }
>>   DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
> Is the show function still needed for either of these if they are now
> read only?

unfortunately yes, since there is no DEFINE_STORE_ATTRIBUTE() helper
macro, only DEFINE_SHOW_ATTRIBUTE() is there, and maybe we can try to
add new helper, I was even considering this, but likely it is not
something deadly required for this patch IMO

> 
> John.
> 
>> @@ -408,8 +402,8 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>>       root->d_inode->i_private = gt;
>>         /* VF safe */
>> -    debugfs_create_file("force_reset", 0600, root, gt,
>> &force_reset_fops);
>> -    debugfs_create_file("force_reset_sync", 0600, root, gt,
>> &force_reset_sync_fops);
>> +    debugfs_create_file("force_reset", 0200, root, gt,
>> &force_reset_fops);
>> +    debugfs_create_file("force_reset_sync", 0200, root, gt,
>> &force_reset_sync_fops);
>>         drm_debugfs_create_files(vf_safe_debugfs_list,
>>                    ARRAY_SIZE(vf_safe_debugfs_list),
> 

