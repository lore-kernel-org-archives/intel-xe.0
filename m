Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324EBD2F00B
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 12:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D3110E570;
	Tue, 27 Jan 2026 12:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSelew4q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121B110E55C;
 Tue, 27 Jan 2026 12:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769517712; x=1801053712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OMPdjgXhPlPKSH6VVMOU+eeg5IryEsT28fM/q5uFkdQ=;
 b=kSelew4qy8WUDPB2GoRBWmkDcMeULm5ZJsrzyciDAbIfvye9WOrI27kK
 w5C9EfPFxByN/8qDHGcWX5Es1M9O2L+8oyRoy66qRjB2DsPSdocxkSg0u
 MdCj/lSdrwFpWzavLLXk/K8/r/JGnicn545ayZu6vyetvFA2NmkUiRu1T
 v0FjcY/pEJqvXuvkitryIMuXP+OFMAWoVntR4ZbrK6IjfKXtEhA0r14Jr
 bBTpa1KGJ+AmvEiym4xNq6JVPwhh2Q9ElSt2UXd9cphGip8QaFBRgrF7/
 EetNy0pQ5GPhZvZAx6oI5kUlQ89n68PN7Cw/64KIZOZ2cWCSe4KCMlOMB A==;
X-CSE-ConnectionGUID: oJhwr+wQTZmogHnIxc2SEg==
X-CSE-MsgGUID: EPn8sP43SYG50le8tlw8UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70767663"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70767663"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 04:41:52 -0800
X-CSE-ConnectionGUID: JKfumJPFTqKzDgMG+4PrNg==
X-CSE-MsgGUID: dP4OYXDFSs+EdinaYqEWsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="239231245"
Received: from ettammin-desk.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.134])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 04:41:50 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v11 10/11] drm/i915/display: Add
 HAS_PSR_TRANS_PUSH_FRAME_CHANGE macro
Date: Tue, 27 Jan 2026 14:41:19 +0200
Message-ID: <20260127124120.1069026-11-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127124120.1069026-1-jouni.hogander@intel.com>
References: <20260127124120.1069026-1-jouni.hogander@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add a macro indicating that the platform supports triggering a Frame
Change event for the PSR HW using the TRANS PUSH mechanism.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 6c74d6b0cc48..13558bc648ab 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -196,6 +196,7 @@ struct intel_display_platforms {
 #define HAS_PSR(__display)		(DISPLAY_INFO(__display)->has_psr)
 #define HAS_PSR_HW_TRACKING(__display)	(DISPLAY_INFO(__display)->has_psr_hw_tracking)
 #define HAS_PSR2_SEL_FETCH(__display)	(DISPLAY_VER(__display) >= 12)
+#define HAS_PSR_TRANS_PUSH_FRAME_CHANGE(__display)	(DISPLAY_VER(__display) >= 20)
 #define HAS_SAGV(__display)		(DISPLAY_VER(__display) >= 9 && \
 					 !(__display)->platform.broxton && !(__display)->platform.geminilake)
 #define HAS_TRANSCODER(__display, trans)	((DISPLAY_RUNTIME_INFO(__display)->cpu_transcoder_mask & \
-- 
2.43.0

