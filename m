Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91A7E8FDC3
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 03:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBF710E340;
	Wed,  4 Oct 2023 03:10:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A6710E08A;
 Wed,  4 Oct 2023 03:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696389007; x=1727925007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GK0AFLW4JoubrmIv4WyIbOZ7T+9a7kqnDoGnF5tUgEw=;
 b=mvjBn3L9sNjJ9xO44KkvjouqqcJuVQItucK21+1uZB9z7bY0+0snJGJ9
 iIUwLEQ36lQgXBv2jCMEb2UozqmlOWDhBEjgyOyBDd4mu3VkHOixCsRFb
 +jLaKlIAKVeF9RE5T3+W6uFOIpfZ9ThffAGAAjkqdt+Jme5vLJODg/43B
 wAJK3iyVREBS0dWJv2WXhBQXl4/auv6BoS04SY4TdEWga/zEqGMdx2AmO
 gI7xdZpMGtU7yPSklg6age8c9e595xNXyTdzb1k+5PDMcl6EbURFuXqEJ
 IuaGj3gfJvmnNHoHjoQ5Ot/uH5rslkL6om19g/KjeDuu1CctWcVrv/WNf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="363308406"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="363308406"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="894760409"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="894760409"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:08:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 20:10:19 -0700
Message-Id: <20231004031023.3444455-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004031023.3444455-1-lucas.demarchi@intel.com>
References: <20231004031023.3444455-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t v2 09/13] lib/igt_draw: Add Xe2 mocs to
 XY_FAST_COLOR_BLT
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/igt_draw.c  | 6 +++++-
 lib/intel_reg.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index d7c3ac64c..9a7664a37 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -716,7 +716,11 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 		}
 
 		pitch = tiling ? buf->stride / 4 : buf->stride;
-		mocs = intel_get_uc_mocs_index(fd) << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
+
+		if (ver >= 20)
+			mocs = intel_get_uc_mocs_index(fd) << XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
+		else
+			mocs = intel_get_uc_mocs_index(fd) << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
 
 		intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
 		intel_bb_out(ibb, blt_cmd_tiling | mocs | (pitch-1));
diff --git a/lib/intel_reg.h b/lib/intel_reg.h
index f97154d2b..ea463376b 100644
--- a/lib/intel_reg.h
+++ b/lib/intel_reg.h
@@ -2564,6 +2564,7 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 #define XY_FAST_COLOR_BLT				((0x2<<29)|(0x44<<22)|0xe)
 #define   XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT		22
+#define   XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT	24
 
 #define XY_FAST_COPY_BLT				((2<<29)|(0x42<<22)|0x8)
 /* dword 0 */
-- 
2.40.1

