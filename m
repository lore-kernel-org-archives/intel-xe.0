Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1FFCA5FFC
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 14:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E69410E300;
	Mon,  5 Oct 2026 14:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clrcV3YK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAD110E300
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 14:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791211268; x=1822747268;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6aOO0pvCqeB3iws3qyNBwBih3KY2E3TA8EMseGyuNdU=;
 b=clrcV3YKd4fcmapPEH5coMO5Y78zVZs6rtoCI/qIr2ukmChkZJPOP19A
 CmMpZSF8VmS0cYfboDlQ6dZbqBAB1qlij3G26dftEJTuMS79ON+T9cvBI
 ACEHdCY0HdIJtHgiMGgThtxNzsylc14sZrkq1X2/DPnI94Djvv1j+DYNy
 aMeu2iX3OTuugCIy6jtxbGl3VzrRjCNxLKD4MKyQSqhsAPPCPq5lFp0ag
 aehfGGrdUl+dJNs9eHM0h69WAffD8XnhXAWkVkrpwHjL+2USSTwFk9wTp
 Pe/f23JFeiE/Hnbvb9PIFDmvrVXPybS3JPMtKU4YTx2BjXPrYY/6OGcdz A==;
X-CSE-ConnectionGUID: ACa3Ve6lScmYXl3kqNZarQ==
X-CSE-MsgGUID: lLYLJKR4QQeDBz3pbzfoHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="90918290"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="90918290"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 07:41:08 -0700
X-CSE-ConnectionGUID: jfNxMgkUSO+he+8Yx9UiGw==
X-CSE-MsgGUID: fpJ8Hwp+TnqnQ4rL6hFJ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="276961722"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 07:41:07 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] Async RPM with shrinker
Date: Mon,  5 Oct 2026 15:41:00 +0100
Message-ID: <20261005144059.1569162-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
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

RPM core supports async resume requests via a worker. We already use
this for suspend requests, which underneath use this same mechanic. With
that we can replace the get/put dance via custom worker in the shrinker
with a proper async RPM get.

-- 
2.55.0

