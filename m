Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33971C25B46
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 21:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0921610E27A;
	Mon, 23 Oct 2023 21:53:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E7E10E27A
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Oct 2023 21:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698098020; x=1729634020;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Sqime8975iYnjHQfL4uLsrs5thSBrGUCQTOqY4bOQ68=;
 b=QHuvf3OrD7iDlGcwzWuRNdRSgZ5XLrbztLEpdplIEZbQlMaOW/4M+Kn4
 g4XrSiHBCfL8OQA0Zk8tZlMnZgH7BW8e2YvVno9WDKufc+HPfQA/rrKeo
 x7mrp0rf86XQnl4RvBZV6qd42gagHU5/nw+/21SZD3qWRtKCk8XWc+0Uq
 bkzbynX0rKgWx5uzj6zPHgzQfCKweS0CAz41h4gU/q86Oti68ErFXHALg
 YSRZxnA+p+ukbd8ydpwEQ1JH1TObJGO4DkmWCLdrecYzq83RD0nnpFtmH
 ymjQxmebDVSgi4Wn/ongweBGmFd4UB+c/+SE1IAV2nh13Kxarq2Wl4Uu5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="390815174"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="390815174"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 14:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="751768421"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="751768421"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 14:53:37 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 23 Oct 2023 14:53:28 -0700
Message-ID: <20231023215329.1796912-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] Fix GSC interrupts
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
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The code to manage interrupts for HECI GSC is incorrectly being
selected for GSC CS as well, so fix that up. While at it, make
sure the relevant variable is correctly initialized. 

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Vitaly Lubart <vitaly.lubart@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>

Daniele Ceraolo Spurio (1):
  fixup! drm/xe/gsc: add gsc device support

 drivers/gpu/drm/xe/xe_irq.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

-- 
2.41.0

