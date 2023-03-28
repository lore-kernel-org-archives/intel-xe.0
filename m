Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CF1C77B6D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 19:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04E910E4AE;
	Tue, 28 Mar 2023 19:58:27 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282BF10E491
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 19:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680033504; x=1711569504;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XijUcJ0siY10F0vnd9qVUA/aQiLVnD9FjGxS5fjXR5k=;
 b=VNooK/6XWFBbhtsq4kF5lhar/9/WmlSm7cAUm8HRC0/ZX3vNRr17D/bJ
 L1D9Lrf4iDrnqKaQgGdyuKqZ13HSZ6pA71Y+As3lw6YBDszJL2rOqHmO4
 TjXgcRtQmiYocWwt312PEvlptEh7OKn3CWfR4QT44j/MjbY8ySxiEsif4
 154M9jJO2SMDB4uYTSEoLgpgkAtUIyNfdvNqqalNF92lQBCluAIt0dEhX
 15dnIINuMyF783+C9KBX4cq51bczt2WmyOfFsMkBJ3z6MD1Qu9PhSXqKd
 f5ok9HEb71gTffvPhJYzvX0Ybvk5Gl9WY9GLwgEDsD2S6fM8aN/4Nmv14 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="343087486"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="343087486"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 12:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="827609931"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="827609931"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 12:58:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 28 Mar 2023 12:58:20 -0700
Message-Id: <20230328195822.1941865-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Extra debug for driver load issue
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

Should help debug:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/232

Matthew Brost (2):
  drm/xe: Better error messages for xe_gt_record_default_lrcs
  drm/xe: Dump GuC log on xe_gt_record_default_lrcs failure

 drivers/gpu/drm/xe/xe_gt.c | 23 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_uc.c |  7 ++++++-
 2 files changed, 26 insertions(+), 4 deletions(-)

-- 
2.34.1

