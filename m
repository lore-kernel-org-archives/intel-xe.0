Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CEFCAC58E
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 19:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB5010EB8D;
	Thu, 11 Sep 2025 19:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCyhcWm3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FAE10E166
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 19:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757619406; x=1789155406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=btGDrBWYSDdaJOzrejDnyeGuT2c4wWekYKX2SmAj0Mg=;
 b=hCyhcWm3FSaDBPyAPc926oFJhPvpHa5Jc+EjAWVJWP0braBXhXV/EZoy
 X/mLqjGyul3TX8suGi0zYm3P/LItPLgMhAknrH8MsMWi3yIiwgXhi+RD5
 u8NxEC+AKO57F8LFEUQ3moIB4bXhXK/W/29QSsnfqsUTvYSPpdejE7kuj
 yzutCiWHuFuE6KWcG//SjJHIkPQVJt0Pmi2ciYytuOTBZ/UHWZZ+8sf1D
 /vrReQfoZbqpHe49EAgpOFJ9Byrak0PeWZjKmqwNeR0hKwK7TxFGldBXG
 fcYtgOm9O5klAFQ02rCNLz0ByjWXQWpEzDvqR6fP6n/jULcdfJIbI1m8g A==;
X-CSE-ConnectionGUID: YhHOtAbKRHGsnK+GksGxmQ==
X-CSE-MsgGUID: lOaCNC3PSNWUvhvaRRaQ9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="70582682"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="70582682"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 12:36:43 -0700
X-CSE-ConnectionGUID: 3r/uNhKyQze4SkmgftP3QA==
X-CSE-MsgGUID: JVdSGcyrQxWUfixxtSOUFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="204544711"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 12:36:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 2/6] drm/xe/configfs: Fix documentation warning
Date: Thu, 11 Sep 2025 12:36:26 -0700
Message-ID: <20250911-wa-bb-cmds-v4-2-c8f7e48f7eae@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911-wa-bb-cmds-v4-0-c8f7e48f7eae@intel.com>
References: <20250911-wa-bb-cmds-v4-0-c8f7e48f7eae@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

Fix this warning while building the documentation:

	Documentation/gpu/xe/xe_configfs:9: drivers/gpu/drm/xe/xe_configfs.c:138:
	WARNING: Definition list ends without a blank line; unexpected unindent.

That also makes it better formatted in the output.

While at it, also fix the underline length in "Overview".

Fixes: e2b33fce5eb0 ("drm/xe/configfs: Improve documentation steps")
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index e515fa7085fa4..e52808e3199fc 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -21,7 +21,7 @@
  * DOC: Xe Configfs
  *
  * Overview
- * =========
+ * ========
  *
  * Configfs is a filesystem-based manager of kernel objects. XE KMD registers a
  * configfs subsystem called ``xe`` that creates a directory in the mounted
@@ -34,7 +34,7 @@
  *
  * To create a device, the ``xe`` module should already be loaded, but some
  * attributes can only be set before binding the device. It can be accomplished
- * by blocking the driver autoprobe:
+ * by blocking the driver autoprobe::
  *
  *	# echo 0 > /sys/bus/pci/drivers_autoprobe
  *	# modprobe xe

-- 
2.50.1

