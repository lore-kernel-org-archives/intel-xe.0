Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86646C369C4
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 15:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A6A10E967;
	Wed, 16 Apr 2025 15:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFsQ/0JJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4254210E967
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 15:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744816169; x=1776352169;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DDBXOo/nLLRJ5HsVtCzNa45jzdc1zxxDjthdLefTWKM=;
 b=IFsQ/0JJRRZwl9wQz/DYWH9CTtMStKgZidVxJob0duM2Dp5+vIzR0u5U
 PvtZY45cGfJWqNfG7mWckxQvMfdTchS/sRZ7W6eFRAPtNacttKVySmNRE
 01l2drZwbs/Yor02JVpwo87QNwkWdAYLxvMwu0TnhSsNs+YlEIr0xOH06
 a3FbJB83acGfdxf/hJ0U5kYvzGaSCYYx2phjA1ZaI5LZl5rIJxbS4kucU
 lSIoeLOPai416j4lKGrAOqPsjTwOvBG3O3ZjJhmSt4W0Kq3fXt9+g/Cmp
 4cyUpPTaHIJ/bt2LZRe19wK4hY5cOLFwmcepWVI0GW7Is9RakrwF5tDDW Q==;
X-CSE-ConnectionGUID: jDaNQBZ8RWWuRBy/dgWNgQ==
X-CSE-MsgGUID: MG5tx4vlQ3+FQSpTSwvo2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46383157"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="46383157"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 08:09:27 -0700
X-CSE-ConnectionGUID: F9GMV1cnRvq5aT7nJ1zqEQ==
X-CSE-MsgGUID: EtEZ4FVUQ32f8uZ+bTwoLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="135495905"
Received: from ettammin-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.11])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 08:09:26 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/3] PM notifier
Date: Wed, 16 Apr 2025 16:09:14 +0100
Message-ID: <20250416150913.434369-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
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

Hook into the PM notifier for VRAM eviction (and pinned handling) prior to
s3/s4. Currently we are hitting issues with allocating large amounts of
system memory directly in the .suspend() callback.

v2:
 - Improve the pinned handling and make the shared dma-resv more robust
   (Thomas).


-- 
2.49.0

