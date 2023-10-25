Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8419C25B6B
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 17:58:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D73A10E6C9;
	Wed, 25 Oct 2023 17:58:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2A610E6C6
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 17:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698256685; x=1729792685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h7VHVFt4lwgpe9/k7N5u5G+w3sk8/An+EKnBzesADCw=;
 b=aydnBal60YUf80JIslhzvw6cDLGfP8ulvdbWqkNT8YoCq1784L+DCoX7
 Z3PVvQmgQSJnk4fVXZm6jzwQb1Gjm2CLzu8ZMrFmPu71c2gcvLkEvLE73
 mUlD9betOrCk6nVd6Wjc2lxCQIol50Fd4Fe12Fi784QpKM5DgTYYtS+vr
 5mEaRVGZgQZUIeRhP4dweULJYe+eDM40vMbHRU746kjANsCaeLogKRNkh
 CfJHAsCy5LjmtVjCrYDYpjn8EYZs+sj2N92MqdOXIj0o9MtJ/AeRtgl1D
 7vl2QqteY5BhQvgKIg+NZzvd9yfHUdW9KOyYenKj6T1MXOhdppH+u68AO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="386249965"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="386249965"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="6642419"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:56:37 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 10:57:44 -0700
Message-ID: <20231025175745.1906310-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025175745.1906310-1-daniele.ceraolospurio@intel.com>
References: <20231025175745.1906310-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 4/5] drm/xe/huc: Don't re-auth HuC if it's
 already authenticated
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On newer platforms the HuC survives reset and stays authenticated, so no
need to re-authenticate it.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 386efa180c1c..2f176badab26 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -83,6 +83,12 @@ int xe_huc_auth(struct xe_huc *huc)
 
 	xe_assert(xe, !xe_uc_fw_is_running(&huc->fw));
 
+	/* On newer platforms the HuC survives reset, so no need to re-auth */
+	if (xe_mmio_read32(gt, HUC_KERNEL_LOAD_INFO) & HUC_LOAD_SUCCESSFUL) {
+		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_RUNNING);
+		return 0;
+	}
+
 	if (!xe_uc_fw_is_loaded(&huc->fw))
 		return -ENOEXEC;
 
-- 
2.41.0

