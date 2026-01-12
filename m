Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A88CF45D4
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 22:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D4A10E115;
	Mon, 12 Jan 2026 22:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JZ+HdhYj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC9210E034
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 22:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768255219; x=1799791219;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dL95FX2caEYLAE0AKgxq6hq28h+qvLpJAiCsbVXWRRw=;
 b=JZ+HdhYjBo6xvX+OEsHpLfVNZPKC+Y7cSFe41RqRhKDBeXiFqsSXe0/1
 oEUZagAzAF8Q971Twyj2nrIV2sCvVq5zRGbfRZW1JlivXo/SF445ONazb
 xmNRi13UhUii5smxC3NStzPDy7hzaYtddYndgYEw9kAF8WEbrHhkRf1gw
 WUiIafDBjlL1VVZiJVeLWMPWqfoDSlJZ1dsjkWnT0vRDgHP1VMFPtBCRo
 XjYEBiLiaMqdpC7CGR2LdV7AfqQZYIznA7kFbhSuJ5c8lKNC+aaxHZiLu
 swdTBHy7mkAVEsz0aMbTAQlI58nrBWxRbcMJRrOr5zs39LgSCzrw0+nhR w==;
X-CSE-ConnectionGUID: +ACtptcJTkm8NldPcqCMSg==
X-CSE-MsgGUID: Z+z4AW0VQ4au/HNAM7XNdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="79833165"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="79833165"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 14:00:19 -0800
X-CSE-ConnectionGUID: MOe1RTUtTra4RsnFpRy26Q==
X-CSE-MsgGUID: aH0dRGFFRfaUQz1ZWZK/wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="203366552"
Received: from fyang16-desk.jf.intel.com ([10.88.27.164])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 14:00:18 -0800
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, matthew.brost@intel.com,
 Fei Yang <fei.yang@intel.com>
Subject: [PATCH 0/1] drm/xe: vram addr range is expanded to bit[17:8]
Date: Mon, 12 Jan 2026 14:03:29 -0800
Message-ID: <20260112220330.2267122-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

This patch is to incorporate a bSpec update for 54991

Fei Yang (1):
  drm/xe: vram addr range is expanded to bit[17:8]

 drivers/gpu/drm/xe/xe_vram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

