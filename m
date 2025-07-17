Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520ECC83F1B
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 05:14:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DC910E154;
	Thu, 17 Jul 2025 05:14:57 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F09110E154
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 05:14:56 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 518503F104;
 Thu, 17 Jul 2025 07:14:51 +0200 (CEST)
Message-ID: <a54dfff8-5ba3-4fcd-ac2e-5bf5b24eca5c@hogyros.de>
Date: Thu, 17 Jul 2025 14:14:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Support Intel Xe GPU dirver Porting on RISC-V
 Architecture
To: zhangzhijie <zhangzhijie@bosc.ac.cn>, wangran@bosc.ac.cn,
 zhangjian@bosc.ac.cn, intel-xe@lists.freedesktop.org
References: <20250715061837.2144388-1-zhangzhijie@bosc.ac.cn>
 <60c7bebe-8bfa-4f33-ad9a-a4b366b46157@hogyros.de>
 <be9ebefe-ddee-4c67-9d72-dc9b67fae6f9@bosc.ac.cn>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <be9ebefe-ddee-4c67-9d72-dc9b67fae6f9@bosc.ac.cn>
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

On 7/16/25 16:00, zhangzhijie wrote:

>>>      inb/outb speccial wire not support on other ARCH.
>> Are you sure these aren't memory mapped?

>      yes, few arch not has this memory map(SVGAlib.) on .

Is it missing from the root complex IP instantation, so the logic does 
not exist, or just not enabled, which could be fixed by doing the same 
thing as POWER?

The fewer differences there are between platforms, the better.

>> [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1824
>      Got that same with issue link. thanks

That is also an inb/outb pair. If you got it to compile, then you have a 
definition of inb/outb for your platform, and the next step is checking 
where that came from and how it is supposed to work, and the same 
definition can be used to compile the code you proposed to make conditional.

That is a question for the people building your PCIe interface though.

>      I have question that will VGA_CONSOLE support on non-x64 
> architecture? using CONFIG_X86/X86_64 means only support for X86 
> archtecture

VGA_CONSOLE is text mode, with font rendering done by the graphics card.

That requires that the I/O ports in the ranges 0x3bb0 to 0x3bb and 0x3c0 
to 0x3df and memory accesses from 0xa0000 to 0xbffff are forwarded to 
the card (i.e. all PCI(e) bridges above the card need to have the VGA 
bit set, and the root complex needs to generate these accesses -- so 
there needs to be memory mappings in the root complex for legacy I/O 
ports (so working inb/outb) and for the 128kB VGA aperture.

Pretty much nobody on x86 uses VGA_CONSOLE these days, instead they use 
kernel modesetting to switch to a graphical mode, and render into the 
framebuffer with whatever method is available -- CPU and maybe some 
device specific acceleration in the kernel, or Mesa and full 3D 
acceleration in X and Wayland.

So I'd turn off VGA_CONSOLE, that also seems to avoid issues when the 
non-generic drivers take over (that is what the code in the linked issue 
does -- I haven't fully understood the problem there, but someone 
deliberately added this, and I'd expect that they understood it enough 
to say that this was necessary.

If someone from Intel knows more, this information would be great to 
have, so I can tell how much time to invest on fixing this for the 
various platforms (if that is the source of the 400,000 interrupts per 
second I'm seeing, then it gets higher priority than if it is only 
relevant if someone activated text mode before).

    Simon
