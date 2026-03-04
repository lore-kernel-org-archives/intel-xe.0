Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D88FEB7EB6
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 09:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D36A10E98F;
	Wed,  4 Mar 2026 09:09:36 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82F810E99A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 09:09:34 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 778493F1E0
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 10:09:32 +0100 (CET)
Message-ID: <ca636db4-62c3-4f9c-a663-443a98fb0359@hogyros.de>
Date: Wed, 4 Mar 2026 18:09:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/tests: avoid build warning on 32-bit targets
To: intel-xe@lists.freedesktop.org
References: <20260304083741.725121-1-arnd@kernel.org>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20260304083741.725121-1-arnd@kernel.org>
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

On 3/4/26 5:37 PM, Arnd Bergmann wrote:

> Shut up the warning with an extra cast that marks this truncation as intentional.
> This is probably not the right fix here, but I could not figure out where the
> constant value actually comes from, or if a smaller number would be appropriate
> on a 32-bit system. It's possible that the test case or the driver is just not
> useful on 32-bit machines because of other parts of the logic here.

vram->usable_size should be the same thing that gets reported during boot:

[    6.538254] xe 0030:03:00.0: [drm] VRAM[0]: Actual physical size 
0x0000000300000000, usable size exclude stolen 0x00000002fb800000, CPU 
accessible size 0x00000002fb800000

I think this should always be 64 bit wide, even on 32 bit architectures, 
because the VRAM exists and can be distributed to VFs, even if it cannot 
be accessed from the CPU.

    Simon
