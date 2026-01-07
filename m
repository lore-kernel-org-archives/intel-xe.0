Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08B1CFD647
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 15:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908C810E1A9;
	Wed,  7 Jan 2026 15:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mtvMi/Nu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BAD10E1A9
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767801251; x=1799337251;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nnZ5mEwmTOsQXYxqZdI72rjj+4hlgFqjZPrfIj8pUTM=;
 b=mtvMi/NuEDxABNrmFIUYR23qL6VLNrrFPtyvwKTZdC1ibRaRRL5Mgh5m
 CaQDArRtw+TihRRRjCs7ML3Eyg91ZrN8bM1lT6wq7Mvgeu1uGY7SVp53G
 UbLozULcwuPQ/uwT3gi32PQEKfvxrnT20SRMS8v//STAVkrHwqlRHuGcu
 zHaotX4lqUm7XzsUu+p0QIHgpo6aOFykA++X1UMf+YCT81nE74AjWiHTo
 a6TdceyCrVeAX3qstvAyZClFG8QcJS1Bxrzs6fNWFbEzHs8YTM6cybQQT
 q/Lqa1sgVgYwnAZ4hiDDBmdt0GSEClCnWnICrPYHDJNvHDW2bQLD9nTAO Q==;
X-CSE-ConnectionGUID: UKe8ENPXSBe4MUFLbNqETA==
X-CSE-MsgGUID: IZ9aQ1N+R9WtklTJ3i1EHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56734538"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="56734538"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 07:54:11 -0800
X-CSE-ConnectionGUID: IdK5AvZdSfulCZxad5oXnw==
X-CSE-MsgGUID: ZyL9rdywRre7HCUx6r0qXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="207109216"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.60])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 07:54:08 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Zhanjun Dong <zhanjun.dong@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 1/5] drm/xe/guc: fix struct guc_lfd_file_header kernel-doc
Date: Wed,  7 Jan 2026 17:53:57 +0200
Message-ID: <20260107155401.2379127-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
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

Fix kernel-doc warnings on struct guc_lfd_file_header:

Warning: ../drivers/gpu/drm/xe/abi/guc_lfd_abi.h:168 expecting prototype
  for struct guc_logfile_header. Prototype was for struct
  guc_lfd_file_header instead

Fixes: 7eeb0e5408bd ("drm/xe/guc: Add LFD related abi definitions")
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_lfd_abi.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_lfd_abi.h b/drivers/gpu/drm/xe/abi/guc_lfd_abi.h
index b6ed20d5b508..5c48459f365f 100644
--- a/drivers/gpu/drm/xe/abi/guc_lfd_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_lfd_abi.h
@@ -148,7 +148,7 @@ struct guc_lfd_data_os_info {
 } __packed;
 
 /**
- * struct guc_logfile_header - Header of GuC Log Streaming-LFD-File Format.
+ * struct guc_lfd_file_header - Header of GuC Log Streaming-LFD-File Format.
  * This structure encapsulates the layout of the guc-log-file format
  */
 struct guc_lfd_file_header {
@@ -163,8 +163,7 @@ struct guc_lfd_file_header {
 #define GUC_LFD_FILE_HEADER_VERSION_MASK_MAJOR	GENMASK(31, 16)
 #define GUC_LFD_FILE_HEADER_VERSION_MASK_MINOR	GENMASK(15, 0)
 
-	/** @stream: A stream of one or more guc_lfd_data LFD blocks
-	 */
+	/** @stream: A stream of one or more guc_lfd_data LFD blocks */
 	u32 stream[];
 } __packed;
 
-- 
2.47.3

