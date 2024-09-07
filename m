Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48104E6FE4D
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB2110EB31;
	Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CbVqZ6oE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258FE10EB25
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667676; x=1757203676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cmdLz4n9UmxCyFa5QMs3hY9IlKJCrUaVxKVwjzs9qeg=;
 b=CbVqZ6oEkhsQE+1LW5VAZt89s9FvVS+29ct6ankzgUkwFL9arKghhTXp
 kLADUv1zlXLNeZaTa48h9I9tJgh9LxBZ/vgtQOduVlORHCmEw26pjIXEt
 17ChwtWFgVWCqq4zqQvnBcP98V1VvsEpBFGwPOMTdEeLqNs0ux8h/eBG8
 3TyBblIhN/WydIXuy7eogTwEWBgIJvBbo4k8YEDWSpkiXCbnVukSHdUBA
 sp5s035misEJux/kQKJX1kv64xD8Dn3KQN87o1bpCa/VkDVQJ0f5u/q81
 Eyhb/wWyS2GPHrA/ddT/CLqxOz14VJQvFEhbN1irko1nq9t6XLpUJ5SWh g==;
X-CSE-ConnectionGUID: jTOKjG4FR5GVJp1MN1PvGA==
X-CSE-MsgGUID: VSxJLbj8RVSsJWByoeGkGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855292"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855292"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: D4xAKNepS1qRXFWP7MW7JQ==
X-CSE-MsgGUID: I31nGnrTQsSuwmm5CzS/EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792621"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 02/43] drm/xe: Create dedicated xe_mmio structure
Date: Fri,  6 Sep 2024 17:07:51 -0700
Message-ID: <20240907000748.2614020-47-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

Pull the 'mmio' substructure from xe_tile out into a dedicated type.
Future patches will expand this structure and then eventually move MMIO
read/write operations over to using this type.

v2:
 - Fix kerneldoc of 'size' field.  The rename/refocusing of this field
   got moved to the next patch of the series.  (Lucas)
 - Correct commit message; it's the tile, not the device, mmio that's
   been pulled out to a separate type.  (Michal)

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ec7eb7811126..5d5b7a9199d8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -107,6 +107,22 @@ struct xe_mem_region {
 	void __iomem *mapping;
 };
 
+/**
+ * struct xe_mmio - register mmio structure
+ *
+ * Represents an MMIO region that the CPU may use to access registers.  A
+ * region may share its IO map with other regions (e.g., all GTs within a
+ * tile share the same map with their parent tile, but represent different
+ * subregions of the overall IO space).
+ */
+struct xe_mmio {
+	/** @regs: Map used to access registers. */
+	void __iomem *regs;
+
+	/** @size: Size of the map. */
+	size_t size;
+};
+
 /**
  * struct xe_tile - hardware tile structure
  *
@@ -148,13 +164,7 @@ struct xe_tile {
 	 * * 4MB-8MB: reserved
 	 * * 8MB-16MB: global GTT
 	 */
-	struct {
-		/** @mmio.size: size of tile's MMIO space */
-		size_t size;
-
-		/** @mmio.regs: pointer to tile's MMIO space (starting with registers) */
-		void __iomem *regs;
-	} mmio;
+	struct xe_mmio mmio;
 
 	/**
 	 * @mmio_ext: MMIO-extension info for a tile.
-- 
2.45.2

