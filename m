Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C21C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 15:14:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C9E10E640;
	Fri, 28 Aug 2026 15:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MU/4/Z+6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBEE10E640
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 15:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787930067; x=1819466067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oKpbJrvsQW4lGovJ8HayRV5uuGGRT9T2o+pu3nuTfMQ=;
 b=MU/4/Z+64x8rLXfYgkgzpeSQY287kPEO9+HZh6c3lip0wajkahuXAe7W
 8U8Lx21tZTMyy8sZRdVqMr+ENIK8toPwqmvwMcf5DjEAutoUfCP/ujAZM
 TStI8w+yEfn3OH8HyahdP5q+Zh9EyagUOhWS9Bd2WDkJeR3T+Y2IyYhVp
 IIkrbX/f2NbtYlOE5vj7pUnts1syMrtIoUncwhEVaJsOOqwj2xjaot6xo
 YoVlJVwGQAW2SK25stkuKIdfFzH/ed5Xls60qm4yTMg45ea6nd6vWgpYT
 zqfAjW1D3RLNQ71hWHHcC99ff0nq5AO4lJeAZmQOYSB6hIvghDwi3l/V1 A==;
X-CSE-ConnectionGUID: 9V0Xjcm0QiiRFMskaBKUAA==
X-CSE-MsgGUID: 6TKssPdtRuGPFKLqntPXMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="92252191"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="92252191"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:14:27 -0700
X-CSE-ConnectionGUID: BT3KdUU3QO+9dZ4dJNfTFw==
X-CSE-MsgGUID: UuRelJ6fRkyo8WALEIlM4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="268746409"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.86])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:14:25 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, stable@kernel.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/5] drm/xe: Don't hand out the flat CCS storage as usable VRAM
Date: Fri, 28 Aug 2026 16:14:08 +0100
Message-ID: <20260828151405.662533-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828151405.662533-7-matthew.auld@intel.com>
References: <20260828151405.662533-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Linus Torvalds <torvalds@linux-foundation.org>

get_flat_ccs_offset() reads the base of the flat CCS storage from the
hardware, scales it by the number of enabled L3 nodes, and rounds the
result up to 128K.  Everything below that offset is then handed to the
VRAM allocator as usable memory.

Rounding a limit that means "usable memory ends here" upwards publishes
whatever lies between the real base and the rounded one as free memory,
and that memory belongs to the compression hardware.  The scaled value
has no reason to be 128K aligned, and on a Battlemage G21 with 16 GiB it
is not:

	flat CCS base: raw 0x3fafff800, rounded 0x3fb000000

so the last 2 KiB of page 0x3fafff000 is CCS storage, in the allocator's
pool.  Whatever is allocated there gets that tail overwritten by the
compression hardware, which needs no page-table entry, no buffer object
and no GPU submission to do it, and does it before userspace exists.

On this machine a Mesa VM's level-3 page table landed on that page on
every cold boot.  It lost the entry covering the compositor's
batch-buffer heap, so the compositor's first submission faulted fetching
its batch and gdm restarted it forever: a black screen on an otherwise
working machine.  Restarting gdm cleared it because the next VM's page
tables were allocated somewhere else.

Round down instead, to the page size the allocator works in.  On this
machine that excludes exactly one page.

Reading the reserved page afterwards shows what had been writing it:

	[369] 0xcccc000000000000
	[371] 0xcc77000000000000
	[373] 0xcccc000000000000
	[375] 0xcc77000000000000

compression metadata, two bytes per sixteen, sitting where the driver
used to hand out memory.

The assertion that should have caught this compares the offset against
GSMBASE - ccs_size for equality.  That value is 128K aligned, so it
agrees with the rounded-up offset precisely when the base is not
aligned - the check cannot fail in the case it exists to catch, and is
compiled out unless CONFIG_DRM_XE_DEBUG is set.  Replace it with one
that can fail: CCS storage must not run into GSM.

[ And this was a debug session from hell, enormously helped by an AI
  doing much of the grunt-work.

  I'd like to call it my tireless helper, but the AI several times
  stated flat out that this was impossible and unsolvable and that we
  should just write a report about it.

  I suspect those things have been trained by people who may not be
  quite as stubborn as I am.

  But while the AI was ready to give up several times, it did keep
  adding debug code and analyzing it faithfully when I pushed. So credit
  where credit is due and I let the AI write the commit message above.

  This is basically a one-liner fixing a bogus "round_up()" to a
  "round_down()", but there were 24 patches adding more and more debug
  information to this, and 18 kernel boot to finally narrow it down to
  this.   - Linus ]

Fixes: 37173392741c ("drm/xe/vram: fix ccs offset calculation")
Cc: stable@kernel.org
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
(cherry picked from commit 818bebeb63dd6bf5f4e07e145f6cdbace520a34c)
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 23eb7edbdd57..7b4478fb1697 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -89,12 +89,25 @@ static int get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size, u64 *poffset)
 		offset = offset_hi << 32; /* HW view bits 39:32 */
 		offset |= offset_lo << 6; /* HW view bits 31:6 */
 		offset *= num_enabled; /* convert to SW view */
-		offset = round_up(offset, SZ_128K); /* SW must round up to nearest 128K */
 
-		/* We don't expect any holes */
-		xe_assert_msg(xe, offset == (xe_mmio_read64_2x32(&gt_to_tile(gt)->mmio, GSMBASE) -
-					     ccs_size),
-			      "Hole between CCS and GSM.\n");
+		/*
+		 * Everything below this offset is handed to the VRAM
+		 * allocator, so it has to be the *first* address the
+		 * compression hardware owns, rounded down.  Rounding it up
+		 * publishes CCS storage as free memory.
+		 */
+		offset = round_down(offset, SZ_4K);
+
+		/*
+		 * CCS storage must not run into GSM.  The old check compared
+		 * the offset against GSMBASE - ccs_size for equality, which
+		 * could not fail: that value is 128K aligned, so it agreed
+		 * with the rounded-up offset even when the base was not 128K
+		 * aligned - exactly the case this fixes.
+		 */
+		xe_assert_msg(xe, offset + ccs_size <=
+			      xe_mmio_read64_2x32(&gt_to_tile(gt)->mmio, GSMBASE),
+			      "CCS overlaps GSM.\n");
 	} else {
 		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
 		offset = (u64)REG_FIELD_GET(XEHP_FLAT_CCS_PTR, reg) * SZ_64K;
-- 
2.55.0

