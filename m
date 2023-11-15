Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272F1C47072
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 02:48:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C479E10E38C;
	Wed, 15 Nov 2023 02:48:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E3910E38A
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 02:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700016479; x=1731552479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3DVgWSdVsBHXbcuy2bRVUgLEgksOhWCgVZ6Z3DyPeW4=;
 b=PQNcbDpKwks0zhsQaT56kkK340NIT/KO4TsGxRnLuji5FbG1XGDXBUgw
 JhCkwQQKCmvZFP2hPoCXZDxuA0BQrdrMIiAAElzU8Gxf+bJ9xl5A5cDzC
 iWr4yt4JJx1/WIr9CXHdV22w2zkNjD2NBOdS2NunXnHOneUXDBcAnU2Wj
 PyDze5eIE/RnopSb0QCPPXJn5fpoinfMg/3mfXn9sXNh8ekUjg5jnzBJO
 qYqPuchO97+cNg0zLIOPZVEvsFXOFWoz1TnKaublogJihhQdHmFVzocS+
 Aw6doCla5N1LbWbZhcvTakAs2aL2VzEu4Cj9XUtLC3XvjcNtQJdhpf+X2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="9436048"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="9436048"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 18:47:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="835264750"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="835264750"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmsmga004.fm.intel.com with ESMTP; 14 Nov 2023 18:47:41 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 08:31:10 +0530
Message-Id: <20231115030111.770130-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC][PATCH 0/1] Creating a base directory for frequency
 sysfs
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Here we are creating a base "freq" directory to move all of the
exisiting frequency sysfs files into.

The frequency sysfs attributes are also being renamed to follow the
required naming template for devfreq.

Required IGT changes will follow.

Sujaritha Sundaresan (1):
  drm/xe: Moving and renaming existing frequency sysfs attributes

 drivers/gpu/drm/xe/xe_guc_pc.c | 65 ++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 31 deletions(-)

-- 
2.25.1

