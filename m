Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13297C47DA2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 13:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B718E10E6E3;
	Wed, 17 Jan 2024 13:41:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C4010E6BD
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705498875; x=1737034875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6KdaWGz6rYIaAjvZ6KsV7l+qkO3b3E0Dj9tCzL6BcaI=;
 b=lIizR/R/cPkU92j0775zK8NFKz2ulNiutV+WeIVZsbC3AIzbPcN+DuJ4
 ISP32FZtXNkDqkROtuoL0ndpEHdOpftNPWAwCZ8FKgrsw5x1TmoAI43Hk
 j+im1qX0HTS1qJFkT9hoql+1D2NxM+xy1kk85fhRmaoXSjVfk3Cj+xxIb
 uOvkl1ZEDLEHuFKdh8U7r5ZfjOgL7LXEykdMKjn7UJPDR/DmBCpIP7VZd
 gzz11JyIPWp8AlIgIeRMlP9v30ISdQ43R1Wwu+nI5dz1YBWYbt54D4oKG
 4z6ei6WIVYIuJWRkceCrkKtEQGnP7hPld0esZfQgEsn7EhlL5NSB1U0T2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="466549620"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="466549620"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 05:41:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="927831074"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="927831074"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 05:41:04 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/5] drm/xe/dmabuf: Make xe_dmabuf_ops static
Date: Wed, 17 Jan 2024 14:40:44 +0100
Message-ID: <20240117134048.165425-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117134048.165425-1-thomas.hellstrom@linux.intel.com>
References: <20240117134048.165425-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It is not referenced outside of the xe_dma_buf.c source file.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 64ed303728fd..da2627ed6ae7 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -175,7 +175,7 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 	return 0;
 }
 
-const struct dma_buf_ops xe_dmabuf_ops = {
+static const struct dma_buf_ops xe_dmabuf_ops = {
 	.attach = xe_dma_buf_attach,
 	.detach = xe_dma_buf_detach,
 	.pin = xe_dma_buf_pin,
-- 
2.43.0

