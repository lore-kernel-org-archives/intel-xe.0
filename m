Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB24C52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 02:46:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91A510E064;
	Mon, 12 Aug 2024 02:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwYAWQM/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266A210E052
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 02:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723430789; x=1754966789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+UoEuoqVOjZCR71IzP+wJx5BVPv1q33HlQS5S+ndZWk=;
 b=kwYAWQM/3Cc66WrxNNYimqLIKqquhuBW/I68BhTvFWOnTreC7cLwcROS
 tuqWatyCm7uLsJvj+3zffyC6tczupy5GGLGPj0iQoa7KH/ymIkQtkAzes
 mwAvDwBdO67SygxJ64QdNuA+BYByhzGuVM3TSN0F0PTYDnEZMw4xlmB00
 zSs3FbCxS8ft0jxgf2qffUq88Mbx0ZiNCOPmaRC0BWIn+tCW+RRQn+BDG
 Gyo0lnLz0CCQsJS8QaJeXKc4o7VqNeCRyBILF+Zccso0TbfX/dKciFJPH
 P/PZl7o+EEzEfnUHcq93GNAwwLjvZSwJSsimfwhdEo4qybeewf+sUHxbl g==;
X-CSE-ConnectionGUID: T/q1E5hETJi1TDa8i4wEhw==
X-CSE-MsgGUID: sTPF5TZ4SiuZN+Ke6U+IWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="32099517"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="32099517"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 19:46:28 -0700
X-CSE-ConnectionGUID: FlC0nSNWQy6NTfiMfW87XA==
X-CSE-MsgGUID: cLNOMWE2TPWXtMGRW1DBDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="62256297"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 19:46:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 1/8] drm/xe: Add xe_hw_engine_write_ring_tail
Date: Sun, 11 Aug 2024 19:47:10 -0700
Message-Id: <20240812024717.3584636-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812024717.3584636-1-matthew.brost@intel.com>
References: <20240812024717.3584636-1-matthew.brost@intel.com>
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

ULLS for migration jobs need to directly set hw engine ring tail.

Signed-off-by: Matthew Brost <matthew.brost@intel.com
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 402dfa748e16..ee006b393e2f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -298,6 +298,16 @@ void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe,
 	xe_mmio_write32(hwe->gt, reg, val);
 }
 
+/**
+ * xe_hw_engine_write_ring_tail() - Write ring tail
+ * @hwe: engine
+ * @val: desired 32-bit value to write
+ */
+void xe_hw_engine_write_ring_tail(struct xe_hw_engine *hwe, u32 val)
+{
+	xe_hw_engine_mmio_write32(hwe, RING_TAIL(0), val);
+}
+
 /**
  * xe_hw_engine_mmio_read32() - Read engine register
  * @hwe: engine
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 022819a4a8eb..076230b158b3 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -80,5 +80,6 @@ enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
 
 void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
 u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg);
+void xe_hw_engine_write_ring_tail(struct xe_hw_engine *hwe, u32 val);
 
 #endif
-- 
2.34.1

