Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35A6CDD1CD
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 16:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C72410E211;
	Fri, 27 Sep 2024 16:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9Zqh+J2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656EB10E211
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 16:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727453591; x=1758989591;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ry9rDtGzUFQl+sVWmJC4xHzeeem3XBlojK6kSZvH+gI=;
 b=e9Zqh+J2giu4PVY1vF0Lg/i3FTaEJUdmIY4vYqyu3cBqkM+Mxb4Psfao
 pZNKfiydTHkY5vy3FyAlZ0gg0MQGqLKLKwYWvuHDuPZNcCw7jjygntrB6
 ZuCttxs8TKO9QlcGxWWb/2pCPAAXQfcUevd1hyqUaIci2kTEZ93jVtFC8
 9FszN6zvTl5HEe37NNxr1L3I6h6+zz0WdiVViNDOe24Z64H80iJeQBOJF
 kZgRPyQl1XtZyYUyk1Ohk2twwnOcWyitvh5w8A5d0MzeBr6d56nGcB2yM
 ftggyjCg8fdltW3lg97mcH5Zun5uqmxZZOr7+0RpO/aepFjwVX7hC6C2D w==;
X-CSE-ConnectionGUID: y2uY4XUjTUudWPSoUR4CXA==
X-CSE-MsgGUID: eTzvlY0UQH+s6Zhn2+qpcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26736447"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="26736447"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 09:13:11 -0700
X-CSE-ConnectionGUID: UXgYrxCnRii9uiCDxg1dJA==
X-CSE-MsgGUID: 0pOqnhuoQQOLeIVJTDX1Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="72740163"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa008.fm.intel.com with ESMTP; 27 Sep 2024 09:13:10 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v4 0/1] drm/xe: Prevent null pointer access in xe_migrate_copy
Date: Fri, 27 Sep 2024 09:13:07 -0700
Message-Id: <20240927161308.862323-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xe_migrate_copy designed to copy content of TTM resources. When source
resource is null, it will trigger a NULL pointer dereference in
xe_migrate_copy. To avoid this situation, update lacks source flag to
true for this case, the flag will trigger xe_migrate_clear rather than
xe_migrate_copy.

Fixes: 266c85885263 ("drm/xe/xe2: Handle flat ccs move for igfx.")
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Changes from prior revs:
 v4:- Limit commit message within 75 characters per line
      Minor commit message changes
 v3:- Update commit message to include Fixes and issue stack trace
 v2:- Drop changes in xe_migrate_copy
      Update condition expression as suggested

Zhanjun Dong (1):
  drm/xe: Prevent null pointer access in xe_migrate_copy

 drivers/gpu/drm/xe/xe_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

