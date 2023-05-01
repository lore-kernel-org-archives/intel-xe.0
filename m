Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA15C87FF1
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 07:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D09910E41E;
	Mon,  1 May 2023 07:51:19 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB44A10E30E
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 07:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682927473; x=1714463473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YEDy/AWyz03++Zp8T5OkvUskdt8RrYdVkxHoS0/acpg=;
 b=kM1RSl1G3tgMEqoM4XlnQSIIWMiNNmpp6hft2a6Gu+nRVfD7gRZSIzCm
 o13nGX5HCxeh5369veQWK4Dj43EcD7MQ+MtvUA+drGTCVP9qm9DfDkNwi
 SkD2J9r6kS52dCxXtb15ZZh4M6XVr76Ky9J0S0Khdizk6r78n2OIDVuW0
 1CEXUo3rpNf9IVtEim+h6LHllFsTpCgppBLHKUEB4ZANnxA5lvTUWeFxD
 qvf90FfdsN4u2u6hEGych85rsKG2RURncYlTEZ4KtIGchIr+EoruDcTVD
 h3jwhxesaBIyNRU92n5ZHJWwKPdbbH/iFpUq+s4WS0MGm5dwLHt01HLLX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="346910732"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="346910732"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="870095257"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="870095257"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 00:51:10 -0700
Message-Id: <20230501075114.3108352-27-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501075114.3108352-1-matthew.brost@intel.com>
References: <20230501075114.3108352-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 26/30] drm/exec: Always compile drm_exec
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
Cc: Danilo Krummrich <dakr@redhat.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We want some helpers for DRM exec in gpuva, alway compile this.

Suggested-by: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ab728632d8a2..40067970af04 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -23,6 +23,7 @@ drm-y := \
 	drm_dumb_buffers.o \
 	drm_edid.o \
 	drm_encoder.o \
+	drm_exec.o \
 	drm_file.o \
 	drm_fourcc.o \
 	drm_framebuffer.o \
@@ -81,8 +82,6 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 # Memory-management helpers
 #
 #
-obj-$(CONFIG_DRM_EXEC) += drm_exec.o
-
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
 drm_dma_helper-y := drm_gem_dma_helper.o
-- 
2.34.1

