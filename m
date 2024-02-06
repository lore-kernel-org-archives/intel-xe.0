Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DB7C4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 14:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA45E10EDF9;
	Tue,  6 Feb 2024 14:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="vL6xMQyd";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1752210EE24
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 14:18:36 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1707229107; bh=+LfRZ1fdZPdie+7J8QmWjHzPeYRcwY0Mnbv+wErxfjk=;
 h=From:To:Cc:Subject:Date:From;
 b=vL6xMQydvZjA/3qwLfNRRf6Jk/yr90ZlGsErh1cR+1XFIweHjNNK8WIkRq9EbnB4l
 4sw5cM3hlkBKgWYjo74DrWyGphU1tgEkMBUd6whePTr2V1MPylWKlfsulA43R7Zphq
 XNAM61Sfx8PxPNHdwIqAAz9PCtkE/kEtMLUt1phKus4gukuZh3MjanKtsp9zc+JSCW
 CI2FyEBZAXFldxsrKa7Hp1rfoVDayc8AkvRRtcVIe/WORIx4hjIFm7f0/kiIQUYa7c
 scKfQ9zfcwAvh+PSrn/hMqF/JkRtczXtl1IzH8DLOekNk2UwJdPe4HDyy2fpw5KTNJ
 92AB8KEOVt/2Q==
Received: from mhaimovski-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by mhaimovski-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 416EIMLf265002
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 6 Feb 2024 16:18:22 +0200
Received: (from mhaimovski@localhost)
 by mhaimovski-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 416EIMsL265001; 
 Tue, 6 Feb 2024 16:18:22 +0200
From: Moti Haimovski <mhaimovski@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: mhaimovski@habana.ai, lucas.demarchi@intel.com, matthew.brost@intel.com
Subject: [PATCH 0/2] drm/xe: support VM sharing between apps
Date: Tue,  6 Feb 2024 16:18:18 +0200
Message-Id: <20240206141820.264977-1-mhaimovski@habana.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This first patch set introduces support for sharing a VM (or context) between
applications that use different resources on the same Xe device.

The first patch adds a refcount to the VM in order support managing it by
multiple users/apps.

The second patch exports the VM as a FD in order to allow other apps to use it.

Follow-up series will include the driver code to provide full functionality for
this feature.

Bharat Jauhari (1):
  drm/xe: support to export VM as fd

Moti Haimovski (1):
  drm/xe: add ref count to xe_file

 drivers/gpu/drm/xe/xe_device.c       |  52 ++++++++++--
 drivers/gpu/drm/xe/xe_device.h       |   6 ++
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_vm.c           | 121 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h           |   2 +
 drivers/gpu/drm/xe/xe_vm_types.h     |  28 +++++++
 include/uapi/drm/xe_drm.h            |  27 ++++++
 7 files changed, 232 insertions(+), 7 deletions(-)

-- 
2.34.1

