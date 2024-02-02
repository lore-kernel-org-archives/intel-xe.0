Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359E3C47258
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 07:33:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C098A10EB60;
	Fri,  2 Feb 2024 07:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="afR7/SsE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4AF10EB60
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Feb 2024 07:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706859213; x=1738395213;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D4d+SfsYRDtg8APPKhE/d/VrD4ZOMU5qn1y7wZ4OXsg=;
 b=afR7/SsEJqx9sfIS67XDffAetJ8IAnTyEZ/jcSLgsshV87q4qLqK3ZRD
 gqIRNCcEzPnj7dyL0yfIP8B6YjPZgxhHa+p0uSJkYl0z0qp/BmBElhdCd
 fufQmkP6sB4pP/OlhOQGqeDCYigtkLAL7ynuf1sengZKL9aSxk3Z+Dci7
 ey2V/xM09AMV3KZ4RX++kb0ilKFXjsI4fitMUld1oYQGZBCThB50F63fh
 B/6m/PgPzGc67hotLzQXHQ24caKGGfqh6qU8QjqW2UXI2XiBLOix9UqLV
 9Xh26akvjabzyteB1HjWapEkr1i5FKmmzquCn374BsKjZxcJWc8dd0D4S g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="3026065"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="3026065"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 23:33:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="4634261"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa003.fm.intel.com with ESMTP; 01 Feb 2024 23:33:33 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/3] Update to GuC 70.19.2 and add LNL
Date: Thu,  1 Feb 2024 23:30:47 -0800
Message-ID: <20240202073050.1986142-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
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

Update to the latest GuC release including the first release for LNL.
Also include the patch version in the expectation check as it can be
important.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (3):
  drm/xe/uc: Include patch version in expectations
  drm/xe/guc: Update to GuC firmware 70.19.2
  drm/xe/guc: Add support for LNL firmware

 drivers/gpu/drm/xe/xe_uc_fw.c | 50 ++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 22 deletions(-)

-- 
2.43.0

