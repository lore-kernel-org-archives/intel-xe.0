Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A753C55164
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 15:55:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B2110E02D;
	Thu, 30 Jul 2026 15:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EV4hOJBL";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F7110E02D
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 15:55:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 54A8A436F6;
 Thu, 30 Jul 2026 15:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACFA11F000E9;
 Thu, 30 Jul 2026 15:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
 s=korg; t=1785426919;
 bh=cnRRs7oMlOV2vC9mqkyS3kPjMRDq1WGraFfrIbtg0i0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EV4hOJBLZ/Zj8GcXzCeGZYlv33AWGuVb2K2vA4GtXlIBrqt/rMd4sHn0+1vhh9m9n
 +j5zjxinDnS8EZ40ERLzQqREjHjoMFh4UoAL1SWbPmT2ZHrNtmChhsrd+5WCUHt3qC
 O5FCBfR8UaqYznF6rnxKPLJ4cWIkvu8dsoMTM3zQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Joel Fernandes <joelagnelf@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 intel-xe@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Koen Koning <koen.koning@linux.intel.com>
Subject: [PATCH 6.12 588/602] gpu: Fix uninitialized buddy for built-in drivers
Date: Thu, 30 Jul 2026 16:16:20 +0200
Message-ID: <20260730141448.411050188@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730141435.976815864@linuxfoundation.org>
References: <20260730141435.976815864@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
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

6.12-stable review patch.  If anyone has any objections, please let me know.

------------------

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


