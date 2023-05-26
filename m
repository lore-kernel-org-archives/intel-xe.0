Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A15C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 00:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DC910E083;
	Fri, 26 May 2023 00:43:08 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7959710E00F
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 00:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685061787; x=1716597787;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3XfOx7VDD6an4DJJjKjumcKf25WeHdclKXzNAX93dXQ=;
 b=CRtdNRKqxpCdZsOOjCISl0yLQdOMO88sAZAQ9oJXPUy1eEUj0J6FST1U
 3Eebk26Qu8GEMSY6QCLwWio4DViYCJqvCO68l28RePdD4qTCHP69jgG6i
 G5JX1M2x1EZKHEgIjWeDIrmSXHSEsRGvESARGzKdQ/+grBF4IDDFl2l21
 7twsDitZz/gwnGHfH1qrnFgJOxrkHaljSj5xtfkpFYf/F55djGEpLGLvT
 W+briRP5hFiIoM8/i6nl2/k1YU6WFinCT88O8svMg5o7TBiP8z+2WdGaq
 //Mwb0c0tCKypv2xwylKcEdrdDnRRoTMOU8VJa9LHCDM1ybhf9y8P0cUi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="357323121"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="357323121"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 17:43:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="1035155119"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="1035155119"
Received: from xiaofang-mobl2.ccr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.255.36.192])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 17:43:05 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 21:42:33 -0300
Message-Id: <20230526004235.745730-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Replace DRM_ERROR() with pr_err()
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

The former has been deprecated in favor of the latter.

Since we are already touching the includes for xe_reg_sr.c, also sneak
in a fixup patch to remove a duplicated inclusion.

Gustavo Sousa (2):
  fixup! drm/xe/debugfs: Dump register save-restore tables
  drm/xe: Replace DRM_ERROR() with pr_err()

 drivers/gpu/drm/xe/xe_reg_sr.c | 12 ++++++------
 drivers/gpu/drm/xe/xe_vm.c     |  3 ++-
 2 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.40.1

