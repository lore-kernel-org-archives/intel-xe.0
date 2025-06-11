Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5B3C7113E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 21:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E872210E738;
	Wed, 11 Jun 2025 21:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pn5oZzsh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26E510E733
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Jun 2025 21:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749675955; x=1781211955;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O4v0r5hBFRjaDI1iGg+q0W7YUKoZt2VzcG6SsGzNJpQ=;
 b=Pn5oZzsha5eE022lOPTiObTciNQ6+02ZZU2sKlVF4HLEjeMfaLsHvgdX
 Z0rSM9fa8Sd8IFL/mQL0I8l5FnhLZrV+mztZdMqqAy2pErwFe8swP+h+E
 C2B7+JHSAfNglWPGvciLLmrzAFTqRFbAIrTuuaENVK9xVLz2i0mG0iQV8
 syD7fWinTmsgC4j8GKnCjazq2tcFjq/nTL5s4AEkG3eJsNgn0ZwrD++o+
 NhxwsSuQEWXP2zOne9epYs+skiG1pJgD3UsxQ4So/4iYzL46Q6VH5zjqV
 MfQ7/KjSlKynX4+5o7fS8lPiErHUFnlIg0ycrLQCh2LX2j0xQeXWE/jd2 A==;
X-CSE-ConnectionGUID: gyv4/VgRRdOTHXUuUwTu6g==
X-CSE-MsgGUID: osErxEO6RmWd75TNQRd2zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="54462479"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="54462479"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 14:05:54 -0700
X-CSE-ConnectionGUID: es/psdJISei/+84qh0reHg==
X-CSE-MsgGUID: IXSfDYaKSIWdXWHYQ8RHAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="152198734"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 11 Jun 2025 14:05:53 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/2] Clean up of GuC init data macros
Date: Wed, 11 Jun 2025 14:05:51 -0700
Message-ID: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
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

Code cleanups and add support for a debug feature.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe/guc: Clean up of GuC 'CTL' defines
  drm/xe/guc: Add support for NPK as a GuC log target

 drivers/gpu/drm/xe/xe_guc.c      | 25 ++++++++++---------------
 drivers/gpu/drm/xe/xe_guc_fwif.h | 28 +++++++++-------------------
 drivers/gpu/drm/xe/xe_module.c   |  4 ++++
 drivers/gpu/drm/xe/xe_module.h   |  1 +
 4 files changed, 24 insertions(+), 34 deletions(-)

-- 
2.49.0

