Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA4BD2D8E1
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 10:01:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB4B10E513;
	Tue, 27 Jan 2026 10:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gjymxo/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5CE10E513;
 Tue, 27 Jan 2026 10:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769508105; x=1801044105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=64j++wGIQCKUBk2lHDmZEs08gnuA8/UnWy6G0WGPs/U=;
 b=Gjymxo/seTjno9kTTiv1Q4sC4X6YMXAAVTZpGUL+hdwAhqq5MJReRH31
 tM0phcSo/809Lo1xQVpInmRW/42n1lQ+GxHTjdYEIWrwiqnHaACcgbK01
 rXKTgnq4oNFTXxMlT4ecVda10iCJMJz4rySAzkuS4alwJU82i71l27YoG
 z/YAv6WA1UzSCmVZ6ePvb2yTg6ennJinbueBziyPFiVtekxjHun9gK6Oq
 +6pA9+/KBH5X1qfQQBxCKHmqAPskabJ+0T/DbycShoNPxrq0P1DfPG3gt
 jDulV+2Slm2+danTzi95q/r+UfLem4d44BBPnMxnjtqH/y+aS5VzaE9/b g==;
X-CSE-ConnectionGUID: 53CaDGzCTd+qTGwoEVIXzw==
X-CSE-MsgGUID: K/0fFxvDQ66MrY7w/oLv6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70602223"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="70602223"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 02:01:45 -0800
X-CSE-ConnectionGUID: 6yWn8JxVSZayC8schXTnvw==
X-CSE-MsgGUID: KWHtZ5FiTJ2FFRlldNk9FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207732511"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.153])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 02:01:42 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v2 2/6] lib/igt_device_scan: Split out reusable part of
 update_or_add_parent
Date: Tue, 27 Jan 2026 10:54:19 +0100
Message-ID: <20260127100123.114516-10-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127100123.114516-8-janusz.krzysztofik@linux.intel.com>
References: <20260127100123.114516-8-janusz.krzysztofik@linux.intel.com>
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

Users of Intel discrete graphics adapters are confused with fake
information on PCIe link bandwidth (speed and size) of their GPU devices
reported by sysfs and userspace tools, including our lsgpu utility.  In
order for the lsgpu to show correct link bandwidth information, we need to
identify an upstream port of a PCIe bridge that sits on the GPU card and
get that information from that port.

Since the tool uses our udev based igt_device_scan library for identifying
GPU devices and printing their properties and attributes, modifications
that we need apply to that library.

Refactor the library so a part of it can be reused for processing the
bridge port.

There are no functional changes introduced with this patch.

Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10753
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_device_scan.c | 68 ++++++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 27 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 7ae64375b5..6a907a4ebb 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -914,32 +914,20 @@ static struct igt_device *igt_device_from_syspath(const char *syspath)
 }
 
 #define RETRIES_GET_PARENT 5
-/* For each drm igt_device add or update its parent igt_device to the array.
- * As card/render drm devices mostly have same parent (vkms is an exception)
- * link to it and update corresponding drm_card / drm_render fields.
- */
-static void update_or_add_parent(struct udev *udev,
-				 struct udev_device *dev,
-				 struct igt_device *idev,
-				 bool limit_attrs)
+
+static struct igt_device *find_or_add_igt_device(struct udev *udev,
+						 struct udev_device *dev,
+						 bool limit_attrs)
 {
-	struct udev_device *parent_dev;
-	struct igt_device *parent_idev;
-	const char *subsystem, *syspath, *devname;
 	int retries = RETRIES_GET_PARENT;
+	const char *subsystem, *syspath;
+	struct igt_device *idev;
 
-	/*
-	 * Get parent for drm node. It caches parent in udev device
-	 * and will be destroyed along with the node.
-	 */
-	parent_dev = udev_device_get_parent(dev);
-	igt_assert(parent_dev);
-
-	subsystem = udev_device_get_subsystem(parent_dev);
-	syspath = udev_device_get_syspath(parent_dev);
+	subsystem = udev_device_get_subsystem(dev);
+	syspath = udev_device_get_syspath(dev);
 
-	parent_idev = igt_device_find(subsystem, syspath);
-	while (!parent_idev && retries--) {
+	idev = igt_device_find(subsystem, syspath);
+	while (!idev && retries--) {
 		/*
 		 * Don't care about previous parent_dev, it is tracked
 		 * by the child node. There's very rare race when driver module
@@ -951,15 +939,41 @@ static void update_or_add_parent(struct udev *udev,
 		 * only udev_device_new*() will scan sys directory and
 		 * return fresh udev device.
 		 */
-		parent_dev = udev_device_new_from_syspath(udev, syspath);
-		parent_idev = igt_device_new_from_udev(parent_dev, limit_attrs);
-		udev_device_unref(parent_dev);
+		dev = udev_device_new_from_syspath(udev, syspath);
+		idev = igt_device_new_from_udev(dev, limit_attrs);
+		udev_device_unref(dev);
 
-		if (parent_idev)
-			igt_list_add_tail(&parent_idev->link, &igt_devs.all);
+		if (idev)
+			igt_list_add_tail(&idev->link, &igt_devs.all);
 		else
 			usleep(100000); /* arbitrary, 100ms should be enough */
 	}
+
+	return idev;
+}
+
+/*
+ * For each drm igt_device add or update its parent igt_device to the array.
+ * As card/render drm devices mostly have same parent (vkms is an exception)
+ * link to it and update corresponding drm_card / drm_render fields.
+ */
+static void update_or_add_parent(struct udev *udev,
+				 struct udev_device *dev,
+				 struct igt_device *idev,
+				 bool limit_attrs)
+{
+	struct udev_device *parent_dev;
+	struct igt_device *parent_idev;
+	const char *devname;
+
+	/*
+	 * Get parent for drm node. It caches parent in udev device
+	 * and will be destroyed along with the node.
+	 */
+	parent_dev = udev_device_get_parent(dev);
+	igt_assert(parent_dev);
+
+	parent_idev = find_or_add_igt_device(udev, parent_dev, limit_attrs);
 	igt_assert(parent_idev);
 
 	devname = udev_device_get_devnode(dev);
-- 
2.52.0

