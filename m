Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6925EEB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 13:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8CA10E343;
	Tue, 18 Jul 2023 13:21:57 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E0210E1AC
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 13:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689686511; x=1721222511;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TvV/gbD6shwgMaeE2Ulu9BUhYW8tv8oxnPdd45qIa2U=;
 b=FPGuNBK1AJfv7hk5oRp0v0wWgdaj1tLpj+IkSsy15///l7dBZtPSGdHd
 H+7wCDnojF21mAvOTq85xt9iJ9ZkGycqEnxE2z6BEFElkG60YwjaTG63M
 oBpwoFf3fXpMNNAmZOI67bLLhsZL6migjO7L63qLksITyrCHQUhtFNxxe
 kcNuE+eBzsMkwvj1w9qD5u777th1wYcAL7ugyqmD4icb1tGprLjejM517
 8VhOY4RfRbP4Tuf2lo5sKmSCKsODAD98cZwYB1EgFYAi+yJD8KA95bMvl
 nENknTNlrgUKvVmLYHpbl2ru8hwpj7W7ez6L2ujTOgz0lSjhPtTDYY5xr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="397043508"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="397043508"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 06:21:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="700896620"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="700896620"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga006.jf.intel.com with ESMTP; 18 Jul 2023 06:21:45 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jul 2023 18:56:44 +0530
Message-Id: <20230718132646.3079349-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/2] Notify userspace about uevent failure
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
  drm/xe: Notify Userspace when engine reset fails
  drm/xe: Introduce fault injection for gt reset

 drivers/gpu/drm/xe/xe_debugfs.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_gt.c      | 26 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt.h      | 14 ++++++++++++++
 include/uapi/drm/xe_drm.h       |  8 ++++++++
 4 files changed, 57 insertions(+), 1 deletion(-)

-- 
2.25.1

