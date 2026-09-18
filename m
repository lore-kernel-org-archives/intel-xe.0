Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5612BC982E8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 13:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952C510F3A3;
	Fri, 18 Sep 2026 13:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D4h/fEAv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181C210F371
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789737486; x=1821273486;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SlxVH0UGU4ZV7SIFZac3uz0RReQW3WCUCJlL7yXCJaw=;
 b=D4h/fEAvRjmzAOFk6cs6NynEb1PTfxDeClHOzGvgY6yHk8ETK3UedG26
 0qEUK1SuNVdRJyQOpIQK4ihfEvg8kHHVbDFBxBgk+QYAepfQbZxUhW9Bz
 IqhFfhtCvwyYuH6xCkygdnErs06FXO5HSuUSA1n9T/N7rJFNzbHYl91tm
 RYwy7tdapmZ6tv6NjSi2kzl3Rtlm7bhri2AoDmrCH+AQcNrfikKdQrvEL
 3tzSlEm8Y11ACJ1HFs8/JmeAuP0ngYKBrrUlZbOrXIKRZUlS5o5ViBuwh
 pfEtSHDVvsDaMtrL6VME11djte6JYniy7QvNZG23GRskJRvaLEaQ6nPr9 w==;
X-CSE-ConnectionGUID: uyYlx3rNSEK0RGxXiS7Y7A==
X-CSE-MsgGUID: +py7vWYrT12dhvIPLv6O8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89378229"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="89378229"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 06:18:03 -0700
X-CSE-ConnectionGUID: 7a+JSuxXTgW/kKx+cl1lqA==
X-CSE-MsgGUID: gEONBDXLQU+07RFKr5g3VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="270095320"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 06:18:02 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v10 05/20] platform/x86/intel/pmt: Do not remap when using
 callbacks
Date: Fri, 18 Sep 2026 06:17:56 -0700
Message-ID: <20260918131751.2408883-27-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
References: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
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

A callback indicates that the parent driver is responsible for accessing
the data area.  Creating a PMT memory remap is redundant.

If a read_telem callback has been provided, do not create a remap.

Enforce API usage where necessary.

Clean up open coded resource usage.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c     | 21 +++++++++++++--------
 drivers/platform/x86/intel/pmt/class.h     |  2 +-
 drivers/platform/x86/intel/pmt/telemetry.c |  3 +++
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index 402d51df834a..1c7a372b4fc4 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -12,6 +12,7 @@
 #include <linux/log2.h>
 #include <linux/intel_vsec.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/ioport.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mm.h>
@@ -373,7 +374,6 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 				  struct device *parent)
 {
 	struct intel_vsec_device *ivdev = dev_to_ivdev(parent);
-	struct resource res = {0};
 	struct device *dev;
 	int ret;
 
@@ -403,14 +403,19 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 	if (!entry->size)
 		return 0;
 
-	res.start = entry->base_addr;
-	res.end = res.start + entry->size - 1;
-	res.flags = IORESOURCE_MEM;
+	/*
+	 * The read_telem callback is responsible for this mapping, and may have
+	 * different requirements for use. If the callback is present do not
+	 * create the map.
+	 */
+	if (!(entry->cb && entry->cb->read_telem)) {
+		struct resource res = DEFINE_RES_MEM(entry->base_addr, entry->size);
 
-	entry->base = devm_ioremap_resource(dev, &res);
-	if (IS_ERR(entry->base)) {
-		ret = PTR_ERR(entry->base);
-		goto fail_ioremap;
+		entry->base = devm_ioremap_resource(dev, &res);
+		if (IS_ERR(entry->base)) {
+			ret = PTR_ERR(entry->base);
+			goto fail_ioremap;
+		}
 	}
 
 	sysfs_bin_attr_init(&entry->pmt_bin_attr);
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index 258cb460e61c..aeb04afb67cf 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -48,7 +48,7 @@ struct intel_pmt_entry {
 	const struct attribute_group *attr_grp;
 	struct kobject		*kobj;
 	void __iomem		*disc_table;
-	void __iomem		*base;
+	void __iomem		*base;  /* unused if cb->read_telem is in use */
 	struct pmt_callbacks	*cb;
 	unsigned long		base_addr;
 	size_t			size;
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index 953f35b6daec..5423a4dfce08 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -329,6 +329,9 @@ int pmt_telem_read32(struct telem_endpoint *ep, u32 id, u32 *data, u32 count)
 	if (!ep->present)
 		return -ENODEV;
 
+	if (!ep->base)
+		return -EIO;
+
 	offset = SAMPLE_ID_OFFSET32(id);
 	size = ep->header.size;
 
-- 
2.43.0

