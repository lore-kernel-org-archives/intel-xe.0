Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E2BC197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 21:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D421410E6F4;
	Thu, 16 Nov 2023 21:40:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E2010E2CB
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 21:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700170828; x=1731706828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/FL4u5nv21UAoxl5eIyv0u5U27VXiEQT+lY9c3/t01k=;
 b=ImqmD6M5fLVEizLdjQxXUT6DtrwxE+nAPdf9+0wZX9chtsSPJPemS4d6
 bTwqyNivrjtbFvgzg/hpAsg5yQ3ioigaUO6ipWyS914GMKQWcZO+/G4Xr
 WrpW3D5o6Utj/Go1E7yt2ydfPs4ukL2I/ecA0NnG4EqPXYFR8TULweqMi
 JFD3hvGqu2LB0XKW4bytmKuTSSmT44XfMFL3RvknoXjAl06brfjRiiHc+
 0hmuWfiAcYJnIlHWKafb0JlqtAqjU6yOTvtXf+snOLRsKXlBHBbhiU6Yt
 9+nkg3uJLb+tlzTKh3chfm+0/td2JgRSa/4KeGkX3IQP2gAbA1DdJ+3FT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="4263193"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="4263193"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 13:40:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="13261084"
Received: from tjlunife-mobl3.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.255.34.202])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 13:40:15 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 18:40:00 -0300
Message-ID: <20231116214000.70573-3-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231116214000.70573-1-gustavo.sousa@intel.com>
References: <20231116214000.70573-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/2] drm/xe/mmio: Make xe_mmio_wait32() aware
 of interrupts
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With the current implementation, a preemption or other kind of interrupt
might happen between xe_mmio_read32() and ktime_get_raw(). Such an
interruption (specially in the case of preemption) might be long enough
to cause a timeout without giving a chance of a new check on the
register value on a next iteration, which would have happened otherwise.

This issue causes some sporadic timeouts in some code paths. As an
example, we were experiencing some rare timeouts when waiting for PLL
unlock for C10/C20 PHYs (see intel_cx0pll_disable()). After debugging,
we found out that the PLL unlock was happening within the expected time
period (20us), which suggested a bug in xe_mmio_wait32().

To fix the issue, ensure that we do a last check out of the loop if
necessary.

This change was tested with the aforementioned PLL unlocking code path.
Experiments showed that, before this change, we observed reported
timeouts in 54 of 5000 runs; and, after this change, no timeouts were
reported in 5000 runs.

v2:
  - Prefer an implementation without a barrier (v1 switched the order of
    xe_mmio_read32() and ktime_get_raw() calls and added a barrier() in
    between). (Lucas, Rodrigo)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 46140425ee2e..e29c2fee709a 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -537,6 +537,12 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 t
 		wait <<= 1;
 	}
 
+	if (ret != 0) {
+		read = xe_mmio_read32(gt, reg);
+		if ((read & mask) == val)
+			ret = 0;
+	}
+
 	if (out_val)
 		*out_val = read;
 
-- 
2.42.0

