Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2907EC27C65
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 18:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1E710E1A3;
	Tue, 11 Jun 2024 18:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmVj5FFh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CAD10E1A3
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 18:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718129269; x=1749665269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EsMgTseSFZUaX7lFrlQPCmMzt+WHCqLB1CVmLBx3TZ4=;
 b=MmVj5FFhkF0vNWAg/6XjPxovlNNg8AEp0TbzjHrCwIMcc4c9k/MPb3O1
 zRjIg1DfzQuq7vAwNJ1N+K7LnCGD/alMUBj0z9oAi06ERXQXDHlqtw8cC
 JYFnoHOigsdJXoBJ6UlOjhfIHC06RD6EiTB5H2ljbXzq/tA3TyXOV8IpW
 BLw//ABs2xFMsUYke/CRMbiWPrHQxfgW45ZBoHAxOkW0F60qHz4QQq5rg
 8L/VeZnUoZQ+rajdzWn4bBmwvvsGFvRhPXUUs1Fdm2WQT+AxtEpkwyWsP
 V+fSXeQtbVcMGQA6OSG5e17rsMFYkReJi63Ge1MTrDDewjlJaWxaKtbq5 w==;
X-CSE-ConnectionGUID: QtoibIc9SGmRavfgvzLLsg==
X-CSE-MsgGUID: sGih5QljTemqsSJ8OciOXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="32398375"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32398375"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 11:07:48 -0700
X-CSE-ConnectionGUID: +PJqB66xSpW5NKOMWXOOPQ==
X-CSE-MsgGUID: wxrlpaCUTZuNjzO73GDq5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39620415"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.185])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 11:07:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/4] drm/xe/guc: Fixup GuC KLV ABI kernel-doc annotations
Date: Tue, 11 Jun 2024 20:07:32 +0200
Message-Id: <20240611180735.1988-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240611180735.1988-1-michal.wajdeczko@intel.com>
References: <20240611180735.1988-1-michal.wajdeczko@intel.com>
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

The kernel-doc for few KLV was malformed:

 guc_klvs_abi.h:70: WARNING: Inline target start-string without end-string.
 guc_klvs_abi.h:74: WARNING: Inline target start-string without end-string.
 guc_klvs_abi.h:78: WARNING: Inline target start-string without end-string.

or it was just unrecognized at all.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 8f9f60b28306..a0b80c9fc5ef 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -66,23 +66,23 @@
  *      Refers to 64 bit Global Gfx address of H2G `CT Buffer`_.
  *      Should be above WOPCM address but below APIC base address for native mode.
  *
- * _`GUC_KLV_SELF_CFG_H2G_CTB_DESCRIPTOR_ADDR : 0x0903
+ * _`GUC_KLV_SELF_CFG_H2G_CTB_DESCRIPTOR_ADDR` : 0x0903
  *      Refers to 64 bit Global Gfx address of H2G `CTB Descriptor`_.
  *      Should be above WOPCM address but below APIC base address for native mode.
  *
- * _`GUC_KLV_SELF_CFG_H2G_CTB_SIZE : 0x0904
+ * _`GUC_KLV_SELF_CFG_H2G_CTB_SIZE` : 0x0904
  *      Refers to size of H2G `CT Buffer`_ in bytes.
  *      Should be a multiple of 4K.
  *
- * _`GUC_KLV_SELF_CFG_G2H_CTB_ADDR : 0x0905
+ * _`GUC_KLV_SELF_CFG_G2H_CTB_ADDR` : 0x0905
  *      Refers to 64 bit Global Gfx address of G2H `CT Buffer`_.
  *      Should be above WOPCM address but below APIC base address for native mode.
  *
- * _GUC_KLV_SELF_CFG_G2H_CTB_DESCRIPTOR_ADDR : 0x0906
+ * _`GUC_KLV_SELF_CFG_G2H_CTB_DESCRIPTOR_ADDR` : 0x0906
  *      Refers to 64 bit Global Gfx address of G2H `CTB Descriptor`_.
  *      Should be above WOPCM address but below APIC base address for native mode.
  *
- * _GUC_KLV_SELF_CFG_G2H_CTB_SIZE : 0x0907
+ * _`GUC_KLV_SELF_CFG_G2H_CTB_SIZE` : 0x0907
  *      Refers to size of G2H `CT Buffer`_ in bytes.
  *      Should be a multiple of 4K.
  */
@@ -114,7 +114,7 @@
 /*
  * Per context scheduling policy update keys.
  */
-enum  {
+enum {
 	GUC_CONTEXT_POLICIES_KLV_ID_EXECUTION_QUANTUM			= 0x2001,
 	GUC_CONTEXT_POLICIES_KLV_ID_PREEMPTION_TIMEOUT			= 0x2002,
 	GUC_CONTEXT_POLICIES_KLV_ID_SCHEDULING_PRIORITY			= 0x2003,
-- 
2.43.0

