Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DA9EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 08:10:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49B010E577;
	Thu, 20 Jul 2023 08:10:45 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0BD10E034
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689840644; x=1721376644;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XNNfVdA0z/tCyrrInXnjiQrVkvFqRUUwRANm82vWR90=;
 b=YQBydNmeP2blXfbqDL+RkbI1gvad9vM8j89NcID3lgysyg0DQwKU2pR5
 AhLN6h29qfz6vX091aIr/uKtg8a70fcUoIBCMZag8S9p+5hqPYNcnkt2j
 FPsM/QWJg3psHiLh8IFea1urffSDA5CaeAd6wQDmgj472gW8Hu0+VH5LZ
 UWtoi640SQ/lbTbgU6KvhA1kPtzOLXeh5GWelYhM8C1J+uOjROl3hqvQo
 1GTwjI/p9f0zFBFASCQW8L2q/EE1wcQmF4Oyd2Tw+dZNA+Nfx5VaiA1FJ
 mMpskc8qgXuUe441SHBT3Z15PRF9x5THy3Jdc0OjNbr3o3IvZOfICHZlo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="430436354"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="430436354"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 01:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="789700120"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="789700120"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 01:10:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 20 Jul 2023 01:10:36 -0700
Message-Id: <20230720081038.24822-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] drm/xe/pvc: Add Wa_16017236439
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

Add workaround 16017236439 on PVC which makes even copy engine instances
to use 64B transfers instead of 256B, hence making it bit slower than
odd copy engine instances.
Update migrate engine to use the faster odd copy engine instances along
with the reserved copy engine for a better throughput.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (2):
  drm/xe/pvc: Force even num engines to use 64B
  drm/xe/pvc: Use fast copy engines as migrate engine on PVC

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_hw_engine.c        | 31 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h        |  1 +
 drivers/gpu/drm/xe/xe_migrate.c          |  7 +++---
 drivers/gpu/drm/xe/xe_wa.c               |  7 ++++++
 5 files changed, 46 insertions(+), 3 deletions(-)

-- 
2.21.0.rc0.32.g243a4c7e27

