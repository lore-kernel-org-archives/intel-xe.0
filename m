Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0670CC624C6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 06:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD5710E39B;
	Tue,  1 Sep 2026 06:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="id73QIyo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5272D10E30F
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 06:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788244275; x=1819780275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uNWvikzhLhGVVV0X3HiLMXXIP+WOyj9BbblFo3gPjtA=;
 b=id73QIyoI/0Egu98IV5ypVxLq0gOdxTulYJZVN5irYyrPK1syXvBrzeB
 jKP7L9sZF3IDhCdHi2fVTxwRlKVIy0t4FuOSBs6h8dEaH6eOqkHbikuIO
 4zORE0PcZksGk4DsbbFUO17bzt7tA4X7QXQnA3on82/M94yntnfkfr4zC
 pHK+3korPhQn/7KNVy0JR1nfSketVT74d2bCajDnefL88CVrXi/EPznMW
 2otPMCVni+JQWRkki7xMN0lYK0P9Xzoun1uKIR8qKmdBBjXHvlYm/3IP4
 zTRxThhEbFHbbu/AIxo7I3CFoQVYiba9awKW1tnBkgC4ZGQh2pSvecNQF A==;
X-CSE-ConnectionGUID: aFTAV4OzT+SjeqDpvxooIQ==
X-CSE-MsgGUID: CX38EARgSNG3hlgqDaPVmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88588875"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="88588875"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 23:31:15 -0700
X-CSE-ConnectionGUID: OiuqZCy5TD+oAbrNUHWnEQ==
X-CSE-MsgGUID: scsEhZwnQVGjfT6RAgsqFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="272791271"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 23:31:13 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v6 1/4] drm/xe/log: Add GUCSUBMIT component
Date: Tue,  1 Sep 2026 12:00:56 +0530
Message-ID: <20260901063059.2547247-2-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901063059.2547247-1-arvind.yadav@intel.com>
References: <20260901063059.2547247-1-arvind.yadav@intel.com>
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

Add a GUCSUBMIT component for structured SIGID logging.

GuC submit failures can still map to an existing SIGID, but using the
generic GT component hides the source of the report. Add GUCSUBMIT as
a DRIVER component and map it to XE_SIGID_GT_TDR.

Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
v6:
 - Moved GUCSUBMIT from DRIVER_FIRMWARE to DRIVER, since GuC submit
   is a driver submission component and not a firmware component.
   (Michal)

 drivers/gpu/drm/xe/abi/xe_log_abi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
index d6105520173e..91fe983ad917 100644
--- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
@@ -144,6 +144,7 @@ enum xe_log_location_bits {
 	define(DRIVER, 4, RTP, SW, "Register Table Processing")			\
 	define(DRIVER, 5, WA, SW, "Workarounds")				\
 	define(DRIVER, 6, PAGEFAULT, MEM_FAULT, "Page Fault")			\
+	define(DRIVER, 7, GUCSUBMIT, GT_TDR, "GuC Submit")			\
 	/* */									\
 	define(DRIVER_HARDWARE, 1, REGS, IO_BUS, "Registers")			\
 	define(DRIVER_HARDWARE, 2, GGTT, IO_BUS, "Global GTT")			\
-- 
2.43.0

