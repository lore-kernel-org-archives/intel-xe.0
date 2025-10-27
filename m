Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50969CCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 09:01:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008B910E405;
	Mon, 27 Oct 2025 09:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="ATG46iBt";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD7A10E405
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 09:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761555714;
 bh=v29pRP/4CE3A1bJPmP6NUs+T+ixTYRkkfIZ4uchJum8=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=ATG46iBtbDEQIcE4ijXsCcpjmQ6hrtTkxLFmqUQ11EUpWuDnpBGMbVp+jSeMrDIhk
 bB7pAEOq07aN8F9ujDmVV1QgqtfRkrJb9MHxM5BX/GqeOCFWHp0HJdTL1mk9koKFIG
 NY4A/LrV+B03SAPgK7PyWeX8mIHksw9IulH6TerAqFowFKQBnejRrd3OXGKQ6utuNW
 da4inD6SlvEeOPEseb4jikAxWTeSODc9jXS1feD3xon2qckswpd0kzWZVOyBx1sJjq
 wWTM/C9Q+gGWLWgjZfLd2e5YV8Ctpe/XXgkYpIEFYKk31+64kgg/EV5E/VGua9CuFH
 t1joRljLESqEw==
Message-ID: <542979eb-94f5-4fd6-ad82-3a708a3aecdd@lankhorst.se>
Date: Mon, 27 Oct 2025 10:01:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: VM modesetting
To: Simon Richter <Simon.Richter@hogyros.de>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <f60e07f2-1325-4b78-9d1d-7a49d984222a@hogyros.de>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <f60e07f2-1325-4b78-9d1d-7a49d984222a@hogyros.de>
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

Hey,

Den 2025-10-27 kl. 07:06, skrev Simon Richter:
> Hi,
> 
> stupid question: when a VM starts up, how is it supposed to
> 
> 1. find out what virtual monitors are available
> 2. indicate what buffers to use for these?
> 
> Slightly related: is there a way to expose a "ROM" from a VF, to allow firmware to do some early initialization?

Display is never exposed on a VF, instead only buffers are shared between the VF and the PF, which the host may choose
to display on real hardware. The VF never touches any display register at all, so no need for a ROM.

Because of this it's entirely up to the virtualization software what a display is, and what buffer formats are used.

Kind regards,
~Maarten Lankhorst
