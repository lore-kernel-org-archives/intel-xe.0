Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56017EB64DA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 13:27:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D17610E1AC;
	Tue, 18 Jul 2023 13:27:21 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A333910E1AC
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 13:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689686838; x=1721222838;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LdaPNB8jp/zlPZ4ACoiJpabWOpOhU91MdP2obCX9Cho=;
 b=QZB4+agWMGZa55S/t1DJuIGSZ0NsjjhQYGqUyxHJArH1v+0DltbtWCf+
 /MzHyhTGcxDfFzrCU+xcQcJ6K6GDtw4gdgx0RidP9TMqFx23UeVvWmpoD
 Ys8I4NqQJ19w7BN+rL9VtkuAjsol/hP35/uX4ju/o9FtBtC1T/ohYf3SH
 63J5Ce++ozH+wap9d1qjCNoLUY3dcNVL8SjyWqoh0Fes7uY7qlOE8LgLr
 w72sYBDdLHBHmpSyHTMSUmsZcfVYqswsGOuJR7kWPF1W2QTDHDwhdWRyw
 6NSfIBoVEK1Z8aebvZ7Cc9RZ630kU7DhsgprQ99CeYPDVJmW8PGuvV6kP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="369759773"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="369759773"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 06:27:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="970240488"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="970240488"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga006.fm.intel.com with ESMTP; 18 Jul 2023 06:27:15 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jul 2023 19:02:14 +0530
Message-Id: <20230718133216.3079521-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/2] Notify userspace about uevent failure
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
Testcase: https://patchwork.freedesktop.org/series/120913/

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com> 

Himal Prasad Ghimiray (2):
  drm/xe: Notify Userspace when gt reset fails
  drm/xe: Introduce fault injection for gt reset

 drivers/gpu/drm/xe/xe_debugfs.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_gt.c      | 26 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt.h      | 14 ++++++++++++++
 include/uapi/drm/xe_drm.h       |  8 ++++++++
 4 files changed, 57 insertions(+), 1 deletion(-)

-- 
2.25.1

