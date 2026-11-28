Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3CD606A31C
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 05:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U9poKmlQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6702E10E26F;
	Sat, 28 Nov 2026 05:58:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B66D10E28D
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Nov 2026 05:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795845484; x=1827381484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0VaW/sWH+pC6FOTVvVLujlorjqFvICEM6u3CIvUxJd4=;
 b=U9poKmlQ0O0qJ6IFf+Cc+qJ79omjGvtSS6or80xWtM14rTvLHidb64Bc
 HjcpGCfcBigQ7NHtoLhrujKJOl4AlRHIkczNg0UJn+tS61SrSXjsGoO9u
 cI31VoVqVGVrHR+aCFu6t5qcbfRIry8GR+kdaxX2OPkpLUbExK4eqRitl
 dKzeBRZ9C1DRK7etUT7ZQc1wdXhzuoVH8rUEK5keAvp02dglkTAcriTzi
 xo2JmI70MlGCUK+Cr+B4tsIwfDGF181C14+sEGK94mVPR0H62oFDGFbwt
 CD48uzODIYHYIQB/PhYGPgD9GaQzvh0SEoPtXOpNJdvmuQhcuFTE+ixCp g==;
X-CSE-ConnectionGUID: kapbS78ZTw+k5LIR2SbU1w==
X-CSE-MsgGUID: xTaLOTbbSJ6DogvntecDIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4754895"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4754895"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:58:04 -0800
X-CSE-ConnectionGUID: T4t2wKVyTq6u7j9eRQ8o6A==
X-CSE-MsgGUID: H4GEATPCTOaeu3Un0g2ECQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; d="scan'208";a="12304285"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:58:02 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 03/10] drm/xe/pcode: Add ordered write batch helper
Date: Sat, 28 Nov 2026 11:29:16 +0530
Message-Id: <20261128055923.3316956-4-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261128055923.3316956-1-karthik.poosa@intel.com>
References: <20261128055923.3316956-1-karthik.poosa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a pcode helper that issues an ordered sequence of mailbox writes
while holding the pcode lock, so no other mailbox command can be
interleaved.

This will be used to write fan tables atomically with respect to other
pcode users.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 39 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.h | 12 +++++++++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index fa9f45d565cb..409b9ff372e9 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -124,6 +124,45 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 data, int timeout
 	return err;
 }
 
+/**
+ * xe_pcode_write_batch - issue pcode writes in order under the mailbox lock
+ * @tile: tile
+ * @writes: mailbox/data pairs to write
+ * @count: number of entries in @writes
+ *
+ * Holds the pcode lock across all writes so no other mailbox command can be
+ * interleaved; the lock may be held for up to @count * PCODE_DEFAULT_TIMEOUT_MS.
+ * Stops at the first failure; earlier writes are not reverted.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int xe_pcode_write_batch(struct xe_tile *tile, const struct xe_pcode_write *writes,
+			 unsigned int count)
+{
+	unsigned int i;
+	int err = 0;
+
+	if (!count)
+		return -EINVAL;
+
+	mutex_lock(&tile->pcode.lock);
+	for (i = 0; i < count; i++) {
+		u32 data = writes[i].data;
+
+		err = pcode_mailbox_rw(tile, writes[i].mbox, &data, NULL, PCODE_DEFAULT_TIMEOUT_MS,
+				       false, false);
+		if (err) {
+			xe_err(tile_to_xe(tile),
+			       "pcode batch write %u/%u failed: mbox 0x%08x data 0x%08x, ret %pe\n",
+			       i + 1, count, writes[i].mbox, writes[i].data, ERR_PTR(err));
+			break;
+		}
+	}
+	mutex_unlock(&tile->pcode.lock);
+
+	return err;
+}
+
 int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0, u32 data1, int timeout)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index 7e43792b0037..c601a12baba6 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -18,6 +18,16 @@ struct xe_pcode_version {
 	u32 engg;
 };
 
+/**
+ * struct xe_pcode_write - single pcode mailbox write
+ * @mbox: mailbox command
+ * @data: value written to PCODE_DATA0
+ */
+struct xe_pcode_write {
+	u32 mbox;
+	u32 data;
+};
+
 #define PCODE_DEFAULT_TIMEOUT_MS	10
 
 int xe_pcode_init_early(struct xe_tile *tile);
@@ -28,6 +38,8 @@ int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
 int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val0, u32 *val1);
 int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
 			   int timeout_ms);
+int xe_pcode_write_batch(struct xe_tile *tile, const struct xe_pcode_write *writes,
+			 unsigned int count);
 int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
 			     u32 data1, int timeout);
 int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version);
-- 
2.34.1

