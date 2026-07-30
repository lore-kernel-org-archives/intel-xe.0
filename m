Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34F1C55165
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 13:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911E610EF1B;
	Thu, 30 Jul 2026 13:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="paWyBG8c";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0573010E674
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 13:28:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 911FF408F2;
 Thu, 30 Jul 2026 13:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E6F1F000E9;
 Thu, 30 Jul 2026 13:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
 s=korg; t=1785418110;
 bh=C1E4sGhyCssd4UEMgbE8zCUMag/dXk54qbvLBl9pIHk=;
 h=Subject:To:Cc:From:Date;
 b=paWyBG8cj/hrst07OMUX00u1ZRx+3FpQg3Vx6Ms/i5GPKMtKtC1cUfu5+N2hQObrn
 rAhDaO1QgAFwGXjXoYz42NyDhWnxO/adpyvNqb56wSKMwDKOA4oiBW9aRGQRDrsWTv
 jtvQWTP12gvUVE2HFKHMKkmGxN2s1X8sMf8IsWLE=
Subject: Patch "gpu: Fix uninitialized buddy for built-in drivers" has been
 added to the 6.12-stable tree
To: airlied@redhat.com, gregkh@linuxfoundation.org,
 intel-xe@lists.freedesktop.org, joelagnelf@nvidia.com,
 koen.koning@linux.intel.com, peter.senna@linux.intel.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 30 Jul 2026 15:28:16 +0200
Message-ID: <2026073016-twelve-hush-e028@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    gpu: Fix uninitialized buddy for built-in drivers

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     gpu-fix-uninitialized-buddy-for-built-in-drivers.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From cc27314c67516c138ee3829197d1c3b998e29fae Mon Sep 17 00:00:00 2001
From: Koen Koning <koen.koning@linux.intel.com>
Date: Fri, 13 Feb 2026 16:20:47 +0100
Subject: gpu: Fix uninitialized buddy for built-in drivers

From: Koen Koning <koen.koning@linux.intel.com>

commit cc27314c67516c138ee3829197d1c3b998e29fae upstream.

Move buddy to the start of the link order, so its __init runs before any
other built-in drivers that may depend on it. Otherwise, a built-in
driver that tries to use the buddy allocator will run into a kernel NULL
pointer dereference because slab_blocks is uninitialized.

Specifically, this fixes drm/xe (as built-in) running into a kernel
panic during boot, because it uses buddy during device probe.

Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part two)")
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: intel-xe@lists.freedesktop.org
Reviewed-by: Dave Airlie <airlied@redhat.com>
Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
Link: https://patch.msgid.link/20260213152047.179628-1-koen.koning@linux.intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/Makefile |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -2,7 +2,8 @@
 # drm/tegra depends on host1x, so if both drivers are built-in care must be
 # taken to initialize them in the correct order. Link order is the only way
 # to ensure this currently.
+# Similarly, buddy must come first since it is used by other drivers.
+obj-$(CONFIG_GPU_BUDDY)	+= buddy.o
 obj-y			+= host1x/ drm/ vga/ tests/
 obj-$(CONFIG_IMX_IPUV3_CORE)	+= ipu-v3/
 obj-$(CONFIG_TRACE_GPU_MEM)		+= trace/
-obj-$(CONFIG_GPU_BUDDY)		+= buddy.o


Patches currently in stable-queue which might be from koen.koning@linux.intel.com are

queue-6.12/gpu-fix-uninitialized-buddy-for-built-in-drivers.patch
