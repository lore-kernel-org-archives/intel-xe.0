Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451F3FED3EA
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 16:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4AA10E3EC;
	Fri, 24 Apr 2026 16:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="CH9UZO0X";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F25210E3EC
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 16:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1777046588;
 bh=74wcFbX31LLTacwW895+s9BGxUexxeBqrZLsskclhjI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CH9UZO0X1+XHI59fG6jZ5leDMZbWLvQzKekAPJKLC7wrhPA8HoYb4ZUOBW9052Bg6
 K8vv+A6IeuEg19lZW6QPj/U9cas++lt0UICZH1Quou12GNent9c6dSWFShXfglT3SL
 ru09AvlhnUewhEZpeaBBInfF4zmGmfx39puux2rEs6tpS6tkwn2vWwuZaEfTz6fS9l
 h5yg7/8Bap/rzmAwcEGcG+Kqi5iHXogNeg0dyCiLAggrg+ygMX/IMolK8NTYpy7Jiu
 DNyCuWuoe6mZG9/oH93rB5iujvildeyvJLHNZ5Z3ZeXzFXawcUFkaFO7SwBjBbYND/
 6564Tx5xXr9Jg==
Message-ID: <92850c9a-808e-47b9-ae5f-fa10c4bda3ce@lankhorst.se>
Date: Fri, 24 Apr 2026 18:03:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: Fix resizable bar fails due to bridge memory region
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <7f673ce8-fa00-47aa-a50f-812ae5073279@lankhorst.se>
 <ee594d2d-f5c8-271b-e883-9d43a47ad4ff@linux.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <ee594d2d-f5c8-271b-e883-9d43a47ad4ff@linux.intel.com>
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

Hey,

