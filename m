Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7DBD0E6D9
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 10:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA6810E475;
	Mon, 21 Oct 2024 10:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0Rx+BLo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B058510E475
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 10:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729504805; x=1761040805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lSDiBkMcUKxaSF3r3MKcy804PECarPOkXAM0YUTtsww=;
 b=J0Rx+BLo0t/MFXWT2D4a4T8JKveHKI1Wcpq7eVG1nvgtIsp0HQq2kXwp
 VnGK3lAhLlWByB3SnbF+pb9Ef80iibxovx6DrBrDbSwOqWmsxWAP4hRWV
 8Vy68vrHuv+qK10w8bWVVmnWnp9kPgiEjnfuJ6Joy206ogKY0Peoh4Gi9
 gE/ZwrOW3YnONW70o2iWhZQtaTLYcBdYMncbpqoWcYtif7Q8Ma+0QW6pY
 48U+vJIiOW5MJGI3itN3qV7Ym8arNyca6o2YsEOj9E3zYm9Ia1x4qGA7O
 GucD+5BCwYcUZ0RgruwL4eqNLJjH9lPm9hmdRz9QdU0mChkSLq/wUJOvO Q==;
X-CSE-ConnectionGUID: DzAROTSWRl6vwEYEX3wnmw==
X-CSE-MsgGUID: tnbpRltbTUG2RUqbYRW3zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40350862"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40350862"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 03:00:05 -0700
X-CSE-ConnectionGUID: 8v4vFJhsRRSzp5ByzK+h+Q==
X-CSE-MsgGUID: GVXmFdVqTGKHHlkphuoPuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="84546360"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.221])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 03:00:01 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, matthew.brost@intel.com, stuart.summers@intel.com,
 christoph.manszewski@intel.com, mika.kuoppala@linux.intel.com,
 dominik.grzegorzek@intel.com, andrzej.hajda@intel.com,
 maciej.patelczyk@intel.com
Subject: [RFC 16/19] drm/xe/eudebug: Implement vm_bind_op discovery
Date: Mon, 21 Oct 2024 12:58:55 +0300
Message-ID: <20241021095904.439555-17-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
References: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
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

From: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Follow the vm bind, vm_bind op sequence for
discovery process of a vm with the vmas it has.
Send events for ops and attach metadata if available.

v2: - Fix bad op ref seqno (Christoph)
    - with discovery semaphore, we dont need vm lock (Matthew)

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c | 45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 35ab65ef9c80..9ef1e5d9c65d 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -3154,6 +3154,47 @@ void xe_eudebug_debug_metadata_destroy(struct xe_file *xef, struct xe_debug_meta
 	xe_eudebug_event_put(d, debug_metadata_destroy_event(d, xef, m));
 }
 
+static int vm_discover_binds(struct xe_eudebug *d, struct xe_vm *vm)
+{
+	struct drm_gpuva *va;
+	unsigned int num_ops = 0, send_ops = 0;
+	u64 ref_seqno = 0;
+	int err;
+
+	/*
+	 * Currently only vm_bind_ioctl inserts vma's
+	 * and with discovery lock, we have exclusivity.
+	 */
+	lockdep_assert_held_write(&d->xe->eudebug.discovery_lock);
+
+	drm_gpuvm_for_each_va(va, &vm->gpuvm)
+		num_ops++;
+
+	if (!num_ops)
+		return 0;
+
+	err = vm_bind_event(d, vm, num_ops, &ref_seqno);
+	if (err)
+		return err;
+
+	drm_gpuvm_for_each_va(va, &vm->gpuvm) {
+		struct xe_vma *vma = container_of(va, struct xe_vma, gpuva);
+
+		if (send_ops >= num_ops)
+			break;
+
+		err = vm_bind_op(d, vm, DRM_XE_EUDEBUG_EVENT_CREATE, ref_seqno,
+				 xe_vma_start(vma), xe_vma_size(vma),
+				 &vma->eudebug.metadata.list);
+		if (err)
+			return err;
+
+		send_ops++;
+	}
+
+	return num_ops == send_ops ? 0 : -EINVAL;
+}
+
 static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 {
 	struct xe_debug_metadata *m;
@@ -3176,6 +3217,10 @@ static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 		err = vm_create_event(d, xef, vm);
 		if (err)
 			break;
+
+		err = vm_discover_binds(d, vm);
+		if (err)
+			break;
 	}
 
 	xa_for_each(&xef->exec_queue.xa, i, q) {
-- 
2.46.1

