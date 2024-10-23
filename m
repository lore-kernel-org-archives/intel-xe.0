Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2DFD0BB47
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 23:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4527A10E874;
	Wed, 23 Oct 2024 23:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DErMAgEB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4823F10E872
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 23:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729725128; x=1761261128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IZ/tkaD+JR8sOcEOwk4Qf2NxnICqI/ZE0kDgXu/kJ6c=;
 b=DErMAgEBF9eDjN6LXRM+EWu24IJmU4H4Ud2lQIBuKWoOYD94DasWI0dc
 nmOVgn5CHj35TMiJZ+CjQWqowwhYqOEcA12M3PPuNP99HD1oCe85xubMn
 4Oz6j8lnEA/B5hKKkpe3MmH9Gn4mm9/EB9n7O2e/DOcZu6wYp/LVQuVdp
 fFrlDNWs3OwxC/rner0nHel0/rcJR3M8GhfmuOqY/rmZ2FtILXTn3joHH
 n2JhzP57ie6izAib+G9nWLHjNFgVs23bFgRhjU0xsGtgXuGLYxI87jVXJ
 0qLgflie4EaolHwkXmzcRvydTC28EGZlMSjDVLm9QFI7mssKIuASlchJn w==;
X-CSE-ConnectionGUID: idTu57WpQmyL4MV+FtW0NQ==
X-CSE-MsgGUID: I2H4ubL9T+uOHfwMVxquog==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="28775151"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="28775151"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 16:12:08 -0700
X-CSE-ConnectionGUID: XF8B4iCXQmeD6NFCAOJxqg==
X-CSE-MsgGUID: Y7vwarMQRbmuFxJg2M+C1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="111217969"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.97.255])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 16:12:06 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/5] drm/xe/guc: Add VF_CFG_SCHED_PRIORITY_KEY KLV definition
Date: Thu, 24 Oct 2024 01:11:48 +0200
Message-Id: <20241023231152.1815-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241023231152.1815-1-michal.wajdeczko@intel.com>
References: <20241023231152.1815-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This KLV allows to set the scheduling priority for each VF, also
for the PF.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 37606cf8cc5e..674f1afe38c8 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -291,6 +291,13 @@ enum  {
  *
  *      :0: (default)
  *      :1-65535: number of contexts (Gen12)
+ *
+ * _`GUC_KLV_VF_CFG_SCHED_PRIORITY` : 0x8A0C
+ *      This config controls VF’s scheduling priority.
+ *
+ *      :0: LOW = schedule VF only if it has active work (default)
+ *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
+ *      :2: HIGH = schedule VF in the next time-slice after current active time-slice completes
  */
 
 #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
@@ -343,6 +350,12 @@ enum  {
 #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY	0x8a0b
 #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_LEN	1u
 
+#define GUC_KLV_VF_CFG_SCHED_PRIORITY_KEY	0x8a0c
+#define GUC_KLV_VF_CFG_SCHED_PRIORITY_LEN	1u
+#define   GUC_SCHED_PRIORITY_LOW		0u
+#define   GUC_SCHED_PRIORITY_NORMAL		1u
+#define   GUC_SCHED_PRIORITY_HIGH		2u
+
 /*
  * Workaround keys:
  */
-- 
2.43.0

