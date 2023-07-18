Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBECEB64DA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 11:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377DD10E327;
	Tue, 18 Jul 2023 11:58:28 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C181E10E327
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 11:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689681505; x=1721217505;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xz114nTytwOE7BlVus6ZYYhpFdpcNDjkSIUCj0vlaho=;
 b=GcTZDtM9QDPH8rkIJukIkkCqLyeQM8uRuUKywJ9dFDYcDGg5VnlhU9q6
 q3TREwppo0J3mEH5qzcDEbaSXsbbkxUyBvvO3HllNIqqhODKfsZjIW93K
 BrXN8LXbAsz8w0Zgz/fWlZwTfzfNdAgtWPChlFTxzyLVlKw4nCCIzH+tX
 ibf2YBxIUPrTeWZxR8aambfELpacNbCjpoo0LtvMpF0rJfpHj1ISga4Y9
 3TUGr5djrc9D8hyjPQ8/5mN18tQwhCmmDR3WkCt442Z8Eb/thbr/SGIE0
 GNAuCAU5bkA8tlJoig/TRNSdywOjmESXxr8xqe6oE7K0pzFxll+qM5+WO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="397024731"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="397024731"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 04:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="847672283"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="847672283"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 18 Jul 2023 04:58:22 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jul 2023 17:33:20 +0530
Message-Id: <20230718120322.2992075-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/2] Notify userspace about uevent failure
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

