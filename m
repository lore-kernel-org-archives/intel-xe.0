Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04917C624D0
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 19:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8A110EECB;
	Tue,  1 Sep 2026 19:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ak1odDB2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C1410EEC9
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 19:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788290876; x=1819826876;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=C9qUbqxtsoplUxq3BM5BwqcgPbGIhj11gz0jI+/Ruko=;
 b=ak1odDB2aQA7ja2VAVWY5B8EsxeswpnexxpChQhInRkF1AZkCgI5zy2+
 GUbN8KPoM+jL8O3993y9q7vyTp+I4ptbhHcVkCi2j7AwDH8hkueG1CTDw
 8VjLXCipTtKFfggdwa+1jg9x+5bqf4GbfgaiyTwHG/wHqNq692cPdTUSS
 JTkFXEmlf5U9NJLwX/l5/6is+U00LGTkpzT6nb+gTqKwQCnNYUAmJSTgF
 N2chd6KenicxS0tvkKC4NVMj+OMow7yDzICZVTtakcyulnlO13y1P7sNX
 fji5kM77OdQG+jFdRY7u5Czh8j6wqzwkeN6qewQ5gZQ3mkt+TXgpXkziL Q==;
X-CSE-ConnectionGUID: bOsxK+3ZT8GltXWtrmD4+Q==
X-CSE-MsgGUID: y7iE8MwvTh6F2wFNkDOvnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88762484"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="88762484"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 12:27:55 -0700
X-CSE-ConnectionGUID: b4MvIHZLSG67yg+4m8Z2MQ==
X-CSE-MsgGUID: g6pEH/OLQZew8wUhiol3xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="269776736"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 12:27:55 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v4 06/18] platform/x86/intel/pmt: Do not remap when using
 callbacks
Date: Tue,  1 Sep 2026 12:27:41 -0700
Message-ID: <20260901192736.626777-26-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901192736.626777-20-michael.j.ruhl@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
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

A callback indicates that the parent driver is responsible
for accessing the data area.  Creating a PMT memory remap
is redundant.

If a read_telem callback has been provided, do not create a
remap.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index af7c951b569a..350129121ff1 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -373,7 +373,6 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 				  struct device *parent)
 {
 	struct intel_vsec_device *ivdev = dev_to_ivdev(parent);
-	struct resource res = {0};
 	struct device *dev;
 	int ret;
 
@@ -403,14 +402,18 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 	if (!entry->size)
 		return 0;
 
-	res.start = entry->base_addr;
-	res.end = res.start + entry->size - 1;
-	res.flags = IORESOURCE_MEM;
+	if (!is_cb_read_telem(entry->cb)) {
+		struct resource res = {0};
 
-	entry->base = devm_ioremap_resource(dev, &res);
-	if (IS_ERR(entry->base)) {
-		ret = PTR_ERR(entry->base);
-		goto fail_ioremap;
+		res.start = entry->base_addr;
+		res.end = res.start + entry->size - 1;
+		res.flags = IORESOURCE_MEM;
+
+		entry->base = devm_ioremap_resource(dev, &res);
+		if (IS_ERR(entry->base)) {
+			ret = PTR_ERR(entry->base);
+			goto fail_ioremap;
+		}
 	}
 
 	sysfs_bin_attr_init(&entry->pmt_bin_attr);
-- 
2.43.0

