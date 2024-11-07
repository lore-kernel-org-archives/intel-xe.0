Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F43ED4336D
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 15:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0EE10E032;
	Thu,  7 Nov 2024 15:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d04Cg1wh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF1310E032
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 15:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730992441; x=1762528441;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=umVnKGeELqHv3PWnDcIw9yiJk7MQYqyINEdnt1uxzoI=;
 b=d04Cg1whbSP6ql19pTHJfshsA875pkgt2zyguMiO55OmN6TIa8pM2VvI
 79gCqki277/nFNHYE65vDquUgT9BLq43vmI8RHu8z1j5gfqAstXEuNXgw
 m46/P0YjhMXL1nrPcvaeyLAljv2tH06OipJx72r0n4gFC51wpqNb1SgVr
 gHI0ESOP5YKmikQYa6/B+cnmKDgNh9i3SFCneJYpnTeGqCSSaHdkeY9pH
 Y8I0Ma/LeHKZH3Vrr7ZusIKb7Vr26Ep8gwwJo8IV3O0k+dIhVqVgZxhQt
 gFxQYHoavIwyahrRdwPL/PrkLRbpuYk998fdkE/rqOnZKRBCEb03t5utC Q==;
X-CSE-ConnectionGUID: Q6yMt0Y4QHKkNqfKVo9KiA==
X-CSE-MsgGUID: 56sSYRWIR9KtmgvQ7TjFRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31013250"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31013250"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 07:14:01 -0800
X-CSE-ConnectionGUID: 2gB6PM2+SCWfGvQ92w0FjA==
X-CSE-MsgGUID: J3FpsICOQmuXBPFjUY35bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="89922546"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by orviesa003.jf.intel.com with ESMTP; 07 Nov 2024 07:14:00 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v1 0/1] drm/xe/vf: Post-migration recovery, remove MMIO assert
Date: Thu,  7 Nov 2024 16:13:56 +0100
Message-Id: <20241107151357.1623733-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This is an addendum to series "Post-migration recovery worker basis".
One of the changes supposed to be in that series was lost while
applying changes during review.

This series includes only the patch which removes the excessive assert.


Tomasz Lis (1):
  drm/xe/guc: Do not assert CTB state while sending MMIO

 drivers/gpu/drm/xe/xe_guc.c | 1 -
 1 file changed, 1 deletion(-)

-- 
2.25.1

