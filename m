Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663AEC3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 14:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDFC10EAF3;
	Fri, 16 May 2025 14:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+rYaQGd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B892610EAF2
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 14:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747406801; x=1778942801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MQKaS/dgl3tQqavcJXqjLuGhrtMoOWtTBdTaH71+mVs=;
 b=A+rYaQGdeeF03knTsy0hJWNsybfGAIBFaXtWHpd7FcQ1FdBnFuC2V0D+
 gOm7hFNXC5iN8A7AYXDar6zHGDgKK/gMf+XhH3J4DYdKZIFXEf8aSTcdS
 DBFRM2LW2EnetwrCl63DM4IoQMRC3rDzyUe8i4Vqr/0Ub0w5Agbw45097
 pk9VytnP0U3f+mNSDIfZpnL6B/ANw6WzQCm5mMJmK4/WoEQr7jjuhFTnr
 nQwDaS8xTEcKOV0C8uCcbQBpiL7qwTrGcKHaOJfs6hLqwxofTh4WEPCBG
 7E1fuMh+Dzgkuc4maqek73Vb2nu8S4JfUvZYcifQMhbf2dKrgmbuoqTZw Q==;
X-CSE-ConnectionGUID: VfdX3LYVTiGAqAtb8fM6Bg==
X-CSE-MsgGUID: r3yEDPhfSvOB7QMvOCkz8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49307589"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49307589"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 07:46:41 -0700
X-CSE-ConnectionGUID: ir1IDB5nSo2uD5D2DdKYoQ==
X-CSE-MsgGUID: pkCt4Fd9Rxal9bY7xatVWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169755550"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.223.225])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 07:46:40 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: linux-platform-driver-x86@linux-kbuild-tools.org,
 intel-xe@lists.freedesktop.org, david.e.box@intel.com,
 rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 3/4] platform/x86/intel/pmt: decouple sysfs and namespace
Date: Fri, 16 May 2025 10:46:18 -0400
Message-ID: <20250516144619.210413-4-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516144619.210413-1-michael.j.ruhl@intel.com>
References: <20250516144619.210413-1-michael.j.ruhl@intel.com>
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

The PMT namespace includes the crashlog sysfs attribute
information.  Other crashlog version/types may need
different sysfs attributes.  Coupling the attributes with
the namespace blocks this usage.

Decouple sysfs attributes from the name space and add them
to the specific entry.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c    | 12 ++++++------
 drivers/platform/x86/intel/pmt/class.h    |  2 +-
 drivers/platform/x86/intel/pmt/crashlog.c |  3 ++-
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index 7233b654bbad..7404807c3943 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -284,8 +284,8 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 
 	entry->kobj = &dev->kobj;
 
-	if (ns->attr_grp) {
-		ret = sysfs_create_group(entry->kobj, ns->attr_grp);
+	if (entry->attr_grp) {
+		ret = sysfs_create_group(entry->kobj, entry->attr_grp);
 		if (ret)
 			goto fail_sysfs_create_group;
 	}
@@ -326,8 +326,8 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 fail_add_endpoint:
 	sysfs_remove_bin_file(entry->kobj, &entry->pmt_bin_attr);
 fail_ioremap:
-	if (ns->attr_grp)
-		sysfs_remove_group(entry->kobj, ns->attr_grp);
+	if (entry->attr_grp)
+		sysfs_remove_group(entry->kobj, entry->attr_grp);
 fail_sysfs_create_group:
 	device_unregister(dev);
 fail_dev_create:
@@ -369,8 +369,8 @@ void intel_pmt_dev_destroy(struct intel_pmt_entry *entry,
 	if (entry->size)
 		sysfs_remove_bin_file(entry->kobj, &entry->pmt_bin_attr);
 
-	if (ns->attr_grp)
-		sysfs_remove_group(entry->kobj, ns->attr_grp);
+	if (entry->attr_grp)
+		sysfs_remove_group(entry->kobj, entry->attr_grp);
 
 	device_unregister(dev);
 	xa_erase(ns->xa, entry->devid);
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index b2006d57779d..6b3455a86471 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -41,6 +41,7 @@ struct intel_pmt_entry {
 	struct telem_endpoint	*ep;
 	struct intel_pmt_header	header;
 	struct bin_attribute	pmt_bin_attr;
+	const struct attribute_group *attr_grp;
 	struct kobject		*kobj;
 	void __iomem		*disc_table;
 	void __iomem		*base;
@@ -54,7 +55,6 @@ struct intel_pmt_entry {
 struct intel_pmt_namespace {
 	const char *name;
 	struct xarray *xa;
-	const struct attribute_group *attr_grp;
 	int (*pmt_header_decode)(struct intel_pmt_entry *entry,
 				 struct device *dev);
 	int (*pmt_add_endpoint)(struct intel_vsec_device *ivdev,
diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index dba7e7c1585d..c9bfe1c26311 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -307,6 +307,8 @@ static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
 	/* Size is measured in DWORDS, but accessor returns bytes */
 	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));
 
+	entry->attr_grp = &pmt_crashlog_group;
+
 	return 0;
 }
 
@@ -314,7 +316,6 @@ static DEFINE_XARRAY_ALLOC(crashlog_array);
 static struct intel_pmt_namespace pmt_crashlog_ns = {
 	.name = "crashlog",
 	.xa = &crashlog_array,
-	.attr_grp = &pmt_crashlog_group,
 	.pmt_header_decode = pmt_crashlog_header_decode,
 	.pmt_add_endpoint = pmt_crashlog_add_endpoint,
 };
-- 
2.49.0

