Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2615C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 03:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09311129A3;
	Tue, 16 Apr 2024 03:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABCgbf/z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F9A1129A5
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 03:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713236708; x=1744772708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DaK9rihNVu78M0tAY5WSQllCXAQBPbaNJzoB6FhZr7w=;
 b=ABCgbf/zGjGPSHWaDBA0cvnwk8YePBdd03xG3DhxkRRxBiVvm8zcO4J5
 jMm7AqD6I9yJMvSzc//9pwRQs/7yQD+rngbQOLKe3pKtSUMsLLr4F01kL
 tuLhvtnWCKQSVzT/ind9B4bP7446OTnvqJqUThXU2zblOyBbl0e5TKgBZ
 jk6m9rK+D68GR8efJ7dMESTkSKnYOoPz1FlxNLjc8r+znaU4rOsjKfrf8
 UDhgpL9ET/hxAs5+bFy9RnV3v7orLSJPilFns3da2LBYRRk9TD8lnfrWn
 2H6e+Zba/7Sbiq6KnoBTvKHe/31u0YhK/jjj5gim7tlhR9pOmZXYJNnG6 w==;
X-CSE-ConnectionGUID: JI4VrQnpS3eD7s5rcXFIaw==
X-CSE-MsgGUID: f11xAPtDQqasaeyRbIs2Ag==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19213834"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="19213834"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 20:05:06 -0700
X-CSE-ConnectionGUID: jwr+fne7ROimYkNkQIUQ3A==
X-CSE-MsgGUID: 3lGmUMmWT/+tcGUvqHS90Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="26895715"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 20:05:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 7/7] HACK: simple gputop-like impl in python
Date: Mon, 15 Apr 2024 20:04:54 -0700
Message-ID: <20240416030454.3739862-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240416030454.3739862-1-lucas.demarchi@intel.com>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 pyfdinfo | 113 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100755 pyfdinfo

diff --git a/pyfdinfo b/pyfdinfo
new file mode 100755
index 000000000000..c01d1a399c2f
--- /dev/null
+++ b/pyfdinfo
@@ -0,0 +1,113 @@
+#!/usr/bin/python
+
+import dataclasses
+import pathlib
+import os
+import sys
+import typing
+import time
+
+@dataclasses.dataclass
+class ClientState():
+    g_stamp : int
+    c_stamp : int
+    c_runtime : int
+    g_runtime : int
+    visited : bool
+    engine: str
+
+def proc_fddir():
+    for child in pathlib.Path('/proc').iterdir():
+        if child.is_dir() and child.name.isnumeric():
+            yield child / "fd"
+
+
+def drm_fd(pfddir):
+    for child in pfddir.iterdir():
+        if not child.is_symlink() or not child.name.isnumeric() or not child.is_char_device():
+            continue
+
+        major = os.major(child.stat(follow_symlinks=True).st_rdev)
+        if major == 226:
+            yield child
+
+
+def drm_clients():
+    for fd in proc_fddir():
+        for dfd in drm_fd(fd):
+            yield dfd.parent.parent / "fdinfo" / dfd.name
+
+
+def sample(clients):
+    for c in clients.values():
+        c.visited = False
+
+    for c in drm_clients():
+        for line in c.read_text().splitlines():
+            # ignore capacity for now
+            if line.startswith("drm-engine-capacity-"):
+                continue
+
+            if not line.startswith("drm-engine-"):
+                continue
+
+            sl = line.split()
+            engine = sl[0][len("drm-engine-"):].split(":")[0]
+
+            cs_new = ClientState(int(sl[1]), int(sl[2]), 0, 0, True, engine)
+            cs = clients.get(c / engine)
+            if cs is None:
+                clients[c / engine] = cs_new
+            else:
+                cs.g_runtime = cs_new.g_stamp - cs.g_stamp
+                cs.c_runtime = cs_new.c_stamp - cs.c_stamp
+
+                cs.g_stamp = cs_new.g_stamp
+                cs.c_stamp = cs_new.c_stamp
+
+                cs.visited = True
+
+            #print(f"{str(c):<25} g={sl[1]:<12} t={sl[2]:16}")
+
+    # the reaper
+    for ck in list(clients.keys()):
+        if not clients[ck].visited:
+            del clients[ck]
+
+
+def clrscr():
+    print("\033[H\033[J")
+
+
+def main():
+    clients = dict()
+
+    sample(clients)
+
+    while True:
+        prev_parent = None
+        sample(clients)
+
+        clrscr()
+
+        for k, c in clients.items():
+            # skip clients with just one sample
+            if not c.visited:
+                continue
+
+            if k.parent != prev_parent:
+                print()
+            prev_parent = k.parent
+
+            g = c.g_runtime or c.g_runtime + 1
+
+            print(f"{str(k):<25} {((c.c_runtime / g) * 100):.2f} %")
+
+        time.sleep(2)
+
+
+if __name__ == "__main__":
+    try:
+        main()
+    except KeyboardInterrupt:
+        pass
-- 
2.43.0

