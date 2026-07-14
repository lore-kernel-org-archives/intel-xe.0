Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5CFC43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 11:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA3410E064;
	Tue, 14 Jul 2026 11:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jHP0haix";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A8010E064
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 11:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784027564; x=1815563564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s5YPP6ZG6jo/D/s07OJcTn9HjgNrbSSYqBFKOt1viN4=;
 b=jHP0haixVPWb1khQSaVHuvUooXnTlNhoYNt86yWve288PMl0vUs5hi3D
 /qfw4PcPCIIHVMTjk5hYXK0z5Ye0LAw9AK1FeTLu3JVhT2TptWa2iguwo
 e/2SidazS2hx7xxC0Tr3omYpZUCBhWEsom9mfr0iLUGPz0dqY5/EHHrWS
 HZbrSGa7YGZV+CDpdantr9f6FQwSNzXdK/XfKDYFy1EWxmezMsPuLARLy
 2Jq5YP6+8VeJGqgdbwK1mlljMVY6kUMG3qBzKc1/hDgVwBK9OcfrMA0Zc
 iZqxRcjziXNDYT10INUrVkIzOpK1gTWG0fj6XCjqlmMzO9hYA1AkzzLyu w==;
X-CSE-ConnectionGUID: U8S9u8geStidCw3+fdm78g==
X-CSE-MsgGUID: og5JCvY9RU2qWc1iUivryw==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="72169819"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="72169819"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 04:12:42 -0700
X-CSE-ConnectionGUID: Q2xlRzHtS+yXxonBC+a5FA==
X-CSE-MsgGUID: EiEQOQIHT2CQKkQ36H1b9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="279095107"
Received: from rknop-desk.igk.intel.com (HELO rknop-desk.ger.corp.intel.com)
 ([172.28.178.99])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 04:12:41 -0700
From: Ryszard Knop <ryszard.knop@intel.com>
To: linux-doc@vger.kernel.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Subject: [PATCH] scripts/kernel-doc: Suggest possible names for excess
 descriptions
Date: Tue, 14 Jul 2026 13:12:08 +0200
Message-ID: <20260714111208.323108-1-ryszard.knop@intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Since check_sections() now warns if a documentation tag member name is
the same as defined in the struct, we can suggest names the checker
knows, so that it's more obvious how to deal with the warning.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 tools/lib/python/kdoc/kdoc_parser.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 2dedda215c22..3f88095eab06 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -558,6 +558,13 @@ class KernelDoc:
                         self.push_parameter(ln, decl_type, param, dtype,
                                             arg, declaration_name)
 
+    def get_suggestions_hint(self, decl_name, possible_names):
+        suggestions = set(name for name in possible_names if decl_name in name)
+        if not suggestions:
+            return ""
+
+        return f"(did you mean one of: '{"', '".join(suggestions)}')"
+
     def check_sections(self, ln, decl_name, decl_type):
         """
         Check for errors inside sections, emitting warnings if not found
@@ -566,12 +573,13 @@ class KernelDoc:
         for section in self.entry.sections:
             if section not in self.entry.parameterlist and \
                not known_sections.search(section):
+                hint = self.get_suggestions_hint(section, self.entry.parameterlist)
                 if decl_type == 'function':
                     dname = f"{decl_type} parameter"
                 else:
                     dname = f"{decl_type} member"
                 self.emit_msg(ln,
-                              f"Excess {dname} '{section}' description in '{decl_name}'")
+                              f"Excess {dname} '{section}' description in '{decl_name}' {hint}")
 
         #
         # Check that documented parameter names (from doc comments, including
@@ -591,12 +599,13 @@ class KernelDoc:
             if param_name in self.entry.parameterlist:
                 continue
 
+            hint = self.get_suggestions_hint(param_name, self.entry.parameterlist)
             if decl_type == 'function':
                 dname = f"{decl_type} parameter"
             else:
                 dname = f"{decl_type} member"
             self.emit_msg(ln,
-                          f"Excess {dname} '{param_name}' description in '{decl_name}'")
+                          f"Excess {dname} '{param_name}' description in '{decl_name}' {hint}")
 
     def check_return_section(self, ln, declaration_name, return_type):
         """
-- 
2.55.0

