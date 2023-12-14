Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD8AC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 05:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53FC10E8B1;
	Thu, 14 Dec 2023 05:49:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AFE10E8B1
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 05:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702532988; x=1734068988;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lRUGU/3CeZKUUGkulPDU4Zzchj6AMF8Zf1ZEdLFSyXE=;
 b=nE7pr4lykZtXs6XXdVMi1CkcB+Vm8JhqhLNYHjNWoqZFWrHyMvncgOeH
 J+Bs8+/GzOTZX5Vngpfw96bewOJlZpnNsla0Zhhfdl5UjSpb0m9RHFQkD
 sYvu1+MJ9hQNKyD6e3BCkWYJ7eHv4AvpsHNtTPpbmyOKeK5JKSdLVudYd
 1gV5+jJxkmbOrzzFfhWGQXESjJiitgqxBD3O2NT5pSlM3H634wLW14HgT
 0Xvf1XJriG8dOmd9XZx/wDvq8RxsBPX6fXd0qQSPl+2xOt+BOe0p9q2re
 9cRl/OeGoZ4FFwa/xXE7xDFkichYmk5TNNaXR62VhMVkcVBQw8CSgQ5DJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="461540173"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="461540173"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 21:49:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="844590637"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="844590637"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 21:49:29 -0800
Message-ID: <63d56a37-5460-4c32-abf7-7860f358023d@linux.intel.com>
Date: Thu, 14 Dec 2023 11:22:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Remove vram size info from sysfs
Content-Language: en-US
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
References: <20231212002058.1105898-1-rodrigo.vivi@intel.com>
 <SJ1PR11MB620471C7291527E350731CC0818DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ca95972f-2d5d-4fc6-bca3-e80f984e79cf@linux.intel.com>
 <5403be007f18a7df3e3dacb283794a4fb60185e0.camel@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <5403be007f18a7df3e3dacb283794a4fb60185e0.camel@intel.com>
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/13/23 21:23, Vivi, Rodrigo wrote:
> On Wed, 2023-12-13 at 10:48 +0530, Aravind Iddamsetty wrote:
>> On 12/13/23 09:43, Upadhyay, Tejas wrote:
>>>> -----Original Message-----
>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf
>>>> Of Rodrigo
>>>> Vivi
>>>> Sent: Tuesday, December 12, 2023 5:51 AM
>>>> To: intel-xe@lists.freedesktop.org
>>>> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Vivi, Rodrigo
>>>> <rodrigo.vivi@intel.com>
>>>> Subject: [PATCH] drm/xe: Remove vram size info from sysfs
>>>>
>>>> This information is already part of the query IOCTL.
>>>> Let's not duplicate it here in the sysfs.
>>> This patch was on request from L0 as they wanted actual VRAM size
>>> including reserved portion. We should check with UMD team if they
>>> require this sysfs or not. I will check.
>> Hi Rodrigo,
>>
>> As Tejas mentioned the sysfs interface exposes the total physical
>> vram including the stolen size which is needed by sysman, in the
>> IOCTL only usable size(without stolen) is exposed.
> I have removed it now so we can discuss better and ensure that we
> are taking the best uapi decisions that are acceptable and won't
> break the compatibility later after we are merged upstream.
>
> The time to break was now, so I removed.
>
> But we can continue with the discussion and see what is the best
> approach.
>
> My first question would be: why does Level0 needs to know the stolen
> size? So, why we don't add that information along with the query uapi?
As part of their memory property API(device property) it needs the total memory on the
card not just the usable.

https://spec.oneapi.io/level-zero/latest/sysman/api.html#_CPPv4N20zes_mem_properties_t12physicalSizeE

>
> It would be really awkward to see a value in the sysfs as total memory
> and a completely different value on the query ioclt? this stolen part
> apparently needs to be more transparent then, no?!
The query IOCTL is to show the usable memory for the application to know how much it can request hence stolen is removed.
while the sysfs is like a device property to show total memory on card.


Thanks,
Aravind.
>
>>
>> Thanks,
>> Aravind.
>>> Tejas
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_tile_sysfs.c | 23 +----------------------
>>>>  1 file changed, 1 insertion(+), 22 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>> index 16376607c68f..0f8d3e7fce46 100644
>>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>> @@ -20,20 +20,6 @@ static const struct kobj_type
>>>> xe_tile_sysfs_kobj_type = {
>>>>         .sysfs_ops = &kobj_sysfs_ops,
>>>>  };
>>>>
>>>> -static ssize_t
>>>> -physical_vram_size_bytes_show(struct device *kdev, struct
>>>> device_attribute
>>>> *attr,
>>>> -                             char *buf)
>>>> -{
>>>> -       struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>>>> -
>>>> -       return sysfs_emit(buf, "%llu\n", tile-
>>>>> mem.vram.actual_physical_size);
>>>> -}
>>>> -
>>>> -static DEVICE_ATTR_RO(physical_vram_size_bytes);
>>>> -
>>>> -static const struct attribute *physical_memsize_attr =
>>>> -       &dev_attr_physical_vram_size_bytes.attr;
>>>> -
>>>>  static void tile_sysfs_fini(struct drm_device *drm, void *arg) 
>>>> {
>>>>         struct xe_tile *tile = arg;
>>>> @@ -64,15 +50,8 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>
>>>>         tile->sysfs = &kt->base;
>>>>
>>>> -       if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>>> -           sysfs_create_file(tile->sysfs,
>>>> physical_memsize_attr))
>>>> -               drm_warn(&xe->drm,
>>>> -                        "Sysfs creation to read addr_range per
>>>> tile failed\n");
>>>> -
>>>>         err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini,
>>>> tile);
>>>> -       if (err) {
>>>> +       if (err)
>>>>                 drm_warn(&xe->drm, "%s: drmm_add_action_or_reset
>>>> failed, err: %d\n",
>>>>                          __func__, err);
>>>> -               return;
>>>> -       }
>>>>  }
>>>> --
>>>> 2.43.0
