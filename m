Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09CCC001DF
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 07:34:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1C910E58F;
	Fri, 20 Oct 2023 07:34:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075EB10E58D
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 07:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697787277; x=1729323277;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=cZGfNIASQfi0MyxYQ12jCkrSDtT5jcn5R/9/WlfkeO4=;
 b=gpJJN0aooYdLtdojVAcsMB5hXsrqavm1qFf4NvvAw0O+xAffjXIKpIMs
 5AfZRjJqf71OBSZBqtZOFNmwhqoS+goc5rCFAa4rkrxH47li4kMviaEq2
 N38ETOLPsAuRV/7fTNOt5hMpiUKPn1LcVCtGYgWy4/jVt+j3N4Ozyo82P
 lPo89dsKxBJH2kUJwEPTJViDFal1Xk2dkL9coUsC4fRKiXXbjvaa7eoo3
 rxQ+8rwXMJgBq9LC/IVVDLmR0Z9hn7GjLONpnKn1xumlfOqJRFLvy+vuD
 1BGLJfumgmPscSj8+w03NfC1RQH/TaaZbvBp0t+UCeUO+F82fmrFNYTEP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="452926704"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="452926704"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 00:34:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="848005963"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="848005963"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 00:34:35 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.0.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3AAD7580E34;
 Fri, 20 Oct 2023 00:34:35 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qtk1g-000QwT-2C;
 Fri, 20 Oct 2023 09:34:32 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 20 Oct 2023 09:32:13 +0200
Message-ID: <20231020073430.103493-1-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Fix two issues pointed by LKP
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

LKP reported two issues on Xe driver:

1. the Kconfig dependencies are wrong for non-X86 archs;
2. xe_display_misc has a non-static function without a prototype,
   which isn't used anywhere.

Address both issues to close https://lore.kernel.org/oe-kbuild-all/202310201234.ZZLwdoiy-lkp@intel.com/

Mauro Carvalho Chehab (2):
  misc: mei: fix Kconfig dependencies
  drm: xe: xe_display_misc: fix build with W=1

 drivers/gpu/drm/xe/display/xe_display_misc.c | 2 +-
 drivers/misc/mei/gsc_proxy/Kconfig           | 1 +
 drivers/misc/mei/hdcp/Kconfig                | 1 +
 drivers/misc/mei/pxp/Kconfig                 | 1 +
 4 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.41.0

