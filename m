Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1C6CCD18C
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 03:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C2D10E05C;
	Mon, 13 Oct 2025 03:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E5la9oBe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166BB10E00A
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 03:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760327177; x=1791863177;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ynDTZvgcbamwop12i4vwe3UjOPrUjGVVcPP5utTBL6M=;
 b=E5la9oBeBQcwuyahfPycwAyFtYPL9LDKdVkJPj0XQNOnW4j00b1NUql4
 6XvI4dwEAplujYo5UybMcTkiEVhBK9/N51HXLOLn3lhY6jKqXDTJz/qxh
 X69AxiP/UpHXn5TRY6VHaBA9Vnak3oeuW7/bf3Imf9RZSx4xKKftdfbZQ
 FiskQd2lpHDavVdB7f6yQzBcjzHkO7w2xBmG6RzLtcYcUNnl3SiltXamh
 noJOApK4hujhRmj3qaqoa3yGj0Pi8u2kdO8XSlEi/wwQhwV5lCmvj3asI
 CfD7kX3dNpFfQLo+J+oin8qMbwFJVcjU9m+s48P7/8KHAA0M8RYYn2fnX A==;
X-CSE-ConnectionGUID: SIQCTWSUQA2xQGMoIoMd9w==
X-CSE-MsgGUID: esyNdT/LTBSBsnm/zSD6Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62558984"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="62558984"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 20:46:01 -0700
X-CSE-ConnectionGUID: X4mTE6RvQc2IbehwBUwBsw==
X-CSE-MsgGUID: Ok7qQdP+TLaVu1Oy13AHaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="181060417"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 20:46:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, matthew.auld@intel.com, simon.richter@hogyros.de
Subject: [PATCH v5 0/2] Different page size handle in migrate layer 
Date: Sun, 12 Oct 2025 20:45:53 -0700
Message-Id: <20251013034555.4121168-1-matthew.brost@intel.com>
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

Handle non-4K PAGE_SIZE and use 2M GPU pages when possible.

Matt

Matthew Brost (2):
  drm/xe: Fix build_pt_update_batch_sram for non-4K PAGE_SIZE
  drm/xe: Enable 2M pages in xe_migrate_vram

 drivers/gpu/drm/xe/xe_migrate.c | 79 +++++++++++++++++++++++++++------
 1 file changed, 65 insertions(+), 14 deletions(-)

-- 
2.34.1

