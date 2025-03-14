Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2339C282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D22D10E98F;
	Fri, 14 Mar 2025 07:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eXm7FSCR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8505710E990
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937949; x=1773473949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3umQGvCbJYGLrdc3ovPqAwX+IPIAufYU0hP9//Jyht0=;
 b=eXm7FSCRMuHH1V8NOFGFLG626iwYFpIob0cKYo91MJOgLwdHJL7iMnRO
 kWthyHb9Ugak4KC9w9c+Wu/T7t6HU4neWGzuaLBTsZzoKexEZphramnQo
 AwIBRIpdZqw2WUmdpePCF3/i5YsrU0Qey2docsyG4JkP5rgfhqhEN9ypb
 AE4wJ/WZmIKX6WWZZZevFFwe/ZQc0LsQtQfzqHE5xfWwVRcqavWyQeU/D
 roxJrFOumY+VmD78nQ/SCOErPWYgym6tTp8lYPx0bAtN236ObnGcrMKqw
 PQ/QekN+pFjE0MA6a6/Wojs0z02zlSTMqu5iQ1zw6zSqIo+AwG8Ez7bYy w==;
X-CSE-ConnectionGUID: UHP+iNZfTgG3o/0b5tBM8g==
X-CSE-MsgGUID: D9GE7GWoQey2Vb2bkG0ktg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68446166"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68446166"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:39:08 -0700
X-CSE-ConnectionGUID: ffCWxW9fSAuU3aXEnSdw5w==
X-CSE-MsgGUID: QQeQ8St+QW+TW1WNA2XfUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043921"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:39:06 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 28/29] drm/xe/bo: Add attributes field to xe_bo
Date: Fri, 14 Mar 2025 13:32:25 +0530
Message-Id: <20250314080226.2059819-29-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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

A single BO can be linked to multiple VMAs, making VMA attributes
insufficient for determining the placement and PTE update attributes
of the BO. To address this, an attributes field has been added to the
BO.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 15a92e3d4898..bac21a4f6805 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -58,6 +58,11 @@ struct xe_bo {
 	 */
 	struct list_head client_link;
 #endif
+	/** @attr: User controlled attributes for bo */
+	struct {
+		/** @atomic_access: type of atomic access bo needs */
+		u32 atomic_access;
+	} attr;
 	/**
 	 * @pxp_key_instance: PXP key instance this BO was created against. A
 	 * 0 in this variable indicates that the BO does not use PXP encryption.
-- 
2.34.1

