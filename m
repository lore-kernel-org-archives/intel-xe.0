Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ACCC0218D
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 21:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410FB10E1B7;
	Wed, 22 Jan 2025 21:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hvhxo7wk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F78310E066
 for <Intel-Xe@lists.freedesktop.org>; Wed, 22 Jan 2025 21:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737582363; x=1769118363;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AAvYUkzmv7pG48EQVs/tZJGfKYUi8u9zfntBROycUoo=;
 b=Hvhxo7wkoemXuATmdh6wsixn5mvbU2F1jP6lsDB2AhjpIxcoyh3wV8zG
 RQNXbJYUNdg7d1DtZliSDav7aWAZN3/Ua7Cw2F2BDWZUeOZOPJr1eMiJn
 wQNcuOJt3CMR+VSY1Ze8BZpyVBK6g1fdwLixpvTZW55iuNx1xEXG34HjU
 5rsGNVNFygVXGQflyG41OWTWs5P10Jh34qQ653KYAsVvwliVqTeZ2HJvu
 T17reoOymRq/1K3NnEbGTYX/Elue9qojsl6bn5hPyVwWgER5JymP4c5fS
 R5N/O9T0QJE3398CoJdT6QrGVfAsh5DgEWdRWUQZwUPmKJPAnjucHpXK2 g==;
X-CSE-ConnectionGUID: VHG/4jj4RB6Jg6gJNTG2wA==
X-CSE-MsgGUID: vlvtc8LEQRCgcpSSlwjxkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37947606"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="37947606"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 13:46:02 -0800
X-CSE-ConnectionGUID: 8oQH3VWIRca/exjV4wGLzg==
X-CSE-MsgGUID: rQXiURjLQU+0NVmXsVImZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="112239266"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa003.jf.intel.com with ESMTP; 22 Jan 2025 13:46:02 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/3] Re-instate GuC logs in debugfs & devcoredump
Date: Wed, 22 Jan 2025 13:45:58 -0800
Message-ID: <20250122214601.3560156-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Remove the appareance of line wrapping in the GuC log output to
prevent confusing a mesa tool and re-instate GuC logs in both
devcoredump and debugfs.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (3):
  drm/xe/guc: Explicitly name each chunk of GuC log data in a dump
  drm/xe/devcoredump: Temporarily disable the line wrapping of ASCII85
    output
  Partially revert "drm/xe: Revert some changes that break a mesa debug
    tool"

 drivers/gpu/drm/xe/xe_devcoredump.c | 12 ++----------
 drivers/gpu/drm/xe/xe_guc_log.c     |  4 +++-
 2 files changed, 5 insertions(+), 11 deletions(-)

-- 
2.47.0

