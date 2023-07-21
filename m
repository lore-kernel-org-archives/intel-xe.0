Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4204FEB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 18:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A51910E6E7;
	Fri, 21 Jul 2023 18:09:20 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31D110E6E7
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 18:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689962958; x=1721498958;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VQg0Yu4tCnG+WlMM6anHCN1VIcFcx3+cMu35K5kHjbE=;
 b=jGvnmBbV7vBXqQOzR6q5Sq1SoUNMjfhuDTSPumhLqK9vOy9t2rSt/iVf
 Qah0/OXDUJp4Sipm1/EJwOMt1PweVThCElxoXe+UmLY5I5koQlLVPWjCN
 8oZZEbbw2fh/5eFBivLBe0yGyZ+lNIWXxxTM7rK7GP1UFf/C1/NwinGSS
 2z0y2uJxLdtzD/I3qjT/IY3/gAH5y4ZfRKqXqlwtFrxje49oWIBmpoC4a
 Jkk4I+vOo9v+esOe/pVE4hW9/cHVrIRguArRSYqeZLPCq/YttJpisMaY6
 SKaWDCNnGB4Qnb/1qGsfCJ5JaEQ4WW4l7nnaS2N9Ch4nwLVQjyoXyH9gs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="351969061"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="351969061"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 11:09:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="971513572"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="971513572"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 11:09:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Jul 2023 11:09:13 -0700
Message-ID: <20230721180913.1516321-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t] tests/xe: Boost command streamer prefetch
 size
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The actual prefetch size variest by platform and by engine.  MTL's RCS
engine currently has the highest prefetch size of 2KB.

Bspec: 45718
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/xe/xe_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 0b5c7a4fc..1f9240cd9 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -47,7 +47,7 @@
 
 uint32_t xe_cs_prefetch_size(int fd)
 {
-	return 512;
+	return 2048;
 }
 
 uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)
-- 
2.41.0

