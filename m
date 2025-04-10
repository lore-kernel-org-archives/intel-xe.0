Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ACBC369A2
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 16:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7F910EA1C;
	Thu, 10 Apr 2025 16:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PqWW9SRq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D06510EA03
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 16:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744302081; x=1775838081;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=15i4webBmU1aljosGUQ7csmwJayW21L+eccyyJ0OUgQ=;
 b=PqWW9SRqE6aaQ/tXCLQUsmK7fOzXV6UdNLtCjr/Uux9V2LUFqATMRrLH
 lydnW6ztD0zsHRfIoCIopjhixVFdNoC0TzrCWpUBvirS8NlJW8rE9so26
 Qewtg+CH8iErG0pajW+i2Z2I7d+bYu8vHmIslGWMi0t+7fXcmxzy39uw9
 85PguphUZYQhTU2TXrpKqVJH09NtnwSrP/WeeYT1UMLGBs2dVCZsv+oea
 jrZ/6jZ2hi/S5mwjk6z7yzlc5dLyRud7Jfaz1BSATorwUWpDFzoTp3sPi
 0Zdb1dbrlVTXW07kWsjeKpzjUhFxAAZsBYMlXZxl6OhXVo3MI+DIcVjkL Q==;
X-CSE-ConnectionGUID: cPS+frIyRSimYG1IQ3zTTA==
X-CSE-MsgGUID: WUk2JYyWTMOF1mCQc4RqYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45733763"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="45733763"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:21:20 -0700
X-CSE-ConnectionGUID: T93alJZdQ0m000EFZhKbuQ==
X-CSE-MsgGUID: qsMrp+gjTXK6TyC67jIRkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129490550"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.125])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:21:19 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] PM notifier
Date: Thu, 10 Apr 2025 17:20:17 +0100
Message-ID: <20250410162016.158474-5-matthew.auld@intel.com>
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

-- 
2.49.0

