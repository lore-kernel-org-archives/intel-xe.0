Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94761C44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 11:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5180710E178;
	Wed, 15 Jul 2026 11:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOVHw0oU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6367310E178
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 11:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784114278; x=1815650278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sIY1J/umhJmWf27+JDas0eGOf7rwLe6iPhl2N/ISoXQ=;
 b=XOVHw0oUGAQHUcEe0KcPxSHhvS5v54eH5gNHfhG/F1QbND44iZ6Q64rI
 6ceZOy3Ckrky7G+/5AQglvHRpVXP0MZNgTQ7kTwxpNrzfHmXvNJ5ipUEC
 Zl1lKiE530yjrqGfAkulk/pelQcKOkrq8CUMSOhdFLe1bP4VizSHTGGiM
 YkfdtUi39sniHnzsBWzwUququPstquq+kr/PzVHWu+h/eYj5k0nX5dE50
 aT+XxjaEuESa0oZfGJcT3BVE0iEwWgl4YnZlM8EYG+QzBQcbwnRA5l3Iw
 GQDnPU6BqAdWyPiL0j2DB68M1RGrPDSmt+O0CIUqKQU91Ft3zlnJ/AR9f A==;
X-CSE-ConnectionGUID: /PngBZt6Txq5X1wM8gTL8Q==
X-CSE-MsgGUID: 0VZa9WouQHWnNSB0Clj2cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102172334"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="102172334"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 04:17:58 -0700
X-CSE-ConnectionGUID: XzUOvba2Tmy+Tqf2vn7jwQ==
X-CSE-MsgGUID: mIcV2l16TsGMn4KaXOIWuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="249782220"
Received: from rknop-desk.igk.intel.com (HELO rknop-desk.ger.corp.intel.com)
 ([172.28.178.99])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 04:17:56 -0700
From: Ryszard Knop <ryszard.knop@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Subject: [PATCH v2] scripts/kernel-doc: Suggest possible names for excess
 descriptions
Date: Wed, 15 Jul 2026 13:17:26 +0200
Message-ID: <20260715111726.394565-1-ryszard.knop@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714111208.323108-1-ryszard.knop@intel.com>
References: <20260714111208.323108-1-ryszard.knop@intel.com>
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

v2 (rdunlap):
- Strip whitespace from warnings, nicer when the hint is empty

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 tools/lib/python/kdoc/kdoc_parser.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 2dedda215c22..a22c3e3182f0 100644
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
+                              f"Excess {dname} '{section}' description in '{decl_name}' {hint}".strip())
 
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
+                          f"Excess {dname} '{param_name}' description in '{decl_name}' {hint}".strip())
 
     def check_return_section(self, ln, declaration_name, return_type):
         """
-- 
2.55.0

