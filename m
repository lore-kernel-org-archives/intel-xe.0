Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7418606A320
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 23:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JtD4LVO5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0DC10F701;
	Tue, 10 Nov 2026 23:15:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD0E10E394
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 23:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794352501; x=1825888501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G219ypVWx5guuXid3RbMvc6Yzo3unOFFH+w5ebsMB88=;
 b=JtD4LVO5j4GtFOtX7lLOwjFF2us+2w6UOOnlRDJ7pOECFJ6QOI+088QD
 QJZ7017L4RPo8TU6qZiBs3//ZLeNuCXMi4SMACSazHK126uYHKU3928+p
 Bc2tKJ9TOIN1NqBETvgfKIkKQ3cLOpMCMYVWsrs5CWKOT8DgTxwd1BhoY
 6ZjvK601VNQnrPPleBkfnu9kSj4wnC4X7SmXeMRlYt+HJOcfdSU564KN6
 NjoXIk5L6YcDiXT8SkTDXwPko4W2LwuHUbWbNICjLeOVHsb2jI227A/DD
 96wfvIqxCXFzWX6rG8CpqcbK2jGR97YFDH0Z6VBk63rDpSsPNFqqAqLP7 g==;
X-CSE-ConnectionGUID: pHi3E0RQTWKvQgRmdO2dPw==
X-CSE-MsgGUID: GaKplBTmRfyEo5V1L1DQGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3120828"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3120828"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:51 -0800
X-CSE-ConnectionGUID: ELCu0CDyQQK2HzxbUlwPEA==
X-CSE-MsgGUID: 0zuJwr3uRBuUfFO4CF1UKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8133963"
Received: from dut4463arlhx.fm.intel.com ([10.105.9.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:51 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, matthew.d.roper@intel.com, fei.yang@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 06/11] drm/xe: Do not claim flat CCS without a graphics IP
Date: Tue, 10 Nov 2026 23:14:48 +0000
Message-ID: <20261110231442.218721-19-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110231442.218721-13-stuart.summers@intel.com>
References: <20261110231442.218721-13-stuart.summers@intel.com>
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
index f2a4aed1dfe2..05aea5498a7b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1107,6 +1107,14 @@ static int xe_info_init(struct xe_device *xe,
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

