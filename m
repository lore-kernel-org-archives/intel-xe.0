Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E88C7EE24
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 16:17:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6059910E2F5;
	Mon,  5 Jun 2023 16:17:27 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1262710E2F5
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 16:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685981844; x=1717517844;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pedir1Po2KmlFSmURXExob3cmHMuTrngTOSfvlJtKWg=;
 b=nvsCfigjfZyIiFKmCCKe3Sjso5tKU17vE3JRrLGa+VdsubmFgQR1PvIc
 v+UkvBXNRjZMu/ZrFIHSe6gFSd1B56z7FLAt6FYwSMlWEtMMt2qMvgAq0
 cpql9RPXFZzfJXgwEILtetPl74EARhHDO1IERkkBs2fs9AiFiTMPBE27Q
 ibroyEeaXO4ofGaE+LCk4hjRNVQpojN8t+bv26dd0VABzJRIodjLEoYmW
 ocZu176OEvpPrRHYvSjz0qpqKMzRBbNUKKWI8UUQDbs2CUR5EpTGxa4jR
 mVi6UOEcSZh5qeBdN04NaoATXDUHs1il/3Dyic7+TPII3ovEBx/tFs811 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="384717131"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="384717131"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 09:17:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="708707824"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="708707824"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 09:17:22 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  5 Jun 2023 12:17:04 -0400
Message-Id: <20230605161705.3680031-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] drm/xe: Rebar resize should not fail probe
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
Cc: lucas.demarchi@intel.com, matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If a system does not have REBAR enabled from the PCI config,
the probe should not fail.

Since rebar is a best effort attempt, no failure should cause an
exit.

Rework the resize code to not exit on fail.

Michael J. Ruhl (1):
  drm/xe: REBAR resize should be best effort

 drivers/gpu/drm/xe/xe_mmio.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

-- 
2.39.2

