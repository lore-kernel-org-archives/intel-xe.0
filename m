Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBAEC46CA2
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 15:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A256A10EA43;
	Fri, 15 Dec 2023 15:46:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399C610EA5A
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 15:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702655191; x=1734191191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uv2V1PElimHs6ZiOIAaXTrnmTI18Hw1j1KfjYKH40GI=;
 b=m/Ptf3VlkpbKcOqKl07XvjD7bA6xolD5cQM7w62dP6tQVfiePNoiMDpW
 vch9ePw0utah5qaN451iZz0iIm6HYFf6w9mZ4sdmC1hCI6Uik7xunsKCp
 GK5WTV9/aBd79CxRmSY7Zv8KdpWDQZNLxBeEWALjGyUGU7LyHLVetOR9k
 0C6y1q5DhAD3i+hnKDgX1gDmk1XT7z8LthqKMZILMc0lRs/0JckJdAysT
 bjXupvszfF8RccKL0m4+JX1dV6rpEe/e4VWzTAGgCMVd2FJ/f5wjfcXfk
 ZdjfZ0R7ZohBD39HBQH25fFKMxHlT4xm/sOhhIuZKc6i+lW+G9q9iqZFV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2141878"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2141878"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="16324575"
Received: from sdiolatz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.48.85])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:30 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 19/21] drm/xe/uapi: Move CPU_CACHING defines before doc
Date: Fri, 15 Dec 2023 15:45:51 +0000
Message-Id: <20231215154553.7-20-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215154553.7-1-francois.dugast@intel.com>
References: <20231215154553.7-1-francois.dugast@intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Move those defines to align on the rule used elsewhere in the file which
was introduced by commit ("drm/xe: Move defines before relevant fields").

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 5240653eeefd..8a69abea0725 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -733,12 +733,12 @@ struct drm_xe_gem_create {
 	 */
 	__u32 handle;
 
+#define DRM_XE_GEM_CPU_CACHING_WB                      1
+#define DRM_XE_GEM_CPU_CACHING_WC                      2
 	/**
 	 * @cpu_caching: The CPU caching mode to select for this object. If
 	 * mmaping the object the mode selected here will also be used.
 	 */
-#define DRM_XE_GEM_CPU_CACHING_WB                      1
-#define DRM_XE_GEM_CPU_CACHING_WC                      2
 	__u16 cpu_caching;
 	/** @pad: MBZ */
 	__u16 pad[3];
-- 
2.34.1

