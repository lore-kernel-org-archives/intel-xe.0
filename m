Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C4EC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BD910E9FE;
	Fri,  3 Nov 2023 14:35:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F80B10E9F9
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022114; x=1730558114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cMdc/M9r5a5xHpj66moauvhFT6bjadsnIBfQJR4Jcqc=;
 b=UsNJzWy2IYf8SaIBdz4mGSeW9oqlHg6I6YIGE3EWAtKm9sMkevU/RTIf
 NCVhsjyOfjeDxsswf5lVjEryUdtfqNo/fRchmeOtKEvQGnSdDn/WrDeE5
 PEFkq9iETuCznz2/BThH0iSzgZGzFLTisshY+00xySgGb0q5DjGSoY4rE
 CEQ+0EIxcH/f/pCBwFX9PzGT4e/UIG7Sji1vy16nMDSH/wlRWb7V9gfNH
 gwh4+/velNjbeA5ld1gMR+lxPigr+EGbOS3r6gqdvvJBgRQXqedzcRq38
 ccK1st76fOVyjmv8groo7gYPMjdcqYdioraasC/y7Tr1qC2/xeHptQdA5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843334"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843334"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832402"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832402"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:12 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:09 +0000
Message-Id: <20231103143456.7-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 03/50] drm/xe: Extend drm_xe_vm_bind_op
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
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Mika Kuoppala <mika.kuoppala@linux.intel.com>

The bind api is extensible but for a single bind op, there
is not a mechanism to extend. Add extensions field to
struct drm_xe_vm_bind_op.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 include/uapi/drm/xe_drm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0b1482d5f709..edbc58a4769c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -656,6 +656,9 @@ struct drm_xe_vm_destroy {
 };
 
 struct drm_xe_vm_bind_op {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
 	/**
 	 * @obj: GEM object to operate on, MBZ for MAP_USERPTR, MBZ for UNMAP
 	 */
-- 
2.34.1

