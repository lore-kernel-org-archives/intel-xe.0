Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF97D49230
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 14:14:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BDA10E811;
	Fri, 12 Dec 2025 14:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cIh6MHdk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD8F10E835;
 Fri, 12 Dec 2025 14:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765548878; x=1797084878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BG/5bTMjrBvfL1rBypZa3+9huG0aMGzeVEuFBgGcBxs=;
 b=cIh6MHdkB2Rq7qCcgdjeA5nraPozMKB5o9anLXkGF9QYaD3yT9PPd3TW
 WmMNJO7k7lkhyM36l7RHAEu5Gd+hNcPrwiC6hjAFkiNdCULLCFetaS++8
 VvyOZufarvlLuKfIECt1d0YBSt0BE0XjNYkdKyG6FSPM0lFqHG+cu4IbI
 D/13vnKVF+BYTG1XnsfjkJ6OVTf7oohd8l3fytIuG1eZFObubqUew7jg1
 TyHb7vZYK2ikNf1wHpUbgMA1rH4RDQReFuGzKRNfoRfRfRnjozFB7CpN7
 uSCeDkfX0OyUqDgKSzTSBiR4gfZ55sKMPlzy5bmDlz9EI+UAH/VGlirnv g==;
X-CSE-ConnectionGUID: O4DhRTTnQPi+ujXpssCtYw==
X-CSE-MsgGUID: L/A6J/ghSnCuCYNxfFsryg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71396201"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="71396201"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 06:14:38 -0800
X-CSE-ConnectionGUID: TIQ4aCcxRnengS+HBc4gvQ==
X-CSE-MsgGUID: V4KsgNmFTFye7ayJy57sUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="196708808"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.39])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 06:14:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH 2/6] drm/intel: group individual funcs in parent interface
Date: Fri, 12 Dec 2025 16:14:05 +0200
Message-ID: <4305b09a93ce2c8ca83bf1fbb3cc7ef5a29d1567.1765548786.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765548786.git.jani.nikula@intel.com>
References: <cover.1765548786.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

There are a handful of function pointers that don't really warrant a
dedicated sub-struct for the functionality. Group all of them together
in a single anonymous sub-struct.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

'git show -w' is easy to review
---
 include/drm/intel/display_parent_interface.h | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index 87e26ee0ecbf..5d4b9dc837d9 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -103,17 +103,20 @@ struct intel_display_parent_interface {
 	/** @stolen: Stolen memory. */
 	const struct intel_display_stolen_interface *stolen;
 
-	/** @vgpu_active: Is vGPU active? Optional. */
-	bool (*vgpu_active)(struct drm_device *drm);
+	/* Generic independent functions */
+	struct {
+		/** @vgpu_active: Is vGPU active? Optional. */
+		bool (*vgpu_active)(struct drm_device *drm);
 
-	/** @has_fenced_regions: Support legacy fencing? Optional. */
-	bool (*has_fenced_regions)(struct drm_device *drm);
+		/** @has_fenced_regions: Support legacy fencing? Optional. */
+		bool (*has_fenced_regions)(struct drm_device *drm);
 
-	/** @fence_priority_display: Set display priority. Optional. */
-	void (*fence_priority_display)(struct dma_fence *fence);
+		/** @fence_priority_display: Set display priority. Optional. */
+		void (*fence_priority_display)(struct dma_fence *fence);
 
-	/** @has_auxccs: Are AuxCCS formats supported by the parent. Optional. */
-	bool (*has_auxccs)(struct drm_device *drm);
+		/** @has_auxccs: Are AuxCCS formats supported by the parent. Optional. */
+		bool (*has_auxccs)(struct drm_device *drm);
+	};
 };
 
 #endif
-- 
2.47.3

