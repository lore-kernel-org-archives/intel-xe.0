Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFE9F433CB
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 21:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CE410E1F9;
	Wed, 15 Apr 2026 21:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQQXn3Nk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412FC10E1F9
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 21:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776289910; x=1807825910;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WIJ4lRxewKQJWEMFaGMuKYzmsOI1W4hZJrmSXQVtt88=;
 b=CQQXn3NkYQTQQAXdl6KRkr95pmWKfle5wffC1+JA2x49OqVO/JEA4wVq
 /NjZ+ANbdiqfmlY2MWvESRLuXLZFM4KKIKquhqcRS03dXwjer+KvNaUz1
 FDlp1fxBYCba8r+/nDoV3i0uuF7rWmgy3piJ8IlkMTJNxD6DlizwBaA3e
 DmXTLos10ZIxVFc99DQBukVYrSXJJdi6+3HW85FWewYFtTzc2T4WLKCqn
 Me8DDcMkG6xT6KA024Rr1E720AS/85kU6qxEwN360e3zR74JoVqrIVy3/
 f+YBeQ2MoCe7Y7WgCq3xiqmd88hLX4uvM3pEE8zNgmoCStuJQkh1yeB2u Q==;
X-CSE-ConnectionGUID: QrpVp8vgRkCHLqvAr7QerA==
X-CSE-MsgGUID: v2v44UMRRxG47frdnOTTrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94851307"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="94851307"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 14:51:50 -0700
X-CSE-ConnectionGUID: tvO55GaxTzu3okF5vKXcGw==
X-CSE-MsgGUID: +jAmcziIQhaTe5xFnPcPPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235493092"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa005.jf.intel.com with ESMTP; 15 Apr 2026 14:51:50 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] scripts/kernel-doc: Detect mismatched inline member
 documentation tags
Date: Wed, 15 Apr 2026 21:50:32 +0000
Message-Id: <20260415215032.3398330-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add validation in check_sections() to verify that inline member
documentation tags (/** @member: description */) match actual struct/union
member names. Previously, kernel-doc only validated section headers against
the parameter list, but inline doc tags stored in parameterdescs were never
cross-checked, allowing stale or mistyped member names to go undetected.

The new check iterates over parameterdescs keys and warns about any that
don't appear in the parameter list, catching issues like renamed struct
members where the documentation tag was not updated to match.

This catches real issues such as:
  - xe_bo_types.h: @atomic_access (missing struct prefix, should be
    @attr.atomic_access)
  - xe_device_types.h: @usm.asid (member is actually asid_to_vm)

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tools/lib/python/kdoc/kdoc_parser.py | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index ca00695b47b3..f21f06c0a9b0 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -673,6 +673,31 @@ class KernelDoc:
                 self.emit_msg(ln,
                               f"Excess {dname} '{section}' description in '{decl_name}'")
 
+        #
+        # Check that documented parameter names (from doc comments, including
+        # inline ``/** @member: */`` tags) actually match real members in
+        # the declaration.  This catches mismatched or stale kernel-doc
+        # member tags that don't correspond to any actual struct/union
+        # member or function parameter.
+        #
+        for param_name, desc in self.entry.parameterdescs.items():
+            # Skip auto-generated entries from push_parameter()
+            if desc == self.undescribed:
+                continue
+            if desc in ("no arguments", "anonymous\n", "variable arguments"):
+                continue
+            if param_name.startswith("{unnamed_"):
+                continue
+            if param_name in self.entry.parameterlist:
+                continue
+
+            if decl_type == 'function':
+                dname = f"{decl_type} parameter"
+            else:
+                dname = f"{decl_type} member"
+            self.emit_msg(ln,
+                          f"Excess {dname} '{param_name}' description in '{decl_name}'")
+
     def check_return_section(self, ln, declaration_name, return_type):
         """
         If the function doesn't return void, warns about the lack of a
-- 
2.43.0

