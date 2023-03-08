Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176DFC64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 12:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE45E10E10F;
	Wed,  8 Mar 2023 12:30:30 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C439210E10F
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 12:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678278628; x=1709814628;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X4ynV21OAPV9QaYq7R2BqJTvwDJR5n3pr9aBYCWPh0E=;
 b=Aah7DD+Y0dreoGSFaKYYymTe4lHjYzXMJspiEjWAh1zJPAJK9Td0h97H
 ju2ks0mny/+Q93SR5UEImpqmn4BB8iZCmqML4eMf7rhies49uR7bQcRyp
 GuPvJDrhS12Lz7FVu6DaSD5dUYEwRWCkjDhbWc3EKOeymwyfD2wN6Nnzc
 qJZNdK+BjC+MxXUmQQQvSX2fj/yPL0PKA98mk9Liz2P0VMXXrMubPE9cI
 0xtAhSISS1gSKeOaZHY5TeLEtJ82nmzXllILFuQOrbztjEXEAlgurzcqj
 sGriaXVt/tIJaxpVAtPMUfiC6a1FoZSta2zuCia6tIrxQ0U58OciJezoT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="324452362"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="324452362"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 04:30:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="670312550"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="670312550"
Received: from jlenoir-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.24.168])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 04:30:27 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  8 Mar 2023 12:30:06 +0000
Message-Id: <20230308123012.247091-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/6] Some small-bar prep patches
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

Split from the small-bar series. Plus one extra patch to fix the overloaded
meaning behind xe_ttm_stolen_cpu_inaccessible(), as pointed out by Maarten.

v2: Apply s/lmem/vram/ for the entire driver
v3: Try to simplfy the stolen stuff by removing cpu_inaccessible()

-- 
2.39.2

