Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E1EC46CD3
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 15:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F39710EA65;
	Fri, 15 Dec 2023 15:46:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FBE10EA5A
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 15:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702655188; x=1734191188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hdBHHrhu4W8uWyVj1VNCJdP8z8xKq7mVgZ3ICZIgSjU=;
 b=BNgHrvxNjoHO6u9wLaR6gv75on1N32OZafTNvuLPzV/gFQtd206DrBJP
 bfPIwv2kXXEpTs03rDCSA4XnEVHtRQ62mB53ipUV6EJ8fFPL5zk4lh/zB
 5Iu/YEW5t+2ZAfRw5Cgdi5gZ2HQd2WlwYXHV3KDqziBhcMh4IkveVv6ET
 XESw3geSF0UUVsd+/Q/qXRlaZJQIWDPJoZ1gzxMVv5b+8Cr6I8TecT/uV
 f5BC2A65B8QH0cn0vuekg9XwvW+LqGifNXSjGwc6HP5BZy/Lyviaht20U
 /cHvujyqimTyZt4kr2cUR7lggveZsdbEx2uSBJeP8eElMDGdqc75MEQ0r g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2141874"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2141874"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="16324554"
Received: from sdiolatz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.48.85])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:28 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 17/21] drm/xe/uapi: Add block diagram of a device
Date: Fri, 15 Dec 2023 15:45:49 +0000
Message-Id: <20231215154553.7-18-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215154553.7-1-francois.dugast@intel.com>
References: <20231215154553.7-1-francois.dugast@intel.com>
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

v2: Add GT1 inside Tile0 (José Roberto de Souza)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 include/uapi/drm/xe_drm.h | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 6c719ba8fc8e..4b5d41543280 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -23,6 +23,45 @@ extern "C" {
  *   5. uEvents
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
+ *   │ │        ┌───────────────────────┐   ┌─────┐       │ │ ┌─────┐ │ │
+ *   │ │        │         VRAM0         ├───┤ ... │       │ │ │VRAM1│ │ │
+ *   │ │        └───────────┬───────────┘   └─GT1─┘       │ │ └──┬──┘ │ │
+ *   │ │ ┌──────────────────┴───────────────────────────┐ │ │ ┌──┴──┐ │ │
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
+ *   │ │ └───────────────────────────GT0────────────────┘ │ │ └─GT2─┘ │ │
+ *   │ └────────────────────────────Tile0─────────────────┘ └─ Tile1──┘ │
+ *   └─────────────────────────────Device0───────┬──────────────────────┘
+ *                                               │
+ *                        ───────────────────────┴────────── PCI bus
+ */
+
 /**
  * DOC: Xe uAPI Overview
  *
-- 
2.34.1

