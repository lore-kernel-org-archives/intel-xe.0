Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAB2606A32A
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 18:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lE/hOiR0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778AC10EA26;
	Sat, 21 Nov 2026 18:23:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D0210E447
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 18:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795285417; x=1826821417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7nuLYak4G2UKtW4XZ3zOKxCizaNN5rtbJuZHGw3GONo=;
 b=lE/hOiR00GfvncYbLSq8L2ZSK54+yZxfVI4+cHFAAEdrAcGa+kZwGRE5
 KtnuQlLAbTx3hihYUs1YQsTAf5ngZFBy/wShie92mxtCE6NIrTTOp2YIL
 6mKeSrdhCW+n8PRM+uxCp83229UJj4TOoS9dkwOyEChNDrJpNUE2DZiSx
 OiaeeytEyRzRZRCwVUtDWDkARyM3DGlm0WAs82rLa+hWkMcd3cySJEocE
 IH0k5+7ydqL/OvNLzKN04+FJ9YFIEvfryrTrhzUnifxSr/cWGFOh9CBcu
 JEZVjsB3KcOroLgu8VnrQf/rwSamYbSufweJQE15upptKamLoyGN3oTo7 g==;
X-CSE-ConnectionGUID: F/rLIzHuQN6Z7Z91t1PuFw==
X-CSE-MsgGUID: DCZ/A5H3SVuhPzVKtCD8Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4034065"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4034065"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:21 -0800
X-CSE-ConnectionGUID: 2GeyPkFtRqeEa0AMQdm1mw==
X-CSE-MsgGUID: 9On/mt8JSyKSTZtH0P9IkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; d="scan'208";a="10934431"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:20 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 10/17] drm/xe: Do not claim flat CCS without a graphics IP
Date: Sat, 21 Nov 2026 18:23:26 +0000
Message-ID: <20261121182317.48981-29-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121182317.48981-19-stuart.summers@intel.com>
References: <20261121182317.48981-19-stuart.summers@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

has_flat_ccs comes from the device descriptor rather than from the
graphics IP, so it survives a device whose graphics IP is absent.  It is
a graphics feature though, and probe_has_flat_ccs() reads its layout back
through the primary GT, which is not there.

Clear the flag along with the rest of the graphics feature bits.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a270d1fbce03..b8dcb224e306 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1138,6 +1138,14 @@ static int xe_info_init(struct xe_device *xe,
 		xe->info.has_ctx_tlb_inval = graphics_desc->has_ctx_tlb_inval;
 		xe->info.has_usm = graphics_desc->has_usm;
 		xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
+	} else {
+		/*
+		 * Flat CCS comes from the device descriptor rather than from
+		 * the graphics IP, but it is still a graphics feature: its
+		 * layout is read back through the primary GT, which is not
+		 * there to be read.
+		 */
+		xe->info.has_flat_ccs = 0;
 	}
 
 	if (xe->info.platform != XE_PVC)
-- 
2.43.0

