Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A76CC001DF
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 12:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBA710E3C7;
	Tue, 25 Jul 2023 12:15:19 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6C510E3C4
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 12:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690287316; x=1721823316;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ufR0BfD2LAojIKOwoGovmN82Ier4P9ij2wI9MV+q+q4=;
 b=dFBoOxBZp6aI1GR27SFcND9OupZftXZfPG3TJJZAYaqja0gWew2jfSjp
 YHGabfMoGNapQEJfUwWWNsJSvfUCuJkwbL580OjO+erJlYvUesbf4g7BT
 Rv1i53XtyOvL4NjjshpfI5XT7ZCowxmGaFIfCHbFkCFY2eViIbEy0fTe5
 9Zsc3Y9hNy9S6G12/5njfegcnABw7p8zYuQg2A28Q90BLTWdzlXeN07WK
 Wz6M2vXr/u1PHtV1NmwiJBnuQSLhEqSSrh82FFIYReEhNsVwkW3cQKsxA
 fn2f1UFzpwl0EI1TQYQYKndFmakE1gDP3kL726qXl15KvuTznaPPEyc+E g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="433954261"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="433954261"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 05:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="899916296"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="899916296"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga005.jf.intel.com with ESMTP; 25 Jul 2023 05:15:14 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 17:50:20 +0530
Message-Id: <20230725122022.3749616-1-himal.prasad.ghimiray@intel.com>
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
Testcase: https://patchwork.freedesktop.org/series/120913/

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

