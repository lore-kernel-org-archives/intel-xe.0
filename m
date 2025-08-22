Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FC2CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 09:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1D610EAB6;
	Fri, 22 Aug 2025 09:11:08 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F156D10EAA4
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 09:11:05 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id AA75D3F01D
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 11:11:03 +0200 (CEST)
Message-ID: <531fe019-eccb-4cbd-a60f-9e2241a73c82@hogyros.de>
Date: Fri, 22 Aug 2025 18:11:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
From: Simon Richter <Simon.Richter@hogyros.de>
Subject: PCODE Mailbox failed: 1 Illegal Command
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

one of the plans for this weekend is to look at why I'm getting 14 of 
these on boot.

The returned status code is 1, so it's not the same problem I have in 
other places where MMIO accesses return 0xffffffff, so I suppose 
communication is working and there is really something on the other side 
replying that I'm doing it wrong.

Might still be a page alignment issue, although there is only a single 
tile, and the only alignment I see in building the MMIO memory map is 2M.

Is anyone else seeing these and has already spent time on this, so I 
don't duplicate that effort? Is there a checklist?

    Simon
