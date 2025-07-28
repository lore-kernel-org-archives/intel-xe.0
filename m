Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8B8C87FCE
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 07:54:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FC210E496;
	Mon, 28 Jul 2025 07:54:28 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275FE10E0E1
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 07:54:27 +0000 (UTC)
Received: from [192.168.10.95] (unknown [39.110.247.193])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 9CF143F104
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 09:54:24 +0200 (CEST)
Message-ID: <fa3e120a-c797-4d5a-92d6-9441fe3f86d0@hogyros.de>
Date: Mon, 28 Jul 2025 16:54:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
From: Simon Richter <Simon.Richter@hogyros.de>
Subject: Valgrind support
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

a few years ago I taught[1] Valgrind that DRM_IOCTL_I915_GEM_MMAP 
created accessible address space, so it would not complain about 
applications putting together command or vertex buffers.

I suspect that this is incomplete, because it doesn't handle unmapping, 
but IIRC also does not complain if the application does not unmap, and 
there might be other ioctls as well.

Updating this is on my to-do list, but at a fairly low priority, so it 
will probably be stuck there for a while, so if someone feels like they 
want to do something useful with a clearly defined scope and little 
future maintenance, consider this message an invitation to do so. :)

    Simon

[1] https://bugs.kde.org/show_bug.cgi?id=413119
