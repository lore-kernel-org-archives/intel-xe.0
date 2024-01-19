Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D918DC47DAF
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 11:42:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7727710E9EA;
	Fri, 19 Jan 2024 11:42:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92C510E9FA
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705664571; x=1737200571;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/uGHPPXgxeAqCaNtaqe5Uk/+ypUJzv09p+l7EfQZP+k=;
 b=aAQjUYYUndE6segaPktJVAe49zMXTRjcZMruTjKhDroV416NYI7hQSGB
 rZ4E2eVHP/B1cAtoXU6A0MEVrqlo/pYYtx7OnxYzUyfYshG6jjfBRZh7r
 5Ule7K8QY8aelvz/3PoGDqMoi4NoKCmYfA9wKZTddmuww4WGyq4H1GswV
 HTxfEe82K1HoNRAfkLEMZs4V5gJy3O+Va0EOxlL9ckP/GuBDBszAWX+Bz
 P2yKgEZE4xIb/mazDAKi/Wf6XmpRYCHtFTSYxU8pa9Km8qnb6bXYgt438
 FWakXtJ2R1NURiBJkDvSUTiS4Cokvy/SFH5rjMNf0e0BdSm6r3RRrqeRt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7416165"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="7416165"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 03:42:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="819046673"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="819046673"
Received: from vstill-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.223])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 03:42:42 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/debugfs: Expose debugfs entry to check guc pc
 support
In-Reply-To: <4dd696da-90ef-4612-93de-e812d0a8336e@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240119081852.1858212-1-badal.nilawar@intel.com>
 <4dd696da-90ef-4612-93de-e812d0a8336e@intel.com>
Date: Fri, 19 Jan 2024 13:42:40 +0200
Message-ID: <878r4lpn0v.fsf@intel.com>
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
Cc: matthew.d.roper@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 19 Jan 2024, "Nilawar, Badal" <badal.nilawar@intel.com> wrote:
> On 19-01-2024 13:48, Badal Nilawar wrote:
>> Expose debugfs entry to check if platform support GuC PC (SLPC) feature.
>> 
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>> index c56fd7d59f05..2f474bf0e7c7 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -30,6 +30,13 @@ static struct xe_device *node_to_xe(struct drm_info_node *node)
>>   	return to_xe_device(node->minor->dev);
>>   }
>>   
>> +static int is_gucpc_supported(struct seq_file *m, void *data)
>> +{
>> +	struct xe_device *xe = node_to_xe(m->private);
>> +
>> +	return (int)!xe->info.skip_guc_pc;
> Will change this to
> return (xe->info.skip_guc_pc ? 0 : 1);

What do you expect to happen when you 'cat' the debugfs file?

BR,
Jani.

>
> Regards,
> Badal
>> +}
>> +
>>   static int info(struct seq_file *m, void *data)
>>   {
>>   	struct xe_device *xe = node_to_xe(m->private);
>> @@ -67,6 +74,7 @@ static int info(struct seq_file *m, void *data)
>>   
>>   static const struct drm_info_list debugfs_list[] = {
>>   	{"info", info, 0},
>> +	{"is_gucpc_supported", is_gucpc_supported, 0},
>>   };
>>   
>>   static int forcewake_open(struct inode *inode, struct file *file)

-- 
Jani Nikula, Intel
