Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F9CEE49B2
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 11:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1034110E410;
	Wed, 23 Aug 2023 11:40:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B7410E410
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692790847; x=1724326847;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z1S1fkb9ynGn+zWXp+spZlt3jog9udD8hfID4RbBsh4=;
 b=Hp3Ts313vTJMbuPE6eI91eh+Bujk5c5xgPZnx03x41/DBV1qS7Jhopii
 DtH3/lszE6jXAJEOqH8EzbntmuBIgy9KYMAS0NjXWvUpp74XNEJmV0KCU
 l3gHvW2uYiOvFzUGmUhutz7+NAsujednbgDdhZNKs+Qvkw/GOrwER6N1q
 nw8rCGNEQeQjhixBFdl3jiWNbmit73F1dZfyHESoDoeOkN0vDsAeMfVWS
 Cp/FvVYyhSZ+Mz73N++wzE/7FqVsnH5OoZpRDDjMMGb8qKEP7e1J9AQ4k
 DD9MF79+bUyhmBdaxkO0V6V0Ff1IAPqL8PBHwqxNb+awkYDDNUrAly1k1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="460506107"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="460506107"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 04:40:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="910481337"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="910481337"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 04:40:44 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 23 Aug 2023 04:40:37 -0700
Message-Id: <20230823114040.31769-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/3] drm/xe/pvc: Add Wa_16017236439
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
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add workaround 16017236439 on PVC which makes even copy engine instances
to use 64B transfers instead of 256B, hence making it bit slower than
odd copy engine instances.
Update migrate engine to use the faster odd copy engine instances along
with the reserved copy engine for a better throughput.

v2: Blacklist BCS_SWCTRL register
v3: Use lrc_was[] and OOB WA,
    update migration engine logical mask selection

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  drm/xe/pvc: Blacklist BCS_SWCTRL register
  drm/xe/pvc: Force even num engines to use 64B
  drm/xe/pvc: Use fast copy engines as migrate engine on PVC

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  3 ++
 drivers/gpu/drm/xe/xe_migrate.c          | 39 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_reg_whitelist.c    |  6 ++++
 drivers/gpu/drm/xe/xe_wa.c               | 10 ++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
 5 files changed, 56 insertions(+), 3 deletions(-)

-- 
2.21.0.rc0.32.g243a4c7e27

