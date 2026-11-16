Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDF9606A33E
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 08:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PiPVk5MQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5480610E3AD;
	Mon, 16 Nov 2026 08:11:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EC510E3AD;
 Mon, 16 Nov 2026 08:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794816709; x=1826352709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RZA/WLU/Rrl4ROsJgJi/YHtJIYdR6g+xsDZAj66U6Lc=;
 b=PiPVk5MQtUZq3/D6ymWCwy3EEjqzVXkKEybuq1GcNLJmW+jW/PbGNICV
 K/fVt7axiAhPB6j7356CtaDg4D7OCs3/UFq1mjsi2654+jZCsTwT4zcu+
 V63jUQ1hJicAsvFaEMtfGoaW/saFckWVQ01L+DFc9EO/i/37kXq+fTWY8
 zrSC0047ooL6eSDH1k9TR+rVVq5uqSthukkfEMSEbOMJjetYdbI3i59fN
 RnC9zgBcogVmSVnB8E7j7Dgf8eWI2Pljx3NJE7AFkipL6XAr6ZZKY6nW8
 kPtLciB3aUP9tpg35Do5W4aZ0mesJL5UrhsCfpKimdAA21OAJw7T6N9NH A==;
X-CSE-ConnectionGUID: +q+d07q+TDO6NK3En3lTAA==
X-CSE-MsgGUID: ftoTAfWcTgCmlaJ9QqfDqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3553569"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3553569"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:11:06 -0800
X-CSE-ConnectionGUID: F11k1j4AQPC0xA6VVk817Q==
X-CSE-MsgGUID: yhvnOE1MTOm5UWr76zE0gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9557727"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:11:05 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/7] drm/i915/dsb: Extract intel_dsb_set_ins()
Date: Mon, 16 Nov 2026 10:10:38 +0200
Message-ID: <20261116081041.6519-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116081041.6519-1-ville.syrjala@linux.intel.com>
References: <20261116081041.6519-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We're adjusting the previous instruction tracking data in
a few places. Extract that to a helper. I'll be adding a
few other uses soon.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index fa4964c17163..75f98b31c780 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -310,6 +310,15 @@ static unsigned int intel_dsb_tail(struct intel_dsb *dsb)
 	return dsb_buffer_ggtt_offset(dsb) + intel_dsb_size(dsb);
 }
 
+static void intel_dsb_set_ins(struct intel_dsb *dsb,
+			      unsigned int ins_start_offset,
+			      u32 ldw, u32 udw)
+{
+	dsb->ins_start_offset = ins_start_offset;
+	dsb->ins[0] = ldw;
+	dsb->ins[1] = udw;
+}
+
 static bool intel_dsb_prev_ins_is_indexed_write(struct intel_dsb *dsb)
 {
 	u32 opcode = DSB_OPCODE_INDEXED_WRITE << DSB_OPCODE_SHIFT;
@@ -344,9 +353,7 @@ static void intel_dsb_emit(struct intel_dsb *dsb, u32 ldw, u32 udw)
 
 	intel_dsb_ins_align(dsb);
 
-	dsb->ins_start_offset = dsb->free_pos;
-	dsb->ins[0] = ldw;
-	dsb->ins[1] = udw;
+	intel_dsb_set_ins(dsb, dsb->free_pos, ldw, udw);
 
 	dsb_buffer_write(dsb, dsb->free_pos++, dsb->ins[0]);
 	dsb_buffer_write(dsb, dsb->free_pos++, dsb->ins[1]);
@@ -1023,9 +1030,7 @@ void intel_dsb_wait(struct intel_dsb *dsb)
 
 	/* Attempt to reset it */
 	dsb->free_pos = 0;
-	dsb->ins_start_offset = 0;
-	dsb->ins[0] = 0;
-	dsb->ins[1] = 0;
+	intel_dsb_set_ins(dsb, 0, 0, 0);
 
 	intel_de_write_fw(display, DSB_CTRL(pipe, dsb->id), 0);
 
-- 
2.56.0

