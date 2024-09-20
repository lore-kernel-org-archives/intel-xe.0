Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153B2C7882C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 11:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E2C10E80C;
	Fri, 20 Sep 2024 11:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKd8ODWP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35FB10E80C;
 Fri, 20 Sep 2024 11:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726833450; x=1758369450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P0wHK31cQmKpsXyDEZY0M10jhNDa69aQWnc3CNrcCsQ=;
 b=oKd8ODWPrmBS9RW6MUp2PNOvP4JgkHJDYz5p8GS89l6WxGMMWEYOzwfm
 b86Vao7mqKe/rVtatgI+DI4j9oExZUQNgvvLTEw5XyrRr60t4yn05RlHd
 PfQf08jQMmXa1RiRXYwsFwYjsptPndqsEnBEm5FdyP2hbxRKR3Mg94lP8
 +GhdqXETZEmh14DMM7ocj+ZPHPYmbaY/VFai72ssRBQEJzlP1M+1UMzbW
 YXkhAJG61JNMBoPk8vF0hGoje4kZoYDYTpyCg2LmZi9qN6/PQz/Xi29PE
 ktB32XVE/gP+FLPls4yjeHBAc0Ghyk4Zgerx6r7HL/g5ey3U3sEyB9Lda g==;
X-CSE-ConnectionGUID: HJoa5bMeTf6DVTIKhStU7g==
X-CSE-MsgGUID: ur7LNYFzTlG1UEBfGv6l6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25984574"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="25984574"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 04:57:30 -0700
X-CSE-ConnectionGUID: +LomJwFxTwexs86xmSuYPw==
X-CSE-MsgGUID: KSupeQxhTEiPS/0ZYPFzGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70519171"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.155])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 04:57:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 6/9] drm/i915/dp: fix style issues in DP test debugfs
Date: Fri, 20 Sep 2024 14:56:48 +0300
Message-Id: <733dc8f648498a534811adf1cf079b3f4cbbf8f5.1726833193.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1726833193.git.jani.nikula@intel.com>
References: <cover.1726833193.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Apply some style fixes on top of the previous code movement.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_test.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_test.c b/drivers/gpu/drm/i915/display/intel_dp_test.c
index 7a9b0ad161d6..f086f6854bf0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_test.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_test.c
@@ -594,8 +594,9 @@ static int i915_displayport_test_active_show(struct seq_file *m, void *data)
 				seq_puts(m, "1");
 			else
 				seq_puts(m, "0");
-		} else
+		} else {
 			seq_puts(m, "0");
+		}
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
@@ -662,8 +663,9 @@ static int i915_displayport_test_data_show(struct seq_file *m, void *data)
 				seq_printf(m, "level: %02x\n",
 					   intel_dp->train_set[0]);
 			}
-		} else
+		} else {
 			seq_puts(m, "0");
+		}
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
@@ -693,8 +695,9 @@ static int i915_displayport_test_type_show(struct seq_file *m, void *data)
 		if (encoder && connector->status == connector_status_connected) {
 			intel_dp = enc_to_intel_dp(encoder);
 			seq_printf(m, "%02lx\n", intel_dp->compliance.test_type);
-		} else
+		} else {
 			seq_puts(m, "0");
+		}
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
-- 
2.39.2

