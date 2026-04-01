Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E956810FCAE8
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 21:26:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE08C10ED1D;
	Wed,  1 Apr 2026 21:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6QpZAGd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA51410E105
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 21:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775078802; x=1806614802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZyJQp0eALWFJTF5st0DrCB5otviqlT0PltRC82f+cvQ=;
 b=c6QpZAGdAsXYEPAWKpSGtOVuaASK5gxK3o+cZxOMLEHSGUglQjBj8u5N
 /UqvJyFu4xunHdKq9PYetS43vjKYc+uMnNfoCo/lqyXckGrf/1txh6pJH
 M08q0jILMpjieiTWuQdoMEoq2h3oGHt9V9elkrlfhs0Ak0IAN0/cCq9bs
 xj8z8w6RMgm44nHmaSzDC439ANaHUHzt4wehRoJ2XWEhliVT8QFoHvcqF
 hUGKZVvYehaSfW6uHZ/uUK4FrrTJ44tA6gOHq9OUbB41WHxWOyh4mP43z
 upRmt1TIpt18K+6ezpZB+IhOfsE80QAI1ng9khIpPW+yz3THWBlw/uhfu w==;
X-CSE-ConnectionGUID: G+nsmllWRtKu6FEJre9ezg==
X-CSE-MsgGUID: u7k86sxmQBm1p4QV8quTEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93520489"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="93520489"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 14:26:42 -0700
X-CSE-ConnectionGUID: zkopLBADSnC/lQtX5AbIDw==
X-CSE-MsgGUID: KNbRIEDaSf2FkVCUoYIERw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="223498616"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa007.fm.intel.com with ESMTP; 01 Apr 2026 14:26:41 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v4 0/2] drm/xe: expose multi_lrc_mask in debugfs info
Date: Wed,  1 Apr 2026 14:26:35 -0700
Message-ID: <20260401212637.732424-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324212348.4142888-1-x.wang@intel.com>
References: <20260324212348.4142888-1-x.wang@intel.com>
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

This series improves the debugfs info output for xe engines and exposes
the multi-LRC engine class capability.

Patch 1 replaces raw numeric engine masks with human-readable engine and
class names in the per-GT debugfs info output. This avoids requiring
userspace to duplicate kernel mask decoding logic when validating engine
capabilities.

Patch 2 adds multi_lrc_engine_classes to the device-level info output,
so userspace can inspect the device-level multi-LRC class capability in
a single place.

Xin Wang (2):
  drm/xe: improve readability of debugfs engine info output
  drm/xe: expose multi-lrc engine classes in debugfs info

 drivers/gpu/drm/xe/xe_debugfs.c | 40 +++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

-- 
2.43.0

