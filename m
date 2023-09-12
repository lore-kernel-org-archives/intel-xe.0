Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600A8CA0ECF
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 13:13:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C0A10E24E;
	Tue, 12 Sep 2023 13:13:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38EC10E24E
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 13:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694524396; x=1726060396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nJXlvOEO+czS205YyxCyTKdJGR4h9EWvKCOOlBcmerk=;
 b=J263f2A+SPUE4dY8t5lEVpj88lErK8RzfC9dLb2kuxYtsY304NJOytoM
 0tVohKPxeWaL3jCdgxCfjtqOemaL9gGAzzsYREyb/IjVCvJtyg73YHMBU
 k/m+AwInKXbZs4GMl9zYkbzQtjxcA0nMHd9tsmAgj4dqzu+uU8AQrXWM7
 HzjK1opEfizpbNCNDqcutQ94GulIUk16w4Cm6MvNEXsxCrxmHjYe1G4xL
 l6Z+jwv4hNyTIxGTHe3yjrCyv4g2DZirNnIQCECFluI0NggETZOD2pv43
 6YW45XC0frs6NRPMRnT8ioQ/KK6GoEnqG1HB8H8Yxuk/u4ixnZc9e5Ro0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="464740086"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="464740086"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 06:13:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="737116342"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="737116342"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 06:13:13 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Tue, 12 Sep 2023 16:08:32 +0300
Message-Id: <20230912130835.2488728-2-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912130835.2488728-1-alexander.usyskin@intel.com>
References: <20230912130835.2488728-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm/xe/gsc: add HECI2 register offsets
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
Cc: linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Vitaly Lubart <vitaly.lubart@intel.com>

Add HECI2 register offsets for DG1 and DG2 to regs/xe_regs.h

Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 77aa3dab321a..5d9380f307cc 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -33,6 +33,10 @@
 #define XEHPC_BCS6_RING_BASE			0x3ea000
 #define XEHPC_BCS7_RING_BASE			0x3ec000
 #define XEHPC_BCS8_RING_BASE			0x3ee000
+
+#define DG1_GSC_HECI2_BASE                      0x00259000
+#define DG2_GSC_HECI2_BASE                      0x00374000
+
 #define GSCCS_RING_BASE				0x11a000
 #define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
 #define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
-- 
2.34.1

