Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196D0C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 05:15:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D3310E6D1;
	Wed, 13 Dec 2023 05:15:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2016010E6D1
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 05:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702444544; x=1733980544;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xrqFnyzpVp/RgV5Vg/8KUPKONKYkkapRVb+PoQc2oU8=;
 b=YawY4NvrD60K1SHOb25IzZUexZNIe5rOZxC7aVte5JaPYL+SutGGka02
 gK4znnjZhGArZ4QOotVsT798egiV0xKel9UwcB4p/MgsCOJkf9YkbFfzH
 C7eZWrF88geaMUupZmnDgKs+USnZX1qbsNVP8SPc5vBsqPli31DtxOUy2
 ZvtDIZnpA/FhoqQkJST7sdLTzvDD8iGu7//kj0RqTGS2q1AYr0wyiyNNl
 RrbM3rm6ocUAWmREHQOfypfvNufVgWNPzMSI1eeK78C/QY5myYY8IYfrA
 RV4mwCV+Sr7y4xdA7GfXh+l6uR2rQTY+TnnAtHlTWUjG0utNGn3Tg4vik Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="375068909"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; d="scan'208";a="375068909"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 21:15:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="767082848"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; d="scan'208";a="767082848"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 21:15:41 -0800
Message-ID: <ca95972f-2d5d-4fc6-bca3-e80f984e79cf@linux.intel.com>
Date: Wed, 13 Dec 2023 10:48:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Remove vram size info from sysfs
Content-Language: en-US
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231212002058.1105898-1-rodrigo.vivi@intel.com>
 <SJ1PR11MB620471C7291527E350731CC0818DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <SJ1PR11MB620471C7291527E350731CC0818DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/13/23 09:43, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrigo
>> Vivi
>> Sent: Tuesday, December 12, 2023 5:51 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>
>> Subject: [PATCH] drm/xe: Remove vram size info from sysfs
>>
>> This information is already part of the query IOCTL.
>> Let's not duplicate it here in the sysfs.
> This patch was on request from L0 as they wanted actual VRAM size including reserved portion. We should check with UMD team if they require this sysfs or not. I will check.

Hi Rodrigo,

As Tejas mentioned the sysfs interface exposes the total physical vram including the stolen size which is needed by sysman, in the IOCTL only usable size(without stolen) is exposed.


Thanks,
Aravind.
>
> Tejas
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_tile_sysfs.c | 23 +----------------------
>>  1 file changed, 1 insertion(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> index 16376607c68f..0f8d3e7fce46 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> @@ -20,20 +20,6 @@ static const struct kobj_type xe_tile_sysfs_kobj_type = {
>>  	.sysfs_ops = &kobj_sysfs_ops,
>>  };
>>
>> -static ssize_t
>> -physical_vram_size_bytes_show(struct device *kdev, struct device_attribute
>> *attr,
>> -			      char *buf)
>> -{
>> -	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>> -
>> -	return sysfs_emit(buf, "%llu\n", tile->mem.vram.actual_physical_size);
>> -}
>> -
>> -static DEVICE_ATTR_RO(physical_vram_size_bytes);
>> -
>> -static const struct attribute *physical_memsize_attr =
>> -	&dev_attr_physical_vram_size_bytes.attr;
>> -
>>  static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
>>  	struct xe_tile *tile = arg;
>> @@ -64,15 +50,8 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>
>>  	tile->sysfs = &kt->base;
>>
>> -	if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>> -	    sysfs_create_file(tile->sysfs, physical_memsize_attr))
>> -		drm_warn(&xe->drm,
>> -			 "Sysfs creation to read addr_range per tile failed\n");
>> -
>>  	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>> -	if (err) {
>> +	if (err)
>>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset
>> failed, err: %d\n",
>>  			 __func__, err);
>> -		return;
>> -	}
>>  }
>> --
>> 2.43.0
