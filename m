Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB0FCD6E7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 16:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540D710E50A;
	Fri,  5 Jun 2026 16:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N44RfYip";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1E110E50A;
 Fri,  5 Jun 2026 16:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780675492; x=1812211492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YJoH4wy2FNIp/6OWhXi1LXZ7wFdivtl7vckaf0V4ezY=;
 b=N44RfYipks8wY6FhVnap36MHZ0xb2Vc3pMHXINrcfNEkv0guttZFuF5l
 9DPaLmFYntEhXEcg0Gx+6aahcMyb08CbIlSkSnbZ2W4A8+1gLTCzCZvy6
 Q6DWbG2BaGewcGAtNC0Tf/hTmxdMlywzGcWkwp1EKQA1wQtV2AUyEjLyd
 /ddDLBv+cGvlBI9ywq3OFamhsFlkYkMSOA2VUz2lePzrYrF3zEeneDnJm
 3vnGyqZ/e3ZTvxThULZWVH0fwF8NfKM8q5beyEOcMwQftEkDUcfSXpJmf
 6mLP24KmaZnOh3w4oKjt7tu0Hn3/DID3zs+54/Qiqg3fuQGKPV9M93iar Q==;
X-CSE-ConnectionGUID: ks2hi6WHRjOZgl6ko4tVVA==
X-CSE-MsgGUID: duk+D11WTeC1xU6XRtACrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="98928770"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="98928770"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 09:04:51 -0700
X-CSE-ConnectionGUID: b3YODthpS0aKmzrsQm9iDA==
X-CSE-MsgGUID: 0XiUwW9GTH+U53fYJfRPiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="268566304"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 09:04:49 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 raag.jadav@intel.com
Subject: [PATCH 1/5] drm/xe/printk: Add xe_warn_once()
Date: Sat,  6 Jun 2026 00:04:40 +0800
Message-ID: <20260605160444.3833295-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605160444.3833295-1-jonathan.cavitt@intel.com>
References: <20260605160444.3833295-1-jonathan.cavitt@intel.com>
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

