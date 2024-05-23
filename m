Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCBAC25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 19:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A116810E18E;
	Thu, 23 May 2024 19:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVRR3DJH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF62210E1D8
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 19:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716492176; x=1748028176;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9F0zScWZr513HxekfFdbvrg4IhLoj0tLrRGg+r7PaNk=;
 b=KVRR3DJHhpawpCsT/6PDzjm5L7WJIRqSBp0VAww+tVtS+ENXd8JVlfeU
 v98yCtbmtB856tRZ5sB6fBe9DeXXW+VwY8FNr4og843jr0L1rxyCsDKGO
 vvJRp1LbqoPso2guxJpR2WQt5IwroIx6CZ0bDOnuzz5iinXifLjCISl2/
 YJwEmvEYuYDV7JE3e2cfAOhRs6a+bGY50w33h8suDno+aUPRCdd8Xsnm7
 IHuavFRJ0j7CHyXckubA0swMe4f/XL/y0Sphgk5hI59eOu1KLQFaXY9mE
 DWgcPfytbW6OjvE3TSH3z9eaXuwC92uw7A00vEoesh6dxuqSpb/rL5Sw1 A==;
X-CSE-ConnectionGUID: znggvCTFTlu45hQHIBE3HQ==
X-CSE-MsgGUID: VpcBCwCeTjm9uU1pqbSRsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13023474"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="13023474"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 12:22:54 -0700
X-CSE-ConnectionGUID: T0LNKZWJQI+BI6JWCmrVCQ==
X-CSE-MsgGUID: cDOto4UJQb6QSXip15u0dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33848847"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 12:22:53 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/6] drm/xe/guc: Add GLOBAL_CFG_GMD_ID KLV definition
Date: Thu, 23 May 2024 21:22:36 +0200
Message-Id: <20240523192240.844-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240523192240.844-1-michal.wajdeczko@intel.com>
References: <20240523192240.844-1-michal.wajdeczko@intel.com>
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

VF drivers can't access GMD_ID register over MMIO.
The value of the GMD_ID register must be queried from GuC.
It is available as GLOBAL_CFG_GMD_ID KLV.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 5c1d40432ca0..8f9f60b28306 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -35,6 +35,20 @@
 #define GUC_KLV_0_LEN				(0xffffu << 0)
 #define GUC_KLV_n_VALUE				(0xffffffffu << 0)
 
+/**
+ * DOC: GuC Global Config KLVs
+ *
+ * `GuC KLV`_ keys available for use with HOST2GUC_SELF_CFG_.
+ *
+ * _`GUC_KLV_GLOBAL_CFG_GMD_ID` : 0x3000
+ *      Refers to 32 bit architecture version as reported by the HW IP.
+ *      This key is supported on MTL+ platforms only.
+ *      Requires GuC ABI 1.2+.
+ */
+
+#define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY			0x3000u
+#define GUC_KLV_GLOBAL_CFG_GMD_ID_LEN			1u
+
 /**
  * DOC: GuC Self Config KLVs
  *
-- 
2.43.0

