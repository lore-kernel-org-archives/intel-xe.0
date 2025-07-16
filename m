Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAC2C83F22
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 14:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9483510E823;
	Thu, 17 Jul 2025 14:02:07 +0000 (UTC)
Received: from out28-122.mail.aliyun.com (out28-122.mail.aliyun.com
 [115.124.28.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC6C10E66D
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 07:00:39 +0000 (UTC)
Received: from 172.38.29.107(mailfrom:zhangzhijie@bosc.ac.cn
 fp:SMTPD_---.doKIPiu_1752649234 cluster:ay29) by smtp.aliyun-inc.com;
 Wed, 16 Jul 2025 15:00:35 +0800
Message-ID: <be9ebefe-ddee-4c67-9d72-dc9b67fae6f9@bosc.ac.cn>
Date: Wed, 16 Jul 2025 15:00:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Support Intel Xe GPU dirver Porting on RISC-V
 Architecture
To: Simon Richter <Simon.Richter@hogyros.de>, wangran@bosc.ac.cn,
 zhangjian@bosc.ac.cn, intel-xe@lists.freedesktop.org
References: <20250715061837.2144388-1-zhangzhijie@bosc.ac.cn>
 <60c7bebe-8bfa-4f33-ad9a-a4b366b46157@hogyros.de>
From: zhangzhijie <zhangzhijie@bosc.ac.cn>
In-Reply-To: <60c7bebe-8bfa-4f33-ad9a-a4b366b46157@hogyros.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Jul 2025 14:02:06 +0000
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



在 2025/7/16 12:19, Simon Richter 写道:
> Hi,
> 
> On 7/15/25 15:18, zhangzhijie wrote:
> 
>>      inb/outb speccial wire not support on other ARCH.
>> Should detect whether arch platform support or not.
> 
> Are you sure these aren't memory mapped?
Hi, Simon
	yes, few arch not has this memory map(SVGAlib.) on .
> 
> E.g. POWER defines a global variable with the base of the PCI mapped 
> area, uses that in the inb/outb macros to generate loads/stores, and 
> configures the root complex to forward accesses to the first 256 bytes 
> as I/O TLPs.
> 
> Bridges have special handling for VGA addresses, so they can be 
> forwarded even if no I/O ranges exist.
> 
> Also, this code is probably not used in the Xe driver -- the only VGA 
> accesses performed here are a palette read and subsequent write of the 
> same value, which is needed for some reason after turning off a voltage 
> regulator[1]. If the legacy ports in your system are mapped properly, 
> then you might not even run into that problem.
> 
>     Simon
> 
> [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1824
	Got that same with issue link. thanks
	I have question that will VGA_CONSOLE support on non-x64 architecture? 
using CONFIG_X86/X86_64 means only support for X86 archtecture

Regards.
ZhiJie
