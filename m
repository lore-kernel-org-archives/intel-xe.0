Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B0DC001B2
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E424F10E8E3;
	Thu,  9 Nov 2023 15:46:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD1E10E8F0
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544772; x=1731080772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8IEMCh4cfSTfslefqh032RYTEihX8ZMKyseMhOFGbuo=;
 b=J2xr7mMYQgSEAMeiK5fo+qJpxZMl9RZjbqk9g/2Kqz2/bC9uiVQwmwTU
 WbOOzvkiUEgHcV/DGX7JWqwY8IJW+v9p/9zQCrTSNqHl9Jlu2WDgpfbUw
 2lJu2NNVcdBCKQxLDTf3rZvVvi6/z0dthqXgRHsxBIa8M6Y/JMOzCq0ar
 KwlJvtzmWuwG/ExR0mSwFFBC3kX/AKiXifx+rZIbCyVcywE6hJyfLpIRZ
 wnhxYImaqdAAV9xkDD8cQP/A4RH7g0Bn4WMmXkBnpi537Ql7von2LojVu
 AtKqX3aoCyT+5CxaOFBMTy+aWKA+BkV/uWzjDDEtyjRj9caZInk8AwS97 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556864"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556864"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:46:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936886110"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936886110"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:46:06 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:56 +0000
Message-Id: <20231109154457.7-43-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 42/43] drm/xe/uapi: Add block diagram of a
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
index d586c8aeb279..4339e6fe47e4 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -26,6 +26,47 @@ extern "C" {
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

