Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA2DC83F27
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 04:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E28710E656;
	Wed, 16 Jul 2025 04:19:34 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E7610E656
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 04:19:33 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 7EB453F104;
 Wed, 16 Jul 2025 06:19:28 +0200 (CEST)
Message-ID: <60c7bebe-8bfa-4f33-ad9a-a4b366b46157@hogyros.de>
Date: Wed, 16 Jul 2025 13:19:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Support Intel Xe GPU dirver Porting on RISC-V
 Architecture
To: zhangzhijie <zhangzhijie@bosc.ac.cn>, wangran@bosc.ac.cn,
 zhangjian@bosc.ac.cn, intel-xe@lists.freedesktop.org
References: <20250715061837.2144388-1-zhangzhijie@bosc.ac.cn>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20250715061837.2144388-1-zhangzhijie@bosc.ac.cn>
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

On 7/15/25 15:18, zhangzhijie wrote:

>      inb/outb speccial wire not support on other ARCH.
> Should detect whether arch platform support or not.

Are you sure these aren't memory mapped?

E.g. POWER defines a global variable with the base of the PCI mapped 
area, uses that in the inb/outb macros to generate loads/stores, and 
configures the root complex to forward accesses to the first 256 bytes 
as I/O TLPs.

Bridges have special handling for VGA addresses, so they can be 
forwarded even if no I/O ranges exist.

Also, this code is probably not used in the Xe driver -- the only VGA 
accesses performed here are a palette read and subsequent write of the 
same value, which is needed for some reason after turning off a voltage 
regulator[1]. If the legacy ports in your system are mapped properly, 
then you might not even run into that problem.

    Simon

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1824
