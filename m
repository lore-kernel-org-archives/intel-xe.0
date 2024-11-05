Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25046D1CA14
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 00:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A9110E4F4;
	Tue,  5 Nov 2024 00:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I67JFgUg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4335F10E157
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 00:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730767085; x=1762303085;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gBQ+eN7YlE7b1SsAWIPx1sMSRB2PZiSM2wXPkLJ6Huc=;
 b=I67JFgUgDBEyHAkeZ/2vqJ6YJUNEGqgQ7JHJLGdoZnuOO1IGEG1fHzny
 7UTzLRsDC9w38Zqj1kX1P+DsKuPN3+THyZ7Zv9uedluB7r+m4pYT5prqM
 DTjc2606AVseNooSFhy9Kl6XVs3zKj6qTJrDZfmEFnlpH9JmpEiH+3DcA
 DUzYg4+OtALkgMY6nNaAb1spGSn8aH/ucUYGlLxd4DdTlgqm1CDUAzoPv
 V8l6kwLq/Kbs90FfRgTgI+5dlAl7147h5lvKhMMHkloqU1IZhHn7KrHX9
 C33859lRZH/fC7uQlmVGMxukta2NUBz5WpElYr3clIRiijo6apK1awo3u A==;
X-CSE-ConnectionGUID: gwH8qN8VQLKd+/Isg/ohrw==
X-CSE-MsgGUID: CCZs5g4EQWizctp4G+1S6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34181156"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34181156"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 16:38:04 -0800
X-CSE-ConnectionGUID: c1VAI3rlQhSXZreZQlOJFQ==
X-CSE-MsgGUID: qEWDoBX0Sf6z98+SGLY54w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="83756447"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 16:38:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] A couple exec IOCTL fixes 
Date: Mon,  4 Nov 2024 16:38:29 -0800
Message-Id: <20241105003832.4021758-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Noticed a couple of bug in exec IOCTL while working on something else.

Matt

Matthew Brost (2):
  drm/xe: Fix possible exec queue leak in exec IOCTL
  drm/xe: Drop VM dma-resv lock on xe_sync_in_fence_get failure in exec
    IOCTL

 drivers/gpu/drm/xe/xe_exec.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

-- 
2.34.1

