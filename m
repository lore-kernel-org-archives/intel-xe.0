Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621A1CCD1A5
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 09:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D23510E5A1;
	Tue, 21 Oct 2025 09:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mC4lB4Ep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8741510E5A1
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 09:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761037588; x=1792573588;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vl091y6rMQf9tI+vgVy5VmG/3DiYqZZxUh+iUqXlnp0=;
 b=mC4lB4Epb6q59IdGPfIqC4M9py/p3Qt2uftugFCpAzA3R/3PrY9lPnFm
 mQyOvrhRiUeUTPzRJcTTKioPgb82qvB67R/HC9X9c9ClKz6bwScly6Ry7
 ZesA8NCxHyietyj1AB71zqmrI62J7OfynXlcOQvbrD8+1ARqhMnb+bMH8
 jjN3qNC6zzb01jMFpZV1qrGM7Q/2NlXA6WiZKkmpJtWAVWkjsFny4xDuU
 8l/eOSr5tozomQxKnBiau1UcGY/58fcAHGFqf8wqkQHmuNOR2vjEtaJeK
 kDYUA0paWah1lIJ8emTAz+vdBM/RW+AY3yMdXzIRpP97YOaOYvydZdpxr A==;
X-CSE-ConnectionGUID: vgkddzZGTBus4H+TTMGGig==
X-CSE-MsgGUID: j2d7ypqdSFOaJy5Bw32d5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62191282"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="62191282"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 02:06:27 -0700
X-CSE-ConnectionGUID: D5/yEpIFQgS37HkYAfk0Jw==
X-CSE-MsgGUID: vRhMbK6CT++depZQpe387g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="214503367"
Received: from opintica-mobl1 (HELO [10.245.245.172]) ([10.245.245.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 02:06:26 -0700
Message-ID: <92540c50-58ee-4234-bf03-d089c4f35953@intel.com>
Date: Tue, 21 Oct 2025 10:06:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/xe/configfs: add disable_mem_copy knob
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
References: <20251020125431.41153-9-matthew.auld@intel.com>
 <20251020125431.41153-16-matthew.auld@intel.com>
 <jvvrjixujx5hz2o7x7szsqhjvgbze6a5wtzbifclltsffg72ir@rm243p6z4zlo>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <jvvrjixujx5hz2o7x7szsqhjvgbze6a5wtzbifclltsffg72ir@rm243p6z4zlo>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 21/10/2025 03:18, Lucas De Marchi wrote:
> On Mon, Oct 20, 2025 at 01:54:39PM +0100, Matthew Auld wrote:
>> For easier experimentation/comparison allow turning off the newer
>> MEM_COPY path, without needing to apply manual hacks and build a new
>> kernel. This needs to be configured before fully probing the device.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_configfs.c | 65 ++++++++++++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_configfs.h |  2 +
>> drivers/gpu/drm/xe/xe_pci.c      |  4 +-
>> 3 files changed, 70 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/ 
>> xe_configfs.c
>> index c1419a270fa4..df459daa0f07 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -236,6 +236,15 @@
>>  *
>>  * This setting only takes effect when probing the device.
>>  *
>> + * Disable MEM_COPY path
>> + * -----------------------------------------------------
>> + * This config will force the use of the older XY_FAST_COPY 
>> instruction in the migration code.
>> + * Intended only for experimentation.
>> + *
>> + *    # echo 1 > /sys/kernel/config/xe/0000:03:00.0/disable_mem_copy
>> + *
>> + * This setting only takes effect when probing the device.
>> + *
>>  * Remove devices
>>  * ==============
>>  *
>> @@ -264,6 +273,9 @@ struct xe_config_group_device {
>>         struct {
>>             unsigned int max_vfs;
>>         } sriov;
>> +        struct {
>> +            bool disable_mem_copy;
>> +        } migrate;
> 
> so this is migrate.disable_mem_copy
> 
> ...
> 
>> CONFIGFS_ATTR(, ctx_restore_mid_bb);
>> CONFIGFS_ATTR(, ctx_restore_post_bb);
>> +CONFIGFS_ATTR(, disable_mem_copy);
> 
> but the attribute is a misleading "disable_mem_copy".

I was just trying to group the migrate related knobs under one struct 
since there could potentially be more in the future. Should that be 
reflected in the attribute? Should we do migrate_disable_mem_copy or did 
you mean something else here?

> 
> Note that configfs is not a place for hacks so if it's generally useful
> we need to think of a name that is not misleading and will be
> future-proof. This seems more like "the MEM_COPY for migration is a new
> path and we may have bugs or we want to compare them in the short term".
> Did I misunderstand the purpose of the patch?

Yeah, it's likely more a short/medium term thing. Although I did also 
use it to quickly test both paths on one machine. Happy to drop this 
one, if this is not a good fit.

> 
> Lucas De Marchi

