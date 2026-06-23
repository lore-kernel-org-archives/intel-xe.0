Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86044CDB470
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 20:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CB610EC93;
	Tue, 23 Jun 2026 20:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ov1MT9/c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A4010EC8E
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jun 2026 20:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782246060; x=1813782060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ObHa+CKKCJ5pI4SGqwkGQZlPbdi6mey9UdKl/WyzJIs=;
 b=Ov1MT9/csgy425YmVfs5b6MlTyvf56RvDMWRqpjuh9xEkf1STKGOYDz8
 w2vhvSi3+qMExd/WVzi8LW7sPw/E+yg+0R7Qs5VQmqN4OH6yMc20PYV3N
 oFwyPBgvvvA37QP/wOvncjgevHy6qovRtgyoPdE0dxF7KLIWBauXqPbSQ
 cI4QsirO+hrinVa9hAsMCQYyByIY6pA28s/c2FH27myyX+0eD51NCBPPc
 bgu+ljweiiW3SopEl+qFj+idWWLuUhxHgIFV5qsS2v0WVn44sQBPucP85
 uReVuXi+O892LRVVBlTg34Z33GN/eNu3g3DkfvQ41OVAhfIoukrea2mUJ Q==;
X-CSE-ConnectionGUID: +5P6Spp4S2esrnvBGHxhSA==
X-CSE-MsgGUID: tVJqvmPdTS2uqK0Eay2k0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83001309"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="83001309"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 13:21:00 -0700
X-CSE-ConnectionGUID: ZrT3uiw3SfWxGhsEJnch0Q==
X-CSE-MsgGUID: 65WP9R+ARf+E47IhFCJCoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="273308618"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 13:20:58 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 michal.wajdeczko@intel.com, raag.jadav@intel.com,
 andi.shyti@linux.intel.com, jani.nikula@intel.com
Subject: [PATCH v5 1/4] drm/xe/printk: Add xe_warn_once()
Date: Wed, 24 Jun 2026 04:20:50 +0800
Message-ID: <20260623202053.1023598-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623202053.1023598-1-jonathan.cavitt@intel.com>
References: <20260623202053.1023598-1-jonathan.cavitt@intel.com>
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

Create a wrapper function xe_warn_once() that calls drm_warn_once().

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_printk.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
index c5be2385aa95..afa787fcdeb6 100644
--- a/drivers/gpu/drm/xe/xe_printk.h
+++ b/drivers/gpu/drm/xe/xe_printk.h
@@ -27,6 +27,9 @@
 #define xe_warn(_xe, _fmt, ...) \
 	xe_printk((_xe), warn, _fmt, ##__VA_ARGS__)
 
+#define xe_warn_once(_xe, _fmt, ...) \
+	xe_printk((_xe), warn_once, _fmt, ##__VA_ARGS__)
+
 #define xe_notice(_xe, _fmt, ...) \
 	xe_printk((_xe), notice, _fmt, ##__VA_ARGS__)
 
-- 
2.53.0

