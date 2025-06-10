Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F47BC61DB2
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 21:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C98A10E5BF;
	Tue, 10 Jun 2025 21:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQz2r7gn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16B410E341
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 21:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749589975; x=1781125975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=huEBjA3UxNbeNrW5uorw39DFn1/wTp9TfQsQtMmu7xg=;
 b=MQz2r7gnMQZOoVrzQUp8FGfuq8EvN9KzFBKff5/3LIXWDGI1yXhFWIaU
 wnrOHo1Z1h6Bm8duU3StCCUwh3GqirxGPdzsFv4uhTf+RJ8RoCt9GFzs0
 KeeBou3IlDe+5IF+rjos4g3VXETzJVMx5J0cGYHZgFnup0QcrqAW+9NeS
 4eSiH2Ao/RYDTMx6mhlGuM9N+CaGuiDFO82t54t7p55l8TmOBK/mpvBeK
 OmyfdaFStvp0HGzqqvy4myOF0cslBvC2XE38vuhz1PBaLfnH6TqYfqhBC
 mIW/yR/hSBq5EYkQONgUEciaGHWbXKD2LJhyOemX4+Kywdf8y9dBlSeCi Q==;
X-CSE-ConnectionGUID: zE1MREBDT2SN2OAq5VYUDA==
X-CSE-MsgGUID: fonI+F8KTOO+sTFWkJBY8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51816941"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; d="scan'208";a="51816941"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 14:12:55 -0700
X-CSE-ConnectionGUID: SAoSRXYrRJGGn6oIjK0f0g==
X-CSE-MsgGUID: 9v/HgIYXTmOl7F5sRSjFnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; d="scan'208";a="146939821"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.220.88])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 14:12:52 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v4 06/10] platform/x86/intel/pmt: correct types
Date: Tue, 10 Jun 2025 17:12:21 -0400
Message-ID: <20250610211225.1085901-7-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
References: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
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

A couple of auto variables do not match the return types of some of
the functions.

Update the mismatched types to match.

Reviewed-by: David E. Box <david.e.box@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 3d3b72451c01..ddb05d069fc6 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -137,7 +137,7 @@ static ssize_t
 enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct intel_pmt_entry *entry = dev_get_drvdata(dev);
-	int enabled = !pmt_crashlog_disabled(entry);
+	bool enabled = !pmt_crashlog_disabled(entry);
 
 	return sprintf(buf, "%d\n", enabled);
 }
@@ -168,7 +168,7 @@ static ssize_t
 trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct intel_pmt_entry *entry;
-	int trigger;
+	bool trigger;
 
 	entry = dev_get_drvdata(dev);
 	trigger = pmt_crashlog_complete(entry);
-- 
2.49.0

