Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE0DC83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 03:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C929510E3E4;
	Tue, 22 Jul 2025 03:51:35 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C9B10E3E4
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 03:51:34 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 3EE133F108
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 05:51:31 +0200 (CEST)
Message-ID: <e27c8319-3439-481d-ab70-c9ccbb3db1b3@hogyros.de>
Date: Tue, 22 Jul 2025 12:51:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: hide mysterious 8MB 64-bit pref BAR on Intel Arc
 PCIe Switch
To: intel-xe@lists.freedesktop.org
References: <20250721173057.867829-1-uwu@icenowy.me>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20250721173057.867829-1-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

On 7/22/25 02:30, Icenowy Zheng wrote:

> When the PCI bus isn't configured by any firmware (e.g. a PCIe
> controller solely initialized by Linux kernel), the PCI space allocation
> algorithm of Linux will allocate the main VRAM BAR of Arc dGPU device at
> base+0, and then the 8MB BAR at base+256M, which prevents the main VRAM
> BAR gets resized. As the functionality and performance of Arc dGPU will
> get severely restricted with small BAR, this makes a problem.

Interestingly, the 8 MB BAR is assigned first and still ends up behind 
the 256 MB aperture:

pci 0033:01:00.0: BAR 0 [mem 0x6220020000000-0x62200207fffff 64bit 
pref]: assigned
pci 0033:03:00.0: BAR 2 [mem 0x6220000000000-0x622000fffffff 64bit 
pref]: assigned

and the bridge window is not much larger either:

pci 0033:02:01.0:   bridge window [mem 0x6220000000000-0x622001fffffff 
64bit pref]

but this does get cleaned up later:

xe 0033:03:00.0: [drm] Attempting to resize bar from 256MiB -> 16384MiB
xe 0033:03:00.0: BAR 2 [mem 0x6220000000000-0x622000fffffff 64bit pref]: 
releasing
pci 0033:02:01.0: bridge window [mem 0x6220000000000-0x622001fffffff 
64bit pref]: releasing
pci 0033:01:00.0: bridge window [mem 0x6220000000000-0x6223fbff0ffff 
64bit pref]: releasing
pci 0033:01:00.0: bridge window [mem 0x6220400000000-0x62207ffffffff 
64bit pref]: assigned
pci 0033:02:01.0: bridge window [mem 0x6220400000000-0x62207ffffffff 
64bit pref]: assigned
xe 0033:03:00.0: BAR 2 [mem 0x6220400000000-0x62207ffffffff 64bit pref]: 
assigned

I assume it works for me because the root bridge has a lot of room to 
expand, so nothing else needs to be moved.

I think disabled devices can still be moved, so on such devices, it may 
help to load the xe driver first -- but I agree that this is only a 
workaround, not a proper fix (but so would be hiding the bridge's BAR -- 
then another device can take that spot, and the only reason this doesn't 
happen is that the card happens to be in the topmost slot). A proper 
fix, however, would be a mechanism to ask other drivers to temporarily 
shut down so their BARs can be moved.

    Simon