Den 2026-04-24 kl. 17:04, skrev Ilpo Järvinen:
> On Fri, 24 Apr 2026, Maarten Lankhorst wrote:
> 
>> I encountered a problem that I have on my system, where I cannot resize
>> the bar because one of the bridges has a 
> 
> You're missing words from here. But I can guess you've that extra BAR on 
> in-card the bridge.
> 
>> If I take a look at the topology, the GPU shares the memory region with a bridge,
>>
>> +-[0000:64]-+-00.0-[65-68]----00.0-[66-68]--+-01.0-[67]----00.0
>>
>> The specific bridge likely causing a failure is:
>>
>> 65:00.0 PCI bridge: Intel Corporation Device e2ff (rev 01) (prog-if 00 [Normal decode])
>>         Flags: bus master, fast devsel, latency 0, IRQ 32, IOMMU group 1
>>         Memory at 382400000000 (64-bit, prefetchable) [size=8M]
>>         ....
>>
>> Which causes upstream bridge 64:00.0 initially to allocate the region
>> [38fe0000000-38ff0000000) for the GPU, and [382ff0000000..382ff07fffff]
>> for the bridge device.
>>
>> Bridge 64 is big enough for 1 BMG with a 32 GB bar and the second 8 MB allocation:
>> pci_bus 0000:64: resource 9 [mem 0x382000000000-0x382fffffffff window] (64GB window)
>>
>> The reason for failure is that bridge 65 has a 8 MB memory region assigned,
> 
>> and previously it was ignored when reallocating.
> 
> What does this mean? I don't think it was ever ignored while 
> reallocating??
> 
> Note that kernel has become much more verbose in explaining why things 
> fail so perhaps the added message is confusing you (they won't appear in 
> the old kernels).
> 
>> Failing case:
>> xe 0000:67:00.0: [drm] Attempting to resize bar from 256MiB -> 16384MiB
>> xe 0000:67:00.0: BAR 2 [mem 0x382fe0000000-0x382fefffffff 64bit pref]: releasing
>> pcieport 0000:66:01.0: bridge window [mem 0x382fe0000000-0x382fefffffff 64bit pref]: releasing
>> pcieport 0000:65:00.0: bridge window [mem 0x382fe0000000-0x382fefffffff 64bit pref]: releasing
>> pcieport 0000:64:00.0: bridge window [mem 0x382fe0000000-0x382ff07fffff 64bit pref]: was not released (still contains assigned resources)
>> pcieport 0000:65:00.0: bridge window [mem size 0x400000000 64bit pref]: can't assign; no space
>> pcieport 0000:65:00.0: bridge window [mem size 0x400000000 64bit pref]: failed to assign
>> pcieport 0000:65:00.0: bridge window [mem size 0x400000000 64bit pref]: can't assign; no space
>> pcieport 0000:65:00.0: bridge window [mem size 0x400000000 64bit pref]: failed to assign
>> pcieport 0000:66:01.0: bridge window [mem size 0x400000000 64bit pref]: can't assign; no space
>> pcieport 0000:66:01.0: bridge window [mem size 0x400000000 64bit pref]: failed to assign
>> pcieport 0000:66:01.0: bridge window [mem size 0x400000000 64bit pref]: can't assign; no space
>> pcieport 0000:66:01.0: bridge window [mem size 0x400000000 64bit pref]: failed to assign
>> xe 0000:67:00.0: BAR 2 [mem size 0x400000000 64bit pref]: can't assign; no space
>> xe 0000:67:00.0: BAR 2 [mem size 0x400000000 64bit pref]: failed to assign
>> xe 0000:67:00.0: BAR 2 [mem size 0x400000000 64bit pref]: can't assign; no space
>> xe 0000:67:00.0: BAR 2 [mem size 0x400000000 64bit pref]: failed to assign
>> pcieport 0000:64:00.0: PCI bridge to [bus 65-68]
>> pcieport 0000:64:00.0:   bridge window [mem 0xd7000000-0xd83fffff]
>> pcieport 0000:64:00.0:   bridge window [mem 0x382fe0000000-0x382ff07fffff 64bit pref]
>> pcieport 0000:65:00.0: PCI bridge to [bus 66-68]
>> pcieport 0000:65:00.0:   bridge window [mem 0xd7000000-0xd83fffff]
>> pcieport 0000:65:00.0:   bridge window [mem 0x382fe0000000-0x382fefffffff 64bit pref]
>> pcieport 0000:66:01.0: PCI bridge to [bus 67]
>> pcieport 0000:66:01.0:   bridge window [mem 0xd7000000-0xd81fffff]
>> pcieport 0000:66:01.0:   bridge window [mem 0x382fe0000000-0x382fefffffff 64bit pref]
>>
>> Working with the patch below:
>> xe 0000:67:00.0: [drm] Attempting to resize bar from 256MiB -> 16384MiB
>> xe 0000:67:00.0: BAR 2 [mem 0x382fe0000000-0x382fefffffff 64bit pref]: releasing
>> pcieport 0000:66:01.0: bridge window [mem 0x382fe0000000-0x382fefffffff 64bit pref]: releasing
>> pcieport 0000:65:00.0: bridge window [mem 0x382fe0000000-0x382fefffffff 64bit pref]: releasing
>> pcieport 0000:65:00.0: BAR 0 [mem 0x382ff0000000-0x382ff07fffff 64bit pref]: releasing
>> pcieport 0000:64:00.0: bridge window [mem 0x382fe0000000-0x382ff07fffff 64bit pref]: releasing
>> pcieport 0000:64:00.0: bridge window [mem 0x382000000000-0x3824007fffff 64bit pref]: assigned
>> pcieport 0000:65:00.0: bridge window [mem 0x382000000000-0x3823ffffffff 64bit pref]: assigned
>> pcieport 0000:65:00.0: BAR 0 [mem 0x382400000000-0x3824007fffff 64bit pref]: assigned
>> pcieport 0000:66:01.0: bridge window [mem 0x382000000000-0x3823ffffffff 64bit pref]: assigned
>> xe 0000:67:00.0: BAR 2 [mem 0x382000000000-0x3823ffffffff 64bit pref]: assigned
>> pcieport 0000:64:00.0: PCI bridge to [bus 65-68]
>> pcieport 0000:64:00.0:   bridge window [mem 0xd7000000-0xd83fffff]
>> pcieport 0000:64:00.0:   bridge window [mem 0x382000000000-0x3824007fffff 64bit pref]
>> pcieport 0000:65:00.0: PCI bridge to [bus 66-68]
>> pcieport 0000:65:00.0:   bridge window [mem 0xd7000000-0xd83fffff]
>> pcieport 0000:65:00.0:   bridge window [mem 0x382000000000-0x3823ffffffff 64bit pref]
>> pcieport 0000:65:00.0: PCI bridge to [bus 66-68]
>> pcieport 0000:65:00.0:   bridge window [mem 0xd7000000-0xd83fffff]
>> pcieport 0000:65:00.0:   bridge window [mem 0x382000000000-0x3823ffffffff 64bit pref]
>> pcieport 0000:66:01.0: PCI bridge to [bus 67]
>> pcieport 0000:66:01.0:   bridge window [mem 0xd7000000-0xd81fffff]
>> pcieport 0000:66:01.0:   bridge window [mem 0x382000000000-0x3823ffffffff 64bit pref]
>> xe 0000:67:00.0: [drm] BAR2 resized to 16384MiB
>>
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>> I'm not 100% this is the correct fix, I don't know why the bridge itself has
>> a memory region, why the kernel allocates it and when it's supposed to
>> be used. Not a PCI expert. :-)
> 
> I don't know why it is there either. Nothing in the portdrv really uses it 
> for anything. There is patchset somewhere lying around which adds a quirk 
> that releases the "extra" BAR.

Thank you, I've taken a look at that patch series. It looks like patch 1/2
would help a lot.

I'm wondering if it will completely fix the issue, it is still possible
that in the same config I have 2 identical cards, where resizing might
work, but when GPU1's VRAM BAR is already bound, it might be unable
to resize GPU2's VRAM BAR for the same reason as this patch.

What would be the best way to handle this case?

Kind regards,
~Maarten Lankhorst
