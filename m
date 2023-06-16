Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C05EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 14:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D75D10E63E;
	Fri, 16 Jun 2023 14:14:07 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126BE10E63E
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 14:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686924845; x=1718460845;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mLL3yg9r5rD5j8vALKOweM7yctNmkwOtXCv1zXhGDc4=;
 b=a/3glEKy1tiH+iO3qVwQK+hcvr73PMfydHRr+fjV8JwKIxITLVL1PIvz
 aD6KXqE84d62zhMMlh7SsZPWcdACVxG23Z+zroZppc3ZExhrYhYVFbv4o
 tgmye1fYZJkWni13DIdmSvVP/090btI8dlQcK2Jwy3xNdGu07cP925zDm
 GdHbfo80hrUMaVUs7DRIiYiX/WED082s2wGcI8CXivaDVQYp+zADa8KuC
 CPAuw6K0IN5Iuv0wIKeG+tCKLRsEZ7pG9/CgmGk4e+f6nldksmbjmuhlN
 S/7U5eBTneCnFFRL3+0WmuUnoIVgsJsRbq7ecuM/A9d/decEf29nQOW5l A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="422872880"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="422872880"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 07:13:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="707113157"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="707113157"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 07:13:08 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 16 Jun 2023 19:41:13 +0530
Message-Id: <20230616141115.1128000-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Xe runtime pm fixes
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
Cc: sujaritha.sundaresan@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series adds xe runtime PM fixes.

Anshuman Gupta (2):
  drm/xe/pm: Wrap pm_runtime_suspended with power.lock
  drm/xe/pm: Fix PM runtime_idle callback

 drivers/gpu/drm/xe/xe_pci.c |  5 ++++-
 drivers/gpu/drm/xe/xe_pm.c  | 19 +++++++++++++++----
 2 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.38.0

