Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D71CCAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 15:27:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BCA10E765;
	Wed, 24 Sep 2025 15:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTdX6MWp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78DC10E765
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 15:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758727649; x=1790263649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g245gQ0+gknQhjQpwOe+IsBo3sk9pqNbiS2A07FyhnE=;
 b=DTdX6MWpIVvwtLHJedfb4wSNJR4g+QoGhgbSbMu1sB2r1Cdgxww9zKwd
 4V9F4p7KDp6t20zaCUF9AQpvSJriG0RF/INDmOeDYM0Rr5e3rcazVKitR
 8nSZP/oBVMyHNG8vm79ZBnZ4zvQ2eWE0s1eVxyQoFOAK+hG5XJy7MvzGP
 v9Ozs1nnSvI63aVz7oqx+EVuhK30k8ZmlwJR3AtRUUbbYxBO0+AgukQ95
 yDW4H/NyTERY+ddOyvcCTrdIcFpv2WNN05ufrPhPoQCmBQBBja3z/04FI
 aHHw/mLWmFjKm5sgz4aiPE6k/GjvBpSMJBLIxxEpTqCD70QY13pvNT0LS w==;
X-CSE-ConnectionGUID: bDR8uE8xQIGuWbwDjJ7kog==
X-CSE-MsgGUID: Td6zK3CDT723Z9zuvWwr7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60953160"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="60953160"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 08:27:29 -0700
X-CSE-ConnectionGUID: WqhiLTM+R02SiH/6zlyfRw==
X-CSE-MsgGUID: 19BYx9zTQ5OckkbB9ZotRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="176988623"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 08:27:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Raag Jadav <raag.jadav@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 2/2] drm/xe/configfs: Improve doc for ctx_restore*
 attributes
Date: Wed, 24 Sep 2025 08:27:11 -0700
Message-ID: <20250924152709.659483-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250924152709.659483-3-lucas.demarchi@intel.com>
References: <20250924152709.659483-3-lucas.demarchi@intel.com>
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

Spell out the syntax instead of only using examples. Particularly
important the <engine-class> part since that's different than
engines_allowed and may confuse users. The same batch buffer is used for
all engines of a certain class.

Cc: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index beade13efbae7..1396634231857 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -126,8 +126,20 @@
  * not intended for normal execution and will taint the kernel with TAINT_TEST
  * when used.
  *
- * Currently this is implemented only for post and mid context restore.
- * Examples:
+ * The syntax allows to pass straight instructions to be executed by the engine
+ * in a batch buffer or set specific registers.
+ *
+ * #. Generic instruction::
+ *
+ *	<engine-class> cmd <instr> [[dword0] [dword1] [...]]
+ *
+ * #. Simple register setting::
+ *
+ *	<engine-class> reg <address> <value>
+ *
+ * Commands are saved per engine class: all instances of that class will execute
+ * those commands during context switch. The instruction, dword arguments,
+ * addresses and values are in hex format like in the examples below.
  *
  * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 after the
  *    normal context restore::
@@ -154,7 +166,8 @@
  *       When using multiple lines, make sure to use a command that is
  *       implemented with a single write syscall, like HEREDOC.
  *
- * These attributes can only be set before binding to the device.
+ * Currently this is implemented only for post and mid context restore and
+ * these attributes can only be set before binding to the device.
  *
  * Remove devices
  * ==============
-- 
2.50.1

