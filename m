Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B5FC83F2C
	for <intel-xe@archiver.kernel.org>; Mon,  4 Sep 2023 14:49:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9479210E375;
	Mon,  4 Sep 2023 14:49:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDB910E375
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Sep 2023 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693838939; x=1725374939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=46QLcKH0w7oXFE+pIqXIr8hzBnUIJLBy3u3CAnCNWI4=;
 b=XebOzh1cDwn7Ig75fKghly7sl0pczWnOU8cm5gaI6i54dEJO5TXmLX2e
 x24yAp5mMS+MdWTEw7Zo/NzfrqhHHsr7Dw41Nat0Ssq8g2vC+flU4AKjw
 v4BgApeNDFyBpiZGa4p9/+3VHf13nP1Lp0/f5nTOMceVh283vrn70ccfF
 4WtSqGR/KIZtSori0381Th6vBKlVMtjpd6dPdRJ8TjvE38AkFseIQfeAn
 2tXoiGzhsnINbcGXRPe8L+937goauORmROf4aJvMoEL8X2mSQxPvN1uiu
 JgWqc6UMPa5ymNRCxrRjds2lkXaH9y9xUQv2WuEft0nsFyhXxQp0nAFCf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="440573871"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="440573871"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 07:48:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="717576901"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="717576901"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 07:48:56 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  4 Sep 2023 17:46:44 +0300
Message-Id: <20230904144644.3259148-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230904123605.3255946-1-mika.kuoppala@linux.intel.com>
References: <20230904123605.3255946-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Extend drm_xe_vm_bind_op
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

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
index 86f16d50e9cc..5c6c86f5e5fc 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -552,6 +552,9 @@ struct drm_xe_vm_destroy {
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

