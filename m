Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D179CA5FA2
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 16:49:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EF310E93E;
	Mon, 28 Sep 2026 16:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eHi00xMz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534E110E103
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 16:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790614139; x=1822150139;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MWBy/w4/315ce0nhPUDfryGvQypq17uEcdZLw72qS8E=;
 b=eHi00xMza5mU9MDodqGu7dQ8yNeDwheUMyIG+l27eYR9h4/E5fu3fleC
 oRHinm6e+hioTibS+0gi+EtD/FJ+yvYnL4BYhYk4349AzdTND10bn3je2
 nl0tkmDK8H5+WHYnnIH+GMhNSNNEq8CRlBenqeFt9QKm4/LdORCU/GNME
 /yhnpFYp/t1d4bRqWjOsv+u5wHi6JluA33E67D9eu3NkhAJN+Y6uZqxMI
 E9ZPGBxh3v2RCmfHrnx067dGkiDY1DxRcMpv5EAMmTS0aSC/S0/u3UScy
 oXpwO7YoBbysmI7CkWJflUsamrnGALO4XKTjFyN/0GIMqYEWxgze5SgCN w==;
X-CSE-ConnectionGUID: bcsWtOqBRbGMjpYmutY2hA==
X-CSE-MsgGUID: elWcKCkkQqq0+PbaIXUSlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="116845559"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="116845559"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 09:48:59 -0700
X-CSE-ConnectionGUID: uGMxhgltSvqsqGUOirUXng==
X-CSE-MsgGUID: 3iuDIfirSUKXdq8rCpeDJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="301404237"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.80])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 09:48:58 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] sticky TT
Date: Mon, 28 Sep 2026 17:48:21 +0100
Message-ID: <20260928164820.1237049-4-matthew.auld@intel.com>
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

Try to fix user reported dma-buf perf issue:
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9415

-- 
2.55.0

