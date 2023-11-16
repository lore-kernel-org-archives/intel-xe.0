Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625B3C47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 21:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE8B10E2CB;
	Thu, 16 Nov 2023 21:40:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FB410E2CB
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 21:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700170827; x=1731706827;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zvr5e7zhVECTMAK5l3S4o9YH5bBwUgtjbecWsL8Nou4=;
 b=k+JJZ8Sc8dz8N9+iXpeBHp/R6RyE0illKh1UNUaDZ9GEgYPZia5jEAL+
 huE6Z4s4Coum686D/ca+r7onE9rgXLGTALi1n7KQwaY6ckQVA4RFBl9G7
 133l+ZiW7CfRzetwTpWgzROxhk9hYuGdQ+PDGlJsPHuQPuCeLuR061R/j
 esb2BKivOMtLGpkxlx3P8Jzupe68y7xNOQy0/86fJX0SvVSU+bMR117oq
 j6Lizy2SvebRYbqN+t6BxXtm+B31P/ZjYluQI8NGh4VGX1r3/lihw+Ktu
 LThE6zR6qeSM70/IYrzFCNc2FBhX9xNW3cavytRVjmySokOu5HZZCAKoE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="4263176"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="4263176"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 13:40:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="13261075"
Received: from tjlunife-mobl3.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.255.34.202])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 13:40:12 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 18:39:58 -0300
Message-ID: <20231116214000.70573-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/2] drm/xe/mmio: Make xe_mmio_wait32() aware
 of interrupts
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The current implementation of xe_mmio_wait32() is susceptible to
preemption/interrupts causing false timeouts. This series proposes a fix
for that.

Changes in v2:
 - Add a patch moving xe_mmio_wait32() to xe_mmio.c
 - Use a barrier()-free implementation.

Changes in v3:
 - Tweak documentation for @timeout_us.
 - Add note in the commit message to better justify the move of
   xe_mmio_wait32() to xe_mmio.c.

Gustavo Sousa (2):
  drm/xe/mmio: Move xe_mmio_wait32() to xe_mmio.c
  drm/xe/mmio: Make xe_mmio_wait32() aware of interrupts

 drivers/gpu/drm/xe/xe_mmio.c | 60 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.h | 39 ++---------------------
 2 files changed, 62 insertions(+), 37 deletions(-)

-- 
2.42.0

