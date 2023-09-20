Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52D7CE79AB
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 09:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC0810E474;
	Wed, 20 Sep 2023 09:46:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A328010E475
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 09:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695203174; x=1726739174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fPbsFBLao1m6KO+ew1b44zTXvTcP/hWch9xcabu50YM=;
 b=k1HxQzPYyiAEOv5PIi3JCHrGXXc2JcQZkipCIYOVpK55QcrAYb+Xxn9a
 JT9s+NEKzJ6wWCCFnPgwss7qI1LeHrWl1fk9ZH6XWlES+WpAgW5VJtyrn
 vubsHRE15IXYKNKC8QodQoFl9GGGnjVVOfjldPpeEBkWMj526LqFT01/M
 1MwS+QYFudsi1yV4Z+5D5QUSjJwdEIYdTjDVt7vTM9N1yIIylxGOMPJ3Y
 aWa3iwEvZ9SSXlr/L1w1PGpMFy4VVBg8/+3lPucMBaXgpHw8RsQzVnkOw
 kNm557DAo3jc4Llet2cJNTtygA5GsnYdTOZDRQZqp86K+35wvAOm569Rt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="370491722"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="370491722"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 02:46:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="861911774"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="861911774"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 02:46:12 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed, 20 Sep 2023 12:41:48 +0300
Message-Id: <20230920094151.1593505-2-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920094151.1593505-1-alexander.usyskin@intel.com>
References: <20230920094151.1593505-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 1/4] drm/xe/gsc: add HECI2 register offsets
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 39d7b0740bf0..4cbc3062cb9a 100644
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

