Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFF3C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 09:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2541910F7A6;
	Tue, 30 Apr 2024 09:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdzXvHTL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BC610F7A6
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 09:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714470001; x=1746006001;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ffKiOoWeTLLyeReU7GET89XmOVg09CLdXQwtLSdiAmw=;
 b=KdzXvHTLzYhrbTx7NDUEsJPgJ9j4wjM1KINMoNvZ8QPksOsJoq7D6RKv
 qidIZ0IAXQMF6p3RtbLOf74YT2yvlPe+EShkvjZKbUicg2eQxQDw7sZnW
 J//Bjl6j6gAiBK4/KZmorKDkfHnc3SvQ47Z0i5aD9d0YEzVU/XEWcOXoi
 IO8VOTxGuA3euU7Kmr70tWCOAxD1AoeyMKAfMIxn9WPgSF7q78sCFAH6m
 8L5GCSrvLzatF8wSZ31aXlWavpI8OvVxzUbTQdKvCYUOv6pFdo8h3vZfB
 PREjqtboKneuvgyZdaNaCYvbtjXgP/vCyBNzIMm69PDMXIgN4nMNnZvue w==;
X-CSE-ConnectionGUID: u1qKZ/cfRdqNyrnNjFBvCw==
X-CSE-MsgGUID: WgmBYH9IQ/iL4OlQV7o6ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10041003"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="10041003"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 02:40:01 -0700
X-CSE-ConnectionGUID: f95dJ2EnR5u88KjdX0ovKw==
X-CSE-MsgGUID: ofISdcFMQP+apCjld1v9lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="26350866"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 02:39:58 -0700
Message-ID: <300c0cce-80f7-416a-b1c1-ede6930e8fda@linux.intel.com>
Date: Tue, 30 Apr 2024 15:12:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/xe: covert sysfs over to devm
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, michal.winiarski@intel.com,
 intel-xe@lists.freedesktop.org
References: <20240429121436.33013-9-matthew.auld@intel.com>
 <20240429121436.33013-10-matthew.auld@intel.com> <Zi-gYDEFzI_bXCzP@intel.com>
 <wtqag5pd5plbiubuhypzdr7jitxutcfbft2xtchwx3fbf4zzfm@pmokwtkmlnf4>
 <2b6f8692-79ad-4976-99ae-c2b227b893d9@intel.com> <Zi_qxhMrrlUc7hBz@intel.com>
 <7ik4xh7hncw6h62zvmv7vr43a3aedn3ft7sxv4xjvnf3glf2g6@h72yiizlvqje>
 <87le4v2qbq.fsf@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <87le4v2qbq.fsf@intel.com>
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


On 30/04/24 14:13, Jani Nikula wrote:
> On Mon, 29 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Mon, Apr 29, 2024 at 02:45:26PM GMT, Rodrigo Vivi wrote:
>>> On Mon, Apr 29, 2024 at 04:17:54PM +0100, Matthew Auld wrote:
>>>> On 29/04/2024 14:52, Lucas De Marchi wrote:
>>>>> On Mon, Apr 29, 2024 at 09:28:00AM GMT, Rodrigo Vivi wrote:
>>>>>> On Mon, Apr 29, 2024 at 01:14:38PM +0100, Matthew Auld wrote:
>>>>>>> Hotunplugging the device seems to result in stuff like:
>>>>>>>
>>>>>>> kobject_add_internal failed for tile0 with -EEXIST, don't try to
>>>>>>> register things with the same name in the same directory.
>>>>>>>
>>>>>>> We only remove the sysfs as part of drmm, however that is tied to the
>>>>>>> lifetime of the driver instance and not the device underneath. Attempt
>>>>>>> to fix by using devm for all of the remaining sysfs stuff related to the
>>>>>>> device.
>>>>>> hmmm... so basically we should use the drmm only for the global module
>>>>>> stuff and the devm for things that are per device?
>>>>> that doesn't make much sense. drmm is supposed to run when the driver
>>>>> unbinds from the device... basically when all refcounts are gone with
>>>>> drm_dev_put().  Are we keeping a ref we shouldn't?
>>>> It's run when all refcounts are dropped for that particular drm_device, but
>>>> that is separate from the physical device underneath (struct device). For
>>>> example if something has an open driver fd the drmm release action is not
>>>> going to be called until after that is also closed. But in the meantime we
>>>> might have already removed the pci device and re-attached it to a newly
>>>> allocated drm_device/xe_driver instance, like with hotunplug.
>>>>
>>>> For example, currently we don't even call basic stuff like guc_fini() etc.
>>>> when removing the pci device, but rather when the drm_device is released,
>>>> which sounds quite broken.
>>>>
>>>> So roughly drmm is for drm_device software level stuff and devm is for stuff
>>>> that needs to happen when removing the device. See also the doc for drmm:
>>>> https://elixir.bootlin.com/linux/v6.8-rc1/source/drivers/gpu/drm/drm_managed.c#L23
>>>>
>>>> Also: https://docs.kernel.org/gpu/drm-uapi.html#device-hot-unplug
>> yeah... I think you convinced me
> You've all also convinced me this is a PITA to get right for every
> contribution. If there's one thing I've learned, people will just cargo
> cult this stuff, and pick one or the other depending on what they happen
> to see. Needs vigilant review.
>
> BR,
> Jani.
>
>
>>> Cc: Aravind and Michal since this likely relates to the FLR discussion...
>>>
>>> but it looks to me that we should move more towards the devm_ and limit
>>> the usage of drmm_ to some very specific cases...

Hi Matt,

so if we do not destroy the previous instance from drm_device and re create a new one I
believe the drm_device naming keeps changing I believe it is allowed from driver pov but
from system or UMDs pov can they expect the card to be renamed.

eg: /dev/dri/card0 ->> /dev/dri/card1

Thanks,
Aravind.
>> agreed,
>>
>> Lucas De Marchi
>>
>>>>> Lucas De Marchi
