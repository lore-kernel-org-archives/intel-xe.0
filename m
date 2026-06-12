Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBACBCD98C7
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 03:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9856710E916;
	Fri, 12 Jun 2026 03:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQvd5Lq7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7147E10E916
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 03:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781234875; x=1812770875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IBFiuA5cFKSlxNkfQWE8nW0YS89e5HO1YJnozsaUFVE=;
 b=aQvd5Lq7F72EngNWsnWk08yA0DorRuxK1n721q47HsuLmLRpJf2IRmHr
 JM8g1MzBDoJ8yDr1Fz9VTXJEfXBp03YzVuB222fUNEPTBeF6FcayLTJM2
 Ly/8h6eY6LCpEugLcN53IXANjCGJkoa6Jx92b+7l/mEvuFIwaDtOy05jW
 x7rUW8DLMpN2Jkkhe0aXP0gbpDRSJR8VQSqAQMZM42Ro3z95c1pzblwRW
 6B3ySs1h1cl1A7LvJjU+uabT47CnZj7Vs5sCQjEc/BbaFvaz6zaDJibDs
 CiZM/gzJ25YXsjIj8X3VAm/AljJGM6TVvHM0nPGfZ9TehBZKIJBdUAEAC Q==;
X-CSE-ConnectionGUID: IaTySiC6RMuA9Qp1he6gSA==
X-CSE-MsgGUID: 3cLnzcfoRfGGVloeGCAp2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85902931"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="85902931"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 20:27:55 -0700
X-CSE-ConnectionGUID: 9ejgQQaDSzKF2ybwDWm0CQ==
X-CSE-MsgGUID: cxf8jrHTTLyD9860GPeX5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="251789702"
Received: from adarshdx-mobl1.gar.corp.intel.com (HELO
 soc-5CG5233SZH.clients.intel.com) ([10.247.178.18])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 20:27:53 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: umesh.nerlige.ramappa@intel.com, matthew.brost@intel.com,
 intel-xe@lists.freedesktop.org
Cc: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>
Subject: [PATCH 0/2] drm/xe: make CTX_TIMESTAMP TOCTOU-safe and handle
 sentinels
Date: Fri, 12 Jun 2026 03:27:46 +0000
Message-ID: <20260612032745.179673-4-gajendra.uttamchand@intel.com>
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

From: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>

Fix timestamp handling for Xe LRC contexts to avoid races and false
timeout detection. The first patch documents and centralises the
CONTEXT_ACTIVE sentinel and makes MMIO reads of CTX_TIMESTAMP TOCTOU-
safe by verifying the LRC-stored timestamp before and after the MMIO
read. The second patch treats sentinel values (0 and CONTEXT_ACTIVE)
as "no elapsed time" and adjusts the delta calculation to handle the
32-bit wrap, preventing false TDRs when the sentinel is observed.

Uttamchand, Gajendra (2):
  drm/xe/lrc: document sentinel and make CTX_TIMESTAMP read TOCTOU-safe
  drm/xe/guc: treat sentinel timestamps as no elapsed time to avoid
    false TDR

 drivers/gpu/drm/xe/xe_guc_submit.c | 17 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_lrc.c        | 29 +++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_lrc.h        |  7 +++++++
 3 files changed, 44 insertions(+), 9 deletions(-)

--
2.43.0

