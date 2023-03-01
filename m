Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1049C6FA9D
	for <intel-xe@archiver.kernel.org>; Wed,  1 Mar 2023 14:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF60710E18B;
	Wed,  1 Mar 2023 14:50:15 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7798010E18B
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Mar 2023 14:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677682213; x=1709218213;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xxpkBuOYaztl79mCDFBcu1PxqlYy9VgS+aPTKRgrvW4=;
 b=Bv4v538giRHA2sKQAKJSTJW3BZIZ1ZzGU3TKghh0FzbF7KVPyeBCMLGc
 +t4ALU9rBSx5kGuAHB7TnF3Cutn1C+Vp5dwifrjenEO+wKtJsDPxfCali
 Ek5nXlwJffa1njw5p2P293iZR6BWvmppqi6ZyWBKciW8ygiVP/Wh2tLDV
 klK4uEKbkq9tkOl9xNR87ngnsdwefQ1qD0TMwkx1x2H76bQhEIhe6f61C
 DooHuu2p5u1TPZynouDBdaUjVj7C2Z/vqQLX2X4bPQjEQZUyMsRohxIYU
 RtawMvQMydx1J4e4wAqw5laVVZyk4GVLrrVxabqaujLVSopVT51DvHvLi Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="331904495"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="331904495"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 06:50:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="817590525"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="817590525"
Received: from shedley-mobl3.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.10.182])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 06:50:12 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Mar 2023 14:48:09 +0000
Message-Id: <20230301144815.248239-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] Some small-bar prep patches
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

-- 
2.39.2

