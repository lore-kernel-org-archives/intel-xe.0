Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6D1606A332
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 00:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b9jjQ30c
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FAD1120E5;
	Thu, 19 Nov 2026 00:29:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B7E10EAE2
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 00:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795048146; x=1826584146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CryLb2/73sHf+9P6F0O7bkgnZmhTDh4mbfk4m7COlfk=;
 b=b9jjQ30cjrRdgWD+F0VE6XP8W1cQIPfgLmy7djgsnyKWyWj/cdFciBdS
 Hm1UWYG40xrM/R2Z7POp9/kQz9a8IUuxyd+t0I8Hbir0sxpLQSienSJcv
 0aPjBPI1iKHIer1tWtuDambMwE4F5pspa5vR21FU2PvtJXC00ntpqGwgK
 ZlO9VQ3MOyNMY7EDqG61dp+yh2ybAU5EX4haF6XUEBtzUSTjWOsUij+8c
 /IMKejn0aWkWPRy3koUVmJib7cLmzvoepeKXwc33JiEaVBzrfi3+9GIBB
 D3qQYtQeG8IjoXN5Qbm0HwZvUvAJ2/dmUQTxfK28aDPg268eo4DTN+GvY A==;
X-CSE-ConnectionGUID: w8FIhgpuReKaZ71riMaDsg==
X-CSE-MsgGUID: CpWAk5ggROOzPPz2OlZhpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3876662"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3876662"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:29:01 -0800
X-CSE-ConnectionGUID: oXn6f6q7QGWA+nc8ckJ95w==
X-CSE-MsgGUID: 7eFwWQmEQpayWBrqs8xZGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10081546"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:29:01 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 harish.chegondi@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH v8 1/8] drm/xe/oa: Ignore a HW tail pointer outside the OA
 buffer
Date: Wed, 18 Nov 2026 16:27:39 -0800
Message-ID: <20261119002737.3899877-11-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A device that stopped responding, e.g. during PCI error recovery or
after a surprise removal, returns all ones for the OA tail pointer, and
a reset device returns 0. Subtracting the GGTT address of the OA buffer
then leaves a tail offset way past the end of the OA buffer.

Since xe_oa_circ_diff() replaced the masked OA_TAKEN(), nothing brings
such an offset back into the OA buffer. xe_oa_buffer_check_unlocked()
walks backward from it, reading report ids and timestamps out of bounds
of the OA buffer mapping, from the poll hrtimer in hardirq context and
with the OA buffer lock held.

Ignore a HW tail outside the OA buffer, as if no new reports landed.

Fixes: 3a1fc394ba85 ("drm/xe/oa: Changes to OA_TAKEN")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 838802482ada..fdd2d11ce4e7 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -270,6 +270,15 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 	hw_tail = xe_oa_hw_tail_read(stream);
 	hw_tail -= gtt_offset;
 
+	/*
+	 * A device that stopped responding, or was reset, returns a tail outside the OA
+	 * buffer. Don't walk the buffer from there.
+	 */
+	if (hw_tail >= stream->oa_buffer.circ_size) {
+		spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
+		return false;
+	}
+
 	/*
 	 * The tail pointer increases in 64 byte (cacheline size), not in report_size
 	 * increments. Also report size may not be a power of 2. Compute potential
-- 
2.55.0

