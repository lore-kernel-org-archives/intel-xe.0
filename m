Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6124C001DE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 12:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FB210E3C7;
	Tue, 25 Jul 2023 12:17:55 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F3710E3C7
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 12:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690287474; x=1721823474;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=peSBisXQ+FyWYNUJ+WT0szY52GeNUtE3JkAMUtoGPeA=;
 b=MsBT0CxF4CTB07uQ1sFqhFLZmBdIXhJ2guUqF7VLPhaK0/PKfLuENakI
 y5gMKtDKsrnicvcESX6G1/fD+g+MJNsskZEyW/T+zPEMXq+Ic/AZPT/bY
 d3USoIo5+6tgb56qY28cuYYPI3FBYHrXeVduT3DlJmA1ue0Va28MBCHDd
 IbRuvKZoJf9t5J/JpzQHlSORrNWWy7OX4/3WbEvj5iYGxzAoEtK3kWD1o
 onvW5+JDx9g1v2egHrPKZztOkO+b2AX1zDaHgvDr8eJgKSAemC6YuDdu6
 zy31nNorvCcuWDjyhapuRa3bmQDFe1dlBjV+4NavdUxlSjyfqZJe8m9dw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="370375409"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="370375409"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 05:17:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="726099427"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="726099427"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga002.jf.intel.com with ESMTP; 25 Jul 2023 05:17:49 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 17:52:55 +0530
Message-Id: <20230725122257.3749792-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 0/2] Notify userspace about uevent failure
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

series sends an uevent in case of gt reset failure.
since we have no mechanism to ensure gt reset failure from
hw perspective introducing the fault injection to validate the uevent.

https://gitlab.freedesktop.org/drm/xe/ci/-/commit/5ab4b369758a57b5a799b93c1d5b556c98d9d557
is enabling the config to ensure debugfs creations are succesful.

Tested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Testcase: https://patchwork.freedesktop.org/series/121309/

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com> 

Himal Prasad Ghimiray (2):
  drm/xe: Notify Userspace when gt reset fails
  drm/xe: Introduce fault injection for gt reset

 drivers/gpu/drm/xe/xe_debugfs.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_gt.c      | 25 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt.h      | 14 ++++++++++++++
 include/uapi/drm/xe_drm.h       |  8 ++++++++
 4 files changed, 56 insertions(+), 1 deletion(-)

-- 
2.25.1

