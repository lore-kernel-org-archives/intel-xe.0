Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C823CD3F095
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 16:11:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E6610E738;
	Wed, 28 Jan 2026 16:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UI0uCYww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7E010E735;
 Wed, 28 Jan 2026 16:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769616666; x=1801152666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=64j++wGIQCKUBk2lHDmZEs08gnuA8/UnWy6G0WGPs/U=;
 b=UI0uCYww0RulANW/uypsdpKF8S81+ZAJzFFQxpBf9iax+m4QU2GXnxz7
 9WGdxyhtJ3X9kI0IYk9AdZ9fa1yTzfa1hqttXl+MTWl50/KmeSxOvQITD
 vOXcqvKvy4dJiOafnuDt63lbOQnMV6EbzQJ1Tr/h8Cj5mCKFwcGLgcKQG
 hyVcSkp5XTuk9WWOeAfKyYmWBFCeGiLDgWApGgHUZLEsinujUh533+8sk
 bDUHiNN5lrgIYXEjhJ6Y4Pe5jkPJtdJizGneCqOb2EP0/Dh3QkykW5P3H
 nqqEITYDjg6x+SOob/dQadkEmV2aYpbbPuOBJpraAqVl3wgXN/tiLd2j1 A==;
X-CSE-ConnectionGUID: gKDeD3GbS3O3m2nedM/xug==
X-CSE-MsgGUID: rb2+NRUnSUSedXswHdSMOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82262425"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="82262425"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:11:06 -0800
X-CSE-ConnectionGUID: u8dBO8X1TAC3aUpx+8ntgA==
X-CSE-MsgGUID: c8nwZk7AQEiLOHSfvqZGLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208546962"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.210])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:11:02 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v3 2/6] lib/igt_device_scan: Split out reusable part of
 update_or_add_parent
Date: Wed, 28 Jan 2026 17:09:00 +0100
Message-ID: <20260128161041.225652-10-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128161041.225652-8-janusz.krzysztofik@linux.intel.com>
References: <20260128161041.225652-8-janusz.krzysztofik@linux.intel.com>
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

