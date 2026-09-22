Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70523C982FA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 18:12:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F5210E6AB;
	Tue, 22 Sep 2026 18:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kIHsgXKO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BF410E5FB
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 18:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790100755; x=1821636755;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZcVjtWRrUpDCpTfWgx62Fh/o5QF/vbCLIAMVrwPCsDM=;
 b=kIHsgXKOh3RZ+u8B2fN4ZjEy1dkhy5ZlvcO805NoFYQWKH9xO2FKlzc4
 jK+udBtqxXZElMtEUJaZATsqe4McBeEdacrD5SKb/y+J08WOjgQunuP/1
 Z5fAYGB8JdeuswiDLPlRP9M++K8SleecPjZiWaFhCp3ILVq8aE/Syxpbh
 2HdxQbh7BMXXN2f3TapwadJriN36sgbF0ynHJVswC5cARomgYsN0MkYjY
 VethVKqOQnHh72K4xlk7WsojQEOZGOnSbkesk2/steBe1D/BSM3hvGIHl
 ZYHCB/j9LDnGIcGekxdD74GDJanaXr7EclC1ItBcyX1dvgWxeTg5mz5sD w==;
X-CSE-ConnectionGUID: yqG4qyjtQaSfMGZE8yUWKA==
X-CSE-MsgGUID: +TvqOvbYTcW11EQijRQfyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1236099"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1236099"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 11:12:35 -0700
X-CSE-ConnectionGUID: cTMYD4czTsS27gw2hnoPpg==
X-CSE-MsgGUID: F+IiC+9LR82zix7W6eQVOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="272721686"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by fmviesa007.fm.intel.com with ESMTP; 22 Sep 2026 11:12:35 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 0/2] Enable GSC loading and PXP for NVL-P
Date: Tue, 22 Sep 2026 11:12:31 -0700
Message-ID: <20260922181232.1111750-4-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
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

GSC firmware is required for content protection features (PXP, HDCP).
This series adds this support.

history:
   v2: Fix ordering of NVL-GSC-FW in XE_GSC_FIRMWARE_DEFS (Shasiko-bot)

Alan Previn (2):
  drm/xe/gsc: Define GSC for NVL-P
  drm/xe/nvl-p: Enable PXP for NVL-P

 drivers/gpu/drm/xe/xe_pci.c   | 1 +
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 2 files changed, 2 insertions(+)


base-commit: ff831af91674990f9f1814340860e96943d5df1a
-- 
2.43.0

