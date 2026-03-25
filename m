Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74095109C057
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 18:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDED10E83F;
	Wed, 25 Mar 2026 18:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fRlBS2EW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE11610E849;
 Wed, 25 Mar 2026 18:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774464839; x=1806000839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OKW7KiZoY/D+L9EoZiHdYo4h2/FIN4ewLsxrlKKfY8I=;
 b=fRlBS2EWZbqvHzWiT0khUTRYyOy7JYLMmgj4EhZBZXfiXXvxKxILzDWk
 MctZybJkG5l6MrebtEl4g0s1GZdGa4ITs1nv7bG5CndeYb/9jYiPn7u1C
 2FS/1Nfq+QmO/9SEjgrknnvHNU95leFkCTZD/hhuHAUWFMLc9KXyUE1gi
 nibN/rokz/SM2XmHYNtjjk4K8MqTgZXZ2+MyYN4atfsQyJ8R84/2F2cJ8
 C/8xuqxeBD9aIjfs+GoAvNM0il+cKWPEGVXEs7xqB5C+R2F/c4my0NNs0
 ZsEk+TPuTK0jj6yLKpB1Hb30UW774frxC35h2q/yOYpHXXX1m/GK9GbBL g==;
X-CSE-ConnectionGUID: gjhlgpAxTXif7gMSdD1tVg==
X-CSE-MsgGUID: Gmo6ulsQRTuueTU9Nlib0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75399938"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75399938"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 11:53:58 -0700
X-CSE-ConnectionGUID: 3cZqPnyGS8aV4ThtT6z80g==
X-CSE-MsgGUID: j/JeZmQ3Qo6/BR6EHytY9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="221872410"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.117])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 11:53:56 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 03/12] drm/i915/mchbar: Define the end of the MCHBAR mirror
Date: Wed, 25 Mar 2026 20:53:32 +0200
Message-ID: <20260325185342.11482-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260325185342.11482-1-ville.syrjala@linux.intel.com>
References: <20260325185342.11482-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add defines for the end of the MCHBAR mirror. I'm planning to
use this for some range sanity checks.

BSpec: 51771
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/intel_mchbar_regs.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
index 614d4017b57b..ca0d421be16c 100644
--- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
+++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
@@ -16,11 +16,16 @@
  * every way.  It is not accessible from the CP register read instructions.
  *
  * Starting from Haswell, you can't write registers using the MCHBAR mirror,
- * just read.
+ * just read. On MTL+ the mirror no longer exists.
  */
 
 #define MCHBAR_MIRROR_BASE			0x10000
+#define MCHBAR_MIRROR_END			0x13fff
+
 #define MCHBAR_MIRROR_BASE_SNB			0x140000
+#define MCHBAR_MIRROR_END_SNB			0x147fff
+#define MCHBAR_MIRROR_END_ICL_RKL		0x14ffff
+#define MCHBAR_MIRROR_END_TGL			0x15ffff
 
 #define CTG_STOLEN_RESERVED			_MMIO(MCHBAR_MIRROR_BASE + 0x34)
 #define ELK_STOLEN_RESERVED			_MMIO(MCHBAR_MIRROR_BASE + 0x48)
-- 
2.52.0

