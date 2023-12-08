Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65507C10DCE
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 07:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4C810E9F6;
	Fri,  8 Dec 2023 07:56:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1757510E9F6
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702022203; x=1733558203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1x+rKeGoBJBurco9VeBiCLA0OyoxgKU+UYGG56Mvt9Q=;
 b=VMOaVZsudnWjh7z60e/BjJrWS0n8jt2YWDXQEwCiL8BZ7Snr+MdpGlEk
 t/mjKpbAxGtCTqejWZIG2qORnsae8ezcLup8/uZvC3zrc/1MtO8HAAl54
 pPNsEybDFubUtGc0ioAXmi2Rgc2Wqj9uSGRtsDUFpwAAzKNbKmS9Peof3
 Ya+WcMeSwNEBHQ+3YIBa7pKhIzVQOVGwRH9utAT2k+/W6Lh55Il03tVIV
 B3EcXjXOZ9SDPd1FjhNgHKCJKFNB+UICz24bi67a45W+ektNz148cIvAp
 FYxyPnvdqCY/RfMd5G4tefEd8QWacpwKCIs+v8lZG4ljtQ7il65WMMiwh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="391542412"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="391542412"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 23:56:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="838044732"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="838044732"
Received: from cannonro-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.63.126])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 23:56:41 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 5/9] fixup! drm/xe/display: Implement display support
Date: Fri,  8 Dec 2023 09:56:06 +0200
Message-Id: <20231208075610.3005795-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208075610.3005795-1-jouni.hogander@intel.com>
References: <20231208075610.3005795-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add emtpy compat-i915-headers/gem/i915_gem_lmem.h to get rid of ifdefs from
intel_display.c.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
new file mode 100644
index 000000000000..710cecca972d
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
@@ -0,0 +1 @@
+/* Empty */
-- 
2.34.1

