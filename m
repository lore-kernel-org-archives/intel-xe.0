Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5264CD3423
	for <intel-xe@archiver.kernel.org>; Fri,  1 May 2026 16:08:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA0210E1EC;
	Fri,  1 May 2026 16:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VLoXLIaA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8A610E1EC
 for <intel-xe@lists.freedesktop.org>; Fri,  1 May 2026 16:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777651698; x=1809187698;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vxGRwB/I7p12xwDNXW7dFz9qMSrnvn0MCs7SikDGUYQ=;
 b=VLoXLIaAwdWfnfcST1KtQuHoWhu5+Qg69Oh467EHMGEd20sO3bEtIxc/
 jqe4jH6mqVtmMzfs2lwxHO1Oc0y+wraif7qvVwYoAIbDTNgznol3RUfQZ
 OEligtypUv4BugiChPzxA30itAm894iN59urj+M84yRobwiqC5/iSJ+ho
 OUKyrXTZoFoSftyh5/WttqJUrU9rZM8aaZ6A66iVClHMbJHvZThWrW+5t
 cf9MBHubuf2wZn1N6AwfHpLdKrKUnEgIEEMUaj8vhONkwgarL+g5wvYZ6
 nvyHuhFkkBgGTwR78rbQoBY7esdExTpToltIgta9CrYRpLAa8pOt/ABgF w==;
X-CSE-ConnectionGUID: fn6xQagYTXK+S6d/Ts9Pfw==
X-CSE-MsgGUID: hdjCaalmQ7iXr3ck6qcQoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78714617"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="78714617"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 09:08:17 -0700
X-CSE-ConnectionGUID: JhM12/rPQ9CnSMcpxhrRqw==
X-CSE-MsgGUID: RkyeEZXHQFeeYR8bMnZw9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="239221064"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa004.jf.intel.com with ESMTP; 01 May 2026 09:08:15 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: linux-doc@vger.kernel.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Subject: [PATCH v2] scripts/kernel-doc: Detect mismatched inline member
 documentation tags
Date: Fri,  1 May 2026 16:08:00 +0000
Message-Id: <20260501160800.4043276-1-shuicheng.lin@intel.com>
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

Variadic arguments documented as ``@args...:`` are stored in
parameterdescs under the unstripped key (e.g. ``args...``), while
push_parameter() strips the trailing ``...`` before appending to
parameterlist (e.g. ``args``).  Treat the stripped form as a match so
the new loop doesn't emit a false-positive excess-parameter warning for
a properly documented named variadic parameter.  The bare ``@...:`` form
is unaffected because push_parameter() does not strip when the name is
exactly three characters.

v2: Skip variadic parameters whose documented key ends with ``...`` and
    whose stripped name is in parameterlist, to avoid false-positive
    "Excess function parameter 'args...'" warnings on macros like
    ``#define foo(fmt, args...)`` documented with ``@args...:``.

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org
---
 tools/lib/python/kdoc/kdoc_parser.py | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index ca00695b47b3..884c6bf56d25 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -673,6 +673,42 @@ class KernelDoc:
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
+            #
+            # Variadic arguments documented as ``@args...:`` are stored in
+            # parameterdescs under the unstripped key (e.g. ``args...``),
+            # while push_parameter() strips the trailing ``...`` before
+            # appending to parameterlist (e.g. ``args``).  Treat the
+            # stripped form as a match so this loop doesn't emit a false
+            # positive for a properly documented variadic parameter.
+            #
+            if param_name.endswith("...") and \
+               param_name[:-3] in self.entry.parameterlist:
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

