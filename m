Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBD3C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 15:18:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CF610E190;
	Mon, 29 Apr 2024 15:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K5laEWnM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF4110E2BA
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 15:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714403889; x=1745939889;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=o3l/zzzJsIvD5W6jNHy5QGiEeVngKs8wV1kKC0wzE9M=;
 b=K5laEWnMg4jMFQj3WEkKwL27FOJnZgiY6qOFZZlmmg9yhBhgSVeBqI+5
 G+bXmTeCC6EnMt1UdNJhu5y0j/54iQP1X7yxeRW7ibmZKwwCKAnQpVLic
 CiLch/nrcuMwQbLOHVdjaW639Blkypo2F5YjYhK7WiLNtaK8dssfQs5du
 e1KdwTggQf23XSICqL00N1J+Ne6My71Y9XlPGkO1IwJIoYZc0+q7gZphM
 syUwwM8+QVn8X0CPt7ZgJnPXLzUN3YGIA67F55M7UQOr94okvjXimD/AA
 VfGhZBUa6ONxfbgL0caXLL8Rqokobs0PgXn+msDev35mpko6YhRsop06C A==;
X-CSE-ConnectionGUID: 1h94nJINRjWjQ+c/MXqt4A==
X-CSE-MsgGUID: F5yZNdbWROe70ttz3S4XDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13001341"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="13001341"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 08:18:02 -0700
X-CSE-ConnectionGUID: SIDCMLFbSwWxmQuqrrEByw==
X-CSE-MsgGUID: DB8E2+fvR5qAxf3aG27g2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26014215"
Received: from unknown (HELO [10.245.244.199]) ([10.245.244.199])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 08:17:57 -0700
Message-ID: <2b6f8692-79ad-4976-99ae-c2b227b893d9@intel.com>
Date: Mon, 29 Apr 2024 16:17:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/xe: covert sysfs over to devm
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240429121436.33013-9-matthew.auld@intel.com>
 <20240429121436.33013-10-matthew.auld@intel.com> <Zi-gYDEFzI_bXCzP@intel.com>
 <wtqag5pd5plbiubuhypzdr7jitxutcfbft2xtchwx3fbf4zzfm@pmokwtkmlnf4>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <wtqag5pd5plbiubuhypzdr7jitxutcfbft2xtchwx3fbf4zzfm@pmokwtkmlnf4>
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

On 29/04/2024 14:52, Lucas De Marchi wrote:
> On Mon, Apr 29, 2024 at 09:28:00AM GMT, Rodrigo Vivi wrote:
>> On Mon, Apr 29, 2024 at 01:14:38PM +0100, Matthew Auld wrote:
>>> Hotunplugging the device seems to result in stuff like:
>>>
>>> kobject_add_internal failed for tile0 with -EEXIST, don't try to
>>> register things with the same name in the same directory.
>>>
>>> We only remove the sysfs as part of drmm, however that is tied to the
>>> lifetime of the driver instance and not the device underneath. Attempt
>>> to fix by using devm for all of the remaining sysfs stuff related to the
>>> device.
>>
>> hmmm... so basically we should use the drmm only for the global module
>> stuff and the devm for things that are per device?
> 
> that doesn't make much sense. drmm is supposed to run when the driver
> unbinds from the device... basically when all refcounts are gone with
> drm_dev_put().  Are we keeping a ref we shouldn't?

It's run when all refcounts are dropped for that particular drm_device, 
but that is separate from the physical device underneath (struct 
device). For example if something has an open driver fd the drmm release 
action is not going to be called until after that is also closed. But in 
the meantime we might have already removed the pci device and 
re-attached it to a newly allocated drm_device/xe_driver instance, like 
with hotunplug.

For example, currently we don't even call basic stuff like guc_fini() 
etc. when removing the pci device, but rather when the drm_device is 
released, which sounds quite broken.

So roughly drmm is for drm_device software level stuff and devm is for 
stuff that needs to happen when removing the device. See also the doc 
for drmm:
https://elixir.bootlin.com/linux/v6.8-rc1/source/drivers/gpu/drm/drm_managed.c#L23

Also: https://docs.kernel.org/gpu/drm-uapi.html#device-hot-unplug

> 
> Lucas De Marchi
