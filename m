Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7A6C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 04:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4EE010E2A3;
	Thu, 10 Apr 2025 04:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eeDDXsSj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF9910E080
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 04:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744257908; x=1775793908;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4F0gaaSPMEw2wSdMJ5aK8tXqMpkfAgSclEy6U71kOCY=;
 b=eeDDXsSjHAA2dvzQqf+EXNVfBWRhIINgDL+pBYCwxRRmnF3zwB5Ove23
 /T4sG2sO0hbU9YGQS2vu2dcvX0GAPdpL21OnyxewWUTfEtIjl5+eUoPWd
 VEpZDWaBsLhE0BtE2LdTNtAddn6QwUhUJa5uNtwAubEOhu2KDxgfu2xiS
 riwUn/vxEv89t/5JI+KKtpQSLOyfJLBdhdlVg/9LVzwnfdYrURaEurb0x
 NuKn4jnNRqeMePe1VsmuMaiyKN3g1/bYKL/zm0PB5zyObz8OE/kpQTb53
 ZN/9iKi6U3ND0XEDmc7TIM3hBxFvXJ4HLiLOwTLTYDFDJmE1BD0lXGkMF g==;
X-CSE-ConnectionGUID: MoRU8lMhQrSGbbpXB7xCqQ==
X-CSE-MsgGUID: s+5o7TAuTx+oYvyDxvLSRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="44999852"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="44999852"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 21:05:07 -0700
X-CSE-ConnectionGUID: HfFmoCvVRd+6g2jFP9a8ew==
X-CSE-MsgGUID: ZPp0wkydQoCEEGHqN0SmKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="133642762"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 21:05:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 3/4] drm/print: Add drm_printer_is_full
Date: Wed,  9 Apr 2025 21:06:21 -0700
Message-Id: <20250410040622.238389-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410040622.238389-1-matthew.brost@intel.com>
References: <20250410040622.238389-1-matthew.brost@intel.com>
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

Add drm_printer_is_full which indicates if a drm printer's output is
full. Useful to short circuit coredump printing once printer's output is
full.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 include/drm/drm_print.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index f31eba1c7cab..db7517ee1b19 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -242,6 +242,23 @@ struct drm_print_iterator {
 	ssize_t offset;
 };
 
+/**
+ * drm_printer_is_full() - DRM printer output is full
+ * @p: DRM printer
+ *
+ * DRM printer output is full, useful to short circuit coredump printing once
+ * printer is full.
+ *
+ * RETURNS:
+ * True if DRM printer output buffer is full, False otherwise
+ */
+static inline bool drm_printer_is_full(struct drm_printer *p)
+{
+	struct drm_print_iterator *iterator = p->arg;
+
+	return !iterator->remain;
+}
+
 /**
  * drm_coredump_printer - construct a &drm_printer that can output to a buffer
  * from the read function for devcoredump
-- 
2.34.1

