Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949EF606A326
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 17:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X65EuXnf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C38C112676;
	Thu, 26 Nov 2026 17:51:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868EC11266D;
 Thu, 26 Nov 2026 17:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795715461; x=1827251461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vikq03FETXuhifjBllFiCAAEeJhR4Jhi6vEAVSjHIyI=;
 b=X65EuXnfHYtR1ST5Lyvg7FJb+x12RaC/d3IOeAVpbV95wg98ZUQto+Bb
 9UTdSxhGz2RSI/3KGRVFnoDQqpb6bJqCmVgo6WVfZn62G1fS9Ce/KheLF
 +mLEprZZzqfIS0wiC6K494BxUjw/HF6Jj7TWlHN7d+W8LoiKXJwaT1VgT
 6xOeoJmTuGVjc9V3Ho7fYndbt5pGQtN5il4xbAQyqQqk7hhiIdy6kV/az
 CauwNihDADmNbT3IDwslYRzBVZgEVApS+jI92sP3sLRK5SiM88kmbA0zd
 1R8qKzu16U3gEfssBc2y6Ee5IvQOOsuVkzGSwCEZiz/F5R4NTrrkP3F0v A==;
X-CSE-ConnectionGUID: ivyHD3u1R1+GpQoqY7WcKw==
X-CSE-MsgGUID: SL/vEKz3QYK4AB6FiLcC2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4588372"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4588372"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 09:51:01 -0800
X-CSE-ConnectionGUID: 2lLmp3QLSmKRDEswN+u2QA==
X-CSE-MsgGUID: k4ZS5xXZR4O1JqR6P4TUjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12558239"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 09:50:59 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH v1 1/2] drm/i915/bios: include whitespace into VBT signature
Date: Thu, 26 Nov 2026 18:50:32 +0100
Message-ID: <20261126175033.181407-2-michal.grzelak@linux.intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Michał Grzelak <michal.grzelak@intel.com>

Product name always starts after whitespace which is part of VBT
signature as per spec. Extend VBT signature to contain whitespace.

Bspec: 20119
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
This probably should see a Fixes: trailer but I can't find any suitable
commit to blame since this existed for quite some time already.
---
 drivers/gpu/drm/i915/display/intel_bios.c     | 8 ++++----
 drivers/gpu/drm/i915/display/intel_vbt_defs.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index b77d1599482a7..f20cda5ad1a33 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -60,7 +60,7 @@
  * The VBT consists of a VBT Header (defined as &struct vbt_header), a BDB
  * Header (&struct bdb_header), and a number of BIOS Data Blocks (BDB) that
  * contain the actual configuration information. The VBT Header, and thus the
- * VBT, begins with "$VBT" signature. The VBT Header contains the offset of the
+ * VBT, begins with "$VBT " signature. The VBT Header contains the offset of the
  * BDB Header. The data blocks are concatenated after the BDB Header. The data
  * blocks have a 1-byte Block ID, 2-byte Block Size, and Block Size bytes of
  * data. (Block 53, the MIPI Sequence Block is an exception.)
@@ -3131,8 +3131,8 @@ static const struct bdb_header *get_bdb_header(const struct vbt_header *vbt)
 	return _vbt + vbt->bdb_offset;
 }
 
-static const char vbt_signature[] = "$VBT";
-static const int vbt_signature_len = 4;
+static const char vbt_signature[] = "$VBT ";
+static const int vbt_signature_len = 5;
 
 /**
  * intel_bios_is_valid_vbt - does the given buffer contain a valid VBT
@@ -3235,7 +3235,7 @@ static struct vbt_header *oprom_get_vbt(struct intel_display *display,
 		return NULL;
 
 	BUILD_BUG_ON(vbt_signature_len != sizeof(vbt_signature) - 1);
-	BUILD_BUG_ON(vbt_signature_len != sizeof(u32));
+	BUILD_BUG_ON(vbt_signature_len != sizeof(u32) + 1);
 
 	offset = intel_rom_find(rom, *(const u32 *)vbt_signature);
 	if (offset < 0)
diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
index 0dc13d080e8aa..1a393528ced91 100644
--- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
@@ -85,7 +85,7 @@ struct bdb_edid_dtd {
 
 /**
  * struct vbt_header - VBT Header structure
- * @signature:		VBT signature, always starts with "$VBT"
+ * @signature:		VBT signature, always starts with "$VBT "
  * @version:		Version of this structure
  * @header_size:	Size of this structure
  * @vbt_size:		Size of VBT (VBT Header, BDB Header and data blocks)
-- 
2.45.2

