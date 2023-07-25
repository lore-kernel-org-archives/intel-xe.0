Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92621C04A6A
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 15:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DBC10E0EC;
	Tue, 25 Jul 2023 15:06:17 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75DB10E0EC
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 15:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690297575; x=1721833575;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yG5msS54+Zs47VmHbFmIJABjIw05fFhlGPA5c+YNGMk=;
 b=FytOdGBDm74/7iv6Gp72ZypvD2hTi4yg5MQDFBIZriH7F8wQ9xhrcBHE
 BW/xLjyFh2VMabEox/HDXe2MXN6thVDrCXMzHuV9qlfFTWxh78wK33yyh
 wvFPcv8YrFyNqQmLJbJ0yBTR9T6Ly2z9yWUkHTQ/NvyaGRYx9Of4RjpRO
 OD9kEY2HfQUQVjfMrH3kUFHZ9/vxyfH4rflOoBZ2555q9/Aw10GYmuiqc
 YZUjrZBU1aX3pZpwqhVbeMb6huIx/CNLTPrSilTRKWpp/rIkxYfV3Pi6l
 0s2LM4a9buXkedIpjDHFpOFTIWlfxU+vMMlg3fJ+YfR7GF5ygKjyzHXnX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398668513"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="398668513"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 08:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="676259051"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="676259051"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga003.jf.intel.com with ESMTP; 25 Jul 2023 08:04:42 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 20:39:48 +0530
Message-Id: <20230725150951.3757483-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v7 0/3] Notify userspace about uevent failure
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
  fault-inject: Include linux/types.h by default.

 drivers/gpu/drm/xe/xe_debugfs.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_gt.c      | 25 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt.h      | 14 ++++++++++++++
 include/linux/fault-inject.h    |  3 ++-
 include/uapi/drm/xe_drm.h       |  8 ++++++++
 5 files changed, 58 insertions(+), 2 deletions(-)

-- 
2.25.1

