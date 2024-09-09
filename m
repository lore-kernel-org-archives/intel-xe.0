Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AA6CE7AB0
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 05:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC91810E2B8;
	Mon,  9 Sep 2024 05:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yp5sn7c0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A68810E2B8
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Sep 2024 05:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725860371; x=1757396371;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mATxQnbmOs8QG9GvlM5RuLq++FJG/Htu+35/8+vTb8Y=;
 b=Yp5sn7c0M836Yq9st4hwVppk4sCw1rcMjonLAmg0bt3EQTBf02hyfLec
 E4H2yt/4f+W9C2Fh69zqE9XwBtR+5Bd33e8HM00pIJXQwDUm9I9hea9PK
 1PjJyZsEmY6alUKU8AUaVcymZeAIzngguENaUU0mvocGQwd6ncrqwS2f6
 acX+FYvm97yM5hK6e7XOQJ7OW34n8jx/IxpPn4/Pd0OXmo1spHDzIKxTA
 RJUadbyhM6rTm2T4RQOPjhD8BSaeZVUxkyUQmjugDm7tlRY60EbQYgAHy
 6+ZrTFVVMyz84q9zBdtnVFOZNvFGPTJalg/ZJetReyqvbmQCKhQEcl0dV A==;
X-CSE-ConnectionGUID: 9PhEiWF2RsGGFzqI4jr0vA==
X-CSE-MsgGUID: q80f3DLQSEinJkrUUqkVvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24643206"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="24643206"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2024 22:39:31 -0700
X-CSE-ConnectionGUID: qMbED8+3QxKxtB/y5ndC7g==
X-CSE-MsgGUID: Z1wFBQ69TtClRZ2NzPdq9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="66541940"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2024 22:39:29 -0700
Message-ID: <c3b198eb-6c71-4c8e-9d93-497c14740575@linux.intel.com>
Date: Mon, 9 Sep 2024 11:12:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/xe: Implement device shutdown to make kexec work.
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org
References: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
 <87frqeovgq.fsf@intel.com>
 <3cf1bdff-3abe-41b8-9078-c4fc5607f3e7@linux.intel.com>
 <ZtslkOB3kx4klloM@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <ZtslkOB3kx4klloM@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 06/09/24 21:23, Rodrigo Vivi wrote:
> On Fri, Sep 06, 2024 at 11:52:43AM +0200, Maarten Lankhorst wrote:
>>
>> Den 2024-09-05 kl. 19:34, skrev Jani Nikula:
>>> On Thu, 05 Sep 2024, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
>>>> Testcase:
>>>> kexec --reuse-cmdline --initrd=initrd.img -f vmlinuz
>>>>
>>>> Because we don't shut down xe correctly, we cannot reload xe afterwards.
>>>> Implement device shutdown by performing a FLR, then we can load the device
>>>> cleanly again afterwards.
>>> Maybe a silly question, but what's FLR?
>> Function level reset. It resets all the resources on the device, so display, all gt's etc are all turned off.
>> It's far faster than resetting each component separately. And it even works if display is the cause off a panic
>> since no locks are qrequired.
> Just to avoid confusion, I like to call this one as driver-initiated-FLR.
> It is a feature introduced back in gen11, I believe, where the driver can use
> MMIO to request the reset of many IP blocks including GT, SGUnit, Display, etc.
>
> But it is not the same as the full PCI Function Level Reset as some components
> won't get reset nor have the memory wiped out.
>
> The only way to get the PCI FLR is doing echo 1 to device/reset:
> echo 1 /sys/class/drm/card1/device/reset
>
> On my scripts when I want a full clean start I have something like this:
>
> echo -n "0000:00:02.0" | sudo tee /sys/bus/pci/drivers/i915/unbind
> echo -n 1 | sudo tee /sys/bus/pci/devices/0000\:00\:02.0/reset
> echo -n "0000:00:02.0" | sudo tee /sys/bus/pci/drivers/i915/bind
>
> Hopefully on Xe will be able to support the echo 1 > device/reset
> without having to unbind and reprobe:
>
> https://lore.kernel.org/intel-xe/20240422065756.294679-1-aravind.iddamsetty@linux.intel.com/
>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

will plan to revise it soon.

Thanks,
Aravind.
>
>> Cheers,
>> ~Maarten
