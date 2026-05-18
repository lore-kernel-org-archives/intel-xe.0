Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F40CD4F56
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 23:47:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBCE10E9FF;
	Mon, 18 May 2026 23:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y6Z0GN3u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC3E10E35E
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 23:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779148051; x=1810684051;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vHY7T7tt5BJjEmeXMYOWOVgHIUhB/AhpNICA04IEcdk=;
 b=Y6Z0GN3uyK2LOTpTzCQ1YHed656Hy5qeLc4nE+e3PLZXhMjQE+4odaxA
 b6csBrQVzrNT7SjRk5vkkRfnWCAXxX14+bfSDXgFWHcg0likSr6RAQVDW
 rj54ZqK3FqcuqP08Noi8pYplIwKiDS8mMz5K7l8tIP2M5zovp8DaI1YNT
 BZG0i/H4YyDhxuufYCmNiaUSsN7bRV23XY/PesdDNqpNpGH/hlR2YzwCF
 Uus0edlK+J1DwDL9osy7Pf5nuXDMBQp2i12wLT8dxS/l4X8UBuWiKkZ5x
 tiVVbawzRpot9zYVUM67Rzy30yVrL8JQGtQa6RULl6THJXhpbX8vw+AE4 Q==;
X-CSE-ConnectionGUID: xSHEhIi7SoaIvmuobgxFJg==
X-CSE-MsgGUID: SLZPYjMDT1yNw/w87etRRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79866830"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="79866830"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 16:47:21 -0700
X-CSE-ConnectionGUID: 78n0ig1oQ5ylZCa1LApQSQ==
X-CSE-MsgGUID: Po7nzxmgTBa8QuQ9m0dleA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="236959325"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 16:47:20 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/9] drm/xe/rtp: Toggle 'deny' bit to (de-)whitelist OA regs
Date: Mon, 18 May 2026 16:47:13 -0700
Message-ID: <20260518234716.1540123-7-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
References: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
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

Whitelist or de-whitelist OA registers by setting or resetting the 'deny'
bit in OA nonpriv registers and writing new register values to HW.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 18053582a6afa..0d2cf3d964a51 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -229,6 +229,21 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
 	whitelist_apply_to_hwe(hwe, &hwe->oa_whitelist, &hwe->reg_sr, nonpriv_slots);
 }
 
+__maybe_unused static void __whitelist_oa_regs(struct xe_hw_engine *hwe, bool whitelist)
+{
+	struct xe_reg_sr_entry *entry;
+	unsigned long reg;
+
+	xa_for_each(&hwe->oa_sr.xa, reg, entry) {
+		if (whitelist)
+			entry->set_bits &= ~RING_FORCE_TO_NONPRIV_DENY;
+		else
+			entry->set_bits |= RING_FORCE_TO_NONPRIV_DENY;
+	}
+
+	xe_reg_sr_apply_mmio(&hwe->oa_sr, hwe->gt);
+}
+
 /**
  * xe_reg_whitelist_print_entry - print one whitelist entry
  * @p: DRM printer
-- 
2.54.0

