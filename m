Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCDFC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 21:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132FF1128CB;
	Tue, 28 May 2024 21:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g9aeYohI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75571121F7
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 21:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716933333; x=1748469333;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VHD8FzoH6oIoNVtQOfK4aQ4HTCC7WH7DsOfPk2qnVlk=;
 b=g9aeYohI59XQjtufixzQCON6lCwZJTF7b4guUbnWONoPOktSPJhG3EZI
 OlBHBbxkd+sg/86JF61+RLzYde+o05vXuEIbc3R92QnF5IGB15vUlwjGm
 tGmL+3zpUE8HRKCPB87hk+1Cin57w+Gl4zxzcKQGVcBDH+WYLVU8knWos
 jPIjz8OHu7SJOhVfaT1RfYrXVKR+hvlgW7+jXnBRWd8Sg3Gc6M6DJgnha
 pGsh2UgQ9pSVQkmUIRsDX/fQTsNAVji97x6/H8DWje2KeMdfi0ENtkcXX
 z2lgvpZTq8NF70zVwFeTcifZTxyEeHPNiBG5I94JU8TIo0ZKc5QItBR1q A==;
X-CSE-ConnectionGUID: dJakygW2SuKtksxgCnK9Ag==
X-CSE-MsgGUID: VHrFE7zhS2q7J/QJ/v3YgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13079774"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="13079774"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 14:55:32 -0700
X-CSE-ConnectionGUID: Y0HGvoKIQTW3HvoQULcOWQ==
X-CSE-MsgGUID: R0W0TS86Swm49HK1PfXjJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="66399957"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 14:55:32 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 0/3] Test GSC loading with Wa_22019338487
Date: Tue, 28 May 2024 14:55:20 -0700
Message-ID: <20240528215523.1202083-1-daniele.ceraolospurio@intel.com>
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

In my local testing I wasn't able to repro the hang we see with the GSC
loading with Wa_22019338487 applied, so sending this series to test on
a bigger pool to confirm if this indeed fixes the issue or if it was
just a timing change that managed to avoid it on that particular machine.

This series is not meant for review. The WA is in review separately while
for the GSC we'll just drop the revert from the for-ci branch.

v2: include a fix for component unbound (which has also been sent on its
own for review)

Daniele Ceraolo Spurio (2):
  Revert "drm/xe: make gt_remove use devm"
  Reapply "drm/xe/gsc: define GSC FW for LNL"

Vinay Belgaumkar (1):
  drm/xe/lnl: Apply Wa_22019338487

 drivers/gpu/drm/xe/Makefile        |  2 ++
 drivers/gpu/drm/xe/xe_device.c     | 30 +++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gsc.c        |  8 ++++++++
 drivers/gpu/drm/xe/xe_gt.c         | 16 ++++++++-------
 drivers/gpu/drm/xe/xe_gt.h         |  1 +
 drivers/gpu/drm/xe/xe_guc_pc.c     | 31 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_pc.h     |  2 ++
 drivers/gpu/drm/xe/xe_uc_fw.c      |  1 +
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 9 files changed, 81 insertions(+), 11 deletions(-)

-- 
2.43.0

