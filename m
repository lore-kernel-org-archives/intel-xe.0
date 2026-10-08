Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7E3CA600C
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 16:22:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AB710E0A4;
	Thu,  8 Oct 2026 16:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VFFhPaQZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614E310E0A4
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 16:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791476539; x=1823012539;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xVZ355Y796kEFk8f/FDFJdmev/L0fW9uqMkHI2vTCuQ=;
 b=VFFhPaQZbGSH2kwOiYAFHe4+PIl78Temr1g+7pAVpngEMXh22Ts6fdQx
 cUwIHuePTbrlzQ8MK9S1Ogz0StAkQYiAXEp5eJJ1mL1TZ4zfQ6b/jzXVO
 Jc9mLnOUGNXgtCzNePcQlM41lZDtptLIdXUUjpRi/yAHAqQEXFB158z7a
 LVGp8yN1K/2qAcNLvaqCJFaIbHBYf2kUzQYjvzODrqTw8zirG9iV9oYAE
 0+y5QuMMn9X69Ybdo4kyQvFG+JrObamOS75lum7u7dahRhRoH426+IJ9T
 ZOEOPSTgpN1l/4DMHU31G/Ttk4qrsf4sRjtjCfRJUEmonTO0ewBsqfR/s g==;
X-CSE-ConnectionGUID: 8QQtr0O5RqqnvS4Vw66+ig==
X-CSE-MsgGUID: kA/mwY8nSl6H2IMf3udPdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="159943"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="159943"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 09:22:19 -0700
X-CSE-ConnectionGUID: MxEPE7v5T5+EujOfZyWSuQ==
X-CSE-MsgGUID: JucHAw1iTMmT9XS5FAn2wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="46975"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.245.132])
 ([10.245.245.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 09:22:18 -0700
Message-ID: <9ca279c6-dcfa-4caf-a00f-d3af0a2ddf1d@intel.com>
Date: Thu, 8 Oct 2026 17:22:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe: skip p2p for suspected display buffers
To: Simon Richter <Simon.Richter@hogyros.de>, intel-xe@lists.freedesktop.org
References: <20261007153605.1743626-5-matthew.auld@intel.com>
 <20261007153605.1743626-8-matthew.auld@intel.com>
 <2c6a97ac21c5ef161dbac279f9b971f383b6b944.camel@linux.intel.com>
 <dbabed4e-468d-4ecf-b295-f5d8c9c4b263@intel.com>
 <9d0c9f3c-acb8-4566-b313-a9eb8f17f332@hogyros.de>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <9d0c9f3c-acb8-4566-b313-a9eb8f17f332@hogyros.de>
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

Hi,

On 08/10/2026 15:40, Simon Richter wrote:
> Hi,
> 
> On 10/8/26 18:46, Matthew Auld wrote:
> 
>> From the user bug report it sounds like the dgpu linear window buffer 
>> exported to the compositor (igpu) is dual placement VRAM + TT, and so 
>> this now attempts to keep that memory in VRAM instead of moving it. 
>> Compositor then uses p2p to access it. It works but performance falls 
>> off a massive cliff here.
> 
> Is that because it is using external memory as a texture source, or 
> because copy operations are slow for some reason?

Not sure tbh.

> 
> If it is for a texture, the client should say so explicitly during the 
> import, e.g. a Vulkan[1] client would give a 
> VkExternalMemoryImageCreateInfo pointer in pNext, and fill out usage as 
> VK_IMAGE_USAGE_SAMPLED_BIT.
> 
> I think this would be the ideal point to either make sure the image ends 
> up in host memory, or reject it so the compositor can detect that this 
> is not a good texture source, and insert an extra transfer.

I think user reported that Vulkan was unaffected, it's just OpenGL. From 
kernel pov, we don't really know if we are actually meant to use p2p, or 
move to system memory, since we are lacking any kind of hint. This is 
maybe a miss. We just end up with a valid looking buffer with a dual 
placement that gets exported to amdgpu. On amd CPUs they allow p2p, even 
for igpu. So when user updated their kernel version, where the 
MOVE_NOTIFY config got removed and enabled by default this suddenly gave 
them the p2p path with buffer staying in VRAM, whereas before the buffer 
would have been correctly moved to system memory by the kernel.

> 
>     Simon
> 
> [1] Presumably, other graphics APIs have something similar.

