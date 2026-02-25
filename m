Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E32FD377A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 17:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F42210E7E7;
	Wed, 25 Feb 2026 17:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+l9vw2N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA23910E7E7;
 Wed, 25 Feb 2026 17:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772042301; x=1803578301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=od7yw/8tLh1IQibZ6exSH+Py24GfmJ10LZ+oBvxhaaI=;
 b=V+l9vw2NYM1cYulvisRokJx+UUdr8IiHxhOiU2OPO0SPBD095Aq6ywE4
 sl11DaxEID2pqlDB1kY6wA0ok/rGYTx+YugpMGViwYCXKBJX68BMQIXb3
 Q+ofSdWspwIWajxI1VCv12iQyqNWhkiXcRXU3OuEOYWpZfbGLBQKDyE6a
 GPFx+2dMqzzYpK3gaWVbNHLILsP4C3JMIWgjYsmB8vkDoxz+6NhzBLzrQ
 fad7+9/iIq5g3YD/nL8i31w03QvaLWlqLGs0jAiXAX19aHDhhbI2qJdEU
 Y2IIWcNBldHOluZFe0eyC1TkPy6ln/qZz2Xas4JmR3zbCZKH1s1HYnDIe Q==;
X-CSE-ConnectionGUID: Y8lETCzqSsWhOj20/J38pQ==
X-CSE-MsgGUID: p7ioZVA/TLKoezgGv+HkIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="76961578"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="76961578"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 09:58:20 -0800
X-CSE-ConnectionGUID: ZpOYBupQTW6p9G7vntaBYQ==
X-CSE-MsgGUID: bQbxi1QmQtG20xdsvRToqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="220812048"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.68])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 09:57:54 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH 8/8] drm/i915/gt: prefer _PICK_EVEN() over _PICK()
Date: Wed, 25 Feb 2026 19:57:10 +0200
Message-ID: <f94272fb9e93afa51d9fdb006888b8ebe38580df.1772042022.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772042022.git.jani.nikula@intel.com>
References: <cover.1772042022.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

There's no need to use _PICK() here. Use the simpler one instead.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 14d31882e9e7..3ba9b2206b79 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -321,11 +321,9 @@
 #define _RING_FAULT_REG_VCS			0x4194
 #define _RING_FAULT_REG_BCS			0x4294
 #define _RING_FAULT_REG_VECS			0x4394
-#define RING_FAULT_REG(engine)			_MMIO(_PICK((engine)->class, \
-							    _RING_FAULT_REG_RCS, \
-							    _RING_FAULT_REG_VCS, \
-							    _RING_FAULT_REG_VECS, \
-							    _RING_FAULT_REG_BCS))
+#define RING_FAULT_REG(engine)			_MMIO(_PICK_EVEN((engine)->class, \
+								 _RING_FAULT_REG_RCS, \
+								 _RING_FAULT_REG_VCS))
 #define   RING_FAULT_VADDR_MASK			REG_GENMASK(31, 12) /* pre-bdw */
 #define   RING_FAULT_ENGINE_ID_MASK		REG_GENMASK(16, 12) /* bdw+ */
 #define   RING_FAULT_GTTSEL_MASK		REG_BIT(11) /* pre-bdw */
-- 
2.47.3

