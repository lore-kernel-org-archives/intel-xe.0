Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C381AC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 10:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EB610E990;
	Tue, 30 Apr 2024 10:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPXLgYRb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A9410E990
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 10:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714474302; x=1746010302;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wdift/qaQnr9Wys89LvAU/YkcHxdqh4Y/5/NSGbpfpE=;
 b=BPXLgYRbAPF2Yju3DbGnMgv0PZ2uQuRxDtwlJFEi7Tw2Nj6is2jB/iPt
 ZQyINblTBGNgoFLslz+yGaEn/yBR2G6rkUFlYFvXtSRqmtik8U3HBLhKL
 A1/wZ3Xxx8j6jJbN75Kt4xEAS5GqoGBfHwGQn7IF4qcF2e+UkLR/1VHvo
 lQpbcPWeuPR640N+LwpTEJ399aFgts+9muvDmBDm8ClWBd8g40FG7vJX2
 vmMZ18BO/QeR5jBD6RTvnCCJlzXrSoMjuvxOnwEvs+aYPZ7Deb+N4Cnvo
 dhybIZJPuDW+O+on0n3ngyN4Y0oEWSG9yRgm/zOEEXbAs3ys7kqhdQNxa g==;
X-CSE-ConnectionGUID: rxiGavp2ReWLsb7bHJKftg==
X-CSE-MsgGUID: qa3MRhA+S0qVbAPBDowiZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="20720152"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="20720152"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 03:51:41 -0700
X-CSE-ConnectionGUID: ViDwsc+uSpSnPsD1RcV18g==
X-CSE-MsgGUID: jIlPFj4iQpKpUp9WJWWiiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="57311000"
Received: from unknown (HELO [10.245.244.227]) ([10.245.244.227])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 03:51:40 -0700
Message-ID: <b26ea367-e9d2-478c-894d-bf8351162ad5@intel.com>
Date: Tue, 30 Apr 2024 11:51:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/xe: covert sysfs over to devm
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: michal.winiarski@intel.com, intel-xe@lists.freedesktop.org
References: <20240429121436.33013-9-matthew.auld@intel.com>
 <20240429121436.33013-10-matthew.auld@intel.com> <Zi-gYDEFzI_bXCzP@intel.com>
 <wtqag5pd5plbiubuhypzdr7jitxutcfbft2xtchwx3fbf4zzfm@pmokwtkmlnf4>
 <2b6f8692-79ad-4976-99ae-c2b227b893d9@intel.com> <Zi_qxhMrrlUc7hBz@intel.com>
 <7ik4xh7hncw6h62zvmv7vr43a3aedn3ft7sxv4xjvnf3glf2g6@h72yiizlvqje>
 <87le4v2qbq.fsf@intel.com>
 <300c0cce-80f7-416a-b1c1-ede6930e8fda@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <300c0cce-80f7-416a-b1c1-ede6930e8fda@linux.intel.com>
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

On 30/04/2024 10:42, Aravind Iddamsetty wrote:
> 
> On 30/04/24 14:13, Jani Nikula wrote:
>> On Mon, 29 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> On Mon, Apr 29, 2024 at 02:45:26PM GMT, Rodrigo Vivi wrote:
>>>> On Mon, Apr 29, 2024 at 04:17:54PM +0100, Matthew Auld wrote:
>>>>> On 29/04/2024 14:52, Lucas De Marchi wrote:
>>>>>> On Mon, Apr 29, 2024 at 09:28:00AM GMT, Rodrigo Vivi wrote:
>>>>>>> On Mon, Apr 29, 2024 at 01:14:38PM +0100, Matthew Auld wrote:
>>>>>>>> Hotunplugging the device seems to result in stuff like:
>>>>>>>>
>>>>>>>> kobject_add_internal failed for tile0 with -EEXIST, don't try to
>>>>>>>> register things with the same name in the same directory.
>>>>>>>>
>>>>>>>> We only remove the sysfs as part of drmm, however that is tied to the
>>>>>>>> lifetime of the driver instance and not the device underneath. Attempt
>>>>>>>> to fix by using devm for all of the remaining sysfs stuff related to the
>>>>>>>> device.
>>>>>>> hmmm... so basically we should use the drmm only for the global module
>>>>>>> stuff and the devm for things that are per device?
>>>>>> that doesn't make much sense. drmm is supposed to run when the driver
>>>>>> unbinds from the device... basically when all refcounts are gone with
>>>>>> drm_dev_put().  Are we keeping a ref we shouldn't?
>>>>> It's run when all refcounts are dropped for that particular drm_device, but
>>>>> that is separate from the physical device underneath (struct device). For
>>>>> example if something has an open driver fd the drmm release action is not
>>>>> going to be called until after that is also closed. But in the meantime we
>>>>> might have already removed the pci device and re-attached it to a newly
>>>>> allocated drm_device/xe_driver instance, like with hotunplug.
>>>>>
>>>>> For example, currently we don't even call basic stuff like guc_fini() etc.
>>>>> when removing the pci device, but rather when the drm_device is released,
>>>>> which sounds quite broken.
>>>>>
>>>>> So roughly drmm is for drm_device software level stuff and devm is for stuff
>>>>> that needs to happen when removing the device. See also the doc for drmm:
>>>>> https://elixir.bootlin.com/linux/v6.8-rc1/source/drivers/gpu/drm/drm_managed.c#L23
>>>>>
>>>>> Also: https://docs.kernel.org/gpu/drm-uapi.html#device-hot-unplug
>>> yeah... I think you convinced me
>> You've all also convinced me this is a PITA to get right for every
>> contribution. If there's one thing I've learned, people will just cargo
>> cult this stuff, and pick one or the other depending on what they happen
>> to see. Needs vigilant review.
>>
>> BR,
>> Jani.
>>
>>
>>>> Cc: Aravind and Michal since this likely relates to the FLR discussion...
>>>>
>>>> but it looks to me that we should move more towards the devm_ and limit
>>>> the usage of drmm_ to some very specific cases...
> 
> Hi Matt,
> 
> so if we do not destroy the previous instance from drm_device and re create a new one I
> believe the drm_device naming keeps changing I believe it is allowed from driver pov but
> from system or UMDs pov can they expect the card to be renamed.
> 
> eg: /dev/dri/card0 ->> /dev/dri/card1

Yes, that looks to be the case. We get a completely new drm_device with 
a different card number. The card0 will still be there until the 
corresponding drm_device instance can be safely released, assuming 
something is still keeping it alive.

 From the drm docs:

"From userspace perspective everything needs to keep on working more or 
less, until userspace stops using the disappeared DRM device and closes 
it completely. Userspace will learn of the device disappearance from the 
device removed uevent, ioctls returning ENODEV (or driver-specific 
ioctls returning driver-specific things), or open() returning ENXIO.

Only after userspace has closed all relevant DRM device and dmabuf file 
descriptors and removed all mmaps, the DRM driver can tear down its 
instance for the device that no longer exists. If the same physical 
device somehow comes back in the mean time, it shall be a new DRM device."

> 
> Thanks,
> Aravind.
>>> agreed,
>>>
>>> Lucas De Marchi
>>>
>>>>>> Lucas De Marchi
