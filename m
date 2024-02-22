Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDBDC48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 19:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE2B10E0A0;
	Thu, 22 Feb 2024 19:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ff7z2LMc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CD810E0A0
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 19:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708628774; x=1740164774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C3ryxZ2GHxWr8VHpiEXnh98g7FE6PsLGk51pRBrdX1s=;
 b=Ff7z2LMcIfPGHVDsKjRh15yeQWkiMIzjqLffeA7/JLfVOXqEPm2F8p0o
 c3Pi4PB66+D/vV66hpox2PqJ6d43ypTsAgH1REpDpg8a+tUufTBAjTTah
 v2cFJP4SZXtz0fK6UYb6gR6oeSzhiWb6lwHKZqDbkz3Kzb6LZPUXuUZrQ
 923Lf7g0aUYuo/W7j1AG3Ipn/alllze89cx7Hm4VJq6dUjF8ip25K2+s9
 s6BjSGq2u5Zlr6uTLCN7zPp9OsOVoqH9pD7GtMS4eYPj/gPdm9ZLyxCZt
 5Wzy/vL6PJCsvvQrT2vWqpMYWnHxko+MC0vhSvQDPeeBPjPsm/+JbruvF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="14303969"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="14303969"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 11:06:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5568324"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 11:06:14 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH xe-for-CI 0/2] Update PVC GuC FW
Date: Thu, 22 Feb 2024 11:06:04 -0800
Message-ID: <20240222190606.724747-1-daniele.ceraolospurio@intel.com>
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

Move from 70.9 to the newer 70.20. Since this is targeted to the CI
branch, we can drop the existing commit and replace it with a newer
version instead of adding a new patch on top with the update. The
dropping is represented here with a revert, but a merge time it'll be
converted to an actual commit removal.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Daniele Ceraolo Spurio (2):
  Revert "drm/xe/guc: define PVC FW"
  drm/xe/guc: define PVC FW

 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

