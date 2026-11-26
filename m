Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246A5606A321
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 17:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KdM1PfeX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E84112672;
	Thu, 26 Nov 2026 17:51:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFFC112671;
 Thu, 26 Nov 2026 17:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795715463; x=1827251463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/kausiAVs3rEx4cPA7qaE3DJM9UI5vSVnNv7fNrVkB8=;
 b=KdM1PfeXCYf7xRrI9ax87bVeUqAdUch4B7BFEbwT303lv6g667dUyTpY
 Sg1bgOSk/k/awjQTkpjcJZuh7AiSmPcrEpjkEMN+mRq5OGPF6R4gvZMqf
 CHdTtNBxW837ZpALkD+t/XXmClLuVY4qjxH8FcbpqPDR5p4oaKD4kuMkc
 jUYCkRrOtGESr6/Bfl95zoel/l91+fALI6bcUzUYXSBOka53lf6HZPYu0
 Z29INCpMl5wsiJIs4mk+ZQRpl3nO969urpciMtoQsEZyh168iZxTYSPJQ
 rUmay/fKUkJ9+5W3meQy1tYEJvAr7B8q0kjgrk4zMemhjutOFfT2I7oBX w==;
X-CSE-ConnectionGUID: Cwo6r3woRHuwnVdC5SYZpA==
X-CSE-MsgGUID: nicYAJSwTd2Kc38YuWuTQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4588373"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4588373"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 09:51:02 -0800
X-CSE-ConnectionGUID: voyZcJDCTwSHCnDZNBdTsw==
X-CSE-MsgGUID: oxYauaJBRbG4PYCvzKzupg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12558246"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 09:51:01 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH v1 2/2] drm/i915/bios: check if VBT#57's tables are zeroed
Date: Thu, 26 Nov 2026 18:50:33 +0100
Message-ID: <20261126175033.181407-3-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261126175033.181407-1-michal.grzelak@linux.intel.com>
References: <20261126175033.181407-1-michal.grzelak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Turns out there are VBTs which have use_vbt_vswing enabled while
their vswing/pre-emphasis override tables contain only zeroes instead of
register values.

Return from parsing of Vswing/Pre-emphasis Override if tables are empty.
By doing so do not update metadata stored in vspeo substructure.

Return from buffers' allocation if vspeo metadata is missing. Use
default vswing/pre-emphasis then because of allocation failure.

Fixes: a138a81d7805 ("drm/i915/bios: de/allocate VS/PE-O buffers for each port")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9602
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
Somewhat uglier hack would be to simply reset use_vbt_vswing after
confirming that tables are empty. However that is more tricky because
it would require finding devdata that requests Vswing/Pre-emphasis
Override during parse_vswing_preemphasis_override(); which sounds like
both wrong abstraction layer and also more lines of code.
---
 drivers/gpu/drm/i915/display/intel_bios.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index f20cda5ad1a33..04d07ee05e76d 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2232,6 +2232,12 @@ parse_vswing_preemph_override(struct intel_display *display)
 	if (!block)
 		return;
 
+	/* adjust size for num_tables and num_columns fields */
+	if (mem_is_zero(block->tables, get_blocksize(block) - 2)) {
+		drm_dbg_kms(display->drm, "VBT#57 tables are zeroed\n");
+		return;
+	}
+
 	display->vbt.vspeo.tables = block->tables;
 	display->vbt.vspeo.num_tables = block->num_tables;
 	display->vbt.vspeo.num_columns = block->num_columns;
@@ -2665,6 +2671,9 @@ static void allocate_vswing_preemph_override(struct intel_bios_encoder_data *dev
 	if (!intel_bios_encoder_requests_vspeo(devdata))
 		return;
 
+	if (!devdata->display->vbt.vspeo.tables)
+		return;
+
 	vspeo = kzalloc_obj(*vspeo);
 	if (!vspeo)
 		return;
-- 
2.45.2

