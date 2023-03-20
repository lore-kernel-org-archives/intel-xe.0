Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3293AC6FD1D
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 23:49:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BD410E687;
	Mon, 20 Mar 2023 23:49:40 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623B810E683
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 23:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679356179; x=1710892179;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XF+zlTWMYfCqZQtwZE+hjE3ljmYXG0wMKw+Fejaro/g=;
 b=IbbZ06C/MWqHr8oOdTyciwtL2jcSjvY8i91FyoQzlVzrUQ4CqJnol2hU
 04qQLZy5qZDZ11jERlyudeygrB9o47mXtHDc+8iY105vxJIp1EJ/riKaJ
 v9ohIGhABXuxo/wHZ8dNXmSwa5qhOB+OWCo6sLMYlNIR5I/H6HXDFyuir
 z+aI26BchNkQpNw9sWN9TQgEdTAXrTMjlMjbMkkY+oYWem5w2YhulMkfe
 2rqQgGFqIBfXSuNWSzU57G2YsyXrAMjaXL6VnFe3Wa69H4KhtUYvB7hqz
 rqEfHgEuUTCisQcU2Ny1ayD/2tlxqNwXJIvFfiAa1ahIvmYJoqw9KnNQq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="319202857"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; d="scan'208";a="319202857"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 16:49:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="750314459"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; d="scan'208";a="750314459"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 16:49:38 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Mar 2023 16:52:53 -0700
Message-Id: <20230320235254.3288679-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Add checks to load huc from a
 previous platform
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
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Platforms like ADL-S use TGL HuC. Add suitable condition
so driver does not disable HuC.

Cc: Matt Atwood <matthew.s.atwood@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 00408f1b73e1..e2e5f7fbe9db 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -139,7 +139,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 	fw_count = blobs_all[uc_fw->type].count;
 
 	for (i = 0; i < fw_count && p <= fw_blobs[i].p; i++) {
-		if (p == fw_blobs[i].p && rev >= fw_blobs[i].rev) {
+		if (p >= fw_blobs[i].p && rev >= fw_blobs[i].rev) {
 			const struct uc_fw_blob *blob = &fw_blobs[i].blob;
 
 			uc_fw->path = blob->path;
-- 
2.25.1

