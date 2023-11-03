Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1D0C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5354E10EA03;
	Fri,  3 Nov 2023 14:36:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1007710E9FE
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022169; x=1730558169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bc1WHCP+qEvRnTHWAOZ5e4pUpXpIT7NXyK3Xs8L2c80=;
 b=DSPPVYUxhXBQ3gNCS7Ei46yCVf9KUJ5Lkph8wvFtzKaAh8f5T3UBhVkx
 OnqHHfj+LYyULmi/odG9ZvrjAFrXrM+RqJiBM2Pn/r0E7YJ3vE+EeFBnF
 UlI/vTW4mrfO7V6wffY4GpzXXQh7FIyPP3WMChUG+rlTxdHEKxK6m5XoN
 qciDxSutxTjaLS4kBa35GM+DSGIASbqbxVLR9hm9A6ynG1cw67/7XbatS
 NWXTWpnaB8SOyo/xj0Wy+G5F1CmmXpSGBBDFTkOgQTUaEtrJTPW4lqrlX
 562VtJwxO1lZgNyZgUaxyvwxhMTkZh872RMK40pwjkbePh9scWjHjLAqZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843571"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843571"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:36:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832590"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832590"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:36:07 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:55 +0000
Message-Id: <20231103143456.7-50-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 49/50] drm/xe/uapi: Add block diagram of a
 device
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In order to make proper use the uAPI, a prerequisite is to understand
some key concepts about the discrete GPU devices which are supported
by the Xe driver. For example, some structs defined in the uAPI are an
abstraction of a hardware component with a specific role.

This diagram helps to build a mental representation of a device how it
is seen by the Xe driver. As written in the documentation, it does not
intend to be a literal representation of an existing device. A lot
more information could be added but the intention for the overview is
to keep it simple, and go into detail as needed in other sections.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 41 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 85dc0d343ea8..0bab53f2bed9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -28,6 +28,47 @@ extern "C" {
  *
  */
 
+/**
+ * DOC: Xe Device Block Diagram
+ *
+ * The diagram below represents a high-level simplification of a discrete
+ * GPU supported by the Xe driver. It shows some device components which
+ * are necessary to understand this API, as well as how their relations
+ * to each other. This diagram does not represent real hardware::
+ *
+ *   ┌──────────────────────────────────────────────────────────────────┐
+ *   │ ┌──────────────────────────────────────────────────┐ ┌─────────┐ │
+ *   │ │              ┌───────────────────────┐           │ │ ┌─────┐ │ │
+ *   │ │              │         VRAM0         │           │ │ │VRAM1│ │ │
+ *   │ │              └───────────┬───────────┘           │ │ └──┬──┘ │ │
+ *   │ │ ┌────────────────────────┴─────────────────────┐ │ │ ┌──┴──┐ │ │
+ *   │ │ │ ┌─────────────────────┐  ┌─────────────────┐ │ │ │ │     │ │ │
+ *   │ │ │ │ ┌──┐ ┌──┐ ┌──┐ ┌──┐ │  │ ┌─────┐ ┌─────┐ │ │ │ │ │     │ │ │
+ *   │ │ │ │ │EU│ │EU│ │EU│ │EU│ │  │ │RCS0 │ │BCS0 │ │ │ │ │ │     │ │ │
+ *   │ │ │ │ └──┘ └──┘ └──┘ └──┘ │  │ └─────┘ └─────┘ │ │ │ │ │     │ │ │
+ *   │ │ │ │ ┌──┐ ┌──┐ ┌──┐ ┌──┐ │  │ ┌─────┐ ┌─────┐ │ │ │ │ │     │ │ │
+ *   │ │ │ │ │EU│ │EU│ │EU│ │EU│ │  │ │VCS0 │ │VCS1 │ │ │ │ │ │     │ │ │
+ *   │ │ │ │ └──┘ └──┘ └──┘ └──┘ │  │ └─────┘ └─────┘ │ │ │ │ │     │ │ │
+ *   │ │ │ │ ┌──┐ ┌──┐ ┌──┐ ┌──┐ │  │ ┌─────┐ ┌─────┐ │ │ │ │ │     │ │ │
+ *   │ │ │ │ │EU│ │EU│ │EU│ │EU│ │  │ │VECS0│ │VECS1│ │ │ │ │ │ ... │ │ │
+ *   │ │ │ │ └──┘ └──┘ └──┘ └──┘ │  │ └─────┘ └─────┘ │ │ │ │ │     │ │ │
+ *   │ │ │ │ ┌──┐ ┌──┐ ┌──┐ ┌──┐ │  │ ┌─────┐ ┌─────┐ │ │ │ │ │     │ │ │
+ *   │ │ │ │ │EU│ │EU│ │EU│ │EU│ │  │ │CCS0 │ │CCS1 │ │ │ │ │ │     │ │ │
+ *   │ │ │ │ └──┘ └──┘ └──┘ └──┘ │  │ └─────┘ └─────┘ │ │ │ │ │     │ │ │
+ *   │ │ │ └─────────DSS─────────┘  │ ┌─────┐ ┌─────┐ │ │ │ │ │     │ │ │
+ *   │ │ │                          │ │CCS2 │ │CCS3 │ │ │ │ │ │     │ │ │
+ *   │ │ │ ┌─────┐ ┌─────┐ ┌─────┐  │ └─────┘ └─────┘ │ │ │ │ │     │ │ │
+ *   │ │ │ │ ... │ │ ... │ │ ... │  │                 │ │ │ │ │     │ │ │
+ *   │ │ │ └─DSS─┘ └─DSS─┘ └─DSS─┘  └─────Engines─────┘ │ │ │ │     │ │ │
+ *   │ │ └───────────────────────────GT0────────────────┘ │ │ └─GT1─┘ │ │
+ *   │ └────────────────────────────Tile0─────────────────┘ └─ Tile1──┘ │
+ *   └─────────────────────────────Device0───────┬──────────────────────┘
+ *                                               │
+ *                                               │
+ *                        ───────────────────────┴────────── PCI bus
+ *
+ */
+
 /**
  * DOC: Xe uAPI Overview
  *
-- 
2.34.1

