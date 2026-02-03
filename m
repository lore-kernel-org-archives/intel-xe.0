Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCE2E87836
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 14:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E9910E65E;
	Tue,  3 Feb 2026 14:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ePrS6ezn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D3510E02B
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 14:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770127480; x=1801663480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r/42gSDf3FCPt1A3Q/x8ucDpblT3a9uYnrRmSCdsuXw=;
 b=ePrS6eznB+rM56cgz/OdUPEQqavVB0e5WwIMKJ7OyRfKhqTKGxU30xwg
 lXK6gnKt8OMQSYNjgW3t1mC0c4uyC1TxWT3mReKGy1mOjoVpupF9971Ii
 eu2O4NPyWQKcW72Ox4F8ctmpmHUYadE57N8ehrxSQ3946JdcQvfdg1pzj
 86JqpbulAes/YhE6rD+VcLD+nswIOE9qp6MNzYroM0HU0VY6SKJAqt3Dy
 rrWCROW/5tGTidqpf30CjvaZ/IXgWerbcyXy25fQ4qUk0z1m6/0qEYDzW
 gFyBsu7yEJjo5tYzdk0xdb7x0VDASk4ve9qQv9t7FzUp3iZwVqahsfXBB A==;
X-CSE-ConnectionGUID: ilzd/GbPSgCLbumfig4fGA==
X-CSE-MsgGUID: vETnN4HETDeG2PHHjH5MZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="81927550"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="81927550"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 06:04:39 -0800
X-CSE-ConnectionGUID: wDc4lLAGS8SQs3mbxg6vAQ==
X-CSE-MsgGUID: 57DTqI5+QnuN5sQEIthpQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="210009954"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 06:04:37 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v3 2/2] drm/xe/cri: Enable HECI CSC support
Date: Tue,  3 Feb 2026 19:36:41 +0530
Message-ID: <20260203140639.2048912-4-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203140639.2048912-3-balasubramani.vivekanandan@intel.com>
References: <20260203140639.2048912-3-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
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

CRI supports CSC engine as a separate PCI endpoint. Enable
has_heci_cscfi flag.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b5e8935fff1d..23b1a10911cb 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -430,6 +430,7 @@ static const struct xe_device_desc cri_desc = {
 	.require_force_probe = true,
 	.va_bits = 57,
 	.vm_max_level = 4,
+	.has_heci_cscfi = 1,
 };
 
 #undef PLATFORM
-- 
2.43.0

