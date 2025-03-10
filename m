Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D65C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 07:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD83810E1AF;
	Mon, 10 Mar 2025 07:12:19 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Mon, 10 Mar 2025 07:12:18 UTC
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8C510E1AF
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 07:12:18 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id B7D443F20A
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 08:05:02 +0100 (CET)
Message-ID: <887df508-e545-4665-806a-c2625d9a372f@hogyros.de>
Date: Mon, 10 Mar 2025 16:04:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: intel-xe@lists.freedesktop.org
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
Subject: Shutting down VGA emulation when it was never activated
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

it seems I've been bitten by

     https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1824

as well: driver startup reads from a VGA register, and falls over.

Even though I have a weird platform (POWER9), I'm not convinced this is 
a porting issue, but instead an invalid assumption made by the driver 
that whatever is decoding the legacy VGA ports belongs to the card that 
is being initialized.

This will be wrong in a lot more cases:

  - There is a BMC with VGA emulation
  - There is an onboard GPU that is used as primary display
  - There is more than one card
  - The VGA driver has never started up

Instinctively, checking whether the Expansion ROM is enabled should 
already give us a good heuristic, but that deep into the call stack 
we've long since forgotten that this is a PCI device, and there is also 
no interface to test whether the expansion ROM is currently enabled -- 
the closest thing we can do is get the ROM resource from the PCI device

     struct resource *res = &pdev->resource[PCI_ROM_RESOURCE];

and look at the flags on that resource.

The other question is whether there are scenarios where we'd want to 
perform this access anyway -- this seems to be some workaround for an 
interrupt being repeatedly triggered after deactivating the VGA 
emulation(?), so it may still be needed sometimes.

    Simon
